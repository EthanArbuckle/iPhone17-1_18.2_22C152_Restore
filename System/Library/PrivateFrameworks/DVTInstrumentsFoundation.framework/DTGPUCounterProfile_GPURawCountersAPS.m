@interface DTGPUCounterProfile_GPURawCountersAPS
+ (id)create:(id)a3 profile:(unint64_t)a4;
- (BOOL)_validateAndConfigureRawCounters;
- (BOOL)isAPS;
- (BOOL)prepare;
- (BOOL)start:(unint64_t)a3 vendorFeatures:(id)a4;
- (DTGPUCounterProfile_GPURawCountersAPS)initWithDevice:(id)a3 profile:(unint64_t)a4;
- (id)counterProfileForHost;
- (id)ringBufferCounts;
- (id)sampleSizes;
- (void)sampleAPS:(id)a3;
- (void)sampleCounters:(unint64_t)a3 callback:(id)a4;
- (void)setAPSCounterConfig:(id)a3;
- (void)stop;
@end

@implementation DTGPUCounterProfile_GPURawCountersAPS

+ (id)create:(id)a3 profile:(unint64_t)a4
{
  id v5 = a3;
  v6 = [[DTGPUCounterProfile_GPURawCountersAPS alloc] initWithDevice:v5 profile:a4];

  return v6;
}

- (DTGPUCounterProfile_GPURawCountersAPS)initWithDevice:(id)a3 profile:(unint64_t)a4
{
  id v7 = a3;
  if ([v7 supportsFamily:1009])
  {
    v15.receiver = self;
    v15.super_class = (Class)DTGPUCounterProfile_GPURawCountersAPS;
    v8 = [(DTGPUCounterProfile *)&v15 initWithProfile:a4 device:v7];
    v9 = v8;
    if (!v8) {
      goto LABEL_4;
    }
    objc_storeStrong((id *)&v8->_device, a3);
    id v10 = v7;
    uint64_t v11 = sub_230916774(v10);
    gpuConfig = v9->_gpuConfig;
    v9->_gpuConfig = (NSDictionary *)v11;

    v13 = (DTGPUCounterProfile_GPURawCountersAPS *)v9->_gpuConfig;
    if (!v13)
    {
      self = v9;
    }
    else
    {
LABEL_4:
      self = v9;
      v13 = self;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)prepare
{
  return MEMORY[0x270F9A6D0](self, sel__validateAndConfigureRawCounters);
}

- (void)setAPSCounterConfig:(id)a3
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v57 = a3;
  v4 = (NSMutableArray *)objc_opt_new();
  rdeSelects = self->_rdeSelects;
  self->_rdeSelects = v4;

  v6 = (NSMutableArray *)objc_opt_new();
  apsSelects = self->_apsSelects;
  v58 = self;
  self->_apsSelects = v6;

  v61 = [v57 objectForKeyedSubscript:@"RawCounterGRCs"];
  unint64_t v8 = 0;
  memset(v82, 0, sizeof(v82));
  int v83 = 1065353216;
  while (v8 < [v61 count])
  {
    v9 = [v61 objectAtIndexedSubscript:v8];
    id v10 = [v9 objectForKeyedSubscript:@"Name"];
    sub_23089D290(v76, (char *)[v10 UTF8String]);
    *(_OWORD *)__p = *(_OWORD *)v76;
    uint64_t v11 = v77;
    v76[1] = 0;
    *(void *)&long long v77 = 0;
    v76[0] = 0;
    *(void *)&long long v80 = v11;
    *((void *)&v80 + 1) = v8;
    sub_230918808((uint64_t)v82, (unsigned __int8 *)__p, (long long *)__p);
    if (SBYTE7(v80) < 0) {
      operator delete(__p[0]);
    }
    if (SBYTE7(v77) < 0) {
      operator delete(v76[0]);
    }

    ++v8;
  }
  *(_OWORD *)__p = 0u;
  long long v80 = 0u;
  int v81 = 1065353216;
  *(_OWORD *)v76 = 0u;
  long long v77 = 0u;
  int v78 = 1065353216;
  GRCReleaseAllCounterSourceGroup();
  v56 = (void *)GRCCopyAllCounterSourceGroup();
  if ([v56 count])
  {
    [v56 firstObject];
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    v55 = long long v73 = 0u;
    v12 = [v55 sourceList];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v72 objects:v85 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v73;
      obuint64_t j = v12;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v73 != v14) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v72 + 1) + 8 * i);
          v17 = [v16 name];
          int v18 = [v17 hasPrefix:@"APS_USC"];

          long long v70 = 0u;
          long long v71 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          v19 = [v16 availableCounters];
          uint64_t v20 = [v19 countByEnumeratingWithState:&v68 objects:v84 count:16];
          if (v20)
          {
            uint64_t v21 = *(void *)v69;
            if (v18) {
              v22 = __p;
            }
            else {
              v22 = v76;
            }
            do
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v69 != v21) {
                  objc_enumerationMutation(v19);
                }
                id v24 = [*(id *)(*((void *)&v68 + 1) + 8 * j) name];
                sub_23089D290(&v65, (char *)[v24 UTF8String]);
                v25 = sub_23090FFDC(v82, (unsigned __int8 *)&v65);
                if (SHIBYTE(v67) < 0) {
                  operator delete(v65);
                }

                if (v25) {
                  sub_230918AD8((uint64_t)v22, (unint64_t *)v25 + 5, (void *)v25 + 5);
                }
              }
              uint64_t v20 = [v19 countByEnumeratingWithState:&v68 objects:v84 count:16];
            }
            while (v20);
          }
        }
        v12 = obj;
        uint64_t v13 = [obj countByEnumeratingWithState:&v72 objects:v85 count:16];
      }
      while (v13);
    }

    v65 = 0;
    v66 = 0;
    uint64_t v67 = 0;
    if ((void)v77)
    {
      uint64_t v26 = 0;
      v27 = (void *)v77;
      v28 = v58;
      do
      {
        ++v26;
        v27 = (void *)*v27;
      }
      while (v27);
    }
    else
    {
      uint64_t v26 = 0;
      v28 = v58;
    }
    sub_230918CF4((uint64_t)&v65, 0, (void *)v77, 0, v26);
    unint64_t v29 = 126 - 2 * __clz((v66 - (unsigned char *)v65) >> 3);
    if (v66 == v65) {
      uint64_t v30 = 0;
    }
    else {
      uint64_t v30 = v29;
    }
    sub_230918F58((unint64_t *)v65, (unint64_t *)v66, v30, 1);
    v62 = 0;
    v63 = 0;
    uint64_t v64 = 0;
    if ((void)v80)
    {
      uint64_t v31 = 0;
      v32 = (void *)v80;
      do
      {
        ++v31;
        v32 = (void *)*v32;
      }
      while (v32);
    }
    else
    {
      uint64_t v31 = 0;
    }
    sub_230918CF4((uint64_t)&v62, 0, (void *)v80, 0, v31);
    unint64_t v33 = 126 - 2 * __clz((v63 - (unsigned char *)v62) >> 3);
    if (v63 == v62) {
      uint64_t v34 = 0;
    }
    else {
      uint64_t v34 = v33;
    }
    sub_23091993C((unint64_t *)v62, (unint64_t *)v63, v34, 1);
    id obja = [(NSDictionary *)v28->_gpuConfig objectForKeyedSubscript:@"RawCounterWidth"];
    v35 = (char *)v65;
    v36 = v66;
    if (v65 != v66)
    {
      do
      {
        v37 = [v61 objectAtIndexedSubscript:*(void *)v35];
        v38 = [v37 objectForKeyedSubscript:@"Name"];
        v39 = (void *)MEMORY[0x263EFF9A0];
        v40 = [v37 objectForKeyedSubscript:@"Options"];
        v41 = [v39 dictionaryWithDictionary:v40];

        uint64_t v42 = [obja objectForKeyedSubscript:v38];
        v43 = (void *)v42;
        v44 = &unk_26E5342E0;
        if (v42) {
          v44 = (void *)v42;
        }
        id v45 = v44;

        [v41 setObject:v45 forKeyedSubscript:@"Width"];
        if (v38)
        {
          v46 = v58->_rdeSelects;
          v47 = (void *)[objc_alloc(MEMORY[0x263F3F8E8]) initWithName:v38 options:v41];
          [(NSMutableArray *)v46 addObject:v47];
        }
        v35 += 8;
      }
      while (v35 != v36);
    }
    v48 = (char *)v62;
    v49 = v63;
    if (v62 != v63)
    {
      do
      {
        v50 = [v61 objectAtIndexedSubscript:*(void *)v48];
        v51 = [v50 objectForKeyedSubscript:@"Name"];
        v52 = [v50 objectForKeyedSubscript:@"Options"];
        if (v51)
        {
          v53 = v58->_apsSelects;
          v54 = (void *)[objc_alloc(MEMORY[0x263F3F8E8]) initWithName:v51 options:v52];
          [(NSMutableArray *)v53 addObject:v54];
        }
        v48 += 8;
      }
      while (v48 != v49);
    }
    GRCReleaseAllCounterSourceGroup();

    if (v62)
    {
      v63 = (char *)v62;
      operator delete(v62);
    }
    if (v65)
    {
      v66 = (char *)v65;
      operator delete(v65);
    }
  }
  sub_230918A8C((uint64_t)v76);
  sub_230918A8C((uint64_t)__p);
  sub_23090F710((uint64_t)v82);
}

- (BOOL)_validateAndConfigureRawCounters
{
  if (![(NSMutableArray *)self->_apsSelects count] && ![(NSMutableArray *)self->_rdeSelects count]) {
    return 0;
  }
  if (!self->_sourceGroup)
  {
    GRCReleaseAllCounterSourceGroup();
    agxSource = (void *)GRCCopyAllCounterSourceGroup();
    if (![agxSource count])
    {
      BOOL v7 = 0;
      goto LABEL_7;
    }
    v4 = [agxSource firstObject];
    sourceGroup = self->_sourceGroup;
    self->_sourceGroup = v4;
  }
  v6 = [[DTGPUAGXCounterSourceGroup alloc] initWithSourceGroup:self->_sourceGroup selects:self->_rdeSelects apsSelects:self->_apsSelects profile:[(DTGPUCounterProfile *)self profile]];
  agxSource = self->_agxSource;
  self->_agxSource = v6;
  BOOL v7 = 1;
LABEL_7:

  return v7;
}

- (BOOL)start:(unint64_t)a3 vendorFeatures:(id)a4
{
  id v6 = a4;
  if (!self->_sourceGroup) {
    goto LABEL_10;
  }
  BOOL v7 = [(NSDictionary *)self->_gpuConfig objectForKeyedSubscript:@"RDESampleInterval"];
  unsigned int v8 = [v7 unsignedIntValue];

  unint64_t v9 = v8;
  if (v8 <= a3) {
    unint64_t v9 = a3;
  }
  unint64_t v10 = v9 ? v9 : 50000;
  if ([(DTGPUAGXCounterSourceGroup *)self->_agxSource request:v10 vendorFeatures:v6]
    && [(GPURawCounterSourceGroup *)self->_sourceGroup startSampling])
  {
    [(DTGPUAGXCounterSourceGroup *)self->_agxSource resume];
    BOOL v11 = 1;
  }
  else
  {
LABEL_10:
    BOOL v11 = 0;
  }

  return v11;
}

- (void)stop
{
  if (self->_sourceGroup)
  {
    [(DTGPUAGXCounterSourceGroup *)self->_agxSource stop];
    [(GPURawCounterSourceGroup *)self->_sourceGroup stopSampling];
    sourceGroup = self->_sourceGroup;
    self->_sourceGroup = 0;

    GRCReleaseAllCounterSourceGroup();
  }
}

- (void)sampleCounters:(unint64_t)a3 callback:(id)a4
{
}

- (void)sampleAPS:(id)a3
{
}

- (id)counterProfileForHost
{
  v46[2] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263EFF9A0];
  v45[0] = @"GPUConfigurationVariables";
  v4 = -[NSDictionary objectForKeyedSubscript:](self->_gpuConfig, "objectForKeyedSubscript:");
  v45[1] = @"AcceleratorID";
  v46[0] = v4;
  id v5 = [NSNumber numberWithUnsignedLongLong:-[MTLDevice registryID](self->_device, "registryID")];
  v46[1] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];
  BOOL v7 = [v3 dictionaryWithDictionary:v6];

  v32 = objc_opt_new();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  unsigned int v8 = [(DTGPUAGXCounterSourceGroup *)self->_agxSource sources];
  obuint64_t j = v8;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v39 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = v12;
          uint64_t v14 = [v13 apsConfig];
          objc_super v15 = [v14 toDictionary];
          [v7 setObject:v15 forKeyedSubscript:@"APSConfig"];

          v16 = NSNumber;
          v17 = [v13 apsConfig];
          int v18 = [v16 numberWithUnsignedInteger:[v17 countPeriod]];
          [v7 setObject:v18 forKeyedSubscript:@"CountPeriod"];

          v19 = NSNumber;
          uint64_t v20 = [v13 apsConfig];
          uint64_t v21 = [v19 numberWithUnsignedInteger:[v20 pulsePeriod]];
          [v7 setObject:v21 forKeyedSubscript:@"PulsePeriod"];

          v22 = NSNumber;
          v23 = [v13 apsConfig];
          id v24 = [v22 numberWithUnsignedInteger:[v23 systemTimePeriod]];
          [v7 setObject:v24 forKeyedSubscript:@"SystemTimePeriod"];
        }
        else
        {
          id v13 = (id)objc_opt_new();
          long long v36 = 0u;
          long long v37 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          v25 = [v12 selects];
          uint64_t v26 = [v25 countByEnumeratingWithState:&v34 objects:v43 count:16];
          if (v26)
          {
            uint64_t v27 = *(void *)v35;
            do
            {
              for (uint64_t j = 0; j != v26; ++j)
              {
                if (*(void *)v35 != v27) {
                  objc_enumerationMutation(v25);
                }
                unint64_t v29 = [*(id *)(*((void *)&v34 + 1) + 8 * j) name];
                [v13 addObject:v29];
              }
              uint64_t v26 = [v25 countByEnumeratingWithState:&v34 objects:v43 count:16];
            }
            while (v26);
          }

          [v32 addObject:v13];
        }
      }
      unsigned int v8 = obj;
      uint64_t v9 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v9);
  }

  if (v32) {
    [v7 setObject:v32 forKeyedSubscript:@"RDERawCounters"];
  }
  uint64_t v42 = v7;
  uint64_t v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v42 count:1];

  return v30;
}

- (id)sampleSizes
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(DTGPUAGXCounterSourceGroup *)self->_agxSource sources];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        unsigned int v8 = NSNumber;
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) selects];
        uint64_t v10 = [v8 numberWithUnsignedInteger:[v9 count]];
        [v3 addObject:v10];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  return v3;
}

- (id)ringBufferCounts
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(DTGPUAGXCounterSourceGroup *)self->_agxSource sources];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        unsigned int v8 = NSNumber;
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) source];
        uint64_t v10 = [v8 numberWithUnsignedInt:[v9 ringBufferNum]];
        [v3 addObject:v10];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  return v3;
}

- (BOOL)isAPS
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rdeSelects, 0);
  objc_storeStrong((id *)&self->_apsSelects, 0);
  objc_storeStrong((id *)&self->_gpuConfig, 0);
  objc_storeStrong((id *)&self->_agxSource, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_sourceGroup, 0);
}

@end