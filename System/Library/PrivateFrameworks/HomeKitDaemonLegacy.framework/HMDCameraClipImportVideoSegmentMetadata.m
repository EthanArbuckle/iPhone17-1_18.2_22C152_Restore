@interface HMDCameraClipImportVideoSegmentMetadata
- (BOOL)isHeader;
- (HMDCameraClipImportVideoSegmentMetadata)initWithVideoSegmentMetadata:(id)a3;
- (NSString)resourcePath;
- (double)duration;
@end

@implementation HMDCameraClipImportVideoSegmentMetadata

- (void).cxx_destruct
{
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)isHeader
{
  return self->_header;
}

- (NSString)resourcePath
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (HMDCameraClipImportVideoSegmentMetadata)initWithVideoSegmentMetadata:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)HMDCameraClipImportVideoSegmentMetadata;
  v5 = [(HMDCameraClipImportVideoSegmentMetadata *)&v29 init];
  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v6 = objc_msgSend(v4, "hmf_stringForKey:", @"data");
  if (!v6)
  {
    v16 = (void *)MEMORY[0x1D9452090]();
    v17 = v5;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v31 = v19;
      __int16 v32 = 2112;
      id v33 = v4;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Could not find resourcePath in video segment metadata: %@", buf, 0x16u);
    }
    goto LABEL_17;
  }
  v7 = (void *)v6;
  uint64_t v8 = objc_msgSend(v4, "hmf_numberForKey:", @"isHeader");
  if (!v8)
  {
    v20 = (void *)MEMORY[0x1D9452090]();
    v21 = v5;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v31 = v23;
      __int16 v32 = 2112;
      id v33 = v4;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Could not find isHeader in video segment metadata: %@", buf, 0x16u);
    }
    goto LABEL_16;
  }
  v9 = (void *)v8;
  uint64_t v10 = objc_msgSend(v4, "hmf_numberForKey:", @"duration");
  if (!v10)
  {
    v24 = (void *)MEMORY[0x1D9452090]();
    v25 = v5;
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v31 = v27;
      __int16 v32 = 2112;
      id v33 = v4;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@Could not find duration in video segment metadata: %@", buf, 0x16u);
    }

LABEL_16:
LABEL_17:
    v15 = 0;
    goto LABEL_18;
  }
  v11 = (void *)v10;
  uint64_t v12 = [v7 copy];
  resourcePath = v5->_resourcePath;
  v5->_resourcePath = (NSString *)v12;

  v5->_header = [v9 BOOLValue];
  [v11 doubleValue];
  v5->_duration = v14;

LABEL_6:
  v15 = v5;
LABEL_18:

  return v15;
}

@end