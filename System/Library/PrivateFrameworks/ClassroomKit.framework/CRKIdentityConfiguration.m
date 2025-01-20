@interface CRKIdentityConfiguration
+ (BOOL)defaultCreatesCertificateAuthority;
+ (BOOL)supportsSecureCoding;
+ (CRKIdentityConfiguration)configurationWithData:(id)a3;
+ (int64_t)defaultKeySizeInBits;
+ (unsigned)defaultHashingAlgorithm;
- (BOOL)addsClientAuthAndServerAuthEKUs;
- (BOOL)createsCertificateAuthority;
- (CRKIdentityConfiguration)init;
- (CRKIdentityConfiguration)initWithCoder:(id)a3;
- (CRKIdentityConfiguration)initWithCommonName:(id)a3;
- (NSData)dataRepresentation;
- (NSString)commonName;
- (NSString)emailAddress;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)keySizeInBits;
- (unsigned)hashingAlgorithm;
- (void)encodeWithCoder:(id)a3;
- (void)setAddsClientAuthAndServerAuthEKUs:(BOOL)a3;
- (void)setCreatesCertificateAuthority:(BOOL)a3;
- (void)setEmailAddress:(id)a3;
- (void)setHashingAlgorithm:(unsigned int)a3;
- (void)setKeySizeInBits:(int64_t)a3;
@end

@implementation CRKIdentityConfiguration

+ (CRKIdentityConfiguration)configurationWithData:(id)a3
{
  return (CRKIdentityConfiguration *)objc_msgSend(MEMORY[0x263F08928], "cat_unarchiveObjectOfClass:withData:", a1, a3);
}

- (CRKIdentityConfiguration)init
{
  v3 = [MEMORY[0x263F08C38] UUID];
  v4 = [v3 UUIDString];
  v5 = [(CRKIdentityConfiguration *)self initWithCommonName:v4];

  return v5;
}

- (CRKIdentityConfiguration)initWithCommonName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKIdentityConfiguration;
  v5 = [(CRKIdentityConfiguration *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    commonName = v5->_commonName;
    v5->_commonName = (NSString *)v6;

    v5->_keySizeInBits = [(id)objc_opt_class() defaultKeySizeInBits];
    v5->_createsCertificateAuthority = [(id)objc_opt_class() defaultCreatesCertificateAuthority];
    v5->_hashingAlgorithm = [(id)objc_opt_class() defaultHashingAlgorithm];
    v5->_addsClientAuthAndServerAuthEKUs = 1;
  }

  return v5;
}

- (NSData)dataRepresentation
{
  return (NSData *)objc_msgSend(MEMORY[0x263F08910], "cat_archivedDataWithRootObject:", self);
}

- (NSString)emailAddress
{
  emailAddress = self->_emailAddress;
  if (emailAddress)
  {
    v3 = emailAddress;
  }
  else
  {
    v3 = [(CRKIdentityConfiguration *)self commonName];
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_class();
  v5 = [(CRKIdentityConfiguration *)self dataRepresentation];
  uint64_t v6 = [v4 configurationWithData:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  id v4 = [(CRKIdentityConfiguration *)self commonName];
  [v9 encodeObject:v4 forKey:@"commonName"];

  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[CRKIdentityConfiguration keySizeInBits](self, "keySizeInBits"));
  [v9 encodeObject:v5 forKey:@"keySizeInBits"];

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKIdentityConfiguration createsCertificateAuthority](self, "createsCertificateAuthority"));
  [v9 encodeObject:v6 forKey:@"createsCertificateAuthority"];

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CRKIdentityConfiguration hashingAlgorithm](self, "hashingAlgorithm"));
  [v9 encodeObject:v7 forKey:@"hashingAlgorithm"];

  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKIdentityConfiguration addsClientAuthAndServerAuthEKUs](self, "addsClientAuthAndServerAuthEKUs"));
  [v9 encodeObject:v8 forKey:@"addsClientAuthAndServerAuthEKUs"];

  [v9 encodeObject:self->_emailAddress forKey:@"emailAddress"];
}

- (CRKIdentityConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CRKIdentityConfiguration;
  v5 = [(CRKIdentityConfiguration *)&v17 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"commonName"];
    commonName = v5->_commonName;
    v5->_commonName = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keySizeInBits"];
    v5->_keySizeInBits = [v9 integerValue];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"createsCertificateAuthority"];
    v5->_createsCertificateAuthority = [v10 BOOLValue];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hashingAlgorithm"];
    v5->_hashingAlgorithm = [v11 integerValue];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"addsClientAuthAndServerAuthEKUs"];
    v5->_addsClientAuthAndServerAuthEKUs = [v12 BOOLValue];

    v13 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"emailAddress"];
    emailAddress = v5->_emailAddress;
    v5->_emailAddress = (NSString *)v14;
  }
  return v5;
}

+ (int64_t)defaultKeySizeInBits
{
  return 2048;
}

+ (unsigned)defaultHashingAlgorithm
{
  return 6;
}

+ (BOOL)defaultCreatesCertificateAuthority
{
  return 0;
}

- (NSString)commonName
{
  return self->_commonName;
}

- (int64_t)keySizeInBits
{
  return self->_keySizeInBits;
}

- (void)setKeySizeInBits:(int64_t)a3
{
  self->_keySizeInBits = a3;
}

- (BOOL)createsCertificateAuthority
{
  return self->_createsCertificateAuthority;
}

- (void)setCreatesCertificateAuthority:(BOOL)a3
{
  self->_createsCertificateAuthority = a3;
}

- (unsigned)hashingAlgorithm
{
  return self->_hashingAlgorithm;
}

- (void)setHashingAlgorithm:(unsigned int)a3
{
  self->_hashingAlgorithm = a3;
}

- (BOOL)addsClientAuthAndServerAuthEKUs
{
  return self->_addsClientAuthAndServerAuthEKUs;
}

- (void)setAddsClientAuthAndServerAuthEKUs:(BOOL)a3
{
  self->_addsClientAuthAndServerAuthEKUs = a3;
}

- (void)setEmailAddress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emailAddress, 0);

  objc_storeStrong((id *)&self->_commonName, 0);
}

@end