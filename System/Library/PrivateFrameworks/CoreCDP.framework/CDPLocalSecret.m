@interface CDPLocalSecret
+ (BOOL)supportsSecureCoding;
- (CDPLocalSecret)initWithCoder:(id)a3;
- (CDPLocalSecret)initWithValidatedSecret:(id)a3 secretType:(unint64_t)a4;
- (NSString)validatedSecret;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)secretType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CDPLocalSecret

- (CDPLocalSecret)initWithValidatedSecret:(id)a3 secretType:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CDPLocalSecret;
  v8 = [(CDPLocalSecret *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_validatedSecret, a3);
    v9->_secretType = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  validatedSecret = self->_validatedSecret;
  id v5 = a3;
  [v5 encodeObject:validatedSecret forKey:@"_validatedSecret"];
  id v6 = [NSNumber numberWithUnsignedInteger:self->_secretType];
  [v5 encodeObject:v6 forKey:@"_secretType"];
}

- (CDPLocalSecret)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CDPLocalSecret *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_validatedSecret"];
    validatedSecret = v5->_validatedSecret;
    v5->_validatedSecret = (NSString *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_secretType"];
    v5->_secretType = [v8 integerValue];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CDPLocalSecret alloc];
  validatedSecret = self->_validatedSecret;
  unint64_t secretType = self->_secretType;
  return [(CDPLocalSecret *)v4 initWithValidatedSecret:validatedSecret secretType:secretType];
}

- (NSString)validatedSecret
{
  return self->_validatedSecret;
}

- (unint64_t)secretType
{
  return self->_secretType;
}

- (void).cxx_destruct
{
}

@end