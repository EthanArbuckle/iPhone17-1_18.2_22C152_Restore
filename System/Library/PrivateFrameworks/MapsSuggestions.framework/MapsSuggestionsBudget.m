@interface MapsSuggestionsBudget
- (BOOL)hasBudgetLeft;
- (BOOL)q_saveStateForRuleName:(id)a3 state:(id)a4;
- (BOOL)spendAtTime:(id)a3;
- (BOOL)spendNow;
- (MapsSuggestionsBudget)initWithDelegate:(id)a3 name:(id)a4;
- (NSString)description;
- (NSString)uniqueName;
- (id).cxx_construct;
- (id)nameForJSON;
- (id)objectForJSON;
- (id)q_loadStateForRuleName:(id)a3;
- (uint64_t)_q_hasBudgetLeft;
- (uint64_t)_q_spendAtTime:(uint64_t)a1;
- (void)addRollingWindowOfCount:(unint64_t)a3 perDuration:(const void *)a4 name:(id)a5;
- (void)addRollingWindowOfCount:(unint64_t)a3 perTimeInterval:(double)a4 name:(id)a5;
- (void)reset;
@end

@implementation MapsSuggestionsBudget

- (MapsSuggestionsBudget)initWithDelegate:(id)a3 name:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    v27.receiver = self;
    v27.super_class = (Class)MapsSuggestionsBudget;
    v9 = [(MapsSuggestionsBudget *)&v27 init];
    if (v9)
    {
      uint64_t v10 = [v8 copy];
      name = v9->_name;
      v9->_name = (NSString *)v10;

      v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      MSg::Queue::Queue((dispatch_queue_t *)buf, @"MapsSuggestionsBudgetQueue", v12);
      v13 = *(OS_dispatch_queue **)buf;
      *(void *)buf = 0;
      innerQueue = v9->_queue._innerQueue;
      v9->_queue._innerQueue = v13;

      v15 = *(NSString **)&buf[8];
      *(void *)&buf[8] = 0;
      v16 = v9->_queue._name;
      v9->_queue._name = v15;

      objc_storeStrong((id *)&v9->_delegate, a3);
      v17 = [(MapsSuggestionsBudgetDelegate *)v9->_delegate readBudgetState];
      uint64_t v18 = [v17 mutableCopy];
      data = v9->_data;
      v9->_data = (NSMutableDictionary *)v18;

      v20 = [(NSMutableDictionary *)v9->_data objectForKeyedSubscript:@"MapsSuggestionsBudgetVersionKey"];
      int v21 = [v20 intValue];

      if (v21 != 2)
      {
        v22 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)&buf[4] = v21;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = 2;
          _os_log_impl(&dword_1A70DF000, v22, OS_LOG_TYPE_ERROR, "The version does not correspond. Them=%d. Me=%d. This may be a migration. Ignoring state!", buf, 0xEu);
        }

        v23 = v9->_data;
        v9->_data = 0;
      }
    }
    self = v9;
    v24 = self;
  }
  else
  {
    v25 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBudget.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 179;
      __int16 v29 = 2082;
      v30 = "-[MapsSuggestionsBudget initWithDelegate:name:]";
      __int16 v31 = 2082;
      v32 = "nil == (name)";
      _os_log_impl(&dword_1A70DF000, v25, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a name", buf, 0x26u);
    }

    v24 = 0;
  }

  return v24;
}

- (void)addRollingWindowOfCount:(unint64_t)a3 perTimeInterval:(double)a4 name:(id)a5
{
  uint64_t v5 = (uint64_t)(a4 * 1000000000.0);
  [(MapsSuggestionsBudget *)self addRollingWindowOfCount:a3 perDuration:&v5 name:a5];
}

- (void)addRollingWindowOfCount:(unint64_t)a3 perDuration:(const void *)a4 name:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v9 = v8;
  if (!*(void *)a4)
  {
    uint64_t v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBudget.mm";
      __int16 v17 = 1024;
      int v18 = 209;
      __int16 v19 = 2082;
      v20 = "-[MapsSuggestionsBudget addRollingWindowOfCount:perDuration:name:]";
      __int16 v21 = 2082;
      v22 = "0LLu == duration.asNanoSeconds()";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. An empty time would be division by zero", buf, 0x26u);
    }
    goto LABEL_9;
  }
  if (!v8)
  {
    uint64_t v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBudget.mm";
      __int16 v17 = 1024;
      int v18 = 210;
      __int16 v19 = 2082;
      v20 = "-[MapsSuggestionsBudget addRollingWindowOfCount:perDuration:name:]";
      __int16 v21 = 2082;
      v22 = "nil == (name)";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a name for the rule", buf, 0x26u);
    }
LABEL_9:

    goto LABEL_10;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__MapsSuggestionsBudget_addRollingWindowOfCount_perDuration_name___block_invoke;
  v11[3] = &unk_1E5CB8980;
  v11[4] = self;
  id v12 = v8;
  unint64_t v13 = a3;
  v14 = a4;
  dispatch_sync((dispatch_queue_t)self->_queue._innerQueue, v11);

LABEL_10:
}

uint64_t __66__MapsSuggestionsBudget_addRollingWindowOfCount_perDuration_name___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(uint64_t **)(a1 + 56);
  unint64_t v3 = *(void *)(v1 + 40);
  unint64_t v4 = *(void *)(v1 + 48);
  if (v3 >= v4)
  {
    uint64_t v7 = *(void *)(v1 + 32);
    unint64_t v8 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v3 - v7) >> 4);
    if (v8 + 1 > 0x333333333333333) {
      std::vector<MSg::_RollingWindowBudgetRule>::__throw_length_error[abi:ne180100]();
    }
    v9 = *(NSString **)(a1 + 40);
    uint64_t v10 = *(void **)(a1 + 48);
    uint64_t v11 = *v2;
    unint64_t v12 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v4 - v7) >> 4);
    uint64_t v13 = 2 * v12;
    if (2 * v12 <= v8 + 1) {
      uint64_t v13 = v8 + 1;
    }
    if (v12 >= 0x199999999999999) {
      unint64_t v14 = 0x333333333333333;
    }
    else {
      unint64_t v14 = v13;
    }
    uint64_t v28 = v1 + 48;
    if (v14)
    {
      if (v14 > 0x333333333333333) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      v15 = (char *)operator new(80 * v14);
    }
    else
    {
      v15 = 0;
    }
    v25 = v15;
    v26.i64[0] = (uint64_t)&v15[80 * v8];
    objc_super v27 = &v15[80 * v14];
    MSg::_RollingWindowBudgetRule::_RollingWindowBudgetRule((id *)v26.i64[0], (MapsSuggestionsBudget *)v1, v9, v10, v11);
    uint64_t v16 = v26.i64[0];
    uint64_t v6 = v26.i64[0] + 80;
    v26.i64[1] = v26.i64[0] + 80;
    uint64_t v18 = *(void *)(v1 + 32);
    unint64_t v17 = *(void *)(v1 + 40);
    if (v17 == v18)
    {
      int64x2_t v23 = vdupq_n_s64(v17);
    }
    else
    {
      uint64_t v19 = 0;
      do
      {
        uint64_t v20 = v16 + v19;
        uint64_t v21 = v17 + v19;
        objc_moveWeak((id *)(v16 + v19 - 80), (id *)(v17 + v19 - 80));
        uint64_t v22 = *(void *)(v17 + v19 - 72);
        *(void *)(v21 - 72) = 0;
        *(void *)(v20 - 72) = v22;
        *(_OWORD *)(v20 - 64) = *(_OWORD *)(v17 + v19 - 64);
        *(void *)(v20 - 48) = *(void *)(v17 + v19 - 48);
        *(void *)(v20 - 40) = *(void *)(v17 + v19 - 40);
        *(void *)(v20 - 32) = *(void *)(v17 + v19 - 32);
        *(void *)(v20 - 24) = *(void *)(v17 + v19 - 24);
        *(_OWORD *)(v21 - 48) = 0u;
        *(_OWORD *)(v21 - 32) = 0u;
        *(void *)(v20 - 16) = *(void *)(v17 + v19 - 16);
        *(void *)(v20 - 8) = *(void *)(v17 + v19 - 8);
        *(void *)(v21 - 16) = 0;
        *(void *)(v21 - 8) = 0;
        v19 -= 80;
      }
      while (v17 + v19 != v18);
      int64x2_t v23 = *(int64x2_t *)(v1 + 32);
      uint64_t v6 = v26.i64[1];
      v16 += v19;
    }
    *(void *)(v1 + 32) = v16;
    *(void *)(v1 + 40) = v6;
    int64x2_t v26 = v23;
    v24 = *(char **)(v1 + 48);
    *(void *)(v1 + 48) = v27;
    objc_super v27 = v24;
    v25 = (char *)v23.i64[0];
    uint64_t result = std::__split_buffer<MSg::_RollingWindowBudgetRule>::~__split_buffer((uint64_t)&v25);
  }
  else
  {
    uint64_t result = (uint64_t)MSg::_RollingWindowBudgetRule::_RollingWindowBudgetRule(*(id **)(v1 + 40), (MapsSuggestionsBudget *)v1, *(NSString **)(a1 + 40), *(void **)(a1 + 48), *v2);
    uint64_t v6 = v3 + 80;
    *(void *)(v1 + 40) = v3 + 80;
  }
  *(void *)(v1 + 40) = v6;
  return result;
}

- (uint64_t)_q_hasBudgetLeft
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(result + 16));
    unint64_t v3 = *(MSg::_RollingWindowBudgetRule **)(v1 + 32);
    v2 = *(MSg::_RollingWindowBudgetRule **)(v1 + 40);
    while (1)
    {
      if (v3 == v2) {
        return 1;
      }
      MSg::_RollingWindowBudgetRule::_prune(v3);
      if (*((void *)v3 + 9) >= *((void *)v3 + 2)) {
        break;
      }
      unint64_t v3 = (MSg::_RollingWindowBudgetRule *)((char *)v3 + 80);
    }
    unint64_t v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = (void *)*((void *)v3 + 1);
      int v7 = 138412290;
      unint64_t v8 = v5;
      id v6 = v5;
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "RULE{%@} had no Budget left!", (uint8_t *)&v7, 0xCu);
    }
    return 0;
  }
  return result;
}

- (BOOL)hasBudgetLeft
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__MapsSuggestionsBudget_hasBudgetLeft__block_invoke;
  v3[3] = &unk_1E5CB89A8;
  v3[4] = self;
  return MSg::Queue::sync<BOOL>((NSObject **)&self->_queue, v3);
}

uint64_t __38__MapsSuggestionsBudget_hasBudgetLeft__block_invoke(uint64_t a1)
{
  return -[MapsSuggestionsBudget _q_hasBudgetLeft](*(void *)(a1 + 32));
}

- (uint64_t)_q_spendAtTime:(uint64_t)a1
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!a1)
  {
    unsigned int hasBudget = 0;
    goto LABEL_34;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
  unsigned int hasBudget = -[MapsSuggestionsBudget _q_hasBudgetLeft](a1);
  if (hasBudget)
  {
    uint64_t v5 = *(MSg::_RollingWindowBudgetRule **)(a1 + 32);
    uint64_t v34 = a1;
    v36 = *(MSg::_RollingWindowBudgetRule **)(a1 + 40);
    if (v5 != v36)
    {
      *(void *)&long long v4 = 136446722;
      long long v33 = v4;
      do
      {
        id v6 = v3;
        v37 = v6;
        if (v3)
        {
          int v7 = v6;
          MSg::_RollingWindowBudgetRule::_prune(v5);
          if (*((void *)v5 + 9) >= *((void *)v5 + 2))
          {
            uint64_t v19 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446978;
              v39 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBudget.mm";
              __int16 v40 = 1024;
              *(_DWORD *)v41 = 72;
              *(_WORD *)&v41[4] = 2082;
              *(void *)&v41[6] = "BOOL MSg::_RollingWindowBudgetRule::spendAt(NSDate *__strong)";
              __int16 v42 = 2082;
              v43 = "! hasBudgetLeft()";
              _os_log_impl(&dword_1A70DF000, v19, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. This is supposed to be checked beforehand. Are we running concurrently?!", buf, 0x26u);
            }
          }
          else
          {
            unint64_t v8 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v9 = (char *)*((void *)v5 + 1);
              *(_DWORD *)buf = 138412546;
              v39 = v9;
              __int16 v40 = 2112;
              *(void *)v41 = v3;
              _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "%@ spent at %@", buf, 0x16u);
            }

            std::deque<NSDate * {__strong}>::push_back((void *)v5 + 4, (id *)&v37);
            id WeakRetained = objc_loadWeakRetained((id *)v5);
            if (WeakRetained)
            {
              uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*((void *)v5 + 9)];
              uint64_t v12 = *((void *)v5 + 5);
              if (*((void *)v5 + 6) != v12)
              {
                unint64_t v13 = *((void *)v5 + 8);
                unint64_t v14 = (void *)(v12 + 8 * (v13 >> 9));
                v15 = (id *)(*v14 + 8 * (v13 & 0x1FF));
                uint64_t v16 = *(void *)(v12 + (((*((void *)v5 + 9) + v13) >> 6) & 0x3FFFFFFFFFFFFF8))
                    + 8 * ((*((void *)v5 + 9) + v13) & 0x1FF);
                while (v15 != (id *)v16)
                {
                  id v17 = *v15;
                  [v11 addObject:v17];

                  if ((id *)((char *)++v15 - *v14) == (id *)4096)
                  {
                    uint64_t v18 = (id *)v14[1];
                    ++v14;
                    v15 = v18;
                  }
                }
              }
              v44 = @"MSgRollingWindowBudgetRuleBudgetAlreadySpentKey";
              id v20 = [v11 copy];
              v45[0] = v20;
              uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1];
              uint64_t v22 = [v21 mutableCopy];

              int v23 = objc_msgSend(WeakRetained, "q_saveStateForRuleName:state:", *((void *)v5 + 1), v22);
              v24 = GEOFindOrCreateLog();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
              {
                v25 = (char *)*((void *)v5 + 1);
                *(_DWORD *)buf = 138412546;
                v39 = v25;
                __int16 v40 = 1024;
                *(_DWORD *)v41 = v23;
                _os_log_impl(&dword_1A70DF000, v24, OS_LOG_TYPE_DEBUG, "State of RULE{%@} saved with result=%d", buf, 0x12u);
              }
            }
            else
            {
              GEOFindOrCreateLog();
              uint64_t v22 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v33;
                v39 = "MapsSuggestionsBudget.mm";
                __int16 v40 = 1026;
                *(_DWORD *)v41 = 126;
                *(_WORD *)&v41[4] = 2082;
                *(void *)&v41[6] = "void MSg::_RollingWindowBudgetRule::_saveState()";
                _os_log_impl(&dword_1A70DF000, v22, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongDelegate went away in %{public}s", buf, 0x1Cu);
              }
              uint64_t v11 = v22;
            }
          }
        }
        else
        {
          int v7 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446978;
            v39 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBudget.mm";
            __int16 v40 = 1024;
            *(_DWORD *)v41 = 71;
            *(_WORD *)&v41[4] = 2082;
            *(void *)&v41[6] = "BOOL MSg::_RollingWindowBudgetRule::spendAt(NSDate *__strong)";
            __int16 v42 = 2082;
            v43 = "nil == (time)";
            _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a time. Consider -spendNow instead.", buf, 0x26u);
          }
        }

        uint64_t v5 = (MSg::_RollingWindowBudgetRule *)((char *)v5 + 80);
      }
      while (v5 != v36);
    }
    int64x2_t v26 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_33;
    }
    objc_super v27 = *(char **)(v34 + 8);
    *(_DWORD *)buf = 138412546;
    v39 = v27;
    __int16 v40 = 2112;
    *(void *)v41 = v3;
    uint64_t v28 = "%@ spent at %@";
    __int16 v29 = v26;
    uint32_t v30 = 22;
    goto LABEL_32;
  }
  int64x2_t v26 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    __int16 v31 = *(char **)(a1 + 8);
    *(_DWORD *)buf = 138412290;
    v39 = v31;
    uint64_t v28 = "%@ has no budget left";
    __int16 v29 = v26;
    uint32_t v30 = 12;
LABEL_32:
    _os_log_impl(&dword_1A70DF000, v29, OS_LOG_TYPE_DEBUG, v28, buf, v30);
  }
LABEL_33:

LABEL_34:
  return hasBudget;
}

- (BOOL)spendAtTime:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __37__MapsSuggestionsBudget_spendAtTime___block_invoke;
    v9[3] = &unk_1E5CB89D0;
    v9[4] = self;
    id v10 = v4;
    char v6 = MSg::Queue::sync<BOOL>((NSObject **)&self->_queue, v9);
  }
  else
  {
    int v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      uint64_t v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBudget.mm";
      __int16 v13 = 1024;
      int v14 = 258;
      __int16 v15 = 2082;
      uint64_t v16 = "-[MapsSuggestionsBudget spendAtTime:]";
      __int16 v17 = 2082;
      uint64_t v18 = "nil == (time)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a time. Consider -spendNow instead.", buf, 0x26u);
    }

    char v6 = 0;
  }

  return v6;
}

uint64_t __37__MapsSuggestionsBudget_spendAtTime___block_invoke(uint64_t a1)
{
  return -[MapsSuggestionsBudget _q_spendAtTime:](*(void *)(a1 + 32), *(void **)(a1 + 40));
}

- (BOOL)spendNow
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __33__MapsSuggestionsBudget_spendNow__block_invoke;
  v3[3] = &unk_1E5CB89A8;
  v3[4] = self;
  return MSg::Queue::sync<BOOL>((NSObject **)&self->_queue, v3);
}

uint64_t __33__MapsSuggestionsBudget_spendNow__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = MapsSuggestionsNow();
  uint64_t v3 = -[MapsSuggestionsBudget _q_spendAtTime:](v1, v2);

  return v3;
}

- (void)reset
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__MapsSuggestionsBudget_reset__block_invoke;
  block[3] = &unk_1E5CB85E0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)self->_queue._innerQueue, block);
}

uint64_t __30__MapsSuggestionsBudget_reset__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  v2 = *(_OWORD **)(v1 + 32);
  uint64_t v3 = *(_OWORD **)(v1 + 40);
  while (v2 != v3)
  {
    v4[0] = v2[2];
    v2[2] = 0u;
    v4[1] = v2[3];
    v2[3] = 0u;
    v4[2] = v2[4];
    v2[4] = 0u;
    uint64_t result = std::deque<NSDate * {__strong}>::~deque[abi:ne180100]((uint64_t)v4);
    v2 += 5;
  }
  return result;
}

- (id)q_loadStateForRuleName:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (char *)a3;
  if (!v4)
  {
    char v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446978;
      __int16 v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBudget.mm";
      __int16 v14 = 1024;
      *(_DWORD *)__int16 v15 = 287;
      *(_WORD *)&v15[4] = 2082;
      *(void *)&v15[6] = "-[MapsSuggestionsBudget q_loadStateForRuleName:]";
      __int16 v16 = 2082;
      __int16 v17 = "nil == (ruleName)";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a Rule name", (uint8_t *)&v12, 0x26u);
    }
    goto LABEL_15;
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue._innerQueue);
  uint64_t v5 = [(NSMutableDictionary *)self->_data objectForKeyedSubscript:self->_name];
  char v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    uint64_t v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 138412290;
      __int16 v13 = v4;
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_DEBUG, "No state found for RULE{%@}", (uint8_t *)&v12, 0xCu);
    }
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    GEOFindOrCreateLog();
    uint64_t v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      name = self->_name;
      int v12 = 138412546;
      __int16 v13 = (const char *)name;
      __int16 v14 = 2112;
      *(void *)__int16 v15 = objc_opt_class();
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "We found some invalid state for RULE{%@}, that was actually a %@?!", (uint8_t *)&v12, 0x16u);
    }

LABEL_14:
LABEL_15:
    id v8 = 0;
    goto LABEL_16;
  }
  int v7 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138412290;
    __int16 v13 = v4;
    _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "Correctly loaded state for RULE{%@}", (uint8_t *)&v12, 0xCu);
  }

  id v8 = [v6 mutableCopy];
LABEL_16:

  return v8;
}

- (BOOL)q_saveStateForRuleName:(id)a3 state:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    __int16 v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136446978;
      uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBudget.mm";
      __int16 v22 = 1024;
      int v23 = 305;
      __int16 v24 = 2082;
      v25 = "-[MapsSuggestionsBudget q_saveStateForRuleName:state:]";
      __int16 v26 = 2082;
      objc_super v27 = "nil == (ruleName)";
      uint64_t v18 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a Rule name";
LABEL_14:
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v20, 0x26u);
    }
LABEL_15:
    BOOL v17 = 0;
    goto LABEL_16;
  }
  if (!v7)
  {
    __int16 v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136446978;
      uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBudget.mm";
      __int16 v22 = 1024;
      int v23 = 306;
      __int16 v24 = 2082;
      v25 = "-[MapsSuggestionsBudget q_saveStateForRuleName:state:]";
      __int16 v26 = 2082;
      objc_super v27 = "nil == (state)";
      uint64_t v18 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a state dictionary to write";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue._innerQueue);
  data = self->_data;
  if (!data)
  {
    id v10 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    uint64_t v11 = self->_data;
    self->_data = v10;

    [(NSMutableDictionary *)self->_data setObject:&unk_1EFC897C8 forKeyedSubscript:@"MapsSuggestionsBudgetVersionKey"];
    data = self->_data;
  }
  int v12 = [(NSMutableDictionary *)data objectForKeyedSubscript:self->_name];
  __int16 v13 = [v12 mutableCopy];

  if (!v13)
  {
    __int16 v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_DEBUG, "Starting brand new state", (uint8_t *)&v20, 2u);
    }

    __int16 v13 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
  }
  __int16 v15 = (void *)[v8 copy];
  [v13 setObject:v15 forKeyedSubscript:v6];

  id v16 = [v13 copy];
  [(NSMutableDictionary *)self->_data setObject:v16 forKeyedSubscript:self->_name];

  [(MapsSuggestionsBudgetDelegate *)self->_delegate writeBudgetState:self->_data];
  BOOL v17 = 1;
LABEL_16:

  return v17;
}

- (NSString)uniqueName
{
  return self->_name;
}

- (NSString)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  int64_t v4 = self->_rules.__end_ - self->_rules.__begin_;
  uint64_t v5 = (void *)[v3 initWithCapacity:4 * ((v4 >> 2) + (v4 >> 4))];
  id v6 = [(MapsSuggestionsBudget *)self uniqueName];
  [v5 appendFormat:@"%@: [", v6];

  begin = self->_rules.__begin_;
  for (i = self->_rules.__end_; begin != i; begin = (_RollingWindowBudgetRule *)((char *)begin + 80))
  {
    MSg::_RollingWindowBudgetRule::_prune((MSg::_RollingWindowBudgetRule *)begin);
    if (*((void *)begin + 9)) {
      uint64_t v9 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"%.0fs", MapsSuggestionsSecondsSince(*(void **)(*(void *)(*((void *)begin + 5)+ ((*((void *)begin + 8) >> 6) & 0x3FFFFFFFFFFFFF8))+ 8 * (*((void *)begin + 8) & 0x1FFLL))));
    }
    else {
      uint64_t v9 = @"none";
    }
    id v10 = (void *)[[NSString alloc] initWithFormat:@"%@: count=%u oldest=%@ limit=%u/%.0fs", *((void *)begin + 1), *((void *)begin + 9), v9, *((void *)begin + 2), *((void *)begin + 3)];

    [v5 appendFormat:@"{%@}", v10];
  }
  [v5 appendString:@"]"];
  uint64_t v11 = (void *)[v5 copy];

  return (NSString *)v11;
}

- (id)nameForJSON
{
  return self->_name;
}

- (id)objectForJSON
{
  v2 = (MSg *)[(MapsSuggestionsBudget *)self isTrue];
  return MSg::jsonFor(v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_data, 0);
  begin = self->_rules.__begin_;
  if (begin)
  {
    end = self->_rules.__end_;
    uint64_t v5 = self->_rules.__begin_;
    if (end != begin)
    {
      do
        MSg::_RollingWindowBudgetRule::~_RollingWindowBudgetRule((id *)end - 10);
      while (end != begin);
      uint64_t v5 = self->_rules.__begin_;
    }
    self->_rules.__end_ = begin;
    operator delete(v5);
  }

  objc_storeStrong((id *)&self->_name, 0);
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  return self;
}

@end