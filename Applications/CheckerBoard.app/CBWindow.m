@interface CBWindow
- (BOOL)backgroundTunnel;
- (BOOL)dismissed;
- (BOOL)isStatusBarHidden;
- (BOOL)presentViewControllerWithStatusBarShown;
- (CBWindow)init;
- (CBWindow)initWithBackgroundTunnel:(BOOL)a3;
- (CBWindowDelegate)windowManager;
- (NSString)description;
- (UIViewController)presentedView;
- (double)previousStatusBarWindowLevel;
- (unint64_t)windowManagerLayer;
- (void)dismissViewControllerAnimated:(BOOL)a3;
- (void)setBackgroundTunnel:(BOOL)a3;
- (void)setDismissed:(BOOL)a3;
- (void)setPresentViewControllerWithStatusBarShown:(BOOL)a3;
- (void)setPresentedView:(id)a3;
- (void)setPreviousStatusBarWindowLevel:(double)a3;
- (void)setStatusBarHidden:(BOOL)a3;
- (void)setWindowManager:(id)a3;
- (void)setWindowManagerLayer:(unint64_t)a3;
- (void)viewControllerDidDismiss;
@end

@implementation CBWindow

- (NSString)description
{
  v3 = [(CBWindow *)self presentedView];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);

  v6 = +[NSString stringWithFormat:@"<%@:%p -> %@>", objc_opt_class(), self, v5];

  return (NSString *)v6;
}

- (CBWindow)init
{
  return [(CBWindow *)self initWithBackgroundTunnel:0];
}

- (CBWindow)initWithBackgroundTunnel:(BOOL)a3
{
  v5 = +[UIScreen mainScreen];
  [v5 _referenceBounds];
  v8.receiver = self;
  v8.super_class = (Class)CBWindow;
  v6 = -[CBWindow initWithFrame:](&v8, "initWithFrame:");

  if (v6)
  {
    v6->_backgroundTunnel = a3;
    v6->_dismissed = 0;
  }
  return v6;
}

- (void)setBackgroundTunnel:(BOOL)a3
{
  if (self->_backgroundTunnel != a3)
  {
    BOOL v3 = a3;
    self->_backgroundTunnel = a3;
    id v5 = [(CBWindow *)self windowManager];
    [v5 window:self changedBackgroundTunnel:v3];
  }
}

- (void)dismissViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(CBWindow *)self dismissed])
  {
    [(CBWindow *)self setDismissed:1];
    objc_initWeak(&location, self);
    id v5 = [(CBWindow *)self windowManager];
    [v5 windowWillDismiss:self];

    v6 = [(CBWindow *)self presentedView];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10002759C;
    v7[3] = &unk_100079608;
    objc_copyWeak(&v8, &location);
    [v6 dismissViewControllerAnimated:v3 completion:v7];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)viewControllerDidDismiss
{
  if (![(CBWindow *)self dismissed])
  {
    [(CBWindow *)self setDismissed:1];
    BOOL v3 = [(CBWindow *)self windowManager];
    [v3 windowWillDismiss:self];

    id v4 = [(CBWindow *)self windowManager];
    [v4 windowDidDismiss:self];
  }
}

- (unint64_t)windowManagerLayer
{
  return self->_windowManagerLayer;
}

- (void)setWindowManagerLayer:(unint64_t)a3
{
  self->_windowManagerLayer = a3;
}

- (CBWindowDelegate)windowManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowManager);

  return (CBWindowDelegate *)WeakRetained;
}

- (void)setWindowManager:(id)a3
{
}

- (BOOL)presentViewControllerWithStatusBarShown
{
  return self->_presentViewControllerWithStatusBarShown;
}

- (void)setPresentViewControllerWithStatusBarShown:(BOOL)a3
{
  self->_presentViewControllerWithStatusBarShown = a3;
}

- (double)previousStatusBarWindowLevel
{
  return self->_previousStatusBarWindowLevel;
}

- (void)setPreviousStatusBarWindowLevel:(double)a3
{
  self->_previousStatusBarWindowLevel = a3;
}

- (BOOL)isStatusBarHidden
{
  return self->_statusBarHidden;
}

- (void)setStatusBarHidden:(BOOL)a3
{
  self->_statusBarHidden = a3;
}

- (BOOL)backgroundTunnel
{
  return self->_backgroundTunnel;
}

- (BOOL)dismissed
{
  return self->_dismissed;
}

- (void)setDismissed:(BOOL)a3
{
  self->_dismissed = a3;
}

- (UIViewController)presentedView
{
  return self->_presentedView;
}

- (void)setPresentedView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedView, 0);

  objc_destroyWeak((id *)&self->_windowManager);
}

@end