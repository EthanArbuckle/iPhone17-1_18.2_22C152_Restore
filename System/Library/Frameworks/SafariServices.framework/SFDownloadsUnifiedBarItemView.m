@interface SFDownloadsUnifiedBarItemView
- (SFDownloadsUnifiedBarItemView)init;
- (double)preferredWidth;
- (double)progress;
- (void)pulse;
- (void)setProgress:(double)a3;
@end

@implementation SFDownloadsUnifiedBarItemView

- (SFDownloadsUnifiedBarItemView)init
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)SFDownloadsUnifiedBarItemView;
  v2 = [(SFDownloadsUnifiedBarItemView *)&v17 init];
  if (v2)
  {
    uint64_t v3 = +[SFDownloadsBarButtonItemView buttonWithType:1];
    buttonView = v2->_buttonView;
    v2->_buttonView = (SFDownloadsBarButtonItemView *)v3;

    [(SFDownloadsBarButtonItemView *)v2->_buttonView setProgress:-2.0];
    [(SFDownloadsBarButtonItemView *)v2->_buttonView setUserInteractionEnabled:0];
    v5 = [(SFUnifiedBarItemView *)v2 contentView];
    [v5 addSubview:v2->_buttonView];
    v6 = (void *)MEMORY[0x1E4F28DC8];
    v7 = [(SFDownloadsBarButtonItemView *)v2->_buttonView centerXAnchor];
    v8 = [v5 centerXAnchor];
    v9 = [v7 constraintEqualToAnchor:v8];
    v18[0] = v9;
    v10 = [(SFDownloadsBarButtonItemView *)v2->_buttonView centerYAnchor];
    v11 = [v5 centerYAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v18[1] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    [v6 activateConstraints:v13];

    [(SFDownloadsUnifiedBarItemView *)v2 sf_applyContentSizeCategoryLimitsForToolbarButton];
    v14 = _SFAccessibilityIdentifierForBarItem();
    [(SFDownloadsUnifiedBarItemView *)v2 setAccessibilityIdentifier:v14];

    [(SFDownloadsUnifiedBarItemView *)v2 setPointerStyleProvider:&__block_literal_global_69];
    v15 = v2;
  }
  return v2;
}

id __37__SFDownloadsUnifiedBarItemView_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = (void *)MEMORY[0x1E4FB1AE8];
  v5 = (void *)MEMORY[0x1E4FB1AE0];
  id v6 = a3;
  v7 = objc_msgSend(v5, "sf_shapeForToolbarButton:", a2);
  v8 = [v4 styleWithEffect:v6 shape:v7];

  return v8;
}

- (double)preferredWidth
{
  [(SFDownloadsBarButtonItemView *)self->_buttonView intrinsicContentSize];
  return result;
}

- (double)progress
{
  [(SFDownloadsBarButtonItemView *)self->_buttonView progress];
  return result;
}

- (void)setProgress:(double)a3
{
}

- (void)pulse
{
}

- (void).cxx_destruct
{
}

@end