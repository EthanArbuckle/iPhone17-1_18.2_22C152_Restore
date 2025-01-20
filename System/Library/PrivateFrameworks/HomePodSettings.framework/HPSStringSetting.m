@interface HPSStringSetting
+ (Class)valueClass;
@end

@implementation HPSStringSetting

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

@end