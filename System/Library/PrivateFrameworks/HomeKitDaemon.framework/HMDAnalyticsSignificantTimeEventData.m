@interface HMDAnalyticsSignificantTimeEventData
- (BOOL)offsetPresent;
- (NSString)significantEvent;
- (void)setOffsetPresent:(BOOL)a3;
- (void)setSignificantEvent:(id)a3;
@end

@implementation HMDAnalyticsSignificantTimeEventData

- (void).cxx_destruct
{
}

- (void)setOffsetPresent:(BOOL)a3
{
  self->_offsetPresent = a3;
}

- (BOOL)offsetPresent
{
  return self->_offsetPresent;
}

- (void)setSignificantEvent:(id)a3
{
}

- (NSString)significantEvent
{
  return self->_significantEvent;
}

@end