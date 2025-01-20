@interface DTSysmonTapRecordDecoder
- (unint64_t)enumerateRecordsFromSample:(id)a3 block:(id)a4;
@end

@implementation DTSysmonTapRecordDecoder

- (unint64_t)enumerateRecordsFromSample:(id)a3 block:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = objc_opt_new();
  v9 = [v6 objectForKeyedSubscript:@"Type"];
  [v8 setRecordType:[v9 unsignedIntValue]];

  v10 = [v6 objectForKeyedSubscript:@"StartMachAbsTime"];

  if (v10)
  {
    v11 = [v6 objectForKeyedSubscript:@"StartMachAbsTime"];
    unint64_t v12 = [v11 unsignedLongLongValue];

    [v8 setStartTimestamp:v12];
    self->_unint64_t mostRecentEpoch = v12;
  }
  v13 = [v6 objectForKeyedSubscript:@"EndMachAbsTime"];

  if (v13)
  {
    v14 = [v6 objectForKeyedSubscript:@"EndMachAbsTime"];
    unint64_t v15 = [v14 unsignedLongLongValue];

    [v8 setEndTimestamp:v15];
    self->_unint64_t mostRecentEpoch = v15;
  }
  v16 = [v6 objectForKeyedSubscript:@"ProcessesAttributes"];
  v17 = v16;
  if (v16 && ([v16 isEqual:self->_processAttributes] & 1) == 0) {
    objc_storeStrong((id *)&self->_processAttributes, v17);
  }
  v18 = [v6 objectForKeyedSubscript:@"SystemAttributes"];

  if (v18 && ([v18 isEqual:self->_systemAttributes] & 1) == 0) {
    objc_storeStrong((id *)&self->_systemAttributes, v18);
  }
  v19 = [v6 objectForKeyedSubscript:@"CoalitionAttributes"];

  if (v19 && ([v19 isEqual:self->_coalitionAttributes] & 1) == 0) {
    objc_storeStrong((id *)&self->_coalitionAttributes, v19);
  }
  [v8 setProcessAttributes:self->_processAttributes];
  [v8 setSystemAttributes:self->_systemAttributes];
  [v8 setCoalitionAttributes:self->_coalitionAttributes];
  v20 = [v6 objectForKeyedSubscript:@"Processes"];

  if (v20)
  {
    v21 = objc_opt_new();
    v22 = [v6 objectForKeyedSubscript:@"Processes"];
    v63[0] = MEMORY[0x263EF8330];
    v63[1] = 3221225472;
    v63[2] = sub_2308E7D4C;
    v63[3] = &unk_264B8F8A0;
    id v64 = v21;
    id v23 = v21;
    [v22 enumerateKeysAndObjectsUsingBlock:v63];

    [v8 setChangedProcesses:v23];
  }
  v24 = [v6 objectForKeyedSubscript:@"System"];

  if (v24)
  {
    v25 = objc_opt_new();
    v26 = [v6 objectForKeyedSubscript:@"System"];
    [v25 setAttributes:v26];

    [v8 setSystem:v25];
  }
  v27 = [v6 objectForKeyedSubscript:@"Coalitions"];

  if (v27)
  {
    v28 = objc_opt_new();
    v29 = [v6 objectForKeyedSubscript:@"Coalitions"];
    v61[0] = MEMORY[0x263EF8330];
    v61[1] = 3221225472;
    v61[2] = sub_2308E7DF0;
    v61[3] = &unk_264B8F8A0;
    id v62 = v28;
    id v30 = v28;
    [v29 enumerateKeysAndObjectsUsingBlock:v61];

    [v8 setCoalitions:v30];
  }
  v31 = [v6 objectForKeyedSubscript:@"DeadProcesses"];

  if (v31)
  {
    v32 = [v6 objectForKeyedSubscript:@"DeadProcesses"];
    [v8 setDeadProcesses:v32];
  }
  v33 = [v6 objectForKeyedSubscript:@"DeadCoalitions"];

  if (v33)
  {
    v34 = [v6 objectForKeyedSubscript:@"DeadCoalitions"];
    [v8 setDeadCoalitions:v34];
  }
  if (([v8 recordType] & 0x20) != 0)
  {
    v35 = objc_opt_new();
    v36 = [v6 objectForKeyedSubscript:@"CPUCount"];
    [v35 setCpuCount:[v36 unsignedIntValue]];

    v37 = [v6 objectForKeyedSubscript:@"EnabledCPUs"];
    [v35 setEnabledCPUs:objc_msgSend(v37, "unsignedIntValue")];

    v38 = [v6 objectForKeyedSubscript:@"SystemCPUUsage"];
    v39 = [DTSysmonCPUUsageEntry alloc];
    [v38 objectForKeyedSubscript:@"CPU_TotalLoad"];
    v40 = v58 = v7;
    [v40 doubleValue];
    double v42 = v41;
    v43 = [v38 objectForKeyedSubscript:@"CPU_UserLoad"];
    [v43 doubleValue];
    double v45 = v44;
    v46 = [v38 objectForKeyedSubscript:@"CPU_SystemLoad"];
    [v46 doubleValue];
    double v48 = v47;
    [v38 objectForKeyedSubscript:@"CPU_NiceLoad"];
    v49 = v57 = v19;
    [v49 doubleValue];
    v51 = [(DTSysmonCPUUsageEntry *)v39 initWithTotal:v42 user:v45 system:v48 nice:v50];
    [v35 setAverageCPUUsage:v51];

    v7 = v58;
    v52 = [v6 objectForKeyedSubscript:@"PerCPUUsage"];
    v53 = objc_opt_new();
    v59[0] = MEMORY[0x263EF8330];
    v59[1] = 3221225472;
    v59[2] = sub_2308E7E94;
    v59[3] = &unk_264B8F8C8;
    id v60 = v53;
    id v54 = v53;
    [v52 enumerateObjectsUsingBlock:v59];
    [v35 setPerCPUUsage:v54];
    [v8 setCpuUsage:v35];

    v19 = v57;
  }
  v7[2](v7, v8);
  unint64_t mostRecentEpoch = self->_mostRecentEpoch;

  return mostRecentEpoch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalitionAttributes, 0);
  objc_storeStrong((id *)&self->_systemAttributes, 0);
  objc_storeStrong((id *)&self->_processAttributes, 0);
}

@end