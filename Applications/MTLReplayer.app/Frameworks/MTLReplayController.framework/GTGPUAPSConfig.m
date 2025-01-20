@interface GTGPUAPSConfig
- (NSDictionary)grcTrigger;
- (id)initForCounters;
- (id)initForMinimumInfoCounters;
- (id)initForMinimumInfoProfiling;
- (id)initForMinimumInfoTimeline;
- (id)initForProfiling;
- (id)initForTimeline;
- (id)toDictionary;
- (unint64_t)bufferSizeInKb;
- (unint64_t)cliqueTraceLevel;
- (unint64_t)countPeriod;
- (unint64_t)duration;
- (unint64_t)emitPos;
- (unint64_t)emitThreadControlFlow;
- (unint64_t)eslInstTracing;
- (unint64_t)pulsePeriod;
- (unint64_t)subSamplingMinTraced;
- (unint64_t)subSamplingTargetThreshold;
- (unint64_t)syncDrainMode;
- (unint64_t)systemTimePeriod;
- (unint64_t)tileTracing;
- (void)readConfig:(id)a3;
- (void)setBufferSizeInKb:(unint64_t)a3;
- (void)setCliqueTraceLevel:(unint64_t)a3;
- (void)setCountPeriod:(unint64_t)a3;
- (void)setDuration:(unint64_t)a3;
- (void)setEmitPos:(unint64_t)a3;
- (void)setEmitThreadControlFlow:(unint64_t)a3;
- (void)setEslInstTracing:(unint64_t)a3;
- (void)setPulsePeriod:(unint64_t)a3;
- (void)setSubSamplingMinTraced:(unint64_t)a3;
- (void)setSubSamplingTargetThreshold:(unint64_t)a3;
- (void)setSyncDrainMode:(unint64_t)a3;
- (void)setSystemTimePeriod:(unint64_t)a3;
- (void)setTileTracing:(unint64_t)a3;
@end

@implementation GTGPUAPSConfig

- (void)setSubSamplingTargetThreshold:(unint64_t)a3
{
  self->_subSamplingTargetThreshold = a3;
}

- (unint64_t)subSamplingTargetThreshold
{
  return self->_subSamplingTargetThreshold;
}

- (void)setSubSamplingMinTraced:(unint64_t)a3
{
  self->_subSamplingMinTraced = a3;
}

- (unint64_t)subSamplingMinTraced
{
  return self->_subSamplingMinTraced;
}

- (void)setEmitThreadControlFlow:(unint64_t)a3
{
  self->_emitThreadControlFlow = a3;
}

- (unint64_t)emitThreadControlFlow
{
  return self->_emitThreadControlFlow;
}

- (void)setEmitPos:(unint64_t)a3
{
  self->_emitPos = a3;
}

- (unint64_t)emitPos
{
  return self->_emitPos;
}

- (void)setCliqueTraceLevel:(unint64_t)a3
{
  self->_cliqueTraceLevel = a3;
}

- (unint64_t)cliqueTraceLevel
{
  return self->_cliqueTraceLevel;
}

- (void)setSystemTimePeriod:(unint64_t)a3
{
  self->_systemTimePeriod = a3;
}

- (unint64_t)systemTimePeriod
{
  return self->_systemTimePeriod;
}

- (void)setBufferSizeInKb:(unint64_t)a3
{
  self->_ringBufferSizeInKb = a3;
}

- (unint64_t)bufferSizeInKb
{
  return self->_ringBufferSizeInKb;
}

- (void)setEslInstTracing:(unint64_t)a3
{
  self->_eslInstTracing = a3;
}

- (unint64_t)eslInstTracing
{
  return self->_eslInstTracing;
}

- (void)setTileTracing:(unint64_t)a3
{
  self->_tileTracing = a3;
}

- (unint64_t)tileTracing
{
  return self->_tileTracing;
}

- (void)setCountPeriod:(unint64_t)a3
{
  self->_countPeriod = a3;
}

- (unint64_t)countPeriod
{
  return self->_countPeriod;
}

- (void)setPulsePeriod:(unint64_t)a3
{
  self->_pulsePeriod = a3;
}

- (unint64_t)pulsePeriod
{
  return self->_pulsePeriod;
}

- (void)setDuration:(unint64_t)a3
{
  self->_duration = a3;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (void)setSyncDrainMode:(unint64_t)a3
{
  self->_syncDrainMode = a3;
}

- (unint64_t)syncDrainMode
{
  return self->_syncDrainMode;
}

- (NSDictionary)grcTrigger
{
  v2 = [(GTGPUAPSConfig *)self toDictionary];
  v3 = [v2 objectForKeyedSubscript:@"KickAndStateTracing"];

  return (NSDictionary *)v3;
}

- (void)readConfig:(id)a3
{
  id v36 = a3;
  v4 = [v36 objectForKeyedSubscript:@"SyncDrainMode"];
  if (v4)
  {
    v5 = [v36 objectForKeyedSubscript:@"SyncDrainMode"];
    self->_syncDrainMode = (unint64_t)[v5 unsignedIntegerValue];
  }
  v6 = [v36 objectForKeyedSubscript:@"Duration"];
  if (v6)
  {
    v7 = [v36 objectForKeyedSubscript:@"Duration"];
    self->_duration = (unint64_t)[v7 unsignedIntegerValue];
  }
  v8 = [v36 objectForKeyedSubscript:@"RingBufferSizeInKB"];
  if (v8)
  {
    v9 = [v36 objectForKeyedSubscript:@"RingBufferSizeInKB"];
    self->_ringBufferSizeInKb = (unint64_t)[v9 unsignedIntegerValue];
  }
  v10 = [v36 objectForKeyedSubscript:@"SystemTimePeriod"];
  if (v10)
  {
    v11 = [v36 objectForKeyedSubscript:@"SystemTimePeriod"];
    self->_systemTimePeriod = (unint64_t)[v11 unsignedIntegerValue];
  }
  v12 = [v36 objectForKeyedSubscript:@"ProfileControl"];
  v13 = v12;
  if (v12)
  {
    v14 = [v12 objectForKeyedSubscript:@"CliqueTraceLevel"];
    if (v14)
    {
      v15 = [v13 objectForKeyedSubscript:@"CliqueTraceLevel"];
      self->_cliqueTraceLevel = (unint64_t)[v15 unsignedIntegerValue];
    }
    v16 = [v13 objectForKeyedSubscript:@"EmitPos"];
    if (v16)
    {
      v17 = [v13 objectForKeyedSubscript:@"EmitPos"];
      self->_emitPos = (unint64_t)[v17 unsignedIntegerValue];
    }
    v18 = [v13 objectForKeyedSubscript:@"EmitThreadControlFlow"];
    if (v18)
    {
      v19 = [v13 objectForKeyedSubscript:@"EmitThreadControlFlow"];
      self->_emitThreadControlFlow = (unint64_t)[v19 unsignedIntegerValue];
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
      self->_subSamplingMinTraced = (unint64_t)[v23 unsignedIntegerValue];
    }
    v24 = [v21 objectForKeyedSubscript:@"TargetThreshold"];
    if (v24)
    {
      v25 = [v21 objectForKeyedSubscript:@"TargetThreshold"];
      self->_subSamplingTargetThreshold = (unint64_t)[v25 unsignedIntegerValue];
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
      self->_pulsePeriod = (unint64_t)[v29 unsignedIntegerValue];
    }
    v30 = [v27 objectForKeyedSubscript:@"CountPeriod"];
    if (v30)
    {
      v31 = [v27 objectForKeyedSubscript:@"CountPeriod"];
      self->_countPeriod = (unint64_t)[v31 unsignedIntegerValue];
    }
    v32 = [v27 objectForKeyedSubscript:@"TileTracing"];
    if (v32)
    {
      v33 = [v27 objectForKeyedSubscript:@"TileTracing"];
      self->_tileTracing = (unint64_t)[v33 unsignedIntegerValue];
    }
    v34 = [v27 objectForKeyedSubscript:@"ESLInstTracing"];
    if (v34)
    {
      v35 = [v27 objectForKeyedSubscript:@"ESLInstTracing"];
      self->_eslInstTracing = (unint64_t)[v35 unsignedIntegerValue];
    }
  }
}

- (id)initForMinimumInfoProfiling
{
  v4.receiver = self;
  v4.super_class = (Class)GTGPUAPSConfig;
  id result = [(GTGPUAPSConfig *)&v4 init];
  if (result)
  {
    *((void *)result + 1) = 1;
    *(_OWORD *)((char *)result + 56) = xmmword_4C7FA0;
    *((void *)result + 10) = 0;
    *((void *)result + 11) = 0;
    int64x2_t v3 = vdupq_n_s64(1uLL);
    *((void *)result + 9) = 3;
    *((int64x2_t *)result + 6) = v3;
    *(_OWORD *)((char *)result + 24) = xmmword_4C7FB0;
    *(int64x2_t *)((char *)result + 40) = v3;
  }
  return result;
}

- (id)initForMinimumInfoCounters
{
  v3.receiver = self;
  v3.super_class = (Class)GTGPUAPSConfig;
  id result = [(GTGPUAPSConfig *)&v3 init];
  if (result)
  {
    *((void *)result + 1) = 1;
    *(_OWORD *)((char *)result + 56) = xmmword_4C7FC0;
    *((void *)result + 10) = 0;
    *((void *)result + 11) = 0;
    *((void *)result + 9) = 1;
    *((int64x2_t *)result + 6) = vdupq_n_s64(1uLL);
    *(_OWORD *)((char *)result + 24) = xmmword_4C7FB0;
    *(_OWORD *)((char *)result + 40) = xmmword_4C7FD0;
  }
  return result;
}

- (id)initForMinimumInfoTimeline
{
  v3.receiver = self;
  v3.super_class = (Class)GTGPUAPSConfig;
  id result = [(GTGPUAPSConfig *)&v3 init];
  if (result)
  {
    *((void *)result + 1) = 1;
    *(_OWORD *)((char *)result + 56) = xmmword_4C7FC0;
    *((void *)result + 10) = 0;
    *((void *)result + 11) = 0;
    *((void *)result + 9) = 1;
    *((int64x2_t *)result + 6) = vdupq_n_s64(1uLL);
    *(_OWORD *)((char *)result + 24) = xmmword_4C7FB0;
    *(_OWORD *)((char *)result + 40) = xmmword_4C7FD0;
  }
  return result;
}

- (id)initForTimeline
{
  v3.receiver = self;
  v3.super_class = (Class)GTGPUAPSConfig;
  id result = [(GTGPUAPSConfig *)&v3 init];
  if (result)
  {
    *((void *)result + 1) = 1;
    *(_OWORD *)((char *)result + 56) = xmmword_4C7FC0;
    *(_OWORD *)((char *)result + 72) = xmmword_4C7FE0;
    *((void *)result + 12) = 0;
    *((void *)result + 13) = 0;
    *((void *)result + 11) = 1;
    *(_OWORD *)((char *)result + 24) = xmmword_4C7FF0;
    *(_OWORD *)((char *)result + 40) = xmmword_4C7FD0;
  }
  return result;
}

- (id)initForCounters
{
  v3.receiver = self;
  v3.super_class = (Class)GTGPUAPSConfig;
  id result = [(GTGPUAPSConfig *)&v3 init];
  if (result)
  {
    *((void *)result + 1) = 1;
    *(_OWORD *)((char *)result + 56) = xmmword_4C7FC0;
    *((void *)result + 10) = 0;
    *((void *)result + 11) = 0;
    *((void *)result + 9) = 1;
    *((int64x2_t *)result + 6) = vdupq_n_s64(1uLL);
    *(_OWORD *)((char *)result + 24) = xmmword_4C7FF0;
    *(_OWORD *)((char *)result + 40) = xmmword_4C7FD0;
  }
  return result;
}

- (id)initForProfiling
{
  v3.receiver = self;
  v3.super_class = (Class)GTGPUAPSConfig;
  id result = [(GTGPUAPSConfig *)&v3 init];
  if (result)
  {
    *((void *)result + 1) = 1;
    *(_OWORD *)((char *)result + 56) = xmmword_4C7FA0;
    *(_OWORD *)((char *)result + 72) = xmmword_4C8000;
    *((void *)result + 12) = 0;
    *((void *)result + 13) = 0;
    *((void *)result + 11) = 1;
    *(_OWORD *)((char *)result + 24) = xmmword_4C8010;
    *(int64x2_t *)((char *)result + 40) = vdupq_n_s64(1uLL);
  }
  return result;
}

- (id)toDictionary
{
  v29[0] = @"Duration";
  v22 = +[NSNumber numberWithUnsignedInteger:self->_duration];
  v30[0] = v22;
  v29[1] = @"RingBufferSizeInKB";
  v21 = +[NSNumber numberWithUnsignedInteger:self->_ringBufferSizeInKb];
  v30[1] = v21;
  v29[2] = @"BufferSizeInKB";
  v20 = +[NSNumber numberWithUnsignedInteger:10 * self->_ringBufferSizeInKb];
  v30[2] = v20;
  v29[3] = @"SystemTimePeriod";
  v19 = +[NSNumber numberWithUnsignedInteger:self->_systemTimePeriod];
  v30[3] = v19;
  v29[4] = @"ProfileControl";
  v27[0] = @"CliqueTraceLevel";
  v18 = +[NSNumber numberWithUnsignedInteger:self->_cliqueTraceLevel];
  v28[0] = v18;
  v27[1] = @"EmitPos";
  v17 = +[NSNumber numberWithUnsignedInteger:self->_emitPos];
  v28[1] = v17;
  v27[2] = @"EmitThreadControlFlow";
  v16 = +[NSNumber numberWithUnsignedInteger:self->_emitThreadControlFlow];
  v28[2] = v16;
  v15 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:3];
  v30[4] = v15;
  v29[5] = @"SyncDrainMode";
  objc_super v3 = +[NSNumber numberWithUnsignedInteger:self->_syncDrainMode];
  v30[5] = v3;
  v29[6] = @"KickAndStateTracing";
  v25[0] = @"PulsePeriod";
  objc_super v4 = +[NSNumber numberWithUnsignedInteger:self->_pulsePeriod];
  v26[0] = v4;
  v25[1] = @"CountPeriod";
  v5 = +[NSNumber numberWithUnsignedInteger:self->_countPeriod];
  v26[1] = v5;
  v25[2] = @"TileTracing";
  v6 = +[NSNumber numberWithUnsignedInteger:self->_tileTracing];
  v26[2] = v6;
  v25[3] = @"ESLInstTracing";
  v7 = +[NSNumber numberWithUnsignedInteger:self->_eslInstTracing];
  v26[3] = v7;
  v8 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];
  v30[6] = v8;
  v9 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:7];
  v10 = +[NSMutableDictionary dictionaryWithDictionary:v9];

  if (*(_OWORD *)&self->_subSamplingMinTraced != 0)
  {
    v23[0] = @"MinTraced";
    v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
    v23[1] = @"TargetThreshold";
    v24[0] = v11;
    v12 = +[NSNumber numberWithUnsignedInteger:self->_subSamplingTargetThreshold];
    v24[1] = v12;
    v13 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
    [v10 setObject:v13 forKeyedSubscript:@"CliqueSubSampling"];
  }

  return v10;
}

@end