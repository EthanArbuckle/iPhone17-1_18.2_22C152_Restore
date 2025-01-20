@interface NTKParmesanUpgradeManager
- (BOOL)canUpgradeFace;
- (NTKParmesanUpgradeManager)init;
- (NTKParmesanUpgradeManager)initWithFace:(id)a3 forDevice:(id)a4;
- (id)upgradeFlowViewControllerWithDelegate:(id)a3;
- (int64_t)upgradingFaceIndex;
- (void)setUpgradingFaceIndex:(int64_t)a3;
- (void)upgradeFaceWithCompletion:(id)a3;
@end

@implementation NTKParmesanUpgradeManager

- (int64_t)upgradingFaceIndex
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanUpgradeManager_upgradingFaceIndex);
}

- (void)setUpgradingFaceIndex:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanUpgradeManager_upgradingFaceIndex) = (Class)a3;
}

- (NTKParmesanUpgradeManager)initWithFace:(id)a3 forDevice:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (NTKParmesanUpgradeManager *)sub_246BA7688(v5, v6);

  return v7;
}

- (BOOL)canUpgradeFace
{
  v2 = self;
  char v3 = sub_246B9A7F4();

  return v3 & 1;
}

- (void)upgradeFaceWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  id v5 = self;
  sub_246BA9E5C((char *)v5, (void (**)(void, void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (id)upgradeFlowViewControllerWithDelegate:(id)a3
{
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanUpgradeManager_sourceFace);
  id v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanUpgradeManager_device);
  id v6 = objc_allocWithZone((Class)type metadata accessor for ParmesanUpgradeOptInViewController());
  v7 = self;
  swift_unknownObjectRetain();
  id v8 = sub_246C1ED78(v4, v5, v7);
  swift_unknownObjectWeakAssign();
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F829B8]), sel_initWithRootViewController_, v8);
  swift_unknownObjectRelease();

  return v9;
}

- (NTKParmesanUpgradeManager)init
{
  result = (NTKParmesanUpgradeManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  char v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanUpgradeManager_memoryShuffle);
}

@end