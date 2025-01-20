@interface SystemSegmentedControl.UISegmentedControl
- (_TtCV7SwiftUIP33_D74FE142C3C5A6C2CEA4987A69AEBD7522SystemSegmentedControl18UISegmentedControl)initWithCoder:(id)a3;
- (_TtCV7SwiftUIP33_D74FE142C3C5A6C2CEA4987A69AEBD7522SystemSegmentedControl18UISegmentedControl)initWithFrame:(CGRect)a3;
- (_TtCV7SwiftUIP33_D74FE142C3C5A6C2CEA4987A69AEBD7522SystemSegmentedControl18UISegmentedControl)initWithItems:(id)isa;
@end

@implementation SystemSegmentedControl.UISegmentedControl

- (_TtCV7SwiftUIP33_D74FE142C3C5A6C2CEA4987A69AEBD7522SystemSegmentedControl18UISegmentedControl)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[SystemSegmentedControl.UISegmentedControl initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtCV7SwiftUIP33_D74FE142C3C5A6C2CEA4987A69AEBD7522SystemSegmentedControl18UISegmentedControl)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(SystemSegmentedControl.UISegmentedControl *)&v5 initWithCoder:a3];
}

- (_TtCV7SwiftUIP33_D74FE142C3C5A6C2CEA4987A69AEBD7522SystemSegmentedControl18UISegmentedControl)initWithItems:(id)isa
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (isa)
  {
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = [(SystemSegmentedControl.UISegmentedControl *)&v8 initWithItems:isa];

  return v6;
}

@end