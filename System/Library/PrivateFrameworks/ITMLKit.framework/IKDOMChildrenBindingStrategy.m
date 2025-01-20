@interface IKDOMChildrenBindingStrategy
- (IKDOMChildrenBindingStrategy)initWithDOMBindingController:(id)a3;
- (void)_regenerateChildDOMElements:(id)a3 withItems:(id)a4 usedPrototypesByIdentifier:(id)a5;
- (void)_updateChildDOMElements:(id)a3 withItems:(id)a4 usedPrototypesByIdentifier:(id)a5 changeSet:(id)a6;
- (void)willUpdateWithItems:(id)a3 indexTitles:(id)a4 usedPrototypesByIdentifier:(id)a5 changeSet:(id)a6;
@end

@implementation IKDOMChildrenBindingStrategy

- (IKDOMChildrenBindingStrategy)initWithDOMBindingController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IKDOMChildrenBindingStrategy;
  return [(IKDOMBindingStrategy *)&v4 initWithDOMBindingController:a3 itemsBindingKey:@"children"];
}

- (void)willUpdateWithItems:(id)a3 indexTitles:(id)a4 usedPrototypesByIdentifier:(id)a5 changeSet:(id)a6
{
  id v20 = a3;
  id v9 = a5;
  id v10 = a6;
  v11 = [(IKDOMBindingStrategy *)self domBindingController];
  v12 = [v11 domElement];
  v13 = [v12 childElements];
  v14 = (void *)[v13 mutableCopy];

  v15 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_28];
  [v14 filterUsingPredicate:v15];

  if (v10
    && (uint64_t v16 = [v14 count],
        [(IKDOMBindingStrategy *)self items],
        v17 = objc_claimAutoreleasedReturnValue(),
        uint64_t v18 = [v17 count],
        v17,
        v16 == v18))
  {
    v19 = (void *)[v14 copy];
    [(IKDOMChildrenBindingStrategy *)self _updateChildDOMElements:v19 withItems:v20 usedPrototypesByIdentifier:v9 changeSet:v10];
  }
  else
  {
    v19 = (void *)[v14 copy];
    [(IKDOMChildrenBindingStrategy *)self _regenerateChildDOMElements:v19 withItems:v20 usedPrototypesByIdentifier:v9];
  }
}

uint64_t __101__IKDOMChildrenBindingStrategy_willUpdateWithItems_indexTitles_usedPrototypesByIdentifier_changeSet___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 nodeName];
  if ([v3 isEqualToString:@"prototypes"])
  {
    uint64_t v4 = 0;
  }
  else
  {
    v5 = [v2 nodeName];
    uint64_t v4 = [v5 isEqualToString:@"rules"] ^ 1;
  }
  return v4;
}

- (void)_regenerateChildDOMElements:(id)a3 withItems:(id)a4 usedPrototypesByIdentifier:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(IKDOMBindingStrategy *)self domBindingController];
  v12 = [v11 domElement];
  v13 = (void *)[v8 mutableCopy];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __97__IKDOMChildrenBindingStrategy__regenerateChildDOMElements_withItems_usedPrototypesByIdentifier___block_invoke;
  v28[3] = &unk_1E6DE6B40;
  id v14 = v10;
  id v29 = v14;
  id v15 = v13;
  id v30 = v15;
  id v16 = v12;
  id v31 = v16;
  id v17 = v11;
  id v32 = v17;
  [v9 enumerateObjectsUsingBlock:v28];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v18 = v15;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v25;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = (id)objc_msgSend(v16, "removeChild:", *(void *)(*((void *)&v24 + 1) + 8 * v22++), (void)v24);
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v20);
  }
}

void __97__IKDOMChildrenBindingStrategy__regenerateChildDOMElements_withItems_usedPrototypesByIdentifier___block_invoke(id *a1, void *a2)
{
  id v4 = a2;
  v5 = [v4 prototypeIdentifier];
  v6 = [a1[4] objectForKeyedSubscript:v5];
  v7 = [v6 variantForDataItem:v4];

  id v8 = a1[5];
  if (v8)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __97__IKDOMChildrenBindingStrategy__regenerateChildDOMElements_withItems_usedPrototypesByIdentifier___block_invoke_2;
    v14[3] = &unk_1E6DE6B18;
    id v2 = &v15;
    id v15 = v4;
    uint64_t v9 = [v8 indexOfObjectPassingTest:v14];
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v10 = 0;
      uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      uint64_t v11 = v9;
      id v10 = [a1[5] objectAtIndexedSubscript:v9];
      if (v10) {
        id v12 = (id)[a1[6] removeChild:v10];
      }
    }
  }
  else
  {
    id v10 = 0;
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v13 = [(id)objc_opt_class() instantiateDOMElementForItem:v4 withPrototype:v7 parentDOMElement:a1[6] existingDOMElement:v10];
  if (v13 == v10) {
    [a1[5] removeObjectAtIndex:v11];
  }

  if (v8) {
}
  }

BOOL __97__IKDOMChildrenBindingStrategy__regenerateChildDOMElements_withItems_usedPrototypesByIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 dataItem];
  id v4 = +[IKJSDataObservable toDataObservable:v3];
  BOOL v5 = v4 == *(void **)(a1 + 32);

  return v5;
}

- (void)_updateChildDOMElements:(id)a3 withItems:(id)a4 usedPrototypesByIdentifier:(id)a5 changeSet:(id)a6
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v79 = a4;
  id v78 = a5;
  id v73 = a6;
  v77 = [(IKDOMBindingStrategy *)self domBindingController];
  uint64_t v11 = [v77 domElement];
  id v12 = (void *)[v10 mutableCopy];
  v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [MEMORY[0x1E4F1CA48] array];
  }
  id v15 = v14;

  id v16 = [v73 removedIndexes];
  id v17 = (void *)[v16 mutableCopy];
  id v18 = v17;
  if (v17)
  {
    id v19 = v17;
  }
  else
  {
    id v19 = [MEMORY[0x1E4F28E60] indexSet];
  }
  uint64_t v20 = v19;

  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  uint64_t v21 = [v73 movedIndexesByNewIndex];
  uint64_t v22 = [v21 allValues];

  uint64_t v23 = [v22 countByEnumeratingWithState:&v88 objects:v94 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v89;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v89 != v25) {
          objc_enumerationMutation(v22);
        }
        objc_msgSend(v20, "addIndex:", objc_msgSend(*(id *)(*((void *)&v88 + 1) + 8 * i), "integerValue"));
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v88 objects:v94 count:16];
    }
    while (v24);
  }

  uint64_t v27 = [v20 lastIndex];
  if (v27 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v28 = v27;
    do
    {
      id v29 = [v10 objectAtIndexedSubscript:v28];
      id v30 = (id)[v11 removeChild:v29];
      [v15 removeObjectAtIndex:v28];
      uint64_t v28 = [v20 indexLessThanIndex:v28];
    }
    while (v28 != 0x7FFFFFFFFFFFFFFFLL);
  }
  id v31 = [v73 addedIndexes];
  id v32 = (void *)[v31 mutableCopy];
  v33 = v32;
  v72 = v10;
  if (v32)
  {
    id v34 = v32;
  }
  else
  {
    id v34 = [MEMORY[0x1E4F28E60] indexSet];
  }
  v69 = v20;
  v71 = v34;

  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  v35 = [v73 movedIndexesByNewIndex];
  v36 = [v35 allKeys];

  uint64_t v37 = [v36 countByEnumeratingWithState:&v84 objects:v93 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v85;
    do
    {
      for (uint64_t j = 0; j != v38; ++j)
      {
        if (*(void *)v85 != v39) {
          objc_enumerationMutation(v36);
        }
        objc_msgSend(v71, "addIndex:", objc_msgSend(*(id *)(*((void *)&v84 + 1) + 8 * j), "integerValue", v69));
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v84 objects:v93 count:16];
    }
    while (v38);
  }

  uint64_t v41 = [v71 firstIndex];
  if (v41 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v42 = v41;
    do
    {
      v43 = objc_msgSend(v79, "objectAtIndexedSubscript:", v42, v69);
      uint64_t v44 = [v43 prototypeIdentifier];
      v45 = [v78 objectForKeyedSubscript:v44];
      v46 = [v45 variantForDataItem:v43];

      uint64_t v47 = [v73 oldIndexForNewIndex:v42];
      if (v47 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v48 = (void *)v44;
        v49 = v46;
        [v46 instantiateDOMElement];
      }
      else
      {
        v49 = v46;
        v48 = (void *)v44;
        [v72 objectAtIndexedSubscript:v47];
      v50 = };
      if (v42 < [v15 count]
        && ([v15 objectAtIndexedSubscript:v42], (uint64_t v51 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v52 = (void *)v51;
        id v53 = (id)[v11 insertBefore:v50 :v51];
      }
      else
      {
        id v54 = (id)[v11 appendChild:v50];
      }
      v55 = [(id)objc_opt_class() instantiateDOMElementForItem:v43 withPrototype:v49 parentDOMElement:v11 existingDOMElement:v50];
      [v15 insertObject:v55 atIndex:v42];
      unint64_t v42 = [v71 indexGreaterThanIndex:v42];
    }
    while (v42 != 0x7FFFFFFFFFFFFFFFLL);
  }
  v75 = v15;
  v76 = v11;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  v56 = objc_msgSend(v73, "updatedIndexesByNewIndex", v69);
  v57 = [v56 allKeys];

  obuint64_t j = v57;
  uint64_t v58 = [v57 countByEnumeratingWithState:&v80 objects:v92 count:16];
  if (v58)
  {
    uint64_t v59 = v58;
    uint64_t v60 = *(void *)v81;
    do
    {
      for (uint64_t k = 0; k != v59; ++k)
      {
        if (*(void *)v81 != v60) {
          objc_enumerationMutation(obj);
        }
        uint64_t v62 = [*(id *)(*((void *)&v80 + 1) + 8 * k) integerValue];
        v63 = [v75 objectAtIndexedSubscript:v62];
        v64 = [v79 objectAtIndexedSubscript:v62];
        v65 = [v64 prototypeIdentifier];
        v66 = [v78 objectForKeyedSubscript:v65];
        v67 = [v66 variantForDataItem:v64];

        v68 = [(id)objc_opt_class() instantiateDOMElementForItem:v64 withPrototype:v67 parentDOMElement:v76 existingDOMElement:v63];
        [v75 replaceObjectAtIndex:v62 withObject:v68];
      }
      uint64_t v59 = [obj countByEnumeratingWithState:&v80 objects:v92 count:16];
    }
    while (v59);
  }
}

@end