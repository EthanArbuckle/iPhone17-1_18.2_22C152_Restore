@interface MRUNowPlayingContainerView
- (BOOL)showSeparator;
- (BOOL)supportsHorizontalLayout;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MRUNowPlayingContainerView)initWithFrame:(CGRect)a3;
- (MRUVisualStylingProvider)stylingProvider;
- (UIView)backgroundView;
- (UIView)contentView;
- (UIView)separatorView;
- (void)layoutSubviews;
- (void)setBackgroundView:(id)a3;
- (void)setContentView:(id)a3;
- (void)setSeparatorView:(id)a3;
- (void)setShowSeparator:(BOOL)a3;
- (void)setStylingProvider:(id)a3;
- (void)setSupportsHorizontalLayout:(BOOL)a3;
- (void)updateVisibility;
- (void)updateVisualStyling;
@end

@implementation MRUNowPlayingContainerView

- (MRUNowPlayingContainerView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)MRUNowPlayingContainerView;
  v3 = -[MRUNowPlayingContainerView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MRUNowPlayingContainerView *)v3 setClipsToBounds:1];
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = v5;

    v7 = [MEMORY[0x1E4FB1618] blackColor];
    [(UIView *)v4->_backgroundView setBackgroundColor:v7];

    [(UIView *)v4->_backgroundView setAlpha:0.1];
    [(UIView *)v4->_backgroundView _setDrawsAsBackdropOverlayWithBlendMode:1];
    [(MRUNowPlayingContainerView *)v4 addSubview:v4->_backgroundView];
    v8 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    separatorView = v4->_separatorView;
    v4->_separatorView = v8;

    v10 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIView *)v4->_separatorView setBackgroundColor:v10];

    [(MRUNowPlayingContainerView *)v4 addSubview:v4->_separatorView];
    v4->_showSeparator = 1;
    [(MRUNowPlayingContainerView *)v4 updateVisibility];
  }
  return v4;
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)MRUNowPlayingContainerView;
  [(MRUNowPlayingContainerView *)&v23 layoutSubviews];
  [(MRUNowPlayingContainerView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  if (self->_supportsHorizontalLayout && !MRULayoutShouldBeVertical())
  {
    v17 = [(MRUNowPlayingContainerView *)self traitCollection];
    [v17 displayScale];
    CGFloat v19 = 1.0 / v18;

    v28.origin.x = v4;
    v28.origin.y = v6;
    v28.size.width = v8;
    v28.size.height = v10;
    CGFloat MinX = CGRectGetMinX(v28);
    v29.origin.x = v4;
    v29.origin.y = v6;
    v29.size.width = v8;
    v29.size.height = v10;
    CGFloat MinY = CGRectGetMinY(v29);
    v30.origin.x = v4;
    v30.origin.y = v6;
    v30.size.width = v8;
    v30.size.height = v10;
    CGFloat Height = CGRectGetHeight(v30);
    [(MRUNowPlayingContainerView *)self bounds];
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    -[UIView setFrame:](self->_separatorView, "setFrame:");
    v31.origin.x = MinX;
    v31.origin.y = MinY;
    v31.size.width = v19;
    v31.size.height = Height;
    CGRectGetWidth(v31);
  }
  else
  {
    v11 = [(MRUNowPlayingContainerView *)self traitCollection];
    [v11 displayScale];
    CGFloat v13 = 1.0 / v12;

    v24.origin.x = v4;
    v24.origin.y = v6;
    v24.size.width = v8;
    v24.size.height = v10;
    double v14 = CGRectGetMinX(v24);
    v25.origin.x = v4;
    v25.origin.y = v6;
    v25.size.width = v8;
    v25.size.height = v10;
    double v15 = CGRectGetMinY(v25);
    v26.origin.x = v4;
    v26.origin.y = v6;
    v26.size.width = v8;
    v26.size.height = v10;
    double Width = CGRectGetWidth(v26);
    -[UIView setFrame:](self->_separatorView, "setFrame:", v14, v15, Width, v13);
    v27.origin.x = v14;
    v27.origin.y = v15;
    v27.size.width = Width;
    v27.size.height = v13;
    CGRectGetHeight(v27);
  }
  UIRectInset();
  [(MRUNowPlayingContainerView *)self bounds];
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  [(MRUNowPlayingContainerView *)self bounds];
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[UIView setFrame:](self->_contentView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = 0.0;
  if (self->_showSeparator && self->_supportsHorizontalLayout && !MRULayoutShouldBeVertical())
  {
    double v7 = [(MRUNowPlayingContainerView *)self traitCollection];
    [v7 displayScale];
    double v9 = 1.0 / v8;

    double height = height - v9;
    double v6 = v9 + 0.0;
  }
  -[UIView sizeThatFits:](self->_contentView, "sizeThatFits:", width, height);
  double v11 = v6 + v10;
  double v12 = width;
  result.double height = v11;
  result.double width = v12;
  return result;
}

- (void)setContentView:(id)a3
{
  double v5 = (UIView *)a3;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    [(UIView *)contentView removeFromSuperview];
    objc_storeStrong((id *)&self->_contentView, a3);
    [(MRUNowPlayingContainerView *)self addSubview:self->_contentView];
    [(MRUNowPlayingContainerView *)self setNeedsLayout];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__MRUNowPlayingContainerView_setContentView___block_invoke;
    v7[3] = &unk_1E5F0D7F8;
    v7[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v7];
  }
}

uint64_t __45__MRUNowPlayingContainerView_setContentView___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)setStylingProvider:(id)a3
{
  double v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  if (stylingProvider != v5)
  {
    double v7 = v5;
    [(MRUVisualStylingProvider *)stylingProvider removeObserver:self];
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    [(MRUVisualStylingProvider *)self->_stylingProvider addObserver:self];
    [(MRUNowPlayingContainerView *)self updateVisualStyling];
    double v5 = v7;
  }
}

- (void)setShowSeparator:(BOOL)a3
{
  if (self->_showSeparator != a3)
  {
    self->_showSeparator = a3;
    [(MRUNowPlayingContainerView *)self updateVisibility];
    [(MRUNowPlayingContainerView *)self setNeedsLayout];
  }
}

- (void)updateVisualStyling
{
}

- (void)updateVisibility
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (BOOL)showSeparator
{
  return self->_showSeparator;
}

- (BOOL)supportsHorizontalLayout
{
  return self->_supportsHorizontalLayout;
}

- (void)setSupportsHorizontalLayout:(BOOL)a3
{
  self->_supportsHorizontalLayout = a3;
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end