@interface NEDNSProxyManager
+ (NEDNSProxyManager)sharedManager;
+ (id)globalConfigurationManager;
+ (void)loadAllFromPreferencesWithCompletionHandler:(id)a3;
- (BOOL)isEnabled;
- (BOOL)isFromMDM;
- (BOOL)isFromProfile;
- (NEConfiguration)configuration;
- (NEDNSProxyManager)init;
- (NEDNSProxyManagerDelegate)delegate;
- (NEDNSProxyProviderProtocol)providerProtocol;
- (NEProfileIngestionPayloadInfo)configurationPayloadInfo;
- (NSString)appBundleIdentifier;
- (NSString)localizedDescription;
- (NSUUID)identifier;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (void)createEmptyConfiguration;
- (void)dealloc;
- (void)fetchStatusWithCompletionHandler:(id)a3;
- (void)loadFromPreferencesWithCompletionHandler:(void *)completionHandler;
- (void)removeFromPreferencesWithCompletionHandler:(void *)completionHandler;
- (void)saveToPreferencesWithCompletionHandler:(void *)completionHandler;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)enabled;
- (void)setLocalizedDescription:(NSString *)localizedDescription;
- (void)setProviderProtocol:(NEDNSProxyProviderProtocol *)providerProtocol;
@end

@implementation NEDNSProxyManager

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

- (NEDNSProxyManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NEDNSProxyManagerDelegate *)WeakRetained;
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
  v7[2] = __54__NEDNSProxyManager_fetchStatusWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E59932E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[NEVPNConnection updateSessionInfoForce:notify:withCompletionHandler:]((uint64_t)connection, 1, 0, v7);
}

uint64_t __54__NEDNSProxyManager_fetchStatusWithCompletionHandler___block_invoke(uint64_t a1)
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
  uint64_t v2 = [(NEDNSProxyManager *)self configuration];
  v3 = [v2 payloadInfo];

  return (NEProfileIngestionPayloadInfo *)v3;
}

- (BOOL)isFromMDM
{
  if (![(NEDNSProxyManager *)self isFromProfile]) {
    return 0;
  }
  v3 = [(NEDNSProxyManager *)self configuration];
  id v4 = [v3 payloadInfo];
  BOOL v5 = [v4 profileSource] == 2;

  return v5;
}

- (BOOL)isFromProfile
{
  uint64_t v2 = [(NEDNSProxyManager *)self configuration];
  v3 = [v2 payloadInfo];
  BOOL v4 = v3 != 0;

  return v4;
}

- (NSString)appBundleIdentifier
{
  uint64_t v2 = [(NEDNSProxyManager *)self configuration];
  v3 = [v2 application];

  return (NSString *)v3;
}

- (NSUUID)identifier
{
  uint64_t v2 = [(NEDNSProxyManager *)self configuration];
  v3 = [v2 identifier];

  return (NSUUID *)v3;
}

- (id)description
{
  return [(NEDNSProxyManager *)self descriptionWithIndent:0 options:14];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  [v7 appendString:@"{"];
  id v8 = [(NEDNSProxyManager *)self localizedDescription];
  [v7 appendPrettyObject:v8 withName:@"localizedDescription" andIndent:v5 options:a4];

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEDNSProxyManager isEnabled](self, "isEnabled"), @"enabled", v5, a4);
  v9 = [(NEDNSProxyManager *)self providerProtocol];
  [v7 appendPrettyObject:v9 withName:@"providerProtocol" andIndent:v5 options:a4];

  [v7 appendString:@"\n}"];

  return v7;
}

- (void)setLocalizedDescription:(NSString *)localizedDescription
{
  id v6 = localizedDescription;
  BOOL v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(NEDNSProxyManager *)v4 configuration];
  [v5 setName:v6];

  objc_sync_exit(v4);
}

- (NSString)localizedDescription
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  v3 = [(NEDNSProxyManager *)v2 configuration];
  BOOL v4 = [v3 name];

  objc_sync_exit(v2);

  return (NSString *)v4;
}

- (void)setEnabled:(BOOL)enabled
{
  BOOL v3 = enabled;
  obj = self;
  objc_sync_enter(obj);
  BOOL v4 = [(NEDNSProxyManager *)obj configuration];
  uint64_t v5 = [v4 dnsProxy];
  [v5 setEnabled:v3];

  objc_sync_exit(obj);
}

- (BOOL)isEnabled
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(NEDNSProxyManager *)v2 configuration];
  BOOL v4 = [v3 dnsProxy];
  char v5 = [v4 isEnabled];

  objc_sync_exit(v2);
  return v5;
}

- (void)setProviderProtocol:(NEDNSProxyProviderProtocol *)providerProtocol
{
  v7 = providerProtocol;
  BOOL v4 = self;
  objc_sync_enter(v4);
  char v5 = [(NEDNSProxyManager *)v4 configuration];
  id v6 = [v5 dnsProxy];
  [v6 setProtocol:v7];

  objc_sync_exit(v4);
}

- (NEDNSProxyProviderProtocol)providerProtocol
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(NEDNSProxyManager *)v2 configuration];
  BOOL v4 = [v3 dnsProxy];
  char v5 = [v4 protocol];

  objc_sync_exit(v2);

  return (NEDNSProxyProviderProtocol *)v5;
}

- (void)saveToPreferencesWithCompletionHandler:(void *)completionHandler
{
  BOOL v4 = completionHandler;
  char v5 = self;
  objc_sync_enter(v5);
  if (v5 && v5->_hasLoaded)
  {
    v7 = [(NEDNSProxyManager *)v5 providerProtocol];

    if (v7)
    {
      id v8 = [(NEDNSProxyManager *)v5 providerProtocol];
      v9 = [v8 providerBundleIdentifier];

      self;
      id v6 = v9;

      v10 = [(NEDNSProxyManager *)v5 providerProtocol];
      [v10 setProviderBundleIdentifier:v6];

      id v12 = objc_getProperty(v5, v11, 16, 1);
      v13 = [v12 pluginType];

      if (v13)
      {
        id v15 = objc_getProperty(v5, v14, 16, 1);
        v16 = [v15 pluginType];
        v17 = [(NEDNSProxyManager *)v5 providerProtocol];
        [v17 setPluginType:v16];
      }
      v18 = [(NEDNSProxyManager *)v5 configuration];
      if (v18) {
        v18[20] = 0;
      }

      id v20 = objc_getProperty(v5, v19, 16, 1);
      v21 = [(NEDNSProxyManager *)v5 configuration];
      uint64_t v22 = MEMORY[0x1E4F14428];
      id v23 = MEMORY[0x1E4F14428];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __60__NEDNSProxyManager_saveToPreferencesWithCompletionHandler___block_invoke_3;
      v24[3] = &unk_1E5991A58;
      id v25 = v4;
      [v20 saveConfiguration:v21 withCompletionQueue:v22 handler:v24];

      goto LABEL_13;
    }
    if (v4)
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __60__NEDNSProxyManager_saveToPreferencesWithCompletionHandler___block_invoke_2;
      v26[3] = &unk_1E5993770;
      id v27 = v4;
      dispatch_async(MEMORY[0x1E4F14428], v26);
      id v6 = v27;
      goto LABEL_13;
    }
  }
  else if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__NEDNSProxyManager_saveToPreferencesWithCompletionHandler___block_invoke;
    block[3] = &unk_1E5993770;
    id v29 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
    id v6 = v29;
LABEL_13:
  }
  objc_sync_exit(v5);
}

void __60__NEDNSProxyManager_saveToPreferencesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NEDNSProxyErrorDomain" code:3 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __60__NEDNSProxyManager_saveToPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NEDNSProxyErrorDomain" code:1 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __60__NEDNSProxyManager_saveToPreferencesWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = v3;
  if (v3 && [v3 code] != 9)
  {
    char v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      SEL v11 = "-[NEDNSProxyManager saveToPreferencesWithCompletionHandler:]_block_invoke_3";
      __int16 v12 = 2112;
      v13 = v4;
      _os_log_error_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_ERROR, "%s: failed to save the new configuration: %@", buf, 0x16u);
    }
  }
  id v6 = *(void **)(a1 + 32);
  if (v6)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __60__NEDNSProxyManager_saveToPreferencesWithCompletionHandler___block_invoke_33;
    v7[3] = &unk_1E59936F8;
    id v9 = v6;
    id v8 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
}

void __60__NEDNSProxyManager_saveToPreferencesWithCompletionHandler___block_invoke_33(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  NEDNSProxyMapError(*(void **)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)removeFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  BOOL v4 = completionHandler;
  char v5 = self;
  objc_sync_enter(v5);
  id v6 = [(NEDNSProxyManager *)v5 configuration];

  if (v6)
  {
    v7 = [(NEDNSProxyManager *)v5 configuration];
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
      id v15 = [(NEDNSProxyManager *)v5 configuration];
      uint64_t v16 = MEMORY[0x1E4F14428];
      id v17 = MEMORY[0x1E4F14428];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __64__NEDNSProxyManager_removeFromPreferencesWithCompletionHandler___block_invoke_3;
      v18[3] = &unk_1E5991A58;
      id v19 = v4;
      [v14 removeConfiguration:v15 withCompletionQueue:v16 handler:v18];
      v10 = &v19;

      goto LABEL_11;
    }
    if (v4)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __64__NEDNSProxyManager_removeFromPreferencesWithCompletionHandler___block_invoke_2;
      v20[3] = &unk_1E5993770;
      v10 = &v21;
      id v21 = v4;
      SEL v11 = MEMORY[0x1E4F14428];
      __int16 v12 = v20;
LABEL_7:
      dispatch_async(v11, v12);
LABEL_11:
    }
  }
  else if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__NEDNSProxyManager_removeFromPreferencesWithCompletionHandler___block_invoke;
    block[3] = &unk_1E5993770;
    v10 = &v23;
    id v23 = v4;
    SEL v11 = MEMORY[0x1E4F14428];
    __int16 v12 = block;
    goto LABEL_7;
  }
  objc_sync_exit(v5);
}

void __64__NEDNSProxyManager_removeFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NEDNSProxyErrorDomain" code:3 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __64__NEDNSProxyManager_removeFromPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NEDNSProxyErrorDomain" code:4 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __64__NEDNSProxyManager_removeFromPreferencesWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[NEDNSProxyManager removeFromPreferencesWithCompletionHandler:]_block_invoke_3";
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_error_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_ERROR, "%s: failed to remove the configuration: %@", buf, 0x16u);
    }
  }
  char v5 = *(void **)(a1 + 32);
  if (v5)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __64__NEDNSProxyManager_removeFromPreferencesWithCompletionHandler___block_invoke_28;
    v6[3] = &unk_1E59936F8;
    id v8 = v5;
    id v7 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

void __64__NEDNSProxyManager_removeFromPreferencesWithCompletionHandler___block_invoke_28(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  NEDNSProxyMapError(*(void **)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
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
    v11[2] = __62__NEDNSProxyManager_loadFromPreferencesWithCompletionHandler___block_invoke;
    v11[3] = &unk_1E5993720;
    v11[4] = v5;
    id v12 = v4;
    [v8 loadConfigurationsWithCompletionQueue:v9 handler:v11];

    objc_sync_exit(v5);
  }
}

void __62__NEDNSProxyManager_loadFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v20 = a2;
  id v5 = a3;
  id v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  if (v5) {
    goto LABEL_22;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v20;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v8)
  {

LABEL_18:
    -[NEDNSProxyManager createEmptyConfiguration](*(void **)(a1 + 32));
    id v9 = 0;
    goto LABEL_19;
  }
  id v9 = 0;
  uint64_t v10 = *(void *)v25;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v25 != v10) {
        objc_enumerationMutation(v7);
      }
      id v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
      uint64_t v13 = [v12 dnsProxy];
      BOOL v14 = v13 == 0;

      if (!v14)
      {
        id v15 = [v12 payloadInfo];
        BOOL v16 = v15 == 0;

        if (!v16)
        {
          id v17 = v12;

          id v9 = v17;
          goto LABEL_15;
        }
        if (!v9) {
          id v9 = v12;
        }
      }
    }
    uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v8) {
      continue;
    }
    break;
  }
LABEL_15:

  if (!v9) {
    goto LABEL_18;
  }
  [*(id *)(a1 + 32) setConfiguration:v9];
LABEL_19:
  uint64_t v18 = *(void *)(a1 + 32);
  if (v18) {
    *(unsigned char *)(v18 + 8) = 1;
  }

LABEL_22:
  id v19 = *(void **)(a1 + 40);
  if (v19)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__NEDNSProxyManager_loadFromPreferencesWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E59936F8;
    id v23 = v19;
    id v22 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  objc_sync_exit(v6);
}

- (void)createEmptyConfiguration
{
  if (a1)
  {
    id v2 = [MEMORY[0x1E4F28B50] mainBundle];
    id v3 = [v2 infoDictionary];
    id v18 = [v3 objectForKey:*MEMORY[0x1E4F1CC48]];

    if (!v18)
    {
      BOOL v4 = [MEMORY[0x1E4F28B50] mainBundle];
      id v18 = [v4 bundleIdentifier];
    }
    id v5 = [[NEConfiguration alloc] initWithName:v18 grade:1];
    [a1 setConfiguration:v5];

    id v6 = objc_alloc_init(NEDNSProxy);
    id v7 = [a1 configuration];
    [v7 setDnsProxy:v6];

    uint64_t v8 = [NEDNSProxyProviderProtocol alloc];
    uint64_t v10 = objc_msgSend(objc_getProperty(a1, v9, 16, 1), "pluginType");
    __int16 v11 = [(NEDNSProxyProviderProtocol *)v8 initWithPluginType:v10];
    id v12 = [a1 configuration];
    uint64_t v13 = [v12 dnsProxy];
    [v13 setProtocol:v11];

    id v15 = objc_msgSend(objc_getProperty(a1, v14, 16, 1), "pluginType");
    BOOL v16 = [a1 configuration];
    [v16 setApplication:v15];

    id v17 = [a1 configuration];
    [v17 setApplicationName:v18];
  }
}

void __62__NEDNSProxyManager_loadFromPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  NEDNSProxyMapError(*(void **)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)dealloc
{
  if (self && self->_statusObserver)
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    BOOL v4 = self->_statusObserver;
    [v3 removeObserver:v4 name:@"com.apple.networkextension.statuschanged" object:self->_connection];
  }
  v5.receiver = self;
  v5.super_class = (Class)NEDNSProxyManager;
  [(NEDNSProxyManager *)&v5 dealloc];
}

- (NEDNSProxyManager)init
{
  id v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_error_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_ERROR, "MDM must be used to create NEDNSProxyProvider configurations", v5, 2u);
  }

  return 0;
}

+ (void)loadAllFromPreferencesWithCompletionHandler:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    BOOL v4 = +[NEDNSProxyManager globalConfigurationManager]();
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __65__NEDNSProxyManager_loadAllFromPreferencesWithCompletionHandler___block_invoke;
    v5[3] = &unk_1E5993680;
    id v6 = v3;
    [v4 loadConfigurationsWithCompletionQueue:MEMORY[0x1E4F14428] handler:v5];
  }
}

+ (id)globalConfigurationManager
{
  self;
  if (globalConfigurationManager_onceToken != -1) {
    dispatch_once(&globalConfigurationManager_onceToken, &__block_literal_global_17);
  }
  v0 = (void *)globalConfigurationManager_gConfigurationManager;

  return v0;
}

void __65__NEDNSProxyManager_loadAllFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = dispatch_group_create();
  v35 = v5;
  if (a3)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = objc_alloc_init(MEMORY[0x1E4F1C978]);
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
  }
  else
  {
    uint64_t v34 = a1;
    id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = v5;
    uint64_t v9 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v44 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          if (v12)
          {
            uint64_t v13 = [*(id *)(*((void *)&v43 + 1) + 8 * i) dnsProxy];
            BOOL v14 = v13 == 0;

            if (!v14)
            {
              dispatch_group_enter(v6);
              id v15 = [NEDNSProxyManager alloc];
              id v16 = v12;
              if (v15
                && (v47.receiver = v15,
                    v47.super_class = (Class)NEDNSProxyManager,
                    id v17 = (id *)objc_msgSendSuper2(&v47, sel_init),
                    (id v18 = v17) != 0))
              {
                objc_storeStrong(v17 + 5, v12);
                uint64_t v19 = +[NEDNSProxyManager globalConfigurationManager]();
                id v20 = v18[2];
                v18[2] = (id)v19;

                id v21 = -[NEVPNConnection initWithType:]([NEVPNConnection alloc], 6);
                id v22 = v18[3];
                v18[3] = v21;

                *((unsigned char *)v18 + 8) = 1;
              }
              else
              {

                id v18 = 0;
              }
              v41[0] = MEMORY[0x1E4F143A8];
              v41[1] = 3221225472;
              v41[2] = __65__NEDNSProxyManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_2;
              v41[3] = &unk_1E5991A08;
              v41[4] = v16;
              v42 = v6;
              id v23 = v41;
              if (v18)
              {
                objc_initWeak(&location, v18);
                long long v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
                id v25 = v18[3];
                long long v26 = [MEMORY[0x1E4F28F08] mainQueue];
                v47.receiver = (id)MEMORY[0x1E4F143A8];
                v47.super_class = (Class)3221225472;
                v48 = __55__NEDNSProxyManager_setupSessionWithCompletionHandler___block_invoke;
                v49 = &unk_1E5991A30;
                objc_copyWeak(&v50, &location);
                uint64_t v27 = [v24 addObserverForName:@"com.apple.networkextension.statuschanged" object:v25 queue:v26 usingBlock:&v47];
                id v28 = v18[4];
                void v18[4] = (id)v27;

                id v29 = v18[3];
                v30 = [v18 configuration];
                v31 = [v30 identifier];
                if (v29) {
                  -[NEVPNConnection createSessionWithConfigurationIdentifier:forceInfoFetch:completionHandler:](v29, v31, 0, v23);
                }

                objc_destroyWeak(&v50);
                objc_destroyWeak(&location);
              }

              [v37 addObject:v18];
            }
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
      }
      while (v9);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__NEDNSProxyManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_23;
    block[3] = &unk_1E59936F8;
    id v32 = *(id *)(v34 + 32);
    id v39 = v37;
    id v40 = v32;
    id v33 = v37;
    dispatch_group_notify(v6, MEMORY[0x1E4F14428], block);
  }
}

void __65__NEDNSProxyManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
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
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_error_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_ERROR, "Failed to create a DNS proxy session for configuration %@ (%@): %@", (uint8_t *)&v7, 0x20u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __65__NEDNSProxyManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_23(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __55__NEDNSProxyManager_setupSessionWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v2 = [WeakRetained delegate];
    id v3 = v2;
    if (v2) {
      [v2 dnsProxyStatusDidChange:v4];
    }

    id WeakRetained = v4;
  }
}

uint64_t __47__NEDNSProxyManager_globalConfigurationManager__block_invoke()
{
  if (NEInitCFTypes_onceToken != -1) {
    dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_24415);
  }
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("dns proxy config manager change queue", v0);
  id v2 = (void *)globalConfigurationManager_gChangeQueue;
  globalConfigurationManager_gChangeQueue = (uint64_t)v1;

  id v3 = [[NEConfigurationManager alloc] initForAllUsers];
  id v4 = (void *)globalConfigurationManager_gConfigurationManager;
  globalConfigurationManager_gConfigurationManager = (uint64_t)v3;

  id v5 = (void *)globalConfigurationManager_gConfigurationManager;
  uint64_t v6 = globalConfigurationManager_gChangeQueue;

  return [v5 setChangedQueue:v6 andHandler:&__block_literal_global_20];
}

void __47__NEDNSProxyManager_globalConfigurationManager__block_invoke_2()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"com.apple.networkextension.dns-proxy-configuration-changed" object:0];
}

+ (NEDNSProxyManager)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_1420);
  }
  id v2 = (void *)sharedManager_gDNSProxyManager;
  if (sharedManager_gDNSProxyManager) {
    id v3 = (id)sharedManager_gDNSProxyManager;
  }

  return (NEDNSProxyManager *)v2;
}

void __34__NEDNSProxyManager_sharedManager__block_invoke()
{
  id v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v10 = [v0 bundleIdentifier];

  if (NEInitCFTypes_onceToken != -1) {
    dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_24415);
  }
  dispatch_queue_t v1 = v10;
  if (v10)
  {
    id v2 = [NEDNSProxyManager alloc];
    id v3 = v10;
    if (v2)
    {
      v14.receiver = v2;
      v14.super_class = (Class)NEDNSProxyManager;
      id v2 = (NEDNSProxyManager *)objc_msgSendSuper2(&v14, sel_init);
      if (v2)
      {
        objc_initWeak(&location, v2);
        id v4 = [[NEConfigurationManager alloc] initWithPluginType:v3];
        configurationManager = v2->_configurationManager;
        v2->_configurationManager = v4;

        uint64_t v6 = v2->_configurationManager;
        uint64_t v7 = MEMORY[0x1E4F14428];
        id v8 = MEMORY[0x1E4F14428];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __55__NEDNSProxyManager_initDNSProxyManagerWithPluginType___block_invoke;
        v11[3] = &unk_1E5992DE0;
        objc_copyWeak(&v12, &location);
        [(NEConfigurationManager *)v6 setChangedQueue:v7 andHandler:v11];

        -[NEDNSProxyManager createEmptyConfiguration](v2);
        objc_destroyWeak(&v12);
        objc_destroyWeak(&location);
      }
    }

    __int16 v9 = (void *)sharedManager_gDNSProxyManager;
    sharedManager_gDNSProxyManager = (uint64_t)v2;

    dispatch_queue_t v1 = v10;
  }
}

void __55__NEDNSProxyManager_initDNSProxyManagerWithPluginType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__NEDNSProxyManager_initDNSProxyManagerWithPluginType___block_invoke_2;
  v6[3] = &unk_1E59924B8;
  objc_copyWeak(&v7, v4);
  [WeakRetained loadFromPreferencesWithCompletionHandler:v6];

  objc_destroyWeak(&v7);
}

void __55__NEDNSProxyManager_initDNSProxyManagerWithPluginType___block_invoke_2(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 postNotificationName:@"com.apple.networkextension.dns-proxy-configuration-changed" object:WeakRetained];
}

@end