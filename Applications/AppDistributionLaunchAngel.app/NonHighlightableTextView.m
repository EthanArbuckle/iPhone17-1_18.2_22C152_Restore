@interface NonHighlightableTextView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (_TtC26AppDistributionLaunchAngel24NonHighlightableTextView)initWithCoder:(id)a3;
- (_TtC26AppDistributionLaunchAngel24NonHighlightableTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
@end

@implementation NonHighlightableTextView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v8 = a4;
  v9 = self;
  unsigned __int8 v10 = sub_10001F0B0(x, y);
  swift_release();

  return v10 & 1;
}

- (_TtC26AppDistributionLaunchAngel24NonHighlightableTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for NonHighlightableTextView();
  unsigned __int8 v10 = -[NonHighlightableTextView initWithFrame:textContainer:](&v12, "initWithFrame:textContainer:", a4, x, y, width, height);
  swift_release();
  return v10;
}

- (_TtC26AppDistributionLaunchAngel24NonHighlightableTextView)initWithCoder:(id)a3
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for NonHighlightableTextView();
  v5 = [(NonHighlightableTextView *)&v7 initWithCoder:a3];
  swift_release();
  return v5;
}

@end