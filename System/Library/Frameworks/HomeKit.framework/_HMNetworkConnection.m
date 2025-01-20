@interface _HMNetworkConnection
- (OS_dispatch_queue)queue;
- (OS_nw_connection)nwConnection;
- (_HMNetworkConnection)initWithEndpoint:(id)a3 parameters:(id)a4;
- (void)cancel;
- (void)receiveMessageWithCompletion:(id)a3;
- (void)sendData:(id)a3 context:(id)a4 isComplete:(BOOL)a5 completion:(id)a6;
- (void)setPathChangedHandler:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStateChangedHandler:(id)a3;
- (void)setViabilityChangedHandler:(id)a3;
- (void)start;
@end

@implementation _HMNetworkConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_nwConnection, 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_nw_connection)nwConnection
{
  return self->_nwConnection;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
  v5 = a3;
  v6 = [(_HMNetworkConnection *)self nwConnection];
  nw_connection_set_queue(v6, v5);
}

- (void)setPathChangedHandler:(id)a3
{
  id v4 = a3;
  v5 = [(_HMNetworkConnection *)self nwConnection];
  v6 = v5;
  if (v4)
  {
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __46___HMNetworkConnection_setPathChangedHandler___block_invoke;
    handler[3] = &unk_1E59435A0;
    id v8 = v4;
    nw_connection_set_path_changed_handler(v6, handler);
  }
  else
  {
    nw_connection_set_path_changed_handler(v5, 0);
  }
}

- (void)setViabilityChangedHandler:(id)a3
{
  id v4 = a3;
  v5 = [(_HMNetworkConnection *)self nwConnection];
  nw_connection_set_viability_changed_handler(v5, v4);
}

- (void)setStateChangedHandler:(id)a3
{
  id v4 = a3;
  v5 = [(_HMNetworkConnection *)self nwConnection];
  nw_connection_set_state_changed_handler(v5, v4);
}

- (void)receiveMessageWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(_HMNetworkConnection *)self nwConnection];
  nw_connection_receive_message(v5, v4);
}

- (void)sendData:(id)a3 context:(id)a4 isComplete:(BOOL)a5 completion:(id)a6
{
  id v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = [(_HMNetworkConnection *)self nwConnection];
  nw_connection_send(v13, v12, v11, a5, v10);
}

- (void)cancel
{
  v2 = [(_HMNetworkConnection *)self nwConnection];
  nw_connection_cancel(v2);
}

- (void)start
{
  v2 = [(_HMNetworkConnection *)self nwConnection];
  nw_connection_start(v2);
}

- (_HMNetworkConnection)initWithEndpoint:(id)a3 parameters:(id)a4
{
  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_HMNetworkConnection;
  id v8 = [(_HMNetworkConnection *)&v12 init];
  if (v8)
  {
    nw_connection_t v9 = nw_connection_create(v6, v7);
    nwConnection = v8->_nwConnection;
    v8->_nwConnection = (OS_nw_connection *)v9;
  }
  return v8;
}

@end