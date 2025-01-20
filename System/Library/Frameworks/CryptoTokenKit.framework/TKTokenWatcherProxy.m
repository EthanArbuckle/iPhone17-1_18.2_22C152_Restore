@interface TKTokenWatcherProxy
- (TKTokenWatcherProxy)initWithWatcher:(id)a3;
- (void)insertedToken:(id)a3;
- (void)removedToken:(id)a3;
@end

@implementation TKTokenWatcherProxy

- (TKTokenWatcherProxy)initWithWatcher:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TKTokenWatcherProxy;
  v5 = [(TKTokenWatcherProxy *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_watcher, v4);
  }

  return v6;
}

- (void)insertedToken:(id)a3
{
  p_watcher = &self->_watcher;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_watcher);
  [WeakRetained insertedToken:v4];
}

- (void)removedToken:(id)a3
{
  p_watcher = &self->_watcher;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_watcher);
  [WeakRetained removedToken:v4];
}

- (void).cxx_destruct
{
}

@end