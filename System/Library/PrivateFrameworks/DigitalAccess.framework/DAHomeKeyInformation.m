@interface DAHomeKeyInformation
+ (BOOL)supportsSecureCoding;
+ (id)withEndpoint:(id)a3;
- (DAHomeKeyInformation)initWithCoder:(id)a3;
- (NSData)appletIdentifier;
- (NSData)publicKey;
- (NSData)readerIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DAHomeKeyInformation

+ (id)withEndpoint:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  uint64_t v5 = [v3 appletIdentifier];
  v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [v3 publicKey];
  v8 = (void *)v4[2];
  v4[2] = v7;

  uint64_t v9 = [v3 readerIdentifier];

  v10 = (void *)v4[3];
  v4[3] = v9;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  appletIdentifier = self->_appletIdentifier;
  id v5 = a3;
  [v5 encodeObject:appletIdentifier forKey:@"appletIdentifier"];
  [v5 encodeObject:self->_publicKey forKey:@"publicKey"];
  [v5 encodeObject:self->_readerIdentifier forKey:@"readerIdentifier"];
}

- (DAHomeKeyInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DAHomeKeyInformation;
  id v5 = [(DAHomeKeyInformation *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appletIdentifier"];
    appletIdentifier = v5->_appletIdentifier;
    v5->_appletIdentifier = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publicKey"];
    publicKey = v5->_publicKey;
    v5->_publicKey = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"readerIdentifier"];
    readerIdentifier = v5->_readerIdentifier;
    v5->_readerIdentifier = (NSData *)v10;
  }
  return v5;
}

- (NSData)appletIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)publicKey
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)readerIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readerIdentifier, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);

  objc_storeStrong((id *)&self->_appletIdentifier, 0);
}

@end