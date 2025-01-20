@interface CLLocationManager
+ (id)inUseAssertionForNavd;
+ (id)navdLocationBundleSource;
@end

@implementation CLLocationManager

+ (id)navdLocationBundleSource
{
  return @"/System/Library/LocationBundles/NavdLocationBundleiOS.bundle";
}

+ (id)inUseAssertionForNavd
{
  v2 = +[CLLocationManager navdLocationBundleSource];
  id v3 = +[CLInUseAssertion newAssertionForBundleIdentifier:v2 withReason:@"Location in use in navd"];

  return v3;
}

@end