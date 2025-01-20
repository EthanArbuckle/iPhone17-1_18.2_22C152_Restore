@interface ProductRatingsHistogramView
- (NSArray)accessibilityProgressBarViews;
- (NSArray)accessibilityStarViews;
- (_TtC20ProductPageExtension27ProductRatingsHistogramView)init;
- (_TtC20ProductPageExtension27ProductRatingsHistogramView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension27ProductRatingsHistogramView)initWithFrame:(CGRect)a3;
@end

@implementation ProductRatingsHistogramView

- (_TtC20ProductPageExtension27ProductRatingsHistogramView)init
{
  return (_TtC20ProductPageExtension27ProductRatingsHistogramView *)sub_100091F94();
}

- (_TtC20ProductPageExtension27ProductRatingsHistogramView)initWithCoder:(id)a3
{
  result = (_TtC20ProductPageExtension27ProductRatingsHistogramView *)sub_10077D120();
  __break(1u);
  return result;
}

- (NSArray)accessibilityStarViews
{
  swift_beginAccess();
  type metadata accessor for RatingView();
  swift_bridgeObjectRetain();
  v2.super.isa = sub_10077BEC0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (NSArray)accessibilityProgressBarViews
{
  NSArray v2 = self;
  sub_100092F78();

  sub_100019840(0, (unint64_t *)&qword_10094EB40);
  v3.super.isa = sub_10077BEC0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (_TtC20ProductPageExtension27ProductRatingsHistogramView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end