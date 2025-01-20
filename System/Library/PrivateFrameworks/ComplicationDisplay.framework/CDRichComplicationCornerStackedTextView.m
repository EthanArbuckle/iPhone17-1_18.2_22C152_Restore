@interface CDRichComplicationCornerStackedTextView
+ (BOOL)handlesComplicationTemplate:(id)a3;
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
- (CDRichComplicationCornerStackedTextView)initWithFontFallback:(int64_t)a3;
- (NSArray)outerLabelProviders;
- (id)outerLabel;
- (void)_editingDidEnd;
- (void)_enumerateLabelsWithBlock:(id)a3;
- (void)_handleTemplate:(id)a3 reason:(int64_t)a4;
- (void)_setFontConfiguration:(CDRichComplicationFontConfiguration *)a3;
- (void)layoutSubviews;
- (void)setOuterLabelProviders:(id)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation CDRichComplicationCornerStackedTextView

- (CDRichComplicationCornerStackedTextView)initWithFontFallback:(int64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CDRichComplicationCornerStackedTextView;
  v3 = [(CDRichComplicationCornerBaseTextView *)&v12 initWithFontFallback:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(CDRichComplicationView *)v3 device];
    _LayoutConstants_2(v5, v11);
    uint64_t v6 = [(CDRichComplicationCornerView *)v4 _createAndAddColoringLabelWithFontSize:v11[0]];
    outerLabel = v4->_outerLabel;
    v4->_outerLabel = (CLKUICurvedColoringLabel *)v6;

    v8 = [(CDRichComplicationView *)v4 device];
    _LayoutConstants_2(v8, &v10);
    CLKDegreesToRadians();
    -[CLKUICurvedColoringLabel setMaxAngularWidth:](v4->_outerLabel, "setMaxAngularWidth:");

    [(CLKUICurvedColoringLabel *)v4->_outerLabel setUsesTextProviderTintColoring:1];
  }
  return v4;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)CDRichComplicationCornerStackedTextView;
  [(CDRichComplicationCornerBaseTextView *)&v13 layoutSubviews];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = [(CDRichComplicationView *)self device];
  _LayoutConstants_2(v3, &v8);

  switch([(CDRichComplicationCornerView *)self cornerComplicationPosition])
  {
    case 0:
    case 1:
      [(CLKUICurvedColoringLabel *)self->_outerLabel setCircleRadius:*(double *)&v9];
      [(CLKUICurvedColoringLabel *)self->_outerLabel setInterior:0];
      double v4 = *((double *)&v10 + 1);
      goto LABEL_4;
    case 2:
    case 3:
      [(CLKUICurvedColoringLabel *)self->_outerLabel setCircleRadius:*((double *)&v9 + 1)];
      [(CLKUICurvedColoringLabel *)self->_outerLabel setInterior:1];
      double v4 = *(double *)&v11;
LABEL_4:
      [(CLKUICurvedColoringLabel *)self->_outerLabel setTracking:v4];
      break;
    default:
      break;
  }
  outerLabel = self->_outerLabel;
  double v6 = *(double *)&v10;
  [(CDRichComplicationCornerView *)self outerComponentRotationInDegree];
  [(CDRichComplicationCornerView *)self _layoutCurvedLabel:outerLabel centerAngleInDegree:v6 editingRotationInDegree:v7];
}

- (id)outerLabel
{
  return self->_outerLabel;
}

- (void)_setFontConfiguration:(CDRichComplicationFontConfiguration *)a3
{
  v9[0] = a3->var0;
  id v5 = a3->var1;
  double var2 = a3->var2;
  id v10 = v5;
  double v11 = var2;
  v8.receiver = self;
  v8.super_class = (Class)CDRichComplicationCornerStackedTextView;
  [(CDRichComplicationCornerBaseTextView *)&v8 _setFontConfiguration:v9];
  if (a3->var1)
  {
    -[CDRichComplicationView _updateColoringLabel:withFontDescriptor:andSizeFactor:](self, "_updateColoringLabel:withFontDescriptor:andSizeFactor:", self->_outerLabel, a3->var2);
  }
  else
  {
    if (a3->var0) {
      double v7 = (double *)MEMORY[0x263F81828];
    }
    else {
      double v7 = (double *)MEMORY[0x263F81840];
    }
    [(CDRichComplicationCornerView *)self _updateColoringLabel:self->_outerLabel withFontWeight:*v7];
  }
}

- (void)setOuterLabelProviders:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_outerLabelProviders, a3);
  if ([(NSArray *)self->_outerLabelProviders count])
  {
    id v13 = v5;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    double v6 = self->_outerLabelProviders;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "textProvider", v13);
        [(CLKUICurvedColoringLabel *)self->_outerLabel setTextProvider:v11];
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __66__CDRichComplicationCornerStackedTextView_setOuterLabelProviders___block_invoke;
        v14[3] = &unk_2644A5280;
        v14[4] = self;
        [MEMORY[0x263F82E00] performWithoutAnimation:v14];
        int v12 = [(CLKUICurvedColoringLabel *)self->_outerLabel isTextTruncated];

        if (!v12) {
          break;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v8) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    id v5 = v13;
  }
  else
  {
    [(CLKUICurvedColoringLabel *)self->_outerLabel setImageView:0];
    [(CLKUICurvedColoringLabel *)self->_outerLabel setTextProvider:0];
  }
}

uint64_t __66__CDRichComplicationCornerStackedTextView_setOuterLabelProviders___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutSubviews];
}

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 8;
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v5 = a3;
  double v6 = [(CDRichComplicationCornerBaseTextView *)self innerLabel];
  uint64_t v7 = [v5 innerTextProvider];
  [v6 setTextProvider:v7];

  outerLabel = self->_outerLabel;
  id v9 = [v5 outerTextProvider];

  [(CLKUICurvedColoringLabel *)outerLabel setTextProvider:v9];
}

- (void)_enumerateLabelsWithBlock:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CDRichComplicationCornerStackedTextView;
  double v4 = (void (**)(id, CLKUICurvedColoringLabel *))a3;
  [(CDRichComplicationCornerBaseTextView *)&v5 _enumerateLabelsWithBlock:v4];
  v4[2](v4, self->_outerLabel);
}

- (void)_editingDidEnd
{
  id v3 = [(CDRichComplicationCornerBaseTextView *)self innerLabel];
  [v3 editingDidEnd];

  outerLabel = self->_outerLabel;
  [(CLKUICurvedColoringLabel *)outerLabel editingDidEnd];
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  objc_super v5 = [(CDRichComplicationCornerBaseTextView *)self innerLabel];
  [v5 transitionToMonochromeWithFraction:2 style:a3];

  outerLabel = self->_outerLabel;
  [(CLKUICurvedColoringLabel *)outerLabel transitionToMonochromeWithFraction:0 style:a3];
}

- (void)updateMonochromeColor
{
  id v3 = [(CDRichComplicationCornerBaseTextView *)self innerLabel];
  [v3 updateMonochromeColorWithStyle:2];

  outerLabel = self->_outerLabel;
  [(CLKUICurvedColoringLabel *)outerLabel updateMonochromeColorWithStyle:0];
}

- (NSArray)outerLabelProviders
{
  return self->_outerLabelProviders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outerLabelProviders, 0);
  objc_storeStrong((id *)&self->_outerLabel, 0);
}

@end