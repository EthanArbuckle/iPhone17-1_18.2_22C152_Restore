@interface ASDTIOServiceID
+ (id)forIdentifier:(id)a3 andClientType:(unsigned int)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initForIdentifier:(id)a3 andClientType:(unsigned int)a4;
- (unint64_t)hash;
- (unsigned)clientType;
- (void)setClientType:(unsigned int)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation ASDTIOServiceID

- (id)initForIdentifier:(id)a3 andClientType:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASDTIOServiceID;
  v7 = [(ASDTIOServiceID *)&v11 init];
  v8 = v7;
  if (v7)
  {
    if (!v6)
    {
      v9 = 0;
      goto LABEL_6;
    }
    [(ASDTIOServiceID *)v7 setIdentifier:v6];
    [(ASDTIOServiceID *)v8 setClientType:v4];
  }
  v9 = v8;
LABEL_6:

  return v9;
}

+ (id)forIdentifier:(id)a3 andClientType:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initForIdentifier:v6 andClientType:v4];

  return v7;
}

- (unint64_t)hash
{
  v3 = [(ASDTIOServiceID *)self identifier];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = v4 ^ [(ASDTIOServiceID *)self clientType];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  unint64_t v5 = [(ASDTIOServiceID *)self identifier];
  id v6 = objc_msgSend(v4, "initForIdentifier:andClientType:", v5, -[ASDTIOServiceID clientType](self, "clientType"));

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ASDTIOServiceID *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      id v6 = [(ASDTIOServiceID *)self identifier];
      v7 = [(ASDTIOServiceID *)v5 identifier];
      if ([v6 isEqualToString:v7])
      {
        unsigned int v8 = [(ASDTIOServiceID *)self clientType];
        char v9 = v8 == [(ASDTIOServiceID *)v5 clientType];
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        char v9 = 0;
        goto LABEL_12;
      }
      unint64_t v5 = [(ASDTIOServiceID *)self identifier];
      char v9 = [(ASDTIOServiceID *)v5 isEqualToString:v4];
    }
  }
LABEL_12:

  return v9;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(ASDTIOServiceID *)self identifier];
  unint64_t v5 = [v3 stringWithFormat:@"%@:%u", v4, -[ASDTIOServiceID clientType](self, "clientType")];

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unsigned)clientType
{
  return self->_clientType;
}

- (void)setClientType:(unsigned int)a3
{
  self->_clientType = a3;
}

- (void).cxx_destruct
{
}

@end