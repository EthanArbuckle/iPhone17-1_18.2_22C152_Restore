@interface MPModelLibraryKeepLocalStatusRequestOperation
- (MPMediaLibraryView)libraryView;
- (MPModelObject)identifyingModelObject;
- (NSNumber)redownloadableItemCount;
- (id).cxx_construct;
- (id)downloadablePlaylistItemEntityQueryBlock;
- (id)responseHandler;
- (int64_t)enableState;
- (shared_ptr<mlcore::EntityQuery>)downloadableItemsQuery;
- (void)execute;
- (void)setDownloadableItemsQuery:(shared_ptr<mlcore::EntityQuery>)a3;
- (void)setDownloadablePlaylistItemEntityQueryBlock:(id)a3;
- (void)setEnableState:(int64_t)a3;
- (void)setIdentifyingModelObject:(id)a3;
- (void)setLibraryView:(id)a3;
- (void)setRedownloadableItemCount:(id)a3;
- (void)setResponseHandler:(id)a3;
@end

@implementation MPModelLibraryKeepLocalStatusRequestOperation

- (id).cxx_construct
{
  *((void *)self + 40) = 0;
  *((void *)self + 41) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_downloadableItemsQuery.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_redownloadableItemCount, 0);
  objc_storeStrong((id *)&self->_libraryView, 0);
  objc_storeStrong((id *)&self->_identifyingModelObject, 0);

  objc_storeStrong(&self->_downloadablePlaylistItemEntityQueryBlock, 0);
}

- (void)setResponseHandler:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setRedownloadableItemCount:(id)a3
{
}

- (NSNumber)redownloadableItemCount
{
  return self->_redownloadableItemCount;
}

- (void)setLibraryView:(id)a3
{
}

- (MPMediaLibraryView)libraryView
{
  return self->_libraryView;
}

- (void)setIdentifyingModelObject:(id)a3
{
}

- (MPModelObject)identifyingModelObject
{
  return self->_identifyingModelObject;
}

- (void)setEnableState:(int64_t)a3
{
  self->_enableState = a3;
}

- (int64_t)enableState
{
  return self->_enableState;
}

- (void)setDownloadablePlaylistItemEntityQueryBlock:(id)a3
{
}

- (id)downloadablePlaylistItemEntityQueryBlock
{
  return self->_downloadablePlaylistItemEntityQueryBlock;
}

- (void)setDownloadableItemsQuery:(shared_ptr<mlcore::EntityQuery>)a3
{
  p_downloadableItemsQuery = &self->_downloadableItemsQuery;
  v5 = *(EntityQuery **)a3.__ptr_;
  uint64_t v4 = *((void *)a3.__ptr_ + 1);
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_downloadableItemsQuery.__cntrl_;
  p_downloadableItemsQuery->__ptr_ = v5;
  p_downloadableItemsQuery->__cntrl_ = (__shared_weak_count *)v4;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (shared_ptr<mlcore::EntityQuery>)downloadableItemsQuery
{
  cntrl = self->_downloadableItemsQuery.__cntrl_;
  *v2 = self->_downloadableItemsQuery.__ptr_;
  v2[1] = (EntityQuery *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (EntityQuery *)self;
  return result;
}

- (void)execute
{
  libraryView = self->_libraryView;
  if (!libraryView)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"MPModelLibraryKeepLocalStatusRequestOperation.mm" lineNumber:30 description:@"Library view must not be nil."];

    libraryView = self->_libraryView;
  }
  v5 = [(MPMediaLibraryView *)libraryView library];
  v6 = [v5 uniqueIdentifier];

  ptr = self->_downloadableItemsQuery.__ptr_;
  if (ptr)
  {
    mlcore::Query::predicate(&v19, (mlcore::Query *)ptr);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3321888768;
    v33[2] = __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke;
    v33[3] = &unk_1EE673A48;
    uint64_t v35 = v19;
    v36 = v20;
    if (v20) {
      atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v33[4] = self;
    id v34 = v6;
    v8 = (void (**)(void, void))MEMORY[0x19971E0F0](v33);
    redownloadableItemCount = self->_redownloadableItemCount;
    if (redownloadableItemCount)
    {
      v8[2](v8, [(NSNumber *)redownloadableItemCount longValue]);
    }
    else
    {
      uint64_t v12 = MEMORY[0x19971D490]();
      std::allocate_shared[abi:ne180100]<mlcore::AggregateFunctionQuery,std::allocator<mlcore::AggregateFunctionQuery>,mlcore::EntityClass *,mlcore::AggregateFunctionQuery::AggregateFunction,decltype(nullptr),std::shared_ptr<mlcore::Predicate> &,void>(&v21, v12, 0, v19, v20);
      v13 = self->_libraryView;
      v14 = v22;
      uint64_t v31 = v21;
      v32 = v22;
      if (v22) {
        atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_12;
      v29[3] = &unk_1E57F0350;
      v30 = v8;
      [(MPMediaLibraryView *)v13 performCoreQuery:&v31 withCompletion:v29];
      if (v32) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v32);
      }

      if (v14) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v14);
      }
    }

    if (v36) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v36);
    }
    if (v20) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v20);
    }
  }
  else if (self->_downloadablePlaylistItemEntityQueryBlock)
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_2_13;
    v27[3] = &unk_1E57F03E8;
    v27[4] = self;
    id v28 = v6;
    v10 = (void (**)(void, void))MEMORY[0x19971E0F0](v27);
    v11 = self->_redownloadableItemCount;
    if (v11)
    {
      v10[2](v10, [(NSNumber *)v11 longValue]);
    }
    else
    {
      (*((void (**)(uint64_t *__return_ptr))self->_downloadablePlaylistItemEntityQueryBlock + 2))(&v19);
      v17 = self->_libraryView;
      uint64_t v25 = v19;
      v26 = v20;
      if (v20) {
        atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_9;
      v23[3] = &unk_1E57F0350;
      v24 = v10;
      [(MPMediaLibraryView *)v17 performCoreQuery:&v25 withCompletion:v23];
      if (v26) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v26);
      }

      if (v20) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v20);
      }
    }
  }
  else
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"MPModelLibraryKeepLocalStatusRequestOperation.mm" lineNumber:293 description:@"Invalid creation options for MPModelLibraryKeepLocalStatusRequestOperation. downloadableItemsQuery or downloadablePlaylistItemEntityQueryBlock  must be specified"];

    id responseHandler = self->_responseHandler;
    if (responseHandler) {
      (*((void (**)(id, void, void))responseHandler + 2))(responseHandler, 0, 0);
    }
    [(MPAsyncOperation *)self finishWithError:0];
  }
}

void __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    if (a2 > 0x96)
    {
      uint64_t v21 = (mlcore *)MEMORY[0x19971D490]();
      uint64_t v22 = *(void *)(a1 + 56);
      uint64_t v35 = *(void *)(a1 + 48);
      uint64_t v36 = v22;
      if (v22) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v22 + 8), 1uLL, memory_order_relaxed);
      }
      mlcore::ItemPropertyKeepLocalStatus(v21);
      std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<int>,std::allocator<mlcore::ComparisonPredicate<int>>,mlcore::ModelProperty<int> *&,mlcore::ComparisonOperator &,int const&,mlcore::ComparisonOptions &,void>();
    }
    uint64_t v4 = MEMORY[0x19971D490]();
    v5 = (std::__shared_weak_count *)operator new(0x80uLL);
    v6 = v5;
    v5->__shared_owners_ = 0;
    v5->__shared_weak_owners_ = 0;
    v5->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EE6732B0;
    v7 = &v5[1].__vftable;
    v8 = *(std::__shared_weak_count **)(a1 + 56);
    uint64_t v33 = *(void *)(a1 + 48);
    id v34 = v8;
    if (v8) {
      atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    MEMORY[0x19971BFD0](&v5[1], v4, &v33);
    v9 = (mlcore *)v34;
    if (v34) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v34);
    }
    v10 = (mlcore *)mlcore::ItemPropertyPersistentID(v9);
    v11 = (mlcore *)mlcore::ItemPropertyStoreID(v10);
    uint64_t v12 = (mlcore *)mlcore::ItemPropertySubscriptionStoreItemID(v11);
    HasNonPurgeableAsset = (mlcore *)mlcore::ItemPropertyHasNonPurgeableAsset(v12);
    uint64_t v14 = mlcore::ItemPropertyKeepLocalStatus(HasNonPurgeableAsset);
    v15 = operator new(0x28uLL);
    uint64_t v31 = v15 + 5;
    v32 = v15 + 5;
    void *v15 = v10;
    v15[1] = v11;
    v15[2] = v12;
    v15[3] = HasNonPurgeableAsset;
    v15[4] = v14;
    v30 = v15;
    mlcore::PropertiesQuery::setPropertiesToFetch();
    if (v30)
    {
      uint64_t v31 = v30;
      operator delete(v30);
    }
    v16 = *(void **)(*(void *)(a1 + 32) + 296);
    id v28 = v7;
    v29 = v6;
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_2;
    v24[3] = &unk_1E57F0300;
    id v17 = *(id *)(a1 + 40);
    uint64_t v18 = *(void *)(a1 + 32);
    id v25 = v17;
    uint64_t v26 = v18;
    unint64_t v27 = a2;
    [v16 performCoreQuery:&v28 withCompletion:v24];
    if (v29) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v29);
    }

    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  else
  {
    v23 = objc_alloc_init(MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration);
    [(MPLibraryKeepLocalStatusObserverConfiguration *)v23 setEnableState:*(void *)(*(void *)(a1 + 32) + 280)];
    [(MPLibraryKeepLocalStatusObserverConfiguration *)v23 setIdentifyingModelObject:*(void *)(*(void *)(a1 + 32) + 288)];
    uint64_t v19 = *(void **)(a1 + 32);
    uint64_t v20 = v19[39];
    if (v20)
    {
      (*(void (**)(void, MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration *, void))(v20 + 16))(v19[39], v23, 0);
      uint64_t v19 = *(void **)(a1 + 32);
    }
    [v19 finish];
  }
}

void __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_12(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  v5 = *(mlcore::AggregateFunctionQueryResult **)a2;
  if (*(void *)a2)
  {
    v6 = *(std::__shared_weak_count **)(a2 + 8);
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    mlcore::AggregateFunctionQueryResult::value(v5);
    if (v6) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_2_13(uint64_t a1, unint64_t a2)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    if (a2 > 0x96)
    {
      (*(void (**)(mlcore::Query **__return_ptr))(*(void *)(*(void *)(a1 + 32) + 272) + 16))(&v31);
      uint64_t v26 = (mlcore *)mlcore::Query::predicate(&v30, v31);
      unint64_t v27 = (mlcore *)mlcore::PlaylistItemPropertyItemPersistentID(v26);
      id v28 = (ModelPropertyBase *)mlcore::ItemPropertyKeepLocalStatus(v27);
      MPMediaLibraryGetProperty((ModelPropertyBase *)v27, v28);
      std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<int>,std::allocator<mlcore::ComparisonPredicate<int>>,mlcore::ModelProperty<int> *&,mlcore::ComparisonOperator &,int const&,mlcore::ComparisonOptions &,void>();
    }
    uint64_t v4 = (mlcore *)(*(void *(**)(uint64_t *__return_ptr))(*(void *)(*(void *)(a1 + 32) + 272) + 16))(&v46);
    v5 = (mlcore *)mlcore::PlaylistItemPropertyItemPersistentID(v4);
    v6 = (ModelPropertyBase *)mlcore::ItemPropertyPersistentID(v5);
    Property = (mlcore *)MPMediaLibraryGetProperty((ModelPropertyBase *)v5, v6);
    v8 = (mlcore *)mlcore::PlaylistItemPropertyItemPersistentID(Property);
    v9 = (ModelPropertyBase *)mlcore::ItemPropertyStoreID(v8);
    v10 = (mlcore *)MPMediaLibraryGetProperty((ModelPropertyBase *)v8, v9);
    v11 = (mlcore *)mlcore::PlaylistItemPropertyItemPersistentID(v10);
    uint64_t v12 = (ModelPropertyBase *)mlcore::ItemPropertySubscriptionStoreItemID(v11);
    v13 = (mlcore *)MPMediaLibraryGetProperty((ModelPropertyBase *)v11, v12);
    uint64_t v14 = (mlcore *)mlcore::PlaylistItemPropertyItemPersistentID(v13);
    HasNonPurgeableAsset = (ModelPropertyBase *)mlcore::ItemPropertyHasNonPurgeableAsset(v14);
    v16 = (mlcore *)MPMediaLibraryGetProperty((ModelPropertyBase *)v14, HasNonPurgeableAsset);
    id v17 = (mlcore *)mlcore::PlaylistItemPropertyItemPersistentID(v16);
    uint64_t v18 = (ModelPropertyBase *)mlcore::ItemPropertyKeepLocalStatus(v17);
    uint64_t v19 = MPMediaLibraryGetProperty((ModelPropertyBase *)v17, v18);
    uint64_t v20 = operator new(0x28uLL);
    v44 = v20 + 5;
    v45 = v20 + 5;
    void *v20 = Property;
    v20[1] = v10;
    v20[2] = v13;
    v20[3] = v16;
    v20[4] = v19;
    v43 = v20;
    mlcore::PropertiesQuery::setPropertiesToFetch();
    if (v43)
    {
      v44 = v43;
      operator delete(v43);
    }
    uint64_t v21 = *(void **)(*(void *)(a1 + 32) + 296);
    uint64_t v41 = v46;
    v42 = v47;
    if (v47) {
      atomic_fetch_add_explicit(&v47->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_3_14;
    v32[3] = &unk_1E57F03C0;
    uint64_t v35 = v16;
    uint64_t v36 = v19;
    id v22 = *(id *)(a1 + 40);
    uint64_t v37 = Property;
    v38 = v10;
    uint64_t v23 = *(void *)(a1 + 32);
    id v33 = v22;
    uint64_t v34 = v23;
    v39 = v13;
    unint64_t v40 = a2;
    [v21 performCoreQuery:&v41 withCompletion:v32];
    if (v42) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v42);
    }

    if (v47) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v47);
    }
  }
  else
  {
    v29 = objc_alloc_init(MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration);
    [(MPLibraryKeepLocalStatusObserverConfiguration *)v29 setEnableState:*(void *)(*(void *)(a1 + 32) + 280)];
    [(MPLibraryKeepLocalStatusObserverConfiguration *)v29 setIdentifyingModelObject:*(void *)(*(void *)(a1 + 32) + 288)];
    v24 = *(void **)(a1 + 32);
    uint64_t v25 = v24[39];
    if (v25)
    {
      (*(void (**)(void, MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration *, void))(v25 + 16))(v24[39], v29, 0);
      v24 = *(void **)(a1 + 32);
    }
    [v24 finish];
  }
}

void __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_9(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  v5 = *(mlcore::EntityQueryResult **)a2;
  if (*(void *)a2)
  {
    v6 = *(std::__shared_weak_count **)(a2 + 8);
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    mlcore::EntityQueryResult::entityCount(v5);
    if (v6) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_3_14(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = *(mlcore::EntityQueryResult **)a2;
  if (*(void *)a2)
  {
    id v7 = *(std::__shared_weak_count **)(a2 + 8);
    if (v7) {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v30 = v7;
    id v31 = v5;
    mlcore::EntityQueryResult::allEntities(&v40, v6);
    uint64_t v9 = v40;
    uint64_t v8 = v41;
    if (v40 != v41)
    {
      id v10 = 0;
      uint64_t v11 = 0;
      v32 = v35;
      uint64_t v33 = 0;
      while (1)
      {
        uint64_t v12 = *(mlcore::Entity **)v9;
        v13 = *(std::__shared_weak_count **)(v9 + 8);
        if (v13) {
          atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        uint64_t v14 = (int8x8_t *)mlcore::Entity::propertyCache(v12);
        v15 = MPMediaLibraryPropertyCacheValueForProperty(*(ModelPropertyBase **)(a1 + 48), v14);
        int v16 = [v15 BOOLValue];

        if (!v16) {
          break;
        }
        ++v33;
        ++v11;
        if (v13) {
          goto LABEL_10;
        }
LABEL_11:
        v9 += 16;
        if (v9 == v8) {
          goto LABEL_23;
        }
      }
      id v17 = MPMediaLibraryPropertyCacheValueForProperty(*(ModelPropertyBase **)(a1 + 56), v14);
      int v18 = [v17 intValue];

      if (v18 > 0) {
        ++v11;
      }
      uint64_t v19 = [MPIdentifierSet alloc];
      uint64_t v20 = [@"LibraryKeepLocal-" stringByAppendingString:*(void *)(a1 + 32)];
      uint64_t v21 = +[MPModelPlaylistEntryKind identityKind];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v35[0] = __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_4_20;
      v35[1] = &unk_1E57F0398;
      id v22 = *(id *)(a1 + 32);
      uint64_t v23 = *(void *)(a1 + 64);
      id v36 = v22;
      uint64_t v37 = v23;
      v38 = v14;
      long long v39 = *(_OWORD *)(a1 + 72);
      v24 = [(MPIdentifierSet *)v19 initWithSource:v20 modelKind:v21 block:v34];

      if (v24)
      {
        if (!v10) {
          id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        objc_msgSend(v10, "addObject:", v24, v30, v31, v32);
      }

      if (!v13) {
        goto LABEL_11;
      }
LABEL_10:
      std::__shared_weak_count::__release_shared[abi:ne180100](v13);
      goto LABEL_11;
    }
    uint64_t v11 = 0;
    uint64_t v33 = 0;
    id v10 = 0;
LABEL_23:
    v42 = (void **)&v40;
    std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v42);
    uint64_t v25 = v30;
    id v5 = v31;
    uint64_t v26 = v33;
  }
  else
  {
    uint64_t v25 = 0;
    uint64_t v11 = 0;
    uint64_t v26 = 0;
    id v10 = 0;
  }
  unint64_t v27 = objc_alloc_init(MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration);
  [(MPLibraryKeepLocalStatusObserverConfiguration *)v27 setEnableState:*(void *)(*(void *)(a1 + 40) + 280)];
  [(MPLibraryKeepLocalStatusObserverConfiguration *)v27 setIdentifyingModelObject:*(void *)(*(void *)(a1 + 40) + 288)];
  [(MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration *)v27 setRedownloadableItemCount:*(void *)(a1 + 88)];
  [(MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration *)v27 setDownloadEnabledItemCount:v11];
  [(MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration *)v27 setNonPurgeableItemCount:v26];
  [(MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration *)v27 setPendingItemIdentifiers:v10];
  id v28 = *(void **)(a1 + 40);
  uint64_t v29 = v28[39];
  if (v29)
  {
    (*(void (**)(void, MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration *, void))(v29 + 16))(v28[39], v27, 0);
    id v28 = *(void **)(a1 + 40);
  }
  objc_msgSend(v28, "finish", v30, v31);

  if (v25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v25);
  }
}

void __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = *(mlcore::EntityQueryResult **)a2;
  if (*(void *)a2)
  {
    uint64_t v7 = *(void *)(a2 + 8);
    if (v7) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
    }
    v6 = (mlcore::EntityQueryResult *)mlcore::EntityQueryResult::entityCount(v6);
  }
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  if (*(void *)(a1 + 40))
  {
    v17[4] = &v16;
    uint64_t v8 = std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(1uLL);
    v17[0] = v8;
    v17[1] = v8;
    v17[3] = &v8[v9];
    long long v10 = *(_OWORD *)(a1 + 40);
    _OWORD *v8 = v10;
    if (*((void *)&v10 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v10 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    v17[2] = v8 + 1;
    std::vector<std::shared_ptr<mlcore::Predicate>>::__swap_out_circular_buffer(&v14, v17);
    uint64_t v11 = v15;
    v6 = (mlcore::EntityQueryResult *)std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)v17);
    uint64_t v15 = v11;
  }
  uint64_t v12 = (mlcore *)mlcore::PlaylistItemPropertyItemPersistentID(v6);
  HasNonPurgeableAsset = (ModelPropertyBase *)mlcore::ItemPropertyHasNonPurgeableAsset(v12);
  MPMediaLibraryGetProperty((ModelPropertyBase *)v12, HasNonPurgeableAsset);
  std::allocate_shared[abi:ne180100]<mlcore::UnaryPredicate<int>,std::allocator<mlcore::UnaryPredicate<int>>,mlcore::ModelProperty<int> *&,mlcore::UnaryOperator,void>();
}

void __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_8(void *a1, uint64_t a2, void *a3)
{
  id v11 = a3;
  id v5 = *(mlcore::EntityQueryResult **)a2;
  if (*(void *)a2)
  {
    v6 = *(std::__shared_weak_count **)(a2 + 8);
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v7 = mlcore::EntityQueryResult::entityCount(v5);
  }
  else
  {
    v6 = 0;
    uint64_t v7 = 0;
  }
  uint64_t v8 = objc_alloc_init(MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration);
  [(MPLibraryKeepLocalStatusObserverConfiguration *)v8 setEnableState:*(void *)(a1[4] + 280)];
  [(MPLibraryKeepLocalStatusObserverConfiguration *)v8 setIdentifyingModelObject:*(void *)(a1[4] + 288)];
  [(MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration *)v8 setRedownloadableItemCount:a1[5]];
  [(MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration *)v8 setNonPurgeableItemCount:v7];
  [(MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration *)v8 setDownloadEnabledItemCount:a1[6]];
  uint64_t v9 = (void *)a1[4];
  uint64_t v10 = v9[39];
  if (v10)
  {
    (*(void (**)(void, MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration *, void))(v10 + 16))(v9[39], v8, 0);
    uint64_t v9 = (void *)a1[4];
  }
  [v9 finish];

  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

void __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_4_20(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_5;
  v8[3] = &__block_descriptor_48_e44_v16__0___MPMutableLocalLibraryIdentifiers__8l;
  long long v9 = *(_OWORD *)(a1 + 40);
  [v3 setLibraryIdentifiersWithDatabaseID:v4 block:v8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_6;
  v5[3] = &__block_descriptor_56_e46_v16__0___MPMutableUniversalStoreIdentifiers__8l;
  int8x16_t v6 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
  uint64_t v7 = *(void *)(a1 + 64);
  [v3 setUniversalStoreIdentifiersWithBlock:v5];
}

void __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_5(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = MPMediaLibraryPropertyCacheValueForProperty(*(ModelPropertyBase **)(a1 + 32), *(int8x8_t **)(a1 + 40));
  objc_msgSend(v4, "setPersistentID:", objc_msgSend(v3, "longLongValue"));
}

void __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_6(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = MPMediaLibraryPropertyCacheValueForProperty(*(ModelPropertyBase **)(a1 + 32), *(int8x8_t **)(a1 + 40));
  objc_msgSend(v5, "setAdamID:", objc_msgSend(v3, "longLongValue"));

  id v4 = MPMediaLibraryPropertyCacheValueForProperty(*(ModelPropertyBase **)(a1 + 48), *(int8x8_t **)(a1 + 40));
  objc_msgSend(v5, "setSubscriptionAdamID:", objc_msgSend(v4, "longLongValue"));
}

void __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v14[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (*a2)
  {
    int8x16_t v6 = (std::__shared_weak_count *)a2[1];
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v12 = 0;
    id v13 = 0;
    uint64_t v11 = 0;
    uint64_t v7 = operator new(0x28uLL);
    void *v7 = &unk_1EE673000;
    v7[1] = &v12;
    v7[2] = &v11;
    v7[3] = a1 + 32;
    v7[4] = &v13;
    v14[3] = v7;
    mlcore::PropertiesQueryResult::enumerateResults();
    std::__function::__value_func<void ()(mlcore::PropertyCache const&,BOOL &)>::~__value_func[abi:ne180100](v14);
  }
  else
  {
    int8x16_t v6 = 0;
    uint64_t v12 = 0;
    id v13 = 0;
    uint64_t v11 = 0;
  }
  uint64_t v8 = objc_alloc_init(MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration);
  [(MPLibraryKeepLocalStatusObserverConfiguration *)v8 setEnableState:*(void *)(*(void *)(a1 + 40) + 280)];
  [(MPLibraryKeepLocalStatusObserverConfiguration *)v8 setIdentifyingModelObject:*(void *)(*(void *)(a1 + 40) + 288)];
  [(MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration *)v8 setRedownloadableItemCount:*(void *)(a1 + 48)];
  [(MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration *)v8 setDownloadEnabledItemCount:v11];
  [(MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration *)v8 setNonPurgeableItemCount:v12];
  [(MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration *)v8 setPendingItemIdentifiers:v13];
  long long v9 = *(void **)(a1 + 40);
  uint64_t v10 = v9[39];
  if (v10)
  {
    (*(void (**)(void, MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration *, void))(v10 + 16))(v9[39], v8, 0);
    long long v9 = *(void **)(a1 + 40);
  }
  objc_msgSend(v9, "finish", v11);

  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

void __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int8x16_t v6 = *(mlcore::AggregateFunctionQueryResult **)a2;
  if (*(void *)a2)
  {
    uint64_t v7 = *(void *)(a2 + 8);
    if (v7) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
    }
    mlcore::AggregateFunctionQueryResult::value(v6);
  }
  uint64_t v8 = *(std::__shared_weak_count **)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v15 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  v12[0] = 0;
  v12[1] = &v10;
  LOBYTE(v13) = 0;
  uint64_t v10 = operator new(0x10uLL);
  uint64_t v11 = v10;
  v12[0] = v10 + 2;
  uint64_t v11 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::Predicate>>,std::shared_ptr<mlcore::Predicate> const*,std::shared_ptr<mlcore::Predicate> const*,std::shared_ptr<mlcore::Predicate>*>((uint64_t)v12, &v14, v16, v10);
  long long v9 = (mlcore *)v15;
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  mlcore::ItemPropertyHasNonPurgeableAsset(v9);
  std::allocate_shared[abi:ne180100]<mlcore::UnaryPredicate<int>,std::allocator<mlcore::UnaryPredicate<int>>,mlcore::ModelProperty<int> *&,mlcore::UnaryOperator,void>();
}

void __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_4(void *a1, uint64_t a2, void *a3)
{
  id v11 = a3;
  id v5 = *(mlcore::AggregateFunctionQueryResult **)a2;
  if (*(void *)a2)
  {
    int8x16_t v6 = *(std::__shared_weak_count **)(a2 + 8);
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v7 = mlcore::AggregateFunctionQueryResult::value(v5);
  }
  else
  {
    int8x16_t v6 = 0;
    uint64_t v7 = 0;
  }
  uint64_t v8 = objc_alloc_init(MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration);
  [(MPLibraryKeepLocalStatusObserverConfiguration *)v8 setEnableState:*(void *)(a1[4] + 280)];
  [(MPLibraryKeepLocalStatusObserverConfiguration *)v8 setIdentifyingModelObject:*(void *)(a1[4] + 288)];
  [(MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration *)v8 setRedownloadableItemCount:a1[5]];
  [(MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration *)v8 setNonPurgeableItemCount:v7];
  [(MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration *)v8 setDownloadEnabledItemCount:a1[6]];
  long long v9 = (void *)a1[4];
  uint64_t v10 = v9[39];
  if (v10)
  {
    (*(void (**)(void, MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration *, void))(v10 + 16))(v9[39], v8, 0);
    long long v9 = (void *)a1[4];
  }
  [v9 finish];

  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

@end