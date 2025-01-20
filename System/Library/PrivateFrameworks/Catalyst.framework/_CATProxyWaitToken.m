@interface _CATProxyWaitToken
- (BOOL)isExclusive;
- (_CATProxyWaitToken)initWithExclusive:(BOOL)a3 group:(id)a4;
- (id)resourceProxy;
- (void)cancel;
- (void)dealloc;
- (void)invalidate;
- (void)notifyWithResourceProxy:(id)a3;
@end

@implementation _CATProxyWaitToken

- (_CATProxyWaitToken)initWithExclusive:(BOOL)a3 group:(id)a4
{
  id v8 = a4;
  if (!v8)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"CATArbitrator.m", 685, @"Invalid parameter not satisfying: %@", @"group" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)_CATProxyWaitToken;
  v9 = [(_CATProxyWaitToken *)&v13 init];
  v10 = v9;
  if (v9)
  {
    v9->_isExclusive = a3;
    objc_storeStrong((id *)&v9->mGroup, a4);
    dispatch_group_enter((dispatch_group_t)v10->mGroup);
  }

  return v10;
}

- (void)dealloc
{
  [(_CATProxyWaitToken *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)_CATProxyWaitToken;
  [(_CATProxyWaitToken *)&v3 dealloc];
}

- (void)notifyWithResourceProxy:(id)a3
{
  id v5 = a3;
  char v6 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->mFinished, (unsigned __int8 *)&v6, 1u);
  if (!v6)
  {
    id v8 = v5;
    objc_storeStrong(&self->_resourceProxy, a3);
    dispatch_group_leave((dispatch_group_t)self->mGroup);
    mGroup = self->mGroup;
    self->mGroup = 0;

    id v5 = v8;
  }
}

- (void)cancel
{
}

- (void)invalidate
{
  self->_resourceProxy = 0;
  MEMORY[0x270F9A758]();
}

- (BOOL)isExclusive
{
  return self->_isExclusive;
}

- (id)resourceProxy
{
  return self->_resourceProxy;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resourceProxy, 0);

  objc_storeStrong((id *)&self->mGroup, 0);
}

@end