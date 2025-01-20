@interface NTKZeusComplicationView
+ (id)viewForComplicationType:(unint64_t)a3;
+ (id)viewForComplicationType:(unint64_t)a3 backgroundView:(id)a4;
- (BOOL)isHighlighted;
- (BOOL)legibilityEnabled;
- (CDComplicationDisplayObserver)displayObserver;
- (CGRect)contentFrame;
- (CLKDevice)device;
- (NTKZeudleColorPalette)palette;
- (NTKZeudleComplicationBackgroundView)backgroundView;
- (NTKZeusComplicationView)initWithBackgroundView:(id)a3;
- (id)complicationColorForBlancEditMode:(int64_t)a3;
- (unint64_t)style;
- (unint64_t)textLayoutStyle;
- (void)applyPalette:(id)a3;
- (void)applyTransitionFraction:(double)a3 fromMode:(int64_t)a4 toMode:(int64_t)a5;
- (void)applyTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5;
- (void)blancEditModeApplyPalette:(id)a3;
- (void)layoutSubviews;
- (void)setDisplayObserver:(id)a3;
- (void)setLegibilityEnabled:(BOOL)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setTextLayoutStyle:(unint64_t)a3;
@end

@implementation NTKZeusComplicationView

+ (id)viewForComplicationType:(unint64_t)a3
{
  return +[NTKZeusComplicationView viewForComplicationType:a3 backgroundView:0];
}

+ (id)viewForComplicationType:(unint64_t)a3 backgroundView:(id)a4
{
  id v5 = a4;
  if (a3 <= 0xB && ((0x833u >> a3) & 1) != 0) {
    v6 = (objc_class *)objc_opt_class();
  }
  else {
    v6 = 0;
  }
  id v7 = [[v6 alloc] initWithBackgroundView:v5];

  return v7;
}

- (NTKZeusComplicationView)initWithBackgroundView:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NTKZeusComplicationView;
  v6 = [(NTKZeusComplicationView *)&v11 init];
  if (v6)
  {
    id v7 = +[NTKFaceViewRenderingContext sharedRenderingContext];
    uint64_t v8 = [v7 device];
    device = v6->_device;
    v6->_device = (CLKDevice *)v8;

    objc_storeStrong((id *)&v6->_backgroundView, a3);
    if (v5)
    {
      [v5 setDevice:v6->_device];
      [(NTKZeusComplicationView *)v6 addSubview:v5];
    }
  }

  return v6;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)NTKZeusComplicationView;
  [(NTKZeusComplicationView *)&v4 layoutSubviews];
  backgroundView = self->_backgroundView;
  [(NTKZeusComplicationView *)self contentFrame];
  -[NTKZeusComplicationView padContentFrame:](self, "padContentFrame:");
  -[NTKZeudleComplicationBackgroundView setContentFrame:](backgroundView, "setContentFrame:");
  [(NTKZeudleComplicationBackgroundView *)self->_backgroundView layoutSubviews];
}

- (CGRect)contentFrame
{
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLegibilityEnabled:(BOOL)a3
{
  if (self->_legibilityEnabled != a3)
  {
    self->_legibilityEnabled = a3;
    [(NTKZeusComplicationView *)self _updateLegibility];
  }
}

- (void)applyPalette:(id)a3
{
  objc_storeStrong((id *)&self->_palette, a3);
  id v5 = a3;
  [(NTKZeudleComplicationBackgroundView *)self->_backgroundView setPalette:v5];
}

- (void)blancEditModeApplyPalette:(id)a3
{
  objc_storeStrong((id *)&self->_palette, a3);
  id v5 = a3;
  [(NTKZeudleComplicationBackgroundView *)self->_backgroundView setBlancEditModePalette:v5];
}

- (void)applyTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5
{
}

- (void)applyTransitionFraction:(double)a3 fromMode:(int64_t)a4 toMode:(int64_t)a5
{
}

- (id)complicationColorForBlancEditMode:(int64_t)a3
{
  return [(NTKZeudleComplicationBackgroundView *)self->_backgroundView complicationColorForBlancEditMode:a3];
}

- (CDComplicationDisplayObserver)displayObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->displayObserver);

  return (CDComplicationDisplayObserver *)WeakRetained;
}

- (void)setDisplayObserver:(id)a3
{
}

- (unint64_t)textLayoutStyle
{
  return self->textLayoutStyle;
}

- (void)setTextLayoutStyle:(unint64_t)a3
{
  self->textLayoutStyle = a3;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (NTKZeudleColorPalette)palette
{
  return self->_palette;
}

- (BOOL)legibilityEnabled
{
  return self->_legibilityEnabled;
}

- (NTKZeudleComplicationBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (CLKDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_palette, 0);

  objc_destroyWeak((id *)&self->displayObserver);
}

@end