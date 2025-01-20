@interface IKServiceRequest
- (IKAppContext)appContext;
- (IKServiceContext)serviceContext;
- (IKServiceRequest)initWithAppContext:(id)a3 serviceContext:(id)a4;
- (IKServiceRequestDelegate)delegate;
- (void)_completedWithStatus:(int64_t)a3 errorDictionary:(id)a4;
- (void)cancel;
- (void)send;
- (void)setDelegate:(id)a3;
@end

@implementation IKServiceRequest

- (IKServiceRequest)initWithAppContext:(id)a3 serviceContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IKServiceRequest;
  v8 = [(IKServiceRequest *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_appContext, v6);
    objc_storeStrong((id *)&v9->_serviceContext, a4);
  }

  return v9;
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  LOBYTE(p_delegate) = objc_opt_respondsToSelector();

  self->_srDelegateFlags.hasDidCompleteWithStatus = p_delegate & 1;
}

- (void)send
{
  if (!self->_state)
  {
    self->_state = 1;
    [(IKServiceRequest *)self onSend];
  }
}

- (void)cancel
{
  self->_state = 2;
  [(IKServiceRequest *)self onCancel];
  id v3 = [(IKServiceRequest *)self delegate];
  [v3 serviceRequest:self didCompleteWithStatus:2 errorDictionary:0];
}

- (void)_completedWithStatus:(int64_t)a3 errorDictionary:(id)a4
{
  id v6 = a4;
  if (self->_state == 1)
  {
    self->_state = 3;
    if (self->_srDelegateFlags.hasDidCompleteWithStatus)
    {
      id v8 = v6;
      id v7 = [(IKServiceRequest *)self delegate];
      [v7 serviceRequest:self didCompleteWithStatus:a3 errorDictionary:v8];

      id v6 = v8;
    }
  }
}

- (IKAppContext)appContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  return (IKAppContext *)WeakRetained;
}

- (IKServiceContext)serviceContext
{
  return self->_serviceContext;
}

- (IKServiceRequestDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (IKServiceRequestDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serviceContext, 0);
  objc_destroyWeak((id *)&self->_appContext);
}

@end