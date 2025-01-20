@interface CHSServerSubscriptionResult
- (BSInvalidatable)assertion;
- (NSError)error;
- (NSObject)value;
- (void)setAssertion:(id)a3;
- (void)setError:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation CHSServerSubscriptionResult

- (BSInvalidatable)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(id)a3
{
}

- (NSObject)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
}

@end