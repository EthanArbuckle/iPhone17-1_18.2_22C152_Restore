@interface IAPWorkspaceObserver
- (IAPWorkspaceObserverDelegate)delegate;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)applicationsWillInstall:(id)a3;
- (void)applicationsWillUninstall:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startObserving;
- (void)stopObserving;
@end

@implementation IAPWorkspaceObserver

- (void)startObserving
{
  id v3 = +[LSApplicationWorkspace defaultWorkspace];
  [v3 addObserver:self];
}

- (void)stopObserving
{
  id v3 = +[LSApplicationWorkspace defaultWorkspace];
  [v3 removeObserver:self];
}

- (IAPWorkspaceObserverDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (LSApplicationWorkspaceObserverProtocol *)a3;
}

- (void)applicationsWillInstall:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    [(LSApplicationWorkspaceObserverProtocol *)delegate applicationsWillInstall:a3];
  }
}

- (void)applicationsDidInstall:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    [(LSApplicationWorkspaceObserverProtocol *)delegate applicationsDidInstall:a3];
  }
}

- (void)applicationsWillUninstall:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    [(LSApplicationWorkspaceObserverProtocol *)delegate applicationsWillUninstall:a3];
  }
}

- (void)applicationsDidUninstall:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    [(LSApplicationWorkspaceObserverProtocol *)delegate applicationsDidUninstall:a3];
  }
}

@end