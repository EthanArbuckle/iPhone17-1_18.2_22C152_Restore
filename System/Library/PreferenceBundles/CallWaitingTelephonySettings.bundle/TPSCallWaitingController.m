@interface TPSCallWaitingController
- (CTXPCServiceSubscriptionContext)subscriptionContext;
- (TPSCallWaitingController)init;
- (TPSCallWaitingController)initWithSubscriptionContext:(id)a3;
- (TPSCallWaitingControllerDelegate)delegate;
- (TPSCallWaitingRequestController)requestController;
- (int64_t)state;
- (void)requestController:(id)a3 didReceiveResponse:(id)a4;
- (void)requestStateChange:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation TPSCallWaitingController

- (TPSCallWaitingController)init
{
  return 0;
}

- (TPSCallWaitingController)initWithSubscriptionContext:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TPSCallWaitingController;
  v6 = [(TPSCallWaitingController *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_subscriptionContext, a3);
    v7->_state = 0;
    v8 = (TPSCallWaitingRequestController *)objc_alloc_init((Class)TPSCallWaitingRequestController);
    requestController = v7->_requestController;
    v7->_requestController = v8;

    [(TPSCallWaitingRequestController *)v7->_requestController addDelegate:v7 queue:&_dispatch_main_q];
    id v10 = [objc_alloc((Class)TPSCallWaitingRequest) initWithSubscriptionContext:v5];
    [(TPSCallWaitingRequestController *)v7->_requestController addRequest:v10];
  }
  return v7;
}

- (void)requestStateChange:(int64_t)a3
{
  if ([(TPSCallWaitingController *)self state] != a3)
  {
    [(TPSCallWaitingController *)self setState:0];
    id v5 = objc_alloc((Class)TPSSetCallWaitingRequest);
    v6 = [(TPSCallWaitingController *)self subscriptionContext];
    id v7 = [v5 initWithSubscriptionContext:v6 enabled:a3 == 2];

    v8 = TPSCallWaitingLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v7;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Sending call waiting request %@.", (uint8_t *)&v10, 0xCu);
    }

    v9 = [(TPSCallWaitingController *)self requestController];
    [v9 addRequest:v7];
  }
}

- (void)requestController:(id)a3 didReceiveResponse:(id)a4
{
  id v5 = a4;
  v6 = TPSCallWaitingLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v13 = 138412546;
    *(void *)&v13[4] = objc_opt_class();
    *(_WORD *)&v13[12] = 2112;
    *(void *)&v13[14] = v5;
    id v7 = *(id *)&v13[4];
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%@ received response %@.", v13, 0x16u);
  }
  if ([v5 enabled]) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }
  -[TPSCallWaitingController setState:](self, "setState:", v8, *(_OWORD *)v13, *(void *)&v13[16]);
  v9 = [(TPSCallWaitingController *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = [(TPSCallWaitingController *)self delegate];
    objc_super v12 = [v5 error];
    [v11 callWaitingController:self didChangeState:v8 error:v12];
  }
}

- (TPSCallWaitingControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TPSCallWaitingControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (TPSCallWaitingRequestController)requestController
{
  return self->_requestController;
}

- (CTXPCServiceSubscriptionContext)subscriptionContext
{
  return self->_subscriptionContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
  objc_storeStrong((id *)&self->_requestController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end