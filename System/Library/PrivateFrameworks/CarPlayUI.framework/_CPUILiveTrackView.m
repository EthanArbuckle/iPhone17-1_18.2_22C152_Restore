@interface _CPUILiveTrackView
+ (Class)layerClass;
- (_CPUILiveTrackView)initWithFrame:(CGRect)a3;
- (double)erasedPercentage;
- (void)_updateGradient;
- (void)setErasedPercentage:(double)a3;
@end

@implementation _CPUILiveTrackView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (_CPUILiveTrackView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_CPUILiveTrackView;
  v3 = -[_CPUILiveTrackView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_erasedPercentage = 0.25;
    v5 = [(_CPUILiveTrackView *)v3 layer];
    objc_msgSend(v5, "setStartPoint:", 0.0, 0.5);
    objc_msgSend(v5, "setEndPoint:", 1.0, 0.5);
    v6 = [MEMORY[0x263F825C8] clearColor];
    [(_CPUILiveTrackView *)v4 setBackgroundColor:v6];

    [(_CPUILiveTrackView *)v4 _updateGradient];
  }
  return v4;
}

- (void)setErasedPercentage:(double)a3
{
  double v3 = 1.0;
  if (a3 > 1.0)
  {
    BOOL v4 = 1;
  }
  else
  {
    double v3 = a3;
    BOOL v4 = a3 < 0.0;
  }
  double v5 = fmax(v3, 0.0);
  if (v4) {
    a3 = v5;
  }
  if (vabdd_f64(a3, self->_erasedPercentage) > 0.00000011920929)
  {
    self->_erasedPercentage = a3;
    [(_CPUILiveTrackView *)self _updateGradient];
  }
}

- (void)_updateGradient
{
  v13[4] = *MEMORY[0x263EF8340];
  double v2 = self->_erasedPercentage * 0.5;
  double v3 = [(_CPUILiveTrackView *)self layer];
  id v4 = [MEMORY[0x263F825C8] systemFillColor];
  v13[0] = [v4 CGColor];
  id v5 = [MEMORY[0x263F825C8] clearColor];
  v13[1] = [v5 CGColor];
  id v6 = [MEMORY[0x263F825C8] clearColor];
  v13[2] = [v6 CGColor];
  id v7 = [MEMORY[0x263F825C8] systemFillColor];
  v13[3] = [v7 CGColor];
  objc_super v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:4];
  [v3 setColors:v8];

  v12[0] = &unk_26DC1F300;
  v9 = [NSNumber numberWithDouble:0.5 - v2];
  v12[1] = v9;
  v10 = [NSNumber numberWithDouble:v2 + 0.5];
  v12[2] = v10;
  v12[3] = &unk_26DC1F310;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:4];
  [v3 setLocations:v11];
}

- (double)erasedPercentage
{
  return self->_erasedPercentage;
}

@end