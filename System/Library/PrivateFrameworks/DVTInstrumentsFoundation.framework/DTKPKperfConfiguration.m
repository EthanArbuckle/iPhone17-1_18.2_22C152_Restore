@interface DTKPKperfConfiguration
- (BOOL)hasEnabledKPCClasses;
- (DTKPKDebugCodeSet)queryCodeSet;
- (DTKPKperfConfiguration)init;
- (NSArray)triggers;
- (NSDictionary)providerOptions;
- (id).cxx_construct;
- (id)_disableContextSwitchSampling;
- (id)_enableContextSwitchSampling;
- (id)_reinitializeKperf;
- (id)_validateConfigLocked;
- (id)allTriggerTime;
- (id)apply;
- (id)counterAllocator;
- (id)createTriggerKDebug:(id *)a3;
- (id)createTriggerPMI:(id *)a3;
- (id)createTriggerTime:(id *)a3;
- (id)firstTriggerTime;
- (id)generateConfigWords;
- (id)queryCounterAllocator;
- (id)reset;
- (id)triggerKDebug;
- (id)triggerPMI;
- (unint64_t)bufferSize;
- (unint64_t)collectionInterval;
- (unsigned)collectionMode;
- (unsigned)enabledKPCClasses;
- (void)_disableKdebugCodes;
- (void)_enableKdebugCodes;
- (void)addCodeSet:(id)a3;
- (void)clearAllTriggerTime;
- (void)clearTriggerKDebug;
- (void)clearTriggerPMI;
- (void)clearTriggerTimeAtIndex:(unint64_t)a3;
- (void)setBufferSize:(unint64_t)a3;
- (void)setCollectionInterval:(unint64_t)a3;
- (void)setCollectionMode:(unsigned __int8)a3;
- (void)setProviderOptions:(id)a3;
@end

@implementation DTKPKperfConfiguration

- (DTKPKperfConfiguration)init
{
  v7.receiver = self;
  v7.super_class = (Class)DTKPKperfConfiguration;
  v2 = [(DTKPKperfConfiguration *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(DTKPKperfConfiguration *)v2 setCollectionMode:2];
    uint64_t v4 = objc_opt_new();
    v5 = (void *)*((void *)v3 + 4);
    *((void *)v3 + 4) = v4;
  }
  return v3;
}

- (id)apply
{
  v3 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  uint64_t v41 = 0;
  v42 = (id *)&v41;
  uint64_t v43 = 0x3032000000;
  v44 = sub_2308983A0;
  v45 = sub_2308983B0;
  id v46 = 0;
  uint64_t v4 = [(DTKPKperfConfiguration *)self _validateConfigLocked];
  id v5 = v42[5];
  v42[5] = (id)v4;

  id v6 = v42[5];
  if (v6) {
    goto LABEL_3;
  }
  uint64_t v7 = [(DTKPKperfConfiguration *)self _reinitializeKperf];
  id v8 = v42[5];
  v42[5] = (id)v7;

  id v6 = v42[5];
  if (v6) {
    goto LABEL_3;
  }
  [(DTKPKperfConfiguration *)self bufferSize];
  *((void *)self + 16) = (uint64_t)(int)kperf_logging_set_size() << 6;
  if ([(DTKPKperfConfiguration *)self collectionMode] - 1 <= 2) {
    kperf_logging_set_wrap();
  }
  [(DTKPKperfConfiguration *)self _enableKdebugCodes];
  if (*((void *)self + 1))
  {
    uint64_t v11 = [(DTKPKperfConfiguration *)self _enableContextSwitchSampling];
    id v12 = v42[5];
    v42[5] = (id)v11;

    id v6 = v42[5];
    if (v6) {
      goto LABEL_3;
    }
  }
  if ([*((id *)self + 14) pmcEventCount])
  {
    v13 = (void *)*((void *)self + 14);
    v14 = v42;
    id v40 = v42[5];
    [v13 forceCounters:&v40];
    objc_storeStrong(v14 + 5, v40);
    v15 = v42 + 5;
    id v6 = v42[5];
    if (v6
      || (v16 = (void *)*((void *)self + 14),
          id v39 = 0,
          [v16 configureHardwareCounters:&v39],
          objc_storeStrong(v15, v39),
          (id v6 = v42[5]) != 0))
    {
LABEL_3:
      id v9 = v6;
      goto LABEL_4;
    }
  }
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = sub_2308983A0;
  v37 = sub_2308983B0;
  id v38 = [MEMORY[0x263EFF980] array];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = sub_2308983B8;
  v31 = sub_2308983E4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_2308983EC;
  aBlock[3] = &unk_264B8E1B0;
  aBlock[4] = &v33;
  id v32 = _Block_copy(aBlock);
  v17 = (void *)*((void *)self + 2);
  if (v17)
  {
    v18 = v42;
    id obj = v42[5];
    [v17 start:&obj];
    objc_storeStrong(v18 + 5, obj);
    [(id)v34[5] addObject:*((void *)self + 2)];
    if (v42[5]) {
      goto LABEL_18;
    }
  }
  v19 = (void *)*((void *)self + 3);
  if (v19
    && (v20 = v42,
        id v24 = v42[5],
        [v19 start:&v24],
        objc_storeStrong(v20 + 5, v24),
        [(id)v34[5] addObject:*((void *)self + 3)],
        v42[5]))
  {
LABEL_18:
    (*(void (**)(void))(v28[5] + 16))();
    id v21 = v42[5];
  }
  else
  {
    if (![*((id *)self + 4) count]) {
      goto LABEL_22;
    }
    v22 = (void *)*((void *)self + 4);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = sub_230898408;
    v23[3] = &unk_264B8E1D8;
    v23[4] = &v41;
    v23[5] = &v33;
    v23[6] = &v27;
    [v22 enumerateObjectsUsingBlock:v23];
    id v21 = v42[5];
    if (!v21)
    {
LABEL_22:
      id v9 = 0;
      goto LABEL_23;
    }
  }
  id v9 = v21;
LABEL_23:
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
LABEL_4:
  _Block_object_dispose(&v41, 8);

  std::mutex::unlock(v3);
  return v9;
}

- (id)reset
{
  v3 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_2308983A0;
  v22 = sub_2308983B0;
  id v23 = 0;
  uint64_t v4 = (void *)*((void *)self + 14);
  id obj = 0;
  [v4 unforceCounters:&obj];
  objc_storeStrong(&v23, obj);
  id v5 = (void *)*((void *)self + 4);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_230898690;
  v16[3] = &unk_264B8E200;
  v16[4] = &v18;
  [v5 enumerateObjectsUsingBlock:v16];
  id v6 = (void *)*((void *)self + 3);
  if (v6)
  {
    uint64_t v7 = (id *)(v19 + 5);
    id v15 = (id)v19[5];
    [v6 stop:&v15];
    objc_storeStrong(v7, v15);
  }
  id v8 = (void *)*((void *)self + 2);
  if (v8)
  {
    id v9 = (id *)(v19 + 5);
    id v14 = (id)v19[5];
    [v8 stop:&v14];
    objc_storeStrong(v9, v14);
  }
  if (*((void *)self + 1))
  {
    uint64_t v10 = [(DTKPKperfConfiguration *)self _disableContextSwitchSampling];
    uint64_t v11 = (void *)v19[5];
    v19[5] = v10;
  }
  [(DTKPKperfConfiguration *)self _disableKdebugCodes];
  kperf_reset();
  id v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  std::mutex::unlock(v3);
  return v12;
}

- (NSArray)triggers
{
  v3 = (void *)*((void *)self + 5);
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    id v5 = (void *)*((void *)self + 5);
    *((void *)self + 5) = v4;

    if (*((void *)self + 4)) {
      [*((id *)self + 5) addObjectsFromArray:];
    }
    if (*((void *)self + 3)) {
      [*((id *)self + 5) addObject:];
    }
    v3 = (void *)*((void *)self + 5);
    if (*((void *)self + 2))
    {
      [v3 addObject:];
      v3 = (void *)*((void *)self + 5);
    }
  }
  return (NSArray *)v3;
}

- (unsigned)enabledKPCClasses
{
  v3 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  uint64_t v4 = (void *)*((void *)self + 14);
  if (v4) {
    unsigned int v5 = [v4 kpcClasses];
  }
  else {
    unsigned int v5 = 0;
  }
  std::mutex::unlock(v3);
  return v5;
}

- (BOOL)hasEnabledKPCClasses
{
  return *((void *)self + 14) != 0;
}

- (id)counterAllocator
{
  v3 = (void *)*((void *)self + 14);
  if (!v3)
  {
    id v11 = 0;
    uint64_t v4 = +[DTKPCPU localCPU:&v11];
    id v5 = v11;
    if (v4)
    {
      id v10 = v5;
      id v6 = [[DTKPCPUCounterAllocator alloc] initWithCPU:v4 error:&v10];
      id v7 = v10;

      id v8 = (void *)*((void *)self + 14);
      *((void *)self + 14) = v6;

      id v5 = v7;
    }

    v3 = (void *)*((void *)self + 14);
  }
  return v3;
}

- (id)queryCounterAllocator
{
  return *((id *)self + 14);
}

- (void)addCodeSet:(id)a3
{
  id v5 = a3;
  id v8 = (void *)*((void *)self + 1);
  id v7 = (id *)((char *)self + 8);
  id v6 = v8;
  id v9 = v5;
  if (v8) {
    [v6 addCodeSet];
  }
  else {
    objc_storeStrong(v7, a3);
  }
}

- (void)_enableKdebugCodes
{
  if (*((void *)self + 1))
  {
    kperf_logging_set_kdebug();
    uint64_t v3 = [*((id *)self + 1) createFilterMask:0];
    kperf_logging_set_typefilter();
    +[DTKPKDebugCodeSet releaseFilterMask:v3];
  }
  else
  {
    kperf_logging_set_kdebug();
  }
}

- (DTKPKDebugCodeSet)queryCodeSet
{
  return (DTKPKDebugCodeSet *)*((id *)self + 1);
}

- (void)_disableKdebugCodes
{
}

- (id)_enableContextSwitchSampling
{
  if (kperf_kdbg_cswitch_set())
  {
    v2 = sub_230898A14(@"Context switch sampling couldn't be enabled.", -1);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_disableContextSwitchSampling
{
  if (kperf_kdbg_cswitch_set())
  {
    v2 = sub_230898A14(@"Context switch sampling couldn't be disabled.", -1);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)createTriggerKDebug:(id *)a3
{
  id v5 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  id v6 = (void *)*((void *)self + 2);
  if (v6)
  {
    if (a3)
    {
      sub_230898A14(@"A kdebug trigger already exists. DTKPKperfConfiguration doesn't support creation of multiple kdebug triggers.", -510);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      id v6 = (void *)*((void *)self + 2);
    }
    id v7 = v6;
  }
  else
  {
    id v7 = [[DTKPTriggerKDebug alloc] initWithCounterAllocatorProvider:self];
    objc_storeStrong((id *)self + 2, v7);
  }
  std::mutex::unlock(v5);
  return v7;
}

- (id)createTriggerPMI:(id *)a3
{
  id v5 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  id v6 = (void *)*((void *)self + 3);
  if (v6)
  {
    if (a3)
    {
      sub_230898A14(@"A PMI trigger already exists. DTKPKperfConfiguration doesn't support creation of multiple PMI triggers.", -510);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      id v6 = (void *)*((void *)self + 3);
    }
    id v7 = v6;
  }
  else
  {
    id v7 = [[DTKPTriggerPMI alloc] initWithCounterAllocatorProvider:self];
    objc_storeStrong((id *)self + 3, v7);
  }
  std::mutex::unlock(v5);
  return v7;
}

- (id)createTriggerTime:(id *)a3
{
  uint64_t v4 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  id v5 = [[DTKPTriggerTime alloc] initWithCounterAllocatorProvider:self];
  if (v5) {
    [*((id *)self + 4) addObject:v5];
  }
  std::mutex::unlock(v4);
  return v5;
}

- (void)clearTriggerKDebug
{
  uint64_t v3 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  uint64_t v4 = (void *)*((void *)self + 2);
  *((void *)self + 2) = 0;

  std::mutex::unlock(v3);
}

- (void)clearTriggerPMI
{
  uint64_t v3 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  uint64_t v4 = (void *)*((void *)self + 3);
  *((void *)self + 3) = 0;

  std::mutex::unlock(v3);
}

- (void)clearTriggerTimeAtIndex:(unint64_t)a3
{
  id v5 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  if ([*((id *)self + 4) count] > a3) {
    [*((id *)self + 4) removeObjectAtIndex:a3];
  }
  std::mutex::unlock(v5);
}

- (void)clearAllTriggerTime
{
  uint64_t v3 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  uint64_t v4 = objc_opt_new();
  id v5 = (void *)*((void *)self + 4);
  *((void *)self + 4) = v4;

  std::mutex::unlock(v3);
}

- (id)triggerKDebug
{
  uint64_t v3 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  id v4 = *((id *)self + 2);
  std::mutex::unlock(v3);
  return v4;
}

- (id)triggerPMI
{
  uint64_t v3 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  id v4 = *((id *)self + 3);
  std::mutex::unlock(v3);
  return v4;
}

- (id)firstTriggerTime
{
  uint64_t v3 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  id v4 = [*((id *)self + 4) firstObject];
  std::mutex::unlock(v3);
  return v4;
}

- (id)allTriggerTime
{
  uint64_t v3 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  id v4 = (void *)[*((id *)self + 4) copy];
  std::mutex::unlock(v3);
  return v4;
}

- (void)setBufferSize:(unint64_t)a3
{
  id v4 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  *((void *)self + 16) = (uint64_t)(int)kperf_logging_query_size() << 6;
  std::mutex::unlock(v4);
}

- (id)generateConfigWords
{
  uint64_t v3 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  id v4 = malloc_type_calloc(0x14uLL, 8uLL, 0x100004000313F17uLL);
  *id v4 = 256;
  v4[1] = [(DTKPKperfConfiguration *)self collectionMode];
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  id v5 = (void *)*((void *)self + 4);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_230899344;
  v16[3] = &unk_264B8E200;
  v16[4] = &v17;
  [v5 enumerateObjectsUsingBlock:v16];
  v4[2] = *((unsigned __int8 *)v18 + 24);
  v4[3] = *((void *)self + 2) != 0;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  id v6 = (void *)*((void *)self + 3);
  if (v6 && [v6 pmcEventCount])
  {
    uint64_t v7 = [*((id *)self + 3) _recordConfigWordsIntoBuffer:&v4[v13[3] + 4]];
    v13[3] += v7;
  }
  id v8 = (void *)*((void *)self + 4);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_230899388;
  v11[3] = &unk_264B8E228;
  v11[4] = &v12;
  v11[5] = v4;
  [v8 enumerateObjectsUsingBlock:v11];
  id v9 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v4 length:((v13[3] << 32) + 0x400000000) >> 29 freeWhenDone:1];
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v17, 8);
  std::mutex::unlock(v3);
  return v9;
}

- (id)_reinitializeKperf
{
  if (kperf_reset())
  {
    v2 = NSString;
    uint64_t v3 = __error();
    id v4 = [v2 stringWithFormat:@"Could not reset kperf (%s).", strerror(*v3)];
    sub_230898A14(v4, -6);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = 0;
    +[DTKPTrigger reinitializeKperf:&v9];
    id v6 = v9;
    if (!v6)
    {
      id v8 = 0;
      +[DTKPTriggerTime reinitializeKperf:&v8];
      id v6 = v8;
    }
    id v5 = v6;
  }
  return v5;
}

- (id)_validateConfigLocked
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = sub_2308983A0;
  uint64_t v18 = sub_2308983B0;
  id v19 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  char v13 = 0;
  uint64_t v3 = (void *)*((void *)self + 4);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_2308996F8;
  v11[3] = &unk_264B8E250;
  v11[4] = v12;
  v11[5] = &v14;
  [v3 enumerateObjectsUsingBlock:v11];
  id v4 = (void *)v15[5];
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    char v10 = 0;
    char v10 = [*((id *)self + 3) requestsPMCSampling];
    id v6 = (void *)*((void *)self + 4);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = sub_2308997A8;
    v8[3] = &unk_264B8E250;
    v8[4] = v9;
    v8[5] = &v14;
    [v6 enumerateObjectsUsingBlock:v8];
    id v5 = (id)v15[5];
    _Block_object_dispose(v9, 8);
  }
  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v14, 8);

  return v5;
}

- (unsigned)collectionMode
{
  return *((unsigned char *)self + 120);
}

- (void)setCollectionMode:(unsigned __int8)a3
{
  *((unsigned char *)self + 120) = a3;
}

- (unint64_t)bufferSize
{
  return *((void *)self + 16);
}

- (NSDictionary)providerOptions
{
  return (NSDictionary *)*((void *)self + 17);
}

- (void)setProviderOptions:(id)a3
{
}

- (unint64_t)collectionInterval
{
  return *((void *)self + 18);
}

- (void)setCollectionInterval:(unint64_t)a3
{
  *((void *)self + 18) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 17, 0);
  objc_storeStrong((id *)self + 14, 0);
  std::mutex::~mutex((std::mutex *)((char *)self + 48));
  objc_storeStrong((id *)self + 5, 0);
  objc_storeStrong((id *)self + 4, 0);
  objc_storeStrong((id *)self + 3, 0);
  objc_storeStrong((id *)self + 2, 0);
  objc_storeStrong((id *)self + 1, 0);
}

- (id).cxx_construct
{
  *((void *)self + 6) = 850045863;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *((void *)self + 13) = 0;
  return self;
}

@end