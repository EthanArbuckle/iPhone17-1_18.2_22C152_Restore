@interface CRSUIMutableTemplateDashboardWidgetSceneSettings
- (NSString)proxiedApplicationBundleIdentifier;
- (OS_xpc_object)templateEndpoint;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setProxiedApplicationBundleIdentifier:(id)a3;
- (void)setTemplateEndpoint:(id)a3;
@end

@implementation CRSUIMutableTemplateDashboardWidgetSceneSettings

- (NSString)proxiedApplicationBundleIdentifier
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:2883987267];

  return (NSString *)v3;
}

- (void)setProxiedApplicationBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  [v5 setObject:v4 forSetting:2883987267];
}

- (OS_xpc_object)templateEndpoint
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:2883987266];

  return (OS_xpc_object *)v3;
}

- (void)setTemplateEndpoint:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  [v5 setObject:v4 forSetting:2883987266];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CRSUITemplateDashboardWidgetSceneSettings allocWithZone:a3];
  return [(FBSSettings *)v4 initWithSettings:self];
}

@end