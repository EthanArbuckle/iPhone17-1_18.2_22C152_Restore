@interface AGXGPURawCounterSourceGroup
- (AGXGPURawCounterSourceGroup)initWithAcceleratorPort:(unsigned int)a3;
- (BOOL)startSampling;
- (BOOL)stopSampling;
- (id)subDivideCounterList:(id)a3 withOptions:(id)a4;
- (unint64_t)sampleMarker;
- (void)dealloc;
- (void)setOptions:(id)a3;
@end

@implementation AGXGPURawCounterSourceGroup

- (id)subDivideCounterList:(id)a3 withOptions:(id)a4
{
  v56[2] = *MEMORY[0x263EF8340];
  if (![a3 count]
    || ((*((uint64_t (**)(AGXGPURawCounter *))self->_impl->var0 + 12))(self->_impl) & 1) != 0)
  {
    return 0;
  }
  v48 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v7 = (void *)[MEMORY[0x263EFF980] array];
  context = (void *)MEMORY[0x2455F4E30]();
  uint64_t v50 = [MEMORY[0x263EFF980] arrayWithCapacity:16];
  v54 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  v56[0] = v54;
  v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  v56[1] = v8;
  v9 = (void *)[MEMORY[0x263EFF980] array];
  if ([a3 count])
  {
    unint64_t v10 = 0;
    unsigned int v11 = 1;
    do
    {
      v12 = v9;
      if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v10), "name"), "hasPrefix:", @"GBL_USC_PROFILE_DATA_") & 1) == 0)
      {
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v10), "name"), "hasPrefix:", @"GRC_SHADER_PROFILER_DATA_"))v12 = v9; {
        else
        }
          v12 = v8;
      }
      objc_msgSend(v12, "addObject:", objc_msgSend(a3, "objectAtIndexedSubscript:", v10));
      unint64_t v10 = v11++;
    }
    while ([a3 count] > v10);
  }
  v13 = v8;
  uint64_t v14 = v50;
  v15 = v54;
  if ([v8 count])
  {
    unint64_t v16 = 0;
    unsigned int v17 = 1;
    do
    {
      int v18 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "objectAtIndexedSubscript:", v16), "name"), "hasPrefix:", @"GRC_");
      uint64_t v19 = [v8 objectAtIndexedSubscript:v16];
      BOOL v20 = v18 == 0;
      v13 = v8;
      if (v20) {
        v21 = v54;
      }
      else {
        v21 = (void *)v50;
      }
      [v21 addObject:v19];
      unint64_t v16 = v17++;
    }
    while ([v8 count] > v16);
  }
  uint64_t v45 = [v54 count];
  v47 = v9;
  if (v45)
  {
    v22 = v13;
    uint64_t v23 = (int)*MEMORY[0x263F3F938];
    int v51 = 0;
    unint64_t v53 = [*(id *)((char *)&self->super.super.isa + v23) count];
    unint64_t v24 = 0x263EFF000uLL;
    v49 = v7;
    while (1)
    {
      v55 = objc_msgSend(*(id *)(v24 + 2432), "arrayWithCapacity:", objc_msgSend(*(id *)((char *)&self->super.super.isa + v23), "count", v45));
      (*((void (**)(AGXGPURawCounter *))self->_impl->var0 + 11))(self->_impl);
      v52 = v22;
      [v22 removeAllObjects];
      if ([*(id *)((char *)&self->super.super.isa + v23) count])
      {
        unint64_t v25 = 0;
        unsigned int v26 = 1;
        do
        {
          int v28 = objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.isa + v23), "objectAtIndexedSubscript:", v25), "requestCounters:firstErrorIndex:", v14, 0);
          v29 = *(void **)(v24 + 2432);
          if (v28) {
            uint64_t v27 = [v29 arrayWithArray:v14];
          }
          else {
            uint64_t v27 = [v29 array];
          }
          [v55 addObject:v27];
          unint64_t v25 = v26++;
        }
        while ([*(id *)((char *)&self->super.super.isa + v23) count] > v25);
      }
      if (![v15 count]) {
        break;
      }
      uint64_t v30 = 0;
      unsigned int v31 = 0;
      uint64_t v32 = 0;
      do
      {
        v33 = v15;
        uint64_t v34 = [v15 objectAtIndexedSubscript:v30];
        unsigned int v35 = v53 > 1;
        unint64_t v36 = v53 > 1;
        if ([*(id *)((char *)&self->super.super.isa + v23) count] > v36)
        {
          unint64_t v36 = v53 > 1;
          unsigned int v37 = v53 > 1;
          while ((objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.isa + v23), "objectAtIndexedSubscript:", v36), "requestCounter:", v34) & 1) == 0)
          {
            unint64_t v36 = ++v37;
            unsigned int v35 = v37;
            if ([*(id *)((char *)&self->super.super.isa + v23) count] <= (unint64_t)v37) {
              goto LABEL_35;
            }
          }
          unsigned int v35 = v37;
        }
LABEL_35:
        uint64_t v38 = [*(id *)((char *)&self->super.super.isa + v23) count];
        if (v53 >= 2
          && v38 == v36
          && objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.isa + v23), "objectAtIndexedSubscript:", 0), "requestCounter:", v34))
        {
          unsigned int v35 = 0;
        }
        v15 = v33;
        if ([*(id *)((char *)&self->super.super.isa + v23) count] <= (unint64_t)v35)
        {
          [v52 addObject:v34];
        }
        else
        {
          objc_msgSend((id)objc_msgSend(v55, "objectAtIndexedSubscript:", v35), "addObject:", v34);
          v32 |= 1 << v35;
        }
        uint64_t v30 = ++v31;
      }
      while ([v33 count] > (unint64_t)v31);
      uint64_t v14 = v50;
      if (!v32) {
        break;
      }
      if ([*(id *)((char *)&self->super.super.isa + v23) count])
      {
        unint64_t v39 = 0;
        unsigned int v40 = 1;
        do
        {
          if ((v32 & (1 << (v40 - 1))) == 0) {
            objc_msgSend((id)objc_msgSend(v55, "objectAtIndexedSubscript:", v39), "removeAllObjects");
          }
          unint64_t v39 = v40++;
        }
        while ([*(id *)((char *)&self->super.super.isa + v23) count] > v39);
      }
      v7 = v49;
      [v49 addObject:v55];
      unint64_t v24 = 0x263EFF000;
      if (![v52 count]) {
        goto LABEL_55;
      }
      v15 = (void *)v56[++v51 & 1];
      v22 = (void *)v56[!(v51 & 1)];
    }
    [v47 addObjectsFromArray:v15];
    v7 = v49;
  }
  else
  {
    uint64_t v41 = (int)*MEMORY[0x263F3F938];
    objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(*(id *)((char *)&self->super.super.isa + v41), "count")));
    if ([*(id *)((char *)&self->super.super.isa + v41) count])
    {
      unsigned int v42 = 1;
      do
        objc_msgSend((id)objc_msgSend(v7, "objectAtIndexedSubscript:", 0, v45), "addObject:", v50);
      while ([*(id *)((char *)&self->super.super.isa + v41) count] > (unint64_t)v42++);
    }
    objc_msgSend(v48, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", 1, v45), @"passNum");
    [v48 setObject:v7 forKeyedSubscript:@"passList"];
    if (![v9 count]) {
      goto LABEL_55;
    }
  }
  objc_msgSend(v48, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v47, "count")), @"invalidNum");
  [v48 setObject:v47 forKeyedSubscript:@"invalidList"];
LABEL_55:
  if (!v45) {
    return v48;
  }
  (*((void (**)(AGXGPURawCounter *))self->_impl->var0 + 11))(self->_impl);
  v6 = v48;
  objc_msgSend(v48, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count")), @"passNum");
  [v48 setObject:v7 forKeyedSubscript:@"passList"];
  return v6;
}

- (BOOL)stopSampling
{
  return (*((uint64_t (**)(void))self->_impl->var0 + 11))();
}

- (BOOL)startSampling
{
  return (*((uint64_t (**)(void))self->_impl->var0 + 10))();
}

- (unint64_t)sampleMarker
{
  return 0x52544E4357525047;
}

- (void)setOptions:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AGXGPURawCounterSourceGroup;
  [(_GPURawCounterSourceGroup *)&v4 setOptions:a3];
  (*((void (**)(AGXGPURawCounter *, void))self->_impl->var0 + 4))(self->_impl, *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F3F930]));
}

- (void)dealloc
{
  if (self->_impl)
  {
    AGXGPURawCounter::destroyInstance((AGXGPURawCounter *)self);
    self->_impl = 0;
  }

  sSourceGroupTriggerList = 0;
  v3.receiver = self;
  v3.super_class = (Class)AGXGPURawCounterSourceGroup;
  [(_GPURawCounterSourceGroup *)&v3 dealloc];
}

- (AGXGPURawCounterSourceGroup)initWithAcceleratorPort:(unsigned int)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v31.receiver = self;
  v31.super_class = (Class)AGXGPURawCounterSourceGroup;
  objc_super v3 = [(_GPURawCounterSourceGroup *)&v31 initWithAcceleratorPort:*(void *)&a3];
  objc_super v4 = v3;
  if (v3)
  {
    uint64_t Instance = AGXGPURawCounter::createInstance((AGXGPURawCounter *)*(unsigned int *)((char *)&v3->super.super.isa
                                                                                    + (int)*MEMORY[0x263F3F918]));
    v4->_impl = (AGXGPURawCounter *)Instance;
    if (Instance)
    {
      memset(v32, 0, sizeof(v32));
      unsigned int v6 = (*(uint64_t (**)(uint64_t, _OWORD *, uint64_t))(*(void *)Instance + 24))(Instance, v32, 64);
      id v30 = objc_alloc(MEMORY[0x263EFF9A0]);
      id v7 = (id)[objc_alloc(MEMORY[0x263F3F900]) initWithName:@"TimerNClock" description:@"Sample every 'n' n-clock ticks" options:&unk_26F4D4A48];
      id v8 = (id)[objc_alloc(MEMORY[0x263F3F900]) initWithName:@"TimerFixed" description:@"Sample every 'n' GPU clock ticks" options:&unk_26F4D4A70];
      id v9 = (id)[objc_alloc(MEMORY[0x263F3F900]) initWithName:@"KickBoundary" description:@"Sample at kick start/end" options:0];
      id v10 = (id)[objc_alloc(MEMORY[0x263F3F900]) initWithName:@"CPMS" description:@"Sample when CPMS buffer is full" options:0];
      id v11 = (id)[objc_alloc(MEMORY[0x263F3F900]) initWithName:@"KickTracing" description:@"Enable APS kick tracing" options:0];
      sSourceGroupTriggerList = objc_msgSend(v30, "initWithObjectsAndKeys:", v7, @"TimerNClock", v8, @"TimerFixed", v9, @"KickBoundary", v10, @"CPMS", v11, @"KickTracing", (id)objc_msgSend(objc_alloc(MEMORY[0x263F3F900]), "initWithName:description:options:", @"KickAndStateTracing", @"Enable APS kick and state tracing", 0), @"KickAndStateTracing",
                                  0);
      uint64_t v12 = v6;
      v13 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v6];
      uint64_t v14 = (void *)MEMORY[0x2455F4E30]();
      if (v6)
      {
        uint64_t v15 = *(void *)&v32[0];
        unsigned int v16 = (*(uint64_t (**)(void))(**(void **)&v32[0] + 176))(*(void *)&v32[0]);
        char v17 = v12 == 1 ? 20 : 19;
        unint64_t v18 = (unint64_t)v16 << v17 >> 26
            ? 0x4000000
            : (unint64_t)(*(unsigned int (**)(void))(**(void **)&v32[0] + 176))(*(void *)&v32[0]) << v17;
        (*(void (**)(uint64_t, unint64_t))(*(void *)v15 + 136))(v15, v18);
        uint64_t v19 = [AGXGPURawCounterSource alloc];
        objc_msgSend(v13, "setObject:atIndexedSubscript:", -[AGXGPURawCounterSource initWithSourceGroup:impl:](v19, "initWithSourceGroup:impl:", v4, *(void *)&v32[0]), 0);
        if (v12 != 1)
        {
          for (uint64_t i = 1; i != v12; ++i)
          {
            uint64_t v29 = *((void *)v32 + i);
            if ((*(unsigned int (**)(uint64_t))(*(void *)v29 + 176))(v29) <= 0x3F) {
              unint64_t v28 = (unint64_t)(*(unsigned int (**)(void))(**((void **)v32 + i) + 176))(*((void *)v32 + i)) << 20;
            }
            else {
              unint64_t v28 = 0x4000000;
            }
            (*(void (**)(uint64_t, unint64_t))(*(void *)v29 + 136))(v29, v28);
            objc_msgSend(v13, "setObject:atIndexedSubscript:", -[AGXGPURawCounterSource initWithSourceGroup:impl:]([AGXGPURawCounterSource alloc], "initWithSourceGroup:impl:", v4, *((void *)v32 + i)), i);
          }
        }
      }
      *(Class *)((char *)&v4->super.super.isa + (int)*MEMORY[0x263F3F938]) = (Class)v13;
      uint64_t v20 = (int)*MEMORY[0x263F3F928];

      if ((MGGetBoolAnswer() & 1) == 0)
      {
        *(Class *)((char *)&v4->super.super.isa + v20) = (Class)(id)[NSString stringWithUTF8String:"AppleGPU"];
LABEL_17:
        id v23 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        char v24 = (*((uint64_t (**)(AGXGPURawCounter *))v4->_impl->var0 + 5))(v4->_impl);
        char v25 = v24;
        if ((v24 & 2) != 0)
        {
          [v23 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"SupportOption_DisableOverlap"];
          v25 &= ~2u;
          if ((v25 & 4) == 0)
          {
LABEL_19:
            if ((v25 & 8) == 0) {
              goto LABEL_20;
            }
            goto LABEL_27;
          }
        }
        else if ((v24 & 4) == 0)
        {
          goto LABEL_19;
        }
        [v23 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"SupportOption_LockGPUPerfState"];
        v25 &= ~4u;
        if ((v25 & 8) == 0)
        {
LABEL_20:
          if ((v25 & 0x10) == 0) {
            goto LABEL_21;
          }
          goto LABEL_28;
        }
LABEL_27:
        [v23 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"SupportOption_DisableMCH"];
        v25 &= ~8u;
        if ((v25 & 0x10) == 0)
        {
LABEL_21:
          if ((v25 & 0x20) == 0)
          {
LABEL_23:
            (*((void (**)(AGXGPURawCounter *, id))v4->_impl->var0 + 14))(v4->_impl, v23);
            *(Class *)((char *)&v4->super.super.isa + (int)*MEMORY[0x263F3F920]) = (Class)v23;
            return v4;
          }
LABEL_22:
          [v23 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"SupportOption_SingleVDMChannel"];
          goto LABEL_23;
        }
LABEL_28:
        [v23 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"SupportOption_ReduceCDMCluster"];
        if ((v25 & 0x20) == 0) {
          goto LABEL_23;
        }
        goto LABEL_22;
      }
      uint64_t v21 = (*((uint64_t (**)(AGXGPURawCounter *))v4->_impl->var0 + 2))(v4->_impl);
      if (v21)
      {
        v22 = (void *)v21;
        *(Class *)((char *)&v4->super.super.isa + v20) = (Class)(id)objc_msgSend(NSString, "stringWithFormat:", @"AppleGPU_%s", v21);
        free(v22);
        goto LABEL_17;
      }
    }

    return 0;
  }
  return v4;
}

@end