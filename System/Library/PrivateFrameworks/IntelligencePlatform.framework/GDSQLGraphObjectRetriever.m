@interface GDSQLGraphObjectRetriever
- (id)objectForIdentifier:(id)a3;
- (void)enumerateIdentifiersWithBlock:(id)a3;
- (void)enumerateIdentifiersWithQuery:(id)a3 block:(id)a4;
- (void)enumerateObjectsWithBlock:(id)a3;
- (void)enumerateObjectsWithQuery:(id)a3 block:(id)a4;
@end

@implementation GDSQLGraphObjectRetriever

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityClassIdentifierName, 0);
  objc_storeStrong((id *)&self->_tableName, 0);

  objc_storeStrong((id *)&self->_db, 0);
}

- (void)enumerateObjectsWithQuery:(id)a3 block:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B2E654FC;
  v10[3] = &unk_1E6013B18;
  v10[4] = self;
  id v11 = v6;
  id v7 = v6;
  objc_msgSend_enumerateIdentifiersWithQuery_block_(self, v8, (uint64_t)a3, (uint64_t)v10, v9);
}

- (void)enumerateIdentifiersWithQuery:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  if (!self)
  {
    v52 = 0;
    goto LABEL_20;
  }
  uint64_t v9 = (void *)MEMORY[0x1B3EB26F0]();
  v14 = objc_msgSend_objectFTSTerm(v8, v10, v11, v12, v13);

  if (v14)
  {
    id v19 = [NSString alloc];
    uint64_t v23 = objc_msgSend_initWithFormat_(v19, v20, @"SELECT DISTINCT subject FROM %@_object_fts WHERE object MATCH :match", v21, v22, self->_tableName);
  }
  else
  {
    v28 = objc_msgSend_objects(v8, v15, v16, v17, v18);
    uint64_t v33 = objc_msgSend_count(v28, v29, v30, v31, v32);

    if (v33 == 1)
    {
      id v38 = [NSString alloc];
      uint64_t v23 = objc_msgSend_initWithFormat_(v38, v39, @"SELECT DISTINCT subject FROM %@ WHERE object = :object", v40, v41, self->_tableName);
    }
    else
    {
      v42 = objc_msgSend_objects(v8, v34, v35, v36, v37);
      uint64_t v47 = objc_msgSend_count(v42, v43, v44, v45, v46);

      id v48 = [NSString alloc];
      if (v47) {
        uint64_t v23 = objc_msgSend_initWithFormat_(v48, v49, @"SELECT DISTINCT subject FROM %@ WHERE object IN _pas_nsarray(:objects)", v50, v51, self->_tableName);
      }
      else {
        uint64_t v23 = objc_msgSend_initWithFormat_(v48, v49, @"SELECT DISTINCT subject FROM %@ WHERE 1", v50, v51, self->_tableName);
      }
    }
  }
  v52 = (void *)v23;
  v53 = objc_msgSend_predicates(v8, v24, v25, v26, v27);
  uint64_t v58 = objc_msgSend_count(v53, v54, v55, v56, v57);

  if (v58 == 1)
  {
    objc_msgSend_stringByAppendingString_(v52, v59, @" AND predicate = :predicate", v61, v62);
  }
  else
  {
    v63 = objc_msgSend_predicates(v8, v59, v60, v61, v62);
    uint64_t v68 = objc_msgSend_count(v63, v64, v65, v66, v67);

    if (!v68) {
      goto LABEL_14;
    }
    objc_msgSend_stringByAppendingString_(v52, v69, @" AND predicate IN _pas_nsarray(:predicates)", v71, v72);
  uint64_t v73 = };

  v52 = (void *)v73;
LABEL_14:
  v74 = objc_msgSend_subjects(v8, v69, v70, v71, v72);
  uint64_t v79 = objc_msgSend_count(v74, v75, v76, v77, v78);

  if (v79 == 1)
  {
    objc_msgSend_stringByAppendingString_(v52, v80, @" AND subject = :subject", v82, v83);
    uint64_t v93 = LABEL_18:;

    v52 = (void *)v93;
    goto LABEL_19;
  }
  v84 = objc_msgSend_subjects(v8, v80, v81, v82, v83);
  uint64_t v89 = objc_msgSend_count(v84, v85, v86, v87, v88);

  if (v89)
  {
    objc_msgSend_stringByAppendingString_(v52, v90, @" AND subject IN _pas_nsarray(:subjects)", v91, v92);
    goto LABEL_18;
  }
LABEL_19:
LABEL_20:

  db = self->_db;
  v100[0] = MEMORY[0x1E4F143A8];
  v100[1] = 3221225472;
  v100[2] = sub_1B2E65868;
  v100[3] = &unk_1E6013AC8;
  v100[4] = self;
  id v101 = v8;
  v98[0] = MEMORY[0x1E4F143A8];
  v98[1] = 3221225472;
  v98[2] = sub_1B2E65B24;
  v98[3] = &unk_1E6013AF0;
  v98[4] = self;
  id v99 = v7;
  id v95 = v7;
  id v96 = v8;
  objc_msgSend_prepAndRunQuery_onPrep_onRow_onError_(db, v97, (uint64_t)v52, (uint64_t)v100, (uint64_t)v98, 0);
}

- (void)enumerateObjectsWithBlock:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_triplesColumnsRequiredForRendering(self->_triplesIteratorRenderer, v5, v6, v7, v8);
  uint64_t v10 = v9 | 1;
  uint64_t v11 = sub_1B2E65D74((uint64_t)self, v9 | 1);
  id v12 = [NSString alloc];
  uint64_t v16 = objc_msgSend_initWithFormat_(v12, v13, @"SELECT %@ FROM %@ WHERE subject >= :entityClassIdentifier << :classOffset AND subject < (:entityClassIdentifier + 1) << :classOffset ORDER BY subject, predicate, relationshipId, relationshipPredicate, object", v14, v15, v11, self->_tableName);
  db = self->_db;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1B2E65FD0;
  v20[3] = &unk_1E6013A80;
  id v21 = v4;
  uint64_t v22 = v10;
  v20[4] = self;
  id v18 = v4;
  objc_msgSend_prepQuery_onPrep_onError_(db, v19, (uint64_t)v16, (uint64_t)v20, 0);
}

- (id)objectForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  id v38 = sub_1B2E66374;
  v39 = sub_1B2E66384;
  id v40 = 0;
  v5 = [GDEntityIdentifier alloc];
  uint64_t v9 = objc_msgSend_initWithString_(v5, v6, (uint64_t)v4, v7, v8);
  if (objc_msgSend_entityClass(v9, v10, v11, v12, v13) == self->_entityClassIdentifier)
  {
    uint64_t v18 = objc_msgSend_triplesColumnsRequiredForRendering(self->_triplesIteratorRenderer, v14, v15, v16, v17);
    unint64_t v19 = v18 & 0xFFFFFFFFFFFFFFFELL;
    v20 = sub_1B2E65D74((uint64_t)self, v18 & 0xFFFFFFFE);
    id v21 = [NSString alloc];
    uint64_t v25 = objc_msgSend_initWithFormat_(v21, v22, @"SELECT %@ FROM %@ WHERE subject = :subject ORDER BY subject, predicate, relationshipId, relationshipPredicate, object", v23, v24, v20, self->_tableName);
    db = self->_db;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = sub_1B2E6638C;
    v30[3] = &unk_1E6013A58;
    uint64_t v33 = &v35;
    unint64_t v34 = v19;
    id v31 = v9;
    uint64_t v32 = self;
    objc_msgSend_prepQuery_onPrep_onError_(db, v27, (uint64_t)v25, (uint64_t)v30, 0);
    id v28 = (id)v36[5];
  }
  else
  {
    id v28 = 0;
  }

  _Block_object_dispose(&v35, 8);

  return v28;
}

- (void)enumerateIdentifiersWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [NSString alloc];
  uint64_t v9 = objc_msgSend_initWithFormat_(v5, v6, @"SELECT subject FROM %@ WHERE predicate = \"PS1\" AND object = :entityClassIdentifierName", v7, v8, self->_tableName);
  db = self->_db;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1B2E66588;
  v15[3] = &unk_1E6013A30;
  v15[4] = self;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1B2E665A0;
  v13[3] = &unk_1E6013B40;
  id v14 = v4;
  id v11 = v4;
  objc_msgSend_prepAndRunQuery_onPrep_onRow_onError_(db, v12, (uint64_t)v9, (uint64_t)v15, (uint64_t)v13, 0);
}

@end