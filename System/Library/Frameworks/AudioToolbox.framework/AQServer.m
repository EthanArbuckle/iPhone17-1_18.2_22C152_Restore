@interface AQServer
@end

@implementation AQServer

void __AQServer_DisposeQueue_block_invoke(uint64_t a1)
{
  QueueAccessor::QueueAccessor((QueueAccessor *)v13, *(_DWORD *)(a1 + 40), (audit_token_t *)(a1 + 44), *(unsigned char *)(a1 + 80));
  v3 = (AudioQueueOwner *)v14;
  v4 = (AudioQueueObject *)v14[2];
  v5 = (std::__shared_weak_count *)*((void *)v4 + 64);
  if (v5 && (v6 = std::__shared_weak_count::lock(v5)) != 0)
  {
    v7 = v6;
    uint64_t v8 = *((void *)v4 + 63);
    if (v8) {
      v9 = (AQRemoteClient *)(v8 - 16);
    }
    else {
      v9 = 0;
    }
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  else
  {
    v9 = 0;
  }
  v10 = (AQOfflineMixerBase *)*((void *)v4 + 98);
  if (*(_DWORD *)(a1 + 76))
  {
    QueueAccessor::SetSessionPlayStateToStopped_PreDeletion((QueueAccessor *)v13, v2);
    AudioQueueObject::~AudioQueueObject(v4);
    v11 = (AQ::Server *)MEMORY[0x1A62520E0]();
  }
  else
  {
    v11 = (AQ::Server *)AudioQueueObject::ScheduleDisposal(v4, 1);
    v14[2] = 0;
  }
  if (v15 && v14) {
    v11 = (AQ::Server *)CADeprecated::CAMutex::Unlock((CADeprecated::CAMutex *)(v14 + 3));
  }
  if (v10) {
    v11 = (AQ::Server *)AQOfflineMixerBase::ConnectQueue(v10, *(_DWORD *)(a1 + 40), 0);
  }
  AQServer = (AQServer *)getAQServer(v11);
  AQServer::QueueDisposed(AQServer, v9, v3);
}

uint64_t __AQServer_Start_block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  QueueAccessor::QueueAccessor((QueueAccessor *)v11, *(_DWORD *)(a1 + 72), (audit_token_t *)(a1 + 76), *(unsigned char *)(a1 + 112));
  uint64_t v2 = *(void *)(v12 + 16);
  unsigned __int8 v7 = 0;
  float v8 = 0.0;
  float v9 = 0.0;
  float v10 = 1.0;
  if (*(unsigned char *)(v2 + 88)) {
    v3 = 0;
  }
  else {
    v3 = &v7;
  }
  uint64_t result = QueueAccessor::SetSessionPlayState((uint64_t)v11, 1, (uint64_t)v3);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_5;
  }
  if (!*(_DWORD *)(a1 + 64) || (v5 = *(void **)(v2 + 784)) == 0)
  {
    if (*(unsigned char *)(v2 + 88)) {
      goto LABEL_26;
    }
    if (gAQMELogScope)
    {
      v6 = *(NSObject **)gAQMELogScope;
      if (!*(void *)gAQMELogScope)
      {
LABEL_22:
        if (v7 && v8 > 0.0)
        {
          AudioQueueObject::SetVolume2InitialValue(v2, v9);
        }
        else
        {
          AudioQueueObject::SetParameter((AudioQueueObject *)v2, 6u, v8);
          AudioQueueObject::SetParameter((AudioQueueObject *)v2, 5u, v10);
        }
LABEL_26:
        uint64_t result = AudioQueueObject::Start(v2, (long long *)(a1 + 40), *(_DWORD *)(a1 + 108));
        *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
        if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
          uint64_t result = QueueAccessor::SetSessionPlayState((uint64_t)v11, 0, 0);
        }
        if (*(unsigned char *)(v2 + 88)) {
          goto LABEL_5;
        }
        v5 = 0;
        if (v7 && v8 > 0.0)
        {
          AudioQueueObject::SetParameter((AudioQueueObject *)v2, 6u, v8);
          uint64_t result = AudioQueueObject::SetParameter((AudioQueueObject *)v2, 5u, v10);
LABEL_5:
          v5 = 0;
          goto LABEL_6;
        }
        goto LABEL_6;
      }
    }
    else
    {
      v6 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316418;
      char v15 = "AQServer.cpp";
      __int16 v16 = 1024;
      int v17 = 701;
      __int16 v18 = 1024;
      int v19 = v7;
      __int16 v20 = 2048;
      double v21 = v8;
      __int16 v22 = 2048;
      double v23 = v9;
      __int16 v24 = 2048;
      double v25 = v10;
      _os_log_impl(&dword_1A3931000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d Duck info: fromCM %d, %.3fs, level %.3f -> %.3f", buf, 0x36u);
    }
    goto LABEL_22;
  }
LABEL_6:
  if (v13 && v12) {
    uint64_t result = CADeprecated::CAMutex::Unlock((CADeprecated::CAMutex *)(v12 + 24));
  }
  if (v5)
  {
    if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
    {
      uint64_t result = AQOfflineMixerBase::ScheduleQueueStart(v5, *(_DWORD *)(a1 + 72), (uint64_t *)(a1 + 40));
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    }
  }
  return result;
}

uint64_t __AQServer_Prime_block_invoke(uint64_t a1)
{
  QueueAccessor::QueueAccessor((QueueAccessor *)v4, *(_DWORD *)(a1 + 48), (audit_token_t *)(a1 + 52), *(unsigned char *)(a1 + 88));
  uint64_t v2 = *(AudioQueueObject **)(v5 + 16);
  uint64_t result = QueueAccessor::SetSessionPlayState((uint64_t)v4, 3, 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t result = AudioQueueObject::Prime(v2, *(_DWORD *)(a1 + 84), *(unsigned int **)(a1 + 40));
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      uint64_t result = QueueAccessor::SetSessionPlayState((uint64_t)v4, 0, 0);
    }
  }
  if (v6)
  {
    if (v5) {
      return CADeprecated::CAMutex::Unlock((CADeprecated::CAMutex *)(v5 + 24));
    }
  }
  return result;
}

void __AQServer_Stop_block_invoke(uint64_t a1)
{
  int v6 = 0;
  QueueAccessor::QueueAccessor((QueueAccessor *)&v3, *(_DWORD *)(a1 + 40), (audit_token_t *)(a1 + 44), *(unsigned char *)(a1 + 80));
  uint64_t v2 = *(AudioQueueObject **)(v4 + 16);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = AudioQueueObject::Stop(v2, *(_DWORD *)(a1 + 76) != 0, 0, &v6);
  if (v6)
  {
    QueueAccessor::SetSessionPlayState((uint64_t)&v3, 0, 0);
    if (v6 == 2) {
      AudioQueueObject::PropertyChanged((__CFData **)v2, 1634824814, 0);
    }
  }
  if (v5)
  {
    if (v4) {
      CADeprecated::CAMutex::Unlock((CADeprecated::CAMutex *)(v4 + 24));
    }
  }
}

uint64_t __AQServer_Pause_block_invoke(uint64_t a1)
{
  QueueAccessor::QueueAccessor((QueueAccessor *)v3, *(_DWORD *)(a1 + 48), (audit_token_t *)(a1 + 52), *(unsigned char *)(a1 + 84));
  AudioQueueObject::BeginPause(*(AudioQueueObject **)(v4 + 16), *(uint64_t **)(a1 + 40), 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  uint64_t result = QueueAccessor::SetSessionPlayState((uint64_t)v3, 2, 0);
  if (v5)
  {
    if (v4) {
      return CADeprecated::CAMutex::Unlock((CADeprecated::CAMutex *)(v4 + 24));
    }
  }
  return result;
}

void __AQServer_SetOfflineRenderFormat_block_invoke(uint64_t a1)
{
  QueueAccessor::QueueAccessor((QueueAccessor *)v11, *(_DWORD *)(a1 + 88), (audit_token_t *)(a1 + 92), *(unsigned char *)(a1 + 132));
  uint64_t v2 = *(void *)(v12 + 16);
  if (*(_DWORD *)(a1 + 124)) {
    uint64_t v3 = (const AudioStreamBasicDescription *)(a1 + 40);
  }
  else {
    uint64_t v3 = 0;
  }
  if (*(_DWORD *)(a1 + 128)) {
    uint64_t v4 = *(const AudioChannelLayout **)(a1 + 80);
  }
  else {
    uint64_t v4 = 0;
  }
  int v5 = *(unsigned __int8 *)(v2 + 667);
  int v6 = (AQ::Server *)AudioQueueObject::SetOfflineRenderFormat(*(AudioQueueObject **)(v12 + 16), v3, v4, 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v6;
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    int v7 = *(unsigned __int8 *)(v2 + 667);
    if ((v5 != 0) != (*(unsigned char *)(v2 + 667) != 0))
    {
      uint64_t AQServer = getAQServer(v6);
      AudioQueueObject::GetRemoteClient<AQ::Server::RemoteClientBase>(&v9, v2);
      (*(void (**)(uint64_t, uint64_t, uint64_t, BOOL))(*(void *)AQServer + 48))(AQServer, v9, v12, v7 != 0);
      if (v10) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v10);
      }
    }
  }
  if (v13)
  {
    if (v12) {
      CADeprecated::CAMutex::Unlock((CADeprecated::CAMutex *)(v12 + 24));
    }
  }
}

uint64_t __AQServer_MixerConnectQueue_block_invoke(uint64_t a1)
{
  uint64_t result = BaseOpaqueObject::ResolveOpaqueRef();
  if (result
    && (uint64_t v3 = (AQOfflineMixerBase *)(result - 400),
        uint64_t result = CheckCredentials(result - 400, (void *)(a1 + 44)),
        result))
  {
    uint64_t result = AQOfflineMixerBase::ConnectQueue(v3, *(_DWORD *)(a1 + 76), *(_DWORD *)(a1 + 80) != 0);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -50;
  }
  return result;
}

@end