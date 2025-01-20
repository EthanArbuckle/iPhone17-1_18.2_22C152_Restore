@interface SFDefaultBrowserPinnedHeaderView
- (ASCLockupView)lockupView;
- (CGSize)intrinsicContentSize;
- (SFDefaultBrowserPinnedHeaderView)initWithFrame:(CGRect)a3;
- (void)setLockupView:(id)a3;
@end

@implementation SFDefaultBrowserPinnedHeaderView

- (SFDefaultBrowserPinnedHeaderView)initWithFrame:(CGRect)a3
{
  v44[4] = *MEMORY[0x1E4F143B8];
  v42.receiver = self;
  v42.super_class = (Class)SFDefaultBrowserPinnedHeaderView;
  v3 = -[SFDefaultBrowserPinnedHeaderView initWithFrame:](&v42, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(SFDefaultBrowserPinnedHeaderView *)v3 setBackgroundColor:v4];

    -[SFDefaultBrowserPinnedHeaderView setLayoutMargins:](v3, "setLayoutMargins:", 11.0, 16.0, 11.0, 16.0);
    [(SFDefaultBrowserPinnedHeaderView *)v3 setHidden:1];
    id v5 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], v7, v8, v9);
    v11 = [MEMORY[0x1E4FB1618] separatorColor];
    [v10 setBackgroundColor:v11];

    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SFDefaultBrowserPinnedHeaderView *)v3 addSubview:v10];
    v35 = (void *)MEMORY[0x1E4F28DC8];
    v39 = [v10 leadingAnchor];
    v37 = [(SFDefaultBrowserPinnedHeaderView *)v3 leadingAnchor];
    v36 = [v39 constraintEqualToAnchor:v37];
    v44[0] = v36;
    v12 = [v10 trailingAnchor];
    v13 = [(SFDefaultBrowserPinnedHeaderView *)v3 trailingAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];
    v44[1] = v14;
    v41 = v10;
    v15 = [v10 bottomAnchor];
    v16 = [(SFDefaultBrowserPinnedHeaderView *)v3 bottomAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    v44[2] = v17;
    v18 = [v10 heightAnchor];
    v19 = [v18 constraintEqualToConstant:1.0];
    v44[3] = v19;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:4];
    [v35 activateConstraints:v20];

    uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB14D0]), "initWithFrame:", v6, v7, v8, v9);
    selectionMarkingButton = v3->_selectionMarkingButton;
    v3->_selectionMarkingButton = (UIButton *)v21;

    [(UIButton *)v3->_selectionMarkingButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v3->_selectionMarkingButton setMaximumContentSizeCategory:*MEMORY[0x1E4FB27B0]];
    v40 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28C8] scale:3];
    v38 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.circle.fill" withConfiguration:v40];
    [(UIButton *)v3->_selectionMarkingButton setImage:v38 forState:0];
    LODWORD(v23) = 1144750080;
    [(UIButton *)v3->_selectionMarkingButton setContentHuggingPriority:0 forAxis:v23];
    [(SFDefaultBrowserPinnedHeaderView *)v3 addSubview:v3->_selectionMarkingButton];
    v24 = [(SFDefaultBrowserPinnedHeaderView *)v3 layoutMarginsGuide];
    v25 = (void *)MEMORY[0x1E4F28DC8];
    v26 = [(UIButton *)v3->_selectionMarkingButton leadingAnchor];
    v27 = [v24 leadingAnchor];
    v28 = [v26 constraintEqualToAnchor:v27];
    v43[0] = v28;
    v29 = [(UIButton *)v3->_selectionMarkingButton centerYAnchor];
    v30 = [v24 centerYAnchor];
    v31 = [v29 constraintEqualToAnchor:v30];
    v43[1] = v31;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
    [v25 activateConstraints:v32];

    v33 = v3;
  }

  return v3;
}

- (void)setLockupView:(id)a3
{
  v27[4] = *MEMORY[0x1E4F143B8];
  id v5 = (ASCLockupView *)a3;
  p_lockupView = &self->_lockupView;
  lockupView = self->_lockupView;
  if (lockupView != v5)
  {
    [(ASCLockupView *)lockupView removeFromSuperview];
    objc_storeStrong((id *)&self->_lockupView, a3);
    if (v5)
    {
      [(ASCLockupView *)*p_lockupView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(ASCLockupView *)*p_lockupView setUserInteractionEnabled:0];
      [(ASCLockupView *)*p_lockupView setMaximumContentSizeCategory:*MEMORY[0x1E4FB27B0]];
      [(SFDefaultBrowserPinnedHeaderView *)self addSubview:*p_lockupView];
      double v8 = [(SFDefaultBrowserPinnedHeaderView *)self layoutMarginsGuide];
      v20 = (void *)MEMORY[0x1E4F28DC8];
      v25 = [(ASCLockupView *)*p_lockupView topAnchor];
      v24 = [v8 topAnchor];
      double v23 = [v25 constraintEqualToAnchor:v24];
      v27[0] = v23;
      v22 = [(ASCLockupView *)*p_lockupView bottomAnchor];
      uint64_t v21 = [v8 bottomAnchor];
      double v9 = [v22 constraintEqualToAnchor:v21];
      v27[1] = v9;
      v10 = [(ASCLockupView *)*p_lockupView leadingAnchor];
      v11 = [(UIButton *)self->_selectionMarkingButton trailingAnchor];
      v12 = [v10 constraintEqualToAnchor:v11 constant:18.0];
      v27[2] = v12;
      v13 = [(ASCLockupView *)*p_lockupView trailingAnchor];
      v26 = v8;
      v14 = [v8 trailingAnchor];
      v15 = [v13 constraintEqualToAnchor:v14];
      v27[3] = v15;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
      [v20 activateConstraints:v16];

      [(SFDefaultBrowserPinnedHeaderView *)self setSemanticContentAttribute:3];
      v17 = [(ASCLockupView *)v5 subviews];
      v18 = [v17 firstObject];
      uint64_t v19 = [v18 effectiveUserInterfaceLayoutDirection];

      if (v19 == 1) {
        [(SFDefaultBrowserPinnedHeaderView *)self setSemanticContentAttribute:4];
      }
    }
  }
}

- (CGSize)intrinsicContentSize
{
  [(SFDefaultBrowserPinnedHeaderView *)self bounds];
  v3 = [(SFDefaultBrowserPinnedHeaderView *)self traitCollection];
  ASCLockupViewSizeGetEstimatedSize();
  double v5 = v4;
  double v7 = v6;

  double v8 = 112.0;
  if (v7 < 90.0) {
    double v8 = v7 + 22.0;
  }
  double v9 = v5;
  result.height = v8;
  result.width = v9;
  return result;
}

- (ASCLockupView)lockupView
{
  return self->_lockupView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockupView, 0);

  objc_storeStrong((id *)&self->_selectionMarkingButton, 0);
}

@end