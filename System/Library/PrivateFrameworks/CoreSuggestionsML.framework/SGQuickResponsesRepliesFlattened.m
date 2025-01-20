@interface SGQuickResponsesRepliesFlattened
+ (id)normalizedReplyTextsSetForArray:(id)a3;
+ (unint64_t)countReplyTextsForArray:(id)a3;
- (SGQuickResponsesRepliesFlattened)initWithArray:(id)a3;
- (id)normalizedReplyTextsSet;
- (id)replyTextForIndex:(unint64_t)a3 position:(unint64_t)a4;
- (id)replyTextForIndexAndPosition:(id)a3;
- (id)replyTextsForIndex:(unint64_t)a3;
- (unint64_t)maxDistinctReplies;
- (unint64_t)modelCount;
- (unint64_t)replyClassCount;
- (unint64_t)replyCountForIndex:(unint64_t)a3;
- (unint64_t)replyTextCount;
@end

@implementation SGQuickResponsesRepliesFlattened

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalizedReplyTextsSet, 0);
  objc_storeStrong((id *)&self->_replyTexts, 0);
}

- (SGQuickResponsesRepliesFlattened)initWithArray:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {

    v18.receiver = self;
    v18.super_class = (Class)SGQuickResponsesRepliesFlattened;
    v7 = [(SGQuickResponsesRepliesFlattened *)&v18 init];
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_replyTexts, a3);
      v8->_replyTextStringsCount = +[SGQuickResponsesRepliesFlattened countReplyTextsForArray:v6];
      id v9 = objc_alloc(MEMORY[0x263F61E70]);
      v10 = [SGLazyInit alloc];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __50__SGQuickResponsesRepliesFlattened_initWithArray___block_invoke;
      v16[3] = &unk_2647EA150;
      id v17 = v6;
      v11 = [(SGLazyInit *)v10 initWithInitializer:v16 destructor:0];
      uint64_t v12 = [v9 initWithGuardedData:v11];
      normalizedReplyTextsSet = v8->_normalizedReplyTextsSet;
      v8->_normalizedReplyTextsSet = (_PASLock *)v12;
    }
    self = v8;
    v14 = self;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_FAULT, "array", buf, 2u);
    }
    v14 = 0;
  }

  return v14;
}

id __50__SGQuickResponsesRepliesFlattened_initWithArray___block_invoke(uint64_t a1)
{
  return +[SGQuickResponsesRepliesFlattened normalizedReplyTextsSetForArray:*(void *)(a1 + 32)];
}

- (unint64_t)maxDistinctReplies
{
  return self->_replyTextStringsCount;
}

- (unint64_t)modelCount
{
  return [(NSArray *)self->_replyTexts count];
}

- (unint64_t)replyClassCount
{
  return [(NSArray *)self->_replyTexts count];
}

- (unint64_t)replyTextCount
{
  return self->_replyTextStringsCount;
}

- (unint64_t)replyCountForIndex:(unint64_t)a3
{
  id v5 = [(NSArray *)self->_replyTexts objectAtIndexedSubscript:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = [MEMORY[0x263F08690] currentHandler];
      [v8 handleFailureInMethod:a2, self, @"SGQuickResponsesConfig.m", 562, @"Invalid parameter not satisfying: %@", @"[obj isKindOfClass:NSArray.class]" object file lineNumber description];
    }
    unint64_t v6 = [v5 count];
  }

  return v6;
}

- (id)replyTextsForIndex:(unint64_t)a3
{
  v3 = [(NSArray *)self->_replyTexts objectAtIndexedSubscript:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v3, 0);
  }
  else {
    id v4 = v3;
  }
  id v5 = v4;

  return v5;
}

- (id)replyTextForIndexAndPosition:(id)a3
{
  id v4 = a3;
  id v5 = [v4 first];
  uint64_t v6 = [v5 unsignedIntegerValue];
  v7 = [v4 second];

  v8 = -[SGQuickResponsesRepliesFlattened replyTextForIndex:position:](self, "replyTextForIndex:position:", v6, [v7 unsignedIntegerValue]);

  return v8;
}

- (id)replyTextForIndex:(unint64_t)a3 position:(unint64_t)a4
{
  v7 = [(NSArray *)self->_replyTexts objectAtIndexedSubscript:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a4)
    {
      v11 = [MEMORY[0x263F08690] currentHandler];
      [v11 handleFailureInMethod:a2, self, @"SGQuickResponsesConfig.m", 532, @"Invalid parameter not satisfying: %@", @"position == 0" object file lineNumber description];
    }
    id v8 = v7;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
      [v12 handleFailureInMethod:a2, self, @"SGQuickResponsesConfig.m", 535, @"Invalid parameter not satisfying: %@", @"[obj isKindOfClass:NSArray.class]" object file lineNumber description];
    }
    id v8 = [v7 objectAtIndexedSubscript:a4];
  }
  id v9 = v8;

  return v9;
}

- (id)normalizedReplyTextsSet
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  normalizedReplyTextsSet = self->_normalizedReplyTextsSet;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__SGQuickResponsesRepliesFlattened_normalizedReplyTextsSet__block_invoke;
  v5[3] = &unk_2647EA040;
  v5[4] = &v6;
  [(_PASLock *)normalizedReplyTextsSet runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __59__SGQuickResponsesRepliesFlattened_normalizedReplyTextsSet__block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 getObject];
  return MEMORY[0x270F9A758]();
}

+ (id)normalizedReplyTextsSetForArray:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0x263F08000uLL;
    uint64_t v8 = *(void *)v31;
    do
    {
      uint64_t v9 = 0;
      uint64_t v24 = v6;
      do
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v30 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = +[SGQuickResponsesReplies normalizeReplyTextInternal:v10];
          [v4 addObject:v11];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v19 = [MEMORY[0x263F08690] currentHandler];
            [v19 handleFailureInMethod:a2, a1, @"SGQuickResponsesConfig.m", 611, @"Invalid parameter not satisfying: %@", @"[obj isKindOfClass:NSArray.class]" object file lineNumber description];
          }
          id v11 = v10;
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = v8;
            unint64_t v15 = v7;
            uint64_t v16 = *(void *)v27;
            do
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v27 != v16) {
                  objc_enumerationMutation(v11);
                }
                objc_super v18 = +[SGQuickResponsesReplies normalizeReplyTextInternal:*(void *)(*((void *)&v26 + 1) + 8 * i)];
                [v4 addObject:v18];
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }
            while (v13);
            unint64_t v7 = v15;
            uint64_t v8 = v14;
            uint64_t v6 = v24;
          }
        }

        ++v9;
      }
      while (v9 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v6);
  }

  v20 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v4];
  return v20;
}

+ (unint64_t)countReplyTextsForArray:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          ++v8;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            [MEMORY[0x263F08690] currentHandler];
            id v15 = a1;
            v13 = uint64_t v12 = a2;
            [v13 handleFailureInMethod:v12, v15, @"SGQuickResponsesConfig.m", 595, @"Invalid parameter not satisfying: %@", @"[obj isKindOfClass:NSArray.class]" object file lineNumber description];

            a2 = v12;
            a1 = v15;
          }
          v8 += [v11 count];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

@end