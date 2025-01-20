@interface DMFInstallAppRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (id)permittedPlatforms;
- (BOOL)allowFreePurchases;
- (DMFInstallAppRequest)initWithCoder:(id)a3;
- (unint64_t)licenseType;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowFreePurchases:(BOOL)a3;
- (void)setLicenseType:(unint64_t)a3;
@end

@implementation DMFInstallAppRequest

+ (id)permittedPlatforms
{
  return &unk_1F18AB8C8;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFInstallAppRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMFInstallAppRequest;
  v5 = [(DMFAppRequest *)&v9 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"licenseType"];
    v5->_licenseType = [v6 integerValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allowFreePurchases"];
    v5->_allowFreePurchases = [v7 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DMFInstallAppRequest;
  id v4 = a3;
  [(DMFAppRequest *)&v7 encodeWithCoder:v4];
  v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[DMFInstallAppRequest licenseType](self, "licenseType", v7.receiver, v7.super_class));
  [v4 encodeObject:v5 forKey:@"licenseType"];

  v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[DMFInstallAppRequest allowFreePurchases](self, "allowFreePurchases"));
  [v4 encodeObject:v6 forKey:@"allowFreePurchases"];
}

- (unint64_t)licenseType
{
  return self->_licenseType;
}

- (void)setLicenseType:(unint64_t)a3
{
  self->_licenseType = a3;
}

- (BOOL)allowFreePurchases
{
  return self->_allowFreePurchases;
}

- (void)setAllowFreePurchases:(BOOL)a3
{
  self->_allowFreePurchases = a3;
}

@end