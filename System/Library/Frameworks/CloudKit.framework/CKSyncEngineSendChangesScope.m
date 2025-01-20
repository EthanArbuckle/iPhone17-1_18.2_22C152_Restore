@interface CKSyncEngineSendChangesScope
- (BOOL)containsPendingRecordZoneChange:(CKSyncEnginePendingRecordZoneChange *)pendingRecordZoneChange;
- (BOOL)containsRecordID:(CKRecordID *)recordID;
- (BOOL)containsScope:(id)a3;
- (BOOL)containsZoneOrRecordWithZoneID:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CKSyncEngineSendChangesScope)init;
- (CKSyncEngineSendChangesScope)initWithExcludedZoneIDs:(NSSet *)excludedZoneIDs;
- (CKSyncEngineSendChangesScope)initWithRecordIDs:(NSSet *)recordIDs;
- (CKSyncEngineSendChangesScope)initWithZoneIDs:(NSSet *)zoneIDs;
- (CKSyncEngineSendChangesScope)initWithZoneIDs:(id)a3 excludedZoneIDs:(id)a4 recordIDs:(id)a5;
- (NSSet)excludedZoneIDs;
- (NSSet)recordIDs;
- (NSSet)zoneIDs;
- (id)description;
@end

@implementation CKSyncEngineSendChangesScope

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIDs, 0);
  objc_storeStrong((id *)&self->_excludedZoneIDs, 0);

  objc_storeStrong((id *)&self->_zoneIDs, 0);
}

- (id)description
{
  v5 = objc_msgSend_zoneIDs(self, a2, v2, v3);
  v9 = objc_msgSend_excludedZoneIDs(self, v6, v7, v8);
  v16 = objc_msgSend_recordIDs(self, v10, v11, v12);
  if (v5)
  {
    v17 = objc_msgSend_allObjects(v5, v13, v14, v15);
    v20 = objc_msgSend_CKMap_(v17, v18, (uint64_t)&unk_1ED7EFDD8, v19);

    v21 = NSString;
    v24 = objc_msgSend_componentsJoinedByString_(v20, v22, @", ", v23);
    objc_msgSend_stringWithFormat_(v21, v25, @"zoneIDs(%@)", v26, v24);
LABEL_7:
    v46 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  if (objc_msgSend_count(v9, v13, v14, v15))
  {
    v30 = objc_msgSend_allObjects(v9, v27, v28, v29);
    v20 = objc_msgSend_CKMap_(v30, v31, (uint64_t)&unk_1ED7EFDF8, v32);

    v33 = NSString;
    v24 = objc_msgSend_componentsJoinedByString_(v20, v34, @", ", v35);
    objc_msgSend_stringWithFormat_(v33, v36, @"allExcluding(%@)", v37, v24);
    goto LABEL_7;
  }
  if (v16)
  {
    v38 = objc_msgSend_allObjects(v16, v27, v28, v29);
    v20 = objc_msgSend_CKMap_(v38, v39, (uint64_t)&unk_1ED7EFE38, v40);

    v41 = NSString;
    v24 = objc_msgSend_componentsJoinedByString_(v20, v42, @", ", v43);
    objc_msgSend_stringWithFormat_(v41, v44, @"recordIDs(%@)", v45, v24);
    goto LABEL_7;
  }
  v46 = @"all";
LABEL_8:

  return v46;
}

- (NSSet)excludedZoneIDs
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSSet)zoneIDs
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (NSSet)recordIDs
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (CKSyncEngineSendChangesScope)initWithZoneIDs:(NSSet *)zoneIDs
{
  v4 = zoneIDs;
  v5 = objc_opt_new();
  uint64_t v7 = (CKSyncEngineSendChangesScope *)objc_msgSend_initWithZoneIDs_excludedZoneIDs_recordIDs_(self, v6, (uint64_t)v4, (uint64_t)v5, 0);

  return v7;
}

- (CKSyncEngineSendChangesScope)initWithZoneIDs:(id)a3 excludedZoneIDs:(id)a4 recordIDs:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)CKSyncEngineSendChangesScope;
  uint64_t v14 = [(CKSyncEngineSendChangesScope *)&v28 init];
  if (v14)
  {
    uint64_t v15 = objc_msgSend_copy(v8, v11, v12, v13);
    zoneIDs = v14->_zoneIDs;
    v14->_zoneIDs = (NSSet *)v15;

    uint64_t v20 = objc_msgSend_copy(v9, v17, v18, v19);
    excludedZoneIDs = v14->_excludedZoneIDs;
    v14->_excludedZoneIDs = (NSSet *)v20;

    uint64_t v25 = objc_msgSend_copy(v10, v22, v23, v24);
    recordIDs = v14->_recordIDs;
    v14->_recordIDs = (NSSet *)v25;
  }
  return v14;
}

- (CKSyncEngineSendChangesScope)init
{
  uint64_t v3 = objc_opt_new();
  v5 = (CKSyncEngineSendChangesScope *)objc_msgSend_initWithZoneIDs_excludedZoneIDs_recordIDs_(self, v4, 0, (uint64_t)v3, 0);

  return v5;
}

- (CKSyncEngineSendChangesScope)initWithExcludedZoneIDs:(NSSet *)excludedZoneIDs
{
  return (CKSyncEngineSendChangesScope *)objc_msgSend_initWithZoneIDs_excludedZoneIDs_recordIDs_(self, a2, 0, (uint64_t)excludedZoneIDs, 0);
}

- (CKSyncEngineSendChangesScope)initWithRecordIDs:(NSSet *)recordIDs
{
  v4 = recordIDs;
  v5 = objc_opt_new();
  uint64_t v7 = (CKSyncEngineSendChangesScope *)objc_msgSend_initWithZoneIDs_excludedZoneIDs_recordIDs_(self, v6, 0, (uint64_t)v5, v4);

  return v7;
}

- (BOOL)containsScope:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_zoneIDs(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_recordIDs(self, v9, v10, v11);
  v16 = objc_msgSend_excludedZoneIDs(self, v13, v14, v15);
  uint64_t v20 = objc_msgSend_zoneIDs(v4, v17, v18, v19);
  uint64_t v24 = objc_msgSend_recordIDs(v4, v21, v22, v23);
  objc_super v28 = objc_msgSend_excludedZoneIDs(v4, v25, v26, v27);

  char v30 = objc_msgSend_scopeWithZoneIDs_recordIDs_excludedZoneIDs_containsScopeWithZoneIDs_recordIDs_excludedZoneIDs_(CKSyncEngineFetchChangesScope, v29, (uint64_t)v8, (uint64_t)v12, v16, v20, v24, v28);
  return v30;
}

- (BOOL)containsRecordID:(CKRecordID *)recordID
{
  id v4 = recordID;
  id v8 = objc_msgSend_zoneIDs(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_recordIDs(self, v9, v10, v11);
  v16 = v12;
  if (v12 && !objc_msgSend_containsObject_(v12, v13, (uint64_t)v4, v15)
    || v8
    && (objc_msgSend_zoneID(v4, v13, v14, v15),
        v17 = objc_claimAutoreleasedReturnValue(),
        int v20 = objc_msgSend_containsObject_(v8, v18, (uint64_t)v17, v19),
        v17,
        !v20))
  {
    char v29 = 0;
  }
  else
  {
    v21 = objc_msgSend_excludedZoneIDs(self, v13, v14, v15);
    uint64_t v25 = objc_msgSend_zoneID(v4, v22, v23, v24);
    char v28 = objc_msgSend_containsObject_(v21, v26, (uint64_t)v25, v27);

    char v29 = v28 ^ 1;
  }

  return v29;
}

- (BOOL)containsPendingRecordZoneChange:(CKSyncEnginePendingRecordZoneChange *)pendingRecordZoneChange
{
  v5 = objc_msgSend_recordID(pendingRecordZoneChange, a2, (uint64_t)pendingRecordZoneChange, v3);
  LOBYTE(self) = objc_msgSend_containsRecordID_(self, v6, (uint64_t)v5, v7);

  return (char)self;
}

- (BOOL)containsZoneOrRecordWithZoneID:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v8 = objc_msgSend_excludedZoneIDs(self, v5, v6, v7);
  char v11 = objc_msgSend_containsObject_(v8, v9, (uint64_t)v4, v10);

  if (v11)
  {
    LOBYTE(v15) = 0;
  }
  else
  {
    v16 = objc_msgSend_zoneIDs(self, v12, v13, v14);
    int v20 = v16;
    if (v16)
    {
      LOBYTE(v15) = objc_msgSend_containsObject_(v16, v17, (uint64_t)v4, v19);
    }
    else
    {
      v21 = objc_msgSend_recordIDs(self, v17, v18, v19);
      if (objc_msgSend_count(v21, v22, v23, v24))
      {
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v25 = v21;
        uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v37, (uint64_t)v41, 16);
        if (v15)
        {
          uint64_t v30 = *(void *)v38;
          while (2)
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v38 != v30) {
                objc_enumerationMutation(v25);
              }
              uint64_t v32 = objc_msgSend_zoneID(*(void **)(*((void *)&v37 + 1) + 8 * i), v27, v28, v29, (void)v37);
              char isEqual = objc_msgSend_isEqual_(v32, v33, (uint64_t)v4, v34);

              if (isEqual)
              {
                LOBYTE(v15) = 1;
                goto LABEL_16;
              }
            }
            uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v27, (uint64_t)&v37, (uint64_t)v41, 16);
            if (v15) {
              continue;
            }
            break;
          }
        }
LABEL_16:
      }
      else
      {
        LOBYTE(v15) = 1;
      }
    }
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v9 = objc_msgSend_recordIDs(self, v6, v7, v8);
    uint64_t v13 = objc_msgSend_recordIDs(v5, v10, v11, v12);
    int v14 = CKObjectsAreBothNilOrEqual(v9, v13);

    if (v14
      && (objc_msgSend_zoneIDs(self, v15, v16, v17),
          uint64_t v18 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend_zoneIDs(v5, v19, v20, v21),
          uint64_t v22 = objc_claimAutoreleasedReturnValue(),
          int v23 = CKObjectsAreBothNilOrEqual(v18, v22),
          v22,
          v18,
          v23))
    {
      uint64_t v27 = objc_msgSend_excludedZoneIDs(self, v24, v25, v26);
      v31 = objc_msgSend_excludedZoneIDs(v5, v28, v29, v30);
      char v32 = CKObjectsAreBothNilOrEqual(v27, v31);
    }
    else
    {
      char v32 = 0;
    }
  }
  else
  {
    char v32 = 0;
  }

  return v32;
}

@end