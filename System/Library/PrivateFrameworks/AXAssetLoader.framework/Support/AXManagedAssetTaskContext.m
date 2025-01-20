@interface AXManagedAssetTaskContext
+ (AXManagedAssetTaskContext)contextWithActivity:(id)a3;
+ (AXManagedAssetTaskContext)contextWithXPCClient;
- (AXAssetsXPCActivity)activity;
- (BOOL)shouldDefer;
- (id)_init;
- (unint64_t)environment;
- (void)finishWithResult:(unint64_t)a3;
- (void)setActivity:(id)a3;
- (void)setEnvironment:(unint64_t)a3;
@end

@implementation AXManagedAssetTaskContext

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)AXManagedAssetTaskContext;
  return [(AXManagedAssetTaskContext *)&v3 init];
}

+ (AXManagedAssetTaskContext)contextWithActivity:(id)a3
{
  id v3 = a3;
  id v4 = [[AXManagedAssetTaskContext alloc] _init];
  [v4 setEnvironment:1];
  [v4 setActivity:v3];

  return (AXManagedAssetTaskContext *)v4;
}

+ (AXManagedAssetTaskContext)contextWithXPCClient
{
  id v2 = [[AXManagedAssetTaskContext alloc] _init];
  [v2 setEnvironment:0];
  return (AXManagedAssetTaskContext *)v2;
}

- (BOOL)shouldDefer
{
  if ((id)[(AXManagedAssetTaskContext *)self environment] != (id)1) {
    return 0;
  }
  id v3 = [(AXManagedAssetTaskContext *)self activity];
  unsigned __int8 v4 = [v3 shouldDefer];

  return v4;
}

- (void)finishWithResult:(unint64_t)a3
{
  if ((id)[(AXManagedAssetTaskContext *)self environment] != (id)1) {
    return;
  }
  if (a3)
  {
    if (a3 == 2)
    {
      v5 = [(AXManagedAssetTaskContext *)self activity];
      id v7 = v5;
      uint64_t v6 = 3;
      goto LABEL_8;
    }
    if (a3 != 1) {
      return;
    }
  }
  v5 = [(AXManagedAssetTaskContext *)self activity];
  id v7 = v5;
  uint64_t v6 = 5;
LABEL_8:
  [v5 updateState:v6];
}

- (unint64_t)environment
{
  return self->_environment;
}

- (void)setEnvironment:(unint64_t)a3
{
  self->_environment = a3;
}

- (AXAssetsXPCActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end