@interface ACCUserDefaults
+ (id)sharedDefaults;
+ (id)sharedDefaultsIapd;
+ (id)sharedDefaultsLogging;
- (ACCUserDefaults)init;
@end

@implementation ACCUserDefaults

- (ACCUserDefaults)init
{
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = NSStringFromSelector("sharedDefaults");
  v7 = NSStringFromSelector(a2);
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, @"Use +[%@ %@] instead of -%@.", v5, v6, v7);

  return 0;
}

+ (id)sharedDefaults
{
  if (sharedDefaults_once != -1) {
    dispatch_once(&sharedDefaults_once, &__block_literal_global_2);
  }
  v2 = (void *)sharedDefaults_sharedInstance;

  return v2;
}

void __33__ACCUserDefaults_sharedDefaults__block_invoke(id a1)
{
  sharedDefaults_sharedInstance = (uint64_t)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.CoreAccessories"];

  _objc_release_x1();
}

+ (id)sharedDefaultsIapd
{
  if (sharedDefaultsIapd_once != -1) {
    dispatch_once(&sharedDefaultsIapd_once, &__block_literal_global_274);
  }
  v2 = (void *)sharedDefaultsIapd_sharedInstance;

  return v2;
}

void __37__ACCUserDefaults_sharedDefaultsIapd__block_invoke(id a1)
{
  sharedDefaultsIapd_sharedInstance = (uint64_t)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.iapd"];

  _objc_release_x1();
}

+ (id)sharedDefaultsLogging
{
  if (sharedDefaultsLogging_once != -1) {
    dispatch_once(&sharedDefaultsLogging_once, &__block_literal_global_276);
  }
  v2 = (void *)sharedDefaultsLogging_sharedInstance;

  return v2;
}

void __40__ACCUserDefaults_sharedDefaultsLogging__block_invoke(id a1)
{
  sharedDefaultsLogging_sharedInstance = (uint64_t)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.logging"];

  _objc_release_x1();
}

@end