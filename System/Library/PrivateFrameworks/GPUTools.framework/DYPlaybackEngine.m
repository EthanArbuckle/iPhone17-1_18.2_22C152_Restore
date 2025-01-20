@interface DYPlaybackEngine
- (BOOL)_executeDFS:(void *)a3;
- (BOOL)_executeFSE:(void *)a3;
- (BOOL)_executeFunctionStream:(void *)a3;
- (BOOL)_executeFunctions:(CoreFunction *)a3 count:(unint64_t)a4;
- (BOOL)shouldPerformPlaybackLoopIteration:(unsigned int)a3;
- (BOOL)verbose;
- (BOOL)waitUntilCompleteAfterEveryFrame;
- (DYCaptureFile)currentFile;
- (DYCaptureStore)captureStore;
- (DYFunctionPlayer)player;
- (DYPlaybackEngine)init;
- (DYPlaybackEngine)initWithCaptureStore:(id)a3;
- (id).cxx_construct;
- (id)newFunctionPlayer;
- (id)playback;
- (id)playbackToFunction:(unsigned int)a3;
- (unsigned)currentFunctionIndex;
- (unsigned)loopCount;
- (unsigned)targetFunctionIndex;
- (unsigned)targetSubCommandIndex;
- (void)_addPointerDataSizeMapToPlayer;
- (void)_allocateAndFillDataCache;
- (void)_executeDeltaFSEs;
- (void)_executeFunctionStreamEntriesPerformingLoopIterationActions:(BOOL)a3 iteration:(unsigned int)a4;
- (void)_performPlaybackRequest:(unsigned int)a3;
- (void)dealloc;
- (void)playbackToFunction:(unsigned int)a3 subCommandIndex:(int)a4 withLoops:(unsigned int)a5;
- (void)playbackToFunction:(unsigned int)a3 withLoops:(unsigned int)a4;
- (void)setLoopCount:(unsigned int)a3;
- (void)setTargetFunctionIndex:(unsigned int)a3;
- (void)setTargetSubCommandIndex:(unsigned int)a3;
- (void)setVerbose:(BOOL)a3;
- (void)setWaitUntilCompleteAfterEveryFrame:(BOOL)a3;
- (void)setWireframeLineWidth:(float)a3;
@end

@implementation DYPlaybackEngine

- (DYPlaybackEngine)init
{
  return 0;
}

- (DYPlaybackEngine)initWithCaptureStore:(id)a3
{
  if (!a3) {
    __assert_rtn("-[DYPlaybackEngine initWithCaptureStore:]", ", 0, "captureStore"");
  }
  v8.receiver = self;
  v8.super_class = (Class)DYPlaybackEngine;
  v4 = [(DYPlaybackEngine *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v6 = (const char *)[(id)objc_msgSend(NSString stringWithFormat:@"gputools.%@.%p", objc_msgSend(NSString, "stringWithUTF8String:", object_getClassName(v4)), v4), "UTF8String"];
    v5->_playbackQueue = (OS_dispatch_queue *)dispatch_queue_create(v6, 0);
    v5->_captureStore = (DYCaptureStore *)a3;
  }
  return v5;
}

- (void)dealloc
{
  cache = (GPUTools::Playback::PlaybackEngineDecodeCache *)self->_cache;
  if (cache)
  {
    GPUTools::Playback::PlaybackEngineDecodeCache::~PlaybackEngineDecodeCache(cache);
    MEMORY[0x25335FE80]();
  }
  playbackQueue = self->_playbackQueue;
  if (playbackQueue)
  {
    dispatch_release(playbackQueue);
    self->_playbackQueue = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)DYPlaybackEngine;
  [(DYPlaybackEngine *)&v5 dealloc];
}

- (id)newFunctionPlayer
{
  return 0;
}

- (void)setWireframeLineWidth:(float)a3
{
}

- (DYFunctionPlayer)player
{
  p_playerLock = &self->_playerLock;
  os_unfair_lock_lock(&self->_playerLock);
  if (!self->_player)
  {
    objc_super v5 = [(DYPlaybackEngine *)self newFunctionPlayer];
    self->_player = v5;
    [(DYFunctionPlayer *)v5 setEngine:self];
  }
  os_unfair_lock_unlock(p_playerLock);
  return self->_player;
}

- (void)_allocateAndFillDataCache
{
  host_info_outCnt[0] = 38;
  host_t v3 = MEMORY[0x2533603B0](self, a2);
  mach_error_t v4 = host_statistics(v3, 2, host_info_out, host_info_outCnt);
  if (v4)
  {
    mach_error_string(v4);
    dy_abort();
  }
  else
  {
    uint64_t v5 = (*MEMORY[0x263EF8AF8] >> 1) * host_info_out[0];
    captureStore = self->_captureStore;
    if (!captureStore)
    {
      *(void *)host_info_outCnt = 0;
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      goto LABEL_13;
    }
    [(DYCaptureStore *)captureStore getSortedFilePositionsForDataCaching];
    uint64_t v7 = *(void *)host_info_outCnt;
    size_t v8 = v15 - *(void *)host_info_outCnt;
    if (v15 == *(void *)host_info_outCnt) {
      goto LABEL_13;
    }
    if ((v8 & 0x8000000000000000) == 0)
    {
      v9 = (char *)operator new(v15 - *(void *)host_info_outCnt);
      bzero(v9, v8);
      unint64_t v10 = 0;
      unint64_t v11 = 0;
      do
      {
        while (1)
        {
          if ((-[DYCaptureStore getInfo:forFilePosition:error:](self->_captureStore, "getInfo:forFilePosition:error:", host_info_out, *(void *)(v7 + 8 * v10), 0) & 1) == 0)__assert_rtn("-[DYPlaybackEngine _allocateAndFillDataCache]", ", 0, "ok""); {
          if (v19)
          }
          {
            unint64_t v13 = ((v18 + 15) & 0x1FFFFFFF0) + v11;
            if (v13 <= (unint64_t)(7 * v5) >> 3) {
              break;
            }
          }
          uint64_t v7 = *(void *)host_info_outCnt;
          uint64_t v12 = 8 * v10;
          *(void *)(*(void *)host_info_outCnt + v12) = -1;
          *(void *)&v9[v12] = -1;
          if (++v10 >= (v15 - v7) >> 3) {
            goto LABEL_13;
          }
        }
        *(void *)&v9[8 * v10] = v18;
        uint64_t v7 = *(void *)host_info_outCnt;
        unint64_t v11 = v13;
        ++v10;
      }
      while (v10 < (v15 - *(void *)host_info_outCnt) >> 3);
LABEL_13:
      operator new();
    }
  }
  std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
}

- (void)_addPointerDataSizeMapToPlayer
{
  *(_OWORD *)size_t v8 = 0u;
  *(_OWORD *)__p = 0u;
  int v10 = 1065353216;
  for (i = (void *)*((void *)self->_cache + 17); i; i = (void *)*i)
  {
    uint64_t v4 = i[4];
    unint64_t v11 = i + 3;
    std::__hash_table<std::__hash_value_type<void *,unsigned long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long>>>::__emplace_unique_key_args<void *,std::piecewise_construct_t const&,std::tuple<void * const&>,std::tuple<>>((uint64_t)v8, i + 3, (uint64_t)&std::piecewise_construct, &v11)[3] = v4;
  }
  [(DYFunctionPlayer *)self->_player addPointerDataSizeMap:v8];
  uint64_t v5 = __p[0];
  if (__p[0])
  {
    do
    {
      v6 = (void *)*v5;
      operator delete(v5);
      uint64_t v5 = v6;
    }
    while (v6);
  }
  uint64_t v7 = v8[0];
  v8[0] = 0;
  if (v7) {
    operator delete(v7);
  }
}

- (BOOL)_executeFunctions:(CoreFunction *)a3 count:(unint64_t)a4
{
  if (!a4) {
    return 0;
  }
  cache = self->_cache;
  i = self->_fseIterator.__i_;
  if ((unint64_t)i < cache[3] || (unint64_t)i >= cache[4])
  {
    BOOL v13 = 0;
    unint64_t v12 = a4;
  }
  else
  {
    uint64_t functionBatchOffset = self->_functionBatchOffset;
    uint64_t currentFunctionIndex = self->_currentFunctionIndex;
    unint64_t targetFunctionIndex = self->_targetFunctionIndex;
    if (a4 - functionBatchOffset + currentFunctionIndex > targetFunctionIndex
      && targetFunctionIndex > currentFunctionIndex)
    {
      unint64_t v12 = (targetFunctionIndex - currentFunctionIndex);
    }
    else
    {
      unint64_t v12 = a4 - functionBatchOffset;
    }
    self->_uint64_t currentFunctionIndex = currentFunctionIndex + v12;
    BOOL v13 = 1;
    if (!v12) {
      goto LABEL_14;
    }
    a3 += functionBatchOffset;
  }
  [(DYFunctionPlayer *)self->_player executeFunctions:a3 count:v12 subCommandIndex:self->_targetSubCommandIndex];
  uint64_t functionBatchOffset = self->_functionBatchOffset;
LABEL_14:
  uint64_t v14 = v12 + functionBatchOffset;
  if (v14 == a4)
  {
    self->_uint64_t functionBatchOffset = 0;
    return self->_currentFunctionIndex == self->_targetFunctionIndex && v13;
  }
  else
  {
    self->_uint64_t functionBatchOffset = v14;
    return 1;
  }
}

- (BOOL)_executeDFS:(void *)a3
{
  uint64_t v3 = *(void *)a3;
  uint64_t v4 = *(void **)(*(void *)a3 + 504);
  uint64_t v5 = *(void **)(*(void *)a3 + 520);
  if (v5 == v4)
  {
LABEL_4:
    BOOL result = 0;
    *(void *)(v3 + 520) = *(void *)(v3 + 496);
  }
  else
  {
    while (1)
    {
      uint64_t v8 = (*(uint64_t (**)(void, SEL))(*(void *)*v5 + 16))(*v5, a2);
      if ([(DYPlaybackEngine *)self _executeFunctions:v8 count:(*(uint64_t (**)(void))(*(void *)*v5 + 24))()])
      {
        break;
      }
      *(void *)(*(void *)a3 + 520) += 8;
      uint64_t v3 = *(void *)a3;
      uint64_t v5 = *(void **)(*(void *)a3 + 520);
      if (v5 == v4) {
        goto LABEL_4;
      }
    }
    if (!self->_functionBatchOffset) {
      *(void *)(*(void *)a3 + 520) += 8;
    }
    return 1;
  }
  return result;
}

- (BOOL)_executeFunctionStream:(void *)a3
{
  cache = self->_cache;
  if (!cache[5]) {
    operator new[]();
  }
  if (cache[6] && -[DYPlaybackEngine _executeFunctions:count:](self, "_executeFunctions:count:", cache[5]))
  {
    if (!self->_functionBatchOffset) {
      *((void *)self->_cache + 6) = 0;
    }
    LOBYTE(v6) = 1;
    return v6;
  }
  else
  {
    uint64_t v7 = *((void *)a3 + 63);
    uint64_t v8 = *(void *)(v7 + 24);
    GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)v36);
    uint64_t v37 = v8;
    uint64_t v38 = v8;
    uint64_t v39 = *(void *)(v7 + 24);
    uint64_t v40 = *(void *)(v7 + 8);
    char v41 = (*(uint64_t (**)(uint64_t))(*(void *)v40 + 16))(v40);
    while (1)
    {
      uint64_t v9 = *((void *)a3 + 58);
      if (v9 != v37) {
        break;
      }
      uint64_t v10 = 0;
LABEL_30:
      v20 = self->_cache;
      v20[6] = v10;
      BOOL v6 = [(DYPlaybackEngine *)self _executeFunctions:v20[5] count:v10];
      if (v6)
      {
        if (!self->_functionBatchOffset) {
          goto LABEL_38;
        }
        goto LABEL_39;
      }
      if (!v10)
      {
        uint64_t v21 = *(void *)a3;
        if (*(void *)a3)
        {
          GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)v30);
          uint64_t v22 = *(void *)(v21 + 456);
          uint64_t v23 = *(void *)(v21 + 464);
          uint64_t v31 = v22;
          uint64_t v32 = v23;
          uint64_t v24 = *(void *)(v21 + 472);
          uint64_t v25 = *(void *)(v21 + 480);
          uint64_t v33 = v24;
          uint64_t v34 = v25;
          char v26 = *(unsigned char *)(v21 + 488);
          char v35 = v26;
        }
        else
        {
          v27 = (void *)*((void *)a3 + 63);
          uint64_t v28 = v27[2];
          GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)v30);
          uint64_t v31 = v28;
          uint64_t v32 = v28;
          uint64_t v33 = v27[3];
          uint64_t v34 = v27[1];
          char v26 = (*(uint64_t (**)(uint64_t))(*(void *)v34 + 16))(v34);
          char v35 = v26;
          uint64_t v22 = v31;
          uint64_t v23 = v32;
          uint64_t v24 = v33;
          uint64_t v25 = v34;
        }
        *((void *)a3 + 58) = v22;
        *((void *)a3 + 59) = v23;
        *((void *)a3 + 60) = v24;
        *((void *)a3 + 61) = v25;
        *((unsigned char *)a3 + 496) = v26;
        GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)v30);
LABEL_38:
        *((void *)self->_cache + 6) = 0;
LABEL_39:
        GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)v36);
        return v6;
      }
    }
    uint64_t v10 = 0;
    uint64_t v11 = *((void *)a3 + 59);
    while (1)
    {
      if (*((_DWORD *)a3 + 2) == -1 || v11 == v9)
      {
        if (((*(uint64_t (**)(void, uint64_t, uint64_t, char *))(**((void **)a3 + 61) + 64))(*((void *)a3 + 61), v9, *((void *)a3 + 60) - v9, (char *)a3 + 8) & 1) == 0)goto LABEL_41; {
        unint64_t v13 = *((unsigned int *)a3 + 110) + *((void *)a3 + 58);
        }
        *((void *)a3 + 59) = v13;
        int v14 = *((_DWORD *)a3 + 3);
        if ((v14 & 0x1000) != 0 && (v14 & 0x2000) == 0) {
          break;
        }
      }
LABEL_18:
      GPUTools::FD::CoreFunction::operator=();
      uint64_t v15 = *((void *)a3 + 59);
      if (v15 == *((void *)a3 + 58))
      {
        if (*((unsigned char *)a3 + 496))
        {
          __int16 v16 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**((void **)a3 + 61) + 56))(*((void *)a3 + 61), v15, *((void *)a3 + 60) - v15);
          uint64_t v17 = *((void *)a3 + 58);
          *((void *)a3 + 59) = (*(uint64_t (**)(void, uint64_t, uint64_t))(**((void **)a3 + 61) + 48))(*((void *)a3 + 61), v17, *((void *)a3 + 60) - v17)+ v17;
          GPUTools::FD::TFunctionStream<GPUTools::FD::CoreFunction,void>::_Iterator<GPUTools::FD::CoreFunction>::_decode_associated((uint64_t)a3 + 8, v16);
        }
        else
        {
          GPUTools::FD::TFunctionStream<GPUTools::FD::CoreFunction,void>::_Iterator<GPUTools::FD::CoreFunction>::_decode((uint64_t)a3 + 8);
        }
      }
      uint64_t v11 = *((void *)a3 + 59);
      *((void *)a3 + 58) = v11;
      ++v10;
      if (v11 != v37)
      {
        uint64_t v9 = v11;
        if (v10 != 1149) {
          continue;
        }
      }
      goto LABEL_30;
    }
    while (1)
    {
      unint64_t v18 = *((void *)a3 + 60);
      if (v13 >= v18) {
        break;
      }
      __int16 v19 = (*(uint64_t (**)(void, unint64_t, unint64_t))(**((void **)a3 + 61) + 56))(*((void *)a3 + 61), v13, v18 - v13);
      unint64_t v13 = (*(uint64_t (**)(void, void, void))(**((void **)a3 + 61) + 48))(*((void *)a3 + 61), *((void *)a3 + 59), *((void *)a3 + 60) - *((void *)a3 + 59))+ *((void *)a3 + 59);
      *((void *)a3 + 59) = v13;
      if ((v19 & 0x2000) != 0) {
        goto LABEL_18;
      }
    }
LABEL_41:
    BOOL result = dy_abort();
    __break(1u);
  }
  return result;
}

- (BOOL)_executeFSE:(void *)a3
{
  self->_currentFile = (DYCaptureFile *)*((void *)a3 + 65);
  [(DYFunctionPlayer *)self->_player performNewExecutionFileActions];
  if (!*(void *)a3) {
    goto LABEL_6;
  }
  if ([(DYPlaybackEngine *)self _executeDFS:a3]) {
    return 1;
  }
  uint64_t v6 = *(void *)a3;
  if (*(void *)a3)
  {
    GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)v19);
    uint64_t v20 = *(void *)(v6 + 456);
    long long v21 = *(_OWORD *)(v6 + 464);
    uint64_t v22 = *(void *)(v6 + 480);
    char v23 = *(unsigned char *)(v6 + 488);
  }
  else
  {
LABEL_6:
    uint64_t v7 = (void *)*((void *)a3 + 63);
    uint64_t v8 = v7[2];
    GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)v19);
    uint64_t v20 = v8;
    *(void *)&long long v21 = v8;
    *((void *)&v21 + 1) = v7[3];
    uint64_t v22 = v7[1];
    char v23 = (*(uint64_t (**)(uint64_t))(*(void *)v22 + 16))(v22);
  }
  uint64_t v9 = *((void *)a3 + 63);
  uint64_t v10 = *(void *)(v9 + 24);
  GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)v13);
  uint64_t v14 = v10;
  uint64_t v15 = v10;
  uint64_t v16 = *(void *)(v9 + 24);
  uint64_t v17 = *(void *)(v9 + 8);
  char v18 = (*(uint64_t (**)(uint64_t))(*(void *)v17 + 16))(v17);
  uint64_t v11 = v20;
  uint64_t v12 = v14;
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)v13);
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)v19);
  return v11 != v12 && [(DYPlaybackEngine *)self _executeFunctionStream:a3];
}

- (void)_executeDeltaFSEs
{
  [(DYFunctionPlayer *)self->_player prepareForNonCaptureExecution];
  cache = self->_cache;
  i = self->_fseIterator.__i_;
  uint64_t v5 = (void *)*((void *)cache + 1);
  if (i != v5)
  {
    do
    {
      [(DYPlaybackEngine *)self _executeFSE:*i];
      i = (char *)self->_fseIterator.__i_ + 8;
      self->_fseIterator.__i_ = i;
    }
    while (i != v5);
    cache = self->_cache;
  }
  self->_uint64_t currentFunctionIndex = 0;
  self->_fseIterator.__i_ = (void *)*((void *)cache + 3);
}

- (void)_executeFunctionStreamEntriesPerformingLoopIterationActions:(BOOL)a3 iteration:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  uint64_t v7 = (void *)MEMORY[0x2533604C0](self, a2);
  uint64_t v8 = @"NO";
  if (v5) {
    uint64_t v8 = @"YES";
  }
  char v18 = v8;
  uint64_t v19 = v4;
  _DYOCondLog();
  i = self->_fseIterator.__i_;
  uint64_t v10 = (void *)*((void *)self->_cache + 4);
  if (v10 != i)
  {
    uint64_t v11 = self->_fseIterator.__i_;
    uint64_t v12 = v11;
    if (i < v10) {
      goto LABEL_5;
    }
LABEL_28:
    __assert_rtn("-[DYPlaybackEngine _executeFunctionStreamEntriesPerformingLoopIterationActions:iteration:]", ", 0, "_fseIterator < _cache->delta_fse_iter"");
  }
  [(DYPlaybackEngine *)self _executeDeltaFSEs];
  uint64_t v11 = self->_fseIterator.__i_;
  uint64_t v10 = (void *)*((void *)self->_cache + 4);
  uint64_t v12 = v11;
  if (v11 >= v10) {
    goto LABEL_28;
  }
LABEL_5:
  if (v5)
  {
    while (1)
    {
      unint64_t v13 = (void *)*((void *)self->_cache + 3);
      if (v11 == v13 && i != v13)
      {
        [(DYFunctionPlayer *)self->_player prepareForCaptureExecution];
        [(DYPlaybackEngine *)self performPlaybackLoopIterationPreCaptureActions:v4];
        uint64_t v11 = self->_fseIterator.__i_;
        i = v12;
      }
      if (-[DYPlaybackEngine _executeFSE:](self, "_executeFSE:", *v11, v18, v19)) {
        break;
      }
      uint64_t v11 = (char *)self->_fseIterator.__i_ + 8;
      self->_fseIterator.__i_ = v11;
      uint64_t v12 = v11;
      if (v11 == v10) {
        goto LABEL_21;
      }
    }
  }
  else
  {
    while (1)
    {
      uint64_t v15 = (void *)*((void *)self->_cache + 3);
      if (v11 == v15 && i != v15)
      {
        [(DYFunctionPlayer *)self->_player prepareForCaptureExecution];
        uint64_t v11 = self->_fseIterator.__i_;
        i = v12;
      }
      if (-[DYPlaybackEngine _executeFSE:](self, "_executeFSE:", *v11, v18, v19)) {
        break;
      }
      uint64_t v11 = (char *)self->_fseIterator.__i_ + 8;
      self->_fseIterator.__i_ = v11;
      uint64_t v12 = v11;
      if (v11 == v10)
      {
LABEL_21:
        if (v10 != *((void **)self->_cache + 4)) {
          __assert_rtn("-[DYPlaybackEngine _executeFunctionStreamEntriesPerformingLoopIterationActions:iteration:]", ", 0, "_fseIterator == _cache->delta_fse_iter"");
        }
        if (v5) {
          [(DYPlaybackEngine *)self performPlaybackLoopIterationPostCaptureActions:v4];
        }
        unsigned int targetFunctionIndex = self->_targetFunctionIndex;
        if (targetFunctionIndex >= self->_currentFunctionIndex)
        {
          self->_unsigned int targetFunctionIndex = 0;
        }
        else if (targetFunctionIndex)
        {
          [(DYPlaybackEngine *)self _executeFunctionStreamEntriesPerformingLoopIterationActions:v5 iteration:v4];
          break;
        }
        self->_uint64_t currentFunctionIndex = 0;
        break;
      }
    }
  }
}

- (void)_performPlaybackRequest:(unsigned int)a3
{
  [(DYPlaybackEngine *)self onPlaybackRequestStart];
  if (!self->_player) {
    __assert_rtn("-[DYPlaybackEngine _performPlaybackRequest:]", ", 0, "_player"");
  }
  if (!self->_cache) {
    __assert_rtn("-[DYPlaybackEngine _performPlaybackRequest:]", ", 0, "_cache"");
  }
  if (a3 && self->_targetFunctionIndex == self->_currentFunctionIndex) {
    goto LABEL_7;
  }
  [(DYPlaybackEngine *)self _executeFunctionStreamEntriesPerformingLoopIterationActions:0 iteration:0];
  if (self->_currentFunctionIndex != self->_targetFunctionIndex) {
LABEL_16:
  }
    __assert_rtn("-[DYPlaybackEngine _performPlaybackRequest:]", ", 0, "_currentFunctionIndex == _targetFunctionIndex"");
  if (a3)
  {
LABEL_7:
    uint64_t v5 = 0;
    do
    {
      if (![(DYPlaybackEngine *)self shouldPerformPlaybackLoopIteration:v5]) {
        break;
      }
      [(DYPlaybackEngine *)self _executeFunctionStreamEntriesPerformingLoopIterationActions:1 iteration:v5];
      if (self->_currentFunctionIndex != self->_targetFunctionIndex) {
        goto LABEL_16;
      }
      if (self->_waitUntilCompleteAfterEveryFrame) {
        [(DYPlaybackEngine *)self waitUntilCompleted];
      }
      uint64_t v5 = (v5 + 1);
    }
    while (a3 != v5);
  }
  [(DYPlaybackEngine *)self onPlaybackRequestCompleted];
}

- (void)playbackToFunction:(unsigned int)a3 withLoops:(unsigned int)a4
{
}

- (void)playbackToFunction:(unsigned int)a3 subCommandIndex:(int)a4 withLoops:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  self->_active = 1;
  self->_unsigned int targetFunctionIndex = a3;
  self->_targetSubCommandIndex = a4;
  if (!self->_cache)
  {
    [(DYPlaybackEngine *)self _allocateAndFillDataCache];
    uint64_t v7 = [[DYPlaybackEngineFSEBuilder alloc] initWithPlaybackEngineCache:self->_cache];
    [(DYCaptureStore *)self->_captureStore acceptCaptureVisitor:v7];

    self->_fseIterator.__i_ = *(void **)self->_cache;
    [(DYFunctionPlayer *)[(DYPlaybackEngine *)self player] prepareForNonCaptureExecution];
    [(DYPlaybackEngine *)self _addPointerDataSizeMapToPlayer];
  }
  [(DYPlaybackEngine *)self _performPlaybackRequest:v5];
  self->_active = 0;
}

- (id)playbackToFunction:(unsigned int)a3
{
  uint64_t v5 = objc_opt_new();
  unsigned int loopCount = self->_loopCount;
  playbackQueue = self->_playbackQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__DYPlaybackEngine_playbackToFunction___block_invoke;
  block[3] = &unk_265333938;
  unsigned int v10 = a3;
  unsigned int v11 = loopCount;
  block[4] = self;
  block[5] = v5;
  dispatch_async(playbackQueue, block);
  return v5;
}

uint64_t __39__DYPlaybackEngine_playbackToFunction___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) playbackToFunction:*(unsigned int *)(a1 + 48) withLoops:*(unsigned int *)(a1 + 52)];
  uint64_t v2 = [NSNumber numberWithBool:1];
  uint64_t v3 = *(void **)(a1 + 40);
  return [v3 setResult:v2];
}

- (id)playback
{
  return [(DYPlaybackEngine *)self playbackToFunction:self->_targetFunctionIndex];
}

- (BOOL)shouldPerformPlaybackLoopIteration:(unsigned int)a3
{
  return 1;
}

- (DYCaptureStore)captureStore
{
  return self->_captureStore;
}

- (DYCaptureFile)currentFile
{
  return self->_currentFile;
}

- (unsigned)targetFunctionIndex
{
  return self->_targetFunctionIndex;
}

- (void)setTargetFunctionIndex:(unsigned int)a3
{
  self->_unsigned int targetFunctionIndex = a3;
}

- (unsigned)targetSubCommandIndex
{
  return self->_targetSubCommandIndex;
}

- (void)setTargetSubCommandIndex:(unsigned int)a3
{
  self->_targetSubCommandIndex = a3;
}

- (unsigned)loopCount
{
  return self->_loopCount;
}

- (void)setLoopCount:(unsigned int)a3
{
  self->_unsigned int loopCount = a3;
}

- (unsigned)currentFunctionIndex
{
  return self->_currentFunctionIndex;
}

- (BOOL)waitUntilCompleteAfterEveryFrame
{
  return self->_waitUntilCompleteAfterEveryFrame;
}

- (void)setWaitUntilCompleteAfterEveryFrame:(BOOL)a3
{
  self->_waitUntilCompleteAfterEveryFrame = a3;
}

- (BOOL)verbose
{
  return self->_verbose;
}

- (void)setVerbose:(BOOL)a3
{
  self->_verbose = a3;
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  return self;
}

@end