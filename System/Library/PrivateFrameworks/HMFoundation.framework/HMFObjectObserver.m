@interface HMFObjectObserver
- (BOOL)isEqual:(id)a3;
- (HMFObjectObserver)init;
- (HMFObjectObserver)initWithObservedObject:(id)a3;
- (id)deallocationBlock;
- (id)observedObject;
- (unint64_t)cachedHash;
- (void)_startObserving;
- (void)_stopObserving;
- (void)dealloc;
- (void)setDeallocationBlock:(id)a3;
@end

@implementation HMFObjectObserver

- (unint64_t)cachedHash
{
  return self->_cachedHash;
}

- (void)dealloc
{
  id deallocationBlock = self->_deallocationBlock;
  self->_id deallocationBlock = 0;

  [(HMFObjectObserver *)self _stopObserving];
  v4.receiver = self;
  v4.super_class = (Class)HMFObjectObserver;
  [(HMFObjectObserver *)&v4 dealloc];
}

- (void)_stopObserving
{
  v3 = (void *)MEMORY[0x19F3A87A0](self, a2);
  objc_super v4 = [(HMFObjectObserver *)self observedObject];
  v5 = v4;
  if (v4) {
    objc_setAssociatedObject(v4, self, 0, (void *)1);
  }
}

void __36__HMFObjectObserver__startObserving__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained deallocationBlock];
  v2 = (void *)v1;
  if (v1)
  {
    (*(void (**)(uint64_t))(v1 + 16))(v1);
    [WeakRetained setDeallocationBlock:0];
  }
}

- (void)setDeallocationBlock:(id)a3
{
}

- (HMFObjectObserver)initWithObservedObject:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)HMFObjectObserver;
    v5 = [(HMFObjectObserver *)&v9 init];
    v6 = v5;
    if (v5)
    {
      objc_storeWeak(&v5->_observedObject, v4);
      v6->_cachedHash = [v4 hash];
      [(HMFObjectObserver *)v6 _startObserving];
    }
    self = v6;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_startObserving
{
  v3 = [(HMFObjectObserver *)self observedObject];
  if (v3)
  {
    id v4 = objc_alloc_init(_HMFObjectObserverInternal);
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __36__HMFObjectObserver__startObserving__block_invoke;
    v5[3] = &unk_1E59576C0;
    objc_copyWeak(&v6, &location);
    [(_HMFObjectObserverInternal *)v4 setDeallocationBlock:v5];
    objc_setAssociatedObject(v3, self, v4, (void *)1);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (id)observedObject
{
  id WeakRetained = objc_loadWeakRetained(&self->_observedObject);
  return WeakRetained;
}

- (id)deallocationBlock
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deallocationBlock, 0);
  objc_destroyWeak(&self->_observedObject);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMFObjectObserver *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    id v6 = v5;
    if (v6)
    {
      unint64_t v7 = atomic_load((unint64_t *)&self->_observedObject);
      unint64_t v8 = atomic_load(v6 + 1);
      if (v7) {
        BOOL v9 = v8 == 0;
      }
      else {
        BOOL v9 = 1;
      }
      BOOL v11 = !v9 && v7 == v8;
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  return v11;
}

- (HMFObjectObserver)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end