@interface FBScene(InstrumentClusterSceneSettings)
- (void)updateClusterSceneSettingsWithBlock:()InstrumentClusterSceneSettings;
@end

@implementation FBScene(InstrumentClusterSceneSettings)

- (void)updateClusterSceneSettingsWithBlock:()InstrumentClusterSceneSettings
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __79__FBScene_InstrumentClusterSceneSettings__updateClusterSceneSettingsWithBlock___block_invoke;
    v6[3] = &unk_2643077E0;
    id v7 = v4;
    [a1 updateSettingsWithBlock:v6];
  }
}

@end