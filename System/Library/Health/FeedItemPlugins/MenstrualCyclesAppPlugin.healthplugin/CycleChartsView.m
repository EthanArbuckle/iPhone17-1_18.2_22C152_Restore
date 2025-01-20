@interface CycleChartsView
- (_TtC24MenstrualCyclesAppPlugin15CycleChartsView)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin15CycleChartsView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
@end

@implementation CycleChartsView

- (_TtC24MenstrualCyclesAppPlugin15CycleChartsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_241628494();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_241627CAC();
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_241627E2C(x, y, width, height);
}

- (_TtC24MenstrualCyclesAppPlugin15CycleChartsView)initWithFrame:(CGRect)a3
{
  result = (_TtC24MenstrualCyclesAppPlugin15CycleChartsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_impactFeedbackGenerator));

  swift_bridgeObjectRelease();
}

- (void)scrollViewWillBeginDragging:(id)a3
{
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2416285A8();
}

@end