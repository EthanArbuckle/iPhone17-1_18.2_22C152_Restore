@interface DOCSidebarViewController
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5;
- (BOOL)isEditing;
- (BOOL)scrollViewShouldScrollToTop:(id)a3;
- (BOOL)sidebarHasActiveFocus;
- (BOOL)sidebarVisibilityPinnedToWindowSizingOnly;
- (DOCConcreteLocation)selectedLocation;
- (NSArray)additionalTrailingNavigationBarButtonItems;
- (NSArray)customActions;
- (UICollectionView)collectionView;
- (UICollectionViewCompositionalLayout)collectionViewLayout;
- (_TtC11SaveToFiles16DOCPickerContext)pickerContext;
- (_TtC11SaveToFiles19DOCSearchController)searchController;
- (_TtC11SaveToFiles24DOCSidebarViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC11SaveToFiles24DOCSidebarViewController)initWithConfiguration:(id)a3 sourceObserver:(id)a4;
- (_TtP11SaveToFiles32DOCSidebarViewControllerDelegate_)sidebarDelegate;
- (id)_multitaskingDragExclusionRects;
- (id)_newCollectionViewWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)collectionView:(id)a3 targetIndexPathForMoveFromItemAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (int64_t)_collectionView:(id)a3 dataOwnerForDropSession:(id)a4 withDestinationIndexPath:(id)a5;
- (void)_doc_performLiveResizeSkipped_updateNavigationButtons;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4;
- (void)collectionView:(id)a3 dropSessionDidEnter:(id)a4;
- (void)collectionView:(id)a3 dropSessionDidExit:(id)a4;
- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4;
- (void)dealloc;
- (void)effectiveAppearanceDidChange:(id)a3;
- (void)getCellFor:(id)a3 :(id)a4;
- (void)getPopoverTrackerForItem:(id)a3 completionBlock:(id)a4;
- (void)getTransitionControllerForItem:(id)a3 completionBlock:(id)a4;
- (void)getTransitionControllerForURL:(id)a3 completionBlock:(id)a4;
- (void)getViewFor:(id)a3 waitForNewThumbnail:(BOOL)a4 :(id)a5;
- (void)noteBrowserDidUpdateHierarchy:(id)a3 displayedRootLocation:(id)a4;
- (void)performFind:(id)a3;
- (void)revealWithItems:(id)a3 selectEvenIfVisible:(BOOL)a4 completionBlock:(id)a5;
- (void)setAdditionalTrailingNavigationBarButtonItems:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setCustomActions:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setPickerContext:(id)a3;
- (void)setSceneIdentifier:(id)a3;
- (void)setSearchController:(id)a3;
- (void)setSidebarDelegate:(id)a3;
- (void)setSidebarHasActiveFocus:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateSelectionToMatchBrowsedLocation:(id)a3 scrollToVisible:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)withLocationChangePacingDisabled:(id)a3;
@end

@implementation DOCSidebarViewController

- (BOOL)sidebarHasActiveFocus
{
  return *((unsigned char *)&self->super.super.super.super.super.isa
         + OBJC_IVAR____TtC11SaveToFiles24DOCSidebarViewController_sidebarHasActiveFocus);
}

- (void)setSidebarHasActiveFocus:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC11SaveToFiles24DOCSidebarViewController_sidebarHasActiveFocus) = a3;
}

- (_TtP11SaveToFiles32DOCSidebarViewControllerDelegate_)sidebarDelegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  return (_TtP11SaveToFiles32DOCSidebarViewControllerDelegate_ *)Strong;
}

- (void)setSidebarDelegate:(id)a3
{
}

- (_TtC11SaveToFiles16DOCPickerContext)pickerContext
{
  return (_TtC11SaveToFiles16DOCPickerContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC11SaveToFiles24DOCSidebarViewController_pickerContext));
}

- (void)setPickerContext:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_100061904(a3);
}

- (DOCConcreteLocation)selectedLocation
{
  return (DOCConcreteLocation *)objc_retainAutoreleaseReturnValue((*(id **)((char *)&self->super.super.super.super.super.isa
                                                                          + OBJC_IVAR____TtC11SaveToFiles24DOCSidebarViewController_locationSelection))[2]);
}

- (_TtC11SaveToFiles19DOCSearchController)searchController
{
  return (_TtC11SaveToFiles19DOCSearchController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                           + OBJC_IVAR____TtC11SaveToFiles24DOCSidebarViewController_searchController));
}

- (void)setSearchController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC11SaveToFiles24DOCSidebarViewController_searchController);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11SaveToFiles24DOCSidebarViewController_searchController) = (Class)a3;
  id v3 = a3;
}

- (NSArray)additionalTrailingNavigationBarButtonItems
{
  return (NSArray *)sub_100054C40((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC11SaveToFiles24DOCSidebarViewController_additionalTrailingNavigationBarButtonItems, (unint64_t *)&qword_100632710);
}

- (void)setAdditionalTrailingNavigationBarButtonItems:(id)a3
{
  sub_100036804(0, (unint64_t *)&qword_100632710);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11SaveToFiles24DOCSidebarViewController_additionalTrailingNavigationBarButtonItems) = (Class)sub_1004D1510();
  id v4 = self;
  swift_bridgeObjectRelease();
  sub_100054504();
}

- (NSArray)customActions
{
  return (NSArray *)sub_100054C40((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC11SaveToFiles24DOCSidebarViewController_customActions, &qword_100633AA0);
}

- (void)setCustomActions:(id)a3
{
  sub_100036804(0, &qword_100633AA0);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11SaveToFiles24DOCSidebarViewController_customActions) = (Class)sub_1004D1510();
  id v6 = self;
  swift_bridgeObjectRelease();
  id v4 = *(void (**)(uint64_t))((swift_isaMask & **(void **)((char *)&v6->super.super.super.super.super.isa
                                                                     + OBJC_IVAR____TtC11SaveToFiles24DOCSidebarViewController_actionManager))
                                      + 0xB8);
  uint64_t v5 = swift_bridgeObjectRetain();
  v4(v5);
}

- (UICollectionView)collectionView
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCSidebarViewController(0);
  v2 = [(DOCSidebarViewController *)&v4 collectionView];
  return v2;
}

- (void)setCollectionView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCSidebarViewController(0);
  [(DOCSidebarViewController *)&v4 setCollectionView:a3];
}

- (_TtC11SaveToFiles24DOCSidebarViewController)initWithConfiguration:(id)a3 sourceObserver:(id)a4
{
  return (_TtC11SaveToFiles24DOCSidebarViewController *)sub_100054EE0(a3, a4);
}

- (void)dealloc
{
  v2 = self;
  DOCSidebarViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_10003BA48((uint64_t)self + OBJC_IVAR____TtC11SaveToFiles24DOCSidebarViewController_sidebarDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles24DOCSidebarViewController_pickerContext));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles24DOCSidebarViewController_configuration));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles24DOCSidebarViewController_sourceObserver));
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles24DOCSidebarViewController_favoritesSubscriber));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles24DOCSidebarViewController_recentlyUsedFavoritesSubscriber));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles24DOCSidebarViewController_trashObserver));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles24DOCSidebarViewController_trashSubscriber));
  sub_10003D810((uint64_t)self + OBJC_IVAR____TtC11SaveToFiles24DOCSidebarViewController__diffableDataSource, &qword_10062D740);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles24DOCSidebarViewController_dropPointIndicatorView));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10003D810((uint64_t)self + OBJC_IVAR____TtC11SaveToFiles24DOCSidebarViewController_preferredFocusIndexPath, (uint64_t *)&unk_100632630);
  sub_100062B38(*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC11SaveToFiles24DOCSidebarViewController_currentlySelectedSidebarItem), *(void *)&self->sidebarHasActiveFocus[OBJC_IVAR____TtC11SaveToFiles24DOCSidebarViewController_currentlySelectedSidebarItem], *(void *)&self->sidebarDelegate[OBJC_IVAR____TtC11SaveToFiles24DOCSidebarViewController_currentlySelectedSidebarItem+ 7], self->pickerContext[OBJC_IVAR____TtC11SaveToFiles24DOCSidebarViewController_currentlySelectedSidebarItem + 7]);
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles24DOCSidebarViewController_searchController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles24DOCSidebarViewController_sourcesOrderObserver));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles24DOCSidebarViewController_actionManager));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles24DOCSidebarViewController_contextMenuInteraction));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC11SaveToFiles24DOCSidebarViewController_debugOptionsMenu);
}

- (_TtC11SaveToFiles24DOCSidebarViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC11SaveToFiles24DOCSidebarViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)effectiveAppearanceDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCSidebarViewController(0);
  id v4 = a3;
  id v5 = v6.receiver;
  [(DOCSidebarViewController *)&v6 effectiveAppearanceDidChange:v4];
  if (objc_msgSend(v5, "isViewLoaded", v6.receiver, v6.super_class)) {
    sub_10005A850();
  }
}

- (void)viewDidLoad
{
  v2 = self;
  DOCSidebarViewController.viewDidLoad()();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  DOCSidebarViewController.viewDidLayoutSubviews()();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  objc_super v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  DOCSidebarViewController.traitCollectionDidChange(_:)(v9);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  DOCSidebarViewController.viewWillAppear(_:)(a3);
}

- (void)viewIsAppearing:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCSidebarViewController(0);
  id v4 = v5.receiver;
  [(DOCSidebarViewController *)&v5 viewIsAppearing:v3];
  if (v4[OBJC_IVAR____TtC11SaveToFiles24DOCSidebarViewController_diffableNeedsReload] == 1) {
    sub_1001F6F70(v3, 1);
  }
  sub_10005B4B4(0, 1);
  if (sub_10005BA74() == 2)
  {
    sub_100270298(v3, objc_msgSend(v4, "transitionCoordinator", v5.receiver, v5.super_class));

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  DOCSidebarViewController.viewDidAppear(_:)(a3);
}

- (id)_multitaskingDragExclusionRects
{
  v2 = self;
  DOCSidebarViewController._multitaskingDragExclusionRects()();

  sub_100036804(0, (unint64_t *)&unk_100637C70);
  v3.super.isa = sub_1004D14F0().super.isa;
  swift_bridgeObjectRelease();
  return v3.super.isa;
}

- (void)_doc_performLiveResizeSkipped_updateNavigationButtons
{
  v2 = self;
  sub_100054504();
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    objc_super v6 = self;
    swift_unknownObjectRetain();
    sub_1004D29A0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v16, 0, sizeof(v16));
    v7 = self;
  }
  DOCSidebarViewController.target(forAction:withSender:)((uint64_t)a3, (uint64_t)v16, (uint64_t)v17);

  sub_10003D810((uint64_t)v16, &qword_10062D740);
  uint64_t v8 = v18;
  if (v18)
  {
    UITraitCollection_optional v9 = sub_100036428(v17, v18);
    uint64_t v10 = *(void *)(v8 - 8);
    double v11 = __chkstk_darwin(v9);
    v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, double))(v10 + 16))(v13, v11);
    v14 = (void *)sub_1004D2F80();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v8);
    sub_100035EE0((uint64_t)v17);
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    objc_super v6 = self;
    swift_unknownObjectRetain();
    sub_1004D29A0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  unsigned __int8 v8 = DOCSidebarViewController.canPerformAction(_:withSender:)((uint64_t)a3, (uint64_t)v10);

  sub_10003D810((uint64_t)v10, &qword_10062D740);
  return v8 & 1;
}

- (void)performFind:(id)a3
{
  id v4 = a3;
  unsigned __int8 v8 = self;
  id v5 = [(DOCSidebarViewController *)v8 navigationItem];
  id v6 = [v5 searchController];

  if (v6)
  {
    [v6 setActive:1];
    v7 = (_TtC11SaveToFiles24DOCSidebarViewController *)[v6 searchBar];
    [(DOCSidebarViewController *)v7 becomeFirstResponder];

    id v4 = v6;
    unsigned __int8 v8 = v7;
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1004CE6C0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  UITraitCollection_optional v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004CE650();
  id v10 = a3;
  double v11 = self;
  sub_100062164((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1004CE6C0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  UITraitCollection_optional v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004CE650();
  id v10 = (_TtC11SaveToFiles24DOCSidebarViewController *)a3;
  double v11 = self;
  if (sub_1002711EC())
  {
    unsigned __int8 v12 = 1;
  }
  else
  {
    Class isa = sub_1004CE610().super.isa;
    unsigned __int8 v12 = [(DOCSidebarViewController *)v11 collectionView:v10 shouldHighlightItemAtIndexPath:isa];

    id v10 = v11;
    double v11 = (_TtC11SaveToFiles24DOCSidebarViewController *)isa;
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1004CE6C0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  UITraitCollection_optional v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004CE650();
  id v10 = a3;
  double v11 = self;
  LOBYTE(self) = sub_100062368((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (void)withLocationChangePacingDisabled:(id)a3
{
  id v4 = (void (**)(void))_Block_copy(a3);
  id v5 = self;
  swift_retain();
  sub_100053B10();
  swift_release();
  v4[2](v4);
  _Block_release(v4);
}

- (void)updateSelectionToMatchBrowsedLocation:(id)a3 scrollToVisible:(BOOL)a4
{
  id v7 = a3;
  uint64_t v8 = self;
  sub_10005EFFC(a3, a4);
}

- (void)noteBrowserDidUpdateHierarchy:(id)a3 displayedRootLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  [(DOCSidebarViewController *)v8 updateSelectionToMatchBrowsedLocation:v7 scrollToVisible:0];
  sub_10026F250();
}

- (BOOL)sidebarVisibilityPinnedToWindowSizingOnly
{
  return 0;
}

- (void)setSceneIdentifier:(id)a3
{
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for DOCSidebarViewController(0);
  id v4 = a3;
  id v5 = v10.receiver;
  id v6 = [(DOCSidebarViewController *)&v10 collectionView];
  if (v6)
  {
    id v7 = v6;
    type metadata accessor for DOCSidebarCollectionView();
    unsigned __int8 v8 = objc_msgSend((id)swift_dynamicCastClassUnconditional(), "hasUncommittedUpdates", v10.receiver, v10.super_class);

    LOBYTE(v6) = v8 ^ 1;
  }
  else
  {
    __break(1u);
  }
  return (char)v6;
}

- (void)getTransitionControllerForURL:(id)a3 completionBlock:(id)a4
{
  uint64_t v6 = sub_1004CE370();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  UITraitCollection_optional v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_super v10 = _Block_copy(a4);
  sub_1004CE320();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  unsigned __int8 v12 = self;
  id v13 = sub_100097754();
  sub_1004CE2C0(v14);
  v16 = v15;
  aBlock[4] = sub_100099978;
  aBlock[5] = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1003E2784;
  aBlock[3] = &unk_1005BF0E0;
  v17 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  [v13 getTransitionControllerForURL:v16 completionBlock:v17];
  _Block_release(v17);

  swift_release();
  swift_unknownObjectRelease();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)getTransitionControllerForItem:(id)a3 completionBlock:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  UITraitCollection_optional v9 = self;
  id v10 = sub_100097754();
  v12[4] = sub_100099748;
  v12[5] = v7;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_1003E2784;
  v12[3] = &unk_1005BF090;
  uint64_t v11 = _Block_copy(v12);
  swift_retain();
  swift_release();
  [v10 getTransitionControllerForItem:v8 completionBlock:v11];
  _Block_release(v11);

  swift_release();
  swift_unknownObjectRelease();
}

- (void)getPopoverTrackerForItem:(id)a3 completionBlock:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  UITraitCollection_optional v9 = self;
  id v10 = sub_100097754();
  v12[4] = sub_100099748;
  v12[5] = v7;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_1003E2784;
  v12[3] = &unk_1005BF040;
  uint64_t v11 = _Block_copy(v12);
  swift_retain();
  swift_release();
  [v10 getPopoverTrackerForItem:v8 completionBlock:v11];
  _Block_release(v11);

  swift_release();
  swift_unknownObjectRelease();
}

- (void)getViewFor:(id)a3 waitForNewThumbnail:(BOOL)a4 :(id)a5
{
  BOOL v5 = a4;
  id v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  uint64_t v11 = self;
  id v12 = sub_100097754();
  v14[4] = sub_100099740;
  v14[5] = v9;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_10015A1A8;
  v14[3] = &unk_1005BEFF0;
  id v13 = _Block_copy(v14);
  swift_retain();
  swift_release();
  [v12 getViewFor:v10 waitForNewThumbnail:v5 :v13];
  _Block_release(v13);

  swift_release();
  swift_unknownObjectRelease();
}

- (void)getCellFor:(id)a3 :(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  uint64_t v9 = self;
  id v10 = sub_100097754();
  v12[4] = sub_100099738;
  v12[5] = v7;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_1003E27D4;
  v12[3] = &unk_1005BEFA0;
  uint64_t v11 = _Block_copy(v12);
  swift_retain();
  swift_release();
  [v10 getCellFor:v8 :v11];
  _Block_release(v11);

  swift_release();
  swift_unknownObjectRelease();
}

- (void)revealWithItems:(id)a3 selectEvenIfVisible:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v5 = a4;
  uint64_t v7 = _Block_copy(a5);
  sub_100036804(0, (unint64_t *)&qword_10062D590);
  sub_1004D1510();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  uint64_t v9 = self;
  id v10 = sub_100097754();
  Class isa = sub_1004D14F0().super.isa;
  v13[4] = sub_100099730;
  v13[5] = v8;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_10009081C;
  v13[3] = &unk_1005BEF50;
  id v12 = _Block_copy(v13);
  swift_retain();
  swift_release();
  [v10 revealWithItems:isa selectEvenIfVisible:v5 completionBlock:v12];
  _Block_release(v12);

  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
}

- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5
{
  uint64_t v7 = sub_1004CE6C0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004CE650();
  id v11 = a3;
  swift_unknownObjectRetain();
  id v12 = self;
  LOBYTE(self) = sub_1000D4C68((uint64_t)v10);

  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

- (id)collectionView:(id)a3 targetIndexPathForMoveFromItemAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  uint64_t v7 = sub_1004CE6C0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  id v13 = (char *)&v22 - v12;
  __chkstk_darwin(v14);
  v16 = (char *)&v22 - v15;
  sub_1004CE650();
  sub_1004CE650();
  id v17 = a3;
  uint64_t v18 = self;
  DOCSidebarViewController.collectionView(_:targetIndexPathForMoveFromItemAt:toProposedIndexPath:)(v17, (uint64_t)v13, (uint64_t)v10, (uint64_t)v16);

  v19 = *(void (**)(char *, uint64_t))(v8 + 8);
  v19(v10, v7);
  v19(v13, v7);
  v20.super.Class isa = sub_1004CE610().super.isa;
  v19(v16, v7);
  return v20.super.isa;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  sub_1000CD2F8(v6, a4);

  swift_unknownObjectRelease();
}

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  sub_1000D5AD8(a4);
  char v9 = v8;

  swift_unknownObjectRelease();
  return v9 & 1;
}

- (void)collectionView:(id)a3 dropSessionDidEnter:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  sub_1000D5C50((uint64_t)a4);

  swift_unknownObjectRelease();
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
  uint64_t v15 = self;
  v16 = sub_1000D5E68(a4, (uint64_t)v11);

  swift_unknownObjectRelease();
  sub_10003D810((uint64_t)v11, (uint64_t *)&unk_100632630);
  return v16;
}

- (void)collectionView:(id)a3 dropSessionDidExit:(id)a4
{
}

- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4
{
}

- (int64_t)_collectionView:(id)a3 dataOwnerForDropSession:(id)a4 withDestinationIndexPath:(id)a5
{
  uint64_t v9 = sub_100026870((uint64_t *)&unk_100632630);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  id v14 = (char *)&v24 - v13;
  if (!a5)
  {
    uint64_t v23 = sub_1004CE6C0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v14, 1, 1, v23);
    int64_t v18 = 0;
    goto LABEL_9;
  }
  sub_1004CE650();
  uint64_t v15 = sub_1004CE6C0();
  uint64_t v16 = *(void *)(v15 - 8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v14, 0, 1, v15);
  id v17 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48);
  int64_t v18 = 0;
  if (v17(v14, 1, v15) == 1 || a4 == 0) {
    goto LABEL_9;
  }
  sub_100036840((uint64_t)v14, (uint64_t)v11, (uint64_t *)&unk_100632630);
  int64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t))v17)(v11, 1, v15);
  if (result != 1)
  {
    id v21 = a3;
    swift_unknownObjectRetain();
    uint64_t v22 = self;
    int64_t v18 = sub_1000D6498((uint64_t)v11);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v11, v15);

    swift_unknownObjectRelease();
LABEL_9:
    sub_10003D810((uint64_t)v14, (uint64_t *)&unk_100632630);
    return v18;
  }
  __break(1u);
  return result;
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v7 = sub_1004CE6C0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004CE650();
  id v11 = a3;
  uint64_t v12 = self;
  Class v13 = sub_100183938((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (UICollectionViewCompositionalLayout)collectionViewLayout
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DOCSidebarViewController(0);
  id v2 = v7.receiver;
  int64_t result = [(DOCSidebarViewController *)&v7 collectionView];
  if (result)
  {
    id v4 = result;
    id v5 = [(UICollectionViewCompositionalLayout *)result collectionViewLayout];

    self;
    id v6 = (void *)swift_dynamicCastObjCClassUnconditional();
    return (UICollectionViewCompositionalLayout *)v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)_newCollectionViewWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  id v11 = self;
  id v12 = _s11SaveToFiles24DOCSidebarViewControllerC014_newCollectionE09withFrame010collectionE6LayoutSo012UICollectionE0CSgSo6CGRectV_So0meL0CSgtF_0(a4, x, y, width, height);

  return v12;
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  uint64_t v5 = sub_100026870((uint64_t *)&unk_100632630);
  __chkstk_darwin(v5 - 8);
  objc_super v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = a3;
  uint64_t v9 = self;
  DOCSidebarViewController.indexPathForPreferredFocusedView(in:)((uint64_t)v8, v7);

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

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self;
  _s11SaveToFiles24DOCSidebarViewControllerC010collectionE0_16didUpdateFocusIn4withySo012UICollectionE0C_So0mejI7ContextCSo27UIFocusAnimationCoordinatorCtF_0(v8, v9);
}

- (BOOL)isEditing
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC11SaveToFiles24DOCSidebarViewController_editingSession);
  return v2 && *(unsigned char *)(v2 + 17) != 0;
}

- (void)setEditing:(BOOL)a3
{
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  uint64_t v6 = self;
  DOCSidebarViewController.setEditing(_:animated:)(a3, a4);
}

@end