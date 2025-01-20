@interface FBSApplicationDataStore
+ (BOOL)isServerProcess;
+ (id)applicationIdentifiersWithAvailableStores;
+ (id)applicationIdentifiersWithAvailableStoresForBundleID:(id)a3;
+ (id)applicationIdentitiesWithAvailableStores;
+ (id)applicationsWithAvailableStores;
+ (id)storeForApplication:(id)a3;
+ (id)storeForApplicationIdentifier:(id)a3;
+ (id)storeForApplicationIdentity:(id)a3;
+ (void)_doWithClassClient:(id)a3;
+ (void)_setClassClient:(id)a3;
+ (void)setPrefetchedKeys:(id)a3;
+ (void)synchronize;
+ (void)synchronizeWithCompletion:(id)a3;
- (BOOL)migrateToIdentity:(id)a3 error:(id *)a4;
- (BOOL)migrateWithError:(id *)a3;
- (BOOL)needsMigration;
- (FBSApplicationDataStore)init;
- (FBSApplicationIdentifying)applicationIdentifier;
- (LSApplicationIdentity)identity;
- (NSString)bundleID;
- (id)_initWithBundleId:(id)a3 identity:(id)a4 client:(id)a5;
- (id)archivedObjectForKey:(id)a3;
- (id)description;
- (id)deserializeObjectForKey:(id)a3 ofType:(Class)a4;
- (id)objectForKey:(id)a3;
- (id)safeArchivedObjectForKey:(id)a3 ofType:(Class)a4;
- (id)safeObjectForKey:(id)a3 ofType:(Class)a4;
- (void)archivedObjectForKey:(id)a3 withResult:(id)a4;
- (void)dealloc;
- (void)deserializeObjectForKey:(id)a3 ofType:(Class)a4 withResult:(id)a5;
- (void)objectForKey:(id)a3 withResult:(id)a4;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)safeArchivedObjectForKey:(id)a3 ofType:(Class)a4 withResult:(id)a5;
- (void)safeObjectForKey:(id)a3 ofType:(Class)a4 withResult:(id)a5;
- (void)serializeObject:(id)a3 forKey:(id)a4;
- (void)setArchivedObject:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation FBSApplicationDataStore

- (id)safeArchivedObjectForKey:(id)a3 ofType:(Class)a4
{
  v5 = [(FBSApplicationDataStore *)self archivedObjectForKey:a3];
  if (a4)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (id)archivedObjectForKey:(id)a3
{
  id v4 = a3;
  v5 = [(FBSApplicationDataStore *)self safeObjectForKey:v4 ofType:objc_opt_class()];

  v6 = (void *)_FBSCreateUnsafeObjectFromData(v5);

  return v6;
}

- (id)safeObjectForKey:(id)a3 ofType:(Class)a4
{
  v5 = [(FBSApplicationDataStore *)self objectForKey:a3];
  if (a4)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (id)objectForKey:(id)a3
{
  return [(FBSApplicationDataStoreRepositoryClient *)self->_client objectForKey:a3 forApplication:self->_identifier];
}

- (void)removeObjectForKey:(id)a3
{
}

+ (void)synchronize
{
}

- (void)setArchivedObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = (void *)MEMORY[0x19F398F90]();
    id v16 = 0;
    v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:0 error:&v16];
    id v10 = v16;
    if (v10)
    {
      v11 = FBLogAppDataStore();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[FBSApplicationDataStore setArchivedObject:forKey:]();
      }

      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        v12 = [MEMORY[0x1E4F28B00] currentHandler];
        v13 = [NSString stringWithUTF8String:"-[FBSApplicationDataStore setArchivedObject:forKey:]"];
        uint64_t v14 = objc_opt_class();
        v15 = NSStringFromProtocol((Protocol *)&unk_1EED41780);
        [v12 handleFailureInFunction:v13, @"FBSApplicationDataStore.m", 384, @"%@ does not conform to <%@>", v14, v15 file lineNumber description];
      }
    }
  }
  else
  {
    v9 = 0;
  }
  [(FBSApplicationDataStore *)self setObject:v9 forKey:v7];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = (void *)[a4 copy];
  if (v7)
  {
    if (v6)
    {
      DeepCopy = CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v6, 0);

      if (!DeepCopy)
      {
        id v6 = FBLogAppDataStore();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          -[FBSApplicationDataStore setObject:forKey:]();
        }
        goto LABEL_11;
      }
    }
    else
    {
      DeepCopy = 0;
    }
    [(FBSApplicationDataStoreRepositoryClient *)self->_client setObject:DeepCopy forKey:v7 forApplication:self->_identifier withCompletion:0];
    id v6 = DeepCopy;
    goto LABEL_11;
  }
  v9 = FBLogAppDataStore();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[FBSApplicationDataStore setObject:forKey:]((uint64_t)v6, v9);
  }

LABEL_11:
}

+ (void)synchronizeWithCompletion:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__FBSApplicationDataStore_synchronizeWithCompletion___block_invoke;
  v5[3] = &unk_1E58F6140;
  id v6 = v3;
  id v4 = v3;
  +[FBSApplicationDataStore _doWithClassClient:v5];
}

+ (void)_doWithClassClient:(id)a3
{
  id v7 = (void (**)(id, void *))a3;
  id v3 = (id)__classClient;
  id v4 = v3;
  if (!v3)
  {
    v5 = +[FBSApplicationDataStoreClientFactory sharedInstance];
    id v4 = [v5 checkout];
  }
  if (v7) {
    v7[2](v7, v4);
  }
  if (!v3)
  {
    id v6 = +[FBSApplicationDataStoreClientFactory sharedInstance];
    [v6 checkin];
  }
}

void __53__FBSApplicationDataStore_synchronizeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __53__FBSApplicationDataStore_synchronizeWithCompletion___block_invoke_2;
    v4[3] = &unk_1E58F5878;
    id v5 = v3;
    [a2 synchronizeWithCompletion:v4];
  }
  else
  {
    [a2 synchronizeWithCompletion:0];
  }
}

- (FBSApplicationDataStore)init
{
  return 0;
}

- (id)_initWithBundleId:(id)a3 identity:(id)a4 client:(id)a5
{
  v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8 && v9)
  {
    v11 = (void *)MEMORY[0x1E4F223B0];
    v12 = [v9 identityString];
    v8 = [v11 bundleIdentifierForIdentityString:v12 error:0];

    if (!v8)
    {
      v13 = NSString;
      uint64_t v14 = [v9 fbs_mediumDescription];
      v15 = [v13 stringWithFormat:@"no bundleID found for identity %@", v14];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSApplicationDataStore _initWithBundleId:identity:client:]();
      }
      [v15 UTF8String];
      _bs_set_crash_log_message();
    }
    goto LABEL_8;
  }
  if (v8)
  {
LABEL_8:
    v25.receiver = self;
    v25.super_class = (Class)FBSApplicationDataStore;
    id v16 = [(FBSApplicationDataStore *)&v25 init];
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_bundleId, v8);
      objc_storeStrong((id *)&v17->_identity, a4);
      if (v9)
      {
        v18 = [v9 identityString];
      }
      else
      {
        v18 = v8;
      }
      identifier = v17->_identifier;
      v17->_identifier = (NSString *)&v18->isa;

      if (v10)
      {
        objc_storeStrong((id *)&v17->_client, a5);
      }
      else
      {
        v20 = +[FBSApplicationDataStoreClientFactory sharedInstance];
        uint64_t v21 = [v20 checkout];
        client = v17->_client;
        v17->_client = (FBSApplicationDataStoreRepositoryClient *)v21;

        v17->_clientNeedsCheckin = 1;
      }
    }
    self = v17;
    v23 = self;
    goto LABEL_16;
  }
  v8 = FBLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
    -[FBSApplicationDataStore _initWithBundleId:identity:client:](v8);
  }
  v23 = 0;
LABEL_16:

  return v23;
}

- (void)dealloc
{
  if (self->_clientNeedsCheckin)
  {
    id v3 = +[FBSApplicationDataStoreClientFactory sharedInstance];
    [v3 checkin];
  }
  v4.receiver = self;
  v4.super_class = (Class)FBSApplicationDataStore;
  [(FBSApplicationDataStore *)&v4 dealloc];
}

+ (id)storeForApplicationIdentity:(id)a3
{
  id v3 = a3;
  NSClassFromString(&cfstr_Lsapplicationi.isa);
  if (!v3)
  {
    id v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSApplicationDataStore storeForApplicationIdentity:]();
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:LSApplicationIdentityClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSApplicationDataStore storeForApplicationIdentity:]();
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
  }

  id v4 = [[FBSApplicationDataStore alloc] _initWithBundleId:0 identity:v3 client:0];

  return v4;
}

+ (id)storeForApplicationIdentifier:(id)a3
{
  id v4 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v4)
  {
    v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSApplicationDataStore storeForApplicationIdentifier:]();
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSApplicationDataStore storeForApplicationIdentifier:]();
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
  }

  if ([v4 fbs_looksLikeAnIdentityString])
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F223B0]) initWithIdentityString:v4];
    id v6 = [a1 storeForApplicationIdentity:v5];
  }
  else
  {
    id v6 = [a1 storeForApplication:v4];
  }

  return v6;
}

+ (id)storeForApplication:(id)a3
{
  id v3 = a3;
  id v4 = [[FBSApplicationDataStore alloc] _initWithBundleId:v3 identity:0 client:0];

  return v4;
}

+ (id)applicationsWithAvailableStores
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [a1 applicationIdentifiersWithAvailableStores];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 fbs_looksLikeAnIdentityString] == NO) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

+ (id)applicationIdentitiesWithAvailableStores
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [a1 applicationIdentifiersWithAvailableStores];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 fbs_looksLikeAnIdentityString])
        {
          id v10 = (void *)[objc_alloc(MEMORY[0x1E4F223B0]) initWithIdentityString:v9];
          [v3 addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

+ (id)applicationIdentifiersWithAvailableStores
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__5;
  id v9 = __Block_byref_object_dispose__5;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__FBSApplicationDataStore_applicationIdentifiersWithAvailableStores__block_invoke;
  v4[3] = &unk_1E58F6030;
  void v4[4] = &v5;
  +[FBSApplicationDataStore _doWithClassClient:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __68__FBSApplicationDataStore_applicationIdentifiersWithAvailableStores__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 availableDataStores];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return MEMORY[0x1F41817F8](v3, v5);
}

+ (id)applicationIdentifiersWithAvailableStoresForBundleID:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [a1 applicationIdentifiersWithAvailableStores];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (([v11 isEqualToString:v4] & 1) == 0)
        {
          if (![v11 fbs_looksLikeAnIdentityString]) {
            continue;
          }
          long long v12 = [MEMORY[0x1E4F223B0] bundleIdentifierForIdentityString:v11 error:0];
          int v13 = [v12 isEqualToString:v4];

          if (!v13) {
            continue;
          }
        }
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)needsMigration
{
  identity = self->_identity;
  if (identity) {
    return [(LSApplicationIdentity *)identity needsMigration];
  }
  else {
    return 1;
  }
}

- (BOOL)migrateWithError:(id *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (![(FBSApplicationDataStore *)self needsMigration])
  {
    id v8 = 0;
    BOOL v18 = 1;
    if (!a3) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  identity = self->_identity;
  if (identity)
  {
    id v38 = 0;
    uint64_t v6 = [(LSApplicationIdentity *)identity findApplicationRecordFetchingPlaceholder:1 error:&v38];
    id v7 = v38;
    id v8 = v7;
    if (v6)
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      uint64_t v9 = [v6 identities];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        v27 = a3;
        id v12 = 0;
        uint64_t v13 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v35 != v13) {
              objc_enumerationMutation(v9);
            }
            long long v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            uint64_t v16 = [(LSApplicationIdentity *)self->_identity personaType];
            if (v16 == [v15 personaType])
            {
              if (v12)
              {

                uint64_t v17 = [MEMORY[0x1E4F28C58] bs_errorWithDomain:@"FBSApplicationDataStore" code:1 configuration:&__block_literal_global_8];

                id v12 = 0;
                id v8 = (id)v17;
              }
              else
              {
                id v12 = v15;
              }
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v39 count:16];
        }
        while (v11);
        a3 = v27;
      }
      else
      {
        id v12 = 0;
      }
    }
    else
    {
      uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __44__FBSApplicationDataStore_migrateWithError___block_invoke_2;
      v32[3] = &unk_1E58F6078;
      id v33 = v7;
      id v22 = v7;
      [v21 bs_errorWithDomain:@"FBSApplicationDataStore" code:1 configuration:v32];
      id v8 = (id)objc_claimAutoreleasedReturnValue();

      id v12 = 0;
      uint64_t v9 = v33;
    }
    goto LABEL_22;
  }
  bundleId = self->_bundleId;
  id v31 = 0;
  uint64_t v6 = [MEMORY[0x1E4F223B0] identityStringsForApplicationWithBundleIdentifier:bundleId error:&v31];
  id v8 = v31;
  if ([v6 count])
  {
    id v20 = objc_alloc(MEMORY[0x1E4F223B0]);
    uint64_t v9 = [v6 firstObject];
    id v12 = (id)[v20 initWithIdentityString:v9];
LABEL_22:

    goto LABEL_23;
  }
  objc_super v25 = (void *)MEMORY[0x1E4F28C58];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __44__FBSApplicationDataStore_migrateWithError___block_invoke_3;
  v29[3] = &unk_1E58F60A0;
  v29[4] = self;
  id v30 = v8;
  id v26 = v8;
  [v25 bs_errorWithDomain:@"FBSApplicationDataStore" code:1 configuration:v29];
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  id v12 = 0;
LABEL_23:

  if (v8)
  {
    BOOL v18 = 0;
  }
  else
  {
    id v28 = 0;
    BOOL v18 = [(FBSApplicationDataStore *)self migrateToIdentity:v12 error:&v28];
    id v8 = v28;
  }

  if (a3)
  {
    if (v8)
    {
      v23 = FBLogAppDataStore();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[FBSApplicationDataStore migrateWithError:]((uint64_t)self, v8);
      }
    }
LABEL_31:
    id v8 = v8;
    *a3 = v8;
  }
LABEL_32:

  return v18;
}

void __44__FBSApplicationDataStore_migrateWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setFailureDescription:@"Migration failed"];
  [v2 setFailureReason:@"Target identity is ambiguous"];
}

void __44__FBSApplicationDataStore_migrateWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setFailureDescription:@"Migration failed"];
  [v3 setFailureReason:@"No application record found"];
  [v3 setUnderlyingError:*(void *)(a1 + 32)];
}

void __44__FBSApplicationDataStore_migrateWithError___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setFailureDescription:@"Migration failed"];
  [v3 setFailureReason:@"No identities found for bundleID \"%@\"", *(void *)(*(void *)(a1 + 32) + 32)];
  [v3 setUnderlyingError:*(void *)(a1 + 40)];
}

- (BOOL)migrateToIdentity:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  NSClassFromString(&cfstr_Lsapplicationi.isa);
  if (!v6)
  {
    BOOL v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSApplicationDataStore migrateToIdentity:error:]();
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:LSApplicationIdentityClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSApplicationDataStore migrateToIdentity:error:]();
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
  }

  if ([v6 needsMigration])
  {
    id v20 = [NSString stringWithFormat:@"provided identity itself requires migration"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSApplicationDataStore migrateToIdentity:error:]();
    }
    [v20 UTF8String];
    _bs_set_crash_log_message();
  }
  id v7 = (void *)MEMORY[0x1E4F223B0];
  id v8 = [v6 identityString];
  uint64_t v9 = [v7 bundleIdentifierForIdentityString:v8 error:0];

  if (![(NSString *)self->_bundleId isEqualToString:v9])
  {
    uint64_t v21 = [NSString stringWithFormat:@"identity does not match bundleID: %@ vs %@", self->_bundleId, v9];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSApplicationDataStore migrateToIdentity:error:].cold.4();
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
  }
  uint64_t v10 = FBLogAppDataStore();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    objc_super v25 = self;
    _os_log_impl(&dword_19C680000, v10, OS_LOG_TYPE_DEFAULT, "Migrating %{public}@ to latest identity...", buf, 0xCu);
  }

  identifier = self->_identifier;
  client = self->_client;
  uint64_t v13 = [v6 identityString];
  long long v14 = [(FBSApplicationDataStoreRepositoryClient *)client migrateIdentifier:identifier toIdentifier:v13];

  if (v14)
  {
    long long v15 = FBLogAppDataStore();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[FBSApplicationDataStore migrateToIdentity:error:]((uint64_t)self, v14);
    }
  }
  if (a4)
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __51__FBSApplicationDataStore_migrateToIdentity_error___block_invoke;
    v22[3] = &unk_1E58F6078;
    id v23 = v14;
    [v16 bs_errorWithDomain:@"FBSApplicationDataStore" code:1 configuration:v22];
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v14 == 0;
}

void __51__FBSApplicationDataStore_migrateToIdentity_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setFailureDescription:@"Migration failed"];
  [v3 setUnderlyingError:*(void *)(a1 + 32)];
}

- (void)objectForKey:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (objectForKey_withResult__onceToken != -1) {
      dispatch_once(&objectForKey_withResult__onceToken, &__block_literal_global_68);
    }
    id v8 = objectForKey_withResult__queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__FBSApplicationDataStore_objectForKey_withResult___block_invoke_2;
    block[3] = &unk_1E58F51E0;
    id v11 = v7;
    block[4] = self;
    id v10 = v6;
    dispatch_async(v8, block);
  }
}

void __51__FBSApplicationDataStore_objectForKey_withResult___block_invoke()
{
}

void __51__FBSApplicationDataStore_objectForKey_withResult___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  id v2 = [*(id *)(a1 + 32) objectForKey:*(void *)(a1 + 40)];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)safeObjectForKey:(id)a3 ofType:(Class)a4 withResult:(id)a5
{
  id v8 = a5;
  uint64_t v9 = v8;
  if (v8)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __62__FBSApplicationDataStore_safeObjectForKey_ofType_withResult___block_invoke;
    v10[3] = &unk_1E58F60C8;
    id v11 = v8;
    Class v12 = a4;
    [(FBSApplicationDataStore *)self objectForKey:a3 withResult:v10];
  }
}

void __62__FBSApplicationDataStore_safeObjectForKey_ofType_withResult___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  if (*(void *)(a1 + 40))
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v7;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
}

- (id)deserializeObjectForKey:(id)a3 ofType:(Class)a4
{
  id v6 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v6)
  {
    long long v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSApplicationDataStore deserializeObjectForKey:ofType:]();
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSApplicationDataStore deserializeObjectForKey:ofType:]();
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
  }

  if (!a4)
  {
    uint64_t v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"type"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSApplicationDataStore deserializeObjectForKey:ofType:]();
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
  }
  id v7 = (void *)MEMORY[0x19F398F90]();
  id v8 = [(FBSApplicationDataStore *)self safeObjectForKey:v6 ofType:objc_opt_class()];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4FBA8A8] bs_secureObjectFromData:v8 ofClass:a4];
  }
  else
  {
    uint64_t v9 = 0;
  }

  id v10 = v9;
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  return v12;
}

- (void)deserializeObjectForKey:(id)a3 ofType:(Class)a4 withResult:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v8;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v10)
  {
    uint64_t v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSApplicationDataStore deserializeObjectForKey:ofType:withResult:]();
    }
    [v13 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSApplicationDataStore deserializeObjectForKey:ofType:withResult:]();
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
  }

  if (!a4)
  {
    long long v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"type"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSApplicationDataStore deserializeObjectForKey:ofType:withResult:]();
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
  }
  if (!v9)
  {
    uint64_t v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"resultBlock"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSApplicationDataStore deserializeObjectForKey:ofType:withResult:]();
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
  }
  uint64_t v11 = objc_opt_class();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __69__FBSApplicationDataStore_deserializeObjectForKey_ofType_withResult___block_invoke;
  v17[3] = &unk_1E58F60F0;
  id v18 = v9;
  Class v19 = a4;
  id v12 = v9;
  [(FBSApplicationDataStore *)self safeObjectForKey:v10 ofType:v11 withResult:v17];
}

void __69__FBSApplicationDataStore_deserializeObjectForKey_ofType_withResult___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = (void *)MEMORY[0x19F398F90]();
  uint64_t v4 = [MEMORY[0x1E4FBA8A8] bs_secureObjectFromData:v10 ofClass:*(void *)(a1 + 40)];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = v4;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;

  (*(void (**)(uint64_t, id))(v5 + 16))(v5, v9);
}

- (void)serializeObject:(id)a3 forKey:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (!v12)
  {
    id v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"object"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSApplicationDataStore serializeObject:forKey:]();
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
  }
  id v7 = v6;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v7)
  {
    id v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSApplicationDataStore serializeObject:forKey:]();
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSApplicationDataStore serializeObject:forKey:]();
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
  }

  id v8 = [MEMORY[0x1E4FBA8A8] bs_secureDataFromObject:v12];
  [(FBSApplicationDataStore *)self setObject:v8 forKey:v7];
}

- (void)archivedObjectForKey:(id)a3 withResult:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __59__FBSApplicationDataStore_archivedObjectForKey_withResult___block_invoke;
    v9[3] = &unk_1E58F6118;
    id v10 = v6;
    [(FBSApplicationDataStore *)self safeObjectForKey:v7 ofType:v8 withResult:v9];

    id v7 = v10;
  }
  else
  {
    [(FBSApplicationDataStore *)self safeObjectForKey:v7 ofType:v8 withResult:0];
  }
}

uint64_t __59__FBSApplicationDataStore_archivedObjectForKey_withResult___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = _FBSCreateUnsafeObjectFromData(a2);
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    uint64_t v6 = v3;
    uint64_t v4 = (*(uint64_t (**)(void))(v4 + 16))();
    uint64_t v3 = v6;
  }

  return MEMORY[0x1F41817F8](v4, v3);
}

- (void)safeArchivedObjectForKey:(id)a3 ofType:(Class)a4 withResult:(id)a5
{
  id v8 = a5;
  id v9 = v8;
  if (v8)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __70__FBSApplicationDataStore_safeArchivedObjectForKey_ofType_withResult___block_invoke;
    v10[3] = &unk_1E58F60C8;
    id v11 = v8;
    Class v12 = a4;
    [(FBSApplicationDataStore *)self archivedObjectForKey:a3 withResult:v10];
  }
}

void __70__FBSApplicationDataStore_safeArchivedObjectForKey_ofType_withResult___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  if (*(void *)(a1 + 40))
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v7;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
}

- (void)removeAllObjects
{
}

uint64_t __53__FBSApplicationDataStore_synchronizeWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (void)setPrefetchedKeys:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[a3 copy];
  uint64_t v4 = FBLogAppDataStore();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v3;
    _os_log_impl(&dword_19C680000, v4, OS_LOG_TYPE_DEFAULT, "Setting prefetched keys: %@", buf, 0xCu);
  }

  uint64_t v5 = +[FBSApplicationDataStoreClientFactory sharedInstance];
  [v5 setPrefetchedKeys:v3];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__FBSApplicationDataStore_setPrefetchedKeys___block_invoke;
  v8[3] = &unk_1E58F6168;
  id v9 = v3;
  id v6 = v3;
  +[FBSApplicationDataStore _doWithClassClient:v8];
  id v7 = FBLogAppDataStore();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19C680000, v7, OS_LOG_TYPE_DEFAULT, "Finishing prefetching", buf, 2u);
  }
}

uint64_t __45__FBSApplicationDataStore_setPrefetchedKeys___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addPrefetchedKeys:*(void *)(a1 + 32)];
}

+ (BOOL)isServerProcess
{
  return +[FBSApplicationDataStoreClientFactory isServerProcess];
}

+ (void)_setClassClient:(id)a3
{
  id v4 = a3;
  if ((id)__classClient != v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)&__classClient, a3);
    id v4 = v5;
  }
}

- (id)description
{
  id v3 = @"TBD";
  if (!self->_identity) {
    id v3 = @"legacy";
  }
  id v4 = [NSString stringWithFormat:@"%@ (%@)", self->_bundleId, v3];
  id v5 = NSString;
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  id v8 = [v5 stringWithFormat:@"<%@: %p; %@>", v7, self, v4];

  return v8;
}

- (NSString)bundleID
{
  return self->_bundleId;
}

- (LSApplicationIdentity)identity
{
  return self->_identity;
}

- (FBSApplicationIdentifying)applicationIdentifier
{
  return (FBSApplicationIdentifying *)self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_client, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)_initWithBundleId:identity:client:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithBundleId:(os_log_t)log identity:client:.cold.2(os_log_t log)
{
  *(_WORD *)SEL v1 = 0;
  _os_log_fault_impl(&dword_19C680000, log, OS_LOG_TYPE_FAULT, "Initialized FBSApplicationDataStore with nil bundleID", v1, 2u);
}

+ (void)storeForApplicationIdentity:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)storeForApplicationIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)migrateWithError:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  id v2 = [a2 descriptionWithMultilinePrefix:0];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8_0(&dword_19C680000, v3, v4, "Unable to migrate %{public}@: %{public}@", v5, v6, v7, v8, 2u);
}

- (void)migrateToIdentity:error:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)migrateToIdentity:error:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)migrateToIdentity:(uint64_t)a1 error:(void *)a2 .cold.3(uint64_t a1, void *a2)
{
  id v2 = [a2 succinctDescription];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8_0(&dword_19C680000, v3, v4, "Error migrating %{public}@: %{public}@", v5, v6, v7, v8, 2u);
}

- (void)migrateToIdentity:error:.cold.4()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)deserializeObjectForKey:ofType:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)deserializeObjectForKey:ofType:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)deserializeObjectForKey:ofType:withResult:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)deserializeObjectForKey:ofType:withResult:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)deserializeObjectForKey:ofType:withResult:.cold.3()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)serializeObject:forKey:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)serializeObject:forKey:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setObject:(uint64_t)a1 forKey:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_8_1();
  _os_log_error_impl(&dword_19C680000, a2, OS_LOG_TYPE_ERROR, "ERROR: unable to store value of class \"%{public}@\" for nil key", v5, 0xCu);
}

- (void)setObject:forKey:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_8_1();
  _os_log_error_impl(&dword_19C680000, v0, OS_LOG_TYPE_ERROR, "ERROR: value provided for key \"%{public}@\" is not a valid property list", v1, 0xCu);
}

- (void)setArchivedObject:forKey:.cold.1()
{
  objc_opt_class();
  OUTLINED_FUNCTION_8_1();
  id v1 = v0;
  OUTLINED_FUNCTION_8_0(&dword_19C680000, v2, v3, "Error during encoding of %{public}@: %{public}@", v4, v5, v6, v7, v8);
}

@end