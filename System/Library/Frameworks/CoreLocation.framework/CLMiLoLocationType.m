@interface CLMiLoLocationType
+ (BOOL)supportsSecureCoding;
- (CLMiLoLocationType)initWithCoder:(id)a3;
- (CLMiLoLocationType)initWithLocationTypeEnum:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)locationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLMiLoLocationType

- (CLMiLoLocationType)initWithLocationTypeEnum:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLMiLoLocationType;
  result = [(CLMiLoLocationType *)&v5 init];
  if (result) {
    result->_locationType = a3;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(id)objc_opt_class() allocWithZone:a3];
  [(CLMiLoLocationType *)self locationType];

  return (id)MEMORY[0x1F4181798](v4, sel_initWithLocationTypeEnum_);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoLocationType)initWithCoder:(id)a3
{
  [a3 decodeIntegerForKey:@"kCLMiLoConnectionCodingKeyLocationType"];

  return (CLMiLoLocationType *)MEMORY[0x1F4181798](self, sel_initWithLocationTypeEnum_);
}

- (void)encodeWithCoder:(id)a3
{
}

- (unint64_t)locationType
{
  return self->_locationType;
}

@end