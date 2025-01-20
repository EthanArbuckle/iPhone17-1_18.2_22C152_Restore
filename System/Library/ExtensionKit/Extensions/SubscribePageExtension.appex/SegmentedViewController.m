@interface SegmentedViewController
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4;
- (_TtC22SubscribePageExtension23SegmentedViewController)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension23SegmentedViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didReceiveMemoryWarning;
- (void)takeSelectedIndexFrom:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation SegmentedViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10061E1B8();
}

- (void)didReceiveMemoryWarning
{
  v2 = self;
  sub_10061E40C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10061E65C((uint64_t)a3);
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double width = a4.width;
  swift_unknownObjectRetain();
  v6 = self;
  double v7 = sub_1006211D4(width);
  double v9 = v8;
  swift_unknownObjectRelease();

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.double width = v10;
  return result;
}

- (void)takeSelectedIndexFrom:(id)a3
{
  id v4 = a3;
  double v7 = self;
  id v5 = (objc_class *)[v4 selectedSegmentIndex];
  uint64_t v6 = *(uint64_t *)((char *)&v7->super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension23SegmentedViewController_selectedIndex);
  *(Class *)((char *)&v7->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension23SegmentedViewController_selectedIndex) = v5;
  sub_10061ED48(v6, (unint64_t)v5);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_10061FC10();
}

- (_TtC22SubscribePageExtension23SegmentedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1007675F0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC22SubscribePageExtension23SegmentedViewController *)sub_100620D98(v5, v7, a4);
}

- (_TtC22SubscribePageExtension23SegmentedViewController)initWithCoder:(id)a3
{
  return (_TtC22SubscribePageExtension23SegmentedViewController *)sub_100620F44(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23SegmentedViewController_headerBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23SegmentedViewController_headerView));
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23SegmentedViewController_selectedViewController));
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension23SegmentedViewController_selectorControl);
}

@end