@interface TVLatencySetupTryAgainViewController
- (NSError)error;
- (UIImageView)statusImageViewFill;
- (UIImageView)statusImageViewIcon;
- (void)handleDismissButton:(id)a3;
- (void)handleTryAgainButton:(id)a3;
- (void)setError:(id)a3;
- (void)setStatusImageViewFill:(id)a3;
- (void)setStatusImageViewIcon:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVLatencySetupTryAgainViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_statusImageViewFill + 1), 0);
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
  return *(UIImageView **)((char *)&self->_error + 1);
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

- (void)handleTryAgainButton:(id)a3
{
  id v7 = a3;
  if (dword_1001CCF28 <= 30 && (dword_1001CCF28 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v4 = [self->super.super._mainController testFlags];
  id mainController = self->super.super._mainController;
  if (!v4)
  {
    v6 = [mainController latencySetupSession];
    [v6 tryAgain];

    id mainController = self->super.super._mainController;
  }
  [mainController showProgressUI];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CCF28 <= 30 && (dword_1001CCF28 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v5.receiver = self;
  v5.super_class = (Class)TVLatencySetupTryAgainViewController;
  [(TVLatencySetupTryAgainViewController *)&v5 viewDidDisappear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CCF28 <= 30 && (dword_1001CCF28 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v8.receiver = self;
  v8.super_class = (Class)TVLatencySetupTryAgainViewController;
  [(TVLatencySetupBaseViewController *)&v8 viewWillAppear:v3];
  objc_super v5 = [(SVSBaseViewController *)self containerView];
  [v5 setSwipeDismissible:1];

  v6 = +[UIImage systemImageNamed:@"circle.fill"];
  [*(id *)((char *)&self->_error + 1) setImage:v6];

  id v7 = +[UIImage systemImageNamed:@"exclamationmark.circle"];
  [*(id *)((char *)&self->_statusImageViewFill + 1) setImage:v7];
}

@end