@interface LayerResizableUIView
- (CGRect)frame;
- (_TtC15AirPlayReceiver20LayerResizableUIView)initWithCoder:(id)a3;
- (_TtC15AirPlayReceiver20LayerResizableUIView)initWithFrame:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation LayerResizableUIView

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for LayerResizableUIView();
  [(LayerResizableUIView *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for LayerResizableUIView();
  id v7 = v8.receiver;
  -[LayerResizableUIView setFrame:](&v8, "setFrame:", x, y, width, height);
  sub_100007EF0();
}

- (_TtC15AirPlayReceiver20LayerResizableUIView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for LayerResizableUIView();
  return -[LayerResizableUIView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC15AirPlayReceiver20LayerResizableUIView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LayerResizableUIView();
  return [(LayerResizableUIView *)&v5 initWithCoder:a3];
}

@end