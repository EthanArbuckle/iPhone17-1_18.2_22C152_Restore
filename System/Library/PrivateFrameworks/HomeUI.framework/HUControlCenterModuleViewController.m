@interface HUControlCenterModuleViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)accessAllowedForCurrentLockState;
- (BOOL)allowsCharacteristicNotifications;
- (BOOL)canDismissPresentedContent;
- (BOOL)canReorderItemAtIndexPath:(id)a3;
- (BOOL)hasDetailsActionForPresentationCoordinator:(id)a3 item:(id)a4;
- (BOOL)interpretsLocationAsContent:(CGPoint)a3 inView:(id)a4;
- (BOOL)presentationCoordinator:(id)a3 shouldBeginLongPressPresentationWithContext:(id)a4;
- (BOOL)presentationCoordinator:(id)a3 shouldBeginPresentationWithContext:(id)a4;
- (BOOL)promptsForUserConfiguration;
- (BOOL)providesOwnPlatter;
- (BOOL)shouldPerformClickInteraction;
- (BOOL)shouldPerformHoverInteraction;
- (BOOL)shouldShowHeaderForSection:(id)a3;
- (BOOL)shouldUseCompactContentFrameForExpandedContent;
- (BOOL)wantsConfigurationIntent;
- (CCUIModuleContentMetrics)contentMetrics;
- (CGSize)overrideContentSize;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUControlCenterModuleViewController)initWithDelegate:(id)a3 ofKind:(int64_t)a4 itemManager:(id)a5 withPreviews:(id)a6;
- (HUControlCenterModuleViewController)initWithDelegate:(id)a3 ofKind:(int64_t)a4 withPreviews:(id)a5;
- (HUControlCenterModuleViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4;
- (HUControlCenterModuleViewControllerDelegate)delegate;
- (INIntent)defaultConfigurationIntent;
- (NSString)debugDescription;
- (NSString)fullDescription;
- (double)compactContinuousCornerRadius;
- (double)preferredExpandedContentHeight;
- (double)preferredExpandedContentWidth;
- (id)displayedItemsInSection:(id)a3;
- (id)initUsingCompositionalLayoutWithItemManager:(id)a3;
- (id)layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4;
- (id)prepareToPerformToggleActionForItem:(id)a3 sourceItem:(id)a4;
- (id)presentAccessoryControlsForItem:(id)a3;
- (id)transform:(id)a3;
- (int64_t)gridSizeClass;
- (int64_t)kind;
- (unint64_t)contentRenderingMode;
- (void)accessoryControlViewControllerFor:(HFAccessoryRepresentableItem *)a3 tileItem:(HFItem *)a4 completionHandler:(id)a5;
- (void)applyGridSizeClass:(int64_t)a3 completionBlock:(id)a4;
- (void)configureCell:(id)a3 forItem:(id)a4;
- (void)dealloc;
- (void)dismissPresentedContentAnimated:(BOOL)a3 completion:(id)a4;
- (void)homeKitDispatcher:(id)a3 manager:(id)a4 didChangeHome:(id)a5;
- (void)itemManagerDidUpdate:(id)a3;
- (void)presentationCoordinatorSendTileInteractionEventOfType:(unint64_t)a3 withPresentationContext:(id)a4 presentationCoordinator:(id)a5;
- (void)setAccessAllowedForCurrentLockState:(BOOL)a3;
- (void)setAllowsCharacteristicNotifications:(BOOL)a3;
- (void)setCompactContinuousCornerRadius:(double)a3;
- (void)setConfigurationIntent:(id)a3;
- (void)setContentMetrics:(id)a3;
- (void)setContentRenderingMode:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setGridSizeClass:(int64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willDismissWithViewController:(id)a3;
- (void)willTransitionToExpandedContentMode:(BOOL)a3;
@end

@implementation HUControlCenterModuleViewController

- (int64_t)kind
{
  return *(int64_t *)((char *)&self->super.super.super.super.super.super.super.isa
                           + OBJC_IVAR___HUControlCenterModuleViewController_kind);
}

- (HUControlCenterModuleViewControllerDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___HUControlCenterModuleViewController_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1C1898E00](v2);

  return (HUControlCenterModuleViewControllerDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)allowsCharacteristicNotifications
{
  v2 = (BOOL *)self + OBJC_IVAR___HUControlCenterModuleViewController_allowsCharacteristicNotifications;
  swift_beginAccess();
  return *v2;
}

- (void)setAllowsCharacteristicNotifications:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___HUControlCenterModuleViewController_allowsCharacteristicNotifications;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)accessAllowedForCurrentLockState
{
  v2 = (BOOL *)self + OBJC_IVAR___HUControlCenterModuleViewController_accessAllowedForCurrentLockState;
  swift_beginAccess();
  return *v2;
}

- (void)setAccessAllowedForCurrentLockState:(BOOL)a3
{
  v4 = self;
  HUControlCenterModuleViewController.accessAllowedForCurrentLockState.setter(a3);
}

- (HUControlCenterModuleViewController)initWithDelegate:(id)a3 ofKind:(int64_t)a4 itemManager:(id)a5 withPreviews:(id)a6
{
  unint64_t v6 = (unint64_t)a6;
  if (a6)
  {
    type metadata accessor for HUControlCenterModulePreview(0);
    unint64_t v6 = sub_1BE9C4C18();
  }
  swift_unknownObjectRetain();
  return (HUControlCenterModuleViewController *)HUControlCenterModuleViewController.init(delegate:of:itemManager:with:)((uint64_t)a3, a4, a5, v6);
}

- (HUControlCenterModuleViewController)initWithDelegate:(id)a3 ofKind:(int64_t)a4 withPreviews:(id)a5
{
  uint64_t v5 = (uint64_t)a5;
  if (a5)
  {
    type metadata accessor for HUControlCenterModulePreview(0);
    uint64_t v5 = sub_1BE9C4C18();
  }
  uint64_t v7 = swift_unknownObjectRetain();
  return (HUControlCenterModuleViewController *)HUControlCenterModuleViewController.init(delegate:of:with:)(v7, a4, v5);
}

- (void)viewDidLoad
{
  v2 = self;
  HUControlCenterModuleViewController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  HUControlCenterModuleViewController.viewWillAppear(_:)(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HUControlCenterModuleViewController;
  v4 = self;
  [(HUControllableItemCollectionViewController *)&v7 viewDidAppear:v3];
  char v5 = sub_1BE4D5614();
  char v6 = *((unsigned char *)&v4->super.super.super.super.super.super.super.isa
       + OBJC_IVAR___HUControlCenterModuleViewController_moduleState);
  *((unsigned char *)&v4->super.super.super.super.super.super.super.isa
  + OBJC_IVAR___HUControlCenterModuleViewController_moduleState) = v5;
  sub_1BE4D4890(v6);
  sub_1BE4D5ADC();
  sub_1BE4D5EB4();
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  HUControlCenterModuleViewController.viewDidDisappear(_:)(a3);
}

- (void)dealloc
{
  BOOL v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_sharedDispatcher);
  objc_msgSend(v5, sel_removeHomeManagerObserver_, v4);

  v6.receiver = v4;
  v6.super_class = (Class)HUControlCenterModuleViewController;
  [(HUControlCenterModuleViewController *)&v6 dealloc];
}

- (void).cxx_destruct
{
  sub_1BE37E904((uint64_t)self + OBJC_IVAR___HUControlCenterModuleViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUControlCenterModuleViewController____lazy_storage___layoutManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUControlCenterModuleViewController_presentedAccessoryControlsViewController));
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUControlCenterModuleViewController_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUControlCenterModuleViewController_supplementalView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUControlCenterModuleViewController_placeholderViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUControlCenterModuleViewController_errorViewController));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR___HUControlCenterModuleViewController_contentMetrics);
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  uint64_t v6 = sub_1BE9C1208();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE9C11B8();
  id v10 = a3;
  v11 = self;
  HUControlCenterModuleViewController.cellClass(for:indexPath:)(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  uint64_t v6 = (UICollectionViewCell *)a3;
  uint64_t v7 = (HFItem *)a4;
  uint64_t v8 = self;
  HUControlCenterModuleViewController.configureCell(_:for:)(v6, v7);
}

- (BOOL)canReorderItemAtIndexPath:(id)a3
{
  uint64_t v3 = sub_1BE9C1208();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE9C11B8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return 0;
}

- (void)itemManagerDidUpdate:(id)a3
{
  uint64_t v4 = (HFItemManager *)a3;
  uint64_t v5 = self;
  HUControlCenterModuleViewController.itemManagerDidUpdate(_:)(v4);
}

- (id)layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4
{
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  uint64_t v8 = HUControlCenterModuleViewController.layoutSection(forSection:layoutEnvironment:)(a3, a4);
  swift_unknownObjectRelease();

  return v8;
}

- (id)displayedItemsInSection:(id)a3
{
  sub_1BE9C49F8();
  uint64_t v4 = self;
  uint64_t v5 = [(HUItemCollectionViewController *)v4 itemManager];
  uint64_t v6 = [(HUItemCollectionViewController *)v4 itemManager];
  uint64_t v7 = (void *)sub_1BE9C49B8();
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
  return 0;
}

- (CGSize)overrideContentSize
{
  v2 = self;
  CGSize v3 = HUControlCenterModuleViewController.overrideContentSize()();

  double width = v3.width;
  double height = v3.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)transform:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = sub_1BE4E1B60(v4);

  return v6;
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginPresentationWithContext:(id)a4
{
  uint64_t v6 = (HUQuickControlPresentationCoordinator *)a3;
  uint64_t v7 = (HUQuickControlPresentationContext *)a4;
  id v8 = self;
  Swift::Bool v9 = HUControlCenterModuleViewController.presentationCoordinator(_:shouldBeginPresentationWith:)(v6, v7);

  return v9;
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginLongPressPresentationWithContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v9 = objc_msgSend(v7, sel_item);
  self;
  BOOL v10 = swift_dynamicCastObjCClass() == 0;

  return v10;
}

- (id)prepareToPerformToggleActionForItem:(id)a3 sourceItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v9 = HUControlCenterModuleViewController.prepareToPerformToggleAction(for:sourceItem:)(v6, v7);

  return v9;
}

- (void)presentationCoordinatorSendTileInteractionEventOfType:(unint64_t)a3 withPresentationContext:(id)a4 presentationCoordinator:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = self;
  id v11 = objc_msgSend(v8, sel_item);
  id v12 = objc_msgSend(v8, sel_tappedArea);
  sub_1BE55E47C(v11, a3, v12);
}

- (BOOL)hasDetailsActionForPresentationCoordinator:(id)a3 item:(id)a4
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)wantsConfigurationIntent
{
  return 1;
}

- (BOOL)promptsForUserConfiguration
{
  return (id)[(HUControlCenterModuleViewController *)self kind] == (id)1;
}

- (INIntent)defaultConfigurationIntent
{
  v2 = self;
  id v3 = HUControlCenterModuleViewController.defaultConfigurationIntent.getter();

  return (INIntent *)v3;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  id v6 = self;
  HUControlCenterModuleViewController.setEditing(_:animated:)(a3, a4);
}

- (void)setConfigurationIntent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  HUControlCenterModuleViewController.setConfigurationIntent(_:)((INIntent)v4);
}

- (double)preferredExpandedContentHeight
{
  v2 = self;
  CCUIScreenBounds();
  CGRectGetWidth(v6);
  CCUIScreenBounds();
  CGRectGetHeight(v7);

  CGSizeMake(v3);
  return v4;
}

- (double)preferredExpandedContentWidth
{
  v2 = self;
  CCUIScreenBounds();
  CGRectGetWidth(v6);
  CCUIScreenBounds();
  CGRectGetHeight(v7);

  CGSizeMake(v3);
  return result;
}

- (BOOL)providesOwnPlatter
{
  return 1;
}

- (BOOL)shouldPerformHoverInteraction
{
  return 0;
}

- (BOOL)shouldPerformClickInteraction
{
  return 0;
}

- (BOOL)shouldUseCompactContentFrameForExpandedContent
{
  return 1;
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  double v4 = self;
  HUControlCenterModuleViewController.willTransition(toExpandedContentMode:)(a3);
}

- (BOOL)interpretsLocationAsContent:(CGPoint)a3 inView:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  CGRect v7 = (UIView *)a4;
  id v8 = self;
  LOBYTE(self) = HUControlCenterModuleViewController.interpretsLocationAsContent(_:in:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v7);

  return self & 1;
}

- (void)dismissPresentedContentAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  CGRect v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    CGRect v6 = (void (*)(void))sub_1BE43BE18;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = self;
  HUControlCenterModuleViewController.dismissPresentedContent(animated:completion:)(v4, v6, v7);
  sub_1BE3B21C0((uint64_t)v6);
}

- (BOOL)canDismissPresentedContent
{
  if (*(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR___HUControlCenterModuleViewController_presentedAccessoryControlsViewController))
    return 1;
  v2 = self;
  id v3 = [(HUControlCenterModuleViewController *)v2 presentedViewController];

  if (v3)
  {

    return 1;
  }
  return 0;
}

- (double)compactContinuousCornerRadius
{
  v2 = (double *)((char *)self + OBJC_IVAR___HUControlCenterModuleViewController_compactContinuousCornerRadius);
  swift_beginAccess();
  return *v2;
}

- (void)setCompactContinuousCornerRadius:(double)a3
{
  uint64_t v5 = (double *)((char *)self + OBJC_IVAR___HUControlCenterModuleViewController_compactContinuousCornerRadius);
  swift_beginAccess();
  double v6 = *v5;
  *uint64_t v5 = a3;
  uint64_t v7 = self;
  sub_1BE4DD0F0(v6);
}

- (CCUIModuleContentMetrics)contentMetrics
{
  v2 = (id *)((char *)&self->super.super.super.super.super.super.super.isa
            + OBJC_IVAR___HUControlCenterModuleViewController_contentMetrics);
  swift_beginAccess();
  return (CCUIModuleContentMetrics *)*v2;
}

- (void)setContentMetrics:(id)a3
{
  BOOL v4 = (void **)((char *)&self->super.super.super.super.super.super.super.isa
               + OBJC_IVAR___HUControlCenterModuleViewController_contentMetrics);
  swift_beginAccess();
  uint64_t v5 = *v4;
  HUControlCenterModuleViewController *v4 = a3;
  id v6 = a3;
}

- (unint64_t)contentRenderingMode
{
  return *((unsigned __int8 *)&self->super.super.super.super.super.super.super.isa
         + OBJC_IVAR___HUControlCenterModuleViewController_isPreviewMode);
}

- (void)setContentRenderingMode:(unint64_t)a3
{
  BOOL v4 = self;
  HUControlCenterModuleViewController.contentRenderingMode.setter(a3);
}

- (int64_t)gridSizeClass
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___HUControlCenterModuleViewController_gridSizeClass);
  swift_beginAccess();
  return *v2;
}

- (void)setGridSizeClass:(int64_t)a3
{
  uint64_t v5 = (int64_t *)((char *)self + OBJC_IVAR___HUControlCenterModuleViewController_gridSizeClass);
  swift_beginAccess();
  *uint64_t v5 = a3;
  id v6 = self;
  sub_1BE4DD954();
}

- (void)applyGridSizeClass:(int64_t)a3 completionBlock:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA46780);
  MEMORY[0x1F4188790](v7 - 8);
  id v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v10 = _Block_copy(a4);
  id v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1BE9C4DD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EA116C30;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EA116C38;
  v14[5] = v13;
  v15 = self;
  sub_1BE5AF20C((uint64_t)v9, (uint64_t)&unk_1EA116C40, (uint64_t)v14);
  swift_release();
}

- (id)presentAccessoryControlsForItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = HUControlCenterModuleViewController.presentAccessoryControls(for:)(v4);

  return v6;
}

- (void)accessoryControlViewControllerFor:(HFAccessoryRepresentableItem *)a3 tileItem:(HFItem *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA46780);
  MEMORY[0x1F4188790](v9 - 8);
  id v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_1BE9C4DD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EA116C20;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
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

- (void)willDismissWithViewController:(id)a3
{
  id v4 = (UIViewController *)a3;
  uint64_t v5 = self;
  HUControlCenterModuleViewController.willDismiss(viewController:)(v4);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = self;
  HUControlCenterModuleViewController.viewWillTransition(to:with:)(a4);
  swift_unknownObjectRelease();
}

- (void)homeKitDispatcher:(id)a3 manager:(id)a4 didChangeHome:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  sub_1BE4E21F4(a5);
}

- (NSString)debugDescription
{
  return (NSString *)sub_1BE4E1274(self, (uint64_t)a2, (void (*)(void))HUControlCenterModuleViewController.debugDescription.getter);
}

- (NSString)fullDescription
{
  return (NSString *)sub_1BE4E1274(self, (uint64_t)a2, (void (*)(void))HUControlCenterModuleViewController.fullDescription.getter);
}

- (HUControlCenterModuleViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double result = (HUControlCenterModuleViewController *)_swift_stdlib_reportUnimplementedInitializer();
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

@end