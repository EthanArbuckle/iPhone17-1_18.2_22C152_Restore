@interface HUEnergyDashboardItemModuleController
- (Class)collectionCellClassForItem:(id)a3;
- (HUEnergyDashboardItemModuleController)initWithModule:(id)a3;
- (id)collectionLayoutSectionForSectionWithIdentifier:(id)a3 layoutEnvironment:(id)a4;
- (void)configureCell:(id)a3 forItem:(id)a4;
@end

@implementation HUEnergyDashboardItemModuleController

- (HUEnergyDashboardItemModuleController)initWithModule:(id)a3
{
  id v3 = a3;
  result = (HUEnergyDashboardItemModuleController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR___HUEnergyDashboardItemModuleController_delegate;

  sub_1BE37E904((uint64_t)v3);
}

- (Class)collectionCellClassForItem:(id)a3
{
  sub_1BE37E9E8(0, (unint64_t *)&unk_1EBA45440);

  return (Class)swift_getObjCClassFromMetadata();
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  _s6HomeUI35EnergyDashboardItemModuleControllerC13configureCell_3forySo016UICollectionViewI0C_So6HFItemCtF_0();
}

- (id)collectionLayoutSectionForSectionWithIdentifier:(id)a3 layoutEnvironment:(id)a4
{
  uint64_t v6 = sub_1BE9C49F8();
  uint64_t v8 = v7;
  swift_unknownObjectRetain();
  v9 = self;
  id v10 = EnergyDashboardItemModuleController.collectionLayoutSectionForSection(withIdentifier:layoutEnvironment:)(v6, v8, (uint64_t)a4);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();

  return v10;
}

@end