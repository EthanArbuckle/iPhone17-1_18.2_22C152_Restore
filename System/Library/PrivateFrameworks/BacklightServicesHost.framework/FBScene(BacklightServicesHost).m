@interface FBScene(BacklightServicesHost)
- (BLSHBacklightFBSceneHostEnvironment)backlightSceneHostEnvironment;
- (id)existingBacklightSceneHostEnvironment;
@end

@implementation FBScene(BacklightServicesHost)

- (BLSHBacklightFBSceneHostEnvironment)backlightSceneHostEnvironment
{
  id v1 = a1;
  objc_sync_enter(v1);
  objc_getAssociatedObject(v1, sel_backlightSceneHostEnvironment);
  v2 = (BLSHBacklightFBSceneHostEnvironment *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = [[BLSHBacklightFBSceneHostEnvironment alloc] initWithFBScene:v1];
    objc_setAssociatedObject(v1, sel_backlightSceneHostEnvironment, v2, (void *)0x301);
  }
  objc_sync_exit(v1);

  return v2;
}

- (id)existingBacklightSceneHostEnvironment
{
  id v1 = a1;
  objc_sync_enter(v1);
  v2 = objc_getAssociatedObject(v1, sel_backlightSceneHostEnvironment);
  objc_sync_exit(v1);

  return v2;
}

@end