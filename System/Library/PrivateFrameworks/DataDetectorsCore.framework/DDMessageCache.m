@interface DDMessageCache
- (DDMessageCache)init;
- (id)stringWithElement:(id)a3 conversationID:(id)a4 range:(_NSRange *)a5;
- (void)_pruneIgnoringFirst:(BOOL)a3;
- (void)removeConversation:(id)a3;
@end

@implementation DDMessageCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexLRU, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_memoryWarningSource, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)stringWithElement:(id)a3 conversationID:(id)a4 range:(_NSRange *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__1955;
  v33 = __Block_byref_object_dispose__1956;
  id v34 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__DDMessageCache_stringWithElement_conversationID_range___block_invoke;
  block[3] = &unk_1E59857B0;
  block[4] = self;
  id v11 = v9;
  id v21 = v11;
  id v12 = v8;
  id v22 = v12;
  v23 = &v29;
  v24 = &v25;
  dispatch_sync(queue, block);
  if (!v30[5])
  {
    uint64_t v13 = [v12 text];
    v14 = (void *)v30[5];
    v30[5] = v13;
  }
  NSUInteger v15 = v26[3];
  v16 = [v12 text];
  NSUInteger v17 = [v16 length];
  a5->location = v15;
  a5->length = v17;

  id v18 = (id)v30[5];
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v18;
}

uint64_t __57__DDMessageCache_stringWithElement_conversationID_range___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v2)
  {
    v3 = v2;
    uint64_t v4 = [v2 count];
    v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-90000.0];
    unint64_t v6 = 0;
    uint64_t v7 = v4;
    do
    {
      uint64_t v8 = v7 - 1;
      if (v7 - 1 < 0) {
        break;
      }
      id v9 = [v3 objectAtIndexedSubscript:v7 - 1];
      v10 = [v9 date];
      uint64_t v11 = [v10 compare:v5];

      if (v11 == -1) {
        break;
      }
      id v12 = [v3 objectAtIndexedSubscript:v7 - 1];
      uint64_t v13 = [v12 text];
      v6 += [v13 length];

      uint64_t v7 = v8;
    }
    while (v6 < 0x97);
    [v3 addObject:*(void *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 32) + 32) removeObjectIdenticalTo:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 32) insertObject:*(void *)(a1 + 40) atIndex:0];
    if (v7 == 1 || v4 == 5)
    {
      [v3 removeObjectAtIndex:0];
    }
    else if (v7)
    {
      v14 = objc_msgSend(v3, "subarrayWithRange:", v7, v4 - v7 + 1);
      uint64_t v15 = [v14 mutableCopy];

      [*(id *)(*(void *)(a1 + 32) + 24) setObject:v15 forKeyedSubscript:*(void *)(a1 + 40)];
      v3 = (void *)v15;
    }
    v20 = [v3 valueForKey:@"text"];
    uint64_t v21 = [v20 componentsJoinedByString:@"\n¶\n"];
    uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 8);
    v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;

    uint64_t v24 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) length];
    uint64_t v25 = [*(id *)(a1 + 48) text];
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v24 - [v25 length];
  }
  else
  {
    v16 = [MEMORY[0x1E4F1CA48] arrayWithObject:*(void *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 32) + 24) setObject:v16 forKeyedSubscript:*(void *)(a1 + 40)];

    [*(id *)(*(void *)(a1 + 32) + 32) insertObject:*(void *)(a1 + 40) atIndex:0];
    uint64_t v17 = [*(id *)(a1 + 48) text];
    uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
    v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
  v26 = *(void **)(a1 + 32);

  return [v26 _pruneIgnoringFirst:1];
}

- (void)removeConversation:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__DDMessageCache_removeConversation___block_invoke;
  v7[3] = &unk_1E5985788;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __37__DDMessageCache_removeConversation___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (void)_pruneIgnoringFirst:(BOOL)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v5 = (void *)[(NSMutableArray *)self->_indexLRU copy];
  id v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-90000.0];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v7 = v5;
  id v8 = self;
  id obj = v7;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    unint64_t v11 = 0;
    uint64_t v12 = *(void *)v35;
    v30 = v8;
    uint64_t v31 = *(void *)v35;
    do
    {
      uint64_t v13 = 0;
      uint64_t v32 = v10;
      do
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(obj);
        }
        if (a3)
        {
          ++v11;
        }
        else
        {
          uint64_t v14 = *(void *)(*((void *)&v34 + 1) + 8 * v13);
          uint64_t v15 = [(NSMutableDictionary *)v8->_cache objectForKeyedSubscript:v14];
          uint64_t v16 = [v15 count];
          if (v11 > 0x14) {
            goto LABEL_16;
          }
          uint64_t v17 = v16;
          if (!v16) {
            goto LABEL_16;
          }
          uint64_t v18 = [v15 lastObject];
          v19 = [v18 date];
          uint64_t v20 = [v19 compare:v6];

          uint64_t v12 = v31;
          BOOL v21 = v20 == -1;
          uint64_t v10 = v32;
          if (v21)
          {
LABEL_16:
            -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_cache, "setObject:forKeyedSubscript:", 0, v14, v30);
            [(NSMutableArray *)v8->_indexLRU removeObjectIdenticalTo:v14];
          }
          else
          {
            uint64_t v22 = v17 - 2;
            if (v17 >= 2)
            {
              while (1)
              {
                v23 = objc_msgSend(v15, "objectAtIndexedSubscript:", v22, v30);
                uint64_t v24 = [v23 date];
                uint64_t v25 = [v24 compare:v6];

                if (v25 == -1) {
                  break;
                }
                if (v22-- <= 0) {
                  goto LABEL_21;
                }
              }
              uint64_t v27 = objc_msgSend(v15, "subarrayWithRange:", v22 + 1, v17 - (v22 + 1));
              uint64_t v28 = (void *)[v27 mutableCopy];
              [(NSMutableDictionary *)v30->_cache setObject:v28 forKeyedSubscript:v14];

LABEL_21:
              ++v11;
              id v8 = v30;
              uint64_t v12 = v31;
              uint64_t v10 = v32;
            }
          }
        }
        a3 = 0;
        ++v13;
      }
      while (v13 != v10);
      uint64_t v29 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      uint64_t v10 = v29;
      a3 = 0;
    }
    while (v29);
  }
}

- (DDMessageCache)init
{
  v16.receiver = self;
  v16.super_class = (Class)DDMessageCache;
  id v2 = [(DDMessageCache *)&v16 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v4 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v3;

    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v6 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v5;

    id v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.DDMessageCaching", v7);
    uint64_t v9 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v8;

    dispatch_source_t v10 = dispatch_source_create(MEMORY[0x1E4F14468], 0, 2uLL, *((dispatch_queue_t *)v2 + 1));
    unint64_t v11 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v10;

    uint64_t v12 = *((void *)v2 + 2);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __22__DDMessageCache_init__block_invoke;
    handler[3] = &unk_1E5985760;
    id v15 = v2;
    dispatch_source_set_event_handler(v12, handler);
    dispatch_resume(*((dispatch_object_t *)v2 + 2));
  }
  return (DDMessageCache *)v2;
}

uint64_t __22__DDMessageCache_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pruneIgnoringFirst:0];
}

@end