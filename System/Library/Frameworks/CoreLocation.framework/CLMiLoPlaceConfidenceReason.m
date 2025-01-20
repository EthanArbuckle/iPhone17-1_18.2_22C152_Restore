@interface CLMiLoPlaceConfidenceReason
+ (BOOL)supportsSecureCoding;
- (CLMiLoPlaceConfidenceReason)initWithCoder:(id)a3;
- (CLMiLoPlaceConfidenceReason)initWithConfidenceReasonEnum:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)confidenceReasonEnum;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLMiLoPlaceConfidenceReason

- (CLMiLoPlaceConfidenceReason)initWithConfidenceReasonEnum:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLMiLoPlaceConfidenceReason;
  result = [(CLMiLoPlaceConfidenceReason *)&v5 init];
  if (result) {
    result->_confidenceReasonEnum = a3;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = [(id)objc_opt_class() allocWithZone:a3];

  return (id)MEMORY[0x1F4181798](v3, sel_initWithConfidenceReasonEnum_);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoPlaceConfidenceReason)initWithCoder:(id)a3
{
  [a3 decodeIntegerForKey:@"kCLMiLoConnectionCodingKeyPlaceConfidenceReasonEnum"];

  return (CLMiLoPlaceConfidenceReason *)MEMORY[0x1F4181798](self, sel_initWithConfidenceReasonEnum_);
}

- (void)encodeWithCoder:(id)a3
{
}

- (unint64_t)confidenceReasonEnum
{
  return self->_confidenceReasonEnum;
}

@end