@interface HUGridServiceCellTextView
+ (double)minimumDescriptionScaleFactor;
- (BOOL)shouldShowRoomName;
- (BOOL)textColorFollowsTintColor;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (HFServiceNameComponents)serviceNameComponents;
- (HUGridServiceCellTextView)initWithFrame:(CGRect)a3;
- (NSString)descriptionText;
- (UIColor)textColor;
- (UIFont)font;
- (double)descriptionTextColorDimmingFactor;
- (double)lastBaselineToBottomDistance;
- (double)lineHeight;
- (double)topToFirstBaselineDistance;
- (id)_combinedAttributedString;
- (id)_commonTextAttributesWithLineBreakMode:(int64_t)a3;
- (id)_effectiveTextColor;
- (unint64_t)mode;
- (void)_drawCombinedLabel;
- (void)_drawDescriptionLabel;
- (void)_drawSeperateLabels;
- (void)_updateMode;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setDescriptionText:(id)a3;
- (void)setDescriptionTextColorDimmingFactor:(double)a3;
- (void)setFont:(id)a3;
- (void)setLineHeight:(double)a3;
- (void)setMode:(unint64_t)a3;
- (void)setServiceNameComponents:(id)a3;
- (void)setShouldShowRoomName:(BOOL)a3;
- (void)setTextColor:(id)a3;
- (void)setTextColorFollowsTintColor:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation HUGridServiceCellTextView

- (HUGridServiceCellTextView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUGridServiceCellTextView;
  v3 = -[HUGridServiceCellTextView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(HUGridServiceCellTextView *)v3 setOpaque:0];
    [(HUGridServiceCellTextView *)v4 setContentMode:3];
    v4->_descriptionTextColorDimmingFactor = 1.0;
    v4->_shouldShowRoomName = 1;
  }
  return v4;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)HUGridServiceCellTextView;
  [(HUGridServiceCellTextView *)&v3 tintColorDidChange];
  [(HUGridServiceCellTextView *)self setNeedsDisplay];
}

+ (double)minimumDescriptionScaleFactor
{
  return 0.8;
}

- (void)setServiceNameComponents:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_serviceNameComponents] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_serviceNameComponents, a3);
    [(HUGridServiceCellTextView *)self setNeedsLayout];
    [(HUGridServiceCellTextView *)self setNeedsDisplay];
  }
}

- (void)setDescriptionText:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_descriptionText] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_descriptionText, a3);
    [(HUGridServiceCellTextView *)self setNeedsDisplay];
  }
}

- (void)setFont:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_font] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_font, a3);
    [(HUGridServiceCellTextView *)self setNeedsDisplay];
    [(HUGridServiceCellTextView *)self invalidateIntrinsicContentSize];
  }
}

- (void)setTextColor:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_textColor] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_textColor, a3);
    [(HUGridServiceCellTextView *)self setNeedsDisplay];
  }
}

- (void)setTextColorFollowsTintColor:(BOOL)a3
{
  if (self->_textColorFollowsTintColor != a3)
  {
    self->_textColorFollowsTintColor = a3;
    [(HUGridServiceCellTextView *)self setNeedsDisplay];
  }
}

- (double)lineHeight
{
  double result = self->_lineHeight;
  if (fabs(result) < 2.22044605e-16)
  {
    objc_super v3 = [(HUGridServiceCellTextView *)self font];
    [v3 lineHeight];
    double v5 = v4;

    return v5;
  }
  return result;
}

- (void)setLineHeight:(double)a3
{
  if (self->_lineHeight != a3)
  {
    self->_lineHeight = a3;
    [(HUGridServiceCellTextView *)self invalidateIntrinsicContentSize];
    [(HUGridServiceCellTextView *)self setNeedsDisplay];
  }
}

- (void)setMode:(unint64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    [(HUGridServiceCellTextView *)self setNeedsLayout];
  }
}

- (void)setShouldShowRoomName:(BOOL)a3
{
  if (self->_shouldShowRoomName != a3)
  {
    self->_shouldShowRoomName = a3;
    [(HUGridServiceCellTextView *)self setNeedsLayout];
  }
}

- (double)topToFirstBaselineDistance
{
  v2 = [(HUGridServiceCellTextView *)self font];
  [v2 ascender];
  double v4 = v3;

  return v4;
}

- (double)lastBaselineToBottomDistance
{
  [(HUGridServiceCellTextView *)self lineHeight];
  double v4 = v3;
  double v5 = [(HUGridServiceCellTextView *)self font];
  [v5 ascender];
  double v7 = v4 - v6;

  return v7;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HUGridServiceCellTextView;
  [(HUGridServiceCellTextView *)&v3 layoutSubviews];
  [(HUGridServiceCellTextView *)self _updateMode];
}

- (void)_updateMode
{
  id v3 = objc_alloc(MEMORY[0x1E4F28B18]);
  double v4 = [(HUGridServiceCellTextView *)self _commonTextAttributesWithLineBreakMode:0];
  CFAttributedStringRef attrString = (const __CFAttributedString *)[v3 initWithString:@"X" attributes:v4];

  double v5 = CTFramesetterCreateWithAttributedString(attrString);
  CFAttributedStringRef v6 = [(HUGridServiceCellTextView *)self _combinedAttributedString];
  double v7 = CTFramesetterCreateWithAttributedString(v6);

  [(HUGridServiceCellTextView *)self frame];
  v25.CGFloat width = v8;
  v23.location = 0;
  v23.length = 0;
  v25.height = 1.79769313e308;
  CGSize v9 = CTFramesetterSuggestFrameSizeWithConstraints(v5, v23, 0, v25, 0);
  [(HUGridServiceCellTextView *)self frame];
  v26.CGFloat width = v10;
  v24.location = 0;
  v24.length = 0;
  v26.height = 1.79769313e308;
  CGSize v12 = CTFramesetterSuggestFrameSizeWithConstraints(v7, v24, 0, v26, 0);
  CGFloat width = v12.width;
  if (v5) {
    CFRelease(v5);
  }
  if (v7) {
    CFRelease(v7);
  }
  v13 = [(HUGridServiceCellTextView *)self serviceNameComponents];
  v14 = [v13 serviceName];

  if ([(HUGridServiceCellTextView *)self shouldShowRoomName])
  {
    v15 = [(HUGridServiceCellTextView *)self serviceNameComponents];
    v16 = [v15 roomName];
  }
  else
  {
    v16 = 0;
  }
  if (![v14 length] || (uint64_t v17 = objc_msgSend(v16, "length"), v18 = 1, !v17) && v12.height > v9.height)
  {
    uint64_t v19 = [v16 length];
    if (v12.height <= v9.height && v19 == 0) {
      uint64_t v18 = 0;
    }
    else {
      uint64_t v18 = 2;
    }
  }
  [(HUGridServiceCellTextView *)self setMode:v18];
}

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x1E4F43ED8];
  [(HUGridServiceCellTextView *)self lineHeight];
  double v4 = v3 * 3.0;
  double v5 = v2;
  result.height = v4;
  result.CGFloat width = v5;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [(HUGridServiceCellTextView *)self intrinsicContentSize];
  double v5 = width;
  result.height = v4;
  result.CGFloat width = v5;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  unint64_t v4 = [(HUGridServiceCellTextView *)self mode];
  if (v4 == 2)
  {
    [(HUGridServiceCellTextView *)self _drawCombinedLabel];
  }
  else if (v4 == 1)
  {
    [(HUGridServiceCellTextView *)self _drawSeperateLabels];
  }
  double v5 = [(HUGridServiceCellTextView *)self descriptionText];

  if (v5)
  {
    [(HUGridServiceCellTextView *)self _drawDescriptionLabel];
  }
}

- (id)_commonTextAttributesWithLineBreakMode:(int64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F42670]);
  [(HUGridServiceCellTextView *)self lineHeight];
  objc_msgSend(v5, "setMinimumLineHeight:");
  [(HUGridServiceCellTextView *)self lineHeight];
  objc_msgSend(v5, "setMaximumLineHeight:");
  [v5 setLineBreakMode:a3];
  objc_msgSend(v5, "setAllowsDefaultTighteningForTruncation:", objc_msgSend(MEMORY[0x1E4F69138], "isHomeControlService") ^ 1);
  CFAttributedStringRef v6 = [MEMORY[0x1E4F1CA60] dictionary];
  double v7 = [(HUGridServiceCellTextView *)self font];
  objc_msgSend(v6, "na_safeSetObject:forKey:", v7, *MEMORY[0x1E4F42508]);

  CGFloat v8 = [(HUGridServiceCellTextView *)self _effectiveTextColor];
  objc_msgSend(v6, "na_safeSetObject:forKey:", v8, *MEMORY[0x1E4F42510]);

  objc_msgSend(v6, "na_safeSetObject:forKey:", v5, *MEMORY[0x1E4F42540]);

  return v6;
}

- (id)_combinedAttributedString
{
  double v3 = [(HUGridServiceCellTextView *)self _commonTextAttributesWithLineBreakMode:0];
  BOOL v4 = [(HUGridServiceCellTextView *)self shouldShowRoomName];
  id v5 = [(HUGridServiceCellTextView *)self serviceNameComponents];
  CFAttributedStringRef v6 = v5;
  if (v4) {
    [v5 composedString];
  }
  else {
  double v7 = [v5 serviceName];
  }

  CGFloat v8 = [v7 stringWithAttributes:v3];

  return v8;
}

- (void)_drawCombinedLabel
{
  id v10 = objc_alloc_init(MEMORY[0x1E4F42688]);
  [v10 setMaximumNumberOfLines:2];
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(HUGridServiceCellTextView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  CGSize v9 = [(HUGridServiceCellTextView *)self _combinedAttributedString];
  objc_msgSend(v9, "drawWithRect:options:context:", 33, v10, v3, v4, v6, v8);
}

- (void)_drawSeperateLabels
{
  id v18 = [(HUGridServiceCellTextView *)self _commonTextAttributesWithLineBreakMode:4];
  double v3 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F42508]];
  [v3 ascender];
  double v5 = v4;

  [(HUGridServiceCellTextView *)self bounds];
  double v7 = v6;
  double v9 = v8;
  id v10 = objc_alloc_init(MEMORY[0x1E4F42688]);
  if ([(HUGridServiceCellTextView *)self shouldShowRoomName])
  {
    v11 = [(HUGridServiceCellTextView *)self serviceNameComponents];
    CGSize v12 = [v11 roomName];
    v13 = [v12 stringWithAttributes:v18];

    objc_msgSend(v13, "drawWithRect:options:context:", 0, v10, 0.0, v5, v7, v9);
  }
  v14 = [(HUGridServiceCellTextView *)self serviceNameComponents];
  v15 = [v14 serviceName];

  v16 = [v15 stringWithAttributes:v18];
  [(HUGridServiceCellTextView *)self lineHeight];
  objc_msgSend(v16, "drawWithRect:options:context:", 0, v10, 0.0, v5 + v17, v7, v9);
}

- (void)_drawDescriptionLabel
{
  double v3 = [(HUGridServiceCellTextView *)self _commonTextAttributesWithLineBreakMode:4];
  double v4 = (void *)[v3 mutableCopy];

  [(HUGridServiceCellTextView *)self descriptionTextColorDimmingFactor];
  if (v5 < 1.0)
  {
    double v6 = [(HUGridServiceCellTextView *)self _effectiveTextColor];
    double v20 = 1.0;
    [v6 getWhite:0 alpha:&v20];
    [(HUGridServiceCellTextView *)self descriptionTextColorDimmingFactor];
    double v20 = v7 * v20;
    double v8 = objc_msgSend(v6, "colorWithAlphaComponent:");

    [v4 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F42510]];
  }
  double v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F42508]];
  [v9 ascender];
  double v11 = v10;

  CGSize v12 = [(HUGridServiceCellTextView *)self descriptionText];
  v13 = [v12 stringWithAttributes:v4];

  [(HUGridServiceCellTextView *)self bounds];
  double v15 = v14;
  double v17 = v16;
  id v18 = objc_msgSend(v13, "hf_scaledAttributedStringWithBoundingSize:minimumScaleFactor:maximumNumberOfLines:", 1, v14, v16, 0.8);

  [(HUGridServiceCellTextView *)self lineHeight];
  objc_msgSend(v18, "drawWithRect:options:context:", 0, 0, 0.0, v11 + v19 * 2.0, v15, v17);
}

- (id)_effectiveTextColor
{
  double v3 = [MEMORY[0x1E4F428B8] labelColor];
  if ([(HUGridServiceCellTextView *)self textColorFollowsTintColor])
  {
    uint64_t v4 = [(HUGridServiceCellTextView *)self tintColor];
  }
  else
  {
    double v5 = [(HUGridServiceCellTextView *)self textColor];

    if (!v5) {
      goto LABEL_6;
    }
    uint64_t v4 = [(HUGridServiceCellTextView *)self textColor];
  }
  double v6 = (void *)v4;

  double v3 = v6;
LABEL_6:

  return v3;
}

- (HFServiceNameComponents)serviceNameComponents
{
  return self->_serviceNameComponents;
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (BOOL)textColorFollowsTintColor
{
  return self->_textColorFollowsTintColor;
}

- (double)descriptionTextColorDimmingFactor
{
  return self->_descriptionTextColorDimmingFactor;
}

- (void)setDescriptionTextColorDimmingFactor:(double)a3
{
  self->_descriptionTextColorDimmingFactor = a3;
}

- (BOOL)shouldShowRoomName
{
  return self->_shouldShowRoomName;
}

- (UIFont)font
{
  return self->_font;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);

  objc_storeStrong((id *)&self->_serviceNameComponents, 0);
}

@end