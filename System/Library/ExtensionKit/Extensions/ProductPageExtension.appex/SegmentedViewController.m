@interface SegmentedViewController
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4;
- (_TtC20ProductPageExtension23SegmentedViewController)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension23SegmentedViewController)initWithNibName:(id)a3 bundle:(id)a4;
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
  sub_1006F518C();
}

- (void)didReceiveMemoryWarning
{
  v2 = self;
  sub_1006F53E0();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1006F5630((uint64_t)a3);
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double width = a4.width;
  swift_unknownObjectRetain();
  v6 = self;
  double v7 = sub_1006F81A8(width);
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
                  + OBJC_IVAR____TtC20ProductPageExtension23SegmentedViewController_selectedIndex);
  *(Class *)((char *)&v7->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension23SegmentedViewController_selectedIndex) = v5;
  sub_1006F5D1C(v6, (unint64_t)v5);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1006F6BE4();
}

- (_TtC20ProductPageExtension23SegmentedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_10077BCB0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC20ProductPageExtension23SegmentedViewController *)sub_1006F7D6C(v5, v7, a4);
}

- (_TtC20ProductPageExtension23SegmentedViewController)initWithCoder:(id)a3
{
  return (_TtC20ProductPageExtension23SegmentedViewController *)sub_1006F7F18(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23SegmentedViewController_headerBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23SegmentedViewController_headerView));
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23SegmentedViewController_selectedViewController));
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension23SegmentedViewController_selectorControl);
}

@end