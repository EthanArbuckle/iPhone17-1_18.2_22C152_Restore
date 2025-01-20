@interface DMTNetworkCredential
+ (BOOL)supportsSecureCoding;
+ (id)credentialWithNetworkName:(id)a3 credential:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCredential:(id)a3;
- (DMTNetworkCredential)initWithCoder:(id)a3;
- (DMTNetworkCredential)initWithNetworkName:(id)a3 credential:(id)a4;
- (NSString)credential;
- (NSString)networkName;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DMTNetworkCredential

- (DMTNetworkCredential)initWithNetworkName:(id)a3 credential:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DMTNetworkCredential;
  v8 = [(DMTNetworkCredential *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    networkName = v8->_networkName;
    v8->_networkName = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    credential = v8->_credential;
    v8->_credential = (NSString *)v11;
  }
  return v8;
}

+ (id)credentialWithNetworkName:(id)a3 credential:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithNetworkName:v7 credential:v6];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DMTNetworkCredential *)self networkName];
  [v4 encodeObject:v5 forKey:@"networkName"];

  id v6 = [(DMTNetworkCredential *)self credential];
  [v4 encodeObject:v6 forKey:@"credential"];
}

- (DMTNetworkCredential)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DMTNetworkCredential;
  v5 = [(DMTNetworkCredential *)&v13 init];
  if (v5)
  {
    id v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"networkName"];
    networkName = v5->_networkName;
    v5->_networkName = (NSString *)v7;

    uint64_t v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"credential"];
    credential = v5->_credential;
    v5->_credential = (NSString *)v10;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DMTNetworkCredential *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    BOOL v6 = 0;
    if (v4 && (isKindOfClass & 1) != 0) {
      BOOL v6 = [(DMTNetworkCredential *)self isEqualToCredential:v4];
    }
  }

  return v6;
}

- (unint64_t)hash
{
  v3 = [(DMTNetworkCredential *)self networkName];
  uint64_t v4 = [v3 hash];
  v5 = [(DMTNetworkCredential *)self credential];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [DMTNetworkCredential alloc];
  v5 = [(DMTNetworkCredential *)self networkName];
  unint64_t v6 = (void *)[v5 copy];
  uint64_t v7 = [(DMTNetworkCredential *)self credential];
  v8 = (void *)[v7 copy];
  uint64_t v9 = [(DMTNetworkCredential *)v4 initWithNetworkName:v6 credential:v8];

  return v9;
}

- (BOOL)isEqualToCredential:(id)a3
{
  id v4 = a3;
  v5 = [(DMTNetworkCredential *)self networkName];
  unint64_t v6 = [v4 networkName];
  if ([v5 isEqualToString:v6])
  {
    uint64_t v7 = [(DMTNetworkCredential *)self credential];
    v8 = [v4 credential];
    char v9 = [v7 isEqualToString:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (NSString)networkName
{
  return self->_networkName;
}

- (NSString)credential
{
  return self->_credential;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_networkName, 0);
}

@end