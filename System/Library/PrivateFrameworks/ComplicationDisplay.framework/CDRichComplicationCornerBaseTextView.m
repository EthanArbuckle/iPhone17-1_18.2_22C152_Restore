@interface CDRichComplicationCornerBaseTextView
- (CDRichComplicationCornerBaseTextView)initWithFontFallback:(int64_t)a3;
- (NSArray)innerLabelProviders;
- (id)innerLabel;
- (void)_enumerateLabelsWithBlock:(id)a3;
- (void)_setFontConfiguration:(CDRichComplicationFontConfiguration *)a3;
- (void)layoutSubviews;
- (void)setInnerLabelProviders:(id)a3;
@end

@implementation CDRichComplicationCornerBaseTextView

- (CDRichComplicationCornerBaseTextView)initWithFontFallback:(int64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CDRichComplicationCornerBaseTextView;
  v3 = [(CDRichComplicationCornerView *)&v11 initWithFontFallback:a3];
  v4 = v3;
  if (v3)
  {
    uint64_t v10 = 0;
    memset(v9, 0, sizeof(v9));
    v5 = [(CDRichComplicationView *)v3 device];
    _LayoutConstants_0(v5, (uint64_t)v9);

    uint64_t v6 = [(CDRichComplicationCornerView *)v4 _createAndAddColoringLabelWithFontSize:*(double *)v9];
    innerLabel = v4->_innerLabel;
    v4->_innerLabel = (CLKUICurvedColoringLabel *)v6;

    CLKDegreesToRadians();
    -[CLKUICurvedColoringLabel setMaxAngularWidth:](v4->_innerLabel, "setMaxAngularWidth:");
  }
  return v4;
}

- (id)innerLabel
{
  return self->_innerLabel;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)CDRichComplicationCornerBaseTextView;
  [(CDRichComplicationCornerBaseTextView *)&v14 layoutSubviews];
  double v13 = 0.0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = [(CDRichComplicationView *)self device];
  _LayoutConstants_0(v3, (uint64_t)&v8);

  switch([(CDRichComplicationCornerView *)self cornerComplicationPosition])
  {
    case 0:
    case 1:
      [(CLKUICurvedColoringLabel *)self->_innerLabel setCircleRadius:*((double *)&v9 + 1) + *((double *)&v10 + 1)];
      [(CLKUICurvedColoringLabel *)self->_innerLabel setInterior:0];
      double v4 = *((double *)&v12 + 1);
      goto LABEL_4;
    case 2:
    case 3:
      [(CLKUICurvedColoringLabel *)self->_innerLabel setCircleRadius:*(double *)&v10 + *(double *)&v11];
      [(CLKUICurvedColoringLabel *)self->_innerLabel setInterior:1];
      double v4 = v13;
LABEL_4:
      [(CLKUICurvedColoringLabel *)self->_innerLabel setTracking:v4];
      break;
    default:
      break;
  }
  innerLabel = self->_innerLabel;
  double v6 = *((double *)&v11 + 1);
  [(CDRichComplicationCornerView *)self innerComponentRotationInDegree];
  [(CDRichComplicationCornerView *)self _layoutCurvedLabel:innerLabel centerAngleInDegree:v6 editingRotationInDegree:v7];
}

- (void)_setFontConfiguration:(CDRichComplicationFontConfiguration *)a3
{
  v9[0] = a3->var0;
  id v5 = a3->var1;
  double var2 = a3->var2;
  id v10 = v5;
  double v11 = var2;
  v8.receiver = self;
  v8.super_class = (Class)CDRichComplicationCornerBaseTextView;
  [(CDRichComplicationView *)&v8 _setFontConfiguration:v9];
  if (a3->var1)
  {
    -[CDRichComplicationView _updateColoringLabel:withFontDescriptor:andSizeFactor:](self, "_updateColoringLabel:withFontDescriptor:andSizeFactor:", self->_innerLabel, a3->var2);
  }
  else
  {
    if (a3->var0) {
      double v7 = (double *)MEMORY[0x263F81828];
    }
    else {
      double v7 = (double *)MEMORY[0x263F81840];
    }
    [(CDRichComplicationCornerView *)self _updateColoringLabel:self->_innerLabel withFontWeight:*v7];
  }
}

- (void)setInnerLabelProviders:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_innerLabelProviders, a3);
  if ([(NSArray *)self->_innerLabelProviders count])
  {
    id v20 = v5;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    obj = self->_innerLabelProviders;
    uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v22 = *(void *)v25;
LABEL_4:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(obj);
        }
        long long v9 = *(void **)(*((void *)&v24 + 1) + 8 * v8);
        id v10 = objc_msgSend(v9, "imageProvider", v20);
        if ([v10 conformsToProtocol:&unk_26CF70918])
        {
          innerLabel = self->_innerLabel;
          id v12 = v10;
          double v13 = [(CLKUICurvedColoringLabel *)innerLabel font];
          [v12 setFont:v13];

          [v12 setScale:2];
        }
        objc_super v14 = [(CLKUICurvedColoringLabel *)self->_innerLabel imageView];
        if (![v14 conformsToProtocol:&unk_26CF6F628]
          || !+[CDComplicationImageViewProvider existingImageView:v14 supportsImageProvider:v10])
        {
          uint64_t v15 = +[CDComplicationImageViewProvider viewForImageProvider:v10];

          v16 = self->_innerLabel;
          v17 = [(CDRichComplicationView *)self device];
          [(CLKUICurvedColoringLabel *)v16 setImageView:v15 placement:1 padding:CDRichComplicationCornerInnerImagePadding(v17)];

          objc_super v14 = (void *)v15;
        }
        [v14 setImageProvider:v10];
        v18 = [v9 textProvider];
        [(CLKUICurvedColoringLabel *)self->_innerLabel setTextProvider:v18];
        if (v10 && !v18)
        {
          [(CLKUICurvedColoringLabel *)self->_innerLabel setText:@"​"];
          [(CLKUICurvedColoringLabel *)self->_innerLabel setImagePadding:0.0];
        }
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __63__CDRichComplicationCornerBaseTextView_setInnerLabelProviders___block_invoke;
        v23[3] = &unk_2644A5280;
        v23[4] = self;
        [MEMORY[0x263F82E00] performWithoutAnimation:v23];
        int v19 = [(CLKUICurvedColoringLabel *)self->_innerLabel isTextTruncated];

        if (!v19) {
          break;
        }
        if (v7 == ++v8)
        {
          uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v7) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    id v5 = v20;
  }
  else
  {
    [(CLKUICurvedColoringLabel *)self->_innerLabel setImageView:0];
    [(CLKUICurvedColoringLabel *)self->_innerLabel setTextProvider:0];
  }
}

uint64_t __63__CDRichComplicationCornerBaseTextView_setInnerLabelProviders___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutSubviews];
}

- (void)_enumerateLabelsWithBlock:(id)a3
{
}

- (NSArray)innerLabelProviders
{
  return self->_innerLabelProviders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerLabelProviders, 0);
  objc_storeStrong((id *)&self->_innerLabel, 0);
}

@end