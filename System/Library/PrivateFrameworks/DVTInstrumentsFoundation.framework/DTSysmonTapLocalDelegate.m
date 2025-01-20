@interface DTSysmonTapLocalDelegate
- (BOOL)canFetchWhileArchiving;
- (DTSysmonTapLocalDelegate)initWithConfig:(id)a3;
- (id)_getSessionMetadata;
- (id)validateConfig;
- (void)_addCPUUsageToSample:(id)a3;
- (void)_addSample:(id)a3;
- (void)_createAttributesSample;
- (void)_handleSysmonCoalitionTable:(id)a3 startTime:(unint64_t)a4 endTime:(unint64_t)a5;
- (void)_handleSysmonProcessTable:(id)a3 startTime:(unint64_t)a4 endTime:(unint64_t)a5;
- (void)_handleSysmonSystemTable:(id)a3 startTime:(unint64_t)a4 endTime:(unint64_t)a5;
- (void)_purgeOldSamplesForCurrentTime:(unint64_t)a3;
- (void)dealloc;
- (void)fetchDataForReason:(unint64_t)a3 block:(id)a4;
- (void)setTap:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation DTSysmonTapLocalDelegate

- (id)_getSessionMetadata
{
  return (id)MEMORY[0x263EFFA78];
}

- (DTSysmonTapLocalDelegate)initWithConfig:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)DTSysmonTapLocalDelegate;
  v6 = [(DTSysmonTapLocalDelegate *)&v21 init];
  v7 = v6;
  if (v6)
  {
    if (!v5) {
      sub_23093EBE0();
    }
    objc_storeStrong((id *)&v6->_config, a3);
    uint64_t v8 = [(DTSysmonTapConfig *)v7->_config pids];
    pidFilter = v7->_pidFilter;
    v7->_pidFilter = (NSSet *)v8;

    uint64_t v10 = [(DTTapConfig *)v7->_config bufferMode];
    v7->_isWindowed = v10 == 2;
    if (v10 == 2)
    {
      mach_timebase_info info = 0;
      mach_timebase_info(&info);
      unint64_t v11 = [(DTTapConfig *)v7->_config windowSize];
      unint64_t v12 = ((3 * v11) >> 1) * info.denom / info.numer;
      v7->_purgeEveryNTicks = (v11 >> 1) * info.denom / info.numer;
      v7->_effectiveWindowSize = v12;
    }
    dispatch_queue_t v13 = dispatch_queue_create("SysmonTap Process Queue", 0);
    serialQ = v7->_serialQ;
    v7->_serialQ = (OS_dispatch_queue *)v13;

    dispatch_semaphore_t v15 = dispatch_semaphore_create(1);
    samplesLock = v7->_samplesLock;
    v7->_samplesLock = (OS_dispatch_semaphore *)v15;

    uint64_t v17 = objc_opt_new();
    samples = v7->_samples;
    v7->_samples = (NSMutableArray *)v17;
  }
  return v7;
}

- (void)dealloc
{
  savedTicks = self->_savedTicks;
  if (savedTicks)
  {
    mach_vm_deallocate(*MEMORY[0x263EF8960], (mach_vm_address_t)savedTicks, 16 * self->_cpuCount);
    self->_savedTicks = 0;
  }
  pollTimer = self->_pollTimer;
  if (pollTimer)
  {
    dispatch_source_cancel(pollTimer);
    id v5 = self->_pollTimer;
    self->_pollTimer = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)DTSysmonTapLocalDelegate;
  [(DTSysmonTapLocalDelegate *)&v6 dealloc];
}

- (id)validateConfig
{
  v3 = objc_opt_new();
  v4 = [(DTSysmonTapConfig *)self->_config processAttributes];

  if (v4)
  {
    id v5 = +[DTSysmonTapSupportedAttributes localProcessAttributes];
    objc_super v6 = objc_opt_new();
    uint64_t v49 = 0;
    v50 = &v49;
    uint64_t v51 = 0x2020000000;
    char v52 = 0;
    v7 = [(DTSysmonTapConfig *)self->_config processAttributes];
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = sub_2309130C0;
    v45[3] = &unk_264B906F0;
    id v8 = v5;
    id v46 = v8;
    id v9 = v6;
    id v47 = v9;
    v48 = &v49;
    [v7 enumerateObjectsUsingBlock:v45];

    if (!*((unsigned char *)v50 + 24)) {
      [v3 addObject:@"Missing the 'pid' process attribute."];
    }
    if ([v9 count])
    {
      uint64_t v10 = NSString;
      unint64_t v11 = [v9 componentsJoinedByString:@", "];
      unint64_t v12 = [v10 stringWithFormat:@"Unknown process attributes: %@.", v11];
      [v3 addObject:v12];
    }
    _Block_object_dispose(&v49, 8);
  }
  dispatch_queue_t v13 = [(DTSysmonTapConfig *)self->_config systemAttributes];

  if (v13)
  {
    v14 = +[DTSysmonTapSupportedAttributes localSystemAttributes];
    dispatch_semaphore_t v15 = objc_opt_new();
    v16 = [(DTSysmonTapConfig *)self->_config systemAttributes];
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = sub_230913154;
    v42[3] = &unk_264B90288;
    id v17 = v14;
    id v43 = v17;
    id v18 = v15;
    id v44 = v18;
    [v16 enumerateObjectsUsingBlock:v42];

    if ([v18 count])
    {
      v19 = NSString;
      v20 = [v18 componentsJoinedByString:@", "];
      objc_super v21 = [v19 stringWithFormat:@"Unknown system attributes: %@.", v20];
      [v3 addObject:v21];
    }
  }
  v22 = [(DTSysmonTapConfig *)self->_config coalitionAttributes];

  if (v22)
  {
    v23 = +[DTSysmonTapSupportedAttributes localCoalitionAttributes];
    v24 = objc_opt_new();
    uint64_t v49 = 0;
    v50 = &v49;
    uint64_t v51 = 0x2020000000;
    char v52 = 0;
    v25 = [(DTSysmonTapConfig *)self->_config coalitionAttributes];
    uint64_t v35 = MEMORY[0x263EF8330];
    uint64_t v36 = 3221225472;
    v37 = sub_2309131B4;
    v38 = &unk_264B906F0;
    id v26 = v23;
    id v39 = v26;
    id v27 = v24;
    id v40 = v27;
    v41 = &v49;
    [v25 enumerateObjectsUsingBlock:&v35];

    if (!*((unsigned char *)v50 + 24)) {
      [v3 addObject:@"Missing the 'cid' coalition attribute."];
    }
    if ([v27 count])
    {
      v28 = NSString;
      v29 = [v27 componentsJoinedByString:@", "];
      v30 = [v28 stringWithFormat:@"Unknown coalition attributes: %@.", v29, v35, v36, v37, v38, v39];
      [v3 addObject:v30];
    }
    _Block_object_dispose(&v49, 8);
  }
  if ([v3 count])
  {
    v31 = [DTTapStatusMemo alloc];
    v32 = [v3 componentsJoinedByString:@" "];
    v33 = [(DTTapStatusMemo *)v31 initWithStatus:0x80000000 notice:v32];
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (void)setTap:(id)a3
{
  id v4 = a3;
  if (!v4) {
    sub_23093EC0C();
  }
  id v5 = v4;
  objc_storeWeak((id *)&self->_tap, v4);
}

- (void)_addSample:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_samplesLock, 0xFFFFFFFFFFFFFFFFLL);
  [(NSMutableArray *)self->_samples addObject:v4];
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_samplesLock);
}

- (void)_addCPUUsageToSample:(id)a3
{
  v34[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  *(void *)out_processor_infoCnt = 0;
  out_processor_mach_timebase_info info = 0;
  host_t v5 = MEMORY[0x230FC1EC0]();
  if (!host_processor_info(v5, 2, out_processor_infoCnt, &out_processor_info, &out_processor_infoCnt[1]))
  {
    id v27 = [MEMORY[0x263EFF980] array];
    if (out_processor_infoCnt[0])
    {
      unint64_t v6 = 0;
      unsigned int v28 = 0;
      double v7 = 0.0;
      double v8 = 0.0;
      do
      {
        uint32x4_t v9 = (uint32x4_t)vsubq_s32(*(int32x4_t *)&out_processor_info[4 * v6], (int32x4_t)self->_savedTicks[v6]);
        unint64_t v10 = vaddlvq_u32(v9);
        if (v10)
        {
          double v11 = 100.0 - (double)v9.u32[2] / (double)v10 * 100.0;
          double v12 = (double)v9.u32[3] / (double)v10 * 100.0;
          ++v28;
        }
        else
        {
          double v11 = 0.0;
          double v12 = 0.0;
        }
        v33[0] = @"CPU_TotalLoad";
        dispatch_queue_t v13 = [NSNumber numberWithDouble:v11];
        v34[0] = v13;
        v33[1] = @"CPU_UserLoad";
        v14 = [NSNumber numberWithDouble:-1.0];
        v34[1] = v14;
        v33[2] = @"CPU_SystemLoad";
        dispatch_semaphore_t v15 = [NSNumber numberWithDouble:-1.0];
        v34[2] = v15;
        v33[3] = @"CPU_NiceLoad";
        v16 = [NSNumber numberWithDouble:v12];
        v34[3] = v16;
        id v17 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:4];
        [v27 insertObject:v17 atIndex:0];

        double v7 = v7 + v11;
        double v8 = v8 + v12;
        ++v6;
      }
      while (v6 < out_processor_infoCnt[0]);
    }
    else
    {
      unsigned int v28 = 0;
      double v8 = 0.0;
      double v7 = 0.0;
    }
    mach_vm_deallocate(*MEMORY[0x263EF8960], (mach_vm_address_t)self->_savedTicks->cpu_ticks, 16 * self->_cpuCount);
    self->_savedTicks = (processor_cpu_load_info *)out_processor_info;
    v31[0] = @"CPU_TotalLoad";
    id v18 = [NSNumber numberWithDouble:v7];
    v32[0] = v18;
    v31[1] = @"CPU_UserLoad";
    v19 = [NSNumber numberWithDouble:-1.0];
    v32[1] = v19;
    v31[2] = @"CPU_SystemLoad";
    v20 = [NSNumber numberWithDouble:-1.0];
    v32[2] = v20;
    v31[3] = @"CPU_NiceLoad";
    objc_super v21 = [NSNumber numberWithDouble:v8];
    v32[3] = v21;
    v22 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:4];

    v23 = [NSNumber numberWithUnsignedInt:out_processor_infoCnt[0]];
    [v4 setObject:v23 forKeyedSubscript:@"CPUCount"];

    v24 = [NSNumber numberWithInt:v28];
    [v4 setObject:v24 forKeyedSubscript:@"EnabledCPUs"];

    [v4 setObject:v27 forKeyedSubscript:@"PerCPUUsage"];
    [v4 setObject:v22 forKeyedSubscript:@"SystemCPUUsage"];
    v25 = [v4 objectForKeyedSubscript:@"Type"];
    LODWORD(v19) = [v25 unsignedIntValue];

    id v26 = [NSNumber numberWithUnsignedInt:v19 | 0x20];
    [v4 setObject:v26 forKeyedSubscript:@"Type"];
  }
}

- (void)_handleSysmonProcessTable:(id)a3 startTime:(unint64_t)a4 endTime:(unint64_t)a5
{
  id v8 = a3;
  uint32x4_t v9 = objc_opt_new();
  unint64_t v10 = objc_opt_new();
  [v9 setObject:&unk_26E534268 forKeyedSubscript:@"Type"];
  [v9 setObject:v10 forKeyedSubscript:@"Processes"];
  double v11 = [NSNumber numberWithUnsignedLongLong:a4];
  [v9 setObject:v11 forKeyedSubscript:@"StartMachAbsTime"];

  double v12 = [NSNumber numberWithUnsignedLongLong:a5];
  [v9 setObject:v12 forKeyedSubscript:@"EndMachAbsTime"];

  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_230913A34;
  v30 = &unk_264B90740;
  v31 = self;
  id v13 = v10;
  id v32 = v13;
  sysmon_table_apply();

  v14 = (void *)[v13 copy];
  processesFromLastSample = self->_processesFromLastSample;
  if (processesFromLastSample)
  {
    v16 = [(NSDictionary *)processesFromLastSample allKeys];
    id v17 = (void *)[v16 mutableCopy];

    id v18 = [v13 allKeys];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = sub_230914174;
    v23[3] = &unk_264B90768;
    id v19 = v17;
    id v24 = v19;
    id v25 = v13;
    id v26 = self;
    [v18 enumerateObjectsUsingBlock:v23];

    if ([v19 count])
    {
      v20 = [v19 allObjects];
      [v9 setObject:v20 forKeyedSubscript:@"DeadProcesses"];
    }
  }
  objc_storeStrong((id *)&self->_processesFromLastSample, v14);
  if (self->_isWindowed && !self->_processesAtWindowBeginning)
  {
    objc_super v21 = (NSMutableDictionary *)[v9 mutableCopy];
    processesAtWindowBeginning = self->_processesAtWindowBeginning;
    self->_processesAtWindowBeginning = v21;
  }
  else
  {
    [(DTSysmonTapLocalDelegate *)self _addSample:v9];
  }
  if (self->_isWindowed && self->_purgeEveryNTicks + self->_lastWindowPurgeTime < a5) {
    [(DTSysmonTapLocalDelegate *)self _purgeOldSamplesForCurrentTime:a5];
  }
}

- (void)_handleSysmonSystemTable:(id)a3 startTime:(unint64_t)a4 endTime:(unint64_t)a5
{
  id v8 = a3;
  uint32x4_t v9 = objc_opt_new();
  unint64_t v10 = objc_opt_new();
  [v9 setObject:&unk_26E534280 forKeyedSubscript:@"Type"];
  double v11 = [NSNumber numberWithUnsignedLongLong:a4];
  [v9 setObject:v11 forKeyedSubscript:@"StartMachAbsTime"];

  double v12 = [NSNumber numberWithUnsignedLongLong:a5];
  [v9 setObject:v12 forKeyedSubscript:@"EndMachAbsTime"];

  uint64_t v16 = MEMORY[0x263EF8330];
  id v13 = v10;
  sysmon_table_apply();

  if ([v13 count:v16 3221225472 sub_23091441C:unk_264B90740 self]) {
    [v9 setObject:v13 forKeyedSubscript:@"System"];
  }
  if ([(DTSysmonTapConfig *)self->_config sampleCPUUsage]) {
    [(DTSysmonTapLocalDelegate *)self _addCPUUsageToSample:v9];
  }
  if (self->_isWindowed && !self->_systemAtWindowBeginning)
  {
    v14 = (NSMutableDictionary *)[v9 mutableCopy];
    systemAtWindowBeginning = self->_systemAtWindowBeginning;
    self->_systemAtWindowBeginning = v14;
  }
  else
  {
    [(DTSysmonTapLocalDelegate *)self _addSample:v9];
  }
  if (self->_isWindowed && self->_purgeEveryNTicks + self->_lastWindowPurgeTime < a5) {
    [(DTSysmonTapLocalDelegate *)self _purgeOldSamplesForCurrentTime:a5];
  }
}

- (void)_handleSysmonCoalitionTable:(id)a3 startTime:(unint64_t)a4 endTime:(unint64_t)a5
{
  id v8 = a3;
  uint32x4_t v9 = objc_opt_new();
  unint64_t v10 = objc_opt_new();
  [v9 setObject:&unk_26E534298 forKeyedSubscript:@"Type"];
  [v9 setObject:v10 forKeyedSubscript:@"Coalitions"];
  double v11 = [NSNumber numberWithUnsignedLongLong:a4];
  [v9 setObject:v11 forKeyedSubscript:@"StartMachAbsTime"];

  double v12 = [NSNumber numberWithUnsignedLongLong:a5];
  [v9 setObject:v12 forKeyedSubscript:@"EndMachAbsTime"];

  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_230914964;
  v30 = &unk_264B90740;
  v31 = self;
  id v13 = v10;
  id v32 = v13;
  sysmon_table_apply();

  v14 = (void *)[v13 copy];
  coalitionsFromLastSample = self->_coalitionsFromLastSample;
  if (coalitionsFromLastSample)
  {
    uint64_t v16 = [(NSDictionary *)coalitionsFromLastSample allKeys];
    id v17 = (void *)[v16 mutableCopy];

    id v18 = [v13 allKeys];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = sub_230914B9C;
    v23[3] = &unk_264B90768;
    id v19 = v17;
    id v24 = v19;
    id v25 = self;
    id v26 = v13;
    [v18 enumerateObjectsUsingBlock:v23];

    if ([v19 count])
    {
      v20 = [v19 allObjects];
      [v9 setObject:v20 forKeyedSubscript:@"DeadCoalitions"];
    }
  }
  objc_storeStrong((id *)&self->_coalitionsFromLastSample, v14);
  if (self->_isWindowed && !self->_coalitionsAtWindowBeginning)
  {
    objc_super v21 = (NSMutableDictionary *)[v9 mutableCopy];
    coalitionsAtWindowBeginning = self->_coalitionsAtWindowBeginning;
    self->_coalitionsAtWindowBeginning = v21;
  }
  else
  {
    [(DTSysmonTapLocalDelegate *)self _addSample:v9];
  }
  if (self->_isWindowed && self->_purgeEveryNTicks + self->_lastWindowPurgeTime < a5) {
    [(DTSysmonTapLocalDelegate *)self _purgeOldSamplesForCurrentTime:a5];
  }
}

- (void)_createAttributesSample
{
  v3 = (NSMutableDictionary *)objc_opt_new();
  newAttributesSample = self->_newAttributesSample;
  self->_newAttributesSample = v3;

  host_t v5 = [(DTSysmonTapConfig *)self->_config processAttributes];

  if (v5)
  {
    unint64_t v6 = [(DTSysmonTapConfig *)self->_config processAttributes];
    [(NSMutableDictionary *)self->_newAttributesSample setObject:v6 forKeyedSubscript:@"ProcessesAttributes"];
  }
  double v7 = [(DTSysmonTapConfig *)self->_config systemAttributes];

  if (v7)
  {
    id v8 = [(DTSysmonTapConfig *)self->_config systemAttributes];
    [(NSMutableDictionary *)self->_newAttributesSample setObject:v8 forKeyedSubscript:@"SystemAttributes"];
  }
  uint32x4_t v9 = [(DTSysmonTapConfig *)self->_config coalitionAttributes];

  if (v9)
  {
    unint64_t v10 = [(DTSysmonTapConfig *)self->_config coalitionAttributes];
    [(NSMutableDictionary *)self->_newAttributesSample setObject:v10 forKeyedSubscript:@"CoalitionAttributes"];
  }
  double v11 = self->_newAttributesSample;
  [(NSMutableDictionary *)v11 setObject:&unk_26E5342B0 forKeyedSubscript:@"Type"];
}

- (void)_purgeOldSamplesForCurrentTime:(unint64_t)a3
{
  unint64_t effectiveWindowSize = self->_effectiveWindowSize;
  uint64_t v6 = [(NSMutableArray *)self->_samples count];
  if (!v6) {
    goto LABEL_17;
  }
  uint64_t v7 = v6;
  uint64_t v8 = 0;
  unint64_t v25 = a3;
  unint64_t v26 = a3 - effectiveWindowSize;
  while (1)
  {
    uint32x4_t v9 = -[NSMutableArray objectAtIndexedSubscript:](self->_samples, "objectAtIndexedSubscript:", v8, v25);
    unint64_t v10 = [v9 objectForKeyedSubscript:@"StartMachAbsTime"];
    uint64_t v11 = [v10 unsignedLongLongValue];

    double v12 = [v9 objectForKeyedSubscript:@"EndMachAbsTime"];
    unint64_t v13 = [v12 unsignedLongLongValue];

    if (v13 >= v26) {
      break;
    }
    v14 = [v9 objectForKeyedSubscript:@"Type"];
    char v15 = [v14 unsignedLongLongValue];

    if ((v15 & 4) != 0)
    {
      id v18 = [NSNumber numberWithUnsignedLongLong:v11];
      [(NSMutableDictionary *)self->_processesAtWindowBeginning setObject:v18 forKeyedSubscript:@"StartMachAbsTime"];

      id v19 = [NSNumber numberWithUnsignedLongLong:v13];
      [(NSMutableDictionary *)self->_processesAtWindowBeginning setObject:v19 forKeyedSubscript:@"EndMachAbsTime"];

      systemAtWindowBeginning = [v9 objectForKeyedSubscript:@"Processes"];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = sub_23091517C;
      v30[3] = &unk_264B907B8;
      v30[4] = self;
      [systemAtWindowBeginning enumerateKeysAndObjectsUsingBlock:v30];
      v20 = [v9 objectForKeyedSubscript:@"DeadProcesses"];
      objc_super v21 = v20;
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = sub_23091518C;
      v29[3] = &unk_264B90240;
      v29[4] = self;
      v22 = v29;
LABEL_8:
      [v20 enumerateObjectsUsingBlock:v22];

      goto LABEL_9;
    }
    if ((v15 & 0x28) == 0)
    {
      if ((v15 & 0x10) == 0) {
        goto LABEL_10;
      }
      v23 = [NSNumber numberWithUnsignedLongLong:v11];
      [(NSMutableDictionary *)self->_coalitionsAtWindowBeginning setObject:v23 forKeyedSubscript:@"StartMachAbsTime"];

      id v24 = [NSNumber numberWithUnsignedLongLong:v13];
      [(NSMutableDictionary *)self->_coalitionsAtWindowBeginning setObject:v24 forKeyedSubscript:@"EndMachAbsTime"];

      systemAtWindowBeginning = [v9 objectForKeyedSubscript:@"Coalitions"];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = sub_23091519C;
      v28[3] = &unk_264B907B8;
      v28[4] = self;
      [systemAtWindowBeginning enumerateKeysAndObjectsUsingBlock:v28];
      v20 = [v9 objectForKeyedSubscript:@"DeadCoalitions"];
      objc_super v21 = v20;
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = sub_2309151AC;
      v27[3] = &unk_264B90240;
      v27[4] = self;
      v22 = v27;
      goto LABEL_8;
    }
    uint64_t v16 = v9;
    systemAtWindowBeginning = self->_systemAtWindowBeginning;
    self->_systemAtWindowBeginning = v16;
LABEL_9:

LABEL_10:
    if (v7 == ++v8)
    {
      uint64_t v8 = v7;
      goto LABEL_15;
    }
  }

LABEL_15:
  a3 = v25;
  if (v8) {
    -[NSMutableArray removeObjectsInRange:](self->_samples, "removeObjectsInRange:", 0, v8);
  }
LABEL_17:
  self->_lastWindowPurgeTime = a3;
}

- (void)start
{
  v3 = [(DTSysmonTapConfig *)self->_config processAttributes];

  if (v3)
  {
    id v4 = objc_opt_new();
    host_t v5 = +[DTSysmonTapSupportedAttributes localProcessAttributesMap];
    uint64_t v6 = [(DTSysmonTapConfig *)self->_config processAttributes];
    v68[0] = MEMORY[0x263EF8330];
    v68[1] = 3221225472;
    v68[2] = sub_2309158F0;
    v68[3] = &unk_264B90288;
    id v69 = v5;
    uint64_t v7 = v4;
    v70 = v7;
    id v8 = v5;
    [v6 enumerateObjectsUsingBlock:v68];

    processAttributes = self->_processAttributes;
    self->_processAttributes = v7;
    unint64_t v10 = v7;

    v67[5] = MEMORY[0x263EF8330];
    v67[6] = 3221225472;
    v67[7] = sub_230915960;
    v67[8] = &unk_264B907E0;
    v67[9] = self;
    uint64_t v11 = (OS_sysmon_request *)sysmon_request_create();
    processRequest = self->_processRequest;
    self->_processRequest = v11;

    unint64_t v13 = self->_processAttributes;
    v67[0] = MEMORY[0x263EF8330];
    v67[1] = 3221225472;
    v67[2] = sub_230915A48;
    v67[3] = &unk_264B90808;
    v67[4] = self;
    [(NSArray *)v13 enumerateObjectsUsingBlock:v67];
    [(DTSysmonTapConfig *)self->_config sampleInterval];
    sysmon_request_set_interval();
  }
  v14 = [(DTSysmonTapConfig *)self->_config systemAttributes];

  if (v14)
  {
    char v15 = objc_opt_new();
    uint64_t v16 = +[DTSysmonTapSupportedAttributes localSystemAttributesMap];
    id v17 = [(DTSysmonTapConfig *)self->_config systemAttributes];
    v64[0] = MEMORY[0x263EF8330];
    v64[1] = 3221225472;
    v64[2] = sub_230915AB0;
    v64[3] = &unk_264B90288;
    id v65 = v16;
    id v18 = v15;
    v66 = v18;
    id v19 = v16;
    [v17 enumerateObjectsUsingBlock:v64];

    systemAttributes = self->_systemAttributes;
    self->_systemAttributes = v18;
    objc_super v21 = v18;

    v63[5] = MEMORY[0x263EF8330];
    v63[6] = 3221225472;
    v63[7] = sub_230915B20;
    v63[8] = &unk_264B907E0;
    v63[9] = self;
    v22 = (OS_sysmon_request *)sysmon_request_create();
    systemRequest = self->_systemRequest;
    self->_systemRequest = v22;

    id v24 = self->_systemAttributes;
    v63[0] = MEMORY[0x263EF8330];
    v63[1] = 3221225472;
    v63[2] = sub_230915C08;
    v63[3] = &unk_264B90808;
    v63[4] = self;
    [(NSArray *)v24 enumerateObjectsUsingBlock:v63];
    [(DTSysmonTapConfig *)self->_config sampleInterval];
    sysmon_request_set_interval();
  }
  unint64_t v25 = [(DTSysmonTapConfig *)self->_config coalitionAttributes];

  if (v25)
  {
    unint64_t v26 = objc_opt_new();
    uint64_t v27 = +[DTSysmonTapSupportedAttributes localCoalitionAttributesMap];
    uint64_t v28 = [(DTSysmonTapConfig *)self->_config coalitionAttributes];
    v60[0] = MEMORY[0x263EF8330];
    v60[1] = 3221225472;
    v60[2] = sub_230915C70;
    v60[3] = &unk_264B90288;
    id v61 = v27;
    v29 = v26;
    v62 = v29;
    id v30 = v27;
    [v28 enumerateObjectsUsingBlock:v60];

    coalitionAttributes = self->_coalitionAttributes;
    self->_coalitionAttributes = v29;
    id v32 = v29;

    v59[5] = MEMORY[0x263EF8330];
    v59[6] = 3221225472;
    v59[7] = sub_230915CE0;
    v59[8] = &unk_264B907E0;
    v59[9] = self;
    v33 = (OS_sysmon_request *)sysmon_request_create();
    coalitionRequest = self->_coalitionRequest;
    self->_coalitionRequest = v33;

    uint64_t v35 = self->_coalitionAttributes;
    v59[0] = MEMORY[0x263EF8330];
    v59[1] = 3221225472;
    v59[2] = sub_230915DC8;
    v59[3] = &unk_264B90808;
    v59[4] = self;
    [(NSArray *)v35 enumerateObjectsUsingBlock:v59];
    [(DTSysmonTapConfig *)self->_config sampleInterval];
    sysmon_request_set_interval();
  }
  [(DTSysmonTapLocalDelegate *)self _createAttributesSample];
  if ([(DTSysmonTapConfig *)self->_config sampleCPUUsage])
  {
    out_processor_mach_timebase_info info = 0;
    mach_msg_type_number_t out_processor_infoCnt = 0;
    host_t v36 = MEMORY[0x230FC1EC0]();
    uint64_t v37 = host_processor_info(v36, 1, &self->_cpuCount, &out_processor_info, &out_processor_infoCnt);
    if (v37)
    {
      uint64_t v38 = v37;
      id v39 = [DTTapStatusMemo alloc];
      id v40 = [NSString stringWithFormat:@"Failed to sample host processor basic info: %d", v38];
      v41 = [(DTTapStatusMemo *)v39 initWithStatus:0x80000000 notice:v40];
    }
    else
    {
      uint64_t v42 = mach_vm_deallocate(*MEMORY[0x263EF8960], (mach_vm_address_t)out_processor_info, 4 * out_processor_infoCnt);
      host_t v43 = MEMORY[0x230FC1EC0](v42);
      uint64_t v44 = host_processor_info(v43, 2, &self->_cpuCount, (processor_info_array_t *)&self->_savedTicks, &out_processor_infoCnt);
      if (!v44) {
        goto LABEL_13;
      }
      uint64_t v45 = v44;
      id v46 = [DTTapStatusMemo alloc];
      id v47 = [NSString stringWithFormat:@"Failed to sample host processor cpu usage: %d", v45];
      v41 = [(DTTapStatusMemo *)v46 initWithStatus:0x80000000 notice:v47];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_tap);
    [WeakRetained _handleStatusMemo:v41];

LABEL_13:
    self->_lastWindowPurgeTime = mach_absolute_time();
    if (!self->_systemRequest)
    {
      unint64_t v49 = [(DTSysmonTapConfig *)self->_config sampleInterval];
      v50 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_serialQ);
      pollTimer = self->_pollTimer;
      self->_pollTimer = v50;

      char v52 = self->_pollTimer;
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = sub_230915E30;
      handler[3] = &unk_264B8D590;
      handler[4] = self;
      dispatch_source_set_event_handler(v52, handler);
      v53 = self->_pollTimer;
      dispatch_time_t v54 = dispatch_time(0, v49);
      dispatch_source_set_timer(v53, v54, v49, 0x989680uLL);
      dispatch_resume((dispatch_object_t)self->_pollTimer);
    }
  }
  uint64_t v55 = mach_absolute_time();
  self->_systemLastSampleTime = v55;
  self->_coalitionLastSampleTime = v55;
  self->_processLastSampleTime = v55;
  if (self->_processRequest) {
    sysmon_request_execute();
  }
  if (self->_systemRequest) {
    sysmon_request_execute();
  }
  if (self->_coalitionRequest) {
    sysmon_request_execute();
  }
}

- (void)stop
{
  self->_stopWasCalled = 1;
  if (self->_coalitionRequest)
  {
    sysmon_request_cancel();
    coalitionRequest = self->_coalitionRequest;
    self->_coalitionRequest = 0;
  }
  if (self->_systemRequest)
  {
    sysmon_request_cancel();
    systemRequest = self->_systemRequest;
    self->_systemRequest = 0;
  }
  if (self->_processRequest)
  {
    sysmon_request_cancel();
    processRequest = self->_processRequest;
    self->_processRequest = 0;
  }
  pollTimer = self->_pollTimer;
  if (pollTimer)
  {
    dispatch_source_cancel(pollTimer);
    uint64_t v7 = self->_pollTimer;
    self->_pollTimer = 0;
  }
}

- (BOOL)canFetchWhileArchiving
{
  return 0;
}

- (void)fetchDataForReason:(unint64_t)a3 block:(id)a4
{
  uint64_t v6 = (void (**)(id, void *, uint64_t))a4;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_samplesLock, 0xFFFFFFFFFFFFFFFFLL);
  if ([(NSMutableArray *)self->_samples count])
  {
    if (self->_isWindowed)
    {
      [(DTSysmonTapLocalDelegate *)self _purgeOldSamplesForCurrentTime:mach_absolute_time()];
      uint64_t v7 = objc_opt_new();
      id v8 = v7;
      if (self->_processesAtWindowBeginning) {
        [v7 addObject:];
      }
      if (self->_systemAtWindowBeginning) {
        [v8 addObject:];
      }
      if (self->_coalitionsAtWindowBeginning) {
        [v8 addObject:];
      }
      [v8 sortUsingComparator:&unk_26E5158E8];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = sub_23091638C;
      v22[3] = &unk_264B90850;
      v22[4] = self;
      [v8 enumerateObjectsUsingBlock:v22];
      processesAtWindowBeginning = self->_processesAtWindowBeginning;
      self->_processesAtWindowBeginning = 0;

      systemAtWindowBeginning = self->_systemAtWindowBeginning;
      self->_systemAtWindowBeginning = 0;

      coalitionsAtWindowBeginning = self->_coalitionsAtWindowBeginning;
      self->_coalitionsAtWindowBeginning = 0;
    }
    if (self->_newAttributesSample)
    {
      double v12 = [(NSMutableArray *)self->_samples objectAtIndexedSubscript:0];
      unint64_t v13 = [(NSMutableDictionary *)self->_newAttributesSample objectForKeyedSubscript:@"Type"];
      int v14 = [v13 unsignedIntValue];

      char v15 = [v12 objectForKeyedSubscript:@"Type"];
      LODWORD(v13) = [v15 unsignedIntValue];

      [v12 addEntriesFromDictionary:self->_newAttributesSample];
      uint64_t v16 = [NSNumber numberWithUnsignedLongLong:v13 | v14];
      [v12 setObject:v16 forKeyedSubscript:@"Type"];

      newAttributesSample = self->_newAttributesSample;
      self->_newAttributesSample = 0;
    }
    id v18 = objc_opt_new();
    [v18 setTapVersion:0x10000];
    [v18 setSamples:self->_samples];
    [v18 setSupportsPeek:1];
    BOOL v20 = a3 == 1 && self->_stopWasCalled;
    [v18 setFinalMemo:v20];
    v6[2](v6, v18, 1);
    [(NSMutableArray *)self->_samples removeAllObjects];
  }
  else
  {
    objc_super v21 = [[DTTapHeartbeatMemo alloc] initWithTimestamp:mach_absolute_time()];
    v6[2](v6, v21, 1);
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_samplesLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalitionRequest, 0);
  objc_storeStrong((id *)&self->_systemRequest, 0);
  objc_storeStrong((id *)&self->_processRequest, 0);
  objc_storeStrong((id *)&self->_coalitionAttributes, 0);
  objc_storeStrong((id *)&self->_systemAttributes, 0);
  objc_storeStrong((id *)&self->_processAttributes, 0);
  objc_storeStrong((id *)&self->_coalitionsAtWindowBeginning, 0);
  objc_storeStrong((id *)&self->_systemAtWindowBeginning, 0);
  objc_storeStrong((id *)&self->_processesAtWindowBeginning, 0);
  objc_storeStrong((id *)&self->_coalitionsFromLastSample, 0);
  objc_storeStrong((id *)&self->_processesFromLastSample, 0);
  objc_storeStrong((id *)&self->_newAttributesSample, 0);
  objc_storeStrong((id *)&self->_samples, 0);
  objc_storeStrong((id *)&self->_samplesLock, 0);
  objc_storeStrong((id *)&self->_serialQ, 0);
  objc_storeStrong((id *)&self->_pollTimer, 0);
  objc_storeStrong((id *)&self->_pidFilter, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_destroyWeak((id *)&self->_tap);
}

@end