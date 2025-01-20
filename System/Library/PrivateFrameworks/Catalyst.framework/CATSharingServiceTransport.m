@interface CATSharingServiceTransport
- (CATSharingServiceTransport)initWithConnection:(id)a3;
- (id)name;
- (id)operationToSendMessage:(id)a3;
- (void)connection:(id)a3 receivedData:(id)a4;
- (void)connectionClosed:(id)a3;
- (void)invalidateConnection;
- (void)invalidateIfNeeded;
- (void)processReceivedMessages;
- (void)resumeConnection;
- (void)suspendConnection;
@end

@implementation CATSharingServiceTransport

- (CATSharingServiceTransport)initWithConnection:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CATSharingServiceTransport;
  v6 = [(CATTransport *)&v13 init];
  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    mCatalystQueue = v6->mCatalystQueue;
    v6->mCatalystQueue = (CATOperationQueue *)v7;

    v9 = CATGetCatalystQueue();
    [(CATOperationQueue *)v6->mCatalystQueue setUnderlyingQueue:v9];

    uint64_t v10 = objc_opt_new();
    mReceivedMessages = v6->mReceivedMessages;
    v6->mReceivedMessages = (NSMutableArray *)v10;

    objc_storeStrong((id *)&v6->mConnection, a3);
    [(CATSharingConnection *)v6->mConnection setDelegate:v6];
  }

  return v6;
}

- (void)resumeConnection
{
  v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  if ([(CATSharingConnection *)self->mConnection isClosed])
  {
    v4 = [(CATSharingConnection *)self->mConnection closedError];
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
    [(CATSharingServiceTransport *)self processReceivedMessages];
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
  if ([(CATSharingConnection *)self->mConnection isClosed])
  {
    [(CATSharingServiceTransport *)self invalidateIfNeeded];
  }
  else
  {
    mConnection = self->mConnection;
    [(CATSharingConnection *)mConnection close];
  }
}

- (id)operationToSendMessage:(id)a3
{
  id v4 = a3;
  id v5 = [[CATSharingServiceTransportSendMessageOperation alloc] initWithConnection:self->mConnection message:v4];

  return v5;
}

- (id)name
{
  v2 = [(CATSharingConnection *)self->mConnection remoteDevice];
  v3 = [v2 identifier];
  id v4 = [v3 UUIDString];

  return v4;
}

- (void)connection:(id)a3 receivedData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  mCatalystQueue = self->mCatalystQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__CATSharingServiceTransport_connection_receivedData___block_invoke;
  v10[3] = &unk_2641DC0C0;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  id v11 = v9;
  [(CATOperationQueue *)mCatalystQueue addOperationWithBlock:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __54__CATSharingServiceTransport_connection_receivedData___block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x263EF8340];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x263F08928];
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = *(void *)(a1 + 32);
    id v11 = 0;
    id v6 = objc_msgSend(v3, "cat_unarchiveObjectOfClass:withData:error:", v4, v5, &v11);
    id v7 = v11;
    v8 = v7;
    if (v6)
    {
      [WeakRetained[9] addObject:v6];
      [WeakRetained processReceivedMessages];
    }
    else
    {
      uint64_t v12 = *MEMORY[0x263F08608];
      v13[0] = v7;
      id v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
      uint64_t v10 = CATErrorWithCodeAndUserInfo(301, v9);
      [WeakRetained didInterruptWithError:v10];
    }
  }
}

- (void)connectionClosed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CATGetCatalystQueue();
  CATAssertIsQueue(v5);

  id v6 = [v4 closedError];

  if (v6)
  {
    if (self->mIsActive) {
      [(CATTransport *)self didInterruptWithError:v6];
    }
  }
  else
  {
    [(CATSharingServiceTransport *)self invalidateIfNeeded];
  }
}

- (void)processReceivedMessages
{
  v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  if (self->mIsActive && [(NSMutableArray *)self->mReceivedMessages count])
  {
    id v4 = [(NSMutableArray *)self->mReceivedMessages firstObject];
    [(NSMutableArray *)self->mReceivedMessages removeObjectAtIndex:0];
    [(CATTransport *)self didReceiveMessage:v4];
    [(CATSharingServiceTransport *)self processReceivedMessages];
  }
}

- (void)invalidateIfNeeded
{
  v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  if (!self->mIsInvalidated)
  {
    self->mIsInvalidated = 1;
    [(CATTransport *)self didInvalidate];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mReceivedMessages, 0);
  objc_storeStrong((id *)&self->mCatalystQueue, 0);

  objc_storeStrong((id *)&self->mConnection, 0);
}

@end