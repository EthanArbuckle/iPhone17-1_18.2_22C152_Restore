@interface IUISessionChangeContext
- (IUISessionChange)sessionChange;
- (IUISessionChangeContext)initWithService:(id)a3 session:(id)a4 sessionChange:(id)a5 completion:(id)a6;
- (RTIInputSystemService)service;
- (RTIInputSystemServiceSession)session;
- (id)completion;
- (id)description;
@end

@implementation IUISessionChangeContext

- (IUISessionChangeContext)initWithService:(id)a3 session:(id)a4 sessionChange:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)IUISessionChangeContext;
  v14 = [(IUISessionChangeContext *)&v21 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_service, v10);
    objc_storeWeak((id *)&v15->_session, v11);
    v16 = (IUISessionChange *)[v12 copy];
    sessionChange = v15->_sessionChange;
    v15->_sessionChange = v16;

    id v18 = [v13 copy];
    id completion = v15->_completion;
    v15->_id completion = v18;
  }
  return v15;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  id v6 = objc_loadWeakRetained((id *)&self->_session);
  sessionChange = self->_sessionChange;
  id v8 = objc_retainBlock(self->_completion);
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; service:%@; session:%@; sessionChange:%@ completion:%@>",
    v4,
    self,
    WeakRetained,
    v6,
    sessionChange,
  v9 = v8);

  return v9;
}

- (RTIInputSystemService)service
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);

  return (RTIInputSystemService *)WeakRetained;
}

- (RTIInputSystemServiceSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);

  return (RTIInputSystemServiceSession *)WeakRetained;
}

- (IUISessionChange)sessionChange
{
  return self->_sessionChange;
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_sessionChange, 0);
  objc_destroyWeak((id *)&self->_session);

  objc_destroyWeak((id *)&self->_service);
}

@end