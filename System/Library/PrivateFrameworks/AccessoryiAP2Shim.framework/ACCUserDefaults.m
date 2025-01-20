@interface ACCUserDefaults
+ (id)sharedDefaults;
+ (id)sharedDefaultsIapd;
+ (id)sharedDefaultsLogging;
- (ACCUserDefaults)init;
@end

@implementation ACCUserDefaults

- (ACCUserDefaults)init
{
  v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF498];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = NSStringFromSelector(sel_sharedDefaults);
  v9 = NSStringFromSelector(a2);
  [v4 raise:v5, @"Use +[%@ %@] instead of -%@.", v7, v8, v9 format];

  return 0;
}

+ (id)sharedDefaults
{
  if (sharedDefaults_once != -1) {
    dispatch_once(&sharedDefaults_once, &__block_literal_global_1);
  }
  v2 = (void *)sharedDefaults_sharedInstance;
  return v2;
}

uint64_t __33__ACCUserDefaults_sharedDefaults__block_invoke()
{
  sharedDefaults_sharedInstance = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.CoreAccessories"];
  return MEMORY[0x270F9A758]();
}

+ (id)sharedDefaultsIapd
{
  if (sharedDefaultsIapd_once != -1) {
    dispatch_once(&sharedDefaultsIapd_once, &__block_literal_global_274);
  }
  v2 = (void *)sharedDefaultsIapd_sharedInstance;
  return v2;
}

uint64_t __37__ACCUserDefaults_sharedDefaultsIapd__block_invoke()
{
  sharedDefaultsIapd_sharedInstance = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.iapd"];
  return MEMORY[0x270F9A758]();
}

+ (id)sharedDefaultsLogging
{
  if (sharedDefaultsLogging_once != -1) {
    dispatch_once(&sharedDefaultsLogging_once, &__block_literal_global_276);
  }
  v2 = (void *)sharedDefaultsLogging_sharedInstance;
  return v2;
}

uint64_t __40__ACCUserDefaults_sharedDefaultsLogging__block_invoke()
{
  sharedDefaultsLogging_sharedInstance = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.logging"];
  return MEMORY[0x270F9A758]();
}

@end