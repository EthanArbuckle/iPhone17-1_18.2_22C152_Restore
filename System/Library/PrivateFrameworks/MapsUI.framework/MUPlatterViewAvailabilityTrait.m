@interface MUPlatterViewAvailabilityTrait
+ (NSString)identifier;
+ (NSString)name;
+ (int64_t)defaultValue;
@end

@implementation MUPlatterViewAvailabilityTrait

+ (int64_t)defaultValue
{
  return 0;
}

+ (NSString)identifier
{
  return (NSString *)@"com.apple.MapsUI.MUPlatterViewAvailability";
}

+ (NSString)name
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end