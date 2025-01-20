@interface CRSUIMutableApplicationSceneSettings
- (NSNumber)frameRateLimit;
- (double)bannerHeight;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)mapStyle;
- (void)setBannerHeight:(double)a3;
- (void)setFrameRateLimit:(id)a3;
- (void)setMapStyle:(int64_t)a3;
@end

@implementation CRSUIMutableApplicationSceneSettings

- (void)setBannerHeight:(double)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  v4 = [NSNumber numberWithDouble:a3];
  [v5 setObject:v4 forSetting:3152422720];
}

- (double)bannerHeight
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:3152422720];

  [v3 floatValue];
  double v5 = v4;

  return v5;
}

- (void)setFrameRateLimit:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  [v5 setObject:v4 forSetting:3152422722];
}

- (NSNumber)frameRateLimit
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:3152422722];

  return (NSNumber *)v3;
}

- (void)setMapStyle:(int64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  id v4 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v4 forSetting:3152422721];
}

- (int64_t)mapStyle
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:3152422721];

  int64_t v4 = [v3 integerValue];
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v4 = +[CRSUIApplicationSceneSettings allocWithZone:a3];
  return [(FBSSettings *)v4 initWithSettings:self];
}

@end