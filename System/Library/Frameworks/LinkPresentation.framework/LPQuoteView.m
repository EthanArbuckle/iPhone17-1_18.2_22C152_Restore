@interface LPQuoteView
- (BOOL)_lp_isLTR;
- (CGSize)sizeThatFits:(CGSize)a3;
- (LPQuoteView)initWithHost:(id)a3;
- (LPQuoteView)initWithHost:(id)a3 text:(id)a4 style:(id)a5;
- (LPQuotedTextViewStyle)style;
- (NSAttributedString)attributedString;
- (NSRegularExpression)emphasizedTextExpression;
- (UIEdgeInsets)effectiveInsets;
- (UIEdgeInsets)effectiveInsetsWithoutQuoteIndicator;
- (double)ascender;
- (double)descender;
- (double)firstLineLeading;
- (double)lastLineDescent;
- (id)_createTextView;
- (id)effectiveAttributedString;
- (id)firstBaselineAnchor;
- (id)lastBaselineAnchor;
- (int64_t)computedNumberOfLines;
- (int64_t)computedNumberOfLinesWithFont:(id)a3 forSize:(CGSize)a4;
- (int64_t)effectiveMaximumNumberOfLines;
- (int64_t)overrideMaximumNumberOfLines;
- (void)_buildSubviewsIfNeeded;
- (void)applyAttributedString:(id)a3;
- (void)layoutComponentView;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setEmphasizedTextExpression:(id)a3;
- (void)setFont:(id)a3;
- (void)setOverrideMaximumNumberOfLines:(int64_t)a3;
- (void)tintColorDidChange;
- (void)updateEffectiveFontForSize:(CGSize)a3;
- (void)updateExclusionRects;
@end

@implementation LPQuoteView

- (LPQuoteView)initWithHost:(id)a3
{
  return 0;
}

- (LPQuoteView)initWithHost:(id)a3 text:(id)a4 style:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)LPQuoteView;
  v11 = [(LPComponentView *)&v24 initWithHost:v8];
  v12 = v11;
  if (v11)
  {
    if ([v10 maximumCharacters])
    {
      unint64_t v13 = [v9 length];
      BOOL v14 = v13 >= [v10 maximumCharacters];
    }
    else
    {
      BOOL v14 = 0;
    }
    v11->_didLimitNumberOfCharacters = v14;
    if ([v10 maximumCharacters]) {
      truncatedAttributedStringAtLength(v9, [v10 maximumCharacters]);
    }
    else {
    v15 = truncatedAttributedStringAtMaximumMetadataLength(v9);
    }
    p_attributedString = (id *)&v11->_attributedString;
    objc_storeStrong(p_attributedString, v15);

    if (v12->_didLimitNumberOfCharacters)
    {
      v17 = (void *)[*p_attributedString mutableCopy];
      v18 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"…"];
      [v17 appendAttributedString:v18];

      id v19 = *p_attributedString;
      id *p_attributedString = v17;
    }
    uint64_t v20 = [v10 adjustedForString:*p_attributedString];
    style = v12->_style;
    v12->_style = (LPQuotedTextViewStyle *)v20;

    v22 = v12;
  }

  return v12;
}

- (void)_buildSubviewsIfNeeded
{
  if (!self->_textView)
  {
    v3 = [(LPQuoteView *)self _createTextView];
    textView = self->_textView;
    self->_textView = v3;

    v5 = self->_textView;
    id v39 = [(LPQuoteView *)self effectiveAttributedString];
    -[UITextView _lp_setAttributedString:](v5, "_lp_setAttributedString:");

    v6 = [(LPTextViewStyle *)self->_style compositingFilter];

    if (v6)
    {
      id v40 = [(LPTextViewStyle *)self->_style compositingFilter];
      v7 = [(UITextView *)self->_textView layer];
      [v7 setCompositingFilter:v40];
    }
    if (+[LPSettings showDebugIndicators])
    {
      id v41 = [MEMORY[0x1E4FB1618] greenColor];
      uint64_t v8 = [v41 CGColor];
      id v9 = [(UITextView *)self->_textView layer];
      [v9 setBorderColor:v8];

      id v42 = [(UITextView *)self->_textView layer];
      [v42 setBorderWidth:0.5];
    }
    id v43 = [(LPComponentView *)self host];
    int v10 = [v43 allowsVibrancyForComponentView:self];

    if (v10)
    {
      v11 = [(LPTextViewStyle *)self->_style color];
      vibrancyEffectStyleForColor(v11);
      id v44 = (id)objc_claimAutoreleasedReturnValue();

      if (v44)
      {
        id v12 = objc_alloc(MEMORY[0x1E4FB1F00]);
        unint64_t v13 = (void *)MEMORY[0x1E4FB1EA0];
        BOOL v14 = (void *)MEMORY[0x1E4FB14C8];
        v15 = [(LPComponentView *)self host];
        v16 = objc_msgSend(v14, "effectWithStyle:", objc_msgSend(v15, "blurEffectStyleBehindComponentView:", self));
        v17 = objc_msgSend(v13, "effectForBlurEffect:style:", v16, objc_msgSend(v44, "integerValue"));
        v18 = (UIVisualEffectView *)[v12 initWithEffect:v17];
        effectView = self->_effectView;
        self->_effectView = v18;

        uint64_t v20 = [(UIVisualEffectView *)self->_effectView contentView];
        [v20 addSubview:self->_textView];

        [(LPQuoteView *)self addSubview:self->_effectView];
        if ([v44 integerValue])
        {
          v21 = [(LPQuoteView *)self _createTextView];
          coloredGlyphsView = self->_coloredGlyphsView;
          self->_coloredGlyphsView = v21;

          v23 = [(LPQuoteView *)self effectiveAttributedString];
          objc_super v24 = +[LPTextView attributedStringHidingNonColoredRanges:v23];
          [(UITextView *)self->_coloredGlyphsView setAttributedText:v24];

          [(LPQuoteView *)self addSubview:self->_coloredGlyphsView];
        }
      }
    }
    if (!self->_effectView) {
      [(LPQuoteView *)self addSubview:self->_textView];
    }
    if ([(LPQuotedTextViewStyle *)self->_style showQuoteIndicator])
    {
      v25 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
      quoteIndicatorView = self->_quoteIndicatorView;
      self->_quoteIndicatorView = v25;

      if ([(LPQuoteView *)self _lp_isLTR]) {
        +[LPResources openQuote];
      }
      else {
      v27 = +[LPResources closeQuote];
      }
      v28 = [v27 platformImage];
      [(UIImageView *)self->_quoteIndicatorView setImage:v28];

      v29 = self->_quoteIndicatorView;
      id v45 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      -[UIImageView _lp_setTintColor:](v29, "_lp_setTintColor:");

      [(LPQuoteView *)self addSubview:self->_quoteIndicatorView];
    }
    if ([(LPQuotedTextViewStyle *)self->_style showCharacterLimitIndicator]
      && self->_didLimitNumberOfCharacters)
    {
      v30 = [LPTextView alloc];
      id v46 = [(LPComponentView *)self host];
      id v31 = objc_alloc(MEMORY[0x1E4F28B18]);
      v32 = LPLocalizedString(@"Viewing Partial Selection");
      v33 = (void *)[v31 initWithString:v32];
      v34 = [(LPQuotedTextViewStyle *)self->_style characterLimitIndicatorStyle];
      v35 = [(LPTextView *)v30 initWithHost:v46 text:v33 style:v34];
      characterLimitIndicatorView = self->_characterLimitIndicatorView;
      self->_characterLimitIndicatorView = v35;

      [(LPQuoteView *)self addSubview:self->_characterLimitIndicatorView];
    }
    id v47 = [(LPTextViewStyle *)self->_style font];
    [v47 ascender];
    self->_ascender = v37;

    id v48 = [(LPTextViewStyle *)self->_style font];
    [v48 descender];
    self->_descender = v38;
  }
}

- (BOOL)_lp_isLTR
{
  v2 = self;
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v5 = [v4 semanticContentAttribute];
      unsigned __int8 v6 = v5 == 3;
      if (v5 == 3 || [v4 semanticContentAttribute] == 4) {
        goto LABEL_10;
      }
      uint64_t v7 = [v4 superview];

      v4 = (void *)v7;
    }
    while (v7);
  }
  else
  {
    v4 = 0;
  }
  v9.receiver = v3;
  v9.super_class = (Class)LPQuoteView;
  unsigned __int8 v6 = [(UIView *)&v9 _lp_isLTR];
LABEL_10:

  return v6;
}

- (id)effectiveAttributedString
{
  v3 = [(LPComponentView *)self host];
  int v4 = [v3 allowsVibrancyForComponentView:self];

  if (v4)
  {
    uint64_t v5 = [(LPTextViewStyle *)self->_style color];
    unsigned __int8 v6 = vibrancyEffectStyleForColor(v5);
    BOOL v18 = v6 != 0;
  }
  else
  {
    BOOL v18 = 0;
  }
  BOOL v7 = [(UIView *)self _lp_prefersDarkInterface];
  attributedString = self->_attributedString;
  style = self->_style;
  emphasizedTextExpression = self->_emphasizedTextExpression;
  v11 = [(UIView *)self _lp_tintColor];
  BOOL v12 = [(LPQuoteView *)self _lp_isLTR];
  unint64_t v13 = [(UITextView *)self->_textView font];
  BOOL v14 = v13;
  if (!v13)
  {
    BOOL v14 = [(LPTextViewStyle *)self->_style font];
  }
  LOBYTE(v17) = v12;
  v15 = +[LPTextView attributedString:attributedString resolvedAgainstStyle:style withEmphasizedTextExpression:emphasizedTextExpression tintColor:v11 lineBreakMode:0 usesVibrancy:v18 forLTR:v17 withFont:v14 userInterfaceStyle:v7];
  if (!v13) {

  }
  return v15;
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentInset.left
    || a3.top != self->_contentInset.top
    || a3.right != self->_contentInset.right
    || a3.bottom != self->_contentInset.bottom)
  {
    self->_contentInset = a3;
  }
}

- (LPQuotedTextViewStyle)style
{
  return self->_style;
}

- (double)firstLineLeading
{
  v2 = [(LPTextViewStyle *)self->_style firstLineLeading];
  [v2 value];
  double v4 = v3;

  return v4;
}

- (double)lastLineDescent
{
  v2 = [(LPTextViewStyle *)self->_style lastLineDescent];
  [v2 value];
  double v4 = v3;

  return v4;
}

- (double)ascender
{
  return self->_ascender;
}

- (double)descender
{
  return self->_descender;
}

- (int64_t)computedNumberOfLinesWithFont:(id)a3 forSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = [(UITextView *)self->_textView font];
    [(LPQuoteView *)self setFont:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }
  [(LPQuoteView *)self frame];
  if (width == v10 && height == v9)
  {
    double v13 = *MEMORY[0x1E4F1DB28];
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    [(UITextView *)self->_textView frame];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    -[UITextView setFrame:](self->_textView, "setFrame:");
  }
  uint64_t v20 = [(UITextView *)self->_textView layoutManager];
  int64_t v21 = 0;
  unint64_t v22 = [v20 numberOfGlyphs];
  if (v22)
  {
    uint64_t v23 = 0;
    do
    {
      uint64_t v27 = 0;
      uint64_t v28 = 0;
      [v20 lineFragmentRectForGlyphAtIndex:v23 effectiveRange:&v27];
      uint64_t v23 = v28 + v27;
      ++v21;
    }
    while (v28 + v27 < v22);
  }
  if (v7) {
    [(LPQuoteView *)self setFont:v8];
  }
  [(LPQuoteView *)self frame];
  if (width != v25 || height != v24) {
    -[UITextView setFrame:](self->_textView, "setFrame:", v13, v15, v17, v19);
  }

  return v21;
}

- (int64_t)computedNumberOfLines
{
  [(LPQuoteView *)self frame];

  return -[LPQuoteView computedNumberOfLinesWithFont:forSize:](self, "computedNumberOfLinesWithFont:forSize:", 0, v3, v4);
}

- (void)setOverrideMaximumNumberOfLines:(int64_t)a3
{
  self->_overrideMaximumNumberOfLines = a3;
  int64_t v4 = [(LPQuoteView *)self effectiveMaximumNumberOfLines];
  id v6 = [(UITextView *)self->_textView textContainer];
  [v6 setMaximumNumberOfLines:v4];

  int64_t v5 = [(LPQuoteView *)self effectiveMaximumNumberOfLines];
  id v7 = [(UITextView *)self->_coloredGlyphsView textContainer];
  [v7 setMaximumNumberOfLines:v5];
}

- (UIEdgeInsets)effectiveInsetsWithoutQuoteIndicator
{
  double v3 = [(LPTextViewStyle *)self->_style padding];
  objc_msgSend(v3, "asInsetsForLTR:", -[LPQuoteView _lp_isLTR](self, "_lp_isLTR"));
  double v5 = v4 + self->_contentInset.top;
  double v7 = v6 + self->_contentInset.left;
  double v9 = v8 + self->_contentInset.bottom;
  double v11 = v10 + self->_contentInset.right;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (UIEdgeInsets)effectiveInsets
{
  [(LPQuoteView *)self effectiveInsetsWithoutQuoteIndicator];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(LPQuotedTextViewStyle *)self->_style showQuoteIndicator])
  {
    double v11 = [(UIImageView *)self->_quoteIndicatorView image];
    [v11 size];
    double v4 = v4 + v12 + 12.0;
    double v6 = v6 + 0.0;
    double v8 = v8 + 0.0;
    double v10 = v10 + 0.0;
  }
  double v13 = v4;
  double v14 = v6;
  double v15 = v8;
  double v16 = v10;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (int64_t)effectiveMaximumNumberOfLines
{
  int64_t result = self->_overrideMaximumNumberOfLines;
  if (!result)
  {
    double v4 = [(LPComponentView *)self host];
    int v5 = [v4 linkHasMediaForComponentView:self];

    style = self->_style;
    if (v5) {
      LODWORD(result) = [(LPTextViewStyle *)style maximumLinesWithMedia];
    }
    else {
      LODWORD(result) = [(LPTextViewStyle *)style maximumLines];
    }
    return result;
  }
  return result;
}

- (void)layoutComponentView
{
  [(LPQuoteView *)self _buildSubviewsIfNeeded];
  [(LPQuoteView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(LPQuoteView *)self effectiveInsets];
  double v12 = v4 + v11;
  double v14 = v6 + v13;
  double v16 = v8 - (v11 + v15);
  double v18 = v10 - (v13 + v17);
  characterLimitIndicatorView = self->_characterLimitIndicatorView;
  if (characterLimitIndicatorView)
  {
    -[LPTextView sizeThatFits:](characterLimitIndicatorView, "sizeThatFits:", v16, v18);
    double v21 = v20;
    double v18 = v18 - v20;
    v46.origin.x = v12;
    v46.origin.y = v14;
    v46.size.double width = v16;
    v46.size.double height = v18;
    -[LPTextView setFrame:](self->_characterLimitIndicatorView, "setFrame:", v12, CGRectGetMaxY(v46), v16, v21);
  }
  effectView = self->_effectView;
  if (effectView)
  {
    -[UIVisualEffectView setFrame:](effectView, "setFrame:", v12, v14, v16, v18);
    -[UITextView setFrame:](self->_coloredGlyphsView, "setFrame:", v12, v14, v16, v18);
    double v23 = 0.0;
    double v24 = 0.0;
  }
  else
  {
    double v23 = v12;
    double v24 = v14;
  }
  -[UITextView setFrame:](self->_textView, "setFrame:", v23, v24, v16, v18);
  if ([(LPQuotedTextViewStyle *)self->_style showQuoteIndicator])
  {
    [(LPQuoteView *)self bounds];
    double v26 = v25;
    double v28 = v27;
    [(LPQuoteView *)self effectiveInsetsWithoutQuoteIndicator];
    double v30 = v29;
    double v32 = v31;
    if ([(LPQuoteView *)self _lp_isLTR])
    {
      double v33 = v26 + v32;
    }
    else
    {
      v47.origin.x = v12;
      v47.origin.y = v14;
      v47.size.double width = v16;
      v47.size.double height = v18;
      double MaxX = CGRectGetMaxX(v47);
      v35 = [(UIImageView *)self->_quoteIndicatorView image];
      [v35 size];
      double v33 = MaxX - v36;
    }
    double v37 = [(UIImageView *)self->_quoteIndicatorView image];
    [v37 size];
    double v39 = v38;

    id v40 = [(UIImageView *)self->_quoteIndicatorView image];
    [v40 size];
    double v42 = v41;

    -[UIImageView setFrame:](self->_quoteIndicatorView, "setFrame:", v33, v28 + v30, v39, v42);
  }
  [(LPQuoteView *)self updateExclusionRects];
  [(UITextView *)self->_textView bounds];

  -[LPQuoteView updateEffectiveFontForSize:](self, "updateEffectiveFontForSize:", v43, v44);
}

- (void)updateExclusionRects
{
  id v7 = [(LPComponentView *)self host];
  double v3 = [v7 layoutExclusionsForView:self->_textView];
  double v4 = [(UITextView *)self->_textView textContainer];
  [v4 setExclusionPaths:v3];

  if (self->_coloredGlyphsView)
  {
    id v8 = [(LPComponentView *)self host];
    double v5 = [v8 layoutExclusionsForView:self->_coloredGlyphsView];
    double v6 = [(UITextView *)self->_coloredGlyphsView textContainer];
    [v6 setExclusionPaths:v5];
  }
}

- (void)setFont:(id)a3
{
  id v8 = a3;
  textView = self->_textView;
  if (textView)
  {
    double v5 = [(UITextView *)textView font];
    char v6 = [v8 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      [(UITextView *)self->_textView setFont:v8];
      id v7 = [(LPQuoteView *)self effectiveAttributedString];
      [(LPQuoteView *)self applyAttributedString:v7];
    }
  }
}

- (void)updateEffectiveFontForSize:(CGSize)a3
{
  double width = a3.width;
  unsigned int v5 = [(LPQuotedTextViewStyle *)self->_style maximumLinesToConsiderShort];
  uint64_t v6 = [(LPTextViewStyle *)self->_style font];
  id v10 = (id)v6;
  if (v5)
  {
    uint64_t v7 = -[LPQuoteView computedNumberOfLinesWithFont:forSize:](self, "computedNumberOfLinesWithFont:forSize:", v6, width, 10000.0);
    unsigned int v8 = [(LPQuotedTextViewStyle *)self->_style maximumLinesToConsiderShort];

    style = self->_style;
    if (v7 <= v8) {
      [(LPTextViewStyle *)style font];
    }
    else {
    id v10 = [(LPQuotedTextViewStyle *)style longPullQuoteFont];
    }
    [(LPQuoteView *)self setFont:v10];
  }
  else
  {
    [(LPQuoteView *)self setFont:v6];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(LPQuoteView *)self _buildSubviewsIfNeeded];
  [(LPQuoteView *)self effectiveInsets];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = width - (v8 + v12);
  double v15 = height - (v6 + v10);
  characterLimitIndicatorView = self->_characterLimitIndicatorView;
  if (characterLimitIndicatorView)
  {
    -[LPTextView sizeThatFits:](characterLimitIndicatorView, "sizeThatFits:", v14, v15);
    double v18 = v17;
    double v15 = v15 - v17;
  }
  else
  {
    double v18 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v19 = [(UITextView *)self->_textView font];
  -[LPQuoteView updateEffectiveFontForSize:](self, "updateEffectiveFontForSize:", v14, v15);
  -[UITextView sizeThatFits:](self->_textView, "sizeThatFits:", v14, v15);
  double v21 = v20;
  double v23 = v22;
  [(LPQuoteView *)self setFont:v19];

  double v24 = ceil(v21) - (-v13 - v9);
  double v25 = ceil(v18 + v23) - (-v11 - v7);
  result.double height = v25;
  result.double width = v24;
  return result;
}

- (void)setEmphasizedTextExpression:(id)a3
{
  objc_storeStrong((id *)&self->_emphasizedTextExpression, a3);
  if (self->_textView)
  {
    id v4 = [(LPQuoteView *)self effectiveAttributedString];
    -[LPQuoteView applyAttributedString:](self, "applyAttributedString:");
  }
}

- (void)tintColorDidChange
{
  if (self->_textView)
  {
    id v3 = [(LPQuoteView *)self effectiveAttributedString];
    -[LPQuoteView applyAttributedString:](self, "applyAttributedString:");
  }
}

- (id)_createTextView
{
  id v3 = objc_msgSend(MEMORY[0x1E4FB1DD8], "_lp_createInertTextView");
  [v3 setEditable:0];
  [v3 setSelectable:0];
  id v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBackgroundColor:v4];

  [v3 setScrollEnabled:0];
  [v3 setShowsVerticalScrollIndicator:0];
  [v3 setShowsHorizontalScrollIndicator:0];
  [v3 setBounces:0];
  int64_t v5 = [(LPQuoteView *)self effectiveMaximumNumberOfLines];
  double v6 = [v3 textContainer];
  [v6 setMaximumNumberOfLines:v5];

  objc_msgSend(v3, "setTextContainerInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  double v7 = [v3 textContainer];
  [v7 setHeightTracksTextView:1];

  double v8 = [v3 textContainer];
  [v8 setLineFragmentPadding:0.0];

  double v9 = [v3 textContainer];
  [v9 setLineBreakMode:4];

  return v3;
}

- (void)applyAttributedString:(id)a3
{
  id v5 = a3;
  -[UITextView _lp_setAttributedString:](self->_textView, "_lp_setAttributedString:");
  if (self->_coloredGlyphsView)
  {
    id v4 = +[LPTextView attributedStringHidingNonColoredRanges:v5];
    [(UITextView *)self->_coloredGlyphsView setAttributedText:v4];
  }
}

- (id)firstBaselineAnchor
{
  [(LPQuoteView *)self _buildSubviewsIfNeeded];
  textView = self->_textView;

  return (id)[(UITextView *)textView firstBaselineAnchor];
}

- (id)lastBaselineAnchor
{
  [(LPQuoteView *)self _buildSubviewsIfNeeded];
  textView = self->_textView;

  return (id)[(UITextView *)textView lastBaselineAnchor];
}

- (int64_t)overrideMaximumNumberOfLines
{
  return self->_overrideMaximumNumberOfLines;
}

- (NSRegularExpression)emphasizedTextExpression
{
  return self->_emphasizedTextExpression;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emphasizedTextExpression, 0);
  objc_storeStrong((id *)&self->_coloredGlyphsView, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_quoteIndicatorView, 0);
  objc_storeStrong((id *)&self->_characterLimitIndicatorView, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_style, 0);

  objc_storeStrong((id *)&self->_textView, 0);
}

@end