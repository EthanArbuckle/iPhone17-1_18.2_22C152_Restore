@interface PHAssetResourceWriteRequest
- (BOOL)isCancelled;
- (BOOL)retryAssetResourceRequest:(id)a3 afterFailureWithError:(id)a4;
- (NSDictionary)info;
- (NSString)taskIdentifier;
- (NSURL)destinationFileURL;
- (PHAssetResource)assetResource;
- (PHAssetResourceRequestDelegate)delegate;
- (PHAssetResourceRequestOptions)options;
- (PHAssetResourceWriteRequest)initWithAssetResource:(id)a3 destinationFileURL:(id)a4 options:(id)a5 requestID:(int)a6 managerID:(unint64_t)a7 delegate:(id)a8 completionHandler:(id)a9;
- (id)_lazyDataRequest;
- (id)completionHandler;
- (int)requestID;
- (unint64_t)fetchIncrementRetryAttemptCount;
- (unint64_t)managerID;
- (void)_handleDidFindFileURL:(id)a3;
- (void)assetResourceRequest:(id)a3 didFinishWithError:(id)a4;
- (void)cancel;
- (void)configureWithError:(id)a3;
- (void)setErrorIfNone:(id)a3;
- (void)setTaskIdentifier:(id)a3;
- (void)startRequest;
@end

@implementation PHAssetResourceWriteRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationFileURL, 0);
  objc_storeStrong((id *)&self->_taskIdentifier, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_assetResource, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_dataRequest, 0);
}

- (NSURL)destinationFileURL
{
  return self->_destinationFileURL;
}

- (void)setTaskIdentifier:(id)a3
{
}

- (NSDictionary)info
{
  return self->_info;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (PHAssetResourceRequestDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PHAssetResourceRequestDelegate *)WeakRetained;
}

- (unint64_t)managerID
{
  return self->_managerID;
}

- (int)requestID
{
  return self->_requestID;
}

- (PHAssetResourceRequestOptions)options
{
  return self->_options;
}

- (PHAssetResource)assetResource
{
  return self->_assetResource;
}

- (unint64_t)fetchIncrementRetryAttemptCount
{
  return [(PHAssetResourceRequest *)self->_dataRequest fetchIncrementRetryAttemptCount];
}

- (BOOL)retryAssetResourceRequest:(id)a3 afterFailureWithError:(id)a4
{
  v4 = self;
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(v4) = [WeakRetained retryAssetResourceRequest:v4 afterFailureWithError:v6];

  return (char)v4;
}

- (void)assetResourceRequest:(id)a3 didFinishWithError:(id)a4
{
  [(PHAssetResourceWriteRequest *)self setErrorIfNone:a4];
  os_unfair_lock_lock(&self->_completionHandlerLock);
  v8 = (void (**)(id, void *))_Block_copy(self->_completionHandler);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  os_unfair_lock_unlock(&self->_completionHandlerLock);
  if (v8)
  {
    id v6 = PHPublicErrorFromError(self->_error);
    v8[2](v8, v6);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained assetResourceRequest:self didFinishWithError:self->_error];
}

- (NSString)taskIdentifier
{
  taskIdentifier = self->_taskIdentifier;
  if (taskIdentifier)
  {
    v3 = taskIdentifier;
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"ARW-%lu-%lu", self->_managerID, self->_requestID);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (void)configureWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(PHAssetResourceWriteRequest *)self _lazyDataRequest];
  [v5 configureWithError:v4];
}

- (void)startRequest
{
  id v2 = [(PHAssetResourceWriteRequest *)self _lazyDataRequest];
  [v2 startRequest];
}

- (void)cancel
{
}

- (BOOL)isCancelled
{
  return [(PHAssetResourceRequest *)self->_dataRequest isCancelled];
}

- (id)_lazyDataRequest
{
  dataRequest = self->_dataRequest;
  if (!dataRequest)
  {
    objc_initWeak(&location, self);
    id v4 = [PHAssetResourceRequest alloc];
    assetResource = self->_assetResource;
    options = self->_options;
    uint64_t requestID = self->_requestID;
    unint64_t managerID = self->_managerID;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __47__PHAssetResourceWriteRequest__lazyDataRequest__block_invoke;
    v12[3] = &unk_1E5848F60;
    objc_copyWeak(&v13, &location);
    v9 = [(PHAssetResourceRequest *)v4 initWithAssetResource:assetResource options:options requestID:requestID managerID:managerID delegate:self urlReceivedHandler:v12 dataReceivedHandler:0 completionHandler:0];
    v10 = self->_dataRequest;
    self->_dataRequest = v9;

    [(PHAssetResourceRequest *)self->_dataRequest setLoadURLOnly:1];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    dataRequest = self->_dataRequest;
  }

  return dataRequest;
}

void __47__PHAssetResourceWriteRequest__lazyDataRequest__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleDidFindFileURL:v3];
}

- (void)_handleDidFindFileURL:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(PHAssetResourceWriteRequest *)self isCancelled])
  {
    destinationFileURL = self->_destinationFileURL;
    id v15 = 0;
    int v6 = [MEMORY[0x1E4F8B908] copyItemAtURL:v4 toURL:destinationFileURL error:&v15];
    id v7 = v15;
    if (v6)
    {
      v8 = self->_destinationFileURL;
      uint64_t v9 = *MEMORY[0x1E4F8C3F0];
      id v14 = 0;
      char v10 = [MEMORY[0x1E4F8B908] stripExtendedAttributesFromFileAtURL:v8 inDomain:v9 error:&v14];
      id v11 = v14;
      if ((v10 & 1) == 0)
      {
        v12 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          id v13 = self->_destinationFileURL;
          *(_DWORD *)buf = 138412546;
          v17 = v13;
          __int16 v18 = 2112;
          id v19 = v11;
          _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_ERROR, "Failed to strip extended attributes from %@, %@", buf, 0x16u);
        }
      }
    }
    else
    {
      [(PHAssetResourceWriteRequest *)self setErrorIfNone:v7];
    }
  }
}

- (void)setErrorIfNone:(id)a3
{
  id v5 = a3;
  error = self->_error;
  p_error = &self->_error;
  if (!error)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_error, a3);
    id v5 = v8;
  }
}

- (PHAssetResourceWriteRequest)initWithAssetResource:(id)a3 destinationFileURL:(id)a4 options:(id)a5 requestID:(int)a6 managerID:(unint64_t)a7 delegate:(id)a8 completionHandler:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  id v19 = a9;
  if (!v15)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PHAssetResourceWriteRequest.m", 44, @"Invalid parameter not satisfying: %@", @"resource" object file lineNumber description];
  }
  v28.receiver = self;
  v28.super_class = (Class)PHAssetResourceWriteRequest;
  uint64_t v20 = [(PHAssetResourceWriteRequest *)&v28 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_assetResource, a3);
    objc_storeStrong((id *)&v21->_destinationFileURL, a4);
    objc_storeStrong((id *)&v21->_options, a5);
    v21->_uint64_t requestID = a6;
    v21->_unint64_t managerID = a7;
    objc_storeWeak((id *)&v21->_delegate, v18);
    v21->_completionHandlerLock._os_unfair_lock_opaque = 0;
    uint64_t v22 = [v19 copy];
    id completionHandler = v21->_completionHandler;
    v21->_id completionHandler = (id)v22;
  }
  return v21;
}

@end