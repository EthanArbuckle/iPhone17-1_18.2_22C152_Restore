@interface EDThreadPositionChangeSet
@end

@implementation EDThreadPositionChangeSet

id __41___EDThreadPositionChangeSet_description__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [MEMORY[0x1E4F1CA98] null];

  if (v3 == v2)
  {
    v5 = [v2 description];
  }
  else
  {
    v4 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v2, "conversationID"));
    v5 = [v4 stringValue];
  }

  return v5;
}

id __41___EDThreadPositionChangeSet_description__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"["];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    char v8 = 1;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        if ((v8 & 1) == 0) {
          [v4 appendString:@", ", (void)v12];
        }
        v10 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        [v4 appendString:v10];

        char v8 = 0;
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      char v8 = 0;
    }
    while (v6);
  }

  [v4 appendString:@"]"];

  return v4;
}

void __41___EDThreadPositionChangeSet_description__block_invoke_3(void *a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  id v6 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v7 = (*(void (**)(void))(a1[4] + 16))();
  char v8 = (*(void (**)(void))(a1[5] + 16))();
  v9 = (void *)[v6 initWithFormat:@"\t%@ -> %@", v7, v8];

  uint64_t v10 = *(void *)(a1[6] + 8);
  long long v13 = *(void **)(v10 + 40);
  long long v12 = (id *)(v10 + 40);
  v11 = v13;
  if (v13) {
    [v11 appendFormat:@"\n%@", v9];
  }
  else {
    objc_storeStrong(v12, v9);
  }
}

void __41___EDThreadPositionChangeSet_description__block_invoke_4(void *a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  id v6 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v7 = (*(void (**)(void))(a1[4] + 16))();
  char v8 = (*(void (**)(void))(a1[5] + 16))();
  v9 = (void *)[v6 initWithFormat:@"\t%@ -> %@", v7, v8];

  uint64_t v10 = *(void *)(a1[6] + 8);
  long long v13 = *(void **)(v10 + 40);
  long long v12 = (id *)(v10 + 40);
  v11 = v13;
  if (v13) {
    [v11 appendFormat:@"\n%@", v9];
  }
  else {
    objc_storeStrong(v12, v9);
  }
}

void __54___EDThreadPositionChangeSet_addObjectIDToAdd_before___block_invoke(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 containsObject:a1[4]])
  {
    v8[0] = a1[5];
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    objc_msgSend(v6, "ef_insertObjects:before:", v7, a1[4]);

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
    *a4 = 1;
  }
}

void __55___EDThreadPositionChangeSet_addObjectIDToMove_before___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v9 = a2;
  id v8 = a3;
  if ([v8 containsObject:*(void *)(a1 + 32)])
  {
    [v8 removeObject:*(void *)(a1 + 32)];
    if (![v8 count]) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    }
    *a4 = 1;
  }
}

void __55___EDThreadPositionChangeSet_addObjectIDToMove_before___block_invoke_2(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 containsObject:a1[4]])
  {
    v8[0] = a1[5];
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    objc_msgSend(v6, "ef_insertObjects:before:", v7, a1[4]);

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
    *a4 = 1;
  }
}

uint64_t __47___EDThreadPositionChangeSet_isAddingObjectID___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 containsObject:*(void *)(a1 + 32)];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t __48___EDThreadPositionChangeSet__isMovingObjectID___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 containsObject:*(void *)(a1 + 32)];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

@end