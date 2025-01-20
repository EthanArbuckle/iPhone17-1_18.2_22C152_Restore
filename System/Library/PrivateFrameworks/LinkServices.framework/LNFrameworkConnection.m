@interface LNFrameworkConnection
- (BOOL)refreshWithOptions:(id)a3;
- (void)connectWithOptions:(id)a3;
@end

@implementation LNFrameworkConnection

- (BOOL)refreshWithOptions:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)LNFrameworkConnection;
  if ([(LNConnection *)&v7 refreshWithOptions:a3])
  {
    v4 = LNConnectionErrorWithCode(1001);
    v5 = getLNLogCategoryConnection();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v9 = v4;
      _os_log_impl(&dword_1A4419000, v5, OS_LOG_TYPE_ERROR, "Unable to get remoteObjectProxyWithErrorHandler, error: %{public}@", buf, 0xCu);
    }

    [(LNConnection *)self setDisconnectedWithError:v4];
  }
  return 0;
}

- (void)connectWithOptions:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)LNFrameworkConnection;
  [(LNConnection *)&v6 connectWithOptions:a3];
  v4 = LNConnectionErrorWithCode(1001);
  v5 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v8 = v4;
    _os_log_impl(&dword_1A4419000, v5, OS_LOG_TYPE_ERROR, "Unable to get remoteObjectProxyWithErrorHandler, error: %{public}@", buf, 0xCu);
  }

  [(LNConnection *)self setDisconnectedWithError:v4];
}

@end