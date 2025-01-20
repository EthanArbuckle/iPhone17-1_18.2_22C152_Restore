@interface NERelayManager
+ (NERelayManager)sharedManager;
+ (id)configurationManager;
+ (id)loadedManagers;
+ (id)mapError:(uint64_t)a1;
+ (void)loadAllFromPreferencesWithCompletionHandler:(id)a3;
+ (void)loadAllManagersFromPreferencesWithCompletionHandler:(void *)completionHandler;
- (BOOL)isEnabled;
- (BOOL)isFromProfile;
- (NERelayManagerDelegate)delegate;
- (NSArray)excludedDomains;
- (NSArray)matchDomains;
- (NSArray)onDemandRules;
- (NSArray)relays;
- (NSString)appBundleIdentifier;
- (NSString)localizedDescription;
- (NSUUID)identifier;
- (_BYTE)initWithGrade:(void *)a1;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (void)createEmptyConfigurationWithGrade:(void *)a1;
- (void)getLastClientErrors:(double)a3 completionHandler:(id)a4;
- (void)loadFromPreferencesWithCompletionHandler:(void *)completionHandler;
- (void)removeFromPreferencesWithCompletionHandler:(void *)completionHandler;
- (void)saveToPreferencesWithCompletionHandler:(void *)completionHandler;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)enabled;
- (void)setExcludedDomains:(NSArray *)excludedDomains;
- (void)setLocalizedDescription:(NSString *)localizedDescription;
- (void)setMatchDomains:(NSArray *)matchDomains;
- (void)setOnDemandRules:(NSArray *)onDemandRules;
- (void)setRelays:(NSArray *)relays;
@end

@implementation NERelayManager

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)setDelegate:(id)a3
{
}

- (NERelayManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NERelayManagerDelegate *)WeakRetained;
}

- (BOOL)isFromProfile
{
  if (self) {
    self = (NERelayManager *)objc_getProperty(self, a2, 16, 1);
  }
  v2 = [(NERelayManager *)self payloadInfo];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSString)appBundleIdentifier
{
  if (self)
  {
    self = (NERelayManager *)objc_getProperty(self, a2, 16, 1);
    uint64_t v2 = vars8;
  }
  return (NSString *)[(NERelayManager *)self application];
}

- (NSUUID)identifier
{
  if (self)
  {
    self = (NERelayManager *)objc_getProperty(self, a2, 16, 1);
    uint64_t v2 = vars8;
  }
  return [(NERelayManager *)self identifier];
}

- (id)description
{
  return [(NERelayManager *)self descriptionWithIndent:0 options:14];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  v8 = [(NERelayManager *)self localizedDescription];
  [v7 appendPrettyObject:v8 withName:@"localizedDescription" andIndent:v5 options:a4];

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NERelayManager isEnabled](self, "isEnabled"), @"enabled", v5, a4);
  v9 = [(NERelayManager *)self relays];
  [v7 appendPrettyObject:v9 withName:@"relays" andIndent:v5 options:a4];

  v10 = [(NERelayManager *)self onDemandRules];
  [v7 appendPrettyObject:v10 withName:@"onDemandRules" andIndent:v5 options:a4];

  return v7;
}

- (void)setLocalizedDescription:(NSString *)localizedDescription
{
  v8 = localizedDescription;
  v4 = self;
  objc_sync_enter(v4);
  if (v4) {
    id Property = objc_getProperty(v4, v5, 16, 1);
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
    id Property = objc_getProperty(v2, v3, 16, 1);
  }
  else {
    id Property = 0;
  }
  id v5 = Property;
  v6 = [v5 name];

  objc_sync_exit(v2);

  return (NSString *)v6;
}

- (void)setOnDemandRules:(NSArray *)onDemandRules
{
  v9 = onDemandRules;
  v4 = self;
  objc_sync_enter(v4);
  if (v4) {
    id Property = objc_getProperty(v4, v5, 16, 1);
  }
  else {
    id Property = 0;
  }
  id v7 = Property;
  v8 = [v7 relay];
  [v8 setOnDemandRules:v9];

  objc_sync_exit(v4);
}

- (NSArray)onDemandRules
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    id Property = objc_getProperty(v2, v3, 16, 1);
  }
  else {
    id Property = 0;
  }
  id v5 = Property;
  v6 = [v5 relay];
  id v7 = [v6 onDemandRules];

  objc_sync_exit(v2);

  return (NSArray *)v7;
}

- (void)setExcludedDomains:(NSArray *)excludedDomains
{
  v9 = excludedDomains;
  v4 = self;
  objc_sync_enter(v4);
  if (v4) {
    id Property = objc_getProperty(v4, v5, 16, 1);
  }
  else {
    id Property = 0;
  }
  id v7 = Property;
  v8 = [v7 relay];
  [v8 setExcludedDomains:v9];

  objc_sync_exit(v4);
}

- (NSArray)excludedDomains
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    id Property = objc_getProperty(v2, v3, 16, 1);
  }
  else {
    id Property = 0;
  }
  id v5 = Property;
  v6 = [v5 relay];
  id v7 = [v6 excludedDomains];

  objc_sync_exit(v2);

  return (NSArray *)v7;
}

- (void)setMatchDomains:(NSArray *)matchDomains
{
  v9 = matchDomains;
  v4 = self;
  objc_sync_enter(v4);
  if (v4) {
    id Property = objc_getProperty(v4, v5, 16, 1);
  }
  else {
    id Property = 0;
  }
  id v7 = Property;
  v8 = [v7 relay];
  [v8 setMatchDomains:v9];

  objc_sync_exit(v4);
}

- (NSArray)matchDomains
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    id Property = objc_getProperty(v2, v3, 16, 1);
  }
  else {
    id Property = 0;
  }
  id v5 = Property;
  v6 = [v5 relay];
  id v7 = [v6 matchDomains];

  objc_sync_exit(v2);

  return (NSArray *)v7;
}

- (void)setRelays:(NSArray *)relays
{
  v9 = relays;
  v4 = self;
  objc_sync_enter(v4);
  if (v4) {
    id Property = objc_getProperty(v4, v5, 16, 1);
  }
  else {
    id Property = 0;
  }
  id v7 = Property;
  v8 = [v7 relay];
  [v8 setRelays:v9];

  objc_sync_exit(v4);
}

- (NSArray)relays
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    id Property = objc_getProperty(v2, v3, 16, 1);
  }
  else {
    id Property = 0;
  }
  id v5 = Property;
  v6 = [v5 relay];
  id v7 = [v6 relays];

  objc_sync_exit(v2);

  return (NSArray *)v7;
}

- (void)setEnabled:(BOOL)enabled
{
  BOOL v3 = enabled;
  selfa = self;
  objc_sync_enter(selfa);
  id Property = selfa;
  if (selfa) {
    id Property = objc_getProperty(selfa, v4, 16, 1);
  }
  id v6 = Property;
  id v7 = [v6 relay];
  [v7 setEnabled:v3];

  objc_sync_exit(selfa);
}

- (BOOL)isEnabled
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    id Property = objc_getProperty(v2, v3, 16, 1);
  }
  else {
    id Property = 0;
  }
  id v5 = Property;
  id v6 = [v5 relay];
  char v7 = [v6 isEnabled];

  objc_sync_exit(v2);
  return v7;
}

- (void)saveToPreferencesWithCompletionHandler:(void *)completionHandler
{
  v4 = completionHandler;
  id v5 = self;
  objc_sync_enter(v5);
  if (v5 && v5->_hasLoaded)
  {
    id v7 = +[NERelayManager loadedManagers]();
    v5->_notificationSent = 0;
    v8 = +[NERelayManager configurationManager]();
    id v10 = objc_getProperty(v5, v9, 16, 1);
    uint64_t v11 = MEMORY[0x1E4F14428];
    id v12 = MEMORY[0x1E4F14428];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__NERelayManager_saveToPreferencesWithCompletionHandler___block_invoke_2;
    v13[3] = &unk_1E5993798;
    v13[4] = v5;
    id v14 = v4;
    [v8 saveConfiguration:v10 withCompletionQueue:v11 handler:v13];

    id v6 = v14;
    goto LABEL_6;
  }
  if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__NERelayManager_saveToPreferencesWithCompletionHandler___block_invoke;
    block[3] = &unk_1E5993770;
    id v16 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
    id v6 = v16;
LABEL_6:
  }
  objc_sync_exit(v5);
}

void __57__NERelayManager_saveToPreferencesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NERelayErrorDomain" code:3 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

+ (id)loadedManagers
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__NERelayManager_loadedManagers__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = v0;
  if (loadedManagers_managers_init_27094 != -1) {
    dispatch_once(&loadedManagers_managers_init_27094, block);
  }
  uint64_t v1 = (void *)loadedManagers_loadedManagers_27095;

  return v1;
}

+ (id)configurationManager
{
  self;
  if (g_noAppFilter_27092) {
    +[NEConfigurationManager sharedManagerForAllUsers];
  }
  else {
  uint64_t v0 = +[NEConfigurationManager sharedManager];
  }

  return v0;
}

void __57__NERelayManager_saveToPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if (v3 && [v3 code] != 9)
  {
    SEL v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[NERelayManager saveToPreferencesWithCompletionHandler:]_block_invoke_2";
      __int16 v19 = 2112;
      v20 = v4;
      _os_log_error_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_ERROR, "%s: failed to save the new configuration: %@", buf, 0x16u);
    }

    if ([v4 code] == 5)
    {
      uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NERelayErrorDomain" code:3 userInfo:0];

      v4 = (void *)v10;
    }
    uint64_t v11 = *(void *)(a1 + 32);
    if (v11) {
      *(unsigned char *)(v11 + 10) = 1;
    }
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (!v5 || (*(unsigned char *)(v5 + 10) & 1) == 0)
    {
      id v6 = ne_log_obj();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v13 = *(const char **)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v18 = v13;
        _os_log_debug_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_DEBUG, "Post NERelayConfigurationDidChangeNotification to app for manager %@", buf, 0xCu);
      }

      uint64_t v7 = *(void *)(a1 + 32);
      if (v7) {
        *(unsigned char *)(v7 + 10) = 1;
      }
      v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v8 postNotificationName:@"com.apple.networkextension.relay-configuration-changed" object:*(void *)(a1 + 32)];
    }
  }
  id v12 = *(void **)(a1 + 40);
  if (v12)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __57__NERelayManager_saveToPreferencesWithCompletionHandler___block_invoke_42;
    v14[3] = &unk_1E59936F8;
    id v16 = v12;
    id v15 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v14);
  }
}

uint64_t __57__NERelayManager_saveToPreferencesWithCompletionHandler___block_invoke_42(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __32__NERelayManager_loadedManagers__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = (void *)loadedManagers_loadedManagers_27095;
  loadedManagers_loadedManagers_27095 = (uint64_t)v2;

  v4 = +[NERelayManager configurationManager]();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__NERelayManager_loadedManagers__block_invoke_2;
  v5[3] = &__block_descriptor_40_e17_v16__0__NSArray_8l;
  v5[4] = *(void *)(a1 + 32);
  [v4 setChangedQueue:MEMORY[0x1E4F14428] andHandler:v5];
}

void __32__NERelayManager_loadedManagers__block_invoke_2(uint64_t a1, void *a2)
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
        v8 = [(id)loadedManagers_loadedManagers_27095 objectForKeyedSubscript:*(void *)(*((void *)&v15 + 1) + 8 * v7)];
        if (v8
          || ([*(id *)(a1 + 32) sharedManager], (v8 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          v13[2] = __32__NERelayManager_loadedManagers__block_invoke_3;
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
            *(_WORD *)id v12 = 0;
            _os_log_debug_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_DEBUG, "Post NERelayConfigurationDidChangeNotification to app", v12, 2u);
          }

          id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v9 postNotificationName:@"com.apple.networkextension.relay-configuration-changed" object:0];
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

void __32__NERelayManager_loadedManagers__block_invoke_3(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2 || (*(unsigned char *)(v2 + 10) & 1) == 0)
  {
    id v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_debug_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_DEBUG, "Post NERelayConfigurationDidChangeNotification to app for manager %@", (uint8_t *)&v7, 0xCu);
    }

    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      *(unsigned char *)(v4 + 10) = 1;
    }
    uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"com.apple.networkextension.relay-configuration-changed" object:*(void *)(a1 + 32)];
  }
}

- (void)removeFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  uint64_t v4 = completionHandler;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (v5 && objc_getProperty(v5, v6, 16, 1))
  {
    id v8 = objc_getProperty(v5, v7, 16, 1);
    uint64_t v9 = [v8 payloadInfo];

    if (!v9)
    {
      uint64_t v11 = +[NERelayManager configurationManager]();
      id v13 = objc_getProperty(v5, v12, 16, 1);
      uint64_t v14 = MEMORY[0x1E4F14428];
      id v15 = MEMORY[0x1E4F14428];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __61__NERelayManager_removeFromPreferencesWithCompletionHandler___block_invoke_3;
      v16[3] = &unk_1E5993798;
      v16[4] = v5;
      id v17 = v4;
      [v11 removeConfiguration:v13 withCompletionQueue:v14 handler:v16];

      uint64_t v10 = v17;
      goto LABEL_9;
    }
    if (v4)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __61__NERelayManager_removeFromPreferencesWithCompletionHandler___block_invoke_2;
      block[3] = &unk_1E5993770;
      id v19 = v4;
      dispatch_async(MEMORY[0x1E4F14428], block);
      uint64_t v10 = v19;
LABEL_9:
    }
  }
  else if (v4)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __61__NERelayManager_removeFromPreferencesWithCompletionHandler___block_invoke;
    v20[3] = &unk_1E5993770;
    id v21 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v20);
    uint64_t v10 = v21;
    goto LABEL_9;
  }
  objc_sync_exit(v5);
}

void __61__NERelayManager_removeFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NERelayErrorDomain" code:3 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __61__NERelayManager_removeFromPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NERelayErrorDomain" code:4 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __61__NERelayManager_removeFromPreferencesWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v21 = "-[NERelayManager removeFromPreferencesWithCompletionHandler:]_block_invoke_3";
      __int16 v22 = 2112;
      id v23 = v4;
      _os_log_error_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_ERROR, "%s: failed to remove the configuration: %@", buf, 0x16u);
    }
  }
  uint64_t v6 = *(void **)(a1 + 32);
  if (!v6) {
    goto LABEL_12;
  }
  if (objc_getProperty(v6, v3, 16, 1))
  {
    id v8 = +[NERelayManager loadedManagers]();
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v7, 16, 1);
    }
    uint64_t v10 = [Property identifier];
    [v8 removeObjectForKey:v10];
  }
  uint64_t v11 = *(void *)(a1 + 32);
  if (!v11 || (*(unsigned char *)(v11 + 10) & 1) == 0)
  {
LABEL_12:
    SEL v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      long long v16 = *(const char **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      id v21 = v16;
      _os_log_debug_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_DEBUG, "Post NERelayConfigurationDidChangeNotification to app for manager %@", buf, 0xCu);
    }

    uint64_t v13 = *(void *)(a1 + 32);
    if (v13) {
      *(unsigned char *)(v13 + 10) = 1;
    }
    uint64_t v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 postNotificationName:@"com.apple.networkextension.relay-configuration-changed" object:*(void *)(a1 + 32)];
  }
  id v15 = *(void **)(a1 + 40);
  if (v15)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __61__NERelayManager_removeFromPreferencesWithCompletionHandler___block_invoke_41;
    v17[3] = &unk_1E59936F8;
    id v19 = v15;
    id v18 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v17);
  }
}

uint64_t __61__NERelayManager_removeFromPreferencesWithCompletionHandler___block_invoke_41(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)loadFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  if (v4)
  {
    uint64_t v5 = self;
    objc_sync_enter(v5);
    if (v5 && v5->_isShared)
    {
      int v7 = +[NERelayManager configurationManager]();
      id v9 = (id)MEMORY[0x1E4F14428];
      id v14 = MEMORY[0x1E4F14428];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __59__NERelayManager_loadFromPreferencesWithCompletionHandler___block_invoke;
      v17[3] = &unk_1E5993720;
      void v17[4] = v5;
      id v18 = v4;
      [v7 loadConfigurationsWithCompletionQueue:v9 handler:v17];
      uint64_t v13 = &v18;
    }
    else
    {
      int v7 = +[NERelayManager configurationManager]();
      if (v5) {
        id Property = objc_getProperty(v5, v6, 16, 1);
      }
      else {
        id Property = 0;
      }
      id v9 = Property;
      uint64_t v10 = [v9 identifier];
      uint64_t v11 = MEMORY[0x1E4F14428];
      id v12 = MEMORY[0x1E4F14428];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __59__NERelayManager_loadFromPreferencesWithCompletionHandler___block_invoke_3;
      v15[3] = &unk_1E5993748;
      v15[4] = v5;
      id v16 = v4;
      [v7 loadConfigurationWithID:v10 withCompletionQueue:v11 handler:v15];
      uint64_t v13 = &v16;
    }
    objc_sync_exit(v5);
  }
}

void __59__NERelayManager_loadFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v28 = a2;
  id v5 = a3;
  id v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  if (v5) {
    goto LABEL_26;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v7 = v28;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v8)
  {
    id v9 = 0;
    uint64_t v10 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v13 = [v12 relay];
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
      uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v8) {
        continue;
      }
      break;
    }
LABEL_15:

    if (v9)
    {
      id v19 = *(void **)(a1 + 32);
      if (v19)
      {
        objc_setProperty_atomic(v19, v18, v9, 16);
        uint64_t v20 = *(void *)(a1 + 32);
      }
      else
      {
        uint64_t v20 = 0;
      }
      __int16 v22 = +[NERelayManager loadedManagers]();
      id Property = *(id *)(a1 + 32);
      if (Property) {
        id Property = objc_getProperty(Property, v21, 16, 1);
      }
      id v24 = Property;
      v25 = [v24 identifier];
      [v22 setObject:v20 forKeyedSubscript:v25];

      goto LABEL_23;
    }
  }
  else
  {
  }
  -[NERelayManager createEmptyConfigurationWithGrade:](*(void **)(a1 + 32));
  id v9 = 0;
LABEL_23:
  uint64_t v26 = *(void *)(a1 + 32);
  if (v26) {
    *(unsigned char *)(v26 + 9) = 1;
  }

LABEL_26:
  v27 = *(void **)(a1 + 40);
  if (v27)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__NERelayManager_loadFromPreferencesWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E59936F8;
    id v31 = v27;
    id v30 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  objc_sync_exit(v6);
}

void __59__NERelayManager_loadFromPreferencesWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  if (v6)
  {
    id v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v23 = 138412290;
      id v24 = v6;
      _os_log_error_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_ERROR, "Failed to load the configuration: %@", (uint8_t *)&v23, 0xCu);
    }

    uint64_t v10 = +[NERelayManager mapError:]((uint64_t)NERelayManager, v6);

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v11 = *(id *)(a1 + 32);
    if (v5)
    {
      if (v11)
      {
        objc_setProperty_atomic(v11, v8, v5, 16);
        uint64_t v12 = *(void *)(a1 + 32);
      }
      else
      {
        uint64_t v12 = 0;
      }
      BOOL v14 = +[NERelayManager loadedManagers]();
      id Property = *(id *)(a1 + 32);
      if (Property) {
        id Property = objc_getProperty(Property, v13, 16, 1);
      }
      id v16 = Property;
      id v17 = [v16 identifier];
      [v14 setObject:v12 forKeyedSubscript:v17];
    }
    else
    {
      if (v11) {
        id v11 = objc_getProperty(v11, v8, 16, 1);
      }
      id v18 = v11;
      id v19 = [v18 relay];
      [v19 setEnabled:0];

      BOOL v14 = +[NERelayManager loadedManagers]();
      id v21 = *(id *)(a1 + 32);
      if (v21) {
        id v21 = objc_getProperty(v21, v20, 16, 1);
      }
      id v16 = v21;
      id v17 = [v16 identifier];
      [v14 removeObjectForKey:v17];
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v22 = *(void *)(a1 + 32);
    uint64_t v10 = 0;
    if (v22) {
      *(unsigned char *)(v22 + 9) = 1;
    }
  }
  objc_sync_exit(v7);
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
      case 6:
      case 7:
      case 8:
      case 10:
      case 11:
      case 12:
      case 20:
      case 21:
        id v5 = [v2 localizedDescription];
        goto LABEL_5;
      case 5:
        id v5 = [v2 localizedDescription];
        uint64_t v6 = 3;
        goto LABEL_6;
      case 9:
        id v5 = ne_log_obj();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_DEFAULT, "The configuration was not saved because it was unchanged from the previously saved version", buf, 2u);
        }
        id v9 = 0;
        break;
      default:
        id v11 = NSString;
        uint64_t v12 = [v2 localizedDescription];
        id v5 = [v11 stringWithFormat:@"Unknown: %@", v12];

        goto LABEL_5;
    }
  }
  else
  {
    id v5 = @"Unknown.";
LABEL_5:
    uint64_t v6 = 1;
LABEL_6:
    id v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    v15[0] = v5;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    id v9 = [v7 errorWithDomain:@"NERelayErrorDomain" code:v6 userInfo:v8];
  }

  return v9;
}

- (void)createEmptyConfigurationWithGrade:(void *)a1
{
  if (a1)
  {
    id v2 = [MEMORY[0x1E4F28B50] mainBundle];
    id v3 = [v2 infoDictionary];
    id v14 = [v3 objectForKey:*MEMORY[0x1E4F1CC48]];

    int v4 = [MEMORY[0x1E4F28B50] mainBundle];
    id v5 = [v4 bundleIdentifier];

    if (!v14)
    {
      uint64_t v6 = [MEMORY[0x1E4F28B50] mainBundle];
      id v7 = [v6 infoDictionary];
      id v14 = [v7 objectForKey:*MEMORY[0x1E4F1D008]];
    }
    uint64_t v8 = [[NEConfiguration alloc] initWithName:v14 grade:2];
    objc_setProperty_atomic(a1, v9, v8, 16);

    uint64_t v10 = objc_alloc_init(NERelayConfiguration);
    objc_msgSend(objc_getProperty(a1, v11, 16, 1), "setRelay:", v10);

    objc_msgSend(objc_getProperty(a1, v12, 16, 1), "setApplication:", v5);
    objc_msgSend(objc_getProperty(a1, v13, 16, 1), "setApplicationName:", v14);
  }
}

uint64_t __59__NERelayManager_loadFromPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)getLastClientErrors:(double)a3 completionHandler:(id)a4
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self) {
    id Property = objc_getProperty(self, v5, 16, 1);
  }
  else {
    id Property = 0;
  }
  v10[0] = 0;
  v10[1] = 0;
  uint64_t v8 = [Property identifier];
  [v8 getUUIDBytes:v10];

  if (ne_session_create())
  {
    id v9 = v6;
    ne_session_get_info();
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

void __56__NERelayManager_getLastClientErrors_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = v3;
  if (v3 && MEMORY[0x19F3B92C0](v3) == MEMORY[0x1E4F14590])
  {
    v7[0] = 0;
    v7[1] = v7;
    v7[2] = 0x3032000000;
    v7[3] = __Block_byref_object_copy__27118;
    v7[4] = __Block_byref_object_dispose__27119;
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v5 = xpc_dictionary_get_array(v4, "SortedRelayErrors");
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__NERelayManager_getLastClientErrors_completionHandler___block_invoke_22;
    v6[3] = &unk_1E59936A8;
    v6[5] = *(void *)(a1 + 40);
    v6[4] = v7;
    xpc_array_apply(v5, v6);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

    _Block_object_dispose(v7, 8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __56__NERelayManager_getLastClientErrors_completionHandler___block_invoke_22(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (!v4 || MEMORY[0x19F3B92C0](v4) != MEMORY[0x1E4F14590])
  {
LABEL_18:
    uint64_t v13 = 1;
    goto LABEL_19;
  }
  double v6 = xpc_dictionary_get_double(v5, "TimeEpoch");
  id v7 = [MEMORY[0x1E4F1C9C8] now];
  [v7 timeIntervalSince1970];
  double v9 = v8 - v6;
  double v10 = *(double *)(a1 + 40);

  if (v9 <= v10)
  {
    int64_t int64 = xpc_dictionary_get_int64(v5, "LastCause");
    switch(int64)
    {
      case 17:
        uint64_t v12 = 2;
        break;
      case 18:
      case 19:
      case 22:
      case 23:
      case 26:
      case 29:
        goto LABEL_9;
      case 20:
        uint64_t v12 = 3;
        break;
      case 21:
        uint64_t v12 = 4;
        break;
      case 24:
        uint64_t v12 = 5;
        break;
      case 25:
        uint64_t v12 = 6;
        break;
      case 27:
        uint64_t v12 = 7;
        break;
      case 28:
        uint64_t v12 = 8;
        break;
      case 30:
        uint64_t v12 = 9;
        break;
      default:
        if (int64) {
LABEL_9:
        }
          uint64_t v12 = 10;
        else {
          uint64_t v12 = 1;
        }
        break;
    }
    id v14 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NERelayErrorDomain" code:v12 userInfo:0];
    [v14 addObject:v15];

    goto LABEL_18;
  }
  uint64_t v13 = 0;
LABEL_19:

  return v13;
}

- (_BYTE)initWithGrade:(void *)a1
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)NERelayManager;
  uint64_t v1 = objc_msgSendSuper2(&v6, sel_init);
  if (v1)
  {
    if (!+[NEProvider isRunningInProvider])
    {
      v1[10] = 0;
      -[NERelayManager createEmptyConfigurationWithGrade:](v1);
      return v1;
    }
    id v2 = ne_log_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      id v4 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      double v8 = v4;
      id v5 = v4;
      _os_log_error_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_ERROR, "%@ objects cannot be instantiated from NEProvider processes", buf, 0xCu);
    }
    return 0;
  }
  return v1;
}

+ (void)loadAllFromPreferencesWithCompletionHandler:(id)a3
{
  id v3 = a3;
  self;
  g_noAppFilter_27092 = 1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__NERelayManager_loadAllFromPreferencesWithCompletionHandler___block_invoke;
  v5[3] = &unk_1E5993680;
  id v6 = v3;
  id v4 = v3;
  +[NERelayManager loadAllManagersFromPreferencesWithCompletionHandler:v5];
}

uint64_t __62__NERelayManager_loadAllFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)loadAllManagersFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  id v3 = completionHandler;
  id v4 = +[NERelayManager loadedManagers]();
  id v5 = +[NERelayManager configurationManager]();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__NERelayManager_loadAllManagersFromPreferencesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5993680;
  id v8 = v3;
  id v6 = v3;
  [v5 loadConfigurationsWithCompletionQueue:MEMORY[0x1E4F14428] handler:v7];
}

void __70__NERelayManager_loadAllManagersFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    id v6 = +[NERelayManager mapError:]((uint64_t)NERelayManager, a3);
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = objc_alloc_init(MEMORY[0x1E4F1C978]);
    (*(void (**)(uint64_t, id, void *))(v7 + 16))(v7, v8, v6);
  }
  else
  {
    id v24 = v5;
    id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = [v14 relay];

            if (v15)
            {
              id v16 = [NERelayManager alloc];
              id v17 = v14;
              if (v16
                && (v30.receiver = v16,
                    v30.super_class = (Class)NERelayManager,
                    (id v18 = objc_msgSendSuper2(&v30, sel_init)) != 0))
              {
                id v19 = v18;
                objc_storeStrong((id *)v18 + 2, v14);

                v19[9] = 1;
              }
              else
              {

                id v19 = 0;
              }
              [v25 addObject:v19];
              uint64_t v20 = +[NERelayManager loadedManagers]();
              id v21 = [v17 identifier];
              [v20 setObject:v19 forKeyedSubscript:v21];
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v11);
    }

    uint64_t v22 = *(void *)(a1 + 32);
    int v23 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v25];
    (*(void (**)(uint64_t, void *, void))(v22 + 16))(v22, v23, 0);

    id v5 = v24;
  }
}

+ (NERelayManager)sharedManager
{
  if (sharedManager_onceToken_27135 != -1) {
    dispatch_once(&sharedManager_onceToken_27135, &__block_literal_global_27136);
  }
  id v2 = (void *)sharedManager_gRelayManager;
  if (sharedManager_gRelayManager) {
    id v3 = (id)sharedManager_gRelayManager;
  }

  return (NERelayManager *)v2;
}

id __31__NERelayManager_sharedManager__block_invoke()
{
  if (NEInitCFTypes_onceToken != -1) {
    dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_24415);
  }
  uint64_t v0 = -[NERelayManager initWithGrade:]([NERelayManager alloc]);
  uint64_t v1 = (void *)sharedManager_gRelayManager;
  sharedManager_gRelayManager = (uint64_t)v0;

  if (sharedManager_gRelayManager) {
    *(unsigned char *)(sharedManager_gRelayManager + 8) = 1;
  }
  return +[NERelayManager loadedManagers]();
}

@end