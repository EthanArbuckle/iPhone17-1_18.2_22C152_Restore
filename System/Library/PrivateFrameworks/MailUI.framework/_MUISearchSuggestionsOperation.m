@interface _MUISearchSuggestionsOperation
- (id)_runningSuggesterNames;
- (id)_startQueryForSuggester:(dispatch_queue_t *)a1;
- (id)initWithRequestID:(void *)a3 phraseManager:(void *)a4 suggestionsGenerator:;
- (void)_asyncCompleteSuggester:(void *)a1;
- (void)_didCompleteAllSuggesters;
- (void)_suggester:(void *)a3 didCompleteWithSuggestions:;
- (void)cancel;
- (void)start;
- (void)suggester:(void *)a3 producedSuggestions:;
@end

@implementation _MUISearchSuggestionsOperation

- (id)initWithRequestID:(void *)a3 phraseManager:(void *)a4 suggestionsGenerator:
{
  id v8 = a2;
  id v9 = a3;
  v10 = a4;
  if (a1)
  {
    v20.receiver = a1;
    v20.super_class = (Class)_MUISearchSuggestionsOperation;
    v11 = (id *)objc_msgSendSuper2(&v20, sel_init);
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 3, a2);
      objc_storeStrong(a1 + 4, a3);
      if (v10) {
        v12 = (void *)v10[2];
      }
      else {
        v12 = 0;
      }
      id v13 = v12;
      uint64_t v14 = [v13 copy];
      id v15 = a1[5];
      a1[5] = (id)v14;

      uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
      id v17 = a1[6];
      a1[6] = (id)v16;

      objc_storeWeak(a1 + 2, v10);
      if (v10) {
        v18 = (void *)v10[6];
      }
      else {
        v18 = 0;
      }
      objc_storeStrong(a1 + 7, v18);
    }
  }

  return a1;
}

- (void)start
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v4 = *(_DWORD **)(a1 + 24);
  if (v4) {
    int v5 = v4[2];
  }
  else {
    int v5 = 0;
  }
  id v6 = *(id *)(a1 + 48);
  v7 = v4;
  int v8 = [v6 count];
  id v9 = -[_MUISearchSuggestionsOperation _runningSuggesterNames]((dispatch_queue_t *)a1);
  v10[0] = 67109634;
  v10[1] = v5;
  __int16 v11 = 1024;
  int v12 = v8;
  __int16 v13 = 2114;
  uint64_t v14 = v9;
  _os_log_debug_impl(&dword_1DDCDB000, a2, OS_LOG_TYPE_DEBUG, "Search #%u, %u suggester(s) ('%{public}@') running async.", (uint8_t *)v10, 0x18u);
}

- (void)cancel
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1 && (atomic_fetch_or(a1 + 8, 1u) & 1) == 0)
  {
    v1 = a1;
    v2 = signpostLog();
    BOOL v3 = os_signpost_enabled(v2);

    if (!v3)
    {
LABEL_17:

      __int16 v13 = *((void *)v1 + 7);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __40___MUISearchSuggestionsOperation_cancel__block_invoke;
      block[3] = &unk_1E6D11708;
      block[4] = v1;
      dispatch_async(v13, block);
      return;
    }
    int v4 = [*((id *)v1 + 4) phraseKind];
    int v5 = signpostLog();
    uint64_t v6 = [*((id *)v1 + 4) signpostID];
    os_signpost_id_t v7 = v6;
    if (v4)
    {
      if ((unint64_t)(v6 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v5)) {
        goto LABEL_16;
      }
      int v8 = *((id *)v1 + 3);
      if (v8)
      {
        int v9 = v8[2];
      }
      else
      {
        int v9 = 0;
      }
      *(_DWORD *)buf = 67109120;
      int v16 = v9;
      v10 = "com.apple.mail.search.suggestion.zkw.cancel";
    }
    else
    {
      if ((unint64_t)(v6 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v5)) {
        goto LABEL_16;
      }
      __int16 v11 = *((id *)v1 + 3);
      if (v11)
      {
        int v12 = v11[2];
      }
      else
      {
        int v12 = 0;
      }
      *(_DWORD *)buf = 67109120;
      int v16 = v12;
      v10 = "com.apple.mail.search.suggestion.ayt.cancel";
    }
    _os_signpost_emit_with_name_impl(&dword_1DDCDB000, v5, OS_SIGNPOST_EVENT, v7, v10, "Cancelled id=%{signpost.description:attribute}u", buf, 8u);
LABEL_16:

    goto LABEL_17;
  }
}

- (id)_startQueryForSuggester:(dispatch_queue_t *)a1
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(a1[7]);
    int v4 = a1[7];
    int v5 = a1;
    id v6 = v3;
    os_signpost_id_t v7 = signpostLog();
    BOOL v8 = os_signpost_enabled(v7);

    if (v8)
    {
      int v9 = signpostLog();
      v10 = (char *)os_signpost_id_generate(v9);

      int v11 = [v5[4] phraseKind];
      int v12 = signpostLog();
      __int16 v13 = v12;
      if (v11)
      {
        if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
        {
          uint64_t v14 = v5[3];
          if (v14) {
            int v15 = v14[2];
          }
          else {
            int v15 = 0;
          }
          int v16 = v14;
          uint64_t v17 = [v6 logIdentifier];
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&uint8_t buf[4] = v15;
          __int16 v33 = 2114;
          v34 = v17;
          _os_signpost_emit_with_name_impl(&dword_1DDCDB000, v13, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v10, "com.apple.mail.search.suggestion.zkw.suggester", "id=%{signpost.description:attribute}u suggester=%{signpost.description:attribute,public}@", buf, 0x12u);
        }
      }
      else if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        v19 = v5[3];
        if (v19) {
          int v20 = v19[2];
        }
        else {
          int v20 = 0;
        }
        v21 = v19;
        v22 = [v6 logIdentifier];
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = v20;
        __int16 v33 = 2114;
        v34 = v22;
        _os_signpost_emit_with_name_impl(&dword_1DDCDB000, v13, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v10, "com.apple.mail.search.suggestion.ayt.suggester", "id=%{signpost.description:attribute}u suggester=%{signpost.description:attribute,public}@", buf, 0x12u);
      }
      unint64_t v18 = [v5[4] phraseKind];
    }
    else
    {
      unint64_t v18 = 0;
      v10 = 0;
    }

    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, v5);
    v23 = v5[4];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __58___MUISearchSuggestionsOperation__startQueryForSuggester___block_invoke;
    v29[3] = &unk_1E6D136B8;
    v31[1] = (id)v18;
    v31[2] = v10;
    v29[4] = v4;
    objc_copyWeak(v31, (id *)buf);
    id v24 = v6;
    id v30 = v24;
    v25 = [v24 generateSuggestionsUsingPhraseManager:v23 handler:v29];

    v26 = v5[6];
    v27 = [MEMORY[0x1E4F60DF0] pairWithFirst:v24 second:v25];
    [v26 addObject:v27];

    objc_destroyWeak(v31);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (void)_asyncCompleteSuggester:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, a1);
    int v4 = (void *)a1[7];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58___MUISearchSuggestionsOperation__asyncCompleteSuggester___block_invoke;
    block[3] = &unk_1E6D13618;
    int v5 = v4;
    objc_copyWeak(&v8, &location);
    id v7 = v3;
    dispatch_async(v5, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (id)_runningSuggesterNames
{
  v1 = (id *)a1;
  if (a1)
  {
    dispatch_assert_queue_V2(a1[7]);
    v2 = objc_msgSend(v1[6], "ef_map:", &__block_literal_global_111);
    v1 = [v2 componentsJoinedByString:@", "];
  }
  return v1;
}

- (void)_suggester:(void *)a3 didCompleteWithSuggestions:
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    if (v6) {
      -[_MUISearchSuggestionsOperation suggester:producedSuggestions:](a1, v5, v6);
    }
    id v7 = *(void **)(a1 + 48);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __72___MUISearchSuggestionsOperation__suggester_didCompleteWithSuggestions___block_invoke;
    v35[3] = &unk_1E6D13700;
    id v8 = v5;
    id v36 = v8;
    uint64_t v9 = [v7 indexOfObjectPassingTest:v35];
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (![v6 count])
      {
LABEL_27:

        goto LABEL_28;
      }
      v10 = +[MUISearchSuggestionsGenerator log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = *(_DWORD **)(a1 + 24);
        if (v11) {
          int v12 = v11[2];
        }
        else {
          int v12 = 0;
        }
        __int16 v13 = v11;
        uint64_t v14 = [v8 logIdentifier];
        int v15 = [v6 count];
        *(_DWORD *)buf = 67109634;
        int v38 = v12;
        __int16 v39 = 2114;
        v40 = v14;
        __int16 v41 = 1024;
        LODWORD(v42) = v15;
        _os_log_error_impl(&dword_1DDCDB000, v10, OS_LOG_TYPE_ERROR, "Search #%u suggester '%{public}@' did produce %u suggestions but it is no longer running. Ignoring.", buf, 0x18u);
      }
    }
    else
    {
      uint64_t v16 = v9;
      uint64_t v17 = [*(id *)(a1 + 48) objectAtIndexedSubscript:v9];
      unint64_t v18 = [v17 second];

      if (v18)
      {
        v19 = +[MUISearchSuggestionsGenerator log];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = *(_DWORD **)(a1 + 24);
          if (v20) {
            int v21 = v20[2];
          }
          else {
            int v21 = 0;
          }
          v22 = v20;
          v23 = [v8 logIdentifier];
          *(_DWORD *)buf = 67109378;
          int v38 = v21;
          __int16 v39 = 2114;
          v40 = v23;
          _os_log_impl(&dword_1DDCDB000, v19, OS_LOG_TYPE_DEFAULT, "Search #%u completed async suggester '%{public}@'.", buf, 0x12u);
        }
      }
      [*(id *)(a1 + 48) removeObjectAtIndex:v16];
      uint64_t v24 = [*(id *)(a1 + 48) count];
      v10 = +[MUISearchSuggestionsGenerator log];
      BOOL v25 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (!v24)
      {
        if (v25)
        {
          v31 = *(_DWORD **)(a1 + 24);
          if (v31) {
            int v32 = v31[2];
          }
          else {
            int v32 = 0;
          }
          __int16 v33 = v31;
          v34 = [v8 logIdentifier];
          *(_DWORD *)buf = 67109378;
          int v38 = v32;
          __int16 v39 = 2114;
          v40 = v34;
          _os_log_impl(&dword_1DDCDB000, v10, OS_LOG_TYPE_DEFAULT, "Search #%u did complete suggester '%{public}@'. All suggesters done.", buf, 0x12u);
        }
        -[_MUISearchSuggestionsOperation _didCompleteAllSuggesters](a1);
        goto LABEL_27;
      }
      if (v25)
      {
        v26 = *(_DWORD **)(a1 + 24);
        if (v26) {
          int v27 = v26[2];
        }
        else {
          int v27 = 0;
        }
        v28 = v26;
        v29 = [v8 logIdentifier];
        id v30 = -[_MUISearchSuggestionsOperation _runningSuggesterNames]((dispatch_queue_t *)a1);
        *(_DWORD *)buf = 67109890;
        int v38 = v27;
        __int16 v39 = 2114;
        v40 = v29;
        __int16 v41 = 2114;
        v42 = v30;
        __int16 v43 = 1024;
        int v44 = v24;
        _os_log_impl(&dword_1DDCDB000, v10, OS_LOG_TYPE_DEFAULT, "Search #%u did complete suggester '%{public}@'. '%{public}@' (%u) remaining.", buf, 0x22u);
      }
    }

    goto LABEL_27;
  }
LABEL_28:
}

- (void)suggester:(void *)a3 producedSuggestions:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    id v7 = +[MUISearchSuggestionsGenerator log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = *(_DWORD **)(a1 + 24);
      if (v8) {
        int v9 = v8[2];
      }
      else {
        int v9 = 0;
      }
      v10 = v8;
      int v11 = [v5 logIdentifier];
      v19[0] = 67109634;
      v19[1] = v9;
      __int16 v20 = 2114;
      int v21 = v11;
      __int16 v22 = 1024;
      int v23 = [v6 count];
      _os_log_impl(&dword_1DDCDB000, v7, OS_LOG_TYPE_DEFAULT, "Search #%u suggester '%{public}@' produced %u suggestions.", (uint8_t *)v19, 0x18u);
    }
    int v12 = [MUISearchResult alloc];
    __int16 v13 = [v5 categories];
    uint64_t v14 = *(void **)(a1 + 24);
    id v15 = *(id *)(a1 + 32);
    id v16 = v14;
    uint64_t v17 = -[MUISearchResult initWithSuggestions:categories:requestID:phraseKind:]((id *)&v12->super.isa, v6, v13, v16, [v15 phraseKind]);

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    -[MUISearchSuggestionsGenerator _didProduceResult:]((uint64_t)WeakRetained, v17);
  }
}

- (void)_didCompleteAllSuggesters
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    unsigned __int8 v2 = atomic_load((unsigned __int8 *)(a1 + 8));
    id v3 = +[MUISearchSuggestionsGenerator log];
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    if (v2)
    {
      if (v4)
      {
        uint64_t v5 = *(void *)(a1 + 24);
        if (v5) {
          LODWORD(v5) = *(_DWORD *)(v5 + 8);
        }
        int v9 = 67109120;
        int v10 = v5;
        id v6 = "Cancelled search #%u did complete all suggesters.";
LABEL_11:
        _os_log_impl(&dword_1DDCDB000, v3, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, 8u);
      }
    }
    else if (v4)
    {
      uint64_t v7 = *(void *)(a1 + 24);
      if (v7) {
        LODWORD(v7) = *(_DWORD *)(v7 + 8);
      }
      int v9 = 67109120;
      int v10 = v7;
      id v6 = "Search #%u did complete all suggesters.";
      goto LABEL_11;
    }

    signpostEndRunInterval((void *)a1, v2 & 1);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    -[MUISearchSuggestionsGenerator _operationDidComplete:]((uint64_t)WeakRetained, (void *)a1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_runningSuggesters, 0);
  objc_storeStrong((id *)&self->_suggesters, 0);
  objc_storeStrong((id *)&self->_phraseManager, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_destroyWeak((id *)&self->_generator);
}

@end