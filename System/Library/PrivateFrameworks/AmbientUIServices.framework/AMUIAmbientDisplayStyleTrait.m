@interface AMUIAmbientDisplayStyleTrait
+ (NSString)identifier;
+ (int64_t)defaultValue;
@end

@implementation AMUIAmbientDisplayStyleTrait

+ (int64_t)defaultValue
{
  return 0;
}

+ (NSString)identifier
{
  return (NSString *)@"com.apple.ambient.AmbientDisplayStyleTrait";
}

@end