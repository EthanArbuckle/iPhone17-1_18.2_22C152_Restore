@interface HUNearbyAccessoriesEditorViewController
- (BOOL)shouldShowHeaderForSection:(id)a3;
- (HUNearbyAccessoriesEditorViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4;
- (HUNearbyAccessoriesEditorViewController)initWithPrimaryAccessory:(id)a3 completionHandler:(id)a4;
- (id)buildItemModuleControllerForModule:(id)a3;
- (id)displayedItemsInSection:(id)a3;
- (id)hu_preloadContent;
- (id)initUsingCompositionalLayoutWithItemManager:(id)a3;
- (id)layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4;
- (void)cancelEditingWithSender:(id)a3;
- (void)dismissEditorWithSender:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUNearbyAccessoriesEditorViewController

- (HUNearbyAccessoriesEditorViewController)initWithPrimaryAccessory:(id)a3 completionHandler:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  return (HUNearbyAccessoriesEditorViewController *)NearbyAccessoriesEditorViewController.init(primaryAccessory:completionHandler:)(a3, (uint64_t)sub_1BE43BE18, v6);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1BE489C34();
}

- (void)dismissEditorWithSender:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1BE9C5638();
  swift_unknownObjectRelease();
  sub_1BE489E8C();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (void)cancelEditingWithSender:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1BE9C5638();
  swift_unknownObjectRelease();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v8[4] = sub_1BE48D4BC;
  v8[5] = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 1107296256;
  v8[2] = sub_1BE3B2FEC;
  v8[3] = &block_descriptor_36_0;
  uint64_t v6 = _Block_copy(v8);
  v7 = v4;
  swift_release();
  [(HUNearbyAccessoriesEditorViewController *)v7 dismissViewControllerAnimated:1 completion:v6];
  _Block_release(v6);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
}

- (id)hu_preloadContent
{
  v2 = self;
  id v3 = sub_1BE48B54C();

  return v3;
}

- (id)layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4
{
  swift_unknownObjectRetain();
  v7 = self;
  id v8 = sub_1BE48C5DC(a3, (uint64_t)a4);
  swift_unknownObjectRelease();

  return v8;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_1BE48D18C(v4);

  return v6;
}

- (id)displayedItemsInSection:(id)a3
{
  sub_1BE9C49F8();
  id v4 = self;
  uint64_t v5 = [(HUItemCollectionViewController *)v4 itemManager];
  id v6 = (void *)sub_1BE9C49B8();
  id v7 = [(HFItemManager *)v5 displayedItemsInSectionWithIdentifier:v6];

  sub_1BE37E9E8(0, (unint64_t *)&qword_1EBA46790);
  sub_1BE9C4C18();

  swift_bridgeObjectRelease();
  id v8 = (void *)sub_1BE9C4BF8();
  swift_bridgeObjectRelease();

  return v8;
}

- (BOOL)shouldShowHeaderForSection:(id)a3
{
  sub_1BE9C49F8();
  id v4 = self;
  uint64_t v5 = [(HUItemCollectionViewController *)v4 itemManager];
  id v6 = (void *)sub_1BE9C49B8();
  id v7 = [(HFItemManager *)v5 sectionIndexForDisplayedSectionIdentifier:v6];

  id v8 = [(HUItemCollectionViewController *)v4 itemManager];
  id v9 = [(HFItemManager *)v8 titleForSection:v7];

  swift_bridgeObjectRelease();
  if (v9) {

  }
  return v9 != 0;
}

- (HUNearbyAccessoriesEditorViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (HUNearbyAccessoriesEditorViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)initUsingCompositionalLayoutWithItemManager:(id)a3
{
  id v3 = a3;
  id result = (id)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUNearbyAccessoriesEditorViewController_EmptySetIdentifier));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUNearbyAccessoriesEditorViewController_accessoryElementModule));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUNearbyAccessoriesEditorViewController_instructionModule));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUNearbyAccessoriesEditorViewController_layoutManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUNearbyAccessoriesEditorViewController_primaryAccessory));

  swift_release();
}

@end