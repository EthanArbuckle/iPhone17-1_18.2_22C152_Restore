@interface ProductRatingsHistogramView
- (NSArray)accessibilityProgressBarViews;
- (NSArray)accessibilityStarViews;
- (_TtC22SubscribePageExtension27ProductRatingsHistogramView)init;
- (_TtC22SubscribePageExtension27ProductRatingsHistogramView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension27ProductRatingsHistogramView)initWithFrame:(CGRect)a3;
@end

@implementation ProductRatingsHistogramView

- (_TtC22SubscribePageExtension27ProductRatingsHistogramView)init
{
  return (_TtC22SubscribePageExtension27ProductRatingsHistogramView *)sub_1000868F8();
}

- (_TtC22SubscribePageExtension27ProductRatingsHistogramView)initWithCoder:(id)a3
{
  result = (_TtC22SubscribePageExtension27ProductRatingsHistogramView *)sub_100768A40();
  __break(1u);
  return result;
}

- (NSArray)accessibilityStarViews
{
  swift_beginAccess();
  type metadata accessor for RatingView();
  swift_bridgeObjectRetain();
  v2.super.isa = sub_1007677F0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (NSArray)accessibilityProgressBarViews
{
  NSArray v2 = self;
  sub_1000878DC();

  sub_10001A860(0, (unint64_t *)&qword_100932C80);
  v3.super.isa = sub_1007677F0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (_TtC22SubscribePageExtension27ProductRatingsHistogramView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end