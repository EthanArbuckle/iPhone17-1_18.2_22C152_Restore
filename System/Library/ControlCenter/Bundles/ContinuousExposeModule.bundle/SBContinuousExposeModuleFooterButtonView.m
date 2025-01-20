@interface SBContinuousExposeModuleFooterButtonView
+ (id)_tertiaryView;
+ (id)_titleFontForContentSizeCategory:(id)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)title;
- (SBContinuousExposeModuleFooterButtonView)init;
- (double)_textHeightForEmojiLabel:(id)a3 width:(double)a4;
- (double)_titleBaselineToBottom;
- (double)_titleBaselineToTop;
- (double)preferredMaxLayoutWidth;
- (id)_titleFont;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)_contentSizeCategoryDidChange;
- (void)_stopAutomaticallyUpdatingView:(id)a3 recursivelyIfNeeded:(BOOL)a4;
- (void)_updateForStateChange;
- (void)_updateVisualStyleOfView:(id)a3 withStyle:(int64_t)a4 recursivelyIfNeeded:(BOOL)a5;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setPreferredMaxLayoutWidth:(double)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SBContinuousExposeModuleFooterButtonView

+ (id)_titleFontForContentSizeCategory:(id)a3
{
  return +[UIFont bsui_preferredFontForTextStyle:UIFontTextStyleBody hiFontStyle:8 contentSizeCategory:a3];
}

+ (id)_tertiaryView
{
  v2 = +[MTVisualStylingProvider _visualStylingProviderForRecipe:4 andCategory:2];
  id v3 = [v2 newAutomaticallyUpdatingViewWithStyle:1];

  return v3;
}

- (SBContinuousExposeModuleFooterButtonView)init
{
  v14.receiver = self;
  v14.super_class = (Class)SBContinuousExposeModuleFooterButtonView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v5 = -[SBContinuousExposeModuleFooterButtonView initWithFrame:](&v14, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (v5)
  {
    uint64_t v6 = [(id)objc_opt_class() _tertiaryView];
    highlightedBackgroundView = v5->_highlightedBackgroundView;
    v5->_highlightedBackgroundView = (UIView *)v6;

    [(UIView *)v5->_highlightedBackgroundView setAutoresizingMask:18];
    [(UIView *)v5->_highlightedBackgroundView setAlpha:0.0];
    [(SBContinuousExposeModuleFooterButtonView *)v5 addSubview:v5->_highlightedBackgroundView];
    v8 = (BSUIEmojiLabelView *)objc_msgSend(objc_alloc((Class)BSUIEmojiLabelView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v8;

    [(SBContinuousExposeModuleFooterButtonView *)v5 addSubview:v5->_titleLabel];
    v10 = v5->_titleLabel;
    v11 = [(SBContinuousExposeModuleFooterButtonView *)v5 _titleFont];
    [(BSUIEmojiLabelView *)v10 setFont:v11];

    [(BSUIEmojiLabelView *)v5->_titleLabel setUserInteractionEnabled:0];
    [(BSUIEmojiLabelView *)v5->_titleLabel setNumberOfLines:0];
    id v12 = [objc_alloc((Class)UIPointerInteraction) initWithDelegate:v5];
    [(SBContinuousExposeModuleFooterButtonView *)v5 addInteraction:v12];

    [(SBContinuousExposeModuleFooterButtonView *)v5 setIsAccessibilityElement:1];
    [(SBContinuousExposeModuleFooterButtonView *)v5 setAccessibilityTraits:UIAccessibilityTraitButton];
  }
  return v5;
}

- (void)setTitle:(id)a3
{
  id v5 = a3;
  if ((BSEqualStrings() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_title, a3);
    [(BSUIEmojiLabelView *)self->_titleLabel setText:v5];
    [(BSUIEmojiLabelView *)self->_titleLabel pl_performCrossFadeIfNecessary];
    [(SBContinuousExposeModuleFooterButtonView *)self invalidateIntrinsicContentSize];
    [(SBContinuousExposeModuleFooterButtonView *)self setAccessibilityLabel:v5];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[SBContinuousExposeModuleFooterButtonView _textHeightForEmojiLabel:width:](self, "_textHeightForEmojiLabel:width:", self->_titleLabel, a3.width, a3.height);
  double v6 = v5;
  v7 = [(BSUIEmojiLabelView *)self->_titleLabel font];
  [(SBContinuousExposeModuleFooterButtonView *)self _titleBaselineToTop];
  objc_msgSend(v7, "_scaledValueForValue:");
  double v9 = v6 + v8;
  [(SBContinuousExposeModuleFooterButtonView *)self _titleBaselineToBottom];
  objc_msgSend(v7, "_scaledValueForValue:");
  double v11 = v9 + v10;

  double v12 = width;
  double v13 = v11;
  result.double height = v13;
  result.CGFloat width = v12;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(SBContinuousExposeModuleFooterButtonView *)self preferredMaxLayoutWidth];

  -[SBContinuousExposeModuleFooterButtonView sizeThatFits:](self, "sizeThatFits:");
  result.double height = v4;
  result.CGFloat width = v3;
  return result;
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)SBContinuousExposeModuleFooterButtonView;
  [(SBContinuousExposeModuleFooterButtonView *)&v10 layoutSubviews];
  titleLabel = self->_titleLabel;
  double v4 = [(SBContinuousExposeModuleFooterButtonView *)self _titleFont];
  [(BSUIEmojiLabelView *)titleLabel setFont:v4];

  [(SBContinuousExposeModuleFooterButtonView *)self bounds];
  CGFloat x = v11.origin.x;
  CGFloat y = v11.origin.y;
  CGFloat width = v11.size.width;
  CGFloat height = v11.size.height;
  double v9 = CGRectGetWidth(v11);
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  -[BSUIEmojiLabelView sizeThatFits:](self->_titleLabel, "sizeThatFits:", v9, CGRectGetHeight(v12));
  UIRectCenteredYInRect();
  -[BSUIEmojiLabelView setFrame:](self->_titleLabel, "setFrame:");
  [(BSUIEmojiLabelView *)self->_titleLabel setTextAlignment:1];
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBContinuousExposeModuleFooterButtonView;
  [(SBContinuousExposeModuleFooterButtonView *)&v4 setHighlighted:a3];
  [(SBContinuousExposeModuleFooterButtonView *)self _updateForStateChange];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBContinuousExposeModuleFooterButtonView;
  [(SBContinuousExposeModuleFooterButtonView *)&v4 setSelected:a3];
  [(SBContinuousExposeModuleFooterButtonView *)self _updateForStateChange];
}

- (void)setEnabled:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBContinuousExposeModuleFooterButtonView;
  [(SBContinuousExposeModuleFooterButtonView *)&v4 setEnabled:a3];
  [(SBContinuousExposeModuleFooterButtonView *)self _updateForStateChange];
}

- (void)didMoveToWindow
{
  v5.receiver = self;
  v5.super_class = (Class)SBContinuousExposeModuleFooterButtonView;
  [(SBContinuousExposeModuleFooterButtonView *)&v5 didMoveToWindow];
  double v3 = [(SBContinuousExposeModuleFooterButtonView *)self window];

  if (v3)
  {
    [(SBContinuousExposeModuleFooterButtonView *)self _contentSizeCategoryDidChange];
    objc_super v4 = [(SBContinuousExposeModuleFooterButtonView *)self visualStylingProviderForCategory:1];
    if (v4 != self->_visualStylingProvider)
    {
      [(SBContinuousExposeModuleFooterButtonView *)self _stopAutomaticallyUpdatingView:self->_titleLabel recursivelyIfNeeded:0];
      objc_storeStrong((id *)&self->_visualStylingProvider, v4);
      [(SBContinuousExposeModuleFooterButtonView *)self _updateVisualStyleOfView:self->_titleLabel withStyle:0 recursivelyIfNeeded:0];
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBContinuousExposeModuleFooterButtonView;
  id v4 = a3;
  [(SBContinuousExposeModuleFooterButtonView *)&v8 traitCollectionDidChange:v4];
  objc_super v5 = [(SBContinuousExposeModuleFooterButtonView *)self traitCollection];
  double v6 = [v5 preferredContentSizeCategory];
  v7 = [v4 preferredContentSizeCategory];

  if (v6 != v7) {
    [(SBContinuousExposeModuleFooterButtonView *)self _contentSizeCategoryDidChange];
  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v5 = a5;

  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v4 = [objc_alloc((Class)UITargetedPreview) initWithView:self];
  id v5 = +[UIPointerEffect effectWithPreview:v4];
  double v6 = +[UIPointerStyle styleWithEffect:v5 shape:0];

  return v6;
}

- (id)_titleFont
{
  v2 = [(SBContinuousExposeModuleFooterButtonView *)self traitCollection];
  double v3 = [v2 preferredContentSizeCategory];

  id v4 = [(id)objc_opt_class() _titleFontForContentSizeCategory:v3];

  return v4;
}

- (double)_textHeightForEmojiLabel:(id)a3 width:(double)a4
{
  id v5 = a3;
  double v6 = [v5 text];
  id v7 = [v6 length];

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

- (double)_titleBaselineToTop
{
  return 30.0;
}

- (double)_titleBaselineToBottom
{
  return 22.0;
}

- (void)_updateForStateChange
{
  unsigned __int8 v3 = [(SBContinuousExposeModuleFooterButtonView *)self isHighlighted];
  double v4 = 1.0;
  if ((v3 & 1) == 0)
  {
    unsigned int v5 = [(SBContinuousExposeModuleFooterButtonView *)self isSelected];
    double v4 = 0.0;
    if (v5) {
      double v4 = 1.0;
    }
  }
  highlightedBackgroundView = self->_highlightedBackgroundView;

  [(UIView *)highlightedBackgroundView setAlpha:v4];
}

- (void)_contentSizeCategoryDidChange
{
  [(SBContinuousExposeModuleFooterButtonView *)self invalidateIntrinsicContentSize];
  titleLabel = self->_titleLabel;
  id v4 = [(SBContinuousExposeModuleFooterButtonView *)self _titleFont];
  [(BSUIEmojiLabelView *)titleLabel setFont:v4];
}

- (void)_updateVisualStyleOfView:(id)a3 withStyle:(int64_t)a4 recursivelyIfNeeded:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  double v9 = v8;
  if (v5
    && ([v8 subviews],
        double v10 = objc_claimAutoreleasedReturnValue(),
        id v11 = [v10 count],
        v10,
        v11))
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    double v12 = objc_msgSend(v9, "subviews", 0);
    id v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          [(MTVisualStylingProvider *)self->_visualStylingProvider automaticallyUpdateView:*(void *)(*((void *)&v17 + 1) + 8 * (void)v16) withStyle:a4];
          v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
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
  id v6 = a3;
  id v7 = v6;
  if (v4
    && ([v6 subviews],
        id v8 = objc_claimAutoreleasedReturnValue(),
        id v9 = [v8 count],
        v8,
        v9))
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    double v10 = objc_msgSend(v7, "subviews", 0);
    id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        id v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          [(MTVisualStylingProvider *)self->_visualStylingProvider stopAutomaticallyUpdatingView:*(void *)(*((void *)&v15 + 1) + 8 * (void)v14)];
          id v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }
  }
  else
  {
    [(MTVisualStylingProvider *)self->_visualStylingProvider stopAutomaticallyUpdatingView:v7];
  }
}

- (NSString)title
{
  return self->_title;
}

- (double)preferredMaxLayoutWidth
{
  return self->_preferredMaxLayoutWidth;
}

- (void)setPreferredMaxLayoutWidth:(double)a3
{
  self->_preferredMaxLayoutWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
  objc_storeStrong((id *)&self->_highlightedBackgroundView, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end