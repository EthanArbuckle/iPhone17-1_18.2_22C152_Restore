@interface AKPrivateEmail
+ (BOOL)supportsSecureCoding;
- (AKPrivateEmail)initWithAddress:(id)a3 forKey:(id)a4;
- (AKPrivateEmail)initWithAddress:(id)a3 forKey:(id)a4 withBundleId:(id)a5;
- (AKPrivateEmail)initWithCoder:(id)a3;
- (NSString)clientAppBundleId;
- (NSString)key;
- (NSString)privateEmailAddress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AKPrivateEmail

- (AKPrivateEmail)initWithAddress:(id)a3 forKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AKPrivateEmail;
  v9 = [(AKPrivateEmail *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_privateEmailAddress, a3);
    objc_storeStrong((id *)&v10->_key, a4);
  }

  return v10;
}

- (AKPrivateEmail)initWithAddress:(id)a3 forKey:(id)a4 withBundleId:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AKPrivateEmail;
  objc_super v12 = [(AKPrivateEmail *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_privateEmailAddress, a3);
    objc_storeStrong((id *)&v13->_key, a4);
    objc_storeStrong((id *)&v13->_clientAppBundleId, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  key = self->_key;
  id v5 = a3;
  [v5 encodeObject:key forKey:@"clientKey"];
  [v5 encodeObject:self->_privateEmailAddress forKey:@"privateEmailAddress"];
  [v5 encodeObject:self->_clientAppBundleId forKey:@"privateEmailClientBundle"];
}

- (AKPrivateEmail)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AKPrivateEmail *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"privateEmailAddress"];
    privateEmailAddress = v5->_privateEmailAddress;
    v5->_privateEmailAddress = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientKey"];
    key = v5->_key;
    v5->_key = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"privateEmailClientBundle"];
    clientAppBundleId = v5->_clientAppBundleId;
    v5->_clientAppBundleId = (NSString *)v10;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(AKPrivateEmail);
  uint64_t v5 = [(NSString *)self->_privateEmailAddress copy];
  privateEmailAddress = v4->_privateEmailAddress;
  v4->_privateEmailAddress = (NSString *)v5;

  uint64_t v7 = [(NSString *)self->_key copy];
  key = v4->_key;
  v4->_key = (NSString *)v7;

  uint64_t v9 = [(NSString *)self->_clientAppBundleId copy];
  clientAppBundleId = v4->_clientAppBundleId;
  v4->_clientAppBundleId = (NSString *)v9;

  return v4;
}

- (id)description
{
  clientAppBundleId = self->_clientAppBundleId;
  id v4 = NSString;
  uint64_t v5 = [(AKPrivateEmail *)self key];
  uint64_t v6 = [(AKPrivateEmail *)self privateEmailAddress];
  uint64_t v7 = (void *)v6;
  if (clientAppBundleId)
  {
    uint64_t v8 = [(AKPrivateEmail *)self clientAppBundleId];
    uint64_t v9 = [v4 stringWithFormat:@"<PrivateEmail: {%@} -> {%@} [%@]>", v5, v7, v8];
  }
  else
  {
    uint64_t v9 = [v4 stringWithFormat:@"<PrivateEmail: {%@} -> {%@}>", v5, v6];
  }

  return v9;
}

- (NSString)key
{
  return self->_key;
}

- (NSString)clientAppBundleId
{
  return self->_clientAppBundleId;
}

- (NSString)privateEmailAddress
{
  return self->_privateEmailAddress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateEmailAddress, 0);
  objc_storeStrong((id *)&self->_clientAppBundleId, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

@end