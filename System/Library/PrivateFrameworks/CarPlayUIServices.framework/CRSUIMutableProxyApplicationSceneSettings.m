@interface CRSUIMutableProxyApplicationSceneSettings
- (NSString)proxiedApplicationBundleIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)frameRateLimit;
- (int64_t)mapStyle;
- (void)setFrameRateLimit:(id)a3;
- (void)setMapStyle:(int64_t)a3;
- (void)setProxiedApplicationBundleIdentifier:(id)a3;
@end

@implementation CRSUIMutableProxyApplicationSceneSettings

- (NSString)proxiedApplicationBundleIdentifier
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:1885817706];

  return (NSString *)v3;
}

- (void)setProxiedApplicationBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v6 = [(FBSSettings *)self otherSettings];
  v5 = (void *)[v4 copy];

  [v6 setObject:v5 forSetting:1885817706];
}

- (int64_t)mapStyle
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:3152422721];

  int64_t v4 = [v3 integerValue];
  return v4;
}

- (void)setMapStyle:(int64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  int64_t v4 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v4 forSetting:3152422721];
}

- (id)frameRateLimit
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:3152422722];

  return v3;
}

- (void)setFrameRateLimit:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  [v5 setObject:v4 forSetting:3152422722];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CRSUIProxyApplicationSceneSettings allocWithZone:a3];
  return [(FBSSettings *)v4 initWithSettings:self];
}

@end