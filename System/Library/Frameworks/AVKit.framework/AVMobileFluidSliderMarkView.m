@interface AVMobileFluidSliderMarkView
- (AVMobileFluidSliderMarkView)init;
- (UIColor)markColor;
- (void)layoutSubviews;
- (void)setMarkColor:(id)a3;
@end

@implementation AVMobileFluidSliderMarkView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markColor, 0);

  objc_storeStrong((id *)&self->_markColorLayer, 0);
}

- (UIColor)markColor
{
  return self->_markColor;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)AVMobileFluidSliderMarkView;
  [(AVMobileFluidSliderMarkView *)&v5 layoutSubviews];
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  [(AVMobileFluidSliderMarkView *)self bounds];
  -[CALayer setFrame:](self->_markColorLayer, "setFrame:", v3, v4);
}

- (void)setMarkColor:(id)a3
{
  objc_super v5 = (UIColor *)a3;
  p_markColor = &self->_markColor;
  if (self->_markColor != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)p_markColor, a3);
    [MEMORY[0x1E4FB1EB0] inheritedAnimationDuration];
    double v8 = v7;
    [MEMORY[0x1E4F39CF8] begin];
    if (v8 <= 0.0)
    {
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
    }
    else
    {
      [MEMORY[0x1E4F39CF8] setDisableActions:0];
      [MEMORY[0x1E4F39CF8] setAnimationDuration:v8];
    }
    [(CALayer *)self->_markColorLayer setBackgroundColor:[(UIColor *)v9 CGColor]];
    p_markColor = (UIColor **)[MEMORY[0x1E4F39CF8] commit];
    objc_super v5 = v9;
  }

  MEMORY[0x1F41817F8](p_markColor, v5);
}

- (AVMobileFluidSliderMarkView)init
{
  v8.receiver = self;
  v8.super_class = (Class)AVMobileFluidSliderMarkView;
  v2 = [(AVMobileFluidSliderMarkView *)&v8 init];
  if (v2)
  {
    double v3 = [MEMORY[0x1E4FB1618] blackColor];
    [(AVMobileFluidSliderMarkView *)v2 setBackgroundColor:v3];

    uint64_t v4 = [MEMORY[0x1E4F39BE8] layer];
    markColorLayer = v2->_markColorLayer;
    v2->_markColorLayer = (CALayer *)v4;

    v6 = [(AVMobileFluidSliderMarkView *)v2 layer];
    [v6 addSublayer:v2->_markColorLayer];
  }
  return v2;
}

@end