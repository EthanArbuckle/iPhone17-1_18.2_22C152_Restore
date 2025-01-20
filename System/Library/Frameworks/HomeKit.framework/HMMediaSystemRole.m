@interface HMMediaSystemRole
+ (BOOL)roleFromDictionary:(id)a3 roleOutput:(unint64_t *)a4;
+ (BOOL)supportsSecureCoding;
+ (id)leftRole;
+ (id)rightRole;
- (BOOL)isEqual:(id)a3;
- (HMMediaSystemRole)initWithCoder:(id)a3;
- (HMMediaSystemRole)initWithDictionary:(id)a3;
- (HMMediaSystemRole)initWithRole:(unint64_t)a3;
- (id)description;
- (id)serialize;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMMediaSystemRole

- (unint64_t)type
{
  return self->_type;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  id v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", -[HMMediaSystemRole type](self, "type"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v6 forKey:kMediaSystemRoleTypeCodingKey];
}

- (HMMediaSystemRole)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMMediaSystemRole;
  id v5 = [(HMMediaSystemRole *)&v8 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:kMediaSystemRoleTypeCodingKey];
    v5->_type = [v6 unsignedIntegerValue];
  }
  return v5;
}

- (id)serialize
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMMediaSystemRole type](self, "type"));
  [v3 setObject:v4 forKeyedSubscript:kMediaSystemRoleTypeCodingKey];

  id v5 = (void *)[v3 copy];

  return v5;
}

- (id)description
{
  v2 = NSString;
  v3 = HMMediaSystemRoleTypeAsString([(HMMediaSystemRole *)self type]);
  id v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (unint64_t)hash
{
  v2 = HMMediaSystemRoleTypeAsString([(HMMediaSystemRole *)self type]);
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  BOOL v6 = 0;
  if (v4 && (isKindOfClass & 1) != 0)
  {
    uint64_t v7 = [v4 type];
    BOOL v6 = v7 == [(HMMediaSystemRole *)self type];
  }

  return v6;
}

- (HMMediaSystemRole)initWithRole:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMMediaSystemRole;
  result = [(HMMediaSystemRole *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

- (HMMediaSystemRole)initWithDictionary:(id)a3
{
  id v4 = objc_msgSend(a3, "hmf_numberForKey:", kMediaSystemRoleTypeCodingKey);
  objc_super v5 = -[HMMediaSystemRole initWithRole:](self, "initWithRole:", [v4 unsignedIntegerValue]);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)roleFromDictionary:(id)a3 roleOutput:(unint64_t *)a4
{
  objc_super v5 = objc_msgSend(a3, "hmf_numberForKey:", kMediaSystemRoleTypeCodingKey);
  BOOL v6 = v5;
  if (v5) {
    *a4 = [v5 integerValue];
  }

  return v6 != 0;
}

+ (id)rightRole
{
  v2 = [[HMMediaSystemRole alloc] initWithRole:2];

  return v2;
}

+ (id)leftRole
{
  v2 = [[HMMediaSystemRole alloc] initWithRole:1];

  return v2;
}

@end