@interface CKObject
- (BOOL)isEqual:(id)a3;
- (CKObjCClass)objcClass;
- (CKObject)initWithPropertyDictionary:(id)a3;
- (NSString)description;
- (id)dictionaryPropertyEncoding;
- (unint64_t)hash;
@end

@implementation CKObject

- (CKObject)initWithPropertyDictionary:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v8 = objc_msgSend_objcClass(self, v5, v6, v7);
  v29.receiver = self;
  v29.super_class = (Class)CKObject;
  v9 = [(CKObject *)&v29 init];
  if (v9)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v10 = v4;
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v25, (uint64_t)v30, 16);
    if (v12)
    {
      uint64_t v15 = v12;
      uint64_t v16 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(v10);
          }
          uint64_t v18 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          v19 = objc_msgSend_objectForKeyedSubscript_(v10, v13, v18, v14, (void)v25);
          uint64_t v22 = objc_msgSend_propertyForName_(v8, v20, v18, v21);
          v23 = (void *)v22;
          if (v22) {
            sub_18B123B08(v22, v19, v9);
          }
        }
        uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v25, (uint64_t)v30, 16);
      }
      while (v15);
    }
  }
  return v9;
}

- (unint64_t)hash
{
  id v4 = objc_msgSend_objcClass(self, a2, v2, v3);
  v8 = objc_msgSend_properties(v4, v5, v6, v7);
  unint64_t v12 = objc_msgSend_hash(v8, v9, v10, v11);

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v8 = objc_msgSend_objcClass(self, v5, v6, v7, 0);
    unint64_t v12 = objc_msgSend_properties(v8, v9, v10, v11);

    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v27, (uint64_t)v31, 16);
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(v12);
          }
          uint64_t v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v19 = sub_18B1239E0(v18, v4);
          v20 = sub_18B1239E0(v18, self);
          int isEqual = objc_msgSend_isEqual_(v19, v21, (uint64_t)v20, v22);

          if (!isEqual)
          {
            BOOL v25 = 0;
            goto LABEL_13;
          }
        }
        uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v24, (uint64_t)&v27, (uint64_t)v31, 16);
        if (v15) {
          continue;
        }
        break;
      }
    }
    BOOL v25 = 1;
LABEL_13:
  }
  else
  {
    BOOL v25 = 0;
  }

  return v25;
}

- (CKObjCClass)objcClass
{
  uint64_t v3 = objc_opt_class();

  return (CKObjCClass *)objc_msgSend_classForHandle_(CKObjCClass, v2, v3, v4);
}

- (id)dictionaryPropertyEncoding
{
  v5 = objc_msgSend_objcClass(self, a2, v2, v3);
  v9 = objc_msgSend_properties(v5, v6, v7, v8);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_18B1AFAD4;
  v14[3] = &unk_1E5466348;
  v14[4] = self;
  unint64_t v12 = objc_msgSend_CKCompactMapToDictionary_(v9, v10, (uint64_t)v14, v11);

  return v12;
}

- (NSString)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v6 = objc_msgSend_initWithString_(v3, v4, @"<", v5);
  ClassName = object_getClassName(self);
  objc_msgSend_appendFormat_(v6, v8, @"%s: ", v9, ClassName);
  v13 = objc_msgSend_objcClass(self, v10, v11, v12);
  v17 = objc_msgSend_properties(v13, v14, v15, v16);

  if (objc_msgSend_count(v17, v18, v19, v20))
  {
    unint64_t v23 = 0;
    do
    {
      v24 = objc_msgSend_objectAtIndexedSubscript_(v17, v21, v23, v22);
      long long v28 = objc_msgSend_name(v24, v25, v26, v27);
      long long v29 = sub_18B1239E0(v24, self);
      objc_msgSend_appendFormat_(v6, v30, @"%@=%@", v31, v28, v29);

      if (v23 != objc_msgSend_count(v17, v32, v33, v34) - 1) {
        objc_msgSend_appendString_(v6, v35, @", ", v36);
      }

      ++v23;
    }
    while (v23 < objc_msgSend_count(v17, v37, v38, v39));
  }
  objc_msgSend_appendString_(v6, v21, @">", v22);

  return (NSString *)v6;
}

@end