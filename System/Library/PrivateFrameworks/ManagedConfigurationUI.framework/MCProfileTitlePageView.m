@interface MCProfileTitlePageView
- (MCProfileTitlePageView)initWithFrame:(CGRect)a3;
- (UIButton)cancelButton;
- (UIButton)infoButton;
- (UIButton)installButton;
- (UIView)bottomBarView;
- (UIView)topBarView;
- (id)_createBottomView;
- (id)_createCancelButton;
- (id)_createInfoButton;
- (id)_createInstallButton;
- (void)layoutSubviews;
- (void)showBottomView:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation MCProfileTitlePageView

- (MCProfileTitlePageView)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)MCProfileTitlePageView;
  v3 = -[MCSectionBasedTableView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MCProfileTitlePageView *)v3 safeAreaInsets];
    double v6 = v5 + 127.0;
    v7 = [(MCSectionBasedTableView *)v4 tableView];
    objc_msgSend(v7, "setContentInset:", 55.0, 0.0, v6, 0.0);

    uint64_t v8 = objc_opt_new();
    topBarView = v4->_topBarView;
    v4->_topBarView = (UIView *)v8;

    v10 = [MEMORY[0x1E4F428B8] secondarySystemBackgroundColor];
    v11 = [v10 colorWithAlphaComponent:0.0];
    [(UIView *)v4->_topBarView setBackgroundColor:v11];

    uint64_t v12 = [(MCProfileTitlePageView *)v4 _createBottomView];
    bottomBarView = v4->_bottomBarView;
    v4->_bottomBarView = (UIView *)v12;

    uint64_t v14 = [(MCProfileTitlePageView *)v4 _createCancelButton];
    cancelButton = v4->_cancelButton;
    v4->_cancelButton = (UIButton *)v14;

    uint64_t v16 = [(MCProfileTitlePageView *)v4 _createInstallButton];
    installButton = v4->_installButton;
    v4->_installButton = (UIButton *)v16;

    uint64_t v18 = [(MCProfileTitlePageView *)v4 _createInfoButton];
    infoButton = v4->_infoButton;
    v4->_infoButton = (UIButton *)v18;

    [(UIView *)v4->_bottomBarView addSubview:v4->_cancelButton];
    [(UIView *)v4->_bottomBarView addSubview:v4->_installButton];
    [(UIView *)v4->_topBarView addSubview:v4->_infoButton];
    [(MCProfileTitlePageView *)v4 addSubview:v4->_topBarView];
  }
  return v4;
}

- (void)layoutSubviews
{
  v30.receiver = self;
  v30.super_class = (Class)MCProfileTitlePageView;
  [(MCSectionBasedTableView *)&v30 layoutSubviews];
  if (MCUIIsiPhone()) {
    double v3 = 44.0;
  }
  else {
    double v3 = 50.0;
  }
  [(MCProfileTitlePageView *)self bounds];
  double Width = CGRectGetWidth(v31);
  double v5 = [(MCProfileTitlePageView *)self topBarView];
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, Width, v3);

  double v6 = [(MCProfileTitlePageView *)self cancelButton];
  [v6 intrinsicContentSize];
  double v8 = v7;

  v9 = [(MCProfileTitlePageView *)self installButton];
  [v9 intrinsicContentSize];
  double v11 = v10;

  [(MCProfileTitlePageView *)self safeAreaInsets];
  double v13 = v12 + v8 + v11 + 17.0 + 10.0;
  [(MCProfileTitlePageView *)self bounds];
  CGFloat v14 = CGRectGetHeight(v32) - v13;
  [(MCProfileTitlePageView *)self bounds];
  double v15 = CGRectGetWidth(v33);
  uint64_t v16 = [(MCProfileTitlePageView *)self bottomBarView];
  objc_msgSend(v16, "setFrame:", 0.0, v14, v15, v13);

  LODWORD(v16) = MCUIIsiPad();
  [(MCProfileTitlePageView *)self bounds];
  double v17 = CGRectGetWidth(v34);
  if (v16)
  {
    double v18 = (v17 + -360.0) * 0.5;
    v19 = [(MCProfileTitlePageView *)self installButton];
    double v20 = 360.0;
  }
  else
  {
    double v20 = v17 + -48.0;
    v19 = [(MCProfileTitlePageView *)self installButton];
    double v18 = 24.0;
  }
  objc_msgSend(v19, "setFrame:", v18, 17.0, v20, v11);

  objc_super v21 = [(MCProfileTitlePageView *)self installButton];
  [v21 frame];
  CGFloat v22 = CGRectGetMaxY(v35) + 5.0;
  [(MCProfileTitlePageView *)self bounds];
  CGFloat v23 = CGRectGetWidth(v36) + -48.0;
  v24 = [(MCProfileTitlePageView *)self cancelButton];
  objc_msgSend(v24, "setFrame:", 24.0, v22, v23, v8);

  v25 = [(MCProfileTitlePageView *)self infoButton];
  [v25 frame];
  double v26 = CGRectGetWidth(v37);

  v27 = [(MCProfileTitlePageView *)self topBarView];
  [v27 bounds];
  CGFloat v28 = CGRectGetWidth(v38) - v26 + -12.0;
  v29 = [(MCProfileTitlePageView *)self infoButton];
  objc_msgSend(v29, "setFrame:", v28, 7.0, v26, 30.0);
}

- (id)_createInstallButton
{
  v2 = [MEMORY[0x1E4F83A80] boldButton];
  double v3 = MCUILocalizedStringByDevice(@"ENROLL_MY");
  [v2 setTitle:v3 forState:0];

  [v2 setTranslatesAutoresizingMaskIntoConstraints:1];
  return v2;
}

- (id)_createCancelButton
{
  v2 = [MEMORY[0x1E4F83AB8] linkButton];
  double v3 = MCUILocalizedString(@"CANCEL_AND_DELETE_PROFILE");
  [v2 setTitle:v3 forState:0];

  [v2 setTranslatesAutoresizingMaskIntoConstraints:1];
  return v2;
}

- (id)_createInfoButton
{
  v2 = [MEMORY[0x1E4F427E0] buttonWithType:1];
  double v3 = MCUILocalizedString(@"CERT_DETAILS");
  [v2 setTitle:v3 forState:0];

  v4 = [MEMORY[0x1E4F428B8] systemBlueColor];
  [v2 setTitleColor:v4 forState:0];

  double v5 = [MEMORY[0x1E4F42A30] systemFontOfSize:17.0];
  double v6 = [v2 titleLabel];
  [v6 setFont:v5];

  [v2 sizeToFit];
  return v2;
}

- (id)_createBottomView
{
  v2 = objc_opt_new();
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    double v3 = [MEMORY[0x1E4F428B8] secondarySystemBackgroundColor];
    [v2 setBackgroundColor:v3];
  }
  else
  {
    v4 = [MEMORY[0x1E4F428B8] systemFillColor];
    double v5 = [v4 colorWithAlphaComponent:0.150000006];
    [v2 setBackgroundColor:v5];

    double v3 = [MEMORY[0x1E4F427D8] effectWithStyle:4];
    double v6 = (void *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:v3];
    [v2 bounds];
    objc_msgSend(v6, "setFrame:");
    [v6 setAutoresizingMask:18];
    [v2 insertSubview:v6 atIndex:0];
  }
  return v2;
}

- (void)showBottomView:(BOOL)a3 animated:(BOOL)a4
{
  double v4 = 0.200000003;
  v5[1] = 3221225472;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[2] = __50__MCProfileTitlePageView_showBottomView_animated___block_invoke;
  v5[3] = &unk_1E6EAD430;
  if (!a4) {
    double v4 = 0.0;
  }
  v5[4] = self;
  BOOL v6 = a3;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v5 animations:v4];
}

void __50__MCProfileTitlePageView_showBottomView_animated___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 40);
  double v2 = (double)*(unint64_t *)&a2;
  id v3 = [*(id *)(a1 + 32) bottomBarView];
  [v3 setAlpha:v2];
}

- (UIView)topBarView
{
  return self->_topBarView;
}

- (UIView)bottomBarView
{
  return self->_bottomBarView;
}

- (UIButton)installButton
{
  return self->_installButton;
}

- (UIButton)infoButton
{
  return self->_infoButton;
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_infoButton, 0);
  objc_storeStrong((id *)&self->_installButton, 0);
  objc_storeStrong((id *)&self->_bottomBarView, 0);
  objc_storeStrong((id *)&self->_topBarView, 0);
}

@end