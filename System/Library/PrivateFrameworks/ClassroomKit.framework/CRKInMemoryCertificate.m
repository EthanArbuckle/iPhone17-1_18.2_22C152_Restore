@interface CRKInMemoryCertificate
+ (BOOL)supportsSecureCoding;
+ (id)certificateWithData:(id)a3;
- (BOOL)isCertificateAuthority;
- (BOOL)isTemporallyValid;
- (CRKIdentityConfiguration)configuration;
- (CRKInMemoryCertificate)initWithCoder:(id)a3;
- (CRKInMemoryCertificate)initWithConfiguration:(id)a3 validityDateInterval:(id)a4;
- (NSArray)commonNames;
- (NSData)dataRepresentation;
- (NSDateInterval)validityDateInterval;
- (NSString)fingerprint;
- (__SecCertificate)underlyingCertificate;
- (int64_t)keySizeInBits;
- (unsigned)hashingAlgorithm;
- (void)encodeWithCoder:(id)a3;
- (void)setValidityDateInterval:(id)a3;
@end

@implementation CRKInMemoryCertificate

+ (id)certificateWithData:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263F08928], "cat_unarchiveObjectOfClass:withData:", a1, a3);
}

- (CRKInMemoryCertificate)initWithConfiguration:(id)a3 validityDateInterval:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRKInMemoryCertificate;
  v8 = [(CRKInMemoryCertificate *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    configuration = v8->_configuration;
    v8->_configuration = (CRKIdentityConfiguration *)v9;

    objc_storeStrong((id *)&v8->_validityDateInterval, a4);
  }

  return v8;
}

- (NSArray)commonNames
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = [(CRKInMemoryCertificate *)self configuration];
  v3 = [v2 commonName];
  v6[0] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];

  return (NSArray *)v4;
}

- (NSString)fingerprint
{
  v2 = [(CRKInMemoryCertificate *)self configuration];
  v3 = [v2 commonName];

  return (NSString *)v3;
}

- (NSData)dataRepresentation
{
  return (NSData *)objc_msgSend(MEMORY[0x263F08910], "cat_archivedDataWithRootObject:", self);
}

- (__SecCertificate)underlyingCertificate
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"CRKInMemoryCertificate.m" lineNumber:58 description:@"Reconsider what you are trying to test"];

  return 0;
}

- (BOOL)isTemporallyValid
{
  v2 = [(CRKInMemoryCertificate *)self validityDateInterval];
  char v3 = objc_msgSend(v2, "crk_containsCurrentDate");

  return v3;
}

- (BOOL)isCertificateAuthority
{
  v2 = [(CRKInMemoryCertificate *)self configuration];
  char v3 = [v2 createsCertificateAuthority];

  return v3;
}

- (unsigned)hashingAlgorithm
{
  v2 = [(CRKInMemoryCertificate *)self configuration];
  unsigned int v3 = [v2 hashingAlgorithm];

  return v3;
}

- (int64_t)keySizeInBits
{
  v2 = [(CRKInMemoryCertificate *)self configuration];
  int64_t v3 = [v2 keySizeInBits];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CRKInMemoryCertificate *)self validityDateInterval];
  [v4 encodeObject:v5 forKey:@"validityDateInterval"];

  id v6 = [(CRKInMemoryCertificate *)self configuration];
  [v4 encodeObject:v6 forKey:@"configuration"];
}

- (CRKInMemoryCertificate)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRKInMemoryCertificate;
  v5 = [(CRKInMemoryCertificate *)&v13 init];
  if (v5)
  {
    id v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"validityDateInterval"];
    validityDateInterval = v5->_validityDateInterval;
    v5->_validityDateInterval = (NSDateInterval *)v7;

    uint64_t v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"configuration"];
    configuration = v5->_configuration;
    v5->_configuration = (CRKIdentityConfiguration *)v10;
  }
  return v5;
}

- (NSDateInterval)validityDateInterval
{
  return self->_validityDateInterval;
}

- (void)setValidityDateInterval:(id)a3
{
}

- (CRKIdentityConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_validityDateInterval, 0);
}

@end