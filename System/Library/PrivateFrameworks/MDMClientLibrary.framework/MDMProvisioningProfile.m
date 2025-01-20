@interface MDMProvisioningProfile
- (BOOL)allowsAppIDEntitlement:(id)a3;
- (BOOL)isAppleInternal;
- (BOOL)isBeta;
- (BOOL)isFreePP;
- (BOOL)isUniversalPP;
- (MDMProvisioningProfile)initWithProfile:(void *)a3;
- (NSString)allowedAppIDEntitlement;
- (NSString)uuid;
@end

@implementation MDMProvisioningProfile

- (MDMProvisioningProfile)initWithProfile:(void *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)MDMProvisioningProfile;
  v4 = [(MDMProvisioningProfile *)&v11 init];
  if (v4)
  {
    if (a3)
    {
      uint64_t v5 = [(id)MISProvisioningProfileGetUUID() copy];
      uuid = v4->_uuid;
      v4->_uuid = (NSString *)v5;

      v7 = [(id)MISProvisioningProfileGetEntitlements() valueForKey:@"application-identifier"];
      uint64_t v8 = [v7 copy];
      allowedAppIDEntitlement = v4->_allowedAppIDEntitlement;
      v4->_allowedAppIDEntitlement = (NSString *)v8;

      v4->_isAppleInternal = MISProvisioningProfileIsAppleInternalProfile() != 0;
      v4->_isBeta = MISProvisioningProfileGrantsEntitlement() != 0;
      v4->_isFreePP = MISProvisioningProfileIsForLocalProvisioning() != 0;
      v4->_isUniversalPP = MISProvisioningProfileProvisionsAllDevices() != 0;
    }
    else
    {
      NSLog(&cfstr_Mdmprovisionin.isa);
    }
  }
  return v4;
}

- (BOOL)allowsAppIDEntitlement:(id)a3
{
  id v4 = a3;
  if ([(MDMProvisioningProfile *)self isAppleInternal])
  {
    BOOL v5 = 1;
  }
  else if ([v4 length] {
         && ([(MDMProvisioningProfile *)self allowedAppIDEntitlement],
  }
             v6 = objc_claimAutoreleasedReturnValue(),
             uint64_t v7 = [v6 length],
             v6,
             v7))
  {
    uint64_t v8 = [(MDMProvisioningProfile *)self allowedAppIDEntitlement];
    int v9 = [v8 hasSuffix:@"*"];

    v10 = [(MDMProvisioningProfile *)self allowedAppIDEntitlement];
    objc_super v11 = v10;
    if (v9)
    {
      uint64_t v12 = [v10 length];
      uint64_t v13 = v12 - [@"*" length];

      v14 = [(MDMProvisioningProfile *)self allowedAppIDEntitlement];
      objc_super v11 = [v14 substringToIndex:v13];

      char v15 = [v4 hasPrefix:v11];
    }
    else
    {
      char v15 = [v4 isEqualToString:v10];
    }
    BOOL v5 = v15;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (NSString)allowedAppIDEntitlement
{
  return self->_allowedAppIDEntitlement;
}

- (BOOL)isAppleInternal
{
  return self->_isAppleInternal;
}

- (BOOL)isBeta
{
  return self->_isBeta;
}

- (BOOL)isFreePP
{
  return self->_isFreePP;
}

- (BOOL)isUniversalPP
{
  return self->_isUniversalPP;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedAppIDEntitlement, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end