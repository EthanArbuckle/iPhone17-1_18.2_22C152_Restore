@interface IKDiffEvaluator
- (IKDiffEvaluator)initWithObjects:(id)a3 oldObjects:(id)a4 hashing:(id)a5;
- (NSArray)objects;
- (NSArray)oldObjects;
- (NSDictionary)movedIndexesByNewIndex;
- (NSDictionary)oldIndexesByNewIndex;
- (NSIndexSet)addedIndexes;
- (NSIndexSet)removedIndexes;
- (void)_evaluateWithHashing:(id)a3;
- (void)enumerateCommonObjectsUsingBlock:(id)a3;
@end

@implementation IKDiffEvaluator

- (IKDiffEvaluator)initWithObjects:(id)a3 oldObjects:(id)a4 hashing:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)IKDiffEvaluator;
  v11 = [(IKDiffEvaluator *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    objects = v11->_objects;
    v11->_objects = (NSArray *)v12;

    uint64_t v14 = [v9 copy];
    oldObjects = v11->_oldObjects;
    v11->_oldObjects = (NSArray *)v14;

    [(IKDiffEvaluator *)v11 _evaluateWithHashing:v10];
  }

  return v11;
}

- (void)enumerateCommonObjectsUsingBlock:(id)a3
{
  id v4 = a3;
  oldIndexesByNewIndex = self->_oldIndexesByNewIndex;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__IKDiffEvaluator_enumerateCommonObjectsUsingBlock___block_invoke;
  v7[3] = &unk_1E6DE59F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSDictionary *)oldIndexesByNewIndex enumerateKeysAndObjectsUsingBlock:v7];
}

void __52__IKDiffEvaluator_enumerateCommonObjectsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = a3;
  id v9 = a2;
  uint64_t v10 = [v9 integerValue];
  v11 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v12 = [v9 integerValue];

  id v17 = [v11 objectAtIndexedSubscript:v12];
  uint64_t v13 = [v8 integerValue];
  uint64_t v14 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v15 = [v8 integerValue];

  v16 = [v14 objectAtIndexedSubscript:v15];
  (*(void (**)(uint64_t, uint64_t, id, uint64_t, void *, uint64_t))(v7 + 16))(v7, v10, v17, v13, v16, a4);
}

- (void)_evaluateWithHashing:(id)a3
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v87[0] = MEMORY[0x1E4F143A8];
  v87[1] = 3221225472;
  v87[2] = __40__IKDiffEvaluator__evaluateWithHashing___block_invoke;
  v87[3] = &unk_1E6DE5A48;
  id v70 = v4;
  id v88 = v70;
  uint64_t v5 = MEMORY[0x1E4E65800](v87);
  id v6 = (*(void (**)(uint64_t, NSArray *))(v5 + 16))(v5, self->_oldObjects);
  v68 = self;
  v69 = (void *)v5;
  uint64_t v7 = (*(void (**)(uint64_t, NSArray *))(v5 + 16))(v5, self->_objects);
  id v8 = __40__IKDiffEvaluator__evaluateWithHashing___block_invoke_3((uint64_t)v7, v6);
  id v9 = __40__IKDiffEvaluator__evaluateWithHashing___block_invoke_3((uint64_t)v8, v7);
  uint64_t v10 = [v7 count];
  v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  uint64_t v12 = [MEMORY[0x1E4F28E60] indexSet];
  v83[0] = MEMORY[0x1E4F143A8];
  v83[1] = 3221225472;
  v83[2] = __40__IKDiffEvaluator__evaluateWithHashing___block_invoke_5;
  v83[3] = &unk_1E6DE5A98;
  id v13 = v9;
  id v84 = v13;
  id v14 = v12;
  id v85 = v14;
  id v66 = v11;
  id v86 = v66;
  [v6 enumerateObjectsUsingBlock:v83];
  v67 = v14;
  [v6 removeObjectsAtIndexes:v14];
  uint64_t v15 = [MEMORY[0x1E4F28E60] indexSet];
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __40__IKDiffEvaluator__evaluateWithHashing___block_invoke_6;
  v80[3] = &unk_1E6DE5AC0;
  id v16 = v8;
  id v81 = v16;
  id v17 = v15;
  id v82 = v17;
  [v7 enumerateObjectsUsingBlock:v80];
  v75 = v7;
  v18 = [v7 objectsAtIndexes:v17];
  v65 = v17;
  [v6 insertObjects:v18 atIndexes:v17];

  v74 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v10];
  uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v10];
  v73 = (void *)v19;
  if (v10 >= 1)
  {
    v20 = (void *)v19;
    for (uint64_t i = 0; i != v10; ++i)
    {
      v22 = [v6 objectAtIndexedSubscript:i];
      v23 = [v75 objectAtIndexedSubscript:i];
      if (([v22 isEqualToString:v23] & 1) == 0)
      {
        v24 = [v20 objectForKeyedSubscript:v22];

        if (v24)
        {
          v25 = [v20 objectForKeyedSubscript:v22];
          uint64_t v26 = [v25 integerValue];

          uint64_t v27 = i - v26;
          v20 = v73;
          v28 = [NSNumber numberWithInteger:v27];
          v29 = v74;
        }
        else
        {
          v28 = [NSNumber numberWithInteger:i];
          v29 = v20;
        }
        [v29 setObject:v28 forKeyedSubscript:v22];

        v30 = [v20 objectForKeyedSubscript:v23];

        if (v30)
        {
          v31 = [v20 objectForKeyedSubscript:v23];
          uint64_t v32 = [v31 integerValue];

          uint64_t v33 = i - v32;
          v20 = v73;
          v34 = [NSNumber numberWithInteger:v33];
          v35 = v74;
        }
        else
        {
          v34 = [NSNumber numberWithInteger:i];
          v35 = v20;
        }
        [v35 setObject:v34 forKeyedSubscript:v23];
      }
    }
  }
  uint64_t v36 = [MEMORY[0x1E4F1CA80] setWithCapacity:v10];
  v37 = (void *)v36;
  v72 = v6;
  v38 = v75;
  if (v10 >= 1)
  {
    unint64_t v39 = 0;
    unint64_t v40 = 0;
    v71 = (void *)v36;
    while (1)
    {
      if (v39 >= [v6 count])
      {
        v41 = 0;
      }
      else
      {
        v41 = [v6 objectAtIndexedSubscript:v39];
      }
      if (v40 >= [v38 count])
      {
        v42 = 0;
      }
      else
      {
        v42 = [v38 objectAtIndexedSubscript:v40];
      }
      if ([v41 isEqualToString:v42]) {
        break;
      }
      if (![v37 containsObject:v41])
      {
        if (![v37 containsObject:v42])
        {
          v43 = [v74 objectForKeyedSubscript:v41];
          uint64_t v44 = [v43 integerValue];

          v45 = [v74 objectForKeyedSubscript:v42];
          uint64_t v46 = [v45 integerValue];

          if (v44 <= v46)
          {
            v37 = v71;
            [v71 addObject:v42];
            ++v40;
          }
          else
          {
            v37 = v71;
            [v71 addObject:v41];
            ++v39;
          }
          id v6 = v72;
          v38 = v75;
          goto LABEL_30;
        }
        goto LABEL_22;
      }
      ++v39;
LABEL_30:

      if ((uint64_t)v39 >= v10 && (uint64_t)v40 >= v10) {
        goto LABEL_32;
      }
    }
    ++v39;
LABEL_22:
    ++v40;
    goto LABEL_30;
  }
LABEL_32:
  v47 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v37, "count"));
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v48 = v37;
  uint64_t v49 = [v48 countByEnumeratingWithState:&v76 objects:v89 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = *(void *)v77;
    do
    {
      for (uint64_t j = 0; j != v50; ++j)
      {
        if (*(void *)v77 != v51) {
          objc_enumerationMutation(v48);
        }
        uint64_t v53 = *(void *)(*((void *)&v76 + 1) + 8 * j);
        v54 = [v16 objectForKeyedSubscript:v53];
        v55 = [v13 objectForKeyedSubscript:v53];
        [v47 setObject:v54 forKeyedSubscript:v55];
      }
      uint64_t v50 = [v48 countByEnumeratingWithState:&v76 objects:v89 count:16];
    }
    while (v50);
  }

  if ([v67 count])
  {
    uint64_t v56 = [v67 copy];
    v57 = v68;
    removedIndexes = v68->_removedIndexes;
    v68->_removedIndexes = (NSIndexSet *)v56;
  }
  else
  {
    v57 = v68;
    removedIndexes = v68->_removedIndexes;
    v68->_removedIndexes = 0;
  }

  if ([v65 count])
  {
    uint64_t v59 = [v65 copy];
    addedIndexes = v57->_addedIndexes;
    v57->_addedIndexes = (NSIndexSet *)v59;
  }
  else
  {
    addedIndexes = v57->_addedIndexes;
    v57->_addedIndexes = 0;
  }

  if ([v47 count])
  {
    uint64_t v61 = [v47 copy];
    movedIndexesByNewIndex = v57->_movedIndexesByNewIndex;
    v57->_movedIndexesByNewIndex = (NSDictionary *)v61;
  }
  else
  {
    movedIndexesByNewIndex = v57->_movedIndexesByNewIndex;
    v57->_movedIndexesByNewIndex = 0;
  }

  if ([v66 count])
  {
    uint64_t v63 = [v66 copy];
    oldIndexesByNewIndex = v57->_oldIndexesByNewIndex;
    v57->_oldIndexesByNewIndex = (NSDictionary *)v63;
  }
  else
  {
    oldIndexesByNewIndex = v57->_oldIndexesByNewIndex;
    v57->_oldIndexesByNewIndex = 0;
  }
}

id __40__IKDiffEvaluator__evaluateWithHashing___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a2;
  uint64_t v5 = [v3 dictionary];
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __40__IKDiffEvaluator__evaluateWithHashing___block_invoke_2;
  v12[3] = &unk_1E6DE5A20;
  id v15 = *(id *)(a1 + 32);
  id v13 = v5;
  id v7 = v6;
  id v14 = v7;
  id v8 = v5;
  [v4 enumerateObjectsUsingBlock:v12];

  id v9 = v14;
  id v10 = v7;

  return v10;
}

void __40__IKDiffEvaluator__evaluateWithHashing___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
  uint64_t v3 = [v2 integerValue];

  uint64_t v4 = v3 + 1;
  uint64_t v5 = [NSNumber numberWithInteger:v3 + 1];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v8];

  id v6 = *(void **)(a1 + 40);
  id v7 = objc_msgSend(v8, "stringByAppendingFormat:", @"_%ld", v4);
  [v6 addObject:v7];
}

id __40__IKDiffEvaluator__evaluateWithHashing___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F1CA60];
  id v3 = a2;
  uint64_t v4 = objc_msgSend(v2, "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__IKDiffEvaluator__evaluateWithHashing___block_invoke_4;
  v8[3] = &unk_1E6DE5A70;
  id v9 = v4;
  id v5 = v4;
  [v3 enumerateObjectsUsingBlock:v8];

  id v6 = (void *)[v5 copy];
  return v6;
}

void __40__IKDiffEvaluator__evaluateWithHashing___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = NSNumber;
  id v6 = a2;
  id v7 = [v5 numberWithUnsignedInteger:a3];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

void __40__IKDiffEvaluator__evaluateWithHashing___block_invoke_5(id *a1, uint64_t a2, uint64_t a3)
{
  id v6 = [a1[4] objectForKeyedSubscript:a2];
  if (v6)
  {
    id v5 = [NSNumber numberWithUnsignedInteger:a3];
    [a1[6] setObject:v5 forKeyedSubscript:v6];
  }
  else
  {
    [a1[5] addIndex:a3];
  }
}

void __40__IKDiffEvaluator__evaluateWithHashing___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];

  if (!v5)
  {
    id v6 = *(void **)(a1 + 40);
    [v6 addIndex:a3];
  }
}

- (NSArray)objects
{
  return self->_objects;
}

- (NSArray)oldObjects
{
  return self->_oldObjects;
}

- (NSIndexSet)addedIndexes
{
  return self->_addedIndexes;
}

- (NSIndexSet)removedIndexes
{
  return self->_removedIndexes;
}

- (NSDictionary)movedIndexesByNewIndex
{
  return self->_movedIndexesByNewIndex;
}

- (NSDictionary)oldIndexesByNewIndex
{
  return self->_oldIndexesByNewIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldIndexesByNewIndex, 0);
  objc_storeStrong((id *)&self->_movedIndexesByNewIndex, 0);
  objc_storeStrong((id *)&self->_removedIndexes, 0);
  objc_storeStrong((id *)&self->_addedIndexes, 0);
  objc_storeStrong((id *)&self->_oldObjects, 0);
  objc_storeStrong((id *)&self->_objects, 0);
}

@end