@interface UIScene(GameControllerSceneComponent)
- (GCSceneComponent)_gameControllerSceneComponent;
@end

@implementation UIScene(GameControllerSceneComponent)

- (GCSceneComponent)_gameControllerSceneComponent
{
  v2 = [a1 _sceneComponentForKey:@"com.apple.gamecontroller.scenecomponent"];
  if (!v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v2 = [[GCSceneComponent alloc] initWithScene:a1];
      [a1 _registerSceneComponent:v2 forKey:@"com.apple.gamecontroller.scenecomponent"];
    }
    else
    {
      v2 = 0;
    }
  }

  return v2;
}

@end