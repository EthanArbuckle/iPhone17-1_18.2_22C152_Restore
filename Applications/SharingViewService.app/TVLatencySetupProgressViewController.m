@interface TVLatencySetupProgressViewController
- (UILabel)infoLabel;
- (void)handleDismissButton:(id)a3;
- (void)handleProgressEvent:(unsigned int)a3;
- (void)setInfoLabel:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVLatencySetupProgressViewController

- (void).cxx_destruct
{
}

- (void)setInfoLabel:(id)a3
{
}

- (UILabel)infoLabel
{
  return *(UILabel **)((char *)&self->super._animationContainerView + 1);
}

- (void)handleProgressEvent:(unsigned int)a3
{
  if (a3 == 277)
  {
    v8 = +[NSBundle mainBundle];
    v9 = sub_100138304(v8, @"Localizable-TVLatency", @"TLV_LISTENING_TITLE");
    [*(id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1) setText:v9];

    id v10 = +[NSBundle mainBundle];
    v6 = sub_100138304(v10, @"Localizable-TVLatency", @"TLV_LISTENING_SUBTITLE");
    [*(id *)((char *)&self->super._animationContainerView + 1) setText:v6];
  }
  else
  {
    if (a3 != 260) {
      return;
    }
    v4 = +[NSBundle mainBundle];
    v5 = sub_100138304(v4, @"Localizable-TVLatency", @"TLV_PREPARING_TITLE");
    [*(id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1) setText:v5];

    id v10 = +[NSBundle mainBundle];
    v6 = sub_1001374C4(@"TLV_PREPARING_SUBTITLE");
    v7 = sub_100138304(v10, @"Localizable-TVLatency", v6);
    [*(id *)((char *)&self->super._animationContainerView + 1) setText:v7];
  }
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
  v5.super_class = (Class)TVLatencySetupProgressViewController;
  [(TVLatencySetupProgressViewController *)&v5 viewDidDisappear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CCF28 <= 30 && (dword_1001CCF28 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v12.receiver = self;
  v12.super_class = (Class)TVLatencySetupProgressViewController;
  [(TVLatencySetupBaseViewController *)&v12 viewWillAppear:v3];
  objc_super v5 = +[NSBundle mainBundle];
  v6 = sub_100138304(v5, @"Localizable-TVLatency", @"TLV_PREPARING_TITLE");
  [*(id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1) setText:v6];

  v7 = +[NSBundle mainBundle];
  v8 = sub_1001374C4(@"TLV_PREPARING_SUBTITLE");
  v9 = sub_100138304(v7, @"Localizable-TVLatency", v8);
  [*(id *)((char *)&self->super._animationContainerView + 1) setText:v9];

  if ([self->super.super._mainController testFlags])
  {
    dispatch_time_t v10 = dispatch_time(0, 3000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10013BC74;
    block[3] = &unk_1001A1BD8;
    block[4] = self;
    dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

@end