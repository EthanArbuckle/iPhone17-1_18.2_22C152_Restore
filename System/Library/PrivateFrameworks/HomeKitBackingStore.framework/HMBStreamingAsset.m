@interface HMBStreamingAsset
+ (BOOL)supportsSecureCoding;
+ (id)hmbDecodeData:(id)a3 fromStorageLocation:(unint64_t)a4 error:(id *)a5;
+ (void)applyNativeCKValue:(id)a3 fromSource:(unint64_t)a4 associatingWith:(id)a5 toModel:(id)a6 propertyNamed:(id)a7;
- (CKStreamingAsset)downloadStreamingAsset;
- (CKStreamingAsset)uploadStreamingAsset;
- (HMBStreamingAsset)init;
- (HMBStreamingAsset)initWithCoder:(id)a3;
- (HMBStreamingAsset)initWithUploadStreamingAsset:(id)a3;
- (HMBStreamingAsset)initWithUploadStreamingAsset:(id)a3 downloadStreamingAsset:(id)a4;
- (id)attributeDescriptions;
- (id)hmbEncodeForStorageLocation:(unint64_t)a3 error:(id *)a4;
- (id)hmbObjectByMergingFromObject:(id)a3;
- (id)nativeCKValueWithEncodingContext:(id)a3 error:(id *)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setDownloadStreamingAsset:(id)a3;
- (void)setUploadStreamingAsset:(id)a3;
@end

@implementation HMBStreamingAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadStreamingAsset, 0);
  objc_storeStrong((id *)&self->_uploadStreamingAsset, 0);
}

- (void)setDownloadStreamingAsset:(id)a3
{
}

- (CKStreamingAsset)downloadStreamingAsset
{
  return self->_downloadStreamingAsset;
}

- (void)setUploadStreamingAsset:(id)a3
{
}

- (CKStreamingAsset)uploadStreamingAsset
{
  return self->_uploadStreamingAsset;
}

- (id)nativeCKValueWithEncodingContext:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v7 = [(HMBStreamingAsset *)self uploadStreamingAsset];
    v8 = v7;
    if (v7) {
      id v9 = v7;
    }
    else {
      id v9 = (id)[objc_alloc(MEMORY[0x1E4F1A3C8]) initWithExpectedSizeBytes:1];
    }
    v10 = v9;

    return v10;
  }
  else
  {
    v12 = (HMBStreamingAsset *)_HMFPreconditionFailure();
    return [(HMBStreamingAsset *)v12 hmbObjectByMergingFromObject:v14];
  }
}

- (id)hmbObjectByMergingFromObject:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    v7 = [v6 uploadStreamingAsset];
    v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [(HMBStreamingAsset *)self uploadStreamingAsset];
    }
    v16 = v9;

    v17 = [v6 downloadStreamingAsset];
    v18 = v17;
    if (v17)
    {
      id v19 = v17;
    }
    else
    {
      id v19 = [(HMBStreamingAsset *)self downloadStreamingAsset];
    }
    v20 = v19;

    v15 = [[HMBStreamingAsset alloc] initWithUploadStreamingAsset:v16 downloadStreamingAsset:v20];
  }
  else
  {
    v10 = (void *)MEMORY[0x1D944CB30]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      SEL v13 = HMFGetLogIdentifier();
      int v22 = 138543874;
      v23 = v13;
      __int16 v24 = 2112;
      id v25 = (id)objc_opt_class();
      __int16 v26 = 2112;
      id v27 = v4;
      id v14 = v25;
      _os_log_impl(&dword_1D4693000, v12, OS_LOG_TYPE_ERROR, "%{public}@Asked to merge from unexpected object of class %@: %@", (uint8_t *)&v22, 0x20u);
    }
    v15 = v11;
  }

  return v15;
}

- (id)hmbEncodeForStorageLocation:(unint64_t)a3 error:(id *)a4
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:a4];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMBStreamingAsset *)self uploadStreamingAsset];
  [v4 encodeObject:v5 forKey:@"HMB.u"];

  id v6 = [(HMBStreamingAsset *)self downloadStreamingAsset];
  [v4 encodeObject:v6 forKey:@"HMB.d"];
}

- (HMBStreamingAsset)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMB.u"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMB.d"];

  v7 = [(HMBStreamingAsset *)self initWithUploadStreamingAsset:v5 downloadStreamingAsset:v6];
  return v7;
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v4 = [(HMBStreamingAsset *)self uploadStreamingAsset];
  id v5 = (void *)[v3 initWithName:@"Upload Streaming Asset" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMBStreamingAsset *)self downloadStreamingAsset];
  v8 = (void *)[v6 initWithName:@"Download Streaming Asset" value:v7];
  v11[1] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  return v9;
}

- (HMBStreamingAsset)initWithUploadStreamingAsset:(id)a3 downloadStreamingAsset:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMBStreamingAsset;
  id v9 = [(HMBStreamingAsset *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_uploadStreamingAsset, a3);
    objc_storeStrong((id *)&v10->_downloadStreamingAsset, a4);
  }

  return v10;
}

- (HMBStreamingAsset)initWithUploadStreamingAsset:(id)a3
{
  return [(HMBStreamingAsset *)self initWithUploadStreamingAsset:a3 downloadStreamingAsset:0];
}

- (HMBStreamingAsset)init
{
  return [(HMBStreamingAsset *)self initWithUploadStreamingAsset:0 downloadStreamingAsset:0];
}

+ (void)applyNativeCKValue:(id)a3 fromSource:(unint64_t)a4 associatingWith:(id)a5 toModel:(id)a6 propertyNamed:(id)a7
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v12)
  {
    id v16 = v12;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v17 = v16;
    }
    else {
      v17 = 0;
    }
    id v18 = v17;

    if (v18)
    {
      id v19 = [v14 hmbPropertyNamed:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v20 = v19;
      }
      else {
        v20 = 0;
      }
      v21 = v19;
      if (!v20) {
        v21 = objc_alloc_init(HMBStreamingAsset);
      }
      if (a4 == 4 || a4 == 2)
      {
        [(HMBStreamingAsset *)v21 setDownloadStreamingAsset:v18];
      }
      else if (a4 == 1)
      {
        [(HMBStreamingAsset *)v21 setUploadStreamingAsset:v18];
      }
      [v14 hmbSetProperty:v21 named:v15];
    }
    else
    {
      int v22 = (void *)MEMORY[0x1D944CB30]();
      id v23 = a1;
      __int16 v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        id v25 = HMFGetLogIdentifier();
        [v14 hmbDescription];
        __int16 v26 = v27 = v22;
        *(_DWORD *)buf = 138544130;
        v29 = v25;
        __int16 v30 = 2112;
        id v31 = v16;
        __int16 v32 = 2112;
        v33 = v26;
        __int16 v34 = 2112;
        id v35 = v15;
        _os_log_impl(&dword_1D4693000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly found %@ in CKRecord field for wrapped model value %@/%@ which we expected to be a CKStreamingAsset (ignoring).", buf, 0x2Au);

        int v22 = v27;
      }
    }
  }
  else
  {
    [v14 hmbSetProperty:0 named:v15];
  }
}

+ (id)hmbDecodeData:(id)a3 fromStorageLocation:(unint64_t)a4 error:(id *)a5
{
  id v6 = a3;
  if (hmbDecodeData_fromStorageLocation_error__onceToken != -1) {
    dispatch_once(&hmbDecodeData_fromStorageLocation_error__onceToken, &__block_literal_global_2294);
  }
  id v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:hmbDecodeData_fromStorageLocation_error__allowedClasses fromData:v6 error:a5];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  v10 = v9;
  if (v9)
  {
    v11 = v9;
    id v12 = v7;
  }
  else
  {
    id v13 = v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }
    id v15 = v14;

    if (v15) {
      id v12 = [[HMBStreamingAsset alloc] initWithUploadStreamingAsset:v15 downloadStreamingAsset:v15];
    }
    else {
      id v12 = 0;
    }
  }
  return v12;
}

void __61__HMBStreamingAsset_hmbDecodeData_fromStorageLocation_error___block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)hmbDecodeData_fromStorageLocation_error__allowedClasses;
  hmbDecodeData_fromStorageLocation_error__allowedClasses = v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end