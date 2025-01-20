@interface MRUExpandableButtonSelectionView
- (BOOL)isEnabled;
- (BOOL)isExpanded;
- (MRUCAPackageView)packageView;
- (MRUExpandableButtonSelectionView)initWithFrame:(CGRect)a3;
- (MediaControlsExpandableButtonOption)option;
- (void)layoutSubviews;
- (void)setEnabled:(BOOL)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setOption:(id)a3;
- (void)setPackageView:(id)a3;
- (void)updateVisibility;
@end

@implementation MRUExpandableButtonSelectionView

uint64_t __46__MRUExpandableButtonSelectionView_setOption___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateVisibility];
}

- (void)setOption:(id)a3
{
  objc_storeStrong((id *)&self->_option, a3);
  id v5 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__MRUExpandableButtonSelectionView_setOption___block_invoke;
  v6[3] = &unk_1E5F0D7F8;
  v6[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v6];
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    [(MRUExpandableButtonSelectionView *)self updateVisibility];
  }
}

- (void)updateVisibility
{
  if (self->_enabled)
  {
    if ([(MediaControlsExpandableButtonOption *)self->_option selectedBackground] == 1)
    {
      v3 = [MEMORY[0x1E4FB1618] clearColor];
      [(MRUExpandableButtonSelectionView *)self setBackgroundColor:v3];

      v4 = [(MRUExpandableButtonSelectionView *)self packageView];
      id v11 = v4;
      double v5 = 1.0;
      goto LABEL_12;
    }
    if ([(MediaControlsExpandableButtonOption *)self->_option selectedBackground] == 2)
    {
      uint64_t v7 = [MEMORY[0x1E4FB1618] systemBlueColor];
      goto LABEL_10;
    }
    v8 = [(MediaControlsExpandableButtonOption *)self->_option selectedBackgroundColor];

    if (v8)
    {
      uint64_t v7 = [(MediaControlsExpandableButtonOption *)self->_option selectedBackgroundColor];
      goto LABEL_10;
    }
    v6 = (void *)MEMORY[0x1E4FB1618];
    if (self->_expanded)
    {
      v9 = [MEMORY[0x1E4FB1618] whiteColor];
      v10 = [v9 colorWithAlphaComponent:0.2];
      [(MRUExpandableButtonSelectionView *)self setBackgroundColor:v10];

      goto LABEL_11;
    }
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4FB1618];
  }
  uint64_t v7 = [v6 clearColor];
LABEL_10:
  v9 = (void *)v7;
  [(MRUExpandableButtonSelectionView *)self setBackgroundColor:v7];
LABEL_11:

  v4 = [(MRUExpandableButtonSelectionView *)self packageView];
  id v11 = v4;
  double v5 = 0.0;
LABEL_12:
  [v4 setAlpha:v5];
}

- (MRUCAPackageView)packageView
{
  return self->_packageView;
}

- (MRUExpandableButtonSelectionView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MRUExpandableButtonSelectionView;
  v3 = -[MRUExpandableButtonSelectionView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MRUExpandableButtonSelectionView *)v3 setUserInteractionEnabled:0];
    [(MRUExpandableButtonSelectionView *)v4 setClipsToBounds:1];
    v4->_enabled = 1;
    double v5 = objc_alloc_init(MRUCAPackageView);
    packageView = v4->_packageView;
    v4->_packageView = v5;

    uint64_t v7 = +[MRUCAPackageAsset packageNamed:@"RainbowSelection"];
    [(MRUCAPackageView *)v4->_packageView setAsset:v7];

    [(MRUExpandableButtonSelectionView *)v4 addSubview:v4->_packageView];
  }
  return v4;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)MRUExpandableButtonSelectionView;
  [(MRUExpandableButtonSelectionView *)&v12 layoutSubviews];
  [(MRUExpandableButtonSelectionView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[MRUCAPackageView setFrame:](self->_packageView, "setFrame:");
  v13.origin.x = v4;
  v13.origin.y = v6;
  v13.size.width = v8;
  v13.size.height = v10;
  CGFloat v11 = CGRectGetHeight(v13) * 0.5;
  [(MRUExpandableButtonSelectionView *)self _setCornerRadius:v11];
  [(MRUCAPackageView *)self->_packageView _setCornerRadius:v11];
}

- (void)setExpanded:(BOOL)a3
{
  if (self->_expanded != a3)
  {
    self->_expanded = a3;
    [(MRUExpandableButtonSelectionView *)self updateVisibility];
  }
}

- (MediaControlsExpandableButtonOption)option
{
  return self->_option;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (void)setPackageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packageView, 0);

  objc_storeStrong((id *)&self->_option, 0);
}

@end