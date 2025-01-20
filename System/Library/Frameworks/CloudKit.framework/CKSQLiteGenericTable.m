@interface CKSQLiteGenericTable
+ (BOOL)useNSCoding;
+ (Class)entryClass;
+ (Class)genericTableClassForTOCTableEntry:(id)a3;
+ (id)genericTableForTOCEntry:(id)a3;
+ (id)uniqueSubclassClassNameForClassName:(id)a3;
+ (id)valueForProperty:(id)a3 propertyInfo:(id)a4 inObject:(id)a5;
+ (void)setValue:(id)a3 forProperty:(id)a4 propertyInfo:(id)a5 inObject:(id)a6;
- (id)valueForProperty:(id)a3 propertyInfo:(id)a4 inObject:(id)a5;
- (void)setValue:(id)a3 forProperty:(id)a4 propertyInfo:(id)a5 inObject:(id)a6;
@end

@implementation CKSQLiteGenericTable

+ (id)uniqueSubclassClassNameForClassName:(id)a3
{
  id v4 = a3;
  v5 = NSString;
  v6 = NSStringFromClass((Class)a1);
  v9 = objc_msgSend_stringWithFormat_(v5, v7, @"%@_%@", v8, v6, v4);

  if (NSClassFromString((NSString *)v9))
  {
    uint64_t v10 = 0;
    do
    {
      v11 = NSString;
      v12 = NSStringFromClass((Class)a1);
      objc_msgSend_stringWithFormat_(v11, v13, @"%@_%@_%u", v14, v12, v4, v10);
      v15 = (NSString *)objc_claimAutoreleasedReturnValue();

      uint64_t v10 = (v10 + 1);
      v9 = v15;
    }
    while (NSClassFromString(v15));
  }
  else
  {
    v15 = (NSString *)v9;
  }

  return v15;
}

+ (Class)genericTableClassForTOCTableEntry:(id)a3
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_class();
  objc_sync_enter(v5);
  v9 = objc_msgSend_propertyData(v4, v6, v7, v8);
  v13 = objc_msgSend_dbVersion(v4, v10, v11, v12);
  v34[0] = @"dbVersion";
  v34[1] = @"propertyData";
  v35[0] = v13;
  v35[1] = v9;
  v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v14, (uint64_t)v35, (uint64_t)v34, 2);
  id v21 = (id)objc_msgSend_objectForKey_(0, v16, (uint64_t)v15, v17);
  if (!v21)
  {
    v22 = objc_msgSend_creatingClass(v4, v18, v19, v20);
    v25 = objc_msgSend_uniqueSubclassClassNameForClassName_(a1, v23, (uint64_t)v22, v24);

    uint64_t v29 = objc_msgSend_unsignedIntegerValue(v13, v26, v27, v28);
    id v21 = (id)objc_msgSend_tableClassWithName_properties_version_entryClass_(a1, v30, (uint64_t)v25, (uint64_t)v9, v29, 0);
    objc_msgSend_setObject_forKey_(0, v31, (uint64_t)v21, (uint64_t)v15);
  }
  objc_sync_exit(v5);

  v32 = (objc_class *)v21;
  return v32;
}

+ (id)genericTableForTOCEntry:(id)a3
{
  id v4 = a3;
  id v7 = objc_alloc((Class)objc_msgSend_genericTableClassForTOCTableEntry_(a1, v5, (uint64_t)v4, v6));
  uint64_t v11 = objc_msgSend_logicalTableName(v4, v8, v9, v10);
  uint64_t v14 = objc_msgSend_initWithLogicalTableName_(v7, v12, (uint64_t)v11, v13);

  v18 = objc_msgSend_dbTableName(v4, v15, v16, v17);

  objc_msgSend_setDbTableName_(v14, v19, (uint64_t)v18, v20);

  return v14;
}

+ (BOOL)useNSCoding
{
  return 0;
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

+ (id)valueForProperty:(id)a3 propertyInfo:(id)a4 inObject:(id)a5
{
  return (id)objc_msgSend_objectForKey_(a5, a2, (uint64_t)a3, (uint64_t)a4);
}

- (id)valueForProperty:(id)a3 propertyInfo:(id)a4 inObject:(id)a5
{
  return (id)objc_msgSend_objectForKey_(a5, a2, (uint64_t)a3, (uint64_t)a4);
}

+ (void)setValue:(id)a3 forProperty:(id)a4 propertyInfo:(id)a5 inObject:(id)a6
{
  if (a3) {
    objc_msgSend_setObject_forKey_(a6, a2, (uint64_t)a3, (uint64_t)a4, a5);
  }
  else {
    objc_msgSend_removeObjectForKey_(a6, a2, (uint64_t)a4, (uint64_t)a4, a5);
  }
}

- (void)setValue:(id)a3 forProperty:(id)a4 propertyInfo:(id)a5 inObject:(id)a6
{
  if (a3) {
    objc_msgSend_setObject_forKey_(a6, a2, (uint64_t)a3, (uint64_t)a4, a5);
  }
  else {
    objc_msgSend_removeObjectForKey_(a6, a2, (uint64_t)a4, (uint64_t)a4, a5);
  }
}

@end