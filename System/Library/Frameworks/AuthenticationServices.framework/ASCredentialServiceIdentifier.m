@interface ASCredentialServiceIdentifier
+ (BOOL)supportsSecureCoding;
- (ASCredentialServiceIdentifier)initWithCoder:(id)a3;
- (ASCredentialServiceIdentifier)initWithIdentifier:(NSString *)identifier type:(ASCredentialServiceIdentifierType)type;
- (ASCredentialServiceIdentifierType)type;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCredentialServiceIdentifier

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCredentialServiceIdentifier)initWithIdentifier:(NSString *)identifier type:(ASCredentialServiceIdentifierType)type
{
  v6 = identifier;
  v12.receiver = self;
  v12.super_class = (Class)ASCredentialServiceIdentifier;
  v7 = [(ASCredentialServiceIdentifier *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [(NSString *)v6 copy];
    v9 = v7->_identifier;
    v7->_identifier = (NSString *)v8;

    v7->_type = type;
    v10 = v7;
  }

  return v7;
}

- (ASCredentialServiceIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ASCredentialServiceIdentifierValue"];
  v6 = (void *)v5;
  v7 = &stru_26CA92B70;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  uint64_t v8 = v7;

  unint64_t v9 = [v4 decodeInt64ForKey:@"ASCredentialServiceIdentifierType"];
  if (v9 >= 2) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = v9;
  }
  v11 = [(ASCredentialServiceIdentifier *)self initWithIdentifier:v8 type:v10];

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"ASCredentialServiceIdentifierValue"];
  [v5 encodeInt64:self->_type forKey:@"ASCredentialServiceIdentifierType"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  identifier = self->_identifier;
  int64_t type = self->_type;

  return (id)[v4 initWithIdentifier:identifier type:type];
}

- (id)description
{
  int64_t type = self->_type;
  if (type)
  {
    if (type == 1)
    {
      id v4 = @"url";
    }
    else
    {
      id v5 = objc_msgSend(NSNumber, "numberWithInteger:");
      id v4 = [v5 description];
    }
  }
  else
  {
    id v4 = @"domain";
  }
  objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; type=%@; identifier=%@>",
    objc_opt_class(),
    self,
    v4,
  v6 = self->_identifier);

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (ASCredentialServiceIdentifierType)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

@end