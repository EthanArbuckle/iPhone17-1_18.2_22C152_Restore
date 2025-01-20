@interface CDRichComplicationCornerMeteredGaugeTextView
+ (BOOL)handlesComplicationTemplate:(id)a3;
+ (int64_t)progressFillStyle;
- (CDRichComplicationCornerMeteredGaugeTextView)initWithFontFallback:(int64_t)a3;
- (CDRichComplicationImageView)outerImageView;
- (int64_t)tritiumUpdateMode;
- (void)_handleTemplate:(id)a3 reason:(int64_t)a4;
- (void)layoutSubviews;
@end

@implementation CDRichComplicationCornerMeteredGaugeTextView

- (CDRichComplicationCornerMeteredGaugeTextView)initWithFontFallback:(int64_t)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CDRichComplicationCornerMeteredGaugeTextView;
  v3 = [(CDRichComplicationCornerGaugeTextView *)&v15 initWithFontFallback:a3];
  v4 = v3;
  if (v3)
  {
    [(CDRichComplicationCornerGaugeTextView *)v3 _enumerateLabelsWithBlock:&__block_literal_global_2];
    v5 = [CDRichComplicationImageView alloc];
    v6 = [(CDRichComplicationView *)v4 device];
    uint64_t v7 = [(CDRichComplicationImageView *)v5 initWithDevice:v6 useAccentColor:1];
    outerImageView = v4->_outerImageView;
    v4->_outerImageView = (CDRichComplicationImageView *)v7;

    [(CDRichComplicationImageView *)v4->_outerImageView setPaused:[(CDRichComplicationView *)v4 paused]];
    [(CDRichComplicationImageView *)v4->_outerImageView setFilterProvider:v4];
    v9 = [(CDRichComplicationCornerGaugeTextView *)v4 outerLabel];
    v10 = [(CDRichComplicationCornerMeteredGaugeTextView *)v4 outerImageView];
    v11 = [(CDRichComplicationView *)v4 device];
    _LayoutConstants(v11, (uint64_t)v13);
    [v9 setImageView:v10 placement:1 padding:v14];
  }
  return v4;
}

uint64_t __69__CDRichComplicationCornerMeteredGaugeTextView_initWithFontFallback___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setUppercase:0];
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)CDRichComplicationCornerMeteredGaugeTextView;
  [(CDRichComplicationCornerGaugeTextView *)&v15 layoutSubviews];
  v3 = [(CDRichComplicationView *)self device];
  _LayoutConstants(v3, (uint64_t)&v14);

  v4 = [(CDRichComplicationView *)self device];
  CLKPixelAlignRectForDevice();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(CDRichComplicationCornerMeteredGaugeTextView *)self outerImageView];
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);
}

- (int64_t)tritiumUpdateMode
{
  v3 = [(CDRichComplicationCornerMeteredGaugeTextView *)self outerImageView];
  v4 = [v3 tritiumUpdateMode];

  if (v4)
  {
    id v5 = (id)[v4 integerValue];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CDRichComplicationCornerMeteredGaugeTextView;
    id v5 = [(CDRichComplicationTemplateView *)&v8 tritiumUpdateMode];
  }
  int64_t v6 = (int64_t)v5;

  return v6;
}

+ (int64_t)progressFillStyle
{
  return 4;
}

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  double v7 = [(CDRichComplicationCornerGaugeTextView *)self outerLabel];
  objc_super v8 = [v6 outerTextProvider];
  [v7 setTextProvider:v8];

  double v9 = [v6 gaugeProvider];
  double v10 = [v6 leadingTextProvider];
  double v11 = [v6 trailingTextProvider];
  [(CDRichComplicationCornerBaseGaugeView *)self handleGaugeProvider:v9 leftTextProvider:v10 rightTextProvider:v11];

  id v13 = [(CDRichComplicationCornerMeteredGaugeTextView *)self outerImageView];
  double v12 = [v6 outerImageProvider];

  [v13 setImageProvider:v12 reason:a4];
}

- (CDRichComplicationImageView)outerImageView
{
  return self->_outerImageView;
}

- (void).cxx_destruct
{
}

@end