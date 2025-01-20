@interface HDWorkoutSessionEventEntity
+ (Class)ownerEntityClass;
+ (Class)workoutEventClass;
+ (id)databaseTable;
+ (id)ownerEntityReferenceColumn;
+ (int64_t)protectionClass;
@end

@implementation HDWorkoutSessionEventEntity

+ (id)databaseTable
{
  return @"workout_session_events";
}

+ (int64_t)protectionClass
{
  return 1;
}

+ (Class)ownerEntityClass
{
  return (Class)objc_opt_class();
}

+ (id)ownerEntityReferenceColumn
{
  return (id)*MEMORY[0x1E4F65C70];
}

+ (Class)workoutEventClass
{
  return (Class)objc_opt_class();
}

@end