@interface NEVPNManager
+ (NEVPNManager)sharedManager;
+ (id)configurationManager;
+ (id)create;
+ (id)loadedManagers;
+ (id)mapError:(uint64_t)a1;
+ (void)loadAllFromPreferencesWithCompletionHandler:(id)a3;
- (BOOL)isEnabled;
- (BOOL)isFromMDM;
- (BOOL)isFromProfile;
- (BOOL)isOnDemandEnabled;
- (BOOL)isProtocolTypeValid:(int64_t)a3;
- (NEConfiguration)configuration;
- (NEProfileIngestionPayloadInfo)configurationPayloadInfo;
- (NEVPNConnection)connection;
- (NEVPNManager)init;
- (NEVPNManager)initWithGrade:(int64_t)a3 connection:(id)a4 tunnelType:(int64_t)a5;
- (NEVPNProtocol)protocolConfiguration;
- (NSArray)onDemandRules;
- (NSString)appBundleIdentifier;
- (NSString)localizedDescription;
- (NSUUID)identifier;
- (id)copyCurrentUserStartOptions;
- (id)createL2TPUserPreferencesWithName:(id)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (void)additionalSetup;
- (void)loadFromPreferencesWithCompletionHandler:(void *)completionHandler;
- (void)removeFromPreferencesWithCompletionHandler:(void *)completionHandler;
- (void)saveToPreferencesWithCompletionHandler:(void *)completionHandler;
- (void)setConfiguration:(id)a3;
- (void)setEnabled:(BOOL)enabled;
- (void)setLocalizedDescription:(NSString *)localizedDescription;
- (void)setOnDemandEnabled:(BOOL)onDemandEnabled;
- (void)setOnDemandRules:(NSArray *)onDemandRules;
- (void)setProtocolConfiguration:(NEVPNProtocol *)protocolConfiguration;
@end

@implementation NEVPNManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)setConfiguration:(id)a3
{
}

- (NEConfiguration)configuration
{
  return (NEConfiguration *)objc_getProperty(self, a2, 24, 1);
}

- (NEVPNConnection)connection
{
  return (NEVPNConnection *)objc_getProperty(self, a2, 16, 1);
}

- (id)createL2TPUserPreferencesWithName:(id)a3
{
  id v4 = a3;
  v5 = [NEL2TPUserPreferences alloc];
  v6 = [(NEVPNManager *)self configuration];
  v7 = [(NEL2TPUserPreferences *)v5 initWithConfiguration:v6];

  [(NEL2TPUserPreferences *)v7 setName:v4];
  v8 = objc_alloc_init(NEVPNProtocolL2TP);
  [(NEL2TPUserPreferences *)v7 setSettings:v8];

  v9 = [(NEL2TPUserPreferences *)v7 settings];
  if (v9) {
    v9[10] = 1;
  }

  return v7;
}

- (id)copyCurrentUserStartOptions
{
  v3 = [(NEVPNManager *)self protocolConfiguration];
  uint64_t v4 = [v3 type];

  if (v4 != 2) {
    return 0;
  }
  v5 = [(NEVPNManager *)self protocolConfiguration];
  v6 = [v5 userPreferences];
  uint64_t v7 = [v6 indexOfObjectPassingTest:&__block_literal_global_80];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    started = 0;
  }
  else
  {
    v10 = [v5 userPreferences];
    v11 = [v10 objectAtIndexedSubscript:v7];
    if (v11) {
      started = (void *)SCUserPreferencesCopyStartOptions();
    }
    else {
      started = 0;
    }
  }
  id v9 = started;

  return v9;
}

uint64_t __43__NEVPNManager_copyCurrentUserStartOptions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isCurrent];
}

- (NEProfileIngestionPayloadInfo)configurationPayloadInfo
{
  v2 = [(NEVPNManager *)self configuration];
  v3 = [v2 payloadInfo];

  return (NEProfileIngestionPayloadInfo *)v3;
}

- (BOOL)isFromMDM
{
  v2 = [(NEVPNManager *)self configuration];
  v3 = [v2 payloadInfo];
  BOOL v4 = [v3 profileSource] == 2;

  return v4;
}

- (BOOL)isFromProfile
{
  v2 = [(NEVPNManager *)self configuration];
  v3 = [v2 payloadInfo];
  BOOL v4 = v3 != 0;

  return v4;
}

- (NSString)appBundleIdentifier
{
  v2 = [(NEVPNManager *)self configuration];
  v3 = [v2 application];

  return (NSString *)v3;
}

- (NSUUID)identifier
{
  v2 = [(NEVPNManager *)self configuration];
  v3 = [v2 identifier];

  return (NSUUID *)v3;
}

- (id)description
{
  v2 = NSString;
  v3 = [(NEVPNManager *)self descriptionWithIndent:0 options:14];
  BOOL v4 = [v2 stringWithFormat:@"{%@\n}", v3];

  return v4;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  v8 = [(NEVPNManager *)self localizedDescription];
  [v7 appendPrettyObject:v8 withName:@"localizedDescription" andIndent:v5 options:a4];

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNManager isEnabled](self, "isEnabled"), @"enabled", v5, a4);
  id v9 = [(NEVPNManager *)self protocolConfiguration];
  [v7 appendPrettyObject:v9 withName:@"protocolConfiguration" andIndent:v5 options:a4];

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNManager isOnDemandEnabled](self, "isOnDemandEnabled"), @"onDemandEnabled", v5, a4);
  v10 = [(NEVPNManager *)self onDemandRules];
  [v7 appendPrettyObject:v10 withName:@"onDemandRules" andIndent:v5 options:a4];

  return v7;
}

- (void)setLocalizedDescription:(NSString *)localizedDescription
{
  v6 = localizedDescription;
  BOOL v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(NEVPNManager *)v4 configuration];
  [v5 setName:v6];

  objc_sync_exit(v4);
}

- (NSString)localizedDescription
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(NEVPNManager *)v2 configuration];
  BOOL v4 = [v3 name];

  objc_sync_exit(v2);

  return (NSString *)v4;
}

- (void)setEnabled:(BOOL)enabled
{
  BOOL v3 = enabled;
  obj = self;
  objc_sync_enter(obj);
  BOOL v4 = [(NEVPNManager *)obj configuration];
  uint64_t v5 = [v4 appVPN];

  v6 = [(NEVPNManager *)obj configuration];
  if (v5) {
    [v6 appVPN];
  }
  else {
  uint64_t v7 = [v6 VPN];
  }
  [v7 setEnabled:v3];

  objc_sync_exit(obj);
}

- (BOOL)isEnabled
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(NEVPNManager *)v2 configuration];
  BOOL v4 = [v3 appVPN];

  uint64_t v5 = [(NEVPNManager *)v2 configuration];
  if (v4) {
    [v5 appVPN];
  }
  else {
  v6 = [v5 VPN];
  }
  char v7 = [v6 isEnabled];

  objc_sync_exit(v2);
  return v7;
}

- (void)setOnDemandEnabled:(BOOL)onDemandEnabled
{
  BOOL v3 = onDemandEnabled;
  obj = self;
  objc_sync_enter(obj);
  BOOL v4 = [(NEVPNManager *)obj configuration];
  uint64_t v5 = [v4 appVPN];

  v6 = [(NEVPNManager *)obj configuration];
  if (v5) {
    [v6 appVPN];
  }
  else {
  char v7 = [v6 VPN];
  }
  [v7 setOnDemandEnabled:v3];

  objc_sync_exit(obj);
}

- (BOOL)isOnDemandEnabled
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(NEVPNManager *)v2 configuration];
  BOOL v4 = [v3 appVPN];

  uint64_t v5 = [(NEVPNManager *)v2 configuration];
  if (v4) {
    [v5 appVPN];
  }
  else {
  v6 = [v5 VPN];
  }
  char v7 = [v6 isOnDemandEnabled];

  objc_sync_exit(v2);
  return v7;
}

- (void)setOnDemandRules:(NSArray *)onDemandRules
{
  id v9 = onDemandRules;
  BOOL v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(NEVPNManager *)v4 configuration];
  v6 = [v5 appVPN];

  char v7 = [(NEVPNManager *)v4 configuration];
  if (v6) {
    [v7 appVPN];
  }
  else {
  v8 = [v7 VPN];
  }
  [v8 setOnDemandRules:v9];

  objc_sync_exit(v4);
}

- (NSArray)onDemandRules
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(NEVPNManager *)v2 configuration];
  BOOL v4 = [v3 appVPN];

  uint64_t v5 = [(NEVPNManager *)v2 configuration];
  if (v4) {
    [v5 appVPN];
  }
  else {
  v6 = [v5 VPN];
  }
  char v7 = [v6 onDemandRules];

  objc_sync_exit(v2);

  return (NSArray *)v7;
}

- (void)setProtocolConfiguration:(NEVPNProtocol *)protocolConfiguration
{
  id v9 = protocolConfiguration;
  BOOL v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(NEVPNManager *)v4 configuration];
  v6 = [v5 appVPN];

  char v7 = [(NEVPNManager *)v4 configuration];
  if (v6) {
    [v7 appVPN];
  }
  else {
  v8 = [v7 VPN];
  }
  [v8 setProtocol:v9];

  objc_sync_exit(v4);
}

- (NEVPNProtocol)protocolConfiguration
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(NEVPNManager *)v2 configuration];
  BOOL v4 = [v3 appVPN];

  uint64_t v5 = [(NEVPNManager *)v2 configuration];
  if (v4) {
    [v5 appVPN];
  }
  else {
  v6 = [v5 VPN];
  }
  char v7 = [v6 protocol];

  objc_sync_exit(v2);

  return (NEVPNProtocol *)v7;
}

- (void)saveToPreferencesWithCompletionHandler:(void *)completionHandler
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  BOOL v4 = completionHandler;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (!v5 || !v5->_hasLoaded)
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NEVPNErrorDomain" code:4 userInfo:0];
    if (!v4) {
      goto LABEL_41;
    }
    char v7 = block;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__NEVPNManager_saveToPreferencesWithCompletionHandler___block_invoke;
    block[3] = &unk_1E59936F8;
    id v85 = v4;
    id v6 = v6;
    id v84 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);

LABEL_39:
    v45 = (void *)v7[5];
    goto LABEL_40;
  }
  v8 = [(NEVPNManager *)v5 configuration];
  if (!v8) {
    goto LABEL_37;
  }
  id v9 = [(NEVPNManager *)v5 protocolConfiguration];
  if (!v9)
  {

    goto LABEL_37;
  }
  v10 = [(NEVPNManager *)v5 protocolConfiguration];
  BOOL v11 = -[NEVPNManager isProtocolTypeValid:](v5, "isProtocolTypeValid:", [v10 type]);

  if (!v11)
  {
LABEL_37:
    v43 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v89 = *MEMORY[0x1E4F28568];
    v90 = @"Missing protocol or protocol has invalid type";
    v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v90 forKeys:&v89 count:1];
    id v6 = [v43 errorWithDomain:@"NEVPNErrorDomain" code:1 userInfo:v44];

    if (!v4) {
      goto LABEL_41;
    }
    char v7 = v80;
    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    v80[2] = __55__NEVPNManager_saveToPreferencesWithCompletionHandler___block_invoke_2;
    v80[3] = &unk_1E59936F8;
    id v82 = v4;
    id v6 = v6;
    id v81 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v80);

    goto LABEL_39;
  }
  [(NEVPNManager *)v5 additionalSetup];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v12 = [(NEVPNManager *)v5 configuration];
  char v13 = [v12 checkValidityAndCollectErrors:v6];

  if ((v13 & 1) == 0)
  {
    if ([v6 count])
    {
      uint64_t v87 = *MEMORY[0x1E4F28568];
      v46 = [v6 componentsJoinedByString:@"\n"];
      v88 = v46;
      v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v88 forKeys:&v87 count:1];
    }
    else
    {
      v47 = 0;
    }
    v45 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NEVPNErrorDomain" code:1 userInfo:v47];
    v48 = ne_log_obj();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v94 = v45;
      _os_log_error_impl(&dword_19DDAF000, v48, OS_LOG_TYPE_ERROR, "Failed to save the new configuration: %@", buf, 0xCu);
    }

    if (v4)
    {
      v77[0] = MEMORY[0x1E4F143A8];
      v77[1] = 3221225472;
      v77[2] = __55__NEVPNManager_saveToPreferencesWithCompletionHandler___block_invoke_43;
      v77[3] = &unk_1E59936F8;
      id v79 = v4;
      id v78 = v45;
      dispatch_async(MEMORY[0x1E4F14428], v77);
    }
    goto LABEL_40;
  }
  v63 = [(NEVPNManager *)v5 protocolConfiguration];
  if ([v63 type] != 2) {
    goto LABEL_53;
  }
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v61 = v63;
  v14 = [v61 userPreferences];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v73 objects:v86 count:16];
  id obj = v14;
  if (!v15)
  {

LABEL_51:
    v49 = [(NEVPNManager *)v5 configuration];
    +[NEL2TPUserPreferences clearCurrentForConfiguration:]((uint64_t)NEL2TPUserPreferences, v49);

    goto LABEL_52;
  }
  char v16 = 0;
  uint64_t v65 = *(void *)v74;
  while (2)
  {
    uint64_t v64 = v15;
    for (uint64_t i = 0; i != v64; ++i)
    {
      if (*(void *)v74 != v65) {
        objc_enumerationMutation(obj);
      }
      v18 = *(void **)(*((void *)&v73 + 1) + 8 * i);
      char v66 = [v18 isCurrent];
      if (!v18) {
        goto LABEL_69;
      }
      v19 = [v18 name];
      BOOL v20 = v19 == 0;

      if (!v20)
      {
        v21 = [v18 name];
        BOOL v22 = SCUserPreferencesSetName() == 0;

        if (v22)
        {
          Error = SCCopyLastError();
          oslog = ne_log_obj();
          if (!os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR)) {
            goto LABEL_68;
          }
          *(_DWORD *)buf = 138412290;
          v94 = Error;
          v55 = "Failed to set the user preferences name: %@";
LABEL_64:
          _os_log_error_impl(&dword_19DDAF000, oslog, OS_LOG_TYPE_ERROR, v55, buf, 0xCu);
          goto LABEL_68;
        }
      }
      if ([v18 isCurrent] && !SCUserPreferencesSetCurrent())
      {
        Error = SCCopyLastError();
        oslog = ne_log_obj();
        if (!os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR)) {
          goto LABEL_68;
        }
        *(_DWORD *)buf = 138412290;
        v94 = Error;
        v55 = "Failed to set the current user preferences: %@";
        goto LABEL_64;
      }
      v23 = [v18 settings];
      BOOL v24 = v23 == 0;

      if (!v24)
      {
        v25 = [v18 settings];
        v26 = [v25 passwordKeychainItem];
        [v26 setDomain:1];

        v27 = [v18 settings];
        v28 = [v27 sharedSecretKeychainItem];
        [v28 setDomain:1];

        id v29 = objc_alloc(MEMORY[0x1E4F29128]);
        v30 = [v18 identifier];
        Error = (void *)[v29 initWithUUIDString:v30];

        oslog = -[NEConfiguration initWithIdentifier:]((id *)[NEConfiguration alloc], Error);
        v32 = [v18 name];
        [oslog setName:v32];

        v33 = [v18 settings];
        [v33 syncWithKeychainInDomain:1 configuration:oslog suffix:0];

        v34 = [v18 settings];
        id v35 = (id)[v34 copyLegacyDictionaryComplete:0];

        if (!v35) {
          id v35 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
        }
        if (!SCUserPreferencesSetInterfaceTypeConfiguration())
        {
          CFErrorRef v37 = SCCopyLastError();
          v56 = ne_log_obj();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v94 = v37;
            _os_log_error_impl(&dword_19DDAF000, v56, OS_LOG_TYPE_ERROR, "Failed to set the PPP settings in the user preferences: %@", buf, 0xCu);
          }
LABEL_61:

LABEL_68:
LABEL_69:
          v59 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NEVPNErrorDomain" code:4 userInfo:0];
          v60 = ne_log_obj();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v94 = v59;
            _os_log_error_impl(&dword_19DDAF000, v60, OS_LOG_TYPE_ERROR, "Failed to save the new configuration: %@", buf, 0xCu);
          }

          if (v4)
          {
            v70[0] = MEMORY[0x1E4F143A8];
            v70[1] = 3221225472;
            v70[2] = __55__NEVPNManager_saveToPreferencesWithCompletionHandler___block_invoke_44;
            v70[3] = &unk_1E59936F8;
            id v72 = v4;
            id v71 = v59;
            dispatch_async(MEMORY[0x1E4F14428], v70);
          }
          v45 = v61;
          goto LABEL_40;
        }
        v36 = [v18 settings];
        CFErrorRef v37 = (CFErrorRef)[v36 copyLegacyIPSecDictionary];

        if (!v37) {
          CFErrorRef v37 = (CFErrorRef)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
        }
        if (!SCUserPreferencesSetInterfaceTypeConfiguration())
        {
          v56 = SCCopyLastError();
          v57 = ne_log_obj();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v94 = v56;
            _os_log_error_impl(&dword_19DDAF000, v57, OS_LOG_TYPE_ERROR, "Failed to set the IPsec settings in the user preferences: %@", buf, 0xCu);
          }

          goto LABEL_61;
        }
      }
      Error = [v18 settings];
      if ([Error authenticationMethod] == 3)
      {
        v38 = [v18 settings];
        v39 = [v38 identityReference];
        BOOL v40 = v39 == 0;

        if (v40) {
          goto LABEL_32;
        }
        v91 = @"TLSIdentityHandle";
        v41 = [v18 settings];
        v42 = [v41 identityReference];
        v92 = v42;
        Error = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v92 forKeys:&v91 count:1];

        if (!SCUserPreferencesSetInterfaceTypeConfiguration())
        {
          oslog = SCCopyLastError();
          v58 = ne_log_obj();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v94 = oslog;
            _os_log_error_impl(&dword_19DDAF000, v58, OS_LOG_TYPE_ERROR, "Failed to set the EAP settings in the user preferences: %@", buf, 0xCu);
          }

          goto LABEL_68;
        }
      }

LABEL_32:
      v16 |= v66;
    }
    uint64_t v15 = [obj countByEnumeratingWithState:&v73 objects:v86 count:16];
    if (v15) {
      continue;
    }
    break;
  }

  if ((v16 & 1) == 0) {
    goto LABEL_51;
  }
LABEL_52:

LABEL_53:
  id v50 = +[NEVPNManager loadedManagers]();
  v5->_notificationSent = 0;
  v51 = +[NEVPNManager configurationManager]();
  v52 = [(NEVPNManager *)v5 configuration];
  uint64_t v53 = MEMORY[0x1E4F14428];
  id v54 = MEMORY[0x1E4F14428];
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __55__NEVPNManager_saveToPreferencesWithCompletionHandler___block_invoke_2_46;
  v68[3] = &unk_1E5993798;
  v68[4] = v5;
  id v69 = v4;
  [v51 saveConfiguration:v52 withCompletionQueue:v53 handler:v68];

  v45 = v63;
LABEL_40:

LABEL_41:
  objc_sync_exit(v5);
}

uint64_t __55__NEVPNManager_saveToPreferencesWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __55__NEVPNManager_saveToPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __55__NEVPNManager_saveToPreferencesWithCompletionHandler___block_invoke_43(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __55__NEVPNManager_saveToPreferencesWithCompletionHandler___block_invoke_44(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (id)loadedManagers
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__NEVPNManager_loadedManagers__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = v0;
  if (loadedManagers_managers_init_25933 != -1) {
    dispatch_once(&loadedManagers_managers_init_25933, block);
  }
  v1 = (void *)loadedManagers_loadedManagers_25934;

  return v1;
}

+ (id)configurationManager
{
  self;
  if (g_noAppFilter) {
    +[NEConfigurationManager sharedManagerForAllUsers];
  }
  else {
  uint64_t v0 = +[NEConfigurationManager sharedManager];
  }

  return v0;
}

void __55__NEVPNManager_saveToPreferencesWithCompletionHandler___block_invoke_2_46(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  if (v3)
  {
    uint64_t v5 = +[NEVPNManager mapError:]((uint64_t)NEVPNManager, v3);

    if (v5)
    {
      id v6 = ne_log_obj();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v14 = 138412290;
        uint64_t v15 = v5;
        _os_log_error_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_ERROR, "Failed to save configuration: %@", (uint8_t *)&v14, 0xCu);
      }
    }
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      *(unsigned char *)(v7 + 9) = 1;
    }
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (!v8 || (*(unsigned char *)(v8 + 9) & 1) == 0)
    {
      id v9 = ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        char v13 = *(void **)(a1 + 32);
        int v14 = 138412290;
        uint64_t v15 = v13;
        _os_log_debug_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_DEBUG, "Post NEVPNConfigurationChangeNotification to app for manager %@", (uint8_t *)&v14, 0xCu);
      }

      uint64_t v10 = *(void *)(a1 + 32);
      if (v10) {
        *(unsigned char *)(v10 + 9) = 1;
      }
      BOOL v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v11 postNotificationName:@"com.apple.networkextension.app-configuration-changed" object:*(void *)(a1 + 32)];
    }
    uint64_t v5 = 0;
  }
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v5);
  }
  objc_sync_exit(v4);
}

+ (id)mapError:(uint64_t)a1
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  id v3 = [v2 domain];
  int v4 = [v3 isEqual:@"NEConfigurationErrorDomain"];

  if (v4)
  {
    switch([v2 code])
    {
      case 1:
      case 2:
      case 3:
      case 4:
      case 7:
        uint64_t v5 = [v2 localizedDescription];
        uint64_t v6 = 1;
        goto LABEL_7;
      case 5:
        uint64_t v5 = [v2 localizedDescription];
        uint64_t v6 = 4;
        goto LABEL_7;
      case 6:
      case 8:
      case 10:
      case 11:
      case 12:
      case 20:
      case 21:
        uint64_t v5 = [v2 localizedDescription];
        uint64_t v6 = 5;
        goto LABEL_7;
      case 9:
        uint64_t v5 = ne_log_obj();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_DEFAULT, "The configuration was not saved because it was unchanged from the previously saved version", buf, 2u);
        }
        id v9 = 0;
        break;
      default:
        BOOL v11 = NSString;
        uint64_t v12 = [v2 localizedDescription];
        uint64_t v5 = [v11 stringWithFormat:@"Unknown: %@", v12];

        goto LABEL_5;
    }
  }
  else
  {
    uint64_t v5 = @"Unknown.";
LABEL_5:
    uint64_t v6 = 6;
LABEL_7:
    uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    v15[0] = v5;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    id v9 = [v7 errorWithDomain:@"NEVPNErrorDomain" code:v6 userInfo:v8];
  }

  return v9;
}

void __30__NEVPNManager_loadedManagers__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = (void *)loadedManagers_loadedManagers_25934;
  loadedManagers_loadedManagers_25934 = (uint64_t)v2;

  int v4 = +[NEVPNManager configurationManager]();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__NEVPNManager_loadedManagers__block_invoke_2;
  v6[3] = &__block_descriptor_40_e17_v16__0__NSArray_8l;
  v6[4] = *(void *)(a1 + 32);
  [v4 setChangedQueue:MEMORY[0x1E4F14428] andHandler:v6];

  uint64_t v5 = +[NEVPNManager configurationManager]();
  [v5 setIncomingMessageHandler:&__block_literal_global_25936];
}

void __30__NEVPNManager_loadedManagers__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [(id)loadedManagers_loadedManagers_25934 objectForKeyedSubscript:*(void *)(*((void *)&v15 + 1) + 8 * v7)];
        if (v8
          || ([*(id *)(a1 + 32) sharedManager], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          v13[2] = __30__NEVPNManager_loadedManagers__block_invoke_3;
          v13[3] = &unk_1E5993618;
          id v14 = v8;
          id v9 = v8;
          [v9 loadFromPreferencesWithCompletionHandler:v13];
        }
        else
        {
          uint64_t v10 = ne_log_obj();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)uint64_t v12 = 0;
            _os_log_debug_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_DEBUG, "Post NEVPNConfigurationChangeNotification to app", v12, 2u);
          }

          id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v9 postNotificationName:@"com.apple.networkextension.app-configuration-changed" object:0];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v11 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v5 = v11;
    }
    while (v11);
  }
}

void __30__NEVPNManager_loadedManagers__block_invoke_12(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  xpc_object_t reply = xpc_dictionary_create_reply(xdict);
  if (xdict && MEMORY[0x19F3B92C0]() == MEMORY[0x1E4F14590] && xpc_dictionary_get_int64(xdict, "config-operation") == 8)
  {
    uint64_t v4 = (void *)loadedManagers_configurationClient;
    if (!loadedManagers_configurationClient)
    {
      uint64_t v5 = [NEProviderAppConfigurationClient alloc];
      if (v5)
      {
        v17.receiver = v5;
        v17.super_class = (Class)NEProviderAppConfigurationClient;
        id v6 = objc_msgSendSuper2(&v17, sel_init);
        if (v6)
        {
          uint64_t v7 = [MEMORY[0x1E4F29290] anonymousListener];
          uint64_t v8 = (void *)*((void *)v6 + 9);
          *((void *)v6 + 9) = v7;

          [*((id *)v6 + 9) setDelegate:v6];
          [*((id *)v6 + 9) resume];
          *((unsigned char *)v6 + 64) = 1;
          id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v9 addObserver:v6 selector:sel_handleConfigChanged_ name:@"com.apple.networkextension.app-configuration-changed" object:0];
        }
      }
      else
      {
        id v6 = 0;
      }
      uint64_t v10 = (void *)loadedManagers_configurationClient;
      loadedManagers_configurationClient = (uint64_t)v6;

      uint64_t v4 = (void *)loadedManagers_configurationClient;
    }
    uint64_t v11 = [(NEProviderAppConfigurationClient *)v4 listenerEndpoint];

    if (v11)
    {
      char v13 = [(NEProviderAppConfigurationClient *)(void *)loadedManagers_configurationClient listenerEndpoint];
      uint64_t v11 = [v13 _endpoint];

      int64_t v14 = 0;
      if (!reply) {
        goto LABEL_17;
      }
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  int64_t v14 = 22;
  if (!reply) {
    goto LABEL_17;
  }
LABEL_14:
  xpc_dictionary_set_int64(reply, "result-code", v14);
  if (v11) {
    xpc_dictionary_set_value(reply, "result-data", v11);
  }
  xpc_dictionary_get_remote_connection(xdict);
  long long v15 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v15, reply);

LABEL_17:
}

void __30__NEVPNManager_loadedManagers__block_invoke_3(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2 || (*(unsigned char *)(v2 + 9) & 1) == 0)
  {
    id v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_debug_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_DEBUG, "Post NEVPNConfigurationChangeNotification to app for manager %@", (uint8_t *)&v7, 0xCu);
    }

    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      *(unsigned char *)(v4 + 9) = 1;
    }
    uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"com.apple.networkextension.app-configuration-changed" object:*(void *)(a1 + 32)];
  }
}

- (void)additionalSetup
{
  v48 = [(NEVPNManager *)self protocolConfiguration];
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  id v3 = v48;
  if (isKindOfClass)
  {
    uint64_t v4 = v48;
    [v4 setDisconnectOnWake:0];
    if (v4 && !v4[10])
    {
      uint64_t v5 = [v4 passwordReference];

      if (v5)
      {
        uint64_t v6 = [NEKeychainItem alloc];
        int v7 = [v4 passwordReference];
        uint64_t v8 = [(NEKeychainItem *)v6 initWithPersistentReference:v7 domain:1 accessGroup:0];

        id v9 = [(NEKeychainItem *)v8 copyData];
        if (v9)
        {
          uint64_t v10 = [NEKeychainItem alloc];
          uint64_t v11 = v4[10];
          id v13 = objc_getProperty(v4, v12, 88, 1);
          int64_t v14 = [(NEKeychainItem *)v10 initWithData:v9 domain:v11 accessGroup:v13];
          [v4 setPasswordKeychainItem:v14];
        }
      }
      long long v15 = [v4 sharedSecretReference];

      if (v15)
      {
        long long v16 = [NEKeychainItem alloc];
        objc_super v17 = [v4 sharedSecretReference];
        long long v18 = [(NEKeychainItem *)v16 initWithPersistentReference:v17 domain:1 accessGroup:0];

        id v19 = [(NEKeychainItem *)v18 copyData];
        if (v19)
        {
          uint64_t v20 = [NEKeychainItem alloc];
          uint64_t v21 = v4[10];
          id v23 = objc_getProperty(v4, v22, 88, 1);
          BOOL v24 = [(NEKeychainItem *)v20 initWithData:v19 domain:v21 accessGroup:v23];
          [v4 setSharedSecretKeychainItem:v24];
        }
      }
      v25 = [v4 identityDataPassword];

      if (v25)
      {
        v26 = [v4 identityDataPasswordKeychainItem];

        if (v26)
        {
          v27 = [v4 identityDataPassword];
          id v28 = [v4 identityDataPasswordKeychainItem];
          [v28 setPassword:v27];
        }
        else
        {
          id v29 = [NEKeychainItem alloc];
          v27 = [v4 identityDataPassword];
          uint64_t v30 = v4[10];
          id v28 = objc_getProperty(v4, v31, 88, 1);
          v32 = [(NEKeychainItem *)v29 initWithPassword:v27 domain:v30 accessGroup:v28];
          [v4 setIdentityDataPasswordKeychainItem:v32];
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v33 = v4;
        v34 = [v33 ppkConfiguration];

        if (v34)
        {
          id v35 = [NEKeychainItem alloc];
          v36 = [v33 ppkConfiguration];
          CFErrorRef v37 = [v36 keychainReference];
          v38 = [(NEKeychainItem *)v35 initWithPersistentReference:v37 domain:1 accessGroup:0];

          id v39 = [(NEKeychainItem *)v38 copyData];
          if (v39)
          {
            BOOL v40 = [NEKeychainItem alloc];
            uint64_t v41 = v4[10];
            id v43 = objc_getProperty(v33, v42, 88, 1);
            v44 = [(NEKeychainItem *)v40 initWithData:v39 domain:v41 accessGroup:v43];
            v45 = [v33 ppkConfiguration];
            v47 = v45;
            if (v45) {
              objc_setProperty_atomic_copy(v45, v46, v44, 32);
            }
          }
        }
      }
    }

    id v3 = v48;
  }

  MEMORY[0x1F41817F8](isKindOfClass, v3);
}

- (BOOL)isProtocolTypeValid:(int64_t)a3
{
  return ((a3 & 0xFFFFFFFFFFFFFFFBLL) == 1) | g_noAppFilter & 1;
}

- (void)removeFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = completionHandler;
  uint64_t v5 = [(NEVPNManager *)self protocolConfiguration];
  uint64_t v6 = [v5 type];

  if (v6 == 2)
  {
    int v7 = [(NEVPNManager *)self protocolConfiguration];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v8 = [v7 userPreferences];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          if (*(void *)(*((void *)&v18 + 1) + 8 * v12)) {
            SCUserPreferencesRemove();
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    [v7 setUserPreferences:0];
  }
  if (self) {
    self->_notificationSent = 0;
  }
  id v13 = +[NEVPNManager configurationManager]();
  int64_t v14 = [(NEVPNManager *)self configuration];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__NEVPNManager_removeFromPreferencesWithCompletionHandler___block_invoke;
  v16[3] = &unk_1E5993798;
  v16[4] = self;
  id v17 = v4;
  id v15 = v4;
  [v13 removeConfiguration:v14 withCompletionQueue:MEMORY[0x1E4F14428] handler:v16];
}

void __59__NEVPNManager_removeFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  if (v3)
  {
    uint64_t v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v3;
      _os_log_error_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_ERROR, "Failed to remove the configuration: %@", buf, 0xCu);
    }

    uint64_t v6 = +[NEVPNManager mapError:]((uint64_t)NEVPNManager, v3);
  }
  else
  {
    uint64_t v6 = 0;
  }
  int v7 = [*(id *)(a1 + 32) configuration];
  BOOL v8 = v7 == 0;

  if (!v8)
  {
    uint64_t v9 = +[NEVPNManager loadedManagers]();
    uint64_t v10 = [*(id *)(a1 + 32) configuration];
    uint64_t v11 = [v10 identifier];
    [v9 removeObjectForKey:v11];
  }
  uint64_t v12 = [*(id *)(a1 + 32) connection];
  -[NEVPNConnection destroySession](v12);

  uint64_t v13 = *(void *)(a1 + 32);
  if (!v13 || (*(unsigned char *)(v13 + 9) & 1) == 0)
  {
    int64_t v14 = ne_log_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      long long v18 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      id v23 = v18;
      _os_log_debug_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_DEBUG, "Post NEVPNConfigurationChangeNotification to app for manager %@", buf, 0xCu);
    }

    uint64_t v15 = *(void *)(a1 + 32);
    if (v15) {
      *(unsigned char *)(v15 + 9) = 1;
    }
    long long v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 postNotificationName:@"com.apple.networkextension.app-configuration-changed" object:*(void *)(a1 + 32)];
  }
  id v17 = *(void **)(a1 + 40);
  if (v17)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __59__NEVPNManager_removeFromPreferencesWithCompletionHandler___block_invoke_30;
    v19[3] = &unk_1E59936F8;
    id v21 = v17;
    id v20 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v19);
  }
  objc_sync_exit(v4);
}

uint64_t __59__NEVPNManager_removeFromPreferencesWithCompletionHandler___block_invoke_30(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)loadFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  if (v4)
  {
    uint64_t v5 = +[NEVPNManager configurationManager]();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __57__NEVPNManager_loadFromPreferencesWithCompletionHandler___block_invoke;
    v6[3] = &unk_1E5993720;
    v6[4] = self;
    id v7 = v4;
    [v5 loadConfigurationsWithCompletionQueue:MEMORY[0x1E4F14428] handler:v6];
  }
}

void __57__NEVPNManager_loadFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v31 = a2;
  id v5 = a3;
  id v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  if (v5)
  {
    id v7 = +[NEVPNManager mapError:]((uint64_t)NEVPNManager, v5);

    if (!v7)
    {
LABEL_20:
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_21;
    }
    BOOL v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFErrorRef v37 = v7;
      _os_log_error_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_ERROR, "Failed to load the configuration: %@", buf, 0xCu);
    }
LABEL_19:

    goto LABEL_20;
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    *(unsigned char *)(v9 + 8) = 1;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  BOOL v8 = v31;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (!v10)
  {
LABEL_15:

    id v17 = [*(id *)(a1 + 32) configuration];
    long long v18 = [v17 VPN];
    [v18 setEnabled:0];

    long long v19 = +[NEVPNManager loadedManagers]();
    id v20 = [*(id *)(a1 + 32) configuration];
    id v21 = [v20 identifier];
    [v19 removeObjectForKey:v21];

    BOOL v8 = [*(id *)(a1 + 32) connection];
    -[NEVPNConnection destroySession](v8);
LABEL_18:
    id v7 = 0;
    goto LABEL_19;
  }
  uint64_t v11 = *(void *)v33;
LABEL_9:
  uint64_t v12 = 0;
  while (1)
  {
    if (*(void *)v33 != v11) {
      objc_enumerationMutation(v8);
    }
    uint64_t v13 = *(void **)(*((void *)&v32 + 1) + 8 * v12);
    int64_t v14 = *(void **)(a1 + 32);
    uint64_t v15 = [v13 VPN];
    long long v16 = [v15 protocol];
    LODWORD(v14) = objc_msgSend(v14, "isProtocolTypeValid:", objc_msgSend(v16, "type"));

    if (v14) {
      break;
    }
    if (v10 == ++v12)
    {
      uint64_t v10 = [v8 countByEnumeratingWithState:&v32 objects:v38 count:16];
      if (v10) {
        goto LABEL_9;
      }
      goto LABEL_15;
    }
  }
  [*(id *)(a1 + 32) setConfiguration:v13];
  uint64_t v22 = *(void *)(a1 + 32);
  id v23 = +[NEVPNManager loadedManagers]();
  uint64_t v24 = [*(id *)(a1 + 32) configuration];
  v25 = [v24 identifier];
  [v23 setObject:v22 forKeyedSubscript:v25];

  v26 = [*(id *)(a1 + 32) connection];
  if (v26)
  {
    BOOL v27 = v26[7] == 0;

    if (!v27) {
      goto LABEL_18;
    }
  }
  id v28 = [*(id *)(a1 + 32) connection];
  id v29 = [*(id *)(a1 + 32) configuration];
  uint64_t v30 = [v29 identifier];
  if (v28) {
    -[NEVPNConnection createSessionWithConfigurationIdentifier:forceInfoFetch:completionHandler:](v28, v30, 0, *(void **)(a1 + 40));
  }

  id v7 = 0;
LABEL_21:
  objc_sync_exit(v6);
}

- (NEVPNManager)initWithGrade:(int64_t)a3 connection:(id)a4 tunnelType:(int64_t)a5
{
  uint64_t v9 = a4;
  v26.receiver = self;
  v26.super_class = (Class)NEVPNManager;
  uint64_t v10 = [(NEVPNManager *)&v26 init];
  if (v10)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v12 = [v11 infoDictionary];
    uint64_t v13 = [v12 objectForKey:*MEMORY[0x1E4F1CC48]];

    int64_t v14 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v15 = [v14 bundleIdentifier];

    if (!v13)
    {
      long long v16 = [MEMORY[0x1E4F28B50] mainBundle];
      id v17 = [v16 infoDictionary];
      uint64_t v13 = [v17 objectForKey:*MEMORY[0x1E4F1D008]];
    }
    long long v18 = [[NEConfiguration alloc] initWithName:v13 grade:a3];
    configuration = v10->_configuration;
    v10->_configuration = v18;

    if (v9 && v9[3] == 1)
    {
      id v20 = objc_alloc_init(NEVPN);
      [(NEConfiguration *)v10->_configuration setVPN:v20];

      id v21 = [(NEConfiguration *)v10->_configuration VPN];
    }
    else
    {
      uint64_t v22 = objc_alloc_init(NEVPNApp);
      [(NEConfiguration *)v10->_configuration setAppVPN:v22];

      id v21 = [(NEConfiguration *)v10->_configuration appVPN];
    }
    id v23 = v21;
    [v21 setTunnelType:a5];

    [(NEConfiguration *)v10->_configuration setApplication:v15];
    [(NEConfiguration *)v10->_configuration setApplicationName:v13];
    objc_storeStrong((id *)&v10->_connection, a4);
    connection = v10->_connection;
    if (connection) {
      objc_storeWeak((id *)&connection->_weakmanager, v10);
    }
    *(_WORD *)&v10->_hasLoaded = 1;
  }
  return v10;
}

- (NEVPNManager)init
{
}

+ (void)loadAllFromPreferencesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    self;
    g_noAppFilter = 1;
    id v5 = +[NEVPNManager loadedManagers]();
    id v6 = +[NEVPNManager configurationManager]();
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __60__NEVPNManager_loadAllFromPreferencesWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E59933C0;
    id v9 = a1;
    id v8 = v4;
    [v6 loadConfigurationsWithCompletionQueue:MEMORY[0x1E4F14428] handler:v7];
  }
}

void __60__NEVPNManager_loadAllFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v47 = a2;
  id v5 = a3;
  uint64_t v45 = a1;
  id v46 = *(id *)(a1 + 40);
  objc_sync_enter(v46);
  id v49 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v73 = 0;
  long long v74 = &v73;
  uint64_t v75 = 0x3032000000;
  long long v76 = __Block_byref_object_copy__25970;
  v77 = __Block_byref_object_dispose__25971;
  id v6 = v5;
  id v78 = v6;
  v44 = v6;
  if (v6)
  {
    uint64_t v7 = +[NEVPNManager mapError:]((uint64_t)NEVPNManager, v6);
    id v8 = (void *)v74[5];
    v74[5] = v7;

    uint64_t v9 = v74[5];
  }
  else
  {
    uint64_t v9 = 0;
  }
  if (v47 && !v9 && [v47 count])
  {
    group = dispatch_group_create();
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id obj = v47;
    uint64_t v54 = [obj countByEnumeratingWithState:&v69 objects:v80 count:16];
    if (v54)
    {
      uint64_t v53 = *(void *)v70;
      do
      {
        for (uint64_t i = 0; i != v54; ++i)
        {
          if (*(void *)v70 != v53) {
            objc_enumerationMutation(obj);
          }
          id v61 = *(void **)(*((void *)&v69 + 1) + 8 * i);
          uint64_t v10 = [v61 VPN];
          if (v10) {
            [v61 VPN];
          }
          else {
          v60 = [v61 appVPN];
          }

          if (v60)
          {
            objc_opt_class();
            int v11 = objc_opt_isKindOfClass() & 1;
            int v12 = v11 ? 2 : 1;
            if (v11
              || [v60 tunnelType] != 2
              || ([v60 protocol],
                  uint64_t v13 = objc_claimAutoreleasedReturnValue(),
                  BOOL v14 = [v13 type] == 4,
                  v13,
                  !v14))
            {
              v56 = -[NEVPNConnection initWithType:]([NEVPNConnection alloc], v12);
              uint64_t v15 = -[NEVPNManager initWithGrade:connection:tunnelType:]([NEVPNManager alloc], "initWithGrade:connection:tunnelType:", [v61 grade], v56, objc_msgSend(v60, "tunnelType"));
              [(NEVPNManager *)v15 setConfiguration:v61];
              v58 = v15;
              v57 = [(NEVPNManager *)v15 protocolConfiguration];
              if ([v57 type] == 2)
              {
                id v50 = v57;
                id v51 = v61;
                self;
                SCNetworkConnectionRef v16 = +[NEL2TPUserPreferences createConnectionForConfiguration:]((uint64_t)NEL2TPUserPreferences, v51);
                id v17 = (void *)SCNetworkConnectionCopyAllUserPreferences();
                CFTypeRef cf = (CFTypeRef)SCNetworkConnectionCopyCurrentUserPreferences();
                CFRelease(v16);
                if (cf)
                {
                  long long v18 = SCUserPreferencesGetUniqueID();
                }
                else
                {
                  long long v18 = 0;
                }
                if ([v17 count])
                {
                  uint64_t v19 = 0;
                  id v20 = 0;
                  while (1)
                  {
                    id v21 = [v17 objectAtIndexedSubscript:v19];

                    uint64_t v22 = [NEL2TPUserPreferences alloc];
                    if (v22) {
                      break;
                    }
                    uint64_t v24 = 0;
                    if (v18) {
                      goto LABEL_45;
                    }
LABEL_47:
                    if (!v20) {
                      id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                    }
                    [v20 addObject:v24];

                    if (++v19 >= (unint64_t)[v17 count]) {
                      goto LABEL_54;
                    }
                  }
                  v79.receiver = v22;
                  v79.super_class = (Class)NEL2TPUserPreferences;
                  id v23 = (CFTypeRef *)objc_msgSendSuper2(&v79, sel_init);
                  uint64_t v24 = v23;
                  if (v23)
                  {
                    v23[5] = v21;
                    uint64_t v25 = SCUserPreferencesCopyName();
                    objc_super v26 = (void *)v24[3];
                    v24[3] = (CFTypeRef)v25;

                    uint64_t v27 = SCUserPreferencesGetUniqueID();
                    id v28 = (void *)v24[2];
                    v24[2] = (CFTypeRef)v27;

                    CFRetain(v24[5]);
                    if (SCUserPreferencesIsForced()) {
                      *((unsigned char *)v24 + 9) = 1;
                    }
                    id v29 = (void *)SCUserPreferencesCopyInterfaceTypeConfiguration();
                    if (isa_nsdictionary(v29))
                    {
                      uint64_t v30 = (void *)[v29 mutableCopy];
                      [v30 setObject:&unk_1EF08D000 forKeyedSubscript:@"__NEVPNKeychainDomain"];
                      id v31 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v30];

                      id v32 = [(NEVPNProtocolPPP *)[NEVPNProtocolL2TP alloc] initFromLegacyDictionary:v31];
                      if (v32)
                      {
                        long long v33 = (void *)SCUserPreferencesCopyInterfaceTypeConfiguration();
                        if (isa_nsdictionary(v33)) {
                          [v32 setIPSecSettingsFromLegacyDictionary:v33];
                        }
                      }
                      long long v34 = (void *)v24[4];
                      v24[4] = v32;
                    }
                    else
                    {
                      id v31 = v29;
                    }
                    long long v35 = (void *)SCUserPreferencesCopyInterfaceTypeConfiguration();
                    if (isa_nsdictionary(v35))
                    {
                      v36 = [v35 objectForKeyedSubscript:@"TLSIdentityHandle"];
                      CFErrorRef v37 = (void *)v24[4];
                      if (v37) {
                        [v37 setIdentityReference:v36];
                      }
                    }
                  }
                  if (!v18) {
                    goto LABEL_47;
                  }
LABEL_45:
                  v38 = [(CFTypeRef *)v24 identifier];
                  int v39 = [v18 isEqualToString:v38];

                  if (v39) {
                    [(CFTypeRef *)v24 setCurrent:1];
                  }
                  goto LABEL_47;
                }
                id v20 = 0;
LABEL_54:
                if (cf) {
                  CFRelease(cf);
                }

                [v50 setUserPreferences:v20];
              }
              [v49 addObject:v58];
              BOOL v40 = +[NEVPNManager loadedManagers]();
              uint64_t v41 = [v61 identifier];
              [v40 setObject:v58 forKeyedSubscript:v41];

              if (v58) {
                v58->_hasLoaded = 1;
              }
              dispatch_group_enter(group);
              SEL v42 = [(NEVPNManager *)v58 connection];
              id v43 = [v61 identifier];
              v66[0] = MEMORY[0x1E4F143A8];
              v66[1] = 3221225472;
              v66[2] = __60__NEVPNManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_76;
              v66[3] = &unk_1E5993370;
              v66[4] = v61;
              v68 = &v73;
              v67 = group;
              if (v42) {
                -[NEVPNConnection createSessionWithConfigurationIdentifier:forceInfoFetch:completionHandler:](v42, v43, 0, v66);
              }
            }
          }
        }
        uint64_t v54 = [obj countByEnumeratingWithState:&v69 objects:v80 count:16];
      }
      while (v54);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__NEVPNManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_77;
    block[3] = &unk_1E5993398;
    uint64_t v65 = &v73;
    id v63 = v49;
    id v64 = *(id *)(v45 + 32);
    dispatch_group_notify(group, MEMORY[0x1E4F14428], block);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  _Block_object_dispose(&v73, 8);

  objc_sync_exit(v46);
}

void __60__NEVPNManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_76(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = [*(id *)(a1 + 32) identifier];
      int v7 = 138412546;
      id v8 = v6;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_error_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_ERROR, "Error creating connection for configuration %@: %@", (uint8_t *)&v7, 0x16u);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __60__NEVPNManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_77(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    [*(id *)(a1 + 32) removeAllObjects];
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

+ (NEVPNManager)sharedManager
{
  if (sharedManager_vpn_init != -1) {
    dispatch_once(&sharedManager_vpn_init, &__block_literal_global_28_25974);
  }
  uint64_t v2 = (void *)sharedManager_g_nevpn;

  return (NEVPNManager *)v2;
}

id __29__NEVPNManager_sharedManager__block_invoke()
{
  if (NEInitCFTypes_onceToken != -1) {
    dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_24415);
  }
  uint64_t v0 = [NEVPNManager alloc];
  v1 = -[NEVPNConnection initWithType:]([NEVPNConnection alloc], 1);
  uint64_t v2 = [(NEVPNManager *)v0 initWithGrade:2 connection:v1 tunnelType:1];
  id v3 = (void *)sharedManager_g_nevpn;
  sharedManager_g_nevpn = v2;

  return +[NEVPNManager loadedManagers]();
}

+ (id)create
{
  uint64_t v2 = -[NEVPNConnection initWithType:]([NEVPNConnection alloc], 1);
  id v3 = [[NEVPNManager alloc] initWithGrade:1 connection:v2 tunnelType:1];

  return v3;
}

@end