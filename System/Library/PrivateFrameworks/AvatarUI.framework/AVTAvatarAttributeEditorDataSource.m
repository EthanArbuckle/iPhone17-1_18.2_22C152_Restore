@interface AVTAvatarAttributeEditorDataSource
+ (id)sectionControllerForSection:(id)a3 renderingScheduler:(id)a4 environment:(id)a5;
+ (unint64_t)indexForCurrentCategoryGivenPreferredIdentifier:(id)a3 categories:(id)a4;
- (AVTAvatarAttributeEditorDataSource)initWithCategories:(id)a3 currentCategoryIdentifier:(id)a4 renderingScheduler:(id)a5;
- (AVTAvatarAttributeEditorDataSource)initWithCategories:(id)a3 currentCategoryIdentifier:(id)a4 renderingScheduler:(id)a5 environment:(id)a6;
- (AVTTaskScheduler)renderingScheduler;
- (AVTUIEnvironment)environment;
- (BOOL)shouldDisplaySectionWithDisplayCondition:(id)a3 inCategoryAtIndex:(unint64_t)a4;
- (NSArray)categories;
- (NSMutableDictionary)sectionControllers;
- (NSMutableDictionary)sectionCoordinatorsByProvider;
- (id)categoryAtIndex:(int64_t)a3;
- (id)currentCategoryIdentifier;
- (id)groupPickerItemsForCategories;
- (id)indexesForSectionsExcludingSectionsWithIdentifiers:(id)a3 inCategoryAtIndex:(int64_t)a4;
- (id)indexesForSectionsPresentIn:(id)a3 butNotIn:(id)a4;
- (id)sectionControllerForSection:(id)a3;
- (id)sectionControllerForSectionIndex:(int64_t)a3 inCategoryAtIndex:(int64_t)a4;
- (id)sectionCoordinatorForSectionAtIndex:(int64_t)a3 inCategoryAtIndex:(int64_t)a4;
- (id)sectionForIndex:(int64_t)a3 inCategoryAtIndex:(int64_t)a4;
- (id)sectionProviderForSectionAtIndex:(int64_t)a3 inCategoryAtIndex:(int64_t)a4;
- (int64_t)indexForSection:(id)a3 inCategoryAtIndex:(int64_t)a4;
- (int64_t)numberOfCategories;
- (int64_t)numberOfSectionsForCategoryAtIndex:(int64_t)a3;
- (unint64_t)currentCategoryIndex;
- (void)discardControllersForNonCurrentCategory;
- (void)reloadWithCategories:(id)a3 currentCategoryIndex:(unint64_t)a4;
- (void)setCategories:(id)a3;
- (void)setCurrentCategoryIndex:(unint64_t)a3;
- (void)setSectionControllers:(id)a3;
- (void)setSectionCoordinatorsByProvider:(id)a3;
- (void)updateCoordinatorsFromCategory:(id)a3 currentCoordinators:(id)a4;
@end

@implementation AVTAvatarAttributeEditorDataSource

+ (id)sectionControllerForSection:(id)a3 renderingScheduler:(id)a4 environment:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 conformsToProtocol:&unk_26BF7A790])
  {
    v10 = [[AVTAvatarAttributeEditorSectionColorController alloc] initWithEnvironment:v9];
LABEL_5:
    v11 = (AVTAvatarAttributeEditorSectionController *)v10;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = objc_alloc_init(AVTAvatarAttributeEditorMulticolorSectionPickerController);
    goto LABEL_5;
  }
  v12 = [AVTOrderedIndexBasedTaskScheduler alloc];
  v13 = [v9 coreEnvironment];
  v14 = [(AVTOrderedIndexBasedTaskScheduler *)v12 initWithEnvironment:v13];

  v11 = [[AVTAvatarAttributeEditorSectionController alloc] initWithThumbnailScheduler:v14 renderingScheduler:v8 environment:v9];
LABEL_7:

  return v11;
}

+ (unint64_t)indexForCurrentCategoryGivenPreferredIdentifier:(id)a3 categories:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    if (v5)
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __97__AVTAvatarAttributeEditorDataSource_indexForCurrentCategoryGivenPreferredIdentifier_categories___block_invoke;
      v10[3] = &unk_263FF0A78;
      id v11 = v5;
      uint64_t v7 = [v6 indexOfObjectPassingTest:v10];
      if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v8 = 0;
      }
      else {
        unint64_t v8 = v7;
      }
    }
    else
    {
      unint64_t v8 = 0;
    }
  }
  else
  {
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

uint64_t __97__AVTAvatarAttributeEditorDataSource_indexForCurrentCategoryGivenPreferredIdentifier_categories___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 modelGroup];
  v4 = [v3 name];
  uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];

  return v5;
}

- (AVTAvatarAttributeEditorDataSource)initWithCategories:(id)a3 currentCategoryIdentifier:(id)a4 renderingScheduler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[AVTUIEnvironment defaultEnvironment];
  v12 = [(AVTAvatarAttributeEditorDataSource *)self initWithCategories:v10 currentCategoryIdentifier:v9 renderingScheduler:v8 environment:v11];

  return v12;
}

- (AVTAvatarAttributeEditorDataSource)initWithCategories:(id)a3 currentCategoryIdentifier:(id)a4 renderingScheduler:(id)a5 environment:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)AVTAvatarAttributeEditorDataSource;
  v15 = [(AVTAvatarAttributeEditorDataSource *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_categories, a3);
    uint64_t v17 = [MEMORY[0x263EFF9A0] dictionary];
    sectionControllers = v16->_sectionControllers;
    v16->_sectionControllers = (NSMutableDictionary *)v17;

    uint64_t v19 = [MEMORY[0x263EFF9A0] dictionary];
    sectionCoordinatorsByProvider = v16->_sectionCoordinatorsByProvider;
    v16->_sectionCoordinatorsByProvider = (NSMutableDictionary *)v19;

    objc_storeStrong((id *)&v16->_environment, a6);
    objc_storeStrong((id *)&v16->_renderingScheduler, a5);
    v16->_currentCategoryIndex = [(id)objc_opt_class() indexForCurrentCategoryGivenPreferredIdentifier:v12 categories:v11];
  }

  return v16;
}

- (void)reloadWithCategories:(id)a3 currentCategoryIndex:(unint64_t)a4
{
  id v8 = a3;
  if ([v8 count])
  {
    id v6 = [v8 objectAtIndexedSubscript:a4];
    uint64_t v7 = [(AVTAvatarAttributeEditorDataSource *)self sectionCoordinatorsByProvider];
    [(AVTAvatarAttributeEditorDataSource *)self updateCoordinatorsFromCategory:v6 currentCoordinators:v7];
  }
  [(AVTAvatarAttributeEditorDataSource *)self setCategories:v8];
  [(AVTAvatarAttributeEditorDataSource *)self setCurrentCategoryIndex:a4];
  [(AVTAvatarAttributeEditorDataSource *)self discardControllersForNonCurrentCategory];
}

- (void)updateCoordinatorsFromCategory:(id)a3 currentCoordinators:(id)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v5)
  {
    id v8 = [v6 allKeys];
    id v9 = (void *)[v8 mutableCopy];

    id v10 = [v5 sectionProviders];
    id v11 = objc_msgSend(v10, "avt_map:", &__block_literal_global_6);

    id v12 = [v11 differenceFromArray:v9];
    id v13 = [v12 removals];

    if (v13)
    {
      id v14 = [v12 removals];
      v15 = objc_msgSend(v14, "avt_map:", &__block_literal_global_101);

      [v7 removeObjectsForKeys:v15];
    }
    v16 = [v12 insertions];

    if (v16)
    {
      v41 = v11;
      v42 = v9;
      uint64_t v17 = [v12 insertions];
      v18 = objc_msgSend(v17, "avt_map:", &__block_literal_global_103);

      uint64_t v19 = (void *)MEMORY[0x263EFF9A0];
      v20 = [v5 sectionProviders];
      v21 = objc_msgSend(v19, "dictionaryWithCapacity:", objc_msgSend(v20, "count"));

      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v43 = v5;
      objc_super v22 = [v5 sectionProviders];
      uint64_t v23 = [v22 countByEnumeratingWithState:&v48 objects:v53 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v49;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v49 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = *(void **)(*((void *)&v48 + 1) + 8 * i);
            v28 = [v27 identifier];
            [v21 setObject:v27 forKeyedSubscript:v28];
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v48 objects:v53 count:16];
        }
        while (v24);
      }
      v40 = v12;

      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v29 = v18;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v44 objects:v52 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v45;
        do
        {
          for (uint64_t j = 0; j != v31; ++j)
          {
            if (*(void *)v45 != v32) {
              objc_enumerationMutation(v29);
            }
            v34 = objc_msgSend(v21, "objectForKeyedSubscript:", *(void *)(*((void *)&v44 + 1) + 8 * j), v40);
            v35 = v34;
            if (v34)
            {
              v36 = [v34 sections];
              unint64_t v37 = [v36 count];

              if (v37 >= 2)
              {
                v38 = objc_alloc_init(AVTAvatarAttributeEditorSectionCoordinator);
                v39 = [v35 identifier];
                [v7 setObject:v38 forKeyedSubscript:v39];
              }
            }
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v44 objects:v52 count:16];
        }
        while (v31);
      }

      id v9 = v42;
      id v5 = v43;
      id v12 = v40;
      id v11 = v41;
    }
  }
}

uint64_t __89__AVTAvatarAttributeEditorDataSource_updateCoordinatorsFromCategory_currentCoordinators___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __89__AVTAvatarAttributeEditorDataSource_updateCoordinatorsFromCategory_currentCoordinators___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 object];
}

uint64_t __89__AVTAvatarAttributeEditorDataSource_updateCoordinatorsFromCategory_currentCoordinators___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 object];
}

- (void)discardControllersForNonCurrentCategory
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v3 = [(AVTAvatarAttributeEditorDataSource *)self categories];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    unint64_t v5 = 0;
    do
    {
      if (v5 != [(AVTAvatarAttributeEditorDataSource *)self currentCategoryIndex])
      {
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v6 = [(AVTAvatarAttributeEditorDataSource *)self categories];
        uint64_t v7 = [v6 objectAtIndexedSubscript:v5];
        id v8 = [v7 sections];

        uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v19;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v19 != v11) {
                objc_enumerationMutation(v8);
              }
              id v13 = *(void **)(*((void *)&v18 + 1) + 8 * v12);
              id v14 = [(AVTAvatarAttributeEditorDataSource *)self sectionControllers];
              v15 = [v13 identifier];
              [v14 setObject:0 forKeyedSubscript:v15];

              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
          }
          while (v10);
        }
      }
      ++v5;
      v16 = [(AVTAvatarAttributeEditorDataSource *)self categories];
      unint64_t v17 = [v16 count];
    }
    while (v5 < v17);
  }
}

- (int64_t)numberOfCategories
{
  v2 = [(AVTAvatarAttributeEditorDataSource *)self categories];
  int64_t v3 = [v2 count];

  return v3;
}

- (id)groupPickerItemsForCategories
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int64_t v3 = (void *)MEMORY[0x263EFF980];
  uint64_t v4 = [(AVTAvatarAttributeEditorDataSource *)self categories];
  unint64_t v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [(AVTAvatarAttributeEditorDataSource *)self categories];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = [AVTGroupPickerItem alloc];
        id v13 = [v11 localizedName];
        id v14 = [v11 symbolNameProvider];
        v15 = [(AVTGroupPickerItem *)v12 initWithLocalizedName:v13 symbolNameProvider:v14];

        [v5 addObject:v15];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)categoryAtIndex:(int64_t)a3
{
  uint64_t v4 = [(AVTAvatarAttributeEditorDataSource *)self categories];
  unint64_t v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (id)sectionProviderForSectionAtIndex:(int64_t)a3 inCategoryAtIndex:(int64_t)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  unint64_t v5 = [(AVTAvatarAttributeEditorDataSource *)self categoryAtIndex:a4];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = objc_msgSend(v5, "sectionProviders", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v13 = [v12 sections];
        unint64_t v14 = [v13 count] + v9;

        if (v14 >= a3)
        {
          id v16 = v12;
          goto LABEL_11;
        }
        v15 = [v12 sections];
        v9 += [v15 count];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v16 = 0;
LABEL_11:

  return v16;
}

- (int64_t)numberOfSectionsForCategoryAtIndex:(int64_t)a3
{
  uint64_t v4 = [(AVTAvatarAttributeEditorDataSource *)self categories];
  unint64_t v5 = [v4 objectAtIndexedSubscript:a3];
  id v6 = [v5 sections];
  int64_t v7 = [v6 count];

  return v7;
}

- (id)sectionControllerForSectionIndex:(int64_t)a3 inCategoryAtIndex:(int64_t)a4
{
  int64_t v7 = -[AVTAvatarAttributeEditorDataSource sectionForIndex:inCategoryAtIndex:](self, "sectionForIndex:inCategoryAtIndex:");
  uint64_t v8 = [(AVTAvatarAttributeEditorDataSource *)self sectionControllerForSection:v7];
  uint64_t v9 = [(AVTAvatarAttributeEditorDataSource *)self sectionProviderForSectionAtIndex:a3 inCategoryAtIndex:a4];
  uint64_t v10 = [(AVTAvatarAttributeEditorDataSource *)self sectionCoordinatorsByProvider];
  uint64_t v11 = [v9 identifier];
  uint64_t v12 = [v10 objectForKeyedSubscript:v11];

  if (v12) {
    [v12 addSectionController:v8];
  }

  return v8;
}

- (id)sectionCoordinatorForSectionAtIndex:(int64_t)a3 inCategoryAtIndex:(int64_t)a4
{
  unint64_t v5 = [(AVTAvatarAttributeEditorDataSource *)self sectionProviderForSectionAtIndex:a3 inCategoryAtIndex:a4];
  id v6 = [(AVTAvatarAttributeEditorDataSource *)self sectionCoordinatorsByProvider];
  int64_t v7 = [v5 identifier];
  uint64_t v8 = [v6 objectForKeyedSubscript:v7];

  return v8;
}

- (id)sectionControllerForSection:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(AVTAvatarAttributeEditorDataSource *)self sectionControllers];
  id v6 = [v4 identifier];
  int64_t v7 = [v5 objectForKeyedSubscript:v6];

  if (!v7)
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = [(AVTAvatarAttributeEditorDataSource *)self renderingScheduler];
    uint64_t v10 = [(AVTAvatarAttributeEditorDataSource *)self environment];
    int64_t v7 = [v8 sectionControllerForSection:v4 renderingScheduler:v9 environment:v10];
  }
  [v7 updateWithSection:v4];
  uint64_t v11 = [(AVTAvatarAttributeEditorDataSource *)self sectionControllers];
  uint64_t v12 = [v4 identifier];
  [v11 setObject:v7 forKeyedSubscript:v12];

  return v7;
}

- (id)sectionForIndex:(int64_t)a3 inCategoryAtIndex:(int64_t)a4
{
  int64_t v7 = [(AVTAvatarAttributeEditorDataSource *)self categories];
  if ([v7 count] <= (unint64_t)a4)
  {
    unint64_t v14 = 0;
    goto LABEL_5;
  }
  uint64_t v8 = [(AVTAvatarAttributeEditorDataSource *)self categories];
  uint64_t v9 = [v8 objectAtIndexedSubscript:a4];
  uint64_t v10 = [v9 sections];
  unint64_t v11 = [v10 count];

  if (v11 > a3)
  {
    int64_t v7 = [(AVTAvatarAttributeEditorDataSource *)self categories];
    uint64_t v12 = [v7 objectAtIndexedSubscript:a4];
    id v13 = [v12 sections];
    unint64_t v14 = [v13 objectAtIndexedSubscript:a3];

LABEL_5:
    goto LABEL_7;
  }
  unint64_t v14 = 0;
LABEL_7:
  return v14;
}

- (int64_t)indexForSection:(id)a3 inCategoryAtIndex:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = [(AVTAvatarAttributeEditorDataSource *)self categories];
  uint64_t v8 = [v7 objectAtIndexedSubscript:a4];
  uint64_t v9 = [v8 sections];
  int64_t v10 = [v9 indexOfObject:v6];

  return v10;
}

- (id)indexesForSectionsExcludingSectionsWithIdentifiers:(id)a3 inCategoryAtIndex:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = [(AVTAvatarAttributeEditorDataSource *)self categories];
  uint64_t v8 = [v7 objectAtIndexedSubscript:a4];
  uint64_t v9 = [v8 sections];

  if ([v9 count])
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __107__AVTAvatarAttributeEditorDataSource_indexesForSectionsExcludingSectionsWithIdentifiers_inCategoryAtIndex___block_invoke;
    v12[3] = &unk_263FF0AE0;
    id v13 = v6;
    int64_t v10 = [v9 indexesOfObjectsPassingTest:v12];
  }
  else
  {
    int64_t v10 = [MEMORY[0x263F088D0] indexSet];
  }

  return v10;
}

uint64_t __107__AVTAvatarAttributeEditorDataSource_indexesForSectionsExcludingSectionsWithIdentifiers_inCategoryAtIndex___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  int64_t v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

- (id)indexesForSectionsPresentIn:(id)a3 butNotIn:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int64_t v7 = [v5 sections];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    uint64_t v9 = [v6 sections];
    int64_t v10 = objc_msgSend(v9, "avt_map:", &__block_literal_global_111);

    unint64_t v11 = [v5 sections];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __75__AVTAvatarAttributeEditorDataSource_indexesForSectionsPresentIn_butNotIn___block_invoke_2;
    v15[3] = &unk_263FF0B28;
    id v16 = v10;
    id v12 = v10;
    id v13 = [v11 indexesOfObjectsPassingTest:v15];
  }
  else
  {
    id v13 = [MEMORY[0x263F088D0] indexSet];
  }

  return v13;
}

uint64_t __75__AVTAvatarAttributeEditorDataSource_indexesForSectionsPresentIn_butNotIn___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __75__AVTAvatarAttributeEditorDataSource_indexesForSectionsPresentIn_butNotIn___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  int64_t v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

- (id)currentCategoryIdentifier
{
  v2 = [(AVTAvatarAttributeEditorDataSource *)self categoryAtIndex:[(AVTAvatarAttributeEditorDataSource *)self currentCategoryIndex]];
  int64_t v3 = [v2 modelGroup];
  uint64_t v4 = [v3 name];

  return v4;
}

- (BOOL)shouldDisplaySectionWithDisplayCondition:(id)a3 inCategoryAtIndex:(unint64_t)a4
{
  id v6 = a3;
  int64_t v7 = -[AVTAvatarAttributeEditorDataSource sectionForIndex:inCategoryAtIndex:](self, "sectionForIndex:inCategoryAtIndex:", [v6 targetSectionIndex], a4);
  if (v7)
  {
    uint64_t v8 = [(AVTAvatarAttributeEditorDataSource *)self sectionControllerForSection:v7];
    uint64_t v9 = v8;
    if (v8) {
      char v10 = [v8 evaluateDisplayCondition:v6];
    }
    else {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)currentCategoryIndex
{
  return self->_currentCategoryIndex;
}

- (void)setCurrentCategoryIndex:(unint64_t)a3
{
  self->_currentCategoryIndex = a3;
}

- (NSArray)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
}

- (NSMutableDictionary)sectionControllers
{
  return self->_sectionControllers;
}

- (void)setSectionControllers:(id)a3
{
}

- (NSMutableDictionary)sectionCoordinatorsByProvider
{
  return self->_sectionCoordinatorsByProvider;
}

- (void)setSectionCoordinatorsByProvider:(id)a3
{
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTTaskScheduler)renderingScheduler
{
  return self->_renderingScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderingScheduler, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_sectionCoordinatorsByProvider, 0);
  objc_storeStrong((id *)&self->_sectionControllers, 0);
  objc_storeStrong((id *)&self->_categories, 0);
}

@end