@interface MPMediaLibrarySystemFilters
+ (NSMutableDictionary)systemFiltersPerLibrary;
+ (OS_dispatch_queue)globalSerialQueue;
+ (id)filtersForLibrary:(id)a3;
- (BOOL)shouldExcludePurchaseHistoryContent;
- (id)_initWithLibrary:(id)a3;
- (void)_updateFilters;
@end

@implementation MPMediaLibrarySystemFilters

- (void).cxx_destruct
{
}

- (void)_updateFilters
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v3 = [(MPMediaLibraryView *)self->_libraryView library];
  uint64_t v4 = [v3 sagaOnDiskDatabaseRevision];

  if (v4)
  {
    v5 = (mlcore *)MEMORY[0x19971D490]();
    mlcore::ItemPropertyRemoteLocationID(v5);
    std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<long long>,std::allocator<mlcore::ComparisonPredicate<long long>>,mlcore::ModelProperty<long long> *&,mlcore::ComparisonOperator,long long const&,void>();
  }
  self->_BOOL shouldExcludePurchaseHistoryContent = *((unsigned char *)v11 + 24);
  v6 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(MPMediaLibraryView *)self->_libraryView library];
    v8 = [v7 uniqueIdentifier];
    BOOL shouldExcludePurchaseHistoryContent = self->_shouldExcludePurchaseHistoryContent;
    *(_DWORD *)buf = 134218754;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    __int16 v15 = 1024;
    int v16 = 0;
    __int16 v17 = 1024;
    BOOL v18 = shouldExcludePurchaseHistoryContent;
    _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_DEFAULT, "MPMediaLibrarySystemFilters %p - Updating filters - Library: %@ - has cloud library revision: %{BOOL}u - purchase history excluded: %{BOOL}u", buf, 0x22u);
  }
  _Block_object_dispose(&v10, 8);
}

void __45__MPMediaLibrarySystemFilters__updateFilters__block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(mlcore::PropertiesQueryResult **)a2;
  uint64_t v4 = *(std::__shared_weak_count **)(a2 + 8);
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v5 = (void *)mlcore::PropertiesQueryResult::allResults(v3);
  if (v5[1] != *v5) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  if (v4)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
}

- (BOOL)shouldExcludePurchaseHistoryContent
{
  v3 = [(MPMediaLibraryView *)self->_libraryView library];
  char v4 = [v3 isHomeSharingLibrary];

  return (v4 & 1) == 0 && self->_shouldExcludePurchaseHistoryContent;
}

- (id)_initWithLibrary:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MPMediaLibrarySystemFilters;
  v5 = [(MPMediaLibrarySystemFilters *)&v13 init];
  if (v5)
  {
    v6 = [[MPMediaLibraryView alloc] initWithLibrary:v4 filteringOptions:0];
    libraryView = v5->_libraryView;
    v5->_libraryView = v6;

    v8 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [(MPMediaLibraryView *)v5->_libraryView library];
      uint64_t v10 = [v9 uniqueIdentifier];
      *(_DWORD *)buf = 134218242;
      __int16 v15 = v5;
      __int16 v16 = 2112;
      __int16 v17 = v10;
      _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_DEFAULT, "MPMediaLibrarySystemFilters %p - Init with library: %@", buf, 0x16u);
    }
    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v5 selector:sel__cloudLibraryAvailabilityDidChange_ name:@"MPMediaLibraryCloudLibraryAvailabilityDidChangeNotification" object:v4];

    [(MPMediaLibrarySystemFilters *)v5 _updateFilters];
  }

  return v5;
}

+ (id)filtersForLibrary:(id)a3
{
  id v5 = a3;
  uint64_t v15 = 0;
  __int16 v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__28855;
  uint64_t v19 = __Block_byref_object_dispose__28856;
  id v20 = 0;
  v6 = [a1 globalSerialQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__MPMediaLibrarySystemFilters_filtersForLibrary___block_invoke;
  v10[3] = &unk_1E57F3998;
  id v13 = a1;
  SEL v14 = a2;
  id v11 = v5;
  uint64_t v12 = &v15;
  id v7 = v5;
  dispatch_sync(v6, v10);

  id v8 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v8;
}

void __49__MPMediaLibrarySystemFilters_filtersForLibrary___block_invoke(uint64_t a1)
{
  id v9 = [*(id *)(a1 + 48) systemFiltersPerLibrary];
  v2 = [*(id *)(a1 + 32) uniqueIdentifier];
  if (!v2)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 48) file:@"MPMediaLibrarySystemFilters.mm" lineNumber:61 description:@"Given library has no library identifier"];
  }
  v3 = [v9 objectForKeyedSubscript:v2];

  if (!v3)
  {
    id v4 = [[MPMediaLibrarySystemFilters alloc] _initWithLibrary:*(void *)(a1 + 32)];
    [v9 setObject:v4 forKeyedSubscript:v2];
  }
  uint64_t v5 = [v9 objectForKeyedSubscript:v2];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

+ (NSMutableDictionary)systemFiltersPerLibrary
{
  if (+[MPMediaLibrarySystemFilters systemFiltersPerLibrary]::onceToken != -1) {
    dispatch_once(&+[MPMediaLibrarySystemFilters systemFiltersPerLibrary]::onceToken, &__block_literal_global_28866);
  }
  v2 = (void *)+[MPMediaLibrarySystemFilters systemFiltersPerLibrary]::__systemFiltersPerLibrary;

  return (NSMutableDictionary *)v2;
}

void __54__MPMediaLibrarySystemFilters_systemFiltersPerLibrary__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)+[MPMediaLibrarySystemFilters systemFiltersPerLibrary]::__systemFiltersPerLibrary;
  +[MPMediaLibrarySystemFilters systemFiltersPerLibrary]::__systemFiltersPerLibrary = (uint64_t)v0;
}

+ (OS_dispatch_queue)globalSerialQueue
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__MPMediaLibrarySystemFilters_globalSerialQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[MPMediaLibrarySystemFilters globalSerialQueue]::onceToken != -1) {
    dispatch_once(&+[MPMediaLibrarySystemFilters globalSerialQueue]::onceToken, block);
  }
  v2 = (void *)+[MPMediaLibrarySystemFilters globalSerialQueue]::__globalSerialQueue;

  return (OS_dispatch_queue *)v2;
}

void __48__MPMediaLibrarySystemFilters_globalSerialQueue__block_invoke(uint64_t a1)
{
  v1 = NSString;
  NSStringFromClass(*(Class *)(a1 + 32));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [v1 stringWithFormat:@"com.apple.%@.global.serial.queue", v7];

  id v8 = v2;
  v3 = (const char *)[v8 UTF8String];
  id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v5 = dispatch_queue_create(v3, v4);
  uint64_t v6 = (void *)+[MPMediaLibrarySystemFilters globalSerialQueue]::__globalSerialQueue;
  +[MPMediaLibrarySystemFilters globalSerialQueue]::__globalSerialQueue = (uint64_t)v5;
}

@end