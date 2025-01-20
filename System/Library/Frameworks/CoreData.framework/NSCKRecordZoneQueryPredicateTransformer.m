@interface NSCKRecordZoneQueryPredicateTransformer
+ (Class)transformedValueClass;
+ (id)allowedTopLevelClasses;
@end

@implementation NSCKRecordZoneQueryPredicateTransformer

+ (id)allowedTopLevelClasses
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSCKRecordZoneQueryPredicateTransformer;
  id v2 = objc_msgSendSuper2(&v4, sel_allowedTopLevelClasses);
  return (id)[v2 arrayByAddingObject:objc_opt_class()];
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

@end