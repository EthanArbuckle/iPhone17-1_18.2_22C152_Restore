@interface COMTActionRequestHandler
- (COMTActionRequestHandler)initWithType:(id)a3 actions:(id)a4 delegate:(id)a5 dispatchQueue:(id)a6;
- (COMTActionRequestHandlerDelegate)delegate;
- (NSSet)actions;
- (NSString)targetType;
- (OS_dispatch_queue)delegateQueue;
- (id)description;
@end

@implementation COMTActionRequestHandler

- (COMTActionRequestHandler)initWithType:(id)a3 actions:(id)a4 delegate:(id)a5 dispatchQueue:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)COMTActionRequestHandler;
  v15 = [(COMTActionRequestHandler *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_targetType, a3);
    objc_storeStrong((id *)&v16->_actions, a4);
    objc_storeWeak((id *)&v16->_delegate, v13);
    objc_storeStrong((id *)&v16->_delegateQueue, a6);
  }

  return v16;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(COMTActionRequestHandler *)self delegate];
  v7 = [v3 stringWithFormat:@"<%@: %p, delegate = %p>", v5, self, v6];

  return v7;
}

- (NSString)targetType
{
  return self->_targetType;
}

- (NSSet)actions
{
  return self->_actions;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (COMTActionRequestHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (COMTActionRequestHandlerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_targetType, 0);
}

@end