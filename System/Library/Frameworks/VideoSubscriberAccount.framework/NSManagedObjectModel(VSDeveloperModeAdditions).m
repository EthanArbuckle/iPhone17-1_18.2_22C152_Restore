@interface NSManagedObjectModel(VSDeveloperModeAdditions)
+ (id)vs_developerModeModelForVersion:()VSDeveloperModeAdditions;
+ (id)vs_identityProviderEntityForVersion:()VSDeveloperModeAdditions;
@end

@implementation NSManagedObjectModel(VSDeveloperModeAdditions)

+ (id)vs_developerModeModelForVersion:()VSDeveloperModeAdditions
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1C120]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v7 = objc_msgSend(a1, "vs_identityProviderEntityForVersion:", a3);
  [v6 addObject:v7];
  [v5 setEntities:v6];

  return v5;
}

+ (id)vs_identityProviderEntityForVersion:()VSDeveloperModeAdditions
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1C0A8]);
  [v4 setName:@"IdentityProvider"];
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v4 setManagedObjectClassName:v6];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F1C008]);
  [v7 addObject:v9];
  [v9 setName:@"uniqueID"];
  [v9 setAttributeType:700];
  [v9 setOptional:0];
  [v8 addObject:v9];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1C008]);
  [v7 addObject:v10];
  [v10 setName:@"providerID"];
  [v10 setAttributeType:700];
  [v10 setOptional:0];
  v40 = v10;
  [v8 addObject:v10];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1C008]);
  [v7 addObject:v11];
  [v11 setName:@"nameForSorting"];
  [v11 setAttributeType:700];
  [v11 setOptional:0];
  v39 = v11;
  [v8 addObject:v11];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1C008]);
  [v7 addObject:v12];
  [v12 setName:@"authenticationURL"];
  [v12 setAttributeType:700];
  v38 = v12;
  [v12 setOptional:0];
  if (a3 >= 1)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1C008]);
    [v7 addObject:v13];
    [v13 setName:@"certificateURL"];
    [v13 setAttributeType:700];
    [v13 setOptional:1];

    if (a3 != 1)
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F1C008]);
      [v7 addObject:v14];
      [v14 setName:@"authenticationSchemes"];
      [v14 setAttributeType:1800];
      [v14 setOptional:1];

      if ((unint64_t)a3 >= 3)
      {
        id v15 = objc_alloc_init(MEMORY[0x1E4F1C008]);
        [v7 addObject:v15];
        [v15 setName:@"requireBootUrlSystemTrust"];
        [v15 setAttributeType:800];
        [v15 setOptional:1];
        id v16 = objc_alloc_init(MEMORY[0x1E4F1C008]);
        [v7 addObject:v16];
        [v16 setName:@"requireXHRRequestSystemTrust"];
        [v16 setAttributeType:800];
        [v16 setOptional:1];
      }
    }
  }
  [v4 setProperties:v7];
  v41 = v9;
  id v52 = v9;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
  v53[0] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1];
  [v4 setUniquenessConstraints:v18];

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v19 = v7;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v47;
    uint64_t v23 = *MEMORY[0x1E4F288C0];
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v47 != v22) {
          objc_enumerationMutation(v19);
        }
        [*(id *)(*((void *)&v46 + 1) + 8 * i) setValueTransformerName:v23];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v21);
  }
  v37 = v19;

  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v26 = v8;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v43 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = *(void **)(*((void *)&v42 + 1) + 8 * j);
        v32 = objc_msgSend(v31, "name", v37);
        id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v34 = (void *)[objc_alloc(MEMORY[0x1E4F1C0C8]) initWithProperty:v31 collationType:0];
        [v33 addObject:v34];

        v35 = (void *)[objc_alloc(MEMORY[0x1E4F1C0C0]) initWithName:v32 elements:v33];
        [v25 addObject:v35];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v28);
  }

  [v4 setIndexes:v25];

  return v4;
}

@end