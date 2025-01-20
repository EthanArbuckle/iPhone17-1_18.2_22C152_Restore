@interface NSEntityDescription(VSSubscriptionAdditions)
+ (id)vs_subscriptionEntityForVersion:()VSSubscriptionAdditions;
- (id)vs_referenceValueAttribute;
- (void)vs_setReferenceValueAttribute:()VSSubscriptionAdditions;
- (void)vs_setUserInfoValue:()VSSubscriptionAdditions forKey:;
@end

@implementation NSEntityDescription(VSSubscriptionAdditions)

- (void)vs_setUserInfoValue:()VSSubscriptionAdditions forKey:
{
  id v10 = a3;
  id v6 = a4;
  v7 = [a1 userInfo];
  id v8 = (id)[v7 mutableCopy];

  if (!v8) {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  if (v10)
  {
    [v8 setObject:v10 forKey:v6];
  }
  else
  {
    v9 = [v8 objectForKey:v6];

    if (v9) {
      [v8 removeObjectForKey:v6];
    }
  }
  [a1 setUserInfo:v8];
}

- (id)vs_referenceValueAttribute
{
  v2 = [a1 userInfo];
  v3 = [v2 objectForKey:@"VSReferenceValueAttributeUserInfoKey"];

  if (v3)
  {
    id v4 = v3;
    v5 = [a1 attributesByName];
    id v6 = [v5 objectForKey:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)vs_setReferenceValueAttribute:()VSSubscriptionAdditions
{
  id v7 = [a3 name];
  id v4 = [a1 attributesByName];
  v5 = [v4 allKeys];
  int v6 = [v5 containsObject:v7];

  if (v6) {
    objc_msgSend(a1, "vs_setUserInfoValue:forKey:", v7, @"VSReferenceValueAttributeUserInfoKey");
  }
  else {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The attribute must belong to the receiver."];
  }
}

+ (id)vs_subscriptionEntityForVersion:()VSSubscriptionAdditions
{
  v122[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1C0A8]);
  [v4 setName:@"Subscription"];
  v5 = (objc_class *)objc_opt_class();
  int v6 = NSStringFromClass(v5);
  [v4 setManagedObjectClassName:v6];

  unint64_t v7 = 0x1E4F1C000uLL;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v91 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1C008]);
  [v8 addObject:v10];
  [v10 setName:@"expirationDate"];
  objc_msgSend(v10, "vs_setSubscriptionKeyPath:", @"expirationDate");
  objc_msgSend(v10, "vs_setPropertyListKey:", @"PSSSExpirationDate");
  [v10 setAttributeType:900];
  [v10 setOptional:0];
  v11 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v10 setDefaultValue:v11];

  v83 = v10;
  [v9 addObject:v10];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1C008]);
  [v8 addObject:v12];
  [v12 setName:@"creationDate"];
  objc_msgSend(v12, "vs_setSubscriptionKeyPath:", @"creationDate");
  objc_msgSend(v12, "vs_setSuitablePurposes:", 5);
  objc_msgSend(v12, "vs_setPropertyListKey:", @"PSSSDateCreated");
  [v12 setAttributeType:900];
  [v12 setOptional:0];
  v82 = v12;
  [v9 addObject:v12];
  id v13 = objc_alloc_init(MEMORY[0x1E4F1C008]);
  [v8 addObject:v13];
  [v13 setName:@"mostRecentSaveDate"];
  objc_msgSend(v13, "vs_setSubscriptionKeyPath:", @"modificationDate");
  objc_msgSend(v13, "vs_setSuitablePurposes:", 5);
  objc_msgSend(v13, "vs_setPropertyListKey:", @"PSSSDateModified");
  [v13 setAttributeType:900];
  [v13 setOptional:0];
  v80 = v13;
  [v9 addObject:v13];
  id v14 = objc_alloc_init(MEMORY[0x1E4F1C008]);
  objc_msgSend(v14, "vs_setPropertyListKey:", @"PSSSSubscriptionInfo");
  [v14 setAttributeType:700];
  [v14 setOptional:a3 < 1];
  [v14 setDefaultValue:&stru_1F34B2EC8];
  v15 = (void *)[v14 copy];
  objc_msgSend(v15, "vs_setSubscriptionKeyPath:", @"providedSubscriptionInfo");
  [v8 addObject:v15];
  [v15 setName:@"providedSubscriptionInfo"];
  v81 = v15;
  [v9 addObject:v15];
  v79 = v14;
  v16 = (void *)[v14 copy];
  objc_msgSend(v16, "vs_setSubscriptionKeyPath:", @"derivedSubscriptionInfo");
  [v8 addObject:v16];
  [v16 setTransient:1];
  [v16 setName:@"derivedSubscriptionInfo"];
  v78 = v16;
  objc_msgSend(v16, "vs_setSuitablePurposes:", 4);
  id v17 = objc_alloc_init(MEMORY[0x1E4F1C008]);
  [v8 addObject:v17];
  [v17 setName:@"sourceIdentifier"];
  objc_msgSend(v17, "vs_setSubscriptionKeyPath:", @"source.identifier");
  objc_msgSend(v17, "vs_setPropertyListKey:", @"PSSSIdentifier");
  [v17 setAttributeType:700];
  [v17 setOptional:0];
  [v9 addObject:v17];
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v20 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K >= 1", @"length");
  [v18 addObject:v20];

  [v19 addObject:&unk_1F34D0DC0];
  v76 = v19;
  v77 = v18;
  [v17 setValidationPredicates:v18 withValidationWarnings:v19];
  v84 = v17;
  v89 = v9;
  if (a3 < 1)
  {
    id v113 = v17;
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v113 count:1];
    id v114 = v21;
    v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v114 count:1];
    [v4 setUniquenessConstraints:v44];
  }
  else
  {
    id v21 = objc_alloc_init(MEMORY[0x1E4F1C008]);
    [v8 addObject:v21];
    [v21 setName:@"sourceKind"];
    objc_msgSend(v21, "vs_setSubscriptionKeyPath:", @"source.kind");
    objc_msgSend(v21, "vs_setPropertyListKey:", @"PSSSIdentifierType");
    objc_msgSend(v21, "vs_setPropertyListValueTransformerName:", @"VSSubscriptionSourceKindPropertyListValueTransformer");
    [v21 setAttributeType:100];
    [v21 setOptional:0];
    [v9 addObject:v21];
    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v24 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self >= %@", &unk_1F34D0DD8];
    [v22 addObject:v24];

    [v23 addObject:&unk_1F34D0DF0];
    v25 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self <= %@", &unk_1F34D0E08];
    [v22 addObject:v25];

    [v23 addObject:&unk_1F34D0E20];
    id v87 = v22;
    [v21 setValidationPredicates:v22 withValidationWarnings:v23];
    [v21 setDefaultValue:&unk_1F34D0DD8];
    if (a3 != 1)
    {
      id v26 = objc_alloc_init(MEMORY[0x1E4F1C008]);
      [v8 addObject:v26];
      [v26 setName:@"subscriberIdentifierHash"];
      objc_msgSend(v26, "vs_setSubscriptionKeyPath:", @"subscriberIdentifierHash");
      objc_msgSend(v26, "vs_setJSONKey:", @"account");
      objc_msgSend(v26, "vs_setJSONValueTransformerName:", @"VSSubscriptionAccountHashValueTransformer");
      [v26 setAttributeType:700];
      [v26 setOptional:0];
      [v26 setDefaultValue:&stru_1F34B2EC8];

      if ((unint64_t)a3 >= 3)
      {
        id v27 = objc_alloc_init(MEMORY[0x1E4F1C008]);
        [v8 addObject:v27];
        [v27 setName:@"billingIdentifier"];
        objc_msgSend(v27, "vs_setSubscriptionKeyPath:", @"billingIdentifier");
        objc_msgSend(v27, "vs_setJSONKey:", @"billingIdentifier");
        [v27 setAttributeType:700];
        [v27 setOptional:0];
        [v27 setDefaultValue:&stru_1F34B2EC8];
      }
    }
    id v28 = objc_alloc_init(MEMORY[0x1E4F1C008]);
    [v8 addObject:v28];
    [v28 setName:@"accessLevel"];
    objc_msgSend(v28, "vs_setSubscriptionKeyPath:", @"accessLevel");
    objc_msgSend(v28, "vs_setJSONKey:", @"availabilityType");
    objc_msgSend(v28, "vs_setRequiredJSONValue:", 1);
    v122[0] = objc_opt_class();
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v122 count:1];
    objc_msgSend(v28, "vs_setExpectedJSONValueClasses:", v29);

    objc_msgSend(v28, "vs_setJSONValueTransformerName:", @"VSSubscriptionAvailabilityTypeJSONValueTransformer");
    [v28 setAttributeType:100];
    [v28 setOptional:0];
    [v28 setDefaultValue:&unk_1F34D0DD8];
    id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v32 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self >= %@", &unk_1F34D0DD8];
    [v30 addObject:v32];

    [v31 addObject:&unk_1F34D0DF0];
    v33 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self <= %@", &unk_1F34D0E38];
    [v30 addObject:v33];

    [v31 addObject:&unk_1F34D0E20];
    [v28 setValidationPredicates:v30 withValidationWarnings:v31];
    id v34 = objc_alloc_init(MEMORY[0x1E4F1C008]);
    [v8 addObject:v34];
    [v34 setName:@"tierIdentifiers"];
    objc_msgSend(v34, "vs_setSubscriptionKeyPath:", @"tierIdentifiers");
    objc_msgSend(v34, "vs_setJSONKey:", @"tiers");
    v121[0] = objc_opt_class();
    v121[1] = objc_opt_class();
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v121 count:2];
    objc_msgSend(v34, "vs_setExpectedJSONValueClasses:", v35);

    [v34 setAttributeType:1800];
    [v34 setValueTransformerName:*MEMORY[0x1E4F288C0]];
    [v34 setOptional:0];
    [v34 setDefaultValue:MEMORY[0x1E4F1CBF0]];
    v36 = (objc_class *)objc_opt_class();
    v37 = NSStringFromClass(v36);
    [v34 setAttributeValueClassName:v37];

    v119[0] = v21;
    v119[1] = v84;
    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v119 count:2];
    v120 = v38;
    v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v120 count:1];
    [v4 setUniquenessConstraints:v39];

    v118[0] = v21;
    v118[1] = v84;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v118 count:2];
    [v91 addObject:v40];

    v117[0] = v21;
    v117[1] = v84;
    v117[2] = v83;
    v117[3] = v82;
    v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v117 count:4];
    [v91 addObject:v41];

    v116[0] = v81;
    v116[1] = v21;
    v116[2] = v84;
    v116[3] = v83;
    v116[4] = v82;
    v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v116 count:5];
    [v91 addObject:v42];

    v115[0] = v21;
    v115[1] = v82;
    v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v115 count:2];
    [v91 addObject:v43];

    unint64_t v7 = 0x1E4F1C000;
    v44 = v87;
  }

  [v4 setProperties:v8];
  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id v45 = v8;
  uint64_t v46 = [v45 countByEnumeratingWithState:&v105 objects:v112 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v106;
    uint64_t v49 = *MEMORY[0x1E4F288C0];
    do
    {
      for (uint64_t i = 0; i != v47; ++i)
      {
        if (*(void *)v106 != v48) {
          objc_enumerationMutation(v45);
        }
        [*(id *)(*((void *)&v105 + 1) + 8 * i) setValueTransformerName:v49];
      }
      uint64_t v47 = [v45 countByEnumeratingWithState:&v105 objects:v112 count:16];
    }
    while (v47);
  }
  v75 = v45;

  objc_msgSend(v4, "vs_setReferenceValueAttribute:", v84);
  id v51 = objc_alloc_init(*(Class *)(v7 + 2632));
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  obuint64_t j = v89;
  uint64_t v52 = [obj countByEnumeratingWithState:&v101 objects:v111 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v102;
    do
    {
      for (uint64_t j = 0; j != v53; ++j)
      {
        if (*(void *)v102 != v54) {
          objc_enumerationMutation(obj);
        }
        v56 = *(void **)(*((void *)&v101 + 1) + 8 * j);
        v57 = [v56 name];
        id v58 = objc_alloc_init(*(Class *)(v7 + 2632));
        v59 = (void *)[objc_alloc(MEMORY[0x1E4F1C0C8]) initWithProperty:v56 collationType:0];
        [v58 addObject:v59];

        v60 = (void *)[objc_alloc(MEMORY[0x1E4F1C0C0]) initWithName:v57 elements:v58];
        [v51 addObject:v60];
      }
      uint64_t v53 = [obj countByEnumeratingWithState:&v101 objects:v111 count:16];
    }
    while (v53);
  }

  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id v85 = v91;
  uint64_t v92 = [v85 countByEnumeratingWithState:&v97 objects:v110 count:16];
  if (v92)
  {
    v88 = v51;
    uint64_t v90 = *(void *)v98;
    do
    {
      for (uint64_t k = 0; k != v92; ++k)
      {
        if (*(void *)v98 != v90) {
          objc_enumerationMutation(v85);
        }
        v62 = *(void **)(*((void *)&v97 + 1) + 8 * k);
        v63 = [v62 valueForKeyPath:@"name"];
        v64 = v63;
        if (v63)
        {
          v65 = [v63 componentsJoinedByString:@"_"];
          id v66 = objc_alloc_init(*(Class *)(v7 + 2632));
          long long v93 = 0u;
          long long v94 = 0u;
          long long v95 = 0u;
          long long v96 = 0u;
          id v67 = v62;
          uint64_t v68 = [v67 countByEnumeratingWithState:&v93 objects:v109 count:16];
          if (v68)
          {
            uint64_t v69 = v68;
            uint64_t v70 = *(void *)v94;
            do
            {
              for (uint64_t m = 0; m != v69; ++m)
              {
                if (*(void *)v94 != v70) {
                  objc_enumerationMutation(v67);
                }
                v72 = (void *)[objc_alloc(MEMORY[0x1E4F1C0C8]) initWithProperty:*(void *)(*((void *)&v93 + 1) + 8 * m) collationType:0];
                [v66 addObject:v72];
              }
              uint64_t v69 = [v67 countByEnumeratingWithState:&v93 objects:v109 count:16];
            }
            while (v69);
          }

          v73 = (void *)[objc_alloc(MEMORY[0x1E4F1C0C0]) initWithName:v65 elements:v66];
          id v51 = v88;
          [v88 addObject:v73];

          unint64_t v7 = 0x1E4F1C000;
        }
      }
      uint64_t v92 = [v85 countByEnumeratingWithState:&v97 objects:v110 count:16];
    }
    while (v92);
  }

  [v4 setIndexes:v51];

  return v4;
}

@end