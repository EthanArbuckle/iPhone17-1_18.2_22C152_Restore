@interface CRSUIInstrumentClusterSettingsDiffInspector
- (void)observeItemTypeWithBlock:(id)a3;
- (void)observeLayoutSpecificationWithBlock:(id)a3;
- (void)observeShowCompassWithBlock:(id)a3;
- (void)observeShowETAWithBlock:(id)a3;
- (void)observeShowSpeedLimitWithBlock:(id)a3;
@end

@implementation CRSUIInstrumentClusterSettingsDiffInspector

- (void)observeShowETAWithBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __71__CRSUIInstrumentClusterSettingsDiffInspector_observeShowETAWithBlock___block_invoke;
  v6[3] = &unk_264307840;
  id v7 = v4;
  id v5 = v4;
  [(FBSSettingsDiffInspector *)self observeOtherSetting:4293273412 withBlock:v6];
}

uint64_t __71__CRSUIInstrumentClusterSettingsDiffInspector_observeShowETAWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)observeShowCompassWithBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __75__CRSUIInstrumentClusterSettingsDiffInspector_observeShowCompassWithBlock___block_invoke;
  v6[3] = &unk_264307840;
  id v7 = v4;
  id v5 = v4;
  [(FBSSettingsDiffInspector *)self observeOtherSetting:4293273410 withBlock:v6];
}

uint64_t __75__CRSUIInstrumentClusterSettingsDiffInspector_observeShowCompassWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)observeShowSpeedLimitWithBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __78__CRSUIInstrumentClusterSettingsDiffInspector_observeShowSpeedLimitWithBlock___block_invoke;
  v6[3] = &unk_264307840;
  id v7 = v4;
  id v5 = v4;
  [(FBSSettingsDiffInspector *)self observeOtherSetting:4293273411 withBlock:v6];
}

uint64_t __78__CRSUIInstrumentClusterSettingsDiffInspector_observeShowSpeedLimitWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)observeItemTypeWithBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __72__CRSUIInstrumentClusterSettingsDiffInspector_observeItemTypeWithBlock___block_invoke;
  v6[3] = &unk_264307840;
  id v7 = v4;
  id v5 = v4;
  [(FBSSettingsDiffInspector *)self observeOtherSetting:4293273408 withBlock:v6];
}

uint64_t __72__CRSUIInstrumentClusterSettingsDiffInspector_observeItemTypeWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)observeLayoutSpecificationWithBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __83__CRSUIInstrumentClusterSettingsDiffInspector_observeLayoutSpecificationWithBlock___block_invoke;
  v6[3] = &unk_264307840;
  id v7 = v4;
  id v5 = v4;
  [(FBSSettingsDiffInspector *)self observeOtherSetting:4293273409 withBlock:v6];
}

uint64_t __83__CRSUIInstrumentClusterSettingsDiffInspector_observeLayoutSpecificationWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end