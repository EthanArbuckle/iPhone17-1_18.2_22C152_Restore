@interface CKSQLiteCompiledStatement
+ (id)_statementForFetchingMinMax:(id)a3 forColumn:(id)a4 inTable:(id)a5;
+ (id)statementForCountingRowsInTable:(id)a3;
+ (id)statementForDeletingInTable:(id)a3;
+ (id)statementForFetchingAllTableNamesInDatabase:(id)a3;
+ (id)statementForFetchingColumns:(id)a3 inTable:(id)a4;
+ (id)statementForFetchingMaximumValueForColumn:(id)a3 inTable:(id)a4;
+ (id)statementForFetchingMinimumValueForColumn:(id)a3 inTable:(id)a4;
+ (id)statementForInserting:(id)a3 inTable:(id)a4;
+ (id)statementForInserting:(id)a3 orUpdating:(id)a4 inTable:(id)a5;
+ (id)statementForSizingColumn:(id)a3 inTable:(id)a4;
+ (id)statementForSummingColumn:(id)a3 inTable:(id)a4;
+ (id)statementForUpdatingColumns:(id)a3 inTable:(id)a4;
- (BOOL)step:(id *)a3;
- (CKSQLiteCompiledStatement)initWithDatabase:(id)a3 sql:(id)a4 resultColumns:(id)a5 resultColumnTypes:(id)a6;
- (CKSQLiteCompiledStatement)initWithTable:(id)a3 sql:(id)a4 resultColumns:(id)a5 resultColumnTypes:(id)a6;
- (CKSQLiteTable)table;
- (NSArray)searchProperties;
- (NSNumber)limit;
- (NSNumber)offset;
- (id)_fillFetchedValues;
- (id)addBindingVariable:(id)a3 withAssociatedProperty:(id)a4;
- (id)bindValue:(id)a3 ofType:(unsigned int)a4 atIndex:(int)a5;
- (id)bindValueColumn:(id)a3 type:(unsigned int)a4 value:(id)a5;
- (id)boundObjects;
- (id)cksqlcs_appendSQLConstantValueToString:(id)a3;
- (id)compile;
- (id)description;
- (id)doSearchValueBinding;
- (id)fetchedColumns;
- (id)label;
- (id)propertyDecoder:(id *)a3;
- (id)searchBindingsDescription;
- (id)setSearchPredicate:(id)a3 forProperties:(id)a4;
- (id)sqlValueForVariable:(id)a3;
- (void)dealloc;
- (void)enumerateResultColumnsWithBlock:(id)a3;
- (void)invalidate;
- (void)orderByProperty:(id)a3 ascending:(BOOL)a4;
- (void)resetAndClearBindings;
- (void)setLabel:(id)a3;
- (void)setLimit:(id)a3;
- (void)setOffset:(id)a3;
- (void)setSearchProperties:(id)a3;
- (void)setSearchValues:(id)a3;
@end

@implementation CKSQLiteCompiledStatement

+ (id)statementForFetchingAllTableNamesInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v7 = objc_msgSend_initWithDatabase_sql_resultColumns_resultColumnTypes_(v5, v6, (uint64_t)v4, @"SELECT name FROM sqlite_master WHERE type = 'table' AND name NOT LIKE 'sqlite_%'", &unk_1ED845CE8, &unk_1ED845D00);

  return v7;
}

+ (id)statementForCountingRowsInTable:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28E78];
  id v5 = a3;
  v9 = objc_msgSend_dbTableName(v5, v6, v7, v8);
  v12 = objc_msgSend_stringWithFormat_(v4, v10, @"SELECT COUNT (*) FROM '%@'", v11, v9);

  id v13 = objc_alloc((Class)a1);
  v15 = objc_msgSend_initWithTable_sql_resultColumns_resultColumnTypes_(v13, v14, (uint64_t)v5, (uint64_t)v12, &unk_1ED845D18, &unk_1ED845D30);

  return v15;
}

+ (id)statementForSummingColumn:(id)a3 inTable:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F28E78];
  id v7 = a4;
  id v8 = a3;
  v12 = objc_msgSend_dbTableName(v7, v9, v10, v11);
  v15 = objc_msgSend_stringWithFormat_(v6, v13, @"SELECT SUM (%@) FROM '%@'", v14, v8, v12);

  id v16 = objc_alloc((Class)a1);
  v18 = objc_msgSend_initWithTable_sql_resultColumns_resultColumnTypes_(v16, v17, (uint64_t)v7, (uint64_t)v15, &unk_1ED845D48, &unk_1ED845D60);

  return v18;
}

+ (id)statementForSizingColumn:(id)a3 inTable:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F28E78];
  id v7 = a4;
  id v8 = a3;
  v12 = objc_msgSend_dbTableName(v7, v9, v10, v11);
  v15 = objc_msgSend_stringWithFormat_(v6, v13, @"SELECT LENGTH (%@) FROM '%@'", v14, v8, v12);

  id v16 = objc_alloc((Class)a1);
  v18 = objc_msgSend_initWithTable_sql_resultColumns_resultColumnTypes_(v16, v17, (uint64_t)v7, (uint64_t)v15, &unk_1ED845D78, &unk_1ED845D90);

  return v18;
}

+ (id)statementForUpdatingColumns:(id)a3 inTable:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v11 = objc_msgSend_dbTableName(v6, v8, v9, v10);
  uint64_t v14 = objc_msgSend_stringWithFormat_(v7, v12, @"UPDATE '%@' SET ", v13, v11);

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v15 = v5;
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v30, (uint64_t)v34, 16);
  if (v17)
  {
    uint64_t v20 = v17;
    uint64_t v21 = *(void *)v31;
    char v22 = 1;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(v15);
        }
        uint64_t v24 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        if ((v22 & 1) == 0) {
          objc_msgSend_appendString_(v14, v18, @",", v19);
        }
        objc_msgSend_appendFormat_(v14, v18, @"%@=:%@", v19, v24, v24);
        char v22 = 0;
      }
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v30, (uint64_t)v34, 16);
      char v22 = 0;
    }
    while (v20);
  }

  id v25 = objc_alloc((Class)a1);
  v27 = objc_msgSend_initWithTable_sql_resultColumns_resultColumnTypes_(v25, v26, (uint64_t)v6, (uint64_t)v14, 0, 0);

  return v27;
}

+ (id)statementForInserting:(id)a3 inTable:(id)a4
{
  return (id)objc_msgSend_statementForInserting_orUpdating_inTable_(a1, a2, (uint64_t)a3, 0, a4);
}

+ (id)statementForInserting:(id)a3 orUpdating:(id)a4 inTable:(id)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x1E4F28E78];
  id v15 = objc_msgSend_dbTableName(v10, v12, v13, v14);
  v18 = objc_msgSend_stringWithFormat_(v11, v16, @"INSERT INTO '%@' ("), v17, v15;

  uint64_t v21 = objc_msgSend_componentsJoinedByString_(v8, v19, @",", v20);
  objc_msgSend_appendString_(v18, v22, (uint64_t)v21, v23);

  objc_msgSend_appendString_(v18, v24, @" VALUES (:"), v25);
  v28 = objc_msgSend_componentsJoinedByString_(v8, v26, @",:", v27);
  objc_msgSend_appendString_(v18, v29, (uint64_t)v28, v30);

  objc_msgSend_appendString_(v18, v31, @""), v32);
  if (objc_msgSend_count(v9, v33, v34, v35))
  {
    id v52 = a1;
    id v54 = v8;
    objc_msgSend_appendString_(v18, v36, @" ON CONFLICT DO UPDATE SET ", v37);
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v53 = v9;
    id v38 = v9;
    uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v55, (uint64_t)v59, 16);
    if (v40)
    {
      uint64_t v43 = v40;
      uint64_t v44 = *(void *)v56;
      char v45 = 1;
      do
      {
        for (uint64_t i = 0; i != v43; ++i)
        {
          if (*(void *)v56 != v44) {
            objc_enumerationMutation(v38);
          }
          uint64_t v47 = *(void *)(*((void *)&v55 + 1) + 8 * i);
          if ((v45 & 1) == 0) {
            objc_msgSend_appendString_(v18, v41, @", ", v42);
          }
          objc_msgSend_appendFormat_(v18, v41, @"%@=excluded.%@", v42, v47, v47);
          char v45 = 0;
        }
        uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v41, (uint64_t)&v55, (uint64_t)v59, 16);
        char v45 = 0;
      }
      while (v43);
    }

    id v9 = v53;
    id v8 = v54;
    a1 = v52;
  }
  id v48 = objc_alloc((Class)a1);
  v50 = objc_msgSend_initWithTable_sql_resultColumns_resultColumnTypes_(v48, v49, (uint64_t)v10, (uint64_t)v18, 0, 0);

  return v50;
}

+ (id)statementForFetchingColumns:(id)a3 inTable:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v10 = objc_msgSend_stringWithFormat_(MEMORY[0x1E4F28E78], v8, @"SELECT ", v9);
  if (objc_msgSend_count(v6, v11, v12, v13))
  {
    id v16 = objc_msgSend_componentsJoinedByString_(v6, v14, @",", v15);
    objc_msgSend_appendString_(v10, v17, (uint64_t)v16, v18);
  }
  else
  {
    objc_msgSend_appendString_(v10, v14, @"(1)", v15);
  }
  char v22 = objc_msgSend_dbTableName(v7, v19, v20, v21);
  objc_msgSend_appendFormat_(v10, v23, @" FROM '%@'", v24, v22);

  uint64_t v28 = objc_msgSend_count(v6, v25, v26, v27);
  id v29 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v32 = objc_msgSend_initWithCapacity_(v29, v30, v28, v31);
  long long v33 = objc_opt_class();
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v34 = v6;
  uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v49, (uint64_t)v53, 16);
  if (v36)
  {
    uint64_t v39 = v36;
    uint64_t v40 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v50 != v40) {
          objc_enumerationMutation(v34);
        }
        uint64_t v42 = objc_msgSend_propertyInfo_(v33, v37, *(void *)(*((void *)&v49 + 1) + 8 * i), v38);
        objc_msgSend_addObject_(v32, v43, (uint64_t)v42, v44);
      }
      uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v37, (uint64_t)&v49, (uint64_t)v53, 16);
    }
    while (v39);
  }

  id v45 = objc_alloc((Class)a1);
  uint64_t v47 = objc_msgSend_initWithTable_sql_resultColumns_resultColumnTypes_(v45, v46, (uint64_t)v7, (uint64_t)v10, v34, v32);

  return v47;
}

+ (id)_statementForFetchingMinMax:(id)a3 forColumn:(id)a4 inTable:(id)a5
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v8 = (void *)MEMORY[0x1E4F28E78];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v15 = objc_msgSend_dbTableName(v9, v12, v13, v14);
  uint64_t v18 = objc_msgSend_stringWithFormat_(v8, v16, @"SELECT %@(%@) FROM '%@'", v17, v11, v10, v15);

  v32[0] = v10;
  uint64_t v20 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v19, (uint64_t)v32, 1);
  uint64_t v21 = objc_opt_class();
  uint64_t v24 = objc_msgSend_propertyInfo_(v21, v22, (uint64_t)v10, v23);
  uint64_t v31 = v24;
  uint64_t v26 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v25, (uint64_t)&v31, 1);

  id v27 = objc_alloc((Class)a1);
  id v29 = objc_msgSend_initWithTable_sql_resultColumns_resultColumnTypes_(v27, v28, (uint64_t)v9, (uint64_t)v18, v20, v26);

  return v29;
}

+ (id)statementForFetchingMinimumValueForColumn:(id)a3 inTable:(id)a4
{
  return (id)MEMORY[0x1F4181798](a1, sel__statementForFetchingMinMax_forColumn_inTable_, @"MIN", a3);
}

+ (id)statementForFetchingMaximumValueForColumn:(id)a3 inTable:(id)a4
{
  return (id)MEMORY[0x1F4181798](a1, sel__statementForFetchingMinMax_forColumn_inTable_, @"MAX", a3);
}

+ (id)statementForDeletingInTable:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28E78];
  id v5 = a3;
  id v9 = objc_msgSend_dbTableName(v5, v6, v7, v8);
  uint64_t v12 = objc_msgSend_stringWithFormat_(v4, v10, @"DELETE FROM '%@'", v11, v9);

  id v13 = objc_alloc((Class)a1);
  uint64_t v15 = objc_msgSend_initWithTable_sql_resultColumns_resultColumnTypes_(v13, v14, (uint64_t)v5, (uint64_t)v12, 0, 0);

  return v15;
}

- (CKSQLiteCompiledStatement)initWithDatabase:(id)a3 sql:(id)a4 resultColumns:(id)a5 resultColumnTypes:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CKSQLiteCompiledStatement;
  uint64_t v15 = [(CKSQLiteCompiledStatement *)&v20 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_db, a3);
    uint64_t v17 = objc_alloc_init(CKSQLiteCompiledStatementSetup);
    setup = v16->_setup;
    v16->_setup = v17;

    objc_storeStrong((id *)&v16->_setup->_sql, a4);
    objc_storeStrong((id *)&v16->_resultColumns, a5);
    objc_storeStrong((id *)&v16->_resultColumnTypes, a6);
  }

  return v16;
}

- (CKSQLiteCompiledStatement)initWithTable:(id)a3 sql:(id)a4 resultColumns:(id)a5 resultColumnTypes:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  uint64_t v17 = objc_msgSend_db(v10, v14, v15, v16);
  uint64_t v19 = (CKSQLiteCompiledStatement *)objc_msgSend_initWithDatabase_sql_resultColumns_resultColumnTypes_(self, v18, (uint64_t)v17, (uint64_t)v13, v12, v11);

  if (v19) {
    objc_storeWeak((id *)&v19->_table, v10);
  }

  return v19;
}

- (void)dealloc
{
  objc_msgSend_invalidate(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)CKSQLiteCompiledStatement;
  [(CKSQLiteCompiledStatement *)&v5 dealloc];
}

- (void)setLimit:(id)a3
{
  uint64_t v8 = (NSNumber *)a3;
  setup = self->_setup;
  if (!setup)
  {
    id v11 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6, v7);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, (uint64_t)self, @"CKSQLiteCompiledStatement.m", 300, @"Expected to have setup info");

    setup = self->_setup;
  }
  limit = setup->_limit;
  setup->_limit = v8;
}

- (NSNumber)limit
{
  setup = self->_setup;
  if (!setup)
  {
    id v9 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, @"CKSQLiteCompiledStatement.m", 305, @"Expected to have setup info");

    setup = self->_setup;
  }
  limit = setup->_limit;

  return limit;
}

- (void)setOffset:(id)a3
{
  uint64_t v8 = (NSNumber *)a3;
  setup = self->_setup;
  if (!setup)
  {
    id v11 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6, v7);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, (uint64_t)self, @"CKSQLiteCompiledStatement.m", 310, @"Expected to have setup info");

    setup = self->_setup;
  }
  offset = setup->_offset;
  setup->_offset = v8;
}

- (NSNumber)offset
{
  setup = self->_setup;
  if (!setup)
  {
    id v9 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, @"CKSQLiteCompiledStatement.m", 315, @"Expected to have setup info");

    setup = self->_setup;
  }
  offset = setup->_offset;

  return offset;
}

- (void)invalidate
{
  handle = self->_handle;
  if (handle)
  {
    self->_handle = 0;
    boundObjects = self->_boundObjects;
    self->_boundObjects = 0;

    objc_msgSend_finalizeHandle_(self->_db, v5, (uint64_t)handle, v6);
  }
  db = self->_db;
  self->_db = 0;
}

- (id)description
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  uint64_t v8 = objc_msgSend_stringWithFormat_(v3, v6, @"%@<%p> label=%@", v7, v5, self, self->_label);

  setup = self->_setup;
  if (setup) {
    objc_msgSend_appendFormat_(v8, v9, @" sql=\"%@\"", v10, setup->_sql);
  }

  return v8;
}

- (id)fetchedColumns
{
  return self->_resultColumns;
}

- (id)propertyDecoder:(id *)a3
{
  decoder = self->_decoder;
  if (!decoder)
  {
    uint64_t v7 = [CKSQLiteCompiledStatementDecoder alloc];
    uint64_t v10 = (CKSQLiteCompiledStatementDecoder *)objc_msgSend_initWithStatement_(v7, v8, (uint64_t)self, v9);
    id v11 = self->_decoder;
    self->_decoder = v10;

    decoder = self->_decoder;
  }
  id v12 = objc_msgSend_fillProperties(decoder, a2, (uint64_t)a3, v3);
  id v13 = v12;
  if (a3 && v12)
  {
    *a3 = v12;
    id v14 = self->_decoder;
    self->_decoder = 0;
  }
  uint64_t v15 = self->_decoder;

  return v15;
}

- (void)resetAndClearBindings
{
  sqlite3_reset(self->_handle);
  sqlite3_clear_bindings(self->_handle);
  boundObjects = self->_boundObjects;
  self->_boundObjects = 0;

  searchValues = self->_searchValues;
  self->_searchValues = 0;

  decoder = self->_decoder;
  self->_decoder = 0;

  fetchedValues = self->_fetchedValues;
  self->_fetchedValues = 0;

  if (self->_label)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_table);
    objc_msgSend_cacheStatement_(WeakRetained, v10, (uint64_t)self, v11);
  }
  else
  {
    objc_msgSend_invalidate(self, v7, v8, v9);
  }
}

- (id)setSearchPredicate:(id)a3 forProperties:(id)a4
{
  id v8 = a3;
  id v12 = a4;
  if (!self->_setup)
  {
    uint64_t v15 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v9, v10, v11);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, @"CKSQLiteCompiledStatement.m", 374, @"Expected to have setup info");
  }
  if (self->_handle)
  {
    id v13 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v9, @"CKErrorDomain", 1, @"cannot add a search predicate to a compiled statement");
  }
  else
  {
    objc_storeStrong((id *)&self->_setup->_wherePredicate, a3);
    objc_storeStrong((id *)&self->_searchProperties, a4);
    id v13 = 0;
  }

  return v13;
}

- (id)addBindingVariable:(id)a3 withAssociatedProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_table);
  uint64_t v9 = objc_opt_class();
  id v12 = objc_msgSend_propertyInfo_(v9, v10, (uint64_t)v7, v11);

  if (v12)
  {
    uint64_t v18 = objc_msgSend_intValue(v12, v13, v14, v15);
    bindingTypesByVariable = self->_bindingTypesByVariable;
    if (!bindingTypesByVariable)
    {
      objc_super v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v21 = self->_bindingTypesByVariable;
      self->_bindingTypesByVariable = v20;

      bindingTypesByVariable = self->_bindingTypesByVariable;
    }
    char v22 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v16, v18, v17);
    objc_msgSend_setObject_forKey_(bindingTypesByVariable, v23, (uint64_t)v22, (uint64_t)v6);

    uint64_t v24 = 0;
  }
  else
  {
    uint64_t v24 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v13, @"CKErrorDomain", 1, @"type not found for property %@ (associated with predicate variable %@)", v7, v6);
  }

  return v24;
}

- (void)setSearchValues:(id)a3
{
}

- (id)sqlValueForVariable:(id)a3
{
  if (self->_handle)
  {
    objc_msgSend_objectForKey_(self->_searchValues, a2, (uint64_t)a3, v3);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      id v8 = v4;
      objc_msgSend_description(v4, v5, v6, v7);
    }
    else
    {
      id v8 = @"(nil)";
      objc_msgSend_description(@"(nil)", v5, v6, v7);
    uint64_t v9 = };
  }
  else
  {
    uint64_t v9 = objc_msgSend_stringWithFormat_(NSString, a2, @"@%@", v3, a3);
  }

  return v9;
}

- (id)doSearchValueBinding
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_18AF13A88;
  id v13 = sub_18AF13820;
  id v14 = 0;
  searchValues = self->_searchValues;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_18B013FD0;
  v8[3] = &unk_1E54603F0;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(searchValues, a2, (uint64_t)v8, v2);
  objc_super v5 = self->_searchValues;
  self->_searchValues = 0;

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)searchBindingsDescription
{
  setup = self->_setup;
  if (setup)
  {
    if (setup->_wherePredicate)
    {
      id v4 = (__CFString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
      id v6 = (id)objc_msgSend_cksqlcs_appendSQLToString_statement_(self->_setup->_wherePredicate, v5, (uint64_t)v4, (uint64_t)self);
    }
    else
    {
      id v4 = @"()";
    }
  }
  else
  {
    id v4 = @"(<search bindings not available>)";
  }

  return v4;
}

- (void)orderByProperty:(id)a3 ascending:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (!self->_handle)
  {
    id v26 = v7;
    setup = self->_setup;
    if (!setup)
    {
      uint64_t v24 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9, v10);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v24, v25, (uint64_t)a2, (uint64_t)self, @"CKSQLiteCompiledStatement.m", 469, @"Expected to have setup info");

      setup = self->_setup;
    }
    orderBySQL = setup->_orderBySQL;
    if (orderBySQL)
    {
      objc_msgSend_appendString_(orderBySQL, v8, @",", v10);
    }
    else
    {
      id v15 = objc_alloc(MEMORY[0x1E4F28E78]);
      uint64_t v18 = objc_msgSend_initWithString_(v15, v16, @" ORDER BY ", v17);
      uint64_t v19 = self->_setup;
      objc_super v20 = v19->_orderBySQL;
      v19->_orderBySQL = (NSMutableString *)v18;
    }
    objc_msgSend_appendString_(self->_setup->_orderBySQL, v13, (uint64_t)v26, v14);
    uint64_t v23 = self->_setup->_orderBySQL;
    if (v4) {
      objc_msgSend_appendString_(v23, v21, @" ASC", v22);
    }
    else {
      objc_msgSend_appendString_(v23, v21, @" DESC", v22);
    }
    id v7 = v26;
  }
}

- (id)compile
{
  if (!self->_db)
  {
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, a2, @"CKErrorDomain", 1, @"statement invalidated.");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  if (self->_handle)
  {
    id v5 = 0;
    goto LABEL_28;
  }
  setup = self->_setup;
  if (!setup)
  {
    uint64_t v25 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v26, (uint64_t)a2, (uint64_t)self, @"CKSQLiteCompiledStatement.m", 491, @"Expected to have setup info");

    setup = self->_setup;
  }
  if (setup->_wherePredicate || setup->_orderBySQL || setup->_limit || setup->_offset)
  {
    id v7 = objc_msgSend_mutableCopy(setup->_sql, a2, v2, v3);
    id v8 = v7;
    setup = self->_setup;
    if (setup->_wherePredicate)
    {
      objc_msgSend_appendString_(v7, a2, @" WHERE ", v3);
      uint64_t v10 = objc_msgSend_cksqlcs_appendSQLToString_statement_(self->_setup->_wherePredicate, v9, (uint64_t)v8, (uint64_t)self);
      if (v10)
      {
        id v5 = (id)v10;
        int v12 = 0;
        if (!v8) {
          goto LABEL_24;
        }
        goto LABEL_23;
      }
      setup = self->_setup;
    }
  }
  else
  {
    id v8 = 0;
  }
  uint64_t orderBySQL = (uint64_t)setup->_orderBySQL;
  if (orderBySQL)
  {
    objc_msgSend_appendString_(v8, a2, orderBySQL, v3);
    setup = self->_setup;
  }
  if (setup->_limit)
  {
    objc_msgSend_appendFormat_(v8, a2, @" LIMIT %@", v3, setup->_limit);
    setup = self->_setup;
  }
  offset = setup->_offset;
  if (offset) {
    objc_msgSend_appendFormat_(v8, a2, @" OFFSET %@", v3, offset);
  }
  id v5 = 0;
  int v12 = 1;
  if (!v8) {
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v14 = objc_msgSend_copy(v8, a2, orderBySQL, v3);
  id v15 = self->_setup;
  sql = v15->_sql;
  v15->_sql = (NSString *)v14;

LABEL_24:
  if (v12)
  {
    db = self->_db;
    uint64_t v18 = self->_setup->_sql;
    id v27 = 0;
    uint64_t v19 = (sqlite3_stmt *)objc_msgSend_compiledStatementWithSQL_error_(db, a2, (uint64_t)v18, (uint64_t)&v27);
    id v5 = v27;
    self->_handle = v19;
  }

  if (v5) {
    objc_msgSend_invalidate(self, v20, v21, v22);
  }
LABEL_28:

  return v5;
}

- (id)_fillFetchedValues
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  int v5 = objc_msgSend_count(self->_resultColumns, a2, v2, v3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_table);
  if (v5 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = v5;
    unint64_t v8 = 0x1E4F28000uLL;
    unint64_t v9 = 0x1E4F1C000uLL;
    while (1)
    {
      if (sqlite3_column_type(self->_handle, v6) == 5)
      {
        int v12 = 0;
        id v13 = 0;
        objc_msgSend_replacePointerAtIndex_withPointer_(self->_fetchedValues, v10, v6, 0);
        goto LABEL_30;
      }
      uint64_t v14 = objc_msgSend_objectAtIndex_(self->_resultColumnTypes, v10, v6, v11);
      unsigned __int8 v18 = objc_msgSend_intValue(v14, v15, v16, v17);
      if (v18 > 0x53u)
      {
        if (v18 > 0x85u)
        {
          if (v18 != 134)
          {
            if (v18 == 135)
            {
              uint64_t v32 = (void *)MEMORY[0x18C12ADA0]();
              id v13 = (id)sqlite3_column_blob(self->_handle, v6);
              if (v13)
              {
                int v33 = sqlite3_column_bytes(self->_handle, v6);
                uint64_t v35 = objc_msgSend_dataWithBytes_length_(*(void **)(v9 + 2488), v34, (uint64_t)v13, v33);
                uint64_t v38 = objc_msgSend_objectAtIndex_(self->_resultColumns, v36, v6, v37);
                v41 = objc_msgSend_objectClassesForProperty_(WeakRetained, v39, (uint64_t)v38, v40);
                id v75 = 0;
                int v12 = objc_msgSend_unarchivedObjectOfClass_fromDatabaseArchive_error_(CKSQLiteDatabase, v42, (uint64_t)v41, (uint64_t)v35, &v75);
                id v13 = v75;

                unint64_t v8 = 0x1E4F28000;
                unint64_t v9 = 0x1E4F1C000;
              }
              else
              {
                int v12 = 0;
              }
              goto LABEL_29;
            }
LABEL_33:
            objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v19, @"CKErrorDomain", 1, @"Fetched unknown type %u", v18);
            id v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_34:
            int v12 = 0;
            goto LABEL_29;
          }
          v63 = sqlite3_column_blob(self->_handle, v6);
          if (!v63) {
            goto LABEL_43;
          }
          uint64_t v64 = (uint64_t)v63;
          int v65 = sqlite3_column_bytes(self->_handle, v6);
          if (v65 != 16)
          {
            int v70 = v65;
            if (ck_log_initialization_predicate != -1) {
              dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
            }
            v71 = ck_log_facility_sql;
            if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 67109120;
              int v77 = v70;
              _os_log_fault_impl(&dword_18AF10000, v71, OS_LOG_TYPE_FAULT, "Invalid UUID length in database: %d", buf, 8u);
            }
LABEL_43:
            int v12 = 0;
            goto LABEL_28;
          }
          id v66 = objc_alloc(MEMORY[0x1E4F29128]);
          uint64_t v24 = objc_msgSend_initWithUUIDBytes_(v66, v67, v64, v68);
        }
        else if (v18 - 84 < 2)
        {
LABEL_14:
          id v27 = *(void **)(v8 + 3792);
          double v28 = sqlite3_column_double(self->_handle, v6);
          uint64_t v24 = objc_msgSend_numberWithDouble_(v27, v29, v30, v31, v28);
        }
        else
        {
          if (v18 != 132) {
            goto LABEL_33;
          }
          id v13 = (id)sqlite3_column_blob(self->_handle, v6);
          if (!v13) {
            goto LABEL_34;
          }
          int v25 = sqlite3_column_bytes(self->_handle, v6);
          uint64_t v24 = objc_msgSend_dataWithBytes_length_(*(void **)(v9 + 2488), v26, (uint64_t)v13, v25);
        }
      }
      else
      {
        if (v18 - 73 >= 0xB)
        {
          switch(v18)
          {
            case 1u:
              break;
            case 2u:
              goto LABEL_14;
            case 3u:
              uint64_t v43 = sqlite3_column_text(self->_handle, v6);
              if (!v43) {
                goto LABEL_43;
              }
              uint64_t v24 = objc_msgSend_stringWithUTF8String_(NSString, v44, (uint64_t)v43, v45);
              goto LABEL_27;
            case 5u:
              double v46 = sqlite3_column_double(self->_handle, v6);
              uint64_t v24 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E4F1C9C8], v47, v48, v49, v46);
              goto LABEL_27;
            case 8u:
              long long v50 = *(void **)(v8 + 3792);
              sqlite3_int64 v51 = sqlite3_column_int64(self->_handle, v6);
              long long v56 = objc_msgSend_numberWithLongLong_(v50, v52, v51, v53);
              if (v56)
              {
                long long v57 = objc_msgSend_objectAtIndex_(self->_resultColumns, v54, v6, v55);
                objc_msgSend_tableForReferenceProperty_(WeakRetained, v58, (uint64_t)v57, v59);
                v61 = unint64_t v60 = v8;

                id v74 = 0;
                int v12 = objc_msgSend_entryForDatabaseReferenceValue_error_(v61, v62, (uint64_t)v56, (uint64_t)&v74);
                id v13 = v74;

                unint64_t v8 = v60;
                unint64_t v9 = 0x1E4F1C000;
              }
              else
              {
                int v12 = 0;
                id v13 = 0;
              }

              goto LABEL_29;
            default:
              goto LABEL_33;
          }
        }
        objc_super v20 = *(void **)(v8 + 3792);
        sqlite3_int64 v21 = sqlite3_column_int64(self->_handle, v6);
        uint64_t v24 = objc_msgSend_numberWithLongLong_(v20, v22, v21, v23);
      }
LABEL_27:
      int v12 = (void *)v24;
LABEL_28:
      id v13 = 0;
LABEL_29:

      objc_msgSend_replacePointerAtIndex_withPointer_(self->_fetchedValues, v69, v6, (uint64_t)v12);
LABEL_30:

      if (++v6 >= v7 || v13) {
        goto LABEL_45;
      }
    }
  }
  id v13 = 0;
LABEL_45:

  return v13;
}

- (BOOL)step:(id *)a3
{
  if (!self->_fetchedValues)
  {
    objc_msgSend_strongObjectsPointerArray(MEMORY[0x1E4F28F50], a2, (uint64_t)a3, v3);
    uint64_t v6 = (NSPointerArray *)objc_claimAutoreleasedReturnValue();
    fetchedValues = self->_fetchedValues;
    self->_fetchedValues = v6;

    unint64_t v8 = self->_fetchedValues;
    uint64_t v12 = objc_msgSend_count(self->_resultColumns, v9, v10, v11);
    objc_msgSend_setCount_(v8, v13, v12, v14);
  }
  if (self->_handle
    || (objc_msgSend_compile(self, a2, (uint64_t)a3, v3), (id v15 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (!self->_searchValues
      || (objc_msgSend_doSearchValueBinding(self, a2, (uint64_t)a3, v3),
          (id v15 = (id)objc_claimAutoreleasedReturnValue()) == 0))
    {
      handle = self->_handle;
      if (!handle)
      {
        BOOL v18 = 0;
        goto LABEL_13;
      }
      char v17 = sqlite3_step(handle);
      BOOL v18 = v17 == 100;
      if ((v17 & 0xFE) == 0x64
        || (objc_msgSend_sqlErrorWithMessage_(self->_db, a2, @"sqlite3_step() failed", v3),
            (id v15 = (id)objc_claimAutoreleasedReturnValue()) == 0))
      {
LABEL_13:
        objc_msgSend__fillFetchedValues(self, a2, (uint64_t)a3, v3);
        id v15 = (id)objc_claimAutoreleasedReturnValue();
        if (!v15) {
          goto LABEL_17;
        }
      }
    }
  }
  if (a3)
  {
    id v15 = v15;
    BOOL v18 = 0;
    *a3 = v15;
  }
  else
  {
    BOOL v18 = 0;
  }
LABEL_17:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_table);
  char v23 = objc_msgSend_logOperations(WeakRetained, v20, v21, v22);

  if ((v23 & 1) == 0)
  {
    setup = self->_setup;
    self->_setup = 0;
  }
  return v18;
}

- (id)boundObjects
{
  boundObjects = self->_boundObjects;
  if (!boundObjects)
  {
    BOOL v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    int v5 = self->_boundObjects;
    self->_boundObjects = v4;

    boundObjects = self->_boundObjects;
  }

  return boundObjects;
}

- (id)bindValue:(id)a3 ofType:(unsigned int)a4 atIndex:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  unsigned __int8 v6 = a4;
  id v11 = a3;
  if (!self->_handle)
  {
    uint64_t v12 = objc_msgSend_compile(self, v8, v9, v10);
    if (v12) {
      goto LABEL_24;
    }
  }
  if (!v11)
  {
    if (sqlite3_bind_null(self->_handle, v5))
    {
      objc_msgSend_sqlErrorWithMessage_(self->_db, v13, @"Failed to bind NULL value", v14);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v15 = 0;
    }
    id v11 = 0;
    goto LABEL_25;
  }
  if (v6 <= 0x53u)
  {
    if (v6 - 73 >= 0xB)
    {
      switch(v6)
      {
        case 1u:
        case 8u:
          goto LABEL_5;
        case 2u:
        case 5u:
          goto LABEL_15;
        case 3u:
          char v23 = objc_msgSend_boundObjects(self, v8, v9, v10);
          objc_msgSend_addObject_(v23, v24, (uint64_t)v11, v25);

          uint64_t v12 = objc_msgSend_cksqlcs_bindText_index_db_(v11, v26, (uint64_t)self->_handle, v5, self->_db);
          break;
        default:
          goto LABEL_23;
      }
    }
    else
    {
LABEL_5:
      uint64_t v12 = objc_msgSend_cksqlcs_bindInt64_index_db_(v11, v8, (uint64_t)self->_handle, v5, self->_db);
    }
    goto LABEL_24;
  }
  if (v6 > 0x85u)
  {
    if (v6 != 134)
    {
      if (v6 != 135)
      {
LABEL_23:
        uint64_t v12 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v8, @"CKErrorDomain", 1, @"Attempted to bind using unknown type %u", v6);
        goto LABEL_24;
      }
      uint64_t v16 = (void *)MEMORY[0x18C12ADA0]();
      id v28 = 0;
      uint64_t v18 = objc_msgSend_databaseArchiveWithObject_error_(CKSQLiteDatabase, v17, (uint64_t)v11, (uint64_t)&v28);
      id v15 = v28;

      id v11 = (id)v18;
      if (v15) {
        goto LABEL_25;
      }
    }
    goto LABEL_21;
  }
  if (v6 - 84 >= 2)
  {
    if (v6 != 132) {
      goto LABEL_23;
    }
LABEL_21:
    uint64_t v19 = objc_msgSend_boundObjects(self, v8, v9, v10);
    objc_msgSend_addObject_(v19, v20, (uint64_t)v11, v21);

    uint64_t v12 = objc_msgSend_cksqlcs_bindBlob_index_db_(v11, v22, (uint64_t)self->_handle, v5, self->_db);
    goto LABEL_24;
  }
LABEL_15:
  uint64_t v12 = objc_msgSend_cksqlcs_bindDouble_index_db_(v11, v8, (uint64_t)self->_handle, v5, self->_db);
LABEL_24:
  id v15 = (id)v12;
LABEL_25:

  return v15;
}

- (id)bindValueColumn:(id)a3 type:(unsigned int)a4 value:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  v29[1] = *(id *)MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v12 = a5;
  if (!self->_handle)
  {
    uint64_t v27 = objc_msgSend_compile(self, v9, v10, v11);
    if (v27)
    {
      id v25 = (id)v27;
      goto LABEL_11;
    }
  }
  uint64_t v13 = objc_msgSend_length(v8, v9, v10, v11);
  uint64_t v14 = (char *)v29 - ((v13 + 17) & 0xFFFFFFFFFFFFFFF0);
  char *v14 = 58;
  objc_msgSend_getCString_maxLength_encoding_(v8, v15, (uint64_t)(v14 + 1), v13 + 1, 1);
  uint64_t v16 = sqlite3_bind_parameter_index(self->_handle, v14);
  if (!v16)
  {
    uint64_t v26 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v17, @"CKErrorDomain", 1, @"No binding index for %@", v8);
    goto LABEL_10;
  }
  uint64_t v18 = v16;
  if (v6 != 8) {
    goto LABEL_6;
  }
  if (!v12) {
    goto LABEL_6;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_table);
  uint64_t v22 = objc_msgSend_tableForReferenceProperty_(WeakRetained, v20, (uint64_t)v8, v21);

  v29[0] = 0;
  uint64_t v24 = objc_msgSend_databaseReferenceValueForEntry_error_(v22, v23, (uint64_t)v12, (uint64_t)v29);
  id v25 = v29[0];

  id v12 = (id)v24;
  if (!v25)
  {
LABEL_6:
    uint64_t v26 = objc_msgSend_bindValue_ofType_atIndex_(self, v17, (uint64_t)v12, v6, v18);
LABEL_10:
    id v25 = (id)v26;
  }
LABEL_11:

  return v25;
}

- (void)enumerateResultColumnsWithBlock:(id)a3
{
  id v4 = a3;
  resultColumns = self->_resultColumns;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_18B0150D0;
  v9[3] = &unk_1E5460418;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  objc_msgSend_enumerateObjectsUsingBlock_(resultColumns, v7, (uint64_t)v9, v8);
}

- (id)cksqlcs_appendSQLConstantValueToString:(id)a3
{
  id v8 = a3;
  if (self->_searchValues)
  {
    uint64_t v13 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6, v7);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, (uint64_t)self, @"CKSQLiteCompiledStatement.m", 764, @"Cannot generate constant SQL for a statement with value bindings");
  }
  id v9 = (id)objc_msgSend_compile(self, v5, v6, v7);
  objc_msgSend_appendFormat_(v8, v10, @"(%@)", v11, self->_setup->_sql);

  return 0;
}

- (CKSQLiteTable)table
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_table);

  return (CKSQLiteTable *)WeakRetained;
}

- (id)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSArray)searchProperties
{
  return self->_searchProperties;
}

- (void)setSearchProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchProperties, 0);
  objc_storeStrong(&self->_label, 0);
  objc_destroyWeak((id *)&self->_table);
  objc_storeStrong((id *)&self->_decoder, 0);
  objc_storeStrong((id *)&self->_boundObjects, 0);
  objc_storeStrong((id *)&self->_searchValues, 0);
  objc_storeStrong((id *)&self->_bindingTypesByVariable, 0);
  objc_storeStrong((id *)&self->_fetchedValues, 0);
  objc_storeStrong((id *)&self->_resultColumnTypes, 0);
  objc_storeStrong((id *)&self->_resultColumns, 0);
  objc_storeStrong((id *)&self->_setup, 0);

  objc_storeStrong((id *)&self->_db, 0);
}

@end