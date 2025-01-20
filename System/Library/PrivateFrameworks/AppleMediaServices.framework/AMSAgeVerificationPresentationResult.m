@interface AMSAgeVerificationPresentationResult
- (unint64_t)successType;
- (void)setSuccessType:(unint64_t)a3;
@end

@implementation AMSAgeVerificationPresentationResult

- (unint64_t)successType
{
  return self->_successType;
}

- (void)setSuccessType:(unint64_t)a3
{
  self->_successType = a3;
}

@end