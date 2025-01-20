@interface CDPUIPiggybackingViewController
- (CDPUIPiggybackingViewController)initWithViewModel:(id)a3 cdpContext:(id)a4;
- (void)_handleCantGetToDevicesButtonAction:(id)a3;
- (void)_handleSendCodeAction:(id)a3;
- (void)startSpinning;
- (void)stopSpinning;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CDPUIPiggybackingViewController

- (CDPUIPiggybackingViewController)initWithViewModel:(id)a3 cdpContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = (void *)MEMORY[0x263F827E8];
  v11 = [v7 iconName];
  v12 = [v10 imageNamed:v11 inBundle:v9];

  v13 = [v7 title];
  v14 = [v7 message];
  v19.receiver = self;
  v19.super_class = (Class)CDPUIPiggybackingViewController;
  v15 = [(CDPUIPiggybackingViewController *)&v19 initWithTitle:v13 detailText:v14 icon:v12 contentLayout:2];

  if (v15)
  {
    objc_storeStrong((id *)&v15->_viewModel, a3);
    objc_storeStrong((id *)&v15->_cdpContext, a4);
    uint64_t v16 = [objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:101];
    activityIndicator = v15->_activityIndicator;
    v15->_activityIndicator = (UIActivityIndicatorView *)v16;

    [(UIActivityIndicatorView *)v15->_activityIndicator setTranslatesAutoresizingMaskIntoConstraints:0];
  }

  return v15;
}

- (void)viewDidLoad
{
  v33[4] = *MEMORY[0x263EF8340];
  v32.receiver = self;
  v32.super_class = (Class)CDPUIPiggybackingViewController;
  [(OBBaseWelcomeController *)&v32 viewDidLoad];
  v3 = [(CDPUIPiggybackingViewController *)self contentView];
  [v3 addSubview:self->_activityIndicator];

  v4 = [MEMORY[0x263F5B898] boldButton];
  [v4 addTarget:self action:sel__handleSendCodeAction_ forControlEvents:64];
  v5 = [(CDPUIPiggybackingViewModel *)self->_viewModel sendCodeOption];
  v6 = [v5 title];
  v31 = v4;
  [v4 setTitle:v6 forState:0];

  id v7 = [(CDPUIPiggybackingViewController *)self buttonTray];
  [v7 addButton:v4];

  id v8 = [MEMORY[0x263F5B8D0] linkButton];
  [v8 addTarget:self action:sel__handleCantGetToDevicesButtonAction_ forControlEvents:64];
  v9 = [(CDPUIPiggybackingViewModel *)self->_viewModel cantGetToDeviceOption];
  v10 = [v9 escapeOfferName];
  v30 = v8;
  [v8 setTitle:v10 forState:0];

  v11 = [(CDPUIPiggybackingViewController *)self buttonTray];
  [v11 addButton:v8];

  v22 = (void *)MEMORY[0x263F08938];
  v28 = [(UIActivityIndicatorView *)self->_activityIndicator leadingAnchor];
  v29 = [(CDPUIPiggybackingViewController *)self contentView];
  v27 = [v29 leadingAnchor];
  v26 = [v28 constraintEqualToAnchor:v27];
  v33[0] = v26;
  v24 = [(UIActivityIndicatorView *)self->_activityIndicator trailingAnchor];
  v25 = [(CDPUIPiggybackingViewController *)self contentView];
  v23 = [v25 trailingAnchor];
  v12 = [v24 constraintEqualToAnchor:v23];
  v33[1] = v12;
  v13 = [(UIActivityIndicatorView *)self->_activityIndicator topAnchor];
  v14 = [(CDPUIPiggybackingViewController *)self contentView];
  v15 = [v14 topAnchor];
  uint64_t v16 = [v13 constraintEqualToAnchor:v15 constant:100.0];
  v33[2] = v16;
  v17 = [(UIActivityIndicatorView *)self->_activityIndicator bottomAnchor];
  v18 = [(CDPUIPiggybackingViewController *)self contentView];
  objc_super v19 = [v18 bottomAnchor];
  v20 = [v17 constraintEqualToAnchor:v19];
  v33[3] = v20;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:4];
  [v22 activateConstraints:v21];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CDPUIPiggybackingViewController;
  [(OBBaseWelcomeController *)&v3 viewDidAppear:a3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CDPUIPiggybackingViewController;
  [(CDPUIPiggybackingViewController *)&v3 viewWillDisappear:a3];
}

- (void)_handleSendCodeAction:(id)a3
{
  v4 = [(CDPUIPiggybackingViewModel *)self->_viewModel sendCodeOption];

  if (v4)
  {
    id v6 = [(CDPUIPiggybackingViewModel *)self->_viewModel sendCodeOption];
    v5 = [v6 escapeAction];
    v5[2]();
  }
}

- (void)_handleCantGetToDevicesButtonAction:(id)a3
{
  v4 = [(CDPUIPiggybackingViewModel *)self->_viewModel cantGetToDeviceOption];

  if (v4)
  {
    id v5 = [(CDPUIPiggybackingViewModel *)self->_viewModel cantGetToDeviceOption];
    [v5 handleEscapeAction:self];
  }
}

- (void)startSpinning
{
  objc_super v3 = [(CDPUIPiggybackingViewController *)self buttonTray];
  [v3 setHidden:1];

  activityIndicator = self->_activityIndicator;

  [(UIActivityIndicatorView *)activityIndicator startAnimating];
}

- (void)stopSpinning
{
  [(UIActivityIndicatorView *)self->_activityIndicator stopAnimating];
  id v3 = [(CDPUIPiggybackingViewController *)self buttonTray];
  [v3 setHidden:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_cdpContext, 0);

  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end