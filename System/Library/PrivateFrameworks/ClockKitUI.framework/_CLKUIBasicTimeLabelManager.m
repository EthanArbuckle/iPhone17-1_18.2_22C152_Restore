@interface _CLKUIBasicTimeLabelManager
- (BOOL)animationsPaused;
- (BOOL)showSeconds;
- (BOOL)showsBlinker;
- (BOOL)showsNumbers;
- (CGRect)_boundingRectOfBlinkerAtRange:(_NSRange)a3;
- (CGRect)_boundingRectOfMinutesBlinker;
- (CGRect)_boundingRectOfSecondsBlinker;
- (CGSize)intrinsicSize;
- (CGSize)sizeThatFits;
- (UIColor)textColor;
- (UIEdgeInsets)opticalInsets;
- (UIView)view;
- (_CLKUIBasicTimeLabelManager)initWithForDevice:(id)a3 timeFormatter:(id)a4 options:(unint64_t)a5 timer:(id)a6 labelFactory:(id)a7;
- (double)_capOffsetFromBoundsTop;
- (double)_lastLineBaseline;
- (id)_attributedTextShowingBlinker:(BOOL)a3 numbers:(BOOL)a4;
- (id)_initForDevice:(id)a3 primary:(BOOL)a4 withTimeFormatter:(id)a5 options:(unint64_t)a6 labelFactory:(id)a7;
- (id)effectiveAttributedText;
- (id)effectiveFont;
- (id)minutesDesignatorAttributedText;
- (id)secondsDesignatorAttributedText;
- (id)viewForLastBaselineLayout;
- (void)_updateAttributedText;
- (void)enumerateUnderlyingLabelsWithBlock:(id)a3;
- (void)setAnimationsPaused:(BOOL)a3;
- (void)setMaxWidth:(double)a3;
- (void)setShowSeconds:(BOOL)a3;
- (void)setShowsBlinker:(BOOL)a3;
- (void)setShowsDesignator:(BOOL)a3;
- (void)setShowsNumbers:(BOOL)a3;
- (void)setStyle:(id)a3;
- (void)setTextColor:(id)a3;
- (void)sizeViewToFit;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateTimeText;
@end

@implementation _CLKUIBasicTimeLabelManager

- (void)updateTimeText
{
  if (self->_showsDesignator)
  {
    if (self->_showSubstringFromSeparator && self->_showSubstringToSeparator)
    {
      timeFormatter = self->_timeFormatter;
      if (self->_hideMinutesIfZero) {
        [(CLKTimeFormatter *)timeFormatter timeAndDesignatorTextWithoutMinutesIfZero];
      }
      else {
        [(CLKTimeFormatter *)timeFormatter timeAndDesignatorText];
      }
      v4 = LABEL_6:;
      goto LABEL_16;
    }
    v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3B8];
    v7 = @"Showing the designator and hiding a piece of the time is unsupported.";
    goto LABEL_8;
  }
  BOOL showSubstringFromSeparator = self->_showSubstringFromSeparator;
  if (self->_showSubstringToSeparator)
  {
    v9 = self->_timeFormatter;
    if (showSubstringFromSeparator) {
      [(CLKTimeFormatter *)v9 timeText];
    }
    else {
      [(CLKTimeFormatter *)v9 timeSubstringToSeparatorText];
    }
    goto LABEL_6;
  }
  if (!self->_showSubstringFromSeparator)
  {
    v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3B8];
    v7 = @"Hiding the text both before and after the separator is unsupported.";
LABEL_8:
    [v5 raise:v6 format:v7];
    v4 = 0;
    goto LABEL_16;
  }
  v4 = [(CLKTimeFormatter *)self->_timeFormatter timeSubstringFromSeparatorText];
LABEL_16:
  id obj = v4;
  if (([v4 isEqualToString:self->_timeText] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_timeText, obj);
    if (self->_showSubstringFromSeparator)
    {
      if (self->_showSubstringToSeparator)
      {
        v10 = self->_timeFormatter;
        if (self->_showsDesignator) {
          NSUInteger v11 = [(CLKTimeFormatter *)v10 blinkerRangeInTimeAndDesignatorText];
        }
        else {
          NSUInteger v11 = [(CLKTimeFormatter *)v10 blinkerRangeInTimeText];
        }
      }
      else
      {
        NSUInteger v11 = [(CLKTimeFormatter *)self->_timeFormatter blinkerRangeInTimeSubstringFromSeparatorText];
      }
    }
    else
    {
      NSUInteger v11 = [(CLKTimeFormatter *)self->_timeFormatter blinkerRangeInTimeSubstringToSeparatorText];
    }
    self->_minutesBlinkerRange.location = v11;
    self->_minutesBlinkerRange.length = v12;
    if (self->_showSeconds)
    {
      NSUInteger v13 = [(CLKTimeFormatter *)self->_timeFormatter lastBlinkerRangeInTimeText];
    }
    else
    {
      NSUInteger v13 = 0;
      NSUInteger v14 = 0;
    }
    self->_secondsBlinkerRange.location = v13;
    self->_secondsBlinkerRange.length = v14;
    [(_CLKUIBasicTimeLabelManager *)self _updateAttributedText];
  }
  MEMORY[0x1F41817F8]();
}

- (void)_updateAttributedText
{
  v3 = [(_CLKUIBasicTimeLabelManager *)self _attributedTextShowingBlinker:self->_showsBlinker numbers:self->_showsNumbers];
  correctAttributedText = self->_correctAttributedText;
  self->_correctAttributedText = v3;

  minutesBlinkerAttributedText = self->_minutesBlinkerAttributedText;
  self->_minutesBlinkerAttributedText = 0;

  secondsBlinkerAttributedText = self->_secondsBlinkerAttributedText;
  self->_secondsBlinkerAttributedText = 0;

  CGPoint v7 = (CGPoint)*MEMORY[0x1E4F1DB20];
  CGSize v8 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  self->_boundingRectOfMinutesBlinkerAttributedText.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  self->_boundingRectOfMinutesBlinkerAttributedText.size = v8;
  self->_boundingRectOfSecondsBlinkerAttributedText.origin = v7;
  self->_boundingRectOfSecondsBlinkerAttributedText.size = v8;
  [(UILabel *)self->_label setAttributedText:self->_correctAttributedText];
  v9 = (_OWORD *)MEMORY[0x1E4FB2848];
  self->_cachedIntrinsicSize = (CGSize)*MEMORY[0x1E4F1DB30];
  long long v10 = v9[1];
  *(_OWORD *)&self->_cachedOpticalEdgeInsets.top = *v9;
  *(_OWORD *)&self->_cachedOpticalEdgeInsets.bottom = v10;
  self->_cachedOpticalEdgeInsetsIsValid = 0;
}

- (id)_attributedTextShowingBlinker:(BOOL)a3 numbers:(BOOL)a4
{
  v52[1] = *MEMORY[0x1E4F143B8];
  if (self->_timeText)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F28E48]);
    timeText = self->_timeText;
    uint64_t v7 = *MEMORY[0x1E4FB12B0];
    uint64_t v51 = *MEMORY[0x1E4FB12B0];
    CGSize v8 = [(_CLKUIBasicTimeLabelManager *)self effectiveFont];
    v52[0] = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
    long long v10 = (void *)[v5 initWithString:timeText attributes:v9];

    NSUInteger v11 = [(CLKUITimeLabelStyle *)self->_style designatorFont];
    if (v11 && self->_showsDesignator)
    {
      timeFormatter = self->_timeFormatter;
      if (self->_hideMinutesIfZero) {
        uint64_t v13 = [(CLKTimeFormatter *)timeFormatter designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero];
      }
      else {
        uint64_t v13 = [(CLKTimeFormatter *)timeFormatter designatorRangeInTimeAndDesignatorText];
      }
      objc_msgSend(v10, "addAttribute:value:range:", v7, v11, v13, v14);
    }
    if (self->_showSubstringFromSeparator)
    {
      if (self->_showSubstringToSeparator)
      {
        v15 = self->_timeFormatter;
        if (self->_showsDesignator) {
          uint64_t v16 = [(CLKTimeFormatter *)v15 blinkerRangeInTimeAndDesignatorText];
        }
        else {
          uint64_t v16 = [(CLKTimeFormatter *)v15 blinkerRangeInTimeText];
        }
      }
      else
      {
        uint64_t v16 = [(CLKTimeFormatter *)self->_timeFormatter blinkerRangeInTimeSubstringFromSeparatorText];
      }
    }
    else
    {
      uint64_t v16 = [(CLKTimeFormatter *)self->_timeFormatter blinkerRangeInTimeSubstringToSeparatorText];
    }
    uint64_t v18 = v16;
    uint64_t v19 = v17;
    if (self->_showSeconds)
    {
      uint64_t v46 = v17;
      uint64_t v20 = v16;
      uint64_t v21 = [(CLKTimeFormatter *)self->_timeFormatter lastBlinkerRangeInTimeText];
      uint64_t v23 = v22;
      if (self->_showSeconds)
      {
        v45 = v11;
        uint64_t v24 = [(CLKTimeFormatter *)self->_timeFormatter rangeInTimeSubstringFromSecondsSeparatorText];
        uint64_t v26 = v25;
        if (v24 + v25 <= (unint64_t)[v10 length])
        {
          uint64_t v49 = v7;
          v27 = [(_CLKUIBasicTimeLabelManager *)self effectiveFont];
          v28 = [v27 CLKFontWithMonospacedNumbers];
          v50 = v28;
          v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
          objc_msgSend(v10, "addAttributes:range:", v29, v24, v26);
        }
        NSUInteger v11 = v45;
      }
      uint64_t v30 = v21;
      uint64_t v31 = v23;
      uint64_t v18 = v20;
      uint64_t v19 = v46;
    }
    else
    {
      uint64_t v30 = 0;
      uint64_t v31 = 0;
    }
    v32 = [MEMORY[0x1E4FB1618] clearColor];
    if (!a3)
    {
      if (v18 + v19 < (unint64_t)[v10 length]) {
        objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x1E4FB12B8], v32, v18, v19);
      }
      if (self->_showSeconds && v31 + v30 < (unint64_t)[v10 length]) {
        objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x1E4FB12B8], v32, v30, v31);
      }
    }
    if (!a4)
    {
      uint64_t v33 = [v10 length];
      uint64_t v34 = *MEMORY[0x1E4FB12B8];
      objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x1E4FB12B8], v32, 0, v33);
      if (v18 + v19 < (unint64_t)[v10 length]) {
        objc_msgSend(v10, "removeAttribute:range:", v34, v18, v19);
      }
      if (self->_showSeconds && v31 + v30 < (unint64_t)[v10 length]) {
        objc_msgSend(v10, "removeAttribute:range:", v34, v30, v31);
      }
    }
    if ([(CLKTimeFormatter *)self->_timeFormatter suppressesDesignatorWhitespace])
    {
      v35 = objc_opt_new();
      [v35 setCompositionLanguage:1];
      objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x1E4FB12D0], v35, 0, -[NSString length](self->_timeText, "length"));
    }
    v36 = [(CLKTimeFormatter *)self->_timeFormatter fontTrackingAttribute];

    if (v36)
    {
      uint64_t v37 = *MEMORY[0x1E4FB12E0];
      v38 = [(CLKTimeFormatter *)self->_timeFormatter fontTrackingAttribute];
      objc_msgSend(v10, "addAttribute:value:range:", v37, v38, 0, -[NSString length](self->_timeText, "length"));
    }
    if ([(CLKTimeFormatter *)self->_timeFormatter forcedNumberSystem] != -1)
    {
      [(CLKTimeFormatter *)self->_timeFormatter forcedNumberSystem];
      v39 = CLKLocaleRenderingHintLanguageIdentifierForNumberingSystem();
      uint64_t v40 = [v10 length];
      objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x1E4F284F8], v39, 0, v40);
    }
    v41 = [(CLKUITimeLabelStyle *)self->_style stringAttributes];

    if (v41)
    {
      uint64_t v42 = [v10 length];
      v43 = [(CLKUITimeLabelStyle *)self->_style stringAttributes];
      objc_msgSend(v10, "addAttributes:range:", v43, 0, v42);
    }
  }
  else
  {
    long long v10 = 0;
  }
  return v10;
}

- (id)effectiveFont
{
  return [(UILabel *)self->_label font];
}

- (CGSize)sizeThatFits
{
  [(_CLKUIBasicTimeLabelManager *)self intrinsicSize];
  double maxWidth = self->_maxWidth;
  double v6 = fabs(maxWidth);
  if (v3 <= maxWidth) {
    double maxWidth = v3;
  }
  if (v6 >= 0.00000011920929) {
    double v3 = maxWidth;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicSize
{
  if (CLKSizeIsEmpty())
  {
    -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    self->_cachedIntrinsicSize.double width = width;
    self->_cachedIntrinsicSize.double height = height;
  }
  else
  {
    double width = self->_cachedIntrinsicSize.width;
    double height = self->_cachedIntrinsicSize.height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIView)view
{
  return (UIView *)self->_label;
}

- (void)setAnimationsPaused:(BOOL)a3
{
  self->_animationsPaused = a3;
}

- (_CLKUIBasicTimeLabelManager)initWithForDevice:(id)a3 timeFormatter:(id)a4 options:(unint64_t)a5 timer:(id)a6 labelFactory:(id)a7
{
  return (_CLKUIBasicTimeLabelManager *)[(_CLKUIBasicTimeLabelManager *)self _initForDevice:a3 primary:1 withTimeFormatter:a4 options:a5 labelFactory:a7];
}

- (id)_initForDevice:(id)a3 primary:(BOOL)a4 withTimeFormatter:(id)a5 options:(unint64_t)a6 labelFactory:(id)a7
{
  __int16 v8 = a6;
  id v13 = a3;
  id v14 = a5;
  v15 = (void (**)(id, void))a7;
  v23.receiver = self;
  v23.super_class = (Class)_CLKUIBasicTimeLabelManager;
  uint64_t v16 = [(_CLKUIBasicTimeLabelManager *)&v23 init];
  uint64_t v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_device, a3);
    v17->_primary = a4;
    objc_storeStrong((id *)&v17->_timeFormatter, a5);
    v17->_hideMinutesIfZero = (v8 & 4) != 0;
    v17->_BOOL showSubstringFromSeparator = (v8 & 0x400) == 0;
    v17->_showSubstringToSeparator = (v8 & 0x800) == 0;
    v17->_showSeconds = 0;
    *(_WORD *)&v17->_showsBlinker = 257;
    CGPoint v18 = (CGPoint)*MEMORY[0x1E4F1DB20];
    CGSize v19 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v17->_boundingRectOfMinutesBlinkerAttributedText.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v17->_boundingRectOfMinutesBlinkerAttributedText.size = v19;
    v17->_boundingRectOfSecondsBlinkerAttributedText.origin = v18;
    v17->_boundingRectOfSecondsBlinkerAttributedText.size = v19;
    uint64_t v20 = ((void (**)(id, BOOL))v15)[2](v15, v17->_primary);
    label = v17->_label;
    v17->_label = (UILabel *)v20;

    [(UILabel *)v17->_label setTextAlignment:1];
  }

  return v17;
}

- (void)setStyle:(id)a3
{
  id v16 = a3;
  if (([v16 isEqual:self->_style] & 1) == 0)
  {
    double v4 = objc_alloc_init(CLKUITimeLabelStyle);
    style = self->_style;
    self->_style = v4;

    double v6 = [v16 threeDigitFont];
    uint64_t v7 = _FontWithCenteredColons(v6, [(CLKTimeFormatter *)self->_timeFormatter forcedNumberSystem]);
    [(CLKUITimeLabelStyle *)self->_style setThreeDigitFont:v7];

    __int16 v8 = [v16 fourDigitFont];
    v9 = _FontWithCenteredColons(v8, [(CLKTimeFormatter *)self->_timeFormatter forcedNumberSystem]);
    [(CLKUITimeLabelStyle *)self->_style setFourDigitFont:v9];

    long long v10 = [v16 designatorFont];
    [(CLKUITimeLabelStyle *)self->_style setDesignatorFont:v10];

    NSUInteger v11 = [v16 stringAttributes];
    [(CLKUITimeLabelStyle *)self->_style setStringAttributes:v11];

    NSUInteger v12 = [(CLKTimeFormatter *)self->_timeFormatter timeText];
    unint64_t v13 = [v12 length];
    id v14 = self->_style;
    if (v13 > 4) {
      [(CLKUITimeLabelStyle *)v14 fourDigitFont];
    }
    else {
    v15 = [(CLKUITimeLabelStyle *)v14 threeDigitFont];
    }

    [(UILabel *)self->_label setFont:v15];
    [(_CLKUIBasicTimeLabelManager *)self _updateAttributedText];
  }
}

- (void)setShowsDesignator:(BOOL)a3
{
  if (self->_showsDesignator != a3)
  {
    self->_showsDesignator = a3;
    [(_CLKUIBasicTimeLabelManager *)self updateTimeText];
  }
}

- (void)setMaxWidth:(double)a3
{
  self->_double maxWidth = a3;
}

- (double)_capOffsetFromBoundsTop
{
  [(UILabel *)self->_label _capOffsetFromBoundsTop];
  return result;
}

- (double)_lastLineBaseline
{
  [(UILabel *)self->_label _lastLineBaseline];
  return result;
}

- (id)viewForLastBaselineLayout
{
  return self->_label;
}

- (id)effectiveAttributedText
{
  return [(_CLKUIBasicTimeLabelManager *)self _attributedTextShowingBlinker:1 numbers:1];
}

- (void)sizeViewToFit
{
  [(UILabel *)self->_label bounds];
  double v4 = v3;
  double v6 = v5;
  [(_CLKUIBasicTimeLabelManager *)self sizeThatFits];
  label = self->_label;
  -[UILabel setBounds:](label, "setBounds:", v4, v6, v7, v8);
}

- (void)traitCollectionDidChange:(id)a3
{
  timeText = self->_timeText;
  self->_timeText = 0;
  id v5 = a3;

  [(UILabel *)self->_label traitCollectionDidChange:v5];
  [(_CLKUIBasicTimeLabelManager *)self updateTimeText];
}

- (UIEdgeInsets)opticalInsets
{
  if (objc_opt_respondsToSelector())
  {
    [(UILabel *)self->_label opticalInsets];
    CGFloat top = v3;
    double left = v5;
    CGFloat bottom = v7;
    double right = v9;
  }
  else if (CLKSizeIsEmpty())
  {
    CGFloat top = *MEMORY[0x1E4FB2848];
    double left = *(double *)(MEMORY[0x1E4FB2848] + 8);
    CGFloat bottom = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double right = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  else if (self->_cachedOpticalEdgeInsetsIsValid)
  {
    CGFloat top = self->_cachedOpticalEdgeInsets.top;
    double left = self->_cachedOpticalEdgeInsets.left;
    CGFloat bottom = self->_cachedOpticalEdgeInsets.bottom;
    double right = self->_cachedOpticalEdgeInsets.right;
  }
  else
  {
    NSUInteger v11 = [(UILabel *)self->_label _stringDrawingContext];
    NSUInteger v12 = [(UILabel *)self->_label attributedText];
    objc_msgSend(v12, "boundingRectWithSize:options:context:", 9, v11, self->_cachedIntrinsicSize.width, self->_cachedIntrinsicSize.height);
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;

    long long v21 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
    *(_OWORD *)&self->_cachedOpticalEdgeInsets.CGFloat top = *MEMORY[0x1E4FB2848];
    *(_OWORD *)&self->_cachedOpticalEdgeInsets.CGFloat bottom = v21;
    CLKFloorForDevice();
    self->_cachedOpticalEdgeInsets.double left = v22;
    double width = self->_cachedIntrinsicSize.width;
    v29.origin.x = v14;
    v29.origin.y = v16;
    v29.size.double width = v18;
    v29.size.double height = v20;
    CGRectGetWidth(v29);
    CLKCeilForDevice();
    CGFloat top = self->_cachedOpticalEdgeInsets.top;
    double left = self->_cachedOpticalEdgeInsets.left;
    double right = width - v24 - left;
    self->_cachedOpticalEdgeInsets.double right = right;
    self->_cachedOpticalEdgeInsetsIsValid = 1;
    CGFloat bottom = self->_cachedOpticalEdgeInsets.bottom;
  }
  double v25 = top;
  double v26 = left;
  double v27 = bottom;
  double v28 = right;
  result.double right = v28;
  result.CGFloat bottom = v27;
  result.double left = v26;
  result.CGFloat top = v25;
  return result;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
  id v5 = a3;
  [(UILabel *)self->_label setTextColor:v5];
  [(UILabel *)self->_label setAttributedText:self->_correctAttributedText];
}

- (void)setShowSeconds:(BOOL)a3
{
  if (self->_showSeconds != a3)
  {
    self->_showSeconds = a3;
    timeText = self->_timeText;
    self->_timeText = 0;

    [(_CLKUIBasicTimeLabelManager *)self _updateAttributedText];
  }
}

- (void)enumerateUnderlyingLabelsWithBlock:(id)a3
{
  (*((void (**)(id, UILabel *, BOOL))a3 + 2))(a3, self->_label, self->_primary);
  label = self->_label;
  correctAttributedText = self->_correctAttributedText;
  [(UILabel *)label setAttributedText:correctAttributedText];
}

- (id)minutesDesignatorAttributedText
{
  if (self->_minutesBlinkerRange.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    v2 = 0;
  }
  else
  {
    minutesBlinkerAttributedText = self->_minutesBlinkerAttributedText;
    if (!minutesBlinkerAttributedText)
    {
      id v5 = -[NSAttributedString attributedSubstringFromRange:](self->_correctAttributedText, "attributedSubstringFromRange:");
      double v6 = (void *)[v5 mutableCopy];

      objc_msgSend(v6, "removeAttribute:range:", *MEMORY[0x1E4FB12B8], 0, objc_msgSend(v6, "length"));
      double v7 = (NSAttributedString *)[v6 copy];
      double v8 = self->_minutesBlinkerAttributedText;
      self->_minutesBlinkerAttributedText = v7;

      minutesBlinkerAttributedText = self->_minutesBlinkerAttributedText;
    }
    v2 = minutesBlinkerAttributedText;
  }
  return v2;
}

- (id)secondsDesignatorAttributedText
{
  if (self->_secondsBlinkerRange.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    v2 = 0;
  }
  else
  {
    if (self->_secondsBlinkerRange.length)
    {
      double v4 = -[NSAttributedString attributedSubstringFromRange:](self->_correctAttributedText, "attributedSubstringFromRange:");
      id v5 = (void *)[v4 mutableCopy];

      objc_msgSend(v5, "removeAttribute:range:", *MEMORY[0x1E4FB12B8], 0, objc_msgSend(v5, "length"));
      double v6 = (NSAttributedString *)[v5 copy];
      secondsBlinkerAttributedText = self->_secondsBlinkerAttributedText;
      self->_secondsBlinkerAttributedText = v6;
    }
    v2 = self->_secondsBlinkerAttributedText;
  }
  return v2;
}

- (CGRect)_boundingRectOfBlinkerAtRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v37[1] = *MEMORY[0x1E4F143B8];
  [(_CLKUIBasicTimeLabelManager *)self intrinsicSize];
  double v7 = v6;
  double v9 = v8;
  long long v10 = (void *)[objc_alloc(MEMORY[0x1E4FB13A8]) initWithAttributedString:self->_correctAttributedText];
  id v11 = objc_alloc_init(MEMORY[0x1E4FB1370]);
  [v10 addLayoutManager:v11];
  NSUInteger v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB13A0]), "initWithSize:", v7, v9);
  [v12 setLineFragmentPadding:0.0];
  [v11 addTextContainer:v12];
  double v13 = [(_CLKUIBasicTimeLabelManager *)self secondsDesignatorAttributedText];
  uint64_t v14 = *MEMORY[0x1E4FB12B0];
  double v15 = [v13 attribute:*MEMORY[0x1E4FB12B0] atIndex:0 effectiveRange:0];

  if (v15
    || ([(NSAttributedString *)self->_correctAttributedText attribute:v14 atIndex:0 effectiveRange:0], (double v15 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v16 = [v11 locationForGlyphAtIndex:location];
    double v23 = v22;
    NSUInteger v24 = location + 1;
    if (location + 1 < location + length)
    {
      NSUInteger v25 = length - 1;
      do
      {
        uint64_t v16 = [v11 locationForGlyphAtIndex:v24];
        if (v26 < v23) {
          double v23 = v26;
        }
        ++v24;
        --v25;
      }
      while (v25);
    }
    MEMORY[0x1F4188790](v16, v17, v18, v19, v20, v21);
    double v28 = (const CGGlyph *)((char *)v37 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0));
    objc_msgSend(v11, "getGlyphsInRange:glyphs:properties:characterIndexes:bidiLevels:", location, length, v28, 0, 0, 0);
    CGRect v29 = [v10 attribute:v14 atIndex:location effectiveRange:0];
    CGRect OpticalBoundsForGlyphs = CTFontGetOpticalBoundsForGlyphs(v29, v28, 0, length, 0);
    CGFloat width = OpticalBoundsForGlyphs.size.width;
    double v31 = v23 + OpticalBoundsForGlyphs.origin.x;

    double v32 = 0.0;
  }
  else
  {
    double v31 = *MEMORY[0x1E4F1DB28];
    double v32 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v33 = v31;
  double v34 = v32;
  double v35 = width;
  double v36 = v9;
  result.size.double height = v36;
  result.size.CGFloat width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

- (CGRect)_boundingRectOfMinutesBlinker
{
  p_boundingRectOfMinutesBlinkerAttributedText = &self->_boundingRectOfMinutesBlinkerAttributedText;
  if (CGRectIsNull(self->_boundingRectOfMinutesBlinkerAttributedText))
  {
    NSUInteger location = self->_minutesBlinkerRange.location;
    if (location == 0x7FFFFFFFFFFFFFFFLL)
    {
      CGSize v5 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
      p_boundingRectOfMinutesBlinkerAttributedText->origin = (CGPoint)*MEMORY[0x1E4F1DB28];
      p_boundingRectOfMinutesBlinkerAttributedText->size = v5;
    }
    else
    {
      -[_CLKUIBasicTimeLabelManager _boundingRectOfBlinkerAtRange:](self, "_boundingRectOfBlinkerAtRange:", location, self->_minutesBlinkerRange.length);
      self->_boundingRectOfMinutesBlinkerAttributedText.origin.double x = v6;
      self->_boundingRectOfMinutesBlinkerAttributedText.origin.double y = v7;
      self->_boundingRectOfMinutesBlinkerAttributedText.size.double width = v8;
      self->_boundingRectOfMinutesBlinkerAttributedText.size.double height = v9;
    }
  }
  double x = self->_boundingRectOfMinutesBlinkerAttributedText.origin.x;
  double y = self->_boundingRectOfMinutesBlinkerAttributedText.origin.y;
  double width = self->_boundingRectOfMinutesBlinkerAttributedText.size.width;
  double height = self->_boundingRectOfMinutesBlinkerAttributedText.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)_boundingRectOfSecondsBlinker
{
  p_boundingRectOfSecondsBlinkerAttributedText = &self->_boundingRectOfSecondsBlinkerAttributedText;
  if (CGRectIsNull(self->_boundingRectOfSecondsBlinkerAttributedText))
  {
    if (self->_secondsBlinkerRange.length)
    {
      [(_CLKUIBasicTimeLabelManager *)self _boundingRectOfBlinkerAtRange:self->_secondsBlinkerRange.location];
      self->_boundingRectOfSecondsBlinkerAttributedText.origin.double x = v4;
      self->_boundingRectOfSecondsBlinkerAttributedText.origin.double y = v5;
      self->_boundingRectOfSecondsBlinkerAttributedText.size.double width = v6;
      self->_boundingRectOfSecondsBlinkerAttributedText.size.double height = v7;
    }
    else
    {
      CGSize v8 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
      p_boundingRectOfSecondsBlinkerAttributedText->origin = (CGPoint)*MEMORY[0x1E4F1DB28];
      p_boundingRectOfSecondsBlinkerAttributedText->size = v8;
    }
  }
  double x = self->_boundingRectOfSecondsBlinkerAttributedText.origin.x;
  double y = self->_boundingRectOfSecondsBlinkerAttributedText.origin.y;
  double width = self->_boundingRectOfSecondsBlinkerAttributedText.size.width;
  double height = self->_boundingRectOfSecondsBlinkerAttributedText.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)animationsPaused
{
  return self->_animationsPaused;
}

- (BOOL)showSeconds
{
  return self->_showSeconds;
}

- (BOOL)showsBlinker
{
  return self->_showsBlinker;
}

- (void)setShowsBlinker:(BOOL)a3
{
  self->_showsBlinker = a3;
}

- (BOOL)showsNumbers
{
  return self->_showsNumbers;
}

- (void)setShowsNumbers:(BOOL)a3
{
  self->_showsNumbers = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondsBlinkerAttributedText, 0);
  objc_storeStrong((id *)&self->_minutesBlinkerAttributedText, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_correctAttributedText, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_timeText, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end