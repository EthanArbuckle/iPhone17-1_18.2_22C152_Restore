@interface CRSUITemplateInstrumentClusterSceneSettings
- (NSString)description;
- (NSString)proxiedApplicationBundleIdentifier;
- (OS_xpc_object)templateEndpoint;
- (id)mutableCopyWithZone:(_NSZone *)a3;
@end

@implementation CRSUITemplateInstrumentClusterSceneSettings

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = +[CRSUIMutableTemplateInstrumentClusterSceneSettings allocWithZone:a3];
  return [(FBSSettings *)v4 initWithSettings:self];
}

- (NSString)proxiedApplicationBundleIdentifier
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:4293273413];

  return (NSString *)v3;
}

- (OS_xpc_object)templateEndpoint
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:4293273414];

  return (OS_xpc_object *)v3;
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CRSUITemplateInstrumentClusterSceneSettings;
  v4 = [(CRSUIInstrumentClusterSceneSettings *)&v8 description];
  v5 = [(CRSUITemplateInstrumentClusterSceneSettings *)self proxiedApplicationBundleIdentifier];
  v6 = [v3 stringWithFormat:@"%@: proxied bundle identifier: %@", v4, v5];

  return (NSString *)v6;
}

@end