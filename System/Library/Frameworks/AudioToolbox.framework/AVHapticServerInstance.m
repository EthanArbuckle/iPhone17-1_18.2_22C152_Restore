@interface AVHapticServerInstance
- (AVHapticServer)master;
- (AVHapticServerInstance)initWithMaster:(id)a3 id:(unint64_t)a4 connection:(id)a5 outError:(id *)a6;
- (BOOL)clientInterrupted;
- (BOOL)clientSuspended;
- (BOOL)handleClientApplicationStateChange:(id)a3;
- (BOOL)handleClientApplicationStateChangeUsingAppState:(unint64_t)a3;
- (BOOL)prewarmIncludesAudio;
- (BOOL)prewarmIncludesHaptics;
- (BOOL)runIncludesAudio;
- (BOOL)runIncludesHaptics;
- (BOOL)runningInBackground;
- (BOOL)setupAudioSessionFromID:(unsigned int)a3 isShared:(BOOL)a4 error:(id *)a5;
- (BOOL)wasPrewarmedAndSuspended;
- (BOOL)wasRunningAndSuspended;
- (id).cxx_construct;
- (id)getAsyncDelegateForMethod:(SEL)a3 errorHandler:(id)a4;
- (id)getSyncDelegateForMethod:(SEL)a3 errorHandler:(id)a4;
- (unint64_t)clientID;
- (void)allocateClientResources:(id)a3;
- (void)configureWithOptions:(id)a3 reply:(id)a4;
- (void)copyCustomAudioEvent:(unint64_t)a3 options:(id)a4 reply:(id)a5;
- (void)createCustomAudioEvent:(id)a3 format:(id)a4 frames:(unint64_t)a5 options:(id)a6 reply:(id)a7;
- (void)dealloc;
- (void)debugExpectNotifyOnFinishAfter:(double)a3 reply:(id)a4;
- (void)detachSequence:(unint64_t)a3;
- (void)fadeClientForSessionInterruption:(BOOL)a3 affectHaptics:(BOOL)a4 fadeTime:(float)a5 fadeLevel:(float)a6 stopAfterFade:(BOOL)a7;
- (void)getHapticLatency:(id)a3;
- (void)handleClientRouteChange:(id)a3;
- (void)handleConnectionError;
- (void)handleInterruptionForSession:(const void *)a3 command:(unsigned int)a4 dictionary:(id)a5;
- (void)loadHapticEvent:(id)a3 reply:(id)a4;
- (void)loadHapticSequenceFromData:(id)a3 reply:(id)a4;
- (void)loadHapticSequenceFromEvents:(id)a3 reply:(id)a4;
- (void)loadVibePattern:(id)a3 reply:(id)a4;
- (void)muteClientForRingerSwitch:(BOOL)a3;
- (void)notifyClientOnStopWithReason:(int64_t)a3 error:(id)a4;
- (void)prepareHapticSequence:(unint64_t)a3 reply:(id)a4;
- (void)prewarm:(id)a3;
- (void)queryCapabilities:(id)a3 reply:(id)a4;
- (void)referenceCustomAudioEvent:(unint64_t)a3 reply:(id)a4;
- (void)releaseChannels;
- (void)releaseClientResources;
- (void)releaseCustomAudioEvent:(unint64_t)a3 reply:(id)a4;
- (void)removeChannel:(unint64_t)a3 reply:(id)a4;
- (void)removeSessionListeners;
- (void)requestChannels:(unint64_t)a3 reply:(id)a4;
- (void)setChannelEventBehavior:(unint64_t)a3 behavior:(unint64_t)a4 reply:(id)a5;
- (void)setClientInterrupted:(BOOL)a3;
- (void)setClientSuspended:(BOOL)a3;
- (void)setPlayerBehavior:(unint64_t)a3 reply:(id)a4;
- (void)setPrewarmIncludesAudio:(BOOL)a3;
- (void)setPrewarmIncludesHaptics:(BOOL)a3;
- (void)setRunIncludesAudio:(BOOL)a3;
- (void)setRunIncludesHaptics:(BOOL)a3;
- (void)setRunningInBackground:(BOOL)a3;
- (void)setSequenceEventBehavior:(unint64_t)a3 behavior:(unint64_t)a4 channelIndex:(unint64_t)a5 reply:(id)a6;
- (void)setWasPrewarmedAndSuspended:(BOOL)a3;
- (void)setWasRunningAndSuspended:(BOOL)a3;
- (void)startRunning:(id)a3;
- (void)stopPrewarm;
- (void)stopRunning;
- (void)stopRunning:(id)a3;
- (void)unmuteClientAfterSessionInterruption:(float)a3;
@end

@implementation AVHapticServerInstance

- (id).cxx_construct
{
  *((unsigned char *)self + 76) = 0;
  *((unsigned char *)self + 128) = 0;
  *((unsigned char *)self + 136) = 0;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *(_OWORD *)((char *)self + 108) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *(_OWORD *)((char *)self + 57) = 0u;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenerWrapper, 0);
  std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&self->_aqmeSession.mDescription.var0);
  if (*((char *)&self->_aqmeSession.mDescription.__r_.__value_.var0.__l + 23) < 0) {
    operator delete(self->_aqmeSession.mDescription.__r_.__value_.var0.__l.__data_);
  }
  mCFObject = self->_aqmeSession.mSubsessionRef.mCFObject;
  if (mCFObject) {
    CFRelease(mCFObject);
  }
  cntrl = self->_clientSession.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  v5 = self->_hapticSession.__cntrl_;
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v5);
  }
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_master, 0);
}

- (void)setWasRunningAndSuspended:(BOOL)a3
{
  self->_wasRunningAndSuspended = a3;
}

- (BOOL)wasRunningAndSuspended
{
  return self->_wasRunningAndSuspended;
}

- (void)setRunIncludesAudio:(BOOL)a3
{
  self->_runIncludesAudio = a3;
}

- (BOOL)runIncludesAudio
{
  return self->_runIncludesAudio;
}

- (void)setRunIncludesHaptics:(BOOL)a3
{
  self->_runIncludesHaptics = a3;
}

- (BOOL)runIncludesHaptics
{
  return self->_runIncludesHaptics;
}

- (void)setPrewarmIncludesAudio:(BOOL)a3
{
  self->_prewarmIncludesAudio = a3;
}

- (BOOL)prewarmIncludesAudio
{
  return self->_prewarmIncludesAudio;
}

- (void)setPrewarmIncludesHaptics:(BOOL)a3
{
  self->_prewarmIncludesHaptics = a3;
}

- (BOOL)prewarmIncludesHaptics
{
  return self->_prewarmIncludesHaptics;
}

- (void)setRunningInBackground:(BOOL)a3
{
  self->_runningInBackground = a3;
}

- (BOOL)runningInBackground
{
  return self->_runningInBackground;
}

- (void)setClientInterrupted:(BOOL)a3
{
  self->_clientInterrupted = a3;
}

- (BOOL)clientInterrupted
{
  return self->_clientInterrupted;
}

- (void)setWasPrewarmedAndSuspended:(BOOL)a3
{
  self->_wasPrewarmedAndSuspended = a3;
}

- (BOOL)wasPrewarmedAndSuspended
{
  return self->_wasPrewarmedAndSuspended;
}

- (void)setClientSuspended:(BOOL)a3
{
  self->_clientSuspended = a3;
}

- (BOOL)clientSuspended
{
  return self->_clientSuspended;
}

- (unint64_t)clientID
{
  return self->_clientID;
}

- (AVHapticServer)master
{
  return (AVHapticServer *)objc_getProperty(self, a2, 8, 1);
}

- (void)debugExpectNotifyOnFinishAfter:(double)a3 reply:(id)a4
{
}

- (void)setSequenceEventBehavior:(unint64_t)a3 behavior:(unint64_t)a4 channelIndex:(unint64_t)a5 reply:(id)a6
{
  unsigned int v6 = a5;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v10 = (void (**)(id, void *))a6;
  if (kHSRVScope)
  {
    v11 = *(id *)kHSRVScope;
    if (!v11) {
      goto LABEL_8;
    }
  }
  else
  {
    v11 = MEMORY[0x1E4F14500];
    id v12 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    unint64_t clientID = self->_clientID;
    *(_DWORD *)v20 = 136316162;
    *(void *)&v20[4] = "AVHapticServer.mm";
    *(_WORD *)&v20[12] = 1024;
    *(_DWORD *)&v20[14] = 1484;
    __int16 v21 = 2080;
    v22 = "-[AVHapticServerInstance setSequenceEventBehavior:behavior:channelIndex:reply:]";
    __int16 v23 = 2048;
    unint64_t v24 = clientID;
    __int16 v25 = 1024;
    int v26 = a4;
    _os_log_impl(&dword_1A3931000, v11, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx behavior: %u", v20, 0x2Cu);
  }

LABEL_8:
  master = self->_master;
  if (!master)
  {
    *(void *)v20 = 0;
    *(void *)&v20[8] = 0;
    goto LABEL_18;
  }
  [(AVHapticServer *)master entryWithID:self->_clientID];
  if (!*(void *)v20)
  {
LABEL_18:
    uint64_t v18 = -4812;
    goto LABEL_19;
  }
  [(AVHapticServer *)self->_master manager];
  v16 = *(ClientEntry **)v20;
  v15 = *(std::__shared_weak_count **)&v20[8];
  if (*(void *)&v20[8]) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&v20[8] + 8), 1uLL, memory_order_relaxed);
  }
  unsigned int SequencerChannelForIndex = ClientEntry::getSequencerChannelForIndex(v16, a3, v6);
  if (SequencerChannelForIndex != -1)
  {
    ClientEntry::setChannelBehaviorForSynthChannel(v16, SequencerChannelForIndex, a4);
    uint64_t v18 = 0;
    if (!v15) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  uint64_t v18 = -4804;
  if (v15) {
LABEL_14:
  }
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
LABEL_15:
  if (SequencerChannelForIndex != -1)
  {
    v19 = 0;
    goto LABEL_20;
  }
LABEL_19:
  v19 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"com.apple.CoreHaptics", v18, 0, *(void *)v20);
LABEL_20:
  v10[2](v10, v19);

  if (*(void *)&v20[8]) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&v20[8]);
  }
}

- (void)setChannelEventBehavior:(unint64_t)a3 behavior:(unint64_t)a4 reply:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v8 = (void (**)(id, id))a5;
  if (kHSRVScope)
  {
    v9 = *(id *)kHSRVScope;
    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {
    v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    unint64_t clientID = self->_clientID;
    *(_DWORD *)buf = 136316162;
    __int16 v23 = "AVHapticServer.mm";
    __int16 v24 = 1024;
    int v25 = 1471;
    __int16 v26 = 2080;
    uint64_t v27 = "-[AVHapticServerInstance setChannelEventBehavior:behavior:reply:]";
    __int16 v28 = 2048;
    unint64_t v29 = clientID;
    __int16 v30 = 1024;
    int v31 = a4;
    _os_log_impl(&dword_1A3931000, v9, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx behavior: %u", buf, 0x2Cu);
  }

LABEL_8:
  master = self->_master;
  if (!master)
  {
    uint64_t v20 = 0;
    __int16 v21 = 0;
    goto LABEL_14;
  }
  [(AVHapticServer *)master entryWithID:self->_clientID];
  if (!v20)
  {
LABEL_14:
    uint64_t v14 = -4812;
LABEL_15:
    objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"com.apple.CoreHaptics", v14, 0, v20);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (kHSRVScope)
  {
    v13 = *(id *)kHSRVScope;
    if (!v13) {
      goto LABEL_20;
    }
  }
  else
  {
    v13 = MEMORY[0x1E4F14500];
    id v16 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v17 = *(void *)(v20 + 24);
    *(_DWORD *)buf = 136316418;
    __int16 v23 = "ClientEntry.mm";
    __int16 v24 = 1024;
    int v25 = 795;
    __int16 v26 = 2080;
    uint64_t v27 = "setChannelBehaviorForChannelID";
    __int16 v28 = 2048;
    unint64_t v29 = v17;
    __int16 v30 = 1024;
    int v31 = a3;
    __int16 v32 = 1024;
    int v33 = a4;
    _os_log_impl(&dword_1A3931000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Channel behavior change: Client ID 0x%lx, channelID: 0x%x, behavior: %u", buf, 0x32u);
  }

LABEL_20:
  unsigned int AssignedChannelWithID = ClientEntry::getAssignedChannelWithID((ClientEntry *)v20, a3);
  if (AssignedChannelWithID == -1)
  {
    uint64_t v14 = -4804;
    goto LABEL_15;
  }
  ClientEntry::setChannelBehaviorForSynthChannel((ClientEntry *)v20, AssignedChannelWithID, a4);
  id v15 = 0;
LABEL_22:
  id v19 = v15;
  v8[2](v8, v19);

  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }
}

- (void)removeChannel:(unint64_t)a3 reply:(id)a4
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  v7 = (void (**)(id, void *))a4;
  if (kHCHNScope)
  {
    v8 = *(id *)kHCHNScope;
    if (!v8) {
      goto LABEL_8;
    }
  }
  else
  {
    v8 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    unint64_t clientID = self->_clientID;
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
    __int16 v74 = 1024;
    *(_DWORD *)v75 = 1451;
    *(_WORD *)&v75[4] = 2080;
    *(void *)&v75[6] = "-[AVHapticServerInstance removeChannel:reply:]";
    *(_WORD *)&v75[14] = 2048;
    *(void *)&v75[16] = clientID;
    *(_WORD *)&v75[24] = 1024;
    int v76 = a3;
    _os_log_impl(&dword_1A3931000, v8, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx channelID: %u", buf, 0x2Cu);
  }

LABEL_8:
  v11 = self->_master;
  objc_sync_enter(v11);
  master = self->_master;
  if (!master)
  {
    v69 = 0;
    goto LABEL_22;
  }
  [(AVHapticServer *)master entryWithID:self->_clientID];
  if (!v68)
  {
LABEL_22:
    uint64_t v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4812 userInfo:0];
LABEL_23:
    id v19 = (void *)v18;
    goto LABEL_138;
  }
  if (kHCHNScope)
  {
    if (*(unsigned char *)(kHCHNScope + 8))
    {
      v13 = *(id *)kHCHNScope;
      if (v13)
      {
        unint64_t v4 = (unint64_t)v13;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v14 = *(void *)(v68 + 24);
          *(_DWORD *)buf = 136316162;
          *(void *)&uint8_t buf[4] = "ClientEntry.mm";
          *(_DWORD *)v75 = 231;
          *(_WORD *)&v75[4] = 2080;
          __int16 v74 = 1024;
          *(void *)&v75[6] = "removeAssignedChannelWithID";
          *(_WORD *)&v75[14] = 1024;
          *(_DWORD *)&v75[16] = v14;
          *(_WORD *)&v75[20] = 1024;
          *(_DWORD *)&v75[22] = a3;
          _os_log_impl(&dword_1A3931000, (os_log_t)v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: client ID: 0x%x, key: %u", buf, 0x28u);
        }
      }
    }
  }
  unsigned int v15 = atomic_load((unsigned int *)(v68 + 120));
  if (v15 == 5 || (int v16 = atomic_load((unsigned int *)(v68 + 120)), v16 > 1))
  {
    if (kHCHNScope)
    {
      unint64_t v17 = *(id *)kHCHNScope;
      if (!v17) {
        goto LABEL_28;
      }
    }
    else
    {
      unint64_t v17 = MEMORY[0x1E4F14500];
      id v20 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "ClientEntry.mm";
      __int16 v74 = 1024;
      *(_DWORD *)v75 = 254;
      *(_WORD *)&v75[4] = 2080;
      *(void *)&v75[6] = "removeAssignedChannelWithID";
      _os_log_impl(&dword_1A3931000, v17, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Flushing or running, so queueing chan ID for later release", buf, 0x1Cu);
    }

LABEL_28:
    *(void *)buf = v68 + 488;
    buf[8] = (*(uint64_t (**)(void))(*(void *)(v68 + 488) + 16))();
    unint64_t v21 = *(void *)(v68 + 456);
    if (v21)
    {
      uint8x8_t v22 = (uint8x8_t)vcnt_s8((int8x8_t)v21);
      v22.i16[0] = vaddlv_u8(v22);
      if (v22.u32[0] > 1uLL)
      {
        unint64_t v4 = a3;
        if (v21 <= a3) {
          unint64_t v4 = a3 % v21;
        }
      }
      else
      {
        unint64_t v4 = (v21 - 1) & a3;
      }
      __int16 v24 = *(void **)(*(void *)(v68 + 448) + 8 * v4);
      if (v24)
      {
        for (i = (void *)*v24; i; i = (void *)*i)
        {
          unint64_t v26 = i[1];
          if (v26 == a3)
          {
            if (i[2] == a3) {
              goto LABEL_136;
            }
          }
          else
          {
            if (v22.u32[0] > 1uLL)
            {
              if (v26 >= v21) {
                v26 %= v21;
              }
            }
            else
            {
              v26 &= v21 - 1;
            }
            if (v26 != v4) {
              break;
            }
          }
        }
      }
    }
    uint64_t v27 = (caulk::rt_safe_memory_resource **)MEMORY[0x1E4FB7E88];
    if (!*MEMORY[0x1E4FB7E88]) {
      goto LABEL_166;
    }
    uint64_t v28 = caulk::rt_safe_memory_resource::rt_allocate((caulk::rt_safe_memory_resource *)*MEMORY[0x1E4FB7E88]);
    unint64_t v29 = (void *)(v68 + 464);
    *(void *)uint64_t v28 = 0;
    *(void *)(v28 + 8) = a3;
    *(void *)(v28 + 16) = a3;
    *(unsigned char *)(v28 + 24) = 0;
    float v30 = (float)(unint64_t)(*(void *)(v68 + 472) + 1);
    float v31 = *(float *)(v68 + 480);
    if (v21 && (float)(v31 * (float)v21) >= v30)
    {
LABEL_126:
      v61 = *(uint64_t **)(*(void *)(v68 + 448) + 8 * v4);
      if (v61)
      {
        *(void *)uint64_t v28 = *v61;
      }
      else
      {
        *(void *)uint64_t v28 = *(void *)(v68 + 464);
        *(void *)(v68 + 464) = v28;
        *(void *)(*(void *)(v68 + 448) + 8 * v4) = v29;
        if (!*(void *)v28) {
          goto LABEL_135;
        }
        unint64_t v62 = *(void *)(*(void *)v28 + 8);
        if ((v21 & (v21 - 1)) != 0)
        {
          if (v62 >= v21) {
            v62 %= v21;
          }
        }
        else
        {
          v62 &= v21 - 1;
        }
        v61 = (uint64_t *)(*(void *)(v68 + 448) + 8 * v62);
      }
      uint64_t *v61 = v28;
LABEL_135:
      ++*(void *)(v68 + 472);
LABEL_136:
      CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)buf);
      goto LABEL_137;
    }
    BOOL v32 = 1;
    if (v21 >= 3) {
      BOOL v32 = (v21 & (v21 - 1)) != 0;
    }
    unint64_t v33 = v32 | (2 * v21);
    unint64_t v34 = vcvtps_u32_f32(v30 / v31);
    if (v33 <= v34) {
      int8x8_t prime = (int8x8_t)v34;
    }
    else {
      int8x8_t prime = (int8x8_t)v33;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }
    unint64_t v21 = *(void *)(v68 + 456);
    if (*(void *)&prime > v21)
    {
LABEL_61:
      if (!(*(void *)&prime >> 61) && *v27)
      {
        uint64_t v36 = caulk::rt_safe_memory_resource::rt_allocate(*v27);
        v37 = *(caulk::rt_safe_memory_resource **)(v68 + 448);
        *(void *)(v68 + 448) = v36;
        if (v37) {
          std::allocator_traits<caulk::rt_allocator<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long,BOOL>,void *> *> *>>::deallocate[abi:ne180100](v37, *(void *)(v68 + 456));
        }
        uint64_t v38 = 0;
        *(int8x8_t *)(v68 + 456) = prime;
        do
          *(void *)(*(void *)(v68 + 448) + 8 * v38++) = 0;
        while (*(void *)&prime != v38);
        v39 = (void *)*v29;
        if (*v29)
        {
          unint64_t v40 = v39[1];
          uint8x8_t v41 = (uint8x8_t)vcnt_s8(prime);
          v41.i16[0] = vaddlv_u8(v41);
          if (v41.u32[0] > 1uLL)
          {
            if (v40 >= *(void *)&prime) {
              v40 %= *(void *)&prime;
            }
          }
          else
          {
            v40 &= *(void *)&prime - 1;
          }
          *(void *)(*(void *)(v68 + 448) + 8 * v40) = v29;
          v58 = (void *)*v39;
          if (*v39)
          {
            do
            {
              unint64_t v59 = v58[1];
              if (v41.u32[0] > 1uLL)
              {
                if (v59 >= *(void *)&prime) {
                  v59 %= *(void *)&prime;
                }
              }
              else
              {
                v59 &= *(void *)&prime - 1;
              }
              if (v59 != v40)
              {
                uint64_t v60 = *(void *)(v68 + 448);
                if (!*(void *)(v60 + 8 * v59))
                {
                  *(void *)(v60 + 8 * v59) = v39;
                  goto LABEL_117;
                }
                void *v39 = *v58;
                void *v58 = **(void **)(*(void *)(v68 + 448) + 8 * v59);
                **(void **)(*(void *)(v68 + 448) + 8 * v59) = v58;
                v58 = v39;
              }
              unint64_t v59 = v40;
LABEL_117:
              v39 = v58;
              v58 = (void *)*v58;
              unint64_t v40 = v59;
            }
            while (v58);
          }
        }
        unint64_t v21 = (unint64_t)prime;
        goto LABEL_121;
      }
LABEL_166:
      __break(1u);
    }
    if (*(void *)&prime < v21)
    {
      unint64_t v42 = vcvtps_u32_f32((float)*(unint64_t *)(v68 + 472) / *(float *)(v68 + 480));
      if (v21 < 3 || (uint8x8_t v43 = (uint8x8_t)vcnt_s8((int8x8_t)v21), v43.i16[0] = vaddlv_u8(v43), v43.u32[0] > 1uLL))
      {
        unint64_t v42 = std::__next_prime(v42);
      }
      else
      {
        uint64_t v44 = 1 << -(char)__clz(v42 - 1);
        if (v42 >= 2) {
          unint64_t v42 = v44;
        }
      }
      if (*(void *)&prime <= v42) {
        int8x8_t prime = (int8x8_t)v42;
      }
      if (*(void *)&prime >= v21)
      {
        unint64_t v21 = *(void *)(v68 + 456);
      }
      else
      {
        if (prime) {
          goto LABEL_61;
        }
        v66 = *(caulk::rt_safe_memory_resource **)(v68 + 448);
        *(void *)(v68 + 448) = 0;
        if (v66) {
          std::allocator_traits<caulk::rt_allocator<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long,BOOL>,void *> *> *>>::deallocate[abi:ne180100](v66, *(void *)(v68 + 456));
        }
        unint64_t v21 = 0;
        *(void *)(v68 + 456) = 0;
      }
    }
LABEL_121:
    if ((v21 & (v21 - 1)) != 0)
    {
      if (v21 <= a3) {
        unint64_t v4 = a3 % v21;
      }
      else {
        unint64_t v4 = a3;
      }
    }
    else
    {
      unint64_t v4 = (v21 - 1) & a3;
    }
    goto LABEL_126;
  }
  if (kHCHNScope)
  {
    __int16 v23 = *(id *)kHCHNScope;
    if (!v23) {
      goto LABEL_80;
    }
  }
  else
  {
    __int16 v23 = MEMORY[0x1E4F14500];
    id v45 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "ClientEntry.mm";
    __int16 v74 = 1024;
    *(_DWORD *)v75 = 234;
    *(_WORD *)&v75[4] = 2080;
    *(void *)&v75[6] = "removeAssignedChannelWithID";
    _os_log_impl(&dword_1A3931000, v23, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Not flushing or running, so directly releasing assigned channel", buf, 0x1Cu);
  }

LABEL_80:
  v70 = 0;
  v71 = 0;
  uint64_t v46 = *(void *)(v68 + 432);
  v72 = 0;
  *(void *)buf = v68 + 256;
  buf[8] = 1;
  std::__shared_mutex_base::lock((std::__shared_mutex_base *)(v68 + 256));
  v47 = *(void **)(v68 + 240);
  *(unsigned char *)(v68 + 424) = 1;
  *(void *)&v75[2] = v68 + 232;
  *(void *)&v75[10] = v68 + 424;
  *(void *)&v75[18] = v46;
  if (!v47) {
    goto LABEL_91;
  }
  uint64_t v48 = v68 + 240;
  do
  {
    unint64_t v49 = v47[4];
    BOOL v50 = v49 >= a3;
    if (v49 >= a3) {
      v51 = v47;
    }
    else {
      v51 = v47 + 1;
    }
    if (v50) {
      uint64_t v48 = (uint64_t)v47;
    }
    v47 = (void *)*v51;
  }
  while (*v51);
  if (v48 == v68 + 240 || *(void *)(v48 + 32) > a3)
  {
LABEL_91:
    *(unsigned char *)(v68 + 424) = 0;
    std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)buf);
    if (kHCHNScope)
    {
      if (*(unsigned char *)(kHCHNScope + 8))
      {
        v52 = *(id *)kHCHNScope;
        if (v52)
        {
          v53 = v52;
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315906;
            *(void *)&uint8_t buf[4] = "ClientEntry.mm";
            __int16 v74 = 1024;
            *(_DWORD *)v75 = 246;
            *(_WORD *)&v75[4] = 2080;
            *(void *)&v75[6] = "removeAssignedChannelWithID";
            *(_WORD *)&v75[14] = 1024;
            *(_DWORD *)&v75[16] = a3;
            _os_log_impl(&dword_1A3931000, v53, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: ChannelID %u not found", buf, 0x22u);
          }
        }
      }
    }
    int v54 = -1;
    goto LABEL_98;
  }
  if (*(_DWORD *)(v48 + 40) != -1)
  {
    v63 = (AudioUnitElement *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(1uLL);
    AudioUnitElement *v63 = *(_DWORD *)(v48 + 40);
    v64 = v63 + 1;
    v71 = v63 + 1;
    v72 = &v63[v65];
    v70 = v63;
    int v54 = -1;
    goto LABEL_160;
  }
  if (!kHCHNScope || (*(unsigned char *)(kHCHNScope + 8) & 1) == 0) {
    goto LABEL_158;
  }
  v67 = *(id *)kHCHNScope;
  v63 = (AudioUnitElement *)v67;
  if (v67)
  {
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v77 = 136315650;
      v78 = "ClientEntry.mm";
      __int16 v79 = 1024;
      int v80 = 241;
      __int16 v81 = 2080;
      v82 = "operator()";
      _os_log_impl(&dword_1A3931000, (os_log_t)v63, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Channel was already released", v77, 0x1Cu);
    }

LABEL_158:
    v63 = 0;
  }
  v64 = 0;
  int v54 = 0;
LABEL_160:
  std::__tree<std::__value_type<unsigned long,caulk::alloc::consolidating_free_map<AQ::SharedPageAllocator,10485760ul>::FreelistOfSize>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,caulk::alloc::consolidating_free_map<AQ::SharedPageAllocator,10485760ul>::FreelistOfSize>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,caulk::alloc::consolidating_free_map<AQ::SharedPageAllocator,10485760ul>::FreelistOfSize>>>::__remove_node_pointer((uint64_t **)(v68 + 232), (uint64_t *)v48);
  operator delete((void *)v48);
  **(unsigned char **)&v75[10] = 0;
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)buf);
  if (v64 != v63)
  {
    ClientEntry::releaseSynthChannels(v68, &v70);
    int v54 = 0;
  }
  if (v63)
  {
    v71 = v63;
    operator delete(v63);
  }
  if (v54)
  {
LABEL_98:
    if (kHCHNScope)
    {
      v55 = *(id *)kHCHNScope;
      if (!v55)
      {
LABEL_105:
        uint64_t v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:v54 userInfo:0];
        goto LABEL_23;
      }
    }
    else
    {
      v55 = MEMORY[0x1E4F14500];
      id v56 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      unint64_t v57 = self->_clientID;
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
      __int16 v74 = 1024;
      *(_DWORD *)v75 = 1458;
      *(_WORD *)&v75[4] = 2080;
      *(void *)&v75[6] = "-[AVHapticServerInstance removeChannel:reply:]";
      *(_WORD *)&v75[14] = 2048;
      *(void *)&v75[16] = v57;
      _os_log_impl(&dword_1A3931000, v55, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: clientID: 0x%lx - failed to release channel!", buf, 0x26u);
    }

    goto LABEL_105;
  }
LABEL_137:
  id v19 = 0;
LABEL_138:
  v7[2](v7, v19);

  if (v69) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v69);
  }
  objc_sync_exit(v11);
}

- (void)requestChannels:(unint64_t)a3 reply:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (kHCHNScope)
  {
    v7 = *(id *)kHCHNScope;
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
    unint64_t clientID = self->_clientID;
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1407;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "-[AVHapticServerInstance requestChannels:reply:]";
    *(_WORD *)&buf[28] = 2048;
    *(void *)&buf[30] = clientID;
    *(_WORD *)&buf[38] = 1024;
    int v55 = a3;
    _os_log_impl(&dword_1A3931000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx count: %u", buf, 0x2Cu);
  }

LABEL_8:
  id v10 = self->_master;
  objc_sync_enter(v10);
  master = self->_master;
  if (!master)
  {
    BOOL v50 = 0;
    goto LABEL_63;
  }
  [(AVHapticServer *)master entryWithID:self->_clientID];
  if (!v49) {
    goto LABEL_63;
  }
  id v47 = v6;
  ClientEntry::getAssignedChannelIDs((ClientEntry *)buf, v49);
  uint64_t v13 = *(void *)buf;
  uint64_t v12 = *(void *)&buf[8];
  if (*(void *)buf) {
    operator delete(*(void **)buf);
  }
  if (v12 == v13)
  {
    if (a3 >> 31)
    {
      if (!os_log_type_enabled(0, OS_LOG_TYPE_ERROR)) {
        goto LABEL_71;
      }
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "HapticUtils.h";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 74;
      uint8x8_t v43 = "%25s:%-5d ASSERTION FAILURE [(id < (1UL << 31)) != 0 is false]: ";
      goto LABEL_70;
    }
    unint64_t v14 = [(AVHapticServer *)self->_master getChannelID];
    unsigned int v15 = a3;
  }
  else
  {
    unint64_t v14 = [(AVHapticServer *)self->_master getChannelID];
    unsigned int v15 = 1;
  }
  unint64_t v45 = a3;
  uint64_t v46 = self;
  __p = 0;
  v52 = 0;
  uint64_t v53 = 0;
  int v44 = ClientEntry::requestAndInitializeSynthChannels(v49, &__p, v15);
  if (v44) {
    goto LABEL_37;
  }
  if (!kHCHNScope)
  {
    int v16 = MEMORY[0x1E4F14500];
    id v17 = MEMORY[0x1E4F14500];
    goto LABEL_22;
  }
  int v16 = *(id *)kHCHNScope;
  if (v16)
  {
LABEL_22:
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "ClientEntry.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 211;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "addChannels";
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = (unint64_t)((char *)v52 - (unsigned char *)__p) >> 2;
      _os_log_impl(&dword_1A3931000, v16, OS_LOG_TYPE_INFO, "%25s:%-5d %s: %u new synth channels now available -- binding to keys", buf, 0x22u);
    }
  }
  uint64_t v18 = (int *)__p;
  uint64_t v48 = v52;
  if (__p == v52) {
    goto LABEL_37;
  }
  id v19 = (void **)(v49 + 232);
  id v20 = (uint64_t **)(v49 + 240);
  do
  {
    int v21 = *v18;
    uint64_t v22 = *(void *)(v49 + 432);
    *(void *)buf = v49 + 256;
    buf[8] = 1;
    std::__shared_mutex_base::lock((std::__shared_mutex_base *)(v49 + 256));
    *(void *)&buf[16] = v49 + 232;
    *(void *)&buf[24] = v49 + 424;
    *(void *)&buf[32] = v22;
    *(unsigned char *)(v49 + 424) = 1;
    __int16 v23 = (uint64_t *)operator new(0x30uLL);
    __int16 v24 = v23;
    v23[4] = v14;
    *((_DWORD *)v23 + 10) = v21;
    int v25 = *v20;
    unint64_t v26 = (uint64_t **)(v49 + 240);
    uint64_t v27 = (uint64_t **)(v49 + 240);
    if (!*v20) {
      goto LABEL_34;
    }
    do
    {
      while (1)
      {
        uint64_t v27 = (uint64_t **)v25;
        unint64_t v28 = v25[4];
        if (v14 >= v28) {
          break;
        }
        int v25 = (uint64_t *)*v25;
        unint64_t v26 = v27;
        if (!*v27) {
          goto LABEL_34;
        }
      }
      if (v28 >= v14)
      {
        operator delete(v23);
        **(unsigned char **)&buf[24] = 0;
        std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)buf);
        if (!os_log_type_enabled(0, OS_LOG_TYPE_ERROR)) {
          goto LABEL_71;
        }
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "ClientEntry.mm";
        *(_WORD *)&unsigned char buf[12] = 1024;
        *(_DWORD *)&buf[14] = 225;
        uint8x8_t v43 = "%25s:%-5d ASSERTION FAILURE [(!\"Attempted to add same channel ID twice\") != 0 is false]: ";
LABEL_70:
        _os_log_impl(&dword_1A3931000, 0, OS_LOG_TYPE_ERROR, v43, buf, 0x12u);
LABEL_71:
        __break(1u);
      }
      int v25 = (uint64_t *)v25[1];
    }
    while (v25);
    unint64_t v26 = v27 + 1;
LABEL_34:
    *__int16 v23 = 0;
    v23[1] = 0;
    v23[2] = (uint64_t)v27;
    *unint64_t v26 = v23;
    unint64_t v29 = (void *)**v19;
    if (v29)
    {
      void *v19 = v29;
      __int16 v24 = *v26;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(v49 + 240), v24);
    ++*(void *)(v49 + 248);
    **(unsigned char **)&buf[24] = 0;
    std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)buf);
    ++v14;
    ++v18;
  }
  while (v18 != v48);
LABEL_37:
  uint64_t v30 = *(void *)(v49 + 432);
  *(void *)buf = v49 + 256;
  buf[8] = 1;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)(v49 + 256));
  *(void *)&buf[16] = v49 + 232;
  *(void *)&buf[24] = v30;
  LODWORD(v30) = *(_DWORD *)(v49 + 248);
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)buf);
  *(unsigned char *)(v49 + 440) = v30 != 0;
  if (__p) {
    operator delete(__p);
  }
  id v6 = v47;
  if (!v44)
  {
    id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    ClientEntry::getAssignedChannelIDs((ClientEntry *)&__p, v49);
    unint64_t v33 = (int *)__p;
    unint64_t v34 = v52;
    if (((char *)v52 - (unsigned char *)__p) >> 3 >= v45) {
      LODWORD(v35) = v45;
    }
    else {
      uint64_t v35 = ((char *)v52 - (unsigned char *)__p) >> 3;
    }
    if (kHCHNScope)
    {
      uint64_t v36 = *(id *)kHCHNScope;
      if (!v36)
      {
        do
        {
LABEL_58:
          if (v34 == v33) {
            break;
          }
          uint64_t v41 = *((void *)v34 - 1);
          v34 -= 2;
          unint64_t v42 = [NSNumber numberWithUnsignedLong:v41];
          [v32 addObject:v42];

          [(AVHapticServer *)v46->_master incrementChannelID];
          LODWORD(v35) = v35 - 1;
        }
        while (v35);
        (*((void (**)(id, id, void))v47 + 2))(v47, v32, 0);
        if (v33) {
          operator delete(v33);
        }

        goto LABEL_63;
      }
    }
    else
    {
      uint64_t v36 = MEMORY[0x1E4F14500];
      id v40 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1435;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[AVHapticServerInstance requestChannels:reply:]";
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v35;
      _os_log_impl(&dword_1A3931000, v36, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Placing %u assigned channel IDs in output NSArray", buf, 0x22u);
    }

    goto LABEL_58;
  }
  if (kHCHNScope)
  {
    float v31 = *(id *)kHCHNScope;
    if (!v31) {
      goto LABEL_53;
    }
  }
  else
  {
    float v31 = MEMORY[0x1E4F14500];
    id v37 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    unint64_t v38 = v46->_clientID;
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1421;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "-[AVHapticServerInstance requestChannels:reply:]";
    *(_WORD *)&buf[28] = 2048;
    *(void *)&buf[30] = v38;
    _os_log_impl(&dword_1A3931000, v31, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: clientID: 0x%lx - failed to get more channels!", buf, 0x26u);
  }

LABEL_53:
  v39 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:v44 userInfo:0];
  (*((void (**)(id, void, void *))v47 + 2))(v47, 0, v39);

LABEL_63:
  if (v50) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v50);
  }
  objc_sync_exit(v10);
}

- (void)releaseChannels
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (kHCHNScope)
  {
    v3 = *(id *)kHCHNScope;
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unint64_t clientID = self->_clientID;
    *(_DWORD *)v7 = 136315906;
    *(void *)&v7[4] = "AVHapticServer.mm";
    *(_WORD *)&v7[12] = 1024;
    *(_DWORD *)&v7[14] = 1398;
    __int16 v8 = 2080;
    id v9 = "-[AVHapticServerInstance releaseChannels]";
    __int16 v10 = 2048;
    unint64_t v11 = clientID;
    _os_log_impl(&dword_1A3931000, v3, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx", v7, 0x26u);
  }

LABEL_8:
  master = self->_master;
  if (master)
  {
    [(AVHapticServer *)master entryWithID:self->_clientID];
    if (*(void *)v7) {
      ClientEntry::clearAssignedChannels(*(ClientEntry **)v7);
    }
  }
  else
  {
    *(void *)v7 = 0;
    *(void *)&v7[8] = 0;
  }
  if (*(void *)&v7[8]) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&v7[8]);
  }
}

- (void)setPlayerBehavior:(unint64_t)a3 reply:(id)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void *))a4;
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
    unint64_t clientID = self->_clientID;
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1385;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "-[AVHapticServerInstance setPlayerBehavior:reply:]";
    *(_WORD *)&buf[28] = 2048;
    *(void *)&buf[30] = clientID;
    *(_WORD *)&buf[38] = 1024;
    LODWORD(v63) = a3;
    _os_log_impl(&dword_1A3931000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx behavior: %u", buf, 0x2Cu);
  }

LABEL_8:
  __int16 v10 = self->_master;
  objc_sync_enter(v10);
  master = self->_master;
  if (!master)
  {
    int v15 = 0;
    uint64_t v48 = 0;
    goto LABEL_31;
  }
  [(AVHapticServer *)master entryWithID:self->_clientID];
  if (!v47)
  {
    int v15 = 0;
    goto LABEL_31;
  }
  uint64_t v12 = [(AVHapticServer *)self->_master manager];
  if (v48) {
    atomic_fetch_add_explicit(&v48->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (a3 >= 0x400)
  {
    if (kHSRVScope)
    {
      int v16 = *(id *)kHSRVScope;
      if (!v16) {
        goto LABEL_29;
      }
    }
    else
    {
      int v16 = MEMORY[0x1E4F14500];
      id v18 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "ServerManager.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1234;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "setClientPlayerBehavior";
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = a3;
      _os_log_impl(&dword_1A3931000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Illegal or unsupported player behavior: 0x%x", buf, 0x22u);
    }

LABEL_29:
    int v15 = -4800;
    if (!v48) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  BOOL routeUsesReceiver = self->_routeUsesReceiver;
  uint64_t v49 = 0;
  BOOL v50 = &v49;
  uint64_t v51 = 0x2020000000;
  int v52 = 0;
  if ((~(_BYTE)a3 & 0x11) == 0)
  {
    if (kHSRVScope)
    {
      unint64_t v14 = *(id *)kHSRVScope;
      if (!v14)
      {
LABEL_41:
        int v15 = -4800;
        goto LABEL_108;
      }
    }
    else
    {
      unint64_t v14 = MEMORY[0x1E4F14500];
      id v20 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "ServerManager.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1246;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "setClientPlayerBehavior";
      _os_log_impl(&dword_1A3931000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Cannot set both haptics-only and audio-only", buf, 0x1Cu);
    }

    goto LABEL_41;
  }
  BOOL v46 = routeUsesReceiver;
  if (kHSRVScope)
  {
    id v17 = *(id *)kHSRVScope;
    if (!v17) {
      goto LABEL_50;
    }
  }
  else
  {
    id v17 = MEMORY[0x1E4F14500];
    id v21 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = *(void *)(v47 + 24);
    __int16 v23 = "audio-only";
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "ServerManager.mm";
    if ((a3 & 0x10) == 0) {
      __int16 v23 = "haptics+audio";
    }
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1250;
    *(void *)&buf[20] = "setClientPlayerBehavior";
    *(_WORD *)&buf[28] = 2048;
    *(_WORD *)&buf[18] = 2080;
    if (a3) {
      __int16 v23 = "haptics-only";
    }
    *(void *)&buf[30] = v22;
    *(_WORD *)&buf[38] = 2080;
    v63 = v23;
    _os_log_impl(&dword_1A3931000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client ID 0x%lx -> %s mode", buf, 0x30u);
  }

LABEL_50:
  unint64_t v24 = (*(void *)(v47 + 96) & 0xFFFFFFFFFFFFFFFCLL | (2 * (a3 & 1)) | ((a3 & 0x10) >> 4)) ^ 3;
  *(void *)(v47 + 96) = v24;
  if ((~(_BYTE)a3 & 5) != 0) {
    goto LABEL_59;
  }
  if (!kHSRVScope)
  {
    int v25 = MEMORY[0x1E4F14500];
    id v26 = MEMORY[0x1E4F14500];
    goto LABEL_55;
  }
  int v25 = *(id *)kHSRVScope;
  if (v25)
  {
LABEL_55:
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = *(void *)(v47 + 24);
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "ServerManager.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1256;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "setClientPlayerBehavior";
      *(_WORD *)&buf[28] = 2048;
      *(void *)&buf[30] = v27;
      _os_log_impl(&dword_1A3931000, v25, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Haptics-only client ID 0x%lx will not activate its audio session when starting", buf, 0x26u);
    }
  }
  unint64_t v24 = *(void *)(v47 + 96) | 0x40;
  *(void *)(v47 + 96) = v24;
LABEL_59:
  if (((v24 >> 2) & 1) == ((a3 >> 1) & 1)) {
    goto LABEL_75;
  }
  *(void *)(v47 + 96) = v24 & 0xFFFFFFFFFFFFFFFBLL | (2 * (a3 & 2));
  if (!kHSRVScope)
  {
    unint64_t v28 = MEMORY[0x1E4F14500];
    id v29 = MEMORY[0x1E4F14500];
    goto LABEL_64;
  }
  unint64_t v28 = *(id *)kHSRVScope;
  if (v28)
  {
LABEL_64:
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(void *)&uint8_t buf[4] = "ServerManager.mm";
      uint64_t v30 = "now";
      uint64_t v31 = *(void *)(v47 + 24);
      *(_DWORD *)buf = 136316162;
      *(_WORD *)&unsigned char buf[12] = 1024;
      if ((a3 & 2) == 0) {
        uint64_t v30 = "no longer";
      }
      *(_DWORD *)&buf[14] = 1266;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "setClientPlayerBehavior";
      *(_WORD *)&buf[28] = 2048;
      *(void *)&buf[30] = v31;
      *(_WORD *)&buf[38] = 2080;
      v63 = v30;
      _os_log_impl(&dword_1A3931000, v28, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client ID 0x%lx %s follows default route - updating mute state", buf, 0x30u);
    }
  }
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3321888768;
  *(void *)&buf[16] = ___ZN13ServerManager23setClientPlayerBehaviorENSt3__110shared_ptrI11ClientEntryEEmb_block_invoke;
  *(void *)&buf[24] = &unk_1EF72FCB8;
  *(void *)&buf[32] = &v49;
  v63 = v12;
  uint64_t v64 = v47;
  uint64_t v65 = v48;
  if (v48) {
    atomic_fetch_add_explicit(&v48->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  BOOL v66 = v46;
  id v32 = buf;
  if (AudioControlQueue(void)::once != -1) {
    dispatch_once(&AudioControlQueue(void)::once, &__block_literal_global_8);
  }
  id v33 = (id)AudioControlQueue(void)::gAudioControlQueue;
  AT::DispatchBlock(v33, v32, 0, (uint64_t)"executeSync", (uint64_t)"ServerManager.mm", 327);

  if (v65) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v65);
  }
LABEL_75:
  uint64_t v34 = *(void *)(v47 + 96);
  if (((v34 >> 3) & 1) != ((a3 >> 5) & 1))
  {
    if (kHMUTScope)
    {
      if (*(unsigned char *)(kHMUTScope + 8))
      {
        uint64_t v35 = *(id *)kHMUTScope;
        if (v35)
        {
          uint64_t v36 = v35;
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v37 = *(void *)(v47 + 24);
            *(_DWORD *)uint64_t v53 = 136316162;
            int v54 = "ClientEntry.mm";
            int v56 = 768;
            __int16 v57 = 2080;
            __int16 v55 = 1024;
            v58 = "setAudioBehaviorMuted";
            __int16 v59 = 1024;
            *(_DWORD *)uint64_t v60 = v37;
            *(_WORD *)&v60[4] = 1024;
            *(_DWORD *)&v60[6] = (a3 >> 5) & 1;
            _os_log_impl(&dword_1A3931000, v36, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: client ID: 0x%x, mute all audio on this client: %d", v53, 0x28u);
          }
        }
      }
    }
    *(void *)(v47 + 96) = *(void *)(v47 + 96) & 0xFFFFFFFFFFFFFFF7 | ((a3 & 0x20) >> 2);
    ClientEntry::muteAudio(v47, (a3 & 0x20) != 0, 6, 0.0);
    uint64_t v34 = *(void *)(v47 + 96);
  }
  if (((v34 >> 4) & 1) != ((a3 >> 6) & 1))
  {
    if (kHMUTScope)
    {
      if (*(unsigned char *)(kHMUTScope + 8))
      {
        unint64_t v38 = *(id *)kHMUTScope;
        if (v38)
        {
          v39 = v38;
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v40 = *(void *)(v47 + 24);
            *(_DWORD *)uint64_t v53 = 136316162;
            int v54 = "ClientEntry.mm";
            int v56 = 774;
            __int16 v57 = 2080;
            __int16 v55 = 1024;
            v58 = "setHapticsBehaviorMuted";
            __int16 v59 = 1024;
            *(_DWORD *)uint64_t v60 = v40;
            *(_WORD *)&v60[4] = 1024;
            *(_DWORD *)&v60[6] = (a3 >> 6) & 1;
            _os_log_impl(&dword_1A3931000, v39, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: client ID: 0x%x, mute all haptics on this client: %d", v53, 0x28u);
          }
        }
      }
    }
    *(void *)(v47 + 96) = *(void *)(v47 + 96) & 0xFFFFFFFFFFFFFFEFLL | ((a3 & 0x40) >> 2);
    (*(void (**)(uint64_t, BOOL, uint64_t, double))(*(void *)v47 + 48))(v47, (a3 & 0x40) != 0, 6, 0.0);
    uint64_t v34 = *(void *)(v47 + 96);
  }
  unint64_t v41 = a3 & 0x200;
  if ((v41 == 0) == ((v34 & 0x100) == 0)) {
    goto LABEL_103;
  }
  if (!kHMUTScope)
  {
    unint64_t v42 = MEMORY[0x1E4F14500];
    id v43 = MEMORY[0x1E4F14500];
    goto LABEL_96;
  }
  unint64_t v42 = *(id *)kHMUTScope;
  if (v42)
  {
LABEL_96:
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v44 = *(void *)(v47 + 24);
      unint64_t v45 = "no longer";
      *(_DWORD *)uint64_t v53 = 136316162;
      int v54 = "ServerManager.mm";
      __int16 v55 = 1024;
      if ((a3 & 0x200) == 0) {
        unint64_t v45 = "now";
      }
      int v56 = 1287;
      __int16 v57 = 2080;
      v58 = "setClientPlayerBehavior";
      __int16 v59 = 2048;
      *(void *)uint64_t v60 = v44;
      *(_WORD *)&v60[8] = 2080;
      v61 = v45;
      _os_log_impl(&dword_1A3931000, v42, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client ID 0x%lx will %s mute haptics while device is recording", v53, 0x30u);
    }
  }
  *(void *)(v47 + 96) = *(void *)(v47 + 96) & 0xFFFFFFFFFFFFFEFFLL | (v41 >> 1);
  if (*(unsigned char *)(*(void *)(v47 + 224) + 473)) {
    (*(void (**)(uint64_t, BOOL, uint64_t, double))(*(void *)v47 + 48))(v47, v41 == 0, 1, 0.0);
  }
LABEL_103:
  if ((a3 & 0x80) != 0) {
    *(_DWORD *)(v47 + 104) = 1003;
  }
  if ((a3 & 0x100) != 0) {
    *(unsigned char *)(v47 + 108) = 1;
  }
  int v15 = *((_DWORD *)v50 + 6);
LABEL_108:
  _Block_object_dispose(&v49, 8);
  if (v48) {
LABEL_30:
  }
    std::__shared_weak_count::__release_shared[abi:ne180100](v48);
LABEL_31:
  if (v48) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v48);
  }
  objc_sync_exit(v10);

  if (v15)
  {
    id v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:v15 userInfo:0];
  }
  else
  {
    id v19 = 0;
  }
  v6[2](v6, v19);
}

- (void)getHapticLatency:(id)a3
{
  id v4 = (void (**)(id, void *, double))a3;
  v5 = self->_master;
  objc_sync_enter(v5);
  master = self->_master;
  if (master)
  {
    [(AVHapticServer *)master entryWithID:self->_clientID];
    master = self->_master;
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v12 = 0;
  }
  uint64_t v7 = [(AVHapticServer *)master manager];
  double v8 = (*(double (**)(void, uint64_t, uint64_t))(**(void **)(v7 + 232) + 120))(*(void *)(v7 + 232), (*(void *)(v11 + 96) >> 1) & 1, 9999999);
  if (v8 <= 0.0)
  {
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4806 userInfo:0];
  }
  else
  {
    id v9 = 0;
  }
  v4[2](v4, v9, v8);

  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  objc_sync_exit(v5);
}

- (void)stopRunning:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (kHSRVScope)
  {
    v5 = *(id *)kHSRVScope;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t clientID = self->_clientID;
    *(_DWORD *)buf = 136315906;
    uint64_t v35 = "AVHapticServer.mm";
    __int16 v36 = 1024;
    int v37 = 1342;
    __int16 v38 = 2080;
    v39 = "-[AVHapticServerInstance stopRunning:]";
    __int16 v40 = 2048;
    unint64_t v41 = clientID;
    _os_log_impl(&dword_1A3931000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: [via xpc] clientID: 0x%lx", buf, 0x26u);
  }

LABEL_8:
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  int v33 = 0;
  double v8 = self->_master;
  objc_sync_enter(v8);
  master = self->_master;
  if (master)
  {
    [(AVHapticServer *)master entryWithID:self->_clientID];
    if (v28)
    {
      objc_initWeak(&location, self->_master);
      if (kHSRVScope)
      {
        if (*(unsigned char *)(kHSRVScope + 8))
        {
          uint64_t v10 = *(id *)kHSRVScope;
          if (v10)
          {
            uint64_t v11 = v10;
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315650;
              uint64_t v35 = "AVHapticServer.mm";
              __int16 v36 = 1024;
              int v37 = 1349;
              __int16 v38 = 2080;
              v39 = "-[AVHapticServerInstance stopRunning:]";
              _os_log_impl(&dword_1A3931000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Dispatching doStopRunning on ACQ", buf, 0x1Cu);
            }
          }
        }
      }
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3321888768;
      id v21 = __38__AVHapticServerInstance_stopRunning___block_invoke;
      uint64_t v22 = &unk_1EF728C18;
      objc_copyWeak(v25, &location);
      unint64_t v24 = &v30;
      v25[1] = v28;
      id v26 = v29;
      if (v29) {
        atomic_fetch_add_explicit(&v29->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      __int16 v23 = self;
      if (AudioControlQueue(void)::once != -1) {
        dispatch_once(&AudioControlQueue(void)::once, &__block_literal_global_8);
      }
      id v12 = (id)AudioControlQueue(void)::gAudioControlQueue;
      AT::DispatchBlock(v12, &v19, 0, (uint64_t)"-[AVHapticServerInstance stopRunning:]", (uint64_t)"AVHapticServer.mm", 1357);

      if (_os_feature_enabled_impl()
        && [(AVHapticServerInstance *)self runIncludesAudio])
      {
        (*(void (**)(HapticSession *, void))(*(void *)self->_hapticSession.__ptr_ + 56))(self->_hapticSession.__ptr_, 0);
      }
      if (v26) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v26);
      }
      objc_destroyWeak(v25);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    unint64_t v28 = 0;
    id v29 = 0;
  }
  if (v29) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v29);
  }
  objc_sync_exit(v8);

  uint64_t v13 = *((int *)v31 + 6);
  if (v13)
  {
    unint64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:v13 userInfo:0];
  }
  else
  {
    unint64_t v14 = 0;
  }
  if (kHSRVScope)
  {
    id v15 = *(id *)kHSRVScope;
    if (!v15) {
      goto LABEL_39;
    }
  }
  else
  {
    id v15 = (id)MEMORY[0x1E4F14500];
    id v16 = MEMORY[0x1E4F14500];
  }
  id v17 = v15;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = _Block_copy(v4);
    *(_DWORD *)buf = 136315906;
    uint64_t v35 = "AVHapticServer.mm";
    __int16 v36 = 1024;
    int v37 = 1364;
    __int16 v38 = 2080;
    v39 = "-[AVHapticServerInstance stopRunning:]";
    __int16 v40 = 2048;
    unint64_t v41 = (unint64_t)v18;
    _os_log_impl(&dword_1A3931000, v17, OS_LOG_TYPE_INFO, "%25s:%-5d %s: invoking callback %p", buf, 0x26u);
  }
LABEL_39:
  (*((void (**)(id, void *))v4 + 2))(v4, v14);
  _Block_object_dispose(&v30, 8);
}

void __38__AVHapticServerInstance_stopRunning___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

  if (!WeakRetained)
  {
    if (kHSRVScope)
    {
      id v4 = *(id *)kHSRVScope;
      if (!v4)
      {
LABEL_9:
        *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -4898;
        goto LABEL_10;
      }
    }
    else
    {
      id v4 = MEMORY[0x1E4F14500];
      id v5 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v11 = "AVHapticServer.mm";
      __int16 v12 = 1024;
      int v13 = 1353;
      _os_log_impl(&dword_1A3931000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: Haptic server master is nil - cannot stop!", buf, 0x12u);
    }

    goto LABEL_9;
  }
LABEL_10:
  id v6 = objc_loadWeakRetained(v2);
  uint64_t v7 = *(std::__shared_weak_count **)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 56);
  id v9 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  objc_msgSend(v6, "doStopRunning:audio:haptics:", &v8, objc_msgSend(*(id *)(a1 + 32), "runIncludesAudio", v8), objc_msgSend(*(id *)(a1 + 32), "runIncludesHaptics"));
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
}

- (void)stopRunning
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (kHSRVScope)
  {
    v3 = *(id *)kHSRVScope;
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t clientID = self->_clientID;
    *(_DWORD *)buf = 136315906;
    id v17 = "AVHapticServer.mm";
    __int16 v18 = 1024;
    int v19 = 1323;
    __int16 v20 = 2080;
    id v21 = "-[AVHapticServerInstance stopRunning]";
    __int16 v22 = 2048;
    unint64_t v23 = clientID;
    _os_log_impl(&dword_1A3931000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: [via xpc] clientID: 0x%lx", buf, 0x26u);
  }

LABEL_8:
  id v6 = self->_master;
  objc_sync_enter(v6);
  master = self->_master;
  if (master)
  {
    [(AVHapticServer *)master entryWithID:self->_clientID];
    uint64_t v8 = v14;
    if (v14)
    {
      if (kHSRVScope)
      {
        if (*(unsigned char *)(kHSRVScope + 8))
        {
          id v9 = *(id *)kHSRVScope;
          if (v9)
          {
            uint64_t v10 = v9;
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315650;
              id v17 = "AVHapticServer.mm";
              __int16 v18 = 1024;
              int v19 = 1327;
              __int16 v20 = 2080;
              id v21 = "-[AVHapticServerInstance stopRunning]";
              _os_log_impl(&dword_1A3931000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Dispatching doStopRunning on ACQ", buf, 0x1Cu);
            }

            uint64_t v8 = v14;
          }
        }
      }
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3321888768;
      v12[2] = __37__AVHapticServerInstance_stopRunning__block_invoke;
      v12[3] = &unk_1EF728C88;
      v12[4] = self;
      v12[5] = v8;
      int v13 = v15;
      if (v15) {
        atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      if (AudioControlQueue(void)::once != -1) {
        dispatch_once(&AudioControlQueue(void)::once, &__block_literal_global_8);
      }
      id v11 = (id)AudioControlQueue(void)::gAudioControlQueue;
      AT::DispatchBlock(v11, v12, 0, (uint64_t)"-[AVHapticServerInstance stopRunning]", (uint64_t)"AVHapticServer.mm", 1332);

      if (_os_feature_enabled_impl()
        && [(AVHapticServerInstance *)self runIncludesAudio])
      {
        (*(void (**)(HapticSession *, void))(*(void *)self->_hapticSession.__ptr_ + 56))(self->_hapticSession.__ptr_, 0);
      }
      if (v13) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v13);
      }
    }
  }
  else
  {
    uint64_t v14 = 0;
    id v15 = 0;
  }
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  objc_sync_exit(v6);
}

void __37__AVHapticServerInstance_stopRunning__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setWasRunningAndSuspended:0];
  v2 = [*(id *)(a1 + 32) master];
  v3 = *(std::__shared_weak_count **)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  objc_msgSend(v2, "doStopRunning:audio:haptics:", &v4, objc_msgSend(*(id *)(a1 + 32), "runIncludesAudio", v4), objc_msgSend(*(id *)(a1 + 32), "runIncludesHaptics"));
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
}

- (void)startRunning:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
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
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t clientID = self->_clientID;
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1295;
    __int16 v28 = 2080;
    id v29 = "-[AVHapticServerInstance startRunning:]";
    __int16 v30 = 2048;
    unint64_t v31 = clientID;
    _os_log_impl(&dword_1A3931000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: [via xpc] clientID: 0x%lx", buf, 0x26u);
  }

LABEL_8:
  uint64_t v8 = self->_master;
  objc_sync_enter(v8);
  if (kHSRVScope)
  {
    if (*(unsigned char *)(kHSRVScope + 8))
    {
      id v9 = *(id *)kHSRVScope;
      if (v9)
      {
        uint64_t v10 = v9;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
          *(_WORD *)&unsigned char buf[12] = 1024;
          *(_DWORD *)&buf[14] = 1299;
          __int16 v28 = 2080;
          id v29 = "-[AVHapticServerInstance startRunning:]";
          _os_log_impl(&dword_1A3931000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Dispatching unmuteClientAfterSessionInterruption on ACQ", buf, 0x1Cu);
        }
      }
    }
  }
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __39__AVHapticServerInstance_startRunning___block_invoke;
  v26[3] = &unk_1E5B15DE8;
  v26[4] = self;
  if (AudioControlQueue(void)::once != -1) {
    dispatch_once(&AudioControlQueue(void)::once, &__block_literal_global_8);
  }
  id v11 = (id)AudioControlQueue(void)::gAudioControlQueue;
  AT::DispatchBlock(v11, v26, 0, (uint64_t)"-[AVHapticServerInstance startRunning:]", (uint64_t)"AVHapticServer.mm", 1302);

  master = self->_master;
  if (!master)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    goto LABEL_24;
  }
  [(AVHapticServer *)master entryWithID:self->_clientID];
  if (!*(void *)buf)
  {
LABEL_24:
    int v14 = -4812;
    goto LABEL_25;
  }
  [(AVHapticServerInstance *)self setWasRunningAndSuspended:0];
  objc_initWeak(&location, self);
  int v13 = [(AVHapticServerInstance *)self master];
  uint64_t v23 = *(void *)buf;
  uint64_t v24 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8]) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 1uLL, memory_order_relaxed);
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __39__AVHapticServerInstance_startRunning___block_invoke_2;
  v21[3] = &unk_1E5B14820;
  objc_copyWeak(&v22, &location);
  int v14 = [v13 doStartRunning:&v23 completedBlock:v21];
  if (v24) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v24);
  }

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
LABEL_25:
  if (*(void *)&buf[8]) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
  }
  objc_sync_exit(v8);

  if (v14)
  {
    id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:v14 userInfo:0];
  }
  else
  {
    id v15 = 0;
  }
  if (kHSRVScope)
  {
    id v16 = *(id *)kHSRVScope;
    if (!v16) {
      goto LABEL_42;
    }
  }
  else
  {
    id v16 = (id)MEMORY[0x1E4F14500];
    id v17 = MEMORY[0x1E4F14500];
  }
  __int16 v18 = v16;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    int v19 = _Block_copy(v4);
    if (v15)
    {
      __int16 v20 = [v15 localizedDescription];
    }
    else
    {
      __int16 v20 = @"(no err)";
    }
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1317;
    __int16 v28 = 2080;
    id v29 = "-[AVHapticServerInstance startRunning:]";
    __int16 v30 = 2048;
    unint64_t v31 = (unint64_t)v19;
    __int16 v32 = 2112;
    int v33 = v20;
    _os_log_impl(&dword_1A3931000, v18, OS_LOG_TYPE_INFO, "%25s:%-5d %s: invoking callback %p: %@", buf, 0x30u);
    if (v15) {
  }
    }
LABEL_42:
  (*((void (**)(id, void *))v4 + 2))(v4, v15);
}

uint64_t __39__AVHapticServerInstance_startRunning___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) unmuteClientAfterSessionInterruption:0.0];
}

void __39__AVHapticServerInstance_startRunning___block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a3) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = *(unsigned char *)(*(void *)a2 + 96) & 1;
  }
  id v6 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setRunIncludesHaptics:v5];

  id v8 = objc_loadWeakRetained(v6);
  int v9 = [v8 runIncludesHaptics];

  if (!v9) {
    goto LABEL_12;
  }
  if (kHSRVScope)
  {
    uint64_t v10 = *(id *)kHSRVScope;
    if (!v10) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v10 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315650;
    int v19 = "AVHapticServer.mm";
    __int16 v20 = 1024;
    int v21 = 1310;
    __int16 v22 = 2080;
    uint64_t v23 = "-[AVHapticServerInstance startRunning:]_block_invoke_2";
    _os_log_impl(&dword_1A3931000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: runIncludesHaptics set to YES for this client", (uint8_t *)&v18, 0x1Cu);
  }

LABEL_12:
  if (a3) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = (*(unsigned __int8 *)(*(void *)a2 + 96) >> 1) & 1;
  }
  id v13 = objc_loadWeakRetained(v6);
  [v13 setRunIncludesAudio:v12];

  id v14 = objc_loadWeakRetained(v6);
  int v15 = [v14 runIncludesAudio];

  if (v15)
  {
    if (kHSRVScope)
    {
      id v16 = *(id *)kHSRVScope;
      if (!v16) {
        return;
      }
    }
    else
    {
      id v16 = MEMORY[0x1E4F14500];
      id v17 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315650;
      int v19 = "AVHapticServer.mm";
      __int16 v20 = 1024;
      int v21 = 1312;
      __int16 v22 = 2080;
      uint64_t v23 = "-[AVHapticServerInstance startRunning:]_block_invoke";
      _os_log_impl(&dword_1A3931000, v16, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: runIncludesAudio set to YES for this client", (uint8_t *)&v18, 0x1Cu);
    }
  }
}

- (void)stopPrewarm
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (kHSRVScope)
  {
    v3 = *(id *)kHSRVScope;
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unint64_t clientID = self->_clientID;
    *(_DWORD *)buf = 136315906;
    id v17 = "AVHapticServer.mm";
    __int16 v18 = 1024;
    int v19 = 1281;
    __int16 v20 = 2080;
    int v21 = "-[AVHapticServerInstance stopPrewarm]";
    __int16 v22 = 2048;
    unint64_t v23 = clientID;
    _os_log_impl(&dword_1A3931000, v3, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx", buf, 0x26u);
  }

LABEL_8:
  master = self->_master;
  if (master)
  {
    [(AVHapticServer *)master entryWithID:self->_clientID];
    if (v14)
    {
      objc_initWeak(&location, self->_master);
      if (kHSRVScope)
      {
        if (*(unsigned char *)(kHSRVScope + 8))
        {
          uint64_t v7 = *(id *)kHSRVScope;
          if (v7)
          {
            id v8 = v7;
            if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315650;
              id v17 = "AVHapticServer.mm";
              __int16 v18 = 1024;
              int v19 = 1285;
              __int16 v20 = 2080;
              int v21 = "-[AVHapticServerInstance stopPrewarm]";
              _os_log_impl(&dword_1A3931000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Dispatching doStopPrewarm on ACQ", buf, 0x1Cu);
            }
          }
        }
      }
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3321888768;
      v10[2] = __37__AVHapticServerInstance_stopPrewarm__block_invoke;
      v10[3] = &unk_1EF728C50;
      v10[4] = self;
      objc_copyWeak(v11, &location);
      v11[1] = v14;
      uint64_t v12 = v15;
      if (v15) {
        atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      if (AudioControlQueue(void)::once != -1) {
        dispatch_once(&AudioControlQueue(void)::once, &__block_literal_global_8);
      }
      id v9 = (id)AudioControlQueue(void)::gAudioControlQueue;
      AT::DispatchBlock(v9, v10, 0, (uint64_t)"-[AVHapticServerInstance stopPrewarm]", (uint64_t)"AVHapticServer.mm", 1289);

      if (v12) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v12);
      }
      objc_destroyWeak(v11);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    id v14 = 0;
    int v15 = 0;
  }
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
}

void __37__AVHapticServerInstance_stopPrewarm__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setWasPrewarmedAndSuspended:0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(std::__shared_weak_count **)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  objc_msgSend(WeakRetained, "doStopPrewarm:audio:haptics:", &v4, objc_msgSend(*(id *)(a1 + 32), "prewarmIncludesAudio", v4), objc_msgSend(*(id *)(a1 + 32), "prewarmIncludesHaptics"));
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
}

- (void)prewarm:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (kHSRVScope)
  {
    uint64_t v5 = *(id *)kHSRVScope;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unint64_t clientID = self->_clientID;
    *(_DWORD *)buf = 136315906;
    id v29 = "AVHapticServer.mm";
    __int16 v30 = 1024;
    int v31 = 1260;
    __int16 v32 = 2080;
    int v33 = "-[AVHapticServerInstance prewarm:]";
    __int16 v34 = 2048;
    unint64_t v35 = clientID;
    _os_log_impl(&dword_1A3931000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx", buf, 0x26u);
  }

LABEL_8:
  uint64_t v24 = 0;
  int v25 = &v24;
  uint64_t v26 = 0x2020000000;
  int v27 = -4812;
  master = self->_master;
  if (master)
  {
    [(AVHapticServer *)master entryWithID:self->_clientID];
    if (v22)
    {
      objc_initWeak(&location, self->_master);
      if (kHSRVScope)
      {
        if (*(unsigned char *)(kHSRVScope + 8))
        {
          id v9 = *(id *)kHSRVScope;
          if (v9)
          {
            uint64_t v10 = v9;
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315650;
              id v29 = "AVHapticServer.mm";
              __int16 v30 = 1024;
              int v31 = 1266;
              __int16 v32 = 2080;
              int v33 = "-[AVHapticServerInstance prewarm:]";
              _os_log_impl(&dword_1A3931000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Dispatching doPrewarm on ACQ", buf, 0x1Cu);
            }
          }
        }
      }
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3321888768;
      v18[2] = __34__AVHapticServerInstance_prewarm___block_invoke;
      v18[3] = &unk_1EF728C18;
      v18[4] = self;
      v18[5] = &v24;
      objc_copyWeak(v19, &location);
      v19[1] = v22;
      __int16 v20 = v23;
      if (v23) {
        atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      if (AudioControlQueue(void)::once != -1) {
        dispatch_once(&AudioControlQueue(void)::once, &__block_literal_global_8);
      }
      id v11 = (id)AudioControlQueue(void)::gAudioControlQueue;
      AT::DispatchBlock(v11, v18, 0, (uint64_t)"-[AVHapticServerInstance prewarm:]", (uint64_t)"AVHapticServer.mm", 1272);

      if (v20) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v20);
      }
      objc_destroyWeak(v19);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    __int16 v22 = 0;
    unint64_t v23 = 0;
  }
  uint64_t v12 = *((int *)v25 + 6);
  if (v12)
  {
    id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:v12 userInfo:0];
  }
  else
  {
    id v13 = 0;
  }
  if (kHSRVScope)
  {
    id v14 = *(id *)kHSRVScope;
    if (!v14) {
      goto LABEL_34;
    }
  }
  else
  {
    id v14 = (id)MEMORY[0x1E4F14500];
    id v15 = MEMORY[0x1E4F14500];
  }
  id v16 = v14;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = _Block_copy(v4);
    *(_DWORD *)buf = 136316162;
    id v29 = "AVHapticServer.mm";
    __int16 v30 = 1024;
    int v31 = 1275;
    __int16 v32 = 2080;
    int v33 = "-[AVHapticServerInstance prewarm:]";
    __int16 v34 = 2048;
    unint64_t v35 = (unint64_t)v17;
    __int16 v36 = 2112;
    int v37 = v13;
    _os_log_impl(&dword_1A3931000, v16, OS_LOG_TYPE_INFO, "%25s:%-5d %s: invoking callback %p with %@", buf, 0x30u);
  }
LABEL_34:
  (*((void (**)(id, void *))v4 + 2))(v4, v13);
  if (v23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v23);
  }
  _Block_object_dispose(&v24, 8);
}

uint64_t __34__AVHapticServerInstance_prewarm___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setWasPrewarmedAndSuspended:0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  id v4 = *(std::__shared_weak_count **)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 56);
  id v9 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [WeakRetained doPrewarm:&v8];
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }

  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = *(unsigned char *)(*(void *)(a1 + 56) + 96) & 1;
  }
  objc_msgSend(*(id *)(a1 + 32), "setPrewarmIncludesHaptics:", v5, v8);
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = (*(unsigned __int8 *)(*(void *)(a1 + 56) + 96) >> 1) & 1;
  }
  return [*(id *)(a1 + 32) setPrewarmIncludesAudio:v6];
}

- (void)detachSequence:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (kHSRVScope)
  {
    uint64_t v5 = *(id *)kHSRVScope;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unint64_t clientID = self->_clientID;
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1249;
    *(_WORD *)&unsigned char buf[18] = 2080;
    *(void *)&buf[20] = "-[AVHapticServerInstance detachSequence:]";
    *(_WORD *)&buf[28] = 2048;
    *(void *)&buf[30] = clientID;
    _os_log_impl(&dword_1A3931000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx", buf, 0x26u);
  }

LABEL_8:
  master = self->_master;
  if (!master)
  {
    id v16 = 0;
    goto LABEL_26;
  }
  [(AVHapticServer *)master entryWithID:self->_clientID];
  if (!v15) {
    goto LABEL_26;
  }
  id v9 = [(AVHapticServer *)self->_master manager];
  if (v16) {
    atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (!kHSEQScope)
  {
    uint64_t v10 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
    goto LABEL_17;
  }
  uint64_t v10 = *(id *)kHSEQScope;
  if (v10)
  {
LABEL_17:
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = *(void *)(v15 + 24);
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = "ServerManager.mm";
      *(_DWORD *)&buf[14] = 1219;
      *(_WORD *)&unsigned char buf[18] = 2080;
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(void *)&buf[20] = "detachSequence";
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v12;
      *(_WORD *)&buf[34] = 1024;
      *(_DWORD *)&buf[36] = a3;
      _os_log_impl(&dword_1A3931000, v10, OS_LOG_TYPE_INFO, "%25s:%-5d %s: client ID: 0x%x, asychronously detaching sequence with ID %u after 2-second delay", buf, 0x28u);
    }
  }
  dispatch_time_t v13 = dispatch_time(0, 2000000000);
  id v14 = v9[60];
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3321888768;
  *(void *)&buf[16] = ___ZN13ServerManager14detachSequenceENSt3__110shared_ptrI11ClientEntryEEm_block_invoke;
  *(void *)&buf[24] = &__block_descriptor_56_ea8_32c39_ZTSNSt3__110shared_ptrI11ClientEntryEE_e5_v8__0l;
  *(void *)&buf[32] = v15;
  __int16 v18 = v16;
  if (v16) {
    atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  unint64_t v19 = a3;
  dispatch_after(v13, v14, buf);
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }
LABEL_26:
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }
}

- (void)prepareHapticSequence:(unint64_t)a3 reply:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (kHSEQScope)
  {
    uint64_t v8 = *(id *)kHSEQScope;
    if (!v8) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v8 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    unint64_t clientID = self->_clientID;
    *(_DWORD *)buf = 136316162;
    __int16 v28 = "AVHapticServer.mm";
    __int16 v29 = 1024;
    int v30 = 1221;
    __int16 v31 = 2080;
    __int16 v32 = "-[AVHapticServerInstance prepareHapticSequence:reply:]";
    __int16 v33 = 2048;
    unint64_t v34 = clientID;
    __int16 v35 = 1024;
    LODWORD(v36) = a3;
    _os_log_impl(&dword_1A3931000, v8, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx seqID: %u", buf, 0x2Cu);
  }

LABEL_8:
  master = self->_master;
  if (!master)
  {
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    goto LABEL_17;
  }
  [(AVHapticServer *)master entryWithID:self->_clientID];
  if (!v25)
  {
LABEL_17:
    uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4812 userInfo:0];
    goto LABEL_20;
  }
  objc_initWeak((id *)buf, self);
  uint64_t v12 = [(AVHapticServer *)self->_master manager];
  dispatch_time_t v13 = v26;
  v24[0] = v25;
  v24[1] = (uint64_t)v26;
  if (v26) {
    atomic_fetch_add_explicit(&v26->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  int v21 = __54__AVHapticServerInstance_prepareHapticSequence_reply___block_invoke;
  __int16 v22 = &unk_1E5B147F8;
  objc_copyWeak(v23, (id *)buf);
  v23[1] = (id)a2;
  uint64_t v38 = 0;
  v37[0] = &unk_1EF728DE8;
  v37[1] = _Block_copy(&v19);
  uint64_t v38 = v37;
  int v14 = ServerManager::prepareSequence((uint64_t)v12, v24, a3, (uint64_t)v37);
  std::__function::__value_func<void ()(unsigned long)>::~__value_func[abi:ne180100](v37);
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  if (v14)
  {
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"com.apple.CoreHaptics", v14, 0, v19, v20, v21, v22);
  }
  else
  {
    uint64_t v15 = 0;
  }
  objc_destroyWeak(v23);
  objc_destroyWeak((id *)buf);
LABEL_20:
  if (kHSEQScope)
  {
    if (*(unsigned char *)(kHSEQScope + 8))
    {
      id v16 = *(id *)kHSEQScope;
      if (v16)
      {
        id v17 = v16;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          __int16 v18 = _Block_copy(v7);
          *(_DWORD *)buf = 136316162;
          __int16 v28 = "AVHapticServer.mm";
          __int16 v29 = 1024;
          int v30 = 1243;
          __int16 v31 = 2080;
          __int16 v32 = "-[AVHapticServerInstance prepareHapticSequence:reply:]";
          __int16 v33 = 2048;
          unint64_t v34 = (unint64_t)v18;
          __int16 v35 = 2112;
          __int16 v36 = v15;
          _os_log_impl(&dword_1A3931000, v17, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: invoking callback %p with %@", buf, 0x30u);
        }
      }
    }
  }
  (*((void (**)(id, void *))v7 + 2))(v7, v15);
  if (v26) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v26);
  }
}

void __54__AVHapticServerInstance_prepareHapticSequence_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = (void *)MEMORY[0x1A6252B00]();
    id v6 = [WeakRetained getAsyncDelegateForMethod:*(void *)(a1 + 40) errorHandler:&__block_literal_global_107];
    if (kHSRVScope)
    {
      id v7 = *(id *)kHSRVScope;
      if (!v7)
      {
LABEL_9:
        [v6 sequenceFinished:a2 error:0];

        goto LABEL_10;
      }
    }
    else
    {
      id v7 = MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315906;
      uint64_t v10 = "AVHapticServer.mm";
      __int16 v11 = 1024;
      int v12 = 1233;
      __int16 v13 = 2080;
      int v14 = "-[AVHapticServerInstance prepareHapticSequence:reply:]_block_invoke";
      __int16 v15 = 1024;
      int v16 = a2;
      _os_log_impl(&dword_1A3931000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: <Calling sequenceFinished: on client delegate for seqID %u>", (uint8_t *)&v9, 0x22u);
    }

    goto LABEL_9;
  }
LABEL_10:
}

void __54__AVHapticServerInstance_prepareHapticSequence_reply___block_invoke_2(uint64_t a1, void *a2)
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
  uint64_t v5 = v3;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = [v2 localizedDescription];
    int v7 = 136315906;
    id v8 = "AVHapticServer.mm";
    __int16 v9 = 1024;
    int v10 = 1231;
    __int16 v11 = 2080;
    int v12 = "-[AVHapticServerInstance prepareHapticSequence:reply:]_block_invoke_2";
    __int16 v13 = 2112;
    int v14 = v6;
    _os_log_impl(&dword_1A3931000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unable to notify client of sequence finish: %@", (uint8_t *)&v7, 0x26u);
  }
LABEL_8:
}

- (void)loadVibePattern:(id)a3 reply:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (kHSEQScope)
  {
    id v8 = *(id *)kHSEQScope;
    if (!v8) {
      goto LABEL_8;
    }
  }
  else
  {
    id v8 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    unint64_t clientID = self->_clientID;
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
    __int16 v22 = 1024;
    int v23 = 1201;
    __int16 v24 = 2080;
    uint64_t v25 = "-[AVHapticServerInstance loadVibePattern:reply:]";
    __int16 v26 = 2048;
    unint64_t v27 = clientID;
    __int16 v28 = 2048;
    id v29 = v6;
    _os_log_impl(&dword_1A3931000, v8, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx pattern: %p", buf, 0x30u);
  }

LABEL_8:
  master = self->_master;
  if (!master)
  {
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    goto LABEL_17;
  }
  [(AVHapticServer *)master entryWithID:self->_clientID];
  if (!v19)
  {
LABEL_17:
    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"com.apple.CoreHaptics", -4812, 0, v19);
    uint64_t v13 = -1;
    goto LABEL_18;
  }
  [(AVHapticServer *)self->_master manager];
  if (v20) {
    atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  *(void *)buf = -1;
  int v12 = (*(uint64_t (**)(uint64_t, id, unsigned char *))(*(void *)v19 + 56))(v19, v6, buf);
  uint64_t v13 = *(void *)buf;
  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
  if (!v12)
  {
    uint64_t v15 = 0;
    goto LABEL_19;
  }
  uint64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:v12 userInfo:0];
LABEL_18:
  uint64_t v15 = (void *)v14;
LABEL_19:
  if (kHSEQScope)
  {
    if (*(unsigned char *)(kHSEQScope + 8))
    {
      int v16 = *(id *)kHSEQScope;
      if (v16)
      {
        uint64_t v17 = v16;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          __int16 v18 = _Block_copy(v7);
          *(_DWORD *)buf = 136316162;
          *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
          __int16 v22 = 1024;
          int v23 = 1213;
          __int16 v24 = 2080;
          uint64_t v25 = "-[AVHapticServerInstance loadVibePattern:reply:]";
          __int16 v26 = 2048;
          unint64_t v27 = (unint64_t)v18;
          __int16 v28 = 2112;
          id v29 = v15;
          _os_log_impl(&dword_1A3931000, v17, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: invoking callback %p with %@", buf, 0x30u);
        }
      }
    }
  }
  (*((void (**)(id, uint64_t, void *))v7 + 2))(v7, v13, v15);

  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
}

- (void)loadHapticSequenceFromEvents:(id)a3 reply:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = (NSArray *)a3;
  id v7 = a4;
  if (kHSEQScope)
  {
    id v8 = *(id *)kHSEQScope;
    if (!v8) {
      goto LABEL_8;
    }
  }
  else
  {
    id v8 = (id)MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  int v10 = v8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    unint64_t clientID = self->_clientID;
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
    __int16 v27 = 1024;
    int v28 = 1178;
    __int16 v29 = 2080;
    uint64_t v30 = "-[AVHapticServerInstance loadHapticSequenceFromEvents:reply:]";
    __int16 v31 = 2048;
    unint64_t v32 = clientID;
    __int16 v33 = 1024;
    int v34 = [(NSArray *)v6 count];
    _os_log_impl(&dword_1A3931000, v10, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx array of %u events", buf, 0x2Cu);
  }

LABEL_8:
  master = self->_master;
  if (!master)
  {
    __int16 v22 = 0;
    int v23 = 0;
    goto LABEL_17;
  }
  [(AVHapticServer *)master entryWithID:self->_clientID];
  if (!v22)
  {
LABEL_17:
    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"com.apple.CoreHaptics", -4812, 0, v22);
    uint64_t v16 = 0;
    double v15 = 0.0;
    uint64_t v14 = -1;
    goto LABEL_18;
  }
  [(AVHapticServer *)self->_master manager];
  if (v23) {
    atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  double v25 = 0.0;
  *(void *)buf = -1;
  unsigned int v24 = 0;
  int v13 = ClientEntry::loadAndAddSequence(v22, v6, (unint64_t *)buf, &v25, &v24);
  uint64_t v14 = *(void *)buf;
  double v15 = v25;
  uint64_t v16 = v24;
  if (v23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v23);
  }
  if (!v13)
  {
    __int16 v18 = 0;
    goto LABEL_19;
  }
  uint64_t v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:v13 userInfo:0];
LABEL_18:
  __int16 v18 = (void *)v17;
LABEL_19:
  if (kHSEQScope)
  {
    if (*(unsigned char *)(kHSEQScope + 8))
    {
      uint64_t v19 = *(id *)kHSEQScope;
      if (v19)
      {
        uint64_t v20 = v19;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          int v21 = _Block_copy(v7);
          *(_DWORD *)buf = 136316674;
          *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
          int v28 = 1195;
          __int16 v29 = 2080;
          __int16 v27 = 1024;
          uint64_t v30 = "-[AVHapticServerInstance loadHapticSequenceFromEvents:reply:]";
          __int16 v31 = 2048;
          unint64_t v32 = (unint64_t)v21;
          __int16 v33 = 1024;
          int v34 = v14;
          __int16 v35 = 1024;
          int v36 = v16;
          __int16 v37 = 2112;
          uint64_t v38 = v18;
          _os_log_impl(&dword_1A3931000, v20, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: invoking callback %p with seqID %u, channelCount %u, and error %@", buf, 0x3Cu);
        }
      }
    }
  }
  (*((void (**)(id, uint64_t, uint64_t, void *, double))v7 + 2))(v7, v14, v16, v18, v15);

  if (v23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v23);
  }
}

- (void)loadHapticSequenceFromData:(id)a3 reply:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (kHSEQScope)
  {
    id v8 = *(id *)kHSEQScope;
    if (!v8) {
      goto LABEL_8;
    }
  }
  else
  {
    id v8 = (id)MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  int v10 = v8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    unint64_t clientID = self->_clientID;
    *(_DWORD *)buf = 136316418;
    *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1155;
    __int16 v47 = 2080;
    *(void *)uint64_t v48 = "-[AVHapticServerInstance loadHapticSequenceFromData:reply:]";
    *(_WORD *)&v48[8] = 2048;
    *(void *)&v48[10] = clientID;
    *(_WORD *)&v48[18] = 2048;
    *(void *)&v48[20] = v6;
    *(_WORD *)&v48[28] = 1024;
    v49[0] = [v6 length];
    _os_log_impl(&dword_1A3931000, v10, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx data: %p length: %u", buf, 0x36u);
  }

LABEL_8:
  master = self->_master;
  if (!master)
  {
    __int16 v40 = 0;
    goto LABEL_16;
  }
  [(AVHapticServer *)master entryWithID:self->_clientID];
  if (!v39)
  {
LABEL_16:
    [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4812 userInfo:0];
    uint64_t v15 = 0;
    double v16 = 0.0;
    __int16 v18 = v17 = -1;
    goto LABEL_43;
  }
  [(AVHapticServer *)self->_master manager];
  if (v40) {
    atomic_fetch_add_explicit(&v40->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v13 = v6;
  if (kHSEQScope)
  {
    uint64_t v14 = *(id *)kHSEQScope;
    if (!v14) {
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v14 = MEMORY[0x1E4F14500];
    id v19 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v20 = v39[3];
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "ClientEntry.mm";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1216;
    __int16 v47 = 2080;
    *(void *)uint64_t v48 = "loadAndAddSequence";
    *(_WORD *)&v48[8] = 1024;
    *(_DWORD *)&v48[10] = v20;
    *(_WORD *)&v48[14] = 2048;
    *(void *)&v48[16] = v13;
    _os_log_impl(&dword_1A3931000, v14, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: client ID: 0x%x, sequenceData: %p", buf, 0x2Cu);
  }

LABEL_21:
  uint64_t v21 = v39[11];
  *(void *)buf = v39[10];
  *(void *)&buf[8] = v21;
  if (v21) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v21 + 8), 1uLL, memory_order_relaxed);
  }
  id v38 = v13;
  std::allocate_shared[abi:ne180100]<HapticSequence,std::allocator<HapticSequence>,std::shared_ptr<MuteManager>,void>(&v41, (long long *)buf);
  if (*(void *)&buf[8]) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
  }
  uint64_t v22 = v41;
  uint64_t v23 = *(void *)(v39[28] + 232);
  id v24 = v13;
  if (!kHSEQScope)
  {
    double v25 = MEMORY[0x1E4F14500];
    id v26 = MEMORY[0x1E4F14500];
    goto LABEL_29;
  }
  double v25 = *(id *)kHSEQScope;
  if (v25)
  {
LABEL_29:
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v27 = *(void *)(*(void *)(v22 + 24) + 24);
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "HapticSequence.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 52;
      __int16 v47 = 2080;
      *(void *)uint64_t v48 = "load";
      *(_WORD *)&v48[8] = 1024;
      *(_DWORD *)&v48[10] = v27;
      _os_log_impl(&dword_1A3931000, v25, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Loading sequence %u", buf, 0x22u);
    }
  }
  uint64_t v28 = *(void *)(v22 + 24);
  uint64_t v43 = v23;
  id v44 = v24;
  id v29 = v24;
  int v45 = 0;
  *(void *)buf = &unk_1EF72AB58;
  *(void *)&buf[8] = &v45;
  *(void *)&v48[4] = buf;
  std::function<void ()(int)>::operator=((void *)(v28 + 520), (uint64_t)buf);
  std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100](buf);
  boost::msm::back::state_machine<SequenceFSM::StateFront,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>::process_event_internal<SequenceFSM::Load<NSData>>(v28 + 32, (uint64_t)&v43);
  int v30 = v45;

  if (v30)
  {
    unsigned int v31 = 0;
    uint64_t v17 = -1;
    double v16 = 0.0;
  }
  else
  {
    uint64_t v32 = *(void *)(v22 + 24);
    uint64_t v17 = *(void *)(v32 + 24);
    double v16 = *(double *)(v32 + 608);
    int v33 = *(_DWORD *)(v32 + 596);
    int v34 = *(_DWORD *)(v32 + 600);
    ClientEntry::addSequence((uint64_t)v39, &v41);
    unsigned int v31 = v33 - v34;
  }
  if (v42) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v42);
  }

  if (v40) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v40);
  }
  if (v30)
  {
    __int16 v18 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"com.apple.CoreHaptics", v30, 0, v38);
  }
  else
  {
    __int16 v18 = 0;
  }
  uint64_t v15 = v31;
LABEL_43:
  if (kHSEQScope)
  {
    if (*(unsigned char *)(kHSEQScope + 8))
    {
      __int16 v35 = *(id *)kHSEQScope;
      if (v35)
      {
        int v36 = v35;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          __int16 v37 = _Block_copy(v7);
          *(_DWORD *)buf = 136316674;
          *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
          *(_DWORD *)&buf[14] = 1172;
          __int16 v47 = 2080;
          *(_WORD *)&unsigned char buf[12] = 1024;
          *(void *)uint64_t v48 = "-[AVHapticServerInstance loadHapticSequenceFromData:reply:]";
          *(_WORD *)&v48[8] = 2048;
          *(void *)&v48[10] = v37;
          *(_WORD *)&v48[18] = 1024;
          *(_DWORD *)&v48[20] = v17;
          *(_WORD *)&v48[24] = 1024;
          *(_DWORD *)&v48[26] = v15;
          LOWORD(v49[0]) = 2112;
          *(void *)((char *)v49 + 2) = v18;
          _os_log_impl(&dword_1A3931000, v36, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: invoking callback %p with seqID %u, channelCount %u, and error %@", buf, 0x3Cu);
        }
      }
    }
  }
  (*((void (**)(id, uint64_t, uint64_t, void *, double))v7 + 2))(v7, v17, v15, v18, v16);

  if (v40) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v40);
  }
}

- (void)loadHapticEvent:(id)a3 reply:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, uint64_t))a4;
  if (kHSRVScope)
  {
    id v8 = *(id *)kHSRVScope;
    if (!v8) {
      goto LABEL_8;
    }
  }
  else
  {
    id v8 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    unint64_t clientID = self->_clientID;
    *(_DWORD *)buf = 136316162;
    uint64_t v49 = "AVHapticServer.mm";
    __int16 v50 = 1024;
    int v51 = 1131;
    __int16 v52 = 2080;
    uint64_t v53 = "-[AVHapticServerInstance loadHapticEvent:reply:]";
    __int16 v54 = 2048;
    unint64_t v55 = clientID;
    __int16 v56 = 2048;
    id v57 = v6;
    _os_log_impl(&dword_1A3931000, v8, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx preset: %p", buf, 0x30u);
  }

LABEL_8:
  master = self->_master;
  if (!master)
  {
    id v38 = 0;
    goto LABEL_15;
  }
  [(AVHapticServer *)master entryWithID:self->_clientID];
  if (!v37)
  {
LABEL_15:
    uint64_t v14 = -4812;
LABEL_27:
    uint64_t v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:v14 userInfo:0];
    goto LABEL_28;
  }
  int v12 = atomic_load((unsigned int *)(v37 + 120));
  if (v12 > 1)
  {
    if (kHSRVScope)
    {
      id v13 = *(id *)kHSRVScope;
      if (!v13)
      {
LABEL_26:
        uint64_t v14 = -4806;
        goto LABEL_27;
      }
    }
    else
    {
      id v13 = MEMORY[0x1E4F14500];
      id v18 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v49 = "AVHapticServer.mm";
      __int16 v50 = 1024;
      int v51 = 1141;
      __int16 v52 = 2080;
      uint64_t v53 = "-[AVHapticServerInstance loadHapticEvent:reply:]";
      _os_log_impl(&dword_1A3931000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Player must be stopped to load a preset", buf, 0x1Cu);
    }

    goto LABEL_26;
  }
  uint64_t v15 = [(AVHapticServer *)self->_master manager];
  uint64_t v16 = v15[30];
  uint64_t v39 = v15 + 30;
  char v40 = (*(uint64_t (**)(void))(v16 + 16))();
  uint64_t v17 = v15[29];
  id v46 = v6;
  __int16 v47 = 0;
  if (v6)
  {
    unsigned int v45 = 0;
    if (CACFDictionary::GetUInt32((CACFDictionary *)&v46, @"TypeID", &v45))
    {
      if (v45 == 1000 || v45 == 2000 || v45 == 3000)
      {
        if (CACFDictionary::HasKey((CACFDictionary *)&v46, @"Layers"))
        {
          CFArrayRef theArray = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
          __int16 v44 = 257;
          CACFDictionary::GetCACFArray((CACFDictionary *)&v46, @"Layers", (CACFArray *)&theArray);
          if (theArray) {
            unsigned int Count = CFArrayGetCount(theArray);
          }
          else {
            unsigned int Count = 0;
          }
          if (kHPRSScope)
          {
            id v26 = *(id *)kHPRSScope;
            if (!v26) {
              goto LABEL_66;
            }
          }
          else
          {
            id v26 = MEMORY[0x1E4F14500];
            id v27 = MEMORY[0x1E4F14500];
          }
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315906;
            uint64_t v49 = "HapticSynth_Parser.mm";
            __int16 v50 = 1024;
            int v51 = 136;
            __int16 v52 = 2080;
            uint64_t v53 = "loadEventDictionary";
            __int16 v54 = 1024;
            LODWORD(v55) = Count;
            _os_log_impl(&dword_1A3931000, v26, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Event has %u layers", buf, 0x22u);
          }

LABEL_66:
          if (!Count)
          {
            if (kHPRSScope)
            {
              uint64_t v28 = *(id *)kHPRSScope;
              if (!v28) {
                goto LABEL_90;
              }
            }
            else
            {
              uint64_t v28 = MEMORY[0x1E4F14500];
              id v33 = MEMORY[0x1E4F14500];
            }
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              uint64_t v49 = "HapticSynth_Parser.mm";
              __int16 v50 = 1024;
              int v51 = 138;
              __int16 v52 = 2080;
              uint64_t v53 = "loadEventDictionary";
              _os_log_impl(&dword_1A3931000, v28, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Empty layers array", buf, 0x1Cu);
            }
            goto LABEL_89;
          }
          if (Count >= 3)
          {
            if (kHPRSScope)
            {
              uint64_t v28 = *(id *)kHPRSScope;
              if (!v28) {
                goto LABEL_90;
              }
            }
            else
            {
              uint64_t v28 = MEMORY[0x1E4F14500];
              id v34 = MEMORY[0x1E4F14500];
            }
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              uint64_t v49 = "HapticSynth_Parser.mm";
              __int16 v50 = 1024;
              int v51 = 142;
              __int16 v52 = 2080;
              uint64_t v53 = "loadEventDictionary";
              _os_log_impl(&dword_1A3931000, v28, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Single event dictionary cannot have more than 2 layers", buf, 0x1Cu);
            }
LABEL_89:

LABEL_90:
            OSStatus PropertyInfo = -50;
LABEL_101:
            CACFArray::~CACFArray((CACFArray *)&theArray);
            goto LABEL_81;
          }
          UInt32 outDataSize = 0;
          Boolean outWritable = 0;
          uint64_t v29 = *(void *)(v17 + 192);
          if (v29) {
            int v30 = *(OpaqueAudioComponentInstance **)(v29 + 16);
          }
          else {
            int v30 = 0;
          }
          OSStatus PropertyInfo = AudioUnitGetPropertyInfo(v30, 0x102Cu, 4u, 0, &outDataSize, &outWritable);
          if (!PropertyInfo) {
            operator new[]();
          }
          if (kHPRSScope)
          {
            __int16 v35 = *(id *)kHPRSScope;
            if (!v35)
            {
LABEL_100:

              goto LABEL_101;
            }
          }
          else
          {
            __int16 v35 = MEMORY[0x1E4F14500];
            id v36 = MEMORY[0x1E4F14500];
          }
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315906;
            uint64_t v49 = "HapticSynth_Parser.mm";
            __int16 v50 = 1024;
            int v51 = 151;
            __int16 v52 = 2080;
            uint64_t v53 = "loadEventDictionary";
            __int16 v54 = 1024;
            LODWORD(v55) = PropertyInfo;
            _os_log_impl(&dword_1A3931000, v35, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Call mSynthUnit.GetPropertyInfo(kAUSamplerProperty_LayerIDs, kAudioUnitScope_Part, 0, &propSize, &writable) failed with error %d", buf, 0x22u);
          }
          goto LABEL_100;
        }
        if (kHPRSScope)
        {
          uint64_t v21 = *(id *)kHPRSScope;
          if (!v21) {
            goto LABEL_80;
          }
        }
        else
        {
          uint64_t v21 = MEMORY[0x1E4F14500];
          id v25 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v49 = "HapticSynth_Parser.mm";
          __int16 v50 = 1024;
          int v51 = 202;
          __int16 v52 = 2080;
          uint64_t v53 = "loadEventDictionary";
          _os_log_impl(&dword_1A3931000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: No layers array", buf, 0x1Cu);
        }
      }
      else
      {
        if (kHPRSScope)
        {
          uint64_t v21 = *(id *)kHPRSScope;
          if (!v21) {
            goto LABEL_80;
          }
        }
        else
        {
          uint64_t v21 = MEMORY[0x1E4F14500];
          id v31 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v49 = "HapticSynth_Parser.mm";
          __int16 v50 = 1024;
          int v51 = 124;
          __int16 v52 = 2080;
          uint64_t v53 = "loadEventDictionary";
          _os_log_impl(&dword_1A3931000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Unrecognized event dictionary 'LoadAs' key", buf, 0x1Cu);
        }
      }
    }
    else
    {
      if (kHPRSScope)
      {
        uint64_t v21 = *(id *)kHPRSScope;
        if (!v21) {
          goto LABEL_80;
        }
      }
      else
      {
        uint64_t v21 = MEMORY[0x1E4F14500];
        id v23 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v49 = "HapticSynth_Parser.mm";
        __int16 v50 = 1024;
        int v51 = 129;
        __int16 v52 = 2080;
        uint64_t v53 = "loadEventDictionary";
        _os_log_impl(&dword_1A3931000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Single event dictionary must provide a 'LoadAs' type key", buf, 0x1Cu);
      }
    }
  }
  else
  {
    if (kHPRSScope)
    {
      uint64_t v21 = *(id *)kHPRSScope;
      if (!v21) {
        goto LABEL_80;
      }
    }
    else
    {
      uint64_t v21 = MEMORY[0x1E4F14500];
      id v22 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v49 = "HapticSynth_Parser.mm";
      __int16 v50 = 1024;
      int v51 = 207;
      __int16 v52 = 2080;
      uint64_t v53 = "loadEventDictionary";
      _os_log_impl(&dword_1A3931000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Invalid event dictionary", buf, 0x1Cu);
    }
  }

LABEL_80:
  OSStatus PropertyInfo = -50;
LABEL_81:
  CACFDictionary::~CACFDictionary((CACFDictionary *)&v46);
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&v39);
  uint64_t v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:PropertyInfo userInfo:0];
LABEL_28:
  uint64_t v20 = (void *)v19;
  v7[2](v7, 0, v19);
  if (v38) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v38);
  }
}

- (void)releaseCustomAudioEvent:(unint64_t)a3 reply:(id)a4
{
  unsigned int v4 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (kHCARScope)
  {
    id v7 = *(id *)kHCARScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    unint64_t clientID = self->_clientID;
    *(_DWORD *)buf = 136316162;
    id v24 = "AVHapticServer.mm";
    __int16 v25 = 1024;
    int v26 = 1113;
    __int16 v27 = 2080;
    uint64_t v28 = "-[AVHapticServerInstance releaseCustomAudioEvent:reply:]";
    __int16 v29 = 2048;
    *(void *)int v30 = clientID;
    *(_WORD *)&v30[8] = 1024;
    LODWORD(v31) = v4;
    _os_log_impl(&dword_1A3931000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx, eventID %u", buf, 0x2Cu);
  }

LABEL_8:
  int v10 = self->_master;
  objc_sync_enter(v10);
  master = self->_master;
  if (!master)
  {
    uint64_t v21 = 0;
    id v22 = 0;
    goto LABEL_14;
  }
  [(AVHapticServer *)master entryWithID:self->_clientID];
  if (!v21)
  {
LABEL_14:
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"com.apple.CoreHaptics", -4812, 0, v21);
LABEL_15:
    uint64_t v14 = (void *)v13;
    goto LABEL_24;
  }
  if (kHCARScope)
  {
    int v12 = *(id *)kHCARScope;
    if (!v12) {
      goto LABEL_20;
    }
  }
  else
  {
    int v12 = MEMORY[0x1E4F14500];
    id v15 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = *(void *)(v21 + 24);
    *(_DWORD *)buf = 136316162;
    id v24 = "ClientEntry.mm";
    int v26 = 516;
    __int16 v27 = 2080;
    __int16 v25 = 1024;
    uint64_t v28 = "releaseCustomAudioEvent";
    __int16 v29 = 1024;
    *(_DWORD *)int v30 = v16;
    *(_WORD *)&v30[4] = 1024;
    *(_DWORD *)&v30[6] = v4;
    _os_log_impl(&dword_1A3931000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: client ID: 0x%x eventID %u", buf, 0x28u);
  }

LABEL_20:
  if (!ClientEntry::sendRealTimeCommand(v21, 2, v4))
  {
    int v17 = ClientEntry::handleReleaseCustomAudioEvent((ClientEntry *)v21, v4);
    if (v17)
    {
      uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:v17 userInfo:0];
      goto LABEL_15;
    }
  }
  uint64_t v14 = 0;
LABEL_24:
  if (v22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
  }
  objc_sync_exit(v10);

  if (kHCARScope)
  {
    if (*(unsigned char *)(kHCARScope + 8))
    {
      id v18 = *(id *)kHCARScope;
      if (v18)
      {
        uint64_t v19 = v18;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v20 = _Block_copy(v6);
          *(_DWORD *)buf = 136316162;
          id v24 = "AVHapticServer.mm";
          __int16 v25 = 1024;
          int v26 = 1125;
          __int16 v27 = 2080;
          uint64_t v28 = "-[AVHapticServerInstance releaseCustomAudioEvent:reply:]";
          __int16 v29 = 2048;
          *(void *)int v30 = v20;
          *(_WORD *)&v30[8] = 2112;
          id v31 = v14;
          _os_log_impl(&dword_1A3931000, v19, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: invoking callback %p with %@", buf, 0x30u);
        }
      }
    }
  }
  (*((void (**)(id, void *))v6 + 2))(v6, v14);
}

- (void)referenceCustomAudioEvent:(unint64_t)a3 reply:(id)a4
{
  unsigned int v4 = a3;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (kHCARScope)
  {
    id v7 = *(id *)kHCARScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    unint64_t clientID = self->_clientID;
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
    __int16 v42 = 1024;
    *(_DWORD *)uint64_t v43 = 1093;
    *(_WORD *)&v43[4] = 2080;
    *(void *)&v43[6] = "-[AVHapticServerInstance referenceCustomAudioEvent:reply:]";
    *(_WORD *)&v43[14] = 2048;
    *(void *)&v43[16] = clientID;
    *(_WORD *)&v43[24] = 1024;
    LODWORD(v44) = v4;
    _os_log_impl(&dword_1A3931000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx, eventID %u", buf, 0x2Cu);
  }

LABEL_8:
  int v10 = self->_master;
  objc_sync_enter(v10);
  master = self->_master;
  if (!master)
  {
    uint64_t v39 = 0;
    char v40 = 0;
    goto LABEL_21;
  }
  [(AVHapticServer *)master entryWithID:self->_clientID];
  if (!v39)
  {
LABEL_21:
    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"com.apple.CoreHaptics", -4812, 0, v39);
LABEL_51:
    uint64_t v16 = v17;
    goto LABEL_52;
  }
  if (kHCARScope)
  {
    if (*(unsigned char *)(kHCARScope + 8))
    {
      int v12 = *(id *)kHCARScope;
      if (v12)
      {
        uint64_t v13 = v12;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v14 = *(void *)(v39 + 24);
          *(_DWORD *)buf = 136316162;
          *(void *)&uint8_t buf[4] = "ClientEntry.mm";
          *(_DWORD *)uint64_t v43 = 467;
          *(_WORD *)&v43[4] = 2080;
          __int16 v42 = 1024;
          *(void *)&v43[6] = "referenceCustomAudioEvent";
          *(_WORD *)&v43[14] = 1024;
          *(_DWORD *)&v43[16] = v14;
          *(_WORD *)&v43[20] = 1024;
          *(_DWORD *)&v43[22] = v4;
          _os_log_impl(&dword_1A3931000, v13, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: client ID: 0x%x, eventID %u", buf, 0x28u);
        }
      }
    }
  }
  uint64_t v15 = *(void *)(v39 + 904);
  *(void *)buf = v39 + 728;
  buf[8] = 1;
  std::__shared_mutex_base::lock((std::__shared_mutex_base *)(v39 + 728));
  *(void *)&v43[2] = v39 + 704;
  *(void *)&v43[10] = v39 + 896;
  *(void *)&v43[18] = v15;
  *(unsigned char *)(v39 + 896) = 1;
  LOBYTE(v15) = std::__tree<std::__value_type<unsigned int const,unsigned int>,std::__map_value_compare<unsigned int const,std::__value_type<unsigned int const,unsigned int>,std::less<unsigned int const>,true>,std::allocator<std::__value_type<unsigned int const,unsigned int>>>::__emplace_unique_impl<std::tuple<unsigned int const,unsigned int> &>((uint64_t **)(v39 + 704), COERCE_DOUBLE(v4 | 0x100000000));
  **(unsigned char **)&v43[10] = 0;
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)buf);
  if (v15)
  {
    if (kHCARScope)
    {
      if (*(unsigned char *)(kHCARScope + 8))
      {
        id v18 = *(id *)kHCARScope;
        if (v18)
        {
          uint64_t v19 = v18;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            *(void *)&uint8_t buf[4] = "ClientEntry.mm";
            __int16 v42 = 1024;
            *(_DWORD *)uint64_t v43 = 475;
            *(_WORD *)&v43[4] = 2080;
            *(void *)&v43[6] = "referenceCustomAudioEvent";
            _os_log_impl(&dword_1A3931000, v19, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: added event to local map and bumping manager's reference", buf, 0x1Cu);
          }
        }
      }
    }
    uint64_t v20 = *(void *)(*(void *)(v39 + 224) + 424);
    uint64_t v21 = *(void *)(v20 + 272);
    *(void *)buf = v20 + 96;
    buf[8] = 1;
    std::__shared_mutex_base::lock((std::__shared_mutex_base *)(v20 + 96));
    id v22 = (unsigned char *)(v20 + 264);
    uint64_t v25 = *(void *)(v20 + 80);
    uint64_t v24 = v20 + 80;
    uint64_t v23 = v25;
    *(void *)&v43[2] = v24 - 8;
    *(void *)&v43[10] = v22;
    *(void *)&v43[18] = v21;
    *(unsigned char *)(v24 + 184) = 1;
    if (v25)
    {
      uint64_t v26 = v24;
      do
      {
        unsigned int v27 = *(_DWORD *)(v23 + 28);
        BOOL v28 = v27 >= v4;
        if (v27 >= v4) {
          __int16 v29 = (uint64_t *)v23;
        }
        else {
          __int16 v29 = (uint64_t *)(v23 + 8);
        }
        if (v28) {
          uint64_t v26 = v23;
        }
        uint64_t v23 = *v29;
      }
      while (*v29);
      if (v26 != v24 && *(_DWORD *)(v26 + 28) <= v4)
      {
        if (kRSRVScope)
        {
          if (*(unsigned char *)(kRSRVScope + 8))
          {
            id v36 = *(id *)kRSRVScope;
            if (v36)
            {
              uint64_t v37 = v36;
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
              {
                int v38 = *(_DWORD *)(v26 + 32) + 1;
                *(_DWORD *)unsigned int v45 = 136315906;
                id v46 = "AudioEventManager.mm";
                __int16 v47 = 1024;
                int v48 = 61;
                __int16 v49 = 2080;
                __int16 v50 = "operator()";
                __int16 v51 = 1024;
                int v52 = v38;
                _os_log_impl(&dword_1A3931000, v37, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: found it: refcount will be %u", v45, 0x22u);
              }

              id v22 = *(unsigned char **)&v43[10];
            }
          }
        }
        ++*(_DWORD *)(v26 + 32);
        unsigned char *v22 = 0;
        std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)buf);
        goto LABEL_68;
      }
    }
    unsigned char *v22 = 0;
    std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)buf);
    if (kRSRVScope)
    {
      int v30 = *(id *)kRSRVScope;
      if (!v30)
      {
LABEL_50:
        uint64_t v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-1 userInfo:0];
        goto LABEL_51;
      }
    }
    else
    {
      int v30 = MEMORY[0x1E4F14500];
      id v32 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "AudioEventManager.mm";
      __int16 v42 = 1024;
      *(_DWORD *)uint64_t v43 = 65;
      *(_WORD *)&v43[4] = 2080;
      *(void *)&v43[6] = "referenceCustomAudioEvent";
      *(_WORD *)&v43[14] = 1024;
      *(_DWORD *)&v43[16] = v4;
      _os_log_impl(&dword_1A3931000, v30, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Event ID %u not found", buf, 0x22u);
    }

    goto LABEL_50;
  }
  if (!kHCARScope)
  {
    uint64_t v16 = MEMORY[0x1E4F14500];
    id v31 = MEMORY[0x1E4F14500];
    goto LABEL_43;
  }
  uint64_t v16 = *(id *)kHCARScope;
  if (v16)
  {
LABEL_43:
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "ClientEntry.mm";
      __int16 v42 = 1024;
      *(_DWORD *)uint64_t v43 = 471;
      *(_WORD *)&v43[4] = 2080;
      *(void *)&v43[6] = "referenceCustomAudioEvent";
      _os_log_impl(&dword_1A3931000, v16, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: event was already present in map, so DOING NOTHING", buf, 0x1Cu);
    }

LABEL_68:
    uint64_t v16 = 0;
  }
LABEL_52:
  if (v40) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v40);
  }
  objc_sync_exit(v10);

  if (kHCARScope)
  {
    if (*(unsigned char *)(kHCARScope + 8))
    {
      id v33 = *(id *)kHCARScope;
      if (v33)
      {
        id v34 = v33;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          __int16 v35 = _Block_copy(v6);
          *(_DWORD *)buf = 136316162;
          *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
          __int16 v42 = 1024;
          *(_DWORD *)uint64_t v43 = 1105;
          *(_WORD *)&v43[4] = 2080;
          *(void *)&v43[6] = "-[AVHapticServerInstance referenceCustomAudioEvent:reply:]";
          *(_WORD *)&v43[14] = 2048;
          *(void *)&v43[16] = v35;
          *(_WORD *)&v43[24] = 2112;
          __int16 v44 = v16;
          _os_log_impl(&dword_1A3931000, v34, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: invoking callback %p with %@", buf, 0x30u);
        }
      }
    }
  }
  (*((void (**)(id, NSObject *))v6 + 2))(v6, v16);
}

- (void)copyCustomAudioEvent:(unint64_t)a3 options:(id)a4 reply:(id)a5
{
  int v6 = a3;
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v59 = a4;
  id v8 = a5;
  id v9 = &getkCPMSPowerTimeScaleThermalSymbolLoc(void)::ptr;
  if (kHCARScope)
  {
    int v10 = *(id *)kHCARScope;
    if (!v10) {
      goto LABEL_8;
    }
  }
  else
  {
    int v10 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    unint64_t clientID = self->_clientID;
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1074;
    *(_WORD *)&unsigned char buf[18] = 2080;
    *(void *)&buf[20] = "-[AVHapticServerInstance copyCustomAudioEvent:options:reply:]";
    *(_WORD *)&buf[28] = 2048;
    *(void *)&buf[30] = clientID;
    _os_log_impl(&dword_1A3931000, v10, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx", buf, 0x26u);
  }

LABEL_8:
  uint64_t v13 = self->_master;
  objc_sync_enter(v13);
  master = self->_master;
  if (!master)
  {
    v61 = 0;
    goto LABEL_26;
  }
  [(AVHapticServer *)master entryWithID:self->_clientID];
  if (!v60)
  {
LABEL_26:
    uint64_t v25 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4812 userInfo:0];
    unsigned int v26 = 0;
    goto LABEL_70;
  }
  if (kHCARScope)
  {
    if (*(unsigned char *)(kHCARScope + 8))
    {
      uint64_t v15 = *(id *)kHCARScope;
      if (v15)
      {
        uint64_t v16 = v15;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v17 = *(void *)(v60 + 24);
          *(_DWORD *)buf = 136316162;
          *(void *)&uint8_t buf[4] = "ClientEntry.mm";
          *(_DWORD *)&buf[14] = 455;
          *(_WORD *)&unsigned char buf[18] = 2080;
          *(_WORD *)&unsigned char buf[12] = 1024;
          *(void *)&buf[20] = "copyCustomAudioEvent";
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = v17;
          *(_WORD *)&buf[34] = 1024;
          *(_DWORD *)&buf[36] = v6;
          _os_log_impl(&dword_1A3931000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: client ID: 0x%x eventID %u", buf, 0x28u);
        }
      }
    }
  }
  uint64_t v18 = *(void *)(*(void *)(v60 + 224) + 424);
  if (kHCARScope)
  {
    if (*(unsigned char *)(kHCARScope + 8))
    {
      uint64_t v19 = *(id *)kHCARScope;
      if (v19)
      {
        uint64_t v20 = v19;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = "AudioEventManager.mm";
          *(_WORD *)&unsigned char buf[12] = 1024;
          *(_DWORD *)&buf[14] = 47;
          *(_WORD *)&unsigned char buf[18] = 2080;
          *(void *)&buf[20] = "copyCustomAudioEvent";
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = v6;
          _os_log_impl(&dword_1A3931000, v20, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Requesting copy of event ID %u from synth", buf, 0x22u);
        }
      }
    }
  }
  std::mutex::lock((std::mutex *)(v18 + 8));
  uint64_t v21 = *(void **)v18;
  int v22 = *(unsigned __int16 *)(*(void *)v18 + 544);
  float v23 = *(float *)(*(void *)v18 + 556);
  *(void *)uint64_t v67 = 0;
  id v65 = v59;
  __int16 v66 = 0;
  BOOL v64 = 1;
  CACFDictionary::GetBool((CACFDictionary *)&v65, @"UseVolumeEnvelope", &v64);
  BOOL v63 = 0;
  CACFDictionary::GetBool((CACFDictionary *)&v65, @"LoopEnabled", &v63);
  if (kHCARScope)
  {
    uint64_t v24 = *(NSObject **)kHCARScope;
    if (!*(void *)kHCARScope) {
      goto LABEL_30;
    }
  }
  else
  {
    uint64_t v24 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "HapticAudioUnit.cpp";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1132;
    *(_WORD *)&unsigned char buf[18] = 2080;
    *(void *)&buf[20] = "copyCustomAudioEvent";
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = v6;
    _os_log_impl(&dword_1A3931000, v24, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Adding new zone from a copy of the sampleID for audio event ID %u", buf, 0x22u);
  }
LABEL_30:
  if (HapticAudioUnit::getLayerWithKey((HapticAudioUnit *)(v21 + 17), 10, &v67[1]))
  {
    int LayerWithKey = HapticAudioUnit::getLayerWithKey((HapticAudioUnit *)(v21 + 17), 11, &v67[1]);
    if (LayerWithKey)
    {
      if (kHCARScope)
      {
        BOOL v28 = *(NSObject **)kHCARScope;
        if (!*(void *)kHCARScope) {
          goto LABEL_52;
        }
      }
      else
      {
        BOOL v28 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "HapticAudioUnit.cpp";
        *(_WORD *)&unsigned char buf[12] = 1024;
        *(_DWORD *)&buf[14] = 1137;
        *(_WORD *)&unsigned char buf[18] = 2080;
        *(void *)&buf[20] = "copyCustomAudioEvent";
        _os_log_impl(&dword_1A3931000, v28, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Unable to access layers for custom events", buf, 0x1Cu);
      }
      goto LABEL_52;
    }
  }
  if (v64) {
    int v29 = 10;
  }
  else {
    int v29 = 11;
  }
  if (HapticAudioUnit::getLayerWithKey((HapticAudioUnit *)(v21 + 17), v29, v67))
  {
    int v58 = v29;
    BOOL v30 = v64;
    AudioUnitElement inElement = 0;
    if (v64) {
      id v31 = "Custom Audio Waveforms";
    }
    else {
      id v31 = "Custom Audio Waveforms No Envelope";
    }
    CFStringRef v32 = CFStringCreateWithCString(0, v31, 0x600u);
    *(void *)buf = v32;
    if (v30) {
      int v33 = 10;
    }
    else {
      int v33 = 11;
    }
    int LayerWithKey = HapticAudioUnit::addLayer((HapticAudioUnit *)(v21 + 17), 0, v22, v33, v32, &inElement);
    if (LayerWithKey) {
      goto LABEL_48;
    }
    AudioUnitElement v34 = inElement;
    int LayerWithKey = HapticAudioUnit::addDefaultGainConnections((HapticAudioUnit *)(v21 + 17), inElement, v23, 0, 0);
    if (LayerWithKey) {
      goto LABEL_48;
    }
    AudioUnitElement outData = 0;
    int LayerWithKey = HapticAudioUnit::addEnvelope((HapticAudioUnit *)(v21 + 17), v34, 0, v23, &outData);
    if (LayerWithKey) {
      goto LABEL_48;
    }
    if (v30)
    {
      int LayerWithKey = HapticAudioUnit::addCustomAudioEnvelopeConnections((HapticAudioUnit *)(v21 + 17), v34, outData);
      if (LayerWithKey) {
        goto LABEL_48;
      }
    }
    int LayerWithKey = HapticAudioUnit::addPitchConnection((HapticAudioUnit *)(v21 + 17), v34, 0, 4.0);
    if (LayerWithKey
      || (int LayerWithKey = HapticAudioUnit::addFilterConnection((HapticAudioUnit *)(v21 + 17), v34, 24000.0, 2048.0)) != 0
      || (int LayerWithKey = HapticAudioUnit::addCustomAudioOffsetStartTimeConnection((HapticAudioUnit *)(v21 + 17), v34)) != 0)
    {
LABEL_48:
      Smart<__CFString const*>::~Smart((const void **)buf);
LABEL_52:
      unsigned int v26 = 0;
      goto LABEL_65;
    }
    v67[0] = v34;
    Smart<__CFString const*>::~Smart((const void **)buf);
    int v29 = v58;
  }
  AudioUnitElement inElement = 0;
  if (HapticAudioUnit::getZoneWithVelocity((HapticAudioUnit *)(v21 + 17), v67[1], BYTE1(v6), &inElement)) {
    goto LABEL_64;
  }
  AudioUnitElement outData = 0;
  *(_DWORD *)buf = 4;
  uint64_t v35 = v21[24];
  id v36 = v35 ? *(OpaqueAudioComponentInstance **)(v35 + 16) : 0;
  if (AudioUnitGetProperty(v36, 0x1068u, 7u, inElement, &outData, (UInt32 *)buf)) {
    goto LABEL_64;
  }
  AudioUnitElement inData = outData;
  if (outData == -1) {
    goto LABEL_64;
  }
  AudioUnitElement v45 = v67[0];
  int CustomZoneVelocity = HapticAudioUnit::getCustomZoneVelocity((HapticAudioUnit *)(v21 + 17), v67[0]);
  if (CustomZoneVelocity == -1)
  {
    if (kHCARScope)
    {
      __int16 v50 = *(NSObject **)kHCARScope;
      if (!*(void *)kHCARScope) {
        goto LABEL_64;
      }
    }
    else
    {
      __int16 v50 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "HapticAudioUnit.cpp";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1159;
      *(_WORD *)&unsigned char buf[18] = 2080;
      *(void *)&buf[20] = "copyCustomAudioEvent";
      __int16 v54 = "%25s:%-5d %s: Unable to find a velocity slot for this event";
      unint64_t v55 = v50;
      uint32_t v56 = 28;
      goto LABEL_103;
    }
LABEL_64:
    unsigned int v26 = 0;
    int LayerWithKey = -1;
    goto LABEL_65;
  }
  uint64_t v47 = v21[25];
  *(void *)buf = v21 + 17;
  *(void *)&buf[8] = v21 + 25;
  buf[16] = (*(uint64_t (**)(void))(v47 + 16))();
  uint64_t v48 = v21[24];
  if (v48) {
    __int16 v49 = *(OpaqueAudioComponentInstance **)(v48 + 16);
  }
  else {
    __int16 v49 = 0;
  }
  OSStatus v51 = AudioUnitSetProperty(v49, 0x1033u, 4u, 0, &inData, 4u);
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&buf[8]);
  if (v51)
  {
    if (kHCARScope)
    {
      int v52 = *(NSObject **)kHCARScope;
      if (!*(void *)kHCARScope) {
        goto LABEL_64;
      }
    }
    else
    {
      int v52 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "HapticAudioUnit.cpp";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1165;
      *(_WORD *)&unsigned char buf[18] = 2080;
      *(void *)&buf[20] = "copyCustomAudioEvent";
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = inData;
      __int16 v54 = "%25s:%-5d %s: Unable to reference sampleID %u";
      unint64_t v55 = v52;
      uint32_t v56 = 34;
LABEL_103:
      _os_log_impl(&dword_1A3931000, v55, OS_LOG_TYPE_ERROR, v54, buf, v56);
      goto LABEL_64;
    }
    goto LABEL_64;
  }
  int v53 = HapticAudioUnit::addZoneForSample((HapticAudioUnit *)(v21 + 17), inData, v45, v29, CustomZoneVelocity, v63, 1, 0, (const __CFString *)buf, v57);
  if (v53) {
    unsigned int v26 = 0;
  }
  else {
    unsigned int v26 = v29 | (CustomZoneVelocity << 8);
  }
  if (v53) {
    int LayerWithKey = -1;
  }
  else {
    int LayerWithKey = 0;
  }
LABEL_65:
  CACFDictionary::~CACFDictionary((CACFDictionary *)&v65);
  std::mutex::unlock((std::mutex *)(v18 + 8));
  if (LayerWithKey)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:LayerWithKey userInfo:0];
    uint64_t v25 = v9 = &getkCPMSPowerTimeScaleThermalSymbolLoc(void)::ptr;
  }
  else
  {
    uint64_t v37 = *(void *)(v18 + 272);
    *(void *)buf = v18 + 96;
    buf[8] = 1;
    std::__shared_mutex_base::lock((std::__shared_mutex_base *)(v18 + 96));
    id v9 = &getkCPMSPowerTimeScaleThermalSymbolLoc(void)::ptr;
    *(void *)&buf[16] = v18 + 72;
    *(void *)&buf[24] = v18 + 264;
    *(void *)&buf[32] = v37;
    *(unsigned char *)(v18 + 264) = 1;
    std::__tree<std::__value_type<unsigned int const,unsigned int>,std::__map_value_compare<unsigned int const,std::__value_type<unsigned int const,unsigned int>,std::less<unsigned int const>,true>,std::allocator<std::__value_type<unsigned int const,unsigned int>>>::__emplace_unique_impl<std::tuple<unsigned int const,unsigned int> &>((uint64_t **)(v18 + 72), COERCE_DOUBLE(v26 | 0x100000000));
    **(unsigned char **)&buf[24] = 0;
    std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)buf);
    int v38 = atomic_load((unsigned int *)(v60 + 120));
    uint64_t v39 = *(void *)(v60 + 904);
    *(void *)buf = v60 + 728;
    buf[8] = 1;
    std::__shared_mutex_base::lock((std::__shared_mutex_base *)(v60 + 728));
    uint64_t v40 = 0x100000000;
    if (v38 > 1) {
      uint64_t v40 = 0x200000000;
    }
    *(void *)&buf[16] = v60 + 704;
    *(void *)&buf[24] = v60 + 896;
    *(void *)&buf[32] = v39;
    *(unsigned char *)(v60 + 896) = 1;
    std::__tree<std::__value_type<unsigned int const,unsigned int>,std::__map_value_compare<unsigned int const,std::__value_type<unsigned int const,unsigned int>,std::less<unsigned int const>,true>,std::allocator<std::__value_type<unsigned int const,unsigned int>>>::__emplace_unique_impl<std::tuple<unsigned int const,unsigned int> &>((uint64_t **)(v60 + 704), COERCE_DOUBLE(v40 | v26));
    **(unsigned char **)&buf[24] = 0;
    std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)buf);
    uint64_t v25 = 0;
  }
LABEL_70:
  if (v61) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v61);
  }
  objc_sync_exit(v13);

  uint64_t v41 = v9[11];
  if (v41)
  {
    if (*(unsigned char *)(v41 + 8))
    {
      __int16 v42 = *(id *)v41;
      if (v42)
      {
        uint64_t v43 = v42;
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          __int16 v44 = _Block_copy(v8);
          *(_DWORD *)buf = 136316418;
          *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
          *(_WORD *)&unsigned char buf[12] = 1024;
          *(_DWORD *)&buf[14] = 1087;
          *(_WORD *)&unsigned char buf[18] = 2080;
          *(void *)&buf[20] = "-[AVHapticServerInstance copyCustomAudioEvent:options:reply:]";
          *(_WORD *)&buf[28] = 2048;
          *(void *)&buf[30] = v44;
          *(_WORD *)&buf[38] = 1024;
          unsigned int v71 = v26;
          __int16 v72 = 2112;
          v73 = v25;
          _os_log_impl(&dword_1A3931000, v43, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: invoking callback %p with eventID %u and error %@", buf, 0x36u);
        }
      }
    }
  }
  (*((void (**)(id, void, void *))v8 + 2))(v8, v26, v25);
}

- (void)createCustomAudioEvent:(id)a3 format:(id)a4 frames:(unint64_t)a5 options:(id)a6 reply:(id)a7
{
  int v9 = a5;
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v63 = a3;
  id v64 = a4;
  id v12 = a6;
  id v13 = a7;
  if (kHCARScope)
  {
    uint64_t v14 = *(id *)kHCARScope;
    if (!v14) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v14 = MEMORY[0x1E4F14500];
    id v15 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    unint64_t clientID = self->_clientID;
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
    __int16 v83 = 1024;
    *(_DWORD *)v84 = 1053;
    *(_WORD *)&v84[4] = 2080;
    *(void *)&v84[6] = "-[AVHapticServerInstance createCustomAudioEvent:format:frames:options:reply:]";
    *(_WORD *)&v84[14] = 2048;
    *(void *)&v84[16] = clientID;
    _os_log_impl(&dword_1A3931000, v14, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx", buf, 0x26u);
  }

LABEL_8:
  uint64_t v17 = self->_master;
  objc_sync_enter(v17);
  master = self->_master;
  if (!master)
  {
    __int16 v66 = 0;
    goto LABEL_26;
  }
  [(AVHapticServer *)master entryWithID:self->_clientID];
  if (!v65)
  {
LABEL_26:
    int v29 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4812 userInfo:0];
    unsigned int v30 = 0;
    goto LABEL_62;
  }
  id v62 = v12;
  uint64_t v60 = [v63 bytes];
  uint64_t v61 = [v64 streamDescription];
  if (kHCARScope)
  {
    if (*(unsigned char *)(kHCARScope + 8))
    {
      uint64_t v19 = *(id *)kHCARScope;
      if (v19)
      {
        uint64_t v20 = v19;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v21 = *(void *)(v65 + 24);
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = "ClientEntry.mm";
          __int16 v83 = 1024;
          *(_DWORD *)v84 = 443;
          *(_WORD *)&v84[4] = 2080;
          *(void *)&v84[6] = "createCustomAudioEvent";
          *(_WORD *)&v84[14] = 1024;
          *(_DWORD *)&v84[16] = v21;
          _os_log_impl(&dword_1A3931000, v20, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: client ID: 0x%x", buf, 0x22u);
        }
      }
    }
  }
  uint64_t v22 = *(void *)(*(void *)(v65 + 224) + 424);
  if (kHCARScope)
  {
    if (*(unsigned char *)(kHCARScope + 8))
    {
      float v23 = *(id *)kHCARScope;
      if (v23)
      {
        uint64_t v24 = v23;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = "AudioEventManager.mm";
          __int16 v83 = 1024;
          *(_DWORD *)v84 = 34;
          *(_WORD *)&v84[4] = 2080;
          *(void *)&v84[6] = "createCustomAudioEvent";
          _os_log_impl(&dword_1A3931000, v24, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Requesting new event from synth", buf, 0x1Cu);
        }
      }
    }
  }
  std::mutex::lock((std::mutex *)(v22 + 8));
  uint64_t v25 = *(void **)v22;
  int v26 = *(unsigned __int16 *)(*(void *)v22 + 544);
  float v27 = *(float *)(*(void *)v22 + 556);
  AudioUnitElement inElement = 0;
  id v69 = v62;
  __int16 v70 = 0;
  BOOL v68 = 1;
  CACFDictionary::GetBool((CACFDictionary *)&v69, @"UseVolumeEnvelope", &v68);
  BOOL v67 = 0;
  CACFDictionary::GetBool((CACFDictionary *)&v69, @"LoopEnabled", &v67);
  int v59 = v9;
  if (kHCARScope)
  {
    BOOL v28 = *(NSObject **)kHCARScope;
    if (!*(void *)kHCARScope) {
      goto LABEL_35;
    }
  }
  else
  {
    BOOL v28 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(void *)&uint8_t buf[4] = "HapticAudioUnit.cpp";
    __int16 v83 = 1024;
    if (v67) {
      id v31 = "looped";
    }
    else {
      id v31 = "unlooped";
    }
    CFStringRef v32 = "with";
    *(_DWORD *)v84 = 1072;
    *(void *)&v84[6] = "createCustomAudioEvent";
    *(_DWORD *)buf = 136316162;
    *(_WORD *)&v84[4] = 2080;
    *(_WORD *)&v84[14] = 2080;
    if (!v68) {
      CFStringRef v32 = "without";
    }
    *(void *)&v84[16] = v31;
    *(_WORD *)&v84[24] = 2080;
    *(void *)&long long v85 = v32;
    _os_log_impl(&dword_1A3931000, v28, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Adding layer/zone/waveform for %s custom audio event %s envelope", buf, 0x30u);
  }
LABEL_35:
  if (v68) {
    int v33 = 10;
  }
  else {
    int v33 = 11;
  }
  if (!HapticAudioUnit::getLayerWithKey((HapticAudioUnit *)(v25 + 17), v33, &inElement))
  {
    AudioUnitElement v36 = inElement;
    goto LABEL_50;
  }
  if (v68) {
    AudioUnitElement v34 = "Custom Audio Waveforms";
  }
  else {
    AudioUnitElement v34 = "Custom Audio Waveforms No Envelope";
  }
  *(void *)buf = CFStringCreateWithCString(0, v34, 0x600u);
  int started = HapticAudioUnit::addLayer((HapticAudioUnit *)(v25 + 17), 0, v26, v33, *(const __CFString **)buf, &inElement);
  if (!started)
  {
    AudioUnitElement v36 = inElement;
    int started = HapticAudioUnit::addDefaultGainConnections((HapticAudioUnit *)(v25 + 17), inElement, v27, 0, 0);
    if (!started)
    {
      v72[0] = 0;
      int started = HapticAudioUnit::addEnvelope((HapticAudioUnit *)(v25 + 17), v36, 0, v27, v72);
      if (!started
        && (!v68
         || (int started = HapticAudioUnit::addCustomAudioEnvelopeConnections((HapticAudioUnit *)(v25 + 17), v36, v72[0])) == 0))
      {
        int started = HapticAudioUnit::addPitchConnection((HapticAudioUnit *)(v25 + 17), v36, 0, 4.0);
        if (!started)
        {
          int started = HapticAudioUnit::addFilterConnection((HapticAudioUnit *)(v25 + 17), v36, 24000.0, 2048.0);
          if (!started)
          {
            int started = HapticAudioUnit::addCustomAudioOffsetStartTimeConnection((HapticAudioUnit *)(v25 + 17), v36);
            if (!started)
            {
              Smart<__CFString const*>::~Smart((const void **)buf);
LABEL_50:
              AudioUnitElement v58 = v36;
              int CustomZoneVelocity = HapticAudioUnit::getCustomZoneVelocity((HapticAudioUnit *)(v25 + 17), v36);
              if (CustomZoneVelocity != -1)
              {
                int v39 = *(_DWORD *)(v61 + 24);
                if (kHPRSScope)
                {
                  if (*(unsigned char *)(kHPRSScope + 8))
                  {
                    if (*(void *)kHPRSScope)
                    {
                      log = *(NSObject **)kHPRSScope;
                      BOOL v40 = os_log_type_enabled(*(os_log_t *)kHPRSScope, OS_LOG_TYPE_DEBUG);
                      uint64_t v37 = log;
                      if (v40)
                      {
                        int v41 = *(_DWORD *)(v61 + 28);
                        *(_DWORD *)buf = 136316930;
                        *(void *)&uint8_t buf[4] = "HapticAudioUnit.cpp";
                        __int16 v83 = 1024;
                        *(_DWORD *)v84 = 39;
                        *(_WORD *)&v84[4] = 2080;
                        *(void *)&v84[6] = "addAudioSample";
                        *(_WORD *)&v84[14] = 2048;
                        *(void *)&v84[16] = v60;
                        *(_WORD *)&v84[24] = 1024;
                        LODWORD(v85) = v39 * v59;
                        WORD2(v85) = 1024;
                        *(_DWORD *)((char *)&v85 + 6) = v41;
                        WORD5(v85) = 1024;
                        HIDWORD(v85) = v59;
                        __int16 v86 = 1024;
                        int v87 = v39;
                        _os_log_impl(&dword_1A3931000, log, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Adding raw audio sample %p, size %u bytes. Raw audio has %u channels, %u frames, %u Bytes per frame", buf, 0x3Eu);
                      }
                    }
                  }
                }
                *(void *)__int16 v72 = v60;
                uint64_t v73 = (v39 * v59);
                long long v42 = *(_OWORD *)v61;
                long long v43 = *(_OWORD *)(v61 + 16);
                uint64_t v76 = *(void *)(v61 + 32);
                *(void *)v77 = v25 + 17;
                long long v75 = v43;
                long long v74 = v42;
                uint64_t v88 = 0x200000000;
                uint64_t v44 = v25[25];
                *(void *)buf = v72;
                *(void *)&v77[8] = v25 + 25;
                v77[16] = (*(uint64_t (**)(void *, NSObject *))(v44 + 16))(v25 + 25, v37);
                uint64_t v45 = v25[24];
                if (v45) {
                  id v46 = *(OpaqueAudioComponentInstance **)(v45 + 16);
                }
                else {
                  id v46 = 0;
                }
                int started = AudioUnitSetProperty(v46, 0x1030u, 4u, 0, buf, 0x48u);
                CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&v77[8]);
                if (!started)
                {
                  int started = HapticAudioUnit::addZoneForSample((HapticAudioUnit *)(v25 + 17), v88, v58, v33, CustomZoneVelocity, v67, 1, 0, (const __CFString *)buf, (unsigned int *)log);
                  unsigned int v30 = v33 | (CustomZoneVelocity << 8);
                  goto LABEL_47;
                }
                if (kHPRSScope)
                {
                  uint32_t v56 = *(NSObject **)kHPRSScope;
                  if (!*(void *)kHPRSScope) {
                    goto LABEL_46;
                  }
                }
                else
                {
                  uint32_t v56 = MEMORY[0x1E4F14500];
                }
                if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v77 = 136315906;
                  *(void *)&uint8_t v77[4] = "HapticAudioUnit.cpp";
                  *(_WORD *)&v77[12] = 1024;
                  *(_DWORD *)&v77[14] = 46;
                  __int16 v78 = 2080;
                  __int16 v79 = "addAudioSample";
                  __int16 v80 = 1024;
                  int v81 = started;
                  _os_log_impl(&dword_1A3931000, v56, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Unable to load generated sample: err %d", v77, 0x22u);
                }
                goto LABEL_46;
              }
              if (kHCARScope)
              {
                unint64_t v55 = *(NSObject **)kHCARScope;
                if (!*(void *)kHCARScope)
                {
LABEL_86:
                  unsigned int v30 = 0;
                  int started = -4825;
                  goto LABEL_47;
                }
              }
              else
              {
                unint64_t v55 = MEMORY[0x1E4F14500];
              }
              if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                *(void *)&uint8_t buf[4] = "HapticAudioUnit.cpp";
                __int16 v83 = 1024;
                *(_DWORD *)v84 = 1107;
                *(_WORD *)&v84[4] = 2080;
                *(void *)&v84[6] = "createCustomAudioEvent";
                _os_log_impl(&dword_1A3931000, v55, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Unable to find a velocity slot for this event", buf, 0x1Cu);
              }
              goto LABEL_86;
            }
          }
        }
      }
    }
  }
  Smart<__CFString const*>::~Smart((const void **)buf);
LABEL_46:
  unsigned int v30 = 0;
LABEL_47:
  CACFDictionary::~CACFDictionary((CACFDictionary *)&v69);
  std::mutex::unlock((std::mutex *)(v22 + 8));
  if (started)
  {
    int v29 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:started userInfo:0];
  }
  else
  {
    uint64_t v47 = *(void *)(v22 + 272);
    *(void *)buf = v22 + 96;
    buf[8] = 1;
    std::__shared_mutex_base::lock((std::__shared_mutex_base *)(v22 + 96));
    *(void *)&v84[2] = v22 + 72;
    *(void *)&v84[10] = v22 + 264;
    *(void *)&v84[18] = v47;
    *(unsigned char *)(v22 + 264) = 1;
    std::__tree<std::__value_type<unsigned int const,unsigned int>,std::__map_value_compare<unsigned int const,std::__value_type<unsigned int const,unsigned int>,std::less<unsigned int const>,true>,std::allocator<std::__value_type<unsigned int const,unsigned int>>>::__emplace_unique_impl<std::tuple<unsigned int const,unsigned int> &>((uint64_t **)(v22 + 72), COERCE_DOUBLE(v30 | 0x100000000));
    **(unsigned char **)&v84[10] = 0;
    std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)buf);
    uint64_t v48 = v65;
    int v49 = atomic_load((unsigned int *)(v65 + 120));
    uint64_t v50 = *(void *)(v48 + 904);
    *(void *)buf = v48 + 728;
    buf[8] = 1;
    std::__shared_mutex_base::lock((std::__shared_mutex_base *)(v48 + 728));
    uint64_t v51 = 0x100000000;
    if (v49 > 1) {
      uint64_t v51 = 0x200000000;
    }
    *(void *)&v84[2] = v65 + 704;
    *(void *)&v84[10] = v65 + 896;
    *(void *)&v84[18] = v50;
    *(unsigned char *)(v65 + 896) = 1;
    std::__tree<std::__value_type<unsigned int const,unsigned int>,std::__map_value_compare<unsigned int const,std::__value_type<unsigned int const,unsigned int>,std::less<unsigned int const>,true>,std::allocator<std::__value_type<unsigned int const,unsigned int>>>::__emplace_unique_impl<std::tuple<unsigned int const,unsigned int> &>((uint64_t **)(v65 + 704), COERCE_DOUBLE(v51 | v30));
    **(unsigned char **)&v84[10] = 0;
    std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)buf);
    int v29 = 0;
  }
  id v12 = v62;
LABEL_62:
  if (v66) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v66);
  }
  objc_sync_exit(v17);

  if (kHCARScope)
  {
    if (*(unsigned char *)(kHCARScope + 8))
    {
      int v52 = *(id *)kHCARScope;
      if (v52)
      {
        int v53 = v52;
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        {
          __int16 v54 = _Block_copy(v13);
          *(_DWORD *)buf = 136316418;
          *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
          __int16 v83 = 1024;
          *(_DWORD *)v84 = 1068;
          *(_WORD *)&v84[4] = 2080;
          *(void *)&v84[6] = "-[AVHapticServerInstance createCustomAudioEvent:format:frames:options:reply:]";
          *(_WORD *)&v84[14] = 2048;
          *(void *)&v84[16] = v54;
          *(_WORD *)&v84[24] = 1024;
          LODWORD(v85) = v30;
          WORD2(v85) = 2112;
          *(void *)((char *)&v85 + 6) = v29;
          _os_log_impl(&dword_1A3931000, v53, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: invoking callback %p with eventID %u and error %@", buf, 0x36u);
        }
      }
    }
  }
  (*((void (**)(id, void, void *))v13 + 2))(v13, v30, v29);
}

- (void)releaseClientResources
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
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
    unint64_t clientID = self->_clientID;
    *(_DWORD *)buf = 136315906;
    uint64_t v24 = "AVHapticServer.mm";
    __int16 v25 = 1024;
    int v26 = 1033;
    __int16 v27 = 2080;
    BOOL v28 = "-[AVHapticServerInstance releaseClientResources]";
    __int16 v29 = 2048;
    unint64_t v30 = clientID;
    _os_log_impl(&dword_1A3931000, v3, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx", buf, 0x26u);
  }

LABEL_8:
  int v6 = self->_master;
  objc_sync_enter(v6);
  master = self->_master;
  if (master)
  {
    [(AVHapticServer *)master entryWithID:self->_clientID];
    id v8 = self->_master;
  }
  else
  {
    id v8 = 0;
    uint64_t v21 = 0;
    uint64_t v22 = 0;
  }
  objc_initWeak(&location, v8);
  objc_initWeak(&from, self);
  if (kHSRVScope)
  {
    if (*(unsigned char *)(kHSRVScope + 8))
    {
      int v9 = *(id *)kHSRVScope;
      if (v9)
      {
        int v10 = v9;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v24 = "AVHapticServer.mm";
          __int16 v25 = 1024;
          int v26 = 1039;
          __int16 v27 = 2080;
          BOOL v28 = "-[AVHapticServerInstance releaseClientResources]";
          _os_log_impl(&dword_1A3931000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Dispatching doStopRunning on ACQ", buf, 0x1Cu);
        }
      }
    }
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3321888768;
  v15[2] = __48__AVHapticServerInstance_releaseClientResources__block_invoke;
  v15[3] = &unk_1EF728B88;
  objc_copyWeak(&v16, &from);
  objc_copyWeak(v17, &location);
  v17[1] = v21;
  uint64_t v18 = v22;
  if (v22) {
    atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v15[4] = self;
  if (AudioControlQueue(void)::once != -1) {
    dispatch_once(&AudioControlQueue(void)::once, &__block_literal_global_8);
  }
  id v11 = (id)AudioControlQueue(void)::gAudioControlQueue;
  AT::DispatchBlock(v11, v15, 0, (uint64_t)"-[AVHapticServerInstance releaseClientResources]", (uint64_t)"AVHapticServer.mm", 1043);

  if (_os_feature_enabled_impl() && [(AVHapticServerInstance *)self runIncludesAudio]) {
    (*(void (**)(HapticSession *, void))(*(void *)self->_hapticSession.__ptr_ + 56))(self->_hapticSession.__ptr_, 0);
  }
  id v12 = self->_master;
  id v13 = v21;
  uint64_t v14 = v22;
  if (v22) {
    atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [(AVHapticServer *)v12 doReleaseClientResources:&v13];
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
  objc_destroyWeak(v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  if (v22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
  }
  objc_sync_exit(v6);
}

void __48__AVHapticServerInstance_releaseClientResources__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setWasRunningAndSuspended:0];

  id v3 = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = *(std::__shared_weak_count **)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 56);
  int v6 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  objc_msgSend(v3, "doStopRunning:audio:haptics:", &v5, objc_msgSend(*(id *)(a1 + 32), "runIncludesAudio", v5), objc_msgSend(*(id *)(a1 + 32), "runIncludesHaptics"));
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

- (void)allocateClientResources:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (kHSRVScope)
  {
    uint64_t v5 = *(id *)kHSRVScope;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unint64_t clientID = self->_clientID;
    *(_DWORD *)buf = 136315906;
    int v41 = "AVHapticServer.mm";
    __int16 v42 = 1024;
    int v43 = 1004;
    __int16 v44 = 2080;
    uint64_t v45 = "-[AVHapticServerInstance allocateClientResources:]";
    __int16 v46 = 2048;
    unint64_t v47 = clientID;
    _os_log_impl(&dword_1A3931000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx", buf, 0x26u);
  }

LABEL_8:
  id v8 = self->_master;
  objc_sync_enter(v8);
  master = self->_master;
  id v39 = 0;
  BOOL v10 = [(AVHapticServer *)master incrementInit:&v39];
  id v11 = v39;
  if (!v10)
  {
    (*((void (**)(id, void, void, id))v4 + 2))(v4, 0, 0, v11);
    goto LABEL_61;
  }
  id v12 = self->_master;
  if (!v12)
  {
    uint64_t v37 = 0;
    int v38 = 0;
    goto LABEL_18;
  }
  [(AVHapticServer *)v12 entryWithID:self->_clientID];
  if (!v37)
  {
LABEL_18:
    uint64_t v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4812 userInfo:0];

    id v11 = (id)v17;
    (*((void (**)(id, void, void, uint64_t))v4 + 2))(v4, 0, 0, v17);
    goto LABEL_59;
  }
  v36.fObj = (OS_dispatch_object *)xpc_null_create();
  unsigned int v35 = 2688;
  uint64_t v13 = (uint64_t)v37;
  ptr = self->_hapticSession.__ptr_;
  cntrl = self->_hapticSession.__cntrl_;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  if (kHSRVScope)
  {
    id v16 = *(id *)kHSRVScope;
    if (!v16) {
      goto LABEL_23;
    }
  }
  else
  {
    id v16 = MEMORY[0x1E4F14500];
    id v18 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = v37[3];
    *(_DWORD *)buf = 136315906;
    int v41 = "ClientEntry.mm";
    __int16 v42 = 1024;
    int v43 = 154;
    __int16 v44 = 2080;
    uint64_t v45 = "initialize";
    __int16 v46 = 1024;
    LODWORD(v47) = v19;
    _os_log_impl(&dword_1A3931000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: client ID: 0x%x", buf, 0x22u);
  }

LABEL_23:
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  uint64_t v20 = (std::__shared_weak_count *)v37[9];
  v37[8] = ptr;
  *(void *)(v13 + 72) = cntrl;
  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
  int v21 = HapticSharedMemoryReader::allocate((HapticSharedMemoryReader *)(v13 + 128), &v36, &v35);
  if (v21) {
    goto LABEL_40;
  }
  ClientEntry::setState(v13, 1u);
  if (*(void *)(v13 + 472))
  {
    if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v41 = "ClientEntry.mm";
      __int16 v42 = 1024;
      int v43 = 159;
      _os_log_impl(&dword_1A3931000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d ASSERTION FAILURE [(_channelIDsToBeDetached.size() == 0) != 0 is false]: ", buf, 0x12u);
    }
    __break(1u);
    goto LABEL_65;
  }
  if (SupportsMultiAudioOutput::once != -1) {
LABEL_65:
  }
    dispatch_once(&SupportsMultiAudioOutput::once, &__block_literal_global_3_11619);
  int v21 = 0;
  if (gHapticAudioMultiOutputEnabled && ptr)
  {
    if (kHSRVScope)
    {
      uint64_t v22 = *(id *)kHSRVScope;
      if (!v22)
      {
LABEL_39:
        uint64_t v25 = *(void *)(*(void *)(v13 + 224) + 232);
        uint64_t v26 = *(void *)(v13 + 24);
        uint64_t v27 = (*(uint64_t (**)(void))(**(void **)(v13 + 64) + 16))(*(void *)(v13 + 64));
        int v21 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v25 + 136))(v25, v26, v27, v13 + 32);
        goto LABEL_40;
      }
    }
    else
    {
      uint64_t v22 = MEMORY[0x1E4F14500];
      id v23 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      unint64_t v24 = *(void *)(v13 + 24);
      *(_DWORD *)buf = 136315906;
      int v41 = "ClientEntry.mm";
      __int16 v42 = 1024;
      int v43 = 193;
      __int16 v44 = 2080;
      uint64_t v45 = "addAudioOutput";
      __int16 v46 = 2048;
      unint64_t v47 = v24;
      _os_log_impl(&dword_1A3931000, v22, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Registering audio SynthOutput for client ID: 0x%lx", buf, 0x26u);
    }

    goto LABEL_39;
  }
LABEL_40:
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  if (v21)
  {
    uint64_t v28 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:v21 userInfo:0];
  }
  else
  {
    uint64_t v28 = 0;
  }

  if (kHSRVScope)
  {
    if (*(unsigned char *)(kHSRVScope + 8))
    {
      __int16 v29 = *(id *)kHSRVScope;
      if (v29)
      {
        unint64_t v30 = v29;
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v31 = _Block_copy(v4);
          *(_DWORD *)buf = 136316418;
          int v41 = "AVHapticServer.mm";
          __int16 v42 = 1024;
          int v43 = 1023;
          __int16 v44 = 2080;
          uint64_t v45 = "-[AVHapticServerInstance allocateClientResources:]";
          __int16 v46 = 2048;
          unint64_t v47 = (unint64_t)v31;
          __int16 v48 = 1024;
          unsigned int v49 = v35;
          __int16 v50 = 2112;
          uint64_t v51 = v28;
          _os_log_impl(&dword_1A3931000, v30, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: invoking callback %p with sharedBufferSize %u and error %@", buf, 0x36u);
        }
      }
    }
  }
  fObj = v36.fObj;
  (*((void (**)(id, OS_dispatch_object *, void, uint64_t))v4 + 2))(v4, v36.fObj, v35, v28);
  if (!kHSRVScope)
  {
    int v33 = MEMORY[0x1E4F14500];
    id v34 = MEMORY[0x1E4F14500];
    goto LABEL_55;
  }
  int v33 = *(id *)kHSRVScope;
  if (v33)
  {
LABEL_55:
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      int v41 = "AVHapticServer.mm";
      __int16 v42 = 1024;
      int v43 = 1025;
      __int16 v44 = 2080;
      uint64_t v45 = "-[AVHapticServerInstance allocateClientResources:]";
      _os_log_impl(&dword_1A3931000, v33, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Done", buf, 0x1Cu);
    }
  }
  id v11 = (id)v28;
LABEL_59:
  if (v38) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v38);
  }
LABEL_61:

  objc_sync_exit(v8);
}

- (void)queryCapabilities:(id)a3 reply:(id)a4
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v6 = (std::string *)a3;
  id v7 = (void (**)(id, void, uint64_t))a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v65 = 0;
  __int16 v66 = &v65;
  uint64_t v67 = 0x3032000000;
  BOOL v68 = __Block_byref_object_copy__3702;
  id v69 = __Block_byref_object_dispose__3703;
  id v70 = 0;
  int v9 = unk_1EF74A950(v6, "objectForKey:", @"RequestedLocality");
  memset(&__p, 0, sizeof(__p));
  if ([v9 length])
  {
    std::string::basic_string[abi:ne180100]<0>(buf, (char *)[v9 UTF8String]);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    std::string __p = *(std::string *)buf;
  }
  std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
  }
  if (size)
  {
    if (std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::__count_unique<std::string>(*(void **)(*(void *)([(AVHapticServer *)self->_master manager] + 232) + 16), &__p))
    {
      if (kHSRVScope)
      {
        id v11 = *(id *)kHSRVScope;
        if (!v11)
        {
LABEL_21:
          id v16 = (uint64_t **)(*(void *)([(AVHapticServer *)self->_master manager] + 232) + 8);
          *(void *)buf = &__p;
          uint64_t v17 = std::__tree<std::__value_type<std::string,Locality>,std::__map_value_compare<std::string,std::__value_type<std::string,Locality>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Locality>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v16, &__p, (long long **)buf);
          id v12 = (std::string *)operator new(0x98uLL);
          id v18 = (const Locality *)(v17 + 7);
          v12->__r_.__value_.__l.__size_ = 0;
          v12->__r_.__value_.__r.__words[2] = 0;
          v12->__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_1EF728DB0;
          uint64_t v13 = v12 + 1;
          Locality::Locality(v12 + 1, v18);
          goto LABEL_27;
        }
      }
      else
      {
        id v11 = MEMORY[0x1E4F14500];
        id v14 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        p_p = &__p;
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
        *(_WORD *)&unsigned char buf[12] = 1024;
        *(_DWORD *)&buf[14] = 831;
        *(_WORD *)&unsigned char buf[18] = 2080;
        *(void *)&buf[20] = "-[AVHapticServerInstance queryCapabilities:reply:]";
        __int16 v72 = 2080;
        uint64_t v73 = p_p;
        _os_log_impl(&dword_1A3931000, v11, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Found Locality: %s", buf, 0x26u);
      }

      goto LABEL_21;
    }
  }
  else
  {
    if (kHSRVScope)
    {
      id v12 = (std::string *)*(id *)kHSRVScope;
      if (!v12)
      {
        uint64_t v13 = 0;
        goto LABEL_27;
      }
    }
    else
    {
      id v12 = (std::string *)MEMORY[0x1E4F14500];
      id v19 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 826;
      *(_WORD *)&unsigned char buf[18] = 2080;
      *(void *)&buf[20] = "-[AVHapticServerInstance queryCapabilities:reply:]";
      _os_log_impl(&dword_1A3931000, (os_log_t)v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: No Locality passed in", buf, 0x1Cu);
    }
  }
  uint64_t v13 = 0;
  id v12 = 0;
LABEL_27:
  master = self->_master;
  if (!master)
  {
    uint64_t v62 = 0;
    id v63 = 0;
    goto LABEL_35;
  }
  [(AVHapticServer *)master entryWithID:self->_clientID];
  if (!v62)
  {
LABEL_35:
    uint64_t v26 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4812 userInfo:0];
    uint64_t v27 = (void *)v66[5];
    v66[5] = v26;

    v7[2](v7, 0, v66[5]);
    uint64_t v28 = v9;
    goto LABEL_102;
  }
  int v21 = unk_1EF74A958(v6, "objectForKey:", @"RequestedPriority");
  uint64_t v22 = v21;
  if (v21)
  {
    uint64_t v23 = [v21 unsignedIntegerValue];
    int v24 = v23;
    switch(v23)
    {
      case 0:
        goto LABEL_31;
      case 1:
        uint64_t v31 = v62;
        int v32 = 1000;
        goto LABEL_47;
      case 2:
        uint64_t v31 = v62;
        int v32 = 1001;
        goto LABEL_47;
      case 3:
        uint64_t v31 = v62;
        int v32 = 1003;
        goto LABEL_47;
      case 4:
        uint64_t v31 = v62;
        int v32 = 1002;
LABEL_47:
        *(_DWORD *)(v31 + 104) = v32;
        goto LABEL_48;
      default:
        if (kHSRVScope)
        {
          unint64_t v30 = *(id *)kHSRVScope;
          if (!v30) {
            goto LABEL_113;
          }
        }
        else
        {
          unint64_t v30 = MEMORY[0x1E4F14500];
          id v50 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
          *(_WORD *)&unsigned char buf[12] = 1024;
          *(_DWORD *)&buf[14] = 869;
          *(_WORD *)&unsigned char buf[18] = 2080;
          *(void *)&buf[20] = "-[AVHapticServerInstance queryCapabilities:reply:]";
          __int16 v72 = 1024;
          LODWORD(v73) = v24;
          _os_log_impl(&dword_1A3931000, v30, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Illegal priority: %u", buf, 0x22u);
        }

LABEL_113:
        uint64_t v51 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4850 userInfo:0];
        uint64_t v52 = (void *)v66[5];
        v66[5] = v51;

        v7[2](v7, 0, v66[5]);
        int v43 = v22;
        uint64_t v28 = v9;
        break;
    }
    goto LABEL_101;
  }
LABEL_31:
  if (kHSRVScope)
  {
    uint64_t v25 = *(id *)kHSRVScope;
    if (!v25) {
      goto LABEL_48;
    }
  }
  else
  {
    uint64_t v25 = MEMORY[0x1E4F14500];
    id v29 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 866;
    *(_WORD *)&unsigned char buf[18] = 2080;
    *(void *)&buf[20] = "-[AVHapticServerInstance queryCapabilities:reply:]";
    _os_log_impl(&dword_1A3931000, v25, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: No Priority passed in", buf, 0x1Cu);
  }

LABEL_48:
  int v33 = unk_1EF74A960(v6, "objectForKey:", @"RequestedPowerUsage");

  if (v33)
  {
    uint64_t v34 = [v33 unsignedIntegerValue];
    int v35 = v34;
    if (v34)
    {
      if (v34 == 11)
      {
        *(unsigned char *)(v62 + 108) = 1;
        goto LABEL_69;
      }
      if (v34 == 10)
      {
        *(unsigned char *)(v62 + 108) = 0;
        goto LABEL_69;
      }
      if (kHSRVScope)
      {
        int v38 = *(id *)kHSRVScope;
        if (!v38)
        {
LABEL_68:
          uint64_t v40 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4850 userInfo:0];
          int v41 = (void *)v66[5];
          v66[5] = v40;

          v7[2](v7, 0, v66[5]);
          goto LABEL_69;
        }
      }
      else
      {
        int v38 = MEMORY[0x1E4F14500];
        id v39 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
        *(_WORD *)&unsigned char buf[12] = 1024;
        *(_DWORD *)&buf[14] = 895;
        *(_WORD *)&unsigned char buf[18] = 2080;
        *(void *)&buf[20] = "-[AVHapticServerInstance queryCapabilities:reply:]";
        __int16 v72 = 1024;
        LODWORD(v73) = v35;
        _os_log_impl(&dword_1A3931000, v38, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Illegal power usage: %u", buf, 0x22u);
      }

      goto LABEL_68;
    }
  }
  if (kHSRVScope)
  {
    object v36 = *(id *)kHSRVScope;
    if (!v36) {
      goto LABEL_69;
    }
  }
  else
  {
    object v36 = MEMORY[0x1E4F14500];
    id v37 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 892;
    *(_WORD *)&unsigned char buf[18] = 2080;
    *(void *)&buf[20] = "-[AVHapticServerInstance queryCapabilities:reply:]";
    _os_log_impl(&dword_1A3931000, v36, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: No Power usage passed in", buf, 0x1Cu);
  }

LABEL_69:
  __int16 v42 = unk_1EF74A968(v6, "objectForKey:", @"AllowBackgroundHaptics");

  int v43 = v42;
  if (v42) {
    *(unsigned char *)(v62 + 216) = [v42 BOOLValue];
  }
  uint64_t v28 = unk_1EF74A970(v6, "objectForKey:", @"RequestedUsageCategory");

  if (!v28) {
    goto LABEL_79;
  }
  id v44 = v28;
  if ([v44 isEqualToString:@"UIFeedback"])
  {
    int v45 = 1;
  }
  else
  {
    if (![v44 isEqualToString:@"iOSKeyboard"])
    {
      *(_DWORD *)(v62 + 112) = 0;
      goto LABEL_78;
    }
    int v45 = 2;
  }
  *(_DWORD *)(v62 + 112) = v45;
LABEL_78:

LABEL_79:
  if (HardwareSupportsHaptics::sCheckServer_Once != -1) {
    dispatch_once(&HardwareSupportsHaptics::sCheckServer_Once, &__block_literal_global_11611);
  }
  char v46 = HardwareSupportsHaptics::sHapticsSupported;
  if (kHSRVScope)
  {
    if (*(unsigned char *)(kHSRVScope + 8))
    {
      unint64_t v47 = *(id *)kHSRVScope;
      if (v47)
      {
        __int16 v48 = v47;
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
          *(_WORD *)&unsigned char buf[12] = 1024;
          *(_DWORD *)&buf[14] = 917;
          *(_WORD *)&unsigned char buf[18] = 2080;
          *(void *)&buf[20] = "-[AVHapticServerInstance queryCapabilities:reply:]";
          __int16 v72 = 2112;
          uint64_t v73 = v6;
          _os_log_impl(&dword_1A3931000, v48, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: queries: %@", buf, 0x26u);
        }
      }
    }
  }
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3321888768;
  v53[2] = __50__AVHapticServerInstance_queryCapabilities_reply___block_invoke;
  v53[3] = &unk_1EF728BC0;
  id v49 = v8;
  char v61 = v46;
  id v54 = v49;
  uint64_t v56 = v62;
  id v57 = v63;
  if (v63) {
    atomic_fetch_add_explicit(&v63->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  AudioUnitElement v58 = v13;
  int v59 = (std::__shared_weak_count *)v12;
  if (v12) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)&v12->__r_.__value_.__l.__size_, 1uLL, memory_order_relaxed);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v60, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  }
  else {
    std::string v60 = __p;
  }
  unint64_t v55 = &v65;
  unk_1EF74A978(v6, "enumerateKeysAndObjectsUsingBlock:", v53);
  ((void (**)(id, id, uint64_t))v7)[2](v7, v49, v66[5]);
  if (SHIBYTE(v60.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v60.__r_.__value_.__l.__data_);
  }
  if (v59) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v59);
  }
  if (v57) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v57);
  }

LABEL_101:
LABEL_102:
  if (v63) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v63);
  }
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v12);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  _Block_object_dispose(&v65, 8);
}

void __50__AVHapticServerInstance_queryCapabilities_reply___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (kHSRVScope)
  {
    if (*(unsigned char *)(kHSRVScope + 8))
    {
      int v9 = *(id *)kHSRVScope;
      if (v9)
      {
        BOOL v10 = v9;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          std::string v60 = "AVHapticServer.mm";
          __int16 v61 = 1024;
          int v62 = 921;
          __int16 v63 = 2080;
          id v64 = "-[AVHapticServerInstance queryCapabilities:reply:]_block_invoke";
          __int16 v65 = 2112;
          __int16 v66 = v7;
          _os_log_impl(&dword_1A3931000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: key: %@", buf, 0x26u);
        }
      }
    }
  }
  if ([v7 isEqualToString:@"SupportsHapticPlayback"])
  {
    id v11 = *(void **)(a1 + 32);
    id v12 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 104)];
    [v11 setObject:v12 forKey:v7];

    goto LABEL_42;
  }
  if ([v7 isEqualToString:@"SupportsAudioPlayback"]
    || [v7 isEqualToString:@"SupportsAdvancedPatternPlayers"])
  {
    goto LABEL_15;
  }
  if ([v7 isEqualToString:@"HapticContinuousTimeLimit"])
  {
    uint64_t v13 = *(void **)(a1 + 32);
    id v14 = [NSNumber numberWithUnsignedInt:30];
    [v13 setObject:v14 forKey:v7];

    goto LABEL_42;
  }
  if ([v7 isEqualToString:@"UsingInternalHaptics"])
  {
LABEL_15:
    id v15 = *(void **)(a1 + 32);
    id v16 = [NSNumber numberWithBool:1];
    [v15 setObject:v16 forKey:v7];

    goto LABEL_42;
  }
  if ([v7 isEqualToString:@"BuiltInAudioEventIDs"])
  {
    uint64_t v17 = *(void **)(a1 + 32);
    id v18 = ClientEntry::getBuiltInAudioEventsDictionary(*(ClientEntry **)(a1 + 48));
    [v17 setObject:v18 forKey:v7];

    goto LABEL_42;
  }
  if ([v7 isEqualToString:@"HapticTransientDefaultIntensity"])
  {
    uint64_t v20 = *(void *)(a1 + 64);
    if (v20)
    {
      int v21 = *(void **)(a1 + 32);
      LODWORD(v19) = *(_DWORD *)(v20 + 36);
      uint64_t v22 = [NSNumber numberWithFloat:v19];
      [v21 setObject:v22 forKey:v7];
    }
    goto LABEL_42;
  }
  if ([v7 isEqualToString:@"HapticTransientDefaultSharpness"])
  {
    uint64_t v24 = *(void *)(a1 + 64);
    if (v24)
    {
      uint64_t v25 = *(void **)(a1 + 32);
      LODWORD(v23) = *(_DWORD *)(v24 + 40);
      uint64_t v26 = [NSNumber numberWithFloat:v23];
      [v25 setObject:v26 forKey:v7];
    }
    goto LABEL_42;
  }
  if ([v7 isEqualToString:@"HapticContinuousDefaultIntensity"])
  {
    uint64_t v28 = *(void *)(a1 + 64);
    if (v28)
    {
      id v29 = *(void **)(a1 + 32);
      LODWORD(v27) = *(_DWORD *)(v28 + 44);
      unint64_t v30 = [NSNumber numberWithFloat:v27];
      [v29 setObject:v30 forKey:v7];
    }
    goto LABEL_42;
  }
  if ([v7 isEqualToString:@"HapticContinuousDefaultSharpness"])
  {
    uint64_t v32 = *(void *)(a1 + 64);
    if (v32)
    {
      int v33 = *(void **)(a1 + 32);
      LODWORD(v31) = *(_DWORD *)(v32 + 48);
      uint64_t v34 = [NSNumber numberWithFloat:v31];
      [v33 setObject:v34 forKey:v7];
    }
    goto LABEL_42;
  }
  if ([v7 isEqualToString:@"HapticTransientEventIDs"])
  {
    uint64_t v35 = *(void *)(a1 + 64);
    if (!v35) {
      goto LABEL_42;
    }
    object v36 = *(void **)(a1 + 32);
    memset(v58, 0, sizeof(v58));
    std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(v58, *(const void **)(v35 + 56), *(void *)(v35 + 64), (uint64_t)(*(void *)(v35 + 64) - *(void *)(v35 + 56)) >> 2);
    id v37 = vectorOfUInt32ToNSArray(v58);
    [v36 setObject:v37 forKey:v7];

    int v38 = v58[0];
    if (!v58[0]) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }
  if ([v7 isEqualToString:@"HapticContinuousSustainedEventIDs"])
  {
    uint64_t v39 = *(void *)(a1 + 64);
    if (!v39) {
      goto LABEL_42;
    }
    uint64_t v40 = *(void **)(a1 + 32);
    memset(v57, 0, sizeof(v57));
    std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(v57, *(const void **)(v39 + 80), *(void *)(v39 + 88), (uint64_t)(*(void *)(v39 + 88) - *(void *)(v39 + 80)) >> 2);
    int v41 = vectorOfUInt32ToNSArray(v57);
    [v40 setObject:v41 forKey:v7];

    int v38 = v57[0];
    if (!v57[0]) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }
  if ([v7 isEqualToString:@"HapticContinuousNonsustainedEventIDs"])
  {
    uint64_t v42 = *(void *)(a1 + 64);
    if (!v42) {
      goto LABEL_42;
    }
    int v43 = *(void **)(a1 + 32);
    memset(__p, 0, sizeof(__p));
    std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(__p, *(const void **)(v42 + 104), *(void *)(v42 + 112), (uint64_t)(*(void *)(v42 + 112) - *(void *)(v42 + 104)) >> 2);
    id v44 = vectorOfUInt32ToNSArray((unsigned int **)__p);
    [v43 setObject:v44 forKey:v7];

    int v38 = (unsigned int *)__p[0];
    if (!__p[0]) {
      goto LABEL_42;
    }
LABEL_41:
    operator delete(v38);
    goto LABEL_42;
  }
  if (([v7 isEqualToString:@"RequestedPriority"] & 1) != 0
    || ([v7 isEqualToString:@"RequestedPowerUsage"] & 1) != 0
    || ([v7 isEqualToString:@"RequestedUsageCategory"] & 1) != 0
    || ([v7 isEqualToString:@"AllowBackgroundHaptics"] & 1) != 0)
  {
    goto LABEL_42;
  }
  if (*(char *)(a1 + 103) < 0) {
    uint64_t v46 = *(void *)(a1 + 88);
  }
  else {
    uint64_t v46 = *(unsigned __int8 *)(a1 + 103);
  }
  if (!v46)
  {
    id v49 = CALog::LogObjIfEnabled((CALog *)2, kHSRVScope, v45);
    __int16 v48 = v49;
    if (v49 && os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      std::string v60 = "AVHapticServer.mm";
      __int16 v61 = 1024;
      int v62 = 992;
      __int16 v63 = 2080;
      id v64 = "-[AVHapticServerInstance queryCapabilities:reply:]_block_invoke";
      __int16 v65 = 2112;
      __int16 v66 = v7;
      _os_log_impl(&dword_1A3931000, v48, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: WARNING: Unrecognized server query: '%@'", buf, 0x26u);
    }
    goto LABEL_56;
  }
  if (!*(unsigned char *)(a1 + 104) || *(void *)(a1 + 64))
  {
    unint64_t v47 = CALog::LogObjIfEnabled((CALog *)4, kHSRVScope, v45);
    __int16 v48 = v47;
    if (v47 && os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      std::string v60 = "AVHapticServer.mm";
      __int16 v61 = 1024;
      int v62 = 988;
      __int16 v63 = 2080;
      id v64 = "-[AVHapticServerInstance queryCapabilities:reply:]_block_invoke";
      _os_log_impl(&dword_1A3931000, v48, OS_LOG_TYPE_INFO, "%25s:%-5d %s: No Localities supported by server - ignoring", buf, 0x1Cu);
    }
LABEL_56:

    goto LABEL_42;
  }
  id v50 = CALog::LogObjIfEnabled((CALog *)1, kHSRVScope, v45);
  uint64_t v51 = v50;
  if (v50 && os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
  {
    uint64_t v52 = (void *)(a1 + 80);
    if (*(char *)(a1 + 103) < 0) {
      uint64_t v52 = (void *)*v52;
    }
    *(_DWORD *)buf = 136315906;
    std::string v60 = "AVHapticServer.mm";
    __int16 v61 = 1024;
    int v62 = 983;
    __int16 v63 = 2080;
    id v64 = "-[AVHapticServerInstance queryCapabilities:reply:]_block_invoke";
    __int16 v65 = 2080;
    __int16 v66 = v52;
    _os_log_impl(&dword_1A3931000, v51, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Failed to find Locality: %s", buf, 0x26u);
  }

  uint64_t v53 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-4850 userInfo:0];
  uint64_t v54 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v55 = *(void **)(v54 + 40);
  *(void *)(v54 + 40) = v53;

  *a4 = 1;
LABEL_42:
}

- (void)configureWithOptions:(id)a3 reply:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, unint64_t))a4;
  double v31 = [v6 objectForKey:@"AudioSessionID"];
  id v8 = [v6 objectForKey:@"AudioSessionIsShared"];
  int v9 = [v6 objectForKey:@"BypassAudioSession"];
  uint64_t v10 = [v31 unsignedIntegerValue];
  uint64_t v11 = [v8 BOOLValue];
  int v12 = [v9 BOOLValue];
  if (kHSRVScope)
  {
    uint64_t v13 = *(id *)kHSRVScope;
    if (!v13) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v13 = MEMORY[0x1E4F14500];
    id v14 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v15 = "not shared";
    *(_DWORD *)buf = 136316418;
    object v36 = "AVHapticServer.mm";
    int v38 = 780;
    __int16 v37 = 1024;
    uint64_t v40 = "-[AVHapticServerInstance configureWithOptions:reply:]";
    __int16 v39 = 2080;
    if (v11) {
      id v15 = "shared";
    }
    __int16 v41 = 1024;
    *(_DWORD *)uint64_t v42 = v10;
    *(_WORD *)&v42[4] = 2080;
    *(void *)&v42[6] = v15;
    __int16 v43 = 1024;
    int v44 = v12;
    _os_log_impl(&dword_1A3931000, v13, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] called by client with sessionID: %u (%s), bypassAudioSession: %u", buf, 0x32u);
  }

LABEL_10:
  master = self->_master;
  if (!master)
  {
    uint64_t v33 = 0;
    uint64_t v34 = 0;
LABEL_17:
    if (kHSRVScope)
    {
      id v18 = *(id *)kHSRVScope;
      if (!v18)
      {
LABEL_24:
        unint64_t v21 = 0;
LABEL_35:
        v7[2](v7, v21);
        uint64_t v28 = 0;
        goto LABEL_36;
      }
    }
    else
    {
      id v18 = MEMORY[0x1E4F14500];
      id v19 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      unint64_t clientID = self->_clientID;
      *(_DWORD *)buf = 136315906;
      object v36 = "AVHapticServer.mm";
      __int16 v37 = 1024;
      int v38 = 797;
      __int16 v39 = 2080;
      uint64_t v40 = "-[AVHapticServerInstance configureWithOptions:reply:]";
      __int16 v41 = 2048;
      *(void *)uint64_t v42 = clientID;
      _os_log_impl(&dword_1A3931000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: No matching entry found for clientID 0x%lx", buf, 0x26u);
    }

    goto LABEL_24;
  }
  [(AVHapticServer *)master entryWithID:self->_clientID];
  if (!v33) {
    goto LABEL_17;
  }
  if (v12)
  {
    if (kHSRVScope)
    {
      uint64_t v17 = *(id *)kHSRVScope;
      if (!v17)
      {
LABEL_34:
        unint64_t v21 = self->_clientID;
        goto LABEL_35;
      }
    }
    else
    {
      uint64_t v17 = MEMORY[0x1E4F14500];
      id v26 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      unint64_t v27 = self->_clientID;
      *(_DWORD *)buf = 136315906;
      object v36 = "AVHapticServer.mm";
      __int16 v37 = 1024;
      int v38 = 785;
      __int16 v39 = 2080;
      uint64_t v40 = "-[AVHapticServerInstance configureWithOptions:reply:]";
      __int16 v41 = 2048;
      *(void *)uint64_t v42 = v27;
      _os_log_impl(&dword_1A3931000, v17, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Skipping setting up AudioSession; replying with 0x%lx",
        buf,
        0x26u);
    }

    goto LABEL_34;
  }
  id v32 = 0;
  BOOL v22 = [(AVHapticServerInstance *)self setupAudioSessionFromID:v10 isShared:v11 error:&v32];
  id v23 = v32;
  if (v22)
  {
    if (kHSRVScope)
    {
      uint64_t v24 = *(id *)kHSRVScope;
      if (!v24)
      {
LABEL_43:
        unint64_t v25 = self->_clientID;
        goto LABEL_44;
      }
    }
    else
    {
      uint64_t v24 = MEMORY[0x1E4F14500];
      id v29 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      unint64_t v30 = self->_clientID;
      *(_DWORD *)buf = 136315906;
      object v36 = "AVHapticServer.mm";
      __int16 v37 = 1024;
      int v38 = 789;
      __int16 v39 = 2080;
      uint64_t v40 = "-[AVHapticServerInstance configureWithOptions:reply:]";
      __int16 v41 = 2048;
      *(void *)uint64_t v42 = v30;
      _os_log_impl(&dword_1A3931000, v24, OS_LOG_TYPE_INFO, "%25s:%-5d %s: replying with 0x%lx", buf, 0x26u);
    }

    goto LABEL_43;
  }
  unint64_t v25 = 0;
LABEL_44:
  v7[2](v7, v25);
  uint64_t v28 = v23;
LABEL_36:
  if (v34) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v34);
  }
}

- (BOOL)setupAudioSessionFromID:(unsigned int)a3 isShared:(BOOL)a4 error:(id *)a5
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  memset(&v6, 0, sizeof(v6));
  HapticSession::create_shared((HapticSession *)buf, a3, a4, &v6);
}

uint64_t __65__AVHapticServerInstance_setupAudioSessionFromID_isShared_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) muteClientForRingerSwitch:1];
}

uint64_t __65__AVHapticServerInstance_setupAudioSessionFromID_isShared_error___block_invoke_36(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleClientApplicationStateChangeUsingAppState:*(unsigned int *)(a1 + 40)];
}

- (void)handleConnectionError
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
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
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t clientID = self->_clientID;
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
    __int16 v49 = 1024;
    *(_DWORD *)id v50 = 683;
    *(_WORD *)&v50[4] = 2080;
    *(void *)&v50[6] = "-[AVHapticServerInstance handleConnectionError]";
    *(_WORD *)&v50[14] = 2048;
    *(void *)&v50[16] = clientID;
    _os_log_impl(&dword_1A3931000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: [xpc] clientID: 0x%lx", buf, 0x26u);
  }

LABEL_8:
  audit_token_t v6 = self->_master;
  objc_sync_enter(v6);
  [(AVHapticServerInstance *)self removeSessionListeners];
  master = self->_master;
  if (!master)
  {
    uint64_t v46 = 0;
    unint64_t v47 = 0;
    goto LABEL_77;
  }
  [(AVHapticServer *)master entryWithID:self->_clientID];
  if (!v46) {
    goto LABEL_77;
  }
  objc_initWeak(&location, self);
  objc_initWeak(&from, self->_master);
  if (kHSRVScope)
  {
    if (*(unsigned char *)(kHSRVScope + 8))
    {
      uint64_t v8 = *(id *)kHSRVScope;
      if (v8)
      {
        int v9 = v8;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
          __int16 v49 = 1024;
          *(_DWORD *)id v50 = 690;
          *(_WORD *)&v50[4] = 2080;
          *(void *)&v50[6] = "-[AVHapticServerInstance handleConnectionError]";
          _os_log_impl(&dword_1A3931000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Dispatching doStopPrewarm and doStopRunning on ACQ", buf, 0x1Cu);
        }
      }
    }
  }
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3321888768;
  v40[2] = __47__AVHapticServerInstance_handleConnectionError__block_invoke;
  v40[3] = &unk_1EF728B88;
  object v36 = &v41;
  objc_copyWeak(&v41, &from);
  objc_copyWeak(v42, &location);
  v42[1] = v46;
  __int16 v43 = v47;
  if (v47) {
    atomic_fetch_add_explicit(&v47->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v40[4] = self;
  if (AudioControlQueue(void)::once != -1) {
    dispatch_once(&AudioControlQueue(void)::once, &__block_literal_global_8);
  }
  id v10 = (id)AudioControlQueue(void)::gAudioControlQueue;
  AT::DispatchBlock(v10, v40, 0, (uint64_t)"-[AVHapticServerInstance handleConnectionError]", (uint64_t)"AVHapticServer.mm", 701);

  if (_os_feature_enabled_impl()
    && [(AVHapticServerInstance *)self runIncludesAudio])
  {
    (*(void (**)(HapticSession *, void))(*(void *)self->_hapticSession.__ptr_ + 56))(self->_hapticSession.__ptr_, 0);
  }
  if (kHSRVScope)
  {
    uint64_t v11 = *(id *)kHSRVScope;
    if (!v11) {
      goto LABEL_31;
    }
  }
  else
  {
    uint64_t v11 = MEMORY[0x1E4F14500];
    id v12 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
    __int16 v49 = 1024;
    *(_DWORD *)id v50 = 705;
    *(_WORD *)&v50[4] = 2080;
    *(void *)&v50[6] = "-[AVHapticServerInstance handleConnectionError]";
    *(_WORD *)&v50[14] = 2048;
    *(void *)&v50[16] = v46;
    _os_log_impl(&dword_1A3931000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Releasing resources (if necessary), unregistering and destroying client entry %p", buf, 0x26u);
  }

LABEL_31:
  uint64_t v13 = self->_master;
  int v38 = v46;
  __int16 v39 = v47;
  if (v47) {
    atomic_fetch_add_explicit(&v47->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  -[AVHapticServer doReleaseClientResources:](v13, "doReleaseClientResources:", &v38, v36);
  if (v39) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v39);
  }
  id v14 = [(AVHapticServer *)self->_master manager];
  id v16 = v46;
  id v15 = v47;
  if (v47) {
    atomic_fetch_add_explicit(&v47->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (kHSRVScope)
  {
    if (*(unsigned char *)(kHSRVScope + 8))
    {
      uint64_t v17 = *(id *)kHSRVScope;
      if (v17)
      {
        id v18 = v17;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v19 = *((void *)v16 + 3);
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = "ServerManager.mm";
          __int16 v49 = 1024;
          *(_DWORD *)id v50 = 1167;
          *(_WORD *)&v50[4] = 2080;
          *(void *)&v50[6] = "removeEntry";
          *(_WORD *)&v50[14] = 2048;
          *(void *)&v50[16] = v19;
          _os_log_impl(&dword_1A3931000, v18, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Client ID: 0x%lx", buf, 0x26u);
        }
      }
    }
  }
  uint64_t v20 = v14[25];
  *(void *)buf = v14 + 3;
  buf[8] = 1;
  std::__shared_mutex_base::lock((std::__shared_mutex_base *)(v14 + 3));
  *((unsigned char *)v14 + 192) = 1;
  *(void *)&v50[2] = v14;
  *(void *)&v50[10] = v14 + 24;
  *(void *)&v50[18] = v20;
  unint64_t v21 = v14[1];
  if (v21)
  {
    unint64_t v22 = *((void *)v16 + 3);
    id v23 = (uint64_t *)(v14 + 1);
    uint64_t v24 = v14[1];
    do
    {
      unint64_t v25 = v24[4];
      BOOL v26 = v25 >= v22;
      if (v25 >= v22) {
        unint64_t v27 = (uint64_t **)v24;
      }
      else {
        unint64_t v27 = (uint64_t **)(v24 + 1);
      }
      if (v26) {
        id v23 = v24;
      }
      uint64_t v24 = *v27;
    }
    while (*v27);
    if (v23 != (uint64_t *)(v14 + 1) && v22 >= v23[4])
    {
      double v31 = (uint64_t *)v23[1];
      if (v31)
      {
        do
        {
          id v32 = v31;
          double v31 = (uint64_t *)*v31;
        }
        while (v31);
      }
      else
      {
        uint64_t v33 = v23;
        do
        {
          id v32 = (uint64_t *)v33[2];
          BOOL v34 = *v32 == (void)v33;
          uint64_t v33 = v32;
        }
        while (!v34);
      }
      if (*v14 == v23) {
        *id v14 = v32;
      }
      v14[2] = (uint64_t *)((char *)v14[2] - 1);
      std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v21, v23);
      uint64_t v35 = (std::__shared_weak_count *)v23[6];
      if (v35) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v35);
      }
      operator delete(v23);
      **(unsigned char **)&v50[10] = 0;
      std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)buf);
      ClientEntry::uninitialize(v16);
      goto LABEL_72;
    }
  }
  *((unsigned char *)v14 + 192) = 0;
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)buf);
  if (!kHSRVScope)
  {
    uint64_t v28 = MEMORY[0x1E4F14500];
    id v29 = MEMORY[0x1E4F14500];
    goto LABEL_58;
  }
  uint64_t v28 = *(id *)kHSRVScope;
  if (v28)
  {
LABEL_58:
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = *((void *)v16 + 3);
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = "ServerManager.mm";
      __int16 v49 = 1024;
      *(_DWORD *)id v50 = 1169;
      *(_WORD *)&v50[4] = 2080;
      *(void *)&v50[6] = "removeEntry";
      *(_WORD *)&v50[14] = 2048;
      *(void *)&v50[16] = v16;
      *(_WORD *)&v50[24] = 2048;
      uint64_t v51 = v30;
      _os_log_impl(&dword_1A3931000, v28, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Invalid client entry: %p (connectionID 0x%lx)", buf, 0x30u);
    }
  }
LABEL_72:
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  if (v43) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v43);
  }
  objc_destroyWeak(v42);
  objc_destroyWeak(v37);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
LABEL_77:
  [(AVHapticServer *)self->_master removeProcessEntry:self->_clientID];
  if (v47) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v47);
  }
  objc_sync_exit(v6);
}

void __47__AVHapticServerInstance_handleConnectionError__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (!WeakRetained)
  {
    if (kHSRVScope)
    {
      id v4 = *(id *)kHSRVScope;
      if (!v4) {
        goto LABEL_9;
      }
    }
    else
    {
      id v4 = MEMORY[0x1E4F14500];
      id v5 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      unint64_t v21 = "AVHapticServer.mm";
      __int16 v22 = 1024;
      int v23 = 692;
      __int16 v24 = 2080;
      unint64_t v25 = "-[AVHapticServerInstance handleConnectionError]_block_invoke";
      _os_log_impl(&dword_1A3931000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: WARNING: Server master is already nil - no call to stop prewarm or running possible", buf, 0x1Cu);
    }
  }
LABEL_9:
  id v6 = objc_loadWeakRetained((id *)(a1 + 48));
  [v6 setWasPrewarmedAndSuspended:0];

  id v7 = objc_loadWeakRetained(v2);
  uint64_t v8 = *(std::__shared_weak_count **)(a1 + 64);
  uint64_t v18 = *(void *)(a1 + 56);
  uint64_t v19 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  objc_msgSend(v7, "doStopPrewarm:audio:haptics:", &v18, objc_msgSend(*(id *)(a1 + 32), "prewarmIncludesAudio"), objc_msgSend(*(id *)(a1 + 32), "prewarmIncludesHaptics"));
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }

  id v9 = objc_loadWeakRetained((id *)(a1 + 48));
  [v9 setWasRunningAndSuspended:0];

  id v10 = objc_loadWeakRetained(v2);
  uint64_t v11 = *(std::__shared_weak_count **)(a1 + 64);
  uint64_t v16 = *(void *)(a1 + 56);
  uint64_t v17 = v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  objc_msgSend(v10, "doStopRunning:audio:haptics:", &v16, objc_msgSend(*(id *)(a1 + 32), "runIncludesAudio", v16), objc_msgSend(*(id *)(a1 + 32), "runIncludesHaptics"));
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }

  id v12 = objc_loadWeakRetained((id *)(a1 + 48));
  [v12 setClientSuspended:0];

  id v13 = objc_loadWeakRetained((id *)(a1 + 48));
  [v13 setWasPrewarmedAndSuspended:0];

  id v14 = objc_loadWeakRetained((id *)(a1 + 48));
  [v14 setClientInterrupted:0];

  id v15 = objc_loadWeakRetained((id *)(a1 + 48));
  [v15 setRunningInBackground:0];
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (kHSRVScope)
  {
    if (*(unsigned char *)(kHSRVScope + 8))
    {
      id v3 = *(id *)kHSRVScope;
      if (v3)
      {
        id v4 = v3;
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v8 = "AVHapticServer.mm";
          __int16 v9 = 1024;
          int v10 = 676;
          __int16 v11 = 2080;
          id v12 = "-[AVHapticServerInstance dealloc]";
          _os_log_impl(&dword_1A3931000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Entered", buf, 0x1Cu);
        }
      }
    }
  }
  [(AVHapticServerInstance *)self removeSessionListeners];
  connection = self->_connection;
  self->_connection = 0;

  v6.receiver = self;
  v6.super_class = (Class)AVHapticServerInstance;
  [(AVHapticServerInstance *)&v6 dealloc];
}

- (void)removeSessionListeners
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (self->_listenerWrapper)
  {
    if (kHSRVScope)
    {
      id v3 = *(id *)kHSRVScope;
      if (!v3)
      {
LABEL_9:
        MEMORY[0x1A62505E0]();
        uint64_t v6 = FigNotificationCenterRemoveWeakListener();
        MEMORY[0x1A62505E0](v6);
        FigNotificationCenterRemoveWeakListener();
        id v7 = [(AVHapticServerInstance *)self master];
        uint64_t v8 = self->_listenerWrapper;
        int v9 = (*(uint64_t (**)(HapticSession *))(*(void *)self->_hapticSession.__ptr_ + 16))(self->_hapticSession.__ptr_);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __48__AVHapticServerInstance_removeSessionListeners__block_invoke;
        block[3] = &unk_1E5B147A8;
        id v14 = v7;
        id v15 = v8;
        int v16 = v9;
        int v10 = v8;
        id v11 = v7;
        dispatch_async(MEMORY[0x1E4F14428], block);
        listenerWrapper = self->_listenerWrapper;
        self->_listenerWrapper = 0;

        return;
      }
    }
    else
    {
      id v3 = MEMORY[0x1E4F14500];
      id v4 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      unint64_t clientID = self->_clientID;
      *(_DWORD *)buf = 136315906;
      uint64_t v18 = "AVHapticServer.mm";
      __int16 v19 = 1024;
      int v20 = 660;
      __int16 v21 = 2080;
      __int16 v22 = "-[AVHapticServerInstance removeSessionListeners]";
      __int16 v23 = 2048;
      unint64_t v24 = clientID;
      _os_log_impl(&dword_1A3931000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Removing session listeners on client 0x%lx", buf, 0x26u);
    }

    goto LABEL_9;
  }
}

uint64_t __48__AVHapticServerInstance_removeSessionListeners__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeListener:*(void *)(a1 + 40) withAudioSessionID:*(unsigned int *)(a1 + 48)];
}

- (AVHapticServerInstance)initWithMaster:(id)a3 id:(unint64_t)a4 connection:(id)a5 outError:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AVHapticServerInstance;
  id v12 = [(AVHapticServerInstance *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_master, a3);
    objc_storeStrong((id *)&v13->_connection, a5);
    v13->_unint64_t clientID = a4;
    *(_DWORD *)&v13->_clientSuspended = 0;
    v13->_runningInBackground = 0;
  }

  return v13;
}

- (void)handleInterruptionForSession:(const void *)a3 command:(unsigned int)a4 dictionary:(id)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (!AQMESession::isSameAudioSession(&self->_aqmeSession, (const AQMESession *)a3)) {
    goto LABEL_85;
  }
  if (!kHSRVScope)
  {
    int v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
    goto LABEL_6;
  }
  int v9 = *(id *)kHSRVScope;
  if (v9)
  {
LABEL_6:
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t clientID = self->_clientID;
      *(_DWORD *)buf = 136316162;
      unint64_t v47 = "AVHapticServer.mm";
      __int16 v48 = 1024;
      int v49 = 524;
      __int16 v50 = 2080;
      uint64_t v51 = "-[AVHapticServerInstance handleInterruptionForSession:command:dictionary:]";
      __int16 v52 = 2048;
      unint64_t v53 = clientID;
      __int16 v54 = 1024;
      unsigned int v55 = a4;
      _os_log_impl(&dword_1A3931000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Handling session interruption notification for client 0x%lx, interruption cmd: %u", buf, 0x2Cu);
    }
  }
  master = self->_master;
  if (master)
  {
    [(AVHapticServer *)master entryWithID:self->_clientID];
    if (v44)
    {
      id v42 = v8;
      __int16 v43 = 0;
      float v40 = 0.5;
      float v41 = 0.0;
      switch(a4)
      {
        case 0u:
          if (kHSRVScope)
          {
            if (*(unsigned char *)(kHSRVScope + 8))
            {
              objc_super v15 = *(id *)kHSRVScope;
              if (v15)
              {
                int v16 = v15;
                if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315650;
                  unint64_t v47 = "AVHapticServer.mm";
                  __int16 v48 = 1024;
                  int v49 = 537;
                  __int16 v50 = 2080;
                  uint64_t v51 = "-[AVHapticServerInstance handleInterruptionForSession:command:dictionary:]";
                  _os_log_impl(&dword_1A3931000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Handling StopNow", buf, 0x1Cu);
                }
              }
            }
          }
          goto LABEL_50;
        case 1u:
          if (!kHSRVScope) {
            goto LABEL_82;
          }
          if ((*(unsigned char *)(kHSRVScope + 8) & 1) == 0) {
            goto LABEL_82;
          }
          __int16 v22 = *(id *)kHSRVScope;
          if (!v22) {
            goto LABEL_82;
          }
          uint64_t v18 = v22;
          if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_65;
          }
          *(_DWORD *)buf = 136315650;
          unint64_t v47 = "AVHapticServer.mm";
          __int16 v48 = 1024;
          int v49 = 544;
          __int16 v50 = 2080;
          uint64_t v51 = "-[AVHapticServerInstance handleInterruptionForSession:command:dictionary:]";
          __int16 v19 = "%25s:%-5d %s: Ignoring InterruptionEnded";
          int v20 = v18;
          uint32_t v21 = 28;
          goto LABEL_64;
        case 2u:
          if (kHSRVScope)
          {
            if (*(unsigned char *)(kHSRVScope + 8))
            {
              __int16 v23 = *(id *)kHSRVScope;
              if (v23)
              {
                unint64_t v24 = v23;
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315650;
                  unint64_t v47 = "AVHapticServer.mm";
                  __int16 v48 = 1024;
                  int v49 = 560;
                  __int16 v50 = 2080;
                  uint64_t v51 = "-[AVHapticServerInstance handleInterruptionForSession:command:dictionary:]";
                  _os_log_impl(&dword_1A3931000, v24, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Handling BeginQuietTime", buf, 0x1Cu);
                }
              }
            }
          }
          float v41 = 0.0;
          CACFDictionary::GetFloat32((CACFDictionary *)&v42, (const __CFString *)*MEMORY[0x1E4F75C50], &v41);
          uint64_t v25 = 0;
          uint64_t v26 = 0;
          uint64_t v27 = 1;
          *(float *)&double v14 = v41;
          goto LABEL_59;
        case 3u:
          if (kHSRVScope)
          {
            if (*(unsigned char *)(kHSRVScope + 8))
            {
              uint64_t v28 = *(id *)kHSRVScope;
              if (v28)
              {
                id v29 = v28;
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315650;
                  unint64_t v47 = "AVHapticServer.mm";
                  __int16 v48 = 1024;
                  int v49 = 567;
                  __int16 v50 = 2080;
                  uint64_t v51 = "-[AVHapticServerInstance handleInterruptionForSession:command:dictionary:]";
                  _os_log_impl(&dword_1A3931000, v29, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Handling EndQuietTime", buf, 0x1Cu);
                }
              }
            }
          }
          uint64_t v25 = 0;
          uint64_t v26 = 0;
          uint64_t v27 = 0;
          float v41 = 1.0;
          goto LABEL_58;
        case 4u:
          if (kHSRVScope)
          {
            if (*(unsigned char *)(kHSRVScope + 8))
            {
              uint64_t v30 = *(id *)kHSRVScope;
              if (v30)
              {
                double v31 = v30;
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315650;
                  unint64_t v47 = "AVHapticServer.mm";
                  __int16 v48 = 1024;
                  int v49 = 547;
                  __int16 v50 = 2080;
                  uint64_t v51 = "-[AVHapticServerInstance handleInterruptionForSession:command:dictionary:]";
                  _os_log_impl(&dword_1A3931000, v31, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Handling Pause", buf, 0x1Cu);
                }
              }
            }
          }
LABEL_50:
          CACFDictionary::GetFloat32((CACFDictionary *)&v42, (const __CFString *)*MEMORY[0x1E4F75C70], &v40);
          float v41 = 0.0;
          uint64_t v25 = 1;
          double v14 = 0.0;
          uint64_t v26 = 1;
          uint64_t v27 = 1;
          goto LABEL_59;
        case 5u:
          if (kHSRVScope)
          {
            if (*(unsigned char *)(kHSRVScope + 8))
            {
              id v32 = *(id *)kHSRVScope;
              if (v32)
              {
                uint64_t v33 = v32;
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315650;
                  unint64_t v47 = "AVHapticServer.mm";
                  __int16 v48 = 1024;
                  int v49 = 554;
                  __int16 v50 = 2080;
                  uint64_t v51 = "-[AVHapticServerInstance handleInterruptionForSession:command:dictionary:]";
                  _os_log_impl(&dword_1A3931000, v33, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Handling Resume", buf, 0x1Cu);
                }
              }
            }
          }
          CACFDictionary::GetFloat32((CACFDictionary *)&v42, (const __CFString *)*MEMORY[0x1E4F75C70], &v40);
          uint64_t v26 = 0;
          uint64_t v27 = 0;
          float v41 = 1.0;
          uint64_t v25 = 1;
LABEL_58:
          LODWORD(v14) = 1.0;
LABEL_59:
          *(float *)&double v13 = v40;
          [(AVHapticServerInstance *)self fadeClientForSessionInterruption:v27 affectHaptics:v25 fadeTime:v26 fadeLevel:v13 stopAfterFade:v14];
          if (!kHSRVScope) {
            goto LABEL_82;
          }
          if ((*(unsigned char *)(kHSRVScope + 8) & 1) == 0) {
            goto LABEL_82;
          }
          BOOL v34 = *(id *)kHSRVScope;
          if (!v34) {
            goto LABEL_82;
          }
          uint64_t v18 = v34;
          if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_65;
          }
          unint64_t v35 = self->_clientID;
          *(_DWORD *)buf = 136315906;
          unint64_t v47 = "AVHapticServer.mm";
          __int16 v48 = 1024;
          int v49 = 585;
          __int16 v50 = 2080;
          uint64_t v51 = "-[AVHapticServerInstance handleInterruptionForSession:command:dictionary:]";
          __int16 v52 = 2048;
          unint64_t v53 = v35;
          __int16 v19 = "%25s:%-5d %s: Done handling interruption notification for client 0x%lx";
          int v20 = v18;
          uint32_t v21 = 38;
          goto LABEL_64;
        case 6u:
          if (!kHSRVScope
            || (*(unsigned char *)(kHSRVScope + 8) & 1) == 0
            || (object v36 = *(id *)kHSRVScope) == 0)
          {
            uint64_t v38 = 1;
            goto LABEL_81;
          }
          __int16 v37 = v36;
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            unint64_t v47 = "AVHapticServer.mm";
            __int16 v48 = 1024;
            int v49 = 573;
            __int16 v50 = 2080;
            uint64_t v51 = "-[AVHapticServerInstance handleInterruptionForSession:command:dictionary:]";
            _os_log_impl(&dword_1A3931000, v37, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Handling Silent Mute", buf, 0x1Cu);
          }
          uint64_t v38 = 1;
          goto LABEL_78;
        case 7u:
          if (kHSRVScope
            && (*(unsigned char *)(kHSRVScope + 8) & 1) != 0
            && (__int16 v39 = *(id *)kHSRVScope) != 0)
          {
            __int16 v37 = v39;
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315650;
              unint64_t v47 = "AVHapticServer.mm";
              __int16 v48 = 1024;
              int v49 = 577;
              __int16 v50 = 2080;
              uint64_t v51 = "-[AVHapticServerInstance handleInterruptionForSession:command:dictionary:]";
              _os_log_impl(&dword_1A3931000, v37, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Handling Silent UnMute", buf, 0x1Cu);
            }
            uint64_t v38 = 0;
LABEL_78:
          }
          else
          {
            uint64_t v38 = 0;
          }
LABEL_81:
          [(AVHapticServerInstance *)self muteClientForRingerSwitch:v38];
LABEL_82:
          CACFDictionary::~CACFDictionary((CACFDictionary *)&v42);
          break;
        default:
          if (!kHSRVScope) {
            goto LABEL_82;
          }
          if ((*(unsigned char *)(kHSRVScope + 8) & 1) == 0) {
            goto LABEL_82;
          }
          uint64_t v17 = *(id *)kHSRVScope;
          if (!v17) {
            goto LABEL_82;
          }
          uint64_t v18 = v17;
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_65;
          }
          *(_DWORD *)buf = 136315906;
          unint64_t v47 = "AVHapticServer.mm";
          __int16 v48 = 1024;
          int v49 = 581;
          __int16 v50 = 2080;
          uint64_t v51 = "-[AVHapticServerInstance handleInterruptionForSession:command:dictionary:]";
          __int16 v52 = 1024;
          LODWORD(v53) = a4;
          __int16 v19 = "%25s:%-5d %s: Ignoring cmd: 0x%x";
          int v20 = v18;
          uint32_t v21 = 34;
LABEL_64:
          _os_log_impl(&dword_1A3931000, v20, OS_LOG_TYPE_DEBUG, v19, buf, v21);
LABEL_65:

          goto LABEL_82;
      }
    }
  }
  else
  {
    uint64_t v44 = 0;
    uint64_t v45 = 0;
  }
  if (v45) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v45);
  }
LABEL_85:
}

- (void)unmuteClientAfterSessionInterruption:(float)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (self->_clientInterrupted)
  {
    self->_clientInterrupted = 0;
    master = self->_master;
    if (master)
    {
      [(AVHapticServer *)master entryWithID:self->_clientID];
      if (v18)
      {
        if (kHSRVScope)
        {
          uint64_t v6 = *(id *)kHSRVScope;
          if (!v6)
          {
LABEL_17:
            double v13 = [(AVHapticServer *)self->_master manager];
            double v14 = v19;
            v17[0] = v18;
            v17[1] = (uint64_t)v19;
            if (v19) {
              atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
            }
            ServerManager::handleSessionInterruptionForEntry((uint64_t)v13, v17, 0, 1, a3, 1.0);
            if (v14) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v14);
            }
            if (!kHSRVScope) {
              goto LABEL_28;
            }
            if ((*(unsigned char *)(kHSRVScope + 8) & 1) == 0) {
              goto LABEL_28;
            }
            objc_super v15 = *(id *)kHSRVScope;
            if (!v15) {
              goto LABEL_28;
            }
            id v8 = v15;
            if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_27;
            }
            unint64_t clientID = self->_clientID;
            *(_DWORD *)buf = 136315906;
            uint32_t v21 = "AVHapticServer.mm";
            __int16 v22 = 1024;
            int v23 = 510;
            __int16 v24 = 2080;
            uint64_t v25 = "-[AVHapticServerInstance unmuteClientAfterSessionInterruption:]";
            __int16 v26 = 2048;
            unint64_t v27 = clientID;
            id v10 = "%25s:%-5d %s: Done unmuting client 0x%lx";
            goto LABEL_26;
          }
        }
        else
        {
          uint64_t v6 = MEMORY[0x1E4F14500];
          id v11 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v12 = self->_clientID;
          *(_DWORD *)buf = 136315906;
          uint32_t v21 = "AVHapticServer.mm";
          __int16 v22 = 1024;
          int v23 = 508;
          __int16 v24 = 2080;
          uint64_t v25 = "-[AVHapticServerInstance unmuteClientAfterSessionInterruption:]";
          __int16 v26 = 2048;
          unint64_t v27 = v12;
          _os_log_impl(&dword_1A3931000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Interrupted client 0x%lx being unmuted on restart", buf, 0x26u);
        }

        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v18 = 0;
      __int16 v19 = 0;
    }
    if (!kHSRVScope) {
      goto LABEL_28;
    }
    if ((*(unsigned char *)(kHSRVScope + 8) & 1) == 0) {
      goto LABEL_28;
    }
    id v7 = *(id *)kHSRVScope;
    if (!v7) {
      goto LABEL_28;
    }
    id v8 = v7;
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
LABEL_27:

LABEL_28:
      if (v19) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v19);
      }
      return;
    }
    unint64_t v9 = self->_clientID;
    *(_DWORD *)buf = 136315906;
    uint32_t v21 = "AVHapticServer.mm";
    __int16 v22 = 1024;
    int v23 = 513;
    __int16 v24 = 2080;
    uint64_t v25 = "-[AVHapticServerInstance unmuteClientAfterSessionInterruption:]";
    __int16 v26 = 2048;
    unint64_t v27 = v9;
    id v10 = "%25s:%-5d %s: Client 0x%lx did not stop on interruption (or was not found)";
LABEL_26:
    _os_log_impl(&dword_1A3931000, v8, OS_LOG_TYPE_DEBUG, v10, buf, 0x26u);
    goto LABEL_27;
  }
}

- (void)fadeClientForSessionInterruption:(BOOL)a3 affectHaptics:(BOOL)a4 fadeTime:(float)a5 fadeLevel:(float)a6 stopAfterFade:(BOOL)a7
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if (self->_clientInterrupted != a3)
  {
    BOOL v7 = a7;
    BOOL v10 = a4;
    BOOL v11 = a3;
    self->_clientInterrupted = a3;
    master = self->_master;
    if (master)
    {
      [(AVHapticServer *)master entryWithID:self->_clientID];
      if (!v11) {
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v42 = 0;
      __int16 v43 = 0;
      if (!a3) {
        goto LABEL_10;
      }
    }
    if ((*(unsigned int (**)(HapticSession *))(*(void *)self->_hapticSession.__ptr_ + 48))(self->_hapticSession.__ptr_))
    {
      if (kHSRVScope)
      {
        id v14 = *(id *)kHSRVScope;
        if (!v14) {
          goto LABEL_45;
        }
      }
      else
      {
        id v14 = (id)MEMORY[0x1E4F14500];
        id v29 = MEMORY[0x1E4F14500];
      }
      uint64_t v17 = v14;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t clientID = self->_clientID;
        int v31 = (*(uint64_t (**)(HapticSession *))(*(void *)self->_hapticSession.__ptr_ + 16))(self->_hapticSession.__ptr_);
        *(_DWORD *)buf = 136316162;
        uint64_t v45 = "AVHapticServer.mm";
        __int16 v46 = 1024;
        int v47 = 477;
        __int16 v48 = 2080;
        int v49 = "-[AVHapticServerInstance fadeClientForSessionInterruption:affectHaptics:fadeTime:fadeLevel:stopAfterFade:]";
        __int16 v50 = 2048;
        unint64_t v51 = clientID;
        __int16 v52 = 1024;
        LODWORD(v53) = v31;
        _os_log_impl(&dword_1A3931000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client 0x%lx's private audio session %d has been deactivated by caller process or application backgrounded. Not proceeding with fading and stopping for Session Interruption", buf, 0x2Cu);
      }

      goto LABEL_44;
    }
LABEL_10:
    if (!v42)
    {
      if (!kHSRVScope) {
        goto LABEL_45;
      }
      if ((*(unsigned char *)(kHSRVScope + 8) & 1) == 0) {
        goto LABEL_45;
      }
      int v16 = *(id *)kHSRVScope;
      if (!v16) {
        goto LABEL_45;
      }
      uint64_t v17 = v16;
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_44;
      }
      unint64_t v18 = self->_clientID;
      *(_DWORD *)buf = 136315906;
      uint64_t v45 = "AVHapticServer.mm";
      __int16 v46 = 1024;
      int v47 = 497;
      __int16 v48 = 2080;
      int v49 = "-[AVHapticServerInstance fadeClientForSessionInterruption:affectHaptics:fadeTime:fadeLevel:stopAfterFade:]";
      __int16 v50 = 2048;
      unint64_t v51 = v18;
      __int16 v19 = "%25s:%-5d %s: Client 0x%lx does not respond to interruptions (or was not found)";
      goto LABEL_19;
    }
    if (kHSRVScope)
    {
      objc_super v15 = *(id *)kHSRVScope;
      if (!v15)
      {
LABEL_26:
        uint64_t v25 = [(AVHapticServer *)self->_master manager];
        __int16 v26 = v43;
        v41[0] = v42;
        v41[1] = (uint64_t)v43;
        if (v43) {
          atomic_fetch_add_explicit(&v43->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        ServerManager::handleSessionInterruptionForEntry((uint64_t)v25, v41, v11, v10, a5, a6);
        if (v26) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v26);
        }
        if (!v7) {
          goto LABEL_45;
        }
        int v27 = atomic_load((unsigned int *)(v42 + 120));
        if (v27 < 2 || (unsigned int v28 = atomic_load((unsigned int *)(v42 + 120)), v28 == 2))
        {
          if (kHSRVScope)
          {
            uint64_t v17 = *(id *)kHSRVScope;
            if (!v17)
            {
LABEL_45:
              if (v43) {
                std::__shared_weak_count::__release_shared[abi:ne180100](v43);
              }
              return;
            }
          }
          else
          {
            uint64_t v17 = MEMORY[0x1E4F14500];
            id v32 = MEMORY[0x1E4F14500];
          }
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v33 = self->_clientID;
            *(_DWORD *)buf = 136315906;
            uint64_t v45 = "AVHapticServer.mm";
            __int16 v46 = 1024;
            int v47 = 492;
            __int16 v48 = 2080;
            int v49 = "-[AVHapticServerInstance fadeClientForSessionInterruption:affectHaptics:fadeTime:fadeLevel:stopAfterFade:]";
            __int16 v50 = 2048;
            unint64_t v51 = v33;
            __int16 v19 = "%25s:%-5d %s: Client 0x%lx is stopping or is not running - noop";
            int v20 = v17;
            os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
            goto LABEL_43;
          }
LABEL_44:

          goto LABEL_45;
        }
        if (!v11)
        {
          if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            uint64_t v45 = "AVHapticServer.mm";
            __int16 v46 = 1024;
            int v47 = 485;
            _os_log_impl(&dword_1A3931000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d ASSERTION FAILURE [(startingInterrupt) != 0 is false]: ", buf, 0x12u);
          }
          __break(1u);
        }
        if (kHSRVScope)
        {
          if (*(unsigned char *)(kHSRVScope + 8))
          {
            BOOL v34 = *(id *)kHSRVScope;
            if (v34)
            {
              unint64_t v35 = v34;
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315650;
                uint64_t v45 = "AVHapticServer.mm";
                __int16 v46 = 1024;
                int v47 = 486;
                __int16 v48 = 2080;
                int v49 = "-[AVHapticServerInstance fadeClientForSessionInterruption:affectHaptics:fadeTime:fadeLevel:stopAfterFade:]";
                _os_log_impl(&dword_1A3931000, v35, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Calling doStopRunningForInterrupt (async on ACQ) due to client interruption", buf, 0x1Cu);
              }
            }
          }
        }
        object v36 = self->_master;
        uint64_t v39 = v42;
        float v40 = v43;
        if (v43) {
          atomic_fetch_add_explicit(&v43->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        [(AVHapticServer *)v36 doStopRunningForInterrupt:&v39 audio:[(AVHapticServerInstance *)self runIncludesAudio] haptics:[(AVHapticServerInstance *)self runIncludesHaptics]];
        if (v40) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v40);
        }
        [(AVHapticServerInstance *)self notifyClientOnStopWithReason:1 error:0];
        if (!kHSRVScope) {
          goto LABEL_45;
        }
        if ((*(unsigned char *)(kHSRVScope + 8) & 1) == 0) {
          goto LABEL_45;
        }
        __int16 v37 = *(id *)kHSRVScope;
        if (!v37) {
          goto LABEL_45;
        }
        uint64_t v17 = v37;
        if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_44;
        }
        unint64_t v38 = self->_clientID;
        *(_DWORD *)buf = 136315906;
        uint64_t v45 = "AVHapticServer.mm";
        __int16 v46 = 1024;
        int v47 = 489;
        __int16 v48 = 2080;
        int v49 = "-[AVHapticServerInstance fadeClientForSessionInterruption:affectHaptics:fadeTime:fadeLevel:stopAfterFade:]";
        __int16 v50 = 2048;
        unint64_t v51 = v38;
        __int16 v19 = "%25s:%-5d %s: Done stopping interrupted client 0x%lx";
LABEL_19:
        int v20 = v17;
        os_log_type_t v21 = OS_LOG_TYPE_DEBUG;
LABEL_43:
        _os_log_impl(&dword_1A3931000, v20, v21, v19, buf, 0x26u);
        goto LABEL_44;
      }
    }
    else
    {
      objc_super v15 = MEMORY[0x1E4F14500];
      id v22 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v23 = self->_clientID;
      __int16 v24 = "ending interruption";
      *(_DWORD *)buf = 136316930;
      uint64_t v45 = "AVHapticServer.mm";
      __int16 v46 = 1024;
      if (v11) {
        __int16 v24 = "being interrupted";
      }
      int v47 = 481;
      __int16 v48 = 2080;
      int v49 = "-[AVHapticServerInstance fadeClientForSessionInterruption:affectHaptics:fadeTime:fadeLevel:stopAfterFade:]";
      __int16 v50 = 2048;
      unint64_t v51 = v23;
      __int16 v52 = 2080;
      unint64_t v53 = v24;
      __int16 v54 = 2048;
      double v55 = a5;
      __int16 v56 = 2048;
      double v57 = a6;
      __int16 v58 = 1024;
      BOOL v59 = v10;
      _os_log_impl(&dword_1A3931000, v15, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client 0x%lx %s with fade time %.3f level %.3f. affectHaptics: %u", buf, 0x4Au);
    }

    goto LABEL_26;
  }
}

- (void)muteClientForRingerSwitch:(BOOL)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  master = self->_master;
  if (master)
  {
    BOOL v5 = a3;
    [(AVHapticServer *)master entryWithID:self->_clientID];
    if (v11)
    {
      uint64_t v6 = [(AVHapticServer *)self->_master manager];
      if (v12) {
        atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      if (kHSRVScope)
      {
        if (*(unsigned char *)(kHSRVScope + 8))
        {
          BOOL v7 = *(id *)kHSRVScope;
          if (v7)
          {
            id v8 = v7;
            if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v9 = *(void *)(v11 + 24);
              *(_DWORD *)buf = 136316162;
              *(void *)&uint8_t buf[4] = "ServerManager.mm";
              __int16 v14 = 1024;
              int v15 = 1137;
              __int16 v16 = 2080;
              uint64_t v17 = "handleRingerSwitchForEntry";
              __int16 v18 = 2048;
              uint64_t v19 = v9;
              __int16 v20 = 1024;
              BOOL v21 = v5;
              _os_log_impl(&dword_1A3931000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Client ID: 0x%lx, ringer switch: %d", buf, 0x2Cu);
            }
          }
        }
      }
      uint64_t v10 = v6[30];
      *(void *)buf = v6 + 30;
      buf[8] = (*(uint64_t (**)(void *))(v10 + 16))(v6 + 30);
      ClientEntry::muteAudio(v11, v5, 1, 0.0);
      CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)buf);
      if (v12) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v12);
      }
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
}

- (BOOL)handleClientApplicationStateChange:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (kHSRVScope)
  {
    BOOL v5 = *(id *)kHSRVScope;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t clientID = self->_clientID;
    int v15 = 136315906;
    __int16 v16 = "AVHapticServer.mm";
    __int16 v17 = 1024;
    int v18 = 454;
    __int16 v19 = 2080;
    __int16 v20 = "-[AVHapticServerInstance handleClientApplicationStateChange:]";
    __int16 v21 = 2048;
    unint64_t v22 = clientID;
    _os_log_impl(&dword_1A3931000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Handling app (client) state change for client 0x%lx", (uint8_t *)&v15, 0x26u);
  }

LABEL_8:
  id v8 = (id)*MEMORY[0x1E4F75C98];
  uint64_t v9 = [v4 objectForKey:v8];
  BOOL v10 = -[AVHapticServerInstance handleClientApplicationStateChangeUsingAppState:](self, "handleClientApplicationStateChangeUsingAppState:", [v9 unsignedIntegerValue]);
  if (kHSRVScope)
  {
    if (*(unsigned char *)(kHSRVScope + 8))
    {
      uint64_t v11 = *(id *)kHSRVScope;
      if (v11)
      {
        unint64_t v12 = v11;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          unint64_t v13 = self->_clientID;
          int v15 = 136315906;
          __int16 v16 = "AVHapticServer.mm";
          __int16 v17 = 1024;
          int v18 = 459;
          __int16 v19 = 2080;
          __int16 v20 = "-[AVHapticServerInstance handleClientApplicationStateChange:]";
          __int16 v21 = 2048;
          unint64_t v22 = v13;
          _os_log_impl(&dword_1A3931000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Done handling state change for client 0x%lx", (uint8_t *)&v15, 0x26u);
        }
      }
    }
  }

  return v10;
}

- (BOOL)handleClientApplicationStateChangeUsingAppState:(unint64_t)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  if (a3 == 8)
  {
    if (![(AVHapticServerInstance *)self runningInBackground]) {
      goto LABEL_106;
    }
    [(AVHapticServerInstance *)self setRunningInBackground:0];
    master = self->_master;
    if (master)
    {
      [(AVHapticServer *)master entryWithID:self->_clientID];
      if (v70)
      {
        if (kHSRVScope)
        {
          BOOL v7 = *(id *)kHSRVScope;
          if (!v7)
          {
LABEL_100:
            float v41 = [(AVHapticServer *)self->_master manager];
            uint64_t v42 = v71;
            v63[0] = v70;
            v63[1] = v71;
            if (v71) {
              atomic_fetch_add_explicit(&v71->__shared_owners_, 1uLL, memory_order_relaxed);
            }
            ServerManager::handleAppBackgroundingForEntry((uint64_t)v41, v63, 0);
            if (v42) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v42);
            }
            goto LABEL_104;
          }
        }
        else
        {
          BOOL v7 = MEMORY[0x1E4F14500];
          id v39 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t clientID = self->_clientID;
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
          *(_WORD *)&unsigned char buf[12] = 1024;
          *(_DWORD *)&buf[14] = 421;
          __int16 v73 = 2080;
          uint64_t v74 = "-[AVHapticServerInstance handleClientApplicationStateChangeUsingAppState:]";
          __int16 v75 = 2048;
          unint64_t v76 = clientID;
          _os_log_impl(&dword_1A3931000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: App for backgrounded client 0x%lx returning to foreground - unmute haptics", buf, 0x26u);
        }

        goto LABEL_100;
      }
    }
    else
    {
      uint64_t v70 = 0;
      unsigned int v71 = 0;
    }
LABEL_104:
    if (v71) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v71);
    }
LABEL_106:
    if (![(AVHapticServerInstance *)self clientSuspended]) {
      return 0;
    }
    if (kHSRVScope)
    {
      __int16 v43 = *(id *)kHSRVScope;
      if (!v43) {
        goto LABEL_114;
      }
    }
    else
    {
      __int16 v43 = MEMORY[0x1E4F14500];
      id v44 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v45 = self->_clientID;
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 426;
      __int16 v73 = 2080;
      uint64_t v74 = "-[AVHapticServerInstance handleClientApplicationStateChangeUsingAppState:]";
      __int16 v75 = 2048;
      unint64_t v76 = v45;
      _os_log_impl(&dword_1A3931000, v43, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: App for suspended client 0x%lx now resuming", buf, 0x26u);
    }

LABEL_114:
    [(AVHapticServerInstance *)self setClientSuspended:0];
    if (![(AVHapticServerInstance *)self wasPrewarmedAndSuspended]) {
      goto LABEL_136;
    }
    [(AVHapticServerInstance *)self setWasPrewarmedAndSuspended:0];
    __int16 v46 = self->_master;
    if (v46)
    {
      [(AVHapticServer *)v46 entryWithID:self->_clientID];
      uint64_t v47 = v70;
      if (v70)
      {
        if (kHSRVScope)
        {
          if (*(unsigned char *)(kHSRVScope + 8))
          {
            __int16 v48 = *(id *)kHSRVScope;
            if (v48)
            {
              int v49 = v48;
              if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315650;
                *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
                *(_WORD *)&unsigned char buf[12] = 1024;
                *(_DWORD *)&buf[14] = 432;
                __int16 v73 = 2080;
                uint64_t v74 = "-[AVHapticServerInstance handleClientApplicationStateChangeUsingAppState:]";
                _os_log_impl(&dword_1A3931000, v49, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Calling doPrewarm (on ACQ) due to client resume", buf, 0x1Cu);
              }

              uint64_t v47 = v70;
            }
          }
        }
        __int16 v50 = self->_master;
        uint64_t v61 = v47;
        int v62 = v71;
        if (v71) {
          atomic_fetch_add_explicit(&v71->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        [(AVHapticServer *)v50 doPrewarm:&v61];
        if (v62) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v62);
        }
LABEL_134:
        if (v71) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v71);
        }
LABEL_136:
        if (![(AVHapticServerInstance *)self wasRunningAndSuspended]) {
          return 0;
        }
        if (kHSRVScope)
        {
          unint64_t v53 = *(id *)kHSRVScope;
          if (!v53)
          {
LABEL_144:
            [(AVHapticServerInstance *)self setWasRunningAndSuspended:0];
            return 0;
          }
        }
        else
        {
          unint64_t v53 = MEMORY[0x1E4F14500];
          id v54 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
          *(_WORD *)&unsigned char buf[12] = 1024;
          *(_DWORD *)&buf[14] = 440;
          __int16 v73 = 2080;
          uint64_t v74 = "-[AVHapticServerInstance handleClientApplicationStateChangeUsingAppState:]";
          _os_log_impl(&dword_1A3931000, v53, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Not restarting engine after client leaves suspended state", buf, 0x1Cu);
        }

        goto LABEL_144;
      }
    }
    else
    {
      uint64_t v70 = 0;
      unsigned int v71 = 0;
    }
    if (kHSRVScope)
    {
      if (*(unsigned char *)(kHSRVScope + 8))
      {
        unint64_t v51 = *(id *)kHSRVScope;
        if (v51)
        {
          __int16 v52 = v51;
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
            *(_WORD *)&unsigned char buf[12] = 1024;
            *(_DWORD *)&buf[14] = 436;
            __int16 v73 = 2080;
            uint64_t v74 = "-[AVHapticServerInstance handleClientApplicationStateChangeUsingAppState:]";
            _os_log_impl(&dword_1A3931000, v52, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Client gone - noop", buf, 0x1Cu);
          }
        }
      }
    }
    goto LABEL_134;
  }
  int v4 = a3;
  if (a3 == 4)
  {
    if ([(AVHapticServerInstance *)self runningInBackground]) {
      return 0;
    }
    if (kHSRVScope)
    {
      id v8 = *(id *)kHSRVScope;
      if (!v8) {
        goto LABEL_35;
      }
    }
    else
    {
      id v8 = MEMORY[0x1E4F14500];
      id v14 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v15 = self->_clientID;
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 400;
      __int16 v73 = 2080;
      uint64_t v74 = "-[AVHapticServerInstance handleClientApplicationStateChangeUsingAppState:]";
      __int16 v75 = 2048;
      unint64_t v76 = v15;
      _os_log_impl(&dword_1A3931000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: App for client 0x%lx being run in background", buf, 0x26u);
    }

LABEL_35:
    [(AVHapticServerInstance *)self setRunningInBackground:1];
    if (![(AVHapticServerInstance *)self clientSuspended])
    {
      if (kHSRVScope)
      {
        __int16 v17 = *(id *)kHSRVScope;
        if (!v17) {
          goto LABEL_87;
        }
      }
      else
      {
        __int16 v17 = MEMORY[0x1E4F14500];
        id v35 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
        *(_WORD *)&unsigned char buf[12] = 1024;
        *(_DWORD *)&buf[14] = 407;
        __int16 v73 = 2080;
        uint64_t v74 = "-[AVHapticServerInstance handleClientApplicationStateChangeUsingAppState:]";
        _os_log_impl(&dword_1A3931000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: App coming from foreground - mute haptics", buf, 0x1Cu);
      }

      goto LABEL_87;
    }
    if (kHSRVScope)
    {
      __int16 v16 = *(id *)kHSRVScope;
      if (!v16)
      {
LABEL_82:
        [(AVHapticServerInstance *)self setClientSuspended:0];
LABEL_87:
        object v36 = self->_master;
        if (v36)
        {
          [(AVHapticServer *)v36 entryWithID:self->_clientID];
          if (*(void *)buf)
          {
            __int16 v37 = [(AVHapticServer *)self->_master manager];
            unint64_t v38 = *(std::__shared_weak_count **)&buf[8];
            v64[0] = *(void *)buf;
            v64[1] = *(void *)&buf[8];
            if (*(void *)&buf[8]) {
              atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 1uLL, memory_order_relaxed);
            }
            ServerManager::handleAppBackgroundingForEntry((uint64_t)v37, v64, 1);
            if (v38) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v38);
            }
          }
        }
        else
        {
          *(void *)buf = 0;
          *(void *)&buf[8] = 0;
        }
        if (*(void *)&buf[8]) {
          std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
        }
        return 0;
      }
    }
    else
    {
      __int16 v16 = MEMORY[0x1E4F14500];
      id v34 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 403;
      __int16 v73 = 2080;
      uint64_t v74 = "-[AVHapticServerInstance handleClientApplicationStateChangeUsingAppState:]";
      _os_log_impl(&dword_1A3931000, v16, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: App coming from suspended - re-mute haptics", buf, 0x1Cu);
    }

    goto LABEL_82;
  }
  if (a3 != 2)
  {
    if (kHSRVScope)
    {
      if (*(unsigned char *)(kHSRVScope + 8))
      {
        uint64_t v9 = *(id *)kHSRVScope;
        if (v9)
        {
          BOOL v10 = v9;
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315906;
            *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
            *(_WORD *)&unsigned char buf[12] = 1024;
            *(_DWORD *)&buf[14] = 446;
            __int16 v73 = 2080;
            uint64_t v74 = "-[AVHapticServerInstance handleClientApplicationStateChangeUsingAppState:]";
            __int16 v75 = 1024;
            LODWORD(v76) = v4;
            _os_log_impl(&dword_1A3931000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: New app state %d ignored", buf, 0x22u);
          }
        }
      }
    }
    return 0;
  }
  if ([(AVHapticServerInstance *)self clientSuspended]) {
    return 0;
  }
  if (kHSRVScope)
  {
    BOOL v5 = *(id *)kHSRVScope;
    if (!v5) {
      goto LABEL_28;
    }
  }
  else
  {
    BOOL v5 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v12 = self->_clientID;
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 363;
    __int16 v73 = 2080;
    uint64_t v74 = "-[AVHapticServerInstance handleClientApplicationStateChangeUsingAppState:]";
    __int16 v75 = 2048;
    unint64_t v76 = v12;
    _os_log_impl(&dword_1A3931000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: App for client 0x%lx being suspended", buf, 0x26u);
  }

LABEL_28:
  [(AVHapticServerInstance *)self setClientSuspended:1];
  unint64_t v13 = self->_master;
  if (v13)
  {
    [(AVHapticServer *)v13 entryWithID:self->_clientID];
  }
  else
  {
    uint64_t v70 = 0;
    unsigned int v71 = 0;
  }
  if ([(AVHapticServerInstance *)self runningInBackground])
  {
    [(AVHapticServerInstance *)self setRunningInBackground:0];
    if (!v70) {
      goto LABEL_73;
    }
    if (kHSRVScope)
    {
      if (*(unsigned char *)(kHSRVScope + 8))
      {
        __int16 v19 = *(id *)kHSRVScope;
        if (v19)
        {
          __int16 v20 = v19;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
            *(_WORD *)&unsigned char buf[12] = 1024;
            *(_DWORD *)&buf[14] = 369;
            __int16 v73 = 2080;
            uint64_t v74 = "-[AVHapticServerInstance handleClientApplicationStateChangeUsingAppState:]";
            _os_log_impl(&dword_1A3931000, v20, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: App was in background-running - unmute haptics for suspend", buf, 0x1Cu);
          }
        }
      }
    }
    __int16 v21 = [(AVHapticServer *)self->_master manager];
    unint64_t v22 = v71;
    v69[0] = v70;
    v69[1] = v71;
    if (v71) {
      atomic_fetch_add_explicit(&v71->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    ServerManager::handleAppBackgroundingForEntry((uint64_t)v21, v69, 0);
    if (v22) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v22);
    }
  }
  if (!v70)
  {
LABEL_73:
    if (!kHSRVScope) {
      goto LABEL_161;
    }
    if ((*(unsigned char *)(kHSRVScope + 8) & 1) == 0) {
      goto LABEL_161;
    }
    uint64_t v30 = *(id *)kHSRVScope;
    if (!v30) {
      goto LABEL_161;
    }
    id v29 = v30;
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_160;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 393;
    __int16 v73 = 2080;
    uint64_t v74 = "-[AVHapticServerInstance handleClientApplicationStateChangeUsingAppState:]";
    int v31 = "%25s:%-5d %s: Client gone - noop";
    id v32 = v29;
    os_log_type_t v33 = OS_LOG_TYPE_DEBUG;
LABEL_159:
    _os_log_impl(&dword_1A3931000, v32, v33, v31, buf, 0x1Cu);
LABEL_160:

    goto LABEL_161;
  }
  if (*(unsigned char *)(v70 + 116))
  {
    [(AVHapticServerInstance *)self setWasPrewarmedAndSuspended:1];
    if (kHSRVScope)
    {
      if (*(unsigned char *)(kHSRVScope + 8))
      {
        uint64_t v23 = *(id *)kHSRVScope;
        if (v23)
        {
          __int16 v24 = v23;
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
            *(_WORD *)&unsigned char buf[12] = 1024;
            *(_DWORD *)&buf[14] = 376;
            __int16 v73 = 2080;
            uint64_t v74 = "-[AVHapticServerInstance handleClientApplicationStateChangeUsingAppState:]";
            _os_log_impl(&dword_1A3931000, v24, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Calling doStopPrewarm (on ACQ) due to client suspend", buf, 0x1Cu);
          }
        }
      }
    }
    uint64_t v25 = self->_master;
    uint64_t v67 = v70;
    BOOL v68 = v71;
    if (v71) {
      atomic_fetch_add_explicit(&v71->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(AVHapticServer *)v25 doStopPrewarm:&v67 audio:[(AVHapticServerInstance *)self prewarmIncludesAudio] haptics:[(AVHapticServerInstance *)self prewarmIncludesHaptics]];
    if (v68) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v68);
    }
  }
  int v26 = atomic_load((unsigned int *)(v70 + 120));
  if (v26 >= 2)
  {
    unsigned int v27 = atomic_load((unsigned int *)(v70 + 120));
    if (v27 != 2)
    {
      double v57 = CALog::LogObjIfEnabled((CALog *)6, kHSRVScope, v18);
      __int16 v58 = v57;
      if (v57 && os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
        *(_WORD *)&unsigned char buf[12] = 1024;
        *(_DWORD *)&buf[14] = 380;
        __int16 v73 = 2080;
        uint64_t v74 = "-[AVHapticServerInstance handleClientApplicationStateChangeUsingAppState:]";
        _os_log_impl(&dword_1A3931000, v58, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Calling doStopRunning (on ACQ) due to client suspend", buf, 0x1Cu);
      }

      [(AVHapticServerInstance *)self setWasRunningAndSuspended:1];
      BOOL v59 = self->_master;
      uint64_t v65 = v70;
      __int16 v66 = v71;
      if (v71) {
        atomic_fetch_add_explicit(&v71->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      [(AVHapticServer *)v59 doStopRunning:&v65 audio:[(AVHapticServerInstance *)self runIncludesAudio] haptics:[(AVHapticServerInstance *)self runIncludesHaptics]];
      if (v66) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v66);
      }
      if (_os_feature_enabled_impl()) {
        BOOL v55 = [(AVHapticServerInstance *)self runIncludesAudio];
      }
      else {
        BOOL v55 = 0;
      }
      [(AVHapticServerInstance *)self notifyClientOnStopWithReason:2 error:0];
      goto LABEL_162;
    }
  }
  unsigned int v28 = atomic_load((unsigned int *)(v70 + 120));
  if (v28 == 2)
  {
    if (kHSRVScope)
    {
      id v29 = *(id *)kHSRVScope;
      if (!v29) {
        goto LABEL_161;
      }
    }
    else
    {
      id v29 = MEMORY[0x1E4F14500];
      id v60 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_160;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "AVHapticServer.mm";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 389;
    __int16 v73 = 2080;
    uint64_t v74 = "-[AVHapticServerInstance handleClientApplicationStateChangeUsingAppState:]";
    int v31 = "%25s:%-5d %s: Client already stopping when suspended - noop";
    id v32 = v29;
    os_log_type_t v33 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_159;
  }
LABEL_161:
  BOOL v55 = 0;
LABEL_162:
  if (v71) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v71);
  }
  return v55;
}

- (void)handleClientRouteChange:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (kHSRVScope)
  {
    if (*(unsigned char *)(kHSRVScope + 8))
    {
      BOOL v5 = *(id *)kHSRVScope;
      if (v5)
      {
        id v6 = v5;
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          unint64_t clientID = self->_clientID;
          *(_DWORD *)buf = 136315906;
          uint64_t v23 = "AVHapticServer.mm";
          __int16 v24 = 1024;
          int v25 = 344;
          __int16 v26 = 2080;
          unsigned int v27 = "-[AVHapticServerInstance handleClientRouteChange:]";
          __int16 v28 = 2048;
          unint64_t v29 = clientID;
          _os_log_impl(&dword_1A3931000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Handling client route change for client 0x%lx", buf, 0x26u);
        }
      }
    }
  }
  id v8 = (id)*MEMORY[0x1E4F74F88];
  uint64_t v9 = [v4 objectForKey:v8];
  if (kHSRVScope)
  {
    if (*(unsigned char *)(kHSRVScope + 8))
    {
      BOOL v10 = *(id *)kHSRVScope;
      if (v10)
      {
        id v11 = v10;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v23 = "AVHapticServer.mm";
          __int16 v24 = 1024;
          int v25 = 347;
          __int16 v26 = 2080;
          unsigned int v27 = "-[AVHapticServerInstance handleClientRouteChange:]";
          __int16 v28 = 2112;
          unint64_t v29 = (unint64_t)v9;
          _os_log_impl(&dword_1A3931000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: New route: %@", buf, 0x26u);
        }
      }
    }
  }
  if ([v9 isEqualToString:@"Receiver"]) {
    char v12 = 1;
  }
  else {
    char v12 = [v9 isEqualToString:@"ReceiverAndMicrophone"];
  }
  self->_BOOL routeUsesReceiver = v12;
  master = self->_master;
  if (master)
  {
    [(AVHapticServer *)master entryWithID:self->_clientID];
    if (v20)
    {
      id v14 = [(AVHapticServer *)self->_master manager];
      unint64_t v15 = v21;
      v19[0] = v20;
      v19[1] = v21;
      if (v21) {
        atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      ServerManager::handleRouteChangeForEntry((uint64_t)v14, v19, self->_routeUsesReceiver);
      if (v15) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v15);
      }
    }
  }
  else
  {
    uint64_t v20 = 0;
    __int16 v21 = 0;
  }
  if (kHSRVScope)
  {
    if (*(unsigned char *)(kHSRVScope + 8))
    {
      __int16 v16 = *(id *)kHSRVScope;
      if (v16)
      {
        __int16 v17 = v16;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          unint64_t v18 = self->_clientID;
          *(_DWORD *)buf = 136315906;
          uint64_t v23 = "AVHapticServer.mm";
          __int16 v24 = 1024;
          int v25 = 354;
          __int16 v26 = 2080;
          unsigned int v27 = "-[AVHapticServerInstance handleClientRouteChange:]";
          __int16 v28 = 2048;
          unint64_t v29 = v18;
          _os_log_impl(&dword_1A3931000, v17, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Done handling route change for client 0x%lx", buf, 0x26u);
        }
      }
    }
  }
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }
}

- (void)notifyClientOnStopWithReason:(int64_t)a3 error:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = [(AVHapticServerInstance *)self getAsyncDelegateForMethod:a2 errorHandler:&__block_literal_global_21];
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
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    char v12 = [v7 localizedDescription];
    int v13 = 136316162;
    id v14 = "AVHapticServer.mm";
    __int16 v15 = 1024;
    int v16 = 338;
    __int16 v17 = 2080;
    unint64_t v18 = "-[AVHapticServerInstance notifyClientOnStopWithReason:error:]";
    __int16 v19 = 1024;
    int v20 = a3;
    __int16 v21 = 2112;
    unint64_t v22 = v12;
    _os_log_impl(&dword_1A3931000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: <Calling clientStoppedForReason:%d error:'%@' on client delegate>", (uint8_t *)&v13, 0x2Cu);
  }
LABEL_8:
  [v8 clientStoppedForReason:a3 error:v7];
}

void __61__AVHapticServerInstance_notifyClientOnStopWithReason_error___block_invoke(uint64_t a1, void *a2)
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
  BOOL v5 = v3;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = [v2 localizedDescription];
    int v7 = 136315906;
    id v8 = "AVHapticServer.mm";
    __int16 v9 = 1024;
    int v10 = 336;
    __int16 v11 = 2080;
    char v12 = "-[AVHapticServerInstance notifyClientOnStopWithReason:error:]_block_invoke";
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_1A3931000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unable to notify client of stop: %@", (uint8_t *)&v7, 0x26u);
  }
LABEL_8:
}

- (id)getSyncDelegateForMethod:(SEL)a3 errorHandler:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  connection = self->_connection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  id v11[2] = __64__AVHapticServerInstance_getSyncDelegateForMethod_errorHandler___block_invoke;
  v11[3] = &unk_1E5B14710;
  v13[1] = (id)a3;
  objc_copyWeak(v13, &location);
  id v12 = v6;
  id v8 = v6;
  __int16 v9 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v11];

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);

  return v9;
}

void __64__AVHapticServerInstance_getSyncDelegateForMethod_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (kHSRVScope)
    {
      id v4 = *(id *)kHSRVScope;
      if (!v4) {
        goto LABEL_9;
      }
    }
    else
    {
      id v4 = (id)MEMORY[0x1E4F14500];
      id v5 = MEMORY[0x1E4F14500];
    }
    id v6 = v4;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      int v9 = [WeakRetained clientID];
      int v10 = [v3 localizedDescription];
      int v11 = 136316418;
      id v12 = "AVHapticServer.mm";
      __int16 v13 = 1024;
      int v14 = 327;
      __int16 v15 = 2080;
      int v16 = "-[AVHapticServerInstance getSyncDelegateForMethod:errorHandler:]_block_invoke";
      __int16 v17 = 2112;
      id v18 = v7;
      __int16 v19 = 1024;
      int v20 = v9;
      __int16 v21 = 2112;
      unint64_t v22 = v10;
      _os_log_impl(&dword_1A3931000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Sync XPC call for '%@' (client ID 0x%x) failed: %@", (uint8_t *)&v11, 0x36u);
    }
  }
LABEL_9:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getAsyncDelegateForMethod:(SEL)a3 errorHandler:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  connection = self->_connection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  id v11[2] = __65__AVHapticServerInstance_getAsyncDelegateForMethod_errorHandler___block_invoke;
  v11[3] = &unk_1E5B14710;
  v13[1] = (id)a3;
  objc_copyWeak(v13, &location);
  id v12 = v6;
  id v8 = v6;
  int v9 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v11];

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);

  return v9;
}

void __65__AVHapticServerInstance_getAsyncDelegateForMethod_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (kHSRVScope)
    {
      id v4 = *(id *)kHSRVScope;
      if (!v4) {
        goto LABEL_9;
      }
    }
    else
    {
      id v4 = (id)MEMORY[0x1E4F14500];
      id v5 = MEMORY[0x1E4F14500];
    }
    id v6 = v4;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      int v9 = [WeakRetained clientID];
      int v10 = [v3 localizedDescription];
      int v11 = 136316418;
      id v12 = "AVHapticServer.mm";
      __int16 v13 = 1024;
      int v14 = 316;
      __int16 v15 = 2080;
      int v16 = "-[AVHapticServerInstance getAsyncDelegateForMethod:errorHandler:]_block_invoke";
      __int16 v17 = 2112;
      id v18 = v7;
      __int16 v19 = 1024;
      int v20 = v9;
      __int16 v21 = 2112;
      unint64_t v22 = v10;
      _os_log_impl(&dword_1A3931000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Async XPC call for '%@' (client ID 0x%x) failed: %@", (uint8_t *)&v11, 0x36u);
    }
  }
LABEL_9:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end