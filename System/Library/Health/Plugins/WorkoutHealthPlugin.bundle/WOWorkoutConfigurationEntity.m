@interface WOWorkoutConfigurationEntity
+ (BOOL)isPropertyFatal:(id)a3 version:(int64_t)a4;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)dateProperties;
+ (id)integerProperties;
+ (id)propertyForConfigurationType;
+ (id)tableName;
+ (unint64_t)persistenceType;
@end

@implementation WOWorkoutConfigurationEntity

+ (id)propertyForConfigurationType
{
  return @"configuration_type";
}

+ (id)integerProperties
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___WOWorkoutConfigurationEntity;
  v2 = objc_msgSendSuper2(&v6, "integerProperties");
  v7[0] = @"configuration_type";
  v7[1] = @"goal_type";
  v7[2] = @"occurrence_count";
  v3 = +[NSArray arrayWithObjects:v7 count:3];
  v4 = [v2 arrayByAddingObjectsFromArray:v3];

  return v4;
}

+ (id)dateProperties
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___WOWorkoutConfigurationEntity;
  v2 = objc_msgSendSuper2(&v6, "dateProperties");
  v7[0] = @"occurrence_count_modification_date";
  v7[1] = @"occurrence_creation_date";
  v7[2] = @"occurrence_modification_date";
  v3 = +[NSArray arrayWithObjects:v7 count:3];
  v4 = [v2 arrayByAddingObjectsFromArray:v3];

  return v4;
}

+ (id)tableName
{
  return @"workout_configurations";
}

+ (unint64_t)persistenceType
{
  return 2;
}

+ (BOOL)isPropertyFatal:(id)a3 version:(int64_t)a4
{
  id v4 = a3;
  if (([v4 isEqualToString:@"goal_type"] & 1) != 0
    || ([v4 isEqualToString:@"occurrence_count"] & 1) != 0
    || ([v4 isEqualToString:@"occurrence_count_modification_date"] & 1) != 0
    || ([v4 isEqualToString:@"occurrence_creation_date"] & 1) != 0)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    unsigned int v5 = [v4 isEqualToString:@"occurrence_modification_date"] ^ 1;
  }

  return v5;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 15;
  return (const $626EC8B4BFAC9ABCADBBA632C3E03ACD *)off_14C98;
}

@end