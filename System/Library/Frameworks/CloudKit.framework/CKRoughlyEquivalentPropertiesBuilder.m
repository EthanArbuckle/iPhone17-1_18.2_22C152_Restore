@interface CKRoughlyEquivalentPropertiesBuilder
- (CKRoughlyEquivalentProperties)properties;
- (CKRoughlyEquivalentPropertiesBuilder)init;
- (NSMutableDictionary)dictionary;
- (void)addComplexObject:(id)a3 forKey:(id)a4;
- (void)addPlistObject:(id)a3 forKey:(id)a4;
- (void)addPlistObjects:(id)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
@end

@implementation CKRoughlyEquivalentPropertiesBuilder

- (CKRoughlyEquivalentPropertiesBuilder)init
{
  v6.receiver = self;
  v6.super_class = (Class)CKRoughlyEquivalentPropertiesBuilder;
  v2 = [(CKRoughlyEquivalentPropertiesBuilder *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    dictionary = v2->_dictionary;
    v2->_dictionary = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (CKRoughlyEquivalentProperties)properties
{
  uint64_t v3 = [CKRoughlyEquivalentProperties alloc];
  v7 = objc_msgSend_dictionary(self, v4, v5, v6);
  v10 = objc_msgSend_initWithDictionary_(v3, v8, (uint64_t)v7, v9);

  return (CKRoughlyEquivalentProperties *)v10;
}

- (void)addPlistObjects:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v15, (uint64_t)v19, 16);
  if (v6)
  {
    uint64_t v9 = v6;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v4);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v13 = objc_msgSend_objectForKeyedSubscript_(v4, v7, v12, v8);
        objc_msgSend_addPlistObject_forKey_(self, v14, (uint64_t)v13, v12);
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v15, (uint64_t)v19, 16);
    }
    while (v9);
  }
}

- (void)addPlistObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_dictionary(self, v8, v9, v10);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v12, v11, (uint64_t)v7, (uint64_t)v6);
}

- (void)addComplexObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  objc_msgSend_equivalencyProperties(a3, v7, v8, v9);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_dictionary(v19, v10, v11, v12);
  long long v17 = objc_msgSend_dictionary(self, v14, v15, v16);
  objc_msgSend_setObject_forKeyedSubscript_(v17, v18, (uint64_t)v13, (uint64_t)v6);
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v20 = a3;
  id v10 = a4;
  if (v20)
  {
    if ((objc_msgSend_conformsToProtocol_(v20, v7, (uint64_t)&unk_1ED849AA0, v9) & 1) != 0
      || (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend_addComplexObject_forKey_(self, v11, (uint64_t)v20, (uint64_t)v10);
    }
    else if (objc_msgSend_conformsToProtocol_(v20, v11, (uint64_t)&unk_1ED847AE8, v12) {
           && objc_msgSend_conformsToProtocol_(v20, v15, (uint64_t)&unk_1ED8487A8, v17))
    }
    {
      objc_msgSend_addPlistObject_forKey_(self, v15, (uint64_t)v20, (uint64_t)v10);
    }
    else
    {
      long long v18 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v15, v16, v17);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, (uint64_t)self, @"CKRoughlyEquivalent.m", 96, @"Invalid object type written to CKRoughlyEquivalentProperties: %@ %@", v10, v20);
    }
  }
  else
  {
    v13 = objc_msgSend_dictionary(self, v7, v8, v9);
    objc_msgSend_setObject_forKeyedSubscript_(v13, v14, 0, (uint64_t)v10);
  }
}

- (NSMutableDictionary)dictionary
{
  return self->_dictionary;
}

- (void).cxx_destruct
{
}

@end