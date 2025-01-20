@interface KMMapper_SAPerson
+ (Class)externalObjectClass;
- (BOOL)_addLabeledFieldsForEmails:(id)a3 error:(id *)a4;
- (BOOL)_addLabeledFieldsForPhones:(id)a3 error:(id *)a4;
- (BOOL)_addLabeledFieldsForPostalAddresses:(id)a3 error:(id *)a4;
- (BOOL)_addLabeledFieldsForRelatedNames:(id)a3 error:(id *)a4;
- (KMMapper_SAPerson)init;
- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5;
- (int64_t)targetItemType;
@end

@implementation KMMapper_SAPerson

+ (Class)externalObjectClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedUserIdKey, 0);
  objc_storeStrong((id *)&self->_builder, 0);
}

- (BOOL)_addLabeledFieldsForRelatedNames:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "label", (void)v18);
        if ((_isDefaultLabel(v12) & 1) == 0)
        {
          builder = self->_builder;
          v14 = [v11 name];
          v15 = [(KVItemBuilder *)builder addFieldWithType:63 label:v12 value:v14 error:a4];

          if (!v15)
          {

            BOOL v16 = 0;
            goto LABEL_12;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 1;
LABEL_12:

  return v16;
}

- (BOOL)_addLabeledFieldsForPostalAddresses:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "label", (void)v15);
        if ((_isDefaultLabel(v11) & 1) == 0)
        {
          v12 = [(KVItemBuilder *)self->_builder addFieldWithType:59 label:v11 value:0 error:a4];

          if (!v12)
          {

            BOOL v13 = 0;
            goto LABEL_12;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_12:

  return v13;
}

- (BOOL)_addLabeledFieldsForEmails:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "label", (void)v15);
        if ((_isDefaultLabel(v11) & 1) == 0)
        {
          v12 = [(KVItemBuilder *)self->_builder addFieldWithType:58 label:v11 value:0 error:a4];

          if (!v12)
          {

            BOOL v13 = 0;
            goto LABEL_12;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_12:

  return v13;
}

- (BOOL)_addLabeledFieldsForPhones:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "label", (void)v15);
        if ((_isDefaultLabel(v11) & 1) == 0)
        {
          v12 = [(KVItemBuilder *)self->_builder addFieldWithType:57 label:v11 value:0 error:a4];

          if (!v12)
          {

            BOOL v13 = 0;
            goto LABEL_12;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_12:

  return v13;
}

- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5
{
  v108[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = [a4 objectForKey:self->_sharedUserIdKey];
  builder = self->_builder;
  v11 = [v8 internalGUID];
  id v107 = 0;
  v12 = [(KVItemBuilder *)builder setItemType:2 itemId:v11 error:&v107];
  id v13 = v107;
  if (v12)
  {
    v14 = self->_builder;
    uint64_t v15 = [v8 prefix];
    id v106 = v13;
    long long v16 = [(KVItemBuilder *)v14 addFieldWithType:55 value:v15 error:&v106];
    id v17 = v106;

    v94 = a5;
    v95 = (void *)v15;
    if (v16)
    {
      v91 = v12;
      long long v18 = self->_builder;
      [v8 firstName];
      v93 = v105[1] = v17;
      uint64_t v19 = -[KVItemBuilder addFieldWithType:value:error:](v18, "addFieldWithType:value:error:", 50);
      id v20 = v17;

      v92 = (void *)v19;
      if (v19)
      {
        v88 = v11;
        long long v21 = self->_builder;
        uint64_t v22 = [v8 middleName];
        v105[0] = v20;
        uint64_t v23 = [(KVItemBuilder *)v21 addFieldWithType:51 value:v22 error:v105];
        id v24 = v105[0];

        v89 = (void *)v23;
        v90 = (void *)v22;
        if (v23)
        {
          v25 = self->_builder;
          uint64_t v26 = [v8 lastName];
          id v104 = v24;
          uint64_t v27 = [(KVItemBuilder *)v25 addFieldWithType:52 value:v26 error:&v104];
          id v28 = v104;

          v86 = (void *)v27;
          v87 = (void *)v26;
          if (v27)
          {
            v29 = self->_builder;
            uint64_t v30 = [v8 suffix];
            id v103 = v28;
            uint64_t v31 = [(KVItemBuilder *)v29 addFieldWithType:56 value:v30 error:&v103];
            id v32 = v103;

            v84 = (void *)v31;
            v85 = (void *)v30;
            if (v31)
            {
              v33 = self->_builder;
              uint64_t v34 = [v8 nickName];
              id v102 = v32;
              uint64_t v35 = [(KVItemBuilder *)v33 addFieldWithType:54 value:v34 error:&v102];
              id v36 = v102;

              v82 = (void *)v35;
              v83 = (void *)v34;
              if (v35)
              {
                v37 = self->_builder;
                uint64_t v38 = [v8 company];
                id v101 = v36;
                uint64_t v39 = [(KVItemBuilder *)v37 addFieldWithType:64 value:v38 error:&v101];
                id v40 = v101;

                v80 = (void *)v39;
                v81 = (void *)v38;
                if (v39)
                {
                  v41 = self->_builder;
                  uint64_t v42 = [v8 firstNamePhonetic];
                  id v100 = v40;
                  uint64_t v43 = [(KVItemBuilder *)v41 addFieldWithType:67 value:v42 error:&v100];
                  id v44 = v100;

                  v78 = (void *)v43;
                  v79 = (void *)v42;
                  if (v43)
                  {
                    v45 = self->_builder;
                    [v8 lastNamePhonetic];
                    v77 = v99[1] = v44;
                    uint64_t v46 = -[KVItemBuilder addFieldWithType:value:error:](v45, "addFieldWithType:value:error:", 69);
                    id v47 = v44;

                    v76 = (void *)v46;
                    if (v46)
                    {
                      v48 = self->_builder;
                      uint64_t v49 = [v8 companyPhonetic];
                      v99[0] = v47;
                      uint64_t v50 = [(KVItemBuilder *)v48 addFieldWithType:70 value:v49 error:v99];
                      id v51 = v99[0];

                      v74 = (void *)v50;
                      v75 = (void *)v49;
                      if (v50)
                      {
                        [v8 phones];
                        uint64_t v71 = v98[1] = v51;
                        BOOL v52 = -[KMMapper_SAPerson _addLabeledFieldsForPhones:error:](self, "_addLabeledFieldsForPhones:error:");
                        id v72 = v51;

                        if (v52)
                        {
                          uint64_t v53 = [v8 emails];
                          v98[0] = v72;
                          BOOL v54 = [(KMMapper_SAPerson *)self _addLabeledFieldsForEmails:v53 error:v98];
                          id v68 = v98[0];

                          v70 = (void *)v53;
                          if (v54)
                          {
                            [v8 addresses];
                            v73 = v97[2] = v68;
                            BOOL v55 = -[KMMapper_SAPerson _addLabeledFieldsForPostalAddresses:error:](self, "_addLabeledFieldsForPostalAddresses:error:");
                            id v56 = v68;

                            if (v55)
                            {
                              [v8 relatedNames];
                              v69 = v97[1] = v56;
                              BOOL v57 = -[KMMapper_SAPerson _addLabeledFieldsForRelatedNames:error:](self, "_addLabeledFieldsForRelatedNames:error:");
                              id v51 = v56;

                              if (v57)
                              {
                                v58 = self->_builder;
                                v97[0] = v51;
                                v59 = [(KVItemBuilder *)v58 addFieldWithType:71 value:v9 error:v97];
                                id v60 = v97[0];

                                BOOL v61 = v59 != 0;
                                id v51 = v60;
                              }
                              else
                              {
                                BOOL v61 = 0;
                              }
                              v12 = v91;
                              v11 = v88;
                              v62 = v74;
                              v63 = (void *)v71;
                            }
                            else
                            {
                              BOOL v61 = 0;
                              id v51 = v56;
                              v12 = v91;
                              v11 = v88;
                              v62 = v74;
                              v63 = (void *)v71;
                            }
                          }
                          else
                          {
                            BOOL v61 = 0;
                            v12 = v91;
                            v11 = v88;
                            v62 = v74;
                            v63 = (void *)v71;
                            id v51 = v68;
                          }
                        }
                        else
                        {
                          BOOL v61 = 0;
                          v12 = v91;
                          v11 = v88;
                          id v51 = v72;
                          v62 = v74;
                          v63 = (void *)v71;
                        }
                      }
                      else
                      {
                        BOOL v61 = 0;
                        v12 = v91;
                        v11 = v88;
                        v62 = 0;
                      }

                      id v47 = v51;
                    }
                    else
                    {
                      BOOL v61 = 0;
                      v12 = v91;
                      v11 = v88;
                    }

                    id v44 = v47;
                  }
                  else
                  {
                    BOOL v61 = 0;
                    v12 = v91;
                    v11 = v88;
                  }

                  id v40 = v44;
                }
                else
                {
                  BOOL v61 = 0;
                  v12 = v91;
                  v11 = v88;
                }

                id v36 = v40;
              }
              else
              {
                BOOL v61 = 0;
                v12 = v91;
                v11 = v88;
              }

              id v32 = v36;
            }
            else
            {
              BOOL v61 = 0;
              v12 = v91;
              v11 = v88;
            }

            id v28 = v32;
          }
          else
          {
            BOOL v61 = 0;
            v12 = v91;
            v11 = v88;
          }

          id v24 = v28;
        }
        else
        {
          BOOL v61 = 0;
          v12 = v91;
          v11 = v88;
        }

        id v20 = v24;
      }
      else
      {
        BOOL v61 = 0;
        v12 = v91;
      }

      id v17 = v20;
    }
    else
    {
      BOOL v61 = 0;
    }

    if (v61)
    {
      v64 = self->_builder;
      id v96 = v17;
      v65 = [(KVItemBuilder *)v64 buildItemWithError:&v96];
      id v13 = v96;

      if (v65)
      {
        v108[0] = v65;
        v66 = [MEMORY[0x263EFF8C0] arrayWithObjects:v108 count:1];
      }
      else
      {
        KMMapperSetBuilderError((uint64_t)v94, v13);
        v66 = 0;
      }

      goto LABEL_52;
    }
    id v13 = v17;
    a5 = v94;
  }
  else
  {
  }
  KMMapperSetBuilderError((uint64_t)a5, v13);
  v66 = 0;
LABEL_52:

  return v66;
}

- (int64_t)targetItemType
{
  return 2;
}

- (KMMapper_SAPerson)init
{
  v8.receiver = self;
  v8.super_class = (Class)KMMapper_SAPerson;
  v2 = [(KMMapper_SAPerson *)&v8 init];
  if (v2)
  {
    v3 = (KVItemBuilder *)objc_alloc_init(MEMORY[0x263F510C0]);
    builder = v2->_builder;
    v2->_builder = v3;

    uint64_t v5 = KVFieldTypeToNumber();
    sharedUserIdKey = v2->_sharedUserIdKey;
    v2->_sharedUserIdKey = (NSNumber *)v5;
  }
  return v2;
}

@end