@interface AVHapticServer
- (AVHapticServer)init;
- (BOOL)incrementInit:(id *)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)setupSSSClient;
- (BOOL)shouldUnprewarmAllClientsAfterDisplayingPrewarmedProcessEntriesWithPrewarmTime:(unint64_t)a3;
- (id).cxx_construct;
- (int)cancelPatternWithOptions:(__CFDictionary *)a3;
- (int)doPrewarm:(shared_ptr<ClientEntry>)a3;
- (int)doStartRunning:(shared_ptr<ClientEntry>)a3 completedBlock:(id)a4;
- (int)loadSynthPreset;
- (int)playVibePattern:(void *)a3 gain:(float)a4 synchronizer:(SSPlayerSynchronizer *)a5 flags:(unsigned int)a6 atTime:(double)a7 completionHandler:(id)a8;
- (int)startPrewarm;
- (int)stopPrewarm;
- (shared_ptr<ClientEntry>)entryWithID:(unint64_t)a3;
- (uint64_t)incrementRunningCountForAudio:haptics:entry:;
- (unint64_t)addProcessEntry:(int)a3;
- (unint64_t)getChannelID;
- (unint64_t)initCount;
- (void)HandleInterruptionForSession:(const void *)a3 command:(unsigned int)a4 dictionary:(__CFDictionary *)a5;
- (void)addListener:(id)a3 forAudioSessionID:(unsigned int)a4;
- (void)checkRunningCountAndStopSynth;
- (void)cleanup;
- (void)dealloc;
- (void)decrementInit;
- (void)decrementPrewarmCountAndStopAudio:(BOOL)a3 stopHaptics:(BOOL)a4 entry:(shared_ptr<ClientEntry>)a5;
- (void)decrementRunningCountAndStopAudio:(BOOL)a3 stopHaptics:(BOOL)a4 entry:(shared_ptr<ClientEntry>)a5;
- (void)displayRunningProcessEntriesWithOnTime:(unint64_t)a3;
- (void)doReleaseClientResources:(shared_ptr<ClientEntry>)a3;
- (void)doStopPrewarm:(shared_ptr<ClientEntry>)a3 audio:(BOOL)a4 haptics:(BOOL)a5;
- (void)doStopRunning:(shared_ptr<ClientEntry>)a3 audio:(BOOL)a4 haptics:(BOOL)a5;
- (void)doStopRunningForInterrupt:(shared_ptr<ClientEntry>)a3 audio:(BOOL)a4 haptics:(BOOL)a5;
- (void)dumpProcessEntries:(__sFILE *)a3;
- (void)incrementChannelID;
- (void)incrementPrewarmCountForAudio:(BOOL)a3 haptics:(BOOL)a4 entry:(shared_ptr<ClientEntry>)a5;
- (void)incrementRunningCountForAudio:(BOOL)a3 haptics:(BOOL)a4 entry:(shared_ptr<ClientEntry>)a5;
- (void)incrementRunningCountForAudio:haptics:entry:;
- (void)manager;
- (void)removeListener:(id)a3 withAudioSessionID:(unsigned int)a4;
- (void)removeProcessEntry:(unint64_t)a3;
- (void)unprewarmAllClientEntries;
@end

@implementation AVHapticServer

- (id).cxx_construct
{
  self->_instanceMap.__tree_.__pair3_.__value_ = 0;
  self->_instanceMap.__tree_.__pair1_.__value_.__left_ = 0;
  self->_instanceMap.__tree_.__begin_node_ = &self->_instanceMap.__tree_.__pair1_;
  MEMORY[0x1A6251E00](&self->_instanceMutex, a2);
  self->_processIndexMap.__tree_.__pair3_.__value_ = 0;
  self->_processIndexMap.__tree_.__pair1_.__value_.__left_ = 0;
  self->_processIndexMap.__tree_.__begin_node_ = &self->_processIndexMap.__tree_.__pair1_;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedError, 0);
  std::__tree<std::__value_type<unsigned long,caulk::alloc::consolidating_free_map<AQ::SharedPageAllocator,10485760ul>::FreelistOfSize>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,caulk::alloc::consolidating_free_map<AQ::SharedPageAllocator,10485760ul>::FreelistOfSize>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,caulk::alloc::consolidating_free_map<AQ::SharedPageAllocator,10485760ul>::FreelistOfSize>>>::destroy((void *)self->_processIndexMap.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_cachedServerInterface, 0);
  objc_storeStrong((id *)&self->_cachedClientInterface, 0);
  std::recursive_mutex::~recursive_mutex((std::recursive_mutex *)&self->_instanceMutex);
  std::__tree<std::__value_type<unsigned int,NSMutableArray<AVServerWrapper *> * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,NSMutableArray<AVServerWrapper *> * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,NSMutableArray<AVServerWrapper *> * {__strong}>>>::destroy((void *)self->_instanceMap.__tree_.__pair1_.__value_.__left_);

  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)manager
{
  return self->_manager;
}

- (unint64_t)initCount
{
  return self->_initCount;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v6 = a4;
  if (kHSRVScope)
  {
    v7 = *(id *)kHSRVScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)&buf[4] = "AVHapticServer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2387;
    __int16 v20 = 2080;
    v21 = "-[AVHapticServer listener:shouldAcceptNewConnection:]";
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_1A3931000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [xpc] newConnection: %@", buf, 0x26u);
  }

LABEL_8:
  uint64_t v9 = [v6 processIdentifier];
  long long v17 = 0u;
  long long v18 = 0u;
  if (v6) {
    [v6 auditToken];
  }
  v10 = self;
  objc_sync_enter(v10);
  [v6 setExportedInterface:v10->_cachedServerInterface];
  [v6 setRemoteObjectInterface:v10->_cachedClientInterface];
  v11 = [v6 exportedInterface];
  v12 = [v11 classesForSelector:sel_loadHapticSequenceFromEvents_reply_ argumentIndex:0 ofReply:0];

  v13 = (void *)[v12 mutableCopy];
  [v13 addObject:objc_opt_class()];
  v14 = [v6 exportedInterface];
  [v14 setClasses:v13 forSelector:sel_loadHapticSequenceFromEvents_reply_ argumentIndex:0 ofReply:0];

  if ([(AVHapticServer *)v10 addProcessEntry:v9] != -1) {
    operator new();
  }

  objc_sync_exit(v10);
  return 0;
}

void __53__AVHapticServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (kHSRVScope)
    {
      id v3 = *(id *)kHSRVScope;
      if (!v3) {
        goto LABEL_12;
      }
    }
    else
    {
      id v3 = (id)MEMORY[0x1E4F14500];
      id v5 = MEMORY[0x1E4F14500];
    }
    id v6 = v3;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315906;
      v19 = "AVHapticServer.mm";
      __int16 v20 = 1024;
      int v21 = 2424;
      __int16 v22 = 2080;
      id v23 = "-[AVHapticServer listener:shouldAcceptNewConnection:]_block_invoke";
      __int16 v24 = 2048;
      uint64_t v25 = [WeakRetained clientID];
      _os_log_impl(&dword_1A3931000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: <Client ID 0x%lx finish callback>", (uint8_t *)&v18, 0x26u);
    }

LABEL_12:
    v7 = (void *)MEMORY[0x1A6252B00]();
    id v8 = [WeakRetained getAsyncDelegateForMethod:*(void *)(a1 + 40) errorHandler:&__block_literal_global_436];
    if (!v8)
    {
      if (kHSRVScope)
      {
        v10 = *(id *)kHSRVScope;
        if (!v10) {
          goto LABEL_38;
        }
      }
      else
      {
        v10 = MEMORY[0x1E4F14500];
        id v17 = MEMORY[0x1E4F14500];
      }
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
LABEL_37:

LABEL_38:
        goto LABEL_39;
      }
      int v18 = 136315650;
      v19 = "AVHapticServer.mm";
      __int16 v20 = 1024;
      int v21 = 2436;
      __int16 v22 = 2080;
      id v23 = "-[AVHapticServer listener:shouldAcceptNewConnection:]_block_invoke";
      v13 = "%25s:%-5d %s: <WARNING: Async delegate for client was nil!>";
      v14 = v10;
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
LABEL_36:
      _os_log_impl(&dword_1A3931000, v14, v15, v13, (uint8_t *)&v18, 0x1Cu);
      goto LABEL_37;
    }
    if (kHSRVScope)
    {
      uint64_t v9 = *(id *)kHSRVScope;
      if (!v9)
      {
LABEL_23:
        [v8 clientCompletedWithError:0];
        if (kHSRVScope)
        {
          v10 = *(id *)kHSRVScope;
          if (!v10) {
            goto LABEL_38;
          }
        }
        else
        {
          v10 = MEMORY[0x1E4F14500];
          id v12 = MEMORY[0x1E4F14500];
        }
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
          goto LABEL_37;
        }
        int v18 = 136315650;
        v19 = "AVHapticServer.mm";
        __int16 v20 = 1024;
        int v21 = 2433;
        __int16 v22 = 2080;
        id v23 = "-[AVHapticServer listener:shouldAcceptNewConnection:]_block_invoke";
        v13 = "%25s:%-5d %s: <Done calling clientCompletedWithError:>";
        v14 = v10;
        os_log_type_t v15 = OS_LOG_TYPE_INFO;
        goto LABEL_36;
      }
    }
    else
    {
      uint64_t v9 = MEMORY[0x1E4F14500];
      id v11 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315650;
      v19 = "AVHapticServer.mm";
      __int16 v20 = 1024;
      int v21 = 2431;
      __int16 v22 = 2080;
      id v23 = "-[AVHapticServer listener:shouldAcceptNewConnection:]_block_invoke";
      _os_log_impl(&dword_1A3931000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: <Calling clientCompletedWithError: on client delegate>", (uint8_t *)&v18, 0x1Cu);
    }

    goto LABEL_23;
  }
  if (kHSRVScope)
  {
    v4 = *(id *)kHSRVScope;
    if (!v4) {
      goto LABEL_39;
    }
  }
  else
  {
    v4 = MEMORY[0x1E4F14500];
    id v16 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315650;
    v19 = "AVHapticServer.mm";
    __int16 v20 = 1024;
    int v21 = 2441;
    __int16 v22 = 2080;
    id v23 = "-[AVHapticServer listener:shouldAcceptNewConnection:]_block_invoke";
    _os_log_impl(&dword_1A3931000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: <WARNING: Weak AVHapticServerInstance was nil!>", (uint8_t *)&v18, 0x1Cu);
  }

LABEL_39:
}

void __53__AVHapticServer_listener_shouldAcceptNewConnection___block_invoke_438(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (kHSRVScope)
  {
    id v2 = *(id *)kHSRVScope;
    if (!v2) {
      goto LABEL_8;
    }
  }
  else
  {
    id v2 = (id)MEMORY[0x1E4F14500];
    id v3 = MEMORY[0x1E4F14500];
  }
  v4 = v2;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v7 = 136315906;
    id v8 = "AVHapticServer.mm";
    __int16 v9 = 1024;
    int v10 = 2449;
    __int16 v11 = 2080;
    id v12 = "-[AVHapticServer listener:shouldAcceptNewConnection:]_block_invoke";
    __int16 v13 = 1024;
    int v14 = [WeakRetained clientID];
    _os_log_impl(&dword_1A3931000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: [xpc] InterruptionHandler: client 0x%x", (uint8_t *)&v7, 0x22u);
  }
LABEL_8:
  id v6 = objc_loadWeakRetained((id *)(a1 + 32));
  [v6 handleConnectionError];
}

void __53__AVHapticServer_listener_shouldAcceptNewConnection___block_invoke_439(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (kHSRVScope)
  {
    id v2 = *(id *)kHSRVScope;
    if (!v2) {
      goto LABEL_8;
    }
  }
  else
  {
    id v2 = (id)MEMORY[0x1E4F14500];
    id v3 = MEMORY[0x1E4F14500];
  }
  v4 = v2;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v7 = 136315906;
    id v8 = "AVHapticServer.mm";
    __int16 v9 = 1024;
    int v10 = 2453;
    __int16 v11 = 2080;
    id v12 = "-[AVHapticServer listener:shouldAcceptNewConnection:]_block_invoke";
    __int16 v13 = 1024;
    int v14 = [WeakRetained clientID];
    _os_log_impl(&dword_1A3931000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: [xpc] InvalidationHandler: client 0x%x", (uint8_t *)&v7, 0x22u);
  }
LABEL_8:
  id v6 = objc_loadWeakRetained((id *)(a1 + 32));
  [v6 handleConnectionError];
}

void __53__AVHapticServer_listener_shouldAcceptNewConnection___block_invoke_434(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (kHSRVScope)
  {
    id v3 = *(id *)kHSRVScope;
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    id v3 = (id)MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  id v5 = v3;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = [v2 localizedDescription];
    int v7 = 136315906;
    id v8 = "AVHapticServer.mm";
    __int16 v9 = 1024;
    int v10 = 2427;
    __int16 v11 = 2080;
    id v12 = "-[AVHapticServer listener:shouldAcceptNewConnection:]_block_invoke";
    __int16 v13 = 2112;
    int v14 = v6;
    _os_log_impl(&dword_1A3931000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unable to notify client of finish: %@", (uint8_t *)&v7, 0x26u);
  }
LABEL_8:
}

- (void)unprewarmAllClientEntries
{
  id v2 = self;
  objc_sync_enter(v2);
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)v2->_processIndexMap.__tree_.__begin_node_;
  if (begin_node == &v2->_processIndexMap.__tree_.__pair1_) {
    goto LABEL_22;
  }
  do
  {
    unint64_t v4 = 0;
    uint64_t left_low = SLODWORD(begin_node[4].__value_.__left_);
    uint64_t v6 = 0x1000000;
    do
    {
      if (((*(unint64_t *)((char *)&begin_node[5].__value_.__left_ + ((v4 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
        goto LABEL_12;
      }
      ServerManager::entryForID((ServerManager *)&v14, (uint64_t)v2->_manager, v6 | left_low);
      uint64_t v7 = v14;
      if (v14)
      {
        id v8 = v15;
        if (*(unsigned char *)(v14 + 116))
        {
          uint64_t v12 = v14;
          __int16 v13 = v15;
          if (v15) {
            atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          [(AVHapticServer *)v2 doStopPrewarm:&v12 audio:(*(void *)(v7 + 96) >> 1) & 1 haptics:*(void *)(v7 + 96) & 1];
          if (v13) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v13);
          }
        }
        if (v8) {
LABEL_11:
        }
          std::__shared_weak_count::__release_shared[abi:ne180100](v8);
      }
      else
      {
        id v8 = v15;
        if (v15) {
          goto LABEL_11;
        }
      }
LABEL_12:
      ++v4;
      v6 += 0x1000000;
    }
    while (v4 != 255);
    left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)begin_node[1].__value_.__left_;
    if (left)
    {
      do
      {
        int v10 = left;
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)left->__value_.__left_;
      }
      while (left);
    }
    else
    {
      do
      {
        int v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)begin_node[2].__value_.__left_;
        BOOL v11 = v10->__value_.__left_ == begin_node;
        begin_node = v10;
      }
      while (!v11);
    }
    begin_node = v10;
  }
  while (v10 != &v2->_processIndexMap.__tree_.__pair1_);
LABEL_22:
  objc_sync_exit(v2);
}

- (void)doReleaseClientResources:(shared_ptr<ClientEntry>)a3
{
  var0 = (ClientEntry **)a3.var0;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (kHSRVScope)
  {
    id v5 = *(id *)kHSRVScope;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = *((void *)*var0 + 3);
    int v12 = 136315906;
    __int16 v13 = "AVHapticServer.mm";
    __int16 v14 = 1024;
    int v15 = 2345;
    __int16 v16 = 2080;
    id v17 = "-[AVHapticServer doReleaseClientResources:]";
    __int16 v18 = 2048;
    uint64_t v19 = v7;
    _os_log_impl(&dword_1A3931000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: clientID: 0x%lx", (uint8_t *)&v12, 0x26u);
  }

LABEL_8:
  if (*var0 && (int v8 = atomic_load((unsigned int *)*var0 + 30), v8 >= 1))
  {
    unsigned int v9 = atomic_load((unsigned int *)*var0 + 30);
    if (v9 != 1)
    {
      if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136315394;
        __int16 v13 = "AVHapticServer.mm";
        __int16 v14 = 1024;
        int v15 = 2347;
        _os_log_impl(&dword_1A3931000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d ASSERTION FAILURE [(entry->stopped()) != 0 is false]: ", (uint8_t *)&v12, 0x12u);
      }
      __break(1u);
    }
    ClientEntry::uninitialize(*var0);
    [(AVHapticServer *)self decrementInit];
  }
  else
  {
    if (kHSRVScope)
    {
      int v10 = *(id *)kHSRVScope;
      if (!v10) {
        return;
      }
    }
    else
    {
      int v10 = MEMORY[0x1E4F14500];
      id v11 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 136315650;
      __int16 v13 = "AVHapticServer.mm";
      __int16 v14 = 1024;
      int v15 = 2352;
      __int16 v16 = 2080;
      id v17 = "-[AVHapticServer doReleaseClientResources:]";
      _os_log_impl(&dword_1A3931000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: client was not initialized", (uint8_t *)&v12, 0x1Cu);
    }
  }
}

- (void)doStopRunningForInterrupt:(shared_ptr<ClientEntry>)a3 audio:(BOOL)a4 haptics:(BOOL)a5
{
  var0 = a3.var0;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  int v6 = atomic_load((unsigned int *)(*(void *)a3.var0 + 120));
  if (v6 >= 2)
  {
    unsigned int v7 = atomic_load((unsigned int *)(*(void *)a3.var0 + 120));
    if (v7 != 2)
    {
      BOOL v10 = a4;
      var1 = a3.var1;
      if (kHSRVScope)
      {
        __int16 v13 = *(id *)kHSRVScope;
        if (!v13)
        {
LABEL_20:
          manager = (ServerManager *)self->_manager;
          uint64_t v20 = (std::__shared_weak_count *)*((void *)var0 + 1);
          v24[0] = *(void *)var0;
          v24[1] = v20;
          if (v20) {
            atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          ServerManager::stopEntry(manager, v24, 1);
          if (v20) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v20);
          }
          int v21 = (std::__shared_weak_count *)*((void *)var0 + 1);
          uint64_t v22 = *(void *)var0;
          id v23 = v21;
          if (v21) {
            atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          [(AVHapticServer *)self decrementRunningCountAndStopAudio:var1 stopHaptics:v10 entry:&v22];
          if (v23) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v23);
          }
          return;
        }
      }
      else
      {
        __int16 v13 = MEMORY[0x1E4F14500];
        id v16 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = "haptics";
        uint64_t v18 = *(void *)(*(void *)var0 + 24);
        if (var1) {
          id v17 = "audio+haptics";
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v26 = "AVHapticServer.mm";
        __int16 v27 = 1024;
        int v28 = 2333;
        __int16 v29 = 2080;
        v30 = "-[AVHapticServer doStopRunningForInterrupt:audio:haptics:]";
        __int16 v31 = 2080;
        v32 = v17;
        __int16 v33 = 2048;
        uint64_t v34 = v18;
        _os_log_impl(&dword_1A3931000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Stopping running %s for client ID: 0x%lx due to interrupt", buf, 0x30u);
      }

      goto LABEL_20;
    }
  }
  unsigned int v8 = atomic_load((unsigned int *)(*(void *)a3.var0 + 120));
  if (v8 != 2) {
    return;
  }
  if (kHSRVScope)
  {
    unsigned int v9 = *(id *)kHSRVScope;
    if (!v9) {
      return;
    }
  }
  else
  {
    unsigned int v9 = MEMORY[0x1E4F14500];
    id v14 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = *(const char **)(*(void *)var0 + 24);
    *(_DWORD *)buf = 136315906;
    uint64_t v26 = "AVHapticServer.mm";
    __int16 v27 = 1024;
    int v28 = 2339;
    __int16 v29 = 2080;
    v30 = "-[AVHapticServer doStopRunningForInterrupt:audio:haptics:]";
    __int16 v31 = 2048;
    v32 = v15;
    _os_log_impl(&dword_1A3931000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client ID: 0x%lx was already stopping when interrupted -- noop", buf, 0x26u);
  }
}

- (void)doStopRunning:(shared_ptr<ClientEntry>)a3 audio:(BOOL)a4 haptics:(BOOL)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  int v5 = atomic_load((unsigned int *)(*(void *)a3.var0 + 120));
  if (v5 >= 2)
  {
    var0 = a3.var0;
    unsigned int v7 = atomic_load((unsigned int *)(*(void *)a3.var0 + 120));
    if (v7 != 2)
    {
      BOOL v10 = a4;
      var1 = a3.var1;
      if (kHSRVScope)
      {
        __int16 v13 = *(id *)kHSRVScope;
        if (!v13)
        {
LABEL_19:
          manager = (ServerManager *)self->_manager;
          uint64_t v18 = (std::__shared_weak_count *)*((void *)var0 + 1);
          v22[0] = *(void *)var0;
          v22[1] = v18;
          if (v18) {
            atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          ServerManager::stopEntry(manager, v22, 0);
          if (v18) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v18);
          }
          uint64_t v19 = (std::__shared_weak_count *)*((void *)var0 + 1);
          uint64_t v20 = *(void *)var0;
          int v21 = v19;
          if (v19) {
            atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          [(AVHapticServer *)self decrementRunningCountAndStopAudio:var1 stopHaptics:v10 entry:&v20];
          if (v21) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v21);
          }
          return;
        }
      }
      else
      {
        __int16 v13 = MEMORY[0x1E4F14500];
        id v14 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = "haptics";
        uint64_t v16 = *(void *)(*(void *)var0 + 24);
        if (var1) {
          int v15 = "audio+haptics";
        }
        *(_DWORD *)buf = 136316162;
        __int16 v24 = "AVHapticServer.mm";
        __int16 v25 = 1024;
        int v26 = 2317;
        __int16 v27 = 2080;
        int v28 = "-[AVHapticServer doStopRunning:audio:haptics:]";
        __int16 v29 = 2080;
        v30 = v15;
        __int16 v31 = 2048;
        uint64_t v32 = v16;
        _os_log_impl(&dword_1A3931000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Stopping running %s for client ID: 0x%lx", buf, 0x30u);
      }

      goto LABEL_19;
    }
  }
  if (kHSRVScope)
  {
    unsigned int v8 = *(id *)kHSRVScope;
    if (!v8) {
      return;
    }
  }
  else
  {
    unsigned int v8 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v24 = "AVHapticServer.mm";
    __int16 v25 = 1024;
    int v26 = 2323;
    __int16 v27 = 2080;
    int v28 = "-[AVHapticServer doStopRunning:audio:haptics:]";
    _os_log_impl(&dword_1A3931000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: entry was not running or flushing -- noop", buf, 0x1Cu);
  }
}

- (int)doStartRunning:(shared_ptr<ClientEntry>)a3 completedBlock:(id)a4
{
  var0 = a3.var0;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  int v6 = a3.var1;
  uint64_t v20 = 0;
  int v21 = &v20;
  uint64_t v22 = 0x2020000000;
  int v23 = 0;
  objc_initWeak(&location, self);
  if (kHSRVScope)
  {
    if (*(unsigned char *)(kHSRVScope + 8))
    {
      unsigned int v7 = *(id *)kHSRVScope;
      if (v7)
      {
        unsigned int v8 = v7;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          __int16 v25 = "AVHapticServer.mm";
          __int16 v26 = 1024;
          int v27 = 2289;
          __int16 v28 = 2080;
          __int16 v29 = "-[AVHapticServer doStartRunning:completedBlock:]";
          _os_log_impl(&dword_1A3931000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Dispatching startEntry on ACQ", buf, 0x1Cu);
        }
      }
    }
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3321888768;
  v14[2] = __48__AVHapticServer_doStartRunning_completedBlock___block_invoke;
  v14[3] = &unk_1EF728D18;
  id v9 = (std::__shared_weak_count *)*((void *)var0 + 1);
  v17[1] = *(id *)var0;
  uint64_t v18 = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v16 = &v20;
  objc_copyWeak(v17, &location);
  BOOL v10 = v6;
  int v15 = v10;
  if (AudioControlQueue(void)::once != -1) {
    dispatch_once(&AudioControlQueue(void)::once, &__block_literal_global_8);
  }
  id v11 = (id)AudioControlQueue(void)::gAudioControlQueue;
  AT::DispatchBlock(v11, v14, 0, (uint64_t)"-[AVHapticServer doStartRunning:completedBlock:]", (uint64_t)"AVHapticServer.mm", 2309);

  int v12 = *((_DWORD *)v21 + 6);
  objc_destroyWeak(v17);
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
  objc_destroyWeak(&location);
  _Block_object_dispose(&v20, 8);

  return v12;
}

void __48__AVHapticServer_doStartRunning_completedBlock___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  int v2 = atomic_load((unsigned int *)(*(void *)(a1 + 56) + 120));
  if (v2 < 1)
  {
    if (kHSRVScope)
    {
      int v5 = *(id *)kHSRVScope;
      if (!v5)
      {
LABEL_16:
        *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -4807;
        return;
      }
    }
    else
    {
      int v5 = MEMORY[0x1E4F14500];
      id v7 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 24);
      *(_DWORD *)buf = 136315906;
      uint64_t v30 = "AVHapticServer.mm";
      __int16 v31 = 1024;
      int v32 = 2292;
      __int16 v33 = 2080;
      uint64_t v34 = "-[AVHapticServer doStartRunning:completedBlock:]_block_invoke";
      __int16 v35 = 2048;
      uint64_t v36 = v8;
      _os_log_impl(&dword_1A3931000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: ERROR: Attempting to start uninitialized client (ID 0x%lx)", buf, 0x26u);
    }

    goto LABEL_16;
  }
  int v3 = atomic_load((unsigned int *)(*(void *)(a1 + 56) + 120));
  if (v3 <= 1)
  {
    if (kHSRVScope)
    {
      int v6 = *(id *)kHSRVScope;
      if (!v6)
      {
LABEL_25:
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
        BOOL v13 = WeakRetained == 0;

        if (!v13)
        {
          id v14 = objc_loadWeakRetained((id *)(a1 + 48));
          uint64_t v15 = [v14 manager];
          uint64_t v16 = *(void *)(a1 + 56);
          id v17 = *(std::__shared_weak_count **)(a1 + 64);
          v28[0] = v16;
          v28[1] = v17;
          if (v17)
          {
            atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
            uint64_t v16 = *(void *)(a1 + 56);
          }
          *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = ServerManager::startEntry(v15, v28, 0, *(unsigned __int8 *)(v16 + 108));
          if (v17) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v17);
          }

          if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
          {
            id v18 = objc_loadWeakRetained((id *)(a1 + 48));
            uint64_t v19 = v18;
            uint64_t v20 = *(std::__shared_weak_count **)(a1 + 64);
            unint64_t v21 = *(void *)(*(void *)(a1 + 56) + 96);
            uint64_t v26 = *(void *)(a1 + 56);
            int v27 = v20;
            if (v20) {
              atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
            }
            [v18 incrementRunningCountForAudio:(v21 >> 1) & 1 haptics:v21 & 1 entry:&v26];
            if (v27) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v27);
            }

            uint64_t v22 = *(void *)(a1 + 32);
            int v23 = *(std::__shared_weak_count **)(a1 + 64);
            uint64_t v24 = *(void *)(a1 + 56);
            __int16 v25 = v23;
            if (v23) {
              atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
            }
            (*(void (**)(uint64_t, uint64_t *, void))(v22 + 16))(v22, &v24, *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
            if (v25) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v25);
            }
          }
        }
        return;
      }
    }
    else
    {
      int v6 = MEMORY[0x1E4F14500];
      id v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 24);
      *(_DWORD *)buf = 136315906;
      uint64_t v30 = "AVHapticServer.mm";
      __int16 v31 = 1024;
      int v32 = 2296;
      __int16 v33 = 2080;
      uint64_t v34 = "-[AVHapticServer doStartRunning:completedBlock:]_block_invoke";
      __int16 v35 = 2048;
      uint64_t v36 = v11;
      _os_log_impl(&dword_1A3931000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Starting stopped client ID: 0x%lx", buf, 0x26u);
    }

    goto LABEL_25;
  }
  if (kHSRVScope)
  {
    unint64_t v4 = *(id *)kHSRVScope;
    if (!v4) {
      return;
    }
  }
  else
  {
    unint64_t v4 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v30 = "AVHapticServer.mm";
    __int16 v31 = 1024;
    int v32 = 2307;
    __int16 v33 = 2080;
    uint64_t v34 = "-[AVHapticServer doStartRunning:completedBlock:]_block_invoke";
    _os_log_impl(&dword_1A3931000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: WARNING: Client already running or flushing -- no call to notifyFinished", buf, 0x1Cu);
  }
}

- (void)doStopPrewarm:(shared_ptr<ClientEntry>)a3 audio:(BOOL)a4 haptics:(BOOL)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)a3.var0 + 116))
  {
    BOOL v5 = a4;
    var1 = a3.var1;
    var0 = a3.var0;
    if (kHSRVScope)
    {
      id v9 = *(id *)kHSRVScope;
      if (!v9)
      {
LABEL_12:
        manager = (ServerManager *)self->_manager;
        id v14 = (std::__shared_weak_count *)*((void *)var0 + 1);
        v19[0] = *(void *)var0;
        v19[1] = (uint64_t)v14;
        if (v14) {
          atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        ServerManager::stopPrewarmEntry(manager, v19);
        if (v14) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v14);
        }
        uint64_t v15 = (std::__shared_weak_count *)*((void *)var0 + 1);
        uint64_t v17 = *(void *)var0;
        id v18 = v15;
        if (v15) {
          atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        [(AVHapticServer *)self decrementPrewarmCountAndStopAudio:var1 stopHaptics:v5 entry:&v17];
        if (v18) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v18);
        }
        return;
      }
    }
    else
    {
      id v9 = MEMORY[0x1E4F14500];
      id v11 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(*(void *)var0 + 24);
      *(_DWORD *)buf = 136315906;
      unint64_t v21 = "AVHapticServer.mm";
      __int16 v22 = 1024;
      int v23 = 2276;
      __int16 v24 = 2080;
      __int16 v25 = "-[AVHapticServer doStopPrewarm:audio:haptics:]";
      __int16 v26 = 2048;
      uint64_t v27 = v12;
      _os_log_impl(&dword_1A3931000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Stopping prewarmed client ID: 0x%lx", buf, 0x26u);
    }

    goto LABEL_12;
  }
  if (kHSRVScope)
  {
    id v10 = *(id *)kHSRVScope;
    if (!v10) {
      return;
    }
  }
  else
  {
    id v10 = MEMORY[0x1E4F14500];
    id v16 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    unint64_t v21 = "AVHapticServer.mm";
    __int16 v22 = 1024;
    int v23 = 2281;
    __int16 v24 = 2080;
    __int16 v25 = "-[AVHapticServer doStopPrewarm:audio:haptics:]";
    _os_log_impl(&dword_1A3931000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Client was not prewarmed -- noop", buf, 0x1Cu);
  }
}

- (int)doPrewarm:(shared_ptr<ClientEntry>)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)a3.var0 + 116))
  {
    if (kHSRVScope)
    {
      int v3 = *(id *)kHSRVScope;
      if (!v3) {
        return 0;
      }
    }
    else
    {
      int v3 = MEMORY[0x1E4F14500];
      id v7 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v30 = "AVHapticServer.mm";
      __int16 v31 = 1024;
      int v32 = 2268;
      __int16 v33 = 2080;
      uint64_t v34 = "-[AVHapticServer doPrewarm:]";
      _os_log_impl(&dword_1A3931000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Client was already prewarmed -- noop", buf, 0x1Cu);
    }

    return 0;
  }
  var0 = a3.var0;
  if (kHSRVScope)
  {
    int v6 = *(id *)kHSRVScope;
    if (!v6) {
      goto LABEL_17;
    }
  }
  else
  {
    int v6 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(*(void *)var0 + 24);
    *(_DWORD *)buf = 136315906;
    uint64_t v30 = "AVHapticServer.mm";
    __int16 v31 = 1024;
    int v32 = 2260;
    __int16 v33 = 2080;
    uint64_t v34 = "-[AVHapticServer doPrewarm:]";
    __int16 v35 = 2048;
    *(void *)uint64_t v36 = v10;
    _os_log_impl(&dword_1A3931000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Starting prewarm on cold client ID: 0x%lx", buf, 0x26u);
  }

LABEL_17:
  manager = (void **)self->_manager;
  uint64_t v13 = *(void *)var0;
  uint64_t v12 = (std::__shared_weak_count *)*((void *)var0 + 1);
  if (v12) {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (kHSRVScope)
  {
    if (*(unsigned char *)(kHSRVScope + 8))
    {
      id v14 = *(id *)kHSRVScope;
      if (v14)
      {
        uint64_t v15 = v14;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v16 = *(void *)(v13 + 24);
          *(_DWORD *)buf = 136315906;
          uint64_t v30 = "ServerManager.mm";
          __int16 v31 = 1024;
          int v32 = 989;
          __int16 v33 = 2080;
          uint64_t v34 = "prewarmEntry";
          __int16 v35 = 2048;
          *(void *)uint64_t v36 = v16;
          _os_log_impl(&dword_1A3931000, v15, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Client ID: 0x%lx", buf, 0x26u);
        }
      }
    }
  }
  unint64_t v17 = *(void *)(v13 + 96) & 2;
  uint64_t v18 = *(void *)(v13 + 96) & 1;
  uint64_t v19 = *(void *)(v13 + 24);
  if (kHSRVScope)
  {
    uint64_t v20 = *(id *)kHSRVScope;
    if (!v20) {
      goto LABEL_32;
    }
  }
  else
  {
    uint64_t v20 = MEMORY[0x1E4F14500];
    id v21 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v30 = "ServerManager.mm";
    __int16 v31 = 1024;
    int v32 = 270;
    __int16 v33 = 2080;
    uint64_t v34 = "startSynthPrewarm";
    __int16 v35 = 1024;
    *(_DWORD *)uint64_t v36 = v17 >> 1;
    *(_WORD *)&v36[4] = 1024;
    *(_DWORD *)&v36[6] = v18;
    __int16 v37 = 1024;
    int v38 = v19;
    _os_log_impl(&dword_1A3931000, v20, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Calling startPrewarm(%d, %d) on synth, requested by clientID 0x%x", buf, 0x2Eu);
  }

LABEL_32:
  int v8 = (*(uint64_t (**)(void *, BOOL, uint64_t, uint64_t))(*manager[29] + 48))(manager[29], v17 != 0, v18, v19);
  *(unsigned char *)(v13 + 116) = v8 == 0;
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v23 = 1232;
  if (!v8) {
    uint64_t v23 = 1224;
  }
  *(double *)(v13 + v23) = Current;
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  if (!v8)
  {
    __int16 v25 = (std::__shared_weak_count *)*((void *)var0 + 1);
    unint64_t v26 = *(void *)(*(void *)var0 + 96);
    uint64_t v27 = *(void *)var0;
    uint64_t v28 = v25;
    if (v25) {
      atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(AVHapticServer *)self incrementPrewarmCountForAudio:(v26 >> 1) & 1 haptics:v26 & 1 entry:&v27];
    if (v28) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v28);
    }
    return 0;
  }
  return v8;
}

- (shared_ptr<ClientEntry>)entryWithID:(unint64_t)a3
{
  ServerManager::entryForID(v3, (uint64_t)self->_manager, a3);
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (void)dumpProcessEntries:(__sFILE *)a3
{
  fwrite("\tRegistered clients:\n", 0x15uLL, 1uLL, a3);
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)self->_processIndexMap.__tree_.__begin_node_;
  if (begin_node != &self->_processIndexMap.__tree_.__pair1_)
  {
    do
    {
      unsigned int left = begin_node[4].__value_.__left_;
      PlatformUtilities::processName((PlatformUtilities *)left);
      if (v12 >= 0) {
        p_p = (const char *)&__p;
      }
      else {
        p_p = (const char *)__p;
      }
      fprintf(a3, "\t\tPID %u (0x%x):\t\t\"%s\"\n", left, left, p_p);
      if (v12 < 0) {
        operator delete(__p);
      }
      isa = (AVHapticServer *)begin_node[1].__value_.__left_;
      if (isa)
      {
        do
        {
          id v9 = isa;
          isa = (AVHapticServer *)isa->super.isa;
        }
        while (isa);
      }
      else
      {
        do
        {
          id v9 = (AVHapticServer *)begin_node[2].__value_.__left_;
          BOOL v10 = v9->super.isa == (Class)begin_node;
          begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)v9;
        }
        while (!v10);
      }
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)v9;
    }
    while (v9 != (AVHapticServer *)&self->_processIndexMap.__tree_.__pair1_);
  }
}

- (BOOL)shouldUnprewarmAllClientsAfterDisplayingPrewarmedProcessEntriesWithPrewarmTime:(unint64_t)a3
{
  *(void *)((char *)&v55[2] + 2) = *MEMORY[0x1E4F143B8];
  id v42 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  unint64_t v4 = self;
  objc_sync_enter(v4);
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)v4->_processIndexMap.__tree_.__begin_node_;
  if (begin_node == &v4->_processIndexMap.__tree_.__pair1_)
  {
    id v7 = 0;
    int v6 = 0;
  }
  else
  {
    int v6 = 0;
    id v7 = 0;
    do
    {
      unint64_t v8 = 0;
      uint64_t left_low = (PlatformUtilities *)SLODWORD(begin_node[4].__value_.__left_);
      uint64_t v10 = 0x1000000;
      do
      {
        if ((*(unint64_t *)((char *)&begin_node[5].__value_.__left_ + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v8))
        {
          ServerManager::entryForID((ServerManager *)&v43, (uint64_t)v4->_manager, v10 | (unint64_t)left_low);
          id v11 = v43;
          if (v43 && v43->_ubuf[0])
          {
            base = v43->_bf._base;
            pid_t v13 = getpid();
            id v14 = v7;
            if (((unint64_t)base & 0xFFFFFF) != v13 || (uint64_t v15 = "ToneLib", LODWORD(v11->_extra) != 1003))
            {
              uint64_t v15 = "SSS";
              if ((v10 | (unint64_t)left_low) != v4->_SSSClientID)
              {
                int ur = v11->_ur;
                uint64_t v15 = "UIFeedback";
                if (ur != 1)
                {
                  if (ur == 2) {
                    uint64_t v15 = "iOSKeyboard";
                  }
                  else {
                    uint64_t v15 = "CH";
                  }
                }
              }
            }
            id v7 = (std::__shared_weak_count *)v44;
            if (v44) {
              atomic_fetch_add_explicit((atomic_ullong *volatile)v44 + 1, 1uLL, memory_order_relaxed);
            }
            if (v14) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v14);
            }
            PlatformUtilities::processName(left_low);
            unint64_t v17 = __p;
            if (SBYTE3(v53) < 0) {
              unint64_t v17 = *(unsigned char **)__p;
            }
            uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"%s:0x%x:%s", v17, v10 | (unint64_t)left_low, v15);
            [v42 appendString:v18];

            if (SBYTE3(v53) < 0) {
              operator delete(*(void **)__p);
            }
          }
          else
          {
            id v11 = (FILE *)v6;
          }
          if (v44) {
            std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v44);
          }
          int v6 = (ClientEntry *)v11;
        }
        ++v8;
        v10 += 0x1000000;
      }
      while (v8 != 255);
      unsigned int left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          uint64_t v20 = left;
          unsigned int left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          uint64_t v20 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)begin_node[2].__value_.__left_;
          BOOL v38 = v20->__value_.__left_ == begin_node;
          begin_node = v20;
        }
        while (!v38);
      }
      begin_node = v20;
    }
    while (v20 != &v4->_processIndexMap.__tree_.__pair1_);
  }
  objc_sync_exit(v4);

  if ([v42 length])
  {
    if (kHSRVScope)
    {
      id v21 = *(id *)kHSRVScope;
      if (!v21) {
        goto LABEL_43;
      }
    }
    else
    {
      id v21 = MEMORY[0x1E4F14500];
      id v22 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__p = 136316162;
      *(void *)&__p[4] = "AVHapticServer.mm";
      __int16 v50 = 1024;
      int v51 = 2221;
      __int16 v52 = 2080;
      v53 = "-[AVHapticServer shouldUnprewarmAllClientsAfterDisplayingPrewarmedProcessEntriesWithPrewarmTime:]";
      __int16 v54 = 1024;
      LODWORD(v55[0]) = a3;
      WORD2(v55[0]) = 2112;
      *(void *)((char *)v55 + 6) = v42;
      _os_log_impl(&dword_1A3931000, v21, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: << POWER LOG: Haptic_Prewarmed_Hardware_Time_Seconds: %u, Prewarmed_Clients: %@ >>", __p, 0x2Cu);
    }

LABEL_43:
    CADeprecated::TSingleton<HapticMetrics>::instance();
    unsigned __int8 v23 = atomic_load(HapticMetrics::sHapticAutoBugCaptureAvailable);
    if ((v23 & 1) == 0)
    {
      if (kHSRVScope)
      {
        __int16 v24 = *(id *)kHSRVScope;
        if (!v24) {
          goto LABEL_59;
        }
      }
      else
      {
        __int16 v24 = MEMORY[0x1E4F14500];
        id v26 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__p = 136315650;
        *(void *)&__p[4] = "AVHapticServer.mm";
        __int16 v50 = 1024;
        int v51 = 2230;
        __int16 v52 = 2080;
        v53 = "-[AVHapticServer shouldUnprewarmAllClientsAfterDisplayingPrewarmedProcessEntriesWithPrewarmTime:]";
        _os_log_impl(&dword_1A3931000, v24, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Stuck haptic prewarm encountered but haptic AutoBugCapture has filed within 24 hours", __p, 0x1Cu);
      }

LABEL_59:
      v44 = 0;
      uint64_t v45 = 0;
      uint64_t v46 = 0;
      int v32 = funopen(&v43, 0, (int (__cdecl *)(void *, const char *, int))CAMemoryStream::Write, 0, 0);
      v43 = v32;
      if (!v6)
      {
LABEL_68:
        fclose(v32);
        free(v44);
        goto LABEL_69;
      }
      ClientEntry::dump(v6, v32);
      if (kHSRVScope)
      {
        id v33 = *(id *)kHSRVScope;
        if (!v33)
        {
LABEL_67:
          int v32 = v43;
          goto LABEL_68;
        }
      }
      else
      {
        id v33 = (id)MEMORY[0x1E4F14500];
        id v34 = MEMORY[0x1E4F14500];
      }
      __int16 v35 = v33;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v36 = CAMemoryStream::cstr(&v43);
        *(_DWORD *)__p = 136315906;
        *(void *)&__p[4] = "AVHapticServer.mm";
        __int16 v50 = 1024;
        int v51 = 2235;
        __int16 v52 = 2080;
        v53 = "-[AVHapticServer shouldUnprewarmAllClientsAfterDisplayingPrewarmedProcessEntriesWithPrewarmTime:]";
        __int16 v54 = 2080;
        v55[0] = v36;
        _os_log_impl(&dword_1A3931000, v35, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Prewarmed Client Dump:\n%s\n", __p, 0x26u);
      }

      goto LABEL_67;
    }
    if (kHSRVScope)
    {
      __int16 v25 = *(id *)kHSRVScope;
      if (!v25)
      {
LABEL_58:
        uint64_t v28 = (void *)MEMORY[0x1E4FB9428];
        v47[0] = @"Haptic_Prewarmed_Hardware_Time_Seconds";
        __int16 v29 = [NSNumber numberWithUnsignedInteger:a3];
        v47[1] = @"Prewarmed_Clients";
        v48[0] = v29;
        v48[1] = v42;
        uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:2];
        [v28 sendSingleMessage:v30 category:1 type:8];

        __int16 v31 = (HapticMetrics *)CADeprecated::TSingleton<HapticMetrics>::instance();
        HapticMetrics::markHapticAutoBugCaptureFiled(v31);
        goto LABEL_59;
      }
    }
    else
    {
      __int16 v25 = MEMORY[0x1E4F14500];
      id v27 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 136315650;
      *(void *)&__p[4] = "AVHapticServer.mm";
      __int16 v50 = 1024;
      int v51 = 2223;
      __int16 v52 = 2080;
      v53 = "-[AVHapticServer shouldUnprewarmAllClientsAfterDisplayingPrewarmedProcessEntriesWithPrewarmTime:]";
      _os_log_impl(&dword_1A3931000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: << Stuck haptic prewarm encountered. Filing ABC >> ", __p, 0x1Cu);
    }

    goto LABEL_58;
  }
LABEL_69:
  uint64_t v37 = [v42 length];
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  BOOL v38 = a3 <= 0x707 || v37 == 0;
  BOOL v39 = !v38;

  return v39;
}

- (void)displayRunningProcessEntriesWithOnTime:(unint64_t)a3
{
  v70[2] = *MEMORY[0x1E4F143B8];
  id v53 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  unint64_t v4 = self;
  objc_sync_enter(v4);
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)v4->_processIndexMap.__tree_.__begin_node_;
  obj = v4;
  if (begin_node == &v4->_processIndexMap.__tree_.__pair1_)
  {
    int v6 = 0;
    __int16 v54 = 0;
  }
  else
  {
    __int16 v54 = 0;
    int v6 = 0;
    do
    {
      unint64_t v7 = 0;
      uint64_t left_low = (PlatformUtilities *)SLODWORD(begin_node[4].__value_.__left_);
      uint64_t v9 = 0x1000000;
      do
      {
        if ((*(unint64_t *)((char *)&begin_node[5].__value_.__left_ + ((v7 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v7))
        {
          ServerManager::entryForID((ServerManager *)&v56, (uint64_t)v4->_manager, v9 | (unint64_t)left_low);
          if (v56 && (unsigned int v10 = atomic_load((unsigned int *)&v56->_lb), v10 != 1))
          {
            char v12 = v6;
            __int16 v54 = (ClientEntry *)v56;
            base = v56->_bf._base;
            if (((unint64_t)base & 0xFFFFFF) != getpid() || (id v14 = "ToneLib", *((_DWORD *)v54 + 26) != 1003))
            {
              id v14 = "SSS";
              if ((v9 | (unint64_t)left_low) != v4->_SSSClientID)
              {
                int v15 = *((_DWORD *)v54 + 28);
                id v14 = "UIFeedback";
                if (v15 != 1)
                {
                  if (v15 == 2) {
                    id v14 = "iOSKeyboard";
                  }
                  else {
                    id v14 = "CH";
                  }
                }
              }
            }
            id v11 = (std::__shared_weak_count *)v57;
            if (v57) {
              atomic_fetch_add_explicit((atomic_ullong *volatile)v57 + 1, 1uLL, memory_order_relaxed);
            }
            if (v12) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v12);
            }
            PlatformUtilities::processName(left_low);
            uint64_t v16 = __p;
            if (SBYTE3(v66) < 0) {
              uint64_t v16 = *(unsigned char **)__p;
            }
            unint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s:0x%x:%s", v16, v9 | (unint64_t)left_low, v14);
            [v53 appendString:v17];

            if (SBYTE3(v66) < 0) {
              operator delete(*(void **)__p);
            }
          }
          else
          {
            id v11 = v6;
          }
          if (v57) {
            std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v57);
          }
          int v6 = v11;
        }
        ++v7;
        v9 += 0x1000000;
      }
      while (v7 != 255);
      unsigned int left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          uint64_t v19 = left;
          unsigned int left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          uint64_t v19 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)begin_node[2].__value_.__left_;
          BOOL v20 = v19->__value_.__left_ == begin_node;
          begin_node = v19;
        }
        while (!v20);
      }
      begin_node = v19;
    }
    while (v19 != &v4->_processIndexMap.__tree_.__pair1_);
  }
  objc_sync_exit(v4);

  if ([v53 length])
  {
    if (kHSRVScope)
    {
      id v21 = *(id *)kHSRVScope;
      if (!v21) {
        goto LABEL_43;
      }
    }
    else
    {
      id v21 = MEMORY[0x1E4F14500];
      id v22 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__p = 136316162;
      *(void *)&__p[4] = "AVHapticServer.mm";
      __int16 v63 = 1024;
      int v64 = 2149;
      __int16 v65 = 2080;
      v66 = "-[AVHapticServer displayRunningProcessEntriesWithOnTime:]";
      __int16 v67 = 1024;
      LODWORD(v68[0]) = a3;
      WORD2(v68[0]) = 2112;
      *(void *)((char *)v68 + 6) = v53;
      _os_log_impl(&dword_1A3931000, v21, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: << POWER LOG: Haptic_Active_Hardware_Time_Seconds: %u, Active_Clients: %@ >>", __p, 0x2Cu);
    }

LABEL_43:
    unsigned __int8 v23 = (void *)MEMORY[0x1E4FB9428];
    v69[0] = @"Haptic_Active_Hardware_Time_Seconds";
    __int16 v24 = [NSNumber numberWithUnsignedInteger:a3];
    v69[1] = @"Active_Clients";
    v70[0] = v24;
    v70[1] = v53;
    __int16 v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:v69 count:2];
    [v23 sendSingleMessage:v25 category:1 type:8];

    v57 = 0;
    uint64_t v58 = 0;
    uint64_t v59 = 0;
    id v26 = funopen(&v56, 0, (int (__cdecl *)(void *, const char *, int))CAMemoryStream::Write, 0, 0);
    v56 = v26;
    uint64_t v28 = v54;
    if (!v54) {
      goto LABEL_76;
    }
    ClientEntry::dump(v54, v26);
    if (kHSRVScope)
    {
      id v29 = *(id *)kHSRVScope;
      if (!v29) {
        goto LABEL_51;
      }
    }
    else
    {
      id v29 = (id)MEMORY[0x1E4F14500];
      id v30 = MEMORY[0x1E4F14500];
    }
    __int16 v31 = v29;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = CAMemoryStream::cstr(&v56);
      *(_DWORD *)__p = 136315906;
      *(void *)&__p[4] = "AVHapticServer.mm";
      __int16 v63 = 1024;
      int v64 = 2155;
      __int16 v65 = 2080;
      v66 = "-[AVHapticServer displayRunningProcessEntriesWithOnTime:]";
      __int16 v67 = 2080;
      v68[0] = v32;
      _os_log_impl(&dword_1A3931000, v31, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Active Client Dump:\n%s\n", __p, 0x26u);
    }

    uint64_t v28 = v54;
LABEL_51:
    if (*((_DWORD *)v28 + 28) != 1
      || (double v33 = COERCE_DOUBLE(atomic_load((unint64_t *)v28 + 155)), v27.n128_f64[0] = v33, v33 <= 0.0)
      || (v27.n128_f64[0] = CFAbsoluteTimeGetCurrent(),
          double v34 = COERCE_DOUBLE(atomic_load((unint64_t *)v28 + 155)),
          double v35 = v27.n128_f64[0] - v34,
          v27.n128_u64[0] = 0x4082C00000000000,
          v35 < 600.0))
    {
LABEL_76:
      if ((*(unsigned int (**)(void, void, void, uint64_t, __n128))(**((void **)obj->_manager + 29)
                                                                                   + 64))(*((void *)obj->_manager + 29), 0, 0, 9999999, v27))
      {
        (*(void (**)(void, FILE *))(**((void **)obj->_manager + 29) + 152))(*((void *)obj->_manager + 29), v56);
        if (kHSRVScope)
        {
          id v48 = *(id *)kHSRVScope;
          if (!v48) {
            goto LABEL_84;
          }
        }
        else
        {
          id v48 = (id)MEMORY[0x1E4F14500];
          id v49 = MEMORY[0x1E4F14500];
        }
        __int16 v50 = v48;
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          int v51 = CAMemoryStream::cstr(&v56);
          *(_DWORD *)__p = 136315906;
          *(void *)&__p[4] = "AVHapticServer.mm";
          __int16 v63 = 1024;
          int v64 = 2176;
          __int16 v65 = 2080;
          v66 = "-[AVHapticServer displayRunningProcessEntriesWithOnTime:]";
          __int16 v67 = 2080;
          v68[0] = v51;
          _os_log_impl(&dword_1A3931000, v50, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Running Synth Dump:\n%s\n", __p, 0x26u);
        }
      }
LABEL_84:
      fclose(v56);
      free(v57);
      goto LABEL_85;
    }
    if (kHSRVScope)
    {
      uint64_t v36 = *(id *)kHSRVScope;
      if (!v36) {
        goto LABEL_61;
      }
    }
    else
    {
      uint64_t v36 = MEMORY[0x1E4F14500];
      id v37 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      uint64_t v38 = *((void *)v28 + 3);
      *(_DWORD *)__p = 136316162;
      *(void *)&__p[4] = "AVHapticServer.mm";
      __int16 v63 = 1024;
      int v64 = 2160;
      __int16 v65 = 2080;
      v66 = "-[AVHapticServer displayRunningProcessEntriesWithOnTime:]";
      __int16 v67 = 1024;
      LODWORD(v68[0]) = v38;
      WORD2(v68[0]) = 2048;
      *(double *)((char *)v68 + 6) = v35;
      _os_log_impl(&dword_1A3931000, v36, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: UIFeedback engine 0x%x has been running for %.1f seconds!", __p, 0x2Cu);
    }

LABEL_61:
    HapticMetrics::HapticMetrics((HapticMetrics *)__p);
    CADeprecated::TSingleton<HapticMetrics>::instance();
    unsigned __int8 v39 = atomic_load(HapticMetrics::sHapticAutoBugCaptureAvailable);
    HapticMetrics::~HapticMetrics((HapticMetrics *)__p);
    if ((v39 & 1) == 0)
    {
      if (kHSRVScope)
      {
        v40 = *(id *)kHSRVScope;
        if (!v40)
        {
LABEL_71:

          goto LABEL_76;
        }
      }
      else
      {
        v40 = MEMORY[0x1E4F14500];
        id v42 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__p = 136315650;
        *(void *)&__p[4] = "AVHapticServer.mm";
        __int16 v63 = 1024;
        int v64 = 2169;
        __int16 v65 = 2080;
        v66 = "-[AVHapticServer displayRunningProcessEntriesWithOnTime:]";
        _os_log_impl(&dword_1A3931000, v40, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Stuck UIFeedback engine encountered but haptic AutoBugCapture has filed within 24 hours", __p, 0x1Cu);
      }
      goto LABEL_71;
    }
    if (kHSRVScope)
    {
      v41 = *(id *)kHSRVScope;
      if (!v41)
      {
LABEL_75:

        v44 = (void *)MEMORY[0x1E4FB9428];
        v60 = @"Haptic_Stuck_UIFeedback_Client_Time_Seconds";
        uint64_t v45 = [NSNumber numberWithDouble:v35];
        v61 = v45;
        uint64_t v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
        [v44 sendSingleMessage:v46 category:1 type:8];

        v47 = (HapticMetrics *)CADeprecated::TSingleton<HapticMetrics>::instance();
        HapticMetrics::markHapticAutoBugCaptureFiled(v47);
        goto LABEL_76;
      }
    }
    else
    {
      v41 = MEMORY[0x1E4F14500];
      id v43 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 136315650;
      *(void *)&__p[4] = "AVHapticServer.mm";
      __int16 v63 = 1024;
      int v64 = 2162;
      __int16 v65 = 2080;
      v66 = "-[AVHapticServer displayRunningProcessEntriesWithOnTime:]";
      _os_log_impl(&dword_1A3931000, v41, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: << Stuck UIFeedback engine encountered. Filing ABC >>", __p, 0x1Cu);
    }
    goto LABEL_75;
  }
LABEL_85:
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

- (void)removeProcessEntry:(unint64_t)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  unsigned int left = (char *)self->_processIndexMap.__tree_.__pair1_.__value_.__left_;
  if (!left) {
    goto LABEL_53;
  }
  int v5 = a3 & 0xFFFFFF;
  p_pair1 = &self->_processIndexMap.__tree_.__pair1_;
  do
  {
    int v7 = *((_DWORD *)left + 8);
    BOOL v8 = v7 < v5;
    if (v7 >= v5) {
      uint64_t v9 = (char **)left;
    }
    else {
      uint64_t v9 = (char **)(left + 8);
    }
    if (!v8) {
      p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)left;
    }
    unsigned int left = *v9;
  }
  while (*v9);
  if (p_pair1 == &self->_processIndexMap.__tree_.__pair1_ || v5 < SLODWORD(p_pair1[4].__value_.__left_))
  {
LABEL_53:
    if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
    {
      int v33 = 136315394;
      double v34 = "AVHapticServer.mm";
      __int16 v35 = 1024;
      int v36 = 2068;
      _os_log_impl(&dword_1A3931000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d ASSERTION FAILURE [(clientsWithProcess != _processIndexMap.end()) != 0 is false]: ", (uint8_t *)&v33, 0x12u);
    }
    __break(1u);
  }
  unint64_t v10 = (a3 & 0xFF000000) - 1;
  if (kHSRVScope)
  {
    id v11 = *(id *)kHSRVScope;
    if (!v11) {
      goto LABEL_18;
    }
  }
  else
  {
    id v11 = MEMORY[0x1E4F14500];
    id v12 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v33 = 136316162;
    double v34 = "AVHapticServer.mm";
    int v36 = 2070;
    __int16 v37 = 2080;
    __int16 v35 = 1024;
    uint64_t v38 = "-[AVHapticServer removeProcessEntry:]";
    __int16 v39 = 1024;
    int v40 = v5;
    __int16 v41 = 1024;
    int v42 = v10 >> 24;
    _os_log_impl(&dword_1A3931000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Removing client from PID %u at index %u", (uint8_t *)&v33, 0x28u);
  }

LABEL_18:
  pid_t v13 = p_pair1 + 5;
  unint64_t v14 = (unint64_t)p_pair1[(v10 >> 30) + 5].__value_.__left_;
  if ((v14 & (1 << SBYTE3(v10))) != 0)
  {
    v13[v10 >> 30].__value_.__left_ = (void *)(v14 & ~(1 << SBYTE3(v10)));
    unint64_t v15 = 255;
    uint64_t v16 = p_pair1 + 5;
    while (!v16->__value_.__left_)
    {
      ++v16;
      v15 -= 64;
      if (v15 <= 0x3F)
      {
        if (((uint64_t)p_pair1[8].__value_.__left_ & 0x7FFFFFFFFFFFFFFFLL) == 0)
        {
          uint64_t v28 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)p_pair1[1].__value_.__left_;
          if (v28)
          {
            do
            {
              id v29 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> **)v28;
              uint64_t v28 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)v28->__value_.__left_;
            }
            while (v28);
          }
          else
          {
            id v30 = p_pair1;
            do
            {
              id v29 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> **)v30[2].__value_.__left_;
              BOOL v31 = *v29 == v30;
              id v30 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)v29;
            }
            while (!v31);
          }
          if (self->_processIndexMap.__tree_.__begin_node_ == p_pair1) {
            self->_processIndexMap.__tree_.__begin_node_ = v29;
          }
          int v32 = (uint64_t *)self->_processIndexMap.__tree_.__pair1_.__value_.__left_;
          --self->_processIndexMap.__tree_.__pair3_.__value_;
          std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v32, (uint64_t *)p_pair1);
          operator delete(p_pair1);
          return;
        }
        break;
      }
    }
    if (kHSRVScope)
    {
      id v17 = *(id *)kHSRVScope;
      if (!v17) {
        return;
      }
    }
    else
    {
      id v17 = (id)MEMORY[0x1E4F14500];
      id v19 = MEMORY[0x1E4F14500];
    }
    BOOL v20 = v17;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      int v21 = 0;
      for (unint64_t i = 255; i > 0x3F; i -= 64)
      {
        int8x8_t v23 = (int8x8_t)v13->__value_.__left_;
        ++v13;
        uint8x8_t v24 = (uint8x8_t)vcnt_s8(v23);
        v24.i16[0] = vaddlv_u8(v24);
        v21 += v24.i32[0];
      }
      uint64_t v25 = (uint64_t)p_pair1[8].__value_.__left_ & 0x7FFFFFFFFFFFFFFFLL;
      int v33 = 136315906;
      uint8x8_t v26 = (uint8x8_t)vcnt_s8((int8x8_t)v25);
      v26.i16[0] = vaddlv_u8(v26);
      double v34 = "AVHapticServer.mm";
      __int16 v35 = 1024;
      int v36 = 2078;
      __int16 v37 = 2080;
      uint64_t v38 = "-[AVHapticServer removeProcessEntry:]";
      __int16 v39 = 1024;
      int v40 = v26.i32[0] + v21;
      _os_log_impl(&dword_1A3931000, v20, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: %u clients still associated with PID", (uint8_t *)&v33, 0x22u);
    }
  }
  else
  {
    if (kHSRVScope)
    {
      uint64_t v18 = *(id *)kHSRVScope;
      if (!v18) {
        return;
      }
    }
    else
    {
      uint64_t v18 = MEMORY[0x1E4F14500];
      id v27 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v33 = 136315906;
      double v34 = "AVHapticServer.mm";
      __int16 v35 = 1024;
      int v36 = 2082;
      __int16 v37 = 2080;
      uint64_t v38 = "-[AVHapticServer removeProcessEntry:]";
      __int16 v39 = 1024;
      int v40 = v10 >> 24;
      _os_log_impl(&dword_1A3931000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Attempting to remove nonexistant entry at index %u", (uint8_t *)&v33, 0x22u);
    }
  }
}

- (unint64_t)addProcessEntry:(int)a3
{
  *(void *)&v33[5] = *MEMORY[0x1E4F143B8];
  p_pair1 = &self->_processIndexMap.__tree_.__pair1_;
  unsigned int left = (int *)self->_processIndexMap.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    int v7 = &self->_processIndexMap.__tree_.__pair1_;
    BOOL v8 = (char *)self->_processIndexMap.__tree_.__pair1_.__value_.__left_;
    do
    {
      int v9 = *((_DWORD *)v8 + 8);
      BOOL v10 = v9 < a3;
      if (v9 >= a3) {
        id v11 = (char **)v8;
      }
      else {
        id v11 = (char **)(v8 + 8);
      }
      if (!v10) {
        int v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)v8;
      }
      BOOL v8 = *v11;
    }
    while (*v11);
    if (v7 == p_pair1 || SLODWORD(v7[4].__value_.__left_) > a3)
    {
      while (1)
      {
        while (1)
        {
          int v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)left;
          int v12 = left[8];
          if (v12 <= a3) {
            break;
          }
          unsigned int left = (int *)v7->__value_.__left_;
          p_pair1 = v7;
          if (!v7->__value_.__left_) {
            goto LABEL_18;
          }
        }
        if (v12 >= a3) {
          break;
        }
        unsigned int left = (int *)v7[1].__value_.__left_;
        if (!left)
        {
          p_pair1 = v7 + 1;
          goto LABEL_18;
        }
      }
    }
  }
  else
  {
    int v7 = &self->_processIndexMap.__tree_.__pair1_;
LABEL_18:
    pid_t v13 = v7;
    int v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)operator new(0x48uLL);
    LODWORD(v7[4].__value_.__left_) = a3;
    *(_OWORD *)&v7[5].__value_.__left_ = 0u;
    *(_OWORD *)&v7[7].__value_.__left_ = 0u;
    v7->__value_.__left_ = 0;
    v7[1].__value_.__left_ = 0;
    v7[2].__value_.__left_ = v13;
    p_pair1->__value_.__left_ = v7;
    unint64_t v14 = *(void **)self->_processIndexMap.__tree_.__begin_node_;
    unint64_t v15 = (uint64_t *)v7;
    if (v14)
    {
      self->_processIndexMap.__tree_.__begin_node_ = v14;
      unint64_t v15 = (uint64_t *)p_pair1->__value_.__left_;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)self->_processIndexMap.__tree_.__pair1_.__value_.__left_, v15);
    ++self->_processIndexMap.__tree_.__pair3_.__value_;
  }
  unint64_t v16 = 0;
  id v17 = v7 + 5;
  while (1)
  {
    unint64_t v18 = (unint64_t)v17[v16 >> 6].__value_.__left_;
    if ((v18 & (1 << v16)) == 0) {
      break;
    }
    if (++v16 == 255)
    {
      if (kHSRVScope)
      {
        id v19 = *(id *)kHSRVScope;
        if (!v19) {
          return -1;
        }
      }
      else
      {
        id v19 = MEMORY[0x1E4F14500];
        id v24 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        int v26 = 136315906;
        id v27 = "AVHapticServer.mm";
        __int16 v28 = 1024;
        int v29 = 2053;
        __int16 v30 = 2080;
        BOOL v31 = "-[AVHapticServer addProcessEntry:]";
        __int16 v32 = 1024;
        *(_DWORD *)int v33 = a3;
        _os_log_impl(&dword_1A3931000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Exceeded the maximum number of players for PID %u!", (uint8_t *)&v26, 0x22u);
      }
      unint64_t v20 = -1;
      goto LABEL_44;
    }
  }
  v17[v16 >> 6].__value_.__left_ = (void *)(v18 | (1 << v16));
  if (!kHSRVScope)
  {
    int v21 = MEMORY[0x1E4F14500];
    id v22 = MEMORY[0x1E4F14500];
    goto LABEL_31;
  }
  int v21 = *(id *)kHSRVScope;
  if (v21)
  {
LABEL_31:
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      int v26 = 136316162;
      id v27 = "AVHapticServer.mm";
      int v29 = 2057;
      __int16 v30 = 2080;
      __int16 v28 = 1024;
      BOOL v31 = "-[AVHapticServer addProcessEntry:]";
      __int16 v32 = 1024;
      *(_DWORD *)int v33 = a3;
      v33[2] = 1024;
      *(_DWORD *)&v33[3] = v16;
      _os_log_impl(&dword_1A3931000, v21, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: New client added to PID %u with index %u", (uint8_t *)&v26, 0x28u);
    }
  }
  unint64_t v20 = ((v16 << 24) + 0x1000000) | a3;
  if (kHSRVScope)
  {
    id v19 = *(id *)kHSRVScope;
    if (!v19) {
      return v20;
    }
  }
  else
  {
    id v19 = MEMORY[0x1E4F14500];
    id v23 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    int v26 = 136315906;
    id v27 = "AVHapticServer.mm";
    __int16 v28 = 1024;
    int v29 = 2060;
    __int16 v30 = 2080;
    BOOL v31 = "-[AVHapticServer addProcessEntry:]";
    __int16 v32 = 2048;
    *(void *)int v33 = v20;
    _os_log_impl(&dword_1A3931000, v19, OS_LOG_TYPE_INFO, "%25s:%-5d %s: New client ID: 0x%lx", (uint8_t *)&v26, 0x26u);
  }
LABEL_44:

  return v20;
}

- (void)HandleInterruptionForSession:(const void *)a3 command:(unsigned int)a4 dictionary:(__CFDictionary *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (kHSRVScope)
  {
    id v9 = *(id *)kHSRVScope;
    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {
    id v9 = (id)MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  id v11 = v9;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    BOOL v31 = "AVHapticServer.mm";
    int v33 = 2023;
    __int16 v34 = 2080;
    __int16 v32 = 1024;
    __int16 v35 = "-[AVHapticServer HandleInterruptionForSession:command:dictionary:]";
    __int16 v36 = 1024;
    int v37 = AQMESession::sessionID((AQMESession *)a3);
    __int16 v38 = 1024;
    int v39 = v6;
    _os_log_impl(&dword_1A3931000, v11, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Session ID %u, interruptionCommand %u", buf, 0x28u);
  }

LABEL_8:
  p_instanceMutex = (std::recursive_mutex *)&self->_instanceMutex;
  std::recursive_mutex::lock((std::recursive_mutex *)&self->_instanceMutex);
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, NSMutableArray<AVServerWrapper *> *>, void *>>> *)self->_instanceMap.__tree_.__begin_node_;
  p_pair1 = &self->_instanceMap.__tree_.__pair1_;
  if (begin_node != &self->_instanceMap.__tree_.__pair1_)
  {
    do
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v13 = begin_node[5].__value_.__left_;
      uint64_t v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16, p_instanceMutex);
      if (v14)
      {
        uint64_t v15 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v26 != v15) {
              objc_enumerationMutation(v13);
            }
            id v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            unint64_t v18 = a5;
            id v19 = [v17 serverInstance];
            [v19 handleInterruptionForSession:a3 command:v6 dictionary:v18];
          }
          uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v14);
      }

      unsigned int left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, NSMutableArray<AVServerWrapper *> *>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          int v21 = left;
          unsigned int left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, NSMutableArray<AVServerWrapper *> *>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          int v21 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, NSMutableArray<AVServerWrapper *> *>, void *>>> *)begin_node[2].__value_.__left_;
          BOOL v22 = v21->__value_.__left_ == begin_node;
          begin_node = v21;
        }
        while (!v22);
      }
      begin_node = v21;
    }
    while (v21 != p_pair1);
  }
  std::recursive_mutex::unlock(p_instanceMutex);
}

- (void)removeListener:(id)a3 withAudioSessionID:(unsigned int)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (kHSRVScope)
  {
    id v7 = *(id *)kHSRVScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  id v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [v6 serverInstance];
    int v25 = 136316162;
    long long v26 = "AVHapticServer.mm";
    __int16 v27 = 1024;
    int v28 = 2005;
    __int16 v29 = 2080;
    __int16 v30 = "-[AVHapticServer removeListener:withAudioSessionID:]";
    __int16 v31 = 2048;
    __int16 v32 = v10;
    __int16 v33 = 1024;
    unsigned int v34 = a4;
    _os_log_impl(&dword_1A3931000, v9, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Removing listener containing AVHapticServerInstance %p for audio session ID %u", (uint8_t *)&v25, 0x2Cu);
  }
LABEL_8:
  std::recursive_mutex::lock((std::recursive_mutex *)&self->_instanceMutex);
  unsigned int left = (char *)self->_instanceMap.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    p_pair1 = &self->_instanceMap.__tree_.__pair1_;
    do
    {
      unsigned int v13 = *((_DWORD *)left + 8);
      BOOL v14 = v13 >= a4;
      if (v13 >= a4) {
        uint64_t v15 = (char **)left;
      }
      else {
        uint64_t v15 = (char **)(left + 8);
      }
      if (v14) {
        p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, NSMutableArray<AVServerWrapper *> *>, void *>>> *)left;
      }
      unsigned int left = *v15;
    }
    while (*v15);
    if (p_pair1 != &self->_instanceMap.__tree_.__pair1_ && LODWORD(p_pair1[4].__value_.__left_) <= a4)
    {
      unint64_t v16 = p_pair1[5].__value_.__left_;
      [v16 removeObject:v6];
      if ([v16 count]) {
        goto LABEL_42;
      }
      if (kHSRVScope)
      {
        unint64_t v18 = *(id *)kHSRVScope;
        if (!v18)
        {
LABEL_33:
          unint64_t v20 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, NSMutableArray<AVServerWrapper *> *>, void *>>> *)p_pair1[1].__value_.__left_;
          if (v20)
          {
            do
            {
              int v21 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, NSMutableArray<AVServerWrapper *> *>, void *>>> **)v20;
              unint64_t v20 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, NSMutableArray<AVServerWrapper *> *>, void *>>> *)v20->__value_.__left_;
            }
            while (v20);
          }
          else
          {
            BOOL v22 = p_pair1;
            do
            {
              int v21 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, NSMutableArray<AVServerWrapper *> *>, void *>>> **)v22[2].__value_.__left_;
              BOOL v23 = *v21 == v22;
              BOOL v22 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, NSMutableArray<AVServerWrapper *> *>, void *>>> *)v21;
            }
            while (!v23);
          }
          if (self->_instanceMap.__tree_.__begin_node_ == p_pair1) {
            self->_instanceMap.__tree_.__begin_node_ = v21;
          }
          id v24 = (uint64_t *)self->_instanceMap.__tree_.__pair1_.__value_.__left_;
          --self->_instanceMap.__tree_.__pair3_.__value_;
          std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v24, (uint64_t *)p_pair1);

          operator delete(p_pair1);
          goto LABEL_42;
        }
      }
      else
      {
        unint64_t v18 = MEMORY[0x1E4F14500];
        id v19 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        int v25 = 136315650;
        long long v26 = "AVHapticServer.mm";
        __int16 v27 = 1024;
        int v28 = 2012;
        __int16 v29 = 2080;
        __int16 v30 = "-[AVHapticServer removeListener:withAudioSessionID:]";
        _os_log_impl(&dword_1A3931000, v18, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: No more listeners for this session", (uint8_t *)&v25, 0x1Cu);
      }

      goto LABEL_33;
    }
  }
  if (kHSRVScope)
  {
    unint64_t v16 = *(id *)kHSRVScope;
    if (!v16) {
      goto LABEL_43;
    }
  }
  else
  {
    unint64_t v16 = MEMORY[0x1E4F14500];
    id v17 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    int v25 = 136315906;
    long long v26 = "AVHapticServer.mm";
    __int16 v27 = 1024;
    int v28 = 2017;
    __int16 v29 = 2080;
    __int16 v30 = "-[AVHapticServer removeListener:withAudioSessionID:]";
    __int16 v31 = 1024;
    LODWORD(v32) = a4;
    _os_log_impl(&dword_1A3931000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: No listeners found for audio session ID %u", (uint8_t *)&v25, 0x22u);
  }
LABEL_42:

LABEL_43:
  std::recursive_mutex::unlock((std::recursive_mutex *)&self->_instanceMutex);
}

- (void)addListener:(id)a3 forAudioSessionID:(unsigned int)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (kHSRVScope)
  {
    id v7 = *(id *)kHSRVScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  id v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [v6 serverInstance];
    int v30 = 136316162;
    __int16 v31 = "AVHapticServer.mm";
    __int16 v32 = 1024;
    int v33 = 1987;
    __int16 v34 = 2080;
    uint64_t v35 = "-[AVHapticServer addListener:forAudioSessionID:]";
    __int16 v36 = 2048;
    int v37 = v10;
    __int16 v38 = 1024;
    unsigned int v39 = a4;
    _os_log_impl(&dword_1A3931000, v9, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Adding listener containing AVHapticServerInstance %p for audio session ID %u", (uint8_t *)&v30, 0x2Cu);
  }
LABEL_8:
  p_instanceMutex = &self->_instanceMutex;
  std::recursive_mutex::lock((std::recursive_mutex *)&self->_instanceMutex);
  p_pair1 = &self->_instanceMap.__tree_.__pair1_;
  unsigned int left = (char *)self->_instanceMap.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    BOOL v14 = &self->_instanceMap.__tree_.__pair1_;
    do
    {
      unsigned int v15 = *((_DWORD *)left + 8);
      BOOL v16 = v15 >= a4;
      if (v15 >= a4) {
        id v17 = (char **)left;
      }
      else {
        id v17 = (char **)(left + 8);
      }
      if (v16) {
        BOOL v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, NSMutableArray<AVServerWrapper *> *>, void *>>> *)left;
      }
      unsigned int left = *v17;
    }
    while (*v17);
    if (v14 != p_pair1 && LODWORD(v14[4].__value_.__left_) <= a4)
    {
      if (kHSRVScope)
      {
        int v28 = *(id *)kHSRVScope;
        if (!v28)
        {
LABEL_46:
          id v21 = v14[5].__value_.__left_;
          goto LABEL_41;
        }
      }
      else
      {
        int v28 = MEMORY[0x1E4F14500];
        id v29 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        int v30 = 136315650;
        __int16 v31 = "AVHapticServer.mm";
        __int16 v32 = 1024;
        int v33 = 1997;
        __int16 v34 = 2080;
        uint64_t v35 = "-[AVHapticServer addListener:forAudioSessionID:]";
        _os_log_impl(&dword_1A3931000, v28, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Adding to existing listeners for this session", (uint8_t *)&v30, 0x1Cu);
      }

      goto LABEL_46;
    }
  }
  if (!kHSRVScope)
  {
    unint64_t v18 = MEMORY[0x1E4F14500];
    id v19 = MEMORY[0x1E4F14500];
    goto LABEL_23;
  }
  unint64_t v18 = *(id *)kHSRVScope;
  if (v18)
  {
LABEL_23:
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      int v30 = 136315650;
      __int16 v31 = "AVHapticServer.mm";
      __int16 v32 = 1024;
      int v33 = 1992;
      __int16 v34 = 2080;
      uint64_t v35 = "-[AVHapticServer addListener:forAudioSessionID:]";
      _os_log_impl(&dword_1A3931000, v18, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: First listener for this session", (uint8_t *)&v30, 0x1Cu);
    }
  }
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v21 = v20;
  BOOL v22 = p_pair1->__value_.__left_;
  BOOL v23 = &self->_instanceMap.__tree_.__pair1_;
  if (p_pair1->__value_.__left_)
  {
    while (1)
    {
      while (1)
      {
        BOOL v23 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, NSMutableArray<AVServerWrapper *> *>, void *>>> *)v22;
        unsigned int v24 = *((_DWORD *)v22 + 8);
        if (v24 <= a4) {
          break;
        }
        BOOL v22 = v23->__value_.__left_;
        p_pair1 = v23;
        if (!v23->__value_.__left_) {
          goto LABEL_33;
        }
      }
      if (v24 >= a4) {
        break;
      }
      BOOL v22 = v23[1].__value_.__left_;
      if (!v22)
      {
        p_pair1 = v23 + 1;
        goto LABEL_33;
      }
    }
    __int16 v27 = v20;
  }
  else
  {
LABEL_33:
    int v25 = operator new(0x30uLL);
    v25[8] = a4;
    *((void *)v25 + 5) = v21;
    *(void *)int v25 = 0;
    *((void *)v25 + 1) = 0;
    *((void *)v25 + 2) = v23;
    p_pair1->__value_.__left_ = v25;
    long long v26 = *(void **)self->_instanceMap.__tree_.__begin_node_;
    if (v26)
    {
      self->_instanceMap.__tree_.__begin_node_ = v26;
      int v25 = p_pair1->__value_.__left_;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)self->_instanceMap.__tree_.__pair1_.__value_.__left_, (uint64_t *)v25);
    __int16 v27 = 0;
    ++self->_instanceMap.__tree_.__pair3_.__value_;
  }

LABEL_41:
  [v21 addObject:v6];
  std::recursive_mutex::unlock((std::recursive_mutex *)p_instanceMutex);
}

- (void)incrementChannelID
{
}

- (unint64_t)getChannelID
{
  return self->_runningChannelIDCount;
}

- (void)decrementRunningCountAndStopAudio:(BOOL)a3 stopHaptics:(BOOL)a4 entry:(shared_ptr<ClientEntry>)a5
{
  var0 = a5.var0;
  BOOL v6 = a4;
  BOOL v7 = a3;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (a3 && !self->_audioRunningCount)
  {
    if (!os_log_type_enabled(0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_52;
    }
    int v31 = 136315394;
    __int16 v32 = "AVHapticServer.mm";
    __int16 v33 = 1024;
    int v34 = 1944;
    int v30 = "%25s:%-5d ASSERTION FAILURE [(!audio || _audioRunningCount > 0) != 0 is false]: ";
    goto LABEL_51;
  }
  if (a4 && !self->_hapticsRunningCount)
  {
    if (!os_log_type_enabled(0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_52;
    }
    int v31 = 136315394;
    __int16 v32 = "AVHapticServer.mm";
    __int16 v33 = 1024;
    int v34 = 1945;
    int v30 = "%25s:%-5d ASSERTION FAILURE [(!haptics || _hapticsRunningCount > 0) != 0 is false]: ";
LABEL_51:
    _os_log_impl(&dword_1A3931000, 0, OS_LOG_TYPE_ERROR, v30, (uint8_t *)&v31, 0x12u);
LABEL_52:
    __break(1u);
  }
  BOOL v9 = a3;
  BOOL v10 = a4;
  if (!a3) {
    goto LABEL_8;
  }
  if (kHSRVScope)
  {
    id v11 = *(id *)kHSRVScope;
    if (!v11)
    {
LABEL_8:
      if (v6) {
        goto LABEL_9;
      }
      goto LABEL_16;
    }
  }
  else
  {
    id v11 = MEMORY[0x1E4F14500];
    id v13 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = LODWORD(self->_audioRunningCount) - v9;
    int v31 = 136315906;
    __int16 v32 = "AVHapticServer.mm";
    __int16 v33 = 1024;
    int v34 = 1948;
    __int16 v35 = 2080;
    __int16 v36 = "-[AVHapticServer decrementRunningCountAndStopAudio:stopHaptics:entry:]";
    __int16 v37 = 1024;
    LODWORD(v38) = v14;
    _os_log_impl(&dword_1A3931000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: audio running count will be %u", (uint8_t *)&v31, 0x22u);
  }

  if (v6)
  {
LABEL_9:
    if (kHSRVScope)
    {
      int v12 = *(id *)kHSRVScope;
      if (!v12) {
        goto LABEL_22;
      }
    }
    else
    {
      int v12 = MEMORY[0x1E4F14500];
      id v17 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = LODWORD(self->_hapticsRunningCount) - v10;
      int v31 = 136315906;
      __int16 v32 = "AVHapticServer.mm";
      __int16 v33 = 1024;
      int v34 = 1949;
      __int16 v35 = 2080;
      __int16 v36 = "-[AVHapticServer decrementRunningCountAndStopAudio:stopHaptics:entry:]";
      __int16 v37 = 1024;
      LODWORD(v38) = v18;
      _os_log_impl(&dword_1A3931000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: haptics running count will be %u", (uint8_t *)&v31, 0x22u);
    }

LABEL_22:
    p_audioRunningCount = &self->_audioRunningCount;
    p_unint64_t hapticsRunningCount = &self->_hapticsRunningCount;
    unint64_t hapticsRunningCount = self->_hapticsRunningCount;
    self->_audioRunningCount -= v7;
    self->_unint64_t hapticsRunningCount = hapticsRunningCount - v6;
    id v20 = (PlatformUtilities *)(*(void *)(*(void *)var0 + 24) & 0xFFFFFFLL);
    CADeprecated::TSingleton<HapticMetrics>::instance();
    HapticMetrics::logPowerLogEvent(0, self->_hapticsRunningCount, v20, *(unsigned int *)(*(void *)var0 + 112));
    if (!v7) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_16:
  p_audioRunningCount = &self->_audioRunningCount;
  self->_audioRunningCount -= v7;
  p_unint64_t hapticsRunningCount = &self->_hapticsRunningCount;
  self->_hapticsRunningCount -= v6;
  if (v7) {
LABEL_23:
  }
    BOOL v7 = *p_audioRunningCount == 0;
LABEL_24:
  if (v6) {
    BOOL v6 = *p_hapticsRunningCount == 0;
  }
  if (v7 || v6)
  {
    if (v7 && v6)
    {
      if (kHSRVScope)
      {
        id v21 = *(id *)kHSRVScope;
        if (!v21) {
          goto LABEL_44;
        }
      }
      else
      {
        id v21 = MEMORY[0x1E4F14500];
        id v22 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v31 = 136315650;
        __int16 v32 = "AVHapticServer.mm";
        __int16 v33 = 1024;
        int v34 = 1960;
        __int16 v35 = 2080;
        __int16 v36 = "-[AVHapticServer decrementRunningCountAndStopAudio:stopHaptics:entry:]";
        BOOL v23 = "%25s:%-5d %s: audio and haptics running counts at zero and stopping synth";
        unsigned int v24 = v21;
        uint32_t v25 = 28;
LABEL_42:
        _os_log_impl(&dword_1A3931000, v24, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v31, v25);
      }
    }
    else
    {
      if (kHSRVScope)
      {
        id v21 = *(id *)kHSRVScope;
        if (!v21)
        {
LABEL_44:
          ServerManager::stopSynthRunning((ServerManager *)self->_manager, v7, v6, 9999999);
          if (v6)
          {
            int v28 = *(_DWORD *)(*(void *)var0 + 24);
            id v29 = (HapticMetrics *)CADeprecated::TSingleton<HapticMetrics>::instance();
            HapticMetrics::markEngineOff(v29, v28 & 0xFFFFFF);
          }
          return;
        }
      }
      else
      {
        id v21 = MEMORY[0x1E4F14500];
        id v26 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v27 = "haptics running count";
        int v31 = 136315906;
        __int16 v32 = "AVHapticServer.mm";
        __int16 v33 = 1024;
        int v34 = 1964;
        __int16 v36 = "-[AVHapticServer decrementRunningCountAndStopAudio:stopHaptics:entry:]";
        __int16 v35 = 2080;
        if (v7) {
          __int16 v27 = "audio running count";
        }
        __int16 v37 = 2080;
        __int16 v38 = v27;
        BOOL v23 = "%25s:%-5d %s: %s at zero, stopping synth";
        unsigned int v24 = v21;
        uint32_t v25 = 38;
        goto LABEL_42;
      }
    }

    goto LABEL_44;
  }
}

- (void)incrementRunningCountForAudio:(BOOL)a3 haptics:(BOOL)a4 entry:(shared_ptr<ClientEntry>)a5
{
  var0 = a5.var0;
  BOOL v6 = a4;
  BOOL v7 = a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  BOOL v9 = a3;
  if (a3)
  {
    if (kHSRVScope)
    {
      BOOL v10 = *(id *)kHSRVScope;
      if (!v10) {
        goto LABEL_9;
      }
    }
    else
    {
      BOOL v10 = MEMORY[0x1E4F14500];
      id v11 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v12 = LODWORD(self->_audioRunningCount) + v9;
      *(_DWORD *)buf = 136315906;
      int v30 = "AVHapticServer.mm";
      __int16 v31 = 1024;
      int v32 = 1916;
      __int16 v33 = 2080;
      int v34 = "-[AVHapticServer incrementRunningCountForAudio:haptics:entry:]";
      __int16 v35 = 1024;
      BOOL v36 = v12;
      _os_log_impl(&dword_1A3931000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: audio running count will be %u", buf, 0x22u);
    }
  }
LABEL_9:
  if (!v6) {
    goto LABEL_17;
  }
  if (kHSRVScope)
  {
    id v13 = *(id *)kHSRVScope;
    if (!v13) {
      goto LABEL_17;
    }
  }
  else
  {
    id v13 = MEMORY[0x1E4F14500];
    id v14 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v15 = LODWORD(self->_hapticsRunningCount) + v6;
    *(_DWORD *)buf = 136315906;
    int v30 = "AVHapticServer.mm";
    __int16 v31 = 1024;
    int v32 = 1917;
    __int16 v33 = 2080;
    int v34 = "-[AVHapticServer incrementRunningCountForAudio:haptics:entry:]";
    __int16 v35 = 1024;
    BOOL v36 = v15;
    _os_log_impl(&dword_1A3931000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: haptics running count will be %u", buf, 0x22u);
  }

LABEL_17:
  unint64_t v16 = self->_audioRunningCount + v9;
  unint64_t v17 = self->_hapticsRunningCount + v6;
  self->_audioRunningCount = v16;
  self->_unint64_t hapticsRunningCount = v17;
  if (v16 == 1 || v17 == 1)
  {
    if ((*(uint64_t (**)(void, BOOL, BOOL, void, ClientEntry *, __shared_weak_count *))(**((void **)self->_manager + 29) + 64))(*((void *)self->_manager + 29), v7, v6, *(unsigned int *)(*(void *)var0 + 24), a5.var0, a5.var1))goto LABEL_33; {
    if (kHSRVScope)
    }
    {
      id v19 = *(id *)kHSRVScope;
      if (!v19)
      {
LABEL_32:
        BOOL v21 = (*(void *)(*(void *)var0 + 96) & 4) == 0;
        manager = self->_manager;
        uint64_t v23 = *(unsigned int *)(*(void *)var0 + 24);
        v28[0] = &unk_1EF728E78;
        v28[3] = v28;
        ServerManager::startSynthRunning((uint64_t)manager, v7, v6, v21, v23, (uint64_t)v28);
        std::__function::__value_func<int ()(void)>::~__value_func[abi:ne180100](v28);
LABEL_33:
        if (!v6) {
          return;
        }
        uint64_t v24 = CADeprecated::TSingleton<HapticMetrics>::instance();
        if (*(unsigned char *)(v24 + 18)) {
          goto LABEL_43;
        }
        if (kHMETScope)
        {
          uint32_t v25 = *(id *)kHMETScope;
          if (!v25)
          {
LABEL_42:
            [*(id *)(v24 + 24) start];
            std::mutex::lock((std::mutex *)(v24 + 32));
            *(double *)uint64_t v24 = (double)mach_absolute_time() * 0.0000000416666667;
            *(unsigned char *)(v24 + 16) = 1;
            std::mutex::unlock((std::mutex *)(v24 + 32));
            goto LABEL_43;
          }
        }
        else
        {
          uint32_t v25 = MEMORY[0x1E4F14500];
          id v26 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          int v30 = "HapticMetrics.mm";
          __int16 v31 = 1024;
          int v32 = 66;
          __int16 v33 = 2080;
          int v34 = "markEngineOn";
          _os_log_impl(&dword_1A3931000, v25, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: marking engine on", buf, 0x1Cu);
        }

        goto LABEL_42;
      }
    }
    else
    {
      id v19 = MEMORY[0x1E4F14500];
      id v20 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      int v30 = "AVHapticServer.mm";
      __int16 v31 = 1024;
      int v32 = 1925;
      __int16 v33 = 2080;
      int v34 = "-[AVHapticServer incrementRunningCountForAudio:haptics:entry:]";
      _os_log_impl(&dword_1A3931000, v19, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Synth was stopped due to interruption. Restarting synth", buf, 0x1Cu);
    }

    goto LABEL_32;
  }
  if (v6)
  {
LABEL_43:
    uint64_t v27 = *(void *)(*(void *)var0 + 24);
    CADeprecated::TSingleton<HapticMetrics>::instance();
    HapticMetrics::logPowerLogEvent(0, self->_hapticsRunningCount, (PlatformUtilities *)(v27 & 0xFFFFFF), *(unsigned int *)(*(void *)var0 + 112));
  }
}

- (uint64_t)incrementRunningCountForAudio:haptics:entry:
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (kHSRVScope)
  {
    v0 = *(id *)kHSRVScope;
    if (!v0) {
      return 0;
    }
  }
  else
  {
    v0 = MEMORY[0x1E4F14500];
    id v1 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315650;
    unint64_t v4 = "AVHapticServer.mm";
    __int16 v5 = 1024;
    int v6 = 1928;
    __int16 v7 = 2080;
    id v8 = "operator()";
    _os_log_impl(&dword_1A3931000, v0, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Synth restarting due to interruption. No-op on session activator", (uint8_t *)&v3, 0x1Cu);
  }

  return 0;
}

- (void)incrementRunningCountForAudio:haptics:entry:
{
}

- (void)decrementPrewarmCountAndStopAudio:(BOOL)a3 stopHaptics:(BOOL)a4 entry:(shared_ptr<ClientEntry>)a5
{
  var0 = a5.var0;
  BOOL v6 = a4;
  BOOL v7 = a3;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (a3 && !self->_audioPrewarmCount)
  {
    if (!os_log_type_enabled(0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    int v31 = 136315394;
    int v32 = "AVHapticServer.mm";
    __int16 v33 = 1024;
    int v34 = 1888;
    int v30 = "%25s:%-5d ASSERTION FAILURE [(!audio || _audioPrewarmCount > 0) != 0 is false]: ";
    goto LABEL_53;
  }
  if (a4 && !self->_hapticsPrewarmCount)
  {
    if (!os_log_type_enabled(0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    int v31 = 136315394;
    int v32 = "AVHapticServer.mm";
    __int16 v33 = 1024;
    int v34 = 1889;
    int v30 = "%25s:%-5d ASSERTION FAILURE [(!haptics || _hapticsPrewarmCount > 0) != 0 is false]: ";
LABEL_53:
    _os_log_impl(&dword_1A3931000, 0, OS_LOG_TYPE_ERROR, v30, (uint8_t *)&v31, 0x12u);
LABEL_54:
    __break(1u);
  }
  BOOL v9 = a3;
  BOOL v10 = a4;
  if (!a3) {
    goto LABEL_8;
  }
  if (kHSRVScope)
  {
    id v11 = *(id *)kHSRVScope;
    if (!v11)
    {
LABEL_8:
      if (v6) {
        goto LABEL_9;
      }
LABEL_16:
      p_audioPrewarmCount = &self->_audioPrewarmCount;
      self->_audioPrewarmCount -= v7;
      p_unint64_t hapticsPrewarmCount = &self->_hapticsPrewarmCount;
      self->_hapticsPrewarmCount -= v6;
      if (v7) {
        goto LABEL_24;
      }
      goto LABEL_17;
    }
  }
  else
  {
    id v11 = MEMORY[0x1E4F14500];
    id v13 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = LODWORD(self->_audioPrewarmCount) - v9;
    int v31 = 136315906;
    int v32 = "AVHapticServer.mm";
    __int16 v33 = 1024;
    int v34 = 1892;
    __int16 v35 = 2080;
    BOOL v36 = "-[AVHapticServer decrementPrewarmCountAndStopAudio:stopHaptics:entry:]";
    __int16 v37 = 1024;
    LODWORD(v38) = v14;
    _os_log_impl(&dword_1A3931000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: audio prewarm count will be %u", (uint8_t *)&v31, 0x22u);
  }

  if (!v6) {
    goto LABEL_16;
  }
LABEL_9:
  if (kHSRVScope)
  {
    BOOL v12 = *(id *)kHSRVScope;
    if (!v12) {
      goto LABEL_23;
    }
  }
  else
  {
    BOOL v12 = MEMORY[0x1E4F14500];
    id v19 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = LODWORD(self->_hapticsPrewarmCount) - v10;
    int v31 = 136315906;
    int v32 = "AVHapticServer.mm";
    __int16 v33 = 1024;
    int v34 = 1893;
    __int16 v35 = 2080;
    BOOL v36 = "-[AVHapticServer decrementPrewarmCountAndStopAudio:stopHaptics:entry:]";
    __int16 v37 = 1024;
    LODWORD(v38) = v20;
    _os_log_impl(&dword_1A3931000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: haptics prewarm count will be %u", (uint8_t *)&v31, 0x22u);
  }

LABEL_23:
  p_audioPrewarmCount = &self->_audioPrewarmCount;
  p_unint64_t hapticsPrewarmCount = &self->_hapticsPrewarmCount;
  unint64_t hapticsPrewarmCount = self->_hapticsPrewarmCount;
  self->_audioPrewarmCount -= v7;
  self->_unint64_t hapticsPrewarmCount = hapticsPrewarmCount - v6;
  id v22 = (PlatformUtilities *)(*(void *)(*(void *)var0 + 24) & 0xFFFFFFLL);
  CADeprecated::TSingleton<HapticMetrics>::instance();
  HapticMetrics::logPowerLogEvent(1, self->_hapticsPrewarmCount, v22, *(unsigned int *)(*(void *)var0 + 112));
  if (v7)
  {
LABEL_24:
    BOOL v17 = *p_audioPrewarmCount == 0;
    if (v6) {
      goto LABEL_25;
    }
LABEL_18:
    BOOL v18 = 0;
    goto LABEL_26;
  }
LABEL_17:
  BOOL v17 = 0;
  if (!v6) {
    goto LABEL_18;
  }
LABEL_25:
  BOOL v18 = *p_hapticsPrewarmCount == 0;
LABEL_26:
  if (!v17 && !v18) {
    return;
  }
  if (kHSRVScope)
  {
    uint64_t v23 = *(id *)kHSRVScope;
    if (!v23) {
      goto LABEL_38;
    }
  }
  else
  {
    uint64_t v23 = MEMORY[0x1E4F14500];
    id v24 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v25 = "audio prewarm count";
    if (v6) {
      uint32_t v25 = "audio and haptics prewarm counts";
    }
    int v31 = 136315906;
    int v32 = "AVHapticServer.mm";
    __int16 v33 = 1024;
    int v34 = 1904;
    __int16 v35 = 2080;
    BOOL v36 = "-[AVHapticServer decrementPrewarmCountAndStopAudio:stopHaptics:entry:]";
    if (!v7) {
      uint32_t v25 = "haptics prewarm count";
    }
    __int16 v37 = 2080;
    __int16 v38 = v25;
    _os_log_impl(&dword_1A3931000, v23, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: %s at zero, calling stopPrewarm on synth", (uint8_t *)&v31, 0x26u);
  }

LABEL_38:
  ServerManager::stopSynthPrewarm((ServerManager *)self->_manager, v17, v18, 9999999);
  if (v18)
  {
    uint64_t v26 = CADeprecated::TSingleton<HapticMetrics>::instance();
    if (!*(unsigned char *)(v26 + 18))
    {
      uint64_t v27 = v26;
      if (kHMETScope)
      {
        int v28 = *(id *)kHMETScope;
        if (!v28)
        {
LABEL_47:
          std::mutex::lock((std::mutex *)(v27 + 32));
          *(unsigned char *)(v27 + 17) = 0;
          *(void *)(v27 + 8) = 0;
          std::mutex::unlock((std::mutex *)(v27 + 32));
          return;
        }
      }
      else
      {
        int v28 = MEMORY[0x1E4F14500];
        id v29 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        int v31 = 136315650;
        int v32 = "HapticMetrics.mm";
        __int16 v33 = 1024;
        int v34 = 116;
        __int16 v35 = 2080;
        BOOL v36 = "markEnginePrewarmOff";
        _os_log_impl(&dword_1A3931000, v28, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: marking engine prewarm off", (uint8_t *)&v31, 0x1Cu);
      }

      goto LABEL_47;
    }
  }
}

- (void)incrementPrewarmCountForAudio:(BOOL)a3 haptics:(BOOL)a4 entry:(shared_ptr<ClientEntry>)a5
{
  var0 = a5.var0;
  BOOL v6 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = a3;
  if (a3)
  {
    if (kHSRVScope)
    {
      BOOL v9 = *(id *)kHSRVScope;
      if (!v9) {
        goto LABEL_9;
      }
    }
    else
    {
      BOOL v9 = MEMORY[0x1E4F14500];
      id v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = LODWORD(self->_audioPrewarmCount) + v8;
      int v23 = 136315906;
      id v24 = "AVHapticServer.mm";
      __int16 v25 = 1024;
      int v26 = 1875;
      __int16 v27 = 2080;
      int v28 = "-[AVHapticServer incrementPrewarmCountForAudio:haptics:entry:]";
      __int16 v29 = 1024;
      int v30 = v11;
      _os_log_impl(&dword_1A3931000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: audio prewarm count will be %u", (uint8_t *)&v23, 0x22u);
    }
  }
LABEL_9:
  BOOL v12 = v6;
  if (!v6)
  {
    unint64_t hapticsPrewarmCount = self->_hapticsPrewarmCount;
    self->_audioPrewarmCount += v8;
    self->_unint64_t hapticsPrewarmCount = hapticsPrewarmCount;
    return;
  }
  if (kHSRVScope)
  {
    id v13 = *(id *)kHSRVScope;
    if (!v13) {
      goto LABEL_18;
    }
  }
  else
  {
    id v13 = MEMORY[0x1E4F14500];
    id v15 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v16 = LODWORD(self->_hapticsPrewarmCount) + v12;
    int v23 = 136315906;
    id v24 = "AVHapticServer.mm";
    __int16 v25 = 1024;
    int v26 = 1876;
    __int16 v27 = 2080;
    int v28 = "-[AVHapticServer incrementPrewarmCountForAudio:haptics:entry:]";
    __int16 v29 = 1024;
    int v30 = v16;
    _os_log_impl(&dword_1A3931000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: haptics prewarm count will be %u", (uint8_t *)&v23, 0x22u);
  }

LABEL_18:
  unint64_t v18 = self->_hapticsPrewarmCount;
  p_unint64_t hapticsPrewarmCount = (uint64_t *)&self->_hapticsPrewarmCount;
  *(p_hapticsPrewarmCount - 1) += v8;
  uint64_t *p_hapticsPrewarmCount = v18 + v12;
  uint64_t v19 = *(void *)(*(void *)var0 + 24);
  CADeprecated::TSingleton<HapticMetrics>::instance();
  HapticMetrics::logPowerLogEvent(1, *p_hapticsPrewarmCount, (PlatformUtilities *)(v19 & 0xFFFFFF), *(unsigned int *)(*(void *)var0 + 112));
  uint64_t v20 = CADeprecated::TSingleton<HapticMetrics>::instance();
  if (*(unsigned char *)(v20 + 18)) {
    return;
  }
  if (!kHMETScope)
  {
    BOOL v21 = MEMORY[0x1E4F14500];
    id v22 = MEMORY[0x1E4F14500];
    goto LABEL_23;
  }
  BOOL v21 = *(id *)kHMETScope;
  if (v21)
  {
LABEL_23:
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      int v23 = 136315650;
      id v24 = "HapticMetrics.mm";
      __int16 v25 = 1024;
      int v26 = 104;
      __int16 v27 = 2080;
      int v28 = "markEnginePrewarmOn";
      _os_log_impl(&dword_1A3931000, v21, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: marking engine prewarm on and reset prewarm timer", (uint8_t *)&v23, 0x1Cu);
    }
  }
  std::mutex::lock((std::mutex *)(v20 + 32));
  *(double *)(v20 + 8) = (double)mach_absolute_time() * 0.0000000416666667;
  *(unsigned char *)(v20 + 17) = 1;
  std::mutex::unlock((std::mutex *)(v20 + 32));
}

- (void)decrementInit
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t initCount = self->_initCount;
  if (!initCount)
  {
    if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v13 = 136315394;
      *(void *)&v13[4] = "AVHapticServer.mm";
      __int16 v14 = 1024;
      int v15 = 1860;
      _os_log_impl(&dword_1A3931000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d ASSERTION FAILURE [(_initCount > 0) != 0 is false]: ", v13, 0x12u);
    }
    __break(1u);
  }
  uint64_t v4 = kHSRVScope;
  unint64_t v5 = initCount - 1;
  self->_unint64_t initCount = v5;
  if (!v5)
  {
    if (v4)
    {
      BOOL v9 = *(id *)v4;
      if (!v9)
      {
LABEL_16:
        manager = self->_manager;
        uint64_t v12 = manager[30];
        *(void *)id v13 = manager + 30;
        v13[8] = (*(uint64_t (**)(void *))(v12 + 16))(manager + 30);
        (*(void (**)(void))(*(void *)manager[29] + 24))(manager[29]);
        CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)v13);
        return;
      }
    }
    else
    {
      BOOL v9 = MEMORY[0x1E4F14500];
      id v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)id v13 = 136315650;
      *(void *)&v13[4] = "AVHapticServer.mm";
      __int16 v14 = 1024;
      int v15 = 1862;
      __int16 v16 = 2080;
      BOOL v17 = "-[AVHapticServer decrementInit]";
      _os_log_impl(&dword_1A3931000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: init count now 0 -- uninit'ing synth", v13, 0x1Cu);
    }

    goto LABEL_16;
  }
  if (v4)
  {
    if (*(unsigned char *)(v4 + 8))
    {
      BOOL v6 = *(id *)v4;
      if (v6)
      {
        BOOL v7 = v6;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          unint64_t v8 = self->_initCount;
          *(_DWORD *)id v13 = 136315906;
          *(void *)&v13[4] = "AVHapticServer.mm";
          __int16 v14 = 1024;
          int v15 = 1866;
          __int16 v16 = 2080;
          BOOL v17 = "-[AVHapticServer decrementInit]";
          __int16 v18 = 1024;
          int v19 = v8;
          _os_log_impl(&dword_1A3931000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: init count -> %u", v13, 0x22u);
        }
      }
    }
  }
}

- (BOOL)incrementInit:(id *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  unint64_t initCount = self->_initCount;
  self->_unint64_t initCount = initCount + 1;
  if (initCount)
  {
    if (kHSRVScope)
    {
      if (*(unsigned char *)(kHSRVScope + 8))
      {
        BOOL v6 = *(id *)kHSRVScope;
        if (v6)
        {
          BOOL v7 = v6;
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          {
            unint64_t v8 = self->_initCount;
            *(_DWORD *)int v28 = 136315906;
            *(void *)&void v28[4] = "AVHapticServer.mm";
            __int16 v29 = 1024;
            int v30 = 1848;
            __int16 v31 = 2080;
            int v32 = "-[AVHapticServer incrementInit:]";
            __int16 v33 = 1024;
            LODWORD(v34) = v8;
            _os_log_impl(&dword_1A3931000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: init count -> %u", v28, 0x22u);
          }
        }
      }
    }
    goto LABEL_33;
  }
  if (kHSRVScope)
  {
    BOOL v9 = *(id *)kHSRVScope;
    if (!v9) {
      goto LABEL_15;
    }
  }
  else
  {
    BOOL v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)int v28 = 136315650;
    *(void *)&void v28[4] = "AVHapticServer.mm";
    __int16 v29 = 1024;
    int v30 = 1836;
    __int16 v31 = 2080;
    int v32 = "-[AVHapticServer incrementInit:]";
    _os_log_impl(&dword_1A3931000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: init count now 1 -- initializing and loading synth", v28, 0x1Cu);
  }

LABEL_15:
  manager = self->_manager;
  uint64_t v12 = manager[30];
  *(void *)int v28 = manager + 30;
  v28[8] = (*(uint64_t (**)(void *))(v12 + 16))(manager + 30);
  int v13 = (*(uint64_t (**)(void))(*(void *)manager[29] + 16))(manager[29]);
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)v28);
  if (v13)
  {
    if (kHSRVScope)
    {
      __int16 v14 = *(id *)kHSRVScope;
      if (!v14) {
        goto LABEL_31;
      }
    }
    else
    {
      __int16 v14 = MEMORY[0x1E4F14500];
      id v15 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int v28 = 136315650;
      *(void *)&void v28[4] = "AVHapticServer.mm";
      __int16 v29 = 1024;
      int v30 = 1838;
      __int16 v31 = 2080;
      int v32 = "-[AVHapticServer incrementInit:]";
      __int16 v16 = "%25s:%-5d %s: ERROR: failed to initialize haptic synth AU";
LABEL_29:
      _os_log_impl(&dword_1A3931000, v14, OS_LOG_TYPE_ERROR, v16, v28, 0x1Cu);
      goto LABEL_30;
    }
    goto LABEL_30;
  }
  int v13 = [(AVHapticServer *)self loadSynthPreset];
  if (!v13) {
    goto LABEL_33;
  }
  if (!kHSRVScope)
  {
    __int16 v14 = MEMORY[0x1E4F14500];
    id v17 = MEMORY[0x1E4F14500];
LABEL_27:
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int v28 = 136315650;
      *(void *)&void v28[4] = "AVHapticServer.mm";
      __int16 v29 = 1024;
      int v30 = 1841;
      __int16 v31 = 2080;
      int v32 = "-[AVHapticServer incrementInit:]";
      __int16 v16 = "%25s:%-5d %s: ERROR: failed to load haptic preset";
      goto LABEL_29;
    }
LABEL_30:

    goto LABEL_31;
  }
  __int16 v14 = *(id *)kHSRVScope;
  if (v14) {
    goto LABEL_27;
  }
LABEL_31:
  if (a3)
  {
    id v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:v13 userInfo:0];
    *a3 = v18;
    goto LABEL_34;
  }
LABEL_33:
  id v18 = *a3;
LABEL_34:
  if (!v18)
  {
    if (kHSRVScope)
    {
      int v19 = *(id *)kHSRVScope;
      if (!v19) {
        return v18 == 0;
      }
    }
    else
    {
      int v19 = MEMORY[0x1E4F14500];
      id v25 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      goto LABEL_48;
    }
    unint64_t runningChannelIDCount = self->_runningChannelIDCount;
    *(_DWORD *)int v28 = 136315906;
    *(void *)&void v28[4] = "AVHapticServer.mm";
    __int16 v29 = 1024;
    int v30 = 1854;
    __int16 v31 = 2080;
    int v32 = "-[AVHapticServer incrementInit:]";
    __int16 v33 = 1024;
    LODWORD(v34) = runningChannelIDCount;
    id v22 = "%25s:%-5d %s: _runningChannelIDCount at 0x%x";
    int v23 = v19;
    uint32_t v24 = 34;
    goto LABEL_47;
  }
  if (kHSRVScope)
  {
    int v19 = *(id *)kHSRVScope;
    if (!v19) {
      return v18 == 0;
    }
  }
  else
  {
    int v19 = MEMORY[0x1E4F14500];
    id v20 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v21 = *a3;
    *(_DWORD *)int v28 = 136315906;
    *(void *)&void v28[4] = "AVHapticServer.mm";
    __int16 v29 = 1024;
    int v30 = 1851;
    __int16 v31 = 2080;
    int v32 = "-[AVHapticServer incrementInit:]";
    __int16 v33 = 2112;
    id v34 = v21;
    id v22 = "%25s:%-5d %s: Returning outError %@";
    int v23 = v19;
    uint32_t v24 = 38;
LABEL_47:
    _os_log_impl(&dword_1A3931000, v23, OS_LOG_TYPE_INFO, v22, v28, v24);
  }
LABEL_48:

  return v18 == 0;
}

- (int)loadSynthPreset
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  TuningPListMgr::TuningPListMgr((TuningPListMgr *)v68, "/Library/Audio/Tunings");
  uint64_t v4 = PlatformUtilities::CopyHardwareModelShortName(v3);
  uint64_t v66 = v4;
  char v67 = 1;
  if (kHSRVScope)
  {
    unint64_t v5 = *(id *)kHSRVScope;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    unint64_t v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1812;
    *(_WORD *)&unsigned char buf[18] = 2080;
    *(void *)&buf[20] = "-[AVHapticServer loadSynthPreset]";
    *(_WORD *)&buf[28] = 2112;
    *(void *)&buf[30] = v4;
    _os_log_impl(&dword_1A3931000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Product: '%@'", buf, 0x26u);
  }

LABEL_8:
  CFStringRef v78 = CFStringCreateWithCString(0, "Haptics", 0x600u);
  LOBYTE(v79) = 1;
  CFArrayRef Mutable = (CFArrayRef)CFStringCreateWithCString(0, "hapticengineconfig", 0x600u);
  LOBYTE(v77) = 1;
  *(void *)buf = &v66;
  *(void *)&buf[8] = &v78;
  *(void *)&buf[16] = &Mutable;
  int TuningInSubdirs = TuningPListMgr::loadTuningInSubdirs_();
  CACFString::~CACFString((CACFString *)&Mutable);
  CACFString::~CACFString((CACFString *)&v78);
  if (!TuningInSubdirs) {
    goto LABEL_21;
  }
  if (PlatformUtilities_iOS::ProductSupportsClosedLoopHaptics(v8)) {
    goto LABEL_18;
  }
  if (kHSRVScope)
  {
    BOOL v9 = *(id *)kHSRVScope;
    if (!v9) {
      goto LABEL_17;
    }
  }
  else
  {
    BOOL v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1815;
    *(_WORD *)&unsigned char buf[18] = 2080;
    *(void *)&buf[20] = "-[AVHapticServer loadSynthPreset]";
    _os_log_impl(&dword_1A3931000, v9, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Product does not support closed loop haptics, loading generic config", buf, 0x1Cu);
  }

LABEL_17:
  CFStringRef v78 = CFStringCreateWithCString(0, "Generic", 0x600u);
  LOBYTE(v79) = 1;
  CFArrayRef Mutable = (CFArrayRef)CFStringCreateWithCString(0, "Haptics", 0x600u);
  LOBYTE(v77) = 1;
  v74 = (void *)CFStringCreateWithCString(0, "Config", 0x600u);
  LOBYTE(v75) = 1;
  CFArrayRef theArray = (CFArrayRef)CFStringCreateWithCString(0, "hapticengineconfig", 0x600u);
  LOBYTE(v72) = 1;
  *(void *)buf = &v78;
  *(void *)&buf[8] = &Mutable;
  *(void *)&buf[16] = &v74;
  *(void *)&buf[24] = &theArray;
  int TuningInSubdirs = TuningPListMgr::loadTuningInSubdirs_();
  CACFString::~CACFString((CACFString *)&theArray);
  CACFString::~CACFString((CACFString *)&v74);
  CACFString::~CACFString((CACFString *)&Mutable);
  CACFString::~CACFString((CACFString *)&v78);
  if (TuningInSubdirs)
  {
LABEL_18:
    if (kHSRVScope)
    {
      int v11 = *(id *)kHSRVScope;
      if (!v11)
      {
LABEL_29:
        int v19 = -43;
        goto LABEL_187;
      }
    }
    else
    {
      int v11 = MEMORY[0x1E4F14500];
      id v18 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1819;
      *(_WORD *)&unsigned char buf[18] = 2080;
      *(void *)&buf[20] = "-[AVHapticServer loadSynthPreset]";
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = TuningInSubdirs;
      _os_log_impl(&dword_1A3931000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unable to load the configuration plist: err %d", buf, 0x22u);
    }

    goto LABEL_29;
  }
LABEL_21:
  CFStringRef AUPListByName = (const __CFString *)TuningPListMgr::getAUPListByName((TuningPListMgr *)v68, "hapticengineconfig");
  CFStringRef v13 = AUPListByName;
  if (!AUPListByName)
  {
    if (kHSRVScope)
    {
      id v20 = *(id *)kHSRVScope;
      if (!v20)
      {
LABEL_56:
        int v19 = -50;
        goto LABEL_187;
      }
    }
    else
    {
      id v20 = MEMORY[0x1E4F14500];
      id v27 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1824;
      *(_WORD *)&unsigned char buf[18] = 2080;
      *(void *)&buf[20] = "-[AVHapticServer loadSynthPreset]";
      _os_log_impl(&dword_1A3931000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unable to access the configuration dictionary", buf, 0x1Cu);
    }

    goto LABEL_56;
  }
  CFRetain(AUPListByName);
  CFStringRef v64 = v13;
  __int16 v65 = 1;
  manager = self->_manager;
  uint64_t v15 = manager[30];
  v69 = (char *)(manager + 30);
  char v70 = (*(uint64_t (**)(void))(v15 + 16))();
  __int16 v16 = (HapticSynth *)manager[29];
  int inData = 1;
  if (kHSYNScope)
  {
    id v17 = *(id *)kHSYNScope;
    if (!v17) {
      goto LABEL_37;
    }
  }
  else
  {
    id v17 = MEMORY[0x1E4F14500];
    id v21 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "HapticSynth_Parser.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 224;
    *(_WORD *)&unsigned char buf[18] = 2080;
    *(void *)&buf[20] = "loadPresetDictionary";
    _os_log_impl(&dword_1A3931000, v17, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Cleaning out all old preset data", buf, 0x1Cu);
  }

LABEL_37:
  uint64_t v22 = *((void *)v16 + 24);
  if (v22) {
    int v23 = *(OpaqueAudioComponentInstance **)(v22 + 16);
  }
  else {
    int v23 = 0;
  }
  int v19 = AudioUnitSetProperty(v23, 0x1029u, 0, 0, &inData, 4u);
  if (!v19)
  {
    CFStringRef v78 = v13;
    __int16 v79 = 0;
    if (!CACFDictionary::HasKey((CACFDictionary *)&v78, @"Configuration")) {
      goto LABEL_72;
    }
    if (kHPRSScope)
    {
      id v25 = *(id *)kHPRSScope;
      if (!v25) {
        goto LABEL_61;
      }
    }
    else
    {
      id v25 = MEMORY[0x1E4F14500];
      id v28 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "HapticSynth_Parser.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 237;
      *(_WORD *)&unsigned char buf[18] = 2080;
      *(void *)&buf[20] = "loadPresetDictionary";
      _os_log_impl(&dword_1A3931000, v25, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Preset includes configuration dict", buf, 0x1Cu);
    }

LABEL_61:
    CFArrayRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    __int16 v77 = 257;
    CACFDictionary::GetCACFDictionary((CACFDictionary *)&v78, @"Configuration", (CACFDictionary *)&Mutable);
    LODWORD(v74) = 0;
    if (!CACFDictionary::GetFloat32((CACFDictionary *)&Mutable, @"BaseSineFrequency", (float *)&v74))
    {
LABEL_71:
      CACFDictionary::~CACFDictionary((CACFDictionary *)&Mutable);
LABEL_72:
      if (!CACFDictionary::HasKey((CACFDictionary *)&v78, @"Events"))
      {
LABEL_143:
        int v19 = 0;
        goto LABEL_185;
      }
      CFArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
      __int16 v77 = 257;
      CACFDictionary::GetCACFArray((CACFDictionary *)&v78, @"Events", (CACFArray *)&Mutable);
      if (Mutable)
      {
        int Count = CFArrayGetCount(Mutable);
        if (Count)
        {
          int v63 = Count;
          if (kHPRSScope)
          {
            int v32 = *(id *)kHPRSScope;
            if (!v32)
            {
LABEL_93:
              uint64_t v37 = 0;
              while (1)
              {
                v74 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
                __int16 v75 = 257;
                CACFArray::GetCACFDictionary((CACFArray *)&Mutable, v37, (CACFDictionary *)&v74);
                if (!v74)
                {
                  if (kHPRSScope)
                  {
                    id v53 = *(id *)kHPRSScope;
                    if (!v53)
                    {
LABEL_168:
                      CACFDictionary::~CACFDictionary((CACFDictionary *)&v74);
                      goto LABEL_88;
                    }
                  }
                  else
                  {
                    id v53 = MEMORY[0x1E4F14500];
                    id v56 = MEMORY[0x1E4F14500];
                  }
                  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315650;
                    *(void *)&uint8_t buf[4] = "HapticSynth_Parser.mm";
                    *(_WORD *)&buf[12] = 1024;
                    *(_DWORD *)&buf[14] = 314;
                    *(_WORD *)&unsigned char buf[18] = 2080;
                    *(void *)&buf[20] = "loadPresetDictionary";
                    _os_log_impl(&dword_1A3931000, v53, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Invalid event dictionary entry", buf, 0x1Cu);
                  }

                  goto LABEL_168;
                }
                if (kHPRSScope)
                {
                  if (*(unsigned char *)(kHPRSScope + 8))
                  {
                    __int16 v38 = *(id *)kHPRSScope;
                    if (v38)
                    {
                      uint64_t v39 = v38;
                      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 136315906;
                        *(void *)&uint8_t buf[4] = "HapticSynth_Parser.mm";
                        *(_WORD *)&buf[12] = 1024;
                        *(_DWORD *)&buf[14] = 267;
                        *(_WORD *)&unsigned char buf[18] = 2080;
                        *(void *)&buf[20] = "loadPresetDictionary";
                        *(_WORD *)&buf[28] = 1024;
                        *(_DWORD *)&buf[30] = v37;
                        _os_log_impl(&dword_1A3931000, v39, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Event %d:", buf, 0x22u);
                      }
                    }
                  }
                }
                unsigned int v73 = 0;
                int UInt32 = CACFDictionary::GetUInt32((CACFDictionary *)&v74, @"TypeID", &v73);
                if (!UInt32)
                {
                  if (kHPRSScope)
                  {
                    int v42 = *(id *)kHPRSScope;
                    if (!v42)
                    {
                      unsigned int v43 = -1;
                      int v44 = -1;
                      goto LABEL_124;
                    }
                  }
                  else
                  {
                    int v42 = MEMORY[0x1E4F14500];
                    id v46 = MEMORY[0x1E4F14500];
                  }
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 136315650;
                    *(void *)&uint8_t buf[4] = "HapticSynth_Parser.mm";
                    *(_WORD *)&buf[12] = 1024;
                    *(_DWORD *)&buf[14] = 284;
                    *(_WORD *)&unsigned char buf[18] = 2080;
                    *(void *)&buf[20] = "loadPresetDictionary";
                    _os_log_impl(&dword_1A3931000, v42, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: No top-level type ID -- we'll search in the Layers", buf, 0x1Cu);
                  }
                  unsigned int v43 = -1;
                  int v44 = -1;
                  goto LABEL_123;
                }
                if (kHPRSScope)
                {
                  __int16 v41 = *(id *)kHPRSScope;
                  if (!v41) {
                    goto LABEL_112;
                  }
                }
                else
                {
                  __int16 v41 = MEMORY[0x1E4F14500];
                  id v45 = MEMORY[0x1E4F14500];
                }
                if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136316162;
                  *(void *)&uint8_t buf[4] = "HapticSynth_Parser.mm";
                  *(_WORD *)&buf[12] = 1024;
                  *(_DWORD *)&buf[14] = 273;
                  *(_WORD *)&unsigned char buf[18] = 2080;
                  *(void *)&buf[20] = "loadPresetDictionary";
                  *(_WORD *)&buf[28] = 1024;
                  *(_DWORD *)&buf[30] = v73;
                  *(_WORD *)&buf[34] = 1024;
                  *(_DWORD *)&buf[36] = v73;
                  _os_log_impl(&dword_1A3931000, v41, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: ID: %u (0x%x)", buf, 0x28u);
                }

LABEL_112:
                unsigned int v43 = v73;
                int v44 = BYTE1(v73);
                if ((BYTE1(v73) | v73) >= 0x80)
                {
                  if (kHPRSScope)
                  {
                    __int16 v54 = *(id *)kHPRSScope;
                    if (!v54) {
                      goto LABEL_182;
                    }
                  }
                  else
                  {
                    __int16 v54 = MEMORY[0x1E4F14500];
                    id v62 = MEMORY[0x1E4F14500];
                  }
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315650;
                    *(void *)&uint8_t buf[4] = "HapticSynth_Parser.mm";
                    *(_WORD *)&buf[12] = 1024;
                    *(_DWORD *)&buf[14] = 276;
                    *(_WORD *)&unsigned char buf[18] = 2080;
                    *(void *)&buf[20] = "loadPresetDictionary";
                    _os_log_impl(&dword_1A3931000, v54, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Illegal Event ID", buf, 0x1Cu);
                  }
LABEL_172:

LABEL_182:
                  int v19 = -50;
LABEL_183:
                  CACFDictionary::~CACFDictionary((CACFDictionary *)&v74);
LABEL_184:
                  CACFArray::~CACFArray((CACFArray *)&Mutable);
LABEL_185:
                  CACFDictionary::~CACFDictionary((CACFDictionary *)&v78);
                  goto LABEL_186;
                }
                if (!kHPRSScope)
                {
                  int v42 = MEMORY[0x1E4F14500];
                  id v47 = MEMORY[0x1E4F14500];
LABEL_121:
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 136316674;
                    *(void *)&uint8_t buf[4] = "HapticSynth_Parser.mm";
                    *(_WORD *)&buf[12] = 1024;
                    *(_DWORD *)&buf[14] = 281;
                    *(_WORD *)&unsigned char buf[18] = 2080;
                    *(void *)&buf[20] = "loadPresetDictionary";
                    *(_WORD *)&buf[28] = 1024;
                    *(_DWORD *)&buf[30] = v43 < 0x55;
                    *(_WORD *)&buf[34] = 1024;
                    *(_DWORD *)&buf[36] = v43 > 0x2C;
                    __int16 v82 = 1024;
                    unsigned int v83 = v43;
                    __int16 v84 = 1024;
                    int v85 = v44;
                    _os_log_impl(&dword_1A3931000, v42, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: audio: %d haptic: %d keynum: %d velocity: %d", buf, 0x34u);
                  }
LABEL_123:

                  goto LABEL_124;
                }
                int v42 = *(id *)kHPRSScope;
                if (v42) {
                  goto LABEL_121;
                }
LABEL_124:
                if (!CACFDictionary::HasKey((CACFDictionary *)&v74, @"Layers"))
                {
                  if (kHPRSScope)
                  {
                    __int16 v54 = *(id *)kHPRSScope;
                    if (!v54) {
                      goto LABEL_182;
                    }
                  }
                  else
                  {
                    __int16 v54 = MEMORY[0x1E4F14500];
                    id v57 = MEMORY[0x1E4F14500];
                  }
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315650;
                    *(void *)&uint8_t buf[4] = "HapticSynth_Parser.mm";
                    *(_WORD *)&buf[12] = 1024;
                    *(_DWORD *)&buf[14] = 305;
                    *(_WORD *)&unsigned char buf[18] = 2080;
                    *(void *)&buf[20] = "loadPresetDictionary";
                    _os_log_impl(&dword_1A3931000, v54, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: No layers array", buf, 0x1Cu);
                  }
                  goto LABEL_172;
                }
                CFArrayRef theArray = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
                __int16 v72 = 257;
                CACFDictionary::GetCACFArray((CACFDictionary *)&v74, @"Layers", (CACFArray *)&theArray);
                if (theArray) {
                  unsigned int v48 = CFArrayGetCount(theArray);
                }
                else {
                  unsigned int v48 = 0;
                }
                if (kHPRSScope)
                {
                  id v49 = *(id *)kHPRSScope;
                  if (!v49) {
                    goto LABEL_135;
                  }
                }
                else
                {
                  id v49 = MEMORY[0x1E4F14500];
                  id v50 = MEMORY[0x1E4F14500];
                }
                if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315906;
                  *(void *)&uint8_t buf[4] = "HapticSynth_Parser.mm";
                  *(_WORD *)&buf[12] = 1024;
                  *(_DWORD *)&buf[14] = 291;
                  *(_WORD *)&unsigned char buf[18] = 2080;
                  *(void *)&buf[20] = "loadPresetDictionary";
                  *(_WORD *)&buf[28] = 1024;
                  *(_DWORD *)&buf[30] = v48;
                  _os_log_impl(&dword_1A3931000, v49, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Event has %u layers", buf, 0x22u);
                }

LABEL_135:
                if (!v48)
                {
                  if (kHPRSScope)
                  {
                    v55 = *(id *)kHPRSScope;
                    if (!v55) {
                      goto LABEL_181;
                    }
                  }
                  else
                  {
                    v55 = MEMORY[0x1E4F14500];
                    id v58 = MEMORY[0x1E4F14500];
                  }
                  if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315650;
                    *(void *)&uint8_t buf[4] = "HapticSynth_Parser.mm";
                    *(_WORD *)&buf[12] = 1024;
                    *(_DWORD *)&buf[14] = 293;
                    *(_WORD *)&unsigned char buf[18] = 2080;
                    *(void *)&buf[20] = "loadPresetDictionary";
                    uint64_t v59 = "%25s:%-5d %s: Empty layers array";
                    goto LABEL_179;
                  }
LABEL_180:

                  goto LABEL_181;
                }
                if (v48 > 2) {
                  int v51 = UInt32;
                }
                else {
                  int v51 = 0;
                }
                if (v51 == 1)
                {
                  if (kHPRSScope)
                  {
                    v55 = *(id *)kHPRSScope;
                    if (!v55)
                    {
LABEL_181:
                      CACFArray::~CACFArray((CACFArray *)&theArray);
                      goto LABEL_182;
                    }
                  }
                  else
                  {
                    v55 = MEMORY[0x1E4F14500];
                    id v60 = MEMORY[0x1E4F14500];
                  }
                  if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315650;
                    *(void *)&uint8_t buf[4] = "HapticSynth_Parser.mm";
                    *(_WORD *)&buf[12] = 1024;
                    *(_DWORD *)&buf[14] = 297;
                    *(_WORD *)&unsigned char buf[18] = 2080;
                    *(void *)&buf[20] = "loadPresetDictionary";
                    uint64_t v59 = "%25s:%-5d %s: Cannot have more than 2 layers";
LABEL_179:
                    _os_log_impl(&dword_1A3931000, v55, OS_LOG_TYPE_ERROR, v59, buf, 0x1Cu);
                  }
                  goto LABEL_180;
                }
                int v19 = HapticSynth::walkLayerList(v16, &theArray, v43, v44);
                CACFArray::~CACFArray((CACFArray *)&theArray);
                if (v19) {
                  goto LABEL_183;
                }
                *(_DWORD *)buf = 0;
                CACFDictionary::GetFloat32((CACFDictionary *)&v74, @"Gain", (float *)buf);
                CACFDictionary::~CACFDictionary((CACFDictionary *)&v74);
                uint64_t v37 = (v37 + 1);
                if (v63 == v37)
                {
                  CACFArray::~CACFArray((CACFArray *)&Mutable);
                  goto LABEL_143;
                }
              }
            }
          }
          else
          {
            int v32 = MEMORY[0x1E4F14500];
            id v36 = MEMORY[0x1E4F14500];
          }
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315906;
            *(void *)&uint8_t buf[4] = "HapticSynth_Parser.mm";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 261;
            *(_WORD *)&unsigned char buf[18] = 2080;
            *(void *)&buf[20] = "loadPresetDictionary";
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = v63;
            _os_log_impl(&dword_1A3931000, v32, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Preset has %u events", buf, 0x22u);
          }

          goto LABEL_93;
        }
      }
      if (kHPRSScope)
      {
        __int16 v33 = *(id *)kHPRSScope;
        if (!v33)
        {
LABEL_88:
          int v19 = -50;
          goto LABEL_184;
        }
      }
      else
      {
        __int16 v33 = MEMORY[0x1E4F14500];
        id v35 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "HapticSynth_Parser.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 258;
        *(_WORD *)&unsigned char buf[18] = 2080;
        *(void *)&buf[20] = "loadPresetDictionary";
        _os_log_impl(&dword_1A3931000, v33, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Empty events array", buf, 0x1Cu);
      }

      goto LABEL_88;
    }
    if (kHPRSScope)
    {
      __int16 v29 = *(id *)kHPRSScope;
      if (!v29) {
        goto LABEL_69;
      }
    }
    else
    {
      __int16 v29 = MEMORY[0x1E4F14500];
      id v30 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "HapticSynth_Parser.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 242;
      *(_WORD *)&unsigned char buf[18] = 2080;
      *(void *)&buf[20] = "loadPresetDictionary";
      *(_WORD *)&buf[28] = 2048;
      *(double *)&buf[30] = *(float *)&v74;
      _os_log_impl(&dword_1A3931000, v29, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: baseSineFreq: %f", buf, 0x26u);
    }

LABEL_69:
    if (*(float *)&v74 > 0.0)
    {
      ServerConfiguration::sSineFrequency = (int)v74;
      goto LABEL_71;
    }
    if (kHPRSScope)
    {
      id v34 = *(id *)kHPRSScope;
      if (!v34)
      {
LABEL_148:
        CACFDictionary::~CACFDictionary((CACFDictionary *)&Mutable);
        int v19 = -50;
        goto LABEL_185;
      }
    }
    else
    {
      id v34 = MEMORY[0x1E4F14500];
      id v52 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "HapticSynth_Parser.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 247;
      *(_WORD *)&unsigned char buf[18] = 2080;
      *(void *)&buf[20] = "loadPresetDictionary";
      *(_WORD *)&buf[28] = 2048;
      *(double *)&buf[30] = *(float *)&v74;
      _os_log_impl(&dword_1A3931000, v34, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Illegal base sine frequency: %f", buf, 0x26u);
    }

    goto LABEL_148;
  }
  if (kHPRSScope)
  {
    uint32_t v24 = *(id *)kHPRSScope;
    if (!v24) {
      goto LABEL_186;
    }
  }
  else
  {
    uint32_t v24 = MEMORY[0x1E4F14500];
    id v26 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "HapticSynth_Parser.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 227;
    *(_WORD *)&unsigned char buf[18] = 2080;
    *(void *)&buf[20] = "loadPresetDictionary";
    _os_log_impl(&dword_1A3931000, v24, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Unable to clean the AU state", buf, 0x1Cu);
  }

LABEL_186:
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&v69);
  CACFDictionary::~CACFDictionary((CACFDictionary *)&v64);
LABEL_187:
  CACFString::~CACFString((CACFString *)&v66);
  MEMORY[0x1A62510C0](v68);
  return v19;
}

- (BOOL)setupSSSClient
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(AVHapticServer *)v2 addProcessEntry:getpid()];
  if (v3 != -1)
  {
    if (kHSRVScope)
    {
      uint64_t v4 = *(id *)kHSRVScope;
      if (!v4) {
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v4 = MEMORY[0x1E4F14500];
      id v5 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1787;
      __int16 v8 = 2080;
      BOOL v9 = "-[AVHapticServer setupSSSClient]";
      __int16 v10 = 2048;
      uint64_t v11 = v3;
      _os_log_impl(&dword_1A3931000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Setting up persistant client for SSS: ID: 0x%lx", buf, 0x26u);
    }

LABEL_9:
    operator new();
  }
  objc_sync_exit(v2);

  return 0;
}

- (void)dealloc
{
  [(AVHapticServer *)self cleanup];
  v3.receiver = self;
  v3.super_class = (Class)AVHapticServer;
  [(AVHapticServer *)&v3 dealloc];
}

- (void)cleanup
{
  manager = (char *)self->_manager;
  if (manager)
  {
    uint64_t v4 = *((void *)manager + 25);
    id v20 = manager + 24;
    char v21 = 1;
    std::__shared_mutex_base::lock((std::__shared_mutex_base *)(manager + 24));
    uint64_t v22 = manager;
    int v23 = manager + 192;
    uint64_t v24 = v4;
    manager[192] = 1;
    id v5 = *(void **)manager;
    id v6 = manager + 8;
    if (*(char **)manager != manager + 8)
    {
      do
      {
        BOOL v7 = (ClientEntry *)v5[5];
        __int16 v8 = (std::__shared_weak_count *)v5[6];
        if (v8) {
          atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        ClientEntry::uninitialize(v7);
        if (v8) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v8);
        }
        BOOL v9 = (void *)v5[1];
        if (v9)
        {
          do
          {
            __int16 v10 = v9;
            BOOL v9 = (void *)*v9;
          }
          while (v9);
        }
        else
        {
          do
          {
            __int16 v10 = (void *)v5[2];
            BOOL v11 = *v10 == (void)v5;
            id v5 = v10;
          }
          while (!v11);
        }
        id v5 = v10;
      }
      while (v10 != v6);
    }
    manager[192] = 0;
    std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v20);
    uint64_t v12 = *((void *)manager + 25);
    id v20 = manager + 24;
    char v21 = 1;
    std::__shared_mutex_base::lock((std::__shared_mutex_base *)(manager + 24));
    uint64_t v22 = manager;
    int v23 = manager + 192;
    uint64_t v24 = v12;
    manager[192] = 1;
    std::__tree<std::__value_type<unsigned long,std::shared_ptr<ClientEntry>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::shared_ptr<ClientEntry>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::shared_ptr<ClientEntry>>>>::destroy(*((void **)manager + 1));
    *((void *)manager + 1) = 0;
    *((void *)manager + 2) = 0;
    *(void *)manager = v6;
    manager[192] = 0;
    std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v20);
    if (HapticMessenger::_sMessenger)
    {
      uint64_t v13 = MEMORY[0x1A6251610]();
      MEMORY[0x1A62520E0](v13, 0x20C40A4A59CD2);
    }
    HapticMessenger::_sMessenger = 0;
    __int16 v14 = (void *)*((void *)manager + 60);
    *((void *)manager + 60) = 0;

    uint64_t v15 = (std::__shared_weak_count *)*((void *)manager + 58);
    if (v15) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v15);
    }
    __int16 v16 = (std::__shared_weak_count *)*((void *)manager + 56);
    if (v16) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v16);
    }
    uint64_t v17 = *((void *)manager + 54);
    *((void *)manager + 54) = 0;
    if (v17) {
      (*(void (**)(uint64_t))(*(void *)v17 + 8))(v17);
    }
    std::unique_ptr<AudioEventManager>::reset[abi:ne180100]((uint64_t *)manager + 53);
    CADeprecated::CAMutex::~CAMutex((CADeprecated::CAMutex *)(manager + 328));
    CADeprecated::CAMutex::~CAMutex((CADeprecated::CAMutex *)(manager + 240));
    uint64_t v18 = *((void *)manager + 29);
    *((void *)manager + 29) = 0;
    if (v18) {
      (*(void (**)(uint64_t))(*(void *)v18 + 8))(v18);
    }
    std::__list_imp<ServerManager::SynthCommand,caulk::rt_allocator<ServerManager::SynthCommand>>::clear((void *)manager + 26);
    uint64_t v19 = RTLocked<std::map,unsigned long,std::shared_ptr<ClientEntry>>::~RTLocked((uint64_t)manager);
    MEMORY[0x1A62520E0](v19, 0x10F0C4046860FD6);
  }
  self->_manager = 0;
}

- (AVHapticServer)init
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (setupServerLogScopes(void)::once != -1) {
    dispatch_once(&setupServerLogScopes(void)::once, &__block_literal_global_326);
  }
  v6.receiver = self;
  v6.super_class = (Class)AVHapticServer;
  objc_super v3 = [(AVHapticServer *)&v6 init];
  if (v3)
  {
    *(_OWORD *)(v3 + 168) = 0u;
    *(_OWORD *)(v3 + 152) = 0u;
    *((void *)v3 + 23) = 0;
    *((void *)v3 + 24) = 1792;
    operator new();
  }
  uint64_t v4 = (AVHapticServer *)0;

  return v4;
}

void __22__AVHapticServer_init__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int v2 = (HapticMetrics *)CADeprecated::TSingleton<HapticMetrics>::instance();
  double v3 = HapticMetrics::onTime(v2);
  uint64_t v4 = CADeprecated::TSingleton<HapticMetrics>::instance();
  std::mutex::lock((std::mutex *)(v4 + 32));
  double v5 = 0.0;
  if (*(unsigned char *)(v4 + 18)) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = *(unsigned char *)(v4 + 17) == 0;
  }
  if (!v6) {
    double v5 = (double)mach_absolute_time() * 0.0000000416666667 - *(double *)(v4 + 8);
  }
  std::mutex::unlock((std::mutex *)(v4 + 32));
  if (v3 > 0.0)
  {
    if (kHSRVScope)
    {
      if (*(unsigned char *)(kHSRVScope + 8))
      {
        uint64_t v7 = *(id *)kHSRVScope;
        if (v7)
        {
          __int16 v8 = v7;
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315906;
            uint64_t v19 = "AVHapticServer.mm";
            __int16 v20 = 1024;
            int v21 = 1722;
            __int16 v22 = 2080;
            int v23 = "-[AVHapticServer init]_block_invoke";
            __int16 v24 = 2048;
            double v25 = v3;
            _os_log_impl(&dword_1A3931000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: <Haptic on time: %.1f seconds>", buf, 0x26u);
          }
        }
      }
    }
  }
  if (v5 > 0.0)
  {
    if (kHSRVScope)
    {
      if (*(unsigned char *)(kHSRVScope + 8))
      {
        BOOL v9 = *(id *)kHSRVScope;
        if (v9)
        {
          __int16 v10 = v9;
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315906;
            uint64_t v19 = "AVHapticServer.mm";
            __int16 v20 = 1024;
            int v21 = 1723;
            __int16 v22 = 2080;
            int v23 = "-[AVHapticServer init]_block_invoke";
            __int16 v24 = 2048;
            double v25 = v5;
            _os_log_impl(&dword_1A3931000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: <Haptic prewarm time: %.1f seconds>", buf, 0x26u);
          }
        }
      }
    }
  }
  if (v3 > *(double *)&PowerTimer::_sOnTimeThreshold)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v12 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained displayRunningProcessEntriesWithOnTime:(unint64_t)v3];
    }
  }
  if (v5 > 600.0)
  {
    id v13 = objc_loadWeakRetained((id *)(a1 + 32));
    __int16 v14 = v13;
    if (v13
      && [v13 shouldUnprewarmAllClientsAfterDisplayingPrewarmedProcessEntriesWithPrewarmTime:(unint64_t)v5])
    {
      objc_initWeak((id *)buf, v14);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __22__AVHapticServer_init__block_invoke_369;
      v16[3] = &unk_1E5B14848;
      objc_copyWeak(&v17, (id *)buf);
      if (AudioControlQueue(void)::once != -1) {
        dispatch_once(&AudioControlQueue(void)::once, &__block_literal_global_8);
      }
      id v15 = (id)AudioControlQueue(void)::gAudioControlQueue;
      AT::DispatchBlock(v15, v16, 1, (uint64_t)"-[AVHapticServer init]_block_invoke", (uint64_t)"AVHapticServer.mm", 1739);

      objc_destroyWeak(&v17);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __22__AVHapticServer_init__block_invoke_2(uint64_t a1, FILE *__stream)
{
  fwrite("Server:\n", 8uLL, 1uLL, __stream);
  uint64_t v4 = *(void *)(a1 + 32);
  fprintf(__stream, "\tinit count: %d, prewarm count: audio %d haptics %d running count: audio %d haptics %d\n", *(_OWORD *)(v4 + 152), *(void *)(v4 + 160), *(_OWORD *)(v4 + 168), *(void *)(v4 + 176), *(void *)(v4 + 184));
  double v5 = (HapticMetrics *)CADeprecated::TSingleton<HapticMetrics>::instance();
  double v6 = HapticMetrics::onTime(v5);
  fprintf(__stream, "\tHaptics on-time: %.1f seconds\n", v6);
  [*(id *)(a1 + 32) dumpProcessEntries:__stream];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 120);
  fwrite("\nServerManager:\n", 0x10uLL, 1uLL, __stream);
  int v8 = *(unsigned __int8 *)(v7 + 472);
  int v9 = *(unsigned __int8 *)(v7 + 474);
  int v10 = *(unsigned __int8 *)(v7 + 475);
  unsigned __int8 v11 = atomic_load((unsigned __int8 *)(v7 + 478));
  int v12 = v11 & 1;
  int v13 = (*(uint64_t (**)(void))(**(void **)(v7 + 456) + 64))(*(void *)(v7 + 456));
  int v14 = (*(uint64_t (**)(void))(**(void **)(v7 + 456) + 72))(*(void *)(v7 + 456));
  fprintf(__stream, "\tGlobal: mVibrationDisabled: %d mPhoneCallActive: %d mMicIsActive: %d mContinuityScreenOn: %d mActiveHighPriorityClientCount: %d, mActiveMediumPriorityClientCount: %d\n", v8, v9, v10, v12, v13, v14);
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"effects-haptic", @"com.apple.preferences.sounds", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    fprintf(__stream, "\tSystem Haptics Enabled: %d\n", AppBooleanValue);
  }
  uint64_t v16 = *(void *)(v7 + 224);
  uint64_t v17 = *(void *)(v7 + 200);
  uint64_t v27 = v7 + 24;
  char v28 = 1;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)(v7 + 24));
  uint64_t v29 = v7;
  uint64_t v30 = v17;
  fprintf(__stream, "\tCommand list length: %d\n\t%d clients:\n", v16, *(void *)(v7 + 16));
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v27);
  uint64_t v18 = *(void *)(v7 + 200);
  uint64_t v27 = v7 + 24;
  char v28 = 1;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)(v7 + 24));
  uint64_t v29 = v7;
  uint64_t v30 = v18;
  uint64_t v19 = *(void **)v7;
  if (*(void *)v7 != v7 + 8)
  {
    do
    {
      __int16 v20 = (ClientEntry *)v19[5];
      int v21 = (std::__shared_weak_count *)v19[6];
      if (v21) {
        atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      ClientEntry::dump(v20, __stream);
      if (v21) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v21);
      }
      __int16 v22 = (void *)v19[1];
      if (v22)
      {
        do
        {
          int v23 = v22;
          __int16 v22 = (void *)*v22;
        }
        while (v22);
      }
      else
      {
        do
        {
          int v23 = (void *)v19[2];
          BOOL v24 = *v23 == (void)v19;
          uint64_t v19 = v23;
        }
        while (!v24);
      }
      uint64_t v19 = v23;
    }
    while (v23 != (void *)(v7 + 8));
  }
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v27);
  uint64_t v26 = *(void *)(v7 + 240);
  uint64_t v25 = v7 + 240;
  uint64_t v27 = v25;
  char v28 = (*(uint64_t (**)(uint64_t))(v26 + 16))(v25);
  (*(void (**)(void, FILE *))(**(void **)(v25 - 8) + 152))(*(void *)(v25 - 8), __stream);
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&v27);
}

void __22__AVHapticServer_init__block_invoke_369(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (kHSRVScope)
  {
    int v2 = *(id *)kHSRVScope;
    if (!v2) {
      goto LABEL_8;
    }
  }
  else
  {
    int v2 = MEMORY[0x1E4F14500];
    id v3 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315650;
    double v5 = "AVHapticServer.mm";
    __int16 v6 = 1024;
    int v7 = 1737;
    __int16 v8 = 2080;
    int v9 = "-[AVHapticServer init]_block_invoke";
    _os_log_impl(&dword_1A3931000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Synth has been prewarmed beyond threshold time. Unprewarming all clients", (uint8_t *)&v4, 0x1Cu);
  }

LABEL_8:
  [WeakRetained unprewarmAllClientEntries];
}

- (int)cancelPatternWithOptions:(__CFDictionary *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (kHSRVScope)
  {
    double v5 = *(id *)kHSRVScope;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    double v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
    __int16 v21 = 1024;
    int v22 = 1624;
    __int16 v23 = 2080;
    BOOL v24 = "-[AVHapticServer(VibeSynthEngine) cancelPatternWithOptions:]";
    _os_log_impl(&dword_1A3931000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Cancelling vibe pattern on SSS client", buf, 0x1Cu);
  }

LABEL_8:
  ServerManager::entryForID((ServerManager *)&v17, (uint64_t)self->_manager, self->_SSSClientID);
  uint64_t v7 = v17;
  if (!v17)
  {
    int v11 = -4810;
    goto LABEL_21;
  }
  manager = self->_manager;
  int v9 = v18;
  if (v18) {
    atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (!kHSRVScope)
  {
    uint64_t v10 = MEMORY[0x1E4F14500];
    id v12 = MEMORY[0x1E4F14500];
    goto LABEL_16;
  }
  uint64_t v10 = *(id *)kHSRVScope;
  if (v10)
  {
LABEL_16:
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "ServerManager.mm";
      __int16 v21 = 1024;
      int v22 = 1401;
      __int16 v23 = 2080;
      BOOL v24 = "cancelAlertPattern";
      _os_log_impl(&dword_1A3931000, v10, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Cancelling System Sound pattern playback", buf, 0x1Cu);
    }
  }
  *(void *)buf = a3;
  *(_WORD *)&buf[8] = 0;
  BOOL v19 = 0;
  uint64_t Bool = CACFDictionary::GetBool((CACFDictionary *)buf, @"CancelAtLoopEnd", &v19);
  BOOL v19 = Bool;
  int v11 = (*(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)v7 + 80))(v7, manager[61], Bool);
  CACFDictionary::~CACFDictionary((CACFDictionary *)buf);
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
LABEL_21:
  if (kHSRVScope)
  {
    int v14 = *(id *)kHSRVScope;
    if (!v14) {
      goto LABEL_28;
    }
  }
  else
  {
    int v14 = MEMORY[0x1E4F14500];
    id v15 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
    __int16 v21 = 1024;
    int v22 = 1633;
    __int16 v23 = 2080;
    BOOL v24 = "-[AVHapticServer(VibeSynthEngine) cancelPatternWithOptions:]";
    _os_log_impl(&dword_1A3931000, v14, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Done cancelling vibe pattern", buf, 0x1Cu);
  }

LABEL_28:
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
  return v11;
}

- (int)playVibePattern:(void *)a3 gain:(float)a4 synchronizer:(SSPlayerSynchronizer *)a5 flags:(unsigned int)a6 atTime:(double)a7 completionHandler:(id)a8
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v48 = a8;
  ServerManager::entryForID((ServerManager *)&v61, (uint64_t)self->_manager, self->_SSSClientID);
  uint64_t v12 = v61;
  if (!v61)
  {
    int started = -4810;
    goto LABEL_124;
  }
  if (kHSRVScope)
  {
    int v13 = *(id *)kHSRVScope;
    if (!v13) {
      goto LABEL_10;
    }
  }
  else
  {
    int v13 = MEMORY[0x1E4F14500];
    id v15 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t SSSClientID = self->_SSSClientID;
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1573;
    __int16 v67 = 2080;
    v68 = "-[AVHapticServer(VibeSynthEngine) playVibePattern:gain:synchronizer:flags:atTime:completionHandler:]";
    __int16 v69 = 1024;
    *(_DWORD *)char v70 = SSSClientID;
    _os_log_impl(&dword_1A3931000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Request to play SSS pattern on client 0x%x", buf, 0x22u);
  }

LABEL_10:
  manager = self->_manager;
  uint64_t v18 = v62;
  v60[0] = v12;
  v60[1] = v62;
  if (v62) {
    atomic_fetch_add_explicit(&v62->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  int started = ServerManager::startEntry((uint64_t)manager, v60, (v8 >> 1) & 1, (v8 >> 2) & 1);
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
  if (!started || started == 1634497134)
  {
    uint64_t v58 = v12;
    uint64_t v59 = v18;
    if (v18) {
      atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(AVHapticServer *)self incrementRunningCountForAudio:0 haptics:1 entry:&v58];
    if (v59) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v59);
    }
    if (kHSRVScope)
    {
      __int16 v20 = *(id *)kHSRVScope;
      if (!v20) {
        goto LABEL_34;
      }
    }
    else
    {
      __int16 v20 = MEMORY[0x1E4F14500];
      id v22 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1582;
      __int16 v67 = 2080;
      v68 = "-[AVHapticServer(VibeSynthEngine) playVibePattern:gain:synchronizer:flags:atTime:completionHandler:]";
      _os_log_impl(&dword_1A3931000, v20, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Starting SSS pattern playback", buf, 0x1Cu);
    }

LABEL_34:
    objc_initWeak(&location, self);
    id v47 = self->_manager;
    if (v18) {
      atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3321888768;
    aBlock[2] = __100__AVHapticServer_VibeSynthEngine__playVibePattern_gain_synchronizer_flags_atTime_completionHandler___block_invoke;
    aBlock[3] = &unk_1EF728CC0;
    id v46 = v55;
    objc_copyWeak(v55, &location);
    v55[1] = (id)v12;
    id v56 = v18;
    if (v18) {
      atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    id v54 = v48;
    __int16 v65 = 0;
    v64[0] = &unk_1EF728E30;
    v64[1] = _Block_copy(aBlock);
    __int16 v65 = v64;
    if (kHSEQScope)
    {
      __int16 v23 = *(id *)kHSEQScope;
      if (!v23) {
        goto LABEL_45;
      }
    }
    else
    {
      __int16 v23 = MEMORY[0x1E4F14500];
      id v24 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "ServerManager.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1341;
      __int16 v67 = 2080;
      v68 = "playAlertPattern";
      _os_log_impl(&dword_1A3931000, v23, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Request for System Sound pattern playback", buf, 0x1Cu);
    }

LABEL_45:
    CFTypeID v25 = CFGetTypeID(a3);
    if (v25 == CFDictionaryGetTypeID())
    {
      uint64_t v26 = a3;
      if (v18) {
        atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      *(void *)buf = -1;
      int started = (*(uint64_t (**)(uint64_t, void *, unsigned char *))(*(void *)v12 + 56))(v12, v26, buf);
      uint64_t v27 = *(void *)buf;
      if (v18) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v18);
      }
    }
    else
    {
      if (v18) {
        atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      *(void *)buf = -1;
      int started = ClientEntry::loadAndAddSequence((ClientEntry *)v12, (NSArray *)a3, (unint64_t *)buf, (double *)v74, v72);
      uint64_t v27 = *(void *)buf;
      if (v18) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v18);
      }
    }
    if (started) {
      goto LABEL_99;
    }
    std::shared_ptr<PowerUsageWatchdog::Impl>::shared_ptr[abi:ne180100]<PowerUsageWatchdog::Impl,void>(buf, *(void *)(v12 + 8), *(std::__shared_weak_count **)(v12 + 16));
    uint64_t v28 = *(void *)buf;
    uint64_t v29 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8])
    {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf[8] + 16), 1uLL, memory_order_relaxed);
      std::__shared_weak_count::__release_shared[abi:ne180100](v29);
    }
    v63[0] = v12;
    v63[1] = (uint64_t)v18;
    if (v18) {
      atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)buf, (uint64_t)v64);
    *(void *)&v70[2] = v27;
    *(void *)&long long v71 = v28;
    *((void *)&v71 + 1) = v29;
    if (v29) {
      atomic_fetch_add_explicit(&v29->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    }
    unsigned int v73 = 0;
    uint64_t v30 = operator new(0x40uLL);
    void *v30 = &unk_1EF7301C0;
    std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)(v30 + 1), (uint64_t)buf);
    v30[5] = *(void *)&v70[2];
    *((_OWORD *)v30 + 3) = v71;
    long long v71 = 0uLL;
    unsigned int v73 = v30;
    int started = ServerManager::prepareSequence((uint64_t)v47, v63, v27, (uint64_t)v72);
    std::__function::__value_func<void ()(unsigned long)>::~__value_func[abi:ne180100](v72);
    if (*((void *)&v71 + 1)) {
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v71 + 1));
    }
    std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](buf);
    if (v18)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v18);
      BOOL v31 = started == 0;
      if (started) {
        goto LABEL_95;
      }
      atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    else
    {
      BOOL v31 = started == 0;
      if (started) {
        goto LABEL_95;
      }
    }
    if (kHSEQScope)
    {
      if (*(unsigned char *)(kHSEQScope + 8))
      {
        id v35 = *(id *)kHSEQScope;
        if (v35)
        {
          log = v35;
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v74 = 136316162;
            __int16 v75 = "ServerManager.mm";
            __int16 v76 = 1024;
            int v77 = 868;
            __int16 v78 = 2080;
            __int16 v79 = "startAlertSequence";
            __int16 v80 = 1024;
            *(_DWORD *)v81 = v27;
            *(_WORD *)&v81[4] = 2048;
            *(void *)&v81[6] = a5;
            _os_log_impl(&dword_1A3931000, log, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Asynchronous call to play sequence %u with synchronizer %p", v74, 0x2Cu);
          }
        }
      }
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, SSPlayerSynchronizer *))(*(void *)v12 + 72))(v12, v27, v8, a5);
    if (v18) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v18);
    }
    if (kHSEQScope)
    {
      id v36 = *(id *)kHSEQScope;
      if (!v36)
      {
LABEL_94:
        v47[61] = v27;
LABEL_95:
        if (v29) {
          std::__shared_weak_count::__release_weak(v29);
        }
        if (v31)
        {
          int started = 0;
          goto LABEL_107;
        }
LABEL_99:
        if (kHSEQScope)
        {
          __int16 v38 = *(id *)kHSEQScope;
          if (!v38)
          {
LABEL_106:
            v47[61] = -1;
LABEL_107:
            std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v64);
            if (v18) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v18);
            }
            if (!started) {
              goto LABEL_121;
            }
            if (kHSRVScope)
            {
              uint64_t v40 = *(id *)kHSRVScope;
              if (!v40)
              {
LABEL_117:
                uint64_t v51 = v12;
                id v52 = v18;
                if (v18) {
                  atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
                }
                -[AVHapticServer doStopRunning:audio:haptics:](self, "doStopRunning:audio:haptics:", &v51, 0, 1, log, v55);
                if (v52) {
                  std::__shared_weak_count::__release_shared[abi:ne180100](v52);
                }
LABEL_121:

                if (v56) {
                  std::__shared_weak_count::__release_shared[abi:ne180100](v56);
                }
                objc_destroyWeak(v46);
                objc_destroyWeak(&location);
                goto LABEL_124;
              }
            }
            else
            {
              uint64_t v40 = MEMORY[0x1E4F14500];
              id v41 = MEMORY[0x1E4F14500];
            }
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
              *(_WORD *)&unsigned char buf[12] = 1024;
              *(_DWORD *)&buf[14] = 1598;
              __int16 v67 = 2080;
              v68 = "-[AVHapticServer(VibeSynthEngine) playVibePattern:gain:synchronizer:flags:atTime:completionHandler:]";
              _os_log_impl(&dword_1A3931000, v40, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Failed to play SSS pattern.  calling doStopRunning (we are on the ACQ).", buf, 0x1Cu);
            }

            goto LABEL_117;
          }
        }
        else
        {
          __int16 v38 = MEMORY[0x1E4F14500];
          id v39 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v74 = 136315906;
          __int16 v75 = "ServerManager.mm";
          __int16 v76 = 1024;
          int v77 = 1387;
          __int16 v78 = 2080;
          __int16 v79 = "playAlertPattern";
          __int16 v80 = 1024;
          *(_DWORD *)v81 = started;
          _os_log_impl(&dword_1A3931000, v38, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR %u: System Sound pattern load failed - clearing mLegacyPatternSeqID", v74, 0x22u);
        }

        goto LABEL_106;
      }
    }
    else
    {
      id v36 = MEMORY[0x1E4F14500];
      id v37 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v74 = 136315906;
      __int16 v75 = "ServerManager.mm";
      __int16 v76 = 1024;
      int v77 = 1382;
      __int16 v78 = 2080;
      __int16 v79 = "playAlertPattern";
      __int16 v80 = 2048;
      *(void *)v81 = v27;
      _os_log_impl(&dword_1A3931000, v36, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Setting mLegacyPatternSeqID to %lu", v74, 0x26u);
    }

    goto LABEL_94;
  }
  if (started != 1651864441)
  {
    if (kHSRVScope)
    {
      __int16 v21 = *(id *)kHSRVScope;
      if (!v21)
      {
LABEL_75:
        objc_initWeak((id *)buf, self);
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __100__AVHapticServer_VibeSynthEngine__playVibePattern_gain_synchronizer_flags_atTime_completionHandler___block_invoke_316;
        v49[3] = &unk_1E5B14848;
        objc_copyWeak(&v50, (id *)buf);
        if (AudioControlQueue(void)::once != -1) {
          dispatch_once(&AudioControlQueue(void)::once, &__block_literal_global_8);
        }
        id v34 = (id)AudioControlQueue(void)::gAudioControlQueue;
        AT::DispatchBlock(v34, v49, 1, (uint64_t)"-[AVHapticServer(VibeSynthEngine) playVibePattern:gain:synchronizer:flags:atTime:completionHandler:]", (uint64_t)"AVHapticServer.mm", 1611);

        objc_destroyWeak(&v50);
        objc_destroyWeak((id *)buf);
        goto LABEL_124;
      }
    }
    else
    {
      __int16 v21 = MEMORY[0x1E4F14500];
      id v33 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1607;
      __int16 v67 = 2080;
      v68 = "-[AVHapticServer(VibeSynthEngine) playVibePattern:gain:synchronizer:flags:atTime:completionHandler:]";
      __int16 v69 = 1024;
      *(_DWORD *)char v70 = started;
      _os_log_impl(&dword_1A3931000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Call to start SSS haptic returned status %d", buf, 0x22u);
    }

    goto LABEL_75;
  }
  int started = 1651864441;
  if (kHSRVScope)
  {
    BOOL v19 = *(id *)kHSRVScope;
    if (!v19) {
      goto LABEL_124;
    }
  }
  else
  {
    BOOL v19 = MEMORY[0x1E4F14500];
    id v32 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1604;
    __int16 v67 = 2080;
    v68 = "-[AVHapticServer(VibeSynthEngine) playVibePattern:gain:synchronizer:flags:atTime:completionHandler:]";
    _os_log_impl(&dword_1A3931000, v19, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: WARNING: Call to start SSS haptic returned BUSY", buf, 0x1Cu);
  }

LABEL_124:
  if (kHSRVScope)
  {
    int v42 = *(id *)kHSRVScope;
    if (!v42) {
      goto LABEL_131;
    }
  }
  else
  {
    int v42 = MEMORY[0x1E4F14500];
    id v43 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1618;
    __int16 v67 = 2080;
    v68 = "-[AVHapticServer(VibeSynthEngine) playVibePattern:gain:synchronizer:flags:atTime:completionHandler:]";
    __int16 v69 = 1024;
    *(_DWORD *)char v70 = started;
    _os_log_impl(&dword_1A3931000, v42, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Finished request to play SSS pattern: result %d", buf, 0x22u);
  }

LABEL_131:
  if (v62) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v62);
  }

  return started;
}

void __100__AVHapticServer_VibeSynthEngine__playVibePattern_gain_synchronizer_flags_atTime_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (kHSRVScope)
  {
    int v2 = *(id *)kHSRVScope;
    if (!v2) {
      goto LABEL_8;
    }
  }
  else
  {
    int v2 = MEMORY[0x1E4F14500];
    id v3 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    int v11 = "AVHapticServer.mm";
    __int16 v12 = 1024;
    int v13 = 1585;
    __int16 v14 = 2080;
    id v15 = "-[AVHapticServer(VibeSynthEngine) playVibePattern:gain:synchronizer:flags:atTime:completionHandler:]_block_invoke";
    _os_log_impl(&dword_1A3931000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: SSS pattern completion callback: Calling doStopRunning and client completion handler ASYNCH on ACQ", buf, 0x1Cu);
  }

LABEL_8:
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3321888768;
  v6[2] = __100__AVHapticServer_VibeSynthEngine__playVibePattern_gain_synchronizer_flags_atTime_completionHandler___block_invoke_313;
  v6[3] = &unk_1EF728CC0;
  objc_copyWeak(v8, (id *)(a1 + 40));
  int v4 = *(std::__shared_weak_count **)(a1 + 56);
  v8[1] = *(id *)(a1 + 48);
  int v9 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v7 = *(id *)(a1 + 32);
  if (AudioControlQueue(void)::once != -1) {
    dispatch_once(&AudioControlQueue(void)::once, &__block_literal_global_8);
  }
  id v5 = (id)AudioControlQueue(void)::gAudioControlQueue;
  AT::DispatchBlock(v5, v6, 1, (uint64_t)"-[AVHapticServer(VibeSynthEngine) playVibePattern:gain:synchronizer:flags:atTime:completionHandler:]_block_invoke", (uint64_t)"AVHapticServer.mm", 1594);

  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  objc_destroyWeak(v8);
}

void __100__AVHapticServer_VibeSynthEngine__playVibePattern_gain_synchronizer_flags_atTime_completionHandler___block_invoke_316(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained checkRunningCountAndStopSynth];
}

void __100__AVHapticServer_VibeSynthEngine__playVibePattern_gain_synchronizer_flags_atTime_completionHandler___block_invoke_313(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  int v4 = *(std::__shared_weak_count **)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 48);
  __int16 v12 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [WeakRetained doStopRunning:&v11 audio:0 haptics:1];
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }

  if (kHSRVScope)
  {
    id v5 = *(id *)kHSRVScope;
    if (!v5) {
      goto LABEL_12;
    }
  }
  else
  {
    id v5 = (id)MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  id v7 = v5;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = _Block_copy(*(const void **)(a1 + 32));
    *(_DWORD *)buf = 136315906;
    __int16 v14 = "AVHapticServer.mm";
    __int16 v15 = 1024;
    int v16 = 1591;
    __int16 v17 = 2080;
    uint64_t v18 = "-[AVHapticServer(VibeSynthEngine) playVibePattern:gain:synchronizer:flags:atTime:completionHandler:]_block_invoke";
    __int16 v19 = 2048;
    __int16 v20 = v8;
    _os_log_impl(&dword_1A3931000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d %s: SSS pattern completion callback: Calling external client's completion handler block %p", buf, 0x26u);
  }
LABEL_12:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
  if (kHSRVScope)
  {
    if (*(unsigned char *)(kHSRVScope + 8))
    {
      int v9 = *(id *)kHSRVScope;
      if (v9)
      {
        uint64_t v10 = v9;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          __int16 v14 = "AVHapticServer.mm";
          __int16 v15 = 1024;
          int v16 = 1593;
          __int16 v17 = 2080;
          uint64_t v18 = "-[AVHapticServer(VibeSynthEngine) playVibePattern:gain:synchronizer:flags:atTime:completionHandler:]_block_invoke";
          _os_log_impl(&dword_1A3931000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: SSS pattern completion callback: Returned from external clients completion handler", buf, 0x1Cu);
        }
      }
    }
  }
}

- (void)checkRunningCountAndStopSynth
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  audioRunningint Count = self->_audioRunningCount;
  unint64_t hapticsRunningCount = self->_hapticsRunningCount;
  if (audioRunningCount) {
    BOOL v4 = hapticsRunningCount == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (!(audioRunningCount | hapticsRunningCount))
    {
      if (kHSRVScope)
      {
        id v6 = *(id *)kHSRVScope;
        if (!v6)
        {
LABEL_17:
          ServerManager::stopSynthRunning((ServerManager *)self->_manager, 1, 1, 9999999);
LABEL_25:
          uint64_t v11 = (HapticMetrics *)CADeprecated::TSingleton<HapticMetrics>::instance();
          HapticMetrics::markEngineOff(v11, 0);
          return;
        }
      }
      else
      {
        id v6 = MEMORY[0x1E4F14500];
        id v8 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315650;
        int v13 = "AVHapticServer.mm";
        __int16 v14 = 1024;
        int v15 = 1550;
        __int16 v16 = 2080;
        __int16 v17 = "-[AVHapticServer(VibeSynthEngine) checkRunningCountAndStopSynth]";
        _os_log_impl(&dword_1A3931000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: audio and haptics running counts at zero and stopping synth", (uint8_t *)&v12, 0x1Cu);
      }

      goto LABEL_17;
    }
    if (kHSRVScope)
    {
      id v7 = *(id *)kHSRVScope;
      if (!v7) {
        goto LABEL_24;
      }
    }
    else
    {
      id v7 = MEMORY[0x1E4F14500];
      id v9 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = "haptics running count";
      int v12 = 136315906;
      int v13 = "AVHapticServer.mm";
      __int16 v14 = 1024;
      int v15 = 1554;
      __int16 v17 = "-[AVHapticServer(VibeSynthEngine) checkRunningCountAndStopSynth]";
      __int16 v16 = 2080;
      if (!audioRunningCount) {
        uint64_t v10 = "audio running count";
      }
      __int16 v18 = 2080;
      __int16 v19 = v10;
      _os_log_impl(&dword_1A3931000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: %s at zero, stopping synth", (uint8_t *)&v12, 0x26u);
    }

LABEL_24:
    ServerManager::stopSynthRunning((ServerManager *)self->_manager, audioRunningCount == 0, hapticsRunningCount == 0, 9999999);
    if (hapticsRunningCount) {
      return;
    }
    goto LABEL_25;
  }
}

- (int)stopPrewarm
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (kHSRVScope)
  {
    id v3 = *(id *)kHSRVScope;
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    id v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v19 = "AVHapticServer.mm";
    __int16 v20 = 1024;
    int v21 = 1525;
    __int16 v22 = 2080;
    __int16 v23 = "-[AVHapticServer(VibeSynthEngine) stopPrewarm]";
    _os_log_impl(&dword_1A3931000, v3, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Stopping prewarm on SSS client", buf, 0x1Cu);
  }

LABEL_8:
  ServerManager::entryForID((ServerManager *)&v16, (uint64_t)self->_manager, self->_SSSClientID);
  uint64_t v5 = v16;
  if (!v16)
  {
    LODWORD(v7) = -4810;
    goto LABEL_33;
  }
  if (*(unsigned char *)(v16 + 116))
  {
    if (kHSRVScope)
    {
      id v6 = *(id *)kHSRVScope;
      if (!v6)
      {
LABEL_21:
        manager = (ServerManager *)self->_manager;
        uint64_t v10 = v17;
        v15[0] = v5;
        v15[1] = (uint64_t)v17;
        if (v17) {
          atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        ServerManager::stopPrewarmEntry(manager, v15);
        if (v10)
        {
          std::__shared_weak_count::__release_shared[abi:ne180100](v10);
          uint64_t v13 = v5;
          __int16 v14 = v10;
          atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        else
        {
          uint64_t v13 = v5;
          __int16 v14 = 0;
        }
        [(AVHapticServer *)self decrementPrewarmCountAndStopAudio:0 stopHaptics:1 entry:&v13];
        if (v14) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v14);
        }
LABEL_32:
        LODWORD(v7) = 0;
        goto LABEL_33;
      }
    }
    else
    {
      id v6 = MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v19 = "AVHapticServer.mm";
      __int16 v20 = 1024;
      int v21 = 1530;
      __int16 v22 = 2080;
      __int16 v23 = "-[AVHapticServer(VibeSynthEngine) stopPrewarm]";
      _os_log_impl(&dword_1A3931000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: SSS client was prewarmed", buf, 0x1Cu);
    }

    goto LABEL_21;
  }
  if (!kHSRVScope)
  {
    id v7 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
    goto LABEL_29;
  }
  id v7 = *(id *)kHSRVScope;
  if (v7)
  {
LABEL_29:
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v19 = "AVHapticServer.mm";
      __int16 v20 = 1024;
      int v21 = 1535;
      __int16 v22 = 2080;
      __int16 v23 = "-[AVHapticServer(VibeSynthEngine) stopPrewarm]";
      _os_log_impl(&dword_1A3931000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: SSS client was not prewarmed -- noop", buf, 0x1Cu);
    }

    goto LABEL_32;
  }
LABEL_33:
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  return (int)v7;
}

- (int)startPrewarm
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (kHSRVScope)
  {
    id v3 = *(id *)kHSRVScope;
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    id v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1511;
    __int16 v11 = 2080;
    int v12 = "-[AVHapticServer(VibeSynthEngine) startPrewarm]";
    _os_log_impl(&dword_1A3931000, v3, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Starting prewarm on SSS client", buf, 0x1Cu);
  }

LABEL_8:
  ServerManager::entryForID((ServerManager *)buf, (uint64_t)self->_manager, self->_SSSClientID);
  if (!*(void *)buf)
  {
    int v6 = -4810;
    uint64_t v5 = *(std::__shared_weak_count **)&buf[8];
    if (!*(void *)&buf[8]) {
      return v6;
    }
    goto LABEL_14;
  }
  uint64_t v5 = *(std::__shared_weak_count **)&buf[8];
  uint64_t v8 = *(void *)buf;
  id v9 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8]) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 1uLL, memory_order_relaxed);
  }
  int v6 = [(AVHapticServer *)self doPrewarm:&v8];
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  if (v5) {
LABEL_14:
  }
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  return v6;
}

@end