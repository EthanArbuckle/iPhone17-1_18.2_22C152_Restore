@interface DTKPCPUCounterAllocator
- (BOOL)_eventExists:(id)a3 eventOut:(id *)a4;
- (BOOL)_matchesPMIEvent:(id)a3;
- (BOOL)pmiEnabled;
- (DTKPCPU)cpu;
- (DTKPCPUCounterAllocator)initWithCPU:(id)a3 error:(id *)a4;
- (DTKPCPUCounterAllocatorRecord)allocatedPMIRecord;
- (id)_counterNameForEvent:(id)a3 error:(id *)a4;
- (int)_setErrorFromKpepError:(int)a3 eventName:(id)a4 error:(id *)a5;
- (int)addPMCEventName:(id)a3 error:(id *)a4;
- (int)configureHardwareCounters:(id *)a3;
- (int)configureHardwarePMIPeriods:(id *)a3;
- (int)configurePMIActionID:(unsigned int)a3 error:(id *)a4;
- (int)forceCounters:(id *)a3;
- (int)setPMIEventName:(id)a3 pmiThreshold:(unint64_t)a4 error:(id *)a5;
- (int)startHardwareCounters:(id *)a3;
- (int)stopHardwareCounters:(id *)a3;
- (int)unforceCounters:(id *)a3;
- (unint64_t)_counterIndexForEvent:(id)a3 absolute:(BOOL)a4 error:(id *)a5;
- (unint64_t)_hardwareEventCount;
- (unint64_t)pmcEventCount;
- (unint64_t)pmiThreshold;
- (unint64_t)recordConfigWordsIntoBuffer:(unint64_t *)a3;
- (unsigned)_getCurrentClasses:(id *)a3;
- (unsigned)kpcClasses;
- (void)_enumerateAllocatedPMCsWithIndex:(id)a3;
- (void)dealloc;
- (void)enumerateAllocatedPMCs:(id)a3;
@end

@implementation DTKPCPUCounterAllocator

- (DTKPCPUCounterAllocator)initWithCPU:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v31.receiver = self;
  v31.super_class = (Class)DTKPCPUCounterAllocator;
  v8 = [(DTKPCPUCounterAllocator *)&v31 init];
  v9 = v8;
  if (v8)
  {
    if (!v7) {
      sub_23093E724();
    }
    p_cpu = (id *)&v8->_cpu;
    objc_storeStrong((id *)&v8->_cpu, a3);
    uint64_t v11 = objc_opt_new();
    eventRecords = v9->_eventRecords;
    v9->_eventRecords = (NSMutableArray *)v11;

    [(DTKPCPU *)v9->_cpu kpepDB];
    uint64_t v13 = kpep_config_create();
    if (v13)
    {
      uint64_t v14 = v13;
      v15 = NSString;
      v16 = [*p_cpu name];
      v17 = [v15 stringWithFormat:@"Failed to create a kpep config for %@: %d", v16, v14];
      DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPUCounterAllocator", a4, 4294967289, v17);
    }
    else
    {
      uint64_t v18 = kpep_config_force_counters();
      if (v18)
      {
        uint64_t v19 = v18;
        v20 = NSString;
        v21 = [*p_cpu name];
        [v20 stringWithFormat:@"Failed to force on all counters for %@: %d", v21, v19];
      }
      else
      {
        v9->_fixedCounterCount = 0;
        [(DTKPCPU *)v9->_cpu kpepDB];
        uint64_t v22 = kpep_db_counters_count();
        if (v22)
        {
          uint64_t v23 = v22;
          v24 = NSString;
          v21 = [*p_cpu name];
          [v24 stringWithFormat:@"Failed to get fixed counter count for %@: %d", v21, v23];
        }
        else
        {
          v9->_configurableCounterCount = 0;
          [(DTKPCPU *)v9->_cpu kpepDB];
          uint64_t v25 = kpep_db_counters_count();
          if (!v25)
          {
            pmiEvent = v9->_pmiEvent;
            v9->_eventsUniqueIds = 0;
            v9->_pmiEvent = 0;
            goto LABEL_13;
          }
          uint64_t v26 = v25;
          v27 = NSString;
          v21 = [*p_cpu name];
          [v27 stringWithFormat:@"Failed to get configurable counter count for %@: %d", v21, v26];
        }
      v28 = };
      DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPUCounterAllocator", a4, 4294967289, v28);

      kpep_config_free();
      v9->_kpepConfig = 0;
    }
    pmiEvent = v9;
    v9 = 0;
LABEL_13:
  }
  return v9;
}

- (void)dealloc
{
  if (self->_kpepConfig)
  {
    kpep_config_free();
    self->_kpepConfig = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)DTKPCPUCounterAllocator;
  [(DTKPCPUCounterAllocator *)&v3 dealloc];
}

- (unint64_t)_hardwareEventCount
{
  return self->_eventsUniqueIds;
}

- (unsigned)_getCurrentClasses:(id *)a3
{
  uint64_t v4 = kpep_config_kpc_classes();
  if (!v4) {
    return 0;
  }
  v5 = [NSString stringWithFormat:@"Failed to access kpc_classes: %d", v4];
  unsigned int v6 = -1;
  DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPUCounterAllocator", a3, 0xFFFFFFFFLL, v5);

  return v6;
}

- (unint64_t)_counterIndexForEvent:(id)a3 absolute:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v18[1] = *(id *)MEMORY[0x263EF8340];
  id v8 = a3;
  if (!v8) {
    sub_23093E750();
  }
  v9 = v8;
  uint64_t v10 = [v8 hwIdx];
  uint64_t v11 = (char *)v18
      - ((8 * [(DTKPCPUCounterAllocator *)self _hardwareEventCount] + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = kpep_config_kpc_map();
  if (v12)
  {
    [NSString stringWithFormat:@"Failed to access kpc_map: %d", v12];
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPUCounterAllocator", a5, 0xFFFFFFFFLL, v13);
  }
  else
  {
    unint64_t v14 = *(void *)&v11[8 * v10];
    if (!v6) {
      goto LABEL_6;
    }
    v18[0] = 0;
    char v16 = [(DTKPCPUCounterAllocator *)self _getCurrentClasses:v18];
    id v17 = v18[0];
    id v13 = v17;
    if (!v17)
    {
      if ((v16 & 1) == 0) {
        v14 += self->_fixedCounterCount;
      }
      goto LABEL_5;
    }
    if (a5)
    {
      id v13 = v17;
      *a5 = v13;
    }
  }
  unint64_t v14 = -1;
LABEL_5:

LABEL_6:
  return v14;
}

- (id)_counterNameForEvent:(id)a3 error:(id *)a4
{
  unint64_t v5 = [(DTKPCPUCounterAllocator *)self _counterIndexForEvent:a3 absolute:1 error:a4];
  if (v5 == -1)
  {
    if (a4 && *a4 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      sub_23093E77C(a4);
    }
    BOOL v6 = @"PMC<X>";
  }
  else
  {
    [NSString stringWithFormat:@"PMC%zu", v5];
    BOOL v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (BOOL)_eventExists:(id)a3 eventOut:(id *)a4
{
  id v6 = a3;
  id v7 = [(DTKPCPU *)self->_cpu eventFromNameOrAlias:v6];
  id v8 = v7;
  if (v7)
  {
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 0;
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x3032000000;
    uint64_t v19 = sub_2308FB388;
    v20 = sub_2308FB398;
    id v21 = 0;
    eventRecords = self->_eventRecords;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = sub_2308FB3A0;
    v12[3] = &unk_264B90078;
    id v13 = v7;
    unint64_t v14 = &v22;
    v15 = &v16;
    [(NSMutableArray *)eventRecords enumerateObjectsUsingBlock:v12];
    if (a4) {
      *a4 = (id) v17[5];
    }
    BOOL v10 = *((unsigned char *)v23 + 24) != 0;

    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v22, 8);
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)_matchesPMIEvent:(id)a3
{
  id v4 = a3;
  pmiEvent = self->_pmiEvent;
  if (pmiEvent)
  {
    id v6 = [(DTKPCPUCounterAllocatorRecord *)pmiEvent eventOrAliasName];
    if ([v6 isEqualToString:v4])
    {
      char v7 = 1;
    }
    else
    {
      id v8 = [(DTKPCPUCounterAllocatorRecord *)self->_pmiEvent eventName];
      char v7 = [v8 isEqualToString:v4];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (int)_setErrorFromKpepError:(int)a3 eventName:(id)a4 error:(id *)a5
{
  v16[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  uint64_t v8 = kpep_strerror();
  if (v7) {
    [NSString stringWithFormat:@"Error for event %@: %s", v7, v8];
  }
  else {
  uint64_t v9 = [NSString stringWithUTF8String:v8];
  }
  BOOL v10 = (void *)v9;
  if (a5)
  {
    uint64_t v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08320];
    v16[0] = v9;
    uint64_t v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    *a5 = [v11 errorWithDomain:@"DTKPCPUCounterAllocator" code:-1 userInfo:v12];
  }
  switch(a3)
  {
    case 11:
      int v13 = -801;
      break;
    case 12:
      int v13 = -804;
      break;
    case 13:
      int v13 = -805;
      break;
    case 14:
      int v13 = -806;
      break;
    default:
      if (a3 == 1) {
        int v13 = -4;
      }
      else {
        int v13 = -1;
      }
      break;
  }

  return v13;
}

- (int)setPMIEventName:(id)a3 pmiThreshold:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  pmiEvent = self->_pmiEvent;
  if (!pmiEvent)
  {
    id v37 = 0;
    BOOL v14 = [(DTKPCPUCounterAllocator *)self _eventExists:v8 eventOut:&v37];
    id v15 = v37;
    uint64_t v16 = v15;
    if (v14)
    {
      [v15 hwIdx];
      uint64_t v17 = kpep_config_remove_event();
      if (v17)
      {
        int v13 = [(DTKPCPUCounterAllocator *)self _setErrorFromKpepError:v17 eventName:v8 error:a5];
LABEL_17:

        goto LABEL_18;
      }
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = sub_2308FBA28;
      v33[3] = &unk_264B900A0;
      id v34 = v16;
      v35 = self;
      v36 = a5;
      [(DTKPCPUCounterAllocator *)self enumerateAllocatedPMCs:v33];
      --self->_eventsUniqueIds;
    }
    uint64_t v18 = [(DTKPCPU *)self->_cpu eventFromNameOrAlias:v8];
    uint64_t v19 = v18;
    if (v18)
    {
      if (![v18 kpepEvent]) {
        sub_23093E818();
      }
      uint64_t v32 = [v19 kpepEvent];
      uint64_t v20 = kpep_config_add_event_trigger();
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = [v19 aliasOrName];
        int v13 = [(DTKPCPUCounterAllocator *)self _setErrorFromKpepError:v21 eventName:v22 error:a5];
      }
      else
      {
        if (kpep_event_name()) {
          sub_23093E844();
        }
        uint64_t v24 = [NSString stringWithUTF8String:0];
        char v25 = [DTKPCPUCounterAllocatorRecord alloc];
        uint64_t v26 = [v19 aliasOrName];
        ++self->_eventsUniqueIds;
        v27 = -[DTKPCPUCounterAllocatorRecord initWithName:nameOrAlias:counterName:kpepEvent:isPMI:hwIdx:](v25, "initWithName:nameOrAlias:counterName:kpepEvent:isPMI:hwIdx:", v24, v26, @"TBD", v32, 1);
        v28 = self->_pmiEvent;
        self->_pmiEvent = v27;

        v29 = [(DTKPCPUCounterAllocator *)self _counterNameForEvent:self->_pmiEvent error:a5];
        [(DTKPCPUCounterAllocatorRecord *)self->_pmiEvent setCounterName:v29];

        self->_pmiThreshold = a4;
        if (v14)
        {
          [v16 setHwIdx:-[DTKPCPUCounterAllocatorRecord hwIdx](self->_pmiEvent, "hwIdx")];
          v30 = [(DTKPCPUCounterAllocatorRecord *)self->_pmiEvent counterName];
          [v16 setCounterName:v30];

          [v16 setKpepEvent:0];
        }

        int v13 = 0;
      }
    }
    else
    {
      uint64_t v23 = [NSString stringWithFormat:@"Event not found: %@'", v8];
      int v13 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPUCounterAllocator", a5, 4294966495, v23);
    }
    goto LABEL_17;
  }
  BOOL v10 = NSString;
  uint64_t v11 = [(DTKPCPUCounterAllocatorRecord *)pmiEvent eventOrAliasName];
  uint64_t v12 = [v10 stringWithFormat:@"Cannot changed the allocated PMI event from '%@' to '%@'", v11, v8];
  int v13 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPUCounterAllocator", a5, 4294966493, v12);

LABEL_18:
  return v13;
}

- (int)addPMCEventName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(DTKPCPUCounterAllocator *)self _eventExists:v6 eventOut:0])
  {
    id v7 = [NSString stringWithFormat:@"The event named '%@' has already been added.", v6];
    int v8 = DTKPSetErrorAndOrLogWithFileAndLine(0, (uint64_t)"DTKPCPUCounterAllocator", a4, 4294966494, v7);
  }
  else
  {
    if ([(DTKPCPUCounterAllocator *)self _matchesPMIEvent:v6])
    {
      eventRecords = self->_eventRecords;
      BOOL v10 = [DTKPCPUCounterAllocatorRecord alloc];
      uint64_t v11 = [(DTKPCPUCounterAllocatorRecord *)self->_pmiEvent eventName];
      uint64_t v12 = [(DTKPCPUCounterAllocatorRecord *)self->_pmiEvent eventName];
      int v13 = [(DTKPCPUCounterAllocatorRecord *)v10 initWithName:v11 nameOrAlias:v6 counterName:v12 kpepEvent:0 isPMI:0 hwIdx:[(DTKPCPUCounterAllocatorRecord *)self->_pmiEvent hwIdx]];
      [(NSMutableArray *)eventRecords addObject:v13];

      int v8 = 0;
      goto LABEL_6;
    }
    id v15 = [(DTKPCPU *)self->_cpu eventFromNameOrAlias:v6];
    id v7 = v15;
    if (v15)
    {
      if (![v15 kpepEvent]) {
        sub_23093E870();
      }
      uint64_t v28 = [v7 kpepEvent];
      uint64_t v16 = kpep_config_add_event();
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = [v7 name];
        int v8 = [(DTKPCPUCounterAllocator *)self _setErrorFromKpepError:v17 eventName:v18 error:a4];
      }
      else
      {
        uint64_t v20 = kpep_event_name();
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = [v7 name];
          int v8 = [(DTKPCPUCounterAllocator *)self _setErrorFromKpepError:v21 eventName:v22 error:a4];
        }
        else
        {
          uint64_t v22 = [NSString stringWithUTF8String:0];
          uint64_t v23 = [DTKPCPUCounterAllocatorRecord alloc];
          uint64_t v24 = [v7 aliasOrName];
          ++self->_eventsUniqueIds;
          char v25 = -[DTKPCPUCounterAllocatorRecord initWithName:nameOrAlias:counterName:kpepEvent:isPMI:hwIdx:](v23, "initWithName:nameOrAlias:counterName:kpepEvent:isPMI:hwIdx:", v22, v24, @"TBD", v28, 0);

          [(NSMutableArray *)self->_eventRecords addObject:v25];
          uint64_t v26 = [(NSMutableArray *)self->_eventRecords lastObject];
          v27 = [(DTKPCPUCounterAllocator *)self _counterNameForEvent:v26 error:a4];
          [(DTKPCPUCounterAllocatorRecord *)v25 setCounterName:v27];

          int v8 = 0;
        }
      }
    }
    else
    {
      uint64_t v19 = [NSString stringWithFormat:@"Event not found: %@'", v6];
      int v8 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPUCounterAllocator", a4, 4294966495, v19);
    }
  }

LABEL_6:
  return v8;
}

- (void)_enumerateAllocatedPMCsWithIndex:(id)a3
{
  id v4 = a3;
  eventRecords = self->_eventRecords;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2308FBE60;
  v7[3] = &unk_264B900C8;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)eventRecords enumerateObjectsUsingBlock:v7];
}

- (void)enumerateAllocatedPMCs:(id)a3
{
  id v4 = a3;
  eventRecords = self->_eventRecords;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2308FBF08;
  v7[3] = &unk_264B900C8;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)eventRecords enumerateObjectsUsingBlock:v7];
}

- (unsigned)kpcClasses
{
  if (kpep_config_kpc_classes()) {
    return 0;
  }
  else {
    return 0;
  }
}

- (unint64_t)pmcEventCount
{
  return [(NSMutableArray *)self->_eventRecords count];
}

- (BOOL)pmiEnabled
{
  return self->_pmiEvent != 0;
}

- (unint64_t)recordConfigWordsIntoBuffer:(unint64_t *)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_2308FC02C;
  v5[3] = &unk_264B900F0;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = self;
  [(DTKPCPUCounterAllocator *)self _enumerateAllocatedPMCsWithIndex:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int)configureHardwareCounters:(id *)a3
{
  if (!kpep_config_kpc_classes()) {
    return 0;
  }
  id v4 = [NSString stringWithFormat:@"configureHardwarePMIPeriods: Failed to get kpc classes: %s.", kpep_strerror()];
  int v5 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPUCounterAllocator", a3, 4294967288, v4);

  return v5;
}

- (int)configureHardwarePMIPeriods:(id *)a3
{
  if (kpep_config_kpc_classes())
  {
    [NSString stringWithFormat:@"configureHardwarePMIPeriods: Failed to get kpc classes: %s.", kpep_strerror()];
LABEL_5:
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    int v6 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPUCounterAllocator", a3, 4294967288, v5);
    goto LABEL_6;
  }
  [(DTKPCPU *)self->_cpu kpepDB];
  if (kpep_db_counters_count())
  {
    [NSString stringWithFormat:@"configureHardwarePMIPeriods: Failed to get kpc period number: %s.", kpep_strerror()];
    goto LABEL_5;
  }
  id v5 = [MEMORY[0x263EFF990] dataWithLength:0];
  [v5 mutableBytes];
  if (kpep_config_kpc_periods())
  {
    [NSString stringWithFormat:@"configureHardwarePMIPeriods: Failed to get kpc periods: %s.", kpep_strerror()];
  }
  else
  {
    id v8 = v5;
    [v8 mutableBytes];
    if (!kpc_set_period())
    {
      int v6 = 0;
      id v5 = v8;
      goto LABEL_6;
    }
    uint64_t v9 = NSString;
    BOOL v10 = __error();
    [v9 stringWithFormat:@"configureHardwarePMIPeriods: Failed to set kpc PMI period: %s.", strerror(*v10)];
  uint64_t v11 = };
  int v6 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPUCounterAllocator", a3, 4294967288, v11);

LABEL_6:
  return v6;
}

- (int)configurePMIActionID:(unsigned int)a3 error:(id *)a4
{
  if (kpep_config_kpc_classes())
  {
    [NSString stringWithFormat:@"configurePMIActionID: Failed to get kpc classes: %s.", kpep_strerror()];
    id v7 = LABEL_5:;
    int v8 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPUCounterAllocator", a4, 4294967288, v7);
    goto LABEL_6;
  }
  [(DTKPCPU *)self->_cpu kpepDB];
  if (kpep_db_counters_count())
  {
    [NSString stringWithFormat:@"configurePMIActionID: Failed to get kpc period number: %s.", kpep_strerror()];
    goto LABEL_5;
  }
  uint64_t v10 = [(DTKPCPUCounterAllocator *)self allocatedPMIRecord];
  if (!v10) {
    sub_23093E928();
  }
  id v7 = (void *)v10;
  unint64_t v11 = [(DTKPCPUCounterAllocator *)self _counterIndexForEvent:v10 absolute:0 error:a4];
  id v12 = [MEMORY[0x263EFF990] dataWithLength:0];
  *(_DWORD *)([v12 mutableBytes] + 4 * v11) = a3;
  if (kpc_set_actionid())
  {
    int v13 = NSString;
    BOOL v14 = __error();
    id v15 = [v13 stringWithFormat:@"configurePMIActionID: Failed to set kpc PMI period: %s.", strerror(*v14)];
    int v8 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPUCounterAllocator", a4, 4294967288, v15);
  }
  else
  {
    int v8 = 0;
  }

LABEL_6:
  return v8;
}

- (int)forceCounters:(id *)a3
{
  int result = kpc_force_all_ctrs_set();
  if (result)
  {
    id v5 = [NSString stringWithFormat:@"Failed to force all hardware CPU counters: %d.", *__error()];
    int v6 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPUCounterAllocator", a3, 4294966489, v5);

    return v6;
  }
  return result;
}

- (int)unforceCounters:(id *)a3
{
  int result = kpc_force_all_ctrs_set();
  if (result)
  {
    id v5 = [NSString stringWithFormat:@"Failed to unforce all hardware CPU counters: %d.", *__error()];
    int v6 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPUCounterAllocator", a3, 4294966487, v5);

    return v6;
  }
  return result;
}

- (int)startHardwareCounters:(id *)a3
{
  [(DTKPCPUCounterAllocator *)self kpcClasses];
  int result = kpc_set_counting();
  if (result)
  {
    id v5 = [NSString stringWithFormat:@"Failed to start kpc counting: %d.", *__error()];
    int v6 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPUCounterAllocator", a3, 4294967288, v5);

    return v6;
  }
  return result;
}

- (int)stopHardwareCounters:(id *)a3
{
  int result = kpc_set_counting();
  if (result)
  {
    id v5 = [NSString stringWithFormat:@"Failed to stop kpc counting: %d.", *__error()];
    int v6 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPUCounterAllocator", a3, 4294967288, v5);

    return v6;
  }
  return result;
}

- (unint64_t)pmiThreshold
{
  return self->_pmiThreshold;
}

- (DTKPCPUCounterAllocatorRecord)allocatedPMIRecord
{
  return self->_pmiEvent;
}

- (DTKPCPU)cpu
{
  return self->_cpu;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cpu, 0);
  objc_storeStrong((id *)&self->_pmiEvent, 0);
  objc_storeStrong((id *)&self->_eventRecords, 0);
}

@end