@interface PurchasesViewController
- (CGRect)_searchBar:(id)a3 proposedSearchFieldFrame:(CGRect)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)as_viewDidBecomePartiallyVisible;
- (void)as_viewWillBecomeFullyVisible;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)unhideAll;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PurchasesViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100437CCC();
}

- (void)viewWillAppear:(BOOL)a3
{
}

- (void)as_viewWillBecomeFullyVisible
{
}

- (void)viewDidDisappear:(BOOL)a3
{
}

- (void)as_viewDidBecomePartiallyVisible
{
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_10043928C();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_1004395D4((uint64_t)a4, width, height);
  swift_unknownObjectRelease();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100439A48((uint64_t)a3);
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  id v3 = [(PurchasesViewController *)v2 traitCollection];
  id v4 = [v3 userInterfaceIdiom];

  if (v4 == (id)1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)unhideAll
{
  v2 = self;
  sub_100774970();
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  sub_10077BCB0();
  id v6 = a3;
  v7 = self;
  swift_bridgeObjectRetain();
  sub_100774930();

  swift_bridgeObjectRelease();
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v4 = a3;
  v7 = self;
  [v4 resignFirstResponder];
  id v5 = [v4 text];
  if (v5)
  {
    id v6 = v5;
    sub_10077BCB0();
  }
  sub_100774930();
}

- (CGRect)_searchBar:(id)a3 proposedSearchFieldFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat y = a4.origin.y;
  v7 = self;
  id v8 = a3;
  [(PurchasesViewController *)v7 pageMarginInsets];
  double v10 = v9;
  double v12 = v11;
  id v13 = [(PurchasesViewController *)v7 view];
  if (v13)
  {
    v18 = v13;
    [v13 bounds];
    double v20 = v19;

    double v21 = v20 - v10 - v12;
    [(PurchasesViewController *)v7 pageMarginInsets];
    double v23 = v22;

    double v14 = v23;
    double v15 = y;
    double v16 = v21;
    double v17 = height;
  }
  else
  {
    __break(1u);
  }
  result.size.CGFloat height = v17;
  result.size.double width = v16;
  result.origin.CGFloat y = v15;
  result.origin.x = v14;
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23PurchasesViewController_purchasesCollectionViewDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23PurchasesViewController_purchasesCollectionViewDelegate));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23PurchasesViewController_collectionViewTableLayout));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23PurchasesViewController_segmentedControlView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23PurchasesViewController_searchBar));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23PurchasesViewController_hideAllButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23PurchasesViewController_doneButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23PurchasesViewController_emptyStateView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension23PurchasesViewController_flowPreviewing);
}

@end