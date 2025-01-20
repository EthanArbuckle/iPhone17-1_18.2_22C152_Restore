@interface AXSBUIAudiographRootViewController
+ (BOOL)_isSecureForRemoteViewService;
- (AXMChartDescriptor)chartDescriptor;
- (BOOL)accessibilityPostScreenChangedForChildViewController:(id)a3 isAddition:(BOOL)a4;
- (UIViewController)hostingController;
- (void)_setupRemoteProxy;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dismiss;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)selectedSeriesChanged:(id)a3;
- (void)setChartDescriptor:(id)a3;
- (void)setHostingController:(id)a3;
- (void)toggleAudiographPlaybackState:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation AXSBUIAudiographRootViewController

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v10 = (void (**)(void))a4;
  v6 = [a3 userInfo];
  if (v6)
  {
    id v7 = [objc_alloc((Class)AXMChartDescriptor) initWithDictionary:v6];
    [(AXSBUIAudiographRootViewController *)self setChartDescriptor:v7];
  }
  else
  {
    [(AXSBUIAudiographRootViewController *)self setChartDescriptor:0];
  }
  v8 = [(AXSBUIAudiographRootViewController *)self chartDescriptor];
  v9 = +[AXAudiographExplorerProvider makeAudiographExplorerView:v8];
  [(AXSBUIAudiographRootViewController *)self setHostingController:v9];

  if (v10) {
    v10[2]();
  }
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)AXSBUIAudiographRootViewController;
  [(AXSBUIAudiographRootViewController *)&v5 viewDidLoad];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"selectedSeriesChanged:" name:@"AudiographExplorerSelectedSeriesChanged" object:0];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"toggleAudiographPlaybackState:" name:@"ToggleAudiographPlaybackState" object:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v19.receiver = self;
  v19.super_class = (Class)AXSBUIAudiographRootViewController;
  [(AXSBUIAudiographRootViewController *)&v19 viewDidAppear:a3];
  [(AXSBUIAudiographRootViewController *)self _setupRemoteProxy];
  v4 = [(AXSBUIAudiographRootViewController *)self chartDescriptor];
  objc_super v5 = [v4 series];
  id v6 = [v5 count];

  if ((unint64_t)v6 <= 1) {
    id v7 = &off_100025FB8;
  }
  else {
    id v7 = &off_100025FA0;
  }
  UIAccessibilityPostNotification(0x432u, v7);
  v8 = [AXSBUIAudiographNavigationController alloc];
  v9 = [(AXSBUIAudiographRootViewController *)self hostingController];
  v10 = [(AXSBUIAudiographNavigationController *)v8 initWithRootViewController:v9];

  [(AXSBUIAudiographNavigationController *)v10 setDismissDelegate:self];
  v11 = sub_10000CFD0(@"AXAudiographExplorer.title");
  v12 = [(AXSBUIAudiographRootViewController *)self hostingController];
  v13 = [v12 navigationItem];
  [v13 setTitle:v11];

  id v14 = objc_alloc((Class)UIBarButtonItem);
  v15 = sub_10000CFD0(@"AXAudiographExplorer.done");
  id v16 = [v14 initWithTitle:v15 style:2 target:self action:"dismiss"];
  v17 = [(AXSBUIAudiographRootViewController *)self hostingController];
  v18 = [v17 navigationItem];
  [v18 setRightBarButtonItem:v16];

  [(AXSBUIAudiographRootViewController *)self presentViewController:v10 animated:0 completion:0];
}

- (void)selectedSeriesChanged:(id)a3
{
  v3 = [a3 userInfo];
  id argument = [v3 objectForKeyedSubscript:@"seriesIndex"];

  v4 = argument;
  if (argument)
  {
    UIAccessibilityPostNotification(0x432u, argument);
    v4 = argument;
  }
}

- (void)toggleAudiographPlaybackState:(id)a3
{
  v3 = [a3 userInfo];
  id argument = [v3 objectForKeyedSubscript:@"shouldPlay"];

  v4 = argument;
  if (argument)
  {
    UIAccessibilityPostNotification(0x433u, argument);
    v4 = argument;
  }
}

- (void)dismiss
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100011EAC;
  v2[3] = &unk_100024748;
  v2[4] = self;
  [(AXSBUIAudiographRootViewController *)self dismissViewControllerAnimated:0 completion:v2];
}

- (void)_setupRemoteProxy
{
  id v2 = [(AXSBUIAudiographRootViewController *)self _remoteViewControllerProxy];
  [v2 setOrientationChangedEventsEnabled:0];
  [v2 setAllowsMenuButtonDismissal:1];
  [v2 setWallpaperTunnelActive:1];
  [v2 setWallpaperStyle:4 withDuration:0.3];
  [v2 setStatusBarHidden:1 withDuration:0.3];
}

- (BOOL)accessibilityPostScreenChangedForChildViewController:(id)a3 isAddition:(BOOL)a4
{
  return a4;
}

- (AXMChartDescriptor)chartDescriptor
{
  return self->_chartDescriptor;
}

- (void)setChartDescriptor:(id)a3
{
}

- (UIViewController)hostingController
{
  return self->_hostingController;
}

- (void)setHostingController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostingController, 0);

  objc_storeStrong((id *)&self->_chartDescriptor, 0);
}

@end