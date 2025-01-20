@interface AXSBVOTItemChooserRootViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (BOOL)accessibilityPostScreenChangedForChildViewController:(id)a3 isAddition:(BOOL)a4;
- (BOOL)itemChooserActivate;
- (NSDictionary)items;
- (VOTUIItemChooserController)itemChooserController;
- (int64_t)itemChooserSelectedIndex;
- (void)_dismiss;
- (void)_setupRemoteProxy;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)itemChooser:(id)a3 didSelectItemAtIndex:(int64_t)a4 activate:(BOOL)a5;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)removeFromParentViewController;
- (void)setItemChooserActivate:(BOOL)a3;
- (void)setItemChooserController:(id)a3;
- (void)setItemChooserSelectedIndex:(int64_t)a3;
- (void)setItems:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation AXSBVOTItemChooserRootViewController

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
  id v8 = a4;
  v6 = [a3 userInfo];
  [(AXSBVOTItemChooserRootViewController *)self setItems:v6];

  v7 = v8;
  if (v8)
  {
    (*((void (**)(id))v8 + 2))(v8);
    v7 = v8;
  }
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)AXSBVOTItemChooserRootViewController;
  [(AXSBVOTItemChooserRootViewController *)&v10 viewDidLoad];
  v3 = objc_opt_new();
  [v3 setAutoresizingMask:18];
  v4 = +[UIColor blackColor];
  [v3 setBackgroundColor:v4];

  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = [(AXSBVOTItemChooserRootViewController *)self view];
  [v5 addSubview:v3];

  v6 = [(AXSBVOTItemChooserRootViewController *)self view];
  [v3 ax_pinConstraintsInAllDimensionsToView:v6];

  id v8 = objc_alloc_init(VOTUIItemChooserController);
  [(AXSBVOTItemChooserRootViewController *)self setItemChooserController:v8];

  v9 = [(AXSBVOTItemChooserRootViewController *)self itemChooserController];
  [v9 setDelegate:self];

  [(AXSBVOTItemChooserRootViewController *)self setItemChooserSelectedIndex:0x7FFFFFFFFFFFFFFFLL];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AXSBVOTItemChooserRootViewController;
  [(AXSBVOTItemChooserRootViewController *)&v6 viewDidAppear:a3];
  [(AXSBVOTItemChooserRootViewController *)self _setupRemoteProxy];
  v4 = [(AXSBVOTItemChooserRootViewController *)self itemChooserController];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001284C;
  v5[3] = &unk_100024748;
  v5[4] = self;
  [(AXSBVOTItemChooserRootViewController *)self presentViewController:v4 animated:0 completion:v5];
}

- (void)_dismiss
{
  int64_t v3 = [(AXSBVOTItemChooserRootViewController *)self itemChooserSelectedIndex];
  unsigned __int8 v4 = [(AXSBVOTItemChooserRootViewController *)self itemChooserActivate];
  v5 = [(AXSBVOTItemChooserRootViewController *)self itemChooserController];
  uint64_t v6 = [v5 lastSearchTerm];
  id v7 = (void *)v6;
  id v8 = &stru_100024F38;
  if (v6) {
    id v8 = (__CFString *)v6;
  }
  v9 = v8;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000129B4;
  v11[3] = &unk_100024EB8;
  v12 = v9;
  int64_t v13 = v3;
  unsigned __int8 v14 = v4;
  v11[4] = self;
  objc_super v10 = v9;
  [(AXSBVOTItemChooserRootViewController *)self dismissViewControllerAnimated:0 completion:v11];
}

- (void)_setupRemoteProxy
{
  id v2 = [(AXSBVOTItemChooserRootViewController *)self _remoteViewControllerProxy];
  [v2 setOrientationChangedEventsEnabled:0];
  [v2 setAllowsMenuButtonDismissal:1];
  [v2 setWallpaperTunnelActive:1];
  [v2 setWallpaperStyle:4 withDuration:0.3];
  [v2 setStatusBarHidden:1 withDuration:0.3];
}

- (void)removeFromParentViewController
{
  v9[0] = @"row";
  v9[1] = @"activate";
  v10[0] = &off_100025FD0;
  v10[1] = &__kCFBooleanFalse;
  v9[2] = @"searchTerm";
  int64_t v3 = [(AXSBVOTItemChooserRootViewController *)self itemChooserController];
  uint64_t v4 = [v3 lastSearchTerm];
  v5 = (void *)v4;
  CFStringRef v6 = &stru_100024F38;
  if (v4) {
    CFStringRef v6 = (const __CFString *)v4;
  }
  v10[2] = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];
  UIAccessibilityPostNotification(0x7EAu, v7);

  v8.receiver = self;
  v8.super_class = (Class)AXSBVOTItemChooserRootViewController;
  [(AXSBVOTItemChooserRootViewController *)&v8 removeFromParentViewController];
}

- (void)itemChooser:(id)a3 didSelectItemAtIndex:(int64_t)a4 activate:(BOOL)a5
{
  BOOL v5 = a5;
  [(AXSBVOTItemChooserRootViewController *)self setItemChooserSelectedIndex:a4];
  [(AXSBVOTItemChooserRootViewController *)self setItemChooserActivate:v5];

  [(AXSBVOTItemChooserRootViewController *)self _dismiss];
}

- (BOOL)accessibilityPostScreenChangedForChildViewController:(id)a3 isAddition:(BOOL)a4
{
  return a4;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (VOTUIItemChooserController)itemChooserController
{
  return self->_itemChooserController;
}

- (void)setItemChooserController:(id)a3
{
}

- (NSDictionary)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (int64_t)itemChooserSelectedIndex
{
  return self->_itemChooserSelectedIndex;
}

- (void)setItemChooserSelectedIndex:(int64_t)a3
{
  self->_itemChooserSelectedIndex = a3;
}

- (BOOL)itemChooserActivate
{
  return self->_itemChooserActivate;
}

- (void)setItemChooserActivate:(BOOL)a3
{
  self->_itemChooserActivate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);

  objc_storeStrong((id *)&self->_itemChooserController, 0);
}

@end