@interface _HKTimeScopeConfigurationProperties
- (int64_t)horizontalIndex;
- (int64_t)numberOfHorizontalDisplayTypes;
- (int64_t)timeScope;
- (void)setHorizontalIndex:(int64_t)a3;
- (void)setNumberOfHorizontalDisplayTypes:(int64_t)a3;
- (void)setTimeScope:(int64_t)a3;
@end

@implementation _HKTimeScopeConfigurationProperties

- (int64_t)timeScope
{
  return self->_timeScope;
}

- (void)setTimeScope:(int64_t)a3
{
  self->_timeScope = a3;
}

- (int64_t)numberOfHorizontalDisplayTypes
{
  return self->_numberOfHorizontalDisplayTypes;
}

- (void)setNumberOfHorizontalDisplayTypes:(int64_t)a3
{
  self->_numberOfHorizontalDisplayTypes = a3;
}

- (int64_t)horizontalIndex
{
  return self->_horizontalIndex;
}

- (void)setHorizontalIndex:(int64_t)a3
{
  self->_horizontalIndex = a3;
}

@end