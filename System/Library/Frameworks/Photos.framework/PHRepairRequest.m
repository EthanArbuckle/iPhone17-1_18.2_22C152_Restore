@interface PHRepairRequest
- (BOOL)isSynchronous;
- (NSSet)errorCodes;
- (PHAssetResource)resource;
- (PHRepairRequest)initWithRequestID:(int)a3 requestIndex:(unint64_t)a4 contextType:(int64_t)a5 managerID:(unint64_t)a6 asset:(id)a7 assetResource:(id)a8 errorCodes:(id)a9 delegate:(id)a10;
- (id)_sendRepairRequestWithReply:(id)a3;
- (void)dealloc;
- (void)startRequest;
@end

@implementation PHRepairRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorCodes, 0);
  objc_storeStrong((id *)&self->_resource, 0);

  objc_storeStrong((id *)&self->_progressFollower, 0);
}

- (NSSet)errorCodes
{
  return self->_errorCodes;
}

- (PHAssetResource)resource
{
  return self->_resource;
}

- (void)startRequest
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __31__PHRepairRequest_startRequest__block_invoke;
  v10[3] = &unk_1E5846A10;
  v10[4] = self;
  v3 = [(PHRepairRequest *)self _sendRepairRequestWithReply:v10];
  objc_initWeak(&location, self);
  id v4 = objc_alloc(MEMORY[0x1E4F8AAE8]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__PHRepairRequest_startRequest__block_invoke_2;
  v7[3] = &unk_1E5847C08;
  objc_copyWeak(&v8, &location);
  v5 = (PLProgressFollower *)[v4 initWithSourceProgress:v3 progressHandler:v7];
  progressFollower = self->_progressFollower;
  self->_progressFollower = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __31__PHRepairRequest_startRequest__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v6 = -[PHCompositeMediaResult initWithRequestID:]([PHCompositeMediaResult alloc], "initWithRequestID:", [*(id *)(a1 + 32) requestID]);
  [(PHCompositeMediaResult *)v6 setErrorIfNone:v4];

  v5 = [*(id *)(a1 + 32) delegate];
  [v5 mediaRequest:*(void *)(a1 + 32) didFinishWithResult:v6];
}

void __31__PHRepairRequest_startRequest__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [WeakRetained delegate];
  [v4 mediaRequest:WeakRetained didReportProgress:v3];
}

- (BOOL)isSynchronous
{
  return 0;
}

- (id)_sendRepairRequestWithReply:(id)a3
{
  resource = self->_resource;
  if (resource)
  {
    id v5 = a3;
    id v6 = [(PHAssetResource *)resource backingResourceIdentity];
    v7 = [(PHMediaRequest *)self sendResourceRepairRequestForResource:v6 errorCodes:self->_errorCodes reply:v5];
  }
  else
  {
    errorCodes = self->_errorCodes;
    id v6 = a3;
    v7 = [(PHMediaRequest *)self sendResourceRepairRequestWithErrorCodes:errorCodes reply:v6];
  }

  return v7;
}

- (void)dealloc
{
  [(PLProgressFollower *)self->_progressFollower invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PHRepairRequest;
  [(PHMediaRequest *)&v3 dealloc];
}

- (PHRepairRequest)initWithRequestID:(int)a3 requestIndex:(unint64_t)a4 contextType:(int64_t)a5 managerID:(unint64_t)a6 asset:(id)a7 assetResource:(id)a8 errorCodes:(id)a9 delegate:(id)a10
{
  uint64_t v15 = *(void *)&a3;
  id v21 = a8;
  id v17 = a9;
  v22.receiver = self;
  v22.super_class = (Class)PHRepairRequest;
  v18 = [(PHMediaRequest *)&v22 initWithRequestID:v15 requestIndex:a4 contextType:a5 managerID:a6 asset:a7 delegate:a10];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_resource, a8);
    objc_storeStrong((id *)&v19->_errorCodes, a9);
  }

  return v19;
}

@end