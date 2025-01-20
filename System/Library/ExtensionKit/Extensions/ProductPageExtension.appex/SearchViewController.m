@interface SearchViewController
- (_TtC20ProductPageExtension20SearchViewController)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension20SearchViewController)initWithNibName:(id)a3 bundle:(id)a4;
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

- (_TtC20ProductPageExtension20SearchViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10027C410();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100275764();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_100275D0C(a3);
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
  sub_100275F1C(v6, (uint64_t)a4);

  swift_unknownObjectRelease();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_10027604C(a3);
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
  objc_msgSend(*(id *)&v7[OBJC_IVAR____TtC20ProductPageExtension20SearchViewController_searchResultsContainerViewController], "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height, v8.receiver, v8.super_class);
  swift_unknownObjectRelease();
}

- (void)viewWillLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SearchViewController();
  v2 = (char *)v4.receiver;
  [(SearchViewController *)&v4 viewWillLayoutSubviews];
  id v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC20ProductPageExtension20SearchViewController_searchController], "searchBar", v4.receiver, v4.super_class);
  [v2 pageMarginInsets];
  objc_msgSend(v3, "setLayoutMargins:");
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_100276398();
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10027C57C();
}

- (void)presentSearchController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100277B0C(v4);
}

- (void)willDismissSearchController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100277C6C(v4);
}

- (void)didDismissSearchController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100601B78(0);
}

- (void)willPresentSearchController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1000DB9C8();
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100278338(v4);
}

- (_TtC20ProductPageExtension20SearchViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC20ProductPageExtension20SearchViewController *)_swift_stdlib_reportUnimplementedInitializer();
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
                     + OBJC_IVAR____TtC20ProductPageExtension20SearchViewController____lazy_storage___resultsMessageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20SearchViewController____lazy_storage___tokenPalette));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20SearchViewController_searchTextInput));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20SearchViewController_searchController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20SearchViewController_searchResultsContainerViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20SearchViewController_searchLandingViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20SearchViewController_facetNavigationController));
  swift_unknownObjectRelease();
  swift_release();
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension20SearchViewController_guidedSearchContainerImpressionMetrics, (uint64_t *)&unk_100956270);

  swift_bridgeObjectRelease();
}

@end