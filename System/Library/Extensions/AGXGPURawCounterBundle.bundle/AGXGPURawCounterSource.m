@interface AGXGPURawCounterSource
- (AGXGPURawCounterSource)initWithSourceGroup:(id)a3 impl:(Source *)a4;
- (BOOL)isEnabled;
- (BOOL)pollCountersAtBufferIndex:(unsigned int)a3 withBlock:(id)a4;
- (BOOL)postProcessRawDataWithRingBufferIndex:(unsigned int)a3 source:(char *)a4 sourceSize:(unint64_t)a5 sourceRead:(unint64_t *)a6 sourceWrite:(unint64_t)a7 output:(char *)a8 outputSize:(unint64_t)a9 outputRead:(unint64_t)a10 outputWrite:(unint64_t *)a11 isLast:(BOOL)a12;
- (BOOL)postProcessRawDataWithRingBufferSource:(char *)a3 sourceSize:(unint64_t)a4 sourceRead:(unint64_t *)a5 sourceWrite:(unint64_t)a6 output:(char *)a7 outputSize:(unint64_t)a8 outputRead:(unint64_t)a9 outputWrite:(unint64_t *)a10 isLast:(BOOL)a11;
- (BOOL)postProcessRawDataWithSource:(char *)a3 sourceSize:(unint64_t)a4 sourceRead:(unint64_t *)a5 output:(char *)a6 outputSize:(unint64_t)a7 outputWritten:(unint64_t *)a8 isLast:(BOOL)a9;
- (BOOL)requestCounter:(id)a3;
- (BOOL)requestCounters:(id)a3 firstErrorIndex:(unint64_t *)a4;
- (BOOL)requestTriggers:(id)a3 firstErrorIndex:(unint64_t *)a4;
- (BOOL)ringBufferInfoAtIndex:(unsigned int)a3 base:(char *)a4 size:(unsigned int *)a5 dataOffset:(unsigned int *)a6 dataSize:(unsigned int *)a7;
- (BOOL)setEnabled:(BOOL)a3;
- (id)availableCounters;
- (id)availableTriggers;
- (id)selectedCounters;
- (id)selectedTriggers;
- (unsigned)drainRingBufferAtIndex:(unsigned int)a3 dataSize:(unsigned int)a4;
- (unsigned)ringBufferNum;
- (void)dealloc;
- (void)flushRingBuffers;
- (void)resetRawDataPostProcessor;
- (void)setOptions:(id)a3;
@end

@implementation AGXGPURawCounterSource

- (BOOL)pollCountersAtBufferIndex:(unsigned int)a3 withBlock:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v41 = *MEMORY[0x263EF8340];
  if ([(AGXGPURawCounterSource *)self ringBufferNum] <= a3)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** Error, buffer index is out of range! (%u > %u)\n\n", "AGXGPURawCounterSourceGroup.mm", 564, "-[AGXGPURawCounterSource pollCountersAtBufferIndex:withBlock:]", v5, [(AGXGPURawCounterSource *)self ringBufferNum]);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)&buf[4] = "AGXGPURawCounterSourceGroup.mm";
      __int16 v33 = 1024;
      int v34 = 564;
      __int16 v35 = 2080;
      v36 = "-[AGXGPURawCounterSource pollCountersAtBufferIndex:withBlock:]";
      __int16 v37 = 1024;
      int v38 = v5;
      __int16 v39 = 1024;
      unsigned int v40 = [(AGXGPURawCounterSource *)self ringBufferNum];
      _os_log_error_impl(&dword_2406C3000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Error, buffer index is out of range! (%u > %u)\n\n", buf, 0x28u);
    }
    int v14 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO);
    if (v14)
    {
      unsigned int v23 = [(AGXGPURawCounterSource *)self ringBufferNum];
      *(_DWORD *)buf = 136316162;
      *(void *)&buf[4] = "AGXGPURawCounterSourceGroup.mm";
      __int16 v33 = 1024;
      int v34 = 564;
      __int16 v35 = 2080;
      v36 = "-[AGXGPURawCounterSource pollCountersAtBufferIndex:withBlock:]";
      __int16 v37 = 1024;
      int v38 = v5;
      __int16 v39 = 1024;
      unsigned int v40 = v23;
      _os_log_impl(&dword_2406C3000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** Error, buffer index is out of range! (%u > %u)\n\n", buf, 0x28u);
LABEL_27:
      LOBYTE(v14) = 0;
    }
  }
  else
  {
    pollPostProcessBufferList = self->_pollPostProcessBufferList;
    if (!pollPostProcessBufferList)
    {
      self->_pollPostProcessBufferList = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[AGXGPURawCounterSource ringBufferNum](self, "ringBufferNum"));
      if ([(AGXGPURawCounterSource *)self ringBufferNum])
      {
        unsigned int v8 = 0;
        do
        {
          v9 = objc_alloc_init(PollPostProcessBuffer);
          [(NSMutableArray *)self->_pollPostProcessBufferList addObject:v9];

          ++v8;
        }
        while (v8 < [(AGXGPURawCounterSource *)self ringBufferNum]);
      }
      [(AGXGPURawCounterSource *)self resetRawDataPostProcessor];
      pollPostProcessBufferList = self->_pollPostProcessBufferList;
    }
    uint64_t v10 = v5;
    int v11 = objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](pollPostProcessBufferList, "objectAtIndexedSubscript:", v5), "srcBufferPrevOffset");
    int v12 = objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_pollPostProcessBufferList, "objectAtIndexedSubscript:", v5), "srcBufferPrevSize");
    uint64_t v31 = 0;
    *(void *)buf = 0;
    unsigned int v30 = 0;
    BOOL v13 = [(AGXGPURawCounterSource *)self ringBufferInfoAtIndex:v5 base:buf size:(char *)&v31 + 4 dataOffset:&v31 dataSize:&v30];
    LOBYTE(v14) = 0;
    if (v13)
    {
      if (v30)
      {
        uint64_t v26 = *(void *)buf;
        uint64_t v27 = v5;
        uint64_t v15 = HIDWORD(v31);
        uint64_t v29 = v31;
        uint64_t v16 = (v31 + v30) % HIDWORD(v31);
        uint64_t v17 = objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_pollPostProcessBufferList, "objectAtIndexedSubscript:", v10), "dstBuffer"), "mutableBytes");
        uint64_t v18 = objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_pollPostProcessBufferList, "objectAtIndexedSubscript:", v10), "dstBuffer"), "length");
        BOOL v20 = v31 == v11 && v30 == v12;
        while (1)
        {
          unint64_t v28 = 0;
          LOBYTE(v25) = v20;
          int v14 = (*((uint64_t (**)(Source *, uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, void, unint64_t *, int))self->_impl->var0
                 + 25))(self->_impl, v27, v26, v15, &v29, v16, v17, v18, 0, &v28, v25);
          if (!v14) {
            break;
          }
          if (v28)
          {
            (*((void (**)(id, uint64_t, unint64_t, void))a4 + 2))(a4, v17, v28 >> 3, 0);
            if (v28) {
              continue;
            }
          }
          unint64_t v21 = v29 + HIDWORD(v31) - v31;
          int v22 = v21 % HIDWORD(v31);
          if (v22
            && [(AGXGPURawCounterSource *)self drainRingBufferAtIndex:v27 dataSize:v21 % HIDWORD(v31)] != v22)
          {
            goto LABEL_27;
          }
          int v14 = [(AGXGPURawCounterSource *)self ringBufferInfoAtIndex:v27 base:buf size:(char *)&v31 + 4 dataOffset:&v31 dataSize:&v30];
          if (!v14) {
            return v14;
          }
          objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_pollPostProcessBufferList, "objectAtIndexedSubscript:", v10), "setSrcBufferPrevOffset:", v31);
          objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_pollPostProcessBufferList, "objectAtIndexedSubscript:", v10), "setSrcBufferPrevSize:", v30);
          goto LABEL_22;
        }
      }
      else
      {
LABEL_22:
        LOBYTE(v14) = 1;
      }
    }
  }
  return v14;
}

- (BOOL)postProcessRawDataWithRingBufferIndex:(unsigned int)a3 source:(char *)a4 sourceSize:(unint64_t)a5 sourceRead:(unint64_t *)a6 sourceWrite:(unint64_t)a7 output:(char *)a8 outputSize:(unint64_t)a9 outputRead:(unint64_t)a10 outputWrite:(unint64_t *)a11 isLast:(BOOL)a12
{
  return (*((uint64_t (**)(Source *, void, char *, unint64_t, unint64_t *, unint64_t, char *, unint64_t, unint64_t, unint64_t *))self->_impl->var0
          + 25))(self->_impl, *(void *)&a3, a4, a5, a6, a7, a8, a9, a10, a11);
}

- (BOOL)postProcessRawDataWithRingBufferSource:(char *)a3 sourceSize:(unint64_t)a4 sourceRead:(unint64_t *)a5 sourceWrite:(unint64_t)a6 output:(char *)a7 outputSize:(unint64_t)a8 outputRead:(unint64_t)a9 outputWrite:(unint64_t *)a10 isLast:(BOOL)a11
{
  return (*((uint64_t (**)(Source *, void, char *, unint64_t, unint64_t *, unint64_t, char *, unint64_t))self->_impl->var0
          + 25))(self->_impl, 0, a3, a4, a5, a6, a7, a8);
}

- (BOOL)postProcessRawDataWithSource:(char *)a3 sourceSize:(unint64_t)a4 sourceRead:(unint64_t *)a5 output:(char *)a6 outputSize:(unint64_t)a7 outputWritten:(unint64_t *)a8 isLast:(BOOL)a9
{
  return (*((uint64_t (**)(Source *, void, char *, unint64_t, unint64_t *, char *, unint64_t, unint64_t *))self->_impl->var0
          + 24))(self->_impl, 0, a3, a4, a5, a6, a7, a8);
}

- (void)resetRawDataPostProcessor
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  (*((void (**)(Source *, void))self->_impl->var0 + 26))(self->_impl, 0);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  pollPostProcessBufferList = self->_pollPostProcessBufferList;
  uint64_t v4 = [(NSMutableArray *)pollPostProcessBufferList countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(pollPostProcessBufferList);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) reset];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)pollPostProcessBufferList countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)flushRingBuffers
{
}

- (unsigned)drainRingBufferAtIndex:(unsigned int)a3 dataSize:(unsigned int)a4
{
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(*((uint64_t (**)(Source *, void))self->_impl->var0 + 21))(self->_impl, *(void *)&a3)+ 40);

  return v4();
}

- (BOOL)ringBufferInfoAtIndex:(unsigned int)a3 base:(char *)a4 size:(unsigned int *)a5 dataOffset:(unsigned int *)a6 dataSize:(unsigned int *)a7
{
  uint64_t v11 = (*((uint64_t (**)(Source *, void))self->_impl->var0 + 21))(self->_impl, *(void *)&a3);
  uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)v11 + 16))(v11);
  if (v12)
  {
    *a4 = (char *)(*(uint64_t (**)(uint64_t))(*(void *)v11 + 16))(v11);
    *a5 = (*(uint64_t (**)(uint64_t))(*(void *)v11 + 24))(v11);
    uint64_t v13 = *(uint64_t (**)(uint64_t, unsigned int *, unsigned int *))(*(void *)v11 + 32);
    LOBYTE(v12) = v13(v11, a6, a7);
  }
  return v12;
}

- (unsigned)ringBufferNum
{
  return (*((uint64_t (**)(void))self->_impl->var0 + 22))();
}

- (BOOL)requestCounters:(id)a3 firstErrorIndex:(unint64_t *)a4
{
  (*((void (**)(Source *, SEL))self->_impl->var0 + 7))(self->_impl, a2);

  self->_selectedCounterList = 0;
  if (![a3 count]) {
    goto LABEL_9;
  }
  uint64_t v7 = 0;
  unsigned int v8 = 0;
  while (-[AGXGPURawCounterSource requestCounter:](self, "requestCounter:", [a3 objectAtIndexedSubscript:v7]))
  {
    uint64_t v7 = ++v8;
    if ([a3 count] <= (unint64_t)v8) {
      goto LABEL_9;
    }
  }
  if (v8 == -1)
  {
LABEL_9:
    self->_selectedCounterList = (NSArray *)[a3 copy];
    return 1;
  }
  else
  {
    BOOL result = 0;
    if (a4) {
      *a4 = v8;
    }
  }
  return result;
}

- (BOOL)requestCounter:(id)a3
{
  if (objc_msgSend((id)objc_msgSend(a3, "options"), "objectForKeyedSubscript:", @"Width")) {
    uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "options"), "objectForKeyedSubscript:", @"Width"), "unsignedIntValue");
  }
  else {
    uint64_t v5 = 32;
  }
  if (objc_msgSend((id)objc_msgSend(a3, "options"), "objectForKeyedSubscript:", @"Partition")) {
    uint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "options"), "objectForKeyedSubscript:", @"Partition"), "unsignedLongValue");
  }
  else {
    uint64_t v6 = 0xFFFFFFFFLL;
  }
  if (objc_msgSend((id)objc_msgSend(a3, "options"), "objectForKeyedSubscript:", @"Select")) {
    uint64_t v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "options"), "objectForKeyedSubscript:", @"Select"), "unsignedLongLongValue");
  }
  else {
    uint64_t v7 = -1;
  }
  HIDWORD(v8) = v5;
  LODWORD(v8) = v5 - 16;
  if ((v8 >> 4) > 3 || v6 == -1 && v7 != -1 || v6 != -1 && v7 == -1) {
    return 0;
  }
  impl = self->_impl;
  uint64_t v11 = objc_msgSend((id)objc_msgSend(a3, "name"), "UTF8String");
  uint64_t v12 = (uint64_t (*)(Source *, uint64_t, uint64_t, uint64_t, uint64_t))*((void *)impl->var0 + 8);

  return v12(impl, v11, v5, v6, v7);
}

- (id)selectedCounters
{
  return self->_selectedCounterList;
}

- (id)availableCounters
{
  return self->_counterList;
}

- (BOOL)requestTriggers:(id)a3 firstErrorIndex:(unint64_t *)a4
{
  self->_selectedTriggerList = 0;
  (*((void (**)(Source *))self->_impl->var0 + 10))(self->_impl);
  if (![a3 count]) {
    return 1;
  }
  if (![a3 count]) {
    goto LABEL_23;
  }
  uint64_t v7 = 0;
  unsigned int v8 = 0;
  while (1)
  {
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v7), "name"), "isEqualToString:", @"TimerNClock"))
    {
      uint64_t v9 = 0;
    }
    else if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v7), "name"), "isEqualToString:", @"TimerFixed"))
    {
      uint64_t v9 = 1;
    }
    else if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v7), "name"), "isEqualToString:", @"KickBoundary"))
    {
      uint64_t v9 = 2;
    }
    else if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v7), "name"), "isEqualToString:", @"CPMS"))
    {
      uint64_t v9 = 3;
    }
    else if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v7), "name"), "isEqualToString:", @"KickTracing"))
    {
      uint64_t v9 = 4;
    }
    else
    {
      if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v7), "name"), "isEqualToString:", @"KickAndStateTracing"))break; {
      uint64_t v9 = 5;
      }
    }
    if (!(*((unsigned int (**)(Source *, void, uint64_t))self->_impl->var0 + 11))(self->_impl, *((unsigned int *)&sSourceTriggerNameToTypeMap + 4 * v9 + 2), objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v7), "options")))break; {
    uint64_t v7 = ++v8;
    }
    if ([a3 count] <= (unint64_t)v8) {
      goto LABEL_23;
    }
  }
  if (v8 == -1)
  {
LABEL_23:
    self->_selectedTriggerList = (NSArray *)[a3 copy];
    return 1;
  }
  if (a4) {
    *a4 = v8;
  }
  (*((void (**)(Source *))self->_impl->var0 + 10))(self->_impl);
  return 0;
}

- (id)selectedTriggers
{
  return self->_selectedTriggerList;
}

- (id)availableTriggers
{
  return self->_triggerList;
}

- (BOOL)isEnabled
{
  return (*((uint64_t (**)(void))self->_impl->var0 + 6))();
}

- (BOOL)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = (*((uint64_t (**)(Source *, BOOL))self->_impl->var0 + 5))(self->_impl, a3);
  if (v5) {
    BOOL v6 = !v3;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6) {
    [(AGXGPURawCounterSource *)self resetRawDataPostProcessor];
  }
  return v5;
}

- (void)setOptions:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AGXGPURawCounterSource;
  [(_GPURawCounterSource *)&v4 setOptions:a3];
  (*((void (**)(Source *, void))self->_impl->var0 + 13))(self->_impl, *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F3F910]));
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AGXGPURawCounterSource;
  [(_GPURawCounterSource *)&v3 dealloc];
}

- (AGXGPURawCounterSource)initWithSourceGroup:(id)a3 impl:(Source *)a4
{
  uint64_t v7 = (void *)(*((uint64_t (**)(Source *, SEL))a4->var0 + 3))(a4, a2);
  uint64_t v8 = [NSString stringWithUTF8String:v7];
  free(v7);
  v27.receiver = self;
  v27.super_class = (Class)AGXGPURawCounterSource;
  uint64_t v9 = [(_GPURawCounterSource *)&v27 initWithSourceGroup:a3 name:v8];
  long long v10 = v9;
  if (v9)
  {
    v9->_impl = a4;
    uint64_t v11 = (void *)MEMORY[0x2455F4E30]();
    uint64_t v26 = 0;
    unsigned int v12 = (*((uint64_t (**)(Source *, void **))v10->_impl->var0 + 4))(v10->_impl, &v26);
    if (v12)
    {
      unsigned int v13 = v12;
      int v25 = v11;
      int v14 = (NSArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v12];
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      do
      {
        uint64_t v17 = (char *)v26 + v15;
        uint64_t v18 = [NSString stringWithUTF8String:*(void *)((char *)v26 + v15)];
        uint64_t v19 = [NSString stringWithUTF8String:*((void *)v17 + 1)];
        -[NSArray setObject:atIndexedSubscript:](v14, "setObject:atIndexedSubscript:", (id)[objc_alloc(MEMORY[0x263F3F8F8]) initWithName:v18 description:v19 valueType:*((_DWORD *)v17 + 4) != 0], v16++);
        v15 += 24;
      }
      while (v13 != v16);
      v10->_counterList = v14;
      free(v26);
      uint64_t v11 = v25;
    }
    BOOL v20 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    if ((*((uint64_t (**)(Source *))v10->_impl->var0 + 9))(v10->_impl)) {
      -[NSArray addObject:](v20, "addObject:", [(id)sSourceGroupTriggerList objectForKeyedSubscript:@"TimerNClock"]);
    }
    if (((*((uint64_t (**)(Source *))v10->_impl->var0 + 9))(v10->_impl) & 2) != 0) {
      -[NSArray addObject:](v20, "addObject:", [(id)sSourceGroupTriggerList objectForKeyedSubscript:@"TimerFixed"]);
    }
    if (((*((uint64_t (**)(Source *))v10->_impl->var0 + 9))(v10->_impl) & 4) != 0) {
      -[NSArray addObject:](v20, "addObject:", [(id)sSourceGroupTriggerList objectForKeyedSubscript:@"KickBoundary"]);
    }
    if (((*((uint64_t (**)(Source *))v10->_impl->var0 + 9))(v10->_impl) & 8) != 0) {
      -[NSArray addObject:](v20, "addObject:", [(id)sSourceGroupTriggerList objectForKeyedSubscript:@"CPMS"]);
    }
    if (((*((uint64_t (**)(Source *))v10->_impl->var0 + 9))(v10->_impl) & 0x10) != 0) {
      -[NSArray addObject:](v20, "addObject:", [(id)sSourceGroupTriggerList objectForKeyedSubscript:@"KickTracing"]);
    }
    if (((*((uint64_t (**)(Source *))v10->_impl->var0 + 9))(v10->_impl) & 0x20) != 0) {
      -[NSArray addObject:](v20, "addObject:", [(id)sSourceGroupTriggerList objectForKeyedSubscript:@"KickAndStateTracing"]);
    }
    v10->_triggerList = v20;
    id v21 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    char v22 = (*((uint64_t (**)(Source *))v10->_impl->var0 + 14))(v10->_impl);
    char v23 = v22;
    if (v22)
    {
      [v21 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"SupportOption_ShaderProfiler"];
      v23 &= ~1u;
      if ((v23 & 2) == 0)
      {
LABEL_20:
        if ((v23 & 4) == 0) {
          goto LABEL_21;
        }
        goto LABEL_28;
      }
    }
    else if ((v22 & 2) == 0)
    {
      goto LABEL_20;
    }
    [v21 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"SupportOption_KickTimestamp"];
    v23 &= ~2u;
    if ((v23 & 4) == 0)
    {
LABEL_21:
      if ((v23 & 8) == 0) {
        goto LABEL_22;
      }
      goto LABEL_29;
    }
LABEL_28:
    [v21 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"SupportOption_SWResetOnRead"];
    v23 &= ~4u;
    if ((v23 & 8) == 0)
    {
LABEL_22:
      if ((v23 & 0x10) == 0)
      {
LABEL_24:
        *(Class *)((char *)&v10->super.super.isa + (int)*MEMORY[0x263F3F908]) = (Class)v21;
        return v10;
      }
LABEL_23:
      [v21 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"SupportOption_CliqueAdvanceReason"];
      goto LABEL_24;
    }
LABEL_29:
    [v21 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"SupportOption_APSOptions"];
    if ((v23 & 0x10) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  return v10;
}

@end