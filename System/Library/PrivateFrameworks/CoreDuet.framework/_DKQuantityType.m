@interface _DKQuantityType
+ (Class)associatedObjectClass;
@end

@implementation _DKQuantityType

+ (Class)associatedObjectClass
{
  return (Class)objc_opt_class();
}

@end