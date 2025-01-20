@interface CKFeatureSet
+ (BOOL)supportsSecureCoding;
- (BOOL)hasValue:(id)a3 forName:(id)a4;
- (BOOL)isEqual:(id)a3;
- (CKFeatureSet)initWithCoder:(id)a3;
- (CKFeatureSet)initWithFeatures:(id)a3;
- (NSArray)features;
- (NSMutableDictionary)featureMap;
- (id)description;
- (id)valuesForName:(id)a3;
- (unint64_t)hash;
- (void)addFeatures:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKFeatureSet

- (CKFeatureSet)initWithFeatures:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKFeatureSet;
  v5 = [(CKFeatureSet *)&v11 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    featureMap = v5->_featureMap;
    v5->_featureMap = (NSMutableDictionary *)v6;

    objc_msgSend_addFeatures_(v5, v8, (uint64_t)v4, v9);
  }

  return v5;
}

- (void)addFeatures:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v30, (uint64_t)v34, 16);
  if (v6)
  {
    uint64_t v10 = v6;
    uint64_t v11 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v4);
        }
        v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        featureMap = self->_featureMap;
        v15 = objc_msgSend_name(v13, v7, v8, v9);
        v18 = objc_msgSend_objectForKeyedSubscript_(featureMap, v16, (uint64_t)v15, v17);

        if (!v18) {
          v18 = objc_opt_new();
        }
        v22 = objc_msgSend_value(v13, v19, v20, v21);
        objc_msgSend_setObject_forKeyedSubscript_(v18, v23, (uint64_t)v13, (uint64_t)v22);

        v24 = self->_featureMap;
        v28 = objc_msgSend_name(v13, v25, v26, v27);
        objc_msgSend_setObject_forKeyedSubscript_(v24, v29, (uint64_t)v18, (uint64_t)v28);
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v30, (uint64_t)v34, 16);
    }
    while (v10);
  }
}

- (NSArray)features
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_features)
  {
    v3 = objc_opt_new();
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v7 = objc_msgSend_allValues(v2->_featureMap, v4, v5, v6);
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v41, (uint64_t)v47, 16);
    if (v12)
    {
      uint64_t v13 = *(void *)v42;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v42 != v13) {
            objc_enumerationMutation(v7);
          }
          v15 = *(void **)(*((void *)&v41 + 1) + 8 * v14);
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          v16 = objc_msgSend_allValues(v15, v9, v10, v11, 0);
          uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v37, (uint64_t)v46, 16);
          if (v20)
          {
            uint64_t v21 = *(void *)v38;
            do
            {
              uint64_t v22 = 0;
              do
              {
                if (*(void *)v38 != v21) {
                  objc_enumerationMutation(v16);
                }
                objc_msgSend_addObject_(v3, v18, *(void *)(*((void *)&v37 + 1) + 8 * v22++), v19);
              }
              while (v20 != v22);
              uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v18, (uint64_t)&v37, (uint64_t)v46, 16);
            }
            while (v20);
          }

          ++v14;
        }
        while (v14 != v12);
        uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v9, (uint64_t)&v41, (uint64_t)v47, 16);
      }
      while (v12);
    }

    id v23 = objc_alloc(MEMORY[0x1E4F29008]);
    v25 = objc_msgSend_initWithKey_ascending_(v23, v24, @"name", 1);
    id v26 = objc_alloc(MEMORY[0x1E4F29008]);
    v28 = objc_msgSend_initWithKey_ascending_(v26, v27, @"value", 1);
    v45[0] = v25;
    v45[1] = v28;
    long long v30 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v29, (uint64_t)v45, 2);
    uint64_t v33 = objc_msgSend_sortedArrayUsingDescriptors_(v3, v31, (uint64_t)v30, v32);
    features = v2->_features;
    v2->_features = (NSArray *)v33;
  }
  objc_sync_exit(v2);

  uint64_t v35 = v2->_features;

  return v35;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  id v4 = (void *)MEMORY[0x18C12ADA0]();
  uint64_t v8 = objc_msgSend_features(self, v5, v6, v7);
  uint64_t v9 = NSStringFromSelector(sel_features);
  objc_msgSend_encodeObject_forKey_(v11, v10, (uint64_t)v8, (uint64_t)v9);
}

- (CKFeatureSet)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CKFeatureSet;
  id v5 = [(CKFeatureSet *)&v24 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v14 = objc_msgSend_setWithObjects_(v6, v12, v7, v13, v8, v9, v10, v11, 0);
    v15 = NSStringFromSelector(sel_features);
    uint64_t v17 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v16, (uint64_t)v14, (uint64_t)v15);
    v18 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v17;

    uint64_t v19 = objc_opt_new();
    uint64_t v20 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v19;

    objc_msgSend_addFeatures_(v5, v21, *((void *)v5 + 1), v22);
  }

  return (CKFeatureSet *)v5;
}

- (id)valuesForName:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_featureMap(self, v5, v6, v7);
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)v4, v10);

  v15 = objc_msgSend_allKeys(v11, v12, v13, v14);
  v16 = v15;
  if (!v15) {
    v15 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v17 = v15;

  return v17;
}

- (BOOL)hasValue:(id)a3 forName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v11 = objc_msgSend_featureMap(self, v8, v9, v10);
  uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v11, v12, (uint64_t)v6, v13);

  id v17 = objc_msgSend_valueForKey_(v14, v15, (uint64_t)v7, v16);

  return v17 != 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
  {
    uint64_t v11 = objc_msgSend_features(self, v8, v9, v10);
    v15 = objc_msgSend_features(v4, v12, v13, v14);
    char isEqual = objc_msgSend_isEqual_(v11, v16, (uint64_t)v15, v17);
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  id v4 = objc_msgSend_features(self, a2, v2, v3);
  unint64_t v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

- (id)description
{
  v16.receiver = self;
  v16.super_class = (Class)CKFeatureSet;
  uint64_t v3 = [(CKFeatureSet *)&v16 description];
  uint64_t v7 = objc_msgSend_features(self, v4, v5, v6);
  uint64_t v11 = objc_msgSend_description(v7, v8, v9, v10);
  uint64_t v14 = objc_msgSend_stringByAppendingFormat_(v3, v12, @": %@", v13, v11);

  return v14;
}

- (NSMutableDictionary)featureMap
{
  return self->_featureMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureMap, 0);

  objc_storeStrong((id *)&self->_features, 0);
}

@end