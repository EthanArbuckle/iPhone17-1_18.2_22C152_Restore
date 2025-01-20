@interface MRUMediaControlsModuleRoutingView
- (CGSize)contentSize;
- (MRUMediaControlsModuleRoutingView)initWithFrame:(CGRect)a3;
- (MRUVisualStylingProvider)stylingProvider;
- (UIView)backgroundView;
- (UIView)contentView;
- (UIView)separatorView;
- (void)layoutSubviews;
- (void)setBackgroundView:(id)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setContentView:(id)a3;
- (void)setSeparatorView:(id)a3;
- (void)setStylingProvider:(id)a3;
- (void)updateVisualStyling;
@end

@implementation MRUMediaControlsModuleRoutingView

- (MRUMediaControlsModuleRoutingView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)MRUMediaControlsModuleRoutingView;
  v3 = -[MRUMediaControlsModuleRoutingView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MRUMediaControlsModuleRoutingView *)v3 setClipsToBounds:1];
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = v5;

    v7 = [MEMORY[0x1E4FB1618] colorWithWhite:0.952941176 alpha:1.0];
    [(UIView *)v4->_backgroundView setBackgroundColor:v7];

    [(MRUMediaControlsModuleRoutingView *)v4 addSubview:v4->_backgroundView];
    [(UIView *)v4->_backgroundView _setDrawsAsBackdropOverlayWithBlendMode:1];
    v8 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    separatorView = v4->_separatorView;
    v4->_separatorView = v8;

    v10 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIView *)v4->_separatorView setBackgroundColor:v10];

    [(MRUMediaControlsModuleRoutingView *)v4 addSubview:v4->_separatorView];
  }
  return v4;
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)MRUMediaControlsModuleRoutingView;
  [(MRUMediaControlsModuleRoutingView *)&v21 layoutSubviews];
  [(MRUMediaControlsModuleRoutingView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat width = self->_contentSize.width;
  CGFloat height = self->_contentSize.height;
  BOOL ShouldBeVertical = MRULayoutShouldBeVertical();
  v10 = [(MRUMediaControlsModuleRoutingView *)self traitCollection];
  [v10 displayScale];
  double v12 = 1.0 / v11;

  v22.origin.x = v4;
  v22.origin.y = v6;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v22);
  v23.origin.x = v4;
  v23.origin.y = v6;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v23);
  CGFloat v15 = v4;
  CGFloat v16 = v6;
  CGFloat v17 = width;
  CGFloat v18 = height;
  if (ShouldBeVertical)
  {
    double v19 = CGRectGetWidth(*(CGRect *)&v15);
    -[UIView setFrame:](self->_separatorView, "setFrame:", MinX, MinY, v19, v12);
    v24.origin.x = MinX;
    v24.origin.y = MinY;
    v24.size.CGFloat width = v19;
    v24.size.CGFloat height = v12;
    CGRectGetHeight(v24);
  }
  else
  {
    CGFloat v20 = CGRectGetHeight(*(CGRect *)&v15);
    [(MRUMediaControlsModuleRoutingView *)self bounds];
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    -[UIView setFrame:](self->_separatorView, "setFrame:");
    v25.origin.x = MinX;
    v25.origin.y = MinY;
    v25.size.CGFloat width = v12;
    v25.size.CGFloat height = v20;
    CGRectGetWidth(v25);
  }
  UIRectInset();
  [(MRUMediaControlsModuleRoutingView *)self bounds];
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  [(MRUMediaControlsModuleRoutingView *)self bounds];
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[UIView setFrame:](self->_contentView, "setFrame:");
}

- (void)setContentView:(id)a3
{
  double v5 = (UIView *)a3;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    [(UIView *)contentView removeFromSuperview];
    objc_storeStrong((id *)&self->_contentView, a3);
    [(MRUMediaControlsModuleRoutingView *)self addSubview:self->_contentView];
    [(MRUMediaControlsModuleRoutingView *)self setNeedsLayout];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52__MRUMediaControlsModuleRoutingView_setContentView___block_invoke;
    v7[3] = &unk_1E5F0D7F8;
    v7[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v7];
  }
}

uint64_t __52__MRUMediaControlsModuleRoutingView_setContentView___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)setStylingProvider:(id)a3
{
  double v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  if (stylingProvider != v5)
  {
    v7 = v5;
    [(MRUVisualStylingProvider *)stylingProvider removeObserver:self];
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    [(MRUVisualStylingProvider *)self->_stylingProvider addObserver:self];
    [(MRUMediaControlsModuleRoutingView *)self updateVisualStyling];
    double v5 = v7;
  }
}

- (void)setContentSize:(CGSize)a3
{
  if (a3.width != self->_contentSize.width || a3.height != self->_contentSize.height)
  {
    self->_contentSize = a3;
    [(MRUMediaControlsModuleRoutingView *)self setNeedsLayout];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __52__MRUMediaControlsModuleRoutingView_setContentSize___block_invoke;
    v5[3] = &unk_1E5F0D7F8;
    v5[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v5];
  }
}

uint64_t __52__MRUMediaControlsModuleRoutingView_setContentSize___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)updateVisualStyling
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

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
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