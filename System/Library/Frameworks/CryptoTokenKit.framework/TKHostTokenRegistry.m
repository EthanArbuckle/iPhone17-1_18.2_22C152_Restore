@interface TKHostTokenRegistry
+ (id)allowedBundlesFromEntitlements:(id)a3;
+ (id)bundleIdentifierFromAuditToken:(id *)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)resetDB;
- (NSArray)tokenClassIDs;
- (NSArray)tokens;
- (NSDictionary)tokenExtensions;
- (NSMutableArray)externalTransactions;
- (NSMutableDictionary)pendingCreationTokens;
- (NSMutableDictionary)toBeRemovedTokens;
- (NSMutableDictionary)tokensByTokenID;
- (NSUserDefaults)storage;
- (NSXPCListener)listener;
- (TKHostKeychainHandler)keychain;
- (TKHostTokenDriverCache)driverCache;
- (TKHostTokenRegistry)initWithDriverCache:(id)a3 listener:(id)a4 keychain:(id)a5;
- (TKHostTokenRegistryDelegate)delegate;
- (id)beginTransaction:(id)a3;
- (id)createTokenWithTokenID:(id)a3 persistent:(BOOL)a4;
- (id)reloadTokenClassesFromStore;
- (id)tokenWithTokenID:(id)a3;
- (void)commitTransaction;
- (void)dealloc;
- (void)keychainItemsModified:(id)a3;
- (void)loadTokensFromStore:(id)a3;
- (void)markModified;
- (void)notifyTokenReinsertion:(id)a3;
- (void)registerClassIDs:(id)a3;
- (void)removeTokenWithTokenID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setResetDB:(BOOL)a3;
@end

@implementation TKHostTokenRegistry

- (TKHostTokenRegistry)initWithDriverCache:(id)a3 listener:(id)a4 keychain:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)TKHostTokenRegistry;
  v12 = [(TKHostTokenRegistry *)&v27 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_driverCache, a3);
    [(TKHostTokenDriverCache *)v13->_driverCache setRegistry:v13];
    objc_storeStrong((id *)&v13->_keychain, a5);
    v14 = (NSMutableDictionary *)[&__NSDictionary0__struct mutableCopy];
    tokensByTokenID = v13->_tokensByTokenID;
    v13->_tokensByTokenID = v14;

    v16 = (NSMutableDictionary *)[&__NSDictionary0__struct mutableCopy];
    pendingCreationTokens = v13->_pendingCreationTokens;
    v13->_pendingCreationTokens = v16;

    tokenClassIDs = v13->_tokenClassIDs;
    v13->_tokenClassIDs = (NSArray *)&__NSArray0__struct;

    v19 = (NSMutableArray *)[&__NSArray0__struct mutableCopy];
    externalTransactions = v13->_externalTransactions;
    v13->_externalTransactions = v19;

    v21 = (NSMutableArray *)[&__NSArray0__struct mutableCopy];
    keychainItemsDirty = v13->_keychainItemsDirty;
    v13->_keychainItemsDirty = v21;

    uint64_t v23 = +[NSHashTable weakObjectsHashTable];
    clientConnections = v13->_clientConnections;
    v13->_clientConnections = (NSHashTable *)v23;

    objc_storeStrong((id *)&v13->_listener, a4);
    [(NSXPCListener *)v13->_listener setDelegate:v13];
    [(NSXPCListener *)v13->_listener resume];
    v25 = [v9 allowedExtensionClassIDs];
    v13->_resetDB = v25 != 0;
  }
  return v13;
}

+ (id)bundleIdentifierFromAuditToken:(id *)a3
{
  if (&_CPCopyBundleIdentifierAndTeamFromAuditToken)
  {
    long long v4 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)v23[0].val = *(_OWORD *)a3->var0;
    *(_OWORD *)&v23[0].val[4] = v4;
    CPCopyBundleIdentifierAndTeamFromAuditToken();
  }
  v5 = sub_10000663C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000140B0();
  }

  long long v6 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v23[0].val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v23[0].val[4] = v6;
  pid_t v7 = audit_token_to_pid(v23);
  int v8 = proc_pidpath(v7, v23, 0x1000u);
  if (v8 <= 0)
  {
    id v10 = sub_10000663C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100013E20(v7, v10);
    }
    goto LABEL_18;
  }
  id v9 = [objc_alloc((Class)NSString) initWithBytes:v23 length:v8 encoding:4];
  if (!v9)
  {
    id v10 = sub_10000663C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100013E98(v7, v10);
    }
    goto LABEL_18;
  }
  id v10 = v9;
  uint64_t v11 = +[NSURL fileURLWithPath:v9];
  if (!v11)
  {
    v18 = sub_10000663C();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100013F10();
    }

LABEL_18:
    id v16 = 0;
LABEL_19:
    v19 = 0;
    goto LABEL_20;
  }
  v12 = (void *)v11;
  v13 = (void *)_CFBundleCopyBundleURLForExecutableURL();
  if (v13)
  {
    v14 = +[NSBundle bundleWithURL:v13];
    v15 = v14;
    if (v14)
    {
      id v16 = [v14 bundleIdentifier];
      int v17 = 1;
      goto LABEL_29;
    }
    v21 = sub_10000663C();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100014048();
    }
  }
  else
  {
    v15 = sub_10000663C();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100013FE0();
    }
  }
  int v17 = 0;
  id v16 = 0;
LABEL_29:

  if (!v17) {
    goto LABEL_19;
  }
  v22 = sub_10000663C();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    sub_100013F78();
  }

  id v16 = v16;
  v19 = v16;
LABEL_20:

  return v19;
}

+ (id)allowedBundlesFromEntitlements:(id)a3
{
  v3 = [a3 valueForEntitlement:@"com.apple.private.ctk.configuration-allowed-for-bundles"];
  if (!v3)
  {
LABEL_18:
    id v9 = 0;
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v4 = sub_10000663C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100014118();
    }
LABEL_17:

    goto LABEL_18;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v4 = v3;
  v5 = (char *)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    long long v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v10 = sub_10000663C();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            sub_1000140E4();
          }

          goto LABEL_17;
        }
      }
      long long v6 = (char *)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v9 = v4;
LABEL_19:

  return v9;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = v7;
  if (v7)
  {
    [v7 auditToken];
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
  }
  id v9 = +[TKHostTokenRegistry bundleIdentifierFromAuditToken:&v18];
  id v10 = +[TKHostTokenRegistry allowedBundlesFromEntitlements:v8];
  uint64_t v11 = v10;
  if (v9) {
    goto LABEL_5;
  }
  if (v10 && [v10 count])
  {
    id v9 = [v11 objectAtIndexedSubscript:0];
LABEL_5:
    long long v12 = +[TKTokenConfiguration interfaceForProtocol];
    [v8 setExportedInterface:v12];

    long long v13 = [[TKHostTokenRegistryConfigurationProxy alloc] initWithRegistry:self callerBundleID:v9 allowedForBundles:v11];
    [v8 setExportedObject:v13];

    long long v14 = +[TKTokenConfiguration interfaceForChangeProtocol];
    [v8 setRemoteObjectInterface:v14];

    [v8 resume];
    long long v15 = self;
    objc_sync_enter(v15);
    [(NSHashTable *)v15->_clientConnections addObject:v8];
    objc_sync_exit(v15);

    BOOL v16 = 1;
    goto LABEL_12;
  }
  id v9 = sub_10000663C();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
    sub_10001414C(v8, v9);
  }
  BOOL v16 = 0;
LABEL_12:

  return v16;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)TKHostTokenRegistry;
  [(TKHostTokenRegistry *)&v3 dealloc];
}

- (NSArray)tokens
{
  v2 = self;
  objc_sync_enter(v2);
  objc_super v3 = [(NSMutableDictionary *)v2->_tokensByTokenID allKeys];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (id)beginTransaction:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  ++v5->_transactionCounter;
  id v6 = [[TKHostTokenRegistryTransaction alloc] initWithRegistry:v5 name:v4];
  objc_sync_exit(v5);

  return v6;
}

- (NSDictionary)tokenExtensions
{
  v2 = self;
  objc_sync_enter(v2);
  tokenExtensions = v2->_tokenExtensions;
  if (!tokenExtensions)
  {
    id v4 = [(TKHostTokenRegistry *)v2 driverCache];
    uint64_t v5 = [v4 tokenExtensionsWithAttributes:&__NSDictionary0__struct];
    id v6 = v2->_tokenExtensions;
    v2->_tokenExtensions = (NSDictionary *)v5;

    tokenExtensions = v2->_tokenExtensions;
  }
  id v7 = tokenExtensions;
  objc_sync_exit(v2);

  return v7;
}

- (void)markModified
{
  obj = self;
  objc_sync_enter(obj);
  obj->_storageDirty = 1;
  objc_sync_exit(obj);
}

- (void)keychainItemsModified:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (([(NSMutableArray *)v4->_keychainItemsDirty containsObject:v5] & 1) == 0) {
    [(NSMutableArray *)v4->_keychainItemsDirty addObject:v5];
  }
  objc_sync_exit(v4);
}

- (void)commitTransaction
{
  objc_super v3 = self;
  objc_sync_enter(v3);
  uint64_t v4 = v3->_transactionCounter - 1;
  v3->_transactionCounter = v4;
  if (!v4)
  {
    id v5 = [(TKHostTokenRegistry *)v3 storage];
    if (v5)
    {
      BOOL storageDirty = v3->_storageDirty;

      if (storageDirty)
      {
        id v7 = [&__NSDictionary0__struct mutableCopy];
        SEL v28 = a2;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        obj = v3->_tokensByTokenID;
        id v8 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v35 objects:v40 count:16];
        if (v8)
        {
          uint64_t v9 = *(void *)v36;
          do
          {
            for (i = 0; i != v8; i = (char *)i + 1)
            {
              if (*(void *)v36 != v9) {
                objc_enumerationMutation(obj);
              }
              uint64_t v11 = *(void **)(*((void *)&v35 + 1) + 8 * i);
              long long v12 = [(NSMutableDictionary *)v3->_tokensByTokenID objectForKeyedSubscript:v11];
              if (([v12 persistent] & 1) != 0
                || ([v12 keychainItems],
                    long long v13 = objc_claimAutoreleasedReturnValue(),
                    BOOL v14 = [v13 count] == 0,
                    v13,
                    !v14))
              {
                id v34 = 0;
                long long v15 = +[NSKeyedArchiver archivedDataWithRootObject:v12 requiringSecureCoding:1 error:&v34];
                id v16 = v34;
                if (!v15)
                {
                  long long v18 = +[NSAssertionHandler currentHandler];
                  [v18 handleFailureInMethod:v28, v3, @"TKHostTokenRegistry.m", 249, @"Failed to archive data of token %@, error: %@", v12, v16 object file lineNumber description];
                }
                int v17 = [v11 stringRepresentation];
                [v7 setObject:v15 forKeyedSubscript:v17];
              }
            }
            id v8 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v35 objects:v40 count:16];
          }
          while (v8);
        }

        long long v19 = sub_10000663C();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          sub_100014210();
        }

        v20 = [(TKHostTokenRegistry *)v3 storage];
        [v20 setObject:v7 forKey:@"tokens"];

        if (!CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication))
        {
          v21 = sub_10000663C();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            sub_1000141DC();
          }
        }
        v3->_BOOL storageDirty = 0;
      }
    }
    if ([(NSMutableArray *)v3->_keychainItemsDirty count])
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      v22 = v3->_clientConnections;
      id v23 = [(NSHashTable *)v22 countByEnumeratingWithState:&v30 objects:v39 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v31;
        do
        {
          for (j = 0; j != v23; j = (char *)j + 1)
          {
            if (*(void *)v31 != v24) {
              objc_enumerationMutation(v22);
            }
            v26 = [*(id *)(*((void *)&v30 + 1) + 8 * (void)j) remoteObjectProxy];
            [v26 tokenConfigurationChanged:v3->_keychainItemsDirty];
          }
          id v23 = [(NSHashTable *)v22 countByEnumeratingWithState:&v30 objects:v39 count:16];
        }
        while (v23);
      }

      [(NSMutableArray *)v3->_keychainItemsDirty removeAllObjects];
    }
    [(NSMutableDictionary *)v3->_pendingCreationTokens removeAllObjects];
    tokenExtensions = v3->_tokenExtensions;
    v3->_tokenExtensions = 0;
  }
  objc_sync_exit(v3);
}

- (id)tokenWithTokenID:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)v5->_tokensByTokenID objectForKeyedSubscript:v4];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [(NSMutableDictionary *)v5->_pendingCreationTokens objectForKeyedSubscript:v4];
  }
  uint64_t v9 = v8;

  objc_sync_exit(v5);

  return v9;
}

- (void)removeTokenWithTokenID:(id)a3
{
  id v4 = a3;
  id v5 = [(TKHostTokenRegistry *)self beginTransaction:@"removeTokenWithTokenID"];
  id v6 = self;
  objc_sync_enter(v6);
  id v7 = [(NSMutableDictionary *)v6->_tokensByTokenID objectForKeyedSubscript:v4];
  if (v7)
  {
    [(NSMutableDictionary *)v6->_toBeRemovedTokens setObject:v7 forKeyedSubscript:v4];
    [(NSMutableDictionary *)v6->_tokensByTokenID removeObjectForKey:v4];
    [v7 setKeychainItems:&__NSArray0__struct];
    [v7 setRegistry:0];
    objc_sync_exit(v6);

    id v8 = [v7 driver];
    [v8 releaseTokenWithTokenID:v4];

    uint64_t v9 = v6;
    objc_sync_enter(v9);
    [(NSMutableDictionary *)v6->_toBeRemovedTokens removeObjectForKey:v4];
    objc_sync_exit(v9);

    id v10 = sub_10000663C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v13 = 138543362;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Removing token %{public}@ from system", (uint8_t *)&v13, 0xCu);
    }

    uint64_t v11 = [(TKHostTokenRegistry *)v9 delegate];
    [v11 hostTokenRegistry:v9 removedToken:v4];

    id v6 = [v5 markModified];
    [(TKHostTokenRegistry *)v6 commit];
  }
  else
  {
    [v5 commit];
    long long v12 = sub_10000663C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100014244();
    }

    objc_sync_exit(v6);
  }
}

- (void)notifyTokenReinsertion:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [(NSMutableDictionary *)v4->_tokensByTokenID objectForKeyedSubscript:v8];

  if (v5)
  {
    id v6 = [(TKHostTokenRegistry *)v4 delegate];
    [v6 hostTokenRegistry:v4 removedToken:v8];

    id v7 = [(TKHostTokenRegistry *)v4 delegate];
    [v7 hostTokenRegistry:v4 addedToken:v8];
  }
  objc_sync_exit(v4);
}

- (id)createTokenWithTokenID:(id)a3 persistent:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  BOOL v8 = 0;
  BOOL v9 = 0;
  int v10 = 100;
  while (1)
  {
    if (v9) {
      [(TKHostTokenRegistry *)self removeTokenWithTokenID:v7];
    }
    if (v8) {
      +[NSThread sleepForTimeInterval:0.01];
    }
    uint64_t v11 = self;
    objc_sync_enter(v11);
    long long v12 = [(NSMutableDictionary *)self->_toBeRemovedTokens objectForKeyedSubscript:v7];
    BOOL v9 = v12 == 0;

    if (!v12)
    {
      int v13 = [(NSMutableDictionary *)self->_tokensByTokenID objectForKeyedSubscript:v7];

      if (!v13) {
        break;
      }
    }
    BOOL v8 = v12 != 0;
    objc_sync_exit(v11);

    if (!--v10)
    {
      id v14 = +[NSAssertionHandler currentHandler];
      long long v15 = [v7 description];
      [v14 handleFailureInMethod:a2, v11, @"TKHostTokenRegistry.m", 353, @"createTokenWithTokenID failed %@", v15 object file lineNumber description];

      id v16 = 0;
      goto LABEL_16;
    }
  }
  id v16 = [(NSMutableDictionary *)v11->_pendingCreationTokens objectForKeyedSubscript:v7];
  if (v16)
  {
    [(NSMutableDictionary *)v11->_pendingCreationTokens removeObjectForKey:v7];
  }
  else
  {
    id v16 = [[TKHostToken alloc] initWithTokenID:v7 persistent:v4];
    [(TKHostToken *)v16 setRegistry:v11];
  }
  [(NSMutableDictionary *)self->_tokensByTokenID setObject:v16 forKeyedSubscript:v7];
  int v17 = sub_10000663C();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Adding token %{public}@ to system", buf, 0xCu);
  }

  long long v18 = [(TKHostTokenRegistry *)v11 beginTransaction:@"createTokenWithTokenID"];
  long long v19 = [v18 markModified];
  [v19 commit];

  objc_sync_exit(v11);
LABEL_16:

  return v16;
}

- (void)loadTokensFromStore:(id)a3
{
  id v32 = a3;
  objc_super v3 = sub_10000663C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100014324();
  }

  id v4 = objc_alloc((Class)NSUserDefaults);
  id v5 = +[NSString stringWithFormat:@"com.apple.security.%@-db", v32];
  id v6 = (NSUserDefaults *)[v4 initWithSuiteName:v5];
  storage = self->_storage;
  self->_storage = v6;

  if ([(TKHostTokenRegistry *)self resetDB])
  {
    BOOL v8 = sub_10000663C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "cleaning existing registry DB", buf, 2u);
    }

    BOOL v9 = [(TKHostTokenRegistry *)self storage];
    [v9 removeObjectForKey:@"classes"];

    int v10 = [(TKHostTokenRegistry *)self storage];
    [v10 removeObjectForKey:@"tokens"];
  }
  long long v33 = [(TKHostTokenRegistry *)self beginTransaction:@"loadTokensFromStore"];
  uint64_t v11 = [(TKHostTokenRegistry *)self storage];
  long long v12 = [v11 objectForKey:@"tokens"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    long long v12 = &__NSDictionary0__struct;
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v38 objects:v48 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v39;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v39 != v15) {
          objc_enumerationMutation(v13);
        }
        int v17 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v18 = objc_opt_class();
        long long v19 = [v13 objectForKeyedSubscript:v17];
        id v37 = 0;
        v20 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v18 fromData:v19 error:&v37];
        id v21 = v37;

        if (v20)
        {
          [v20 setRegistry:self];
          unsigned int v22 = [v20 persistent];
          id v23 = sub_10000663C();
          uint64_t v24 = v23;
          if (v22)
          {
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
              sub_1000142AC(v42, v20, &v43, v24);
            }

            tokensByTokenID = self->_tokensByTokenID;
            v26 = [v20 tokenID];
            [(NSMutableDictionary *)tokensByTokenID setObject:v20 forKeyedSubscript:v26];
          }
          else
          {
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              objc_super v27 = [v20 tokenID];
              *(_DWORD *)buf = 138543362;
              v45 = v27;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Deleting keychain items from token %{public}@", buf, 0xCu);
            }
            [v20 setKeychainItems:&__NSArray0__struct];
            id v28 = [v33 markModified];
            v26 = [v20 tokenID];
            id v29 = [v33 keychainItemsModified:v26];
          }
        }
        else
        {
          v26 = sub_10000663C();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v45 = v17;
            __int16 v46 = 2114;
            id v47 = v21;
            _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Failed to read data of token %{public}@ - skipping. Error: %{public}@", buf, 0x16u);
          }
        }
      }
      id v14 = [v13 countByEnumeratingWithState:&v38 objects:v48 count:16];
    }
    while (v14);
  }

  long long v30 = [(TKHostTokenRegistry *)self reloadTokenClassesFromStore];
  [(TKHostTokenRegistry *)self registerClassIDs:v30];
  [v33 commit];
  objc_initWeak((id *)buf, self);
  long long v31 = [(TKHostTokenRegistry *)self keychain];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100007C54;
  v35[3] = &unk_100020698;
  objc_copyWeak(&v36, (id *)buf);
  [v31 accessKeychainWithBlock:v35];

  objc_destroyWeak(&v36);
  objc_destroyWeak((id *)buf);
}

- (id)reloadTokenClassesFromStore
{
  v2 = [(TKHostTokenRegistry *)self beginTransaction:@"reloadTokenClassesFromStore"];
  uint64_t v74 = 0;
  v75 = &v74;
  uint64_t v76 = 0x2020000000;
  char v77 = 0;
  objc_super v3 = [(TKHostTokenRegistry *)self storage];
  id v4 = [v3 objectForKey:@"classes"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v4 = &__NSDictionary0__struct;
  }
  id v5 = [&__NSDictionary0__struct mutableCopy];
  id v6 = [v2 tokenExtensions];
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_10000870C;
  v72[3] = &unk_1000206C0;
  id v52 = v5;
  id v73 = v52;
  [v6 enumerateKeysAndObjectsUsingBlock:v72];

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id obj = v4;
  id v51 = [obj countByEnumeratingWithState:&v68 objects:v84 count:16];
  if (v51)
  {
    uint64_t v50 = *(void *)v69;
    *(void *)&long long v7 = 138543618;
    long long v49 = v7;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v69 != v50) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v68 + 1) + 8 * v8);
        int v10 = objc_msgSend(obj, "objectForKeyedSubscript:", v9, v49);
        uint64_t v11 = [v52 objectForKeyedSubscript:v9];
        unsigned __int8 v12 = [v10 isEqual:v11];
        uint64_t v54 = v8;

        if ((v12 & 1) == 0)
        {
          id v13 = [v52 objectForKeyedSubscript:v9];
          BOOL v14 = v13 == 0;

          if (v14)
          {
            id v15 = [&__NSArray0__struct mutableCopy];
            long long v66 = 0u;
            long long v67 = 0u;
            long long v65 = 0u;
            long long v64 = 0u;
            id v16 = self->_tokensByTokenID;
            id v17 = [(NSMutableDictionary *)v16 countByEnumeratingWithState:&v64 objects:v83 count:16];
            if (v17)
            {
              uint64_t v18 = *(void *)v65;
              do
              {
                for (i = 0; i != v17; i = (char *)i + 1)
                {
                  if (*(void *)v65 != v18) {
                    objc_enumerationMutation(v16);
                  }
                  v20 = *(void **)(*((void *)&v64 + 1) + 8 * i);
                  id v21 = [v20 classID];
                  unsigned int v22 = [v21 isEqualToString:v9];

                  if (v22)
                  {
                    id v23 = [(NSMutableDictionary *)self->_tokensByTokenID objectForKeyedSubscript:v20];
                    [v15 addObject:v23];
                  }
                }
                id v17 = [(NSMutableDictionary *)v16 countByEnumeratingWithState:&v64 objects:v83 count:16];
              }
              while (v17);
            }

            uint64_t v24 = sub_10000663C();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              v25 = [v2 tokenExtensions];
              v26 = [v25 objectForKeyedSubscript:v9];
              objc_super v27 = [v26 identifier];
              unsigned int v28 = [v15 count];
              *(_DWORD *)buf = v49;
              v80 = v27;
              __int16 v81 = 1024;
              unsigned int v82 = v28;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Token driver %{public}@ disappeared, deleting its %d tokens", buf, 0x12u);
            }
            long long v62 = 0u;
            long long v63 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            id v29 = v15;
            id v30 = [v29 countByEnumeratingWithState:&v60 objects:v78 count:16];
            if (v30)
            {
              uint64_t v31 = *(void *)v61;
              do
              {
                for (j = 0; j != v30; j = (char *)j + 1)
                {
                  if (*(void *)v61 != v31) {
                    objc_enumerationMutation(v29);
                  }
                  long long v33 = *(void **)(*((void *)&v60 + 1) + 8 * (void)j);
                  [v33 setKeychainItems:&__NSArray0__struct];
                  tokensByTokenID = self->_tokensByTokenID;
                  long long v35 = [v33 tokenID];
                  [(NSMutableDictionary *)tokensByTokenID removeObjectForKey:v35];

                  id v36 = [v2 markModified];
                  id v37 = [v33 tokenID];
                  id v38 = [v2 keychainItemsModified:v37];
                }
                id v30 = [v29 countByEnumeratingWithState:&v60 objects:v78 count:16];
              }
              while (v30);
            }
          }
          *((unsigned char *)v75 + 24) = 1;
        }
        uint64_t v8 = v54 + 1;
      }
      while ((id)(v54 + 1) != v51);
      id v51 = [obj countByEnumeratingWithState:&v68 objects:v84 count:16];
    }
    while (v51);
  }

  id v39 = [&__NSArray0__struct mutableCopy];
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_1000087A0;
  v56[3] = &unk_1000206E8;
  id v40 = obj;
  id v57 = v40;
  id v41 = v39;
  id v58 = v41;
  v59 = &v74;
  [v52 enumerateKeysAndObjectsUsingBlock:v56];
  if (*((unsigned char *)v75 + 24))
  {
    v42 = sub_10000663C();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
      sub_1000143C0((int)[v52 count], buf, v42);
    }

    uint64_t v43 = [v52 allKeys];
    tokenClassIDs = self->_tokenClassIDs;
    self->_tokenClassIDs = v43;

    v45 = [(TKHostTokenRegistry *)self storage];
    [v45 setObject:v52 forKey:@"classes"];
  }
  [v2 commit];
  __int16 v46 = v58;
  id v47 = v41;

  _Block_object_dispose(&v74, 8);

  return v47;
}

- (void)registerClassIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(TKHostTokenRegistry *)self beginTransaction:@"registerClassIDs"];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v6)
  {
    uint64_t v8 = *(void *)v30;
    *(void *)&long long v7 = 138543618;
    long long v26 = v7;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v29 + 1) + 8 * (void)v9);
        uint64_t v11 = [(TKHostTokenRegistry *)self driverCache];
        unsigned __int8 v12 = [v5 tokenExtensions];
        id v13 = [v12 objectForKeyedSubscript:v10];
        BOOL v14 = [v11 hostTokenDriverFromExtension:v13];

        id v28 = 0;
        LODWORD(v12) = [v14 configureWithError:&v28];
        id v15 = v28;
        if (v12)
        {
          id v16 = sub_10000663C();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            id v17 = [v14 extension];
            uint64_t v18 = [v17 identifier];
            *(_DWORD *)buf = 138543362;
            id v34 = v18;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "New token driver %{public}@ successfully configured", buf, 0xCu);
          }
        }
        else
        {
          long long v19 = self;
          objc_sync_enter(v19);
          id v20 = [(NSArray *)self->_tokenClassIDs mutableCopy];
          [v20 removeObject:v10];
          id v21 = (NSArray *)[v20 copy];
          tokenClassIDs = self->_tokenClassIDs;
          self->_tokenClassIDs = v21;

          id v23 = [v5 markModified];
          objc_sync_exit(v19);

          id v16 = sub_10000663C();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            uint64_t v24 = [v14 extension];
            v25 = [v24 identifier];
            *(_DWORD *)buf = v26;
            id v34 = v25;
            __int16 v35 = 2114;
            id v36 = v15;
            _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Configuration of token driver %{public}@ failed: %{public}@", buf, 0x16u);
          }
        }

        uint64_t v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      id v6 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v6);
  }

  [v5 commit];
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (TKHostKeychainHandler)keychain
{
  return self->_keychain;
}

- (TKHostTokenRegistryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TKHostTokenRegistryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TKHostTokenDriverCache)driverCache
{
  return self->_driverCache;
}

- (NSUserDefaults)storage
{
  return self->_storage;
}

- (BOOL)resetDB
{
  return self->_resetDB;
}

- (void)setResetDB:(BOOL)a3
{
  self->_resetDB = a3;
}

- (NSArray)tokenClassIDs
{
  return self->_tokenClassIDs;
}

- (NSMutableArray)externalTransactions
{
  return self->_externalTransactions;
}

- (NSMutableDictionary)pendingCreationTokens
{
  return self->_pendingCreationTokens;
}

- (NSMutableDictionary)tokensByTokenID
{
  return self->_tokensByTokenID;
}

- (NSMutableDictionary)toBeRemovedTokens
{
  return self->_toBeRemovedTokens;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toBeRemovedTokens, 0);
  objc_storeStrong((id *)&self->_tokensByTokenID, 0);
  objc_storeStrong((id *)&self->_pendingCreationTokens, 0);
  objc_storeStrong((id *)&self->_externalTransactions, 0);
  objc_storeStrong((id *)&self->_tokenClassIDs, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_driverCache, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_keychain, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
  objc_storeStrong((id *)&self->_keychainItemsDirty, 0);

  objc_storeStrong((id *)&self->_tokenExtensions, 0);
}

@end