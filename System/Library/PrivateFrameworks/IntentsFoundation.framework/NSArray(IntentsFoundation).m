@interface NSArray(IntentsFoundation)
+ (id)if_arrayWithObjectIfNonNil:()IntentsFoundation;
- (id)if_arrayByRemovingObject:()IntentsFoundation;
- (id)if_arrayByRemovingObjectsInArray:()IntentsFoundation;
- (id)if_compactMap:()IntentsFoundation;
- (id)if_compactMapConcurrently:()IntentsFoundation;
- (id)if_escapedComponentsJoinedByString:()IntentsFoundation forLocale:;
- (id)if_firstObjectPassingTest:()IntentsFoundation;
- (id)if_firstObjectWithBoolValue:()IntentsFoundation forKey:;
- (id)if_firstObjectWithIntValue:()IntentsFoundation forKey:;
- (id)if_firstObjectWithValue:()IntentsFoundation forKey:;
- (id)if_flatMap:()IntentsFoundation;
- (id)if_map:()IntentsFoundation;
- (id)if_mapConcurrently:()IntentsFoundation;
- (id)if_objectsNotOfClass:()IntentsFoundation;
- (id)if_objectsOfClass:()IntentsFoundation;
- (id)if_objectsPassingTest:()IntentsFoundation;
- (id)if_objectsWithBoolValue:()IntentsFoundation forKey:;
- (id)if_objectsWithIntValue:()IntentsFoundation forKey:;
- (id)if_objectsWithValue:()IntentsFoundation forKey:;
- (uint64_t)if_enumerateAsynchronously:()IntentsFoundation completionHandler:;
- (void)if_enumerateAsynchronouslyInSequence:()IntentsFoundation completionHandler:;
- (void)if_enumerateAsynchronouslyInSequenceOnQueue:()IntentsFoundation block:completionHandler:;
- (void)if_enumerateAsynchronouslyOnQueue:()IntentsFoundation block:completionHandler:;
- (void)if_flatMapAsynchronously:()IntentsFoundation completionHandler:;
- (void)if_flatMapAsynchronouslyOnQueue:()IntentsFoundation transform:completionHandler:;
- (void)if_mapAsynchronously:()IntentsFoundation completionHandler:;
- (void)if_mapAsynchronouslyOnQueue:()IntentsFoundation transform:completionHandler:;
@end

@implementation NSArray(IntentsFoundation)

- (id)if_compactMap:()IntentsFoundation
{
  return _IFArrayTransform(a1, a3);
}

- (id)if_objectsOfClass:()IntentsFoundation
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__NSArray_IntentsFoundation__if_objectsOfClass___block_invoke;
  v5[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v5[4] = a3;
  v3 = objc_msgSend(a1, "if_objectsPassingTest:", v5);
  return v3;
}

- (void)if_enumerateAsynchronouslyInSequenceOnQueue:()IntentsFoundation block:completionHandler:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [a1 objectEnumerator];
  v12 = malloc_type_calloc(1uLL, 1uLL, 0x100004077774924uLL);
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__8;
  v32 = __Block_byref_object_dispose__9;
  id v33 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __98__NSArray_IntentsFoundation__if_enumerateAsynchronouslyInSequenceOnQueue_block_completionHandler___block_invoke;
  v21[3] = &unk_1E6CA0F28;
  id v13 = v11;
  id v22 = v13;
  id v14 = v8;
  id v23 = v14;
  id v15 = v10;
  id v24 = v15;
  v26 = &v28;
  v27 = v12;
  id v16 = v9;
  id v25 = v16;
  uint64_t v17 = MEMORY[0x1E01A2EC0](v21);
  v18 = (void *)v29[5];
  v29[5] = v17;

  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v29[5] + 16))(v29[5], 0, v19, v20);
  _Block_object_dispose(&v28, 8);
}

- (id)if_firstObjectWithValue:()IntentsFoundation forKey:
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__NSArray_IntentsFoundation__if_firstObjectWithValue_forKey___block_invoke;
  v12[3] = &unk_1E6CA0DA0;
  id v13 = v7;
  id v14 = v6;
  id v8 = v6;
  id v9 = v7;
  id v10 = objc_msgSend(a1, "if_firstObjectPassingTest:", v12);

  return v10;
}

- (id)if_map:()IntentsFoundation
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__NSArray_IntentsFoundation__if_map___block_invoke;
  v8[3] = &unk_1E6CA0D50;
  id v9 = v4;
  id v5 = v4;
  id v6 = _IFArrayTransform(a1, (uint64_t)v8);

  return v6;
}

- (id)if_firstObjectPassingTest:()IntentsFoundation
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = a1;
  id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (v4[2](v4, v9))
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)if_objectsPassingTest:()IntentsFoundation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (v4[2](v4, v12)) {
          objc_msgSend(v5, "setObject:atIndexedSubscript:", v12, v9++, (void)v14);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)if_flatMap:()IntentsFoundation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = v4[2](v4, *(void *)(*((void *)&v15 + 1) + 8 * i));
        if (!v11)
        {

          long long v13 = 0;
          goto LABEL_14;
        }
        uint64_t v12 = (void *)v11;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v5 addObjectsFromArray:v12];
        }
        else {
          objc_msgSend(v5, "addObject:", v12, (void)v15);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  long long v13 = (void *)[v5 copy];
LABEL_14:

  return v13;
}

- (void)if_mapAsynchronously:()IntentsFoundation completionHandler:
{
}

- (void)if_enumerateAsynchronouslyInSequence:()IntentsFoundation completionHandler:
{
  label = dispatch_queue_get_label(MEMORY[0x1E4F14428]);
  uint64_t v8 = dispatch_queue_get_label(0);
  id v9 = a4;
  id v10 = a3;
  if (label == v8)
  {
    uint64_t v11 = MEMORY[0x1E4F14428];
  }
  else
  {
    uint64_t v11 = dispatch_get_global_queue(0, 0);
  }
  id v12 = (id)v11;
  objc_msgSend(a1, "if_enumerateAsynchronouslyInSequenceOnQueue:block:completionHandler:", v11, v10, v9);
}

- (void)if_enumerateAsynchronouslyOnQueue:()IntentsFoundation block:completionHandler:
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = a3;
  id v24 = a4;
  id v19 = a5;
  char v9 = v8 != 0;
  group = dispatch_group_create();
  uint64_t v10 = [a1 count];
  id v22 = objc_alloc_init(MEMORY[0x1E4F28E08]);
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy_;
  v46 = __Block_byref_object_dispose_;
  id v47 = 0;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = a1;
  uint64_t v11 = [obj countByEnumeratingWithState:&v38 objects:v48 count:16];
  long long v18 = v8;
  if (v11)
  {
    uint64_t v12 = 0;
    uint64_t v21 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v39 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v34 = 0;
        v35 = &v34;
        uint64_t v36 = 0x2020000000;
        char v37 = 0;
        dispatch_group_enter(group);
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __88__NSArray_IntentsFoundation__if_enumerateAsynchronouslyOnQueue_block_completionHandler___block_invoke;
        v29[3] = &unk_1E6CA0E38;
        id v30 = v22;
        v32 = &v42;
        v31 = group;
        id v33 = &v34;
        v24[2](v24, v14, v12 + i, v29);
        BOOL v15 = *((unsigned char *)v35 + 24) == 0;

        v9 |= v15;
        _Block_object_dispose(&v34, 8);
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v38 objects:v48 count:16];
      v12 += i;
    }
    while (v11);
  }

  if (v19)
  {
    if (v9)
    {
      long long v16 = v18;
      if (!v18)
      {
        long long v16 = MEMORY[0x1E4F14428];
        label = dispatch_queue_get_label(MEMORY[0x1E4F14428]);
        if (label != dispatch_queue_get_label(0))
        {
          long long v16 = dispatch_get_global_queue(0, 0);
        }
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __88__NSArray_IntentsFoundation__if_enumerateAsynchronouslyOnQueue_block_completionHandler___block_invoke_2;
      block[3] = &unk_1E6CA0E60;
      id v26 = v19;
      v27 = &v42;
      uint64_t v28 = v10;
      long long v18 = v16;
      dispatch_group_notify(group, v16, block);
    }
    else
    {
      (*((void (**)(id, uint64_t, uint64_t))v19 + 2))(v19, v10, v43[5]);
    }
  }
  _Block_object_dispose(&v42, 8);
}

- (uint64_t)if_enumerateAsynchronously:()IntentsFoundation completionHandler:
{
  return objc_msgSend(a1, "if_enumerateAsynchronouslyOnQueue:block:completionHandler:", 0, a3, a4);
}

- (id)if_objectsNotOfClass:()IntentsFoundation
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__NSArray_IntentsFoundation__if_objectsNotOfClass___block_invoke;
  v5[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v5[4] = a3;
  v3 = objc_msgSend(a1, "if_objectsPassingTest:", v5);
  return v3;
}

- (id)if_firstObjectWithIntValue:()IntentsFoundation forKey:
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__NSArray_IntentsFoundation__if_firstObjectWithIntValue_forKey___block_invoke;
  v10[3] = &unk_1E6CA0DF0;
  id v11 = v6;
  int v12 = a3;
  id v7 = v6;
  uint64_t v8 = objc_msgSend(a1, "if_firstObjectPassingTest:", v10);

  return v8;
}

- (id)if_firstObjectWithBoolValue:()IntentsFoundation forKey:
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__NSArray_IntentsFoundation__if_firstObjectWithBoolValue_forKey___block_invoke;
  v10[3] = &unk_1E6CA0DC8;
  id v11 = v6;
  char v12 = a3;
  id v7 = v6;
  uint64_t v8 = objc_msgSend(a1, "if_firstObjectPassingTest:", v10);

  return v8;
}

- (id)if_objectsWithIntValue:()IntentsFoundation forKey:
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__NSArray_IntentsFoundation__if_objectsWithIntValue_forKey___block_invoke;
  v10[3] = &unk_1E6CA0DF0;
  id v11 = v6;
  int v12 = a3;
  id v7 = v6;
  uint64_t v8 = objc_msgSend(a1, "if_objectsPassingTest:", v10);

  return v8;
}

- (id)if_objectsWithBoolValue:()IntentsFoundation forKey:
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__NSArray_IntentsFoundation__if_objectsWithBoolValue_forKey___block_invoke;
  v10[3] = &unk_1E6CA0DC8;
  id v11 = v6;
  char v12 = a3;
  id v7 = v6;
  uint64_t v8 = objc_msgSend(a1, "if_objectsPassingTest:", v10);

  return v8;
}

- (id)if_objectsWithValue:()IntentsFoundation forKey:
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__NSArray_IntentsFoundation__if_objectsWithValue_forKey___block_invoke;
  v12[3] = &unk_1E6CA0DA0;
  id v13 = v7;
  id v14 = v6;
  id v8 = v6;
  id v9 = v7;
  uint64_t v10 = objc_msgSend(a1, "if_objectsPassingTest:", v12);

  return v10;
}

- (id)if_arrayByRemovingObjectsInArray:()IntentsFoundation
{
  id v4 = a3;
  id v5 = (void *)[a1 mutableCopy];
  [v5 removeObjectsInArray:v4];

  return v5;
}

- (id)if_arrayByRemovingObject:()IntentsFoundation
{
  id v4 = a3;
  id v5 = (void *)[a1 mutableCopy];
  [v5 removeObject:v4];

  return v5;
}

- (id)if_escapedComponentsJoinedByString:()IntentsFoundation forLocale:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  BOOL v15 = __75__NSArray_IntentsFoundation__if_escapedComponentsJoinedByString_forLocale___block_invoke;
  long long v16 = &unk_1E6CA0D78;
  id v17 = v6;
  id v18 = v7;
  id v8 = v7;
  id v9 = v6;
  uint64_t v10 = objc_msgSend(a1, "if_compactMap:", &v13);
  id v11 = objc_msgSend(v10, "componentsJoinedByString:", v9, v13, v14, v15, v16);

  return v11;
}

- (void)if_flatMapAsynchronouslyOnQueue:()IntentsFoundation transform:completionHandler:
{
}

- (void)if_flatMapAsynchronously:()IntentsFoundation completionHandler:
{
}

- (id)if_compactMapConcurrently:()IntentsFoundation
{
  return _IFConcurrentArrayTransform(a1, a3);
}

- (void)if_mapAsynchronouslyOnQueue:()IntentsFoundation transform:completionHandler:
{
}

- (id)if_mapConcurrently:()IntentsFoundation
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__NSArray_IntentsFoundation__if_mapConcurrently___block_invoke;
  v8[3] = &unk_1E6CA0D50;
  id v9 = v4;
  id v5 = v4;
  id v6 = _IFConcurrentArrayTransform(a1, (uint64_t)v8);

  return v6;
}

+ (id)if_arrayWithObjectIfNonNil:()IntentsFoundation
{
  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E4F1CA48];
    id v4 = a3;
    id v5 = objc_msgSend([v3 alloc], "initWithObjects:", v4, 0);
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

@end