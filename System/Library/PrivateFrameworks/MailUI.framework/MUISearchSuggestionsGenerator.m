@interface MUISearchSuggestionsGenerator
+ (OS_os_log)log;
- (MUISearchSuggestionsGenerator)initWithSuggesters:(id)a3 delegate:(id)a4;
- (id)startGeneratingSuggestionsUsingPhraseManager:(id)a3;
- (uint64_t)_cancel;
- (uint64_t)_hasActiveOperationsWithRequestID:(uint64_t)a1;
- (void)_appendOperation:(uint64_t)a1;
- (void)_didProduceResult:(uint64_t)a1;
- (void)_operationDidComplete:(uint64_t)a1;
- (void)_stopGeneratingSuggestionsWithIdentifier:(uint64_t)a1;
- (void)cancel;
- (void)startPendingOperationWithID:(uint64_t)a1;
- (void)stopGeneratingSuggestionsWithIdentifier:(id)a3;
@end

@implementation MUISearchSuggestionsGenerator

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__MUISearchSuggestionsGenerator_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_15 != -1) {
    dispatch_once(&log_onceToken_15, block);
  }
  v2 = (void *)log_log_15;
  return (OS_os_log *)v2;
}

void __36__MUISearchSuggestionsGenerator_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_15;
  log_log_15 = (uint64_t)v1;
}

- (MUISearchSuggestionsGenerator)initWithSuggesters:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)MUISearchSuggestionsGenerator;
  v8 = [(MUISearchSuggestionsGenerator *)&v23 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v7);
    uint64_t v10 = [v6 copy];
    v11 = (void *)v10;
    if (v10) {
      v12 = (void *)v10;
    }
    else {
      v12 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v9->_suggesters, v12);

    uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
    cancelledOperations = v9->_cancelledOperations;
    v9->_cancelledOperations = (NSMutableArray *)v13;

    uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
    activeOperations = v9->_activeOperations;
    v9->_activeOperations = (NSMutableArray *)v15;

    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = dispatch_queue_attr_make_with_qos_class(v17, QOS_CLASS_USER_INITIATED, 0);

    v19 = dispatch_queue_attr_make_with_autorelease_frequency(v18, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);

    dispatch_queue_t v20 = dispatch_queue_create("com.apple.mobilemail.searchSuggestionsManager", v19);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v20;
  }
  return v9;
}

- (id)startGeneratingSuggestionsUsingPhraseManager:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_alloc_init(MUISearchRequestID);
  id v6 = v4;
  id v7 = v5;
  v8 = signpostLog();
  BOOL v9 = os_signpost_enabled(v8);

  if (v9)
  {
    int v10 = [v6 phraseKind];
    v11 = signpostLog();
    uint64_t v12 = [v6 signpostID];
    os_signpost_id_t v13 = v12;
    if (v10)
    {
      if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
      {
        if (v7) {
          unsigned int underlying = v7->_underlying;
        }
        else {
          unsigned int underlying = 0;
        }
        uint64_t v15 = [v6 phrase];
        *(_DWORD *)buf = 67109379;
        *(_DWORD *)&buf[4] = underlying;
        __int16 v30 = 2113;
        v31 = v15;
        _os_signpost_emit_with_name_impl(&dword_1DDCDB000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "com.apple.mail.search.suggestion.zkw.queue", "id=%{signpost.description:attribute}u text=%{private}@", buf, 0x12u);
      }
    }
    else if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      if (v7) {
        unsigned int v16 = v7->_underlying;
      }
      else {
        unsigned int v16 = 0;
      }
      v17 = [v6 phrase];
      *(_DWORD *)buf = 67109379;
      *(_DWORD *)&buf[4] = v16;
      __int16 v30 = 2113;
      v31 = v17;
      _os_signpost_emit_with_name_impl(&dword_1DDCDB000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "com.apple.mail.search.suggestion.ayt.queue", "id=%{signpost.description:attribute}u text=%{private}@", buf, 0x12u);
    }
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__MUISearchSuggestionsGenerator_startGeneratingSuggestionsUsingPhraseManager___block_invoke;
  block[3] = &unk_1E6D135F0;
  v19 = queue;
  objc_copyWeak(&v28, (id *)buf);
  dispatch_queue_t v20 = v7;
  v26 = v20;
  id v27 = v6;
  id v21 = v6;
  dispatch_async(v19, block);

  v22 = v27;
  objc_super v23 = v20;

  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);
  return v23;
}

void __78__MUISearchSuggestionsGenerator_startGeneratingSuggestionsUsingPhraseManager___block_invoke(void **a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  v2 = -[_MUISearchSuggestionsOperation initWithRequestID:phraseManager:suggestionsGenerator:]((id *)[_MUISearchSuggestionsOperation alloc], a1[4], a1[5], WeakRetained);
  -[MUISearchSuggestionsGenerator _appendOperation:]((uint64_t)WeakRetained, v2);
}

- (void)_appendOperation:(uint64_t)a1
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  v67 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 48));
    id v4 = (void **)(a1 + 24);
    if (!*(void *)(a1 + 24)) {
      goto LABEL_13;
    }
    v5 = +[MUISearchSuggestionsGenerator log];
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
LABEL_12:

      signpostEndEnqueueInterval(*v4, 1);
LABEL_13:
      objc_storeStrong((id *)(a1 + 24), a2);
      dispatch_queue_t v20 = v67;
      if (v67) {
        dispatch_queue_t v20 = (void *)v67[3];
      }
      id v21 = v20;
      uint64_t v22 = [*(id *)(a1 + 40) count];
      uint64_t v23 = v22;
      if (_throttleIntervalMilliseconds_onceToken == -1)
      {
        if (v22) {
          goto LABEL_17;
        }
      }
      else
      {
        dispatch_once(&_throttleIntervalMilliseconds_onceToken, &__block_literal_global_36);
        if (v23)
        {
LABEL_17:
          uint64_t v24 = _throttleIntervalMilliseconds_interval;
          BOOL v25 = _throttleIntervalMilliseconds_interval == 0;
          v26 = +[MUISearchSuggestionsGenerator log];
          BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_INFO);
          if (!v25)
          {
            if (v27)
            {
              id v28 = *v4;
              v29 = v28;
              if (v28 && (id v30 = v28[3]) != 0)
              {
                v62 = v30;
                int v65 = *((_DWORD *)v30 + 2);
              }
              else
              {
                v62 = 0;
                int v65 = 0;
              }
              v59 = v29;
              id v31 = *v4;
              uint64_t v32 = v31;
              if (v31) {
                v33 = (void *)*((void *)v31 + 4);
              }
              else {
                v33 = 0;
              }
              id v34 = v33;
              v35 = [v34 phrase];
              v36 = *v4;
              if (*v4) {
                v37 = (void *)v36[4];
              }
              else {
                v37 = 0;
              }
              id v38 = v37;
              v39 = v36;
              v40 = [v38 updatedSuggestion];
              *(_DWORD *)buf = 67109890;
              *(_DWORD *)&buf[4] = v65;
              __int16 v72 = 1024;
              *(_DWORD *)v73 = v24;
              *(_WORD *)&v73[4] = 2112;
              *(void *)&v73[6] = v35;
              *(_WORD *)&v73[14] = 2112;
              *(void *)&v73[16] = v40;
              _os_log_impl(&dword_1DDCDB000, v26, OS_LOG_TYPE_INFO, "Throttling search #%u for %u ms (text:'%@', suggestion: '%@').", buf, 0x22u);
            }
            goto LABEL_36;
          }
          if (!v27)
          {
LABEL_36:

            dispatch_time_t v55 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 1000000 * v24);
            *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
            objc_initWeak((id *)buf, (id)a1);
            v56 = *(void **)(a1 + 48);
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __50__MUISearchSuggestionsGenerator__appendOperation___block_invoke;
            block[3] = &unk_1E6D13618;
            v57 = v56;
            objc_copyWeak(&v70, (id *)buf);
            id v69 = v21;
            dispatch_after(v55, v57, block);

            objc_destroyWeak(&v70);
            objc_destroyWeak((id *)buf);
LABEL_39:

            goto LABEL_40;
          }
          v41 = *v4;
          v42 = v41;
          if (v41)
          {
            v43 = v41[3];
            id v44 = v43;
            if (v43)
            {
              int v66 = v43[2];
LABEL_31:
              v60 = v42;
              id v45 = *v4;
              v46 = v45;
              v63 = v44;
              if (v45) {
                v47 = (void *)*((void *)v45 + 4);
              }
              else {
                v47 = 0;
              }
              id v48 = v47;
              v49 = [v48 phrase];
              v50 = *v4;
              if (*v4) {
                v51 = (void *)v50[4];
              }
              else {
                v51 = 0;
              }
              id v52 = v51;
              v53 = v50;
              v54 = [v52 updatedSuggestion];
              *(_DWORD *)buf = 67109634;
              *(_DWORD *)&buf[4] = v66;
              __int16 v72 = 2112;
              *(void *)v73 = v49;
              *(_WORD *)&v73[8] = 2112;
              *(void *)&v73[10] = v54;
              _os_log_impl(&dword_1DDCDB000, v26, OS_LOG_TYPE_INFO, "Enqueueing search #%u (text:'%@', suggestion: '%@').", buf, 0x1Cu);

              goto LABEL_36;
            }
          }
          else
          {
            id v44 = 0;
          }
          int v66 = 0;
          goto LABEL_31;
        }
      }
      -[MUISearchSuggestionsGenerator startPendingOperationWithID:](a1, v21);
      goto LABEL_39;
    }
    id v6 = *v4;
    id v7 = v6;
    if (v6)
    {
      v8 = v6[3];
      id v9 = v8;
      if (v8)
      {
        int v64 = v8[2];
LABEL_7:
        v58 = v7;
        id v10 = *v4;
        v11 = v10;
        v61 = v9;
        if (v10) {
          uint64_t v12 = (void *)*((void *)v10 + 4);
        }
        else {
          uint64_t v12 = 0;
        }
        id v13 = v12;
        v14 = [v13 phrase];
        uint64_t v15 = *v4;
        if (*v4) {
          unsigned int v16 = (void *)v15[4];
        }
        else {
          unsigned int v16 = 0;
        }
        id v17 = v16;
        v18 = v15;
        v19 = [v17 updatedSuggestion];
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)&buf[4] = v64;
        __int16 v72 = 2112;
        *(void *)v73 = v14;
        *(_WORD *)&v73[8] = 2112;
        *(void *)&v73[10] = v19;
        _os_log_impl(&dword_1DDCDB000, v5, OS_LOG_TYPE_DEFAULT, "Cancelling search #%u, text:'%@', suggestion: '%@'", buf, 0x1Cu);

        goto LABEL_12;
      }
    }
    else
    {
      id v9 = 0;
    }
    int v64 = 0;
    goto LABEL_7;
  }
LABEL_40:
}

void __62__MUISearchSuggestionsGenerator__throttleIntervalMilliseconds__block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v1 = [v0 integerForKey:@"SearchSuggestionGeneratorThrottleInterval"];

  _throttleIntervalMilliseconds_interval = v1 & ~(v1 >> 63);
  v2 = +[MUISearchSuggestionsGenerator log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = _throttleIntervalMilliseconds_interval;
    _os_log_impl(&dword_1DDCDB000, v2, OS_LOG_TYPE_DEFAULT, "Throttle interval: %u ms", (uint8_t *)v3, 8u);
  }
}

void __50__MUISearchSuggestionsGenerator__appendOperation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[MUISearchSuggestionsGenerator startPendingOperationWithID:]((uint64_t)WeakRetained, *(void **)(a1 + 32));
}

- (void)startPendingOperationWithID:(uint64_t)a1
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 48));
    uint64_t v4 = *(void **)(a1 + 24);
    if (v4) {
      uint64_t v5 = v4[3];
    }
    else {
      uint64_t v5 = 0;
    }
    id v6 = v4;
    char v7 = [v3 isEqualToID:v5];

    if (v7)
    {
      v8 = *(id *)(a1 + 24);
      id v9 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = 0;

      [*(id *)(a1 + 40) addObject:v8];
      id v10 = +[MUISearchSuggestionsGenerator log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        if (v8)
        {
          v11 = v8[3].isa;
          if (v11) {
            int v29 = *((_DWORD *)v11 + 2);
          }
          else {
            int v29 = 0;
          }
          v33 = v11;
          Class isa = v8[4].isa;
        }
        else
        {
          int v29 = 0;
          v33 = 0;
          Class isa = 0;
        }
        id v13 = (void *)MEMORY[0x1E4F60E00];
        uint64_t v32 = isa;
        id v30 = [(objc_class *)v32 phrase];
        id v31 = objc_msgSend(v13, "partiallyRedactedStringForString:");
        if (v8) {
          Class v14 = v8[4].isa;
        }
        else {
          Class v14 = 0;
        }
        log = v10;
        id v28 = v14;
        BOOL v27 = [(objc_class *)v28 updatedSuggestion];
        if (v8)
        {
          uint64_t v15 = v8[5].isa;
          int v16 = (int)v15;
          Class v17 = v8[5].isa;
          BOOL v25 = v15;
        }
        else
        {
          int v16 = 0;
          BOOL v25 = 0;
          Class v17 = 0;
        }
        v18 = v17;
        v19 = [(objc_class *)v18 ef_map:&__block_literal_global_144];
        dispatch_queue_t v20 = [v19 componentsJoinedByString:@", "];

        id v21 = *(id *)(a1 + 40);
        id v22 = v20;
        int v23 = [v21 count];
        int v24 = [*(id *)(a1 + 32) count];
        *(_DWORD *)buf = 67110658;
        int v35 = v29;
        __int16 v36 = 2112;
        v37 = v31;
        __int16 v38 = 2112;
        v39 = v27;
        __int16 v40 = 1024;
        int v41 = v16;
        __int16 v42 = 2114;
        v43 = v20;
        __int16 v44 = 1024;
        int v45 = v23;
        __int16 v46 = 1024;
        int v47 = v24;
        id v10 = log;
        _os_log_impl(&dword_1DDCDB000, log, OS_LOG_TYPE_DEFAULT, "Starting search #%u, text '%@', suggestion: '%@', %u suggester(s): '%{public}@'. Now %u active operation(s), %u cancelled operation(s).", buf, 0x38u);
      }
      -[_MUISearchSuggestionsOperation start]((dispatch_queue_t *)v8);
    }
    else
    {
      v8 = +[MUISearchSuggestionsGenerator log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[MUISearchSuggestionsGenerator startPendingOperationWithID:]((uint64_t)v3, v8);
      }
    }
  }
}

- (void)stopGeneratingSuggestionsWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    if (self) {
      queue = self->_queue;
    }
    else {
      queue = 0;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__MUISearchSuggestionsGenerator_stopGeneratingSuggestionsWithIdentifier___block_invoke;
    block[3] = &unk_1E6D13618;
    id v6 = queue;
    objc_copyWeak(&v9, &location);
    id v8 = v4;
    dispatch_async(v6, block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __73__MUISearchSuggestionsGenerator_stopGeneratingSuggestionsWithIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[MUISearchSuggestionsGenerator _stopGeneratingSuggestionsWithIdentifier:]((uint64_t)WeakRetained, *(void **)(a1 + 32));
}

- (void)_stopGeneratingSuggestionsWithIdentifier:(uint64_t)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 48));
    if (v3)
    {
      id v4 = *(void **)(a1 + 40);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __74__MUISearchSuggestionsGenerator__stopGeneratingSuggestionsWithIdentifier___block_invoke;
      v20[3] = &unk_1E6D13640;
      uint64_t v5 = v3;
      id v21 = v5;
      id v6 = v4;
      uint64_t v7 = objc_msgSend(v6, "ef_firstObjectPassingTest:", v20);

      if (v7)
      {
        -[_MUISearchSuggestionsOperation cancel]((atomic_uchar *)v7);
        [*(id *)(a1 + 40) removeObjectIdenticalTo:v7];
        [*(id *)(a1 + 32) addObject:v7];
        id v8 = +[MUISearchSuggestionsGenerator log];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          id v9 = *(_DWORD **)(v7 + 24);
          if (v9) {
            int v18 = v9[2];
          }
          else {
            int v18 = 0;
          }
          id v10 = *(id *)(v7 + 32);
          v19 = v9;
          v11 = [v10 phrase];
          id v12 = *(id *)(v7 + 32);
          id v13 = [v12 updatedSuggestion];
          id v14 = *(id *)(a1 + 40);
          int v15 = [v14 count];
          int v16 = [*(id *)(a1 + 32) count];
          *(_DWORD *)buf = 67110146;
          int v23 = v18;
          __int16 v24 = 2112;
          BOOL v25 = v11;
          __int16 v26 = 2112;
          BOOL v27 = v13;
          __int16 v28 = 1024;
          int v29 = v15;
          __int16 v30 = 1024;
          int v31 = v16;
          _os_log_impl(&dword_1DDCDB000, v8, OS_LOG_TYPE_DEFAULT, "Cancelling search #%u, text:'%@', suggestion: '%@'. Now %u active operation(s), %u cancelled operation(s).", buf, 0x28u);
        }
      }
      else
      {
        id v8 = +[MUISearchSuggestionsGenerator log];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v17 = v5[2];
          *(_DWORD *)buf = 67109120;
          int v23 = v17;
          _os_log_impl(&dword_1DDCDB000, v8, OS_LOG_TYPE_DEFAULT, "No active search #%u. Not cancelling.", buf, 8u);
        }
      }
    }
  }
}

BOOL __74__MUISearchSuggestionsGenerator__stopGeneratingSuggestionsWithIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(id *)(a2 + 24);
    if (v3)
    {
      int v4 = v3[2];
      goto LABEL_4;
    }
  }
  else
  {
    id v3 = 0;
  }
  int v4 = 0;
LABEL_4:
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    LODWORD(v5) = *(_DWORD *)(v5 + 8);
  }
  BOOL v6 = v4 == v5;

  return v6;
}

- (void)cancel
{
  v2 = self;
  if (self) {
    self = (MUISearchSuggestionsGenerator *)self->_queue;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__MUISearchSuggestionsGenerator_cancel__block_invoke;
  block[3] = &unk_1E6D11708;
  void block[4] = v2;
  dispatch_async(&self->super, block);
  if (v2) {
    objc_storeWeak((id *)&v2->_delegate, 0);
  }
}

uint64_t __39__MUISearchSuggestionsGenerator_cancel__block_invoke(uint64_t a1)
{
  return -[MUISearchSuggestionsGenerator _cancel](*(void *)(a1 + 32));
}

- (uint64_t)_cancel
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(result + 48));
    v2 = *(void **)(v1 + 24);
    *(void *)(v1 + 24) = 0;

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v20 = v1;
    id v3 = *(id *)(v1 + 40);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v22;
      uint64_t v7 = &off_1E6D10000;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v22 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v9 = *(void *)(*((void *)&v21 + 1) + 8 * v8);
          id v10 = [v7[450] log];
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            if (v9)
            {
              id v11 = *(id *)(v9 + 24);
              id v12 = v11;
              if (v11) {
                int v13 = *((_DWORD *)v11 + 2);
              }
              else {
                int v13 = 0;
              }
              id v14 = *(void **)(v9 + 32);
            }
            else
            {
              int v13 = 0;
              id v12 = 0;
              id v14 = 0;
            }
            id v15 = v14;
            int v16 = [v15 phrase];
            *(_DWORD *)buf = 67109378;
            int v26 = v13;
            __int16 v27 = 2112;
            __int16 v28 = v16;
            _os_log_impl(&dword_1DDCDB000, v10, OS_LOG_TYPE_DEFAULT, "Cancelling search #%u, text:'%@'.", buf, 0x12u);

            uint64_t v7 = &off_1E6D10000;
          }

          -[_MUISearchSuggestionsOperation cancel]((atomic_uchar *)v9);
          ++v8;
        }
        while (v5 != v8);
        uint64_t v17 = [v3 countByEnumeratingWithState:&v21 objects:v29 count:16];
        uint64_t v5 = v17;
      }
      while (v17);
    }

    uint64_t v18 = *(void *)(v20 + 40);
    id v19 = *(id *)(v20 + 32);
    [v19 addObjectsFromArray:v18];

    return [*(id *)(v20 + 40) removeAllObjects];
  }
  return result;
}

- (void)_didProduceResult:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 48));
    uint64_t v4 = [v3 requestID];
    int v5 = -[MUISearchSuggestionsGenerator _hasActiveOperationsWithRequestID:](a1, v4);

    if (v5)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __51__MUISearchSuggestionsGenerator__didProduceResult___block_invoke;
      v10[3] = &unk_1E6D11A50;
      id v11 = v3;
      uint64_t v12 = a1;
      dispatch_async(MEMORY[0x1E4F14428], v10);
      uint64_t v6 = v11;
    }
    else
    {
      uint64_t v6 = +[MUISearchSuggestionsGenerator log];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = [v3 requestID];
        uint64_t v8 = (void *)v7;
        if (v7) {
          int v9 = *(_DWORD *)(v7 + 8);
        }
        else {
          int v9 = 0;
        }
        *(_DWORD *)buf = 67109120;
        int v14 = v9;
        _os_log_impl(&dword_1DDCDB000, v6, OS_LOG_TYPE_DEFAULT, "Search #%u did produce result, but it’s no longer active.", buf, 8u);
      }
    }
  }
}

- (uint64_t)_hasActiveOperationsWithRequestID:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    int v5 = *(void **)(a1 + 40);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __67__MUISearchSuggestionsGenerator__hasActiveOperationsWithRequestID___block_invoke;
    v7[3] = &unk_1E6D13668;
    id v8 = v3;
    a1 = [v5 indexOfObjectPassingTest:v7] != 0x7FFFFFFFFFFFFFFFLL;
  }
  return a1;
}

void __51__MUISearchSuggestionsGenerator__didProduceResult___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = +[MUISearchSuggestionsGenerator log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) requestID];
    uint64_t v4 = (void *)v3;
    if (v3) {
      int v5 = *(_DWORD *)(v3 + 8);
    }
    else {
      int v5 = 0;
    }
    uint64_t v6 = [*(id *)(a1 + 32) suggestions];
    v10[0] = 67109376;
    v10[1] = v5;
    __int16 v11 = 1024;
    int v12 = [v6 count];
    _os_log_impl(&dword_1DDCDB000, v2, OS_LOG_TYPE_DEFAULT, "Search #%u did produce result with %u suggestions.", (uint8_t *)v10, 0xEu);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v7 + 8));
    uint64_t v9 = *(void *)(a1 + 40);
  }
  else
  {
    uint64_t v9 = 0;
    id WeakRetained = 0;
  }
  [WeakRetained suggestionsGenerator:v9 didProduceResult:*(void *)(a1 + 32)];
}

BOOL __67__MUISearchSuggestionsGenerator__hasActiveOperationsWithRequestID___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v2 = *(void *)(a2 + 24);
  }
  else {
    uint64_t v2 = 0;
  }
  return v2 == *(void *)(a1 + 32);
}

- (void)_operationDidComplete:(uint64_t)a1
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 48));
    if (v3 && (unsigned __int8 v4 = atomic_load((unsigned __int8 *)v3 + 8), (v4 & 1) != 0))
    {
      int v5 = +[MUISearchSuggestionsGenerator log];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *((void *)v3 + 3);
        if (v6) {
          LODWORD(v6) = *(_DWORD *)(v6 + 8);
        }
        *(_DWORD *)buf = 67109120;
        int v12 = v6;
        _os_log_impl(&dword_1DDCDB000, v5, OS_LOG_TYPE_DEFAULT, "Search #%u did complete, but it’s cancelled.", buf, 8u);
      }
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55__MUISearchSuggestionsGenerator__operationDidComplete___block_invoke;
      block[3] = &unk_1E6D13690;
      id v8 = v3;
      uint64_t v9 = a1;
      char v10 = 0;
      dispatch_async(MEMORY[0x1E4F14428], block);
      int v5 = v8;
    }

    [*(id *)(a1 + 32) removeObjectIdenticalTo:v3];
    [*(id *)(a1 + 40) removeObjectIdenticalTo:v3];
  }
}

void __55__MUISearchSuggestionsGenerator__operationDidComplete___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[MUISearchSuggestionsGenerator log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3 && (unsigned __int8 v4 = *(id *)(v3 + 24)) != 0)
    {
      int v5 = v4[2];
    }
    else
    {
      int v5 = 0;
    }
    v11[0] = 67109120;
    v11[1] = v5;
    _os_log_impl(&dword_1DDCDB000, v2, OS_LOG_TYPE_DEFAULT, "Search #%u did complete.", (uint8_t *)v11, 8u);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v6 + 8));
    uint64_t v8 = *(void *)(a1 + 40);
  }
  else
  {
    uint64_t v8 = 0;
    id WeakRetained = 0;
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    uint64_t v10 = *(void *)(v9 + 24);
  }
  else {
    uint64_t v10 = 0;
  }
  [WeakRetained suggestionsGenerator:v8 didCompleteRequestID:v10];

  signpostEndEnqueueInterval(*(void **)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_activeOperations, 0);
  objc_storeStrong((id *)&self->_cancelledOperations, 0);
  objc_storeStrong((id *)&self->_pendingOperation, 0);
  objc_storeStrong((id *)&self->_suggesters, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)startPendingOperationWithID:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (a1) {
    int v2 = *(_DWORD *)(a1 + 8);
  }
  else {
    int v2 = 0;
  }
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_1DDCDB000, a2, OS_LOG_TYPE_DEBUG, "Not starting throttled search #%u", (uint8_t *)v3, 8u);
}

@end