@interface MPSearchViewController
- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4;
- (MPSearchViewController)initWithCoder:(id)a3;
- (MPSearchViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (MPSearchViewControllerDelegate)delegate;
- (NSArray)searchControllers;
- (UINavigationController)hostingNavigationController;
- (double)heightForFooterInTableView:(id)a3;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)searchControllerProvider;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)viewForFooterInTableView:(id)a3;
- (int64_t)contentInsetAdjustmentBehavior;
- (void)prewarmSearchControllersAfterSeconds:(double)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setContentInsetAdjustmentBehavior:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setHostingNavigationController:(id)a3;
- (void)setSearchControllerProvider:(id)a3;
- (void)setSearchControllers:(id)a3;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
@end

@implementation MPSearchViewController

- (void)prewarmSearchControllersAfterSeconds:(double)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin();
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  type metadata accessor for MainActor();
  v9 = self;
  swift_retain();
  uint64_t v10 = static MainActor.shared.getter();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  *(void *)(v11 + 24) = &protocol witness table for MainActor;
  *(double *)(v11 + 32) = a3;
  *(void *)(v11 + 40) = v8;
  swift_release();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v6, (uint64_t)&closure #1 in SearchViewController.prewarmSearchControllers(after:)partial apply, v11);
  swift_release();
}

- (void)setDelegate:(id)a3
{
}

- (MPSearchViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (MPSearchViewController *)SearchViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (void)setSearchControllerProvider:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = partial apply for thunk for @escaping @callee_unowned @convention(block) () -> (@autoreleased NSArray);
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = (uint64_t *)((char *)self + OBJC_IVAR___MPSearchViewController_searchControllerProvider);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  outlined consume of (@escaping @callee_guaranteed () -> ())?(v7);
}

- (void)setHostingNavigationController:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  id v5 = a3;
  uint64_t v6 = self;
  SearchViewController.hostingNavigationController.didset();
}

- (MPSearchViewControllerDelegate)delegate
{
  return (MPSearchViewControllerDelegate *)@objc CallsSearchController.delegate.getter();
}

- (UINavigationController)hostingNavigationController
{
  return (UINavigationController *)@objc CallsSearchController.delegate.getter();
}

- (id)searchControllerProvider
{
  v2 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MPSearchViewController_searchControllerProvider);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed () -> (@owned [SearchController]);
    aBlock[3] = &block_descriptor_51;
    v4 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSArray)searchControllers
{
  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x108);
  uint64_t v3 = self;
  v4 = (void *)v2();
  (*(void (**)(void))((swift_isaMask & *v4) + 0x170))();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for SearchController);
  v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v5.super.isa;
}

- (void)setSearchControllers:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for SearchController);
  unint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  NSArray v5 = self;
  SearchViewController.searchControllers.setter(v4);
}

- (int64_t)contentInsetAdjustmentBehavior
{
  return (int64_t)[*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MPSearchViewController_tableView) contentInsetAdjustmentBehavior];
}

- (void)setContentInsetAdjustmentBehavior:(int64_t)a3
{
}

- (void)viewDidLoad
{
  v2 = self;
  SearchViewController.viewDidLoad()();
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v6 = self;
  uint64_t v3 = SearchViewController.contactAvatarCardController.getter();
  id v4 = ContactAvatarCardController.cardController.getter();

  id v5 = [(MPSearchViewController *)v6 view];
  [v4 setSourceView:v5];
}

- (void)viewIsAppearing:(BOOL)a3
{
  id v4 = self;
  SearchViewController.viewIsAppearing(_:)(a3);
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [v4 searchBar];
  (*(void (**)(void))((swift_isaMask & (uint64_t)v5->super.super.super.isa) + 0x1B8))();
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  SearchViewController.tableView(_:willDisplay:forRowAt:)((uint64_t)v12, (uint64_t)v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  id v12 = (void *)SearchViewController.tableView(_:trailingSwipeActionsConfigurationForRowAt:)((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  specialized SearchViewController.tableView(_:shouldDrawTopSeparatorForSection:)(a4);
  LOBYTE(a4) = v8;

  return a4 & 1;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  specialized SearchViewController.tableView(_:viewForHeaderInSection:)(a4);
  uint64_t v9 = v8;

  return v9;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  specialized SearchViewController.tableView(_:heightForHeaderInSection:)(a4);
  double v9 = v8;

  return v9;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  double v8 = specialized SearchViewController.tableView(_:heightForFooterInSection:)(a4);

  return v8;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  double v8 = (void *)specialized SearchViewController.tableView(_:viewForFooterInSection:)(a4);

  return v8;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return 1;
}

- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (id)viewForFooterInTableView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  if (SearchViewController.needsReindexing()()) {
    id v6 = SearchViewController.footerView.getter();
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (double)heightForFooterInTableView:(id)a3
{
  id v4 = (MPSearchViewController *)a3;
  id v5 = self;
  double v6 = 0.0;
  if (SearchViewController.needsReindexing()())
  {
    uint64_t v7 = (MPSearchViewController *)SearchViewController.footerView.getter();
    double v6 = (*(double (**)(void))((swift_isaMask & (uint64_t)v7->super.super.super.isa) + 0x78))();

    id v4 = v5;
    id v5 = v7;
  }

  return v6;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0xA8);
  id v5 = a3;
  uint64_t v7 = self;
  double v6 = (void *)v4();
  if (v6)
  {
    [v6 searchControllerBeginDragging];

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (MPSearchViewController)initWithCoder:(id)a3
{
  return (MPSearchViewController *)SearchViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR___MPSearchViewController_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  outlined destroy of weak (UIViewController & ContactAvatarCardControllerProtocol)?((uint64_t)self + OBJC_IVAR___MPSearchViewController_delegate);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MPSearchViewController____lazy_storage___footerView));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MPSearchViewController____lazy_storage___contactAvatarCardController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MPSearchViewController____lazy_storage___datasource));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___MPSearchViewController_searchControllerProvider);

  outlined consume of (@escaping @callee_guaranteed () -> ())?(v5);
}

@end