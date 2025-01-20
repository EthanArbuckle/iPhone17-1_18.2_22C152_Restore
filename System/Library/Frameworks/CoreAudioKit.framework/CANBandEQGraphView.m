@interface CANBandEQGraphView
- (_TtC12CoreAudioKit18CANBandEQGraphView)initWithCoder:(id)a3;
- (_TtC12CoreAudioKit18CANBandEQGraphView)initWithFrame:(CGRect)a3;
- (void)doubleTapped:(id)a3;
- (void)tintColorDidChange;
@end

@implementation CANBandEQGraphView

- (void)tintColorDidChange
{
  v2 = self;
  sub_21E5677CC();
}

- (void)doubleTapped:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_21E567994(v4);
}

- (_TtC12CoreAudioKit18CANBandEQGraphView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CANBandEQGraphView();
  return [(CAAUEQGraphView *)&v5 initWithCoder:a3];
}

- (_TtC12CoreAudioKit18CANBandEQGraphView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CANBandEQGraphView();
  return -[CAAUEQGraphView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

@end