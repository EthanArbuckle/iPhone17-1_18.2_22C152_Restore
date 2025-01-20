@interface _AFAudioPowerXPCSharedMemory
- (_AFAudioPowerXPCSharedMemory)initWithXPCObject:(id)a3;
- (float)averagePower;
- (float)peakPower;
- (void)_destroyMapping;
- (void)dealloc;
@end

@implementation _AFAudioPowerXPCSharedMemory

- (void).cxx_destruct
{
}

- (void)_destroyMapping
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  sharedRegion = self->_sharedRegion;
  if (sharedRegion)
  {
    size_t mappedLength = self->_mappedLength;
    if (mappedLength)
    {
      int v5 = munmap(sharedRegion, mappedLength);
      if (v5)
      {
        int v6 = v5;
        v7 = AFSiriLogContextUtility;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
        {
          int v8 = 136315394;
          v9 = "-[_AFAudioPowerXPCSharedMemory _destroyMapping]";
          __int16 v10 = 1024;
          int v11 = v6;
          _os_log_error_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_ERROR, "%s %d", (uint8_t *)&v8, 0x12u);
        }
      }
    }
  }
  self->_size_t mappedLength = 0;
  self->_sharedRegion = 0;
}

- (float)peakPower
{
  return *((float *)self->_sharedRegion + 1);
}

- (float)averagePower
{
  return *(float *)self->_sharedRegion;
}

- (void)dealloc
{
  [(_AFAudioPowerXPCSharedMemory *)self _destroyMapping];
  v3.receiver = self;
  v3.super_class = (Class)_AFAudioPowerXPCSharedMemory;
  [(_AFAudioPowerXPCSharedMemory *)&v3 dealloc];
}

- (_AFAudioPowerXPCSharedMemory)initWithXPCObject:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_AFAudioPowerXPCSharedMemory;
  int v6 = [(_AFAudioPowerXPCSharedMemory *)&v17 init];
  if (!v6) {
    goto LABEL_21;
  }
  if (v5)
  {
    if (MEMORY[0x19F3A5530](v5) != MEMORY[0x1E4F145E8])
    {
      v7 = AFSiriLogContextUtility;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "-[_AFAudioPowerXPCSharedMemory initWithXPCObject:]";
        int v8 = "%s Unexpectec XPC object type.";
LABEL_8:
        _os_log_error_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_ERROR, v8, buf, 0xCu);
        goto LABEL_20;
      }
      goto LABEL_20;
    }
    objc_storeStrong((id *)&v6->_xpcObject, a3);
    size_t v9 = xpc_shmem_map(v5, &v6->_sharedRegion);
    v6->_unint64_t mappedLength = v9;
    sharedRegion = v6->_sharedRegion;
    if (sharedRegion) {
      BOOL v11 = v9 > 7;
    }
    else {
      BOOL v11 = 0;
    }
    if (!v11)
    {
      unint64_t mappedLength = v9;
      if (!sharedRegion)
      {
        v13 = AFSiriLogContextUtility;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v19 = "-[_AFAudioPowerXPCSharedMemory initWithXPCObject:]";
          _os_log_error_impl(&dword_19CF1D000, v13, OS_LOG_TYPE_ERROR, "%s Mapping failed due to nil shared region.", buf, 0xCu);
          unint64_t mappedLength = v6->_mappedLength;
        }
      }
      if (mappedLength <= 7)
      {
        v14 = AFSiriLogContextUtility;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v19 = "-[_AFAudioPowerXPCSharedMemory initWithXPCObject:]";
          __int16 v20 = 2048;
          unint64_t v21 = mappedLength;
          _os_log_error_impl(&dword_19CF1D000, v14, OS_LOG_TYPE_ERROR, "%s Mapping failed due to unexpected mapped length (unint64_t mappedLength = %zd).", buf, 0x16u);
        }
      }
      [(_AFAudioPowerXPCSharedMemory *)v6 _destroyMapping];
      goto LABEL_20;
    }
LABEL_21:
    v15 = v6;
    goto LABEL_22;
  }
  v7 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[_AFAudioPowerXPCSharedMemory initWithXPCObject:]";
    int v8 = "%s XPC object is nil.";
    goto LABEL_8;
  }
LABEL_20:
  v15 = 0;
LABEL_22:

  return v15;
}

@end