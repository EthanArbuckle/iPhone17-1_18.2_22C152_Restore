@interface CTTransportKeysReceipt
+ (BOOL)supportsSecureCoding;
- (CTTransportKeysReceipt)initWith:(id)a3;
- (CTTransportKeysReceipt)initWith:(id)a3 sps:(id)a4;
- (CTTransportKeysReceipt)initWithCoder:(id)a3;
- (NSArray)stks;
- (NSString)sps_environment;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setSps_environment:(id)a3;
- (void)setStks:(id)a3;
@end

@implementation CTTransportKeysReceipt

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTTransportKeysReceipt *)self stks];
  [v3 appendFormat:@", stks=%@", v4];

  v5 = [(CTTransportKeysReceipt *)self sps_environment];
  [v3 appendFormat:@", env=%@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (CTTransportKeysReceipt)initWith:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CTTransportKeysReceipt;
  v5 = [(CTTransportKeysReceipt *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(CTTransportKeysReceipt *)v5 setStks:v4];
    [(CTTransportKeysReceipt *)v6 setSps_environment:0];
  }

  return v6;
}

- (CTTransportKeysReceipt)initWith:(id)a3 sps:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CTTransportKeysReceipt;
  objc_super v8 = [(CTTransportKeysReceipt *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(CTTransportKeysReceipt *)v8 setStks:v6];
    [(CTTransportKeysReceipt *)v9 setSps_environment:v7];
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(CTTransportKeysReceipt *)self stks];
  id v6 = (void *)[v5 copy];
  [v4 setStks:v6];

  id v7 = [(CTTransportKeysReceipt *)self sps_environment];
  objc_super v8 = (void *)[v7 copy];
  objc_msgSend(v4, "setSps_environment:", v8);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CTTransportKeysReceipt *)self stks];
  [v4 encodeObject:v5 forKey:@"tkey_value"];

  id v6 = [(CTTransportKeysReceipt *)self sps_environment];
  [v4 encodeObject:v6 forKey:@"sps_environment"];
}

- (CTTransportKeysReceipt)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CTTransportKeysReceipt;
  v5 = [(CTTransportKeysReceipt *)&v14 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    objc_super v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"tkey_value"];
    stks = v5->_stks;
    v5->_stks = (NSArray *)v9;

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

- (NSArray)stks
{
  return self->_stks;
}

- (void)setStks:(id)a3
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

  objc_storeStrong((id *)&self->_stks, 0);
}

@end