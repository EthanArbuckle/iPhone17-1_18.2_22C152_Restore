@interface CLMiLoServiceSuspendReason
+ (BOOL)supportsSecureCoding;
- (CLMiLoServiceSuspendReason)initWithCoder:(id)a3;
- (CLMiLoServiceSuspendReason)initWithSuspendReasonEnum:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)suspendReasonEnum;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLMiLoServiceSuspendReason

- (CLMiLoServiceSuspendReason)initWithSuspendReasonEnum:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLMiLoServiceSuspendReason;
  result = [(CLMiLoServiceSuspendReason *)&v5 init];
  if (result) {
    result->_suspendReasonEnum = a3;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = [(id)objc_opt_class() allocWithZone:a3];

  return (id)MEMORY[0x1F4181798](v3, sel_initWithSuspendReasonEnum_);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoServiceSuspendReason)initWithCoder:(id)a3
{
  [a3 decodeIntegerForKey:@"kCLMiLoConnectionCodingKeyServiceSuspendReason"];

  return (CLMiLoServiceSuspendReason *)MEMORY[0x1F4181798](self, sel_initWithSuspendReasonEnum_);
}

- (void)encodeWithCoder:(id)a3
{
}

- (unint64_t)suspendReasonEnum
{
  return self->_suspendReasonEnum;
}

@end