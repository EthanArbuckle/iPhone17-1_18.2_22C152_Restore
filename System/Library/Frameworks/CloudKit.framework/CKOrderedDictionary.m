@interface CKOrderedDictionary
+ (CKOrderedDictionary)orderedDictionaryWithCapacity:(unint64_t)a3;
+ (id)orderedDictionary;
- (CKOrderedDictionary)init;
- (CKOrderedDictionary)initWithCapacity:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentationRecursive:(BOOL)a3;
- (unint64_t)count;
- (void)addObject:(id)a3 forKey:(id)a4;
- (void)enumerateKeysAndObjectsUsingBlock:(id)a3;
@end

@implementation CKOrderedDictionary

- (void).cxx_destruct
{
}

- (void)addObject:(id)a3 forKey:(id)a4
{
  tuples = self->tuples;
  id v6 = a4;
  id v7 = a3;
  v8 = [CKTuple2 alloc];
  id v12 = (id)objc_msgSend_initWithObject1_object2_(v8, v9, (uint64_t)v6, (uint64_t)v7);

  objc_msgSend_addObject_(tuples, v10, (uint64_t)v12, v11);
}

- (unint64_t)count
{
  return objc_msgSend_count(self->tuples, a2, v2, v3);
}

+ (id)orderedDictionary
{
  uint64_t v2 = objc_alloc_init(CKOrderedDictionary);

  return v2;
}

- (CKOrderedDictionary)init
{
  v9.receiver = self;
  v9.super_class = (Class)CKOrderedDictionary;
  v5 = [(CKOrderedDictionary *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v2, v3, v4);
    tuples = v5->tuples;
    v5->tuples = (NSMutableArray *)v6;
  }
  return v5;
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void *, void *, unsigned char *))a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v5 = self->tuples;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v21, (uint64_t)v25, 16);
  if (v7)
  {
    uint64_t v11 = v7;
    uint64_t v12 = *(void *)v22;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v22 != v12) {
        objc_enumerationMutation(v5);
      }
      v14 = *(void **)(*((void *)&v21 + 1) + 8 * v13);
      char v20 = 0;
      v15 = objc_msgSend_v1(v14, v8, v9, v10);
      v19 = objc_msgSend_v2(v14, v16, v17, v18);
      v4[2](v4, v15, v19, &v20);

      if (v20) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v21, (uint64_t)v25, 16);
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

+ (CKOrderedDictionary)orderedDictionaryWithCapacity:(unint64_t)a3
{
  uint64_t v4 = [CKOrderedDictionary alloc];
  uint64_t v7 = objc_msgSend_initWithCapacity_(v4, v5, a3, v6);

  return (CKOrderedDictionary *)v7;
}

- (CKOrderedDictionary)initWithCapacity:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CKOrderedDictionary;
  uint64_t v6 = [(CKOrderedDictionary *)&v10 init];
  if (v6)
  {
    uint64_t v7 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v4, a3, v5);
    tuples = v6->tuples;
    v6->tuples = (NSMutableArray *)v7;
  }
  return v6;
}

- (id)description
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_stringWithString_(MEMORY[0x1E4F28E78], a2, @"(\n"), v2;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v5 = self->tuples;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v25, (uint64_t)v29, 16);
  if (v7)
  {
    uint64_t v11 = v7;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v5);
        }
        v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v15 = objc_msgSend_v1(v14, v8, v9, v10);
        v19 = objc_msgSend_v2(v14, v16, v17, v18);
        objc_msgSend_appendFormat_(v4, v20, @"%@=%@;\n", v21, v15, v19, (void)v25);
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v25, (uint64_t)v29, 16);
    }
    while (v11);
  }

  objc_msgSend_appendString_(v4, v22, @""), v23);

  return v4;
}

- (id)dictionaryRepresentationRecursive:(BOOL)a3
{
  BOOL v4 = a3;
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v7 = objc_msgSend_count(self->tuples, a2, a3, v3);
  uint64_t v10 = objc_msgSend_dictionaryWithCapacity_(v6, v8, v7, v9);
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  obj = self->tuples;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v99, (uint64_t)v104, 16);
  if (v12)
  {
    uint64_t v16 = v12;
    uint64_t v17 = *(void *)v100;
    BOOL v90 = v4;
    uint64_t v88 = *(void *)v100;
    v89 = v10;
    do
    {
      uint64_t v18 = 0;
      uint64_t v91 = v16;
      do
      {
        if (*(void *)v100 != v17) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v99 + 1) + 8 * v18);
        if (!v4) {
          goto LABEL_39;
        }
        char v20 = objc_msgSend_v2(*(void **)(*((void *)&v99 + 1) + 8 * v18), v13, v14, v15);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        long long v25 = objc_msgSend_v2(v19, v22, v23, v24);
        v29 = v25;
        if (isKindOfClass)
        {
          uint64_t v30 = objc_msgSend_unorderedDictionary(v25, v26, v27, v28);
          v34 = objc_msgSend_v1(v19, v31, v32, v33);
          objc_msgSend_setObject_forKeyedSubscript_(v10, v35, (uint64_t)v30, (uint64_t)v34);

          goto LABEL_40;
        }
        objc_opt_class();
        char v36 = objc_opt_isKindOfClass();

        v40 = objc_msgSend_v2(v19, v37, v38, v39);
        v29 = v40;
        if (v36)
        {
          if (objc_msgSend_count(v40, v41, v42, v43))
          {
            v92 = v19;
            uint64_t v93 = v18;
            uint64_t v30 = 0;
            unint64_t v46 = 0;
            do
            {
              v47 = objc_msgSend_objectAtIndexedSubscript_(v29, v44, v46, v45);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                if (!v30) {
                  uint64_t v30 = objc_msgSend_mutableCopy(v29, v48, v49, v50);
                }
                v51 = objc_msgSend_dictionaryRepresentationRecursive_(v47, v48, 1, v50);
                objc_msgSend_setObject_atIndexedSubscript_(v30, v52, (uint64_t)v51, v46);
              }
              ++v46;
            }
            while (v46 < objc_msgSend_count(v29, v53, v54, v55));
            if (v30)
            {
              v57 = objc_msgSend_v1(v19, v44, v56, v45);
              objc_msgSend_setObject_forKeyedSubscript_(v10, v58, (uint64_t)v30, (uint64_t)v57);

LABEL_33:
              uint64_t v16 = v91;
              uint64_t v18 = v93;
              goto LABEL_40;
            }
            goto LABEL_36;
          }
          goto LABEL_38;
        }
        objc_opt_class();
        char v59 = objc_opt_isKindOfClass();

        if (v59)
        {
          uint64_t v93 = v18;
          v29 = objc_msgSend_v2(v19, v13, v14, v15);
          long long v95 = 0u;
          long long v96 = 0u;
          long long v97 = 0u;
          long long v98 = 0u;
          v63 = objc_msgSend_allKeys(v29, v60, v61, v62);
          uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v64, (uint64_t)&v95, (uint64_t)v103, 16);
          if (v65)
          {
            uint64_t v68 = v65;
            v92 = v19;
            uint64_t v30 = 0;
            uint64_t v69 = *(void *)v96;
            do
            {
              for (uint64_t i = 0; i != v68; ++i)
              {
                if (*(void *)v96 != v69) {
                  objc_enumerationMutation(v63);
                }
                uint64_t v71 = *(void *)(*((void *)&v95 + 1) + 8 * i);
                v72 = objc_msgSend_objectForKeyedSubscript_(v29, v66, v71, v67);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  if (!v30) {
                    uint64_t v30 = objc_msgSend_mutableCopy(v29, v73, v74, v75);
                  }
                  v76 = objc_msgSend_dictionaryRepresentationRecursive_(v72, v73, 1, v75);
                  objc_msgSend_setObject_forKeyedSubscript_(v30, v77, (uint64_t)v76, v71);
                }
              }
              uint64_t v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v66, (uint64_t)&v95, (uint64_t)v103, 16);
            }
            while (v68);

            if (v30)
            {
              v81 = objc_msgSend_v1(v92, v78, v79, v80);
              uint64_t v10 = v89;
              objc_msgSend_setObject_forKeyedSubscript_(v89, v82, (uint64_t)v30, (uint64_t)v81);

              BOOL v4 = v90;
              uint64_t v17 = v88;
              goto LABEL_33;
            }
            BOOL v4 = v90;
            uint64_t v17 = v88;
            uint64_t v10 = v89;
LABEL_36:
            uint64_t v16 = v91;
            v19 = v92;
          }
          else
          {

            uint64_t v16 = v91;
          }
          uint64_t v18 = v93;
LABEL_38:
        }
LABEL_39:
        v29 = objc_msgSend_v2(v19, v13, v14, v15);
        uint64_t v30 = objc_msgSend_v1(v19, v83, v84, v85);
        objc_msgSend_setObject_forKeyedSubscript_(v10, v86, (uint64_t)v29, (uint64_t)v30);
LABEL_40:

        ++v18;
      }
      while (v18 != v16);
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v99, (uint64_t)v104, 16);
    }
    while (v16);
  }

  return v10;
}

@end