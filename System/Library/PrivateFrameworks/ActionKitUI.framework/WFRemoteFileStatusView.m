@interface WFRemoteFileStatusView
- (NSArray)emptyConstraints;
- (NSArray)errorConstraints;
- (NSArray)loadingContraints;
- (UIActivityIndicatorView)indicatorView;
- (UIButton)recoveryButton;
- (UILabel)statusLabel;
- (UIView)containerView;
- (WFRemoteFileStatusView)initWithFrame:(CGRect)a3;
- (WFRemoteFileStatusViewDelegate)delegate;
- (void)recoveryButtonTapped;
- (void)setDelegate:(id)a3;
- (void)setEmptyWithLabel:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setLoading;
@end

@implementation WFRemoteFileStatusView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorConstraints, 0);
  objc_storeStrong((id *)&self->_loadingContraints, 0);
  objc_storeStrong((id *)&self->_emptyConstraints, 0);
  objc_storeStrong((id *)&self->_recoveryButton, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_indicatorView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (NSArray)errorConstraints
{
  return self->_errorConstraints;
}

- (NSArray)loadingContraints
{
  return self->_loadingContraints;
}

- (NSArray)emptyConstraints
{
  return self->_emptyConstraints;
}

- (UIButton)recoveryButton
{
  return self->_recoveryButton;
}

- (UILabel)statusLabel
{
  return self->_statusLabel;
}

- (UIActivityIndicatorView)indicatorView
{
  return self->_indicatorView;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setDelegate:(id)a3
{
}

- (WFRemoteFileStatusViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFRemoteFileStatusViewDelegate *)WeakRetained;
}

- (void)setError:(id)a3
{
  id v15 = a3;
  v4 = [v15 localizedFailureReason];
  v5 = v4;
  if (!v4)
  {
    v5 = [v15 localizedDescription];
  }
  v6 = [(WFRemoteFileStatusView *)self statusLabel];
  [v6 setText:v5];

  if (!v4) {
  v7 = [(WFRemoteFileStatusView *)self recoveryButton];
  }
  [v7 setHidden:0];

  v8 = [(WFRemoteFileStatusView *)self indicatorView];
  [v8 setHidden:1];

  v9 = (void *)MEMORY[0x263F08938];
  v10 = [(WFRemoteFileStatusView *)self emptyConstraints];
  [v9 deactivateConstraints:v10];

  v11 = (void *)MEMORY[0x263F08938];
  v12 = [(WFRemoteFileStatusView *)self loadingContraints];
  [v11 deactivateConstraints:v12];

  v13 = (void *)MEMORY[0x263F08938];
  v14 = [(WFRemoteFileStatusView *)self errorConstraints];
  [v13 activateConstraints:v14];
}

- (void)setLoading
{
  v3 = WFLocalizedString(@"Loading…");
  v4 = [(WFRemoteFileStatusView *)self statusLabel];
  [v4 setText:v3];

  v5 = [(WFRemoteFileStatusView *)self recoveryButton];
  [v5 setHidden:1];

  v6 = [(WFRemoteFileStatusView *)self indicatorView];
  [v6 setHidden:0];

  v7 = (void *)MEMORY[0x263F08938];
  v8 = [(WFRemoteFileStatusView *)self emptyConstraints];
  [v7 deactivateConstraints:v8];

  v9 = (void *)MEMORY[0x263F08938];
  v10 = [(WFRemoteFileStatusView *)self errorConstraints];
  [v9 deactivateConstraints:v10];

  v11 = (void *)MEMORY[0x263F08938];
  id v12 = [(WFRemoteFileStatusView *)self loadingContraints];
  [v11 activateConstraints:v12];
}

- (void)setEmptyWithLabel:(BOOL)a3
{
  if (a3)
  {
    v4 = WFLocalizedString(@"This folder is empty");
    v5 = [(WFRemoteFileStatusView *)self statusLabel];
    [v5 setText:v4];
  }
  else
  {
    v4 = [(WFRemoteFileStatusView *)self statusLabel];
    [v4 setText:0];
  }

  v6 = [(WFRemoteFileStatusView *)self recoveryButton];
  [v6 setHidden:1];

  v7 = [(WFRemoteFileStatusView *)self indicatorView];
  [v7 setHidden:1];

  v8 = (void *)MEMORY[0x263F08938];
  v9 = [(WFRemoteFileStatusView *)self errorConstraints];
  [v8 deactivateConstraints:v9];

  v10 = (void *)MEMORY[0x263F08938];
  v11 = [(WFRemoteFileStatusView *)self loadingContraints];
  [v10 deactivateConstraints:v11];

  id v12 = (void *)MEMORY[0x263F08938];
  id v13 = [(WFRemoteFileStatusView *)self emptyConstraints];
  [v12 activateConstraints:v13];
}

- (void)recoveryButtonTapped
{
  id v3 = [(WFRemoteFileStatusView *)self delegate];
  [v3 statusViewDidPressRecoveryButton:self];
}

- (WFRemoteFileStatusView)initWithFrame:(CGRect)a3
{
  v42[3] = *MEMORY[0x263EF8340];
  v41.receiver = self;
  v41.super_class = (Class)WFRemoteFileStatusView;
  id v3 = -[WFRemoteFileStatusView initWithFrame:](&v41, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [(WFRemoteFileStatusView *)v3 setBackgroundColor:v4];

    v5 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    [(UIView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(WFRemoteFileStatusView *)v3 addSubview:v5];
    containerView = v3->_containerView;
    v3->_containerView = v5;
    v7 = v5;

    v8 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    [(UILabel *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = [MEMORY[0x263F825C8] grayColor];
    [(UILabel *)v8 setTextColor:v9];

    [(UILabel *)v8 setNumberOfLines:0];
    [(UILabel *)v8 setTextAlignment:1];
    [(UIView *)v7 addSubview:v8];
    statusLabel = v3->_statusLabel;
    v3->_statusLabel = v8;
    v39 = v8;

    v11 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    [(UIActivityIndicatorView *)v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIActivityIndicatorView *)v11 setHidden:1];
    [(UIView *)v7 addSubview:v11];
    [(UIActivityIndicatorView *)v11 startAnimating];
    indicatorView = v3->_indicatorView;
    v3->_indicatorView = v11;
    v40 = v11;

    id v13 = [MEMORY[0x263F824E8] buttonWithType:1];
    [(UIButton *)v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v13 setHidden:1];
    v14 = WFLocalizedString(@"Retry");
    [(UIButton *)v13 setTitle:v14 forState:0];

    [(UIButton *)v13 addTarget:v3 action:sel_recoveryButtonTapped forControlEvents:64];
    [(UIView *)v7 addSubview:v13];
    recoveryButton = v3->_recoveryButton;
    v3->_recoveryButton = v13;
    v38 = v13;

    v16 = (void *)MEMORY[0x263F08938];
    v17 = [MEMORY[0x263F08938] constraintWithItem:v7 attribute:9 relatedBy:0 toItem:v3 attribute:9 multiplier:1.0 constant:0.0];
    v42[0] = v17;
    v18 = [MEMORY[0x263F08938] constraintWithItem:v7 attribute:7 relatedBy:-1 toItem:v3 attribute:7 multiplier:1.0 constant:-40.0];
    v42[1] = v18;
    v19 = [MEMORY[0x263F08938] constraintWithItem:v7 attribute:10 relatedBy:0 toItem:v3 attribute:10 multiplier:1.0 constant:0.0];
    v42[2] = v19;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:3];
    [v16 activateConstraints:v20];

    v21 = _NSDictionaryOfVariableBindings(&cfstr_StatuslabelInd.isa, v39, v40, v38, 0);
    v22 = (NSArray *)objc_opt_new();
    v23 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[statusLabel]|" options:0 metrics:0 views:v21];
    [(NSArray *)v22 addObjectsFromArray:v23];

    v24 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[statusLabel]|" options:0 metrics:0 views:v21];
    [(NSArray *)v22 addObjectsFromArray:v24];

    emptyConstraints = v3->_emptyConstraints;
    v3->_emptyConstraints = v22;
    v26 = v22;

    v27 = (NSArray *)objc_opt_new();
    v28 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[statusLabel]-[indicatorView]|" options:1024 metrics:0 views:v21];
    [(NSArray *)v27 addObjectsFromArray:v28];

    v29 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[statusLabel]|" options:0 metrics:0 views:v21];
    [(NSArray *)v27 addObjectsFromArray:v29];

    loadingContraints = v3->_loadingContraints;
    v3->_loadingContraints = v27;
    v31 = v27;

    v32 = (NSArray *)objc_opt_new();
    v33 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[statusLabel]-[recoveryButton]|" options:512 metrics:0 views:v21];
    [(NSArray *)v32 addObjectsFromArray:v33];

    v34 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[statusLabel]|" options:0 metrics:0 views:v21];
    [(NSArray *)v32 addObjectsFromArray:v34];

    errorConstraints = v3->_errorConstraints;
    v3->_errorConstraints = v32;

    [(WFRemoteFileStatusView *)v3 setLoading];
    v36 = v3;
  }
  return v3;
}

@end