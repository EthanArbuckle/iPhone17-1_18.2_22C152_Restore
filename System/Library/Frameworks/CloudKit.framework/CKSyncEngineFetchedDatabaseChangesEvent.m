@interface CKSyncEngineFetchedDatabaseChangesEvent
- (CKSyncEngineFetchedDatabaseChangesEvent)initWithModifications:(id)a3 deletions:(id)a4;
- (NSArray)deletions;
- (NSArray)modifications;
- (int64_t)type;
- (void)CKDescribePropertiesUsing:(id)a3;
@end

@implementation CKSyncEngineFetchedDatabaseChangesEvent

- (CKSyncEngineFetchedDatabaseChangesEvent)initWithModifications:(id)a3 deletions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v37 = 0;
  char v8 = _CKCheckArgument((uint64_t)"modifications", v6, 0, 0, 0, &v37);
  id v9 = v37;
  if ((v8 & 1) == 0
    || (v9,
        id v36 = 0,
        char v10 = _CKCheckArgument((uint64_t)"deletions", v7, 0, 0, 0, &v36),
        id v9 = v36,
        (v10 & 1) == 0))
  {
    v23 = v9;
    v24 = [CKException alloc];
    uint64_t v28 = objc_msgSend_code(v23, v25, v26, v27);
    v32 = objc_msgSend_localizedDescription(v23, v29, v30, v31);
    id v34 = (id)objc_msgSend_initWithCode_format_(v24, v33, v28, @"%@", v32);

    objc_exception_throw(v34);
  }

  v35.receiver = self;
  v35.super_class = (Class)CKSyncEngineFetchedDatabaseChangesEvent;
  v14 = [(CKSyncEngineEvent *)&v35 initInternal];
  if (v14)
  {
    uint64_t v15 = objc_msgSend_copy(v6, v11, v12, v13);
    modifications = v14->_modifications;
    v14->_modifications = (NSArray *)v15;

    uint64_t v20 = objc_msgSend_copy(v7, v17, v18, v19);
    deletions = v14->_deletions;
    v14->_deletions = (NSArray *)v20;
  }
  return v14;
}

- (int64_t)type
{
  return 2;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CKSyncEngineFetchedDatabaseChangesEvent;
  id v4 = a3;
  [(CKSyncEngineEvent *)&v15 CKDescribePropertiesUsing:v4];
  char v8 = objc_msgSend_modifications(self, v5, v6, v7, v15.receiver, v15.super_class);
  objc_msgSend_addProperty_value_shouldRedact_(v4, v9, @"modifications", (uint64_t)v8, 0);

  uint64_t v13 = objc_msgSend_deletions(self, v10, v11, v12);
  objc_msgSend_addProperty_value_shouldRedact_(v4, v14, @"deletions", (uint64_t)v13, 0);
}

- (NSArray)modifications
{
  return self->_modifications;
}

- (NSArray)deletions
{
  return self->_deletions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletions, 0);

  objc_storeStrong((id *)&self->_modifications, 0);
}

@end