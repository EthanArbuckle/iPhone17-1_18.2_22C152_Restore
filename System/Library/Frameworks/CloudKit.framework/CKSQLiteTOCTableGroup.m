@interface CKSQLiteTOCTableGroup
+ (double)expirationTime;
+ (id)TOCTableGroupInDatabase:(id)a3;
+ (id)bootstrapNewDatabase:(id)a3;
+ (unint64_t)dbVersion;
- (CKSQLiteTOCTableGroup)initWithName:(id)a3 options:(unint64_t)a4 database:(id)a5;
- (id)_tablesByNameInitializer;
- (id)tocTable;
- (id)tocTableGroupInitValue;
- (id)tocTableGroupTable;
@end

@implementation CKSQLiteTOCTableGroup

+ (unint64_t)dbVersion
{
  return 2;
}

+ (id)bootstrapNewDatabase:(id)a3
{
  id v3 = a3;
  v6 = objc_msgSend_TOCTableGroupInDatabase_(CKSQLiteTOCTableGroup, v4, (uint64_t)v3, v5);
  v10 = objc_msgSend_tocTableGroupTable(v6, v7, v8, v9);
  v14 = objc_msgSend_createTableSQL(v10, v11, v12, v13);
  v126[0] = MEMORY[0x1E4F143A8];
  v126[1] = 3221225472;
  v126[2] = sub_18B02C7FC;
  v126[3] = &unk_1E5460E18;
  id v15 = v3;
  id v127 = v15;
  id v16 = v14;
  id v128 = v16;
  v21 = objc_msgSend_performDatabaseTransaction_(v15, v17, (uint64_t)v126, v18);
  if (!v21)
  {
    v21 = objc_msgSend_insertObject_(v10, v19, (uint64_t)v6, v20);
    if (!v21)
    {
      v25 = objc_msgSend_tocTable(v6, v22, v23, v24);
      v29 = objc_msgSend_createTableSQL(v25, v26, v27, v28);
      uint64_t v120 = MEMORY[0x1E4F143A8];
      uint64_t v121 = 3221225472;
      v122 = sub_18B02C808;
      v123 = &unk_1E5460E18;
      id v124 = v15;
      id v30 = v29;
      id v125 = v30;
      v21 = objc_msgSend_performDatabaseTransaction_(v124, v31, (uint64_t)&v120, v32);
      if (!v21)
      {
        v33 = objc_alloc_init(CKSQLiteTOCTableEntry);
        v37 = objc_msgSend_logicalTableName(v25, v34, v35, v36, v120, v121, v122, v123, v124);
        objc_msgSend_setLogicalTableName_(v33, v38, (uint64_t)v37, v39);

        v43 = objc_msgSend_dbTableName(v25, v40, v41, v42);
        objc_msgSend_setDbTableName_(v33, v44, (uint64_t)v43, v45);

        v49 = objc_msgSend_groupID(v6, v46, v47, v48);
        objc_msgSend_setGroupID_(v33, v50, (uint64_t)v49, v51);

        objc_msgSend_setSchema_(v33, v52, (uint64_t)v30, v53);
        v54 = objc_opt_class();
        v55 = NSNumber;
        uint64_t v59 = objc_msgSend_dbVersion(v54, v56, v57, v58);
        v62 = objc_msgSend_numberWithUnsignedInteger_(v55, v60, v59, v61);
        objc_msgSend_setDbVersion_(v33, v63, (uint64_t)v62, v64);

        v65 = NSStringFromClass((Class)v54);
        objc_msgSend_setCreatingClass_(v33, v66, (uint64_t)v65, v67);

        v71 = objc_msgSend_flattenedDBProperties(v54, v68, v69, v70);
        objc_msgSend_setPropertyData_(v33, v72, (uint64_t)v71, v73);

        v21 = objc_msgSend_insertObject_(v25, v74, (uint64_t)v33, v75);

        if (!v21)
        {
          v76 = objc_alloc_init(CKSQLiteTOCTableEntry);
          v80 = objc_msgSend_logicalTableName(v10, v77, v78, v79);
          objc_msgSend_setLogicalTableName_(v76, v81, (uint64_t)v80, v82);

          v86 = objc_msgSend_dbTableName(v10, v83, v84, v85);
          objc_msgSend_setDbTableName_(v76, v87, (uint64_t)v86, v88);

          v92 = objc_msgSend_groupID(v6, v89, v90, v91);
          objc_msgSend_setGroupID_(v76, v93, (uint64_t)v92, v94);

          objc_msgSend_setSchema_(v76, v95, (uint64_t)v16, v96);
          v97 = objc_opt_class();
          v98 = NSNumber;
          uint64_t v102 = objc_msgSend_dbVersion(v97, v99, v100, v101);
          v105 = objc_msgSend_numberWithUnsignedInteger_(v98, v103, v102, v104);
          objc_msgSend_setDbVersion_(v76, v106, (uint64_t)v105, v107);

          v108 = NSStringFromClass((Class)v97);
          objc_msgSend_setCreatingClass_(v76, v109, (uint64_t)v108, v110);

          v114 = objc_msgSend_flattenedDBProperties(v97, v111, v112, v113);
          objc_msgSend_setPropertyData_(v76, v115, (uint64_t)v114, v116);

          v21 = objc_msgSend_insertObject_(v25, v117, (uint64_t)v76, v118);
        }
      }
    }
  }

  return v21;
}

+ (double)expirationTime
{
  return 0.0;
}

+ (id)TOCTableGroupInDatabase:(id)a3
{
  id v3 = a3;
  v4 = [CKSQLiteTOCTableGroup alloc];
  uint64_t v8 = objc_msgSend_dbTableName(CKSQLiteTOCTableGroupTable, v5, v6, v7);
  v10 = objc_msgSend_initWithName_options_database_(v4, v9, (uint64_t)v8, 393216, v3);

  v14 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v11, v12, v13);
  objc_msgSend_setLastUsed_(v10, v15, (uint64_t)v14, v16);

  objc_msgSend_setGroupID_(v10, v17, (uint64_t)&unk_1ED8461F8, v18);
  v19 = (objc_class *)objc_opt_class();
  uint64_t v20 = NSStringFromClass(v19);
  objc_msgSend_setCreatingClass_(v10, v21, (uint64_t)v20, v22);

  return v10;
}

- (id)_tablesByNameInitializer
{
  v25[2] = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_dbTableName(CKSQLiteTOCTable, a2, v2, v3);
  uint64_t v5 = [CKSQLiteTOCTable alloc];
  uint64_t v8 = objc_msgSend_initWithLogicalTableName_(v5, v6, (uint64_t)v4, v7);
  objc_msgSend_setDbTableName_(v8, v9, (uint64_t)v4, v10);
  v14 = objc_msgSend_dbTableName(CKSQLiteTOCTableGroupTable, v11, v12, v13);
  id v15 = [CKSQLiteTOCTableGroupTable alloc];
  uint64_t v18 = objc_msgSend_initWithLogicalTableName_(v15, v16, (uint64_t)v14, v17);
  objc_msgSend_setDbTableName_(v18, v19, (uint64_t)v14, v20);
  v24[0] = v4;
  v24[1] = v14;
  v25[0] = v8;
  v25[1] = v18;
  uint64_t v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v21, (uint64_t)v25, (uint64_t)v24, 2);

  return v22;
}

- (CKSQLiteTOCTableGroup)initWithName:(id)a3 options:(unint64_t)a4 database:(id)a5
{
  v27.receiver = self;
  v27.super_class = (Class)CKSQLiteTOCTableGroup;
  uint64_t v5 = [(CKSQLiteTableGroup *)&v27 initWithName:a3 options:a4 database:a5];
  uint64_t v9 = objc_msgSend_dbTableName(CKSQLiteTOCTable, v6, v7, v8);
  uint64_t v12 = objc_msgSend_tableWithName_(v5, v10, (uint64_t)v9, v11);
  tocTable = v5->_tocTable;
  v5->_tocTable = (CKSQLiteTOCTable *)v12;

  objc_msgSend_setTableGroup_(v5->_tocTable, v14, (uint64_t)v5, v15);
  v19 = objc_msgSend_dbTableName(CKSQLiteTOCTableGroupTable, v16, v17, v18);
  uint64_t v22 = objc_msgSend_tableWithName_(v5, v20, (uint64_t)v19, v21);
  tocTableGroup = v5->_tocTableGroup;
  v5->_tocTableGroup = (CKSQLiteTOCTableGroupTable *)v22;

  objc_msgSend_setTableGroup_(v5->_tocTableGroup, v24, (uint64_t)v5, v25);
  return v5;
}

- (id)tocTableGroupInitValue
{
  return 0;
}

- (id)tocTableGroupTable
{
  return self->_tocTableGroup;
}

- (id)tocTable
{
  return self->_tocTable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tocTable, 0);

  objc_storeStrong((id *)&self->_tocTableGroup, 0);
}

@end