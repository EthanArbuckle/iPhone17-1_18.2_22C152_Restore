@interface DTGPUAGXCounterSource
- (BOOL)request:(unint64_t)a3 vendorFeatures:(id)a4;
- (DTGPUAGXCounterSource)initWithSource:(id)a3 sourceGroup:(id)a4 selects:(id)a5 sourceIndex:(unsigned int)a6;
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

@implementation DTGPUAGXCounterSource

- (DTGPUAGXCounterSource)initWithSource:(id)a3 sourceGroup:(id)a4 selects:(id)a5 sourceIndex:(unsigned int)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)DTGPUAGXCounterSource;
  v14 = [(DTGPUAGXCounterSource *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_source, a3);
    objc_storeStrong((id *)&v15->_sourceGroup, a4);
    objc_storeStrong((id *)&v15->_selects, a5);
    v15->_sourceIndex = a6;
    pullTimer = v15->_pullTimer;
    v15->_pullTimer = 0;

    pullQueue = v15->_pullQueue;
    v15->_pullQueue = 0;
  }
  return v15;
}

- (void)dealloc
{
  [(DTGPUAGXCounterSource *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)DTGPUAGXCounterSource;
  [(DTGPUAGXCounterSource *)&v3 dealloc];
}

- (BOOL)request:(unint64_t)a3 vendorFeatures:(id)a4
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v48 = a4;
  if (self->_source && self->_sourceGroup)
  {
    v6 = [MEMORY[0x263EFF980] arrayWithArray:self->_selects];
    unint64_t v45 = a3;
    v46 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:&unk_26E534460];
    v7 = [(GPURawCounterSource *)self->_source name];
    val = self;
    if ([v7 hasPrefix:@"RDE"])
    {
      v8 = [v48 objectForKeyedSubscript:@"ShaderProfiler"];
      uint64_t v9 = [v8 unsignedIntegerValue];

      if (v9)
      {
        v10 = objc_opt_new();
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        id v11 = [(GPURawCounterSource *)self->_source availableCounters];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v58 objects:v68 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v59;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v59 != v13) {
                objc_enumerationMutation(v11);
              }
              v15 = *(void **)(*((void *)&v58 + 1) + 8 * i);
              v16 = [v15 name];
              BOOL v17 = [v16 rangeOfString:@"GRC_SHADER_PROFILER_DATA_"] == 0;

              if (v17)
              {
                v18 = [v15 name];
                [v10 addObject:v18];
              }
            }
            uint64_t v12 = [v11 countByEnumeratingWithState:&v58 objects:v68 count:16];
          }
          while (v12);
        }

        if ([v10 count])
        {
          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          id v19 = v10;
          uint64_t v20 = [v19 countByEnumeratingWithState:&v54 objects:v67 count:16];
          if (v20)
          {
            uint64_t v21 = *(void *)v55;
            do
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v55 != v21) {
                  objc_enumerationMutation(v19);
                }
                v23 = [MEMORY[0x263F3F8E8] selectWithName:*(void *)(*((void *)&v54 + 1) + 8 * j) options:&unk_26E534488];
                [v6 addObject:v23];
              }
              uint64_t v20 = [v19 countByEnumeratingWithState:&v54 objects:v67 count:16];
            }
            while (v20);
          }
        }
        else
        {
          [v46 setObject:&unk_26E534088 forKeyedSubscript:@"ShaderProfiler"];
        }

        self = val;
      }
    }
    else
    {
    }
    [(GPURawCounterSource *)self->_source setOptions:v46];
    v25 = [(GPURawCounterSource *)self->_source name];
    int v26 = [v25 containsString:@"BMPR"];

    if (v26)
    {
      v27 = (void *)MEMORY[0x263F3F8F0];
      v65 = @"Period";
      v28 = [NSNumber numberWithUnsignedLongLong:(unint64_t)((double)v45 / 125.0 * 3.0)];
      v66 = v28;
      v29 = [NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
      [v27 selectWithName:@"TimerNClock" options:v29];
    }
    else
    {
      v30 = (void *)MEMORY[0x263F3F8F0];
      v63 = @"Period";
      v28 = [NSNumber numberWithUnsignedLongLong:v45];
      v64 = v28;
      v29 = [NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];
      [v30 selectWithName:@"TimerFixed" options:v29];
    v31 = };

    source = val->_source;
    v62 = v31;
    v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v62 count:1];
    LOBYTE(source) = [(GPURawCounterSource *)source requestTriggers:v33 firstErrorIndex:0];

    if ((source & 1) != 0
      && (uint64_t v53 = 0,
          ([(GPURawCounterSource *)val->_source requestCounters:v6 firstErrorIndex:&v53] & 1) != 0)&& [(GPURawCounterSource *)val->_source setEnabled:1])
    {
      sub_2308E3718((uint64_t *)&val->_counterBuffers, [(GPURawCounterSource *)val->_source ringBufferNum]);
      uint64_t v34 = objc_opt_new();
      pullLock = val->_pullLock;
      val->_pullLock = (NSLock *)v34;

      sub_2308E5474(location, 0x2000000uLL);
      begin = val->_tmpOutBuffer.__begin_;
      if (begin)
      {
        val->_tmpOutBuffer.__end_ = begin;
        operator delete(begin);
        val->_tmpOutBuffer.__begin_ = 0;
        val->_tmpOutBuffer.__end_ = 0;
        val->_tmpOutBuffer.__end_cap_.__value_ = 0;
      }
      *(_OWORD *)&val->_tmpOutBuffer.__begin_ = *(_OWORD *)location;
      val->_tmpOutBuffer.__end_cap_.__value_ = v52;
      objc_initWeak(location, val);
      dispatch_queue_t v37 = dispatch_queue_create("com.apple.gpu.rawcounters.pull", 0);
      pullQueue = val->_pullQueue;
      val->_pullQueue = (OS_dispatch_queue *)v37;

      dispatch_source_t v39 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)val->_pullQueue);
      pullTimer = val->_pullTimer;
      val->_pullTimer = (OS_dispatch_source *)v39;

      v41 = val->_pullTimer;
      dispatch_time_t v42 = dispatch_time(0, 100000000);
      dispatch_source_set_timer(v41, v42, 0x5F5E100uLL, 0x5F5E100uLL);
      v43 = val->_pullTimer;
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = sub_2308E37C0;
      handler[3] = &unk_264B8F560;
      objc_copyWeak(&v50, location);
      dispatch_source_set_event_handler(v43, handler);
      objc_destroyWeak(&v50);
      objc_destroyWeak(location);
      BOOL v24 = 1;
    }
    else
    {
      BOOL v24 = 0;
    }
  }
  else
  {
    BOOL v24 = 0;
  }

  return v24;
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
  [(GPURawCounterSource *)self->_source setEnabled:0];
  pullLock = self->_pullLock;
  self->_pullLock = 0;
}

- (void)pullAndDrainCounters
{
  if ([(GPURawCounterSource *)self->_source ringBufferNum])
  {
    uint64_t v3 = 0;
    for (unint64_t i = 0; i < [(GPURawCounterSource *)self->_source ringBufferNum]; ++i)
    {
      __src = 0;
      memset(v14, 0, sizeof(v14));
      if ([(GPURawCounterSource *)self->_source ringBufferInfoAtIndex:i base:&__src size:&v14[2] dataOffset:&v14[1] dataSize:v14]&& 0xAAAAAAAAAAAAAAABLL * (((char *)self->_counterBuffers.__end_ - (char *)self->_counterBuffers.__begin_) >> 3) > i)
      {
        [(NSLock *)self->_pullLock lock];
        begin = (char *)self->_counterBuffers.__begin_;
        if (0xAAAAAAAAAAAAAAABLL * (((char *)self->_counterBuffers.__end_ - (char *)begin) >> 3) <= i)
        {
          __break(1u);
          return;
        }
        unsigned int v6 = v14[0];
        if (v14[0])
        {
          v7 = (unint64_t *)&begin[v3];
          uint64_t v8 = *(void *)&begin[v3];
          unint64_t v9 = v7[1] - v8;
          unint64_t v10 = v9 + v14[0];
          if (!(v10 >> 27))
          {
            if (v9 >= v10)
            {
              if (v9 > v10) {
                v7[1] = v8 + v10;
              }
            }
            else
            {
              sub_2308E552C(v7, v14[0]);
              unsigned int v6 = v14[0];
            }
            id v11 = (void *)(*v7 + v9);
            if (v6 + v14[1] >= v14[2])
            {
              memcpy(v11, (char *)__src + v14[1], (v14[2] - v14[1]));
              id v11 = (void *)(*v7 + (v14[2] - v14[1]) + v9);
              uint64_t v13 = (char *)__src;
              size_t v12 = (v14[1] - v14[2] + v14[0]);
            }
            else
            {
              size_t v12 = v6;
              uint64_t v13 = (char *)__src + v14[1];
            }
            memcpy(v11, v13, v12);
          }
        }
        [(GPURawCounterSource *)self->_source drainRingBufferAtIndex:i dataSize:v14[0]];
        [(NSLock *)self->_pullLock unlock];
      }
      v3 += 24;
    }
  }
}

- (void)sampleCounters:(unint64_t)a3 callback:(id)a4
{
  id v30 = a4;
  [(NSLock *)self->_pullLock lock];
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  sub_2308E5668(&v36, (uint64_t)self->_counterBuffers.__begin_, (uint64_t)self->_counterBuffers.__end_, 0xAAAAAAAAAAAAAAABLL * (((char *)self->_counterBuffers.__end_ - (char *)self->_counterBuffers.__begin_) >> 3));
  begin = self->_counterBuffers.__begin_;
  end = self->_counterBuffers.__end_;
  while (begin != end)
  {
    begin[1] = *begin;
    begin += 3;
  }
  [(NSLock *)self->_pullLock unlock];
  for (uint64_t i = 0; ; uint64_t i = (i + 1))
  {
    if (i >= [(GPURawCounterSource *)self->_source ringBufferNum])
    {
      __p = &v36;
      sub_2308E58F8((void ***)&__p);

      return;
    }
    if (0xAAAAAAAAAAAAAAABLL * ((v37 - v36) >> 3) <= i) {
      break;
    }
    uint64_t v8 = (unint64_t *)(v36 + 24 * i);
    __p = 0;
    uint64_t v34 = 0;
    uint64_t v35 = 0;
    unint64_t v9 = (uint64_t *)(v8 + 1);
    sub_2308AC188((unint64_t *)&__p, 2 * (v8[1] - *v8));
    size_t __n = 0;
    uint64_t v32 = 0;
    unint64_t v10 = v8[1];
    unint64_t v11 = *v8;
    [(GPURawCounterSource *)self->_source resetRawDataPostProcessor];
    unint64_t v12 = *v8;
    if (v8[1] == *v8) {
      goto LABEL_36;
    }
    size_t v13 = 0;
    uint64_t v14 = 0;
    unint64_t v15 = 0;
    unint64_t v16 = v10 - v11;
    while (1)
    {
      LOBYTE(v29) = 0;
      [(GPURawCounterSource *)self->_source postProcessRawDataWithSource:v12 + v15 sourceSize:v16 + v13 sourceRead:&v32 output:self->_tmpOutBuffer.__begin_ outputSize:self->_tmpOutBuffer.__end_ - self->_tmpOutBuffer.__begin_ outputWritten:&__n isLast:v29];
      uint64_t v17 = v32;
      if (!v32) {
        break;
      }
      if (__n && __n + v14 < v35 - (uint64_t)__p)
      {
        memcpy((char *)__p + v14, self->_tmpOutBuffer.__begin_, __n);
        v14 += __n;
      }
      v15 += v17;
      size_t v13 = -(uint64_t)v15;
      uint64_t v18 = *v9;
      unint64_t v12 = *v8;
      if (v15 >= *v9 - *v8) {
        goto LABEL_16;
      }
    }
    uint64_t v18 = *v9;
    unint64_t v12 = *v8;
LABEL_16:
    unint64_t v19 = v18 - v12;
    BOOL v20 = v18 - v12 >= v15;
    unint64_t v21 = v18 - v12 - v15;
    if (v20)
    {
      if (v19 > v21) {
        *unint64_t v9 = v12 + v21;
      }
    }
    else
    {
      sub_2308E552C(v8, v13);
    }
    v22 = (char *)__p;
    if (v14 >= 1)
    {
      v23 = (char *)__p + v14;
      do
      {
        do
        {
          uint64_t v24 = *(void *)v22;
          if (v24 == [(GPURawCounterSourceGroup *)self->_sourceGroup sampleMarker]) {
            break;
          }
          v22 += 8;
        }
        while (v22 < v23);
        v25 = v22 + 8;
        if (v22 + 8 >= v23) {
          break;
        }
        uint64_t v26 = 0;
        while (1)
        {
          uint64_t v27 = v25[v26];
          if (v27 == [(GPURawCounterSourceGroup *)self->_sourceGroup sampleMarker]) {
            break;
          }
          if (&v25[++v26] >= (void *)v23) {
            goto LABEL_36;
          }
        }
        if ((unint64_t)v26 >= 5)
        {
          unint64_t v28 = *((void *)v22 + 5);
          if (v28 > 6)
          {
            if (v28 == 7) {
              (*((void (**)(id, void *, uint64_t, void, uint64_t, uint64_t, void))v30 + 2))(v30, (void *)v22 + 6, (v26 * 8 - 40) >> 3, *((void *)v22 + 1), 1, i, self->_sourceIndex);
            }
          }
          else if ((v26 * 8) >> 3 == [(NSArray *)self->_selects count])
          {
            (*((void (**)(id, void *, NSUInteger, void, void, uint64_t, void))v30 + 2))(v30, (void *)v22 + 1, [(NSArray *)self->_selects count], *v25, 0, i, self->_sourceIndex);
          }
        }
        v22 = (char *)&v25[v26];
      }
      while (&v25[v26] < (void *)v23);
LABEL_36:
      v22 = (char *)__p;
    }
    if (v22)
    {
      uint64_t v34 = v22;
      operator delete(v22);
    }
  }
  __break(1u);
}

- (void)sampleAPS:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_pullLock lock];
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  sub_2308E5668(&v38, (uint64_t)self->_counterBuffers.__begin_, (uint64_t)self->_counterBuffers.__end_, 0xAAAAAAAAAAAAAAABLL * (((char *)self->_counterBuffers.__end_ - (char *)self->_counterBuffers.__begin_) >> 3));
  begin = self->_counterBuffers.__begin_;
  end = self->_counterBuffers.__end_;
  while (begin != end)
  {
    begin[1] = *begin;
    begin += 3;
  }
  [(NSLock *)self->_pullLock unlock];
  for (uint64_t i = 0; ; uint64_t i = (i + 1))
  {
    if (i >= [(GPURawCounterSource *)self->_source ringBufferNum])
    {
      uint64_t v35 = &v38;
      sub_2308E58F8((void ***)&v35);

      return;
    }
    if (0xAAAAAAAAAAAAAAABLL * ((v39 - v38) >> 3) <= i) {
      break;
    }
    uint64_t v8 = (unint64_t *)(v38 + 24 * i);
    uint64_t v35 = 0;
    uint64_t v36 = 0;
    uint64_t v37 = 0;
    unint64_t v9 = (uint64_t *)(v8 + 1);
    sub_2308AC188((unint64_t *)&v35, 2 * (v8[1] - *v8));
    size_t __n = 0;
    uint64_t v34 = 0;
    unint64_t v10 = v8[1];
    unint64_t v11 = *v8;
    [(GPURawCounterSource *)self->_source resetRawDataPostProcessor];
    unint64_t v12 = v10 - v11;
    unint64_t v13 = *v8;
    if (v8[1] == *v8)
    {
      uint64_t v14 = 0;
    }
    else
    {
      uint64_t v14 = 0;
      unint64_t v15 = 0;
      while (1)
      {
        LOBYTE(v29) = 0;
        [(GPURawCounterSource *)self->_source postProcessRawDataWithSource:v13 + v15 sourceSize:v12 - v15 sourceRead:&v34 output:self->_tmpOutBuffer.__begin_ outputSize:self->_tmpOutBuffer.__end_ - self->_tmpOutBuffer.__begin_ outputWritten:&__n isLast:v29];
        uint64_t v16 = v34;
        if (!v34) {
          break;
        }
        if (__n && __n + v14 < v37 - (uint64_t)v35)
        {
          memcpy((char *)v35 + v14, self->_tmpOutBuffer.__begin_, __n);
          v14 += __n;
        }
        v15 += v16;
        uint64_t v17 = *v9;
        unint64_t v13 = *v8;
        if (v15 >= *v9 - *v8) {
          goto LABEL_17;
        }
      }
      uint64_t v17 = *v9;
      unint64_t v13 = *v8;
LABEL_17:
      unint64_t v18 = v17 - v13;
      BOOL v19 = v17 - v13 >= v15;
      unint64_t v20 = v17 - v13 - v15;
      if (v19)
      {
        if (v18 > v20) {
          *unint64_t v9 = v13 + v20;
        }
      }
      else
      {
        sub_2308E552C(v8, -(uint64_t)v15);
      }
    }
    __p = 0;
    v31 = 0;
    uint64_t v32 = 0;
    sub_2308D6618(&__p, v12 >> 3);
    if (v14 >= 1)
    {
      unint64_t v21 = (char *)v35;
      v22 = (char *)v35 + v14;
      do
      {
        do
        {
          uint64_t v23 = *(void *)v21;
          if (v23 == [(GPURawCounterSourceGroup *)self->_sourceGroup sampleMarker]) {
            break;
          }
          v21 += 8;
        }
        while (v21 < v22);
        uint64_t v24 = v21 + 8;
        if (v21 + 8 >= v22) {
          break;
        }
        uint64_t v25 = 0;
        while (1)
        {
          uint64_t v26 = *(void *)&v24[v25];
          if (v26 == [(GPURawCounterSourceGroup *)self->_sourceGroup sampleMarker]) {
            break;
          }
          v25 += 8;
          if (&v24[v25] >= v22) {
            goto LABEL_35;
          }
        }
        if ((unint64_t)v25 >= 0x28
          && *((void *)v21 + 5) <= 6uLL
          && v25 >> 3 == [(NSArray *)self->_selects count])
        {
          uint64_t v27 = (uint64_t)v31;
          uint64_t v28 = [(NSArray *)self->_selects count];
          sub_2308E59A4((uint64_t)&__p, v27, v21 + 8, &v24[8 * v28], v28);
        }
        unint64_t v21 = &v24[v25];
      }
      while (&v24[v25] < v22);
    }
LABEL_35:
    (*((void (**)(id, void *, int64_t, uint64_t, uint64_t, void))v4 + 2))(v4, __p, v31 - (unsigned char *)__p, 3, i, self->_sourceIndex);
    if (__p)
    {
      v31 = __p;
      operator delete(__p);
    }
    if (v35)
    {
      uint64_t v36 = v35;
      operator delete(v35);
    }
  }
  __break(1u);
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
  begin = self->_tmpOutBuffer.__begin_;
  if (begin)
  {
    self->_tmpOutBuffer.__end_ = begin;
    operator delete(begin);
  }
  p_counterBuffers = &self->_counterBuffers;
  sub_2308E58F8((void ***)&p_counterBuffers);
  objc_storeStrong((id *)&self->_pullLock, 0);
  objc_storeStrong((id *)&self->_pullTimer, 0);
  objc_storeStrong((id *)&self->_pullQueue, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 2) = 0u;
  return self;
}

@end