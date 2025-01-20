@interface HMDCameraClipImportPosterFrameMetadata
- (HMDCameraClipImportPosterFrameMetadata)initWithPosterFrameMetadata:(id)a3;
- (NSString)resourcePath;
- (double)offset;
- (unint64_t)height;
- (unint64_t)width;
@end

@implementation HMDCameraClipImportPosterFrameMetadata

- (void).cxx_destruct
{
}

- (unint64_t)height
{
  return self->_height;
}

- (unint64_t)width
{
  return self->_width;
}

- (double)offset
{
  return self->_offset;
}

- (NSString)resourcePath
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (HMDCameraClipImportPosterFrameMetadata)initWithPosterFrameMetadata:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)HMDCameraClipImportPosterFrameMetadata;
  v5 = [(HMDCameraClipImportPosterFrameMetadata *)&v32 init];
  if (!v5) {
    goto LABEL_22;
  }
  uint64_t v6 = objc_msgSend(v4, "hmf_stringForKey:", @"data");
  if (!v6)
  {
    v14 = (void *)MEMORY[0x230FBD990]();
    v15 = v5;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v34 = v17;
      __int16 v35 = 2112;
      id v36 = v4;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Could not find resourcePath in poster frame segment metadata: %@", buf, 0x16u);
    }
    goto LABEL_21;
  }
  v7 = (void *)v6;
  uint64_t v8 = objc_msgSend(v4, "hmf_numberForKey:", @"offset");
  if (!v8)
  {
    v18 = (void *)MEMORY[0x230FBD990]();
    v19 = v5;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v34 = v21;
      __int16 v35 = 2112;
      id v36 = v4;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Could not find offset in poster frame segment metadata: %@", buf, 0x16u);
    }

    goto LABEL_21;
  }
  v9 = (void *)v8;
  v10 = objc_msgSend(v4, "hmf_numberForKey:", @"width");
  if (v10)
  {
    v11 = objc_msgSend(v4, "hmf_numberForKey:", @"height");
    if (v11)
    {
      objc_storeStrong((id *)&v5->_resourcePath, v7);
      [v9 doubleValue];
      v5->_offset = v12;
      v5->_width = [v10 unsignedIntegerValue];
      int v13 = 0;
      v5->_height = [v11 unsignedIntegerValue];
    }
    else
    {
      v26 = (void *)MEMORY[0x230FBD990]();
      v27 = v5;
      v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v34 = v29;
        __int16 v35 = 2112;
        id v36 = v4;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Could not find height in poster frame segment metadata: %@", buf, 0x16u);
      }
      int v13 = 1;
    }
  }
  else
  {
    v22 = (void *)MEMORY[0x230FBD990]();
    v23 = v5;
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v34 = v25;
      __int16 v35 = 2112;
      id v36 = v4;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Could not find width in poster frame segment metadata: %@", buf, 0x16u);
    }
    int v13 = 1;
  }

  if (!v13)
  {
LABEL_22:
    v30 = v5;
    goto LABEL_23;
  }
LABEL_21:
  v30 = 0;
LABEL_23:

  return v30;
}

@end