@interface CRSUIMutableTemplateInstrumentClusterSceneSettings
- (NSString)description;
- (NSString)proxiedApplicationBundleIdentifier;
- (OS_xpc_object)templateEndpoint;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setProxiedApplicationBundleIdentifier:(id)a3;
- (void)setTemplateEndpoint:(id)a3;
@end

@implementation CRSUIMutableTemplateInstrumentClusterSceneSettings

- (NSString)proxiedApplicationBundleIdentifier
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:4293273413];

  return (NSString *)v3;
}

- (void)setProxiedApplicationBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  [v5 setObject:v4 forSetting:4293273413];
}

- (OS_xpc_object)templateEndpoint
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:4293273414];

  return (OS_xpc_object *)v3;
}

- (void)setTemplateEndpoint:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  [v5 setObject:v4 forSetting:4293273414];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CRSUITemplateInstrumentClusterSceneSettings allocWithZone:a3];
  return [(FBSSettings *)v4 initWithSettings:self];
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CRSUIMutableTemplateInstrumentClusterSceneSettings;
  id v4 = [(CRSUIMutableInstrumentClusterSceneSettings *)&v8 description];
  id v5 = [(CRSUIMutableTemplateInstrumentClusterSceneSettings *)self proxiedApplicationBundleIdentifier];
  v6 = [v3 stringWithFormat:@"%@: proxied bundle identifier: %@", v4, v5];

  return (NSString *)v6;
}

@end