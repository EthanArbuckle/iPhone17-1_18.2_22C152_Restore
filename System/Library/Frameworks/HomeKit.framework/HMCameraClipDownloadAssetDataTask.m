@interface HMCameraClipDownloadAssetDataTask
- (HMCameraClipDownloadAssetDataTask)initWithURL:(id)a3 httpHeaderFields:(id)a4;
- (HMCameraClipDownloadAssetDataTask)initWithURL:(id)a3 httpHeaderFields:(id)a4 handler:(id)a5;
- (HMCameraClipDownloadAssetDataTaskHandling)handler;
- (NSMutableURLRequest)urlRequest;
- (id)downloadDataForByteRange:(_NSRange)a3;
@end

@implementation HMCameraClipDownloadAssetDataTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handler, 0);

  objc_storeStrong((id *)&self->_urlRequest, 0);
}

- (HMCameraClipDownloadAssetDataTaskHandling)handler
{
  return (HMCameraClipDownloadAssetDataTaskHandling *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableURLRequest)urlRequest
{
  return (NSMutableURLRequest *)objc_getProperty(self, a2, 8, 1);
}

- (id)downloadDataForByteRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v6 = (void *)MEMORY[0x19F3A64A0](self, a2);
  v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    v32.NSUInteger location = location;
    v32.NSUInteger length = length;
    v10 = NSStringFromRange(v32);
    v11 = [(HMCameraClipDownloadAssetDataTask *)v7 urlRequest];
    *(_DWORD *)buf = 138543874;
    v26 = v9;
    __int16 v27 = 2112;
    v28 = v10;
    __int16 v29 = 2112;
    v30 = v11;
    _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@Downloading data with byte range %@ for URL request %@", buf, 0x20u);
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  v13 = objc_msgSend(NSString, "stringWithFormat:", @"bytes=%lu-%lu", location, length + location - 1);
  v14 = [(HMCameraClipDownloadAssetDataTask *)v7 urlRequest];
  [v14 setValue:v13 forHTTPHeaderField:@"Range"];

  v15 = [(HMCameraClipDownloadAssetDataTask *)v7 handler];
  v16 = [(HMCameraClipDownloadAssetDataTask *)v7 urlRequest];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __62__HMCameraClipDownloadAssetDataTask_downloadDataForByteRange___block_invoke;
  v21[3] = &unk_1E5940178;
  v21[4] = v7;
  id v17 = v12;
  id v22 = v17;
  NSUInteger v23 = location;
  NSUInteger v24 = length;
  [v15 resumeDataTaskWithRequest:v16 completionHandler:v21];

  v18 = v22;
  id v19 = v17;

  return v19;
}

void __62__HMCameraClipDownloadAssetDataTask_downloadDataForByteRange___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7)
  {
    id v10 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
    id v12 = v11;

    if (v12)
    {
      if ([v12 statusCode] == 200 || objc_msgSend(v12, "statusCode") == 206)
      {
        v13 = (void *)MEMORY[0x19F3A64A0]();
        id v14 = *(id *)(a1 + 32);
        v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v16 = HMFGetLogIdentifier();
          id v17 = NSStringFromRange(*(NSRange *)(a1 + 48));
          int v32 = 138543618;
          v33 = v16;
          __int16 v34 = 2112;
          id v35 = v17;
          _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_INFO, "%{public}@Successfully downloaded asset data with byte range %@", (uint8_t *)&v32, 0x16u);
        }
        [*(id *)(a1 + 40) finishWithResult:v7];
        goto LABEL_21;
      }
      id v22 = (void *)MEMORY[0x19F3A64A0]();
      id v27 = *(id *)(a1 + 32);
      v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        __int16 v29 = HMFGetLogIdentifier();
        int v32 = 138543618;
        v33 = v29;
        __int16 v34 = 2048;
        id v35 = (id)[v12 statusCode];
        _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_ERROR, "%{public}@Received bad HTTP response status code from asset data download: %lu", (uint8_t *)&v32, 0x16u);
      }
    }
    else
    {
      id v22 = (void *)MEMORY[0x19F3A64A0]();
      id v23 = *(id *)(a1 + 32);
      NSUInteger v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = HMFGetLogIdentifier();
        int v32 = 138543874;
        v33 = v25;
        __int16 v34 = 2112;
        id v35 = (id)objc_opt_class();
        __int16 v36 = 2112;
        id v37 = v10;
        id v26 = v35;
        _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@Response was not of class NSHTTPURLResponse (class=%@): %@", (uint8_t *)&v32, 0x20u);
      }
    }
    v30 = *(void **)(a1 + 40);
    uint64_t v31 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
    [v30 finishWithError:v31];

LABEL_21:
    goto LABEL_22;
  }
  v18 = (void *)MEMORY[0x19F3A64A0]();
  id v19 = *(id *)(a1 + 32);
  v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v21 = HMFGetLogIdentifier();
    int v32 = 138543618;
    v33 = v21;
    __int16 v34 = 2112;
    id v35 = v9;
    _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Download of asset data failed: %@", (uint8_t *)&v32, 0x16u);
  }
  [*(id *)(a1 + 40) finishWithError:v9];
LABEL_22:
}

- (HMCameraClipDownloadAssetDataTask)initWithURL:(id)a3 httpHeaderFields:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMCameraClipDownloadAssetDataTask;
  v11 = [(HMCameraClipDownloadAssetDataTask *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F28E88]) initWithURL:v8];
    urlRequest = v11->_urlRequest;
    v11->_urlRequest = (NSMutableURLRequest *)v12;

    [(NSMutableURLRequest *)v11->_urlRequest setAllHTTPHeaderFields:v9];
    objc_storeStrong((id *)&v11->_handler, a5);
  }

  return v11;
}

- (HMCameraClipDownloadAssetDataTask)initWithURL:(id)a3 httpHeaderFields:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(HMCameraClipDownloadAssetDataTaskHandler);
  id v9 = [(HMCameraClipDownloadAssetDataTask *)self initWithURL:v7 httpHeaderFields:v6 handler:v8];

  return v9;
}

@end