@interface iOSSetupBaseViewController
- (void)dismissWithType:(int)a3;
@end

@implementation iOSSetupBaseViewController

- (void)dismissWithType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(SVSCardContainerView *)self->super._containerView swipeDismissible])
  {
    id mainController = self->super._mainController;
    [mainController dismiss:v3];
  }
  else
  {
    v6 = sub_100138280(@"Localizable", @"EXIT_SETUP_TITLE");
    v7 = sub_100138280(@"Localizable", @"EXIT_SETUP_MESSAGE");
    v8 = +[UIAlertController alertControllerWithTitle:v6 message:v7 preferredStyle:1];
    v9 = sub_100138280(@"Localizable", @"CANCEL");
    v10 = +[UIAlertAction actionWithTitle:v9 style:1 handler:&stru_1001A0E70];
    [v8 addAction:v10];
    v11 = sub_100138280(@"Localizable", @"EXIT_SETUP_BUTTON");
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100104424;
    v13[3] = &unk_1001A0E98;
    v13[4] = self;
    int v14 = v3;
    v12 = +[UIAlertAction actionWithTitle:v11 style:0 handler:v13];

    [v8 addAction:v12];
    [v8 setPreferredAction:v12];
    [(iOSSetupBaseViewController *)self presentViewController:v8 animated:1 completion:0];
  }
}

@end