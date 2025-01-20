@interface NEDNSSettingsManager
+ (NEDNSSettingsManager)sharedManager;
+ (id)globalConfigurationManager;
+ (void)loadAllFromPreferencesWithCompletionHandler:(id)a3;
- (BOOL)isConfigurationGradeEnterprise;
- (BOOL)isEnabled;
- (BOOL)isFromProfile;
- (NEDNSSettings)dnsSettings;
- (NEDNSSettingsManager)init;
- (NEDNSSettingsManagerDelegate)delegate;
- (NEProfileIngestionPayloadInfo)configurationPayloadInfo;
- (NSArray)onDemandRules;
- (NSString)appBundleIdentifier;
- (NSString)localizedDescription;
- (NSUUID)identifier;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (void)createEmptyConfigurationWithGrade:(void *)a1;
- (void)fetchStatusWithCompletionHandler:(id)a3;
- (void)loadFromPreferencesWithCompletionHandler:(void *)completionHandler;
- (void)removeFromPreferencesWithCompletionHandler:(void *)completionHandler;
- (void)saveToPreferencesWithCompletionHandler:(void *)completionHandler;
- (void)setDelegate:(id)a3;
- (void)setDnsSettings:(NEDNSSettings *)dnsSettings;
- (void)setEnabled:(BOOL)a3;
- (void)setLocalizedDescription:(NSString *)localizedDescription;
- (void)setOnDemandRules:(NSArray *)onDemandRules;
@end

@implementation NEDNSSettingsManager

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

- (NEDNSSettingsManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NEDNSSettingsManagerDelegate *)WeakRetained;
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
  v7[2] = __57__NEDNSSettingsManager_fetchStatusWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E59932E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[NEVPNConnection updateSessionInfoForce:notify:withCompletionHandler:]((uint64_t)connection, 1, 0, v7);
}

uint64_t __57__NEDNSSettingsManager_fetchStatusWithCompletionHandler___block_invoke(uint64_t a1)
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

- (BOOL)isConfigurationGradeEnterprise
{
  if (self) {
    self = (NEDNSSettingsManager *)objc_getProperty(self, a2, 40, 1);
  }
  return [(NEDNSSettingsManager *)self grade] == 1;
}

- (NEProfileIngestionPayloadInfo)configurationPayloadInfo
{
  if (self)
  {
    self = (NEDNSSettingsManager *)objc_getProperty(self, a2, 40, 1);
    uint64_t v2 = vars8;
  }
  return (NEProfileIngestionPayloadInfo *)[(NEDNSSettingsManager *)self payloadInfo];
}

- (BOOL)isFromProfile
{
  if (self) {
    self = (NEDNSSettingsManager *)objc_getProperty(self, a2, 40, 1);
  }
  uint64_t v2 = [(NEDNSSettingsManager *)self payloadInfo];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSString)appBundleIdentifier
{
  if (self)
  {
    self = (NEDNSSettingsManager *)objc_getProperty(self, a2, 40, 1);
    uint64_t v2 = vars8;
  }
  return (NSString *)[(NEDNSSettingsManager *)self application];
}

- (NSUUID)identifier
{
  if (self)
  {
    self = (NEDNSSettingsManager *)objc_getProperty(self, a2, 40, 1);
    uint64_t v2 = vars8;
  }
  return [(NEDNSSettingsManager *)self identifier];
}

- (id)description
{
  return [(NEDNSSettingsManager *)self descriptionWithIndent:0 options:14];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  id v8 = [(NEDNSSettingsManager *)self localizedDescription];
  [v7 appendPrettyObject:v8 withName:@"localizedDescription" andIndent:v5 options:a4];

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEDNSSettingsManager isEnabled](self, "isEnabled"), @"enabled", v5, a4);
  v9 = [(NEDNSSettingsManager *)self dnsSettings];
  [v7 appendPrettyObject:v9 withName:@"dnsSettings" andIndent:v5 options:a4];

  v10 = [(NEDNSSettingsManager *)self onDemandRules];
  [v7 appendPrettyObject:v10 withName:@"onDemandRules" andIndent:v5 options:a4];

  return v7;
}

- (void)setLocalizedDescription:(NSString *)localizedDescription
{
  id v8 = localizedDescription;
  id v4 = self;
  objc_sync_enter(v4);
  if (v4) {
    id Property = objc_getProperty(v4, v5, 40, 1);
  }
  else {
    id Property = 0;
  }
  id v7 = Property;
  [v7 setName:v8];

  objc_sync_exit(v4);
}

- (NSString)localizedDescription
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    id Property = objc_getProperty(v2, v3, 40, 1);
  }
  else {
    id Property = 0;
  }
  id v5 = Property;
  id v6 = [v5 name];

  objc_sync_exit(v2);

  return (NSString *)v6;
}

- (void)setOnDemandRules:(NSArray *)onDemandRules
{
  v9 = onDemandRules;
  id v4 = self;
  objc_sync_enter(v4);
  if (v4) {
    id Property = objc_getProperty(v4, v5, 40, 1);
  }
  else {
    id Property = 0;
  }
  id v7 = Property;
  id v8 = [v7 dnsSettings];
  [v8 setOnDemandRules:v9];

  objc_sync_exit(v4);
}

- (NSArray)onDemandRules
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    id Property = objc_getProperty(v2, v3, 40, 1);
  }
  else {
    id Property = 0;
  }
  id v5 = Property;
  id v6 = [v5 dnsSettings];
  id v7 = [v6 onDemandRules];

  objc_sync_exit(v2);

  return (NSArray *)v7;
}

- (void)setDnsSettings:(NEDNSSettings *)dnsSettings
{
  v9 = dnsSettings;
  id v4 = self;
  objc_sync_enter(v4);
  if (v4) {
    id Property = objc_getProperty(v4, v5, 40, 1);
  }
  else {
    id Property = 0;
  }
  id v7 = Property;
  id v8 = [v7 dnsSettings];
  [v8 setSettings:v9];

  objc_sync_exit(v4);
}

- (NEDNSSettings)dnsSettings
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    id Property = objc_getProperty(v2, v3, 40, 1);
  }
  else {
    id Property = 0;
  }
  id v5 = Property;
  id v6 = [v5 dnsSettings];
  id v7 = [v6 settings];

  objc_sync_exit(v2);

  return (NEDNSSettings *)v7;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  selfa = self;
  objc_sync_enter(selfa);
  id Property = selfa;
  if (selfa) {
    id Property = objc_getProperty(selfa, v4, 40, 1);
  }
  id v6 = Property;
  id v7 = [v6 dnsSettings];
  [v7 setEnabled:v3];

  objc_sync_exit(selfa);
}

- (BOOL)isEnabled
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    id Property = objc_getProperty(v2, v3, 40, 1);
  }
  else {
    id Property = 0;
  }
  id v5 = Property;
  id v6 = [v5 dnsSettings];
  char v7 = [v6 isEnabled];

  objc_sync_exit(v2);
  return v7;
}

- (void)saveToPreferencesWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  id v5 = self;
  objc_sync_enter(v5);
  if (v5 && v5->_hasLoaded)
  {
    id v8 = objc_getProperty(v5, v6, 16, 1);
    id v10 = objc_getProperty(v5, v9, 40, 1);
    uint64_t v11 = MEMORY[0x1E4F14428];
    id v12 = MEMORY[0x1E4F14428];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __63__NEDNSSettingsManager_saveToPreferencesWithCompletionHandler___block_invoke_2;
    v13[3] = &unk_1E5991A58;
    id v14 = v4;
    [v8 saveConfiguration:v10 withCompletionQueue:v11 handler:v13];
    char v7 = &v14;

    goto LABEL_6;
  }
  if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__NEDNSSettingsManager_saveToPreferencesWithCompletionHandler___block_invoke;
    block[3] = &unk_1E5993770;
    char v7 = &v16;
    id v16 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
LABEL_6:
  }
  objc_sync_exit(v5);
}

void __63__NEDNSSettingsManager_saveToPreferencesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NEDNSSettingsErrorDomain" code:3 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __63__NEDNSSettingsManager_saveToPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3 && [v3 code] != 9)
  {
    id v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v12 = "-[NEDNSSettingsManager saveToPreferencesWithCompletionHandler:]_block_invoke_2";
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_error_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_ERROR, "%s: failed to save the new configuration: %@", buf, 0x16u);
    }

    if ([v4 code] == 5)
    {
      uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NEDNSSettingsErrorDomain" code:3 userInfo:0];

      id v4 = (void *)v6;
    }
  }
  char v7 = *(void **)(a1 + 32);
  if (v7)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __63__NEDNSSettingsManager_saveToPreferencesWithCompletionHandler___block_invoke_29;
    v8[3] = &unk_1E59936F8;
    id v10 = v7;
    id v9 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v8);
  }
}

uint64_t __63__NEDNSSettingsManager_saveToPreferencesWithCompletionHandler___block_invoke_29(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)removeFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  id v5 = self;
  objc_sync_enter(v5);
  if (v5 && objc_getProperty(v5, v6, 40, 1))
  {
    id v8 = objc_getProperty(v5, v7, 40, 1);
    id v9 = [v8 payloadInfo];

    if (!v9)
    {
      id v14 = objc_getProperty(v5, v10, 16, 1);
      id v16 = objc_getProperty(v5, v15, 40, 1);
      uint64_t v17 = MEMORY[0x1E4F14428];
      id v18 = MEMORY[0x1E4F14428];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __67__NEDNSSettingsManager_removeFromPreferencesWithCompletionHandler___block_invoke_3;
      v19[3] = &unk_1E5991A58;
      id v20 = v4;
      [v14 removeConfiguration:v16 withCompletionQueue:v17 handler:v19];
      uint64_t v11 = &v20;

      goto LABEL_10;
    }
    if (v4)
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __67__NEDNSSettingsManager_removeFromPreferencesWithCompletionHandler___block_invoke_2;
      v21[3] = &unk_1E5993770;
      uint64_t v11 = &v22;
      id v22 = v4;
      id v12 = MEMORY[0x1E4F14428];
      __int16 v13 = v21;
LABEL_8:
      dispatch_async(v12, v13);
LABEL_10:
    }
  }
  else if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__NEDNSSettingsManager_removeFromPreferencesWithCompletionHandler___block_invoke;
    block[3] = &unk_1E5993770;
    uint64_t v11 = &v24;
    id v24 = v4;
    id v12 = MEMORY[0x1E4F14428];
    __int16 v13 = block;
    goto LABEL_8;
  }
  objc_sync_exit(v5);
}

void __67__NEDNSSettingsManager_removeFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NEDNSSettingsErrorDomain" code:3 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __67__NEDNSSettingsManager_removeFromPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NEDNSSettingsErrorDomain" code:4 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __67__NEDNSSettingsManager_removeFromPreferencesWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v10 = "-[NEDNSSettingsManager removeFromPreferencesWithCompletionHandler:]_block_invoke_3";
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_error_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_ERROR, "%s: failed to remove the configuration: %@", buf, 0x16u);
    }
  }
  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __67__NEDNSSettingsManager_removeFromPreferencesWithCompletionHandler___block_invoke_28;
    v6[3] = &unk_1E59936F8;
    id v8 = v5;
    id v7 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __67__NEDNSSettingsManager_removeFromPreferencesWithCompletionHandler___block_invoke_28(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)loadFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  if (v4)
  {
    id v5 = self;
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
    v11[2] = __65__NEDNSSettingsManager_loadFromPreferencesWithCompletionHandler___block_invoke;
    v11[3] = &unk_1E5993720;
    v11[4] = v5;
    id v12 = v4;
    [v8 loadConfigurationsWithCompletionQueue:v9 handler:v11];

    objc_sync_exit(v5);
  }
}

void __65__NEDNSSettingsManager_loadFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v22 = a2;
  id v5 = a3;
  id v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  if (!v5)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v7 = v22;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v8)
    {
      id v9 = 0;
      uint64_t v10 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v13 = [v12 dnsSettings];
          BOOL v14 = v13 == 0;

          if (!v14)
          {
            SEL v15 = [v12 payloadInfo];
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
        uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v8) {
          continue;
        }
        break;
      }
LABEL_15:

      if (v9)
      {
        v19 = *(void **)(a1 + 32);
        if (!v19)
        {
LABEL_22:

          goto LABEL_23;
        }
        objc_setProperty_atomic(v19, v18, v9, 40);
LABEL_20:
        uint64_t v20 = *(void *)(a1 + 32);
        if (v20) {
          *(unsigned char *)(v20 + 8) = 1;
        }
        goto LABEL_22;
      }
    }
    else
    {
    }
    -[NEDNSSettingsManager createEmptyConfigurationWithGrade:](*(void **)(a1 + 32));
    id v9 = 0;
    goto LABEL_20;
  }
LABEL_23:
  v21 = *(void **)(a1 + 40);
  if (v21)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__NEDNSSettingsManager_loadFromPreferencesWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E59936F8;
    id v25 = v21;
    id v24 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  objc_sync_exit(v6);
}

- (void)createEmptyConfigurationWithGrade:(void *)a1
{
  if (a1)
  {
    id v2 = [MEMORY[0x1E4F28B50] mainBundle];
    id v3 = [v2 infoDictionary];
    id v14 = [v3 objectForKey:*MEMORY[0x1E4F1CC48]];

    id v4 = [MEMORY[0x1E4F28B50] mainBundle];
    id v5 = [v4 bundleIdentifier];

    if (!v14)
    {
      id v6 = [MEMORY[0x1E4F28B50] mainBundle];
      id v7 = [v6 infoDictionary];
      id v14 = [v7 objectForKey:*MEMORY[0x1E4F1D008]];
    }
    uint64_t v8 = [[NEConfiguration alloc] initWithName:v14 grade:2];
    objc_setProperty_atomic(a1, v9, v8, 40);

    uint64_t v10 = objc_alloc_init(NEDNSSettingsBundle);
    objc_msgSend(objc_getProperty(a1, v11, 40, 1), "setDnsSettings:", v10);

    objc_msgSend(objc_getProperty(a1, v12, 40, 1), "setApplication:", v5);
    objc_msgSend(objc_getProperty(a1, v13, 40, 1), "setApplicationName:", v14);
  }
}

uint64_t __65__NEDNSSettingsManager_loadFromPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (NEDNSSettingsManager)init
{
}

+ (void)loadAllFromPreferencesWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = +[NEDNSSettingsManager globalConfigurationManager]();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__NEDNSSettingsManager_loadAllFromPreferencesWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5993680;
  id v7 = v3;
  id v5 = v3;
  [v4 loadConfigurationsWithCompletionQueue:MEMORY[0x1E4F14428] handler:v6];
}

+ (id)globalConfigurationManager
{
  self;
  if (globalConfigurationManager_onceToken_17258 != -1) {
    dispatch_once(&globalConfigurationManager_onceToken_17258, &__block_literal_global_17_17259);
  }
  v0 = (void *)globalConfigurationManager_gConfigurationManager_17260;

  return v0;
}

void __68__NEDNSSettingsManager_loadAllFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  group = dispatch_group_create();
  v36 = v5;
  if (a3)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = objc_alloc_init(MEMORY[0x1E4F1C978]);
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
  }
  else
  {
    uint64_t v35 = a1;
    id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v44 objects:v53 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v45 != v10) {
            objc_enumerationMutation(v8);
          }
          SEL v12 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            SEL v13 = [v12 dnsSettings];
            BOOL v14 = v13 == 0;

            if (!v14)
            {
              dispatch_group_enter(group);
              SEL v15 = [NEDNSSettingsManager alloc];
              id v16 = v12;
              if (v15
                && (v48.receiver = v15,
                    v48.super_class = (Class)NEDNSSettingsManager,
                    id v17 = (id *)objc_msgSendSuper2(&v48, sel_init),
                    (id v18 = v17) != 0))
              {
                objc_storeStrong(v17 + 5, v12);
                uint64_t v19 = +[NEDNSSettingsManager globalConfigurationManager]();
                id v20 = v18[2];
                v18[2] = (id)v19;

                v21 = -[NEVPNConnection initWithType:]([NEVPNConnection alloc], 7);
                id v22 = v18[3];
                v18[3] = v21;

                *((unsigned char *)v18 + 8) = 1;
              }
              else
              {

                id v18 = 0;
              }
              v42[0] = MEMORY[0x1E4F143A8];
              v42[1] = 3221225472;
              v42[2] = __68__NEDNSSettingsManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_2;
              v42[3] = &unk_1E5991A08;
              v42[4] = v16;
              v43 = group;
              v23 = v42;
              if (v18)
              {
                objc_initWeak(&location, v18);
                id v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
                id v25 = v18[3];
                long long v26 = [MEMORY[0x1E4F28F08] mainQueue];
                v48.receiver = (id)MEMORY[0x1E4F143A8];
                v48.super_class = (Class)3221225472;
                v49 = __58__NEDNSSettingsManager_setupSessionWithCompletionHandler___block_invoke;
                v50 = &unk_1E5991A30;
                objc_copyWeak(&v51, &location);
                uint64_t v27 = [v24 addObserverForName:@"com.apple.networkextension.statuschanged" object:v25 queue:v26 usingBlock:&v48];
                id v28 = v18[4];
                v18[4] = (id)v27;

                id v29 = v18[3];
                id v31 = objc_getProperty(v18, v30, 40, 1);
                v32 = [v31 identifier];
                if (v29) {
                  -[NEVPNConnection createSessionWithConfigurationIdentifier:forceInfoFetch:completionHandler:](v29, v32, 0, v23);
                }

                objc_destroyWeak(&v51);
                objc_destroyWeak(&location);
              }

              [v37 addObject:v18];
            }
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v44 objects:v53 count:16];
      }
      while (v9);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__NEDNSSettingsManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_23;
    block[3] = &unk_1E59936F8;
    id v33 = *(id *)(v35 + 32);
    id v40 = v37;
    id v41 = v33;
    id v34 = v37;
    dispatch_group_notify(group, MEMORY[0x1E4F14428], block);
  }
}

void __68__NEDNSSettingsManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = [*(id *)(a1 + 32) name];
      uint64_t v6 = [*(id *)(a1 + 32) identifier];
      int v7 = 138412802;
      id v8 = v5;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_error_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_ERROR, "Failed to create a DNS settings session for configuration %@ (%@): %@", (uint8_t *)&v7, 0x20u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __68__NEDNSSettingsManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_23(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __58__NEDNSSettingsManager_setupSessionWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v2 = [WeakRetained delegate];
    id v3 = v2;
    if (v2) {
      [v2 dnsSettingsStatusDidChange:v4];
    }

    id WeakRetained = v4;
  }
}

uint64_t __50__NEDNSSettingsManager_globalConfigurationManager__block_invoke()
{
  if (NEInitCFTypes_onceToken != -1) {
    dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_24415);
  }
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("DNS settings config manager change queue", v0);
  id v2 = (void *)globalConfigurationManager_gChangeQueue_17263;
  globalConfigurationManager_gChangeQueue_17263 = (uint64_t)v1;

  id v3 = [[NEConfigurationManager alloc] initForAllUsers];
  id v4 = (void *)globalConfigurationManager_gConfigurationManager_17260;
  globalConfigurationManager_gConfigurationManager_17260 = (uint64_t)v3;

  id v5 = (void *)globalConfigurationManager_gConfigurationManager_17260;
  uint64_t v6 = globalConfigurationManager_gChangeQueue_17263;

  return [v5 setChangedQueue:v6 andHandler:&__block_literal_global_20_17265];
}

void __50__NEDNSSettingsManager_globalConfigurationManager__block_invoke_2()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"com.apple.networkextension.dns-settings-configuration-changed" object:0];
}

+ (NEDNSSettingsManager)sharedManager
{
  if (sharedManager_onceToken_17267 != -1) {
    dispatch_once(&sharedManager_onceToken_17267, &__block_literal_global_17268);
  }
  id v2 = (void *)sharedManager_gDNSSettingsManager;
  if (sharedManager_gDNSSettingsManager) {
    id v3 = (id)sharedManager_gDNSSettingsManager;
  }

  return (NEDNSSettingsManager *)v2;
}

void __37__NEDNSSettingsManager_sharedManager__block_invoke()
{
  v15[1] = *(id *)MEMORY[0x1E4F143B8];
  if (NEInitCFTypes_onceToken != -1) {
    dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_24415);
  }
  id v0 = [NEDNSSettingsManager alloc];
  if (!v0) {
    goto LABEL_9;
  }
  v11.receiver = v0;
  v11.super_class = (Class)NEDNSSettingsManager;
  dispatch_queue_t v1 = objc_msgSendSuper2(&v11, sel_init);
  if (!v1) {
    goto LABEL_11;
  }
  if (+[NEProvider isRunningInProvider])
  {
    id v2 = ne_log_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      id v8 = objc_opt_class();
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      id v9 = v8;
      _os_log_error_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_ERROR, "%@ objects cannot be instantiated from NEProvider processes", (uint8_t *)&buf, 0xCu);
    }
LABEL_9:
    dispatch_queue_t v1 = 0;
    goto LABEL_11;
  }
  objc_initWeak(&location, v1);
  id v3 = objc_alloc_init(NEConfigurationManager);
  id v4 = (void *)v1[2];
  v1[2] = v3;

  id v5 = (void *)v1[2];
  id v6 = MEMORY[0x1E4F14428];
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  uint64_t v13 = __38__NEDNSSettingsManager_initWithGrade___block_invoke;
  BOOL v14 = &unk_1E5992DE0;
  objc_copyWeak(v15, &location);
  [v5 setChangedQueue:MEMORY[0x1E4F14428] andHandler:&buf];

  -[NEDNSSettingsManager createEmptyConfigurationWithGrade:](v1);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
LABEL_11:
  int v7 = (void *)sharedManager_gDNSSettingsManager;
  sharedManager_gDNSSettingsManager = (uint64_t)v1;
}

void __38__NEDNSSettingsManager_initWithGrade___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__NEDNSSettingsManager_initWithGrade___block_invoke_2;
  v6[3] = &unk_1E59924B8;
  objc_copyWeak(&v7, v4);
  [WeakRetained loadFromPreferencesWithCompletionHandler:v6];

  objc_destroyWeak(&v7);
}

void __38__NEDNSSettingsManager_initWithGrade___block_invoke_2(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 postNotificationName:@"com.apple.networkextension.dns-settings-configuration-changed" object:WeakRetained];
}

@end