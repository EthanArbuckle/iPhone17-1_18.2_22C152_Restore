@interface HKSelectedTimeScopeController
- (HKSelectedTimeScopeController)init;
- (int64_t)selectedTimeScope;
- (void)setSelectedTimeScope:(int64_t)a3;
@end

@implementation HKSelectedTimeScopeController

- (HKSelectedTimeScopeController)init
{
  v3.receiver = self;
  v3.super_class = (Class)HKSelectedTimeScopeController;
  result = [(HKSelectedTimeScopeController *)&v3 init];
  if (result) {
    result->_selectedTimeScope = 6;
  }
  return result;
}

- (int64_t)selectedTimeScope
{
  return self->_selectedTimeScope;
}

- (void)setSelectedTimeScope:(int64_t)a3
{
  self->_selectedTimeScope = a3;
}

@end