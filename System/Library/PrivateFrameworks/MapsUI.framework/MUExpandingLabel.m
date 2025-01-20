@interface MUExpandingLabel
- (BOOL)_canShowAllText;
- (BOOL)_canShowLess;
- (BOOL)_isShowingUserExpanded;
- (BOOL)allowLessText;
- (BOOL)isEditable;
- (BOOL)isExpanded;
- (BOOL)isSelectable;
- (BOOL)isShowingExpanded;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (MUExpandingLabel)init;
- (MUExpandingLabel)initWithCoder:(id)a3;
- (MUExpandingLabel)initWithFrame:(CGRect)a3;
- (NSAttributedString)attributedText;
- (NSString)showLessText;
- (NSString)showMoreText;
- (NSString)text;
- (UIColor)showLessTextColor;
- (UIColor)showMoreTextColor;
- (UIColor)textColor;
- (UIFont)font;
- (UIFont)showLessFont;
- (UIFont)showMoreFont;
- (id)_showLessTextSeparator;
- (id)labelResizedBlock;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (int64_t)textAlignment;
- (unint64_t)numberOfLinesWhenCollapsed;
- (void)_expand;
- (void)_mkExpandingLabelComonInit;
- (void)_setExpansionMode:(unint64_t)a3;
- (void)_setTextExclusionPath;
- (void)infoCardThemeChanged;
- (void)layoutSubviews;
- (void)setAllowLessText:(BOOL)a3;
- (void)setAttributedText:(id)a3;
- (void)setEditable:(BOOL)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setFont:(id)a3;
- (void)setLabelResizedBlock:(id)a3;
- (void)setNumberOfLinesWhenCollapsed:(unint64_t)a3;
- (void)setSelectable:(BOOL)a3;
- (void)setShowLessFont:(id)a3;
- (void)setShowLessText:(id)a3;
- (void)setShowLessTextColor:(id)a3;
- (void)setShowMoreFont:(id)a3;
- (void)setShowMoreText:(id)a3;
- (void)setShowMoreTextColor:(id)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextColor:(id)a3;
@end

@implementation MUExpandingLabel

- (void)_mkExpandingLabelComonInit
{
  v40[2] = *MEMORY[0x1E4F143B8];
  self->_expansionMode = 0;
  self->_numberOfLinesWhenCollapsed = 10;
  id v3 = objc_alloc(MEMORY[0x1E4FB0880]);
  v4 = (NSTextContainer *)objc_msgSend(v3, "initWithSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  textContainer = self->_textContainer;
  self->_textContainer = v4;

  [(NSTextContainer *)self->_textContainer setLineBreakMode:4];
  [(NSTextContainer *)self->_textContainer setLineFragmentPadding:0.0];
  [(NSTextContainer *)self->_textContainer setMaximumNumberOfLines:self->_numberOfLinesWhenCollapsed];
  [(NSTextContainer *)self->_textContainer setHeightTracksTextView:1];
  [(NSTextContainer *)self->_textContainer setWidthTracksTextView:1];
  v6 = (NSLayoutManager *)objc_alloc_init(MEMORY[0x1E4FB0840]);
  textLayoutManager = self->_textLayoutManager;
  self->_textLayoutManager = v6;

  [(NSLayoutManager *)self->_textLayoutManager addTextContainer:self->_textContainer];
  v8 = (NSTextStorage *)objc_alloc_init(MEMORY[0x1E4FB08B8]);
  textStorage = self->_textStorage;
  self->_textStorage = v8;

  [(NSTextStorage *)self->_textStorage addLayoutManager:self->_textLayoutManager];
  id v10 = objc_alloc(MEMORY[0x1E4FB1DD8]);
  double v11 = *MEMORY[0x1E4F1DB28];
  double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v15 = (UITextView *)objc_msgSend(v10, "initWithFrame:textContainer:", self->_textContainer, *MEMORY[0x1E4F1DB28], v12, v13, v14);
  textView = self->_textView;
  self->_textView = v15;

  [(UITextView *)self->_textView setScrollEnabled:0];
  [(UITextView *)self->_textView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITextView *)self->_textView setEditable:0];
  -[UITextView setTextContainerInset:](self->_textView, "setTextContainerInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  v17 = [MEMORY[0x1E4FB1618] clearColor];
  [(UITextView *)self->_textView setBackgroundColor:v17];

  [(UITextView *)self->_textView setShowsVerticalScrollIndicator:0];
  [(UITextView *)self->_textView setShowsHorizontalScrollIndicator:0];
  v18 = [MEMORY[0x1E4F30EA8] sharedManager];
  v19 = [v18 subtitleFont];
  [(UITextView *)self->_textView setFont:v19];

  [(UITextView *)self->_textView setTextAlignment:4];
  [(UITextView *)self->_textView setDelegate:self];
  [(UITextView *)self->_textView setSelectable:1];
  [(UITextView *)self->_textView setAccessibilityIdentifier:@"ExpandingLabelTextView"];
  [(MUExpandingLabel *)self addSubview:self->_textView];
  v20 = (UIButton *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB14D0]), "initWithFrame:", v11, v12, v13, v14);
  showMoreButton = self->_showMoreButton;
  self->_showMoreButton = v20;

  [(UIButton *)self->_showMoreButton setPreferredBehavioralStyle:1];
  objc_initWeak(&location, self);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __46__MUExpandingLabel__mkExpandingLabelComonInit__block_invoke;
  v37[3] = &unk_1E574FBF0;
  objc_copyWeak(&v38, &location);
  [(UIButton *)self->_showMoreButton setConfigurationUpdateHandler:v37];
  [(UIButton *)self->_showMoreButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_showMoreButton setAccessibilityIdentifier:@"ExpandingLabelMoreButton"];
  v22 = [(UIButton *)self->_showMoreButton titleLabel];
  [v22 setAdjustsFontForContentSizeCategory:1];

  [(MUExpandingLabel *)self setShowMoreText:0];
  [(MUExpandingLabel *)self setShowMoreFont:0];
  [(MUExpandingLabel *)self setShowLessFont:0];
  [(MUExpandingLabel *)self setShowLessText:0];
  [(MUExpandingLabel *)self addSubview:self->_showMoreButton];
  [(UIButton *)self->_showMoreButton addTarget:self action:sel__expand forControlEvents:64];
  v23 = _NSDictionaryOfVariableBindings(&cfstr_TextviewShowmo.isa, self->_textView, self->_showMoreButton, 0);
  v24 = (void *)MEMORY[0x1E4F28DC8];
  v25 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-0-[_textView]-0-|" options:0 metrics:0 views:v23];
  [v24 activateConstraints:v25];

  v26 = (void *)MEMORY[0x1E4F28DC8];
  v27 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|-0-[_textView]-0-|" options:0 metrics:0 views:v23];
  [v26 activateConstraints:v27];

  v28 = (void *)MEMORY[0x1E4F28DC8];
  v29 = [(UIButton *)self->_showMoreButton firstBaselineAnchor];
  v30 = [(UITextView *)self->_textView lastBaselineAnchor];
  v31 = [v29 constraintEqualToAnchor:v30];
  v40[0] = v31;
  v32 = [(UIButton *)self->_showMoreButton titleLabel];
  v33 = [v32 trailingAnchor];
  v34 = [(MUExpandingLabel *)self trailingAnchor];
  v35 = [v33 constraintEqualToAnchor:v34];
  v40[1] = v35;
  v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
  [v28 activateConstraints:v36];

  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);
}

void __46__MUExpandingLabel__mkExpandingLabelComonInit__block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = objc_msgSend(MEMORY[0x1E4FB14D8], "_mapsui_textButtonConfigurationWithFont:textColor:", WeakRetained[57], WeakRetained[63]);
    objc_msgSend(v4, "setContentInsets:", 20.0, 20.0, 20.0, 20.0);
    v5 = [WeakRetained showMoreText];

    if (v5)
    {
      v6 = [WeakRetained showMoreText];
      [v4 setTitle:v6];
    }
    v7 = [WeakRetained showMoreFont];

    if (v7)
    {
      v8 = [WeakRetained showMoreFont];
      v9 = [v10 titleLabel];
      [v9 setFont:v8];
    }
    [v10 setConfiguration:v4];
  }
}

- (MUExpandingLabel)init
{
  v5.receiver = self;
  v5.super_class = (Class)MUExpandingLabel;
  v2 = [(MUExpandingLabel *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(MUExpandingLabel *)v2 _mkExpandingLabelComonInit];
  }
  return v3;
}

- (MUExpandingLabel)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MUExpandingLabel;
  id v3 = [(MUExpandingLabel *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(MUExpandingLabel *)v3 _mkExpandingLabelComonInit];
  }
  return v4;
}

- (MUExpandingLabel)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MUExpandingLabel;
  id v3 = -[MUExpandingLabel initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(MUExpandingLabel *)v3 _mkExpandingLabelComonInit];
  }
  return v4;
}

- (void)infoCardThemeChanged
{
  v3.receiver = self;
  v3.super_class = (Class)MUExpandingLabel;
  [(MUExpandingLabel *)&v3 infoCardThemeChanged];
  if (!self->_showMoreTextColor) {
    [(UIButton *)self->_showMoreButton setNeedsUpdateConfiguration];
  }
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  return [(UITextView *)self->_textView text];
}

- (void)setAttributedText:(id)a3
{
}

- (NSAttributedString)attributedText
{
  return [(UITextView *)self->_textView attributedText];
}

- (void)setFont:(id)a3
{
}

- (UIFont)font
{
  return [(UITextView *)self->_textView font];
}

- (void)setTextColor:(id)a3
{
}

- (UIColor)textColor
{
  return [(UITextView *)self->_textView textColor];
}

- (int64_t)textAlignment
{
  return [(UITextView *)self->_textView textAlignment];
}

- (void)setTextAlignment:(int64_t)a3
{
}

- (void)setNumberOfLinesWhenCollapsed:(unint64_t)a3
{
  if (self->_numberOfLinesWhenCollapsed != a3)
  {
    unint64_t v4 = 10;
    if (a3) {
      unint64_t v4 = a3;
    }
    self->_unint64_t numberOfLinesWhenCollapsed = v4;
    if ([(MUExpandingLabel *)self isShowingExpanded]) {
      unint64_t numberOfLinesWhenCollapsed = 0;
    }
    else {
      unint64_t numberOfLinesWhenCollapsed = self->_numberOfLinesWhenCollapsed;
    }
    [(NSTextContainer *)self->_textContainer setMaximumNumberOfLines:numberOfLinesWhenCollapsed];
    [(MUExpandingLabel *)self setNeedsLayout];
  }
}

- (void)setShowMoreText:(id)a3
{
  objc_super v5 = (NSString *)a3;
  if (self->_showMoreText != v5 || ![(NSString *)v5 isEqualToString:v5])
  {
    objc_storeStrong((id *)&self->_showMoreText, a3);
    [(UIButton *)self->_showMoreButton setNeedsUpdateConfiguration];
    [(MUExpandingLabel *)self setNeedsLayout];
  }
}

- (NSString)showMoreText
{
  showMoreText = self->_showMoreText;
  if (showMoreText)
  {
    objc_super v3 = showMoreText;
  }
  else
  {
    _MULocalizedStringFromThisBundle(@"More▼ [Expandable Label");
    objc_super v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)setShowMoreFont:(id)a3
{
  objc_super v5 = (UIFont *)a3;
  p_showMoreFont = &self->_showMoreFont;
  if (self->_showMoreFont != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_showMoreFont, a3);
    [(UIButton *)self->_showMoreButton setNeedsUpdateConfiguration];
    p_showMoreFont = (UIFont **)[(MUExpandingLabel *)self setNeedsLayout];
    objc_super v5 = v7;
  }
  MEMORY[0x1F41817F8](p_showMoreFont, v5);
}

- (UIFont)showMoreFont
{
  showMoreFont = self->_showMoreFont;
  if (showMoreFont)
  {
    objc_super v3 = showMoreFont;
  }
  else
  {
    unint64_t v4 = [MEMORY[0x1E4F30EA8] sharedManager];
    objc_super v3 = [v4 subtitleFont];
  }
  return v3;
}

- (void)setShowMoreTextColor:(id)a3
{
  objc_super v5 = (UIColor *)a3;
  p_showMoreTextColor = &self->_showMoreTextColor;
  if (self->_showMoreTextColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_showMoreTextColor, a3);
    p_showMoreTextColor = (UIColor **)[(UIButton *)self->_showMoreButton setNeedsUpdateConfiguration];
    objc_super v5 = v7;
  }
  MEMORY[0x1F41817F8](p_showMoreTextColor, v5);
}

- (UIColor)showMoreTextColor
{
  showMoreTextColor = self->_showMoreTextColor;
  if (showMoreTextColor)
  {
    objc_super v3 = showMoreTextColor;
  }
  else
  {
    objc_super v3 = [MEMORY[0x1E4FB1618] labelColor];
  }
  return v3;
}

- (void)setShowLessTextColor:(id)a3
{
  objc_super v5 = (UIColor *)a3;
  p_showLessTextColor = &self->_showLessTextColor;
  if (self->_showLessTextColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_showLessTextColor, a3);
    objc_super v5 = v7;
  }
  MEMORY[0x1F41817F8](p_showLessTextColor, v5);
}

- (UIColor)showLessTextColor
{
  showLessTextColor = self->_showLessTextColor;
  if (showLessTextColor)
  {
    objc_super v3 = showLessTextColor;
  }
  else
  {
    unint64_t v4 = [(MUExpandingLabel *)self mk_theme];
    objc_super v3 = [v4 lightTextColor];
  }
  return v3;
}

- (void)setShowLessText:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (!v4)
  {
    _MULocalizedStringFromThisBundle(@"Less [Expanding Label]");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)&self->_showLessText, v4);
  objc_super v5 = v6;
  if (!v6)
  {

    objc_super v5 = 0;
  }
}

- (NSString)showLessText
{
  return self->_showLessText;
}

- (void)setShowLessFont:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    objc_super v3 = [MEMORY[0x1E4F30EA8] sharedManager];
    id v5 = [v3 subtitleFont];
  }
  objc_storeStrong((id *)&self->_showLessFont, v5);
  id v6 = v7;
  if (!v7)
  {

    id v6 = 0;
  }
}

- (UIFont)showLessFont
{
  return self->_showLessFont;
}

- (void)setEditable:(BOOL)a3
{
}

- (BOOL)isEditable
{
  return [(UITextView *)self->_textView isEditable];
}

- (void)setSelectable:(BOOL)a3
{
}

- (BOOL)isSelectable
{
  return [(UITextView *)self->_textView isSelectable];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)MUExpandingLabel;
  [(MUExpandingLabel *)&v4 layoutSubviews];
  if (!self->_isPerformingLayout)
  {
    self->_isPerformingLayout = 1;
    if (self->_expansionMode == 2
      || (BOOL v3 = [(MUExpandingLabel *)self isShowingExpanded],
          [(MUExpandingLabel *)self _setExpansionMode:[(MUExpandingLabel *)self _canShowAllText]], v3 == [(MUExpandingLabel *)self isShowingExpanded]))
    {
      [(MUExpandingLabel *)self _setTextExclusionPath];
    }
    self->_isPerformingLayout = 0;
  }
}

- (void)_setTextExclusionPath
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if ([(MUExpandingLabel *)self isShowingExpanded])
  {
    textContainer = self->_textContainer;
    uint64_t v4 = MEMORY[0x1E4F1CBF0];
    [(NSTextContainer *)textContainer setExclusionPaths:v4];
  }
  else
  {
    id v5 = [(UIButton *)self->_showMoreButton titleLabel];
    [v5 frame];
    -[MUExpandingLabel convertRect:fromView:](self, "convertRect:fromView:", self->_showMoreButton);
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;

    v19.origin.x = v7;
    v19.origin.y = v9;
    v19.size.width = v11;
    v19.size.height = v13;
    CGRect v20 = CGRectInset(v19, -5.0, 0.0);
    double v14 = (void *)MEMORY[0x1E4FB14C0];
    CGRect v21 = CGRectIntegral(v20);
    v15 = objc_msgSend(v14, "bezierPathWithRect:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
    v17[0] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    [(NSTextContainer *)self->_textContainer setExclusionPaths:v16];
  }
}

- (void)_expand
{
}

- (void)setExpanded:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 0;
  }
  [(MUExpandingLabel *)self _setExpansionMode:v3];
}

- (BOOL)isExpanded
{
  return self->_expansionMode == 2;
}

- (void)_setExpansionMode:(unint64_t)a3
{
  v33[2] = *MEMORY[0x1E4F143B8];
  if (self->_expansionMode != a3)
  {
    BOOL v5 = [(MUExpandingLabel *)self isShowingExpanded];
    self->_expansionMode = a3;
    BOOL v6 = [(MUExpandingLabel *)self isShowingExpanded];
    if (v5 != v6)
    {
      BOOL v7 = v6;
      [(UIButton *)self->_showMoreButton setHidden:v6];
      if (v7 && [(MUExpandingLabel *)self _canShowLess])
      {
        v32[0] = *MEMORY[0x1E4FB06F8];
        double v8 = [(MUExpandingLabel *)self showLessFont];
        v33[0] = v8;
        v32[1] = *MEMORY[0x1E4FB0700];
        CGFloat v9 = [(MUExpandingLabel *)self showLessTextColor];
        v33[1] = v9;
        double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];

        CGFloat v11 = [(MUExpandingLabel *)self attributedText];
        double v12 = (void *)[v11 mutableCopy];

        id v13 = objc_alloc(MEMORY[0x1E4F28B18]);
        double v14 = [(MUExpandingLabel *)self _showLessTextSeparator];
        v15 = (void *)[v13 initWithString:v14];
        [v12 appendAttributedString:v15];

        id v16 = objc_alloc(MEMORY[0x1E4F28E48]);
        v17 = [(MUExpandingLabel *)self showLessText];
        v18 = (void *)[v16 initWithString:v17 attributes:v10];

        uint64_t v19 = *MEMORY[0x1E4FB0720];
        CGRect v20 = objc_opt_new();
        objc_msgSend(v18, "addAttribute:value:range:", v19, v20, 0, objc_msgSend(v18, "length"));

        [(UITextView *)self->_textView setLinkTextAttributes:v10];
        [v12 appendAttributedString:v18];
        [(MUExpandingLabel *)self setAttributedText:v12];
      }
      else
      {
        if (v5 && [(MUExpandingLabel *)self allowLessText])
        {
          CGRect v21 = [(MUExpandingLabel *)self attributedText];
          v22 = (void *)[v21 mutableCopy];

          v23 = [(MUExpandingLabel *)self _showLessTextSeparator];
          uint64_t v24 = [v23 length];
          v25 = [(MUExpandingLabel *)self showLessText];
          uint64_t v26 = [v25 length] + v24;

          v27 = [(MUExpandingLabel *)self attributedText];
          v28 = [v27 string];
          uint64_t v29 = [v28 length] - v26;

          objc_msgSend(v22, "deleteCharactersInRange:", v29, v26);
          [(MUExpandingLabel *)self setAttributedText:v22];
        }
        if (!v7)
        {
          unint64_t numberOfLinesWhenCollapsed = self->_numberOfLinesWhenCollapsed;
LABEL_12:
          [(NSTextContainer *)self->_textContainer setMaximumNumberOfLines:numberOfLinesWhenCollapsed];
          [(NSTextContainer *)self->_textContainer setExclusionPaths:MEMORY[0x1E4F1CBF0]];
          [(UITextView *)self->_textView invalidateIntrinsicContentSize];
          [(MUExpandingLabel *)self setNeedsLayout];
          labelResizedBlock = (void (**)(void))self->_labelResizedBlock;
          if (labelResizedBlock) {
            labelResizedBlock[2]();
          }
          return;
        }
      }
      unint64_t numberOfLinesWhenCollapsed = 0;
      goto LABEL_12;
    }
  }
}

- (BOOL)isShowingExpanded
{
  return self->_expansionMode != 0;
}

- (BOOL)_isShowingUserExpanded
{
  return self->_expansionMode == 2;
}

- (BOOL)_canShowLess
{
  BOOL v3 = [(MUExpandingLabel *)self _isShowingUserExpanded];
  if (v3)
  {
    LOBYTE(v3) = [(MUExpandingLabel *)self allowLessText];
  }
  return v3;
}

- (BOOL)_canShowAllText
{
  NSUInteger v3 = [(NSLayoutManager *)self->_textLayoutManager numberOfGlyphs];
  if (!v3) {
    return 1;
  }
  NSUInteger v4 = v3;
  BOOL v5 = [(NSTextContainer *)self->_textContainer exclusionPaths];
  [(NSTextContainer *)self->_textContainer setExclusionPaths:MEMORY[0x1E4F1CBF0]];
  [(NSLayoutManager *)self->_textLayoutManager glyphRangeForTextContainer:self->_textContainer];
  BOOL v7 = v6 >= v4
    && [(NSLayoutManager *)self->_textLayoutManager truncatedGlyphRangeInLineFragmentForGlyphAtIndex:v4 - 1] == 0x7FFFFFFFFFFFFFFFLL&& v8 < 0x14;
  [(NSTextContainer *)self->_textContainer setExclusionPaths:v5];

  return v7;
}

- (id)_showLessTextSeparator
{
  return _MULocalizedStringFromThisBundle(@"Expandable label separator");
}

- (id)viewForFirstBaselineLayout
{
  return (id)[(UITextView *)self->_textView viewForFirstBaselineLayout];
}

- (id)viewForLastBaselineLayout
{
  return (id)[(UITextView *)self->_textView viewForLastBaselineLayout];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  return 0;
}

- (unint64_t)numberOfLinesWhenCollapsed
{
  return self->_numberOfLinesWhenCollapsed;
}

- (id)labelResizedBlock
{
  return self->_labelResizedBlock;
}

- (void)setLabelResizedBlock:(id)a3
{
}

- (BOOL)allowLessText
{
  return self->_allowLessText;
}

- (void)setAllowLessText:(BOOL)a3
{
  self->_allowLessText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_labelResizedBlock, 0);
  objc_storeStrong((id *)&self->_showLessTextColor, 0);
  objc_storeStrong((id *)&self->_showMoreTextColor, 0);
  objc_storeStrong((id *)&self->_showMoreTapRecognizer, 0);
  objc_storeStrong((id *)&self->_showLessFont, 0);
  objc_storeStrong((id *)&self->_showLessText, 0);
  objc_storeStrong((id *)&self->_showMoreText, 0);
  objc_storeStrong((id *)&self->_showMoreFont, 0);
  objc_storeStrong((id *)&self->_showMoreButton, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_textLayoutManager, 0);
  objc_storeStrong((id *)&self->_textStorage, 0);
  objc_storeStrong((id *)&self->_textContainer, 0);
}

@end