@interface CPLProxyForceSyncTask
- (CPLProxyLibraryManager)proxyLibraryManager;
- (void)cancelTask;
- (void)setProxyLibraryManager:(id)a3;
@end

@implementation CPLProxyForceSyncTask

- (void)cancelTask
{
  v3.receiver = self;
  v3.super_class = (Class)CPLProxyForceSyncTask;
  [(CPLForceSyncTask *)&v3 cancelTask];
  [(CPLProxyLibraryManager *)self->_proxyLibraryManager cancelSyncTask:self];
}

- (CPLProxyLibraryManager)proxyLibraryManager
{
  return self->_proxyLibraryManager;
}

- (void)setProxyLibraryManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end