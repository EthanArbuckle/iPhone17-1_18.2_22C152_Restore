@interface DashboardSectionListItemManager
- (HMHome)home;
- (_TtC6HomeUI31DashboardSectionListItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_itemsToHideInSet:(id)a3;
- (void)setHome:(id)a3;
@end

@implementation DashboardSectionListItemManager

- (HMHome)home
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DashboardSectionListItemManager();
  v2 = [(HFItemManager *)&v4 home];

  return v2;
}

- (void)setHome:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1BE44898C((uint64_t)a3);
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BE44798C(v4);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA45750);
  id v6 = (void *)sub_1BE9C4BF8();
  swift_bridgeObjectRelease();

  return v6;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  sub_1BE37E9E8(0, (unint64_t *)&qword_1EBA46790);
  sub_1BE3A253C();
  sub_1BE9C4E88();
  id v4 = self;
  sub_1BE4480E8();

  swift_bridgeObjectRelease();
  sub_1BE37E9E8(0, (unint64_t *)&unk_1EBA45730);
  v5 = (void *)sub_1BE9C4BF8();
  swift_bridgeObjectRelease();

  return v5;
}

- (id)_itemsToHideInSet:(id)a3
{
  sub_1BE37E9E8(0, (unint64_t *)&qword_1EBA46790);
  sub_1BE3A253C();
  sub_1BE9C4E88();
  id v4 = self;
  sub_1BE448304();

  swift_bridgeObjectRelease();
  v5 = (void *)sub_1BE9C4E58();
  swift_bridgeObjectRelease();

  return v5;
}

- (_TtC6HomeUI31DashboardSectionListItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  swift_unknownObjectRetain();
  id v5 = a4;
  result = (_TtC6HomeUI31DashboardSectionListItemManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI31DashboardSectionListItemManager_roomItemProvider));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI31DashboardSectionListItemManager_categoryItemProvider));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI31DashboardSectionListItemManager_staticItemProvider));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI31DashboardSectionListItemManager_sceneSectionItem));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI31DashboardSectionListItemManager_cameraSectionItem));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI31DashboardSectionListItemManager_favoriteSectionItem));

  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC6HomeUI31DashboardSectionListItemManager_reorderableSectionList);
}

@end