@interface _FPFilePresenterObserver
- (NSFileProviderManager)parentConnection;
- (void)observePresentedFilesDidChange:(id)a3;
- (void)setParentConnection:(id)a3;
@end

@implementation _FPFilePresenterObserver

- (void)observePresentedFilesDidChange:(id)a3
{
  p_parentConnection = &self->_parentConnection;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_parentConnection);
  [WeakRetained setPresentedFiles:v4];
}

- (void)setParentConnection:(id)a3
{
}

- (NSFileProviderManager)parentConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentConnection);

  return (NSFileProviderManager *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end