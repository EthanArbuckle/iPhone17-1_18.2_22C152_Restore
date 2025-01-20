@interface HMDBackingStoreLogRecord
- (CKRecordID)root;
- (HMDBackingStoreLogRecord)initWithArray:(id)a3;
- (NSData)data;
- (id)description;
- (int64_t)encoding;
- (int64_t)pushed;
- (int64_t)rowID;
- (int64_t)type;
- (int64_t)xactID;
@end

@implementation HMDBackingStoreLogRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_root, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (CKRecordID)root
{
  return self->_root;
}

- (int64_t)encoding
{
  return self->_encoding;
}

- (int64_t)type
{
  return self->_type;
}

- (NSData)data
{
  return self->_data;
}

- (int64_t)pushed
{
  return self->_pushed;
}

- (int64_t)xactID
{
  return self->_xactID;
}

- (int64_t)rowID
{
  return self->_rowID;
}

- (id)description
{
  v3 = NSString;
  int64_t v4 = [(HMDBackingStoreLogRecord *)self rowID];
  int64_t v5 = [(HMDBackingStoreLogRecord *)self xactID];
  int64_t v6 = [(HMDBackingStoreLogRecord *)self type];
  int64_t v7 = [(HMDBackingStoreLogRecord *)self encoding];
  int64_t v8 = [(HMDBackingStoreLogRecord *)self pushed];
  v9 = [(HMDBackingStoreLogRecord *)self data];
  uint64_t v10 = [v9 length];
  v11 = [(HMDBackingStoreLogRecord *)self root];
  v12 = [v3 stringWithFormat:@"<HMDBackingStoreLogRecord id: %lld, xact_id: %lld, type: %lld, encoding: %lld, pushed: 0x%llx, size: %llu, root: %@>", v4, v5, v6, v7, v8, v10, v11];

  return v12;
}

- (HMDBackingStoreLogRecord)initWithArray:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)HMDBackingStoreLogRecord;
  int64_t v5 = [(HMDBackingStoreLogRecord *)&v36 init];
  if (v5)
  {
    int64_t v6 = [v4 objectAtIndexedSubscript:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int64_t v7 = v6;
    }
    else {
      int64_t v7 = 0;
    }
    id v8 = v7;

    uint64_t v9 = [v8 integerValue];
    v5->_rowID = v9;
    uint64_t v10 = [v4 objectAtIndexedSubscript:1];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
    id v12 = v11;

    uint64_t v13 = [v12 integerValue];
    v5->_xactID = v13;
    v14 = [v4 objectAtIndexedSubscript:2];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }
    id v16 = v15;

    uint64_t v17 = [v16 integerValue];
    v5->_pushed = v17;
    v18 = [v4 objectAtIndexedSubscript:3];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v19 = v18;
    }
    else {
      v19 = 0;
    }
    v20 = v19;

    data = v5->_data;
    v5->_data = v20;

    v22 = [v4 objectAtIndexedSubscript:4];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v23 = v22;
    }
    else {
      v23 = 0;
    }
    id v24 = v23;

    uint64_t v25 = [v24 integerValue];
    v5->_type = v25;
    v26 = [v4 objectAtIndexedSubscript:5];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v27 = v26;
    }
    else {
      v27 = 0;
    }
    id v28 = v27;

    uint64_t v29 = [v28 integerValue];
    v5->_encoding = v29;
    v30 = [v4 objectAtIndexedSubscript:6];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v31 = v30;
    }
    else {
      v31 = 0;
    }
    id v32 = v31;

    if (v32)
    {
      uint64_t v33 = [MEMORY[0x1E4F1A2F8] parseFromString:v32];
      root = v5->_root;
      v5->_root = (CKRecordID *)v33;
    }
    else
    {
      root = v5->_root;
      v5->_root = 0;
    }
  }
  return v5;
}

@end