@interface GDSQLFeatureRetriever
- (GDSQLFeatureRetriever)initWithDatabase:(id)a3;
- (id)featureForKey:(id)a3 error:(id *)a4;
- (id)featureKeysWithError:(id *)a3;
@end

@implementation GDSQLFeatureRetriever

- (void).cxx_destruct
{
}

- (id)featureKeysWithError:(id *)a3
{
  v5 = objc_opt_new();
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_1B2E64E48;
  v19 = sub_1B2E64E58;
  id v20 = 0;
  db = self->_db;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1B2E64E60;
  v13[3] = &unk_1E60139C0;
  id v7 = v5;
  id v14 = v7;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1B2E64F60;
  v12[3] = &unk_1E60139E8;
  v12[4] = &v15;
  objc_msgSend_prepAndRunQuery_onPrep_onRow_onError_(db, v8, @"SELECT viewName, featureName, subidentifierName FROM kv", (uint64_t)&unk_1F0AE1DB0, (uint64_t)v13, v12);
  if (a3 && (v9 = (void *)v16[5]) != 0)
  {
    id v10 = 0;
    *a3 = v9;
  }
  else
  {
    id v10 = v7;
  }

  _Block_object_dispose(&v15, 8);

  return v10;
}

- (id)featureForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_opt_new();
  v12 = objc_msgSend_subidentifierName(v6, v8, v9, v10, v11);

  if (v12) {
    v13 = @"SELECT value FROM kv WHERE viewName = :viewName AND featureName = :featureName AND subidentifierName = :subidentifierName";
  }
  else {
    v13 = @"SELECT value FROM kv WHERE viewName = :viewName AND featureName = :featureName";
  }
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_1B2E64E48;
  v30 = sub_1B2E64E58;
  id v31 = 0;
  db = self->_db;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1B2E651D4;
  v24[3] = &unk_1E6013A30;
  id v15 = v6;
  id v25 = v15;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_1B2E652A8;
  v22[3] = &unk_1E60139C0;
  id v16 = v7;
  id v23 = v16;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1B2E65364;
  v21[3] = &unk_1E60139E8;
  v21[4] = &v26;
  objc_msgSend_prepAndRunQuery_onPrep_onRow_onError_(db, v17, (uint64_t)v13, (uint64_t)v24, (uint64_t)v22, v21);
  if (a4 && (v18 = (void *)v27[5]) != 0)
  {
    id v19 = 0;
    *a4 = v18;
  }
  else
  {
    id v19 = v16;
  }

  _Block_object_dispose(&v26, 8);

  return v19;
}

- (GDSQLFeatureRetriever)initWithDatabase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GDSQLFeatureRetriever;
  id v6 = [(GDSQLFeatureRetriever *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_db, a3);
  }

  return v7;
}

@end