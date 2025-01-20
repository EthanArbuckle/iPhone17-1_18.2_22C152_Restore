@interface CLMiLoUpdateConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isLowLatency;
- (CLMiLoUpdateConfiguration)initWithCoder:(id)a3;
- (CLMiLoUpdateConfiguration)initWithIsLowLatency:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLMiLoUpdateConfiguration

- (CLMiLoUpdateConfiguration)initWithIsLowLatency:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLMiLoUpdateConfiguration;
  result = [(CLMiLoUpdateConfiguration *)&v5 init];
  if (result) {
    result->_isLowLatency = a3;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = [(id)objc_opt_class() allocWithZone:a3];

  return (id)MEMORY[0x1F4181798](v3, sel_initWithIsLowLatency_);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoUpdateConfiguration)initWithCoder:(id)a3
{
  [a3 decodeBoolForKey:@"kCLMiLoConnectionCodingKeySessionIsLowLatency"];

  return (CLMiLoUpdateConfiguration *)MEMORY[0x1F4181798](self, sel_initWithIsLowLatency_);
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)isLowLatency
{
  return self->_isLowLatency;
}

@end