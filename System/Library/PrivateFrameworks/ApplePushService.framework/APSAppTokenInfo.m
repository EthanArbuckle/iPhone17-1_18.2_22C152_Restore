@interface APSAppTokenInfo
+ (BOOL)supportsSecureCoding;
- (APSAppTokenInfo)initWithCoder:(id)a3;
- (APSAppTokenInfo)initWithDictionary:(id)a3;
- (APSAppTokenInfo)initWithTopic:(id)a3 identifier:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUnextended;
- (NSData)baseToken;
- (NSData)vapidPublicKey;
- (NSDate)expirationDate;
- (NSString)description;
- (NSString)identifier;
- (NSString)topic;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)initUnextendedAppTokenWithTopic:(id)a3 identifier:(id)a4;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBaseToken:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsUnextended:(BOOL)a3;
- (void)setTopic:(id)a3;
@end

@implementation APSAppTokenInfo

- (id)initUnextendedAppTokenWithTopic:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)APSAppTokenInfo;
  v8 = [(APSAppTokenInfo *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(APSAppTokenInfo *)v8 setTopic:v6];
    [(APSAppTokenInfo *)v9 setIdentifier:v7];
    [(APSAppTokenInfo *)v9 setIsUnextended:1];
  }

  return v9;
}

- (APSAppTokenInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)APSAppTokenInfo;
  v5 = [(APSAppTokenInfo *)&v16 init];
  if (v5)
  {
    id v6 = [v4 objectForKey:@"APSAppTokenInfoTopic"];
    [(APSAppTokenInfo *)v5 setTopic:v6];

    id v7 = [v4 objectForKey:@"APSAppTokenInfoIdentifier"];
    [(APSAppTokenInfo *)v5 setIdentifier:v7];

    v8 = [v4 objectForKey:@"APSAppTokenInfoBaseTokenKey"];

    if (v8)
    {
      v9 = [v4 objectForKey:@"APSAppTokenInfoBaseTokenKey"];
      [(APSAppTokenInfo *)v5 setBaseToken:v9];
    }
    v10 = [v4 objectForKey:@"APSAppTokenInfoExpirationDate"];

    if (v10)
    {
      objc_super v11 = (void *)MEMORY[0x1E4F1C9C8];
      v12 = [v4 objectForKey:@"APSAppTokenInfoExpirationDate"];
      [v12 doubleValue];
      v13 = objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
      [(APSAppTokenInfo *)v5 setExpirationDate:v13];
    }
    v14 = [v4 objectForKey:@"APSAppTokenInfoIsUnextendedKey"];
    -[APSAppTokenInfo setIsUnextended:](v5, "setIsUnextended:", [v14 BOOLValue]);
  }
  return v5;
}

- (void)setTopic:(id)a3
{
}

- (void)setIsUnextended:(BOOL)a3
{
  self->_isUnextended = a3;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setBaseToken:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v12 = 0;
    goto LABEL_27;
  }
  id v5 = v4;
  id v6 = [(APSAppTokenInfo *)self topic];
  id v7 = [v5 topic];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    v9 = [(APSAppTokenInfo *)self identifier];
    if (v9 || ([v5 identifier], (id v7 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v10 = [(APSAppTokenInfo *)self identifier];
      objc_super v11 = [v5 identifier];
      int v8 = [v10 isEqual:v11];

      if (v9)
      {

        if (!v8) {
          goto LABEL_18;
        }
      }
      else
      {

        if ((v8 & 1) == 0) {
          goto LABEL_17;
        }
      }
    }
    v13 = [(APSAppTokenInfo *)self expirationDate];
    if (!v13)
    {
      id v7 = [v5 expirationDate];
      if (!v7) {
        goto LABEL_16;
      }
    }
    v14 = [(APSAppTokenInfo *)self expirationDate];
    v15 = [v5 expirationDate];
    int v8 = [v14 isEqual:v15];

    if (v13)
    {

      if (!v8) {
        goto LABEL_18;
      }
      goto LABEL_16;
    }

    if (v8)
    {
LABEL_16:
      BOOL v16 = [(APSAppTokenInfo *)self isUnextended];
      int v8 = v16 ^ [v5 isUnextended] ^ 1;
      goto LABEL_18;
    }
LABEL_17:
    int v8 = 0;
  }
LABEL_18:
  uint64_t v17 = [(APSAppTokenInfo *)self baseToken];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [v5 baseToken];

    if (v19) {
      char v12 = 0;
    }
    else {
      char v12 = v8;
    }
    if (v19 && ((v8 ^ 1) & 1) == 0)
    {
      v20 = [(APSAppTokenInfo *)self baseToken];
      v21 = [v5 baseToken];
      char v12 = [v20 isEqualToData:v21];
    }
  }
  else
  {
    char v12 = v8;
  }

LABEL_27:
  return v12;
}

- (NSString)topic
{
  return self->_topic;
}

- (NSData)baseToken
{
  return self->_baseToken;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)type
{
  return [(APSAppTokenInfo *)self isUnextended] ^ 1;
}

- (BOOL)isUnextended
{
  return self->_isUnextended;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_baseToken, 0);
}

- (APSAppTokenInfo)initWithTopic:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)APSAppTokenInfo;
  int v8 = [(APSAppTokenInfo *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(APSAppTokenInfo *)v8 setTopic:v6];
    [(APSAppTokenInfo *)v9 setIdentifier:v7];
  }

  return v9;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(APSAppTokenInfo *)self topic];
  [v3 setObject:v4 forKey:@"APSAppTokenInfoTopic"];

  id v5 = [(APSAppTokenInfo *)self identifier];
  [v3 setObject:v5 forKey:@"APSAppTokenInfoIdentifier"];

  id v6 = [(APSAppTokenInfo *)self baseToken];

  if (v6)
  {
    id v7 = [(APSAppTokenInfo *)self baseToken];
    [v3 setObject:v7 forKey:@"APSAppTokenInfoBaseTokenKey"];
  }
  int v8 = [(APSAppTokenInfo *)self expirationDate];

  if (v8)
  {
    v9 = NSNumber;
    v10 = [(APSAppTokenInfo *)self expirationDate];
    [v10 timeIntervalSinceReferenceDate];
    objc_super v11 = objc_msgSend(v9, "numberWithDouble:");
    [v3 setObject:v11 forKey:@"APSAppTokenInfoExpirationDate"];
  }
  if ([(APSAppTokenInfo *)self isUnextended])
  {
    char v12 = objc_msgSend(NSNumber, "numberWithBool:", -[APSAppTokenInfo isUnextended](self, "isUnextended"));
    [v3 setObject:v12 forKey:@"APSAppTokenInfoIsUnextendedKey"];
  }
  v13 = (void *)[v3 copy];

  return v13;
}

- (unint64_t)hash
{
  id v3 = [(APSAppTokenInfo *)self topic];
  uint64_t v4 = [v3 hash];

  id v5 = [(APSAppTokenInfo *)self identifier];

  if (v5)
  {
    id v6 = [(APSAppTokenInfo *)self identifier];
    v4 ^= [v6 hash];
  }
  id v7 = [(APSAppTokenInfo *)self expirationDate];

  if (v7)
  {
    int v8 = [(APSAppTokenInfo *)self expirationDate];
    v4 ^= [v8 hash];
  }
  return v4 ^ [(APSAppTokenInfo *)self isUnextended];
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = [(APSAppTokenInfo *)self topic];
  id v5 = [(APSAppTokenInfo *)self identifier];
  id v6 = [(APSAppTokenInfo *)self expirationDate];
  id v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[APSAppTokenInfo type](self, "type"));
  int v8 = [(APSAppTokenInfo *)self baseToken];
  v9 = [v3 stringWithFormat:@"<APSAppTokenInfo %p>: Topic %@ Identifier %@ Expiration %@ type %@ base token %@", self, v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(APSAppTokenInfo *)self topic];
  [v10 encodeObject:v4 forKey:@"APSAppTokenInfoTopic"];

  id v5 = [(APSAppTokenInfo *)self identifier];
  [v10 encodeObject:v5 forKey:@"APSAppTokenInfoIdentifier"];

  id v6 = [(APSAppTokenInfo *)self baseToken];

  if (v6)
  {
    id v7 = [(APSAppTokenInfo *)self baseToken];
    [v10 encodeObject:v7 forKey:@"APSAppTokenInfoBaseTokenKey"];
  }
  int v8 = [(APSAppTokenInfo *)self expirationDate];

  if (v8)
  {
    v9 = [(APSAppTokenInfo *)self expirationDate];
    [v10 encodeObject:v9 forKey:@"APSAppTokenInfoExpirationDate"];
  }
  objc_msgSend(v10, "encodeBool:forKey:", -[APSAppTokenInfo isUnextended](self, "isUnextended"), @"APSAppTokenInfoIsUnextendedKey");
}

- (APSAppTokenInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)APSAppTokenInfo;
  id v5 = [(APSAppTokenInfo *)&v11 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"APSAppTokenInfoTopic"];
    [(APSAppTokenInfo *)v5 setTopic:v6];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"APSAppTokenInfoIdentifier"];
    [(APSAppTokenInfo *)v5 setIdentifier:v7];

    if ([v4 containsValueForKey:@"APSAppTokenInfoBaseTokenKey"])
    {
      int v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"APSAppTokenInfoBaseTokenKey"];
      [(APSAppTokenInfo *)v5 setBaseToken:v8];
    }
    if ([v4 containsValueForKey:@"APSAppTokenInfoExpirationDate"])
    {
      v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"APSAppTokenInfoExpirationDate"];
      [(APSAppTokenInfo *)v5 setExpirationDate:v9];
    }
    -[APSAppTokenInfo setIsUnextended:](v5, "setIsUnextended:", [v4 decodeBoolForKey:@"APSAppTokenInfoIsUnextendedKey"]);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [APSAppTokenInfo alloc];
  id v5 = [(APSAppTokenInfo *)self topic];
  id v6 = [(APSAppTokenInfo *)self identifier];
  id v7 = [(APSAppTokenInfo *)v4 initWithTopic:v5 identifier:v6];

  int v8 = [(APSAppTokenInfo *)self expirationDate];
  [(APSAppTokenInfo *)v7 setExpirationDate:v8];

  [(APSAppTokenInfo *)v7 setIsUnextended:[(APSAppTokenInfo *)self isUnextended]];
  v9 = [(APSAppTokenInfo *)self baseToken];
  [(APSAppTokenInfo *)v7 setBaseToken:v9];

  return v7;
}

- (NSData)vapidPublicKey
{
  return 0;
}

- (void)setExpirationDate:(id)a3
{
}

@end