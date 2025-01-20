@interface CNAssistantCommandSearchPerson
- (CNContactStore)contactStore;
- (id)meContact:(id *)a3;
- (id)perform;
- (id)searchByName:(id *)a3;
- (id)searchLocal:(id *)a3;
- (id)searchRemote:(id *)a3;
- (id)validate;
- (void)performWithCompletion:(id)a3;
- (void)setContactStore:(id)a3;
@end

@implementation CNAssistantCommandSearchPerson

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
    v7 = objc_msgSend_perform(self, v8, v9);
  }
  id v11 = v7;
  v10 = objc_msgSend_dictionary(v7, v8, v9);
  v4[2](v4, v10);
}

- (id)validate
{
  v4 = objc_msgSend_scope(self, a2, v2);
  uint64_t v5 = *MEMORY[0x263F65088];
  if (objc_msgSend_isEqualToString_(v4, v6, *MEMORY[0x263F65088]))
  {
  }
  else
  {
    id v11 = objc_msgSend_scope(self, v7, v8);
    char isEqualToString = objc_msgSend_isEqualToString_(v11, v12, *MEMORY[0x263F65090]);

    if ((isEqualToString & 1) == 0)
    {
      id v25 = objc_alloc(MEMORY[0x263F64820]);
      v19 = objc_msgSend_initWithReason_(v25, v26, @"Expected scope to be local or remote");
      goto LABEL_9;
    }
  }
  v14 = objc_msgSend_birthday(self, v9, v10);

  if (v14)
  {
    id v17 = objc_alloc(MEMORY[0x263F64820]);
    v19 = objc_msgSend_initWithReason_(v17, v18, @"Birthday not supported");
    goto LABEL_9;
  }
  v20 = objc_msgSend_relationship(self, v15, v16);

  if (v20)
  {
    id v23 = objc_alloc(MEMORY[0x263F64820]);
    v19 = objc_msgSend_initWithReason_(v23, v24, @"Relationship not supported");
    goto LABEL_9;
  }
  v28 = objc_msgSend_me(self, v21, v22);

  v31 = objc_msgSend_name(self, v29, v30);

  if (v28) {
    int v34 = 2;
  }
  else {
    int v34 = 1;
  }
  if (v31) {
    int v35 = v34;
  }
  else {
    int v35 = v28 != 0;
  }
  v36 = objc_msgSend_email(self, v32, v33);

  if (v36) {
    ++v35;
  }
  v39 = objc_msgSend_phone(self, v37, v38);

  if (v39) {
    ++v35;
  }
  v42 = objc_msgSend_company(self, v40, v41);

  if (v42) {
    ++v35;
  }
  v45 = objc_msgSend_address(self, v43, v44);

  if (v45) {
    int v48 = v35 + 1;
  }
  else {
    int v48 = v35;
  }
  if (v48 == 1)
  {
    v51 = objc_msgSend_scope(self, v46, v47);
    int v53 = objc_msgSend_isEqualToString_(v51, v52, v5);

    if (v53)
    {
      uint64_t v56 = objc_msgSend_accountIdentifier(self, v54, v55);
      if (v56)
      {
        v57 = (void *)v56;
        v58 = objc_msgSend_name(self, v54, v55);

        if (!v58)
        {
          id v71 = objc_alloc(MEMORY[0x263F64820]);
          v19 = objc_msgSend_initWithReason_(v71, v72, @"Only support local search with an accountIdentifier for name");
          goto LABEL_9;
        }
      }
    }
    v59 = objc_msgSend_scope(self, v54, v55);
    int v61 = objc_msgSend_isEqualToString_(v59, v60, *MEMORY[0x263F65090]);

    if (v61)
    {
      v64 = objc_msgSend_name(self, v62, v63);
      if (v64 || (objc_msgSend_email(self, v65, v66), (v64 = objc_claimAutoreleasedReturnValue()) != 0))
      {
      }
      else
      {
        v73 = objc_msgSend_company(self, v67, v68);

        if (!v73)
        {
          id v74 = objc_alloc(MEMORY[0x263F64820]);
          v19 = objc_msgSend_initWithReason_(v74, v75, @"Only support remote search for name, email or company");
          goto LABEL_9;
        }
      }
    }
    v19 = 0;
    goto LABEL_9;
  }
  if (v48)
  {
    id v69 = objc_alloc(MEMORY[0x263F64820]);
    v19 = objc_msgSend_initWithReason_(v69, v70, @"Only support single parameter searching (me, name, email, phone, company or address)");
  }
  else
  {
    id v49 = objc_alloc(MEMORY[0x263F64820]);
    v19 = objc_msgSend_initWithReason_(v49, v50, @"No search parameter specified (me, name, email, phone, company or address)");
  }
LABEL_9:

  return v19;
}

- (id)perform
{
  v37[1] = *MEMORY[0x263EF8340];
  v4 = objc_msgSend_me(self, a2, v2);
  int v7 = objc_msgSend_BOOLValue(v4, v5, v6);

  if (v7)
  {
    id v36 = 0;
    uint64_t v10 = objc_msgSend_meContact_(self, v8, (uint64_t)&v36);
    id v11 = v36;
    id v14 = v11;
    if (v10)
    {
      v37[0] = v10;
      v15 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v12, (uint64_t)v37, 1);
    }
    else
    {
      if (objc_msgSend_code(v11, v12, v13) == 200)
      {

        id v14 = 0;
      }
      v15 = (void *)MEMORY[0x263EFFA68];
    }

    if (v14) {
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v16 = objc_msgSend_scope(self, v8, v9);
    int isEqualToString = objc_msgSend_isEqualToString_(v16, v17, *MEMORY[0x263F65088]);

    if (isEqualToString)
    {
      int v35 = 0;
      v15 = objc_msgSend_searchLocal_(self, v19, (uint64_t)&v35);
      v21 = v35;
    }
    else
    {
      uint64_t v22 = objc_msgSend_scope(self, v19, v20);
      int v24 = objc_msgSend_isEqualToString_(v22, v23, *MEMORY[0x263F65090]);

      if (!v24)
      {
        v15 = (void *)MEMORY[0x263EFFA68];
        goto LABEL_16;
      }
      int v34 = 0;
      v15 = objc_msgSend_searchRemote_(self, v25, (uint64_t)&v34);
      v21 = v34;
    }
    id v14 = v21;
    if (v14)
    {
LABEL_14:
      id v26 = objc_alloc(MEMORY[0x263F64820]);
      v28 = objc_msgSend_stringWithFormat_(NSString, v27, @"Search error: %@", v14);
      uint64_t v30 = objc_msgSend_initWithReason_(v26, v29, (uint64_t)v28);

      goto LABEL_17;
    }
  }
LABEL_16:
  id v31 = objc_alloc(MEMORY[0x263F64720]);
  uint64_t v30 = objc_msgSend_initWithResults_(v31, v32, (uint64_t)v15);
LABEL_17:

  return v30;
}

- (id)meContact:(id *)a3
{
  v4 = objc_msgSend_contactStore(self, a2, (uint64_t)a3);
  int v7 = objc_msgSend_descriptorsForRequiredKeys(MEMORY[0x263F333F0], v5, v6);
  uint64_t v10 = objc_msgSend__crossPlatformUnifiedMeContactWithKeysToFetch_error_(v4, v8, (uint64_t)v7, a3);
  if (*a3)
  {
    id v11 = 0;
  }
  else
  {
    id v11 = objc_msgSend_personFromContact_(MEMORY[0x263F333F0], v9, (uint64_t)v10);
  }

  return v11;
}

- (id)searchByName:(id *)a3
{
  uint64_t v5 = objc_msgSend_name(self, a2, (uint64_t)a3);

  if (v5)
  {
    uint64_t v8 = objc_msgSend_contactStore(self, v6, v7);
    id v11 = objc_msgSend_descriptorsForRequiredKeys(MEMORY[0x263F333F0], v9, v10);
    v12 = (void *)MEMORY[0x263EFE9F8];
    v15 = objc_msgSend_name(self, v13, v14);
    id v17 = objc_msgSend_predicateForContactsMatchingName_options_(v12, v16, (uint64_t)v15, 1);

    v21 = objc_msgSend_unifiedContactsMatchingPredicate_keysToFetch_error_(v8, v18, (uint64_t)v17, v11, a3);
    if (*a3)
    {
      uint64_t v22 = 0;
    }
    else
    {
      id v23 = (void *)MEMORY[0x263EFE9F8];
      int v24 = objc_msgSend_name(self, v19, v20);
      id v26 = objc_msgSend_predicateForContactsWithOrganizationName_(v23, v25, (uint64_t)v24);

      v28 = objc_msgSend_unifiedContactsMatchingPredicate_keysToFetch_error_(v8, v27, (uint64_t)v26, v11, a3);
      uint64_t v30 = v28;
      if (*a3)
      {
        uint64_t v22 = 0;
      }
      else
      {
        uint64_t v31 = objc_msgSend_filterUsingBlock_(v28, v29, (uint64_t)&unk_26D4320D8);

        uint64_t v22 = objc_msgSend_arrayByAddingObjectsFromArray_(v21, v32, v31);
        uint64_t v30 = (void *)v31;
      }
    }
  }
  else
  {
    uint64_t v22 = 0;
  }

  return v22;
}

- (id)searchLocal:(id *)a3
{
  uint64_t v5 = objc_msgSend_name(self, a2, (uint64_t)a3);

  if (v5)
  {
    uint64_t v10 = objc_msgSend_searchByName_(self, v6, (uint64_t)a3);
    id v11 = 0;
    goto LABEL_9;
  }
  v12 = objc_msgSend_email(self, v6, v7);

  if (v12)
  {
    v15 = (void *)MEMORY[0x263EFE9F8];
    uint64_t v16 = objc_msgSend_email(self, v13, v14);
    v19 = objc_msgSend_emailAddress(v16, v17, v18);
    id v11 = objc_msgSend_predicateForContactsMatchingEmailAddress_(v15, v20, (uint64_t)v19);
  }
  else
  {
    v21 = objc_msgSend_phone(self, v13, v14);

    if (v21)
    {
      int v24 = (void *)MEMORY[0x263EFEB28];
      id v25 = objc_msgSend_phone(self, v22, v23);
      v28 = objc_msgSend_number(v25, v26, v27);
      uint64_t v30 = objc_msgSend_phoneNumberWithStringValue_(v24, v29, (uint64_t)v28);

      id v11 = objc_msgSend_predicateForContactsMatchingPhoneNumber_(MEMORY[0x263EFE9F8], v31, (uint64_t)v30);

      goto LABEL_8;
    }
    uint64_t v41 = objc_msgSend_company(self, v22, v23);

    if (v41)
    {
      uint64_t v44 = (void *)MEMORY[0x263EFE9F8];
      uint64_t v16 = objc_msgSend_company(self, v42, v43);
      uint64_t v46 = objc_msgSend_predicateForContactsWithOrganizationName_(v44, v45, (uint64_t)v16);
    }
    else
    {
      id v11 = objc_msgSend_address(self, v42, v43);

      if (!v11) {
        goto LABEL_8;
      }
      uint64_t v16 = objc_opt_new();
      id v49 = objc_msgSend_address(self, v47, v48);
      v52 = objc_msgSend_street(v49, v50, v51);
      objc_msgSend_setStreet_(v16, v53, (uint64_t)v52);

      uint64_t v56 = objc_msgSend_address(self, v54, v55);
      v59 = objc_msgSend_city(v56, v57, v58);
      objc_msgSend_setCity_(v16, v60, (uint64_t)v59);

      uint64_t v63 = objc_msgSend_address(self, v61, v62);
      uint64_t v66 = objc_msgSend_stateCode(v63, v64, v65);
      objc_msgSend_setState_(v16, v67, (uint64_t)v66);

      v70 = objc_msgSend_address(self, v68, v69);
      v73 = objc_msgSend_postalCode(v70, v71, v72);
      objc_msgSend_setPostalCode_(v16, v74, (uint64_t)v73);

      v77 = objc_msgSend_address(self, v75, v76);
      v80 = objc_msgSend_countryCode(v77, v78, v79);
      objc_msgSend_setISOCountryCode_(v16, v81, (uint64_t)v80);

      uint64_t v46 = objc_msgSend_predicateForContactsMatchingPostalAddress_(MEMORY[0x263EFE9F8], v82, (uint64_t)v16);
    }
    id v11 = (void *)v46;
  }

LABEL_8:
  uint64_t v10 = 0;
LABEL_9:
  if (*a3)
  {
    v32 = 0;
  }
  else
  {
    int v35 = objc_msgSend_contactStore(self, v8, v9);
    if (v11)
    {
      id v36 = objc_msgSend_descriptorsForRequiredKeys(MEMORY[0x263F333F0], v33, v34);
      uint64_t v38 = objc_msgSend_unifiedContactsMatchingPredicate_keysToFetch_error_(v35, v37, (uint64_t)v11, v36, a3);

      uint64_t v10 = (void *)v38;
    }
    if (v10)
    {
      v32 = objc_msgSend_mapUsingBlock_(v10, v33, (uint64_t)&unk_26D4320F8);
      objc_msgSend_markMeContactInPeople_usingStore_(MEMORY[0x263F333F0], v39, (uint64_t)v32, v35);
    }
    else
    {
      v32 = 0;
    }
  }

  return v32;
}

- (id)searchRemote:(id *)a3
{
  uint64_t v5 = objc_msgSend_name(self, a2, (uint64_t)a3);

  if (v5)
  {
    uint64_t v8 = objc_msgSend_name(self, v6, v7);
LABEL_3:
    id v11 = (void *)v8;
    goto LABEL_6;
  }
  v12 = objc_msgSend_email(self, v6, v7);

  if (v12)
  {
    v15 = objc_msgSend_email(self, v13, v14);
    id v11 = objc_msgSend_emailAddress(v15, v16, v17);
  }
  else
  {
    id v11 = objc_msgSend_company(self, v13, v14);

    if (v11)
    {
      uint64_t v8 = objc_msgSend_company(self, v9, v10);
      goto LABEL_3;
    }
  }
LABEL_6:
  uint64_t v18 = objc_msgSend_contactStore(self, v9, v10);
  v21 = objc_msgSend_accountIdentifier(self, v19, v20);

  if (v21)
  {
    int v24 = (void *)MEMORY[0x263EFEA80];
    id v25 = objc_msgSend_accountIdentifier(self, v22, v23);
    v28 = objc_msgSend_absoluteString(v25, v26, v27);
    uint64_t v30 = objc_msgSend_predicateForContainersInAccountWithIdentifier_(v24, v29, (uint64_t)v28);

    v32 = objc_msgSend_containersMatchingPredicate_error_(v18, v31, (uint64_t)v30, a3);
    uint64_t v34 = v32;
    if (*a3)
    {
LABEL_12:
      uint64_t v43 = 0;
      goto LABEL_13;
    }
    uint64_t v35 = objc_msgSend_mapUsingBlock_(v32, v33, (uint64_t)&unk_26D432118);

    uint64_t v30 = (void *)v35;
    if (!v11)
    {
LABEL_9:
      uint64_t v34 = 0;
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v30 = 0;
    if (!v11) {
      goto LABEL_9;
    }
  }
  id v36 = objc_msgSend_predicateForContactsMatchingFullTextSearch_containerIdentifiers_groupIdentifiers_(MEMORY[0x263EFE9F8], v22, (uint64_t)v11, v30, 0);
  v39 = objc_msgSend_descriptorsForRequiredKeys(MEMORY[0x263F333F0], v37, v38);
  uint64_t v34 = objc_msgSend_unifiedContactsMatchingPredicate_keysToFetch_error_(v18, v40, (uint64_t)v36, v39, a3);
  id v41 = *a3;

  if (v41 || !v34) {
    goto LABEL_12;
  }
  uint64_t v43 = objc_msgSend_mapUsingBlock_(v34, v42, (uint64_t)&unk_26D432138);
LABEL_13:

  return v43;
}

- (void).cxx_destruct
{
}

@end