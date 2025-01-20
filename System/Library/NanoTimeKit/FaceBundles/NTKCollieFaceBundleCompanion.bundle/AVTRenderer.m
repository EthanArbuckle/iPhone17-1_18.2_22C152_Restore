@interface AVTRenderer
- (void)ntk_configureForFramingModeWatchFace;
@end

@implementation AVTRenderer

- (void)ntk_configureForFramingModeWatchFace
{
  id v6 = [(AVTRenderer *)self scene];
  v3 = [v6 rootNode];
  v4 = [v3 childNodeWithName:AVTFramingModeWatchFace recursively:1];

  v5 = [v4 camera];
  [v5 setXFov:0.0];

  [(AVTRenderer *)self setPointOfView:v4];
}

@end