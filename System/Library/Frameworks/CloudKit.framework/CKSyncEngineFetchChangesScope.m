@interface CKSyncEngineFetchChangesScope
+ (CKSyncEngineFetchChangesScope)scopeWithZoneIDs:(id)a3 recordIDs:(id)a4 excludedZoneIDs:(id)a5 containsScopeWithZoneIDs:(id)a6 recordIDs:(id)a7 excludedZoneIDs:(id)a8;
- (BOOL)containsScope:(id)a3;
- (BOOL)containsZoneID:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CKSyncEngineFetchChangesScope)init;
- (CKSyncEngineFetchChangesScope)initWithExcludedZoneIDs:(NSSet *)zoneIDs;
- (CKSyncEngineFetchChangesScope)initWithZoneIDs:(NSSet *)zoneIDs;
- (CKSyncEngineFetchChangesScope)initWithZoneIDs:(id)a3 excludedZoneIDs:(id)a4;
- (NSSet)excludedZoneIDs;
- (NSSet)zoneIDs;
- (id)description;
@end

@implementation CKSyncEngineFetchChangesScope

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedZoneIDs, 0);

  objc_storeStrong((id *)&self->_zoneIDs, 0);
}

- (id)description
{
  v5 = objc_msgSend_zoneIDs(self, a2, v2, v3);
  v9 = objc_msgSend_excludedZoneIDs(self, v6, v7, v8);
  v13 = v9;
  if (v5)
  {
    v14 = objc_msgSend_allObjects(v5, v10, v11, v12);
    v17 = objc_msgSend_CKMap_(v14, v15, (uint64_t)&unk_1ED7EF0F8, v16);

    v18 = NSString;
    v21 = objc_msgSend_componentsJoinedByString_(v17, v19, @", ", v20);
    objc_msgSend_stringWithFormat_(v18, v22, @"zoneIDs(%@)", v23, v21);
LABEL_5:
    v35 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  if (objc_msgSend_count(v9, v10, v11, v12))
  {
    v27 = objc_msgSend_allObjects(v13, v24, v25, v26);
    v17 = objc_msgSend_CKMap_(v27, v28, (uint64_t)&unk_1ED7EFCD8, v29);

    v30 = NSString;
    v21 = objc_msgSend_componentsJoinedByString_(v17, v31, @", ", v32);
    objc_msgSend_stringWithFormat_(v30, v33, @"allExcluding(%@)", v34, v21);
    goto LABEL_5;
  }
  v35 = @"all";
LABEL_6:

  return v35;
}

- (NSSet)excludedZoneIDs
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSSet)zoneIDs
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (CKSyncEngineFetchChangesScope)initWithZoneIDs:(NSSet *)zoneIDs
{
  v4 = zoneIDs;
  v5 = objc_opt_new();
  uint64_t v7 = (CKSyncEngineFetchChangesScope *)objc_msgSend_initWithZoneIDs_excludedZoneIDs_(self, v6, (uint64_t)v4, (uint64_t)v5);

  return v7;
}

- (CKSyncEngineFetchChangesScope)initWithZoneIDs:(id)a3 excludedZoneIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CKSyncEngineFetchChangesScope;
  uint64_t v11 = [(CKSyncEngineFetchChangesScope *)&v20 init];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_copy(v6, v8, v9, v10);
    zoneIDs = v11->_zoneIDs;
    v11->_zoneIDs = (NSSet *)v12;

    uint64_t v17 = objc_msgSend_copy(v7, v14, v15, v16);
    excludedZoneIDs = v11->_excludedZoneIDs;
    v11->_excludedZoneIDs = (NSSet *)v17;
  }
  return v11;
}

- (CKSyncEngineFetchChangesScope)init
{
  uint64_t v3 = objc_opt_new();
  v5 = (CKSyncEngineFetchChangesScope *)objc_msgSend_initWithZoneIDs_excludedZoneIDs_(self, v4, 0, (uint64_t)v3);

  return v5;
}

- (CKSyncEngineFetchChangesScope)initWithExcludedZoneIDs:(NSSet *)zoneIDs
{
  return (CKSyncEngineFetchChangesScope *)objc_msgSend_initWithZoneIDs_excludedZoneIDs_(self, a2, 0, (uint64_t)zoneIDs);
}

- (BOOL)containsScope:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_zoneIDs(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_excludedZoneIDs(self, v9, v10, v11);
  uint64_t v16 = objc_msgSend_zoneIDs(v4, v13, v14, v15);
  objc_super v20 = objc_msgSend_excludedZoneIDs(v4, v17, v18, v19);

  char v22 = objc_msgSend_scopeWithZoneIDs_recordIDs_excludedZoneIDs_containsScopeWithZoneIDs_recordIDs_excludedZoneIDs_(CKSyncEngineFetchChangesScope, v21, (uint64_t)v8, 0, v12, v16, 0, v20);
  return v22;
}

+ (CKSyncEngineFetchChangesScope)scopeWithZoneIDs:(id)a3 recordIDs:(id)a4 excludedZoneIDs:(id)a5 containsScopeWithZoneIDs:(id)a6 recordIDs:(id)a7 excludedZoneIDs:(id)a8
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  char v22 = v18;
  if (v13)
  {
    if (v16)
    {
      if ((objc_msgSend_isSubsetOfSet_(v16, v19, (uint64_t)v13, v21) & 1) == 0) {
        goto LABEL_44;
      }
    }
    else
    {
      if (!v17)
      {
        if (!objc_msgSend_count(v18, v19, v20, v21)
          || (objc_msgSend_intersectsSet_(v22, v41, (uint64_t)v13, v42) & 1) != 0)
        {
          goto LABEL_44;
        }
        if (!objc_msgSend_count(v15, v43, v44, v45))
        {
          if (v14)
          {
LABEL_44:
            uint64_t v40 = 0;
            goto LABEL_45;
          }
          goto LABEL_41;
        }
        goto LABEL_22;
      }
      id v67 = v18;
      id v68 = v14;
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      id v23 = v17;
      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v73, (uint64_t)v78, 16);
      if (v25)
      {
        uint64_t v29 = v25;
        uint64_t v30 = *(void *)v74;
LABEL_8:
        uint64_t v31 = 0;
        while (1)
        {
          if (*(void *)v74 != v30) {
            objc_enumerationMutation(v23);
          }
          uint64_t v32 = objc_msgSend_zoneID(*(void **)(*((void *)&v73 + 1) + 8 * v31), v26, v27, v28, v67, v68);
          int v35 = objc_msgSend_containsObject_(v13, v33, (uint64_t)v32, v34);

          if (!v35) {
            goto LABEL_42;
          }
          if (v29 == ++v31)
          {
            uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v73, (uint64_t)v78, 16);
            if (v29) {
              goto LABEL_8;
            }
            break;
          }
        }
      }

      char v22 = v67;
      id v14 = v68;
    }
  }
  if (objc_msgSend_count(v15, v19, v20, v21, v67, v68))
  {
    if (v16)
    {
      char v39 = 0;
      uint64_t v40 = 0;
      if (objc_msgSend_intersectsSet_(v15, v36, (uint64_t)v16, v38)) {
        goto LABEL_45;
      }
      goto LABEL_23;
    }
LABEL_22:
    char v39 = 1;
LABEL_23:
    if (objc_msgSend_count(v22, v36, v37, v38)
      && !objc_msgSend_isSubsetOfSet_(v15, v46, (uint64_t)v22, v48))
    {
      goto LABEL_44;
    }
    uint64_t v49 = objc_msgSend_count(v22, v46, v47, v48);
    char v53 = v39 ^ 1;
    if (v49) {
      char v53 = 1;
    }
    if ((v53 & 1) == 0 && !objc_msgSend_count(v17, v50, v51, v52)) {
      goto LABEL_44;
    }
    id v67 = v22;
    id v68 = v14;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v23 = v17;
    uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v54, (uint64_t)&v69, (uint64_t)v77, 16);
    if (v55)
    {
      uint64_t v59 = v55;
      uint64_t v60 = *(void *)v70;
LABEL_31:
      uint64_t v61 = 0;
      while (1)
      {
        if (*(void *)v70 != v60) {
          objc_enumerationMutation(v23);
        }
        v62 = objc_msgSend_zoneID(*(void **)(*((void *)&v69 + 1) + 8 * v61), v56, v57, v58, v67, v68, (void)v69);
        char v65 = objc_msgSend_containsObject_(v15, v63, (uint64_t)v62, v64);

        if (v65) {
          break;
        }
        if (v59 == ++v61)
        {
          uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v56, (uint64_t)&v69, (uint64_t)v77, 16);
          if (v59) {
            goto LABEL_31;
          }
          goto LABEL_37;
        }
      }
LABEL_42:

      uint64_t v40 = 0;
      char v22 = v67;
      id v14 = v68;
      goto LABEL_45;
    }
LABEL_37:

    char v22 = v67;
    id v14 = v68;
  }
  if (v14 && (!v17 || !objc_msgSend_isSubsetOfSet_(v17, v36, (uint64_t)v14, v38))) {
    goto LABEL_44;
  }
LABEL_41:
  uint64_t v40 = 1;
LABEL_45:

  return (CKSyncEngineFetchChangesScope *)v40;
}

- (BOOL)containsZoneID:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_zoneIDs(self, v5, v6, v7);
  id v14 = objc_msgSend_excludedZoneIDs(self, v9, v10, v11);
  if (v8 && !objc_msgSend_containsObject_(v8, v12, (uint64_t)v4, v13)) {
    LOBYTE(v15) = 0;
  }
  else {
    int v15 = objc_msgSend_containsObject_(v14, v12, (uint64_t)v4, v13) ^ 1;
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
    uint64_t v9 = objc_msgSend_zoneIDs(self, v6, v7, v8);
    uint64_t v13 = objc_msgSend_zoneIDs(v5, v10, v11, v12);
    int v14 = CKObjectsAreBothNilOrEqual(v9, v13);

    if (v14)
    {
      id v18 = objc_msgSend_excludedZoneIDs(self, v15, v16, v17);
      char v22 = objc_msgSend_excludedZoneIDs(v5, v19, v20, v21);
      char v23 = CKObjectsAreBothNilOrEqual(v18, v22);
    }
    else
    {
      char v23 = 0;
    }
  }
  else
  {
    char v23 = 0;
  }

  return v23;
}

@end