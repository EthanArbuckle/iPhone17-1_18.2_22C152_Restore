@interface CLKUIColoringLabel
+ (id)labelWithOptions:(unint64_t)a3;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)cachedOpticalEdgeInsetsIsValid;
- (BOOL)cachedSizeIsValid;
- (BOOL)inTimeTravel;
- (BOOL)isTextTruncated;
- (BOOL)textDefinesTruncation;
- (BOOL)uppercase;
- (BOOL)usesTextProviderSize;
- (BOOL)usesTextProviderTintColoring;
- (CGSize)cachedSingleLineSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CLKFont)font;
- (CLKFont)monospacedDigitsFont;
- (CLKFont)smallCapsBaseFont;
- (CLKMonochromeFilterProvider)filterProvider;
- (CLKTextProvider)textProvider;
- (CLKUIColoringLabel)initWithFrame:(CGRect)a3;
- (CLKUIColoringLabel)initWithFrame:(CGRect)a3 options:(unint64_t)a4;
- (NSParagraphStyle)paragraphStyle;
- (UIColor)overrideColor;
- (UIEdgeInsets)cachedOpticalEdgeInsets;
- (UIEdgeInsets)opticalInsets;
- (double)_firstLineBaseline;
- (double)_lastLineBaseline;
- (double)maxWidth;
- (double)minimumWidth;
- (double)minimumWithFont:(id)a3;
- (double)minimumWithFont:(id)a3 smallCapsBaseFont:(id)a4;
- (double)tracking;
- (double)widthForMaxWidth:(double)a3;
- (double)widthForMaxWidth:(double)a3 withFont:(id)a4;
- (double)widthForMaxWidth:(double)a3 withFont:(id)a4 smallCapsBaseFont:(id)a5;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)needsResizeHandler;
- (id)nowProvider;
- (int64_t)twoToneStyleInMonochrome;
- (unint64_t)options;
- (void)_requeryTextProviderAndNotify:(BOOL)a3;
- (void)_setUpSnapshot;
- (void)_transitionTwoToneLabelToMonochromeWithFraction:(double)a3;
- (void)_updateDynamicTracking;
- (void)_updateTwoToneLabelMonochromeColor;
- (void)editingDidEnd;
- (void)invalidateCachedSize;
- (void)setAttributedText:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCachedOpticalEdgeInsetsIsValid:(BOOL)a3;
- (void)setCachedSingleLineSize:(CGSize)a3;
- (void)setCachedSizeIsValid:(BOOL)a3;
- (void)setFilterProvider:(id)a3;
- (void)setFont:(id)a3;
- (void)setFontWithoutMonospacedNumbers:(id)a3;
- (void)setInTimeTravel:(BOOL)a3;
- (void)setMaxWidth:(double)a3;
- (void)setMonospacedDigitsFont:(id)a3;
- (void)setNeedsResizeHandler:(id)a3;
- (void)setNowProvider:(id)a3;
- (void)setNumberOfLines:(int64_t)a3;
- (void)setOverrideColor:(id)a3;
- (void)setParagraphStyle:(id)a3;
- (void)setShadowOffset:(CGSize)a3;
- (void)setSmallCapsBaseFont:(id)a3;
- (void)setText:(id)a3;
- (void)setTextProvider:(id)a3;
- (void)setTracking:(double)a3;
- (void)setTwoToneStyleInMonochrome:(int64_t)a3;
- (void)setUppercase:(BOOL)a3;
- (void)setUsesTextProviderSize:(BOOL)a3;
- (void)setUsesTextProviderTintColoring:(BOOL)a3;
- (void)sizeToFit;
- (void)traitCollectionDidChange:(id)a3;
- (void)transitionToMonochromeWithFraction:(double)a3 style:(int64_t)a4;
- (void)updateMonochromeColorWithStyle:(int64_t)a3;
@end

@implementation CLKUIColoringLabel

+ (id)labelWithOptions:(unint64_t)a3
{
  id v4 = objc_alloc((Class)a1);
  v5 = objc_msgSend(v4, "initWithFrame:options:", a3, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  return v5;
}

- (CLKUIColoringLabel)initWithFrame:(CGRect)a3
{
  return -[CLKUIColoringLabel initWithFrame:options:](self, "initWithFrame:options:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CLKUIColoringLabel)initWithFrame:(CGRect)a3 options:(unint64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)CLKUIColoringLabel;
  v5 = -[CLKUILegibilityLabel initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
    uint64_t v7 = [v6 device];
    device = v5->_device;
    v5->_device = (CLKDevice *)v7;

    v5->_usesTextProviderSize = 1;
    v5->_options = a4;
    v9 = [MEMORY[0x1E4FB1618] clearColor];
    [(CLKUIColoringLabel *)v5 setBackgroundColor:v9];

    v5->_maxWidth = 1.79769313e308;
    v5->_uppercase = 0;
    v5->_textSetExternally = 0;
    [(CLKUIColoringLabel *)v5 _updateDynamicTracking];
  }
  return v5;
}

- (double)_lastLineBaseline
{
  v3.receiver = self;
  v3.super_class = (Class)CLKUIColoringLabel;
  [(CLKUIColoringLabel *)&v3 _lastLineBaseline];
  return result;
}

- (double)_firstLineBaseline
{
  v3.receiver = self;
  v3.super_class = (Class)CLKUIColoringLabel;
  [(CLKUIColoringLabel *)&v3 _firstLineBaseline];
  return result;
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4FB1618], "clearColor", a3);
  v5.receiver = self;
  v5.super_class = (Class)CLKUIColoringLabel;
  [(CLKUIColoringLabel *)&v5 setBackgroundColor:v4];
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CLKUIColoringLabel;
  BOOL v5 = [(CLKUIColoringLabel *)&v7 _shouldAnimatePropertyWithKey:v4]
    || [(_CLKUIColorManager *)self->_colorManager shouldAnimatePropertyWithKey:v4];

  return v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_colorManager;
}

- (UIColor)overrideColor
{
  overrideColor = self->_overrideColor;
  if (overrideColor)
  {
    objc_super v3 = overrideColor;
  }
  else
  {
    objc_super v3 = [(CLKTextProvider *)self->_textProvider tintColor];
  }
  return v3;
}

- (void)sizeToFit
{
  [(CLKUIColoringLabel *)self transform];
  if (CGAffineTransformIsIdentity(&v7))
  {
    [(CLKUIColoringLabel *)self frame];
    -[CLKUIColoringLabel sizeThatFits:](self, "sizeThatFits:", v3, v4);
    CLKPixelAlignRectForDevice();
    -[CLKUIColoringLabel setFrame:](self, "setFrame:");
  }
  else
  {
    [(CLKUIColoringLabel *)self bounds];
    -[CLKUIColoringLabel sizeThatFits:](self, "sizeThatFits:", v5, v6);
    CLKPixelAlignRectForDevice();
    -[CLKUIColoringLabel setBounds:](self, "setBounds:");
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(CLKUIColoringLabel *)self bounds];
  CGRectGetWidth(v9);
  v10.origin.double x = x;
  v10.origin.double y = y;
  v10.size.double width = width;
  v10.size.double height = height;
  CGRectGetWidth(v10);
  v8.receiver = self;
  v8.super_class = (Class)CLKUIColoringLabel;
  -[CLKUIColoringLabel setBounds:](&v8, sel_setBounds_, x, y, width, height);
  if ((self->_options & 4) != 0 && (CLKFloatEqualsFloat() & 1) == 0) {
    [(CLKUIColoringLabel *)self _requeryTextProviderAndNotify:1];
  }
}

- (void)setInTimeTravel:(BOOL)a3
{
  if (self->_inTimeTravel != a3)
  {
    self->_inTimeTravel = a3;
    self->_updatedAfterTimeTravelStateChange = 0;
  }
}

- (void)setTextProvider:(id)a3
{
  double v5 = (CLKTextProvider *)a3;
  if (v5) {
    self->_textSetExternalldouble y = 0;
  }
  textProvider = self->_textProvider;
  if (textProvider == v5)
  {
    if (self->_inTimeTravel && [(CLKTextProvider *)v5 timeTravelUpdateFrequency] == 2
      || !self->_updatedAfterTimeTravelStateChange
      && [(CLKTextProvider *)v5 timeTravelUpdateFrequency])
    {
      [(CLKUIColoringLabel *)self _requeryTextProviderAndNotify:0];
    }
  }
  else
  {
    [(CLKTextProvider *)textProvider stopUpdatesForToken:self->_updateToken];
    updateToken = self->_updateToken;
    self->_updateToken = 0;

    objc_storeStrong((id *)&self->_textProvider, a3);
    objc_initWeak(&location, self);
    BOOL v8 = [(CLKTextProvider *)v5 timeTravelUpdateFrequency] == 0;
    CGRect v9 = self->_textProvider;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __38__CLKUIColoringLabel_setTextProvider___block_invoke;
    v12[3] = &unk_1E697BD90;
    objc_copyWeak(&v13, &location);
    BOOL v14 = v8;
    CGRect v10 = [(CLKTextProvider *)v9 startUpdatesWithHandler:v12];
    objc_super v11 = self->_updateToken;
    self->_updateToken = v10;

    [(CLKUIColoringLabel *)self _requeryTextProviderAndNotify:0];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __38__CLKUIColoringLabel_setTextProvider___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (![WeakRetained inTimeTravel] || !*(unsigned char *)(a1 + 40))
  {
    id v3 = objc_loadWeakRetained(v2);
    [v3 _requeryTextProviderAndNotify:1];
  }
}

- (void)setUppercase:(BOOL)a3
{
  if (self->_uppercase != a3)
  {
    self->_uppercase = a3;
    [(CLKUIColoringLabel *)self _requeryTextProviderAndNotify:0];
  }
}

- (void)setMaxWidth:(double)a3
{
  if (self->_maxWidth != a3)
  {
    self->_maxWidth = a3;
    [(CLKUIColoringLabel *)self _requeryTextProviderAndNotify:0];
  }
}

- (void)setUsesTextProviderTintColoring:(BOOL)a3
{
  if (self->_usesTextProviderTintColoring != a3)
  {
    self->_usesTextProviderTintColoring = a3;
    [(CLKUIColoringLabel *)self _requeryTextProviderAndNotify:0];
  }
}

- (void)setParagraphStyle:(id)a3
{
  id v6 = a3;
  if (([v6 isEqual:self->_paragraphStyle] & 1) == 0)
  {
    double v4 = (NSParagraphStyle *)[v6 copy];
    paragraphStyle = self->_paragraphStyle;
    self->_paragraphStyle = v4;

    [(CLKUIColoringLabel *)self _requeryTextProviderAndNotify:0];
  }
}

- (void)setTracking:(double)a3
{
  if (self->_tracking != a3)
  {
    self->_tracking = a3;
    [(CLKUIColoringLabel *)self _requeryTextProviderAndNotify:0];
  }
}

- (void)setNumberOfLines:(int64_t)a3
{
  uint64_t v5 = [(CLKUIColoringLabel *)self numberOfLines];
  v6.receiver = self;
  v6.super_class = (Class)CLKUIColoringLabel;
  [(CLKUIColoringLabel *)&v6 setNumberOfLines:a3];
  if (v5 != a3)
  {
    [(CLKUIColoringLabel *)self _updateDynamicTracking];
    [(CLKUIColoringLabel *)self _requeryTextProviderAndNotify:0];
    [(CLKUIColoringLabel *)self invalidateIntrinsicContentSize];
  }
}

- (void)_requeryTextProviderAndNotify:(BOOL)a3
{
  BOOL v3 = a3;
  v47[1] = *MEMORY[0x1E4F143B8];
  CGSize v45 = (CGSize)*MEMORY[0x1E4F1DB30];
  if (self->_textProvider)
  {
    nowProvider = (void (**)(id, SEL))self->_nowProvider;
    BOOL v39 = a3;
    if (nowProvider) {
      nowProvider[2](nowProvider, a2);
    }
    else {
    BOOL v8 = [MEMORY[0x1E4F1C9C8] date];
    }
    uint64_t v9 = [(CLKUIColoringLabel *)self font];
    CGRect v10 = (void *)v9;
    smallCapsBaseFont = self->_smallCapsBaseFont;
    if (!smallCapsBaseFont) {
      smallCapsBaseFont = (CLKFont *)v9;
    }
    v12 = smallCapsBaseFont;
    unint64_t options = self->_options;
    CLKKernValueForDesignSpecTrackingValue();
    v40 = objc_msgSend(MEMORY[0x1E4F19AC8], "otherAttributesWithParagraphStyle:kerning:", self->_paragraphStyle);
    BOOL v14 = (void *)MEMORY[0x1E4F19AC8];
    BOOL uppercase = self->_uppercase;
    double v16 = 0.0;
    if ((options & 2) != 0) {
      [(CLKUIColoringLabel *)self minimumScaleFactor];
    }
    v17 = [v14 styleWithFont:v10 smallCapsBaseFont:v12 uppercase:uppercase otherAttributes:v40 minimumScaleFactor:self->_usesTextProviderTintColoring shouldEmbedTintColor:v16];
    v18 = [(CLKUIColoringLabel *)self monospacedDigitsFont];
    [v17 setMonospacedDigitsFont:v18];

    if ((self->_options & 4) != 0)
    {
      [(CLKUIColoringLabel *)self bounds];
      double Width = CGRectGetWidth(v48);
    }
    else
    {
      double Width = self->_maxWidth;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = [(CLKTextProvider *)self->_textProvider textProviders];
    }
    else
    {
      v47[0] = self->_textProvider;
      v20 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v47, 1, v12);
    }
    v38 = v10;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v21 = v20;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      CGAffineTransform v7 = 0;
      uint64_t v24 = *(void *)v42;
      do
      {
        uint64_t v25 = 0;
        v26 = v7;
        do
        {
          if (*(void *)v42 != v24) {
            objc_enumerationMutation(v21);
          }
          v27 = *(void **)(*((void *)&v41 + 1) + 8 * v25);
          uint64_t v28 = [(CLKUIColoringLabel *)self numberOfLines];
          double v29 = 1.79769313e308;
          if (v28 == 1) {
            double v29 = Width;
          }
          CGAffineTransform v7 = [v27 attributedTextAndSize:&v45 forMaxWidth:v17 withStyle:v8 now:v29];

          if ([(CLKUIColoringLabel *)self twoToneStyleInMonochrome])
          {
            v30 = (NSAttributedString *)[v7 copy];
            originalString = self->_originalString;
            self->_originalString = v30;

            if (fabs(self->_previousFraction + -1.0) >= 0.00000011920929) {
              [(CLKUIColoringLabel *)self _transitionTwoToneLabelToMonochromeWithFraction:0.0];
            }
            else {
              [(CLKUIColoringLabel *)self _updateTwoToneLabelMonochromeColor];
            }
          }
          else
          {
            [(CLKUIColoringLabel *)self setAttributedText:v7];
          }
          if ([(CLKUIColoringLabel *)self textDefinesTruncation])
          {
            if (![(CLKUIColoringLabel *)self isTextTruncated]) {
              goto LABEL_37;
            }
          }
          else if (v45.width <= Width)
          {
            goto LABEL_37;
          }
          ++v25;
          v26 = v7;
        }
        while (v23 != v25);
        uint64_t v23 = [v21 countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v23);
    }
    else
    {
      CGAffineTransform v7 = 0;
    }
LABEL_37:

    BOOL v3 = v39;
  }
  else
  {
    if (self->_textSetExternally) {
      return;
    }
    objc_super v6 = self->_originalString;
    self->_originalString = 0;

    [(CLKUIColoringLabel *)self setAttributedText:0];
    CGAffineTransform v7 = 0;
  }
  BOOL usesTextProviderSize = self->_usesTextProviderSize;
  if (usesTextProviderSize)
  {
    v33 = [v7 string];
    v34 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
    uint64_t v35 = [v33 rangeOfCharacterFromSet:v34];

    if (v35 == 0x7FFFFFFFFFFFFFFFLL)
    {
      self->_cachedSingleLineSize = v45;
      BOOL usesTextProviderSize = 1;
    }
    else
    {
      BOOL usesTextProviderSize = 0;
    }
  }
  self->_cachedSizeIsValid = usesTextProviderSize;
  self->_cachedOpticalEdgeInsetsIsValid = 0;
  if (v3)
  {
    needsResizeHandler = (void (**)(void))self->_needsResizeHandler;
    if (needsResizeHandler) {
      needsResizeHandler[2]();
    }
  }
  self->_updatedAfterTimeTravelStateChange = 1;
}

- (double)widthForMaxWidth:(double)a3
{
  uint64_t v5 = [(CLKUIColoringLabel *)self font];
  [(CLKUIColoringLabel *)self widthForMaxWidth:v5 withFont:a3];
  double v7 = v6;

  return v7;
}

- (double)widthForMaxWidth:(double)a3 withFont:(id)a4
{
  if (self->_smallCapsBaseFont) {
    smallCapsBaseFont = self->_smallCapsBaseFont;
  }
  else {
    smallCapsBaseFont = a4;
  }
  [(CLKUIColoringLabel *)self widthForMaxWidth:a4 withFont:smallCapsBaseFont smallCapsBaseFont:a3];
  return result;
}

- (double)widthForMaxWidth:(double)a3 withFont:(id)a4 smallCapsBaseFont:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  nowProvider = (void (**)(void))self->_nowProvider;
  if (nowProvider) {
    nowProvider[2]();
  }
  else {
  objc_super v11 = [MEMORY[0x1E4F1C9C8] date];
  }
  double v18 = 0.0;
  uint64_t v19 = 0;
  if (self->_textProvider && [(CLKUIColoringLabel *)self numberOfLines] == 1)
  {
    CLKKernValueForDesignSpecTrackingValue();
    v12 = objc_msgSend(MEMORY[0x1E4F19AC8], "otherAttributesWithParagraphStyle:kerning:", self->_paragraphStyle);
    id v13 = [MEMORY[0x1E4F19AC8] styleWithFont:v8 smallCapsBaseFont:v9 uppercase:self->_uppercase otherAttributes:v12 minimumScaleFactor:self->_usesTextProviderTintColoring shouldEmbedTintColor:0.0];
    id v14 = (id)[(CLKTextProvider *)self->_textProvider attributedTextAndSize:&v18 forMaxWidth:v13 withStyle:v11 now:a3];

    double v15 = v18;
  }
  else
  {
    -[CLKUIColoringLabel sizeThatFits:](self, "sizeThatFits:", a3, 1.79769313e308, *(void *)&v18, v19);
    double v15 = v16;
  }

  return v15;
}

- (double)minimumWidth
{
  BOOL v3 = [(CLKUIColoringLabel *)self font];
  [(CLKUIColoringLabel *)self minimumWithFont:v3];
  double v5 = v4;

  return v5;
}

- (double)minimumWithFont:(id)a3
{
  if (self->_smallCapsBaseFont) {
    smallCapsBaseFont = self->_smallCapsBaseFont;
  }
  else {
    smallCapsBaseFont = a3;
  }
  [(CLKUIColoringLabel *)self minimumWithFont:a3 smallCapsBaseFont:smallCapsBaseFont];
  return result;
}

- (double)minimumWithFont:(id)a3 smallCapsBaseFont:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  nowProvider = (void (**)(void))self->_nowProvider;
  if (nowProvider) {
    nowProvider[2]();
  }
  else {
  id v9 = [MEMORY[0x1E4F1C9C8] date];
  }
  if (self->_textProvider && [(CLKUIColoringLabel *)self numberOfLines] == 1)
  {
    CLKKernValueForDesignSpecTrackingValue();
    CGRect v10 = objc_msgSend(MEMORY[0x1E4F19AC8], "otherAttributesWithParagraphStyle:kerning:", self->_paragraphStyle);
    objc_super v11 = [MEMORY[0x1E4F19AC8] styleWithFont:v6 smallCapsBaseFont:v7 uppercase:self->_uppercase otherAttributes:v10 minimumScaleFactor:self->_usesTextProviderTintColoring shouldEmbedTintColor:0.0];
    [(CLKTextProvider *)self->_textProvider minimumSizeWithStyle:v11 now:v9];
    double v13 = v12;
  }
  else
  {
    -[CLKUIColoringLabel sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    double v13 = v14;
  }

  return v13;
}

- (UIEdgeInsets)opticalInsets
{
  if ([(CLKUIColoringLabel *)self numberOfLines] == 1
    && self->_cachedSizeIsValid
    && self->_cachedOpticalEdgeInsetsIsValid)
  {
    CGFloat top = self->_cachedOpticalEdgeInsets.top;
    double left = self->_cachedOpticalEdgeInsets.left;
    CGFloat bottom = self->_cachedOpticalEdgeInsets.bottom;
    double right = self->_cachedOpticalEdgeInsets.right;
  }
  else
  {
    id v7 = [(CLKUIColoringLabel *)self _stringDrawingContext];
    id v8 = [(CLKUIColoringLabel *)self attributedText];
    [(CLKUIColoringLabel *)self bounds];
    objc_msgSend(v8, "boundingRectWithSize:options:context:", 9, v7, v9, v10);
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;

    CGFloat top = *MEMORY[0x1E4FB2848];
    CGFloat bottom = *(double *)(MEMORY[0x1E4FB2848] + 16);
    CLKFloorForDevice();
    double left = v19;
    [(CLKUIColoringLabel *)self bounds];
    double Width = CGRectGetWidth(v26);
    v27.origin.double x = v12;
    v27.origin.double y = v14;
    v27.size.double width = v16;
    v27.size.double height = v18;
    CGRectGetWidth(v27);
    CLKCeilForDevice();
    double right = Width - v21 - left;
    if ([(CLKUIColoringLabel *)self numberOfLines] == 1)
    {
      self->_cachedOpticalEdgeInsets.CGFloat top = top;
      self->_cachedOpticalEdgeInsets.double left = left;
      self->_cachedOpticalEdgeInsets.CGFloat bottom = bottom;
      self->_cachedOpticalEdgeInsets.double right = right;
      self->_cachedOpticalEdgeInsetsIsValid = 1;
    }
  }
  double v22 = top;
  double v23 = left;
  double v24 = bottom;
  double v25 = right;
  result.double right = v25;
  result.CGFloat bottom = v24;
  result.double left = v23;
  result.CGFloat top = v22;
  return result;
}

- (void)invalidateCachedSize
{
  self->_cachedSizeIsValid = 0;
  self->_cachedOpticalEdgeInsetsIsValid = 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(CLKUIColoringLabel *)self numberOfLines] == 1)
  {
    p_cachedSingleLineSize = &self->_cachedSingleLineSize;
    if (self->_cachedSizeIsValid)
    {
      double v7 = p_cachedSingleLineSize->width;
      double v8 = self->_cachedSingleLineSize.height;
    }
    else
    {
      v10.receiver = self;
      v10.super_class = (Class)CLKUIColoringLabel;
      -[CLKUIColoringLabel sizeThatFits:](&v10, sel_sizeThatFits_, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
      p_cachedSingleLineSize->double width = v7;
      self->_cachedSingleLineSize.double height = v8;
      self->_cachedSizeIsValid = 1;
      self->_cachedOpticalEdgeInsetsIsValid = 0;
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CLKUIColoringLabel;
    -[CLKUIColoringLabel sizeThatFits:](&v9, sel_sizeThatFits_, width, height);
  }
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (CLKFont)font
{
  font = self->_font;
  if (font)
  {
    BOOL v3 = font;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CLKUIColoringLabel;
    BOOL v3 = [(CLKUIColoringLabel *)&v5 font];
  }
  return v3;
}

- (void)setFont:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_font] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_font, a3);
    v7.receiver = self;
    v7.super_class = (Class)CLKUIColoringLabel;
    [(CLKUIColoringLabel *)&v7 setFont:v5];
    id v6 = [(CLKFont *)self->_font CLKFontWithMonospacedNumbers];
    [(CLKUIColoringLabel *)self setMonospacedDigitsFont:v6];

    [(CLKUIColoringLabel *)self invalidateCachedSize];
    [(CLKUIColoringLabel *)self _requeryTextProviderAndNotify:0];
  }
}

- (void)setFontWithoutMonospacedNumbers:(id)a3
{
  id v5 = a3;
  if (![v5 isEqual:self->_font]
    || ([(CLKUIColoringLabel *)self monospacedDigitsFont],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    objc_storeStrong((id *)&self->_font, a3);
    v7.receiver = self;
    v7.super_class = (Class)CLKUIColoringLabel;
    [(CLKUIColoringLabel *)&v7 setFont:v5];
    [(CLKUIColoringLabel *)self setMonospacedDigitsFont:0];
    [(CLKUIColoringLabel *)self invalidateCachedSize];
    [(CLKUIColoringLabel *)self _requeryTextProviderAndNotify:0];
  }
}

- (void)setSmallCapsBaseFont:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_smallCapsBaseFont] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_smallCapsBaseFont, a3);
    [(CLKUIColoringLabel *)self invalidateCachedSize];
    [(CLKUIColoringLabel *)self _requeryTextProviderAndNotify:0];
  }
}

- (void)setText:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self->_textProvider) {
      goto LABEL_6;
    }
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
  }
  self->_textSetExternalldouble y = v5;
LABEL_6:
  id v6 = [(CLKUIColoringLabel *)self text];
  char v7 = [v4 isEqualToString:v6];

  if ((v7 & 1) == 0) {
    [(CLKUIColoringLabel *)self invalidateCachedSize];
  }
  v8.receiver = self;
  v8.super_class = (Class)CLKUIColoringLabel;
  [(CLKUIColoringLabel *)&v8 setText:v4];
}

- (void)setAttributedText:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self->_textProvider) {
      goto LABEL_6;
    }
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
  }
  self->_textSetExternalldouble y = v5;
LABEL_6:
  id v6 = [(CLKUIColoringLabel *)self attributedText];
  char v7 = [v4 isEqualToAttributedString:v6];

  if ((v7 & 1) == 0) {
    [(CLKUIColoringLabel *)self invalidateCachedSize];
  }
  v8.receiver = self;
  v8.super_class = (Class)CLKUIColoringLabel;
  [(CLKUIColoringLabel *)&v8 setAttributedText:v4];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CLKUIColoringLabel;
  [(CLKUIColoringLabel *)&v4 traitCollectionDidChange:a3];
  [(CLKUIColoringLabel *)self invalidateCachedSize];
}

- (void)setShadowOffset:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(CLKUIColoringLabel *)self shadowOffset];
  if (width != v7 || height != v6) {
    [(CLKUIColoringLabel *)self invalidateCachedSize];
  }
  v9.receiver = self;
  v9.super_class = (Class)CLKUIColoringLabel;
  -[CLKUIColoringLabel setShadowOffset:](&v9, sel_setShadowOffset_, width, height);
}

- (void)_updateDynamicTracking
{
  BOOL v3 = [(CLKUIColoringLabel *)self numberOfLines] == 1 && (self->_options & 1) == 0;
  [(CLKUIColoringLabel *)self setAllowsDefaultTighteningForTruncation:v3];
}

- (void)transitionToMonochromeWithFraction:(double)a3 style:(int64_t)a4
{
  if ([(CLKUIColoringLabel *)self twoToneStyleInMonochrome])
  {
    [(CLKUIColoringLabel *)self _transitionTwoToneLabelToMonochromeWithFraction:a3];
  }
  else
  {
    double v7 = [(CLKUIColoringLabel *)self text];
    int v8 = [v7 _containsEmoji];

    if (v8)
    {
      if (fabs(a3) < 0.00000011920929)
      {
        [(CLKUIColoringLabel *)self setUsesTextProviderTintColoring:1];
        [(CLKUIColoringLabel *)self _setAnimationAlpha:1.0];
        [(UIView *)self->_snapshot setAlpha:0.0];
      }
      a4 = CLKUIAssociatedDesaturatedType(a4);
    }
    objc_super v9 = [(CLKUIColoringLabel *)self filterProvider];
    objc_super v10 = [v9 filtersForView:self style:a4 fraction:a3];

    if (v10)
    {
      double v11 = [(CLKUIColoringLabel *)self layer];
      [v11 setFilters:v10];
    }
  }
  self->_previousFraction = a3;
}

- (void)_transitionTwoToneLabelToMonochromeWithFraction:(double)a3
{
  BOOL v5 = [(CLKUIColoringLabel *)self layer];
  [v5 setFilters:MEMORY[0x1E4F1CBF0]];

  if (fabs(a3) >= 0.00000011920929)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);
    int v8 = [WeakRetained colorForView:self accented:1];
    objc_super v9 = [WeakRetained colorForView:self accented:0];
    objc_super v10 = (void *)[(NSAttributedString *)self->_originalString mutableCopy];
    if (v8) {
      BOOL v11 = v9 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (!v11)
    {
      originalString = self->_originalString;
      uint64_t v13 = *MEMORY[0x1E4FB12B8];
      uint64_t v14 = [(NSAttributedString *)originalString length];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __70__CLKUIColoringLabel__transitionTwoToneLabelToMonochromeWithFraction___block_invoke;
      v16[3] = &unk_1E697BDB8;
      v16[4] = self;
      id v17 = v8;
      double v20 = a3;
      id v18 = v10;
      id v19 = v9;
      -[NSAttributedString enumerateAttribute:inRange:options:usingBlock:](originalString, "enumerateAttribute:inRange:options:usingBlock:", v13, 0, v14, 0, v16);
    }
    double v15 = (void *)[v10 copy];
    [(CLKUIColoringLabel *)self setAttributedText:v15];
  }
  else
  {
    double v6 = self->_originalString;
    [(CLKUIColoringLabel *)self setAttributedText:v6];
  }
}

void __70__CLKUIColoringLabel__transitionTwoToneLabelToMonochromeWithFraction___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v16 = v7;
  if (!v7)
  {
    id v7 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  if ([*(id *)(a1 + 32) twoToneStyleInMonochrome] != 1)
  {
    if ([*(id *)(a1 + 32) twoToneStyleInMonochrome] != 2) {
      goto LABEL_10;
    }
    CGFloat v12 = [MEMORY[0x1E4FB1618] whiteColor];
    char v13 = [v7 _isSimilarToColor:v12 withinPercentage:0.001];

    double v10 = *(double *)(a1 + 64);
    if ((v13 & 1) == 0) {
      goto LABEL_5;
    }
LABEL_8:
    BOOL v11 = (void **)(a1 + 40);
    goto LABEL_9;
  }
  int v8 = [MEMORY[0x1E4FB1618] whiteColor];
  char v9 = [v7 _isSimilarToColor:v8 withinPercentage:0.001];

  double v10 = *(double *)(a1 + 64);
  if ((v9 & 1) == 0) {
    goto LABEL_8;
  }
LABEL_5:
  BOOL v11 = (void **)(a1 + 56);
LABEL_9:
  float v14 = v10;
  double v15 = CLKUIInterpolateBetweenColors(v7, *v11, v14);
  objc_msgSend(*(id *)(a1 + 48), "addAttribute:value:range:", *MEMORY[0x1E4FB12B8], v15, a3, a4);

LABEL_10:
}

- (void)updateMonochromeColorWithStyle:(int64_t)a3
{
  if ([(CLKUIColoringLabel *)self twoToneStyleInMonochrome])
  {
    [(CLKUIColoringLabel *)self _updateTwoToneLabelMonochromeColor];
  }
  else
  {
    BOOL v5 = [(CLKUIColoringLabel *)self text];
    int v6 = [v5 _containsEmoji];

    if (v6)
    {
      [(CLKUIColoringLabel *)self setUsesTextProviderTintColoring:0];
      [(CLKUIColoringLabel *)self _setAnimationAlpha:1.0];
      [(UIView *)self->_snapshot setAlpha:0.0];
      a3 = CLKUIAssociatedDesaturatedType(a3);
    }
    id v7 = [(CLKUIColoringLabel *)self filterProvider];
    int v8 = [v7 filtersForView:self style:a3];

    if (v8)
    {
      char v9 = [(CLKUIColoringLabel *)self layer];
      [v9 setFilters:v8];
    }
  }
  self->_previousFraction = 1.0;
}

- (void)_updateTwoToneLabelMonochromeColor
{
  BOOL v3 = [(CLKUIColoringLabel *)self layer];
  [v3 setFilters:MEMORY[0x1E4F1CBF0]];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);
  BOOL v5 = [WeakRetained interpolatedColorForView:self];

  id v6 = objc_loadWeakRetained((id *)&self->_filterProvider);
  id v7 = [v6 colorForView:self accented:0];

  int v8 = (void *)[(NSAttributedString *)self->_originalString mutableCopy];
  if (v5) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    originalString = self->_originalString;
    uint64_t v11 = *MEMORY[0x1E4FB12B8];
    uint64_t v12 = [(NSAttributedString *)originalString length];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __56__CLKUIColoringLabel__updateTwoToneLabelMonochromeColor__block_invoke;
    id v17 = &unk_1E697BDE0;
    id v18 = self;
    id v19 = v8;
    id v20 = v5;
    id v21 = v7;
    -[NSAttributedString enumerateAttribute:inRange:options:usingBlock:](originalString, "enumerateAttribute:inRange:options:usingBlock:", v11, 0, v12, 0, &v14);
  }
  char v13 = objc_msgSend(v8, "copy", v14, v15, v16, v17, v18);
  [(CLKUIColoringLabel *)self setAttributedText:v13];
}

void __56__CLKUIColoringLabel__updateTwoToneLabelMonochromeColor__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v15 = v7;
  if (!v7)
  {
    id v7 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  if ([*(id *)(a1 + 32) twoToneStyleInMonochrome] != 1)
  {
    if ([*(id *)(a1 + 32) twoToneStyleInMonochrome] != 2) {
      goto LABEL_10;
    }
    char v13 = [MEMORY[0x1E4FB1618] whiteColor];
    char v14 = [v7 _isSimilarToColor:v13 withinPercentage:0.001];

    double v10 = *(void **)(a1 + 40);
    uint64_t v11 = *MEMORY[0x1E4FB12B8];
    if ((v14 & 1) == 0) {
      goto LABEL_5;
    }
LABEL_8:
    uint64_t v12 = *(void *)(a1 + 48);
    goto LABEL_9;
  }
  int v8 = [MEMORY[0x1E4FB1618] whiteColor];
  char v9 = [v7 _isSimilarToColor:v8 withinPercentage:0.001];

  double v10 = *(void **)(a1 + 40);
  uint64_t v11 = *MEMORY[0x1E4FB12B8];
  if ((v9 & 1) == 0) {
    goto LABEL_8;
  }
LABEL_5:
  uint64_t v12 = *(void *)(a1 + 56);
LABEL_9:
  objc_msgSend(v10, "addAttribute:value:range:", v11, v12, a3, a4);
LABEL_10:
}

- (void)editingDidEnd
{
  [(CLKUIColoringLabel *)self _setAnimationAlpha:1.0];
  [(UIView *)self->_snapshot removeFromSuperview];
  snapshot = self->_snapshot;
  self->_snapshot = 0;
}

- (void)_setUpSnapshot
{
  BOOL v3 = [(CLKUIColoringLabel *)self snapshotViewAfterScreenUpdates:0];
  snapshot = self->_snapshot;
  self->_snapshot = v3;

  [(CLKUIColoringLabel *)self frame];
  BOOL v5 = self->_snapshot;
  -[UIView setFrame:](v5, "setFrame:");
}

- (BOOL)inTimeTravel
{
  return self->_inTimeTravel;
}

- (void)setOverrideColor:(id)a3
{
}

- (unint64_t)options
{
  return self->_options;
}

- (CLKFont)smallCapsBaseFont
{
  return self->_smallCapsBaseFont;
}

- (CLKTextProvider)textProvider
{
  return self->_textProvider;
}

- (CLKFont)monospacedDigitsFont
{
  return self->_monospacedDigitsFont;
}

- (void)setMonospacedDigitsFont:(id)a3
{
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (BOOL)uppercase
{
  return self->_uppercase;
}

- (BOOL)usesTextProviderTintColoring
{
  return self->_usesTextProviderTintColoring;
}

- (BOOL)textDefinesTruncation
{
  return self->_textDefinesTruncation;
}

- (BOOL)isTextTruncated
{
  return self->_isTextTruncated;
}

- (NSParagraphStyle)paragraphStyle
{
  return self->_paragraphStyle;
}

- (double)tracking
{
  return self->_tracking;
}

- (id)nowProvider
{
  return self->_nowProvider;
}

- (void)setNowProvider:(id)a3
{
}

- (id)needsResizeHandler
{
  return self->_needsResizeHandler;
}

- (void)setNeedsResizeHandler:(id)a3
{
}

- (int64_t)twoToneStyleInMonochrome
{
  return self->_twoToneStyleInMonochrome;
}

- (void)setTwoToneStyleInMonochrome:(int64_t)a3
{
  self->_twoToneStyleInMonochrome = a3;
}

- (CLKMonochromeFilterProvider)filterProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);
  return (CLKMonochromeFilterProvider *)WeakRetained;
}

- (void)setFilterProvider:(id)a3
{
}

- (CGSize)cachedSingleLineSize
{
  double width = self->_cachedSingleLineSize.width;
  double height = self->_cachedSingleLineSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCachedSingleLineSize:(CGSize)a3
{
  self->_cachedSingleLineSize = a3;
}

- (BOOL)cachedSizeIsValid
{
  return self->_cachedSizeIsValid;
}

- (void)setCachedSizeIsValid:(BOOL)a3
{
  self->_cachedSizeIsValid = a3;
}

- (UIEdgeInsets)cachedOpticalEdgeInsets
{
  double top = self->_cachedOpticalEdgeInsets.top;
  double left = self->_cachedOpticalEdgeInsets.left;
  double bottom = self->_cachedOpticalEdgeInsets.bottom;
  double right = self->_cachedOpticalEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)cachedOpticalEdgeInsetsIsValid
{
  return self->_cachedOpticalEdgeInsetsIsValid;
}

- (void)setCachedOpticalEdgeInsetsIsValid:(BOOL)a3
{
  self->_cachedOpticalEdgeInsetsIsValid = a3;
}

- (BOOL)usesTextProviderSize
{
  return self->_usesTextProviderSize;
}

- (void)setUsesTextProviderSize:(BOOL)a3
{
  self->_BOOL usesTextProviderSize = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_filterProvider);
  objc_storeStrong(&self->_needsResizeHandler, 0);
  objc_storeStrong(&self->_nowProvider, 0);
  objc_storeStrong((id *)&self->_paragraphStyle, 0);
  objc_storeStrong((id *)&self->_monospacedDigitsFont, 0);
  objc_storeStrong((id *)&self->_textProvider, 0);
  objc_storeStrong((id *)&self->_smallCapsBaseFont, 0);
  objc_storeStrong((id *)&self->_overrideColor, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_originalString, 0);
  objc_storeStrong((id *)&self->_preTimeTravelFont, 0);
  objc_storeStrong((id *)&self->_updateToken, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_colorManager, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end