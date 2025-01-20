@interface AVNotificationSubscription
- (AVNotificationSubscription)initWithObject:(id)a3 notificationName:(id)a4 callbackBlock:(id)a5;
- (NSString)description;
- (void)cancel;
- (void)dealloc;
@end

@implementation AVNotificationSubscription

void __76__AVNotificationSubscription_initWithObject_notificationName_callbackBlock___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x199715AE0]();
  Weak = objc_loadWeak((id *)(a1 + 32));
  if (Weak) {
    (*(void (**)(void))(Weak[3] + 16))();
  }
}

- (AVNotificationSubscription)initWithObject:(id)a3 notificationName:(id)a4 callbackBlock:(id)a5
{
  v15.receiver = self;
  v15.super_class = (Class)AVNotificationSubscription;
  v8 = [(AVNotificationSubscription *)&v15 init];
  if (v8)
  {
    v8->_object = a3;
    v8->_callback = (id)[a5 copy];
    v8->_cancelMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    objc_initWeak(&location, v8);
    v9 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    object = v8->_object;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __76__AVNotificationSubscription_initWithObject_notificationName_callbackBlock___block_invoke;
    v12[3] = &unk_1E57B1EA8;
    objc_copyWeak(&v13, &location);
    v8->_observerToken = (id)[v9 addObserverForName:a4 object:object queue:0 usingBlock:v12];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v8;
}

- (void)dealloc
{
  [(AVNotificationSubscription *)self cancel];
  if (self->_cancelMutex) {
    FigSimpleMutexDestroy();
  }

  self->_object = 0;
  self->_callback = 0;
  v3.receiver = self;
  v3.super_class = (Class)AVNotificationSubscription;
  [(AVNotificationSubscription *)&v3 dealloc];
}

- (void)cancel
{
  MEMORY[0x199715030](self->_cancelMutex, a2);
  if (self->_observerToken)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self->_observerToken);

    self->_observerToken = 0;
  }
  JUMPOUT(0x199715040);
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p object=%@>", objc_opt_class(), self, self->_object];
}

@end