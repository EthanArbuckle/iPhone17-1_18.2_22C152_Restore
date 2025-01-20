@interface HUDashboardTipModule
- (HUDashboardTipModule)initWithContext:(id)a3 itemUpdater:(id)a4;
- (HUDashboardTipModule)initWithItemUpdater:(id)a3;
- (HUDashboardTipModule)initWithItemUpdater:(id)a3 descriptionText:(id)a4;
- (NSSet)itemProviders;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (void)setupTipsObserver;
@end

@implementation HUDashboardTipModule

- (HUDashboardTipModule)initWithContext:(id)a3 itemUpdater:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  return (HUDashboardTipModule *)DashboardTipModule.init(context:itemUpdater:)(v5, (uint64_t)a4);
}

- (HUDashboardTipModule)initWithItemUpdater:(id)a3 descriptionText:(id)a4
{
}

- (NSSet)itemProviders
{
  v2 = self;
  sub_1BE4C03B8();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA45750);
  sub_1BE3C9854((unint64_t *)&qword_1EBA45760, (uint64_t *)&unk_1EBA45750);
  v3 = (void *)sub_1BE9C4E58();
  swift_bridgeObjectRelease();

  return (NSSet *)v3;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  sub_1BE37E9E8(0, (unint64_t *)&qword_1EBA46790);
  sub_1BE3A253C();
  sub_1BE9C4E88();
  v4 = self;
  sub_1BE4C04F8();

  swift_bridgeObjectRelease();
  sub_1BE37E9E8(0, (unint64_t *)&unk_1EBA45730);
  id v5 = (void *)sub_1BE9C4BF8();
  swift_bridgeObjectRelease();

  return v5;
}

- (HUDashboardTipModule)initWithItemUpdater:(id)a3
{
  swift_unknownObjectRetain();
  result = (HUDashboardTipModule *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_1BE39DA0C((uint64_t)self + OBJC_IVAR___HUDashboardTipModule_eligibleTip, &qword_1EBA45378);
}

- (void)setupTipsObserver
{
  v2 = self;
  sub_1BE4C0970();
}

@end