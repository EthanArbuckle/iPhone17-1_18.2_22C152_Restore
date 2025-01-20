@interface FBALoginFlowViewController
- (unint64_t)pendingUI;
- (unint64_t)supportedInterfaceOrientations;
- (void)prepareForSegue:(id)a3 sender:(id)a4;
- (void)setPendingUI:(unint64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation FBALoginFlowViewController

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FBALoginFlowViewController;
  [(FBALoginFlowViewController *)&v4 viewDidAppear:a3];
  if (([(FBALoginFlowViewController *)self pendingUI] & 2) != 0)
  {
    [(FBALoginFlowViewController *)self performSegueWithIdentifier:@"FBAStartupLicensePresentation" sender:self];
    [(FBALoginFlowViewController *)self setPendingUI:[(FBALoginFlowViewController *)self pendingUI] & 0xFFFFFFFFFFFFFFFDLL];
  }
  else if (([(FBALoginFlowViewController *)self pendingUI] & 4) == 0)
  {
    [(FBALoginFlowViewController *)self performSegueWithIdentifier:@"FBAUnwindLoginFlow" sender:self];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  return 6;
}

- (void)prepareForSegue:(id)a3 sender:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 identifier];
  unsigned int v9 = [v8 isEqualToString:@"FBAStartupLicensePresentation"];

  if (v9)
  {
    v10 = [v6 destinationViewController];
    v11 = [v10 topViewController];

    objc_initWeak(&location, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000390BC;
    v12[3] = &unk_1000F2A90;
    objc_copyWeak(&v13, &location);
    v12[4] = self;
    [v11 setCompletion:v12];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (unint64_t)pendingUI
{
  return self->_pendingUI;
}

- (void)setPendingUI:(unint64_t)a3
{
  self->_pendingUI = a3;
}

@end