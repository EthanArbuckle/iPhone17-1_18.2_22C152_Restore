@interface HMCameraClipFetchVideoAssetContextOperation
+ (id)logCategory;
- (HMCameraClip)clip;
- (HMCameraClipFetchAssetContextOperationDataSource)dataSource;
- (HMCameraClipFetchVideoAssetContextOperation)initWithClipManager:(id)a3 clip:(id)a4;
- (HMCameraClipFetchVideoAssetContextOperation)initWithClipManager:(id)a3 clip:(id)a4 dataSource:(id)a5;
- (HMCameraClipManager)clipManager;
- (NSURL)clipDestinationFileURL;
- (NSURL)hlsPlaylistDestinationFileURL;
- (_NSRange)videoDataSegmentsRange;
- (id)decryptData:(id)a3;
- (id)description;
- (id)downloadProgressHandler;
- (id)downloadVideoAsset:(id)a3;
- (id)downloadVideoSegments:(id)a3 forDataTask:(id)a4 andAppendToOutputStream:(id)a5;
- (id)fetchVideoAssetContext;
- (id)fetchVideoAssetContextCompletionBlock;
- (id)logIdentifier;
- (id)videoSegmentsToDownload;
- (id)writeHLSPlaylistForVideoAssetContext:(id)a3;
- (unint64_t)videoSegmentsDownloadBatchSize;
- (void)cancelWithError:(id)a3;
- (void)finishWithVideoAssetContext:(id)a3;
- (void)main;
- (void)setClipDestinationFileURL:(id)a3;
- (void)setDownloadProgressHandler:(id)a3;
- (void)setFetchVideoAssetContextCompletionBlock:(id)a3;
- (void)setHlsPlaylistDestinationFileURL:(id)a3;
- (void)setVideoDataSegmentsRange:(_NSRange)a3;
- (void)setVideoSegmentsDownloadBatchSize:(unint64_t)a3;
- (void)updateDownloadProgressToPercentageComplete:(unint64_t)a3;
@end

@implementation HMCameraClipFetchVideoAssetContextOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong(&self->_fetchVideoAssetContextCompletionBlock, 0);
  objc_storeStrong(&self->_downloadProgressHandler, 0);
  objc_storeStrong((id *)&self->_hlsPlaylistDestinationFileURL, 0);
  objc_storeStrong((id *)&self->_clipDestinationFileURL, 0);
  objc_storeStrong((id *)&self->_clip, 0);

  objc_storeStrong((id *)&self->_clipManager, 0);
}

- (HMCameraClipFetchAssetContextOperationDataSource)dataSource
{
  return (HMCameraClipFetchAssetContextOperationDataSource *)objc_getProperty(self, a2, 368, 1);
}

- (void)setFetchVideoAssetContextCompletionBlock:(id)a3
{
}

- (id)fetchVideoAssetContextCompletionBlock
{
  return objc_getProperty(self, a2, 360, 1);
}

- (void)setDownloadProgressHandler:(id)a3
{
}

- (id)downloadProgressHandler
{
  return objc_getProperty(self, a2, 352, 1);
}

- (void)setHlsPlaylistDestinationFileURL:(id)a3
{
}

- (NSURL)hlsPlaylistDestinationFileURL
{
  return (NSURL *)objc_getProperty(self, a2, 344, 1);
}

- (void)setClipDestinationFileURL:(id)a3
{
}

- (NSURL)clipDestinationFileURL
{
  return (NSURL *)objc_getProperty(self, a2, 336, 1);
}

- (void)setVideoSegmentsDownloadBatchSize:(unint64_t)a3
{
  self->_videoSegmentsDownloadBatchSize = a3;
}

- (unint64_t)videoSegmentsDownloadBatchSize
{
  return self->_videoSegmentsDownloadBatchSize;
}

- (void)setVideoDataSegmentsRange:(_NSRange)a3
{
  _NSRange v3 = a3;
  objc_copyStruct(&self->_videoDataSegmentsRange, &v3, 16, 1, 0);
}

- (_NSRange)videoDataSegmentsRange
{
  objc_copyStruct(v4, &self->_videoDataSegmentsRange, 16, 1, 0);
  NSUInteger v2 = v4[0];
  NSUInteger v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (HMCameraClip)clip
{
  return (HMCameraClip *)objc_getProperty(self, a2, 320, 1);
}

- (HMCameraClipManager)clipManager
{
  return (HMCameraClipManager *)objc_getProperty(self, a2, 312, 1);
}

- (id)logIdentifier
{
  NSUInteger v3 = NSString;
  v4 = [(HMCameraClipFetchVideoAssetContextOperation *)self name];
  v5 = [(HMCameraClipFetchVideoAssetContextOperation *)self clip];
  v6 = [v5 uniqueIdentifier];
  v7 = [v6 UUIDString];
  v8 = [v3 stringWithFormat:@"%@/%@", v4, v7];

  return v8;
}

- (id)writeHLSPlaylistForVideoAssetContext:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HMCameraClipFetchVideoAssetContextOperation *)self isCancelled])
  {
    v5 = (void *)MEMORY[0x19F3A64A0]();
    v6 = self;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v30 = v8;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Skipping HLS playlist write because we are cancelled", buf, 0xCu);
    }
    v9 = (void *)MEMORY[0x1E4F7A0D8];
    v10 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:12];
    v11 = [v9 futureWithError:v10];
  }
  else
  {
    v10 = [(HMCameraClipFetchVideoAssetContextOperation *)self hlsPlaylistDestinationFileURL];
    v12 = (void *)MEMORY[0x19F3A64A0]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    v15 = v14;
    if (v10)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v30 = v16;
        __int16 v31 = 2112;
        v32 = v10;
        _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_INFO, "%{public}@Saving video HLS playlist to %@", buf, 0x16u);
      }
      v17 = [(HMCameraClipFetchVideoAssetContextOperation *)v13 dataSource];
      v18 = [v4 hlsPlaylist];
      id v28 = 0;
      char v19 = [v17 writeData:v18 toFileURL:v10 error:&v28];
      id v20 = v28;

      if (v19)
      {
        uint64_t v21 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
      }
      else
      {
        v23 = (void *)MEMORY[0x19F3A64A0]();
        v24 = v13;
        v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v26 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v30 = v26;
          __int16 v31 = 2112;
          v32 = v10;
          __int16 v33 = 2112;
          id v34 = v20;
          _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to save video HLS playlist to %@: %@", buf, 0x20u);
        }
        uint64_t v21 = [MEMORY[0x1E4F7A0D8] futureWithError:v20];
      }
      v11 = (void *)v21;
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v30 = v22;
        _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Skipping HLS playlist write because no destination file URL was specified", buf, 0xCu);
      }
      v11 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
      v10 = 0;
    }
  }

  return v11;
}

- (id)decryptData:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [[HMCameraClipEncryptedDataContext alloc] initWithDataRepresentation:v4];
  v6 = [HMCameraClipDecryptionManager alloc];
  v7 = [(HMCameraClipFetchVideoAssetContextOperation *)self clip];
  v8 = [v7 encryptionKey];
  v9 = [(HMCameraClipDecryptionManager *)v6 initWithKey:v8];

  v10 = (void *)MEMORY[0x19F3A64A0]();
  v11 = self;
  v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = HMFGetLogIdentifier();
    int v17 = 138543874;
    v18 = v13;
    __int16 v19 = 2048;
    uint64_t v20 = [v4 length];
    __int16 v21 = 2112;
    v22 = v5;
    _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@Decrypting video segment data of length %lu using encrypted data context %@", (uint8_t *)&v17, 0x20u);
  }
  v14 = [(HMCameraClipFetchVideoAssetContextOperation *)v11 dataSource];
  v15 = [v14 dataFromEncryptedDataContext:v5 usingDecryptionManager:v9];

  return v15;
}

- (id)downloadVideoSegments:(id)a3 forDataTask:(id)a4 andAppendToOutputStream:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(HMCameraClipFetchVideoAssetContextOperation *)self isCancelled];
  v12 = (void *)MEMORY[0x19F3A64A0]();
  v13 = self;
  v14 = HMFGetOSLogHandle();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
  if (v11)
  {
    if (v15)
    {
      v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v47 = v16;
      __int16 v48 = 2112;
      id v49 = v8;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_INFO, "%{public}@Skipping video data download for segments because we are cancelled: %@", buf, 0x16u);
    }
    int v17 = (void *)MEMORY[0x1E4F7A0D8];
    v18 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:12];
    __int16 v19 = [v17 futureWithError:v18];
  }
  else
  {
    v36 = v9;
    if (v15)
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v47 = v20;
      __int16 v48 = 2112;
      id v49 = v8;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_INFO, "%{public}@Downloading video segments: %@", buf, 0x16u);
    }
    v18 = [v8 firstObject];
    uint64_t v21 = [v18 byteOffset];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v22 = v8;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v42 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          if ([v27 byteOffset] != v21) {
            _HMFPreconditionFailure();
          }
          uint64_t v28 = [v27 byteOffset];
          uint64_t v21 = [v27 byteLength] + v28;
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v24);
    }

    uint64_t v29 = [v18 byteOffset];
    v30 = [v22 lastObject];
    uint64_t v31 = [v30 byteOffset];
    v32 = [v22 lastObject];
    uint64_t v33 = v31 - v29 + [v32 byteLength];

    id v9 = v36;
    id v34 = objc_msgSend(v36, "downloadDataForByteRange:", v29, v33);
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __105__HMCameraClipFetchVideoAssetContextOperation_downloadVideoSegments_forDataTask_andAppendToOutputStream___block_invoke;
    v37[3] = &unk_1E5940530;
    v37[4] = v13;
    id v38 = v22;
    uint64_t v40 = v29;
    id v39 = v10;
    __int16 v19 = [v34 flatMap:v37];
  }

  return v19;
}

id __105__HMCameraClipFetchVideoAssetContextOperation_downloadVideoSegments_forDataTask_andAppendToOutputStream___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) isCancelled])
  {
    id v4 = (void *)MEMORY[0x19F3A64A0]();
    id v5 = *(id *)(a1 + 32);
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v57 = v7;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Skipping video segment data decryption because we are cancelled", buf, 0xCu);
    }
    id v8 = (void *)MEMORY[0x1E4F7A0D8];
    id v9 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:12];
    id v10 = [v8 futureWithError:v9];

    goto LABEL_29;
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v11 = [obj countByEnumeratingWithState:&v52 objects:v66 count:16];
  if (!v11) {
    goto LABEL_17;
  }
  uint64_t v12 = v11;
  uint64_t v50 = *(void *)v53;
  uint64_t v47 = 138543874;
  while (2)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v53 != v50) {
        objc_enumerationMutation(obj);
      }
      v14 = *(void **)(*((void *)&v52 + 1) + 8 * i);
      NSUInteger v15 = objc_msgSend(v14, "byteOffset", v47) - *(void *)(a1 + 56);
      NSUInteger v16 = [v14 byteLength];
      if (v15 + v16 > [v3 length])
      {
        v30 = (void *)MEMORY[0x19F3A64A0]();
        id v31 = *(id *)(a1 + 32);
        v32 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          uint64_t v33 = HMFGetLogIdentifier();
          v69.location = v15;
          v69.length = v16;
          id v34 = NSStringFromRange(v69);
          *(_DWORD *)buf = v47;
          v57 = v33;
          __int16 v58 = 2112;
          uint64_t v59 = (uint64_t)v34;
          __int16 v60 = 2112;
          id v61 = v3;
          _os_log_impl(&dword_19D1A8000, v32, OS_LOG_TYPE_ERROR, "%{public}@Expected video segment range %@ in downloaded data %@ was not found.", buf, 0x20u);
        }
        uint64_t v35 = (void *)MEMORY[0x1E4F7A0D8];
        v18 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:11];
        id v10 = [v35 futureWithError:v18];
        goto LABEL_28;
      }
      id v17 = v3;
      v18 = objc_msgSend(v3, "subdataWithRange:", v15, v16);
      __int16 v19 = [*(id *)(a1 + 32) decryptData:v18];
      uint64_t v20 = (void *)MEMORY[0x19F3A64A0]();
      id v21 = *(id *)(a1 + 32);
      id v22 = HMFGetOSLogHandle();
      uint64_t v23 = v22;
      if (!v19)
      {
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v36 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v57 = v36;
          __int16 v58 = 2112;
          uint64_t v59 = (uint64_t)v14;
          _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to decrypt video segment: %@", buf, 0x16u);
        }
        v37 = (void *)MEMORY[0x1E4F7A0D8];
        id v38 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:11];
        id v10 = [v37 futureWithError:v38];
        id v28 = 0;
LABEL_27:
        id v3 = v17;

LABEL_28:
        goto LABEL_29;
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        uint64_t v24 = HMFGetLogIdentifier();
        uint64_t v25 = [v19 length];
        v26 = *(void **)(a1 + 48);
        *(_DWORD *)buf = v47;
        v57 = v24;
        __int16 v58 = 2048;
        uint64_t v59 = v25;
        __int16 v60 = 2112;
        id v61 = v26;
        _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_INFO, "%{public}@Appending video segment data of length %lu to output stream: %@", buf, 0x20u);
      }
      v27 = *(void **)(a1 + 48);
      id v28 = v19;
      uint64_t v29 = objc_msgSend(v27, "write:maxLength:", objc_msgSend(v28, "bytes"), objc_msgSend(v28, "length"));
      if (v29 != [v28 length])
      {
        id v39 = (void *)MEMORY[0x19F3A64A0]();
        id v40 = *(id *)(a1 + 32);
        long long v41 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          long long v42 = v51 = v39;
          uint64_t v48 = [v28 length];
          long long v43 = *(void **)(a1 + 48);
          long long v44 = [v43 streamError];
          *(_DWORD *)buf = 138544386;
          v57 = v42;
          __int16 v58 = 2048;
          uint64_t v59 = v48;
          __int16 v60 = 2112;
          id v61 = v43;
          __int16 v62 = 2048;
          uint64_t v63 = v29;
          __int16 v64 = 2112;
          v65 = v44;
          _os_log_impl(&dword_19D1A8000, v41, OS_LOG_TYPE_ERROR, "%{public}@Expected to append %lu bytes to %@ but only wrote %lu: %@", buf, 0x34u);

          id v39 = v51;
        }

        v45 = (void *)MEMORY[0x1E4F7A0D8];
        id v38 = [*(id *)(a1 + 48) streamError];
        id v10 = [v45 futureWithError:v38];
        goto LABEL_27;
      }

      id v3 = v17;
    }
    uint64_t v12 = [obj countByEnumeratingWithState:&v52 objects:v66 count:16];
    if (v12) {
      continue;
    }
    break;
  }
LABEL_17:

  id v10 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
LABEL_29:

  return v10;
}

- (id)downloadVideoAsset:(id)a3
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  id v74 = a3;
  if ([(HMCameraClipFetchVideoAssetContextOperation *)self isCancelled])
  {
    id v4 = (void *)MEMORY[0x19F3A64A0]();
    id v5 = self;
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v99 = v7;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Skipping video data download because we are cancelled", buf, 0xCu);
    }
    id v8 = (void *)MEMORY[0x1E4F7A0D8];
    v77 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:12];
    id v9 = [v8 futureWithError:v77];
  }
  else
  {
    v78 = [(HMCameraClipFetchVideoAssetContextOperation *)self clipDestinationFileURL];
    id v10 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    v13 = v12;
    if (v78)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v14 = HMFGetLogIdentifier();
        v108.location = [(HMCameraClipFetchVideoAssetContextOperation *)v11 videoDataSegmentsRange];
        NSUInteger v15 = NSStringFromRange(v108);
        NSUInteger v16 = [(HMCameraClipFetchVideoAssetContextOperation *)v11 clip];
        id v17 = [v16 videoDataSegments];
        *(_DWORD *)buf = 138543874;
        v99 = v14;
        __int16 v100 = 2112;
        uint64_t v101 = (uint64_t)v15;
        __int16 v102 = 2048;
        uint64_t v103 = [v17 count];
        _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Downloading range of %@ from all %lu video data segments", buf, 0x20u);
      }
      v70 = [(HMCameraClipFetchVideoAssetContextOperation *)v11 videoSegmentsToDownload];
      if ([v70 count])
      {
        v18 = [(HMCameraClipFetchVideoAssetContextOperation *)v11 dataSource];
        id v96 = 0;
        v73 = [v18 createTemporaryDirectoryAppropriateForURL:v78 error:&v96];
        id v68 = v96;

        __int16 v19 = (void *)MEMORY[0x19F3A64A0]();
        v79 = v11;
        uint64_t v20 = HMFGetOSLogHandle();
        id v21 = v20;
        if (v73)
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            id v22 = HMFGetLogIdentifier();
            uint64_t v23 = [v70 count];
            uint64_t v24 = [v74 url];
            *(_DWORD *)buf = 138544130;
            v99 = v22;
            __int16 v100 = 2048;
            uint64_t v101 = v23;
            __int16 v102 = 2112;
            uint64_t v103 = (uint64_t)v24;
            __int16 v104 = 2112;
            v105 = v73;
            _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_INFO, "%{public}@Downloading %lu video segment(s) from %@ to directory at URL %@", buf, 0x2Au);
          }
          uint64_t v25 = [(HMCameraClipFetchVideoAssetContextOperation *)v79 dataSource];
          v26 = [v74 url];
          v27 = [v74 requiredHTTPHeaders];
          id v28 = [v25 dataTaskWithURL:v26 httpHeaderFields:v27];

          v95[0] = 0;
          v95[1] = v95;
          v95[2] = 0x2020000000;
          v95[3] = 0;
          v71 = [MEMORY[0x1E4F1CA48] array];
          uint64_t v29 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v70, "count"));
          v30 = [MEMORY[0x1E4F1CA48] array];
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __66__HMCameraClipFetchVideoAssetContextOperation_downloadVideoAsset___block_invoke;
          aBlock[3] = &unk_1E5940490;
          aBlock[4] = v79;
          id v69 = v28;
          id v91 = v69;
          v94 = v95;
          id v31 = v70;
          id v92 = v31;
          id v67 = v29;
          id v93 = v67;
          v32 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
          long long v88 = 0u;
          long long v89 = 0u;
          long long v86 = 0u;
          long long v87 = 0u;
          id obj = v31;
          uint64_t v33 = [obj countByEnumeratingWithState:&v86 objects:v97 count:16];
          if (v33)
          {
            id v34 = 0;
            uint64_t v75 = v33;
            uint64_t v76 = *(void *)v87;
            while (2)
            {
              for (uint64_t i = 0; i != v75; ++i)
              {
                if (*(void *)v87 != v76) {
                  objc_enumerationMutation(obj);
                }
                v36 = *(void **)(*((void *)&v86 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  if ([v30 count])
                  {
                    if (!v34)
                    {
                      _HMFPreconditionFailure();
                      __break(1u);
                    }
                    v32[2](v32, v30, v34);
                    [v30 removeAllObjects];
                  }
                  v37 = [MEMORY[0x1E4F29128] UUID];
                  id v38 = [v37 UUIDString];
                  id v39 = [v73 URLByAppendingPathComponent:v38];
                  id v40 = [v39 URLByAppendingPathExtension:@"mp4"];

                  [v71 addObject:v40];
                  long long v41 = [(HMCameraClipFetchVideoAssetContextOperation *)v79 dataSource];
                  long long v42 = [v41 outputStreamToFileAtURL:v40 shouldAppend:0];

                  long long v43 = (void *)MEMORY[0x19F3A64A0]([v42 open]);
                  long long v44 = v79;
                  HMFGetOSLogHandle();
                  v45 = (id)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
                  {
                    v46 = HMFGetLogIdentifier();
                    *(_DWORD *)buf = 138544130;
                    v99 = v46;
                    __int16 v100 = 2112;
                    uint64_t v101 = (uint64_t)v42;
                    __int16 v102 = 2112;
                    uint64_t v103 = (uint64_t)v40;
                    __int16 v104 = 2112;
                    v105 = v36;
                    _os_log_impl(&dword_19D1A8000, v45, OS_LOG_TYPE_INFO, "%{public}@Opened video file output stream %@ at %@ for init segment %@", buf, 0x2Au);
                  }

                  id v34 = v42;
                }
                if (!v34)
                {
                  v57 = (void *)MEMORY[0x19F3A64A0]();
                  __int16 v58 = v79;
                  HMFGetOSLogHandle();
                  uint64_t v59 = (id)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
                  {
                    __int16 v60 = HMFGetLogIdentifier();
                    *(_DWORD *)buf = 138543618;
                    v99 = v60;
                    __int16 v100 = 2112;
                    uint64_t v101 = (uint64_t)v36;
                    _os_log_impl(&dword_19D1A8000, v59, OS_LOG_TYPE_ERROR, "%{public}@Cannot download video segment that exists before any init segment: %@", buf, 0x16u);
                  }
                  id v61 = (void *)MEMORY[0x1E4F7A0D8];
                  __int16 v62 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
                  id v9 = [v61 futureWithError:v62];
                  id v34 = 0;
                  goto LABEL_49;
                }
                uint64_t v47 = [v30 lastObject];
                uint64_t v48 = v47;
                if (v47)
                {
                  uint64_t v49 = [v47 byteOffset];
                  uint64_t v50 = [v48 byteLength];
                  if (v50 + v49 != [v36 byteOffset])
                  {
                    v32[2](v32, v30, v34);
                    [v30 removeAllObjects];
                  }
                }
                [v30 addObject:v36];
                unint64_t v51 = [v30 count];
                if (v51 >= [(HMCameraClipFetchVideoAssetContextOperation *)v79 videoSegmentsDownloadBatchSize])
                {
                  v32[2](v32, v30, v34);
                  [v30 removeAllObjects];
                }
              }
              uint64_t v75 = [obj countByEnumeratingWithState:&v86 objects:v97 count:16];
              if (v75) {
                continue;
              }
              break;
            }
          }
          else
          {
            id v34 = 0;
          }

          if ([v30 count]) {
            v32[2](v32, v30, v34);
          }
          id obj = [MEMORY[0x1E4F7A0D8] chainFutures:v67];
          v82[0] = MEMORY[0x1E4F143A8];
          v82[1] = 3221225472;
          v82[2] = __66__HMCameraClipFetchVideoAssetContextOperation_downloadVideoAsset___block_invoke_46;
          v82[3] = &unk_1E59404E0;
          id v83 = v71;
          v84 = v79;
          id v85 = v78;
          v65 = [obj flatMap:v82];
          v80[0] = MEMORY[0x1E4F143A8];
          v80[1] = 3221225472;
          v80[2] = __66__HMCameraClipFetchVideoAssetContextOperation_downloadVideoAsset___block_invoke_2_49;
          v80[3] = &unk_1E5940508;
          v80[4] = v79;
          id v81 = v73;
          id v9 = [v65 addCompletionBlock:v80];

          __int16 v62 = v83;
LABEL_49:

          _Block_object_dispose(v95, 8);
        }
        else
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            uint64_t v63 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v99 = v63;
            __int16 v100 = 2112;
            uint64_t v101 = (uint64_t)v68;
            _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to create video files directory: %@", buf, 0x16u);
          }
          __int16 v64 = (void *)MEMORY[0x1E4F7A0D8];
          id v69 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
          id v9 = [v64 futureWithError:v69];
        }
      }
      else
      {
        long long v53 = (void *)MEMORY[0x19F3A64A0]();
        long long v54 = v11;
        long long v55 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          v56 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v99 = v56;
          _os_log_impl(&dword_19D1A8000, v55, OS_LOG_TYPE_INFO, "%{public}@Skipping video data download as no video segments need to be downloaded", buf, 0xCu);
        }
        [(HMCameraClipFetchVideoAssetContextOperation *)v54 updateDownloadProgressToPercentageComplete:100];
        id v9 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
      }
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        long long v52 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v99 = v52;
        _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Skipping video data download because no destination file URL was specified", buf, 0xCu);
      }
      [(HMCameraClipFetchVideoAssetContextOperation *)v11 updateDownloadProgressToPercentageComplete:100];
      id v9 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
    }
  }

  return v9;
}

void __66__HMCameraClipFetchVideoAssetContextOperation_downloadVideoAsset___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v6 = (void *)[a2 copy];
  v7 = (void *)MEMORY[0x1E4F7A0D8];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__HMCameraClipFetchVideoAssetContextOperation_downloadVideoAsset___block_invoke_2;
  v14[3] = &unk_1E5940468;
  id v8 = *(void **)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v6;
  id v17 = v8;
  id v18 = v5;
  uint64_t v20 = *(void *)(a1 + 64);
  id v19 = *(id *)(a1 + 48);
  id v9 = (void *)MEMORY[0x1E4F7A0F0];
  id v10 = v5;
  id v11 = v6;
  uint64_t v12 = objc_msgSend(v9, "immediateScheduler", v14[0], 3221225472, __66__HMCameraClipFetchVideoAssetContextOperation_downloadVideoAsset___block_invoke_2, &unk_1E5940468, v15);
  v13 = [v7 lazyFutureWithBlock:v14 scheduler:v12];

  [*(id *)(a1 + 56) addObject:v13];
}

id __66__HMCameraClipFetchVideoAssetContextOperation_downloadVideoAsset___block_invoke_46(id *a1, void *a2)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([a1[4] count] == 1)
  {
    id v4 = [a1[4] firstObject];
    id v5 = (void *)MEMORY[0x19F3A64A0]();
    id v6 = a1[5];
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = a1[6];
      *(_DWORD *)buf = 138543874;
      long long v42 = v8;
      __int16 v43 = 2112;
      uint64_t v44 = (uint64_t)v4;
      __int16 v45 = 2112;
      id v46 = v9;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Finished downloading clip data. Copying single video file at %@ to %@", buf, 0x20u);
    }
    id v10 = [a1[5] dataSource];
    [v10 removeItemAtURL:a1[6] error:0];

    id v11 = [a1[5] dataSource];
    uint64_t v12 = [a1[4] firstObject];
    id v13 = a1[6];
    id v40 = 0;
    char v14 = [v11 copyItemAtURL:v12 toURL:v13 error:&v40];
    id v15 = v40;

    if (v14)
    {
      id v16 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
    }
    else
    {
      id v28 = (void *)MEMORY[0x19F3A64A0]();
      id v29 = a1[5];
      v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        id v31 = HMFGetLogIdentifier();
        v32 = [a1[4] firstObject];
        id v33 = a1[6];
        *(_DWORD *)buf = 138544130;
        long long v42 = v31;
        __int16 v43 = 2112;
        uint64_t v44 = (uint64_t)v32;
        __int16 v45 = 2112;
        id v46 = v33;
        __int16 v47 = 2112;
        id v48 = v15;
        _os_log_impl(&dword_19D1A8000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to copy video file at %@ to %@: %@", buf, 0x2Au);
      }
      id v34 = (void *)MEMORY[0x1E4F7A0D8];
      uint64_t v35 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
      id v16 = [v34 futureWithError:v35];
    }
  }
  else
  {
    id v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = a1[5];
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      uint64_t v21 = [a1[4] count];
      id v22 = a1[6];
      *(_DWORD *)buf = 138543874;
      long long v42 = v20;
      __int16 v43 = 2048;
      uint64_t v44 = v21;
      __int16 v45 = 2112;
      id v46 = v22;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_INFO, "%{public}@Finished downloading clip data. Combining %ld video file(s) to %@", buf, 0x20u);
    }
    uint64_t v23 = [a1[5] dataSource];
    id v24 = a1[4];
    uint64_t v25 = [a1[5] underlyingQueue];
    v26 = [v23 createVideoFileCombinerWithVideoFileURLs:v24 queue:v25];

    v27 = (void *)MEMORY[0x1E4F7A0D8];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __66__HMCameraClipFetchVideoAssetContextOperation_downloadVideoAsset___block_invoke_47;
    v37[3] = &unk_1E59404B8;
    id v38 = v26;
    id v39 = a1[6];
    id v4 = v26;
    id v16 = [v27 futureWithErrorOnlyHandlerAdapterBlock:v37];

    id v15 = v38;
  }

  return v16;
}

void __66__HMCameraClipFetchVideoAssetContextOperation_downloadVideoAsset___block_invoke_2_49(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v22 = v10;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Finished copying/combining video files", buf, 0xCu);
  }
  id v11 = [*(id *)(a1 + 32) dataSource];
  uint64_t v12 = *(void *)(a1 + 40);
  id v20 = 0;
  char v13 = [v11 removeItemAtURL:v12 error:&v20];
  id v14 = v20;

  if ((v13 & 1) == 0)
  {
    id v15 = (void *)MEMORY[0x19F3A64A0]();
    id v16 = *(id *)(a1 + 32);
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      uint64_t v19 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      id v22 = v18;
      __int16 v23 = 2112;
      uint64_t v24 = v19;
      __int16 v25 = 2112;
      id v26 = v14;
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove video files directory at URL %@: %@", buf, 0x20u);
    }
  }
}

uint64_t __66__HMCameraClipFetchVideoAssetContextOperation_downloadVideoAsset___block_invoke_47(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) combineToOutputFileURL:*(void *)(a1 + 40) completion:a2];
}

void __66__HMCameraClipFetchVideoAssetContextOperation_downloadVideoAsset___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  id v7 = a2;
  id v8 = [v3 downloadVideoSegments:v4 forDataTask:v5 andAppendToOutputStream:v6];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __66__HMCameraClipFetchVideoAssetContextOperation_downloadVideoAsset___block_invoke_3;
  id v17 = &unk_1E5940440;
  uint64_t v21 = *(void *)(a1 + 72);
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 32);
  id v18 = v9;
  uint64_t v19 = v10;
  id v20 = *(id *)(a1 + 64);
  id v11 = [v8 addSuccessBlock:&v14];
  uint64_t v12 = objc_msgSend(v7, "completionHandlerAdapter", v14, v15, v16, v17);

  id v13 = (id)[v11 addCompletionBlock:v12];
}

uint64_t __66__HMCameraClipFetchVideoAssetContextOperation_downloadVideoAsset___block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [*(id *)(a1 + 32) count];
  unint64_t v2 = 100 * *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  id v3 = *(void **)(a1 + 40);
  unint64_t v4 = v2 / [*(id *)(a1 + 48) count];

  return [v3 updateDownloadProgressToPercentageComplete:v4];
}

- (id)videoSegmentsToDownload
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  unint64_t v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    id v7 = [(HMCameraClipFetchVideoAssetContextOperation *)v4 clip];
    id v8 = [v7 videoSegments];
    *(_DWORD *)buf = 138543618;
    __int16 v47 = v6;
    __int16 v48 = 2112;
    uint64_t v49 = v8;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Determining video segments to download from all video segments: %@", buf, 0x16u);
  }
  id v9 = [MEMORY[0x1E4F1CA48] array];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v10 = [(HMCameraClipFetchVideoAssetContextOperation *)v4 clip];
  id v11 = [v10 videoSegments];

  id obj = v11;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (!v12)
  {
    id v14 = 0;
    goto LABEL_33;
  }
  uint64_t v13 = v12;
  id v14 = 0;
  unint64_t v15 = 0;
  uint64_t v16 = *(void *)v42;
  id v17 = off_1E593D000;
  do
  {
    uint64_t v18 = 0;
    uint64_t v38 = v13;
    do
    {
      if (*(void *)v42 != v16) {
        objc_enumerationMutation(obj);
      }
      id v19 = *(id *)(*((void *)&v41 + 1) + 8 * v18);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v20 = v19;
      }
      else {
        id v20 = 0;
      }
      id v21 = v20;

      if (!v21)
      {
        id v40 = v14;
        __int16 v25 = v17;
        id v26 = v4;
        id v27 = v19;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v28 = v27;
        }
        else {
          id v28 = 0;
        }
        id v24 = v28;

        if (!v24)
        {
          unint64_t v4 = v26;
          id v17 = v25;
          id v14 = v40;
          uint64_t v13 = v38;
          goto LABEL_29;
        }
        unint64_t v4 = v26;
        unint64_t v29 = [(HMCameraClipFetchVideoAssetContextOperation *)v26 videoDataSegmentsRange];
        if (v15 < v29)
        {
          id v17 = v25;
        }
        else
        {
          id v17 = v25;
          if (v15 - v29 < v30)
          {
            uint64_t v13 = v38;
            if (v40)
            {
              [v9 addObject:v40];
            }
            [v9 addObject:v24];
            id v14 = 0;
            goto LABEL_28;
          }
        }
        id v14 = v40;
        uint64_t v13 = v38;
LABEL_28:
        ++v15;
        goto LABEL_29;
      }
      unint64_t v22 = [(HMCameraClipFetchVideoAssetContextOperation *)v4 videoDataSegmentsRange];
      if (v15 < v22 || v15 - v22 >= v23)
      {
        id v31 = v19;
        id v24 = v14;
        id v14 = v31;
      }
      else
      {
        [v9 addObject:v21];
        id v24 = v14;
        id v14 = 0;
      }
LABEL_29:

      ++v18;
    }
    while (v13 != v18);
    uint64_t v13 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  }
  while (v13);
LABEL_33:

  v32 = (void *)MEMORY[0x19F3A64A0]();
  id v33 = v4;
  id v34 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v35 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v47 = v35;
    __int16 v48 = 2112;
    uint64_t v49 = v9;
    _os_log_impl(&dword_19D1A8000, v34, OS_LOG_TYPE_DEBUG, "%{public}@Determined video segments to download: %@", buf, 0x16u);
  }
  v36 = (void *)[v9 copy];

  return v36;
}

- (void)updateDownloadProgressToPercentageComplete:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x19F3A64A0](self, a2);
  uint64_t v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier();
    int v11 = 138543618;
    uint64_t v12 = v8;
    __int16 v13 = 2048;
    unint64_t v14 = a3;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Updating download progress to %lu", (uint8_t *)&v11, 0x16u);
  }
  id v9 = [(HMCameraClipFetchVideoAssetContextOperation *)v6 downloadProgressHandler];

  if (v9)
  {
    uint64_t v10 = [(HMCameraClipFetchVideoAssetContextOperation *)v6 downloadProgressHandler];
    v10[2](v10, a3);
  }
}

- (id)fetchVideoAssetContext
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  unint64_t v4 = [(HMCameraClipFetchVideoAssetContextOperation *)self clipManager];
  uint64_t v5 = [(HMCameraClipFetchVideoAssetContextOperation *)self clip];
  uint64_t v6 = [v3 completionHandlerAdapter];
  [v4 fetchVideoSegmentsAssetContextForClip:v5 completion:v6];

  return v3;
}

- (void)main
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  unint64_t v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting fetch video asset context operation: %@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__23275;
  uint64_t v16 = __Block_byref_object_dispose__23276;
  id v17 = 0;
  id v7 = [(HMCameraClipFetchVideoAssetContextOperation *)v4 fetchVideoAssetContext];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__HMCameraClipFetchVideoAssetContextOperation_main__block_invoke;
  v13[3] = &unk_1E59403C8;
  v13[4] = v4;
  v13[5] = buf;
  id v8 = [v7 flatMap:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__HMCameraClipFetchVideoAssetContextOperation_main__block_invoke_2;
  v12[3] = &unk_1E59403F0;
  v12[4] = v4;
  v12[5] = buf;
  id v9 = [v8 flatMap:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__HMCameraClipFetchVideoAssetContextOperation_main__block_invoke_3;
  v11[3] = &unk_1E5940418;
  v11[4] = v4;
  v11[5] = buf;
  id v10 = (id)[v9 addCompletionBlock:v11];

  _Block_object_dispose(buf, 8);
}

id __51__HMCameraClipFetchVideoAssetContextOperation_main__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  uint64_t v5 = [*(id *)(a1 + 32) downloadVideoAsset:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  return v5;
}

uint64_t __51__HMCameraClipFetchVideoAssetContextOperation_main__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) writeHLSPlaylistForVideoAssetContext:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

uint64_t __51__HMCameraClipFetchVideoAssetContextOperation_main__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2) {
    return [v3 finishWithVideoAssetContext:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
  else {
    return objc_msgSend(v3, "cancelWithError:");
  }
}

- (void)finishWithVideoAssetContext:(id)a3
{
  id v4 = a3;
  if (![(HMFOperation *)self isFinished])
  {
    uint64_t v5 = [(HMCameraClipFetchVideoAssetContextOperation *)self fetchVideoAssetContextCompletionBlock];

    if (v5)
    {
      uint64_t v6 = [(HMCameraClipFetchVideoAssetContextOperation *)self fetchVideoAssetContextCompletionBlock];
      ((void (**)(void, id, void))v6)[2](v6, v4, 0);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)HMCameraClipFetchVideoAssetContextOperation;
  [(HMFOperation *)&v7 finish];
}

- (void)cancelWithError:(id)a3
{
  id v4 = a3;
  if (([(HMCameraClipFetchVideoAssetContextOperation *)self isCancelled] & 1) == 0)
  {
    uint64_t v5 = [(HMCameraClipFetchVideoAssetContextOperation *)self fetchVideoAssetContextCompletionBlock];

    if (v5)
    {
      uint64_t v6 = [(HMCameraClipFetchVideoAssetContextOperation *)self fetchVideoAssetContextCompletionBlock];
      ((void (**)(void, void, id))v6)[2](v6, 0, v4);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)HMCameraClipFetchVideoAssetContextOperation;
  [(HMFOperation *)&v7 cancelWithError:v4];
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  id v4 = [(HMCameraClipFetchVideoAssetContextOperation *)self clip];
  [v3 appendFormat:@" clip: %@", v4];

  uint64_t v5 = [(HMCameraClipFetchVideoAssetContextOperation *)self clipDestinationFileURL];
  [v3 appendFormat:@" clipDestinationFileURL: %@", v5];

  uint64_t v6 = [(HMCameraClipFetchVideoAssetContextOperation *)self hlsPlaylistDestinationFileURL];
  [v3 appendFormat:@" hlsPlaylistDestinationFileURL: %@", v6];

  [v3 appendString:@">"];
  objc_super v7 = (void *)[v3 copy];

  return v7;
}

- (HMCameraClipFetchVideoAssetContextOperation)initWithClipManager:(id)a3 clip:(id)a4 dataSource:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v10)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  uint64_t v12 = v11;
  if (!v11)
  {
LABEL_9:
    uint64_t v18 = (HMCameraClipFetchVideoAssetContextOperation *)_HMFPreconditionFailure();
    return [(HMCameraClipFetchVideoAssetContextOperation *)v18 initWithClipManager:v20 clip:v21];
  }
  v22.receiver = self;
  v22.super_class = (Class)HMCameraClipFetchVideoAssetContextOperation;
  __int16 v13 = [(HMFOperation *)&v22 initWithTimeout:0.0];
  unint64_t v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_clipManager, a3);
    objc_storeStrong((id *)&v14->_clip, a4);
    objc_storeStrong((id *)&v14->_dataSource, a5);
    uint64_t v15 = [v10 videoDataSegments];
    uint64_t v16 = [v15 count];
    v14->_videoDataSegmentsRange.location = 0;
    v14->_videoDataSegmentsRange.length = v16;

    v14->_videoSegmentsDownloadBatchSize = 8;
  }

  return v14;
}

- (HMCameraClipFetchVideoAssetContextOperation)initWithClipManager:(id)a3 clip:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(HMCameraClipFetchAssetContextOperationDataSource);
  id v9 = [(HMCameraClipFetchVideoAssetContextOperation *)self initWithClipManager:v7 clip:v6 dataSource:v8];

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t31_23312 != -1) {
    dispatch_once(&logCategory__hmf_once_t31_23312, &__block_literal_global_23313);
  }
  unint64_t v2 = (void *)logCategory__hmf_once_v32_23314;

  return v2;
}

uint64_t __58__HMCameraClipFetchVideoAssetContextOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v32_23314;
  logCategory__hmf_once_v32_23314 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end