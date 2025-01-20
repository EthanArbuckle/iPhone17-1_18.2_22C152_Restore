@interface CNAssistantCommandUpdatePerson
- (CNContactStore)contactStore;
- (id)addToUpdatesCache;
- (id)validate;
- (id)validateIdentifier;
- (void)performWithCompletion:(id)a3;
- (void)setContactStore:(id)a3;
@end

@implementation CNAssistantCommandUpdatePerson

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
    v7 = objc_msgSend_addToUpdatesCache(self, v8, v9);
  }
  id v11 = v7;
  v10 = objc_msgSend_dictionary(v7, v8, v9);
  v4[2](v4, v10);
}

- (id)validateIdentifier
{
  return 0;
}

- (id)validate
{
  v52[1] = *MEMORY[0x263EF8340];
  v4 = objc_msgSend_identifier(self, a2, v2);

  if (!v4)
  {
    id v34 = objc_alloc(MEMORY[0x263F64820]);
    v36 = objc_msgSend_initWithReason_(v34, v35, @"Expected identifier to be set");
    goto LABEL_30;
  }
  v7 = objc_msgSend_identifier(self, v5, v6);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = objc_msgSend_identifier(v7, v8, v9);
    v13 = objc_msgSend_absoluteString(v10, v11, v12);

    if (!v13)
    {
      id v39 = objc_alloc(MEMORY[0x263F64820]);
      v36 = objc_msgSend_initWithReason_(v39, v40, @"Invalid person identifier");
LABEL_28:

      goto LABEL_29;
    }
    v16 = (void *)MEMORY[0x263F333F8];
    v17 = objc_msgSend_identifier(v7, v14, v15);
    v19 = objc_msgSend_contactIDFromAssistantID_(v16, v18, (uint64_t)v17);

    if (!v19)
    {
      id v41 = objc_alloc(MEMORY[0x263F64820]);
      v36 = objc_msgSend_initWithReason_(v41, v42, @"Invalid person identifier (person does not exist)");
LABEL_27:

      goto LABEL_28;
    }
    v22 = objc_msgSend_contactStore(self, v20, v21);
    v52[0] = *MEMORY[0x263EFE148];
    v24 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v23, (uint64_t)v52, 1);
    v26 = objc_msgSend_unifiedContactWithIdentifier_keysToFetch_error_(v22, v25, (uint64_t)v19, v24, 0);

    if (!v26)
    {
      v33 = @"Invalid person identifier (person does not exist)";
      goto LABEL_24;
    }
    v29 = objc_msgSend_setFields(self, v27, v28);

    if (v29)
    {
      v32 = objc_msgSend_setFields(self, v30, v31);

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v33 = @"Expected SAABPerson for setFields";
        v7 = v32;
        goto LABEL_24;
      }
    }
    else
    {
      v32 = v7;
    }
    v43 = objc_msgSend_addFields(self, v30, v31);

    if (v43)
    {
      v7 = objc_msgSend_addFields(self, v44, v45);

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v33 = @"Expected SAABPerson for addFields";
        goto LABEL_24;
      }
      v32 = v7;
    }
    v46 = objc_msgSend_removeFields(self, v44, v45);

    if (!v46)
    {
      v36 = 0;
LABEL_26:

      v7 = v32;
      goto LABEL_27;
    }
    v7 = objc_msgSend_removeFields(self, v47, v48);

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v36 = 0;
LABEL_25:
      v32 = v7;
      goto LABEL_26;
    }
    v33 = @"Expected SAABPerson for removeFields";
LABEL_24:
    id v49 = objc_alloc(MEMORY[0x263F64820]);
    v36 = objc_msgSend_initWithReason_(v49, v50, (uint64_t)v33);
    goto LABEL_25;
  }
  id v37 = objc_alloc(MEMORY[0x263F64820]);
  v36 = objc_msgSend_initWithReason_(v37, v38, @"Expected SAABPerson for identifier");
LABEL_29:

LABEL_30:

  return v36;
}

- (id)addToUpdatesCache
{
  v23.receiver = self;
  v23.super_class = (Class)CNAssistantCommandUpdatePerson;
  v3 = [(CNAssistantCommandUpdatePerson *)&v23 dictionary];
  uint64_t v6 = objc_msgSend_identifier(self, v4, v5);
  uint64_t v9 = objc_msgSend_identifier(v6, v7, v8);
  int v11 = objc_msgSend_addUpdate_forAssistantUrl_(CNAssistantCache, v10, (uint64_t)v3, v9);

  if (v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x263F648B8]);
    uint64_t v15 = objc_msgSend_identifier(self, v13, v14);
    v18 = objc_msgSend_identifier(v15, v16, v17);
    objc_msgSend_setIdentifier_(v12, v19, (uint64_t)v18);
  }
  else
  {
    id v20 = objc_alloc(MEMORY[0x263F64820]);
    id v12 = (id)objc_msgSend_initWithReason_(v20, v21, @"Failed to cache the update");
  }

  return v12;
}

- (void).cxx_destruct
{
}

@end