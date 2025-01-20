@interface CNAssistantCommandMultiSearchPerson
- (CNContactStore)contactStore;
- (id)perform;
- (id)validate;
- (void)performWithCompletion:(id)a3;
- (void)setContactStore:(id)a3;
@end

@implementation CNAssistantCommandMultiSearchPerson

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
  uint64_t v4 = objc_msgSend_personSearches(self, a2, v2);
  if (v4
    && (v7 = (void *)v4,
        objc_msgSend_personSearches(self, v5, v6),
        v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = objc_msgSend_count(v8, v9, v10),
        v8,
        v7,
        v11))
  {
    v12 = 0;
  }
  else
  {
    id v13 = objc_alloc(MEMORY[0x263F64820]);
    v12 = objc_msgSend_initWithReason_(v13, v14, @"Expected personSearches to be set");
  }

  return v12;
}

- (id)perform
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x3032000000;
  v60 = sub_221CAD2CC;
  v61 = sub_221CAD2DC;
  uint64_t v4 = (void *)MEMORY[0x263EFF980];
  v5 = objc_msgSend_personSearches(self, a2, v2);
  uint64_t v8 = objc_msgSend_count(v5, v6, v7);
  objc_msgSend_arrayWithCapacity_(v4, v9, v8);
  id v62 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x2020000000;
  uint64_t v56 = 0;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v12 = objc_msgSend_personSearches(self, v10, v11);
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v49, v63, 16);
  if (v14)
  {
    uint64_t v15 = *(void *)v50;
    id obj = v12;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v50 != v15) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        v18 = [CNAssistantCommandSearchPerson alloc];
        v21 = objc_msgSend_dictionary(v17, v19, v20);
        v23 = objc_msgSend_initWithDictionary_(v18, v22, (uint64_t)v21);

        v26 = objc_msgSend_contactStore(self, v24, v25);
        objc_msgSend_setContactStore_(v23, v27, (uint64_t)v26);

        v32 = objc_msgSend_resultsLimit(self, v28, v29);
        if (v32
          && (unint64_t v33 = v54[3],
              objc_msgSend_resultsLimit(self, v30, v31),
              v34 = objc_claimAutoreleasedReturnValue(),
              LODWORD(v33) = v33 < objc_msgSend_integerValue(v34, v35, v36),
              v34,
              v32,
              !v33))
        {
          id v37 = objc_alloc_init(MEMORY[0x263F64720]);
          v40 = objc_msgSend_refId(v17, v38, v39);
          objc_msgSend_setRefId_(v37, v41, (uint64_t)v40);

          objc_msgSend_addObject_((void *)v58[5], v42, (uint64_t)v37);
        }
        else
        {
          v48[0] = MEMORY[0x263EF8330];
          v48[1] = 3221225472;
          v48[2] = sub_221CAD2E4;
          v48[3] = &unk_2645E7140;
          v48[4] = v17;
          v48[5] = &v57;
          v48[6] = &v53;
          objc_msgSend_performWithCompletion_(v23, v30, (uint64_t)v48, obj);
        }
      }
      v12 = obj;
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v43, (uint64_t)&v49, v63, 16);
    }
    while (v14);
  }

  id v44 = objc_alloc_init(MEMORY[0x263F64708]);
  objc_msgSend_setPersonSearchCompleteds_(v44, v45, v58[5]);
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);

  return v44;
}

- (void).cxx_destruct
{
}

@end