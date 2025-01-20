@interface AccessoryItemModule
- (_TtC6HomeUI19AccessoryItemModule)initWithItemUpdater:(id)a3;
- (id)buildItemProviders;
- (id)buildSectionsWithDisplayedItems:(id)a3;
@end

@implementation AccessoryItemModule

- (id)buildItemProviders
{
  v2 = self;
  uint64_t v3 = sub_1BE43D0BC();

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
  sub_1BE3A1734((unint64_t *)&qword_1EBA467A0, (unint64_t *)&qword_1EBA46790);
  uint64_t v4 = sub_1BE9C4E88();
  v5 = self;
  sub_1BE43D1F0(v4);

  swift_bridgeObjectRelease();
  sub_1BE37E9E8(0, (unint64_t *)&unk_1EBA45730);
  v6 = (void *)sub_1BE9C4BF8();
  swift_bridgeObjectRelease();

  return v6;
}

- (_TtC6HomeUI19AccessoryItemModule)initWithItemUpdater:(id)a3
{
  swift_unknownObjectRetain();
  result = (_TtC6HomeUI19AccessoryItemModule *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6HomeUI19AccessoryItemModule_itemProviderBlock);

  sub_1BE3B21C0(v3);
}

@end