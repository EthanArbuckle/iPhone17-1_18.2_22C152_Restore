@interface AKPersistRecoveryKeyContext
+ (BOOL)supportsSecureCoding;
- (AKPersistRecoveryKeyContext)initWithCoder:(id)a3;
- (NSDictionary)verifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)keyType;
- (void)encodeWithCoder:(id)a3;
- (void)setKeyType:(unint64_t)a3;
- (void)setVerifier:(id)a3;
@end

@implementation AKPersistRecoveryKeyContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKPersistRecoveryKeyContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AKPersistRecoveryKeyContext;
  v5 = [(AKPersistRecoveryKeyContext *)&v14 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v11 = [v4 decodeObjectOfClasses:v10 forKey:@"_verifier"];
    [(AKPersistRecoveryKeyContext *)v5 setVerifier:v11];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_keyType"];
    -[AKPersistRecoveryKeyContext setKeyType:](v5, "setKeyType:", [v12 unsignedIntegerValue]);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AKPersistRecoveryKeyContext *)self verifier];
  [v4 encodeObject:v5 forKey:@"_verifier"];

  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AKPersistRecoveryKeyContext keyType](self, "keyType"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"_keyType"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[AKPersistRecoveryKeyContext allocWithZone:a3] init];
  uint64_t v5 = [(AKPersistRecoveryKeyContext *)self verifier];
  verifier = v4->_verifier;
  v4->_verifier = (NSDictionary *)v5;

  v4->_keyType = [(AKPersistRecoveryKeyContext *)self keyType];
  return v4;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(AKPersistRecoveryKeyContext *)self verifier];
  uint64_t v5 = objc_msgSend(v4, "ak_redactedCopy");
  id v6 = [v3 stringWithFormat:@"AKPersistRecoveryKeyContext:\nVerifier: %@\nKeyType: %lu", v5, -[AKPersistRecoveryKeyContext keyType](self, "keyType")];

  return v6;
}

- (NSDictionary)verifier
{
  return self->_verifier;
}

- (void)setVerifier:(id)a3
{
}

- (unint64_t)keyType
{
  return self->_keyType;
}

- (void)setKeyType:(unint64_t)a3
{
  self->_keyType = a3;
}

- (void).cxx_destruct
{
}

@end