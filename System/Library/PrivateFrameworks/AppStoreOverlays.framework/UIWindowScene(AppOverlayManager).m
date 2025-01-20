@interface UIWindowScene(AppOverlayManager)
- (ASOOverlayManager)_aso_appOverlayManager;
@end

@implementation UIWindowScene(AppOverlayManager)

- (ASOOverlayManager)_aso_appOverlayManager
{
  v2 = [a1 _sceneComponentForKey:@"_ASOOverlayManagerWindowSceneComponentKey"];
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    v4 = [[ASOOverlayManager alloc] initWithWindowScene:a1];
    [a1 _registerSceneComponent:v4 forKey:@"_ASOOverlayManagerWindowSceneComponentKey"];
  }

  return v4;
}

@end