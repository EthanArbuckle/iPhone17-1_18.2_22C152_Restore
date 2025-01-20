@interface HMDBackingStoreCacheFetchRecordResult
- (CKRecord)record;
- (HMDBackingStoreCacheFetchRecordResult)initWithGroup:(id)a3 record:(id)a4 data:(id)a5 encoding:(unint64_t)a6 uuid:(id)a7;
- (HMDBackingStoreCacheGroup)group;
- (NSData)data;
- (NSUUID)uuid;
- (id)description;
- (unint64_t)encoding;
@end

@implementation HMDBackingStoreCacheFetchRecordResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (unint64_t)encoding
{
  return self->_encoding;
}

- (CKRecord)record
{
  return self->_record;
}

- (NSData)data
{
  return self->_data;
}

- (HMDBackingStoreCacheGroup)group
{
  return self->_group;
}

- (id)description
{
  v15 = NSString;
  v3 = [(HMDBackingStoreCacheFetchRecordResult *)self group];
  v4 = [v3 zone];
  v5 = [v4 zoneName];
  v6 = [(HMDBackingStoreCacheFetchRecordResult *)self group];
  v7 = [v6 rootRecordName];
  v8 = [(HMDBackingStoreCacheFetchRecordResult *)self record];
  v9 = [v8 recordID];
  v10 = [v9 recordName];
  unint64_t v11 = [(HMDBackingStoreCacheFetchRecordResult *)self encoding];
  v12 = [(HMDBackingStoreCacheFetchRecordResult *)self data];
  v13 = [v15 stringWithFormat:@"<Record: zone: %@  group: %@  record.recordName: %@  encoding: %lu data: <%lu bytes>>", v5, v7, v10, v11, objc_msgSend(v12, "length")];

  return v13;
}

- (HMDBackingStoreCacheFetchRecordResult)initWithGroup:(id)a3 record:(id)a4 data:(id)a5 encoding:(unint64_t)a6 uuid:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMDBackingStoreCacheFetchRecordResult;
  v17 = [(HMDBackingStoreCacheFetchRecordResult *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_group, a3);
    objc_storeStrong((id *)&v18->_record, a4);
    objc_storeStrong((id *)&v18->_data, a5);
    v18->_encoding = a6;
    objc_storeStrong((id *)&v18->_uuid, a7);
    v19 = v18;
  }

  return v18;
}

@end