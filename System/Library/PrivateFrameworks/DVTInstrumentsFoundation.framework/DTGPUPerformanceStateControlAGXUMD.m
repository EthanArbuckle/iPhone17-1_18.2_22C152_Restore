@interface DTGPUPerformanceStateControlAGXUMD
- (BOOL)enable:(unint64_t)a3;
- (DTGPUPerformanceStateControlAGXUMD)initWithDevice:(id)a3;
- (id)currentState;
- (id)disable;
@end

@implementation DTGPUPerformanceStateControlAGXUMD

- (DTGPUPerformanceStateControlAGXUMD)initWithDevice:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DTGPUPerformanceStateControlAGXUMD;
  v5 = [(DTGPUPerformanceStateControlAGXUMD *)&v10 init];
  if (v5)
  {
    id v6 = v4;
    while ((objc_opt_respondsToSelector() & 1) != 0)
    {
      uint64_t v7 = [v6 baseObject];

      id v6 = (id)v7;
    }
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (objc_opt_respondsToSelector() & 1) == 0
      || (objc_opt_respondsToSelector() & 1) == 0
      || (objc_opt_respondsToSelector() & 1) == 0)
    {

      v8 = 0;
      goto LABEL_12;
    }
    objc_storeStrong((id *)&v5->_agxDevice, v6);
    v5->_acceleratorId = [v6 registryID];
  }
  v8 = v5;
LABEL_12:

  return v8;
}

- (id)currentState
{
  v29[6] = *MEMORY[0x263EF8340];
  v3 = [(AGXConsistentStateDevice *)self->_agxDevice getConsistentPerfStateInfoAndReset:1];
  if (v3)
  {
    id v4 = [(AGXConsistentStateDevice *)self->_agxDevice getConsistentPerfStateMappingTable];
    v5 = v4;
    if (v4)
    {
      v27 = [v4 objectForKeyedSubscript:@"min_pstate"];
      v26 = [v5 objectForKeyedSubscript:@"mid_pstate"];
      uint64_t v6 = [v5 objectForKeyedSubscript:@"max_pstate"];
      uint64_t v7 = (void *)v6;
      v8 = &unk_26E5343E8;
      if (v27 && v26 && v6)
      {
        v25 = (void *)v6;
        int v9 = [v27 unsignedIntValue];
        int v10 = [v26 unsignedIntValue];
        int v11 = [v25 unsignedIntValue];
        v8 = objc_opt_new();
        v28[0] = @"accelerator-id";
        v23 = [NSNumber numberWithUnsignedLongLong:self->_acceleratorId];
        v29[0] = v23;
        v29[1] = MEMORY[0x263EFFA88];
        v28[1] = @"available";
        v28[2] = @"enabled";
        v12 = NSNumber;
        v24 = [v3 objectForKeyedSubscript:@"is_enabled"];
        v21 = [v12 numberWithBool:[v24 boolValue]];
        v29[2] = v21;
        v28[3] = @"sustained";
        v13 = NSNumber;
        v22 = [v3 objectForKeyedSubscript:@"was_consistent"];
        v14 = [v13 numberWithBool:[v22 BOOLValue]];
        v29[3] = v14;
        v28[4] = @"level";
        v15 = NSNumber;
        v16 = [v3 objectForKeyedSubscript:];
        v17 = [v15 numberWithUnsignedInt:[v16 unsignedIntValue]];
        v29[4] = v17;
        v28[5] = @"mapping";
        v18 = [NSNumber numberWithUnsignedInt:(v10 << 16) | (v9 << 24) | (v11 << 8)];
        v29[5] = v18;
        uint64_t v7 = v25;
        v19 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:6];
        [v8 addEntriesFromDictionary:v19];
      }
    }
    else
    {
      v8 = &unk_26E5343C0;
    }
  }
  else
  {
    v8 = &unk_26E534398;
  }

  return v8;
}

- (BOOL)enable:(unint64_t)a3
{
  return MEMORY[0x270F9A6D0](self->_agxDevice, sel_enableConsistentPerfState_);
}

- (id)disable
{
  v3 = [(DTGPUPerformanceStateControlAGXUMD *)self currentState];
  [(AGXConsistentStateDevice *)self->_agxDevice disableConsistentPerfState];
  return v3;
}

- (void).cxx_destruct
{
}

@end