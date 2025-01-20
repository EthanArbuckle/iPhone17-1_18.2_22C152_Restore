@interface WOWorkoutManagedConfigurationEntity
+ (BOOL)isPropertyFatal:(id)a3 version:(int64_t)a4;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)dateProperties;
+ (id)propertyForManagedSourceIdentifier;
+ (id)stringProperties;
+ (id)tableName;
+ (unint64_t)persistenceType;
@end

@implementation WOWorkoutManagedConfigurationEntity

+ (id)propertyForManagedSourceIdentifier
{
  return @"managed_source_identifier";
}

+ (id)stringProperties
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___WOWorkoutManagedConfigurationEntity;
  v2 = objc_msgSendSuper2(&v6, "stringProperties");
  CFStringRef v7 = @"managed_source_identifier";
  v3 = +[NSArray arrayWithObjects:&v7 count:1];
  v4 = [v2 arrayByAddingObjectsFromArray:v3];

  return v4;
}

+ (id)dateProperties
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___WOWorkoutManagedConfigurationEntity;
  v2 = objc_msgSendSuper2(&v6, "dateProperties");
  v7[0] = @"managed_source_scheduled_date";
  v7[1] = @"managed_source_completed_date";
  v3 = +[NSArray arrayWithObjects:v7 count:2];
  v4 = [v2 arrayByAddingObjectsFromArray:v3];

  return v4;
}

+ (id)tableName
{
  return @"workout_managed_configurations";
}

+ (unint64_t)persistenceType
{
  return 3;
}

+ (BOOL)isPropertyFatal:(id)a3 version:(int64_t)a4
{
  id v6 = a3;
  if (([v6 isEqualToString:@"managed_source_scheduled_date"] & 1) != 0
    || ([v6 isEqualToString:@"managed_source_completed_date"] & 1) != 0)
  {
    unsigned __int8 v7 = 0;
  }
  else
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS___WOWorkoutManagedConfigurationEntity;
    unsigned __int8 v7 = objc_msgSendSuper2(&v9, "isPropertyFatal:version:", v6, a4);
  }

  return v7;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 18;
  return (const $626EC8B4BFAC9ABCADBBA632C3E03ACD *)off_14840;
}

@end