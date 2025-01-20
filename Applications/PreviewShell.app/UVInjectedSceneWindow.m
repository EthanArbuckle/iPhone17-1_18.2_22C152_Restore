@interface UVInjectedSceneWindow
- (BOOL)mrui_wantsWindowLayerSeparation;
@end

@implementation UVInjectedSceneWindow

- (BOOL)mrui_wantsWindowLayerSeparation
{
  return 0;
}

@end