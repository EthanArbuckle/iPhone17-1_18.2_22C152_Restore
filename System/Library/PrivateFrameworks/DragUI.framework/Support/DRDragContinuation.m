@interface DRDragContinuation
- (DRDataTransferSession)dataTransferSession;
- (DRDragContinuation)initWithContinuationSession:(id)a3;
- (DRDragContinuationSession)continuationSession;
- (id)filterBlockForLaunchServicesUTIs;
- (void)dragContinuationDidFinishRequestingData;
- (void)requestItemCollectionWithReply:(id)a3;
- (void)setContinuationSession:(id)a3;
- (void)setDataTransferSession:(id)a3;
@end

@implementation DRDragContinuation

- (DRDragContinuation)initWithContinuationSession:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DRDragContinuation;
  v5 = [(DRDragContinuation *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_continuationSession, v4);
  }

  return v6;
}

- (id)filterBlockForLaunchServicesUTIs
{
  return &stru_100054BC0;
}

- (void)requestItemCollectionWithReply:(id)a3
{
  id v4 = (void (**)(id, void *, void *))a3;
  v5 = [(DRDragContinuation *)self dataTransferSession];

  if (!v5)
  {
    v6 = [(DRDragContinuation *)self continuationSession];
    v7 = [v6 dragSession];
    objc_super v8 = +[NSXPCConnection currentConnection];
    v9 = v8;
    if (v8)
    {
      [v8 auditToken];
    }
    else
    {
      long long v16 = 0u;
      long long v17 = 0u;
    }
    v10 = [(DRDragContinuation *)self filterBlockForLaunchServicesUTIs];
    id v11 = [v7 newDataTransferSessionWithDestinationAuditToken:&v16 filter:v10];
    [(DRDragContinuation *)self setDataTransferSession:v11];
  }
  v12 = [(DRDragContinuation *)self dataTransferSession];
  v13 = [v12 destinationItemCollection];
  v14 = [(DRDragContinuation *)self dataTransferSession];
  v15 = [v14 destinationDataProviderEndpoint];
  v4[2](v4, v13, v15);
}

- (void)dragContinuationDidFinishRequestingData
{
  id v4 = [(DRDragContinuation *)self continuationSession];
  v3 = [v4 dragSession];
  [v3 didFinishRequestingDataForDragContinuation:self];
}

- (DRDataTransferSession)dataTransferSession
{
  return self->_dataTransferSession;
}

- (void)setDataTransferSession:(id)a3
{
}

- (DRDragContinuationSession)continuationSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_continuationSession);
  return (DRDragContinuationSession *)WeakRetained;
}

- (void)setContinuationSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_continuationSession);
  objc_storeStrong((id *)&self->_dataTransferSession, 0);
}

@end