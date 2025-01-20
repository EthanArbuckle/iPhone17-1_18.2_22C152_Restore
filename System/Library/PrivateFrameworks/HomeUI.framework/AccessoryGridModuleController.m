@interface AccessoryGridModuleController
- (BOOL)shouldShowHeaderForSection:(id)a3;
- (Class)collectionCellClassForItem:(id)a3;
- (_TtC6HomeUI29AccessoryGridModuleController)initWithModule:(id)a3;
- (id)collectionLayoutSectionForSectionWithIdentifier:(id)a3 layoutEnvironment:(id)a4;
- (id)displayedItemsInSection:(id)a3;
- (id)transform:(id)a3;
- (void)configureCell:(id)a3 forItem:(id)a4;
@end

@implementation AccessoryGridModuleController

- (Class)collectionCellClassForItem:(id)a3
{
  v9 = &unk_1F1A3D190;
  if (swift_dynamicCastObjCProtocolConditional())
  {
    type metadata accessor for AccessoryTileCell();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)type metadata accessor for AccessoryGridModuleController();
    id v5 = a3;
    v6 = self;
    [(HUItemModuleController *)&v8 collectionCellClassForItem:v5];

    swift_getObjCClassMetadata();
  }
  return (Class)swift_getObjCClassFromMetadata();
}

- (id)collectionLayoutSectionForSectionWithIdentifier:(id)a3 layoutEnvironment:(id)a4
{
  uint64_t v6 = sub_1BE9C49F8();
  uint64_t v8 = v7;
  swift_unknownObjectRetain();
  v9 = self;
  id v10 = sub_1BE5AB0B0(v6, v8, a4);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();

  return v10;
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1BE5AB328(v6, v7);
}

- (id)displayedItemsInSection:(id)a3
{
  sub_1BE9C49F8();
  v4 = self;
  id v5 = [(HUItemModuleController *)v4 module];
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
  v3 = self;
  v4 = [(HUItemModuleController *)v3 module];
  id v5 = (uint64_t *)((char *)v4 + OBJC_IVAR____TtC6HomeUI19AccessoryItemModule_sectionGroupingType);
  swift_beginAccess();
  uint64_t v6 = *v5;

  return v6 != 0;
}

- (id)transform:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_msgSend(v4, sel_setSectionLeadingMargin_, 0.0);
  objc_msgSend(v4, sel_setSectionTrailingMargin_, 0.0);

  return v4;
}

- (_TtC6HomeUI29AccessoryGridModuleController)initWithModule:(id)a3
{
  id v4 = (char *)self + OBJC_IVAR____TtC6HomeUI29AccessoryGridModuleController_cellSettings;
  *(_OWORD *)id v4 = xmmword_1BEA10B60;
  *((_WORD *)v4 + 8) = 256;
  v4[18] = 0;
  *((void *)v4 + 3) = 0;
  v4[32] = 1;
  id v5 = (char *)self + OBJC_IVAR____TtC6HomeUI29AccessoryGridModuleController_layoutStyle;
  *(_OWORD *)id v5 = xmmword_1BEA0E6C0;
  v5[16] = 2;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC6HomeUI29AccessoryGridModuleController____lazy_storage___collectionLayoutManager) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for AccessoryGridModuleController();
  return [(HUItemModuleController *)&v7 initWithModule:a3];
}

- (void).cxx_destruct
{
  sub_1BE3B10A4(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6HomeUI29AccessoryGridModuleController_layoutStyle), *(uint64_t *)((char *)&self->super._host + OBJC_IVAR____TtC6HomeUI29AccessoryGridModuleController_layoutStyle), *((unsigned char *)&self->super._hostType + OBJC_IVAR____TtC6HomeUI29AccessoryGridModuleController_layoutStyle));
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC6HomeUI29AccessoryGridModuleController____lazy_storage___collectionLayoutManager);
}

@end