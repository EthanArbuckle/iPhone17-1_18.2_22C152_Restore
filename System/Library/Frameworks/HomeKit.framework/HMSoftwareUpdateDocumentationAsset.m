@interface HMSoftwareUpdateDocumentationAsset
+ (BOOL)supportsSecureCoding;
+ (HMSoftwareUpdateDocumentationAsset)assetWithURL:(id)a3;
+ (NSURL)assetDirectoryURL;
+ (id)logCategory;
- (BOOL)documentationIsCached;
- (BOOL)isEqual:(id)a3;
- (BOOL)saveWithError:(id *)a3;
- (BOOL)shouldAutomaticallyCache;
- (BOOL)stateNeedsNotification;
- (HMSoftwareUpdateDocumentation)documentation;
- (HMSoftwareUpdateDocumentationAsset)init;
- (HMSoftwareUpdateDocumentationAsset)initWithCoder:(id)a3;
- (HMSoftwareUpdateDocumentationAsset)initWithDocumentationMetadata:(id)a3;
- (HMSoftwareUpdateDocumentationAsset)initWithDocumentationMetadata:(id)a3 urlSession:(id)a4 extractor:(id)a5;
- (HMSoftwareUpdateDocumentationAssetDelegate)delegate;
- (HMSoftwareUpdateDocumentationAssetExtractor)extractor;
- (HMSoftwareUpdateDocumentationMetadata)metadata;
- (HMSoftwareUpdateUrlSession)URLSession;
- (NSError)error;
- (NSInputStream)archivedFileStream;
- (NSString)propertyDescription;
- (NSString)shortDescription;
- (NSURL)URL;
- (NSUUID)identifier;
- (id)archiveURL;
- (id)bundleURL;
- (id)logIdentifier;
- (id)metadataURL;
- (int64_t)state;
- (unint64_t)hash;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)cancelDownload;
- (void)cancelUnarchiveWithError:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)finishDownload;
- (void)finishUnarchive;
- (void)setArchivedFileStream:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setError:(id)a3;
- (void)setExtractionProgress:(double)a3;
- (void)setExtractor:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setURLSession:(id)a3;
- (void)startCaching;
- (void)startDownload;
- (void)startUnarchive;
@end

@implementation HMSoftwareUpdateDocumentationAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archivedFileStream, 0);
  objc_storeStrong((id *)&self->_URLSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_extractor, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setArchivedFileStream:(id)a3
{
}

- (NSInputStream)archivedFileStream
{
  return self->_archivedFileStream;
}

- (void)setURLSession:(id)a3
{
}

- (HMSoftwareUpdateUrlSession)URLSession
{
  return self->_URLSession;
}

- (void)setDelegate:(id)a3
{
}

- (HMSoftwareUpdateDocumentationAssetDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HMSoftwareUpdateDocumentationAssetDelegate *)WeakRetained;
}

- (BOOL)shouldAutomaticallyCache
{
  return self->_shouldAutomaticallyCache;
}

- (HMSoftwareUpdateDocumentationMetadata)metadata
{
  return (HMSoftwareUpdateDocumentationMetadata *)objc_getProperty(self, a2, 64, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (void)setExtractionProgress:(double)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x19F3A64A0](self, a2);
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    v10 = v8;
    __int16 v11 = 2048;
    double v12 = a3 * 100.0;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Unarchive progress: %.1f%%", (uint8_t *)&v9, 0x16u);
  }
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = (void *)MEMORY[0x19F3A64A0]();
  double v12 = self;
  uint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    v15 = [v10 path];
    *(_DWORD *)buf = 138543618;
    v52 = v14;
    __int16 v53 = 2112;
    v54 = v15;
    _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Finished downloading archived asset to: %@", buf, 0x16u);
  }
  v16 = [v9 response];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v17 = v16;
  }
  else {
    v17 = 0;
  }
  id v18 = v17;

  if (v18 && ([v18 statusCode] > 399 || objc_msgSend(v18, "statusCode") <= 199))
  {
    v19 = (void *)MEMORY[0x19F3A64A0]();
    v20 = v12;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      v23 = [(HMSoftwareUpdateDocumentationAsset *)v20 archiveURL];
      v24 = [v23 path];
      *(_DWORD *)buf = 138543874;
      v52 = v22;
      __int16 v53 = 2112;
      v54 = v24;
      __int16 v55 = 2112;
      id v56 = v18;
      _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to download asset to '%@' due to bad response status: %@", buf, 0x20u);
    }
    [(HMSoftwareUpdateDocumentationAsset *)v20 cancelDownload];
    id v25 = 0;
  }
  else
  {
    v26 = [MEMORY[0x1E4F28CB8] defaultManager];
    v27 = [(HMSoftwareUpdateDocumentationAsset *)v12 archiveURL];
    id v50 = 0;
    char v28 = [v26 moveItemAtURL:v10 toURL:v27 error:&v50];
    id v29 = v50;

    if (v28)
    {
      queue = v12->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __88__HMSoftwareUpdateDocumentationAsset_URLSession_downloadTask_didFinishDownloadingToURL___block_invoke;
      block[3] = &unk_1E59452E8;
      block[4] = v12;
      dispatch_async(queue, block);
      id v25 = v29;
    }
    else
    {
      id v47 = v8;
      v31 = (void *)MEMORY[0x19F3A64A0]();
      v32 = v12;
      v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = HMFGetLogIdentifier();
        v35 = [(HMSoftwareUpdateDocumentationAsset *)v32 archiveURL];
        v36 = [v35 path];
        *(_DWORD *)buf = 138543874;
        v52 = v34;
        __int16 v53 = 2112;
        v54 = v36;
        __int16 v55 = 2112;
        id v56 = v29;
        _os_log_impl(&dword_19D1A8000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to move downloaded asset to '%@' with error: %@. Removing existing assets at that path.", buf, 0x20u);
      }
      v37 = [MEMORY[0x1E4F28CB8] defaultManager];
      v38 = [(HMSoftwareUpdateDocumentationAsset *)v32 archiveURL];
      id v49 = v29;
      char v39 = [v37 removeItemAtURL:v38 error:&v49];
      id v25 = v49;

      id v8 = v47;
      if ((v39 & 1) == 0)
      {
        v40 = (void *)MEMORY[0x19F3A64A0]();
        v41 = v32;
        v42 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          v43 = HMFGetLogIdentifier();
          v44 = [(HMSoftwareUpdateDocumentationAsset *)v41 archiveURL];
          [v44 path];
          v45 = v46 = v40;
          *(_DWORD *)buf = 138543874;
          v52 = v43;
          __int16 v53 = 2112;
          v54 = v45;
          __int16 v55 = 2112;
          id v56 = v25;
          _os_log_impl(&dword_19D1A8000, v42, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove existing asset at url '%@' with error: %@.", buf, 0x20u);

          v40 = v46;
          id v8 = v47;
        }
      }
      [(HMSoftwareUpdateDocumentationAsset *)v32 cancelDownload];
    }
  }
}

uint64_t __88__HMSoftwareUpdateDocumentationAsset_URLSession_downloadTask_didFinishDownloadingToURL___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) finishDownload];
  v2 = *(void **)(a1 + 32);

  return [v2 startUnarchive];
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = (void *)MEMORY[0x19F3A64A0]();
  v14 = self;
  v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    float v16 = (float)a6 / (float)a7;
    v17 = HMFGetLogIdentifier();
    int v18 = 138543618;
    v19 = v17;
    __int16 v20 = 2048;
    double v21 = (float)(v16 * 100.0);
    _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_INFO, "%{public}@Download progress: %.1f%%", (uint8_t *)&v18, 0x16u);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = (void *)MEMORY[0x19F3A64A0]();
    id v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      int v15 = 138543618;
      float v16 = v14;
      __int16 v17 = 2112;
      id v18 = v10;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to download asset with error: %@", (uint8_t *)&v15, 0x16u);
    }
    [(HMSoftwareUpdateDocumentationAsset *)v12 setError:v10];
    [(HMSoftwareUpdateDocumentationAsset *)v12 setState:5];
  }
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x19F3A64A0]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [(HMSoftwareUpdateDocumentationAsset *)v6 identifier];
    id v10 = [(HMSoftwareUpdateDocumentationAsset *)v6 metadata];
    int v13 = 138544130;
    v14 = v8;
    __int16 v15 = 2112;
    float v16 = v9;
    __int16 v17 = 2112;
    id v18 = v10;
    __int16 v19 = 2048;
    uint64_t v20 = [(HMSoftwareUpdateDocumentationAsset *)v6 state];
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Encoding software update documentation asset with identifier: %@, metadata: %@, state: %ld", (uint8_t *)&v13, 0x2Au);
  }
  id v11 = [(HMSoftwareUpdateDocumentationAsset *)v6 identifier];
  [v4 encodeObject:v11 forKey:@"HM.identifier"];

  id v12 = [(HMSoftwareUpdateDocumentationAsset *)v6 metadata];
  [v4 encodeObject:v12 forKey:@"HM.metadata"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[HMSoftwareUpdateDocumentationAsset state](v6, "state"), @"HM.state");
}

- (HMSoftwareUpdateDocumentationAsset)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.metadata"];
  v6 = [(HMSoftwareUpdateDocumentationAsset *)self initWithDocumentationMetadata:v5];
  if (v6)
  {
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.identifier"];
    identifier = v6->_identifier;
    v6->_identifier = (NSUUID *)v7;

    v6->_state = [v4 decodeIntegerForKey:@"HM.state"];
  }

  return v6;
}

- (id)logIdentifier
{
  v2 = [(HMSoftwareUpdateDocumentationAsset *)self identifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)finishUnarchive
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HMSoftwareUpdateDocumentationAsset *)self state] == 3;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  v5 = self;
  v6 = HMFGetOSLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v7)
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v15 = v8;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Finishing unarchive", buf, 0xCu);
    }
    objc_initWeak((id *)buf, v5);
    id v9 = [(HMSoftwareUpdateDocumentationAsset *)v5 extractor];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__HMSoftwareUpdateDocumentationAsset_finishUnarchive__block_invoke;
    v12[3] = &unk_1E5945338;
    objc_copyWeak(&v13, (id *)buf);
    [v9 finishStreamWithCompletionBlock:v12];

    id v10 = [(HMSoftwareUpdateDocumentationAsset *)v5 archivedFileStream];
    [v10 close];

    [(HMSoftwareUpdateDocumentationAsset *)v5 setArchivedFileStream:0];
    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v7)
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v15 = v11;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to finish unarchive, not currently unarchiving", buf, 0xCu);
    }
  }
}

void __53__HMSoftwareUpdateDocumentationAsset_finishUnarchive__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = v3;
  if (v4)
  {
    v6 = v4[2];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = ____handleFinishedUnarchive_block_invoke;
    v7[3] = &unk_1E5945628;
    id v8 = v4;
    id v9 = v5;
    dispatch_async(v6, v7);
  }
}

- (void)cancelUnarchiveWithError:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  v6 = self;
  BOOL v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v21 = v8;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Cancelling unarchive", buf, 0xCu);
  }
  [(HMSoftwareUpdateDocumentationAsset *)v6 setExtractor:0];
  id v9 = [(HMSoftwareUpdateDocumentationAsset *)v6 archivedFileStream];
  [v9 close];

  [(HMSoftwareUpdateDocumentationAsset *)v6 setArchivedFileStream:0];
  id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v11 = [(HMSoftwareUpdateDocumentationAsset *)v6 bundleURL];
  id v19 = 0;
  int v12 = [v10 removeItemAtURL:v11 error:&v19];
  id v13 = v19;

  if (v12)
  {
    v14 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v15 = v6;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      __int16 v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = v17;
      __int16 v22 = 2112;
      id v23 = v13;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_INFO, "%{public}@Failed to remove bundle with error: %@", buf, 0x16u);
    }
  }
  if (v4)
  {
    [(HMSoftwareUpdateDocumentationAsset *)v6 setError:v4];
  }
  else
  {
    id v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:23];
    [(HMSoftwareUpdateDocumentationAsset *)v6 setError:v18];
  }
  [(HMSoftwareUpdateDocumentationAsset *)v6 setState:5];
}

- (void)startUnarchive
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__HMSoftwareUpdateDocumentationAsset_startUnarchive__block_invoke;
  block[3] = &unk_1E59452E8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __52__HMSoftwareUpdateDocumentationAsset_startUnarchive__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v2 = [*(id *)(a1 + 32) state] == 2;
  id v3 = (void *)MEMORY[0x19F3A64A0]();
  id v4 = *(id *)(a1 + 32);
  id v5 = HMFGetOSLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v6)
    {
      BOOL v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v20 = v7;
      _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Starting unarchive", buf, 0xCu);
    }
    [*(id *)(a1 + 32) setState:3];
    id v8 = [*(id *)(a1 + 32) extractor];
    if (v8)
    {
      objc_initWeak((id *)buf, *(id *)(a1 + 32));
      id v9 = [*(id *)(a1 + 32) bundleURL];
      id v10 = [v9 path];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __52__HMSoftwareUpdateDocumentationAsset_startUnarchive__block_invoke_127;
      v17[3] = &unk_1E5945310;
      objc_copyWeak(&v18, (id *)buf);
      [v8 prepareForExtractionToPath:v10 completionBlock:v17];

      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      int v12 = (void *)MEMORY[0x19F3A64A0]();
      id v13 = *(id *)(a1 + 32);
      v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        __int16 v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v20 = v15;
        _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to create extractor", buf, 0xCu);
      }
      uint64_t v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
      [*(id *)(a1 + 32) setError:v16];

      [*(id *)(a1 + 32) setState:5];
    }
  }
  else
  {
    if (v6)
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v20 = v11;
      _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to unarchive, asset is not downloaded", buf, 0xCu);
    }
  }
}

void __52__HMSoftwareUpdateDocumentationAsset_startUnarchive__block_invoke_127(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = v4;
  if (v5)
  {
    BOOL v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = v5;
    id v9 = HMFGetOSLogHandle();
    id v10 = v9;
    if (v6)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v11 = HMFGetLogIdentifier();
        int v15 = 138543618;
        uint64_t v16 = v11;
        __int16 v17 = 2112;
        id v18 = v6;
        _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to start unarchive with error: %@", (uint8_t *)&v15, 0x16u);
      }
      [v8 cancelUnarchiveWithError:v6];
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = HMFGetLogIdentifier();
        int v15 = 138543362;
        uint64_t v16 = v12;
        _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Started unarchive", (uint8_t *)&v15, 0xCu);
      }
      id v13 = [v8 extractor];
      [v13 setExtractorDelegate:v8];

      v14 = [v8 archivedFileStream];
      [v14 open];

      __processNextArchivedData(v8);
    }
  }
}

- (void)setExtractor:(id)a3
{
}

- (HMSoftwareUpdateDocumentationAssetExtractor)extractor
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  extractor = self->_extractor;
  if (extractor)
  {
    id v3 = extractor;
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4FA8A48];
    id v6 = [(HMSoftwareUpdateDocumentationAsset *)self archiveURL];
    BOOL v7 = [(HMSoftwareUpdateDocumentationAsset *)self metadata];
    id v8 = [v7 digest];
    id v9 = [v5 optionsForArchiveURL:v6 digest:v8];

    if (v9)
    {
      id v10 = (void *)MEMORY[0x1E4F1CA10];
      id v11 = [(HMSoftwareUpdateDocumentationAsset *)self archiveURL];
      int v12 = [v10 inputStreamWithURL:v11];

      if (v12)
      {
        id v13 = (void *)MEMORY[0x19F3A64A0]([(HMSoftwareUpdateDocumentationAsset *)self setArchivedFileStream:v12]);
        v14 = self;
        int v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          uint64_t v16 = HMFGetLogIdentifier();
          int v33 = 138543618;
          v34 = v16;
          __int16 v35 = 2112;
          v36 = v9;
          _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_INFO, "%{public}@Starting extraction using options: %@", (uint8_t *)&v33, 0x16u);
        }
        id v17 = objc_alloc(MEMORY[0x1E4FA8A48]);
        id v18 = [(HMSoftwareUpdateDocumentationAsset *)v14 bundleURL];
        uint64_t v19 = [v18 path];
        uint64_t v20 = (HMSoftwareUpdateDocumentationAssetExtractor *)[v17 initWithPath:v19 options:v9];
        uint64_t v21 = self->_extractor;
        self->_extractor = v20;

        id v3 = self->_extractor;
      }
      else
      {
        char v28 = (void *)MEMORY[0x19F3A64A0]();
        id v29 = self;
        v30 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v31 = HMFGetLogIdentifier();
          int v33 = 138543362;
          v34 = v31;
          _os_log_impl(&dword_19D1A8000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to create input stream", (uint8_t *)&v33, 0xCu);
        }
        id v3 = 0;
      }
    }
    else
    {
      __int16 v22 = (void *)MEMORY[0x19F3A64A0]();
      id v23 = self;
      uint64_t v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        id v25 = HMFGetLogIdentifier();
        v26 = [(HMSoftwareUpdateDocumentationAsset *)v23 metadata];
        v27 = [v26 digest];
        int v33 = 138543618;
        v34 = v25;
        __int16 v35 = 2112;
        v36 = v27;
        _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_INFO, "%{public}@Failed to create validation options for unarchiving with digest: %@", (uint8_t *)&v33, 0x16u);
      }
      id v3 = 0;
    }
  }

  return v3;
}

- (void)finishDownload
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = HMFGetLogIdentifier();
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Finished download", (uint8_t *)&v8, 0xCu);
  }
  BOOL v7 = [(HMSoftwareUpdateDocumentationAsset *)v4 URLSession];
  [v7 invalidateAndCancel];

  [(HMSoftwareUpdateDocumentationAsset *)v4 setURLSession:0];
  [(HMSoftwareUpdateDocumentationAsset *)v4 setState:2];
}

- (void)cancelDownload
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v10 = v6;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Cancelling download", buf, 0xCu);
  }
  queue = v4->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__HMSoftwareUpdateDocumentationAsset_cancelDownload__block_invoke;
  block[3] = &unk_1E59452E8;
  block[4] = v4;
  dispatch_async(queue, block);
}

uint64_t __52__HMSoftwareUpdateDocumentationAsset_cancelDownload__block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) URLSession];
  [v2 invalidateAndCancel];

  [*(id *)(a1 + 32) setURLSession:0];
  id v3 = [MEMORY[0x1E4F28C58] hmErrorWithCode:23];
  [*(id *)(a1 + 32) setError:v3];

  id v4 = *(void **)(a1 + 32);

  return [v4 setState:5];
}

- (void)startDownload
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__HMSoftwareUpdateDocumentationAsset_startDownload__block_invoke;
  block[3] = &unk_1E59452E8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __51__HMSoftwareUpdateDocumentationAsset_startDownload__block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) state];
  if (v2) {
    BOOL v3 = v2 == 5;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v42 = 0;
    char v5 = [v4 saveWithError:&v42];
    id v6 = (__CFString *)v42;
    BOOL v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    uint64_t v10 = v9;
    if (v5)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v44 = (uint64_t)v11;
        _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Starting download", buf, 0xCu);
      }
      [*(id *)(a1 + 32) setState:1];
      int v12 = [*(id *)(a1 + 32) URLSession];

      if (!v12)
      {
        id v13 = [MEMORY[0x1E4F290F0] ephemeralSessionConfiguration];
        v14 = (void *)MEMORY[0x1E4F290E0];
        uint64_t v15 = *(void *)(a1 + 32);
        uint64_t v16 = [MEMORY[0x1E4F28F08] mainQueue];
        id v17 = [v14 sessionWithConfiguration:v13 delegate:v15 delegateQueue:v16];

        [*(id *)(a1 + 32) setURLSession:v17];
      }
      id v18 = [*(id *)(a1 + 32) metadata];
      uint64_t v19 = [v18 URL];

      if (v19)
      {
        uint64_t v20 = [*(id *)(a1 + 32) URLSession];
        uint64_t v21 = [*(id *)(a1 + 32) metadata];
        __int16 v22 = [v21 URL];
        id v23 = [v20 downloadTaskWithURL:v22];

        uint64_t v24 = (void *)MEMORY[0x19F3A64A0]();
        id v25 = *(id *)(a1 + 32);
        v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v27 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v44 = (uint64_t)v27;
          __int16 v45 = 2112;
          v46 = v23;
          _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_INFO, "%{public}@Resuming task: %@", buf, 0x16u);
        }
        [(__CFString *)v23 resume];
      }
      else
      {
        uint64_t v37 = (void *)MEMORY[0x19F3A64A0]();
        id v38 = *(id *)(a1 + 32);
        char v39 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v40 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          uint64_t v44 = (uint64_t)v40;
          _os_log_impl(&dword_19D1A8000, v39, OS_LOG_TYPE_ERROR, "%{public}@Cannot download software update from nil url", buf, 0xCu);
        }
        v41 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
        [*(id *)(a1 + 32) setError:v41];

        [*(id *)(a1 + 32) setState:5];
      }
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v36 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v44 = (uint64_t)v36;
        __int16 v45 = 2112;
        v46 = v6;
        _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to save asset with error: %@", buf, 0x16u);
      }
      [*(id *)(a1 + 32) setError:v6];
      [*(id *)(a1 + 32) setState:5];
    }
  }
  else
  {
    uint64_t v28 = v2;
    id v29 = (void *)MEMORY[0x19F3A64A0]();
    id v30 = *(id *)(a1 + 32);
    v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      uint64_t v33 = HMFGetLogIdentifier();
      v34 = (void *)v33;
      if ((unint64_t)(v28 - 1) > 4) {
        __int16 v35 = @"unknown";
      }
      else {
        __int16 v35 = off_1E5945410[v28 - 1];
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v44 = v33;
      __int16 v45 = 2112;
      v46 = v35;
      _os_log_impl(&dword_19D1A8000, v31, OS_LOG_TYPE_INFO, "%{public}@Not starting new download in state: %@", buf, 0x16u);
    }
  }
}

- (void)startCaching
{
  int64_t v3 = [(HMSoftwareUpdateDocumentationAsset *)self state];
  if (v3 == 5)
  {
LABEL_4:
    [(HMSoftwareUpdateDocumentationAsset *)self setError:0];
    [(HMSoftwareUpdateDocumentationAsset *)self startDownload];
    return;
  }
  if (v3 != 2)
  {
    if (v3) {
      return;
    }
    goto LABEL_4;
  }

  [(HMSoftwareUpdateDocumentationAsset *)self startUnarchive];
}

- (BOOL)stateNeedsNotification
{
  return [(HMSoftwareUpdateDocumentationAsset *)self state] == 4
      || [(HMSoftwareUpdateDocumentationAsset *)self state] == 5;
}

- (BOOL)documentationIsCached
{
  return [(HMSoftwareUpdateDocumentationAsset *)self state] == 4;
}

- (BOOL)saveWithError:(id *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  char v5 = (void *)MEMORY[0x19F3A64A0](self, a2);
  id v6 = self;
  BOOL v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [(HMSoftwareUpdateDocumentationAsset *)v6 URL];
    *(_DWORD *)buf = 138543618;
    uint64_t v33 = v8;
    __int16 v34 = 2112;
    id v35 = v9;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@creating directory at: %@", buf, 0x16u);
  }
  uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v11 = [(HMSoftwareUpdateDocumentationAsset *)v6 URL];
  id v31 = 0;
  char v12 = [v10 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:&v31];
  id v13 = v31;

  if (v12)
  {
    v14 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:a3];
    if (v14)
    {
      uint64_t v15 = [(HMSoftwareUpdateDocumentationAsset *)v6 metadataURL];
      BOOL v16 = 1;
      char v17 = [v14 writeToURL:v15 atomically:1];

      if (v17)
      {
LABEL_18:

        goto LABEL_19;
      }
      id v18 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v19 = v6;
      uint64_t v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v33 = v21;
        _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to archive asset metadata (write)", buf, 0xCu);
      }
      if (a3)
      {
        [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
        BOOL v16 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
    }
    else
    {
      v26 = (void *)MEMORY[0x19F3A64A0]();
      v27 = v6;
      uint64_t v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        id v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v33 = v29;
        _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to archive asset metadata (encode)", buf, 0xCu);
      }
    }
    BOOL v16 = 0;
    goto LABEL_18;
  }
  __int16 v22 = (void *)MEMORY[0x19F3A64A0]();
  id v23 = v6;
  uint64_t v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    id v25 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v33 = v25;
    __int16 v34 = 2112;
    id v35 = v13;
    _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to create asset directory with error: %@", buf, 0x16u);
  }
  BOOL v16 = 0;
  if (a3) {
    *a3 = v13;
  }
LABEL_19:

  return v16;
}

- (HMSoftwareUpdateDocumentation)documentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int64_t v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  id v4 = self;
  char v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = HMFGetLogIdentifier();
    int v21 = 138543362;
    __int16 v22 = v6;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Parsing documentation", (uint8_t *)&v21, 0xCu);
  }
  uint64_t v7 = [(HMSoftwareUpdateDocumentationAsset *)v4 state];
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  if (v7 == 4)
  {
    id v9 = (void *)MEMORY[0x1E4F28B50];
    uint64_t v10 = [(HMSoftwareUpdateDocumentationAsset *)v4 bundleURL];
    uint64_t v11 = [v9 bundleWithURL:v10];

    if (v11)
    {
      char v12 = [[HMSoftwareUpdateDocumentation alloc] initWithBundle:v11];

      goto LABEL_13;
    }
    BOOL v16 = (void *)MEMORY[0x19F3A64A0]();
    char v17 = v4;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      int v21 = 138543362;
      __int16 v22 = v19;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_INFO, "%{public}@Failed to find documentation bundle", (uint8_t *)&v21, 0xCu);
    }
  }
  else
  {
    id v13 = v4;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      int v21 = 138543362;
      __int16 v22 = v15;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_INFO, "%{public}@Documentation not cached", (uint8_t *)&v21, 0xCu);
    }
  }
  char v12 = 0;
LABEL_13:

  return v12;
}

- (id)bundleURL
{
  uint64_t v2 = [(HMSoftwareUpdateDocumentationAsset *)self URL];
  int64_t v3 = [v2 URLByAppendingPathComponent:@"Asset"];

  return v3;
}

- (id)archiveURL
{
  uint64_t v2 = [(HMSoftwareUpdateDocumentationAsset *)self URL];
  int64_t v3 = [v2 URLByAppendingPathComponent:@"Asset.zip"];

  return v3;
}

- (id)metadataURL
{
  uint64_t v2 = [(HMSoftwareUpdateDocumentationAsset *)self URL];
  int64_t v3 = [v2 URLByAppendingPathComponent:@"metadata.plist"];

  return v3;
}

- (NSURL)URL
{
  int64_t v3 = +[HMSoftwareUpdateDocumentationAsset assetDirectoryURL];
  id v4 = [(HMSoftwareUpdateDocumentationAsset *)self identifier];
  char v5 = [v4 UUIDString];
  id v6 = [v3 URLByAppendingPathComponent:v5];

  return (NSURL *)v6;
}

- (void)setError:(id)a3
{
  id v4 = (NSError *)a3;
  os_unfair_lock_lock_with_options();
  error = self->_error;
  self->_error = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSError)error
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_error;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setState:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_state == a3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_state = a3;
    os_unfair_lock_unlock(p_lock);
    id v6 = [(HMSoftwareUpdateDocumentationAsset *)self delegate];
    [v6 didUpdateDocumentationAssetState:self];
    if ((unint64_t)a3 <= 4 && ((1 << a3) & 0x15) != 0)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __47__HMSoftwareUpdateDocumentationAsset_setState___block_invoke;
      block[3] = &unk_1E59452E8;
      block[4] = self;
      dispatch_async(queue, block);
    }
  }
}

uint64_t __47__HMSoftwareUpdateDocumentationAsset_setState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) saveWithError:0];
}

- (int64_t)state
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMSoftwareUpdateDocumentationAsset *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = v4;
    }
    else {
      char v5 = 0;
    }
    id v6 = v5;
    if (v6)
    {
      uint64_t v7 = [(HMSoftwareUpdateDocumentationAsset *)self metadata];
      id v8 = [(HMSoftwareUpdateDocumentationAsset *)v6 metadata];
      char v9 = HMFEqualObjects();
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  uint64_t v2 = [(HMSoftwareUpdateDocumentationAsset *)self metadata];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)propertyDescription
{
  unint64_t v3 = NSString;
  id v4 = [(HMSoftwareUpdateDocumentationAsset *)self identifier];
  char v5 = [v4 UUIDString];
  unint64_t v6 = [(HMSoftwareUpdateDocumentationAsset *)self state];
  if (v6 > 5) {
    uint64_t v7 = @"unknown";
  }
  else {
    uint64_t v7 = off_1E59453E0[v6];
  }
  id v8 = [(HMSoftwareUpdateDocumentationAsset *)self metadata];
  char v9 = [v3 stringWithFormat:@", Identifier = %@, State = %@, Metadata = %@", v5, v7, v8];

  return (NSString *)v9;
}

- (NSString)shortDescription
{
  unint64_t v3 = NSString;
  id v4 = [(id)objc_opt_class() shortDescription];
  char v5 = [(HMSoftwareUpdateDocumentationAsset *)self identifier];
  unint64_t v6 = [v5 UUIDString];
  uint64_t v7 = [v3 stringWithFormat:@"%@ %@", v4, v6];

  return (NSString *)v7;
}

- (HMSoftwareUpdateDocumentationAsset)initWithDocumentationMetadata:(id)a3
{
  return [(HMSoftwareUpdateDocumentationAsset *)self initWithDocumentationMetadata:a3 urlSession:0 extractor:0];
}

- (HMSoftwareUpdateDocumentationAsset)initWithDocumentationMetadata:(id)a3 urlSession:(id)a4 extractor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    uint64_t v23 = (HMSoftwareUpdateDocumentationAsset *)_HMFPreconditionFailure();
    [(HMSoftwareUpdateDocumentationAsset *)v23 init];
  }
  char v12 = v11;
  v25.receiver = self;
  v25.super_class = (Class)HMSoftwareUpdateDocumentationAsset;
  id v13 = [(HMSoftwareUpdateDocumentationAsset *)&v25 init];
  if (v13)
  {
    uint64_t v14 = [v9 metadataDigestUUID];
    identifier = v13->_identifier;
    v13->_identifier = (NSUUID *)v14;

    objc_storeStrong((id *)&v13->_metadata, a3);
    HMDispatchQueueNameString(v13, 0);
    id v16 = objc_claimAutoreleasedReturnValue();
    char v17 = (const char *)[v16 UTF8String];
    id v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create(v17, v18);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v19;

    objc_storeStrong((id *)&v13->_extractor, a5);
    objc_storeStrong((id *)&v13->_URLSession, a4);
    URLSession = v13->_URLSession;
    if (URLSession) {
      [(HMSoftwareUpdateUrlSession *)URLSession setUrlSessionDelegate:v13];
    }
  }

  return v13;
}

- (HMSoftwareUpdateDocumentationAsset)init
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  char v5 = NSStringFromSelector(a2);
  unint64_t v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t57 != -1) {
    dispatch_once(&logCategory__hmf_once_t57, &__block_literal_global_62200);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v58;

  return v2;
}

uint64_t __49__HMSoftwareUpdateDocumentationAsset_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v58;
  logCategory__hmf_once_v58 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (HMSoftwareUpdateDocumentationAsset)assetWithURL:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = v4;
  if (v4)
  {
    unint64_t v6 = (void *)MEMORY[0x1E4F1C9B8];
    id v7 = [v4 URLByAppendingPathComponent:@"metadata.plist"];
    id v8 = [v6 dataWithContentsOfURL:v7];

    if (v8)
    {
      id v36 = 0;
      id v9 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v8 error:&v36];
      id v10 = (__CFString *)v36;
      if (v9)
      {
        if ([v9 state] != 4) {
          goto LABEL_12;
        }
        id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
        char v12 = [v9 bundleURL];
        id v13 = [v12 path];
        char v14 = [v11 fileExistsAtPath:v13];

        if (v14)
        {
          uint64_t v15 = 4;
        }
        else
        {
LABEL_12:
          if ([v9 state] == 2 || objc_msgSend(v9, "state") == 4)
          {
            int v21 = [MEMORY[0x1E4F28CB8] defaultManager];
            __int16 v22 = [v9 archiveURL];
            uint64_t v23 = [v22 path];
            int v24 = [v21 fileExistsAtPath:v23];

            if (v24) {
              uint64_t v15 = 2;
            }
            else {
              uint64_t v15 = 0;
            }
          }
          else
          {
            uint64_t v15 = 0;
          }
        }
        if (v15 != [v9 state])
        {
          id v29 = (void *)MEMORY[0x19F3A64A0]();
          id v30 = a1;
          id v31 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v32 = HMFGetLogIdentifier();
            uint64_t v33 = off_1E59453B8[v15];
            *(_DWORD *)buf = 138543618;
            id v38 = v32;
            __int16 v39 = 2112;
            v40 = v33;
            _os_log_impl(&dword_19D1A8000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Setting state to: %@", buf, 0x16u);
          }
          [v9 setState:v15];
        }
        id v34 = v9;
      }
      else
      {
        objc_super v25 = (void *)MEMORY[0x19F3A64A0]();
        id v26 = a1;
        v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          uint64_t v28 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v38 = v28;
          __int16 v39 = 2112;
          v40 = v10;
          _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive software update documentation asset from serialized object data: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      id v16 = (void *)MEMORY[0x19F3A64A0]();
      id v17 = a1;
      id v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        dispatch_queue_t v19 = HMFGetLogIdentifier();
        uint64_t v20 = [v5 path];
        *(_DWORD *)buf = 138543618;
        id v38 = v19;
        __int16 v39 = 2112;
        v40 = v20;
        _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to find metadata at path: %@", buf, 0x16u);
      }
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return (HMSoftwareUpdateDocumentationAsset *)v9;
}

+ (NSURL)assetDirectoryURL
{
  id v2 = HMCreateSoftwareUpdateCacheDirectory();
  uint64_t v3 = HMSoftwareUpdateCacheDirectory();
  id v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];
  char v5 = [v4 URLByAppendingPathComponent:@"SoftwareUpdateDocumentation"];

  return (NSURL *)v5;
}

@end