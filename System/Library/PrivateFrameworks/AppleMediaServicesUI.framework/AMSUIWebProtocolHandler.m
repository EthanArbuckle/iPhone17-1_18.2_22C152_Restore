@interface AMSUIWebProtocolHandler
- (AMSUIWebProtocolDelegate)delegate;
- (void)reconfigureNewRequest:(id)a3 originalTask:(id)a4 redirect:(BOOL)a5 error:(id *)a6;
- (void)setDelegate:(id)a3;
@end

@implementation AMSUIWebProtocolHandler

- (void)reconfigureNewRequest:(id)a3 originalTask:(id)a4 redirect:(BOOL)a5 error:(id *)a6
{
  uint64_t v7 = a5;
  id v10 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AMSUIWebProtocolHandler;
  [(AMSURLProtocolHandler *)&v13 reconfigureNewRequest:v10 originalTask:a4 redirect:v7 error:a6];
  v11 = [(AMSUIWebProtocolHandler *)self delegate];
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if (v7)
  {
    v12 = [(AMSUIWebProtocolHandler *)self delegate];
    [v12 protocolHandler:self didEncodeNetworkRequest:v10];
  }
}

- (AMSUIWebProtocolDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AMSUIWebProtocolDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end