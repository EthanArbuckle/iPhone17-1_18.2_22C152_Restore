@interface CKSQLiteEnumerator
- (CKSQLiteEnumerator)initWithDatabase:(id)a3 columns:(id)a4 from:(id)a5 where:(id)a6 bindings:(id)a7 orderBy:(id)a8;
- (id)nextObject;
- (id)objectTranslator;
- (void)setObjectTranslator:(id)a3;
@end

@implementation CKSQLiteEnumerator

- (CKSQLiteEnumerator)initWithDatabase:(id)a3 columns:(id)a4 from:(id)a5 where:(id)a6 bindings:(id)a7 orderBy:(id)a8
{
  id v15 = a3;
  id v28 = a4;
  id v27 = a5;
  id v26 = a6;
  id v16 = a7;
  id v17 = a8;
  v29.receiver = self;
  v29.super_class = (Class)CKSQLiteEnumerator;
  v18 = [(CKSQLiteEnumerator *)&v29 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_database, a3);
    objc_storeStrong((id *)&v19->_columns, a4);
    objc_storeStrong((id *)&v19->_tableName, a5);
    objc_storeStrong((id *)&v19->_whereSQL, a6);
    objc_storeStrong((id *)&v19->_bindings, a7);
    objc_storeStrong((id *)&v19->_orderBy, a8);
    id v20 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v23 = objc_msgSend_initWithCapacity_(v20, v21, 64, v22);
    objects = v19->_objects;
    v19->_objects = (NSMutableArray *)v23;
  }
  return v19;
}

- (id)nextObject
{
  unint64_t index = self->_index;
  if (index == objc_msgSend_count(self->_objects, a2, v2, v3))
  {
    objc_msgSend_removeAllObjects(self->_objects, v6, v7, v8);
    database = self->_database;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = sub_18B0F3E74;
    v23[3] = &unk_1E5462C58;
    v23[4] = self;
    id v12 = (id)objc_msgSend_performDatabaseOperation_(database, v10, (uint64_t)v23, v11);
    self->_unint64_t index = 0;
    self->_fetchOffset += objc_msgSend_count(self->_objects, v13, v14, v15);
  }
  unint64_t v16 = self->_index;
  if (v16 >= objc_msgSend_count(self->_objects, v6, v7, v8))
  {
    uint64_t v21 = 0;
    objectTranslator = self->_objectTranslator;
    self->_objectTranslator = 0;
  }
  else
  {
    objectTranslator = objc_msgSend_objectAtIndex_(self->_objects, v17, self->_index, v18);
    ++self->_index;
    id v20 = (void (**)(id, void *))self->_objectTranslator;
    if (!v20) {
      goto LABEL_8;
    }
    uint64_t v21 = v20[2](v20, objectTranslator);
  }

  objectTranslator = (void *)v21;
LABEL_8:

  return objectTranslator;
}

- (id)objectTranslator
{
  return self->_objectTranslator;
}

- (void)setObjectTranslator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_objectTranslator, 0);
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_orderBy, 0);
  objc_storeStrong((id *)&self->_bindings, 0);
  objc_storeStrong((id *)&self->_whereSQL, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_columns, 0);

  objc_storeStrong((id *)&self->_database, 0);
}

@end