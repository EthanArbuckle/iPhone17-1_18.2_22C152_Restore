@interface PHSpringBoardPreferences
+ (id)sharedPreferences;
- (BOOL)isProximitySensorAvailable;
- (id)domain;
@end

@implementation PHSpringBoardPreferences

+ (id)sharedPreferences
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __45__PHSpringBoardPreferences_sharedPreferences__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedPreferences_onceToken != -1) {
    dispatch_once(&sharedPreferences_onceToken, block);
  }
  v2 = (void *)sharedPreferences_sPHSpringBoardPreferences;

  return v2;
}

uint64_t __45__PHSpringBoardPreferences_sharedPreferences__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedPreferences_sPHSpringBoardPreferences;
  sharedPreferences_sPHSpringBoardPreferences = (uint64_t)v1;

  return _objc_release_x1(v1, v2);
}

- (id)domain
{
  return @"com.apple.springboard";
}

- (BOOL)isProximitySensorAvailable
{
  return ![(PHPreferences *)self BOOLForKey:@"SBDisableProximity" defaultValue:0];
}

@end