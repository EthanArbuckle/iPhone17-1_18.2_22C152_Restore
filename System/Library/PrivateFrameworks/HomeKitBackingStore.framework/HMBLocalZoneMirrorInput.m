@interface HMBLocalZoneMirrorInput
- (BOOL)stageAdditionForModel:(id)a3 externalID:(id)a4 externalData:(id)a5 error:(id *)a6;
- (BOOL)stageRemovalForModelWithExternalID:(id)a3 error:(id *)a4;
- (id)commitWithOptions:(id)a3 error:(id *)a4;
@end

@implementation HMBLocalZoneMirrorInput

- (id)commitWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [v6 setShouldEnqueueMirrorOutput:0];
  v9.receiver = self;
  v9.super_class = (Class)HMBLocalZoneMirrorInput;
  v7 = [(HMBLocalZoneInput *)&v9 commitWithOptions:v6 error:a4];

  return v7;
}

- (BOOL)stageRemovalForModelWithExternalID:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void *)MEMORY[0x1D944CB30]();
  v8 = self;
  objc_super v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = HMFGetLogIdentifier();
    v11 = [v6 hmbDescription];
    int v15 = 138543618;
    v16 = v10;
    __int16 v17 = 2112;
    v18 = v11;
    _os_log_impl(&dword_1D4693000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Staging removal for model with external ID: %@", (uint8_t *)&v15, 0x16u);
  }
  v12 = [(HMBLocalZoneInput *)v8 inputBlock];
  v13 = [v12 updateExternalID:v6 externalData:0 modelEncoding:0 modelData:0];

  if (v13)
  {
    if (a4) {
      *a4 = v13;
    }
  }
  else
  {
    [(HMBLocalZoneInput *)v8 setStagedChangesCount:[(HMBLocalZoneInput *)v8 stagedChangesCount] + 1];
  }

  return v13 == 0;
}

- (BOOL)stageAdditionForModel:(id)a3 externalID:(id)a4 externalData:(id)a5 error:(id *)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void *)MEMORY[0x1D944CB30]();
  v14 = self;
  int v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = HMFGetLogIdentifier();
    __int16 v17 = [v11 hmbDescription];
    v18 = [v12 hmbDescription];
    *(_DWORD *)buf = 138544130;
    v36 = v16;
    __int16 v37 = 2112;
    id v38 = v10;
    __int16 v39 = 2112;
    id v40 = v17;
    __int16 v41 = 2112;
    v42 = v18;
    _os_log_impl(&dword_1D4693000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Staging addition for model: %@ externalID: %@ externalData: %@", buf, 0x2Au);
  }
  uint64_t v19 = [(HMBLocalZoneInput *)v14 localZone];
  v20 = [v19 modelContainer];
  uint64_t v21 = [v20 bestModelEncodingForStorageLocation:3];

  v22 = [(HMBLocalZoneInput *)v14 localZone];
  v23 = [v22 modelContainer];
  id v34 = 0;
  v24 = [v23 dataFromModel:v10 encoding:v21 storageLocation:3 updatedModelIDs:0 error:&v34];
  id v25 = v34;

  if (v24)
  {
    v26 = [(HMBLocalZoneInput *)v14 inputBlock];
    v27 = [v26 updateExternalID:v11 externalData:v12 modelEncoding:v21 modelData:v24];

    BOOL v28 = v27 == 0;
    if (v27)
    {
      if (a6) {
        *a6 = v27;
      }
    }
    else
    {
      [(HMBLocalZoneInput *)v14 setStagedChangesCount:[(HMBLocalZoneInput *)v14 stagedChangesCount] + 1];
    }
  }
  else
  {
    v29 = (void *)MEMORY[0x1D944CB30]();
    v30 = v14;
    v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v36 = v32;
      __int16 v37 = 2112;
      id v38 = v10;
      __int16 v39 = 2112;
      id v40 = v25;
      _os_log_impl(&dword_1D4693000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode model %@: %@", buf, 0x20u);
    }
    BOOL v28 = 0;
    if (a6) {
      *a6 = v25;
    }
  }

  return v28;
}

@end