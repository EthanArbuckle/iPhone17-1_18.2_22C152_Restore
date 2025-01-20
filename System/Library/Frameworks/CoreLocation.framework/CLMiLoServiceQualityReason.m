@interface CLMiLoServiceQualityReason
+ (BOOL)supportsSecureCoding;
- (CLMiLoServiceQualityReason)initWithCoder:(id)a3;
- (CLMiLoServiceQualityReason)initWithQualityReasonEnum:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)qualityReasonEnum;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLMiLoServiceQualityReason

- (CLMiLoServiceQualityReason)initWithQualityReasonEnum:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLMiLoServiceQualityReason;
  result = [(CLMiLoServiceQualityReason *)&v5 init];
  if (result) {
    result->_qualityReasonEnum = a3;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = [(id)objc_opt_class() allocWithZone:a3];

  return (id)MEMORY[0x1F4181798](v3, sel_initWithQualityReasonEnum_);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoServiceQualityReason)initWithCoder:(id)a3
{
  [a3 decodeIntegerForKey:@"kCLMiLoConnectionCodingKeyServiceQualityReason"];

  return (CLMiLoServiceQualityReason *)MEMORY[0x1F4181798](self, sel_initWithQualityReasonEnum_);
}

- (void)encodeWithCoder:(id)a3
{
}

- (unint64_t)qualityReasonEnum
{
  return self->_qualityReasonEnum;
}

@end