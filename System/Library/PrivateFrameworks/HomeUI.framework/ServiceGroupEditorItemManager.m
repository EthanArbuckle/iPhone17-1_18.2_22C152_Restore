@interface ServiceGroupEditorItemManager
- (_TtC6HomeUI29ServiceGroupEditorItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (id)_buildItemModulesForHome:(id)a3;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_homeFuture;
@end

@implementation ServiceGroupEditorItemManager

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BE5B38F8();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA45750);
  v6 = (void *)sub_1BE9C4BF8();
  swift_bridgeObjectRelease();

  return v6;
}

- (id)_buildItemModulesForHome:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BE5B2AC4(v4);

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
  sub_1BE5B2CE0();

  swift_bridgeObjectRelease();
  sub_1BE37E9E8(0, (unint64_t *)&unk_1EBA45730);
  v5 = (void *)sub_1BE9C4BF8();
  swift_bridgeObjectRelease();

  return v5;
}

- (id)_homeFuture
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC6HomeUI29ServiceGroupEditorItemManager_selectionController);
  swift_beginAccess();
  id v4 = *(void **)(v3 + 16);
  v5 = self;
  id v6 = objc_msgSend(v4, sel_home);
  id v7 = objc_msgSend(self, sel_futureWithResult_, v6);

  return v7;
}

- (_TtC6HomeUI29ServiceGroupEditorItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  swift_unknownObjectRetain();
  id v5 = a4;
  result = (_TtC6HomeUI29ServiceGroupEditorItemManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI29ServiceGroupEditorItemManager_nameAndIconItem));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI29ServiceGroupEditorItemManager_accessoryElementItemModule));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI29ServiceGroupEditorItemManager_staticItemProvider));
  uint64_t v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC6HomeUI29ServiceGroupEditorItemManager_accessoryElementContext);
}

@end