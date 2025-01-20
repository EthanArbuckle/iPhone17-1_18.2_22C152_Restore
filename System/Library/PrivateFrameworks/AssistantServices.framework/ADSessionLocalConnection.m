@interface ADSessionLocalConnection
- (ADSessionLocalConnectionDelegate)delegate;
- (id)initOnQueue:(id)a3;
- (void)cancelWithCompletion:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)start;
@end

@implementation ADSessionLocalConnection

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setDelegate:(id)a3
{
}

- (ADSessionLocalConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ADSessionLocalConnectionDelegate *)WeakRetained;
}

- (void)cancelWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)start
{
  id v5 = [objc_alloc((Class)SiriCoreConnectionType) initWithTechnology:3005];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained siriConnection:self willStartWithConnectionType:v5];

  id v4 = objc_loadWeakRetained((id *)&self->_delegate);
  [v4 siriConnection:self didOpenWithConnectionType:v5 delay:0.0];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)ADSessionLocalConnection;
  [(ADSessionLocalConnection *)&v2 dealloc];
}

- (id)initOnQueue:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ADSessionLocalConnection;
  v6 = [(ADSessionLocalConnection *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = v7;
  }

  return v7;
}

@end