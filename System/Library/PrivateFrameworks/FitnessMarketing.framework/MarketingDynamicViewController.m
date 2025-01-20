@interface MarketingDynamicViewController
- (_TtC16FitnessMarketing30MarketingDynamicViewController)initWithBag:(id)a3 URL:(id)a4;
- (_TtC16FitnessMarketing30MarketingDynamicViewController)initWithBag:(id)a3 bagValue:(id)a4;
- (_TtC16FitnessMarketing30MarketingDynamicViewController)initWithBag:(id)a3 javaScriptBagValue:(id)a4;
- (_TtC16FitnessMarketing30MarketingDynamicViewController)initWithBag:(id)a3 javaScriptURL:(id)a4;
- (_TtC16FitnessMarketing30MarketingDynamicViewController)initWithCoder:(id)a3;
- (_TtC16FitnessMarketing30MarketingDynamicViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation MarketingDynamicViewController

- (_TtC16FitnessMarketing30MarketingDynamicViewController)initWithBag:(id)a3 URL:(id)a4
{
  uint64_t v4 = sub_24F0F8720();
  MEMORY[0x270FA5388](v4 - 8);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24F0F8700();
  uint64_t v7 = swift_unknownObjectRetain();
  v8 = sub_24F0B7A44(v7, (uint64_t)v6);
  swift_unknownObjectRelease();
  return (_TtC16FitnessMarketing30MarketingDynamicViewController *)v8;
}

- (_TtC16FitnessMarketing30MarketingDynamicViewController)initWithCoder:(id)a3
{
}

- (void)willMoveToParentViewController:(id)a3
{
  id v5 = a3;
  v6 = self;
  MarketingDynamicViewController.willMove(toParent:)((UIViewController_optional *)a3);
}

- (_TtC16FitnessMarketing30MarketingDynamicViewController)initWithBag:(id)a3 bagValue:(id)a4
{
}

- (_TtC16FitnessMarketing30MarketingDynamicViewController)initWithBag:(id)a3 javaScriptBagValue:(id)a4
{
}

- (_TtC16FitnessMarketing30MarketingDynamicViewController)initWithBag:(id)a3 javaScriptURL:(id)a4
{
}

- (_TtC16FitnessMarketing30MarketingDynamicViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16FitnessMarketing30MarketingDynamicViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end