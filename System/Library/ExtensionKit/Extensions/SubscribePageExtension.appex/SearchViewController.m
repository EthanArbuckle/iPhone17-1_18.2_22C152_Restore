@interface SearchViewController
- (_TtC22SubscribePageExtension20SearchViewController)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension20SearchViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)didDismissSearchController:(id)a3;
- (void)presentSearchController:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willDismissSearchController:(id)a3;
- (void)willPresentSearchController:(id)a3;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SearchViewController

- (_TtC22SubscribePageExtension20SearchViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100595E8C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1005931B8();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_100593760(a3);
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  id v3 = [(SearchViewController *)v2 traitCollection];
  id v4 = [v3 userInterfaceIdiom];

  if (v4 == (id)1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  sub_100593970(v6, (uint64_t)a4);

  swift_unknownObjectRelease();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_100593AA0(a3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SearchViewController();
  swift_unknownObjectRetain();
  v7 = (char *)v8.receiver;
  -[SearchViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  objc_msgSend(*(id *)&v7[OBJC_IVAR____TtC22SubscribePageExtension20SearchViewController_searchResultsContainerViewController], "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height, v8.receiver, v8.super_class);
  swift_unknownObjectRelease();
}

- (void)viewWillLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SearchViewController();
  v2 = (char *)v4.receiver;
  [(SearchViewController *)&v4 viewWillLayoutSubviews];
  id v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC22SubscribePageExtension20SearchViewController_searchController], "searchBar", v4.receiver, v4.super_class);
  [v2 pageMarginInsets];
  objc_msgSend(v3, "setLayoutMargins:");
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_100593DEC();
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100595D58();
}

- (void)presentSearchController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10058F368(v4);
}

- (void)willDismissSearchController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10058F460(v4);
}

- (void)didDismissSearchController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1006C9258(0);
}

- (void)willPresentSearchController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1002DFFBC();
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10058F9D8(v4);
}

- (_TtC22SubscribePageExtension20SearchViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC22SubscribePageExtension20SearchViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20SearchViewController____lazy_storage___resultsMessageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20SearchViewController____lazy_storage___tokenPalette));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20SearchViewController_searchTextInput));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20SearchViewController_searchController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20SearchViewController_searchResultsContainerViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20SearchViewController_searchLandingViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20SearchViewController_facetNavigationController));
  swift_unknownObjectRelease();
  swift_release();
  sub_10000FED8((uint64_t)self+ OBJC_IVAR____TtC22SubscribePageExtension20SearchViewController_guidedSearchContainerImpressionMetrics, (uint64_t *)&unk_1009369D0);

  swift_bridgeObjectRelease();
}

@end