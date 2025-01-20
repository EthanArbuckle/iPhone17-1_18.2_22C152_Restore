@interface IKDSEUnboundItemsImpl
- (IKChangeSet)itemsChangeSet;
- (IKDSEUnboundItemsImpl)initWithDataSourceElement:(id)a3;
- (IKDataSourceElement)dataSourceElement;
- (NSArray)itemElements;
- (NSArray)proxiedItemElements;
- (NSDictionary)indexTitles;
- (id)elementForItemAtIndex:(int64_t)a3;
- (id)prototypeForItemAtIndex:(int64_t)a3;
- (int64_t)indexOfItemForElement:(id)a3;
- (int64_t)numberOfItems;
- (void)applyUpdatesWithImplementation:(id)a3 usingUpdater:(id)a4;
- (void)resetUpdates;
- (void)setItemElements:(id)a3;
- (void)setItemsChangeSet:(id)a3;
- (void)updateStylesUsingUpdater:(id)a3;
@end

@implementation IKDSEUnboundItemsImpl

- (IKDSEUnboundItemsImpl)initWithDataSourceElement:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IKDSEUnboundItemsImpl;
  v5 = [(IKDSEUnboundItemsImpl *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_dataSourceElement, v4);
  }

  return v6;
}

- (NSArray)itemElements
{
  itemElements = self->_itemElements;
  if (!itemElements)
  {
    id v4 = [(IKDSEUnboundItemsImpl *)self dataSourceElement];
    v5 = [v4 unboundItemElements];
    v6 = (NSArray *)[v5 copy];
    v7 = self->_itemElements;
    self->_itemElements = v6;

    itemElements = self->_itemElements;
  }
  return itemElements;
}

- (NSArray)proxiedItemElements
{
  return 0;
}

- (int64_t)numberOfItems
{
  v2 = [(IKDSEUnboundItemsImpl *)self itemElements];
  int64_t v3 = [v2 count];

  return v3;
}

- (id)prototypeForItemAtIndex:(int64_t)a3
{
  id v4 = [(IKDSEUnboundItemsImpl *)self itemElements];
  v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (id)elementForItemAtIndex:(int64_t)a3
{
  id v4 = [(IKDSEUnboundItemsImpl *)self itemElements];
  v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (int64_t)indexOfItemForElement:(id)a3
{
  id v4 = a3;
  v5 = [(IKDSEUnboundItemsImpl *)self itemElements];
  int64_t v6 = [v5 indexOfObject:v4];

  return v6;
}

- (NSDictionary)indexTitles
{
  return 0;
}

- (void)applyUpdatesWithImplementation:(id)a3 usingUpdater:(id)a4
{
  id v5 = a4;
  int64_t v6 = [(IKDSEUnboundItemsImpl *)self dataSourceElement];
  v7 = [v6 unfilteredChildren];

  objc_super v8 = [(IKDSEUnboundItemsImpl *)self itemElements];
  v59 = v5;
  v9 = (*((void (**)(id))v5 + 2))(v5);
  [(IKDSEUnboundItemsImpl *)self setItemElements:0];
  v10 = [v9 unfilteredChildren];
  v11 = [v9 impl];
  v12 = [v11 itemElements];

  v62 = v9;
  v13 = [v9 unfilteredChildrenChangeSet];
  v14 = [MEMORY[0x1E4F28E60] indexSet];
  v15 = [v13 removedIndexes];
  if (v15)
  {
    v16 = [v13 removedIndexes];
    uint64_t v17 = [v16 firstIndex];

    while (v17 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v18 = [v7 objectAtIndexedSubscript:v17];
      uint64_t v19 = [v8 indexOfObject:v18];

      if (v19 != 0x7FFFFFFFFFFFFFFFLL) {
        [v14 addIndex:v19];
      }
      v20 = [v13 removedIndexes];
      uint64_t v17 = [v20 indexGreaterThanIndex:v17];
    }
  }
  else
  {
  }
  v60 = v14;
  v21 = [MEMORY[0x1E4F28E60] indexSet];
  v22 = [v13 addedIndexes];
  if (v22)
  {
    v23 = [v13 addedIndexes];
    uint64_t v24 = [v23 firstIndex];

    while (v24 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v25 = [v10 objectAtIndexedSubscript:v24];
      uint64_t v26 = [v12 indexOfObject:v25];

      if (v26 != 0x7FFFFFFFFFFFFFFFLL) {
        [v21 addIndex:v26];
      }
      v27 = [v13 addedIndexes];
      uint64_t v24 = [v27 indexGreaterThanIndex:v24];
    }
  }
  else
  {
  }
  v28 = [MEMORY[0x1E4F1CA60] dictionary];
  v29 = [v13 movedIndexesByNewIndex];
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __69__IKDSEUnboundItemsImpl_applyUpdatesWithImplementation_usingUpdater___block_invoke;
  v71[3] = &unk_1E6DE55C0;
  id v30 = v8;
  id v72 = v30;
  id v31 = v7;
  id v73 = v31;
  id v32 = v12;
  id v74 = v32;
  id v33 = v10;
  id v75 = v33;
  id v34 = v28;
  id v76 = v34;
  [v29 enumerateKeysAndObjectsUsingBlock:v71];

  v35 = [MEMORY[0x1E4F1CA60] dictionary];
  v36 = [v13 updatedIndexesByNewIndex];
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __69__IKDSEUnboundItemsImpl_applyUpdatesWithImplementation_usingUpdater___block_invoke_2;
  v63[3] = &unk_1E6DE55E8;
  id v58 = v30;
  id v64 = v58;
  id v57 = v31;
  id v65 = v57;
  id v56 = v32;
  id v66 = v56;
  id v55 = v33;
  id v67 = v55;
  id v37 = v35;
  id v68 = v37;
  id v38 = v60;
  id v69 = v38;
  id v39 = v21;
  id v70 = v39;
  [v36 enumerateKeysAndObjectsUsingBlock:v63];

  v61 = [v62 impl];
  v50 = [IKChangeSet alloc];
  uint64_t v52 = [v39 count];
  if (v52) {
    uint64_t v40 = [v39 copy];
  }
  else {
    uint64_t v40 = 0;
  }
  uint64_t v41 = [v38 count];
  v53 = v39;
  v54 = v38;
  if (v41) {
    v42 = (void *)[v38 copy];
  }
  else {
    v42 = 0;
  }
  uint64_t v43 = [v34 count];
  v44 = v34;
  if (v43) {
    v45 = (void *)[v34 copy];
  }
  else {
    v45 = 0;
  }
  uint64_t v46 = [v37 count];
  v51 = v37;
  if (v46) {
    v47 = (void *)[v37 copy];
  }
  else {
    v47 = 0;
  }
  v48 = (void *)v40;
  v49 = [(IKChangeSet *)v50 initWithAddedIndexes:v40 removedIndexes:v42 movedIndexesByNewIndex:v45 updatedIndexesByNewIndex:v47];
  [v61 setItemsChangeSet:v49];

  if (v46) {
  if (v43)
  }

  if (v41) {
  if (v52)
  }
}

void __69__IKDSEUnboundItemsImpl_applyUpdatesWithImplementation_usingUpdater___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = *(void **)(a1 + 32);
  int64_t v6 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", objc_msgSend(a3, "integerValue"));
  uint64_t v7 = [v5 indexOfObject:v6];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = v7;
    v9 = *(void **)(a1 + 48);
    v10 = objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", objc_msgSend(v14, "integerValue"));
    uint64_t v11 = [v9 indexOfObject:v10];

    if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_5;
    }
    int64_t v6 = [NSNumber numberWithInteger:v8];
    v12 = *(void **)(a1 + 64);
    v13 = [NSNumber numberWithInteger:v11];
    [v12 setObject:v6 forKeyedSubscript:v13];
  }
LABEL_5:
}

void __69__IKDSEUnboundItemsImpl_applyUpdatesWithImplementation_usingUpdater___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = (void *)a1[4];
  int64_t v6 = (void *)a1[5];
  id v7 = a2;
  uint64_t v8 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(a3, "integerValue"));
  uint64_t v9 = [v5 indexOfObject:v8];

  v10 = (void *)a1[6];
  uint64_t v11 = (void *)a1[7];
  uint64_t v12 = [v7 integerValue];

  v13 = [v11 objectAtIndexedSubscript:v12];
  uint64_t v14 = [v10 indexOfObject:v13];

  if (v9 == 0x7FFFFFFFFFFFFFFFLL || v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
        return;
      }
      v16 = (void *)a1[10];
      uint64_t v17 = v14;
    }
    else
    {
      v16 = (void *)a1[9];
      uint64_t v17 = v9;
    }
    [v16 addIndex:v17];
  }
  else
  {
    id v20 = [NSNumber numberWithInteger:v9];
    v18 = (void *)a1[8];
    uint64_t v19 = [NSNumber numberWithInteger:v14];
    [v18 setObject:v20 forKeyedSubscript:v19];
  }
}

- (void)updateStylesUsingUpdater:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = [(IKDSEUnboundItemsImpl *)self itemElements];
  v4[2](v4);

  [(IKDSEUnboundItemsImpl *)self setItemElements:0];
  int64_t v6 = [(IKDSEUnboundItemsImpl *)self itemElements];
  id v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  if (+[IKViewElementStyle isHiddenStyleRegistered])
  {
    uint64_t v8 = [[IKDiffEvaluator alloc] initWithObjects:v6 oldObjects:v5 hashing:&__block_literal_global_12];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __50__IKDSEUnboundItemsImpl_updateStylesUsingUpdater___block_invoke_2;
    v21[3] = &unk_1E6DE5630;
    uint64_t v9 = &v22;
    id v22 = v7;
    [(IKDiffEvaluator *)v8 enumerateCommonObjectsUsingBlock:v21];
  }
  else
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __50__IKDSEUnboundItemsImpl_updateStylesUsingUpdater___block_invoke_3;
    v19[3] = &unk_1E6DE4EC8;
    uint64_t v9 = &v20;
    id v20 = v7;
    [v6 enumerateObjectsUsingBlock:v19];
    uint64_t v8 = 0;
  }

  v10 = [IKChangeSet alloc];
  uint64_t v11 = [(IKDiffEvaluator *)v8 addedIndexes];
  uint64_t v12 = [(IKDiffEvaluator *)v8 removedIndexes];
  v13 = [(IKDiffEvaluator *)v8 movedIndexesByNewIndex];
  if ([v7 count])
  {
    uint64_t v14 = (void *)[v7 copy];
    v15 = [(IKChangeSet *)v10 initWithAddedIndexes:v11 removedIndexes:v12 movedIndexesByNewIndex:v13 updatedIndexesByNewIndex:v14];
  }
  else
  {
    v15 = [(IKChangeSet *)v10 initWithAddedIndexes:v11 removedIndexes:v12 movedIndexesByNewIndex:v13 updatedIndexesByNewIndex:0];
  }

  v16 = [(IKDSEUnboundItemsImpl *)self itemsChangeSet];
  if (v16)
  {
    uint64_t v17 = [(IKDSEUnboundItemsImpl *)self itemsChangeSet];
    v18 = [v17 changeSetByConcatenatingChangeSet:v15];
    [(IKDSEUnboundItemsImpl *)self setItemsChangeSet:v18];
  }
  else
  {
    [(IKDSEUnboundItemsImpl *)self setItemsChangeSet:v15];
  }
}

uint64_t __50__IKDSEUnboundItemsImpl_updateStylesUsingUpdater___block_invoke(uint64_t a1, void *a2)
{
  return [a2 itmlID];
}

void __50__IKDSEUnboundItemsImpl_updateStylesUsingUpdater___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  if ([a3 updateType])
  {
    id v9 = [NSNumber numberWithInteger:a4];
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = [NSNumber numberWithInteger:a2];
    [v7 setObject:v9 forKeyedSubscript:v8];
  }
}

void __50__IKDSEUnboundItemsImpl_updateStylesUsingUpdater___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  if ([a2 updateType])
  {
    id v7 = [NSNumber numberWithUnsignedInteger:a3];
    id v5 = *(void **)(a1 + 32);
    int64_t v6 = [NSNumber numberWithUnsignedInteger:a3];
    [v5 setObject:v7 forKeyedSubscript:v6];
  }
}

- (void)resetUpdates
{
}

- (IKDataSourceElement)dataSourceElement
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSourceElement);
  return (IKDataSourceElement *)WeakRetained;
}

- (void)setItemElements:(id)a3
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
  objc_storeStrong((id *)&self->_itemElements, 0);
  objc_destroyWeak((id *)&self->_dataSourceElement);
}

@end