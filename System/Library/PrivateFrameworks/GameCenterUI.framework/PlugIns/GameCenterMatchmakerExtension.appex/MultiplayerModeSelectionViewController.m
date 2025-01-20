@interface MultiplayerModeSelectionViewController
+ (id)viewControllerWithRequest:(id)a3 game:(id)a4 multiplayerViewController:(id)a5 dismissHandler:(id)a6;
- (BOOL)isEligibleForGroupSession;
- (BOOL)isEntitledToUseGroupActivities;
- (BOOL)skipModeSelection;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSArray)preferredFocusEnvironments;
- (UICollectionView)collectionView;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (_TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController)initWithCoder:(id)a3;
- (_TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)contentScrollView;
- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)originalMatchmakingMode;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)didEnterBackgroundWithNotif:(id)a3;
- (void)donePressed:(id)a3;
- (void)launchSharePlayChiclet;
- (void)setCollectionView:(id)a3;
- (void)setIsEligibleForGroupSession:(BOOL)a3;
- (void)setIsEntitledToUseGroupActivities:(BOOL)a3;
- (void)setOriginalMatchmakingMode:(int64_t)a3;
- (void)setSkipModeSelection:(BOOL)a3;
- (void)showLobbyWithOriginalRequest;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willEnterForegroundWithNotif:(id)a3;
@end

@implementation MultiplayerModeSelectionViewController

- (BOOL)skipModeSelection
{
  return MultiplayerModeSelectionViewController.skipModeSelection.getter() & 1;
}

- (void)setSkipModeSelection:(BOOL)a3
{
}

- (int64_t)originalMatchmakingMode
{
  return MultiplayerModeSelectionViewController.originalMatchmakingMode.getter();
}

- (void)setOriginalMatchmakingMode:(int64_t)a3
{
  v4 = self;
  MultiplayerModeSelectionViewController.originalMatchmakingMode.setter(a3);
}

- (BOOL)isEligibleForGroupSession
{
  return MultiplayerModeSelectionViewController.isEligibleForGroupSession.getter() & 1;
}

- (void)setIsEligibleForGroupSession:(BOOL)a3
{
  v4 = self;
  MultiplayerModeSelectionViewController.isEligibleForGroupSession.setter(a3);
}

- (BOOL)isEntitledToUseGroupActivities
{
  return MultiplayerModeSelectionViewController.isEntitledToUseGroupActivities.getter() & 1;
}

- (void)setIsEntitledToUseGroupActivities:(BOOL)a3
{
  v4 = self;
  MultiplayerModeSelectionViewController.isEntitledToUseGroupActivities.setter(a3);
}

- (void)launchSharePlayChiclet
{
  v2 = self;
  MultiplayerModeSelectionViewController.launchSharePlayChiclet()();
}

- (void)showLobbyWithOriginalRequest
{
  v2 = self;
  MultiplayerModeSelectionViewController.showLobbyWithOriginalRequest()();
}

- (UICollectionView)collectionView
{
  v2 = (void *)MultiplayerModeSelectionViewController.contentScrollView()();

  return (UICollectionView *)v2;
}

- (void)setCollectionView:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10000FEF4(a3);
}

- (void)dealloc
{
  v2 = self;
  MultiplayerModeSelectionViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_matchRequest));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_game));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_multiplayerViewController));
  sub_10000EBD0(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_dismissHandler));
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_kvoToken));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_sharePlayModeChiclet));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_inviteFriendsModeChiclet));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_quickMatchModeChiclet));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_emptyStateView);
}

- (id)contentScrollView
{
  v2 = (void *)MultiplayerModeSelectionViewController.contentScrollView()();

  return v2;
}

- (void)viewDidLoad
{
  v2 = self;
  MultiplayerModeSelectionViewController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  MultiplayerModeSelectionViewController.viewWillAppear(_:)(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  MultiplayerModeSelectionViewController.viewWillDisappear(_:)(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  MultiplayerModeSelectionViewController.viewDidAppear(_:)(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  MultiplayerModeSelectionViewController.viewDidDisappear(_:)(a3);
}

- (NSArray)preferredFocusEnvironments
{
  v2 = self;
  MultiplayerModeSelectionViewController.preferredFocusEnvironments.getter();

  sub_100007328(&qword_1000296B8);
  v3.super.isa = sub_1000162D0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (void)viewSafeAreaInsetsDidChange
{
  v2 = self;
  MultiplayerModeSelectionViewController.viewSafeAreaInsetsDidChange()();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  MultiplayerModeSelectionViewController.traitCollectionDidChange(_:)(v9);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  MultiplayerModeSelectionViewController.viewWillLayoutSubviews()();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  MultiplayerModeSelectionViewController.viewWillTransition(to:with:)((uint64_t)a4, width, height);
  swift_unknownObjectRelease();
}

- (void)donePressed:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_100016430();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    id v5 = self;
  }
  sub_10001189C();

  sub_100015A28((uint64_t)v6);
}

+ (id)viewControllerWithRequest:(id)a3 game:(id)a4 multiplayerViewController:(id)a5 dismissHandler:(id)a6
{
  UITraitCollection_optional v9 = _Block_copy(a6);
  if (v9)
  {
    *(void *)(swift_allocObject() + 16) = v9;
    UITraitCollection_optional v9 = sub_100015AC0;
  }
  swift_getObjCClassMetadata();
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  static MultiplayerModeSelectionViewController.viewController(request:game:multiplayerViewController:dismissHandler:)();
  v14 = v13;
  sub_10000EBD0((uint64_t)v9);

  return v14;
}

- (void)didEnterBackgroundWithNotif:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100012B04();
}

- (void)willEnterForegroundWithNotif:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100012B88();
}

- (_TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return (_TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController *)sub_10001316C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, void *))MultiplayerModeSelectionViewController.init(nibName:bundle:));
}

- (_TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController)initWithCoder:(id)a3
{
  return (_TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController *)MultiplayerModeSelectionViewController.init(coder:)(a3);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5 = a3;
  v6 = self;
  Swift::Int v8 = MultiplayerModeSelectionViewController.collectionView(_:numberOfItemsInSection:)((UICollectionView)v6, v7);

  return v8;
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  uint64_t v5 = sub_100007328(&qword_100029820);
  __chkstk_darwin(v5 - 8);
  Swift::Int v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = a3;
  UITraitCollection_optional v9 = self;
  MultiplayerModeSelectionViewController.indexPathForPreferredFocusedView(in:)((uint64_t)v7);

  uint64_t v10 = sub_100016180();
  Class isa = 0;
  if (sub_100015A00((uint64_t)v7, 1, v10) != 1)
  {
    Class isa = sub_100016140().super.isa;
    (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v7, v10);
  }

  return isa;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_100016180();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  UITraitCollection_optional v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100016150();
  id v10 = a3;
  id v11 = self;
  id v12 = (void *)MultiplayerModeSelectionViewController.collectionView(_:cellForItemAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_100016180();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  UITraitCollection_optional v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100016150();
  id v10 = a3;
  id v11 = self;
  MultiplayerModeSelectionViewController.collectionView(_:didSelectItemAt:)();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_100016180();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100016150();
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  MultiplayerModeSelectionViewController.collectionView(_:layout:sizeForItemAt:)(v12);
  double v16 = v15;
  double v18 = v17;

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  double v19 = v16;
  double v20 = v18;
  result.double height = v20;
  result.double width = v19;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  double v10 = MultiplayerModeSelectionViewController.collectionView(_:layout:minimumLineSpacingForSectionAt:)();

  return v10;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = self;
  MultiplayerModeSelectionViewController.collectionView(_:layout:insetForSectionAt:)(v8, (uint64_t)v9, a5);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.right = v22;
  result.bottom = v21;
  result.left = v20;
  result.top = v19;
  return result;
}

@end