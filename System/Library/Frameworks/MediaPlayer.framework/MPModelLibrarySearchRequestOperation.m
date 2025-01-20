@interface MPModelLibrarySearchRequestOperation
- (MPModelLibrarySearchRequest)request;
- (MPModelLibrarySearchRequestOperation)init;
- (id).cxx_construct;
- (id)responseHandler;
- (void)cancel;
- (void)execute;
- (void)setRequest:(id)a3;
- (void)setResponseHandler:(id)a3;
@end

@implementation MPModelLibrarySearchRequestOperation

- (id).cxx_construct
{
  *((void *)self + 35) = 0;
  *((void *)self + 36) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
  cntrl = self->_runningQuery.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }

  objc_storeStrong((id *)&self->_accessSerialQueue, 0);
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

- (MPModelLibrarySearchRequest)request
{
  return self->_request;
}

- (void)cancel
{
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__MPModelLibrarySearchRequestOperation_cancel__block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_async(accessSerialQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)MPModelLibrarySearchRequestOperation;
  [(MPAsyncOperation *)&v4 cancel];
}

mlcore::LocalizedSearchQuery *__46__MPModelLibrarySearchRequestOperation_cancel__block_invoke(uint64_t a1)
{
  result = *(mlcore::LocalizedSearchQuery **)(*(void *)(a1 + 32) + 280);
  if (result) {
    return (mlcore::LocalizedSearchQuery *)mlcore::LocalizedSearchQuery::cancel(result);
  }
  return result;
}

- (void)execute
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v26 = [(MPModelLibraryRequest *)self->_request mediaLibrary];
  v3 = [MPMediaLibraryView alloc];
  objc_super v4 = [(MPModelLibraryRequest *)self->_request mediaLibrary];
  v27 = [(MPMediaLibraryView *)v3 initWithLibrary:v4 filteringOptions:[(MPModelLibraryRequest *)self->_request filteringOptions]];

  v5 = [(MPModelLibrarySearchRequest *)self->_request searchString];
  int64_t v6 = [(MPModelLibrarySearchRequest *)self->_request maximumResultsPerScope];
  v7 = [(MPModelLibrarySearchRequest *)self->_request scopes];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v5 && [v5 length] && objc_msgSend(v7, "count"))
  {
    id v9 = v5;
    v10 = (char *)[v9 UTF8String];
    if (v10)
    {
      v25 = v7;
      v11 = (std::__shared_weak_count *)operator new(0x78uLL);
      v11->__shared_owners_ = 0;
      v11->__shared_weak_owners_ = 0;
      v11->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EE673438;
      std::string::basic_string[abi:ne180100]<0>(__p, v10);
      v12 = (mlcore::LocalizedSearchQuery *)&v11[1];
      MEMORY[0x19971C360](&v11[1], __p);
      if (v42 < 0) {
        operator delete(__p[0]);
      }
      accessSerialQueue = self->_accessSerialQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3321888768;
      block[2] = __47__MPModelLibrarySearchRequestOperation_execute__block_invoke;
      block[3] = &unk_1EE6739A8;
      block[4] = self;
      void block[5] = v11 + 1;
      v40 = v11;
      v24 = v11;
      atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
      dispatch_sync(accessSerialQueue, block);
      long long buf = 0uLL;
      uint64_t v44 = 0;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v14 = v7;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v45 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v36 != v16) {
              objc_enumerationMutation(v14);
            }
            uint64_t v18 = *(void *)(*((void *)&v35 + 1) + 8 * i);
            if (v18)
            {
              [*(id *)(*((void *)&v35 + 1) + 8 * i) coreScope];
              if (__p[0])
              {
                std::vector<std::shared_ptr<mlcore::LocalizedSearchScope>>::push_back[abi:ne180100]((char **)&buf, (long long *)__p);
                [v8 addObject:v18];
              }
            }
            else
            {
              __p[0] = 0;
              __p[1] = 0;
            }
            if (__p[1]) {
              std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)__p[1]);
            }
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v45 count:16];
        }
        while (v15);
      }

      v7 = v25;
      mlcore::LocalizedSearchQuery::setScopes();
      if (v6) {
        mlcore::LocalizedSearchQuery::setPerScopeResultLimit(v12);
      }
      v33 = v12;
      v34 = v24;
      atomic_fetch_add_explicit(&v24->__shared_owners_, 1uLL, memory_order_relaxed);
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3321888768;
      v28[2] = __47__MPModelLibrarySearchRequestOperation_execute__block_invoke_3;
      v28[3] = &unk_1EE673A80;
      id v29 = v8;
      memset(v32, 0, sizeof(v32));
      std::vector<std::shared_ptr<mlcore::LocalizedSearchScope>>::__init_with_size[abi:ne180100]<std::shared_ptr<mlcore::LocalizedSearchScope>*,std::shared_ptr<mlcore::LocalizedSearchScope>*>(v32, (void *)buf, *((void **)&buf + 1), (uint64_t)(*((void *)&buf + 1) - buf) >> 4);
      id v30 = v26;
      v31 = self;
      [(MPMediaLibraryView *)v27 performCoreSearchQuery:&v33 withCompletion:v28];
      if (v34) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v34);
      }

      __p[0] = v32;
      std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);

      __p[0] = &buf;
      std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
      if (v40) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v40);
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v24);
    }
    else
    {
      v22 = os_log_create("com.apple.amp.mediaplayer", "Default");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v9;
        _os_log_impl(&dword_1952E8000, v22, OS_LOG_TYPE_FAULT, "MPModelLibrarySearchRequestOperation: NULL utf8 from string: '%{public}@'", (uint8_t *)&buf, 0xCu);
      }

      [(MPAsyncOperation *)self finishWithError:0];
    }
  }
  else
  {
    if (![(MPAsyncOperation *)self isCancelled])
    {
      if (v5)
      {
        if ([v5 length])
        {
          uint64_t v19 = [v7 count];
          if (v19) {
            uint64_t v20 = -9001;
          }
          else {
            uint64_t v20 = -9004;
          }
          if (v19) {
            v21 = @"Cannot run library search request due to unknown error.";
          }
          else {
            v21 = @"Cannot run library search request with no requested scopes.";
          }
        }
        else
        {
          v21 = @"Cannot run library search request with an empty search string.";
          uint64_t v20 = -9003;
        }
      }
      else
      {
        v21 = @"Cannot run library search request with a nil search string.";
        uint64_t v20 = -9002;
      }
      v23 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPModelLibrarySearchRequestErrorDomain", v20, v21);
      (*((void (**)(void))self->_responseHandler + 2))();
    }
    [(MPAsyncOperation *)self finish];
  }
}

void __47__MPModelLibrarySearchRequestOperation_execute__block_invoke(void *a1)
{
  uint64_t v1 = a1[5];
  v2 = (void *)(a1[4] + 280);
  uint64_t v3 = a1[6];
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  objc_super v4 = (std::__shared_weak_count *)v2[1];
  void *v2 = v1;
  v2[1] = v3;
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
}

void __47__MPModelLibrarySearchRequestOperation_execute__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    int64_t v6 = 0;
  }
  else
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    id v8 = *(void **)(a1 + 32);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3321888768;
    v19[2] = __47__MPModelLibrarySearchRequestOperation_execute__block_invoke_2;
    v19[3] = &unk_1EE673B28;
    memset(v23, 0, 24);
    std::vector<std::shared_ptr<mlcore::LocalizedSearchScope>>::__init_with_size[abi:ne180100]<std::shared_ptr<mlcore::LocalizedSearchScope>*,std::shared_ptr<mlcore::LocalizedSearchScope>*>(v23, *(void **)(a1 + 56), *(void **)(a1 + 64), (uint64_t)(*(void *)(a1 + 64) - *(void *)(a1 + 56)) >> 4);
    id v9 = (std::__shared_weak_count *)a2[1];
    v23[3] = *a2;
    v24 = v9;
    if (v9) {
      atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    id v10 = *(id *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    id v20 = v10;
    uint64_t v21 = v11;
    id v12 = v7;
    id v22 = v12;
    [v8 enumerateObjectsUsingBlock:v19];
    v13 = [MPLibraryObjectDatabase alloc];
    id v14 = [*(id *)(a1 + 48) userIdentity];
    uint64_t v15 = +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:v14];
    uint64_t v16 = [(MPLibraryObjectDatabase *)v13 initWithLibrary:v15];

    v17 = [[MPModelLibrarySearchSectionedCollectionDataSource alloc] initWithEntitiesQueryResultContainers:v12 libraryObjectDatabase:v16];
    [(MPModelLibrarySearchSectionedCollectionDataSource *)v17 setRequest:*(void *)(*(void *)(a1 + 48) + 296)];
    uint64_t v18 = [[MPLazySectionedCollection alloc] initWithDataSource:v17];
    int64_t v6 = [[MPModelLibrarySearchResponse alloc] initWithRequest:*(void *)(*(void *)(a1 + 48) + 296)];
    [(MPModelResponse *)v6 setResults:v18];

    if (v24) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v24);
    }
    v25 = (void **)v23;
    std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v25);
  }
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 48) + 304) + 16))();
  [*(id *)(a1 + 48) finishWithError:v5];
}

void __47__MPModelLibrarySearchRequestOperation_execute__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 56);
  if (a3 >= (*(void *)(a1 + 64) - v6) >> 4) {
    std::vector<mlcore::PropertyCache>::__throw_out_of_range[abi:ne180100]();
  }
  v7 = (uint64_t *)(v6 + 16 * a3);
  uint64_t v8 = *v7;
  id v9 = (std::__shared_weak_count *)v7[1];
  if (v9)
  {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v21 = v9;
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  else
  {
    uint64_t v21 = 0;
  }
  uint64_t v20 = v8;
  mlcore::LocalizedSearchQueryResult::resultForSearchScope();
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }
  if (v22 && mlcore::EntityQueryResult::entityCount(v22))
  {
    id v10 = objc_alloc_init(MPMediaLibraryEntityTranslationContext);
    uint64_t v11 = [v5 itemKind];
    [(MPMediaLibraryEntityTranslationContext *)v10 setModelKind:v11];

    [(MPMediaLibraryEntityTranslationContext *)v10 setMediaLibrary:*(void *)(a1 + 32)];
    id v12 = [v5 itemKind];
    -[MPMediaLibraryEntityTranslationContext setMultiQuery:](v10, "setMultiQuery:", [v12 modelClass] == objc_opt_class());

    v13 = [*(id *)(a1 + 40) userIdentity];
    id v14 = [v13 accountDSID];
    [(MPMediaLibraryEntityTranslationContext *)v10 setPersonID:v14];

    uint64_t v15 = *(void **)(a1 + 48);
    uint64_t v16 = [MPModelLibrarySearchEntityResultContainer alloc];
    uint64_t v18 = v22;
    uint64_t v19 = v23;
    if (v23) {
      atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v17 = [(MPModelLibrarySearchEntityResultContainer *)v16 initWithEntityQueryResult:&v18 forScope:v5 entityTranslationContext:v10];
    objc_msgSend(v15, "addObject:", v17, v18);

    if (v19) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v19);
    }
  }
  if (v23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v23);
  }
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
}

- (MPModelLibrarySearchRequestOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)MPModelLibrarySearchRequestOperation;
  v2 = [(MPAsyncOperation *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.MediaPlayer.MPModelLibrarySearchRequestOperation.accessSerialQueue", 0);
    accessSerialQueue = v2->_accessSerialQueue;
    v2->_accessSerialQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

@end