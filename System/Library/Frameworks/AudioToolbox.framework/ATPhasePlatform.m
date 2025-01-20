@interface ATPhasePlatform
- (ATPhasePlatform)init;
- (BOOL)applyVolumeOnAllSessions;
- (BOOL)applyVolumeOnSession:(unsigned int)a3;
- (BOOL)applyVolumeOnVolumeCategory:(id)a3 mode:(id)a4 value:(float)a5;
- (BOOL)enableIO:(BOOL)a3 direction:(unsigned __int8)a4;
- (BOOL)registerIOBlock:(id)a3;
- (BOOL)registerOverloadNotification:(id)a3;
- (BOOL)registerRouteChangeNotification:(id)a3;
- (BOOL)running;
- (BOOL)start;
- (BOOL)stop;
- (OS_os_workgroup)workgroup;
- (PHASETapInterface)tapInterface;
- (double)sampleRate;
- (float)volumeScalarMappedToHWCurve:(float)a3;
- (id).cxx_construct;
- (id)lazyInitRoomCongruenceInterface;
- (id)lazyInitSessionInterface;
- (id)streamInfoForIndex:(unsigned int)a3 direction:(unsigned __int8)a4;
- (int)fadeClientsInSession:(unsigned int)a3 activating:(BOOL)a4 fadeLevel:(float)a5 fadeTime:(float)a6;
- (int)muteAudioSessionBidirectional:(unsigned int)a3 mute:(BOOL)a4 inputFadeTime:(float)a5 outputFadeTime:(float)a6;
- (int)muteSessionInput:(unsigned int)a3 mute:(BOOL)a4 fadeTime:(float)a5;
- (unsigned)bufferFrameSize;
- (unsigned)deviceLatencyInFramesForDirection:(unsigned __int8)a3;
- (unsigned)numberOfStreamsForDirection:(unsigned __int8)a3;
- (void)activateSession:(unsigned int)a3 activate:(BOOL)a4;
- (void)dealloc;
- (void)lazyInitServerManager;
- (void)refreshInputMuteOnAllSessions:(float)a3;
- (void)registerTapInterface:(id)a3;
@end

@implementation ATPhasePlatform

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_roomCongruenceInterface, 0);
  objc_storeStrong(&self->_tapInterface, 0);
  objc_storeStrong(&self->_sessionInterface, 0);

  std::unique_ptr<Phase::ServerManager>::reset[abi:ne180100]((uint64_t *)&self->_serverManager, 0);
}

- (PHASETapInterface)tapInterface
{
  return (PHASETapInterface *)self->_tapInterface;
}

- (OS_os_workgroup)workgroup
{
  v8[8] = *(caulk::mach::details **)MEMORY[0x1E4F143B8];
  v2 = [(ATPhasePlatform *)self lazyInitServerManager];
  v3 = *v2;
  if (*v2)
  {
    v4 = v2 + 3;
    os_unfair_recursive_lock_lock_with_options();
    uint64_t v5 = (*(uint64_t (**)(void *, void **))(*(void *)v3 + 400))(v3, v4);
    (*(void (**)(caulk::mach::details **__return_ptr))(*(void *)v5 + 88))(v8);
    v3 = caulk::mach::details::retain_os_object(v8[1], v6);
    caulk::mach::os_workgroup_managed::~os_workgroup_managed((caulk::mach::os_workgroup_managed *)v8);
    os_unfair_recursive_lock_unlock();
  }

  return (OS_os_workgroup *)v3;
}

- (float)volumeScalarMappedToHWCurve:(float)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  value = self->_serverManager.__ptr_.__value_;
  if (value)
  {
    uint64_t v5 = *(void *)value;
    if (*(void *)value)
    {
      os_unfair_recursive_lock_lock_with_options();
      uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v5 + 400))(v5, (uint64_t)value + 24);
      v7.n128_u32[0] = 1.0;
      if (a3 <= 1.0) {
        v7.n128_f32[0] = a3;
      }
      if (a3 < 0.0) {
        v7.n128_f32[0] = 0.0;
      }
      float v8 = (*(float (**)(uint64_t, __n128))(*(void *)v6 + 176))(v6, v7);
      os_unfair_recursive_lock_unlock();
      v9 = gPhaseManagerLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        int v11 = 136316162;
        v12 = "PhaseServerManager.mm";
        __int16 v13 = 1024;
        int v14 = 239;
        __int16 v15 = 2048;
        v16 = value;
        __int16 v17 = 2048;
        double v18 = a3;
        __int16 v19 = 2048;
        double v20 = v8;
        _os_log_impl(&dword_1A3931000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d servermgr@%p: volume %.3f, HW mapped volume %.3f", (uint8_t *)&v11, 0x30u);
      }

      return v8;
    }
  }
  return a3;
}

- (BOOL)applyVolumeOnAllSessions
{
  return 0;
}

- (BOOL)applyVolumeOnSession:(unsigned int)a3
{
  return 0;
}

- (BOOL)applyVolumeOnVolumeCategory:(id)a3 mode:(id)a4 value:(float)a5
{
  return 0;
}

- (int)muteAudioSessionBidirectional:(unsigned int)a3 mute:(BOOL)a4 inputFadeTime:(float)a5 outputFadeTime:(float)a6
{
  BOOL v7 = a4;
  uint64_t v8 = *(void *)&a3;
  int v10 = -[ATPhasePlatform muteSessionInput:mute:fadeTime:](self, "muteSessionInput:mute:fadeTime:");
  LODWORD(v11) = 1.0;
  if (v7) {
    *(float *)&double v11 = 0.0;
  }
  return [(ATPhasePlatform *)self fadeClientsInSession:v8 activating:0 fadeLevel:v11 fadeTime:COERCE_DOUBLE((unint64_t)LODWORD(a6))]+ v10;
}

- (int)muteSessionInput:(unsigned int)a3 mute:(BOOL)a4 fadeTime:(float)a5
{
  BOOL v6 = a4;
  uint64_t v7 = *(void *)&a3;
  v9 = [(ATPhasePlatform *)self lazyInitSessionInterface];

  if (!v9) {
    return 0;
  }
  int v10 = [(ATPhasePlatform *)self lazyInitSessionInterface];
  *(float *)&double v11 = a5;
  int v12 = [v10 muteSessionInput:v7 mute:v6 fadeTime:v11];

  return v12;
}

- (void)refreshInputMuteOnAllSessions:(float)a3
{
  uint64_t v5 = [(ATPhasePlatform *)self lazyInitSessionInterface];

  if (v5)
  {
    id v7 = [(ATPhasePlatform *)self lazyInitSessionInterface];
    *(float *)&double v6 = a3;
    [v7 refreshInputMuteOnAllSessions:v6];
  }
}

- (void)activateSession:(unsigned int)a3 activate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  id v7 = [(ATPhasePlatform *)self lazyInitSessionInterface];

  if (v7)
  {
    id v8 = [(ATPhasePlatform *)self lazyInitSessionInterface];
    [v8 activateSession:v5 activate:v4];
  }
}

- (int)fadeClientsInSession:(unsigned int)a3 activating:(BOOL)a4 fadeLevel:(float)a5 fadeTime:(float)a6
{
  BOOL v8 = a4;
  uint64_t v9 = *(void *)&a3;
  double v11 = [(ATPhasePlatform *)self lazyInitSessionInterface];

  if (!v11) {
    return 0;
  }
  int v12 = [(ATPhasePlatform *)self lazyInitSessionInterface];
  *(float *)&double v13 = a5;
  *(float *)&double v14 = a6;
  int v15 = [v12 fadeClientsInSession:v9 activating:v8 fadeLevel:v13 fadeTime:v14];

  return v15;
}

- (void)registerTapInterface:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id tapInterface = self->_tapInterface;
  if (tapInterface != v5)
  {
    if (v5 && tapInterface)
    {
      id v7 = gPhaseManagerLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v8 = 136315650;
        uint64_t v9 = "ATPhasePlatform.mm";
        __int16 v10 = 1024;
        int v11 = 737;
        __int16 v12 = 2048;
        double v13 = self;
        _os_log_impl(&dword_1A3931000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d platform@%p: error: cannot override tapsInterface", (uint8_t *)&v8, 0x1Cu);
      }
    }
    else
    {
      objc_storeStrong(&self->_tapInterface, a3);
    }
  }
}

- (BOOL)stop
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = gPhaseManagerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315650;
    double v6 = "ATPhasePlatform.mm";
    __int16 v7 = 1024;
    int v8 = 720;
    __int16 v9 = 2048;
    __int16 v10 = self;
    _os_log_impl(&dword_1A3931000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d platform@%p: stopping IO", (uint8_t *)&v5, 0x1Cu);
  }

  Phase::ServerManager::stop((unint64_t **)[(ATPhasePlatform *)self lazyInitServerManager]);
  return 1;
}

- (BOOL)start
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = [(ATPhasePlatform *)self lazyInitServerManager];
  BOOL v4 = v3;
  int sessionInterface_high = HIDWORD(v3->_sessionInterface);
  if ((sessionInterface_high & 3) == 0)
  {
    int v7 = -66681;
    int v8 = gPhaseManagerLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      buf[0] = 136315906;
      *(void *)&buf[1] = "PhaseServerManager.mm";
      __int16 v29 = 1024;
      int v30 = 427;
      __int16 v31 = 2048;
      v32 = v4;
      __int16 v33 = 1024;
      int v34 = -66681;
      _os_log_impl(&dword_1A3931000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d servermgr@%p: both input and output are disabled, err = %d", (uint8_t *)buf, 0x22u);
    }
    goto LABEL_14;
  }
  if (!v3[19]._roomCongruenceInterface)
  {
    int v7 = -66681;
    int v8 = gPhaseManagerLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      buf[0] = 136315906;
      *(void *)&buf[1] = "PhaseServerManager.mm";
      __int16 v29 = 1024;
      int v30 = 434;
      __int16 v31 = 2048;
      v32 = v4;
      __int16 v33 = 1024;
      int v34 = -66681;
      _os_log_impl(&dword_1A3931000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d servermgr@%p: IOBlock is nil, err = %d", (uint8_t *)buf, 0x22u);
    }
    goto LABEL_14;
  }
  if (!v3->super.isa)
  {
    int v7 = -66681;
    int v8 = gPhaseManagerLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      buf[0] = 136315906;
      *(void *)&buf[1] = "PhaseServerManager.mm";
      __int16 v29 = 1024;
      int v30 = 440;
      __int16 v31 = 2048;
      v32 = v4;
      __int16 v33 = 1024;
      int v34 = -66681;
      _os_log_impl(&dword_1A3931000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d servermgr@%p: error initializing, err = %d", (uint8_t *)buf, 0x22u);
    }
LABEL_14:

    goto LABEL_26;
  }
  if ((HIDWORD(v3->_sessionInterface) & 3) == 3)
  {
    Phase::ServerManager::maxBufferSizeFrames((Phase::ServerManager *)v3);
    std::__optional_destruct_base<CA::AudioBuffers,false>::reset[abi:ne180100]((uint64_t)&v4[21]._serverManager);
    double v6 = (CA::AudioBuffers *)ExtendedAudioBufferList_Create();
    CA::AudioBuffers::AudioBuffers(&v4[21]._serverManager.__ptr_.__value_, v6);
    LOBYTE(v4[21]._sessionInterface) = 1;
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x2020000000;
    int v23 = 0;
    goto LABEL_16;
  }
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  int v23 = 0;
  if ((sessionInterface_high & 2) != 0)
  {
LABEL_16:
    (*((void (**)(void **__return_ptr))v4[10]._serverManager.__ptr_.__value_ + 8))(&v19);
    operator new();
  }
  if ((sessionInterface_high & 1) == 0) {
    goto LABEL_24;
  }
  if (AudioControlQueue(void)::once != -1) {
    dispatch_once(&AudioControlQueue(void)::once, &__block_literal_global_8);
  }
  id v9 = (id)AudioControlQueue(void)::gAudioControlQueue;
  __p[0] = (void *)MEMORY[0x1E4F143A8];
  __p[1] = (void *)3221225472;
  __p[2] = ___ZN5Phase13ServerManager5startEv_block_invoke_29;
  __p[3] = &unk_1E5B15D78;
  __p[4] = &v20;
  __p[5] = v4;
  AT::DispatchBlock(v9, __p, 0, (uint64_t)"start", (uint64_t)"PhaseServerManager.mm", 479);

  if (*((_DWORD *)v21 + 6))
  {
    Phase::ServerManager::stop((unint64_t **)v4);
    __int16 v10 = gPhaseManagerLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = *((_DWORD *)v21 + 6);
      v24[0] = 136315906;
      *(void *)&v24[1] = "PhaseServerManager.mm";
      LOWORD(v24[3]) = 1024;
      *(_DWORD *)((char *)&v24[3] + 2) = 484;
      HIWORD(v24[4]) = 2048;
      *(void *)&v24[5] = v4;
      __int16 v25 = 1024;
      int v26 = v11;
      _os_log_impl(&dword_1A3931000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d servermgr@%p: could not start output client, err = %d", (uint8_t *)v24, 0x22u);
    }

    int v7 = *((_DWORD *)v21 + 6);
  }
  else
  {
LABEL_24:
    int v7 = 0;
    LOBYTE(v4->_sessionInterface) = 1;
  }
  _Block_object_dispose(&v20, 8);
LABEL_26:
  __int16 v12 = gPhaseManagerLog();
  double v13 = v12;
  if (v7)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      buf[0] = 136315906;
      *(void *)&buf[1] = "ATPhasePlatform.mm";
      __int16 v29 = 1024;
      int v30 = 711;
      __int16 v31 = 2048;
      v32 = self;
      __int16 v33 = 1024;
      int v34 = v7;
      uint64_t v14 = "%25s:%-5d platform@%p: failed to start IO, err = %d";
      int v15 = v13;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      uint32_t v17 = 34;
LABEL_31:
      _os_log_impl(&dword_1A3931000, v15, v16, v14, (uint8_t *)buf, v17);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    buf[0] = 136315650;
    *(void *)&buf[1] = "ATPhasePlatform.mm";
    __int16 v29 = 1024;
    int v30 = 707;
    __int16 v31 = 2048;
    v32 = self;
    uint64_t v14 = "%25s:%-5d platform@%p: successfully started IO";
    int v15 = v13;
    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
    uint32_t v17 = 28;
    goto LABEL_31;
  }

  return v7 == 0;
}

- (BOOL)registerRouteChangeNotification:(id)a3
{
  id v4 = a3;
  int v5 = [(ATPhasePlatform *)self lazyInitServerManager];
  id v6 = v4;
  int v7 = (const void *)v5[100];
  if (v7)
  {
    _Block_release(v7);
    int v8 = (void *)v5[100];
    v5[100] = 0;
  }
  if (v6)
  {
    uint64_t v9 = _Block_copy(v6);
    __int16 v10 = (void *)v5[100];
    v5[100] = v9;
  }
  return 1;
}

- (BOOL)registerOverloadNotification:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    int v5 = gPhaseManagerLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315650;
      int v8 = "ATPhasePlatform.mm";
      __int16 v9 = 1024;
      int v10 = 691;
      __int16 v11 = 2048;
      __int16 v12 = self;
      _os_log_impl(&dword_1A3931000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d platform@%p: registering overload notification not supported yet!", (uint8_t *)&v7, 0x1Cu);
    }
  }
  return a3 == 0;
}

- (BOOL)registerIOBlock:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(ATPhasePlatform *)self lazyInitServerManager];
  id v6 = v4;
  int v7 = *((unsigned __int8 *)v5 + 115) | *((unsigned __int8 *)v5 + 499);
  BOOL v8 = v7 == 0;
  if (v7)
  {
    uint64_t v13 = gPhaseManagerLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = _Block_copy(v6);
      int v16 = 136315906;
      uint32_t v17 = "PhaseServerManager.mm";
      __int16 v18 = 1024;
      int v19 = 146;
      __int16 v20 = 2048;
      uint64_t v21 = v5;
      __int16 v22 = 2048;
      int v23 = v14;
      _os_log_impl(&dword_1A3931000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d servermgr@%p: cannot set the block@%p when IO is running!", (uint8_t *)&v16, 0x26u);
    }
    if (!v5[99])
    {
      _os_assert_log();
      _os_crash();
      __break(1u);
    }
  }
  else
  {
    __int16 v9 = (const void *)v5[99];
    if (v9)
    {
      _Block_release(v9);
      int v10 = (void *)v5[99];
      v5[99] = 0;
    }
    if (v6)
    {
      uint64_t v11 = _Block_copy(v6);
      __int16 v12 = (void *)v5[99];
      v5[99] = v11;
    }
  }

  return v8;
}

- (id)streamInfoForIndex:(unsigned int)a3 direction:(unsigned __int8)a4
{
  int v4 = a4;
  id v6 = Phase::ServerManager::ioFormat((void *)[(ATPhasePlatform *)self lazyInitServerManager], a4);
  uint64_t v7 = Phase::ServerManager::deviceLatencyInFrames((uint64_t *)[(ATPhasePlatform *)self lazyInitServerManager], v4);
  int64x2_t v57 = 0uLL;
  v58 = 0;
  __p = 0;
  v55 = 0;
  uint64_t v56 = 0;
  BOOL v8 = [(ATPhasePlatform *)self lazyInitServerManager];
  uint64_t v9 = *v8;
  if (*v8)
  {
    uint64_t v10 = (uint64_t)(v4 ? v8 + 51 : v8 + 3);
    os_unfair_recursive_lock_lock_with_options();
    uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v9 + 400))(v9, v10);
    uint64_t v12 = v4 ? 65 : 1;
    int v13 = (*(uint64_t (**)(uint64_t, uint64_t, void **))(*(void *)v11 + 280))(v11, v12, &__p);
    os_unfair_recursive_lock_unlock();
    if (v13)
    {
      if (__p != v55)
      {
        std::vector<unsigned int>::vector(&v53, 0xAAAAAAAAAAAAAAABLL * ((v55 - (unsigned char *)__p) >> 2));
        std::vector<unsigned int>::vector(&v52, 0xAAAAAAAAAAAAAAABLL * ((v55 - (unsigned char *)__p) >> 2));
        if (v55 != __p)
        {
          unint64_t v14 = (v55 - (unsigned char *)__p) / 12;
          std::vector<unsigned int>::pointer begin = v53.__begin_;
          std::vector<unsigned int>::pointer v16 = v52.__begin_;
          if (v14 <= 1) {
            unint64_t v14 = 1;
          }
          uint32_t v17 = (char *)__p + 4;
          do
          {
            *std::vector<unsigned int>::pointer begin = *((_DWORD *)v17 - 1);
            unsigned int v18 = v17[4];
            if (v17[4]) {
              unsigned int v18 = *(_DWORD *)v17;
            }
            *v16++ = v18;
            v17 += 12;
            ++begin;
            --v14;
          }
          while (v14);
        }
        applesauce::CF::TypeRefPair::TypeRefPair<char const*,std::vector<unsigned int> &>((applesauce::CF::TypeRef *)&v50, (char *)[@"port type" UTF8String], (int **)&v53);
        uint64_t v19 = v57.i64[1];
        if (v57.i64[1] >= (unint64_t)v58)
        {
          uint64_t v20 = (v57.i64[1] - v57.i64[0]) >> 4;
          unint64_t v21 = v20 + 1;
          if ((unint64_t)(v20 + 1) >> 60) {
            std::vector<void const*>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v22 = (uint64_t)&v58[-v57.i64[0]];
          if ((uint64_t)&v58[-v57.i64[0]] >> 3 > v21) {
            unint64_t v21 = v22 >> 3;
          }
          if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v23 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v23 = v21;
          }
          v62 = &v58;
          uint64_t v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>(v23);
          __int16 v25 = (CFTypeRef *)&v24[16 * v20];
          v61 = &v24[16 * v26];
          *__int16 v25 = v50;
          CFTypeRef v50 = 0;
          v25[1] = cf;
          CFTypeRef cf = 0;
          v27 = v25 + 2;
          v60.i64[1] = (uint64_t)(v25 + 2);
          v28 = (void *)v57.i64[1];
          __int16 v29 = (void *)v57.i64[0];
          if (v57.i64[1] == v57.i64[0])
          {
            int64x2_t v31 = vdupq_n_s64(v57.u64[1]);
          }
          else
          {
            do
            {
              int v30 = (const void *)*(v28 - 2);
              v28 -= 2;
              *(v25 - 2) = v30;
              v25 -= 2;
              void *v28 = 0;
              v25[1] = (CFTypeRef)v28[1];
              v28[1] = 0;
            }
            while (v28 != v29);
            int64x2_t v31 = v57;
            v27 = (void *)v60.i64[1];
          }
          v57.i64[0] = (uint64_t)v25;
          v57.i64[1] = (uint64_t)v27;
          int64x2_t v60 = v31;
          v32 = v58;
          v58 = v61;
          v61 = v32;
          v59 = (void **)v31.i64[0];
          std::__split_buffer<applesauce::CF::TypeRefPair>::~__split_buffer((uint64_t)&v59);
          v57.i64[1] = (uint64_t)v27;
          if (cf) {
            CFRelease(cf);
          }
          if (v50) {
            CFRelease(v50);
          }
        }
        else
        {
          *(void *)v57.i64[1] = v50;
          *(void *)(v19 + 8) = cf;
          v57.i64[1] = v19 + 16;
        }
        applesauce::CF::TypeRefPair::TypeRefPair<char const*,std::vector<unsigned int> &>((applesauce::CF::TypeRef *)&v50, (char *)objc_msgSend(@"port subtype", "UTF8String", v50), (int **)&v52);
        uint64_t v33 = v57.i64[1];
        if (v57.i64[1] >= (unint64_t)v58)
        {
          uint64_t v34 = (v57.i64[1] - v57.i64[0]) >> 4;
          unint64_t v35 = v34 + 1;
          if ((unint64_t)(v34 + 1) >> 60) {
            std::vector<void const*>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v36 = (uint64_t)&v58[-v57.i64[0]];
          if ((uint64_t)&v58[-v57.i64[0]] >> 3 > v35) {
            unint64_t v35 = v36 >> 3;
          }
          if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v37 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v37 = v35;
          }
          v62 = &v58;
          v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>(v37);
          v40 = (CFTypeRef *)&v38[16 * v34];
          CFTypeRef *v40 = v50;
          CFTypeRef v50 = 0;
          v40[1] = cf;
          CFTypeRef cf = 0;
          v41 = v40 + 2;
          v42 = (void *)v57.i64[1];
          v43 = (void *)v57.i64[0];
          if (v57.i64[1] == v57.i64[0])
          {
            int64x2_t v45 = vdupq_n_s64(v57.u64[1]);
          }
          else
          {
            do
            {
              v44 = (const void *)*(v42 - 2);
              v42 -= 2;
              *(v40 - 2) = v44;
              v40 -= 2;
              void *v42 = 0;
              v40[1] = (CFTypeRef)v42[1];
              v42[1] = 0;
            }
            while (v42 != v43);
            int64x2_t v45 = v57;
          }
          v57.i64[0] = (uint64_t)v40;
          v57.i64[1] = (uint64_t)v41;
          int64x2_t v60 = v45;
          v46 = v58;
          v58 = &v38[16 * v39];
          v61 = v46;
          v59 = (void **)v45.i64[0];
          std::__split_buffer<applesauce::CF::TypeRefPair>::~__split_buffer((uint64_t)&v59);
          v57.i64[1] = (uint64_t)v41;
          if (cf) {
            CFRelease(cf);
          }
          if (v50) {
            CFRelease(v50);
          }
        }
        else
        {
          *(void *)v57.i64[1] = v50;
          *(void *)(v33 + 8) = cf;
          v57.i64[1] = v33 + 16;
        }
        if (v52.__begin_)
        {
          v52.__end_ = v52.__begin_;
          operator delete(v52.__begin_);
        }
        if (v53.__begin_)
        {
          v53.__end_ = v53.__begin_;
          operator delete(v53.__begin_);
        }
      }
    }
  }
  CFDictionaryRef = (void **)applesauce::CF::details::make_CFDictionaryRef((void ***)&v57);
  v59 = CFDictionaryRef;
  v48 = [[PHASEStreamInfoImpl alloc] initWithFormat:v6 latencyInFrames:v7 streamDescription:CFDictionaryRef];
  CFRelease(CFDictionaryRef);
  if (__p)
  {
    v55 = __p;
    operator delete(__p);
  }
  v59 = (void **)&v57;
  std::vector<applesauce::CF::TypeRefPair>::__destroy_vector::operator()[abi:ne180100](&v59);

  return v48;
}

- (unsigned)numberOfStreamsForDirection:(unsigned __int8)a3
{
  return 1;
}

- (unsigned)deviceLatencyInFramesForDirection:(unsigned __int8)a3
{
  int v3 = a3;
  int v4 = [(ATPhasePlatform *)self lazyInitServerManager];

  return Phase::ServerManager::deviceLatencyInFrames(v4, v3);
}

- (BOOL)enableIO:(BOOL)a3 direction:(unsigned __int8)a4
{
  int v4 = a4;
  BOOL v5 = a3;
  id v6 = [(ATPhasePlatform *)self lazyInitServerManager];

  return Phase::ServerManager::enableIO((uint64_t)v6, v5, v4);
}

- (unsigned)bufferFrameSize
{
  v2 = [(ATPhasePlatform *)self lazyInitServerManager];

  return Phase::ServerManager::maxBufferSizeFrames(v2);
}

- (BOOL)running
{
  return *(unsigned char *)([(ATPhasePlatform *)self lazyInitServerManager] + 16);
}

- (double)sampleRate
{
  v2 = Phase::ServerManager::ioFormat((void *)[(ATPhasePlatform *)self lazyInitServerManager], 0);
  [v2 sampleRate];
  double v4 = v3;

  return v4;
}

- (id)lazyInitRoomCongruenceInterface
{
  id roomCongruenceInterface = self->_roomCongruenceInterface;
  if (roomCongruenceInterface
    || (double v4 = objc_opt_new(),
        id v5 = self->_roomCongruenceInterface,
        self->_id roomCongruenceInterface = v4,
        v5,
        (id roomCongruenceInterface = self->_roomCongruenceInterface) != 0))
  {
    return roomCongruenceInterface;
  }
  else
  {
    _os_assert_log();
    id result = (id)_os_crash();
    __break(1u);
  }
  return result;
}

- (id)lazyInitSessionInterface
{
  id sessionInterface = self->_sessionInterface;
  if (sessionInterface
    || (v4 = [[PHASESessionInterfaceImpl alloc] initWithPhasePlatform:self], id v5 = self->_sessionInterface, self->_sessionInterface = v4, v5, (sessionInterface = self->_sessionInterface) != 0))
  {
    return sessionInterface;
  }
  else
  {
    _os_assert_log();
    id result = (id)_os_crash();
    __break(1u);
  }
  return result;
}

- (void)lazyInitServerManager
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  id result = self->_serverManager.__ptr_.__value_;
  if (!result) {
    operator new();
  }
  return result;
}

- (void)dealloc
{
  std::unique_ptr<Phase::ServerManager>::reset[abi:ne180100]((uint64_t *)&self->_serverManager, 0);
  id sessionInterface = self->_sessionInterface;
  self->_id sessionInterface = 0;

  id tapInterface = self->_tapInterface;
  self->_id tapInterface = 0;

  id roomCongruenceInterface = self->_roomCongruenceInterface;
  self->_id roomCongruenceInterface = 0;

  v6.receiver = self;
  v6.super_class = (Class)ATPhasePlatform;
  [(ATPhasePlatform *)&v6 dealloc];
}

- (ATPhasePlatform)init
{
  v8.receiver = self;
  v8.super_class = (Class)ATPhasePlatform;
  id v2 = [(ATPhasePlatform *)&v8 init];
  uint64_t v3 = (ATPhasePlatform *)v2;
  if (v2)
  {
    std::unique_ptr<Phase::ServerManager>::reset[abi:ne180100]((uint64_t *)v2 + 1, 0);
    id sessionInterface = v3->_sessionInterface;
    v3->_id sessionInterface = 0;

    id tapInterface = v3->_tapInterface;
    v3->_id tapInterface = 0;

    id roomCongruenceInterface = v3->_roomCongruenceInterface;
    v3->_id roomCongruenceInterface = 0;
  }
  return v3;
}

@end