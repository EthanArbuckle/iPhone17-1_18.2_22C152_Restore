@interface HKUserDomainConceptLink
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKUserDomainConceptLink)init;
- (HKUserDomainConceptLink)initWithCoder:(id)a3;
- (HKUserDomainConceptLink)initWithLinkStructWrapper:(id)a3;
- (HKUserDomainConceptLink)initWithTarget:(id)a3 type:(int64_t)a4;
- (HKUserDomainConceptLink)initWithUserConcept:(id)a3 type:(int64_t)a4;
- (NSUUID)targetUUID;
- (id)description;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKUserDomainConceptLink

- (HKUserDomainConceptLink)initWithLinkStructWrapper:(id)a3
{
  id v4 = a3;
  v5 = [v4 target];
  uint64_t v6 = [v4 type];

  v7 = [(HKUserDomainConceptLink *)self initWithTarget:v5 type:v6];
  return v7;
}

- (HKUserDomainConceptLink)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKUserDomainConceptLink)initWithTarget:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKUserDomainConceptLink;
  v7 = [(HKUserDomainConceptLink *)&v11 init];
  if (v7)
  {
    v8 = [[HKUserDomainConceptLinkStructWrapper alloc] initWithTarget:v6 type:a4];
    implementation = v7->_implementation;
    v7->_implementation = v8;
  }
  return v7;
}

- (HKUserDomainConceptLink)initWithUserConcept:(id)a3 type:(int64_t)a4
{
  id v6 = [a3 UUID];
  v7 = [(HKUserDomainConceptLink *)self initWithTarget:v6 type:a4];

  return v7;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = HKStringFromUserDomainConceptLinkType([(HKUserDomainConceptLink *)self type]);
  id v6 = [(HKUserDomainConceptLink *)self targetUUID];
  v7 = objc_msgSend(v6, "hk_shortRepresentation");
  v8 = [v3 stringWithFormat:@"<%@ (%@, %@)>", v4, v5, v7];

  return v8;
}

- (NSUUID)targetUUID
{
  return [(HKUserDomainConceptLinkStructWrapper *)self->_implementation target];
}

- (int64_t)type
{
  return [(HKUserDomainConceptLinkStructWrapper *)self->_implementation type];
}

- (unint64_t)hash
{
  return [(HKUserDomainConceptLinkStructWrapper *)self->_implementation hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKUserDomainConceptLink *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(HKUserDomainConceptLinkStructWrapper *)self->_implementation isEqual:v4->_implementation];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  implementation = self->_implementation;
  id v6 = a3;
  BOOL v5 = [(HKUserDomainConceptLinkStructWrapper *)implementation target];
  [v6 encodeObject:v5 forKey:@"uuid"];

  objc_msgSend(v6, "encodeInt64:forKey:", -[HKUserDomainConceptLinkStructWrapper type](self->_implementation, "type"), @"type");
}

- (HKUserDomainConceptLink)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"type"];

  v11.receiver = self;
  v11.super_class = (Class)HKUserDomainConceptLink;
  v7 = [(HKUserDomainConceptLink *)&v11 init];
  if (v7)
  {
    v8 = [[HKUserDomainConceptLinkStructWrapper alloc] initWithTarget:v5 type:v6];
    implementation = v7->_implementation;
    v7->_implementation = v8;
  }
  return v7;
}

- (void).cxx_destruct
{
}

@end