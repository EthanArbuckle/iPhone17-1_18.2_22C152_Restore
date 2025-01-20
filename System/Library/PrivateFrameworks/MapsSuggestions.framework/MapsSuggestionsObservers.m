@interface MapsSuggestionsObservers
- (BOOL)callBlock:(id)a3;
- (BOOL)synchronouslyCallBlock:(id)a3;
- (MapsSuggestionsObservers)init;
- (MapsSuggestionsObservers)initWithCallbackQueue:(id)a3 name:(id)a4;
- (MapsSuggestionsObservers)initWithCallbackQueue:(id)a3 name:(id)a4 strong:(BOOL)a5;
- (MapsSuggestionsObservers)initWithName:(id)a3;
- (NSString)description;
- (NSString)uniqueName;
- (id).cxx_construct;
- (id)_synchronizedSnapshot;
- (unint64_t)count;
- (void)registerObserver:(id)a3 handler:(id)a4;
- (void)unregisterObserver:(id)a3 handler:(id)a4;
@end

@implementation MapsSuggestionsObservers

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

- (BOOL)callBlock:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
      dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
    }
    if (s_verbose)
    {
      v5 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        name = self->_name;
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = name;
        _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "{%@}enumerateWithBlock", buf, 0xCu);
      }
    }
    v7 = (void *)MEMORY[0x1AD0C8E80]();
    v8 = -[MapsSuggestionsObservers _synchronizedSnapshot]((id *)&self->super.isa);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __38__MapsSuggestionsObservers_callBlock___block_invoke;
    v17[3] = &unk_1E5CB9F40;
    id v18 = v8;
    id v19 = v4;
    id v9 = v8;
    v10 = self;
    v11 = v17;
    if (v10)
    {
      v12 = v10;
      innerQueue = v10->_callbackQueue._innerQueue;
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = ___ZNK3MSg5Queue5asyncI24MapsSuggestionsObserversEEvPT_U13block_pointerFvS4_E_block_invoke;
      *(void *)&buf[24] = &unk_1E5CB8198;
      *(void *)&buf[32] = v12;
      v21 = v11;
      dispatch_async(innerQueue, buf);

      v14 = *(NSObject **)&buf[32];
    }
    else
    {
      v14 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsQueue.hpp";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 208;
        *(_WORD *)&buf[18] = 2082;
        *(void *)&buf[20] = "void MSg::Queue::async(S *, void (^__strong)(S *)) const [S = MapsSuggestionsObservers]";
        *(_WORD *)&buf[28] = 2082;
        *(void *)&buf[30] = "nil == (callerSelf)";
        _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires self", buf, 0x26u);
      }
    }
  }
  else
  {
    v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsObservers.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 132;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[MapsSuggestionsObservers callBlock:]";
      *(_WORD *)&buf[28] = 2082;
      *(void *)&buf[30] = "nil == (block)";
      _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a block", buf, 0x26u);
    }
  }
  return v4 != 0;
}

- (void)registerObserver:(id)a3 handler:(id)a4
{
  *(void *)&v27[13] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, a3);
  id v6 = a4;
  v7 = (void *)MEMORY[0x1AD0C8E80]();
  id v8 = objc_loadWeakRetained(&location);
  if (v8)
  {
    id v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      name = self->_name;
      *(_DWORD *)buf = 138412546;
      v25 = (char *)name;
      __int16 v26 = 2112;
      *(void *)v27 = v8;
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_DEBUG, "{%@}registerObserver:%@", buf, 0x16u);
    }

    v11 = self->_innerObservers;
    objc_sync_enter(v11);
    unint64_t v12 = [(MapsSuggestionsObservers *)self count];
    [(NSHashTable *)self->_innerObservers addObject:v8];
    unint64_t v13 = [(MapsSuggestionsObservers *)self count];
    if (v12) {
      BOOL v14 = 1;
    }
    else {
      BOOL v14 = v13 == 0;
    }
    int v15 = !v14;
    objc_sync_exit(v11);

    v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = self->_name;
      if (v15) {
        int v18 = 89;
      }
      else {
        int v18 = 78;
      }
      *(_DWORD *)buf = 138412546;
      v25 = (char *)v17;
      __int16 v26 = 1024;
      *(_DWORD *)v27 = v18;
      _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_DEBUG, "{%@}isFirstObserver=%c", buf, 0x12u);
    }

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __53__MapsSuggestionsObservers_registerObserver_handler___block_invoke;
    v20[3] = &unk_1E5CB8770;
    v21 = v6;
    char v22 = v15;
    MSg::Queue::syncIfDifferent((NSObject **)&self->_callbackQueue, v20);
    id v19 = v21;
  }
  else
  {
    GEOFindOrCreateLog();
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v25 = "MapsSuggestionsObservers.mm";
      __int16 v26 = 1026;
      *(_DWORD *)v27 = 80;
      v27[2] = 2082;
      *(void *)&v27[3] = "-[MapsSuggestionsObservers registerObserver:handler:]";
      _os_log_impl(&dword_1A70DF000, v19, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongObserver went away in %{public}s", buf, 0x1Cu);
    }
  }

  objc_destroyWeak(&location);
}

- (unint64_t)count
{
  v3 = (void *)MEMORY[0x1AD0C8E80](self, a2);
  id v4 = -[MapsSuggestionsObservers _synchronizedSnapshot]((id *)&self->super.isa);
  unint64_t v5 = [v4 count];

  return v5;
}

- (id)_synchronizedSnapshot
{
  v1 = a1;
  if (a1)
  {
    v2 = (void *)MEMORY[0x1AD0C8E80]();
    id v3 = v1[4];
    objc_sync_enter(v3);
    id v4 = [v1[4] allObjects];
    v1 = (id *)[v4 copy];

    objc_sync_exit(v3);
  }
  return v1;
}

uint64_t __53__MapsSuggestionsObservers_registerObserver_handler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

- (MapsSuggestionsObservers)initWithCallbackQueue:(id)a3 name:(id)a4 strong:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (!v8)
  {
    v23 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsObservers.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 30;
      __int16 v27 = 2082;
      v28 = "-[MapsSuggestionsObservers initWithCallbackQueue:name:strong:]";
      __int16 v29 = 2082;
      v30 = "nil == (callbackQueue)";
      _os_log_impl(&dword_1A70DF000, v23, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a queue!", buf, 0x26u);
    }
    goto LABEL_14;
  }
  if (!v9)
  {
    v23 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsObservers.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 31;
      __int16 v27 = 2082;
      v28 = "-[MapsSuggestionsObservers initWithCallbackQueue:name:strong:]";
      __int16 v29 = 2082;
      v30 = "nil == (name)";
      _os_log_impl(&dword_1A70DF000, v23, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a name!", buf, 0x26u);
    }
LABEL_14:

    char v22 = 0;
    goto LABEL_15;
  }
  v25.receiver = self;
  v25.super_class = (Class)MapsSuggestionsObservers;
  v11 = [(MapsSuggestionsObservers *)&v25 init];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    name = v11->_name;
    v11->_name = (NSString *)v12;

    MSg::Queue::Queue((NSObject **)buf, v8);
    BOOL v14 = *(OS_dispatch_queue **)buf;
    *(void *)buf = 0;
    innerQueue = v11->_callbackQueue._innerQueue;
    v11->_callbackQueue._innerQueue = v14;

    v16 = *(NSString **)&buf[8];
    *(void *)&buf[8] = 0;
    v17 = v11->_callbackQueue._name;
    v11->_callbackQueue._name = v16;

    id v18 = objc_alloc(MEMORY[0x1E4F28D30]);
    if (v5) {
      uint64_t v19 = 512;
    }
    else {
      uint64_t v19 = 517;
    }
    uint64_t v20 = [v18 initWithOptions:v19 capacity:1];
    innerObservers = v11->_innerObservers;
    v11->_innerObservers = (NSHashTable *)v20;
  }
  self = v11;
  char v22 = self;
LABEL_15:

  return v22;
}

- (MapsSuggestionsObservers)initWithCallbackQueue:(id)a3 name:(id)a4
{
  return [(MapsSuggestionsObservers *)self initWithCallbackQueue:a3 name:a4 strong:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerObservers, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

void __38__MapsSuggestionsObservers_callBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v10 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * v6);
        if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
          dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
        }
        if (s_verbose)
        {
          id v8 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v9 = v10[1];
            *(_DWORD *)buf = 138412546;
            uint64_t v16 = v9;
            __int16 v17 = 2112;
            uint64_t v18 = v7;
            _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "{%@}enumerateWithBlock[%@]", buf, 0x16u);
          }
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
    }
    while (v4);
  }
}

uint64_t __55__MapsSuggestionsObservers_unregisterObserver_handler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

- (void)unregisterObserver:(id)a3 handler:(id)a4
{
  *(void *)&v27[13] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1AD0C8E80]();
  id v9 = v6;
  if (v9)
  {
    v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      name = self->_name;
      *(_DWORD *)buf = 138412546;
      objc_super v25 = (char *)name;
      __int16 v26 = 2112;
      *(void *)__int16 v27 = v9;
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "{%@}unregisterObserver:%@", buf, 0x16u);
    }

    long long v12 = self->_innerObservers;
    objc_sync_enter(v12);
    unint64_t v13 = [(MapsSuggestionsObservers *)self count];
    [(NSHashTable *)self->_innerObservers removeObject:v9];
    unint64_t v14 = [(MapsSuggestionsObservers *)self count];
    if (v13) {
      BOOL v15 = v14 == 0;
    }
    else {
      BOOL v15 = 0;
    }
    int v16 = v15;
    objc_sync_exit(v12);

    __int16 v17 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = self->_name;
      if (v16) {
        int v19 = 89;
      }
      else {
        int v19 = 78;
      }
      *(_DWORD *)buf = 138412546;
      objc_super v25 = (char *)v18;
      __int16 v26 = 1024;
      *(_DWORD *)__int16 v27 = v19;
      _os_log_impl(&dword_1A70DF000, v17, OS_LOG_TYPE_DEBUG, "{%@}wasLastObserver=%c", buf, 0x12u);
    }

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __55__MapsSuggestionsObservers_unregisterObserver_handler___block_invoke;
    v21[3] = &unk_1E5CB8770;
    char v22 = v7;
    char v23 = v16;
    MSg::Queue::syncIfDifferent((NSObject **)&self->_callbackQueue, v21);
    uint64_t v20 = v22;
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      objc_super v25 = "MapsSuggestionsObservers.mm";
      __int16 v26 = 1026;
      *(_DWORD *)__int16 v27 = 102;
      v27[2] = 2082;
      *(void *)&v27[3] = "-[MapsSuggestionsObservers unregisterObserver:handler:]";
      _os_log_impl(&dword_1A70DF000, v20, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongObserver went away in %{public}s", buf, 0x1Cu);
    }
  }
}

- (MapsSuggestionsObservers)initWithName:(id)a3
{
  id v4 = a3;
  id v5 = [v4 stringByAppendingString:@"Queue"];
  id v6 = (const char *)[v5 UTF8String];
  id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v8 = dispatch_queue_create(v6, v7);

  id v9 = [(MapsSuggestionsObservers *)self initWithCallbackQueue:v8 name:v4];
  return v9;
}

- (MapsSuggestionsObservers)init
{
  id v3 = [(id)objc_opt_class() description];
  id v4 = [(MapsSuggestionsObservers *)self initWithName:v3];

  return v4;
}

- (BOOL)synchronouslyCallBlock:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
      dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
    }
    if (s_verbose)
    {
      id v5 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        name = self->_name;
        *(_DWORD *)buf = 138412290;
        long long v12 = (const char *)name;
        _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "{%@}synchronouslyEnumerateWithBlock", buf, 0xCu);
      }
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __51__MapsSuggestionsObservers_synchronouslyCallBlock___block_invoke;
    v9[3] = &unk_1E5CB8198;
    v9[4] = self;
    id v10 = v4;
    dispatch_sync((dispatch_queue_t)self->_callbackQueue._innerQueue, v9);
  }
  else
  {
    id v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      long long v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsObservers.mm";
      __int16 v13 = 1024;
      int v14 = 150;
      __int16 v15 = 2082;
      int v16 = "-[MapsSuggestionsObservers synchronouslyCallBlock:]";
      __int16 v17 = 2082;
      uint64_t v18 = "nil == (block)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a block", buf, 0x26u);
    }
  }
  return v4 != 0;
}

void __51__MapsSuggestionsObservers_synchronouslyCallBlock___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1AD0C8E80]();
  -[MapsSuggestionsObservers _synchronizedSnapshot](*(id **)(a1 + 32));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v10 + 1) + 8 * v5);
        if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
          dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
        }
        if (s_verbose)
        {
          id v7 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
            *(_DWORD *)buf = 138412546;
            uint64_t v15 = v8;
            __int16 v16 = 2112;
            uint64_t v17 = v6;
            _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "{%@}synchronouslyEnumerateWithBlock[%@]", buf, 0x16u);
          }
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v18 count:16];
    }
    while (v3);
  }
}

- (NSString)uniqueName
{
  return self->_name;
}

- (NSString)description
{
  uint64_t v3 = (void *)MEMORY[0x1AD0C8E80](self, a2);
  uint64_t v4 = -[MapsSuggestionsObservers _synchronizedSnapshot]((id *)&self->super.isa);
  id v5 = [NSString alloc];
  v9.receiver = self;
  v9.super_class = (Class)MapsSuggestionsObservers;
  uint64_t v6 = [(MapsSuggestionsObservers *)&v9 description];
  id v7 = (void *)[v5 initWithFormat:@"%@ %u observers", v6, objc_msgSend(v4, "count")];

  return (NSString *)v7;
}

@end