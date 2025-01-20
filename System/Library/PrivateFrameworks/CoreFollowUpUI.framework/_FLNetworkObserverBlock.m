@interface _FLNetworkObserverBlock
- (id)_initWithBlock:(id)a3 networkObserver:(id)a4;
- (void)dealloc;
- (void)executeBlock;
@end

@implementation _FLNetworkObserverBlock

- (id)_initWithBlock:(id)a3 networkObserver:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_FLNetworkObserverBlock;
  v8 = [(_FLNetworkObserverBlock *)&v12 init];
  if (v8)
  {
    uint64_t v9 = MEMORY[0x223C91420](v6);
    id block = v8->_block;
    v8->_id block = (id)v9;

    objc_storeWeak((id *)&v8->_networkObserver, v7);
  }

  return v8;
}

- (void)executeBlock
{
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_networkObserver);
  [WeakRetained removeNetworkReachableObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)_FLNetworkObserverBlock;
  [(_FLNetworkObserverBlock *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_networkObserver);

  objc_storeStrong(&self->_block, 0);
}

@end