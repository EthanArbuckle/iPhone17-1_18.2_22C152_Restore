@interface CLMiLoFingerprintError
+ (BOOL)supportsSecureCoding;
- (CLMiLoFingerprintError)initWithCoder:(id)a3;
- (CLMiLoFingerprintError)initWithFingerprintErrorEnum:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)fingerprintErrorEnum;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLMiLoFingerprintError

- (CLMiLoFingerprintError)initWithFingerprintErrorEnum:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLMiLoFingerprintError;
  result = [(CLMiLoFingerprintError *)&v5 init];
  if (result) {
    result->_fingerprintErrorEnum = a3;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = [(id)objc_opt_class() allocWithZone:a3];

  return (id)MEMORY[0x1F4181798](v3, sel_initWithFingerprintErrorEnum_);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoFingerprintError)initWithCoder:(id)a3
{
  [a3 decodeIntegerForKey:@"kCLMiLoConnectionCodingKeyFingerprintErrorEnum"];

  return (CLMiLoFingerprintError *)MEMORY[0x1F4181798](self, sel_initWithFingerprintErrorEnum_);
}

- (void)encodeWithCoder:(id)a3
{
}

- (unint64_t)fingerprintErrorEnum
{
  return self->_fingerprintErrorEnum;
}

@end