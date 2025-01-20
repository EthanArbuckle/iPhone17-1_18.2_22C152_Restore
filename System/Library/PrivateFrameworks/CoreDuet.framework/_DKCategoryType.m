@interface _DKCategoryType
+ (Class)associatedObjectClass;
@end

@implementation _DKCategoryType

+ (Class)associatedObjectClass
{
  return (Class)objc_opt_class();
}

@end