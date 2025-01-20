@interface SGHarvestQueueMetricsTimer
- (BOOL)significantWork;
- (NSString)name;
- (SGHarvestQueueMetricsTimer)initWithName:(id)a3;
- (double)cpu;
- (double)duration;
- (id)description;
- (void)applyAdjustmentIfSane:(id)a3;
- (void)done:(BOOL)a3;
@end

@implementation SGHarvestQueueMetricsTimer

- (void).cxx_destruct
{
}

- (BOOL)significantWork
{
  return self->_significantWork;
}

- (double)duration
{
  return self->_duration;
}

- (double)cpu
{
  return self->_cpu;
}

- (NSString)name
{
  return self->_name;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(SGHarvestQueueMetricsTimer *)self name];
  [(SGHarvestQueueMetricsTimer *)self duration];
  uint64_t v8 = v7;
  [(SGHarvestQueueMetricsTimer *)self cpu];
  uint64_t v10 = v9;
  BOOL v11 = [(SGHarvestQueueMetricsTimer *)self significantWork];
  v12 = @"NO";
  if (v11) {
    v12 = @"YES";
  }
  v13 = (void *)[v3 initWithFormat:@"<%@ %@ duration: %.6f cpu: %.6f enrichment: %@>", v5, v6, v8, v10, v12];

  return v13;
}

- (void)applyAdjustmentIfSane:(id)a3
{
  id v3 = a3;
}

- (void)done:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  clock_t v5 = clock();
  unint64_t cpuStart = self->_cpuStart;
  if (v5 <= cpuStart) {
    unint64_t v7 = self->_cpuStart;
  }
  else {
    unint64_t v7 = v5;
  }
  self->_cpuEnd = v7;
  self->_cpu = (double)(v7 - cpuStart) / 1000000.0;
  uint64_t v8 = mach_absolute_time() - self->_durationStart;
  if (SGMachTimeToNanoseconds_onceToken != -1) {
    dispatch_once(&SGMachTimeToNanoseconds_onceToken, &__block_literal_global_16442);
  }
  self->_duration = (double)(v8
                           * SGMachTimeToNanoseconds_machTimebaseInfo
                           / *(unsigned int *)algn_1EB9F00D4)
                  / 1000000000.0;
  self->_significantWork = a3;
  uint64_t v9 = sgLogHandle();
  uint64_t v10 = v9;
  os_signpost_id_t signpostId = self->_signpostId;
  if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v12 = [(NSString *)self->_name UTF8String];
    int v13 = 136315138;
    v14 = v12;
    _os_signpost_emit_with_name_impl(&dword_1CA650000, v10, OS_SIGNPOST_INTERVAL_END, signpostId, "SGHarvestQueueMetrics", "%s", (uint8_t *)&v13, 0xCu);
  }
}

- (SGHarvestQueueMetricsTimer)initWithName:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SGHarvestQueueMetricsTimer;
  v6 = [(SGHarvestQueueMetricsTimer *)&v13 init];
  if (v6)
  {
    *((void *)v6 + 1) = clock();
    *((void *)v6 + 2) = 0;
    *((void *)v6 + 3) = mach_absolute_time();
    *(int64x2_t *)(v6 + 56) = vdupq_n_s64(0x7FF8000000000000uLL);
    objc_storeStrong((id *)v6 + 6, a3);
    v6[40] = 0;
    unint64_t v7 = sgLogHandle();
    os_signpost_id_t v8 = os_signpost_id_generate(v7);

    uint64_t v9 = sgLogHandle();
    uint64_t v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      uint64_t v11 = [*((id *)v6 + 6) UTF8String];
      *(_DWORD *)buf = 136315138;
      uint64_t v15 = v11;
      _os_signpost_emit_with_name_impl(&dword_1CA650000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "SGHarvestQueueMetrics", "%s", buf, 0xCu);
    }

    *((void *)v6 + 4) = v8;
  }

  return (SGHarvestQueueMetricsTimer *)v6;
}

@end