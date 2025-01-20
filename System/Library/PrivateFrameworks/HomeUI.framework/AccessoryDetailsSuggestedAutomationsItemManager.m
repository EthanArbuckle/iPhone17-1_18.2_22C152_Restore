@interface AccessoryDetailsSuggestedAutomationsItemManager
- (_TtC6HomeUI47AccessoryDetailsSuggestedAutomationsItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (id)_buildItemModulesForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_itemsToHideInSet:(id)a3;
@end

@implementation AccessoryDetailsSuggestedAutomationsItemManager

- (id)_buildItemModulesForHome:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BE57E5F0();

  sub_1BE37E9E8(0, (unint64_t *)&qword_1EBA45720);
  v6 = (void *)sub_1BE9C4BF8();
  swift_bridgeObjectRelease();

  return v6;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  sub_1BE37E9E8(0, (unint64_t *)&qword_1EBA46790);
  sub_1BE3A253C();
  sub_1BE9C4E88();
  id v4 = self;
  sub_1BE57DB10();

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
  uint64_t v4 = sub_1BE9C4E88();
  v5 = self;
  sub_1BE57DF1C(v4);

  swift_bridgeObjectRelease();
  v6 = (void *)sub_1BE9C4E58();
  swift_bridgeObjectRelease();

  return v6;
}

- (_TtC6HomeUI47AccessoryDetailsSuggestedAutomationsItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  swift_unknownObjectRetain();
  id v5 = a4;
  result = (_TtC6HomeUI47AccessoryDetailsSuggestedAutomationsItemManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI47AccessoryDetailsSuggestedAutomationsItemManager_triggerModule));
}

@end