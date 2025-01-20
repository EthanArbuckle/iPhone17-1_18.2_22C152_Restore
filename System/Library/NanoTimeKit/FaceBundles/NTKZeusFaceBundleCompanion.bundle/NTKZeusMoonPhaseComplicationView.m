@interface NTKZeusMoonPhaseComplicationView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NTKZeusMoonPhaseComplicationView)initWithBackgroundView:(id)a3;
- (void)_renderMoon;
- (void)_updateImages;
- (void)applyPalette:(id)a3;
- (void)applyTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5;
- (void)layoutSubviews;
- (void)setPhaseNumber:(unint64_t)a3 hemisphere:(int64_t)a4;
@end

@implementation NTKZeusMoonPhaseComplicationView

- (NTKZeusMoonPhaseComplicationView)initWithBackgroundView:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NTKZeusMoonPhaseComplicationView;
  v3 = [(NTKZeusComplicationView *)&v8 initWithBackgroundView:a3];
  if (v3)
  {
    id v4 = objc_alloc((Class)UIImageView);
    [(NTKZeusMoonPhaseComplicationView *)v3 bounds];
    v5 = (UIImageView *)objc_msgSend(v4, "initWithFrame:");
    imageView = v3->_imageView;
    v3->_imageView = v5;

    [(UIImageView *)v3->_imageView setAutoresizingMask:18];
    [(NTKZeusMoonPhaseComplicationView *)v3 addSubview:v3->_imageView];
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)NTKZeusMoonPhaseComplicationView;
  [(NTKZeusComplicationView *)&v5 layoutSubviews];
  [(UIImageView *)self->_imageView sizeToFit];
  imageView = self->_imageView;
  [(UIImageView *)imageView bounds];
  [(NTKZeusMoonPhaseComplicationView *)self bounds];
  double v4 = [(NTKZeusComplicationView *)self device];
  CLKRectCenteredIntegralRectForDevice();
  -[UIImageView setFrame:](imageView, "setFrame:");
}

- (void)_renderMoon
{
  double v3 = [(NTKZeusComplicationView *)self device];
  sub_9058(v3, v10);
  double v4 = +[UIColor colorWithWhite:1.0 alpha:0.5];
  objc_super v5 = +[UIColor colorWithWhite:1.0 alpha:0.25];
  NUNIRenderedMoonImage();
  v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
  moonImage = self->_moonImage;
  self->_moonImage = v6;

  imageView = self->_imageView;
  v9 = self->_moonImage;

  [(UIImageView *)imageView setImage:v9];
}

- (void)setPhaseNumber:(unint64_t)a3 hemisphere:(int64_t)a4
{
  self->_moonPhaseHemisphere = a4;
  self->_phaseNumber = a3;
  if (self->_moonPhaseHemisphere != a4) {
    [(NTKZeusMoonPhaseComplicationView *)self _renderMoon];
  }

  [(NTKZeusMoonPhaseComplicationView *)self _updateImages];
}

- (void)_updateImages
{
  [(NTKZeusMoonPhaseComplicationView *)self _renderMoon];
  double v3 = 1.0;
  if (self->_moonPhaseHemisphere == 1) {
    double v3 = -1.0;
  }
  imageView = self->_imageView;
  CGAffineTransformMakeScale(&v8, v3, v3);
  [(UIImageView *)imageView setTransform:&v8];
  objc_super v5 = self->_imageView;
  v6 = [(NTKZeusComplicationView *)self palette];
  v7 = [v6 bottomComplication];
  [(UIImageView *)v5 setTintColor:v7];

  [(NTKZeusMoonPhaseComplicationView *)self setNeedsLayout];
}

- (void)applyPalette:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKZeusMoonPhaseComplicationView;
  [(NTKZeusComplicationView *)&v4 applyPalette:a3];
  [(NTKZeusMoonPhaseComplicationView *)self _updateImages];
}

- (void)applyTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)NTKZeusMoonPhaseComplicationView;
  id v8 = a5;
  id v9 = a4;
  [(NTKZeusComplicationView *)&v13 applyTransitionFraction:v9 fromPalette:v8 toPalette:a3];
  v10 = objc_msgSend(v9, "bottomComplication", v13.receiver, v13.super_class);

  v11 = [v8 bottomComplication];

  v12 = NTKInterpolateBetweenColors();

  [(UIImageView *)self->_imageView setTintColor:v12];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->timer, 0);
  objc_storeStrong((id *)&self->_moonImage, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end