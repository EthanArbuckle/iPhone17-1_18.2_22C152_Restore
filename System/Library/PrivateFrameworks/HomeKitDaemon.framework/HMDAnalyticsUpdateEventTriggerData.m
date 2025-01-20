@interface HMDAnalyticsUpdateEventTriggerData
- (int)requestOrigin;
- (int)updateType;
- (unint64_t)timestamp;
- (unsigned)resultErrorCode;
- (void)setRequestOrigin:(int)a3;
- (void)setResultErrorCode:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUpdateType:(int)a3;
@end

@implementation HMDAnalyticsUpdateEventTriggerData

- (void)setUpdateType:(int)a3
{
  self->_updateType = a3;
}

- (int)updateType
{
  return self->_updateType;
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

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

@end