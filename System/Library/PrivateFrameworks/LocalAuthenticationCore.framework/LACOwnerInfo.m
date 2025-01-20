@interface LACOwnerInfo
- (LACOwnerInfo)initWithProcessId:(int)a3 proxy:(id)a4 invalidationBlock:(id)a5;
- (id)invalidationBlock;
- (id)proxy;
- (int)pid;
@end

@implementation LACOwnerInfo

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_proxy);
  objc_storeStrong(&self->_invalidationBlock, 0);
}

- (LACOwnerInfo)initWithProcessId:(int)a3 proxy:(id)a4 invalidationBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)LACOwnerInfo;
  v10 = [(LACOwnerInfo *)&v15 init];
  v11 = v10;
  if (v10)
  {
    v10->_pid = a3;
    objc_storeWeak(&v10->_proxy, v8);
    v12 = _Block_copy(v9);
    id invalidationBlock = v11->_invalidationBlock;
    v11->_id invalidationBlock = v12;
  }
  return v11;
}

- (int)pid
{
  return self->_pid;
}

- (id)invalidationBlock
{
  return self->_invalidationBlock;
}

- (id)proxy
{
  id WeakRetained = objc_loadWeakRetained(&self->_proxy);
  return WeakRetained;
}

@end