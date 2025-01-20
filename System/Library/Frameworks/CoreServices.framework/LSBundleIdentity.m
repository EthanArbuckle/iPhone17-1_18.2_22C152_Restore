@interface LSBundleIdentity
+ (BOOL)supportsSecureCoding;
+ (id)bundleIdentityForIdentityString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (LSBundleIdentity)initWithCoder:(id)a3;
- (LSBundleIdentity)initWithIdentityString:(id)a3 personaUniqueString:(id)a4 personaType:(unint64_t)a5;
- (NSString)bundleIdentifier;
- (NSString)identityString;
- (NSString)personaUniqueString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)personaType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LSBundleIdentity

- (NSString)identityString
{
  return self->_identityString;
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (LSBundleIdentity)initWithIdentityString:(id)a3 personaUniqueString:(id)a4 personaType:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)LSBundleIdentity;
  v10 = [(LSBundleIdentity *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    identityString = v10->_identityString;
    v10->_identityString = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    personaUniqueString = v10->_personaUniqueString;
    v10->_personaUniqueString = (NSString *)v13;

    v10->_personaType = a5;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaUniqueString, 0);

  objc_storeStrong((id *)&self->_identityString, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LSBundleIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"identityString");
  v6 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"personaUniqueString");
  uint64_t v7 = [v4 decodeIntegerForKey:@"personaType"];

  if (v5)
  {
    id v8 = [(LSBundleIdentity *)self initWithIdentityString:v5 personaUniqueString:v6 personaType:v7];
  }
  else
  {

    id v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  identityString = self->_identityString;
  id v5 = a3;
  [v5 encodeObject:identityString forKey:@"identityString"];
  [v5 encodeObject:self->_personaUniqueString forKey:@"personaUniqueString"];
  [v5 encodeInteger:self->_personaType forKey:@"personaType"];
}

- (unint64_t)hash
{
  return [(NSString *)self->_identityString hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    BOOL v7 = [(NSString *)self->_identityString isEqual:v5[1]]
      && ((personaUniqueString = self->_personaUniqueString, personaUniqueString == (NSString *)v5[2])
       || -[NSString isEqual:](personaUniqueString, "isEqual:"))
      && self->_personaType == v5[3];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p %@>", objc_opt_class(), self, self->_identityString];
}

+ (id)bundleIdentityForIdentityString:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F28D90];
  id v5 = [v3 dataUsingEncoding:4];
  v6 = [v4 JSONObjectWithData:v5 options:0 error:0];

  if (!v6)
  {
    uint64_t v13 = 0;
    goto LABEL_16;
  }
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = [v6 objectForKey:@"it"];
  id v9 = (void *)v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    id v9 = 0;
  }
  uint64_t v11 = [v9 unsignedIntegerValue];
  if (v11)
  {
    if (v11 != 1)
    {
      uint64_t v13 = 0;
      goto LABEL_15;
    }
    v12 = off_1E522B1E0;
  }
  else
  {
    v12 = off_1E522B0D0;
  }
  uint64_t v13 = (void *)[objc_alloc(*v12) initWithIdentityString:v3 parsedIdentityStringDictionary:v6 error:0];
LABEL_15:

LABEL_16:

  return v13;
}

- (unint64_t)personaType
{
  return self->_personaType;
}

- (NSString)bundleIdentifier
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

@end