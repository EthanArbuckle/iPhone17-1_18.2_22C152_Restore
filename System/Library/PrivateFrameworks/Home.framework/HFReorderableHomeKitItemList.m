@interface HFReorderableHomeKitItemList
+ (id)_dataForHomeKitItem:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (HFReorderableHomeKitItemList)initWithApplicationDataContainer:(id)a3 category:(id)a4;
- (NSArray)sortedHomeKitObjectIdentifiers;
- (NSString)_applicationDataKey;
- (id)_actionSetTypeComparator;
- (id)_homeKitItemDataComparator;
- (id)_reorderableObjectDateAddedComparator;
- (id)_reorderableObjectTitleComparator;
- (id)_sortedHomeKitIdentifierComparator;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)sortedHomeKitItemComparator;
- (id)sortedHomeKitObjectComparator;
- (unint64_t)hash;
- (void)setSortedHomeKitObjectIdentifiers:(id)a3;
@end

@implementation HFReorderableHomeKitItemList

+ (id)_dataForHomeKitItem:(id)a3
{
  id v3 = a3;
  v4 = [v3 latestResults];
  v5 = [v4 objectForKeyedSubscript:@"title"];

  v6 = [v3 latestResults];
  v7 = [v6 objectForKeyedSubscript:@"dateAdded"];

  id v8 = v3;
  objc_opt_class();
  id v9 = v8;
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v9 = v8;
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
    id v11 = v10;

    v12 = [v11 sourceItem];
    int v13 = [v12 conformsToProtocol:&unk_26C0FBAD0];

    if (v13)
    {
      uint64_t v14 = [v11 sourceItem];

      id v9 = (id)v14;
    }
  }
  if ([v9 conformsToProtocol:&unk_26C11F218])
  {
    id v15 = v9;
    if ([v15 conformsToProtocol:&unk_26C11F218]) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }
    id v17 = v16;

    v18 = [v17 primaryHomeKitObject];
  }
  else
  {
    v18 = [v9 homeKitObject];
  }
  v19 = [v18 uniqueIdentifier];

  v20 = +[HFOrderedHomeKitItemData dataWithUniqueIdentifier:v19 title:v5 dateAdded:v7];
  v21 = [v9 homeKitObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v23 = [v9 homeKitObject];
    v24 = [v23 actionSetType];
    [v20 setActionSetType:v24];
  }
  return v20;
}

uint64_t __59__HFReorderableHomeKitItemList_sortedHomeKitItemComparator__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = +[HFReorderableHomeKitItemList _dataForHomeKitItem:a2];
  v7 = +[HFReorderableHomeKitItemList _dataForHomeKitItem:v5];

  id v8 = [*(id *)(a1 + 32) _homeKitItemDataComparator];
  uint64_t v9 = ((uint64_t (**)(void, void *, void *))v8)[2](v8, v6, v7);

  return v9;
}

- (id)_homeKitItemDataComparator
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__HFReorderableHomeKitItemList__homeKitItemDataComparator__block_invoke;
  v5[3] = &unk_26409B600;
  v5[4] = self;
  v2 = v5;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __HFComparatorForNullableObjects_block_invoke;
  v6[3] = &unk_26409B720;
  id v7 = v2;
  id v3 = (void *)[v6 copy];

  return v3;
}

uint64_t __58__HFReorderableHomeKitItemList__homeKitItemDataComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) _sortedHomeKitIdentifierComparator];
  id v8 = [v5 uniqueIdentifier];
  uint64_t v9 = [v6 uniqueIdentifier];
  uint64_t v10 = ((uint64_t (**)(void, void *, void *))v7)[2](v7, v8, v9);

  if (!v10)
  {
    id v11 = [*(id *)(a1 + 32) _actionSetTypeComparator];
    v12 = [v5 actionSetType];
    int v13 = [v6 actionSetType];
    uint64_t v10 = ((uint64_t (**)(void, void *, void *))v11)[2](v11, v12, v13);

    if (!v10)
    {
      uint64_t v14 = [*(id *)(a1 + 32) _reorderableObjectDateAddedComparator];
      id v15 = [v5 dateAdded];
      v16 = [v6 dateAdded];
      uint64_t v10 = ((uint64_t (**)(void, void *, void *))v14)[2](v14, v15, v16);

      if (!v10)
      {
        id v17 = [*(id *)(a1 + 32) _reorderableObjectTitleComparator];
        v18 = [v5 title];
        v19 = [v6 title];
        uint64_t v10 = ((uint64_t (**)(void, void *, void *))v17)[2](v17, v18, v19);

        if (!v10)
        {
          v20 = [v5 uniqueIdentifier];
          v21 = [v20 UUIDString];
          v22 = [v6 uniqueIdentifier];
          v23 = [v22 UUIDString];
          uint64_t v10 = [v21 compare:v23];
        }
      }
    }
  }

  return v10;
}

uint64_t __66__HFReorderableHomeKitItemList__sortedHomeKitIdentifierComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 sortedHomeKitObjectIdentifiers];
  uint64_t v9 = [v8 indexOfObject:v7];

  uint64_t v10 = [*(id *)(a1 + 32) sortedHomeKitObjectIdentifiers];
  uint64_t v11 = [v10 indexOfObject:v6];

  BOOL v12 = v9 == 0x7FFFFFFFFFFFFFFFLL;
  BOOL v13 = v11 == 0x7FFFFFFFFFFFFFFFLL;
  BOOL v14 = v11 == 0x7FFFFFFFFFFFFFFFLL && v9 == 0x7FFFFFFFFFFFFFFFLL;
  if (v9 == v11)
  {
    BOOL v14 = 1;
    BOOL v12 = 1;
  }
  BOOL v15 = !v14;
  if (v9 < v11) {
    BOOL v13 = 1;
  }
  BOOL v16 = !v13;
  uint64_t v17 = -1;
  if (v16) {
    uint64_t v17 = 1;
  }
  if (v12) {
    return v15;
  }
  else {
    return v17;
  }
}

- (NSArray)sortedHomeKitObjectIdentifiers
{
  return self->_sortedHomeKitObjectIdentifiers;
}

- (id)_sortedHomeKitIdentifierComparator
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__HFReorderableHomeKitItemList__sortedHomeKitIdentifierComparator__block_invoke;
  aBlock[3] = &unk_26409B628;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);
  id v3 = _Block_copy(v2);

  return v3;
}

- (id)_actionSetTypeComparator
{
  if (_MergedGlobals_319 != -1) {
    dispatch_once(&_MergedGlobals_319, &__block_literal_global_173_2);
  }
  id v2 = (id)qword_26AB2FDB0;
  id v3 = +[HFUtilities comparatorWithSortedObjects:v2];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __HFComparatorForNullableObjects_block_invoke;
  v7[3] = &unk_26409B720;
  id v8 = v3;
  id v4 = v3;
  id v5 = (void *)[v7 copy];

  return v5;
}

uint64_t __65__HFReorderableHomeKitItemList__reorderableObjectTitleComparator__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedStandardCompare:");
}

- (id)_reorderableObjectTitleComparator
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __HFComparatorForNullableObjects_block_invoke;
  v4[3] = &unk_26409B720;
  id v5 = &__block_literal_global_164_0;
  id v2 = (void *)[v4 copy];

  return v2;
}

- (id)_reorderableObjectDateAddedComparator
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __HFComparatorForNullableObjects_block_invoke;
  v4[3] = &unk_26409B720;
  id v5 = &__block_literal_global_167_1;
  id v2 = (void *)[v4 copy];

  return v2;
}

- (void).cxx_destruct
{
}

uint64_t __61__HFReorderableHomeKitItemList_sortedHomeKitObjectComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [v5 conformsToProtocol:&unk_26C1345C0];
  unsigned int v8 = [v6 conformsToProtocol:&unk_26C1345C0];
  unsigned int v9 = v8;
  if (v7 && (v8 & 1) != 0)
  {
    uint64_t v10 = __61__HFReorderableHomeKitItemList_sortedHomeKitObjectComparator__block_invoke_2(v5);
    uint64_t v11 = objc_msgSend(v5, "hf_displayName");
    BOOL v12 = objc_msgSend(v5, "hf_dateAdded");
    BOOL v13 = +[HFOrderedHomeKitItemData dataWithUniqueIdentifier:v10 title:v11 dateAdded:v12];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v14 = [v5 actionSetType];
      [v13 setActionSetType:v14];
    }
    BOOL v15 = __61__HFReorderableHomeKitItemList_sortedHomeKitObjectComparator__block_invoke_2(v6);

    BOOL v16 = objc_msgSend(v6, "hf_displayName");
    uint64_t v17 = objc_msgSend(v6, "hf_dateAdded");
    v18 = +[HFOrderedHomeKitItemData dataWithUniqueIdentifier:v15 title:v16 dateAdded:v17];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [v6 actionSetType];
      [v18 setActionSetType:v19];
    }
    v20 = [*(id *)(a1 + 32) _homeKitItemDataComparator];
    uint64_t v21 = ((uint64_t (**)(void, void *, void *))v20)[2](v20, v13, v18);
  }
  else
  {
    NSLog(&cfstr_AttemptingToSo.isa, v5, v6);
    if (v7) {
      uint64_t v21 = -1;
    }
    else {
      uint64_t v21 = v9;
    }
  }

  return v21;
}

id __61__HFReorderableHomeKitItemList_sortedHomeKitObjectComparator__block_invoke_2(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v2 = v1;
    if (objc_opt_isKindOfClass()) {
      id v3 = v2;
    }
    else {
      id v3 = 0;
    }
    id v4 = v3;

    id v5 = objc_msgSend(v4, "hf_primaryService");
    if (v5)
    {
      id v6 = objc_msgSend(v4, "hf_primaryService");
      int v7 = [v6 uniqueIdentifier];
    }
    else
    {
      int v7 = [v4 uniqueIdentifier];
    }
  }
  else
  {
    int v7 = [v1 uniqueIdentifier];
  }

  return v7;
}

- (HFReorderableHomeKitItemList)initWithApplicationDataContainer:(id)a3 category:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)HFReorderableHomeKitItemList;
  id v4 = [(HFReorderableItemListAbstractBase *)&v16 initWithApplicationDataContainer:a3 category:a4];
  id v5 = v4;
  if (v4)
  {
    id v6 = [(HFReorderableItemListAbstractBase *)v4 applicationDataContainer];
    int v7 = [v6 applicationData];
    unsigned int v8 = [(HFReorderableHomeKitItemList *)v5 _applicationDataKey];
    unsigned int v9 = [v7 objectForKeyedSubscript:v8];
    uint64_t v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [MEMORY[0x263EFF8C0] array];
    }
    BOOL v12 = v11;

    uint64_t v13 = objc_msgSend(v12, "na_map:", &__block_literal_global_219);
    sortedHomeKitObjectIdentifiers = v5->_sortedHomeKitObjectIdentifiers;
    v5->_sortedHomeKitObjectIdentifiers = (NSArray *)v13;
  }
  return v5;
}

- (NSString)_applicationDataKey
{
  id v2 = NSString;
  id v3 = [(HFReorderableItemListAbstractBase *)self category];
  id v4 = [v2 stringWithFormat:@"%@_%@", @"HFSortedIdentifierStrings", v3];

  return (NSString *)v4;
}

- (id)sortedHomeKitItemComparator
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__HFReorderableHomeKitItemList_sortedHomeKitItemComparator__block_invoke;
  aBlock[3] = &unk_26409B5B0;
  aBlock[4] = self;
  id v2 = _Block_copy(aBlock);
  return v2;
}

- (id)sortedHomeKitObjectComparator
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__HFReorderableHomeKitItemList_sortedHomeKitObjectComparator__block_invoke;
  aBlock[3] = &unk_26409B5D8;
  aBlock[4] = self;
  id v2 = _Block_copy(aBlock);
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HFReorderableHomeKitItemList *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(HFReorderableItemListAbstractBase *)v5 applicationDataContainer];
      int v7 = [(HFReorderableItemListAbstractBase *)self applicationDataContainer];
      if (v6 == v7)
      {
        int v10 = 1;
      }
      else
      {
        unsigned int v8 = [(HFReorderableItemListAbstractBase *)v5 applicationDataContainer];
        unsigned int v9 = [(HFReorderableItemListAbstractBase *)self applicationDataContainer];
        int v10 = [v8 isEqual:v9];
      }
      BOOL v12 = [(HFReorderableItemListAbstractBase *)v5 category];
      uint64_t v13 = [(HFReorderableItemListAbstractBase *)self category];
      if (v12 != v13)
      {
        BOOL v14 = [(HFReorderableItemListAbstractBase *)v5 category];
        BOOL v15 = [(HFReorderableItemListAbstractBase *)self category];
        v10 &= [v14 isEqual:v15];
      }
      objc_super v16 = [(HFReorderableHomeKitItemList *)v5 sortedHomeKitObjectIdentifiers];
      uint64_t v17 = [(HFReorderableHomeKitItemList *)self sortedHomeKitObjectIdentifiers];
      if (v16 == v17)
      {
        BOOL v11 = v10 != 0;
      }
      else
      {
        v18 = [(HFReorderableHomeKitItemList *)v5 sortedHomeKitObjectIdentifiers];
        v19 = [(HFReorderableHomeKitItemList *)self sortedHomeKitObjectIdentifiers];
        char v20 = [v18 isEqual:v19];
        if (v10) {
          BOOL v11 = v20;
        }
        else {
          BOOL v11 = 0;
        }
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

void __56__HFReorderableHomeKitItemList__actionSetTypeComparator__block_invoke_2()
{
  void v4[4] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F0B918];
  v4[0] = *MEMORY[0x263F0B960];
  v4[1] = v0;
  uint64_t v1 = *MEMORY[0x263F0B938];
  v4[2] = *MEMORY[0x263F0B908];
  v4[3] = v1;
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:4];
  id v3 = (void *)qword_26AB2FDB0;
  qword_26AB2FDB0 = v2;
}

id __74__HFReorderableHomeKitItemList_initWithApplicationDataContainer_category___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v2];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [HFReorderableHomeKitItemList alloc];
  id v5 = [(HFReorderableItemListAbstractBase *)self applicationDataContainer];
  id v6 = [(HFReorderableItemListAbstractBase *)self category];
  int v7 = [(HFReorderableHomeKitItemList *)v4 initWithApplicationDataContainer:v5 category:v6];

  unsigned int v8 = [(HFReorderableHomeKitItemList *)self sortedHomeKitObjectIdentifiers];
  [(HFReorderableHomeKitItemList *)v7 setSortedHomeKitObjectIdentifiers:v8];

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [HFMutableReorderableHomeKitItemList alloc];
  id v5 = [(HFReorderableItemListAbstractBase *)self applicationDataContainer];
  id v6 = [(HFReorderableItemListAbstractBase *)self category];
  int v7 = [(HFReorderableHomeKitItemList *)v4 initWithApplicationDataContainer:v5 category:v6];

  unsigned int v8 = [(HFReorderableHomeKitItemList *)self sortedHomeKitObjectIdentifiers];
  [(HFReorderableHomeKitItemList *)v7 setSortedHomeKitObjectIdentifiers:v8];

  return v7;
}

- (unint64_t)hash
{
  id v2 = [(HFReorderableHomeKitItemList *)self _applicationDataKey];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEmpty
{
  id v2 = [(HFReorderableHomeKitItemList *)self sortedHomeKitObjectIdentifiers];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

uint64_t __69__HFReorderableHomeKitItemList__reorderableObjectDateAddedComparator__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)setSortedHomeKitObjectIdentifiers:(id)a3
{
}

@end