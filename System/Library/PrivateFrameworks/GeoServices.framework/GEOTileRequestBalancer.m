@interface GEOTileRequestBalancer
+ (id)balancerForRequester:(id)a3;
+ (unint64_t)maxRunningOperationsCount;
- (GEOTileRequestBalancer)init;
- (__wrap_iter<(anonymous)_next_requester;
- (id)_initWithMaxRunningOperationsCount:(unint64_t)a3;
- (id)captureStatePlistWithHints:(os_state_hints_s *)a3;
- (void)_addRequester:(id)a3 tileKeys:(id)a4 priorities:(id)a5;
- (void)_pruneEmptyRequesters;
- (void)_removeRequester:(id)a3;
- (void)_requester:(id)a3 incrementRunningOperationsCount:(int64_t)a4;
- (void)_requester:(void *)a3 removeTileKey:(uint64_t)a4;
- (void)_requester:(void *)a3 updatePriority:(uint64_t)a4 tileKey:(uint64_t)a5;
- (void)_startOperations;
- (void)_startOperationsWithAvailableCount:(unint64_t)a3;
- (void)addRequester:(id)a3 tileKeys:(id)a4 priorities:(id)a5;
- (void)dealloc;
- (void)removeRequester:(id)a3;
- (void)requester:(id)a3 completedOperations:(unint64_t)a4;
- (void)requester:(void *)a3 removeTileKey:(long long *)a4;
- (void)requester:(void *)a3 updatePriority:(int)a4 tileKey:(long long *)a5;
- (void)requesters;
@end

@implementation GEOTileRequestBalancer

- (GEOTileRequestBalancer)init
{
  result = (GEOTileRequestBalancer *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (id)_initWithMaxRunningOperationsCount:(unint64_t)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)GEOTileRequestBalancer;
  if ([(GEOTileRequestBalancer *)&v4 init]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  GEOUnregisterStateCaptureLegacy();
  requesters = (id **)self->_requesters;
  if (requesters)
  {
    if (*requesters)
    {
      operator delete(*requesters);
    }
    MEMORY[0x18C11F580](requesters, 0x20C40960023A9);
    self->_requesters = 0;
  }
  randomIndexGenerator = self->_randomIndexGenerator;
  if (randomIndexGenerator)
  {
    MEMORY[0x18C11F580](randomIndexGenerator, 0x1000C407BAC9B3ELL);
    self->_randomIndexGenerator = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)GEOTileRequestBalancer;
  [(GEOTileRequestBalancer *)&v5 dealloc];
}

- (void)requesters
{
  return self->_requesters;
}

+ (unint64_t)maxRunningOperationsCount
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t UInteger = GEOConfigGetUInteger(GeoServicesConfig_MaxConcurrentTileRequests, (uint64_t)off_1E9113F38);
  if (!UInteger) {
    return 60;
  }
  unint64_t v3 = UInteger;
  objc_super v4 = GEOGetTileLoadingLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3 < 0x3E8)
  {
    if (v5)
    {
      int v7 = 134217984;
      unint64_t v8 = v3;
      _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_DEBUG, "Maximum concurrent tile requests is limited to %llu", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      int v7 = 134217984;
      unint64_t v8 = v3;
      _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_DEBUG, "Maximum concurrent tile requests is unlimited (%llu)", (uint8_t *)&v7, 0xCu);
    }
    unint64_t v3 = -1;
  }

  return v3;
}

+ (id)balancerForRequester:(id)a3
{
  objc_super v4 = (_anonymous_namespace_ *)a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__69;
  v17 = __Block_byref_object_dispose__69;
  BOOL v5 = v18 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__GEOTileRequestBalancer_balancerForRequester___block_invoke;
  block[3] = &unk_1E53E88F8;
  v10 = v4;
  v11 = &v13;
  id v12 = a1;
  v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __47__GEOTileRequestBalancer_balancerForRequester___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) shouldParticipateInBalancerScheduling])
  {
    id WeakRetained = objc_loadWeakRetained(&_MergedGlobals_275);
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    objc_super v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = WeakRetained;

    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
      return;
    }
    uint64_t v5 = objc_msgSend(objc_alloc(*(Class *)(a1 + 48)), "_initWithMaxRunningOperationsCount:", objc_msgSend(*(id *)(a1 + 48), "maxRunningOperationsCount"));
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
    unint64_t v8 = &_MergedGlobals_275;
  }
  else
  {
    id v9 = objc_loadWeakRetained(&qword_1EB29FF88);
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
      return;
    }
    uint64_t v12 = [objc_alloc(*(Class *)(a1 + 48)) _initWithMaxRunningOperationsCount:-1];
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
    unint64_t v8 = &qword_1EB29FF88;
  }

  v14 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeWeak(v8, v14);
}

- (void)addRequester:(id)a3 tileKeys:(id)a4 priorities:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v11 = uint64_t v10 = (_anonymous_namespace_ *)a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__GEOTileRequestBalancer_addRequester_tileKeys_priorities___block_invoke;
  v15[3] = &unk_1E53E9738;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  uint64_t v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __59__GEOTileRequestBalancer_addRequester_tileKeys_priorities___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addRequester:*(void *)(a1 + 40) tileKeys:*(void *)(a1 + 48) priorities:*(void *)(a1 + 56)];
}

- (void)_addRequester:(id)a3 tileKeys:(id)a4 priorities:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(GEOTileRequestBalancer *)self requesters];
  uint64_t v12 = v11;
  unint64_t v13 = v11[2];
  unint64_t v14 = v11[1];
  if (v14 >= v13)
  {
    unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v14 - *v11) >> 3);
    if (v16 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v17 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v13 - *v11) >> 3);
    uint64_t v18 = 2 * v17;
    if (2 * v17 <= v16 + 1) {
      uint64_t v18 = v16 + 1;
    }
    if (v17 >= 0x555555555555555) {
      unint64_t v19 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v19 = v18;
    }
    v34 = v11 + 2;
    if (v19)
    {
      if (v19 > 0xAAAAAAAAAAAAAAALL) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      v20 = (char *)operator new(24 * v19);
    }
    else
    {
      v20 = 0;
    }
    v30 = v20;
    v31 = &v20[24 * v16];
    uint64_t v32 = (uint64_t)v31;
    v33 = &v20[24 * v19];
    uint64_t v21 = (uint64_t)v31;
    unint64_t v15 = (unint64_t)(v31 + 24);
    uint64_t v23 = *v12;
    uint64_t v22 = v12[1];
    if (v22 == *v12)
    {
      uint64_t v27 = v12[1];
    }
    else
    {
      id v29 = v8;
      uint64_t v24 = 0;
      do
      {
        uint64_t v25 = v21 + v24;
        objc_moveWeak((id *)(v21 + v24 - 24), (id *)(v22 + v24 - 24));
        uint64_t v26 = *(void *)(v22 + v24 - 16);
        *(void *)(v22 + v24 - 16) = 0;
        *(void *)(v25 - 16) = v26;
        *(void *)(v25 - 8) = *(void *)(v22 + v24 - 8);
        v24 -= 24;
      }
      while (v22 + v24 != v23);
      uint64_t v27 = *v12;
      uint64_t v22 = v12[1];
      v21 += v24;
      id v8 = v29;
    }
    *uint64_t v12 = v21;
    v30 = (char *)v27;
    v31 = (char *)v27;
    v12[1] = v15;
    uint64_t v32 = v22;
    v28 = (char *)v12[2];
    v12[2] = (uint64_t)v33;
    v33 = v28;
  }
  else
  {
    unint64_t v15 = v14 + 24;
    v12[1] = v15;
  }
  v12[1] = v15;
  [(GEOTileRequestBalancer *)self _startOperations];
}

- (void)removeRequester:(id)a3
{
  v5 = objc_super v4 = (_anonymous_namespace_ *)a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__GEOTileRequestBalancer_removeRequester___block_invoke;
  v7[3] = &unk_1E53D81E8;
  v7[4] = self;
  id v8 = v4;
  uint64_t v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __42__GEOTileRequestBalancer_removeRequester___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeRequester:*(void *)(a1 + 40)];
}

- (void)_removeRequester:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(GEOTileRequestBalancer *)self requesters];
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];
  id v20 = v4;
  if (v6 != v7)
  {
    while (1)
    {
      id WeakRetained = objc_loadWeakRetained((id *)v6);
      if (!WeakRetained) {
        break;
      }
      id v9 = WeakRetained;
      id v10 = objc_loadWeakRetained((id *)v6);
      if (v10 == v20)
      {

        break;
      }
      uint64_t v11 = [*(id *)(v6 + 8) count];

      if (!v11) {
        break;
      }
      v6 += 24;
      if (v6 == v7)
      {
        uint64_t v6 = v7;
        goto LABEL_17;
      }
    }
    if (v6 != v7)
    {
      for (uint64_t i = v6 + 24; i != v7; i += 24)
      {
        id v13 = objc_loadWeakRetained((id *)i);
        if (v13)
        {
          unint64_t v14 = v13;
          id v15 = objc_loadWeakRetained((id *)i);
          if (v15 == v20)
          {
          }
          else
          {
            uint64_t v16 = [*(id *)(i + 8) count];

            if (v16)
            {
              id v17 = objc_loadWeakRetained((id *)i);
              objc_storeWeak((id *)v6, v17);

              uint64_t v18 = *(void *)(i + 8);
              *(void *)(i + 8) = 0;
              unint64_t v19 = *(void **)(v6 + 8);
              *(void *)(v6 + 8) = v18;

              *(void *)(v6 + 16) = *(void *)(i + 16);
              v6 += 24;
            }
          }
        }
      }
    }
  }
LABEL_17:

  [(GEOTileRequestBalancer *)self _startOperations];
}

- (void)_pruneEmptyRequesters
{
  v2 = [(GEOTileRequestBalancer *)self requesters];
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  if (*v2 != v4)
  {
    while (1)
    {
      id WeakRetained = objc_loadWeakRetained((id *)v3);

      if (!WeakRetained) {
        break;
      }
      v3 += 24;
      if (v3 == v4)
      {
        uint64_t v3 = v4;
        goto LABEL_5;
      }
    }
    if (v3 != v4)
    {
      for (uint64_t i = v3 + 24; i != v4; i += 24)
      {
        id v8 = objc_loadWeakRetained((id *)i);

        if (v8)
        {
          id v9 = objc_loadWeakRetained((id *)i);
          objc_storeWeak((id *)v3, v9);

          uint64_t v10 = *(void *)(i + 8);
          *(void *)(i + 8) = 0;
          uint64_t v11 = *(void **)(v3 + 8);
          *(void *)(v3 + 8) = v10;

          *(void *)(v3 + 16) = *(void *)(i + 16);
          v3 += 24;
        }
      }
    }
  }
LABEL_5:
  uint64_t v6 = v2[1];
}

- (void)_requester:(id)a3 incrementRunningOperationsCount:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(GEOTileRequestBalancer *)self requesters];
  for (uint64_t i = *v7; i != v7[1]; i += 24)
  {
    id WeakRetained = objc_loadWeakRetained((id *)i);

    if (WeakRetained == v6)
    {
      uint64_t v10 = *(void *)(i + 16);
      int64_t v11 = (v10 + a4) & ~((v10 + a4) >> 63);
      if (v10 != v11)
      {
        uint64_t v12 = GEOGetTileLoadingLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          id v13 = objc_loadWeakRetained((id *)i);
          int v14 = 134218240;
          int64_t v15 = v11;
          __int16 v16 = 2048;
          id v17 = v13;
          _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_DEBUG, "Balancer is setting running operations count to %zu for requester %p.", (uint8_t *)&v14, 0x16u);
        }
        *(void *)(i + 16) = v11;
      }
      break;
    }
  }
}

- (void)requester:(id)a3 completedOperations:(unint64_t)a4
{
  uint64_t v7 = v6 = (_anonymous_namespace_ *)a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__GEOTileRequestBalancer_requester_completedOperations___block_invoke;
  block[3] = &unk_1E53E74B0;
  void block[4] = self;
  uint64_t v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __56__GEOTileRequestBalancer_requester_completedOperations___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _requester:*(void *)(a1 + 40) incrementRunningOperationsCount:-*(void *)(a1 + 48)];
  v2 = *(void **)(a1 + 32);

  return [v2 _startOperations];
}

- (void)requester:(void *)a3 updatePriority:(int)a4 tileKey:(long long *)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = v14 = *a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__GEOTileRequestBalancer_requester_updatePriority_tileKey___block_invoke;
  v11[3] = &unk_1E53E9760;
  v11[4] = a1;
  uint64_t v12 = v8;
  int v13 = a4;
  uint64_t v10 = v8;
  dispatch_async(v9, v11);
}

uint64_t __59__GEOTileRequestBalancer_requester_updatePriority_tileKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requester:updatePriority:tileKey:", *(void *)(a1 + 40), *(unsigned int *)(a1 + 48), *(void *)(a1 + 52), *(void *)(a1 + 60));
}

- (void)_requester:(void *)a3 updatePriority:(uint64_t)a4 tileKey:(uint64_t)a5
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v12[0] = a5;
  v12[1] = a6;
  id v8 = a3;
  uint64_t v9 = [a1 requesters];
  for (uint64_t i = *(id **)v9; i != *(id **)(v9 + 8); i += 3)
  {
    id WeakRetained = objc_loadWeakRetained(i);

    if (WeakRetained == v8)
    {
      [i[1] setPriority:a4 forKey:v12];
      break;
    }
  }
  [a1 _startOperations];
}

- (void)requester:(void *)a3 removeTileKey:(long long *)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = v11 = *a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__GEOTileRequestBalancer_requester_removeTileKey___block_invoke;
  block[3] = &unk_1E53D8440;
  void block[4] = a1;
  uint64_t v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __50__GEOTileRequestBalancer_requester_removeTileKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requester:removeTileKey:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (void)_requester:(void *)a3 removeTileKey:(uint64_t)a4
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v10[0] = a4;
  v10[1] = a5;
  id v6 = a3;
  uint64_t v7 = [a1 requesters];
  for (uint64_t i = *(id **)v7; i != *(id **)(v7 + 8); i += 3)
  {
    id WeakRetained = objc_loadWeakRetained(i);

    if (WeakRetained == v6)
    {
      [i[1] removeKey:v10];
      break;
    }
  }
}

- (void)_startOperations
{
  uint64_t v3 = [(GEOTileRequestBalancer *)self requesters];
  [(GEOTileRequestBalancer *)self _pruneEmptyRequesters];
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  if (*v3 == v5)
  {
    unint64_t v6 = 0;
  }
  else
  {
    unint64_t v6 = 0;
    do
    {
      v6 += *(void *)(v4 + 16);
      v4 += 24;
    }
    while (v4 != v5);
  }
  unint64_t maxRunningOperationsCount = self->_maxRunningOperationsCount;
  if (maxRunningOperationsCount > v6)
  {
    [(GEOTileRequestBalancer *)self _startOperationsWithAvailableCount:maxRunningOperationsCount - v6];
  }
}

- (void)_startOperationsWithAvailableCount:(unint64_t)a3
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(GEOTileRequestBalancer *)self requesters];
  uint64_t v5 = (id *)*v4;
  if (*v4 == v4[1])
  {
    unsigned int v6 = 0;
  }
  else
  {
    unsigned int v6 = 0;
    do
    {
      id WeakRetained = objc_loadWeakRetained(v5);
      unsigned int v8 = [WeakRetained highestRunningOperationPriority];
      if (v6 <= v8) {
        unsigned int v6 = v8;
      }

      v5 += 3;
    }
    while (v5 != (id *)v4[1]);
  }
  v94 = 0;
  v95 = 0;
  v96 = 0;
  long long v91 = 0u;
  long long v92 = 0u;
  float v93 = 1.0;
  memset(v89, 0, sizeof(v89));
  int v90 = 1065353216;
  if (a3)
  {
    uint64_t v82 = 0;
    v80 = v4;
    unint64_t v9 = a3;
    while (1)
    {
      v10.var0 = (RequesterTileKeys *)[(GEOTileRequestBalancer *)self _next_requester];
      var0 = (id *)v10.var0;
      if ((RequesterTileKeys *)v4[1] == v10.var0)
      {
LABEL_150:
        for (uint64_t i = (uint64_t **)v92; i; uint64_t i = (uint64_t **)*i)
        {
          v72 = i[3];
          *(void *)buf = i + 2;
          uint64_t v73 = *((void *)std::__hash_table<std::__hash_value_type<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,unsigned long>,std::__unordered_map_hasher<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,unsigned long>,std::hash<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::__unordered_map_equal<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,unsigned long>,std::equal_to<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::hash<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::allocator<std::__hash_value_type<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,unsigned long>>>::__emplace_unique_key_args<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::piecewise_construct_t const&,std::tuple<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc> const&>,std::tuple<>>((float *)v89, (uint64_t)(i + 2), (uint64_t *)buf)+ 5);
          uint64_t v74 = (uint64_t)i[5];
          v85[0] = MEMORY[0x1E4F143A8];
          v85[1] = 3221225472;
          v85[2] = __61__GEOTileRequestBalancer__startOperationsWithAvailableCount___block_invoke;
          v85[3] = &unk_1E53E9788;
          uint64_t v88 = v73;
          v75 = v72;
          v86 = v75;
          v87 = self;
          [v75 createAndStartOperationsForTileKeys:v74 completion:v85];
        }
        if (v82)
        {
          v76 = GEOGetTileLoadingLog();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218240;
            *(void *)&buf[4] = v82;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = a3;
            _os_log_impl(&dword_188D96000, v76, OS_LOG_TYPE_DEBUG, "Balancer started %llu operations for available count = %llu", buf, 0x16u);
          }
        }
        break;
      }
      unsigned int v12 = [*((id *)v10.var0 + 1) highestPriority];
      unint64_t maxRunningOperationsCount = self->_maxRunningOperationsCount;
      if (maxRunningOperationsCount)
      {
        if (maxRunningOperationsCount < 0x1F)
        {
          if (v12 > 0x7FFFFFFD)
          {
LABEL_17:
            unint64_t maxRunningOperationsCount = 0;
            goto LABEL_23;
          }
          if (--maxRunningOperationsCount >= self->_maxRunningOperationsCount / 3u) {
            unint64_t maxRunningOperationsCount = self->_maxRunningOperationsCount / 3u;
          }
        }
        else
        {
          if (v12 > 0x7FFFFFFD) {
            goto LABEL_17;
          }
          if (v12 >> 30)
          {
            unint64_t maxRunningOperationsCount = 8;
          }
          else
          {
            maxRunningOperationsCount -= 10;
            if (v6 <= 0x7FFFFFFE) {
              unint64_t maxRunningOperationsCount = 16;
            }
          }
        }
      }
LABEL_23:
      if (v9 <= maxRunningOperationsCount) {
        goto LABEL_150;
      }
      unint64_t v83 = v9;
      id v81 = objc_loadWeakRetained(var0);
      int v101 = 0;
      uint64_t v99 = 0;
      uint64_t v100 = 0;
      if ([var0[1] popHighestPriorityKey:&v99 priority:&v101])
      {
        unsigned int v14 = v101;
      }
      else
      {
        uint64_t v99 = -1;
        uint64_t v100 = -1;
        unsigned int v14 = -1;
        int v101 = -1;
      }
      if (v6 <= v14) {
        unsigned int v6 = v14;
      }
      id v15 = v81;
      *(void *)buf = &unk_1ED513690;
      *(void *)&buf[8] = v15;
      unint64_t v16 = [v15 hash];
      unint64_t v17 = *((void *)&v91 + 1);
      if (*((void *)&v91 + 1))
      {
        unint64_t v18 = v16;
        uint8x8_t v19 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v91 + 8));
        v19.i16[0] = vaddlv_u8(v19);
        unint64_t v3 = v19.u32[0];
        if (v19.u32[0] > 1uLL)
        {
          unint64_t v20 = v16;
          if (v16 >= *((void *)&v91 + 1)) {
            unint64_t v20 = v16 % *((void *)&v91 + 1);
          }
        }
        else
        {
          unint64_t v20 = (*((void *)&v91 + 1) - 1) & v16;
        }
        uint64_t v21 = *(uint64_t ****)(v91 + 8 * v20);
        if (v21)
        {
          for (j = *v21; j; j = (uint64_t **)*j)
          {
            unint64_t v23 = (unint64_t)j[1];
            if (v23 == v18)
            {
              if (geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::operator==(j[3], (uint64_t)buf))goto LABEL_84; {
            }
              }
            else
            {
              if (v3 > 1)
              {
                if (v23 >= v17) {
                  v23 %= v17;
                }
              }
              else
              {
                v23 &= v17 - 1;
              }
              if (v23 != v20) {
                break;
              }
            }
          }
        }
      }
      uint64_t v24 = objc_alloc_init(GEOTileKeyList);
      unint64_t v25 = [*(id *)&buf[8] hash];
      unint64_t v26 = v25;
      unint64_t v17 = *((void *)&v91 + 1);
      if (*((void *)&v91 + 1))
      {
        uint8x8_t v27 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v91 + 8));
        v27.i16[0] = vaddlv_u8(v27);
        unint64_t v28 = v27.u32[0];
        if (v27.u32[0] > 1uLL)
        {
          unint64_t v3 = v25;
          if (v25 >= *((void *)&v91 + 1)) {
            unint64_t v3 = v25 % *((void *)&v91 + 1);
          }
        }
        else
        {
          unint64_t v3 = (*((void *)&v91 + 1) - 1) & v25;
        }
        id v29 = *(uint64_t ****)(v91 + 8 * v3);
        if (v29)
        {
          for (k = *v29; k; k = (uint64_t **)*k)
          {
            unint64_t v31 = (unint64_t)k[1];
            if (v31 == v26)
            {
              if (geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::operator==(k[3], (uint64_t)buf))goto LABEL_83; {
            }
              }
            else
            {
              if (v28 > 1)
              {
                if (v31 >= v17) {
                  v31 %= v17;
                }
              }
              else
              {
                v31 &= v17 - 1;
              }
              if (v31 != v3) {
                break;
              }
            }
          }
        }
      }
      uint64_t v32 = operator new(0x30uLL);
      *uint64_t v32 = 0;
      v32[1] = v26;
      geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::_retain_ptr(v32 + 2, (uint64_t)buf);
      v32[5] = v24;
      float v33 = (float)(unint64_t)(*((void *)&v92 + 1) + 1);
      if (!v17 || (float)(v93 * (float)v17) < v33)
      {
        BOOL v34 = (v17 & (v17 - 1)) != 0;
        if (v17 < 3) {
          BOOL v34 = 1;
        }
        unint64_t v35 = v34 | (2 * v17);
        unint64_t v36 = vcvtps_u32_f32(v33 / v93);
        if (v35 <= v36) {
          size_t v37 = v36;
        }
        else {
          size_t v37 = v35;
        }
        std::__hash_table<google::protobuf::Descriptor const*,std::hash<google::protobuf::Descriptor const*>,std::equal_to<google::protobuf::Descriptor const*>,std::allocator<google::protobuf::Descriptor const*>>::__rehash<true>((uint64_t)&v91, v37);
        unint64_t v17 = *((void *)&v91 + 1);
        if ((*((void *)&v91 + 1) & (*((void *)&v91 + 1) - 1)) != 0)
        {
          if (v26 >= *((void *)&v91 + 1)) {
            unint64_t v3 = v26 % *((void *)&v91 + 1);
          }
          else {
            unint64_t v3 = v26;
          }
        }
        else
        {
          unint64_t v3 = (*((void *)&v91 + 1) - 1) & v26;
        }
      }
      uint64_t v38 = v91;
      v39 = *(void **)(v91 + 8 * v3);
      if (v39)
      {
        *uint64_t v32 = *v39;
      }
      else
      {
        *uint64_t v32 = v92;
        *(void *)&long long v92 = v32;
        *(void *)(v38 + 8 * v3) = &v92;
        if (!*v32) {
          goto LABEL_82;
        }
        unint64_t v40 = *(void *)(*v32 + 8);
        if ((v17 & (v17 - 1)) != 0)
        {
          if (v40 >= v17) {
            v40 %= v17;
          }
        }
        else
        {
          v40 &= v17 - 1;
        }
        v39 = (void *)(v91 + 8 * v40);
      }
      void *v39 = v32;
LABEL_82:
      uint64_t v24 = 0;
      ++*((void *)&v92 + 1);
LABEL_83:

LABEL_84:
      unint64_t v41 = [*(id *)&buf[8] hash];
      unint64_t v42 = v41;
      unint64_t v43 = *((void *)&v91 + 1);
      if (*((void *)&v91 + 1))
      {
        uint8x8_t v44 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v91 + 8));
        v44.i16[0] = vaddlv_u8(v44);
        unint64_t v3 = v44.u32[0];
        if (v44.u32[0] > 1uLL)
        {
          unint64_t v17 = v41;
          if (v41 >= *((void *)&v91 + 1)) {
            unint64_t v17 = v41 % *((void *)&v91 + 1);
          }
        }
        else
        {
          unint64_t v17 = (*((void *)&v91 + 1) - 1) & v41;
        }
        v45 = *(void ***)(v91 + 8 * v17);
        if (v45)
        {
          for (m = *v45; m; m = *(void **)m)
          {
            unint64_t v47 = *((void *)m + 1);
            if (v47 == v42)
            {
              if (geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::operator==(*((void **)m + 3), (uint64_t)buf))goto LABEL_122; {
            }
              }
            else
            {
              if (v3 > 1)
              {
                if (v47 >= v43) {
                  v47 %= v43;
                }
              }
              else
              {
                v47 &= v43 - 1;
              }
              if (v47 != v17) {
                break;
              }
            }
          }
        }
      }
      m = operator new(0x30uLL);
      *(void *)m = 0;
      *((void *)m + 1) = v42;
      geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::_retain_ptr((void *)m + 2, (uint64_t)buf);
      *((void *)m + 5) = 0;
      float v48 = (float)(unint64_t)(*((void *)&v92 + 1) + 1);
      if (!v43 || (float)(v93 * (float)v43) < v48)
      {
        BOOL v49 = (v43 & (v43 - 1)) != 0;
        if (v43 < 3) {
          BOOL v49 = 1;
        }
        unint64_t v50 = v49 | (2 * v43);
        unint64_t v51 = vcvtps_u32_f32(v48 / v93);
        if (v50 <= v51) {
          size_t v52 = v51;
        }
        else {
          size_t v52 = v50;
        }
        std::__hash_table<google::protobuf::Descriptor const*,std::hash<google::protobuf::Descriptor const*>,std::equal_to<google::protobuf::Descriptor const*>,std::allocator<google::protobuf::Descriptor const*>>::__rehash<true>((uint64_t)&v91, v52);
        unint64_t v43 = *((void *)&v91 + 1);
        if ((*((void *)&v91 + 1) & (*((void *)&v91 + 1) - 1)) != 0)
        {
          if (v42 >= *((void *)&v91 + 1)) {
            unint64_t v17 = v42 % *((void *)&v91 + 1);
          }
          else {
            unint64_t v17 = v42;
          }
        }
        else
        {
          unint64_t v17 = (*((void *)&v91 + 1) - 1) & v42;
        }
      }
      uint64_t v53 = v91;
      v54 = *(void **)(v91 + 8 * v17);
      if (v54)
      {
        *(void *)m = *v54;
LABEL_120:
        void *v54 = m;
        goto LABEL_121;
      }
      *(void *)m = v92;
      *(void *)&long long v92 = m;
      *(void *)(v53 + 8 * v17) = &v92;
      if (*(void *)m)
      {
        unint64_t v55 = *(void *)(*(void *)m + 8);
        if ((v43 & (v43 - 1)) != 0)
        {
          if (v55 >= v43) {
            v55 %= v43;
          }
        }
        else
        {
          v55 &= v43 - 1;
        }
        v54 = (void *)(v91 + 8 * v55);
        goto LABEL_120;
      }
LABEL_121:
      ++*((void *)&v92 + 1);
LABEL_122:
      [*((id *)m + 5) addKey:&v99];
      unint64_t v56 = objc_msgSend(v15, "estimatedNumberOfOperationsForTileKey:", v99, v100);
      unint64_t v57 = v56;
      if (v83 >= v56) {
        unint64_t v9 = v83 - v56;
      }
      else {
        unint64_t v9 = 0;
      }
      v97 = buf;
      v58 = std::__hash_table<std::__hash_value_type<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,unsigned long>,std::__unordered_map_hasher<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,unsigned long>,std::hash<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::__unordered_map_equal<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,unsigned long>,std::equal_to<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::hash<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::allocator<std::__hash_value_type<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,unsigned long>>>::__emplace_unique_key_args<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::piecewise_construct_t const&,std::tuple<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc> const&>,std::tuple<>>((float *)v89, (uint64_t)buf, (uint64_t *)&v97);
      v58[5] += v57;
      [(GEOTileRequestBalancer *)self _requester:v15 incrementRunningOperationsCount:v57];
      if ([var0[1] count]) {
        goto LABEL_145;
      }
      v59 = v95;
      if (v95 >= v96)
      {
        uint64_t v61 = (v95 - v94) >> 3;
        if ((unint64_t)(v61 + 1) >> 61) {
          std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v62 = (v96 - v94) >> 2;
        if (v62 <= v61 + 1) {
          unint64_t v62 = v61 + 1;
        }
        if ((unint64_t)(v96 - v94) >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v63 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v63 = v62;
        }
        if (v63)
        {
          if (v63 >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          v64 = (char *)operator new(8 * v63);
        }
        else
        {
          v64 = 0;
        }
        unint64_t v3 = (unint64_t)&v64[8 * v61];
        v65 = &v64[8 * v63];
        *(void *)unint64_t v3 = v15;
        v60 = (char *)(v3 + 8);
        v66 = v94;
        v67 = v95;
        if (v95 == v94)
        {
          v94 = (char *)v3;
          v95 = (char *)(v3 + 8);
          v96 = v65;
        }
        else
        {
          do
          {
            uint64_t v68 = *((void *)v67 - 1);
            v67 -= 8;
            *(void *)v67 = 0;
            *(void *)(v3 - 8) = v68;
            v3 -= 8;
          }
          while (v67 != v66);
          v67 = v94;
          v69 = v95;
          v94 = (char *)v3;
          v95 = v60;
          v96 = v65;
          if (v69 != v67)
          {
            do
            {
              v70 = (void *)*((void *)v69 - 1);
              v69 -= 8;
            }
            while (v69 != v67);
            if (!v67) {
              goto LABEL_144;
            }
LABEL_143:
            operator delete(v67);
            goto LABEL_144;
          }
        }
        if (!v67) {
          goto LABEL_144;
        }
        goto LABEL_143;
      }
      *(void *)v59 = v15;
      v60 = v59 + 8;
LABEL_144:
      v95 = v60;
LABEL_145:
      *(void *)buf = &unk_1ED513690;

      v82 += v57;
      uint64_t v4 = v80;
      if (v83 <= v57) {
        goto LABEL_150;
      }
    }
  }
  v77 = (id *)v94;
  v78 = (id *)v95;
  while (v77 != v78)
    [*v77++ didStartOperationsForAllTileKeys];
  std::__hash_table<std::__hash_value_type<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,unsigned long>,std::__unordered_map_hasher<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,unsigned long>,std::hash<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::__unordered_map_equal<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,unsigned long>,std::equal_to<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::hash<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::allocator<std::__hash_value_type<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,unsigned long>>>::~__hash_table((uint64_t)v89);
  std::__hash_table<std::__hash_value_type<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,GEOTileKeyList * {__strong}>,std::__unordered_map_hasher<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,GEOTileKeyList * {__strong}>,std::hash<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::__unordered_map_equal<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,GEOTileKeyList * {__strong}>,std::equal_to<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::hash<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::allocator<std::__hash_value_type<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,GEOTileKeyList * {__strong}>>>::~__hash_table((uint64_t)&v91);
  *(void *)&long long v91 = &v94;
  std::vector<GEORoadEdge * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&v91);
}

void __61__GEOTileRequestBalancer__startOperationsWithAvailableCount___block_invoke(int8x16_t *a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a1[3].i64[0] != a2)
  {
    uint64_t v4 = GEOGetTileLoadingLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = a1[3].i64[0];
      uint64_t v6 = a1[2].i64[0];
      *(_DWORD *)buf = 134218496;
      uint64_t v16 = v5;
      __int16 v17 = 2048;
      uint64_t v18 = a2;
      __int16 v19 = 2048;
      uint64_t v20 = v6;
      _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_INFO, "Balancer expected to start %llu operations but actually started %llu for requester %p", buf, 0x20u);
    }

    v9 = uint64_t v7 = a2 - a1[3].i64[0];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__GEOTileRequestBalancer__startOperationsWithAvailableCount___block_invoke_11;
    block[3] = &unk_1E53E74B0;
    int8x16_t v11 = a1[2];
    id v10 = (id)v11.i64[0];
    int8x16_t v13 = vextq_s8(v11, v11, 8uLL);
    uint64_t v14 = v7;
    dispatch_async(v9, block);
  }
}

uint64_t __61__GEOTileRequestBalancer__startOperationsWithAvailableCount___block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requester:*(void *)(a1 + 40) incrementRunningOperationsCount:*(void *)(a1 + 48)];
}

- (__wrap_iter<(anonymous)_next_requester
{
  unint64_t v3 = [(GEOTileRequestBalancer *)self requesters];
  v4.var0 = (RequesterTileKeys *)*v3;
  uint64_t v5 = v3[1];
  if (*v3 != v5)
  {
    uint64_t v6 = (RequesterTileKeys **)v3;
    for (uint64_t i = (char *)v4.var0 + 24; i != v5; i += 24)
    {
      unsigned int v8 = [*((id *)v4.var0 + 1) highestPriority];
      if (v8 < [*((id *)i + 1) highestPriority]) {
        v4.var0 = (RequesterTileKeys *)i;
      }
    }
    int v9 = [*((id *)v4.var0 + 1) highestPriority];
    v4.var0 = *v6;
    if (*v6 != v6[1])
    {
      int v10 = v9;
      int8x16_t v11 = 0;
      unsigned int v12 = 0;
      int8x16_t v13 = 0;
      do
      {
        if ([*((id *)v4.var0 + 1) highestPriority] == v10
          && [*((id *)v4.var0 + 1) count])
        {
          if (v13 >= v12)
          {
            uint64_t v14 = v13 - v11;
            unint64_t v15 = v14 + 1;
            if ((unint64_t)(v14 + 1) >> 61) {
              std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
            }
            if (((char *)v12 - (char *)v11) >> 2 > v15) {
              unint64_t v15 = ((char *)v12 - (char *)v11) >> 2;
            }
            if ((unint64_t)((char *)v12 - (char *)v11) >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v16 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v16 = v15;
            }
            if (v16)
            {
              if (v16 >> 61) {
                std::__throw_bad_array_new_length[abi:ne180100]();
              }
              __int16 v17 = (char *)operator new(8 * v16);
            }
            else
            {
              __int16 v17 = 0;
            }
            uint64_t v18 = (RequesterTileKeys **)&v17[8 * v14];
            *uint64_t v18 = v4.var0;
            __int16 v19 = v18 + 1;
            while (v13 != v11)
            {
              uint64_t v20 = *--v13;
              *--uint64_t v18 = v20;
            }
            unsigned int v12 = (RequesterTileKeys **)&v17[8 * v16];
            if (v11) {
              operator delete(v11);
            }
            int8x16_t v11 = v18;
            int8x16_t v13 = v19;
          }
          else
          {
            *v13++ = v4.var0;
          }
        }
        v4.var0 = (RequesterTileKeys *)((char *)v4.var0 + 24);
      }
      while (v4.var0 != v6[1]);
      if (v11 == v13)
      {
        if (!v11) {
          return v4;
        }
      }
      else
      {
        uint64_t v21 = (char *)v13 - (char *)v11;
        if ((char *)v13 - (char *)v11 == 8)
        {
          unint64_t v22 = 0;
        }
        else
        {
          unint64_t v23 = v21 >> 3;
          unint64_t v24 = __clz(v21 >> 3);
          uint64_t v25 = 63;
          if (((v23 << v24) & 0x7FFFFFFFFFFFFFFFLL) != 0) {
            uint64_t v25 = 64;
          }
          std::__independent_bits_engine<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>,unsigned long>::__independent_bits_engine((uint64_t)v27, (uint64_t)self->_randomIndexGenerator, v25 - v24);
          do
            unint64_t v22 = std::__independent_bits_engine<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>,unsigned long long>::__eval((uint64_t)v27);
          while (v22 >= v23);
        }
        v4.var0 = v11[v22];
      }
      operator delete(v11);
    }
  }
  return v4;
}

- (id)captureStatePlistWithHints:(os_state_hints_s *)a3
{
  v16[3] = *MEMORY[0x1E4F143B8];
  __wrap_iter<(anonymous namespace)::RequesterTileKeys *> v4 = [(GEOTileRequestBalancer *)self requesters];
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  if (*v4 == v6)
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = *v4;
    do
    {
      v7 += *(void *)(v8 + 16);
      v8 += 24;
    }
    while (v8 != v6);
    uint64_t v9 = 0;
    do
    {
      v9 += [*(id *)(v5 + 8) count];
      v5 += 24;
    }
    while (v5 != v6);
  }
  v15[0] = @"Max Running Operations";
  int v10 = [NSNumber numberWithUnsignedInteger:self->_maxRunningOperationsCount];
  v16[0] = v10;
  v15[1] = @"Total Running";
  int8x16_t v11 = [NSNumber numberWithUnsignedLong:v7];
  v16[1] = v11;
  v15[2] = @"Total Remaining";
  unsigned int v12 = [NSNumber numberWithUnsignedLong:v9];
  v16[2] = v12;
  int8x16_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];

  return v13;
}

@end