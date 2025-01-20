@interface _DKIdentifierType
+ (Class)associatedObjectClass;
@end

@implementation _DKIdentifierType

+ (Class)associatedObjectClass
{
  return (Class)objc_opt_class();
}

@end