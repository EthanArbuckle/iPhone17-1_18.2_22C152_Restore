@interface ActionSetContainerSummaryGridItemModuleController
- (BOOL)shouldShowHeaderForSection:(id)a3;
- (Class)collectionCellClassForItem:(id)a3;
- (_TtC6HomeUI49ActionSetContainerSummaryGridItemModuleController)initWithModule:(id)a3;
- (id)collectionLayoutSectionForSectionWithIdentifier:(id)a3 layoutEnvironment:(id)a4;
- (id)displayedItemsInSection:(id)a3;
- (id)transform:(id)a3;
- (void)configureCell:(id)a3 forItem:(id)a4;
- (void)sceneEditor:(id)a3 removeActionSetBuilderFromTrigger:(id)a4;
@end

@implementation ActionSetContainerSummaryGridItemModuleController

- (Class)collectionCellClassForItem:(id)a3
{
  sub_1BE37E9E8(0, &qword_1EA115460);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v6 = a3;
  v7 = self;
  LODWORD(ObjCClassFromMetadata) = objc_msgSend(v6, sel_isKindOfClass_, ObjCClassFromMetadata);

  if (ObjCClassFromMetadata) {
    type metadata accessor for SceneTileCell();
  }
  else {
    sub_1BE37E9E8(0, (unint64_t *)&unk_1EBA45440);
  }

  return (Class)swift_getObjCClassFromMetadata();
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1BE45985C(v6, (uint64_t)v7);
}

- (id)collectionLayoutSectionForSectionWithIdentifier:(id)a3 layoutEnvironment:(id)a4
{
  uint64_t v6 = sub_1BE9C49F8();
  uint64_t v8 = v7;
  swift_unknownObjectRetain();
  v9 = self;
  id v10 = sub_1BE4599EC(v6, v8, a4);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();

  return v10;
}

- (id)displayedItemsInSection:(id)a3
{
  sub_1BE9C49F8();
  v4 = self;
  v5 = [(HUItemModuleController *)v4 module];
  uint64_t v6 = [(HFItemModule *)v5 itemUpdater];

  if (v6)
  {
    uint64_t v7 = (void *)sub_1BE9C49B8();
    id v8 = [(HFItemUpdating *)v6 displayedItemsInSectionWithIdentifier:v7];

    swift_unknownObjectRelease();
    sub_1BE37E9E8(0, (unint64_t *)&qword_1EBA46790);
    sub_1BE9C4C18();

    swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  sub_1BE37E9E8(0, (unint64_t *)&qword_1EBA46790);
  v9 = (void *)sub_1BE9C4BF8();
  swift_bridgeObjectRelease();

  return v9;
}

- (BOOL)shouldShowHeaderForSection:(id)a3
{
  return 0;
}

- (id)transform:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = sub_1BE45A274(v4);

  return v6;
}

- (void)sceneEditor:(id)a3 removeActionSetBuilderFromTrigger:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_1BE459DE4((uint64_t)a3, a4);
}

- (_TtC6HomeUI49ActionSetContainerSummaryGridItemModuleController)initWithModule:(id)a3
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC6HomeUI49ActionSetContainerSummaryGridItemModuleController____lazy_storage___collectionLayoutManager) = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ActionSetContainerSummaryGridItemModuleController();
  return [(HUItemModuleController *)&v6 initWithModule:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI49ActionSetContainerSummaryGridItemModuleController____lazy_storage___collectionLayoutManager));
  v3 = (char *)self + OBJC_IVAR____TtC6HomeUI49ActionSetContainerSummaryGridItemModuleController_sceneEditorDelegate;

  sub_1BE37E904((uint64_t)v3);
}

@end