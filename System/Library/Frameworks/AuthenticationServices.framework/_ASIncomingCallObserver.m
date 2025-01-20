@interface _ASIncomingCallObserver
+ (_ASIncomingCallObserver)callObserverWithBlock:(id)a3;
- (id)_initWithBlock:(id)a3;
- (void)callObserver:(id)a3 callChanged:(id)a4;
@end

@implementation _ASIncomingCallObserver

+ (_ASIncomingCallObserver)callObserverWithBlock:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithBlock:v4];

  return (_ASIncomingCallObserver *)v5;
}

- (id)_initWithBlock:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_ASIncomingCallObserver;
  v5 = [(_ASIncomingCallObserver *)&v12 init];
  if (v5)
  {
    v6 = (CXCallObserver *)objc_alloc_init(MEMORY[0x263EFC8E8]);
    callObserver = v5->_callObserver;
    v5->_callObserver = v6;

    [(CXCallObserver *)v5->_callObserver setDelegate:v5 queue:0];
    uint64_t v8 = MEMORY[0x21D484070](v4);
    id incomingCallHandler = v5->_incomingCallHandler;
    v5->_id incomingCallHandler = (id)v8;

    v10 = v5;
  }

  return v5;
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  if (objc_msgSend(a4, "hasConnected", a3))
  {
    v5 = (void (*)(void))*((void *)self->_incomingCallHandler + 2);
    v5();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_incomingCallHandler, 0);

  objc_storeStrong((id *)&self->_callObserver, 0);
}

@end