@interface HDDeleteAllDeviceContextKeyValueEntriesOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (HDDeleteAllDeviceContextKeyValueEntriesOperation)initWithCoder:(id)a3;
- (HDDeleteAllDeviceContextKeyValueEntriesOperation)initWithSyncIdentity:(id)a3;
- (id)transactionContext;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDDeleteAllDeviceContextKeyValueEntriesOperation

- (HDDeleteAllDeviceContextKeyValueEntriesOperation)initWithSyncIdentity:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDDeleteAllDeviceContextKeyValueEntriesOperation;
  v6 = [(HDDeleteAllDeviceContextKeyValueEntriesOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_syncIdentity, a3);
  }

  return v7;
}

- (id)transactionContext
{
  return +[HDDatabaseTransactionContext contextForWritingProtectedData];
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a4;
  objc_super v9 = [a3 syncIdentityManager];
  v10 = [v9 concreteIdentityForIdentity:self->_syncIdentity shouldCreate:0 transaction:v8 error:a5];

  if (v10)
  {
    v11 = [v10 entity];
    BOOL v12 = +[HDDeviceKeyValueStorageEntryEntity removeEntitesForKeys:domain:syncEntityIdentity:transaction:error:](HDDeviceProtectedKeyValueStorageEntryEntity, "removeEntitesForKeys:domain:syncEntityIdentity:transaction:error:", 0, 0, [v11 persistentID], v8, a5);
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDDeleteAllDeviceContextKeyValueEntriesOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SyncIdentity"];

  v6 = [(HDDeleteAllDeviceContextKeyValueEntriesOperation *)self initWithSyncIdentity:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void).cxx_destruct
{
}

@end