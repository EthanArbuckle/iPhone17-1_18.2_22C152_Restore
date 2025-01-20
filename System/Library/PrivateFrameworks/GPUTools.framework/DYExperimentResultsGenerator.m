@interface DYExperimentResultsGenerator
- (BOOL)isDone;
- (BOOL)shouldTerminateExperiment;
- (DYExperimentOverrideEnable)experiment;
- (DYExperimentResultsGenerator)init;
- (DYExperimentResultsGenerator)initWithExperiment:(id)a3;
- (DYFunctionPlayer)functionPlayer;
- (id).cxx_construct;
- (unsigned)prevFileFunctionIndex;
- (void)begin;
- (void)beginIteration:(unsigned int)a3;
- (void)dealloc;
- (void)end;
- (void)endIteration;
- (void)onFrameEnd;
- (void)onFrameStart;
- (void)onGraphicsFunctionEnd;
- (void)onPlatformFunctionEnd;
- (void)setFunctionPlayer:(id)a3;
- (void)startTiming;
- (void)stopTiming;
- (void)terminateExperiment;
@end

@implementation DYExperimentResultsGenerator

- (DYExperimentResultsGenerator)init
{
  return 0;
}

- (DYExperimentResultsGenerator)initWithExperiment:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DYExperimentResultsGenerator;
  v4 = [(DYExperimentResultsGenerator *)&v6 init];
  result = 0;
  if (a3)
  {
    if (v4)
    {
      v4->_experiment = (DYExperimentOverrideEnable *)a3;
      v4->_prevFileFunctionIndex = -1;
      return v4;
    }
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DYExperimentResultsGenerator;
  [(DYExperimentResultsGenerator *)&v3 dealloc];
}

- (void)begin
{
}

- (void)end
{
}

- (void)startTiming
{
  unsigned int iteration = self->_iteration;
  if (iteration == [(DYExperiment *)self->_experiment warmupCount]) {
    self->_startGlobalTime = self->_frameTimeStart;
  }
}

- (void)stopTiming
{
  if ([(DYExperiment *)self->_experiment enablePerFrameTiming])
  {
    if (*MEMORY[0x263F3FA20] != *(_DWORD *)(MEMORY[0x263F3FA20] + 4)) {
      __udivti3();
    }
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
    id v4 = (id)[(NSMutableDictionary *)[(DYExperiment *)self->_experiment results] objectForKey:@"DurationArray"];
    if (!v4)
    {
      id v5 = (id)objc_opt_new();
      [(NSMutableDictionary *)[(DYExperiment *)self->_experiment results] setObject:v5 forKey:@"DurationArray"];
      id v4 = v5;
    }
    id v6 = v4;
    [v4 addObject:v3];
  }
}

- (void)beginIteration:(unsigned int)a3
{
  self->_unsigned int iteration = a3;
  if (!a3) {
    -[NSMutableDictionary setObject:forKey:](-[DYExperiment results](self->_experiment, "results"), "setObject:forKey:", [NSNumber numberWithUnsignedLongLong:DYTimingBenchmark()], @"TimingCost");
  }
  self->_frameTimeStart = mach_absolute_time();
  if ([(DYExperiment *)self->_experiment enablePerFrameTiming]
    && (unsigned int iteration = self->_iteration, iteration >= [(DYExperiment *)self->_experiment warmupCount])
    || (uint64_t v5 = [(DYExperiment *)self->_experiment enablePerFrameTiming], (v5 & 1) == 0)
    && (unsigned int v6 = self->_iteration, v5 = [(DYExperiment *)self->_experiment warmupCount], v6 == v5))
  {
    uint64_t v5 = [(DYExperimentResultsGenerator *)self startTiming];
  }
  MEMORY[0x270F2DC48](v5);
}

- (void)endIteration
{
  uint64_t v3 = mach_absolute_time();
  self->_frameTimeEnd = v3;
  unint64_t v4 = v3 - self->_frameTimeStart;
  if (*MEMORY[0x263F3FA20] != *(_DWORD *)(MEMORY[0x263F3FA20] + 4)) {
    unint64_t v4 = __udivti3();
  }
  self->_frameTime = v4;
  if ([(DYExperiment *)self->_experiment enablePerFrameTiming]
    && (unsigned int iteration = self->_iteration, iteration >= [(DYExperiment *)self->_experiment warmupCount])
    || ![(DYExperiment *)self->_experiment enablePerFrameTiming]
    && (unsigned int v6 = self->_iteration,
        unsigned int v7 = [(DYExperiment *)self->_experiment warmupCount],
        v6 == v7 + [(DYExperiment *)self->_experiment repeatCount] - 1))
  {
    [(DYExperimentResultsGenerator *)self stopTiming];
  }
  if (([(DYExperiment *)self->_experiment profilingFlags] & 2) != 0)
  {
    unsigned int v8 = self->_iteration;
    if (v8 >= [(DYExperiment *)self->_experiment warmupCount])
    {
      uint64_t v9 = DYGetProfilingData();
      if (v9)
      {
        v10 = (void *)v9;
        id v11 = (id)[(NSMutableDictionary *)[(DYExperiment *)self->_experiment results] objectForKey:@"GLProfilingDataArray"];
        if (!v11)
        {
          id v11 = (id)objc_opt_new();
          [(NSMutableDictionary *)[(DYExperiment *)self->_experiment results] setObject:v11 forKey:@"GLProfilingDataArray"];
        }
        v12 = (void *)[v10 copy];
        [v11 addObject:v12];
      }
    }
  }
  if ([(DYExperimentResultsGenerator *)self shouldTerminateExperiment])
  {
    [(DYExperimentResultsGenerator *)self terminateExperiment];
  }
}

- (void)onFrameStart
{
  unsigned int iteration = self->_iteration;
  if (iteration >= [(DYExperiment *)self->_experiment warmupCount]
    && ([(DYExperiment *)self->_experiment profilingFlags] & 0x40) != 0)
  {
    DYGetAllPerFunctionProfilingData();
    self->_prevFileFunctionIndex = -1;
  }
}

- (void)onFrameEnd
{
  unsigned int iteration = self->_iteration;
  if (iteration >= [(DYExperiment *)self->_experiment warmupCount]
    && ([(DYExperiment *)self->_experiment profilingFlags] & 0x40) != 0)
  {
    uint64_t v4 = DYGetAllPerFunctionProfilingData();
    if (v4)
    {
      uint64_t v5 = v4;
      unsigned int v6 = [(DYExperiment *)self->_experiment results];
      [(NSMutableDictionary *)v6 setObject:v5 forKey:@"PerFunctionProfilingData"];
    }
  }
}

- (void)onGraphicsFunctionEnd
{
  if (([(DYExperiment *)self->_experiment profilingFlags] & 0x40) != 0) {
    self->_prevFileFunctionIndex = [(DYFunctionPlayer *)self->_functionPlayer currentFileFunctionIndex];
  }
}

- (void)onPlatformFunctionEnd
{
  if (([(DYExperiment *)self->_experiment profilingFlags] & 0x40) != 0) {
    self->_prevFileFunctionIndex = [(DYFunctionPlayer *)self->_functionPlayer currentFileFunctionIndex];
  }
}

- (BOOL)shouldTerminateExperiment
{
  unsigned int iteration = self->_iteration;
  if (iteration < [(DYExperiment *)self->_experiment warmupCount]) {
    goto LABEL_2;
  }
  p_frameTimeStatistics = &self->_frameTimeStatistics;
  value = self->_frameTimeStatistics.__ptr_.__value_;
  if (!value) {
    operator new();
  }
  GPUTools::RunningStatistics<unsigned long long>::AddElement((uint64_t)value, &self->_frameTime);
  unsigned int v7 = self->_iteration;
  unsigned int v8 = [(DYExperiment *)self->_experiment warmupCount];
  if (v7 == v8 + [(DYExperiment *)self->_experiment repeatCount] - 1) {
    goto LABEL_6;
  }
  BOOL v4 = [(DYExperiment *)self->_experiment allowEarlyTermination];
  if (!v4) {
    return v4;
  }
  unsigned int v10 = *((_DWORD *)p_frameTimeStatistics->__ptr_.__value_ + 6);
  if (*((_DWORD *)p_frameTimeStatistics->__ptr_.__value_ + 56) < v10) {
    goto LABEL_2;
  }
  uint64_t v9 = p_frameTimeStatistics->__ptr_.__value_;
  double v11 = (double)(unint64_t)(*(void *)(v9[19] + 8 * ((*((_DWORD *)v9 + 57) + v10) % v10))
                                 - *(void *)(v9[13] + 8 * ((*((_DWORD *)v9 + 57) + v10) % v10)))
      / (double)*(unint64_t *)(v9[7] + 8 * ((*((_DWORD *)v9 + 57) + v10) % v10));
  [(DYExperiment *)self->_experiment frameTimeVariationLimit1];
  if (v11 < v12
    || (unsigned int v13 = *((_DWORD *)self->_frameTimeStatistics.__ptr_.__value_ + 56),
        v13 >= [(DYExperiment *)self->_experiment frameTimeVariationArraySize])
    && (double v19 = 0.0,
        double v20 = 0.0,
        GPUTools::RunningStatistics<unsigned long long>::IQRtoIQMRatioMinMax((uint64_t)self->_frameTimeStatistics.__ptr_.__value_, [(DYExperiment *)self->_experiment frameTimeVariationArraySize], &v20, &v19))&& (double v14 = v19, [(DYExperiment *)self->_experiment frameTimeVariationLimit2], v14 < v15)&& (v16 = v19 - v20, [(DYExperiment *)self->_experiment frameTimeVariationRangeMax], v16 < v17))
  {
LABEL_6:
    LOBYTE(v4) = 1;
  }
  else
  {
LABEL_2:
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)terminateExperiment
{
  if (self->_frameTimeStatistics.__ptr_.__value_)
  {
    uint64_t v3 = objc_opt_new();
    value = self->_frameTimeStatistics.__ptr_.__value_;
    unsigned int v5 = value[56];
    if (v5)
    {
      unsigned int v6 = 0;
      int v7 = -1;
      do
      {
        if (v5 >= v5 + v7) {
          v5 += v7;
        }
        objc_msgSend(v3, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", *(void *)(*(void *)value + 8 * ((value[57] - v5 + value[6]) % value[6]))));
        ++v6;
        value = self->_frameTimeStatistics.__ptr_.__value_;
        unsigned int v5 = value[56];
        --v7;
      }
      while (v6 < v5);
    }
    [(NSMutableDictionary *)[(DYExperiment *)self->_experiment results] setObject:v3 forKey:@"FrameTime"];
  }
  -[NSMutableDictionary setObject:forKey:](-[DYExperiment results](self->_experiment, "results"), "setObject:forKey:", [NSNumber numberWithUnsignedLongLong:self->_iteration + 1], @"IterationDone");
  unint64_t v8 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](-[DYExperiment results](self->_experiment, "results"), "objectForKey:", @"TimingCost"), "unsignedLongLongValue");
  unint64_t v9 = DYTimingBenchmark();
  if (v9 >= v8) {
    unint64_t v10 = v8;
  }
  else {
    unint64_t v10 = v9;
  }
  if (v8) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v9;
  }
  -[NSMutableDictionary setObject:forKey:](-[DYExperiment results](self->_experiment, "results"), "setObject:forKey:", [NSNumber numberWithUnsignedLongLong:v11], @"TimingCost");
  double v12 = NSNumber;
  if (*MEMORY[0x263F3FA20] != *(_DWORD *)(MEMORY[0x263F3FA20] + 4)) {
    __udivti3();
  }
  -[NSMutableDictionary setObject:forKey:](-[DYExperiment results](self->_experiment, "results"), "setObject:forKey:", objc_msgSend(v12, "numberWithUnsignedLongLong:"), @"Duration");
  self->_isDone = 1;
}

- (unsigned)prevFileFunctionIndex
{
  return self->_prevFileFunctionIndex;
}

- (DYExperimentOverrideEnable)experiment
{
  return self->_experiment;
}

- (DYFunctionPlayer)functionPlayer
{
  return self->_functionPlayer;
}

- (void)setFunctionPlayer:(id)a3
{
  self->_functionPlayer = (DYFunctionPlayer *)a3;
}

- (BOOL)isDone
{
  return self->_isDone;
}

- (void).cxx_destruct
{
  value = self->_frameTimeStatistics.__ptr_.__value_;
  p_frameTimeStatistics = &self->_frameTimeStatistics;
  uint64_t v3 = (uint64_t)value;
  p_frameTimeStatistics->__ptr_.__value_ = 0;
  if (value) {
    std::default_delete<GPUTools::RunningStatistics<unsigned long long>>::operator()[abi:ne180100]((uint64_t)p_frameTimeStatistics, v3);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end