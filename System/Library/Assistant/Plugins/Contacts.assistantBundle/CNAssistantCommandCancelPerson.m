@interface CNAssistantCommandCancelPerson
- (CNContactStore)contactStore;
- (id)removeUpdatesFromCache;
- (id)validate;
- (void)performWithCompletion:(id)a3;
- (void)setContactStore:(id)a3;
@end

@implementation CNAssistantCommandCancelPerson

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
    v7 = objc_msgSend_removeUpdatesFromCache(self, v8, v9);
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

- (id)removeUpdatesFromCache
{
  v3 = objc_msgSend_identifier(self, a2, v2);
  uint64_t v6 = objc_msgSend_identifier(v3, v4, v5);

  if ((objc_msgSend_removeUpdatesForAssistantUrl_(CNAssistantCache, v7, (uint64_t)v6) & 1) == 0)
  {
    v8 = (void *)*MEMORY[0x263F28380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28380], OS_LOG_TYPE_DEBUG)) {
      sub_221CB0C54(v8, v6);
    }
  }
  id v9 = objc_alloc_init(MEMORY[0x263F64890]);

  return v9;
}

- (void).cxx_destruct
{
}

@end