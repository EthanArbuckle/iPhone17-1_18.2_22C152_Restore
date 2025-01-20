@interface HPSHeadphoneManager
+ (NSDictionary)allDevicesEverConnected;
+ (id)sharedInstance;
+ (void)setAllDevicesEverConnected:(id)a3;
- (BOOL)allowReplayAccessory;
- (BOOL)isFeatureEnabled;
- (HPSHeadphoneManager)init;
- (NSHashTable)weakHashTbl;
- (NSUserDefaults)defaults;
- (id)weakHashTblCopy;
- (void)addDelegate:(id)a3;
- (void)addTopLevelEntryWithHpDevice:(id)a3;
- (void)removeTopLevelEntryWithHpDevice:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setWeakHashTbl:(id)a3;
- (void)updateHPSDevice:(id)a3;
- (void)updateTopLevelEntryWithHpDevice:(id)a3;
@end

@implementation HPSHeadphoneManager

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(HPSHeadphoneManager *)self weakHashTbl];
  [v5 addObject:v4];
}

- (NSHashTable)weakHashTbl
{
  return self->_weakHashTbl;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)sharedInstance__sharedInstance;

  return v2;
}

uint64_t __37__HPSHeadphoneManager_sharedInstance__block_invoke()
{
  sharedInstance__sharedInstance = objc_alloc_init(HPSHeadphoneManager);

  return MEMORY[0x1F41817F8]();
}

- (HPSHeadphoneManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)HPSHeadphoneManager;
  v2 = [(HPSHeadphoneManager *)&v9 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F65650] shared];
    [v3 setTopLevelUIHandler:v2];

    uint64_t v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    weakHashTbl = v2->_weakHashTbl;
    v2->_weakHashTbl = (NSHashTable *)v4;

    v2->_ffValue = _os_feature_enabled_impl();
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.settings.headphone.HeadphoneManager.Mock"];
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v6;
  }
  return v2;
}

- (BOOL)isFeatureEnabled
{
  return self->_ffValue;
}

- (BOOL)allowReplayAccessory
{
  if (!os_variant_has_internal_ui()) {
    return 0;
  }
  v3 = [(NSUserDefaults *)self->_defaults valueForKey:@"root"];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)updateHPSDevice:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = +[HPSHeadphoneManager allDevicesEverConnected];
  id v5 = [v3 address];
  uint64_t v6 = [v5 stringByReplacingOccurrencesOfString:@":" withString:@"-"];
  v7 = [v4 objectForKeyedSubscript:v6];

  if (([v7 hasBackend] & 1) == 0)
  {

    v8 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1E4BFE000, v8, OS_LOG_TYPE_DEFAULT, "Connected Headphones: updateHPSDevice device not conncted", (uint8_t *)&v12, 2u);
    }

    v7 = 0;
  }
  [v3 setHeadphoneDevice:v7];
  objc_super v9 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = +[HPSHeadphoneManager allDevicesEverConnected];
    v11 = [v3 headphoneDevice];
    int v12 = 138412802;
    v13 = v10;
    __int16 v14 = 2112;
    v15 = v7;
    __int16 v16 = 2112;
    v17 = v11;
    _os_log_impl(&dword_1E4BFE000, v9, OS_LOG_TYPE_DEFAULT, "Connected Headphones: updateHPSDevice %@ %@ %@", (uint8_t *)&v12, 0x20u);
  }
}

- (id)weakHashTblCopy
{
  v2 = (void *)[(NSHashTable *)self->_weakHashTbl copy];

  return v2;
}

- (void)setWeakHashTbl:(id)a3
{
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);

  objc_storeStrong((id *)&self->_weakHashTbl, 0);
}

+ (NSDictionary)allDevicesEverConnected
{
  if (qword_1EAE8E7E0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  sub_1E4CBEC80();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1E4CBF180();
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2;
}

+ (void)setAllDevicesEverConnected:(id)a3
{
  sub_1E4CBEC80();
  uint64_t v3 = sub_1E4CBF190();
  if (qword_1EAE8E7E0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  qword_1EAE900F8 = v3;
  swift_bridgeObjectRelease();
}

- (void)addTopLevelEntryWithHpDevice:(id)a3
{
  id v4 = a3;
  id v5 = self;
  HPSHeadphoneManager.addTopLevelEntry(hpDevice:)(v4);
}

- (void)updateTopLevelEntryWithHpDevice:(id)a3
{
  id v4 = a3;
  id v5 = self;
  HPSHeadphoneManager.updateTopLevelEntry(hpDevice:)(v4);
}

- (void)removeTopLevelEntryWithHpDevice:(id)a3
{
  id v4 = a3;
  id v5 = self;
  HPSHeadphoneManager.removeTopLevelEntry(hpDevice:)(v4);
}

@end