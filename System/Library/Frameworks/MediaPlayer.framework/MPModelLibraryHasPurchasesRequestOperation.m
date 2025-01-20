@interface MPModelLibraryHasPurchasesRequestOperation
- (MPModelLibraryHasPurchasesRequest)request;
- (id)responseHandler;
- (void)execute;
- (void)setRequest:(id)a3;
- (void)setResponseHandler:(id)a3;
@end

@implementation MPModelLibraryHasPurchasesRequestOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

- (void)setResponseHandler:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setRequest:(id)a3
{
}

- (MPModelLibraryHasPurchasesRequest)request
{
  return self->_request;
}

- (void)execute
{
  v3 = [(MPModelLibraryHasPurchasesRequestOperation *)self request];
  v4 = [v3 modelObject];
  v5 = +[MPMediaLibraryEntityTranslator translatorForMPModelClass:objc_opt_class()];

  if (v5)
  {
    v6 = [MPMediaLibraryView alloc];
    v7 = [(MPModelLibraryHasPurchasesRequestOperation *)self request];
    v8 = [v7 mediaLibrary];
    v9 = [(MPMediaLibraryView *)v6 initWithLibrary:v8 filteringOptions:8];

    uint64_t v10 = [v5 entityClass];
    (*(void (**)(uint64_t))(*(void *)v10 + 112))(v10);
    if (v9) {
      [(MPMediaLibraryView *)v9 mlCoreView];
    }
    else {
      v12 = 0;
    }
    [v5 entityClass];
    mlcore::LibraryView::filterPredicateForEntityClass();
    if (v12) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v12);
    }
    [(MPModelLibraryHasPurchasesRequestOperation *)self request];
    [(id)objc_claimAutoreleasedReturnValue() modelObject];
    [(id)objc_claimAutoreleasedReturnValue() identifiers];
    [(id)objc_claimAutoreleasedReturnValue() library];
    [(id)objc_claimAutoreleasedReturnValue() persistentID];
    std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<long long>,std::allocator<mlcore::ComparisonPredicate<long long>>,mlcore::ModelProperty<long long> *&,mlcore::ComparisonOperator &,long long const&,mlcore::ComparisonOptions &,void>();
  }
  v11 = [(MPModelLibraryHasPurchasesRequestOperation *)self responseHandler];
  v11[2](v11, 0, 0);
}

void __53__MPModelLibraryHasPurchasesRequestOperation_execute__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  v5 = *(mlcore::EntityQueryResult **)a2;
  if (*(void *)a2)
  {
    v6 = *(std::__shared_weak_count **)(a2 + 8);
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v7 = mlcore::EntityQueryResult::entityCount(v5);
    v8 = [*(id *)(a1 + 32) responseHandler];
    ((void (**)(void, BOOL, void))v8)[2](v8, v7 != 0, 0);

    if (v6) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
  }
  else
  {
    v9 = [*(id *)(a1 + 32) responseHandler];
    ((void (**)(void, void, id))v9)[2](v9, 0, v10);
  }
}

@end