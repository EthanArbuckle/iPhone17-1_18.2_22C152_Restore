@interface DTSamplingService
+ (void)registerCapabilities:(id)a3;
- (DTSamplingService)initWithChannel:(id)a3;
- (void)_allocateBuffer;
- (void)_outputData;
- (void)addSampleWithTimeInfo:(__CFDictionary *)a3 useZeroDelta:(BOOL)a4;
- (void)collectData;
- (void)dealloc;
- (void)setOutputRate:(id)a3;
- (void)setSamplingRate:(id)a3;
- (void)setTargetPid:(id)a3;
- (void)startSampling;
- (void)stopSampling;
@end

@implementation DTSamplingService

+ (void)registerCapabilities:(id)a3
{
  id v4 = a3;
  [v4 publishCapability:@"com.apple.instruments.server.services.sampling" withVersion:11 forClass:a1];
  [v4 publishCapability:@"com.apple.instruments.server.services.sampling.immediate" withVersion:1 forClass:a1];
  [v4 publishCapability:@"com.apple.instruments.server.services.sampling.deferred" withVersion:1 forClass:a1];
  [v4 publishCapability:@"com.apple.instruments.server.services.coresampling" withVersion:10 forClass:a1];
}

- (DTSamplingService)initWithChannel:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DTSamplingService;
  result = [(DTXService *)&v4 initWithChannel:a3];
  if (result)
  {
    result->_samplingRate = 100000;
    result->_outputRate = 200000;
  }
  return result;
}

- (void)dealloc
{
  backtraceBuffer = self->_backtraceBuffer;
  if (backtraceBuffer)
  {
    free(backtraceBuffer);
    self->_backtraceBuffer = 0;
  }
  if (self->_context)
  {
    destroy_sampling_context();
    self->_context = 0;
  }
  mach_port_name_t task = self->_task;
  if (task + 1 >= 2) {
    mach_port_deallocate(*MEMORY[0x263EF8960], task);
  }
  v5.receiver = self;
  v5.super_class = (Class)DTSamplingService;
  [(DTSamplingService *)&v5 dealloc];
}

- (void)setSamplingRate:(id)a3
{
  self->_samplingRate = [a3 unsignedLongLongValue];
}

- (void)setOutputRate:(id)a3
{
  unint64_t v4 = [a3 unsignedLongLongValue];
  self->_outputRate = v4;
  unint64_t samplingRate = self->_samplingRate;
  if (v4 > samplingRate) {
    unint64_t samplingRate = v4;
  }
  self->_outputRate = samplingRate;
}

- (void)setTargetPid:(id)a3
{
  uint64_t v4 = [a3 intValue];
  unsigned int v5 = +[DTInstrumentServer taskForPid:v4];
  self->_mach_port_name_t task = v5;
  if (v5 + 1 <= 1) {
    [MEMORY[0x263EFF940] raise:@"DTSamplingServiceException" format:@"Failed to get task for pid %d", v4];
  }
}

- (void)startSampling
{
  self->_doCollectData = 1;
  self->_context = (sampling_context_t *)create_sampling_context_for_task();
  uint64_t v2 = MEMORY[0x263F08B88];
  MEMORY[0x270F9A6D0](v2, sel_detachNewThreadSelector_toTarget_withObject_);
}

- (void)stopSampling
{
  self->_doCollectData = 0;
}

- (void)_outputData
{
  id v4 = [(DTXService *)self channel];
  v3 = [MEMORY[0x263F38CA0] messageWithBuffer:self->_backtraceBuffer length:8 * self->_backtraceBufferUsedSize];
  [v4 sendMessage:v3 replyHandler:0];
}

- (void)_allocateBuffer
{
  self->_backtraceBufferSize = 1368576;
  v3 = (unint64_t *)malloc_type_malloc(0x14E200uLL, 0x96D52FEDuLL);
  self->_backtraceBuffer = v3;
  unint64_t *v3 = 0;
  self->_backtraceBufferUsedSize = 1;
}

- (void)collectData
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
  if (Mutable)
  {
    CFDictionaryRef v4 = Mutable;
    backtraceBuffer = self->_backtraceBuffer;
    if (backtraceBuffer)
    {
      free(backtraceBuffer);
      self->_backtraceBuffer = 0;
    }
    uint64_t v6 = [(DTSamplingService *)self _allocateBuffer];
    if (self->_doCollectData)
    {
      char v7 = 1;
      do
      {
        v8 = (void *)MEMORY[0x230FC2180](v6);
        [(DTSamplingService *)self addSampleWithTimeInfo:v4 useZeroDelta:v7 & 1];
        unint64_t outputRateDelta = self->_outputRateDelta;
        if (outputRateDelta >= self->_outputRate)
        {
          [(DTSamplingService *)self _outputData];
          self->_unint64_t outputRateDelta = 0;
          [(DTSamplingService *)self _allocateBuffer];
        }
        else
        {
          self->_unint64_t outputRateDelta = self->_samplingRate + outputRateDelta;
        }
        usleep(self->_samplingRate);
        char v7 = 0;
      }
      while (self->_doCollectData);
    }
    v10 = self->_backtraceBuffer;
    if (v10)
    {
      free(v10);
      self->_backtraceBuffer = 0;
    }
    if (self->_context)
    {
      destroy_sampling_context();
      self->_context = 0;
    }
    CFDictionaryApplyFunction(v4, (CFDictionaryApplierFunction)sub_23089060C, 0);
    CFRelease(v4);
  }
}

- (void)addSampleWithTimeInfo:(__CFDictionary *)a3 useZeroDelta:(BOOL)a4
{
  act_list[513] = *(thread_act_array_t *)MEMORY[0x263EF8340];
  act_list[0] = 0;
  mach_msg_type_number_t act_listCnt = 0;
  if (!task_threads(self->_task, act_list, &act_listCnt))
  {
    unint64_t backtraceBufferSize = self->_backtraceBufferSize;
    if (self->_backtraceBufferUsedSize + 1568 >= backtraceBufferSize)
    {
      char v7 = (unint64_t *)malloc_type_realloc(self->_backtraceBuffer, 2 * backtraceBufferSize, 0x2ED17982uLL);
      if (v7)
      {
        v8 = v7;
        self->_unint64_t backtraceBufferSize = malloc_size(v7);
        self->_backtraceBuffer = v8;
      }
      else
      {
        [(DTSamplingService *)self _outputData];
        self->_unint64_t outputRateDelta = 0;
        [(DTSamplingService *)self _allocateBuffer];
      }
    }
    backtraceBuffer = self->_backtraceBuffer;
    ++*backtraceBuffer;
    unint64_t v10 = act_listCnt;
    unint64_t backtraceBufferUsedSize = self->_backtraceBufferUsedSize;
    self->_unint64_t backtraceBufferUsedSize = backtraceBufferUsedSize + 1;
    backtraceBuffer[backtraceBufferUsedSize] = v10;
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    v13 = self->_backtraceBuffer;
    unint64_t v14 = self->_backtraceBufferUsedSize;
    self->_unint64_t backtraceBufferUsedSize = v14 + 1;
    v13[v14] = (unint64_t)(v12 * 1000000.0);
    mach_msg_type_number_t thread_info_outCnt = 10;
    uint64_t v25 = 0;
    *(_OWORD *)thread_info_out = 0u;
    long long v24 = 0u;
    value = 0;
    if (act_listCnt)
    {
      for (unint64_t i = 0; i < act_listCnt; ++i)
      {
        v16 = (const void *)act_list[0][i];
        thread_info(act_list[0][i], 3u, thread_info_out, &thread_info_outCnt);
        if (CFDictionaryGetValueIfPresent(a3, v16, (const void **)&value))
        {
          mach_port_deallocate(*MEMORY[0x263EF8960], (mach_port_name_t)v16);
        }
        else
        {
          v17 = malloc_type_malloc(8uLL, 0x100004000313F17uLL);
          value = v17;
          void *v17 = 0;
          CFDictionarySetValue(a3, v16, v17);
        }
        *(void *)value = *(void *)thread_info_out;
        thread_suspend((thread_read_t)v16);
        sample_remote_thread();
        thread_resume((thread_read_t)v16);
        unint64_t v18 = self->_backtraceBufferUsedSize;
        v19 = &self->_backtraceBuffer[v18];
        unint64_t *v19 = 0;
        self->_unint64_t backtraceBufferUsedSize = v18 + 2;
        v19[1] = 0;
        unint64_t v20 = self->_backtraceBufferUsedSize;
        v21 = self->_backtraceBuffer;
        self->_unint64_t backtraceBufferUsedSize = v20 + 1;
        v21[v20] = (unint64_t)v16;
      }
    }
    sampling_context_clear_cache();
    if (act_listCnt) {
      mach_vm_deallocate(*MEMORY[0x263EF8960], (mach_vm_address_t)act_list[0], 4 * act_listCnt);
    }
  }
}

@end