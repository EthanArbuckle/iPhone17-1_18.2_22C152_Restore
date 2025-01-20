@interface _EFContentProtectionObserverWrapper
- (EFContentProtectionObserver)observer;
- (OS_dispatch_queue)queue;
- (_EFContentProtectionObserverWrapper)initWithObserver:(id)a3 queue:(id)a4;
@end

@implementation _EFContentProtectionObserverWrapper

- (_EFContentProtectionObserverWrapper)initWithObserver:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_EFContentProtectionObserverWrapper;
  v8 = [(_EFContentProtectionObserverWrapper *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_observer, v6);
    objc_storeStrong((id *)&v9->_queue, a4);
  }

  return v9;
}

- (EFContentProtectionObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (EFContentProtectionObserver *)WeakRetained;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_observer);
}

@end