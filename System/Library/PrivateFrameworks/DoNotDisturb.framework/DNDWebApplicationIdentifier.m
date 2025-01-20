@interface DNDWebApplicationIdentifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (DNDWebApplicationIdentifier)initWithCoder:(id)a3;
- (DNDWebApplicationIdentifier)initWithWebIdentifier:(id)a3 givenName:(id)a4;
- (NSString)description;
- (NSString)givenName;
- (NSString)webIdentifier;
- (id)diffDescription;
- (unint64_t)hash;
- (unint64_t)platform;
- (void)diffAgainstObject:(id)a3 usingDiffBuilder:(id)a4 withDescription:(id)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDWebApplicationIdentifier

- (DNDWebApplicationIdentifier)initWithWebIdentifier:(id)a3 givenName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DNDWebApplicationIdentifier;
  v8 = [(DNDWebApplicationIdentifier *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    webIdentifier = v8->_webIdentifier;
    v8->_webIdentifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    givenName = v8->_givenName;
    v8->_givenName = (NSString *)v11;
  }
  return v8;
}

- (unint64_t)platform
{
  return 1;
}

- (unint64_t)hash
{
  v3 = [(DNDWebApplicationIdentifier *)self webIdentifier];
  uint64_t v4 = [v3 hash];
  v5 = [(DNDWebApplicationIdentifier *)self givenName];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (DNDWebApplicationIdentifier *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(DNDWebApplicationIdentifier *)self webIdentifier];
      id v7 = [(DNDWebApplicationIdentifier *)v5 webIdentifier];
      if (v6 != v7)
      {
        uint64_t v8 = [(DNDWebApplicationIdentifier *)self webIdentifier];
        if (!v8)
        {
          char v13 = 0;
LABEL_24:

          goto LABEL_25;
        }
        uint64_t v9 = (void *)v8;
        v10 = [(DNDWebApplicationIdentifier *)v5 webIdentifier];
        if (!v10)
        {
          char v13 = 0;
LABEL_23:

          goto LABEL_24;
        }
        uint64_t v11 = [(DNDWebApplicationIdentifier *)self webIdentifier];
        v12 = [(DNDWebApplicationIdentifier *)v5 webIdentifier];
        if (![v11 isEqual:v12])
        {
          char v13 = 0;
LABEL_22:

          goto LABEL_23;
        }
        v23 = v12;
        v24 = v11;
        v25 = v10;
        v26 = v9;
      }
      objc_super v14 = [(DNDWebApplicationIdentifier *)self givenName];
      uint64_t v15 = [(DNDWebApplicationIdentifier *)v5 givenName];
      if (v14 == (void *)v15)
      {

        char v13 = 1;
      }
      else
      {
        v16 = (void *)v15;
        uint64_t v17 = [(DNDWebApplicationIdentifier *)self givenName];
        if (v17)
        {
          v18 = (void *)v17;
          v19 = [(DNDWebApplicationIdentifier *)v5 givenName];
          if (v19)
          {
            v22 = [(DNDWebApplicationIdentifier *)self givenName];
            v20 = [(DNDWebApplicationIdentifier *)v5 givenName];
            char v13 = [v22 isEqual:v20];
          }
          else
          {
            char v13 = 0;
          }
        }
        else
        {

          char v13 = 0;
        }
      }
      v10 = v25;
      uint64_t v9 = v26;
      v12 = v23;
      uint64_t v11 = v24;
      if (v6 == v7) {
        goto LABEL_24;
      }
      goto LABEL_22;
    }
    char v13 = 0;
  }
LABEL_25:

  return v13;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; webIdentifier: %@; givenName: %@>",
                       objc_opt_class(),
                       self,
                       self->_webIdentifier,
                       self->_givenName);
}

- (void)diffAgainstObject:(id)a3 usingDiffBuilder:(id)a4 withDescription:(id)a5
{
  id v13 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v13;
    uint64_t v9 = [(DNDWebApplicationIdentifier *)self webIdentifier];
    v10 = [v8 webIdentifier];
    [v7 diffObject:v9 againstObject:v10 withDescription:@"webIdentifier"];

    uint64_t v11 = [(DNDWebApplicationIdentifier *)self givenName];
    v12 = [v8 givenName];

    [v7 diffObject:v11 againstObject:v12 withDescription:@"givenName"];
  }
}

- (id)diffDescription
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"webIdentifier:%@;givenName:%@",
               self->_webIdentifier,
               self->_givenName);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDWebApplicationIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"webIdentifier"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"givenName"];

  id v7 = [(DNDWebApplicationIdentifier *)self initWithWebIdentifier:v5 givenName:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  webIdentifier = self->_webIdentifier;
  id v5 = a3;
  [v5 encodeObject:webIdentifier forKey:@"webIdentifier"];
  [v5 encodeObject:self->_givenName forKey:@"givenName"];
}

- (NSString)webIdentifier
{
  return self->_webIdentifier;
}

- (NSString)givenName
{
  return self->_givenName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_webIdentifier, 0);
}

@end