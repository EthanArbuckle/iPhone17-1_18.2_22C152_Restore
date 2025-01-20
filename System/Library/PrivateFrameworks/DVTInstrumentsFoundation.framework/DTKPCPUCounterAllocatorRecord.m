@interface DTKPCPUCounterAllocatorRecord
- (BOOL)isPMI;
- (DTKPCPUCounterAllocatorRecord)initWithName:(id)a3 nameOrAlias:(id)a4 counterName:(id)a5 kpepEvent:(kpep_event *)a6 isPMI:(BOOL)a7 hwIdx:(unint64_t)a8;
- (NSString)counterName;
- (NSString)eventName;
- (NSString)eventOrAliasName;
- (kpep_event)kpepEvent;
- (unint64_t)hwIdx;
- (void)setCounterName:(id)a3;
- (void)setEventName:(id)a3;
- (void)setEventOrAliasName:(id)a3;
- (void)setHwIdx:(unint64_t)a3;
- (void)setIsPMI:(BOOL)a3;
- (void)setKpepEvent:(kpep_event *)a3;
@end

@implementation DTKPCPUCounterAllocatorRecord

- (DTKPCPUCounterAllocatorRecord)initWithName:(id)a3 nameOrAlias:(id)a4 counterName:(id)a5 kpepEvent:(kpep_event *)a6 isPMI:(BOOL)a7 hwIdx:(unint64_t)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  v21.receiver = self;
  v21.super_class = (Class)DTKPCPUCounterAllocatorRecord;
  v18 = [(DTKPCPUCounterAllocatorRecord *)&v21 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_eventName, a3);
    objc_storeStrong((id *)&v19->_eventOrAliasName, a4);
    objc_storeStrong((id *)&v19->_counterName, a5);
    v19->_isPMI = a7;
    v19->_kpepEvent = a6;
    v19->_hwIdx = a8;
  }

  return v19;
}

- (NSString)eventName
{
  return self->_eventName;
}

- (void)setEventName:(id)a3
{
}

- (NSString)eventOrAliasName
{
  return self->_eventOrAliasName;
}

- (void)setEventOrAliasName:(id)a3
{
}

- (NSString)counterName
{
  return self->_counterName;
}

- (void)setCounterName:(id)a3
{
}

- (BOOL)isPMI
{
  return self->_isPMI;
}

- (void)setIsPMI:(BOOL)a3
{
  self->_isPMI = a3;
}

- (kpep_event)kpepEvent
{
  return self->_kpepEvent;
}

- (void)setKpepEvent:(kpep_event *)a3
{
  self->_kpepEvent = a3;
}

- (unint64_t)hwIdx
{
  return self->_hwIdx;
}

- (void)setHwIdx:(unint64_t)a3
{
  self->_hwIdx = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_counterName, 0);
  objc_storeStrong((id *)&self->_eventOrAliasName, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
}

@end