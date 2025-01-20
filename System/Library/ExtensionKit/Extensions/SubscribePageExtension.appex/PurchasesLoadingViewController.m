@interface PurchasesLoadingViewController
- (_TtC22SubscribePageExtension30PurchasesLoadingViewController)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension30PurchasesLoadingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PurchasesLoadingViewController

- (_TtC22SubscribePageExtension30PurchasesLoadingViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_loggedInUserPurchases) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_familyPurchases) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_overlayViewController) = 0;
  id v4 = a3;

  result = (_TtC22SubscribePageExtension30PurchasesLoadingViewController *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100730E20();
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  id v3 = [(PurchasesLoadingViewController *)v2 traitCollection];
  id v4 = [v3 userInterfaceIdiom];

  if (v4 == (id)1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_100731108();
}

- (_TtC22SubscribePageExtension30PurchasesLoadingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC22SubscribePageExtension30PurchasesLoadingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_loggedInUserPurchases));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_familyPurchases));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_overlayViewController));

  swift_release();
}

@end