@interface HFAccessoryProfileGroup
+ (id)_groupIdentifierForProfile:(id)a3 options:(id)a4;
+ (id)_groupProfilesKeyedByIdentifier:(id)a3 options:(id)a4;
+ (id)_hashCombiningHashes:(id)a3;
+ (id)groupProfiles:(id)a3 options:(id)a4;
- (HFAccessoryProfileGroup)initWithProfiles:(id)a3 groupIdentifier:(id)a4;
- (NSArray)profiles;
- (NSNumber)groupIdentifier;
@end

@implementation HFAccessoryProfileGroup

+ (id)groupProfiles:(id)a3 options:(id)a4
{
  v5 = [a1 _groupProfilesKeyedByIdentifier:a3 options:a4];
  v6 = [v5 allKeys];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __49__HFAccessoryProfileGroup_groupProfiles_options___block_invoke;
  v10[3] = &unk_264098D90;
  id v11 = v5;
  id v12 = a1;
  id v7 = v5;
  v8 = objc_msgSend(v6, "na_map:", v10);

  return v8;
}

id __49__HFAccessoryProfileGroup_groupProfiles_options___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 objectForKey:v4];
  v6 = (void *)[objc_alloc(*(Class *)(a1 + 40)) initWithProfiles:v5 groupIdentifier:v4];

  return v6;
}

- (HFAccessoryProfileGroup)initWithProfiles:(id)a3 groupIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFAccessoryProfileGroup;
  v9 = [(HFAccessoryProfileGroup *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_profiles, a3);
    objc_storeStrong((id *)&v10->_groupIdentifier, a4);
  }

  return v10;
}

+ (id)_groupProfilesKeyedByIdentifier:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x263EFF9A0];
  id v8 = a3;
  v9 = [v7 dictionary];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __67__HFAccessoryProfileGroup__groupProfilesKeyedByIdentifier_options___block_invoke;
  v15[3] = &unk_264098DB8;
  id v18 = a1;
  id v16 = v6;
  id v10 = v9;
  id v17 = v10;
  id v11 = v6;
  objc_msgSend(v8, "na_each:", v15);

  objc_super v12 = v17;
  id v13 = v10;

  return v13;
}

void __67__HFAccessoryProfileGroup__groupProfilesKeyedByIdentifier_options___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 48), "_groupIdentifierForProfile:options:");
  id v4 = [*(id *)(a1 + 40) objectForKey:v3];
  if (!v4)
  {
    id v4 = [MEMORY[0x263EFF980] array];
  }
  [v4 addObject:v5];
  [*(id *)(a1 + 40) setObject:v4 forKey:v3];
}

+ (id)_groupIdentifierForProfile:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263EFF980] array];
  if ([v7 byCategoryType])
  {
    v9 = NSNumber;
    id v10 = [v6 accessory];
    id v11 = [v10 category];
    objc_super v12 = [v11 categoryType];
    id v13 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v12, "hash"));
    [v8 addObject:v13];
  }
  if ([v7 byClass])
  {
    v14 = NSNumber;
    v15 = (objc_class *)objc_opt_class();
    id v16 = NSStringFromClass(v15);
    id v17 = objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v16, "hash"));
    [v8 addObject:v17];
  }
  if ([v7 byManufacturer])
  {
    id v18 = NSNumber;
    v19 = [v6 accessory];
    v20 = [v19 manufacturer];
    v21 = objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v20, "hash"));
    [v8 addObject:v21];
  }
  if ([v7 byModel])
  {
    v22 = NSNumber;
    v23 = [v6 accessory];
    v24 = [v23 model];
    v25 = objc_msgSend(v22, "numberWithUnsignedInteger:", objc_msgSend(v24, "hash"));
    [v8 addObject:v25];
  }
  if ([v7 byRoom])
  {
    v26 = NSNumber;
    v27 = [v6 accessory];
    v28 = [v27 room];
    v29 = [v28 uniqueIdentifier];
    v30 = objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v29, "hash"));
    [v8 addObject:v30];
  }
  v31 = [a1 _hashCombiningHashes:v8];

  return v31;
}

+ (id)_hashCombiningHashes:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v6 = [*(id *)(*((void *)&v11 + 1) + 8 * i) unsignedIntegerValue] + 131 * v6;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }
  v9 = [NSNumber numberWithUnsignedInteger:v6];

  return v9;
}

- (NSArray)profiles
{
  return self->_profiles;
}

- (NSNumber)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_profiles, 0);
}

@end