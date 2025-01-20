@interface ADSingleton
+ (id)sharedInstance;
@end

@implementation ADSingleton

+ (id)sharedInstance
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  [v2 raise:@"Call to unimplemented sharedInstance", @"%@ does not implement sharedInstance. Add the CREATE_SHARED_INSTANCE macro to the @implementation", v4 format];

  return 0;
}

@end