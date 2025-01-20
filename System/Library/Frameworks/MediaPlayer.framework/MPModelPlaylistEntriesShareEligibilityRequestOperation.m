@interface MPModelPlaylistEntriesShareEligibilityRequestOperation
- (MPModelPlaylistEntriesShareEligibilityRequest)request;
- (id)responseHandler;
- (void)execute;
- (void)setRequest:(id)a3;
- (void)setResponseHandler:(id)a3;
@end

@implementation MPModelPlaylistEntriesShareEligibilityRequestOperation

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

- (MPModelPlaylistEntriesShareEligibilityRequest)request
{
  return self->_request;
}

- (void)execute
{
  v3 = objc_alloc_init(MPModelLibraryRequest);
  v4 = [(MPAsyncOperation *)self userIdentity];
  v5 = +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:v4];
  [(MPModelLibraryRequest *)v3 setMediaLibrary:v5];

  v6 = [MPMediaLibraryView alloc];
  v7 = [(MPModelLibraryRequest *)v3 mediaLibrary];
  [(MPMediaLibraryView *)v6 initWithLibrary:v7 filteringOptions:[(MPModelLibraryRequest *)v3 filteringOptions]];

  v9 = (mlcore *)mlcore::PlaylistItemPropertyItemPersistentID(v8);
  v10 = (ModelPropertyBase *)mlcore::ItemPropertySubscriptionStoreItemID(v9);
  MPMediaLibraryGetProperty((ModelPropertyBase *)v9, v10);
  std::allocate_shared[abi:ne180100]<mlcore::UnaryPredicate<long long>,std::allocator<mlcore::UnaryPredicate<long long>>,mlcore::ModelProperty<long long> *&,mlcore::UnaryOperator,void>();
}

void __65__MPModelPlaylistEntriesShareEligibilityRequestOperation_execute__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  if (v10 || (v8 = *(mlcore::AggregateFunctionQueryResult **)a2) == 0)
  {
    BOOL v5 = 0;
  }
  else
  {
    v9 = *(std::__shared_weak_count **)(a2 + 8);
    if (v9) {
      atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    BOOL v5 = mlcore::AggregateFunctionQueryResult::value(v8) != 0;
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 280);
  v7 = v10;
  if (v6)
  {
    (*(void (**)(uint64_t, BOOL, id))(v6 + 16))(v6, v5, v10);
    v7 = v10;
  }
}

@end