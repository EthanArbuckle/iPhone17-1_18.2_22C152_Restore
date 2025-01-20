@interface CATIDSServiceTransport
- (CATIDSServiceTransport)initWithConnection:(id)a3;
- (id)name;
- (id)operationToSendMessage:(id)a3;
- (void)connection:(id)a3 receivedData:(id)a4;
- (void)connectionClosed:(id)a3;
- (void)invalidateConnection;
- (void)resumeConnection;
- (void)serviceReceiveQueue;
- (void)suspendConnection;
- (void)tryReportingInvalidation;
@end

@implementation CATIDSServiceTransport

- (CATIDSServiceTransport)initWithConnection:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CATIDSServiceTransport;
  v6 = [(CATTransport *)&v10 init];
  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    mReceiveQueue = v6->mReceiveQueue;
    v6->mReceiveQueue = (NSMutableArray *)v7;

    objc_storeStrong((id *)&v6->mConnection, a3);
    [(CATIDSServiceConnection *)v6->mConnection setDelegate:v6];
  }

  return v6;
}

- (void)resumeConnection
{
  v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  if ([(CATIDSServiceConnection *)self->mConnection isClosed])
  {
    v4 = [(CATIDSServiceConnection *)self->mConnection closedError];
    id v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      CATErrorWithCodeAndUserInfo(100, 0);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v7 = v6;

    [(CATTransport *)self didInterruptWithError:v7];
  }
  else
  {
    self->mIsActive = 1;
    [(CATIDSServiceTransport *)self serviceReceiveQueue];
  }
}

- (void)suspendConnection
{
  v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  self->mIsActive = 0;
}

- (void)invalidateConnection
{
  if ([(CATIDSServiceConnection *)self->mConnection isClosed])
  {
    [(CATIDSServiceTransport *)self tryReportingInvalidation];
  }
  else
  {
    mConnection = self->mConnection;
    [(CATIDSServiceConnection *)mConnection close];
  }
}

- (id)operationToSendMessage:(id)a3
{
  id v4 = a3;
  id v5 = [[_CATIDSServiceTransportSendMessageOperation alloc] initWithConnection:self->mConnection message:v4];

  return v5;
}

- (id)name
{
  v3 = NSString;
  id v4 = [(CATIDSServiceConnection *)self->mConnection metadata];
  id v5 = [v4 connectionIdentifier];
  id v6 = [(CATIDSServiceConnection *)self->mConnection metadata];
  id v7 = [v6 destinationAppleID];
  v8 = [v3 stringWithFormat:@"%@-%@", v5, v7];

  return v8;
}

- (void)connection:(id)a3 receivedData:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = CATGetCatalystQueue();
  CATAssertIsQueue(v6);

  id v12 = 0;
  id v7 = objc_msgSend(MEMORY[0x263F08928], "cat_unarchiveObjectOfClass:withData:error:", objc_opt_class(), v5, &v12);

  id v8 = v12;
  v9 = v8;
  if (v7)
  {
    [(NSMutableArray *)self->mReceiveQueue addObject:v7];
    [(CATIDSServiceTransport *)self serviceReceiveQueue];
  }
  else
  {
    uint64_t v13 = *MEMORY[0x263F08608];
    v14[0] = v8;
    objc_super v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    v11 = CATErrorWithCodeAndUserInfo(301, v10);
    [(CATTransport *)self didInterruptWithError:v11];
  }
}

- (void)connectionClosed:(id)a3
{
  id v7 = a3;
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  id v5 = [v7 closedError];

  if (v5)
  {
    if (self->mIsActive)
    {
      id v6 = [v7 closedError];
      [(CATTransport *)self didInterruptWithError:v6];
    }
  }
  else
  {
    [(CATIDSServiceTransport *)self tryReportingInvalidation];
  }
}

- (void)tryReportingInvalidation
{
  if (!self->mDidDelegateInvalidation)
  {
    self->mDidDelegateInvalidation = 1;
    [(CATTransport *)self didInvalidate];
  }
}

- (void)serviceReceiveQueue
{
  v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  if (self->mIsActive && [(NSMutableArray *)self->mReceiveQueue count])
  {
    id v4 = [(NSMutableArray *)self->mReceiveQueue firstObject];
    [(NSMutableArray *)self->mReceiveQueue removeObjectAtIndex:0];
    [(CATTransport *)self didReceiveMessage:v4];
    [(CATIDSServiceTransport *)self serviceReceiveQueue];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mReceiveQueue, 0);

  objc_storeStrong((id *)&self->mConnection, 0);
}

@end