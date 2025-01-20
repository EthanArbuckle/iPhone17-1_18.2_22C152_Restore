@interface UVPreviewSceneSettings
- (id)copyRemovingTargetOfEventDeferringEnvironments;
@end

@implementation UVPreviewSceneSettings

- (id)copyRemovingTargetOfEventDeferringEnvironments
{
  id v2 = [(UVPreviewSceneSettings *)self mutableCopy];
  [v2 setTargetOfEventDeferringEnvironments:0];
  id v3 = [v2 copy];

  return v3;
}

@end