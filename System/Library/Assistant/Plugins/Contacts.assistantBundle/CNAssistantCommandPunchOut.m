@interface CNAssistantCommandPunchOut
- (CNAssistantCommandPunchOut)punchOutWithServiceHelper:(id)a3;
- (CNContactStore)contactStore;
- (id)validate;
- (id)validateIdentifier;
- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4;
- (void)setContactStore:(id)a3;
@end

@implementation CNAssistantCommandPunchOut

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

- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4
{
  id v13 = a4;
  v6 = (void (**)(id, void *))a3;
  v11 = objc_msgSend_validate(self, v7, v8);
  if (!v11)
  {
    v11 = objc_msgSend_punchOutWithServiceHelper_(self, v9, (uint64_t)v13);
  }
  v12 = objc_msgSend_dictionary(v11, v9, v10);
  v6[2](v6, v12);
}

- (id)validateIdentifier
{
  return 0;
}

- (id)validate
{
  v4 = objc_msgSend_domainItem(self, a2, v2);

  if (!v4)
  {
    id v28 = objc_alloc(MEMORY[0x263F64820]);
    v25 = objc_msgSend_initWithReason_(v28, v29, @"Expected domainItem to be set");
    goto LABEL_12;
  }
  v7 = objc_msgSend_domainItem(self, v5, v6);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = objc_msgSend_identifier(v7, v8, v9);
    id v13 = objc_msgSend_absoluteString(v10, v11, v12);

    if (v13)
    {
      v16 = (void *)MEMORY[0x263F333F8];
      v17 = objc_msgSend_identifier(v7, v14, v15);
      v19 = objc_msgSend_contactIDFromAssistantID_(v16, v18, (uint64_t)v17);

      v22 = objc_msgSend_contactStore(self, v20, v21);
      v24 = objc_msgSend_unifiedContactWithIdentifier_keysToFetch_error_(v22, v23, (uint64_t)v19, MEMORY[0x263EFFA68], 0);

      v25 = 0;
      if (!v24)
      {
        id v26 = objc_alloc(MEMORY[0x263F64820]);
        v25 = objc_msgSend_initWithReason_(v26, v27, @"Invalid person identifier (person does not exist)");
      }

      goto LABEL_11;
    }
    id v33 = objc_alloc(MEMORY[0x263F64820]);
    uint64_t v32 = objc_msgSend_initWithReason_(v33, v34, @"Invalid person identifier");
  }
  else
  {
    id v30 = objc_alloc(MEMORY[0x263F64820]);
    uint64_t v32 = objc_msgSend_initWithReason_(v30, v31, @"Expected SAABPerson for domainItem");
  }
  v25 = (void *)v32;
LABEL_11:

LABEL_12:

  return v25;
}

- (CNAssistantCommandPunchOut)punchOutWithServiceHelper:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_domainItem(self, v5, v6);
  uint64_t v8 = (void *)MEMORY[0x263F333F8];
  v11 = objc_msgSend_identifier(v7, v9, v10);
  id v13 = objc_msgSend_contactIDFromAssistantID_(v8, v12, (uint64_t)v11);

  v16 = objc_msgSend_contactStore(self, v14, v15);
  v18 = objc_msgSend_unifiedContactWithIdentifier_keysToFetch_error_(v16, v17, (uint64_t)v13, MEMORY[0x263EFFA68], 0);

  if (!v18) {
    goto LABEL_4;
  }
  uint64_t v21 = NSURL;
  v22 = NSString;
  v23 = objc_msgSend_identifier(v18, v19, v20);
  v25 = objc_msgSend_stringWithFormat_(v22, v24, @"addressbook://%@", v23);
  v27 = objc_msgSend_URLWithString_(v21, v26, (uint64_t)v25);

  LODWORD(v25) = objc_msgSend_openSensitiveURL_(v4, v28, (uint64_t)v27);
  if (v25)
  {
    id v29 = objc_alloc_init(MEMORY[0x263F64830]);
  }
  else
  {
LABEL_4:
    id v30 = objc_alloc(MEMORY[0x263F64820]);
    v31 = NSString;
    v34 = objc_msgSend_absoluteString(0, v32, v33);
    v36 = objc_msgSend_stringWithFormat_(v31, v35, @"Failed to open url %@", v34);
    id v29 = (id)objc_msgSend_initWithReason_(v30, v37, (uint64_t)v36);
  }

  return (CNAssistantCommandPunchOut *)v29;
}

- (void).cxx_destruct
{
}

@end