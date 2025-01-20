@interface PHASEPushStreamNode
- (id)scheduleBuffer:(id *)a1 atTime:options:completionCallbackType:completionHandler:;
- (uint64_t)scheduleBuffer:;
- (uint64_t)scheduleBuffer:(uint64_t)a1;
- (uint64_t)scheduleBuffer:(uint64_t)a1 atTime:options:;
- (uint64_t)scheduleBuffer:(uint64_t)a1 completionCallbackType:completionHandler:;
- (uint64_t)scheduleBuffer:atTime:options:;
- (uint64_t)scheduleBuffer:atTime:options:completionCallbackType:completionHandler:;
- (uint64_t)scheduleBuffer:completionCallbackType:completionHandler:;
- (void)scheduleBuffer:(AVAudioPCMBuffer *)buffer;
- (void)scheduleBuffer:(AVAudioPCMBuffer *)buffer atTime:(AVAudioTime *)when options:(PHASEPushStreamBufferOptions)options;
- (void)scheduleBuffer:(AVAudioPCMBuffer *)buffer atTime:(AVAudioTime *)when options:(PHASEPushStreamBufferOptions)options completionCallbackType:(PHASEPushStreamCompletionCallbackCondition)completionCallbackType completionHandler:(void *)completionHandler;
- (void)scheduleBuffer:(AVAudioPCMBuffer *)buffer completionCallbackType:(PHASEPushStreamCompletionCallbackCondition)completionCallbackType completionHandler:(void *)completionHandler;
- (void)scheduleBuffer:(id *)a1 atTime:options:completionCallbackType:completionHandler:;
- (void)scheduleBuffer:(uint64_t)a1;
- (void)scheduleBuffer:(uint64_t)a1 atTime:options:;
- (void)scheduleBuffer:(uint64_t)a1 completionCallbackType:completionHandler:;
@end

@implementation PHASEPushStreamNode

- (void)scheduleBuffer:(AVAudioPCMBuffer *)buffer
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v4 = buffer;
  v5 = [(PHASEStreamNode *)self engine];
  uint64_t v6 = Phase::Controller::TaskManager::GetService<Phase::ActionTreeManager>((Phase::Logger *)([v5 implementation] + 48), 7);

  uint64_t v7 = [(PHASEStreamNode *)self actionTreeUniqueId];
  uint64_t v9 = v8;
  unint64_t v10 = [(PHASEStreamNode *)self nodeUID];
  v11 = v4;
  uint64_t v12 = **(void **)(v6 + 8);
  unint64_t v19 = 0;
  BOOL v18 = 1;
  v13 = (void *)Phase::LockFreeQueueMPSC::GetWriteBuffer((atomic_uchar *)v12, 48, &v19, &v18);
  if (!v13)
  {
    Instance = (Phase::Logger *)Phase::Logger::GetInstance(0);
    Phase::Logger::DumpTailspinWithThrottleAsync(Instance, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    v16 = **(id **)(v12 + 48);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "CommandQueue.hpp";
      __int16 v22 = 1024;
      int v23 = 100;
      _os_log_impl(&dword_221E5E000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffer "
        "is full, unable to grow.\"",
        buf,
        0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
  }
  if (v18)
  {
    v14 = **(id **)(v12 + 48);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v21 = "CommandQueue.hpp";
      __int16 v22 = 1024;
      int v23 = 89;
      __int16 v24 = 2048;
      unint64_t v25 = v19;
      __int16 v26 = 2048;
      uint64_t v27 = 48;
      _os_log_impl(&dword_221E5E000, v14, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
    }
  }
  void *v13 = &unk_26D4794D8;
  v13[1] = v6;
  v13[2] = v7;
  v13[3] = v9;
  v13[4] = v10;
  v13[5] = v11;
  Phase::LockFreeQueueSPSC::CommitBytes((atomic_uchar *)v12, 48);
  atomic_store(0, (unsigned __int8 *)(v12 + 40));
}

- (void)scheduleBuffer:(AVAudioPCMBuffer *)buffer completionCallbackType:(PHASEPushStreamCompletionCallbackCondition)completionCallbackType completionHandler:(void *)completionHandler
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v8 = buffer;
  int v23 = completionHandler;
  uint64_t v9 = [(PHASEStreamNode *)self engine];
  uint64_t v10 = Phase::Controller::TaskManager::GetService<Phase::ActionTreeManager>((Phase::Logger *)([v9 implementation] + 48), 7);

  uint64_t v11 = [(PHASEStreamNode *)self actionTreeUniqueId];
  uint64_t v13 = v12;
  unint64_t v14 = [(PHASEStreamNode *)self nodeUID];
  v15 = v8;
  v16 = _Block_copy(v23);
  uint64_t v17 = **(void **)(v10 + 8);
  unint64_t v25 = 0;
  BOOL v24 = 1;
  BOOL v18 = (void *)Phase::LockFreeQueueMPSC::GetWriteBuffer((atomic_uchar *)v17, 64, &v25, &v24);
  if (!v18)
  {
    Instance = (Phase::Logger *)Phase::Logger::GetInstance(0);
    Phase::Logger::DumpTailspinWithThrottleAsync(Instance, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    v21 = **(id **)(v17 + 48);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v27 = "CommandQueue.hpp";
      __int16 v28 = 1024;
      int v29 = 100;
      _os_log_impl(&dword_221E5E000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffer "
        "is full, unable to grow.\"",
        buf,
        0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
  }
  if (v24)
  {
    unint64_t v19 = **(id **)(v17 + 48);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v27 = "CommandQueue.hpp";
      __int16 v28 = 1024;
      int v29 = 89;
      __int16 v30 = 2048;
      unint64_t v31 = v25;
      __int16 v32 = 2048;
      uint64_t v33 = 64;
      _os_log_impl(&dword_221E5E000, v19, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
    }
  }
  *BOOL v18 = &unk_26D479500;
  v18[1] = v10;
  v18[2] = v11;
  v18[3] = v13;
  v18[4] = v14;
  v18[5] = v15;
  v18[6] = completionCallbackType;
  v18[7] = v16;
  Phase::LockFreeQueueSPSC::CommitBytes((atomic_uchar *)v17, 64);
  atomic_store(0, (unsigned __int8 *)(v17 + 40));
}

- (void)scheduleBuffer:(AVAudioPCMBuffer *)buffer atTime:(AVAudioTime *)when options:(PHASEPushStreamBufferOptions)options
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v8 = buffer;
  uint64_t v9 = when;
  uint64_t v10 = [(PHASEStreamNode *)self engine];
  uint64_t v11 = Phase::Controller::TaskManager::GetService<Phase::ActionTreeManager>((Phase::Logger *)([v10 implementation] + 48), 7);

  uint64_t v12 = [(PHASEStreamNode *)self actionTreeUniqueId];
  uint64_t v14 = v13;
  unint64_t v15 = [(PHASEStreamNode *)self nodeUID];
  v16 = v8;
  uint64_t v17 = v9;
  uint64_t v18 = **(void **)(v11 + 8);
  unint64_t v25 = 0;
  BOOL v24 = 1;
  unint64_t v19 = (void *)Phase::LockFreeQueueMPSC::GetWriteBuffer((atomic_uchar *)v18, 64, &v25, &v24);
  if (!v19)
  {
    Instance = (Phase::Logger *)Phase::Logger::GetInstance(0);
    Phase::Logger::DumpTailspinWithThrottleAsync(Instance, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    __int16 v22 = **(id **)(v18 + 48);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v27 = "CommandQueue.hpp";
      __int16 v28 = 1024;
      int v29 = 100;
      _os_log_impl(&dword_221E5E000, v22, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffer "
        "is full, unable to grow.\"",
        buf,
        0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
  }
  if (v24)
  {
    v20 = **(id **)(v18 + 48);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v27 = "CommandQueue.hpp";
      __int16 v28 = 1024;
      int v29 = 89;
      __int16 v30 = 2048;
      unint64_t v31 = v25;
      __int16 v32 = 2048;
      uint64_t v33 = 64;
      _os_log_impl(&dword_221E5E000, v20, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
    }
  }
  *unint64_t v19 = &unk_26D479528;
  v19[1] = v11;
  v19[2] = v12;
  v19[3] = v14;
  v19[4] = v15;
  v19[5] = v16;
  v19[6] = v17;
  v19[7] = options;
  Phase::LockFreeQueueSPSC::CommitBytes((atomic_uchar *)v18, 64);
  atomic_store(0, (unsigned __int8 *)(v18 + 40));
}

- (void)scheduleBuffer:(AVAudioPCMBuffer *)buffer atTime:(AVAudioTime *)when options:(PHASEPushStreamBufferOptions)options completionCallbackType:(PHASEPushStreamCompletionCallbackCondition)completionCallbackType completionHandler:(void *)completionHandler
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v12 = buffer;
  uint64_t v13 = when;
  uint64_t v14 = completionHandler;
  unint64_t v15 = [(PHASEStreamNode *)self engine];
  uint64_t v16 = Phase::Controller::TaskManager::GetService<Phase::ActionTreeManager>((Phase::Logger *)([v15 implementation] + 48), 7);

  *(void *)&long long v27 = v16;
  *((void *)&v27 + 1) = [(PHASEStreamNode *)self actionTreeUniqueId];
  *(void *)&long long v28 = v17;
  *((void *)&v28 + 1) = [(PHASEStreamNode *)self nodeUID];
  uint64_t v18 = v12;
  unint64_t v19 = v13;
  *(void *)&long long v29 = options;
  *((void *)&v29 + 1) = completionCallbackType;
  v20 = _Block_copy(v14);
  uint64_t v21 = **(void **)(v16 + 8);
  unint64_t v31 = 0;
  BOOL v30 = 1;
  uint64_t v22 = Phase::LockFreeQueueMPSC::GetWriteBuffer((atomic_uchar *)v21, 80, &v31, &v30);
  if (!v22)
  {
    Instance = (Phase::Logger *)Phase::Logger::GetInstance(0);
    Phase::Logger::DumpTailspinWithThrottleAsync(Instance, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    unint64_t v25 = **(id **)(v21 + 48);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v33 = "CommandQueue.hpp";
      __int16 v34 = 1024;
      int v35 = 100;
      _os_log_impl(&dword_221E5E000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffer "
        "is full, unable to grow.\"",
        buf,
        0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
  }
  if (v30)
  {
    int v23 = **(id **)(v21 + 48);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v33 = "CommandQueue.hpp";
      __int16 v34 = 1024;
      int v35 = 89;
      __int16 v36 = 2048;
      unint64_t v37 = v31;
      __int16 v38 = 2048;
      uint64_t v39 = 80;
      _os_log_impl(&dword_221E5E000, v23, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
    }
  }
  *(void *)uint64_t v22 = &unk_26D479550;
  *(_OWORD *)(v22 + 24) = v28;
  *(_OWORD *)(v22 + 8) = v27;
  *(void *)(v22 + 40) = v18;
  *(void *)(v22 + 48) = v19;
  *(_OWORD *)(v22 + 56) = v29;
  *(void *)(v22 + 72) = v20;
  Phase::LockFreeQueueSPSC::CommitBytes((atomic_uchar *)v21, 80);
  atomic_store(0, (unsigned __int8 *)(v21 + 40));
}

- (id)scheduleBuffer:(id *)a1 atTime:options:completionCallbackType:completionHandler:
{
  return a1;
}

- (uint64_t)scheduleBuffer:(uint64_t)a1
{
  return a1;
}

- (void)scheduleBuffer:(uint64_t)a1
{
  JUMPOUT(0x223C938A0);
}

- (uint64_t)scheduleBuffer:
{
  return Phase::ActionTreeManager::ScheduleBuffer(*(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void **)(a1 + 40), 0, 1uLL, 0, 0);
}

- (uint64_t)scheduleBuffer:(uint64_t)a1 completionCallbackType:completionHandler:
{
  return a1;
}

- (void)scheduleBuffer:(uint64_t)a1 completionCallbackType:completionHandler:
{
  JUMPOUT(0x223C938A0);
}

- (uint64_t)scheduleBuffer:completionCallbackType:completionHandler:
{
  return Phase::ActionTreeManager::ScheduleBuffer(*(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void **)(a1 + 40), 0, 1uLL, *(void *)(a1 + 48), *(void **)(a1 + 56));
}

- (uint64_t)scheduleBuffer:(uint64_t)a1 atTime:options:
{
  return a1;
}

- (void)scheduleBuffer:(uint64_t)a1 atTime:options:
{
  JUMPOUT(0x223C938A0);
}

- (uint64_t)scheduleBuffer:atTime:options:
{
  return Phase::ActionTreeManager::ScheduleBuffer(*(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void *)(a1 + 56), 0, 0);
}

- (void)scheduleBuffer:(id *)a1 atTime:options:completionCallbackType:completionHandler:
{
  JUMPOUT(0x223C938A0);
}

- (uint64_t)scheduleBuffer:atTime:options:completionCallbackType:completionHandler:
{
  return Phase::ActionTreeManager::ScheduleBuffer(*(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void **)(a1 + 72));
}

@end