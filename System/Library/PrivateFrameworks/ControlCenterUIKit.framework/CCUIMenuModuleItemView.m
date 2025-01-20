@interface CCUIMenuModuleItemView
+ (BOOL)_shouldLimitContentSizeCategory:(id)a3 forceLimitContentSizeCategory:(BOOL)a4;
+ (double)defaultMenuItemHeightForContentSizeCategory:(id)a3;
+ (id)_preferredFontForTextStyle:(id)a3 hiFontStyle:(int64_t)a4 contentSizeCategory:(id)a5 shouldLimitContentSizeCategory:(BOOL)a6;
+ (id)_subtitleFontForContentSizeCategory:(id)a3;
+ (id)_subtitleFontForContentSizeCategory:(id)a3 shouldLimitContentSizeCategory:(BOOL)a4;
+ (id)_titleFontForContentSizeCategory:(id)a3;
+ (id)_titleFontForContentSizeCategory:(id)a3 shouldLimitContentSizeCategory:(BOOL)a4;
- (BOOL)_shouldHorizontallyCenterText;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)separatorVisible;
- (BOOL)shouldLimitContentSizeCategory;
- (BOOL)useTallLayout;
- (BOOL)useTrailingCheckmarkLayout;
- (BOOL)useTrailingInset;
- (CCUIMenuModuleItem)menuItem;
- (CCUIMenuModuleItemView)initWithMenuItem:(id)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSDirectionalEdgeInsets)_labelInsets;
- (UIView)leadingView;
- (UIView)trailingView;
- (double)_labelLeadingInset;
- (double)_labelTrailingInset;
- (double)_separatorHeight;
- (double)_textHeightForEmojiLabel:(id)a3 width:(double)a4;
- (double)_titleBaselineToBottom;
- (double)_titleBaselineToTop;
- (double)_trailingWidthForCustomViews;
- (double)preferredMaxLayoutWidth;
- (id)_subtitleFont;
- (id)_titleFont;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)subtitle;
- (id)title;
- (unint64_t)hash;
- (unint64_t)indentation;
- (void)_contentSizeCategoryDidChange;
- (void)_layoutLeadingCustomView;
- (void)_layoutTrailingCustomViews;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_setSubtitle:(id)a3;
- (void)_setTitle:(id)a3;
- (void)_stopAutomaticallyUpdatingView:(id)a3 recursivelyIfNeeded:(BOOL)a4;
- (void)_updateForStateChange;
- (void)_updateVisualStyleOfView:(id)a3 withStyle:(int64_t)a4 recursivelyIfNeeded:(BOOL)a5;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIndentation:(unint64_t)a3;
- (void)setLeadingView:(id)a3;
- (void)setMenuItem:(id)a3;
- (void)setPreferredMaxLayoutWidth:(double)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSeparatorVisible:(BOOL)a3;
- (void)setShouldLimitContentSizeCategory:(BOOL)a3;
- (void)setTrailingView:(id)a3;
- (void)setUseTallLayout:(BOOL)a3;
- (void)setUseTrailingCheckmarkLayout:(BOOL)a3;
- (void)setUseTrailingInset:(BOOL)a3;
- (void)updateSubviewsAlpha:(double)a3;
@end

@implementation CCUIMenuModuleItemView

+ (BOOL)_shouldLimitContentSizeCategory:(id)a3 forceLimitContentSizeCategory:(BOOL)a4
{
  v5 = (NSString *)a3;
  BOOL v6 = (a4 || (unint64_t)([(id)*MEMORY[0x1E4FB2608] activeInterfaceOrientation] - 3) <= 1)
    && UIContentSizeCategoryCompareToCategory(v5, (UIContentSizeCategory)*MEMORY[0x1E4FB2790]) == NSOrderedDescending;

  return v6;
}

+ (id)_preferredFontForTextStyle:(id)a3 hiFontStyle:(int64_t)a4 contentSizeCategory:(id)a5 shouldLimitContentSizeCategory:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a5;
  if ([a1 _shouldLimitContentSizeCategory:v11 forceLimitContentSizeCategory:v6])
  {
    id v12 = (id)*MEMORY[0x1E4FB2790];

    id v11 = v12;
  }
  v13 = objc_msgSend(MEMORY[0x1E4FB08E0], "bsui_preferredFontForTextStyle:hiFontStyle:contentSizeCategory:", v10, a4, v11);

  return v13;
}

+ (id)_titleFontForContentSizeCategory:(id)a3
{
  return (id)[a1 _titleFontForContentSizeCategory:a3 shouldLimitContentSizeCategory:0];
}

+ (id)_titleFontForContentSizeCategory:(id)a3 shouldLimitContentSizeCategory:(BOOL)a4
{
  return (id)[a1 _preferredFontForTextStyle:*MEMORY[0x1E4FB28C8] hiFontStyle:8 contentSizeCategory:a3 shouldLimitContentSizeCategory:a4];
}

+ (id)_subtitleFontForContentSizeCategory:(id)a3
{
  return (id)[a1 _subtitleFontForContentSizeCategory:a3 shouldLimitContentSizeCategory:0];
}

+ (id)_subtitleFontForContentSizeCategory:(id)a3 shouldLimitContentSizeCategory:(BOOL)a4
{
  return (id)[a1 _preferredFontForTextStyle:*MEMORY[0x1E4FB2950] hiFontStyle:8 contentSizeCategory:a3 shouldLimitContentSizeCategory:a4];
}

+ (double)defaultMenuItemHeightForContentSizeCategory:(id)a3
{
  v3 = [a1 _titleFontForContentSizeCategory:a3];
  [v3 _scaledValueForValue:52.0];
  double v5 = v4;

  return v5;
}

- (CCUIMenuModuleItemView)initWithMenuItem:(id)a3
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CCUIMenuModuleItemView;
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  id v10 = -[CCUIMenuModuleItemView initWithFrame:](&v35, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v7, v8, v9);
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_menuItem, a3);
    uint64_t v12 = +[CCUIControlCenterMaterialView _tertiaryView];
    highlightedBackgroundView = v11->_highlightedBackgroundView;
    v11->_highlightedBackgroundView = (UIView *)v12;

    [(UIView *)v11->_highlightedBackgroundView setAutoresizingMask:18];
    [(UIView *)v11->_highlightedBackgroundView setAlpha:0.0];
    [(CCUIMenuModuleItemView *)v11 addSubview:v11->_highlightedBackgroundView];
    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F4F8B0]), "initWithFrame:", v6, v7, v8, v9);
    titleLabel = v11->_titleLabel;
    v11->_titleLabel = (BSUIEmojiLabelView *)v14;

    [(CCUIMenuModuleItemView *)v11 addSubview:v11->_titleLabel];
    v16 = v11->_titleLabel;
    v17 = [(CCUIMenuModuleItemView *)v11 _titleFont];
    [(BSUIEmojiLabelView *)v16 setFont:v17];

    [(BSUIEmojiLabelView *)v11->_titleLabel setUserInteractionEnabled:0];
    v18 = v11->_titleLabel;
    v19 = [v5 title];
    [(BSUIEmojiLabelView *)v18 setText:v19];

    [(BSUIEmojiLabelView *)v11->_titleLabel setNumberOfLines:0];
    uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F4F8B0]), "initWithFrame:", v6, v7, v8, v9);
    subtitleLabel = v11->_subtitleLabel;
    v11->_subtitleLabel = (BSUIEmojiLabelView *)v20;

    [(CCUIMenuModuleItemView *)v11 addSubview:v11->_subtitleLabel];
    v22 = v11->_subtitleLabel;
    v23 = [(CCUIMenuModuleItemView *)v11 _subtitleFont];
    [(BSUIEmojiLabelView *)v22 setFont:v23];

    [(BSUIEmojiLabelView *)v11->_subtitleLabel setUserInteractionEnabled:0];
    v24 = v11->_subtitleLabel;
    v25 = [v5 subtitle];
    [(BSUIEmojiLabelView *)v24 setText:v25];

    [(BSUIEmojiLabelView *)v11->_subtitleLabel setNumberOfLines:0];
    v11->_separatorVisible = 0;
    v26 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    separatorView = v11->_separatorView;
    v11->_separatorView = v26;

    [(CCUIMenuModuleItemView *)v11 addSubview:v11->_separatorView];
    v28 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v29 = [v28 userInterfaceIdiom];

    if (v29 == 1)
    {
      v30 = (void *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v11];
      [(CCUIMenuModuleItemView *)v11 addInteraction:v30];
    }
    v31 = self;
    v36[0] = v31;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
    id v33 = (id)[(CCUIMenuModuleItemView *)v11 registerForTraitChanges:v32 withAction:sel__contentSizeCategoryDidChange];
  }
  return v11;
}

- (void)setMenuItem:(id)a3
{
  double v4 = (CCUIMenuModuleItem *)a3;
  id v5 = [(CCUIMenuModuleItem *)v4 title];
  [(CCUIMenuModuleItemView *)self _setTitle:v5];

  double v6 = [(CCUIMenuModuleItem *)v4 subtitle];
  [(CCUIMenuModuleItemView *)self _setSubtitle:v6];

  menuItem = self->_menuItem;
  self->_menuItem = v4;
}

- (void)_setTitle:(id)a3
{
  id v6 = a3;
  double v4 = [(CCUIMenuModuleItem *)self->_menuItem title];
  char v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    [(BSUIEmojiLabelView *)self->_titleLabel setText:v6];
    [(BSUIEmojiLabelView *)self->_titleLabel pl_performCrossFadeIfNecessary];
    [(CCUIMenuModuleItemView *)self invalidateIntrinsicContentSize];
  }
}

- (void)_setSubtitle:(id)a3
{
  id v9 = a3;
  double v4 = [(CCUIMenuModuleItem *)self->_menuItem subtitle];
  char v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    [(BSUIEmojiLabelView *)self->_subtitleLabel setText:v9];
    [(BSUIEmojiLabelView *)self->_subtitleLabel pl_performCrossFadeIfNecessary];
    [(CCUIMenuModuleItemView *)self invalidateIntrinsicContentSize];
  }
  subtitleLabel = self->_subtitleLabel;
  uint64_t v7 = [v9 length];
  double v8 = 1.0;
  if (!v7) {
    double v8 = 0.0;
  }
  [(BSUIEmojiLabelView *)subtitleLabel setAlpha:v8];
}

- (void)setLeadingView:(id)a3
{
  char v5 = (UIView *)a3;
  leadingView = self->_leadingView;
  if (leadingView != v5)
  {
    if (leadingView)
    {
      [(UIView *)leadingView removeFromSuperview];
      [(CCUIMenuModuleItemView *)self _stopAutomaticallyUpdatingView:self->_leadingView recursivelyIfNeeded:1];
    }
    objc_storeStrong((id *)&self->_leadingView, a3);
    if (v5)
    {
      [(CCUIMenuModuleItemView *)self addSubview:v5];
      [(CCUIMenuModuleItemView *)self _updateVisualStyleOfView:v5 withStyle:0 recursivelyIfNeeded:1];
    }
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41__CCUIMenuModuleItemView_setLeadingView___block_invoke;
    v7[3] = &unk_1E6AD41E8;
    v7[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v7];
  }
}

uint64_t __41__CCUIMenuModuleItemView_setLeadingView___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutLeadingCustomView];
}

- (void)setTrailingView:(id)a3
{
  char v5 = (UIView *)a3;
  trailingView = self->_trailingView;
  if (trailingView != v5)
  {
    if (trailingView)
    {
      [(UIView *)trailingView removeFromSuperview];
      [(CCUIMenuModuleItemView *)self _stopAutomaticallyUpdatingView:self->_trailingView recursivelyIfNeeded:1];
    }
    objc_storeStrong((id *)&self->_trailingView, a3);
    if (v5)
    {
      [(CCUIMenuModuleItemView *)self addSubview:v5];
      [(CCUIMenuModuleItemView *)self _updateVisualStyleOfView:v5 withStyle:0 recursivelyIfNeeded:1];
    }
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__CCUIMenuModuleItemView_setTrailingView___block_invoke;
    v7[3] = &unk_1E6AD41E8;
    v7[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v7];
  }
}

uint64_t __42__CCUIMenuModuleItemView_setTrailingView___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutTrailingCustomViews];
}

- (void)setShouldLimitContentSizeCategory:(BOOL)a3
{
  if (self->_shouldLimitContentSizeCategory != a3)
  {
    self->_shouldLimitContentSizeCategory = a3;
    [(CCUIMenuModuleItemView *)self setNeedsLayout];
  }
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (CCUIMenuModuleItemView *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v5 = v4;
      id v6 = [(CCUIMenuModuleItemView *)self menuItem];
      uint64_t v7 = [(CCUIMenuModuleItemView *)v5 menuItem];

      char v8 = BSEqualObjects();
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  double v4 = [(CCUIMenuModuleItemView *)self menuItem];
  id v5 = (id)[v3 appendObject:v4];

  unint64_t v6 = [v3 hash];
  return v6;
}

- (id)title
{
  return (id)[(BSUIEmojiLabelView *)self->_titleLabel text];
}

- (id)subtitle
{
  return (id)[(BSUIEmojiLabelView *)self->_subtitleLabel text];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  [(CCUIMenuModuleItemView *)self _labelInsets];
  double v7 = width - v5 - v6;
  [(CCUIMenuModuleItemView *)self _textHeightForEmojiLabel:self->_titleLabel width:v7];
  double v9 = v8;
  [(CCUIMenuModuleItemView *)self _textHeightForEmojiLabel:self->_subtitleLabel width:v7];
  double v11 = v10;
  uint64_t v12 = [(BSUIEmojiLabelView *)self->_titleLabel font];
  [(CCUIMenuModuleItemView *)self _titleBaselineToTop];
  objc_msgSend(v12, "_scaledValueForValue:");
  double v14 = v11 + v9 + v13;
  [(CCUIMenuModuleItemView *)self _titleBaselineToBottom];
  objc_msgSend(v12, "_scaledValueForValue:");
  double v16 = v14 + v15;

  double v17 = width;
  double v18 = v16;
  result.height = v18;
  result.double width = v17;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(CCUIMenuModuleItemView *)self preferredMaxLayoutWidth];
  -[CCUIMenuModuleItemView sizeThatFits:](self, "sizeThatFits:");
  result.height = v4;
  result.double width = v3;
  return result;
}

- (void)layoutSubviews
{
  v48.receiver = self;
  v48.super_class = (Class)CCUIMenuModuleItemView;
  [(CCUIMenuModuleItemView *)&v48 layoutSubviews];
  titleLabel = self->_titleLabel;
  double v4 = [(CCUIMenuModuleItemView *)self _titleFont];
  [(BSUIEmojiLabelView *)titleLabel setFont:v4];

  subtitleLabel = self->_subtitleLabel;
  double v6 = [(CCUIMenuModuleItemView *)self _subtitleFont];
  [(BSUIEmojiLabelView *)subtitleLabel setFont:v6];

  [(CCUIMenuModuleItemView *)self _layoutLeadingCustomView];
  [(CCUIMenuModuleItemView *)self _layoutTrailingCustomViews];
  [(CCUIMenuModuleItemView *)self bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  LODWORD(subtitleLabel) = [(CCUIMenuModuleItemView *)self _shouldReverseLayoutDirection];
  [(CCUIMenuModuleItemView *)self _labelInsets];
  double v16 = v15;
  double v18 = v17;
  v49.origin.x = v8;
  v49.origin.y = v10;
  v49.size.double width = v12;
  v49.size.height = v14;
  CGFloat v19 = CGRectGetWidth(v49) - v16 - v18;
  v50.origin.x = v8;
  v50.origin.y = v10;
  v50.size.double width = v12;
  v50.size.height = v14;
  -[BSUIEmojiLabelView sizeThatFits:](self->_titleLabel, "sizeThatFits:", v19, CGRectGetHeight(v50));
  CGFloat v21 = v20;
  double v47 = v16;
  if (subtitleLabel)
  {
    double v16 = v18;
    uint64_t v22 = 2;
  }
  else
  {
    uint64_t v22 = 0;
  }
  UIRectCenteredYInRect();
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  double v28 = v27;
  double v30 = v29;
  v31 = [(BSUIEmojiLabelView *)self->_titleLabel font];
  [(CCUIMenuModuleItemView *)self _titleBaselineToTop];
  objc_msgSend(v31, "_scaledValueForValue:");
  double v33 = v32;
  [(BSUIEmojiLabelView *)self->_titleLabel _firstLineBaselineOffsetFromBoundsTop];
  double v35 = v33 - v34;

  v51.origin.x = v24;
  v51.origin.y = v26;
  v51.size.double width = v28;
  v51.size.height = v30;
  double Width = CGRectGetWidth(v51);
  v37 = [(BSUIEmojiLabelView *)self->_subtitleLabel text];
  uint64_t v38 = [v37 length];

  if (v38) {
    double v39 = Width;
  }
  else {
    double v39 = v28;
  }
  if (v38) {
    double v40 = v35;
  }
  else {
    double v40 = v26;
  }
  if (v38) {
    double v41 = v16;
  }
  else {
    double v41 = v24;
  }
  if (v38) {
    double v42 = v21;
  }
  else {
    double v42 = v30;
  }
  -[BSUIEmojiLabelView setFrame:](self->_titleLabel, "setFrame:", v41, v40, v39, v42, *(void *)&v47);
  if ([(CCUIMenuModuleItemView *)self _shouldHorizontallyCenterText]) {
    uint64_t v43 = 1;
  }
  else {
    uint64_t v43 = v22;
  }
  [(BSUIEmojiLabelView *)self->_titleLabel setTextAlignment:v43];
  v52.origin.x = v16;
  v52.origin.y = v35;
  v52.size.double width = Width;
  v52.size.height = v21;
  double MaxY = CGRectGetMaxY(v52);
  -[BSUIEmojiLabelView sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v28, v30);
  double v46 = v45;
  v53.origin.x = v24;
  v53.origin.y = v26;
  v53.size.double width = v28;
  v53.size.height = v30;
  -[BSUIEmojiLabelView setFrame:](self->_subtitleLabel, "setFrame:", v16, MaxY, CGRectGetWidth(v53), v46);
  [(CCUIMenuModuleItemView *)self bounds];
  CGRectGetHeight(v54);
  [(CCUIMenuModuleItemView *)self _separatorHeight];
  [(CCUIMenuModuleItemView *)self bounds];
  CGRectGetWidth(v55);
  [(CCUIMenuModuleItemView *)self _separatorHeight];
  UIRectIntegralWithScale();
  -[UIView setFrame:](self->_separatorView, "setFrame:");
  [(UIView *)self->_separatorView setHidden:!self->_separatorVisible];
}

- (void)updateSubviewsAlpha:(double)a3
{
  -[BSUIEmojiLabelView setAlpha:](self->_titleLabel, "setAlpha:");
  [(BSUIEmojiLabelView *)self->_subtitleLabel setAlpha:a3];
  [(UIView *)self->_leadingView setAlpha:a3];
  trailingView = self->_trailingView;
  [(UIView *)trailingView setAlpha:a3];
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIMenuModuleItemView;
  [(CCUIMenuModuleItemView *)&v4 setHighlighted:a3];
  [(CCUIMenuModuleItemView *)self _updateForStateChange];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIMenuModuleItemView;
  [(CCUIMenuModuleItemView *)&v4 setSelected:a3];
  [(CCUIMenuModuleItemView *)self _updateForStateChange];
}

- (void)setEnabled:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIMenuModuleItemView;
  [(CCUIMenuModuleItemView *)&v4 setEnabled:a3];
  [(CCUIMenuModuleItemView *)self _updateForStateChange];
}

- (void)setSeparatorVisible:(BOOL)a3
{
  if (self->_separatorVisible != a3)
  {
    self->_separatorVisible = a3;
    [(CCUIMenuModuleItemView *)self setNeedsLayout];
  }
}

- (void)setIndentation:(unint64_t)a3
{
  if (self->_indentation != a3)
  {
    self->_indentation = a3;
    [(CCUIMenuModuleItemView *)self setNeedsLayout];
  }
}

- (void)setUseTrailingCheckmarkLayout:(BOOL)a3
{
  if (self->_useTrailingCheckmarkLayout != a3)
  {
    self->_useTrailingCheckmarkLayout = a3;
    [(CCUIMenuModuleItemView *)self invalidateIntrinsicContentSize];
  }
}

- (void)setUseTrailingInset:(BOOL)a3
{
  if (self->_useTrailingInset != a3)
  {
    self->_useTrailingInset = a3;
    [(CCUIMenuModuleItemView *)self invalidateIntrinsicContentSize];
  }
}

- (void)_setContinuousCornerRadius:(double)a3
{
  -[UIView _setContinuousCornerRadius:](self->_highlightedBackgroundView, "_setContinuousCornerRadius:");
  if (a3 > 0.0)
  {
    id v5 = [(UIView *)self->_highlightedBackgroundView layer];
    [v5 setMaskedCorners:12];
  }
}

- (void)didMoveToWindow
{
  v5.receiver = self;
  v5.super_class = (Class)CCUIMenuModuleItemView;
  [(CCUIMenuModuleItemView *)&v5 didMoveToWindow];
  double v3 = [(CCUIMenuModuleItemView *)self window];

  if (v3)
  {
    [(CCUIMenuModuleItemView *)self _contentSizeCategoryDidChange];
    objc_super v4 = [(CCUIMenuModuleItemView *)self visualStylingProviderForCategory:1];
    if (v4 != self->_visualStylingProvider)
    {
      [(CCUIMenuModuleItemView *)self _stopAutomaticallyUpdatingView:self->_leadingView recursivelyIfNeeded:1];
      [(CCUIMenuModuleItemView *)self _stopAutomaticallyUpdatingView:self->_trailingView recursivelyIfNeeded:1];
      [(CCUIMenuModuleItemView *)self _stopAutomaticallyUpdatingView:self->_titleLabel recursivelyIfNeeded:0];
      [(CCUIMenuModuleItemView *)self _stopAutomaticallyUpdatingView:self->_subtitleLabel recursivelyIfNeeded:0];
      [(CCUIMenuModuleItemView *)self _stopAutomaticallyUpdatingView:self->_separatorView recursivelyIfNeeded:0];
      objc_storeStrong((id *)&self->_visualStylingProvider, v4);
      [(CCUIMenuModuleItemView *)self _updateVisualStyleOfView:self->_leadingView withStyle:0 recursivelyIfNeeded:1];
      [(CCUIMenuModuleItemView *)self _updateVisualStyleOfView:self->_trailingView withStyle:0 recursivelyIfNeeded:1];
      [(CCUIMenuModuleItemView *)self _updateVisualStyleOfView:self->_titleLabel withStyle:0 recursivelyIfNeeded:0];
      [(CCUIMenuModuleItemView *)self _updateVisualStyleOfView:self->_subtitleLabel withStyle:1 recursivelyIfNeeded:0];
      [(CCUIMenuModuleItemView *)self _updateVisualStyleOfView:self->_separatorView withStyle:5 recursivelyIfNeeded:0];
    }
  }
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  [a3 locationInView:self];
  LOBYTE(a3) = -[CCUIMenuModuleItemView pointInside:withEvent:](self, "pointInside:withEvent:", v6);

  return (char)a3;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v5 = a5;
  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  objc_super v4 = self;
  if ([(CCUIMenuModuleItemView *)v4 _isInAWindow])
  {
    id v5 = [(CCUIMenuModuleItemView *)v4 window];
    id v6 = (void *)CCUILogUserInterface;
    if (os_log_type_enabled((os_log_t)CCUILogUserInterface, OS_LOG_TYPE_DEFAULT))
    {
      double v7 = v6;
      CGFloat v8 = (objc_class *)objc_opt_class();
      double v9 = NSStringFromClass(v8);
      int v14 = 138543874;
      double v15 = v9;
      __int16 v16 = 2114;
      double v17 = v4;
      __int16 v18 = 2114;
      CGFloat v19 = v5;
      _os_log_impl(&dword_1D834A000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Control Center is about to call -[UITargetedPreview initWithView:], view = %{public}@, window = %{public}@", (uint8_t *)&v14, 0x20u);
    }
    CGFloat v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v4];
    double v11 = [MEMORY[0x1E4FB1AB0] effectWithPreview:v10];
    CGFloat v12 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v11 shape:0];
  }
  else
  {
    CGFloat v12 = 0;
  }

  return v12;
}

- (double)_separatorHeight
{
  v2 = [(CCUIMenuModuleItemView *)self traitCollection];
  double v3 = [v2 preferredContentSizeCategory];
  double v4 = 1.0;
  if (!UIContentSizeCategoryIsAccessibilityCategory(v3))
  {
    id v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v5 scale];
    double v4 = v6;
  }
  return 1.0 / v4;
}

- (id)_titleFont
{
  double v3 = [(CCUIMenuModuleItemView *)self traitCollection];
  double v4 = [v3 preferredContentSizeCategory];

  id v5 = objc_msgSend((id)objc_opt_class(), "_titleFontForContentSizeCategory:shouldLimitContentSizeCategory:", v4, -[CCUIMenuModuleItemView shouldLimitContentSizeCategory](self, "shouldLimitContentSizeCategory"));

  return v5;
}

- (id)_subtitleFont
{
  double v3 = [(CCUIMenuModuleItemView *)self traitCollection];
  double v4 = [v3 preferredContentSizeCategory];

  id v5 = objc_msgSend((id)objc_opt_class(), "_subtitleFontForContentSizeCategory:shouldLimitContentSizeCategory:", v4, -[CCUIMenuModuleItemView shouldLimitContentSizeCategory](self, "shouldLimitContentSizeCategory"));

  return v5;
}

- (double)_textHeightForEmojiLabel:(id)a3 width:(double)a4
{
  id v5 = a3;
  double v6 = [v5 text];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    objc_msgSend(v5, "sizeThatFits:", a4, 0.0);
    double v9 = v8;
    [v5 bounds];
    objc_msgSend(v5, "setBounds:");
    [v5 _firstLineBaselineOffsetFromBoundsTop];
    double v11 = v9 - v10;
    [v5 _baselineOffsetFromBottom];
    double v13 = v11 - v12;
  }
  else
  {
    double v13 = 0.0;
  }

  return v13;
}

- (BOOL)_shouldHorizontallyCenterText
{
  if (self->_leadingView || self->_trailingView || self->_indentation) {
    return 0;
  }
  double v4 = [(BSUIEmojiLabelView *)self->_subtitleLabel text];
  BOOL v2 = [v4 length] == 0;

  return v2;
}

- (double)_titleBaselineToTop
{
  double result = 23.0;
  if (!self->_subtitleLabel) {
    return 30.0;
  }
  return result;
}

- (double)_titleBaselineToBottom
{
  double result = 29.0;
  if (!self->_subtitleLabel) {
    return 22.0;
  }
  return result;
}

- (double)_labelLeadingInset
{
  switch(self->_indentation)
  {
    case 0uLL:
      double result = 45.0;
      if (!self->_leadingView) {
        double result = 0.0;
      }
      break;
    case 1uLL:
      double result = 20.0;
      break;
    case 2uLL:
      double result = 45.0;
      break;
    case 3uLL:
      double result = 64.0;
      break;
    default:
      double result = 0.0;
      break;
  }
  return result;
}

- (double)_labelTrailingInset
{
  if (self->_useTrailingInset) {
    return 100.0;
  }
  if (!self->_trailingView) {
    return 0.0;
  }
  [(CCUIMenuModuleItemView *)self _trailingWidthForCustomViews];
  return result;
}

- (double)_trailingWidthForCustomViews
{
  [(CCUIMenuModuleItemView *)self bounds];
  -[UIView sizeThatFits:](self->_trailingView, "sizeThatFits:", v3, v4);
  return v5 + 20.0 + 20.0;
}

- (NSDirectionalEdgeInsets)_labelInsets
{
  [(CCUIMenuModuleItemView *)self _labelLeadingInset];
  double v4 = v3;
  [(CCUIMenuModuleItemView *)self _labelTrailingInset];
  double v6 = v5;
  double v7 = 0.0;
  double v8 = 0.0;
  double v9 = v4;
  result.trailing = v6;
  result.bottom = v8;
  result.leading = v9;
  result.top = v7;
  return result;
}

- (void)_updateForStateChange
{
  if ([(CCUIMenuModuleItem *)self->_menuItem isPlaceholder]
    || (double v3 = 1.0, ([(CCUIMenuModuleItemView *)self isHighlighted] & 1) == 0)
    && ([(CCUIMenuModuleItemView *)self isSelected] & 1) == 0)
  {
    double v3 = 0.0;
  }
  highlightedBackgroundView = self->_highlightedBackgroundView;
  [(UIView *)highlightedBackgroundView setAlpha:v3];
}

- (void)_contentSizeCategoryDidChange
{
  [(CCUIMenuModuleItemView *)self invalidateIntrinsicContentSize];
  titleLabel = self->_titleLabel;
  double v4 = [(CCUIMenuModuleItemView *)self _titleFont];
  [(BSUIEmojiLabelView *)titleLabel setFont:v4];

  subtitleLabel = self->_subtitleLabel;
  id v6 = [(CCUIMenuModuleItemView *)self _subtitleFont];
  [(BSUIEmojiLabelView *)subtitleLabel setFont:v6];
}

- (void)_layoutLeadingCustomView
{
  if (self->_leadingView)
  {
    [(CCUIMenuModuleItemView *)self bounds];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    -[UIView sizeThatFits:](self->_leadingView, "sizeThatFits:", v7, v9);
    [(CCUIMenuModuleItemView *)self _labelLeadingInset];
    if ([(CCUIMenuModuleItemView *)self _shouldReverseLayoutDirection])
    {
      v13.origin.x = v4;
      v13.origin.y = v6;
      v13.size.double width = v8;
      v13.size.height = v10;
      CGRectGetMaxX(v13);
    }
    v14.origin.x = v4;
    v14.origin.y = v6;
    v14.size.double width = v8;
    v14.size.height = v10;
    CGRectGetHeight(v14);
    UIRectIntegralWithScale();
    leadingView = self->_leadingView;
    -[UIView setFrame:](leadingView, "setFrame:");
  }
}

- (void)_layoutTrailingCustomViews
{
  if (self->_trailingView)
  {
    [(CCUIMenuModuleItemView *)self bounds];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    -[UIView sizeThatFits:](self->_trailingView, "sizeThatFits:", v7, v9);
    if (![(CCUIMenuModuleItemView *)self _shouldReverseLayoutDirection])
    {
      v13.origin.x = v4;
      v13.origin.y = v6;
      v13.size.double width = v8;
      v13.size.height = v10;
      CGRectGetMaxX(v13);
    }
    v14.origin.x = v4;
    v14.origin.y = v6;
    v14.size.double width = v8;
    v14.size.height = v10;
    CGRectGetHeight(v14);
    UIRectIntegralWithScale();
    trailingView = self->_trailingView;
    -[UIView setFrame:](trailingView, "setFrame:");
  }
}

- (void)_updateVisualStyleOfView:(id)a3 withStyle:(int64_t)a4 recursivelyIfNeeded:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  double v9 = v8;
  if (v5
    && ([v8 subviews],
        CGFloat v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = [v10 count],
        v10,
        v11))
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    double v12 = objc_msgSend(v9, "subviews", 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          [(MTVisualStylingProvider *)self->_visualStylingProvider automaticallyUpdateView:*(void *)(*((void *)&v17 + 1) + 8 * v16++) withStyle:a4];
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v14);
    }
  }
  else
  {
    [(MTVisualStylingProvider *)self->_visualStylingProvider automaticallyUpdateView:v9 withStyle:a4];
  }
}

- (void)_stopAutomaticallyUpdatingView:(id)a3 recursivelyIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = v6;
  if (v4
    && ([v6 subviews],
        id v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 count],
        v8,
        v9))
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    CGFloat v10 = objc_msgSend(v7, "subviews", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          [(MTVisualStylingProvider *)self->_visualStylingProvider stopAutomaticallyUpdatingView:*(void *)(*((void *)&v15 + 1) + 8 * v14++)];
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }
  }
  else
  {
    [(MTVisualStylingProvider *)self->_visualStylingProvider stopAutomaticallyUpdatingView:v7];
  }
}

- (BOOL)separatorVisible
{
  return self->_separatorVisible;
}

- (double)preferredMaxLayoutWidth
{
  return self->_preferredMaxLayoutWidth;
}

- (void)setPreferredMaxLayoutWidth:(double)a3
{
  self->_preferredMaxLayoutdouble Width = a3;
}

- (BOOL)useTallLayout
{
  return self->_useTallLayout;
}

- (void)setUseTallLayout:(BOOL)a3
{
  self->_useTallLayout = a3;
}

- (BOOL)useTrailingCheckmarkLayout
{
  return self->_useTrailingCheckmarkLayout;
}

- (BOOL)useTrailingInset
{
  return self->_useTrailingInset;
}

- (unint64_t)indentation
{
  return self->_indentation;
}

- (CCUIMenuModuleItem)menuItem
{
  return self->_menuItem;
}

- (UIView)leadingView
{
  return self->_leadingView;
}

- (UIView)trailingView
{
  return self->_trailingView;
}

- (BOOL)shouldLimitContentSizeCategory
{
  return self->_shouldLimitContentSizeCategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
  objc_storeStrong((id *)&self->_menuItem, 0);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_storeStrong((id *)&self->_highlightedBackgroundView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end