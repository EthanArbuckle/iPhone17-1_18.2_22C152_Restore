@interface BLSPauseWhenSceneBackgroundAttribute
+ (id)pauseWhenBackgroundFBSScene:(id)a3;
+ (id)pauseWhenBackgroundForFBSSceneIdentityToken:(id)a3;
- (BOOL)canBePaused;
@end

@implementation BLSPauseWhenSceneBackgroundAttribute

+ (id)pauseWhenBackgroundFBSScene:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithFBSScene:v4];

  return v5;
}

+ (id)pauseWhenBackgroundForFBSSceneIdentityToken:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithSceneIdentityToken:v4];

  return v5;
}

- (BOOL)canBePaused
{
  return 0;
}

@end