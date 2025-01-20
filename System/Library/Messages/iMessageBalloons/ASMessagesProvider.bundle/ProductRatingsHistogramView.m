@interface ProductRatingsHistogramView
- (NSArray)accessibilityProgressBarViews;
- (NSArray)accessibilityStarViews;
- (_TtC18ASMessagesProvider27ProductRatingsHistogramView)init;
- (_TtC18ASMessagesProvider27ProductRatingsHistogramView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider27ProductRatingsHistogramView)initWithFrame:(CGRect)a3;
@end

@implementation ProductRatingsHistogramView

- (_TtC18ASMessagesProvider27ProductRatingsHistogramView)init
{
  return (_TtC18ASMessagesProvider27ProductRatingsHistogramView *)sub_67488C();
}

- (_TtC18ASMessagesProvider27ProductRatingsHistogramView)initWithCoder:(id)a3
{
  result = (_TtC18ASMessagesProvider27ProductRatingsHistogramView *)sub_77EB20();
  __break(1u);
  return result;
}

- (NSArray)accessibilityStarViews
{
  swift_beginAccess();
  type metadata accessor for RatingView();
  swift_bridgeObjectRetain();
  v2.super.isa = sub_77D880().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (NSArray)accessibilityProgressBarViews
{
  NSArray v2 = self;
  sub_675870();

  sub_FE2C(0, (unint64_t *)&qword_94FFE0);
  v3.super.isa = sub_77D880().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (_TtC18ASMessagesProvider27ProductRatingsHistogramView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end