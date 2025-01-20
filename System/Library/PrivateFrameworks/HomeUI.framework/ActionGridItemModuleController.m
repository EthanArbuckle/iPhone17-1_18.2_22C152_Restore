@interface ActionGridItemModuleController
- (BOOL)hasDetailsActionFor:(id)a3 item:(id)a4;
- (BOOL)shouldShowHeaderForSection:(id)a3;
- (Class)collectionCellClassForItem:(id)a3;
- (_TtC6HomeUI30ActionGridItemModuleController)initWithModule:(id)a3;
- (id)collectionLayoutSectionForSectionWithIdentifier:(id)a3 layoutEnvironment:(id)a4;
- (id)detailsViewControllerFor:(id)a3 item:(id)a4;
- (id)displayedItemsInSection:(id)a3;
- (id)transform:(id)a3;
- (void)configureCell:(id)a3 forItem:(id)a4;
- (void)serviceActionControlsViewController:(id)a3 removeServiceActionItem:(id)a4;
@end

@implementation ActionGridItemModuleController

- (_TtC6HomeUI30ActionGridItemModuleController)initWithModule:(id)a3
{
  *(HUItemModuleControllerHosting **)((char *)&self->super._host
                                    + OBJC_IVAR____TtC6HomeUI30ActionGridItemModuleController_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC6HomeUI30ActionGridItemModuleController____lazy_storage___collectionLayoutManager) = 0;
  swift_unknownObjectWeakInit();
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ActionGridItemModuleController();
  v5 = (char *)a3;
  v6 = [(HUItemModuleController *)&v8 initWithModule:v5];
  *(void *)&v5[OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_delegate + 8] = &off_1F18E88B8;
  swift_unknownObjectWeakAssign();

  return v6;
}

- (Class)collectionCellClassForItem:(id)a3
{
  id v4 = a3;
  v5 = self;
  unsigned int v6 = objc_msgSend(v4, sel_conformsToProtocol_, &unk_1F1A3D190);

  if (v6) {
    type metadata accessor for AccessoryTileCell();
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
  objc_super v8 = self;
  sub_1BE3779E0(v6, v7);
}

- (id)collectionLayoutSectionForSectionWithIdentifier:(id)a3 layoutEnvironment:(id)a4
{
  uint64_t v6 = sub_1BE9C49F8();
  uint64_t v8 = v7;
  swift_unknownObjectRetain();
  v9 = self;
  v10 = sub_1BE378774(v6, v8, a4);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();

  return v10;
}

- (BOOL)hasDetailsActionFor:(id)a3 item:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  v9 = [(HUItemModuleController *)v8 module];
  v10 = (char *)v9 + OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_config;
  swift_beginAccess();
  LOBYTE(v10) = v10[16];

  return (char)v10;
}

- (id)detailsViewControllerFor:(id)a3 item:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  v9 = (void *)sub_1BE378A98((uint64_t)v6, v7);

  return v9;
}

- (void)serviceActionControlsViewController:(id)a3 removeServiceActionItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1BE37C4CC(v7);
}

- (id)displayedItemsInSection:(id)a3
{
  sub_1BE9C49F8();
  id v4 = self;
  v5 = [(HUItemModuleController *)v4 module];
  id v6 = [(HFItemModule *)v5 itemUpdater];

  if (v6)
  {
    id v7 = (void *)sub_1BE9C49B8();
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
  return 1;
}

- (id)transform:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1BE37D9E0(v4);

  return v6;
}

- (void).cxx_destruct
{
  sub_1BE37E904((uint64_t)self + OBJC_IVAR____TtC6HomeUI30ActionGridItemModuleController_delegate);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI30ActionGridItemModuleController____lazy_storage___collectionLayoutManager));

  swift_unknownObjectWeakDestroy();
}

@end