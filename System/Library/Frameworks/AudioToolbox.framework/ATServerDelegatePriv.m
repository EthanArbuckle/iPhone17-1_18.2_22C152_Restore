@interface ATServerDelegatePriv
- (ATServerDelegatePriv)init;
- (BOOL)dolbyDigitalEncoderAvailable;
- (BOOL)spatialAudioEnabled:(unsigned int)a3 mode:(id)a4;
- (BOOL)waitForConclaveLaunch;
- (id).cxx_construct;
- (id)spatialPreferencesForSession:(unsigned int)a3 contentType:(unsigned int)a4;
- (int)handleInterruptionWithID:(unsigned int)a3 clientPID:(int)a4 interruptionState:(unsigned int)a5 interruptionInfo:(id)a6;
- (int)muteSessionInput:(unsigned int)a3 clientPID:(int)a4 muted:(BOOL)a5;
- (int)refreshMicrophoneInjectionPermissions:(id *)a3;
- (int)refreshRecordPermissions:(id *)a3;
- (int)updateMicrophoneInjectionPreference:(int64_t)a3 forSession:(unsigned int)a4;
- (void)conclaveLaunched;
- (void)setTelephonyClientSessionID:(unsigned int)a3;
@end

@implementation ATServerDelegatePriv

- (id).cxx_construct
{
  *((void *)self + 1) = 850045863;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 1018212795;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((void *)self + 14) = 0;
  return self;
}

- (void).cxx_destruct
{
  std::condition_variable::~condition_variable((std::condition_variable *)((char *)self + 72));

  std::mutex::~mutex((std::mutex *)((char *)self + 8));
}

- (BOOL)waitForConclaveLaunch
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v4 = MGGetBoolAnswer();
  if (v4)
  {
    m = (std::unique_lock<std::mutex>::mutex_type *)((char *)self + 8);
    v16.__m_ = (std::unique_lock<std::mutex>::mutex_type *)((char *)self + 8);
    BOOL v2 = 1;
    v16.__owns_ = 1;
    std::mutex::lock((std::mutex *)((char *)self + 8));
    if (*((unsigned char *)self + 120))
    {
LABEL_20:
      std::mutex::unlock(m);
      return v2 || (v4 & 1) == 0;
    }
    v6 = MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "ATServerDelegatePriv.mm";
      __int16 v19 = 1024;
      int v20 = 225;
      _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%25s:%-5d waiting for conclave launch", buf, 0x12u);
    }

    v8 = (std::condition_variable *)((char *)self + 72);
    v9.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
    v10.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
    if (v10.__d_.__rep_)
    {
      if (v10.__d_.__rep_ < 1)
      {
        if ((unint64_t)v10.__d_.__rep_ >= 0xFFDF3B645A1CAC09) {
          v11.__d_.__rep_ = 1000 * v10.__d_.__rep_ + 10000000000;
        }
        else {
          v11.__d_.__rep_ = 0x80000002540BE400;
        }
      }
      else if ((unint64_t)v10.__d_.__rep_ < 0x20C49BA54ABD78)
      {
        v11.__d_.__rep_ = 1000 * v10.__d_.__rep_ + 10000000000;
      }
      else
      {
        v11.__d_.__rep_ = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    else
    {
      v11.__d_.__rep_ = 10000000000;
    }
    std::condition_variable::__do_timed_wait(v8, &v16, v11);
    v12.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
    BOOL v2 = v12.__d_.__rep_ - v9.__d_.__rep_ < 10000000000;
    if (v12.__d_.__rep_ - v9.__d_.__rep_ >= 10000000000)
    {
      v13 = MEMORY[0x1E4F14500];
      id v14 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "ATServerDelegatePriv.mm";
        __int16 v19 = 1024;
        int v20 = 229;
        _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d waiting for conclave launch timed out", buf, 0x12u);
      }
    }
    if (v16.__owns_)
    {
      m = v16.__m_;
      goto LABEL_20;
    }
  }
  return v2 || (v4 & 1) == 0;
}

- (void)conclaveLaunched
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (MGGetBoolAnswer())
  {
    v5.__m_ = (std::unique_lock<std::mutex>::mutex_type *)((char *)self + 8);
    v5.__owns_ = 1;
    std::mutex::lock((std::mutex *)((char *)self + 8));
    *((unsigned char *)self + 120) = 1;
    std::unique_lock<std::mutex>::unlock(&v5);
    std::condition_variable::notify_all((std::condition_variable *)((char *)self + 72));
    v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v7 = "ATServerDelegatePriv.mm";
      __int16 v8 = 1024;
      int v9 = 211;
      _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%25s:%-5d conclave launched", buf, 0x12u);
    }

    if (v5.__owns_) {
      std::mutex::unlock(v5.__m_);
    }
  }
}

- (id)spatialPreferencesForSession:(unsigned int)a3 contentType:(unsigned int)a4
{
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  int v17 = 0;
  uint64_t v16 = 0;
  v6 = (const AQMEIO_Binding *)AQIONodeManager::systemMixEngine((AQIONodeManager *)self);
  AQMESession::AQMESession(&v22, a3, 0);
  v18[0] = v6;
  v18[1] = (const AQMEIO_Binding *)0x300000000;
  char v19 = 0;
  char v21 = 0;
  SpatializationManager::GetPreferences(&v22, v18, a4, (unsigned __int8 *)&v14, 0, 0);
  if (v21 && v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
  std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v22.mDescription.var0);
  if (*((char *)&v22.mDescription.__r_.__value_.var0.__l + 23) < 0) {
    operator delete(v22.mDescription.__r_.__value_.var0.__l.__data_);
  }
  if (v22.mSubsessionRef.mCFObject) {
    CFRelease(v22.mSubsessionRef.mCFObject);
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F4EA10]);
  [v7 setPrefersHeadTrackedSpatialization:(_BYTE)v14 != 0];
  [v7 setPrefersLossyAudioSources:BYTE1(v14) != 0];
  [v7 setAlwaysSpatialize:BYTE2(v14) != 0];
  [v7 setMaximumSpatializableChannels:v15];
  __int16 v8 = objc_opt_new();
  uint64_t v9 = HIDWORD(v15);
  if (HIDWORD(v15))
  {
    uint64_t v10 = (unsigned int *)&v16;
    do
    {
      unsigned int v11 = *v10++;
      std::chrono::steady_clock::time_point v12 = [NSNumber numberWithUnsignedInt:v11];
      [v8 addObject:v12];

      --v9;
    }
    while (v9);
  }
  [v7 setSpatialAudioSources:v8];

  return v7;
}

- (BOOL)dolbyDigitalEncoderAvailable
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  UInt32 outPropertyDataSize = 0;
  int inSpecifier = 1633889587;
  uint64_t PropertyInfo = AudioFormatGetPropertyInfo(0x6176656Eu, 4u, &inSpecifier, &outPropertyDataSize);
  if (PropertyInfo)
  {
    OSStatus v3 = PropertyInfo;
    id v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v23 = "ATServerDelegatePriv.mm";
      __int16 v24 = 1024;
      int v25 = 138;
      __int16 v26 = 1024;
      OSStatus v27 = v3;
      _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d AudioFormatGetPropertyInfo kAudioFormatProperty_Encoders error %d", buf, 0x18u);
    }

    return 0;
  }
  UInt32 v7 = outPropertyDataSize;
  UInt32 v8 = outPropertyDataSize / 0xC;
  MEMORY[0x1F4188790](PropertyInfo);
  uint64_t v10 = (char *)&v19 - v9;
  OSStatus Property = AudioFormatGetProperty(0x6176656Eu, 4u, &inSpecifier, &outPropertyDataSize, (char *)&v19 - v9);
  if (Property)
  {
    OSStatus v12 = Property;
    v13 = MEMORY[0x1E4F14500];
    id v14 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v23 = "ATServerDelegatePriv.mm";
      __int16 v24 = 1024;
      int v25 = 149;
      __int16 v26 = 1024;
      OSStatus v27 = v12;
      _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d AudioFormatGetProperty kAudioFormatProperty_Encoders error %d", buf, 0x18u);
    }

    return 0;
  }
  if (v7 < 0xC) {
    return 0;
  }
  uint64_t v15 = 12 * v8 - 12;
  uint64_t v16 = (int *)(v10 + 4);
  do
  {
    int v17 = *v16;
    v16 += 3;
    BOOL result = v17 == 1633889587;
    BOOL v18 = v17 == 1633889587 || v15 == 0;
    v15 -= 12;
  }
  while (!v18);
  return result;
}

- (BOOL)spatialAudioEnabled:(unsigned int)a3 mode:(id)a4
{
  id v4 = *(AQIONodeManager **)&a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([v5 isEqualToString:*MEMORY[0x1E4F75AD8]]) {
    unsigned int v6 = 1836019574;
  }
  else {
    unsigned int v6 = 1936684398;
  }
  AudioGetSessionSpatialPreferencesForContentType(v4, v6, v14);
  uint64_t v7 = v15;
  if (v15)
  {
    char v8 = 0;
    uint64_t v9 = &v16;
    do
    {
      int v10 = *v9++;
      v8 |= v10 == 1835824233;
      --v7;
    }
    while (v7);
  }
  else
  {
    char v8 = 0;
  }
  unsigned int v11 = MEMORY[0x1E4F14500];
  id v12 = MEMORY[0x1E4F14500];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    BOOL v18 = "ATServerDelegatePriv.mm";
    __int16 v19 = 1024;
    int v20 = 123;
    __int16 v21 = 1024;
    int v22 = v8 & 1;
    __int16 v23 = 1024;
    int v24 = (int)v4;
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%25s:%-5d spatialEnabled is %d SessionID is 0x%x", buf, 0x1Eu);
  }

  return v8 & 1;
}

- (int)updateMicrophoneInjectionPreference:(int64_t)a3 forSession:(unsigned int)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a4 == -1) {
    return -50;
  }
  uint64_t v4 = *(void *)&a4;
  if (!gAQMELogScope)
  {
    unsigned int v6 = MEMORY[0x1E4F14500];
LABEL_7:
    self = (ATServerDelegatePriv *)os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (self)
    {
      if (a3)
      {
        if (a3 == 0x2000)
        {
          char v8 = "SpokenAudioBypassesMicMute";
        }
        else if (a3 == 1)
        {
          char v8 = "SpokenAudio";
        }
        else
        {
          char v8 = "Unknown";
        }
      }
      else
      {
        char v8 = "None";
      }
      int v16 = 136315906;
      int v17 = "AudioToolboxServers.mm";
      __int16 v18 = 1024;
      int v19 = 806;
      __int16 v20 = 2080;
      __int16 v21 = v8;
      __int16 v22 = 1024;
      int v23 = v4;
      _os_log_impl(&dword_1A3931000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AudioToolboxServerMixToTelephonyUplink; -> injectionMode: %s, session id: 0x%x",
        (uint8_t *)&v16,
        0x22u);
    }
    goto LABEL_16;
  }
  unsigned int v6 = *(NSObject **)gAQMELogScope;
  if (*(void *)gAQMELogScope) {
    goto LABEL_7;
  }
LABEL_16:
  uint64_t v9 = AQIONodeManager::systemMixEngine((AQIONodeManager *)self);
  os_unfair_recursive_lock_lock_with_options();
  int v10 = *(uint64_t **)(v9 + 56);
  unsigned int v11 = *(uint64_t **)(v9 + 64);
  if (v10 == v11)
  {
    int v7 = 0;
  }
  else
  {
    do
    {
      uint64_t v12 = *v10;
      v13 = (std::__shared_weak_count *)v10[1];
      if (v13) {
        atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      int v7 = (*(uint64_t (**)(uint64_t, uint64_t, int64_t))(*(void *)v12 + 144))(v12, v4, a3);
      if (v13) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v13);
      }
      if (!v7) {
        break;
      }
      v10 += 2;
    }
    while (v10 != v11);
  }
  os_unfair_recursive_lock_unlock();
  if (gAQMELogScope)
  {
    id v14 = *(NSObject **)gAQMELogScope;
    if (!*(void *)gAQMELogScope) {
      return v7;
    }
  }
  else
  {
    id v14 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315650;
    int v17 = "AudioToolboxServers.mm";
    __int16 v18 = 1024;
    int v19 = 818;
    __int16 v20 = 1024;
    LODWORD(v21) = v7;
    _os_log_impl(&dword_1A3931000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AudioToolboxServerMixToTelephonyUplink; <- status: %d",
      (uint8_t *)&v16,
      0x18u);
  }
  return v7;
}

- (int)muteSessionInput:(unsigned int)a3 clientPID:(int)a4 muted:(BOOL)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (a3 == -1) {
    return -50;
  }
  BOOL v5 = a5;
  if (!gAQMELogScope)
  {
    char v8 = MEMORY[0x1E4F14500];
LABEL_7:
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v10 = "unmuting";
      buf.mProcessID = 136315906;
      *(void *)&buf.mSessionID = "AudioToolboxServers.mm";
      *(_DWORD *)(&buf.mSourceSessionID.__engaged_ + 2) = 735;
      WORD1(buf.mSubsessionRef.mCFObject) = 2080;
      *(_WORD *)&buf.mSourceSessionID.__engaged_ = 1024;
      if (v5) {
        int v10 = "muting";
      }
      *(void **)((char *)&buf.mSubsessionRef.mCFObject + 4) = (void *)v10;
      WORD2(buf.mSubsessionID) = 1024;
      *(_DWORD *)((char *)&buf.mSubsessionID + 6) = a3;
      _os_log_impl(&dword_1A3931000, v8, OS_LOG_TYPE_INFO, "%25s:%-5d %s all client input, session id: 0x%x", (uint8_t *)&buf, 0x22u);
    }
    goto LABEL_11;
  }
  char v8 = *(NSObject **)gAQMELogScope;
  if (*(void *)gAQMELogScope) {
    goto LABEL_7;
  }
LABEL_11:
  AQMESession::AQMESession(&buf, a3, a4);
  CADeprecated::TSingleton<RemoteIOServer>::instance();
  uint64_t v25 = 0;
  __int16 v26 = &v25;
  uint64_t v27 = 0x2020000000;
  int v28 = 0;
  int v17 = (uint64_t (*)(const AQMESession ***, uint64_t))MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  int v19 = ___ZN14RemoteIOServer13SetInputMutedERK11AQMESessionbf_block_invoke;
  __int16 v20 = &unk_1E5B15758;
  BOOL v24 = v5;
  int v23 = 1036831949;
  __int16 v21 = &v25;
  p_AQMESession buf = &buf;
  CADeprecated::XMachServer::DoForEachClient();
  _Block_object_dispose(&v25, 8);
  uint64_t v12 = AQ::Server::global(v11);
  uint64_t v13 = v12;
  BOOL v31 = v5;
  {
    if (v12)
    {
      CASIsDarwinOS(void)::global = os_variant_is_darwinos();
    }
  }
  if (!CASIsDarwinOS(void)::global)
  {
    int v30 = 0;
    v29[0] = &v31;
    v29[1] = &v30;
    uint64_t v25 = caulk::function_ref<void ()(QueueAccessor &)>::functor_invoker<AQ::Server::Base::SetInputMuted(AQMESession const&,BOOL)::$_0>;
    __int16 v26 = (uint64_t (**)(unsigned __int8 ***, uint64_t))v29;
    v32[0] = &buf;
    v32[1] = &v25;
    int v17 = caulk::function_ref<void ()(QueueAccessor &)>::functor_invoker<AQ::Server::Base::forEachQueueInSession(AQMESession const&,caulk::function_ref<void ()(QueueAccessor &)> const&)::$_0>;
    uint64_t v18 = (uint64_t)v32;
    v33 = &v17;
    v34[0] = caulk::function_ref<void ()>::functor_invoker<AQ::Server::Base::forEachQueue(BOOL,caulk::function_ref<void ()(QueueAccessor &)> const&)::$_0>;
    v34[1] = &v33;
    uint64_t v12 = (*(uint64_t (**)(uint64_t, void, void *))(*(void *)v13 + 40))(v13, 0, v34);
  }
  if (PhaseServer::HasPlatform((PhaseServer *)v12))
  {
    id v14 = (void *)PhaseServer::instance(void)::global;
    uint64_t v15 = AQMESession::sessionID(&buf);
    LODWORD(v16) = 1008981770;
    [v14 muteSessionInput:v15 mute:v5 fadeTime:v16];
  }
  if (_os_feature_enabled_impl()
    && _os_feature_enabled_impl()
    && (gAQME_TelephonyClientSession
     && AQMESession::sessionID((AQMESession *)gAQME_TelephonyClientSession) == a3
     || gAQME_VPIOClientSession && AQMESession::sessionID((AQMESession *)gAQME_VPIOClientSession) == a3))
  {
    AudioToolboxServerSetTelephonyMutes(v5 | 0x100, 0);
  }
  std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&buf.mDescription.var0);
  if (*((char *)&buf.mDescription.__r_.__value_.var0.__l + 23) < 0) {
    operator delete(buf.mDescription.__r_.__value_.var0.__l.__data_);
  }
  if (buf.mSubsessionRef.mCFObject) {
    CFRelease(buf.mSubsessionRef.mCFObject);
  }
  return 0;
}

- (int)refreshMicrophoneInjectionPermissions:(id *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v3 = *(_OWORD *)&a3->var0[4];
  long long v15 = *(_OWORD *)a3->var0;
  long long v16 = v3;
  long long v4 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v14.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v14.val[4] = v4;
  BOOL v5 = (AQIONodeManager *)audit_token_to_pid(&v14);
  int v6 = (int)v5;
  if (gAQMELogScope)
  {
    int v7 = *(NSObject **)gAQMELogScope;
    if (!*(void *)gAQMELogScope) {
      goto LABEL_7;
    }
  }
  else
  {
    int v7 = MEMORY[0x1E4F14500];
  }
  BOOL v5 = (AQIONodeManager *)os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    *(_DWORD *)AQMESession buf = 136315650;
    *(void *)&uint8_t buf[4] = "AudioToolboxServers.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 769;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v6;
    _os_log_impl(&dword_1A3931000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d AudioToolboxServerRefreshMicrophoneInjectionPermissions for pid %d", buf, 0x18u);
  }
LABEL_7:
  uint64_t v8 = AQIONodeManager::systemMixEngine(v5);
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v9 = *(uint64_t **)(v8 + 56);
  for (i = *(uint64_t **)(v8 + 64); v9 != i; v9 += 2)
  {
    uint64_t v11 = *v9;
    uint64_t v12 = (std::__shared_weak_count *)v9[1];
    if (v12) {
      atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    *(_OWORD *)AQMESession buf = v15;
    *(_OWORD *)&buf[16] = v16;
    (*(void (**)(uint64_t, unsigned char *))(*(void *)v11 + 160))(v11, buf);
    if (v12) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v12);
    }
  }
  os_unfair_recursive_lock_unlock();
  return 0;
}

- (int)refreshRecordPermissions:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v29.__value_.var0.__s.__data_ = *(_OWORD *)a3->var0;
  *((_OWORD *)&v29.__value_.var0.__l + 1) = v3;
  long long v4 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)atoken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&atoken.val[4] = v4;
  BOOL v5 = (AQ::Server *)audit_token_to_pid(&atoken);
  int v6 = (int)v5;
  if (gAQMELogScope)
  {
    int v7 = *(NSObject **)gAQMELogScope;
    if (!*(void *)gAQMELogScope) {
      goto LABEL_7;
    }
  }
  else
  {
    int v7 = MEMORY[0x1E4F14500];
  }
  BOOL v5 = (AQ::Server *)os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    buf.mProcessID = 136315650;
    *(void *)&buf.mSessionID = "AudioToolboxServers.mm";
    *(_WORD *)&buf.mSourceSessionID.__engaged_ = 1024;
    *(_DWORD *)(&buf.mSourceSessionID.__engaged_ + 2) = 426;
    WORD1(buf.mSubsessionRef.mCFObject) = 1024;
    HIDWORD(buf.mSubsessionRef.mCFObject) = v6;
    _os_log_impl(&dword_1A3931000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d AudioToolboxServerRefreshRecordPermissions for pid %d", (uint8_t *)&buf, 0x18u);
  }
LABEL_7:
  uint64_t v8 = AQ::Server::global(v5);
  __compressed_pair<std::string::__rep, std::allocator<char>> v17 = v29;
  {
    CASIsDarwinOS(void)::global = os_variant_is_darwinos();
  }
  if (CASIsDarwinOS(void)::global) {
    goto LABEL_18;
  }
  audit_token_t v24 = (audit_token_t)v17;
  pid_t v9 = audit_token_to_pid(&v24);
  if (!gAQMELogScope)
  {
    int v10 = MEMORY[0x1E4F14500];
LABEL_13:
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      buf.mProcessID = 136315650;
      *(void *)&buf.mSessionID = "AQ_Server.cpp";
      *(_WORD *)&buf.mSourceSessionID.__engaged_ = 1024;
      *(_DWORD *)(&buf.mSourceSessionID.__engaged_ + 2) = 188;
      WORD1(buf.mSubsessionRef.mCFObject) = 1024;
      HIDWORD(buf.mSubsessionRef.mCFObject) = v9;
      _os_log_impl(&dword_1A3931000, v10, OS_LOG_TYPE_INFO, "%25s:%-5d AQServer::RefreshRecordPermissionsForClients (pid = %d)", (uint8_t *)&buf, 0x18u);
    }
    goto LABEL_15;
  }
  int v10 = *(NSObject **)gAQMELogScope;
  if (*(void *)gAQMELogScope) {
    goto LABEL_13;
  }
LABEL_15:
  {
    CASIsDarwinOS(void)::global = os_variant_is_darwinos();
  }
  if (CASIsDarwinOS(void)::global) {
    goto LABEL_17;
  }
  if (!sSessionServer)
  {
    long long v15 = MEMORY[0x1E4F14500];
    id v16 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      buf.mProcessID = 136315394;
      *(void *)&buf.mSessionID = "AudioSessionServerImp.mm";
      *(_WORD *)&buf.mSourceSessionID.__engaged_ = 1024;
      *(_DWORD *)(&buf.mSourceSessionID.__engaged_ + 2) = 1188;
      _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d AudioSessionServer has not been initialized", (uint8_t *)&buf, 0x12u);
    }

LABEL_17:
    __int16 v21 = 0;
    __int16 v22 = 0;
    uint64_t v23 = 0;
    goto LABEL_18;
  }
  uint64_t v12 = AudioSessionServerInstance();
  [v12 getSessionIDsForToken:&v17];

  audit_token_t v14 = v21;
  uint64_t v13 = v22;
  if (v21 != v22)
  {
    do
    {
      AQMESession::AQMESession(&buf, *v14, 0);
      int v19 = (audit_token_t *)&v17;
      v20[0] = caulk::function_ref<void ()(QueueAccessor &)>::functor_invoker<AQ::Server::Base::RefreshRecordPermissionsForClients(audit_token_t)::$_0>;
      v20[1] = &v19;
      v25[0] = &buf;
      v25[1] = v20;
      v26[0] = caulk::function_ref<void ()(QueueAccessor &)>::functor_invoker<AQ::Server::Base::forEachQueueInSession(AQMESession const&,caulk::function_ref<void ()(QueueAccessor &)> const&)::$_0>;
      v26[1] = v25;
      uint64_t v27 = v26;
      v28[0] = caulk::function_ref<void ()>::functor_invoker<AQ::Server::Base::forEachQueue(BOOL,caulk::function_ref<void ()(QueueAccessor &)> const&)::$_0>;
      v28[1] = &v27;
      (*(void (**)(uint64_t, void, void *))(*(void *)v8 + 40))(v8, 0, v28);
      std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&buf.mDescription.var0);
      if (*((char *)&buf.mDescription.__r_.__value_.var0.__l + 23) < 0) {
        operator delete(buf.mDescription.__r_.__value_.var0.__l.__data_);
      }
      if (buf.mSubsessionRef.mCFObject) {
        CFRelease(buf.mSubsessionRef.mCFObject);
      }
      ++v14;
    }
    while (v14 != v13);
    uint64_t v13 = v21;
  }
  if (v13)
  {
    __int16 v22 = v13;
    operator delete(v13);
  }
LABEL_18:
  CADeprecated::TSingleton<RemoteIOServer>::instance();
  buf.mDescription.__r_ = v29;
  *(void *)&buf.mProcessID = MEMORY[0x1E4F143A8];
  buf.mSourceSessionID = (optional<unsigned int>)3221225472;
  buf.mSubsessionRef.mCFObject = ___ZN14RemoteIOServer34RefreshRecordPermissionsForClientsE13audit_token_t_block_invoke;
  buf.mSubsessionID = (unint64_t)&__block_descriptor_64_e9_v16__0_v8l;
  CADeprecated::XMachServer::DoForEachClient();
  return 0;
}

- (void)setTelephonyClientSessionID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  long long v4 = (AQIONodeManager *)AQIONodeManager::systemMixEngine((AQIONodeManager *)self);

  AQIONodeManager::_SetTelephonyClientSessionID(v4, v3, 0);
}

- (int)handleInterruptionWithID:(unsigned int)a3 clientPID:(int)a4 interruptionState:(unsigned int)a5 interruptionInfo:(id)a6
{
  return 0;
}

- (ATServerDelegatePriv)init
{
  v3.receiver = self;
  v3.super_class = (Class)ATServerDelegatePriv;
  BOOL result = [(ATServerDelegatePriv *)&v3 init];
  if (result) {
    *((unsigned char *)result + 120) = 0;
  }
  return result;
}

@end