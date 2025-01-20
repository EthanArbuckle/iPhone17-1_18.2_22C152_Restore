@interface _CRSCardServiceBundleManager
+ (Class)bundleClass;
@end

@implementation _CRSCardServiceBundleManager

+ (Class)bundleClass
{
  return (Class)objc_opt_class();
}

@end