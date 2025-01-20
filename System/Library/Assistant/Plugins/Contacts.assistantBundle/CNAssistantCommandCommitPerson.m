@interface CNAssistantCommandCommitPerson
- (CNContactStore)contactStore;
- (id)commitFromUpdatesCache;
- (id)validate;
- (void)performWithCompletion:(id)a3;
- (void)setContactStore:(id)a3;
@end

@implementation CNAssistantCommandCommitPerson

- (void)setContactStore:(id)a3
{
}

- (CNContactStore)contactStore
{
  contactStore = self->_contactStore;
  if (!contactStore)
  {
    v4 = (CNContactStore *)objc_alloc_init(MEMORY[0x263EFEA58]);
    v5 = self->_contactStore;
    self->_contactStore = v4;

    contactStore = self->_contactStore;
  }

  return contactStore;
}

- (void)performWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v7 = objc_msgSend_validate(self, v5, v6);
  if (!v7)
  {
    v7 = objc_msgSend_commitFromUpdatesCache(self, v8, v9);
  }
  id v11 = v7;
  v10 = objc_msgSend_dictionary(v7, v8, v9);
  v4[2](v4, v10);
}

- (id)validate
{
  v39[1] = *MEMORY[0x263EF8340];
  v4 = objc_msgSend_identifier(self, a2, v2);

  if (v4)
  {
    v7 = objc_msgSend_identifier(self, v5, v6);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = objc_msgSend_identifier(v7, v8, v9);
      v13 = objc_msgSend_absoluteString(v10, v11, v12);

      if (v13)
      {
        v16 = (void *)MEMORY[0x263F333F8];
        v17 = objc_msgSend_identifier(v7, v14, v15);
        v19 = objc_msgSend_contactIDFromAssistantID_(v16, v18, (uint64_t)v17);

        if (v19)
        {
          v22 = objc_msgSend_contactStore(self, v20, v21);
          v39[0] = *MEMORY[0x263EFE148];
          v24 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v23, (uint64_t)v39, 1);
          v26 = objc_msgSend_unifiedContactWithIdentifier_keysToFetch_error_(v22, v25, (uint64_t)v19, v24, 0);

          v27 = 0;
          if (!v26)
          {
            id v28 = objc_alloc(MEMORY[0x263F64820]);
            v27 = objc_msgSend_initWithReason_(v28, v29, @"Invalid person identifier (person does not exist)");
          }
        }
        else
        {
          id v36 = objc_alloc(MEMORY[0x263F64820]);
          v27 = objc_msgSend_initWithReason_(v36, v37, @"Invalid person identifier (person does not exist)");
        }
      }
      else
      {
        id v34 = objc_alloc(MEMORY[0x263F64820]);
        v27 = objc_msgSend_initWithReason_(v34, v35, @"Invalid person identifier");
      }
    }
    else
    {
      id v32 = objc_alloc(MEMORY[0x263F64820]);
      v27 = objc_msgSend_initWithReason_(v32, v33, @"Expected SAABPerson for identifier");
    }
  }
  else
  {
    id v30 = objc_alloc(MEMORY[0x263F64820]);
    v27 = objc_msgSend_initWithReason_(v30, v31, @"Expected identifier to be set");
  }

  return v27;
}

- (id)commitFromUpdatesCache
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  v4 = objc_msgSend_identifier(self, a2, v2);
  v7 = objc_msgSend_identifier(v4, v5, v6);
  id v11 = objc_msgSend_updatesForAssistantUrl_(CNAssistantCache, v8, (uint64_t)v7);
  if (!v11) {
    goto LABEL_11;
  }
  v52 = v4;
  id v12 = objc_alloc_init(MEMORY[0x263EFEB48]);
  uint64_t v51 = (uint64_t)v7;
  v14 = objc_msgSend_contactIDFromAssistantID_(MEMORY[0x263F333F8], v13, (uint64_t)v7);
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v50 = v11;
  id obj = v11;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v54, v58, 16);
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v55 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v54 + 1) + 8 * i);
        id v21 = objc_alloc(MEMORY[0x263F648B0]);
        v23 = objc_msgSend_initWithDictionary_(v21, v22, v20);
        v24 = (void *)MEMORY[0x263F333F0];
        v27 = objc_msgSend_contactStore(self, v25, v26);
        objc_msgSend_applyUpdate_toContactWithIdentifier_usingStore_saveRequest_(v24, v28, (uint64_t)v23, v14, v27, v12);
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v29, (uint64_t)&v54, v58, 16);
    }
    while (v17);
  }

  v7 = (void *)v51;
  objc_msgSend_removeUpdatesForAssistantUrl_(CNAssistantCache, v30, v51);
  v33 = objc_msgSend_contactStore(self, v31, v32);
  int v35 = objc_msgSend_executeSaveRequest_error_(v33, v34, (uint64_t)v12, 0);

  v4 = v52;
  id v11 = v50;
  if (v35)
  {
    id v36 = objc_alloc_init(MEMORY[0x263F64898]);
    v39 = objc_msgSend_identifier(self, v37, v38);
    v42 = objc_msgSend_identifier(v39, v40, v41);
    objc_msgSend_setIdentifier_(v36, v43, (uint64_t)v42);
  }
  else
  {
LABEL_11:
    uint64_t v44 = objc_msgSend_code(0, v9, v10, v50);
    uint64_t v45 = *MEMORY[0x263F65078];
    id v46 = objc_alloc(MEMORY[0x263F64820]);
    if (v44 == v45) {
      uint64_t v48 = objc_msgSend_initWithErrorCode_(v46, v47, v44);
    }
    else {
      uint64_t v48 = objc_msgSend_initWithReason_(v46, v47, @"Failed to update the AB person");
    }
    id v36 = (id)v48;
  }

  return v36;
}

- (void).cxx_destruct
{
}

@end