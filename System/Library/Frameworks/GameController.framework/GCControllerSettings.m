@interface GCControllerSettings
+ (BOOL)settingsCustomizedForController:(id)a3 forBundleIdentifier:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (id)controllerSettingsCustomizedChangedHandlers;
+ (id)metaDefaults;
+ (id)settingsCustomizedChangedHandlers;
+ (id)settingsDispatchQueue;
+ (void)registerSettingsCustomizedHandler:(id)a3 forController:(id)a4 forKey:(id)a5;
+ (void)registerSettingsCustomizedHandler:(id)a3 forKey:(id)a4;
+ (void)setSettingsExist:(BOOL)a3 forBundleIdentifier:(id)a4;
+ (void)setSettingsExist:(BOOL)a3 forController:(id)a4 forBundleIdentifier:(id)a5;
+ (void)unregisterSettingsCustomizedHandlerForController:(id)a3 forKey:(id)a4;
+ (void)unregisterSettingsCustomizedHandlerForKey:(id)a3;
- (BOOL)customizationsEnabled;
- (BOOL)customized;
- (BOOL)hapticsEnabled;
- (BOOL)screenShotEnabled;
- (BOOL)serialized;
- (BOOL)videoRecordingEnabled;
- (GCControllerSettings)initWithBundleIdentifier:(id)a3 forController:(id)a4;
- (GCControllerSettings)initWithBundleIdentifier:(id)a3 forControllerIdentifier:(id)a4;
- (GCControllerSettings)initWithCoder:(id)a3;
- (GCReplayKitGestureSettings)replayKitGestureSettings;
- (NSCopying)uniqueIdentifier;
- (NSDictionary)elementMappings;
- (NSDictionary)general_gameIntentMappings;
- (NSString)bundleIdentifier;
- (NSString)screenShotKey;
- (NSString)videoRecordingKey;
- (id)defaultValues;
- (id)description;
- (id)elementSettingForKey:(id)a3;
- (id)initForController:(id)a3;
- (id)mappingForButton:(id)a3;
- (id)mappingForDirectionPad:(id)a3;
- (id)mappingForElement:(id)a3;
- (id)mappingForTouchpad:(id)a3;
- (id)mappingKeyForElement:(id)a3;
- (id)settingsChangedHandler;
- (id)settingsForElement:(id)a3;
- (id)staticDefaultValues;
- (id)suiteNameForBundleIdentifier:(id)a3;
- (int64_t)screenShotGesture;
- (int64_t)videoRecordingGesture;
- (int64_t)videoRecordingMode;
- (unint64_t)settingsID;
- (void)_updateControllerReference:(id)a3;
- (void)dealloc;
- (void)deleteObjectForKey:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)eraseAllSettings;
- (void)initializeElementMappings;
- (void)initializeReplayKitDefaultMappings;
- (void)initializeUserDefaults;
- (void)observeDefaultsKeyPath:(id)a3 options:(unint64_t)a4 context:(void *)a5;
- (void)observeDefaultsKeyPaths:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)populateElementSettings;
- (void)refreshSettingsExist;
- (void)registerForSettingsCustomized;
- (void)restoreElementMappingToDefault;
- (void)saveBool:(BOOL)a3 forKey:(id)a4;
- (void)saveObject:(id)a3 forKey:(id)a4;
- (void)setCustomizationsEnabled:(BOOL)a3;
- (void)setCustomized:(BOOL)a3;
- (void)setGameIntentMappings:(id)a3;
- (void)setHapticsEnabled:(BOOL)a3;
- (void)setMappingForElement:(id)a3 toElement:(id)a4;
- (void)setReplayKitGestureSettings:(id)a3;
- (void)setScreenShotEnabled:(BOOL)a3;
- (void)setScreenShotGesture:(int64_t)a3;
- (void)setScreenShotKey:(id)a3;
- (void)setSerialized:(BOOL)a3;
- (void)setSettingsChangedHandler:(id)a3;
- (void)setSettingsID:(unint64_t)a3;
- (void)setVideoRecordingEnabled:(BOOL)a3;
- (void)setVideoRecordingGesture:(int64_t)a3;
- (void)setVideoRecordingKey:(id)a3;
- (void)setVideoRecordingMode:(int64_t)a3;
- (void)unregisterForSettingsCustomized;
@end

@implementation GCControllerSettings

+ (id)settingsDispatchQueue
{
  if (settingsDispatchQueue_onceToken != -1) {
    dispatch_once(&settingsDispatchQueue_onceToken, &__block_literal_global_31);
  }
  v2 = (void *)settingsDispatchQueue__dispatch_queue;

  return v2;
}

void __45__GCControllerSettings_settingsDispatchQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.GameController.Settings.GCControllerSettings", 0);
  v1 = (void *)settingsDispatchQueue__dispatch_queue;
  settingsDispatchQueue__dispatch_queue = (uint64_t)v0;
}

+ (id)settingsCustomizedChangedHandlers
{
  if (settingsCustomizedChangedHandlers_onceToken != -1) {
    dispatch_once(&settingsCustomizedChangedHandlers_onceToken, &__block_literal_global_121);
  }
  v2 = (void *)settingsCustomizedChangedHandlers__handlers;

  return v2;
}

void __57__GCControllerSettings_settingsCustomizedChangedHandlers__block_invoke()
{
  uint64_t v0 = +[NSMutableDictionary dictionary];
  v1 = (void *)settingsCustomizedChangedHandlers__handlers;
  settingsCustomizedChangedHandlers__handlers = v0;
}

+ (id)controllerSettingsCustomizedChangedHandlers
{
  if (controllerSettingsCustomizedChangedHandlers_onceToken != -1) {
    dispatch_once(&controllerSettingsCustomizedChangedHandlers_onceToken, &__block_literal_global_124);
  }
  v2 = (void *)controllerSettingsCustomizedChangedHandlers__controllerHandlers;

  return v2;
}

void __67__GCControllerSettings_controllerSettingsCustomizedChangedHandlers__block_invoke()
{
  uint64_t v0 = +[NSMutableDictionary dictionary];
  v1 = (void *)controllerSettingsCustomizedChangedHandlers__controllerHandlers;
  controllerSettingsCustomizedChangedHandlers__controllerHandlers = v0;
}

+ (void)registerSettingsCustomizedHandler:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = getGCSettingsLogger();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)MEMORY[0x223C6E420](v5);
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_220998000, v7, OS_LOG_TYPE_DEFAULT, "Register settings customized handler %@ -> %@", (uint8_t *)&v11, 0x16u);
  }
  v9 = +[GCControllerSettings settingsCustomizedChangedHandlers];
  v10 = (void *)MEMORY[0x223C6E420](v5);
  [v9 setObject:v10 forKey:v6];
}

+ (void)unregisterSettingsCustomizedHandlerForKey:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = getGCSettingsLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_220998000, v4, OS_LOG_TYPE_DEFAULT, "Unregister settings customized handler %@", (uint8_t *)&v6, 0xCu);
    }

    id v5 = +[GCControllerSettings settingsCustomizedChangedHandlers];
    [v5 removeObjectForKey:v3];
  }
}

+ (void)registerSettingsCustomizedHandler:(id)a3 forController:(id)a4 forKey:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[GCControllerSettings settingsDispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __79__GCControllerSettings_registerSettingsCustomizedHandler_forController_forKey___block_invoke;
  block[3] = &unk_26D22C888;
  id v15 = v8;
  id v16 = v9;
  id v17 = v7;
  id v11 = v7;
  id v12 = v9;
  id v13 = v8;
  dispatch_sync(v10, block);
}

void __79__GCControllerSettings_registerSettingsCustomizedHandler_forController_forKey___block_invoke(void *a1)
{
  v2 = getGCSettingsLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    id v5 = (void *)MEMORY[0x223C6E420](a1[6]);
    int v13 = 138412802;
    uint64_t v14 = v3;
    __int16 v15 = 2112;
    uint64_t v16 = v4;
    __int16 v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_220998000, v2, OS_LOG_TYPE_DEFAULT, "Register controller %@ settings customized handler %@ -> %@", (uint8_t *)&v13, 0x20u);
  }
  if (a1[4] && a1[5])
  {
    int v6 = +[GCControllerSettings controllerSettingsCustomizedChangedHandlers];
    id v7 = [v6 objectForKey:a1[4]];

    if (!v7)
    {
      id v8 = +[GCControllerSettings controllerSettingsCustomizedChangedHandlers];
      id v9 = +[NSMutableDictionary dictionary];
      [v8 setObject:v9 forKey:a1[4]];
    }
    v10 = +[GCControllerSettings controllerSettingsCustomizedChangedHandlers];
    id v11 = [v10 objectForKeyedSubscript:a1[4]];

    id v12 = (void *)MEMORY[0x223C6E420](a1[6]);
    [v11 setObject:v12 forKey:a1[5]];
  }
}

+ (void)unregisterSettingsCustomizedHandlerForController:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[GCControllerSettings settingsDispatchQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __80__GCControllerSettings_unregisterSettingsCustomizedHandlerForController_forKey___block_invoke;
  v10[3] = &unk_26D22A8E8;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_sync(v7, v10);
}

void __80__GCControllerSettings_unregisterSettingsCustomizedHandlerForController_forKey___block_invoke(uint64_t a1)
{
  v2 = getGCSettingsLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v8 = 138412546;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl(&dword_220998000, v2, OS_LOG_TYPE_DEFAULT, "Unregister controller %@ settings customized handler %@", (uint8_t *)&v8, 0x16u);
  }

  if (*(void *)(a1 + 32) && *(void *)(a1 + 40))
  {
    id v5 = +[GCControllerSettings controllerSettingsCustomizedChangedHandlers];
    id v6 = [v5 objectForKeyedSubscript:*(void *)(a1 + 32)];

    if (v6)
    {
      [v6 removeObjectForKey:*(void *)(a1 + 40)];
      if (![v6 count])
      {
        id v7 = +[GCControllerSettings controllerSettingsCustomizedChangedHandlers];
        [v7 removeObjectForKey:*(void *)(a1 + 32)];
      }
    }
  }
}

+ (id)metaDefaults
{
  if (metaDefaults_onceToken != -1) {
    dispatch_once(&metaDefaults_onceToken, &__block_literal_global_126);
  }
  v2 = (void *)metaDefaults__observer;

  return (id)[v2 metaDefaults];
}

void __36__GCControllerSettings_metaDefaults__block_invoke()
{
  uint64_t v0 = objc_alloc_init(GCControllerMetaDefaultsObserver);
  v1 = (void *)metaDefaults__observer;
  metaDefaults__observer = (uint64_t)v0;
}

+ (void)setSettingsExist:(BOOL)a3 forBundleIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v13 = a4;
  id v5 = +[GCControllerSettings metaDefaults];
  id v6 = [v5 dictionaryForKey:@"settingsExist"];

  if (!v6)
  {
    id v6 = +[NSDictionary dictionary];
  }
  id v7 = +[NSMutableDictionary dictionaryWithDictionary:v6];
  int v8 = [v6 objectForKey:v13];

  if (!v8 || v4)
  {
    uint64_t v9 = [v6 objectForKey:v13];

    if (v9) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = !v4;
    }
    if (!v10)
    {
      uint64_t v11 = +[NSNumber numberWithBool:1];
      [v7 setObject:v11 forKey:v13];
    }
  }
  else
  {
    [v7 removeObjectForKey:v13];
  }
  id v12 = +[GCControllerSettings metaDefaults];
  [v12 setObject:v7 forKey:@"settingsExist"];
}

+ (void)setSettingsExist:(BOOL)a3 forController:(id)a4 forBundleIdentifier:(id)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = +[GCControllerSettings metaDefaults];
  BOOL v10 = [v9 dictionaryForKey:@"controllerSettingsExist"];

  if (!v10)
  {
    BOOL v10 = +[NSDictionary dictionary];
  }
  uint64_t v11 = +[NSMutableDictionary dictionaryWithDictionary:v10];
  id v12 = [v11 objectForKey:v7];
  if (!v12)
  {
    id v12 = +[NSArray array];
    id v13 = +[GCAnalytics instance];
    objc_msgSend(v13, "sendSettingsDevicesEventForTotalCustomizedControllersCount:", objc_msgSend(v11, "count") + 1);
  }
  uint64_t v14 = +[NSMutableArray arrayWithArray:v12];
  if ([v14 containsObject:v8] && !v6)
  {
    [v14 removeObject:v8];
LABEL_11:
    __int16 v15 = +[GCAnalytics instance];
    objc_msgSend(v15, "sendSettingsCustomizedAppsEventForTotalCustomizedAppsCount:", objc_msgSend(v14, "count"));

    goto LABEL_12;
  }
  if (([v14 containsObject:v8] & 1) == 0 && v6)
  {
    [v14 addObject:v8];
    goto LABEL_11;
  }
LABEL_12:
  [v11 setObject:v14 forKey:v7];
  uint64_t v16 = getGCSettingsLogger();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v18 = 138412290;
    v19 = v11;
    _os_log_impl(&dword_220998000, v16, OS_LOG_TYPE_INFO, "Saving controller settings exist dictionary: %@", (uint8_t *)&v18, 0xCu);
  }

  __int16 v17 = +[GCControllerSettings metaDefaults];
  [v17 setObject:v11 forKey:@"controllerSettingsExist"];
}

+ (BOOL)settingsCustomizedForController:(id)a3 forBundleIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[GCControllerSettings metaDefaults];
  id v8 = [v7 dictionaryForKey:@"controllerSettingsExist"];

  uint64_t v9 = [v8 objectForKey:v6];

  LOBYTE(v6) = [v9 containsObject:v5];
  return (char)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)initForController:(id)a3
{
  return [(GCControllerSettings *)self initWithBundleIdentifier:@"default" forController:a3];
}

- (GCControllerSettings)initWithBundleIdentifier:(id)a3 forControllerIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)GCControllerSettings;
  uint64_t v9 = [(GCControllerSettings *)&v19 init];
  BOOL v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleIdentifier, a3);
    objc_storeStrong((id *)&v10->_uniqueIdentifier, a4);
    v10->_customized = +[GCControllerSettings settingsCustomizedForController:v8 forBundleIdentifier:v7];
    uint64_t v11 = +[NSMutableDictionary dictionary];
    elementSettings = v10->_elementSettings;
    v10->_elementSettings = (NSMutableDictionary *)v11;

    uint64_t v13 = +[NSArray array];
    customizedElementSettings = v10->_customizedElementSettings;
    v10->_customizedElementSettings = (NSArray *)v13;

    uint64_t v15 = gcControllerSettingsID++;
    v10->_settingsID = v15;
    uint64_t v16 = +[NSMutableSet set];
    observedKeyPaths = v10->_observedKeyPaths;
    v10->_observedKeyPaths = (NSMutableSet *)v16;

    [(GCControllerSettings *)v10 registerForSettingsCustomized];
    [(GCControllerSettings *)v10 initializeUserDefaults];
  }

  return v10;
}

- (GCControllerSettings)initWithBundleIdentifier:(id)a3 forController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v8 isComponentBased])
  {
    v40.receiver = self;
    v40.super_class = (Class)GCControllerSettings;
    uint64_t v9 = [(GCControllerSettings *)&v40 init];
    BOOL v10 = v9;
    if (v9)
    {
      id v35 = v7;
      objc_storeWeak((id *)&v9->_controller, v8);
      v10->_settingsAppOpenedAtLeastOnce = 1;
      uint64_t v11 = +[NSMutableDictionary dictionary];
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id WeakRetained = objc_loadWeakRetained((id *)&v10->_controller);
      uint64_t v13 = [WeakRetained physicalInputProfile];
      uint64_t v14 = [v13 allElements];

      uint64_t v15 = [v14 countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v37 != v17) {
              objc_enumerationMutation(v14);
            }
            objc_super v19 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            if ([v19 remappable])
            {
              v20 = [(GCControllerSettings *)v10 mappingKeyForElement:v19];
              [(NSDictionary *)v11 setObject:v19 forKeyedSubscript:v20];
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v36 objects:v41 count:16];
        }
        while (v16);
      }

      elementMappingKeyToElement = v10->_elementMappingKeyToElement;
      v10->_elementMappingKeyToElement = v11;
      v22 = v11;

      objc_storeStrong((id *)&v10->_bundleIdentifier, a3);
      uint64_t v23 = [v8 identifier];
      uniqueIdentifier = v10->_uniqueIdentifier;
      v10->_uniqueIdentifier = (NSCopying *)v23;

      v25 = [v8 identifier];
      id v7 = v35;
      v10->_customized = +[GCControllerSettings settingsCustomizedForController:v25 forBundleIdentifier:v35];

      uint64_t v26 = +[NSMutableDictionary dictionary];
      elementSettings = v10->_elementSettings;
      v10->_elementSettings = (NSMutableDictionary *)v26;

      uint64_t v28 = +[NSArray array];
      customizedElementSettings = v10->_customizedElementSettings;
      v10->_customizedElementSettings = (NSArray *)v28;

      uint64_t v30 = gcControllerSettingsID++;
      v10->_settingsID = v30;
      uint64_t v31 = +[NSMutableSet set];
      observedKeyPaths = v10->_observedKeyPaths;
      v10->_observedKeyPaths = (NSMutableSet *)v31;

      [(GCControllerSettings *)v10 registerForSettingsCustomized];
      [(GCControllerSettings *)v10 initializeUserDefaults];
    }
    self = v10;
    v33 = self;
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (void)unregisterForSettingsCustomized
{
  if (self->_customizedUUID) {
    +[GCControllerSettings unregisterSettingsCustomizedHandlerForController:forKey:](GCControllerSettings, "unregisterSettingsCustomizedHandlerForController:forKey:", self->_uniqueIdentifier);
  }
}

- (void)registerForSettingsCustomized
{
  if (!self->_customizedUUID)
  {
    uint64_t v3 = +[NSUUID UUID];
    customizedUUID = self->_customizedUUID;
    self->_customizedUUID = v3;

    objc_initWeak(&location, self);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = __53__GCControllerSettings_registerForSettingsCustomized__block_invoke;
    v5[3] = &unk_26D22C8B0;
    objc_copyWeak(&v6, &location);
    +[GCControllerSettings registerSettingsCustomizedHandler:v5 forController:self->_uniqueIdentifier forKey:self->_customizedUUID];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __53__GCControllerSettings_registerForSettingsCustomized__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v9 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v10 = [v6 containsObject:WeakRetained[14]];
    if (v10)
    {
      uint64_t v11 = getGCSettingsLogger();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412290;
        uint64_t v14 = v9;
        id v12 = "%@ is now customized";
LABEL_8:
        _os_log_impl(&dword_220998000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v13, 0xCu);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
    if ([v7 containsObject:v9[14]])
    {
      uint64_t v11 = getGCSettingsLogger();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412290;
        uint64_t v14 = v9;
        id v12 = "%@ is no longer customized";
        goto LABEL_8;
      }
LABEL_9:

      [v9 setCustomized:v10];
    }
  }
}

- (void)observeDefaultsKeyPath:(id)a3 options:(unint64_t)a4 context:(void *)a5
{
  id v8 = a3;
  uint64_t v9 = getGCSettingsLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[GCControllerSettings observeDefaultsKeyPath:options:context:]((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);
  }

  [(NSMutableSet *)self->_observedKeyPaths addObject:v8];
  [(NSUserDefaults *)self->_defaults addObserver:self forKeyPath:v8 options:a4 context:a5];
}

- (void)dealloc
{
  uint64_t v3 = getGCSettingsLogger();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    objc_super v19 = self;
    _os_log_impl(&dword_220998000, v3, OS_LOG_TYPE_INFO, "Dealloc: %@", buf, 0xCu);
  }

  [(GCControllerSettings *)self unregisterForSettingsCustomized];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v4 = self->_observedKeyPaths;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
        uint64_t v10 = getGCSettingsLogger();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          observedKeyPaths = self->_observedKeyPaths;
          *(_DWORD *)buf = 138412290;
          objc_super v19 = (GCControllerSettings *)observedKeyPaths;
          _os_log_debug_impl(&dword_220998000, v10, OS_LOG_TYPE_DEBUG, "Remove observer for key path: %@", buf, 0xCu);
        }

        [(NSUserDefaults *)self->_defaults removeObserver:self forKeyPath:v9];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  v12.receiver = self;
  v12.super_class = (Class)GCControllerSettings;
  [(GCControllerSettings *)&v12 dealloc];
}

- (void)_updateControllerReference:(id)a3
{
  p_controller = &self->_controller;
  objc_storeWeak((id *)&self->_controller, a3);
  uint64_t v5 = +[NSMutableDictionary dictionary];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)p_controller);
  uint64_t v7 = objc_msgSend(WeakRetained, "physicalInputProfile", 0);
  uint64_t v8 = [v7 allElements];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v13 remappable])
        {
          long long v14 = [(GCControllerSettings *)self mappingKeyForElement:v13];
          [(NSDictionary *)v5 setObject:v13 forKeyedSubscript:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  elementMappingKeyToElement = self->_elementMappingKeyToElement;
  self->_elementMappingKeyToElement = v5;

  [(GCControllerSettings *)self initializeElementMappings];
  [(GCControllerSettings *)self initializeReplayKitDefaultMappings];
}

- (void)setHapticsEnabled:(BOOL)a3
{
  if (self->_hapticsEnabled != a3)
  {
    self->_hapticsEnabled = a3;
    -[GCControllerSettings saveBool:forKey:](self, "saveBool:forKey:");
  }
}

- (void)setScreenShotEnabled:(BOOL)a3
{
  if (self->_screenShotEnabled != a3)
  {
    self->_screenShotEnabled = a3;
    -[GCControllerSettings saveBool:forKey:](self, "saveBool:forKey:");
  }
}

- (void)setVideoRecordingEnabled:(BOOL)a3
{
  if (self->_videoRecordingEnabled != a3)
  {
    self->_videoRecordingEnabled = a3;
    -[GCControllerSettings saveBool:forKey:](self, "saveBool:forKey:");
  }
}

- (void)setScreenShotKey:(id)a3
{
  id v5 = a3;
  if (([v5 isEqualToString:self->_screenShotKey] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_screenShotKey, a3);
    [(GCControllerSettings *)self saveObject:self->_screenShotKey forKey:@"screenShotMappingKey"];
  }
}

- (void)setScreenShotGesture:(int64_t)a3
{
  if (self->_screenShotGesture != a3)
  {
    self->_screenShotGesture = a3;
    +[NSNumber numberWithInteger:](&off_26D2B68C8, "numberWithInteger:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(GCControllerSettings *)self saveObject:v4 forKey:@"screenShotGestureKey"];
  }
}

- (void)setVideoRecordingKey:(id)a3
{
  id v5 = a3;
  if (([v5 isEqualToString:self->_videoRecordingKey] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_videoRecordingKey, a3);
    [(GCControllerSettings *)self saveObject:self->_videoRecordingKey forKey:@"videoRecordingMappingKey"];
  }
}

- (void)setVideoRecordingGesture:(int64_t)a3
{
  if (self->_videoRecordingGesture != a3)
  {
    self->_videoRecordingGesture = a3;
    +[NSNumber numberWithInteger:](&off_26D2B68C8, "numberWithInteger:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(GCControllerSettings *)self saveObject:v4 forKey:@"videoRecordingGestureKey"];
  }
}

- (void)setVideoRecordingMode:(int64_t)a3
{
  if (self->_videoRecordingMode != a3)
  {
    self->_videoRecordingMode = a3;
    +[NSNumber numberWithInteger:](&off_26D2B68C8, "numberWithInteger:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(GCControllerSettings *)self saveObject:v4 forKey:@"videoRecordingModeKey"];
  }
}

- (GCReplayKitGestureSettings)replayKitGestureSettings
{
  v2 = (void *)[(GCReplayKitGestureSettings *)self->_replayKitGestureSettings copy];

  return (GCReplayKitGestureSettings *)v2;
}

- (void)setReplayKitGestureSettings:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_replayKitGestureSettings)
  {
    BOOL v5 = [(NSUserDefaults *)self->_defaults BOOLForKey:@"settingsOpenedAtLeastOnce"];
    id v4 = v10;
    if (v5)
    {
      uint64_t v6 = +[GCAnalytics instance];
      [v6 sendSettingsRPKitGesturesCustomized:v10 from:self->_replayKitGestureSettings];

      id v4 = v10;
    }
  }
  uint64_t v7 = (GCReplayKitGestureSettings *)[v4 copy];
  replayKitGestureSettings = self->_replayKitGestureSettings;
  self->_replayKitGestureSettings = v7;

  uint64_t v9 = +[NSKeyedArchiver archivedDataWithRootObject:self->_replayKitGestureSettings requiringSecureCoding:1 error:0];
  [(GCControllerSettings *)self saveObject:v9 forKey:@"replayKitSettingsMappingKey"];
}

- (void)setGameIntentMappings:(id)a3
{
  BOOL v5 = (NSDictionary *)a3;
  if (self->_general_gameIntentMappings != v5)
  {
    objc_storeStrong((id *)&self->_general_gameIntentMappings, a3);
    [(GCControllerSettings *)self saveObject:v5 forKey:@"gameIntentKey"];
  }
}

- (void)setCustomizationsEnabled:(BOOL)a3
{
  if (self->_customizationsEnabled != a3)
  {
    self->_BOOL customizationsEnabled = a3;
    id v4 = +[GCAnalytics instance];
    BOOL v5 = [(GCControllerSettings *)self bundleIdentifier];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    uint64_t v7 = [WeakRetained productCategory];
    [v4 sendSettingsCustomizationsToggledEventForBundleID:v5 productCategory:v7 toggledOn:self->_customizationsEnabled];

    BOOL customizationsEnabled = self->_customizationsEnabled;
    [(GCControllerSettings *)self saveBool:customizationsEnabled forKey:@"customizationsEnabled"];
  }
}

- (id)staticDefaultValues
{
  v4[0] = @"hapticsEnabled";
  v4[1] = @"screenShotEnabled";
  v5[0] = &__kCFBooleanTrue;
  v5[1] = &__kCFBooleanTrue;
  v4[2] = @"videoRecordingEnabled";
  v4[3] = @"gameIntentKey";
  v5[2] = &__kCFBooleanTrue;
  v5[3] = @"Button Home";
  v4[4] = @"customizedElements";
  v4[5] = @"settingsOpenedAtLeastOnce";
  void v5[4] = &__NSArray0__struct;
  v5[5] = &__kCFBooleanFalse;
  v4[6] = @"screenShotMappingKey";
  v4[7] = @"screenShotGestureKey";
  v5[6] = &stru_26D27BBB8;
  v5[7] = &unk_26D287560;
  v4[8] = @"videoRecordingMappingKey";
  v4[9] = @"videoRecordingGestureKey";
  v5[8] = &stru_26D27BBB8;
  v5[9] = &unk_26D287560;
  v4[10] = @"videoRecordingModeKey";
  v5[10] = &unk_26D287560;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:11];

  return v2;
}

- (id)defaultValues
{
  uint64_t v3 = +[NSMutableDictionary dictionary];
  id v4 = [(GCControllerSettings *)self staticDefaultValues];
  [v3 addEntriesFromDictionary:v4];

  uint64_t v9 = @"customizationsEnabled";
  BOOL v5 = [(NSString *)self->_bundleIdentifier isEqualToString:@"default"];
  uint64_t v6 = &__kCFBooleanFalse;
  if (v5) {
    uint64_t v6 = &__kCFBooleanTrue;
  }
  id v10 = v6;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [v3 addEntriesFromDictionary:v7];

  return v3;
}

- (id)suiteNameForBundleIdentifier:(id)a3
{
  return +[NSString stringWithFormat:@"%@%@.%@.%@", &stru_26D27BBB8, @"com.apple.gamecontroller.settings", self->_uniqueIdentifier, a3];
}

- (void)initializeUserDefaults
{
  uint64_t v3 = [(GCControllerSettings *)self suiteNameForBundleIdentifier:self->_bundleIdentifier];
  id v4 = getGCSettingsLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v50 = v3;
    _os_log_impl(&dword_220998000, v4, OS_LOG_TYPE_INFO, "Initializing user defaults with suite = %@", buf, 0xCu);
  }

  BOOL v5 = (NSUserDefaults *)[objc_alloc((Class)&off_26D2BBC18) initWithSuiteName:v3];
  defaults = self->_defaults;
  self->_defaults = v5;

  uint64_t v7 = self->_defaults;
  uint64_t v8 = [(GCControllerSettings *)self staticDefaultValues];
  [(NSUserDefaults *)v7 registerDefaults:v8];

  [(GCControllerSettings *)self initializeElementMappings];
  v48[0] = @"elementMapping";
  v48[1] = @"hapticsEnabled";
  v48[2] = @"screenShotEnabled";
  v48[3] = @"videoRecordingEnabled";
  v48[6] = @"videoRecordingMappingKey";
  v48[7] = @"videoRecordingGestureKey";
  v48[8] = @"videoRecordingModeKey";
  v48[9] = @"replayKitSettingsMappingKey";
  v48[4] = @"screenShotMappingKey";
  v48[5] = @"screenShotGestureKey";
  v48[10] = @"gameIntentKey";
  v48[11] = @"customizationsEnabled";
  v48[12] = @"customizedElements";
  v48[13] = @"settingsOpenedAtLeastOnce";
  uint64_t v9 = +[NSArray arrayWithObjects:v48 count:14];
  [(GCControllerSettings *)self observeDefaultsKeyPaths:v9];

  self->_BOOL hapticsEnabled = [(NSUserDefaults *)self->_defaults BOOLForKey:@"hapticsEnabled"];
  self->_screenShotEnabled = [(NSUserDefaults *)self->_defaults BOOLForKey:@"screenShotEnabled"];
  self->_videoRecordingEnabled = [(NSUserDefaults *)self->_defaults BOOLForKey:@"videoRecordingEnabled"];
  id v10 = [(NSUserDefaults *)self->_defaults objectForKey:@"screenShotMappingKey"];
  screenShotKey = self->_screenShotKey;
  self->_screenShotKey = v10;

  objc_super v12 = [(NSUserDefaults *)self->_defaults objectForKey:@"screenShotGestureKey"];
  if (v12)
  {
    long long v13 = +[NSNull null];

    if (v12 != v13) {
      self->_screenShotGesture = [v12 integerValue];
    }
  }
  v47 = v12;
  long long v14 = [(NSUserDefaults *)self->_defaults objectForKey:@"videoRecordingMappingKey"];
  videoRecordingKey = self->_videoRecordingKey;
  self->_videoRecordingKey = v14;

  long long v16 = [(NSUserDefaults *)self->_defaults objectForKey:@"videoRecordingGestureKey"];
  if (v16)
  {
    long long v17 = +[NSNull null];

    if (v16 != v17) {
      self->_videoRecordingGesture = [v16 integerValue];
    }
  }
  long long v18 = [(NSUserDefaults *)self->_defaults objectForKey:@"videoRecordingModeKey"];
  if (v18)
  {
    long long v19 = +[NSNull null];

    if (v18 != v19) {
      self->_videoRecordingMode = [v18 integerValue];
    }
  }
  v20 = [(NSUserDefaults *)self->_defaults objectForKey:@"replayKitSettingsMappingKey"];
  if (v20)
  {
    v21 = +[NSNull null];

    if (v20 != v21)
    {
      id v22 = v20;
      uint64_t v23 = objc_opt_class();
      uint64_t v24 = objc_opt_class();
      v25 = +[NSSet setWithObjects:](&off_26D2B4E80, "setWithObjects:", v23, v24, objc_opt_class(), 0);
      uint64_t v26 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v25 fromData:v22 error:0];

      if (v26) {
        objc_storeStrong((id *)&self->_replayKitGestureSettings, v26);
      }
    }
  }
  [(GCControllerSettings *)self initializeReplayKitDefaultMappings];
  if ([(NSUserDefaults *)self->_defaults BOOLForKey:@"settingsOpenedAtLeastOnce"]
    || !self->_settingsAppOpenedAtLeastOnce)
  {
    v27 = [(NSUserDefaults *)self->_defaults objectForKey:@"settingsOpenedAtLeastOnce"];

    if (v27) {
      self->_settingsAppOpenedAtLeastOnce = [(NSUserDefaults *)self->_defaults BOOLForKey:@"settingsOpenedAtLeastOnce"];
    }
  }
  else
  {
    [(GCControllerSettings *)self saveBool:1 forKey:@"settingsOpenedAtLeastOnce"];
  }
  uint64_t v28 = [(NSUserDefaults *)self->_defaults objectForKey:@"gameIntentKey"];
  general_gameIntentMappings = self->_general_gameIntentMappings;
  self->_general_gameIntentMappings = v28;

  uint64_t v30 = [(NSUserDefaults *)self->_defaults objectForKey:@"customizationsEnabled"];
  uint64_t v31 = [(GCControllerSettings *)self defaultValues];
  v32 = [v31 objectForKey:@"customizationsEnabled"];

  if (v30) {
    v33 = v30;
  }
  else {
    v33 = v32;
  }
  self->_BOOL customizationsEnabled = [v33 BOOLValue];
  v34 = [(NSUserDefaults *)self->_defaults arrayForKey:@"customizedElements"];
  id v35 = (NSArray *)[v34 mutableCopy];
  customizedElementSettings = self->_customizedElementSettings;
  self->_customizedElementSettings = v35;

  [(GCControllerSettings *)self populateElementSettings];
  long long v37 = getGCSettingsLogger();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    BOOL hapticsEnabled = self->_hapticsEnabled;
    *(_DWORD *)buf = 67109120;
    LODWORD(v50) = hapticsEnabled;
    _os_log_impl(&dword_220998000, v37, OS_LOG_TYPE_INFO, "Initialized hapticsEnabled to %d", buf, 8u);
  }

  long long v39 = getGCSettingsLogger();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    replayKitGestureSettings = self->_replayKitGestureSettings;
    *(_DWORD *)buf = 138412290;
    v50 = replayKitGestureSettings;
    _os_log_impl(&dword_220998000, v39, OS_LOG_TYPE_INFO, "Initialized replayKitGestureSettings to %@", buf, 0xCu);
  }

  v41 = getGCSettingsLogger();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    v42 = self->_general_gameIntentMappings;
    *(_DWORD *)buf = 138412290;
    v50 = v42;
    _os_log_impl(&dword_220998000, v41, OS_LOG_TYPE_INFO, "Initialized gameIntentMappings to %@", buf, 0xCu);
  }

  v43 = getGCSettingsLogger();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    BOOL customizationsEnabled = self->_customizationsEnabled;
    *(_DWORD *)buf = 67109120;
    LODWORD(v50) = customizationsEnabled;
    _os_log_impl(&dword_220998000, v43, OS_LOG_TYPE_INFO, "Initialized customizationsEnabled to %d", buf, 8u);
  }

  v45 = getGCSettingsLogger();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
  {
    v46 = self->_customizedElementSettings;
    *(_DWORD *)buf = 138412290;
    v50 = v46;
    _os_log_impl(&dword_220998000, v45, OS_LOG_TYPE_INFO, "Initialized customizedElementSettings to %@", buf, 0xCu);
  }
}

- (void)observeDefaultsKeyPaths:(id)a3
{
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(GCControllerSettings *)self observeDefaultsKeyPath:*(void *)(*((void *)&v9 + 1) + 8 * v8++) options:3 context:kGCSettingsContext];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)initializeReplayKitDefaultMappings
{
  p_controller = &self->_controller;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_controller);
    uint64_t v6 = [v5 physicalInputProfile];
    uint64_t v7 = [v6 elements];
    uint64_t v8 = [v7 objectForKeyedSubscript:@"Button Share"];

    long long v9 = @"Button Options";
    if (v8)
    {
      long long v9 = @"Button Share";
      uint64_t v10 = 0;
    }
    else
    {
      uint64_t v10 = -1;
    }
    if (v8) {
      uint64_t v11 = -1;
    }
    else {
      uint64_t v11 = 0;
    }
    long long v12 = v9;
    long long v13 = objc_alloc_init(GCReplayKitGestureSettings);
    [(GCReplayKitGestureSettings *)v13 setControllerElementMappingKey:v12];
    [(GCReplayKitGestureSettings *)v13 setSinglePressGesture:v10];
    [(GCReplayKitGestureSettings *)v13 setDoublePressGesture:v11];
    [(GCReplayKitGestureSettings *)v13 setLongPressGesture:1];
    replayKitGestureSettings = self->_replayKitGestureSettings;
    if (self->_serialized)
    {
      if (!replayKitGestureSettings || !self->_settingsAppOpenedAtLeastOnce)
      {
        objc_storeStrong((id *)&self->_replayKitGestureSettings, v13);
        [(GCReplayKitGestureSettings *)self->_replayKitGestureSettings setControllerElementMappingKey:v12];
        long long v15 = getGCSettingsLogger();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          long long v16 = self->_replayKitGestureSettings;
          BOOL settingsAppOpenedAtLeastOnce = self->_settingsAppOpenedAtLeastOnce;
          int v18 = 138412546;
          long long v19 = v16;
          __int16 v20 = 1024;
          BOOL v21 = settingsAppOpenedAtLeastOnce;
          _os_log_impl(&dword_220998000, v15, OS_LOG_TYPE_INFO, "Default ReplayKit settings = {\n                              _replayKitGestureSettings = %@\n                              _BOOL settingsAppOpenedAtLeastOnce = %d\n", (uint8_t *)&v18, 0x12u);
        }
      }
    }
    else if (!replayKitGestureSettings {
           || ![(NSUserDefaults *)self->_defaults BOOLForKey:@"settingsOpenedAtLeastOnce"])
    }
    {
      [(GCControllerSettings *)self setReplayKitGestureSettings:v13];
    }
  }
}

- (void)initializeElementMappings
{
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v10 = (__CFString *)a3;
  id v11 = a4;
  id v12 = a5;
  long long v13 = getGCSettingsLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413314;
    v51 = self;
    __int16 v52 = 2112;
    v53 = v10;
    __int16 v54 = 2112;
    id v55 = v11;
    __int16 v56 = 2112;
    id v57 = v12;
    __int16 v58 = 2048;
    v59 = a6;
    _os_log_debug_impl(&dword_220998000, v13, OS_LOG_TYPE_DEBUG, "%@ observeValueForKeyPath: %@ ofObject:%@ change:%@ context:%p", buf, 0x34u);
  }

  if ((void *)kGCSettingsContext != a6)
  {
    if ((void *)kGCSettingsElementMappingsContext == a6)
    {
      uint64_t v16 = [(NSMutableDictionary *)self->_elementSettings objectForKeyedSubscript:v10];
      if (v16)
      {
        long long v17 = (void *)v16;
        int v18 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
        long long v19 = +[NSNull null];
        int v20 = [v18 isEqual:v19];

        if (v20) {
          BOOL v21 = 0;
        }
        else {
          BOOL v21 = v18;
        }
        [v17 setDictionaryRepresentation:v21];
        settingsChangedHandler = (void (**)(id, GCControllerSettings *))self->_settingsChangedHandler;
        if (settingsChangedHandler) {
          settingsChangedHandler[2](settingsChangedHandler, self);
        }
      }
    }
    else
    {
      v49.receiver = self;
      v49.super_class = (Class)GCControllerSettings;
      [(GCControllerSettings *)&v49 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
    }
    goto LABEL_44;
  }
  if (v10 == @"elementMapping")
  {
    long long v14 = @"elementMappings";
    [(GCControllerSettings *)self willChangeValueForKey:@"elementMappings"];
    [(GCControllerSettings *)self initializeElementMappings];
LABEL_40:
    v33 = self;
    v34 = v14;
LABEL_41:
    [(GCControllerSettings *)v33 didChangeValueForKey:v34];
    goto LABEL_42;
  }
  if (v10 == @"hapticsEnabled")
  {
    long long v14 = @"hapticsEnabled";
    [(GCControllerSettings *)self willChangeValueForKey:@"hapticsEnabled"];
    long long v15 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    self->_BOOL hapticsEnabled = [v15 BOOLValue];
LABEL_39:

    goto LABEL_40;
  }
  if (v10 == @"customizationsEnabled")
  {
    long long v14 = @"customizationsEnabled";
    [(GCControllerSettings *)self willChangeValueForKey:@"customizationsEnabled"];
    long long v15 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    self->_BOOL customizationsEnabled = [v15 BOOLValue];
    goto LABEL_39;
  }
  if (@"customizedElements" == v10)
  {
    long long v14 = @"customizedElementSettings";
    [(GCControllerSettings *)self willChangeValueForKey:@"customizedElementSettings"];
    uint64_t v23 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    uint64_t v24 = (NSArray *)[v23 mutableCopy];
    customizedElementSettings = self->_customizedElementSettings;
    self->_customizedElementSettings = v24;

    [(GCControllerSettings *)self populateElementSettings];
    goto LABEL_40;
  }
  if (v10 == @"screenShotEnabled")
  {
    long long v14 = @"screenShotEnabled";
    [(GCControllerSettings *)self willChangeValueForKey:@"screenShotEnabled"];
    long long v15 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    self->_screenShotEnabled = [v15 BOOLValue];
    goto LABEL_39;
  }
  if (v10 == @"videoRecordingEnabled")
  {
    long long v14 = @"videoRecordingEnabled";
    [(GCControllerSettings *)self willChangeValueForKey:@"videoRecordingEnabled"];
    long long v15 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    self->_videoRecordingEnabled = [v15 BOOLValue];
    goto LABEL_39;
  }
  if (v10 == @"screenShotMappingKey")
  {
    long long v14 = @"screenShotMappingKey";
    [(GCControllerSettings *)self willChangeValueForKey:@"screenShotMappingKey"];
    long long v15 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    uint64_t v26 = (NSString *)[v15 mutableCopy];
    screenShotKey = (NSDictionary *)self->_screenShotKey;
    self->_screenShotKey = v26;
LABEL_38:

    goto LABEL_39;
  }
  if (v10 == @"screenShotGestureKey")
  {
    uint64_t v28 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      goto LABEL_42;
    }
    uint64_t v30 = @"screenShotGestureKey";
    [(GCControllerSettings *)self willChangeValueForKey:@"screenShotGestureKey"];
    uint64_t v31 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    self->_screenShotGesture = [v31 integerValue];
    goto LABEL_49;
  }
  if (v10 == @"videoRecordingMappingKey")
  {
    long long v14 = @"videoRecordingMappingKey";
    [(GCControllerSettings *)self willChangeValueForKey:@"videoRecordingMappingKey"];
    long long v15 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    v32 = (NSString *)[v15 mutableCopy];
    screenShotKey = (NSDictionary *)self->_videoRecordingKey;
    self->_videoRecordingKey = v32;
    goto LABEL_38;
  }
  if (v10 == @"videoRecordingGestureKey")
  {
    long long v36 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    objc_opt_class();
    char v37 = objc_opt_isKindOfClass();

    if ((v37 & 1) == 0)
    {
      uint64_t v30 = @"videoRecordingGestureKey";
      [(GCControllerSettings *)self willChangeValueForKey:@"videoRecordingGestureKey"];
      uint64_t v31 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
      self->_videoRecordingGesture = [v31 integerValue];
LABEL_49:

      v33 = self;
      v34 = v30;
      goto LABEL_41;
    }
  }
  else
  {
    if (v10 != @"videoRecordingModeKey")
    {
      if (v10 == @"replayKitSettingsMappingKey")
      {
        objc_super v40 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
        objc_opt_class();
        char v41 = objc_opt_isKindOfClass();

        if ((v41 & 1) == 0)
        {
          [(GCControllerSettings *)self willChangeValueForKey:@"replayKitSettingsMappingKey"];
          v42 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
          uint64_t v43 = objc_opt_class();
          uint64_t v44 = objc_opt_class();
          v45 = +[NSSet setWithObjects:](&off_26D2B4E80, "setWithObjects:", v43, v44, objc_opt_class(), 0);
          v46 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v45 fromData:v42 error:0];
          replayKitGestureSettings = self->_replayKitGestureSettings;
          self->_replayKitGestureSettings = v46;

          [(GCControllerSettings *)self didChangeValueForKey:@"replayKitSettingsMappingKey"];
        }
        goto LABEL_42;
      }
      if (v10 != @"gameIntentKey")
      {
        if (v10 != @"settingsOpenedAtLeastOnce") {
          goto LABEL_42;
        }
        long long v14 = @"settingsOpenedAtLeastOnce";
        [(GCControllerSettings *)self willChangeValueForKey:@"settingsOpenedAtLeastOnce"];
        long long v15 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
        self->_BOOL settingsAppOpenedAtLeastOnce = [v15 integerValue] != 0;
        goto LABEL_39;
      }
      long long v14 = @"gameIntentKey";
      [(GCControllerSettings *)self willChangeValueForKey:@"gameIntentKey"];
      long long v15 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
      v48 = (NSDictionary *)[v15 mutableCopy];
      screenShotKey = self->_general_gameIntentMappings;
      self->_general_gameIntentMappings = v48;
      goto LABEL_38;
    }
    long long v38 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    objc_opt_class();
    char v39 = objc_opt_isKindOfClass();

    if ((v39 & 1) == 0)
    {
      uint64_t v30 = @"videoRecordingModeKey";
      [(GCControllerSettings *)self willChangeValueForKey:@"videoRecordingModeKey"];
      uint64_t v31 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
      self->_videoRecordingMode = [v31 integerValue];
      goto LABEL_49;
    }
  }
LABEL_42:
  id v35 = (void (**)(id, GCControllerSettings *))self->_settingsChangedHandler;
  if (v35) {
    v35[2](v35, self);
  }
LABEL_44:
}

- (id)mappingForElement:(id)a3
{
  id v4 = a3;
  if ([v4 remappable])
  {
    elementMappings = self->_elementMappings;
    uint64_t v6 = [(GCControllerSettings *)self mappingKeyForElement:v4];
    id v7 = [(NSMutableDictionary *)elementMappings objectForKeyedSubscript:v6];
  }
  else
  {
    id v7 = v4;
  }

  return v7;
}

- (id)mappingForButton:(id)a3
{
  uint64_t v3 = [(GCControllerSettings *)self mappingForElement:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)mappingForDirectionPad:(id)a3
{
  uint64_t v3 = [(GCControllerSettings *)self mappingForElement:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)mappingForTouchpad:(id)a3
{
  uint64_t v3 = [(GCControllerSettings *)self mappingForElement:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->__elementMappingFromUserDefaults forKey:@"__elementMappingFromUserDefaults"];
  [v4 encodeBool:self->_hapticsEnabled forKey:@"_hapticsEnabled"];
  [v4 encodeBool:self->_screenShotEnabled forKey:@"_screenShotEnabled"];
  [v4 encodeBool:self->_videoRecordingEnabled forKey:@"_videoRecordingEnabled"];
  if (self->_settingsAppOpenedAtLeastOnce)
  {
    [v4 encodeObject:self->_screenShotKey forKey:@"_screenShotKey"];
    [v4 encodeInteger:self->_screenShotGesture forKey:@"_screenShotGesture"];
    [v4 encodeObject:self->_videoRecordingKey forKey:@"_videoRecordingKey"];
    [v4 encodeInteger:self->_videoRecordingGesture forKey:@"_videoRecordingGesture"];
    [v4 encodeInteger:self->_videoRecordingMode forKey:@"_videoRecordingMode"];
    [v4 encodeObject:self->_replayKitGestureSettings forKey:@"_replayKitGestureSettings"];
  }
  [v4 encodeObject:self->_general_gameIntentMappings forKey:@"_general_gameIntentMappings"];
  [v4 encodeBool:self->_customizationsEnabled forKey:@"_customizationsEnabled"];
  [v4 encodeObject:self->_customizedElementSettings forKey:@"_customizedElementSettings"];
  [v4 encodeObject:self->_elementSettings forKey:@"_elementSettings"];
  [v4 encodeObject:self->_uniqueIdentifier forKey:@"_uniqueIdentifier"];
  [v4 encodeObject:self->_bundleIdentifier forKey:@"_bundleIdentifier"];
  [v4 encodeBool:self->_settingsAppOpenedAtLeastOnce forKey:@"_settingsAppOpenedAtLeastOnce"];
  id v5 = getGCSettingsLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    BOOL hapticsEnabled = self->_hapticsEnabled;
    BOOL screenShotEnabled = self->_screenShotEnabled;
    BOOL videoRecordingEnabled = self->_videoRecordingEnabled;
    screenShotKey = self->_screenShotKey;
    int64_t screenShotGesture = self->_screenShotGesture;
    videoRecordingKey = self->_videoRecordingKey;
    int64_t videoRecordingGesture = self->_videoRecordingGesture;
    int64_t videoRecordingMode = self->_videoRecordingMode;
    general_gameIntentMappings = self->_general_gameIntentMappings;
    BOOL customizationsEnabled = self->_customizationsEnabled;
    elementMappingFromUserDefaults = self->__elementMappingFromUserDefaults;
    customizedElementSettings = self->_customizedElementSettings;
    elementSettings = self->_elementSettings;
    uniqueIdentifier = self->_uniqueIdentifier;
    bundleIdentifier = self->_bundleIdentifier;
    BOOL settingsAppOpenedAtLeastOnce = self->_settingsAppOpenedAtLeastOnce;
    int v22 = 138416130;
    uint64_t v23 = elementMappingFromUserDefaults;
    __int16 v24 = 1024;
    BOOL v25 = hapticsEnabled;
    __int16 v26 = 1024;
    BOOL v27 = screenShotEnabled;
    __int16 v28 = 1024;
    BOOL v29 = videoRecordingEnabled;
    __int16 v30 = 2112;
    uint64_t v31 = screenShotKey;
    __int16 v32 = 1024;
    int v33 = screenShotGesture;
    __int16 v34 = 2112;
    id v35 = videoRecordingKey;
    __int16 v36 = 1024;
    int v37 = videoRecordingGesture;
    __int16 v38 = 1024;
    int v39 = videoRecordingMode;
    __int16 v40 = 2112;
    char v41 = general_gameIntentMappings;
    __int16 v42 = 1024;
    BOOL v43 = customizationsEnabled;
    __int16 v44 = 2112;
    v45 = customizedElementSettings;
    __int16 v46 = 2112;
    v47 = elementSettings;
    __int16 v48 = 2112;
    objc_super v49 = uniqueIdentifier;
    __int16 v50 = 2112;
    v51 = bundleIdentifier;
    __int16 v52 = 1024;
    BOOL v53 = settingsAppOpenedAtLeastOnce;
    _os_log_impl(&dword_220998000, v5, OS_LOG_TYPE_INFO, "Encoded settings = {\n                      __elementMappingFromUserDefaults = %@\n                      _hapticsEnabled = %d\n                      _screenShotEnabled = %d\n                      _videoRecordingEnabled = %d\n                      _screenShotKey = %@\n                      _screenShotGesture = %d\n                      _videoRecordingKey = %@\n                      _videoRecordingGesture = %d\n                      _videoRecordingMode = %d\n                      _general_gameIntentMappings = %@\n                      _BOOL customizationsEnabled = %d\n                      _customizedElementSettings = %@\n                      _elementSettings = %@\n                      _uniqueIdentifier = %@\n                      _bundleIdentifier = %@\n"
      "                      _BOOL settingsAppOpenedAtLeastOnce = %d\n",
      (uint8_t *)&v22,
      0x82u);
  }
}

- (GCControllerSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)GCControllerSettings;
  id v5 = [(GCControllerSettings *)&v43 init];
  uint64_t v6 = v5;
  if (v5)
  {
    v5->_serialized = 1;
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = +[NSSet setWithObjects:](&off_26D2B4E80, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"__elementMappingFromUserDefaults"];
    elementMappingFromUserDefaults = v6->__elementMappingFromUserDefaults;
    v6->__elementMappingFromUserDefaults = (NSMutableDictionary *)v9;

    v6->_BOOL hapticsEnabled = [v4 decodeBoolForKey:@"_hapticsEnabled"];
    v6->_BOOL screenShotEnabled = [v4 decodeBoolForKey:@"_screenShotEnabled"];
    v6->_BOOL videoRecordingEnabled = [v4 decodeBoolForKey:@"_videoRecordingEnabled"];
    int v11 = [v4 decodeBoolForKey:@"_settingsAppOpenedAtLeastOnce"];
    v6->_BOOL settingsAppOpenedAtLeastOnce = v11;
    if (v11)
    {
      id v12 = +[NSSet setWithObjects:](&off_26D2B4E80, "setWithObjects:", objc_opt_class(), 0);
      uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"_screenShotKey"];
      screenShotKey = v6->_screenShotKey;
      v6->_screenShotKey = (NSString *)v13;

      v6->_int64_t screenShotGesture = [v4 decodeIntegerForKey:@"_screenShotGesture"];
      long long v15 = +[NSSet setWithObjects:](&off_26D2B4E80, "setWithObjects:", objc_opt_class(), 0);
      uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"_videoRecordingKey"];
      videoRecordingKey = v6->_videoRecordingKey;
      v6->_videoRecordingKey = (NSString *)v16;

      v6->_int64_t videoRecordingGesture = [v4 decodeIntegerForKey:@"_videoRecordingGesture"];
      v6->_int64_t videoRecordingMode = [v4 decodeIntegerForKey:@"_videoRecordingMode"];
      uint64_t v18 = objc_opt_class();
      uint64_t v19 = objc_opt_class();
      int v20 = +[NSSet setWithObjects:](&off_26D2B4E80, "setWithObjects:", v18, v19, objc_opt_class(), 0);
      uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"_replayKitGestureSettings"];
      replayKitGestureSettings = v6->_replayKitGestureSettings;
      v6->_replayKitGestureSettings = (GCReplayKitGestureSettings *)v21;
    }
    uint64_t v23 = objc_opt_class();
    __int16 v24 = +[NSSet setWithObjects:](&off_26D2B4E80, "setWithObjects:", v23, objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"_general_gameIntentMappings"];
    general_gameIntentMappings = v6->_general_gameIntentMappings;
    v6->_general_gameIntentMappings = (NSDictionary *)v25;

    v6->_BOOL customizationsEnabled = [v4 decodeBoolForKey:@"_customizationsEnabled"];
    uint64_t v27 = objc_opt_class();
    __int16 v28 = +[NSSet setWithObjects:](&off_26D2B4E80, "setWithObjects:", v27, objc_opt_class(), 0);
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"_customizedElementSettings"];
    customizedElementSettings = v6->_customizedElementSettings;
    v6->_customizedElementSettings = (NSArray *)v29;

    uint64_t v31 = objc_opt_class();
    uint64_t v32 = objc_opt_class();
    int v33 = +[NSSet setWithObjects:](&off_26D2B4E80, "setWithObjects:", v31, v32, objc_opt_class(), 0);
    uint64_t v34 = [v4 decodeObjectOfClasses:v33 forKey:@"_elementSettings"];
    elementSettings = v6->_elementSettings;
    v6->_elementSettings = (NSMutableDictionary *)v34;

    __int16 v36 = GCIPCObjectIdentifier_Classes();
    uint64_t v37 = [v4 decodeObjectOfClasses:v36 forKey:@"_uniqueIdentifier"];
    uniqueIdentifier = v6->_uniqueIdentifier;
    v6->_uniqueIdentifier = (NSCopying *)v37;

    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bundleIdentifier"];
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v39;

    uint64_t v41 = gcControllerSettingsID++;
    v6->_settingsID = v41;
  }

  return v6;
}

- (void)setMappingForElement:(id)a3 toElement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 remappable] && objc_msgSend(v7, "remappable"))
  {
    uint64_t v8 = [(GCControllerSettings *)self mappingKeyForElement:v6];
    uint64_t v9 = [(GCControllerSettings *)self mappingKeyForElement:v7];
    id v10 = [(NSMutableDictionary *)self->_elementMappings objectForKeyedSubscript:v8];

    if (v10 == v7)
    {
      uint64_t v18 = getGCSettingsLogger();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v21 = v6;
        __int16 v22 = 2112;
        id v23 = v7;
        _os_log_impl(&dword_220998000, v18, OS_LOG_TYPE_INFO, "%@ already maps to %@!", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v19 = v9;
      int v11 = +[GCAnalytics instance];
      bundleIdentifier = self->_bundleIdentifier;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
      long long v14 = [WeakRetained productCategory];
      long long v15 = mappingKeyForElement(v6);
      [v11 sendSettingsButtonCustomizedEventForBundleID:bundleIdentifier productCategory:v14 button:v15];

      uint64_t v16 = +[NSMutableDictionary dictionaryWithDictionary:self->_elementMappings];
      [v16 setObject:v7 forKeyedSubscript:v8];
      objc_storeStrong((id *)&self->_elementMappings, v16);
      elementMappingFromUserDefaults = self->__elementMappingFromUserDefaults;
      if (v6 == v7)
      {
        [(NSMutableDictionary *)elementMappingFromUserDefaults removeObjectForKey:v8];
        uint64_t v9 = v19;
      }
      else
      {
        uint64_t v9 = v19;
        [(NSMutableDictionary *)elementMappingFromUserDefaults setObject:v19 forKeyedSubscript:v8];
      }
      if ([(NSMutableDictionary *)self->__elementMappingFromUserDefaults count]) {
        [(GCControllerSettings *)self saveObject:self->__elementMappingFromUserDefaults forKey:@"elementMapping"];
      }
      else {
        [(GCControllerSettings *)self deleteObjectForKey:@"elementMapping"];
      }
    }
  }
}

- (id)elementSettingForKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_elementSettings objectForKeyedSubscript:v4];

    if (v5)
    {
      id v6 = [(NSMutableDictionary *)self->_elementSettings objectForKeyedSubscript:v4];
    }
    else
    {
      id v6 = [[GCControllerElementSettings alloc] initWithElementKey:v4];
      objc_initWeak(&location, self);
      id v7 = [(NSUserDefaults *)self->_defaults objectForKey:v4];
      if (v7) {
        [(GCControllerElementSettings *)v6 setDictionaryRepresentation:v7];
      }
      [(GCControllerSettings *)self observeDefaultsKeyPath:v4 options:1 context:kGCSettingsElementMappingsContext];
      [(NSMutableDictionary *)self->_elementSettings setObject:v6 forKeyedSubscript:v4];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = __45__GCControllerSettings_elementSettingForKey___block_invoke;
      v9[3] = &unk_26D22C8D8;
      objc_copyWeak(&v11, &location);
      id v10 = v4;
      [(GCControllerElementSettings *)v6 setChangedHandler:v9];

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __45__GCControllerSettings_elementSettingForKey___block_invoke(uint64_t a1, void *a2)
{
  id v17 = a2;
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = +[GCAnalytics instance];
    uint64_t v5 = *((void *)WeakRetained + 14);
    id v6 = objc_loadWeakRetained((id *)WeakRetained + 6);
    id v7 = [v6 productCategory];
    uint64_t v8 = [v17 mappingKey];
    [v4 sendSettingsButtonCustomizedEventForBundleID:v5 productCategory:v7 button:v8];

    LODWORD(v4) = [v17 isCustomized];
    uint64_t v9 = (id *)(WeakRetained + 40);
    int v10 = [*((id *)WeakRetained + 5) containsObject:*(void *)(a1 + 32)];
    if (v4)
    {
      if ((v10 & 1) == 0)
      {
        id v11 = (void *)[*((id *)WeakRetained + 5) mutableCopy];
        [v11 addObject:*(void *)(a1 + 32)];
        id v12 = (void *)*((void *)WeakRetained + 5);
        *((void *)WeakRetained + 5) = v11;
        id v13 = v11;

        [WeakRetained saveObject:*((void *)WeakRetained + 5) forKey:@"customizedElements"];
      }
      long long v14 = [v17 dictionaryRepresentation];
      long long v15 = [v17 mappingKey];
      [WeakRetained saveObject:v14 forKey:v15];
    }
    else
    {
      if (v10)
      {
        uint64_t v16 = (void *)[*v9 mutableCopy];
        [v16 removeObject:*(void *)(a1 + 32)];
        objc_storeStrong((id *)WeakRetained + 5, v16);
        if ([*v9 count]) {
          [WeakRetained saveObject:*((void *)WeakRetained + 5) forKey:@"customizedElements"];
        }
        else {
          [WeakRetained deleteObjectForKey:@"customizedElements"];
        }
      }
      long long v14 = [v17 mappingKey];
      [WeakRetained deleteObjectForKey:v14];
    }
  }
}

- (void)populateElementSettings
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = self->_customizedElementSettings;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = -[GCControllerSettings elementSettingForKey:](self, "elementSettingForKey:", *(void *)(*((void *)&v9 + 1) + 8 * v7++), (void)v9);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (id)settingsForElement:(id)a3
{
  uint64_t v4 = [(GCControllerSettings *)self mappingKeyForElement:a3];
  uint64_t v5 = [(GCControllerSettings *)self elementSettingForKey:v4];

  return v5;
}

- (void)eraseAllSettings
{
  uint64_t v3 = getGCSettingsLogger();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_220998000, v3, OS_LOG_TYPE_DEFAULT, "eraseAllSettings", buf, 2u);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = [(NSUserDefaults *)self->_defaults dictionaryRepresentation];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        long long v10 = getGCSettingsLogger();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v24 = v9;
          _os_log_impl(&dword_220998000, v10, OS_LOG_TYPE_DEFAULT, "Erasing %@...", buf, 0xCu);
        }

        long long v11 = [(GCControllerSettings *)self defaultValues];
        long long v12 = [v11 objectForKey:v9];

        defaults = self->_defaults;
        if (v12) {
          [(NSUserDefaults *)defaults setObject:v12 forKey:v9];
        }
        else {
          [(NSUserDefaults *)defaults removeObjectForKey:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v6);
  }

  long long v14 = getGCSettingsLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_220998000, v14, OS_LOG_TYPE_DEFAULT, "Initializing Replay Kit default mappings...", buf, 2u);
  }

  [(GCControllerSettings *)self initializeReplayKitDefaultMappings];
  long long v15 = +[GCAnalytics instance];
  bundleIdentifier = self->_bundleIdentifier;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  uint64_t v18 = [WeakRetained productCategory];
  [v15 sendSettingsCustomizationsResetEventForBundleID:bundleIdentifier productCategory:v18];

  +[GCControllerSettings setSettingsExist:0 forBundleIdentifier:self->_bundleIdentifier];
  +[GCControllerSettings setSettingsExist:0 forController:self->_uniqueIdentifier forBundleIdentifier:self->_bundleIdentifier];
}

- (void)restoreElementMappingToDefault
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = self->_customizedElementSettings;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[GCControllerSettings deleteObjectForKey:](self, "deleteObjectForKey:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(GCControllerSettings *)self deleteObjectForKey:@"customizedElements"];
  [(GCControllerSettings *)self deleteObjectForKey:@"elementMapping"];
}

- (void)deleteObjectForKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    defaults = self->_defaults;
    if (defaults)
    {
      uint64_t v6 = [(NSUserDefaults *)defaults objectForKey:v4];

      uint64_t v7 = getGCSettingsLogger();
      long long v8 = v7;
      if (v6)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          long long v9 = [(NSUserDefaults *)self->_defaults objectForKey:v4];
          int v10 = 138412802;
          long long v11 = self;
          __int16 v12 = 2112;
          id v13 = v4;
          __int16 v14 = 2112;
          long long v15 = v9;
          _os_log_impl(&dword_220998000, v8, OS_LOG_TYPE_DEFAULT, "%@ - deleting from disk %@ -> %@", (uint8_t *)&v10, 0x20u);
        }
        [(NSUserDefaults *)self->_defaults removeObjectForKey:v4];
      }
      else
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          [(GCControllerSettings *)(uint64_t)self deleteObjectForKey:v8];
        }
      }
    }
  }
}

- (void)refreshSettingsExist
{
  uint64_t v3 = [(NSUserDefaults *)self->_defaults dictionaryRepresentation];
  BOOL v4 = [v3 count] != 0;

  +[GCControllerSettings setSettingsExist:v4 forBundleIdentifier:self->_bundleIdentifier];
  uniqueIdentifier = self->_uniqueIdentifier;
  bundleIdentifier = self->_bundleIdentifier;

  +[GCControllerSettings setSettingsExist:v4 forController:uniqueIdentifier forBundleIdentifier:bundleIdentifier];
}

- (void)saveObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_defaults)
  {
    long long v8 = getGCSettingsLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412802;
      int v10 = self;
      __int16 v11 = 2112;
      id v12 = v7;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_220998000, v8, OS_LOG_TYPE_DEFAULT, "%@ - saving to disk %@ -> %@", (uint8_t *)&v9, 0x20u);
    }

    [(NSUserDefaults *)self->_defaults setObject:v6 forKey:v7];
    [(GCControllerSettings *)self refreshSettingsExist];
  }
}

- (void)saveBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (self->_defaults)
  {
    id v7 = getGCSettingsLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412802;
      int v9 = self;
      __int16 v10 = 2112;
      id v11 = v6;
      __int16 v12 = 1024;
      BOOL v13 = v4;
      _os_log_impl(&dword_220998000, v7, OS_LOG_TYPE_DEFAULT, "%@ - saving to disk %@ -> %d", (uint8_t *)&v8, 0x1Cu);
    }

    [(NSUserDefaults *)self->_defaults setBool:v4 forKey:v6];
    [(GCControllerSettings *)self refreshSettingsExist];
  }
}

- (id)mappingKeyForElement:(id)a3
{
  return (id)[a3 primaryAlias];
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  unint64_t settingsID = self->_settingsID;
  uint64_t v5 = [(GCControllerSettings *)self suiteNameForBundleIdentifier:self->_bundleIdentifier];
  id v6 = +[NSString stringWithFormat:@"<%@ id=%lu suite=%@>", v3, settingsID, v5];

  return v6;
}

- (NSCopying)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSDictionary)elementMappings
{
  return &self->_elementMappings->super;
}

- (BOOL)hapticsEnabled
{
  return self->_hapticsEnabled;
}

- (BOOL)screenShotEnabled
{
  return self->_screenShotEnabled;
}

- (BOOL)videoRecordingEnabled
{
  return self->_videoRecordingEnabled;
}

- (BOOL)customizationsEnabled
{
  return self->_customizationsEnabled;
}

- (BOOL)serialized
{
  return self->_serialized;
}

- (void)setSerialized:(BOOL)a3
{
  self->_serialized = a3;
}

- (NSString)screenShotKey
{
  return self->_screenShotKey;
}

- (int64_t)screenShotGesture
{
  return self->_screenShotGesture;
}

- (NSString)videoRecordingKey
{
  return self->_videoRecordingKey;
}

- (int64_t)videoRecordingGesture
{
  return self->_videoRecordingGesture;
}

- (int64_t)videoRecordingMode
{
  return self->_videoRecordingMode;
}

- (NSDictionary)general_gameIntentMappings
{
  return self->_general_gameIntentMappings;
}

- (BOOL)customized
{
  return self->_customized;
}

- (void)setCustomized:(BOOL)a3
{
  self->_customized = a3;
}

- (id)settingsChangedHandler
{
  return self->_settingsChangedHandler;
}

- (void)setSettingsChangedHandler:(id)a3
{
}

- (unint64_t)settingsID
{
  return self->_settingsID;
}

- (void)setSettingsID:(unint64_t)a3
{
  self->_unint64_t settingsID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_settingsChangedHandler, 0);
  objc_storeStrong((id *)&self->_general_gameIntentMappings, 0);
  objc_storeStrong((id *)&self->_videoRecordingKey, 0);
  objc_storeStrong((id *)&self->_screenShotKey, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_replayKitGestureSettings, 0);
  objc_storeStrong((id *)&self->_observedKeyPaths, 0);
  objc_storeStrong((id *)&self->_elementSettings, 0);
  objc_storeStrong((id *)&self->_customizedUUID, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_customizedElementSettings, 0);
  objc_storeStrong((id *)&self->__elementMappingFromUserDefaults, 0);
  objc_storeStrong((id *)&self->_elementMappings, 0);
  objc_storeStrong((id *)&self->_elementMappingKeyToElement, 0);

  objc_storeStrong((id *)&self->_defaults, 0);
}

- (void)observeDefaultsKeyPath:(uint64_t)a3 options:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)deleteObjectForKey:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_220998000, log, OS_LOG_TYPE_ERROR, "%@ - attempting to delete %@ from disk, but it doesn't exist!", (uint8_t *)&v3, 0x16u);
}

@end