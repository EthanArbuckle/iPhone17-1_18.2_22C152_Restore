@interface DMCEnrollmentInstallAppButtonView
- (ASCLockupView)lockupView;
- (BOOL)lockupViewShouldSupportDSIDLessInstalls:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (DMCEnrollmentInstallAppButtonView)initWithLockupRequest:(id)a3 lockupViewGroup:(id)a4 beginInstallationHandler:(id)a5 completionHandler:(id)a6;
- (double)preferredHeight;
- (id)beginInstallationHandler;
- (id)completionHandler;
- (id)presentingViewControllerForLockupView:(id)a3;
- (void)layoutSubviews;
- (void)lockupView:(id)a3 appStateDidChange:(id)a4;
- (void)setBeginInstallationHandler:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setLockupView:(id)a3;
- (void)setPreferredHeight:(double)a3;
@end

@implementation DMCEnrollmentInstallAppButtonView

- (DMCEnrollmentInstallAppButtonView)initWithLockupRequest:(id)a3 lockupViewGroup:(id)a4 beginInstallationHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)DMCEnrollmentInstallAppButtonView;
  double v14 = *MEMORY[0x263F001A8];
  double v15 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v16 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v17 = *(double *)(MEMORY[0x263F001A8] + 24);
  v18 = -[DMCEnrollmentInstallAppButtonView initWithFrame:](&v26, sel_initWithFrame_, *MEMORY[0x263F001A8], v15, v16, v17);
  if (v18)
  {
    uint64_t v19 = MEMORY[0x223C90320](v13);
    id completionHandler = v18->_completionHandler;
    v18->_id completionHandler = (id)v19;

    uint64_t v21 = MEMORY[0x223C90320](v12);
    id beginInstallationHandler = v18->_beginInstallationHandler;
    v18->_id beginInstallationHandler = (id)v21;

    uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x263F25380]), "initWithFrame:", v14, v15, v16, v17);
    lockupView = v18->_lockupView;
    v18->_lockupView = (ASCLockupView *)v23;

    [(ASCLockupView *)v18->_lockupView setLockupSize:*MEMORY[0x263F25338]];
    [(ASCLockupView *)v18->_lockupView setGroup:v11];
    [(ASCLockupView *)v18->_lockupView setRequest:v10];
    [(ASCLockupView *)v18->_lockupView setDelegate:v18];
    [(DMCEnrollmentInstallAppButtonView *)v18 addSubview:v18->_lockupView];
  }

  return v18;
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)DMCEnrollmentInstallAppButtonView;
  [(DMCEnrollmentInstallAppButtonView *)&v15 layoutSubviews];
  v3 = [(DMCEnrollmentInstallAppButtonView *)self lockupView];
  [(DMCEnrollmentInstallAppButtonView *)self bounds];
  objc_msgSend(v3, "sizeThatFits:", v4, 1.79769313e308);
  double v6 = v5;
  double v8 = v7;

  if ([MEMORY[0x263F38B98] isPad])
  {
    [(DMCEnrollmentInstallAppButtonView *)self bounds];
    CGFloat v9 = (CGRectGetWidth(v16) + -360.0) * 0.5;
    id v10 = [(DMCEnrollmentInstallAppButtonView *)self lockupView];
    id v11 = v10;
    double v12 = 360.0;
    double v13 = v9;
  }
  else
  {
    id v10 = [(DMCEnrollmentInstallAppButtonView *)self lockupView];
    id v11 = v10;
    double v13 = 0.0;
    double v12 = v6;
  }
  objc_msgSend(v10, "setFrame:", v13, 0.0, v12, v8);

  double v14 = [(DMCEnrollmentInstallAppButtonView *)self lockupView];
  [v14 setAutoresizingMask:18];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [(DMCEnrollmentInstallAppButtonView *)self preferredHeight];
  if (v5 == 0.0)
  {
    double v6 = [MEMORY[0x263F5B898] boldButton];
    [v6 setTitle:@" " forState:0];
    [v6 intrinsicContentSize];
    double v8 = v7;
    CGFloat v9 = [MEMORY[0x263F5B8D0] linkButton];
    [v9 setTitle:@" " forState:0];
    [v9 intrinsicContentSize];
    [(DMCEnrollmentInstallAppButtonView *)self setPreferredHeight:v8 + v10 + 3.0];
  }
  [(DMCEnrollmentInstallAppButtonView *)self preferredHeight];
  double v12 = v11;
  double v13 = width;
  result.height = v12;
  result.CGFloat width = v13;
  return result;
}

- (BOOL)lockupViewShouldSupportDSIDLessInstalls:(id)a3
{
  return 1;
}

- (id)presentingViewControllerForLockupView:(id)a3
{
  return 0;
}

- (void)lockupView:(id)a3 appStateDidChange:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([v6 isEqualToString:*MEMORY[0x263F252E0]])
  {
    uint64_t v7 = [(DMCEnrollmentInstallAppButtonView *)self beginInstallationHandler];
LABEL_6:
    double v8 = (void *)v7;
    (*(void (**)(void))(v7 + 16))();

    goto LABEL_7;
  }
  if (([v6 isEqualToString:*MEMORY[0x263F252B8]] & 1) != 0
    || [v6 isEqualToString:*MEMORY[0x263F252C8]])
  {
    [v9 setHidden:1];
    uint64_t v7 = [(DMCEnrollmentInstallAppButtonView *)self completionHandler];
    goto LABEL_6;
  }
LABEL_7:
}

- (ASCLockupView)lockupView
{
  return self->_lockupView;
}

- (void)setLockupView:(id)a3
{
}

- (double)preferredHeight
{
  return self->_preferredHeight;
}

- (void)setPreferredHeight:(double)a3
{
  self->_preferredHeight = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)beginInstallationHandler
{
  return self->_beginInstallationHandler;
}

- (void)setBeginInstallationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_beginInstallationHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_lockupView, 0);
}

@end