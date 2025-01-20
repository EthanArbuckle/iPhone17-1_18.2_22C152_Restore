@interface _DKAudioRouteCategory
+ (id)external;
+ (id)internal;
+ (id)type;
@end

@implementation _DKAudioRouteCategory

+ (id)type
{
  return +[_DKObjectType objectTypeFromClass:a1];
}

+ (id)internal
{
  v2 = [a1 type];
  v3 = +[_DKCategory categoryWithInteger:0 type:v2];

  return v3;
}

+ (id)external
{
  v2 = [a1 type];
  v3 = +[_DKCategory categoryWithInteger:1 type:v2];

  return v3;
}

@end