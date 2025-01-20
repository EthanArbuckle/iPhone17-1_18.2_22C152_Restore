@interface CDRichComplicationCornerBaseGaugeView
+ (BOOL)isMeteredProgressView;
+ (int64_t)progressFillStyle;
- (CDRichComplicationCornerBaseGaugeView)initWithFontFallback:(int64_t)a3;
- (double)_calculateProgressWidthWithLeftLabelWidth:(double)a3 rightLabelWidth:(double)a4;
- (double)_layoutLabel:(id)a3 withLabelCenter:(CGPoint)a4 labelWidthInRadius:(double)a5 leftInRadius:(double)a6;
- (double)_layoutProgressViewWithBeginAngle:(double)a3 widthInRadius:(double)a4 bottomPadding:(double)a5;
- (double)_progressViewHorizontalPaddingInRadius;
- (id)leftLabel;
- (id)progressView;
- (id)rightLabel;
- (void)_calculateLabel:(id)a3 center:(CGPoint *)a4 widthInRadius:(double *)a5;
- (void)_editingDidEnd;
- (void)_enumerateLabelsWithBlock:(id)a3;
- (void)_layoutSubviewsWithoutAnimation;
- (void)_replaceProgressView:(int64_t)a3;
- (void)_setFontConfiguration:(CDRichComplicationFontConfiguration *)a3;
- (void)_updateLabelMaxWidths;
- (void)handleGaugeProvider:(id)a3 leftLabelProvider:(id)a4 rightLabelProvider:(id)a5;
- (void)handleGaugeProvider:(id)a3 leftTextProvider:(id)a4 rightTextProvider:(id)a5;
- (void)layoutSubviews;
- (void)setCornerComplicationPosition:(int64_t)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation CDRichComplicationCornerBaseGaugeView

+ (BOOL)isMeteredProgressView
{
  uint64_t v2 = [a1 progressFillStyle];
  return CDRichComplicationProgressFillStyleIsMetered(v2);
}

+ (int64_t)progressFillStyle
{
  return 0;
}

- (CDRichComplicationCornerBaseGaugeView)initWithFontFallback:(int64_t)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CDRichComplicationCornerBaseGaugeView;
  v3 = [(CDRichComplicationCornerView *)&v17 initWithFontFallback:a3];
  v4 = v3;
  if (v3)
  {
    uint64_t v16 = 0;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v13 = 0u;
    v5 = [(CDRichComplicationView *)v3 device];
    _LayoutConstants_1(v5, (uint64_t)&v12);

    -[CDRichComplicationCornerBaseGaugeView _replaceProgressView:](v4, "_replaceProgressView:", [(id)objc_opt_class() progressFillStyle]);
    double v6 = *((double *)&v13 + 1);
    uint64_t v7 = [(CDRichComplicationCornerView *)v4 _createAndAddColoringLabelWithFontSize:*((double *)&v13 + 1)];
    leftLabel = v4->_leftLabel;
    v4->_leftLabel = (CLKUICurvedColoringLabel *)v7;

    [(CLKUICurvedColoringLabel *)v4->_leftLabel setImagePlacement:1];
    uint64_t v9 = [(CDRichComplicationCornerView *)v4 _createAndAddColoringLabelWithFontSize:v6];
    rightLabel = v4->_rightLabel;
    v4->_rightLabel = (CLKUICurvedColoringLabel *)v9;

    [(CLKUICurvedColoringLabel *)v4->_rightLabel setImagePlacement:2];
  }
  return v4;
}

- (void)_replaceProgressView:(int64_t)a3
{
  [(CDRichComplicationCurvedProgressView *)self->_progressView removeFromSuperview];
  v5 = [(CDRichComplicationView *)self device];
  _LayoutConstants_1(v5, (uint64_t)&v12);

  if ([(id)objc_opt_class() isMeteredProgressView]) {
    double v6 = (double *)&v13;
  }
  else {
    double v6 = (double *)&v12;
  }
  double v7 = *v6;
  v8 = [CDRichComplicationCurvedProgressView alloc];
  uint64_t v9 = [(CDRichComplicationView *)self device];
  v10 = [(CDRichComplicationCurvedProgressView *)v8 initWithFamily:10 curveWidth:v9 padding:2 beginAngle:a3 endAngle:v7 forDevice:0.0 withFilterStyle:0.0 progressFillStyle:0.0];
  progressView = self->_progressView;
  self->_progressView = v10;

  [(CDRichComplicationCornerBaseGaugeView *)self addSubview:self->_progressView];
  [(CDRichComplicationProgressView *)self->_progressView setFilterProvider:self];
  [(CDRichComplicationCornerBaseGaugeView *)self setNeedsLayout];
}

- (void)_setFontConfiguration:(CDRichComplicationFontConfiguration *)a3
{
  v12[0] = a3->var0;
  id v5 = a3->var1;
  double var2 = a3->var2;
  id v13 = v5;
  double v14 = var2;
  v11.receiver = self;
  v11.super_class = (Class)CDRichComplicationCornerBaseGaugeView;
  [(CDRichComplicationView *)&v11 _setFontConfiguration:v12];
  id v7 = a3->var1;
  if (v7)
  {
    double v8 = a3->var2;
    [(CDRichComplicationView *)self _updateColoringLabel:self->_leftLabel withFontDescriptor:v7 andSizeFactor:v8];
    [(CDRichComplicationView *)self _updateColoringLabel:self->_rightLabel withFontDescriptor:v7 andSizeFactor:v8];
  }
  else
  {
    if (a3->var0) {
      uint64_t v9 = (double *)MEMORY[0x263F81828];
    }
    else {
      uint64_t v9 = (double *)MEMORY[0x263F81840];
    }
    double v10 = *v9;
    [(CDRichComplicationCornerView *)self _updateColoringLabel:self->_leftLabel withFontWeight:*v9];
    [(CDRichComplicationCornerView *)self _updateColoringLabel:self->_rightLabel withFontWeight:v10];
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CDRichComplicationCornerBaseGaugeView;
  [(CDRichComplicationCornerBaseGaugeView *)&v4 layoutSubviews];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __55__CDRichComplicationCornerBaseGaugeView_layoutSubviews__block_invoke;
  v3[3] = &unk_2644A5280;
  v3[4] = self;
  [MEMORY[0x263F82E00] performWithoutAnimation:v3];
}

uint64_t __55__CDRichComplicationCornerBaseGaugeView_layoutSubviews__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutSubviewsWithoutAnimation];
}

- (void)setCornerComplicationPosition:(int64_t)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CDRichComplicationCornerBaseGaugeView;
  -[CDRichComplicationCornerView setCornerComplicationPosition:](&v18, sel_setCornerComplicationPosition_);
  uint64_t v17 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  memset(v14, 0, sizeof(v14));
  id v5 = [(CDRichComplicationView *)self device];
  _LayoutConstants_1(v5, (uint64_t)v14);

  switch(a3)
  {
    case 0:
    case 1:
      char v6 = 0;
      uint64_t v7 = v15;
      double v8 = (uint64_t *)&v16;
      uint64_t v9 = 1;
      goto LABEL_4;
    case 2:
    case 3:
      uint64_t v9 = 0;
      uint64_t v7 = *((void *)&v15 + 1);
      double v8 = (uint64_t *)&v16 + 1;
      char v6 = 1;
LABEL_4:
      uint64_t v10 = *v8;
      [(CDRichComplicationCurvedProgressView *)self->_progressView setClockwise:v9];
      break;
    default:
      char v6 = 0;
      uint64_t v10 = 0;
      uint64_t v7 = 0;
      break;
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__CDRichComplicationCornerBaseGaugeView_setCornerComplicationPosition___block_invoke;
  aBlock[3] = &__block_descriptor_49_e34_v16__0__CLKUICurvedColoringLabel_8l;
  char v13 = v6;
  aBlock[4] = v7;
  aBlock[5] = v10;
  objc_super v11 = (void (**)(void *, CLKUICurvedColoringLabel *))_Block_copy(aBlock);
  v11[2](v11, self->_leftLabel);
  v11[2](v11, self->_rightLabel);
}

void __71__CDRichComplicationCornerBaseGaugeView_setCornerComplicationPosition___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 32);
  id v4 = a2;
  [v4 setCircleRadius:v3];
  [v4 setInterior:*(unsigned __int8 *)(a1 + 48)];
  [v4 setTracking:*(double *)(a1 + 40)];
  [v4 setCenterAngle:0.0];
}

- (id)progressView
{
  return self->_progressView;
}

- (id)leftLabel
{
  return self->_leftLabel;
}

- (id)rightLabel
{
  return self->_rightLabel;
}

- (void)handleGaugeProvider:(id)a3 leftTextProvider:(id)a4 rightTextProvider:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  long long v12 = [[CDLabelProvider alloc] initWithTextProvider:v9 imageProvider:0];

  objc_super v11 = [[CDLabelProvider alloc] initWithTextProvider:v8 imageProvider:0];
  [(CDRichComplicationCornerBaseGaugeView *)self handleGaugeProvider:v10 leftLabelProvider:v12 rightLabelProvider:v11];
}

- (void)handleGaugeProvider:(id)a3 leftLabelProvider:(id)a4 rightLabelProvider:(id)a5
{
  id v31 = a4;
  id v8 = a5;
  [(CDRichComplicationProgressView *)self->_progressView setGaugeProvider:a3];
  id v9 = [v31 textProvider];

  if (v9)
  {
    id v10 = [v31 textProvider];
    [(CLKUICurvedColoringLabel *)self->_leftLabel setTextProvider:v10];

    [(CLKUICurvedColoringLabel *)self->_leftLabel setImageView:0];
    leftLabel = self->_leftLabel;
    uint64_t v12 = 0;
LABEL_3:
    [(CLKUICurvedColoringLabel *)leftLabel setHidden:v12];
    goto LABEL_11;
  }
  char v13 = [v31 imageProvider];

  if (!v13)
  {
    [(CLKUICurvedColoringLabel *)self->_leftLabel setTextProvider:0];
    [(CLKUICurvedColoringLabel *)self->_leftLabel setImageView:0];
    leftLabel = self->_leftLabel;
    uint64_t v12 = 1;
    goto LABEL_3;
  }
  double v14 = [v31 imageProvider];
  if ([v14 conformsToProtocol:&unk_26CF70918])
  {
    long long v15 = self->_leftLabel;
    id v16 = v14;
    uint64_t v17 = [(CLKUICurvedColoringLabel *)v15 font];
    [v16 setFont:v17];

    [v16 setScale:2];
  }
  objc_super v18 = [(CLKUICurvedColoringLabel *)self->_leftLabel imageView];
  if (![v18 conformsToProtocol:&unk_26CF6F628]
    || !+[CDComplicationImageViewProvider existingImageView:v18 supportsImageProvider:v14])
  {
    uint64_t v19 = +[CDComplicationImageViewProvider viewForImageProvider:v14];

    [(CLKUICurvedColoringLabel *)self->_leftLabel setImageView:v19];
    objc_super v18 = (void *)v19;
  }
  [v18 setImageProvider:v14];
  [(CLKUICurvedColoringLabel *)self->_leftLabel setTextProvider:0];
  [(CLKUICurvedColoringLabel *)self->_leftLabel setText:@"​"];
  [(CLKUICurvedColoringLabel *)self->_leftLabel setHidden:0];

LABEL_11:
  v20 = [v8 textProvider];

  if (v20)
  {
    v21 = [v8 textProvider];
    [(CLKUICurvedColoringLabel *)self->_rightLabel setTextProvider:v21];

    [(CLKUICurvedColoringLabel *)self->_rightLabel setImageView:0];
    rightLabel = self->_rightLabel;
    uint64_t v23 = 0;
LABEL_13:
    [(CLKUICurvedColoringLabel *)rightLabel setHidden:v23];
    goto LABEL_21;
  }
  v24 = [v8 imageProvider];

  if (!v24)
  {
    [(CLKUICurvedColoringLabel *)self->_rightLabel setTextProvider:0];
    [(CLKUICurvedColoringLabel *)self->_rightLabel setImageView:0];
    rightLabel = self->_rightLabel;
    uint64_t v23 = 1;
    goto LABEL_13;
  }
  v25 = [v8 imageProvider];
  if ([v25 conformsToProtocol:&unk_26CF70918])
  {
    v26 = self->_rightLabel;
    id v27 = v25;
    v28 = [(CLKUICurvedColoringLabel *)v26 font];
    [v27 setFont:v28];

    [v27 setScale:2];
  }
  v29 = [(CLKUICurvedColoringLabel *)self->_rightLabel imageView];
  if (![v29 conformsToProtocol:&unk_26CF6F628]
    || !+[CDComplicationImageViewProvider existingImageView:v29 supportsImageProvider:v25])
  {
    uint64_t v30 = +[CDComplicationImageViewProvider viewForImageProvider:v25];

    [(CLKUICurvedColoringLabel *)self->_rightLabel setImageView:v30];
    v29 = (void *)v30;
  }
  [v29 setImageProvider:v25];
  [(CLKUICurvedColoringLabel *)self->_rightLabel setTextProvider:0];
  [(CLKUICurvedColoringLabel *)self->_rightLabel setText:@"​"];
  [(CLKUICurvedColoringLabel *)self->_rightLabel setHidden:0];

LABEL_21:
}

- (double)_progressViewHorizontalPaddingInRadius
{
  uint64_t v9 = 0;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  uint64_t v2 = [(CDRichComplicationView *)self device];
  _LayoutConstants_1(v2, (uint64_t)&v4);

  return *((double *)&v5 + 1);
}

- (double)_layoutProgressViewWithBeginAngle:(double)a3 widthInRadius:(double)a4 bottomPadding:(double)a5
{
  uint64_t v38 = 0;
  memset(v37, 0, sizeof(v37));
  memset(v36, 0, sizeof(v36));
  long long v8 = [(CDRichComplicationView *)self device];
  _LayoutConstants_1(v8, (uint64_t)v36);

  uint64_t v9 = [(CDRichComplicationView *)self device];
  [v9 screenBounds];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  objc_super v18 = [(CDRichComplicationView *)self device];
  double v19 = CDCornerComplicationSize(v18);
  double v21 = v20;

  switch([(CDRichComplicationCornerView *)self cornerComplicationPosition])
  {
    case 0:
      double v22 = a3 + a4;
      a3 = a3 + 3.14159265;
      double v33 = a3 + a4;
      double v34 = v22;
      double v23 = 0.0;
      double v24 = 0.0;
      break;
    case 1:
      double v32 = a3 + 3.14159265;
      double v33 = a3 + 3.14159265 + a4;
      v39.origin.x = v11;
      v39.origin.y = v13;
      v39.size.width = v15;
      v39.size.height = v17;
      double v24 = CGRectGetWidth(v39) - v19;
      double v34 = a3 + a4;
      double v23 = 0.0;
      a3 = a3 + 3.14159265;
      break;
    case 2:
      double v25 = a3 - a4;
      v40.origin.x = v11;
      v40.origin.y = v13;
      v40.size.width = v15;
      v40.size.height = v17;
      double v23 = CGRectGetHeight(v40) - v21;
      double v24 = 0.0;
      goto LABEL_7;
    case 3:
      double v25 = a3 - a4;
      v41.origin.x = v11;
      v41.origin.y = v13;
      v41.size.width = v15;
      v41.size.height = v17;
      double v24 = CGRectGetWidth(v41) - v19;
      v42.origin.x = v11;
      v42.origin.y = v13;
      v42.size.width = v15;
      v42.size.height = v17;
      double v23 = CGRectGetHeight(v42) - v21;
LABEL_7:
      double v33 = v25;
      double v34 = v25;
      break;
    default:
      double v24 = *MEMORY[0x263F00148];
      double v23 = *(double *)(MEMORY[0x263F00148] + 8);
      double v33 = 0.0;
      double v34 = 0.0;
      a3 = 0.0;
      break;
  }
  v43.origin.x = v11;
  v43.origin.y = v13;
  v43.size.width = v15;
  v43.size.height = v17;
  double MidX = CGRectGetMidX(v43);
  v44.origin.x = v11;
  v44.origin.y = v13;
  v44.size.width = v15;
  v44.size.height = v17;
  double v27 = MidX - v24;
  double v28 = CGRectGetMidY(v44) - v23;
  int v29 = [(id)objc_opt_class() isMeteredProgressView];
  uint64_t v30 = (double *)v37;
  if (!v29) {
    uint64_t v30 = (double *)v36;
  }
  -[CDRichComplicationCurvedProgressView setFrame:](self->_progressView, "setFrame:", v27 - (*v30 + *((double *)v36 + 1) + a5) * 0.5, v28 - (*v30 + *((double *)v36 + 1) + a5) * 0.5, *v30 + *((double *)v36 + 1) + a5, *v30 + *((double *)v36 + 1) + a5, *(void *)&v32);
  [(CDRichComplicationCurvedProgressView *)self->_progressView setBeginAngle:a3];
  [(CDRichComplicationCurvedProgressView *)self->_progressView setEndAngle:v33];
  return v34;
}

- (void)_calculateLabel:(id)a3 center:(CGPoint *)a4 widthInRadius:(double *)a5
{
  id v7 = a3;
  long long v8 = [v7 textProvider];
  if (v8)
  {
  }
  else
  {
    uint64_t v9 = [v7 imageView];

    if (!v9)
    {
      *a4 = *(CGPoint *)MEMORY[0x263F00148];
      *a5 = 0.0;
      goto LABEL_10;
    }
  }
  [v7 sizeToFit];
  double v13 = 0.0;
  double v14 = 0.0;
  [v7 getTextCenter:a4 startAngle:&v14 endAngle:&v13];
  double v10 = fabs(v14);
  double v11 = fabs(v13);
  if (v10 >= v11) {
    double v12 = v10;
  }
  else {
    double v12 = v11;
  }
  if (v10 >= v11) {
    double v10 = v11;
  }
  *a5 = v12 - v10;
LABEL_10:
}

- (double)_calculateProgressWidthWithLeftLabelWidth:(double)a3 rightLabelWidth:(double)a4
{
  if (a3 > 0.0 && a4 > 0.0)
  {
    CLKDegreesToRadians();
    double v8 = v7 - a3 - a4;
    [(CDRichComplicationCornerBaseGaugeView *)self _progressViewHorizontalPaddingInRadius];
    return v8 + v9 * -2.0;
  }
  if (a3 > 0.0)
  {
    CLKDegreesToRadians();
    double v12 = v11 - a3;
LABEL_8:
    [(CDRichComplicationCornerBaseGaugeView *)self _progressViewHorizontalPaddingInRadius];
    return v12 - v14;
  }
  if (a4 > 0.0)
  {
    CLKDegreesToRadians();
    double v12 = v13 - a4;
    goto LABEL_8;
  }
  CLKDegreesToRadians();
  return result;
}

- (double)_layoutLabel:(id)a3 withLabelCenter:(CGPoint)a4 labelWidthInRadius:(double)a5 leftInRadius:(double)a6
{
  id v7 = a3;
  double v8 = [(CDRichComplicationView *)self device];
  [v8 screenBounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v54.origin.double x = v10;
  v54.origin.y = v12;
  v54.size.width = v14;
  v54.size.height = v16;
  double MidX = CGRectGetMidX(v54);
  v55.origin.double x = v10;
  v55.origin.y = v12;
  v55.size.width = v14;
  v55.size.height = v16;
  double MidY = CGRectGetMidY(v55);
  long long v17 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v53[0] = *MEMORY[0x263F000D0];
  v53[1] = v17;
  v53[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v7 setTransform:v53];
  [v7 frame];
  objc_msgSend(v7, "sizeThatFits:", v18, v19);
  double v48 = 0.0;
  objc_msgSend(v7, "setFrame:");
  double v20 = [(CDRichComplicationView *)self device];
  double v21 = CDCornerComplicationSize(v20);
  double v41 = v22;

  int64_t v23 = [(CDRichComplicationCornerView *)self cornerComplicationPosition];
  double v24 = 0.0;
  double v25 = 0.0;
  double v26 = 0.0;
  double v27 = 0.0;
  double v28 = 0.0;
  switch(v23)
  {
    case 0:
      [v7 frame];
      double v26 = a4.x - v29 * 0.5;
      [v7 frame];
      double v25 = a4.y - v30 * 0.5;
      double v24 = a5 * 0.5 + a6;
      double v31 = a5 + a6;
      double v27 = MidY - a4.y;
      double v28 = MidX - a4.x;
      goto LABEL_7;
    case 1:
      v56.origin.double x = v10;
      v56.origin.y = v12;
      v56.size.width = v14;
      v56.size.height = v16;
      double v32 = MidX - a4.x - (CGRectGetWidth(v56) - v21);
      [v7 frame];
      double v26 = a4.x - v33 * 0.5;
      [v7 frame];
      double v25 = a4.y - v34 * 0.5;
      double v24 = a5 * 0.5 + a6;
      double v31 = a5 + a6;
      double v27 = MidY - a4.y;
      double v28 = v32;
      goto LABEL_7;
    case 2:
      double x = a4.x;
      double v36 = MidX - a4.x;
      goto LABEL_6;
    case 3:
      double x = a4.x;
      v57.origin.double x = v10;
      v57.origin.y = v12;
      v57.size.width = v14;
      v57.size.height = v16;
      double v36 = MidX - a4.x - (CGRectGetWidth(v57) - v21);
LABEL_6:
      double v43 = v36;
      v58.origin.double x = v10;
      v58.origin.y = v12;
      v58.size.width = v14;
      v58.size.height = v16;
      double v37 = MidY - a4.y - (CGRectGetHeight(v58) - v41);
      [v7 frame];
      double v26 = x - v38 * 0.5;
      [v7 frame];
      double v25 = a4.y - v39 * 0.5;
      double v24 = a6 - a5 * 0.5;
      double v31 = a6 - a5;
      double v27 = v37;
      double v28 = v43;
LABEL_7:
      double v48 = v31;
      break;
    default:
      break;
  }
  memset(&v52, 0, sizeof(v52));
  CGAffineTransformMakeTranslation(&v52, v28, v27);
  CGAffineTransform v50 = v52;
  CGAffineTransformTranslate(&v51, &v50, v26, v25);
  CGAffineTransform v52 = v51;
  CGAffineTransform v50 = v51;
  CGAffineTransformRotate(&v51, &v50, v24);
  CGAffineTransform v52 = v51;
  CGAffineTransform v50 = v51;
  CGAffineTransformTranslate(&v51, &v50, -v26, -v25);
  CGAffineTransform v52 = v51;
  CGAffineTransform v49 = v51;
  [v7 setTransform:&v49];

  return v48;
}

- (void)_layoutSubviewsWithoutAnimation
{
  double v32 = 0.0;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  double v3 = [(CDRichComplicationView *)self device];
  _LayoutConstants_1(v3, (uint64_t)&v27);

  [(CDRichComplicationCornerBaseGaugeView *)self _updateLabelMaxWidths];
  switch([(CDRichComplicationCornerView *)self cornerComplicationPosition])
  {
    case 0:
    case 3:
      double v4 = -v32;
      break;
    case 1:
    case 2:
      double v4 = v32;
      break;
    default:
      double v4 = 0.0;
      break;
  }
  [(CDRichComplicationCornerView *)self innerComponentRotationInDegree];
  CLKDegreesToRadians();
  double v6 = v5;
  double v25 = 0.0;
  double v26 = 0.0;
  double v24 = 0.0;
  [(CDRichComplicationCornerBaseGaugeView *)self _calculateLabel:self->_leftLabel center:&v25 widthInRadius:&v24];
  double v22 = 0.0;
  double v23 = 0.0;
  double v21 = 0.0;
  [(CDRichComplicationCornerBaseGaugeView *)self _calculateLabel:self->_rightLabel center:&v22 widthInRadius:&v21];
  [(CDRichComplicationCornerBaseGaugeView *)self _calculateProgressWidthWithLeftLabelWidth:v24 rightLabelWidth:v21];
  double v8 = v7;
  double v9 = v21;
  double v10 = v8 + v24 + v21;
  if (v24 > 0.0)
  {
    [(CDRichComplicationCornerBaseGaugeView *)self _progressViewHorizontalPaddingInRadius];
    double v10 = v10 + v11;
    double v9 = v21;
  }
  if (v9 > 0.0)
  {
    [(CDRichComplicationCornerBaseGaugeView *)self _progressViewHorizontalPaddingInRadius];
    double v10 = v10 + v12;
  }
  double v13 = v4 + v6;
  unint64_t v14 = [(CDRichComplicationCornerView *)self cornerComplicationPosition];
  if (v14 - 2 < 2)
  {
    double v15 = v13 + v10 * 0.5;
    [(CDRichComplicationCornerBaseGaugeView *)self _progressViewHorizontalPaddingInRadius];
    double v17 = -v18;
  }
  else if (v14 > 1)
  {
    double v15 = 0.0;
    double v17 = 0.0;
  }
  else
  {
    double v15 = v13 + v10 * -0.5;
    [(CDRichComplicationCornerBaseGaugeView *)self _progressViewHorizontalPaddingInRadius];
    double v17 = v16;
  }
  if (v24 > 0.0)
  {
    -[CDRichComplicationCornerBaseGaugeView _layoutLabel:withLabelCenter:labelWidthInRadius:leftInRadius:](self, "_layoutLabel:withLabelCenter:labelWidthInRadius:leftInRadius:", self->_leftLabel, v25, v26, v24, v15);
    double v15 = v17 + v19;
  }
  [(CDRichComplicationCornerBaseGaugeView *)self _layoutProgressViewWithBeginAngle:v15 widthInRadius:v8 bottomPadding:*(double *)&v28];
  if (v21 > 0.0) {
    -[CDRichComplicationCornerBaseGaugeView _layoutLabel:withLabelCenter:labelWidthInRadius:leftInRadius:](self, "_layoutLabel:withLabelCenter:labelWidthInRadius:leftInRadius:", self->_rightLabel, v22, v23, v21, v17 + v20);
  }
}

- (void)_updateLabelMaxWidths
{
  p_leftLabel = &self->_leftLabel;
  uint64_t v4 = [(CLKUICurvedColoringLabel *)self->_leftLabel textProvider];
  if (v4
    && (double v5 = (void *)v4,
        [(CLKUICurvedColoringLabel *)self->_rightLabel textProvider],
        double v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    CLKDegreesToRadians();
    -[CLKUICurvedColoringLabel setMaxAngularWidth:](*p_leftLabel, "setMaxAngularWidth:");
    p_leftLabel = &self->_rightLabel;
  }
  else
  {
    double v7 = [(CLKUICurvedColoringLabel *)*p_leftLabel textProvider];

    if (!v7)
    {
      p_leftLabel = &self->_rightLabel;
      double v8 = [(CLKUICurvedColoringLabel *)self->_rightLabel textProvider];

      if (!v8) {
        return;
      }
    }
  }
  CLKDegreesToRadians();
  double v9 = *p_leftLabel;
  -[CLKUICurvedColoringLabel setMaxAngularWidth:](v9, "setMaxAngularWidth:");
}

- (void)_enumerateLabelsWithBlock:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CDRichComplicationCornerBaseGaugeView;
  uint64_t v4 = (void (**)(id, CLKUICurvedColoringLabel *))a3;
  [(CDRichComplicationView *)&v5 _enumerateLabelsWithBlock:v4];
  v4[2](v4, self->_leftLabel);
  v4[2](v4, self->_rightLabel);
}

- (void)_editingDidEnd
{
  [(CLKUICurvedColoringLabel *)self->_leftLabel editingDidEnd];
  rightLabel = self->_rightLabel;
  [(CLKUICurvedColoringLabel *)rightLabel editingDidEnd];
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  -[CLKUICurvedColoringLabel transitionToMonochromeWithFraction:style:](self->_leftLabel, "transitionToMonochromeWithFraction:style:", 2);
  [(CLKUICurvedColoringLabel *)self->_rightLabel transitionToMonochromeWithFraction:2 style:a3];
  progressView = self->_progressView;
  [(CDRichComplicationProgressView *)progressView transitionToMonochromeWithFraction:a3];
}

- (void)updateMonochromeColor
{
  [(CLKUICurvedColoringLabel *)self->_leftLabel updateMonochromeColorWithStyle:2];
  [(CLKUICurvedColoringLabel *)self->_rightLabel updateMonochromeColorWithStyle:2];
  progressView = self->_progressView;
  [(CDRichComplicationProgressView *)progressView updateMonochromeColor];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightLabel, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_leftLabel, 0);
}

@end