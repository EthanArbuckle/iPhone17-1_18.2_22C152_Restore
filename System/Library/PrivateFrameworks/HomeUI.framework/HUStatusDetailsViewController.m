@interface HUStatusDetailsViewController
- (BOOL)hasDetailsActionForPresentationCoordinator:(id)a3 item:(id)a4;
- (BOOL)presentationCoordinator:(id)a3 shouldBeginInteractivePresentationWithTouchLocation:(CGPoint)a4 view:(id)a5;
- (BOOL)shouldShowHeaderForSection:(id)a3;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUStatusDetailsViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4;
- (HUStatusDetailsViewController)initWithStatusItem:(id)a3 delegate:(id)a4;
- (HUStatusDetailsViewControllerDelegate)statusDetailsDelegate;
- (id)detailsViewControllerForPresentationCoordinator:(id)a3 item:(id)a4;
- (id)displayedItemsInSection:(id)a3;
- (id)initUsingCompositionalLayoutWithItemManager:(id)a3;
- (id)layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4;
- (id)prepareToPerformToggleActionForItem:(id)a3 sourceItem:(id)a4;
- (id)transform:(id)a3;
- (void)aboutResidentDeviceViewControllerDidFinish:(id)a3;
- (void)accessoryControlViewControllerFor:(HFAccessoryRepresentableItem *)a3 tileItem:(HFItem *)a4 completionHandler:(id)a5;
- (void)configureCell:(id)a3 forItem:(id)a4;
- (void)doneButtonPressed:(id)a3;
- (void)presentationCoordinator:(id)a3 willBeginPresentationWithContext:(id)a4;
- (void)setStatusDetailsDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HUStatusDetailsViewController

- (HUStatusDetailsViewControllerDelegate)statusDetailsDelegate
{
  v2 = (char *)self + OBJC_IVAR___HUStatusDetailsViewController_statusDetailsDelegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1C1898E00](v2);

  return (HUStatusDetailsViewControllerDelegate *)v3;
}

- (void)setStatusDetailsDelegate:(id)a3
{
}

- (HUStatusDetailsViewController)initWithStatusItem:(id)a3 delegate:(id)a4
{
  id v4 = a3;
  swift_unknownObjectRetain();
  return (HUStatusDetailsViewController *)StatusDetailsViewController.init(statusItem:delegate:)(v4);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1BE5AC9E4();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for StatusDetailsViewController();
  id v4 = v5.receiver;
  [(HUControllableItemCollectionViewController *)&v5 viewDidAppear:v3];
  objc_msgSend(self, sel_sendEvent_, 34, v5.receiver, v5.super_class);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for StatusDetailsViewController();
  id v4 = v6.receiver;
  [(HUControllableItemCollectionViewController *)&v6 viewDidDisappear:v3];
  id v5 = objc_msgSend(v4, sel_itemManager, v6.receiver, v6.super_class);
  self;
  objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_resetItemPrioritiesToDefaults);
}

- (void)doneButtonPressed:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1BE5AF3B8();
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginInteractivePresentationWithTouchLocation:(CGPoint)a4 view:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  id v10 = a5;
  v11 = self;
  char v12 = sub_1BE5ACDB8((uint64_t)v9, (uint64_t)v10, x, y);

  return v12 & 1;
}

- (BOOL)hasDetailsActionForPresentationCoordinator:(id)a3 item:(id)a4
{
  return swift_dynamicCastObjCProtocolConditional() != 0;
}

- (id)detailsViewControllerForPresentationCoordinator:(id)a3 item:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = (void *)sub_1BE5AF5B4(v7);

  return v9;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  uint64_t v6 = sub_1BE9C1208();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  id v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE9C11B8();
  id v10 = a3;
  v11 = self;
  char v12 = [(HUItemCollectionViewController *)v11 itemManager];
  self;
  unsigned int v13 = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_shouldUseTitleDescriptionStyleForItem_, v10);

  if (v13) {
    sub_1BE37E9E8(0, &qword_1EA118750);
  }
  else {
    type metadata accessor for AccessoryTileCell();
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1BE5AD384(v6, v7);
}

- (id)layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4
{
  swift_unknownObjectRetain();
  id v7 = self;
  id v8 = sub_1BE5ADAF4(a3, a4);
  swift_unknownObjectRelease();

  return v8;
}

- (void)accessoryControlViewControllerFor:(HFAccessoryRepresentableItem *)a3 tileItem:(HFItem *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA46780);
  MEMORY[0x1F4188790](v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = _Block_copy(a5);
  unsigned int v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_1BE9C4DD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EA118830;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EA113230;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_1BE5AF20C((uint64_t)v11, (uint64_t)&unk_1EA1167F0, (uint64_t)v16);
  swift_release();
}

- (id)prepareToPerformToggleActionForItem:(id)a3 sourceItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  uint64_t v9 = [(HUItemCollectionViewController *)v8 itemManager];
  self;
  objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_maintainMinimumPriorityForItem_, v7);

  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for StatusDetailsViewController();
  id v10 = [(HUControllableItemCollectionViewController *)&v12 prepareToPerformToggleActionForItem:v6 sourceItem:v7];

  return v10;
}

- (void)presentationCoordinator:(id)a3 willBeginPresentationWithContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  uint64_t v9 = [(HUItemCollectionViewController *)v8 itemManager];
  self;
  id v10 = (void *)swift_dynamicCastObjCClassUnconditional();
  id v11 = objc_msgSend(v7, sel_item);
  objc_msgSend(v10, sel_maintainMinimumPriorityForItem_, v11);

  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for StatusDetailsViewController();
  [(HUControllableItemCollectionViewController *)&v12 presentationCoordinator:v6 willBeginPresentationWithContext:v7];
}

- (HUStatusDetailsViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (HUStatusDetailsViewController *)_swift_stdlib_reportUnimplementedInitializer();
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
  sub_1BE37E904((uint64_t)self + OBJC_IVAR___HUStatusDetailsViewController_statusDetailsDelegate);
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR___HUStatusDetailsViewController____lazy_storage___collectionLayoutManager);
}

- (id)displayedItemsInSection:(id)a3
{
  sub_1BE9C49F8();
  id v4 = self;
  id v5 = [(HUItemCollectionViewController *)v4 itemManager];
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
  return 1;
}

- (id)transform:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, sel_setSectionTopMargin_, 0.0);

  return v3;
}

- (void)aboutResidentDeviceViewControllerDidFinish:(id)a3
{
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v9 = sub_1BE9C1018();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  objc_super v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE9C0FF8();
  id v13 = a3;
  uint64_t v14 = self;
  LOBYTE(a6) = sub_1BE5B0560((uint64_t)v12, a6);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return a6 & 1;
}

@end