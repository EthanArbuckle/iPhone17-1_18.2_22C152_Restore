@interface CKSQLiteTOCTable
+ (Class)entryClass;
+ (id)dbProperties;
+ (id)dbTableName;
+ (unint64_t)dbVersion;
- (BOOL)tableExists:(id)a3 error:(id *)a4;
- (id)_tocEntriesWithGroupID:(id)a3 error:(id *)a4 label:(id *)a5 properties:(id)a6;
- (id)tocEntriesWithGroupID:(id)a3 error:(id *)a4;
- (id)tocEntryWithGroupID:(id)a3 logicalTableName:(id)a4 error:(id *)a5;
- (id)validationTocEntriesWithGroupID:(id)a3 error:(id *)a4;
@end

@implementation CKSQLiteTOCTable

+ (unint64_t)dbVersion
{
  return objc_msgSend_dbVersion(CKSQLiteTOCTableGroup, a2, v2, v3);
}

+ (id)dbTableName
{
  return @"TOC";
}

+ (id)dbProperties
{
  v5[7] = *MEMORY[0x1E4F143B8];
  v4[0] = @"logicalTableName";
  v4[1] = CKSQLiteTOCTableEntryDbTablePropertyName;
  v5[0] = &unk_1ED846120;
  v5[1] = &unk_1ED846138;
  v4[2] = CKSQLiteTOCTableEntryGroupIDPropertyName;
  v4[3] = CKSQLiteTOCTableEntrySchemaPropertyName;
  v5[2] = &unk_1ED846150;
  v5[3] = &unk_1ED846120;
  v4[4] = CKSQLiteTOCTableEntryDbVersionPropertyName;
  v4[5] = CKSQLiteTOCTableEntryCreatingClassName;
  v5[4] = &unk_1ED846168;
  v5[5] = &unk_1ED846120;
  v4[6] = CKSQLiteTOCTableEntryPropertyDataName;
  v5[6] = &unk_1ED846180;
  uint64_t v2 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], a2, (uint64_t)v5, (uint64_t)v4, 7);

  return v2;
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

- (id)_tocEntriesWithGroupID:(id)a3 error:(id *)a4 label:(id *)a5 properties:(id)a6
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  v33 = @"ID";
  v34[0] = v10;
  v13 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v12, (uint64_t)v34, (uint64_t)&v33, 1);
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = sub_18AF13B00;
  v31 = sub_18AF13840;
  id v32 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_18B02B18C;
  v22[3] = &unk_1E5460E40;
  v22[4] = self;
  id v14 = v13;
  id v23 = v14;
  v26 = a5;
  id v15 = v11;
  id v24 = v15;
  v25 = &v27;
  v18 = objc_msgSend_performInTransaction_(self, v16, (uint64_t)v22, v17);
  v19 = v18;
  if (a4 && v18) {
    *a4 = v18;
  }
  id v20 = (id)v28[5];

  _Block_object_dispose(&v27, 8);

  return v20;
}

- (id)tocEntriesWithGroupID:(id)a3 error:(id *)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v13[0] = @"logicalTableName";
  v13[1] = CKSQLiteTOCTableEntryDbTablePropertyName;
  v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a3;
  v9 = objc_msgSend_arrayWithObjects_count_(v6, v8, (uint64_t)v13, 2);
  id v11 = objc_msgSend__tocEntriesWithGroupID_error_label_properties_(self, v10, (uint64_t)v7, (uint64_t)a4, off_1E5460E60, v9);

  return v11;
}

- (id)validationTocEntriesWithGroupID:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend__tocEntriesWithGroupID_error_label_properties_(self, a2, (uint64_t)a3, (uint64_t)a4, off_1E5460E78, 0);
}

- (id)tocEntryWithGroupID:(id)a3 logicalTableName:(id)a4 error:(id *)a5
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v28[0] = @"ID";
  v28[1] = @"NAME";
  v29[0] = v8;
  v29[1] = v9;
  id v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v10, (uint64_t)v29, (uint64_t)v28, 2);
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_18AF13B00;
  v26 = sub_18AF13840;
  id v27 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_18B02B5EC;
  v19[3] = &unk_1E5460ED0;
  v19[4] = self;
  id v12 = v11;
  id v20 = v12;
  v21 = &v22;
  id v15 = objc_msgSend_performInTransaction_(self, v13, (uint64_t)v19, v14);
  v16 = v15;
  if (a5 && v15) {
    *a5 = v15;
  }
  id v17 = (id)v23[5];

  _Block_object_dispose(&v22, 8);

  return v17;
}

- (BOOL)tableExists:(id)a3 error:(id *)a4
{
  v4 = objc_msgSend_entryWithPrimaryKey_fetchProperties_label_error_(self, a2, (uint64_t)a3, MEMORY[0x1E4F1CBF0], off_1E5460EF0, a4);
  BOOL v5 = v4 != 0;

  return v5;
}

@end