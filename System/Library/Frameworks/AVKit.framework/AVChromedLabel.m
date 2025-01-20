@interface AVChromedLabel
- (AVChromedLabel)initWithFrame:(CGRect)a3;
- (AVLayoutItemAttributes)layoutAttributes;
- (BOOL)hasAlternateAppearance;
- (BOOL)hasFullScreenAppearance;
- (BOOL)isCollapsed;
- (BOOL)isCollapsedOrExcluded;
- (BOOL)isIncluded;
- (BOOL)isRemoved;
- (BOOL)showsLoadingIndicator;
- (CGSize)extrinsicContentSize;
- (NSAttributedString)attributedText;
- (NSLayoutConstraint)loadingIndicatorLeftAlignmentConstraint;
- (NSLayoutConstraint)loadingIndicatorRightAlignmentConstraint;
- (NSString)text;
- (UIActivityIndicatorView)loadingIndicator;
- (UIFont)font;
- (UILabel)label;
- (UILabel)labelIfLoaded;
- (int64_t)loadingIndicatorAlignment;
- (int64_t)numberOfLines;
- (void)_updateLayoutItem;
- (void)didMoveToSuperview;
- (void)layoutAttributesDidChange;
- (void)setAttributedText:(id)a3;
- (void)setCollapsed:(BOOL)a3;
- (void)setExtrinsicContentSize:(CGSize)a3;
- (void)setFont:(id)a3;
- (void)setHasAlternateAppearance:(BOOL)a3;
- (void)setHasFullScreenAppearance:(BOOL)a3;
- (void)setIncluded:(BOOL)a3;
- (void)setLoadingIndicatorAlignment:(int64_t)a3;
- (void)setLoadingIndicatorLeftAlignmentConstraint:(id)a3;
- (void)setLoadingIndicatorRightAlignmentConstraint:(id)a3;
- (void)setNumberOfLines:(int64_t)a3;
- (void)setRemoved:(BOOL)a3;
- (void)setShowsLoadingIndicator:(BOOL)a3;
- (void)setText:(id)a3;
- (void)tintColorDidChange;
- (void)updateConstraints;
@end

@implementation AVChromedLabel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingIndicatorRightAlignmentConstraint, 0);
  objc_storeStrong((id *)&self->_loadingIndicatorLeftAlignmentConstraint, 0);
  objc_storeStrong((id *)&self->_loadingIndicator, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_layoutAttributes, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

- (void)setLoadingIndicatorRightAlignmentConstraint:(id)a3
{
}

- (NSLayoutConstraint)loadingIndicatorRightAlignmentConstraint
{
  return self->_loadingIndicatorRightAlignmentConstraint;
}

- (void)setLoadingIndicatorLeftAlignmentConstraint:(id)a3
{
}

- (NSLayoutConstraint)loadingIndicatorLeftAlignmentConstraint
{
  return self->_loadingIndicatorLeftAlignmentConstraint;
}

- (int64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (UIActivityIndicatorView)loadingIndicator
{
  return self->_loadingIndicator;
}

- (UIFont)font
{
  return self->_font;
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (NSString)text
{
  return self->_text;
}

- (int64_t)loadingIndicatorAlignment
{
  return self->_loadingIndicatorAlignment;
}

- (BOOL)showsLoadingIndicator
{
  return self->_showsLoadingIndicator;
}

- (void)setHasFullScreenAppearance:(BOOL)a3
{
  self->_hasFullScreenAppearance = a3;
}

- (BOOL)hasFullScreenAppearance
{
  return self->_hasFullScreenAppearance;
}

- (void)setHasAlternateAppearance:(BOOL)a3
{
  self->_hasAlternateAppearance = a3;
}

- (BOOL)hasAlternateAppearance
{
  return self->_hasAlternateAppearance;
}

- (CGSize)extrinsicContentSize
{
  double width = self->_extrinsicContentSize.width;
  double height = self->_extrinsicContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isRemoved
{
  return self->_removed;
}

- (BOOL)isIncluded
{
  return self->_included;
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (AVLayoutItemAttributes)layoutAttributes
{
  return self->_layoutAttributes;
}

- (void)setRemoved:(BOOL)a3
{
  if (self->_removed != a3)
  {
    self->_removed = a3;
    [(UIView *)self avkit_reevaluateHiddenStateOfItem:self];
    [(AVChromedLabel *)self _updateLayoutItem];
  }
}

- (void)setCollapsed:(BOOL)a3
{
  if (self->_collapsed != a3)
  {
    self->_collapsed = a3;
    [(AVChromedLabel *)self _updateLayoutItem];
    [(UIView *)self avkit_reevaluateHiddenStateOfItem:self];
  }
}

- (void)setIncluded:(BOOL)a3
{
  if (self->_included != a3)
  {
    self->_included = a3;
    [(AVChromedLabel *)self _updateLayoutItem];
    [(UIView *)self avkit_reevaluateHiddenStateOfItem:self];
  }
}

- (BOOL)isCollapsedOrExcluded
{
  if ([(AVChromedLabel *)self isCollapsed] || ![(AVChromedLabel *)self isIncluded]) {
    return 1;
  }

  return [(AVChromedLabel *)self isRemoved];
}

- (void)layoutAttributesDidChange
{
  id v3 = [(AVChromedLabel *)self layoutAttributes];
  -[AVChromedLabel setCollapsed:](self, "setCollapsed:", [v3 isCollapsed]);
}

- (void)setNumberOfLines:(int64_t)a3
{
  if (self->_numberOfLines != a3)
  {
    self->_numberOfLines = a3;
    id v4 = [(AVChromedLabel *)self labelIfLoaded];
    [v4 setNumberOfLines:a3];
  }
}

- (void)updateConstraints
{
  id v3 = [(AVChromedLabel *)self label];
  int v4 = [v3 translatesAutoresizingMaskIntoConstraints];

  if (v4)
  {
    v5 = [(AVChromedLabel *)self label];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

    v6 = (void *)MEMORY[0x1E4F28DC8];
    v7 = [(AVChromedLabel *)self label];
    v8 = objc_msgSend(v7, "avkit_constraintsFromEdgeAnchorsToEdgeAnchorsOfItem:", self);
    [v6 activateConstraints:v8];
  }
  if ([(AVChromedLabel *)self showsLoadingIndicator])
  {
    v9 = [(AVChromedLabel *)self loadingIndicator];
    int v10 = [v9 translatesAutoresizingMaskIntoConstraints];

    if (v10)
    {
      v11 = [(AVChromedLabel *)self loadingIndicator];
      [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

      v12 = [(AVChromedLabel *)self loadingIndicator];
      v13 = [v12 centerYAnchor];
      v14 = [(AVChromedLabel *)self centerYAnchor];
      v15 = [v13 constraintEqualToAnchor:v14];
      [v15 setActive:1];
    }
    v16 = [(AVChromedLabel *)self loadingIndicatorLeftAlignmentConstraint];
    objc_msgSend(v16, "setActive:", -[AVChromedLabel loadingIndicatorAlignment](self, "loadingIndicatorAlignment") == 0);

    v17 = [(AVChromedLabel *)self loadingIndicatorRightAlignmentConstraint];
    objc_msgSend(v17, "setActive:", -[AVChromedLabel loadingIndicatorAlignment](self, "loadingIndicatorAlignment") == 1);
  }
  v18.receiver = self;
  v18.super_class = (Class)AVChromedLabel;
  [(AVChromedLabel *)&v18 updateConstraints];
}

- (void)tintColorDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)AVChromedLabel;
  [(AVChromedLabel *)&v5 tintColorDidChange];
  id v3 = [(AVChromedLabel *)self labelIfLoaded];
  int v4 = [(AVChromedLabel *)self tintColor];
  [v3 setTextColor:v4];
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)AVChromedLabel;
  [(AVChromedLabel *)&v3 didMoveToSuperview];
  +[AVBackdropView applySecondaryGlyphTintToView:self];
}

- (void)_updateLayoutItem
{
  objc_super v3 = [(AVChromedLabel *)self layoutAttributes];
  [(AVChromedLabel *)self intrinsicContentSize];
  objc_msgSend(v3, "setMinimumSize:");

  int v4 = [(AVChromedLabel *)self layoutAttributes];
  if ([(AVChromedLabel *)self isIncluded]) {
    uint64_t v5 = [(AVChromedLabel *)self isRemoved] ^ 1;
  }
  else {
    uint64_t v5 = 0;
  }
  [v4 setIncluded:v5];

  id v6 = [(AVChromedLabel *)self layoutAttributes];
  objc_msgSend(v6, "setCollapsed:", -[AVChromedLabel isCollapsed](self, "isCollapsed"));
}

- (void)setExtrinsicContentSize:(CGSize)a3
{
  if (a3.width != self->_extrinsicContentSize.width || a3.height != self->_extrinsicContentSize.height)
  {
    self->_extrinsicContentSize = a3;
    [(AVChromedLabel *)self invalidateIntrinsicContentSize];
    [(AVChromedLabel *)self _updateLayoutItem];
  }
}

- (void)setAttributedText:(id)a3
{
  id v9 = a3;
  if (!-[NSAttributedString isEqualToAttributedString:](self->_attributedText, "isEqualToAttributedString:"))
  {
    NSUInteger v4 = [(NSAttributedString *)self->_attributedText length];
    uint64_t v5 = (NSAttributedString *)[v9 copy];
    attributedText = self->_attributedText;
    self->_attributedText = v5;

    v7 = [(AVChromedLabel *)self label];
    [v7 setAttributedText:v9];

    if (v4 != [(NSAttributedString *)self->_attributedText length])
    {
      v8 = [(AVChromedLabel *)self labelIfLoaded];
      [v8 intrinsicContentSize];
      -[AVChromedLabel setExtrinsicContentSize:](self, "setExtrinsicContentSize:");
    }
    [(AVChromedLabel *)self _updateLayoutItem];
  }
}

- (void)setText:(id)a3
{
  id v9 = a3;
  if (!-[NSString isEqualToString:](self->_text, "isEqualToString:"))
  {
    NSUInteger v4 = [(NSString *)self->_text length];
    uint64_t v5 = (NSString *)[v9 copy];
    text = self->_text;
    self->_text = v5;

    v7 = [(AVChromedLabel *)self label];
    [v7 setText:v9];

    if (v4 != [(NSString *)self->_text length])
    {
      v8 = [(AVChromedLabel *)self labelIfLoaded];
      [v8 intrinsicContentSize];
      -[AVChromedLabel setExtrinsicContentSize:](self, "setExtrinsicContentSize:");

      [(AVChromedLabel *)self _updateLayoutItem];
    }
  }
}

- (void)setShowsLoadingIndicator:(BOOL)a3
{
  if (self->_showsLoadingIndicator != a3)
  {
    BOOL v3 = a3;
    self->_showsLoadingIndicator = a3;
    uint64_t v5 = [(AVChromedLabel *)self label];
    id v6 = [v5 text];

    if (!v6 && v3)
    {
      v7 = [(AVChromedLabel *)self label];
      [v7 setText:@" "];
    }
    v8 = [(AVChromedLabel *)self label];
    id v9 = v8;
    double v10 = 1.0;
    if (v3) {
      double v10 = 0.0;
    }
    [v8 setAlpha:v10];

    loadingIndicator = self->_loadingIndicator;
    if (v3)
    {
      if (!loadingIndicator)
      {
        v15 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:3];
        v16 = self->_loadingIndicator;
        self->_loadingIndicator = v15;

        v17 = [(UIActivityIndicatorView *)self->_loadingIndicator leftAnchor];
        objc_super v18 = [(AVChromedLabel *)self leftAnchor];
        v19 = [v17 constraintEqualToAnchor:v18];
        loadingIndicatorLeftAlignmentConstraint = self->_loadingIndicatorLeftAlignmentConstraint;
        self->_loadingIndicatorLeftAlignmentConstraint = v19;

        v21 = [(UIActivityIndicatorView *)self->_loadingIndicator rightAnchor];
        v22 = [(AVChromedLabel *)self rightAnchor];
        v23 = [v21 constraintEqualToAnchor:v22];
        loadingIndicatorRightAlignmentConstraint = self->_loadingIndicatorRightAlignmentConstraint;
        self->_loadingIndicatorRightAlignmentConstraint = v23;

        [(AVChromedLabel *)self addSubview:self->_loadingIndicator];
        [(UIActivityIndicatorView *)self->_loadingIndicator startAnimating];
        [(AVChromedLabel *)self setNeedsUpdateConstraints];
      }
    }
    else
    {
      [(UIActivityIndicatorView *)loadingIndicator removeFromSuperview];
      v12 = self->_loadingIndicatorLeftAlignmentConstraint;
      self->_loadingIndicatorLeftAlignmentConstraint = 0;

      v13 = self->_loadingIndicatorRightAlignmentConstraint;
      self->_loadingIndicatorRightAlignmentConstraint = 0;

      v14 = self->_loadingIndicator;
      self->_loadingIndicator = 0;
    }
  }
}

- (void)setLoadingIndicatorAlignment:(int64_t)a3
{
  if (self->_loadingIndicatorAlignment != a3)
  {
    self->_loadingIndicatorAlignment = a3;
    BOOL v4 = a3 == 2;
    uint64_t v5 = [(AVChromedLabel *)self labelIfLoaded];
    [v5 setTextAlignment:v4];

    if ([(AVChromedLabel *)self showsLoadingIndicator])
    {
      [(AVChromedLabel *)self setNeedsUpdateConstraints];
    }
  }
}

- (void)setFont:(id)a3
{
  v7 = (UIFont *)a3;
  if (self->_font != v7)
  {
    objc_storeStrong((id *)&self->_font, a3);
    uint64_t v5 = [(AVChromedLabel *)self labelIfLoaded];
    [v5 setFont:v7];

    id v6 = [(AVChromedLabel *)self labelIfLoaded];
    [v6 intrinsicContentSize];
    -[AVChromedLabel setExtrinsicContentSize:](self, "setExtrinsicContentSize:");
  }
}

- (UILabel)labelIfLoaded
{
  return self->_label;
}

- (UILabel)label
{
  label = self->_label;
  if (!label)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
    [(AVChromedLabel *)self bounds];
    uint64_t v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:");
    id v6 = self->_label;
    self->_label = v5;

    v7 = self->_label;
    v8 = [(AVChromedLabel *)self tintColor];
    [(UILabel *)v7 setTextColor:v8];

    id v9 = self->_label;
    double v10 = [(AVChromedLabel *)self text];
    [(UILabel *)v9 setText:v10];

    v11 = self->_label;
    v12 = [(AVChromedLabel *)self font];
    [(UILabel *)v11 setFont:v12];

    unint64_t v13 = [(AVChromedLabel *)self loadingIndicatorAlignment];
    if (v13 <= 2) {
      [(UILabel *)self->_label setTextAlignment:qword_1B07213D8[v13]];
    }
    [(UILabel *)self->_label setNumberOfLines:[(AVChromedLabel *)self numberOfLines]];
    [(UILabel *)self->_label intrinsicContentSize];
    -[AVChromedLabel setExtrinsicContentSize:](self, "setExtrinsicContentSize:");
    [(AVChromedLabel *)self addSubview:self->_label];
    label = self->_label;
  }

  return label;
}

- (AVChromedLabel)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)AVChromedLabel;
  BOOL v3 = -[AVChromedLabel initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    v3->_included = 1;
    v3->_numberOfLines = 1;
    uint64_t v5 = objc_alloc_init(AVLayoutItemAttributes);
    layoutAttributes = v4->_layoutAttributes;
    v4->_layoutAttributes = v5;

    v7 = v4->_layoutAttributes;
    [(AVChromedLabel *)v4 intrinsicContentSize];
    -[AVLayoutItemAttributes setMinimumSize:](v7, "setMinimumSize:");
    [(AVLayoutItemAttributes *)v4->_layoutAttributes setCollapsed:[(AVChromedLabel *)v4 isCollapsed]];
    [(AVLayoutItemAttributes *)v4->_layoutAttributes setIncluded:[(AVChromedLabel *)v4 isIncluded]];
    [(AVLayoutItemAttributes *)v4->_layoutAttributes setHasFlexibleContentSize:0];
    v8 = v4->_layoutAttributes;
    id v9 = [(AVChromedLabel *)v4 accessibilityIdentifier];
    [(AVLayoutItemAttributes *)v8 setAccessibilityIdentifier:v9];
  }
  return v4;
}

@end