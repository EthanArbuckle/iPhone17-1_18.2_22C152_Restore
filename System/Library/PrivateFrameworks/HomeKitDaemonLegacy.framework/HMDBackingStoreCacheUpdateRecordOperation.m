@interface HMDBackingStoreCacheUpdateRecordOperation
- (CKRecord)record;
- (HMDBackingStoreCacheGroup)group;
- (HMDBackingStoreCacheUpdateRecordOperation)initWithGroup:(id)a3 name:(id)a4 model:(id)a5 resultBlock:(id)a6;
- (HMDBackingStoreCacheUpdateRecordOperation)initWithGroup:(id)a3 name:(id)a4 record:(id)a5 data:(id)a6 encoding:(unint64_t)a7 model:(id)a8 resultBlock:(id)a9;
- (HMDBackingStoreCacheUpdateRecordOperation)initWithGroup:(id)a3 record:(id)a4 data:(id)a5 encoding:(unint64_t)a6 resultBlock:(id)a7;
- (HMDBackingStoreCacheUpdateRecordOperation)initWithGroup:(id)a3 record:(id)a4 resultBlock:(id)a5;
- (HMDBackingStoreModelObject)model;
- (NSData)data;
- (NSString)recordName;
- (id)mainReturningError;
- (unint64_t)encoding;
@end

@implementation HMDBackingStoreCacheUpdateRecordOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_recordName, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

- (unint64_t)encoding
{
  return self->_encoding;
}

- (HMDBackingStoreModelObject)model
{
  return (HMDBackingStoreModelObject *)objc_getProperty(self, a2, 312, 1);
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 304, 1);
}

- (CKRecord)record
{
  return (CKRecord *)objc_getProperty(self, a2, 296, 1);
}

- (NSString)recordName
{
  return (NSString *)objc_getProperty(self, a2, 288, 1);
}

- (HMDBackingStoreCacheGroup)group
{
  return (HMDBackingStoreCacheGroup *)objc_getProperty(self, a2, 280, 1);
}

- (id)mainReturningError
{
  v3 = [(HMDBackingStoreOperation *)self store];
  v4 = [v3 local];
  v5 = [(HMDBackingStoreOperation *)self store];
  v6 = [v5 uuid];
  v7 = [v6 UUIDString];
  id v19 = 0;
  uint64_t v8 = [v4 _fetchIDForStore:v7 error:&v19];
  id v9 = v19;

  if (v9)
  {
    id v10 = v9;
  }
  else
  {
    v11 = [(HMDBackingStoreCacheUpdateRecordOperation *)self record];

    v12 = [(HMDBackingStoreOperation *)self store];
    v13 = [v12 local];
    v14 = [(HMDBackingStoreCacheUpdateRecordOperation *)self group];
    uint64_t v15 = [v14 groupID];
    if (v11)
    {
      v16 = [(HMDBackingStoreCacheUpdateRecordOperation *)self record];
      v17 = [(HMDBackingStoreCacheUpdateRecordOperation *)self data];
      objc_msgSend(v13, "_updateRecordWithGroupID:store:record:data:encoding:", v15, v8, v16, v17, -[HMDBackingStoreCacheUpdateRecordOperation encoding](self, "encoding"));
    }
    else
    {
      v16 = [(HMDBackingStoreCacheUpdateRecordOperation *)self recordName];
      v17 = [(HMDBackingStoreCacheUpdateRecordOperation *)self model];
      [v13 _updateRecordWithGroupID:v15 store:v8 name:v16 model:v17];
    }
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (HMDBackingStoreCacheUpdateRecordOperation)initWithGroup:(id)a3 name:(id)a4 model:(id)a5 resultBlock:(id)a6
{
  return [(HMDBackingStoreCacheUpdateRecordOperation *)self initWithGroup:a3 name:a4 record:0 data:0 encoding:0 model:a5 resultBlock:a6];
}

- (HMDBackingStoreCacheUpdateRecordOperation)initWithGroup:(id)a3 record:(id)a4 resultBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v9 objectForKey:@"k00"];
  v12 = (HMDBackingStoreCacheUpdateRecordOperation *)[v11 integerValue];

  if (v12)
  {
    v13 = objc_msgSend(NSString, "stringWithFormat:", @"k%02lu", v12);
    v14 = [v9 objectForKey:v13];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = 0;
    }
    id v16 = v15;

    if (v16)
    {
      self = [(HMDBackingStoreCacheUpdateRecordOperation *)self initWithGroup:v8 name:0 record:v9 data:v16 encoding:v12 model:0 resultBlock:v10];
      v12 = self;
    }
    else
    {
      v12 = 0;
    }
  }
  return v12;
}

- (HMDBackingStoreCacheUpdateRecordOperation)initWithGroup:(id)a3 record:(id)a4 data:(id)a5 encoding:(unint64_t)a6 resultBlock:(id)a7
{
  return [(HMDBackingStoreCacheUpdateRecordOperation *)self initWithGroup:a3 name:0 record:a4 data:a5 encoding:a6 model:0 resultBlock:a7];
}

- (HMDBackingStoreCacheUpdateRecordOperation)initWithGroup:(id)a3 name:(id)a4 record:(id)a5 data:(id)a6 encoding:(unint64_t)a7 model:(id)a8 resultBlock:(id)a9
{
  uint64_t v15 = (HMDBackingStoreCacheGroup *)a3;
  id v16 = (NSString *)a4;
  v17 = (CKRecord *)a5;
  v18 = (NSData *)a6;
  id v19 = (HMDBackingStoreModelObject *)a8;
  v31.receiver = self;
  v31.super_class = (Class)HMDBackingStoreCacheUpdateRecordOperation;
  v20 = [(HMDBackingStoreOperation *)&v31 initWithResultBlock:a9];
  group = v20->_group;
  v20->_group = v15;
  v22 = v15;

  recordName = v20->_recordName;
  v20->_recordName = v16;
  v24 = v16;

  record = v20->_record;
  v20->_record = v17;
  v26 = v17;

  data = v20->_data;
  v20->_data = v18;
  v28 = v18;

  v20->_encoding = a7;
  model = v20->_model;
  v20->_model = v19;

  return v20;
}

@end