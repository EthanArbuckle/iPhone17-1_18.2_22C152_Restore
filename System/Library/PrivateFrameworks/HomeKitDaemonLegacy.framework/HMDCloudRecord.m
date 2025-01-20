@interface HMDCloudRecord
+ (id)logCategory;
+ (id)shortDescription;
- (BOOL)controllerIdentifierChanged;
- (BOOL)decryptionFailed;
- (BOOL)encodeObjectChange:(id)a3;
- (BOOL)encryptionFailed;
- (BOOL)isRecordCached;
- (BOOL)isRecordCreated;
- (CKRecord)record;
- (CKRecordID)recordID;
- (HMDCloudRecord)init;
- (HMDCloudRecord)initWithObjectID:(id)a3 recordName:(id)a4 cloudZone:(id)a5;
- (HMDCloudZone)cloudZone;
- (NSData)cachedData;
- (NSData)data;
- (NSString)recordName;
- (NSString)recordType;
- (NSUUID)objectID;
- (id)description;
- (id)extractObjectChange;
- (id)shortDescription;
- (unint64_t)objectEncoding;
- (void)clearData;
- (void)setCachedData:(id)a3;
- (void)setCloudZone:(id)a3;
- (void)setControllerIdentifierChanged:(BOOL)a3;
- (void)setDecryptionFailed:(BOOL)a3;
- (void)setEncryptionFailed:(BOOL)a3;
- (void)setObjectID:(id)a3;
- (void)setRecord:(id)a3;
- (void)setRecordID:(id)a3;
@end

@implementation HMDCloudRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_cachedData, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_destroyWeak((id *)&self->_cloudZone);
  objc_storeStrong((id *)&self->_recordName, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
}

- (BOOL)isRecordCreated
{
  return self->_recordCreated;
}

- (void)setRecord:(id)a3
{
}

- (void)setCachedData:(id)a3
{
}

- (NSData)cachedData
{
  return self->_cachedData;
}

- (void)setRecordID:(id)a3
{
}

- (void)setCloudZone:(id)a3
{
}

- (HMDCloudZone)cloudZone
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudZone);
  return (HMDCloudZone *)WeakRetained;
}

- (NSString)recordName
{
  return self->_recordName;
}

- (void)setControllerIdentifierChanged:(BOOL)a3
{
  self->_controllerIdentifierChanged = a3;
}

- (BOOL)controllerIdentifierChanged
{
  return self->_controllerIdentifierChanged;
}

- (void)setEncryptionFailed:(BOOL)a3
{
  self->_encryptionFailed = a3;
}

- (BOOL)encryptionFailed
{
  return self->_encryptionFailed;
}

- (void)setDecryptionFailed:(BOOL)a3
{
  self->_decryptionFailed = a3;
}

- (BOOL)decryptionFailed
{
  return self->_decryptionFailed;
}

- (void)setObjectID:(id)a3
{
}

- (NSUUID)objectID
{
  return self->_objectID;
}

- (unint64_t)objectEncoding
{
  return 1;
}

- (void)clearData
{
  v3 = [(HMDCloudRecord *)self record];
  [v3 setObject:0 forKeyedSubscript:@"k00"];

  id v4 = [(HMDCloudRecord *)self record];
  [v4 setObject:0 forKeyedSubscript:@"k01"];
}

- (NSData)data
{
  return 0;
}

- (BOOL)isRecordCached
{
  return self->_record != 0;
}

- (CKRecord)record
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  record = self->_record;
  if (!record)
  {
    id v4 = (void *)MEMORY[0x1D9452090](0, a2);
    v5 = self;
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = HMFGetLogIdentifier();
      v8 = [(HMDCloudRecord *)v5 recordType];
      int v15 = 138543618;
      v16 = v7;
      __int16 v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Allocating new %@ record since we don't have one", (uint8_t *)&v15, 0x16u);
    }
    id v9 = objc_alloc(MEMORY[0x1E4F1A2D8]);
    v10 = [(HMDCloudRecord *)v5 recordType];
    v11 = [(HMDCloudRecord *)v5 recordID];
    v12 = (CKRecord *)[v9 initWithRecordType:v10 recordID:v11];
    v13 = self->_record;
    self->_record = v12;

    v5->_recordCreated = 1;
    record = self->_record;
  }
  return record;
}

- (CKRecordID)recordID
{
  recordID = self->_recordID;
  if (!recordID)
  {
    id v4 = [(HMDCloudRecord *)self cloudZone];
    if (v4)
    {
      id v5 = objc_alloc(MEMORY[0x1E4F1A2F8]);
      v6 = [(HMDCloudRecord *)self recordName];
      v7 = [v4 zone];
      v8 = [v7 zoneID];
      id v9 = (CKRecordID *)[v5 initWithRecordName:v6 zoneID:v8];
      v10 = self->_recordID;
      self->_recordID = v9;
    }
    recordID = self->_recordID;
  }
  return recordID;
}

- (NSString)recordType
{
  v2 = @"ObjectRecord";
  return (NSString *)@"ObjectRecord";
}

- (BOOL)encodeObjectChange:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (self)
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
    id v8 = v7;

    if (v8)
    {
      uint64_t v9 = [v8 downloadSize];
      if (v9)
      {
        v10 = (void *)v9;
        v11 = [v8 downloadSize];
        int v12 = [v11 isEqual:&unk_1F2DC9718];

        if (v12)
        {
          v13 = (void *)MEMORY[0x1D9452090]();
          v14 = self;
          int v15 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v16 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v55 = v16;
            __int16 v56 = 2112;
            id v57 = v8;
            _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode software update model object change for cloud due to invalid download size %@ - This change will not go to the cloud", buf, 0x16u);
          }

          __int16 v17 = (void *)MEMORY[0x1D9452090]();
          v18 = v14;
          uint64_t v19 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            v20 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v55 = v20;
            __int16 v56 = 2112;
            id v57 = v6;
            _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Model object is blocked from being pushed to the cloud %@", buf, 0x16u);
          }
LABEL_18:
          BOOL v27 = 0;
          goto LABEL_28;
        }
      }
    }
  }
  id v49 = 0;
  v21 = [v5 encodeWithEncoding:1 error:&v49];
  id v22 = v49;
  [(HMDCloudRecord *)self setCachedData:v21];

  if (v22)
  {
    v23 = (void *)MEMORY[0x1D9452090]();
    v24 = self;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v55 = v26;
      __int16 v56 = 2112;
      id v57 = v22;
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode object change with %@", buf, 0x16u);
    }

    goto LABEL_18;
  }
  v28 = [(HMDCloudRecord *)self cachedData];
  v29 = objc_msgSend(v28, "hmd_compressedData");

  id v48 = 0;
  v30 = +[HMDPersistentStore encryptDataWithControllerKey:v29 error:&v48];
  id v31 = v48;
  BOOL v27 = v30 != 0;
  if (v30)
  {
    v32 = +[HMDBackingStore currentDevice];

    if (v32)
    {
      v52[0] = @"HM.encoding";
      v33 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDCloudRecord objectEncoding](self, "objectEncoding"));
      v52[1] = @"HM.device";
      v53[0] = v33;
      v34 = +[HMDBackingStore currentDevice];
      [v34 identifier];
      v47 = v29;
      v36 = id v35 = v31;
      v37 = [v36 UUIDString];
      v53[1] = v37;
      v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:2];

      id v31 = v35;
      v29 = v47;
    }
    else
    {
      v50[0] = @"HM.encoding";
      v33 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDCloudRecord objectEncoding](self, "objectEncoding"));
      v50[1] = @"HM.device";
      v51[0] = v33;
      v51[1] = @"<unknown device>";
      v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:2];
    }

    v43 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v38 requiringSecureCoding:1 error:0];
    v44 = [(HMDCloudRecord *)self record];
    [v44 setObject:v43 forKeyedSubscript:@"k00"];

    v45 = [(HMDCloudRecord *)self record];
    [v45 setObject:v30 forKeyedSubscript:@"k01"];
  }
  else
  {
    v39 = (void *)MEMORY[0x1D9452090]();
    v40 = self;
    v41 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v42 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v55 = v42;
      __int16 v56 = 2112;
      id v57 = v31;
      _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_ERROR, "%{public}@Failed to encrypt object change data with %@", buf, 0x16u);
    }
    [(HMDCloudRecord *)v40 setEncryptionFailed:1];
  }

LABEL_28:
  return v27;
}

- (id)extractObjectChange
{
  v82[3] = *MEMORY[0x1E4F143B8];
  v3 = [(HMDCloudRecord *)self cachedData];
  if (v3)
  {

LABEL_17:
    id v18 = 0;
    goto LABEL_18;
  }
  if (![(HMDCloudRecord *)self isRecordCached]) {
    goto LABEL_17;
  }
  id v4 = (void *)MEMORY[0x1E4F28DC0];
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  v82[0] = objc_opt_class();
  v82[1] = objc_opt_class();
  v82[2] = objc_opt_class();
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:3];
  v7 = [v5 setWithArray:v6];
  id v8 = [(HMDCloudRecord *)self record];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"k00"];
  id v71 = 0;
  v10 = [v4 unarchivedObjectOfClasses:v7 fromData:v9 error:&v71];
  id v11 = v71;

  if (!v10)
  {
    int v12 = (void *)MEMORY[0x1D9452090]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v73 = v15;
      __int16 v74 = 2114;
      uint64_t v75 = (uint64_t)v11;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive cloud record version dictionary from record data: %{public}@", buf, 0x16u);
    }
  }
  id v16 = v10;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    __int16 v17 = v16;
  }
  else {
    __int16 v17 = 0;
  }
  id v18 = v17;

  uint64_t v19 = [(HMDCloudRecord *)self record];
  v20 = [v19 objectForKeyedSubscript:@"k01"];

  if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v21 = (void *)MEMORY[0x1D9452090]();
    id v22 = self;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = HMFGetLogIdentifier();
      uint64_t v25 = [v20 length];
      *(_DWORD *)buf = 138543618;
      v73 = v24;
      __int16 v74 = 2048;
      uint64_t v75 = v25;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@[HomeKit Data Usage Metric Log] Object changed record encrypted data size (extractObjectChange): %lu", buf, 0x16u);
    }
    id v70 = 0;
    v26 = +[HMDPersistentStore decryptDataWithControllerKey:v20 totalKeysFound:0 deleteExtraKeys:0 allowControllerIdentifierToChange:0 controllerIdentifierChanged:0 successfulKeyUserName:0 error:&v70];
    id v27 = v70;
    if (v26)
    {
      v28 = objc_msgSend(v26, "hmd_uncompressedData");
      [(HMDCloudRecord *)v22 setCachedData:v28];

      v29 = [(HMDCloudRecord *)v22 record];
      [v29 setObject:0 forKeyedSubscript:@"k00"];

      v30 = [(HMDCloudRecord *)v22 record];
      [v30 setObject:0 forKeyedSubscript:@"k01"];

      int v31 = 0;
    }
    else
    {
      id v68 = v18;
      v59 = (void *)MEMORY[0x1D9452090]();
      v60 = v22;
      v61 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v62 = v66 = v59;
        v63 = [v27 shortDescription];
        *(_DWORD *)buf = 138543618;
        v73 = v62;
        __int16 v74 = 2112;
        uint64_t v75 = (uint64_t)v63;
        _os_log_impl(&dword_1D49D5000, v61, OS_LOG_TYPE_INFO, "%{public}@Failed to decrypt data in object record due to error: %@", buf, 0x16u);

        v59 = v66;
      }

      int v31 = 1;
      [(HMDCloudRecord *)v60 setDecryptionFailed:1];
      id v18 = v68;
    }
  }
  else
  {
    v55 = (void *)MEMORY[0x1D9452090]();
    __int16 v56 = self;
    id v57 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      uint64_t v58 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v73 = v58;
      _os_log_impl(&dword_1D49D5000, v57, OS_LOG_TYPE_ERROR, "%{public}@Cannot find data in record", buf, 0xCu);
    }
    int v31 = 1;
  }

  if (v31) {
    goto LABEL_43;
  }
LABEL_18:
  v32 = [(HMDCloudRecord *)self cachedData];

  if (!v32)
  {
    v42 = (void *)MEMORY[0x1D9452090]();
    v43 = self;
    v44 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v45 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v73 = v45;
      _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_ERROR, "%{public}@Cloud record was not loaded from disk or fetch from cloud, no cached data", buf, 0xCu);
    }
LABEL_43:
    id v41 = 0;
    goto LABEL_44;
  }
  v33 = [(HMDCloudRecord *)self cachedData];
  id v69 = 0;
  v34 = +[HMDBackingStoreModelObject objectFromData:v33 encoding:1 error:&v69];
  id v35 = v69;

  v36 = (void *)MEMORY[0x1D9452090]();
  v37 = self;
  v38 = HMFGetOSLogHandle();
  v39 = v38;
  if (v35)
  {
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v40 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v73 = v40;
      __int16 v74 = 2112;
      uint64_t v75 = (uint64_t)v35;
      _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode object change with %@", buf, 0x16u);
    }
    id v41 = 0;
  }
  else
  {
    v67 = v18;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v46 = HMFGetLogIdentifier();
      v65 = [(HMDCloudRecord *)v37 record];
      uint64_t v47 = [v65 size];
      id v48 = [(HMDCloudRecord *)v37 record];
      id v49 = [v48 recordID];
      uint64_t v50 = objc_msgSend(v67, "hmf_stringForKey:", @"HM.device");
      v51 = (void *)v50;
      *(_DWORD *)buf = 138544386;
      v52 = @"<UNKNOWN>";
      v73 = v46;
      if (v50) {
        v52 = (__CFString *)v50;
      }
      __int16 v74 = 2048;
      uint64_t v75 = v47;
      __int16 v76 = 2112;
      v77 = v49;
      __int16 v78 = 2112;
      v79 = v34;
      __int16 v80 = 2112;
      v81 = v52;
      _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@fetched cloud record (%lu bytes) %@ (%@) from %@", buf, 0x34u);
    }
    if (v34)
    {
      v53 = [v34 uuid];

      if (v53)
      {
        v54 = [v34 uuid];
        [(HMDCloudRecord *)v37 setObjectID:v54];
      }
    }
    id v41 = v34;
    id v18 = v67;
  }

LABEL_44:
  return v41;
}

- (id)description
{
  v2 = NSString;
  v3 = [(HMDCloudRecord *)self shortDescription];
  id v4 = [v2 stringWithFormat:@"<%@>", v3];

  return v4;
}

- (id)shortDescription
{
  v3 = NSString;
  id v4 = [(id)objc_opt_class() shortDescription];
  id v5 = [(HMDCloudRecord *)self objectID];
  id v6 = [v5 UUIDString];
  v7 = [(HMDCloudRecord *)self recordName];
  id v8 = [v3 stringWithFormat:@"%@ %@ %@", v4, v6, v7];

  return v8;
}

- (HMDCloudRecord)initWithObjectID:(id)a3 recordName:(id)a4 cloudZone:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDCloudRecord;
  id v11 = [(HMDCloudRecord *)&v15 init];
  if (v11)
  {
    int v12 = v8;
    if (!v8)
    {
      int v12 = [MEMORY[0x1E4F29128] UUID];
    }
    objc_storeStrong((id *)&v11->_objectID, v12);
    if (!v8) {

    }
    objc_storeWeak((id *)&v11->_cloudZone, v10);
    v13 = v9;
    if (!v9)
    {
      int v12 = [MEMORY[0x1E4F29128] UUID];
      v13 = [v12 UUIDString];
    }
    objc_storeStrong((id *)&v11->_recordName, v13);
    if (!v9)
    {
    }
  }

  return v11;
}

- (HMDCloudRecord)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_153254 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_153254, &__block_literal_global_153255);
  }
  v2 = (void *)logCategory__hmf_once_v1_153256;
  return v2;
}

uint64_t __29__HMDCloudRecord_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_153256;
  logCategory__hmf_once_v1_153256 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end