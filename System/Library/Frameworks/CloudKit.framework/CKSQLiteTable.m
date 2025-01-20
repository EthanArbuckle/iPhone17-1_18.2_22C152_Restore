@interface CKSQLiteTable
+ (BOOL)entriesHaveEqualProperties:(id)a3 other:(id)a4 includePrimaryKeys:(BOOL)a5;
+ (BOOL)shouldValidateEntryClass;
+ (BOOL)useNSCoding;
+ (Class)entryClass;
+ (Class)tableClassWithName:(id)a3 properties:(id)a4 version:(unint64_t)a5 entryClass:(Class)a6;
+ (id)allPropertyNames;
+ (id)copyOfEntry:(id)a3;
+ (id)dbProperties;
+ (id)descriptionOfEntry:(id)a3;
+ (id)descriptionOfProperties:(id)a3 from:(id)a4;
+ (id)flattenedDBProperties;
+ (id)nonKeyProperties;
+ (id)propertyInfo:(id)a3;
+ (id)valueForProperty:(id)a3 propertyInfo:(id)a4 inObject:(id)a5;
+ (id)valueForProperty:(id)a3 propertyInfo:(id)a4 inObject:(id)a5 allowFetchingUnsetPropertySentinel:(BOOL)a6;
+ (unint64_t)dbVersion;
+ (unint64_t)hashForEntry:(id)a3;
+ (unsigned)propertyCount;
+ (void)decodeEntry:(id)a3 withCoder:(id)a4;
+ (void)encodeEntry:(id)a3 withCoder:(id)a4;
+ (void)enumerateClassPropertyDictionariesWithBlock:(id)a3;
+ (void)enumeratePropertyDataWithBlock:(id)a3;
+ (void)initialize;
+ (void)setValue:(id)a3 forProperty:(id)a4 propertyInfo:(id)a5 inObject:(id)a6;
- (BOOL)databaseTableWasCreated;
- (BOOL)hasEntries:(id *)a3;
- (BOOL)hasEntry:(id)a3 error:(id *)a4;
- (BOOL)isIntegerPrimaryKeyTable;
- (BOOL)logOperations;
- (BOOL)migrateDataFromTable:(id)a3 error:(id *)a4;
- (BOOL)migrateEntryDataFromTable:(id)a3 entry:(id)a4 toEntry:(id)a5 addedProperties:(id)a6;
- (CKSQLiteTable)init;
- (CKSQLiteTable)initWithLogicalTableName:(id)a3;
- (CKSQLiteTableGroup)tableGroup;
- (NSArray)primaryKeyProperties;
- (NSNumber)primaryKeyPropertyInfo;
- (NSObject)databaseManagerData;
- (NSString)dbTableName;
- (NSString)logicalTableName;
- (NSString)primaryKeyProperty;
- (id)UUIDValueForKey:(id)a3 error:(id *)a4;
- (id)_bindProperties:(id)a3 valueObject:(id)a4 inStatement:(id)a5 includePrimaryKeys:(BOOL)a6;
- (id)_fetchPropertiesUsingStatement:(id)a3 inObject:(id)a4 matchingDBProperties:(id)a5 label:(id *)a6;
- (id)_performEnumerationWithBlock:(id)a3 usingEnumerator:(id)a4;
- (id)_performInsertOrUpdateStatement:(id)a3 usingObject:(id)a4;
- (id)_predicateForMatchingProperties:(id)a3;
- (id)_statementForFetchingEntriesMatchingObject:(id)a3 label:(id *)a4 error:(id *)a5 setupBlock:(id)a6;
- (id)_valueDictionaryForProperties:(id)a3 inObject:(id)a4 nilPropertyError:(id *)a5 selForNilPropertyError:(SEL)a6;
- (id)addPredicateToStatement:(id)a3 predicate:(id)a4;
- (id)checkConstraintForProperty:(id)a3;
- (id)compiledStatementWithLabel:(id *)a3 creationBlock:(id)a4;
- (id)createTableSQL;
- (id)dataValueForKey:(id)a3 error:(id *)a4;
- (id)dateValueForKey:(id)a3 error:(id *)a4;
- (id)db;
- (id)deleteObject:(id)a3;
- (id)deletePrimaryKeyValue:(id)a3;
- (id)description;
- (id)didCreateDatabaseTable;
- (id)entriesMatchingObject:(id)a3 label:(id *)a4 error:(id *)a5 setupBlock:(id)a6;
- (id)entriesWithValues:(id)a3 label:(id *)a4 error:(id *)a5 setupBlock:(id)a6;
- (id)entryEnumerator:(id *)a3;
- (id)entryWithPrimaryKey:(id)a3 fetchProperties:(id)a4 label:(id *)a5 error:(id *)a6;
- (id)entryWithValues:(id)a3 label:(id *)a4 error:(id *)a5 setupBlock:(id)a6;
- (id)enumerateEntriesWithBlock:(id)a3;
- (id)extraGroupTables:(id)a3;
- (id)fetchAllEntries:(id *)a3;
- (id)fetchAllProperties:(id)a3;
- (id)fetchProperties:(id)a3 inObject:(id)a4 matchingDBProperties:(id)a5 label:(id *)a6;
- (id)fetchProperties:(id)a3 label:(id *)a4 error:(id *)a5;
- (id)finishInitializing;
- (id)insertObject:(id)a3;
- (id)insertObject:(id)a3 orUpdateProperties:(id)a4 label:(id *)a5;
- (id)maximumValueOfProperty:(id)a3 label:(id *)a4 error:(id *)a5;
- (id)minimumValueOfProperty:(id)a3 label:(id *)a4 error:(id *)a5;
- (id)newEntryObject;
- (id)newEntryObjectFromStatement:(id)a3 error:(id *)a4;
- (id)numberValueForKey:(id)a3 error:(id *)a4;
- (id)objectClassesForProperty:(id)a3;
- (id)performInTransaction:(id)a3;
- (id)performTransaction:(id)a3;
- (id)predicateForMatchingPrimaryKeys;
- (id)primaryKeyValuesInEntry:(id)a3;
- (id)referenceProperties;
- (id)requestCallbackWithDate:(id)a3 coalescingInterval:(double)a4 minimumSeparation:(double)a5;
- (id)setDataValue:(id)a3 forKey:(id)a4;
- (id)setDateValue:(id)a3 forKey:(id)a4;
- (id)setNumberValue:(id)a3 forKey:(id)a4;
- (id)setStringValue:(id)a3 forKey:(id)a4;
- (id)setUUIDValue:(id)a3 forKey:(id)a4;
- (id)setupReferencedTableCache;
- (id)statementForFetchingProperties:(id)a3 inEntriesMatchingColumns:(id)a4 error:(id *)a5;
- (id)stringValueForKey:(id)a3 error:(id *)a4;
- (id)tableForReferenceProperty:(id)a3;
- (id)tableForReferenceProperty:(id)a3 block:(id)a4;
- (id)tocTableEntry;
- (id)updateProperties:(id)a3 usingObject:(id)a4 label:(id *)a5;
- (id)updateUsingObject:(id)a3;
- (id)valueForProperty:(id)a3 propertyInfo:(id)a4 inObject:(id)a5;
- (id)wakeFromDatabase;
- (int64_t)sizeOfProperty:(id)a3 inEntriesMatching:(id)a4 label:(id *)a5 error:(id *)a6 predicate:(id)a7;
- (int64_t)sizeOfProperty:(id)a3 inEntry:(id)a4 label:(id *)a5 error:(id *)a6;
- (int64_t)sizeOfProperty:(id)a3 label:(id *)a4 error:(id *)a5;
- (int64_t)sumOfProperty:(id)a3 inEntriesMatching:(id)a4 label:(id *)a5 error:(id *)a6 predicate:(id)a7;
- (int64_t)sumOfProperty:(id)a3 label:(id *)a4 error:(id *)a5;
- (unint64_t)count:(id *)a3;
- (unint64_t)countOfEntriesMatching:(id)a3 label:(id *)a4 error:(id *)a5 predicate:(id)a6;
- (unint64_t)deleteAllEntries:(id *)a3;
- (unint64_t)deleteEntriesMatching:(id)a3 label:(id *)a4 error:(id *)a5 predicate:(id)a6;
- (unint64_t)setProperties:(id)a3 valuesToStore:(id)a4 inEntriesMatching:(id)a5 label:(id *)a6 error:(id *)a7 predicate:(id)a8;
- (void)_addPredicateForMatching:(id)a3 toStatement:(id)a4;
- (void)_setupActivityEntry:(id)a3;
- (void)addTransactionCompletionHandler:(id)a3;
- (void)cacheStatement:(id)a3;
- (void)dealloc;
- (void)serialize:(id)a3;
- (void)setDatabaseManagerData:(id)a3;
- (void)setDbTableName:(id)a3;
- (void)setLogOperations:(BOOL)a3;
- (void)setTableGroup:(id)a3;
- (void)setTocTableEntry:(id)a3;
- (void)setValue:(id)a3 forProperty:(id)a4 propertyInfo:(id)a5 inObject:(id)a6;
@end

@implementation CKSQLiteTable

+ (void)initialize
{
  v6 = objc_msgSend_entryClass(a1, a2, v2, v3);
  if (v6)
  {
    v10 = v6;
    if (objc_msgSend__cksql_isTableEntry(v6, v7, v8, v9))
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = sub_18B01B5F4;
      aBlock[3] = &unk_1E5460508;
      aBlock[4] = a1;
      v11 = _Block_copy(aBlock);
      v12 = _Block_copy(v11);
      v13 = imp_implementationWithBlock(v12);

      Class = object_getClass(v10);
      if (!class_addMethod(Class, sel_tableClass, v13, 0))
      {
        v23 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v15, v16, v17);
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v23, v24, (uint64_t)a2, (uint64_t)a1, @"CKSQLiteTable.m", 474, @"failed to add method");
      }
    }
  }
  if ((id)objc_opt_class() == a1)
  {
    qword_1E912A320 = (uint64_t)objc_getClass("CKSQLiteUnsetPropertySentinel");
    id v18 = objc_alloc(MEMORY[0x1E4F1CA60]);
    uint64_t v21 = objc_msgSend_initWithCapacity_(v18, v19, 32, v20);
    v22 = (void *)qword_1E912A328;
    qword_1E912A328 = v21;
  }
}

+ (BOOL)shouldValidateEntryClass
{
  return 1;
}

+ (unint64_t)dbVersion
{
  return 1;
}

+ (Class)entryClass
{
  return 0;
}

+ (id)dbProperties
{
  return 0;
}

- (id)objectClassesForProperty:(id)a3
{
  return (id)objc_msgSend_set(MEMORY[0x1E4F1CA80], a2, (uint64_t)a3, v3);
}

+ (void)enumerateClassPropertyDictionariesWithBlock:(id)a3
{
  v4 = (void (**)(id, id, char *))a3;
  id v7 = (id)objc_opt_class();
  uint64_t v8 = 0;
  char v16 = 0;
  do
  {
    uint64_t v9 = (void (*)(id, char *))objc_msgSend_methodForSelector_(a1, v5, (uint64_t)sel_dbProperties, v6);
    v10 = v9(a1, sel_dbProperties);
    v11 = v10;
    if (v10 != v8)
    {
      id v12 = v10;

      v4[2](v4, v12, &v16);
      uint64_t v8 = v12;
    }
    if (a1 == v7) {
      char v16 = 1;
    }

    a1 = (id)objc_msgSend_superclass(a1, v13, v14, v15);
  }
  while (!v16);
}

+ (void)enumeratePropertyDataWithBlock:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_18B01B7B0;
  v8[3] = &unk_1E5460558;
  id v9 = v4;
  id v5 = v4;
  objc_msgSend_enumerateClassPropertyDictionariesWithBlock_(a1, v6, (uint64_t)v8, v7);
}

+ (unsigned)propertyCount
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_18B01B958;
  v5[3] = &unk_1E5460580;
  v5[4] = &v6;
  objc_msgSend_enumerateClassPropertyDictionariesWithBlock_(a1, a2, (uint64_t)v5, v2);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (id)allPropertyNames
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_18B01BA40;
  v8[3] = &unk_1E54605A8;
  id v4 = v3;
  id v9 = v4;
  objc_msgSend_enumeratePropertyDataWithBlock_(a1, v5, (uint64_t)v8, v6);

  return v4;
}

+ (id)propertyInfo:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  char v16 = sub_18AF13AC4;
  uint64_t v17 = sub_18AF13830;
  id v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_18B01BB70;
  v10[3] = &unk_1E54605D0;
  id v12 = &v13;
  id v5 = v4;
  id v11 = v5;
  objc_msgSend_enumerateClassPropertyDictionariesWithBlock_(a1, v6, (uint64_t)v10, v7);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v8;
}

+ (id)flattenedDBProperties
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_18B01BC7C;
  v8[3] = &unk_1E54605A8;
  id v4 = v3;
  id v9 = v4;
  objc_msgSend_enumeratePropertyDataWithBlock_(a1, v5, (uint64_t)v8, v6);

  return v4;
}

+ (Class)tableClassWithName:(id)a3 properties:(id)a4 version:(unint64_t)a5 entryClass:(Class)a6
{
  v10 = (NSString *)a3;
  id v11 = a4;
  id v12 = objc_opt_class();
  objc_sync_enter(v12);
  Class ClassPair = NSClassFromString(v10);
  if (!ClassPair)
  {
    uint64_t v14 = v10;
    id v18 = (const char *)objc_msgSend_UTF8String(v14, v15, v16, v17);
    Class ClassPair = objc_allocateClassPair((Class)a1, v18, 0);
    if (v11)
    {
      v22 = objc_msgSend_copy(v11, v19, v20, v21);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = sub_18B01BF58;
      aBlock[3] = &unk_1E54605F8;
      id v23 = v22;
      id v41 = v23;
      v24 = _Block_copy(aBlock);
      Class = object_getClass(ClassPair);
      v26 = _Block_copy(v24);
      v27 = imp_implementationWithBlock(v26);
      class_addMethod(Class, sel_dbProperties, v27, 0);
    }
    if (a5)
    {
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = sub_18B01BF60;
      v39[3] = &unk_1E5460618;
      v39[4] = a5;
      v28 = _Block_copy(v39);
      v29 = object_getClass(ClassPair);
      v30 = _Block_copy(v28);
      v31 = imp_implementationWithBlock(v30);
      class_addMethod(v29, sel_dbVersion, v31, 0);
    }
    if (a6)
    {
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = sub_18B01BF68;
      v38[3] = &unk_1E5460638;
      v38[4] = a6;
      v32 = _Block_copy(v38);
      v33 = object_getClass(ClassPair);
      v34 = _Block_copy(v32);
      v35 = imp_implementationWithBlock(v34);
      class_addMethod(v33, sel_entryClass, v35, 0);
    }
    objc_registerClassPair(ClassPair);
  }
  objc_sync_exit(v12);

  v36 = ClassPair;
  return v36;
}

+ (void)encodeEntry:(id)a3 withCoder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_18B01C030;
  v12[3] = &unk_1E5460660;
  id v14 = v7;
  id v15 = a1;
  id v13 = v6;
  id v8 = v7;
  id v9 = v6;
  objc_msgSend_enumeratePropertyDataWithBlock_(a1, v10, (uint64_t)v12, v11);
}

+ (void)decodeEntry:(id)a3 withCoder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_18B01C188;
  v12[3] = &unk_1E5460660;
  id v14 = v6;
  id v15 = a1;
  id v13 = v7;
  id v8 = v6;
  id v9 = v7;
  objc_msgSend_enumeratePropertyDataWithBlock_(a1, v10, (uint64_t)v12, v11);
}

+ (unint64_t)hashForEntry:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_18B01C39C;
  v10[3] = &unk_1E5460688;
  id v12 = &v14;
  id v13 = a1;
  id v5 = v4;
  id v11 = v5;
  objc_msgSend_enumeratePropertyDataWithBlock_(a1, v6, (uint64_t)v10, v7);
  unint64_t v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

+ (BOOL)entriesHaveEqualProperties:(id)a3 other:(id)a4 includePrimaryKeys:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_18B01C560;
  v15[3] = &unk_1E54606B0;
  BOOL v20 = a5;
  id v19 = a1;
  id v10 = v8;
  id v16 = v10;
  id v11 = v9;
  id v17 = v11;
  id v18 = &v21;
  objc_msgSend_enumeratePropertyDataWithBlock_(a1, v12, (uint64_t)v15, v13);
  LOBYTE(a1) = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return (char)a1;
}

+ (id)copyOfEntry:(id)a3
{
  id v4 = a3;
  id v8 = objc_alloc_init((Class)objc_msgSend_entryClass(a1, v5, v6, v7));
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_18B01C720;
  v13[3] = &unk_1E54606D8;
  id v14 = v4;
  id v15 = a1;
  id v9 = v4;
  objc_msgSend_enumeratePropertyDataWithBlock_(a1, v10, (uint64_t)v13, v11);

  return v8;
}

+ (id)descriptionOfProperties:(id)a3 from:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v6;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v31, (uint64_t)v35, 16);
  if (v10)
  {
    uint64_t v13 = v10;
    char v14 = 1;
    uint64_t v15 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        if ((v14 & 1) == 0) {
          objc_msgSend_appendString_(v8, v11, @", ", v12);
        }
        id v18 = objc_msgSend_propertyInfo_(a1, v11, v17, v12);
        char v22 = objc_msgSend_unsignedIntValue(v18, v19, v20, v21);
        objc_msgSend_valueForProperty_propertyInfo_inObject_allowFetchingUnsetPropertySentinel_(a1, v23, v17, (uint64_t)v18, v7, 1);
        char v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v27 = v24;
        if (v24 == (__CFString *)qword_1E912A320)
        {

          v27 = @"<unfetched>";
        }
        if (v22 == 8)
        {
          uint64_t v28 = objc_msgSend_stringWithFormat_(NSString, v25, @"{ %@ }", v26, v27);

          v27 = (__CFString *)v28;
        }
        objc_msgSend_appendFormat_(v8, v25, @"%@ = %@", v26, v17, v27);

        char v14 = 0;
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v31, (uint64_t)v35, 16);
      char v14 = 0;
    }
    while (v13);
  }

  return v8;
}

+ (id)descriptionOfEntry:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  uint64_t v10 = objc_msgSend_initWithFormat_(v5, v8, @"%@(%p): ", v9, v7, v4);

  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = sub_18AF13AC4;
  v36[4] = sub_18AF13830;
  v37 = &stru_1ED7F5C98;
  uint64_t v30 = 0;
  long long v31 = &v30;
  uint64_t v32 = 0x3032000000;
  long long v33 = sub_18AF13AC4;
  long long v34 = sub_18AF13830;
  id v35 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_18B01CBFC;
  v24[3] = &unk_1E5460700;
  id v29 = a1;
  id v11 = v4;
  id v25 = v11;
  v27 = &v30;
  id v12 = v10;
  id v26 = v12;
  uint64_t v28 = v36;
  objc_msgSend_enumeratePropertyDataWithBlock_(a1, v13, (uint64_t)v24, v14);
  uint64_t v17 = (void *)v31[5];
  if (v17)
  {
    id v18 = objc_msgSend_componentsJoinedByString_(v17, v15, @", ", v16);
    objc_msgSend_appendFormat_(v12, v19, @" (unfetched: %@)", v20, v18);
  }
  uint64_t v21 = v26;
  id v22 = v12;

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(v36, 8);

  return v22;
}

+ (BOOL)useNSCoding
{
  uint64_t v4 = objc_msgSend_entryClass(a1, a2, v2, v3);

  return MEMORY[0x1F4181798](v4, sel_instancesRespondToSelector_, sel_initWithCoder_, v5);
}

- (CKSQLiteTable)init
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  id v7 = (CKSQLiteTable *)objc_msgSend_initWithLogicalTableName_(self, v5, (uint64_t)v4, v6);

  return v7;
}

- (CKSQLiteTable)initWithLogicalTableName:(id)a3
{
  id v5 = a3;
  v47.receiver = self;
  v47.super_class = (Class)CKSQLiteTable;
  uint64_t v6 = [(CKSQLiteTable *)&v47 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_logicalTableName, a3);
    do
    {
      unint64_t flags = v7->_flags;
      unint64_t v9 = flags;
      atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)&v7->_flags, &v9, flags | 1, memory_order_relaxed, memory_order_relaxed);
    }
    while (v9 != flags);
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x3032000000;
    v44 = sub_18AF13AC4;
    v45 = sub_18AF13830;
    id v46 = 0;
    uint64_t v10 = objc_opt_class();
    uint64_t v35 = MEMORY[0x1E4F143A8];
    uint64_t v36 = 3221225472;
    v37 = sub_18B01CFFC;
    v38 = &unk_1E5460728;
    v40 = &v41;
    id v11 = v7;
    v39 = v11;
    objc_msgSend_enumeratePropertyDataWithBlock_(v10, v12, (uint64_t)&v35, v13);
    if ((unint64_t)objc_msgSend_count((void *)v42[5], v14, v15, v16, v35, v36, v37, v38) >= 2)
    {
      do
      {
        unint64_t v20 = v7->_flags;
        unint64_t v21 = v20;
        atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)&v7->_flags, &v21, v20 & 0xFFFFFFFFFFFFFFFELL, memory_order_relaxed, memory_order_relaxed);
      }
      while (v21 != v20);
      primaryKeyProperty = v11->_primaryKeyProperty;
      v11->_primaryKeyProperty = 0;

      primaryKeyPropertyInfo = v11->_primaryKeyPropertyInfo;
      v11->_primaryKeyPropertyInfo = 0;
    }
    uint64_t v24 = objc_msgSend_copy((void *)v42[5], v17, v18, v19);
    primaryKeyProperties = v11->_primaryKeyProperties;
    v11->_primaryKeyProperties = (NSArray *)v24;

    id v26 = objc_opt_class();
    if (objc_msgSend_useNSCoding(v26, v27, v28, v29))
    {
      do
      {
        unint64_t v30 = v7->_flags;
        unint64_t v31 = v30;
        atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)&v7->_flags, &v31, v30 | 8, memory_order_relaxed, memory_order_relaxed);
      }
      while (v31 != v30);
    }
    else
    {
      do
      {
        unint64_t v32 = v7->_flags;
        unint64_t v33 = v32;
        atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)&v7->_flags, &v33, v32 & 0xFFFFFFFFFFFFFFF7, memory_order_relaxed, memory_order_relaxed);
      }
      while (v33 != v32);
    }

    _Block_object_dispose(&v41, 8);
  }

  return v7;
}

- (void)dealloc
{
  id v3 = (id)qword_1E912A328;
  objc_sync_enter(v3);
  objc_msgSend_removeAllObjects((void *)qword_1E912A328, v4, v5, v6);
  objc_sync_exit(v3);

  v7.receiver = self;
  v7.super_class = (Class)CKSQLiteTable;
  [(CKSQLiteTable *)&v7 dealloc];
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  logicalTableName = self->_logicalTableName;
  uint64_t v10 = objc_msgSend_tableGroup(self, v7, v8, v9);
  uint64_t v14 = objc_msgSend_name(v10, v11, v12, v13);
  uint64_t v17 = objc_msgSend_stringWithFormat_(v3, v15, @"%@(%p) named %@ in group %@, dbTable: %@", v16, v5, self, logicalTableName, v14, self->_dbTableName);

  return v17;
}

- (id)didCreateDatabaseTable
{
  return 0;
}

- (id)wakeFromDatabase
{
  return 0;
}

- (id)finishInitializing
{
  return 0;
}

+ (id)nonKeyProperties
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v5 = objc_opt_class();
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_18B01D488;
  v22[3] = &unk_1E54605A8;
  id v23 = v4;
  id v6 = v4;
  objc_msgSend_enumeratePropertyDataWithBlock_(v5, v7, (uint64_t)v22, v8);
  uint64_t v12 = objc_msgSend_copy(v6, v9, v10, v11);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_18B01D4E8;
  v20[3] = &unk_1E5460750;
  id v13 = v12;
  id v21 = v13;
  uint64_t v14 = _Block_copy(v20);
  Class = object_getClass(a1);
  uint64_t v16 = _Block_copy(v14);
  uint64_t v17 = imp_implementationWithBlock(v16);
  class_addMethod(Class, a2, v17, 0);

  id v18 = v13;
  return v18;
}

- (void)setTableGroup:(id)a3
{
  p_tableGroup = &self->_tableGroup;
  id v5 = a3;
  objc_storeWeak((id *)p_tableGroup, v5);
  objc_msgSend_db(v5, v6, v7, v8);
  uint64_t v9 = (CKSQLiteDatabase *)objc_claimAutoreleasedReturnValue();

  db = self->_db;
  self->_db = v9;

  id v14 = (id)objc_msgSend_setupReferencedTableCache(self, v11, v12, v13);
}

- (id)db
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableGroup);
  if (!WeakRetained)
  {
    uint64_t v10 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v4, v5, v6);
    uint64_t v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v13, (uint64_t)a2, (uint64_t)self, @"CKSQLiteTable.m", 873, @"nil table group in %@", v12);
  }
  uint64_t v8 = objc_msgSend_db(WeakRetained, v4, v5, v6);

  return v8;
}

- (void)serialize:(id)a3
{
  uint64_t v5 = (void (**)(void))a3;
  id v4 = _CKSQLDBSerializerLock((uint64_t)&self->_db->_serializer);
  v5[2]();
  if (v4)
  {
    v4[1].__sig = 0;
    pthread_mutex_unlock(v4);
  }
}

- (id)performTransaction:(id)a3
{
  p_tableGroup = &self->_tableGroup;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_tableGroup);
  uint64_t v8 = objc_msgSend_performTransaction_(WeakRetained, v6, (uint64_t)v4, v7);

  return v8;
}

- (id)performInTransaction:(id)a3
{
  p_tableGroup = &self->_tableGroup;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_tableGroup);
  uint64_t v8 = objc_msgSend_performInTransaction_(WeakRetained, v6, (uint64_t)v4, v7);

  return v8;
}

- (void)addTransactionCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_msgSend_db(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addTransactionCompletionHandler_(v10, v8, (uint64_t)v4, v9);
}

- (void)setDbTableName:(id)a3
{
}

- (id)checkConstraintForProperty:(id)a3
{
  return 0;
}

- (id)createTableSQL
{
  uint64_t v145 = *MEMORY[0x1E4F143B8];
  uint64_t v135 = 0;
  v136 = &v135;
  uint64_t v137 = 0x3032000000;
  v138 = sub_18AF13AC4;
  v139 = sub_18AF13830;
  id v140 = 0;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v99 = self;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v11 = objc_msgSend_dbTableName(self, v8, v9, v10);
  objc_msgSend_appendFormat_(v4, v12, @"CREATE TABLE '%@' ("), v13, v11;

  uint64_t v131 = 0;
  v132 = &v131;
  uint64_t v133 = 0x2020000000;
  char v134 = 1;
  id v14 = objc_opt_class();
  v121[0] = MEMORY[0x1E4F143A8];
  v121[1] = 3221225472;
  v121[2] = sub_18B01E0D8;
  v121[3] = &unk_1E5460798;
  v128 = &v131;
  id v15 = v4;
  id v122 = v15;
  v123 = self;
  id obj = v5;
  id v124 = obj;
  id v127 = &unk_1ED7EEE98;
  id v96 = v6;
  id v125 = v96;
  uint64_t v130 = 0xFC00000003F0000;
  id v95 = v7;
  id v126 = v95;
  v129 = &v135;
  objc_msgSend_enumeratePropertyDataWithBlock_(v14, v16, (uint64_t)v121, v17);
  if (*((unsigned char *)v132 + 24))
  {
    v91 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v18, v19, v20);
    v92 = (objc_class *)objc_opt_class();
    v93 = NSStringFromClass(v92);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v91, v94, (uint64_t)a2, (uint64_t)self, @"CKSQLiteTable.m", 975, @"Table class %@ defines no properties", v93);
  }
  if (objc_msgSend_count(self->_primaryKeyProperties, v18, v19, v20))
  {
    objc_msgSend_appendString_(v15, v21, @", PRIMARY KEY ("), v22;
    *((unsigned char *)v132 + 24) = 1;
    long long v117 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    id v23 = self->_primaryKeyProperties;
    uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v117, (uint64_t)v144, 16);
    if (v27)
    {
      uint64_t v28 = *(void *)v118;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v118 != v28) {
            objc_enumerationMutation(v23);
          }
          uint64_t v30 = *(void *)(*((void *)&v117 + 1) + 8 * i);
          if (*((unsigned char *)v132 + 24)) {
            *((unsigned char *)v132 + 24) = 0;
          }
          else {
            objc_msgSend_appendString_(v15, v25, @",", v26);
          }
          objc_msgSend_appendString_(v15, v25, v30, v26);
        }
        uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v25, (uint64_t)&v117, (uint64_t)v144, 16);
      }
      while (v27);
    }

    objc_msgSend_appendString_(v15, v31, @""), v32);
  }
  v115[0] = MEMORY[0x1E4F143A8];
  v115[1] = 3221225472;
  v115[2] = sub_18B01E43C;
  v115[3] = &unk_1E54607C0;
  id v33 = v15;
  id v116 = v33;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v96, v34, (uint64_t)v115, v35);
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  id v36 = (id)v136[5];
  uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v37, (uint64_t)&v111, (uint64_t)v143, 16);
  if (v40)
  {
    uint64_t v41 = *(void *)v112;
    do
    {
      for (uint64_t j = 0; j != v40; ++j)
      {
        if (*(void *)v112 != v41) {
          objc_enumerationMutation(v36);
        }
        uint64_t v43 = *(void *)(*((void *)&v111 + 1) + 8 * j);
        v44 = objc_msgSend_tableForReferenceProperty_(v99, v38, v43, v39);
        v48 = objc_msgSend_primaryKeyProperty(v44, v45, v46, v47);
        v52 = objc_msgSend_dbTableName(v44, v49, v50, v51);
        objc_msgSend_appendFormat_(v33, v53, @", FOREIGN KEY(%@) REFERENCES '%@'(%@)", v54, v43, v52, v48);
      }
      uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v38, (uint64_t)&v111, (uint64_t)v143, 16);
    }
    while (v40);
  }

  objc_msgSend_appendString_(v33, v55, @";"), v56);
  v60 = objc_msgSend_dbTableName(v99, v57, v58, v59);
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id obja = obj;
  uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v61, (uint64_t)&v107, (uint64_t)v142, 16);
  if (v64)
  {
    uint64_t v65 = *(void *)v108;
    do
    {
      for (uint64_t k = 0; k != v64; ++k)
      {
        if (*(void *)v108 != v65) {
          objc_enumerationMutation(obja);
        }
        uint64_t v67 = *(void *)(*((void *)&v107 + 1) + 8 * k);
        v68 = objc_msgSend_stringWithFormat_(NSString, v62, @"%@.index_%@", v63, v60, v67);
        objc_msgSend_appendFormat_(v33, v69, @"CREATE INDEX '%@' on '%@' (%@);", v70, v68, v60, v67);
      }
      uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v62, (uint64_t)&v107, (uint64_t)v142, 16);
    }
    while (v64);
  }

  v104[0] = MEMORY[0x1E4F143A8];
  v104[1] = 3221225472;
  v104[2] = sub_18B01E4CC;
  v104[3] = &unk_1E54607E8;
  id v71 = v60;
  id v105 = v71;
  id v72 = v33;
  id v106 = v72;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v95, v73, (uint64_t)v104, v74);
  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id v75 = (id)v136[5];
  uint64_t v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v75, v76, (uint64_t)&v100, (uint64_t)v141, 16);
  if (v79)
  {
    uint64_t v80 = *(void *)v101;
    do
    {
      for (uint64_t m = 0; m != v79; ++m)
      {
        if (*(void *)v101 != v80) {
          objc_enumerationMutation(v75);
        }
        uint64_t v82 = *(void *)(*((void *)&v100 + 1) + 8 * m);
        v83 = objc_msgSend_tableForReferenceProperty_(v99, v77, v82, v78);
        v85 = objc_msgSend_refcountTriggerSQLForProperty_inTable_(v83, v84, v82, (uint64_t)v99);
        objc_msgSend_appendString_(v72, v86, (uint64_t)v85, v87);
      }
      uint64_t v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v75, v77, (uint64_t)&v100, (uint64_t)v141, 16);
    }
    while (v79);
  }

  v88 = v106;
  id v89 = v72;

  _Block_object_dispose(&v131, 8);
  _Block_object_dispose(&v135, 8);

  return v89;
}

- (id)extraGroupTables:(id)a3
{
  return (id)objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, (uint64_t)a3, v3);
}

+ (id)valueForProperty:(id)a3 propertyInfo:(id)a4 inObject:(id)a5 allowFetchingUnsetPropertySentinel:(BOOL)a6
{
  return sub_18B01E5C4(a3, a5, a4, a6);
}

+ (id)valueForProperty:(id)a3 propertyInfo:(id)a4 inObject:(id)a5
{
  return sub_18B01E5C4(a3, a5, a4, 0);
}

- (id)valueForProperty:(id)a3 propertyInfo:(id)a4 inObject:(id)a5
{
  return sub_18B01E5C4(a3, a5, a4, 0);
}

+ (void)setValue:(id)a3 forProperty:(id)a4 propertyInfo:(id)a5 inObject:(id)a6
{
}

- (void)setValue:(id)a3 forProperty:(id)a4 propertyInfo:(id)a5 inObject:(id)a6
{
}

- (id)primaryKeyValuesInEntry:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v9 = objc_msgSend_primaryKeyProperties(self, v6, v7, v8);
  id v21 = 0;
  uint64_t v11 = objc_msgSend__valueDictionaryForProperties_inObject_nilPropertyError_selForNilPropertyError_(self, v10, (uint64_t)v9, (uint64_t)v5, &v21, a2);
  id v12 = v21;

  if (v12)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v14 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v12;
      _os_log_error_impl(&dword_18AF10000, v14, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    uint64_t v17 = objc_msgSend_stringWithFormat_(NSString, v15, @"%@", v16, v12);
    objc_msgSend_UTF8String(v17, v18, v19, v20);
    _os_crash();
    __break(1u);
  }

  return v11;
}

- (id)predicateForMatchingPrimaryKeys
{
  id v5 = objc_msgSend_primaryKeyProperties(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend__predicateForMatchingProperties_(self, v6, (uint64_t)v5, v7);

  return v8;
}

- (id)requestCallbackWithDate:(id)a3 coalescingInterval:(double)a4 minimumSeparation:(double)a5
{
  id v8 = a3;
  id v12 = objc_msgSend_tableGroup(self, v9, v10, v11);
  id v14 = objc_msgSend_requestCallbackForTarget_withDate_coalescingInterval_minimumSeparation_(v12, v13, (uint64_t)self, (uint64_t)v8, a4, a5);

  return v14;
}

- (id)setupReferencedTableCache
{
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = sub_18AF13AC4;
  id v25 = sub_18AF13830;
  id v26 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_18AF13AC4;
  uint64_t v19 = sub_18AF13830;
  id v20 = 0;
  uint64_t v3 = objc_opt_class();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_18B01F2F8;
  v14[3] = &unk_1E5460838;
  v14[4] = self;
  v14[5] = &v21;
  v14[6] = &v15;
  objc_msgSend_enumeratePropertyDataWithBlock_(v3, v4, (uint64_t)v14, v5);
  if (v22[5])
  {
    referencedGroups = self->_referencedGroups;
    self->_referencedGroups = 0;

    referencedTablesByProperty = self->_referencedTablesByProperty;
    self->_referencedTablesByProperty = 0;
  }
  else
  {
    uint64_t v11 = (NSDictionary *)objc_msgSend_copy((void *)v16[5], v6, v7, v8);
    referencedTablesByProperty = self->_referencedTablesByProperty;
    self->_referencedTablesByProperty = v11;
  }

  id v12 = (id)v22[5];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);

  return v12;
}

- (id)tableForReferenceProperty:(id)a3 block:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (ck_log_initialization_predicate != -1) {
    goto LABEL_5;
  }
  while (1)
  {
    uint64_t v7 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v14 = 0;
      _os_log_error_impl(&dword_18AF10000, v7, OS_LOG_TYPE_ERROR, "Subclasses must implement", v14, 2u);
    }
    uint64_t v10 = objc_msgSend_stringWithFormat_(NSString, v8, @"Subclasses must implement", v9);
    objc_msgSend_UTF8String(v10, v11, v12, v13);
    _os_crash();
    __break(1u);
LABEL_5:
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
}

- (id)tableForReferenceProperty:(id)a3
{
  return (id)objc_msgSend_objectForKey_(self->_referencedTablesByProperty, a2, (uint64_t)a3, v3);
}

- (id)referenceProperties
{
  return (id)objc_msgSend_allKeys(self->_referencedTablesByProperty, a2, v2, v3);
}

- (BOOL)migrateEntryDataFromTable:(id)a3 entry:(id)a4 toEntry:(id)a5 addedProperties:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = objc_opt_class();
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_18B01F68C;
  v19[3] = &unk_1E5460860;
  id v20 = v9;
  id v21 = v10;
  uint64_t v22 = self;
  id v23 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  objc_msgSend_enumeratePropertyDataWithBlock_(v12, v16, (uint64_t)v19, v17);

  return 1;
}

- (BOOL)migrateDataFromTable:(id)a3 error:(id *)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v9 = objc_opt_class();
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = sub_18B01FA54;
  v47[3] = &unk_1E5460888;
  id v10 = v6;
  id v48 = v10;
  id v11 = v7;
  id v49 = v11;
  id v12 = v8;
  id v50 = v12;
  objc_msgSend_enumeratePropertyDataWithBlock_(v9, v13, (uint64_t)v47, v14);
  id v46 = 0;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = sub_18B01FAD4;
  v44[3] = &unk_1E54608B0;
  id v15 = v11;
  id v45 = v15;
  uint64_t v17 = objc_msgSend_entriesWithValues_label_error_setupBlock_(v10, v16, 0, 0, &v46, v44);
  id v18 = v46;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v17;
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v40, (uint64_t)v51, 16);
  if (!v20)
  {
LABEL_14:

    if (a4 && v18)
    {
      id v18 = v18;
      *a4 = v18;
    }
    goto LABEL_17;
  }
  uint64_t v21 = v20;
  v37 = a4;
  id v38 = v15;
  uint64_t v22 = *(void *)v41;
  while (2)
  {
    for (uint64_t i = 0; i != v21; ++i)
    {
      if (*(void *)v41 != v22) {
        objc_enumerationMutation(obj);
      }
      uint64_t v24 = *(void *)(*((void *)&v40 + 1) + 8 * i);
      id v25 = (void *)MEMORY[0x18C12ADA0]();
      id v26 = objc_opt_class();
      id v30 = objc_alloc_init((Class)objc_msgSend_entryClass(v26, v27, v28, v29));
      if ((objc_msgSend_migrateEntryDataFromTable_entry_toEntry_addedProperties_(self, v31, (uint64_t)v10, v24, v30, v12) & 1) == 0)
      {

LABEL_13:
        a4 = v37;
        id v15 = v38;
        goto LABEL_14;
      }
      uint64_t v34 = objc_msgSend_insertObject_(self, v32, (uint64_t)v30, v33);

      if (v34)
      {
        id v18 = (id)v34;
        goto LABEL_13;
      }
      id v18 = 0;
    }
    uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v35, (uint64_t)&v40, (uint64_t)v51, 16);
    id v18 = 0;
    if (v21) {
      continue;
    }
    break;
  }

  id v18 = 0;
  id v15 = v38;
LABEL_17:

  return v18 == 0;
}

- (BOOL)isIntegerPrimaryKeyTable
{
  return self->_flags & 1;
}

- (BOOL)databaseTableWasCreated
{
  return (self->_flags >> 1) & 1;
}

- (BOOL)logOperations
{
  return (self->_flags >> 2) & 1;
}

- (void)setLogOperations:(BOOL)a3
{
  if (a3)
  {
    do
    {
      unint64_t flags = self->_flags;
      unint64_t v4 = flags;
      atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)&self->_flags, &v4, flags | 4, memory_order_relaxed, memory_order_relaxed);
    }
    while (v4 != flags);
  }
  else
  {
    do
    {
      unint64_t v5 = self->_flags;
      unint64_t v6 = v5;
      atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)&self->_flags, &v6, v5 & 0xFFFFFFFFFFFFFFFBLL, memory_order_relaxed, memory_order_relaxed);
    }
    while (v6 != v5);
  }
}

- (id)compiledStatementWithLabel:(id *)a3 creationBlock:(id)a4
{
  unint64_t v6 = (void (**)(void))a4;
  id v7 = v6;
  if (a3)
  {
    id v8 = [CKSQLiteCompiledStatementCacheKey alloc];
    id v10 = objc_msgSend_initWithTable_label_(v8, v9, (uint64_t)self, (uint64_t)a3);
    id v11 = (id)qword_1E912A328;
    objc_sync_enter(v11);
    uint64_t v16 = objc_msgSend_objectForKey_((void *)qword_1E912A328, v12, (uint64_t)v10, v13);
    if (v16)
    {
      objc_msgSend_removeObjectForKey_((void *)qword_1E912A328, v14, (uint64_t)v10, v15);
      objc_sync_exit(v11);
    }
    else
    {
      objc_sync_exit(v11);

      uint64_t v16 = v7[2](v7);
      objc_msgSend_setLabel_(v16, v17, (uint64_t)v10, v18);
    }
  }
  else
  {
    uint64_t v16 = v6[2](v6);
  }

  return v16;
}

- (void)cacheStatement:(id)a3
{
  id v18 = a3;
  id v3 = (id)qword_1E912A328;
  objc_sync_enter(v3);
  if (qword_1E912A328)
  {
    if ((unint64_t)objc_msgSend_count((void *)qword_1E912A328, v4, v5, v6) >= 0x20) {
      objc_msgSend_removeAllObjects((void *)qword_1E912A328, v7, v8, v9);
    }
  }
  else
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1CA60]);
    uint64_t v13 = objc_msgSend_initWithCapacity_(v10, v11, 32, v12);
    uint64_t v14 = (void *)qword_1E912A328;
    qword_1E912A328 = v13;
  }
  uint64_t v15 = (void *)qword_1E912A328;
  uint64_t v16 = objc_msgSend_label(v18, v7, v8, v9);
  objc_msgSend_setObject_forKey_(v15, v17, (uint64_t)v18, (uint64_t)v16);

  objc_sync_exit(v3);
}

- (id)_predicateForMatchingProperties:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (objc_msgSend_count(v3, v4, v5, v6) == 1)
  {
    uint64_t v9 = objc_msgSend_objectAtIndex_(v3, v7, 0, v8);
    uint64_t v12 = objc_msgSend_stringWithFormat_(NSString, v10, @"%@=$%@", v11, v9, v9);
    uint64_t v15 = objc_msgSend_predicateWithFormat_(MEMORY[0x1E4F28F60], v13, (uint64_t)v12, v14);
  }
  else
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v34 = v3;
    id v17 = v3;
    uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v35, (uint64_t)v39, 16);
    if (v19)
    {
      uint64_t v22 = v19;
      uint64_t v23 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v36 != v23) {
            objc_enumerationMutation(v17);
          }
          id v25 = objc_msgSend_stringWithFormat_(NSString, v20, @"%@=$%@", v21, *(void *)(*((void *)&v35 + 1) + 8 * i), *(void *)(*((void *)&v35 + 1) + 8 * i));
          uint64_t v28 = objc_msgSend_predicateWithFormat_(MEMORY[0x1E4F28F60], v26, (uint64_t)v25, v27);
          objc_msgSend_addObject_(v16, v29, (uint64_t)v28, v30);
        }
        uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v35, (uint64_t)v39, 16);
      }
      while (v22);
    }

    uint64_t v15 = objc_msgSend_andPredicateWithSubpredicates_(MEMORY[0x1E4F28BA0], v31, (uint64_t)v16, v32);

    id v3 = v34;
  }

  return v15;
}

- (id)_valueDictionaryForProperties:(id)a3 inObject:(id)a4 nilPropertyError:(id *)a5 selForNilPropertyError:(SEL)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v12 = objc_opt_class();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v9;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v39, (uint64_t)v43, 16);
  if (v14)
  {
    uint64_t v17 = v14;
    aSelector = a6;
    uint64_t v18 = *(void *)v40;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v40 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v21 = objc_msgSend_propertyInfo_(v12, v15, v20, v16);
        id v26 = objc_msgSend_valueForProperty_propertyInfo_inObject_(self, v22, v20, (uint64_t)v21, v10);
        if (!v26)
        {
          if (a5)
          {
            uint64_t v27 = NSStringFromSelector(aSelector);
            unint64_t v31 = objc_msgSend_logicalTableName(self, v28, v29, v30);
            uint64_t v33 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v32, @"CKInternalErrorDomain", 1, @"%@ requires a value for primary key %@ in table %@", v27, v20, v31);

            id v34 = v33;
            *a5 = v34;

            id v11 = 0;
            goto LABEL_13;
          }
          id v26 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v23, v24, v25);
        }
        objc_msgSend_setObject_forKey_(v11, v23, (uint64_t)v26, v20);
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v39, (uint64_t)v43, 16);
      if (v17) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v11;
}

- (void)_addPredicateForMatching:(id)a3 toStatement:(id)a4
{
  id v15 = a3;
  id v9 = a4;
  if (v9 && objc_msgSend_count(v15, v6, v7, v8))
  {
    uint64_t v12 = objc_msgSend__predicateForMatchingProperties_(self, v10, (uint64_t)v15, v11);
    id v14 = (id)objc_msgSend_setSearchPredicate_forProperties_(v9, v13, (uint64_t)v12, (uint64_t)v15);
  }
}

- (id)statementForFetchingProperties:(id)a3 inEntriesMatchingColumns:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v9 = objc_msgSend_statementForFetchingColumns_inTable_(CKSQLiteCompiledStatement, v8, (uint64_t)a3, (uint64_t)self);
  objc_msgSend__addPredicateForMatching_toStatement_(self, v10, (uint64_t)v7, (uint64_t)v9);

  return v9;
}

- (id)_bindProperties:(id)a3 valueObject:(id)a4 inStatement:(id)a5 includePrimaryKeys:(BOOL)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v34 = a4;
  uint64_t v32 = self;
  id v33 = a5;
  uint64_t v11 = objc_opt_class();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v12 = v10;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v35, (uint64_t)v39, 16);
  if (v14)
  {
    uint64_t v17 = v14;
    uint64_t v18 = *(void *)v36;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v36 != v18) {
          objc_enumerationMutation(v12);
        }
        uint64_t v20 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v21 = objc_msgSend_propertyInfo_(v11, v15, v20, v16);
        uint64_t v25 = objc_msgSend_unsignedIntValue(v21, v22, v23, v24);
        uint64_t v27 = v25;
        if (a6 || (v25 & 0x100) == 0)
        {
          uint64_t v28 = objc_msgSend_valueForProperty_propertyInfo_inObject_(v32, v26, v20, (uint64_t)v21, v34);
          uint64_t v30 = objc_msgSend_bindValueColumn_type_value_(v33, v29, v20, v27, v28);

          if (v30)
          {

            goto LABEL_13;
          }
        }
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v35, (uint64_t)v39, 16);
      if (v17) {
        continue;
      }
      break;
    }
  }
  uint64_t v30 = 0;
LABEL_13:

  return v30;
}

- (BOOL)hasEntry:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v10 = objc_msgSend_primaryKeyProperties(self, v7, v8, v9);
  id v12 = objc_msgSend_fetchProperties_inObject_matchingDBProperties_label_(self, v11, 0, (uint64_t)v6, v10, off_1E54608D0);

  if (v12)
  {
    char v15 = objc_msgSend_CKIsNoMatchingRowError_(MEMORY[0x1E4F28C58], v13, (uint64_t)v12, v14);
    if (a4)
    {
      if ((v15 & 1) == 0) {
        *a4 = v12;
      }
    }
  }

  return v12 == 0;
}

- (id)entryWithPrimaryKey:(id)a3 fetchProperties:(id)a4 label:(id *)a5 error:(id *)a6
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  if (objc_msgSend_count(self->_primaryKeyProperties, v13, v14, v15) != 1)
  {
    uint64_t v21 = NSStringFromSelector(a2);
    uint64_t v25 = objc_msgSend_logicalTableName(self, v22, v23, v24);
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v26, @"CKInternalErrorDomain", 1, @"%@ requires a single primary key property (table %@)", v21, v25);
    id v20 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v19 = 0;
    if (!v20) {
      goto LABEL_11;
    }
LABEL_5:
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v27 = (void *)ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = v27;
      id v33 = objc_msgSend_logicalTableName(self, v30, v31, v32);
      id v34 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543874;
      long long v39 = v33;
      __int16 v40 = 2114;
      long long v41 = v34;
      __int16 v42 = 2114;
      id v43 = v20;
      _os_log_error_impl(&dword_18AF10000, v29, OS_LOG_TYPE_ERROR, "Table %{public}@ failed in %{public}@ - error: %{public}@", buf, 0x20u);

      if (!a6) {
        goto LABEL_10;
      }
    }
    else if (!a6)
    {
LABEL_10:

      uint64_t v19 = 0;
      goto LABEL_11;
    }
    *a6 = v20;
    goto LABEL_10;
  }
  uint64_t v44 = @"PRIMARY_KEY";
  v45[0] = v11;
  uint64_t v17 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v16, (uint64_t)v45, (uint64_t)&v44, 1);
  id v37 = 0;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = sub_18B0207DC;
  v35[3] = &unk_1E54608F0;
  v35[4] = self;
  id v36 = v12;
  uint64_t v19 = objc_msgSend_entryWithValues_label_error_setupBlock_(self, v18, (uint64_t)v17, (uint64_t)a5, &v37, v35);
  id v20 = v37;

  if (v20) {
    goto LABEL_5;
  }
LABEL_11:

  return v19;
}

- (id)entryWithValues:(id)a3 label:(id *)a4 error:(id *)a5 setupBlock:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = sub_18AF13AC4;
  uint64_t v31 = sub_18AF13830;
  id v32 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_18B020A44;
  v21[3] = &unk_1E5460940;
  v21[4] = self;
  id v13 = v11;
  id v22 = v13;
  uint64_t v25 = a4;
  id v14 = v12;
  id v23 = v14;
  uint64_t v24 = &v27;
  SEL v26 = a2;
  uint64_t v17 = objc_msgSend_performInTransaction_(self, v15, (uint64_t)v21, v16);
  uint64_t v18 = v17;
  if (a5 && v17) {
    *a5 = v17;
  }
  id v19 = (id)v28[5];

  _Block_object_dispose(&v27, 8);

  return v19;
}

- (id)_fetchPropertiesUsingStatement:(id)a3 inObject:(id)a4 matchingDBProperties:(id)a5 label:(id *)a6
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v82 = a4;
  id v86 = 0;
  int v13 = objc_msgSend_step_(v10, v11, (uint64_t)&v86, v12);
  id v14 = v86;
  if (v14) {
    int v18 = 0;
  }
  else {
    int v18 = v13;
  }
  if (v18 == 1)
  {
    id v19 = objc_msgSend_strongObjectsPointerArray(MEMORY[0x1E4F28F50], v15, v16, v17);
    v84[0] = MEMORY[0x1E4F143A8];
    v84[1] = 3221225472;
    v84[2] = sub_18B021188;
    v84[3] = &unk_1E54603C8;
    id v20 = v19;
    id v85 = v20;
    objc_msgSend_enumerateResultColumnsWithBlock_(v10, v21, (uint64_t)v84, v22);
    id v83 = 0;
    int v25 = objc_msgSend_step_(v10, v23, (uint64_t)&v83, v24);
    id v26 = v83;
    uint64_t v30 = v26;
    if (v25)
    {
      NSStringFromSelector(a2);
      uint64_t v31 = self;
      v33 = id v32 = a2;
      uint64_t v35 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v34, @"CKInternalErrorDomain", 1051, @"Matched more than one database row in %@", v33);

      a2 = v32;
      self = v31;
      uint64_t v30 = (void *)v35;
    }
    else if (!v26)
    {
      uint64_t v36 = objc_msgSend_count(v20, v27, v28, v29);
      if (v36)
      {
        unint64_t v39 = v36;
        uint64_t v78 = a2;
        uint64_t v80 = a6;
        for (unint64_t i = 0; i < v39; i += 3)
        {
          long long v41 = objc_msgSend_pointerAtIndex_(v20, v37, i, v38);
          uint64_t v44 = objc_msgSend_pointerAtIndex_(v20, v42, i + 1, v43);
          uint64_t v47 = objc_msgSend_pointerAtIndex_(v20, v45, i + 2, v46);
          objc_msgSend_setValue_forProperty_propertyInfo_inObject_(self, v48, (uint64_t)v47, (uint64_t)v41, v44, v82);
        }
        uint64_t v30 = 0;
        a2 = v78;
        a6 = v80;
      }
      else
      {
        uint64_t v30 = 0;
      }
    }
  }
  else
  {
    uint64_t v30 = v14;
    if (v14)
    {
      int v18 = 1;
      goto LABEL_18;
    }
    NSStringFromSelector(a2);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v30 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v49, @"CKInternalErrorDomain", 1050, @"No matching database row in %@", v20);
  }

LABEL_18:
  if (objc_msgSend_logOperations(self, v15, v16, v17))
  {
    uint64_t v79 = a2;
    v53 = objc_msgSend_fetchedColumns(v10, v50, v51, v52);
    v81 = objc_msgSend_componentsJoinedByString_(v53, v54, @", ", v55);
    uint64_t v59 = objc_msgSend_searchBindingsDescription(v10, v56, v57, v58);
    if (((v30 != 0) & ~v18) != 0)
    {
      v62 = @"No matching row";
    }
    else
    {
      v60 = objc_opt_class();
      objc_msgSend_descriptionOfProperties_from_(v60, v61, (uint64_t)v53, (uint64_t)v82);
      v62 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v63 = (void *)ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_INFO))
    {
      uint64_t v64 = v63;
      uint64_t v65 = (objc_class *)objc_opt_class();
      v66 = NSStringFromClass(v65);
      v68 = sub_18B01A394((uint64_t *)a6, v67);
      *(_DWORD *)buf = 138544642;
      v88 = v66;
      __int16 v89 = 2048;
      v90 = self;
      __int16 v91 = 2114;
      v92 = v81;
      __int16 v93 = 2114;
      v94 = v59;
      __int16 v95 = 2114;
      id v96 = v68;
      __int16 v97 = 2114;
      v98 = v62;
      _os_log_impl(&dword_18AF10000, v64, OS_LOG_TYPE_INFO, "%{public}@(%p): FETCH (%{public}@) WHERE %{public}@, label: %{public}@ fetched: %{public}@", buf, 0x3Eu);
    }
    a2 = v79;
  }
  objc_msgSend_resetAndClearBindings(v10, v50, v51, v52);
  char v69 = v18 ^ 1;
  if (!v30) {
    char v69 = 1;
  }
  if ((v69 & 1) == 0)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v70 = (void *)ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      id v72 = v70;
      v76 = objc_msgSend_logicalTableName(self, v73, v74, v75);
      NSStringFromSelector(a2);
      v77 = (CKSQLiteTable *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v88 = v76;
      __int16 v89 = 2114;
      v90 = v77;
      __int16 v91 = 2114;
      v92 = v30;
      _os_log_error_impl(&dword_18AF10000, v72, OS_LOG_TYPE_ERROR, "Table %{public}@ failed in %{public}@ - error: %{public}@", buf, 0x20u);
    }
  }

  return v30;
}

- (id)fetchProperties:(id)a3 inObject:(id)a4 matchingDBProperties:(id)a5 label:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_18B02131C;
  v20[3] = &unk_1E5460990;
  void v20[4] = self;
  id v21 = v11;
  id v23 = v12;
  uint64_t v24 = a6;
  id v22 = v10;
  id v13 = v12;
  id v14 = v10;
  id v15 = v11;
  int v18 = objc_msgSend_performInTransaction_(self, v16, (uint64_t)v20, v17);

  return v18;
}

- (id)fetchAllProperties:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_18B02159C;
  v10[3] = &unk_1E5460E18;
  void v10[4] = self;
  id v11 = v4;
  id v5 = v4;
  uint64_t v8 = objc_msgSend_performInTransaction_(self, v6, (uint64_t)v10, v7);

  return v8;
}

- (id)updateProperties:(id)a3 usingObject:(id)a4 label:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  id v14 = objc_msgSend_primaryKeyProperties(self, v11, v12, v13);
  id v30 = 0;
  uint64_t v16 = objc_msgSend__valueDictionaryForProperties_inObject_nilPropertyError_selForNilPropertyError_(self, v15, (uint64_t)v14, (uint64_t)v10, &v30, a2);
  id v17 = v30;
  if (!v17)
  {
    int v18 = self;
    id v29 = 0;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_18B0218B8;
    v26[3] = &unk_1E54609F8;
    id v19 = v18;
    uint64_t v27 = v19;
    id v28 = v14;
    uint64_t v21 = objc_msgSend_setProperties_valuesToStore_inEntriesMatching_label_error_predicate_(v19, v20, (uint64_t)v9, (uint64_t)v10, v16, a5, &v29, v26);
    id v17 = v29;
    if (!v17 && !v21)
    {
      id v22 = NSStringFromSelector(a2);
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v23, @"CKInternalErrorDomain", 1050, @"No matching database row in %@", v22);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  id v24 = v17;

  return v24;
}

- (id)updateUsingObject:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v9 = objc_msgSend_nonKeyProperties(v5, v6, v7, v8);
  id v11 = objc_msgSend_updateProperties_usingObject_label_(self, v10, (uint64_t)v9, (uint64_t)v4, off_1E5460A18);

  return v11;
}

- (id)_performInsertOrUpdateStatement:(id)a3 usingObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v43 = 0;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x3032000000;
  uint64_t v46 = sub_18AF13AC4;
  uint64_t v47 = sub_18AF13830;
  id v48 = 0;
  uint64_t v39 = 0;
  __int16 v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  uint64_t v8 = objc_opt_class();
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = sub_18B021B84;
  v34[3] = &unk_1E5460A38;
  id v37 = &v43;
  v34[4] = self;
  id v9 = v7;
  id v35 = v9;
  id v10 = v6;
  id v36 = v10;
  uint64_t v38 = &v39;
  objc_msgSend_enumeratePropertyDataWithBlock_(v8, v11, (uint64_t)v34, v12);
  id v15 = (id *)(v44 + 5);
  if (!v44[5])
  {
    id obj = 0;
    objc_msgSend_step_(v10, v13, (uint64_t)&obj, v14);
    objc_storeStrong(v15, obj);
    if (!v44[5] && *((unsigned char *)v40 + 24) && objc_msgSend_isIntegerPrimaryKeyTable(self, v16, v17, v18))
    {
      id v24 = objc_msgSend_db(self, v21, v22, v23);
      uint64_t InsertRowID = objc_msgSend_lastInsertRowID(v24, v25, v26, v27);

      uint64_t v31 = objc_msgSend_numberWithLongLong_(NSNumber, v29, InsertRowID, v30);
      objc_msgSend_setValue_forProperty_propertyInfo_inObject_(self, v32, (uint64_t)v31, (uint64_t)self->_primaryKeyProperty, self->_primaryKeyPropertyInfo, v9);
    }
  }
  id v19 = (id)v44[5];

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);

  return v19;
}

- (id)insertObject:(id)a3
{
  id v5 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_18B021D40;
  v11[3] = &unk_1E5460AA0;
  v11[4] = self;
  id v12 = v5;
  SEL v13 = a2;
  id v6 = v5;
  id v9 = objc_msgSend_performInTransaction_(self, v7, (uint64_t)v11, v8);

  return v9;
}

- (id)insertObject:(id)a3 orUpdateProperties:(id)a4 label:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_18B022204;
  v17[3] = &unk_1E5460AF0;
  v17[4] = self;
  id v18 = v10;
  id v19 = v9;
  id v20 = a5;
  SEL v21 = a2;
  id v11 = v9;
  id v12 = v10;
  id v15 = objc_msgSend_performInTransaction_(self, v13, (uint64_t)v17, v14);

  return v15;
}

- (id)deleteObject:(id)a3
{
  id v5 = a3;
  id v9 = objc_msgSend_primaryKeyProperties(self, v6, v7, v8);
  id v23 = 0;
  id v11 = objc_msgSend__valueDictionaryForProperties_inObject_nilPropertyError_selForNilPropertyError_(self, v10, (uint64_t)v9, (uint64_t)v5, &v23, a2);

  id v12 = v23;
  if (!v12)
  {
    id v22 = 0;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_18B0227A8;
    v20[3] = &unk_1E54609F8;
    void v20[4] = self;
    id v21 = v9;
    uint64_t v14 = objc_msgSend_deleteEntriesMatching_label_error_predicate_(self, v13, (uint64_t)v11, (uint64_t)off_1E5460B10, &v22, v20);
    id v12 = v22;
    if (!v14)
    {
      id v15 = NSStringFromSelector(a2);
      uint64_t v17 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v16, @"CKInternalErrorDomain", 1050, @"No matching database row in %@", v15);

      id v12 = (id)v17;
    }
  }
  id v18 = v12;

  return v18;
}

- (id)deletePrimaryKeyValue:(id)a3
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (objc_msgSend_count(self->_primaryKeyProperties, v6, v7, v8) != 1)
  {
    id v19 = NSStringFromSelector(a2);
    id v23 = objc_msgSend_logicalTableName(self, v20, v21, v22);
    uint64_t v16 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v24, @"CKInternalErrorDomain", 1, @"%@ cannot be used with a compound primary key (table %@)", v19, v23);

    if (!v16) {
      goto LABEL_12;
    }
    goto LABEL_8;
  }
  char v42 = @"VALUE";
  v43[0] = v5;
  id v10 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v9, (uint64_t)v43, (uint64_t)&v42, 1);
  id v11 = self->_primaryKeyProperty;
  id v35 = 0;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = sub_18B022AA4;
  v33[3] = &unk_1E5460B48;
  id v12 = v11;
  id v34 = v12;
  uint64_t v14 = objc_msgSend_deleteEntriesMatching_label_error_predicate_(self, v13, (uint64_t)v10, (uint64_t)off_1E5460B28, &v35, v33);
  id v15 = v35;
  uint64_t v16 = v15;
  if (!v14 && !v15)
  {
    uint64_t v17 = NSStringFromSelector(a2);
    uint64_t v16 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v18, @"CKInternalErrorDomain", 1050, @"No matching database row in %@", v17);
  }
  if (v16)
  {
LABEL_8:
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    int v25 = (void *)ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = v25;
      uint64_t v31 = objc_msgSend_logicalTableName(self, v28, v29, v30);
      id v32 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543874;
      id v37 = v31;
      __int16 v38 = 2114;
      uint64_t v39 = v32;
      __int16 v40 = 2114;
      uint64_t v41 = v16;
      _os_log_error_impl(&dword_18AF10000, v27, OS_LOG_TYPE_ERROR, "Table %{public}@ failed in %{public}@ - error: %{public}@", buf, 0x20u);
    }
  }
LABEL_12:

  return v16;
}

- (id)newEntryObject
{
  id v4 = objc_opt_class();
  id v11 = objc_alloc_init((Class)objc_msgSend_entryClass(v4, v5, v6, v7));
  if (!v11)
  {
    id v19 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, (uint64_t)self, @"CKSQLiteTable.m", 1680, @"allocation failure");
  }
  id v12 = objc_opt_class();
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_18B022BE8;
  v21[3] = &unk_1E5460B70;
  v21[4] = self;
  id v13 = v11;
  id v22 = v13;
  objc_msgSend_enumeratePropertyDataWithBlock_(v12, v14, (uint64_t)v21, v15);
  uint64_t v16 = v22;
  id v17 = v13;

  return v17;
}

- (int64_t)sizeOfProperty:(id)a3 inEntry:(id)a4 label:(id *)a5 error:(id *)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  uint64_t v16 = objc_msgSend_primaryKeyProperties(self, v13, v14, v15);
  id v34 = 0;
  id v18 = objc_msgSend__valueDictionaryForProperties_inObject_nilPropertyError_selForNilPropertyError_(self, v17, (uint64_t)v16, (uint64_t)v12, &v34, a2);

  id v19 = v34;
  if (v19)
  {
    id v20 = v19;
    int64_t v21 = 0;
  }
  else
  {
    id v33 = 0;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = sub_18B022EB4;
    v31[3] = &unk_1E54609F8;
    v31[4] = self;
    id v32 = v16;
    int64_t v21 = objc_msgSend_sizeOfProperty_inEntriesMatching_label_error_predicate_(self, v22, (uint64_t)v11, (uint64_t)v18, a5, &v33, v31);
    id v20 = v33;

    if (!v20) {
      goto LABEL_10;
    }
  }
  if (a6) {
    *a6 = v20;
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  id v23 = (void *)ck_log_facility_sql;
  if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
  {
    int v25 = v23;
    uint64_t v29 = objc_msgSend_logicalTableName(self, v26, v27, v28);
    uint64_t v30 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543874;
    id v36 = v29;
    __int16 v37 = 2114;
    __int16 v38 = v30;
    __int16 v39 = 2114;
    id v40 = v20;
    _os_log_error_impl(&dword_18AF10000, v25, OS_LOG_TYPE_ERROR, "Table %{public}@ failed in %{public}@ - error: %{public}@", buf, 0x20u);
  }
LABEL_10:

  return v21;
}

- (id)minimumValueOfProperty:(id)a3 label:(id *)a4 error:(id *)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = sub_18AF13AC4;
  id v36 = sub_18AF13830;
  id v37 = 0;
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  uint64_t v26 = sub_18B02313C;
  uint64_t v27 = &unk_1E5460BC0;
  uint64_t v28 = self;
  uint64_t v31 = a4;
  id v10 = v9;
  id v29 = v10;
  uint64_t v30 = &v32;
  id v13 = objc_msgSend_performInTransaction_(self, v11, (uint64_t)&v24, v12);
  uint64_t v14 = v13;
  if (v13)
  {
    if (a5) {
      *a5 = v13;
    }
    uint64_t v15 = (void *)v33[5];
    v33[5] = 0;

    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v16 = (id)ck_log_facility_sql;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_logicalTableName(self, v17, v18, v19, v24, v25, v26, v27, v28);
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      id v23 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543874;
      id v39 = v22;
      __int16 v40 = 2114;
      uint64_t v41 = v23;
      __int16 v42 = 2114;
      uint64_t v43 = v14;
      _os_log_error_impl(&dword_18AF10000, v16, OS_LOG_TYPE_ERROR, "Table %{public}@ failed in %{public}@ - error: %{public}@", buf, 0x20u);
    }
  }
  id v20 = (id)v33[5];

  _Block_object_dispose(&v32, 8);

  return v20;
}

- (id)maximumValueOfProperty:(id)a3 label:(id *)a4 error:(id *)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = sub_18AF13AC4;
  id v36 = sub_18AF13830;
  id v37 = 0;
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  uint64_t v26 = sub_18B023640;
  uint64_t v27 = &unk_1E5460BC0;
  uint64_t v28 = self;
  uint64_t v31 = a4;
  id v10 = v9;
  id v29 = v10;
  uint64_t v30 = &v32;
  id v13 = objc_msgSend_performInTransaction_(self, v11, (uint64_t)&v24, v12);
  uint64_t v14 = v13;
  if (v13)
  {
    if (a5) {
      *a5 = v13;
    }
    uint64_t v15 = (void *)v33[5];
    v33[5] = 0;

    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v16 = (id)ck_log_facility_sql;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_logicalTableName(self, v17, v18, v19, v24, v25, v26, v27, v28);
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      id v23 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543874;
      id v39 = v22;
      __int16 v40 = 2114;
      uint64_t v41 = v23;
      __int16 v42 = 2114;
      uint64_t v43 = v14;
      _os_log_error_impl(&dword_18AF10000, v16, OS_LOG_TYPE_ERROR, "Table %{public}@ failed in %{public}@ - error: %{public}@", buf, 0x20u);
    }
  }
  id v20 = (id)v33[5];

  _Block_object_dispose(&v32, 8);

  return v20;
}

- (id)_statementForFetchingEntriesMatchingObject:(id)a3 label:(id *)a4 error:(id *)a5 setupBlock:(id)a6
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  uint64_t v39 = 0;
  __int16 v40 = &v39;
  uint64_t v41 = 0x3032000000;
  __int16 v42 = sub_18AF13AC4;
  uint64_t v43 = sub_18AF13830;
  id v44 = 0;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = sub_18B023BB4;
  v36[3] = &unk_1E5460DC8;
  v36[4] = self;
  id v13 = v12;
  id v37 = v13;
  __int16 v38 = &v39;
  uint64_t v18 = objc_msgSend_compiledStatementWithLabel_creationBlock_(self, v14, (uint64_t)a4, (uint64_t)v36);
  uint64_t v19 = (void *)v40[5];
  if (v19) {
    goto LABEL_5;
  }
  id v20 = objc_msgSend_searchProperties(v18, v15, v16, v17);
  if (objc_msgSend_count(v20, v21, v22, v23))
  {
    uint64_t v25 = objc_msgSend__valueDictionaryForProperties_inObject_nilPropertyError_selForNilPropertyError_(self, v24, (uint64_t)v20, (uint64_t)v11, 0, a2);
    objc_msgSend_setSearchValues_(v18, v26, (uint64_t)v25, v27);
  }
  uint64_t v19 = (void *)v40[5];
  if (v19)
  {
LABEL_5:
    if (a5) {
      *a5 = v19;
    }
    objc_msgSend_resetAndClearBindings(v18, v15, v16, v17);

    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v28 = (id)ck_log_facility_sql;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_logicalTableName(self, v29, v30, v31);
      id v33 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v34 = NSStringFromSelector(a2);
      uint64_t v35 = v40[5];
      *(_DWORD *)buf = 138543874;
      id v46 = v33;
      __int16 v47 = 2114;
      id v48 = v34;
      __int16 v49 = 2114;
      uint64_t v50 = v35;
      _os_log_error_impl(&dword_18AF10000, v28, OS_LOG_TYPE_ERROR, "Table %{public}@ failed in %{public}@ - error: %{public}@", buf, 0x20u);
    }
    uint64_t v18 = 0;
  }

  _Block_object_dispose(&v39, 8);

  return v18;
}

- (id)entriesMatchingObject:(id)a3 label:(id *)a4 error:(id *)a5 setupBlock:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v23 = 0;
  id v9 = objc_msgSend__statementForFetchingEntriesMatchingObject_label_error_setupBlock_(self, a2, (uint64_t)a3, (uint64_t)a4, &v23, a6);
  id v10 = v23;
  id v11 = v10;
  if (v10)
  {
    if (a5) {
      *a5 = v10;
    }
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v12 = (void *)ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = v12;
      int64_t v21 = objc_msgSend_logicalTableName(self, v18, v19, v20);
      uint64_t v22 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543874;
      uint64_t v25 = v21;
      __int16 v26 = 2114;
      uint64_t v27 = v22;
      __int16 v28 = 2114;
      id v29 = v11;
      _os_log_error_impl(&dword_18AF10000, v17, OS_LOG_TYPE_ERROR, "Table %{public}@ failed in %{public}@ - error: %{public}@", buf, 0x20u);
    }
    id v13 = 0;
  }
  else
  {
    uint64_t v14 = [CKSQLiteTableSearchResultEnumerator alloc];
    id v13 = objc_msgSend_initWithTable_statement_(v14, v15, (uint64_t)self, (uint64_t)v9);
  }

  return v13;
}

- (id)_performEnumerationWithBlock:(id)a3 usingEnumerator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_18B023F64;
  v14[3] = &unk_1E5460BE8;
  id v15 = v7;
  id v16 = v6;
  id v8 = v6;
  id v9 = v7;
  id v12 = objc_msgSend_performInTransaction_(self, v10, (uint64_t)v14, v11);

  return v12;
}

- (id)entryEnumerator:(id *)a3
{
  return (id)objc_msgSend_entriesWithValues_label_error_setupBlock_(self, a2, 0, (uint64_t)off_1E5460C08, a3, 0);
}

- (id)enumerateEntriesWithBlock:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_18B02416C;
  v5[3] = &unk_1E5460C28;
  v5[4] = self;
  id v3 = objc_msgSend__performEnumerationWithBlock_usingEnumerator_(self, a2, (uint64_t)a3, (uint64_t)v5);

  return v3;
}

- (id)newEntryObjectFromStatement:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v10 = v6;
  if ((self->_flags & 8) != 0)
  {
    id v28 = 0;
    id v15 = objc_msgSend_propertyDecoder_(v6, v7, (uint64_t)&v28, v9);
    id v16 = v28;
    if (v16)
    {
      uint64_t v17 = v16;

      if (a4) {
        *a4 = v17;
      }

      id v12 = 0;
    }
    else
    {
      uint64_t v18 = objc_opt_class();
      id v22 = objc_alloc((Class)objc_msgSend_entryClass(v18, v19, v20, v21));
      id v12 = (id)objc_msgSend_initWithCoder_(v22, v23, (uint64_t)v15, v24);
    }
  }
  else
  {
    uint64_t v11 = objc_msgSend_newEntryObject(self, v7, v8, v9);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_18B0242A8;
    v26[3] = &unk_1E5460C50;
    void v26[4] = self;
    id v12 = v11;
    id v27 = v12;
    objc_msgSend_enumerateResultColumnsWithBlock_(v10, v13, (uint64_t)v26, v14);
  }
  return v12;
}

- (id)fetchProperties:(id)a3 label:(id *)a4 error:(id *)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  id v28 = sub_18B0244D4;
  id v29 = &unk_1E5460CA0;
  uint64_t v30 = self;
  id v33 = a4;
  id v11 = v9;
  id v31 = v11;
  id v12 = v10;
  id v32 = v12;
  id v15 = objc_msgSend_performInTransaction_(self, v13, (uint64_t)&v26, v14);
  id v16 = v15;
  if (v15)
  {
    if (a5) {
      *a5 = v15;
    }

    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v17 = (void *)ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = v17;
      uint64_t v24 = objc_msgSend_logicalTableName(self, v21, v22, v23, v26, v27, v28, v29, v30, v31);
      uint64_t v25 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543874;
      uint64_t v35 = v24;
      __int16 v36 = 2114;
      id v37 = v25;
      __int16 v38 = 2114;
      uint64_t v39 = v16;
      _os_log_error_impl(&dword_18AF10000, v20, OS_LOG_TYPE_ERROR, "Table %{public}@ failed in %{public}@ - error: %{public}@", buf, 0x20u);
    }
    id v12 = 0;
  }
  id v18 = v12;

  return v18;
}

- (id)fetchAllEntries:(id *)a3
{
  return (id)MEMORY[0x1F4181798](self, sel_fetchProperties_label_error_, 0, off_1E5460CC0);
}

- (BOOL)hasEntries:(id *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_18B024CA4;
  v17[3] = &unk_1E5460CF8;
  v17[4] = self;
  void v17[5] = &v18;
  id v7 = objc_msgSend_performInTransaction_(self, a2, (uint64_t)v17, v3);
  uint64_t v8 = v7;
  if (v7)
  {
    if (a3) {
      *a3 = v7;
    }
    *((unsigned char *)v19 + 24) = 0;
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v9 = (id)ck_log_facility_sql;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_logicalTableName(self, v10, v11, v12);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      id v16 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543874;
      id v23 = v15;
      __int16 v24 = 2114;
      uint64_t v25 = v16;
      __int16 v26 = 2114;
      uint64_t v27 = v8;
      _os_log_error_impl(&dword_18AF10000, v9, OS_LOG_TYPE_ERROR, "Table %{public}@ failed in %{public}@ - error: %{public}@", buf, 0x20u);
    }
  }
  BOOL v13 = *((unsigned char *)v19 + 24) != 0;

  _Block_object_dispose(&v18, 8);
  return v13;
}

- (unint64_t)count:(id *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_18B024FD4;
  v17[3] = &unk_1E5460CF8;
  v17[4] = self;
  void v17[5] = &v18;
  id v7 = objc_msgSend_performInTransaction_(self, a2, (uint64_t)v17, v3);
  uint64_t v8 = v7;
  if (v7)
  {
    if (a3) {
      *a3 = v7;
    }
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v9 = (id)ck_log_facility_sql;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_logicalTableName(self, v10, v11, v12);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      id v16 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543874;
      id v23 = v15;
      __int16 v24 = 2114;
      uint64_t v25 = v16;
      __int16 v26 = 2114;
      uint64_t v27 = v8;
      _os_log_error_impl(&dword_18AF10000, v9, OS_LOG_TYPE_ERROR, "Table %{public}@ failed in %{public}@ - error: %{public}@", buf, 0x20u);
    }
  }
  unint64_t v13 = v19[3];

  _Block_object_dispose(&v18, 8);
  return v13;
}

- (id)addPredicateToStatement:(id)a3 predicate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    id v9 = (*((void (**)(id))v6 + 2))(v6);
    if (v9) {
      objc_msgSend_setSearchPredicate_forProperties_(v5, v8, (uint64_t)v9, 0);
    }
    else {
    id v10 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v8, @"CKInternalErrorDomain", 1, @"predicate block returned nil predicate");
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (unint64_t)setProperties:(id)a3 valuesToStore:(id)a4 inEntriesMatching:(id)a5 label:(id *)a6 error:(id *)a7 predicate:(id)a8
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x2020000000;
  uint64_t v45 = 0;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = sub_18B025630;
  v35[3] = &unk_1E5460D60;
  v35[4] = self;
  uint64_t v41 = a6;
  id v19 = v15;
  id v36 = v19;
  id v20 = v18;
  id v39 = v20;
  id v21 = v17;
  id v37 = v21;
  id v22 = v16;
  id v38 = v22;
  uint64_t v40 = &v42;
  uint64_t v25 = objc_msgSend_performInTransaction_(self, v23, (uint64_t)v35, v24);
  __int16 v26 = v25;
  if (v25)
  {
    if (a7) {
      *a7 = v25;
    }
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v27 = (id)ck_log_facility_sql;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_logicalTableName(self, v28, v29, v30);
      id v33 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v34 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543874;
      id v47 = v33;
      __int16 v48 = 2114;
      __int16 v49 = v34;
      __int16 v50 = 2114;
      uint64_t v51 = v26;
      _os_log_error_impl(&dword_18AF10000, v27, OS_LOG_TYPE_ERROR, "Table %{public}@ failed in %{public}@ - error: %{public}@", buf, 0x20u);
    }
  }
  unint64_t v31 = v43[3];

  _Block_object_dispose(&v42, 8);
  return v31;
}

- (unint64_t)deleteEntriesMatching:(id)a3 label:(id *)a4 error:(id *)a5 predicate:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_18B025CB0;
  v27[3] = &unk_1E5460D88;
  v27[4] = self;
  unint64_t v31 = a4;
  id v13 = v12;
  id v29 = v13;
  id v14 = v11;
  id v28 = v14;
  uint64_t v30 = &v32;
  id v17 = objc_msgSend_performInTransaction_(self, v15, (uint64_t)v27, v16);
  id v18 = v17;
  if (v17)
  {
    if (a5) {
      *a5 = v17;
    }
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v19 = (id)ck_log_facility_sql;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_logicalTableName(self, v20, v21, v22);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v26 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543874;
      id v37 = v25;
      __int16 v38 = 2114;
      id v39 = v26;
      __int16 v40 = 2114;
      uint64_t v41 = v18;
      _os_log_error_impl(&dword_18AF10000, v19, OS_LOG_TYPE_ERROR, "Table %{public}@ failed in %{public}@ - error: %{public}@", buf, 0x20u);
    }
  }
  unint64_t v23 = v33[3];

  _Block_object_dispose(&v32, 8);
  return v23;
}

- (unint64_t)deleteAllEntries:(id *)a3
{
  return objc_msgSend_deleteEntriesMatching_label_error_predicate_(self, a2, 0, (uint64_t)off_1E5460DA8, a3, 0);
}

- (id)entriesWithValues:(id)a3 label:(id *)a4 error:(id *)a5 setupBlock:(id)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  id v36 = sub_18AF13AC4;
  id v37 = sub_18AF13830;
  id v38 = 0;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = sub_18B026318;
  v30[3] = &unk_1E5460DC8;
  id v13 = v12;
  v30[4] = self;
  id v31 = v13;
  uint64_t v32 = &v33;
  id v17 = objc_msgSend_compiledStatementWithLabel_creationBlock_(self, v14, (uint64_t)a4, (uint64_t)v30);
  id v18 = (void *)v34[5];
  if (v18)
  {
    if (a5) {
      *a5 = v18;
    }
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v19 = (id)ck_log_facility_sql;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_logicalTableName(self, v20, v21, v22);
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      id v28 = NSStringFromSelector(a2);
      uint64_t v29 = v34[5];
      *(_DWORD *)buf = 138543874;
      id v40 = v27;
      __int16 v41 = 2114;
      uint64_t v42 = v28;
      __int16 v43 = 2114;
      uint64_t v44 = v29;
      _os_log_error_impl(&dword_18AF10000, v19, OS_LOG_TYPE_ERROR, "Table %{public}@ failed in %{public}@ - error: %{public}@", buf, 0x20u);
    }
    unint64_t v23 = 0;
  }
  else
  {
    objc_msgSend_setSearchValues_(v17, v15, (uint64_t)v11, v16);
    uint64_t v24 = [CKSQLiteTableSearchResultEnumerator alloc];
    unint64_t v23 = objc_msgSend_initWithTable_statement_(v24, v25, (uint64_t)self, (uint64_t)v17);
  }

  _Block_object_dispose(&v33, 8);

  return v23;
}

- (unint64_t)countOfEntriesMatching:(id)a3 label:(id *)a4 error:(id *)a5 predicate:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_18B026714;
  v27[3] = &unk_1E5460D88;
  v27[4] = self;
  id v31 = a4;
  id v13 = v12;
  id v29 = v13;
  id v14 = v11;
  id v28 = v14;
  uint64_t v30 = &v32;
  id v17 = objc_msgSend_performInTransaction_(self, v15, (uint64_t)v27, v16);
  id v18 = v17;
  if (v17)
  {
    if (a5) {
      *a5 = v17;
    }
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v19 = (id)ck_log_facility_sql;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_logicalTableName(self, v20, v21, v22);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v26 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543874;
      id v37 = v25;
      __int16 v38 = 2114;
      id v39 = v26;
      __int16 v40 = 2114;
      __int16 v41 = v18;
      _os_log_error_impl(&dword_18AF10000, v19, OS_LOG_TYPE_ERROR, "Table %{public}@ failed in %{public}@ - error: %{public}@", buf, 0x20u);
    }
  }
  unint64_t v23 = v33[3];

  _Block_object_dispose(&v32, 8);
  return v23;
}

- (int64_t)sumOfProperty:(id)a3 inEntriesMatching:(id)a4 label:(id *)a5 error:(id *)a6 predicate:(id)a7
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v44 = 0;
  uint64_t v31 = MEMORY[0x1E4F143A8];
  uint64_t v32 = 3221225472;
  uint64_t v33 = sub_18B026C40;
  uint64_t v34 = &unk_1E5460DF0;
  uint64_t v35 = self;
  __int16 v40 = a5;
  id v16 = v13;
  id v36 = v16;
  id v17 = v15;
  id v38 = v17;
  id v18 = v14;
  id v37 = v18;
  id v39 = &v41;
  uint64_t v21 = objc_msgSend_performInTransaction_(self, v19, (uint64_t)&v31, v20);
  uint64_t v22 = v21;
  if (v21)
  {
    if (a6) {
      *a6 = v21;
    }
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    unint64_t v23 = (id)ck_log_facility_sql;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_logicalTableName(self, v24, v25, v26, v31, v32, v33, v34, v35, v36);
      id v29 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v30 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543874;
      id v46 = v29;
      __int16 v47 = 2114;
      __int16 v48 = v30;
      __int16 v49 = 2114;
      __int16 v50 = v22;
      _os_log_error_impl(&dword_18AF10000, v23, OS_LOG_TYPE_ERROR, "Table %{public}@ failed in %{public}@ - error: %{public}@", buf, 0x20u);
    }
  }
  int64_t v27 = v42[3];

  _Block_object_dispose(&v41, 8);
  return v27;
}

- (int64_t)sumOfProperty:(id)a3 label:(id *)a4 error:(id *)a5
{
  return MEMORY[0x1F4181798](self, sel_sumOfProperty_inEntriesMatching_label_error_predicate_, a3, 0);
}

- (int64_t)sizeOfProperty:(id)a3 inEntriesMatching:(id)a4 label:(id *)a5 error:(id *)a6 predicate:(id)a7
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  uint64_t v54 = 0;
  uint64_t v55 = &v54;
  uint64_t v56 = 0x2020000000;
  uint64_t v57 = 0;
  uint64_t v44 = MEMORY[0x1E4F143A8];
  uint64_t v45 = 3221225472;
  id v46 = sub_18B0272D4;
  __int16 v47 = &unk_1E5460DF0;
  __int16 v48 = self;
  v53 = a5;
  id v16 = v13;
  id v49 = v16;
  id v17 = v15;
  id v51 = v17;
  id v18 = v14;
  id v50 = v18;
  uint64_t v52 = &v54;
  uint64_t v21 = objc_msgSend_performInTransaction_(self, v19, (uint64_t)&v44, v20);
  uint64_t v22 = v21;
  if (v21)
  {
    if (a6) {
      *a6 = v21;
    }
    v55[3] = 0;
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    unint64_t v23 = (id)ck_log_facility_sql;
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
  int64_t v27 = v55[3];
  if (v27) {
    goto LABEL_9;
  }
  id v29 = objc_opt_class();
  unint64_t v23 = objc_msgSend_propertyInfo_(v29, v30, (uint64_t)v16, v31);
  char v35 = objc_msgSend_unsignedIntValue(v23, v32, v33, v34);
  if (v35 != 3 && (v35 & 0x80) == 0)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v36 = (id)ck_log_facility_ck;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      id v59 = v17;
      __int16 v60 = 2112;
      id v61 = v16;
      _os_log_error_impl(&dword_18AF10000, v36, OS_LOG_TYPE_ERROR, "%@ called with %@ which is not a valid type to be sized.", buf, 0x16u);
    }
    id v18 = (id)NSString;
    NSStringFromSelector(a2);
    a2 = (SEL)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v18, v37, @"%@ called with %@ which is not a valid type to be sized.", v38, a2, v16, v44, v45, v46, v47, v48, v49);
    id v16 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend_UTF8String(v16, v39, v40, v41);
    _os_crash();
    __break(1u);
LABEL_17:
    objc_msgSend_logicalTableName(self, v24, v25, v26);
    id v42 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v43 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543874;
    id v59 = v42;
    __int16 v60 = 2114;
    id v61 = v43;
    __int16 v62 = 2114;
    uint64_t v63 = v22;
    _os_log_error_impl(&dword_18AF10000, v23, OS_LOG_TYPE_ERROR, "Table %{public}@ failed in %{public}@ - error: %{public}@", buf, 0x20u);
  }
LABEL_7:

  int64_t v27 = v55[3];
LABEL_9:

  _Block_object_dispose(&v54, 8);
  return v27;
}

- (int64_t)sizeOfProperty:(id)a3 label:(id *)a4 error:(id *)a5
{
  return objc_msgSend_sizeOfProperty_inEntriesMatching_label_error_predicate_(self, a2, (uint64_t)a3, 0, a4, a5, 0);
}

- (NSString)logicalTableName
{
  return self->_logicalTableName;
}

- (NSString)dbTableName
{
  return self->_dbTableName;
}

- (NSArray)primaryKeyProperties
{
  return self->_primaryKeyProperties;
}

- (NSString)primaryKeyProperty
{
  return self->_primaryKeyProperty;
}

- (NSNumber)primaryKeyPropertyInfo
{
  return self->_primaryKeyPropertyInfo;
}

- (CKSQLiteTableGroup)tableGroup
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableGroup);

  return (CKSQLiteTableGroup *)WeakRetained;
}

- (NSObject)databaseManagerData
{
  return self->_databaseManagerData;
}

- (void)setDatabaseManagerData:(id)a3
{
}

- (id)tocTableEntry
{
  return self->_tocTableEntry;
}

- (void)setTocTableEntry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tocTableEntry, 0);
  objc_storeStrong((id *)&self->_databaseManagerData, 0);
  objc_destroyWeak((id *)&self->_tableGroup);
  objc_storeStrong((id *)&self->_primaryKeyPropertyInfo, 0);
  objc_storeStrong((id *)&self->_primaryKeyProperty, 0);
  objc_storeStrong((id *)&self->_logicalTableName, 0);
  objc_storeStrong((id *)&self->_referencedTablesByProperty, 0);
  objc_storeStrong((id *)&self->_referencedGroups, 0);
  objc_storeStrong((id *)&self->_primaryKeyProperties, 0);
  objc_storeStrong((id *)&self->_db, 0);

  objc_storeStrong((id *)&self->_dbTableName, 0);
}

- (id)numberValueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v10 = objc_msgSend_db(self, v7, v8, v9);
  id v12 = objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v11, (uint64_t)v10, 0);
  id v16 = objc_msgSend_dbTableName(self, v13, v14, v15);
  id v18 = objc_msgSend_numberValueForKey_scope_scopeIdentifier_error_(v12, v17, (uint64_t)v6, 2, v16, a4);

  return v18;
}

- (id)setNumberValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = objc_msgSend_db(self, v8, v9, v10);
  id v13 = objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v12, (uint64_t)v11, v7 != 0);
  id v17 = objc_msgSend_dbTableName(self, v14, v15, v16);
  id v19 = objc_msgSend_setNumberValue_forKey_scope_scopeIdentifier_(v13, v18, (uint64_t)v7, (uint64_t)v6, 2, v17);

  return v19;
}

- (id)stringValueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v10 = objc_msgSend_db(self, v7, v8, v9);
  id v12 = objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v11, (uint64_t)v10, 0);
  uint64_t v16 = objc_msgSend_dbTableName(self, v13, v14, v15);
  id v18 = objc_msgSend_stringValueForKey_scope_scopeIdentifier_error_(v12, v17, (uint64_t)v6, 2, v16, a4);

  return v18;
}

- (id)setStringValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = objc_msgSend_db(self, v8, v9, v10);
  id v13 = objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v12, (uint64_t)v11, v7 != 0);
  id v17 = objc_msgSend_dbTableName(self, v14, v15, v16);
  id v19 = objc_msgSend_setStringValue_forKey_scope_scopeIdentifier_(v13, v18, (uint64_t)v7, (uint64_t)v6, 2, v17);

  return v19;
}

- (id)dataValueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v10 = objc_msgSend_db(self, v7, v8, v9);
  id v12 = objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v11, (uint64_t)v10, 0);
  uint64_t v16 = objc_msgSend_dbTableName(self, v13, v14, v15);
  id v18 = objc_msgSend_dataValueForKey_scope_scopeIdentifier_error_(v12, v17, (uint64_t)v6, 2, v16, a4);

  return v18;
}

- (id)setDataValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = objc_msgSend_db(self, v8, v9, v10);
  id v13 = objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v12, (uint64_t)v11, v7 != 0);
  id v17 = objc_msgSend_dbTableName(self, v14, v15, v16);
  id v19 = objc_msgSend_setDataValue_forKey_scope_scopeIdentifier_(v13, v18, (uint64_t)v7, (uint64_t)v6, 2, v17);

  return v19;
}

- (id)dateValueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v10 = objc_msgSend_db(self, v7, v8, v9);
  id v12 = objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v11, (uint64_t)v10, 0);
  uint64_t v16 = objc_msgSend_dbTableName(self, v13, v14, v15);
  id v18 = objc_msgSend_dateValueForKey_scope_scopeIdentifier_error_(v12, v17, (uint64_t)v6, 2, v16, a4);

  return v18;
}

- (id)setDateValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = objc_msgSend_db(self, v8, v9, v10);
  id v13 = objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v12, (uint64_t)v11, v7 != 0);
  id v17 = objc_msgSend_dbTableName(self, v14, v15, v16);
  id v19 = objc_msgSend_setDateValue_forKey_scope_scopeIdentifier_(v13, v18, (uint64_t)v7, (uint64_t)v6, 2, v17);

  return v19;
}

- (id)UUIDValueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v10 = objc_msgSend_db(self, v7, v8, v9);
  id v12 = objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v11, (uint64_t)v10, 0);
  uint64_t v16 = objc_msgSend_dbTableName(self, v13, v14, v15);
  id v18 = objc_msgSend_UUIDValueForKey_scope_scopeIdentifier_error_(v12, v17, (uint64_t)v6, 2, v16, a4);

  return v18;
}

- (id)setUUIDValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = objc_msgSend_db(self, v8, v9, v10);
  id v13 = objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v12, (uint64_t)v11, v7 != 0);
  id v17 = objc_msgSend_dbTableName(self, v14, v15, v16);
  id v19 = objc_msgSend_setUUIDValue_forKey_scope_scopeIdentifier_(v13, v18, (uint64_t)v7, (uint64_t)v6, 2, v17);

  return v19;
}

- (void)_setupActivityEntry:(id)a3
{
  id v4 = a3;
  objc_msgSend_tableGroup(self, v5, v6, v7);
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = objc_msgSend_groupID(v26, v8, v9, v10);
  objc_msgSend_setGroupID_(v4, v12, (uint64_t)v11, v13);

  id v17 = objc_msgSend_name(v26, v14, v15, v16);
  objc_msgSend_setGroupName_(v4, v18, (uint64_t)v17, v19);

  unint64_t v23 = objc_msgSend_logicalTableName(self, v20, v21, v22);
  objc_msgSend_setTableName_(v4, v24, (uint64_t)v23, v25);
}

@end