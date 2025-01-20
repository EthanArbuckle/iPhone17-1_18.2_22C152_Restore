@interface MPModelLibraryRequestOperation
- (BOOL)_validateRequest;
- (MPModelLibraryRequest)request;
- (id)_itemProperties;
- (id)_libraryView;
- (id)_sectionProperties;
- (id)responseHandler;
- (void)_executeLegacyRequest;
- (void)_executeNewRequest;
- (void)_insertPropertyCacheForEntityPID:(int64_t)a3 entityClass:(void *)a4 entityTranslator:(id)a5 translationContext:(id)a6 propertyCachesVector:(const void *)a7;
- (void)_sanityCheckRequest;
- (void)execute;
- (void)setRequest:(id)a3;
- (void)setResponseHandler:(id)a3;
@end

@implementation MPModelLibraryRequestOperation

- (void)setResponseHandler:(id)a3
{
}

- (void)setRequest:(id)a3
{
}

- (void)execute
{
  if ([(MPModelLibraryRequestOperation *)self _validateRequest])
  {
    v3 = [(MPModelLibraryRequest *)self->_request legacyMediaQuery];

    if (v3)
    {
      [(MPModelLibraryRequestOperation *)self _executeLegacyRequest];
    }
    else
    {
      [(MPModelLibraryRequestOperation *)self _sanityCheckRequest];
      [(MPModelLibraryRequestOperation *)self _executeNewRequest];
    }
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F28C58];
    v5 = [(MPModelLibraryRequest *)self->_request mediaLibrary];
    v6 = [v5 databasePath];
    v7 = [(MPModelLibraryRequest *)self->_request mediaLibrary];
    v8 = [v7 description];
    objc_msgSend(v4, "msv_errorWithDomain:code:debugDescription:", @"MPRequestErrorDomain", 1, @"Invalid request database path=%@, mediaLibrary=%@", v6, v8);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    (*((void (**)(void))self->_responseHandler + 2))();
    [(MPAsyncOperation *)self finishWithError:v9];
  }
}

- (void)_executeLegacyRequest
{
  v33 = [(MPModelLibraryRequest *)self->_request legacyMediaQuery];
  v4 = [(MPModelLibraryRequestOperation *)self request];
  v30 = [v4 mediaLibrary];

  v5 = [(MPModelLibraryRequestOperation *)self request];
  v6 = [v5 label];
  v7 = v6;
  if (!v6)
  {
    v2 = [(MPModelLibraryRequestOperation *)self request];
    v7 = [v2 description];
  }
  [v30 connectionAssertionWithIdentifier:v7];
  objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
  }
  v8 = [(MPModelLibraryRequestOperation *)self _libraryView];
  if (v8) {
    [v8 mlCoreView];
  }
  uint64_t v28 = [(MPModelLibraryRequestOperation *)self _itemProperties];
  id v9 = [(MPModelRequest *)self->_request sectionKind];
  uint64_t v10 = [v9 modelClass];

  v11 = [(MPModelRequest *)self->_request itemKind];
  v12 = (void *)[v11 modelClass];

  if (v12
    && (+[MPMediaLibraryEntityTranslator translatorForMPModelClass:v12], id v13 = (id)objc_claimAutoreleasedReturnValue(), v13, v13))
  {
    [v13 MLCorePropertiesForPropertySet:v28];
  }
  else
  {
    id v13 = 0;
  }
  if (![v13 entityClass])
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    v24 = [(MPModelLibraryRequestOperation *)self request];
    v25 = [v24 label];
    [v23 handleFailureInMethod:a2, self, @"MPModelLibraryRequestOperation.mm", 109, @"Request did not provide an entity class for %@ %@. label=%@", v12, v13, v25 object file lineNumber description];
  }
  v14 = objc_alloc_init(MPMediaLibraryEntityTranslationContext);
  [(MPMediaLibraryEntityTranslationContext *)v14 setMediaLibrary:v30];
  v15 = [(MPModelRequest *)self->_request itemKind];
  [(MPMediaLibraryEntityTranslationContext *)v14 setModelKind:v15];

  if (v10)
  {
    v31 = objc_alloc_init(MPMediaLibraryEntityTranslationContext);
    [(MPMediaLibraryEntityTranslationContext *)v31 setMediaLibrary:v30];
    v16 = [(MPModelRequest *)self->_request sectionKind];
    [(MPMediaLibraryEntityTranslationContext *)v31 setModelKind:v16];

    uint64_t v29 = [(MPModelLibraryRequestOperation *)self _sectionProperties];
    v17 = +[MPMediaLibraryEntityTranslator translatorForMPModelClass:v10];
    if (v17) {
      [v17 MLCorePropertiesForPropertySet:v29];
    }
    if ([v33 groupingType])
    {
      [v33 collections];
      [(id)objc_claimAutoreleasedReturnValue() resultSet];
    }
    else
    {
      if (v10 == objc_opt_class())
      {
        v18 = (void *)[v33 copy];
        [v18 setGroupingType:6];
      }
      else
      {
        v18 = (void *)[v33 copy];
        objc_msgSend(v18, "setGroupingType:", objc_msgSend(v33, "_representativeCollectionGroupingType"));
      }
      v27 = [v18 collections];

      [v27 resultSet];
    }
    objc_claimAutoreleasedReturnValue();
    operator new();
  }
  if ([v12 isSubclassOfClass:objc_opt_class()]) {
    [v33 items];
  }
  else {
  id v32 = [v33 collections];
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = v32;
    v20 = [v19 resultSet];
    [v20 revision];
    uint64_t v21 = [v19 sectionInfo];

    v22 = (void *)v21;
  }
  else
  {
    v22 = 0;
  }
  [v22 sections];
  objc_claimAutoreleasedReturnValue();
  operator new();
}

- (MPModelLibraryRequest)request
{
  return self->_request;
}

- (id)_itemProperties
{
  return [(MPModelRequest *)self->_request itemProperties];
}

- (id)_libraryView
{
  unint64_t v3 = [(MPModelLibraryRequest *)self->_request filteringOptions];
  v4 = [(MPModelRequest *)self->_request itemKind];
  uint64_t v5 = [v4 modelClass];
  uint64_t v6 = objc_opt_class();

  if (v5 == v6) {
    v3 |= 4uLL;
  }
  v7 = [MPMediaLibraryView alloc];
  v8 = [(MPModelLibraryRequest *)self->_request mediaLibrary];
  id v9 = [(MPMediaLibraryView *)v7 initWithLibrary:v8 filteringOptions:v3];

  return v9;
}

- (void)_insertPropertyCacheForEntityPID:(int64_t)a3 entityClass:(void *)a4 entityTranslator:(id)a5 translationContext:(id)a6 propertyCachesVector:(const void *)a7
{
  v15[4] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [(MPModelLibraryRequestOperation *)self _libraryView];
  id v13 = +[MPPropertySet emptyPropertySet];
  if (v10) {
    [v10 entityQueryForPropertySet:v13 sortDescriptors:MEMORY[0x1E4F1CBF0] context:v11 view:v12];
  }
  else {
    v14 = 0;
  }

  mlcore::Query::predicate(v15, v14);
  (*(void (**)(void *))(*(void *)a4 + 112))(a4);
  std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<long long>,std::allocator<mlcore::ComparisonPredicate<long long>>,mlcore::ModelProperty<long long> *&,mlcore::ComparisonOperator,long long const&,void>();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

void __136__MPModelLibraryRequestOperation__insertPropertyCacheForEntityPID_entityClass_entityTranslator_translationContext_propertyCachesVector___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v7 = *(mlcore::EntityQueryResult **)a2;
  uint64_t v6 = *(std::__shared_weak_count **)(a2 + 8);
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v8 = (void *)mlcore::EntityQueryResult::propertyCaches(v7);
  if (v8[1] == *v8)
  {
    id v11 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      id v13 = [*(id *)(v12 + 272) label];
      v14 = NSString;
      (*(void (**)(void **__return_ptr))(**(void **)(a1 + 56) + 56))(__p);
      if (v22 >= 0) {
        v15 = __p;
      }
      else {
        v15 = (void **)__p[0];
      }
      v16 = [v14 stringWithUTF8String:v15];
      uint64_t v17 = *(void *)(a1 + 64);
      v18 = [*(id *)(*(void *)(a1 + 32) + 272) legacyMediaQuery];
      *(_DWORD *)buf = 134219010;
      *(void *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v13;
      *(_WORD *)&buf[22] = 2114;
      *(void *)v24 = v16;
      *(_WORD *)&v24[8] = 2048;
      *(void *)&v24[10] = v17;
      *(_WORD *)&v24[18] = 2114;
      *(void *)v25 = v18;
      _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_FAULT, "MPModelLibraryRequestOperation: %p _insertPropertyCacheForEntityPID: no entity label=%{public}@ entityClass=%{public}@ entityPID=%lld legacyMediaQuery=%{public}@", buf, 0x34u);

      if (v22 < 0) {
        operator delete(__p[0]);
      }
    }
    *(_OWORD *)v24 = 0u;
    *(_OWORD *)&buf[8] = 0u;
    *(_DWORD *)&v24[16] = 1065353216;
    *(_OWORD *)&v25[4] = 0u;
    long long v26 = 0u;
    int v27 = 1065353216;
    long long v29 = 0u;
    long long v28 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    int v30 = 1065353216;
    int v33 = 1065353216;
    memset(v34, 0, 32);
    v34[8] = 1.0;
    *(void *)buf = MEMORY[0x1E4F76A90] + 16;
    uint64_t v35 = MEMORY[0x1E4F76A90] + 56;
    uint64_t v19 = *(void *)(a1 + 64);
    __p[0] = (void *)(*(uint64_t (**)(void))(**(void **)(a1 + 56) + 112))(*(void *)(a1 + 56));
    std::__hash_table<std::__hash_value_type<mlcore::ModelProperty<long long> *,long long>,std::__unordered_map_hasher<mlcore::ModelProperty<long long> *,std::__hash_value_type<mlcore::ModelProperty<long long> *,long long>,std::hash<mlcore::ModelProperty<long long> *>,std::equal_to<mlcore::ModelProperty<long long> *>,true>,std::__unordered_map_equal<mlcore::ModelProperty<long long> *,std::__hash_value_type<mlcore::ModelProperty<long long> *,long long>,std::equal_to<mlcore::ModelProperty<long long> *>,std::hash<mlcore::ModelProperty<long long> *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelProperty<long long> *,long long>>>::__emplace_unique_key_args<mlcore::ModelProperty<long long> *,std::piecewise_construct_t const&,std::tuple<mlcore::ModelProperty<long long> * const&>,std::tuple<>>(v34, (unint64_t)__p[0], __p)[3] = v19;
    uint64_t v9 = **(void **)(a1 + 48);
    unint64_t v10 = *(void *)(v9 + 8);
    if (v10 < *(void *)(v9 + 16))
    {
      mlcore::PropertyCache::PropertyCache();
      goto LABEL_15;
    }
    uint64_t v20 = std::vector<mlcore::PropertyCache>::__push_back_slow_path<mlcore::PropertyCache const&>(**(void ***)(a1 + 48));
  }
  else
  {
    mlcore::EntityQueryResult::propertyCaches(v7);
    mlcore::PropertyCache::PropertyCache();
    uint64_t v9 = **(void **)(a1 + 48);
    unint64_t v10 = *(void *)(v9 + 8);
    if (v10 < *(void *)(v9 + 16))
    {
      mlcore::PropertyCache::PropertyCache();
LABEL_15:
      uint64_t v20 = v10 + 216;
      *(void *)(v9 + 8) = v10 + 216;
      goto LABEL_18;
    }
    uint64_t v20 = std::vector<mlcore::PropertyCache>::__push_back_slow_path<mlcore::PropertyCache const&>(**(void ***)(a1 + 48));
  }
LABEL_18:
  *(void *)(v9 + 8) = v20;
  mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase(buf);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)_executeNewRequest
{
  v4 = [(MPModelLibraryRequestOperation *)self request];
  id v5 = [v4 mediaLibrary];
  uint64_t v6 = [(MPModelLibraryRequestOperation *)self request];
  v7 = [v6 label];
  v8 = v7;
  if (!v7)
  {
    v2 = [(MPModelLibraryRequestOperation *)self request];
    v8 = [v2 description];
  }
  v81 = [v5 connectionAssertionWithIdentifier:v8];
  if (!v7)
  {
  }
  v82 = [(MPModelLibraryRequestOperation *)self _libraryView];
  uint64_t v9 = [(MPModelRequest *)self->_request sectionKind];
  uint64_t v10 = [v9 modelClass];

  id v11 = [(MPModelRequest *)self->_request itemKind];
  uint64_t v12 = [v11 modelClass];

  uint64_t v13 = [(MPModelLibraryRequest *)self->_request contentRange];
  v15 = v14;
  v73 = (unsigned char *)v13;
  if (v12)
  {
    v16 = +[MPMediaLibraryEntityTranslator translatorForMPModelClass:v12];
  }
  else
  {
    v16 = 0;
  }
  v78 = v16;
  v79 = [(MPModelRequest *)self->_request itemProperties];
  v80 = [[MPModelLibraryResponse alloc] initWithRequest:self->_request];
  [(MPModelLibraryResponse *)v80 setLibraryAssertion:v81];
  BOOL v71 = v10 != 0;
  if (!v10)
  {
    v18 = [(MPModelLibraryRequest *)self->_request itemTranslationContext];
    uint64_t v19 = (void *)[v82 copy];
    uint64_t v20 = [(MPModelRequest *)self->_request itemSortDescriptors];
    if (v16)
    {
      [v16 entityQueryForPropertySet:v79 sortDescriptors:v20 context:v18 view:v19];
    }
    else
    {
      v120 = 0;
      v121 = 0;
    }

    uint64_t v36 = v120;
    if (v120)
    {
      if (!v15) {
        goto LABEL_29;
      }
    }
    else
    {
      v66 = [MEMORY[0x1E4F28B00] currentHandler];
      [v66 handleFailureInMethod:a2, self, @"MPModelLibraryRequestOperation.mm", 576, @"Request did not produce an item query: %@", self->_request object file lineNumber description];

      uint64_t v36 = 0;
      if (!v15)
      {
LABEL_29:
        v86 = v36;
        v87 = v121;
        if (v121) {
          atomic_fetch_add_explicit(&v121->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        id v85 = 0;
        if (v19)
        {
          [v19 resultsForCoreQuery:&v86 error:&v85];
          id v37 = v85;
        }
        else
        {
          id v37 = 0;
          v113 = 0;
          v114 = 0;
        }
        if (v87) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v87);
        }
        if (v37)
        {
          [(MPAsyncOperation *)self finishWithError:v37];
        }
        else
        {
          v38 = v113;
          if (!v113)
          {
            v68 = [MEMORY[0x1E4F28B00] currentHandler];
            [v68 handleFailureInMethod:a2 object:self file:@"MPModelLibraryRequestOperation.mm" lineNumber:589 description:@"item query did not produce error or result"];

            v38 = v113;
          }
          v39 = v114;
          if (v114) {
            atomic_fetch_add_explicit(&v114->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          v40 = [MPModelLibraryDefaultSectionedCollectionDataSource alloc];
          request = self->_request;
          v83 = v38;
          v84 = v39;
          if (v39) {
            atomic_fetch_add_explicit(&v39->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          v42 = [(MPModelLibraryDefaultSectionedCollectionDataSource *)v40 initWithRequest:request itemQueryResults:&v83];
          if (v84) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v84);
          }
          v43 = [[MPLazySectionedCollection alloc] initWithDataSource:v42];
          [(MPModelResponse *)v80 setResults:v43];

          if (v39) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v39);
          }
        }
        if (v114) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v114);
        }

        uint64_t v35 = v78;
        if (v121) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v121);
        }

        if (!v37) {
          goto LABEL_109;
        }
        goto LABEL_110;
      }
    }
    v113 = v73;
    v114 = v15;
    mlcore::RangeQuery::setRange();
    uint64_t v36 = v120;
    goto LABEL_29;
  }
  v75 = [(MPModelLibraryRequestOperation *)self _sectionProperties];
  v77 = +[MPMediaLibraryEntityTranslator translatorForMPModelClass:v10];
  v76 = [(MPModelLibraryRequest *)self->_request sectionTranslationContext];
  uint64_t v17 = [(MPModelRequest *)self->_request sectionSortDescriptors];
  if (v77)
  {
    [v77 entityQueryForPropertySet:v75 sortDescriptors:v17 context:v76 view:v82];
  }
  else
  {
    v136 = 0;
    v137 = 0;
  }

  if (!v136)
  {
    v65 = [MEMORY[0x1E4F28B00] currentHandler];
    [v65 handleFailureInMethod:a2, self, @"MPModelLibraryRequestOperation.mm", 409, @"Request did not produce an entity query: %@", self->_request object file lineNumber description];
  }
  uint64_t v21 = [(MPModelLibraryRequest *)self->_request filterText];
  if (![v21 length])
  {

    LOBYTE(v27) = 0;
LABEL_24:
    uint64_t v35 = v78;
    goto LABEL_72;
  }
  char v22 = [(MPModelRequest *)self->_request sectionKind];
  v23 = [v22 identityKind];
  v24 = +[MPModelPlaylistKind identityKind];
  id v25 = v23;
  id v26 = v24;
  if (v25 == v26) {
    int v27 = 1;
  }
  else {
    int v27 = [v25 isEqual:v26];
  }

  if (!v27) {
    goto LABEL_24;
  }
  uint64_t v28 = mlcore::PropertiesQuery::propertiesToFetch(v136);
  v120 = 0;
  v121 = 0;
  unint64_t v122 = 0;
  long long v29 = (mlcore *)std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v120, *(const void **)v28, *(void *)(v28 + 8), (uint64_t)(*(void *)(v28 + 8) - *(void *)v28) >> 3);
  IsLimited = (std::__shared_weak_count_vtbl *)mlcore::PlaylistPropertySmartIsLimited(v29);
  long long v31 = IsLimited;
  long long v32 = v121;
  if ((unint64_t)v121 >= v122)
  {
    v44 = (std::__shared_weak_count *)v120;
    int64_t v45 = ((char *)v121 - (char *)v120) >> 3;
    unint64_t v46 = v45 + 1;
    if ((unint64_t)(v45 + 1) >> 61) {
      std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v47 = v122 - (void)v120;
    if ((uint64_t)(v122 - (void)v120) >> 2 > v46) {
      unint64_t v46 = v47 >> 2;
    }
    if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v48 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v48 = v46;
    }
    if (v48) {
      unint64_t v48 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v48);
    }
    else {
      uint64_t v49 = 0;
    }
    int v33 = (std::__shared_weak_count_vtbl **)(v48 + 8 * v45);
    void *v33 = v31;
    p_shared_owners = (std::__shared_weak_count *)(v33 + 1);
    if (v32 != v44)
    {
      do
      {
        uint64_t shared_weak_owners = v32[-1].__shared_weak_owners_;
        long long v32 = (std::__shared_weak_count *)((char *)v32 - 8);
        *--int v33 = (std::__shared_weak_count_vtbl *)shared_weak_owners;
      }
      while (v32 != v44);
      long long v32 = (std::__shared_weak_count *)v120;
    }
    v120 = v33;
    unint64_t v122 = v48 + 8 * v49;
    if (v32) {
      operator delete(v32);
    }
  }
  else
  {
    v121->__vftable = IsLimited;
    int v33 = v120;
    p_shared_owners = (std::__shared_weak_count *)&v32->__shared_owners_;
  }
  v121 = p_shared_owners;
  v134 = 0;
  uint64_t v135 = 0;
  v133 = 0;
  std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v133, v33, (uint64_t)p_shared_owners, ((char *)p_shared_owners - (char *)v33) >> 3);
  uint64_t v35 = v78;
  mlcore::PropertiesQuery::setPropertiesToFetch();
  if (v133)
  {
    v134 = v133;
    operator delete(v133);
  }
  if (v120) {
    operator delete(v120);
  }
LABEL_72:
  if (v15)
  {
    v120 = (std::__shared_weak_count_vtbl **)v73;
    v121 = v15;
    mlcore::RangeQuery::setRange();
  }
  v129 = v136;
  v130 = v137;
  if (v137) {
    atomic_fetch_add_explicit(&v137->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v128 = 0;
  if (v82)
  {
    [v82 resultsForCoreQuery:&v129 error:&v128];
    id v51 = v128;
  }
  else
  {
    id v51 = 0;
    v131 = 0;
    v132 = 0;
  }
  if (v130) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v130);
  }
  if (v51)
  {
    [(MPAsyncOperation *)self finishWithError:v51];
    int v52 = 1;
  }
  else
  {
    v53 = v131;
    if (!v131)
    {
      v67 = [MEMORY[0x1E4F28B00] currentHandler];
      [v67 handleFailureInMethod:a2, self, @"MPModelLibraryRequestOperation.mm", 432, @"section query did not produce error or result for request: %@", self->_request object file lineNumber description];

      v53 = v131;
    }
    v54 = v132;
    if (v132) {
      atomic_fetch_add_explicit(&v132->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v120 = 0;
    v121 = (std::__shared_weak_count *)&v120;
    unint64_t v122 = 0x4812000000;
    v123 = __Block_byref_object_copy__2671;
    v124 = __Block_byref_object_dispose__2672;
    v125 = &unk_1956C748F;
    v127[0] = 0;
    v127[1] = 0;
    v126 = v127;
    if (!v35) {
      goto LABEL_97;
    }
    v74 = [(MPModelLibraryRequest *)self->_request itemTranslationContext];
    v70 = [v74 scopedContainers];
    id v69 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v113 = 0;
    v114 = (std::__shared_weak_count *)&v113;
    uint64_t v115 = 0x3812000000;
    v116 = __Block_byref_object_copy__86;
    v117 = __Block_byref_object_dispose__87;
    v118 = &unk_1956C748F;
    int v119 = 0;
    uint64_t v107 = 0;
    v108 = &v107;
    uint64_t v109 = 0x3032000000;
    v110 = __Block_byref_object_copy__89;
    v111 = __Block_byref_object_dispose__90;
    id v112 = 0;
    size_t v55 = mlcore::EntityQueryResult::entityCount(v53);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3321888768;
    block[2] = __52__MPModelLibraryRequestOperation__executeNewRequest__block_invoke;
    block[3] = &unk_1EE673970;
    v98 = &v113;
    v99 = &v107;
    block[4] = self;
    char v105 = v27;
    v101 = v53;
    v102 = v54;
    if (v54) {
      atomic_fetch_add_explicit(&v54->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    id v56 = v74;
    id v91 = v56;
    id v92 = v76;
    uint64_t v103 = v10;
    id v57 = v70;
    id v93 = v57;
    id v94 = v82;
    id v95 = v78;
    SEL v104 = a2;
    id v96 = v79;
    v100 = &v120;
    BOOL v106 = v71;
    id v58 = v69;
    id v97 = v58;
    dispatch_apply(v55, 0, block);
    uint64_t v59 = v108[5];
    if (v59)
    {
      [(MPAsyncOperation *)self finishWithError:v108[5]];
    }
    else
    {
      v60 = (void *)[v58 copy];
      [(MPModelLibraryResponse *)v80 setSectionKeepLocalStatusConfigurations:v60];
    }
    if (v102) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v102);
    }
    _Block_object_dispose(&v107, 8);

    _Block_object_dispose(&v113, 8);
    uint64_t v35 = v78;
    if (v59)
    {
      int v52 = 1;
    }
    else
    {
LABEL_97:
      v61 = [MPModelLibraryModelSectionedCollectionDataSource alloc];
      v62 = self->_request;
      v88 = v53;
      v89 = v54;
      if (v54) {
        atomic_fetch_add_explicit(&v54->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      v63 = [(MPModelLibraryModelSectionedCollectionDataSource *)v61 initWithRequest:v62 sectionQueryResults:&v88 itemQueryResults:&v121[2]];
      if (v89) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v89);
      }
      v64 = [[MPLazySectionedCollection alloc] initWithDataSource:v63];
      [(MPModelResponse *)v80 setResults:v64];

      int v52 = 0;
    }
    _Block_object_dispose(&v120, 8);
    std::__tree<std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>,std::__map_value_compare<long long,std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>,std::less<long long>,true>,std::allocator<std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>>>::destroy(v127[0]);
    if (v54) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v54);
    }
  }
  if (v132) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v132);
  }

  if (v137) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v137);
  }

  if (!v52)
  {
LABEL_109:
    (*((void (**)(void))self->_responseHandler + 2))();
    [(MPAsyncOperation *)self finish];
  }
LABEL_110:
}

void __52__MPModelLibraryRequestOperation__executeNewRequest__block_invoke(uint64_t a1)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x19971DE60]();
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 96) + 8) + 48));
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 96) + 8) + 48));
  if (([*(id *)(a1 + 32) isCancelled] & 1) != 0 || v2) {
    goto LABEL_70;
  }
  if (*(unsigned char *)(a1 + 152))
  {
    unint64_t v3 = (mlcore *)mlcore::EntityQueryResult::entityAtIndex(*(mlcore::EntityQueryResult **)(a1 + 120));
    IsLimited = (ModelPropertyBase *)mlcore::PlaylistPropertySmartIsLimited(v3);
    BOOL v5 = mlcore::Entity::valueForProperty<int>(v64, IsLimited) != 0;
    if (v65) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v65);
    }
  }
  else
  {
    BOOL v5 = 0;
  }
  v38 = (void *)[*(id *)(a1 + 40) copy];
  uint64_t v6 = mlcore::EntityQueryResult::persistentIDAtIndex(*(mlcore::EntityQueryResult **)(a1 + 120));
  uint64_t v63 = v6;
  v7 = [MPIdentifierSet alloc];
  v8 = [*(id *)(*(void *)(a1 + 32) + 272) sectionKind];
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __52__MPModelLibraryRequestOperation__executeNewRequest__block_invoke_2;
  v60[3] = &unk_1E57F7AD0;
  id v61 = *(id *)(a1 + 48);
  uint64_t v62 = v6;
  uint64_t v36 = [(MPIdentifierSet *)v7 initWithSource:@"LibraryRequestOperation" modelKind:v8 block:v60];

  v34 = (void *)[objc_alloc(*(Class *)(a1 + 136)) initWithIdentifiers:v36 block:&__block_literal_global_2680];
  uint64_t v9 = objc_msgSend(*(id *)(a1 + 56), "arrayByAddingObject:");
  [v38 setScopedContainers:v9];

  id v37 = (void *)[*(id *)(a1 + 64) copy];
  uint64_t v35 = [*(id *)(*(void *)(a1 + 32) + 272) itemSortDescriptors];
  uint64_t v10 = *(void **)(a1 + 72);
  if (!v10)
  {
    id v58 = 0;
    uint64_t v59 = 0;
LABEL_11:
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 144), *(void *)(*(void *)(a1 + 32) + 272));

    id v11 = v58;
    goto LABEL_12;
  }
  [v10 entityQueryForPropertySet:*(void *)(a1 + 80) sortDescriptors:v35 context:v38 view:v37];
  id v11 = v58;
  if (!v58) {
    goto LABEL_11;
  }
LABEL_12:
  v54 = v11;
  size_t v55 = v59;
  if (v59) {
    atomic_fetch_add_explicit(&v59->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v53 = 0;
  if (v37)
  {
    [v37 resultsForCoreQuery:&v54 error:&v53];
    id v13 = v53;
  }
  else
  {
    id v13 = 0;
    id v56 = 0;
    id v57 = 0;
  }
  if (v55) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v55);
  }
  if (v13)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40), v13);
  }
  else
  {
    long long v32 = v56;
    if (!v56)
    {
      long long v29 = [MEMORY[0x1E4F28B00] currentHandler];
      [v29 handleFailureInMethod:*(void *)(a1 + 144) object:*(void *)(a1 + 32) file:@"MPModelLibraryRequestOperation.mm" lineNumber:480 description:@"item query did not produce error or result"];

      long long v32 = v56;
    }
    v14 = v57;
    if (v57) {
      atomic_fetch_add_explicit(&v57->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    int v33 = v14;
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 96) + 8) + 48));
    v15 = std::__tree<std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>,std::__map_value_compare<long long,std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>,std::less<long long>,true>,std::allocator<std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>((uint64_t **)(*(void *)(*(void *)(a1 + 112) + 8) + 48), v6, &v63);
    if (v33) {
      atomic_fetch_add_explicit(&v33->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v16 = (std::__shared_weak_count *)v15[6];
    uint64_t v15[5] = (uint64_t)v32;
    v15[6] = (uint64_t)v33;
    if (v16) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v16);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 96) + 8) + 48));
    if (*(unsigned char *)(a1 + 153)
      && [*(id *)(*(void *)(a1 + 32) + 272) wantsDetailedKeepLocalRequestableResponse])
    {
      uint64_t v17 = objc_alloc_init(MPModelLibraryResponseKeepLocalStatusConfiguration);
      v18 = v58;
      if (!v58 || !__dynamic_cast(v58, MEMORY[0x1E4F76A50], MEMORY[0x1E4F76A68], 0))
      {
        mlcore::Query::entityClass(v18);
        char v22 = (mlcore *)mlcore::Query::predicate(&v64, v58);
        mlcore::ItemPropertyIsStoreRedownloadable(v22);
        std::allocate_shared[abi:ne180100]<mlcore::UnaryPredicate<int>,std::allocator<mlcore::UnaryPredicate<int>>,mlcore::ModelProperty<int> *&,mlcore::UnaryOperator,void>();
      }
      uint64_t v19 = v59;
      if (v59)
      {
        atomic_fetch_add_explicit(&v59->__shared_owners_, 1uLL, memory_order_relaxed);
        std::__shared_weak_count::__release_shared[abi:ne180100](v19);
      }
      uint64_t v20 = (void *)[*(id *)(a1 + 64) copy];
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __52__MPModelLibraryRequestOperation__executeNewRequest__block_invoke_5;
      v47[3] = &unk_1E57EE3E8;
      id v48 = *(id *)(a1 + 72);
      id v49 = *(id *)(a1 + 80);
      id v50 = v35;
      id v51 = v38;
      id v21 = v20;
      id v52 = v21;
      [(MPModelLibraryResponseKeepLocalStatusConfiguration *)v17 setDownloadablePlaylistItemEntityQueryBlock:v47];

      os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 96) + 8) + 48));
      [*(id *)(a1 + 88) addObject:v17];
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 96) + 8) + 48));
    }
    if (*(unsigned char *)(a1 + 152)) {
      BOOL v23 = v5;
    }
    else {
      BOOL v23 = 0;
    }
    if (v23)
    {
      [*(id *)(a1 + 40) setFilterText:0];
      long long v31 = (void *)[*(id *)(a1 + 64) copy];
      v24 = *(void **)(a1 + 72);
      id v25 = +[MPPropertySet emptyPropertySet];
      id v26 = [*(id *)(*(void *)(a1 + 32) + 272) itemSortDescriptors];
      if (v24)
      {
        [v24 entityQueryForPropertySet:v25 sortDescriptors:v26 context:v38 view:v31];
      }
      else
      {
        int64_t v45 = 0;
        unint64_t v46 = 0;
      }

      v41 = v45;
      v42 = v46;
      if (v46) {
        atomic_fetch_add_explicit(&v46->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      id v40 = 0;
      if (v31)
      {
        [v31 resultsForCoreQuery:&v41 error:&v40];
        id v27 = v40;
      }
      else
      {
        id v27 = 0;
        v43 = 0;
        v44 = 0;
      }
      if (v42) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v42);
      }
      if (!v27)
      {
        uint64_t v28 = v43;
        if (!v43)
        {
          int v30 = [MEMORY[0x1E4F28B00] currentHandler];
          objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 144), *(void *)(*(void *)(a1 + 32) + 272));

          uint64_t v28 = v43;
        }
        if (v44) {
          atomic_fetch_add_explicit(&v44->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        mlcore::EntityQueryResult::propertyCaches(v28);
        mlcore::EntityQueryResult::propertyCaches(v32);
        operator new();
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40), v27);
      if (v44) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v44);
      }

      if (v46) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v46);
      }
    }
    if (v33) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v33);
    }
  }
  if (v57) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v57);
  }

  if (v59) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v59);
  }

LABEL_70:
}

void __52__MPModelLibraryRequestOperation__executeNewRequest__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) mediaLibrary];
  BOOL v5 = [v4 uniqueIdentifier];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__MPModelLibraryRequestOperation__executeNewRequest__block_invoke_3;
  v6[3] = &__block_descriptor_40_e44_v16__0___MPMutableLocalLibraryIdentifiers__8l;
  v6[4] = *(void *)(a1 + 40);
  [v3 setLibraryIdentifiersWithDatabaseID:v5 block:v6];
}

void __52__MPModelLibraryRequestOperation__executeNewRequest__block_invoke_5(void *a1)
{
  v8[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)a1[4];
  if (v2)
  {
    [v2 entityQueryForPropertySet:a1[5] sortDescriptors:a1[6] context:a1[7] view:a1[8]];
    id v3 = v7;
  }
  else
  {
    id v3 = 0;
  }
  v4 = (mlcore *)mlcore::Query::predicate(v8, v3);
  BOOL v5 = (mlcore *)mlcore::PlaylistItemPropertyItemPersistentID(v4);
  IsStoreRedownloadable = (ModelPropertyBase *)mlcore::ItemPropertyIsStoreRedownloadable(v5);
  MPMediaLibraryGetProperty((ModelPropertyBase *)v5, IsStoreRedownloadable);
  std::allocate_shared[abi:ne180100]<mlcore::UnaryPredicate<int>,std::allocator<mlcore::UnaryPredicate<int>>,mlcore::ModelProperty<int> *&,mlcore::UnaryOperator,void>();
}

uint64_t __52__MPModelLibraryRequestOperation__executeNewRequest__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setPersistentID:*(void *)(a1 + 32)];
}

- (id)_sectionProperties
{
  id v3 = [(MPModelRequest *)self->_request sectionProperties];
  if ([(MPModelLibraryRequest *)self->_request wantsDetailedKeepLocalRequestableResponse])
  {
    v4 = [(MPModelRequest *)self->_request sectionKind];
    BOOL v5 = (void *)[v4 modelClass];

    if ([v5 supportsKeepLocalStatusObservation])
    {
      uint64_t v6 = [v5 requiredKeepLocalStatusObservationProperties];
      uint64_t v7 = [v6 propertySetByCombiningWithPropertySet:v3];

      id v3 = (void *)v7;
    }
  }

  return v3;
}

- (void)_sanityCheckRequest
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  v38 = [(MPModelLibraryRequestOperation *)self request];
  uint64_t v2 = [v38 itemKind];
  uint64_t v31 = [v2 modelClass];

  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obunint64_t j = [v38 scopedContainers];
  uint64_t v3 = [obj countByEnumeratingWithState:&v41 objects:v52 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v42;
    uint64_t v32 = *MEMORY[0x1E4F778C8];
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v42 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v7 = objc_opt_class();
        if (v7)
        {
          [v35 addObject:v7];
        }
        else
        {
          v8 = os_log_create("com.apple.amp.mediaplayer", "Library");
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218498;
            uint64_t v47 = self;
            __int16 v48 = 2114;
            id v49 = v38;
            __int16 v50 = 2114;
            id v51 = v6;
            _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_ERROR, "MPModelLibraryRequestOperation: %p _sanityCheckRequest: nil container class request=%{public}@ scopedContainer=%{public}@", buf, 0x20u);
          }

          uint64_t v9 = [NSString stringWithFormat:@"request:%@", v38];
          uint64_t v10 = NSString;
          id v11 = [v38 scopedContainers];
          uint64_t v12 = [v10 stringWithFormat:@"scopedContainers:%@", v11];

          id v37 = [NSString stringWithFormat:@"container:%@", v6];
          dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
          v14 = (void *)MEMORY[0x1E4F77950];
          v15 = NSString;
          uint64_t v36 = [v38 label];
          v16 = [v15 stringWithFormat:@"%@", v36];
          v45[0] = v9;
          v45[1] = v12;
          v45[2] = v37;
          uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:3];
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __53__MPModelLibraryRequestOperation__sanityCheckRequest__block_invoke;
          v39[3] = &unk_1E57F9EA8;
          v18 = v13;
          id v40 = v18;
          [v14 snapshotWithDomain:v32 type:@"Bug" subType:@"ModelRequestWithNilContainerClass" context:v16 triggerThresholdValues:0 events:v17 completion:v39];

          dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v41 objects:v52 count:16];
    }
    while (v3);
  }

  uint64_t v19 = v38;
  if ([v35 containsObject:v31] && v31 != objc_opt_class())
  {
    uint64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v29 = [v38 label];
    [v28 handleFailureInMethod:a2, self, @"MPModelLibraryRequestOperation.mm", 362, @"scopedContainers cannot contain a MPModelObject subclass matching the itemKind's modelClass. label=%@", v29 object file lineNumber description];

    uint64_t v19 = v38;
  }
  uint64_t v20 = [v19 allowedItemIdentifiers];
  for (unint64_t j = 0; j < [v20 count]; ++j)
  {
    for (unint64_t k = 0; k < [v20 count]; ++k)
    {
      if (j != k)
      {
        BOOL v23 = [v20 objectAtIndexedSubscript:j];
        v24 = [v20 objectAtIndexedSubscript:k];
        int v25 = [v23 intersectsSet:v24];

        if (v25)
        {
          id v26 = os_log_create("com.apple.amp.mediaplayer", "Library");
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
          {
            id v27 = [v38 label];
            *(_DWORD *)buf = 134218498;
            uint64_t v47 = self;
            __int16 v48 = 2114;
            id v49 = v27;
            __int16 v50 = 2114;
            id v51 = v20;
            _os_log_impl(&dword_1952E8000, v26, OS_LOG_TYPE_FAULT, "MPModelLibraryRequestOperation: %p _sanityCheckRequest: allowedItemIdentifiers must contain unique array elements -- cannot contain duplicates. label=%{public}@ allowedItemIdentifiers=%{public}@", buf, 0x20u);
          }
        }
      }
    }
  }
}

intptr_t __53__MPModelLibraryRequestOperation__sanityCheckRequest__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __55__MPModelLibraryRequestOperation__executeLegacyRequest__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) uniqueIdentifier];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__MPModelLibraryRequestOperation__executeLegacyRequest__block_invoke_2;
  v5[3] = &unk_1E57F96A0;
  v5[4] = *(void *)(a1 + 40);
  [v3 setLibraryIdentifiersWithDatabaseID:v4 block:v5];
}

void __55__MPModelLibraryRequestOperation__executeLegacyRequest__block_invoke_3(uint64_t a1, uint64_t a2, id *a3)
{
  id v4 = *a3;
  objc_msgSend(*(id *)(a1 + 32), "_insertPropertyCacheForEntityPID:entityClass:entityTranslator:translationContext:propertyCachesVector:", objc_msgSend(v4, "longLongValue"), *(void *)(a1 + 56), *(void *)(a1 + 40), *(void *)(a1 + 48), a1 + 64);
}

uint64_t __55__MPModelLibraryRequestOperation__executeLegacyRequest__block_invoke_31(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _insertPropertyCacheForEntityPID:a2 entityClass:*(void *)(a1 + 56) entityTranslator:*(void *)(a1 + 40) translationContext:*(void *)(a1 + 48) propertyCachesVector:a1 + 64];
}

void __55__MPModelLibraryRequestOperation__executeLegacyRequest__block_invoke_38(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 range];
  uint64_t v6 = v5;
  id v7 = [v3 title];
  std::string::basic_string[abi:ne180100]<0>(v40, (char *)[v7 UTF8String]);

  long long v42 = (char *)v4;
  long long v43 = v6;
  mlcore::Section::Section();
  uint64_t v8 = *(void *)(a1 + 32);
  unint64_t v9 = *(void *)(v8 + 8);
  unint64_t v10 = *(void *)(v8 + 16);
  if (v9 >= v10)
  {
    unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v9 - *(void *)v8) >> 4);
    if (v11 + 1 > 0x555555555555555) {
      std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v10 - *(void *)v8) >> 4);
    uint64_t v13 = 2 * v12;
    if (2 * v12 <= v11 + 1) {
      uint64_t v13 = v11 + 1;
    }
    if (v12 >= 0x2AAAAAAAAAAAAAALL) {
      unint64_t v14 = 0x555555555555555;
    }
    else {
      unint64_t v14 = v13;
    }
    uint64_t v46 = v8 + 16;
    if (v14)
    {
      v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::Section>>(v14);
    }
    else
    {
      v16 = 0;
      uint64_t v15 = 0;
    }
    v18 = (std::string *)&v16[48 * v11];
    long long v42 = v16;
    long long v43 = v18;
    long long v44 = v18;
    int64_t v45 = &v16[48 * v15];
    if (SHIBYTE(v37) < 0)
    {
      std::string::__init_copy_ctor_external(v18, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
      v18 = v44;
    }
    else
    {
      v18->__r_.__value_.__r.__words[2] = v37;
      *(_OWORD *)&v18->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
    }
    uint64_t v19 = &v16[48 * v11];
    *((_DWORD *)v19 + 10) = v39;
    *(_OWORD *)(v19 + 24) = v38;
    long long v44 = v18 + 2;
    uint64_t v20 = *(const std::string::value_type ***)v8;
    id v21 = *(const std::string::value_type ***)(v8 + 8);
    char v22 = v43;
    *(void *)&long long v50 = v43;
    *((void *)&v50 + 1) = v43;
    long long v49 = v50;
    v47[0] = v8 + 16;
    v47[1] = &v49;
    v47[2] = &v50;
    char v48 = 0;
    if (v21 != v20)
    {
      do
      {
        BOOL v23 = v22 - 2;
        v24 = v21 - 6;
        if (*((char *)v21 - 25) < 0)
        {
          std::string::__init_copy_ctor_external(v23, *(v21 - 6), (std::string::size_type)*(v21 - 5));
          id v26 = (std::string *)*((void *)&v50 + 1);
        }
        else
        {
          long long v25 = *(_OWORD *)v24;
          v22[-2].__r_.__value_.__r.__words[2] = (std::string::size_type)*(v21 - 4);
          *(_OWORD *)&v23->__r_.__value_.__l.__data_ = v25;
          id v26 = v22;
        }
        int v27 = *((_DWORD *)v21 - 2);
        *(_OWORD *)&v22[-1].__r_.__value_.__l.__data_ = *(_OWORD *)(v21 - 3);
        LODWORD(v22[-1].__r_.__value_.__r.__words[2]) = v27;
        char v22 = v26 - 2;
        *((void *)&v50 + 1) = v26 - 2;
        v21 -= 6;
      }
      while (v24 != v20);
    }
    char v48 = 1;
    std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<mlcore::Section>,std::reverse_iterator<mlcore::Section*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v47);
    uint64_t v28 = *(std::string **)v8;
    *(void *)uint64_t v8 = v22;
    long long v43 = v28;
    long long v29 = *(std::string **)(v8 + 8);
    *(void *)(v8 + 8) = v44;
    int v30 = v43;
    long long v44 = v29;
    uint64_t v31 = *(char **)(v8 + 16);
    *(void *)(v8 + 16) = v45;
    int64_t v45 = v31;
    long long v42 = (char *)v30;
    unint64_t v17 = *(void *)(v8 + 8);
    std::__split_buffer<mlcore::Section>::~__split_buffer((uint64_t)&v42);
  }
  else
  {
    if (SHIBYTE(v37) < 0)
    {
      std::string::__init_copy_ctor_external(*(std::string **)(v8 + 8), (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
    }
    else
    {
      *(void *)(v9 + 16) = v37;
      *(_OWORD *)unint64_t v9 = *(_OWORD *)__p;
    }
    *(_DWORD *)(v9 + 40) = v39;
    *(_OWORD *)(v9 + 24) = v38;
    unint64_t v17 = v9 + 48;
    *(void *)(v8 + 8) = v17;
  }
  *(void *)(v8 + 8) = v17;
  uint64_t v32 = *(void *)(a1 + 48);
  unint64_t v33 = *(void *)(v32 + 8);
  if (v33 >= *(void *)(v32 + 16))
  {
    std::vector<std::string>::pointer v35 = std::vector<std::string>::__push_back_slow_path<std::string const&>(*(std::vector<std::string> **)(a1 + 48), (long long *)v40);
  }
  else
  {
    if (SHIBYTE(v41) < 0)
    {
      std::string::__init_copy_ctor_external(*(std::string **)(v32 + 8), (const std::string::value_type *)v40[0], (std::string::size_type)v40[1]);
    }
    else
    {
      long long v34 = *(_OWORD *)v40;
      *(void *)(v33 + 16) = v41;
      *(_OWORD *)unint64_t v33 = v34;
    }
    std::vector<std::string>::pointer v35 = (std::vector<std::string>::pointer)(v33 + 24);
    *(void *)(v32 + 8) = v33 + 24;
  }
  *(void *)(v32 + 8) = v35;
  if (SHIBYTE(v37) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v41) < 0) {
    operator delete(v40[0]);
  }
}

uint64_t __55__MPModelLibraryRequestOperation__executeLegacyRequest__block_invoke_40(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _insertPropertyCacheForEntityPID:a2 entityClass:*(void *)(a1 + 56) entityTranslator:*(void *)(a1 + 40) translationContext:*(void *)(a1 + 48) propertyCachesVector:a1 + 64];
}

uint64_t __55__MPModelLibraryRequestOperation__executeLegacyRequest__block_invoke_2_41(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _insertPropertyCacheForEntityPID:a2 entityClass:*(void *)(a1 + 56) entityTranslator:*(void *)(a1 + 40) translationContext:*(void *)(a1 + 48) propertyCachesVector:a1 + 64];
}

void __55__MPModelLibraryRequestOperation__executeLegacyRequest__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(v3, "setPersistentID:", objc_msgSend(*(id *)(a1 + 32), "persistentID"));
}

- (BOOL)_validateRequest
{
  uint64_t v2 = [(MPModelLibraryRequest *)self->_request mediaLibrary];
  id v3 = [v2 databasePath];

  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v5 = [v4 fileExistsAtPath:v3];

  return v5;
}

@end