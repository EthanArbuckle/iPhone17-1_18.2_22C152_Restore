@interface AVLoadingButtonView
- (AVButton)button;
- (AVLayoutItemAttributes)layoutAttributes;
- (AVLoadingButtonView)initWithTitle:(id)a3;
- (BOOL)hasAlternateAppearance;
- (BOOL)hasFullScreenAppearance;
- (BOOL)isCollapsed;
- (BOOL)isCollapsedOrExcluded;
- (BOOL)isIncluded;
- (BOOL)isRemoved;
- (BOOL)showsLoadingIndicator;
- (CGSize)extrinsicContentSize;
- (CGSize)intrinsicContentSize;
- (UIActivityIndicatorView)loadingIndicator;
- (void)_updateLayoutItem;
- (void)layoutAttributesDidChange;
- (void)layoutSubviews;
- (void)setCollapsed:(BOOL)a3;
- (void)setExtrinsicContentSize:(CGSize)a3;
- (void)setHasAlternateAppearance:(BOOL)a3;
- (void)setHasFullScreenAppearance:(BOOL)a3;
- (void)setIncluded:(BOOL)a3;
- (void)setLoadingIndicator:(id)a3;
- (void)setRemoved:(BOOL)a3;
- (void)setShowsLoadingIndicator:(BOOL)a3;
@end

@implementation AVLoadingButtonView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingIndicator, 0);
  objc_storeStrong((id *)&self->_button, 0);

  objc_storeStrong((id *)&self->_layoutAttributes, 0);
}

- (void)setLoadingIndicator:(id)a3
{
}

- (UIActivityIndicatorView)loadingIndicator
{
  return self->_loadingIndicator;
}

- (BOOL)showsLoadingIndicator
{
  return self->_showsLoadingIndicator;
}

- (AVButton)button
{
  return self->_button;
}

- (AVLayoutItemAttributes)layoutAttributes
{
  return self->_layoutAttributes;
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (BOOL)hasAlternateAppearance
{
  return self->_hasAlternateAppearance;
}

- (BOOL)hasFullScreenAppearance
{
  return self->_hasFullScreenAppearance;
}

- (BOOL)isIncluded
{
  return self->_included;
}

- (BOOL)isRemoved
{
  return self->_removed;
}

- (void)_updateLayoutItem
{
  v3 = [(AVLoadingButtonView *)self layoutAttributes];
  [(AVLoadingButtonView *)self intrinsicContentSize];
  objc_msgSend(v3, "setMinimumSize:");

  v4 = [(AVLoadingButtonView *)self layoutAttributes];
  if ([(AVLoadingButtonView *)self isIncluded]) {
    uint64_t v5 = [(AVLoadingButtonView *)self isRemoved] ^ 1;
  }
  else {
    uint64_t v5 = 0;
  }
  [v4 setIncluded:v5];

  id v6 = [(AVLoadingButtonView *)self layoutAttributes];
  objc_msgSend(v6, "setCollapsed:", -[AVLoadingButtonView isCollapsed](self, "isCollapsed"));
}

- (void)layoutAttributesDidChange
{
  id v3 = [(AVLoadingButtonView *)self layoutAttributes];
  -[AVLoadingButtonView setCollapsed:](self, "setCollapsed:", [v3 isCollapsed]);
}

- (void)setHasAlternateAppearance:(BOOL)a3
{
  if (self->_hasAlternateAppearance != a3)
  {
    BOOL v3 = a3;
    self->_hasAlternateAppearance = a3;
    id v4 = [(AVLoadingButtonView *)self button];
    [v4 setHasAlternateAppearance:v3];
  }
}

- (void)setHasFullScreenAppearance:(BOOL)a3
{
  if (self->_hasFullScreenAppearance != a3)
  {
    BOOL v3 = a3;
    self->_hasFullScreenAppearance = a3;
    id v4 = [(AVLoadingButtonView *)self button];
    [v4 setHasFullScreenAppearance:v3];
  }
}

- (void)setRemoved:(BOOL)a3
{
  if (self->_removed != a3)
  {
    self->_removed = a3;
    [(UIView *)self avkit_reevaluateHiddenStateOfItem:self];
    [(AVLoadingButtonView *)self _updateLayoutItem];
  }
}

- (void)setCollapsed:(BOOL)a3
{
  if (self->_collapsed != a3)
  {
    self->_collapsed = a3;
    [(AVLoadingButtonView *)self _updateLayoutItem];
    [(UIView *)self avkit_reevaluateHiddenStateOfItem:self];
  }
}

- (void)setIncluded:(BOOL)a3
{
  if (self->_included != a3)
  {
    self->_included = a3;
    [(AVLoadingButtonView *)self _updateLayoutItem];
    [(UIView *)self avkit_reevaluateHiddenStateOfItem:self];
  }
}

- (BOOL)isCollapsedOrExcluded
{
  if ([(AVLoadingButtonView *)self isCollapsed] || ![(AVLoadingButtonView *)self isIncluded]) {
    return 1;
  }

  return [(AVLoadingButtonView *)self isRemoved];
}

- (CGSize)extrinsicContentSize
{
  v2 = [(AVLoadingButtonView *)self button];
  [v2 extrinsicContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setExtrinsicContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(AVLoadingButtonView *)self button];
  objc_msgSend(v6, "setExtrinsicContentSize:", width, height);

  [(AVLoadingButtonView *)self _updateLayoutItem];
}

- (CGSize)intrinsicContentSize
{
  v2 = [(AVLoadingButtonView *)self button];
  [v2 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)AVLoadingButtonView;
  [(AVLoadingButtonView *)&v17 layoutSubviews];
  [(AVLoadingButtonView *)self center];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(AVLoadingButtonView *)self loadingIndicator];
  objc_msgSend(v7, "setCenter:", v4, v6);

  [(AVLoadingButtonView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [(AVLoadingButtonView *)self button];
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);
}

- (void)setShowsLoadingIndicator:(BOOL)a3
{
  if (self->_showsLoadingIndicator != a3)
  {
    BOOL v3 = a3;
    self->_showsLoadingIndicator = a3;
    double v5 = [(AVLoadingButtonView *)self button];
    double v6 = v5;
    if (v3)
    {
      [v5 setHidden:1];

      id v7 = [(AVLoadingButtonView *)self loadingIndicator];
      [v7 startAnimating];
    }
    else
    {
      [v5 setHidden:0];

      id v7 = [(AVLoadingButtonView *)self loadingIndicator];
      [v7 stopAnimating];
    }
  }
}

- (AVLoadingButtonView)initWithTitle:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)AVLoadingButtonView;
  double v5 = -[AVLoadingButtonView initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v6 = v5;
  if (v5)
  {
    [(AVLoadingButtonView *)v5 setUserInteractionEnabled:1];
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    loadingIndicator = v6->_loadingIndicator;
    v6->_loadingIndicator = (UIActivityIndicatorView *)v7;

    double v9 = v6->_loadingIndicator;
    double v10 = [MEMORY[0x1E4FB1618] blackColor];
    [(UIActivityIndicatorView *)v9 setColor:v10];

    uint64_t v11 = +[AVButton buttonWithAccessibilityIdentifier:v4 isSecondGeneration:0];
    button = v6->_button;
    v6->_button = (AVButton *)v11;

    [(AVButton *)v6->_button setAccessibilityLabel:v4];
    [(AVButton *)v6->_button setTitle:v4 forState:0];
    double v13 = [(AVButton *)v6->_button titleLabel];
    double v14 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
    [v13 setFont:v14];

    v6->_included = 1;
    v6->_showsLoadingIndicator = 0;
    double v15 = objc_alloc_init(AVLayoutItemAttributes);
    layoutAttributes = v6->_layoutAttributes;
    v6->_layoutAttributes = v15;

    objc_super v17 = v6->_layoutAttributes;
    [(AVLoadingButtonView *)v6 intrinsicContentSize];
    -[AVLayoutItemAttributes setMinimumSize:](v17, "setMinimumSize:");
    [(AVLayoutItemAttributes *)v6->_layoutAttributes setCollapsed:[(AVLoadingButtonView *)v6 isCollapsed]];
    [(AVLayoutItemAttributes *)v6->_layoutAttributes setIncluded:[(AVLoadingButtonView *)v6 isIncluded]];
    [(AVLayoutItemAttributes *)v6->_layoutAttributes setHasFlexibleContentSize:0];
    v18 = v6->_layoutAttributes;
    v19 = [(AVButton *)v6->_button accessibilityIdentifier];
    [(AVLayoutItemAttributes *)v18 setAccessibilityIdentifier:v19];

    [(AVLoadingButtonView *)v6 addSubview:v6->_loadingIndicator];
    [(AVLoadingButtonView *)v6 addSubview:v6->_button];
  }

  return v6;
}

@end