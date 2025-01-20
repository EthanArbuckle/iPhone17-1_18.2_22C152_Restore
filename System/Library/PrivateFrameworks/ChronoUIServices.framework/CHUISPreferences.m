@interface CHUISPreferences
+ (CHUISPreferences)sharedInstance;
- (BOOL)debugPrefersStaticSnapshots;
- (BOOL)debugSnapshotViewColoring;
- (BOOL)debugViewLabels;
- (BOOL)enableMemoryStressTestingWithGaspar;
- (BOOL)userWantsWidgetDataWhenPasscodeLocked;
- (CHUISPreferences)init;
- (NSString)widgetRenderer;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation CHUISPreferences

+ (CHUISPreferences)sharedInstance
{
  if (sharedInstance___once_0 != -1) {
    dispatch_once(&sharedInstance___once_0, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance___instance;

  return (CHUISPreferences *)v2;
}

void __34__CHUISPreferences_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(CHUISPreferences);
  v1 = (void *)sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v0;
}

- (CHUISPreferences)init
{
  v6.receiver = self;
  v6.super_class = (Class)CHUISPreferences;
  v2 = [(CHUISPreferences *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.chronod"];
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v3;

    v2->_enableMemoryStressTestingWithGaspar = [(NSUserDefaults *)v2->_defaults BOOLForKey:@"EnableMemoryStressTestingWithGaspar"];
    v2->_debugViewLabels = [(NSUserDefaults *)v2->_defaults BOOLForKey:@"EnableDebugLabels"];
    v2->_debugSnapshotViewColoring = [(NSUserDefaults *)v2->_defaults BOOLForKey:@"debugSnapshotViewClient"];
    v2->_debugPrefersStaticSnapshots = [(NSUserDefaults *)v2->_defaults BOOLForKey:@"debugPreferStaticClientSnapshots"];
    v2->_widgetRenderer = (NSString *)[(NSUserDefaults *)v2->_defaults stringForKey:@"widgetRenderer"];
    [(NSUserDefaults *)v2->_defaults registerDefaults:&unk_1F16048D8];
    v2->_userWantsWidgetDataWhenPasscodeLocked = [(NSUserDefaults *)v2->_defaults BOOLForKey:@"showComplicationDataWhenPasscodeLocked"];
    [(NSUserDefaults *)v2->_defaults addObserver:v2 forKeyPath:@"showComplicationDataWhenPasscodeLocked" options:1 context:@"_userWantsWidgetDataWhenPasscodeLocked"];
  }
  return v2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (a6 == @"_userWantsWidgetDataWhenPasscodeLocked"
    && ([v12 objectForKeyedSubscript:*MEMORY[0x1E4F284C0]],
        v14 = objc_claimAutoreleasedReturnValue(),
        int v15 = [v14 intValue],
        v14,
        v15 == 1))
  {
    v16 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
    self->_userWantsWidgetDataWhenPasscodeLocked = [v16 BOOLValue];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)CHUISPreferences;
    [(CHUISPreferences *)&v17 observeValueForKeyPath:v10 ofObject:v11 change:v13 context:a6];
  }
}

- (BOOL)enableMemoryStressTestingWithGaspar
{
  return self->_enableMemoryStressTestingWithGaspar;
}

- (BOOL)debugViewLabels
{
  return self->_debugViewLabels;
}

- (BOOL)debugSnapshotViewColoring
{
  return self->_debugSnapshotViewColoring;
}

- (BOOL)debugPrefersStaticSnapshots
{
  return self->_debugPrefersStaticSnapshots;
}

- (NSString)widgetRenderer
{
  return self->_widgetRenderer;
}

- (BOOL)userWantsWidgetDataWhenPasscodeLocked
{
  return self->_userWantsWidgetDataWhenPasscodeLocked;
}

- (void).cxx_destruct
{
}

@end