@interface CNContactStoreFilter
+ (BOOL)getContainerIdentifiers:(id *)a3 groupIdentifiers:(id *)a4 serverFilter:(BOOL *)a5 fromLegacyDictionary:(id)a6 contactStore:(id)a7;
+ (BOOL)getContainerIdentifiers:(id *)a3 groupIdentifiers:(id *)a4 serverFilter:(BOOL *)a5 fromPreSundanceDictionary:(id)a6 contactStore:(id)a7;
+ (BOOL)getContainerIdentifiers:(id *)a3 groupIdentifiers:(id *)a4 serverFilter:(BOOL *)a5 fromSundanceToOkemoAndAddressBookUIDictionary:(id)a6 contactStore:(id)a7;
+ (id)contactStoreFilterFromPreferencesWithContactStore:(id)a3;
+ (id)excludedContainerIdentifiersDictionaryKey;
+ (id)excludedGroupIdentifiersDictionaryKey;
+ (id)isServerFilterDictionaryKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)isServerFilter;
- (BOOL)showsEverything;
- (BOOL)supportsSections;
- (CNContactStoreFilter)initWithDictionaryRepresentation:(id)a3;
- (CNContactStoreFilter)initWithDictionaryRepresentation:(id)a3 contactStore:(id)a4;
- (NSSet)containerIdentifiers;
- (NSSet)groupIdentifiers;
- (NSSet)limitedAccessIdentifiers;
- (NSString)customDisplayName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)dictionaryRepresentationWithContactStore:(id)a3;
- (id)predicate;
- (int)limitedAccessFilterMode;
- (void)addAddressBookUIKeysToDictionaryRepresentation:(id)a3 withAllContainers:(id)a4 excludedContainers:(id)a5 excludedGroups:(id)a6;
- (void)saveToPreferencesWithContactStore:(id)a3;
- (void)setContainerIdentifiers:(id)a3;
- (void)setCustomDisplayName:(id)a3;
- (void)setGroupIdentifiers:(id)a3;
- (void)setIsServerFilter:(BOOL)a3;
- (void)setLimitedAccessFilterMode:(int)a3;
- (void)setLimitedAccessIdentifiers:(id)a3;
@end

@implementation CNContactStoreFilter

- (BOOL)showsEverything
{
  v3 = [(CNContactStoreFilter *)self predicate];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    v5 = [(CNContactStoreFilter *)self limitedAccessIdentifiers];
    BOOL v4 = v5 == 0;
  }
  return v4;
}

- (NSSet)limitedAccessIdentifiers
{
  return self->_limitedAccessIdentifiers;
}

- (id)predicate
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  BOOL v4 = [(CNContactFilter *)self fullTextString];
  uint64_t v5 = [(CNContactStoreFilter *)self containerIdentifiers];
  uint64_t v6 = [(CNContactStoreFilter *)self groupIdentifiers];
  if ([v4 length])
  {
    v7 = (void *)MEMORY[0x1E4F1B8F8];
    v8 = [(id)v5 allObjects];
    v9 = [(id)v6 allObjects];
    uint64_t v10 = [v7 predicateForContactsMatchingFullTextSearch:v4 containerIdentifiers:v8 groupIdentifiers:v9];
LABEL_3:
    v11 = (void *)v10;

    [v3 addObject:v11];
    goto LABEL_4;
  }
  if (v5 | v6 && ![(CNContactStoreFilter *)self isServerFilter])
  {
    v12 = (void *)MEMORY[0x1E4F1B8F8];
    v8 = [(id)v5 allObjects];
    v9 = [(id)v6 allObjects];
    uint64_t v10 = [v12 predicateForPreferredNameInContainersWithIdentifiers:v8 groupsWithIdentifiers:v9];
    goto LABEL_3;
  }
LABEL_4:
  if ([v3 count])
  {
    if ([v3 count] == 1) {
      [v3 firstObject];
    }
    else {
    v13 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v3];
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSSet)containerIdentifiers
{
  return self->_containerIdentifiers;
}

- (NSSet)groupIdentifiers
{
  return self->_groupIdentifiers;
}

- (BOOL)supportsSections
{
  v2 = [(CNContactFilter *)self fullTextString];
  BOOL v3 = v2 == 0;

  return v3;
}

- (NSString)customDisplayName
{
  return self->_customDisplayName;
}

+ (id)contactStoreFilterFromPreferencesWithContactStore:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1B9A8] sharedDefaults];
  uint64_t v6 = [v5 filteredGroupAndContainerIDs];

  if (v6)
  {
    v7 = [v6 objectForKeyedSubscript:@"CNContactFilterDictionaryKeyFullTextString"];

    if (v7)
    {
      uint64_t v8 = objc_msgSend(v6, "_cn_filter:", &__block_literal_global_82);

      uint64_t v6 = (void *)v8;
    }
    v9 = (void *)[objc_alloc((Class)a1) initWithDictionaryRepresentation:v6 contactStore:v4];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (v20.receiver = self,
        v20.super_class = (Class)CNContactStoreFilter,
        ![(CNContactFilter *)&v20 isEqual:v5]))
  {
    LOBYTE(v12) = 0;
    goto LABEL_26;
  }
  id v6 = v5;
  v7 = v6;
  containerIdentifiers = self->_containerIdentifiers;
  v9 = containerIdentifiers;
  if (!containerIdentifiers)
  {
    uint64_t v10 = [v6 containerIdentifiers];
    if (!v10)
    {
      v19 = 0;
      int v11 = 0;
      goto LABEL_11;
    }
    v19 = (void *)v10;
    v9 = self->_containerIdentifiers;
  }
  BOOL v3 = [v7 containerIdentifiers];
  if (![v9 isEqual:v3])
  {
    LOBYTE(v12) = 0;
    goto LABEL_22;
  }
  int v11 = 1;
LABEL_11:
  uint64_t v13 = 32;
  groupIdentifiers = self->_groupIdentifiers;
  v15 = groupIdentifiers;
  if (!groupIdentifiers)
  {
    v9 = [v7 groupIdentifiers];
    if (!v9)
    {
      int v16 = 0;
LABEL_18:
      BOOL v17 = [(CNContactStoreFilter *)self isServerFilter];
      int v12 = v17 ^ [v7 isServerFilter] ^ 1;
      if (!v16) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
    v15 = self->_groupIdentifiers;
  }
  uint64_t v13 = [v7 groupIdentifiers];
  if ([(NSSet *)v15 isEqual:v13])
  {
    int v16 = 1;
    goto LABEL_18;
  }
  LOBYTE(v12) = 0;
LABEL_19:

LABEL_20:
  if (!groupIdentifiers)
  {

    if ((v11 & 1) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  if (v11) {
LABEL_22:
  }

LABEL_23:
  if (!containerIdentifiers) {

  }
LABEL_26:
  return v12;
}

- (BOOL)isServerFilter
{
  return self->_isServerFilter;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CNContactStoreFilter;
  id v4 = [(CNContactFilter *)&v10 copyWithZone:a3];
  id v5 = [(CNContactStoreFilter *)self containerIdentifiers];
  [v4 setContainerIdentifiers:v5];

  id v6 = [(CNContactStoreFilter *)self groupIdentifiers];
  [v4 setGroupIdentifiers:v6];

  [v4 setIsServerFilter:self->_isServerFilter];
  v7 = [(CNContactStoreFilter *)self limitedAccessIdentifiers];
  [v4 setLimitedAccessIdentifiers:v7];

  uint64_t v8 = [(CNContactStoreFilter *)self customDisplayName];
  [v4 setCustomDisplayName:v8];

  objc_msgSend(v4, "setLimitedAccessFilterMode:", -[CNContactStoreFilter limitedAccessFilterMode](self, "limitedAccessFilterMode"));
  return v4;
}

- (void)setLimitedAccessIdentifiers:(id)a3
{
}

- (void)setLimitedAccessFilterMode:(int)a3
{
  self->_limitedAccessFilterMode = a3;
}

- (void)setIsServerFilter:(BOOL)a3
{
  self->_isServerFilter = a3;
}

- (void)setGroupIdentifiers:(id)a3
{
}

- (void)setCustomDisplayName:(id)a3
{
}

- (void)setContainerIdentifiers:(id)a3
{
}

- (int)limitedAccessFilterMode
{
  return self->_limitedAccessFilterMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customDisplayName, 0);
  objc_storeStrong((id *)&self->_limitedAccessIdentifiers, 0);
  objc_storeStrong((id *)&self->_containerIdentifiers, 0);

  objc_storeStrong((id *)&self->_groupIdentifiers, 0);
}

- (void)saveToPreferencesWithContactStore:(id)a3
{
  id v6 = [(CNContactStoreFilter *)self dictionaryRepresentationWithContactStore:a3];
  BOOL v3 = [v6 objectForKeyedSubscript:@"CNContactFilterDictionaryKeyFullTextString"];

  if (v3)
  {
    uint64_t v4 = objc_msgSend(v6, "_cn_filter:", &__block_literal_global_84);

    id v6 = (id)v4;
  }
  id v5 = [MEMORY[0x1E4F1B9A8] sharedDefaults];
  [v5 setFilteredGroupAndContainerIDs:v6];
}

uint64_t __58__CNContactStoreFilter_saveToPreferencesWithContactStore___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqualToString:@"CNContactFilterDictionaryKeyFullTextString"] ^ 1;
}

- (id)description
{
  BOOL v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)CNContactStoreFilter;
  uint64_t v4 = [(CNContactFilter *)&v7 description];
  id v5 = [v3 stringWithFormat:@"%@ containerIdentifiers: %@, groupIdentifiers: %@", v4, self->_containerIdentifiers, self->_groupIdentifiers];

  return v5;
}

- (void)addAddressBookUIKeysToDictionaryRepresentation:(id)a3 withAllContainers:(id)a4 excludedContainers:(id)a5 excludedGroups:(id)a6
{
  id v17 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([(CNContactStoreFilter *)self isServerFilter])
  {
    uint64_t v13 = [v10 firstObject];
    v14 = v13;
    if (!v13) {
      goto LABEL_6;
    }
    v15 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v13, "iOSLegacyIdentifier"));
    int v16 = @"kABContactsFilter_DirectorySourceID";
  }
  else
  {
    v14 = objc_msgSend(v11, "_cn_map:", &__block_literal_global_63);
    [v17 setObject:v14 forKeyedSubscript:@"kABContactsFilter_ExcludedSourceIDs"];
    v15 = objc_msgSend(v12, "_cn_map:", &__block_literal_global_66);
    int v16 = @"kABContactsFilter_ExcludedGroupIDs";
  }
  [v17 setObject:v15 forKeyedSubscript:v16];

LABEL_6:
}

uint64_t __123__CNContactStoreFilter_addAddressBookUIKeysToDictionaryRepresentation_withAllContainers_excludedContainers_excludedGroups___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 iOSLegacyIdentifier];

  return [v2 numberWithInt:v3];
}

uint64_t __123__CNContactStoreFilter_addAddressBookUIKeysToDictionaryRepresentation_withAllContainers_excludedContainers_excludedGroups___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 iOSLegacyIdentifier];

  return [v2 numberWithInt:v3];
}

- (id)dictionaryRepresentationWithContactStore:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CNContactStoreFilter;
  id v5 = [(CNContactFilter *)&v21 dictionaryRepresentation];
  id v6 = (void *)[v5 mutableCopy];
  objc_super v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  v9 = v8;

  if (![(CNContactStoreFilter *)self showsEverything])
  {
    if ([(CNContactStoreFilter *)self isServerFilter]) {
      [v4 serverSearchContainersMatchingPredicate:0 error:0];
    }
    else {
    id v10 = [v4 containersMatchingPredicate:0 error:0];
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __65__CNContactStoreFilter_dictionaryRepresentationWithContactStore___block_invoke;
    v20[3] = &unk_1E549BDA0;
    v20[4] = self;
    id v11 = objc_msgSend(v10, "_cn_filter:", v20);
    id v12 = [v4 groupsMatchingPredicate:0 error:0];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __65__CNContactStoreFilter_dictionaryRepresentationWithContactStore___block_invoke_2;
    v19[3] = &unk_1E54996E8;
    v19[4] = self;
    uint64_t v13 = objc_msgSend(v12, "_cn_filter:", v19);
    v14 = objc_msgSend(NSNumber, "numberWithBool:", -[CNContactStoreFilter isServerFilter](self, "isServerFilter"));
    [v9 setObject:v14 forKeyedSubscript:@"CNContactStoreFilterDictionaryKeyIsServerFilter"];

    v15 = objc_msgSend(v11, "_cn_map:", &__block_literal_global_58);
    [v9 setObject:v15 forKeyedSubscript:@"CNContactStoreFilterDictionaryKeyExcludedContainerIdentifiers"];
    int v16 = objc_msgSend(v13, "_cn_map:", &__block_literal_global_60);
    [v9 setObject:v16 forKeyedSubscript:@"CNContactStoreFilterDictionaryKeyExcludedGroupIdentifiers"];
    [(CNContactStoreFilter *)self addAddressBookUIKeysToDictionaryRepresentation:v9 withAllContainers:v10 excludedContainers:v11 excludedGroups:v13];
  }
  id v17 = (void *)[v9 copy];

  return v17;
}

uint64_t __65__CNContactStoreFilter_dictionaryRepresentationWithContactStore___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 containerIdentifiers];
  id v5 = [v3 identifier];

  uint64_t v6 = [v4 containsObject:v5] ^ 1;
  return v6;
}

uint64_t __65__CNContactStoreFilter_dictionaryRepresentationWithContactStore___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 groupIdentifiers];
  id v5 = [v3 identifier];

  uint64_t v6 = [v4 containsObject:v5] ^ 1;
  return v6;
}

uint64_t __65__CNContactStoreFilter_dictionaryRepresentationWithContactStore___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __65__CNContactStoreFilter_dictionaryRepresentationWithContactStore___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  id v4 = [(CNContactStoreFilter *)self dictionaryRepresentationWithContactStore:v3];

  return v4;
}

- (CNContactStoreFilter)initWithDictionaryRepresentation:(id)a3 contactStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v36.receiver = self;
  v36.super_class = (Class)CNContactStoreFilter;
  id v8 = [(CNContactFilter *)&v36 initWithDictionaryRepresentation:v6];
  if (v8)
  {
    char v35 = 0;
    id v33 = 0;
    id v34 = 0;
    char v9 = [(id)objc_opt_class() getContainerIdentifiers:&v34 groupIdentifiers:&v33 serverFilter:&v35 fromLegacyDictionary:v6 contactStore:v7];
    id v10 = v34;
    id v11 = v33;
    if ((v9 & 1) == 0)
    {
      id v12 = [v6 objectForKeyedSubscript:@"CNContactStoreFilterDictionaryKeyIsServerFilter"];
      char v35 = [v12 BOOLValue];

      uint64_t v13 = [v6 objectForKeyedSubscript:@"CNContactStoreFilterDictionaryKeyExcludedContainerIdentifiers"];
      v14 = [v6 objectForKeyedSubscript:@"CNContactStoreFilterDictionaryKeyExcludedGroupIdentifiers"];
      if ([v13 count] || objc_msgSend(v14, "count"))
      {
        if (v35) {
          [v7 serverSearchContainersMatchingPredicate:0 error:0];
        }
        else {
        v15 = [v7 containersMatchingPredicate:0 error:0];
        }
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __70__CNContactStoreFilter_initWithDictionaryRepresentation_contactStore___block_invoke;
        v31[3] = &unk_1E549BDA0;
        id v32 = v13;
        int v16 = objc_msgSend(v15, "_cn_filter:", v31);
        uint64_t v25 = objc_msgSend(v16, "_cn_map:", &__block_literal_global_51);

        id v17 = [v7 groupsMatchingPredicate:0 error:0];
        uint64_t v26 = MEMORY[0x1E4F143A8];
        uint64_t v27 = 3221225472;
        v28 = __70__CNContactStoreFilter_initWithDictionaryRepresentation_contactStore___block_invoke_3;
        v29 = &unk_1E54996E8;
        id v30 = v14;
        v18 = objc_msgSend(v17, "_cn_filter:", &v26);
        uint64_t v19 = objc_msgSend(v18, "_cn_map:", &__block_literal_global_53);

        id v11 = (id)v19;
        id v10 = (id)v25;
      }
    }
    if (!objc_msgSend(v10, "count", v25, v26, v27, v28, v29))
    {

      id v10 = 0;
    }
    if (![v11 count])
    {

      id v11 = 0;
    }
    if (v10)
    {
      uint64_t v20 = [MEMORY[0x1E4F1CAD0] setWithArray:v10];
      containerIdentifiers = v8->_containerIdentifiers;
      v8->_containerIdentifiers = (NSSet *)v20;
    }
    if (v11)
    {
      uint64_t v22 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];
      groupIdentifiers = v8->_groupIdentifiers;
      v8->_groupIdentifiers = (NSSet *)v22;
    }
    v8->_isServerFilter = v35;
  }
  return v8;
}

uint64_t __70__CNContactStoreFilter_initWithDictionaryRepresentation_contactStore___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

uint64_t __70__CNContactStoreFilter_initWithDictionaryRepresentation_contactStore___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

uint64_t __70__CNContactStoreFilter_initWithDictionaryRepresentation_contactStore___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __70__CNContactStoreFilter_initWithDictionaryRepresentation_contactStore___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (CNContactStoreFilter)initWithDictionaryRepresentation:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F1B980];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [(CNContactStoreFilter *)self initWithDictionaryRepresentation:v5 contactStore:v6];

  return v7;
}

uint64_t __74__CNContactStoreFilter_contactStoreFilterFromPreferencesWithContactStore___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqualToString:@"CNContactFilterDictionaryKeyFullTextString"] ^ 1;
}

+ (BOOL)getContainerIdentifiers:(id *)a3 groupIdentifiers:(id *)a4 serverFilter:(BOOL *)a5 fromPreSundanceDictionary:(id)a6 contactStore:(id)a7
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v11 = a6;
  id v12 = a7;
  if (getContainerIdentifiers_groupIdentifiers_serverFilter_fromPreSundanceDictionary_contactStore__cn_once_token_2 != -1) {
    dispatch_once(&getContainerIdentifiers_groupIdentifiers_serverFilter_fromPreSundanceDictionary_contactStore__cn_once_token_2, &__block_literal_global_31_28182);
  }
  id v13 = (id)getContainerIdentifiers_groupIdentifiers_serverFilter_fromPreSundanceDictionary_contactStore__cn_once_object_2;
  int v16 = (void *)MEMORY[0x1E4F1CAD0];
  v14 = [v11 allKeys];
  v15 = [v16 setWithArray:v14];
  LODWORD(v16) = [v15 intersectsSet:v13];

  if (v16)
  {
    v49 = a3;
    id v17 = [v11 objectForKey:@"GroupID"];
    v18 = v17;
    v50 = a4;
    if (v17)
    {
      uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1BA00], "predicateForiOSLegacyIdentifier:", objc_msgSend(v17, "intValue"));
      uint64_t v20 = [v12 groupsMatchingPredicate:v19 error:0];

      objc_super v21 = 0;
      if ([v20 count] == 1)
      {
        objc_super v21 = [v20 firstObject];
      }
    }
    else
    {
      objc_super v21 = 0;
    }
    uint64_t v22 = [v11 objectForKey:@"StoreID"];
    v23 = [v11 objectForKey:@"Global"];
    char v24 = [v23 BOOLValue];

    if (!v22) {
      goto LABEL_15;
    }
    if (![v22 intValue])
    {
      uint64_t v25 = [v12 containersMatchingPredicate:0 error:0];
      char v47 = (char)v16;
      int v16 = v13;
      uint64_t v26 = v22;
      id v27 = v12;
      v28 = v21;
      v29 = v18;
      id v30 = a5;
      unint64_t v31 = [v25 count];

      BOOL v32 = v31 > 1;
      a5 = v30;
      v18 = v29;
      objc_super v21 = v28;
      id v12 = v27;
      uint64_t v22 = v26;
      id v13 = v16;
      LOBYTE(v16) = v47;
      char v33 = v32 ? v24 : 0;
      if (v33) {
        goto LABEL_15;
      }
    }
    v48 = a5;
    char v35 = objc_msgSend(MEMORY[0x1E4F1B9B0], "predicateForiOSLegacyIdentifier:", objc_msgSend(v22, "intValue"));
    objc_super v36 = [v12 containersMatchingPredicate:v35 error:0];

    if ([v36 count] == 1)
    {
      id v34 = [v36 firstObject];
    }
    else if ([v36 count])
    {
      id v34 = 0;
    }
    else
    {
      v37 = objc_msgSend(MEMORY[0x1E4F1B9B0], "predicateForiOSLegacyIdentifier:", objc_msgSend(v22, "intValue"));
      v38 = [v12 serverSearchContainersMatchingPredicate:v37 error:0];

      if ([v38 count] == 1)
      {
        id v34 = [v38 firstObject];

        if (v34)
        {
          v39 = [v34 identifier];
          v53[0] = v39;
          id *v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1];

          BOOL *v48 = 1;
LABEL_35:

          goto LABEL_36;
        }
LABEL_15:
        if (v21)
        {
          id v34 = 0;
LABEL_26:
          v40 = [v21 identifier];
          v52 = v40;
          id v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
          v42 = v50;
LABEL_27:
          id *v42 = v41;

          goto LABEL_35;
        }
LABEL_30:
        v43 = [v11 objectForKey:@"AccountIdentifier"];
        if (v43)
        {
          v44 = [MEMORY[0x1E4F1B9B0] predicateForContainersInAccountWithExternalIdentifier:v43];
          v45 = [v12 containersMatchingPredicate:v44 error:0];

          if ([v45 count])
          {
            objc_msgSend(v45, "_cn_map:", &__block_literal_global_46);
            id *v49 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
        id v34 = 0;
        goto LABEL_35;
      }
      id v34 = 0;
      objc_super v36 = v38;
    }

    if (v21) {
      goto LABEL_26;
    }
    if (v34)
    {
      v40 = [v34 identifier];
      v51 = v40;
      id v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
      v42 = v49;
      goto LABEL_27;
    }
    goto LABEL_30;
  }
LABEL_36:

  return (char)v16;
}

uint64_t __117__CNContactStoreFilter_getContainerIdentifiers_groupIdentifiers_serverFilter_fromPreSundanceDictionary_contactStore___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

void __117__CNContactStoreFilter_getContainerIdentifiers_groupIdentifiers_serverFilter_fromPreSundanceDictionary_contactStore___block_invoke()
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"Global", @"GroupID", @"StoreID", @"AccountIdentifier", 0);
  uint64_t v0 = [v2 copy];
  v1 = (void *)getContainerIdentifiers_groupIdentifiers_serverFilter_fromPreSundanceDictionary_contactStore__cn_once_object_2;
  getContainerIdentifiers_groupIdentifiers_serverFilter_fromPreSundanceDictionary_contactStore__cn_once_object_2 = v0;
}

+ (BOOL)getContainerIdentifiers:(id *)a3 groupIdentifiers:(id *)a4 serverFilter:(BOOL *)a5 fromSundanceToOkemoAndAddressBookUIDictionary:(id)a6 contactStore:(id)a7
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v11 = a6;
  id v12 = a7;
  if (getContainerIdentifiers_groupIdentifiers_serverFilter_fromSundanceToOkemoAndAddressBookUIDictionary_contactStore__cn_once_token_1 != -1) {
    dispatch_once(&getContainerIdentifiers_groupIdentifiers_serverFilter_fromSundanceToOkemoAndAddressBookUIDictionary_contactStore__cn_once_token_1, &__block_literal_global_9_28199);
  }
  id v13 = (id)getContainerIdentifiers_groupIdentifiers_serverFilter_fromSundanceToOkemoAndAddressBookUIDictionary_contactStore__cn_once_object_1;
  v14 = (void *)MEMORY[0x1E4F1CAD0];
  v15 = [v11 allKeys];
  int v16 = [v14 setWithArray:v15];
  int v17 = [v16 intersectsSet:v13];

  if (v17)
  {
    v18 = [v11 objectForKey:@"kABContactsFilter_DirectorySourceID"];
    uint64_t v19 = v18;
    if (v18)
    {
      uint64_t v20 = objc_msgSend(MEMORY[0x1E4F1B9B0], "predicateForiOSLegacyIdentifier:", objc_msgSend(v18, "intValue"));
      objc_super v21 = [v12 serverSearchContainersMatchingPredicate:v20 error:0];

      if ([v21 count] == 1)
      {
        uint64_t v22 = [v21 firstObject];
        v23 = [v22 identifier];
        v43[0] = v23;
        *a3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];

        *a5 = 1;
LABEL_15:

        goto LABEL_16;
      }
    }
    objc_super v21 = [v11 objectForKey:@"kABContactsFilter_ExcludedSourceIDs"];
    char v24 = [v11 objectForKey:@"kABContactsFilter_ExcludedGroupIDs"];
    if ([v24 count] || objc_msgSend(v21, "count"))
    {
      char v33 = a4;
      id v34 = a3;
      objc_super v36 = v19;
      uint64_t v25 = [v12 containersMatchingPredicate:0 error:0];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __137__CNContactStoreFilter_getContainerIdentifiers_groupIdentifiers_serverFilter_fromSundanceToOkemoAndAddressBookUIDictionary_contactStore___block_invoke_2;
      v41[3] = &unk_1E549BDA0;
      id v26 = v21;
      id v42 = v26;
      char v35 = v25;
      id v27 = objc_msgSend(v25, "_cn_filter:", v41);
      v28 = objc_msgSend(v27, "_cn_map:", &__block_literal_global_25);

      v29 = [v12 groupsMatchingPredicate:0 error:0];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __137__CNContactStoreFilter_getContainerIdentifiers_groupIdentifiers_serverFilter_fromSundanceToOkemoAndAddressBookUIDictionary_contactStore___block_invoke_4;
      v37[3] = &unk_1E54989E0;
      id v38 = v24;
      id v39 = v12;
      id v40 = v26;
      id v30 = objc_msgSend(v29, "_cn_filter:", v37);
      unint64_t v31 = objc_msgSend(v30, "_cn_map:", &__block_literal_global_29_28200);

      if ([v28 count] || objc_msgSend(v31, "count"))
      {
        *id v34 = v28;
        *char v33 = v31;
      }

      uint64_t v19 = v36;
    }

    goto LABEL_15;
  }
LABEL_16:

  return v17;
}

uint64_t __137__CNContactStoreFilter_getContainerIdentifiers_groupIdentifiers_serverFilter_fromSundanceToOkemoAndAddressBookUIDictionary_contactStore___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a2, "iOSLegacyIdentifier"));
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

uint64_t __137__CNContactStoreFilter_getContainerIdentifiers_groupIdentifiers_serverFilter_fromSundanceToOkemoAndAddressBookUIDictionary_contactStore___block_invoke_4(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)a1[4];
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "iOSLegacyIdentifier"));
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4)
  {
    id v6 = (void *)a1[5];
    id v7 = (void *)MEMORY[0x1E4F1B9B0];
    id v8 = [v3 identifier];
    char v9 = [v7 predicateForContainerOfGroupWithIdentifier:v8];
    id v10 = [v6 containersMatchingPredicate:v9 error:0];
    id v11 = [v10 firstObject];

    id v12 = (void *)a1[6];
    id v13 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v11, "iOSLegacyIdentifier"));
    uint64_t v14 = [v12 containsObject:v13] ^ 1;
  }
  else
  {
    uint64_t v14 = 1;
  }

  return v14;
}

uint64_t __137__CNContactStoreFilter_getContainerIdentifiers_groupIdentifiers_serverFilter_fromSundanceToOkemoAndAddressBookUIDictionary_contactStore___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __137__CNContactStoreFilter_getContainerIdentifiers_groupIdentifiers_serverFilter_fromSundanceToOkemoAndAddressBookUIDictionary_contactStore___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

void __137__CNContactStoreFilter_getContainerIdentifiers_groupIdentifiers_serverFilter_fromSundanceToOkemoAndAddressBookUIDictionary_contactStore___block_invoke()
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"kABContactsFilter_ExcludedSourceIDs", @"kABContactsFilter_ExcludedGroupIDs", @"kABContactsFilter_DirectorySourceID", 0);
  uint64_t v0 = [v2 copy];
  v1 = (void *)getContainerIdentifiers_groupIdentifiers_serverFilter_fromSundanceToOkemoAndAddressBookUIDictionary_contactStore__cn_once_object_1;
  getContainerIdentifiers_groupIdentifiers_serverFilter_fromSundanceToOkemoAndAddressBookUIDictionary_contactStore__cn_once_object_1 = v0;
}

+ (BOOL)getContainerIdentifiers:(id *)a3 groupIdentifiers:(id *)a4 serverFilter:(BOOL *)a5 fromLegacyDictionary:(id)a6 contactStore:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  if (getContainerIdentifiers_groupIdentifiers_serverFilter_fromLegacyDictionary_contactStore__cn_once_token_0 != -1) {
    dispatch_once(&getContainerIdentifiers_groupIdentifiers_serverFilter_fromLegacyDictionary_contactStore__cn_once_token_0, &__block_literal_global_28203);
  }
  uint64_t v14 = (void *)MEMORY[0x1E4F1CAD0];
  id v15 = (id)getContainerIdentifiers_groupIdentifiers_serverFilter_fromLegacyDictionary_contactStore__cn_once_object_0;
  int v16 = [v12 allKeys];
  int v17 = [v14 setWithArray:v16];
  char v18 = [v17 intersectsSet:v15];

  if (v18)
  {
    char v19 = 0;
  }
  else if ([a1 getContainerIdentifiers:a3 groupIdentifiers:a4 serverFilter:a5 fromSundanceToOkemoAndAddressBookUIDictionary:v12 contactStore:v13])
  {
    char v19 = 1;
  }
  else
  {
    char v19 = [a1 getContainerIdentifiers:a3 groupIdentifiers:a4 serverFilter:a5 fromPreSundanceDictionary:v12 contactStore:v13];
  }

  return v19;
}

void __112__CNContactStoreFilter_getContainerIdentifiers_groupIdentifiers_serverFilter_fromLegacyDictionary_contactStore___block_invoke()
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"CNContactStoreFilterDictionaryKeyExcludedContainerIdentifiers", @"CNContactStoreFilterDictionaryKeyExcludedGroupIdentifiers", @"CNContactStoreFilterDictionaryKeyIsServerFilter", 0);
  uint64_t v0 = [v2 copy];
  v1 = (void *)getContainerIdentifiers_groupIdentifiers_serverFilter_fromLegacyDictionary_contactStore__cn_once_object_0;
  getContainerIdentifiers_groupIdentifiers_serverFilter_fromLegacyDictionary_contactStore__cn_once_object_0 = v0;
}

+ (id)isServerFilterDictionaryKey
{
  return @"CNContactStoreFilterDictionaryKeyIsServerFilter";
}

+ (id)excludedGroupIdentifiersDictionaryKey
{
  return @"CNContactStoreFilterDictionaryKeyExcludedGroupIdentifiers";
}

+ (id)excludedContainerIdentifiersDictionaryKey
{
  return @"CNContactStoreFilterDictionaryKeyExcludedContainerIdentifiers";
}

@end