@interface HMDCloudLegacyMetadataRecord
+ (id)legacyModelWithMetadata:(id)a3;
- (BOOL)encodeObjectChange:(id)a3;
- (id)data;
- (id)extractObjectChange;
- (id)recordType;
- (unint64_t)objectEncoding;
- (void)clearData;
- (void)setData:(id)a3;
@end

@implementation HMDCloudLegacyMetadataRecord

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
  id v2 = @"MetadataBlob";
  return @"MetadataBlob";
}

- (BOOL)encodeObjectChange:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
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
  if (v7
    && (v8 = (void *)v7,
        [v6 data1],
        v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 length],
        v9,
        v8,
        v10))
  {
    v11 = [v6 data1];
    uint64_t v12 = [v11 length];

    v13 = [v6 data1];
    v14 = [(HMDCloudRecord *)self record];
    [v14 setObject:v13 forKeyedSubscript:@"kRecordEncodedDataBlobKey"];

    v15 = (void *)MEMORY[0x1D9452090]();
    v16 = self;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = HMFGetLogIdentifier();
      v19 = [(HMDCloudRecord *)v16 record];
      v20 = [v19 recordType];
      v21 = [(HMDCloudRecord *)v16 recordName];
      *(_DWORD *)buf = 138544130;
      v36 = v18;
      __int16 v37 = 2112;
      id v38 = v20;
      __int16 v39 = 2112;
      v40 = v21;
      __int16 v41 = 2048;
      uint64_t v42 = v12;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Legacy metadata record %@/%@ %lu bytes", buf, 0x2Au);
    }
    id v34 = 0;
    v22 = [v4 encodeWithEncoding:1 error:&v34];
    id v23 = v34;
    [(HMDCloudRecord *)v16 setCachedData:v22];

    BOOL v24 = v23 == 0;
    if (v23)
    {
      v25 = (void *)MEMORY[0x1D9452090]();
      v26 = v16;
      v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v36 = v28;
        __int16 v37 = 2112;
        id v38 = v23;
        _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode object change with %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v29 = (void *)MEMORY[0x1D9452090]();
    v30 = self;
    v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v36 = v32;
      _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@No data to encode into the legacy metadata record", buf, 0xCu);
    }
    BOOL v24 = 0;
  }

  return v24;
}

- (id)extractObjectChange
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDCloudRecord *)self cachedData];
  if (v3)
  {
  }
  else if ([(HMDCloudRecord *)self isRecordCached])
  {
    id v4 = [(HMDCloudRecord *)self record];
    id v5 = [v4 objectForKeyedSubscript:@"kRecordEncodedDataBlobKey"];

    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v6 = +[HMDCloudLegacyMetadataRecord legacyModelWithMetadata:v5];
    }
    else
    {
      id v6 = 0;
    }
    id v30 = 0;
    v13 = [v6 encodeWithEncoding:1 error:&v30];
    id v14 = v30;
    [(HMDCloudRecord *)self setCachedData:v13];

    if (v14)
    {
      v15 = (void *)MEMORY[0x1D9452090]();
      v16 = self;
      v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v32 = v18;
        __int16 v33 = 2112;
        id v34 = v14;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode object change with %@", buf, 0x16u);
      }
    }
    v19 = [(HMDCloudRecord *)self record];
    [v19 setObject:0 forKeyedSubscript:@"kRecordEncodedDataBlobKey"];

    goto LABEL_17;
  }
  uint64_t v7 = [(HMDCloudRecord *)self cachedData];
  id v29 = 0;
  id v6 = +[HMDBackingStoreModelObject objectFromData:v7 encoding:1 error:&v29];
  id v8 = v29;

  if (v8)
  {
    v9 = (void *)MEMORY[0x1D9452090]();
    uint64_t v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v32 = v12;
      __int16 v33 = 2112;
      id v34 = v8;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode object change with %@", buf, 0x16u);
    }

LABEL_25:
    id v23 = 0;
    goto LABEL_26;
  }
LABEL_17:
  v20 = [(HMDCloudRecord *)self cachedData];

  if (!v20)
  {
    BOOL v24 = (void *)MEMORY[0x1D9452090]();
    v25 = self;
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v32 = v27;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@Cloud legacy metadata record was not loaded from disk or fetch from cloud, no cached data", buf, 0xCu);
    }
    goto LABEL_25;
  }
  if (v6)
  {
    v21 = [v6 uuid];

    if (v21)
    {
      v22 = [v6 uuid];
      [(HMDCloudRecord *)self setObjectID:v22];
    }
  }
  id v6 = v6;
  id v23 = v6;
LABEL_26:

  return v23;
}

+ (id)legacyModelWithMetadata:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F29128];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithUUIDString:@"457C009B-1DA4-4B71-BD69-93D344A81A8B"];
  id v6 = [(HMDBackingStoreModelObject *)[HMDCloudLegacyModelObject alloc] initWithObjectChangeType:1 uuid:v5 parentUUID:0];
  [(HMDCloudLegacyModelObject *)v6 setLegacyRecordType:&unk_1F2DC9730];
  [(HMDCloudLegacyModelObject *)v6 setData1:v4];

  return v6;
}

@end