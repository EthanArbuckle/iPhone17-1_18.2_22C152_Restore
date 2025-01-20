@interface IKDOMBindingStrategy
- (BOOL)applyValue:(id)a3 forKey:(id)a4;
- (IKChangeSet)filteredChangeSet;
- (IKChangeSet)sourceItemsChangeSet;
- (IKDOMBindingController)domBindingController;
- (IKDOMBindingStrategy)initWithDOMBindingController:(id)a3 itemsBindingKey:(id)a4;
- (IKJSDataSourceView)dataSourceView;
- (NSArray)items;
- (NSMutableSet)updatedItemIDs;
- (NSString)itemsBindingKey;
- (_NSRange)visibleItemsRange;
- (id)_adjustedIndexTitlesFromDataSource:(id)a3 filteredItems:(id)a4 filteredChangeSet:(id)a5;
- (id)keysAffectingChildren;
- (id)prototypeDependentKeys;
- (void)_applyItemsValueWithDataSource:(id)a3;
- (void)didResolveKeys:(id)a3;
- (void)setDataSourceView:(id)a3;
- (void)setFilteredChangeSet:(id)a3;
- (void)setSourceItemsChangeSet:(id)a3;
- (void)setUpdatedItemIDs:(id)a3;
- (void)valueDidChangeForKey:(id)a3 propertyPath:(id)a4 extraInfo:(id)a5;
@end

@implementation IKDOMBindingStrategy

- (IKDOMBindingStrategy)initWithDOMBindingController:(id)a3 itemsBindingKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IKDOMBindingStrategy;
  v8 = [(IKDOMBindingStrategy *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_domBindingController, v6);
    uint64_t v10 = [v7 copy];
    itemsBindingKey = v9->_itemsBindingKey;
    v9->_itemsBindingKey = (NSString *)v10;
  }
  return v9;
}

- (NSArray)items
{
  v2 = [(IKDOMBindingStrategy *)self domBindingController];
  v3 = [v2 domElement];
  v4 = objc_msgSend(v3, "dombs_items");

  return (NSArray *)v4;
}

- (id)keysAffectingChildren
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(IKDOMBindingStrategy *)self itemsBindingKey];
  v4 = [v2 setWithObject:v3];

  return v4;
}

- (id)prototypeDependentKeys
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(IKDOMBindingStrategy *)self itemsBindingKey];
  v4 = [v2 setWithObject:v3];

  return v4;
}

- (void)valueDidChangeForKey:(id)a3 propertyPath:(id)a4 extraInfo:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(IKDOMBindingStrategy *)self itemsBindingKey];
  int v12 = [v8 isEqualToString:v11];

  if (v12)
  {
    objc_super v13 = [v10 objectForKeyedSubscript:@"changeSet"];
    if (v13)
    {
      v14 = [(IKDOMBindingStrategy *)self sourceItemsChangeSet];

      if (v14)
      {
        v15 = [(IKDOMBindingStrategy *)self sourceItemsChangeSet];
        v16 = [v15 changeSetByConcatenatingChangeSet:v13];
        [(IKDOMBindingStrategy *)self setSourceItemsChangeSet:v16];
      }
      v17 = [(IKDOMBindingStrategy *)self updatedItemIDs];

      if (v17)
      {
        id v36 = v8;
        v18 = [(IKDOMBindingStrategy *)self domBindingController];
        v19 = [v18 dataItem];
        id v35 = v9;
        v20 = [v19 valueForPropertyPath:v9 boxed:1];
        v21 = +[IKJSDataObservable toDataObservable:v20];

        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        v34 = v13;
        v22 = [v13 updatedIndexesByNewIndex];
        v23 = [v22 allKeys];

        uint64_t v24 = [v23 countByEnumeratingWithState:&v37 objects:v41 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v38;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v38 != v26) {
                objc_enumerationMutation(v23);
              }
              v28 = objc_msgSend(v21, "valuesForSubscripts:boxed:", objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * i), "integerValue"), 1, 1);
              v29 = [v28 objectAtIndexedSubscript:0];
              v30 = +[IKJSDataObservable toDataObservable:v29];

              v31 = [v30 identifier];

              if (v31)
              {
                v32 = [(IKDOMBindingStrategy *)self updatedItemIDs];
                v33 = [v30 identifier];
                [v32 addObject:v33];
              }
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v37 objects:v41 count:16];
          }
          while (v25);
        }

        id v9 = v35;
        id v8 = v36;
        objc_super v13 = v34;
      }
    }
    else
    {
      [(IKDOMBindingStrategy *)self setSourceItemsChangeSet:0];
    }
  }
}

- (BOOL)applyValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IKDOMBindingStrategy *)self itemsBindingKey];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    id v10 = +[IKJSDataObservable toDataObservable:v6];
    [(IKDOMBindingStrategy *)self _applyItemsValueWithDataSource:v10];
  }
  return 0;
}

- (void)didResolveKeys:(id)a3
{
  id v6 = [(IKDOMBindingStrategy *)self dataSourceView];
  uint64_t v4 = [(IKDOMBindingStrategy *)self visibleItemsRange];
  objc_msgSend(v6, "setUsedIndexRange:", v4, v5);
}

- (_NSRange)visibleItemsRange
{
  NSUInteger v2 = 0;
  NSUInteger v3 = 0;
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)_applyItemsValueWithDataSource:(id)a3
{
  uint64_t v143 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(IKDOMBindingStrategy *)self domBindingController];
  id v6 = [v5 domElement];
  id v7 = objc_msgSend(v6, "dombs_items");
  id v8 = [(IKDOMBindingStrategy *)self filteredChangeSet];
  int v9 = [MEMORY[0x1E4F1CA60] dictionary];
  id v10 = objc_msgSend(v4, "valuesForSubscripts:boxed:", 0, 0x7FFFFFFFFFFFFFFFLL, 1);
  v110 = [(IKDOMBindingStrategy *)self sourceItemsChangeSet];
  v11 = objc_opt_new();
  v106 = self;
  [(IKDOMBindingStrategy *)self setSourceItemsChangeSet:v11];

  v132[0] = MEMORY[0x1E4F143A8];
  v132[1] = 3221225472;
  v132[2] = __55__IKDOMBindingStrategy__applyItemsValueWithDataSource___block_invoke;
  v132[3] = &unk_1E6DE6B68;
  id v12 = v10;
  id v133 = v12;
  id v105 = v5;
  id v134 = v105;
  id v108 = v9;
  id v135 = v108;
  v114 = (void (**)(void, void))MEMORY[0x1E4E65800](v132);
  objc_super v13 = (void *)[v7 mutableCopy];
  v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v15 = [MEMORY[0x1E4F1CA48] array];
  }
  v113 = v15;

  v107 = v7;
  v109 = v8;
  v104 = v12;
  if (v110)
  {
    v16 = [v110 removedIndexes];
    v17 = (void *)[v16 mutableCopy];
    v18 = v17;
    if (v17)
    {
      id v19 = v17;
    }
    else
    {
      id v19 = [MEMORY[0x1E4F28E60] indexSet];
    }
    v30 = v19;

    long long v125 = 0u;
    long long v126 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    v31 = [v110 movedIndexesByNewIndex];
    v32 = [v31 allValues];

    uint64_t v33 = [v32 countByEnumeratingWithState:&v123 objects:v142 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v124;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v124 != v35) {
            objc_enumerationMutation(v32);
          }
          objc_msgSend(v30, "addIndex:", objc_msgSend(*(id *)(*((void *)&v123 + 1) + 8 * i), "integerValue"));
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v123 objects:v142 count:16];
      }
      while (v34);
    }

    uint64_t v37 = [v30 lastIndex];
    if (v37 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (uint64_t j = v37; j != 0x7FFFFFFFFFFFFFFFLL; uint64_t j = [v30 indexLessThanIndex:j])
      {
        uint64_t v39 = [v8 newIndexForOldIndex:j];
        if (v39 != 0x7FFFFFFFFFFFFFFFLL) {
          [v113 removeObjectAtIndex:v39];
        }
      }
    }
    v112 = v30;
    long long v40 = (void *)MEMORY[0x1E4F1CA80];
    v41 = [v113 valueForKey:@"identifier"];
    v111 = [v40 setWithArray:v41];

    v29 = (IKChangeSet *)objc_opt_new();
    uint64_t v42 = [v110 addedIndexes];
    v43 = (void *)[v42 mutableCopy];
    v44 = v43;
    if (v43)
    {
      v45 = v43;
    }
    else
    {
      v45 = [MEMORY[0x1E4F28E60] indexSet];
    }
    v46 = v45;

    long long v121 = 0u;
    long long v122 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    v47 = [v110 movedIndexesByNewIndex];
    v48 = [v47 allKeys];

    uint64_t v49 = [v48 countByEnumeratingWithState:&v119 objects:v141 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v120;
      do
      {
        for (uint64_t k = 0; k != v50; ++k)
        {
          if (*(void *)v120 != v51) {
            objc_enumerationMutation(v48);
          }
          -[IKDiffEvaluator addIndex:](v46, "addIndex:", [*(id *)(*((void *)&v119 + 1) + 8 * k) integerValue]);
        }
        uint64_t v50 = [v48 countByEnumeratingWithState:&v119 objects:v141 count:16];
      }
      while (v50);
    }

    v53 = [v109 removedIndexes];
    if (v53)
    {
      v54 = [v109 removedIndexes];
      uint64_t v55 = [v54 firstIndex];

      while (v55 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v56 = [v110 newIndexForOldIndex:v55];
        if (v56 != 0x7FFFFFFFFFFFFFFFLL) {
          [(IKDiffEvaluator *)v46 addIndex:v56];
        }
        v57 = [v109 removedIndexes];
        uint64_t v55 = [v57 indexGreaterThanIndex:v55];
      }
    }
    else
    {
    }
    uint64_t v58 = [(IKDiffEvaluator *)v46 firstIndex];
    if (v58 == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_47:
      long long v117 = 0u;
      long long v118 = 0u;
      long long v115 = 0u;
      long long v116 = 0u;
      v60 = objc_msgSend(v110, "updatedIndexesByNewIndex", v103);
      v61 = [v60 allKeys];

      uint64_t v62 = [v61 countByEnumeratingWithState:&v115 objects:v136 count:16];
      if (v62)
      {
        uint64_t v63 = v62;
        uint64_t v64 = *(void *)v116;
        do
        {
          for (uint64_t m = 0; m != v63; ++m)
          {
            if (*(void *)v116 != v64) {
              objc_enumerationMutation(v61);
            }
            uint64_t v66 = [*(id *)(*((void *)&v115 + 1) + 8 * m) integerValue];
            uint64_t v67 = [(IKChangeSet *)v29 newIndexForOldIndex:v66];
            if (v67 != 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v68 = v67;
              v69 = v114[2](v114, v66);
              [v113 replaceObjectAtIndex:v68 withObject:v69];
            }
          }
          uint64_t v63 = [v61 countByEnumeratingWithState:&v115 objects:v136 count:16];
        }
        while (v63);
      }

      v70 = v109;
      v71 = v110;
      v72 = [v110 changeSetByConvertingOldIndexesUsingChangeSet:v109 andNewIndexesUsingChangeSet:v29];
      v20 = v113;
      goto LABEL_80;
    }
    uint64_t v73 = v58;
    *(void *)&long long v59 = 134218242;
    long long v103 = v59;
    while (1)
    {
      v74 = v114[2](v114, v73);
      if (!v74) {
        goto LABEL_63;
      }
      v75 = v74;
      v76 = [v74 identifier];
      int v77 = [v111 containsObject:v76];

      if (v77) {
        break;
      }
      objc_msgSend(v113, "insertObject:atIndex:", v75, -[IKChangeSet newIndexForOldIndex:](v29, "newIndexForOldIndex:", v73));
      v83 = [v75 identifier];
      [v111 addObject:v83];
LABEL_68:

      uint64_t v73 = [(IKDiffEvaluator *)v46 indexGreaterThanIndex:v73];
      if (v73 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_47;
      }
    }
    v78 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
    {
      v86 = [v75 identifier];
      *(_DWORD *)buf = v103;
      uint64_t v138 = v73;
      __int16 v139 = 2112;
      v140 = v86;
      _os_log_error_impl(&dword_1E2ACE000, v78, OS_LOG_TYPE_ERROR, "Duplicate value at %ld - %@", buf, 0x16u);
    }
LABEL_63:
    v79 = [(IKChangeSet *)v29 removedIndexes];
    v80 = (void *)[v79 mutableCopy];
    v81 = v80;
    if (v80) {
      id v82 = v80;
    }
    else {
      id v82 = (id)objc_opt_new();
    }
    v75 = v82;

    [v75 addIndex:v73];
    v84 = [IKChangeSet alloc];
    v83 = (void *)[v75 copy];
    uint64_t v85 = [(IKChangeSet *)v84 initWithAddedIndexes:0 removedIndexes:v83 movedIndexesByNewIndex:0 updatedIndexesByNewIndex:0];

    v29 = (IKChangeSet *)v85;
    goto LABEL_68;
  }
  v112 = [MEMORY[0x1E4F1CA80] set];
  v111 = [MEMORY[0x1E4F28E60] indexSet];
  v20 = v113;
  [v113 removeAllObjects];
  if ([v12 count])
  {
    unint64_t v21 = 0;
    do
    {
      v22 = v114[2](v114, v21);
      v23 = v22;
      if (v22
        && ([v22 identifier],
            uint64_t v24 = objc_claimAutoreleasedReturnValue(),
            char v25 = [v112 containsObject:v24],
            v24,
            (v25 & 1) == 0))
      {
        [v113 addObject:v23];
        uint64_t v26 = [v23 identifier];
        [v112 addObject:v26];
      }
      else
      {
        [v111 addIndex:v21];
      }

      ++v21;
    }
    while (v21 < [v12 count]);
  }
  v27 = [IKChangeSet alloc];
  if ([v111 count])
  {
    v28 = (void *)[v111 copy];
    v29 = [(IKChangeSet *)v27 initWithAddedIndexes:0 removedIndexes:v28 movedIndexesByNewIndex:0 updatedIndexesByNewIndex:0];
  }
  else
  {
    v29 = [(IKChangeSet *)v27 initWithAddedIndexes:0 removedIndexes:0 movedIndexesByNewIndex:0 updatedIndexesByNewIndex:0];
  }
  v70 = v109;
  if (!v107)
  {
    v72 = 0;
    v92 = v106;
    v71 = 0;
    goto LABEL_81;
  }
  v46 = [[IKDiffEvaluator alloc] initWithObjects:v113 oldObjects:v107 hashing:&__block_literal_global_29];
  v87 = [(IKDOMBindingStrategy *)v106 updatedItemIDs];

  if (v87)
  {
    v88 = [MEMORY[0x1E4F1CA60] dictionary];
    v89 = [(IKDiffEvaluator *)v46 oldIndexesByNewIndex];
    v127[0] = MEMORY[0x1E4F143A8];
    v127[1] = 3221225472;
    v127[2] = __55__IKDOMBindingStrategy__applyItemsValueWithDataSource___block_invoke_2;
    v127[3] = &unk_1E6DE6BB0;
    id v128 = v107;
    id v129 = v113;
    v130 = v106;
    id v90 = v88;
    id v131 = v90;
    [v89 enumerateKeysAndObjectsUsingBlock:v127];

    if ([v90 count]) {
      v91 = (void *)[v90 copy];
    }
    else {
      v91 = 0;
    }

    v20 = v113;
  }
  else
  {
    v91 = [(IKDiffEvaluator *)v46 oldIndexesByNewIndex];
    v20 = v113;
  }
  v93 = [IKChangeSet alloc];
  v94 = [(IKDiffEvaluator *)v46 addedIndexes];
  v95 = [(IKDiffEvaluator *)v46 removedIndexes];
  v96 = [(IKDiffEvaluator *)v46 movedIndexesByNewIndex];
  v72 = [(IKChangeSet *)v93 initWithAddedIndexes:v94 removedIndexes:v95 movedIndexesByNewIndex:v96 updatedIndexesByNewIndex:v91];

  v70 = v109;
  v71 = 0;
LABEL_80:

  v92 = v106;
LABEL_81:

  v97 = [(IKDOMBindingStrategy *)v92 _adjustedIndexTitlesFromDataSource:v4 filteredItems:v20 filteredChangeSet:v29];
  [(IKDOMBindingStrategy *)v92 willUpdateWithItems:v20 indexTitles:v97 usedPrototypesByIdentifier:v108 changeSet:v72];
  v98 = (void *)[v20 copy];
  objc_msgSend(v6, "dombs_setItems:", v98);

  [(IKDOMBindingStrategy *)v92 setFilteredChangeSet:v29];
  v99 = [MEMORY[0x1E4F1CA80] set];
  [(IKDOMBindingStrategy *)v92 setUpdatedItemIDs:v99];

  v100 = [(IKDOMBindingStrategy *)v92 dataSourceView];
  id v101 = [v100 dataSource];

  if (v101 != v4)
  {
    id v102 = [[IKJSDataSourceView alloc] initForDataSource:v4];
    [(IKDOMBindingStrategy *)v92 setDataSourceView:v102];
  }
}

IKJSDataItem *__55__IKDOMBindingStrategy__applyItemsValueWithDataSource___block_invoke(id *a1, uint64_t a2)
{
  id v4 = [a1[4] objectAtIndexedSubscript:a2];
  if (([v4 isNull] & 1) != 0 || objc_msgSend(v4, "isUndefined"))
  {
    uint64_t v5 = objc_alloc_init(IKJSDataItem);
  }
  else
  {
    uint64_t v5 = +[IKJSDataObservable toDataObservable:v4];
  }
  id v6 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v19 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __55__IKDOMBindingStrategy__applyItemsValueWithDataSource___block_invoke_cold_2(a2, v19);
    }
    goto LABEL_19;
  }
  id v7 = [a1[5] findPrototypeForDataItem:v6];
  if (!v7)
  {
    id v19 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __55__IKDOMBindingStrategy__applyItemsValueWithDataSource___block_invoke_cold_1(a2, v19);
    }
LABEL_19:

    id v6 = 0;
    id v8 = 0;
    goto LABEL_20;
  }
  id v8 = v7;
  int v9 = [v7 identifier];
  [(IKJSDataItem *)v6 setPrototypeIdentifier:v9];
  [a1[6] setObject:v8 forKeyedSubscript:v9];

  if (v6)
  {
    id v10 = [(IKJSDataItem *)v6 identifier];
    v11 = [v8 domElement];
    id v12 = +[IKDOMBindingController parsedBindingForDOMElement:v11];

    objc_super v13 = [v12 keyValues];
    v14 = [@"@" stringByAppendingString:@"itemID"];
    id v15 = [v13 objectForKeyedSubscript:v14];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [(IKJSDataObservable *)v6 valueForPropertyPath:v15 boxed:0];
      if ([v16 isString])
      {
        uint64_t v17 = [v16 toString];

        id v10 = (void *)v17;
      }
    }
    if (!v10)
    {
      v18 = [MEMORY[0x1E4F29128] UUID];
      id v10 = [v18 UUIDString];
    }
    [(IKJSDataItem *)v6 setIdentifier:v10];
  }
LABEL_20:

  return v6;
}

uint64_t __55__IKDOMBindingStrategy__applyItemsValueWithDataSource___block_invoke_17(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

void __55__IKDOMBindingStrategy__applyItemsValueWithDataSource___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = objc_msgSend(a1[4], "objectAtIndexedSubscript:", objc_msgSend(v5, "integerValue"));
  id v7 = objc_msgSend(a1[5], "objectAtIndexedSubscript:", objc_msgSend(v11, "integerValue"));
  if (v6 != v7
    || ([a1[6] updatedItemIDs],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v6 identifier],
        int v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v8 containsObject:v9],
        v9,
        v8,
        v10))
  {
    [a1[7] setObject:v5 forKeyedSubscript:v11];
  }
}

- (id)_adjustedIndexTitlesFromDataSource:(id)a3 filteredItems:(id)a4 filteredChangeSet:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v26 = a4;
  id v8 = a5;
  if ([v7 isBoxed])
  {
    int v9 = 0;
  }
  else
  {
    id v24 = v7;
    int v10 = [v7 indexTitles];
    id v11 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v12 = [v10 allKeys];
    objc_super v13 = [v12 sortedArrayUsingSelector:sel_compare_];

    obuint64_t j = v13;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v28;
LABEL_5:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = [*(id *)(*((void *)&v27 + 1) + 8 * v17) integerValue];
        unint64_t v19 = [v8 newIndexByShiftingOldIndex:v18 grouped:1];
        if (v19 >= [v26 count]) {
          break;
        }
        v20 = [NSNumber numberWithInteger:v18];
        unint64_t v21 = [v10 objectForKeyedSubscript:v20];
        v22 = [NSNumber numberWithInteger:v19];
        [v11 setObject:v21 forKeyedSubscript:v22];

        if (v15 == ++v17)
        {
          uint64_t v15 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
          if (v15) {
            goto LABEL_5;
          }
          break;
        }
      }
    }

    if ([v11 count]) {
      int v9 = (void *)[v11 copy];
    }
    else {
      int v9 = 0;
    }

    id v7 = v24;
  }

  return v9;
}

- (IKDOMBindingController)domBindingController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_domBindingController);
  return (IKDOMBindingController *)WeakRetained;
}

- (NSString)itemsBindingKey
{
  return self->_itemsBindingKey;
}

- (IKChangeSet)sourceItemsChangeSet
{
  return self->_sourceItemsChangeSet;
}

- (void)setSourceItemsChangeSet:(id)a3
{
}

- (NSMutableSet)updatedItemIDs
{
  return self->_updatedItemIDs;
}

- (void)setUpdatedItemIDs:(id)a3
{
}

- (IKChangeSet)filteredChangeSet
{
  return self->_filteredChangeSet;
}

- (void)setFilteredChangeSet:(id)a3
{
}

- (IKJSDataSourceView)dataSourceView
{
  return self->_dataSourceView;
}

- (void)setDataSourceView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceView, 0);
  objc_storeStrong((id *)&self->_filteredChangeSet, 0);
  objc_storeStrong((id *)&self->_updatedItemIDs, 0);
  objc_storeStrong((id *)&self->_sourceItemsChangeSet, 0);
  objc_storeStrong((id *)&self->_itemsBindingKey, 0);
  objc_destroyWeak((id *)&self->_domBindingController);
}

void __55__IKDOMBindingStrategy__applyItemsValueWithDataSource___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E2ACE000, a2, OS_LOG_TYPE_ERROR, "Invalid value at %ld. Item value must have a valid prototype specification", (uint8_t *)&v2, 0xCu);
}

void __55__IKDOMBindingStrategy__applyItemsValueWithDataSource___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E2ACE000, a2, OS_LOG_TYPE_ERROR, "Invalid value at %ld. Item value must have an object", (uint8_t *)&v2, 0xCu);
}

@end