@interface BLSHBacklightSceneClientSettingsDiffInspector
- ($7D24B5AD5894795FD85A0EE1D817D743)inspectDiff:(id)a3;
- (BLSHBacklightSceneClientSettingsDiffInspector)init;
@end

@implementation BLSHBacklightSceneClientSettingsDiffInspector

- ($7D24B5AD5894795FD85A0EE1D817D743)inspectDiff:(id)a3
{
  unsigned __int8 v4 = 0;
  [(FBSSettingsDiffInspector *)self inspectDiff:a3 withContext:&v4];
  return ($7D24B5AD5894795FD85A0EE1D817D743)v4;
}

- (BLSHBacklightSceneClientSettingsDiffInspector)init
{
  v5.receiver = self;
  v5.super_class = (Class)BLSHBacklightSceneClientSettingsDiffInspector;
  v2 = [(FBSSceneClientSettingsDiffInspector *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(FBSSettingsDiffInspector *)v2 observeOtherSetting:200000 withBlock:&__block_literal_global_18];
    [(FBSSettingsDiffInspector *)v3 observeOtherSetting:200001 withBlock:&__block_literal_global_2];
  }
  return v3;
}

void __53__BLSHBacklightSceneClientSettingsDiffInspector_init__block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  *a3 |= 1u;
}

void __53__BLSHBacklightSceneClientSettingsDiffInspector_init__block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  *a3 |= 2u;
}

@end