@interface HUSelectableActionSetItemModuleController
- (BOOL)shouldShowHeaderForSection:(id)a3;
- (Class)collectionCellClassForItem:(id)a3;
- (HUSelectableActionSetItemModuleController)initWithModule:(id)a3;
- (id)collectionLayoutSectionForSectionWithIdentifier:(id)a3 layoutEnvironment:(id)a4;
- (id)displayedItemsInSection:(id)a3;
- (void)configureCell:(id)a3 forItem:(id)a4;
@end

@implementation HUSelectableActionSetItemModuleController

- (Class)collectionCellClassForItem:(id)a3
{
  sub_1BE37E9E8(0, (unint64_t *)&unk_1EA114630);

  return (Class)swift_getObjCClassFromMetadata();
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1BE4B4DA8(v6, v7);
}

- (id)collectionLayoutSectionForSectionWithIdentifier:(id)a3 layoutEnvironment:(id)a4
{
  uint64_t v6 = sub_1BE9C49F8();
  uint64_t v8 = v7;
  swift_unknownObjectRetain();
  v9 = self;
  v10 = sub_1BE4B5194(v6, v8, (uint64_t)a4);
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
  return 1;
}

- (HUSelectableActionSetItemModuleController)initWithModule:(id)a3
{
  id v3 = a3;
  result = (HUSelectableActionSetItemModuleController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HUSelectableActionSetItemModuleController_collectionLayoutManager));
}

@end