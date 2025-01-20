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
  v7[0] = @"removability";
  v3 = +[NSNumber numberWithUnsignedInteger:[(IXAppRemovabilityMetadata *)self removability]];
  v7[1] = @"client";
  v8[0] = v3;
  id v4 = +[NSNumber numberWithUnsignedInteger:[(IXAppRemovabilityMetadata *)self client]];
  v8[1] = v4;
  v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return (NSDictionary *)v5;
}

- (BOOL)isUnknown
{
  return ![(IXAppRemovabilityMetadata *)self removability]
      && ![(IXAppRemovabilityMetadata *)self client];
}

- (id)description
{
  v3 = IXStringForAppRemovability([(IXAppRemovabilityMetadata *)self removability]);
  id v4 = IXStringForAppRemovabilityClient([(IXAppRemovabilityMetadata *)self client]);
  v5 = +[NSString stringWithFormat:@"%@:%@", v3, v4];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  unint64_t v5 = [(IXAppRemovabilityMetadata *)self removability];
  unint64_t v6 = [(IXAppRemovabilityMetadata *)self client];

  return [v4 initWithRemovability:v5 client:v6];
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
    id v7 = [(IXAppRemovabilityMetadata *)v6 removability];
    BOOL v9 = 0;
    if (v7 == (id)[(IXAppRemovabilityMetadata *)self removability])
    {
      id v8 = [(IXAppRemovabilityMetadata *)v6 client];
      if (v8 == (id)[(IXAppRemovabilityMetadata *)self client]) {
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
  id v4 = a3;
  unint64_t v5 = +[NSNumber numberWithUnsignedInteger:[(IXAppRemovabilityMetadata *)self removability]];
  [v4 encodeObject:v5 forKey:@"removability"];

  id v6 = +[NSNumber numberWithUnsignedInteger:[(IXAppRemovabilityMetadata *)self client]];
  [v4 encodeObject:v6 forKey:@"client"];
}

- (IXAppRemovabilityMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IXAppRemovabilityMetadata;
  unint64_t v5 = [(IXAppRemovabilityMetadata *)&v9 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"removability"];
    v5->_removability = (unint64_t)[v6 unsignedLongLongValue];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"client"];
    v5->_client = (unint64_t)[v7 unsignedLongLongValue];
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