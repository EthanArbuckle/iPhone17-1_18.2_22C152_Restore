@interface ContainedSpeakersItemManager
- (_TtC6HomeUI28ContainedSpeakersItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (id)_buildItemModulesForHome:(id)a3;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
@end

@implementation ContainedSpeakersItemManager

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BE44D740();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA45750);
  v6 = (void *)sub_1BE9C4BF8();
  swift_bridgeObjectRelease();

  return v6;
}

- (id)_buildItemModulesForHome:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BE44CEA8(v4);

  sub_1BE37E9E8(0, (unint64_t *)&qword_1EBA45720);
  v6 = (void *)sub_1BE9C4BF8();
  swift_bridgeObjectRelease();

  return v6;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  sub_1BE37E9E8(0, (unint64_t *)&qword_1EBA46790);
  sub_1BE3A1734((unint64_t *)&qword_1EBA467A0, (unint64_t *)&qword_1EBA46790);
  sub_1BE9C4E88();
  id v4 = self;
  sub_1BE44D038();

  swift_bridgeObjectRelease();
  sub_1BE37E9E8(0, (unint64_t *)&unk_1EBA45730);
  v5 = (void *)sub_1BE9C4BF8();
  swift_bridgeObjectRelease();

  return v5;
}

- (_TtC6HomeUI28ContainedSpeakersItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  swift_unknownObjectRetain();
  id v5 = a4;
  result = (_TtC6HomeUI28ContainedSpeakersItemManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI28ContainedSpeakersItemManager_accessoryElementItemModule));

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI28ContainedSpeakersItemManager_accessoryElementContext));

  swift_bridgeObjectRelease();
}

@end