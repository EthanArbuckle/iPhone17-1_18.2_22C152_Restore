@interface IXAppRemovabilityMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUnknown;
- (IXAppRemovabilityMetadata)initWithCoder:(id)a3;
- (IXAppRemovabilityMetadata)initWithMetadataDictionary:(id)a3;
- (IXAppRemovabilityMetadata)initWithRemovability:(unint64_t)a3 client:(unint64_t)a4;
- (NSDictionary)dictionaryRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)client;
- (unint64_t)hash;
- (unint64_t)removability;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IXAppRemovabilityMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IXAppRemovabilityMetadata)initWithRemovability:(unint64_t)a3 client:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)IXAppRemovabilityMetadata;
  result = [(IXAppRemovabilityMetadata *)&v7 init];
  if (result)
  {
    result->_removability = a3;
    result->_client = a4;
  }
  return result;
}

- (IXAppRemovabilityMetadata)initWithMetadataDictionary:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKeyedSubscript:@"removability"];
    objc_opt_class();
    id v7 = v6;
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }

    v10 = [v5 objectForKeyedSubscript:@"client"];
    objc_opt_class();
    id v11 = v10;
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    v9 = 0;
    if (v8 && v12)
    {
      self = -[IXAppRemovabilityMetadata initWithRemovability:client:](self, "initWithRemovability:client:", [v8 unsignedIntegerValue], objc_msgSend(v12, "unsignedIntegerValue"));
      v9 = self;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSDictionary)dictionaryRepresentation
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"removability";
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[IXAppRemovabilityMetadata removability](self, "removability"));
  v7[1] = @"client";
  v8[0] = v3;
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[IXAppRemovabilityMetadata client](self, "client"));
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return (NSDictionary *)v5;
}

- (BOOL)isUnknown
{
  return ![(IXAppRemovabilityMetadata *)self removability]
      && ![(IXAppRemovabilityMetadata *)self client];
}

- (id)description
{
  v3 = NSString;
  id v4 = IXStringForAppRemovability([(IXAppRemovabilityMetadata *)self removability]);
  v5 = IXStringForAppRemovabilityClient([(IXAppRemovabilityMetadata *)self client]);
  v6 = [v3 stringWithFormat:@"%@:%@", v4, v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  unint64_t v5 = [(IXAppRemovabilityMetadata *)self removability];
  unint64_t v6 = [(IXAppRemovabilityMetadata *)self client];

  return (id)[v4 initWithRemovability:v5 client:v6];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IXAppRemovabilityMetadata *)a3;
  unint64_t v5 = v4;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unint64_t v6 = v5;
    uint64_t v7 = [(IXAppRemovabilityMetadata *)v6 removability];
    BOOL v9 = 0;
    if (v7 == [(IXAppRemovabilityMetadata *)self removability])
    {
      uint64_t v8 = [(IXAppRemovabilityMetadata *)v6 client];
      if (v8 == [(IXAppRemovabilityMetadata *)self client]) {
        BOOL v9 = 1;
      }
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(IXAppRemovabilityMetadata *)self removability];
  return [(IXAppRemovabilityMetadata *)self client] ^ v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  id v5 = a3;
  unint64_t v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", -[IXAppRemovabilityMetadata removability](self, "removability"));
  [v5 encodeObject:v6 forKey:@"removability"];

  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[IXAppRemovabilityMetadata client](self, "client"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v7 forKey:@"client"];
}

- (IXAppRemovabilityMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IXAppRemovabilityMetadata;
  id v5 = [(IXAppRemovabilityMetadata *)&v9 init];
  if (v5)
  {
    unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"removability"];
    v5->_removability = [v6 unsignedLongLongValue];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"client"];
    v5->_client = [v7 unsignedLongLongValue];
  }
  return v5;
}

- (unint64_t)removability
{
  return self->_removability;
}

- (unint64_t)client
{
  return self->_client;
}

@end