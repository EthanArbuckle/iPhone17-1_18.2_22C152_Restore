@interface HUDashboardTipModuleController
- (Class)collectionCellClassForItem:(id)a3;
- (HUDashboardTipModuleController)initWithModule:(id)a3;
- (id)collectionLayoutSectionForSectionWithIdentifier:(id)a3 layoutEnvironment:(id)a4;
- (void)configureCell:(id)a3 forItem:(id)a4;
@end

@implementation HUDashboardTipModuleController

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
  sub_1BE524D30(v6, v7);
}

- (id)collectionLayoutSectionForSectionWithIdentifier:(id)a3 layoutEnvironment:(id)a4
{
  swift_unknownObjectRetain();
  v5 = self;
  id v6 = sub_1BE5255F0();
  swift_unknownObjectRelease();

  return v6;
}

- (HUDashboardTipModuleController)initWithModule:(id)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___HUDashboardTipModuleController_tipView) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DashboardTipModuleController();
  return [(HUItemModuleController *)&v5 initWithModule:a3];
}

- (void).cxx_destruct
{
}

@end