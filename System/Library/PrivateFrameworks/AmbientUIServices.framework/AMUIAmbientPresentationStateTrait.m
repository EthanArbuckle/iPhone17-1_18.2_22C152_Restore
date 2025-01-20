@interface AMUIAmbientPresentationStateTrait
+ (NSString)identifier;
+ (int64_t)defaultValue;
@end

@implementation AMUIAmbientPresentationStateTrait

+ (int64_t)defaultValue
{
  return 0;
}

+ (NSString)identifier
{
  return (NSString *)@"com.apple.ambient.AmbientPresentationTrait";
}

@end