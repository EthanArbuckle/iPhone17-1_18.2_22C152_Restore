@interface DTGPUCounterProfile_GPUStats
+ (id)create:(id)a3;
- (BOOL)start:(unint64_t)a3;
- (DTGPUCounterProfile_GPUStats)initWithProfile:(unint64_t)a3 device:(id)a4;
- (void)sampleCounters:(unint64_t)a3 callback:(id)a4;
@end

@implementation DTGPUCounterProfile_GPUStats

+ (id)create:(id)a3
{
  id v3 = a3;
  v4 = [[DTGPUCounterProfile_GPUStats alloc] initWithProfile:0 device:v3];

  return v4;
}

- (DTGPUCounterProfile_GPUStats)initWithProfile:(unint64_t)a3 device:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)DTGPUCounterProfile_GPUStats;
  v4 = [(DTGPUCounterProfile *)&v7 initWithProfile:0 device:a4];
  if (v4)
  {
    v5 = [[DTGPUCounter alloc] initWithName:@"Utilization %" maxValue:100];
    [(DTGPUCounter *)v5 setCounterDescription:@"Device Utilization %"];
    [(DTGPUCounterProfile *)v4 addCounter:v5];
    [(DTGPUCounterProfile *)v4 setDefaultSampleInterval:1000000];
  }
  return v4;
}

- (BOOL)start:(unint64_t)a3
{
  self->_currentIORegSamplingInterval = 0;
  self->_deviceUtilization.coefficient = 0.095162582;
  return 1;
}

- (void)sampleCounters:(unint64_t)a3 callback:(id)a4
{
  id v14 = a4;
  unint64_t v6 = self->_currentIORegSamplingInterval + a3;
  self->_currentIORegSamplingInterval = v6;
  if (v6 > 0x98967F)
  {
    objc_super v7 = [(DTGPUCounterProfile *)self device];
    io_registry_entry_t v8 = [v7 acceleratorPort];
    CFProperty = (void *)IORegistryEntryCreateCFProperty(v8, @"PerformanceStatistics", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);

    v10 = [CFProperty objectForKeyedSubscript:@"Device Utilization %"];
    self->_deviceUtilization.unint64_t currentValue = (unint64_t)(self->_deviceUtilization.coefficient
                                                             * (double)self->_deviceUtilization.currentValue
                                                             + (1.0 - self->_deviceUtilization.coefficient)
                                                             * (double)(unint64_t)[v10 unsignedLongValue]);
    self->_currentIORegSamplingInterval = 0;
  }
  unint64_t currentValue = self->_deviceUtilization.currentValue;
  v12 = operator new(8uLL);
  void *v12 = currentValue;
  uint64_t v13 = mach_absolute_time();
  (*((void (**)(id, void *, uint64_t, uint64_t, void, void, void))v14 + 2))(v14, v12, 1, v13, 0, 0, 0);
  operator delete(v12);
}

@end