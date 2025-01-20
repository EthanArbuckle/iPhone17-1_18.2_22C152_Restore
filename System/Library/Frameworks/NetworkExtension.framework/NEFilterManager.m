@interface NEFilterManager
+ (NEFilterManager)sharedManager;
+ (id)appConfigurationManager;
+ (id)globalConfigurationManager;
+ (id)sharedManagerWithSystemFilter;
+ (void)loadAllFromPreferencesWithCompletionHandler:(id)a3;
+ (void)loadMyFiltersFromPreferencesWithCompletionHandler:(id)a3;
- (BOOL)disableEncryptedDNSSettings;
- (BOOL)isEnabled;
- (BOOL)isFromMDM;
- (BOOL)isFromProfile;
- (NEConfiguration)configuration;
- (NEFilterManager)init;
- (NEFilterManagerDelegate)delegate;
- (NEFilterManagerGrade)grade;
- (NEFilterProviderConfiguration)providerConfiguration;
- (NEProfileIngestionPayloadInfo)configurationPayloadInfo;
- (NSString)appBundleIdentifier;
- (NSString)localizedDescription;
- (NSUUID)identifier;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initPrivate;
- (id)initWithConfiguration:(void *)a3 configurationManager:;
- (void)createEmptyConfiguration;
- (void)dealloc;
- (void)fetchStatusWithCompletionHandler:(id)a3;
- (void)initFilterManagerWithPluginType:(void *)a1;
- (void)loadFromPreferencesWithCompletionHandler:(void *)completionHandler;
- (void)removeFromPreferencesWithCompletionHandler:(void *)completionHandler;
- (void)saveToPreferencesWithCompletionHandler:(void *)completionHandler;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableEncryptedDNSSettings:(BOOL)a3;
- (void)setEnabled:(BOOL)enabled;
- (void)setGrade:(NEFilterManagerGrade)grade;
- (void)setLocalizedDescription:(NSString *)localizedDescription;
- (void)setProviderConfiguration:(NEFilterProviderConfiguration *)providerConfiguration;
- (void)setupSessionWithCompletionHandler:(uint64_t)a1;
@end

@implementation NEFilterManager

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_statusObserver, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_configurationManager, 0);
}

- (void)setDelegate:(id)a3
{
}

- (NEFilterManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NEFilterManagerDelegate *)WeakRetained;
}

- (void)setConfiguration:(id)a3
{
}

- (NEConfiguration)configuration
{
  return (NEConfiguration *)objc_getProperty(self, a2, 40, 1);
}

- (void)fetchStatusWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (self) {
    connection = self->_connection;
  }
  else {
    connection = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__NEFilterManager_fetchStatusWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E59932E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[NEVPNConnection updateSessionInfoForce:notify:withCompletionHandler:]((uint64_t)connection, 1, 0, v7);
}

uint64_t __52__NEFilterManager_fetchStatusWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    v3 = *(void **)(v2 + 24);
  }
  else {
    v3 = 0;
  }
  [v3 status];
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

- (NEProfileIngestionPayloadInfo)configurationPayloadInfo
{
  uint64_t v2 = [(NEFilterManager *)self configuration];
  v3 = [v2 payloadInfo];

  return (NEProfileIngestionPayloadInfo *)v3;
}

- (BOOL)isFromMDM
{
  if (![(NEFilterManager *)self isFromProfile]) {
    return 0;
  }
  v3 = [(NEFilterManager *)self configuration];
  id v4 = [v3 payloadInfo];
  BOOL v5 = [v4 profileSource] == 2;

  return v5;
}

- (BOOL)isFromProfile
{
  uint64_t v2 = [(NEFilterManager *)self configuration];
  v3 = [v2 payloadInfo];
  BOOL v4 = v3 != 0;

  return v4;
}

- (NSString)appBundleIdentifier
{
  uint64_t v2 = [(NEFilterManager *)self configuration];
  v3 = [v2 application];

  return (NSString *)v3;
}

- (NSUUID)identifier
{
  uint64_t v2 = [(NEFilterManager *)self configuration];
  v3 = [v2 identifier];

  return (NSUUID *)v3;
}

- (void)setGrade:(NEFilterManagerGrade)grade
{
  obj = self;
  objc_sync_enter(obj);
  BOOL v4 = [(NEFilterManager *)obj configuration];
  BOOL v5 = [v4 contentFilter];
  [v5 setGrade:grade];

  objc_sync_exit(obj);
}

- (NEFilterManagerGrade)grade
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  v3 = [(NEFilterManager *)v2 configuration];
  BOOL v4 = [v3 contentFilter];
  NEFilterManagerGrade v5 = [v4 grade];

  objc_sync_exit(v2);
  return v5;
}

- (id)description
{
  return [(NEFilterManager *)self descriptionWithIndent:0 options:14];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  [v7 appendString:@"{"];
  id v8 = [(NEFilterManager *)self localizedDescription];
  [v7 appendPrettyObject:v8 withName:@"localizedDescription" andIndent:v5 options:a4];

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEFilterManager isEnabled](self, "isEnabled"), @"enabled", v5, a4);
  v9 = [(NEFilterManager *)self providerConfiguration];
  [v7 appendPrettyObject:v9 withName:@"providerConfiguration" andIndent:v5 options:a4];

  [v7 appendString:@"\n}"];

  return v7;
}

- (void)setLocalizedDescription:(NSString *)localizedDescription
{
  id v6 = localizedDescription;
  BOOL v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(NEFilterManager *)v4 configuration];
  [v5 setName:v6];

  objc_sync_exit(v4);
}

- (NSString)localizedDescription
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  v3 = [(NEFilterManager *)v2 configuration];
  BOOL v4 = [v3 name];

  objc_sync_exit(v2);

  return (NSString *)v4;
}

- (void)setDisableEncryptedDNSSettings:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  BOOL v4 = [(NEFilterManager *)obj configuration];
  uint64_t v5 = [v4 contentFilter];
  [v5 setDisableEncryptedDNSSettings:v3];

  objc_sync_exit(obj);
}

- (BOOL)disableEncryptedDNSSettings
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(NEFilterManager *)v2 configuration];
  BOOL v4 = [v3 contentFilter];
  char v5 = [v4 disableEncryptedDNSSettings];

  objc_sync_exit(v2);
  return v5;
}

- (void)setEnabled:(BOOL)enabled
{
  BOOL v3 = enabled;
  obj = self;
  objc_sync_enter(obj);
  BOOL v4 = [(NEFilterManager *)obj configuration];
  char v5 = [v4 contentFilter];
  [v5 setEnabled:v3];

  objc_sync_exit(obj);
}

- (BOOL)isEnabled
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(NEFilterManager *)v2 configuration];
  BOOL v4 = [v3 contentFilter];
  char v5 = [v4 isEnabled];

  objc_sync_exit(v2);
  return v5;
}

- (void)setProviderConfiguration:(NEFilterProviderConfiguration *)providerConfiguration
{
  v7 = providerConfiguration;
  BOOL v4 = self;
  objc_sync_enter(v4);
  char v5 = [(NEFilterManager *)v4 configuration];
  id v6 = [v5 contentFilter];
  [v6 setProvider:v7];

  objc_sync_exit(v4);
}

- (NEFilterProviderConfiguration)providerConfiguration
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(NEFilterManager *)v2 configuration];
  BOOL v4 = [v3 contentFilter];
  char v5 = [v4 provider];

  objc_sync_exit(v2);

  return (NEFilterProviderConfiguration *)v5;
}

- (void)saveToPreferencesWithCompletionHandler:(void *)completionHandler
{
  BOOL v4 = completionHandler;
  char v5 = self;
  objc_sync_enter(v5);
  if (v5 && v5->_hasLoaded)
  {
    v9 = [(NEFilterManager *)v5 providerConfiguration];

    if (v9)
    {
      v10 = [(NEFilterManager *)v5 providerConfiguration];
      int v11 = [v10 filterSockets];

      if (v11)
      {
        v12 = [(NEFilterManager *)v5 providerConfiguration];
        v13 = [v12 filterDataProviderBundleIdentifier];

        v14 = [(NEFilterManager *)v5 providerConfiguration];
        v15 = [v14 dataProviderURL];
        self;
        id v16 = v13;

        v17 = [(NEFilterManager *)v5 providerConfiguration];
        [v17 setFilterDataProviderBundleIdentifier:v16];

        v18 = [(NEFilterManager *)v5 configuration];
        if (v18) {
          v18[20] = 0;
        }
      }
      v19 = [(NEFilterManager *)v5 providerConfiguration];
      int v20 = [v19 filterPackets];

      if (v20)
      {
        v22 = [(NEFilterManager *)v5 providerConfiguration];
        v23 = [v22 filterPacketProviderBundleIdentifier];

        v24 = [(NEFilterManager *)v5 providerConfiguration];
        v25 = [v24 packetProviderURL];
        self;
        id v26 = v23;

        v27 = [(NEFilterManager *)v5 providerConfiguration];
        [v27 setFilterPacketProviderBundleIdentifier:v26];

        v28 = [(NEFilterManager *)v5 configuration];
        if (!v28 || (uint64_t v29 = v28[20], v28, !v29))
        {
          v30 = [(NEFilterManager *)v5 configuration];
          if (v30) {
            v30[20] = 0;
          }
        }
      }
      id v31 = objc_getProperty(v5, v21, 16, 1);
      v32 = [v31 pluginType];

      if (v32)
      {
        id v34 = objc_getProperty(v5, v33, 16, 1);
        v35 = [v34 pluginType];
        v36 = [(NEFilterManager *)v5 providerConfiguration];
        [v36 setPluginType:v35];
      }
      id v37 = objc_getProperty(v5, v33, 16, 1);
      v38 = [(NEFilterManager *)v5 configuration];
      uint64_t v39 = MEMORY[0x1E4F14428];
      id v40 = MEMORY[0x1E4F14428];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __58__NEFilterManager_saveToPreferencesWithCompletionHandler___block_invoke_3;
      v41[3] = &unk_1E5991A58;
      id v42 = v4;
      [v37 saveConfiguration:v38 withCompletionQueue:v39 handler:v41];
      id v6 = &v42;

      goto LABEL_23;
    }
    if (v4)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __58__NEFilterManager_saveToPreferencesWithCompletionHandler___block_invoke_2;
      block[3] = &unk_1E5993770;
      id v6 = &v44;
      id v44 = v4;
      v7 = MEMORY[0x1E4F14428];
      id v8 = block;
      goto LABEL_22;
    }
  }
  else if (v4)
  {
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __58__NEFilterManager_saveToPreferencesWithCompletionHandler___block_invoke;
    v45[3] = &unk_1E5993770;
    id v6 = &v46;
    id v46 = v4;
    v7 = MEMORY[0x1E4F14428];
    id v8 = v45;
LABEL_22:
    dispatch_async(v7, v8);
LABEL_23:
  }
  objc_sync_exit(v5);
}

void __58__NEFilterManager_saveToPreferencesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NEFilterErrorDomain" code:3 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __58__NEFilterManager_saveToPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NEFilterErrorDomain" code:1 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __58__NEFilterManager_saveToPreferencesWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = v3;
    char v5 = NEFilterMapError(v3);

    if (v5)
    {
      id v6 = ne_log_obj();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v12 = "-[NEFilterManager saveToPreferencesWithCompletionHandler:]_block_invoke_3";
        __int16 v13 = 2112;
        v14 = v5;
        _os_log_error_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_ERROR, "%s: failed to save the new configuration: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    char v5 = 0;
  }
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__NEFilterManager_saveToPreferencesWithCompletionHandler___block_invoke_45;
    v8[3] = &unk_1E59936F8;
    id v10 = v7;
    id v9 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v8);
  }
}

uint64_t __58__NEFilterManager_saveToPreferencesWithCompletionHandler___block_invoke_45(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)removeFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  BOOL v4 = completionHandler;
  char v5 = self;
  objc_sync_enter(v5);
  id v6 = [(NEFilterManager *)v5 configuration];

  if (v6)
  {
    v7 = [(NEFilterManager *)v5 configuration];
    id v8 = [v7 payloadInfo];

    if (!v8)
    {
      if (v5) {
        id Property = objc_getProperty(v5, v9, 16, 1);
      }
      else {
        id Property = 0;
      }
      id v14 = Property;
      uint64_t v15 = [(NEFilterManager *)v5 configuration];
      uint64_t v16 = MEMORY[0x1E4F14428];
      id v17 = MEMORY[0x1E4F14428];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __62__NEFilterManager_removeFromPreferencesWithCompletionHandler___block_invoke_3;
      v18[3] = &unk_1E5991A58;
      id v19 = v4;
      [v14 removeConfiguration:v15 withCompletionQueue:v16 handler:v18];
      id v10 = &v19;

      goto LABEL_11;
    }
    if (v4)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __62__NEFilterManager_removeFromPreferencesWithCompletionHandler___block_invoke_2;
      v20[3] = &unk_1E5993770;
      id v10 = &v21;
      id v21 = v4;
      int v11 = MEMORY[0x1E4F14428];
      v12 = v20;
LABEL_7:
      dispatch_async(v11, v12);
LABEL_11:
    }
  }
  else if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__NEFilterManager_removeFromPreferencesWithCompletionHandler___block_invoke;
    block[3] = &unk_1E5993770;
    id v10 = &v23;
    id v23 = v4;
    int v11 = MEMORY[0x1E4F14428];
    v12 = block;
    goto LABEL_7;
  }
  objc_sync_exit(v5);
}

void __62__NEFilterManager_removeFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NEFilterErrorDomain" code:3 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __62__NEFilterManager_removeFromPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NEFilterErrorDomain" code:4 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __62__NEFilterManager_removeFromPreferencesWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = v3;
    char v5 = NEFilterMapError(v3);

    if (v5)
    {
      id v6 = ne_log_obj();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v12 = "-[NEFilterManager removeFromPreferencesWithCompletionHandler:]_block_invoke_3";
        __int16 v13 = 2112;
        id v14 = v5;
        _os_log_error_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_ERROR, "%s: failed to remove the configuration: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    char v5 = 0;
  }
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __62__NEFilterManager_removeFromPreferencesWithCompletionHandler___block_invoke_37;
    v8[3] = &unk_1E59936F8;
    id v10 = v7;
    id v9 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v8);
  }
}

uint64_t __62__NEFilterManager_removeFromPreferencesWithCompletionHandler___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)loadFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  BOOL v4 = completionHandler;
  if (v4)
  {
    char v5 = self;
    objc_sync_enter(v5);
    if (v5) {
      id Property = objc_getProperty(v5, v6, 16, 1);
    }
    else {
      id Property = 0;
    }
    id v8 = Property;
    uint64_t v9 = MEMORY[0x1E4F14428];
    id v10 = MEMORY[0x1E4F14428];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__NEFilterManager_loadFromPreferencesWithCompletionHandler___block_invoke;
    v11[3] = &unk_1E5993720;
    v11[4] = v5;
    id v12 = v4;
    [v8 loadConfigurationsWithCompletionQueue:v9 handler:v11];

    objc_sync_exit(v5);
  }
}

void __60__NEFilterManager_loadFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  if (v6)
  {
    id v8 = NEFilterMapError(v6);

    goto LABEL_23;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v10)
  {

LABEL_19:
    -[NEFilterManager createEmptyConfiguration](*(unsigned char **)(a1 + 32));
    id v11 = 0;
    goto LABEL_20;
  }
  id v11 = 0;
  uint64_t v12 = *(void *)v26;
  while (2)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v26 != v12) {
        objc_enumerationMutation(v9);
      }
      id v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      uint64_t v15 = [v14 contentFilter];
      BOOL v16 = v15 == 0;

      if (!v16)
      {
        id v17 = [v14 payloadInfo];
        BOOL v18 = v17 == 0;

        if (!v18)
        {
          id v19 = v14;

          id v11 = v19;
          goto LABEL_16;
        }
        if (!v11) {
          id v11 = v14;
        }
      }
    }
    uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v10) {
      continue;
    }
    break;
  }
LABEL_16:

  if (!v11) {
    goto LABEL_19;
  }
  [*(id *)(a1 + 32) setConfiguration:v11];
LABEL_20:
  uint64_t v20 = *(void *)(a1 + 32);
  if (v20) {
    *(unsigned char *)(v20 + 8) = 1;
  }

  id v8 = 0;
LABEL_23:
  id v21 = *(void **)(a1 + 40);
  if (v21)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __60__NEFilterManager_loadFromPreferencesWithCompletionHandler___block_invoke_2;
    v22[3] = &unk_1E59936F8;
    id v24 = v21;
    id v23 = v8;
    dispatch_async(MEMORY[0x1E4F14428], v22);
  }
  objc_sync_exit(v7);
}

- (void)createEmptyConfiguration
{
  if (a1)
  {
    id v2 = [MEMORY[0x1E4F28B50] mainBundle];
    id v3 = [v2 infoDictionary];
    id v13 = [v3 objectForKey:*MEMORY[0x1E4F1CC48]];

    if (!v13)
    {
      BOOL v4 = [MEMORY[0x1E4F28B50] mainBundle];
      id v13 = [v4 bundleIdentifier];
    }
    if (a1[9]) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = 1;
    }
    id v6 = [[NEConfiguration alloc] initWithName:v13 grade:v5];
    [a1 setConfiguration:v6];

    id v7 = objc_alloc_init(NEContentFilter);
    id v8 = [a1 configuration];
    [v8 setContentFilter:v7];

    uint64_t v10 = objc_msgSend(objc_getProperty(a1, v9, 16, 1), "pluginType");
    id v11 = [a1 configuration];
    [v11 setApplication:v10];

    uint64_t v12 = [a1 configuration];
    [v12 setApplicationName:v13];
  }
}

uint64_t __60__NEFilterManager_loadFromPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)initPrivate
{
  v6.receiver = self;
  v6.super_class = (Class)NEFilterManager;
  id v2 = [(NEFilterManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NEFilterManager appConfigurationManager]();
    configurationManager = v2->_configurationManager;
    v2->_configurationManager = (NEConfigurationManager *)v3;

    -[NEFilterManager createEmptyConfiguration](v2);
    v2->_hasLoaded = 1;
  }
  return v2;
}

+ (id)appConfigurationManager
{
  self;
  if (appConfigurationManager_onceToken != -1) {
    dispatch_once(&appConfigurationManager_onceToken, &__block_literal_global_25);
  }
  v0 = (void *)appConfigurationManager_gAppConfgurationManager;

  return v0;
}

void __42__NEFilterManager_appConfigurationManager__block_invoke()
{
  if (NEInitCFTypes_onceToken != -1) {
    dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_24415);
  }
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v5 = [v0 bundleIdentifier];

  dispatch_queue_t v1 = dispatch_queue_create("filter config app manager change queue", 0);
  id v2 = (void *)appConfigurationManager_gChangeQueue;
  appConfigurationManager_gChangeQueue = (uint64_t)v1;

  uint64_t v3 = [[NEConfigurationManager alloc] initWithPluginType:v5];
  BOOL v4 = (void *)appConfigurationManager_gAppConfgurationManager;
  appConfigurationManager_gAppConfgurationManager = (uint64_t)v3;

  [(id)appConfigurationManager_gAppConfgurationManager setChangedQueue:appConfigurationManager_gChangeQueue andHandler:&__block_literal_global_28_5516];
}

void __42__NEFilterManager_appConfigurationManager__block_invoke_2()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"com.apple.networkextension.filter-configuration-changed" object:0];
}

- (void)dealloc
{
  if (self && self->_statusObserver)
  {
    uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    BOOL v4 = self->_statusObserver;
    [v3 removeObserver:v4 name:@"com.apple.networkextension.statuschanged" object:self->_connection];
  }
  v5.receiver = self;
  v5.super_class = (Class)NEFilterManager;
  [(NEFilterManager *)&v5 dealloc];
}

- (NEFilterManager)init
{
}

+ (void)loadMyFiltersFromPreferencesWithCompletionHandler:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[NEFilterManager appConfigurationManager]();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__NEFilterManager_loadMyFiltersFromPreferencesWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5993680;
  id v7 = v3;
  id v5 = v3;
  [v4 loadConfigurationsWithCompletionQueue:MEMORY[0x1E4F14428] handler:v6];
}

void __69__NEFilterManager_loadMyFiltersFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  objc_super v6 = dispatch_group_create();
  if (a3)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = objc_alloc_init(MEMORY[0x1E4F1C978]);
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
  }
  else
  {
    uint64_t v21 = a1;
    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v29 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v15 = objc_msgSend(v14, "contentFilter", v21);

            if (v15)
            {
              dispatch_group_enter(v6);
              BOOL v16 = [NEFilterManager alloc];
              id v17 = +[NEFilterManager appConfigurationManager]();
              BOOL v18 = -[NEFilterManager initWithConfiguration:configurationManager:]((id *)&v16->super.isa, v14, v17);

              if (v18) {
                *((unsigned char *)v18 + 8) = 1;
              }
              v26[0] = MEMORY[0x1E4F143A8];
              v26[1] = 3221225472;
              v26[2] = __69__NEFilterManager_loadMyFiltersFromPreferencesWithCompletionHandler___block_invoke_2;
              v26[3] = &unk_1E5991A08;
              v26[4] = v14;
              long long v27 = v6;
              -[NEFilterManager setupSessionWithCompletionHandler:]((uint64_t)v18, v26);
              [v22 addObject:v18];
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v11);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__NEFilterManager_loadMyFiltersFromPreferencesWithCompletionHandler___block_invoke_33;
    block[3] = &unk_1E59936F8;
    id v19 = *(id *)(v21 + 32);
    id v24 = v22;
    id v25 = v19;
    id v20 = v22;
    dispatch_group_notify(v6, MEMORY[0x1E4F14428], block);
  }
}

- (id)initWithConfiguration:(void *)a3 configurationManager:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)NEFilterManager;
    id v8 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 5, a2);
      objc_storeStrong(a1 + 2, a3);
      id v9 = -[NEVPNConnection initWithType:]([NEVPNConnection alloc], 4);
      id v10 = a1[3];
      a1[3] = v9;
    }
  }

  return a1;
}

void __69__NEFilterManager_loadMyFiltersFromPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = [*(id *)(a1 + 32) name];
      id v6 = [*(id *)(a1 + 32) identifier];
      int v7 = 138412802;
      id v8 = v5;
      __int16 v9 = 2112;
      id v10 = v6;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_error_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_ERROR, "Failed to create a content filter session for configuration %@ (%@): %@", (uint8_t *)&v7, 0x20u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)setupSessionWithCompletionHandler:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    objc_initWeak(&location, (id)a1);
    BOOL v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v5 = *(id *)(a1 + 24);
    id v6 = [MEMORY[0x1E4F28F08] mainQueue];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __53__NEFilterManager_setupSessionWithCompletionHandler___block_invoke;
    uint64_t v15 = &unk_1E5991A30;
    objc_copyWeak(&v16, &location);
    uint64_t v7 = [v4 addObserverForName:@"com.apple.networkextension.statuschanged" object:v5 queue:v6 usingBlock:&v12];
    id v8 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = v7;

    id v9 = *(id *)(a1 + 24);
    id v10 = objc_msgSend((id)a1, "configuration", v12, v13, v14, v15);
    __int16 v11 = [v10 identifier];
    if (v9) {
      -[NEVPNConnection createSessionWithConfigurationIdentifier:forceInfoFetch:completionHandler:](v9, v11, 0, v3);
    }

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __69__NEFilterManager_loadMyFiltersFromPreferencesWithCompletionHandler___block_invoke_33(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __53__NEFilterManager_setupSessionWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v2 = [WeakRetained delegate];
    id v3 = v2;
    if (v2) {
      [v2 filterStatusDidChange:v4];
    }

    id WeakRetained = v4;
  }
}

+ (void)loadAllFromPreferencesWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = +[NEFilterManager globalConfigurationManager]();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__NEFilterManager_loadAllFromPreferencesWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5993680;
  id v7 = v3;
  id v5 = v3;
  [v4 loadConfigurationsWithCompletionQueue:MEMORY[0x1E4F14428] handler:v6];
}

+ (id)globalConfigurationManager
{
  self;
  if (globalConfigurationManager_onceToken_5533 != -1) {
    dispatch_once(&globalConfigurationManager_onceToken_5533, &__block_literal_global_20_5534);
  }
  id v0 = (void *)globalConfigurationManager_gConfigurationManager_5535;

  return v0;
}

void __63__NEFilterManager_loadAllFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = dispatch_group_create();
  if (a3)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = objc_alloc_init(MEMORY[0x1E4F1C978]);
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
  }
  else
  {
    uint64_t v21 = a1;
    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v29 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v15 = objc_msgSend(v14, "contentFilter", v21);

            if (v15)
            {
              dispatch_group_enter(v6);
              id v16 = [NEFilterManager alloc];
              id v17 = +[NEFilterManager globalConfigurationManager]();
              BOOL v18 = -[NEFilterManager initWithConfiguration:configurationManager:]((id *)&v16->super.isa, v14, v17);

              if (v18) {
                *((unsigned char *)v18 + 8) = 1;
              }
              v26[0] = MEMORY[0x1E4F143A8];
              v26[1] = 3221225472;
              v26[2] = __63__NEFilterManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_2;
              v26[3] = &unk_1E5991A08;
              v26[4] = v14;
              long long v27 = v6;
              -[NEFilterManager setupSessionWithCompletionHandler:]((uint64_t)v18, v26);
              [v22 addObject:v18];
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v11);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__NEFilterManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_31;
    block[3] = &unk_1E59936F8;
    id v19 = *(id *)(v21 + 32);
    id v24 = v22;
    id v25 = v19;
    id v20 = v22;
    dispatch_group_notify(v6, MEMORY[0x1E4F14428], block);
  }
}

void __63__NEFilterManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = [*(id *)(a1 + 32) name];
      id v6 = [*(id *)(a1 + 32) identifier];
      int v7 = 138412802;
      id v8 = v5;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_error_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_ERROR, "Failed to create a content filter session for configuration %@ (%@): %@", (uint8_t *)&v7, 0x20u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __63__NEFilterManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_31(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

uint64_t __45__NEFilterManager_globalConfigurationManager__block_invoke()
{
  if (NEInitCFTypes_onceToken != -1) {
    dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_24415);
  }
  id v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("filter config manager change queue", v0);
  id v2 = (void *)globalConfigurationManager_gChangeQueue_5538;
  globalConfigurationManager_gChangeQueue_5538 = (uint64_t)v1;

  id v3 = [[NEConfigurationManager alloc] initForAllUsers];
  id v4 = (void *)globalConfigurationManager_gConfigurationManager_5535;
  globalConfigurationManager_gConfigurationManager_5535 = (uint64_t)v3;

  id v5 = (void *)globalConfigurationManager_gConfigurationManager_5535;
  uint64_t v6 = globalConfigurationManager_gChangeQueue_5538;

  return [v5 setChangedQueue:v6 andHandler:&__block_literal_global_23];
}

void __45__NEFilterManager_globalConfigurationManager__block_invoke_2()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"com.apple.networkextension.filter-configuration-changed" object:0];
}

+ (id)sharedManagerWithSystemFilter
{
  if (sharedManagerWithSystemFilter_onceToken != -1) {
    dispatch_once(&sharedManagerWithSystemFilter_onceToken, &__block_literal_global_18);
  }
  id v2 = (void *)sharedManagerWithSystemFilter_gFilterManager;

  return v2;
}

void __48__NEFilterManager_sharedManagerWithSystemFilter__block_invoke()
{
  id v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = [v0 bundleIdentifier];

  if (NEInitCFTypes_onceToken != -1) {
    dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_24415);
  }
  if (v3)
  {
    dispatch_queue_t v1 = [NEFilterManager alloc];
    if (v1)
    {
      v1->_isSystemGradeFilter = 1;
      dispatch_queue_t v1 = (NEFilterManager *)-[NEFilterManager initFilterManagerWithPluginType:](v1, v3);
    }
    id v2 = (void *)sharedManagerWithSystemFilter_gFilterManager;
    sharedManagerWithSystemFilter_gFilterManager = (uint64_t)v1;
  }
}

- (void)initFilterManagerWithPluginType:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)NEFilterManager;
    a1 = objc_msgSendSuper2(&v13, sel_init);
    if (a1)
    {
      objc_initWeak(&location, a1);
      id v4 = [[NEConfigurationManager alloc] initWithPluginType:v3];
      id v5 = (void *)a1[2];
      a1[2] = v4;

      uint64_t v6 = (void *)a1[2];
      uint64_t v7 = MEMORY[0x1E4F14428];
      id v8 = MEMORY[0x1E4F14428];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __51__NEFilterManager_initFilterManagerWithPluginType___block_invoke;
      v10[3] = &unk_1E5992DE0;
      objc_copyWeak(&v11, &location);
      [v6 setChangedQueue:v7 andHandler:v10];

      -[NEFilterManager createEmptyConfiguration](a1);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }

  return a1;
}

void __51__NEFilterManager_initFilterManagerWithPluginType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__NEFilterManager_initFilterManagerWithPluginType___block_invoke_2;
  v6[3] = &unk_1E59924B8;
  objc_copyWeak(&v7, v4);
  [WeakRetained loadFromPreferencesWithCompletionHandler:v6];

  objc_destroyWeak(&v7);
}

void __51__NEFilterManager_initFilterManagerWithPluginType___block_invoke_2(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 postNotificationName:@"com.apple.networkextension.filter-configuration-changed" object:WeakRetained];
}

+ (NEFilterManager)sharedManager
{
  if (sharedManager_onceToken_5539 != -1) {
    dispatch_once(&sharedManager_onceToken_5539, &__block_literal_global_5540);
  }
  id v2 = (void *)sharedManager_gFilterManager;

  return (NEFilterManager *)v2;
}

void __32__NEFilterManager_sharedManager__block_invoke()
{
  id v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v4 = [v0 bundleIdentifier];

  if (NEInitCFTypes_onceToken != -1) {
    dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_24415);
  }
  dispatch_queue_t v1 = v4;
  if (v4)
  {
    id v2 = -[NEFilterManager initFilterManagerWithPluginType:]([NEFilterManager alloc], v4);
    id v3 = (void *)sharedManager_gFilterManager;
    sharedManager_gFilterManager = (uint64_t)v2;

    dispatch_queue_t v1 = v4;
  }
}

@end