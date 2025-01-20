@interface BLSBacklightSceneSettingsDiffInspector
- ($A4FF59F43F4B20644E55A5E6B3BB4A05)inspectDiff:(id)a3;
- (BLSBacklightSceneSettingsDiffInspector)init;
@end

@implementation BLSBacklightSceneSettingsDiffInspector

- ($A4FF59F43F4B20644E55A5E6B3BB4A05)inspectDiff:(id)a3
{
  unsigned __int8 v4 = 0;
  [(FBSSettingsDiffInspector *)self inspectDiff:a3 withContext:&v4];
  return ($A4FF59F43F4B20644E55A5E6B3BB4A05)v4;
}

- (BLSBacklightSceneSettingsDiffInspector)init
{
  v5.receiver = self;
  v5.super_class = (Class)BLSBacklightSceneSettingsDiffInspector;
  v2 = [(FBSSceneSettingsDiffInspector *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(FBSSettingsDiffInspector *)v2 observeOtherSetting:200000 withBlock:&__block_literal_global_15];
    [(FBSSettingsDiffInspector *)v3 observeOtherSetting:200001 withBlock:&__block_literal_global_2];
    [(FBSSettingsDiffInspector *)v3 observeOtherSetting:200002 withBlock:&__block_literal_global_4_0];
    [(FBSSettingsDiffInspector *)v3 observeOtherSetting:200003 withBlock:&__block_literal_global_6];
    [(FBSSettingsDiffInspector *)v3 observeOtherSetting:200005 withBlock:&__block_literal_global_8];
  }
  return v3;
}

void __46__BLSBacklightSceneSettingsDiffInspector_init__block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  *a3 |= 3u;
}

void __46__BLSBacklightSceneSettingsDiffInspector_init__block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  *a3 |= 5u;
}

void __46__BLSBacklightSceneSettingsDiffInspector_init__block_invoke_3(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  *a3 |= 9u;
}

void __46__BLSBacklightSceneSettingsDiffInspector_init__block_invoke_4(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  *a3 |= 0x11u;
}

void __46__BLSBacklightSceneSettingsDiffInspector_init__block_invoke_5(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  *a3 |= 0x21u;
}

@end