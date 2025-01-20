@interface BCSBusinessEmailIdentifier
+ (BOOL)supportsSecureCoding;
- (BCSBusinessEmailIdentifier)initWithCoder:(id)a3;
- (BCSBusinessEmailIdentifier)initWithDefaultsDictionary:(id)a3;
- (BCSBusinessEmailIdentifier)initWithEmail:(id)a3 fullDomain:(id)a4 topLevelDomain:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesIdentifier:(id)a3;
- (NSString)email;
- (NSString)fullDomain;
- (NSString)topLevelDomain;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEmail:(id)a3;
- (void)setFullDomain:(id)a3;
- (void)setTopLevelDomain:(id)a3;
@end

@implementation BCSBusinessEmailIdentifier

- (BCSBusinessEmailIdentifier)initWithEmail:(id)a3 fullDomain:(id)a4 topLevelDomain:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BCSBusinessEmailIdentifier;
  v11 = [(BCSBusinessEmailIdentifier *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 lowercaseString];
    email = v11->_email;
    v11->_email = (NSString *)v12;

    uint64_t v14 = [v9 lowercaseString];
    fullDomain = v11->_fullDomain;
    v11->_fullDomain = (NSString *)v14;

    uint64_t v16 = [v10 lowercaseString];
    topLevelDomain = v11->_topLevelDomain;
    v11->_topLevelDomain = (NSString *)v16;
  }
  return v11;
}

- (BCSBusinessEmailIdentifier)initWithDefaultsDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"email"];
  v6 = [v4 objectForKeyedSubscript:@"fullDomain"];
  v7 = [v4 objectForKeyedSubscript:@"topLevelDomain"];

  id v8 = [(BCSBusinessEmailIdentifier *)self initWithEmail:v5 fullDomain:v6 topLevelDomain:v7];
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 email];
    v7 = [(BCSBusinessEmailIdentifier *)self email];
    int v8 = [v6 isEqualToString:v7];

    if (v8
      && ([v5 fullDomain],
          id v9 = objc_claimAutoreleasedReturnValue(),
          [(BCSBusinessEmailIdentifier *)self fullDomain],
          id v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = [v9 isEqualToString:v10],
          v10,
          v9,
          v11))
    {
      uint64_t v12 = [v5 topLevelDomain];
      v13 = [(BCSBusinessEmailIdentifier *)self topLevelDomain];
      char v14 = [v12 isEqualToString:v13];
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_email hash];
  NSUInteger v4 = [(NSString *)self->_fullDomain hash] ^ v3;
  return v4 ^ [(NSString *)self->_topLevelDomain hash];
}

- (BOOL)matchesIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(BCSBusinessEmailIdentifier *)self email];
  v6 = [v4 email];
  if ([v5 isEqualToString:v6])
  {
    char v7 = 1;
  }
  else
  {
    int v8 = [(BCSBusinessEmailIdentifier *)self fullDomain];
    id v9 = [v4 fullDomain];
    if ([v8 isEqualToString:v9])
    {
      char v7 = 1;
    }
    else
    {
      id v10 = [(BCSBusinessEmailIdentifier *)self topLevelDomain];
      int v11 = [v4 topLevelDomain];
      char v7 = [v10 isEqualToString:v11];
    }
  }

  return v7;
}

- (id)debugDescription
{
  NSUInteger v3 = NSString;
  id v4 = [(BCSBusinessEmailIdentifier *)self email];
  id v5 = [(BCSBusinessEmailIdentifier *)self fullDomain];
  v6 = [(BCSBusinessEmailIdentifier *)self topLevelDomain];
  char v7 = [v3 stringWithFormat:@"<%@ { email: %@, fullDomain: %@, topLevelDomain: %@ }>", self, v4, v5, v6];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    id v5 = [(BCSBusinessEmailIdentifier *)self email];
    uint64_t v6 = [v5 copy];
    char v7 = (void *)v4[1];
    v4[1] = v6;

    int v8 = [(BCSBusinessEmailIdentifier *)self fullDomain];
    uint64_t v9 = [v8 copy];
    id v10 = (void *)v4[2];
    v4[2] = v9;

    int v11 = [(BCSBusinessEmailIdentifier *)self topLevelDomain];
    uint64_t v12 = [v11 copy];
    v13 = (void *)v4[3];
    v4[3] = v12;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  email = self->_email;
  id v5 = a3;
  [v5 encodeObject:email forKey:@"Email"];
  [v5 encodeObject:self->_fullDomain forKey:@"FullDomain"];
  [v5 encodeObject:self->_topLevelDomain forKey:@"TopLevelDomain"];
}

- (BCSBusinessEmailIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BCSBusinessEmailIdentifier;
  id v5 = [(BCSBusinessEmailIdentifier *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Email"];
    email = v5->_email;
    v5->_email = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FullDomain"];
    fullDomain = v5->_fullDomain;
    v5->_fullDomain = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TopLevelDomain"];
    topLevelDomain = v5->_topLevelDomain;
    v5->_topLevelDomain = (NSString *)v10;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)email
{
  return self->_email;
}

- (void)setEmail:(id)a3
{
}

- (NSString)fullDomain
{
  return self->_fullDomain;
}

- (void)setFullDomain:(id)a3
{
}

- (NSString)topLevelDomain
{
  return self->_topLevelDomain;
}

- (void)setTopLevelDomain:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topLevelDomain, 0);
  objc_storeStrong((id *)&self->_fullDomain, 0);

  objc_storeStrong((id *)&self->_email, 0);
}

@end