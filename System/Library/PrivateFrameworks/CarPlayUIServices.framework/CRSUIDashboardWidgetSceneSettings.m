@interface CRSUIDashboardWidgetSceneSettings
- (NSNumber)frameRateLimit;
- (OS_xpc_object)endpoint;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)mapStyle;
- (unint64_t)widgetStyle;
@end

@implementation CRSUIDashboardWidgetSceneSettings

- (unint64_t)widgetStyle
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:2883987264];

  unint64_t v4 = [v3 unsignedIntegerValue];
  return v4;
}

- (OS_xpc_object)endpoint
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:2883987265];

  return (OS_xpc_object *)v3;
}

- (NSNumber)frameRateLimit
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:3152422722];

  return (NSNumber *)v3;
}

- (int64_t)mapStyle
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:3152422721];

  int64_t v4 = [v3 integerValue];
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  int64_t v4 = +[CRSUIMutableDashboardWidgetSceneSettings allocWithZone:a3];
  return [(FBSSettings *)v4 initWithSettings:self];
}

@end