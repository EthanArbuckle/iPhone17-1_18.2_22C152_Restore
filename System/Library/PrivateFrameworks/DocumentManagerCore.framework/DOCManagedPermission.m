@interface DOCManagedPermission
+ (id)defaultPermission;
- (ACAccountStore)accountStore;
- (BOOL)adoptPersona:(id)a3 andPerformBlock:(id)a4;
- (BOOL)adoptPersonaFromDomain:(id)a3 andPerformBlock:(id)a4;
- (BOOL)adoptPersonaFromItem:(id)a3 andPerformBlock:(id)a4;
- (BOOL)adoptPersonaFromItems:(id)a3 andPerformBlock:(id)a4;
- (BOOL)adoptPersonaliCloudPersonaAndPerformBlock:(id)a3;
- (BOOL)canAppWithBundleIdentifier:(id)a3 performAction:(unint64_t)a4 accountIdentifier:(id)a5;
- (BOOL)canAppWithBundleIdentifier:(id)a3 performAction:(unint64_t)a4 bundleIdentifier:(id)a5;
- (BOOL)canAppWithBundleIdentifier:(id)a3 performAction:(unint64_t)a4 item:(id)a5;
- (BOOL)canAppWithConfiguration:(id)a3 handleNode:(id)a4;
- (BOOL)canAppWithDataOwnerState:(unint64_t)a3 performAction:(unint64_t)a4 dataOwnerState:(unint64_t)a5;
- (BOOL)canAppWithDataOwnerState:(unint64_t)a3 performAction:(unint64_t)a4 node:(id)a5;
- (BOOL)canCopyItems:(id)a3;
- (BOOL)canCopySourceIsContentManaged:(BOOL)a3;
- (BOOL)canCopyfromContainingBundleIdentifer:(id)a3;
- (BOOL)canHostAppPerformAction:(unint64_t)a3 accountIdentifier:(id)a4;
- (BOOL)canHostAppPerformAction:(unint64_t)a3 bundleIdentifier:(id)a4;
- (BOOL)canHostAppPerformAction:(unint64_t)a3 fileProviderDomain:(id)a4;
- (BOOL)canHostAppPerformAction:(unint64_t)a3 legacyPickerExtension:(id)a4;
- (BOOL)canHostAppPerformAction:(unint64_t)a3 targetNode:(id)a4;
- (BOOL)canItem:(id)a3 performAction:(unint64_t)a4 item:(id)a5;
- (BOOL)canItems:(id)a3 performAction:(unint64_t)a4 fileProviderDomain:(id)a5;
- (BOOL)hasAnyEffectiveRestrictions;
- (BOOL)hasOpenInRestrictions;
- (BOOL)isCurrentPersonaEnterprise;
- (BOOL)isLocalStorageAllowed;
- (BOOL)isManagedAppsCloudSyncAllowed;
- (BOOL)isManagedAppsCloudSyncDisallowed;
- (BOOL)isNetworkDriveAllowed;
- (BOOL)isUSBAccessAllowed;
- (BOOL)mayOpenFromManagedToUnmanaged;
- (BOOL)mayOpenFromUnmanagedToManaged;
- (DOCManagedPermission)init;
- (NSCache)appContainerIDCache;
- (NSCache)cache;
- (NSDictionary)personaStringForDomainID;
- (NSString)hostIdentifier;
- (id)allowedFileProviderBundleIdentifiersForHostBundleIdentifier:(id)a3;
- (id)appContainerBundleIDForFPItem:(id)a3;
- (id)defaultFileProviderForAppBundle:(id)a3;
- (id)personaStringFromItem:(id)a3;
- (id)queueFileDataForAcceptance:(id)a3 originalFileName:(id)a4 forBundleID:(id)a5 outError:(id *)a6;
- (unint64_t)dataOwnerStateForAccountIdentifier:(id)a3;
- (unint64_t)dataOwnerStateForBundleIdentifier:(id)a3;
- (unint64_t)dataOwnerStateForConfiguration:(id)a3;
- (unint64_t)dataOwnerStateForFPDomain:(id)a3;
- (unint64_t)dataOwnerStateForItem:(id)a3;
- (unint64_t)dataOwnerStateForItems:(id)a3;
- (unint64_t)dataOwnerStateForNode:(id)a3;
- (unint64_t)dataOwnerStateForiCloudDomain:(id)a3;
- (unint64_t)hostAccountDataOwnerState;
- (unint64_t)userActionForConfiguration:(id)a3;
- (void)_loadSharedConnectionValues;
- (void)cachePersonaStringForProviders:(id)a3;
- (void)cleanAppContainerBundleIDCache;
- (void)dealloc;
- (void)resetAllCachedPermissions;
- (void)setAccountStore:(id)a3;
- (void)setAppContainerIDCache:(id)a3;
- (void)setCache:(id)a3;
- (void)setHostAccountDataOwnerState:(unint64_t)a3;
- (void)setHostIdentifier:(id)a3;
- (void)setPersonaStringForDomainID:(id)a3;
@end

@implementation DOCManagedPermission

- (id)allowedFileProviderBundleIdentifiersForHostBundleIdentifier:(id)a3
{
  id v4 = a3;
  if ([(DOCManagedPermission *)self hasAnyEffectiveRestrictions])
  {
    v5 = +[DOCManagedPermission defaultPermission];
    [v5 setHostIdentifier:v4];

    v6 = (void *)MEMORY[0x263F054C8];
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    v12 = __84__DOCManagedPermission_allowedFileProviderBundleIdentifiersForHostBundleIdentifier___block_invoke;
    v13 = &unk_2641B5C90;
    id v14 = v4;
    v15 = self;
    v7 = [v6 allowedFileProviderBundleIdentifiersFiltered:&v10];
    v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)canHostAppPerformAction:(unint64_t)a3 fileProviderDomain:(id)a4
{
  id v7 = a4;
  v8 = [(DOCManagedPermission *)self hostIdentifier];

  if (!v8)
  {
    v30 = [MEMORY[0x263F08690] currentHandler];
    [v30 handleFailureInMethod:a2 object:self file:@"DOCManagedPermission.m" lineNumber:223 description:@"Missing hostIdentifier"];
  }
  BOOL v9 = [(DOCManagedPermission *)self hasAnyEffectiveRestrictions];
  id v10 = v7;
  if (!v10
    || (id)objc_opt_class() == v10
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && ![v10 length])
  {

    goto LABEL_10;
  }
  objc_opt_class();
  BOOL v11 = (objc_opt_isKindOfClass() & 1) != 0 && [v10 count] == 0;

  char v12 = 1;
  if (!v11 && v9)
  {
    id v14 = [v10 providerID];
    int v15 = [@"com.apple.FileProvider.LocalStorage" isEqualToString:v14];

    if (v15)
    {
      BOOL v16 = [(DOCManagedPermission *)self isLocalStorageAllowed];
LABEL_17:
      char v12 = v16;
      goto LABEL_11;
    }
    v17 = [v10 providerID];
    int v18 = [@"com.apple.filesystems.UserFS.FileProvider" isEqualToString:v17];

    if (v18)
    {
      if (![(DOCManagedPermission *)self isUSBAccessAllowed])
      {
        char v12 = 0;
        goto LABEL_11;
      }
      v19 = [(DOCManagedPermission *)self hostIdentifier];
      unint64_t v20 = [(DOCManagedPermission *)self dataOwnerStateForBundleIdentifier:v19];

      BOOL v16 = [(DOCManagedPermission *)self canAppWithDataOwnerState:v20 performAction:a3 dataOwnerState:2];
      goto LABEL_17;
    }
    v21 = [(DOCManagedPermission *)self hostIdentifier];
    int v22 = [@"com.apple.DocumentsApp" isEqualToString:v21];

    if ((v22 & 1) == 0)
    {
      if ([v10 isiCloudDriveProvider])
      {
        v23 = [(DOCManagedPermission *)self hostIdentifier];
        unint64_t v24 = [(DOCManagedPermission *)self dataOwnerStateForBundleIdentifier:v23];

        unint64_t v25 = [(DOCManagedPermission *)self dataOwnerStateForiCloudDomain:v10];
        BOOL v26 = [(DOCManagedPermission *)self isLocalStorageAllowed];
        BOOL v27 = [(DOCManagedPermission *)self isManagedAppsCloudSyncAllowed];
        BOOL v28 = [(DOCManagedPermission *)self canAppWithDataOwnerState:v24 performAction:a3 dataOwnerState:v25];
        char v12 = !v26;
        if (v26 && v28) {
          char v12 = v24 != 1 || v27;
        }
      }
      else
      {
        v29 = [v10 topLevelBundleIdentifier];
        char v12 = [(DOCManagedPermission *)self canHostAppPerformAction:a3 bundleIdentifier:v29];
      }
      goto LABEL_11;
    }
LABEL_10:
    char v12 = 1;
  }
LABEL_11:

  return v12;
}

- (BOOL)canHostAppPerformAction:(unint64_t)a3 bundleIdentifier:(id)a4
{
  id v7 = a4;
  v8 = [(DOCManagedPermission *)self hostIdentifier];

  if (!v8)
  {
    char v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"DOCManagedPermission.m" lineNumber:292 description:@"Missing hostIdentifier"];
  }
  BOOL v9 = [(DOCManagedPermission *)self hostIdentifier];
  BOOL v10 = [(DOCManagedPermission *)self canAppWithBundleIdentifier:v9 performAction:a3 bundleIdentifier:v7];

  return v10;
}

- (BOOL)canHostAppPerformAction:(unint64_t)a3 targetNode:(id)a4
{
  id v7 = a4;
  v8 = [(DOCManagedPermission *)self hostIdentifier];

  if (!v8)
  {
    int v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"DOCManagedPermission.m" lineNumber:270 description:@"Missing hostIdentifier"];
  }
  BOOL v9 = [(DOCManagedPermission *)self hostIdentifier];
  char v10 = [@"com.apple.DocumentsApp" isEqualToString:v9];

  if (v10)
  {
    BOOL v11 = 1;
  }
  else
  {
    char v12 = [(DOCManagedPermission *)self hostIdentifier];
    unint64_t v13 = [(DOCManagedPermission *)self dataOwnerStateForBundleIdentifier:v12];

    BOOL v11 = [(DOCManagedPermission *)self canAppWithDataOwnerState:v13 performAction:a3 node:v7];
  }

  return v11;
}

- (NSString)hostIdentifier
{
  return self->_hostIdentifier;
}

- (BOOL)canAppWithBundleIdentifier:(id)a3 performAction:(unint64_t)a4 bundleIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (![(DOCManagedPermission *)self hasOpenInRestrictions]) {
    goto LABEL_19;
  }
  id v10 = v9;
  if (!v10
    || (id)objc_opt_class() == v10
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && ![v10 length])
  {
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [v10 count];

      if (!v11) {
        goto LABEL_19;
      }
    }
    else
    {
    }
    id v12 = v8;
    if (!v12
      || (id)objc_opt_class() == v12
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && ![v12 length])
    {
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v13 = [v12 count];

        if (!v13) {
          goto LABEL_19;
        }
      }
      else
      {
      }
      if (([@"com.apple.DocumentsApp" isEqualToString:v12] & 1) == 0)
      {
        BOOL v14 = [(DOCManagedPermission *)self canAppWithDataOwnerState:[(DOCManagedPermission *)self dataOwnerStateForBundleIdentifier:v12] performAction:a4 dataOwnerState:[(DOCManagedPermission *)self dataOwnerStateForBundleIdentifier:v10]];
        goto LABEL_20;
      }
    }
  }
LABEL_19:
  BOOL v14 = 1;
LABEL_20:

  return v14;
}

- (BOOL)hasAnyEffectiveRestrictions
{
  if ([(DOCManagedPermission *)self hasOpenInRestrictions]
    || [(DOCManagedPermission *)self isManagedAppsCloudSyncDisallowed]
    || ![(DOCManagedPermission *)self isUSBAccessAllowed]
    || ![(DOCManagedPermission *)self isNetworkDriveAllowed])
  {
    return 1;
  }
  else
  {
    return ![(DOCManagedPermission *)self isLocalStorageAllowed];
  }
}

- (BOOL)isUSBAccessAllowed
{
  return self->_isUSBAccessAllowed;
}

- (BOOL)hasOpenInRestrictions
{
  return self->_hasOpenInRestrictions;
}

- (BOOL)isNetworkDriveAllowed
{
  return self->_isNetworkDriveAccessInFilesAllowed;
}

- (void)_loadSharedConnectionValues
{
  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (!obj->_didLoadSharedConnectionValues)
  {
    v3 = [MEMORY[0x263F53C50] sharedConnection];
    obj->_mayOpenFromManagedToUnmanaged = [v3 mayOpenFromManagedToUnmanaged];
    obj->_mayOpenFromUnmanagedToManaged = [v3 mayOpenFromUnmanagedToManaged];
    obj->_isManagedAppsCloudSyncDisallowed = [v3 BOOLRestrictionForFeature:*MEMORY[0x263F53968]] == 2;
    obj->_isUSBAccessAllowed = [v3 BOOLRestrictionForFeature:*MEMORY[0x263F53A88]] != 2;
    obj->_isNetworkDriveAccessInFilesAllowed = [v3 isNetworkDriveAccessInFilesAllowed];
    obj->_isLocalStorageAllowed = [v3 isLocalStorageAllowed];
    obj->_hasOpenInRestrictions = [v3 isOpenInRestrictionInEffect];
    obj->_didLoadSharedConnectionValues = 1;

    v2 = obj;
  }
  objc_sync_exit(v2);
}

- (BOOL)isManagedAppsCloudSyncDisallowed
{
  return self->_isManagedAppsCloudSyncDisallowed;
}

- (BOOL)isLocalStorageAllowed
{
  return self->_isLocalStorageAllowed;
}

- (unint64_t)userActionForConfiguration:(id)a3
{
  return [a3 forPickingFolders] ^ 1;
}

uint64_t __41__DOCManagedPermission_defaultPermission__block_invoke()
{
  defaultPermission_manager = objc_alloc_init(DOCManagedPermission);
  return MEMORY[0x270F9A758]();
}

- (void)setHostIdentifier:(id)a3
{
  v5 = (NSString *)a3;
  p_hostIdentifier = &self->_hostIdentifier;
  if (self->_hostIdentifier != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_hostIdentifier, a3);
    id v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 postNotificationName:@"DOCManagedPermissionHostIdentifierDidChangeNotification" object:self];

    v5 = v8;
  }
  MEMORY[0x270F9A758](p_hostIdentifier, v5);
}

+ (id)defaultPermission
{
  if (defaultPermission_onceToken != -1) {
    dispatch_once(&defaultPermission_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)defaultPermission_manager;
  return v2;
}

- (void)setHostAccountDataOwnerState:(unint64_t)a3
{
  self->_hostAccountDataOwnerState = a3;
}

- (BOOL)adoptPersonaliCloudPersonaAndPerformBlock:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = [(DOCManagedPermission *)v5 personaStringForDomainID];
  int v7 = FPIsCloudDocsWithFPFSEnabled();
  id v8 = DOCDocumentSourceIdentifierICloudFPFS;
  if (!v7) {
    id v8 = DOCDocumentSourceIdentifierICloudFPv2;
  }
  id v9 = *v8;
  id v10 = [v6 objectForKeyedSubscript:v9];

  BOOL v11 = [(DOCManagedPermission *)v5 adoptPersona:v10 andPerformBlock:v4];
  objc_sync_exit(v5);

  return v11;
}

- (NSDictionary)personaStringForDomainID
{
  return self->_personaStringForDomainID;
}

- (BOOL)adoptPersona:(id)a3 andPerformBlock:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = (void (**)(void))a4;
  int v7 = [MEMORY[0x263F841B0] sharedManager];
  id v8 = [v7 currentPersona];

  if ([v8 isSystemPersona])
  {
    id v20 = 0;
    id v9 = (void *)[v8 copyCurrentPersonaContextWithError:&v20];
    id v10 = v20;
    BOOL v11 = docPersonaLogHandle;
    if (!docPersonaLogHandle)
    {
      DOCInitLogging();
      BOOL v11 = docPersonaLogHandle;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v8;
      _os_log_impl(&dword_213670000, v11, OS_LOG_TYPE_DEFAULT, "Copying current Persona into context. Persona: (%@)", buf, 0xCu);
    }
    id v12 = docPersonaLogHandle;
    if (v10)
    {
      if (!docPersonaLogHandle)
      {
        DOCInitLogging();
        id v12 = docPersonaLogHandle;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[DOCManagedPermission adoptPersona:andPerformBlock:]();
      }
    }
    else
    {
      if (!docPersonaLogHandle)
      {
        DOCInitLogging();
        id v12 = docPersonaLogHandle;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v5;
        _os_log_impl(&dword_213670000, v12, OS_LOG_TYPE_DEFAULT, "Generating and Restoring Persona from String. Persona String: (%@)", buf, 0xCu);
      }
      uint64_t v15 = [v8 generateAndRestorePersonaContextWithIdentityString:v5];
      BOOL v16 = docPersonaLogHandle;
      if (v15)
      {
        id v10 = (id)v15;
        if (!docPersonaLogHandle)
        {
          DOCInitLogging();
          BOOL v16 = docPersonaLogHandle;
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[DOCManagedPermission adoptPersona:andPerformBlock:]();
        }
      }
      else
      {
        if (!docPersonaLogHandle)
        {
          DOCInitLogging();
          BOOL v16 = docPersonaLogHandle;
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_213670000, v16, OS_LOG_TYPE_DEFAULT, "Executing Block with temporary Persona", buf, 2u);
        }
        v6[2](v6);
        int v18 = docPersonaLogHandle;
        if (!docPersonaLogHandle)
        {
          DOCInitLogging();
          int v18 = docPersonaLogHandle;
        }
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v22 = v9;
          _os_log_impl(&dword_213670000, v18, OS_LOG_TYPE_DEFAULT, "Restoring Persona from context : %@", buf, 0xCu);
        }
        id v10 = [v8 restorePersonaWithSavedPersonaContext:v9];
        if (!v10)
        {
          BOOL v14 = 1;
          goto LABEL_26;
        }
        v19 = docPersonaLogHandle;
        if (!docPersonaLogHandle)
        {
          DOCInitLogging();
          v19 = docPersonaLogHandle;
        }
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[DOCManagedPermission adoptPersona:andPerformBlock:]();
        }
      }
    }
    v6[2](v6);
    BOOL v14 = 0;
LABEL_26:

    goto LABEL_27;
  }
  uint64_t v13 = docPersonaLogHandle;
  if (!docPersonaLogHandle)
  {
    DOCInitLogging();
    uint64_t v13 = docPersonaLogHandle;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v8;
    _os_log_impl(&dword_213670000, v13, OS_LOG_TYPE_DEFAULT, "App already has a persona that's not system, just execute the block. Persona: (%@)", buf, 0xCu);
  }
  v6[2](v6);
  BOOL v14 = 0;
LABEL_27:

  return v14;
}

- (DOCManagedPermission)init
{
  v9.receiver = self;
  v9.super_class = (Class)DOCManagedPermission;
  v2 = [(DOCManagedPermission *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_hostAccountDataOwnerState = 0;
    id v4 = objc_alloc_init(MEMORY[0x263EFF8E0]);
    [(DOCManagedPermission *)v3 setCache:v4];

    id v5 = objc_alloc_init(MEMORY[0x263EFF8E0]);
    [(DOCManagedPermission *)v3 setAppContainerIDCache:v5];

    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(DOCManagedPermission *)v3 setPersonaStringForDomainID:v6];

    int v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v3 selector:sel_resetAllCachedPermissions name:*MEMORY[0x263F536E0] object:0];
    [v7 addObserver:v3 selector:sel_resetAllCachedPermissions name:*MEMORY[0x263F53AF8] object:0];
    [v7 addObserver:v3 selector:sel_resetAllCachedPermissions name:*MEMORY[0x263F53AF0] object:0];
  }
  return v3;
}

- (void)cachePersonaStringForProviders:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        BOOL v11 = objc_msgSend(v10, "personaIdentifier", (void)v14);
        id v12 = [v10 identifier];
        [v5 setObject:v11 forKeyedSubscript:v12];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  uint64_t v13 = self;
  objc_sync_enter(v13);
  [(DOCManagedPermission *)v13 setPersonaStringForDomainID:v5];
  objc_sync_exit(v13);
}

- (void)setPersonaStringForDomainID:(id)a3
{
}

- (void)setCache:(id)a3
{
}

- (void)setAppContainerIDCache:(id)a3
{
}

- (BOOL)canHostAppPerformAction:(unint64_t)a3 legacyPickerExtension:(id)a4
{
  id v7 = a4;
  uint64_t v8 = [(DOCManagedPermission *)self hostIdentifier];

  if (!v8)
  {
    id v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"DOCManagedPermission.m" lineNumber:284 description:@"Missing hostIdentifier"];
  }
  objc_super v9 = [v7 identifier];
  BOOL v10 = [(DOCManagedPermission *)self canHostAppPerformAction:a3 bundleIdentifier:v9];

  return v10;
}

- (unint64_t)dataOwnerStateForBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (!v4
    || (id)objc_opt_class() == v4
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && ![v4 length])
  {

LABEL_9:
    unint64_t v6 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 count];

    if (!v5) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  uint64_t v8 = [(DOCManagedPermission *)self hostIdentifier];
  if ([v4 isEqualToString:v8])
  {
    unint64_t v9 = [(DOCManagedPermission *)self hostAccountDataOwnerState];

    if (v9)
    {
      unint64_t v6 = [(DOCManagedPermission *)self hostAccountDataOwnerState];
      goto LABEL_10;
    }
  }
  else
  {
  }
  BOOL v10 = [(DOCManagedPermission *)self cache];
  uint64_t v11 = containingBundleForBundle(v4, v10);
  id v12 = (void *)v11;
  if (v11) {
    uint64_t v13 = (void *)v11;
  }
  else {
    uint64_t v13 = v4;
  }
  id v14 = v13;

  long long v15 = [MEMORY[0x263F53C50] sharedConnection];
  int v16 = [v15 isAppManaged:v14];

  if (v16) {
    unint64_t v6 = 1;
  }
  else {
    unint64_t v6 = 2;
  }

LABEL_10:
  return v6;
}

- (unint64_t)hostAccountDataOwnerState
{
  return self->_hostAccountDataOwnerState;
}

- (NSCache)cache
{
  return self->_cache;
}

- (void)resetAllCachedPermissions
{
  obj = self;
  objc_sync_enter(obj);
  v2 = [(DOCManagedPermission *)obj cache];
  [v2 removeAllObjects];

  obj->_didLoadSharedConnectionValues = 0;
  objc_sync_exit(obj);
}

- (BOOL)mayOpenFromManagedToUnmanaged
{
  return self->_mayOpenFromManagedToUnmanaged;
}

- (BOOL)mayOpenFromUnmanagedToManaged
{
  return self->_mayOpenFromUnmanagedToManaged;
}

- (BOOL)isManagedAppsCloudSyncAllowed
{
  return ![(DOCManagedPermission *)self isManagedAppsCloudSyncDisallowed];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:*MEMORY[0x263F536E0]];
  [v3 removeObserver:*MEMORY[0x263F53AF8]];
  [v3 removeObserver:*MEMORY[0x263F53AF0]];

  v4.receiver = self;
  v4.super_class = (Class)DOCManagedPermission;
  [(DOCManagedPermission *)&v4 dealloc];
}

- (BOOL)canHostAppPerformAction:(unint64_t)a3 accountIdentifier:(id)a4
{
  id v7 = a4;
  uint64_t v8 = [(DOCManagedPermission *)self hostIdentifier];

  if (!v8)
  {
    id v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"DOCManagedPermission.m" lineNumber:299 description:@"Missing hostIdentifier"];
  }
  unint64_t v9 = [(DOCManagedPermission *)self hostIdentifier];
  BOOL v10 = [(DOCManagedPermission *)self canAppWithBundleIdentifier:v9 performAction:a3 accountIdentifier:v7];

  return v10;
}

- (BOOL)canItem:(id)a3 performAction:(unint64_t)a4 item:(id)a5
{
  id v8 = a5;
  unint64_t v9 = [(DOCManagedPermission *)self dataOwnerStateForNode:a3];
  unint64_t v10 = [(DOCManagedPermission *)self dataOwnerStateForNode:v8];

  return [(DOCManagedPermission *)self canAppWithDataOwnerState:v9 performAction:a4 dataOwnerState:v10];
}

- (BOOL)canItems:(id)a3 performAction:(unint64_t)a4 fileProviderDomain:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  unint64_t v10 = [v8 firstObject];

  if (v10)
  {
    uint64_t v11 = [v9 providerID];
    int v12 = [@"com.apple.FileProvider.LocalStorage" isEqualToString:v11];

    if (v12)
    {
      BOOL v13 = [(DOCManagedPermission *)self isLocalStorageAllowed];
    }
    else
    {
      long long v15 = [v8 firstObject];
      unint64_t v16 = [(DOCManagedPermission *)self dataOwnerStateForNode:v15];

      BOOL v13 = [(DOCManagedPermission *)self canAppWithDataOwnerState:v16 performAction:a4 dataOwnerState:[(DOCManagedPermission *)self dataOwnerStateForFPDomain:v9]];
    }
    BOOL v14 = v13;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)canAppWithDataOwnerState:(unint64_t)a3 performAction:(unint64_t)a4 node:(id)a5
{
  unint64_t v8 = [(DOCManagedPermission *)self dataOwnerStateForNode:a5];
  return [(DOCManagedPermission *)self canAppWithDataOwnerState:a3 performAction:a4 dataOwnerState:v8];
}

- (BOOL)canAppWithConfiguration:(id)a3 handleNode:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(DOCManagedPermission *)self dataOwnerStateForConfiguration:v7];
  unint64_t v9 = [(DOCManagedPermission *)self userActionForConfiguration:v7];

  LOBYTE(v7) = [(DOCManagedPermission *)self canAppWithDataOwnerState:v8 performAction:v9 node:v6];
  return (char)v7;
}

- (BOOL)canAppWithBundleIdentifier:(id)a3 performAction:(unint64_t)a4 item:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (![(DOCManagedPermission *)self hasOpenInRestrictions]) {
    goto LABEL_10;
  }
  id v10 = v8;
  if (!v10
    || (id)objc_opt_class() == v10
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && ![v10 length])
  {
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [v10 count];

      if (!v11) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    if (([@"com.apple.DocumentsApp" isEqualToString:v10] & 1) == 0)
    {
      BOOL v12 = [(DOCManagedPermission *)self canAppWithDataOwnerState:[(DOCManagedPermission *)self dataOwnerStateForBundleIdentifier:v10] performAction:a4 dataOwnerState:[(DOCManagedPermission *)self dataOwnerStateForNode:v9]];
      goto LABEL_11;
    }
  }
LABEL_10:
  BOOL v12 = 1;
LABEL_11:

  return v12;
}

- (BOOL)canAppWithBundleIdentifier:(id)a3 performAction:(unint64_t)a4 accountIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (![(DOCManagedPermission *)self hasOpenInRestrictions]) {
    goto LABEL_19;
  }
  id v10 = v9;
  if (!v10
    || (id)objc_opt_class() == v10
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && ![v10 length])
  {
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [v10 count];

      if (!v11) {
        goto LABEL_19;
      }
    }
    else
    {
    }
    id v12 = v8;
    if (!v12
      || (id)objc_opt_class() == v12
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && ![v12 length])
    {
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v13 = [v12 count];

        if (!v13) {
          goto LABEL_19;
        }
      }
      else
      {
      }
      if (([@"com.apple.DocumentsApp" isEqualToString:v12] & 1) == 0)
      {
        BOOL v14 = [(DOCManagedPermission *)self canAppWithDataOwnerState:[(DOCManagedPermission *)self dataOwnerStateForBundleIdentifier:v12] performAction:a4 dataOwnerState:[(DOCManagedPermission *)self dataOwnerStateForAccountIdentifier:v10]];
        goto LABEL_20;
      }
    }
  }
LABEL_19:
  BOOL v14 = 1;
LABEL_20:

  return v14;
}

- (BOOL)canAppWithDataOwnerState:(unint64_t)a3 performAction:(unint64_t)a4 dataOwnerState:(unint64_t)a5
{
  int v7 = a3 == 1;
  int v8 = a5 == 1;
  BOOL v9 = [(DOCManagedPermission *)self mayOpenFromManagedToUnmanaged];
  BOOL v10 = [(DOCManagedPermission *)self mayOpenFromUnmanagedToManaged];
  BOOL v11 = 1;
  if (v7 != v8 && (!v9 || !v10))
  {
    if (a4 == 2) {
      int v12 = v8;
    }
    else {
      int v12 = v7;
    }
    if (a4 == 1) {
      int v13 = v8;
    }
    else {
      int v13 = v7;
    }
    if (v12) {
      BOOL v14 = v13 == 0;
    }
    else {
      BOOL v14 = 0;
    }
    int v15 = !v14 || v9;
    if (v12) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = v10;
    }
    if (!v13) {
      BOOL v11 = 1;
    }
    if (v15 != 1) {
      BOOL v11 = 0;
    }
    if (!a4) {
      return 0;
    }
  }
  return v11;
}

- (unint64_t)dataOwnerStateForNode:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unint64_t v5 = 0;
      goto LABEL_11;
    }
    id v6 = [MEMORY[0x263F397B0] appLibraryNodeForNode:v4];
    int v7 = v6;
    if (v6)
    {
      int v8 = [v6 appIdentifier];
      unint64_t v9 = [(DOCManagedPermission *)self dataOwnerStateForBundleIdentifier:v8];
    }
    else
    {
      BOOL v10 = (void *)MEMORY[0x263F054C8];
      BOOL v11 = [v4 providerDomainID];
      int v8 = [v10 providerDomainWithID:v11 cachePolicy:2 error:0];

      if (!v8)
      {
        unint64_t v5 = 0;
        goto LABEL_10;
      }
      unint64_t v9 = [(DOCManagedPermission *)self dataOwnerStateForFPDomain:v8];
    }
    unint64_t v5 = v9;
LABEL_10:

    goto LABEL_11;
  }
  unint64_t v5 = [(DOCManagedPermission *)self dataOwnerStateForItem:v4];
LABEL_11:

  return v5;
}

- (unint64_t)dataOwnerStateForItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 providerID];
  if (([v5 hasPrefix:@"com.apple.CloudDocs.iCloudDriveFileProvider"] & 1) == 0
    && ([v5 hasPrefix:@"com.apple.CloudDocs.iCloudDriveFileProviderManaged"] & 1) == 0
    && ![v5 hasPrefix:@"com.apple.CloudDocs.MobileDocumentsFileProvider"])
  {
    int v10 = [v5 hasPrefix:@"com.apple.CloudDocs.MobileDocumentsFileProviderManaged"];

    if (v10) {
      goto LABEL_5;
    }
    BOOL v11 = [v4 providerDomainID];
    int v12 = [@"com.apple.FileProvider.LocalStorage" isEqualToString:v11];

    if (!v12)
    {
      id v6 = [v4 providerID];
      goto LABEL_16;
    }
    int v13 = [v4 parentItemIdentifier];
    BOOL v14 = v13;
    if (v13)
    {
      if ([v13 isEqualToString:*MEMORY[0x263F053F0]])
      {
        int v15 = objc_msgSend(v4, "fp_appContainerBundleIdentifier");
        goto LABEL_19;
      }
      if ([(DOCManagedPermission *)self hasAnyEffectiveRestrictions])
      {
        int v15 = [(DOCManagedPermission *)self appContainerBundleIDForFPItem:v4];
LABEL_19:
        id v6 = v15;
        if (v6)
        {
          if ((id)objc_opt_class() != v6)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || [v6 length])
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v16 = [v6 count];

                if (!v16) {
                  goto LABEL_28;
                }
              }
              else
              {
              }
LABEL_16:
              unint64_t v7 = [(DOCManagedPermission *)self dataOwnerStateForBundleIdentifier:v6];
              goto LABEL_7;
            }
          }
        }

LABEL_28:
        unint64_t v8 = 2;
        goto LABEL_9;
      }
    }
    id v6 = 0;
    goto LABEL_28;
  }

LABEL_5:
  id v6 = [MEMORY[0x263F054C8] providerDomainForItem:v4 cachePolicy:3 error:0];
  if (!v6)
  {
    unint64_t v8 = 0;
    goto LABEL_9;
  }
  unint64_t v7 = [(DOCManagedPermission *)self dataOwnerStateForiCloudDomain:v6];
LABEL_7:
  unint64_t v8 = v7;
LABEL_9:

  return v8;
}

- (unint64_t)dataOwnerStateForItems:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    id v6 = [v5 objectAtIndexedSubscript:0];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          int v12 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "providerDomainID", (void)v19);
          int v13 = [v6 providerDomainID];
          char v14 = [v12 isEqual:v13];

          if ((v14 & 1) == 0)
          {
            long long v17 = docPersonaLogHandle;
            if (!docPersonaLogHandle)
            {
              DOCInitLogging();
              long long v17 = docPersonaLogHandle;
            }
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              -[DOCManagedPermission dataOwnerStateForItems:]();
            }
            goto LABEL_21;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_21:

    unint64_t v16 = [(DOCManagedPermission *)self dataOwnerStateForNode:v6];
  }
  else
  {
    int v15 = docPersonaLogHandle;
    if (!docPersonaLogHandle)
    {
      DOCInitLogging();
      int v15 = docPersonaLogHandle;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[DOCManagedPermission dataOwnerStateForItems:]();
    }
    unint64_t v16 = 0;
  }

  return v16;
}

- (unint64_t)dataOwnerStateForFPDomain:(id)a3
{
  id v4 = a3;
  if ([v4 isiCloudDriveProvider])
  {
    unint64_t v5 = [(DOCManagedPermission *)self dataOwnerStateForiCloudDomain:v4];
  }
  else
  {
    uint64_t v6 = [v4 topLevelBundleIdentifier];

    unint64_t v5 = [(DOCManagedPermission *)self dataOwnerStateForBundleIdentifier:v6];
    id v4 = (id)v6;
  }

  return v5;
}

- (unint64_t)dataOwnerStateForiCloudDomain:(id)a3
{
  id v5 = a3;
  if (([v5 isiCloudDriveProvider] & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"DOCManagedPermission.m", 554, @"Expect isiCloudDriveProvider to be true, check if DOCDocumentSourceIdentifierICloud is out of date" object file lineNumber description];
  }
  if ([v5 isEnterpriseDomain]) {
    unint64_t v6 = 1;
  }
  else {
    unint64_t v6 = 2;
  }

  return v6;
}

- (unint64_t)dataOwnerStateForAccountIdentifier:(id)a3
{
  id v4 = a3;
  if (!v4
    || (id)objc_opt_class() == v4
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && ![v4 length])
  {
    unint64_t v6 = 2;
    id v7 = v4;
LABEL_18:

    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_10;
  }
  uint64_t v5 = [v4 count];

  if (v5)
  {
LABEL_10:
    if (!self->_accountStore)
    {
      uint64_t v8 = (ACAccountStore *)objc_alloc_init(MEMORY[0x263EFB210]);
      accountStore = self->_accountStore;
      self->_accountStore = v8;
    }
    uint64_t v10 = [v4 componentsSeparatedByString:@"."];
    id v7 = [v10 firstObject];

    BOOL v11 = [(ACAccountStore *)self->_accountStore accountWithIdentifier:v7];
    int v12 = v11;
    if (v11)
    {
      if (objc_msgSend(v11, "aa_isManagedAppleID")) {
        unint64_t v6 = 1;
      }
      else {
        unint64_t v6 = 2;
      }
    }
    else
    {
      unint64_t v6 = 0;
    }

    goto LABEL_18;
  }
  unint64_t v6 = 2;
LABEL_19:

  return v6;
}

- (unint64_t)dataOwnerStateForConfiguration:(id)a3
{
  id v4 = a3;
  if ([v4 isContentManaged])
  {
    unint64_t v5 = 1;
  }
  else
  {
    unint64_t v6 = [v4 hostIdentifier];
    unint64_t v5 = [(DOCManagedPermission *)self dataOwnerStateForBundleIdentifier:v6];
  }
  return v5;
}

- (id)defaultFileProviderForAppBundle:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(DOCManagedPermission *)self cache];
  uint64_t v6 = containingBundleForBundle(v4, v5);
  id v7 = (void *)v6;
  if (v6) {
    uint64_t v8 = (void *)v6;
  }
  else {
    uint64_t v8 = v4;
  }
  id v9 = v8;

  uint64_t v10 = [MEMORY[0x263F53C50] sharedConnection];
  int v11 = [v10 isAppManaged:v9];

  if (v11)
  {
    int v12 = [MEMORY[0x263F53C50] sharedConnection];
    int v13 = [v12 objectRestrictionForFeature:@"MCFeatureManagedAppsDefaultFileProviderAppBundleID"];
  }
  else
  {
    int v13 = 0;
  }

  return v13;
}

- (id)queueFileDataForAcceptance:(id)a3 originalFileName:(id)a4 forBundleID:(id)a5 outError:(id *)a6
{
  id v9 = (void *)MEMORY[0x263F53C50];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  int v13 = [v9 sharedConnection];
  char v14 = [v13 queueFileDataForAcceptance:v12 originalFileName:v11 forBundleID:v10 outError:a6];

  return v14;
}

- (BOOL)canCopyfromContainingBundleIdentifer:(id)a3
{
  BOOL v4 = [(DOCManagedPermission *)self dataOwnerStateForBundleIdentifier:a3] == 1;
  return [(DOCManagedPermission *)self canCopySourceIsContentManaged:v4];
}

- (BOOL)canCopyItems:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(DOCManagedPermission *)self hasOpenInRestrictions]
    && ![(DOCManagedPermission *)self mayOpenFromManagedToUnmanaged])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (-[DOCManagedPermission dataOwnerStateForNode:](self, "dataOwnerStateForNode:", v11, (void)v15) == 1
            || (objc_msgSend(v11, "doc_isAppContainerRoot") & 1) != 0)
          {
LABEL_18:
            BOOL v5 = 0;
            goto LABEL_20;
          }
          id v12 = [v11 providerDomainID];
          if ([v12 isEqualToString:@"com.apple.FileProvider.LocalStorage"])
          {
            int v13 = objc_msgSend(v11, "fp_appContainerBundleIdentifier");

            if (v13) {
              goto LABEL_18;
            }
          }
          else
          {
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        BOOL v5 = 1;
        if (v8) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v5 = 1;
    }
LABEL_20:
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (BOOL)canCopySourceIsContentManaged:(BOOL)a3
{
  if ([(DOCManagedPermission *)self hasOpenInRestrictions]) {
    return [(DOCManagedPermission *)self mayOpenFromManagedToUnmanaged] || !a3;
  }
  else {
    return 1;
  }
}

- (id)appContainerBundleIDForFPItem:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(DOCManagedPermission *)self appContainerIDCache];
  id v6 = [v4 parentItemID];
  uint64_t v7 = [v5 objectForKey:v6];

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    uint64_t v9 = [(DOCManagedPermission *)self appContainerIDCache];
    id v10 = [v4 itemID];
    v34 = [v9 objectForKey:v10];

    id v11 = v34;
    if (v34)
    {
      id v8 = v34;
    }
    else
    {
      uint64_t v46 = 0;
      v47 = &v46;
      uint64_t v48 = 0x3032000000;
      v49 = __Block_byref_object_copy__2;
      v50 = __Block_byref_object_dispose__2;
      id v51 = 0;
      dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
      int v13 = [MEMORY[0x263F054C0] defaultManager];
      char v14 = [v4 itemID];
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __54__DOCManagedPermission_appContainerBundleIDForFPItem___block_invoke;
      v43[3] = &unk_2641B5C68;
      v45 = &v46;
      dispatch_semaphore_t dsema = v12;
      dispatch_semaphore_t v44 = dsema;
      [v13 fetchParentsForItemID:v14 recursively:1 completionHandler:v43];

      dispatch_time_t v15 = dispatch_time(0, 5000000000);
      dispatch_semaphore_wait(dsema, v15);
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v16 = [(id)v47[5] reverseObjectEnumerator];
      id v8 = (id)[v16 countByEnumeratingWithState:&v39 objects:v53 count:16];
      if (v8)
      {
        uint64_t v17 = *(void *)v40;
LABEL_7:
        uint64_t v18 = 0;
        while (1)
        {
          if (*(void *)v40 != v17) {
            objc_enumerationMutation(v16);
          }
          long long v19 = *(void **)(*((void *)&v39 + 1) + 8 * v18);
          uint64_t v20 = objc_msgSend(v19, "fp_appContainerBundleIdentifier");
          BOOL v21 = v20 == 0;

          if (!v21) {
            break;
          }
          if (v8 == (id)++v18)
          {
            id v8 = (id)[v16 countByEnumeratingWithState:&v39 objects:v53 count:16];
            if (v8) {
              goto LABEL_7;
            }
            goto LABEL_25;
          }
        }
        objc_msgSend(v19, "fp_appContainerBundleIdentifier");
        id v8 = (id)objc_claimAutoreleasedReturnValue();

        if (!v8) {
          goto LABEL_26;
        }
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v22 = (id)v47[5];
        uint64_t v23 = [v22 countByEnumeratingWithState:&v35 objects:v52 count:16];
        if (v23)
        {
          uint64_t v24 = *(void *)v36;
          do
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v36 != v24) {
                objc_enumerationMutation(v22);
              }
              BOOL v26 = *(void **)(*((void *)&v35 + 1) + 8 * i);
              if (([v26 isRootItem] & 1) == 0)
              {
                BOOL v27 = [(DOCManagedPermission *)self appContainerIDCache];
                BOOL v28 = [v26 itemID];
                [v27 setObject:v8 forKey:v28];
              }
            }
            uint64_t v23 = [v22 countByEnumeratingWithState:&v35 objects:v52 count:16];
          }
          while (v23);
        }

        v29 = [(DOCManagedPermission *)self appContainerIDCache];
        v30 = [v4 itemID];
        [v29 setObject:v8 forKey:v30];

        long long v16 = [(DOCManagedPermission *)self appContainerIDCache];
        v31 = [v4 parentItemID];
        [v16 setObject:v8 forKey:v31];
      }
LABEL_25:

LABEL_26:
      _Block_object_dispose(&v46, 8);

      id v11 = 0;
    }
  }
  return v8;
}

void __54__DOCManagedPermission_appContainerBundleIDForFPItem___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)cleanAppContainerBundleIDCache
{
  id v2 = [(DOCManagedPermission *)self appContainerIDCache];
  [v2 removeAllObjects];
}

uint64_t __84__DOCManagedPermission_allowedFileProviderBundleIdentifiersForHostBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isAvailableSystemWide] & 1) != 0
    || ([v3 topLevelBundleIdentifier],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isEqualToString:*(void *)(a1 + 32)],
        v4,
        v5))
  {
    uint64_t v6 = [*(id *)(a1 + 40) canHostAppPerformAction:0 fileProviderDomain:v3];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)adoptPersonaFromItem:(id)a3 andPerformBlock:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(DOCManagedPermission *)self personaStringFromItem:a3];
  LOBYTE(self) = [(DOCManagedPermission *)self adoptPersona:v7 andPerformBlock:v6];

  return (char)self;
}

- (BOOL)adoptPersonaFromItems:(id)a3 andPerformBlock:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  if (v6 && [v6 count])
  {
    id v22 = self;
    id v8 = [v6 objectAtIndexedSubscript:0];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          char v14 = [*(id *)(*((void *)&v23 + 1) + 8 * i) providerDomainID];
          dispatch_time_t v15 = [v8 providerDomainID];
          char v16 = [v14 isEqual:v15];

          if ((v16 & 1) == 0)
          {
            long long v19 = docPersonaLogHandle;
            if (!docPersonaLogHandle)
            {
              DOCInitLogging();
              long long v19 = docPersonaLogHandle;
            }
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
              -[DOCManagedPermission adoptPersonaFromItems:andPerformBlock:]();
            }
            goto LABEL_21;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_21:

    uint64_t v20 = [(DOCManagedPermission *)v22 personaStringFromItem:v8];
    BOOL v18 = [(DOCManagedPermission *)v22 adoptPersona:v20 andPerformBlock:v7];
  }
  else
  {
    uint64_t v17 = docPersonaLogHandle;
    if (!docPersonaLogHandle)
    {
      DOCInitLogging();
      uint64_t v17 = docPersonaLogHandle;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[DOCManagedPermission adoptPersonaFromItems:andPerformBlock:]();
    }
    v7[2](v7);
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)adoptPersonaFromDomain:(id)a3 andPerformBlock:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 personaIdentifier];
  LOBYTE(self) = [(DOCManagedPermission *)self adoptPersona:v7 andPerformBlock:v6];

  return (char)self;
}

- (BOOL)isCurrentPersonaEnterprise
{
  id v2 = [MEMORY[0x263F841B0] sharedManager];
  id v3 = [v2 currentPersona];
  char v4 = [v3 isEnterprisePersona];

  return v4;
}

- (id)personaStringFromItem:(id)a3
{
  id v4 = a3;
  int v5 = self;
  objc_sync_enter(v5);
  id v6 = [(DOCManagedPermission *)v5 personaStringForDomainID];
  uint64_t v7 = [v4 providerDomainID];
  id v8 = [v6 objectForKeyedSubscript:v7];

  objc_sync_exit(v5);
  if (!v8)
  {
    id v9 = docPersonaLogHandle;
    if (!docPersonaLogHandle)
    {
      DOCInitLogging();
      id v9 = docPersonaLogHandle;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213670000, v9, OS_LOG_TYPE_DEFAULT, "No cached persona string, trying to fetch domain instead", buf, 2u);
    }
    id v14 = 0;
    uint64_t v10 = [MEMORY[0x263F054C8] providerDomainForItem:v4 cachePolicy:3 error:&v14];
    id v11 = v14;
    if (v11 || !v10)
    {
      uint64_t v12 = docPersonaLogHandle;
      if (!docPersonaLogHandle)
      {
        DOCInitLogging();
        uint64_t v12 = docPersonaLogHandle;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[DOCManagedPermission personaStringFromItem:]((uint64_t)v11, v12);
      }
      id v8 = 0;
    }
    else
    {
      id v8 = [v10 personaIdentifier];
    }
  }
  return v8;
}

- (NSCache)appContainerIDCache
{
  return self->_appContainerIDCache;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_appContainerIDCache, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_personaStringForDomainID, 0);
  objc_storeStrong((id *)&self->_hostIdentifier, 0);
}

- (void)dataOwnerStateForItems:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_213670000, v0, v1, "Can't compute DataOwnerState for empty array of items", v2, v3, v4, v5, v6);
}

- (void)dataOwnerStateForItems:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_213670000, v0, v1, "Trying to compute DataOwnerState for items from different domains. Using DataOwnerState from first item and try anyway", v2, v3, v4, v5, v6);
}

- (void)adoptPersonaFromItems:andPerformBlock:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_213670000, v0, v1, "Can't adopt persona from Items (items array is nil or empty, executing block anyway", v2, v3, v4, v5, v6);
}

- (void)adoptPersonaFromItems:andPerformBlock:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_213670000, v0, v1, "Trying to adopt persona from items from different domains. Adopting persona from first item and try anyway", v2, v3, v4, v5, v6);
}

- (void)adoptPersona:andPerformBlock:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_213670000, v0, v1, "Could not restore current persona contex : Context: (%@) Error: %@");
}

- (void)adoptPersona:andPerformBlock:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_213670000, v0, v1, "Could not adopt persona: (%@) Error: %@");
}

- (void)adoptPersona:andPerformBlock:.cold.3()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_213670000, v0, v1, "Could not copy current persona contex: Persona: (%@) Error: %@");
}

- (void)personaStringFromItem:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_213670000, a2, OS_LOG_TYPE_ERROR, "Couldn't get domain to get the persona string to adopt : %@", (uint8_t *)&v2, 0xCu);
}

@end