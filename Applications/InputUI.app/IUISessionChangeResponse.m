@interface IUISessionChangeResponse
+ (BOOL)supportsSecureCoding;
- (IUISessionChangeResponse)initWithCoder:(id)a3;
- (IUISessionChangeResponse)initWithResponseState:(int64_t)a3;
- (int64_t)responseState;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IUISessionChangeResponse

- (IUISessionChangeResponse)initWithResponseState:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IUISessionChangeResponse;
  result = [(IUISessionChangeResponse *)&v5 init];
  if (result) {
    result->_responseState = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (IUISessionChangeResponse)initWithCoder:(id)a3
{
  id v4 = [a3 decodeIntegerForKey:@"responseState"];

  return [(IUISessionChangeResponse *)self initWithResponseState:v4];
}

- (int64_t)responseState
{
  return self->_responseState;
}

@end