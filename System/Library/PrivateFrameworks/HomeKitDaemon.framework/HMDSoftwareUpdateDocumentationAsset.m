@interface HMDSoftwareUpdateDocumentationAsset
+ (BOOL)supportsSecureCoding;
+ (NSURL)assetDirectoryURL;
+ (id)assetWithURL:(id)a3 fileManager:(id)a4;
+ (id)logCategory;
- (BOOL)extractionEnteredPassThrough;
- (BOOL)isDownloadPermitted;
- (BOOL)isEqual:(id)a3;
- (BOOL)purgeWithError:(id *)a3;
- (BOOL)saveWithError:(id *)a3;
- (BOOL)shouldAutomaticallyCache;
- (HMDFileManager)fileManager;
- (HMDSoftwareUpdateDocumentationAsset)init;
- (HMDSoftwareUpdateDocumentationAsset)initWithCoder:(id)a3;
- (HMDSoftwareUpdateDocumentationAsset)initWithDocumentationMetadata:(id)a3;
- (HMDSoftwareUpdateDocumentationAsset)initWithDocumentationMetadata:(id)a3 dateWithTimeIntervalSinceNowFactory:(id)a4 URLSessionFactory:(id)a5 extractorFactory:(id)a6 notificationCenter:(id)a7 fileManager:(id)a8;
- (HMSoftwareUpdateDocumentation)documentation;
- (HMSoftwareUpdateDocumentationAssetExtractor)extractor;
- (HMSoftwareUpdateDocumentationMetadata)metadata;
- (HMSoftwareUpdateUrlSession)URLSession;
- (NSData)testDocumentData;
- (NSDate)nextPermittedDownloadDate;
- (NSInputStream)archivedFileStream;
- (NSNotificationCenter)notificationCenter;
- (NSString)propertyDescription;
- (NSString)shortDescription;
- (NSURL)URL;
- (NSURL)bundleURL;
- (NSUUID)identifier;
- (id)URLSessionFactory;
- (id)archiveURL;
- (id)dateWithTimeIntervalSinceNowFactory;
- (id)extractorFactory;
- (id)logIdentifier;
- (id)metadataURL;
- (int64_t)state;
- (unint64_t)downloadRetryCount;
- (unint64_t)hash;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)cancelDownload;
- (void)cancelUnarchive;
- (void)encodeWithCoder:(id)a3;
- (void)extractionCompleteAtArchivePath:(id)a3;
- (void)extractionEnteredPassThroughMode;
- (void)finishDownload;
- (void)finishUnarchive;
- (void)increaseDownloadRetryCount;
- (void)resetDownloadRetryCount;
- (void)setArchivedFileStream:(id)a3;
- (void)setDownloadRetryCount:(unint64_t)a3;
- (void)setExtractionEnteredPassThrough:(BOOL)a3;
- (void)setExtractionProgress:(double)a3;
- (void)setExtractor:(id)a3;
- (void)setFileManager:(id)a3;
- (void)setNextPermittedDownloadDate:(id)a3;
- (void)setShouldAutomaticallyCache:(BOOL)a3;
- (void)setState:(int64_t)a3;
- (void)setTestDocumentData:(id)a3;
- (void)setURLSession:(id)a3;
- (void)startCaching;
- (void)startDownload;
- (void)startUnarchive;
@end

@implementation HMDSoftwareUpdateDocumentationAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testDocumentData, 0);
  objc_storeStrong((id *)&self->_nextPermittedDownloadDate, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong(&self->_dateWithTimeIntervalSinceNowFactory, 0);
  objc_storeStrong((id *)&self->_archivedFileStream, 0);
  objc_storeStrong(&self->_extractorFactory, 0);
  objc_storeStrong((id *)&self->_extractor, 0);
  objc_storeStrong(&self->_URLSessionFactory, 0);
  objc_storeStrong((id *)&self->_URLSession, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setTestDocumentData:(id)a3
{
}

- (NSData)testDocumentData
{
  return self->_testDocumentData;
}

- (void)setNextPermittedDownloadDate:(id)a3
{
}

- (NSDate)nextPermittedDownloadDate
{
  return (NSDate *)objc_getProperty(self, a2, 128, 1);
}

- (void)setExtractionEnteredPassThrough:(BOOL)a3
{
  self->_extractionEnteredPassThrough = a3;
}

- (BOOL)extractionEnteredPassThrough
{
  return self->_extractionEnteredPassThrough;
}

- (void)setFileManager:(id)a3
{
}

- (HMDFileManager)fileManager
{
  return self->_fileManager;
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 112, 1);
}

- (id)dateWithTimeIntervalSinceNowFactory
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)setDownloadRetryCount:(unint64_t)a3
{
  self->_downloadRetryCount = a3;
}

- (unint64_t)downloadRetryCount
{
  return self->_downloadRetryCount;
}

- (void)setArchivedFileStream:(id)a3
{
}

- (NSInputStream)archivedFileStream
{
  return self->_archivedFileStream;
}

- (id)extractorFactory
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setExtractor:(id)a3
{
}

- (HMSoftwareUpdateDocumentationAssetExtractor)extractor
{
  return self->_extractor;
}

- (id)URLSessionFactory
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setURLSession:(id)a3
{
}

- (HMSoftwareUpdateUrlSession)URLSession
{
  return self->_URLSession;
}

- (HMSoftwareUpdateDocumentationMetadata)metadata
{
  return (HMSoftwareUpdateDocumentationMetadata *)objc_getProperty(self, a2, 48, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void)extractionEnteredPassThroughMode
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x230FBD990]([(HMDSoftwareUpdateDocumentationAsset *)self setExtractionEnteredPassThrough:1]);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Unarchive in pass through mode", (uint8_t *)&v7, 0xCu);
  }
}

- (void)extractionCompleteAtArchivePath:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  int v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    v10 = v8;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Completed unarchiving to path: %@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)setExtractionProgress:(double)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x230FBD990](self, a2);
  v6 = self;
  int v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    v10 = v8;
    __int16 v11 = 2048;
    double v12 = a3 * 100.0;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Unarchive progress: %.1f%%", (uint8_t *)&v9, 0x16u);
  }
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = (void *)MEMORY[0x230FBD990]();
  double v12 = self;
  uint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    v15 = [v10 path];
    *(_DWORD *)buf = 138543618;
    v50 = v14;
    __int16 v51 = 2112;
    v52 = v15;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Finished downloading archived asset to: %@", buf, 0x16u);
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
    v19 = (void *)MEMORY[0x230FBD990]();
    v20 = v12;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      v23 = [(HMDSoftwareUpdateDocumentationAsset *)v20 archiveURL];
      v24 = [v23 path];
      *(_DWORD *)buf = 138543874;
      v50 = v22;
      __int16 v51 = 2112;
      v52 = v24;
      __int16 v53 = 2112;
      id v54 = v18;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to download asset to '%@' due to bad response status: %@", buf, 0x20u);
    }
    [(HMDSoftwareUpdateDocumentationAsset *)v20 cancelDownload];
    [(HMDSoftwareUpdateDocumentationAsset *)v20 increaseDownloadRetryCount];
    id v25 = 0;
  }
  else
  {
    v26 = [(HMDSoftwareUpdateDocumentationAsset *)v12 fileManager];
    v27 = [(HMDSoftwareUpdateDocumentationAsset *)v12 archiveURL];
    id v48 = 0;
    char v28 = [v26 moveItemAtURL:v10 toURL:v27 error:&v48];
    id v29 = v48;

    if (v28)
    {
      [(HMDSoftwareUpdateDocumentationAsset *)v12 finishDownload];
      [(HMDSoftwareUpdateDocumentationAsset *)v12 startUnarchive];
      id v25 = v29;
    }
    else
    {
      id v46 = v8;
      v30 = (void *)MEMORY[0x230FBD990]();
      v31 = v12;
      v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = HMFGetLogIdentifier();
        v34 = [(HMDSoftwareUpdateDocumentationAsset *)v31 archiveURL];
        v35 = [v34 path];
        *(_DWORD *)buf = 138543874;
        v50 = v33;
        __int16 v51 = 2112;
        v52 = v35;
        __int16 v53 = 2112;
        id v54 = v29;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to move downloaded asset to '%@' with error: %@. Removing existing assets at that path.", buf, 0x20u);
      }
      v36 = [(HMDSoftwareUpdateDocumentationAsset *)v31 fileManager];
      v37 = [(HMDSoftwareUpdateDocumentationAsset *)v31 archiveURL];
      id v47 = v29;
      char v38 = [v36 removeItemAtURL:v37 error:&v47];
      id v25 = v47;

      id v8 = v46;
      if ((v38 & 1) == 0)
      {
        v39 = (void *)MEMORY[0x230FBD990]();
        v40 = v31;
        v41 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v42 = HMFGetLogIdentifier();
          v43 = [(HMDSoftwareUpdateDocumentationAsset *)v40 archiveURL];
          [v43 path];
          v44 = v45 = v39;
          *(_DWORD *)buf = 138543874;
          v50 = v42;
          __int16 v51 = 2112;
          v52 = v44;
          __int16 v53 = 2112;
          id v54 = v25;
          _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove existing asset at url '%@' with error: %@.", buf, 0x20u);

          v39 = v45;
          id v8 = v46;
        }
      }
      [(HMDSoftwareUpdateDocumentationAsset *)v31 cancelDownload];
      [(HMDSoftwareUpdateDocumentationAsset *)v31 increaseDownloadRetryCount];
    }
  }
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = (void *)MEMORY[0x230FBD990]();
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
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Download progress: %.1f%%", (uint8_t *)&v18, 0x16u);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      int v15 = 138543618;
      float v16 = v14;
      __int16 v17 = 2112;
      id v18 = v10;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to download asset with error: %@", (uint8_t *)&v15, 0x16u);
    }
    [(HMDSoftwareUpdateDocumentationAsset *)v12 setState:0];
    [(HMDSoftwareUpdateDocumentationAsset *)v12 increaseDownloadRetryCount];
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(HMDSoftwareUpdateDocumentationAsset *)self identifier];
  [v6 encodeObject:v4 forKey:@"HM.identifier"];

  v5 = [(HMDSoftwareUpdateDocumentationAsset *)self metadata];
  [v6 encodeObject:v5 forKey:@"HM.metadata"];

  objc_msgSend(v6, "encodeBool:forKey:", -[HMDSoftwareUpdateDocumentationAsset shouldAutomaticallyCache](self, "shouldAutomaticallyCache"), @"HM.shouldCache");
  objc_msgSend(v6, "encodeInteger:forKey:", -[HMDSoftwareUpdateDocumentationAsset state](self, "state"), @"HM.state");
}

- (HMDSoftwareUpdateDocumentationAsset)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.metadata"];
  id v6 = [(HMDSoftwareUpdateDocumentationAsset *)self initWithDocumentationMetadata:v5];
  if (v6)
  {
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.identifier"];
    identifier = v6->_identifier;
    v6->_identifier = (NSUUID *)v7;

    v6->_shouldAutomaticallyCache = [v4 decodeBoolForKey:@"HM.shouldCache"];
    v6->_state = [v4 decodeIntegerForKey:@"HM.state"];
  }

  return v6;
}

- (id)logIdentifier
{
  v2 = [(HMDSoftwareUpdateDocumentationAsset *)self identifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)finishUnarchive
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__HMDSoftwareUpdateDocumentationAsset_finishUnarchive__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __54__HMDSoftwareUpdateDocumentationAsset_finishUnarchive__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  BOOL v2 = [*(id *)(a1 + 32) state] == 3;
  v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = *(id *)(a1 + 32);
  v5 = HMFGetOSLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v6)
    {
      uint64_t v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v14 = v7;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Finishing unarchive", buf, 0xCu);
    }
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    id v8 = [*(id *)(a1 + 32) extractor];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __54__HMDSoftwareUpdateDocumentationAsset_finishUnarchive__block_invoke_188;
    v11[3] = &unk_264A2DE60;
    objc_copyWeak(&v12, (id *)buf);
    [v8 finishStreamWithCompletionBlock:v11];

    id v9 = [*(id *)(a1 + 32) archivedFileStream];
    [v9 close];

    [*(id *)(a1 + 32) setArchivedFileStream:0];
    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v6)
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v14 = v10;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to finish unarchive, not currently unarchiving", buf, 0xCu);
    }
  }
}

void __54__HMDSoftwareUpdateDocumentationAsset_finishUnarchive__block_invoke_188(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = v3;
  if (v4)
  {
    BOOL v6 = v4[2];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = ____handleFinishedUnarchive_block_invoke;
    v7[3] = &unk_264A2F820;
    id v8 = v4;
    id v9 = v5;
    dispatch_async(v6, v7);
  }
}

- (void)cancelUnarchive
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__HMDSoftwareUpdateDocumentationAsset_cancelUnarchive__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __54__HMDSoftwareUpdateDocumentationAsset_cancelUnarchive__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  BOOL v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v17 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Cancelling unarchive", buf, 0xCu);
  }
  [*(id *)(a1 + 32) setExtractor:0];
  BOOL v6 = [*(id *)(a1 + 32) archivedFileStream];
  [v6 close];

  [*(id *)(a1 + 32) setArchivedFileStream:0];
  uint64_t v7 = [*(id *)(a1 + 32) fileManager];
  id v8 = [*(id *)(a1 + 32) bundleURL];
  id v15 = 0;
  char v9 = [v7 removeItemAtURL:v8 error:&v15];
  id v10 = v15;

  if ((v9 & 1) == 0)
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = *(id *)(a1 + 32);
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v17 = v14;
      __int16 v18 = 2112;
      id v19 = v10;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Failed to remove bundle with error: %@", buf, 0x16u);
    }
  }
  [*(id *)(a1 + 32) setState:2];
}

- (void)startUnarchive
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__HMDSoftwareUpdateDocumentationAsset_startUnarchive__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __53__HMDSoftwareUpdateDocumentationAsset_startUnarchive__block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  BOOL v2 = [*(id *)(a1 + 32) state] == 2;
  id v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = *(id *)(a1 + 32);
  id v5 = HMFGetOSLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v6)
    {
      uint64_t v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v43 = v7;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Starting unarchive", buf, 0xCu);
    }
    [*(id *)(a1 + 32) setState:3];
    id v8 = (void *)MEMORY[0x263F7BDD8];
    char v9 = [*(id *)(a1 + 32) archiveURL];
    id v10 = [*(id *)(a1 + 32) metadata];
    id v11 = [v10 digest];
    id v12 = [*(id *)(a1 + 32) fileManager];
    uint64_t v13 = [v8 optionsForArchiveURL:v9 digest:v11 fileManager:v12];

    if (v13)
    {
      v14 = (void *)MEMORY[0x263EFF950];
      id v15 = [*(id *)(a1 + 32) archiveURL];
      float v16 = [v14 inputStreamWithURL:v15];

      if (v16)
      {
        __int16 v17 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 32) setArchivedFileStream:v16]);
        id v18 = *(id *)(a1 + 32);
        id v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          uint64_t v20 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v43 = v20;
          __int16 v44 = 2112;
          v45 = v13;
          _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Starting extraction using options: %@", buf, 0x16u);
        }
        uint64_t v22 = *(void **)(a1 + 32);
        double v21 = (id *)(a1 + 32);
        v23 = [v22 extractorFactory];
        v24 = [*v21 bundleURL];
        id v25 = [v24 path];
        v26 = ((void (**)(void, void *, void *))v23)[2](v23, v25, v13);

        [*v21 setExtractor:v26];
        objc_initWeak((id *)buf, *v21);
        v27 = [*v21 bundleURL];
        char v28 = [v27 path];
        v40[0] = MEMORY[0x263EF8330];
        v40[1] = 3221225472;
        v40[2] = __53__HMDSoftwareUpdateDocumentationAsset_startUnarchive__block_invoke_186;
        v40[3] = &unk_264A23688;
        objc_copyWeak(&v41, (id *)buf);
        [v26 prepareForExtractionToPath:v28 completionBlock:v40];

        objc_destroyWeak(&v41);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v36 = (void *)MEMORY[0x230FBD990]();
        id v37 = *(id *)(a1 + 32);
        char v38 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v39 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v43 = v39;
          _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_ERROR, "%{public}@Failed to create input stream", buf, 0xCu);
        }
      }
    }
    else
    {
      v30 = (void *)MEMORY[0x230FBD990]();
      id v31 = *(id *)(a1 + 32);
      v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        v33 = HMFGetLogIdentifier();
        v34 = [*(id *)(a1 + 32) metadata];
        v35 = [v34 digest];
        *(_DWORD *)buf = 138543618;
        v43 = v33;
        __int16 v44 = 2112;
        v45 = v35;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_INFO, "%{public}@Failed to create validation options for unarchiving with digest: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    if (v6)
    {
      id v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v43 = v29;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to unarchive, asset is not downloaded", buf, 0xCu);
    }
  }
}

void __53__HMDSoftwareUpdateDocumentationAsset_startUnarchive__block_invoke_186(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = v4;
  uint64_t v7 = v6;
  if (v5)
  {
    id v8 = v5[2];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ____handleStartedUnarchive_block_invoke;
    v9[3] = &unk_264A2F820;
    id v10 = v6;
    id v11 = v5;
    dispatch_async(v8, v9);
  }
}

- (void)finishDownload
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__HMDSoftwareUpdateDocumentationAsset_finishDownload__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __53__HMDSoftwareUpdateDocumentationAsset_finishDownload__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier();
    int v8 = 138543362;
    char v9 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Finished download", (uint8_t *)&v8, 0xCu);
  }
  id v6 = [*(id *)(a1 + 32) URLSession];
  [v6 invalidateAndCancel];

  [*(id *)(a1 + 32) setURLSession:0];
  return [*(id *)(a1 + 32) setState:2];
}

- (void)cancelDownload
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__HMDSoftwareUpdateDocumentationAsset_cancelDownload__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __53__HMDSoftwareUpdateDocumentationAsset_cancelDownload__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier();
    int v8 = 138543362;
    char v9 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Cancelling download", (uint8_t *)&v8, 0xCu);
  }
  id v6 = [*(id *)(a1 + 32) URLSession];
  [v6 invalidateAndCancel];

  [*(id *)(a1 + 32) setURLSession:0];
  return [*(id *)(a1 + 32) setState:0];
}

- (void)startDownload
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__HMDSoftwareUpdateDocumentationAsset_startDownload__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __52__HMDSoftwareUpdateDocumentationAsset_startDownload__block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) state])
  {
    BOOL v2 = (void *)MEMORY[0x230FBD990]();
    id v3 = *(id *)(a1 + 32);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = HMFGetLogIdentifier();
      int v33 = 138543362;
      v34 = v5;
      id v6 = "%{public}@Unable to download, asset is already downloading or downloaded";
      uint64_t v7 = v4;
      os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
LABEL_16:
      _os_log_impl(&dword_22F52A000, v7, v8, v6, (uint8_t *)&v33, 0xCu);

      goto LABEL_17;
    }
    goto LABEL_17;
  }
  if (([*(id *)(a1 + 32) saveWithError:0] & 1) == 0)
  {
    BOOL v2 = (void *)MEMORY[0x230FBD990]();
    id v3 = *(id *)(a1 + 32);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = HMFGetLogIdentifier();
      int v33 = 138543362;
      v34 = v5;
      id v6 = "%{public}@Failed to save asset";
      uint64_t v7 = v4;
      os_log_type_t v8 = OS_LOG_TYPE_ERROR;
      goto LABEL_16;
    }
LABEL_17:

LABEL_18:
    return;
  }
  char v9 = [*(id *)(a1 + 32) isDownloadPermitted];
  BOOL v2 = (void *)MEMORY[0x230FBD990]();
  id v10 = *(id *)(a1 + 32);
  id v11 = HMFGetOSLogHandle();
  id v12 = v11;
  if ((v9 & 1) == 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      char v28 = HMFGetLogIdentifier();
      int v33 = 138543362;
      v34 = v28;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Not attempting to download documentation now as we are in a backoff", (uint8_t *)&v33, 0xCu);
    }
    goto LABEL_18;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = HMFGetLogIdentifier();
    int v33 = 138543362;
    v34 = v13;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Starting download", (uint8_t *)&v33, 0xCu);
  }
  [*(id *)(a1 + 32) setState:1];
  v14 = [*(id *)(a1 + 32) URLSession];

  if (!v14)
  {
    id v15 = [MEMORY[0x263F08C00] ephemeralSessionConfiguration];
    float v16 = [*(id *)(a1 + 32) URLSessionFactory];
    uint64_t v17 = *(void *)(a1 + 32);
    id v18 = [MEMORY[0x263F08A48] mainQueue];
    id v19 = ((void (**)(void, void *, uint64_t, void *))v16)[2](v16, v15, v17, v18);

    [*(id *)(a1 + 32) setURLSession:v19];
  }
  uint64_t v20 = [*(id *)(a1 + 32) metadata];
  double v21 = [v20 URL];

  if (v21)
  {
    uint64_t v22 = [*(id *)(a1 + 32) URLSession];
    v23 = [v22 downloadTaskWithURL:v21];

    v24 = (void *)MEMORY[0x230FBD990]();
    id v25 = *(id *)(a1 + 32);
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = HMFGetLogIdentifier();
      int v33 = 138543618;
      v34 = v27;
      __int16 v35 = 2112;
      v36 = v23;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Resuming task: %@", (uint8_t *)&v33, 0x16u);
    }
    [v23 resume];
  }
  else
  {
    id v29 = (void *)MEMORY[0x230FBD990]();
    id v30 = *(id *)(a1 + 32);
    id v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = HMFGetLogIdentifier();
      int v33 = 138543362;
      v34 = v32;
      _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@Cannot download software update from nil url", (uint8_t *)&v33, 0xCu);
    }
  }
}

- (BOOL)purgeWithError:(id *)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = (void *)MEMORY[0x230FBD990](self, a2);
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    os_log_type_t v8 = HMFGetLogIdentifier();
    int v13 = 138543362;
    v14 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Purging", (uint8_t *)&v13, 0xCu);
  }
  [(HMDSoftwareUpdateDocumentationAsset *)v6 setShouldAutomaticallyCache:0];
  [(HMDSoftwareUpdateDocumentationAsset *)v6 cancelDownload];
  char v9 = [(HMDSoftwareUpdateDocumentationAsset *)v6 fileManager];
  id v10 = [(HMDSoftwareUpdateDocumentationAsset *)v6 URL];
  char v11 = [v9 removeItemAtURL:v10 error:a3];

  return v11;
}

- (void)startCaching
{
  int64_t v3 = [(HMDSoftwareUpdateDocumentationAsset *)self state];
  if (v3 == 2)
  {
    [(HMDSoftwareUpdateDocumentationAsset *)self setShouldAutomaticallyCache:1];
    [(HMDSoftwareUpdateDocumentationAsset *)self startUnarchive];
  }
  else if (!v3)
  {
    [(HMDSoftwareUpdateDocumentationAsset *)self setShouldAutomaticallyCache:1];
    [(HMDSoftwareUpdateDocumentationAsset *)self startDownload];
  }
}

- (BOOL)saveWithError:(id *)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = [(HMDSoftwareUpdateDocumentationAsset *)self fileManager];
  id v6 = [(HMDSoftwareUpdateDocumentationAsset *)self URL];
  id v26 = 0;
  char v7 = [v5 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:&v26];
  id v8 = v26;

  if (v7)
  {
    char v9 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:a3];
    if (v9)
    {
      id v10 = [(HMDSoftwareUpdateDocumentationAsset *)self metadataURL];
      BOOL v11 = 1;
      char v12 = [v9 writeToURL:v10 atomically:1];

      if (v12)
      {
LABEL_16:

        goto LABEL_17;
      }
      int v13 = (void *)MEMORY[0x230FBD990]();
      v14 = self;
      uint64_t v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        float v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        char v28 = v16;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to archive asset metadata (write)", buf, 0xCu);
      }
      if (a3)
      {
        [MEMORY[0x263F087E8] hmErrorWithCode:52];
        BOOL v11 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
    }
    else
    {
      double v21 = (void *)MEMORY[0x230FBD990]();
      uint64_t v22 = self;
      v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        char v28 = v24;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to archive asset metadata (encode)", buf, 0xCu);
      }
    }
    BOOL v11 = 0;
    goto LABEL_16;
  }
  uint64_t v17 = (void *)MEMORY[0x230FBD990]();
  id v18 = self;
  id v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    uint64_t v20 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    char v28 = v20;
    __int16 v29 = 2112;
    id v30 = v8;
    _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to create asset directory with error: %@", buf, 0x16u);
  }
  BOOL v11 = 0;
  if (a3) {
    *a3 = v8;
  }
LABEL_17:

  return v11;
}

- (void)resetDownloadRetryCount
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [MEMORY[0x263EFF910] distantPast];
  [(HMDSoftwareUpdateDocumentationAsset *)self setNextPermittedDownloadDate:v4];

  [(HMDSoftwareUpdateDocumentationAsset *)self setDownloadRetryCount:0];
  os_unfair_lock_unlock(p_lock);
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  char v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    id v10 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Resetting download retry count", (uint8_t *)&v9, 0xCu);
  }
}

- (void)increaseDownloadRetryCount
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t v4 = [(HMDSoftwareUpdateDocumentationAsset *)self downloadRetryCount];
  if (v4 >= [&unk_26E474368 count]) {
    uint64_t v5 = [&unk_26E474368 count] - 1;
  }
  else {
    uint64_t v5 = [(HMDSoftwareUpdateDocumentationAsset *)self downloadRetryCount];
  }
  id v6 = [&unk_26E474368 objectAtIndexedSubscript:v5];
  char v7 = [(HMDSoftwareUpdateDocumentationAsset *)self dateWithTimeIntervalSinceNowFactory];
  [v6 doubleValue];
  id v8 = v7[2](v7);
  [(HMDSoftwareUpdateDocumentationAsset *)self setNextPermittedDownloadDate:v8];

  int v9 = [(HMDSoftwareUpdateDocumentationAsset *)self nextPermittedDownloadDate];
  [(HMDSoftwareUpdateDocumentationAsset *)self setDownloadRetryCount:[(HMDSoftwareUpdateDocumentationAsset *)self downloadRetryCount] + 1];
  unint64_t v10 = [(HMDSoftwareUpdateDocumentationAsset *)self downloadRetryCount];

  os_unfair_lock_unlock(p_lock);
  uint64_t v11 = (void *)MEMORY[0x230FBD990]();
  char v12 = self;
  int v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    int v15 = 138543874;
    float v16 = v14;
    __int16 v17 = 2048;
    unint64_t v18 = v10;
    __int16 v19 = 2112;
    uint64_t v20 = v9;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Increased download retry count to: %lu next retry is at: %@", (uint8_t *)&v15, 0x20u);
  }
}

- (BOOL)isDownloadPermitted
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t v4 = [(HMDSoftwareUpdateDocumentationAsset *)self nextPermittedDownloadDate];
  uint64_t v5 = [(HMDSoftwareUpdateDocumentationAsset *)self dateWithTimeIntervalSinceNowFactory];
  id v6 = v5[2](0.0);
  BOOL v7 = [v4 compare:v6] != 1;

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (HMSoftwareUpdateDocumentation)documentation
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  int64_t v3 = (void *)MEMORY[0x230FBD990](self, a2);
  unint64_t v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = HMFGetLogIdentifier();
    int v21 = 138543362;
    uint64_t v22 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Parsing documentation", (uint8_t *)&v21, 0xCu);
  }
  uint64_t v7 = [(HMDSoftwareUpdateDocumentationAsset *)v4 state];
  id v8 = (void *)MEMORY[0x230FBD990]();
  if (v7 == 4)
  {
    int v9 = (void *)MEMORY[0x263F086E0];
    unint64_t v10 = [(HMDSoftwareUpdateDocumentationAsset *)v4 bundleURL];
    uint64_t v11 = [v9 bundleWithURL:v10];

    if (!v11 || (uint64_t v12 = [objc_alloc(MEMORY[0x263F0E7E8]) initWithBundle:v11]) == 0)
    {
      int v13 = (void *)MEMORY[0x230FBD990]();
      v14 = v4;
      int v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        float v16 = HMFGetLogIdentifier();
        int v21 = 138543362;
        uint64_t v22 = v16;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Failed to find documentation bundle", (uint8_t *)&v21, 0xCu);
      }
      uint64_t v12 = [objc_alloc(MEMORY[0x263F0E7E8]) initWithAsset:v14];
    }
    __int16 v17 = (void *)v12;
  }
  else
  {
    uint64_t v11 = v4;
    unint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      __int16 v19 = HMFGetLogIdentifier();
      int v21 = 138543362;
      uint64_t v22 = v19;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Documentation not cached", (uint8_t *)&v21, 0xCu);
    }
    __int16 v17 = 0;
  }

  return (HMSoftwareUpdateDocumentation *)v17;
}

- (NSURL)bundleURL
{
  BOOL v2 = [(HMDSoftwareUpdateDocumentationAsset *)self URL];
  int64_t v3 = [v2 URLByAppendingPathComponent:@"Asset"];

  return (NSURL *)v3;
}

- (id)archiveURL
{
  BOOL v2 = [(HMDSoftwareUpdateDocumentationAsset *)self URL];
  int64_t v3 = [v2 URLByAppendingPathComponent:@"Asset.zip"];

  return v3;
}

- (id)metadataURL
{
  BOOL v2 = [(HMDSoftwareUpdateDocumentationAsset *)self URL];
  int64_t v3 = [v2 URLByAppendingPathComponent:@"metadata.plist"];

  return v3;
}

- (NSURL)URL
{
  int64_t v3 = +[HMDSoftwareUpdateDocumentationAsset assetDirectoryURL];
  unint64_t v4 = [(HMDSoftwareUpdateDocumentationAsset *)self identifier];
  uint64_t v5 = [v4 UUIDString];
  id v6 = [v3 URLByAppendingPathComponent:v5];

  return (NSURL *)v6;
}

- (void)setState:(int64_t)a3
{
  v12[1] = *MEMORY[0x263EF8340];
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
    id v6 = [(HMDSoftwareUpdateDocumentationAsset *)self notificationCenter];
    uint64_t v11 = @"state";
    uint64_t v7 = [NSNumber numberWithInteger:a3];
    v12[0] = v7;
    id v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    [v6 postNotificationName:@"HMDSoftwareUpdateDocumentationAssetStateUpdatedNotification" object:self userInfo:v8];

    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__HMDSoftwareUpdateDocumentationAsset_setState___block_invoke;
    block[3] = &unk_264A2C6A0;
    block[4] = self;
    void block[5] = a3;
    dispatch_async(queue, block);
  }
}

uint64_t __48__HMDSoftwareUpdateDocumentationAsset_setState___block_invoke(uint64_t result)
{
  unint64_t v1 = *(void *)(result + 40);
  BOOL v2 = v1 > 4;
  uint64_t v3 = (1 << v1) & 0x15;
  if (!v2 && v3 != 0) {
    return [*(id *)(result + 32) saveWithError:0];
  }
  return result;
}

- (int64_t)state
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (void)setShouldAutomaticallyCache:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_shouldAutomaticallyCache == v3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_shouldAutomaticallyCache = v3;
    os_unfair_lock_unlock(p_lock);
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __67__HMDSoftwareUpdateDocumentationAsset_setShouldAutomaticallyCache___block_invoke;
    block[3] = &unk_264A2F7F8;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

uint64_t __67__HMDSoftwareUpdateDocumentationAsset_setShouldAutomaticallyCache___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) saveWithError:0];
}

- (BOOL)shouldAutomaticallyCache
{
  BOOL v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_shouldAutomaticallyCache;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (HMDSoftwareUpdateDocumentationAsset *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    id v6 = v5;
    if (v6)
    {
      uint64_t v7 = [(HMDSoftwareUpdateDocumentationAsset *)self metadata];
      id v8 = [(HMDSoftwareUpdateDocumentationAsset *)v6 metadata];
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
  BOOL v2 = [(HMDSoftwareUpdateDocumentationAsset *)self metadata];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)propertyDescription
{
  unint64_t v3 = NSString;
  unint64_t v4 = [(HMDSoftwareUpdateDocumentationAsset *)self identifier];
  uint64_t v5 = [v4 UUIDString];
  unint64_t v6 = [(HMDSoftwareUpdateDocumentationAsset *)self state];
  if (v6 > 4) {
    uint64_t v7 = @"unknown";
  }
  else {
    uint64_t v7 = off_264A23730[v6];
  }
  id v8 = [(HMDSoftwareUpdateDocumentationAsset *)self metadata];
  char v9 = [v3 stringWithFormat:@", Identifier = %@, State = %@, Metadata = %@", v5, v7, v8];

  return (NSString *)v9;
}

- (NSString)shortDescription
{
  unint64_t v3 = NSString;
  unint64_t v4 = [(id)objc_opt_class() shortDescription];
  uint64_t v5 = [(HMDSoftwareUpdateDocumentationAsset *)self identifier];
  unint64_t v6 = [v5 UUIDString];
  uint64_t v7 = [v3 stringWithFormat:@"%@ %@", v4, v6];

  return (NSString *)v7;
}

- (HMDSoftwareUpdateDocumentationAsset)initWithDocumentationMetadata:(id)a3
{
  unint64_t v4 = (void *)MEMORY[0x263F08A00];
  id v5 = a3;
  unint64_t v6 = [v4 defaultCenter];
  uint64_t v7 = objc_alloc_init(HMDFileManager);
  id v8 = [(HMDSoftwareUpdateDocumentationAsset *)self initWithDocumentationMetadata:v5 dateWithTimeIntervalSinceNowFactory:&__block_literal_global_163_173685 URLSessionFactory:&__block_literal_global_166_173686 extractorFactory:&__block_literal_global_170 notificationCenter:v6 fileManager:v7];

  return v8;
}

id __69__HMDSoftwareUpdateDocumentationAsset_initWithDocumentationMetadata___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  unint64_t v4 = (objc_class *)MEMORY[0x263F7BDD8];
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = (void *)[[v4 alloc] initWithPath:v6 options:v5];

  return v7;
}

uint64_t __69__HMDSoftwareUpdateDocumentationAsset_initWithDocumentationMetadata___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [MEMORY[0x263F08BF8] sessionWithConfiguration:a2 delegate:a3 delegateQueue:a4];
}

uint64_t __69__HMDSoftwareUpdateDocumentationAsset_initWithDocumentationMetadata___block_invoke()
{
  return objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceNow:");
}

- (HMDSoftwareUpdateDocumentationAsset)initWithDocumentationMetadata:(id)a3 dateWithTimeIntervalSinceNowFactory:(id)a4 URLSessionFactory:(id)a5 extractorFactory:(id)a6 notificationCenter:(id)a7 fileManager:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  if (!v15)
  {
    v39 = (HMDSoftwareUpdateDocumentationAsset *)_HMFPreconditionFailure();
    [(HMDSoftwareUpdateDocumentationAsset *)v39 init];
  }
  int v21 = v20;
  v41.receiver = self;
  v41.super_class = (Class)HMDSoftwareUpdateDocumentationAsset;
  uint64_t v22 = [(HMDSoftwareUpdateDocumentationAsset *)&v41 init];
  if (v22)
  {
    uint64_t v23 = [MEMORY[0x263F08C38] UUID];
    identifier = v22->_identifier;
    v22->_identifier = (NSUUID *)v23;

    uint64_t v25 = [MEMORY[0x263EFF910] distantPast];
    nextPermittedDownloadDate = v22->_nextPermittedDownloadDate;
    v22->_nextPermittedDownloadDate = (NSDate *)v25;

    objc_storeStrong((id *)&v22->_fileManager, a8);
    v22->_downloadRetryCount = 0;
    v27 = _Block_copy(v16);
    id dateWithTimeIntervalSinceNowFactory = v22->_dateWithTimeIntervalSinceNowFactory;
    v22->_id dateWithTimeIntervalSinceNowFactory = v27;

    __int16 v29 = _Block_copy(v17);
    id URLSessionFactory = v22->_URLSessionFactory;
    v22->_id URLSessionFactory = v29;

    uint64_t v31 = _Block_copy(v18);
    id extractorFactory = v22->_extractorFactory;
    v22->_id extractorFactory = v31;

    objc_storeStrong((id *)&v22->_notificationCenter, a7);
    objc_storeStrong((id *)&v22->_metadata, a3);
    HMDispatchQueueNameString();
    id v33 = objc_claimAutoreleasedReturnValue();
    v34 = (const char *)[v33 UTF8String];
    __int16 v35 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v36 = dispatch_queue_create(v34, v35);
    queue = v22->_queue;
    v22->_queue = (OS_dispatch_queue *)v36;
  }
  return v22;
}

- (HMDSoftwareUpdateDocumentationAsset)init
{
  BOOL v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  unint64_t v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t74_173711 != -1) {
    dispatch_once(&logCategory__hmf_once_t74_173711, &__block_literal_global_191);
  }
  BOOL v2 = (void *)logCategory__hmf_once_v75_173712;
  return v2;
}

void __50__HMDSoftwareUpdateDocumentationAsset_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  unint64_t v1 = (void *)logCategory__hmf_once_v75_173712;
  logCategory__hmf_once_v75_173712 = v0;
}

+ (id)assetWithURL:(id)a3 fileManager:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [v6 URLByAppendingPathComponent:@"metadata.plist"];
    char v9 = [v7 dataWithContentsOfURL:v8 options:0 error:0];

    if (v9)
    {
      id v36 = 0;
      unint64_t v10 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:&v36];
      uint64_t v11 = (__CFString *)v36;
      uint64_t v12 = [v10 setFileManager:v7];
      if (v10)
      {
        if ([v10 state] == 4
          && ([v10 bundleURL],
              int v13 = objc_claimAutoreleasedReturnValue(),
              [v13 path],
              v14 = objc_claimAutoreleasedReturnValue(),
              char v15 = [v7 fileExistsAtPath:v14],
              v14,
              v13,
              (v15 & 1) != 0))
        {
          uint64_t v16 = 4;
        }
        else if ([v10 state] < 2)
        {
          uint64_t v16 = 0;
        }
        else
        {
          uint64_t v22 = [v10 archiveURL];
          uint64_t v23 = [v22 path];
          int v24 = [v7 fileExistsAtPath:v23];

          if (v24) {
            uint64_t v16 = 2;
          }
          else {
            uint64_t v16 = 0;
          }
        }
        if (v16 != [v10 state])
        {
          __int16 v29 = (void *)MEMORY[0x230FBD990]();
          id v30 = a1;
          uint64_t v31 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v32 = HMFGetLogIdentifier();
            id v33 = off_264A23708[v16];
            *(_DWORD *)buf = 138543618;
            char v38 = v32;
            __int16 v39 = 2112;
            SEL v40 = v33;
            _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Setting state to: %@", buf, 0x16u);
          }
          [v10 setState:v16];
        }
        id v34 = v10;
      }
      else
      {
        uint64_t v25 = (void *)MEMORY[0x230FBD990](v12);
        id v26 = a1;
        v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          char v28 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          char v38 = v28;
          __int16 v39 = 2112;
          SEL v40 = v11;
          _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive software update documentation asset from serialized object data: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      id v17 = (void *)MEMORY[0x230FBD990]();
      id v18 = a1;
      id v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v20 = HMFGetLogIdentifier();
        int v21 = [v6 path];
        *(_DWORD *)buf = 138543618;
        char v38 = v20;
        __int16 v39 = 2112;
        SEL v40 = v21;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to find metadata at path: %@", buf, 0x16u);
      }
      unint64_t v10 = 0;
    }
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

+ (NSURL)assetDirectoryURL
{
  if (assetDirectoryURL_onceToken != -1) {
    dispatch_once(&assetDirectoryURL_onceToken, &__block_literal_global_148_173720);
  }
  BOOL v2 = (void *)assetDirectoryURL_assetDirectoryURL;
  return (NSURL *)v2;
}

void __56__HMDSoftwareUpdateDocumentationAsset_assetDirectoryURL__block_invoke()
{
  id v3 = [MEMORY[0x263F42510] defaultCache];
  uint64_t v0 = [v3 URL];
  uint64_t v1 = [v0 URLByAppendingPathComponent:@"SoftwareUpdateDocumentation"];
  BOOL v2 = (void *)assetDirectoryURL_assetDirectoryURL;
  assetDirectoryURL_assetDirectoryURL = v1;
}

@end