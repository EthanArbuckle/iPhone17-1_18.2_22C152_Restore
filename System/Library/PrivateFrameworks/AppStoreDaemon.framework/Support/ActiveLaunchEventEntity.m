@interface ActiveLaunchEventEntity
+ (Class)memoryEntityClass;
+ (id)databaseTable;
+ (id)defaultProperties;
@end

@implementation ActiveLaunchEventEntity

+ (id)databaseTable
{
  return @"active_launch_events";
}

+ (id)defaultProperties
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___ActiveLaunchEventEntity;
  v2 = objc_msgSendSuper2(&v5, "defaultProperties");
  v3 = [v2 arrayByAddingObject:@"payload"];

  return v3;
}

+ (Class)memoryEntityClass
{
  return (Class)objc_opt_class();
}

@end