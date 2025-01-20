@interface HMDAnalyticsCharacteristicEventData
- (BOOL)containsValue;
- (void)setContainsValue:(BOOL)a3;
@end

@implementation HMDAnalyticsCharacteristicEventData

- (void)setContainsValue:(BOOL)a3
{
  self->_containsValue = a3;
}

- (BOOL)containsValue
{
  return self->_containsValue;
}

@end