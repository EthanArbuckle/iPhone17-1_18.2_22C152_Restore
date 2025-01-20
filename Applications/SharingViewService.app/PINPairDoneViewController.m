@interface PINPairDoneViewController
- (int)status;
- (void)handleDismissButton:(id)a3;
- (void)setStatus:(int)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PINPairDoneViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_imageView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), 0);

  objc_storeStrong((id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

- (void)setStatus:(int)a3
{
  *(_DWORD *)((char *)&self->_doneButton + 1) = a3;
}

- (int)status
{
  return *(_DWORD *)((char *)&self->_doneButton + 1);
}

- (void)handleDismissButton:(id)a3
{
  id v4 = a3;
  if (dword_1001CC748 <= 30 && (dword_1001CC748 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [self->super._mainController dismiss:5];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC748 <= 30 && (dword_1001CC748 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v5.receiver = self;
  v5.super_class = (Class)PINPairDoneViewController;
  [(PINPairDoneViewController *)&v5 viewDidDisappear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC748 <= 30 && (dword_1001CC748 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v21.receiver = self;
  v21.super_class = (Class)PINPairDoneViewController;
  [(SVSBaseViewController *)&v21 viewWillAppear:v3];
  if (*(_DWORD *)((char *)&self->_doneButton + 1))
  {
    objc_super v5 = +[UIImage imageNamed:@"AlertCircle.png"];
    v6 = +[UIColor systemRedColor];
    v7 = [v5 _flatImageWithColor:v6];
    [*(id *)((char *)&self->_titleLabel + 1) setImage:v7];

    v15 = sub_100138494(@"PAIR_FAILED", v8, v9, v10, v11, v12, v13, v14, *(unsigned int *)((char *)&self->_doneButton + 1));
    [*(id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1) setText:v15];

    v16 = *(UIImageView **)((char *)&self->_imageView + 1);
    v17 = +[NSBundle mainBundle];
    v18 = [v17 localizedStringForKey:@"OK_BUTTON_TITLE" value:&stru_1001A1DC0 table:@"Localizable"];
    [v16 setTitle:v18 forState:0];
  }
  else
  {
    v17 = +[UIImage imageNamed:@"DoneCheck.png"];
    v18 = +[UIColor systemBlueColor];
    v19 = [v17 _flatImageWithColor:v18];
    [*(id *)((char *)&self->_titleLabel + 1) setImage:v19];
  }
  v20 = [(SVSBaseViewController *)self containerView];
  [v20 setSwipeDismissible:1];
}

@end