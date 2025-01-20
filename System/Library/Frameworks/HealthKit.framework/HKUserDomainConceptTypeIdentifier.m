@interface HKUserDomainConceptTypeIdentifier
+ (BOOL)supportsSecureCoding;
+ (id)baseUserDomainConceptIdentifier;
+ (id)listUserDomainConceptIdentifier;
+ (id)medicalUserDomainConceptIdentifier;
- (BOOL)isEqual:(id)a3;
- (HKUserDomainConceptTypeIdentifier)init;
- (HKUserDomainConceptTypeIdentifier)initWithCode:(int64_t)a3 schema:(id)a4;
- (HKUserDomainConceptTypeIdentifier)initWithCoder:(id)a3;
- (NSString)schema;
- (id)description;
- (int64_t)code;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKUserDomainConceptTypeIdentifier

- (HKUserDomainConceptTypeIdentifier)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKUserDomainConceptTypeIdentifier)initWithCode:(int64_t)a3 schema:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKUserDomainConceptTypeIdentifier;
  v7 = [(HKUserDomainConceptTypeIdentifier *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_code = a3;
    uint64_t v9 = [v6 copy];
    schema = v8->_schema;
    v8->_schema = (NSString *)v9;
  }
  return v8;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %@, %lld>", objc_opt_class(), self->_schema, self->_code];
}

- (unint64_t)hash
{
  int64_t code = self->_code;
  return [(NSString *)self->_schema hash] ^ code;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKUserDomainConceptTypeIdentifier *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if (self->_code != v5->_code) {
        goto LABEL_9;
      }
      schema = self->_schema;
      v7 = v5->_schema;
      if (schema == v7)
      {
        char v8 = 1;
        goto LABEL_11;
      }
      if (v7) {
        char v8 = -[NSString isEqual:](schema, "isEqual:");
      }
      else {
LABEL_9:
      }
        char v8 = 0;
LABEL_11:

      goto LABEL_12;
    }
    char v8 = 0;
  }
LABEL_12:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t code = self->_code;
  id v5 = a3;
  [v5 encodeInteger:code forKey:@"code"];
  [v5 encodeObject:self->_schema forKey:@"schema"];
}

- (HKUserDomainConceptTypeIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"code"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"schema"];

  v7 = [(HKUserDomainConceptTypeIdentifier *)self initWithCode:v5 schema:v6];
  return v7;
}

+ (id)baseUserDomainConceptIdentifier
{
  v2 = (void *)[objc_alloc((Class)a1) initWithCode:0 schema:0];

  return v2;
}

+ (id)medicalUserDomainConceptIdentifier
{
  v2 = (void *)[objc_alloc((Class)a1) initWithCode:1 schema:0];

  return v2;
}

+ (id)listUserDomainConceptIdentifier
{
  v2 = (void *)[objc_alloc((Class)a1) initWithCode:2 schema:0];

  return v2;
}

- (int64_t)code
{
  return self->_code;
}

- (NSString)schema
{
  return self->_schema;
}

- (void).cxx_destruct
{
}

@end