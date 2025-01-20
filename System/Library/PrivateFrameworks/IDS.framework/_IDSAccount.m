@interface _IDSAccount
- (BOOL)_isEnabled;
- (BOOL)_isInvisibleAlias:(id)a3;
- (BOOL)_isMagnoliaService;
- (BOOL)_isRemoteWidgetService;
- (BOOL)_isThumperService;
- (BOOL)_isiCloudPairingService;
- (BOOL)canSend;
- (BOOL)isActive;
- (BOOL)isFirstGDRAllowlistedAccount;
- (BOOL)isInTransientRegistrationState;
- (BOOL)isTemporary;
- (BOOL)isTransientAllowlistedAccount;
- (BOOL)isUsableForOuterMessaging;
- (BOOL)isUserDisabled;
- (NSArray)accountRegisteredURIs;
- (NSArray)aliasStrings;
- (NSArray)aliases;
- (NSArray)aliasesToRegister;
- (NSArray)connectedDevices;
- (NSArray)devices;
- (NSArray)handles;
- (NSArray)nearbyDevices;
- (NSArray)pseudonyms;
- (NSArray)registeredURIs;
- (NSArray)suppressedDevices;
- (NSArray)vettedAliases;
- (NSData)pushToken;
- (NSData)registrationCertificate;
- (NSDate)dateRegistered;
- (NSDate)lastGDRDate;
- (NSDate)nextRegistrationDate;
- (NSDictionary)accountInfo;
- (NSDictionary)profileInfo;
- (NSDictionary)pseudonymURIMap;
- (NSDictionary)regionServerContext;
- (NSDictionary)registrationAlertInfo;
- (NSString)description;
- (NSString)displayName;
- (NSString)loginID;
- (NSString)primaryServiceName;
- (NSString)profileID;
- (NSString)pushTopic;
- (NSString)regionBasePhoneNumber;
- (NSString)regionID;
- (NSString)serviceName;
- (NSString)uniqueID;
- (NSString)userUniqueIdentifier;
- (_IDSAccount)initWithDictionary:(id)a3 uniqueID:(id)a4 serviceName:(id)a5 delegateContext:(id)a6;
- (_IDSAccount)initWithLoginID:(id)a3 uniqueID:(id)a4 serviceName:(id)a5 delegateContext:(id)a6;
- (id)_keychainRegistration;
- (id)_objectForKey:(id)a3;
- (id)_registeredURIs;
- (id)registrationInfo;
- (int)accountType;
- (int)profileValidationErrorReason;
- (int)registrationError;
- (int)registrationStatus;
- (int64_t)profileValidationStatus;
- (void)_callCloudConnectedDevicesChanged;
- (void)_callConnectedDevicesChanged;
- (void)_callDelegatesRespondingToSelector:(SEL)a3 withPreCallbacksBlock:(id)a4 callbackBlock:(id)a5 postCallbacksBlock:(id)a6;
- (void)_callDelegatesRespondingToSelector:(SEL)a3 withPreCallbacksBlock:(id)a4 callbackBlock:(id)a5 postCallbacksBlock:(id)a6 group:(id)a7;
- (void)_callDelegatesWithBlock:(id)a3;
- (void)_callDelegatesWithBlock:(id)a3 group:(id)a4;
- (void)_callDevicesChanged;
- (void)_callNearbyDevicesChanged;
- (void)_callRegistrationDelegatesWithBlock:(id)a3;
- (void)_connect;
- (void)_loadCachedDevices;
- (void)_reloadCachedDevices;
- (void)_reregisterAndReidentify:(BOOL)a3;
- (void)_setIsEnabled:(BOOL)a3;
- (void)_setObject:(id)a3 forKey:(id)a4;
- (void)_updateDependentDevicesWithDevicesInfo:(id)a3;
- (void)account:(id)a3 aliasesChanged:(id)a4;
- (void)account:(id)a3 dependentDevicesUpdated:(id)a4;
- (void)account:(id)a3 dependentDevicesUpdatedUponReconnect:(id)a4;
- (void)account:(id)a3 displayNameChanged:(id)a4;
- (void)account:(id)a3 localDeviceAdded:(id)a4;
- (void)account:(id)a3 localDeviceRemoved:(id)a4;
- (void)account:(id)a3 loginChanged:(id)a4;
- (void)account:(id)a3 profileChanged:(id)a4;
- (void)account:(id)a3 pseudonymsChanged:(id)a4;
- (void)account:(id)a3 registrationStatusInfoChanged:(id)a4;
- (void)account:(id)a3 vettedAliasesChanged:(id)a4;
- (void)addAliases:(id)a3;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)addRegistrationDelegate:(id)a3 queue:(id)a4;
- (void)authenticateAccount;
- (void)deactivateAndPurgeIdentify;
- (void)dealloc;
- (void)forceRemoveAccount;
- (void)passwordUpdated;
- (void)refreshRegistrationForAccount:(id)a3;
- (void)registerAccount;
- (void)removeAliases:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)removeRegistrationDelegate:(id)a3;
- (void)setAccountInfo:(id)a3;
- (void)setAuthToken:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setLoginID:(id)a3;
- (void)setPassword:(id)a3;
- (void)setRegionBasePhoneNumber:(id)a3;
- (void)setRegionID:(id)a3;
- (void)unregisterAccount;
- (void)unvalidateAliases:(id)a3;
- (void)updateAccountWithAccountInfo:(id)a3;
- (void)updateAuthorizationCredentials:(id)a3 token:(id)a4;
- (void)validateAliases:(id)a3;
- (void)validateProfile;
@end

@implementation _IDSAccount

- (_IDSAccount)initWithDictionary:(id)a3 uniqueID:(id)a4 serviceName:(id)a5 delegateContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = +[IDSInternalQueueController sharedInstance];
  int v15 = [v14 assertQueueIsCurrent];

  if (v15)
  {
    v16 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_191A37848();
    }
  }
  v17 = [(_IDSAccount *)self init];
  if (!v17) {
    goto LABEL_23;
  }
  if (![v12 length])
  {
    uint64_t v18 = [v10 objectForKey:*MEMORY[0x1E4F6B7E0]];

    id v12 = (id)v18;
  }
  if (![v12 length])
  {
    v21 = +[IDSLogging Accounts];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_191A3778C(v21);
    }
    goto LABEL_16;
  }
  uint64_t v19 = *MEMORY[0x1E4F6B700];
  v20 = [v10 objectForKey:*MEMORY[0x1E4F6B700]];
  if (!v20)
  {
    v21 = [NSNumber numberWithInt:1];
    v25 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v39[0] = 0;
      _os_log_impl(&dword_19190B000, v25, OS_LOG_TYPE_INFO, "No account type specified, setting to Apple ID", (uint8_t *)v39, 2u);
    }

    goto LABEL_20;
  }
  v21 = v20;
  int v22 = [v20 intValue];
  if (IDSIsValidAccountType())
  {
LABEL_20:
    p_uniqueID = (void **)&v17->_uniqueID;
    objc_storeStrong((id *)&v17->_uniqueID, a4);
    objc_storeStrong((id *)&v17->_service, v12);
    if (!v17->_uniqueID)
    {
      uint64_t v27 = [NSString stringGUID];
      v28 = *p_uniqueID;
      *p_uniqueID = (void *)v27;
    }
    v29 = (NSDictionary *)[v10 mutableCopy];
    [(NSDictionary *)v29 setObject:v21 forKey:v19];
    [(NSDictionary *)v29 setObject:v17->_service forKey:*MEMORY[0x1E4F6B7E0]];
    accountConfig = v17->_accountConfig;
    v17->_accountConfig = v29;
    v31 = v29;

    uint64_t v32 = [MEMORY[0x1E4F59E30] weakRefWithObject:v13];
    id delegateContext = v17->_delegateContext;
    v17->_id delegateContext = (id)v32;

    uint64_t v34 = [NSString copyStringGUIDForObject:v17];
    serviceToken = v17->_serviceToken;
    v17->_serviceToken = (NSString *)v34;

    v36 = +[IDSDaemonController sharedInstance];

    v37 = [v36 listener];
    [v37 addHandler:v17];

    [(_IDSAccount *)v17 _connect];
    [(_IDSAccount *)v17 _loadCachedDevices];

LABEL_23:
    v24 = v17;
    goto LABEL_24;
  }
  v23 = +[IDSLogging Accounts];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    sub_191A377D0(v22, v23);
  }

  IMLogBacktrace();
LABEL_16:

  v24 = 0;
LABEL_24:

  return v24;
}

- (_IDSAccount)initWithLoginID:(id)a3 uniqueID:(id)a4 serviceName:(id)a5 delegateContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = +[IDSInternalQueueController sharedInstance];
  int v15 = [v14 assertQueueIsCurrent];

  if (v15)
  {
    v16 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_191A378E0();
    }
  }
  v17 = [(_IDSAccount *)self init];
  if (!v17) {
    goto LABEL_8;
  }
  if ([v12 length])
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v18 setObject:v10 forKey:*MEMORY[0x1E4F6B758]];
    uint64_t v19 = [NSNumber numberWithInt:1];
    [v18 setObject:v19 forKey:*MEMORY[0x1E4F6B700]];

    objc_storeStrong((id *)&v17->_uniqueID, a4);
    objc_storeStrong((id *)&v17->_service, a5);
    uint64_t v20 = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v18];
    accountConfig = v17->_accountConfig;
    v17->_accountConfig = (NSDictionary *)v20;

    uint64_t v22 = [NSString copyStringGUIDForObject:v17];
    serviceToken = v17->_serviceToken;
    v17->_serviceToken = (NSString *)v22;

    uint64_t v24 = [MEMORY[0x1E4F59E30] weakRefWithObject:v13];
    id delegateContext = v17->_delegateContext;
    v17->_id delegateContext = (id)v24;

    v26 = +[IDSDaemonController sharedInstance];
    uint64_t v27 = [v26 listener];
    [v27 addHandler:v17];

    [(_IDSAccount *)v17 _connect];
LABEL_8:
    v28 = v17;
    goto LABEL_12;
  }
  v29 = +[IDSLogging Accounts];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
    sub_191A3778C(v29);
  }

  v28 = 0;
LABEL_12:

  return v28;
}

- (void)dealloc
{
  v3 = +[IDSDaemonController sharedInstance];
  [v3 removeListenerID:self->_serviceToken];

  v4 = +[IDSDaemonController sharedInstance];
  v5 = [v4 listener];
  [v5 removeHandler:self];

  v6.receiver = self;
  v6.super_class = (Class)_IDSAccount;
  [(_IDSAccount *)&v6 dealloc];
}

- (BOOL)_isiCloudPairingService
{
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A37978();
    }
  }
  return [(NSString *)self->_service isEqualToIgnoringCase:@"com.apple.private.alloy.icloudpairing"];
}

- (BOOL)_isThumperService
{
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A37A10();
    }
  }
  return [(NSString *)self->_service isEqualToIgnoringCase:@"com.apple.private.alloy.thumper.keys"];
}

- (BOOL)_isMagnoliaService
{
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A37AA8();
    }
  }
  return [(NSString *)self->_service isEqualToIgnoringCase:@"com.apple.private.alloy.ct.commcenter.sim.cloud"];
}

- (BOOL)_isRemoteWidgetService
{
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A37B40();
    }
  }
  return [(NSString *)self->_service isEqualToIgnoringCase:@"com.apple.private.alloy.widgets"];
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A37BD8();
    }
  }
  if (v6)
  {
    if (v7)
    {
      id v11 = [(NSMapTable *)self->_delegateToInfo objectForKey:v6];

      if (!v11)
      {
        if (!self->_delegateToInfo)
        {
          id v12 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
          delegateToInfo = self->_delegateToInfo;
          self->_delegateToInfo = v12;
        }
        id v14 = objc_alloc_init(MEMORY[0x1E4F6B420]);
        [v14 setQueue:v7];
        [(NSMapTable *)self->_delegateToInfo setObject:v14 forKey:v6];
      }
    }
  }
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v7 = v4;
    [(NSMapTable *)self->_delegateToInfo removeObjectForKey:v4];
    id v4 = [(NSMapTable *)self->_delegateToInfo count];
    id v5 = v7;
    if (!v4)
    {
      delegateToInfo = self->_delegateToInfo;
      self->_delegateToInfo = 0;

      id v5 = v7;
    }
  }

  MEMORY[0x1F41817F8](v4, v5);
}

- (void)_callDelegatesWithBlock:(id)a3
{
}

- (void)_callDelegatesWithBlock:(id)a3 group:(id)a4
{
}

- (void)_callDelegatesRespondingToSelector:(SEL)a3 withPreCallbacksBlock:(id)a4 callbackBlock:(id)a5 postCallbacksBlock:(id)a6
{
}

- (void)_callDelegatesRespondingToSelector:(SEL)a3 withPreCallbacksBlock:(id)a4 callbackBlock:(id)a5 postCallbacksBlock:(id)a6 group:(id)a7
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  v49 = (void (**)(id, uint64_t))a4;
  id v12 = a5;
  v48 = (void (**)(id, uint64_t))a6;
  id v13 = a7;
  id v14 = v13;
  v50 = (void (**)(void, void))v12;
  if (v12)
  {
    group = v13;
    int v15 = +[IDSInternalQueueController sharedInstance];
    int v16 = [v15 assertQueueIsCurrent];

    if (v16)
    {
      v17 = [MEMORY[0x1E4F6B460] utilities];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_191A37C70();
      }
    }
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    context = (void *)MEMORY[0x192FE0160]();
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    uint64_t v20 = self->_delegateToInfo;
    uint64_t v21 = [(NSMapTable *)v20 countByEnumeratingWithState:&v61 objects:v65 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v62 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v61 + 1) + 8 * i);
          uint64_t v26 = [(NSMapTable *)self->_delegateToInfo objectForKey:v25];
          uint64_t v27 = (void *)v26;
          if (v25) {
            BOOL v28 = v26 == 0;
          }
          else {
            BOOL v28 = 1;
          }
          if (!v28 && (!a3 || (objc_opt_respondsToSelector() & 1) != 0))
          {
            [v18 addObject:v25];
            [v19 addObject:v27];
          }
        }
        uint64_t v22 = [(NSMapTable *)v20 countByEnumeratingWithState:&v61 objects:v65 count:16];
      }
      while (v22);
    }

    id v14 = group;
    if ([v18 count])
    {
      char v29 = 1;
      do
      {
        v30 = (void *)MEMORY[0x192FE0160]();
        v31 = [v18 objectAtIndex:0];
        uint64_t v32 = [v19 objectAtIndex:0];
        [v18 removeObjectAtIndex:0];
        [v19 removeObjectAtIndex:0];
        uint64_t v33 = [v18 count];
        uint64_t v34 = [v32 queue];
        if (v14) {
          dispatch_group_enter(v14);
        }
        v35 = +[IDSInternalQueueController sharedInstance];
        v36 = [v35 queue];

        if (v34 == v36)
        {
          if (a3)
          {
            id v14 = group;
            if (v49 != 0 && (v29 & 1) != 0) {
              v49[2](v49, 1);
            }
            ((void (**)(void, void *))v50)[2](v50, v31);
            if (v48 && !v33) {
              v48[2](v48, 1);
            }
          }
          else
          {
            ((void (**)(void, void *))v50)[2](v50, v31);
            id v14 = group;
          }
          id v43 = self;
          id v44 = self;
          if (!v14) {
            goto LABEL_42;
          }
        }
        else if (v34)
        {
          v52[0] = MEMORY[0x1E4F143A8];
          v52[1] = 3221225472;
          v52[2] = sub_1919A636C;
          v52[3] = &unk_1E572B330;
          SEL v58 = a3;
          char v59 = v29 & 1;
          v55 = v49;
          v56 = v50;
          id v53 = v31;
          BOOL v60 = v33 == 0;
          v57 = v48;
          id v54 = v32;
          v37 = (void *)MEMORY[0x192FE03B0](v52);
          v38 = v37;
          if (v34 == MEMORY[0x1E4F14428]) {
            dispatch_block_t v39 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v37);
          }
          else {
            dispatch_block_t v39 = (dispatch_block_t)[v37 copy];
          }
          v42 = v39;

          id v14 = group;
          if (group) {
            dispatch_group_async(group, v34, v42);
          }
          else {
            dispatch_async(v34, v42);
          }

          if (!group) {
            goto LABEL_42;
          }
        }
        else
        {
          id v40 = self;
          id v41 = self;
          id v14 = group;
          if (!group) {
            goto LABEL_42;
          }
        }
        dispatch_group_leave(v14);
LABEL_42:

        char v29 = 0;
      }
      while ([v18 count]);
    }
    id v45 = self;
    id v46 = self;
  }
}

- (void)addRegistrationDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A37D08();
    }
  }
  if (v6)
  {
    if (v7)
    {
      id v11 = [(NSMapTable *)self->_registrationDelegateToInfo objectForKey:v6];

      if (!v11)
      {
        if (!self->_registrationDelegateToInfo)
        {
          id v12 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
          registrationDelegateToInfo = self->_registrationDelegateToInfo;
          self->_registrationDelegateToInfo = v12;
        }
        id v14 = objc_alloc_init(MEMORY[0x1E4F6B420]);
        [v14 setQueue:v7];
        [(NSMapTable *)self->_registrationDelegateToInfo setObject:v14 forKey:v6];
      }
    }
  }
}

- (void)removeRegistrationDelegate:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A37DA0();
    }
  }
  if (v4)
  {
    [(NSMapTable *)self->_registrationDelegateToInfo removeObjectForKey:v4];
    if (![(NSMapTable *)self->_registrationDelegateToInfo count])
    {
      registrationDelegateToInfo = self->_registrationDelegateToInfo;
      self->_registrationDelegateToInfo = 0;
    }
  }
}

- (void)_callRegistrationDelegatesWithBlock:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A37E38();
    }
  }
  if (v4)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v8 = self->_registrationDelegateToInfo;
    uint64_t v9 = [(NSMapTable *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          id v14 = [(NSMapTable *)self->_registrationDelegateToInfo objectForKey:v13];
          int v15 = [v14 queue];
          if (v15)
          {
            v17[0] = MEMORY[0x1E4F143A8];
            v17[1] = 3221225472;
            v17[2] = sub_1919A67DC;
            v17[3] = &unk_1E5729880;
            id v16 = v4;
            v17[4] = v13;
            id v18 = v16;
            dispatch_async(v15, v17);
          }
        }
        uint64_t v10 = [(NSMapTable *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }
  }
}

- (id)_objectForKey:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A37ED0();
    }
  }
  v8 = [(NSDictionary *)self->_accountConfig objectForKey:v4];

  return v8;
}

- (void)_setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A37F68();
    }
  }
  if (v6 && v7)
  {
    uint64_t v11 = (void *)[(NSDictionary *)self->_accountConfig mutableCopy];
    [v11 setObject:v6 forKey:v7];
    id v12 = (NSDictionary *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v11];
    accountConfig = self->_accountConfig;
    self->_accountConfig = v12;
  }
}

- (BOOL)isInTransientRegistrationState
{
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A38000();
    }
  }
  return self->_isEnabled
      && [(_IDSAccount *)self accountType] != 2
      && [(_IDSAccount *)self registrationStatus] - 2 < 3;
}

- (BOOL)isTransientAllowlistedAccount
{
  if ([(_IDSAccount *)self _isiCloudPairingService]
    || [(_IDSAccount *)self _isThumperService]
    || [(_IDSAccount *)self _isMagnoliaService]
    || (BOOL v3 = [(_IDSAccount *)self _isRemoteWidgetService]))
  {
    LOBYTE(v3) = [(_IDSAccount *)self isInTransientRegistrationState];
  }
  return v3;
}

- (BOOL)isFirstGDRAllowlistedAccount
{
  if (![(_IDSAccount *)self _isMagnoliaService]) {
    return 0;
  }
  BOOL v3 = [(_IDSAccount *)self _objectForKey:*MEMORY[0x1E4F6B750]];
  BOOL v4 = v3 == 0;

  return v4;
}

- (BOOL)isActive
{
  BOOL v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A38098();
    }
  }
  if (!self->_isEnabled) {
    return 0;
  }
  if ([(_IDSAccount *)self accountType] == 2) {
    return 1;
  }
  return [(_IDSAccount *)self registrationStatus] == 5;
}

- (void)setAccountInfo:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = (NSDictionary *)a3;
  id v6 = +[IDSInternalQueueController sharedInstance];
  int v7 = [v6 assertQueueIsCurrent];

  if (v7)
  {
    v8 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_191A38130();
    }
  }
  if (self->_accountConfig != v5)
  {
    objc_storeStrong((id *)&self->_accountConfig, a3);
    int v9 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412546;
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      uint64_t v13 = self;
      _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_INFO, "New account info %@ for %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (NSDictionary)accountInfo
{
  BOOL v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A381C8();
    }
  }
  accountConfig = self->_accountConfig;

  return accountConfig;
}

- (void)updateAccountWithAccountInfo:(id)a3
{
  id v4 = a3;
  id v6 = +[IDSDaemonController sharedInstance];
  id v5 = [(_IDSAccount *)self uniqueID];
  [v6 updateAccount:v5 withAccountInfo:v4];
}

- (NSDictionary)profileInfo
{
  BOOL v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A38260();
    }
  }
  id v6 = [(_IDSAccount *)self _objectForKey:*MEMORY[0x1E4F6B770]];

  return (NSDictionary *)v6;
}

- (NSDictionary)regionServerContext
{
  v2 = [(_IDSAccount *)self profileInfo];
  BOOL v3 = [v2 objectForKey:*MEMORY[0x1E4F6B780]];

  return (NSDictionary *)v3;
}

- (BOOL)canSend
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A382F8();
    }
  }
  if (![(_IDSAccount *)self isActive]) {
    return 0;
  }
  if ([(_IDSAccount *)self accountType] == 2) {
    return 1;
  }
  [(_IDSAccount *)self handles];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    uint64_t v11 = *MEMORY[0x1E4F6B7D0];
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "URI", (void)v16);
        uint64_t v14 = [v13 unprefixedURI];

        if (v14 && ![v14 isEqualToIgnoringCase:v11])
        {

          BOOL v6 = 1;
          goto LABEL_20;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v6 = 0;
LABEL_20:

  return v6;
}

- (BOOL)isUsableForOuterMessaging
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([(_IDSAccount *)self registrationStatus] != 5) {
    return 0;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v3 = [(_IDSAccount *)self handles];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    uint64_t v7 = *MEMORY[0x1E4F6B7D0];
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([(_IDSAccount *)self accountType] == 2)
        {
          int v10 = 0;
        }
        else
        {
          uint64_t v11 = [v9 URI];
          __int16 v12 = [v11 unprefixedURI];
          int v10 = [v12 isEqualToIgnoringCase:v7];
        }
        if ([v9 isUserVisible]) {
          BOOL v13 = v10 == 0;
        }
        else {
          BOOL v13 = 0;
        }
        if (v13)
        {
          BOOL v14 = 1;
          goto LABEL_19;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_19:

  return v14;
}

- (NSArray)aliasStrings
{
  v2 = [(_IDSAccount *)self aliases];
  BOOL v3 = objc_msgSend(v2, "__imArrayByApplyingBlock:", &unk_1EE246708);

  return (NSArray *)v3;
}

- (NSArray)aliases
{
  BOOL v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A38390();
    }
  }
  uint64_t v6 = [(_IDSAccount *)self _objectForKey:*MEMORY[0x1E4F6B720]];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1919A743C;
  v9[3] = &unk_1E572BD60;
  v9[4] = self;
  uint64_t v7 = objc_msgSend(v6, "__imArrayByApplyingBlock:", v9);

  return (NSArray *)v7;
}

- (NSArray)vettedAliases
{
  BOOL v3 = [(_IDSAccount *)self aliasesToRegister];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1919A758C;
  v6[3] = &unk_1E572BD88;
  v6[4] = self;
  int v4 = objc_msgSend(v3, "__imArrayByFilteringWithBlock:", v6);

  return (NSArray *)v4;
}

- (NSArray)aliasesToRegister
{
  return (NSArray *)[(_IDSAccount *)self _objectForKey:*MEMORY[0x1E4F6B808]];
}

- (BOOL)_isInvisibleAlias:(id)a3
{
  id v4 = a3;
  if ([v4 hasSuffix:@"inbox.appleid.apple.com"])
  {
    char v5 = 1;
  }
  else
  {
    uint64_t v6 = [(_IDSAccount *)self _objectForKey:*MEMORY[0x1E4F6B740]];
    char v5 = [v6 containsObject:v4];
  }
  return v5;
}

- (NSArray)handles
{
  v2 = [(_IDSAccount *)self _objectForKey:*MEMORY[0x1E4F6B720]];
  BOOL v3 = objc_msgSend(v2, "__imArrayByApplyingBlock:", &unk_1EE246C28);

  return (NSArray *)v3;
}

- (NSDictionary)pseudonymURIMap
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(_IDSAccount *)self _objectForKey:*MEMORY[0x1E4F6B7A0]];
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v3;
  uint64_t v29 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v29)
  {
    uint64_t v28 = *(void *)v40;
    uint64_t v4 = *MEMORY[0x1E4F6B798];
    uint64_t v34 = *MEMORY[0x1E4F6B7E8];
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v40 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v31 = v5;
        uint64_t v6 = *(void *)(*((void *)&v39 + 1) + 8 * v5);
        uint64_t v7 = objc_msgSend(obj, "objectForKeyedSubscript:", v6, v27);
        uint64_t v33 = [MEMORY[0x1E4F6B5C8] URIWithPrefixedURI:v6];
        uint64_t v32 = [MEMORY[0x1E4F1CA48] array];
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v36;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v36 != v11) {
                objc_enumerationMutation(v8);
              }
              BOOL v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
              id v14 = objc_alloc(MEMORY[0x1E4F6B538]);
              int v15 = [v13 objectForKeyedSubscript:v4];
              long long v16 = (void *)[v14 initWithDictionaryRepresentation:v15];

              long long v17 = [v16 allowedServices];
              int v18 = [v17 containsObject:self->_service];

              if (v18)
              {
                long long v19 = (void *)MEMORY[0x1E4F6B5C8];
                long long v20 = [v13 objectForKeyedSubscript:v34];
                uint64_t v21 = [v19 URIWithPrefixedURI:v20];

                if (v21) {
                  BOOL v22 = v16 == 0;
                }
                else {
                  BOOL v22 = 1;
                }
                if (!v22)
                {
                  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F6B530]) initWithURI:v21 maskedURI:v33 properties:v16];
                  [v32 addObject:v23];
                }
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v35 objects:v43 count:16];
          }
          while (v10);
        }

        if ([v32 count])
        {
          uint64_t v24 = (void *)[v32 copy];
          [v27 setObject:v24 forKeyedSubscript:v33];
        }
        uint64_t v5 = v31 + 1;
      }
      while (v31 + 1 != v29);
      uint64_t v29 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v29);
  }

  uint64_t v25 = (void *)[v27 copy];

  return (NSDictionary *)v25;
}

- (NSArray)pseudonyms
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v3 = [(_IDSAccount *)self accountInfo];
  uint64_t v4 = [v3 objectForKey:*MEMORY[0x1E4F6B7A0]];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v4;
  uint64_t v28 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v39;
    uint64_t v5 = *MEMORY[0x1E4F6B798];
    uint64_t v33 = *MEMORY[0x1E4F6B7E8];
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v39 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v30 = v6;
        uint64_t v7 = *(void *)(*((void *)&v38 + 1) + 8 * v6);
        id v8 = [obj objectForKeyedSubscript:v7];
        uint64_t v32 = [MEMORY[0x1E4F6B5C8] URIWithPrefixedURI:v7];
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v35 != v12) {
                objc_enumerationMutation(v9);
              }
              id v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
              id v15 = objc_alloc(MEMORY[0x1E4F6B538]);
              long long v16 = [v14 objectForKeyedSubscript:v5];
              long long v17 = (void *)[v15 initWithDictionaryRepresentation:v16];

              int v18 = [v17 allowedServices];
              int v19 = [v18 containsObject:self->_service];

              if (v19)
              {
                long long v20 = (void *)MEMORY[0x1E4F6B5C8];
                uint64_t v21 = [v14 objectForKeyedSubscript:v33];
                BOOL v22 = [v20 URIWithPrefixedURI:v21];

                if (v22) {
                  BOOL v23 = v17 == 0;
                }
                else {
                  BOOL v23 = 1;
                }
                if (!v23)
                {
                  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F6B530]) initWithURI:v22 maskedURI:v32 properties:v17];
                  [v31 addObject:v24];
                }
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v42 count:16];
          }
          while (v11);
        }

        uint64_t v6 = v30 + 1;
      }
      while (v30 + 1 != v28);
      uint64_t v28 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v28);
  }

  uint64_t v25 = (void *)[v31 copy];

  return (NSArray *)v25;
}

- (NSString)loginID
{
  return (NSString *)[(_IDSAccount *)self _objectForKey:*MEMORY[0x1E4F6B758]];
}

- (NSString)serviceName
{
  BOOL v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A38428();
    }
  }
  service = self->_service;

  return service;
}

- (NSString)primaryServiceName
{
  BOOL v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A384C0();
    }
  }
  uint64_t v6 = [(_IDSAccount *)self _objectForKey:*MEMORY[0x1E4F6B760]];
  if (!v6)
  {
    uint64_t v6 = [(_IDSAccount *)self serviceName];
  }

  return (NSString *)v6;
}

- (NSString)pushTopic
{
  return (NSString *)[(_IDSAccount *)self _objectForKey:*MEMORY[0x1E4F6B7A8]];
}

- (NSString)uniqueID
{
  BOOL v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A38558();
    }
  }
  uniqueID = self->_uniqueID;

  return uniqueID;
}

- (BOOL)_isEnabled
{
  BOOL v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A385F0();
    }
  }
  return self->_isEnabled;
}

- (void)_setIsEnabled:(BOOL)a3
{
  uint64_t v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A38688();
    }
  }
  self->_isEnabled = a3;
}

- (int)accountType
{
  v2 = [(_IDSAccount *)self _objectForKey:*MEMORY[0x1E4F6B700]];
  int v3 = [v2 intValue];

  return v3;
}

- (BOOL)isTemporary
{
  v2 = [(_IDSAccount *)self _objectForKey:*MEMORY[0x1E4F6B748]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isUserDisabled
{
  v2 = [(_IDSAccount *)self _objectForKey:*MEMORY[0x1E4F6B7F8]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setPassword:(id)a3
{
  id v4 = a3;
  id v6 = +[IDSDaemonController sharedInstance];
  uint64_t v5 = [(_IDSAccount *)self uniqueID];
  [v6 passwordChanged:v4 forAccount:v5];
}

- (void)setAuthToken:(id)a3
{
  id v4 = a3;
  id v6 = +[IDSDaemonController sharedInstance];
  uint64_t v5 = [(_IDSAccount *)self uniqueID];
  [v6 authTokenChanged:v4 forAccount:v5];
}

- (id)registrationInfo
{
  return [(_IDSAccount *)self _objectForKey:*MEMORY[0x1E4F6B7B8]];
}

- (int)registrationStatus
{
  v2 = [(_IDSAccount *)self registrationInfo];
  char v3 = [v2 objectForKey:*MEMORY[0x1E4F6B7C0]];
  int v4 = [v3 integerValue];

  return v4;
}

- (NSString)profileID
{
  return (NSString *)[(_IDSAccount *)self _objectForKey:*MEMORY[0x1E4F6B730]];
}

- (int)registrationError
{
  v2 = [(_IDSAccount *)self registrationInfo];
  char v3 = [v2 objectForKey:*MEMORY[0x1E4F6C798]];
  int v4 = [v3 intValue];

  return v4;
}

- (NSDictionary)registrationAlertInfo
{
  v2 = [(_IDSAccount *)self registrationInfo];
  char v3 = [v2 objectForKey:*MEMORY[0x1E4F6C790]];

  return (NSDictionary *)v3;
}

- (int64_t)profileValidationStatus
{
  v2 = [(_IDSAccount *)self profileInfo];
  char v3 = [v2 objectForKey:*MEMORY[0x1E4F6B790]];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (int)profileValidationErrorReason
{
  v2 = [(_IDSAccount *)self profileInfo];
  char v3 = [v2 objectForKey:*MEMORY[0x1E4F6B788]];
  int v4 = [v3 intValue];

  return v4;
}

- (NSString)userUniqueIdentifier
{
  return (NSString *)[(_IDSAccount *)self _objectForKey:*MEMORY[0x1E4F6B800]];
}

- (NSString)regionID
{
  v2 = [(_IDSAccount *)self profileInfo];
  char v3 = [v2 objectForKey:*MEMORY[0x1E4F6B778]];

  return (NSString *)v3;
}

- (void)setRegionID:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A38720();
    }
  }
  if (v4)
  {
    id v8 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = v4;
      __int16 v20 = 2112;
      uint64_t v21 = self;
      _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "Account setting regionID {regionID: %@, account: %@}", buf, 0x16u);
    }

    id v9 = [(_IDSAccount *)self profileInfo];
    uint64_t v10 = (void *)[v9 mutableCopy];
    uint64_t v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    BOOL v13 = v12;

    [v13 setObject:v4 forKey:*MEMORY[0x1E4F6B778]];
    id v14 = objc_msgSend(v13, "copy", *MEMORY[0x1E4F6B770]);
    long long v17 = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];

    [(_IDSAccount *)self updateAccountWithAccountInfo:v15];
  }
}

- (NSString)regionBasePhoneNumber
{
  v2 = [(_IDSAccount *)self profileInfo];
  char v3 = [v2 objectForKey:*MEMORY[0x1E4F6B768]];

  return (NSString *)v3;
}

- (void)setRegionBasePhoneNumber:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A387B8();
    }
  }
  if (v4)
  {
    id v8 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = v4;
      __int16 v20 = 2112;
      uint64_t v21 = self;
      _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "Account setting regionBasePhoneNumber {regionBasePhoneNumber: %@, account: %@}", buf, 0x16u);
    }

    id v9 = [(_IDSAccount *)self profileInfo];
    uint64_t v10 = (void *)[v9 mutableCopy];
    uint64_t v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    BOOL v13 = v12;

    [v13 setObject:v4 forKey:*MEMORY[0x1E4F6B768]];
    id v14 = objc_msgSend(v13, "copy", *MEMORY[0x1E4F6B770]);
    long long v17 = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];

    [(_IDSAccount *)self updateAccountWithAccountInfo:v15];
  }
}

- (NSString)displayName
{
  return (NSString *)[(NSDictionary *)self->_accountConfig objectForKey:*MEMORY[0x1E4F6B738]];
}

- (void)setDisplayName:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A38850();
    }
  }
  if (v4)
  {
    id v8 = v4;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA98] null];
  }
  id v9 = v8;
  uint64_t v11 = *MEMORY[0x1E4F6B738];
  v12[0] = v8;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  [(_IDSAccount *)self updateAccountWithAccountInfo:v10];
}

- (void)_updateDependentDevicesWithDevicesInfo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A38A08();
    }
  }
  id v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  devices = self->_devices;
  p_devices = &self->_devices;
  self->_devices = v8;

  uint64_t v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  suppressedDevices = self->_suppressedDevices;
  self->_suppressedDevices = v10;

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v12 = v4;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v29;
    uint64_t v26 = &v33;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = [[IDSDevice alloc] _initWithDictionary:*(void *)(*((void *)&v28 + 1) + 8 * v16)];
        int v18 = [self->_delegateContext object];
        [v17 _setAccount:v18];

        id v19 = [v17 _internal];
        if ([v19 isLocallyPaired])
        {
          BOOL v20 = [(_IDSAccount *)self _isiCloudPairingService];

          p_suppressedDevices = &self->_suppressedDevices;
          if (v20) {
            goto LABEL_20;
          }
        }
        else
        {
        }
        uint64_t v22 = objc_msgSend(v17, "_internal", v26);
        if ([v22 supportsiCloudPairing])
        {
        }
        else
        {
          BOOL v23 = [(_IDSAccount *)self _isiCloudPairingService];

          p_suppressedDevices = &self->_suppressedDevices;
          if (v23) {
            goto LABEL_20;
          }
        }
        uint64_t v24 = [MEMORY[0x1E4F6C3B8] registration];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
          sub_191A38990(v32, v17, v26, v24);
        }

        p_suppressedDevices = &self->_devices;
LABEL_20:
        -[NSMutableArray addObject:](*p_suppressedDevices, "addObject:", v17, v26);

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v14);
  }

  uint64_t v25 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    sub_191A388E8((id *)p_devices, v25);
  }
}

- (void)_loadCachedDevices
{
  char v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A38AA0();
    }
  }
  if (!self->_devicesLoaded)
  {
    int v6 = +[IDSDaemonController sharedInstance];
    [v6 blockUntilConnected];

    uint64_t v7 = +[IDSDaemonController sharedInstance];
    id v8 = [v7 listener];
    id v9 = [(_IDSAccount *)self uniqueID];
    uint64_t v10 = [v8 dependentDevicesForAccount:v9];

    [(_IDSAccount *)self _updateDependentDevicesWithDevicesInfo:v10];
    self->_devicesLoaded = 1;
  }
}

- (void)_reloadCachedDevices
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  char v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A38B38();
    }
  }
  int v6 = [MEMORY[0x1E4F6C3B8] reloadAccounts];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [(_IDSAccount *)self devices];
    int v10 = 138412290;
    uint64_t v11 = v7;
    _os_log_impl(&dword_19190B000, v6, OS_LOG_TYPE_DEFAULT, "Devices before %@", (uint8_t *)&v10, 0xCu);
  }
  self->_devicesLoaded = 0;
  [(_IDSAccount *)self _loadCachedDevices];
  id v8 = [MEMORY[0x1E4F6C3B8] reloadAccounts];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(_IDSAccount *)self devices];
    int v10 = 138412290;
    uint64_t v11 = v9;
    _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "Devices after %@", (uint8_t *)&v10, 0xCu);
  }
}

- (NSArray)suppressedDevices
{
  char v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A38BD0();
    }
  }
  [(_IDSAccount *)self _loadCachedDevices];
  int v6 = (void *)[(NSMutableArray *)self->_suppressedDevices copy];

  return (NSArray *)v6;
}

- (NSArray)devices
{
  char v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A38C68();
    }
  }
  [(_IDSAccount *)self _loadCachedDevices];
  int v6 = (void *)[(NSMutableArray *)self->_devices copy];

  return (NSArray *)v6;
}

- (NSArray)nearbyDevices
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  char v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A38D00();
    }
  }
  [(_IDSAccount *)self _loadCachedDevices];
  int v6 = (void *)[(NSMutableArray *)self->_devices _copyForEnumerating];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "_internal", (void)v17);
        int v15 = [v14 isNearby];

        if (v15) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return (NSArray *)v7;
}

- (NSArray)connectedDevices
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  char v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A38D98();
    }
  }
  [(_IDSAccount *)self _loadCachedDevices];
  int v6 = (void *)[(NSMutableArray *)self->_devices _copyForEnumerating];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "_internal", (void)v17);
        int v15 = [v14 isConnected];

        if (v15) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return (NSArray *)v7;
}

- (void)_callDevicesChanged
{
  char v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A38E30();
    }
  }
  int v6 = (void *)[(NSMutableArray *)self->_devices copy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1919A95BC;
  v8[3] = &unk_1E572BDB0;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(_IDSAccount *)self _callDelegatesWithBlock:v8];
}

- (void)_callNearbyDevicesChanged
{
  char v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A38EC8();
    }
  }
  int v6 = [(_IDSAccount *)self nearbyDevices];
  id v7 = (void *)[v6 copy];

  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = sub_1919A9748;
  uint64_t v12 = &unk_1E572BDB0;
  uint64_t v13 = self;
  id v14 = v7;
  id v8 = v7;
  [(_IDSAccount *)self _callDelegatesWithBlock:&v9];
  [(_IDSAccount *)self _callDevicesChanged];
}

- (void)_callConnectedDevicesChanged
{
  char v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A38F60();
    }
  }
  int v6 = [(_IDSAccount *)self connectedDevices];
  id v7 = (void *)[v6 copy];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1919A98CC;
  v9[3] = &unk_1E572BDB0;
  v9[4] = self;
  id v10 = v7;
  id v8 = v7;
  [(_IDSAccount *)self _callDelegatesWithBlock:v9];
}

- (void)_callCloudConnectedDevicesChanged
{
  char v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A38FF8();
    }
  }
  int v6 = (void *)[(NSMutableArray *)self->_devices copy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1919A9A3C;
  v8[3] = &unk_1E572BDB0;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(_IDSAccount *)self _callDelegatesWithBlock:v8];
}

- (id)_keychainRegistration
{
  char v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A390D4();
    }
  }
  uint64_t v6 = [(_IDSAccount *)self accountType];
  uint64_t v7 = v6;
  switch(v6)
  {
    case 0:
      uint64_t v10 = [(_IDSAccount *)self userUniqueIdentifier];
LABEL_13:
      id v8 = v10;
      goto LABEL_15;
    case 1:
      uint64_t v10 = [(_IDSAccount *)self loginID];
      goto LABEL_13;
    case 2:
      id v8 = [MEMORY[0x1E4F6C3B8] registration];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_191A39090(v8);
      }
      id v9 = 0;
      goto LABEL_18;
  }
  id v8 = 0;
LABEL_15:
  uint64_t v11 = [(_IDSAccount *)self primaryServiceName];
  if (![v11 length])
  {
    uint64_t v12 = [(_IDSAccount *)self serviceName];

    uint64_t v11 = (void *)v12;
  }
  uint64_t v13 = [MEMORY[0x1E4F6B568] sharedInstance];
  id v14 = _IDSRegistrationServiceTypeForString();
  id v9 = objc_msgSend(v13, "registrationWithServiceType:accountType:isTemporary:value:", v14, v7, -[_IDSAccount isTemporary](self, "isTemporary"), v8);

LABEL_18:

  return v9;
}

- (NSDate)nextRegistrationDate
{
  char v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A3916C();
    }
  }
  uint64_t v6 = [(_IDSAccount *)self _keychainRegistration];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = [v6 objectForKey:@"next-registration-date"];
  }
  else
  {
    id v8 = 0;
  }

  return (NSDate *)v8;
}

- (NSDate)lastGDRDate
{
  char v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A39204();
    }
  }
  uint64_t v6 = [(_IDSAccount *)self _objectForKey:*MEMORY[0x1E4F6B750]];

  return (NSDate *)v6;
}

- (NSDate)dateRegistered
{
  char v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A3929C();
    }
  }
  uint64_t v6 = [(_IDSAccount *)self _keychainRegistration];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = [v6 objectForKey:@"registration-date"];
  }
  else
  {
    id v8 = 0;
  }

  return (NSDate *)v8;
}

- (id)_registeredURIs
{
  char v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A39334();
    }
  }
  if ([(_IDSAccount *)self accountType] == 2)
  {
    uint64_t v6 = [(_IDSAccount *)self loginID];
    uint64_t v7 = (void *)_IDSCopyIDForPhoneNumberWithOptions();

    if (v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObject:v7];
LABEL_10:
      uint64_t v10 = (void *)v8;
      goto LABEL_12;
    }
  }
  id v9 = [(_IDSAccount *)self _keychainRegistration];
  uint64_t v7 = v9;
  if (v9)
  {
    uint64_t v8 = [v9 objectForKey:@"uris"];
    goto LABEL_10;
  }
  uint64_t v10 = 0;
LABEL_12:

  return v10;
}

- (NSArray)registeredURIs
{
  char v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A39464();
    }
  }
  uint64_t v6 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_191A393CC(self);
  }

  uint64_t v7 = [(_IDSAccount *)self _registeredURIs];

  return (NSArray *)v7;
}

- (NSArray)accountRegisteredURIs
{
  char v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A394FC();
    }
  }
  uint64_t v6 = [(_IDSAccount *)self _objectForKey:*MEMORY[0x1E4F6B7B0]];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [(_IDSAccount *)self registeredURIs];
  }
  id v9 = v8;

  uint64_t v10 = objc_msgSend(v9, "__imArrayByApplyingBlock:", &unk_1EE246D08);

  return (NSArray *)v10;
}

- (NSData)registrationCertificate
{
  char v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A3962C();
    }
  }
  uint64_t v6 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_191A39594(self);
  }

  uint64_t v7 = [(_IDSAccount *)self _keychainRegistration];
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 objectForKey:@"ids-registration-cert"];
  }
  else
  {
    id v9 = 0;
  }

  return (NSData *)v9;
}

- (NSData)pushToken
{
  char v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A3975C();
    }
  }
  uint64_t v6 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_191A396C4(self);
  }

  uint64_t v7 = [(_IDSAccount *)self _keychainRegistration];
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 objectForKey:@"push-token"];
  }
  else
  {
    id v9 = 0;
  }

  return (NSData *)v9;
}

- (NSString)description
{
  char v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A397F4();
    }
  }
  uint64_t v6 = NSString;
  uint64_t v7 = [(_IDSAccount *)self serviceName];
  id v8 = [(_IDSAccount *)self loginID];
  id v9 = [(_IDSAccount *)self uniqueID];
  [(_IDSAccount *)self accountType];
  uint64_t v10 = _StringForIDSAccountType();
  if ([(_IDSAccount *)self canSend]) {
    uint64_t v11 = @"YES";
  }
  else {
    uint64_t v11 = @"NO";
  }
  if ([(_IDSAccount *)self isActive]) {
    uint64_t v12 = @"YES";
  }
  else {
    uint64_t v12 = @"NO";
  }
  uint64_t v13 = [v6 stringWithFormat:@"<%p:%@:%@:%@:%@:%@:%@>", self, v7, v8, v9, v10, v11, v12];

  return (NSString *)v13;
}

- (void)_connect
{
  char v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A398F8();
    }
  }
  uint64_t v6 = [(NSDictionary *)self->_accountConfig objectForKey:*MEMORY[0x1E4F6B7E0]];
  if (!v6)
  {
    uint64_t v12 = +[IDSLogging Accounts];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_191A3988C();
    }
    goto LABEL_12;
  }
  uint64_t v7 = +[IDSDaemonController sharedInstance];
  char v8 = [v7 hasListenerForID:self->_serviceToken];

  if ((v8 & 1) == 0)
  {
    id v9 = +[IDSDaemonController sharedInstance];
    serviceToken = self->_serviceToken;
    uint64_t v11 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
    LOBYTE(serviceToken) = [v9 addListenerID:serviceToken services:v11];

    if ((serviceToken & 1) == 0)
    {
      uint64_t v12 = +[IDSLogging Accounts];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_191A329B4();
      }
LABEL_12:
    }
  }
}

- (void)account:(id)a3 registrationStatusInfoChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A399F8();
    }
  }
  if ([v6 isEqualToString:self->_uniqueID])
  {
    int v11 = [(_IDSAccount *)self accountType] != 2
       && [(_IDSAccount *)self registrationStatus] == 5;
    int v12 = [(_IDSAccount *)self canSend];
    uint64_t v13 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_191A39990();
    }

    id v14 = (void *)[(NSDictionary *)self->_accountConfig mutableCopy];
    int v15 = v14;
    if (v7) {
      [v14 setObject:v7 forKey:*MEMORY[0x1E4F6B7B8]];
    }
    else {
      [v14 removeObjectForKey:*MEMORY[0x1E4F6B7B8]];
    }
    objc_storeStrong((id *)&self->_accountConfig, v15);
    uint64_t v16 = +[IDSDaemonController sharedInstance];
    long long v17 = [v16 listener];
    [v17 updateAccount:v6 withAccountInfo:self->_accountConfig];

    long long v18 = [(_IDSAccount *)self uniqueID];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_1919AA95C;
    v24[3] = &unk_1E572BDF8;
    id v19 = v18;
    id v25 = v19;
    id v26 = v7;
    [(_IDSAccount *)self _callRegistrationDelegatesWithBlock:v24];
    int v20 = [(_IDSAccount *)self accountType] != 2
       && [(_IDSAccount *)self registrationStatus] == 5;
    int v21 = [(_IDSAccount *)self canSend];
    if (v12 != v21 || v11 != v20)
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = sub_1919AA9BC;
      v22[3] = &unk_1E572BE20;
      v22[4] = self;
      char v23 = v21;
      [(_IDSAccount *)self _callDelegatesWithBlock:v22];
    }
  }
}

- (void)account:(id)a3 aliasesChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A39AF8();
    }
  }
  if ([v6 isEqualToString:self->_uniqueID])
  {
    int v11 = [(_IDSAccount *)self canSend];
    int v12 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_191A39A90();
    }

    uint64_t v13 = (void *)[(NSDictionary *)self->_accountConfig mutableCopy];
    id v14 = v13;
    if (v7) {
      [v13 setObject:v7 forKey:*MEMORY[0x1E4F6B720]];
    }
    else {
      [v13 removeObjectForKey:*MEMORY[0x1E4F6B720]];
    }
    objc_storeStrong((id *)&self->_accountConfig, v14);
    int v15 = [(_IDSAccount *)self uniqueID];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1919AAC64;
    v20[3] = &unk_1E572BDF8;
    id v16 = v15;
    id v21 = v16;
    id v22 = v7;
    [(_IDSAccount *)self _callRegistrationDelegatesWithBlock:v20];
    int v17 = [(_IDSAccount *)self canSend];
    if (v11 != v17)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = sub_1919AACC4;
      v18[3] = &unk_1E572BE20;
      v18[4] = self;
      char v19 = v17;
      [(_IDSAccount *)self _callDelegatesWithBlock:v18];
    }
  }
}

- (void)account:(id)a3 vettedAliasesChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A39C08();
    }
  }
  if ([v6 isEqualToString:self->_uniqueID])
  {
    int v11 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_191A39B90((uint64_t)v6, v11);
    }

    int v12 = (NSDictionary *)[(NSDictionary *)self->_accountConfig mutableCopy];
    uint64_t v13 = v12;
    if (v7) {
      [(NSDictionary *)v12 setObject:v7 forKey:*MEMORY[0x1E4F6B808]];
    }
    else {
      [(NSDictionary *)v12 removeObjectForKey:*MEMORY[0x1E4F6B808]];
    }
    accountConfig = self->_accountConfig;
    self->_accountConfig = v13;
    int v15 = v13;

    id v16 = [(_IDSAccount *)self uniqueID];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1919AAEFC;
    v18[3] = &unk_1E572BDF8;
    id v19 = v16;
    id v20 = v7;
    id v17 = v16;
    [(_IDSAccount *)self _callRegistrationDelegatesWithBlock:v18];
  }
}

- (void)account:(id)a3 profileChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A39D08();
    }
  }
  if ([v6 isEqualToString:self->_uniqueID])
  {
    int v11 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_191A39CA0();
    }

    int v12 = (NSDictionary *)[(NSDictionary *)self->_accountConfig mutableCopy];
    uint64_t v13 = v12;
    if (v7) {
      [(NSDictionary *)v12 setObject:v7 forKey:*MEMORY[0x1E4F6B770]];
    }
    else {
      [(NSDictionary *)v12 removeObjectForKey:*MEMORY[0x1E4F6B770]];
    }
    accountConfig = self->_accountConfig;
    self->_accountConfig = v13;
    int v15 = v13;

    id v16 = [(_IDSAccount *)self uniqueID];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1919AB11C;
    v18[3] = &unk_1E572BDF8;
    id v19 = v16;
    id v20 = v7;
    id v17 = v16;
    [(_IDSAccount *)self _callRegistrationDelegatesWithBlock:v18];
  }
}

- (void)account:(id)a3 loginChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A39E08();
    }
  }
  if ([v6 isEqualToString:self->_uniqueID])
  {
    int v11 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_191A39DA0();
    }

    int v12 = (NSDictionary *)[(NSDictionary *)self->_accountConfig mutableCopy];
    uint64_t v13 = v12;
    if (v7) {
      [(NSDictionary *)v12 setObject:v7 forKey:*MEMORY[0x1E4F6B758]];
    }
    else {
      [(NSDictionary *)v12 removeObjectForKey:*MEMORY[0x1E4F6B758]];
    }
    accountConfig = self->_accountConfig;
    self->_accountConfig = v13;
    int v15 = v13;

    id v16 = [(_IDSAccount *)self uniqueID];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1919AB33C;
    v18[3] = &unk_1E572BDF8;
    id v19 = v16;
    id v20 = v7;
    id v17 = v16;
    [(_IDSAccount *)self _callRegistrationDelegatesWithBlock:v18];
  }
}

- (void)account:(id)a3 displayNameChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A39F08();
    }
  }
  if ([v6 isEqualToString:self->_uniqueID])
  {
    int v11 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_191A39EA0();
    }

    int v12 = (NSDictionary *)[(NSDictionary *)self->_accountConfig mutableCopy];
    uint64_t v13 = v12;
    if (v7) {
      [(NSDictionary *)v12 setObject:v7 forKey:*MEMORY[0x1E4F6B738]];
    }
    else {
      [(NSDictionary *)v12 removeObjectForKey:*MEMORY[0x1E4F6B738]];
    }
    accountConfig = self->_accountConfig;
    self->_accountConfig = v13;
    int v15 = v13;

    id v16 = [(_IDSAccount *)self uniqueID];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1919AB55C;
    v18[3] = &unk_1E572BDF8;
    id v19 = v16;
    id v20 = v7;
    id v17 = v16;
    [(_IDSAccount *)self _callRegistrationDelegatesWithBlock:v18];
  }
}

- (void)account:(id)a3 pseudonymsChanged:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A39FA0();
    }
  }
  if ([v6 isEqualToString:self->_uniqueID])
  {
    int v11 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v22 = v6;
      __int16 v23 = 2112;
      id v24 = v7;
      _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "Account %@ received pseudonyms changed: %@", buf, 0x16u);
    }

    int v12 = (NSDictionary *)[(NSDictionary *)self->_accountConfig mutableCopy];
    uint64_t v13 = v12;
    if (v7) {
      [(NSDictionary *)v12 setObject:v7 forKey:*MEMORY[0x1E4F6B7A0]];
    }
    else {
      [(NSDictionary *)v12 removeObjectForKey:*MEMORY[0x1E4F6B7A0]];
    }
    accountConfig = self->_accountConfig;
    self->_accountConfig = v13;
    int v15 = v13;

    id v16 = [(_IDSAccount *)self uniqueID];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1919AB7D4;
    v18[3] = &unk_1E572BDF8;
    id v19 = v16;
    id v20 = v7;
    id v17 = v16;
    [(_IDSAccount *)self _callRegistrationDelegatesWithBlock:v18];
  }
}

- (void)account:(id)a3 dependentDevicesUpdated:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A3A0A0();
    }
  }
  if ([v6 isEqualToString:self->_uniqueID])
  {
    int v11 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_191A3A038();
    }

    self->_devicesLoaded = 1;
    [(_IDSAccount *)self _updateDependentDevicesWithDevicesInfo:v7];
    [(_IDSAccount *)self _callDevicesChanged];
  }
}

- (void)account:(id)a3 dependentDevicesUpdatedUponReconnect:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A3A138();
    }
  }
  if ([v6 isEqualToString:self->_uniqueID])
  {
    int v11 = [MEMORY[0x1E4F6C3B8] accountEnabled];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
      int v13 = 138412546;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v12;
      _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "Account received %@ dependentDevicesUpdatedUponReconnect (devices count: %@)", (uint8_t *)&v13, 0x16u);
    }
    self->_devicesLoaded = 1;
    [(_IDSAccount *)self _updateDependentDevicesWithDevicesInfo:v7];
    [(_IDSAccount *)self _callDevicesChanged];
  }
}

- (void)account:(id)a3 localDeviceAdded:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A3A1D0();
    }
  }
  if ([v6 isEqualToString:self->_uniqueID])
  {
    int v11 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412546;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "Account received %@ localDeviceAdded %@", (uint8_t *)&v18, 0x16u);
    }

    int v12 = +[IDSDaemonController sharedInstance];
    int v13 = [v12 listener];
    id v14 = [(_IDSAccount *)self uniqueID];
    __int16 v15 = [v13 dependentDevicesForAccount:v14];

    [(_IDSAccount *)self _updateDependentDevicesWithDevicesInfo:v15];
    [(_IDSAccount *)self _callNearbyDevicesChanged];
    id v16 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [(NSMutableArray *)self->_devices __imArrayByApplyingBlock:&unk_1EE246188];
      int v18 = 138412290;
      id v19 = v17;
      _os_log_impl(&dword_19190B000, v16, OS_LOG_TYPE_DEFAULT, "Devices updated %@", (uint8_t *)&v18, 0xCu);
    }
  }
}

- (void)account:(id)a3 localDeviceRemoved:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:self->_uniqueID])
  {
    char v8 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "Account received %@ localDeviceRemoved %@", (uint8_t *)&v15, 0x16u);
    }

    int v9 = +[IDSDaemonController sharedInstance];
    uint64_t v10 = [v9 listener];
    int v11 = [(_IDSAccount *)self uniqueID];
    int v12 = [v10 dependentDevicesForAccount:v11];

    [(_IDSAccount *)self _updateDependentDevicesWithDevicesInfo:v12];
    [(_IDSAccount *)self _callNearbyDevicesChanged];
    int v13 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [(NSMutableArray *)self->_devices __imArrayByApplyingBlock:&unk_1EE2461A8];
      int v15 = 138412290;
      id v16 = v14;
      _os_log_impl(&dword_19190B000, v13, OS_LOG_TYPE_DEFAULT, "Devices updated %@", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)refreshRegistrationForAccount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A3A2E0();
    }
  }
  if ([v4 isEqualToString:self->_uniqueID])
  {
    char v8 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_191A3A268((uint64_t)v4, v8);
    }

    int v9 = [(_IDSAccount *)self uniqueID];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1919AC018;
    v11[3] = &unk_1E572BE48;
    id v12 = v9;
    id v10 = v9;
    [(_IDSAccount *)self _callRegistrationDelegatesWithBlock:v11];
  }
}

- (void)authenticateAccount
{
  id v4 = +[IDSDaemonController sharedInstance];
  char v3 = [(_IDSAccount *)self uniqueID];
  [v4 authenticateAccount:v3];
}

- (void)passwordUpdated
{
  id v4 = +[IDSDaemonController sharedInstance];
  char v3 = [(_IDSAccount *)self uniqueID];
  [v4 passwordUpdatedForAccount:v3];
}

- (void)updateAuthorizationCredentials:(id)a3 token:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = +[IDSDaemonController sharedInstance];
  char v8 = [(_IDSAccount *)self uniqueID];
  [v9 updateAuthorizationCredentials:v7 token:v6 forAccount:v8];
}

- (void)validateProfile
{
  id v4 = +[IDSDaemonController sharedInstance];
  char v3 = [(_IDSAccount *)self uniqueID];
  [v4 validateProfileForAccount:v3];
}

- (void)addAliases:(id)a3
{
  id v4 = a3;
  id v6 = +[IDSDaemonController sharedInstance];
  uint64_t v5 = [(_IDSAccount *)self uniqueID];
  [v6 addAliases:v4 toAccount:v5];
}

- (void)removeAliases:(id)a3
{
  id v4 = a3;
  id v6 = +[IDSDaemonController sharedInstance];
  uint64_t v5 = [(_IDSAccount *)self uniqueID];
  [v6 removeAliases:v4 fromAccount:v5];
}

- (void)validateAliases:(id)a3
{
  id v4 = a3;
  id v6 = +[IDSDaemonController sharedInstance];
  uint64_t v5 = [(_IDSAccount *)self uniqueID];
  [v6 validateAliases:v4 forAccount:v5];
}

- (void)unvalidateAliases:(id)a3
{
  id v4 = a3;
  id v6 = +[IDSDaemonController sharedInstance];
  uint64_t v5 = [(_IDSAccount *)self uniqueID];
  [v6 unvalidateAliases:v4 forAccount:v5];
}

- (void)registerAccount
{
  id v4 = +[IDSDaemonController sharedInstance];
  char v3 = [(_IDSAccount *)self uniqueID];
  [v4 registerAccount:v3];
}

- (void)unregisterAccount
{
  id v4 = +[IDSDaemonController sharedInstance];
  char v3 = [(_IDSAccount *)self uniqueID];
  [v4 unregisterAccount:v3];
}

- (void)forceRemoveAccount
{
  if ([(_IDSAccount *)self isTemporary] && ![(_IDSAccount *)self accountType])
  {
    id v5 = +[IDSDaemonController sharedInstance];
    id v4 = [(_IDSAccount *)self uniqueID];
    [v5 forceRemoveAccount:v4];
  }
  else
  {
    char v3 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_191A3A378((uint64_t)self, v3);
    }
  }
}

- (void)_reregisterAndReidentify:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = +[IDSDaemonController sharedInstance];
  id v5 = [NSNumber numberWithBool:v3];
  id v6 = [(_IDSAccount *)self uniqueID];
  [v7 _reregisterAndReidentify:v5 account:v6];
}

- (void)deactivateAndPurgeIdentify
{
  id v4 = +[IDSDaemonController sharedInstance];
  BOOL v3 = [(_IDSAccount *)self uniqueID];
  [v4 deactivateAndPurgeIdentifyForAccount:v3];
}

- (void)setLoginID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loginID, 0);
  objc_storeStrong((id *)&self->_registrationDelegateToInfo, 0);
  objc_storeStrong((id *)&self->_delegateToInfo, 0);
  objc_storeStrong(&self->_delegateContext, 0);
  objc_storeStrong((id *)&self->_suppressedDevices, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_serviceToken, 0);

  objc_storeStrong((id *)&self->_accountConfig, 0);
}

@end