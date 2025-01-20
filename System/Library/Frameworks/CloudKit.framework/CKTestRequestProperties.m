@interface CKTestRequestProperties
+ (BOOL)supportsSecureCoding;
- (CKRoughlyEquivalentProperties)equivalencyProperties;
- (CKTestRequestProperties)initWithCoder:(id)a3;
- (CKTestRequestProperties)initWithEquivalencyProperties:(id)a3;
- (NSArray)allRecordIDs;
- (NSArray)allRecordZoneIDs;
- (NSArray)deleteMergeableValueIDs;
- (NSArray)deleteRecordIDs;
- (NSArray)deleteRecordZoneIDs;
- (NSArray)fetchMergeableValueIDs;
- (NSArray)fetchRecordIDs;
- (NSArray)fetchRecordZoneIDs;
- (NSArray)modifyMergeableValueIDs;
- (NSArray)modifyRecordIDs;
- (NSArray)modifyRecordZoneIDs;
- (NSArray)modifySubscriptionRecordZoneIDs;
- (int64_t)databaseScope;
- (void)encodeWithCoder:(id)a3;
- (void)setDatabaseScope:(int64_t)a3;
- (void)setDeleteMergeableValueIDs:(id)a3;
- (void)setDeleteRecordIDs:(id)a3;
- (void)setDeleteRecordZoneIDs:(id)a3;
- (void)setFetchMergeableValueIDs:(id)a3;
- (void)setFetchRecordIDs:(id)a3;
- (void)setFetchRecordZoneIDs:(id)a3;
- (void)setModifyMergeableValueIDs:(id)a3;
- (void)setModifyRecordIDs:(id)a3;
- (void)setModifyRecordZoneIDs:(id)a3;
- (void)setModifySubscriptionRecordZoneIDs:(id)a3;
@end

@implementation CKTestRequestProperties

- (CKTestRequestProperties)initWithEquivalencyProperties:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKTestRequestProperties;
  v6 = [(CKTestRequestProperties *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_equivalencyProperties, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  equivalencyProperties = self->_equivalencyProperties;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_equivalencyProperties);
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)equivalencyProperties, (uint64_t)v6);

  modifyRecordIDs = self->_modifyRecordIDs;
  objc_super v9 = NSStringFromSelector(sel_modifyRecordIDs);
  objc_msgSend_encodeObject_forKey_(v5, v10, (uint64_t)modifyRecordIDs, (uint64_t)v9);

  deleteRecordIDs = self->_deleteRecordIDs;
  v12 = NSStringFromSelector(sel_deleteRecordIDs);
  objc_msgSend_encodeObject_forKey_(v5, v13, (uint64_t)deleteRecordIDs, (uint64_t)v12);

  fetchRecordIDs = self->_fetchRecordIDs;
  v15 = NSStringFromSelector(sel_fetchRecordIDs);
  objc_msgSend_encodeObject_forKey_(v5, v16, (uint64_t)fetchRecordIDs, (uint64_t)v15);

  modifyRecordZoneIDs = self->_modifyRecordZoneIDs;
  v18 = NSStringFromSelector(sel_modifyRecordZoneIDs);
  objc_msgSend_encodeObject_forKey_(v5, v19, (uint64_t)modifyRecordZoneIDs, (uint64_t)v18);

  deleteRecordZoneIDs = self->_deleteRecordZoneIDs;
  v21 = NSStringFromSelector(sel_deleteRecordZoneIDs);
  objc_msgSend_encodeObject_forKey_(v5, v22, (uint64_t)deleteRecordZoneIDs, (uint64_t)v21);

  fetchRecordZoneIDs = self->_fetchRecordZoneIDs;
  v24 = NSStringFromSelector(sel_fetchRecordZoneIDs);
  objc_msgSend_encodeObject_forKey_(v5, v25, (uint64_t)fetchRecordZoneIDs, (uint64_t)v24);

  modifyMergeableValueIDs = self->_modifyMergeableValueIDs;
  v27 = NSStringFromSelector(sel_modifyMergeableValueIDs);
  objc_msgSend_encodeObject_forKey_(v5, v28, (uint64_t)modifyMergeableValueIDs, (uint64_t)v27);

  deleteMergeableValueIDs = self->_deleteMergeableValueIDs;
  v30 = NSStringFromSelector(sel_deleteMergeableValueIDs);
  objc_msgSend_encodeObject_forKey_(v5, v31, (uint64_t)deleteMergeableValueIDs, (uint64_t)v30);

  fetchMergeableValueIDs = self->_fetchMergeableValueIDs;
  v33 = NSStringFromSelector(sel_fetchMergeableValueIDs);
  objc_msgSend_encodeObject_forKey_(v5, v34, (uint64_t)fetchMergeableValueIDs, (uint64_t)v33);

  modifySubscriptionRecordZoneIDs = self->_modifySubscriptionRecordZoneIDs;
  v36 = NSStringFromSelector(sel_modifySubscriptionRecordZoneIDs);
  objc_msgSend_encodeObject_forKey_(v5, v37, (uint64_t)modifySubscriptionRecordZoneIDs, (uint64_t)v36);

  int64_t databaseScope = self->_databaseScope;
  NSStringFromSelector(sel_databaseScope);
  id v40 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeInteger_forKey_(v5, v39, databaseScope, (uint64_t)v40);
}

- (CKTestRequestProperties)initWithCoder:(id)a3
{
  v125[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v115.receiver = self;
  v115.super_class = (Class)CKTestRequestProperties;
  id v5 = [(CKTestRequestProperties *)&v115 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_equivalencyProperties);
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v6, (uint64_t)v7);
    equivalencyProperties = v5->_equivalencyProperties;
    v5->_equivalencyProperties = (CKRoughlyEquivalentProperties *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    v125[0] = objc_opt_class();
    v125[1] = objc_opt_class();
    v13 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v12, (uint64_t)v125, 2);
    v16 = objc_msgSend_setWithArray_(v11, v14, (uint64_t)v13, v15);
    v17 = NSStringFromSelector(sel_modifyRecordIDs);
    uint64_t v19 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v18, (uint64_t)v16, (uint64_t)v17);
    modifyRecordIDs = v5->_modifyRecordIDs;
    v5->_modifyRecordIDs = (NSArray *)v19;

    v21 = (void *)MEMORY[0x1E4F1CAD0];
    v124[0] = objc_opt_class();
    v124[1] = objc_opt_class();
    v23 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v22, (uint64_t)v124, 2);
    v26 = objc_msgSend_setWithArray_(v21, v24, (uint64_t)v23, v25);
    v27 = NSStringFromSelector(sel_deleteRecordIDs);
    uint64_t v29 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v28, (uint64_t)v26, (uint64_t)v27);
    deleteRecordIDs = v5->_deleteRecordIDs;
    v5->_deleteRecordIDs = (NSArray *)v29;

    v31 = (void *)MEMORY[0x1E4F1CAD0];
    v123[0] = objc_opt_class();
    v123[1] = objc_opt_class();
    v33 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v32, (uint64_t)v123, 2);
    v36 = objc_msgSend_setWithArray_(v31, v34, (uint64_t)v33, v35);
    v37 = NSStringFromSelector(sel_fetchRecordIDs);
    uint64_t v39 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v38, (uint64_t)v36, (uint64_t)v37);
    fetchRecordIDs = v5->_fetchRecordIDs;
    v5->_fetchRecordIDs = (NSArray *)v39;

    v41 = (void *)MEMORY[0x1E4F1CAD0];
    v122[0] = objc_opt_class();
    v122[1] = objc_opt_class();
    v43 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v42, (uint64_t)v122, 2);
    v46 = objc_msgSend_setWithArray_(v41, v44, (uint64_t)v43, v45);
    v47 = NSStringFromSelector(sel_modifyRecordZoneIDs);
    uint64_t v49 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v48, (uint64_t)v46, (uint64_t)v47);
    modifyRecordZoneIDs = v5->_modifyRecordZoneIDs;
    v5->_modifyRecordZoneIDs = (NSArray *)v49;

    v51 = (void *)MEMORY[0x1E4F1CAD0];
    v121[0] = objc_opt_class();
    v121[1] = objc_opt_class();
    v53 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v52, (uint64_t)v121, 2);
    v56 = objc_msgSend_setWithArray_(v51, v54, (uint64_t)v53, v55);
    v57 = NSStringFromSelector(sel_deleteRecordZoneIDs);
    uint64_t v59 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v58, (uint64_t)v56, (uint64_t)v57);
    deleteRecordZoneIDs = v5->_deleteRecordZoneIDs;
    v5->_deleteRecordZoneIDs = (NSArray *)v59;

    v61 = (void *)MEMORY[0x1E4F1CAD0];
    v120[0] = objc_opt_class();
    v120[1] = objc_opt_class();
    v63 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v62, (uint64_t)v120, 2);
    v66 = objc_msgSend_setWithArray_(v61, v64, (uint64_t)v63, v65);
    v67 = NSStringFromSelector(sel_fetchRecordZoneIDs);
    uint64_t v69 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v68, (uint64_t)v66, (uint64_t)v67);
    fetchRecordZoneIDs = v5->_fetchRecordZoneIDs;
    v5->_fetchRecordZoneIDs = (NSArray *)v69;

    v71 = (void *)MEMORY[0x1E4F1CAD0];
    v119[0] = objc_opt_class();
    v119[1] = objc_opt_class();
    v73 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v72, (uint64_t)v119, 2);
    v76 = objc_msgSend_setWithArray_(v71, v74, (uint64_t)v73, v75);
    v77 = NSStringFromSelector(sel_modifyMergeableValueIDs);
    uint64_t v79 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v78, (uint64_t)v76, (uint64_t)v77);
    modifyMergeableValueIDs = v5->_modifyMergeableValueIDs;
    v5->_modifyMergeableValueIDs = (NSArray *)v79;

    v81 = (void *)MEMORY[0x1E4F1CAD0];
    v118[0] = objc_opt_class();
    v118[1] = objc_opt_class();
    v83 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v82, (uint64_t)v118, 2);
    v86 = objc_msgSend_setWithArray_(v81, v84, (uint64_t)v83, v85);
    v87 = NSStringFromSelector(sel_deleteMergeableValueIDs);
    uint64_t v89 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v88, (uint64_t)v86, (uint64_t)v87);
    deleteMergeableValueIDs = v5->_deleteMergeableValueIDs;
    v5->_deleteMergeableValueIDs = (NSArray *)v89;

    v91 = (void *)MEMORY[0x1E4F1CAD0];
    v117[0] = objc_opt_class();
    v117[1] = objc_opt_class();
    v93 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v92, (uint64_t)v117, 2);
    v96 = objc_msgSend_setWithArray_(v91, v94, (uint64_t)v93, v95);
    v97 = NSStringFromSelector(sel_fetchMergeableValueIDs);
    uint64_t v99 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v98, (uint64_t)v96, (uint64_t)v97);
    fetchMergeableValueIDs = v5->_fetchMergeableValueIDs;
    v5->_fetchMergeableValueIDs = (NSArray *)v99;

    v101 = (void *)MEMORY[0x1E4F1CAD0];
    v116[0] = objc_opt_class();
    v116[1] = objc_opt_class();
    v103 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v102, (uint64_t)v116, 2);
    v106 = objc_msgSend_setWithArray_(v101, v104, (uint64_t)v103, v105);
    v107 = NSStringFromSelector(sel_modifySubscriptionRecordZoneIDs);
    uint64_t v109 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v108, (uint64_t)v106, (uint64_t)v107);
    modifySubscriptionRecordZoneIDs = v5->_modifySubscriptionRecordZoneIDs;
    v5->_modifySubscriptionRecordZoneIDs = (NSArray *)v109;

    v111 = NSStringFromSelector(sel_databaseScope);
    v5->_int64_t databaseScope = objc_msgSend_decodeIntegerForKey_(v4, v112, (uint64_t)v111, v113);
  }
  return v5;
}

- (NSArray)allRecordIDs
{
  v3 = objc_opt_new();
  uint64_t v7 = objc_msgSend_modifyRecordIDs(self, v4, v5, v6);
  v10 = (void *)v7;
  uint64_t v11 = MEMORY[0x1E4F1CBF0];
  if (v7) {
    objc_msgSend_addObjectsFromArray_(v3, v8, v7, v9);
  }
  else {
    objc_msgSend_addObjectsFromArray_(v3, v8, MEMORY[0x1E4F1CBF0], v9);
  }

  uint64_t v15 = objc_msgSend_deleteRecordIDs(self, v12, v13, v14);
  v18 = (void *)v15;
  if (v15) {
    objc_msgSend_addObjectsFromArray_(v3, v16, v15, v17);
  }
  else {
    objc_msgSend_addObjectsFromArray_(v3, v16, v11, v17);
  }

  uint64_t v22 = objc_msgSend_fetchRecordIDs(self, v19, v20, v21);
  uint64_t v25 = (void *)v22;
  if (v22) {
    objc_msgSend_addObjectsFromArray_(v3, v23, v22, v24);
  }
  else {
    objc_msgSend_addObjectsFromArray_(v3, v23, v11, v24);
  }

  uint64_t v29 = objc_msgSend_modifyMergeableValueIDs(self, v26, v27, v28);
  uint64_t v32 = objc_msgSend_CKCompactMap_(v29, v30, (uint64_t)&unk_1ED7EF358, v31);
  uint64_t v35 = (void *)v32;
  if (v32) {
    objc_msgSend_addObjectsFromArray_(v3, v33, v32, v34);
  }
  else {
    objc_msgSend_addObjectsFromArray_(v3, v33, v11, v34);
  }

  uint64_t v39 = objc_msgSend_deleteMergeableValueIDs(self, v36, v37, v38);
  uint64_t v42 = objc_msgSend_CKCompactMap_(v39, v40, (uint64_t)&unk_1ED7EFD78, v41);
  uint64_t v45 = (void *)v42;
  if (v42) {
    objc_msgSend_addObjectsFromArray_(v3, v43, v42, v44);
  }
  else {
    objc_msgSend_addObjectsFromArray_(v3, v43, v11, v44);
  }

  uint64_t v49 = objc_msgSend_fetchMergeableValueIDs(self, v46, v47, v48);
  uint64_t v52 = objc_msgSend_CKCompactMap_(v49, v50, (uint64_t)&unk_1ED7EFE78, v51);
  uint64_t v55 = (void *)v52;
  if (v52) {
    objc_msgSend_addObjectsFromArray_(v3, v53, v52, v54);
  }
  else {
    objc_msgSend_addObjectsFromArray_(v3, v53, v11, v54);
  }

  return (NSArray *)v3;
}

- (NSArray)allRecordZoneIDs
{
  v3 = objc_opt_new();
  uint64_t v7 = objc_msgSend_modifyRecordIDs(self, v4, v5, v6);
  uint64_t v10 = objc_msgSend_CKCompactMap_(v7, v8, (uint64_t)&unk_1ED7EFF58, v9);
  uint64_t v13 = (void *)v10;
  uint64_t v14 = MEMORY[0x1E4F1CBF0];
  if (v10) {
    objc_msgSend_addObjectsFromArray_(v3, v11, v10, v12);
  }
  else {
    objc_msgSend_addObjectsFromArray_(v3, v11, MEMORY[0x1E4F1CBF0], v12);
  }

  v18 = objc_msgSend_deleteRecordIDs(self, v15, v16, v17);
  uint64_t v21 = objc_msgSend_CKCompactMap_(v18, v19, (uint64_t)&unk_1ED7EFFF8, v20);
  uint64_t v24 = (void *)v21;
  if (v21) {
    objc_msgSend_addObjectsFromArray_(v3, v22, v21, v23);
  }
  else {
    objc_msgSend_addObjectsFromArray_(v3, v22, v14, v23);
  }

  uint64_t v28 = objc_msgSend_fetchRecordIDs(self, v25, v26, v27);
  uint64_t v31 = objc_msgSend_CKCompactMap_(v28, v29, (uint64_t)&unk_1ED7F0078, v30);
  uint64_t v34 = (void *)v31;
  if (v31) {
    objc_msgSend_addObjectsFromArray_(v3, v32, v31, v33);
  }
  else {
    objc_msgSend_addObjectsFromArray_(v3, v32, v14, v33);
  }

  uint64_t v38 = objc_msgSend_modifyRecordZoneIDs(self, v35, v36, v37);
  uint64_t v41 = (void *)v38;
  if (v38) {
    objc_msgSend_addObjectsFromArray_(v3, v39, v38, v40);
  }
  else {
    objc_msgSend_addObjectsFromArray_(v3, v39, v14, v40);
  }

  uint64_t v45 = objc_msgSend_deleteRecordZoneIDs(self, v42, v43, v44);
  uint64_t v48 = (void *)v45;
  if (v45) {
    objc_msgSend_addObjectsFromArray_(v3, v46, v45, v47);
  }
  else {
    objc_msgSend_addObjectsFromArray_(v3, v46, v14, v47);
  }

  uint64_t v52 = objc_msgSend_fetchRecordZoneIDs(self, v49, v50, v51);
  uint64_t v55 = (void *)v52;
  if (v52) {
    objc_msgSend_addObjectsFromArray_(v3, v53, v52, v54);
  }
  else {
    objc_msgSend_addObjectsFromArray_(v3, v53, v14, v54);
  }

  uint64_t v59 = objc_msgSend_modifyMergeableValueIDs(self, v56, v57, v58);
  uint64_t v62 = objc_msgSend_CKCompactMap_(v59, v60, (uint64_t)&unk_1ED7F0198, v61);
  uint64_t v65 = (void *)v62;
  if (v62) {
    objc_msgSend_addObjectsFromArray_(v3, v63, v62, v64);
  }
  else {
    objc_msgSend_addObjectsFromArray_(v3, v63, v14, v64);
  }

  uint64_t v69 = objc_msgSend_deleteMergeableValueIDs(self, v66, v67, v68);
  uint64_t v72 = objc_msgSend_CKCompactMap_(v69, v70, (uint64_t)&unk_1ED7F0218, v71);
  uint64_t v75 = (void *)v72;
  if (v72) {
    objc_msgSend_addObjectsFromArray_(v3, v73, v72, v74);
  }
  else {
    objc_msgSend_addObjectsFromArray_(v3, v73, v14, v74);
  }

  uint64_t v79 = objc_msgSend_fetchMergeableValueIDs(self, v76, v77, v78);
  uint64_t v82 = objc_msgSend_CKCompactMap_(v79, v80, (uint64_t)&unk_1ED7F0278, v81);
  uint64_t v85 = (void *)v82;
  if (v82) {
    objc_msgSend_addObjectsFromArray_(v3, v83, v82, v84);
  }
  else {
    objc_msgSend_addObjectsFromArray_(v3, v83, v14, v84);
  }

  uint64_t v89 = objc_msgSend_modifySubscriptionRecordZoneIDs(self, v86, v87, v88);
  v92 = (void *)v89;
  if (v89) {
    objc_msgSend_addObjectsFromArray_(v3, v90, v89, v91);
  }
  else {
    objc_msgSend_addObjectsFromArray_(v3, v90, v14, v91);
  }

  return (NSArray *)v3;
}

- (CKRoughlyEquivalentProperties)equivalencyProperties
{
  return self->_equivalencyProperties;
}

- (NSArray)modifyRecordIDs
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setModifyRecordIDs:(id)a3
{
}

- (NSArray)deleteRecordIDs
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDeleteRecordIDs:(id)a3
{
}

- (NSArray)fetchRecordIDs
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFetchRecordIDs:(id)a3
{
}

- (NSArray)modifyRecordZoneIDs
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setModifyRecordZoneIDs:(id)a3
{
}

- (NSArray)deleteRecordZoneIDs
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDeleteRecordZoneIDs:(id)a3
{
}

- (NSArray)fetchRecordZoneIDs
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFetchRecordZoneIDs:(id)a3
{
}

- (NSArray)modifyMergeableValueIDs
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setModifyMergeableValueIDs:(id)a3
{
}

- (NSArray)deleteMergeableValueIDs
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDeleteMergeableValueIDs:(id)a3
{
}

- (NSArray)fetchMergeableValueIDs
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFetchMergeableValueIDs:(id)a3
{
}

- (NSArray)modifySubscriptionRecordZoneIDs
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setModifySubscriptionRecordZoneIDs:(id)a3
{
}

- (int64_t)databaseScope
{
  return self->_databaseScope;
}

- (void)setDatabaseScope:(int64_t)a3
{
  self->_int64_t databaseScope = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifySubscriptionRecordZoneIDs, 0);
  objc_storeStrong((id *)&self->_fetchMergeableValueIDs, 0);
  objc_storeStrong((id *)&self->_deleteMergeableValueIDs, 0);
  objc_storeStrong((id *)&self->_modifyMergeableValueIDs, 0);
  objc_storeStrong((id *)&self->_fetchRecordZoneIDs, 0);
  objc_storeStrong((id *)&self->_deleteRecordZoneIDs, 0);
  objc_storeStrong((id *)&self->_modifyRecordZoneIDs, 0);
  objc_storeStrong((id *)&self->_fetchRecordIDs, 0);
  objc_storeStrong((id *)&self->_deleteRecordIDs, 0);
  objc_storeStrong((id *)&self->_modifyRecordIDs, 0);

  objc_storeStrong((id *)&self->_equivalencyProperties, 0);
}

@end