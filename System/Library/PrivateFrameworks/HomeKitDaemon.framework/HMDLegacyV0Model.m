@interface HMDLegacyV0Model
+ (id)createWithLegacyRecord:(id)a3 modelContainer:(id)a4 error:(id *)a5;
+ (id)hmbProperties;
- (HMDLegacyV0Model)init;
- (id)encodeWithExistingRecord:(id)a3 cloudZone:(id)a4 modelContainer:(id)a5 error:(id *)a6;
@end

@implementation HMDLegacyV0Model

- (id)encodeWithExistingRecord:(id)a3 cloudZone:(id)a4 modelContainer:(id)a5 error:(id *)a6
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  if (!v13)
  {
    _HMFPreconditionFailure();
    goto LABEL_35;
  }
  if (!v9)
  {
    v23 = [v10 zoneID];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v24 = v23;
    }
    else {
      v24 = 0;
    }
    id v25 = v24;

    if (v25)
    {
      id v26 = objc_alloc(MEMORY[0x263EFD7E8]);
      v27 = [v25 zoneID];
      v28 = (void *)[v26 initWithRecordName:@"84968B22-8974-4102-AAA6-7B9C763A14B5" zoneID:v27];

      id v9 = (id)[objc_alloc(MEMORY[0x263EFD7C8]) initWithRecordType:@"HomeDataBlob" recordID:v28];
      goto LABEL_15;
    }
LABEL_35:
    _HMFPreconditionFailure();
  }
  v14 = [v9 recordID];
  v15 = [v14 recordName];
  char v16 = [v15 isEqual:@"84968B22-8974-4102-AAA6-7B9C763A14B5"];

  if ((v16 & 1) == 0)
  {
    v17 = (void *)MEMORY[0x230FBD990]();
    v18 = self;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = v53 = v17;
      [v9 recordID];
      v21 = id v54 = v10;
      v22 = [v21 recordName];
      *(_DWORD *)buf = 138543874;
      v61 = v20;
      __int16 v62 = 2112;
      v63 = v22;
      __int16 v64 = 2112;
      v65 = @"84968B22-8974-4102-AAA6-7B9C763A14B5";
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@UNEXPECTED RECORD NAME MISMATCH (V0) %@ != %@", buf, 0x20u);

      id v10 = v54;
      v17 = v53;
    }
  }
LABEL_15:
  v29 = [(HMDLegacyV0Model *)self cloudBlob];
  id v59 = 0;
  v30 = [v13 encryptData:v29 compress:0 error:&v59];
  v31 = (__CFString *)v59;

  if (v31 || !v30)
  {
    v36 = (void *)MEMORY[0x230FBD990]();
    v37 = self;
    v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = HMFGetLogIdentifier();
      v40 = (objc_class *)objc_opt_class();
      NSStringFromClass(v40);
      id v55 = v11;
      id v41 = v13;
      v43 = id v42 = v10;
      *(_DWORD *)buf = 138543874;
      v61 = v39;
      __int16 v62 = 2112;
      v63 = v43;
      __int16 v64 = 2112;
      v65 = v31;
      _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_ERROR, "%{public}@-[%@ encodeWithExistingRecord:error:] failed encryption: %@", buf, 0x20u);

      id v10 = v42;
      id v13 = v41;
      id v11 = v55;
    }
    if (a6)
    {
      v31 = v31;
      id v35 = 0;
      *a6 = v31;
    }
    else
    {
      id v35 = 0;
    }
  }
  else
  {
    [v9 setObject:v30 forKeyedSubscript:@"kRecordEncodedDataBlobKey"];
    v32 = [(HMDLegacyV0Model *)self cloudBlobV2];
    id v58 = 0;
    uint64_t v33 = [v13 encryptData:v32 compress:1 error:&v58];
    v31 = (__CFString *)v58;

    if (v31 || !v33)
    {
      v44 = (void *)MEMORY[0x230FBD990]();
      v45 = self;
      v46 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        v47 = HMFGetLogIdentifier();
        v48 = (objc_class *)objc_opt_class();
        NSStringFromClass(v48);
        id v56 = v11;
        id v49 = v13;
        v51 = id v50 = v10;
        *(_DWORD *)buf = 138543874;
        v61 = v47;
        __int16 v62 = 2112;
        v63 = v51;
        __int16 v64 = 2112;
        v65 = v31;
        _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_ERROR, "%{public}@-[%@ encodeWithExistingRecord:error:] failed encryption: %@", buf, 0x20u);

        id v10 = v50;
        id v13 = v49;
        id v11 = v56;
      }
      if (a6)
      {
        v31 = v31;
        id v35 = 0;
        *a6 = v31;
      }
      else
      {
        id v35 = 0;
      }
    }
    else
    {
      [v9 setObject:v33 forKeyedSubscript:@"kRecordEncodedDataBlobVersion2Key"];
      v34 = [(HMDLegacyV0Model *)self cloudBlobsReadOnly];
      [v9 setObject:v34 forKeyedSubscript:@"kRecordReadOnly"];

      id v35 = v9;
      v31 = 0;
    }
    v30 = (void *)v33;
  }

  return v35;
}

- (HMDLegacyV0Model)init
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"ABE49D63-6AE9-4469-A7EF-AC020E0104B3"];
  v4 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"];
  v7.receiver = self;
  v7.super_class = (Class)HMDLegacyV0Model;
  v5 = [(HMBModel *)&v7 initWithModelID:v3 parentModelID:v4];

  return v5;
}

+ (id)createWithLegacyRecord:(id)a3 modelContainer:(id)a4 error:(id *)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 recordType];
  char v11 = [v10 isEqual:@"HomeDataBlob"];

  if (v11)
  {
    v12 = objc_alloc_init(HMDLegacyV0Model);
    if (!v12)
    {
      v22 = 0;
LABEL_30:

      goto LABEL_31;
    }
    id v13 = [v8 objectForKeyedSubscript:@"kRecordEncodedDataBlobKey"];
    if (v13)
    {
      id v42 = 0;
      v14 = [v9 decryptData:v13 decompress:0 error:&v42];
      id v15 = v42;
      if (v15)
      {
        char v16 = v15;
        context = (void *)MEMORY[0x230FBD990]();
        id v17 = a1;
        v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v19 = v37 = v14;
          v20 = (objc_class *)objc_opt_class();
          v21 = NSStringFromClass(v20);
          *(_DWORD *)buf = 138543874;
          v44 = v19;
          __int16 v45 = 2112;
          v46 = v21;
          __int16 v47 = 2112;
          v48 = v16;
          _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@%@ unable to decrypt data: %@", buf, 0x20u);

          v14 = v37;
        }

        if (a5) {
          *a5 = v16;
        }

        v22 = 0;
        goto LABEL_29;
      }
      if (v14) {
        [(HMDLegacyV0Model *)v12 setCloudBlob:v14];
      }
    }
    uint64_t v23 = [v8 objectForKeyedSubscript:@"kRecordEncodedDataBlobVersion2Key"];

    if (v23)
    {
      id v41 = 0;
      v24 = [v9 decryptData:v23 decompress:1 error:&v41];
      id v25 = v41;
      if (v25)
      {
        id v26 = v25;
        v27 = (void *)MEMORY[0x230FBD990]();
        id v28 = a1;
        v29 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v30 = v38 = v24;
          v31 = (objc_class *)objc_opt_class();
          NSStringFromClass(v31);
          v32 = contexta = v27;
          *(_DWORD *)buf = 138543874;
          v44 = v30;
          __int16 v45 = 2112;
          v46 = v32;
          __int16 v47 = 2112;
          v48 = v26;
          _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@%@ unable to decrypt data: %@", buf, 0x20u);

          v27 = contexta;
          v24 = v38;
        }

        if (a5) {
          *a5 = v26;
        }

        v22 = 0;
        goto LABEL_28;
      }
      if (v24) {
        [(HMDLegacyV0Model *)v12 setCloudBlobV2:v24];
      }
    }
    uint64_t v33 = NSNumber;
    v34 = [v8 objectForKeyedSubscript:@"kRecordReadOnly"];
    id v35 = objc_msgSend(v33, "numberWithBool:", objc_msgSend(v34, "BOOLValue"));
    [(HMBModel *)v12 hmbSetProperty:v35 named:@"cloudBlobsReadOnly"];

    v22 = v12;
LABEL_28:
    id v13 = (void *)v23;
LABEL_29:

    goto LABEL_30;
  }
  if (a5)
  {
    [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    v22 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
LABEL_31:

  return v22;
}

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_161902 != -1) {
    dispatch_once(&hmbProperties_onceToken_161902, &__block_literal_global_161903);
  }
  v2 = (void *)hmbProperties__properties_161904;
  return v2;
}

void __33__HMDLegacyV0Model_hmbProperties__block_invoke()
{
  v6[3] = *MEMORY[0x263EF8340];
  v5[0] = @"cloudBlob";
  v0 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v6[0] = v0;
  v5[1] = @"cloudBlobV2";
  v1 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v6[1] = v1;
  v5[2] = @"cloudBlobsReadOnly";
  v2 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v6[2] = v2;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:3];
  v4 = (void *)hmbProperties__properties_161904;
  hmbProperties__properties_161904 = v3;
}

@end