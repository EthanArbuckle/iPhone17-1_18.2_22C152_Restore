@interface AKDataSeparatedAuthorizationStore
- (AKDataSeparatedAuthorizationStore)initWithContainerPath:(id)a3 withSandboxToken:(char *)a4;
- (NSString)containerPath;
- (char)token;
- (void)cleanup;
- (void)perform:(id)a3;
- (void)prepare;
- (void)setContainerPath:(id)a3;
- (void)setToken:(char *)a3;
@end

@implementation AKDataSeparatedAuthorizationStore

- (AKDataSeparatedAuthorizationStore)initWithContainerPath:(id)a3 withSandboxToken:(char *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AKDataSeparatedAuthorizationStore;
  v7 = [(AKAuthorizationStore *)&v10 initWithPath:v6];
  v8 = v7;
  if (v7)
  {
    [(AKDataSeparatedAuthorizationStore *)v7 setContainerPath:v6];
    [(AKDataSeparatedAuthorizationStore *)v8 setToken:a4];
  }

  return v8;
}

- (void)prepare
{
  if ([(AKDataSeparatedAuthorizationStore *)self token])
  {
    [(AKDataSeparatedAuthorizationStore *)self token];
    uint64_t v3 = sandbox_extension_consume();
    p_handle = &self->handle;
    int64_t *p_handle = v3;
    if (v3 > 0) {
      return;
    }
  }
  else
  {
    p_handle = &self->handle;
    int64_t *p_handle = -1;
  }
  v5 = _AKLogSiwa();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10017EA10(p_handle, v5);
  }
}

- (void)cleanup
{
}

- (void)perform:(id)a3
{
  id v4 = a3;
  [(AKDataSeparatedAuthorizationStore *)self prepare];
  v5.receiver = self;
  v5.super_class = (Class)AKDataSeparatedAuthorizationStore;
  [(AKAuthorizationStore *)&v5 perform:v4];

  [(AKDataSeparatedAuthorizationStore *)self cleanup];
}

- (NSString)containerPath
{
  return self->_containerPath;
}

- (void)setContainerPath:(id)a3
{
}

- (char)token
{
  return self->_token;
}

- (void)setToken:(char *)a3
{
  self->_token = a3;
}

- (void).cxx_destruct
{
}

@end