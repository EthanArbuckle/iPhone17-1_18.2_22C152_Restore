@interface MarketingItemViewController
- (_TtC16FitnessMarketing27MarketingItemViewController)initWithBag:(id)a3 URL:(id)a4;
- (_TtC16FitnessMarketing27MarketingItemViewController)initWithBag:(id)a3 bagValue:(id)a4;
- (_TtC16FitnessMarketing27MarketingItemViewController)initWithCoder:(id)a3;
- (_TtC16FitnessMarketing27MarketingItemViewController)initWithMarketingItem:(id)a3 bag:(id)a4;
- (_TtC16FitnessMarketing27MarketingItemViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC16FitnessMarketing27MarketingItemViewController)initWithServiceType:(id)a3 placement:(id)a4 account:(id)a5 bag:(id)a6;
- (_TtC16FitnessMarketing27MarketingItemViewController)initWithServiceType:(id)a3 placement:(id)a4 bag:(id)a5;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation MarketingItemViewController

- (_TtC16FitnessMarketing27MarketingItemViewController)initWithServiceType:(id)a3 placement:(id)a4 bag:(id)a5
{
  uint64_t v6 = sub_24F0F9470();
  uint64_t v8 = v7;
  uint64_t v9 = sub_24F0F9470();
  uint64_t v11 = v10;
  swift_unknownObjectRetain();
  return (_TtC16FitnessMarketing27MarketingItemViewController *)MarketingItemViewController.init(serviceType:placement:bag:)(v6, v8, v9, v11, (uint64_t)a5);
}

- (_TtC16FitnessMarketing27MarketingItemViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_24F0F9470();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC16FitnessMarketing27MarketingItemViewController *)MarketingItemViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC16FitnessMarketing27MarketingItemViewController)initWithCoder:(id)a3
{
}

- (void)willMoveToParentViewController:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  MarketingItemViewController.willMove(toParent:)((UIViewController_optional *)a3);
}

- (_TtC16FitnessMarketing27MarketingItemViewController)initWithMarketingItem:(id)a3 bag:(id)a4
{
  id v4 = a3;
  swift_unknownObjectRetain();
  result = (_TtC16FitnessMarketing27MarketingItemViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC16FitnessMarketing27MarketingItemViewController)initWithServiceType:(id)a3 placement:(id)a4 account:(id)a5 bag:(id)a6
{
  id v6 = a5;
  swift_unknownObjectRetain();
  result = (_TtC16FitnessMarketing27MarketingItemViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC16FitnessMarketing27MarketingItemViewController)initWithBag:(id)a3 bagValue:(id)a4
{
}

- (_TtC16FitnessMarketing27MarketingItemViewController)initWithBag:(id)a3 URL:(id)a4
{
}

- (void).cxx_destruct
{
}

@end