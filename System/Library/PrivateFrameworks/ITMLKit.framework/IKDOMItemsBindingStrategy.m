@interface IKDOMItemsBindingStrategy
- (IKChangeSet)itemsChangeSet;
- (IKDOMItemsBindingStrategy)initWithDOMBindingController:(id)a3;
- (NSDictionary)usedAppPrototypesByIdentifier;
- (NSIndexSet)autoHighlightedIndexes;
- (_NSRange)visibleItemsRange;
- (id)_appDataItemFromDataItem:(id)a3 binding:(id)a4 prototypeIdentifier:(id)a5 autoHighlighted:(BOOL *)a6;
- (void)_reevaluateVisibleIndexRange;
- (void)_updateChildDOMElements;
- (void)didResolveKeys:(id)a3;
- (void)setAutoHighlightedIndexes:(id)a3;
- (void)setItemsChangeSet:(id)a3;
- (void)setUsedAppPrototypesByIdentifier:(id)a3;
- (void)willUpdateWithItems:(id)a3 indexTitles:(id)a4 usedPrototypesByIdentifier:(id)a5 changeSet:(id)a6;
@end

@implementation IKDOMItemsBindingStrategy

- (IKDOMItemsBindingStrategy)initWithDOMBindingController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IKDOMItemsBindingStrategy;
  return [(IKDOMBindingStrategy *)&v4 initWithDOMBindingController:a3 itemsBindingKey:@"items"];
}

- (void)didResolveKeys:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)IKDOMItemsBindingStrategy;
  [(IKDOMBindingStrategy *)&v8 didResolveKeys:a3];
  objc_super v4 = [(IKDOMBindingStrategy *)self domBindingController];
  v5 = [v4 domElement];
  [(IKDOMItemsBindingStrategy *)self _updateChildDOMElements];
  v6 = [(IKDOMItemsBindingStrategy *)self itemsChangeSet];
  objc_msgSend(v5, "domib_setItemsChangeSet:", v6);

  v7 = objc_opt_new();
  [(IKDOMItemsBindingStrategy *)self setItemsChangeSet:v7];
}

- (_NSRange)visibleItemsRange
{
  v2 = [(IKDOMBindingStrategy *)self domBindingController];
  v3 = [v2 domElement];
  uint64_t v4 = objc_msgSend(v3, "domib_visibleIndexRange");
  NSUInteger v6 = v5;

  NSUInteger v7 = v4;
  NSUInteger v8 = v6;
  result.length = v8;
  result.location = v7;
  return result;
}

- (void)willUpdateWithItems:(id)a3 indexTitles:(id)a4 usedPrototypesByIdentifier:(id)a5 changeSet:(id)a6
{
  uint64_t v143 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  id v13 = v11;
  id v116 = a5;
  id v14 = a6;
  v104 = [(IKDOMBindingStrategy *)v12 domBindingController];
  v15 = [v104 domElement];
  v105 = v14;
  if (v14)
  {
    v16 = (IKChangeSet *)v14;
  }
  else
  {
    v17 = [IKChangeSet alloc];
    v18 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v10, "count"));
    v16 = [(IKChangeSet *)v17 initWithAddedIndexes:v18 removedIndexes:0 movedIndexesByNewIndex:0 updatedIndexesByNewIndex:0];
  }
  v19 = objc_msgSend(v15, "domib_appDataSet");
  v20 = [v19 items];

  v107 = v20;
  v21 = (void *)[v20 mutableCopy];
  v22 = v21;
  if (v21)
  {
    id v23 = v21;
  }
  else
  {
    id v23 = [MEMORY[0x1E4F1CA48] array];
  }
  v117 = v23;

  v114 = v12;
  v24 = [(IKDOMItemsBindingStrategy *)v12 usedAppPrototypesByIdentifier];
  v25 = (void *)[v24 mutableCopy];
  v26 = v25;
  v106 = v13;
  if (v25)
  {
    id v27 = v25;
  }
  else
  {
    id v27 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  v28 = v27;

  v111 = [MEMORY[0x1E4F28E60] indexSet];
  long long v135 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  v115 = v28;
  v29 = [v28 allValues];
  uint64_t v30 = [v29 countByEnumeratingWithState:&v135 objects:v142 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v136;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v136 != v32) {
          objc_enumerationMutation(v29);
        }
        [*(id *)(*((void *)&v135 + 1) + 8 * i) updateUsageIndexesWithChangeSet:v16];
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v135 objects:v142 count:16];
    }
    while (v31);
  }

  v34 = [(IKChangeSet *)v16 removedIndexes];
  v35 = (void *)[v34 mutableCopy];
  v36 = v35;
  if (v35)
  {
    id v37 = v35;
  }
  else
  {
    id v37 = [MEMORY[0x1E4F28E60] indexSet];
  }
  v38 = v37;

  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  v39 = [(IKChangeSet *)v16 movedIndexesByNewIndex];
  v40 = [v39 allValues];

  uint64_t v41 = [v40 countByEnumeratingWithState:&v131 objects:v141 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v132;
    do
    {
      for (uint64_t j = 0; j != v42; ++j)
      {
        if (*(void *)v132 != v43) {
          objc_enumerationMutation(v40);
        }
        objc_msgSend(v38, "addIndex:", objc_msgSend(*(id *)(*((void *)&v131 + 1) + 8 * j), "integerValue"));
      }
      uint64_t v42 = [v40 countByEnumeratingWithState:&v131 objects:v141 count:16];
    }
    while (v42);
  }

  uint64_t v45 = [v38 lastIndex];
  if (v45 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (uint64_t k = v45; k != 0x7FFFFFFFFFFFFFFFLL; uint64_t k = [v38 indexLessThanIndex:k])
      [v117 removeObjectAtIndex:k];
  }
  v47 = [(IKChangeSet *)v16 addedIndexes];
  v48 = (void *)[v47 mutableCopy];
  v49 = v48;
  v103 = v15;
  if (v48)
  {
    id v50 = v48;
  }
  else
  {
    id v50 = [MEMORY[0x1E4F28E60] indexSet];
  }
  v51 = v50;

  long long v129 = 0u;
  long long v130 = 0u;
  long long v128 = 0u;
  long long v127 = 0u;
  v52 = [(IKChangeSet *)v16 movedIndexesByNewIndex];
  v53 = [v52 allKeys];

  uint64_t v54 = [v53 countByEnumeratingWithState:&v127 objects:v140 count:16];
  if (v54)
  {
    uint64_t v55 = v54;
    uint64_t v56 = *(void *)v128;
    do
    {
      for (uint64_t m = 0; m != v55; ++m)
      {
        if (*(void *)v128 != v56) {
          objc_enumerationMutation(v53);
        }
        objc_msgSend(v51, "addIndex:", objc_msgSend(*(id *)(*((void *)&v127 + 1) + 8 * m), "integerValue"));
      }
      uint64_t v55 = [v53 countByEnumeratingWithState:&v127 objects:v140 count:16];
    }
    while (v55);
  }

  v109 = v51;
  uint64_t v58 = [v51 firstIndex];
  v108 = v16;
  v102 = v38;
  if (v58 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v59 = v58;
    do
    {
      v60 = [v10 objectAtIndexedSubscript:v59];
      v61 = [v60 prototypeIdentifier];
      v62 = [v116 objectForKeyedSubscript:v61];
      v63 = [v62 variantForDataItem:v60];

      uint64_t v64 = [(IKChangeSet *)v16 oldIndexForNewIndex:v59];
      if (v64 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v65 = [[IKAppPrototype alloc] initWithPrototype:v63 dataItem:v60];
        v66 = [(IKAppPrototype *)v65 identifier];
        v67 = [v115 objectForKeyedSubscript:v66];

        v68 = [(IKAppPrototype *)v65 identifier];
        v69 = v61;
        if (v67)
        {
          uint64_t v70 = [v115 objectForKeyedSubscript:v68];

          v65 = (IKAppPrototype *)v70;
        }
        else
        {
          [v115 setObject:v65 forKeyedSubscript:v68];
        }

        [(IKAppPrototype *)v65 addUsageForIndex:v59];
        char v126 = 0;
        v72 = [v63 domElement];
        v73 = +[IKDOMBindingController parsedBindingForDOMElement:v72];
        v74 = [(IKAppPrototype *)v65 identifier];
        v71 = [(IKDOMItemsBindingStrategy *)v114 _appDataItemFromDataItem:v60 binding:v73 prototypeIdentifier:v74 autoHighlighted:&v126];

        if (v126) {
          [v111 addIndex:v59];
        }

        v16 = v108;
        v61 = v69;
      }
      else
      {
        v71 = [v107 objectAtIndexedSubscript:v64];
      }
      [v117 insertObject:v71 atIndex:v59];
      uint64_t v59 = [v109 indexGreaterThanIndex:v59];
    }
    while (v59 != 0x7FFFFFFFFFFFFFFFLL);
  }
  long long v124 = 0u;
  long long v125 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  v75 = [(IKChangeSet *)v16 updatedIndexesByNewIndex];
  v76 = [v75 allKeys];

  obuint64_t j = v76;
  v77 = v117;
  uint64_t v118 = [v76 countByEnumeratingWithState:&v122 objects:v139 count:16];
  if (v118)
  {
    uint64_t v112 = *(void *)v123;
    id v113 = v10;
    do
    {
      for (uint64_t n = 0; n != v118; ++n)
      {
        if (*(void *)v123 != v112) {
          objc_enumerationMutation(obj);
        }
        uint64_t v79 = [*(id *)(*((void *)&v122 + 1) + 8 * n) integerValue];
        v80 = [v10 objectAtIndexedSubscript:v79];
        v119 = [v80 prototypeIdentifier];
        v81 = objc_msgSend(v116, "objectForKeyedSubscript:");
        v82 = [v81 variantForDataItem:v80];

        v83 = [v77 objectAtIndexedSubscript:v79];
        v84 = [v83 prototypeIdentifier];
        v85 = [v115 objectForKeyedSubscript:v84];
        [v85 removeUsageForIndex:v79];

        v86 = [[IKAppPrototype alloc] initWithPrototype:v82 dataItem:v80];
        v87 = [(IKAppPrototype *)v86 identifier];
        v88 = [v115 objectForKeyedSubscript:v87];

        v89 = [(IKAppPrototype *)v86 identifier];
        if (v88)
        {
          uint64_t v90 = [v115 objectForKeyedSubscript:v89];

          v86 = (IKAppPrototype *)v90;
        }
        else
        {
          [v115 setObject:v86 forKeyedSubscript:v89];
        }

        [(IKAppPrototype *)v86 addUsageForIndex:v79];
        char v126 = 0;
        v91 = [v82 domElement];
        v92 = +[IKDOMBindingController parsedBindingForDOMElement:v91];
        v93 = [(IKAppPrototype *)v86 identifier];
        v94 = [(IKDOMItemsBindingStrategy *)v114 _appDataItemFromDataItem:v80 binding:v92 prototypeIdentifier:v93 autoHighlighted:&v126];

        if (v126) {
          [v111 addIndex:v79];
        }
        v77 = v117;
        [v117 replaceObjectAtIndex:v79 withObject:v94];

        id v10 = v113;
      }
      uint64_t v118 = [obj countByEnumeratingWithState:&v122 objects:v139 count:16];
    }
    while (v118);
  }

  v95 = [MEMORY[0x1E4F1CA48] array];
  v120[0] = MEMORY[0x1E4F143A8];
  v120[1] = 3221225472;
  v120[2] = __98__IKDOMItemsBindingStrategy_willUpdateWithItems_indexTitles_usedPrototypesByIdentifier_changeSet___block_invoke;
  v120[3] = &unk_1E6DE3C18;
  id v96 = v95;
  id v121 = v96;
  [v115 enumerateKeysAndObjectsUsingBlock:v120];
  [v115 removeObjectsForKeys:v96];
  v97 = [IKAppDataSet alloc];
  v98 = (void *)[v77 copy];
  v99 = [(IKAppDataSet *)v97 initWithItems:v98 usedPrototypesByIdentifier:v115 indexTitles:v106];
  objc_msgSend(v103, "domib_setAppDataSet:", v99);

  if ([v111 count])
  {
    v100 = (void *)[v111 copy];
    v101 = v114;
    [(IKDOMItemsBindingStrategy *)v114 setAutoHighlightedIndexes:v100];
  }
  else
  {
    v101 = v114;
    [(IKDOMItemsBindingStrategy *)v114 setAutoHighlightedIndexes:0];
  }
  [(IKDOMItemsBindingStrategy *)v101 setUsedAppPrototypesByIdentifier:v115];
  [(IKDOMItemsBindingStrategy *)v101 setItemsChangeSet:v105];
  [(IKDOMItemsBindingStrategy *)v101 _reevaluateVisibleIndexRange];
}

void __98__IKDOMItemsBindingStrategy_willUpdateWithItems_indexTitles_usedPrototypesByIdentifier_changeSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  NSUInteger v5 = [a3 usageIndexes];
  uint64_t v6 = [v5 count];

  if (!v6) {
    [*(id *)(a1 + 32) addObject:v7];
  }
}

- (void)_updateChildDOMElements
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v35 = [(IKDOMBindingStrategy *)self domBindingController];
  v3 = [v35 domElement];
  uint64_t v31 = [(IKDOMBindingStrategy *)self items];
  uint64_t v4 = objc_msgSend(v3, "domib_appDataSet");
  v33 = [v4 items];
  v36 = v4;
  v34 = [v4 usedPrototypesByIdentifier];
  NSUInteger v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v6 = [v3 childElements];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v49 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        v12 = [v11 getAttribute:@"itemID"];
        if ([v12 length]) {
          [v5 setObject:v11 forKeyedSubscript:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v8);
  }

  id v13 = [MEMORY[0x1E4F28E60] indexSet];
  id v14 = (void *)MEMORY[0x1E4F28D60];
  uint64_t v15 = objc_msgSend(v3, "domib_visibleIndexRange");
  v17 = objc_msgSend(v14, "indexSetWithIndexesInCyclicRange:itemCount:", v15, v16, objc_msgSend(v31, "count"));
  [v13 addIndexes:v17];

  v18 = [(IKDOMItemsBindingStrategy *)self autoHighlightedIndexes];

  if (v18)
  {
    v19 = [(IKDOMItemsBindingStrategy *)self autoHighlightedIndexes];
    [v13 addIndexes:v19];

    [(IKDOMItemsBindingStrategy *)self setAutoHighlightedIndexes:0];
  }
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __52__IKDOMItemsBindingStrategy__updateChildDOMElements__block_invoke;
  v41[3] = &unk_1E6DE3C40;
  id v32 = v31;
  id v42 = v32;
  id v20 = v5;
  id v43 = v20;
  id v21 = v33;
  id v44 = v21;
  id v22 = v34;
  id v45 = v22;
  id v23 = v35;
  id v46 = v23;
  id v24 = v3;
  id v47 = v24;
  [v13 enumerateIndexesUsingBlock:v41];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v25 = [v20 allValues];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v37 objects:v52 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v38 != v28) {
          objc_enumerationMutation(v25);
        }
        id v30 = (id)[v24 removeChild:*(void *)(*((void *)&v37 + 1) + 8 * j)];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v37 objects:v52 count:16];
    }
    while (v27);
  }
}

void __52__IKDOMItemsBindingStrategy__updateChildDOMElements__block_invoke(uint64_t a1, uint64_t a2)
{
  id v12 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  if (([v12 isPlaceholder] & 1) == 0)
  {
    uint64_t v4 = [v12 identifier];
    NSUInteger v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:v4];
    if (v5) {
      [*(id *)(a1 + 40) removeObjectForKey:v4];
    }
    uint64_t v6 = [*(id *)(a1 + 48) objectAtIndexedSubscript:a2];
    uint64_t v7 = *(void **)(a1 + 56);
    uint64_t v8 = [v6 prototypeIdentifier];
    uint64_t v9 = [v7 objectForKeyedSubscript:v8];
    id v10 = [v9 prototype];

    id v11 = (id)[(id)objc_opt_class() instantiateDOMElementForItem:v12 withPrototype:v10 parentDOMElement:*(void *)(a1 + 72) existingDOMElement:v5];
  }
}

- (id)_appDataItemFromDataItem:(id)a3 binding:(id)a4 prototypeIdentifier:(id)a5 autoHighlighted:(BOOL *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (a6)
  {
    id v12 = [v10 keyValues];
    id v13 = [@"@" stringByAppendingString:@"autoHighlight"];
    id v14 = [v12 objectForKeyedSubscript:v13];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [v9 valueForPropertyPath:v14 boxed:0];
      if ([v15 isString]) {
        *a6 = 1;
      }
    }
  }
  uint64_t v16 = [IKAppDataItem alloc];
  v17 = [v9 type];
  v18 = v17;
  if (!v17)
  {
    v18 = [NSString string];
  }
  v19 = [v9 identifier];
  id v20 = [v9 dataDictionary];
  id v21 = [(IKAppDataItem *)v16 initWithType:v18 identifier:v19 prototypeIdentifier:v11 dataDictionary:v20];

  if (!v17) {
  return v21;
  }
}

- (void)_reevaluateVisibleIndexRange
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(IKDOMItemsBindingStrategy *)self itemsChangeSet];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    NSUInteger v5 = [(IKDOMItemsBindingStrategy *)self itemsChangeSet];
    uint64_t v6 = [v5 addedIndexes];
    if (!v6)
    {
      uint64_t v6 = [(IKDOMItemsBindingStrategy *)self itemsChangeSet];
      uint64_t v7 = [v6 removedIndexes];
      if (!v7)
      {
        id v21 = [(IKDOMItemsBindingStrategy *)self itemsChangeSet];
        id v22 = [v21 movedIndexesByNewIndex];

        if (!v22) {
          return;
        }
        goto LABEL_6;
      }
    }
  }
LABEL_6:
  id v24 = [(IKDOMBindingStrategy *)self domBindingController];
  uint64_t v8 = [v24 domElement];
  id v23 = objc_msgSend(v8, "domib_appDataSet");
  id v9 = [v23 itemIDs];
  id v10 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v11 = [v8 childElements];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = [*(id *)(*((void *)&v25 + 1) + 8 * i) getAttribute:@"itemID"];
        uint64_t v17 = [v9 indexOfObject:v16];
        if (v17 != 0x7FFFFFFFFFFFFFFFLL) {
          [v10 addIndex:v17];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v13);
  }

  if ([v10 count])
  {
    uint64_t v18 = objc_msgSend(v10, "cyclicRangeForItemCount:includeAllIndexes:", objc_msgSend(v9, "count"), 0);
    uint64_t v20 = v19;
  }
  else
  {
    uint64_t v18 = 0;
    uint64_t v20 = 0;
  }
  objc_msgSend(v8, "domib_setVisibleIndexRange:", v18, v20);
}

- (NSIndexSet)autoHighlightedIndexes
{
  return self->_autoHighlightedIndexes;
}

- (void)setAutoHighlightedIndexes:(id)a3
{
}

- (NSDictionary)usedAppPrototypesByIdentifier
{
  return self->_usedAppPrototypesByIdentifier;
}

- (void)setUsedAppPrototypesByIdentifier:(id)a3
{
}

- (IKChangeSet)itemsChangeSet
{
  return self->_itemsChangeSet;
}

- (void)setItemsChangeSet:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsChangeSet, 0);
  objc_storeStrong((id *)&self->_usedAppPrototypesByIdentifier, 0);
  objc_storeStrong((id *)&self->_autoHighlightedIndexes, 0);
}

@end