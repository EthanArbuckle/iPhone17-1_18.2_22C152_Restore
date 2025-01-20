@interface MSVSectionedCollection(MPAdditions)
- (MPChangeDetails)changeDetailsToSectionedCollection:()MPAdditions applyingUIKitWorkarounds:isEqualBlock:isUpdatedBlock:;
- (id)identifiersForItemAtIndexPath:()MPAdditions;
- (id)identifiersForSectionAtIndex:()MPAdditions;
- (id)indexPathForItemWithIdentifiersIntersectingSet:()MPAdditions;
- (uint64_t)changeDetailsToSectionedCollection:()MPAdditions isEqualBlock:isUpdatedBlock:;
- (void)enumerateItemIdentifiersInSectionAtIndex:()MPAdditions usingBlock:;
- (void)enumerateItemIdentifiersUsingBlock:()MPAdditions;
- (void)enumerateSectionIdentifiersUsingBlock:()MPAdditions;
@end

@implementation MSVSectionedCollection(MPAdditions)

- (id)indexPathForItemWithIdentifiersIntersectingSet:()MPAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 numberOfSections];
  if (v5 < 1)
  {
    id v13 = 0;
  }
  else
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = [a1 numberOfItemsInSection:v7];
      if (v8 < 1)
      {
        id v13 = 0;
      }
      else
      {
        uint64_t v9 = v8;
        uint64_t v10 = 1;
        do
        {
          v11 = [MEMORY[0x1E4F28D58] indexPathForItem:v10 - 1 inSection:v7];
          v12 = [a1 identifiersForItemAtIndexPath:v11];
          if ([v12 intersectsSet:v4]) {
            id v13 = v11;
          }
          else {
            id v13 = 0;
          }

          if (v10 >= v9) {
            break;
          }
          ++v10;
        }
        while (!v13);
      }
      ++v7;
    }
    while (v7 < v6 && !v13);
  }

  return v13;
}

- (id)identifiersForSectionAtIndex:()MPAdditions
{
  v1 = objc_msgSend(a1, "sectionAtIndex:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v1 identifiers];
    }
    else {
    id v2 = +[MPIdentifierSet emptyIdentifierSet];
    }
  }
  v3 = v2;

  return v3;
}

- (id)identifiersForItemAtIndexPath:()MPAdditions
{
  v1 = objc_msgSend(a1, "itemAtIndexPath:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v1 identifiers];
    }
    else {
    id v2 = +[MPIdentifierSet emptyIdentifierSet];
    }
  }
  v3 = v2;

  return v3;
}

- (void)enumerateItemIdentifiersInSectionAtIndex:()MPAdditions usingBlock:
{
  uint64_t v6 = a4;
  char v12 = 0;
  uint64_t v7 = [a1 numberOfItemsInSection:a3];
  if (v7 >= 1)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 1;
    do
    {
      uint64_t v10 = [MEMORY[0x1E4F28D58] indexPathForItem:v9 - 1 inSection:a3];
      v11 = [a1 identifiersForItemAtIndexPath:v10];
      if (v11) {
        v6[2](v6, v9 - 1, v11, &v12);
      }

      if (v9 >= v8) {
        break;
      }
      ++v9;
    }
    while (!v12);
  }
}

- (void)enumerateSectionIdentifiersUsingBlock:()MPAdditions
{
  id v4 = a3;
  char v9 = 0;
  uint64_t v5 = [a1 numberOfSections];
  if (v5 >= 1)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 1;
    do
    {
      uint64_t v8 = [a1 identifiersForSectionAtIndex:v7 - 1];
      v4[2](v4, v7 - 1, v8, &v9);

      if (v7 >= v6) {
        break;
      }
      ++v7;
    }
    while (!v9);
  }
}

- (void)enumerateItemIdentifiersUsingBlock:()MPAdditions
{
  id v4 = a3;
  unsigned __int8 v14 = 0;
  uint64_t v5 = [a1 numberOfSections];
  if (v5 >= 1)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = [a1 numberOfItemsInSection:v7];
      int v9 = v14;
      if (v8 >= 1 && !v14)
      {
        uint64_t v10 = v8;
        uint64_t v11 = 1;
        do
        {
          char v12 = [MEMORY[0x1E4F28D58] indexPathForItem:v11 - 1 inSection:v7];
          id v13 = [a1 identifiersForItemAtIndexPath:v12];
          if (v13) {
            v4[2](v4, v12, v13, &v14);
          }

          int v9 = v14;
          if (v11 >= v10) {
            break;
          }
          ++v11;
        }
        while (!v14);
      }
      ++v7;
    }
    while (v7 < v6 && !v9);
  }
}

- (MPChangeDetails)changeDetailsToSectionedCollection:()MPAdditions applyingUIKitWorkarounds:isEqualBlock:isUpdatedBlock:
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [MPChangeDetails alloc];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke;
  v21[3] = &unk_1E57EEBD0;
  v21[4] = a1;
  id v22 = v10;
  id v23 = v11;
  id v24 = v12;
  char v25 = a4;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  v17 = [(MPChangeDetails *)v13 initWithBlock:v21];
  if ([(MPChangeDetails *)v17 hasChanges]) {
    v18 = v17;
  }
  else {
    v18 = 0;
  }
  v19 = v18;

  return v19;
}

- (uint64_t)changeDetailsToSectionedCollection:()MPAdditions isEqualBlock:isUpdatedBlock:
{
  return [a1 changeDetailsToSectionedCollection:a3 applyingUIKitWorkarounds:1 isEqualBlock:a4 isUpdatedBlock:a5];
}

@end