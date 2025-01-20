@interface CDPWaitingApprovalViewController
- (CDPWaitingApprovalViewController)initWithEscapeOffer:(id)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)remoteApprovalCompletion;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)cancelRemoteApproval;
- (void)escapeOfferSelectedWithOption:(id)a3;
- (void)loadView;
- (void)remoteApprovalSucceeded;
- (void)setRemoteApprovalCompletion:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation CDPWaitingApprovalViewController

- (CDPWaitingApprovalViewController)initWithEscapeOffer:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x263F343A8] sharedInstance];
  v7 = [v6 deviceClass];

  v8 = [MEMORY[0x263F343B8] builderForKey:@"WAITING_APPROVAL_TITLE"];
  v9 = [v8 addDeviceClass:v7];
  v10 = [v9 localizedString];

  v11 = [MEMORY[0x263F343B8] builderForKey:@"WAITING_APPROVAL_SUBTITLE"];
  v12 = [v11 addDeviceClass:v7];
  v13 = [v12 localizedString];

  v14 = [(CDPTableViewController *)self initWithTitle:v10 subTitle:v13];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_escapeOffer, a3);
    [(CDPRemoteValidationEscapeOffer *)v15->_escapeOffer setPresentingViewController:v15];
  }

  return v15;
}

- (void)cancelRemoteApproval
{
  v3 = [(CDPWaitingApprovalViewController *)self remoteApprovalCompletion];

  if (v3)
  {
    id v5 = [(CDPWaitingApprovalViewController *)self remoteApprovalCompletion];
    v4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F342B0] code:-5307 userInfo:0];
    v5[2](v5, 0, v4);
  }
}

- (void)loadView
{
  v21.receiver = self;
  v21.super_class = (Class)CDPWaitingApprovalViewController;
  [(CDPTableViewController *)&v21 loadView];
  v3 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
  spinner = self->_spinner;
  self->_spinner = v3;

  [(UIActivityIndicatorView *)self->_spinner startAnimating];
  id v5 = [(CDPTableViewController *)self tableView];
  [v5 addSubview:self->_spinner];

  id v6 = objc_alloc(MEMORY[0x263F828E0]);
  v7 = (UILabel *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  waitingLabel = self->_waitingLabel;
  self->_waitingLabel = v7;

  v9 = self->_waitingLabel;
  v10 = CDPLocalizedString();
  [(UILabel *)v9 setText:v10];

  v11 = self->_waitingLabel;
  v12 = [MEMORY[0x263F81708] systemFontOfSize:16.0];
  [(UILabel *)v11 setFont:v12];

  [(UILabel *)self->_waitingLabel sizeToFit];
  v13 = [(CDPTableViewController *)self tableView];
  [v13 addSubview:self->_waitingLabel];

  if (self->_escapeOffer)
  {
    v14 = [MEMORY[0x263F824E8] buttonWithType:1];
    escapeButton = self->_escapeButton;
    self->_escapeButton = v14;

    v16 = self->_escapeButton;
    v17 = [(CDPRemoteValidationEscapeOffer *)self->_escapeOffer title];
    [(UIButton *)v16 setTitle:v17 forState:0];

    v18 = [(UIButton *)self->_escapeButton titleLabel];
    v19 = [MEMORY[0x263F81708] systemFontOfSize:17.0];
    [v18 setFont:v19];

    [(UIButton *)self->_escapeButton addTarget:self->_escapeOffer action:sel_handleEscapeAction_ forControlEvents:64];
    [(UIButton *)self->_escapeButton sizeToFit];
    [(UIButton *)self->_escapeButton setAutoresizingMask:12];
    v20 = [(CDPTableViewController *)self tableView];
    [v20 addSubview:self->_escapeButton];
  }
}

- (void)viewDidLayoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)CDPWaitingApprovalViewController;
  [(CDPTableViewController *)&v24 viewDidLayoutSubviews];
  v3 = [(CDPTableViewController *)self tableView];
  [v3 bounds];
  double MidX = CGRectGetMidX(v25);
  [(UIButton *)self->_escapeButton frame];
  double v5 = MidX - CGRectGetWidth(v26) * 0.5;
  id v6 = [(CDPTableViewController *)self tableView];
  [v6 bounds];
  double MaxY = CGRectGetMaxY(v27);
  [(UIButton *)self->_escapeButton frame];
  double v8 = MaxY - CGRectGetHeight(v28) + -10.0;
  [(UIButton *)self->_escapeButton frame];
  double Width = CGRectGetWidth(v29);
  [(UIButton *)self->_escapeButton frame];
  double Height = CGRectGetHeight(v30);

  -[UIButton setFrame:](self->_escapeButton, "setFrame:", v5, v8, Width, Height);
  v11 = [(CDPTableViewController *)self tableView];
  [v11 bounds];
  double v12 = CGRectGetMidX(v31);
  v13 = [(CDPTableViewController *)self tableView];
  [v13 bounds];
  double MidY = CGRectGetMidY(v32);
  [(UIActivityIndicatorView *)self->_spinner frame];
  double v15 = CGRectGetWidth(v33);
  [(UIActivityIndicatorView *)self->_spinner frame];
  double v16 = CGRectGetHeight(v34);

  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:", v12, MidY, v15, v16);
  v35.origin.x = v12;
  v35.origin.y = MidY;
  v35.size.width = v15;
  v35.size.height = v16;
  double v17 = CGRectGetMidX(v35);
  [(UILabel *)self->_waitingLabel frame];
  double v19 = v17 - v18 * 0.5;
  v36.origin.x = v12;
  v36.origin.y = MidY;
  v36.size.width = v15;
  v36.size.height = v16;
  double v20 = CGRectGetMaxY(v36);
  [(UILabel *)self->_waitingLabel frame];
  double v22 = v20 + v21;
  [(UILabel *)self->_waitingLabel frame];
  double v23 = CGRectGetWidth(v37);
  [(UILabel *)self->_waitingLabel frame];
  -[UILabel setFrame:](self->_waitingLabel, "setFrame:", v19, v22, v23, CGRectGetHeight(v38));
}

- (void)remoteApprovalSucceeded
{
  [(UIActivityIndicatorView *)self->_spinner stopAnimating];
  [(UILabel *)self->_waitingLabel setHidden:1];
  [(UILabel *)self->_waitingLabel sizeToFit];
  [(UIButton *)self->_escapeButton removeFromSuperview];
  v3 = [(CDPWaitingApprovalViewController *)self view];
  [v3 setNeedsLayout];

  v4 = [MEMORY[0x263F5FBF8] sharedSpinnerManager];
  double v5 = [(CDPWaitingApprovalViewController *)self navigationItem];
  [v4 startAnimatingInNavItem:v5 forIdentifier:@"waitingApproval"];

  id v6 = [(CDPWaitingApprovalViewController *)self remoteApprovalCompletion];

  if (v6)
  {
    v7 = [(CDPWaitingApprovalViewController *)self remoteApprovalCompletion];
    v7[2](v7, 1, 0);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CDPWaitingApprovalViewController;
  [(CDPWaitingApprovalViewController *)&v3 viewDidAppear:a3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CDPWaitingApprovalViewController;
  [(CDPWaitingApprovalViewController *)&v4 viewDidDisappear:a3];
  objc_super v3 = [MEMORY[0x263F5FBF8] sharedSpinnerManager];
  [v3 stopAnimatingForIdentifier:@"waitingApproval"];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v4 = objc_alloc_init(MEMORY[0x263F82C80]);

  return v4;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 44.0;
}

- (void)escapeOfferSelectedWithOption:(id)a3
{
  id v8 = a3;
  id v4 = [v8 progressTitle];

  if (v4)
  {
    double v5 = [v8 progressTitle];
    [(CDPTableViewController *)self setHeaderTitle:v5];

    [(CDPTableViewController *)self setHeaderSubTitle:0];
    id v6 = [v8 progressLabel];
    [(UILabel *)self->_waitingLabel setText:v6];

    [(UILabel *)self->_waitingLabel sizeToFit];
    [(UIButton *)self->_escapeButton removeFromSuperview];
    v7 = [(CDPWaitingApprovalViewController *)self view];
    [v7 setNeedsLayout];
  }
}

- (id)remoteApprovalCompletion
{
  return self->_remoteApprovalCompletion;
}

- (void)setRemoteApprovalCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_remoteApprovalCompletion, 0);
  objc_storeStrong((id *)&self->_escapeOffer, 0);
  objc_storeStrong((id *)&self->_escapeButton, 0);
  objc_storeStrong((id *)&self->_waitingLabel, 0);

  objc_storeStrong((id *)&self->_spinner, 0);
}

@end