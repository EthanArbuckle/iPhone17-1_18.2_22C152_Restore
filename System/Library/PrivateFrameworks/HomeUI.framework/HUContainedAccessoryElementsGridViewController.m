@interface HUContainedAccessoryElementsGridViewController
- (BOOL)hasDetailsActionForPresentationCoordinator:(id)a3 item:(id)a4;
- (BOOL)requiresPresentingViewControllerDismissal;
- (BOOL)shouldShowHeaderForSection:(id)a3;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HFMediaAccessoryItem)mediaItem;
- (HUContainedAccessoryElementsGridViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4;
- (HUContainedAccessoryElementsGridViewController)initWithMediaItem:(id)a3 isPresentedModally:(BOOL)a4 shouldGroupByRoom:(BOOL)a5 valueSource:(id)a6;
- (HUContainedAccessoryElementsGridViewController)initWithServiceContainingItem:(id)a3 isPresentedModally:(BOOL)a4 shouldGroupByRoom:(BOOL)a5 valueSource:(id)a6;
- (HUContainedAccessoryElementsGridViewController)initWithServiceContainingItem:(id)a3 mediaItem:(id)a4 isPresentedModally:(BOOL)a5 shouldGroupByRoom:(BOOL)a6 valueSource:(id)a7;
- (HUContainedAccessoryElementsGridViewControllerDelegate)serviceGridDelegate;
- (HUPresentationDelegate)presentationDelegate;
- (HUServiceContainerItem)serviceContainingItem;
- (id)detailsViewControllerForPresentationCoordinator:(id)a3 item:(id)a4;
- (id)displayedItemsInSection:(id)a3;
- (id)finishPresentation:(id)a3 animated:(BOOL)a4;
- (id)initUsingCompositionalLayoutWithItemManager:(id)a3;
- (id)layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4;
- (void)accessoryControlViewControllerFor:(HFAccessoryRepresentableItem *)a3 tileItem:(HFItem *)a4 completionHandler:(id)a5;
- (void)configureCell:(id)a3 forItem:(id)a4;
- (void)doneWithSender:(id)a3;
- (void)editWithSender:(id)a3;
- (void)itemManagerDidUpdate:(id)a3;
- (void)setMediaItem:(id)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setRequiresPresentingViewControllerDismissal:(BOOL)a3;
- (void)setServiceContainingItem:(id)a3;
- (void)setServiceGridDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUContainedAccessoryElementsGridViewController

- (BOOL)requiresPresentingViewControllerDismissal
{
  v2 = (BOOL *)self
     + OBJC_IVAR___HUContainedAccessoryElementsGridViewController_requiresPresentingViewControllerDismissal;
  swift_beginAccess();
  return *v2;
}

- (void)setRequiresPresentingViewControllerDismissal:(BOOL)a3
{
  v4 = (BOOL *)self
     + OBJC_IVAR___HUContainedAccessoryElementsGridViewController_requiresPresentingViewControllerDismissal;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (HUPresentationDelegate)presentationDelegate
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();

  return (HUPresentationDelegate *)v2;
}

- (void)setPresentationDelegate:(id)a3
{
  v4 = (id *)((char *)&self->super.super.super.super.super.super.super.isa
            + OBJC_IVAR___HUContainedAccessoryElementsGridViewController_presentationDelegate);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (HUServiceContainerItem)serviceContainingItem
{
  return (HUServiceContainerItem *)sub_1BE3840E0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HUContainedAccessoryElementsGridViewController_serviceContainingItem);
}

- (void)setServiceContainingItem:(id)a3
{
}

- (HFMediaAccessoryItem)mediaItem
{
  return (HFMediaAccessoryItem *)sub_1BE3840E0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HUContainedAccessoryElementsGridViewController_mediaItem);
}

- (void)setMediaItem:(id)a3
{
}

- (HUContainedAccessoryElementsGridViewControllerDelegate)serviceGridDelegate
{
  v2 = (char *)self + OBJC_IVAR___HUContainedAccessoryElementsGridViewController_serviceGridDelegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1C1898E00](v2);

  return (HUContainedAccessoryElementsGridViewControllerDelegate *)v3;
}

- (void)setServiceGridDelegate:(id)a3
{
}

- (HUContainedAccessoryElementsGridViewController)initWithServiceContainingItem:(id)a3 isPresentedModally:(BOOL)a4 shouldGroupByRoom:(BOOL)a5 valueSource:(id)a6
{
  return [(HUContainedAccessoryElementsGridViewController *)self initWithServiceContainingItem:a3 mediaItem:0 isPresentedModally:a4 shouldGroupByRoom:a5 valueSource:a6];
}

- (HUContainedAccessoryElementsGridViewController)initWithMediaItem:(id)a3 isPresentedModally:(BOOL)a4 shouldGroupByRoom:(BOOL)a5 valueSource:(id)a6
{
  return [(HUContainedAccessoryElementsGridViewController *)self initWithServiceContainingItem:0 mediaItem:a3 isPresentedModally:a4 shouldGroupByRoom:a5 valueSource:a6];
}

- (HUContainedAccessoryElementsGridViewController)initWithServiceContainingItem:(id)a3 mediaItem:(id)a4 isPresentedModally:(BOOL)a5 shouldGroupByRoom:(BOOL)a6 valueSource:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  swift_unknownObjectRetain();
  return (HUContainedAccessoryElementsGridViewController *)ContainedAccessoryElementsGridViewController.init(serviceContainingItem:mediaItem:isPresentedModally:shouldGroupByRoom:valueSource:)(a3, a4, a5, a6, (uint64_t)a7);
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ContainedAccessoryElementsGridViewController();
  id v2 = v6.receiver;
  [(HUControllableItemCollectionViewController *)&v6 viewDidLoad];
  id v3 = objc_msgSend(v2, sel_collectionView, v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    id v5 = objc_msgSend(self, sel_systemGroupedBackgroundColor);
    objc_msgSend(v4, sel_setBackgroundColor_, v5);
  }
  else
  {
    __break(1u);
  }
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  uint64_t v6 = sub_1BE9C1208();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE9C11B8();
  v17 = &unk_1F1A3D190;
  if (swift_dynamicCastObjCProtocolConditional())
  {
    type metadata accessor for AccessoryTileCell();
  }
  else
  {
    id v10 = a3;
    v11 = self;
    id v12 = (void *)sub_1BE9C11A8();
    id v13 = (objc_class *)type metadata accessor for ContainedAccessoryElementsGridViewController();
    v16.receiver = v11;
    v16.super_class = v13;
    [(HUItemCollectionViewController *)&v16 cellClassForItem:v10 indexPath:v12];

    swift_getObjCClassMetadata();
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  sub_1BE4FDE9C(v8, v6);
}

- (void)itemManagerDidUpdate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ContainedAccessoryElementsGridViewController();
  id v4 = a3;
  id v5 = v6.receiver;
  [(HUItemCollectionViewController *)&v6 itemManagerDidUpdate:v4];
  sub_1BE4FE2B8();
}

- (id)layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4
{
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  id v8 = sub_1BE4FE54C(a3, a4);
  swift_unknownObjectRelease();

  return v8;
}

- (void)accessoryControlViewControllerFor:(HFAccessoryRepresentableItem *)a3 tileItem:(HFItem *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA46780);
  MEMORY[0x1F4188790](v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = _Block_copy(a5);
  id v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_1BE9C4DD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EA1172B0;
  v15[5] = v13;
  objc_super v16 = (void *)swift_allocObject();
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

- (BOOL)hasDetailsActionForPresentationCoordinator:(id)a3 item:(id)a4
{
  uint64_t v7 = (char *)self + OBJC_IVAR___HUContainedAccessoryElementsGridViewController_serviceGridDelegate;
  swift_beginAccess();
  id v8 = (void *)MEMORY[0x1C1898E00](v7);
  if (!v8) {
    return 0;
  }
  uint64_t v9 = v8;
  if (objc_msgSend(v8, sel_respondsToSelector_, sel_hasDetailsActionFor_item_))
  {
    id v10 = a3;
    id v11 = a4;
    id v12 = self;
    unsigned __int8 v13 = objc_msgSend(v9, sel_hasDetailsActionFor_item_, v12, v11);
  }
  else
  {
    unsigned __int8 v13 = 0;
  }
  swift_unknownObjectRelease();
  return v13;
}

- (id)detailsViewControllerForPresentationCoordinator:(id)a3 item:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  uint64_t v9 = (void *)sub_1BE500DD0(v7);

  return v9;
}

- (HUContainedAccessoryElementsGridViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (HUContainedAccessoryElementsGridViewController *)_swift_stdlib_reportUnimplementedInitializer();
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
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUContainedAccessoryElementsGridViewController____lazy_storage___collectionLayoutManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUContainedAccessoryElementsGridViewController_serviceContainingItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUContainedAccessoryElementsGridViewController_mediaItem));
  sub_1BE37E904((uint64_t)self + OBJC_IVAR___HUContainedAccessoryElementsGridViewController_serviceGridDelegate);
  swift_release();

  swift_release();
}

- (id)displayedItemsInSection:(id)a3
{
  sub_1BE9C49F8();
  id v4 = self;
  id v5 = [(HUItemCollectionViewController *)v4 itemManager];
  id v6 = [(HUItemCollectionViewController *)v4 itemManager];
  id v7 = (void *)sub_1BE9C49B8();
  id v8 = [(HFItemManager *)v6 sectionIndexForDisplayedSectionIdentifier:v7];

  id v9 = [(HFItemManager *)v5 displayedItemsInSection:v8];
  sub_1BE37E9E8(0, (unint64_t *)&qword_1EBA46790);
  sub_1BE9C4C18();

  swift_bridgeObjectRelease();
  id v10 = (void *)sub_1BE9C4BF8();
  swift_bridgeObjectRelease();

  return v10;
}

- (BOOL)shouldShowHeaderForSection:(id)a3
{
  return 1;
}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = ContainedAccessoryElementsGridViewController.finishPresentation(_:animated:)(v6, a4);

  return v8;
}

- (void)doneWithSender:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_1BE9C5638();
  swift_unknownObjectRelease();
  id v5 = (Class *)((char *)&v4->super.super.super.super.super.super.super.isa
               + OBJC_IVAR___HUContainedAccessoryElementsGridViewController_presentationDelegate);
  swift_beginAccess();
  if (*v5)
  {
    id v6 = (HUContainedAccessoryElementsGridViewController *)objc_msgSend((id)swift_unknownObjectRetain(), sel_finishPresentation_animated_, v4, 1);

    swift_unknownObjectRelease();
    id v4 = v6;
  }

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
}

- (void)editWithSender:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_1BE9C5638();
  swift_unknownObjectRelease();
  sub_1BE4FF454();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

@end