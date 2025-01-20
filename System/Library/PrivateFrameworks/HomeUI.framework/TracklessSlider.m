@interface TracklessSlider
- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5;
- (_TtC6HomeUIP33_924B9BACA428215473DADD2D3F844A0415TracklessSlider)initWithCoder:(id)a3;
- (_TtC6HomeUIP33_924B9BACA428215473DADD2D3F844A0415TracklessSlider)initWithFrame:(CGRect)a3;
@end

@implementation TracklessSlider

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v9 = self;
  double v10 = sub_1BE523CE4(x, y, width, height, a5);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (_TtC6HomeUIP33_924B9BACA428215473DADD2D3F844A0415TracklessSlider)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TracklessSlider();
  return -[TracklessSlider initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC6HomeUIP33_924B9BACA428215473DADD2D3F844A0415TracklessSlider)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TracklessSlider();
  return [(TracklessSlider *)&v5 initWithCoder:a3];
}

@end