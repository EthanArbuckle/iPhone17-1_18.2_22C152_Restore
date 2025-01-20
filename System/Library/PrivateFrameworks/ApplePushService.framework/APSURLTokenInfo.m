@interface APSURLTokenInfo
+ (BOOL)supportsSecureCoding;
- (APSURLTokenInfo)initWithCoder:(id)a3;
- (APSURLTokenInfo)initWithDictionary:(id)a3;
- (APSURLTokenInfo)initWithTopic:(id)a3;
- (APSURLTokenInfo)initWithTopic:(id)a3 vapidPublicKey:(id)a4;
- (APSURLTokenInfo)initWithTopic:(id)a3 vapidPublicKey:(id)a4 expirationDate:(id)a5;
- (BOOL)allowMultipleTokens;
- (BOOL)isEqual:(id)a3;
- (NSData)baseToken;
- (NSData)vapidPublicKey;
- (NSDate)expirationDate;
- (NSString)description;
- (NSString)identifier;
- (NSString)topic;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBaseToken:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setTopic:(id)a3;
- (void)setVapidPublicKey:(id)a3;
@end

@implementation APSURLTokenInfo

- (APSURLTokenInfo)initWithTopic:(id)a3
{
  return [(APSURLTokenInfo *)self initWithTopic:a3 vapidPublicKey:0 expirationDate:0];
}

- (APSURLTokenInfo)initWithTopic:(id)a3 vapidPublicKey:(id)a4
{
  return [(APSURLTokenInfo *)self initWithTopic:a3 vapidPublicKey:a4 expirationDate:0];
}

- (APSURLTokenInfo)initWithTopic:(id)a3 vapidPublicKey:(id)a4 expirationDate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    v16.receiver = self;
    v16.super_class = (Class)APSURLTokenInfo;
    v12 = [(APSURLTokenInfo *)&v16 init];
    p_isa = (id *)&v12->super.isa;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_topic, a3);
      objc_storeStrong(p_isa + 3, a4);
      objc_storeStrong(p_isa + 4, a5);
    }
    self = p_isa;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (APSURLTokenInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"t"];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = [v4 objectForKeyedSubscript:@"vPK"];
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v14 = 0;
    }
    else
    {
      v7 = [v4 objectForKeyedSubscript:@"eD"];
      if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v14 = 0;
      }
      else
      {
        v8 = [v4 objectForKeyedSubscript:@"bT"];
        v16.receiver = self;
        v16.super_class = (Class)APSURLTokenInfo;
        id v9 = [(APSURLTokenInfo *)&v16 init];
        id v10 = v9;
        if (v9)
        {
          objc_storeStrong((id *)&v9->_topic, v5);
          objc_storeStrong((id *)&v10->_vapidPublicKey, v6);
          if (v7)
          {
            id v11 = (void *)MEMORY[0x1E4F1C9C8];
            [v7 doubleValue];
            uint64_t v12 = objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
            expirationDate = v10->_expirationDate;
            v10->_expirationDate = (NSDate *)v12;
          }
          else
          {
            expirationDate = v10->_expirationDate;
            v10->_expirationDate = 0;
          }

          objc_storeStrong((id *)&v10->_baseToken, v8);
        }
        self = v10;

        v14 = self;
      }
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(APSURLTokenInfo *)self topic];
  [v3 setObject:v4 forKeyedSubscript:@"t"];

  v5 = [(APSURLTokenInfo *)self vapidPublicKey];
  [v3 setObject:v5 forKeyedSubscript:@"vPK"];

  v6 = [(APSURLTokenInfo *)self expirationDate];
  if (v6)
  {
    v7 = NSNumber;
    v8 = [(APSURLTokenInfo *)self expirationDate];
    [v8 timeIntervalSinceReferenceDate];
    id v9 = objc_msgSend(v7, "numberWithDouble:");
    [v3 setObject:v9 forKeyedSubscript:@"eD"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"eD"];
  }

  id v10 = [(APSURLTokenInfo *)self baseToken];
  [v3 setObject:v10 forKeyedSubscript:@"bT"];

  id v11 = (void *)[v3 copy];
  return v11;
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = [(APSURLTokenInfo *)self topic];
  v5 = [(APSURLTokenInfo *)self vapidPublicKey];
  if (v5) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  v7 = [(APSURLTokenInfo *)self expirationDate];
  v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[APSURLTokenInfo type](self, "type"));
  id v9 = [(APSURLTokenInfo *)self baseToken];
  id v10 = [v3 stringWithFormat:@"<APSURLTokenInfo %p>: Topic: %@ VapidPublicKey: %@ Expiration: %@ Type: %@ Base Token: %@", self, v4, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v12 = 0;
    goto LABEL_28;
  }
  id v6 = v5;
  v7 = [(APSURLTokenInfo *)self topic];
  v8 = [v6 topic];
  if ([v7 isEqualToString:v8])
  {
    id v9 = [(APSURLTokenInfo *)self vapidPublicKey];
    if (v9 || ([v6 vapidPublicKey], (v27 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v10 = [(APSURLTokenInfo *)self vapidPublicKey];
      id v3 = [v6 vapidPublicKey];
      if (([v10 isEqualToData:v3] & 1) == 0)
      {

        int v13 = 0;
        goto LABEL_16;
      }
      v29 = v10;
      int v11 = 1;
    }
    else
    {
      v27 = 0;
      int v11 = 0;
    }
    v26 = v3;
    v14 = [(APSURLTokenInfo *)self expirationDate];
    if (v14 || ([v6 expirationDate], (uint64_t v25 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      int v28 = v11;
      v15 = [(APSURLTokenInfo *)self expirationDate];
      objc_super v16 = [v6 expirationDate];
      int v13 = [v15 isEqualToDate:v16];

      if (v14)
      {

        v17 = v29;
        if (v28)
        {
LABEL_15:
        }
LABEL_16:
        if (!v9) {

        }
        goto LABEL_19;
      }
      v17 = v29;
      LOBYTE(v11) = v28;
      v24 = (void *)v25;
    }
    else
    {
      v24 = 0;
      int v13 = 1;
      v17 = v29;
    }

    if ((v11 & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  int v13 = 0;
LABEL_19:

  uint64_t v18 = [(APSURLTokenInfo *)self baseToken];
  if (v18)
  {
    v19 = (void *)v18;
    v20 = [v6 baseToken];

    if (v20) {
      char v12 = 0;
    }
    else {
      char v12 = v13;
    }
    if (v20 && ((v13 ^ 1) & 1) == 0)
    {
      v21 = [(APSURLTokenInfo *)self baseToken];
      v22 = [v6 baseToken];
      char v12 = [v21 isEqualToData:v22];
    }
  }
  else
  {
    char v12 = v13;
  }

LABEL_28:
  return v12;
}

- (unint64_t)hash
{
  id v3 = [(APSURLTokenInfo *)self topic];
  unint64_t v4 = [v3 hash];

  id v5 = [(APSURLTokenInfo *)self vapidPublicKey];

  if (v5)
  {
    id v6 = [(APSURLTokenInfo *)self vapidPublicKey];
    v4 ^= [v6 hash];
  }
  v7 = [(APSURLTokenInfo *)self expirationDate];

  if (v7)
  {
    v8 = [(APSURLTokenInfo *)self expirationDate];
    v4 ^= [v8 hash];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(APSURLTokenInfo *)self topic];
  [v4 encodeObject:v5 forKey:@"t"];

  id v6 = [(APSURLTokenInfo *)self vapidPublicKey];
  [v4 encodeObject:v6 forKey:@"vPK"];

  v7 = [(APSURLTokenInfo *)self expirationDate];
  [v4 encodeObject:v7 forKey:@"eD"];

  id v8 = [(APSURLTokenInfo *)self baseToken];
  [v4 encodeObject:v8 forKey:@"bT"];
}

- (APSURLTokenInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"t"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vPK"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eD"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bT"];

  id v9 = [(APSURLTokenInfo *)self initWithTopic:v5 vapidPublicKey:v6 expirationDate:v7];
  [(APSURLTokenInfo *)v9 setBaseToken:v8];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [APSURLTokenInfo alloc];
  id v5 = [(APSURLTokenInfo *)self topic];
  id v6 = [(APSURLTokenInfo *)self vapidPublicKey];
  v7 = [(APSURLTokenInfo *)self expirationDate];
  id v8 = [(APSURLTokenInfo *)v4 initWithTopic:v5 vapidPublicKey:v6 expirationDate:v7];

  id v9 = [(APSURLTokenInfo *)self baseToken];
  [(APSURLTokenInfo *)v8 setBaseToken:v9];

  return v8;
}

- (int64_t)type
{
  return 2;
}

- (NSString)identifier
{
  return 0;
}

- (BOOL)allowMultipleTokens
{
  return 0;
}

- (NSData)baseToken
{
  return self->_baseToken;
}

- (void)setBaseToken:(id)a3
{
}

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
}

- (NSData)vapidPublicKey
{
  return self->_vapidPublicKey;
}

- (void)setVapidPublicKey:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_vapidPublicKey, 0);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_baseToken, 0);
}

@end