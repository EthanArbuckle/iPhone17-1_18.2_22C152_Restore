@interface NISystemConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (BOOL)_internalOsTransactionRequired;
- (BOOL)isEqual:(id)a3;
- (BOOL)prewarmSecureElementChannel;
- (BOOL)prewarmUWB;
- (NISystemConfiguration)init;
- (NISystemConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setPrewarmSecureElementChannel:(BOOL)a3;
- (void)setPrewarmUWB:(BOOL)a3;
@end

@implementation NISystemConfiguration

- (NISystemConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)NISystemConfiguration;
  result = [(NIConfiguration *)&v3 initInternal];
  if (result)
  {
    result->_prewarmUWB = 0;
    result->_prewarmSecureElementChannel = 0;
  }
  return result;
}

+ (id)new
{
  return objc_alloc_init(NISystemConfiguration);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NISystemConfiguration;
  id v4 = [(NIConfiguration *)&v6 copyWithZone:a3];
  [v4 setPrewarmUWB:self->_prewarmUWB];
  [v4 setPrewarmSecureElementChannel:self->_prewarmSecureElementChannel];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NISystemConfiguration;
  [(NIConfiguration *)&v5 encodeWithCoder:v4];
  [v4 encodeBool:self->_prewarmUWB forKey:@"prewarmUWB"];
  [v4 encodeBool:self->_prewarmSecureElementChannel forKey:@"prewarmSecureElementChannel"];
}

- (NISystemConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NISystemConfiguration;
  objc_super v5 = [(NIConfiguration *)&v10 initWithCoder:v4];
  if (v5)
  {
    char v6 = [v4 decodeBoolForKey:@"prewarmUWB"];
    char v7 = [v4 decodeBoolForKey:@"prewarmSecureElementChannel"];
    v5->_prewarmUWB = v6;
    v5->_prewarmSecureElementChannel = v7;
    v8 = v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v5 = (NISystemConfiguration *)v4;
    char v6 = v5;
    if (v5 == self)
    {
      BOOL v11 = 1;
    }
    else
    {
      int v7 = [(NISystemConfiguration *)v5 prewarmUWB];
      int prewarmUWB = self->_prewarmUWB;
      BOOL v9 = [(NISystemConfiguration *)v6 prewarmSecureElementChannel];
      BOOL v11 = prewarmUWB == v7 && self->_prewarmSecureElementChannel == v9;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  return self->_prewarmUWB ^ self->_prewarmSecureElementChannel ^ 0x1Fu;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  char v6 = [(NISystemConfiguration *)self descriptionInternal];
  int v7 = (void *)[v3 initWithFormat:@"<%@: %@>", v5, v6];

  return v7;
}

- (id)descriptionInternal
{
  return (id)[NSString stringWithFormat:@"<prewarm [UWB: %d, secureElementChannel: %d]>", self->_prewarmUWB, self->_prewarmSecureElementChannel];
}

- (BOOL)_internalOsTransactionRequired
{
  return 0;
}

- (BOOL)prewarmUWB
{
  return self->_prewarmUWB;
}

- (void)setPrewarmUWB:(BOOL)a3
{
  self->_int prewarmUWB = a3;
}

- (BOOL)prewarmSecureElementChannel
{
  return self->_prewarmSecureElementChannel;
}

- (void)setPrewarmSecureElementChannel:(BOOL)a3
{
  self->_prewarmSecureElementChannel = a3;
}

@end