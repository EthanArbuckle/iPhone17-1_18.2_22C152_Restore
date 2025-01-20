@interface FigDelegateStorage
+ (void)initialize;
- (FigDelegateStorage)init;
- (OS_dispatch_queue)delegateQueue;
- (id)delegate;
- (void)dealloc;
- (void)invokeDelegateCallbackWithBlock:(id)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
@end

@implementation FigDelegateStorage

- (void)setDelegate:(id)a3 queue:(id)a4
{
  if (!a3 && a4)
  {
    v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    v10 = @"When setting the delegate to nil the queue must also be nil";
    goto LABEL_10;
  }
  if (a3 && !a4)
  {
    v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    v10 = @"Caller must provide a queue";
LABEL_10:
    objc_exception_throw((id)[v8 exceptionWithName:v9 reason:v10 userInfo:0]);
  }
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  objc_storeWeak(&self->_delegate, a3);
  delegateQueue = self->_delegateQueue;
  self->_delegateQueue = (OS_dispatch_queue *)a4;
  os_unfair_lock_unlock(&self->_lock);
}

- (FigDelegateStorage)init
{
  v3.receiver = self;
  v3.super_class = (Class)FigDelegateStorage;
  result = [(FigDelegateStorage *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)invokeDelegateCallbackWithBlock:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = self->_delegateQueue;
  os_unfair_lock_unlock(p_lock);
  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__FigDelegateStorage_invokeDelegateCallbackWithBlock___block_invoke;
    v8[3] = &unk_1E5C24E50;
    v8[4] = self;
    v8[5] = a3;
    dispatch_async((dispatch_queue_t)v6, v8);
  }
  else
  {
    id v7 = (void (*)(id, void))*((void *)a3 + 2);
    v7(a3, 0);
  }
}

void __54__FigDelegateStorage_invokeDelegateCallbackWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  objc_super v3 = (void *)MEMORY[0x1A6272C70]();
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 24));
  id Weak = objc_loadWeak((id *)(v2 + 16));
  if (!Weak)
  {

    *(void *)(v2 + 8) = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 24));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, Weak);
}

- (id)delegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id Weak = objc_loadWeak(&self->_delegate);
  os_unfair_lock_unlock(p_lock);
  return Weak;
}

+ (void)initialize
{
}

- (void)dealloc
{
  objc_storeWeak(&self->_delegate, 0);

  v3.receiver = self;
  v3.super_class = (Class)FigDelegateStorage;
  [(FigDelegateStorage *)&v3 dealloc];
}

- (OS_dispatch_queue)delegateQueue
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_delegateQueue;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

@end