@interface FBSScene(BacklightServices)
- (id)backlightSceneEnvironment;
@end

@implementation FBSScene(BacklightServices)

- (id)backlightSceneEnvironment
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__FBSScene_BacklightServices__backlightSceneEnvironment__block_invoke;
  v3[3] = &unk_1E6107798;
  v3[4] = a1;
  v1 = [a1 backlightSceneEnvironmentWithCreationBlock:v3];

  return v1;
}

@end