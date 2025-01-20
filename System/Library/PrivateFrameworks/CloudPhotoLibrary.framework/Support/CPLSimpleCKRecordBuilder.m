@interface CPLSimpleCKRecordBuilder
- (CKRecord)ckRecord;
- (CKRecordID)currentUserRecordID;
- (CPLCloudKitScopeProvider)scopeProvider;
- (CPLRecordTargetMapping)targetMapping;
- (CPLSimpleCKRecordBuilder)initWithBaseCKRecord:(id)a3 scopeProvider:(id)a4 currentUserRecordID:(id)a5 targetMapping:(id)a6;
- (id)_recordIDFromScopedIdentifier:(id)a3 cloudKitScope:(id *)a4 error:(id *)a5;
- (id)recordIDForResourcesOfRecordWithScopedIdentifier:(id)a3 cloudKitScope:(id *)a4 error:(id *)a5;
- (void)requestRecordWithID:(id)a3 cloudKitScope:(id)a4 forKey:(id)a5 completionHandler:(id)a6;
- (void)setCKReferenceWithScopedIdentifier:(id)a3 forKey:(id)a4 referenceAction:(unint64_t)a5;
- (void)setEncryptedObject:(id)a3 forKey:(id)a4 validateClass:(Class)a5;
- (void)setLegacyEncryptedObject:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation CPLSimpleCKRecordBuilder

- (CPLSimpleCKRecordBuilder)initWithBaseCKRecord:(id)a3 scopeProvider:(id)a4 currentUserRecordID:(id)a5 targetMapping:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CPLSimpleCKRecordBuilder;
  v15 = [(CPLSimpleCKRecordBuilder *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_ckRecord, a3);
    objc_storeStrong((id *)&v16->_scopeProvider, a4);
    objc_storeStrong((id *)&v16->_currentUserRecordID, a5);
    objc_storeStrong((id *)&v16->_targetMapping, a6);
  }

  return v16;
}

- (id)_recordIDFromScopedIdentifier:(id)a3 cloudKitScope:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  scopeProvider = self->_scopeProvider;
  v10 = [v8 scopeIdentifier];
  id v11 = [(CPLCloudKitScopeProvider *)scopeProvider cloudKitScopeForScopeIdentifier:v10];

  if (v11)
  {
    id v12 = [v8 identifier];
    a5 = [v11 recordIDWithRecordName:v12];

    *a4 = v11;
  }
  else if (a5)
  {
    id v13 = [v8 scopeIdentifier];
    *a5 = +[CPLErrors cplErrorWithCode:2001, @"Can't find CloudKit scope for %@", v13 description];

    a5 = 0;
  }

  return a5;
}

- (id)recordIDForResourcesOfRecordWithScopedIdentifier:(id)a3 cloudKitScope:(id *)a4 error:(id *)a5
{
  id v9 = a3;
  v10 = [(CPLRecordTargetMapping *)self->_targetMapping targetForRecordWithScopedIdentifier:v9];
  if (!v10) {
    sub_1001C7BF8((uint64_t)v9, (uint64_t)a2, (uint64_t)self);
  }
  id v11 = v10;
  id v12 = [v10 resourceScopedIdentifier];
  id v13 = [(CPLSimpleCKRecordBuilder *)self _recordIDFromScopedIdentifier:v12 cloudKitScope:a4 error:a5];

  return v13;
}

- (void)setCKReferenceWithScopedIdentifier:(id)a3 forKey:(id)a4 referenceAction:(unint64_t)a5
{
  id v16 = a3;
  if (v16)
  {
    id v8 = a4;
    id v9 = objc_alloc((Class)CKRecordID);
    v10 = [v16 identifier];
    id v11 = [(CKRecord *)self->_ckRecord recordID];
    id v12 = [v11 zoneID];
    id v13 = [v9 initWithRecordName:v10 zoneID:v12];

    id v14 = [objc_alloc((Class)CKReference) initWithRecordID:v13 action:a5];
    [(CKRecord *)self->_ckRecord setObject:v14 forKey:v8];
  }
  else
  {
    ckRecord = self->_ckRecord;
    id v13 = a4;
    [(CKRecord *)ckRecord setObject:0 forKey:v13];
  }
}

- (void)setEncryptedObject:(id)a3 forKey:(id)a4 validateClass:(Class)a5
{
}

- (void)setLegacyEncryptedObject:(id)a3 forKey:(id)a4
{
}

- (void)setObject:(id)a3 forKey:(id)a4
{
}

- (void)requestRecordWithID:(id)a3 cloudKitScope:(id)a4 forKey:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = +[NSAssertionHandler currentHandler];
  id v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/CloudKit/CPLCKRecordBuilder.m"];
  v17 = NSStringFromSelector(a2);
  [v15 handleFailureInMethod:a2, self, v16, 88, @"%@ is not supported by %@", v17, objc_opt_class() object file lineNumber description];

  abort();
}

- (CKRecord)ckRecord
{
  return self->_ckRecord;
}

- (CPLCloudKitScopeProvider)scopeProvider
{
  return self->_scopeProvider;
}

- (CKRecordID)currentUserRecordID
{
  return self->_currentUserRecordID;
}

- (CPLRecordTargetMapping)targetMapping
{
  return self->_targetMapping;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetMapping, 0);
  objc_storeStrong((id *)&self->_currentUserRecordID, 0);
  objc_storeStrong((id *)&self->_scopeProvider, 0);
  objc_storeStrong((id *)&self->_ckRecord, 0);
}

@end