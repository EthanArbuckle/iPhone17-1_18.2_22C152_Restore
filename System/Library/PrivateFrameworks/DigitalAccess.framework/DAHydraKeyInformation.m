@interface DAHydraKeyInformation
+ (BOOL)supportsSecureCoding;
+ (id)withEndpoint:(id)a3;
- (DAHydraKeyInformation)initWithCoder:(id)a3;
- (NSArray)certificateChain;
- (NSData)appletIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DAHydraKeyInformation

+ (id)withEndpoint:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  uint64_t v5 = [v3 certificates];
  v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [v3 appletIdentifier];

  v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  certificateChain = self->_certificateChain;
  id v5 = a3;
  [v5 encodeObject:certificateChain forKey:@"certificateChain"];
  [v5 encodeObject:self->_appletIdentifier forKey:@"appletIdentifier"];
}

- (DAHydraKeyInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DAHydraKeyInformation;
  id v5 = [(DAHydraKeyInformation *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"certificateChain"];
    certificateChain = v5->_certificateChain;
    v5->_certificateChain = (NSArray *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appletIdentifier"];
    appletIdentifier = v5->_appletIdentifier;
    v5->_appletIdentifier = (NSData *)v8;
  }
  return v5;
}

- (NSArray)certificateChain
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)appletIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appletIdentifier, 0);

  objc_storeStrong((id *)&self->_certificateChain, 0);
}

@end