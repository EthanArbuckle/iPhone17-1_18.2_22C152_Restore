@interface _GCControllerInputParameters
+ (Class)viewClass;
@end

@implementation _GCControllerInputParameters

+ (Class)viewClass
{
  return (Class)objc_opt_class();
}

@end