@interface MadridDiscreteSlider
- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5;
- (CGRect)trackRectForBounds:(CGRect)a3;
- (MadridDiscreteSlider)initWithFrame:(CGRect)a3;
- (UIColor)trackMarkersColor;
- (void)drawRect:(CGRect)a3;
- (void)setTrackMarkersColor:(id)a3;
- (void)setValue:(float)a3 animated:(BOOL)a4;
- (void)sliderTapped:(id)a3;
@end

@implementation MadridDiscreteSlider

- (MadridDiscreteSlider)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MadridDiscreteSlider;
  v3 = -[MadridDiscreteSlider initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [[MadridNonMovableTapGestureRecognizer alloc] initWithTarget:v3 action:"sliderTapped:"];
    [(MadridDiscreteSlider *)v3 addGestureRecognizer:v4];
  }
  return v3;
}

- (void)sliderTapped:(id)a3
{
  [a3 locationInView:self];
  double v5 = v4;
  [(MadridDiscreteSlider *)self bounds];
  -[MadridDiscreteSlider trackRectForBounds:](self, "trackRectForBounds:");
  CGFloat x = v24.origin.x;
  CGFloat y = v24.origin.y;
  CGFloat width = v24.size.width;
  CGFloat height = v24.size.height;
  double v10 = v5 - CGRectGetMinX(v24);
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  if (v10 / CGRectGetWidth(v25) > 1.0) {
    goto LABEL_10;
  }
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  double v11 = v5 - CGRectGetMinX(v26);
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  double v12 = v11 / CGRectGetWidth(v27);
  double v13 = 0.0;
  if (v12 >= 0.0)
  {
LABEL_10:
    v28.origin.CGFloat x = x;
    v28.origin.CGFloat y = y;
    v28.size.CGFloat width = width;
    v28.size.CGFloat height = height;
    double v14 = v5 - CGRectGetMinX(v28);
    v29.origin.CGFloat x = x;
    v29.origin.CGFloat y = y;
    v29.size.CGFloat width = width;
    v29.size.CGFloat height = height;
    double v15 = v14 / CGRectGetWidth(v29);
    double v13 = 1.0;
    if (v15 <= 1.0)
    {
      v30.origin.CGFloat x = x;
      v30.origin.CGFloat y = y;
      v30.size.CGFloat width = width;
      v30.size.CGFloat height = height;
      double v16 = v5 - CGRectGetMinX(v30);
      v31.origin.CGFloat x = x;
      v31.origin.CGFloat y = y;
      v31.size.CGFloat width = width;
      v31.size.CGFloat height = height;
      double v13 = v16 / CGRectGetWidth(v31);
    }
  }
  [(MadridDiscreteSlider *)self maximumValue];
  float v18 = v17;
  [(MadridDiscreteSlider *)self minimumValue];
  double v20 = (float)(v18 - v19);
  [(MadridDiscreteSlider *)self minimumValue];
  double v22 = v21 + v13 * v20;
  *(float *)&double v22 = v22;
  [(MadridDiscreteSlider *)self setValue:1 animated:v22];

  [(MadridDiscreteSlider *)self sendActionsForControlEvents:4096];
}

- (void)setTrackMarkersColor:(id)a3
{
  double v5 = (UIColor *)a3;
  p_trackMarkersColor = &self->_trackMarkersColor;
  if (self->_trackMarkersColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_trackMarkersColor, a3);
    p_trackMarkersColor = (UIColor **)[(MadridDiscreteSlider *)self setNeedsDisplay];
    double v5 = v7;
  }

  _objc_release_x1(p_trackMarkersColor, v5);
}

- (void)setValue:(float)a3 animated:(BOOL)a4
{
  *(float *)&double v4 = roundf(a3);
  v5.receiver = self;
  v5.super_class = (Class)MadridDiscreteSlider;
  [(MadridDiscreteSlider *)&v5 setValue:a4 animated:v4];
}

- (void)drawRect:(CGRect)a3
{
  [(MadridDiscreteSlider *)self bounds];
  -[MadridDiscreteSlider trackRectForBounds:](self, "trackRectForBounds:");
  double v5 = v4;
  double v22 = v6;
  double v8 = v7;
  double v10 = v9;
  [(MadridDiscreteSlider *)self bounds];
  id v23 = objc_alloc_init((Class)UIBezierPath);
  [(UIColor *)self->_trackMarkersColor set];
  [v23 setLineWidth:1.0];
  [(MadridDiscreteSlider *)self minimumValue];
  float v12 = v11;
  float v13 = (float)(int)v11;
  [(MadridDiscreteSlider *)self maximumValue];
  if (v14 >= v13)
  {
    int v15 = (int)v12 + 1;
    do
    {
      [(MadridDiscreteSlider *)self minimumValue];
      [(MadridDiscreteSlider *)self maximumValue];
      [(MadridDiscreteSlider *)self minimumValue];
      PSRoundToPixel();
      double v17 = v16 + 0.5;
      PSRoundToPixel();
      objc_msgSend(v23, "moveToPoint:", v17, v18);
      PSRoundToPixel();
      objc_msgSend(v23, "addLineToPoint:", v17, v19);
      *(float *)&double v17 = (float)v15;
      [(MadridDiscreteSlider *)self maximumValue];
      ++v15;
    }
    while (v20 >= *(float *)&v17);
  }
  [v23 stroke];
  float v21 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v5, v22, v8, v10);
  [v21 fill];
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  double width = a3.size.width;
  double x = a3.origin.x;
  PSRoundToPixel();
  double v6 = v5;
  double v7 = x + 10.0;
  double v8 = width + -20.0;
  double v9 = 1.0;
  result.size.CGFloat height = v9;
  result.size.double width = v8;
  result.origin.CGFloat y = v6;
  result.origin.double x = v7;
  return result;
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  v17.receiver = self;
  v17.super_class = (Class)MadridDiscreteSlider;
  -[MadridDiscreteSlider thumbRectForBounds:trackRect:value:](&v17, "thumbRectForBounds:trackRect:value:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, LODWORD(a5));
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(MadridDiscreteSlider *)self minimumValue];
  [(MadridDiscreteSlider *)self maximumValue];
  [(MadridDiscreteSlider *)self minimumValue];
  PSRoundToPixel();
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.CGFloat height = v15;
  result.size.double width = v14;
  result.origin.CGFloat y = v13;
  result.origin.double x = v12;
  return result;
}

- (UIColor)trackMarkersColor
{
  return self->_trackMarkersColor;
}

- (void).cxx_destruct
{
}

@end