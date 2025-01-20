@interface HMBCloudZoneRecordPushConflict
- (BOOL)isEqual:(id)a3;
- (CKRecord)ancestorRecord;
- (CKRecord)clientRecord;
- (CKRecord)serverRecord;
- (CKRecordID)recordID;
- (HMBCloudZoneRecordPushConflict)initWithRecordID:(id)a3 clientRecord:(id)a4 serverRecord:(id)a5 ancestorRecord:(id)a6;
- (HMBCloudZoneRecordPushConflict)initWithRecordID:(id)a3 error:(id)a4;
- (id)attributeDescriptions;
- (unint64_t)hash;
@end

@implementation HMBCloudZoneRecordPushConflict

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ancestorRecord, 0);
  objc_storeStrong((id *)&self->_serverRecord, 0);
  objc_storeStrong((id *)&self->_clientRecord, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
}

- (CKRecord)ancestorRecord
{
  return (CKRecord *)objc_getProperty(self, a2, 32, 1);
}

- (CKRecord)serverRecord
{
  return (CKRecord *)objc_getProperty(self, a2, 24, 1);
}

- (CKRecord)clientRecord
{
  return (CKRecord *)objc_getProperty(self, a2, 16, 1);
}

- (CKRecordID)recordID
{
  return (CKRecordID *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v21[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v20 = [(HMBCloudZoneRecordPushConflict *)self recordID];
  v19 = [v20 hmbDescription];
  v18 = (void *)[v3 initWithName:@"Record ID" value:v19];
  v21[0] = v18;
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v5 = [(HMBCloudZoneRecordPushConflict *)self clientRecord];
  v6 = [v5 hmbDescription];
  v7 = (void *)[v4 initWithName:@"Client Record" value:v6];
  v21[1] = v7;
  id v8 = objc_alloc(MEMORY[0x1E4F653F8]);
  v9 = [(HMBCloudZoneRecordPushConflict *)self serverRecord];
  v10 = [v9 hmbDescription];
  v11 = (void *)[v8 initWithName:@"Server Record" value:v10];
  v21[2] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  v13 = [(HMBCloudZoneRecordPushConflict *)self ancestorRecord];
  v14 = [v13 hmbDescription];
  v15 = (void *)[v12 initWithName:@"Ancestor Record" value:v14];
  v21[3] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];

  return v16;
}

- (unint64_t)hash
{
  v2 = [(HMBCloudZoneRecordPushConflict *)self recordID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    v7 = [(HMBCloudZoneRecordPushConflict *)self recordID];
    id v8 = [v6 recordID];
    if (![v7 isEqual:v8]) {
      goto LABEL_9;
    }
    v9 = [(HMBCloudZoneRecordPushConflict *)self clientRecord];
    v10 = [v6 clientRecord];
    int v11 = HMFEqualObjects();

    if (!v11) {
      goto LABEL_9;
    }
    id v12 = [(HMBCloudZoneRecordPushConflict *)self serverRecord];
    v13 = [v6 serverRecord];
    int v14 = HMFEqualObjects();

    if (v14)
    {
      v15 = [(HMBCloudZoneRecordPushConflict *)self ancestorRecord];
      v16 = [v6 ancestorRecord];
      char v17 = HMFEqualObjects();
    }
    else
    {
LABEL_9:
      char v17 = 0;
    }
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

- (HMBCloudZoneRecordPushConflict)initWithRecordID:(id)a3 clientRecord:(id)a4 serverRecord:(id)a5 ancestorRecord:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    v15 = v14;
    v23.receiver = self;
    v23.super_class = (Class)HMBCloudZoneRecordPushConflict;
    v16 = [(HMBCloudZoneRecordPushConflict *)&v23 init];
    char v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_recordID, a3);
      objc_storeStrong((id *)&v17->_clientRecord, a4);
      objc_storeStrong((id *)&v17->_serverRecord, a5);
      objc_storeStrong((id *)&v17->_ancestorRecord, a6);
    }

    return v17;
  }
  else
  {
    v19 = (HMBCloudZoneRecordPushConflict *)_HMFPreconditionFailure();
    return [(HMBCloudZoneRecordPushConflict *)v19 initWithRecordID:v21 error:v22];
  }
}

- (HMBCloudZoneRecordPushConflict)initWithRecordID:(id)a3 error:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![v7 hmbIsCloudKitError]) {
    goto LABEL_18;
  }
  if ([v7 code] == 11)
  {
    self = [(HMBCloudZoneRecordPushConflict *)self initWithRecordID:v6 clientRecord:0 serverRecord:0 ancestorRecord:0];
    id v8 = self;
    goto LABEL_19;
  }
  if ([v7 code] != 14)
  {
LABEL_18:
    id v8 = 0;
    goto LABEL_19;
  }
  v9 = [v7 userInfo];
  v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F19D08]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    id v13 = [v7 userInfo];
    id v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F19D10]];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }
    id v16 = v15;

    if (v16)
    {
      char v17 = [v7 userInfo];
      v18 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F19D00]];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v19 = v18;
      }
      else {
        v19 = 0;
      }
      id v20 = v19;

      if (v20)
      {
        self = [(HMBCloudZoneRecordPushConflict *)self initWithRecordID:v6 clientRecord:v12 serverRecord:v16 ancestorRecord:v20];
        id v8 = self;
      }
      else
      {
        v30 = (void *)MEMORY[0x1D944CB30]();
        self = self;
        v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v32 = HMFGetLogIdentifier();
          v33 = [v7 userInfo];
          int v34 = 138543618;
          v35 = v32;
          __int16 v36 = 2112;
          v37 = v33;
          _os_log_impl(&dword_1D4693000, v31, OS_LOG_TYPE_ERROR, "%{public}@Server record changed error user info does not have ancestor record: %@", (uint8_t *)&v34, 0x16u);
        }
        id v8 = 0;
      }
    }
    else
    {
      v26 = (void *)MEMORY[0x1D944CB30]();
      self = self;
      v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = HMFGetLogIdentifier();
        v29 = [v7 userInfo];
        int v34 = 138543618;
        v35 = v28;
        __int16 v36 = 2112;
        v37 = v29;
        _os_log_impl(&dword_1D4693000, v27, OS_LOG_TYPE_ERROR, "%{public}@Server record changed error user info does not have server record: %@", (uint8_t *)&v34, 0x16u);
      }
      id v8 = 0;
    }
  }
  else
  {
    id v22 = (void *)MEMORY[0x1D944CB30]();
    self = self;
    objc_super v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = HMFGetLogIdentifier();
      v25 = [v7 userInfo];
      int v34 = 138543618;
      v35 = v24;
      __int16 v36 = 2112;
      v37 = v25;
      _os_log_impl(&dword_1D4693000, v23, OS_LOG_TYPE_ERROR, "%{public}@Server record changed error user info does not have client record: %@", (uint8_t *)&v34, 0x16u);
    }
    id v8 = 0;
  }

LABEL_19:
  return v8;
}

@end