@interface RENotifierAudioUnit
+ (void)registerToAudioUnit;
- (BOOL)allocateRenderResourcesAndReturnError:(id *)a3;
- (BOOL)hasNotified;
- (RENotifierAudioUnit)initWithComponentDescription:(AudioComponentDescription *)a3 options:(unsigned int)a4 error:(id *)a5;
- (id)channelCapabilities;
- (id)didAllocate;
- (id)didDeallocate;
- (id)firstRender;
- (id)inputBusses;
- (id)internalRenderBlock;
- (id)outputBusses;
- (void)deallocateRenderResources;
- (void)resetNotifications;
- (void)setDidAllocate:(id)a3;
- (void)setDidDeallocate:(id)a3;
- (void)setFirstRender:(id)a3;
@end

@implementation RENotifierAudioUnit

+ (void)registerToAudioUnit
{
  if (+[RENotifierAudioUnit registerToAudioUnit]::onceToken != -1) {
    dispatch_once(&+[RENotifierAudioUnit registerToAudioUnit]::onceToken, &__block_literal_global_4);
  }
}

void __42__RENotifierAudioUnit_registerToAudioUnit__block_invoke()
{
  v0 = (void *)MEMORY[0x263EFC0A8];
  v1 = self;
  int v3 = 0;
  long long v2 = *(_OWORD *)"nguatonrlppa";
  [v0 registerSubclass:v1 asComponentDescription:&v2 name:@"RE Notifier Audio Unit" version:1];
}

- (RENotifierAudioUnit)initWithComponentDescription:(AudioComponentDescription *)a3 options:(unsigned int)a4 error:(id *)a5
{
  v23[1] = *MEMORY[0x263EF8340];
  AudioComponentDescription v21 = *a3;
  v20.receiver = self;
  v20.super_class = (Class)RENotifierAudioUnit;
  v5 = [(AUAudioUnit *)&v20 initWithComponentDescription:&v21 options:*(void *)&a4 error:a5];
  if (v5)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x263EF9388]) initStandardFormatWithSampleRate:1 channels:48000.0];
    uint64_t v7 = [objc_alloc(MEMORY[0x263EFC0B0]) initWithFormat:v6 error:0];
    inputBus = v5->_inputBus;
    v5->_inputBus = (AUAudioUnitBus *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x263EFC0B0]) initWithFormat:v6 error:0];
    outputBus = v5->_outputBus;
    v5->_outputBus = (AUAudioUnitBus *)v9;

    id v11 = objc_alloc(MEMORY[0x263EFC0B8]);
    v23[0] = v5->_inputBus;
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
    uint64_t v13 = [v11 initWithAudioUnit:v5 busType:1 busses:v12];
    inputBusArray = v5->_inputBusArray;
    v5->_inputBusArray = (AUAudioUnitBusArray *)v13;

    id v15 = objc_alloc(MEMORY[0x263EFC0B8]);
    v22 = v5->_outputBus;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
    uint64_t v17 = [v15 initWithAudioUnit:v5 busType:2 busses:v16];
    outputBusArray = v5->_outputBusArray;
    v5->_outputBusArray = (AUAudioUnitBusArray *)v17;

    atomic_store(0, (unsigned __int8 *)&v5->_hasNotified);
  }
  return v5;
}

- (BOOL)allocateRenderResourcesAndReturnError:(id *)a3
{
  atomic_store(0, (unsigned __int8 *)&self->_hasNotified);
  v5 = [(RENotifierAudioUnit *)self didAllocate];

  if (v5)
  {
    v6 = [(RENotifierAudioUnit *)self didAllocate];
    v6[2]();
  }
  [(AUAudioUnit *)self setRenderResourcesAllocated:1];
  v8.receiver = self;
  v8.super_class = (Class)RENotifierAudioUnit;
  return [(AUAudioUnit *)&v8 allocateRenderResourcesAndReturnError:a3];
}

- (void)deallocateRenderResources
{
  int v3 = [(RENotifierAudioUnit *)self didDeallocate];

  if (v3)
  {
    v4 = [(RENotifierAudioUnit *)self didDeallocate];
    v4[2]();
  }
  [(AUAudioUnit *)self setRenderResourcesAllocated:0];
}

- (void)resetNotifications
{
}

- (BOOL)hasNotified
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_hasNotified);
  return v2 & 1;
}

- (id)internalRenderBlock
{
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__RENotifierAudioUnit_internalRenderBlock__block_invoke;
  aBlock[3] = &unk_264BE2D50;
  objc_copyWeak(&v6, &location);
  aBlock[4] = self;
  int v3 = _Block_copy(aBlock);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

uint64_t __42__RENotifierAudioUnit_internalRenderBlock__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, _DWORD *a6)
{
  WeakRetained = (atomic_uchar *)objc_loadWeakRetained((id *)(a1 + 40));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    char v11 = 0;
    atomic_compare_exchange_strong(WeakRetained + 608, (unsigned __int8 *)&v11, 1u);
    if (!v11)
    {
      v12 = [*(id *)(a1 + 32) firstRender];

      if (v12)
      {
        uint64_t v13 = [*(id *)(a1 + 32) firstRender];
        v13[2]();
      }
    }
    if (*a6)
    {
      unint64_t v14 = 0;
      size_t v15 = 4 * a4;
      uint64_t v16 = 4;
      do
      {
        bzero(*(void **)&a6[v16], v15);
        ++v14;
        v16 += 4;
      }
      while (v14 < *a6);
    }
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = 4294956433;
  }

  return v17;
}

- (id)channelCapabilities
{
  return &unk_26E749DE8;
}

- (id)inputBusses
{
  return self->_inputBusArray;
}

- (id)outputBusses
{
  return self->_outputBusArray;
}

- (id)didAllocate
{
  return self->_didAllocate;
}

- (void)setDidAllocate:(id)a3
{
}

- (id)didDeallocate
{
  return self->_didDeallocate;
}

- (void)setDidDeallocate:(id)a3
{
}

- (id)firstRender
{
  return self->_firstRender;
}

- (void)setFirstRender:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_firstRender, 0);
  objc_storeStrong(&self->_didDeallocate, 0);
  objc_storeStrong(&self->_didAllocate, 0);
  objc_storeStrong((id *)&self->_outputBusArray, 0);
  objc_storeStrong((id *)&self->_outputBus, 0);
  objc_storeStrong((id *)&self->_inputBusArray, 0);
  objc_storeStrong((id *)&self->_inputBus, 0);
}

@end