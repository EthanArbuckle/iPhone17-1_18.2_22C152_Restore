@interface CNAssistantCommandRetrievePerson
- (CNContactStore)contactStore;
- (id)retrieve;
- (void)performWithCompletion:(id)a3;
- (void)setContactStore:(id)a3;
@end

@implementation CNAssistantCommandRetrievePerson

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
  objc_msgSend_retrieve(self, v5, v6);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_dictionary(v10, v7, v8);
  v4[2](v4, v9);
}

- (id)retrieve
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  v4 = objc_msgSend_identifiers(self, a2, v2);

  if (v4)
  {
    v55 = objc_msgSend_array(MEMORY[0x263EFF980], v5, v6);
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    v9 = objc_msgSend_identifiers(self, v7, v8);
    uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v57, v61, 16);
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v58;
LABEL_4:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v58 != v13) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(id *)(*((void *)&v57 + 1) + 8 * v14);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        v18 = objc_msgSend_internalGUID(v15, v16, v17);

        if (v18)
        {
          v23 = objc_msgSend_internalGUID(v15, v19, v20);
          if (!v23) {
            goto LABEL_22;
          }
        }
        else
        {
          v24 = (void *)MEMORY[0x263F333F8];
          v25 = objc_msgSend_identifier(v15, v19, v20);
          v23 = objc_msgSend_contactIDFromAssistantID_(v24, v26, (uint64_t)v25);

          if (!v23)
          {
LABEL_22:
            v49 = @"Invalid person identifier";
            goto LABEL_23;
          }
        }
        v27 = objc_msgSend_descriptorsForRequiredKeys(MEMORY[0x263F333F0], v21, v22);
        v30 = objc_msgSend_contactStore(self, v28, v29);
        uint64_t v56 = 0;
        v32 = objc_msgSend_unifiedContactWithIdentifier_keysToFetch_error_(v30, v31, (uint64_t)v23, v27, &v56);

        if (v32)
        {
          objc_msgSend_addObject_(v55, v33, (uint64_t)v32);
        }
        else
        {
          id v34 = objc_alloc(MEMORY[0x263F64820]);
          uint64_t v54 = objc_msgSend_initWithReason_(v34, v35, @"Invalid person identifier (person does not exist)");
        }

        if (!v32)
        {
          id v48 = (id)v54;
          v37 = v55;
          goto LABEL_27;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v36, (uint64_t)&v57, v61, 16);
          if (v12) {
            goto LABEL_4;
          }
          goto LABEL_18;
        }
      }
      v49 = @"Expected SAABPerson for identifier";
LABEL_23:
      id v50 = objc_alloc(MEMORY[0x263F64820]);
      id v48 = (id)objc_msgSend_initWithReason_(v50, v51, (uint64_t)v49);

      v37 = v55;
      goto LABEL_27;
    }
LABEL_18:

    v37 = v55;
    if (objc_msgSend_count(v55, v38, v39))
    {
      v9 = objc_msgSend_mapUsingBlock_(v55, v40, (uint64_t)&unk_26D432158);
      v41 = (void *)MEMORY[0x263F333F0];
      v44 = objc_msgSend_contactStore(self, v42, v43);
      objc_msgSend_markMeContactInPeople_usingStore_(v41, v45, (uint64_t)v9, v44);
    }
    else
    {
      v9 = 0;
    }
    id v48 = objc_alloc_init(MEMORY[0x263F648A8]);
    objc_msgSend_setObjects_(v48, v52, (uint64_t)v9);
LABEL_27:
  }
  else
  {
    id v46 = objc_alloc(MEMORY[0x263F64820]);
    id v48 = (id)objc_msgSend_initWithReason_(v46, v47, @"Expected identifiers to be set");
  }

  return v48;
}

- (void).cxx_destruct
{
}

@end