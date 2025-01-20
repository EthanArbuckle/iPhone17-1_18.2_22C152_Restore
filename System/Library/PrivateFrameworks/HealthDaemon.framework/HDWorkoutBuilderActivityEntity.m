@interface HDWorkoutBuilderActivityEntity
+ (BOOL)supportsNullableEndDate;
+ (Class)ownerEntityClass;
+ (id)_statisticsForWorkoutActivityWithPersistentId:(unint64_t)a3 workoutActivity:(id)a4 database:(id)a5 error:(id *)a6;
+ (id)databaseTable;
+ (int64_t)protectionClass;
@end

@implementation HDWorkoutBuilderActivityEntity

+ (id)databaseTable
{
  return @"workout_builder_activities";
}

+ (int64_t)protectionClass
{
  return 1;
}

+ (Class)ownerEntityClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsNullableEndDate
{
  return 1;
}

+ (id)_statisticsForWorkoutActivityWithPersistentId:(unint64_t)a3 workoutActivity:(id)a4 database:(id)a5 error:(id *)a6
{
  return 0;
}

@end