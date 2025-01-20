@interface NSArray
@end

@implementation NSArray

void __98__NSArray_IntentsFoundation__if_enumerateAsynchronouslyInSequenceOnQueue_block_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 || **(unsigned char **)(a1 + 56))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __98__NSArray_IntentsFoundation__if_enumerateAsynchronouslyInSequenceOnQueue_block_completionHandler___block_invoke_5;
    block[3] = &unk_1E6CA0EB0;
    v4 = *(NSObject **)(a1 + 32);
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 64);
    id v12 = v5;
    uint64_t v14 = v6;
    id v7 = v3;
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    id v11 = v7;
    uint64_t v13 = v8;
    uint64_t v15 = v9;
    dispatch_async(v4, block);
  }
  else
  {
    (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16))();
  }
}

void __98__NSArray_IntentsFoundation__if_enumerateAsynchronouslyInSequenceOnQueue_block_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = [*(id *)(a1 + 32) nextObject];
  id v5 = *(NSObject **)(a1 + 40);
  if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __98__NSArray_IntentsFoundation__if_enumerateAsynchronouslyInSequenceOnQueue_block_completionHandler___block_invoke_3;
    block[3] = &unk_1E6CA0F00;
    uint64_t v6 = &v16;
    id v16 = *(id *)(a1 + 56);
    id v14 = v4;
    uint64_t v7 = *(void *)(a1 + 72);
    uint64_t v19 = a2;
    uint64_t v20 = v7;
    id v15 = *(id *)(a1 + 40);
    id v8 = *(id *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 64);
    id v17 = v8;
    uint64_t v18 = v9;
    dispatch_async(v5, block);
  }
  else
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __98__NSArray_IntentsFoundation__if_enumerateAsynchronouslyInSequenceOnQueue_block_completionHandler___block_invoke_2;
    v21[3] = &unk_1E6CA0E88;
    uint64_t v6 = (id *)v22;
    id v10 = *(id *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 64);
    uint64_t v12 = *(void *)(a1 + 72);
    v22[0] = v10;
    v22[1] = v11;
    v22[2] = a2;
    v22[3] = v12;
    dispatch_async(v5, v21);
  }
}

id __37__NSArray_IntentsFoundation__if_map___block_invoke(uint64_t a1)
{
  v1 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    id v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v4 = v3;

  return v4;
}

uint64_t __61__NSArray_IntentsFoundation__if_firstObjectWithValue_forKey___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 valueForKeyPath:*(void *)(a1 + 32)];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 40)];

  return v4;
}

uint64_t __48__NSArray_IntentsFoundation__if_objectsOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

void __98__NSArray_IntentsFoundation__if_enumerateAsynchronouslyInSequenceOnQueue_block_completionHandler___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, a1[6], 0);
  }
  uint64_t v3 = *(void *)(a1[5] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  id v5 = (void *)a1[7];
  free(v5);
}

void __98__NSArray_IntentsFoundation__if_enumerateAsynchronouslyInSequenceOnQueue_block_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __98__NSArray_IntentsFoundation__if_enumerateAsynchronouslyInSequenceOnQueue_block_completionHandler___block_invoke_4;
  v7[3] = &unk_1E6CA0ED8;
  uint64_t v3 = *(void *)(a1 + 72);
  uint64_t v11 = *(void *)(a1 + 80);
  uint64_t v4 = *(void *)(a1 + 48);
  id v8 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v12 = *(void *)(a1 + 72);
  id v9 = v5;
  uint64_t v10 = v6;
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *, void))(v4 + 16))(v4, v2, v3, v7, *(void *)(a1 + 80));
}

void __98__NSArray_IntentsFoundation__if_enumerateAsynchronouslyInSequenceOnQueue_block_completionHandler___block_invoke_5(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2) {
    (*(void (**)(uint64_t, uint64_t, void))(v2 + 16))(v2, a1[7] + 1, a1[4]);
  }
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  id v5 = (void *)a1[8];
  free(v5);
}

void __88__NSArray_IntentsFoundation__if_enumerateAsynchronouslyOnQueue_block_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    [*(id *)(a1 + 32) lock];
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    [*(id *)(a1 + 32) unlock];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
}

uint64_t __88__NSArray_IntentsFoundation__if_enumerateAsynchronouslyOnQueue_block_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], a1[6], *(void *)(*(void *)(a1[5] + 8) + 40));
}

BOOL __51__NSArray_IntentsFoundation__if_objectsNotOfClass___block_invoke()
{
  return (objc_opt_isKindOfClass() & 1) == 0;
}

BOOL __64__NSArray_IntentsFoundation__if_firstObjectWithIntValue_forKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 valueForKeyPath:*(void *)(a1 + 32)];
  BOOL v4 = [v3 intValue] == *(_DWORD *)(a1 + 40);

  return v4;
}

BOOL __65__NSArray_IntentsFoundation__if_firstObjectWithBoolValue_forKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 valueForKeyPath:*(void *)(a1 + 32)];
  BOOL v4 = *(unsigned __int8 *)(a1 + 40) == [v3 BOOLValue];

  return v4;
}

BOOL __60__NSArray_IntentsFoundation__if_objectsWithIntValue_forKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 valueForKeyPath:*(void *)(a1 + 32)];
  BOOL v4 = [v3 intValue] == *(_DWORD *)(a1 + 40);

  return v4;
}

BOOL __61__NSArray_IntentsFoundation__if_objectsWithBoolValue_forKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 valueForKeyPath:*(void *)(a1 + 32)];
  BOOL v4 = *(unsigned __int8 *)(a1 + 40) == [v3 BOOLValue];

  return v4;
}

uint64_t __57__NSArray_IntentsFoundation__if_objectsWithValue_forKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 valueForKeyPath:*(void *)(a1 + 32)];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 40)];

  return v4;
}

id __75__NSArray_IntentsFoundation__if_escapedComponentsJoinedByString_forLocale___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = v3;
      if ([v3 rangeOfString:*(void *)(a1 + 32)] == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_8;
      }
      id v5 = [*(id *)(a1 + 40) quotationBeginDelimiter];
      uint64_t v6 = [v5 stringByAppendingString:v3];

      uint64_t v7 = [*(id *)(a1 + 40) quotationEndDelimiter];
      uint64_t v4 = [v6 stringByAppendingString:v7];
    }
    else
    {
      uint64_t v4 = 0;
      uint64_t v7 = v3;
    }
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v4 = 0;
  }

LABEL_8:
  return v4;
}

id __49__NSArray_IntentsFoundation__if_mapConcurrently___block_invoke(uint64_t a1)
{
  v1 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    id v3 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v4 = v3;

  return v4;
}

@end