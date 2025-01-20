@interface MPSectionedCollection
+ (BOOL)supportsSecureCoding;
- (BOOL)hasSameContentAsSectionedCollection:(id)a3;
- (MPSectionedCollection)init;
- (MPSectionedCollection)initWithCoder:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (id)_stateDumpObject;
- (id)allItems;
- (id)allSections;
- (id)changeDetailsToSectionedCollection:(id)a3 applyingUIKitWorkarounds:(BOOL)a4 isEqualBlock:(id)a5 isUpdatedBlock:(id)a6;
- (id)changeDetailsToSectionedCollection:(id)a3 isEqualBlock:(id)a4 isUpdatedBlock:(id)a5;
- (id)firstItem;
- (id)firstSection;
- (id)identifiersForItemAtIndexPath:(id)a3;
- (id)identifiersForSectionAtIndex:(int64_t)a3;
- (id)indexPathForGlobalIndex:(int64_t)a3;
- (id)indexPathForItemWithIdentifiersIntersectingSet:(id)a3;
- (id)itemAtIndexPath:(id)a3;
- (id)itemsInSectionAtIndex:(int64_t)a3;
- (id)lastItem;
- (id)lastSection;
- (id)lazyMapWithSections:(id)a3 items:(id)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)sectionAtIndex:(int64_t)a3;
- (int64_t)globalIndexForIndexPath:(id)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)totalItemCount;
- (void)_initializeAsEmptySectionedCollection;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateItemIdentifiersInSectionAtIndex:(int64_t)a3 usingBlock:(id)a4;
- (void)enumerateItemIdentifiersUsingBlock:(id)a3;
- (void)enumerateItemsInSectionAtIndex:(int64_t)a3 usingBlock:(id)a4;
- (void)enumerateItemsUsingBlock:(id)a3;
- (void)enumerateSectionIdentifiersUsingBlock:(id)a3;
- (void)enumerateSectionsUsingBlock:(id)a3;
@end

@implementation MPSectionedCollection

- (id)sectionAtIndex:(int64_t)a3
{
  return [(NSArray *)self->_sections objectAtIndex:a3];
}

- (void)enumerateItemsInSectionAtIndex:(int64_t)a3 usingBlock:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v6 = (void (**)(id, void, uint64_t, char *))a4;
  [(NSArray *)self->_sectionedItems objectAtIndex:a3];
  char v17 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v14;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v14 != v11) {
        objc_enumerationMutation(v7);
      }
      v6[2](v6, *(void *)(*((void *)&v13 + 1) + 8 * v12), v10 + v12, &v17);
      if (v17) {
        break;
      }
      if (v9 == ++v12)
      {
        v10 += v12;
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (int64_t)globalIndexForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 section];
  uint64_t v6 = [v4 item];
  if (v5 < 0)
  {
    int64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    int64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    while (v5 != v8)
      v9 += [(MPSectionedCollection *)self numberOfItemsInSection:v8++];
    if (v7 >= [(MPSectionedCollection *)self numberOfItemsInSection:v5]) {
      int64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      int64_t v10 = v7 + v9;
    }
  }

  return v10;
}

- (int64_t)numberOfSections
{
  return [(NSArray *)self->_sections count];
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  v3 = [(NSArray *)self->_sectionedItems objectAtIndex:a3];
  int64_t v4 = [v3 count];

  return v4;
}

- (id)itemAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 section];
  uint64_t v6 = [v4 item];

  int64_t v7 = [(NSArray *)self->_sectionedItems objectAtIndex:v5];
  uint64_t v8 = [v7 objectAtIndex:v6];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);

  objc_storeStrong((id *)&self->_sectionedItems, 0);
}

- (void)enumerateItemIdentifiersInSectionAtIndex:(int64_t)a3 usingBlock:(id)a4
{
  uint64_t v6 = (void (**)(id, uint64_t, void *, unsigned char *))a4;
  char v12 = 0;
  uint64_t v7 = [(MPSectionedCollection *)self numberOfItemsInSection:a3];
  if (v7 >= 1)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 1;
    do
    {
      int64_t v10 = [MEMORY[0x1E4F28D58] indexPathForItem:v9 - 1 inSection:a3];
      uint64_t v11 = [(MPSectionedCollection *)self identifiersForItemAtIndexPath:v10];
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

- (void)enumerateItemIdentifiersUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void *, void *, unsigned char *))a3;
  unsigned __int8 v14 = 0;
  uint64_t v5 = [(MPSectionedCollection *)self numberOfSections];
  if (v5 >= 1)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = [(MPSectionedCollection *)self numberOfItemsInSection:v7];
      int v9 = v14;
      if (v8 >= 1 && !v14)
      {
        uint64_t v10 = v8;
        uint64_t v11 = 1;
        do
        {
          char v12 = [MEMORY[0x1E4F28D58] indexPathForItem:v11 - 1 inSection:v7];
          long long v13 = [(MPSectionedCollection *)self identifiersForItemAtIndexPath:v12];
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

- (id)indexPathForGlobalIndex:(int64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v22 = v6;
    uint64_t v23 = v5;
    uint64_t v24 = v4;
    uint64_t v25 = v3;
    if (a3 < 0)
    {
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2 object:self file:@"MPSectionedCollection.m" lineNumber:254 description:@"globalIndex must be greater than or equal to 0"];
    }
    uint64_t v15 = [(MPSectionedCollection *)self numberOfSections];
    if (v15 < 1)
    {
LABEL_11:
      uint64_t v11 = 0;
    }
    else
    {
      uint64_t v16 = v15;
      uint64_t v17 = 0;
      uint64_t v18 = 0;
      while (1)
      {
        int64_t v19 = [(MPSectionedCollection *)self numberOfItemsInSection:v17];
        if (v19 + v18 > a3) {
          break;
        }
        ++v17;
        v18 += v19;
        if (v16 == v17) {
          goto LABEL_11;
        }
      }
      uint64_t v11 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 - v18 inSection:v17];
    }
  }
  return v11;
}

- (int64_t)totalItemCount
{
  uint64_t v3 = [(MPSectionedCollection *)self numberOfSections];
  if (v3 < 1) {
    return 0;
  }
  uint64_t v4 = v3;
  uint64_t v5 = 0;
  int64_t v6 = 0;
  do
    v6 += [(MPSectionedCollection *)self numberOfItemsInSection:v5++];
  while (v4 != v5);
  return v6;
}

- (void)enumerateSectionIdentifiersUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, uint64_t, void *, unsigned char *))a3;
  char v9 = 0;
  uint64_t v5 = [(MPSectionedCollection *)self numberOfSections];
  if (v5 >= 1)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 1;
    do
    {
      uint64_t v8 = [(MPSectionedCollection *)self identifiersForSectionAtIndex:v7 - 1];
      v4[2](v4, v7 - 1, v8, &v9);

      if (v7 >= v6) {
        break;
      }
      ++v7;
    }
    while (!v9);
  }
}

- (MPSectionedCollection)init
{
  v5.receiver = self;
  v5.super_class = (Class)MPSectionedCollection;
  v2 = [(MPSectionedCollection *)&v5 init];
  uint64_t v3 = v2;
  if (v2) {
    [(MPSectionedCollection *)v2 _initializeAsEmptySectionedCollection];
  }
  return v3;
}

- (void)_initializeAsEmptySectionedCollection
{
  sectionedItems = self->_sectionedItems;
  uint64_t v4 = (NSArray *)MEMORY[0x1E4F1CBF0];
  self->_sectionedItems = (NSArray *)MEMORY[0x1E4F1CBF0];

  sections = self->_sections;
  self->_sections = v4;
}

- (void)enumerateSectionsUsingBlock:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void, uint64_t, char *))a3;
  char v15 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v5 = self->_sections;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v12;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v12 != v9) {
        objc_enumerationMutation(v5);
      }
      v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8 * v10), v8 + v10, &v15);
      if (v15) {
        break;
      }
      if (v7 == ++v10)
      {
        v8 += v10;
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)_stateDumpObject
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MPSectionedCollection *)self numberOfSections];
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[MPSectionedCollection numberOfSections](self, "numberOfSections"));
  if (v3 >= 1)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      int64_t v6 = [(MPSectionedCollection *)self numberOfItemsInSection:i];
      uint64_t v7 = [(MPSectionedCollection *)self sectionAtIndex:i];
      uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v6];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __41__MPSectionedCollection__stateDumpObject__block_invoke;
      v17[3] = &unk_1E57F0E78;
      id v9 = v8;
      id v18 = v9;
      [(MPSectionedCollection *)self enumerateItemsInSectionAtIndex:i usingBlock:v17];
      v19[0] = @"_sectionIdx";
      uint64_t quot = i;
      long long v11 = (const UInt8 *)&v21;
      do
      {
        ldiv_t v12 = ldiv(quot, 10);
        uint64_t quot = v12.quot;
        if (v12.rem >= 0) {
          LOBYTE(v13) = v12.rem;
        }
        else {
          uint64_t v13 = -v12.rem;
        }
        *--long long v11 = v13 + 48;
      }
      while (v12.quot);
      long long v14 = (__CFString *)CFStringCreateWithBytes(0, v11, (char *)&v21 - (char *)v11, 0x8000100u, 0);
      v20[0] = v14;
      v20[1] = v7;
      v19[1] = @"section";
      v19[2] = @"items";
      v20[2] = v9;
      char v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];

      [v4 addObject:v15];
    }
  }

  return v4;
}

uint64_t __41__MPSectionedCollection__stateDumpObject__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)lazyMapWithSections:(id)a3 items:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[_MPLazyTransformSectionedCollectionDataSource alloc] initWithSectionedCollection:self sectionTransform:v7 itemTransform:v6];

  id v9 = [[MPLazySectionedCollection alloc] initWithDataSource:v8];

  return v9;
}

- (id)changeDetailsToSectionedCollection:(id)a3 applyingUIKitWorkarounds:(BOOL)a4 isEqualBlock:(id)a5 isUpdatedBlock:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [MPChangeDetails alloc];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke;
  v21[3] = &unk_1E57EEBD0;
  v21[4] = self;
  id v14 = v10;
  id v22 = v14;
  id v15 = v11;
  id v23 = v15;
  id v16 = v12;
  id v24 = v16;
  BOOL v25 = a4;
  uint64_t v17 = [(MPChangeDetails *)v13 initWithBlock:v21];
  if ([(MPChangeDetails *)v17 hasChanges])
  {
    id v18 = v17;
  }
  else
  {
    id v18 = +[MPChangeDetails empty];
  }
  int64_t v19 = v18;

  return v19;
}

void __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4F28E60] indexSet];
  objc_super v5 = [MEMORY[0x1E4F28E60] indexSet];
  id v6 = [MEMORY[0x1E4F1CA48] array];
  id v7 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v81 = 0;
  uint64_t v8 = [*(id *)(a1 + 32) numberOfSections];
  uint64_t v9 = [*(id *)(a1 + 40) numberOfSections];
  v79[0] = MEMORY[0x1E4F143A8];
  v79[1] = 3221225472;
  v79[2] = __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_2;
  v79[3] = &unk_1E57EEB08;
  id v80 = *(id *)(a1 + 48);
  id v10 = MPChangeDetailOperationGenerateEx(v8, v9, &v81, (char *)&v54, v79);
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_3;
  v73[3] = &unk_1E57EEB80;
  id v11 = v5;
  id v74 = v11;
  id v77 = *(id *)(a1 + 48);
  id v12 = v4;
  id v75 = v12;
  id v13 = v3;
  id v76 = v13;
  id v78 = *(id *)(a1 + 56);
  id v14 = (void *)MEMORY[0x19971E0F0](v73);
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_5;
  v67[3] = &unk_1E57EEB80;
  id v15 = v7;
  id v68 = v15;
  id v71 = *(id *)(a1 + 48);
  id v16 = v6;
  id v69 = v16;
  id v72 = *(id *)(a1 + 56);
  id v17 = v13;
  id v70 = v17;
  id v18 = (void (**)(void, void))MEMORY[0x19971E0F0](v67);
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_2_69;
  v61[3] = &unk_1E57EEB80;
  id v19 = v12;
  v20 = v10;
  id v45 = v19;
  id v62 = v19;
  id v65 = *(id *)(a1 + 48);
  id v44 = v11;
  id v63 = v44;
  id v21 = v17;
  id v64 = v21;
  id v66 = *(id *)(a1 + 56);
  v49 = (void *)MEMORY[0x19971E0F0](v61);
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_4_71;
  v55[3] = &unk_1E57EEB80;
  id v43 = v16;
  id v56 = v43;
  id v59 = *(id *)(a1 + 48);
  id v42 = v15;
  id v57 = v42;
  id v60 = *(id *)(a1 + 56);
  id v48 = v21;
  id v58 = v48;
  id v22 = (void (**)(void, void))MEMORY[0x19971E0F0](v55);
  unint64_t v23 = v81;
  if (v81)
  {
    uint64_t v24 = 0;
    v47 = v14;
    unint64_t v25 = 0x1E4F28000uLL;
    v46 = v20;
    while (1)
    {
      unint64_t v26 = v20[v24];
      unint64_t v27 = v26 >> 62;
      if (v26 >> 62 == 1) {
        break;
      }
      if (v27 == 3)
      {
        id v28 = [*(id *)(v25 + 3416) indexPathWithIndex:v20[v24] & 0x7FFFFFFFLL];
        v29 = (void (*)(void))v14[2];
LABEL_8:
        v29();
LABEL_31:

        unint64_t v23 = v81;
        goto LABEL_32;
      }
      if (v27 == 2)
      {
        id v28 = [*(id *)(v25 + 3416) indexPathWithIndex:(v26 >> 31) & 0x7FFFFFFF];
        v29 = (void (*)(void))v49[2];
        goto LABEL_8;
      }
LABEL_32:
      if (++v24 >= v23) {
        goto LABEL_33;
      }
    }
    v30 = [*(id *)(v25 + 3416) indexPathWithIndex:(v26 >> 31) & 0x7FFFFFFF];
    v31 = [*(id *)(v25 + 3416) indexPathWithIndex:v26 & 0x7FFFFFFF];
    unint64_t v54 = 0;
    uint64_t v32 = [*(id *)(a1 + 32) numberOfItemsInSection:(v26 >> 31) & 0x7FFFFFFF];
    uint64_t v33 = [*(id *)(a1 + 40) numberOfItemsInSection:v26 & 0x7FFFFFFF];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_6;
    v50[3] = &unk_1E57EEBA8;
    id v53 = *(id *)(a1 + 48);
    id v28 = v30;
    id v51 = v28;
    id v34 = v31;
    id v52 = v34;
    v35 = MPChangeDetailOperationGenerateEx(v32, v33, &v54, v82, v50);
    unint64_t v36 = v54;
    if (!v54)
    {
LABEL_26:
      free(v35);
      if ((*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))())
      {
        v20 = v46;
        id v14 = v47;
        if ((*(unsigned int (**)(void))(*(void *)(a1 + 56) + 16))()) {
          objc_msgSend(v48, "appendSectionUpdateForPreviousIndex:finalIndex:", objc_msgSend(v28, "section"), objc_msgSend(v34, "section"));
        }
      }
      else
      {
        ((void (*)(void *, id))v49[2])(v49, v28);
        id v14 = v47;
        ((void (*)(void *, id))v47[2])(v47, v34);
        v20 = v46;
      }

      unint64_t v25 = 0x1E4F28000;
      goto LABEL_31;
    }
    uint64_t v37 = 0;
    while (1)
    {
      unint64_t v38 = *((void *)v35 + v37);
      unint64_t v39 = v38 >> 62;
      if (v38 >> 62 == 1)
      {
        v40 = [v28 indexPathByAddingIndex:(v38 >> 31) & 0x7FFFFFFF];
        v41 = [v34 indexPathByAddingIndex:v38 & 0x7FFFFFFF];
        if ((*(unsigned int (**)(void))(*(void *)(a1 + 48) + 16))())
        {
          if ((*(unsigned int (**)(void))(*(void *)(a1 + 56) + 16))())
          {
            if ([v40 isEqual:v41]) {
              [v48 appendItemUpdateForPreviousIndexPath:v40 finalIndexPath:v41];
            }
            else {
              [v48 appendItemMoveFromIndexPath:v40 toIndexPath:v41 updated:1];
            }
          }
        }
        else
        {
          ((void (**)(void, void *))v22)[2](v22, v40);
          ((void (**)(void, void *))v18)[2](v18, v41);
        }

        goto LABEL_24;
      }
      if (v39 == 3) {
        break;
      }
      if (v39 == 2)
      {
        v40 = [v28 indexPathByAddingIndex:(v38 >> 31) & 0x7FFFFFFF];
        ((void (**)(void, void *))v22)[2](v22, v40);
LABEL_24:

        unint64_t v36 = v54;
      }
      if (++v37 >= v36) {
        goto LABEL_26;
      }
    }
    v40 = [v34 indexPathByAddingIndex:*((void *)v35 + v37) & 0x7FFFFFFFLL];
    ((void (**)(void, void *))v18)[2](v18, v40);
    goto LABEL_24;
  }
LABEL_33:
  free(v20);
  [v48 setInsertedSections:v45];
  [v48 setDeletedSections:v44];
  [v48 setInsertedItemIndexPaths:v43];
  [v48 setDeletedItemIndexPaths:v42];
  if (*(unsigned char *)(a1 + 64)) {
    [v48 applyUIKitWorkarounds];
  }
}

uint64_t __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  objc_super v5 = [MEMORY[0x1E4F28D58] indexPathWithIndex:a2];
  id v6 = [MEMORY[0x1E4F28D58] indexPathWithIndex:a3];
  uint64_t v7 = (*(uint64_t (**)(uint64_t, void *, void *))(v4 + 16))(v4, v5, v6);

  return v7;
}

void __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v4 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_4;
  v11[3] = &unk_1E57EEB30;
  id v13 = *(id *)(a1 + 56);
  id v5 = v3;
  id v12 = v5;
  id v14 = &v15;
  [v4 enumerateIndexesUsingBlock:v11];
  if (v16[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", objc_msgSend(v5, "section"));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "removeIndex:");
    id v6 = *(void **)(a1 + 48);
    uint64_t v7 = v16[3];
    uint64_t v8 = [v5 section];
    uint64_t v9 = *(void *)(a1 + 64);
    id v10 = [MEMORY[0x1E4F28D58] indexPathWithIndex:v16[3]];
    objc_msgSend(v6, "appendSectionMoveFromIndex:toIndex:updated:", v7, v8, (*(uint64_t (**)(uint64_t, void *, id))(v9 + 16))(v9, v10, v5));
  }
  _Block_object_dispose(&v15, 8);
}

void __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__5955;
  id v19 = __Block_byref_object_dispose__5956;
  id v20 = 0;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_67;
  id v10 = &unk_1E57EEB58;
  id v12 = *(id *)(a1 + 56);
  id v5 = v3;
  id v11 = v5;
  id v13 = &v21;
  id v14 = &v15;
  [v4 enumerateObjectsUsingBlock:&v7];
  if (v22[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5, v7, v8, v9, v10);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", v7, v8, v9, v10);
    uint64_t v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
    if ([(id)v16[5] isEqual:v5])
    {
      if (v6) {
        [*(id *)(a1 + 48) appendItemUpdateForPreviousIndexPath:v16[5] finalIndexPath:v5];
      }
    }
    else
    {
      [*(id *)(a1 + 48) appendItemMoveFromIndexPath:v16[5] toIndexPath:v5 updated:v6];
    }
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
}

void __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_2_69(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v4 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_3_70;
  v11[3] = &unk_1E57EEB30;
  id v13 = *(id *)(a1 + 56);
  id v5 = v3;
  id v12 = v5;
  id v14 = &v15;
  [v4 enumerateIndexesUsingBlock:v11];
  if (v16[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", objc_msgSend(v5, "section"));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "removeIndex:");
    uint64_t v6 = *(void **)(a1 + 48);
    uint64_t v7 = [v5 section];
    uint64_t v8 = v16[3];
    uint64_t v9 = *(void *)(a1 + 64);
    id v10 = [MEMORY[0x1E4F28D58] indexPathWithIndex:v8];
    objc_msgSend(v6, "appendSectionMoveFromIndex:toIndex:updated:", v7, v8, (*(uint64_t (**)(uint64_t, id, void *))(v9 + 16))(v9, v5, v10));
  }
  _Block_object_dispose(&v15, 8);
}

void __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_4_71(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__5955;
  id v19 = __Block_byref_object_dispose__5956;
  id v20 = 0;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_5_72;
  id v10 = &unk_1E57EEB58;
  id v12 = *(id *)(a1 + 56);
  id v5 = v3;
  id v11 = v5;
  id v13 = &v21;
  id v14 = &v15;
  [v4 enumerateObjectsUsingBlock:&v7];
  if (v22[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5, v7, v8, v9, v10);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", v7, v8, v9, v10);
    uint64_t v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
    if ([v5 isEqual:v16[5]])
    {
      if (v6) {
        [*(id *)(a1 + 48) appendItemUpdateForPreviousIndexPath:v5 finalIndexPath:v16[5]];
      }
    }
    else
    {
      [*(id *)(a1 + 48) appendItemMoveFromIndexPath:v5 toIndexPath:v16[5] updated:v6];
    }
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
}

uint64_t __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = [*(id *)(a1 + 32) indexPathByAddingIndex:a2];
  uint64_t v7 = [*(id *)(a1 + 40) indexPathByAddingIndex:a3];
  uint64_t v8 = (*(uint64_t (**)(uint64_t, void *, void *))(v5 + 16))(v5, v6, v7);

  return v8;
}

void __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_5_72(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if ((*(unsigned int (**)(void))(a1[5] + 16))())
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = a3;
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a2);
    *a4 = 1;
  }
}

void __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_3_70(void *a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v7 = a1[4];
  uint64_t v6 = a1[5];
  id v8 = [MEMORY[0x1E4F28D58] indexPathWithIndex:a2];
  LODWORD(v6) = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, v7, v8);

  if (v6)
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = a2;
    *a3 = 1;
  }
}

void __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_67(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if ((*(unsigned int (**)(void))(a1[5] + 16))())
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = a3;
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a2);
    *a4 = 1;
  }
}

void __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_4(void *a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v6 = a1[5];
  uint64_t v7 = [MEMORY[0x1E4F28D58] indexPathWithIndex:a2];
  LODWORD(v6) = (*(uint64_t (**)(uint64_t, void *, void))(v6 + 16))(v6, v7, a1[4]);

  if (v6)
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = a2;
    *a3 = 1;
  }
}

- (id)changeDetailsToSectionedCollection:(id)a3 isEqualBlock:(id)a4 isUpdatedBlock:(id)a5
{
  return [(MPSectionedCollection *)self changeDetailsToSectionedCollection:a3 applyingUIKitWorkarounds:1 isEqualBlock:a4 isUpdatedBlock:a5];
}

- (id)lastSection
{
  return [(NSArray *)self->_sections lastObject];
}

- (BOOL)hasSameContentAsSectionedCollection:(id)a3
{
  return self == a3;
}

- (id)itemsInSectionAtIndex:(int64_t)a3
{
  return [(NSArray *)self->_sectionedItems objectAtIndex:a3];
}

- (id)firstSection
{
  return [(NSArray *)self->_sections firstObject];
}

- (void)enumerateItemsUsingBlock:(id)a3
{
  id v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  char v11 = 0;
  sectionedItems = self->_sectionedItems;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__MPSectionedCollection_enumerateItemsUsingBlock___block_invoke;
  v7[3] = &unk_1E57EEAE0;
  id v6 = v4;
  id v8 = v6;
  uint64_t v9 = v10;
  [(NSArray *)sectionedItems enumerateObjectsUsingBlock:v7];

  _Block_object_dispose(v10, 8);
}

void __50__MPSectionedCollection_enumerateItemsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__MPSectionedCollection_enumerateItemsUsingBlock___block_invoke_2;
  void v10[3] = &unk_1E57EEAB8;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v11 = v8;
  uint64_t v12 = v9;
  uint64_t v13 = a3;
  [a2 enumerateObjectsUsingBlock:v10];
  if (a4 && *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a4 = 1;
  }
}

void __50__MPSectionedCollection_enumerateItemsUsingBlock___block_invoke_2(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  uint64_t v7 = (void *)MEMORY[0x19971DE60]();
  uint64_t v8 = a1[4];
  uint64_t v9 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:a1[6]];
  (*(void (**)(uint64_t, id, void *, uint64_t))(v8 + 16))(v8, v10, v9, *(void *)(a1[5] + 8) + 24);

  if (a4 && *(unsigned char *)(*(void *)(a1[5] + 8) + 24)) {
    *a4 = 1;
  }
}

- (id)allSections
{
  v2 = (void *)[(NSArray *)self->_sections copy];

  return v2;
}

- (id)allItems
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[MPSectionedCollection totalItemCount](self, "totalItemCount"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_sectionedItems;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addObjectsFromArray:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  uint64_t v9 = (void *)[v3 copy];

  return v9;
}

- (id)lastItem
{
  v2 = [(NSArray *)self->_sectionedItems lastObject];
  id v3 = [v2 lastObject];

  return v3;
}

- (id)firstItem
{
  v2 = [(NSArray *)self->_sectionedItems firstObject];
  id v3 = [v2 firstObject];

  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MPMutableSectionedCollection);
  if (v4)
  {
    uint64_t v5 = [(NSArray *)self->_sections mutableCopy];
    sections = v4->super._sections;
    v4->super._sections = (NSArray *)v5;

    uint64_t v7 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_sectionedItems, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v8 = self->_sectionedItems;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v12), "mutableCopy", (void)v16);
          [(NSArray *)v7 addObject:v13];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    sectionedItems = v4->super._sectionedItems;
    v4->super._sectionedItems = v7;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  int64_t v7 = [(MPSectionedCollection *)self numberOfSections];
  uint64_t v8 = v7;
  uint64_t v9 = @"sections";
  if (v7 == 1) {
    uint64_t v9 = @"section";
  }
  [v6 appendFormat:@"; %lu %@", v7, v9];
  [v6 appendString:@"; ["];
  if (v8 >= 1)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      int64_t v11 = [(MPSectionedCollection *)self numberOfItemsInSection:i];
      uint64_t v12 = [(MPSectionedCollection *)self sectionAtIndex:i];
      uint64_t v13 = [v12 description];
      long long v14 = (void *)v13;
      if (v11 == 1) {
        uint64_t v15 = @"item";
      }
      else {
        uint64_t v15 = @"items";
      }
      [v6 appendFormat:@"\n    %@ (%lu %@),", v13, v11, v15];
    }
    [v6 appendString:@"\n"];
  }
  [v6 appendString:@"]"];
  [v6 appendString:@">"];

  return (NSString *)v6;
}

- (NSString)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  int64_t v7 = [(MPSectionedCollection *)self numberOfSections];
  uint64_t v8 = v7;
  uint64_t v9 = @"sections";
  if (v7 == 1) {
    uint64_t v9 = @"section";
  }
  [v6 appendFormat:@"; %lu %@", v7, v9];
  [v6 appendString:@": ["];
  if (v8 >= 1)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      uint64_t v11 = [(MPSectionedCollection *)self numberOfItemsInSection:i];
      uint64_t v12 = [(MPSectionedCollection *)self sectionAtIndex:i];
      uint64_t v13 = [v12 debugDescription];
      long long v14 = (void *)v13;
      uint64_t v15 = @"items";
      if (v11 == 1) {
        uint64_t v15 = @"item";
      }
      [v6 appendFormat:@"\n    %@ (%lu %@): [", v13, v11, v15];

      if (v11 >= 1)
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          long long v17 = [MEMORY[0x1E4F28D58] indexPathForItem:j inSection:i];
          long long v18 = [(MPSectionedCollection *)self itemAtIndexPath:v17];
          long long v19 = [v18 debugDescription];
          [v6 appendFormat:@"\n        %@,", v19];
        }
        [v6 appendString:@"\n    "];
      }
      [v6 appendString:@"],"];
    }
    [v6 appendString:@"\n"];
  }
  [v6 appendString:@"]"];
  [v6 appendString:@">"];

  return (NSString *)v6;
}

- (void)encodeWithCoder:(id)a3
{
  sectionedItems = self->_sectionedItems;
  id v5 = a3;
  [v5 encodeObject:sectionedItems forKey:@"sectionedItems"];
  [v5 encodeObject:self->_sections forKey:@"sections"];
}

- (MPSectionedCollection)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MPSectionedCollection;
  id v5 = [(MPSectionedCollection *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 allowedClasses];
    int64_t v7 = [v6 setByAddingObject:objc_opt_class()];

    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"sectionedItems"];
    sectionedItems = v5->_sectionedItems;
    v5->_sectionedItems = (NSArray *)v8;

    uint64_t v10 = [v4 decodeObjectOfClasses:v7 forKey:@"sections"];
    sections = v5->_sections;
    v5->_sections = (NSArray *)v10;
  }
  return v5;
}

- (id)indexPathForItemWithIdentifiersIntersectingSet:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MPSectionedCollection *)self numberOfSections];
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
      uint64_t v8 = [(MPSectionedCollection *)self numberOfItemsInSection:v7];
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
          uint64_t v11 = [MEMORY[0x1E4F28D58] indexPathForItem:v10 - 1 inSection:v7];
          uint64_t v12 = [(MPSectionedCollection *)self identifiersForItemAtIndexPath:v11];
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

- (id)identifiersForSectionAtIndex:(int64_t)a3
{
  id v3 = [(MPSectionedCollection *)self sectionAtIndex:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v3 identifiers];
    }
    else {
    id v4 = +[MPIdentifierSet emptyIdentifierSet];
    }
  }
  uint64_t v5 = v4;

  return v5;
}

- (id)identifiersForItemAtIndexPath:(id)a3
{
  id v3 = [(MPSectionedCollection *)self itemAtIndexPath:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v3 identifiers];
    }
    else {
    id v4 = +[MPIdentifierSet emptyIdentifierSet];
    }
  }
  uint64_t v5 = v4;

  return v5;
}

@end