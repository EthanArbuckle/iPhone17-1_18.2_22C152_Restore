@interface ASDSRCStream
- (ASDSRCStream)initWithDirection:(unsigned int)a3 withPlugin:(id)a4;
- (ASDSRCStream)initWithOwningDevice:(id)a3 underlyingStreams:(id)a4 direction:(unsigned int)a5 plugin:(id)a6;
- (BOOL)_allocateStreamingResources;
- (BOOL)changePhysicalFormat:(id)a3;
- (NSArray)underlyingStreams;
- (id).cxx_construct;
- (id)readInputBlock;
- (id)writeMixBlock;
- (int64_t)maximumFramesPerIOCycle;
- (void)_deallocateStreamingResources;
- (void)_updateLatency;
- (void)_updateMaximumFramesPerIOCycle;
- (void)setUnderlyingStreams:(id)a3;
- (void)startStream;
- (void)stopStream;
- (void)updateLatency;
@end

@implementation ASDSRCStream

- (ASDSRCStream)initWithDirection:(unsigned int)a3 withPlugin:(id)a4
{
  v5 = (void *)MEMORY[0x263EFF940];
  v6 = objc_msgSend(NSString, "stringWithUTF8String:", "-[ASDSRCStream initWithDirection:withPlugin:]", a4);
  [v5 raise:*MEMORY[0x263EFF4A0], @"Do not call %@", v6 format];

  return 0;
}

- (ASDSRCStream)initWithOwningDevice:(id)a3 underlyingStreams:(id)a4 direction:(unsigned int)a5 plugin:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  v37.receiver = self;
  v37.super_class = (Class)ASDSRCStream;
  v12 = [(ASDStream *)&v37 initWithDirection:v7 withPlugin:a6];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_owningDevice, v10);
    objc_storeStrong((id *)&v13->_underlyingStreams, a4);
    v13->_ioReferenceCount = 0;
    v32 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v14 = [v32 bundleIdentifier];
    v15 = NSString;
    v16 = [(ASDStream *)v13 streamName];
    id v17 = [v15 stringWithFormat:@"%@.srcStream.%@.srcQueue", v14, v16];
    dispatch_queue_t v18 = dispatch_queue_create((const char *)[v17 UTF8String], 0);
    srcQueue = v13->_srcQueue;
    v13->_srcQueue = (OS_dispatch_queue *)v18;

    v20 = NSString;
    v21 = [(ASDStream *)v13 streamName];
    id v22 = [v20 stringWithFormat:@"%@.srcStream.%@.propertyQueue", v14, v21];
    dispatch_queue_t v23 = dispatch_queue_create((const char *)[v22 UTF8String], 0);
    propertyQueue = v13->_propertyQueue;
    v13->_propertyQueue = (OS_dispatch_queue *)v23;

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v25 = v11;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v34;
      do
      {
        uint64_t v28 = 0;
        do
        {
          if (*(void *)v34 != v27) {
            objc_enumerationMutation(v25);
          }
          if ([*(id *)(*((void *)&v33 + 1) + 8 * v28) direction] != v7)
          {
            v29 = [MEMORY[0x263F08690] currentHandler];
            [v29 handleFailureInMethod:a2 object:v13 file:@"ASDSRCStream.mm" lineNumber:57 description:@"Underlying stream has a different direction than the SRC stream"];
          }
          ++v28;
        }
        while (v26 != v28);
        uint64_t v26 = [v25 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v26);
    }

    [(ASDSRCStream *)v13 _updateMaximumFramesPerIOCycle];
    [(ASDSRCStream *)v13 _updateLatency];
  }
  return v13;
}

- (void)setUnderlyingStreams:(id)a3
{
  id v4 = a3;
  srcQueue = self->_srcQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__ASDSRCStream_setUnderlyingStreams___block_invoke;
  v7[3] = &unk_264772F40;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(srcQueue, v7);
}

void __37__ASDSRCStream_setUnderlyingStreams___block_invoke(uint64_t a1)
{
}

- (void)startStream
{
  srcQueue = self->_srcQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__ASDSRCStream_startStream__block_invoke;
  block[3] = &unk_264772FB8;
  block[4] = self;
  block[5] = a2;
  dispatch_sync(srcQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)ASDSRCStream;
  [(ASDStream *)&v4 startStream];
}

uint64_t __27__ASDSRCStream_startStream__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t result = *(void *)(a1 + 32);
  if (!*(void *)(result + 328))
  {
    [(id)result _updateMaximumFramesPerIOCycle];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = *(id *)(*(void *)(a1 + 32) + 336);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "startStream", (void)v8);
        }
        while (v4 != v6);
        uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }

    if (([*(id *)(a1 + 32) _allocateStreamingResources] & 1) == 0)
    {
      uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
      [v7 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"ASDSRCStream.mm" lineNumber:86 description:@"Couldn't allocate streaming resources"];
    }
    ++*(void *)(*(void *)(a1 + 32) + 328);
    uint64_t result = *(void *)(a1 + 32);
  }
  *(unsigned char *)(result + 312) = 1;
  return result;
}

- (void)stopStream
{
  v5.receiver = self;
  v5.super_class = (Class)ASDSRCStream;
  [(ASDStream *)&v5 stopStream];
  srcQueue = self->_srcQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__ASDSRCStream_stopStream__block_invoke;
  block[3] = &unk_264772D28;
  block[4] = self;
  dispatch_sync(srcQueue, block);
}

uint64_t __26__ASDSRCStream_stopStream__block_invoke(uint64_t result)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(result + 32) + 312) = 0;
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(v1 + 328);
  BOOL v3 = v2 < 1;
  uint64_t v4 = v2 - 1;
  if (!v3)
  {
    uint64_t v5 = result;
    *(void *)(v1 + 328) = v4;
    uint64_t v6 = *(void *)(result + 32);
    if (!*(void *)(v6 + 328))
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v7 = *(id *)(v6 + 336);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v12;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v7);
            }
            objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "stopStream", (void)v11);
          }
          while (v8 != v10);
          uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v8);
      }

      return [*(id *)(v5 + 32) _deallocateStreamingResources];
    }
  }
  return result;
}

- (BOOL)changePhysicalFormat:(id)a3
{
  id v4 = a3;
  id v5 = [(ASDStream *)self physicalFormat];

  if (v5 != v4)
  {
    uint64_t v6 = [(ASDObject *)self owner];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __37__ASDSRCStream_changePhysicalFormat___block_invoke;
    v8[3] = &unk_264772F40;
    v8[4] = self;
    id v9 = v4;
    [v6 requestConfigurationChange:v8];
  }
  return 1;
}

uint64_t __37__ASDSRCStream_changePhysicalFormat___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPhysicalFormat:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(a1 + 32) owner];
  [*(id *)(a1 + 40) sampleRate];
  objc_msgSend(v2, "setSamplingRate:");

  BOOL v3 = *(void **)(a1 + 32);
  return [v3 updateLatency];
}

- (BOOL)_allocateStreamingResources
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__ASDSRCStream__allocateStreamingResources__block_invoke;
  v4[3] = &unk_264772E28;
  v4[4] = self;
  id v5 = &unk_26D96F928;
  char v6 = 0;
  id v7 = &v5;
  char v2 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v4);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](&v5);
  return v2;
}

void __43__ASDSRCStream__allocateStreamingResources__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  char v2 = [*(id *)(a1 + 32) physicalFormat];
  BOOL v3 = v2;
  if (v2) {
    [v2 audioStreamBasicDescription];
  }
  else {
    memset(&v23, 0, sizeof(v23));
  }
  CAStreamBasicDescription::CAStreamBasicDescription((CAStreamBasicDescription *)v24, &v23);

  uint64_t v20 = 0;
  v21 = 0;
  unint64_t v22 = 0;
  memset(__p, 0, sizeof(__p));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = *(id *)(*(void *)(a1 + 32) + 336);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v13 = [v8 readInputBlock];
        id v14 = [v8 writeMixBlock];
        id v9 = v21;
        if ((unint64_t)v21 >= v22)
        {
          uint64_t v10 = std::vector<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks>::__emplace_back_slow_path<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks&>(&v20, &v13);
        }
        else
        {
          *id v9 = MEMORY[0x22A63F100](v13);
          v9[1] = MEMORY[0x22A63F100](v14);
          uint64_t v10 = (uint64_t)(v9 + 2);
        }
        v21 = (void *)v10;
        long long v11 = [v8 physicalFormat];
        long long v12 = v11;
        if (v11) {
          [v11 audioStreamBasicDescription];
        }
        else {
          memset(&v23, 0, sizeof(v23));
        }
        std::vector<CAStreamBasicDescription>::emplace_back<AudioStreamBasicDescription>(__p, &v23);
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v25 count:16];
    }
    while (v5);
  }

  [*(id *)(a1 + 32) direction];
  operator new();
}

- (void)_deallocateStreamingResources
{
  v3[4] = *MEMORY[0x263EF8340];
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __45__ASDSRCStream__deallocateStreamingResources__block_invoke;
  v2[3] = &unk_264772D28;
  v2[4] = self;
  v3[0] = &unk_26D96F898;
  v3[3] = v3;
  ASDDSP::exceptionBarrier<void({block_pointer} {__strong})(void)>(v2);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v3);
}

ASDSRCStreamHelper *__45__ASDSRCStream__deallocateStreamingResources__block_invoke(uint64_t a1)
{
  ASDSRCStreamHelper::deallocateStreamingResources(*(ASDSRCStreamHelper **)(*(void *)(a1 + 32) + 288));
  char v2 = (ASDSRCStreamHelper **)(*(void *)(a1 + 32) + 288);
  return std::unique_ptr<ASDSRCStreamHelper>::reset[abi:ne180100](v2, 0);
}

- (void)updateLatency
{
  srcQueue = self->_srcQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__ASDSRCStream_updateLatency__block_invoke;
  block[3] = &unk_264772D28;
  block[4] = self;
  dispatch_sync(srcQueue, block);
}

uint64_t __29__ASDSRCStream_updateLatency__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateLatency];
}

- (void)_updateMaximumFramesPerIOCycle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningDevice);
  self->_maximumFramesPerIOCycle = [WeakRetained timestampPeriod];
}

- (int64_t)maximumFramesPerIOCycle
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  propertyQueue = self->_propertyQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__ASDSRCStream_maximumFramesPerIOCycle__block_invoke;
  v5[3] = &unk_264773078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(propertyQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__ASDSRCStream_maximumFramesPerIOCycle__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _updateMaximumFramesPerIOCycle];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 320);
  return result;
}

- (void)_updateLatency
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningDevice);
  [WeakRetained samplingRate];
  double v5 = v4;
  uint64_t v6 = [WeakRetained underlyingDevice];
  [v6 samplingRate];
  double v8 = v7;

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v9 = self->_underlyingStreams;
  unsigned int v10 = 0;
  uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v14, "latency", (void)v26) > v10) {
          unsigned int v10 = [v14 latency];
        }
      }
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v11);
  }

  long long v15 = [WeakRetained underlyingDevice];
  [v15 samplingRate];
  double v17 = v16;
  [WeakRetained samplingRate];
  BOOL v19 = v17 != v18;

  if (v19)
  {
    uint64_t v20 = [WeakRetained underlyingDevice];
    [v20 samplingRate];
    double v22 = v21;
    [WeakRetained samplingRate];
    double v24 = v23;

    unsigned int v25 = vcvtmd_u64_f64(5.0 / v22 * v24 + 0.5);
  }
  else
  {
    unsigned int v25 = 0;
  }
  -[ASDStream setLatency:](self, "setLatency:", v25 + vcvtpd_u64_f64(v5 / v8 * (double)v10), (void)v26);
}

- (id)readInputBlock
{
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v5[3] = &self->_streamHelper;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __30__ASDSRCStream_readInputBlock__block_invoke;
  v4[3] = &unk_264773130;
  v4[4] = v5;
  char v2 = (void *)MEMORY[0x22A63F100](v4, a2);
  _Block_object_dispose(v5, 8);
  return v2;
}

uint64_t __30__ASDSRCStream_readInputBlock__block_invoke(uint64_t a1, uint64_t a2, const AudioServerPlugInIOCycleInfo *a3, void *a4, void *a5, uint64_t a6)
{
  uint64_t v6 = **(ASDSRCStreamHelper ***)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (!v6) {
    __30__ASDSRCStream_readInputBlock__block_invoke_cold_1();
  }
  return ASDSRCStreamHelper::readInput(v6, a2, a3, a4, a5, a6);
}

- (id)writeMixBlock
{
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v5[3] = &self->_streamHelper;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __29__ASDSRCStream_writeMixBlock__block_invoke;
  v4[3] = &unk_264773130;
  v4[4] = v5;
  char v2 = (void *)MEMORY[0x22A63F100](v4, a2);
  _Block_object_dispose(v5, 8);
  return v2;
}

uint64_t __29__ASDSRCStream_writeMixBlock__block_invoke(uint64_t a1, unsigned int a2, const AudioServerPlugInIOCycleInfo *a3, void *a4, void *a5)
{
  double v5 = **(ASDSRCStreamHelper ***)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (!v5) {
    __29__ASDSRCStream_writeMixBlock__block_invoke_cold_1();
  }
  return ASDSRCStreamHelper::writeMix(v5, a2, a3, a4, a5);
}

- (NSArray)underlyingStreams
{
  return self->_underlyingStreams;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingStreams, 0);
  objc_storeStrong((id *)&self->_propertyQueue, 0);
  objc_storeStrong((id *)&self->_srcQueue, 0);
  std::unique_ptr<ASDSRCStreamHelper>::reset[abi:ne180100](&self->_streamHelper.__ptr_.__value_, 0);
  objc_destroyWeak((id *)&self->_owningDevice);
}

- (id).cxx_construct
{
  *((void *)self + 36) = 0;
  return self;
}

void __30__ASDSRCStream_readInputBlock__block_invoke_cold_1()
{
}

void __29__ASDSRCStream_writeMixBlock__block_invoke_cold_1()
{
}

@end