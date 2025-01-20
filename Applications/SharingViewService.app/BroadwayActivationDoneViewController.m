@interface BroadwayActivationDoneViewController
- (BOOL)_canShowWhileLocked;
- (void)handleDoneButton:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BroadwayActivationDoneViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_customerAgreementLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_cardNameLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_subheadLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), 0);

  objc_storeStrong((id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

- (void)handleDoneButton:(id)a3
{
  id v4 = a3;
  if (dword_1001CCC58 <= 30)
  {
    if (dword_1001CCC58 != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
    if (dword_1001CCC58 <= 30 && (dword_1001CCC58 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  [self->super._mainController dismiss:9 completion:&stru_1001A16F8];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CCC58 <= 30 && (dword_1001CCC58 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v5.receiver = self;
  v5.super_class = (Class)BroadwayActivationDoneViewController;
  [(BroadwayActivationDoneViewController *)&v5 viewDidDisappear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CCC58 <= 30 && (dword_1001CCC58 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v18.receiver = self;
  v18.super_class = (Class)BroadwayActivationDoneViewController;
  [(SVSBaseViewController *)&v18 viewWillAppear:v3];
  objc_super v5 = [(SVSBaseViewController *)self containerView];
  [v5 setSwipeDismissible:1];

  v6 = SFFontForTextStyleWithAdditionalSymbolicTraits();
  [*(id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1) setFont:v6];

  [*(id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1) setAdjustsFontForContentSizeCategory:0];
  v7 = SFFontForTextStyleWithAdditionalSymbolicTraits();
  [*(id *)((char *)&self->_titleLabel + 1) setFont:v7];

  [*(id *)((char *)&self->_titleLabel + 1) setAdjustsFontForContentSizeCategory:0];
  v8 = +[UIFont systemFontOfSize:kCTFontUIFontDesignRounded weight:8.0 design:UIFontWeightMedium];
  [*(id *)((char *)&self->_subheadLabel + 1) setFont:v8];

  [*(id *)((char *)&self->_subheadLabel + 1) setAdjustsFontForContentSizeCategory:0];
  v9 = +[UIColor colorWithWhite:0.54 alpha:1.0];
  [*(id *)((char *)&self->_subheadLabel + 1) setTextColor:v9];

  v10 = [self->super._mainController physicalCard];
  v11 = [v10 nameOnCard];
  if (v11)
  {
    [*(id *)((char *)&self->_subheadLabel + 1) setText:v11];
  }
  else
  {
    v12 = objc_opt_new();
    [*(id *)((char *)&self->_subheadLabel + 1) setText:v12];
  }
  v13 = SFFontForTextStyleWithAdditionalSymbolicTraits();
  [*(id *)((char *)&self->_cardNameLabel + 1) setFont:v13];

  [*(id *)((char *)&self->_cardNameLabel + 1) setAdjustsFontForContentSizeCategory:0];
  v14 = SFFontForTextStyleWithAdditionalSymbolicTraits();
  v15 = [*(id *)((char *)&self->_customerAgreementLabel + 1) titleLabel];
  [v15 setFont:v14];

  v16 = [*(id *)((char *)&self->_customerAgreementLabel + 1) titleLabel];
  [v16 setAdjustsFontForContentSizeCategory:0];

  v17 = +[UIColor systemExtraLightGrayColor];
  [*(id *)((char *)&self->_customerAgreementLabel + 1) setBackgroundColor:v17];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end