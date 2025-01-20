@interface CPLProxyResourceTransferTask
- (CPLProxyLibraryManager)proxyLibraryManager;
- (void)cancelTask;
- (void)setProxyLibraryManager:(id)a3;
@end

@implementation CPLProxyResourceTransferTask

- (void)cancelTask
{
  v3.receiver = self;
  v3.super_class = (Class)CPLProxyResourceTransferTask;
  [(CPLResourceTransferTask *)&v3 cancelTask];
  [(CPLProxyLibraryManager *)self->_proxyLibraryManager cancelTask:self];
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