@interface HMDCameraClipAppendStreamingAssetOperation
+ (BOOL)shouldRetry;
+ (NSString)metadataPropertyName;
+ (NSString)streamingAssetPropertyName;
+ (id)logCategory;
- (HMCameraClipEncryptionManager)encryptionManager;
- (HMDCameraClipAppendStreamingAssetOperation)initWithClipModelID:(id)a3 localZone:(id)a4 data:(id)a5 metadata:(id)a6 encryptionManager:(id)a7;
- (HMDCameraClipAppendStreamingAssetOperation)initWithClipModelID:(id)a3 localZone:(id)a4 data:(id)a5 metadata:(id)a6 encryptionManager:(id)a7 dataSource:(id)a8;
- (HMDCameraClipSegmentMetadata)metadata;
- (HMFTimer)retryTimer;
- (NSData)data;
- (id)_retryDelayForError:(id)a3;
- (id)_updateClipModel:(id)a3 usingStreamingAsset:(id)a4;
- (id)attributeDescriptions;
- (void)cancelWithError:(id)a3;
- (void)finish;
- (void)main;
- (void)setRetryTimer:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDCameraClipAppendStreamingAssetOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_encryptionManager, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)setRetryTimer:(id)a3
{
}

- (HMFTimer)retryTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 400, 1);
}

- (HMCameraClipEncryptionManager)encryptionManager
{
  return (HMCameraClipEncryptionManager *)objc_getProperty(self, a2, 392, 1);
}

- (HMDCameraClipSegmentMetadata)metadata
{
  return (HMDCameraClipSegmentMetadata *)objc_getProperty(self, a2, 384, 1);
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 376, 1);
}

- (id)attributeDescriptions
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)HMDCameraClipAppendStreamingAssetOperation;
  v3 = [(HMDCameraClipOperation *)&v14 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v5 = [(HMDCameraClipAppendStreamingAssetOperation *)self data];
  v6 = [v5 shortDescription];
  v7 = (void *)[v4 initWithName:@"Data" value:v6];
  v15[0] = v7;
  id v8 = objc_alloc(MEMORY[0x1E4F653F8]);
  v9 = [(HMDCameraClipAppendStreamingAssetOperation *)self metadata];
  v10 = (void *)[v8 initWithName:@"Metadata" value:v9];
  v15[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  v12 = [v3 arrayByAddingObjectsFromArray:v11];

  return v12;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraClipAppendStreamingAssetOperation *)self retryTimer];

  v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  id v8 = HMFGetOSLogHandle();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5 == v4)
  {
    if (v9)
    {
      v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      objc_super v14 = v12;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Retry timer fired for append", (uint8_t *)&v13, 0xCu);
    }
    [(HMDCameraClipAppendStreamingAssetOperation *)v7 setRetryTimer:0];
    [(HMDCameraClipAppendStreamingAssetOperation *)v7 main];
  }
  else
  {
    if (v9)
    {
      v10 = HMFGetLogIdentifier();
      int v13 = 138543362;
      objc_super v14 = v10;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Operation timed out, cancelling", (uint8_t *)&v13, 0xCu);
    }
    v11 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:13];
    [(HMDCameraClipAppendStreamingAssetOperation *)v7 cancelWithError:v11];
  }
}

- (id)_retryDelayForError:(id)a3
{
  id v3 = a3;
  if ([(id)objc_opt_class() shouldRetry]
    && ([v3 domain],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isEqualToString:*MEMORY[0x1E4F19C40]],
        v4,
        v5))
  {
    uint64_t v6 = [v3 code];
    v7 = &unk_1F2DCB8A8;
    if (v6 != 34 && v6 != 121)
    {
      id v8 = [v3 userInfo];
      v7 = objc_msgSend(v8, "hmf_numberForKey:", *MEMORY[0x1E4F19C60]);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_updateClipModel:(id)a3 usingStreamingAsset:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F69F10]) initWithUploadStreamingAsset:v7];
  BOOL v9 = [(id)objc_opt_class() streamingAssetPropertyName];
  [v6 hmbSetProperty:v8 named:v9];

  v10 = [(HMDCameraClipAppendStreamingAssetOperation *)self metadata];
  LODWORD(v9) = [v10 hasDuration];

  if (v9)
  {
    v11 = NSNumber;
    v12 = [v6 duration];
    [v12 doubleValue];
    double v14 = v13;
    uint64_t v15 = [(HMDCameraClipAppendStreamingAssetOperation *)self metadata];
    [v15 duration];
    v17 = [v11 numberWithDouble:v14 + v16];
    [v6 setDuration:v17];
  }
  v18 = [(id)objc_opt_class() metadataPropertyName];
  uint64_t v19 = [v6 hmbPropertyNamed:v18];
  v20 = (void *)v19;
  v21 = (void *)MEMORY[0x1E4F1CBF0];
  if (v19) {
    v21 = (void *)v19;
  }
  id v22 = v21;

  v23 = [(HMDCameraClipAppendStreamingAssetOperation *)self metadata];
  v24 = [v23 data];
  v25 = [v22 arrayByAddingObject:v24];

  v26 = [(id)objc_opt_class() metadataPropertyName];
  [v6 hmbSetProperty:v25 named:v26];

  v27 = (void *)MEMORY[0x1D9452090]();
  v28 = self;
  v29 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    v30 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v36 = v30;
    _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_INFO, "%{public}@Submitting clip model update", buf, 0xCu);
  }
  v31 = [(HMDCameraClipOperation *)v28 updateClipModel:v6];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __83__HMDCameraClipAppendStreamingAssetOperation__updateClipModel_usingStreamingAsset___block_invoke;
  v34[3] = &unk_1E6A16F08;
  v34[4] = v28;
  v32 = [v31 flatMap:v34];

  return v32;
}

id __83__HMDCameraClipAppendStreamingAssetOperation__updateClipModel_usingStreamingAsset___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 mirrorOutputResult];

  if (v4)
  {
    int v5 = [v3 mirrorOutputResult];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      BOOL v9 = HMFGetLogIdentifier();
      int v13 = 138543362;
      double v14 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@No mirrorOutputResult available for clip update, failing operation", (uint8_t *)&v13, 0xCu);
    }
    v10 = (void *)MEMORY[0x1E4F7A0D8];
    v11 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8];
    int v5 = [v10 futureWithError:v11];
  }
  return v5;
}

- (void)cancelWithError:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HMDCameraClipAppendStreamingAssetOperation;
  [(HMDCameraClipOperation *)&v4 cancelWithError:a3];
  [(HMDCameraClipAppendStreamingAssetOperation *)self setRetryTimer:0];
}

- (void)finish
{
  v3.receiver = self;
  v3.super_class = (Class)HMDCameraClipAppendStreamingAssetOperation;
  [(HMDCameraClipOperation *)&v3 finish];
  [(HMDCameraClipAppendStreamingAssetOperation *)self setRetryTimer:0];
}

- (void)main
{
  v14.receiver = self;
  v14.super_class = (Class)HMDCameraClipAppendStreamingAssetOperation;
  [(HMDCameraClipOperation *)&v14 main];
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__122372;
  v12[4] = __Block_byref_object_dispose__122373;
  id v13 = 0;
  objc_super v3 = [(HMDCameraClipOperation *)self fetchClipModel];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__HMDCameraClipAppendStreamingAssetOperation_main__block_invoke;
  v11[3] = &unk_1E6A10508;
  v11[4] = self;
  v11[5] = v12;
  objc_super v4 = [v3 flatMap:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__HMDCameraClipAppendStreamingAssetOperation_main__block_invoke_28;
  v10[3] = &unk_1E6A10530;
  v10[4] = self;
  v10[5] = v12;
  int v5 = [v4 flatMap:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__HMDCameraClipAppendStreamingAssetOperation_main__block_invoke_30;
  v9[3] = &unk_1E6A19708;
  v9[4] = self;
  id v6 = [v5 addSuccessBlock:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__HMDCameraClipAppendStreamingAssetOperation_main__block_invoke_32;
  v8[3] = &unk_1E6A197F0;
  v8[4] = self;
  id v7 = (id)[v6 addFailureBlock:v8];

  _Block_object_dispose(v12, 8);
}

id __50__HMDCameraClipAppendStreamingAssetOperation_main__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  int v5 = [(id)objc_opt_class() streamingAssetPropertyName];
  id v6 = [v4 hmbPropertyNamed:v5];

  id v7 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    id v35 = v4;
    v10 = [v9 uploadStreamingAsset];
    v11 = [*(id *)(a1 + 32) encryptionManager];
    v12 = [*(id *)(a1 + 32) data];
    id v13 = [v11 encryptedDataContextFromData:v12];

    objc_super v14 = [v13 dataRepresentation];
    uint64_t v15 = [v10 bytesUploaded];
    double v16 = [*(id *)(a1 + 32) metadata];
    [v16 setByteOffset:v15];

    uint64_t v17 = [v14 length];
    v18 = [*(id *)(a1 + 32) metadata];
    [v18 setByteLength:v17];

    uint64_t v19 = (void *)MEMORY[0x1D9452090]();
    id v20 = *(id *)(a1 + 32);
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v37 = v22;
      __int16 v38 = 2048;
      uint64_t v39 = [v14 length];
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Appending %lu bytes of data to streaming asset", buf, 0x16u);
    }
    id v23 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    v24 = (void *)[objc_alloc(MEMORY[0x1E4F1A3D0]) initWithStreamingAsset:v10];
    v25 = [*(id *)(a1 + 32) dataSource];
    v26 = [v23 completionHandlerAdapter];
    [v25 appendData:v14 toStreamingAssetAppendContext:v24 completion:v26];

    id v4 = v35;
  }
  else
  {
    v27 = (void *)MEMORY[0x1D9452090]();
    id v28 = *(id *)(a1 + 32);
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = HMFGetLogIdentifier();
      v31 = [(id)objc_opt_class() streamingAssetPropertyName];
      *(_DWORD *)buf = 138544130;
      uint64_t v37 = v30;
      __int16 v38 = 2112;
      uint64_t v39 = (uint64_t)v31;
      __int16 v40 = 2112;
      id v41 = (id)objc_opt_class();
      __int16 v42 = 2112;
      id v43 = v7;
      id v32 = v41;
      _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@Property \"%@\" was of unexpected class %@: %@", buf, 0x2Au);
    }
    v33 = (void *)MEMORY[0x1E4F7A0D8];
    v10 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:3];
    id v23 = [v33 futureWithError:v10];
  }

  return v23;
}

id __50__HMDCameraClipAppendStreamingAssetOperation_main__block_invoke_28(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Successfully appended to streaming asset", (uint8_t *)&v10, 0xCu);
  }
  id v8 = [*(id *)(a1 + 32) _updateClipModel:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) usingStreamingAsset:v3];

  return v8;
}

void __50__HMDCameraClipAppendStreamingAssetOperation_main__block_invoke_30(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543362;
    id v9 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Successfully updated clip model with updated streaming asset", (uint8_t *)&v8, 0xCu);
  }
  [*(id *)(a1 + 32) finish];
}

void __50__HMDCameraClipAppendStreamingAssetOperation_main__block_invoke_32(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v27 = 138543618;
    id v28 = v7;
    __int16 v29 = 2112;
    id v30 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to append to streaming asset: %@", (uint8_t *)&v27, 0x16u);
  }
  uint64_t v8 = [*(id *)(a1 + 32) _retryDelayForError:v3];
  if (v8)
  {
    id v9 = (void *)v8;
    uint64_t v10 = [*(id *)(a1 + 32) uploadOperationEvent];
    objc_msgSend(v10, "setRetryCount:", objc_msgSend(v10, "retryCount") + 1);

    [v9 doubleValue];
    if (v11 < 0.5)
    {

      id v9 = &unk_1F2DCB8A8;
    }
    uint64_t v12 = (void *)MEMORY[0x1D9452090]();
    id v13 = *(id *)(a1 + 32);
    objc_super v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      int v27 = 138543618;
      id v28 = v15;
      __int16 v29 = 2112;
      id v30 = v9;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Retrying failed append in %@ seconds", (uint8_t *)&v27, 0x16u);
    }
    double v16 = [*(id *)(a1 + 32) dataSource];
    [v9 doubleValue];
    uint64_t v17 = objc_msgSend(v16, "timerWithTimeInterval:options:", 2);
    [*(id *)(a1 + 32) setRetryTimer:v17];

    v18 = *(void **)(a1 + 32);
    uint64_t v19 = [v18 retryTimer];
    [v19 setDelegate:v18];

    id v20 = [*(id *)(a1 + 32) underlyingQueue];
    v21 = [*(id *)(a1 + 32) retryTimer];
    [v21 setDelegateQueue:v20];

    id v22 = [*(id *)(a1 + 32) retryTimer];
    [v22 resume];
  }
  else
  {
    id v23 = (void *)MEMORY[0x1D9452090]();
    id v24 = *(id *)(a1 + 32);
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier();
      int v27 = 138543362;
      id v28 = v26;
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@Unable to retry append operation, canceling", (uint8_t *)&v27, 0xCu);
    }
    [*(id *)(a1 + 32) cancelWithError:v3];
  }
}

- (HMDCameraClipAppendStreamingAssetOperation)initWithClipModelID:(id)a3 localZone:(id)a4 data:(id)a5 metadata:(id)a6 encryptionManager:(id)a7 dataSource:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (!v14)
  {
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v15)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v16)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v17)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v18)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  id v20 = v19;
  if (!v19)
  {
LABEL_15:
    id v24 = (HMDCameraClipAppendStreamingAssetOperation *)_HMFPreconditionFailure();
    return [(HMDCameraClipAppendStreamingAssetOperation *)v24 initWithClipModelID:v26 localZone:v27 data:v28 metadata:v29 encryptionManager:v30];
  }
  v31.receiver = self;
  v31.super_class = (Class)HMDCameraClipAppendStreamingAssetOperation;
  v21 = [(HMDCameraClipOperation *)&v31 initWithClipModelID:v14 localZone:v15 dataSource:v19];
  id v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_data, a5);
    objc_storeStrong((id *)&v22->_metadata, a6);
    objc_storeStrong((id *)&v22->_encryptionManager, a7);
  }

  return v22;
}

- (HMDCameraClipAppendStreamingAssetOperation)initWithClipModelID:(id)a3 localZone:(id)a4 data:(id)a5 metadata:(id)a6 encryptionManager:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = objc_alloc_init(HMDCameraClipOperationDataSource);
  id v18 = [(HMDCameraClipAppendStreamingAssetOperation *)self initWithClipModelID:v16 localZone:v15 data:v14 metadata:v13 encryptionManager:v12 dataSource:v17];

  return v18;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t12_122418 != -1) {
    dispatch_once(&logCategory__hmf_once_t12_122418, &__block_literal_global_122419);
  }
  v2 = (void *)logCategory__hmf_once_v13_122420;
  return v2;
}

uint64_t __57__HMDCameraClipAppendStreamingAssetOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v13_122420;
  logCategory__hmf_once_v13_122420 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)shouldRetry
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (NSString)metadataPropertyName
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (NSString)streamingAssetPropertyName
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end