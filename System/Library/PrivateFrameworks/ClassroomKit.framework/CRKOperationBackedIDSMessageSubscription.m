@interface CRKOperationBackedIDSMessageSubscription
- (CATRemoteTaskOperation)listenOperation;
- (CRKOperationBackedIDSMessageSubscription)initWithListenOperation:(id)a3 handler:(id)a4;
- (id)handler;
- (void)cancel;
- (void)dealloc;
- (void)setHandler:(id)a3;
- (void)taskOperation:(id)a3 didPostNotificationWithName:(id)a4 userInfo:(id)a5;
@end

@implementation CRKOperationBackedIDSMessageSubscription

- (void)dealloc
{
  [(CRKOperationBackedIDSMessageSubscription *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)CRKOperationBackedIDSMessageSubscription;
  [(CRKOperationBackedIDSMessageSubscription *)&v3 dealloc];
}

- (CRKOperationBackedIDSMessageSubscription)initWithListenOperation:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRKOperationBackedIDSMessageSubscription;
  v9 = [(CRKOperationBackedIDSMessageSubscription *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_listenOperation, a3);
    uint64_t v11 = MEMORY[0x22A620AF0](v8);
    id handler = v10->_handler;
    v10->_id handler = (id)v11;
  }
  return v10;
}

- (void)taskOperation:(id)a3 didPostNotificationWithName:(id)a4 userInfo:(id)a5
{
  id v7 = a5;
  id v14 = v7;
  if (!v7)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"CRKOperationBackedIDSMessageSubscription.m" lineNumber:41 description:@"Expected a hydrated notification user-info"];

    id v7 = 0;
  }
  id v8 = +[CRKIDSMessageNotificationInfo instanceWithDictionary:v7];
  v9 = [(CRKOperationBackedIDSMessageSubscription *)self handler];
  v10 = [v8 message];
  uint64_t v11 = [v8 senderAppleID];
  v12 = [v8 senderAddress];
  ((void (**)(void, void *, void *, void *))v9)[2](v9, v10, v11, v12);
}

- (void)cancel
{
  objc_super v3 = [(CRKOperationBackedIDSMessageSubscription *)self handler];

  if (v3)
  {
    v4 = [(CRKOperationBackedIDSMessageSubscription *)self listenOperation];
    [v4 cancel];

    [(CRKOperationBackedIDSMessageSubscription *)self setHandler:0];
  }
}

- (CATRemoteTaskOperation)listenOperation
{
  return self->_listenOperation;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);

  objc_storeStrong((id *)&self->_listenOperation, 0);
}

@end