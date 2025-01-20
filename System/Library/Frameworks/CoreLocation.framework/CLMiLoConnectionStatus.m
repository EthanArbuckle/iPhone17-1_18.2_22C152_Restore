@interface CLMiLoConnectionStatus
+ (BOOL)supportsSecureCoding;
- (CLMiLoConnectionStatus)initWithCoder:(id)a3;
- (CLMiLoConnectionStatus)initWithConnectionState:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)connectionState;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLMiLoConnectionStatus

- (CLMiLoConnectionStatus)initWithConnectionState:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLMiLoConnectionStatus;
  result = [(CLMiLoConnectionStatus *)&v5 init];
  if (result) {
    result->_connectionState = a3;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  unint64_t connectionState = self->_connectionState;

  return (id)[v4 initWithConnectionState:connectionState];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoConnectionStatus)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeIntegerForKey:@"kCLMiLoConnectionCodingKeyConnectionState"];

  return [(CLMiLoConnectionStatus *)self initWithConnectionState:v4];
}

- (void)encodeWithCoder:(id)a3
{
}

- (unint64_t)connectionState
{
  return self->_connectionState;
}

@end