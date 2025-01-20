@interface HMDAnalyticsPresenceEventData
- (int)presenceEventGranularity;
- (int)presenceEventType;
- (void)setPresenceEventGranularity:(int)a3;
- (void)setPresenceEventType:(int)a3;
@end

@implementation HMDAnalyticsPresenceEventData

- (void)setPresenceEventType:(int)a3
{
  self->_presenceEventType = a3;
}

- (int)presenceEventType
{
  return self->_presenceEventType;
}

- (void)setPresenceEventGranularity:(int)a3
{
  self->_presenceEventGranularity = a3;
}

- (int)presenceEventGranularity
{
  return self->_presenceEventGranularity;
}

@end