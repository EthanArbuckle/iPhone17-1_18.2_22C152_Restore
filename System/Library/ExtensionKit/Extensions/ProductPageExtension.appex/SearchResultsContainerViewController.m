@interface SearchResultsContainerViewController
- (_TtC20ProductPageExtension36SearchResultsContainerViewController)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension36SearchResultsContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)as_viewDidBecomeFullyVisible;
- (void)as_viewDidBecomePartiallyVisible;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation SearchResultsContainerViewController

- (_TtC20ProductPageExtension36SearchResultsContainerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100601D64();
}

- (void)as_viewDidBecomeFullyVisible
{
}

- (void)viewDidAppear:(BOOL)a3
{
}

- (void)as_viewDidBecomePartiallyVisible
{
}

- (void)viewDidDisappear:(BOOL)a3
{
}

- (_TtC20ProductPageExtension36SearchResultsContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC20ProductPageExtension36SearchResultsContainerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  sub_10000F76C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension36SearchResultsContainerViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension36SearchResultsContainerViewController_searchFocusViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension36SearchResultsContainerViewController_searchHintsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension36SearchResultsContainerViewController_searchResultsViewController));
  sub_10000F76C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension36SearchResultsContainerViewController_searchResultsDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension36SearchResultsContainerViewController_activeSearchSectionViewController));

  swift_release();
}

@end