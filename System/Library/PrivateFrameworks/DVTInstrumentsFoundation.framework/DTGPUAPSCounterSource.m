@interface DTGPUAPSCounterSource
- (BOOL)request:(unint64_t)a3 vendorFeatures:(id)a4;
- (DTGPUAPSConfig)apsConfig;
- (DTGPUAPSCounterSource)initWithSource:(id)a3 sourceGroup:(id)a4 selects:(id)a5 sourceIndex:(unsigned int)a6 profile:(unint64_t)a7;
- (GPURawCounterSource)source;
- (GPURawCounterSourceGroup)sourceGroup;
- (NSArray)selects;
- (id).cxx_construct;
- (unsigned)sourceIndex;
- (void)dealloc;
- (void)pullAndDrainCounters;
- (void)resume;
- (void)sampleAPS:(id)a3;
- (void)sampleCounters:(unint64_t)a3 callback:(id)a4;
- (void)stop;
@end

@implementation DTGPUAPSCounterSource

- (DTGPUAPSCounterSource)initWithSource:(id)a3 sourceGroup:(id)a4 selects:(id)a5 sourceIndex:(unsigned int)a6 profile:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v21.receiver = self;
  v21.super_class = (Class)DTGPUAPSCounterSource;
  v16 = [(DTGPUAPSCounterSource *)&v21 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_source, a3);
    objc_storeStrong((id *)&v17->_sourceGroup, a4);
    objc_storeStrong((id *)&v17->_selects, a5);
    v17->_sourceIndex = a6;
    v18 = objc_alloc_init(DTGPUAPSConfig);
    apsConfig = v17->_apsConfig;
    v17->_apsConfig = v18;

    v17->_profile = a7;
  }

  return v17;
}

- (void)dealloc
{
  [(DTGPUAPSCounterSource *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)DTGPUAPSCounterSource;
  [(DTGPUAPSCounterSource *)&v3 dealloc];
}

- (BOOL)request:(unint64_t)a3 vendorFeatures:(id)a4
{
  v32[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  if (self->_source && self->_sourceGroup)
  {
    v6 = [MEMORY[0x263EFF980] arrayWithArray:self->_selects];
    v7 = [v5 objectForKeyedSubscript:@"ShaderProfiler"];
    int v8 = [v7 BOOLValue];

    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        uint64_t v9 = 2;
        _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "Enabled Clique Tracing", buf, 2u);
      }
      else
      {
        uint64_t v9 = 2;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
    [(DTGPUAPSConfig *)self->_apsConfig setCliqueTraceLevel:v9];
    [(DTGPUAPSConfig *)self->_apsConfig setNRingBuffers:[(GPURawCounterSource *)self->_source ringBufferNum]];
    v11 = [v5 objectForKeyedSubscript:@"APSConfig"];
    [(DTGPUAPSConfig *)self->_apsConfig readConfig:v11];
    if (self->_profile == 14) {
      [(DTGPUAPSConfig *)self->_apsConfig setCountPeriod:4096];
    }
    v12 = (void *)MEMORY[0x263F3F8F0];
    id v13 = [(DTGPUAPSConfig *)self->_apsConfig grcTrigger];
    id v14 = [v12 selectWithName:@"KickAndStateTracing" options:v13];
    v32[0] = v14;
    id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:1];

    if ([(GPURawCounterSource *)self->_source requestTriggers:v15 firstErrorIndex:0] & 1) != 0&& ([(DTGPUAPSConfig *)self->_apsConfig grcOptions], v16 = objc_claimAutoreleasedReturnValue(), [(GPURawCounterSource *)self->_source setOptions:v16], v16, *(void *)buf = 0, ([(GPURawCounterSource *)self->_source requestCounters:v6 firstErrorIndex:buf])&& [(GPURawCounterSource *)self->_source setEnabled:1])
    {
      sub_2308E3718((uint64_t *)&self->_counterBuffers, [(GPURawCounterSource *)self->_source ringBufferNum]);
      v17 = (NSLock *)objc_opt_new();
      pullLock = self->_pullLock;
      self->_pullLock = v17;

      objc_initWeak(&location, self);
      v19 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.gpu.rawcounters.pull", 0);
      pullQueue = self->_pullQueue;
      self->_pullQueue = v19;

      dispatch_source_t v21 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_pullQueue);
      pullTimer = self->_pullTimer;
      p_pullTimer = &self->_pullTimer;
      *p_pullTimer = (OS_dispatch_source *)v21;

      v24 = *p_pullTimer;
      dispatch_time_t v25 = dispatch_time(0, 50000000);
      dispatch_source_set_timer(v24, v25, 0x2FAF080uLL, 0x2FAF080uLL);
      v26 = *p_pullTimer;
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = sub_230908BE0;
      v28[3] = &unk_264B8F560;
      objc_copyWeak(&v29, &location);
      dispatch_source_set_event_handler(v26, v28);
      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
      BOOL v10 = 1;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)resume
{
}

- (void)stop
{
  [(NSLock *)self->_pullLock lock];
  pullTimer = self->_pullTimer;
  if (pullTimer)
  {
    dispatch_source_cancel(pullTimer);
    v4 = self->_pullTimer;
    self->_pullTimer = 0;

    pullQueue = self->_pullQueue;
    self->_pullQueue = 0;
  }
  [(NSLock *)self->_pullLock unlock];
  [(DTGPUAPSCounterSource *)self pullAndDrainCounters];
  [(GPURawCounterSource *)self->_source setEnabled:0];
  pullLock = self->_pullLock;
  self->_pullLock = 0;
}

- (void)pullAndDrainCounters
{
  if (self->_pullQueue
    && self->_pullTimer
    && [(GPURawCounterSource *)self->_source ringBufferNum])
  {
    uint64_t v3 = 0;
    for (unint64_t i = 0; i < [(GPURawCounterSource *)self->_source ringBufferNum]; ++i)
    {
      __src = 0;
      memset(v12, 0, sizeof(v12));
      if ([(GPURawCounterSource *)self->_source ringBufferInfoAtIndex:i base:&__src size:&v12[2] dataOffset:&v12[1] dataSize:v12]&& 0xAAAAAAAAAAAAAAABLL * (((char *)self->_counterBuffers.__end_ - (char *)self->_counterBuffers.__begin_) >> 3) > i)
      {
        [(NSLock *)self->_pullLock lock];
        begin = (char *)self->_counterBuffers.__begin_;
        if (0xAAAAAAAAAAAAAAABLL * (((char *)self->_counterBuffers.__end_ - (char *)begin) >> 3) <= i)
        {
          __break(1u);
          return;
        }
        unsigned int v6 = v12[0];
        if (v12[0])
        {
          v7 = (unint64_t *)&begin[v3];
          unint64_t v8 = *(void *)&begin[v3 + 8] - *(void *)&begin[v3];
          if (v8 >= v8 + v12[0])
          {
            if (v8 > v8 + v12[0]) {
              v7[1] += v12[0];
            }
          }
          else
          {
            sub_2308E552C(v7, v12[0]);
            unsigned int v6 = v12[0];
          }
          uint64_t v9 = (void *)(*v7 + v8);
          if (v6 + v12[1] >= v12[2])
          {
            memcpy(v9, (char *)__src + v12[1], (v12[2] - v12[1]));
            uint64_t v9 = (void *)(*v7 + (v12[2] - v12[1]) + v8);
            v11 = (char *)__src;
            size_t v10 = (v12[1] - v12[2] + v12[0]);
          }
          else
          {
            size_t v10 = v6;
            v11 = (char *)__src + v12[1];
          }
          memcpy(v9, v11, v10);
        }
        [(GPURawCounterSource *)self->_source drainRingBufferAtIndex:i dataSize:v12[0]];
        [(NSLock *)self->_pullLock unlock];
      }
      v3 += 24;
    }
  }
}

- (void)sampleCounters:(unint64_t)a3 callback:(id)a4
{
  id v5 = (void (**)(void))a4;
  [(NSLock *)self->_pullLock lock];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  sub_2308E5668(&v10, (uint64_t)self->_counterBuffers.__begin_, (uint64_t)self->_counterBuffers.__end_, 0xAAAAAAAAAAAAAAABLL * (((char *)self->_counterBuffers.__end_ - (char *)self->_counterBuffers.__begin_) >> 3));
  begin = self->_counterBuffers.__begin_;
  end = self->_counterBuffers.__end_;
  while (begin != end)
  {
    begin[1] = *begin;
    begin += 3;
  }
  [(NSLock *)self->_pullLock unlock];
  uint64_t v8 = 0;
  for (unint64_t i = 0; ; ++i)
  {
    if (i >= [(GPURawCounterSource *)self->_source ringBufferNum])
    {
      id v13 = (void **)&v10;
      sub_2308E58F8(&v13);

      return;
    }
    if (0xAAAAAAAAAAAAAAABLL * ((v11 - v10) >> 3) <= i) {
      break;
    }
    v5[2](v5);
    v8 += 24;
  }
  __break(1u);
}

- (void)sampleAPS:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_pullLock lock];
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  sub_2308E5668(&v9, (uint64_t)self->_counterBuffers.__begin_, (uint64_t)self->_counterBuffers.__end_, 0xAAAAAAAAAAAAAAABLL * (((char *)self->_counterBuffers.__end_ - (char *)self->_counterBuffers.__begin_) >> 3));
  begin = self->_counterBuffers.__begin_;
  end = self->_counterBuffers.__end_;
  while (begin != end)
  {
    begin[1] = *begin;
    begin += 3;
  }
  [(NSLock *)self->_pullLock unlock];
  uint64_t v7 = 0;
  for (unint64_t i = 0; ; ++i)
  {
    if (i >= [(GPURawCounterSource *)self->_source ringBufferNum])
    {
      uint64_t v12 = (void **)&v9;
      sub_2308E58F8(&v12);

      return;
    }
    if (0xAAAAAAAAAAAAAAABLL * ((v10 - v9) >> 3) <= i) {
      break;
    }
    (*((void (**)(id, void, void, uint64_t, unint64_t, void))v4 + 2))(v4, *(void *)(v9 + v7), *(void *)(v9 + v7 + 8) - *(void *)(v9 + v7), 2, i, self->_sourceIndex);
    v7 += 24;
  }
  __break(1u);
}

- (DTGPUAPSConfig)apsConfig
{
  return self->_apsConfig;
}

- (GPURawCounterSource)source
{
  return self->_source;
}

- (GPURawCounterSourceGroup)sourceGroup
{
  return self->_sourceGroup;
}

- (unsigned)sourceIndex
{
  return self->_sourceIndex;
}

- (NSArray)selects
{
  return self->_selects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selects, 0);
  objc_storeStrong((id *)&self->_sourceGroup, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_apsConfig, 0);
  p_counterBuffers = &self->_counterBuffers;
  sub_2308E58F8((void ***)&p_counterBuffers);
  objc_storeStrong((id *)&self->_pullLock, 0);
  objc_storeStrong((id *)&self->_pullTimer, 0);
  objc_storeStrong((id *)&self->_pullQueue, 0);
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  return self;
}

@end