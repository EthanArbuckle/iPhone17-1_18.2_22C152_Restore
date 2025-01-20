@interface JFXMediaSettings
+ (CGSize)compositionSize;
+ (CGSize)frameSize;
+ (CGSize)renderSize;
+ (JFXMediaSettings)sharedInstance;
+ (JFXMediaSettingsProvider)providerDelegate;
+ (int)frameRate;
+ (int)timeScale;
+ (void)setProviderDelegate:(id)a3;
- (CGSize)compositionSize;
- (CGSize)frameSize;
- (CGSize)renderSize;
- (int)frameRate;
- (int)timeScale;
@end

@implementation JFXMediaSettings

+ (JFXMediaSettings)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1) {
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_29);
  }
  v2 = (void *)sharedInstance_s_sharedInstance_0;
  return (JFXMediaSettings *)v2;
}

uint64_t __34__JFXMediaSettings_sharedInstance__block_invoke()
{
  sharedInstance_s_sharedInstance_0 = objc_alloc_init(JFXMediaSettings);
  return MEMORY[0x270F9A758]();
}

+ (JFXMediaSettingsProvider)providerDelegate
{
  v2 = objc_opt_class();
  objc_sync_enter(v2);
  id v3 = (id)jfx_providerDelegate;
  objc_sync_exit(v2);

  return (JFXMediaSettingsProvider *)v3;
}

+ (void)setProviderDelegate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  v4 = (void *)jfx_providerDelegate;
  jfx_providerDelegate = (uint64_t)v3;

  objc_sync_exit(obj);
}

- (int)frameRate
{
  v2 = [(id)objc_opt_class() providerDelegate];
  int v3 = [v2 frameRate];

  return v3;
}

- (int)timeScale
{
  v2 = [(id)objc_opt_class() providerDelegate];
  int v3 = [v2 timeScale];

  return v3;
}

- (CGSize)renderSize
{
  v2 = [(id)objc_opt_class() providerDelegate];
  [v2 renderSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)compositionSize
{
  v2 = [(id)objc_opt_class() providerDelegate];
  [v2 compositionSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)frameSize
{
  v2 = [(id)objc_opt_class() providerDelegate];
  [v2 frameSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

+ (int)frameRate
{
  v2 = [a1 sharedInstance];
  int v3 = [v2 frameRate];

  return v3;
}

+ (int)timeScale
{
  v2 = [a1 sharedInstance];
  int v3 = [v2 timeScale];

  return v3;
}

+ (CGSize)frameSize
{
  v2 = [a1 sharedInstance];
  [v2 frameSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

+ (CGSize)renderSize
{
  v2 = [a1 sharedInstance];
  [v2 renderSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

+ (CGSize)compositionSize
{
  v2 = [a1 sharedInstance];
  [v2 compositionSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

@end