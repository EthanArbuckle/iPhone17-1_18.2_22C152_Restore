@interface MPMediaLibraryView
- (BOOL)hasEntitiesForModelKind:(id)a3;
- (MPMediaLibrary)library;
- (MPMediaLibraryView)initWithLibrary:(id)a3 filteringOptions:(unint64_t)a4;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (shared_ptr<mlcore::DeviceLibraryView>)mlCoreView;
- (shared_ptr<mlcore::QueryResult>)_performCoreQuery:(shared_ptr<mlcore:(id *)a4 :Query>)a3 error:;
- (shared_ptr<mlcore::QueryResult>)resultsForCoreQuery:(shared_ptr<mlcore:(id *)a4 :Query>)a3 error:;
- (uint64_t)performCoreQuery:withCompletion:;
- (uint64_t)performCoreSearchQuery:withCompletion:;
- (unint64_t)filteringOptions;
- (void)performCoreQuery:(shared_ptr<mlcore:(id)a4 :Query>)a3 withCompletion:;
- (void)performCoreQuery:withCompletion:;
- (void)performCoreSearchQuery:(shared_ptr<mlcore:(id)a4 :LocalizedSearchQuery>)a3 withCompletion:;
- (void)performCoreSearchQuery:withCompletion:;
@end

@implementation MPMediaLibraryView

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);
  cntrl = self->_coreView.__cntrl_;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(MPMediaLibraryView *)self library];
  v6 = objc_msgSend(v4, "initWithLibrary:filteringOptions:", v5, -[MPMediaLibraryView filteringOptions](self, "filteringOptions"));

  return v6;
}

- (MPMediaLibrary)library
{
  return self->_library;
}

- (MPMediaLibraryView)initWithLibrary:(id)a3 filteringOptions:(unint64_t)a4
{
  id v7 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MPMediaLibraryView;
  v8 = [(MPMediaLibraryView *)&v21 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_library, a3);
    v9->_filteringOptions = a4;
    library = v9->_library;
    if (library)
    {
      [(MPMediaLibrary *)library _MediaLibrary_coreLibrary];
      uint64_t v19 = v15;
      v20 = v16;
      if (v16) {
        atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
      }
    }
    else
    {
      v16 = 0;
      uint64_t v19 = 0;
      v20 = 0;
    }
    mlcore::LibraryView::viewWithLibrary();
    v11 = v18;
    if (v18) {
      atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v9->_coreView.__cntrl_;
    v9->_coreView.__ptr_ = v17;
    v9->_coreView.__cntrl_ = (__shared_weak_count *)v11;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    }
    if (v18) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v18);
    }
    if (v20) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v20);
    }
    if (MPMLCoreInitialize(void)::onceToken != -1) {
      dispatch_once(&MPMLCoreInitialize(void)::onceToken, &__block_literal_global_48557);
    }
    mlcore::LibraryView::filters((mlcore::LibraryView *)v9->_coreView.__ptr_);
    if ((a4 & 0x10000) == 0)
    {
      v13 = +[MPRestrictionsMonitor sharedRestrictionsMonitor];
      mlcore::ContentRestrictions::ContentRestrictions((mlcore::ContentRestrictions *)&v17);
      [v13 allowsExplicitContent];
      mlcore::ContentRestrictions::setRestrictExplicitLyrics((mlcore::ContentRestrictions *)&v17);
      [v13 maximumTVShowRating];
      mlcore::ContentRestrictions::setRestrictedTVShowsRank((mlcore::ContentRestrictions *)&v17);
      [v13 maximumMovieRating];
      mlcore::ContentRestrictions::setRestrictedMoviesRank((mlcore::ContentRestrictions *)&v17);
      [v13 allowsMusicVideos];
      mlcore::ContentRestrictions::setRestrictMusicVideos((mlcore::ContentRestrictions *)&v17);
      mlcore::LibraryView::setContentRestrictions();
    }
    _os_feature_enabled_impl();
    mlcore::LibraryView::setFilters((mlcore::LibraryView *)v9->_coreView.__ptr_);
    if (v16) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v16);
    }
  }

  return v9;
}

- (unint64_t)filteringOptions
{
  return self->_filteringOptions;
}

- (shared_ptr<mlcore::DeviceLibraryView>)mlCoreView
{
  cntrl = self->_coreView.__cntrl_;
  *v2 = self->_coreView.__ptr_;
  v2[1] = (DeviceLibraryView *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (DeviceLibraryView *)self;
  return result;
}

- (void)performCoreQuery:(shared_ptr<mlcore:(id)a4 :Query>)a3 withCompletion:
{
  var0 = a3.var0;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v6 = a3.var1;
  +[MPMediaLibrary logDatabaseAccess];
  ptr = self->_coreView.__ptr_;
  uint64_t v9 = *(void *)var0;
  v8 = (std::__shared_weak_count *)*((void *)var0 + 1);
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v17[0] = &unk_1EE672818;
  v17[1] = MEMORY[0x19971E0F0](v6);
  v17[3] = v17;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  std::__function::__value_func<void ()(std::shared_ptr<mlcore::QueryResult>)>::__value_func[abi:ne180100]((uint64_t)v18, (uint64_t)v17);
  uint64_t v15 = v9;
  v16 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v13 = 0;
  v14 = 0;
  std::__function::__value_func<void ()(std::shared_ptr<mlcore::QueryResult>)>::__value_func[abi:ne180100]((uint64_t)v19, (uint64_t)v18);
  v22 = 0;
  v10 = operator new(0x28uLL);
  v11 = v10;
  void *v10 = &unk_1EE672978;
  if (!v20)
  {
    v12 = v10 + 4;
    goto LABEL_11;
  }
  if (v20 != v19)
  {
    v12 = &v20;
    v10[4] = v20;
LABEL_11:
    void *v12 = 0;
    goto LABEL_13;
  }
  v10[4] = v10 + 1;
  (*(void (**)(void *))(v19[0] + 24))(v19);
LABEL_13:
  v22 = v11;
  (**(void (***)(DeviceLibraryView *, uint64_t *, uint64_t *, void *))ptr)(ptr, &v15, &v13, v21);
  std::__function::__value_func<void ()(std::shared_ptr<mlcore::QueryResult>)>::~__value_func[abi:ne180100](v21);
  std::__function::__value_func<void ()(std::shared_ptr<mlcore::QueryResult>)>::~__value_func[abi:ne180100](v19);
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }
  std::__function::__value_func<void ()(std::shared_ptr<mlcore::QueryResult>)>::~__value_func[abi:ne180100](v18);
  if (v8)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    std::__function::__value_func<void ()(std::shared_ptr<mlcore::QueryResult>)>::~__value_func[abi:ne180100](v17);
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  else
  {
    std::__function::__value_func<void ()(std::shared_ptr<mlcore::QueryResult>)>::~__value_func[abi:ne180100](v17);
  }
}

- (void)performCoreQuery:withCompletion:
{
  JUMPOUT(0x19971D860);
}

- (uint64_t)performCoreQuery:withCompletion:
{
  return a1;
}

- (shared_ptr<mlcore::QueryResult>)_performCoreQuery:(shared_ptr<mlcore:(id *)a4 :Query>)a3 error:
{
  var1 = a3.var1;
  var0 = a3.var0;
  v8 = v4;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x4012000000;
  v30 = __Block_byref_object_copy__312;
  v31 = __Block_byref_object_dispose__313;
  v32 = &unk_1956C748F;
  uint64_t v33 = 0;
  v34 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__9;
  v25 = __Block_byref_object_dispose__10;
  id v26 = 0;
  v10 = (std::__shared_weak_count *)*((void *)var0 + 1);
  uint64_t v19 = *(void *)var0;
  v20 = v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __46__MPMediaLibraryView__performCoreQuery_error___block_invoke;
  v15[3] = &unk_1E57EDA88;
  v17 = &v27;
  v18 = &v21;
  v11 = v9;
  v16 = v11;
  [(MPMediaLibraryView *)self performCoreQuery:&v19 withCompletion:v15];
  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  if (var1) {
    *(void *)var1 = (id) v22[5];
  }
  uint64_t v12 = v28[7];
  void *v8 = v28[6];
  v8[1] = v12;
  if (v12) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v12 + 8), 1uLL, memory_order_relaxed);
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  if (v34) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v34);
  }

  result.var1 = v14;
  result.var0 = v13;
  return result;
}

void __46__MPMediaLibraryView__performCoreQuery_error___block_invoke(uint64_t a1, uint64_t *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *a2;
  uint64_t v7 = a2[1];
  if (v7) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
  }
  dispatch_semaphore_t v9 = *(std::__shared_weak_count **)(v6 + 56);
  *(void *)(v6 + 48) = v8;
  *(void *)(v6 + 56) = v7;
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
  id v12 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (shared_ptr<mlcore::QueryResult>)resultsForCoreQuery:(shared_ptr<mlcore:(id *)a4 :Query>)a3 error:
{
  var1 = a3.var1;
  uint64_t v8 = v4;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x4012000000;
  id v26 = __Block_byref_object_copy__312;
  uint64_t v27 = __Block_byref_object_dispose__313;
  v28 = &unk_1956C748F;
  uint64_t v29 = 0;
  v30 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__9;
  uint64_t v21 = __Block_byref_object_dispose__10;
  id v22 = 0;
  dispatch_semaphore_t v9 = (std::__shared_weak_count *)*((void *)a3.var0 + 1);
  uint64_t v15 = *(void *)a3.var0;
  v16 = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __48__MPMediaLibraryView_resultsForCoreQuery_error___block_invoke;
  v14[3] = &unk_1E57EDA60;
  v14[4] = &v23;
  v14[5] = &v17;
  v14[6] = &v31;
  -[MPMediaLibraryView performCoreQuery:withCompletion:](self, "performCoreQuery:withCompletion:", &v15, v14, a4);
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }
  if (*((unsigned char *)v32 + 24))
  {
    if (!var1) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2 object:self file:@"MPMediaLibraryView.mm" lineNumber:224 description:@"MLCore library queries should be guaranteed no-escape"];

  if (var1) {
LABEL_7:
  }
    *(void *)var1 = (id) v18[5];
LABEL_8:
  uint64_t v10 = v24[7];
  void *v8 = v24[6];
  v8[1] = v10;
  if (v10) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  if (v30) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v30);
  }
  _Block_object_dispose(&v31, 8);
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

void __48__MPMediaLibraryView_resultsForCoreQuery_error___block_invoke(void *a1, uint64_t *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1[4] + 8);
  uint64_t v8 = *a2;
  uint64_t v7 = a2[1];
  if (v7) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
  }
  dispatch_semaphore_t v9 = *(std::__shared_weak_count **)(v6 + 56);
  *(void *)(v6 + 48) = v8;
  *(void *)(v6 + 56) = v7;
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  uint64_t v10 = *(void *)(a1[5] + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
  id v12 = v5;

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
}

- (void)performCoreSearchQuery:(shared_ptr<mlcore:(id)a4 :LocalizedSearchQuery>)a3 withCompletion:
{
  ptr = a3.__ptr_;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = a3.__cntrl_;
  +[MPMediaLibrary logDatabaseAccess];
  uint64_t v7 = self->_coreView.__ptr_;
  uint64_t v9 = *(void *)ptr;
  uint64_t v8 = (std::__shared_weak_count *)*((void *)ptr + 1);
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v17[0] = &unk_1EE672870;
  v17[1] = MEMORY[0x19971E0F0](v6);
  v17[3] = v17;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  std::__function::__value_func<void ()(std::shared_ptr<mlcore::LocalizedSearchQueryResult>)>::__value_func[abi:ne180100]((uint64_t)v18, (uint64_t)v17);
  uint64_t v15 = v9;
  v16 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v13 = 0;
  v14 = 0;
  std::__function::__value_func<void ()(std::shared_ptr<mlcore::LocalizedSearchQueryResult>)>::__value_func[abi:ne180100]((uint64_t)v19, (uint64_t)v18);
  id v22 = 0;
  uint64_t v10 = operator new(0x28uLL);
  v11 = v10;
  void *v10 = &unk_1EE672920;
  if (!v20)
  {
    id v12 = v10 + 4;
    goto LABEL_11;
  }
  if (v20 != v19)
  {
    id v12 = &v20;
    v10[4] = v20;
LABEL_11:
    void *v12 = 0;
    goto LABEL_13;
  }
  v10[4] = v10 + 1;
  (*(void (**)(void *))(v19[0] + 24))(v19);
LABEL_13:
  id v22 = v11;
  (**(void (***)(DeviceLibraryView *, uint64_t *, uint64_t *, void *))v7)(v7, &v15, &v13, v21);
  std::__function::__value_func<void ()(std::shared_ptr<mlcore::QueryResult>)>::~__value_func[abi:ne180100](v21);
  std::__function::__value_func<void ()(std::shared_ptr<mlcore::LocalizedSearchQueryResult>)>::~__value_func[abi:ne180100](v19);
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }
  std::__function::__value_func<void ()(std::shared_ptr<mlcore::LocalizedSearchQueryResult>)>::~__value_func[abi:ne180100](v18);
  if (v8)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    std::__function::__value_func<void ()(std::shared_ptr<mlcore::LocalizedSearchQueryResult>)>::~__value_func[abi:ne180100](v17);
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  else
  {
    std::__function::__value_func<void ()(std::shared_ptr<mlcore::LocalizedSearchQueryResult>)>::~__value_func[abi:ne180100](v17);
  }
}

- (void)performCoreSearchQuery:withCompletion:
{
  JUMPOUT(0x19971D860);
}

- (uint64_t)performCoreSearchQuery:withCompletion:
{
  return a1;
}

- (BOOL)hasEntitiesForModelKind:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MPMediaLibraryEntityTranslationContext);
  [(MPMediaLibraryEntityTranslationContext *)v5 setMediaLibrary:self->_library];
  [(MPMediaLibraryEntityTranslationContext *)v5 setModelKind:v4];
  uint64_t v6 = +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", [v4 modelClass]);
  uint64_t v7 = +[MPPropertySet emptyPropertySet];
  if (v6)
  {
    [v6 entityQueryForPropertySet:v7 sortDescriptors:0 context:v5 view:self];
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
  }

  long long v13 = xmmword_1956897C0;
  mlcore::RangeQuery::setRange();
  uint64_t v11 = v14;
  id v12 = v15;
  if (v15) {
    atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [(MPMediaLibraryView *)self _performCoreQuery:&v11 error:0];
  uint64_t v9 = (std::__shared_weak_count *)*((void *)&v13 + 1);
  uint64_t v8 = (mlcore::EntityQueryResult *)v13;
  if (*((void *)&v13 + 1))
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v13 + 1) + 8), 1uLL, memory_order_relaxed);
    if (*((void *)&v13 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v13 + 1));
    }
  }
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  if (v8) {
    LOBYTE(v8) = mlcore::EntityQueryResult::entityCount(v8) != 0;
  }
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }

  return (char)v8;
}

@end