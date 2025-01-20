@interface DashboardFilterBarItemManager
- (_TtC6HomeUI29DashboardFilterBarItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (void)dealloc;
- (void)executionEnvironmentDidBecomeActive:(id)a3;
- (void)homeDidUpdateHomeEnergyManagerEnabled:(id)a3;
- (void)homeKitDispatcher:(id)a3 manager:(id)a4 didChangeHome:(id)a5;
@end

@implementation DashboardFilterBarItemManager

- (_TtC6HomeUI29DashboardFilterBarItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  return (_TtC6HomeUI29DashboardFilterBarItemManager *)sub_1BE41B588((uint64_t)a3, a4);
}

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_sharedInstance);
  objc_msgSend(v5, sel_removeObserver_, v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for DashboardFilterBarItemManager();
  [(HFItemManager *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI29DashboardFilterBarItemManager_categoryItemProvider));
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC6HomeUI29DashboardFilterBarItemManager_actionSetItemProvider);
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1BE41BC80((uint64_t)v4);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA45750);
  objc_super v6 = (void *)sub_1BE9C4BF8();
  swift_bridgeObjectRelease();

  return v6;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  sub_1BE37E9E8(0, (unint64_t *)&qword_1EBA46790);
  sub_1BE3A1734((unint64_t *)&qword_1EBA467A0, (unint64_t *)&qword_1EBA46790);
  sub_1BE9C4E88();
  id v4 = self;
  sub_1BE41BDEC();

  swift_bridgeObjectRelease();
  sub_1BE37E9E8(0, (unint64_t *)&unk_1EBA45730);
  id v5 = (void *)sub_1BE9C4BF8();
  swift_bridgeObjectRelease();

  return v5;
}

- (void)homeKitDispatcher:(id)a3 manager:(id)a4 didChangeHome:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1BE41C290((uint64_t)v8, (uint64_t)v9, (uint64_t)a5);
}

- (void)homeDidUpdateHomeEnergyManagerEnabled:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1BE41E524();
}

- (void)executionEnvironmentDidBecomeActive:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1BE41C6B0((uint64_t)v4);
}

@end