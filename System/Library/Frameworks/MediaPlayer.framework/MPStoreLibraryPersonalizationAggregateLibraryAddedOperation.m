@interface MPStoreLibraryPersonalizationAggregateLibraryAddedOperation
@end

@implementation MPStoreLibraryPersonalizationAggregateLibraryAddedOperation

void __71___MPStoreLibraryPersonalizationAggregateLibraryAddedOperation_execute__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  v5 = *(mlcore::AggregateFunctionQueryResult **)a2;
  if (*(void *)a2)
  {
    v6 = *(std::__shared_weak_count **)(a2 + 8);
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v5 = (mlcore::AggregateFunctionQueryResult *)mlcore::AggregateFunctionQueryResult::value(v5);
  }
  else
  {
    v6 = 0;
  }
  v7 = *(void **)(a1 + 32);
  uint64_t v8 = v7[35];
  if (v8)
  {
    (*(void (**)(uint64_t, BOOL))(v8 + 16))(v8, v5 == (mlcore::AggregateFunctionQueryResult *)((uint64_t)(v7[37] - v7[36]) >> 3));
    v7 = *(void **)(a1 + 32);
  }
  [v7 finish];
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

@end