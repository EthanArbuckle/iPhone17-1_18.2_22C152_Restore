@interface CSUSceneNetV5SceneTaxonomyAttributes
- (CSUSceneNetV5SceneTaxonomyAttributes)initWithAttributePaths:(id)a3 error:(id *)a4;
- (id)attributeForKey:(id)a3 label:(id)a4 defaultValue:(id)a5;
@end

@implementation CSUSceneNetV5SceneTaxonomyAttributes

- (CSUSceneNetV5SceneTaxonomyAttributes)initWithAttributePaths:(id)a3 error:(id *)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v46.receiver = self;
  v46.super_class = (Class)CSUSceneNetV5SceneTaxonomyAttributes;
  v11 = [(CSUSceneNetV5SceneTaxonomyAttributes *)&v46 init];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_copy(v6, v7, v8, v9, v10);
    attributePaths = v11->_attributePaths;
    v11->_attributePaths = (NSDictionary *)v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    attributes = v11->_attributes;
    v11->_attributes = v14;

    v20 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v16, v17, v18, v19);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v21 = v11->_attributePaths;
    uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v42, (uint64_t)v47, 16);
    if (v26)
    {
      uint64_t v27 = *(void *)v43;
      while (2)
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v43 != v27) {
            objc_enumerationMutation(v21);
          }
          uint64_t v29 = *(void *)(*((void *)&v42 + 1) + 8 * i);
          v30 = objc_msgSend_objectForKeyedSubscript_(v11->_attributePaths, v23, v29, v24, v25);
          if ((objc_msgSend_fileExistsAtPath_(v20, v31, (uint64_t)v30, v32, v33) & 1) == 0)
          {
            if (a4)
            {
              v38 = objc_msgSend_stringWithFormat_(NSString, v34, @"Data file %@ for attribute %@ does not exist!", v35, v36, v30, v29, (void)v42);
              objc_msgSend_errorWithCode_message_(CSUError, v39, 10, (uint64_t)v38, v40);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
            v37 = 0;
            goto LABEL_14;
          }
        }
        uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v23, (uint64_t)&v42, (uint64_t)v47, 16);
        if (v26) {
          continue;
        }
        break;
      }
    }

    v37 = v11;
LABEL_14:
  }
  else if (a4)
  {
    objc_msgSend_errorWithCode_message_(CSUError, v7, 4, @"Failed to allocate memory for attribute manager", v10);
    v37 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v37 = 0;
  }

  return v37;
}

- (id)attributeForKey:(id)a3 label:(id)a4 defaultValue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14 = objc_msgSend_objectForKeyedSubscript_(self->_attributePaths, v11, (uint64_t)v8, v12, v13);

  if (!v14)
  {
    objc_msgSend_stringWithFormat_(NSString, v15, @"Invalid attribute key %@", v16, v17, v8);
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend_errorWithCode_message_(CSUError, v53, 10, (uint64_t)v32, v54);
    objc_msgSend_logInternalError_(CSUError, v56, (uint64_t)v55, v57, v58);

    goto LABEL_9;
  }
  uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(self->_attributes, v15, (uint64_t)v8, v16, v17);

  if (!v18)
  {
    v22 = NSDictionary;
    v23 = NSURL;
    uint64_t v24 = objc_msgSend_objectForKeyedSubscript_(self->_attributePaths, v19, (uint64_t)v8, v20, v21);
    v28 = objc_msgSend_fileURLWithPath_(v23, v25, (uint64_t)v24, v26, v27);
    id v66 = 0;
    v31 = objc_msgSend_dictionaryWithContentsOfURL_error_(v22, v29, (uint64_t)v28, (uint64_t)&v66, v30);
    id v32 = v66;

    if (v31)
    {
      objc_msgSend_setObject_forKeyedSubscript_(self->_attributes, v33, (uint64_t)v31, (uint64_t)v8, v35);

      goto LABEL_5;
    v60 = };
    v62 = objc_msgSend_errorWithCode_message_underlyingError_(CSUError, v61, 1, (uint64_t)v60, (uint64_t)v32);
    objc_msgSend_logInternalError_(CSUError, v63, (uint64_t)v62, v64, v65);

LABEL_9:
    id v52 = 0;
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v36 = objc_msgSend_objectForKeyedSubscript_(self->_attributes, v19, (uint64_t)v8, v20, v21);
  uint64_t v40 = objc_msgSend_objectForKeyedSubscript_(v36, v37, (uint64_t)v9, v38, v39);

  long long v44 = v40;
  if (!v40) {
    long long v45 = {;
  }
    uint64_t v48 = objc_msgSend_errorWithCode_message_(CSUError, v46, 8, (uint64_t)v45, v47);
    objc_msgSend_logInternalError_(CSUError, v49, (uint64_t)v48, v50, v51);

    long long v44 = v10;
  }
  id v52 = v44;

LABEL_10:
  return v52;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_attributePaths, 0);
}

@end