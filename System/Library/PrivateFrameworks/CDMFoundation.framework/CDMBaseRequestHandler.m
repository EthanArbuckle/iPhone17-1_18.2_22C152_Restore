@interface CDMBaseRequestHandler
- (CDMBaseRequestHandler)init;
- (CDMBaseRequestHandler)initWithId:(id)a3 serviceGraph:(id)a4;
- (NSString)handlerId;
- (id)getError;
- (id)getResult;
- (id)getServiceGraph;
- (unint64_t)getHandlerState;
- (void)setHandlerState:(unint64_t)a3;
@end

@implementation CDMBaseRequestHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlerId, 0);
  objc_storeStrong(&self->_result, 0);
  objc_storeStrong((id *)&self->_serviceGraph, 0);
}

- (NSString)handlerId
{
  return self->_handlerId;
}

- (id)getResult
{
  return [(CDMServiceGraph *)self->_serviceGraph getGraphOutput];
}

- (id)getError
{
  return [(CDMServiceGraph *)self->_serviceGraph error];
}

- (unint64_t)getHandlerState
{
  if (self->_handlerState == 1)
  {
    v3 = [(CDMServiceGraph *)self->_serviceGraph getEndNode];
    if ([v3 isFinished])
    {
      v4 = [(CDMServiceGraph *)self->_serviceGraph getEndNode];
      char v5 = [v4 isCancelled];

      if ((v5 & 1) == 0) {
        self->_handlerState = 2;
      }
    }
    else
    {
    }
  }
  return self->_handlerState;
}

- (void)setHandlerState:(unint64_t)a3
{
  self->_handlerState = a3;
}

- (id)getServiceGraph
{
  return self->_serviceGraph;
}

- (CDMBaseRequestHandler)initWithId:(id)a3 serviceGraph:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDMBaseRequestHandler;
  v9 = [(CDMBaseRequestHandler *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->_handlerState = 0;
    objc_storeStrong((id *)&v9->_serviceGraph, a4);
    objc_storeStrong((id *)&v10->_handlerId, a3);
  }

  return v10;
}

- (CDMBaseRequestHandler)init
{
  return 0;
}

@end