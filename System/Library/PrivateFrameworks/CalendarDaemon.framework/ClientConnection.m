@interface ClientConnection
+ (id)poolManager;
- (BOOL)_isPrimaryObjectTypeForAccessLogging:(id)a3;
- (BOOL)addressIsAccountOwner:(id)a3;
- (BOOL)addressURLIsAccountOwner:(id)a3;
- (BOOL)initializationOptionsSet;
- (BOOL)isAlarmRestricted:(void *)a3 forAction:(unint64_t)a4;
- (BOOL)isCalendarItemManaged:(void *)a3;
- (BOOL)isCalendarItemRestricted:(void *)a3 forAction:(unint64_t)a4;
- (BOOL)isCalendarManaged:(void *)a3;
- (BOOL)isCalendarRestricted:(void *)a3 forAction:(unint64_t)a4;
- (BOOL)isNotificationRestricted:(void *)a3 forAction:(unint64_t)a4;
- (BOOL)isStoreManaged:(void *)a3;
- (BOOL)isStoreRestricted:(void *)a3 forAction:(unint64_t)a4;
- (BOOL)isStoreRestricted:(void *)a3 forAction:(unint64_t)a4 strict:(BOOL)a5;
- (BOOL)reminderAccessGranted;
- (BOOL)trySetDatabaseInitializationOptions:(id)a3;
- (BOOL)withDatabaseForObject:(id)a3 perform:(id)a4;
- (BOOL)withDatabaseForObjects:(id)a3 options:(unint64_t)a4 perform:(id)a5;
- (BOOL)withDatabaseForObjects:(id)a3 perform:(id)a4;
- (BOOL)withDatabaseID:(int)a3 perform:(id)a4;
- (CADAccountAccessHandler)accountAccessHandler;
- (CADDatabaseInitializationOptions)databaseInitializationOptions;
- (CADOperationProxy)cadOperationProxy;
- (CADPermissionValidator)permissionValidator;
- (CADTCCPermissionChecker)tccPermissionChecker;
- (CADXPCConnection)xpcConnection;
- (CDBAccountInfo)localAccountInfo;
- (ClientConnection)initWithXPCConnection:(id)a3 tccPermissionChecker:(id)a4;
- (ClientIdentity)identity;
- (NSString)changeTrackingID;
- (NSString)effectiveApplicationIdentifier;
- (NSString)effectiveTeamIdentifier;
- (id)_accountsProvider;
- (id)_createManagedConfigAccountAccessHandlerWithValidator:(id)a3;
- (id)_databaseProvider;
- (id)_objectIDsResolvedAndLoggable:(id)a3;
- (id)_objectIDsToBeResolved:(id)a3;
- (id)_permissionValidator;
- (id)_resolveObjectIDForLoggingAccessToEntity:(void *)a3;
- (id)_resolveObjectIDsForLogging:(id)a3;
- (id)accountsProvider;
- (id)operations;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)restrictedCalendarRowIDsForAction:(unint64_t)a3 inDatabase:(CalDatabase *)a4;
- (id)restrictedStoreRowIDsForAction:(unint64_t)a3 inDatabase:(CalDatabase *)a4;
- (id)strictAccountAccessHandler;
- (int)databaseRestoreGeneration;
- (int)eventAccessLevel;
- (int)managedConfigurationAccountAccessForStore:(void *)a3;
- (unint64_t)_currentPriority;
- (void)_closeDatabases;
- (void)_initAccountAccessHandler;
- (void)_logAccessToResolvedObjectIDs:(id)a3;
- (void)addCreatedAuxDatabase:(CalDatabase *)a3;
- (void)addOperation:(id)a3;
- (void)clearCachedAuthorizationStatus;
- (void)closeDatabases;
- (void)dealloc;
- (void)dumpState;
- (void)handleDatabaseChanged;
- (void)invalidateConnection;
- (void)logAccessToEntities:(id)a3;
- (void)logAccessToObject:(id)a3;
- (void)logAccessToObjects:(id)a3;
- (void)releaseProxy;
- (void)reportIntegrityErrors:(id)a3;
- (void)restoreGenerationChangedExternally;
- (void)setCadOperationProxy:(id)a3;
- (void)setLocalAccountInfo:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)withAllDatabasesPerform:(id)a3;
@end

@implementation ClientConnection

uint64_t __44__ClientConnection_initializationOptionsSet__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 72);
  return result;
}

- (BOOL)withDatabaseForObjects:(id)a3 options:(unint64_t)a4 perform:(id)a5
{
  int v30 = a4;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v31 = a5;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v55 objects:v62 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v56 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        uint64_t v13 = [v12 databaseID];
        v14 = [MEMORY[0x1E4F28ED0] numberWithInt:v13];
        id v15 = [v7 objectForKeyedSubscript:v14];
        if (!v15)
        {
          id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [v7 setObject:v15 forKeyedSubscript:v14];
        }
        [v15 addObject:v12];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v55 objects:v62 count:16];
    }
    while (v9);
  }

  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__4;
  v53 = __Block_byref_object_dispose__4;
  id v54 = 0;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__4;
  v47 = __Block_byref_object_dispose__4;
  id v48 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__ClientConnection_withDatabaseForObjects_options_perform___block_invoke;
  block[3] = &unk_1E624EAD0;
  block[4] = self;
  block[5] = &v49;
  block[6] = &v43;
  dispatch_sync(dbQueue, block);
  unint64_t v29 = [(ClientConnection *)self _currentPriority];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obja = v7;
  uint64_t v17 = [obja countByEnumeratingWithState:&v38 objects:v61 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v39;
    while (2)
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(obja);
        }
        v20 = *(void **)(*((void *)&v38 + 1) + 8 * j);
        uint64_t v21 = [v20 intValue];
        v22 = [obja objectForKeyedSubscript:v20];
        v23 = (void *)v50[5];
        uint64_t v24 = v44[5];
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __59__ClientConnection_withDatabaseForObjects_options_perform___block_invoke_2;
        v34[3] = &unk_1E624EAF8;
        id v36 = v31;
        int v37 = v21;
        id v25 = v22;
        id v35 = v25;
        if (((v30 | [v23 performWithConfiguration:v24 priority:v29 databaseID:v21 block:v34]) & 1) == 0)
        {
          v27 = CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v60 = v20;
            _os_log_impl(&dword_1BBC88000, v27, OS_LOG_TYPE_ERROR, "No database with ID %{public}@", buf, 0xCu);
          }

          BOOL v26 = 0;
          goto LABEL_22;
        }
      }
      uint64_t v17 = [obja countByEnumeratingWithState:&v38 objects:v61 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }
  BOOL v26 = 1;
LABEL_22:

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);

  return v26;
}

- (BOOL)withDatabaseForObject:(id)a3 perform:(id)a4
{
  id v6 = a4;
  LOBYTE(a3) = -[ClientConnection withDatabaseID:perform:](self, "withDatabaseID:perform:", [a3 databaseID], v6);

  return (char)a3;
}

- (BOOL)withDatabaseID:(int)a3 perform:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  BOOL v26 = __Block_byref_object_copy__4;
  v27 = __Block_byref_object_dispose__4;
  id v28 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__4;
  uint64_t v21 = __Block_byref_object_dispose__4;
  id v22 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__ClientConnection_withDatabaseID_perform___block_invoke;
  block[3] = &unk_1E624EAD0;
  block[4] = self;
  block[5] = &v23;
  block[6] = &v17;
  dispatch_sync(dbQueue, block);
  unint64_t v8 = [(ClientConnection *)self _currentPriority];
  uint64_t v9 = (void *)v24[5];
  uint64_t v10 = v18[5];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __43__ClientConnection_withDatabaseID_perform___block_invoke_2;
  v13[3] = &unk_1E624EB20;
  id v11 = v6;
  id v14 = v11;
  int v15 = v4;
  LOBYTE(v4) = [v9 performWithConfiguration:v10 priority:v8 databaseID:v4 block:v13];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v4;
}

- (unint64_t)_currentPriority
{
  return qos_class_self() < QOS_CLASS_USER_INITIATED;
}

uint64_t __43__ClientConnection_withDatabaseID_perform___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40), a2);
}

- (int)eventAccessLevel
{
  v2 = [(ClientConnection *)self permissionValidator];
  int v3 = [v2 eventAccessLevel];

  return v3;
}

- (CADPermissionValidator)permissionValidator
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__4;
  uint64_t v10 = __Block_byref_object_dispose__4;
  id v11 = 0;
  dbQueue = self->_dbQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__ClientConnection_permissionValidator__block_invoke;
  v5[3] = &unk_1E624EA58;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dbQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CADPermissionValidator *)v3;
}

uint64_t __39__ClientConnection_permissionValidator__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _permissionValidator];
  return MEMORY[0x1F41817F8]();
}

- (id)_permissionValidator
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dbQueue);
  permissionValidator = self->_permissionValidator;
  if (!permissionValidator)
  {
    uint64_t v4 = [CADDefaultPermissionValidator alloc];
    v5 = [(ClientConnection *)self identity];
    uint64_t v6 = [(CADDefaultPermissionValidator *)v4 initWithClientIdentity:v5 tccPermissionChecker:self->_tccPermissionChecker];

    id v7 = [(CADDatabaseInitializationOptions *)self->_databaseInitializationOptions mockPermissions];
    if (v7) {
      uint64_t v8 = [[CADCombinedPermissionValidator alloc] initWithPermissionValidator:v6 andValidator:v7];
    }
    else {
      uint64_t v8 = v6;
    }
    uint64_t v9 = self->_permissionValidator;
    self->_permissionValidator = (CADPermissionValidator *)v8;

    permissionValidator = self->_permissionValidator;
  }
  return permissionValidator;
}

- (BOOL)isCalendarRestricted:(void *)a3 forAction:(unint64_t)a4
{
  if (a3)
  {
    uint64_t DatabaseForRecord = CalGetDatabaseForRecord();
    id v7 = [MEMORY[0x1E4F28ED0] numberWithInt:CalCalendarGetUID()];
    uint64_t v8 = [(ClientConnection *)self restrictedCalendarRowIDsForAction:a4 inDatabase:DatabaseForRecord];
    LOBYTE(self) = [v8 containsObject:v7];

    return (char)self;
  }
  else
  {
    uint64_t v10 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_1BBC88000, v10, OS_LOG_TYPE_ERROR, "isCalendarRestricted - NULL calendar passed in. Returning NO.", v11, 2u);
    }
    return 0;
  }
}

- (id)restrictedCalendarRowIDsForAction:(unint64_t)a3 inDatabase:(CalDatabase *)a4
{
  uint64_t v6 = [(ClientConnection *)self accountAccessHandler];
  id v7 = [v6 restrictedCalendarRowIDsForAction:a3 inDatabase:a4];

  return v7;
}

- (CADAccountAccessHandler)accountAccessHandler
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__4;
  uint64_t v10 = __Block_byref_object_dispose__4;
  id v11 = 0;
  dbQueue = self->_dbQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__ClientConnection_accountAccessHandler__block_invoke;
  v5[3] = &unk_1E624EA80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dbQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CADAccountAccessHandler *)v3;
}

- (BOOL)isCalendarItemRestricted:(void *)a3 forAction:(unint64_t)a4
{
  if (!a3) {
    return 0;
  }
  uint64_t v6 = CalCalendarItemCopyCalendar();
  if (!v6) {
    return 0;
  }
  id v7 = (const void *)v6;
  BOOL v8 = [(ClientConnection *)self isCalendarRestricted:v6 forAction:a4];
  CFRelease(v7);
  return v8;
}

uint64_t __59__ClientConnection_withDatabaseForObjects_options_perform___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned int *)(a1 + 48), *(void *)(a1 + 32), a2);
}

void __56__ClientConnection_trySetDatabaseInitializationOptions___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 72) = 1;
  v2 = *(void **)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 136);
  if (v3 != v2 && (objc_msgSend(v3, "isEqualToOptions:") & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 136), *(id *)(a1 + 40));
    uint64_t v4 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 136);
      int v12 = 138543362;
      uint64_t v13 = v5;
      _os_log_impl(&dword_1BBC88000, v4, OS_LOG_TYPE_DEFAULT, "Changed database initialization options to [%{public}@]", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v6 = *(void **)(a1 + 32);
    if (v6[11])
    {
      [v6 _closeDatabases];
      uint64_t v6 = *(void **)(a1 + 32);
    }
    id v7 = (void *)v6[3];
    v6[3] = 0;

    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void **)(v8 + 32);
    *(void *)(v8 + 32) = 0;

    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void **)(v10 + 8);
    *(void *)(v10 + 8) = 0;
  }
}

- (void)withAllDatabasesPerform:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__4;
  uint64_t v18 = __Block_byref_object_dispose__4;
  id v19 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__4;
  int v12 = __Block_byref_object_dispose__4;
  id v13 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__ClientConnection_withAllDatabasesPerform___block_invoke;
  block[3] = &unk_1E624EAD0;
  block[4] = self;
  block[5] = &v14;
  block[6] = &v8;
  dispatch_sync(dbQueue, block);
  unint64_t v6 = [(ClientConnection *)self _currentPriority];
  [(id)v15[5] performWithAllDatabasesWithConfiguration:v9[5] priority:v6 block:v4];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
}

- (BOOL)trySetDatabaseInitializationOptions:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v22 = v4;
    _os_log_impl(&dword_1BBC88000, v5, OS_LOG_TYPE_DEFAULT, "ClientConnection trySetDatabaseInitializationOptions. clientProvidedOptions:%{public}@", buf, 0xCu);
  }
  [v4 purifyOptions];
  unint64_t v6 = [v4 validOptionsForConnection:self];
  char v7 = [v4 isEqualToOptions:v6];
  if (v7)
  {
    if (_os_feature_enabled_impl())
    {
      uint64_t v8 = [v6 privacyClientIdentity];

      if (!v8)
      {
        uint64_t v9 = [(ClientConnection *)self identity];
        uint64_t v10 = v9;
        if (v9)
        {
          [v9 auditToken];
        }
        else
        {
          long long v19 = 0u;
          long long v20 = 0u;
        }
        uint64_t v14 = PAAuthenticatedClientIdentity();
        [v6 setPrivacyClientIdentity:v14];
      }
    }
    dbQueue = self->_dbQueue;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __56__ClientConnection_trySetDatabaseInitializationOptions___block_invoke;
    v17[3] = &unk_1E624E580;
    v17[4] = self;
    id v18 = v6;
    dispatch_sync(dbQueue, v17);
  }
  else
  {
    id v11 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBC88000, v11, OS_LOG_TYPE_ERROR, "Error validating database initialization options for access.", buf, 2u);
    }
    int v12 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v22 = v4;
      _os_log_impl(&dword_1BBC88000, v12, OS_LOG_TYPE_ERROR, "clientProvidedOptions:%{public}@", buf, 0xCu);
    }
    id v13 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v22 = v6;
      _os_log_impl(&dword_1BBC88000, v13, OS_LOG_TYPE_ERROR, "validatedOptions: %{public}@", buf, 0xCu);
    }
  }

  return v7;
}

- (int)databaseRestoreGeneration
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = -1;
  dbQueue = self->_dbQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__ClientConnection_databaseRestoreGeneration__block_invoke;
  v5[3] = &unk_1E624EA58;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dbQueue, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)initializationOptionsSet
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dbQueue = self->_dbQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__ClientConnection_initializationOptionsSet__block_invoke;
  v5[3] = &unk_1E624EA58;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dbQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (CADOperationProxy)cadOperationProxy
{
  return (CADOperationProxy *)objc_getProperty(self, a2, 112, 1);
}

void __45__ClientConnection_databaseRestoreGeneration__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _databaseProvider];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 databaseRestoreGeneration];
}

void __44__ClientConnection_withAllDatabasesPerform___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _databaseProvider];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 96);
  uint64_t v6 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  objc_storeStrong(v6, v5);
}

void __59__ClientConnection_withDatabaseForObjects_options_perform___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _databaseProvider];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 96);
  uint64_t v6 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  objc_storeStrong(v6, v5);
}

void __43__ClientConnection_withDatabaseID_perform___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _databaseProvider];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 96);
  uint64_t v6 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  objc_storeStrong(v6, v5);
}

- (id)_databaseProvider
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dbQueue);
  databaseProvider = self->_databaseProvider;
  if (!databaseProvider)
  {
    id v4 = +[ClientConnection poolManager];
    uint64_t v5 = [v4 poolForClient:self options:self->_databaseInitializationOptions];
    uint64_t v6 = self->_databaseProvider;
    self->_databaseProvider = v5;

    [(CADDatabaseConnectionProvider *)self->_databaseProvider addDelegate:self];
    char v7 = self->_configuration;
    if (!v7)
    {
      char v7 = objc_alloc_init(CADPooledDatabaseConfiguration);
      objc_storeStrong((id *)&self->_configuration, v7);
      [(CADPooledDatabaseConfiguration *)v7 setInMemoryChangeTrackingClientID:CalDatabaseNextInMemoryChangeTrackingClientID()];
      uint64_t v8 = [(ClientIdentity *)self->_identity clientName];
      [(CADPooledDatabaseConfiguration *)v7 setClientName:v8];
    }
    char v9 = [(ClientConnection *)self changeTrackingID];
    [(CADPooledDatabaseConfiguration *)v7 setClientIdentifier:v9];

    [(CADPooledDatabaseConfiguration *)v7 setEnablePropertyModificationLogging:[(CADDatabaseInitializationOptions *)self->_databaseInitializationOptions enablePropertyModificationLogging]];
    databaseProvider = self->_databaseProvider;
  }
  return databaseProvider;
}

- (NSString)changeTrackingID
{
  uint64_t v3 = [(ClientIdentity *)self->_identity applicationIdentifier];

  id v4 = [(ClientConnection *)self databaseInitializationOptions];
  uint64_t v5 = [v4 changeTrackingClientId];
  uint64_t v6 = v5;
  if (v3)
  {
    char v7 = [(ClientIdentity *)self->_identity applicationIdentifier];
    uint64_t v8 = [v6 clientIdWithBundleId:v7];
  }
  else
  {
    uint64_t v8 = [v5 clientId];
  }

  return (NSString *)v8;
}

- (CADDatabaseInitializationOptions)databaseInitializationOptions
{
  return self->_databaseInitializationOptions;
}

+ (id)poolManager
{
  if (poolManager_onceToken != -1) {
    dispatch_once(&poolManager_onceToken, &__block_literal_global_17);
  }
  uint64_t v2 = (void *)poolManager_defaultManager;
  return v2;
}

- (ClientConnection)initWithXPCConnection:(id)a3 tccPermissionChecker:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v33.receiver = self;
  v33.super_class = (Class)ClientConnection;
  char v9 = [(ClientConnection *)&v33 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_xpcConnection, a3);
    objc_storeStrong((id *)&v10->_tccPermissionChecker, a4);
    id v11 = [ClientIdentity alloc];
    if (v7) {
      [v7 auditToken];
    }
    else {
      memset(v32, 0, sizeof(v32));
    }
    uint64_t v12 = [(ClientIdentity *)v11 initWithAuditToken:v32];
    identity = v10->_identity;
    v10->_identity = (ClientIdentity *)v12;

    uint64_t v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    operations = v10->_operations;
    v10->_operations = v14;

    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.calaccessd.clientconnection.async.%d", objc_msgSend(v7, "processIdentifier"));
    id v16 = objc_claimAutoreleasedReturnValue();
    uint64_t v17 = (const char *)[v16 UTF8String];
    id v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create(v17, v18);
    asynchronousOperationQueue = v10->_asynchronousOperationQueue;
    v10->_asynchronousOperationQueue = (OS_dispatch_queue *)v19;

    dispatch_queue_t v21 = dispatch_queue_create("com.apple.calaccessd.clientconnection-dbqueue", 0);
    dbQueue = v10->_dbQueue;
    v10->_dbQueue = (OS_dispatch_queue *)v21;

    uint64_t v23 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = v23;
      uint64_t v25 = [(ClientConnection *)v10 identity];
      int v26 = [v25 pid];
      v27 = [(ClientConnection *)v10 identity];
      id v28 = [v27 clientName];
      *(_DWORD *)buf = 67109378;
      int v35 = v26;
      __int16 v36 = 2112;
      int v37 = v28;
      _os_log_impl(&dword_1BBC88000, v24, OS_LOG_TYPE_INFO, "Client connected: %i (%@)", buf, 0x12u);
    }
    unint64_t v29 = [[CADOperationProxy alloc] initWithClientConnection:v10];
    cadOperationProxy = v10->_cadOperationProxy;
    v10->_cadOperationProxy = v29;
  }
  return v10;
}

- (ClientIdentity)identity
{
  return self->_identity;
}

- (void)setCadOperationProxy:(id)a3
{
}

- (void)releaseProxy
{
}

void __40__ClientConnection_accountAccessHandler__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[3];
  if (!v3)
  {
    [v2 _initAccountAccessHandler];
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  id v4 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v4, v3);
}

- (id)_createManagedConfigAccountAccessHandlerWithValidator:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[CADRealCalendarDatabaseDataProvider realDataProvider];
  char v6 = [v4 hasSyncClientEntitlement];

  if (v6)
  {
    id v7 = 0;
  }
  else
  {
    id v8 = [(CADDatabaseInitializationOptions *)self->_databaseInitializationOptions managementBundleIdentifier];
    if (!v8)
    {
      char v9 = [(CADDatabaseInitializationOptions *)self->_databaseInitializationOptions remoteClientIdentity];
      id v8 = [v9 bundleIdentifier];

      if (!v8)
      {
        uint64_t v10 = [(ClientConnection *)self identity];
        id v8 = [v10 bundleIdentifier];

        if (!v8)
        {
          id v11 = (void *)CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v12 = v11;
            id v13 = [(ClientConnection *)self identity];
            uint64_t v14 = [v13 clientName];
            int v15 = (void *)MEMORY[0x1E4F28ED0];
            id v16 = [(ClientConnection *)self identity];
            uint64_t v17 = objc_msgSend(v15, "numberWithInt:", objc_msgSend(v16, "pid"));
            int v25 = 138412546;
            int v26 = v14;
            __int16 v27 = 2112;
            id v28 = v17;
            _os_log_impl(&dword_1BBC88000, v12, OS_LOG_TYPE_DEBUG, "XPC Client [%@] (PID: [%@]) does not have a bundle identifier. Account access behavior via MDM API will be undefined.", (uint8_t *)&v25, 0x16u);
          }
          id v8 = 0;
        }
      }
    }
    CADAccountManagementFromSource([(CADDatabaseInitializationOptions *)self->_databaseInitializationOptions management]);
    uint64_t v19 = v18;
    long long v20 = [MEMORY[0x1E4F74230] sharedConnection];
    dispatch_queue_t v21 = [[CADMCProfileConnectionManagedConfigurationHandler alloc] initWithMCProfileConnection:v20];
    id v22 = [CADMCAccountAccessHandler alloc];
    uint64_t v23 = [(ClientConnection *)self _accountsProvider];
    id v7 = [(CADMCAccountAccessHandler *)v22 initWithDatabaseDataProvider:v5 accountsProvider:v23 managedConfigHandler:v21 accountManagement:v19 bundleIdentifier:v8];
  }
  return v7;
}

void __46__ClientConnection_strictAccountAccessHandler__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 32))
  {
    int v3 = [*(id *)(v2 + 136) management];
    uint64_t v2 = *(void *)(a1 + 32);
    if (v3)
    {
      [(id)v2 _initAccountAccessHandler];
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  id v4 = *(void **)(v2 + 32);
  uint64_t v5 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v5, v4);
}

- (void)_initAccountAccessHandler
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  int v3 = +[CADRealCalendarDatabaseDataProvider realDataProvider];
  id v4 = [[CADGroupedAccountAccessHandler alloc] initWithDatabaseDataProvider:v3];
  uint64_t v5 = [(ClientConnection *)self _permissionValidator];
  int v6 = [v5 shouldTrustClientEnforcedManagedConfigurationAccess];
  if (v6) {
    id v7 = [[CADGroupedAccountAccessHandler alloc] initWithDatabaseDataProvider:v3];
  }
  else {
    id v7 = 0;
  }
  BOOL v8 = [(CADDatabaseInitializationOptions *)self->_databaseInitializationOptions allowDelegateSources];
  if (!v8)
  {
    char v9 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = v9;
      [(ClientConnection *)self identity];
      v11 = long long v39 = v7;
      [v11 clientName];
      v12 = int v37 = v6;
      id v13 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v14 = [(ClientConnection *)self identity];
      int v15 = objc_msgSend(v13, "numberWithInt:", objc_msgSend(v14, "pid"));
      *(_DWORD *)buf = 138412546;
      v42 = v12;
      __int16 v43 = 2112;
      v44 = v15;
      _os_log_impl(&dword_1BBC88000, v10, OS_LOG_TYPE_INFO, "XPC Client [%@] (PID: [%@]). allowDelegateSources is NO. Adding Excluded Delegate Access Handler", buf, 0x16u);

      int v6 = v37;
      id v7 = v39;
    }
    id v16 = [(CADAccountAccessHandler *)[CADExcludeDelegatesAccountAccessHandler alloc] initWithDatabaseDataProvider:v3];
    [(CADGroupedAccountAccessHandler *)v4 addAccountAccessHandler:v16];
    [(CADGroupedAccountAccessHandler *)v7 addAccountAccessHandler:v16];
  }
  if ([(CADDatabaseInitializationOptions *)self->_databaseInitializationOptions allowIntegrations])
  {
    int v17 = !v8;
  }
  else
  {
    uint64_t v18 = [(CADAccountAccessHandler *)[CADExcludeIntegrationsAccountAccessHandler alloc] initWithDatabaseDataProvider:v3];
    [(CADGroupedAccountAccessHandler *)v4 addAccountAccessHandler:v18];
    [(CADGroupedAccountAccessHandler *)v7 addAccountAccessHandler:v18];

    int v17 = 1;
  }
  uint64_t v19 = [(CADDatabaseInitializationOptions *)self->_databaseInitializationOptions allowedSourceIdentifiers];

  if (v19)
  {
    long long v20 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      dispatch_queue_t v21 = v20;
      id v22 = [(ClientConnection *)self identity];
      [v22 clientName];
      v23 = long long v40 = v7;
      uint64_t v24 = (void *)MEMORY[0x1E4F28ED0];
      [(ClientConnection *)self identity];
      int v25 = v38 = v6;
      int v26 = objc_msgSend(v24, "numberWithInt:", objc_msgSend(v25, "pid"));
      __int16 v27 = [(CADDatabaseInitializationOptions *)self->_databaseInitializationOptions allowedSourceIdentifiers];
      *(_DWORD *)buf = 138543874;
      v42 = v23;
      __int16 v43 = 2114;
      v44 = v26;
      __int16 v45 = 2114;
      v46 = v27;
      _os_log_impl(&dword_1BBC88000, v21, OS_LOG_TYPE_INFO, "XPC Client [%{public}@] (PID: [%{public}@]). allowedSourceIdentifiers is not nil. Adding Allow Specified Accounts Access Handler for sources %{public}@", buf, 0x20u);

      int v6 = v38;
      id v7 = v40;
    }
    id v28 = [CADAllowSpecifiedAccountsAccessHandler alloc];
    uint64_t v29 = [(CADDatabaseInitializationOptions *)self->_databaseInitializationOptions allowedSourceIdentifiers];
    int v30 = [(CADAllowSpecifiedAccountsAccessHandler *)v28 initWithAllowedSourceIdentifiers:v29 databaseDataProvider:v3];

    [(CADGroupedAccountAccessHandler *)v4 addAccountAccessHandler:v30];
    [(CADGroupedAccountAccessHandler *)v7 addAccountAccessHandler:v30];

    int v17 = 1;
  }
  id v31 = [(ClientConnection *)self _createManagedConfigAccountAccessHandlerWithValidator:v5];
  if (v31) {
    [(CADGroupedAccountAccessHandler *)v4 addAccountAccessHandler:v31];
  }
  v32 = [[CADFilterSuggestedCalendarsAccessHandler alloc] initWithDatabaseDataProvider:v3 permissionValidator:v5];
  [(CADGroupedAccountAccessHandler *)v4 addAccountAccessHandler:v32];
  if (v6)
  {
    if (v17) {
      objc_super v33 = v7;
    }
    else {
      objc_super v33 = [[CADAccountAccessHandler alloc] initWithDatabaseDataProvider:v3];
    }
    accountAccessHandler = self->_accountAccessHandler;
    self->_accountAccessHandler = v33;

    __int16 v36 = v4;
    strictAccountAccessHandler = self->_strictAccountAccessHandler;
    self->_strictAccountAccessHandler = v36;
  }
  else
  {
    objc_storeStrong((id *)&self->_accountAccessHandler, v4);
    strictAccountAccessHandler = self->_strictAccountAccessHandler;
    self->_strictAccountAccessHandler = 0;
  }
}

- (id)_accountsProvider
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dbQueue);
  accountsProvider = self->_accountsProvider;
  if (!accountsProvider)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F179C8]);
    uint64_t v5 = [[CADACAccountStoreAccountsProvider alloc] initWithAccountStore:v4];
    int v6 = self->_accountsProvider;
    self->_accountsProvider = (CADACAccountsProvider *)v5;

    accountsProvider = self->_accountsProvider;
  }
  return accountsProvider;
}

- (BOOL)isStoreRestricted:(void *)a3 forAction:(unint64_t)a4
{
  return [(ClientConnection *)self isStoreRestricted:a3 forAction:a4 strict:0];
}

- (int)managedConfigurationAccountAccessForStore:(void *)a3
{
  BOOL v5 = [(ClientConnection *)self isStoreRestricted:a3 forAction:0 strict:1];
  int result = [(ClientConnection *)self isStoreRestricted:a3 forAction:1 strict:1];
  if (result) {
    int v7 = 3;
  }
  else {
    int v7 = 2;
  }
  if (v5) {
    return v7;
  }
  return result;
}

- (BOOL)isStoreRestricted:(void *)a3 forAction:(unint64_t)a4 strict:(BOOL)a5
{
  if (a3)
  {
    BOOL v5 = a5;
    uint64_t DatabaseForRecord = CalGetDatabaseForRecord();
    uint64_t v10 = [(ClientConnection *)self accountAccessHandler];
    int v11 = [v10 isActionAllowed:a4 forStore:a3 inDatabase:DatabaseForRecord] ^ 1;

    if ((v11 & 1) == 0 && v5)
    {
      uint64_t v12 = [(ClientConnection *)self strictAccountAccessHandler];
      id v13 = v12;
      if (v12) {
        int v11 = [v12 isActionAllowed:a4 forStore:a3 inDatabase:DatabaseForRecord] ^ 1;
      }
      else {
        LOBYTE(v11) = 0;
      }
    }
  }
  else
  {
    uint64_t v14 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v16 = 0;
      _os_log_impl(&dword_1BBC88000, v14, OS_LOG_TYPE_ERROR, "isStoreRestricted - NULL store passed in. Returning NO.", v16, 2u);
    }
    LOBYTE(v11) = 0;
  }
  return v11;
}

- (id)strictAccountAccessHandler
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__4;
  uint64_t v10 = __Block_byref_object_dispose__4;
  id v11 = 0;
  dbQueue = self->_dbQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__ClientConnection_strictAccountAccessHandler__block_invoke;
  v5[3] = &unk_1E624EA80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dbQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)logAccessToObjects:(id)a3
{
  id v9 = a3;
  uint64_t v4 = _os_feature_enabled_impl();
  if (v9)
  {
    if (v4)
    {
      uint64_t v4 = [v9 count];
      if (v4)
      {
        BOOL v5 = [(ClientConnection *)self _objectIDsToBeResolved:v9];
        uint64_t v6 = [(ClientConnection *)self _resolveObjectIDsForLogging:v5];
        int v7 = [(ClientConnection *)self _objectIDsResolvedAndLoggable:v9];
        uint64_t v8 = [v6 setByAddingObjectsFromSet:v7];
        [(ClientConnection *)self _logAccessToResolvedObjectIDs:v8];
      }
    }
  }
  MEMORY[0x1F41817F8](v4);
}

- (void)logAccessToObject:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = _os_feature_enabled_impl();
  if (v4 && v5)
  {
    v7[0] = v4;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [(ClientConnection *)self logAccessToObjects:v6];
  }
}

- (BOOL)withDatabaseForObjects:(id)a3 perform:(id)a4
{
  return [(ClientConnection *)self withDatabaseForObjects:a3 options:0 perform:a4];
}

- (void)addOperation:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isAsynchronous])
  {
    int v5 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v4;
      uint64_t v6 = "Asynchronous operations are not supported: %@";
LABEL_8:
      _os_log_impl(&dword_1BBC88000, v5, OS_LOG_TYPE_ERROR, v6, buf, 0xCu);
    }
  }
  else if ([v4 isReady])
  {
    int v7 = self->_operations;
    objc_sync_enter(v7);
    [(NSMutableArray *)self->_operations addObject:v4];
    objc_sync_exit(v7);

    uint64_t v8 = self->_operations;
    asynchronousOperationQueue = self->_asynchronousOperationQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __33__ClientConnection_addOperation___block_invoke;
    v11[3] = &unk_1E624E580;
    id v12 = v4;
    id v13 = v8;
    uint64_t v10 = v8;
    dispatch_async(asynchronousOperationQueue, v11);
  }
  else
  {
    int v5 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v4;
      uint64_t v6 = "Operations that aren't ready are not supported: %@";
      goto LABEL_8;
    }
  }
}

void __33__ClientConnection_addOperation___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) start];
  obuint64_t j = *(id *)(a1 + 40);
  objc_sync_enter(obj);
  [*(id *)(a1 + 40) removeObject:*(void *)(a1 + 32)];
  objc_sync_exit(obj);
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = self->_operations;
  objc_sync_enter(v3);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_operations;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) cancel];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_operations removeAllObjects];
  objc_sync_exit(v3);

  v8.receiver = self;
  v8.super_class = (Class)ClientConnection;
  [(ClientConnection *)&v8 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_databaseInitializationOptions, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_localAccountInfo, 0);
  objc_storeStrong((id *)&self->_cadOperationProxy, 0);
  objc_storeStrong((id *)&self->_privacyApplication, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
  objc_storeStrong((id *)&self->_asynchronousOperationQueue, 0);
  objc_storeStrong((id *)&self->_operations, 0);
  objc_storeStrong((id *)&self->_dbQueue, 0);
  objc_storeStrong((id *)&self->_accountsProvider, 0);
  objc_storeStrong((id *)&self->_strictAccountAccessHandler, 0);
  objc_storeStrong((id *)&self->_accountAccessHandler, 0);
  objc_storeStrong((id *)&self->_tccPermissionChecker, 0);
  objc_storeStrong((id *)&self->_permissionValidator, 0);
}

- (BOOL)reminderAccessGranted
{
  uint64_t v2 = [(ClientConnection *)self permissionValidator];
  char v3 = [v2 hasReminderAccess];

  return v3;
}

uint64_t __31__ClientConnection_poolManager__block_invoke()
{
  v0 = objc_alloc_init(CADDatabaseConnectionPoolManager);
  poolManager_defaultManager = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0);
}

- (id)accountsProvider
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  long long v9 = __Block_byref_object_copy__4;
  long long v10 = __Block_byref_object_dispose__4;
  id v11 = 0;
  dbQueue = self->_dbQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__ClientConnection_accountsProvider__block_invoke;
  v5[3] = &unk_1E624EA58;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dbQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __36__ClientConnection_accountsProvider__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _accountsProvider];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v2;
  return MEMORY[0x1F41817F8](v2);
}

- (void)handleDatabaseChanged
{
  id v3 = [(ClientConnection *)self accountAccessHandler];
  [v3 reset];

  id v4 = [(ClientConnection *)self strictAccountAccessHandler];
  [v4 reset];
}

- (void)addCreatedAuxDatabase:(CalDatabase *)a3
{
  dbQueue = self->_dbQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__ClientConnection_addCreatedAuxDatabase___block_invoke;
  v4[3] = &unk_1E624EAA8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dbQueue, v4);
}

uint64_t __42__ClientConnection_addCreatedAuxDatabase___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 88) addCreatedAuxDatabase:*(void *)(a1 + 40)];
}

- (void)closeDatabases
{
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__ClientConnection_closeDatabases__block_invoke;
  block[3] = &unk_1E624E508;
  block[4] = self;
  dispatch_sync(dbQueue, block);
}

uint64_t __34__ClientConnection_closeDatabases__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _closeDatabases];
}

- (void)_closeDatabases
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dbQueue);
  databaseProvider = self->_databaseProvider;
  if (databaseProvider)
  {
    [(CADDatabaseConnectionProvider *)databaseProvider removeDelegate:self];
    id v4 = +[ClientConnection poolManager];
    [v4 returnPool:self->_databaseProvider forClient:self];

    uint64_t v5 = self->_databaseProvider;
    self->_databaseProvider = 0;
  }
}

- (void)restoreGenerationChangedExternally
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_dbQueue);
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__ClientConnection_restoreGenerationChangedExternally__block_invoke;
  block[3] = &unk_1E624E508;
  block[4] = self;
  dispatch_sync(dbQueue, block);
}

uint64_t __54__ClientConnection_restoreGenerationChangedExternally__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 72) = 0;
  return result;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ClientConnection *)self xpcConnection];
  uint64_t v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)remoteObjectProxy
{
  return [(ClientConnection *)self remoteObjectProxyWithErrorHandler:&__block_literal_global_48];
}

- (void)invalidateConnection
{
  id v2 = [(ClientConnection *)self xpcConnection];
  [v2 invalidate];
}

- (NSString)effectiveApplicationIdentifier
{
  identity = [(CADDatabaseInitializationOptions *)self->_databaseInitializationOptions remoteClientIdentity];
  id v4 = identity;
  if (!identity) {
    identity = self->_identity;
  }
  uint64_t v5 = [identity applicationIdentifier];

  return (NSString *)v5;
}

- (NSString)effectiveTeamIdentifier
{
  identity = [(CADDatabaseInitializationOptions *)self->_databaseInitializationOptions remoteClientIdentity];
  id v4 = identity;
  if (!identity) {
    identity = self->_identity;
  }
  uint64_t v5 = [identity teamIdentifier];

  return (NSString *)v5;
}

- (id)operations
{
  id v3 = self->_operations;
  objc_sync_enter(v3);
  id v4 = (void *)[(NSMutableArray *)self->_operations copy];
  objc_sync_exit(v3);

  return v4;
}

- (void)dumpState
{
  id v3 = [(ClientConnection *)self identity];
  id v2 = [v3 clientName];
  NSLog(&cfstr_Connection_0.isa, v2);
}

- (CADTCCPermissionChecker)tccPermissionChecker
{
  return self->_tccPermissionChecker;
}

- (void)clearCachedAuthorizationStatus
{
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__ClientConnection_clearCachedAuthorizationStatus__block_invoke;
  block[3] = &unk_1E624E508;
  block[4] = self;
  dispatch_sync(dbQueue, block);
  id v4 = [(ClientConnection *)self cadOperationProxy];
  [v4 clearCachedAuthorizationStatus];
}

void __50__ClientConnection_clearCachedAuthorizationStatus__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 8);
  *(void *)(v1 + 8) = 0;
}

- (void)logAccessToEntities:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = _os_feature_enabled_impl();
  if (v4 && v5 && [v4 count])
  {
    uint64_t v6 = objc_opt_new();
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = -[ClientConnection _resolveObjectIDForLoggingAccessToEntity:](self, "_resolveObjectIDForLoggingAccessToEntity:", *(void *)(*((void *)&v13 + 1) + 8 * v11), (void)v13);
          if (v12) {
            [v6 addObject:v12];
          }

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }

    [(ClientConnection *)self _logAccessToResolvedObjectIDs:v6];
  }
}

- (BOOL)_isPrimaryObjectTypeForAccessLogging:(id)a3
{
  unsigned int v3 = [a3 entityType];
  BOOL result = 1;
  if (v3 > 6 || ((1 << v3) & 0x46) == 0) {
    return v3 == 101;
  }
  return result;
}

- (id)_objectIDsToBeResolved:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (!-[ClientConnection _isPrimaryObjectTypeForAccessLogging:](self, "_isPrimaryObjectTypeForAccessLogging:", v11, (void)v13)&& [v11 entityType] != -1)
        {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_objectIDsResolvedAndLoggable:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (-[ClientConnection _isPrimaryObjectTypeForAccessLogging:](self, "_isPrimaryObjectTypeForAccessLogging:", v11, (void)v13))
        {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_resolveObjectIDsForLogging:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__4;
  long long v12 = __Block_byref_object_dispose__4;
  id v13 = (id)objc_opt_new();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __48__ClientConnection__resolveObjectIDsForLogging___block_invoke;
  v7[3] = &unk_1E624EB68;
  v7[4] = self;
  v7[5] = &v8;
  [(ClientConnection *)self withDatabaseForObjects:v4 options:1 perform:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __48__ClientConnection__resolveObjectIDsForLogging___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = CADCopyEntityInDatabase(a4, *(void **)(*((void *)&v14 + 1) + 8 * v10));
        if (v11)
        {
          long long v12 = v11;
          id v13 = [*(id *)(a1 + 32) _resolveObjectIDForLoggingAccessToEntity:v11];
          if (v13) {
            [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v13];
          }
          CFRelease(v12);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (id)_resolveObjectIDForLoggingAccessToEntity:(void *)a3
{
  CADOwningEntity(a3);
  id v4 = CADEntityCopyObjectID();
  if ([(ClientConnection *)self _isPrimaryObjectTypeForAccessLogging:v4]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (void)_logAccessToResolvedObjectIDs:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__ClientConnection__logAccessToResolvedObjectIDs___block_invoke;
  block[3] = &unk_1E624E508;
  block[4] = self;
  dispatch_sync(dbQueue, block);
  id v6 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * v11);
        id v13 = (void *)MEMORY[0x1C1867850](v8);
        id v14 = objc_alloc(MEMORY[0x1E4F28DB0]);
        long long v15 = objc_msgSend(v14, "initRequiringSecureCoding:", 1, (void)v20);
        [v15 encodeObject:v12];
        long long v16 = [v15 encodedData];
        [v6 addObject:v16];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
      uint64_t v9 = v8;
    }
    while (v8);
  }

  id v17 = objc_alloc(MEMORY[0x1E4F93508]);
  uint64_t v18 = (void *)[v17 initWithAccessor:self->_privacyApplication forService:*MEMORY[0x1E4FA9A30] assetIdentifiers:v6];
  uint64_t v19 = [MEMORY[0x1E4F934D0] sharedInstance];
  [v19 log:v18];
}

void __50__ClientConnection__logAccessToResolvedObjectIDs___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 104))
  {
    unsigned int v3 = [*(id *)(v1 + 136) privacyClientIdentity];

    id v4 = objc_alloc(MEMORY[0x1E4F934E0]);
    uint64_t v5 = *(void *)(a1 + 32);
    if (v3)
    {
      id v13 = [*(id *)(v5 + 136) privacyClientIdentity];
      uint64_t v6 = [v4 initWithTCCIdentity:v13];
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void **)(v7 + 104);
      *(void *)(v7 + 104) = v6;
    }
    else
    {
      uint64_t v9 = *(void **)(v5 + 128);
      if (v9) {
        [v9 auditToken];
      }
      else {
        memset(v14, 0, sizeof(v14));
      }
      uint64_t v10 = [v4 initWithAuditToken:v14];
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void **)(v11 + 104);
      *(void *)(v11 + 104) = v10;
    }
  }
}

- (id)restrictedStoreRowIDsForAction:(unint64_t)a3 inDatabase:(CalDatabase *)a4
{
  uint64_t v6 = [(ClientConnection *)self accountAccessHandler];
  uint64_t v7 = [v6 restrictedStoreRowIDsForAction:a3 inDatabase:a4];

  return v7;
}

- (BOOL)isNotificationRestricted:(void *)a3 forAction:(unint64_t)a4
{
  if (a3 && (uint64_t v6 = CalNotificationCopyOwner()) != 0)
  {
    uint64_t v7 = (const void *)v6;
    if (CalEntityGetType() == 1)
    {
      if ([(ClientConnection *)self isCalendarRestricted:v7 forAction:a4]) {
        LOBYTE(v8) = 1;
      }
      else {
        BOOL v8 = !CalendarCanContainAnAllowedEntityType((uint64_t)v7, self);
      }
    }
    else
    {
      LOBYTE(v8) = 0;
    }
    CFRelease(v7);
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (BOOL)isAlarmRestricted:(void *)a3 forAction:(unint64_t)a4
{
  if (a3 && (uint64_t v6 = CalAlarmCopyOwningEntity()) != 0)
  {
    uint64_t v7 = (const void *)v6;
    int Type = CalEntityGetType();
    if (Type == 101 || Type == 2) {
      LOBYTE(a4) = [(ClientConnection *)self isCalendarItemRestricted:v7 forAction:a4];
    }
    else {
      LODWORD(a4) = !CalendarCanContainAnAllowedEntityType((uint64_t)v7, self);
    }
    CFRelease(v7);
  }
  else
  {
    LOBYTE(a4) = 0;
  }
  return a4;
}

- (BOOL)isStoreManaged:(void *)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = (void *)CalStoreCopyExternalID();
  uint64_t v5 = [(ClientConnection *)self accountsProvider];
  uint64_t v6 = [v5 accountWithIdentifier:v4];
  char v7 = [v6 MCIsManaged];

  return v7;
}

- (BOOL)isCalendarManaged:(void *)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = (const void *)CalCalendarCopyStore();
  BOOL v5 = [(ClientConnection *)self isStoreManaged:v4];
  if (v4) {
    CFRelease(v4);
  }
  return v5;
}

- (BOOL)isCalendarItemManaged:(void *)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = (const void *)CalCalendarItemCopyCalendar();
  BOOL v5 = [(ClientConnection *)self isCalendarManaged:v4];
  if (v4) {
    CFRelease(v4);
  }
  return v5;
}

- (void)reportIntegrityErrors:(id)a3
{
  id v4 = a3;
  id v5 = [(ClientConnection *)self remoteObjectProxyWithErrorHandler:&__block_literal_global_62];
  [v5 CADClientReceiveDatabaseIntegrityErrors:v4];
}

void __42__ClientConnection_reportIntegrityErrors___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  unsigned int v3 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1BBC88000, v3, OS_LOG_TYPE_ERROR, "Error sending integrity errors back to client: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (CDBAccountInfo)localAccountInfo
{
  unsigned int v3 = [(ClientConnection *)self databaseInitializationOptions];
  int v4 = [v3 unitTesting];

  if (v4)
  {
    id v5 = self;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F57450] sharedInstance];
  }
  return (CDBAccountInfo *)v5;
}

- (BOOL)addressIsAccountOwner:(id)a3
{
  unsigned int v3 = [a3 stringRemovingMailto];
  char v4 = [v3 isEqualToString:@"attendee@localattendee.apple.com"];

  return v4;
}

- (BOOL)addressURLIsAccountOwner:(id)a3
{
  char v4 = [a3 absoluteString];
  LOBYTE(self) = [(ClientConnection *)self addressIsAccountOwner:v4];

  return (char)self;
}

- (void)setLocalAccountInfo:(id)a3
{
}

- (CADXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

@end