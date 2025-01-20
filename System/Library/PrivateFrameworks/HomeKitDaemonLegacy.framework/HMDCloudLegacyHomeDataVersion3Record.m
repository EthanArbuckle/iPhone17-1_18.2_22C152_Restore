@interface HMDCloudLegacyHomeDataVersion3Record
+ (id)legacyModelWithHomeDataV3:(id)a3;
- (BOOL)encodeObjectChange:(id)a3;
- (id)data;
- (id)extractObjectChange;
- (id)recordType;
- (unint64_t)objectEncoding;
- (void)clearData;
- (void)setData:(id)a3;
@end

@implementation HMDCloudLegacyHomeDataVersion3Record

- (unint64_t)objectEncoding
{
  return 1;
}

- (void)clearData
{
  id v2 = [(HMDCloudRecord *)self record];
  [v2 setObject:0 forKeyedSubscript:@"kRecordEncodedDataBlobKey"];
}

- (void)setData:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudRecord *)self record];
  [v5 setObject:v4 forKeyedSubscript:@"kRecordEncodedDataBlobKey"];
}

- (id)data
{
  id v2 = [(HMDCloudRecord *)self record];
  v3 = [v2 objectForKeyedSubscript:@"kRecordEncodedDataBlobKey"];

  return v3;
}

- (id)recordType
{
  id v2 = @"HomeDataBlobV3";
  return @"HomeDataBlobV3";
}

- (BOOL)encodeObjectChange:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = [v6 data1];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [v6 data1];
    uint64_t v10 = [v9 length];

    if (v10)
    {
      v11 = [v6 data1];
      v12 = objc_msgSend(v11, "hmd_compressedData");

      id v42 = 0;
      v13 = +[HMDPersistentStore encryptDataWithControllerKey:v12 error:&v42];
      id v14 = v42;
      uint64_t v15 = [v13 length];
      if (v13 && (v16 = v15, (uint64_t v15 = [v13 length]) != 0))
      {
        v40 = v12;
        v17 = [(HMDCloudRecord *)self record];
        [v17 setObject:v13 forKeyedSubscript:@"kRecordEncodedDataBlobKey"];

        v18 = (void *)MEMORY[0x1D9452090]();
        v19 = self;
        v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v21 = id v38 = v14;
          v37 = [(HMDCloudRecord *)v19 record];
          [v37 recordType];
          v22 = v39 = v18;
          v23 = [(HMDCloudRecord *)v19 recordName];
          *(_DWORD *)buf = 138544130;
          v44 = v21;
          __int16 v45 = 2112;
          id v46 = v22;
          __int16 v47 = 2112;
          v48 = v23;
          __int16 v49 = 2048;
          uint64_t v50 = v16;
          _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Legacy homeData record %@/%@ v3: %lu bytes", buf, 0x2Au);

          v18 = v39;
          id v14 = v38;
        }

        id v41 = 0;
        BOOL v24 = 1;
        v25 = [v4 encodeWithEncoding:1 error:&v41];
        id v14 = v41;
        [(HMDCloudRecord *)v19 setCachedData:v25];

        if (!v14)
        {
          v12 = v40;
          goto LABEL_20;
        }
        v26 = (void *)MEMORY[0x1D9452090]();
        v27 = v19;
        v28 = HMFGetOSLogHandle();
        v12 = v40;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v29 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v44 = v29;
          __int16 v45 = 2112;
          id v46 = v14;
          _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode object change with %@", buf, 0x16u);
LABEL_18:
        }
      }
      else
      {
        v26 = (void *)MEMORY[0x1D9452090](v15);
        v34 = self;
        v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          v29 = HMFGetLogIdentifier();
          v35 = [v14 shortDescription];
          *(_DWORD *)buf = 138543618;
          v44 = v29;
          __int16 v45 = 2112;
          id v46 = v35;
          _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@Failed to encrypt home data v3 record due to error: %@", buf, 0x16u);

          goto LABEL_18;
        }
      }

      BOOL v24 = 0;
LABEL_20:

      goto LABEL_21;
    }
  }
  v30 = (void *)MEMORY[0x1D9452090]();
  v31 = self;
  v32 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    v33 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v44 = v33;
    _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_ERROR, "%{public}@No data to encode into the legacy home data record", buf, 0xCu);
  }
  BOOL v24 = 0;
LABEL_21:

  return v24;
}

- (id)extractObjectChange
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDCloudRecord *)self cachedData];
  if (v3)
  {

    goto LABEL_11;
  }
  if ([(HMDCloudRecord *)self isRecordCached])
  {
    char v48 = 0;
    id v4 = [(HMDCloudRecord *)self record];
    id v5 = [v4 objectForKeyedSubscript:@"kRecordEncodedDataBlobKey"];

    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v6 = v5;
      if ([v6 length])
      {
        id v47 = 0;
        uint64_t v7 = +[HMDPersistentStore decryptDataWithControllerKey:v6 totalKeysFound:0 deleteExtraKeys:1 allowControllerIdentifierToChange:1 controllerIdentifierChanged:&v48 successfulKeyUserName:0 error:&v47];
        id v8 = v47;
        v9 = (void *)MEMORY[0x1D9452090]();
        uint64_t v10 = self;
        v11 = HMFGetOSLogHandle();
        BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
        if (v7)
        {
          if (v12)
          {
            v13 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            uint64_t v50 = v13;
            _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Successfully decrypted data version 3", buf, 0xCu);
          }

          goto LABEL_20;
        }
        if (v12)
        {
          v43 = HMFGetLogIdentifier();
          v44 = [v8 shortDescription];
          *(_DWORD *)buf = 138543618;
          uint64_t v50 = v43;
          __int16 v51 = 2112;
          id v52 = v44;
          _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Failed to decrypt data v3 from the cloud due to error: %@", buf, 0x16u);
        }

        v25 = v10;
LABEL_19:
        [(HMDCloudRecord *)v25 setDecryptionFailed:1];
        uint64_t v7 = 0;
LABEL_20:
        if (v48) {
          [(HMDCloudRecord *)self setControllerIdentifierChanged:1];
        }
        id v15 = +[HMDCloudLegacyHomeDataVersion3Record legacyModelWithHomeDataV3:v7];
        id v46 = 0;
        v26 = [v15 encodeWithEncoding:1 error:&v46];
        id v27 = v46;
        [(HMDCloudRecord *)self setCachedData:v26];

        if (v27)
        {
          v28 = (void *)MEMORY[0x1D9452090]();
          v29 = self;
          v30 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            v31 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            uint64_t v50 = v31;
            __int16 v51 = 2112;
            id v52 = v27;
            _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode object change with %@", buf, 0x16u);
          }
        }
        v32 = [(HMDCloudRecord *)self record];
        [v32 setObject:0 forKeyedSubscript:@"kRecordEncodedDataBlobKey"];

        v33 = [(HMDCloudRecord *)self record];
        [v33 setObject:0 forKeyedSubscript:@"kRecordEncodedDataBlobVersion2Key"];

        goto LABEL_27;
      }
    }
    else
    {
      id v6 = 0;
    }
    v21 = (void *)MEMORY[0x1D9452090]();
    v22 = self;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      BOOL v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = v24;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@The record exists but v3 data is not present, marking decryption as failed", buf, 0xCu);
    }
    v25 = v22;
    goto LABEL_19;
  }
LABEL_11:
  id v14 = [(HMDCloudRecord *)self cachedData];
  id v45 = 0;
  id v15 = +[HMDBackingStoreModelObject objectFromData:v14 encoding:1 error:&v45];
  id v16 = v45;

  if (v16)
  {
    v17 = (void *)MEMORY[0x1D9452090]();
    v18 = self;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v50 = v20;
      __int16 v51 = 2112;
      id v52 = v16;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode object change with %@", buf, 0x16u);
    }

LABEL_35:
    v37 = 0;
    goto LABEL_36;
  }
LABEL_27:
  v34 = [(HMDCloudRecord *)self cachedData];

  if (!v34)
  {
    id v38 = (void *)MEMORY[0x1D9452090]();
    v39 = self;
    v40 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      id v41 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = v41;
      _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_ERROR, "%{public}@Cloud legacy home data version3 record was not loaded from disk or fetch from cloud, no cached data", buf, 0xCu);
    }
    goto LABEL_35;
  }
  if (v15)
  {
    v35 = [v15 uuid];

    if (v35)
    {
      v36 = [v15 uuid];
      [(HMDCloudRecord *)self setObjectID:v36];
    }
  }
  id v15 = v15;
  v37 = v15;
LABEL_36:

  return v37;
}

+ (id)legacyModelWithHomeDataV3:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F29128];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithUUIDString:@"5E034157-5CED-4502-9C16-9428C798883A"];
  id v6 = [(HMDBackingStoreModelObject *)[HMDCloudLegacyModelObject alloc] initWithObjectChangeType:1 uuid:v5 parentUUID:0];
  [(HMDCloudLegacyModelObject *)v6 setLegacyRecordType:&unk_1F2DC9760];
  [(HMDCloudLegacyModelObject *)v6 setData1:v4];

  return v6;
}

@end