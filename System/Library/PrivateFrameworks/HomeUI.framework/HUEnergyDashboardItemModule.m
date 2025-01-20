@interface HUEnergyDashboardItemModule
- (HUEnergyDashboardItemModule)initWithItemUpdater:(id)a3;
- (HUEnergyDashboardItemModule)initWithItemUpdater:(id)a3 dashboardContext:(id)a4 home:(id)a5;
- (id)buildItemProviders;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (void)reset;
@end

@implementation HUEnergyDashboardItemModule

- (HUEnergyDashboardItemModule)initWithItemUpdater:(id)a3 dashboardContext:(id)a4 home:(id)a5
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___HUEnergyDashboardItemModule_dashboardContext) = (Class)a4;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___HUEnergyDashboardItemModule_home) = (Class)a5;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for EnergyDashboardItemModule();
  id v8 = a4;
  id v9 = a5;
  return [(HFItemModule *)&v11 initWithItemUpdater:a3];
}

- (id)buildItemProviders
{
  v2 = self;
  uint64_t v3 = sub_1BE48D770();

  if (v3)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA45750);
    sub_1BE3A271C();
    v4 = (void *)sub_1BE9C4E58();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  sub_1BE37E9E8(0, (unint64_t *)&qword_1EBA46790);
  sub_1BE3A253C();
  sub_1BE9C4E88();
  v4 = self;
  sub_1BE48DCE4();

  swift_bridgeObjectRelease();
  sub_1BE37E9E8(0, (unint64_t *)&unk_1EBA45730);
  v5 = (void *)sub_1BE9C4BF8();
  swift_bridgeObjectRelease();

  return v5;
}

- (void)reset
{
  v2 = self;
  sub_1BE48DFEC();
}

- (HUEnergyDashboardItemModule)initWithItemUpdater:(id)a3
{
  swift_unknownObjectRetain();
  result = (HUEnergyDashboardItemModule *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___HUEnergyDashboardItemModule_home);
}

@end