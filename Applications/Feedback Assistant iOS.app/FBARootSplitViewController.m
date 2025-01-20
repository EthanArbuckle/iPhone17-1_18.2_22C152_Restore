@interface FBARootSplitViewController
+ (BOOL)presentsAuthKitUIModally;
- (BOOL)canDismissPresentedController:(id)a3;
- (BOOL)isPresentingConsentView;
- (FBARootSplitViewController)initWithCoder:(id)a3;
- (NSString)presentedSegueName;
- (id)performOnAppear;
- (id)topMostController;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)pendingStartupUI;
- (void)clearBlockingUI;
- (void)createAndShowNonParticipantView;
- (void)dealloc;
- (void)dismissSecondaryOrShowEmptyViewControllerAnimated:(BOOL)a3;
- (void)displayLoginSplash;
- (void)displayNonParticipant;
- (void)drainAndPresentConsentsWithCompletion:(id)a3;
- (void)performSegueWithIdentifier:(id)a3 sender:(id)a4;
- (void)prepareForSegue:(id)a3 sender:(id)a4;
- (void)presentConnectionErrorUI;
- (void)presentStartupUI:(unint64_t)a3;
- (void)presentVersionOutdatedUI;
- (void)resetViewControllers:(BOOL)a3;
- (void)setIsPresentingConsentView:(BOOL)a3;
- (void)setPendingStartupUI:(unint64_t)a3;
- (void)setPerformOnAppear:(id)a3;
- (void)setPresentedSegueName:(id)a3;
- (void)signOutHandler;
- (void)unwindLoginFlow:(id)a3;
- (void)unwindToNonParticipant:(id)a3;
- (void)unwindToOutdatedVersion:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FBARootSplitViewController

- (FBARootSplitViewController)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)FBARootSplitViewController;
  v3 = [(FBARootSplitViewController *)&v8 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    v3->_pendingStartupUI = 0;
    id performOnAppear = v3->_performOnAppear;
    v3->_id performOnAppear = 0;

    presentedSegueName = v4->_presentedSegueName;
    v4->_presentedSegueName = 0;
  }
  return v4;
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)FBARootSplitViewController;
  [(FBARootSplitViewController *)&v9 viewDidLoad];
  v3 = +[NSProcessInfo processInfo];
  v4 = [v3 environment];
  v5 = [v4 objectForKeyedSubscript:@"FBK_UNIT_TEST"];

  if (!v5)
  {
    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:self selector:"displayLoginSplash" name:FBKUserIsLoggingOutNotification object:0];

    v7 = +[FBKData sharedInstance];
    objc_super v8 = [v7 notificationCenter];
    [v8 addObserver:self selector:"displayNonParticipant" name:FBKUserNoProgramsNotification object:0];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FBARootSplitViewController;
  [(FBARootSplitViewController *)&v6 viewWillAppear:a3];
  v4 = [(FBARootSplitViewController *)self performOnAppear];

  if (v4)
  {
    v5 = [(FBARootSplitViewController *)self performOnAppear];
    v5[2]();

    [(FBARootSplitViewController *)self setPerformOnAppear:0];
  }
}

- (void)dealloc
{
  v3 = +[FBKData sharedInstance];
  v4 = [v3 notificationCenter];
  [v4 removeObserver:self];

  v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)FBARootSplitViewController;
  [(FBARootSplitViewController *)&v6 dealloc];
}

- (void)resetViewControllers:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(FBARootSplitViewController *)self isCollapsed])
  {
    v5 = [(FBARootSplitViewController *)self viewControllers];
    id v11 = [v5 objectAtIndexedSubscript:0];

    id v6 = [v11 popToRootViewControllerAnimated:v3];
  }
  else
  {
    v7 = [(FBARootSplitViewController *)self storyboard];
    id v11 = [v7 instantiateViewControllerWithIdentifier:@"FBAEmptyStack"];

    objc_super v8 = [(FBARootSplitViewController *)self viewControllers];
    objc_super v9 = [v8 objectAtIndexedSubscript:0];

    id v10 = [v9 popToRootViewControllerAnimated:v3];
    [(FBARootSplitViewController *)self setViewController:v9 forColumn:0];
    [(FBARootSplitViewController *)self setViewController:v11 forColumn:2];
  }
}

- (void)dismissSecondaryOrShowEmptyViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(FBARootSplitViewController *)self isCollapsed])
  {
    v5 = [(FBARootSplitViewController *)self viewControllers];
    id v8 = [v5 firstObject];

    id v6 = [v8 popViewControllerAnimated:v3];
  }
  else
  {
    v7 = [(FBARootSplitViewController *)self storyboard];
    id v8 = [v7 instantiateViewControllerWithIdentifier:@"FBAEmptyStack"];

    [(FBARootSplitViewController *)self showDetailViewController:v8 sender:0];
  }
}

- (void)performSegueWithIdentifier:(id)a3 sender:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)FBARootSplitViewController;
  id v6 = a3;
  [(FBARootSplitViewController *)&v7 performSegueWithIdentifier:v6 sender:a4];
  -[FBARootSplitViewController setPresentedSegueName:](self, "setPresentedSegueName:", v6, v7.receiver, v7.super_class);
}

- (void)prepareForSegue:(id)a3 sender:(id)a4
{
  id v8 = a3;
  v5 = [v8 identifier];
  unsigned int v6 = [v5 isEqualToString:@"FBALoginFlowModalPresentation"];

  if (v6)
  {
    objc_super v7 = [v8 destinationViewController];
    [v7 setPendingUI:[self pendingStartupUI]];

    [(FBARootSplitViewController *)self setPendingStartupUI:0];
  }
}

- (void)clearBlockingUI
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100028518;
  block[3] = &unk_1000F2518;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)displayLoginSplash
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100028630;
  block[3] = &unk_1000F2518;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)displayNonParticipant
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000286F4;
  block[3] = &unk_1000F2518;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)presentConnectionErrorUI
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100028770;
  block[3] = &unk_1000F2518;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)presentVersionOutdatedUI
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002890C;
  block[3] = &unk_1000F2518;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)presentStartupUI:(unint64_t)a3
{
  if ((a3 & 6) != 0)
  {
    v5[6] = v3;
    v5[7] = v4;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100028AB4;
    v5[3] = &unk_1000F3358;
    v5[4] = self;
    v5[5] = a3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  }
}

- (void)unwindLoginFlow:(id)a3
{
}

- (void)unwindToOutdatedVersion:(id)a3
{
  id v4 = a3;
  [(FBARootSplitViewController *)self setPresentedSegueName:0];
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100028D48;
  v5[3] = &unk_1000F2688;
  objc_copyWeak(&v6, &location);
  [(FBARootSplitViewController *)self setPerformOnAppear:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)unwindToNonParticipant:(id)a3
{
  id v4 = a3;
  [(FBARootSplitViewController *)self setPresentedSegueName:0];
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100028E98;
  v5[3] = &unk_1000F2688;
  objc_copyWeak(&v6, &location);
  [(FBARootSplitViewController *)self setPerformOnAppear:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

+ (BOOL)presentsAuthKitUIModally
{
  v2 = +[UIDevice currentDevice];
  id v3 = [v2 userInterfaceIdiom];

  return v3 != 0;
}

- (id)topMostController
{
  v2 = self;
  id v3 = [(FBARootSplitViewController *)v2 presentedViewController];

  if (v3)
  {
    do
    {
      id v4 = [(FBARootSplitViewController *)v2 presentedViewController];

      v5 = [(FBARootSplitViewController *)v4 presentedViewController];

      v2 = v4;
    }
    while (v5);
  }
  else
  {
    id v4 = v2;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [(FBARootSplitViewController *)v4 topViewController];
  }
  else
  {
    id v6 = v4;
  }
  objc_super v7 = v6;

  return v7;
}

- (BOOL)isPresentingConsentView
{
  return self->_isPresentingConsentView;
}

- (void)setIsPresentingConsentView:(BOOL)a3
{
  self->_isPresentingConsentView = a3;
}

- (id)performOnAppear
{
  return self->_performOnAppear;
}

- (void)setPerformOnAppear:(id)a3
{
}

- (NSString)presentedSegueName
{
  return self->_presentedSegueName;
}

- (void)setPresentedSegueName:(id)a3
{
}

- (unint64_t)pendingStartupUI
{
  return self->_pendingStartupUI;
}

- (void)setPendingStartupUI:(unint64_t)a3
{
  self->_pendingStartupUI = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedSegueName, 0);

  objc_storeStrong(&self->_performOnAppear, 0);
}

- (void)createAndShowNonParticipantView
{
  v2 = self;
  sub_10007A064();
}

- (void)signOutHandler
{
  id v3 = self;
  id v6 = self;
  id v4 = [v3 sharedInstance];
  id v5 = [v4 loginManager];

  [v5 logOut];
  [self deleteAllDraftDirectories];
  [(FBARootSplitViewController *)v6 dismissViewControllerAnimated:1 completion:0];
}

- (void)drainAndPresentConsentsWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    objc_super v7 = sub_100059180;
  }
  else
  {
    objc_super v7 = 0;
    uint64_t v6 = 0;
  }
  id v8 = self;
  sub_10007A34C((uint64_t)v7, v6);
  sub_100059188((uint64_t)v7);
}

- (BOOL)canDismissPresentedController:(id)a3
{
  return swift_dynamicCastClass() == 0;
}

@end