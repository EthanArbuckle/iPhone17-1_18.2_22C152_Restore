@interface CCUIPagingViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)allowsNestedFoldersForIconDragManager:(id)a3;
- (BOOL)allowsSnappingIconsToGridForIconDragManager:(id)a3;
- (BOOL)canDismissPresentedContent;
- (BOOL)ccui_shouldPropagateAppearanceCalls;
- (BOOL)contentModuleContainerViewController:(id)a3 canBeginInteractionWithModule:(id)a4;
- (BOOL)folderController:(id)a3 canChangeCurrentPageIndexToIndex:(int64_t)a4;
- (BOOL)folderControllerShouldClose:(id)a3 withPinchGesture:(id)a4;
- (BOOL)icon:(id)a3 canReceiveGrabbedIcon:(id)a4;
- (BOOL)iconDragManager:(id)a3 canAcceptDropInSession:(id)a4 inIconListView:(id)a5;
- (BOOL)iconDragManager:(id)a3 canAddDragItemsToSession:(id)a4 fromIconView:(id)a5;
- (BOOL)iconDragManager:(id)a3 canBeginIconDragForIconView:(id)a4;
- (BOOL)iconDragManager:(id)a3 canSnapIconsToGridInLocation:(id)a4;
- (BOOL)iconDragManager:(id)a3 doesIconViewRepresentRealIconPosition:(id)a4;
- (BOOL)iconDragManager:(id)a3 shouldMinimizeLayoutDisruptionInLocation:(id)a4;
- (BOOL)iconView:(id)a3 supportsConfigurationForDataSource:(id)a4;
- (BOOL)iconViewDisplaysLabel:(id)a3;
- (BOOL)iconViewDisplaysResizeHandle:(id)a3;
- (BOOL)interpretsLocationAsContent:(CGPoint)a3 in:(id)a4;
- (BOOL)isEditing;
- (BOOL)isModuleExpandedForIdentifier:(id)a3;
- (BOOL)rootFolder:(id)a3 canBounceIcon:(id)a4;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (CCUIInteractivePaging)interactivePagingCoordinator;
- (CCUIPagingViewController)initWithCoder:(id)a3;
- (CCUIPagingViewController)initWithModuleInstanceManager:(id)a3 moduleSettingsManager:(id)a4 controlIntentStore:(id)a5 controlDescriptorProvider:(id)a6 controlExtensionProvider:(id)a7;
- (CCUIPagingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CCUIPagingViewControllerDelegate)pagingDelegate;
- (CGPoint)additionalContentOffset;
- (CGRect)compactModeFrameForContentModuleContainerViewController:(id)a3;
- (CGRect)iconView:(id)a3 contentBoundingRectForConfigurationInteraction:(id)a4;
- (CGSize)contentLayoutSize;
- (CGSize)controlCenterGridSizeForContentModuleContainerViewController:(id)a3;
- (Class)controllerClassForFolder:(id)a3;
- (SBHIconModel)iconModel;
- (SBIconListView)currentIconlistView;
- (SBIconResizeHandleMetrics)resizeHandleMetricsForIconView:(SEL)a3;
- (UIEdgeInsets)additionalContentInsets;
- (UILongPressGestureRecognizer)longPressToEditGestureRecognizer;
- (UIScrollView)scrollView;
- (UIView)editingAccessoryView;
- (UIView)pageControl;
- (UIView)topmostContentView;
- (double)verticalMarginPercentageForConfigurationOfIconView:(id)a3;
- (id)compactModeSourceViewForContentModuleContainerViewController:(id)a3;
- (id)controlsGalleryViewController:(id)a3 customImageViewControllerForWidgetIcon:(id)a4 withPrimaryAction:(id)a5 contentMetrics:(id)a6;
- (id)controlsGalleryViewController:(id)a3 widgetIconForGalleryItem:(id)a4;
- (id)customApplicationWidgetCollectionsForControlsGalleryViewController:(id)a3;
- (id)customImageViewControllerForIconView:(id)a3;
- (id)draggingDelegateForFolderController:(id)a3;
- (id)draggingDelegateForIconView:(id)a3;
- (id)gridSizeClassDomainForIconView:(id)a3;
- (id)iconDragManager:(id)a3 dragItemsForIconView:(id)a4;
- (id)iconDragManager:(id)a3 dragPreviewForIconView:(id)a4;
- (id)iconListViewForIndexPath:(id)a3;
- (id)iconView:(id)a3 configurationInteractionForDataSource:(id)a4;
- (id)iconView:(id)a3 containerViewForConfigurationInteraction:(id)a4;
- (id)iconViewQueryableForIconDragManager:(void *)a3;
- (id)moduleViewForIdentifier:(id)a3;
- (id)queryAllTopLevelBlockingGestureRecognizers;
- (id)recycledViewsContainerProviderForViewMap:(id)a3;
- (id)resizeGestureHandlerForIconView:(id)a3;
- (id)rootFolderForIconDragManager:(id)a3;
- (id)rootViewForIconDragManager:(id)a3;
- (id)windowForIconDragPreviewsForIconDragManager:(id)a3 forWindowScene:(id)a4;
- (int64_t)closeBoxTypeForIconView:(id)a3;
- (int64_t)expandedModuleCount;
- (int64_t)iconView:(id)a3 userInterfaceStyleForConfigurationInteraction:(id)a4;
- (unint64_t)listGridCellInfoOptionsForIconDragManager:(id)a3;
- (unint64_t)moduleRowCount;
- (unint64_t)pageCount;
- (unint64_t)viewMap:(id)a3 maxRecycledViewsOfClass:(Class)a4;
- (void)addIfNecessaryAndScrollToControlMatchingDescriptor:(id)a3 animated:(BOOL)a4;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)changeGridSizeClassOfIcon:(id)a3 toGridSizeClass:(id)a4;
- (void)contentModuleContainerViewController:(id)a3 didCloseExpandedModule:(id)a4;
- (void)contentModuleContainerViewController:(id)a3 didOpenExpandedModule:(id)a4;
- (void)contentModuleContainerViewController:(id)a3 willCloseExpandedModule:(id)a4;
- (void)contentModuleContainerViewController:(id)a3 willDismissViewController:(id)a4;
- (void)contentModuleContainerViewController:(id)a3 willOpenExpandedModule:(id)a4;
- (void)contentModuleContainerViewController:(id)a3 willPresentViewController:(id)a4;
- (void)contentModuleContainerViewControllerDismissPresentedContent:(id)a3;
- (void)controlsGalleryViewController:(id)a3 didFinishWithResult:(id)a4 error:(id)a5;
- (void)controlsGalleryViewController:(id)a3 didFinishWithWidgetIcon:(id)a4;
- (void)controlsGalleryViewControllerDidDismiss:(id)a3;
- (void)controlsGalleryViewControllerWillDismiss:(id)a3;
- (void)controlsGalleryViewControllerWillPresent:(id)a3;
- (void)dealloc;
- (void)dismissExpandedModuleAnimated:(BOOL)a3 completion:(id)a4;
- (void)dismissPresentedContentAnimated:(BOOL)a3 completion:(id)a4;
- (void)displayWillTurnOff;
- (void)enumerateDisplayedModuleViewsWithBlock:(id)a3;
- (void)expandModuleWithIdentifier:(id)a3;
- (void)expandModuleWithIdentifier:(id)a3 uniqueIdentifier:(id)a4;
- (void)extensionsDidChangeForExtensionProvider:(id)a3;
- (void)folder:(id)a3 didAddIcons:(id)a4 removedIcons:(id)a5;
- (void)folderControllerDidEndScrolling:(id)a3;
- (void)folderControllerWillBeginScrolling:(id)a3;
- (void)handleIconElementRequest:(id)a3 completionHandler:(id)a4;
- (void)iconCloseBoxTapped:(id)a3;
- (void)iconDragManager:(id)a3 iconView:(id)a4 willAnimateDragLiftWithAnimator:(id)a5 session:(id)a6;
- (void)iconDragManager:(id)a3 iconView:(id)a4 willBeginDragSession:(id)a5;
- (void)iconDragManagerIconDraggingDidChange:(id)a3;
- (void)iconDragManagerUserActiveIconDraggingDidChange:(id)a3;
- (void)iconTapped:(id)a3;
- (void)iconView:(id)a3 configurationDidEndWithInteraction:(id)a4;
- (void)iconView:(id)a3 configurationDidUpdateWithInteraction:(id)a4;
- (void)iconView:(id)a3 configurationWillBeginWithInteraction:(id)a4;
- (void)layoutIconListsWithAnimationType:(int64_t)a3 forceRelayout:(BOOL)a4;
- (void)requestIconElementStateForRequest:(id)a3 completionHandler:(id)a4;
- (void)resetEndEditingTimerIfNecessary;
- (void)resetToDefaultLayout;
- (void)scrollToDefaultPageAnimated:(BOOL)a3 completion:(id)a4;
- (void)setAdditionalContentInsets:(UIEdgeInsets)a3;
- (void)setAdditionalContentOffset:(CGPoint)a3;
- (void)setContextDelegate:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setIconModel:(id)a3;
- (void)setLongPressToEditGestureRecognizer:(id)a3;
- (void)setPagingDelegate:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willBecomeActive;
- (void)willResignActive;
@end

@implementation CCUIPagingViewController

- (CCUIPagingViewController)initWithModuleInstanceManager:(id)a3 moduleSettingsManager:(id)a4 controlIntentStore:(id)a5 controlDescriptorProvider:(id)a6 controlExtensionProvider:(id)a7
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v10 = a7;
  sub_1D7BB76C8();
  swift_unknownObjectRelease();
  sub_1D7BB76C8();
  swift_unknownObjectRelease();
  v11 = sub_1D7B95750((uint64_t)v14, (uint64_t)&v13, (uint64_t)a5, (uint64_t)a6, v10);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return (CCUIPagingViewController *)v11;
}

- (CCUIPagingViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1D7B960BC();
}

- (void)dealloc
{
  v2 = self;
  sub_1D7B84D84();
  v4 = v3;
  objc_msgSend(v3, sel_removeKeyObserver_, v2);

  v5 = *(Class *)((char *)&v2->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController_apSubjectMonitorSubscription);
  if (v5)
  {
    objc_msgSend(v5, sel_invalidate);
    v6.receiver = v2;
    v6.super_class = (Class)type metadata accessor for PagingViewController();
    [(CCUIPagingViewController *)&v6 dealloc];
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  sub_1D7B63530((uint64_t)self + OBJC_IVAR___CCUIPagingViewController_pagingDelegate);
  swift_unknownObjectWeakDestroy();

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CCUIPagingViewController____lazy_storage___iconEditingSettings));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CCUIPagingViewController____lazy_storage___iconResizeHandleSettings));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CCUIPagingViewController____lazy_storage___smallIconResizeHandleSettings));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CCUIPagingViewController____lazy_storage___editingFeedbackGenerator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CCUIPagingViewController____lazy_storage___editingNotificationFeedbackGenerator));

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CCUIPagingViewController_controlExtensionProvider));

  sub_1D7B63530((uint64_t)self + OBJC_IVAR___CCUIPagingViewController_contextDelegate);
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CCUIPagingViewController_expandedViewControllers));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CCUIPagingViewController_expandedViewControllersDispatchGroup));
  swift_unknownObjectWeakDestroy();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CCUIPagingViewController_overrideIconImageViewControllersByDataSource));
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___CCUIPagingViewController____lazy_storage___moduleContentMetrics);
}

- (CCUIPagingViewControllerDelegate)pagingDelegate
{
  return (CCUIPagingViewControllerDelegate *)sub_1D7B7E110((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CCUIPagingViewController_pagingDelegate);
}

- (void)setPagingDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRetain();
  v4 = self;
  sub_1D7B8AED8();
  sub_1D7B8AFF4();
  int v5 = MKBGetDeviceLockState();
  if (v5 == 3 || !v5) {
    sub_1D7B8D488();
  }

  swift_unknownObjectRelease();
}

- (void)setContextDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  swift_dynamicCastObjCProtocolUnconditional();
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
}

- (UIScrollView)scrollView
{
  v2 = self;
  [(CCUIPagingViewController *)v2 loadViewIfNeeded];
  result = *(UIScrollView **)((char *)&v2->super.super.super.isa
                            + OBJC_IVAR___CCUIPagingViewController___rootFolderController);
  if (result)
  {
    id v4 = [(UIScrollView *)result folderView];
    id v5 = objc_msgSend(v4, sel_scrollView);

    return (UIScrollView *)v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (SBIconListView)currentIconlistView
{
  return (SBIconListView *)sub_1D7B7E9A8(self, (uint64_t)a2, (SEL *)&selRef_currentIconListView);
}

- (UIView)pageControl
{
  return (UIView *)sub_1D7B7E9A8(self, (uint64_t)a2, (SEL *)&selRef_pageControl);
}

- (UIView)editingAccessoryView
{
  v2 = self;
  [(CCUIPagingViewController *)v2 loadViewIfNeeded];
  result = *(UIView **)((char *)&v2->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController_addButton);
  if (result)
  {
    id v4 = result;

    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (unint64_t)pageCount
{
  v2 = self;
  [(CCUIPagingViewController *)v2 loadViewIfNeeded];
  unint64_t result = *(unint64_t *)((char *)&v2->super.super.super.isa
                               + OBJC_IVAR___CCUIPagingViewController___rootFolderController);
  if (result)
  {
    id v4 = objc_msgSend((id)result, sel_iconListViewCount);

    return (unint64_t)v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (CGSize)contentLayoutSize
{
  v2 = self;
  [(CCUIPagingViewController *)v2 loadViewIfNeeded];
  id v5 = *(Class *)((char *)&v2->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController___rootFolderController);
  if (v5)
  {
    id v6 = objc_msgSend(v5, sel_folderView);
    sub_1D7BA6100();
    double v8 = v7;
    double v10 = v9;

    double v3 = v8;
    double v4 = v10;
  }
  else
  {
    __break(1u);
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (UIEdgeInsets)additionalContentInsets
{
  v2 = self;
  [(CCUIPagingViewController *)v2 loadViewIfNeeded];
  double v7 = *(Class *)((char *)&v2->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController___rootFolderController);
  if (v7)
  {
    double v8 = (char *)objc_msgSend(v7, sel_folderView);
    double v9 = *(double *)&v8[OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_additionalLayoutInsets];
    double v10 = *(double *)&v8[OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_additionalLayoutInsets + 8];
    double v11 = *(double *)&v8[OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_additionalLayoutInsets + 16];
    double v12 = *(double *)&v8[OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_additionalLayoutInsets + 24];

    double v3 = v9;
    double v4 = v10;
    double v5 = v11;
    double v6 = v12;
  }
  else
  {
    __break(1u);
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)setAdditionalContentInsets:(UIEdgeInsets)a3
{
  CGFloat right = a3.right;
  CGFloat bottom = a3.bottom;
  CGFloat left = a3.left;
  CGFloat top = a3.top;
  double v7 = self;
  sub_1D7B7DAC4(top, left, bottom, right);
}

- (CGPoint)additionalContentOffset
{
  v2 = self;
  [(CCUIPagingViewController *)v2 loadViewIfNeeded];
  double v5 = *(Class *)((char *)&v2->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController___rootFolderController);
  if (v5)
  {
    double v6 = (char *)objc_msgSend(v5, sel_folderView);
    double v7 = *(double *)&v6[OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_additionalLayoutOffset];
    double v8 = *(double *)&v6[OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_additionalLayoutOffset + 8];

    double v3 = v7;
    double v4 = v8;
  }
  else
  {
    __break(1u);
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)setAdditionalContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v5 = self;
  sub_1D7B7DEDC(x, y);
}

- (UILongPressGestureRecognizer)longPressToEditGestureRecognizer
{
  return (UILongPressGestureRecognizer *)sub_1D7B7E110((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CCUIPagingViewController_longPressToEditGestureRecognizer);
}

- (void)setLongPressToEditGestureRecognizer:(id)a3
{
  swift_beginAccess();
  uint64_t v5 = swift_unknownObjectWeakAssign();
  uint64_t v6 = MEMORY[0x1D947FB60](v5);
  if (v6)
  {
    double v7 = (void *)v6;
    id v8 = a3;
    double v9 = self;
    sub_1D7B84D84();
    double v11 = v10;
    objc_msgSend(v10, sel_longPressToEditDuration);
    double v13 = v12;

    objc_msgSend(v7, sel_setMinimumPressDuration_, v13);
  }
}

- (BOOL)canDismissPresentedContent
{
  v2 = self;
  char v3 = sub_1D7B7E568();

  return v3 & 1;
}

- (UIView)topmostContentView
{
  v2 = self;
  CGPoint result = (UIView *)[(CCUIPagingViewController *)v2 loadViewIfNeeded];
  double v4 = *(Class *)((char *)&v2->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController___rootFolderController);
  if (v4)
  {
    id v5 = v4;
    sub_1D7B710AC();
    double v7 = v6;

    return (UIView *)v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (BOOL)interpretsLocationAsContent:(CGPoint)a3 in:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = self;
  BOOL result = [(CCUIPagingViewController *)v8 loadViewIfNeeded];
  double v10 = *(Class *)((char *)&v8->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController___rootFolderController);
  if (v10)
  {
    id v11 = v10;
    char v12 = sub_1D7B71698(v7, x, y);

    return v12 & 1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)queryAllTopLevelBlockingGestureRecognizers
{
  v2 = self;
  id result = [(CCUIPagingViewController *)v2 loadViewIfNeeded];
  double v4 = *(Class *)((char *)&v2->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController___rootFolderController);
  if (v4)
  {
    id v5 = v4;
    sub_1D7B7184C();

    sub_1D7B2170C(0, (unint64_t *)&unk_1EBDFF950);
    uint64_t v6 = (void *)sub_1D7BB72E8();
    swift_bridgeObjectRelease();
    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (CCUIInteractivePaging)interactivePagingCoordinator
{
  return (CCUIInteractivePaging *)sub_1D7B7E9A8(self, (uint64_t)a2, (SEL *)&selRef_folderView);
}

- (void)scrollToDefaultPageAnimated:(BOOL)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    uint64_t v6 = sub_1D7B9AA4C;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = self;
  sub_1D7B7EA88(a3, v6, v7);
  sub_1D7B65FA0((uint64_t)v6);
}

- (void)willBecomeActive
{
  v2 = self;
  sub_1D7B7EC78();
}

- (void)willResignActive
{
  v2 = self;
  sub_1D7B7ECFC();
}

- (void)displayWillTurnOff
{
  v2 = self;
  sub_1D7B7EEBC();
}

- (unint64_t)moduleRowCount
{
  v2 = self;
  [(CCUIPagingViewController *)v2 loadViewIfNeeded];
  unint64_t result = *(unint64_t *)((char *)&v2->super.super.super.isa
                               + OBJC_IVAR___CCUIPagingViewController___rootFolderController);
  if (result)
  {
    double v4 = (CCUIPagingViewController *)objc_msgSend((id)result, sel_currentIconListModel);
    if (v4)
    {
      id v5 = v4;
      id v6 = [(CCUIPagingViewController *)v4 numberOfUsedRows];

      v2 = v5;
    }
    else
    {
      id v6 = 0;
    }

    return (unint64_t)v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)moduleViewForIdentifier:(id)a3
{
  uint64_t v4 = sub_1D7BB7258();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  id v8 = sub_1D7B7F170(v4, v6);

  swift_bridgeObjectRelease();

  return v8;
}

- (int64_t)expandedModuleCount
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController_expandedViewControllers);
  char v3 = self;
  id v4 = objc_msgSend(v2, sel_allObjects);
  sub_1D7B2170C(0, &qword_1EBDFF9C8);
  unint64_t v5 = sub_1D7BB72F8();

  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    int64_t v6 = sub_1D7BB78C8();

    swift_bridgeObjectRelease();
  }
  else
  {
    int64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  return v6;
}

- (BOOL)isModuleExpandedForIdentifier:(id)a3
{
  uint64_t v4 = sub_1D7BB7258();
  uint64_t v6 = v5;
  uint64_t v7 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController_expandedViewControllers);
  id v8 = self;
  id v9 = objc_msgSend(v7, sel_allObjects);
  sub_1D7B2170C(0, &qword_1EBDFF9C8);
  unint64_t v10 = sub_1D7BB72F8();

  swift_bridgeObjectRetain();
  LOBYTE(v4) = sub_1D7B94F08(v10, v4, v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

- (void)expandModuleWithIdentifier:(id)a3
{
  uint64_t v4 = sub_1D7BB7258();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  sub_1D7B7F780(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)expandModuleWithIdentifier:(id)a3 uniqueIdentifier:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDFF6C8);
  MEMORY[0x1F4188790](v6 - 8);
  id v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1D7BB7258();
  uint64_t v11 = v10;
  if (a4)
  {
    sub_1D7BB6B58();
    uint64_t v12 = sub_1D7BB6B78();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v8, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = sub_1D7BB6B78();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v8, 1, 1, v13);
  }
  v14 = self;
  sub_1D7B7FA20(v9, v11, (uint64_t)v8);

  swift_bridgeObjectRelease();
  sub_1D7B9A768((uint64_t)v8, &qword_1EBDFF6C8);
}

- (void)enumerateDisplayedModuleViewsWithBlock:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_1D7B96408((void (**)(uint64_t, void *))v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)dismissExpandedModuleAnimated:(BOOL)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    uint64_t v6 = sub_1D7B9AA4C;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = self;
  sub_1D7B80768(a3, v6, v7);
  sub_1D7B65FA0((uint64_t)v6);
}

- (void)dismissPresentedContentAnimated:(BOOL)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    uint64_t v6 = sub_1D7B9A128;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = self;
  sub_1D7B80F68(a3, v6, v7);
  sub_1D7B65FA0((uint64_t)v6);
}

- (SBHIconModel)iconModel
{
  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController_iconModel);
  swift_beginAccess();
  return (SBHIconModel *)*v2;
}

- (void)setIconModel:(id)a3
{
  uint64_t v4 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController_iconModel);
  swift_beginAccess();
  uint64_t v5 = *v4;
  void *v4 = a3;
  id v6 = a3;
}

- (void)addIfNecessaryAndScrollToControlMatchingDescriptor:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = self;
  sub_1D7B81694(v6, v4);
}

- (void)resetToDefaultLayout
{
  v2 = self;
  sub_1D7B82E18();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1D7B83088();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v4 = self;
  sub_1D7B84308(a3);
}

- (void)viewIsAppearing:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PagingViewController();
  id v4 = v5.receiver;
  [(CCUIPagingViewController *)&v5 viewIsAppearing:v3];
  sub_1D7B8855C();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PagingViewController();
  id v4 = v7.receiver;
  [(CCUIPagingViewController *)&v7 viewDidAppear:v3];
  id v5 = objc_msgSend(self, sel_sharedInstance, v7.receiver, v7.super_class);
  if (v5)
  {
    id v6 = v5;
    objc_msgSend(v5, sel_incrementUserInvocationCount);
  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_1D7B84634(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  sub_1D7B8493C(a3);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1D7B84C2C();
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)ccui_shouldPropagateAppearanceCalls
{
  return 1;
}

- (BOOL)isEditing
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController__isEditing);
}

- (void)setEditing:(BOOL)a3
{
  id v4 = self;
  sub_1D7B85AB8(a3);
}

- (void)resetEndEditingTimerIfNecessary
{
  v2 = self;
  _s15ControlCenterUI20PagingViewControllerC15iconDragManager_0gE0011willAnimateH16LiftWithAnimator7sessionySo06SBIconhI0C_So0pE0CSo15UIDragAnimating_pSo0Q7Session_ptF_0();
}

- (void)changeGridSizeClassOfIcon:(id)a3 toGridSizeClass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1D7B8CE40((uint64_t)v6, (uint64_t)v7);
}

- (CCUIPagingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  unint64_t result = (CCUIPagingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (a4) {
    sub_1D7BB7258();
  }
  id v6 = (char *)self + OBJC_IVAR___CCUIPagingViewController_longPressToEditGestureRecognizer;
  swift_beginAccess();
  id v7 = (void *)MEMORY[0x1D947FB60](v6);
  id v8 = a3;
  if (v7)
  {
    uint64_t v9 = self;
    sub_1D7B84D84();
    uint64_t v11 = v10;
    objc_msgSend(v10, sel_longPressToEditDuration);
    double v13 = v12;

    objc_msgSend(v7, sel_setMinimumPressDuration_, v13);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (CGSize)controlCenterGridSizeForContentModuleContainerViewController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  _s15ControlCenterUI20PagingViewControllerC07controlB8GridSize3forSo6CGSizeVSo026CCUIContentModuleContainereF0C_tF_0();
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (id)compactModeSourceViewForContentModuleContainerViewController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = _s15ControlCenterUI20PagingViewControllerC017compactModeSourceE03forSo6UIViewCSgSo026CCUIContentModuleContainereF0C_tF_0(v4);

  return v6;
}

- (CGRect)compactModeFrameForContentModuleContainerViewController:(id)a3
{
  id v4 = (CCUIContentModuleContainerViewController *)a3;
  id v5 = self;
  __C::CGRect v14 = PagingViewController.compactModeFrame(for:)(v4);
  CGFloat x = v14.origin.x;
  CGFloat y = v14.origin.y;
  CGFloat width = v14.size.width;
  CGFloat height = v14.size.height;

  double v10 = x;
  double v11 = y;
  double v12 = width;
  double v13 = height;
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v12;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v10;
  return result;
}

- (BOOL)contentModuleContainerViewController:(id)a3 canBeginInteractionWithModule:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  id v6 = self;
  if ([(CCUIPagingViewController *)v6 isEditing])
  {
    swift_unknownObjectRelease();

    BOOL v7 = 0;
  }
  else
  {
    id v8 = objc_msgSend(*(id *)((char *)&v6->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController_expandedViewControllers), sel_allObjects);
    sub_1D7B2170C(0, &qword_1EBDFF9C8);
    unint64_t v9 = sub_1D7BB72F8();

    if (v9 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v10 = sub_1D7BB78C8();
      swift_unknownObjectRelease();

      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_unknownObjectRelease();
    }
    swift_bridgeObjectRelease();
    BOOL v7 = v10 == 0;
  }

  return v7;
}

- (void)contentModuleContainerViewController:(id)a3 willOpenExpandedModule:(id)a4
{
}

- (void)contentModuleContainerViewController:(id)a3 didOpenExpandedModule:(id)a4
{
  id v6 = (char *)self + OBJC_IVAR___CCUIPagingViewController_pagingDelegate;
  swift_beginAccess();
  uint64_t v7 = MEMORY[0x1D947FB60](v6);
  if (v7)
  {
    id v8 = (void *)v7;
    id v9 = a3;
    swift_unknownObjectRetain();
    uint64_t v10 = self;
    objc_msgSend(v8, sel_pagingViewController_didExpand_, v10, v9);

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
}

- (void)contentModuleContainerViewController:(id)a3 willCloseExpandedModule:(id)a4
{
  id v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController_expandedViewControllers);
  id v6 = a3;
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  objc_msgSend(v5, sel_removeObject_, v6);
  id v8 = (char *)v7 + OBJC_IVAR___CCUIPagingViewController_pagingDelegate;
  swift_beginAccess();
  id v9 = (void *)MEMORY[0x1D947FB60](v8);
  if (v9)
  {
    objc_msgSend(v9, sel_pagingViewController_willClose_, v7, v6);
    swift_unknownObjectRelease();
  }
  sub_1D7B88084(0, v6);

  swift_unknownObjectRelease();
}

- (void)contentModuleContainerViewController:(id)a3 didCloseExpandedModule:(id)a4
{
}

- (void)contentModuleContainerViewController:(id)a3 willPresentViewController:(id)a4
{
}

- (void)contentModuleContainerViewController:(id)a3 willDismissViewController:(id)a4
{
}

- (void)contentModuleContainerViewControllerDismissPresentedContent:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1D7B80F68(1, 0, 0);
}

- (unint64_t)viewMap:(id)a3 maxRecycledViewsOfClass:(Class)a4
{
  return *(unint64_t *)((char *)&self->super.super.super.isa
                             + OBJC_IVAR___CCUIPagingViewController_maximumNumberOfIconViewsInHierarchy);
}

- (id)recycledViewsContainerProviderForViewMap:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id result = [(CCUIPagingViewController *)v5 view];
  if (result)
  {
    id v7 = result;
    id v8 = objc_msgSend(result, sel_window);

    if (v8)
    {
      id v9 = (void *)swift_dynamicCastObjCProtocolConditional();

      if (!v9) {
    }
      }
    else
    {

      id v9 = 0;
    }
    return v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (Class)controllerClassForFolder:(id)a3
{
  type metadata accessor for IconListFolderController();

  return (Class)swift_getObjCClassFromMetadata();
}

- (BOOL)folderController:(id)a3 canChangeCurrentPageIndexToIndex:(int64_t)a4
{
  return 1;
}

- (BOOL)folderControllerShouldClose:(id)a3 withPinchGesture:(id)a4
{
  return 0;
}

- (void)folderControllerWillBeginScrolling:(id)a3
{
  id v4 = a3;
  id v6 = self;
  sub_1D7B86DFC(0x63537265646C6F66, 0xEF676E696C6C6F72);
  id v5 = *(Class *)((char *)&v6->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController_iconDragManager);
  if (v5)
  {
    objc_msgSend(v5, sel_noteFolderBeganScrolling);
  }
  else
  {
    __break(1u);
  }
}

- (void)folderControllerDidEndScrolling:(id)a3
{
  id v5 = (void **)((char *)self + OBJC_IVAR___CCUIPagingViewController_endEditingTimerSuppressionReasons);
  swift_beginAccess();
  uint64_t v6 = sub_1D7B86F0C(0x63537265646C6F66, 0xEF676E696C6C6F72, *v5);
  if (v7)
  {
    id v11 = a3;
    double v12 = self;
  }
  else
  {
    unint64_t v8 = v6;
    swift_beginAccess();
    id v9 = a3;
    uint64_t v10 = self;
    sub_1D7B86FF4(v8);
    swift_endAccess();
    swift_bridgeObjectRelease();
  }
  _s15ControlCenterUI20PagingViewControllerC15iconDragManager_0gE0011willAnimateH16LiftWithAnimator7sessionySo06SBIconhI0C_So0pE0CSo15UIDragAnimating_pSo0Q7Session_ptF_0();
}

- (id)draggingDelegateForFolderController:(id)a3
{
  id result = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController_iconDragManager);
  if (result) {
    return result;
  }
  __break(1u);
  return result;
}

- (id)customImageViewControllerForIconView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = PagingViewController.customImageViewController(for:)(v4);

  return v6;
}

- (id)draggingDelegateForIconView:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR___CCUIPagingViewController_iconDragManager));
}

- (BOOL)icon:(id)a3 canReceiveGrabbedIcon:(id)a4
{
  return 0;
}

- (BOOL)iconViewDisplaysLabel:(id)a3
{
  return 0;
}

- (BOOL)iconViewDisplaysResizeHandle:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = objc_msgSend(v4, sel_icon);
  if (v6)
  {
    char v7 = v6;
    unsigned __int8 v8 = objc_msgSend(v6, sel_isPlaceholder);

    return v8 ^ 1;
  }
  else
  {

    return 1;
  }
}

- (SBIconResizeHandleMetrics)resizeHandleMetricsForIconView:(SEL)a3
{
  id v6 = a4;
  char v7 = self;
  PagingViewController.resizeHandleMetrics(for:)(v6, (uint64_t)v14);
  double v8 = v15;
  int64_t v9 = v16;

  long long v11 = v14[1];
  long long v12 = v17;
  long long v13 = v18;
  *(_OWORD *)&retstr->var0 = v14[0];
  *(_OWORD *)&retstr->var2 = v11;
  retstr->var4 = v8;
  retstr->var5 = v9;
  *(_OWORD *)&retstr->var6.CGFloat top = v12;
  *(_OWORD *)&retstr->var6.CGFloat bottom = v13;
  return result;
}

- (id)resizeGestureHandlerForIconView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = PagingViewController.resizeGestureHandler(for:)(v4);

  return v6;
}

- (int64_t)closeBoxTypeForIconView:(id)a3
{
  return 1;
}

- (id)gridSizeClassDomainForIconView:(id)a3
{
  id v3 = objc_msgSend(self, sel_controlCenterDomain);

  return v3;
}

- (void)iconTapped:(id)a3
{
  id v4 = a3;
  id v5 = self;
  PagingViewController.iconTapped(_:)(v4);
}

- (void)iconCloseBoxTapped:(id)a3
{
  id v4 = (CCUIPagingViewController *)a3;
  char v7 = self;
  if ([(CCUIPagingViewController *)v7 isEditing])
  {
    id v5 = (CCUIPagingViewController *)[(CCUIPagingViewController *)v4 icon];
    if (v5)
    {
      id v6 = v5;
      sub_1D7B870D4((uint64_t)v5);
      _s15ControlCenterUI20PagingViewControllerC15iconDragManager_0gE0011willAnimateH16LiftWithAnimator7sessionySo06SBIconhI0C_So0pE0CSo15UIDragAnimating_pSo0Q7Session_ptF_0();

      id v4 = v7;
      char v7 = v6;
    }
  }
}

- (BOOL)iconView:(id)a3 supportsConfigurationForDataSource:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  id v6 = self;
  char v7 = sub_1D7B97518();

  swift_unknownObjectRelease();
  return v7 & 1;
}

- (int64_t)iconView:(id)a3 userInterfaceStyleForConfigurationInteraction:(id)a4
{
  return 2;
}

- (id)iconView:(id)a3 configurationInteractionForDataSource:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  id v6 = self;
  id v7 = PagingViewController.iconView(_:configurationInteractionFor:)(v5);

  swift_unknownObjectRelease();

  return v7;
}

- (id)iconView:(id)a3 containerViewForConfigurationInteraction:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  id v6 = self;
  id result = [(CCUIPagingViewController *)v6 view];
  if (result)
  {
    id v8 = result;

    swift_unknownObjectRelease();
    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (CGRect)iconView:(id)a3 contentBoundingRectForConfigurationInteraction:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  id v6 = self;
  id v7 = [(CCUIPagingViewController *)v6 view];
  if (v7)
  {
    long long v12 = v7;
    objc_msgSend(v7, sel_bounds);
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;

    swift_unknownObjectRelease();
    double v8 = v14;
    double v9 = v16;
    double v10 = v18;
    double v11 = v20;
  }
  else
  {
    __break(1u);
  }
  result.size.CGFloat height = v11;
  result.size.CGFloat width = v10;
  result.origin.CGFloat y = v9;
  result.origin.CGFloat x = v8;
  return result;
}

- (double)verticalMarginPercentageForConfigurationOfIconView:(id)a3
{
  return 0.2;
}

- (void)iconView:(id)a3 configurationDidUpdateWithInteraction:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  id v7 = self;
  PagingViewController.iconView(_:configurationDidUpdateWith:)(v6, a4);

  swift_unknownObjectRelease();
}

- (void)iconView:(id)a3 configurationWillBeginWithInteraction:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  id v6 = self;
  sub_1D7B86DFC(0xD00000000000001FLL, 0x80000001D7BC57F0);
  swift_unknownObjectWeakAssign();

  swift_unknownObjectRelease();
}

- (void)iconView:(id)a3 configurationDidEndWithInteraction:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  id v6 = self;
  _s15ControlCenterUI20PagingViewControllerC04iconE0_23configurationDidEndWithySo06SBIconE0C_So07SBHIconE24ConfigurationInteraction_ptF_0();

  swift_unknownObjectRelease();
}

- (BOOL)iconDragManager:(id)a3 canBeginIconDragForIconView:(id)a4
{
  return [(CCUIPagingViewController *)self isEditing];
}

- (BOOL)iconDragManager:(id)a3 canAcceptDropInSession:(id)a4 inIconListView:(id)a5
{
  return 1;
}

- (id)iconDragManager:(id)a3 dragItemsForIconView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self;
  id result = objc_msgSend(v7, sel_icon);
  if (result)
  {
    id v10 = result;
    double v11 = (void *)sub_1D7BB7228();
    id v12 = (id)SBHIconDragItemWithIconAndIconView();

    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA871D30);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_1D7BC0750;
    *(void *)(v13 + 32) = v12;
    sub_1D7BB7318();

    sub_1D7B2170C(0, &qword_1EA872328);
    double v14 = (void *)sub_1D7BB72E8();
    swift_bridgeObjectRelease();
    return v14;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (BOOL)iconDragManager:(id)a3 doesIconViewRepresentRealIconPosition:(id)a4
{
  return 1;
}

- (void)iconDragManager:(id)a3 iconView:(id)a4 willAnimateDragLiftWithAnimator:(id)a5 session:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v10 = self;
  _s15ControlCenterUI20PagingViewControllerC15iconDragManager_0gE0011willAnimateH16LiftWithAnimator7sessionySo06SBIconhI0C_So0pE0CSo15UIDragAnimating_pSo0Q7Session_ptF_0();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)iconDragManagerIconDraggingDidChange:(id)a3
{
  id v4 = a3;
  id v5 = self;
  _s15ControlCenterUI20PagingViewControllerC15iconDragManager_0gE0011willAnimateH16LiftWithAnimator7sessionySo06SBIconhI0C_So0pE0CSo15UIDragAnimating_pSo0Q7Session_ptF_0();
}

- (void)iconDragManager:(id)a3 iconView:(id)a4 willBeginDragSession:(id)a5
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController_allowsIconAdornments) = 0;
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  id v9 = self;
  sub_1D7B876AC();

  swift_unknownObjectRelease();
}

- (void)iconDragManagerUserActiveIconDraggingDidChange:(id)a3
{
  id v4 = a3;
  id v5 = self;
  if ((objc_msgSend(v4, sel_isTrackingUserActiveIconDrags) & 1) == 0)
  {
    *((unsigned char *)&v5->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController_allowsIconAdornments) = 1;
    sub_1D7B876AC();
  }
}

- (id)windowForIconDragPreviewsForIconDragManager:(id)a3 forWindowScene:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v9 = sub_1D7B97830(v7);

  return v9;
}

- (id)iconDragManager:(id)a3 dragPreviewForIconView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v9 = sub_1D7B97944(v7);

  return v9;
}

- (id)rootViewForIconDragManager:(id)a3
{
  id v4 = a3;
  id v5 = self;
  [(CCUIPagingViewController *)v5 loadViewIfNeeded];
  id result = *(Class *)((char *)&v5->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController___rootFolderController);
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  id result = objc_msgSend(result, sel_view);
  if (!result)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  id v7 = result;

  return v7;
}

- (BOOL)iconDragManager:(id)a3 canAddDragItemsToSession:(id)a4 fromIconView:(id)a5
{
  return 0;
}

- (BOOL)allowsNestedFoldersForIconDragManager:(id)a3
{
  return 0;
}

- (id)rootFolderForIconDragManager:(id)a3
{
  id v4 = a3;
  id v5 = self;
  [(CCUIPagingViewController *)v5 loadViewIfNeeded];
  id result = *(Class *)((char *)&v5->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController___rootFolderController);
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  id result = objc_msgSend(result, sel_folder);
  if (!result)
  {
LABEL_7:
    __break(1u);
    return result;
  }

  self;
  id v7 = (void *)swift_dynamicCastObjCClassUnconditional();

  return v7;
}

- (id)iconListViewForIndexPath:(id)a3
{
  uint64_t v4 = sub_1D7BB6C38();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  id v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D7BB6C28();
  id v8 = self;
  id v9 = sub_1D7B883B0();
  double v11 = v10;

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v11;
}

- (unint64_t)listGridCellInfoOptionsForIconDragManager:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  unint64_t result = (unint64_t)[(CCUIPagingViewController *)v5 loadViewIfNeeded];
  id v7 = *(Class *)((char *)&v5->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController___rootFolderController);
  if (v7)
  {
    id v8 = objc_msgSend(self, sel_gridCellInfoOptionsWithInterfaceOrientation_reversedLayout_, objc_msgSend(v7, sel_orientation), 0);

    return (unint64_t)v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)iconViewQueryableForIconDragManager:(void *)a3
{
  id v4 = a3;
  uint64_t v5 = a1;
  objc_msgSend(v5, sel_loadViewIfNeeded);
  id result = *(id *)&v5[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (result)
  {
    id v7 = result;

    return v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (BOOL)allowsSnappingIconsToGridForIconDragManager:(id)a3
{
  return 1;
}

- (BOOL)iconDragManager:(id)a3 canSnapIconsToGridInLocation:(id)a4
{
  return 1;
}

- (void)layoutIconListsWithAnimationType:(int64_t)a3 forceRelayout:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = self;
  [(CCUIPagingViewController *)v7 loadViewIfNeeded];
  uint64_t v6 = *(Class *)((char *)&v7->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController___rootFolderController);
  if (v6)
  {
    objc_msgSend(v6, sel_layoutIconListsWithAnimationType_forceRelayout_, a3, v4);
  }
  else
  {
    __break(1u);
  }
}

- (BOOL)iconDragManager:(id)a3 shouldMinimizeLayoutDisruptionInLocation:(id)a4
{
  return 1;
}

- (BOOL)rootFolder:(id)a3 canBounceIcon:(id)a4
{
  BOOL v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController_iconDragManager);
  if (v4) {
    LOBYTE(v4) = objc_msgSend(v4, sel_isIconDragging, a3, a4);
  }
  else {
    __break(1u);
  }
  return (char)v4;
}

- (void)folder:(id)a3 didAddIcons:(id)a4 removedIcons:(id)a5
{
  uint64_t v6 = (uint64_t)a4;
  if (a4)
  {
    sub_1D7B2170C(0, &qword_1EBDFF9E0);
    sub_1D7B95EF4(&qword_1EA872320, &qword_1EBDFF9E0);
    uint64_t v6 = sub_1D7BB73A8();
  }
  if (a5)
  {
    sub_1D7B2170C(0, &qword_1EBDFF9E0);
    sub_1D7B95EF4(&qword_1EA872320, &qword_1EBDFF9E0);
    a5 = (id)sub_1D7BB73A8();
  }
  id v9 = a3;
  id v10 = self;
  sub_1D7B97A14(v6, (uint64_t)a5);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)controlsGalleryViewController:(id)a3 didFinishWithResult:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = self;
  id v11 = a5;
  sub_1D7B97B78(a4, a5);
}

- (void)controlsGalleryViewControllerWillPresent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  _s15ControlCenterUI20PagingViewControllerC015controlsGalleryeF11WillPresentyySo013CCUISControlsheF0CF_0();
}

- (void)controlsGalleryViewControllerWillDismiss:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  _s15ControlCenterUI20PagingViewControllerC015controlsGalleryeF11WillDismissyySo013CCUISControlsheF0CF_0();
}

- (void)controlsGalleryViewControllerDidDismiss:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  _s15ControlCenterUI20PagingViewControllerC015controlsGalleryeF10DidDismissyySo013CCUISControlsheF0CF_0();
}

- (id)customApplicationWidgetCollectionsForControlsGalleryViewController:(id)a3
{
  uint64_t v15 = MEMORY[0x1E4FBC860];
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController_moduleInstanceManager);
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController_moduleSettingsManager);
  id v6 = a3;
  id v7 = self;
  id v8 = objc_msgSend(v4, sel_loadableModuleIdentifiers);
  uint64_t v9 = sub_1D7BB73A8();

  id v10 = v7;
  id v11 = v4;
  id v12 = v5;
  sub_1D7B96EE4(v9, v10, v11, v12, &v15);

  swift_bridgeObjectRelease();
  sub_1D7B2170C(0, (unint64_t *)&unk_1EA872310);
  uint64_t v13 = (void *)sub_1D7BB72E8();
  swift_bridgeObjectRelease();

  return v13;
}

- (id)controlsGalleryViewController:(id)a3 customImageViewControllerForWidgetIcon:(id)a4 withPrimaryAction:(id)a5 contentMetrics:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  double v14 = self;
  id v15 = sub_1D7B982E0(v11, (uint64_t)v12, (uint64_t)v13);

  return v15;
}

- (id)controlsGalleryViewController:(id)a3 widgetIconForGalleryItem:(id)a4
{
  self;
  uint64_t v6 = swift_dynamicCastObjCClass();
  if (v6)
  {
    id v7 = (void *)v6;
    swift_unknownObjectRetain_n();
    id v8 = a3;
    uint64_t v9 = self;
    objc_msgSend(v7, sel_preferredGallerySizeClass);
    id v10 = (id)SBHIconGridSizeClassForCCUIGridSizeClass();
    sub_1D7B2170C(0, (unint64_t *)&unk_1EA8719E0);
    id v11 = (void *)sub_1D7BB73D8();
    objc_msgSend(v11, sel_addIconDataSource_, v7);
    objc_msgSend(v11, sel_setGridSizeClass_, v10);

    swift_unknownObjectRelease_n();
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)controlsGalleryViewController:(id)a3 didFinishWithWidgetIcon:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1D7B98AEC(v7);
}

- (void)handleIconElementRequest:(id)a3 completionHandler:(id)a4
{
}

- (void)requestIconElementStateForRequest:(id)a3 completionHandler:(id)a4
{
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  sub_1D7B99278((uint64_t)&unk_1F2F33CE0, (uint64_t)sub_1D7B9A21C, (uint64_t)&block_descriptor_302);
  swift_unknownObjectRelease();
}

- (void)extensionsDidChangeForExtensionProvider:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1D7B99278((uint64_t)&unk_1F2F33C18, (uint64_t)sub_1D7B9A1EC, (uint64_t)&block_descriptor_285);
}

@end