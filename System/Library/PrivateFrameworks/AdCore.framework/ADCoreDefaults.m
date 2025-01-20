@interface ADCoreDefaults
+ (id)factoryDefaults;
+ (id)sharedInstance;
+ (void)addFactoryDefaults:(id)a3;
- (ADCoreDefaults)init;
- (BOOL)BOOLForKey:(id)a3;
- (BOOL)defaultIsSetForKey:(id)a3;
- (NSMutableDictionary)factoryDefaults;
- (__CFString)defaultsBundleID;
- (double)doubleForKey:(id)a3;
- (id)_defaultValueForKey:(id)a3 valueClass:(Class)a4;
- (id)arrayForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (int64_t)integerForKey:(id)a3;
- (void)_setDefaultValue:(id)a3 forKey:(id)a4;
- (void)setBool:(BOOL)a3 forKey:(id)a4;
- (void)setDefaultsBundleID:(__CFString *)a3;
- (void)setDouble:(double)a3 forKey:(id)a4;
- (void)setFactoryDefaults:(id)a3;
- (void)setInteger:(int64_t)a3 forKey:(id)a4;
@end

@implementation ADCoreDefaults

- (BOOL)BOOLForKey:(id)a3
{
  id v4 = a3;
  v5 = [(ADCoreDefaults *)self _defaultValueForKey:v4 valueClass:objc_opt_class()];

  char v6 = [v5 BOOLValue];
  return v6;
}

- (id)stringForKey:(id)a3
{
  id v4 = a3;
  v5 = [(ADCoreDefaults *)self _defaultValueForKey:v4 valueClass:objc_opt_class()];

  return v5;
}

- (id)_defaultValueForKey:(id)a3 valueClass:(Class)a4
{
  id v4 = (__CFString *)a3;
  v5 = +[ADCoreDefaults sharedInstance];
  char v6 = (void *)CFPreferencesCopyAppValue(v4, v5[2]);

  if (!v6)
  {
    v7 = +[ADCoreDefaults sharedInstance];
    char v6 = [v7[1] objectForKeyedSubscript:v4];
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    char v6 = 0;
  }

  return v6;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__ADCoreDefaults_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

void __32__ADCoreDefaults_sharedInstance__block_invoke(uint64_t a1)
{
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___ADCoreDefaults;
  uint64_t v1 = objc_msgSend(objc_msgSendSuper2(&v3, sel_allocWithZone_, 0), "init");
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v1;
}

- (ADCoreDefaults)init
{
  v22.receiver = self;
  v22.super_class = (Class)ADCoreDefaults;
  v2 = [(ADCoreDefaults *)&v22 init];
  if (v2)
  {
    uint64_t v3 = CPCopySharedResourcesPreferencesDomainForDomain();
    v2->_defaultsBundleID = (__CFString *)v3;
    if (!v3) {
      abort();
    }
    int out_token = 0;
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.adPlatforms.AdCoreNotificationQueue", 0);
    v5 = (void *)_AdCoreNotificationQueue;
    _AdCoreNotificationQueue = (uint64_t)v4;

    char v6 = _AdCoreNotificationQueue;
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __22__ADCoreDefaults_init__block_invoke;
    v19 = &unk_1E68A0D48;
    v7 = v2;
    v20 = v7;
    notify_register_dispatch("com.apple.iad.defaultsDidChange", &out_token, v6, &v16);
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v9 = v7[1];
    v7[1] = v8;

    objc_msgSend(v7[1], "setObject:forKeyedSubscript:", &unk_1F2715388, @"ServerRetryBackoffGain", v16, v17, v18, v19);
    [v7[1] setObject:&unk_1F2715680 forKeyedSubscript:@"LocationGridSpacing"];
    [v7[1] setObject:@"https://iadsdk.apple.com/adserver" forKeyedSubscript:@"AdServerURL"];
    [v7[1] setObject:@"https://cf.iadsdk.apple.com/adserver" forKeyedSubscript:@"ConfigurationAdServerURL"];
    [v7[1] setObject:@"https://ut.iadsdk.apple.com/adserver" forKeyedSubscript:@"TargetingAdServerURL"];
    [v7[1] setObject:&unk_1F27153A0 forKeyedSubscript:@"adprivacydSegmentInterval"];
    [v7[1] setObject:&unk_1F27153B8 forKeyedSubscript:@"adprivacydMaxSegmentSendInterval"];
    [v7[1] setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"StocksEnabled"];
    [v7[1] setObject:@"https://partiality.itunes.apple.com/WebObjects/MZPartiality.woa/wa/IAD/segment" forKeyedSubscript:@"partiality-segment"];
    [v7[1] setObject:@"https://partiality.itunes.apple.com/WebObjects/MZPartiality.woa/wa/IAD/optIn" forKeyedSubscript:@"partiality-opt-in"];
    [v7[1] setObject:@"https://partiality.itunes.apple.com/WebObjects/MZPartiality.woa/wa/IAD/optOut" forKeyedSubscript:@"partiality-opt-out"];
    int v10 = MGGetBoolAnswer();
    id v11 = v7[1];
    if (v10)
    {
      uint64_t v12 = MEMORY[0x1E4F1CC28];
      [v11 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"EnableRequestedTemplate"];
      [v7[1] setObject:@"http://vp25q03ad-app037.iad.apple.com:7888" forKeyedSubscript:@"contentProxyServerURL"];
      [v7[1] setObject:&stru_1F270BEE0 forKeyedSubscript:@"ToroAlgoID"];
      [v7[1] setObject:@"none" forKeyedSubscript:@"ToroRequestedText"];
      [v7[1] setObject:@"regular" forKeyedSubscript:@"ToroRequestedIcon"];
      [v7[1] setObject:@"regular" forKeyedSubscript:@"ToroTemplateType"];
      uint64_t v13 = MEMORY[0x1E4F1CC38];
      [v7[1] setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ToroTestClient"];
      [v7[1] setObject:v12 forKeyedSubscript:@"ForceNonAdLocale"];
      [v7[1] setObject:v12 forKeyedSubscript:@"ForceSegmentDataRetrieval"];
      [v7[1] setObject:v12 forKeyedSubscript:@"adprivacydSimulateCrashOnLateXPC"];
      [v7[1] setObject:&unk_1F27153D0 forKeyedSubscript:@"adprivacydLateXPCIntervalSeconds"];
      [v7[1] setObject:v12 forKeyedSubscript:@"iAdAttributionOverridesEnabled"];
      [v7[1] setObject:v12 forKeyedSubscript:@"iAdAttributionSendTrue"];
      [v7[1] setObject:v13 forKeyedSubscript:@"iAdAttributionSendClickTime"];
      [v7[1] setObject:&stru_1F270BEE0 forKeyedSubscript:@"AttributionClickTimeOverride"];
      [v7[1] setObject:v13 forKeyedSubscript:@"iAdAttributionSendMetadata"];
      [v7[1] setObject:&stru_1F270BEE0 forKeyedSubscript:@"AttributionClickMetadataOverride"];
      [v7[1] setObject:&stru_1F270BEE0 forKeyedSubscript:@"DeviceKnowledgeScheduleOverride"];
      v14 = @"adForceConsumerStatus";
    }
    else
    {
      [v11 setObject:@"https://iadsdk.apple.com/adserver" forKeyedSubscript:@"AdServerURL"];
      [v7[1] setObject:@"https://cf.iadsdk.apple.com/adserver" forKeyedSubscript:@"ConfigurationAdServerURL"];
      [v7[1] setObject:@"http://vp25q03ad-app037.iad.apple.com:7888" forKeyedSubscript:@"contentProxyServerURL"];
      [v7[1] setObject:&unk_1F2715690 forKeyedSubscript:@"AppDeveloperAdFillRate"];
      [v7[1] setObject:@"none" forKeyedSubscript:@"ToroRequestedText"];
      [v7[1] setObject:@"regular" forKeyedSubscript:@"ToroRequestedIcon"];
      [v7[1] setObject:@"regular" forKeyedSubscript:@"ToroTemplateType"];
      [v7[1] setObject:@"0" forKeyedSubscript:@"adprivacydSegmentIntervalOverride"];
      [v7[1] setObject:@"0" forKeyedSubscript:@"adprivacydMaxSegmentSendIntervalOverride"];
      v14 = @"iAdAttributionOverridesEnabled";
    }
    [v7[1] setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v14];
  }
  return v2;
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  char v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithBool:v4];
  [(ADCoreDefaults *)self _setDefaultValue:v8 forKey:v7];
}

- (void)_setDefaultValue:(id)a3 forKey:(id)a4
{
  v5 = (__CFString *)a4;
  id v6 = a3;
  id v7 = +[ADCoreDefaults sharedInstance];
  CFPreferencesSetAppValue(v5, v6, v7[2]);

  id v8 = +[ADCoreDefaults sharedInstance];
  CFPreferencesAppSynchronize(v8[2]);
}

uint64_t __22__ADCoreDefaults_init__block_invoke(uint64_t a1)
{
  CFStringRef v1 = (const __CFString *)[*(id *)(a1 + 32) defaultsBundleID];
  return CFPreferencesAppSynchronize(v1);
}

+ (void)addFactoryDefaults:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[ADCoreDefaults sharedInstance];
  [v4[1] addEntriesFromDictionary:v3];
}

+ (id)factoryDefaults
{
  v2 = +[ADCoreDefaults sharedInstance];
  id v3 = (void *)[v2[1] copy];

  return v3;
}

- (BOOL)defaultIsSetForKey:(id)a3
{
  id v3 = (__CFString *)a3;
  BOOL v4 = +[ADCoreDefaults sharedInstance];
  v5 = (void *)CFPreferencesCopyAppValue(v3, v4[2]);

  if (!v5)
  {
    id v6 = +[ADCoreDefaults sharedInstance];
    v5 = [v6[1] objectForKeyedSubscript:v3];
  }
  return v5 != 0;
}

- (int64_t)integerForKey:(id)a3
{
  id v4 = a3;
  v5 = [(ADCoreDefaults *)self _defaultValueForKey:v4 valueClass:objc_opt_class()];

  int64_t v6 = [v5 integerValue];
  return v6;
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4
{
  int64_t v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithInteger:a3];
  [(ADCoreDefaults *)self _setDefaultValue:v8 forKey:v7];
}

- (double)doubleForKey:(id)a3
{
  id v4 = a3;
  v5 = [(ADCoreDefaults *)self _defaultValueForKey:v4 valueClass:objc_opt_class()];

  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (void)setDouble:(double)a3 forKey:(id)a4
{
  double v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithDouble:a3];
  [(ADCoreDefaults *)self _setDefaultValue:v8 forKey:v7];
}

- (id)arrayForKey:(id)a3
{
  id v4 = a3;
  v5 = [(ADCoreDefaults *)self _defaultValueForKey:v4 valueClass:objc_opt_class()];

  return v5;
}

- (NSMutableDictionary)factoryDefaults
{
  return self->_factoryDefaults;
}

- (void)setFactoryDefaults:(id)a3
{
}

- (__CFString)defaultsBundleID
{
  return self->_defaultsBundleID;
}

- (void)setDefaultsBundleID:(__CFString *)a3
{
  self->_defaultsBundleID = a3;
}

- (void).cxx_destruct
{
}

@end