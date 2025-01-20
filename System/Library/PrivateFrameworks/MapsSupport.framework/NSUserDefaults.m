@interface NSUserDefaults
+ (id)__maps_groupUserDefaults;
@end

@implementation NSUserDefaults

+ (id)__maps_groupUserDefaults
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"group.com.apple.Maps"];

  return v2;
}

@end