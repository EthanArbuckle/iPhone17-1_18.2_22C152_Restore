@interface HDRollSyncIdentityDeviceKeyValueEntriesOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (HDRollSyncIdentityDeviceKeyValueEntriesOperation)initWithCoder:(id)a3;
- (HDRollSyncIdentityDeviceKeyValueEntriesOperation)initWithOldSyncIdentity:(id)a3 newSyncIdentity:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDRollSyncIdentityDeviceKeyValueEntriesOperation

- (HDRollSyncIdentityDeviceKeyValueEntriesOperation)initWithOldSyncIdentity:(id)a3 newSyncIdentity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDRollSyncIdentityDeviceKeyValueEntriesOperation;
  v9 = [(HDRollSyncIdentityDeviceKeyValueEntriesOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_oldSyncIdentity, a3);
    objc_storeStrong((id *)&v10->_newSyncIdentity, a4);
  }

  return v10;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 syncIdentityManager];
  v11 = [v10 concreteIdentityForIdentity:self->_oldSyncIdentity shouldCreate:1 transaction:v9 error:a5];

  if (v11)
  {
    objc_super v12 = [v8 syncIdentityManager];
    v13 = [v12 concreteIdentityForIdentity:self->_newSyncIdentity shouldCreate:1 transaction:v9 error:a5];

    if (v13)
    {
      v14 = +[HDDeviceContextEntity lookupOrCreateDeviceContextForSyncIdentity:v13 WithTransaction:v9 error:a5];
      if (v14)
      {
        v15 = [v13 entity];
        v16 = +[HDDeviceContextEntity deviceContextEntityWithSyncIdentity:transaction:error:](HDDeviceContextEntity, "deviceContextEntityWithSyncIdentity:transaction:error:", [v15 persistentID], v9, a5);

        if (v16)
        {
          v26 = v14;
          v17 = [v11 entity];
          uint64_t v18 = [v17 persistentID];
          v19 = [v13 entity];
          BOOL v20 = +[HDDeviceKeyValueStorageEntryEntity replaceEntriesForOldSyncIdentity:withNewSyncIdentity:deviceContextID:transaction:error:](HDDeviceUnprotectedKeyValueStorageEntryEntity, "replaceEntriesForOldSyncIdentity:withNewSyncIdentity:deviceContextID:transaction:error:", v18, [v19 persistentID], objc_msgSend(v16, "persistentID"), v9, a5);

          if (v20)
          {
            v21 = [v11 entity];
            uint64_t v22 = [v21 persistentID];
            v23 = [v13 entity];
            BOOL v24 = +[HDDeviceKeyValueStorageEntryEntity replaceEntriesForOldSyncIdentity:withNewSyncIdentity:deviceContextID:transaction:error:](HDDeviceKeyValueStorageEntryEntity, "replaceEntriesForOldSyncIdentity:withNewSyncIdentity:deviceContextID:transaction:error:", v22, [v23 persistentID], objc_msgSend(v16, "persistentID"), v9, a5);
          }
          else
          {
            BOOL v24 = 0;
          }
          v14 = v26;
        }
        else
        {
          BOOL v24 = 0;
        }
      }
      else
      {
        BOOL v24 = 0;
      }
    }
    else
    {
      BOOL v24 = 0;
    }
  }
  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDRollSyncIdentityDeviceKeyValueEntriesOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"OldSyncIdentity"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NewSyncIdentity"];

  id v7 = [(HDRollSyncIdentityDeviceKeyValueEntriesOperation *)self initWithOldSyncIdentity:v5 newSyncIdentity:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  oldSyncIdentity = self->_oldSyncIdentity;
  id v5 = a3;
  [v5 encodeObject:oldSyncIdentity forKey:@"OldSyncIdentity"];
  [v5 encodeObject:self->_newSyncIdentity forKey:@"NewSyncIdentity"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newSyncIdentity, 0);

  objc_storeStrong((id *)&self->_oldSyncIdentity, 0);
}

@end