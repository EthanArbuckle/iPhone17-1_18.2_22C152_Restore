@interface IDSDaemonRequestContext
- (IDSDaemonRequestContext)initWithResponseHandler:(id)a3 timeoutBlock:(id)a4 systemTimer:(id)a5;
- (id)responseHandler;
- (id)systemTimer;
- (id)timeoutBlock;
- (void)dealloc;
- (void)killSystemTimer;
@end

@implementation IDSDaemonRequestContext

- (void)dealloc
{
  [(IMTimer *)self->_systemTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)IDSDaemonRequestContext;
  [(IDSDaemonRequestContext *)&v3 dealloc];
}

- (IDSDaemonRequestContext)initWithResponseHandler:(id)a3 timeoutBlock:(id)a4 systemTimer:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)IDSDaemonRequestContext;
  v12 = [(IDSDaemonRequestContext *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_responseHandler, a3);
    uint64_t v14 = [v10 copy];
    id timeoutBlock = v13->_timeoutBlock;
    v13->_id timeoutBlock = (id)v14;

    objc_storeStrong((id *)&v13->_systemTimer, a5);
  }

  return v13;
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (id)timeoutBlock
{
  v2 = (void *)MEMORY[0x192FE03B0](self->_timeoutBlock, a2);

  return v2;
}

- (id)systemTimer
{
  return self->_systemTimer;
}

- (void)killSystemTimer
{
  [(IMTimer *)self->_systemTimer invalidate];
  systemTimer = self->_systemTimer;
  self->_systemTimer = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemTimer, 0);
  objc_storeStrong(&self->_timeoutBlock, 0);

  objc_storeStrong((id *)&self->_responseHandler, 0);
}

@end