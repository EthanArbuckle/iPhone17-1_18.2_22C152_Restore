@interface AVVCRecordDeviceInfo
- (AVVCRecordDeviceInfo)initWithRecordingEngine:(shared_ptr<AVVCRecordingEngine>)a3;
- (BOOL)isRemoteDevice;
- (BOOL)isUpsamplingSourceAudio;
- (NSString)recordRoute;
- (NSString)remoteDeviceUIDString;
- (NSString)remoteProductIdentifier;
- (NSUUID)remoteDeviceUID;
- (unsigned)remoteDeviceCategory;
- (void)dealloc;
@end

@implementation AVVCRecordDeviceInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDeviceUIDString, 0);
  objc_storeStrong((id *)&self->_remoteDeviceUID, 0);
  objc_storeStrong((id *)&self->_remoteProductIdentifier, 0);

  objc_storeStrong((id *)&self->_recordRoute, 0);
}

- (NSString)remoteDeviceUIDString
{
  return self->_remoteDeviceUIDString;
}

- (BOOL)isUpsamplingSourceAudio
{
  return self->_isUpsamplingSourceAudio;
}

- (unsigned)remoteDeviceCategory
{
  return self->_remoteDeviceCategory;
}

- (NSUUID)remoteDeviceUID
{
  return self->_remoteDeviceUID;
}

- (NSString)remoteProductIdentifier
{
  return self->_remoteProductIdentifier;
}

- (BOOL)isRemoteDevice
{
  return self->_isRemoteDevice;
}

- (NSString)recordRoute
{
  return self->_recordRoute;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (kAVVCScope)
  {
    if (*(unsigned char *)(kAVVCScope + 8))
    {
      v3 = *(id *)kAVVCScope;
      if (v3)
      {
        v4 = v3;
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v7 = "AVVoiceController.mm";
          __int16 v8 = 1024;
          int v9 = 210;
          __int16 v10 = 2048;
          v11 = self;
          _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d AVVCRecordDeviceInfo dealloc. self(%p)", buf, 0x1Cu);
        }
      }
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)AVVCRecordDeviceInfo;
  [(AVVCRecordDeviceInfo *)&v5 dealloc];
}

- (AVVCRecordDeviceInfo)initWithRecordingEngine:(shared_ptr<AVVCRecordingEngine>)a3
{
  var0 = a3.var0;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v40.receiver = self;
  v40.super_class = (Class)AVVCRecordDeviceInfo;
  v4 = [(AVVCRecordDeviceInfo *)&v40 init];
  if (v4)
  {
    if (!kAVVCScope) {
      goto LABEL_17;
    }
    if ((*(unsigned char *)(kAVVCScope + 8) & 1) == 0) {
      goto LABEL_17;
    }
    id v5 = *(id *)kAVVCScope;
    if (!v5) {
      goto LABEL_17;
    }
    v6 = v5;
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
LABEL_16:

LABEL_17:
      recordRoute = v4->_recordRoute;
      v4->_recordRoute = 0;

      (*(void (**)(void, NSString **))(**(void **)var0 + 328))(*(void *)var0, &v4->_recordRoute);
      uint64_t v14 = *(void *)var0;
      v4->_isUpsamplingSourceAudio = *(unsigned char *)(*(void *)var0 + 328);
      AVVCRouteManager::getRecordDeviceUID(*(id **)(v14 + 376));
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        uint64_t v16 = [NSString stringWithString:v15];
        remoteDeviceUIDString = v4->_remoteDeviceUIDString;
        v4->_remoteDeviceUIDString = (NSString *)v16;
      }
      else
      {
        remoteDeviceUIDString = v4->_remoteDeviceUIDString;
        v4->_remoteDeviceUIDString = 0;
      }

      if ((*(unsigned int (**)(void))(**(void **)var0 + 320))(*(void *)var0) == 2)
      {
        v4->_isRemoteDevice = 0;
        remoteProductIdentifier = v4->_remoteProductIdentifier;
        v4->_remoteProductIdentifier = 0;

        remoteDeviceUID = v4->_remoteDeviceUID;
        v4->_remoteDeviceUID = 0;
      }
      else
      {
        v4->_isRemoteDevice = 1;
        if ((*(unsigned int (**)(void))(**(void **)var0 + 320))(*(void *)var0) == 1)
        {
          uint64_t v20 = *(void *)(*(void *)var0 + 376);
          if (IsSerializationEnabled(void)::onceToken != -1) {
            dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
          }
          if (IsSerializationEnabled(void)::enable)
          {
            v21 = (__CFString *)*(id *)v20;
          }
          else
          {
            v24 = (std::mutex *)(v20 + 56);
            std::mutex::lock((std::mutex *)(v20 + 56));
            v21 = (__CFString *)*(id *)v20;
            std::mutex::unlock(v24);
          }
          if (kAVVCScope)
          {
            if (*(unsigned char *)(kAVVCScope + 8))
            {
              v25 = *(id *)kAVVCScope;
              if (v25)
              {
                v26 = v25;
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315650;
                  v42 = "AVVoiceController.mm";
                  __int16 v43 = 1024;
                  int v44 = 192;
                  __int16 v45 = 2112;
                  v46 = v21;
                  _os_log_impl(&dword_19D794000, v26, OS_LOG_TYPE_DEBUG, "%25s:%-5d AVVCRecordDeviceInfo initWithRecordingEngine: recordDeviceName(%@)", buf, 0x1Cu);
                }
              }
            }
          }
          if (v21)
          {
            uint64_t v27 = [[NSString alloc] initWithString:v21];
            v28 = v4->_remoteProductIdentifier;
            v4->_remoteProductIdentifier = (NSString *)v27;
          }
          else
          {
            v28 = v4->_remoteProductIdentifier;
            v4->_remoteProductIdentifier = 0;
          }

          if (kAVVCScope)
          {
            if (*(unsigned char *)(kAVVCScope + 8))
            {
              v29 = *(id *)kAVVCScope;
              if (v29)
              {
                v30 = v29;
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315650;
                  v42 = "AVVoiceController.mm";
                  __int16 v43 = 1024;
                  int v44 = 194;
                  __int16 v45 = 2112;
                  v46 = v15;
                  _os_log_impl(&dword_19D794000, v30, OS_LOG_TYPE_DEBUG, "%25s:%-5d AVVCRecordDeviceInfo initWithRecordingEngine: remoteDeviceUUID(%@)", buf, 0x1Cu);
                }
              }
            }
          }
          if (v15)
          {
            uint64_t v31 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v15];
            v32 = v4->_remoteDeviceUID;
            v4->_remoteDeviceUID = (NSUUID *)v31;
          }
          else
          {
            v32 = v4->_remoteDeviceUID;
            v4->_remoteDeviceUID = 0;
          }

          uint64_t v33 = *(void *)(*(void *)var0 + 376);
          if (IsSerializationEnabled(void)::onceToken != -1) {
            dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
          }
          if (IsSerializationEnabled(void)::enable)
          {
            unsigned int v34 = *(_DWORD *)(v33 + 8);
          }
          else
          {
            v35 = (std::mutex *)(v33 + 56);
            std::mutex::lock((std::mutex *)(v33 + 56));
            unsigned int v34 = *(_DWORD *)(v33 + 8);
            std::mutex::unlock(v35);
          }
          v4->_unsigned int remoteDeviceCategory = v34;
          if (kAVVCScope)
          {
            if (*(unsigned char *)(kAVVCScope + 8))
            {
              v36 = *(id *)kAVVCScope;
              if (v36)
              {
                v37 = v36;
                if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                {
                  unsigned int remoteDeviceCategory = v4->_remoteDeviceCategory;
                  *(_DWORD *)buf = 136315650;
                  v42 = "AVVoiceController.mm";
                  __int16 v43 = 1024;
                  int v44 = 197;
                  __int16 v45 = 1024;
                  LODWORD(v46) = remoteDeviceCategory;
                  _os_log_impl(&dword_19D794000, v37, OS_LOG_TYPE_DEBUG, "%25s:%-5d AVVCRecordDeviceInfo initWithVoiceController: remoteDeviceCategory(%d)", buf, 0x18u);
                }
              }
            }
          }

          goto LABEL_60;
        }
        v22 = v4->_remoteProductIdentifier;
        v4->_remoteProductIdentifier = 0;

        v23 = v4->_remoteDeviceUID;
        v4->_remoteDeviceUID = 0;
      }
      v4->_unsigned int remoteDeviceCategory = 0;
LABEL_60:

      return v4;
    }
    uint64_t v7 = *(void *)var0;
    __int16 v8 = (std::__shared_weak_count *)*((void *)var0 + 1);
    if (v8)
    {
      atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
      if (v7)
      {
        int v9 = NSString;
        uint64_t v10 = *(void *)(v7 + 272);
        uint64_t v11 = v8->__shared_owners_ + 1;
LABEL_11:
        uint64_t v12 = [v9 stringWithFormat:@"(%p) streamID: %d, use_count:%ld", v7, v10, v11];
LABEL_13:
        *(_DWORD *)buf = 136315906;
        v42 = "AVVoiceController.mm";
        __int16 v43 = 1024;
        int v44 = 171;
        __int16 v45 = 2112;
        v46 = v12;
        __int16 v47 = 2048;
        v48 = v4;
        _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d AVVCRecordDeviceInfo initWithRecordingEngine[%@]. self(%p)", buf, 0x26u);
        if (v8) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v8);
        }

        goto LABEL_16;
      }
    }
    else if (v7)
    {
      uint64_t v11 = 0;
      int v9 = NSString;
      uint64_t v10 = *(void *)(v7 + 272);
      goto LABEL_11;
    }
    uint64_t v12 = @"(0x0) use_count:0";
    goto LABEL_13;
  }
  return v4;
}

@end