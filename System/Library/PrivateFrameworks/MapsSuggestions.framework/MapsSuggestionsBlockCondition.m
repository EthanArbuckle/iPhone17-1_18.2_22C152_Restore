@interface MapsSuggestionsBlockCondition
- (BOOL)isTrue;
- (MapsSuggestionsBlockCondition)initWithName:(id)a3 block:(id)a4;
- (MapsSuggestionsBlockCondition)initWithName:(id)a3 queue:(id)a4 block:(id)a5;
@end

@implementation MapsSuggestionsBlockCondition

- (BOOL)isTrue
{
  queue = self->_queue;
  if (queue)
  {
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x2020000000;
    char v10 = 0;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __39__MapsSuggestionsBlockCondition_isTrue__block_invoke;
    v6[3] = &unk_1E5CB80D0;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(queue, v6);
    char v3 = *((unsigned char *)v8 + 24);
    _Block_object_dispose(&v7, 8);
    return v3;
  }
  else
  {
    v5 = (uint64_t (*)(void))*((void *)self->_block + 2);
    return v5();
  }
}

- (MapsSuggestionsBlockCondition)initWithName:(id)a3 queue:(id)a4 block:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v18.receiver = self;
    v18.super_class = (Class)MapsSuggestionsBlockCondition;
    v11 = [(MapsSuggestionsBaseCondition *)&v18 initWithName:a3];
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_queue, a4);
      uint64_t v13 = [v10 copy];
      id block = v12->_block;
      v12->_id block = (id)v13;
    }
    self = v12;
    v15 = self;
  }
  else
  {
    v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBlockCondition.m";
      __int16 v21 = 1024;
      int v22 = 27;
      __int16 v23 = 2082;
      v24 = "-[MapsSuggestionsBlockCondition initWithName:queue:block:]";
      __int16 v25 = 2082;
      v26 = "nil == (block)";
      _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a BOOLean block to evaluate", buf, 0x26u);
    }

    v15 = 0;
  }

  return v15;
}

- (MapsSuggestionsBlockCondition)initWithName:(id)a3 block:(id)a4
{
  return [(MapsSuggestionsBlockCondition *)self initWithName:a3 queue:0 block:a4];
}

uint64_t __39__MapsSuggestionsBlockCondition_isTrue__block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 24) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end