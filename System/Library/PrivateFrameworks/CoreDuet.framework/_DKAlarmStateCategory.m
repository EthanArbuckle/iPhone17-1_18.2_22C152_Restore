@interface _DKAlarmStateCategory
+ (id)firing;
+ (id)snoozed;
+ (id)stopped;
+ (id)type;
@end

@implementation _DKAlarmStateCategory

+ (id)type
{
  return +[_DKObjectType objectTypeFromClass:a1];
}

+ (id)firing
{
  v2 = [a1 type];
  v3 = +[_DKCategory categoryWithInteger:0 type:v2];

  return v3;
}

+ (id)stopped
{
  v2 = [a1 type];
  v3 = +[_DKCategory categoryWithInteger:1 type:v2];

  return v3;
}

+ (id)snoozed
{
  v2 = [a1 type];
  v3 = +[_DKCategory categoryWithInteger:2 type:v2];

  return v3;
}

@end