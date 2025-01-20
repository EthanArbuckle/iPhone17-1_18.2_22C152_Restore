@interface DMCEnrollmentTableViewAppLockupCell
- (ASCLockupView)lockupView;
- (DMCEnrollmentTableViewAppLockupCell)initWithLockupRequest:(id)a3 lockupViewGroup:(id)a4 presentingViewController:(id)a5;
- (NSNumber)iTunesItemID;
- (UIViewController)presentingViewController;
- (double)cellHeight;
- (double)estimatedCellHeight;
- (void)layoutSubviews;
- (void)setITunesItemID:(id)a3;
- (void)setLockupView:(id)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation DMCEnrollmentTableViewAppLockupCell

- (DMCEnrollmentTableViewAppLockupCell)initWithLockupRequest:(id)a3 lockupViewGroup:(id)a4 presentingViewController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  v29.receiver = self;
  v29.super_class = (Class)DMCEnrollmentTableViewAppLockupCell;
  v13 = [(DMCEnrollmentTableViewAppLockupCell *)&v29 initWithStyle:0 reuseIdentifier:v12];

  if (v13)
  {
    v14 = [MEMORY[0x263F1C550] systemBackgroundColor];
    [(DMCEnrollmentTableViewAppLockupCell *)v13 setBackgroundColor:v14];

    v15 = [MEMORY[0x263F1C550] secondarySystemBackgroundColor];
    v16 = [(DMCEnrollmentTableViewAppLockupCell *)v13 contentView];
    [v16 setBackgroundColor:v15];

    v17 = [(DMCEnrollmentTableViewAppLockupCell *)v13 contentView];
    v18 = [v17 layer];
    [v18 setCornerRadius:15.0];

    v19 = [(DMCEnrollmentTableViewAppLockupCell *)v13 contentView];
    v20 = [v19 layer];
    [v20 setMasksToBounds:1];

    [(DMCEnrollmentTableViewAppLockupCell *)v13 setSelectionStyle:0];
    objc_storeWeak((id *)&v13->_presentingViewController, v10);
    id v21 = objc_alloc(MEMORY[0x263F25380]);
    uint64_t v22 = objc_msgSend(v21, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    lockupView = v13->_lockupView;
    v13->_lockupView = (ASCLockupView *)v22;

    [(ASCLockupView *)v13->_lockupView setLockupSize:*MEMORY[0x263F25340]];
    [(ASCLockupView *)v13->_lockupView setShowsPlaceholderContent:1];
    [(ASCLockupView *)v13->_lockupView setGroup:v9];
    [(ASCLockupView *)v13->_lockupView setRequest:v8];
    [(ASCLockupView *)v13->_lockupView setDelegate:v13];
    v24 = [MEMORY[0x263F25368] viewInAppStoreOfferForLockupView:v13->_lockupView];
    v25 = [(ASCLockupView *)v13->_lockupView lockup];
    v26 = [v25 lockupWithOffer:v24];
    [(ASCLockupView *)v13->_lockupView setLockup:v26];

    v27 = [(DMCEnrollmentTableViewAppLockupCell *)v13 contentView];
    [v27 addSubview:v13->_lockupView];
  }
  return v13;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)DMCEnrollmentTableViewAppLockupCell;
  [(DMCEnrollmentTableViewAppLockupCell *)&v12 layoutSubviews];
  [(DMCEnrollmentTableViewAppLockupCell *)self bounds];
  -[DMCEnrollmentTableViewAppLockupCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, CGRectGetWidth(v13), 0.0, 0.0);
  [(DMCEnrollmentTableViewAppLockupCell *)self bounds];
  double Width = CGRectGetWidth(v14);
  [(DMCEnrollmentTableViewAppLockupCell *)self bounds];
  CGFloat v4 = CGRectGetHeight(v15) + -20.0;
  v5 = [(DMCEnrollmentTableViewAppLockupCell *)self contentView];
  objc_msgSend(v5, "setFrame:", 0.0, 10.0, Width, v4);

  v6 = [(DMCEnrollmentTableViewAppLockupCell *)self contentView];
  [v6 bounds];
  CGFloat v7 = CGRectGetWidth(v16) + -30.0;
  id v8 = [(DMCEnrollmentTableViewAppLockupCell *)self contentView];
  [v8 bounds];
  CGFloat v9 = CGRectGetHeight(v17) + -30.0;
  id v10 = [(DMCEnrollmentTableViewAppLockupCell *)self lockupView];
  objc_msgSend(v10, "setFrame:", 15.0, 15.0, v7, v9);

  v11 = [(DMCEnrollmentTableViewAppLockupCell *)self lockupView];
  [v11 setAutoresizingMask:18];
}

- (double)cellHeight
{
  v3 = [(DMCEnrollmentTableViewAppLockupCell *)self contentView];
  [v3 bounds];
  double Width = CGRectGetWidth(v9);

  v5 = [(DMCEnrollmentTableViewAppLockupCell *)self lockupView];
  objc_msgSend(v5, "sizeThatFits:", Width, 1.79769313e308);
  double v7 = v6;

  return v7 + 30.0 + 20.0;
}

- (double)estimatedCellHeight
{
  return 112.0;
}

- (ASCLockupView)lockupView
{
  return self->_lockupView;
}

- (void)setLockupView:(id)a3
{
}

- (NSNumber)iTunesItemID
{
  return self->_iTunesItemID;
}

- (void)setITunesItemID:(id)a3
{
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_iTunesItemID, 0);
  objc_storeStrong((id *)&self->_lockupView, 0);
}

@end