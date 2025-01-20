@interface DYTransportSource
- (BOOL)cancelled;
- (DYTransport)transport;
- (DYTransportSource)init;
- (id)_initWithQueue:(id)a3 transport:(id)a4;
- (id)cancellationHandler;
- (id)messageHandler;
- (id)registrationHandler;
- (void)_callCancellationHandler;
- (void)_callRegistrationHandler;
- (void)_cancel;
- (void)_dispatch:(id)a3;
- (void)_register;
- (void)cancel;
- (void)dealloc;
- (void)resume;
- (void)setCancellationHandler:(id)a3;
- (void)setMessageHandler:(id)a3;
- (void)setRegistrationHandler:(id)a3;
- (void)suspend;
@end

@implementation DYTransportSource

- (DYTransportSource)init
{
  return 0;
}

- (id)_initWithQueue:(id)a3 transport:(id)a4
{
  if (!a3) {
    dy_abort("queue cannot be NULL", a2, 0, a4);
  }
  if (!a4) {
    dy_abort("transport cannot be nil", a2);
  }
  v14.receiver = self;
  v14.super_class = (Class)DYTransportSource;
  v6 = [(DYTransportSource *)&v14 init];
  if (v6)
  {
    v6->_transport = (DYTransport *)a4;
    v7 = (const char *)[(id)objc_msgSend(NSString stringWithFormat:@"gputools.%@.%p.%@", objc_msgSend(NSString, "stringWithUTF8String:", object_getClassName(v6)), v6, @"manager", "UTF8String"];
    v8 = dispatch_queue_create_with_target_V2(v7, 0, (dispatch_queue_t)a3);
    v6->_queue = (OS_dispatch_queue *)v8;
    dispatch_suspend(v8);
    v9 = (const char *)[(id)objc_msgSend(NSString stringWithFormat:@"gputools.%@.%p.%@", objc_msgSend(NSString, "stringWithUTF8String:", object_getClassName(v6)), v6, @"message", "UTF8String"];
    v10 = dispatch_queue_create_with_target_V2(v9, 0, (dispatch_queue_t)a3);
    v6->_mqueue = (OS_dispatch_queue *)v10;
    dispatch_suspend(v10);
    queue = v6->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__DYTransportSource__initWithQueue_transport___block_invoke;
    block[3] = &unk_265335F98;
    block[4] = v6;
    dispatch_async(queue, block);
  }
  return v6;
}

void __46__DYTransportSource__initWithQueue_transport___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _register];
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 40);

  dispatch_resume(v2);
}

- (void)dealloc
{
  mqueue = self->_mqueue;
  if (mqueue)
  {
    dispatch_release(mqueue);
    self->_mqueue = 0;
  }
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)DYTransportSource;
  [(DYTransportSource *)&v5 dealloc];
}

- (void)resume
{
}

- (void)suspend
{
}

- (void)cancel
{
  if ((atomic_fetch_or(&self->_state, 1u) & 1) == 0)
  {
    dispatch_suspend((dispatch_object_t)self->_mqueue);
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __27__DYTransportSource_cancel__block_invoke;
    block[3] = &unk_265335F98;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

void __27__DYTransportSource_cancel__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancel];
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 40);

  dispatch_resume(v2);
}

- (BOOL)cancelled
{
  __dmb(0xBu);
  char v2 = atomic_load((unsigned int *)&self->_state);
  return v2 & 1;
}

- (id)messageHandler
{
  return self->_messageHandler;
}

- (void)setMessageHandler:(id)a3
{
  uint64_t v4 = [a3 copy];
  dispatch_suspend((dispatch_object_t)self->_mqueue);
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__DYTransportSource_setMessageHandler___block_invoke;
  v6[3] = &unk_2653366F8;
  v6[4] = self;
  v6[5] = v4;
  dispatch_async(queue, v6);
}

void __39__DYTransportSource_setMessageHandler___block_invoke(uint64_t a1)
{
  char v1 = atomic_load((unsigned int *)(*(void *)(a1 + 32) + 56));
  if ((v1 & 1) == 0)
  {

    *(void *)(*(void *)(a1 + 32) + 8) = *(void *)(a1 + 40);
    v3 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    dispatch_resume(v3);
  }
}

- (id)cancellationHandler
{
  return self->_cancellationHandler;
}

- (void)setCancellationHandler:(id)a3
{
  uint64_t v4 = [a3 copy];
  dispatch_suspend((dispatch_object_t)self->_mqueue);
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__DYTransportSource_setCancellationHandler___block_invoke;
  v6[3] = &unk_2653366F8;
  v6[4] = self;
  v6[5] = v4;
  dispatch_async(queue, v6);
}

void __44__DYTransportSource_setCancellationHandler___block_invoke(uint64_t a1)
{
  char v1 = atomic_load((unsigned int *)(*(void *)(a1 + 32) + 56));
  if ((v1 & 1) == 0)
  {

    *(void *)(*(void *)(a1 + 32) + 16) = *(void *)(a1 + 40);
    v3 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    dispatch_resume(v3);
  }
}

- (id)registrationHandler
{
  return self->_registrationHandler;
}

- (void)setRegistrationHandler:(id)a3
{
  uint64_t v4 = [a3 copy];
  dispatch_suspend((dispatch_object_t)self->_mqueue);
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__DYTransportSource_setRegistrationHandler___block_invoke;
  v6[3] = &unk_2653366F8;
  v6[4] = self;
  v6[5] = v4;
  dispatch_async(queue, v6);
}

void __44__DYTransportSource_setRegistrationHandler___block_invoke(uint64_t a1)
{
  char v1 = atomic_load((unsigned int *)(*(void *)(a1 + 32) + 56));
  if ((v1 & 1) == 0)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (!*(void *)(v3 + 24))
    {
      char v4 = atomic_load((unsigned int *)(v3 + 56));
      uint64_t v3 = *(void *)(a1 + 32);
      if ((v4 & 2) != 0)
      {
        objc_super v5 = *(NSObject **)(v3 + 40);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __44__DYTransportSource_setRegistrationHandler___block_invoke_2;
        block[3] = &unk_265335F98;
        block[4] = v3;
        dispatch_async(v5, block);
        uint64_t v3 = *(void *)(a1 + 32);
      }
    }

    *(void *)(*(void *)(a1 + 32) + 24) = *(void *)(a1 + 40);
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 40));
  }
}

uint64_t __44__DYTransportSource_setRegistrationHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callRegistrationHandler];
}

- (void)_callRegistrationHandler
{
  char v2 = atomic_load((unsigned int *)&self->_state);
  if ((v2 & 1) == 0)
  {
    registrationHandler = (void (**)(id, SEL))self->_registrationHandler;
    if (registrationHandler)
    {
      registrationHandler[2](registrationHandler, a2);

      self->_registrationHandler = 0;
    }
  }
}

- (void)_register
{
  char v2 = atomic_load((unsigned int *)&self->_state);
  if ((v2 & 1) == 0)
  {
    if ([(DYTransport *)self->_transport _activateSource:self])
    {
      atomic_fetch_or(&self->_state, 2u);
      mqueue = self->_mqueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __30__DYTransportSource__register__block_invoke;
      block[3] = &unk_265335F98;
      block[4] = self;
      dispatch_async(mqueue, block);
    }
    else
    {
      [(DYTransportSource *)self cancel];
    }
  }
}

uint64_t __30__DYTransportSource__register__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callRegistrationHandler];
}

- (void)_callCancellationHandler
{
  cancellationHandler = (void (**)(id, SEL))self->_cancellationHandler;
  if (cancellationHandler)
  {
    cancellationHandler[2](cancellationHandler, a2);

    self->_cancellationHandler = 0;
  }

  self->_transport = 0;
}

- (void)_cancel
{
  [(DYTransport *)self->_transport _cancelSource:self];

  self->_messageHandler = 0;
  self->_registrationHandler = 0;
  mqueue = self->_mqueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__DYTransportSource__cancel__block_invoke;
  block[3] = &unk_265335F98;
  block[4] = self;
  dispatch_async(mqueue, block);
}

uint64_t __28__DYTransportSource__cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callCancellationHandler];
}

- (void)_dispatch:(id)a3
{
  mqueue = self->_mqueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __31__DYTransportSource__dispatch___block_invoke;
  v4[3] = &unk_265335F20;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(mqueue, v4);
}

uint64_t __31__DYTransportSource__dispatch___block_invoke(uint64_t result)
{
  char v1 = atomic_load((unsigned int *)(*(void *)(result + 32) + 56));
  if ((v1 & 1) == 0)
  {
    uint64_t v2 = *(void *)(*(void *)(result + 32) + 8);
    if (v2) {
      return (*(uint64_t (**)(void, void))(v2 + 16))(*(void *)(*(void *)(result + 32) + 8), *(void *)(result + 40));
    }
  }
  return result;
}

- (DYTransport)transport
{
  return self->_transport;
}

@end