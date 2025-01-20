@interface PHASESessionInterfaceImpl
- (BOOL)registerActivateAudioSessionBlock:(id)a3;
- (BOOL)registerFadeClientsInAudioSessionBlock:(id)a3;
- (BOOL)registerMuteInputClientsInAudioSessionBlock:(id)a3;
- (BOOL)setClientStateFromCallbackOnSession:(unsigned int)a3 clientToken:(void *)a4 modes:(unsigned int)a5 state:(unsigned int)a6 outDuckingInfo:(AudioSessionDuckingInfo *)a7;
- (BOOL)setClientStateOnSession:(unsigned int)a3 clientToken:(void *)a4 modes:(unsigned int)a5 state:(unsigned int)a6 outDuckingInfo:(AudioSessionDuckingInfo *)a7;
- (BOOL)setInputMuteStateFromCallbackOnSession:(unsigned int)a3 clientToken:(void *)a4 isMuted:(BOOL)a5;
- (BOOL)setInputMuteStateOnSession:(unsigned int)a3 clientToken:(void *)a4 isMuted:(BOOL)a5;
- (PHASESessionInterfaceImpl)init;
- (PHASESessionInterfaceImpl)initWithPhasePlatform:(id)a3;
- (id).cxx_construct;
- (id)getInputMuteStateForSession:(unsigned int)a3 fromCallback:(BOOL)a4;
- (id)lazyInitSessionVolumeInterface;
- (int)fadeClientsInSession:(unsigned int)a3 activating:(BOOL)a4 fadeLevel:(float)a5 fadeTime:(float)a6;
- (int)muteSessionInput:(unsigned int)a3 mute:(BOOL)a4 fadeTime:(float)a5;
- (uint64_t)getInputMuteStateForSession:fromCallback:;
- (void)activateSession:(unsigned int)a3 activate:(BOOL)a4;
- (void)dealloc;
- (void)getInputMuteStateForSession:fromCallback:;
- (void)refreshInputMuteOnAllSessions:(float)a3;
- (void)removeInputClientToken:(void *)a3 fromSessionID:(unsigned int)a4;
@end

@implementation PHASESessionInterfaceImpl

- (id).cxx_construct
{
  self->audioSessionInputClients.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->audioSessionInputClients.__table_.__p1_.__value_.__next_ = 0u;
  self->audioSessionInputClients.__table_.__p3_.__value_ = 1.0;
  return self;
}

- (void).cxx_destruct
{
  next = self->audioSessionInputClients.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      v4 = (void *)*next;
      std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::~__hash_table((uint64_t)(next + 3));
      operator delete(next);
      next = v4;
    }
    while (v4);
  }
  value = self->audioSessionInputClients.__table_.__bucket_list_.__ptr_.__value_;
  self->audioSessionInputClients.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value) {
    operator delete(value);
  }
  objc_storeStrong(&self->_sessionVolumeImpl, 0);
  objc_storeStrong(&self->_activateSessionBlock, 0);
  objc_storeStrong(&self->_fadeSessionOutputBlock, 0);
  objc_storeStrong(&self->_muteSessionInputBlock, 0);
  std::recursive_mutex::~recursive_mutex((std::recursive_mutex *)&self->_callbackMutex);

  objc_destroyWeak((id *)&self->_phasePlatform);
}

- (id)lazyInitSessionVolumeInterface
{
  return self->_sessionVolumeImpl;
}

- (int)muteSessionInput:(unsigned int)a3 mute:(BOOL)a4 fadeTime:(float)a5
{
  BOOL v6 = a4;
  uint64_t v7 = *(void *)&a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  p_callbackMutex = &self->_callbackMutex;
  std::recursive_mutex::lock((std::recursive_mutex *)&self->_callbackMutex);
  muteSessionInputBlock = (uint64_t (**)(id, void, BOOL, float))self->_muteSessionInputBlock;
  if (muteSessionInputBlock)
  {
    int v11 = muteSessionInputBlock[2](muteSessionInputBlock, v7, v6, a5);
  }
  else
  {
    v12 = gPhaseManagerLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315650;
      v15 = "ATPhasePlatform.mm";
      __int16 v16 = 1024;
      int v17 = 434;
      __int16 v18 = 2048;
      v19 = self;
      _os_log_impl(&dword_1A3931000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d sessioninterface@%p: no muteSessionInputBlock", (uint8_t *)&v14, 0x1Cu);
    }

    int v11 = 0;
  }
  std::recursive_mutex::unlock((std::recursive_mutex *)p_callbackMutex);
  return v11;
}

- (void)activateSession:(unsigned int)a3 activate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_callbackMutex = &self->_callbackMutex;
  std::recursive_mutex::lock((std::recursive_mutex *)&self->_callbackMutex);
  activateSessionBlock = (void (**)(id, void, BOOL))self->_activateSessionBlock;
  if (activateSessionBlock)
  {
    activateSessionBlock[2](activateSessionBlock, v5, v4);
  }
  else
  {
    v9 = gPhaseManagerLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 136315650;
      int v11 = "ATPhasePlatform.mm";
      __int16 v12 = 1024;
      int v13 = 421;
      __int16 v14 = 2048;
      v15 = self;
      _os_log_impl(&dword_1A3931000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d sessioninterface@%p: no activateAudioSessionBlock", (uint8_t *)&v10, 0x1Cu);
    }
  }
  std::recursive_mutex::unlock((std::recursive_mutex *)p_callbackMutex);
}

- (int)fadeClientsInSession:(unsigned int)a3 activating:(BOOL)a4 fadeLevel:(float)a5 fadeTime:(float)a6
{
  BOOL v8 = a4;
  uint64_t v9 = *(void *)&a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  p_callbackMutex = &self->_callbackMutex;
  std::recursive_mutex::lock((std::recursive_mutex *)&self->_callbackMutex);
  fadeSessionOutputBlock = (uint64_t (**)(id, void, BOOL, float, float))self->_fadeSessionOutputBlock;
  if (fadeSessionOutputBlock)
  {
    int v13 = fadeSessionOutputBlock[2](fadeSessionOutputBlock, v9, v8, a5, a6);
  }
  else
  {
    __int16 v14 = gPhaseManagerLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 136315650;
      int v17 = "ATPhasePlatform.mm";
      __int16 v18 = 1024;
      int v19 = 408;
      __int16 v20 = 2048;
      v21 = self;
      _os_log_impl(&dword_1A3931000, v14, OS_LOG_TYPE_DEBUG, "%25s:%-5d sessioninterface@%p: no fadeClientsInAudioSessionBlock", (uint8_t *)&v16, 0x1Cu);
    }

    int v13 = 0;
  }
  std::recursive_mutex::unlock((std::recursive_mutex *)p_callbackMutex);
  return v13;
}

- (BOOL)registerActivateAudioSessionBlock:(id)a3
{
  id v4 = a3;
  if (self->_activateSessionBlock != v4)
  {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->_callbackMutex);
    id activateSessionBlock = self->_activateSessionBlock;
    self->_id activateSessionBlock = 0;

    if (v4)
    {
      BOOL v6 = (void *)[v4 copy];
      id v7 = self->_activateSessionBlock;
      self->_id activateSessionBlock = v6;
    }
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->_callbackMutex);
  }

  return 1;
}

- (BOOL)registerFadeClientsInAudioSessionBlock:(id)a3
{
  id v4 = a3;
  if (self->_fadeSessionOutputBlock != v4)
  {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->_callbackMutex);
    id fadeSessionOutputBlock = self->_fadeSessionOutputBlock;
    self->_id fadeSessionOutputBlock = 0;

    if (v4)
    {
      BOOL v6 = (void *)[v4 copy];
      id v7 = self->_fadeSessionOutputBlock;
      self->_id fadeSessionOutputBlock = v6;
    }
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->_callbackMutex);
  }

  return 1;
}

- (BOOL)registerMuteInputClientsInAudioSessionBlock:(id)a3
{
  id v4 = a3;
  if (self->_muteSessionInputBlock != v4)
  {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->_callbackMutex);
    id muteSessionInputBlock = self->_muteSessionInputBlock;
    self->_id muteSessionInputBlock = 0;

    if (v4)
    {
      BOOL v6 = (void *)[v4 copy];
      id v7 = self->_muteSessionInputBlock;
      self->_id muteSessionInputBlock = v6;
    }
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->_callbackMutex);
  }

  return 1;
}

- (BOOL)setInputMuteStateFromCallbackOnSession:(unsigned int)a3 clientToken:(void *)a4 isMuted:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v7 = *(void *)&a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  {
    CASIsDarwinOS(void)::global = os_variant_is_darwinos();
  }
  if (CASIsDarwinOS(void)::global) {
    return 1;
  }
  int v10 = AudioSessionSetClientMuteState(v7, 1885888883, (uint64_t)a4, v5);
  if (!v10) {
    return 1;
  }
  int v11 = v10;
  __int16 v12 = gPhaseManagerLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    int v13 = 136316418;
    __int16 v14 = "ATPhasePlatform.mm";
    __int16 v15 = 1024;
    int v16 = 340;
    __int16 v17 = 2048;
    __int16 v18 = self;
    __int16 v19 = 2048;
    __int16 v20 = a4;
    __int16 v21 = 1024;
    BOOL v22 = v5;
    __int16 v23 = 1024;
    int v24 = v11;
    _os_log_impl(&dword_1A3931000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d sessioninterface@%p: error setting client@%p session mute state %u from callback, err = %d", (uint8_t *)&v13, 0x32u);
  }

  return 0;
}

- (BOOL)setInputMuteStateOnSession:(unsigned int)a3 clientToken:(void *)a4 isMuted:(BOOL)a5
{
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x2020000000;
  int v18 = 0;
  {
    CASIsDarwinOS(void)::global = os_variant_is_darwinos();
  }
  if (!CASIsDarwinOS(void)::global)
  {
    if (AudioControlQueue(void)::once != -1) {
      dispatch_once(&AudioControlQueue(void)::once, &__block_literal_global_8);
    }
    id v9 = (id)AudioControlQueue(void)::gAudioControlQueue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __76__PHASESessionInterfaceImpl_setInputMuteStateOnSession_clientToken_isMuted___block_invoke;
    v12[3] = &unk_1E5B14DF8;
    unsigned int v13 = a3;
    v12[5] = &v15;
    v12[6] = a4;
    BOOL v14 = a5;
    v12[4] = self;
    AT::DispatchBlock(v9, v12, 0, (uint64_t)"-[PHASESessionInterfaceImpl setInputMuteStateOnSession:clientToken:isMuted:]", (uint64_t)"ATPhasePlatform.mm", 325);
  }
  BOOL v10 = *((_DWORD *)v16 + 6) == 0;
  _Block_object_dispose(&v15, 8);
  return v10;
}

void __76__PHASESessionInterfaceImpl_setInputMuteStateOnSession_clientToken_isMuted___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = AudioSessionSetClientMuteState(*(unsigned int *)(a1 + 56), 1885888883, *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 60));
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    v2 = gPhaseManagerLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = *(void *)(a1 + 48);
      int v4 = *(unsigned __int8 *)(a1 + 60);
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      int v7 = 136316418;
      BOOL v8 = "ATPhasePlatform.mm";
      __int16 v9 = 1024;
      int v10 = 323;
      __int16 v11 = 2048;
      uint64_t v12 = v5;
      __int16 v13 = 2048;
      uint64_t v14 = v3;
      __int16 v15 = 1024;
      int v16 = v4;
      __int16 v17 = 1024;
      int v18 = v6;
      _os_log_impl(&dword_1A3931000, v2, OS_LOG_TYPE_ERROR, "%25s:%-5d sessioninterface@%p: error setting client@%p session mute state %u, err = %d", (uint8_t *)&v7, 0x32u);
    }
  }
}

- (id)getInputMuteStateForSession:(unsigned int)a3 fromCallback:(BOOL)a4
{
  v22[4] = *MEMORY[0x1E4F143B8];
  v22[0] = &unk_1EF729C98;
  v22[3] = v22;
  uint64_t v9 = 0;
  int v10 = (char *)&v9;
  uint64_t v11 = 0x3812000000;
  uint64_t v12 = __Block_byref_object_copy__4912;
  __int16 v13 = __Block_byref_object_dispose__4913;
  uint64_t v14 = 0;
  char v15 = 0;
  char v16 = 1;
  if (a4)
  {
    uint64_t v5 = std::function<caulk::expected<BOOL,int> ()>::operator()((uint64_t)v22, a3);
    int v17 = v5;
    char v18 = BYTE4(v5);
    caulk::expected<BOOL,int>::swap((char *)&v17, v10 + 48);
  }
  else
  {
    if (AudioControlQueue(void)::once != -1) {
      dispatch_once(&AudioControlQueue(void)::once, &__block_literal_global_8);
    }
    id v6 = (id)AudioControlQueue(void)::gAudioControlQueue;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3321888768;
    v19[2] = __70__PHASESessionInterfaceImpl_getInputMuteStateForSession_fromCallback___block_invoke;
    v19[3] = &unk_1EF729C58;
    v19[4] = &v9;
    std::__function::__value_func<caulk::expected<BOOL,int> ()>::__value_func[abi:ne180100]((uint64_t)v20, (uint64_t)v22);
    unsigned int v21 = a3;
    AT::DispatchBlock(v6, v19, 0, (uint64_t)"-[PHASESessionInterfaceImpl getInputMuteStateForSession:fromCallback:]", (uint64_t)"ATPhasePlatform.mm", 300);

    std::__function::__value_func<caulk::expected<BOOL,int> ()>::~__value_func[abi:ne180100](v20);
  }
  if (v10[52])
  {
    int v7 = [NSNumber numberWithBool:*(unsigned __int8 *)caulk::expected<BOOL,int>::value((uint64_t)(v10 + 48))];
  }
  else
  {
    int v7 = 0;
  }
  _Block_object_dispose(&v9, 8);
  std::__function::__value_func<caulk::expected<BOOL,int> ()>::~__value_func[abi:ne180100](v22);

  return v7;
}

char *__70__PHASESessionInterfaceImpl_getInputMuteStateForSession_fromCallback___block_invoke(uint64_t a1)
{
  uint64_t v2 = std::function<caulk::expected<BOOL,int> ()>::operator()(*(void *)(a1 + 64), *(_DWORD *)(a1 + 72));
  uint64_t v3 = (char *)(*(void *)(*(void *)(a1 + 32) + 8) + 48);
  char v6 = BYTE4(v2);
  int v5 = v2;
  return caulk::expected<BOOL,int>::swap((char *)&v5, v3);
}

- (uint64_t)getInputMuteStateForSession:fromCallback:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unsigned int v2 = *a2;
  AQMESession::AQMESession(&v12, *a2, 0);
  uint64_t v4 = AT::SessionFacade::global(v3);
  uint64_t v5 = (*(uint64_t (**)(uint64_t, AQMESession *))(*(void *)v4 + 64))(v4, &v12);
  int v6 = v5;
  uint64_t v13 = v5;
  uint64_t v7 = v5 & 0xFF00000000;
  BOOL v8 = gPhaseManagerLog();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (!v9) {
      goto LABEL_7;
    }
    caulk::expected<BOOL,int>::value((uint64_t)&v13);
    *(_DWORD *)buf = 136315906;
    char v15 = "ATPhasePlatform.mm";
    __int16 v16 = 1024;
    int v17 = 281;
    __int16 v18 = 1024;
    int v19 = v13;
    __int16 v20 = 1024;
    unsigned int v21 = v2;
    int v10 = "%25s:%-5d getInputMuteStateForSession mute=%d for session=0x%x";
  }
  else
  {
    if (!v9) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315906;
    char v15 = "ATPhasePlatform.mm";
    __int16 v16 = 1024;
    int v17 = 285;
    __int16 v18 = 1024;
    int v19 = v6;
    __int16 v20 = 1024;
    unsigned int v21 = v2;
    int v10 = "%25s:%-5d error %i getting mute value in getInputMuteStateForSession for session=0x%x";
  }
  _os_log_impl(&dword_1A3931000, v8, OS_LOG_TYPE_DEFAULT, v10, buf, 0x1Eu);
LABEL_7:

  std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v12.mDescription.var0);
  if (*((char *)&v12.mDescription.__r_.__value_.var0.__l + 23) < 0) {
    operator delete(v12.mDescription.__r_.__value_.var0.__l.__data_);
  }
  if (v12.mSubsessionRef.mCFObject) {
    CFRelease(v12.mSubsessionRef.mCFObject);
  }
  return v13;
}

- (void)getInputMuteStateForSession:fromCallback:
{
}

- (void)refreshInputMuteOnAllSessions:(float)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  {
    CASIsDarwinOS(void)::global = os_variant_is_darwinos();
  }
  if (!CASIsDarwinOS(void)::global)
  {
    for (i = self->audioSessionInputClients.__table_.__p1_.__value_.__next_; i; i = *(void **)i)
    {
      unsigned int v6 = *((_DWORD *)i + 4);
      memset(v18, 0, sizeof(v18));
      int v7 = *((_DWORD *)i + 14);
      unsigned int v17 = v6;
      int v19 = v7;
      std::__hash_table<std::__hash_value_type<unsigned long,std::shared_ptr<PowerUsageWatchdog::ClientDescription>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::shared_ptr<PowerUsageWatchdog::ClientDescription>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::shared_ptr<PowerUsageWatchdog::ClientDescription>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::shared_ptr<PowerUsageWatchdog::ClientDescription>>>>::__rehash<true>((uint64_t)v18, *((void *)i + 4));
      for (j = (void *)*((void *)i + 5); j; j = (void *)*j)
        std::__hash_table<void *,std::hash<void *>,std::equal_to<void *>,std::allocator<void *>>::__emplace_unique_key_args<void *,void * const&>((uint64_t)v18, j[2], j[2]);
      AQMESession::AQMESession(&v16, v17, 0);
      uint64_t v10 = AT::SessionFacade::global(v9);
      uint64_t v15 = (*(uint64_t (**)(uint64_t, AQMESession *))(*(void *)v10 + 64))(v10, &v16);
      if ((v15 & 0xFF00000000) != 0)
      {
        caulk::expected<BOOL,int>::value((uint64_t)&v15);
        int v11 = v15;
        AQMESession v12 = gPhaseManagerLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          unsigned int v21 = "ATPhasePlatform.mm";
          __int16 v22 = 1024;
          int v23 = 264;
          __int16 v24 = 2048;
          uint64_t v25 = self;
          __int16 v26 = 1024;
          int v27 = v11;
          __int16 v28 = 1024;
          unsigned int v29 = v17;
          _os_log_impl(&dword_1A3931000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d platform@%p: refreshAudioSessionInputMute mute=%d for session=0x%x", buf, 0x28u);
        }

        *(float *)&double v13 = a3;
        [(PHASESessionInterfaceImpl *)self muteSessionInput:v17 mute:v11 != 0 fadeTime:v13];
      }
      else
      {
        uint64_t v14 = gPhaseManagerLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          unsigned int v21 = "ATPhasePlatform.mm";
          __int16 v22 = 1024;
          int v23 = 267;
          __int16 v24 = 2048;
          uint64_t v25 = self;
          __int16 v26 = 1024;
          int v27 = v15;
          __int16 v28 = 1024;
          unsigned int v29 = v17;
          _os_log_impl(&dword_1A3931000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d platform@%p: error %i getting mute value in refreshAudioSessionInputMute for session=0x%x", buf, 0x28u);
        }
      }
      std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v16.mDescription.var0);
      if (*((char *)&v16.mDescription.__r_.__value_.var0.__l + 23) < 0) {
        operator delete(v16.mDescription.__r_.__value_.var0.__l.__data_);
      }
      if (v16.mSubsessionRef.mCFObject) {
        CFRelease(v16.mSubsessionRef.mCFObject);
      }
      std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::~__hash_table((uint64_t)v18);
    }
  }
}

- (BOOL)setClientStateFromCallbackOnSession:(unsigned int)a3 clientToken:(void *)a4 modes:(unsigned int)a5 state:(unsigned int)a6 outDuckingInfo:(AudioSessionDuckingInfo *)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  uint64_t v11 = *(void *)&a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  {
    CASIsDarwinOS(void)::global = os_variant_is_darwinos();
  }
  if (CASIsDarwinOS(void)::global)
  {
    if (a7)
    {
      *(void *)&a7->var1 = 0x3F80000000000000;
      a7->var0 = 0;
    }
    return 1;
  }
  int v13 = AudioSessionSetClientPlayState(v11, 1885888883, (uint64_t)a4, v9, v8, (uint64_t)a7, 0);
  if (!v13) {
    return 1;
  }
  int v14 = v13;
  uint64_t v15 = gPhaseManagerLog();
  AQMESession v16 = v15;
  if (v8)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136316418;
      int v19 = "ATPhasePlatform.mm";
      __int16 v20 = 1024;
      int v21 = 223;
      __int16 v22 = 2048;
      int v23 = self;
      __int16 v24 = 2048;
      uint64_t v25 = a4;
      __int16 v26 = 1024;
      int v27 = v8;
      __int16 v28 = 1024;
      int v29 = v14;
      _os_log_impl(&dword_1A3931000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d sessioninterface@%p: error setting client@%p session state %u from callback, err = %d", (uint8_t *)&v18, 0x32u);
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136316418;
    int v19 = "ATPhasePlatform.mm";
    __int16 v20 = 1024;
    int v21 = 219;
    __int16 v22 = 2048;
    int v23 = self;
    __int16 v24 = 2048;
    uint64_t v25 = a4;
    __int16 v26 = 1024;
    int v27 = 0;
    __int16 v28 = 1024;
    int v29 = v14;
    _os_log_impl(&dword_1A3931000, v16, OS_LOG_TYPE_DEFAULT, "%25s:%-5d sessioninterface@%p: error setting client@%p session state %u from callback, err = %d", (uint8_t *)&v18, 0x32u);
  }

  return 0;
}

- (void)removeInputClientToken:(void *)a3 fromSessionID:(unsigned int)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  p_audioSessionInputClients = &self->audioSessionInputClients;
  uint64_t v8 = std::__hash_table<std::__hash_value_type<unsigned int,std::unique_ptr<SSClientCompletionProcInfo>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::unique_ptr<SSClientCompletionProcInfo>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::unique_ptr<SSClientCompletionProcInfo>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::unique_ptr<SSClientCompletionProcInfo>>>>::find<unsigned int>(&self->audioSessionInputClients.__table_.__bucket_list_.__ptr_.__value_, a4);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = v8 + 3;
    uint64_t v11 = std::__hash_table<void *,std::hash<void *>,std::equal_to<void *>,std::allocator<void *>>::find<void *>(v8 + 3, (unint64_t)a3);
    if (v11)
    {
      std::__hash_table<void *,std::hash<void *>,std::equal_to<void *>,std::allocator<void *>>::erase(v10, v11);
      if (!v9[6])
      {
        AQMESession v12 = std::__hash_table<std::__hash_value_type<unsigned int,std::unique_ptr<SSClientCompletionProcInfo>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::unique_ptr<SSClientCompletionProcInfo>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::unique_ptr<SSClientCompletionProcInfo>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::unique_ptr<SSClientCompletionProcInfo>>>>::find<unsigned int>(p_audioSessionInputClients, a4);
        if (v12)
        {
          int v13 = v12;
          unint64_t value = self->audioSessionInputClients.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
          unint64_t v15 = v12[1];
          uint8x8_t v16 = (uint8x8_t)vcnt_s8((int8x8_t)value);
          v16.i16[0] = vaddlv_u8(v16);
          if (v16.u32[0] > 1uLL)
          {
            if (v15 >= value) {
              v15 %= value;
            }
          }
          else
          {
            v15 &= value - 1;
          }
          int v19 = (uint64_t *)p_audioSessionInputClients->__table_.__bucket_list_.__ptr_.__value_[v15];
          do
          {
            __int16 v20 = (PHASESessionInterfaceImpl *)v19;
            int v19 = (uint64_t *)*v19;
          }
          while (v19 != v12);
          if (v20 == (PHASESessionInterfaceImpl *)&self->audioSessionInputClients.__table_.__p1_) {
            goto LABEL_29;
          }
          unint64_t phasePlatform = (unint64_t)v20->_phasePlatform;
          if (v16.u32[0] > 1uLL)
          {
            if (phasePlatform >= value) {
              phasePlatform %= value;
            }
          }
          else
          {
            phasePlatform &= value - 1;
          }
          if (phasePlatform != v15)
          {
LABEL_29:
            if (!*v12) {
              goto LABEL_30;
            }
            unint64_t v22 = *(void *)(*v12 + 8);
            if (v16.u32[0] > 1uLL)
            {
              if (v22 >= value) {
                v22 %= value;
              }
            }
            else
            {
              v22 &= value - 1;
            }
            if (v22 != v15) {
LABEL_30:
            }
              p_audioSessionInputClients->__table_.__bucket_list_.__ptr_.__value_[v15] = 0;
          }
          int v23 = (objc_class *)*v12;
          if (*v12)
          {
            unint64_t v24 = *((void *)v23 + 1);
            if (v16.u32[0] > 1uLL)
            {
              if (v24 >= value) {
                v24 %= value;
              }
            }
            else
            {
              v24 &= value - 1;
            }
            if (v24 != v15)
            {
              p_audioSessionInputClients->__table_.__bucket_list_.__ptr_.__value_[v24] = v20;
              int v23 = (objc_class *)*v12;
            }
          }
          v20->super.isa = v23;
          uint64_t *v12 = 0;
          --self->audioSessionInputClients.__table_.__p2_.__value_;
          std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::~__hash_table((uint64_t)(v12 + 3));
          operator delete(v13);
        }
      }
    }
    else
    {
      int v18 = gPhaseManagerLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v25 = 136316162;
        __int16 v26 = "ATPhasePlatform.mm";
        __int16 v27 = 1024;
        int v28 = 160;
        __int16 v29 = 2048;
        uint64_t v30 = self;
        __int16 v31 = 2048;
        v32 = a3;
        __int16 v33 = 1024;
        unsigned int v34 = a4;
        _os_log_impl(&dword_1A3931000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d sessioninterface@%p: can't remove unknown client@%p from session 0x%x", (uint8_t *)&v25, 0x2Cu);
      }
    }
  }
  else
  {
    unsigned int v17 = gPhaseManagerLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v25 = 136316162;
      __int16 v26 = "ATPhasePlatform.mm";
      __int16 v27 = 1024;
      int v28 = 166;
      __int16 v29 = 2048;
      uint64_t v30 = self;
      __int16 v31 = 2048;
      v32 = a3;
      __int16 v33 = 1024;
      unsigned int v34 = a4;
      _os_log_impl(&dword_1A3931000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d sessioninterface@%p: can't remove client@%p from unknown session 0x%x", (uint8_t *)&v25, 0x2Cu);
    }
  }
}

- (BOOL)setClientStateOnSession:(unsigned int)a3 clientToken:(void *)a4 modes:(unsigned int)a5 state:(unsigned int)a6 outDuckingInfo:(AudioSessionDuckingInfo *)a7
{
  uint64_t v22 = 0;
  int v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 1;
  {
    CASIsDarwinOS(void)::global = os_variant_is_darwinos();
  }
  if (CASIsDarwinOS(void)::global)
  {
    if (a7)
    {
      *(void *)&a7->var1 = 0x3F80000000000000;
      a7->var0 = 0;
    }
  }
  else
  {
    objc_initWeak(&location, self);
    if (AudioControlQueue(void)::once != -1) {
      dispatch_once(&AudioControlQueue(void)::once, &__block_literal_global_8);
    }
    id v13 = (id)AudioControlQueue(void)::gAudioControlQueue;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __92__PHASESessionInterfaceImpl_setClientStateOnSession_clientToken_modes_state_outDuckingInfo___block_invoke;
    v16[3] = &unk_1E5B14DD0;
    objc_copyWeak(v17, &location);
    v16[4] = &v22;
    v17[1] = a4;
    v17[2] = a7;
    unsigned int v18 = a3;
    unsigned int v19 = a5;
    unsigned int v20 = a6;
    AT::DispatchBlock(v13, v16, 0, (uint64_t)"-[PHASESessionInterfaceImpl setClientStateOnSession:clientToken:modes:state:outDuckingInfo:]", (uint64_t)"ATPhasePlatform.mm", 129);

    objc_destroyWeak(v17);
    objc_destroyWeak(&location);
  }
  char v14 = *((unsigned char *)v23 + 24);
  _Block_object_dispose(&v22, 8);
  return v14;
}

void __92__PHASESessionInterfaceImpl_setClientStateOnSession_clientToken_modes_state_outDuckingInfo___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [WeakRetained setClientStateFromCallbackOnSession:*(unsigned int *)(a1 + 64) clientToken:*(void *)(a1 + 48) modes:*(unsigned int *)(a1 + 68) state:*(unsigned int *)(a1 + 72) outDuckingInfo:*(void *)(a1 + 56)];
    id WeakRetained = v3;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

- (void)dealloc
{
  id muteSessionInputBlock = self->_muteSessionInputBlock;
  self->_id muteSessionInputBlock = 0;

  id fadeSessionOutputBlock = self->_fadeSessionOutputBlock;
  self->_id fadeSessionOutputBlock = 0;

  id activateSessionBlock = self->_activateSessionBlock;
  self->_id activateSessionBlock = 0;

  id sessionVolumeImpl = self->_sessionVolumeImpl;
  self->_id sessionVolumeImpl = 0;

  objc_storeWeak((id *)&self->_phasePlatform, 0);
  v7.receiver = self;
  v7.super_class = (Class)PHASESessionInterfaceImpl;
  [(PHASESessionInterfaceImpl *)&v7 dealloc];
}

- (PHASESessionInterfaceImpl)initWithPhasePlatform:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PHASESessionInterfaceImpl;
  uint64_t v5 = [(PHASESessionInterfaceImpl *)&v11 init];
  unsigned int v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_phasePlatform, v4);
    id muteSessionInputBlock = v6->_muteSessionInputBlock;
    v6->_id muteSessionInputBlock = 0;

    id fadeSessionOutputBlock = v6->_fadeSessionOutputBlock;
    v6->_id fadeSessionOutputBlock = 0;

    id activateSessionBlock = v6->_activateSessionBlock;
    v6->_id activateSessionBlock = 0;
  }
  return v6;
}

- (PHASESessionInterfaceImpl)init
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = gPhaseManagerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    unsigned int v6 = "ATPhasePlatform.mm";
    __int16 v7 = 1024;
    int v8 = 80;
    _os_log_impl(&dword_1A3931000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: unsupported initializer for PHASESessionInterfaceImpl!", (uint8_t *)&v5, 0x12u);
  }

  return 0;
}

@end