@interface HMDLegacyV3Model
+ (id)createWithLegacyRecord:(id)a3 modelContainer:(id)a4 error:(id *)a5;
+ (id)hmbProperties;
- (HMDLegacyV3Model)init;
- (id)encodeWithExistingRecord:(id)a3 cloudZone:(id)a4 modelContainer:(id)a5 error:(id *)a6;
@end

@implementation HMDLegacyV3Model

- (id)encodeWithExistingRecord:(id)a3 cloudZone:(id)a4 modelContainer:(id)a5 error:(id *)a6
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    v13 = [v10 recordID];
    v14 = [v13 recordName];
    char v15 = [v14 isEqual:@"BC9706E1-E72E-4152-A2A6-417AD742DC41"];

    if ((v15 & 1) == 0)
    {
      v16 = (void *)MEMORY[0x230FBD990]();
      v17 = self;
      v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = v42 = a6;
        [v10 recordID];
        v20 = v41 = v16;
        v21 = [v20 recordName];
        *(_DWORD *)buf = 138543874;
        v46 = v19;
        __int16 v47 = 2112;
        v48 = v21;
        __int16 v49 = 2112;
        v50 = @"BC9706E1-E72E-4152-A2A6-417AD742DC41";
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@UNEXPECTED RECORD NAME MISMATCH (V3) %@ != %@", buf, 0x20u);

        v16 = v41;
        a6 = v42;
      }
    }
  }
  else
  {
    v22 = [v11 zoneID];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v23 = v22;
    }
    else {
      v23 = 0;
    }
    id v24 = v23;

    if (!v24) {
      _HMFPreconditionFailure();
    }
    id v25 = objc_alloc(MEMORY[0x263EFD7E8]);
    v26 = [v24 zoneID];
    v27 = (void *)[v25 initWithRecordName:@"BC9706E1-E72E-4152-A2A6-417AD742DC41" zoneID:v26];

    id v10 = (id)[objc_alloc(MEMORY[0x263EFD7C8]) initWithRecordType:@"HomeDataBlobV3" recordID:v27];
  }
  v28 = [(HMDLegacyV3Model *)self cloudBlob];
  id v44 = 0;
  v29 = [v12 encryptData:v28 compress:1 error:&v44];
  v30 = (__CFString *)v44;

  if (v30 || !v29)
  {
    v32 = (void *)MEMORY[0x230FBD990]();
    v33 = self;
    v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v35 = HMFGetLogIdentifier();
      v36 = (objc_class *)objc_opt_class();
      NSStringFromClass(v36);
      id v43 = v12;
      id v37 = v11;
      v39 = v38 = a6;
      *(_DWORD *)buf = 138543874;
      v46 = v35;
      __int16 v47 = 2112;
      v48 = v39;
      __int16 v49 = 2112;
      v50 = v30;
      _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_ERROR, "%{public}@-[%@ encodeForCloudZone:error:] failed encryption: %@", buf, 0x20u);

      a6 = v38;
      id v11 = v37;
      id v12 = v43;
    }
    id v31 = 0;
    if (a6) {
      *a6 = v30;
    }
  }
  else
  {
    [v10 setObject:v29 forKeyedSubscript:@"kRecordEncodedDataBlobKey"];
    id v31 = v10;
  }

  return v31;
}

- (HMDLegacyV3Model)init
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"5E034157-5CED-4502-9C16-9428C798883A"];
  v4 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"];
  v7.receiver = self;
  v7.super_class = (Class)HMDLegacyV3Model;
  v5 = [(HMBModel *)&v7 initWithModelID:v3 parentModelID:v4];

  return v5;
}

+ (id)createWithLegacyRecord:(id)a3 modelContainer:(id)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  if (!v11) {
    _HMFPreconditionFailure();
  }
  id v12 = [v8 recordType];
  char v13 = [v12 isEqual:@"HomeDataBlobV3"];

  if (v13)
  {
    id v14 = objc_alloc_init((Class)a1);
    if (v8)
    {
      char v15 = [v8 objectForKeyedSubscript:@"kRecordEncodedDataBlobKey"];
      if (v15)
      {
        id v27 = 0;
        v16 = [v11 decryptData:v15 decompress:1 error:&v27];
        id v17 = v27;
        if (v17)
        {
          v18 = v17;
          context = (void *)MEMORY[0x230FBD990]();
          v19 = (objc_class *)a1;
          v20 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            id v25 = HMFGetLogIdentifier();
            NSStringFromClass(v19);
            v21 = id v24 = v16;
            *(_DWORD *)buf = 138543874;
            v29 = v25;
            __int16 v30 = 2112;
            id v31 = v21;
            __int16 v32 = 2112;
            v33 = v18;
            _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@%@ unable to decrypt data: %@", buf, 0x20u);

            v16 = v24;
          }

          if (a5) {
            *a5 = v18;
          }

          id v22 = 0;
          goto LABEL_20;
        }
        [v14 setCloudBlob:v16];
      }
    }
    id v22 = v14;
LABEL_20:

    goto LABEL_21;
  }
  if (a5)
  {
    [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    id v22 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v22 = 0;
  }
LABEL_21:

  return v22;
}

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_112957 != -1) {
    dispatch_once(&hmbProperties_onceToken_112957, &__block_literal_global_112958);
  }
  v2 = (void *)hmbProperties__properties_112959;
  return v2;
}

void __33__HMDLegacyV3Model_hmbProperties__block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  v3 = @"cloudBlob";
  v0 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v4[0] = v0;
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)hmbProperties__properties_112959;
  hmbProperties__properties_112959 = v1;
}

@end