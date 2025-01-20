@interface PHSingleMediaRequestContext
+ (id)avProxyRequestContextWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 options:(id)a6 resultHandler:(id)a7;
+ (id)originalAdjustmentDataRequestContextWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 options:(id)a6 resultHandler:(id)a7;
+ (int64_t)_indexOfAvProxyFromResources:(id)a3 hasAdjustments:(BOOL)a4 version:(int64_t)a5;
- (BOOL)isNetworkAccessAllowed;
- (BOOL)isSynchronous;
- (PHMediaRequest)request;
- (PHSingleMediaRequestContext)initWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 displaySpec:(id)a6 type:(int64_t)a7 networkAccessAllowed:(BOOL)a8 progressHandler:(id)a9 resultHandler:(id)a10;
- (id)_lazyProgress;
- (id)initialRequests;
- (id)progressHandler;
- (id)progresses;
- (int64_t)type;
- (void)processMediaResult:(id)a3 forRequest:(id)a4;
- (void)setRequest:(id)a3;
@end

@implementation PHSingleMediaRequestContext

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);

  objc_storeStrong((id *)&self->_progress, 0);
}

- (void)setRequest:(id)a3
{
}

- (PHMediaRequest)request
{
  return self->_request;
}

- (void)processMediaResult:(id)a3 forRequest:(id)a4
{
  resultHandler = (void (**)(id, id, id, PHSingleMediaRequestContext *))self->super._resultHandler;
  if (resultHandler) {
    resultHandler[2](resultHandler, a3, a4, self);
  }
}

- (id)progresses
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if ([(PHMediaRequestContext *)self shouldReportProgress])
  {
    v3 = [(PHSingleMediaRequestContext *)self _lazyProgress];
    v6[0] = v3;
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)progressHandler
{
  v2 = _Block_copy(self->_progressHandler);

  return v2;
}

- (id)initialRequests
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (self->_request)
  {
    v4[0] = self->_request;
    v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (BOOL)isSynchronous
{
  return [(PHMediaRequest *)self->_request isSynchronous];
}

- (BOOL)isNetworkAccessAllowed
{
  return self->_networkAccessAllowed;
}

- (int64_t)type
{
  return self->_type;
}

- (id)_lazyProgress
{
  progress = self->_progress;
  if (!progress)
  {
    v4 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:100];
    v5 = self->_progress;
    self->_progress = v4;

    progress = self->_progress;
  }

  return progress;
}

- (PHSingleMediaRequestContext)initWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 displaySpec:(id)a6 type:(int64_t)a7 networkAccessAllowed:(BOOL)a8 progressHandler:(id)a9 resultHandler:(id)a10
{
  uint64_t v15 = *(void *)&a3;
  id v17 = a9;
  v23.receiver = self;
  v23.super_class = (Class)PHSingleMediaRequestContext;
  v18 = [(PHMediaRequestContext *)&v23 initWithRequestID:v15 managerID:a4 asset:a5 displaySpec:a6 resultHandler:a10];
  v19 = v18;
  if (v18)
  {
    v18->_type = a7;
    v18->_networkAccessAllowed = a8;
    uint64_t v20 = [v17 copy];
    id progressHandler = v19->_progressHandler;
    v19->_id progressHandler = (id)v20;
  }
  return v19;
}

+ (int64_t)_indexOfAvProxyFromResources:(id)a3 hasAdjustments:(BOOL)a4 version:(int64_t)a5
{
  id v7 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__PHSingleMediaRequestContext__indexOfAvProxyFromResources_hasAdjustments_version___block_invoke;
  v12[3] = &__block_descriptor_41_e32_B32__0__PHAssetResource_8Q16_B24l;
  BOOL v13 = a4;
  v12[4] = a5;
  int64_t v8 = [v7 indexOfObjectPassingTest:v12];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __83__PHSingleMediaRequestContext__indexOfAvProxyFromResources_hasAdjustments_version___block_invoke_2;
    v10[3] = &__block_descriptor_41_e32_B32__0__PHAssetResource_8Q16_B24l;
    BOOL v11 = a4;
    v10[4] = a5;
    int64_t v8 = [v7 indexOfObjectPassingTest:v10];
  }

  return v8;
}

BOOL __83__PHSingleMediaRequestContext__indexOfAvProxyFromResources_hasAdjustments_version___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (*(unsigned char *)(a1 + 40) && !*(void *)(a1 + 32)) {
    uint64_t v5 = 105;
  }
  else {
    uint64_t v5 = 104;
  }
  BOOL v6 = [v3 type] == v5;

  return v6;
}

BOOL __83__PHSingleMediaRequestContext__indexOfAvProxyFromResources_hasAdjustments_version___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (*(unsigned char *)(a1 + 40) && !*(void *)(a1 + 32)) {
    uint64_t v5 = 6;
  }
  else {
    uint64_t v5 = 2;
  }
  BOOL v6 = [v3 type] == v5;

  return v6;
}

+ (id)originalAdjustmentDataRequestContextWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 options:(id)a6 resultHandler:(id)a7
{
  uint64_t v10 = *(void *)&a3;
  v43[1] = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  v14 = [PHSingleMediaRequestContext alloc];
  uint64_t v15 = [v12 isNetworkAccessAllowed];
  v16 = [v12 progressHandler];
  id v17 = [(PHSingleMediaRequestContext *)v14 initWithRequestID:v10 managerID:a4 asset:v11 displaySpec:0 type:6 networkAccessAllowed:v15 progressHandler:v16 resultHandler:v13];

  v18 = +[PHAssetResource assetResourcesForAsset:v11 includeDerivatives:0 includeMetadata:0];
  uint64_t v19 = [v18 indexOfObjectPassingTest:&__block_literal_global_1831];
  if (v19 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v20 = PLImageManagerGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, v20, OS_LOG_TYPE_ERROR, "Request original adjustment data, but asset has none, invalid request", buf, 2u);
    }

    v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v42 = *MEMORY[0x1E4F28228];
    v22 = NSString;
    objc_super v23 = [v11 uuid];
    v24 = [v22 stringWithFormat:@"asset %@ does not have original adjustemnt data resource", v23];
    v43[0] = v24;
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v42 count:1];
    v26 = [v21 errorWithDomain:@"PHPhotosErrorDomain" code:3303 userInfo:v25];
    [(PHMediaRequestContext *)v17 setPrestartError:v26];
  }
  else
  {
    v40 = [v18 objectAtIndexedSubscript:v19];
    v39 = [PHMediaResourceRequest alloc];
    uint64_t v27 = [(PHSingleMediaRequestContext *)v17 type];
    char v28 = [v12 isNetworkAccessAllowed];
    v29 = v18;
    unint64_t v30 = a4;
    uint64_t v31 = [v12 downloadIntent];
    uint64_t v32 = v10;
    uint64_t v33 = [v12 downloadPriority];
    BYTE1(v38) = [v12 isSynchronous];
    LOBYTE(v38) = 0;
    LOBYTE(v37) = v28;
    unint64_t v34 = v30;
    v18 = v29;
    v35 = -[PHMediaResourceRequest initWithRequestID:requestIndex:contextType:managerID:asset:assetResource:networkAccessAllowed:downloadIntent:downloadPriority:wantsURLOnly:synchronous:delegate:](v39, "initWithRequestID:requestIndex:contextType:managerID:asset:assetResource:networkAccessAllowed:downloadIntent:downloadPriority:wantsURLOnly:synchronous:delegate:", v32, 0, v27, v34, v11, v40, v37, v31, v33, v38, v17);
    [(PHSingleMediaRequestContext *)v17 setRequest:v35];
  }

  return v17;
}

BOOL __119__PHSingleMediaRequestContext_originalAdjustmentDataRequestContextWithRequestID_managerID_asset_options_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 16;
}

+ (id)avProxyRequestContextWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 options:(id)a6 resultHandler:(id)a7
{
  uint64_t v10 = *(void *)&a3;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  uint64_t v15 = [PHSingleMediaRequestContext alloc];
  uint64_t v16 = [v13 isNetworkAccessAllowed];
  id v17 = [v13 progressHandler];
  v18 = [(PHSingleMediaRequestContext *)v15 initWithRequestID:v10 managerID:a4 asset:v12 displaySpec:0 type:5 networkAccessAllowed:v16 progressHandler:v17 resultHandler:v14];

  uint64_t v19 = +[PHAssetResource assetResourcesForAsset:v12 includeDerivatives:0 includeMetadata:1];
  uint64_t v20 = objc_msgSend(a1, "_indexOfAvProxyFromResources:hasAdjustments:version:", v19, objc_msgSend(v12, "hasAdjustments"), objc_msgSend(v13, "version"));
  if (v20 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (![v12 hasAdjustments]
      || (uint64_t v20 = objc_msgSend(a1, "_indexOfAvProxyFromResources:hasAdjustments:version:", v19, 0, objc_msgSend(v13, "version")), v20 == 0x7FFFFFFFFFFFFFFFLL))
    {
      v21 = PLImageManagerGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B043000, v21, OS_LOG_TYPE_ERROR, "Request for AVAssetProxy, but asset has no media metadata or video resources, invalid request", buf, 2u);
      }

      v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v43 = *MEMORY[0x1E4F28228];
      objc_super v23 = NSString;
      v24 = [v12 uuid];
      v25 = [v23 stringWithFormat:@"asset %@ does not have media metadata or video resources", v24];
      v44 = v25;
      v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
      uint64_t v27 = [v22 errorWithDomain:@"PHPhotosErrorDomain" code:3303 userInfo:v26];
      [(PHMediaRequestContext *)v18 setPrestartError:v27];
LABEL_7:

      goto LABEL_14;
    }
  }
  unint64_t v41 = a4;
  uint64_t v42 = v19;
  v24 = [v19 objectAtIndexedSubscript:v20];
  char v28 = v18;
  BOOL v29 = [v24 type] != 105 && objc_msgSend(v24, "type") != 104;
  unint64_t v30 = [PHMediaResourceRequest alloc];
  char v31 = [v13 isNetworkAccessAllowed];
  uint64_t v32 = [v13 downloadIntent];
  uint64_t v33 = [v13 downloadPriority];
  BYTE1(v40) = [v13 isSynchronous];
  LOBYTE(v40) = v29;
  uint64_t v39 = v32;
  v18 = v28;
  LOBYTE(v38) = v31;
  v25 = -[PHMediaResourceRequest initWithRequestID:requestIndex:contextType:managerID:asset:assetResource:networkAccessAllowed:downloadIntent:downloadPriority:wantsURLOnly:synchronous:delegate:](v30, "initWithRequestID:requestIndex:contextType:managerID:asset:assetResource:networkAccessAllowed:downloadIntent:downloadPriority:wantsURLOnly:synchronous:delegate:", v10, 0, 5, v41, v12, v24, v38, v39, v33, v40, v28);
  [(PHSingleMediaRequestContext *)v18 setRequest:v25];
  if (v29 && ([v24 isLocallyAvailable] & 1) == 0)
  {
    int v35 = [v12 deferredProcessingNeeded];
    v36 = @"unexpected state, will attempt to continue";
    if (v35 == 2) {
      v36 = @"deferred processing needed";
    }
    v26 = v36;
    uint64_t v27 = PLImageManagerGetLog();
    uint64_t v19 = v42;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v37 = [(PHMediaRequest *)v25 identifierString];
      *(_DWORD *)buf = 138412546;
      v46 = v37;
      __int16 v47 = 2114;
      v48 = v26;
      _os_log_impl(&dword_19B043000, v27, OS_LOG_TYPE_DEFAULT, "[RM] %@ Request for AVAssetProxy for asset with no media metadata resource, but video is not locally available: %{public}@", buf, 0x16u);
    }
    goto LABEL_7;
  }
  uint64_t v19 = v42;
LABEL_14:

  return v18;
}

@end