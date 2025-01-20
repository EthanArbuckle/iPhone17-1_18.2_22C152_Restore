@interface HDWorkoutBuilderStatisticsCalculatorEntity
+ (Class)ownerEntityClass;
+ (id)databaseTable;
+ (id)ownerEntityReferenceColumn;
+ (int64_t)protectionClass;
@end

@implementation HDWorkoutBuilderStatisticsCalculatorEntity

+ (id)databaseTable
{
  return @"workout_builder_statistics";
}

+ (Class)ownerEntityClass
{
  return (Class)objc_opt_class();
}

+ (id)ownerEntityReferenceColumn
{
  return (id)*MEMORY[0x1E4F65C70];
}

+ (int64_t)protectionClass
{
  return 1;
}

@end