@interface CKSyncEngineFetchedRecordZoneChangesEvent
- (CKSyncEngineFetchedRecordZoneChangesEvent)initWithModifications:(id)a3 deletions:(id)a4 zoneAttributesModifications:(id)a5;
- (NSArray)deletions;
- (NSArray)modifications;
- (NSArray)zoneAttributesModifications;
- (int64_t)type;
- (void)CKDescribePropertiesUsing:(id)a3;
@end

@implementation CKSyncEngineFetchedRecordZoneChangesEvent

- (CKSyncEngineFetchedRecordZoneChangesEvent)initWithModifications:(id)a3 deletions:(id)a4 zoneAttributesModifications:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v47 = 0;
  char v11 = _CKCheckArgument((uint64_t)"modifications", v8, 0, 0, 0, &v47);
  id v12 = v47;
  if ((v11 & 1) == 0) {
    goto LABEL_7;
  }

  id v46 = 0;
  char v13 = _CKCheckArgument((uint64_t)"deletions", v9, 0, 0, 0, &v46);
  id v12 = v46;
  if ((v13 & 1) == 0
    || (v12,
        id v45 = 0,
        char v14 = _CKCheckArgument((uint64_t)"zoneAttributesModifications", v10, 0, 0, 0, &v45),
        id v12 = v45,
        (v14 & 1) == 0))
  {
LABEL_7:
    v32 = v12;
    v33 = [CKException alloc];
    uint64_t v37 = objc_msgSend_code(v32, v34, v35, v36);
    v41 = objc_msgSend_localizedDescription(v32, v38, v39, v40);
    id v43 = (id)objc_msgSend_initWithCode_format_(v33, v42, v37, @"%@", v41);

    objc_exception_throw(v43);
  }

  v44.receiver = self;
  v44.super_class = (Class)CKSyncEngineFetchedRecordZoneChangesEvent;
  v18 = [(CKSyncEngineEvent *)&v44 initInternal];
  if (v18)
  {
    uint64_t v19 = objc_msgSend_copy(v8, v15, v16, v17);
    modifications = v18->_modifications;
    v18->_modifications = (NSArray *)v19;

    uint64_t v24 = objc_msgSend_copy(v9, v21, v22, v23);
    deletions = v18->_deletions;
    v18->_deletions = (NSArray *)v24;

    uint64_t v29 = objc_msgSend_copy(v10, v26, v27, v28);
    zoneAttributesModifications = v18->_zoneAttributesModifications;
    v18->_zoneAttributesModifications = (NSArray *)v29;
  }
  return v18;
}

- (int64_t)type
{
  return 3;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  v23.receiver = self;
  v23.super_class = (Class)CKSyncEngineFetchedRecordZoneChangesEvent;
  id v4 = a3;
  [(CKSyncEngineEvent *)&v23 CKDescribePropertiesUsing:v4];
  id v8 = objc_msgSend_modifications(self, v5, v6, v7, v23.receiver, v23.super_class);
  char v11 = objc_msgSend_CKMap_(v8, v9, (uint64_t)&unk_1ED7EEE78, v10);

  objc_msgSend_addProperty_value_shouldRedact_(v4, v12, @"modifications", (uint64_t)v11, 0);
  uint64_t v16 = objc_msgSend_deletions(self, v13, v14, v15);
  objc_msgSend_addProperty_value_shouldRedact_(v4, v17, @"deletions", (uint64_t)v16, 0);

  v21 = objc_msgSend_zoneAttributesModifications(self, v18, v19, v20);
  objc_msgSend_addProperty_value_shouldRedact_(v4, v22, @"zoneAttributesModifications", (uint64_t)v21, 0);
}

- (NSArray)modifications
{
  return self->_modifications;
}

- (NSArray)deletions
{
  return self->_deletions;
}

- (NSArray)zoneAttributesModifications
{
  return self->_zoneAttributesModifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneAttributesModifications, 0);
  objc_storeStrong((id *)&self->_deletions, 0);

  objc_storeStrong((id *)&self->_modifications, 0);
}

@end