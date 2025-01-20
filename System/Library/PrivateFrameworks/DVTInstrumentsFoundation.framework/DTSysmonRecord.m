@interface DTSysmonRecord
- (DTSysmonCPUUsageRecord)cpuUsage;
- (DTSysmonSystemRecord)system;
- (NSArray)changedProcesses;
- (NSArray)coalitionAttributes;
- (NSArray)coalitions;
- (NSArray)deadCoalitions;
- (NSArray)deadProcesses;
- (NSArray)processAttributes;
- (NSArray)systemAttributes;
- (unint64_t)endTimestamp;
- (unint64_t)startTimestamp;
- (unsigned)recordType;
- (void)setChangedProcesses:(id)a3;
- (void)setCoalitionAttributes:(id)a3;
- (void)setCoalitions:(id)a3;
- (void)setCpuUsage:(id)a3;
- (void)setDeadCoalitions:(id)a3;
- (void)setDeadProcesses:(id)a3;
- (void)setEndTimestamp:(unint64_t)a3;
- (void)setProcessAttributes:(id)a3;
- (void)setRecordType:(unsigned int)a3;
- (void)setStartTimestamp:(unint64_t)a3;
- (void)setSystem:(id)a3;
- (void)setSystemAttributes:(id)a3;
@end

@implementation DTSysmonRecord

- (unsigned)recordType
{
  return self->_recordType;
}

- (void)setRecordType:(unsigned int)a3
{
  self->_recordType = a3;
}

- (unint64_t)startTimestamp
{
  return self->_startTimestamp;
}

- (void)setStartTimestamp:(unint64_t)a3
{
  self->_startTimestamp = a3;
}

- (unint64_t)endTimestamp
{
  return self->_endTimestamp;
}

- (void)setEndTimestamp:(unint64_t)a3
{
  self->_endTimestamp = a3;
}

- (NSArray)changedProcesses
{
  return self->_changedProcesses;
}

- (void)setChangedProcesses:(id)a3
{
}

- (NSArray)deadProcesses
{
  return self->_deadProcesses;
}

- (void)setDeadProcesses:(id)a3
{
}

- (DTSysmonSystemRecord)system
{
  return self->_system;
}

- (void)setSystem:(id)a3
{
}

- (NSArray)coalitions
{
  return self->_coalitions;
}

- (void)setCoalitions:(id)a3
{
}

- (NSArray)deadCoalitions
{
  return self->_deadCoalitions;
}

- (void)setDeadCoalitions:(id)a3
{
}

- (DTSysmonCPUUsageRecord)cpuUsage
{
  return self->_cpuUsage;
}

- (void)setCpuUsage:(id)a3
{
}

- (NSArray)processAttributes
{
  return self->_processAttributes;
}

- (void)setProcessAttributes:(id)a3
{
}

- (NSArray)systemAttributes
{
  return self->_systemAttributes;
}

- (void)setSystemAttributes:(id)a3
{
}

- (NSArray)coalitionAttributes
{
  return self->_coalitionAttributes;
}

- (void)setCoalitionAttributes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalitionAttributes, 0);
  objc_storeStrong((id *)&self->_systemAttributes, 0);
  objc_storeStrong((id *)&self->_processAttributes, 0);
  objc_storeStrong((id *)&self->_cpuUsage, 0);
  objc_storeStrong((id *)&self->_deadCoalitions, 0);
  objc_storeStrong((id *)&self->_coalitions, 0);
  objc_storeStrong((id *)&self->_system, 0);
  objc_storeStrong((id *)&self->_deadProcesses, 0);
  objc_storeStrong((id *)&self->_changedProcesses, 0);
}

@end