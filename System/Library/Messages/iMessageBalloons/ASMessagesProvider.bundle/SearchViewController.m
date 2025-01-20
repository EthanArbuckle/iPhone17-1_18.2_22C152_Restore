@interface SearchViewController
- (_TtC18ASMessagesProvider20SearchViewController)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider20SearchViewController)initWithNibName:(id)a3 bundle:(id)a4;
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

- (_TtC18ASMessagesProvider20SearchViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2C277C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_2BBBC4();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_2BC16C(a3);
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  id v3 = [(SearchViewController *)v2 traitCollection];
  v4 = (char *)[v3 userInterfaceIdiom];

  if (v4 == (unsigned char *)&def_270DE0 + 1) {
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
  sub_2BC37C(v6, (uint64_t)a4);

  swift_unknownObjectRelease();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_2BC4AC(a3);
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
  objc_msgSend(*(id *)&v7[OBJC_IVAR____TtC18ASMessagesProvider20SearchViewController_searchResultsContainerViewController], "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height, v8.receiver, v8.super_class);
  swift_unknownObjectRelease();
}

- (void)viewWillLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SearchViewController();
  v2 = (char *)v4.receiver;
  [(SearchViewController *)&v4 viewWillLayoutSubviews];
  id v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC18ASMessagesProvider20SearchViewController_searchController], "searchBar", v4.receiver, v4.super_class);
  [v2 pageMarginInsets];
  objc_msgSend(v3, "setLayoutMargins:");
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_2BC7F8();
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_2C28E8();
}

- (void)presentSearchController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_2BDF6C(v4);
}

- (void)willDismissSearchController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_2BE0CC(v4);
}

- (void)didDismissSearchController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_5DCEF4(0);
}

- (void)willPresentSearchController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_6CD078();
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_2BE798(v4);
}

- (_TtC18ASMessagesProvider20SearchViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC18ASMessagesProvider20SearchViewController *)_swift_stdlib_reportUnimplementedInitializer();
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
                     + OBJC_IVAR____TtC18ASMessagesProvider20SearchViewController____lazy_storage___resultsMessageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider20SearchViewController____lazy_storage___tokenPalette));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider20SearchViewController_searchTextInput));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider20SearchViewController_searchController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider20SearchViewController_searchResultsContainerViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider20SearchViewController_searchLandingViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider20SearchViewController_facetNavigationController));
  swift_unknownObjectRelease();
  swift_release();
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider20SearchViewController_guidedSearchContainerImpressionMetrics, (uint64_t *)&unk_951EB0);

  swift_bridgeObjectRelease();
}

@end