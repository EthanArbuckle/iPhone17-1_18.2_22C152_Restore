@interface WorkspaceObserver
- (WorkspaceObserverDelegate)delegate;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)applicationsWillInstall:(id)a3;
- (void)applicationsWillUninstall:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startObserving;
- (void)stopObserving;
@end

@implementation WorkspaceObserver

- (void)startObserving
{
  id v3 = [MEMORY[0x263F01880] defaultWorkspace];
  [v3 addObserver:self];
}

- (void)stopObserving
{
  id v3 = [MEMORY[0x263F01880] defaultWorkspace];
  [v3 removeObserver:self];
}

- (WorkspaceObserverDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void)applicationsWillInstall:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(LSApplicationWorkspaceObserverProtocol *)self->_delegate applicationsWillInstall:v4];
  }
}

- (void)applicationsDidInstall:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(LSApplicationWorkspaceObserverProtocol *)self->_delegate applicationsDidInstall:v4];
  }
}

- (void)applicationsWillUninstall:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(LSApplicationWorkspaceObserverProtocol *)self->_delegate applicationsWillUninstall:v4];
  }
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(LSApplicationWorkspaceObserverProtocol *)self->_delegate applicationsDidUninstall:v4];
  }
}

- (void).cxx_destruct
{
}

@end