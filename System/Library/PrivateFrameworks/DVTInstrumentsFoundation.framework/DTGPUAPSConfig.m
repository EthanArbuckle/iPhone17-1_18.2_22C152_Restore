@interface DTGPUAPSConfig
- (DTGPUAPSConfig)init;
- (NSDictionary)grcTrigger;
- (id)toDictionary;
- (unint64_t)cliqueTraceLevel;
- (unint64_t)countPeriod;
- (unint64_t)duration;
- (unint64_t)emitPos;
- (unint64_t)emitThreadControlFlow;
- (unint64_t)eslInstTracing;
- (unint64_t)nRingBuffers;
- (unint64_t)pulsePeriod;
- (unint64_t)ringBufferSizeInKB;
- (unint64_t)subSamplingMinTraced;
- (unint64_t)subSamplingTargetThreshold;
- (unint64_t)systemTimePeriod;
- (unint64_t)tileTracing;
- (void)readConfig:(id)a3;
- (void)setCliqueTraceLevel:(unint64_t)a3;
- (void)setCountPeriod:(unint64_t)a3;
- (void)setDuration:(unint64_t)a3;
- (void)setEmitPos:(unint64_t)a3;
- (void)setEmitThreadControlFlow:(unint64_t)a3;
- (void)setEslInstTracing:(unint64_t)a3;
- (void)setNRingBuffers:(unint64_t)a3;
- (void)setPulsePeriod:(unint64_t)a3;
- (void)setRingBufferSizeInKB:(unint64_t)a3;
- (void)setSubSamplingMinTraced:(unint64_t)a3;
- (void)setSubSamplingTargetThreshold:(unint64_t)a3;
- (void)setSystemTimePeriod:(unint64_t)a3;
- (void)setTileTracing:(unint64_t)a3;
@end

@implementation DTGPUAPSConfig

- (id)toDictionary
{
  v31[7] = *MEMORY[0x263EF8340];
  v20 = (void *)MEMORY[0x263EFF9A0];
  v30[0] = @"Duration";
  v23 = [NSNumber numberWithUnsignedInteger:self->_duration];
  v31[0] = v23;
  v30[1] = @"BufferSizeInKB";
  unint64_t nRingBuffers = self->_nRingBuffers;
  if (nRingBuffers <= 1) {
    unint64_t nRingBuffers = 1;
  }
  v22 = [NSNumber numberWithUnsignedInteger:nRingBuffers * self->_ringBufferSizeInKB];
  v31[1] = v22;
  v30[2] = @"RingBufferSizeInKB";
  v21 = [NSNumber numberWithUnsignedInteger:self->_ringBufferSizeInKB];
  v31[2] = v21;
  v30[3] = @"SystemTimePeriod";
  v19 = [NSNumber numberWithUnsignedInteger:self->_systemTimePeriod];
  v31[3] = v19;
  v30[4] = @"ProfileControl";
  v28[0] = @"CliqueTraceLevel";
  v18 = [NSNumber numberWithUnsignedInteger:self->_cliqueTraceLevel];
  v29[0] = v18;
  v28[1] = @"EmitPos";
  v17 = [NSNumber numberWithUnsignedInteger:self->_emitPos];
  v29[1] = v17;
  v28[2] = @"EmitThreadControlFlow";
  v16 = [NSNumber numberWithUnsignedInteger:self->_emitThreadControlFlow];
  v29[2] = v16;
  v4 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:3];
  v31[4] = v4;
  v31[5] = &unk_26E5340A0;
  v30[5] = @"SyncDrainMode";
  v30[6] = @"KickAndStateTracing";
  v26[0] = @"PulsePeriod";
  v5 = [NSNumber numberWithUnsignedInteger:self->_pulsePeriod];
  v27[0] = v5;
  v26[1] = @"CountPeriod";
  v6 = [NSNumber numberWithUnsignedInteger:self->_countPeriod];
  v27[1] = v6;
  v26[2] = @"TileTracing";
  v7 = [NSNumber numberWithUnsignedInteger:self->_tileTracing];
  v27[2] = v7;
  v26[3] = @"ESLInstTracing";
  v8 = [NSNumber numberWithUnsignedInteger:self->_eslInstTracing];
  v27[3] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:4];
  v31[6] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:7];
  v11 = [v20 dictionaryWithDictionary:v10];

  if (self->_subSamplingMinTraced || self->_subSamplingTargetThreshold)
  {
    v24[0] = @"MinTraced";
    v12 = [NSNumber numberWithUnsignedInteger:];
    v24[1] = @"TargetThreshold";
    v25[0] = v12;
    v13 = [NSNumber numberWithUnsignedInteger:self->_subSamplingTargetThreshold];
    v25[1] = v13;
    v14 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
    [v11 setObject:v14 forKeyedSubscript:@"CliqueSubSampling"];
  }
  return v11;
}

- (DTGPUAPSConfig)init
{
  v3.receiver = self;
  v3.super_class = (Class)DTGPUAPSConfig;
  result = [(DTGPUAPSConfig *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_ringBufferSizeInKB = xmmword_23094A310;
    result->_emitPos = 0;
    result->_emitThreadControlFlow = 0;
    result->_cliqueTraceLevel = 2;
    *(int64x2_t *)&result->_subSamplingMinTraced = vdupq_n_s64(1uLL);
    *(_OWORD *)&result->_pulsePeriod = xmmword_23094A320;
    result->_tileTracing = 0;
    result->_eslInstTracing = 0;
    result->_unint64_t nRingBuffers = 10;
  }
  return result;
}

- (void)readConfig:(id)a3
{
  id v36 = a3;
  v4 = [v36 objectForKeyedSubscript:@"Duration"];
  if (v4)
  {
    v5 = [v36 objectForKeyedSubscript:@"Duration"];
    self->_duration = [v5 unsignedIntegerValue];
  }
  v6 = [v36 objectForKeyedSubscript:@"RingBufferSizeInKB"];
  if (v6)
  {
    v7 = [v36 objectForKeyedSubscript:@"RingBufferSizeInKB"];
    self->_ringBufferSizeInKB = [v7 unsignedIntegerValue];
  }
  v8 = [v36 objectForKeyedSubscript:@"SystemTimePeriod"];
  if (v8)
  {
    v9 = [v36 objectForKeyedSubscript:@"SystemTimePeriod"];
    self->_systemTimePeriod = [v9 unsignedIntegerValue];
  }
  v10 = [v36 objectForKeyedSubscript:@"NumRingBuffers"];
  if (v10)
  {
    v11 = [v36 objectForKeyedSubscript:@"NumRingBuffers"];
    self->_unint64_t nRingBuffers = [v11 unsignedIntegerValue];
  }
  v12 = [v36 objectForKeyedSubscript:@"ProfileControl"];
  v13 = v12;
  if (v12)
  {
    v14 = [v12 objectForKeyedSubscript:@"CliqueTraceLevel"];
    if (v14)
    {
      v15 = [v13 objectForKeyedSubscript:@"CliqueTraceLevel"];
      self->_cliqueTraceLevel = [v15 unsignedIntegerValue];
    }
    v16 = [v13 objectForKeyedSubscript:@"EmitPos"];
    if (v16)
    {
      v17 = [v13 objectForKeyedSubscript:@"EmitPos"];
      self->_emitPos = [v17 unsignedIntegerValue];
    }
    v18 = [v13 objectForKeyedSubscript:@"EmitThreadControlFlow"];
    if (v18)
    {
      v19 = [v13 objectForKeyedSubscript:@"EmitThreadControlFlow"];
      self->_emitThreadControlFlow = [v19 unsignedIntegerValue];
    }
  }
  v20 = [v36 objectForKeyedSubscript:@"CliqueSubSampling"];
  v21 = v20;
  if (v20)
  {
    v22 = [v20 objectForKeyedSubscript:@"MinTraced"];
    if (v22)
    {
      v23 = [v21 objectForKeyedSubscript:@"MinTraced"];
      self->_subSamplingMinTraced = [v23 unsignedIntegerValue];
    }
    v24 = [v21 objectForKeyedSubscript:@"TargetThreshold"];
    if (v24)
    {
      v25 = [v21 objectForKeyedSubscript:@"TargetThreshold"];
      self->_subSamplingTargetThreshold = [v25 unsignedIntegerValue];
    }
  }
  v26 = [v36 objectForKeyedSubscript:@"KickAndStateTracing"];
  v27 = v26;
  if (v26)
  {
    v28 = [v26 objectForKeyedSubscript:@"PulsePeriod"];
    if (v28)
    {
      v29 = [v27 objectForKeyedSubscript:@"PulsePeriod"];
      self->_pulsePeriod = [v29 unsignedIntegerValue];
    }
    v30 = [v27 objectForKeyedSubscript:@"CountPeriod"];
    if (v30)
    {
      v31 = [v27 objectForKeyedSubscript:@"CountPeriod"];
      self->_countPeriod = [v31 unsignedIntegerValue];
    }
    v32 = [v27 objectForKeyedSubscript:@"TileTracing"];
    if (v32)
    {
      v33 = [v27 objectForKeyedSubscript:@"TileTracing"];
      self->_tileTracing = [v33 unsignedIntegerValue];
    }
    v34 = [v27 objectForKeyedSubscript:@"ESLInstTracing"];
    if (v34)
    {
      v35 = [v27 objectForKeyedSubscript:@"ESLInstTracing"];
      self->_eslInstTracing = [v35 unsignedIntegerValue];
    }
  }
}

- (NSDictionary)grcTrigger
{
  v2 = [(DTGPUAPSConfig *)self toDictionary];
  objc_super v3 = [v2 objectForKeyedSubscript:@"KickAndStateTracing"];

  return (NSDictionary *)v3;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(unint64_t)a3
{
  self->_duration = a3;
}

- (unint64_t)pulsePeriod
{
  return self->_pulsePeriod;
}

- (void)setPulsePeriod:(unint64_t)a3
{
  self->_pulsePeriod = a3;
}

- (unint64_t)countPeriod
{
  return self->_countPeriod;
}

- (void)setCountPeriod:(unint64_t)a3
{
  self->_countPeriod = a3;
}

- (unint64_t)tileTracing
{
  return self->_tileTracing;
}

- (void)setTileTracing:(unint64_t)a3
{
  self->_tileTracing = a3;
}

- (unint64_t)eslInstTracing
{
  return self->_eslInstTracing;
}

- (void)setEslInstTracing:(unint64_t)a3
{
  self->_eslInstTracing = a3;
}

- (unint64_t)ringBufferSizeInKB
{
  return self->_ringBufferSizeInKB;
}

- (void)setRingBufferSizeInKB:(unint64_t)a3
{
  self->_ringBufferSizeInKB = a3;
}

- (unint64_t)systemTimePeriod
{
  return self->_systemTimePeriod;
}

- (void)setSystemTimePeriod:(unint64_t)a3
{
  self->_systemTimePeriod = a3;
}

- (unint64_t)cliqueTraceLevel
{
  return self->_cliqueTraceLevel;
}

- (void)setCliqueTraceLevel:(unint64_t)a3
{
  self->_cliqueTraceLevel = a3;
}

- (unint64_t)emitPos
{
  return self->_emitPos;
}

- (void)setEmitPos:(unint64_t)a3
{
  self->_emitPos = a3;
}

- (unint64_t)emitThreadControlFlow
{
  return self->_emitThreadControlFlow;
}

- (void)setEmitThreadControlFlow:(unint64_t)a3
{
  self->_emitThreadControlFlow = a3;
}

- (unint64_t)subSamplingMinTraced
{
  return self->_subSamplingMinTraced;
}

- (void)setSubSamplingMinTraced:(unint64_t)a3
{
  self->_subSamplingMinTraced = a3;
}

- (unint64_t)subSamplingTargetThreshold
{
  return self->_subSamplingTargetThreshold;
}

- (void)setSubSamplingTargetThreshold:(unint64_t)a3
{
  self->_subSamplingTargetThreshold = a3;
}

- (unint64_t)nRingBuffers
{
  return self->_nRingBuffers;
}

- (void)setNRingBuffers:(unint64_t)a3
{
  self->_unint64_t nRingBuffers = a3;
}

@end