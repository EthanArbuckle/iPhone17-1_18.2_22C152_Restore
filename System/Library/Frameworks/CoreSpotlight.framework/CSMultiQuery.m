@interface CSMultiQuery
@end

@implementation CSMultiQuery

void __51___CSMultiQuery_initWithQueries_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v6)
  {
    v4 = [*(id *)(*(void *)(a1 + 32) + 56) objectAtIndexedSubscript:*(void *)(a1 + 48)];
    [v4 setError:v6];
  }
  else
  {
    uint64_t v5 = [WeakRetained foundItemCount];
    v4 = [*(id *)(*(void *)(a1 + 32) + 56) objectAtIndexedSubscript:*(void *)(a1 + 48)];
    [v4 setCount:v5];
  }

  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 16));
}

void __22___CSMultiQuery_start__block_invoke(uint64_t a1)
{
  v2 = *(id *)(a1 + 32);
  v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_18D0E3000, v3, OS_SIGNPOST_INTERVAL_END, v4, "CSMultiQuery", (const char *)&unk_18D1D2AFF, v7, 2u);
  }

  uint64_t v5 = (void (**)(void *, void))_Block_copy(*(const void **)(*(void *)(a1 + 40) + 32));
  v5[2](v5, *(void *)(*(void *)(a1 + 40) + 56));
  uint64_t v6 = *(void *)(a1 + 40);
  if (*(void (***)(void *, void))(v6 + 32) == v5)
  {
    *(void *)(v6 + 32) = 0;
  }
}

void __41___CSMultiQuery_startSimpleQueryAtIndex___block_invoke(uint64_t a1, int a2, unsigned int a3)
{
  uint64_t v4 = a2 & a3;
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 56) objectAtIndexedSubscript:*(void *)(a1 + 40)];
  [v5 setCount:v4];

  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 16);

  dispatch_group_leave(v6);
}

void __90___CSMultiQuery_countingQueryWithPeopleSuggestions_filterQuery_context_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [NSString stringWithFormat:@"\"%@\"", a2];
  [v2 addObject:v3];
}

@end