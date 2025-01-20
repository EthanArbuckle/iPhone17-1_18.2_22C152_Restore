@interface CBWindowRepresentation
+ (id)windowRepresentationForIdentifier:(id)a3;
- (BOOL)backgroundTunnel;
- (BOOL)isHidden;
- (BOOL)isStatusBarHidden;
- (BOOL)presentViewControllerWithStatusBarShown;
- (CBWindowDelegate)windowManager;
- (CBWindowRepresentation)initWithIdentifier:(id)a3;
- (NSString)description;
- (NSString)identifier;
- (double)previousStatusBarWindowLevel;
- (double)windowLevel;
- (unint64_t)windowManagerLayer;
- (void)didLaunchApp;
- (void)dismissViewControllerAnimated:(BOOL)a3;
- (void)setBackgroundTunnel:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setPresentViewControllerWithStatusBarShown:(BOOL)a3;
- (void)setPreviousStatusBarWindowLevel:(double)a3;
- (void)setStatusBarHidden:(BOOL)a3;
- (void)setWindowLevel:(double)a3;
- (void)setWindowManager:(id)a3;
- (void)setWindowManagerLayer:(unint64_t)a3;
- (void)viewControllerDidDismiss;
- (void)willLaunchApp;
@end

@implementation CBWindowRepresentation

+ (id)windowRepresentationForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithIdentifier:v4];

  return v5;
}

- (CBWindowRepresentation)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CBWindowRepresentation;
  v6 = [(CBWindowRepresentation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(CBWindowRepresentation *)self identifier];
  id v5 = +[NSString stringWithFormat:@"<%@:%p -> %@>", v3, self, v4];

  return (NSString *)v5;
}

- (void)setBackgroundTunnel:(BOOL)a3
{
  BOOL v3 = a3;
  self->_backgroundTunnel = a3;
  id v5 = [(CBWindowRepresentation *)self windowManager];
  [v5 window:self changedBackgroundTunnel:v3];
}

- (void)dismissViewControllerAnimated:(BOOL)a3
{
  id v4 = [(CBWindowRepresentation *)self windowManager];
  [v4 windowWillDismiss:self];

  id v5 = [(CBWindowRepresentation *)self windowManager];
  [v5 windowDidDismiss:self];
}

- (void)viewControllerDidDismiss
{
  BOOL v3 = [(CBWindowRepresentation *)self windowManager];
  [v3 windowWillDismiss:self];

  id v4 = [(CBWindowRepresentation *)self windowManager];
  [v4 windowDidDismiss:self];
}

- (void)willLaunchApp
{
  id v3 = [(CBWindowRepresentation *)self windowManager];
  [v3 windowWillAppear:self];
}

- (void)didLaunchApp
{
  id v3 = [(CBWindowRepresentation *)self windowManager];
  [v3 windowDidAppear:self];
}

- (double)windowLevel
{
  return self->_windowLevel;
}

- (void)setWindowLevel:(double)a3
{
  self->_windowLevel = a3;
}

- (BOOL)backgroundTunnel
{
  return self->_backgroundTunnel;
}

- (CBWindowDelegate)windowManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowManager);

  return (CBWindowDelegate *)WeakRetained;
}

- (void)setWindowManager:(id)a3
{
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (unint64_t)windowManagerLayer
{
  return self->_windowManagerLayer;
}

- (void)setWindowManagerLayer:(unint64_t)a3
{
  self->_windowManagerLayer = a3;
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

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_destroyWeak((id *)&self->_windowManager);
}

@end