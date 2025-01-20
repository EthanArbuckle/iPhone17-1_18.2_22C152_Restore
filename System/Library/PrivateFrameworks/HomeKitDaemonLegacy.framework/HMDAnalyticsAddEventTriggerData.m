@interface HMDAnalyticsAddEventTriggerData
- (HMDAnalyticsEventTriggerData)eventTrigger;
- (int)requestOrigin;
- (unint64_t)timestamp;
- (unsigned)resultErrorCode;
- (void)setEventTrigger:(id)a3;
- (void)setRequestOrigin:(int)a3;
- (void)setResultErrorCode:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
@end

@implementation HMDAnalyticsAddEventTriggerData

- (void).cxx_destruct
{
}

- (void)setResultErrorCode:(unsigned int)a3
{
  self->_resultErrorCode = a3;
}

- (unsigned)resultErrorCode
{
  return self->_resultErrorCode;
}

- (void)setRequestOrigin:(int)a3
{
  self->_requestOrigin = a3;
}

- (int)requestOrigin
{
  return self->_requestOrigin;
}

- (void)setEventTrigger:(id)a3
{
}

- (HMDAnalyticsEventTriggerData)eventTrigger
{
  return self->_eventTrigger;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

@end