@interface CNPropertyGroupsDataSource
- (CNContactStore)contactStore;
- (CNMutableContact)mutableContact;
- (CNPolicy)policy;
- (CNPropertyGroupsDataSource)initWithMutableContact:(id)a3 contactStore:(id)a4 policy:(id)a5 linkedPolicies:(id)a6 prohibitedKeys:(id)a7;
- (Class)groupClassForProperty:(id)a3;
- (NSArray)prohibitedPropertyKeys;
- (NSDictionary)linkedPoliciesByContactIdentifier;
- (NSDictionary)propertyGroups;
- (id)allDisplayPropertyItemsForPropertyKeys:(id)a3;
- (id)allDisplayPropertyItemsFromGroups:(id)a3;
- (id)propertyGroupsForKeys:(id)a3;
- (void)buildPropertyGroups;
- (void)setContactStore:(id)a3;
- (void)setLinkedPoliciesByContactIdentifier:(id)a3;
- (void)setMutableContact:(id)a3;
- (void)setPolicy:(id)a3;
- (void)setProhibitedPropertyKeys:(id)a3;
- (void)setPropertyGroups:(id)a3;
@end

@implementation CNPropertyGroupsDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, 0);
  objc_storeStrong((id *)&self->_linkedPoliciesByContactIdentifier, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_mutableContact, 0);

  objc_storeStrong((id *)&self->_propertyGroups, 0);
}

- (void)setProhibitedPropertyKeys:(id)a3
{
}

- (NSArray)prohibitedPropertyKeys
{
  return self->_prohibitedPropertyKeys;
}

- (void)setLinkedPoliciesByContactIdentifier:(id)a3
{
}

- (NSDictionary)linkedPoliciesByContactIdentifier
{
  return self->_linkedPoliciesByContactIdentifier;
}

- (void)setPolicy:(id)a3
{
}

- (CNPolicy)policy
{
  return self->_policy;
}

- (void)setContactStore:(id)a3
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setMutableContact:(id)a3
{
}

- (CNMutableContact)mutableContact
{
  return self->_mutableContact;
}

- (void)setPropertyGroups:(id)a3
{
}

- (NSDictionary)propertyGroups
{
  return self->_propertyGroups;
}

- (id)allDisplayPropertyItemsFromGroups:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        v10 = [v9 displayItems];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v19;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v19 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                [v4 addObject:v15];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v12);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)allDisplayPropertyItemsForPropertyKeys:(id)a3
{
  v4 = [(CNPropertyGroupsDataSource *)self propertyGroupsForKeys:a3];
  uint64_t v5 = [(CNPropertyGroupsDataSource *)self allDisplayPropertyItemsFromGroups:v4];

  return v5;
}

- (id)propertyGroupsForKeys:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = [(CNPropertyGroupsDataSource *)self propertyGroups];
        uint64_t v13 = [v12 objectForKeyedSubscript:v11];

        if (v13) {
          [v5 addObject:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (Class)groupClassForProperty:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:*MEMORY[0x1E4F1ADA0]] & 1) == 0
    && ([v3 isEqualToString:*MEMORY[0x1E4F1AF90]] & 1) == 0
    && ([v3 isEqualToString:*MEMORY[0x1E4F1AF18]] & 1) == 0)
  {
    [v3 isEqualToString:*MEMORY[0x1E4F1ADC0]];
  }
  id v4 = objc_opt_class();

  return (Class)v4;
}

- (void)buildPropertyGroups
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__CNPropertyGroupsDataSource_buildPropertyGroups__block_invoke;
  aBlock[3] = &unk_1E549BA70;
  aBlock[4] = self;
  id v16 = v3;
  id v22 = v16;
  id v4 = (void (**)(void *, void *))_Block_copy(aBlock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = +[CNContactView allCardProperties];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    uint64_t v9 = *MEMORY[0x1E4F1ADC0];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v11, "isEqualToString:", v9, v16))
        {
          uint64_t v12 = (void *)MEMORY[0x1E4F1B9C8];
          uint64_t v13 = [(CNPropertyGroupsDataSource *)self mutableContact];
          LODWORD(v12) = [v12 isWhitelistedContact:v13];

          if (!v12) {
            continue;
          }
        }
        v14 = [(CNPropertyGroupsDataSource *)self prohibitedPropertyKeys];
        char v15 = [v14 containsObject:v11];

        if ((v15 & 1) == 0) {
          v4[2](v4, v11);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v7);
  }

  v4[2](v4, (void *)*MEMORY[0x1E4F1AF18]);
  [(CNPropertyGroupsDataSource *)self setPropertyGroups:v16];
}

void __49__CNPropertyGroupsDataSource_buildPropertyGroups__block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = [*(id *)(a1 + 32) policy];
  uint64_t v4 = objc_msgSend(v3, "_cnui_maximumNumberOfValuesForProperty:", v11);

  if (v4)
  {
    uint64_t v5 = (void *)[*(id *)(a1 + 32) groupClassForProperty:v11];
    uint64_t v6 = [*(id *)(a1 + 32) mutableContact];
    uint64_t v7 = [*(id *)(a1 + 32) contactStore];
    uint64_t v8 = [*(id *)(a1 + 32) policy];
    uint64_t v9 = [*(id *)(a1 + 32) linkedPoliciesByContactIdentifier];
    v10 = [v5 groupForProperty:v11 contact:v6 store:v7 policy:v8 linkedPolicies:v9];

    [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:v11];
  }
}

- (CNPropertyGroupsDataSource)initWithMutableContact:(id)a3 contactStore:(id)a4 policy:(id)a5 linkedPolicies:(id)a6 prohibitedKeys:(id)a7
{
  id v21 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)CNPropertyGroupsDataSource;
  long long v17 = [(CNPropertyGroupsDataSource *)&v22 init];
  long long v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_mutableContact, a3);
    objc_storeStrong((id *)&v18->_contactStore, a4);
    objc_storeStrong((id *)&v18->_policy, a5);
    objc_storeStrong((id *)&v18->_linkedPoliciesByContactIdentifier, a6);
    objc_storeStrong((id *)&v18->_prohibitedPropertyKeys, a7);
    long long v19 = v18;
  }

  return v18;
}

@end