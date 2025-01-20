@interface PHASEGroup
+ (PHASEGroup)new;
- (BOOL)isMuted;
- (BOOL)isSoloed;
- (NSString)identifier;
- (NSString)uid;
- (PHASEEngine)engine;
- (PHASEGroup)init;
- (PHASEGroup)initWithEngine:(id)a3 identifier:(id)a4;
- (PHASEGroup)initWithIdentifier:(NSString *)identifier;
- (double)gain;
- (double)gainHF;
- (double)gainHighFrequency;
- (double)gainLF;
- (double)gainLowFrequency;
- (double)rate;
- (uint64_t)registerWithEngine:;
- (uint64_t)registerWithEngine:(uint64_t)a1;
- (uint64_t)unregisterFromEngine;
- (void)fadeGain:(double)gain duration:(double)duration curveType:(PHASECurveType)curveType;
- (void)fadeGain:duration:curveType:;
- (void)fadeGainHighFrequency:(double)a3 duration:(double)a4 curveType:(int64_t)a5;
- (void)fadeGainHighFrequency:duration:curveType:;
- (void)fadeGainLowFrequency:(double)a3 duration:(double)a4 curveType:(int64_t)a5;
- (void)fadeGainLowFrequency:duration:curveType:;
- (void)fadeRate:(double)rate duration:(double)duration curveType:(PHASECurveType)curveType;
- (void)fadeRate:duration:curveType:;
- (void)mute;
- (void)registerWithEngine:(PHASEEngine *)engine;
- (void)registerWithEngine:(uint64_t)a1;
- (void)setEngine:(id)a3;
- (void)setGain:(double)gain;
- (void)setGainHighFrequency:(double)a3;
- (void)setGainLowFrequency:(double)a3;
- (void)setRate:(double)rate;
- (void)solo;
- (void)unmute;
- (void)unregisterFromEngine;
- (void)unsolo;
@end

@implementation PHASEGroup

- (NSString)uid
{
  return self->_identifier;
}

- (PHASEGroup)init
{
  return 0;
}

+ (PHASEGroup)new
{
  return 0;
}

- (PHASEGroup)initWithIdentifier:(NSString *)identifier
{
  v5 = identifier;
  v15.receiver = self;
  v15.super_class = (Class)PHASEGroup;
  v6 = [(PHASEGroup *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, identifier);
    v7->_hashId = Phase::GetStringHashId((Phase *)v5, v8);
    *(_WORD *)&v7->_muted = 0;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&v7->_gain = _Q0;
    *(_OWORD *)&v7->_gainLowFrequency = _Q0;
    objc_storeWeak((id *)&v7->_engine, 0);
  }

  return v7;
}

- (PHASEGroup)initWithEngine:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PHASEGroup *)self initWithIdentifier:v7];
  v9 = v8;
  if (v8) {
    [(PHASEGroup *)v8 registerWithEngine:v6];
  }

  return v9;
}

- (void)registerWithEngine:(PHASEEngine *)engine
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v4 = engine;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);

  if (WeakRetained)
  {
    [MEMORY[0x263EFF940] raise:@"API Misuse" format:@"Trying to register a group with an invalid engine"];
  }
  else
  {
    id v6 = [(PHASEEngine *)v4 groups];
    id v7 = [v6 objectForKey:self->_identifier];

    if (v7)
    {
      [MEMORY[0x263EFF940] raise:@"API Misuse", @"Group %@ already exists", self->_identifier format];
    }
    else
    {
      id v8 = objc_loadWeakRetained((id *)&self->_engine);

      if (!v8)
      {
        objc_storeWeak((id *)&self->_engine, v4);
        uint64_t v9 = Phase::Controller::TaskManager::GetService<Phase::Controller::GroupManager>((Phase::Logger *)([(PHASEEngine *)v4 implementation] + 48), 10);
        v10 = self;
        uint64_t v11 = **(void **)(v9 + 8);
        unint64_t v18 = 0;
        BOOL v17 = 1;
        v12 = (void *)Phase::LockFreeQueueMPSC::GetWriteBuffer((atomic_uchar *)v11, 24, &v18, &v17);
        if (!v12)
        {
          Instance = (Phase::Logger *)Phase::Logger::GetInstance(0);
          Phase::Logger::DumpTailspinWithThrottleAsync(Instance, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
          objc_super v15 = **(id **)(v11 + 48);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v20 = "CommandQueue.hpp";
            __int16 v21 = 1024;
            int v22 = 100;
            _os_log_impl(&dword_221E5E000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; b"
              "uffer is full, unable to grow.\"",
              buf,
              0x12u);
          }
          exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
        }
        if (v17)
        {
          v13 = **(id **)(v11 + 48);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315906;
            v20 = "CommandQueue.hpp";
            __int16 v21 = 1024;
            int v22 = 89;
            __int16 v23 = 2048;
            unint64_t v24 = v18;
            __int16 v25 = 2048;
            uint64_t v26 = 24;
            _os_log_impl(&dword_221E5E000, v13, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
          }
        }
        void *v12 = &unk_26D478F68;
        v12[1] = v9;
        v12[2] = v10;
        Phase::LockFreeQueueSPSC::CommitBytes((atomic_uchar *)v11, 24);
        atomic_store(0, (unsigned __int8 *)(v11 + 40));
      }
      [(PHASEEngine *)v4 addGroup:self];
    }
  }
}

- (void)unregisterFromEngine
{
}

- (void)fadeGain:(double)gain duration:(double)duration curveType:(PHASECurveType)curveType
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  if (WeakRetained)
  {
    uint64_t v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    v13 = NSStringFromSelector(a2);
    double v14 = PHASEGetPropertyBounded<double>(v12, v13, gain, 0.0, 1.0);

    objc_super v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    BOOL v17 = NSStringFromSelector(a2);
    double v18 = PHASEGetPropertyBounded<double>(v16, v17, duration, 0.0, 1.79769313e308);

    uint64_t v19 = Phase::Controller::TaskManager::GetService<Phase::Controller::GroupManager>((Phase::Logger *)([WeakRetained implementation] + 48), 10);
    unint64_t hashId = self->_hashId;
    uint64_t v21 = **(void **)(v19 + 8);
    unint64_t v28 = 0;
    BOOL v27 = 1;
    int v22 = (double *)Phase::LockFreeQueueMPSC::GetWriteBuffer((atomic_uchar *)v21, 48, &v28, &v27);
    if (!v22)
    {
      Instance = (Phase::Logger *)Phase::Logger::GetInstance(0);
      Phase::Logger::DumpTailspinWithThrottleAsync(Instance, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
      __int16 v25 = **(id **)(v21 + 48);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v30 = "CommandQueue.hpp";
        __int16 v31 = 1024;
        int v32 = 100;
        _os_log_impl(&dword_221E5E000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffe"
          "r is full, unable to grow.\"",
          buf,
          0x12u);
      }
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    }
    if (v27)
    {
      __int16 v23 = **(id **)(v21 + 48);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315906;
        v30 = "CommandQueue.hpp";
        __int16 v31 = 1024;
        int v32 = 89;
        __int16 v33 = 2048;
        unint64_t v34 = v28;
        __int16 v35 = 2048;
        uint64_t v36 = 48;
        _os_log_impl(&dword_221E5E000, v23, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
      }
    }
    *(void *)int v22 = &unk_26D478FB8;
    *((void *)v22 + 1) = v19;
    *((void *)v22 + 2) = hashId;
    v22[3] = v14;
    v22[4] = v18;
    *((void *)v22 + 5) = curveType;
    Phase::LockFreeQueueSPSC::CommitBytes((atomic_uchar *)v21, 48);
    atomic_store(0, (unsigned __int8 *)(v21 + 40));
    self->_gain = v14;
  }
}

- (void)fadeGainHighFrequency:(double)a3 duration:(double)a4 curveType:(int64_t)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  if (WeakRetained)
  {
    uint64_t v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    v13 = NSStringFromSelector(a2);
    double v14 = PHASEGetPropertyBounded<double>(v12, v13, a3, 0.0, 1.0);

    objc_super v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    BOOL v17 = NSStringFromSelector(a2);
    double v18 = PHASEGetPropertyBounded<double>(v16, v17, a4, 0.0, 1.79769313e308);

    uint64_t v19 = Phase::Controller::TaskManager::GetService<Phase::Controller::GroupManager>((Phase::Logger *)([WeakRetained implementation] + 48), 10);
    unint64_t hashId = self->_hashId;
    uint64_t v21 = **(void **)(v19 + 8);
    unint64_t v28 = 0;
    BOOL v27 = 1;
    int v22 = (double *)Phase::LockFreeQueueMPSC::GetWriteBuffer((atomic_uchar *)v21, 48, &v28, &v27);
    if (!v22)
    {
      Instance = (Phase::Logger *)Phase::Logger::GetInstance(0);
      Phase::Logger::DumpTailspinWithThrottleAsync(Instance, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
      __int16 v25 = **(id **)(v21 + 48);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v30 = "CommandQueue.hpp";
        __int16 v31 = 1024;
        int v32 = 100;
        _os_log_impl(&dword_221E5E000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffe"
          "r is full, unable to grow.\"",
          buf,
          0x12u);
      }
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    }
    if (v27)
    {
      __int16 v23 = **(id **)(v21 + 48);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315906;
        v30 = "CommandQueue.hpp";
        __int16 v31 = 1024;
        int v32 = 89;
        __int16 v33 = 2048;
        unint64_t v34 = v28;
        __int16 v35 = 2048;
        uint64_t v36 = 48;
        _os_log_impl(&dword_221E5E000, v23, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
      }
    }
    *(void *)int v22 = &unk_26D478FE0;
    *((void *)v22 + 1) = v19;
    *((void *)v22 + 2) = hashId;
    v22[3] = v14;
    v22[4] = v18;
    *((void *)v22 + 5) = a5;
    Phase::LockFreeQueueSPSC::CommitBytes((atomic_uchar *)v21, 48);
    atomic_store(0, (unsigned __int8 *)(v21 + 40));
    self->_gainHighFrequency = v14;
  }
}

- (void)fadeGainLowFrequency:(double)a3 duration:(double)a4 curveType:(int64_t)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  if (WeakRetained)
  {
    uint64_t v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    v13 = NSStringFromSelector(a2);
    double v14 = PHASEGetPropertyBounded<double>(v12, v13, a3, 0.0, 1.0);

    objc_super v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    BOOL v17 = NSStringFromSelector(a2);
    double v18 = PHASEGetPropertyBounded<double>(v16, v17, a4, 0.0, 1.79769313e308);

    uint64_t v19 = Phase::Controller::TaskManager::GetService<Phase::Controller::GroupManager>((Phase::Logger *)([WeakRetained implementation] + 48), 10);
    unint64_t hashId = self->_hashId;
    uint64_t v21 = **(void **)(v19 + 8);
    unint64_t v28 = 0;
    BOOL v27 = 1;
    int v22 = (double *)Phase::LockFreeQueueMPSC::GetWriteBuffer((atomic_uchar *)v21, 48, &v28, &v27);
    if (!v22)
    {
      Instance = (Phase::Logger *)Phase::Logger::GetInstance(0);
      Phase::Logger::DumpTailspinWithThrottleAsync(Instance, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
      __int16 v25 = **(id **)(v21 + 48);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v30 = "CommandQueue.hpp";
        __int16 v31 = 1024;
        int v32 = 100;
        _os_log_impl(&dword_221E5E000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffe"
          "r is full, unable to grow.\"",
          buf,
          0x12u);
      }
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    }
    if (v27)
    {
      __int16 v23 = **(id **)(v21 + 48);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315906;
        v30 = "CommandQueue.hpp";
        __int16 v31 = 1024;
        int v32 = 89;
        __int16 v33 = 2048;
        unint64_t v34 = v28;
        __int16 v35 = 2048;
        uint64_t v36 = 48;
        _os_log_impl(&dword_221E5E000, v23, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
      }
    }
    *(void *)int v22 = &unk_26D479008;
    *((void *)v22 + 1) = v19;
    *((void *)v22 + 2) = hashId;
    v22[3] = v14;
    v22[4] = v18;
    *((void *)v22 + 5) = a5;
    Phase::LockFreeQueueSPSC::CommitBytes((atomic_uchar *)v21, 48);
    atomic_store(0, (unsigned __int8 *)(v21 + 40));
    self->_gainLowFrequency = v14;
  }
}

- (void)fadeRate:(double)rate duration:(double)duration curveType:(PHASECurveType)curveType
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  if (WeakRetained)
  {
    uint64_t v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    v13 = NSStringFromSelector(a2);
    double v14 = PHASEGetPropertyBounded<double>(v12, v13, rate, 0.25, 4.0);

    objc_super v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    BOOL v17 = NSStringFromSelector(a2);
    double v18 = PHASEGetPropertyBounded<double>(v16, v17, duration, 0.0, 1.79769313e308);

    uint64_t v19 = Phase::Controller::TaskManager::GetService<Phase::Controller::GroupManager>((Phase::Logger *)([WeakRetained implementation] + 48), 10);
    unint64_t hashId = self->_hashId;
    uint64_t v21 = **(void **)(v19 + 8);
    unint64_t v28 = 0;
    BOOL v27 = 1;
    int v22 = (double *)Phase::LockFreeQueueMPSC::GetWriteBuffer((atomic_uchar *)v21, 48, &v28, &v27);
    if (!v22)
    {
      Instance = (Phase::Logger *)Phase::Logger::GetInstance(0);
      Phase::Logger::DumpTailspinWithThrottleAsync(Instance, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
      __int16 v25 = **(id **)(v21 + 48);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v30 = "CommandQueue.hpp";
        __int16 v31 = 1024;
        int v32 = 100;
        _os_log_impl(&dword_221E5E000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffe"
          "r is full, unable to grow.\"",
          buf,
          0x12u);
      }
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    }
    if (v27)
    {
      __int16 v23 = **(id **)(v21 + 48);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315906;
        v30 = "CommandQueue.hpp";
        __int16 v31 = 1024;
        int v32 = 89;
        __int16 v33 = 2048;
        unint64_t v34 = v28;
        __int16 v35 = 2048;
        uint64_t v36 = 48;
        _os_log_impl(&dword_221E5E000, v23, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
      }
    }
    *(void *)int v22 = &unk_26D479030;
    *((void *)v22 + 1) = v19;
    *((void *)v22 + 2) = hashId;
    v22[3] = v14;
    v22[4] = v18;
    *((void *)v22 + 5) = curveType;
    Phase::LockFreeQueueSPSC::CommitBytes((atomic_uchar *)v21, 48);
    atomic_store(0, (unsigned __int8 *)(v21 + 40));
    self->_rate = v14;
  }
}

- (void)mute
{
  uint64_t v1 = *(void *)(a1 + 8);
  unint64_t v3 = *(void *)(a1 + 16);
  result = std::__hash_table<std::__hash_value_type<unsigned long long,int>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,int>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,int>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,int>>>::find<unsigned long long>((void *)(v1 + 40), &v3);
  if (result) {
    *((unsigned char *)result + 448) = 1;
  }
  return result;
}

- (void)unmute
{
  uint64_t v1 = *(void *)(a1 + 8);
  unint64_t v3 = *(void *)(a1 + 16);
  result = std::__hash_table<std::__hash_value_type<unsigned long long,int>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,int>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,int>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,int>>>::find<unsigned long long>((void *)(v1 + 40), &v3);
  if (result) {
    *((unsigned char *)result + 448) = 0;
  }
  return result;
}

- (void)solo
{
  uint64_t v1 = *(void *)(a1 + 8);
  unint64_t v3 = *(void *)(a1 + 16);
  result = std::__hash_table<std::__hash_value_type<unsigned long long,int>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,int>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,int>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,int>>>::find<unsigned long long>((void *)(v1 + 40), &v3);
  if (result) {
    *((unsigned char *)result + 449) = 1;
  }
  return result;
}

- (void)unsolo
{
  uint64_t v1 = *(void *)(a1 + 8);
  unint64_t v3 = *(void *)(a1 + 16);
  result = std::__hash_table<std::__hash_value_type<unsigned long long,int>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,int>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,int>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,int>>>::find<unsigned long long>((void *)(v1 + 40), &v3);
  if (result) {
    *((unsigned char *)result + 449) = 0;
  }
  return result;
}

- (double)gain
{
  return self->_gain;
}

- (double)gainHF
{
  return self->_gainHighFrequency;
}

- (double)gainLF
{
  return self->_gainLowFrequency;
}

- (double)rate
{
  return self->_rate;
}

- (void)setGain:(double)gain
{
}

- (void)setGainHighFrequency:(double)a3
{
}

- (void)setGainLowFrequency:(double)a3
{
}

- (void)setRate:(double)rate
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isMuted
{
  return self->_isMuted;
}

- (BOOL)isSoloed
{
  return self->_isSoloed;
}

- (double)gainHighFrequency
{
  return self->_gainHighFrequency;
}

- (double)gainLowFrequency
{
  return self->_gainLowFrequency;
}

- (PHASEEngine)engine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);

  return (PHASEEngine *)WeakRetained;
}

- (void)setEngine:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_engine);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (uint64_t)registerWithEngine:(uint64_t)a1
{
  return a1;
}

- (void)registerWithEngine:(uint64_t)a1
{
  JUMPOUT(0x223C938A0);
}

- (uint64_t)registerWithEngine:
{
  return Phase::Controller::GroupManager::AddGroup(*(Phase::Controller::GroupManager **)(a1 + 8), *(PHASEGroup **)(a1 + 16));
}

- (uint64_t)unregisterFromEngine
{
  uint64_t v1 = *(void *)(a1 + 8);
  unint64_t v3 = *(void *)(a1 + 16);
  return std::__hash_table<std::__hash_value_type<unsigned long long,Phase::Controller::Group>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Phase::Controller::Group>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Phase::Controller::Group>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,Phase::Controller::Group>>>::__erase_unique<unsigned long long>((void *)(v1 + 40), &v3);
}

- (void)fadeGain:duration:curveType:
{
  return Phase::Controller::GroupManager::SetGain(*(Phase::Controller::GroupManager **)(a1 + 8), *(void *)(a1 + 16), *(double *)(a1 + 24), *(double *)(a1 + 32), *(Phase::Logger **)(a1 + 40));
}

- (void)fadeGainHighFrequency:duration:curveType:
{
  return Phase::Controller::GroupManager::SetGainHighFreq(*(Phase::Controller::GroupManager **)(a1 + 8), *(void *)(a1 + 16), *(double *)(a1 + 24), *(double *)(a1 + 32), *(Phase::Logger **)(a1 + 40));
}

- (void)fadeGainLowFrequency:duration:curveType:
{
  return Phase::Controller::GroupManager::SetGainLowFreq(*(Phase::Controller::GroupManager **)(a1 + 8), *(void *)(a1 + 16), *(double *)(a1 + 24), *(double *)(a1 + 32), *(Phase::Logger **)(a1 + 40));
}

- (void)fadeRate:duration:curveType:
{
  return Phase::Controller::GroupManager::SetRate(*(Phase::Controller::GroupManager **)(a1 + 8), *(void *)(a1 + 16), *(double *)(a1 + 24), *(double *)(a1 + 32), *(Phase::Logger **)(a1 + 40));
}

@end