@interface HURoomActionSetListItemManager
- (NSArray)cachedSortedRooms;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_currentSectionIdentifiers;
- (id)_identifierForSection:(unint64_t)a3;
- (id)_roomComparator;
- (id)_sectionIdentifierForItem:(id)a3;
- (id)_sortedRooms;
- (id)_titleForSectionWithIdentifier:(id)a3;
- (int64_t)sectionIndexForRoomIdentifier:(id)a3;
- (unint64_t)_numberOfSections;
- (void)_willUpdateSections;
- (void)setCachedSortedRooms:(id)a3;
@end

@implementation HURoomActionSetListItemManager

- (int64_t)sectionIndexForRoomIdentifier:(id)a3
{
  v4 = [a3 UUIDString];
  int64_t v5 = [(HFItemManager *)self sectionIndexForDisplayedSectionIdentifier:v4];

  return v5;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  int64_t v5 = objc_msgSend(v3, "rooms", 0);
  v6 = [v3 roomForEntireHome];
  v7 = [v5 arrayByAddingObject:v6];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = (void *)[objc_alloc(MEMORY[0x1E4F68EC8]) initWithHome:v3 room:*(void *)(*((void *)&v18 + 1) + 8 * i)];
        [v4 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v9);
  }

  id v13 = objc_alloc(MEMORY[0x1E4F695C8]);
  v14 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
  v15 = (void *)[v13 initWithItems:v14];

  v22 = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];

  return v16;
}

- (unint64_t)_numberOfSections
{
  v2 = [(HURoomActionSetListItemManager *)self _currentSectionIdentifiers];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)_identifierForSection:(unint64_t)a3
{
  v4 = [(HURoomActionSetListItemManager *)self _currentSectionIdentifiers];
  if ([v4 count] <= a3) {
    NSLog(&cfstr_ReceivedIdenti.isa, a3, [v4 count]);
  }
  if ([v4 count] <= a3)
  {
    int64_t v5 = 0;
  }
  else
  {
    int64_t v5 = [v4 objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (id)_titleForSectionWithIdentifier:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F29128];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithUUIDString:v5];

  v7 = [(HFItemManager *)self home];
  uint64_t v8 = objc_msgSend(v7, "hf_roomWithIdentifier:", v6);

  uint64_t v9 = [v8 name];
  uint64_t v10 = [v9 localizedUppercaseString];

  return v10;
}

- (id)_sectionIdentifierForItem:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v5 room], (v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"HURoomActionSetListItemManager.m", 74, @"We don't have a room for this item: %@", v5 object file lineNumber description];

    v6 = 0;
  }
  uint64_t v8 = [v6 uniqueIdentifier];
  uint64_t v9 = [v8 UUIDString];

  return v9;
}

- (void)_willUpdateSections
{
}

- (id)_currentSectionIdentifiers
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = [(HURoomActionSetListItemManager *)self _sortedRooms];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) uniqueIdentifier];
        uint64_t v10 = [v9 UUIDString];
        [v3 addObject:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  v11 = (void *)[v3 copy];

  return v11;
}

- (id)_sortedRooms
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(HURoomActionSetListItemManager *)self cachedSortedRooms];

  if (!v3)
  {
    v4 = [(HFItemManager *)self allItems];
    uint64_t v5 = [(HFItemManager *)self allItems];
    uint64_t v6 = [(HFItemManager *)self _itemsToHideInSet:v5];
    uint64_t v7 = objc_msgSend(v4, "na_setByRemovingObjectsFromSet:", v6);

    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v9 = objc_msgSend(v7, "allObjects", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v20 + 1) + 8 * v13);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v15 = [v14 room];
            [v8 addObject:v15];
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }

    long long v16 = [(HURoomActionSetListItemManager *)self _roomComparator];
    v17 = [v8 sortedArrayUsingComparator:v16];
    [(HURoomActionSetListItemManager *)self setCachedSortedRooms:v17];
  }
  uint64_t v18 = [(HURoomActionSetListItemManager *)self cachedSortedRooms];

  return v18;
}

- (id)_roomComparator
{
  return &__block_literal_global_60;
}

uint64_t __49__HURoomActionSetListItemManager__roomComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 name];
  uint64_t v6 = [v4 name];

  if (v5)
  {
    if (v6) {
      uint64_t v7 = [v5 localizedStandardCompare:v6];
    }
    else {
      uint64_t v7 = -1;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

- (NSArray)cachedSortedRooms
{
  return self->_cachedSortedRooms;
}

- (void)setCachedSortedRooms:(id)a3
{
}

- (void).cxx_destruct
{
}

@end