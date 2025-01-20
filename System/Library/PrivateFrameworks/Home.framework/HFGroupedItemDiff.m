@interface HFGroupedItemDiff
+ (id)diffFromGroups:(id)a3 toGroups:(id)a4;
+ (id)diffFromGroups:(id)a3 toGroups:(id)a4 changeTest:(id)a5;
- (HFGroupedItemDiff)initWithFromGroups:(id)a3 toGroups:(id)a4 changeTest:(id)a5;
- (NSArray)allOperations;
- (NSArray)fromGroups;
- (NSArray)groupOperations;
- (NSArray)itemOperations;
- (NSArray)toGroups;
- (NSString)operationDescription;
- (id)_briefDescriptionForOperations:(id)a3 type:(id)a4;
- (id)_operationDescriptionWithPrefix:(id)a3;
- (id)_performItemDiffFromGroup:(id)a3 atIndex:(id)a4 toGroup:(id)a5 atIndex:(unint64_t)a6;
- (id)changeTest;
- (id)debugDescription;
- (id)description;
- (void)_performDiff;
- (void)setChangeTest:(id)a3;
- (void)setFromGroups:(id)a3;
- (void)setGroupOperations:(id)a3;
- (void)setItemOperations:(id)a3;
- (void)setToGroups:(id)a3;
@end

@implementation HFGroupedItemDiff

void __33__HFGroupedItemDiff__performDiff__block_invoke_7(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = *(void **)(a1 + 32);
  id v13 = v5;
  v7 = [v5 groupIdentifier];
  v8 = [v6 objectForKeyedSubscript:v7];

  if (v8)
  {
    v9 = [*(id *)(a1 + 40) fromGroups];
    v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v8, "unsignedIntegerValue"));
  }
  else
  {
    v10 = 0;
  }
  v11 = *(void **)(a1 + 48);
  v12 = [*(id *)(a1 + 40) _performItemDiffFromGroup:v10 atIndex:v8 toGroup:v13 atIndex:a3];
  [v11 addObjectsFromArray:v12];
}

void __33__HFGroupedItemDiff__performDiff__block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = NSNumber;
  id v6 = a2;
  id v9 = [v5 numberWithUnsignedInteger:a3];
  v7 = *(void **)(a1 + 32);
  v8 = [v6 groupIdentifier];

  [v7 setObject:v9 forKeyedSubscript:v8];
}

uint64_t __33__HFGroupedItemDiff__performDiff__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 groupIdentifier];
  id v6 = [v4 groupIdentifier];

  uint64_t v7 = [v5 isEqualToString:v6];
  return v7;
}

uint64_t __33__HFGroupedItemDiff__performDiff__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 groupIdentifier];
  uint64_t v3 = [v2 hash];

  return v3;
}

- (id)_performItemDiffFromGroup:(id)a3 atIndex:(id)a4 toGroup:(id)a5 atIndex:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v12) {
    NSLog(&cfstr_CannotPerformA.isa, v10);
  }
  uint64_t v13 = [v10 diffableItems];
  v14 = (void *)v13;
  v15 = (void *)MEMORY[0x263EFFA68];
  if (v13) {
    v16 = (void *)v13;
  }
  else {
    v16 = (void *)MEMORY[0x263EFFA68];
  }
  id v17 = v16;

  uint64_t v18 = [v12 diffableItems];
  v19 = (void *)v18;
  if (v18) {
    v20 = (void *)v18;
  }
  else {
    v20 = v15;
  }
  id v21 = v20;

  v22 = objc_alloc_init(HFUniqueArrayDiffOptions);
  v23 = [(HFGroupedItemDiff *)self changeTest];
  [(HFUniqueArrayDiffOptions *)v22 setChangeComparator:v23];

  v24 = +[HFUniqueArrayDiff diffFromArray:v17 toArray:v21 options:v22];
  v25 = v24;
  if (!v10)
  {
    v26 = [v24 insertedIndexes];
    id v27 = v12;
    unint64_t v28 = a6;
    uint64_t v29 = [v26 count];
    uint64_t v30 = [v25 numberOfOperations];

    BOOL v31 = v29 == v30;
    a6 = v28;
    id v12 = v27;
    id v10 = 0;
    if (!v31) {
      NSLog(&cfstr_FoundNonInsert.isa, v12, v25);
    }
  }
  v32 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v25, "numberOfOperations"));
  v60[0] = MEMORY[0x263EF8330];
  v60[1] = 3221225472;
  v60[2] = __71__HFGroupedItemDiff__performItemDiffFromGroup_atIndex_toGroup_atIndex___block_invoke;
  v60[3] = &unk_2640949F0;
  id v33 = v11;
  id v61 = v33;
  id v34 = v32;
  id v62 = v34;
  id v35 = v17;
  id v63 = v35;
  [v25 enumerateChangesUsingBlock:v60];
  v56[0] = MEMORY[0x263EF8330];
  v56[1] = 3221225472;
  v56[2] = __71__HFGroupedItemDiff__performItemDiffFromGroup_atIndex_toGroup_atIndex___block_invoke_2;
  v56[3] = &unk_2640949F0;
  id v36 = v33;
  id v57 = v36;
  id v37 = v34;
  id v58 = v37;
  id v59 = v35;
  id v38 = v35;
  [v25 enumerateDeletesUsingBlock:v56];
  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v51[2] = __71__HFGroupedItemDiff__performItemDiffFromGroup_atIndex_toGroup_atIndex___block_invoke_3;
  v51[3] = &unk_264094A18;
  id v52 = v36;
  unint64_t v55 = a6;
  id v39 = v37;
  id v53 = v39;
  id v40 = v21;
  id v54 = v40;
  id v41 = v36;
  [v25 enumerateMovesUsingBlock:v51];
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __71__HFGroupedItemDiff__performItemDiffFromGroup_atIndex_toGroup_atIndex___block_invoke_4;
  v47[3] = &unk_264094A40;
  unint64_t v50 = a6;
  id v42 = v39;
  id v48 = v42;
  id v49 = v40;
  id v43 = v40;
  [v25 enumerateInsertsUsingBlock:v47];
  v44 = v49;
  id v45 = v42;

  return v45;
}

- (id)changeTest
{
  return self->_changeTest;
}

- (void)_performDiff
{
  uint64_t v3 = objc_alloc_init(HFUniqueArrayDiffOptions);
  [(HFUniqueArrayDiffOptions *)v3 setEqualComparator:&__block_literal_global_69_1];
  [(HFUniqueArrayDiffOptions *)v3 setHashGenerator:&__block_literal_global_72_1];
  [(HFUniqueArrayDiffOptions *)v3 setAllowMoves:0];
  id v4 = [(HFGroupedItemDiff *)self fromGroups];
  id v5 = [(HFGroupedItemDiff *)self toGroups];
  id v6 = +[HFUniqueArrayDiff diffFromArray:v4 toArray:v5 options:v3];

  uint64_t v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "numberOfOperations"));
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __33__HFGroupedItemDiff__performDiff__block_invoke_3;
  v35[3] = &unk_26408CC30;
  id v8 = v7;
  id v36 = v8;
  id v37 = self;
  [v6 enumerateDeletesUsingBlock:v35];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __33__HFGroupedItemDiff__performDiff__block_invoke_4;
  v32[3] = &unk_264094978;
  id v9 = v8;
  id v33 = v9;
  id v34 = self;
  [v6 enumerateMovesUsingBlock:v32];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __33__HFGroupedItemDiff__performDiff__block_invoke_5;
  v29[3] = &unk_26408CC30;
  id v30 = v9;
  BOOL v31 = self;
  id v10 = v9;
  [v6 enumerateInsertsUsingBlock:v29];
  id v11 = (void *)MEMORY[0x263EFF9A0];
  id v12 = [(HFGroupedItemDiff *)self fromGroups];
  uint64_t v13 = objc_msgSend(v11, "dictionaryWithCapacity:", objc_msgSend(v12, "count"));

  v14 = [(HFGroupedItemDiff *)self fromGroups];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __33__HFGroupedItemDiff__performDiff__block_invoke_6;
  v27[3] = &unk_2640949A0;
  id v15 = v13;
  id v28 = v15;
  [v14 enumerateObjectsUsingBlock:v27];

  v16 = [MEMORY[0x263EFF980] array];
  id v17 = [(HFGroupedItemDiff *)self toGroups];
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  v22 = __33__HFGroupedItemDiff__performDiff__block_invoke_7;
  v23 = &unk_2640949C8;
  id v24 = v15;
  v25 = self;
  id v26 = v16;
  id v18 = v16;
  id v19 = v15;
  [v17 enumerateObjectsUsingBlock:&v20];

  -[HFGroupedItemDiff setGroupOperations:](self, "setGroupOperations:", v10, v20, v21, v22, v23);
  [(HFGroupedItemDiff *)self setItemOperations:v18];
}

- (NSArray)fromGroups
{
  return self->_fromGroups;
}

- (NSArray)toGroups
{
  return self->_toGroups;
}

- (void)setItemOperations:(id)a3
{
}

- (void)setGroupOperations:(id)a3
{
}

+ (id)diffFromGroups:(id)a3 toGroups:(id)a4 changeTest:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[HFGroupedItemDiff alloc] initWithFromGroups:v9 toGroups:v8 changeTest:v7];

  return v10;
}

- (HFGroupedItemDiff)initWithFromGroups:(id)a3 toGroups:(id)a4 changeTest:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HFGroupedItemDiff;
  id v11 = [(HFGroupedItemDiff *)&v14 init];
  id v12 = v11;
  if (v11)
  {
    [(HFGroupedItemDiff *)v11 setFromGroups:v8];
    [(HFGroupedItemDiff *)v12 setToGroups:v9];
    [(HFGroupedItemDiff *)v12 setChangeTest:v10];
    [(HFGroupedItemDiff *)v12 _performDiff];
  }

  return v12;
}

- (void)setToGroups:(id)a3
{
}

- (void)setFromGroups:(id)a3
{
}

- (void)setChangeTest:(id)a3
{
}

- (NSArray)allOperations
{
  uint64_t v3 = [(HFGroupedItemDiff *)self groupOperations];
  id v4 = [(HFGroupedItemDiff *)self itemOperations];
  id v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return (NSArray *)v5;
}

- (NSArray)itemOperations
{
  return self->_itemOperations;
}

- (NSArray)groupOperations
{
  return self->_groupOperations;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeTest, 0);
  objc_storeStrong((id *)&self->_toGroups, 0);
  objc_storeStrong((id *)&self->_fromGroups, 0);
  objc_storeStrong((id *)&self->_itemOperations, 0);
  objc_storeStrong((id *)&self->_groupOperations, 0);
}

void __71__HFGroupedItemDiff__performItemDiffFromGroup_atIndex_toGroup_atIndex___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v7 = [MEMORY[0x263F088C8] indexPathForItem:a2 inSection:*(void *)(a1 + 48)];
  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  id v6 = +[HFItemDiffOperation insertOperationWithItem:v5 atIndexPath:v7];
  [v4 addObject:v6];
}

void __71__HFGroupedItemDiff__performItemDiffFromGroup_atIndex_toGroup_atIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", a2, objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = *(void **)(a1 + 40);
  id v5 = [*(id *)(a1 + 48) objectAtIndexedSubscript:a2];
  id v6 = +[HFItemDiffOperation reloadOperationWithItem:v5 atIndexPath:v7];
  [v4 addObject:v6];
}

+ (id)diffFromGroups:(id)a3 toGroups:(id)a4
{
  return (id)[a1 diffFromGroups:a3 toGroups:a4 changeTest:&__block_literal_global_97];
}

uint64_t __45__HFGroupedItemDiff_diffFromGroups_toGroups___block_invoke()
{
  return 0;
}

void __33__HFGroupedItemDiff__performDiff__block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) fromGroups];
  id v4 = [v6 objectAtIndexedSubscript:a2];
  id v5 = +[HFGroupDiffOperation deleteOperationWithGroup:v4 atIndex:a2];
  [v3 addObject:v5];
}

void __33__HFGroupedItemDiff__performDiff__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) toGroups];
  id v6 = [v8 objectAtIndexedSubscript:a3];
  id v7 = +[HFGroupDiffOperation moveOperationWithGroup:v6 fromIndex:a2 toIndex:a3];
  [v5 addObject:v7];
}

void __33__HFGroupedItemDiff__performDiff__block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) toGroups];
  id v4 = [v6 objectAtIndexedSubscript:a2];
  id v5 = +[HFGroupDiffOperation insertOperationWithGroup:v4 atIndex:a2];
  [v3 addObject:v5];
}

void __71__HFGroupedItemDiff__performItemDiffFromGroup_atIndex_toGroup_atIndex___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", a2, objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = *(void **)(a1 + 40);
  id v5 = [*(id *)(a1 + 48) objectAtIndexedSubscript:a2];
  id v6 = +[HFItemDiffOperation deleteOperationWithItem:v5 atIndexPath:v7];
  [v4 addObject:v6];
}

void __71__HFGroupedItemDiff__performItemDiffFromGroup_atIndex_toGroup_atIndex___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", a2, objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue"));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [MEMORY[0x263F088C8] indexPathForItem:a3 inSection:*(void *)(a1 + 56)];
  id v6 = *(void **)(a1 + 40);
  id v7 = [*(id *)(a1 + 48) objectAtIndexedSubscript:a3];
  id v8 = +[HFItemDiffOperation moveOperationWithItem:v7 fromIndexPath:v9 toIndexPath:v5];
  [v6 addObject:v8];
}

- (id)_briefDescriptionForOperations:(id)a3 type:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = v5;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v7);
        }
        switch([*(id *)(*((void *)&v26 + 1) + 8 * i) type])
        {
          case 0:
            ++v8;
            break;
          case 1:
            ++v11;
            break;
          case 2:
            ++v10;
            break;
          case 3:
            ++v9;
            break;
          default:
            continue;
        }
      }
      uint64_t v12 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v12);
  }

  id v15 = [MEMORY[0x263F089D8] string];
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__HFGroupedItemDiff__briefDescriptionForOperations_type___block_invoke;
  aBlock[3] = &unk_264094A68;
  id v16 = v15;
  id v22 = v16;
  id v24 = v25;
  id v17 = v6;
  id v23 = v17;
  id v18 = (void (**)(void *, void, __CFString *))_Block_copy(aBlock);
  v18[2](v18, v11, @"inserted");
  v18[2](v18, v10, @"deleted");
  v18[2](v18, v9, @"moved");
  v18[2](v18, v8, @"reloaded");
  id v19 = v16;

  _Block_object_dispose(v25, 8);
  return v19;
}

void __57__HFGroupedItemDiff__briefDescriptionForOperations_type___block_invoke(void *a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    id v5 = (void *)a1[4];
    if (*(void *)(*(void *)(a1[6] + 8) + 24)) {
      id v6 = @" ";
    }
    else {
      id v6 = &stru_26C081158;
    }
    id v7 = NSNumber;
    id v8 = a3;
    uint64_t v9 = [v7 numberWithUnsignedInteger:a2];
    [v5 appendFormat:@"%@%@ %@ %@", v6, v9, a1[5], v8];

    ++*(void *)(*(void *)(a1[6] + 8) + 24);
  }
}

- (id)description
{
  v11[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HFGroupedItemDiff *)self groupOperations];
  id v4 = [(HFGroupedItemDiff *)self _briefDescriptionForOperations:v3 type:@"groups"];
  v11[0] = v4;
  id v5 = [(HFGroupedItemDiff *)self itemOperations];
  id v6 = [(HFGroupedItemDiff *)self _briefDescriptionForOperations:v5 type:@"items"];
  v11[1] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];

  if ([v7 count])
  {
    id v8 = [v7 componentsJoinedByString:@" "];
  }
  else
  {
    id v8 = @"(no changes)";
  }
  uint64_t v9 = [NSString stringWithFormat:@"<%@:%p %@>", objc_opt_class(), self, v8];

  return v9;
}

- (id)debugDescription
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(HFGroupedItemDiff *)self _operationDescriptionWithPrefix:@"    "];
  id v6 = [v3 stringWithFormat:@"<%@:%p> operations: (\n%@\n)", v4, self, v5];

  return v6;
}

- (NSString)operationDescription
{
  return (NSString *)[(HFGroupedItemDiff *)self _operationDescriptionWithPrefix:&stru_26C081158];
}

- (id)_operationDescriptionWithPrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(HFGroupedItemDiff *)self allOperations];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__HFGroupedItemDiff__operationDescriptionWithPrefix___block_invoke;
  v10[3] = &unk_264094A90;
  id v11 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "na_map:", v10);
  id v8 = [v7 componentsJoinedByString:@",\n"];

  return v8;
}

id __53__HFGroupedItemDiff__operationDescriptionWithPrefix___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 operationDescription];
  id v4 = [v2 stringByAppendingString:v3];

  return v4;
}

@end