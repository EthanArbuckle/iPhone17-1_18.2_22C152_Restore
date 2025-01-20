@interface HMDCloudLegacyHomeDataRecord
+ (id)legacyModelWithHomeDataV0:(id)a3 homeDataV2:(id)a4;
- (BOOL)encodeObjectChange:(id)a3;
- (NSData)dataVersion2;
- (id)data;
- (id)extractObjectChange;
- (id)recordType;
- (unint64_t)objectEncoding;
- (void)clearData;
- (void)setData:(id)a3;
- (void)setDataVersion2:(id)a3;
@end

@implementation HMDCloudLegacyHomeDataRecord

- (unint64_t)objectEncoding
{
  return 1;
}

- (void)clearData
{
  v3 = [(HMDCloudRecord *)self record];
  [v3 setObject:0 forKeyedSubscript:@"kRecordEncodedDataBlobKey"];

  id v4 = [(HMDCloudRecord *)self record];
  [v4 setObject:0 forKeyedSubscript:@"kRecordEncodedDataBlobVersion2Key"];
}

- (void)setDataVersion2:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudRecord *)self record];
  [v5 setObject:v4 forKeyedSubscript:@"kRecordEncodedDataBlobVersion2Key"];
}

- (NSData)dataVersion2
{
  v2 = [(HMDCloudRecord *)self record];
  v3 = [v2 objectForKeyedSubscript:@"kRecordEncodedDataBlobVersion2Key"];

  return (NSData *)v3;
}

- (void)setData:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCloudRecord *)self record];
  [v5 setObject:v4 forKeyedSubscript:@"kRecordEncodedDataBlobKey"];

  v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    int v11 = 138543362;
    v12 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Set read only field to NO", (uint8_t *)&v11, 0xCu);
  }
  v10 = [(HMDCloudRecord *)v7 record];
  [v10 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"kRecordReadOnly"];
}

- (id)data
{
  v2 = [(HMDCloudRecord *)self record];
  v3 = [v2 objectForKeyedSubscript:@"kRecordEncodedDataBlobKey"];

  return v3;
}

- (id)recordType
{
  v2 = @"HomeDataBlob";
  return @"HomeDataBlob";
}

- (BOOL)encodeObjectChange:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
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
    if ([v9 length] && (objc_msgSend(v6, "data2"), (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      int v11 = (void *)v10;
      v12 = [v6 data2];
      uint64_t v13 = [v12 length];

      if (v13)
      {
        v14 = [v6 data1];
        id v53 = 0;
        v15 = +[HMDPersistentStore encryptDataWithControllerKey:v14 error:&v53];
        id v16 = v53;

        uint64_t v17 = [v15 length];
        v18 = [v6 data2];
        uint64_t v19 = objc_msgSend(v18, "hmd_compressedData");

        id v52 = v16;
        v50 = (void *)v19;
        v20 = +[HMDPersistentStore encryptDataWithControllerKey:v19 error:&v52];
        id v21 = v52;

        uint64_t v22 = [v20 length];
        if (v15
          && (v23 = v22, (uint64_t v22 = [v15 length]) != 0)
          && v20
          && (uint64_t v22 = [v20 length]) != 0)
        {
          v24 = [(HMDCloudRecord *)self record];
          [v24 setObject:v15 forKeyedSubscript:@"kRecordEncodedDataBlobKey"];

          v25 = [(HMDCloudRecord *)self record];
          [v25 setObject:v20 forKeyedSubscript:@"kRecordEncodedDataBlobVersion2Key"];

          context = (void *)MEMORY[0x1D9452090]();
          v26 = self;
          log = HMFGetOSLogHandle();
          if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
          {
            v47 = HMFGetLogIdentifier();
            v46 = [(HMDCloudRecord *)v26 record];
            v45 = [v46 recordType];
            uint64_t v27 = [(HMDCloudRecord *)v26 recordName];
            *(_DWORD *)buf = 138544642;
            v55 = v47;
            __int16 v56 = 2112;
            v57 = v45;
            __int16 v58 = 2112;
            uint64_t v59 = v27;
            v28 = (void *)v27;
            __int16 v60 = 2048;
            uint64_t v61 = v17;
            __int16 v62 = 2048;
            uint64_t v63 = v23;
            __int16 v64 = 2048;
            uint64_t v65 = v23 + v17;
            _os_log_impl(&dword_1D49D5000, log, OS_LOG_TYPE_INFO, "%{public}@Legacy homeData record %@/%@ v1: %lu bytes v2: %lu bytes total: %lu bytes", buf, 0x3Eu);
          }
          id v51 = v21;
          BOOL v29 = 1;
          v30 = [v4 encodeWithEncoding:1 error:&v51];
          id v31 = v51;

          [(HMDCloudRecord *)v26 setCachedData:v30];
          if (!v31) {
            goto LABEL_26;
          }
          id v32 = v31;
          v33 = (void *)MEMORY[0x1D9452090]();
          v34 = v26;
          v35 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            v36 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v55 = v36;
            __int16 v56 = 2112;
            v57 = v32;
            _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode object change with %@", buf, 0x16u);
          }
          id v21 = v32;
        }
        else
        {
          v33 = (void *)MEMORY[0x1D9452090](v22);
          v42 = self;
          v35 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            v43 = HMFGetLogIdentifier();
            v44 = [v21 shortDescription];
            *(_DWORD *)buf = 138543618;
            v55 = v43;
            __int16 v56 = 2112;
            v57 = v44;
            _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_INFO, "%{public}@Failed to encrypt home data v1/v2 record due to error: %@", buf, 0x16u);
          }
        }

        BOOL v29 = 0;
LABEL_26:

        goto LABEL_22;
      }
    }
    else
    {
    }
  }
  v37 = (void *)MEMORY[0x1D9452090]();
  v38 = self;
  v39 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    v40 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v55 = v40;
    _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_ERROR, "%{public}@No data to encode into the legacy home data record", buf, 0xCu);
  }
  BOOL v29 = 0;
LABEL_22:

  return v29;
}

- (id)extractObjectChange
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDCloudRecord *)self cachedData];
  if (v3)
  {

    goto LABEL_10;
  }
  if ([(HMDCloudRecord *)self isRecordCached])
  {
    __int16 v74 = 0;
    id v4 = [(HMDCloudRecord *)self record];
    id v5 = [v4 objectForKeyedSubscript:@"kRecordEncodedDataBlobKey"];

    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v6 = v5;
      if ([v6 length])
      {
        id v73 = 0;
        uint64_t v7 = +[HMDPersistentStore decryptDataWithControllerKey:v6 totalKeysFound:0 deleteExtraKeys:1 allowControllerIdentifierToChange:1 controllerIdentifierChanged:(char *)&v74 + 1 successfulKeyUserName:0 error:&v73];
        id v8 = v73;
        BOOL v9 = v7 == 0;
        uint64_t v10 = (void *)MEMORY[0x1D9452090]();
        int v11 = self;
        v12 = HMFGetOSLogHandle();
        BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
        if (v7)
        {
          if (v13)
          {
            v14 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v76 = v14;
            _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Successfully decrypted data version 1", buf, 0xCu);

            BOOL v9 = v7 == 0;
          }
        }
        else if (v13)
        {
          HMFGetLogIdentifier();
          uint64_t v23 = v65 = v10;
          v24 = [v8 shortDescription];
          *(_DWORD *)buf = 138543618;
          v76 = v23;
          __int16 v77 = 2112;
          uint64_t v78 = (uint64_t)v24;
          _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Failed to decrypt data v1 from the cloud due to error: %@", buf, 0x16u);

          BOOL v9 = v7 == 0;
          uint64_t v10 = v65;
        }

        int v22 = 1;
      }
      else
      {
        int v22 = 0;
        BOOL v9 = 0;
        uint64_t v7 = 0;
      }
    }
    else
    {
      int v22 = 0;
      BOOL v9 = 0;
      uint64_t v7 = 0;
      id v6 = 0;
    }
    v25 = [(HMDCloudRecord *)self record];
    v26 = [v25 objectForKeyedSubscript:@"kRecordEncodedDataBlobVersion2Key"];

    if (v26 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v27 = v26;

      if ([v27 length])
      {
        BOOL v67 = v9;
        id v72 = 0;
        v28 = +[HMDPersistentStore decryptDataWithControllerKey:v27 totalKeysFound:0 deleteExtraKeys:1 allowControllerIdentifierToChange:1 controllerIdentifierChanged:&v74 successfulKeyUserName:0 error:&v72];
        id v29 = v72;
        v30 = (void *)MEMORY[0x1D9452090]();
        id v31 = self;
        id v32 = HMFGetOSLogHandle();
        BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_INFO);
        if (v28)
        {
          if (v33)
          {
            HMFGetLogIdentifier();
            v68 = v28;
            v34 = v26;
            v35 = v7;
            v37 = id v36 = v27;
            *(_DWORD *)buf = 138543362;
            v76 = v37;
            _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_INFO, "%{public}@Successfully decrypted data version 2", buf, 0xCu);

            id v27 = v36;
            uint64_t v7 = v35;
            v26 = v34;
            v28 = v68;
          }

          if (v22)
          {
            if (!(HIBYTE(v74) | v74)) {
              goto LABEL_46;
            }
          }
          else if (!(_BYTE)v74)
          {
            goto LABEL_46;
          }
          goto LABEL_45;
        }
        if (v33)
        {
          uint64_t v66 = HMFGetLogIdentifier();
          uint64_t v43 = [v29 shortDescription];
          *(_DWORD *)buf = 138543618;
          v76 = v66;
          __int16 v77 = 2112;
          uint64_t v78 = v43;
          v44 = (void *)v43;
          _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_INFO, "%{public}@Failed to decrypt data v2 from the cloud due to error: %@", buf, 0x16u);
        }

        if ((v22 & 1) == 0)
        {
          int v38 = v74;
          [(HMDCloudRecord *)v31 setDecryptionFailed:1];
          goto LABEL_44;
        }
        int v38 = (HIBYTE(v74) | v74) != 0;
        if (!v67)
        {
LABEL_44:
          v28 = 0;
          if (!v38)
          {
LABEL_46:
            id v16 = +[HMDCloudLegacyHomeDataRecord legacyModelWithHomeDataV0:v7 homeDataV2:v28];
            id v71 = 0;
            v45 = [v16 encodeWithEncoding:1 error:&v71];
            id v46 = v71;
            [(HMDCloudRecord *)self setCachedData:v45];

            if (v46)
            {
              v69 = v28;
              v47 = v26;
              v48 = v7;
              id v49 = v27;
              v50 = (void *)MEMORY[0x1D9452090]();
              id v51 = self;
              id v52 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
              {
                id v53 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                v76 = v53;
                __int16 v77 = 2112;
                uint64_t v78 = (uint64_t)v46;
                _os_log_impl(&dword_1D49D5000, v52, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode object change with %@", buf, 0x16u);
              }
              id v27 = v49;
              uint64_t v7 = v48;
              v26 = v47;
              v28 = v69;
            }
            v54 = [(HMDCloudRecord *)self record];
            [v54 setObject:0 forKeyedSubscript:@"kRecordEncodedDataBlobKey"];

            v55 = [(HMDCloudRecord *)self record];
            [v55 setObject:0 forKeyedSubscript:@"kRecordEncodedDataBlobVersion2Key"];

            goto LABEL_51;
          }
LABEL_45:
          [(HMDCloudRecord *)self setControllerIdentifierChanged:1];
          goto LABEL_46;
        }
LABEL_31:
        [(HMDCloudRecord *)self setDecryptionFailed:1];
        v28 = 0;
        if ((v38 & 1) == 0) {
          goto LABEL_46;
        }
        goto LABEL_45;
      }
    }
    else
    {
      id v27 = v6;
    }
    if ((v22 & 1) == 0)
    {
      v39 = (void *)MEMORY[0x1D9452090]();
      v40 = self;
      v41 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        v42 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v76 = v42;
        _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_ERROR, "%{public}@The record exists but neither v1 or v2 data is present, marking decryption as failed", buf, 0xCu);
      }
      [(HMDCloudRecord *)v40 setDecryptionFailed:1];
      v28 = 0;
      goto LABEL_46;
    }
    int v38 = HIBYTE(v74) != 0;
    if (!v9) {
      goto LABEL_44;
    }
    goto LABEL_31;
  }
LABEL_10:
  v15 = [(HMDCloudRecord *)self cachedData];
  id v70 = 0;
  id v16 = +[HMDBackingStoreModelObject objectFromData:v15 encoding:1 error:&v70];
  id v17 = v70;

  if (v17)
  {
    v18 = (void *)MEMORY[0x1D9452090]();
    uint64_t v19 = self;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v76 = v21;
      __int16 v77 = 2112;
      uint64_t v78 = (uint64_t)v17;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode object change with %@", buf, 0x16u);
    }

LABEL_59:
    uint64_t v59 = 0;
    goto LABEL_60;
  }
LABEL_51:
  __int16 v56 = [(HMDCloudRecord *)self cachedData];

  if (!v56)
  {
    __int16 v60 = (void *)MEMORY[0x1D9452090]();
    uint64_t v61 = self;
    __int16 v62 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      uint64_t v63 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v76 = v63;
      _os_log_impl(&dword_1D49D5000, v62, OS_LOG_TYPE_ERROR, "%{public}@Cloud legacy home data record was not loaded from disk or fetch from cloud, no cached data", buf, 0xCu);
    }
    goto LABEL_59;
  }
  if (v16)
  {
    v57 = [v16 uuid];

    if (v57)
    {
      __int16 v58 = [v16 uuid];
      [(HMDCloudRecord *)self setObjectID:v58];
    }
  }
  id v16 = v16;
  uint64_t v59 = v16;
LABEL_60:

  return v59;
}

+ (id)legacyModelWithHomeDataV0:(id)a3 homeDataV2:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F29128];
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[[v5 alloc] initWithUUIDString:@"ABE49D63-6AE9-4469-A7EF-AC020E0104B3"];
  BOOL v9 = [(HMDBackingStoreModelObject *)[HMDCloudLegacyModelObject alloc] initWithObjectChangeType:1 uuid:v8 parentUUID:0];
  [(HMDCloudLegacyModelObject *)v9 setLegacyRecordType:&unk_1F2DC9748];
  [(HMDCloudLegacyModelObject *)v9 setData1:v7];

  [(HMDCloudLegacyModelObject *)v9 setData2:v6];
  return v9;
}

@end