@interface IXAppRemovabilityMetadataList
+ (BOOL)supportsSecureCoding;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (IXAppRemovabilityMetadataList)initWithCoder:(id)a3;
- (IXAppRemovabilityMetadataList)initWithInitialRemovability:(unint64_t)a3 client:(unint64_t)a4;
- (IXAppRemovabilityMetadataList)initWithInitialRemovabilityMetadata:(id)a3;
- (IXAppRemovabilityMetadataList)initWithMetadataDictionary:(id)a3;
- (IXAppRemovabilityMetadataList)initWithSerializedDictionary:(id)a3;
- (NSDictionary)clientToRemovabilityMetadataMap;
- (NSDictionary)propertyListRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mostRestrictiveRemovabilityMetadata;
- (unint64_t)hash;
- (unint64_t)removabilityForClient:(unint64_t)a3 notFoundRemovability:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setClientToRemovabilityMetadataMap:(id)a3;
- (void)updateRemovability:(unint64_t)a3 forClient:(unint64_t)a4;
- (void)updateRemovabilityWithMetadata:(id)a3;
@end

@implementation IXAppRemovabilityMetadataList

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IXAppRemovabilityMetadataList)initWithMetadataDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)IXAppRemovabilityMetadataList;
    v5 = [(IXAppRemovabilityMetadataList *)&v10 init];
    if (v5)
    {
      v6 = (NSDictionary *)[v4 copy];
      clientToRemovabilityMetadataMap = v5->_clientToRemovabilityMetadataMap;
      v5->_clientToRemovabilityMetadataMap = v6;
    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (IXAppRemovabilityMetadataList)initWithInitialRemovability:(unint64_t)a3 client:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)IXAppRemovabilityMetadataList;
  v6 = [(IXAppRemovabilityMetadataList *)&v10 init];
  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    clientToRemovabilityMetadataMap = v6->_clientToRemovabilityMetadataMap;
    v6->_clientToRemovabilityMetadataMap = (NSDictionary *)v7;

    [(IXAppRemovabilityMetadataList *)v6 updateRemovability:a3 forClient:a4];
  }
  return v6;
}

- (IXAppRemovabilityMetadataList)initWithInitialRemovabilityMetadata:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)IXAppRemovabilityMetadataList;
    v5 = [(IXAppRemovabilityMetadataList *)&v10 init];
    if (v5)
    {
      uint64_t v6 = objc_opt_new();
      clientToRemovabilityMetadataMap = v5->_clientToRemovabilityMetadataMap;
      v5->_clientToRemovabilityMetadataMap = (NSDictionary *)v6;

      [(IXAppRemovabilityMetadataList *)v5 updateRemovabilityWithMetadata:v4];
    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (IXAppRemovabilityMetadataList)initWithSerializedDictionary:(id)a3
{
  if (a3)
  {
    id v4 = [a3 objectForKeyedSubscript:@"metadata"];
    objc_opt_class();
    id v5 = v4;
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }

    if (v6)
    {
      v15.receiver = self;
      v15.super_class = (Class)IXAppRemovabilityMetadataList;
      v8 = [(IXAppRemovabilityMetadataList *)&v15 init];
      if (v8)
      {
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_10003802C;
        v13[3] = &unk_1000EA160;
        id v14 = (id)objc_opt_new();
        id v9 = v14;
        [v6 enumerateObjectsUsingBlock:v13];
        objc_super v10 = (NSDictionary *)[v9 copy];
        clientToRemovabilityMetadataMap = v8->_clientToRemovabilityMetadataMap;
        v8->_clientToRemovabilityMetadataMap = v10;
      }
      self = v8;
      uint64_t v7 = self;
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)mostRestrictiveRemovabilityMetadata
{
  v2 = [(IXAppRemovabilityMetadataList *)self clientToRemovabilityMetadataMap];
  if ([v2 count])
  {
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x3032000000;
    objc_super v10 = sub_100038264;
    v11 = sub_100038274;
    id v12 = 0;
    v6[0] = 0;
    v6[1] = v6;
    v6[2] = 0x2020000000;
    v6[3] = 0;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10003827C;
    v5[3] = &unk_1000EA188;
    v5[4] = &v7;
    v5[5] = v6;
    [v2 enumerateKeysAndObjectsUsingBlock:v5];
    id v3 = (id)v8[5];
    _Block_object_dispose(v6, 8);
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)updateRemovability:(unint64_t)a3 forClient:(unint64_t)a4
{
  uint64_t v7 = [(IXAppRemovabilityMetadataList *)self clientToRemovabilityMetadataMap];
  id v12 = [v7 mutableCopy];

  v8 = +[NSNumber numberWithUnsignedInteger:a4];
  if (a3 == 1)
  {
    uint64_t v9 = [v12 objectForKeyedSubscript:v8];

    if (v9) {
      [v12 removeObjectForKey:v8];
    }
  }
  else
  {
    objc_super v10 = [[IXAppRemovabilityMetadata alloc] initWithRemovability:a3 client:a4];
    [v12 setObject:v10 forKeyedSubscript:v8];
  }
  id v11 = [v12 copy];
  [(IXAppRemovabilityMetadataList *)self setClientToRemovabilityMetadataMap:v11];
}

- (void)updateRemovabilityWithMetadata:(id)a3
{
  id v9 = a3;
  id v4 = [(IXAppRemovabilityMetadataList *)self clientToRemovabilityMetadataMap];
  id v5 = [v4 mutableCopy];

  id v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 client]);
  if ([v9 removability] == (id)1)
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:v6];

    if (v7) {
      [v5 removeObjectForKey:v6];
    }
  }
  else
  {
    [v5 setObject:v9 forKeyedSubscript:v6];
  }
  id v8 = [v5 copy];
  [(IXAppRemovabilityMetadataList *)self setClientToRemovabilityMetadataMap:v8];
}

- (unint64_t)removabilityForClient:(unint64_t)a3 notFoundRemovability:(unint64_t)a4
{
  if (![(IXAppRemovabilityMetadataList *)self isEmpty])
  {
    uint64_t v7 = [(IXAppRemovabilityMetadataList *)self clientToRemovabilityMetadataMap];
    id v8 = +[NSNumber numberWithUnsignedInteger:a3];
    id v9 = [v7 objectForKeyedSubscript:v8];

    if (v9) {
      a4 = (unint64_t)[v9 removability];
    }
  }
  return a4;
}

- (BOOL)isEmpty
{
  v2 = [(IXAppRemovabilityMetadataList *)self clientToRemovabilityMetadataMap];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (id)description
{
  BOOL v3 = objc_opt_new();
  id v4 = [(IXAppRemovabilityMetadataList *)self clientToRemovabilityMetadataMap];
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  objc_super v10 = sub_1000386F8;
  id v11 = &unk_1000EA1B0;
  id v12 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:&v8];

  id v6 = +[NSString stringWithFormat:@"%@", v5, v8, v9, v10, v11];

  return v6;
}

- (NSDictionary)propertyListRepresentation
{
  BOOL v3 = objc_opt_new();
  id v4 = [(IXAppRemovabilityMetadataList *)self clientToRemovabilityMetadataMap];
  uint64_t v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = sub_100038884;
  id v12 = &unk_1000EA1B0;
  id v13 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:&v9];

  CFStringRef v14 = @"metadata";
  id v6 = objc_msgSend(v5, "copy", v9, v10, v11, v12);
  id v15 = v6;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];

  return (NSDictionary *)v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[IXAppRemovabilityMetadataList allocWithZone:a3];
  id v5 = [(IXAppRemovabilityMetadataList *)self clientToRemovabilityMetadataMap];
  id v6 = [(IXAppRemovabilityMetadataList *)v4 initWithMetadataDictionary:v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IXAppRemovabilityMetadataList *)a3;
  id v5 = v4;
  if (self == v4)
  {
    unsigned __int8 v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = [(IXAppRemovabilityMetadataList *)v5 clientToRemovabilityMetadataMap];
    uint64_t v7 = [(IXAppRemovabilityMetadataList *)self clientToRemovabilityMetadataMap];
    unsigned __int8 v8 = [v6 isEqual:v7];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(IXAppRemovabilityMetadataList *)self clientToRemovabilityMetadataMap];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(IXAppRemovabilityMetadataList *)self clientToRemovabilityMetadataMap];
  [v4 encodeObject:v5 forKey:@"clientToRemovabilityMetadataMap"];
}

- (IXAppRemovabilityMetadataList)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IXAppRemovabilityMetadataList;
  id v5 = [(IXAppRemovabilityMetadataList *)&v13 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"clientToRemovabilityMetadataMap"];
    clientToRemovabilityMetadataMap = v5->_clientToRemovabilityMetadataMap;
    v5->_clientToRemovabilityMetadataMap = (NSDictionary *)v10;
  }
  return v5;
}

- (NSDictionary)clientToRemovabilityMetadataMap
{
  return self->_clientToRemovabilityMetadataMap;
}

- (void)setClientToRemovabilityMetadataMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end