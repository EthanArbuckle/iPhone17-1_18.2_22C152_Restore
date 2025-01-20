@interface NSCKRecordZoneQueryCursorTransformer
+ (Class)transformedValueClass;
+ (id)allowedTopLevelClasses;
@end

@implementation NSCKRecordZoneQueryCursorTransformer

+ (id)allowedTopLevelClasses
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSCKRecordZoneQueryCursorTransformer;
  id v2 = objc_msgSendSuper2(&v4, sel_allowedTopLevelClasses);
  getCloudKitCKQueryCursorClass[0]();
  return (id)[v2 arrayByAddingObject:objc_opt_class()];
}

+ (Class)transformedValueClass
{
  getCloudKitCKQueryCursorClass[0]();

  return (Class)objc_opt_class();
}

@end