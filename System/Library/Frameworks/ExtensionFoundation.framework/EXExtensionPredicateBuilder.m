@interface EXExtensionPredicateBuilder
@end

@implementation EXExtensionPredicateBuilder

void __136___EXExtensionPredicateBuilder_gatherChildrenPredicateWithRuleDictionary_parentType_parentAccepted_acceptedChildTypes_exceptChildTypes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (([v5 isEqualToString:@"ACCEPT"] & 1) == 0
    && ([v5 isEqualToString:@"REJECT"] & 1) == 0
    && ([v5 isEqualToString:@"TYPE"] & 1) == 0
    && ([v5 isEqualToString:@"TYPES"] & 1) == 0
    && ([v5 isEqualToString:@"EXCEPT_TYPES"] & 1) == 0)
  {
    int v7 = _NSIsNSDictionary();
    id v8 = v5;
    if (v7)
    {
      uint64_t v9 = [v6 objectForKey:@"ACCEPT"];
      v10 = [v6 objectForKey:@"REJECT"];
      v11 = [v6 objectForKey:@"TYPES"];
      if (!v11)
      {
        v12 = [v6 objectForKey:@"TYPE"];
        if (v12)
        {
          v11 = [MEMORY[0x1E4F1C978] arrayWithObject:v12];
        }
        else
        {
          v11 = 0;
        }
      }
      v13 = [v6 objectForKey:@"EXCEPT_TYPES"];
      v14 = v6;
    }
    else
    {
      v10 = 0;
      v11 = 0;
      v13 = 0;
      v14 = 0;
      uint64_t v9 = (uint64_t)v6;
    }
    id v15 = v6;
    char v38 = 0;
    v16 = *(void **)(a1 + 32);
    uint64_t v17 = *(void *)(a1 + 40);
    char v18 = *(unsigned char *)(a1 + 72);
    id v36 = 0;
    id v37 = 0;
    v34 = (void *)v9;
    LOBYTE(v33) = v18;
    v35 = v8;
    v19 = [v16 applyRuleWithRuleName:v8 acceptRule:v9 rejectRule:v10 types:v11 exceptTypes:v13 parentType:v17 children:v14 parentAccepted:v33 accepted:&v38 acceptedTypesInSubtree:&v37 exceptTypesInSubtree:&v36];
    id v20 = v37;
    id v21 = v36;
    if (v19)
    {
      v22 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      if (!v22)
      {
        id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8);
        v25 = *(void **)(v24 + 40);
        *(void *)(v24 + 40) = v23;

        v22 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      }
      [v22 addObject:v19];
    }
    if (v38 && [v11 count] || objc_msgSend(v20, "count"))
    {
      if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
      {
        id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v27 = *(void *)(*(void *)(a1 + 56) + 8);
        v28 = *(void **)(v27 + 40);
        *(void *)(v27 + 40) = v26;
      }
      if (v38 && [v11 count]) {
        [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObjectsFromArray:v11];
      }
      if ([v20 count]) {
        [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObjectsFromArray:v20];
      }
    }
    if (v38 && [v13 count] || objc_msgSend(v21, "count"))
    {
      if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
      {
        id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v30 = *(void *)(*(void *)(a1 + 64) + 8);
        v31 = *(void **)(v30 + 40);
        *(void *)(v30 + 40) = v29;
      }
      if (v38 && [v13 count]) {
        [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObjectsFromArray:v13];
      }
      if ([v21 count])
      {
        v32 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        [v32 addObjectsFromArray:v32];
      }
    }
  }
}

@end