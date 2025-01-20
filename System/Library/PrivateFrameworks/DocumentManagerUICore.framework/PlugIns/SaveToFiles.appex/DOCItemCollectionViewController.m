@interface DOCItemCollectionViewController
- (BOOL)acceptsKeyboardFocus;
- (BOOL)accessibilityIsInListMode;
- (BOOL)accessibilityIsRenamingInline;
- (BOOL)becomeFirstResponder;
- (BOOL)becomeKeyboardFocused;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4;
- (BOOL)collectionView:(id)a3 canPerformAction:(SEL)a4 forItemAtIndexPath:(id)a5 withSender:(id)a6;
- (BOOL)collectionView:(id)a3 canPerformPrimaryActionForItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5;
- (BOOL)establishFirstResponder;
- (BOOL)forceDisableDictation;
- (BOOL)forceEditingMode;
- (BOOL)hidesNavigationBackButton;
- (BOOL)isInKeyWindow;
- (BOOL)needsForcedUnderNavBarAppearanceOnAppear;
- (BOOL)resignFirstResponder;
- (BOOL)wantsAppearanceOverride;
- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4;
- (CGRect)absoluteFrame;
- (DOCContentUnavailableConfigurationState)docContentUnavailableConfigurationState;
- (NSArray)keyCommands;
- (NSArray)preferredFocusEnvironments;
- (NSString)description;
- (NSString)title;
- (NSUndoManager)undoManager;
- (UIEdgeInsets)_contentOverlayInsets;
- (UISplitViewController)splitViewController;
- (UITraitCollection)traitCollection;
- (UIView)view;
- (_TtC11SaveToFiles31DOCItemCollectionViewController)initWithCoder:(id)a3;
- (_TtP11SaveToFiles34DOCBrowserContainedActionReporting_)actionReporting;
- (id)_multitaskingDragExclusionRects;
- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 dismissalPreviewForItemAtIndexPath:(id)a5;
- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 highlightPreviewForItemAtIndexPath:(id)a5;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6;
- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4;
- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4;
- (id)contextMenuForFolder;
- (id)contextMenuForItemsAt:(id)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4;
- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3;
- (int64_t)_collectionView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5;
- (int64_t)_collectionView:(id)a3 dataOwnerForDropSession:(id)a4 withDestinationIndexPath:(id)a5;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (int64_t)displayMode;
- (void)_doc_performLiveResizeSkippedWork;
- (void)_doc_performLiveResizeSkipped_updateOverlay;
- (void)_setContentOverlayInsets:(UIEdgeInsets)a3;
- (void)actionBarButtonTriggeredWithActionBarButton:(id)a3;
- (void)appProtectionStatusChangedWithNotification:(id)a3;
- (void)barButtonTappedWithSender:(id)a3;
- (void)collectionView:(id)a3 cancelPrefetchingForItemsAtIndexPaths:(id)a4;
- (void)collectionView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4;
- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4;
- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4;
- (void)collectionView:(id)a3 dropSessionDidEnter:(id)a4;
- (void)collectionView:(id)a3 dropSessionDidExit:(id)a4;
- (void)collectionView:(id)a3 performAction:(SEL)a4 forItemAtIndexPath:(id)a5 withSender:(id)a6;
- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4;
- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6;
- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5;
- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)collectionViewDidEndMultipleSelectionInteraction:(id)a3;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)copy:(id)a3;
- (void)createFolder:(id)a3;
- (void)dealloc;
- (void)delete:(id)a3;
- (void)deselectAllItems;
- (void)didUpdateCollectionViewContentOffsetWithNotification:(id)a3;
- (void)didUpdateCollectionViewIsScrollEnabledWithNotification:(id)a3;
- (void)displayInfoForCurrentItem:(id)a3;
- (void)docUpdateContentUnavailableConfigurationUsingState:(id)a3;
- (void)effectiveAppearanceDidChange:(id)a3;
- (void)firstItemInsertionRequestsFocusExpired;
- (void)getCellFor:(id)a3 :(id)a4;
- (void)getPopoverTrackerForItem:(id)a3 completionBlock:(id)a4;
- (void)getTransitionControllerForItem:(id)a3 completionBlock:(id)a4;
- (void)getTransitionControllerForURL:(id)a3 completionBlock:(id)a4;
- (void)getViewFor:(id)a3 waitForNewThumbnail:(BOOL)a4 :(id)a5;
- (void)loadView;
- (void)menuControllerWillHide;
- (void)menuControllerWillShow;
- (void)moveHere:(id)a3;
- (void)paste:(id)a3;
- (void)pasteboardMoveToCollectionView:(id)a3;
- (void)pasteboardPasteInCollectionView:(id)a3;
- (void)performActionWithAction:(id)a3 actionContext:(id)a4;
- (void)performCommandReturnKey:(id)a3;
- (void)performConfirmPickerExportOrDrillIn:(id)a3;
- (void)performCreateFolder:(id)a3;
- (void)performCreateFolderWithSelection:(id)a3;
- (void)performDelete:(id)a3;
- (void)performDeleteNow:(id)a3;
- (void)performDeselectAll:(id)a3;
- (void)performDismiss:(id)a3;
- (void)performDuplicate:(id)a3;
- (void)performGetInfo:(id)a3;
- (void)performGoToEnclosingFolder:(id)a3;
- (void)performKeyboardFocusKeyCommand:(id)a3;
- (void)performMarkAsFavorite:(id)a3;
- (void)performMoveHere:(id)a3;
- (void)performOpen:(id)a3;
- (void)performPreview:(id)a3;
- (void)performRename:(id)a3;
- (void)performRevealItem:(id)a3;
- (void)prepareForPopoverPresentation:(id)a3;
- (void)prepareSnapshotForSplitStateChangingFromState:(id)a3 toState:(id)a4 alongside:(id)a5;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesChanged:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)revealWithItems:(id)a3 selectEvenIfVisible:(BOOL)a4 completionBlock:(id)a5;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)selectAll:(id)a3;
- (void)selectAllItems;
- (void)setActionReporting:(id)a3;
- (void)setDisplayMode:(int64_t)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setForceEditingMode:(BOOL)a3;
- (void)setNeedsForcedUnderNavBarAppearanceOnAppear:(BOOL)a3;
- (void)setProtectedStateToLockedForDidEnterBackground;
- (void)setTitle:(id)a3;
- (void)setView:(id)a3;
- (void)startFolderCreation:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateProtectedStateForDidEnterForeground;
- (void)validateCommand:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)wantsToCreateNewFile;
- (void)wantsToCreateNewFolder;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation DOCItemCollectionViewController

- (void)_doc_performLiveResizeSkipped_updateOverlay
{
  v2 = self;
  _s11SaveToFiles31DOCItemCollectionViewControllerC13updateOverlay8animatedySb_tF_0();
}

- (void)barButtonTappedWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100078BA4(v4);
}

- (void)prepareForPopoverPresentation:(id)a3
{
  id v4 = a3;
  v5 = self;
  DOCItemCollectionViewController.prepareForPopoverPresentation(_:)((UIPopoverPresentationController)v4);
}

- (void)actionBarButtonTriggeredWithActionBarButton:(id)a3
{
  id v4 = (char *)a3;
  v5 = self;
  sub_100085404(v4);
}

- (void)performActionWithAction:(id)a3 actionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100085500(v6, (uint64_t)v7);
}

- (void)setProtectedStateToLockedForDidEnterBackground
{
  v2 = self;
  sub_1000B6BCC();
}

- (void)updateProtectedStateForDidEnterForeground
{
  v2 = self;
  sub_1000B7048();
}

- (void)appProtectionStatusChangedWithNotification:(id)a3
{
  uint64_t v4 = sub_1004CDE50();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004CDE10();
  v8 = self;
  sub_1000B79E0((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)pasteboardPasteInCollectionView:(id)a3
{
}

- (void)pasteboardMoveToCollectionView:(id)a3
{
}

- (void)startFolderCreation:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_1004D29A0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    uint64_t v5 = self;
  }
  sub_1002BB51C(0, 1);

  sub_10003D810((uint64_t)v6, &qword_10062D740);
}

- (void)displayInfoForCurrentItem:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_1004D29A0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    uint64_t v5 = self;
  }
  sub_100286218((uint64_t)v6);

  sub_10003D810((uint64_t)v6, &qword_10062D740);
}

- (DOCContentUnavailableConfigurationState)docContentUnavailableConfigurationState
{
  v2 = self;
  id v3 = DOCItemCollectionViewController.docContentUnavailableConfigurationState.getter();

  return (DOCContentUnavailableConfigurationState *)v3;
}

- (void)docUpdateContentUnavailableConfigurationUsingState:(id)a3
{
  uint64_t v4 = (objc_class *)a3;
  v5.super._impl = (NSCopying *)self;
  impl = v5.super._impl;
  v5.super.super.isa = v4;
  DOCItemCollectionViewController.docUpdateContentUnavailableConfiguration(using:)(v5);
}

- (_TtP11SaveToFiles34DOCBrowserContainedActionReporting_)actionReporting
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  return (_TtP11SaveToFiles34DOCBrowserContainedActionReporting_ *)Strong;
}

- (void)setActionReporting:(id)a3
{
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRetain();
  uint64_t v4 = self;
  sub_100295AB8();

  swift_unknownObjectRelease();
}

- (_TtC11SaveToFiles31DOCItemCollectionViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100304BC8();
}

- (NSString)description
{
  v2 = self;
  DOCItemCollectionViewController.description.getter();

  NSString v3 = sub_1004D1200();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (UITraitCollection)traitCollection
{
  v2 = self;
  id v3 = DOCItemCollectionViewController.traitCollection.getter();

  return (UITraitCollection *)v3;
}

- (int64_t)displayMode
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_displayMode);
  swift_beginAccess();
  return *v2;
}

- (void)setDisplayMode:(int64_t)a3
{
  uint64_t v4 = self;
  DOCItemCollectionViewController.displayMode.setter(a3);
}

- (NSArray)preferredFocusEnvironments
{
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController__loadedCollectionView);
  if (v3)
  {
    sub_100026870((uint64_t *)&unk_10062E8F0);
    uint64_t v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_1004E9810;
    *(void *)(v4 + 32) = v3;
    sub_1004D1530();
    DOCContentUnavailableConfigurationState v5 = self;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)type metadata accessor for DOCItemCollectionViewController(0);
    uint64_t v6 = self;
    id v7 = [(DOCItemCollectionViewController *)&v11 preferredFocusEnvironments];
    sub_100026870(&qword_10062F1D0);
    sub_1004D1510();

    id v3 = 0;
  }
  id v8 = v3;

  sub_100026870(&qword_10062F1D0);
  v9.super.isa = sub_1004D14F0().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v9.super.isa;
}

- (UISplitViewController)splitViewController
{
  v2 = self;
  DOCItemCollectionViewController.splitViewController.getter();
  uint64_t v4 = v3;

  return (UISplitViewController *)v4;
}

- (void)prepareSnapshotForSplitStateChangingFromState:(id)a3 toState:(id)a4 alongside:(id)a5
{
}

- (NSString)title
{
  v2 = self;
  DOCItemCollectionViewController.title.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = sub_1004D1200();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setTitle:(id)a3
{
}

- (void)dealloc
{
  v2 = self;
  DOCItemCollectionViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_tipsManager));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_collectionViewPool));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_loadingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_emptyTargetedPreview));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_tipsHeaderView));
  sub_100035EE0((uint64_t)self + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_familyFetcher);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_currentClickyOrbMenu));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_currentClickyOrbConfiguration));
  sub_10003B980(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_blockToRunWhenMenuInteractionFinishedDismissing));
  swift_bridgeObjectRelease();
  sub_10003BA48((uint64_t)self + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_itemHierarchyEventListener);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_sortOptionsAccessibilityModelView));
  sub_10003D810((uint64_t)self + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_lastDropIndexPath, (uint64_t *)&unk_100632630);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_dropTargetHighlightedCell));
  swift_release();
  swift_release();
  sub_100318324((uint64_t)self + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_itemCollectionConfiguration, (uint64_t (*)(void))type metadata accessor for DOCItemCollectionConfiguration);
  swift_bridgeObjectRelease();
  sub_10003BA48((uint64_t)self + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_interactionDelegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100318384(*(void **)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_currentLoadingProgress));
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_nodeCollection));
  sub_10003D810((uint64_t)self + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_currentFocusEngineIndexPath, (uint64_t *)&unk_100632630);
  sub_100318324((uint64_t)self + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_itemsController, (uint64_t (*)(void))type metadata accessor for DOCItemCollectionFPController);
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController__groupingBehavior;
  uint64_t v4 = sub_1004CF8D0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_gatheringObservation));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_itemsOriginObservation));
  swift_bridgeObjectRelease();
  sub_10003D810((uint64_t)self + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_indexPathForRememberedFocusNode, (uint64_t *)&unk_100632630);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_additionalHeaderContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_additionalHeaderView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_syncStateHeaderView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_typeToFocusController));
  sub_10003D810((uint64_t)self+ OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController____lazy_storage___listLayoutConfiguration, (uint64_t *)&unk_100637C80);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController____lazy_storage___collectionViewLayout));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController__loadedCollectionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController__footerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController____lazy_storage____headerContainerView));
  sub_1003183C4(*(id *)((char *)&self->super.super.super.super.super.isa
                      + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController____lazy_storage___promptView));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_shareBannerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_stackViewMetricsSourceTraits));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_moreActionsBarButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_enumerationProperties));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_enumerationIdentifier));
  sub_10003D810((uint64_t)self + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_sortingDescriptor, (uint64_t *)&unk_100630E00);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_sourceEjectableObservation));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_lastPreviewedFPItem));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_10003D810((uint64_t)self + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_lastAppliedLayoutContext, &qword_10062C7F0);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_preSnapshotConfiguration));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  sub_10003D810((uint64_t)self + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_enqueuedNodeScrollPositionInfo, &qword_100637C90);
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_viewOptionsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_enqueuedCreatedFolderToBeRenamed));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_newFolderReadyForRenameTimer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_repositionRenamingCellTimer));
  NSString v5 = *(char **)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_activeDragStrongReferenceToSelf);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_activeDragStrongReferenceToSelf) = 0;
  if (v5)
  {
    while (1)
    {
      id v8 = v5;
      if (!swift_isUniquelyReferenced()) {
        break;
      }
      uint64_t v6 = *(char **)&v8[OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_activeDragStrongReferenceToSelf];
      id v7 = v6;

      NSString v5 = v6;
      if (!v6) {
        goto LABEL_6;
      }
    }
    NSString v5 = v8;
  }
LABEL_6:
}

- (UIEdgeInsets)_contentOverlayInsets
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCItemCollectionViewController(0);
  [(DOCItemCollectionViewController *)&v6 _contentOverlayInsets];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)_setContentOverlayInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  id v7 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC11SaveToFiles33DOCBrowserContainedViewController_configuration);
  id v8 = self;
  if ([v7 shouldAdjustContentInset])
  {
    v12.super_class = (Class)type metadata accessor for DOCItemCollectionViewController(0);
    -[DOCItemCollectionViewController _setContentOverlayInsets:](&v12, "_setContentOverlayInsets:", top, left, bottom, right, v8, v12.super_class, v13.receiver, v13.super_class);
  }
  else
  {
    double v9 = UIEdgeInsetsZero.left;
    double v10 = UIEdgeInsetsZero.bottom;
    double v11 = UIEdgeInsetsZero.right;
    v13.super_class = (Class)type metadata accessor for DOCItemCollectionViewController(0);
    -[DOCItemCollectionViewController _setContentOverlayInsets:](&v13, "_setContentOverlayInsets:", UIEdgeInsetsZero.top, v9, v10, v11, v12.receiver, v12.super_class, v8, v13.super_class);
  }
}

- (void)selectAllItems
{
  uint64_t v2 = OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_performingBatchSelection;
  if ((*((unsigned char *)&self->super.super.super.super.super.isa
        + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_performingBatchSelection) & 1) == 0)
  {
    *((unsigned char *)&self->super.super.super.super.super.isa
    + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_performingBatchSelection) = 1;
    double v4 = self;
    sub_1002B03B0((char *)v4);
    *((unsigned char *)&self->super.super.super.super.super.isa + v2) = 0;
  }
}

- (void)deselectAllItems
{
  uint64_t v2 = OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_performingBatchSelection;
  if ((*((unsigned char *)&self->super.super.super.super.super.isa
        + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_performingBatchSelection) & 1) == 0)
  {
    *((unsigned char *)&self->super.super.super.super.super.isa
    + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_performingBatchSelection) = 1;
    double v4 = self;
    sub_1002B0B10(0, (uint64_t)_swiftEmptyArrayStorage);
    *((unsigned char *)&self->super.super.super.super.super.isa + v2) = 0;
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  id v7 = a3;
  id v8 = self;
  char v9 = (char)v8;
  double v10 = v8;
  v12.value.super.super.super.isa = (Class)a3;
  v12.is_nil = a4;
  DOCItemCollectionViewController.viewDidMove(to:shouldAppearOrDisappear:)(v12, v9);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  objc_super v6 = self;
  v9.is_nil = (char)v6;
  id v7 = v6;
  v9.value.super.isa = (Class)a3;
  DOCItemCollectionViewController.traitCollectionDidChange(_:)(v9);
}

- (void)_doc_performLiveResizeSkippedWork
{
  int v2 = *((unsigned __int8 *)&self->super.super.super.super.super.isa
       + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_liveResizeDidSkip_computeStackMetrics);
  double v3 = self;
  id v5 = v3;
  if (v2 == 1)
  {
    sub_1002C8660();
    double v3 = v5;
  }
  if (*((unsigned char *)&v3->super.super.super.super.super.isa
       + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_liveResizeDidSkip_updateSnapshot) == 1)
  {
    double v4 = [(DOCItemCollectionViewController *)v3 traitCollection];
    sub_1002B3D7C(v4, 0, 0, 1, 1);

    double v3 = (_TtC11SaveToFiles31DOCItemCollectionViewController *)v4;
  }
}

- (void)effectiveAppearanceDidChange:(id)a3
{
  id v4 = a3;
  id v5 = self;
  DOCItemCollectionViewController.effectiveAppearanceDidChange(_:)(v4);
}

- (UIView)view
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCItemCollectionViewController(0);
  int v2 = [(DOCItemCollectionViewController *)&v4 view];
  return v2;
}

- (void)setView:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCItemCollectionViewController(0);
  objc_super v4 = (char *)v6.receiver;
  id v5 = a3;
  [(DOCItemCollectionViewController *)&v6 setView:v5];
  objc_msgSend(v4, "setContentScrollView:forEdge:", *(void *)&v4[OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController__loadedCollectionView], 15, v6.receiver, v6.super_class);
}

- (void)loadView
{
  int v2 = self;
  DOCItemCollectionViewController.loadView()();
}

- (void)viewDidLoad
{
  int v2 = self;
  DOCItemCollectionViewController.viewDidLoad()();
}

- (NSUndoManager)undoManager
{
  id v2 = [self shared];
  return (NSUndoManager *)v2;
}

- (BOOL)canBecomeFirstResponder
{
  return [(DOCItemCollectionViewController *)self _appearState] - 1 < 2;
}

- (BOOL)resignFirstResponder
{
  id v2 = self;
  Swift::Bool v3 = DOCItemCollectionViewController.resignFirstResponder()();

  return v3;
}

- (BOOL)becomeFirstResponder
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCItemCollectionViewController(0);
  return [(DOCItemCollectionViewController *)&v3 becomeFirstResponder];
}

- (void)performKeyboardFocusKeyCommand:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1002BA860(v4);
}

- (void)selectAll:(id)a3
{
}

- (void)copy:(id)a3
{
}

- (void)paste:(id)a3
{
}

- (void)delete:(id)a3
{
}

- (void)moveHere:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1004D29A0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    id v5 = self;
  }
  sub_1002BB344();

  sub_10003D810((uint64_t)v6, &qword_10062D740);
}

- (void)createFolder:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1004D29A0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    id v5 = self;
  }
  sub_1002BB51C(0, 1);

  sub_10003D810((uint64_t)v6, &qword_10062D740);
}

- (BOOL)hidesNavigationBackButton
{
  id v2 = self;
  char v3 = DOCItemCollectionViewController.hidesNavigationBackButton.getter();

  return v3 & 1;
}

- (void)didUpdateCollectionViewIsScrollEnabledWithNotification:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1002BC7F0(v4);
}

- (void)didUpdateCollectionViewContentOffsetWithNotification:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1002BC9D4(v4);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  DOCItemCollectionViewController.viewWillAppear(_:)(a3);
}

- (void)viewIsAppearing:(BOOL)a3
{
  id v4 = self;
  DOCItemCollectionViewController.viewIsAppearing(_:)(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  DOCItemCollectionViewController.viewDidAppear(_:)(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  DOCItemCollectionViewController.viewWillDisappear(_:)(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  DOCItemCollectionViewController.viewDidDisappear(_:)(a3);
}

- (BOOL)needsForcedUnderNavBarAppearanceOnAppear
{
  return *((unsigned char *)&self->super.super.super.super.super.isa
         + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_needsForcedUnderNavBarAppearanceOnAppear);
}

- (void)setNeedsForcedUnderNavBarAppearanceOnAppear:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_needsForcedUnderNavBarAppearanceOnAppear) = a3;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v6 = self;
  DOCItemCollectionViewController.setEditing(_:animated:)(a3, a4);
}

- (BOOL)forceEditingMode
{
  return *((unsigned char *)&self->super.super.super.super.super.isa
         + OBJC_IVAR____TtC11SaveToFiles33DOCBrowserContainedViewController_forceEditingMode);
}

- (void)setForceEditingMode:(BOOL)a3
{
  id v4 = self;
  sub_1002C471C(a3);
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  id v7 = self;
  DOCItemCollectionViewController.willTransition(to:with:)(v6, a4);

  swift_unknownObjectRelease();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  id v8 = self;
  DOCItemCollectionViewController.viewWillTransition(to:with:)(a4, width, height);
  swift_unknownObjectRelease();
}

- (void)viewWillLayoutSubviews
{
  id v2 = self;
  DOCItemCollectionViewController.viewWillLayoutSubviews()();
}

- (void)viewDidLayoutSubviews
{
  id v2 = self;
  DOCItemCollectionViewController.viewDidLayoutSubviews()();
}

- (void)menuControllerWillShow
{
}

- (void)menuControllerWillHide
{
}

- (void)wantsToCreateNewFile
{
  if (*(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC11SaveToFiles33DOCBrowserContainedViewController_documentManager))
  {
    id v2 = self;
    DOCItemCollectionViewController.getCurrentLocation()();
    id v4 = v3;
    sub_1001752AC(v3);
  }
}

- (void)wantsToCreateNewFolder
{
  id v2 = self;
  sub_1002D41BC();
}

- (BOOL)accessibilityIsInListMode
{
  id v2 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_displayMode);
  swift_beginAccess();
  return *v2 == 1;
}

- (BOOL)accessibilityIsRenamingInline
{
  if ((*((unsigned char *)&self->super.super.super.super.super.isa
        + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_endingInlineRename) & 1) != 0)
    return 0;
  if (*(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_inlineRenameController))
    return 1;
  return *((unsigned char *)&self->super.super.super.super.super.isa
         + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_preparingForInlineRename);
}

- (BOOL)establishFirstResponder
{
  id v2 = self;
  [(DOCItemCollectionViewController *)v2 setNeedsFocusUpdate];
  id v3 = [self sharedManager];
  unsigned __int8 v4 = [v3 requestCurrentFocus:v2];

  return v4;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  DOCItemCollectionViewController.scrollViewDidScroll(_:)((UIScrollView)v4);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v7 = sub_100298314();
  if (*v6 != 2) {
    *id v6 = 1;
  }
  ((void (*)(uint64_t *, void))v7)(&v8, 0);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
  {
    id v6 = a3;
    id v7 = self;
    _s11SaveToFiles31DOCItemCollectionViewControllerC06scrollF18DidEndDeceleratingyySo08UIScrollF0CF_0();
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  id v5 = self;
  _s11SaveToFiles31DOCItemCollectionViewControllerC06scrollF18DidEndDeceleratingyySo08UIScrollF0CF_0();
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
}

- (void)collectionView:(id)a3 cancelPrefetchingForItemsAtIndexPaths:(id)a4
{
}

- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4
{
  id v5 = a3;
  id v6 = self;
  _s11SaveToFiles31DOCItemCollectionViewControllerC010collectionF0_030targetContentOffsetForProposedjK0So7CGPointVSo012UICollectionF0C_AGtF_0(v5);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1004CE6C0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  double v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004CE650();
  id v10 = a3;
  double v11 = self;
  LOBYTE(self) = sub_1003100C4((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  return sub_1002D825C(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(id, char *))DOCItemCollectionViewController.collectionView(_:shouldDeselectItemAt:));
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return sub_1002D825C(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(id, char *))DOCItemCollectionViewController.collectionView(_:shouldSelectItemAt:));
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
}

- (BOOL)collectionView:(id)a3 canPerformPrimaryActionForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1004CE6C0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  double v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004CE650();
  id v10 = a3;
  double v11 = self;
  LOBYTE(self) = sub_1002C7D14((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1004CE6C0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  double v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004CE650();
  id v10 = a3;
  double v11 = self;
  DOCItemCollectionViewController.collectionView(_:performPrimaryActionForItemAt:)((uint64_t)v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)_multitaskingDragExclusionRects
{
  id v2 = self;
  DOCItemCollectionViewController._multitaskingDragExclusionRects()();

  sub_100036804(0, (unint64_t *)&unk_100637C70);
  v3.super.isa = sub_1004D14F0().super.isa;
  swift_bridgeObjectRelease();
  return v3.super.isa;
}

- (BOOL)collectionView:(id)a3 canPerformAction:(SEL)a4 forItemAtIndexPath:(id)a5 withSender:(id)a6
{
  uint64_t v9 = sub_1004CE6C0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004CE650();
  if (a6)
  {
    id v13 = a3;
    v14 = self;
    swift_unknownObjectRetain();
    sub_1004D29A0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v19, 0, sizeof(v19));
    id v15 = a3;
    v16 = self;
  }
  unsigned __int8 v17 = sub_1003111AC((uint64_t)v12);

  sub_10003D810((uint64_t)v19, &qword_10062D740);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v17 & 1;
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self;
  sub_100311418(v9);
}

- (void)collectionView:(id)a3 performAction:(SEL)a4 forItemAtIndexPath:(id)a5 withSender:(id)a6
{
  uint64_t v9 = sub_1004CE6C0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004CE650();
  if (a6)
  {
    id v13 = a3;
    v14 = self;
    swift_unknownObjectRetain();
    sub_1004D29A0();

    swift_unknownObjectRelease();
  }
  else
  {
    memset(v15, 0, sizeof(v15));
  }
  sub_10003D810((uint64_t)v15, &qword_10062D740);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_1004CE6C0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004CE650();
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  sub_100311628(v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_1004CE6C0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004CE650();
  type metadata accessor for DOCItemCollectionCell();
  id v12 = (void *)swift_dynamicCastClass();
  if (v12)
  {
    id v13 = *(void (**)(void))((swift_isaMask & *v12) + 0x218);
    id v14 = a3;
    id v15 = a4;
    v16 = self;
    v13();
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5
{
  uint64_t v7 = sub_1004CE6C0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004CE650();
  id v11 = a3;
  swift_unknownObjectRetain();
  id v12 = self;
  LOBYTE(self) = _s11SaveToFiles31DOCItemCollectionViewControllerC010collectionF0_22shouldSpringLoadItemAt4withSbSo012UICollectionF0C_10Foundation9IndexPathVSo32UISpringLoadedInteractionContext_ptF_0(v11, (uint64_t)v10);

  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  uint64_t v9 = sub_1004CE6C0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004CE650();
  id v13 = a3;
  id v14 = a4;
  id v15 = self;
  sub_1003119E0(v14, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (BOOL)collectionView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1004CE6C0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004CE650();
  id v10 = a3;
  uint64_t v11 = self;
  LOBYTE(self) = sub_1002DD790();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (void)collectionView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1004CE6C0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004CE650();
  id v10 = a3;
  uint64_t v11 = self;
  DOCItemCollectionViewController.collectionView(_:didBeginMultipleSelectionInteractionAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  uint64_t v5 = sub_100026870((uint64_t *)&unk_100632630);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = a3;
  uint64_t v9 = self;
  DOCItemCollectionViewController.indexPathForPreferredFocusedView(in:)(v7);

  uint64_t v10 = sub_1004CE6C0();
  uint64_t v11 = *(void *)(v10 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v7, 1, v10) != 1)
  {
    Class isa = sub_1004CE610().super.isa;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v7, v10);
  }
  return isa;
}

- (void)collectionViewDidEndMultipleSelectionInteraction:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_isSelectingUsingGesture) = 0;
}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  uint64_t v9 = self;
  _s11SaveToFiles31DOCItemCollectionViewControllerC010collectionF0_22willDisplayContextMenu8animatorySo012UICollectionF0C_So09UIContextL13ConfigurationCSo0oL20InteractionAnimating_pSgtF_0(v7, v8);

  swift_unknownObjectRelease();
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  uint64_t v10 = self;
  sub_100312098(v9, a5);

  swift_unknownObjectRelease();
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 highlightPreviewForItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_1004CE6C0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004CE650();
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  id v15 = DOCItemCollectionViewController.collectionView(_:contextMenuConfiguration:highlightPreviewForItemAt:)(v12);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v15;
}

- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  uint64_t v9 = (void *)DOCItemCollectionViewController.collectionView(_:previewForHighlightingContextMenuWithConfiguration:)((UICollectionView)v6, (UIContextMenuConfiguration)v7);

  return v9;
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 dismissalPreviewForItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_1004CE6C0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004CE650();
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  Class isa = sub_1004CE610().super.isa;
  id v16 = [(DOCItemCollectionViewController *)v14 collectionView:v12 contextMenuConfiguration:v13 highlightPreviewForItemAtIndexPath:isa];

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v16;
}

- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  id v4 = [(DOCItemCollectionViewController *)self collectionView:a3 previewForHighlightingContextMenuWithConfiguration:a4];
  return v4;
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  sub_1004CE6C0();
  uint64_t v9 = (void *)sub_1004D1510();
  id v10 = a3;
  uint64_t v11 = self;
  id v12 = DOCItemCollectionViewController.collectionView(_:contextMenuConfigurationForItemsAt:point:)(v10, v9, x, y);

  swift_bridgeObjectRelease();
  return v12;
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  uint64_t v9 = sub_1004CE6C0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004CE650();
  id v13 = a3;
  uint64_t v14 = self;
  id v15 = DOCItemCollectionViewController.collectionView(_:contextMenuConfigurationForItemAt:point:)(v13, (uint64_t)v12, x, y);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v15;
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v6 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_currentClickyOrbMenu);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_currentClickyOrbMenu) = (Class)a3;
  id v5 = a3;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  uint64_t v10 = self;
  sub_1003124CC(a5);

  swift_unknownObjectRelease();
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id v8 = self;
  id v9 = DOCItemCollectionViewController.contextMenuInteraction(_:configurationForMenuAtLocation:)(v7, x, y);

  return v9;
}

- (id)contextMenuForItemsAt:(id)a3
{
  sub_1004CE6C0();
  uint64_t v4 = sub_1004D1510();
  id v5 = self;
  sub_1002E5238(v4);
  id v7 = v6;

  swift_bridgeObjectRelease();
  return v7;
}

- (id)contextMenuForFolder
{
  id v2 = self;
  v3.super.super.Class isa = sub_1002E5A3C().super.super.isa;

  return v3.super.super.isa;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  _s11SaveToFiles31DOCItemCollectionViewControllerC22contextMenuInteraction_022previewForHighlightingI17WithConfigurationSo17UITargetedPreviewCSgSo09UIContextiJ0C_So0riO0CtF_0(v6);
  uint64_t v10 = v9;

  return v10;
}

- (void)revealWithItems:(id)a3 selectEvenIfVisible:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v5 = a4;
  id v7 = _Block_copy(a5);
  sub_100036804(0, (unint64_t *)&qword_10062D590);
  unint64_t v8 = sub_1004D1510();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  uint64_t v10 = self;
  sub_1002E7BEC(v8, v5, (uint64_t)sub_100099730, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)getTransitionControllerForURL:(id)a3 completionBlock:(id)a4
{
  uint64_t v6 = sub_1004CE370();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  sub_1004CE320();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  id v12 = self;
  sub_100313574(v9, (char *)v12, (void (*)(id))sub_100099978, v11, v12);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)getTransitionControllerForItem:(id)a3 completionBlock:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = self;
  id v9 = a3;
  uint64_t v10 = self;
  id v11 = [v8 defaultManager];
  id v12 = (void *)swift_allocObject();
  v12[2] = v10;
  v12[3] = v9;
  v12[4] = sub_100099748;
  v12[5] = v7;
  v16[4] = sub_100317C64;
  v16[5] = v12;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 1107296256;
  v16[2] = sub_100158C50;
  v16[3] = &unk_1005D0208;
  uint64_t v13 = _Block_copy(v16);
  id v14 = v9;
  id v15 = v10;
  swift_retain();
  swift_release();
  [v11 fetchURLForItem:v14 completionHandler:v13];
  _Block_release(v13);

  swift_release();
}

- (void)getPopoverTrackerForItem:(id)a3 completionBlock:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = self;
  id v9 = a3;
  uint64_t v10 = self;
  id v11 = [v8 defaultManager];
  id v12 = (void *)swift_allocObject();
  v12[2] = v10;
  v12[3] = v9;
  v12[4] = sub_100099748;
  v12[5] = v7;
  v16[4] = sub_100317BDC;
  v16[5] = v12;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 1107296256;
  v16[2] = sub_100158C50;
  v16[3] = &unk_1005D00F0;
  uint64_t v13 = _Block_copy(v16);
  id v14 = v9;
  id v15 = v10;
  swift_retain();
  swift_release();
  [v11 fetchURLForItem:v14 completionHandler:v13];
  _Block_release(v13);

  swift_release();
}

- (void)getViewFor:(id)a3 waitForNewThumbnail:(BOOL)a4 :(id)a5
{
  BOOL v5 = a4;
  uint64_t v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  uint64_t v10 = self;
  sub_100313E88((uint64_t)v9, v5, (char *)v10, v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)getCellFor:(id)a3 :(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = self;
  id v9 = a3;
  uint64_t v10 = self;
  id v11 = [v8 defaultManager];
  id v12 = (void *)swift_allocObject();
  v12[2] = v10;
  v12[3] = v9;
  v12[4] = sub_100099738;
  v12[5] = v7;
  v16[4] = sub_10031C648;
  v16[5] = v12;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 1107296256;
  v16[2] = sub_100158C50;
  v16[3] = &unk_1005CFE98;
  uint64_t v13 = _Block_copy(v16);
  id v14 = v9;
  id v15 = v10;
  swift_retain();
  swift_release();
  [v11 fetchURLForItem:v14 completionHandler:v13];
  _Block_release(v13);

  swift_release();
}

- (BOOL)wantsAppearanceOverride
{
  return 1;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  int64_t v9 = _s11SaveToFiles31DOCItemCollectionViewControllerC25adaptivePresentationStyle3for05traitE0So07UIModaliJ0VSo014UIPresentationG0C_So07UITraitE0CtF_0(v6);

  return v9;
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  uint64_t v8 = sub_1004CE6C0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004CE650();
  id v12 = a3;
  swift_unknownObjectRetain();
  uint64_t v13 = self;
  sub_1003AA2B4(a4, (uint64_t)v11);

  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_100036804(0, &qword_100635990);
  v14.super.Class isa = sub_1004D14F0().super.isa;
  swift_bridgeObjectRelease();
  return v14.super.isa;
}

- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  uint64_t v9 = sub_1004CE6C0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004CE650();
  id v13 = a3;
  swift_unknownObjectRetain();
  NSArray v14 = self;
  sub_1003AA4A8((void (**)(char *, uint64_t))a4, (uint64_t)v12);

  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_100036804(0, &qword_100635990);
  v15.super.Class isa = sub_1004D14F0().super.isa;
  swift_bridgeObjectRelease();
  return v15.super.isa;
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
}

- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1004CE6C0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004CE650();
  id v10 = a3;
  uint64_t v11 = self;
  id v12 = sub_1003AA948((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4
{
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  DOCItemCollectionViewController.collectionView(_:performDropWith:)(v6, a4);

  swift_unknownObjectRelease();
}

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  sub_1003AABA4(a4);
  char v9 = v8;

  swift_unknownObjectRelease();
  return v9 & 1;
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  uint64_t v9 = sub_100026870((uint64_t *)&unk_100632630);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    sub_1004CE650();
    uint64_t v12 = sub_1004CE6C0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = sub_1004CE6C0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  id v14 = a3;
  swift_unknownObjectRetain();
  NSArray v15 = self;
  uint64_t v16 = (void *)DOCItemCollectionViewController.collectionView(_:dropSessionDidUpdate:withDestinationIndexPath:)(v14, (void (**)(char *, uint64_t))a4, (uint64_t)v11);

  swift_unknownObjectRelease();
  sub_10003D810((uint64_t)v11, (uint64_t *)&unk_100632630);
  return v16;
}

- (void)collectionView:(id)a3 dropSessionDidEnter:(id)a4
{
}

- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_currentDropSession) = 0;
  swift_unknownObjectRelease();
}

- (void)collectionView:(id)a3 dropSessionDidExit:(id)a4
{
}

- (int64_t)_collectionView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5
{
  uint64_t v8 = sub_100026870((uint64_t *)&unk_100632630);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v21 - v12;
  if (a5)
  {
    sub_1004CE650();
    uint64_t v14 = sub_1004CE6C0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 0, 1, v14);
  }
  else
  {
    uint64_t v14 = sub_1004CE6C0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
  }
  sub_100108824((uint64_t)v13, (uint64_t)v10);
  sub_1004CE6C0();
  uint64_t v15 = *(void *)(v14 - 8);
  int64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48))(v10, 1, v14);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    swift_unknownObjectRetain();
    uint64_t v17 = self;
    id v18 = a3;
    v19 = sub_1003A9CB4((uint64_t)v10);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v10, v14);
    if (v19)
    {
      swift_getObjectType();
      int64_t v20 = sub_1001D89C0();
      swift_unknownObjectRelease();

      swift_unknownObjectRelease();
    }
    else
    {
      swift_unknownObjectRelease();

      int64_t v20 = 0;
    }

    sub_10003D810((uint64_t)v13, (uint64_t *)&unk_100632630);
    return v20;
  }
  return result;
}

- (int64_t)_collectionView:(id)a3 dataOwnerForDropSession:(id)a4 withDestinationIndexPath:(id)a5
{
  uint64_t v9 = sub_100026870((uint64_t *)&unk_100632630);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    sub_1004CE650();
    uint64_t v12 = sub_1004CE6C0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = sub_1004CE6C0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  id v14 = a3;
  swift_unknownObjectRetain();
  uint64_t v15 = self;
  uint64_t v16 = DOCItemCollectionViewController._collectionView(_:dataOwnerFor:withDestinationIndexPath:)(a3, a4, (uint64_t)v11);

  swift_unknownObjectRelease();
  sub_10003D810((uint64_t)v11, (uint64_t *)&unk_100632630);
  return (int64_t)v16;
}

- (BOOL)becomeKeyboardFocused
{
  id v2 = self;
  Swift::Bool v3 = DOCItemCollectionViewController.becomeKeyboardFocused()();

  return v3;
}

- (BOOL)isInKeyWindow
{
  id v2 = self;
  id v3 = [(DOCItemCollectionViewController *)v2 viewIfLoaded];
  uint64_t v4 = v3;
  if (v3)
  {
    BOOL v5 = (_TtC11SaveToFiles31DOCItemCollectionViewController *)[v3 window];

    if (v5)
    {
      LOBYTE(v4) = [(DOCItemCollectionViewController *)v5 isKeyWindow];

      id v2 = v5;
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }

  return (char)v4;
}

- (BOOL)acceptsKeyboardFocus
{
  id v2 = self;
  char v3 = DOCItemCollectionViewController.acceptsKeyboardFocus.getter();

  return v3 & 1;
}

- (CGRect)absoluteFrame
{
  id v2 = self;
  DOCItemCollectionViewController.absoluteFrame.getter();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (void)firstItemInsertionRequestsFocusExpired
{
  id v2 = self;
  sub_100486854();
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
}

- (BOOL)forceDisableDictation
{
  return 1;
}

- (void)performCreateFolder:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1002BB51C(0, 1);
}

- (void)performCreateFolderWithSelection:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1002BB51C(1, 1);
}

- (void)performDeselectAll:(id)a3
{
  uint64_t v3 = OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_performingBatchSelection;
  if ((*((unsigned char *)&self->super.super.super.super.super.isa
        + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_performingBatchSelection) & 1) == 0)
  {
    *((unsigned char *)&self->super.super.super.super.super.isa
    + OBJC_IVAR____TtC11SaveToFiles31DOCItemCollectionViewController_performingBatchSelection) = 1;
    id v5 = a3;
    double v6 = self;
    sub_1002B0B10(0, (uint64_t)_swiftEmptyArrayStorage);
    *((unsigned char *)&self->super.super.super.super.super.isa + v3) = 0;
  }
}

- (void)performDuplicate:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1004BCD54();
}

- (void)performDelete:(id)a3
{
}

- (void)performDeleteNow:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1004BDAE0();
}

- (void)performMoveHere:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1004B717C(v4);
}

- (void)performOpen:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1004BCEF4();
}

- (void)performCommandReturnKey:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1004BD334();
}

- (void)performConfirmPickerExportOrDrillIn:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1004B6244();
}

- (void)performRename:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1004B7A48((uint64_t)v4);
}

- (void)performPreview:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1004BD444();
}

- (void)performMarkAsFavorite:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1004BDAE0();
}

- (void)performGoToEnclosingFolder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1004BDC58();
}

- (void)performRevealItem:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1004BDD00();
}

- (void)performGetInfo:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1004BDAE0();
}

- (void)performDismiss:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1004B89B4(v4);
}

- (NSArray)keyCommands
{
  id v2 = self;
  uint64_t v3 = DOCItemCollectionViewController.keyCommands.getter();

  if (v3)
  {
    sub_100036804(0, (unint64_t *)&unk_10062F4D0);
    v4.super.Class isa = sub_1004D14F0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.Class isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    double v6 = self;
    swift_unknownObjectRetain();
    sub_1004D29A0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    double v7 = self;
  }
  char v8 = DOCItemCollectionViewController.canPerformAction(_:withSender:)((char *)a3, (uint64_t)v10);

  sub_10003D810((uint64_t)v10, &qword_10062D740);
  return v8 & 1;
}

- (void)validateCommand:(id)a3
{
  id v4 = a3;
  id v5 = self;
  DOCItemCollectionViewController.validate(_:)((UICommand)v4);
}

@end