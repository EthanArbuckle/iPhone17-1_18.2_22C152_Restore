@interface HFUniqueArrayDiff
+ (id)_createContainerSetFromArray:(id)a3 options:(id)a4;
+ (id)diffFromArray:(id)a3 toArray:(id)a4 options:(id)a5;
- (NSArray)fromArray;
- (NSArray)toArray;
- (NSIndexSet)changedIndexes;
- (NSIndexSet)deletedIndexes;
- (NSIndexSet)insertedIndexes;
- (NSSet)movedIndexes;
- (unint64_t)numberOfOperations;
- (void)enumerateChangesUsingBlock:(id)a3;
- (void)enumerateDeletesUsingBlock:(id)a3;
- (void)enumerateInsertsUsingBlock:(id)a3;
- (void)enumerateMovesUsingBlock:(id)a3;
- (void)setChangedIndexes:(id)a3;
- (void)setDeletedIndexes:(id)a3;
- (void)setFromArray:(id)a3;
- (void)setInsertedIndexes:(id)a3;
- (void)setMovedIndexes:(id)a3;
- (void)setToArray:(id)a3;
@end

@implementation HFUniqueArrayDiff

+ (id)diffFromArray:(id)a3 toArray:(id)a4 options:(id)a5
{
  uint64_t v130 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init((Class)a1);
  [v11 setFromArray:v8];
  [v11 setToArray:v9];
  if (![v8 count])
  {
    v77 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, objc_msgSend(v9, "count"));
    [v11 setInsertedIndexes:v77];
LABEL_68:

    goto LABEL_71;
  }
  if (![v9 count])
  {
    v77 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, objc_msgSend(v8, "count"));
    [v11 setDeletedIndexes:v77];
    goto LABEL_68;
  }
  v82 = v11;
  id v83 = v8;
  v12 = [a1 _createContainerSetFromArray:v8 options:v10];
  id v81 = v9;
  v86 = v10;
  v13 = [a1 _createContainerSetFromArray:v9 options:v10];
  v14 = [MEMORY[0x263EFF9C0] set];
  v15 = [MEMORY[0x263EFF9C0] set];
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  id v16 = v12;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v119 objects:v129 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v120;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v120 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v119 + 1) + 8 * i);
        if ([v13 containsObject:v21]) {
          v22 = v15;
        }
        else {
          v22 = v14;
        }
        [v22 addObject:v21];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v119 objects:v129 count:16];
    }
    while (v18);
  }

  v23 = [MEMORY[0x263F089C8] indexSet];
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  obuint64_t j = v14;
  uint64_t v24 = [obj countByEnumeratingWithState:&v115 objects:v128 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v116;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v116 != v26) {
          objc_enumerationMutation(obj);
        }
        objc_msgSend(v23, "addIndex:", objc_msgSend(*(id *)(*((void *)&v115 + 1) + 8 * j), "index"));
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v115 objects:v128 count:16];
    }
    while (v25);
  }
  v84 = v23;

  v28 = [MEMORY[0x263EFF9C0] set];
  v98 = [MEMORY[0x263EFF9C0] set];
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  id v90 = v13;
  uint64_t v29 = [v90 countByEnumeratingWithState:&v111 objects:v127 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v112;
    do
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v112 != v31) {
          objc_enumerationMutation(v90);
        }
        uint64_t v33 = *(void *)(*((void *)&v111 + 1) + 8 * k);
        if ([v16 containsObject:v33]) {
          v34 = v98;
        }
        else {
          v34 = v28;
        }
        [v34 addObject:v33];
      }
      uint64_t v30 = [v90 countByEnumeratingWithState:&v111 objects:v127 count:16];
    }
    while (v30);
  }

  v95 = [MEMORY[0x263F089C8] indexSet];
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id v89 = v28;
  uint64_t v35 = [v89 countByEnumeratingWithState:&v107 objects:v126 count:16];
  v36 = v86;
  if (v35)
  {
    uint64_t v37 = v35;
    uint64_t v38 = *(void *)v108;
    do
    {
      for (uint64_t m = 0; m != v37; ++m)
      {
        if (*(void *)v108 != v38) {
          objc_enumerationMutation(v89);
        }
        objc_msgSend(v95, "addIndex:", objc_msgSend(*(id *)(*((void *)&v107 + 1) + 8 * m), "index"));
      }
      uint64_t v37 = [v89 countByEnumeratingWithState:&v107 objects:v126 count:16];
    }
    while (v37);
  }

  uint64_t v40 = [v15 count];
  if (v40 != [v98 count])
  {
    v41 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
    v42 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v98, "count"));
    NSLog(&cfstr_UnexpectedDisc.isa, v41, v42);
  }
  id v80 = v16;
  v93 = [MEMORY[0x263F089C8] indexSet];
  v85 = [MEMORY[0x263EFF9C0] set];
  v43 = (void *)[v84 mutableCopy];
  v97 = (void *)[v95 mutableCopy];
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id v88 = v15;
  uint64_t v44 = [v88 countByEnumeratingWithState:&v103 objects:v125 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v104;
    v92 = v43;
    do
    {
      for (uint64_t n = 0; n != v45; ++n)
      {
        if (*(void *)v104 != v46) {
          objc_enumerationMutation(v88);
        }
        v48 = *(void **)(*((void *)&v103 + 1) + 8 * n);
        v49 = [v98 member:v48];
        if (!v49)
        {
          v59 = [v48 object];
          NSLog(&cfstr_MissingObjectI.isa, v59);
          goto LABEL_51;
        }
        uint64_t v50 = [v36 changeComparator];
        if (v50)
        {
          v51 = (void *)v50;
          v52 = [v36 changeComparator];
          [v48 object];
          v54 = uint64_t v53 = v46;
          v55 = [v49 object];
          int v56 = ((uint64_t (**)(void, void *, void *))v52)[2](v52, v54, v55);

          uint64_t v46 = v53;
          v36 = v86;

          if (v56) {
            objc_msgSend(v93, "addIndex:", objc_msgSend(v48, "index"));
          }
        }
        uint64_t v57 = [v48 index];
        v43 = v92;
        if (v57 != [v49 index])
        {
          objc_msgSend(v92, "addIndex:", objc_msgSend(v48, "index"));
          objc_msgSend(v97, "addIndex:", objc_msgSend(v49, "index"));
          v58 = (void *)MEMORY[0x263F088C8];
          v124[0] = [v48 index];
          v124[1] = [v49 index];
          v59 = [v58 indexPathWithIndexes:v124 length:2];
          [v85 addObject:v59];
LABEL_51:
        }
      }
      uint64_t v45 = [v88 countByEnumeratingWithState:&v103 objects:v125 count:16];
    }
    while (v45);
  }

  v60 = [v85 allObjects];
  v61 = [v60 sortedArrayUsingComparator:&__block_literal_global_211];

  v62 = [MEMORY[0x263EFF9C0] set];
  v63 = (void *)[v84 mutableCopy];
  v64 = (void *)[v95 mutableCopy];
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id v65 = v61;
  v66 = v63;
  id v87 = v65;
  uint64_t v96 = [v65 countByEnumeratingWithState:&v99 objects:v123 count:16];
  if (v96)
  {
    uint64_t v94 = *(void *)v100;
    do
    {
      for (iuint64_t i = 0; ii != v96; ++ii)
      {
        if (*(void *)v100 != v94) {
          objc_enumerationMutation(v87);
        }
        v68 = *(void **)(*((void *)&v99 + 1) + 8 * ii);
        uint64_t v69 = [v68 indexAtPosition:0];
        uint64_t v70 = [v68 indexAtPosition:1];
        v71 = v43;
        uint64_t v72 = v69 - objc_msgSend(v43, "countOfIndexesInRange:", 0, v69);
        if (v72 == v70 - objc_msgSend(v97, "countOfIndexesInRange:", 0, v70))
        {
          [v71 removeIndex:v69];
          [v97 removeIndex:v70];
        }
        else
        {
          [v62 addObject:v68];
          [v63 addIndex:v69];
          [v64 addIndex:v70];
          [v93 removeIndex:v69];
        }
        v43 = v71;
      }
      uint64_t v96 = [v87 countByEnumeratingWithState:&v99 objects:v123 count:16];
    }
    while (v96);
  }

  id v11 = v82;
  if ([v86 allowMoves])
  {
    v73 = v84;
    [v82 setDeletedIndexes:v84];
    v74 = v64;
    v75 = v95;
    [v82 setInsertedIndexes:v95];
    [v82 setMovedIndexes:v62];
    v76 = v80;
  }
  else
  {
    [v82 setDeletedIndexes:v63];
    [v82 setInsertedIndexes:v64];
    v78 = [MEMORY[0x263EFFA08] set];
    [v82 setMovedIndexes:v78];

    v76 = v80;
    v73 = v84;
    v74 = v64;
    v75 = v95;
  }
  [v82 setChangedIndexes:v93];

  id v8 = v83;
  id v9 = v81;
  id v10 = v86;
LABEL_71:

  return v11;
}

void __58__HFUniqueArrayDiff__createContainerSetFromArray_options___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  id v7 = a2;
  id v10 = [v6 equalComparator];
  id v8 = [*(id *)(a1 + 40) hashGenerator];
  id v9 = +[_HFSetContainer containerWithObject:v7 atIndex:a3 comparator:v10 hashGenerator:v8];

  [v5 addObject:v9];
}

+ (id)_createContainerSetFromArray:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v5, "count"));
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __58__HFUniqueArrayDiff__createContainerSetFromArray_options___block_invoke;
  v14[3] = &unk_26409ADF8;
  id v8 = v7;
  id v15 = v8;
  id v16 = v6;
  id v9 = v6;
  [v5 enumerateObjectsUsingBlock:v14];
  uint64_t v10 = [v8 count];
  if (v10 != [v5 count]) {
    NSLog(&cfstr_DetectedAnAtte.isa, v5);
  }
  id v11 = v16;
  id v12 = v8;

  return v12;
}

- (void)setToArray:(id)a3
{
}

- (void)setInsertedIndexes:(id)a3
{
}

- (void)setFromArray:(id)a3
{
}

- (void)setMovedIndexes:(id)a3
{
}

- (void)setDeletedIndexes:(id)a3
{
}

- (void)setChangedIndexes:(id)a3
{
}

- (void)enumerateChangesUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(HFUniqueArrayDiff *)self changedIndexes];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__HFUniqueArrayDiff_enumerateChangesUsingBlock___block_invoke;
  v7[3] = &unk_26409AE20;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateIndexesUsingBlock:v7];
}

- (void)enumerateDeletesUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(HFUniqueArrayDiff *)self deletedIndexes];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__HFUniqueArrayDiff_enumerateDeletesUsingBlock___block_invoke;
  v7[3] = &unk_26409AE20;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateIndexesWithOptions:2 usingBlock:v7];
}

- (void)enumerateInsertsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(HFUniqueArrayDiff *)self insertedIndexes];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__HFUniqueArrayDiff_enumerateInsertsUsingBlock___block_invoke;
  v7[3] = &unk_26409AE20;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateIndexesUsingBlock:v7];
}

- (void)enumerateMovesUsingBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, uint64_t, uint64_t))a3;
  id v5 = [(HFUniqueArrayDiff *)self movedIndexes];
  id v6 = [v5 allObjects];
  id v7 = [v6 sortedArrayUsingComparator:&__block_literal_global_76_4];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        v4[2](v4, objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12), "indexAtPosition:", 0, (void)v13), objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12), "indexAtPosition:", 1));
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (unint64_t)numberOfOperations
{
  v3 = [(HFUniqueArrayDiff *)self deletedIndexes];
  uint64_t v4 = [v3 count];
  id v5 = [(HFUniqueArrayDiff *)self insertedIndexes];
  uint64_t v6 = [v5 count] + v4;
  id v7 = [(HFUniqueArrayDiff *)self movedIndexes];
  uint64_t v8 = [v7 count];
  uint64_t v9 = [(HFUniqueArrayDiff *)self changedIndexes];
  unint64_t v10 = v6 + v8 + [v9 count];

  return v10;
}

- (NSSet)movedIndexes
{
  movedIndexes = self->_movedIndexes;
  if (movedIndexes)
  {
    v3 = movedIndexes;
  }
  else
  {
    v3 = [MEMORY[0x263EFFA08] set];
  }
  return v3;
}

- (NSIndexSet)insertedIndexes
{
  insertedIndexes = self->_insertedIndexes;
  if (insertedIndexes)
  {
    v3 = insertedIndexes;
  }
  else
  {
    v3 = [MEMORY[0x263F088D0] indexSet];
  }
  return v3;
}

- (NSIndexSet)deletedIndexes
{
  deletedIndexes = self->_deletedIndexes;
  if (deletedIndexes)
  {
    v3 = deletedIndexes;
  }
  else
  {
    v3 = [MEMORY[0x263F088D0] indexSet];
  }
  return v3;
}

- (NSIndexSet)changedIndexes
{
  changedIndexes = self->_changedIndexes;
  if (changedIndexes)
  {
    v3 = changedIndexes;
  }
  else
  {
    v3 = [MEMORY[0x263F088D0] indexSet];
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movedIndexes, 0);
  objc_storeStrong((id *)&self->_changedIndexes, 0);
  objc_storeStrong((id *)&self->_insertedIndexes, 0);
  objc_storeStrong((id *)&self->_deletedIndexes, 0);
  objc_storeStrong((id *)&self->_toArray, 0);
  objc_storeStrong((id *)&self->_fromArray, 0);
}

uint64_t __48__HFUniqueArrayDiff_enumerateInsertsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __48__HFUniqueArrayDiff_enumerateChangesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __51__HFUniqueArrayDiff_diffFromArray_toArray_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  unint64_t v6 = [v5 indexAtPosition:0];
  unint64_t v7 = [v5 indexAtPosition:1];

  unint64_t v8 = [v4 indexAtPosition:0];
  unint64_t v9 = [v4 indexAtPosition:1];

  unint64_t v10 = v7 - v6;
  if (v6 > v7) {
    unint64_t v10 = v6 - v7;
  }
  unint64_t v11 = v9 - v8;
  if (v8 > v9) {
    unint64_t v11 = v8 - v9;
  }
  if (v6 < v8) {
    uint64_t v12 = -1;
  }
  else {
    uint64_t v12 = 1;
  }
  BOOL v13 = v10 == v11;
  if (v10 < v11) {
    uint64_t v14 = -1;
  }
  else {
    uint64_t v14 = 1;
  }
  if (v13) {
    return v12;
  }
  else {
    return v14;
  }
}

uint64_t __48__HFUniqueArrayDiff_enumerateDeletesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __46__HFUniqueArrayDiff_enumerateMovesUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (NSArray)fromArray
{
  return self->_fromArray;
}

- (NSArray)toArray
{
  return self->_toArray;
}

@end