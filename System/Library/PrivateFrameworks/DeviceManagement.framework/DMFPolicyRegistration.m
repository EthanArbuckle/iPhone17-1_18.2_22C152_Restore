@interface DMFPolicyRegistration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (DMFPolicyRegistration)initWithCoder:(id)a3;
- (DMFPolicyRegistration)initWithIdentifier:(id)a3 policyTypes:(id)a4 callback:(id)a5;
- (NSSet)policyTypes;
- (NSString)identifier;
- (id)callback;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCallback:(id)a3;
@end

@implementation DMFPolicyRegistration

- (NSSet)policyTypes
{
  return self->_policyTypes;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_policyTypes forKey:@"policyTypes"];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_policyTypes, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (DMFPolicyRegistration)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DMFPolicyRegistration;
  id v5 = [(DMFPolicyRegistration *)&v16 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v10 = [v4 decodeObjectOfClasses:v9 forKey:@"policyTypes"];

    uint64_t v11 = [v6 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v11;

    uint64_t v13 = [v10 copy];
    policyTypes = v5->_policyTypes;
    v5->_policyTypes = (NSSet *)v13;
  }
  return v5;
}

- (DMFPolicyRegistration)initWithIdentifier:(id)a3 policyTypes:(id)a4 callback:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (![v10 count])
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"DMFPolicyRegistration.m" lineNumber:21 description:@"Missing policy types"];
  }
  v21.receiver = self;
  v21.super_class = (Class)DMFPolicyRegistration;
  v12 = [(DMFPolicyRegistration *)&v21 init];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v13;

    uint64_t v15 = [v10 copy];
    policyTypes = v12->_policyTypes;
    v12->_policyTypes = (NSSet *)v15;

    uint64_t v17 = MEMORY[0x1C188B2F0](v11);
    id callback = v12->_callback;
    v12->_id callback = (id)v17;
  }
  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  identifier = self->_identifier;
  policyTypes = self->_policyTypes;
  id callback = self->_callback;
  return (id)[v4 initWithIdentifier:identifier policyTypes:policyTypes callback:callback];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DMFPolicyRegistration *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(DMFPolicyRegistration *)self identifier];
      v7 = [(DMFPolicyRegistration *)v5 identifier];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(DMFPolicyRegistration *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

@end