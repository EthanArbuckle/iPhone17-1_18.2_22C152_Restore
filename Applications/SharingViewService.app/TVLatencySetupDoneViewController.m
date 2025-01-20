@interface TVLatencySetupDoneViewController
- (NSError)error;
- (UIImageView)statusImageViewFill;
- (UIImageView)statusImageViewIcon;
- (UILabel)infoLabel;
- (void)handleDismissButton:(id)a3;
- (void)setError:(id)a3;
- (void)setInfoLabel:(id)a3;
- (void)setStatusImageViewFill:(id)a3;
- (void)setStatusImageViewIcon:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVLatencySetupDoneViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_statusImageViewFill + 1), 0);
  objc_storeStrong((id *)((char *)&self->_infoLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_error + 1), 0);

  objc_storeStrong((id *)((char *)&self->super._animationContainerView + 1), 0);
}

- (void)setStatusImageViewIcon:(id)a3
{
}

- (UIImageView)statusImageViewIcon
{
  return *(UIImageView **)((char *)&self->_statusImageViewFill + 1);
}

- (void)setStatusImageViewFill:(id)a3
{
}

- (UIImageView)statusImageViewFill
{
  return *(UIImageView **)((char *)&self->_infoLabel + 1);
}

- (void)setInfoLabel:(id)a3
{
}

- (UILabel)infoLabel
{
  return *(UILabel **)((char *)&self->_error + 1);
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return *(NSError **)((char *)&self->super._animationContainerView + 1);
}

- (void)handleDismissButton:(id)a3
{
  id v4 = a3;
  if (dword_1001CCF28 <= 30 && (dword_1001CCF28 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [self->super.super._mainController dismiss:5];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CCF28 <= 30 && (dword_1001CCF28 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v5.receiver = self;
  v5.super_class = (Class)TVLatencySetupDoneViewController;
  [(TVLatencySetupDoneViewController *)&v5 viewDidDisappear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CCF28 <= 30 && (dword_1001CCF28 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v14.receiver = self;
  v14.super_class = (Class)TVLatencySetupDoneViewController;
  [(TVLatencySetupBaseViewController *)&v14 viewWillAppear:v3];
  objc_super v5 = [(SVSBaseViewController *)self containerView];
  [v5 setSwipeDismissible:1];

  if (*(UIView **)((char *)&self->super._animationContainerView + 1))
  {
    v6 = +[NSBundle mainBundle];
    v7 = sub_100138304(v6, @"Localizable-TVLatency", @"TLV_FAILED_TITLE");
    [*(id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1) setText:v7];

    v8 = +[NSBundle mainBundle];
    v9 = sub_100138304(v8, @"Localizable-TVLatency", @"TLV_FAILED_SUBTITLE");
    [*(id *)((char *)&self->_error + 1) setText:v9];

    v10 = +[UIColor systemRedColor];
    CFStringRef v11 = @"exclamationmark.circle";
  }
  else
  {
    v10 = +[UIColor systemGreenColor];
    CFStringRef v11 = @"checkmark.circle";
  }
  [*(id *)((char *)&self->_infoLabel + 1) setTintColor:v10];

  v12 = +[UIImage systemImageNamed:@"circle.fill"];
  [*(id *)((char *)&self->_infoLabel + 1) setImage:v12];

  v13 = +[UIImage systemImageNamed:v11];
  [*(id *)((char *)&self->_statusImageViewFill + 1) setImage:v13];
}

@end