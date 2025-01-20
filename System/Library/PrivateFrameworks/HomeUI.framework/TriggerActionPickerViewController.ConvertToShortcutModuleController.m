@interface TriggerActionPickerViewController.ConvertToShortcutModuleController
- (BOOL)shouldShowHeaderForSection:(id)a3;
- (Class)collectionCellClassForItem:(id)a3;
- (_TtCC6HomeUI33TriggerActionPickerViewController33ConvertToShortcutModuleController)initWithModule:(id)a3;
- (id)collectionLayoutSectionForSectionWithIdentifier:(id)a3 layoutEnvironment:(id)a4;
- (id)displayedItemsInSection:(id)a3;
- (unint64_t)didSelectItem:(id)a3;
- (void)configureCell:(id)a3 forItem:(id)a4;
@end

@implementation TriggerActionPickerViewController.ConvertToShortcutModuleController

- (Class)collectionCellClassForItem:(id)a3
{
  sub_1BE37E9E8(0, (unint64_t *)&unk_1EBA45440);

  return (Class)swift_getObjCClassFromMetadata();
}

- (id)collectionLayoutSectionForSectionWithIdentifier:(id)a3 layoutEnvironment:(id)a4
{
  uint64_t v6 = sub_1BE9C49F8();
  uint64_t v8 = v7;
  swift_unknownObjectRetain();
  v9 = self;
  v10 = sub_1BE45B238(v6, v8, (uint64_t)a4);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();

  return v10;
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BE45B5E0(v4);

  return 0;
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1BE45B754((uint64_t)v6, v7);
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
  v3 = self;
  id v4 = [(HUItemModuleController *)v3 module];
  uint64_t v5 = *(uint64_t *)((char *)&v4->_itemProviders
                  + OBJC_IVAR____TtCC6HomeUI33TriggerActionPickerViewController23ConvertToShortcutModule_sectionHeader);
  sub_1BE9C36A8();

  if (v5) {
    swift_bridgeObjectRelease();
  }
  return v5 != 0;
}

- (_TtCC6HomeUI33TriggerActionPickerViewController33ConvertToShortcutModuleController)initWithModule:(id)a3
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtCC6HomeUI33TriggerActionPickerViewController33ConvertToShortcutModuleController____lazy_storage___collectionLayoutManager) = 0;
  v5.receiver = self;
  v5.super_class = (Class)_s14descr1F18E7569C33ConvertToShortcutModuleControllerCMa();
  return [(HUItemModuleController *)&v5 initWithModule:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC6HomeUI33TriggerActionPickerViewController33ConvertToShortcutModuleController____lazy_storage___collectionLayoutManager));
}

@end