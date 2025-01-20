@interface ENAccountIdentity
+ (BOOL)supportsSecureCoding;
- (ENAccountIdentity)initWithAccountKey:(id)a3 deviceKey:(id)a4;
- (ENAccountIdentity)initWithCoder:(id)a3;
- (ENAccountKey)accountKey;
- (ENDeviceKey)deviceKey;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountKey:(id)a3;
- (void)setDeviceKey:(id)a3;
@end

@implementation ENAccountIdentity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ENAccountIdentity)initWithAccountKey:(id)a3 deviceKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ENAccountIdentity;
  v9 = [(ENAccountIdentity *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountKey, a3);
    objc_storeStrong((id *)&v10->_deviceKey, a4);
  }

  return v10;
}

- (ENAccountIdentity)initWithCoder:(id)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ENAccountIdentity *)self accountKey];
  [v4 encodeObject:v5 forKey:@"kENPersonalIdentityAccountKey"];

  id v6 = [(ENAccountIdentity *)self deviceKey];
  [v4 encodeObject:v6 forKey:@"kENPersonalIdentityDeviceKey"];
}

- (ENAccountKey)accountKey
{
  return self->_accountKey;
}

- (void)setAccountKey:(id)a3
{
}

- (ENDeviceKey)deviceKey
{
  return self->_deviceKey;
}

- (void)setDeviceKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceKey, 0);
  objc_storeStrong((id *)&self->_accountKey, 0);
}

@end