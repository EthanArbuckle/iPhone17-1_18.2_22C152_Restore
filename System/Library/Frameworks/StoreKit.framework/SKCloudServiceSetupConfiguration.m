@interface SKCloudServiceSetupConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)forPublicSDK;
- (BOOL)isEqual:(id)a3;
- (BOOL)targetsFinanceApplication;
- (NSString)applicationIdentifier;
- (NSString)applicationVersion;
- (SKCloudServiceSetupConfiguration)init;
- (SKCloudServiceSetupConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setApplicationVersion:(id)a3;
- (void)setForPublicSDK:(BOOL)a3;
- (void)setTargetsFinanceApplication:(BOOL)a3;
@end

@implementation SKCloudServiceSetupConfiguration

- (SKCloudServiceSetupConfiguration)init
{
  v7.receiver = self;
  v7.super_class = (Class)SKCloudServiceSetupConfiguration;
  v2 = [(SKCloudServiceSetupConfiguration *)&v7 init];
  v3 = v2;
  if (v2)
  {
    applicationIdentifier = v2->_applicationIdentifier;
    v2->_applicationIdentifier = (NSString *)&stru_1F08A7B80;

    applicationVersion = v3->_applicationVersion;
    v3->_applicationVersion = (NSString *)&stru_1F08A7B80;
  }
  return v3;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p", v5, self];

  if (self->_applicationIdentifier) {
    [v6 appendFormat:@"; applicationIdentifier = \"%@\"", self->_applicationIdentifier];
  }
  if (self->_applicationVersion) {
    [v6 appendFormat:@"; applicationVersion = \"%@\"", self->_applicationVersion];
  }
  if (self->_targetsFinanceApplication) {
    [v6 appendFormat:@"; targetsFinanceApplication = %@", @"YES"];
  }
  if (self->_forPublicSDK) {
    [v6 appendFormat:@"; forPublicSDK = %@", @"YES"];
  }
  [v6 appendString:@">"];

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_applicationIdentifier hash];
  return [(NSString *)self->_applicationVersion hash] ^ v3 ^ self->_targetsFinanceApplication ^ (unint64_t)self->_forPublicSDK;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SKCloudServiceSetupConfiguration *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      applicationIdentifier = self->_applicationIdentifier;
      BOOL v8 = (applicationIdentifier == v5->_applicationIdentifier
         || -[NSString isEqual:](applicationIdentifier, "isEqual:"))
        && ((applicationVersion = self->_applicationVersion, applicationVersion == v5->_applicationVersion)
         || -[NSString isEqualToString:](applicationVersion, "isEqualToString:"))
        && self->_targetsFinanceApplication == v5->_targetsFinanceApplication
        && self->_forPublicSDK == v5->_forPublicSDK;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(NSString *)self->_applicationIdentifier copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_applicationVersion copy];
  BOOL v8 = (void *)v4[3];
  v4[3] = v7;

  *((unsigned char *)v4 + 8) = self->_targetsFinanceApplication;
  *((unsigned char *)v4 + 9) = self->_forPublicSDK;
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKCloudServiceSetupConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SKCloudServiceSetupConfiguration *)self init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationIdentifier"];
    uint64_t v7 = [v6 copy];
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationVersion"];
    uint64_t v10 = [v9 copy];
    applicationVersion = v5->_applicationVersion;
    v5->_applicationVersion = (NSString *)v10;

    v5->_targetsFinanceApplication = [v4 decodeBoolForKey:@"targetsFinanceApplication"];
    v5->_forPublicSDK = [v4 decodeBoolForKey:@"forPublicSDK"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  applicationIdentifier = self->_applicationIdentifier;
  id v5 = a3;
  [v5 encodeObject:applicationIdentifier forKey:@"applicationIdentifier"];
  [v5 encodeObject:self->_applicationVersion forKey:@"applicationVersion"];
  [v5 encodeBool:self->_targetsFinanceApplication forKey:@"targetsFinanceApplication"];
  [v5 encodeBool:self->_forPublicSDK forKey:@"forPublicSDK"];
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (NSString)applicationVersion
{
  return self->_applicationVersion;
}

- (void)setApplicationVersion:(id)a3
{
}

- (BOOL)targetsFinanceApplication
{
  return self->_targetsFinanceApplication;
}

- (void)setTargetsFinanceApplication:(BOOL)a3
{
  self->_targetsFinanceApplication = a3;
}

- (BOOL)forPublicSDK
{
  return self->_forPublicSDK;
}

- (void)setForPublicSDK:(BOOL)a3
{
  self->_forPublicSDK = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationVersion, 0);

  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end