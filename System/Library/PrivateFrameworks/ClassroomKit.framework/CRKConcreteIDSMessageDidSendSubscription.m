@interface CRKConcreteIDSMessageDidSendSubscription
- (BOOL)isResumed;
- (CRKConcreteIDSMessageDidSendSubscription)initWithHandler:(id)a3;
- (CRKConcreteIDSMessageDidSendSubscriptionDelegate)delegate;
- (id)handler;
- (void)cancel;
- (void)receiveMessageIdentifier:(id)a3 didSucceed:(BOOL)a4 error:(id)a5;
- (void)resume;
- (void)setDelegate:(id)a3;
- (void)setHandler:(id)a3;
- (void)setResumed:(BOOL)a3;
@end

@implementation CRKConcreteIDSMessageDidSendSubscription

- (CRKConcreteIDSMessageDidSendSubscription)initWithHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKConcreteIDSMessageDidSendSubscription;
  v5 = [(CRKConcreteIDSMessageDidSendSubscription *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x22A620AF0](v4);
    id handler = v5->_handler;
    v5->_id handler = (id)v6;
  }
  return v5;
}

- (void)receiveMessageIdentifier:(id)a3 didSucceed:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v14 = a3;
  id v9 = a5;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    v13 = NSStringFromSelector(a2);
    [v12 handleFailureInMethod:a2, self, @"CRKConcreteIDSMessageDidSendSubscription.m", 37, @"%@ must be called from the main thread", v13 object file lineNumber description];
  }
  uint64_t v10 = [(CRKConcreteIDSMessageDidSendSubscription *)self handler];
  v11 = (void *)v10;
  if (v10) {
    (*(void (**)(uint64_t, id, BOOL, id))(v10 + 16))(v10, v14, v6, v9);
  }
}

- (void)cancel
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v5 = [MEMORY[0x263F08690] currentHandler];
    BOOL v6 = NSStringFromSelector(a2);
    [v5 handleFailureInMethod:a2, self, @"CRKConcreteIDSMessageDidSendSubscription.m", 50, @"%@ must be called from the main thread", v6 object file lineNumber description];
  }
  if ([(CRKConcreteIDSMessageDidSendSubscription *)self isResumed])
  {
    id v4 = [(CRKConcreteIDSMessageDidSendSubscription *)self handler];

    if (v4)
    {
      [(CRKConcreteIDSMessageDidSendSubscription *)self setHandler:0];
      id v7 = [(CRKConcreteIDSMessageDidSendSubscription *)self delegate];
      [v7 didSendSubscriptionDidCancel:self];
    }
  }
}

- (void)resume
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v5 = [MEMORY[0x263F08690] currentHandler];
    BOOL v6 = NSStringFromSelector(a2);
    [v5 handleFailureInMethod:a2, self, @"CRKConcreteIDSMessageDidSendSubscription.m", 63, @"%@ must be called from the main thread", v6 object file lineNumber description];
  }
  if (![(CRKConcreteIDSMessageDidSendSubscription *)self isResumed])
  {
    id v4 = [(CRKConcreteIDSMessageDidSendSubscription *)self handler];

    if (v4)
    {
      [(CRKConcreteIDSMessageDidSendSubscription *)self setResumed:1];
      id v7 = [(CRKConcreteIDSMessageDidSendSubscription *)self delegate];
      [v7 didSendSubscriptionDidResume:self];
    }
  }
}

- (CRKConcreteIDSMessageDidSendSubscriptionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CRKConcreteIDSMessageDidSendSubscriptionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (BOOL)isResumed
{
  return self->_resumed;
}

- (void)setResumed:(BOOL)a3
{
  self->_resumed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end