@interface CAFUISegmentedControl
- (_TtC5CAFUI21CAFUISegmentedControl)initWithCoder:(id)a3;
- (_TtC5CAFUI21CAFUISegmentedControl)initWithFrame:(CGRect)a3;
- (_TtC5CAFUI21CAFUISegmentedControl)initWithItems:(id)a3;
- (void)layoutSubviews;
@end

@implementation CAFUISegmentedControl

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CAFUISegmentedControl();
  id v2 = v5.receiver;
  [(CAFUISegmentedControl *)&v5 layoutSubviews];
  objc_msgSend(v2, sel_frame, v5.receiver, v5.super_class);
  double v4 = v3;
  if (one-time initialization token for targetHeight != -1) {
    swift_once();
  }
  if (v4 != *(double *)&static CAFUISegmentedControl.targetHeight)
  {
    objc_msgSend(v2, sel_frame);
    objc_msgSend(v2, sel_setFrame_, 0.0, 0.0);
  }
}

- (_TtC5CAFUI21CAFUISegmentedControl)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CAFUISegmentedControl();
  return -[CAFUISegmentedControl initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC5CAFUI21CAFUISegmentedControl)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CAFUISegmentedControl();
  return [(CAFUISegmentedControl *)&v5 initWithCoder:a3];
}

- (_TtC5CAFUI21CAFUISegmentedControl)initWithItems:(id)a3
{
  if (a3)
  {
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CAFUISegmentedControl();
  objc_super v5 = [(CAFUISegmentedControl *)&v7 initWithItems:v4.super.isa];

  return v5;
}

@end