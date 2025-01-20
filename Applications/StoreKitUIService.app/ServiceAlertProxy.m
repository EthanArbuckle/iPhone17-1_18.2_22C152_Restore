@interface ServiceAlertProxy
- (OS_xpc_object)options;
- (OS_xpc_object)receiverEndpoint;
- (SSXPCConnection)responseConnection;
- (ServiceAlertProxy)init;
- (ServiceAlertProxyDelegate)delegate;
- (void)_closeReceiverConnection;
- (void)_disconnect;
- (void)_handleMessage:(id)a3 connection:(id)a4;
- (void)dealloc;
- (void)finishWithResponse:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOptions:(id)a3;
- (void)setResponseConnection:(id)a3;
@end

@implementation ServiceAlertProxy

- (ServiceAlertProxy)init
{
  v12.receiver = self;
  v12.super_class = (Class)ServiceAlertProxy;
  v2 = [(ServiceAlertProxy *)&v12 init];
  if (v2)
  {
    v3 = (SSXPCConnection *)objc_alloc_init((Class)SSXPCConnection);
    receiverConnection = v2->_receiverConnection;
    v2->_receiverConnection = v3;

    v5 = (OS_xpc_object *)[(SSXPCConnection *)v2->_receiverConnection createXPCEndpoint];
    receiverEndpoint = v2->_receiverEndpoint;
    v2->_receiverEndpoint = v5;

    objc_initWeak(&location, v2);
    v7 = v2->_receiverConnection;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000ED08;
    v9[3] = &unk_10004D378;
    objc_copyWeak(&v10, &location);
    [(SSXPCConnection *)v7 setMessageBlock:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  [(SSXPCConnection *)self->_receiverConnection setMessageBlock:0];
  [(SSXPCConnection *)self->_responseConnection setDisconnectBlock:0];
  v3.receiver = self;
  v3.super_class = (Class)ServiceAlertProxy;
  [(ServiceAlertProxy *)&v3 dealloc];
}

- (void)finishWithResponse:(id)a3
{
  responseConnection = self->_responseConnection;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000EF18;
  v4[3] = &unk_10004D3A0;
  v4[4] = self;
  [(SSXPCConnection *)responseConnection sendMessage:a3 withReply:v4];
}

- (void)setResponseConnection:(id)a3
{
  v5 = (SSXPCConnection *)a3;
  responseConnection = self->_responseConnection;
  if (responseConnection != v5)
  {
    [(SSXPCConnection *)responseConnection setDisconnectBlock:0];
    objc_storeStrong((id *)&self->_responseConnection, a3);
    objc_initWeak(&location, self);
    v7 = self->_responseConnection;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000F09C;
    v8[3] = &unk_10004CDC8;
    objc_copyWeak(&v9, &location);
    [(SSXPCConnection *)v7 setDisconnectBlock:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_closeReceiverConnection
{
  [(SSXPCConnection *)self->_receiverConnection setDisconnectBlock:0];
  [(SSXPCConnection *)self->_receiverConnection setMessageBlock:0];
  receiverConnection = self->_receiverConnection;
  self->_receiverConnection = 0;

  receiverEndpoint = self->_receiverEndpoint;
  self->_receiverEndpoint = 0;
}

- (void)_disconnect
{
  [(ServiceAlertProxy *)self _closeReceiverConnection];
  id v3 = [(ServiceAlertProxy *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 alertProxyDidCancel:self];
  }
}

- (void)_handleMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  v5 = [(ServiceAlertProxy *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 alertProxy:self didReceiveMessage:v6];
  }
}

- (ServiceAlertProxyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ServiceAlertProxyDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_xpc_object)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (OS_xpc_object)receiverEndpoint
{
  return self->_receiverEndpoint;
}

- (SSXPCConnection)responseConnection
{
  return self->_responseConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseConnection, 0);
  objc_storeStrong((id *)&self->_receiverEndpoint, 0);
  objc_storeStrong((id *)&self->_receiverConnection, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end