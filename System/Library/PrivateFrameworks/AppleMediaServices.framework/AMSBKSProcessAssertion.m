@interface AMSBKSProcessAssertion
- (unint64_t)ams_assertionCount;
- (void)setAms_assertionCount:(unint64_t)a3;
@end

@implementation AMSBKSProcessAssertion

- (unint64_t)ams_assertionCount
{
  return self->_ams_assertionCount;
}

- (void)setAms_assertionCount:(unint64_t)a3
{
  self->_ams_assertionCount = a3;
}

@end