@interface CTTransportKeysUpdate
+ (BOOL)supportsSecureCoding;
- (CTTransportKeysUpdate)initWith:(id)a3;
- (CTTransportKeysUpdate)initWith:(id)a3 sps:(id)a4;
- (CTTransportKeysUpdate)initWithCoder:(id)a3;
- (NSArray)keys;
- (NSString)sps_environment;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setKeys:(id)a3;
- (void)setSps_environment:(id)a3;
@end

@implementation CTTransportKeysUpdate

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTTransportKeysUpdate *)self keys];
  [v3 appendFormat:@", keys=%@", v4];

  v5 = [(CTTransportKeysUpdate *)self sps_environment];
  [v3 appendFormat:@", env=%@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (CTTransportKeysUpdate)initWith:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CTTransportKeysUpdate;
  v5 = [(CTTransportKeysUpdate *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(CTTransportKeysUpdate *)v5 setKeys:v4];
    [(CTTransportKeysUpdate *)v6 setSps_environment:0];
  }

  return v6;
}

- (CTTransportKeysUpdate)initWith:(id)a3 sps:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CTTransportKeysUpdate;
  objc_super v8 = [(CTTransportKeysUpdate *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(CTTransportKeysUpdate *)v8 setKeys:v6];
    [(CTTransportKeysUpdate *)v9 setSps_environment:v7];
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(CTTransportKeysUpdate *)self keys];
  id v6 = (void *)[v5 copy];
  [v4 setKeys:v6];

  id v7 = [(CTTransportKeysUpdate *)self sps_environment];
  objc_super v8 = (void *)[v7 copy];
  objc_msgSend(v4, "setSps_environment:", v8);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CTTransportKeysUpdate *)self keys];
  [v4 encodeObject:v5 forKey:@"tkey_value"];

  id v6 = [(CTTransportKeysUpdate *)self sps_environment];
  [v4 encodeObject:v6 forKey:@"sps_environment"];
}

- (CTTransportKeysUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CTTransportKeysUpdate;
  v5 = [(CTTransportKeysUpdate *)&v14 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    objc_super v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"tkey_value"];
    keys = v5->_keys;
    v5->_keys = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sps_environment"];
    sps_environment = v5->_sps_environment;
    v5->_sps_environment = (NSString *)v11;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)keys
{
  return self->_keys;
}

- (void)setKeys:(id)a3
{
}

- (NSString)sps_environment
{
  return self->_sps_environment;
}

- (void)setSps_environment:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sps_environment, 0);

  objc_storeStrong((id *)&self->_keys, 0);
}

@end