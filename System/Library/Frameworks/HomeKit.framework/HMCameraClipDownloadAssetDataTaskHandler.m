@interface HMCameraClipDownloadAssetDataTaskHandler
- (void)resumeDataTaskWithRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation HMCameraClipDownloadAssetDataTaskHandler

- (void)resumeDataTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F290E0] sharedSession];
  v9 = [v8 dataTaskWithRequest:v6 completionHandler:v7];

  v10 = (void *)MEMORY[0x19F3A64A0]();
  v11 = self;
  v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = HMFGetLogIdentifier();
    int v14 = 138543874;
    v15 = v13;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    v19 = v9;
    _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@Resuming data task for URL request %@: %@", (uint8_t *)&v14, 0x20u);
  }
  [v9 resume];
}

@end