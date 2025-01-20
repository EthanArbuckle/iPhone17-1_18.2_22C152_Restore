@interface HMDBackingStoreCacheFetchRecordMappingResult
- (HMDBackingStoreCacheFetchRecordMappingResult)initWithGroup:(id)a3 recordName:(id)a4 uuid:(id)a5 parentUuid:(id)a6 type:(id)a7;
- (HMDBackingStoreCacheGroup)group;
- (NSString)description;
- (NSString)recordName;
- (NSString)type;
- (NSUUID)parentUuid;
- (NSUUID)uuid;
@end

@implementation HMDBackingStoreCacheFetchRecordMappingResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_parentUuid, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_recordName, 0);
}

- (HMDBackingStoreCacheGroup)group
{
  return self->_group;
}

- (NSString)type
{
  return self->_type;
}

- (NSUUID)parentUuid
{
  return self->_parentUuid;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)recordName
{
  return self->_recordName;
}

- (NSString)description
{
  v3 = NSString;
  v16 = [(HMDBackingStoreCacheFetchRecordMappingResult *)self group];
  v15 = [v16 zone];
  v4 = [v15 zoneName];
  v5 = [(HMDBackingStoreCacheFetchRecordMappingResult *)self group];
  v6 = [v5 rootRecordName];
  v7 = [(HMDBackingStoreCacheFetchRecordMappingResult *)self recordName];
  v8 = [(HMDBackingStoreCacheFetchRecordMappingResult *)self uuid];
  v9 = [v8 UUIDString];
  v10 = [(HMDBackingStoreCacheFetchRecordMappingResult *)self parentUuid];
  v11 = [v10 UUIDString];
  v12 = [(HMDBackingStoreCacheFetchRecordMappingResult *)self type];
  v13 = [v3 stringWithFormat:@"<Mapping: zone: %@  group: %@  name: %@  uuid: %@  parent uuid: %@ type: %@>", v4, v6, v7, v9, v11, v12];

  return (NSString *)v13;
}

- (HMDBackingStoreCacheFetchRecordMappingResult)initWithGroup:(id)a3 recordName:(id)a4 uuid:(id)a5 parentUuid:(id)a6 type:(id)a7
{
  id v21 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)HMDBackingStoreCacheFetchRecordMappingResult;
  v17 = [(HMDBackingStoreCacheFetchRecordMappingResult *)&v22 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_group, a3);
    objc_storeStrong((id *)&v18->_recordName, a4);
    objc_storeStrong((id *)&v18->_uuid, a5);
    objc_storeStrong((id *)&v18->_parentUuid, a6);
    objc_storeStrong((id *)&v18->_type, a7);
    v19 = v18;
  }

  return v18;
}

@end