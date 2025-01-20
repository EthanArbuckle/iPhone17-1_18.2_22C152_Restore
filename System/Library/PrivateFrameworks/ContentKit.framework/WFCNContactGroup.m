@interface WFCNContactGroup
+ (id)allContactGroups;
+ (id)contactGroupWithCNGroup:(id)a3;
- (BOOL)containsContact:(id)a3;
- (CNGroup)group;
- (NSArray)cachedMembers;
- (NSArray)contacts;
- (WFCNContactGroup)initWithCNGroup:(id)a3;
- (id)name;
- (void)setCachedMembers:(id)a3;
@end

@implementation WFCNContactGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedMembers, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

- (void)setCachedMembers:(id)a3
{
}

- (CNGroup)group
{
  return self->_group;
}

- (BOOL)containsContact:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v5 = [(WFCNContactGroup *)self cachedMembers];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v25 + 1) + 8 * i) identifier];
          v11 = [v4 contact];
          v12 = [v11 identifier];
          char v13 = [v10 isEqualToString:v12];

          if (v13)
          {
            LOBYTE(v14) = 1;
            goto LABEL_23;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    LOBYTE(v14) = 0;
  }
  else
  {
    v5 = [v4 formattedName];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v15 = [(WFCNContactGroup *)self cachedMembers];
    uint64_t v14 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v14)
    {
      uint64_t v16 = *(void *)v22;
      while (2)
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v15);
          }
          v18 = [getCNContactFormatterClass() stringFromContact:*(void *)(*((void *)&v21 + 1) + 8 * j) style:0];
          char v19 = [v18 isEqualToString:v5];

          if (v19)
          {
            LOBYTE(v14) = 1;
            goto LABEL_22;
          }
        }
        uint64_t v14 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_22:
  }
LABEL_23:

  return v14;
}

- (NSArray)cachedMembers
{
  v14[1] = *MEMORY[0x263EF8340];
  cachedMembers = self->_cachedMembers;
  if (!cachedMembers)
  {
    id CNContactClass = getCNContactClass();
    v5 = [(WFCNContactGroup *)self group];
    uint64_t v6 = [v5 identifier];
    uint64_t v7 = [CNContactClass predicateForContactsInGroupWithIdentifier:v6];

    getCNContactStoreClass();
    uint64_t v8 = objc_opt_new();
    v9 = [getCNContactFormatterClass() descriptorForRequiredKeysForStyle:0];
    v14[0] = v9;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    v11 = [v8 unifiedContactsMatchingPredicate:v7 keysToFetch:v10 error:0];
    v12 = self->_cachedMembers;
    self->_cachedMembers = v11;

    cachedMembers = self->_cachedMembers;
  }
  return cachedMembers;
}

- (NSArray)contacts
{
  id CNContactClass = getCNContactClass();
  id v4 = [(WFCNContactGroup *)self group];
  v5 = [v4 identifier];
  uint64_t v6 = [CNContactClass predicateForContactsInGroupWithIdentifier:v5];

  getCNContactStoreClass();
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = +[WFCNContact requiredKeysToFetch];
  v9 = [v7 unifiedContactsMatchingPredicate:v6 keysToFetch:v8 error:0];
  v10 = objc_msgSend(v9, "if_map:", &__block_literal_global_234);

  return (NSArray *)v10;
}

WFCNContact *__28__WFCNContactGroup_contacts__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[WFCNContact contactWithCNContact:a2];
}

- (id)name
{
  v2 = [(WFCNContactGroup *)self group];
  v3 = [v2 name];

  return v3;
}

- (WFCNContactGroup)initWithCNGroup:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFCNContact.m", 864, @"Invalid parameter not satisfying: %@", @"group" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFCNContactGroup;
  uint64_t v7 = [(WFCNContactGroup *)&v12 init];
  uint64_t v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_group, a3);
    v9 = v8;
  }

  return v8;
}

+ (id)contactGroupWithCNGroup:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithCNGroup:v4];

  return v5;
}

+ (id)allContactGroups
{
  if (WFCNContactAuthorizationStatus() == 3)
  {
    getCNContactStoreClass();
    v3 = objc_opt_new();
    id v4 = [v3 groupsMatchingPredicate:0 error:0];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __36__WFCNContactGroup_allContactGroups__block_invoke;
    v7[3] = &__block_descriptor_40_e20__24__0__CNGroup_8Q16l;
    v7[4] = a1;
    v5 = objc_msgSend(v4, "if_map:", v7);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

uint64_t __36__WFCNContactGroup_allContactGroups__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) contactGroupWithCNGroup:a2];
}

@end