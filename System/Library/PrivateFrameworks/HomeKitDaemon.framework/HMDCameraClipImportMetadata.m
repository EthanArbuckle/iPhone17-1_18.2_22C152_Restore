@interface HMDCameraClipImportMetadata
- (NSArray)posterFrames;
- (NSArray)videoSegments;
- (NSDate)startDate;
- (double)targetFragmentDuration;
- (id)initClipData:(id)a3;
@end

@implementation HMDCameraClipImportMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posterFrames, 0);
  objc_storeStrong((id *)&self->_videoSegments, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

- (NSArray)posterFrames
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)videoSegments
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (double)targetFragmentDuration
{
  return self->_targetFragmentDuration;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (id)initClipData:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)HMDCameraClipImportMetadata;
  v5 = [(HMDCameraClipImportMetadata *)&v42 init];
  if (!v5) {
    goto LABEL_28;
  }
  uint64_t v6 = objc_msgSend(v4, "hmf_stringForKey:", @"startDate");
  if (!v6)
  {
    v19 = (void *)MEMORY[0x230FBD990]();
    v20 = v5;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v44 = v22;
      __int16 v45 = 2112;
      id v46 = v4;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Could not find start date string in clip data: %@", buf, 0x16u);
    }
    goto LABEL_27;
  }
  v7 = (void *)v6;
  id v8 = objc_alloc_init(MEMORY[0x263F088C0]);
  v9 = [v8 dateFromString:v7];
  if (v9)
  {
    v10 = objc_msgSend(v4, "hmf_numberForKey:", @"targetFragmentDuration");
    if (v10)
    {
      v11 = objc_msgSend(v4, "hmf_arrayForKey:", @"posterFrames");
      if (v11)
      {
        v12 = objc_msgSend(v4, "hmf_arrayForKey:", @"fragments");
        if (v12)
        {
          objc_storeStrong((id *)&v5->_startDate, v9);
          [v10 doubleValue];
          v5->_targetFragmentDuration = v13;
          uint64_t v14 = objc_msgSend(v11, "na_map:", &__block_literal_global_133_219654);
          posterFrames = v5->_posterFrames;
          v5->_posterFrames = (NSArray *)v14;

          uint64_t v16 = objc_msgSend(v12, "na_map:", &__block_literal_global_137_219655);
          videoSegments = v5->_videoSegments;
          v5->_videoSegments = (NSArray *)v16;

          int v18 = 0;
        }
        else
        {
          context = (void *)MEMORY[0x230FBD990]();
          v35 = v5;
          v36 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            v39 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v44 = v39;
            __int16 v45 = 2112;
            id v46 = v4;
            _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_ERROR, "%{public}@Could not find video fragments in clip data: %@", buf, 0x16u);
          }
          int v18 = 1;
        }
      }
      else
      {
        v31 = (void *)MEMORY[0x230FBD990]();
        v32 = v5;
        v33 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v34 = contexta = v31;
          *(_DWORD *)buf = 138543618;
          v44 = v34;
          __int16 v45 = 2112;
          id v46 = v4;
          _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Could not find poster frames in clip data: %@", buf, 0x16u);

          v31 = contexta;
        }

        int v18 = 1;
      }
    }
    else
    {
      v27 = (void *)MEMORY[0x230FBD990]();
      v28 = v5;
      v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v44 = v30;
        __int16 v45 = 2112;
        id v46 = v4;
        _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Could not find target fragment duration in clip data: %@", buf, 0x16u);
      }
      int v18 = 1;
    }
  }
  else
  {
    v23 = (void *)MEMORY[0x230FBD990]();
    v24 = v5;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v44 = v26;
      __int16 v45 = 2112;
      id v46 = v7;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Could not parse start date from string: %@", buf, 0x16u);
    }
    int v18 = 1;
  }

  if (!v18)
  {
LABEL_28:
    v37 = v5;
    goto LABEL_29;
  }
LABEL_27:
  v37 = 0;
LABEL_29:

  return v37;
}

HMDCameraClipImportVideoSegmentMetadata *__44__HMDCameraClipImportMetadata_initClipData___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HMDCameraClipImportVideoSegmentMetadata alloc] initWithVideoSegmentMetadata:v2];

  return v3;
}

HMDCameraClipImportPosterFrameMetadata *__44__HMDCameraClipImportMetadata_initClipData___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HMDCameraClipImportPosterFrameMetadata alloc] initWithPosterFrameMetadata:v2];

  return v3;
}

@end