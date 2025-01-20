@interface DTSysmonCPUUsageRecord
- (DTSysmonCPUUsageEntry)averageCPUUsage;
- (NSArray)perCPUUsage;
- (unsigned)cpuCount;
- (unsigned)enabledCPUs;
- (void)setAverageCPUUsage:(id)a3;
- (void)setCpuCount:(unsigned int)a3;
- (void)setEnabledCPUs:(unsigned int)a3;
- (void)setPerCPUUsage:(id)a3;
@end

@implementation DTSysmonCPUUsageRecord

- (unsigned)cpuCount
{
  return self->_cpuCount;
}

- (void)setCpuCount:(unsigned int)a3
{
  self->_cpuCount = a3;
}

- (unsigned)enabledCPUs
{
  return self->_enabledCPUs;
}

- (void)setEnabledCPUs:(unsigned int)a3
{
  self->_enabledCPUs = a3;
}

- (DTSysmonCPUUsageEntry)averageCPUUsage
{
  return self->_averageCPUUsage;
}

- (void)setAverageCPUUsage:(id)a3
{
}

- (NSArray)perCPUUsage
{
  return self->_perCPUUsage;
}

- (void)setPerCPUUsage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perCPUUsage, 0);
  objc_storeStrong((id *)&self->_averageCPUUsage, 0);
}

@end