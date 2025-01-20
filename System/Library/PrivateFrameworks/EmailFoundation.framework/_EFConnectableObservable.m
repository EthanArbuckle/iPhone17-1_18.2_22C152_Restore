@interface _EFConnectableObservable
- (_EFConnectableObservable)initWithObservable:(id)a3 subject:(id)a4;
- (id)connect;
- (id)subscribe:(id)a3;
- (void)_disconnect;
@end

@implementation _EFConnectableObservable

- (_EFConnectableObservable)initWithObservable:(id)a3 subject:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_EFConnectableObservable;
  v9 = [(_EFConnectableObservable *)&v13 init];
  if (v9)
  {
    v10 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    lock = v9->_lock;
    v9->_lock = v10;

    objc_storeStrong((id *)&v9->_observable, a3);
    objc_storeStrong((id *)&v9->_subject, a4);
  }

  return v9;
}

- (id)subscribe:(id)a3
{
  v3 = [(EFObservable *)self->_subject subscribe:a3];
  return v3;
}

- (id)connect
{
  [(NSLock *)self->_lock lock];
  cancelable = self->_cancelable;
  v4 = cancelable;
  if (!cancelable)
  {
    v5 = objc_alloc_init(EFCancelationToken);
    v6 = self->_cancelable;
    self->_cancelable = v5;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    id v7 = self->_cancelable;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __35___EFConnectableObservable_connect__block_invoke;
    v11[3] = &unk_1E6121B18;
    objc_copyWeak(&v12, &location);
    [(EFCancelationToken *)v7 addCancelationBlock:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    v4 = self->_cancelable;
  }
  id v8 = v4;
  [(NSLock *)self->_lock unlock];
  if (!cancelable)
  {
    v9 = [(EFObservable *)self->_observable subscribe:self->_subject];
    [(EFCancelationToken *)v8 addCancelable:v9];
  }
  return v8;
}

- (void)_disconnect
{
  [(NSLock *)self->_lock lock];
  cancelable = self->_cancelable;
  self->_cancelable = 0;
  v4 = cancelable;

  [(NSLock *)self->_lock unlock];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelable, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_observable, 0);
}

@end