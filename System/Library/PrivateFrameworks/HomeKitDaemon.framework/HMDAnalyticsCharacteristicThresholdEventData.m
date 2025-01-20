@interface HMDAnalyticsCharacteristicThresholdEventData
- (BOOL)maxPresent;
- (BOOL)minPresent;
- (void)setMaxPresent:(BOOL)a3;
- (void)setMinPresent:(BOOL)a3;
@end

@implementation HMDAnalyticsCharacteristicThresholdEventData

- (void)setMinPresent:(BOOL)a3
{
  self->_minPresent = a3;
}

- (BOOL)minPresent
{
  return self->_minPresent;
}

- (void)setMaxPresent:(BOOL)a3
{
  self->_maxPresent = a3;
}

- (BOOL)maxPresent
{
  return self->_maxPresent;
}

@end