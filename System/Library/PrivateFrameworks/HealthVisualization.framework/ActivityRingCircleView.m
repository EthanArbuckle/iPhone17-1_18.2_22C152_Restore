@interface ActivityRingCircleView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC19HealthVisualization22ActivityRingCircleView)init;
- (_TtC19HealthVisualization22ActivityRingCircleView)initWithCoder:(id)a3;
- (_TtC19HealthVisualization22ActivityRingCircleView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ActivityRingCircleView

- (_TtC19HealthVisualization22ActivityRingCircleView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthVisualization22ActivityRingCircleView____lazy_storage___activityRingView) = 0;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ActivityRingCircleView();
  v7 = -[ActivityRingCircleView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
  id v8 = sub_1C29EC5C4();
  [(ActivityRingCircleView *)v7 addSubview:v8];

  id v9 = objc_msgSend(self, sel_clearColor);
  [(ActivityRingCircleView *)v7 setBackgroundColor:v9];

  return v7;
}

- (_TtC19HealthVisualization22ActivityRingCircleView)initWithCoder:(id)a3
{
  return (_TtC19HealthVisualization22ActivityRingCircleView *)sub_1C29EC760(a3);
}

- (_TtC19HealthVisualization22ActivityRingCircleView)init
{
  v2 = -[ActivityRingCircleView initWithFrame:](self, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  id v3 = sub_1C29EC5C4();
  [(ActivityRingCircleView *)v2 addSubview:v3];

  id v4 = objc_msgSend(self, sel_clearColor);
  [(ActivityRingCircleView *)v2 setBackgroundColor:v4];

  return v2;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v3 = qword_1EBB91248;
  id v4 = self;
  if (v3 != -1) {
    swift_once();
  }
  double v5 = *(double *)&qword_1EBB9F0D0;
  id v6 = [(ActivityRingCircleView *)v4 traitCollection];
  id v7 = objc_msgSend(v6, sel_preferredContentSizeCategory);

  LOBYTE(v6) = sub_1C2A9E208();
  double v8 = 1.0;
  if (v6) {
    double v8 = 1.75;
  }
  double v9 = v5 * v8;
  double v10 = v9;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1C29EC9D0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthVisualization22ActivityRingCircleView____lazy_storage___activityRingView));
}

@end