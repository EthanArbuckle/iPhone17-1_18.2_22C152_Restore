@interface KMMapper_CNContact
+ (Class)externalObjectClass;
- (BOOL)_addLabeledFieldsOfType:(int64_t)a3 labeledValues:(id)a4 labelOnly:(BOOL)a5 error:(id *)a6;
- (KMMapper_CNContact)init;
- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5;
- (int64_t)targetItemType;
@end

@implementation KMMapper_CNContact

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativeItemIdKey, 0);
  objc_storeStrong((id *)&self->_meCardIdentifierKey, 0);
  objc_storeStrong((id *)&self->_builder, 0);
}

- (BOOL)_addLabeledFieldsOfType:(int64_t)a3 labeledValues:(id)a4 labelOnly:(BOOL)a5 error:(id *)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a4;
  v9 = v8;
  if (!v8 || ![v8 count])
  {
    LOBYTE(v24) = 1;
    goto LABEL_34;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (!v11)
  {
    LOBYTE(v24) = 1;
    goto LABEL_33;
  }
  uint64_t v12 = v11;
  v26 = v9;
  uint64_t v13 = *(void *)v30;
  while (2)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v30 != v13) {
        objc_enumerationMutation(v10);
      }
      v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
      v16 = [v15 value];

      if (v16)
      {
        id v17 = [v15 label];
        unint64_t v18 = [v17 length];
        uint64_t v19 = [@"_$!<" length];
        if (v18 >= [@">!$_" length] + v19
          && ([v17 hasPrefix:@"_$!<"] & 1) != 0)
        {
          char v20 = [v17 hasSuffix:@">!$_"];

          if (v20)
          {
LABEL_25:

            continue;
          }
        }
        else
        {
        }
        if (a5)
        {
          v21 = 0;
          goto LABEL_24;
        }
        id v22 = [v15 value];
        if (v22)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v23 = v22;
LABEL_21:
            v21 = v23;
LABEL_23:

LABEL_24:
            v24 = [(KVItemBuilder *)self->_builder addFieldWithType:a3 label:v17 value:v21 error:a6];

            if (!v24)
            {

              goto LABEL_31;
            }
            goto LABEL_25;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v23 = [v22 name];
            goto LABEL_21;
          }
        }
        v21 = 0;
        goto LABEL_23;
      }
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v12) {
      continue;
    }
    break;
  }
  LOBYTE(v24) = 1;
LABEL_31:
  v9 = v26;
LABEL_33:

LABEL_34:
  return (char)v24;
}

- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5
{
  v129[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  uint64_t v11 = [v9 objectForKey:self->_alternativeItemIdKey];
  uint64_t v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [v10 identifier];
  }
  v14 = v13;
  v15 = [v9 objectForKey:self->_meCardIdentifierKey];
  int v16 = [v15 isEqual:v14];

  builder = self->_builder;
  id v128 = 0;
  unint64_t v18 = [(KVItemBuilder *)builder setItemType:2 itemId:v14 error:&v128];
  id v19 = v128;
  char v20 = v19;
  if (v18)
  {
    int v113 = v16;
    v117 = a5;
    v21 = self->_builder;
    id v22 = [v10 namePrefix];
    id v127 = v20;
    id v23 = [(KVItemBuilder *)v21 addFieldWithType:55 value:v22 error:&v127];
    id v24 = v127;

    if (v23)
    {
      v114 = v22;
      v25 = self->_builder;
      [v10 givenName];
      v116 = v126[1] = v24;
      uint64_t v26 = -[KVItemBuilder addFieldWithType:value:error:](v25, "addFieldWithType:value:error:", 50);
      id v27 = v24;

      v115 = (void *)v26;
      if (v26)
      {
        v112 = v23;
        v28 = self->_builder;
        uint64_t v29 = [v10 middleName];
        v126[0] = v27;
        uint64_t v30 = [(KVItemBuilder *)v28 addFieldWithType:51 value:v29 error:v126];
        id v31 = v126[0];

        v110 = (void *)v30;
        v111 = (void *)v29;
        if (v30)
        {
          long long v32 = self->_builder;
          [v10 familyName];
          v109 = v125[1] = v31;
          uint64_t v33 = -[KVItemBuilder addFieldWithType:value:error:](v32, "addFieldWithType:value:error:", 52);
          id v34 = v31;

          v108 = (void *)v33;
          if (v33)
          {
            v35 = self->_builder;
            uint64_t v36 = [v10 previousFamilyName];
            v125[0] = v34;
            uint64_t v37 = [(KVItemBuilder *)v35 addFieldWithType:53 value:v36 error:v125];
            id v38 = v125[0];

            v106 = (void *)v37;
            v107 = (void *)v36;
            if (v37)
            {
              v103 = v18;
              v39 = self->_builder;
              uint64_t v40 = [v10 nameSuffix];
              id v124 = v38;
              uint64_t v41 = [(KVItemBuilder *)v39 addFieldWithType:56 value:v40 error:&v124];
              id v42 = v124;

              v104 = (void *)v41;
              v105 = (void *)v40;
              if (v41)
              {
                v43 = self->_builder;
                uint64_t v44 = [v10 nickname];
                id v123 = v42;
                uint64_t v45 = [(KVItemBuilder *)v43 addFieldWithType:54 value:v44 error:&v123];
                id v46 = v123;

                v101 = (void *)v45;
                v102 = (void *)v44;
                if (v45)
                {
                  v47 = self->_builder;
                  v48 = [v10 organizationName];
                  id v122 = v46;
                  uint64_t v49 = [(KVItemBuilder *)v47 addFieldWithType:64 value:v48 error:&v122];
                  id v42 = v122;

                  v100 = (void *)v49;
                  if (v49)
                  {
                    v95 = v48;
                    v50 = self->_builder;
                    uint64_t v51 = [v10 departmentName];
                    id v121 = v42;
                    uint64_t v52 = [(KVItemBuilder *)v50 addFieldWithType:65 value:v51 error:&v121];
                    id v96 = v121;

                    v98 = (void *)v52;
                    v99 = (void *)v51;
                    if (v52)
                    {
                      v53 = self->_builder;
                      [v10 jobTitle];
                      v94 = v120[8] = v96;
                      uint64_t v54 = -[KVItemBuilder addFieldWithType:value:error:](v53, "addFieldWithType:value:error:", 66);
                      id v42 = v96;

                      v97 = (void *)v54;
                      if (v54)
                      {
                        v55 = self->_builder;
                        [v10 phoneticGivenName];
                        v93 = v120[7] = v42;
                        uint64_t v56 = -[KVItemBuilder addFieldWithType:value:error:](v55, "addFieldWithType:value:error:", 67);
                        id v90 = v42;

                        v92 = (void *)v56;
                        if (v56)
                        {
                          v57 = self->_builder;
                          [v10 phoneticMiddleName];
                          v89 = v120[6] = v90;
                          uint64_t v58 = -[KVItemBuilder addFieldWithType:value:error:](v57, "addFieldWithType:value:error:", 68);
                          id v42 = v90;

                          v91 = (void *)v58;
                          if (v58)
                          {
                            v59 = self->_builder;
                            [v10 phoneticFamilyName];
                            v88 = v120[5] = v42;
                            uint64_t v60 = -[KVItemBuilder addFieldWithType:value:error:](v59, "addFieldWithType:value:error:", 69);
                            id v85 = v42;

                            v87 = (void *)v60;
                            if (v60)
                            {
                              v61 = self->_builder;
                              [v10 phoneticOrganizationName];
                              v84 = v120[4] = v85;
                              uint64_t v62 = -[KVItemBuilder addFieldWithType:value:error:](v61, "addFieldWithType:value:error:", 70);
                              id v63 = v85;

                              v86 = (void *)v62;
                              if (v62)
                              {
                                [v10 phoneNumbers];
                                v83 = v120[3] = v63;
                                BOOL v64 = -[KMMapper_CNContact _addLabeledFieldsOfType:labeledValues:labelOnly:error:](self, "_addLabeledFieldsOfType:labeledValues:labelOnly:error:", 57);
                                id v42 = v63;

                                if (v64)
                                {
                                  [v10 emailAddresses];
                                  v82 = v120[2] = v42;
                                  BOOL v65 = -[KMMapper_CNContact _addLabeledFieldsOfType:labeledValues:labelOnly:error:](self, "_addLabeledFieldsOfType:labeledValues:labelOnly:error:", 58);
                                  id v66 = v42;
                                  v67 = v42;
                                  id v42 = v66;

                                  if (v65)
                                  {
                                    v48 = v95;
                                    [v10 postalAddresses];
                                    v81 = v120[1] = v42;
                                    LODWORD(v30) = -[KMMapper_CNContact _addLabeledFieldsOfType:labeledValues:labelOnly:error:](self, "_addLabeledFieldsOfType:labeledValues:labelOnly:error:", 59);
                                    id v68 = v42;

                                    if (v30)
                                    {
                                      v69 = [v10 urlAddresses];
                                      v120[0] = v68;
                                      LODWORD(v30) = [(KMMapper_CNContact *)self _addLabeledFieldsOfType:60 labeledValues:v69 labelOnly:1 error:v120];
                                      id v42 = v120[0];

                                      if (v30)
                                      {
                                        [v10 socialProfiles];
                                        v80 = v119[2] = v42;
                                        LODWORD(v30) = -[KMMapper_CNContact _addLabeledFieldsOfType:labeledValues:labelOnly:error:](self, "_addLabeledFieldsOfType:labeledValues:labelOnly:error:", 61);
                                        id v70 = v42;

                                        if (v30)
                                        {
                                          [v10 instantMessageAddresses];
                                          v79 = v119[1] = v70;
                                          LODWORD(v30) = -[KMMapper_CNContact _addLabeledFieldsOfType:labeledValues:labelOnly:error:](self, "_addLabeledFieldsOfType:labeledValues:labelOnly:error:", 62);
                                          id v71 = v70;

                                          if (v30)
                                          {
                                            v78 = [v10 contactRelations];
                                            v119[0] = v71;
                                            LOBYTE(v30) = [(KMMapper_CNContact *)self _addLabeledFieldsOfType:63 labeledValues:v78 labelOnly:v113 ^ 1u error:v119];
                                            id v72 = v119[0];

                                            id v71 = v72;
                                          }

                                          id v70 = v71;
                                        }

                                        id v42 = v70;
                                      }
                                    }
                                    else
                                    {
                                      id v42 = v68;
                                    }
                                    v73 = v114;
                                    unint64_t v18 = v103;
                                  }
                                  else
                                  {
                                    v48 = v95;
                                    LOBYTE(v30) = 0;
                                    v73 = v114;
                                    unint64_t v18 = v103;
                                  }
                                }
                                else
                                {
                                  v48 = v95;
                                  LOBYTE(v30) = 0;
                                  v73 = v114;
                                  unint64_t v18 = v103;
                                }
                              }
                              else
                              {
                                v48 = v95;
                                LOBYTE(v30) = 0;
                                v73 = v114;
                                id v42 = v63;
                                unint64_t v18 = v103;
                              }
                            }
                            else
                            {
                              v48 = v95;
                              LOBYTE(v30) = 0;
                              v73 = v114;
                              unint64_t v18 = v103;
                              id v42 = v85;
                            }
                          }
                          else
                          {
                            v48 = v95;
                            LOBYTE(v30) = 0;
                            v73 = v114;
                            unint64_t v18 = v103;
                          }
                        }
                        else
                        {
                          v48 = v95;
                          LOBYTE(v30) = 0;
                          v73 = v114;
                          unint64_t v18 = v103;
                          id v42 = v90;
                        }
                      }
                      else
                      {
                        v48 = v95;
                        LOBYTE(v30) = 0;
                        v73 = v114;
                        unint64_t v18 = v103;
                      }
                    }
                    else
                    {
                      v48 = v95;
                      id v42 = v96;
                      LOBYTE(v30) = 0;
                      v73 = v114;
                      unint64_t v18 = v103;
                    }
                  }
                  else
                  {
                    LOBYTE(v30) = 0;
                    v73 = v114;
                    unint64_t v18 = v103;
                  }
                }
                else
                {
                  LOBYTE(v30) = 0;
                  v73 = v114;
                  id v42 = v46;
                  unint64_t v18 = v103;
                }
              }
              else
              {
                LOBYTE(v30) = 0;
                v73 = v114;
                unint64_t v18 = v103;
              }

              id v38 = v42;
            }
            else
            {
              LOBYTE(v30) = 0;
              v73 = v114;
            }

            id v34 = v38;
          }
          else
          {
            LOBYTE(v30) = 0;
            v73 = v114;
          }

          id v31 = v34;
        }
        else
        {
          v73 = v114;
        }

        id v27 = v31;
        id v23 = v112;
      }
      else
      {
        LOBYTE(v30) = 0;
        v73 = v114;
      }

      if (v30)
      {
        v74 = self->_builder;
        id v118 = v27;
        v75 = [(KVItemBuilder *)v74 buildItemWithError:&v118];
        id v24 = v118;

        if (v75)
        {
          v129[0] = v75;
          v76 = [MEMORY[0x263EFF8C0] arrayWithObjects:v129 count:1];
        }
        else
        {
          KMMapperSetBuilderError((uint64_t)v117, v24);
          v76 = 0;
        }

        goto LABEL_68;
      }
      id v24 = v27;
    }
    else
    {
    }
    a5 = v117;
  }
  else
  {
    id v24 = v19;
  }
  KMMapperSetBuilderError((uint64_t)a5, v24);
  v76 = 0;
LABEL_68:

  return v76;
}

- (int64_t)targetItemType
{
  return 2;
}

- (KMMapper_CNContact)init
{
  v10.receiver = self;
  v10.super_class = (Class)KMMapper_CNContact;
  v2 = [(KMMapper_CNContact *)&v10 init];
  if (v2)
  {
    v3 = (KVItemBuilder *)objc_alloc_init(MEMORY[0x263F510C0]);
    builder = v2->_builder;
    v2->_builder = v3;

    uint64_t v5 = KVAdditionalFieldTypeToNumber();
    meCardIdentifierKey = v2->_meCardIdentifierKey;
    v2->_meCardIdentifierKey = (NSNumber *)v5;

    uint64_t v7 = KVAdditionalFieldTypeToNumber();
    alternativeItemIdKey = v2->_alternativeItemIdKey;
    v2->_alternativeItemIdKey = (NSNumber *)v7;
  }
  return v2;
}

+ (Class)externalObjectClass
{
  return (Class)objc_opt_class();
}

@end