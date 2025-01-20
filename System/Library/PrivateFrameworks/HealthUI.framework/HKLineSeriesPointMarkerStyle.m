@interface HKLineSeriesPointMarkerStyle
- (HKLineSeriesPointMarkerStyle)initWithColor:(id)a3 radius:(double)a4 style:(int64_t)a5;
- (UIColor)pointColor;
- (double)radius;
- (int64_t)pointMarkerStyle;
- (void)setPointColor:(id)a3;
- (void)setPointMarkerStyle:(int64_t)a3;
- (void)setRadius:(double)a3;
@end

@implementation HKLineSeriesPointMarkerStyle

- (HKLineSeriesPointMarkerStyle)initWithColor:(id)a3 radius:(double)a4 style:(int64_t)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKLineSeriesPointMarkerStyle;
  v9 = [(HKLineSeriesPointMarkerStyle *)&v12 init];
  v10 = v9;
  if (v9)
  {
    [(HKLineSeriesPointMarkerStyle *)v9 setPointColor:v8];
    [(HKLineSeriesPointMarkerStyle *)v10 setRadius:a4];
    [(HKLineSeriesPointMarkerStyle *)v10 setPointMarkerStyle:a5];
  }

  return v10;
}

- (UIColor)pointColor
{
  return self->_pointColor;
}

- (void)setPointColor:(id)a3
{
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (int64_t)pointMarkerStyle
{
  return self->_pointMarkerStyle;
}

- (void)setPointMarkerStyle:(int64_t)a3
{
  self->_pointMarkerStyle = a3;
}

- (void).cxx_destruct
{
}

@end