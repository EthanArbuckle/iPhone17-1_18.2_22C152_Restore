@interface NSUserDefaults
+ (id)appDefaults;
@end

@implementation NSUserDefaults

+ (id)appDefaults
{
  id v2 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [v2 initWithSuiteName:v3];

  if (v4)
  {
    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

@end