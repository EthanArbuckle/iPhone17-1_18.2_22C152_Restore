@interface MarketingWebViewController
- (_TtC16FitnessMarketing26MarketingWebViewController)initWithBag:(id)a3 account:(id)a4 clientInfo:(id)a5;
- (_TtC16FitnessMarketing26MarketingWebViewController)initWithCoder:(id)a3;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation MarketingWebViewController

- (_TtC16FitnessMarketing26MarketingWebViewController)initWithBag:(id)a3 account:(id)a4 clientInfo:(id)a5
{
  swift_unknownObjectRetain();
  id v8 = a4;
  id v9 = a5;
  return (_TtC16FitnessMarketing26MarketingWebViewController *)MarketingWebViewController.init(bag:account:clientInfo:)((uint64_t)a3, a4, a5);
}

- (_TtC16FitnessMarketing26MarketingWebViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24F0B7CA8();
}

- (void)willMoveToParentViewController:(id)a3
{
  id v5 = a3;
  v6 = self;
  MarketingWebViewController.willMove(toParent:)((UIViewController_optional *)a3);
}

- (void).cxx_destruct
{
}

@end