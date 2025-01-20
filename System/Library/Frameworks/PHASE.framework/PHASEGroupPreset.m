@interface PHASEGroupPreset
+ (PHASEGroupPreset)new;
- (NSDictionary)settings;
- (PHASEGroupPreset)init;
- (PHASEGroupPreset)initWithEngine:(PHASEEngine *)engine settings:(NSDictionary *)settings timeToTarget:(double)timeToTarget timeToReset:(double)timeToReset;
- (double)timeToReset;
- (double)timeToTarget;
- (uint64_t)activate;
- (uint64_t)activateWithTimeToTargetOverride:;
- (uint64_t)activateWithTimeToTargetOverride:(uint64_t)a1;
- (uint64_t)deactivate;
- (uint64_t)deactivateWithTimeToResetOverride:;
- (void)activate;
- (void)activateWithTimeToTargetOverride:(double)timeToTargetOverride;
- (void)activateWithTimeToTargetOverride:(uint64_t)a1;
- (void)deactivate;
- (void)deactivateWithTimeToResetOverride:;
- (void)deactivateWithTimeToResetOverride:(double)timeToResetOverride;
@end

@implementation PHASEGroupPreset

- (PHASEGroupPreset)init
{
  return 0;
}

+ (PHASEGroupPreset)new
{
  return 0;
}

- (PHASEGroupPreset)initWithEngine:(PHASEEngine *)engine settings:(NSDictionary *)settings timeToTarget:(double)timeToTarget timeToReset:(double)timeToReset
{
  v10 = engine;
  v11 = settings;
  v16.receiver = self;
  v16.super_class = (Class)PHASEGroupPreset;
  v12 = [(PHASEGroupPreset *)&v16 init];
  if (v12)
  {
    uint64_t v13 = [NSDictionary dictionaryWithDictionary:v11];
    v14 = v12->_settings;
    v12->_settings = (NSDictionary *)v13;

    v12->_timeToTarget = timeToReset;
    v12->_timeToReset = timeToTarget;
    objc_storeWeak((id *)&v12->_engine, v10);
  }

  return v12;
}

- (void)activate
{
  JUMPOUT(0x223C938A0);
}

- (void)activateWithTimeToTargetOverride:(double)timeToTargetOverride
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  p_engine = &self->_engine;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);

  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)p_engine);
    uint64_t v8 = Phase::Controller::TaskManager::GetService<Phase::Controller::GroupManager>((Phase::Logger *)([v7 implementation] + 48), 10);

    v9 = self;
    uint64_t v10 = **(void **)(v8 + 8);
    unint64_t v18 = 0;
    BOOL v17 = 1;
    uint64_t v11 = Phase::LockFreeQueueMPSC::GetWriteBuffer((atomic_uchar *)v10, 32, &v18, &v17);
    if (!v11)
    {
      Instance = (Phase::Logger *)Phase::Logger::GetInstance(0);
      Phase::Logger::DumpTailspinWithThrottleAsync(Instance, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
      v15 = **(id **)(v10 + 48);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "CommandQueue.hpp";
        __int16 v21 = 1024;
        int v22 = 100;
        _os_log_impl(&dword_221E5E000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffe"
          "r is full, unable to grow.\"",
          buf,
          0x12u);
      }
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    }
    if (v17)
    {
      v12 = **(id **)(v10 + 48);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315906;
        v20 = "CommandQueue.hpp";
        __int16 v21 = 1024;
        int v22 = 89;
        __int16 v23 = 2048;
        unint64_t v24 = v18;
        __int16 v25 = 2048;
        uint64_t v26 = 32;
        _os_log_impl(&dword_221E5E000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
      }
    }
    *(void *)uint64_t v11 = &unk_26D479120;
    *(void *)(v11 + 8) = v8;
    *(void *)(v11 + 16) = v9;
    *(double *)(v11 + 24) = timeToTargetOverride;
    Phase::LockFreeQueueSPSC::CommitBytes((atomic_uchar *)v10, 32);
    atomic_store(0, (unsigned __int8 *)(v10 + 40));

    id v13 = objc_loadWeakRetained((id *)p_engine);
    [v13 setInternalActiveGroupMixerPreset:v9];
  }
}

- (void)deactivate
{
}

- (void)deactivateWithTimeToResetOverride:(double)timeToResetOverride
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  p_engine = &self->_engine;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);

  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)p_engine);
    uint64_t v8 = [v7 activeGroupPreset];

    if (v8 == self)
    {
      id v9 = objc_loadWeakRetained((id *)p_engine);
      uint64_t v10 = Phase::Controller::TaskManager::GetService<Phase::Controller::GroupManager>((Phase::Logger *)([v9 implementation] + 48), 10);

      uint64_t v11 = **(void **)(v10 + 8);
      unint64_t v19 = 0;
      BOOL v18 = 1;
      uint64_t v12 = Phase::LockFreeQueueMPSC::GetWriteBuffer((atomic_uchar *)v11, 24, &v19, &v18);
      if (!v12)
      {
        Instance = (Phase::Logger *)Phase::Logger::GetInstance(0);
        Phase::Logger::DumpTailspinWithThrottleAsync(Instance, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
        objc_super v16 = **(id **)(v11 + 48);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          __int16 v21 = "CommandQueue.hpp";
          __int16 v22 = 1024;
          int v23 = 100;
          _os_log_impl(&dword_221E5E000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buf"
            "fer is full, unable to grow.\"",
            buf,
            0x12u);
        }
        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
      }
      if (v18)
      {
        id v13 = **(id **)(v11 + 48);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          __int16 v21 = "CommandQueue.hpp";
          __int16 v22 = 1024;
          int v23 = 89;
          __int16 v24 = 2048;
          unint64_t v25 = v19;
          __int16 v26 = 2048;
          uint64_t v27 = 24;
          _os_log_impl(&dword_221E5E000, v13, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
        }
      }
      *(void *)uint64_t v12 = &unk_26D479170;
      *(void *)(v12 + 8) = v10;
      *(double *)(v12 + 16) = timeToResetOverride;
      Phase::LockFreeQueueSPSC::CommitBytes((atomic_uchar *)v11, 24);
      atomic_store(0, (unsigned __int8 *)(v11 + 40));
      id v14 = objc_loadWeakRetained((id *)p_engine);
      [v14 setInternalActiveGroupMixerPreset:0];
    }
  }
}

- (NSDictionary)settings
{
  return self->_settings;
}

- (double)timeToTarget
{
  return self->_timeToTarget;
}

- (double)timeToReset
{
  return self->_timeToReset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);

  objc_destroyWeak((id *)&self->_engine);
}

- (uint64_t)activate
{
  return Phase::Controller::GroupManager::SetPreset(*(void *)(a1 + 8), *(void **)(a1 + 16), 0, 0);
}

- (uint64_t)activateWithTimeToTargetOverride:(uint64_t)a1
{
  return a1;
}

- (void)activateWithTimeToTargetOverride:(uint64_t)a1
{
  JUMPOUT(0x223C938A0);
}

- (uint64_t)activateWithTimeToTargetOverride:
{
  return Phase::Controller::GroupManager::SetPreset(*(void *)(a1 + 8), *(void **)(a1 + 16), *(void *)(a1 + 24), 1);
}

- (uint64_t)deactivate
{
  return Phase::Controller::GroupManager::SetPreset(*(void *)(a1 + 8), 0, 0, 0);
}

- (void)deactivateWithTimeToResetOverride:
{
}

- (uint64_t)deactivateWithTimeToResetOverride:
{
  return Phase::Controller::GroupManager::SetPreset(*(void *)(a1 + 8), 0, *(void *)(a1 + 16), 1);
}

@end