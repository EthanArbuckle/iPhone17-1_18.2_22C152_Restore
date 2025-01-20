@interface IKDSEBoundItemsImpl
+ (BOOL)_canProxiedItemElementsBeUpdatedWithLoadedElements;
- (BOOL)canProxyUnloadedChildElement:(id)a3;
- (IKAppDataSet)dataSet;
- (IKChangeSet)itemsChangeSet;
- (IKDSEBoundItemsImpl)initWithDataSourceElement:(id)a3;
- (IKDataSourceElement)dataSourceElement;
- (NSArray)masterPrototypes;
- (NSArray)prototypes;
- (NSArray)proxiedItemElements;
- (NSDictionary)childrenByItemID;
- (NSDictionary)indexTitles;
- (NSDictionary)usedPrototypeMappingsByIdentifier;
- (NSMutableDictionary)proxiedItemElementsByItemID;
- (NSMutableIndexSet)visibleIndexSet;
- (NSString)debugDescription;
- (_IKDSEPrototypeBundle)prototypeBundle;
- (id)_elementForItemAtIndex:(int64_t)a3;
- (id)_prototypeMappingForItemAtIndex:(int64_t)a3;
- (id)elementForItemAtIndex:(int64_t)a3;
- (id)masterPrototypeForItemAtIndex:(unint64_t)a3;
- (id)prototypeForItemAtIndex:(int64_t)a3;
- (id)proxyElementForLoadedChildElement:(id)a3;
- (int64_t)indexOfItemForElement:(id)a3;
- (int64_t)numberOfItems;
- (void)_appendVisibleIndexSetWithIndex:(int64_t)a3;
- (void)_initializePrototypeBundleIfNeeded;
- (void)applyUpdatesWithImplementation:(id)a3 usingUpdater:(id)a4;
- (void)configureUpdatesWithImplementation:(id)a3;
- (void)initializeWithElementFactory:(id)a3;
- (void)resetImplicitUpdates;
- (void)resetUpdates;
- (void)setChildrenByItemID:(id)a3;
- (void)setDataSet:(id)a3;
- (void)setItemsChangeSet:(id)a3;
- (void)setPrototypeBundle:(id)a3;
- (void)setProxiedItemElementsByItemID:(id)a3;
- (void)setUsedPrototypeMappingsByIdentifier:(id)a3;
- (void)setVisibleIndexSet:(id)a3;
- (void)unloadIndex:(int64_t)a3;
- (void)updateStylesUsingUpdater:(id)a3;
@end

@implementation IKDSEBoundItemsImpl

- (IKDSEBoundItemsImpl)initWithDataSourceElement:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IKDSEBoundItemsImpl;
  v5 = [(IKDSEBoundItemsImpl *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_dataSourceElement, v4);
  }

  return v6;
}

- (NSString)debugDescription
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(IKDSEBoundItemsImpl *)self visibleIndexSet];
  v7 = [v3 stringWithFormat:@"<%@: %p, visibleIndexSet = %@>", v5, self, v6];

  return (NSString *)v7;
}

- (NSArray)prototypes
{
  [(IKDSEBoundItemsImpl *)self _initializePrototypeBundleIfNeeded];
  v3 = [(IKDSEBoundItemsImpl *)self prototypeBundle];
  id v4 = [v3 allPrototypes];

  return (NSArray *)v4;
}

- (int64_t)numberOfItems
{
  v2 = [(IKDSEBoundItemsImpl *)self dataSet];
  v3 = [v2 items];
  int64_t v4 = [v3 count];

  return v4;
}

- (id)prototypeForItemAtIndex:(int64_t)a3
{
  [(IKDSEBoundItemsImpl *)self _initializePrototypeBundleIfNeeded];
  v5 = [(IKDSEBoundItemsImpl *)self prototypeBundle];
  v6 = [v5 prototypeForItemAtIndex:a3];

  return v6;
}

- (id)elementForItemAtIndex:(int64_t)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__20;
  v13 = __Block_byref_object_dispose__20;
  id v14 = 0;
  v5 = [(IKDSEBoundItemsImpl *)self dataSourceElement];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__IKDSEBoundItemsImpl_elementForItemAtIndex___block_invoke;
  v8[3] = &unk_1E6DE5E88;
  v8[4] = self;
  v8[5] = &v9;
  v8[6] = a3;
  [v5 performImplicitUpdates:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __45__IKDSEBoundItemsImpl_elementForItemAtIndex___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _elementForItemAtIndex:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (int64_t)indexOfItemForElement:(id)a3
{
  uint64_t v4 = [a3 attributes];
  v5 = [v4 objectForKeyedSubscript:@"itemID"];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 length];

    if (!v7)
    {
      int64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_7;
    }
    uint64_t v4 = [(IKDSEBoundItemsImpl *)self dataSet];
    objc_super v8 = [v4 itemIDs];
    int64_t v9 = [v8 indexOfObject:v6];
  }
  else
  {
    int64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

LABEL_7:
  return v9;
}

- (NSDictionary)indexTitles
{
  uint64_t v2 = [(IKDSEBoundItemsImpl *)self dataSet];
  uint64_t v3 = [v2 indexTitles];

  return (NSDictionary *)v3;
}

- (void)unloadIndex:(int64_t)a3
{
  id v4 = [(IKDSEBoundItemsImpl *)self visibleIndexSet];
  [v4 removeIndex:a3];
}

- (void)initializeWithElementFactory:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v4 = [(IKDSEBoundItemsImpl *)self dataSourceElement];
  uint64_t v33 = [v4 updateType];
  v5 = [(IKDSEBoundItemsImpl *)self dataSourceElement];
  id v6 = [v5 bindingController];
  uint64_t v7 = [v6 domElement];

  v36 = v7;
  objc_super v8 = objc_msgSend(v7, "domib_appDataSet");
  [(IKDSEBoundItemsImpl *)self setDataSet:v8];

  v37 = self;
  int64_t v9 = [(IKDSEBoundItemsImpl *)self dataSet];
  v10 = [v9 usedPrototypesByIdentifier];

  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v35 = v10;
  v12 = [v10 allValues];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v44 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        v18 = [v17 usageIndexes];
        uint64_t v19 = [v18 count];

        if (v19)
        {
          v20 = +[IKDSEPrototypeMapping prototypeMappingFromAppPrototype:v17 dataSourceElement:v4 elementFactory:v38];
          v21 = [v17 identifier];
          [v11 setObject:v20 forKeyedSubscript:v21];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v14);
  }

  [(IKDSEBoundItemsImpl *)v37 setUsedPrototypeMappingsByIdentifier:v11];
  if ((v33 & 0xFFFFFFFFFFFFFFFBLL) == 0)
  {
    v34 = v4;
    v22 = [v4 unfilteredChildren];
    v23 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v24 = v22;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v40 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = *(void **)(*((void *)&v39 + 1) + 8 * j);
          v30 = [v29 attributes];
          v31 = [v30 objectForKeyedSubscript:@"itemID"];

          if ([v31 length]) {
            [v23 setObject:v29 forKeyedSubscript:v31];
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v26);
    }

    v32 = (void *)[v23 copy];
    [(IKDSEBoundItemsImpl *)v37 setChildrenByItemID:v32];

    id v4 = v34;
  }
}

- (void)configureUpdatesWithImplementation:(id)a3
{
  id v4 = [(IKDSEBoundItemsImpl *)self dataSourceElement];
  id v21 = [v4 bindingController];

  v5 = [v21 domElement];
  id v6 = objc_msgSend(v5, "domib_itemsChangeSet");

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    objc_super v8 = [(IKDSEBoundItemsImpl *)self dataSourceElement];
    uint64_t v9 = [v8 updateType];

    if (v9 == 4)
    {
      v10 = [(IKDSEBoundItemsImpl *)self dataSet];
      uint64_t v11 = [v10 items];
      uint64_t v12 = [v11 count];

      if (v12)
      {
        unint64_t v13 = 0;
        do
        {
          uint64_t v14 = [NSNumber numberWithInteger:v13];
          uint64_t v15 = [NSNumber numberWithInteger:v13];
          [v7 setObject:v14 forKey:v15];

          ++v13;
          v16 = [(IKDSEBoundItemsImpl *)self dataSet];
          v17 = [v16 items];
          unint64_t v18 = [v17 count];
        }
        while (v13 < v18);
      }
      uint64_t v19 = [[IKChangeSet alloc] initWithAddedIndexes:0 removedIndexes:0 movedIndexesByNewIndex:0 updatedIndexesByNewIndex:v7];
      uint64_t v20 = [v6 changeSetByConcatenatingChangeSet:v19];

      id v6 = (void *)v20;
    }
  }
  [(IKDSEBoundItemsImpl *)self setItemsChangeSet:v6];
}

- (void)applyUpdatesWithImplementation:(id)a3 usingUpdater:(id)a4
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  id v8 = v6;
  uint64_t v9 = [v8 dataSourceElement];
  uint64_t v10 = [v9 updateType];

  [(IKDSEBoundItemsImpl *)self setPrototypeBundle:0];
  v73 = objc_opt_new();
  uint64_t v11 = [v8 itemsChangeSet];
  uint64_t v12 = [(IKDSEBoundItemsImpl *)self visibleIndexSet];
  unint64_t v13 = v12;
  v74 = v11;
  v76 = self;
  if (v11)
  {

    if (v13)
    {
      uint64_t v14 = [MEMORY[0x1E4F28E60] indexSet];
      uint64_t v15 = [(IKDSEBoundItemsImpl *)self visibleIndexSet];
      uint64_t v16 = [v15 firstIndex];

      while (v16 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v17 = [v11 newIndexForOldIndex:v16];
        if (v17 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v18 = v17;
          [v14 addIndex:v17];
          uint64_t v19 = [NSNumber numberWithInteger:v16];
          uint64_t v20 = [NSNumber numberWithInteger:v18];
          [v73 setObject:v19 forKeyedSubscript:v20];

          uint64_t v11 = v74;
        }
        id v21 = [(IKDSEBoundItemsImpl *)self visibleIndexSet];
        uint64_t v16 = [v21 indexGreaterThanIndex:v16];
      }
      [(IKDSEBoundItemsImpl *)self setVisibleIndexSet:v14];
    }
    v22 = [v11 removedIndexes];
    v23 = (void *)[v22 mutableCopy];
    id v24 = v23;
    if (v23)
    {
      id v25 = v23;
    }
    else
    {
      id v25 = [MEMORY[0x1E4F28E60] indexSet];
    }
    uint64_t v26 = v25;

    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    uint64_t v27 = [v11 updatedIndexesByNewIndex];
    v28 = [v27 allValues];

    uint64_t v29 = [v28 countByEnumeratingWithState:&v87 objects:v95 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v88;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v88 != v31) {
            objc_enumerationMutation(v28);
          }
          objc_msgSend(v26, "addIndex:", objc_msgSend(*(id *)(*((void *)&v87 + 1) + 8 * i), "integerValue"));
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v87 objects:v95 count:16];
      }
      while (v30);
    }

    uint64_t v33 = [(IKDSEBoundItemsImpl *)self proxiedItemElementsByItemID];
    v34 = [(IKDSEBoundItemsImpl *)self dataSet];
    v35 = [v34 itemIDs];
    v36 = [v35 objectsAtIndexes:v26];
    [v33 removeObjectsForKeys:v36];

    self = v76;
  }
  else
  {
    [v12 removeAllIndexes];

    uint64_t v26 = [(IKDSEBoundItemsImpl *)self proxiedItemElementsByItemID];
    [v26 removeAllObjects];
  }

  if ((v10 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    v37 = [v8 dataSet];
    [(IKDSEBoundItemsImpl *)self setDataSet:v37];
  }
  id v38 = v7[2](v7);
  long long v39 = v38;
  if ((v10 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    v72 = v8;
    long long v40 = (void *)MEMORY[0x1E4F1CA60];
    long long v41 = [v38 unfilteredChildren];
    v77 = objc_msgSend(v40, "dictionaryWithCapacity:", objc_msgSend(v41, "count"));

    v75 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    v71 = v39;
    long long v42 = [v39 unfilteredChildren];
    uint64_t v43 = [v42 countByEnumeratingWithState:&v83 objects:v94 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v84;
      do
      {
        for (uint64_t j = 0; j != v44; ++j)
        {
          if (*(void *)v84 != v45) {
            objc_enumerationMutation(v42);
          }
          v47 = *(void **)(*((void *)&v83 + 1) + 8 * j);
          v48 = [v47 attributes];
          uint64_t v49 = [v48 objectForKeyedSubscript:@"itemID"];

          if ([v49 length])
          {
            [v77 setObject:v47 forKeyedSubscript:v49];
            if ([v47 updateType])
            {
              v50 = [(IKDSEBoundItemsImpl *)v76 dataSet];
              v51 = [v50 itemIDs];
              uint64_t v52 = [v51 indexOfObject:v49];

              if (v52 == 0x7FFFFFFFFFFFFFFFLL)
              {
                v53 = ITMLKitGetLogObject(0);
                if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v93 = v49;
                  _os_log_error_impl(&dword_1E2ACE000, v53, OS_LOG_TYPE_ERROR, "child element not found in data set: %@", buf, 0xCu);
                }
              }
              v54 = [NSNumber numberWithInteger:v52];
              v55 = [NSNumber numberWithInteger:v52];
              [v75 setObject:v54 forKey:v55];
            }
          }
        }
        uint64_t v44 = [v42 countByEnumeratingWithState:&v83 objects:v94 count:16];
      }
      while (v44);
    }

    [(IKDSEBoundItemsImpl *)v76 setChildrenByItemID:v77];
    v56 = [[IKChangeSet alloc] initWithAddedIndexes:0 removedIndexes:0 movedIndexesByNewIndex:0 updatedIndexesByNewIndex:v75];
    if (v74)
    {
      v57 = [v74 changeSetByConcatenatingChangeSet:v56];
      [(IKDSEBoundItemsImpl *)v76 setItemsChangeSet:v57];
    }
    else
    {
      [(IKDSEBoundItemsImpl *)v76 setItemsChangeSet:v56];
    }
    v59 = [v72 usedPrototypeMappingsByIdentifier];
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    v60 = [v59 allValues];
    uint64_t v61 = [v60 countByEnumeratingWithState:&v79 objects:v91 count:16];
    if (v61)
    {
      uint64_t v62 = v61;
      uint64_t v63 = *(void *)v80;
      do
      {
        for (uint64_t k = 0; k != v62; ++k)
        {
          if (*(void *)v80 != v63) {
            objc_enumerationMutation(v60);
          }
          v65 = *(void **)(*((void *)&v79 + 1) + 8 * k);
          v66 = [(IKDSEBoundItemsImpl *)v76 dataSourceElement];
          v67 = [v65 viewElement];
          [v66 adoptElement:v67];
        }
        uint64_t v62 = [v60 countByEnumeratingWithState:&v79 objects:v91 count:16];
      }
      while (v62);
    }

    [(IKDSEBoundItemsImpl *)v76 setUsedPrototypeMappingsByIdentifier:v59];
    v68 = [(IKDSEBoundItemsImpl *)v76 proxiedItemElementsByItemID];
    v69 = [(IKDSEBoundItemsImpl *)v76 childrenByItemID];
    v70 = [v69 allKeys];
    [v68 removeObjectsForKeys:v70];

    id v8 = v72;
    v58 = v74;
    long long v39 = v71;
  }
  else
  {
    v58 = v74;
    if (v10 == 4)
    {
      v78 = [(IKDSEBoundItemsImpl *)self visibleIndexSet];
      objc_msgSend(v8, "setVisibleIndexSet:");
    }
  }
}

- (void)updateStylesUsingUpdater:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(void))a3;
  [(IKDSEBoundItemsImpl *)self setPrototypeBundle:0];
  v4[2](v4);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v5 = [(IKDSEBoundItemsImpl *)self prototypes];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v30 + 1) + 8 * i) appDocumentDidMarkStylesDirty];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v7);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v10 = [(IKDSEBoundItemsImpl *)self proxiedItemElements];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * j) appDocumentDidMarkStylesDirty];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v12);
  }

  uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v16 = [(IKDSEBoundItemsImpl *)self visibleIndexSet];
  uint64_t v17 = v16;
  if (v16)
  {
    uint64_t v18 = [v16 firstIndex];
    if (v18 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (uint64_t k = v18; k != 0x7FFFFFFFFFFFFFFFLL; uint64_t k = [v17 indexGreaterThanIndex:k])
      {
        uint64_t v20 = [NSNumber numberWithInteger:k];
        id v21 = [NSNumber numberWithInteger:k];
        [v15 setObject:v20 forKey:v21];
      }
    }
  }
  v22 = [[IKChangeSet alloc] initWithAddedIndexes:0 removedIndexes:0 movedIndexesByNewIndex:0 updatedIndexesByNewIndex:v15];
  v23 = [(IKDSEBoundItemsImpl *)self itemsChangeSet];
  if (v23)
  {
    id v24 = [(IKDSEBoundItemsImpl *)self itemsChangeSet];
    id v25 = [v24 changeSetByConcatenatingChangeSet:v22];
    [(IKDSEBoundItemsImpl *)self setItemsChangeSet:v25];
  }
  else
  {
    [(IKDSEBoundItemsImpl *)self setItemsChangeSet:v22];
  }
}

- (void)resetUpdates
{
}

- (NSArray)masterPrototypes
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(IKDSEBoundItemsImpl *)self usedPrototypeMappingsByIdentifier];
  uint64_t v3 = [v2 allValues];

  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "viewElement", (void)v13);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  if ([v4 count]) {
    uint64_t v11 = (void *)[v4 copy];
  }
  else {
    uint64_t v11 = 0;
  }

  return (NSArray *)v11;
}

- (NSArray)proxiedItemElements
{
  uint64_t v2 = [(IKDSEBoundItemsImpl *)self proxiedItemElementsByItemID];
  uint64_t v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (id)masterPrototypeForItemAtIndex:(unint64_t)a3
{
  uint64_t v3 = [(IKDSEBoundItemsImpl *)self _prototypeMappingForItemAtIndex:a3];
  id v4 = [v3 viewElement];

  return v4;
}

- (void)resetImplicitUpdates
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = [(IKDSEBoundItemsImpl *)self proxiedItemElements];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) resetImplicitUpdates];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)proxyElementForLoadedChildElement:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class() _canProxiedItemElementsBeUpdatedWithLoadedElements])
  {
    uint64_t v5 = [v4 attributes];
    uint64_t v6 = [v5 objectForKeyedSubscript:@"itemID"];

    if (v6)
    {
      long long v7 = [(IKDSEBoundItemsImpl *)self proxiedItemElementsByItemID];
      long long v8 = [v7 objectForKeyedSubscript:v6];
    }
    else
    {
      long long v8 = 0;
    }
  }
  else
  {
    long long v8 = 0;
  }

  return v8;
}

- (BOOL)canProxyUnloadedChildElement:(id)a3
{
  id v4 = [a3 attributes];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"itemID"];

  uint64_t v6 = [(IKDSEBoundItemsImpl *)self dataSet];
  long long v7 = [v6 itemIDs];
  char v8 = [v7 containsObject:v5];

  return v8;
}

+ (BOOL)_canProxiedItemElementsBeUpdatedWithLoadedElements
{
  if (_canProxiedItemElementsBeUpdatedWithLoadedElements_onceToken != -1) {
    dispatch_once(&_canProxiedItemElementsBeUpdatedWithLoadedElements_onceToken, &__block_literal_global_46);
  }
  return _canProxiedItemElementsBeUpdatedWithLoadedElements_canProxiedItemElementsBeUpdatedWithActualElements;
}

void __73__IKDSEBoundItemsImpl__canProxiedItemElementsBeUpdatedWithLoadedElements__block_invoke()
{
  id v1 = [MEMORY[0x1E4F28B50] mainBundle];
  v0 = [v1 bundleIdentifier];
  _canProxiedItemElementsBeUpdatedWithLoadedElements_canProxiedItemElementsBeUpdatedWithActualElements = [v0 isEqualToString:@"com.apple.TVHomeSharing"] ^ 1;
}

- (id)_prototypeMappingForItemAtIndex:(int64_t)a3
{
  uint64_t v5 = [(IKDSEBoundItemsImpl *)self dataSet];
  uint64_t v6 = [v5 items];
  long long v7 = [v6 objectAtIndexedSubscript:a3];

  char v8 = [(IKDSEBoundItemsImpl *)self usedPrototypeMappingsByIdentifier];
  long long v9 = [v7 prototypeIdentifier];
  long long v10 = [v8 objectForKeyedSubscript:v9];

  return v10;
}

- (id)_elementForItemAtIndex:(int64_t)a3
{
  uint64_t v5 = [(IKDSEBoundItemsImpl *)self dataSet];
  uint64_t v6 = [v5 items];
  long long v7 = [v6 objectAtIndexedSubscript:a3];

  char v8 = [(IKDSEBoundItemsImpl *)self childrenByItemID];
  long long v9 = [v7 identifier];
  long long v10 = [v8 objectForKeyedSubscript:v9];

  if (!v10)
  {
    uint64_t v11 = [(IKDSEBoundItemsImpl *)self proxiedItemElementsByItemID];
    uint64_t v12 = [v7 identifier];
    long long v10 = [v11 objectForKeyedSubscript:v12];

    if (!v10)
    {
      long long v13 = [(IKDSEBoundItemsImpl *)self _prototypeMappingForItemAtIndex:a3];
      long long v14 = [v13 viewElement];

      id v15 = objc_alloc((Class)objc_opt_class());
      long long v16 = [(IKDSEBoundItemsImpl *)self dataSourceElement];
      long long v10 = (void *)[v15 initWithPrototypeElement:v14 parent:v16 appDataItem:v7];

      uint64_t v17 = [(IKDSEBoundItemsImpl *)self proxiedItemElementsByItemID];

      if (!v17)
      {
        uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
        [(IKDSEBoundItemsImpl *)self setProxiedItemElementsByItemID:v18];
      }
      uint64_t v19 = [(IKDSEBoundItemsImpl *)self proxiedItemElementsByItemID];
      uint64_t v20 = [v7 identifier];
      [v19 setObject:v10 forKeyedSubscript:v20];
    }
  }

  return v10;
}

- (void)_appendVisibleIndexSetWithIndex:(int64_t)a3
{
  uint64_t v5 = [(IKDSEBoundItemsImpl *)self dataSet];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    long long v7 = [(IKDSEBoundItemsImpl *)self visibleIndexSet];
    char v8 = [v7 containsIndex:a3];

    if ((v8 & 1) == 0)
    {
      long long v9 = [(IKDSEBoundItemsImpl *)self visibleIndexSet];

      if (!v9)
      {
        id v10 = objc_alloc_init(MEMORY[0x1E4F28E60]);
        [(IKDSEBoundItemsImpl *)self setVisibleIndexSet:v10];
      }
      uint64_t v11 = [(IKDSEBoundItemsImpl *)self visibleIndexSet];
      [v11 addIndex:a3];

      if (!self->_visibleIndexRangeIsDirty)
      {
        self->_visibleIndexRangeIsDirty = 1;
        v25[0] = 0;
        v25[1] = v25;
        v25[2] = 0x3010000000;
        v25[4] = 0;
        v25[5] = 0;
        v25[3] = &unk_1E2B9EDE1;
        objc_initWeak(&location, self);
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __55__IKDSEBoundItemsImpl__appendVisibleIndexSetWithIndex___block_invoke;
        v22[3] = &unk_1E6DE5EB0;
        objc_copyWeak(&v23, &location);
        v22[4] = self;
        v22[5] = v25;
        uint64_t v12 = (void *)MEMORY[0x1E4E65800](v22);
        uint64_t v16 = MEMORY[0x1E4F143A8];
        uint64_t v17 = 3221225472;
        uint64_t v18 = __55__IKDSEBoundItemsImpl__appendVisibleIndexSetWithIndex___block_invoke_2;
        uint64_t v19 = &unk_1E6DE5ED8;
        objc_copyWeak(&v21, &location);
        uint64_t v20 = v25;
        long long v13 = (void *)MEMORY[0x1E4E65800](&v16);
        long long v14 = [(IKDSEBoundItemsImpl *)self dataSourceElement];
        id v15 = [v14 bindingController];
        [v15 scheduleUpdateUsingPreUpdate:v12 update:v13];

        objc_destroyWeak(&v21);
        objc_destroyWeak(&v23);
        objc_destroyWeak(&location);
        _Block_object_dispose(v25, 8);
      }
    }
  }
}

uint64_t __55__IKDSEBoundItemsImpl__appendVisibleIndexSetWithIndex___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained visibleIndexSet];
    uint64_t v5 = (void *)[v4 copy];

    uint64_t v6 = [*(id *)(a1 + 32) dataSet];
    long long v7 = [v6 itemIDs];
    uint64_t v8 = objc_msgSend(v5, "cyclicRangeForItemCount:includeAllIndexes:", objc_msgSend(v7, "count"), 1);
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    *(void *)(v9 + 32) = v8;
    *(void *)(v9 + 40) = v10;

    v3[8] = 0;
  }

  return 1;
}

void __55__IKDSEBoundItemsImpl__appendVisibleIndexSetWithIndex___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    uint64_t v3 = [WeakRetained dataSourceElement];
    id v4 = [v3 bindingController];
    uint64_t v5 = [v4 domElement];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(void *)(v6 + 32) != objc_msgSend(v5, "domib_visibleIndexRange") || *(void *)(v6 + 40) != v7)
    {
      objc_msgSend(v5, "domib_setVisibleIndexRange:", *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
      [v5 childrenUpdatedWithUpdatedChildNodes:0 notify:0];
    }

    id WeakRetained = v9;
  }
}

- (void)_initializePrototypeBundleIfNeeded
{
  uint64_t v3 = [(IKDSEBoundItemsImpl *)self prototypeBundle];

  if (!v3)
  {
    id v4 = [(IKDSEBoundItemsImpl *)self dataSourceElement];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __57__IKDSEBoundItemsImpl__initializePrototypeBundleIfNeeded__block_invoke;
    v5[3] = &unk_1E6DE3CC0;
    v5[4] = self;
    [v4 performImplicitUpdates:v5];
  }
}

void __57__IKDSEBoundItemsImpl__initializePrototypeBundleIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v3 = [*(id *)(a1 + 32) usedPrototypeMappingsByIdentifier];
  id v4 = [v3 allValues];

  obuint64_t j = v4;
  uint64_t v21 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v23;
    unint64_t v5 = 0x1E4F28000uLL;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        unint64_t v7 = v5;
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v9 = [v8 viewElement];
        uint64_t v10 = [v8 usageIndexes];
        uint64_t v11 = [v9 style];
        uint64_t v12 = [v11 prototype];
        int v13 = [v12 isEqualToString:@"abstract"];

        if (v13)
        {
          uint64_t v14 = [v10 firstIndex];
          unint64_t v5 = v7;
          if (v14 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v15 = v14;
            do
            {
              uint64_t v16 = [*(id *)(a1 + 32) _elementForItemAtIndex:v15];
              uint64_t v17 = [*(id *)(v5 + 3424) indexSetWithIndex:v15];
              [v2 addPrototype:v16 forIndexes:v17];

              unint64_t v5 = v7;
              uint64_t v18 = [v8 usageIndexes];
              uint64_t v15 = [v18 indexGreaterThanIndex:v15];
            }
            while (v15 != 0x7FFFFFFFFFFFFFFFLL);
          }
        }
        else
        {
          [v2 addPrototype:v9 forIndexes:v10];
          unint64_t v5 = v7;
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v21);
  }

  [*(id *)(a1 + 32) setPrototypeBundle:v2];
}

- (IKDataSourceElement)dataSourceElement
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSourceElement);
  return (IKDataSourceElement *)WeakRetained;
}

- (IKChangeSet)itemsChangeSet
{
  return self->_itemsChangeSet;
}

- (void)setItemsChangeSet:(id)a3
{
}

- (IKAppDataSet)dataSet
{
  return self->_dataSet;
}

- (void)setDataSet:(id)a3
{
}

- (NSDictionary)usedPrototypeMappingsByIdentifier
{
  return self->_usedPrototypeMappingsByIdentifier;
}

- (void)setUsedPrototypeMappingsByIdentifier:(id)a3
{
}

- (_IKDSEPrototypeBundle)prototypeBundle
{
  return self->_prototypeBundle;
}

- (void)setPrototypeBundle:(id)a3
{
}

- (NSDictionary)childrenByItemID
{
  return self->_childrenByItemID;
}

- (void)setChildrenByItemID:(id)a3
{
}

- (NSMutableIndexSet)visibleIndexSet
{
  return self->_visibleIndexSet;
}

- (void)setVisibleIndexSet:(id)a3
{
}

- (NSMutableDictionary)proxiedItemElementsByItemID
{
  return self->_proxiedItemElementsByItemID;
}

- (void)setProxiedItemElementsByItemID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxiedItemElementsByItemID, 0);
  objc_storeStrong((id *)&self->_visibleIndexSet, 0);
  objc_storeStrong((id *)&self->_childrenByItemID, 0);
  objc_storeStrong((id *)&self->_prototypeBundle, 0);
  objc_storeStrong((id *)&self->_usedPrototypeMappingsByIdentifier, 0);
  objc_storeStrong((id *)&self->_dataSet, 0);
  objc_storeStrong((id *)&self->_itemsChangeSet, 0);
  objc_destroyWeak((id *)&self->_dataSourceElement);
}

@end