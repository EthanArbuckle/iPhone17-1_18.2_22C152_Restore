@interface CKSyncEngineSentDatabaseChangesEvent
- (CKSyncEngineSentDatabaseChangesEvent)initWithSavedZones:(id)a3 failedZoneSaves:(id)a4 deletedZoneIDs:(id)a5 failedZoneDeletes:(id)a6;
- (NSArray)deletedZoneIDs;
- (NSArray)failedZoneSaves;
- (NSArray)savedZones;
- (NSDictionary)failedZoneDeletes;
- (int64_t)type;
- (void)CKDescribePropertiesUsing:(id)a3;
@end

@implementation CKSyncEngineSentDatabaseChangesEvent

- (CKSyncEngineSentDatabaseChangesEvent)initWithSavedZones:(id)a3 failedZoneSaves:(id)a4 deletedZoneIDs:(id)a5 failedZoneDeletes:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v57 = 0;
  char v14 = _CKCheckArgument((uint64_t)"savedZones", v10, 0, 0, 0, &v57);
  id v15 = v57;
  if ((v14 & 1) == 0) {
    goto LABEL_8;
  }

  id v56 = 0;
  char v16 = _CKCheckArgument((uint64_t)"failedZoneSaves", v11, 0, 0, 0, &v56);
  id v15 = v56;
  if ((v16 & 1) == 0) {
    goto LABEL_8;
  }

  id v55 = 0;
  char v17 = _CKCheckArgument((uint64_t)"deletedZoneIDs", v12, 0, 0, 0, &v55);
  id v15 = v55;
  if ((v17 & 1) == 0
    || (v15,
        id v54 = 0,
        char v18 = _CKCheckArgument((uint64_t)"failedZoneDeletes", v13, 0, 0, 0, &v54),
        id v15 = v54,
        (v18 & 1) == 0))
  {
LABEL_8:
    v41 = v15;
    v42 = [CKException alloc];
    uint64_t v46 = objc_msgSend_code(v41, v43, v44, v45);
    v50 = objc_msgSend_localizedDescription(v41, v47, v48, v49);
    id v52 = (id)objc_msgSend_initWithCode_format_(v42, v51, v46, @"%@", v50);

    objc_exception_throw(v52);
  }

  v53.receiver = self;
  v53.super_class = (Class)CKSyncEngineSentDatabaseChangesEvent;
  v22 = [(CKSyncEngineEvent *)&v53 initInternal];
  if (v22)
  {
    uint64_t v23 = objc_msgSend_copy(v10, v19, v20, v21);
    savedZones = v22->_savedZones;
    v22->_savedZones = (NSArray *)v23;

    uint64_t v28 = objc_msgSend_copy(v11, v25, v26, v27);
    failedZoneSaves = v22->_failedZoneSaves;
    v22->_failedZoneSaves = (NSArray *)v28;

    uint64_t v33 = objc_msgSend_copy(v12, v30, v31, v32);
    deletedZoneIDs = v22->_deletedZoneIDs;
    v22->_deletedZoneIDs = (NSArray *)v33;

    uint64_t v38 = objc_msgSend_copy(v13, v35, v36, v37);
    failedZoneDeletes = v22->_failedZoneDeletes;
    v22->_failedZoneDeletes = (NSDictionary *)v38;
  }
  return v22;
}

- (int64_t)type
{
  return 4;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  v25.receiver = self;
  v25.super_class = (Class)CKSyncEngineSentDatabaseChangesEvent;
  id v4 = a3;
  [(CKSyncEngineEvent *)&v25 CKDescribePropertiesUsing:v4];
  v8 = objc_msgSend_savedZones(self, v5, v6, v7, v25.receiver, v25.super_class);
  objc_msgSend_addProperty_value_shouldRedact_(v4, v9, @"savedZones", (uint64_t)v8, 0);

  id v13 = objc_msgSend_failedZoneSaves(self, v10, v11, v12);
  objc_msgSend_addProperty_value_shouldRedact_(v4, v14, @"failedZoneSaves", (uint64_t)v13, 0);

  char v18 = objc_msgSend_deletedZoneIDs(self, v15, v16, v17);
  objc_msgSend_addProperty_value_shouldRedact_(v4, v19, @"deletedZoneIDs", (uint64_t)v18, 0);

  uint64_t v23 = objc_msgSend_failedZoneDeletes(self, v20, v21, v22);
  objc_msgSend_addProperty_value_shouldRedact_(v4, v24, @"failedZoneDeletes", (uint64_t)v23, 0);
}

- (NSArray)savedZones
{
  return self->_savedZones;
}

- (NSArray)failedZoneSaves
{
  return self->_failedZoneSaves;
}

- (NSArray)deletedZoneIDs
{
  return self->_deletedZoneIDs;
}

- (NSDictionary)failedZoneDeletes
{
  return self->_failedZoneDeletes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedZoneDeletes, 0);
  objc_storeStrong((id *)&self->_deletedZoneIDs, 0);
  objc_storeStrong((id *)&self->_failedZoneSaves, 0);

  objc_storeStrong((id *)&self->_savedZones, 0);
}

@end