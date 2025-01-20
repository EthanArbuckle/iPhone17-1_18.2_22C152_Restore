@interface HDCloudSyncSerializedRecord
- (HDCloudSyncSerializedRecord)initWithEncodedSystemData:(id)a3 unprotectedDBData:(id)a4 protectedDBData:(id)a5;
- (NSData)protectedDBData;
- (NSData)systemData;
- (NSData)unprotectedDBData;
@end

@implementation HDCloudSyncSerializedRecord

- (HDCloudSyncSerializedRecord)initWithEncodedSystemData:(id)a3 unprotectedDBData:(id)a4 protectedDBData:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HDCloudSyncSerializedRecord;
  v12 = [(HDCloudSyncSerializedRecord *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_systemData, a3);
    objc_storeStrong((id *)&v13->_unprotectedDBData, a4);
    objc_storeStrong((id *)&v13->_protectedDBData, a5);
  }

  return v13;
}

- (NSData)systemData
{
  return self->_systemData;
}

- (NSData)unprotectedDBData
{
  return self->_unprotectedDBData;
}

- (NSData)protectedDBData
{
  return self->_protectedDBData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectedDBData, 0);
  objc_storeStrong((id *)&self->_unprotectedDBData, 0);

  objc_storeStrong((id *)&self->_systemData, 0);
}

@end