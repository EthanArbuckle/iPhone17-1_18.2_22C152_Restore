@interface CRKConcreteIDSMessageDidReceiveSubscription
- (BOOL)isResumed;
- (CRKConcreteIDSMessageDidReceiveSubscription)initWithHandler:(id)a3;
- (CRKConcreteIDSMessageDidReceiveSubscriptionDelegate)delegate;
- (id)handler;
- (void)cancel;
- (void)receiveMessage:(id)a3 senderAppleID:(id)a4 senderAddress:(id)a5;
- (void)resume;
- (void)setDelegate:(id)a3;
- (void)setHandler:(id)a3;
- (void)setResumed:(BOOL)a3;
@end

@implementation CRKConcreteIDSMessageDidReceiveSubscription

- (CRKConcreteIDSMessageDidReceiveSubscription)initWithHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKConcreteIDSMessageDidReceiveSubscription;
  v5 = [(CRKConcreteIDSMessageDidReceiveSubscription *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x22A620AF0](v4);
    id handler = v5->_handler;
    v5->_id handler = (id)v6;
  }
  return v5;
}

- (void)receiveMessage:(id)a3 senderAppleID:(id)a4 senderAddress:(id)a5
{
  id v15 = a3;
  id v9 = a4;
  id v10 = a5;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    v14 = NSStringFromSelector(a2);
    [v13 handleFailureInMethod:a2, self, @"CRKConcreteIDSMessageDidReceiveSubscription.m", 37, @"%@ must be called from the main thread", v14 object file lineNumber description];
  }
  uint64_t v11 = [(CRKConcreteIDSMessageDidReceiveSubscription *)self handler];
  v12 = (void *)v11;
  if (v11) {
    (*(void (**)(uint64_t, id, id, id))(v11 + 16))(v11, v15, v9, v10);
  }
}

- (void)cancel
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v5 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v6 = NSStringFromSelector(a2);
    [v5 handleFailureInMethod:a2, self, @"CRKConcreteIDSMessageDidReceiveSubscription.m", 50, @"%@ must be called from the main thread", v6 object file lineNumber description];
  }
  if ([(CRKConcreteIDSMessageDidReceiveSubscription *)self isResumed])
  {
    id v4 = [(CRKConcreteIDSMessageDidReceiveSubscription *)self handler];

    if (v4)
    {
      [(CRKConcreteIDSMessageDidReceiveSubscription *)self setHandler:0];
      id v7 = [(CRKConcreteIDSMessageDidReceiveSubscription *)self delegate];
      [v7 didReceiveSubscriptionDidCancel:self];
    }
  }
}

- (void)resume
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v5 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v6 = NSStringFromSelector(a2);
    [v5 handleFailureInMethod:a2, self, @"CRKConcreteIDSMessageDidReceiveSubscription.m", 63, @"%@ must be called from the main thread", v6 object file lineNumber description];
  }
  if (![(CRKConcreteIDSMessageDidReceiveSubscription *)self isResumed])
  {
    id v4 = [(CRKConcreteIDSMessageDidReceiveSubscription *)self handler];

    if (v4)
    {
      [(CRKConcreteIDSMessageDidReceiveSubscription *)self setResumed:1];
      id v7 = [(CRKConcreteIDSMessageDidReceiveSubscription *)self delegate];
      [v7 didReceiveSubscriptionDidResume:self];
    }
  }
}

- (CRKConcreteIDSMessageDidReceiveSubscriptionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CRKConcreteIDSMessageDidReceiveSubscriptionDelegate *)WeakRetained;
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