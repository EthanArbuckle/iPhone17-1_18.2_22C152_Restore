@interface HUNearbyAccessoriesViewController
+ (unint64_t)updateMode;
- (BOOL)presentationCoordinator:(id)a3 shouldBeginLongPressPresentationWithContext:(id)a4;
- (BOOL)presentationCoordinator:(id)a3 shouldBeginPresentationWithContext:(id)a4;
- (BOOL)presentationCoordinatorShouldProvideCancellationFeedback:(id)a3;
- (BOOL)shouldShowHeaderForSection:(id)a3;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUNearbyAccessoriesViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4;
- (HUNearbyAccessoriesViewController)initWithSourceItem:(id)a3 supportsQuickControls:(BOOL)a4;
- (HUPresentationDelegate)presentationDelegate;
- (id)displayedItemsInSection:(id)a3;
- (id)initUsingCompositionalLayoutWithItemManager:(id)a3;
- (id)layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4;
- (void)configureCell:(id)a3 forItem:(id)a4;
- (void)displayEditorWithSender:(id)a3;
- (void)doneButtonPressedWithSender:(id)a3;
- (void)itemManager:(id)a3 didUpdateResultsForSourceItem:(id)a4;
- (void)setPresentationDelegate:(id)a3;
- (void)updateViewConstraints;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HUNearbyAccessoriesViewController

- (HUPresentationDelegate)presentationDelegate
{
  v2 = (char *)self + OBJC_IVAR___HUNearbyAccessoriesViewController_presentationDelegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1C1898E00](v2);

  return (HUPresentationDelegate *)v3;
}

- (void)setPresentationDelegate:(id)a3
{
}

+ (unint64_t)updateMode
{
  return 1;
}

- (HUNearbyAccessoriesViewController)initWithSourceItem:(id)a3 supportsQuickControls:(BOOL)a4
{
  return (HUNearbyAccessoriesViewController *)NearbyAccessoriesViewController.init(sourceItem:supportsQuickControls:)(a3, a4);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1BE3F8878();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NearbyAccessoriesViewController();
  id v4 = v5.receiver;
  [(HUControllableItemCollectionViewController *)&v5 viewDidAppear:v3];
  sub_1BE3F94F8();
}

- (void)updateViewConstraints
{
  v2 = self;
  sub_1BE3F8D4C();
}

- (void)doneButtonPressedWithSender:(id)a3
{
}

- (void)displayEditorWithSender:(id)a3
{
}

- (id)layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4
{
  swift_unknownObjectRetain();
  v7 = self;
  id v8 = sub_1BE3F9920(a3, a4);
  swift_unknownObjectRelease();

  return v8;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  uint64_t v6 = sub_1BE9C1208();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE9C11B8();
  id v10 = a3;
  v11 = self;
  unsigned int v12 = objc_msgSend(v10, sel_conformsToProtocol_, &unk_1F1A3D190);

  if (v12) {
    type metadata accessor for AccessoryTileCell();
  }
  else {
    sub_1BE37E9E8(0, (unint64_t *)&unk_1EBA45440);
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1BE3F9D1C(v6, v7);
}

- (void)itemManager:(id)a3 didUpdateResultsForSourceItem:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for NearbyAccessoriesViewController();
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (char *)v12.receiver;
  [(HUItemCollectionViewController *)&v12 itemManager:v6 didUpdateResultsForSourceItem:v7];
  v9 = &v8[OBJC_IVAR___HUNearbyAccessoriesViewController_nearbyAccessoriesDelegate];
  swift_beginAccess();
  if (MEMORY[0x1C1898E00](v9))
  {
    uint64_t v10 = *((void *)v9 + 1);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 8))(v8, ObjectType, v10);
    swift_unknownObjectRelease();
  }
  sub_1BE3F94F8();
}

- (id)displayedItemsInSection:(id)a3
{
  sub_1BE9C49F8();
  id v4 = self;
  objc_super v5 = [(HUItemCollectionViewController *)v4 itemManager];
  id v6 = (void *)sub_1BE9C49B8();
  id v7 = [(HFItemManager *)v5 displayedItemsInSectionWithIdentifier:v6];

  sub_1BE37E9E8(0, (unint64_t *)&qword_1EBA46790);
  sub_1BE9C4C18();

  swift_bridgeObjectRelease();
  uint64_t v8 = (void *)sub_1BE9C4BF8();
  swift_bridgeObjectRelease();

  return v8;
}

- (BOOL)shouldShowHeaderForSection:(id)a3
{
  sub_1BE9C49F8();
  id v4 = self;
  objc_super v5 = [(HUItemCollectionViewController *)v4 itemManager];
  id v6 = (void *)sub_1BE9C49B8();
  id v7 = [(HFItemManager *)v5 sectionIndexForDisplayedSectionIdentifier:v6];

  uint64_t v8 = [(HUItemCollectionViewController *)v4 itemManager];
  id v9 = [(HFItemManager *)v8 titleForSection:v7];

  swift_bridgeObjectRelease();
  if (v9) {

  }
  return v9 != 0;
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginLongPressPresentationWithContext:(id)a4
{
  return 0;
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginPresentationWithContext:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for NearbyAccessoriesViewController();
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v11.receiver;
  if ([(HUControllableItemCollectionViewController *)&v11 presentationCoordinator:v6 shouldBeginPresentationWithContext:v7])
  {
    char v9 = v8[OBJC_IVAR___HUNearbyAccessoriesViewController_supportsQuickControls];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)presentationCoordinatorShouldProvideCancellationFeedback:(id)a3
{
  return (*((unsigned char *)&self->super.super.super.super.super.super.super.isa
          + OBJC_IVAR___HUNearbyAccessoriesViewController_supportsQuickControls) & 1) == 0;
}

- (HUNearbyAccessoriesViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (HUNearbyAccessoriesViewController *)_swift_stdlib_reportUnimplementedInitializer();
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
  sub_1BE37E904((uint64_t)self + OBJC_IVAR___HUNearbyAccessoriesViewController_presentationDelegate);
  sub_1BE37E904((uint64_t)self + OBJC_IVAR___HUNearbyAccessoriesViewController_nearbyAccessoriesDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUNearbyAccessoriesViewController_currentAccessory));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUNearbyAccessoriesViewController_layoutManager));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUNearbyAccessoriesViewController__userInfoDescription));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR___HUNearbyAccessoriesViewController__userInfoHeading);
}

@end