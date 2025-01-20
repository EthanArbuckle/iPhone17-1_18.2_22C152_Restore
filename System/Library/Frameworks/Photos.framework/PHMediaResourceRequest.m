@interface PHMediaResourceRequest
- (BOOL)isSynchronous;
- (BOOL)retryAssetResourceRequest:(id)a3 afterFailureWithError:(id)a4;
- (BOOL)wantsURLOnly;
- (NSString)description;
- (PHAssetResource)resource;
- (PHMediaResourceRequest)initWithRequestID:(int)a3 requestIndex:(unint64_t)a4 contextType:(int64_t)a5 managerID:(unint64_t)a6 asset:(id)a7 assetResource:(id)a8 networkAccessAllowed:(BOOL)a9 downloadIntent:(int64_t)a10 downloadPriority:(int64_t)a11 wantsURLOnly:(BOOL)a12 synchronous:(BOOL)a13 delegate:(id)a14;
- (id)progressHandler;
- (int64_t)resourceType;
- (void)_finishWithError:(id)a3;
- (void)_handleDidFindFileURL:(id)a3;
- (void)_receiveAssetResourceDataPart:(id)a3;
- (void)_reportProgress:(double)a3;
- (void)assetResourceRequest:(id)a3 didFinishWithError:(id)a4;
- (void)cancel;
- (void)setProgressHandler:(id)a3;
- (void)startRequest;
@end

@implementation PHMediaResourceRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_dataResult, 0);
  objc_storeStrong((id *)&self->_compositeData, 0);

  objc_storeStrong((id *)&self->_internalRequest, 0);
}

- (BOOL)wantsURLOnly
{
  return self->_wantsURLOnly;
}

- (PHAssetResource)resource
{
  return self->_resource;
}

- (void)setProgressHandler:(id)a3
{
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (BOOL)retryAssetResourceRequest:(id)a3 afterFailureWithError:(id)a4
{
  id v5 = a4;
  v6 = [(PHMediaRequest *)self delegate];
  LOBYTE(self) = [v6 retryMediaRequest:self afterFailureWithError:v5];

  return (char)self;
}

- (void)assetResourceRequest:(id)a3 didFinishWithError:(id)a4
{
  -[PHMediaResourceResult setAssetResourceData:](self->_dataResult, "setAssetResourceData:", self->_compositeData, a4);
  dataResult = self->_dataResult;
  v6 = [(PHAssetResourceRequest *)self->_internalRequest info];
  [(PHCompositeMediaResult *)dataResult addInfoFromDictionary:v6];

  id v7 = [(PHMediaRequest *)self delegate];
  [v7 mediaRequest:self didFinishWithResult:self->_dataResult];
}

- (void)_finishWithError:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  progressHandler = (void (**)(id, uint64_t, id, double))self->_progressHandler;
  if (progressHandler) {
    progressHandler[2](progressHandler, 1, v4, 1.0);
  }
  v6 = PLImageManagerGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = [(PHMediaRequest *)self identifierString];
    int v8 = 138412546;
    v9 = v7;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_DEBUG, "[RM] %@ Media resource request finished with error: %@", (uint8_t *)&v8, 0x16u);
  }
  [(PHCompositeMediaResult *)self->_dataResult setError:v4];
}

- (void)_receiveAssetResourceDataPart:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLImageManagerGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = [(PHMediaRequest *)self identifierString];
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2048;
    uint64_t v13 = [v4 length];
    _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_DEBUG, "[RM] %@ Media resource request receiving data with length: %ld", (uint8_t *)&v10, 0x16u);
  }
  compositeData = self->_compositeData;
  if (!compositeData)
  {
    int v8 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
    v9 = self->_compositeData;
    self->_compositeData = v8;

    compositeData = self->_compositeData;
  }
  [(NSMutableData *)compositeData appendData:v4];
}

- (void)_handleDidFindFileURL:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLImageManagerGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = [(PHMediaRequest *)self identifierString];
    int v7 = 138412546;
    int v8 = v6;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_DEBUG, "[RM] %@ Media resource request determined resource url: %@", (uint8_t *)&v7, 0x16u);
  }
  [(PHMediaResourceResult *)self->_dataResult setAssetResourceFileURL:v4];
}

- (void)_reportProgress:(double)a3
{
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = _PHAssetResourceTypeDescription([(PHAssetResource *)self->_resource type]);
  int v7 = (void *)v6;
  int v8 = @"Y";
  if (self->_networkAccessAllowed) {
    __int16 v9 = @"Y";
  }
  else {
    __int16 v9 = @"N";
  }
  if (!self->_wantsURLOnly) {
    int v8 = @"N";
  }
  id v10 = [v3 stringWithFormat:@"<%@ %p> - type: %@, net: %@, url-only: %@", v5, self, v6, v9, v8];

  return (NSString *)v10;
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)PHMediaResourceRequest;
  [(PHMediaRequest *)&v3 cancel];
  [(PHAssetResourceRequest *)self->_internalRequest cancel];
}

- (void)startRequest
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  objc_super v3 = PLImageManagerGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(PHMediaRequest *)self identifierString];
    id v5 = _PHAssetResourceTypeDescription([(PHMediaResourceRequest *)self resourceType]);
    *(_DWORD *)buf = 138412546;
    v25 = v4;
    __int16 v26 = 2112;
    v27 = v5;
    _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEFAULT, "[RM] %@ Starting media resource request for resource type %@", buf, 0x16u);
  }
  if (self->_networkAccessAllowed && self->_synchronous)
  {
    uint64_t v6 = PLImageManagerGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v7 = [(PHMediaRequest *)self identifierString];
      *(_DWORD *)buf = 138412290;
      v25 = v7;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_DEBUG, "[RM] %@ resource request starting with both synchronous and network access allowed - warning, result may block for a long time", buf, 0xCu);
    }
  }
  int v8 = objc_alloc_init(PHAssetResourceRequestOptions);
  [(PHAssetResourceRequestOptions *)v8 setNetworkAccessAllowed:self->_networkAccessAllowed];
  [(PHAssetResourceRequestOptions *)v8 setDownloadIntent:self->_downloadIntent];
  [(PHAssetResourceRequestOptions *)v8 setDownloadPriority:self->_downloadPriority];
  objc_initWeak((id *)buf, self);
  if (self->_progressHandler)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __38__PHMediaResourceRequest_startRequest__block_invoke;
    v22[3] = &unk_1E5848F38;
    objc_copyWeak(&v23, (id *)buf);
    [(PHAssetResourceRequestOptions *)v8 setProgressHandler:v22];
    objc_destroyWeak(&v23);
  }
  __int16 v9 = [PHAssetResourceRequest alloc];
  resource = self->_resource;
  uint64_t v11 = [(PHMediaRequest *)self requestID];
  unint64_t v12 = [(PHMediaRequest *)self managerID];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __38__PHMediaResourceRequest_startRequest__block_invoke_2;
  v20[3] = &unk_1E5848F60;
  objc_copyWeak(&v21, (id *)buf);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __38__PHMediaResourceRequest_startRequest__block_invoke_3;
  v18[3] = &unk_1E5848F88;
  objc_copyWeak(&v19, (id *)buf);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __38__PHMediaResourceRequest_startRequest__block_invoke_4;
  v16[3] = &unk_1E5848FB0;
  objc_copyWeak(&v17, (id *)buf);
  uint64_t v13 = [(PHAssetResourceRequest *)v9 initWithAssetResource:resource options:v8 requestID:v11 managerID:v12 delegate:self urlReceivedHandler:v20 dataReceivedHandler:v18 completionHandler:v16];
  internalRequest = self->_internalRequest;
  self->_internalRequest = v13;

  v15 = [(PHMediaRequest *)self identifierString];
  [(PHAssetResourceRequest *)self->_internalRequest setTaskIdentifier:v15];

  [(PHAssetResourceRequest *)self->_internalRequest setLoadURLOnly:self->_wantsURLOnly];
  [(PHAssetResourceRequest *)self->_internalRequest setSynchronous:self->_synchronous];
  [(PHAssetResourceRequest *)self->_internalRequest startRequest];
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
}

void __38__PHMediaResourceRequest_startRequest__block_invoke(uint64_t a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reportProgress:a2];
}

void __38__PHMediaResourceRequest_startRequest__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleDidFindFileURL:v3];
}

void __38__PHMediaResourceRequest_startRequest__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _receiveAssetResourceDataPart:v3];
}

void __38__PHMediaResourceRequest_startRequest__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _finishWithError:v3];
}

- (BOOL)isSynchronous
{
  return self->_synchronous;
}

- (int64_t)resourceType
{
  return [(PHAssetResource *)self->_resource type];
}

- (PHMediaResourceRequest)initWithRequestID:(int)a3 requestIndex:(unint64_t)a4 contextType:(int64_t)a5 managerID:(unint64_t)a6 asset:(id)a7 assetResource:(id)a8 networkAccessAllowed:(BOOL)a9 downloadIntent:(int64_t)a10 downloadPriority:(int64_t)a11 wantsURLOnly:(BOOL)a12 synchronous:(BOOL)a13 delegate:(id)a14
{
  uint64_t v18 = *(void *)&a3;
  id v21 = a7;
  v22 = (PHAssetResource *)a8;
  id v23 = a14;
  if (v21)
  {
    if (v22) {
      goto LABEL_3;
    }
  }
  else
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"PHMediaResourceRequest.m", 32, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];

    if (v22) {
      goto LABEL_3;
    }
  }
  v30 = [MEMORY[0x1E4F28B00] currentHandler];
  [v30 handleFailureInMethod:a2, self, @"PHMediaResourceRequest.m", 33, @"Invalid parameter not satisfying: %@", @"assetResource" object file lineNumber description];

LABEL_3:
  v31.receiver = self;
  v31.super_class = (Class)PHMediaResourceRequest;
  v24 = [(PHMediaRequest *)&v31 initWithRequestID:v18 requestIndex:a4 contextType:a5 managerID:a6 asset:v21 delegate:v23];
  v25 = v24;
  if (v24)
  {
    v24->_resource = v22;
    v24->_networkAccessAllowed = a9;
    v24->_downloadIntent = a10;
    v24->_downloadPriority = a11;
    v24->_synchronous = a13;
    v24->_wantsURLOnly = a12;
    __int16 v26 = [[PHMediaResourceResult alloc] initWithRequestID:v18 assetResource:v22];
    dataResult = v25->_dataResult;
    v25->_dataResult = v26;
  }
  return v25;
}

@end