@interface WFContentItemRegistry
+ (WFContentItemRegistry)sharedRegistry;
+ (id)allContentItemClassesInContentKit;
+ (id)inputContentItemClassesMatchingShortcutInputClasses:(id)a3;
+ (id)shortcutInputClassesMatchingInputContentItemsOfClasses:(id)a3 hostBundleIdentifier:(id)a4;
- (Class)contentItemClassForType:(id)a3;
- (NSMutableDictionary)lock_contentItemClassesByType;
- (NSMutableSet)lock_allItemClasses;
- (NSSet)allOwnedTypes;
- (NSSet)contentItemClasses;
- (WFContentItemRegistry)init;
- (id)contentItemClassesForShareSheetWithExtensionMatchingDictionaries:(id)a3;
- (id)contentItemClassesForShareSheetWithExtensionMatchingDictionaries:(id)a3 hostBundleIdentifier:(id)a4;
- (id)contentItemClassesSupportingType:(id)a3;
- (os_unfair_lock_s)lock;
- (void)lock_registerContentItemClass:(Class)a3;
- (void)rediscoverContentItemClassesIfNeeded;
- (void)registerContentItemClass:(Class)a3;
@end

@implementation WFContentItemRegistry

- (void)registerContentItemClass:(Class)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(WFContentItemRegistry *)self lock_registerContentItemClass:a3];
  os_unfair_lock_unlock(p_lock);
}

+ (WFContentItemRegistry)sharedRegistry
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__WFContentItemRegistry_sharedRegistry__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedRegistry_onceToken != -1) {
    dispatch_once(&sharedRegistry_onceToken, block);
  }
  v2 = (void *)sharedRegistry_sharedRegistry;
  return (WFContentItemRegistry *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_allItemClasses, 0);
  objc_storeStrong((id *)&self->_lock_contentItemClassesByType, 0);
}

- (NSMutableSet)lock_allItemClasses
{
  return self->_lock_allItemClasses;
}

- (NSMutableDictionary)lock_contentItemClassesByType
{
  return self->_lock_contentItemClassesByType;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (id)contentItemClassesSupportingType:(id)a3
{
  v4 = [(objc_class *)[(WFContentItemRegistry *)self contentItemClassForType:a3] ownedTypes];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = [(WFContentItemRegistry *)self lock_allItemClasses];
  v7 = (void *)[v6 copy];

  os_unfair_lock_unlock(p_lock);
  v8 = (void *)MEMORY[0x263F08A98];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __58__WFContentItemRegistry_contentItemClassesSupportingType___block_invoke;
  v13[3] = &unk_264285968;
  id v14 = v4;
  id v9 = v4;
  v10 = [v8 predicateWithBlock:v13];
  v11 = [v7 filteredSetUsingPredicate:v10];

  return v11;
}

uint64_t __58__WFContentItemRegistry_contentItemClassesSupportingType___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 supportedTypes];
  uint64_t v4 = [v3 intersectsOrderedSet:*(void *)(a1 + 32)];

  return v4;
}

- (Class)contentItemClassForType:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(WFContentItemRegistry *)self rediscoverContentItemClassesIfNeeded];
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v6 = [(WFContentItemRegistry *)self lock_contentItemClassesByType];
    v7 = (void *)[v6 copy];

    os_unfair_lock_unlock(p_lock);
    v8 = (void *)[v7 objectForKey:v4];
    if (v8)
    {
      id v9 = v8;
    }
    else
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v10 = v7;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v21;
        uint64_t v14 = *MEMORY[0x263F1DA48];
        uint64_t v15 = *MEMORY[0x263F1DA38];
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v10);
            }
            v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            if ((objc_msgSend(v17, "isEqualToUTType:", v14, (void)v20) & 1) == 0
              && ([v17 isEqualToUTType:v15] & 1) == 0
              && ([v4 conformsToType:v17] & 1) != 0)
            {
              id v9 = [v10 objectForKey:v17];

              goto LABEL_21;
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (([v4 isDeclared] & 1) != 0 || objc_msgSend(v4, "isDynamic")))
      {
        v18 = objc_msgSend(MEMORY[0x263F852B8], "typeWithUTType:", *MEMORY[0x263F1DA48], (void)v20);
        id v9 = [v10 objectForKey:v18];
      }
      else
      {
        id v9 = 0;
      }
    }
LABEL_21:
  }
  else
  {
    id v9 = 0;
  }

  return (Class)v9;
}

- (NSSet)contentItemClasses
{
  [(WFContentItemRegistry *)self rediscoverContentItemClassesIfNeeded];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(WFContentItemRegistry *)self lock_allItemClasses];
  v5 = (void *)[v4 copy];

  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v5;
}

- (NSSet)allOwnedTypes
{
  [(WFContentItemRegistry *)self rediscoverContentItemClassesIfNeeded];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = objc_alloc(MEMORY[0x263EFFA08]);
  v5 = [(WFContentItemRegistry *)self lock_contentItemClassesByType];
  v6 = [v5 allKeys];
  v7 = (void *)[v4 initWithArray:v6];

  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v7;
}

- (void)lock_registerContentItemClass:(Class)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    long long v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"WFContentItemRegistry.m", 114, @"Invalid parameter not satisfying: %@", @"contentItemClass" object file lineNumber description];
  }
  os_unfair_lock_assert_owner(&self->_lock);
  if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()])
  {
    v5 = [(WFContentItemRegistry *)self lock_contentItemClassesByType];
    v6 = [(WFContentItemRegistry *)self lock_allItemClasses];
    [v6 addObject:a3];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v7 = [(objc_class *)a3 ownedTypes];
    v8 = (void *)[v7 copy];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v8);
          }
          WFRegisterTypeForItemClass(*(void **)(*((void *)&v25 + 1) + 8 * i), a3, v5);
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v10);
    }

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v13 = [(objc_class *)a3 ownedPasteboardTypes];
    uint64_t v14 = (void *)[v13 copy];

    uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          WFRegisterTypeForItemClass(*(void **)(*((void *)&v21 + 1) + 8 * j), a3, v5);
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v16);
    }
  }
}

- (WFContentItemRegistry)init
{
  v10.receiver = self;
  v10.super_class = (Class)WFContentItemRegistry;
  v2 = [(WFContentItemRegistry *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    lock_contentItemClassesByType = v3->_lock_contentItemClassesByType;
    v3->_lock_contentItemClassesByType = v4;

    uint64_t v6 = objc_opt_new();
    lock_allItemClasses = v3->_lock_allItemClasses;
    v3->_lock_allItemClasses = (NSMutableSet *)v6;

    v8 = v3;
  }

  return v3;
}

- (void)rediscoverContentItemClassesIfNeeded
{
  if (rediscoverContentItemClassesIfNeeded_onceToken != -1) {
    dispatch_once(&rediscoverContentItemClassesIfNeeded_onceToken, &__block_literal_global_390);
  }
  v3 = objc_opt_class();
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __61__WFContentItemRegistry_rediscoverContentItemClassesIfNeeded__block_invoke_2;
  v4[3] = &unk_264285940;
  v4[4] = self;
  WFRegisterClassesFromClassVendingMethodsIfNeeded(v3, @"allContentItemClassesIn", &self->_lock, WFShouldRediscoverContentItemClasses, (void *)rediscoverContentItemClassesIfNeeded_calledContentItemVendingSelectors, v4);
}

uint64_t __61__WFContentItemRegistry_rediscoverContentItemClassesIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "lock_registerContentItemClass:", a2);
}

uint64_t __61__WFContentItemRegistry_rediscoverContentItemClassesIfNeeded__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)rediscoverContentItemClassesIfNeeded_calledContentItemVendingSelectors;
  rediscoverContentItemClassesIfNeeded_calledContentItemVendingSelectors = v0;

  return MEMORY[0x270ED7FD8](WFDyldBulkImageLoadCallback);
}

uint64_t __39__WFContentItemRegistry_sharedRegistry__block_invoke(uint64_t a1)
{
  sharedRegistry_sharedRegistry = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (id)contentItemClassesForShareSheetWithExtensionMatchingDictionaries:(id)a3 hostBundleIdentifier:(id)a4
{
  id v6 = a4;
  v7 = [(WFContentItemRegistry *)self contentItemClassesForShareSheetWithExtensionMatchingDictionaries:a3];
  v8 = [(id)objc_opt_class() shortcutInputClassesMatchingInputContentItemsOfClasses:v7 hostBundleIdentifier:v6];

  return v8;
}

- (id)contentItemClassesForShareSheetWithExtensionMatchingDictionaries:(id)a3
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v55 objects:v61 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v56;
    uint64_t v36 = *(void *)v56;
    id v37 = v5;
    do
    {
      uint64_t v9 = 0;
      uint64_t v38 = v7;
      do
      {
        if (*(void *)v56 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v10 = *(void **)(*((void *)&v55 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v40 = v9;
          uint64_t v11 = NSStringFromSelector(sel_attachments);
          uint64_t v12 = [v10 objectForKey:v11];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v53 = 0u;
            long long v54 = 0u;
            long long v51 = 0u;
            long long v52 = 0u;
            v39 = v12;
            id v13 = v12;
            uint64_t v14 = [v13 countByEnumeratingWithState:&v51 objects:v60 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              uint64_t v16 = *(void *)v52;
              uint64_t v41 = *(void *)v52;
              id v42 = v13;
              do
              {
                uint64_t v17 = 0;
                uint64_t v43 = v15;
                do
                {
                  if (*(void *)v52 != v16) {
                    objc_enumerationMutation(v13);
                  }
                  v18 = *(void **)(*((void *)&v51 + 1) + 8 * v17);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    v19 = NSStringFromSelector(sel_registeredTypeIdentifiers);
                    long long v20 = [v18 objectForKey:v19];

                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v49 = 0u;
                      long long v50 = 0u;
                      long long v47 = 0u;
                      long long v48 = 0u;
                      id v21 = v20;
                      uint64_t v22 = [v21 countByEnumeratingWithState:&v47 objects:v59 count:16];
                      if (v22)
                      {
                        uint64_t v23 = v22;
                        uint64_t v24 = *(void *)v48;
                        do
                        {
                          for (uint64_t i = 0; i != v23; ++i)
                          {
                            if (*(void *)v48 != v24) {
                              objc_enumerationMutation(v21);
                            }
                            uint64_t v26 = *(void *)(*((void *)&v47 + 1) + 8 * i);
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              long long v27 = [MEMORY[0x263F852B8] typeWithString:v26];
                              [v4 addObject:v27];
                            }
                          }
                          uint64_t v23 = [v21 countByEnumeratingWithState:&v47 objects:v59 count:16];
                        }
                        while (v23);
                      }

                      uint64_t v16 = v41;
                      id v13 = v42;
                    }

                    uint64_t v15 = v43;
                  }
                  ++v17;
                }
                while (v17 != v15);
                uint64_t v15 = [v13 countByEnumeratingWithState:&v51 objects:v60 count:16];
              }
              while (v15);
            }

            uint64_t v8 = v36;
            id v5 = v37;
            uint64_t v7 = v38;
            uint64_t v12 = v39;
          }

          uint64_t v9 = v40;
        }
        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v55 objects:v61 count:16];
    }
    while (v7);
  }

  long long v28 = [(WFContentItemRegistry *)self allOwnedTypes];
  v29 = objc_msgSend(v28, "if_compactMap:", &__block_literal_global_4161);

  v30 = [(WFContentItemRegistry *)self contentItemClasses];
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __107__WFContentItemRegistry_NSExtensionItem__contentItemClassesForShareSheetWithExtensionMatchingDictionaries___block_invoke_2;
  v44[3] = &unk_264286598;
  id v45 = v29;
  id v46 = v4;
  id v31 = v4;
  id v32 = v29;
  v33 = [v30 objectsPassingTest:v44];

  return v33;
}

uint64_t __107__WFContentItemRegistry_NSExtensionItem__contentItemClassesForShareSheetWithExtensionMatchingDictionaries___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = *(void **)(a1 + 32);
  id v18 = 0;
  id v19 = 0;
  WFExtractTypeIdentifiersReadableByItemClass(a2, v4, &v19, &v18);
  id v5 = v19;
  id v6 = v18;
  uint64_t v7 = [v5 arrayByAddingObjectsFromArray:v6];
  uint64_t v8 = objc_msgSend(v7, "if_compactMap:", &__block_literal_global_160);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v9);
        }
        if (objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "conformsToUTTypes:", v8, (void)v14))
        {
          uint64_t v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v10;
}

uint64_t __107__WFContentItemRegistry_NSExtensionItem__contentItemClassesForShareSheetWithExtensionMatchingDictionaries___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F1D920] typeWithIdentifier:a2];
}

id __107__WFContentItemRegistry_NSExtensionItem__contentItemClassesForShareSheetWithExtensionMatchingDictionaries___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 string];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

+ (id)inputContentItemClassesMatchingShortcutInputClasses:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    v35 = [MEMORY[0x263F08690] currentHandler];
    [v35 handleFailureInMethod:a2, a1, @"WFContentItemRegistry+ShortcutInput.m", 57, @"Invalid parameter not satisfying: %@", @"shortcutInputClasses" object file lineNumber description];
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v6 = +[WFURLContentItem URLCoercions];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v40 objects:v45 count:16];
  unint64_t v8 = 0x263EFF000uLL;
  if (!v7)
  {

LABEL_25:
    uint64_t v21 = *(void **)(v8 + 2568);
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    LODWORD(v22) = [v5 intersectsSet:v23];

    if (v22)
    {
      [v5 setByAddingObject:objc_opt_class()];
      id v6 = v5;
      id v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:
    }
    goto LABEL_28;
  }
  uint64_t v9 = v7;
  char v10 = 0;
  uint64_t v11 = *(void *)v41;
  while (2)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v41 != v11) {
        objc_enumerationMutation(v6);
      }
      if (v10)
      {
        unint64_t v8 = 0x263EFF000;
        goto LABEL_27;
      }
      id v13 = *(void **)(*((void *)&v40 + 1) + 8 * i);
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v14 = objc_msgSend(v13, "urlItem_sharingItemClassesByBundleIdentifier");
      long long v15 = [v14 allValues];

      uint64_t v16 = [v15 countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v37;
        while (2)
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v37 != v18) {
              objc_enumerationMutation(v15);
            }
            if ([v5 containsObject:*(void *)(*((void *)&v36 + 1) + 8 * j)])
            {
              uint64_t v20 = [v5 setByAddingObject:objc_opt_class()];

              char v10 = 1;
              id v5 = (id)v20;
              goto LABEL_19;
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v36 objects:v44 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }
      char v10 = 0;
LABEL_19:
    }
    uint64_t v9 = [v6 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v9) {
      continue;
    }
    break;
  }

  unint64_t v8 = 0x263EFF000;
  if ((v10 & 1) == 0) {
    goto LABEL_25;
  }
LABEL_28:
  if ([v5 containsObject:objc_opt_class()])
  {
    uint64_t v24 = [v5 setByAddingObject:objc_opt_class()];

    id v5 = (id)v24;
  }
  long long v25 = *(void **)(v8 + 2568);
  uint64_t v26 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  long long v28 = objc_msgSend(v25, "setWithObjects:", v26, v27, objc_opt_class(), 0);
  LODWORD(v26) = [v5 intersectsSet:v28];

  if (v26)
  {
    uint64_t v29 = [v5 setByAddingObject:objc_opt_class()];

    id v5 = (id)v29;
  }
  v30 = *(void **)(v8 + 2568);
  uint64_t v31 = objc_opt_class();
  id v32 = objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
  LODWORD(v31) = [v5 intersectsSet:v32];

  if (v31)
  {
    uint64_t v33 = [v5 setByAddingObject:objc_opt_class()];

    id v5 = (id)v33;
  }
  return v5;
}

+ (id)shortcutInputClassesMatchingInputContentItemsOfClasses:(id)a3 hostBundleIdentifier:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    long long v25 = [MEMORY[0x263F08690] currentHandler];
    [v25 handleFailureInMethod:a2, a1, @"WFContentItemRegistry+ShortcutInput.m", 16, @"Invalid parameter not satisfying: %@", @"itemClasses" object file lineNumber description];
  }
  if ([v7 containsObject:objc_opt_class()])
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v9 = +[WFURLContentItem URLCoercions];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "urlItem_sharingItemClassesByBundleIdentifier");
          uint64_t v15 = [v14 objectForKey:v8];

          if (v15)
          {
            uint64_t v16 = [v7 setByAddingObject:v15];

            id v7 = (id)v16;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v11);
    }

    uint64_t v17 = [v7 setByAddingObject:objc_opt_class()];

    id v7 = (id)v17;
  }
  if ([v7 containsObject:objc_opt_class()])
  {
    uint64_t v18 = [v7 setByAddingObject:objc_opt_class()];

    id v7 = (id)v18;
  }
  if ([v7 containsObject:objc_opt_class()])
  {
    v31[0] = objc_opt_class();
    v31[1] = objc_opt_class();
    v31[2] = objc_opt_class();
    id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:3];
    uint64_t v20 = [v7 setByAddingObjectsFromArray:v19];

    id v7 = (id)v20;
  }
  if ([v7 containsObject:objc_opt_class()])
  {
    uint64_t v21 = [v7 setByAddingObject:objc_opt_class()];

    id v7 = (id)v21;
  }
  if ([v7 containsObject:objc_opt_class()])
  {
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];
    uint64_t v23 = [v7 setByAddingObjectsFromArray:v22];

    id v7 = (id)v23;
  }

  return v7;
}

+ (id)allContentItemClassesInContentKit
{
  v4[42] = *MEMORY[0x263EF8340];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  void v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  v4[8] = objc_opt_class();
  v4[9] = objc_opt_class();
  v4[10] = objc_opt_class();
  v4[11] = objc_opt_class();
  v4[12] = objc_opt_class();
  v4[13] = objc_opt_class();
  v4[14] = objc_opt_class();
  v4[15] = objc_opt_class();
  v4[16] = objc_opt_class();
  v4[17] = objc_opt_class();
  v4[18] = objc_opt_class();
  v4[19] = objc_opt_class();
  v4[20] = objc_opt_class();
  v4[21] = objc_opt_class();
  v4[22] = objc_opt_class();
  v4[23] = objc_opt_class();
  v4[24] = objc_opt_class();
  v4[25] = objc_opt_class();
  v4[26] = objc_opt_class();
  v4[27] = objc_opt_class();
  v4[28] = objc_opt_class();
  v4[29] = objc_opt_class();
  v4[30] = objc_opt_class();
  v4[31] = objc_opt_class();
  v4[32] = objc_opt_class();
  v4[33] = objc_opt_class();
  v4[34] = objc_opt_class();
  v4[35] = objc_opt_class();
  v4[36] = objc_opt_class();
  v4[37] = objc_opt_class();
  v4[38] = objc_opt_class();
  v4[39] = objc_opt_class();
  v4[40] = objc_opt_class();
  v4[41] = objc_opt_class();
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:42];
  return v2;
}

@end