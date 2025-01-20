@interface FBSApplicationProvisioningProfile
- (BOOL)allowsApplicationIdentifierEntitlement:(id)a3;
- (BOOL)isAppleInternalProfile;
- (BOOL)isBeta;
- (BOOL)isFreeDeveloperProfile;
- (BOOL)provisionsAllDevices;
- (FBSApplicationProvisioningProfile)initWithSignerIdentity:(id)a3 profile:(id)a4;
- (NSDate)expirationDate;
- (NSString)UUID;
- (NSString)signerIdentity;
- (id)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
@end

@implementation FBSApplicationProvisioningProfile

- (FBSApplicationProvisioningProfile)initWithSignerIdentity:(id)a3 profile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)FBSApplicationProvisioningProfile;
  v8 = [(FBSApplicationProvisioningProfile *)&v22 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    signerIdentity = v8->_signerIdentity;
    v8->_signerIdentity = (NSString *)v9;

    uint64_t v11 = soft_MISProvisioningProfileGetExpirationDate((uint64_t)v7);
    expirationDate = v8->_expirationDate;
    v8->_expirationDate = (NSDate *)v11;

    v13 = [(id)soft_MISProvisioningProfileGetEntitlements((uint64_t)v7) valueForKey:@"application-identifier"];
    uint64_t v14 = [v13 copy];
    allowedApplicationIdentifierEntitlement = v8->_allowedApplicationIdentifierEntitlement;
    v8->_allowedApplicationIdentifierEntitlement = (NSString *)v14;

    v8->_appleInternalProfile = soft_MISProvisioningProfileIsAppleInternalProfile((uint64_t)v7) != 0;
    v8->_beta = soft_MISProvisioningProfileGrantsEntitlement((uint64_t)v7, @"beta-reports-active", *MEMORY[0x1E4F1CFD0]) != 0;
    CFBooleanRef Value = (const __CFBoolean *)soft_MISProfileGetValue((uint64_t)v7, @"LocalProvision");
    if (Value)
    {
      CFBooleanRef v17 = Value;
      CFTypeID v18 = CFGetTypeID(Value);
      if (v18 == CFBooleanGetTypeID()) {
        v8->_freeDeveloperProfile = CFBooleanGetValue(v17) != 0;
      }
    }
    v8->_provisionsAllDevices = soft_MISProvisioningProfileProvisionsAllDevices((uint64_t)v7) != 0;
    uint64_t v19 = [(id)soft_MISProvisioningProfileGetUUID((uint64_t)v7) copy];
    UUID = v8->_UUID;
    v8->_UUID = (NSString *)v19;
  }
  return v8;
}

- (BOOL)allowsApplicationIdentifierEntitlement:(id)a3
{
  id v4 = a3;
  if ([(FBSApplicationProvisioningProfile *)self isAppleInternalProfile])
  {
    char v5 = 1;
  }
  else if ([v4 length] && -[NSString length](self->_allowedApplicationIdentifierEntitlement, "length"))
  {
    if ([(NSString *)self->_allowedApplicationIdentifierEntitlement hasSuffix:@"*"])
    {
      id v6 = -[NSString substringToIndex:](self->_allowedApplicationIdentifierEntitlement, "substringToIndex:", -[NSString length](self->_allowedApplicationIdentifierEntitlement, "length")- [@"*" length]);
      char v5 = [v4 hasPrefix:v6];
    }
    else
    {
      char v5 = [v4 isEqualToString:self->_allowedApplicationIdentifierEntitlement];
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)description
{
  return [(FBSApplicationProvisioningProfile *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(FBSApplicationProvisioningProfile *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[off_1E58F44F0 builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(FBSApplicationProvisioningProfile *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(FBSApplicationProvisioningProfile *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendObject:self->_signerIdentity withName:@"signerIdentity"];
  id v6 = [MEMORY[0x1E4F28C10] localizedStringFromDate:self->_expirationDate dateStyle:3 timeStyle:3];
  id v7 = (id)[v4 appendObject:v6 withName:@"expirationDate" skipIfNil:1];

  return v4;
}

- (NSString)signerIdentity
{
  return self->_signerIdentity;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (BOOL)isAppleInternalProfile
{
  return self->_appleInternalProfile;
}

- (BOOL)isBeta
{
  return self->_beta;
}

- (BOOL)isFreeDeveloperProfile
{
  return self->_freeDeveloperProfile;
}

- (BOOL)provisionsAllDevices
{
  return self->_provisionsAllDevices;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_signerIdentity, 0);

  objc_storeStrong((id *)&self->_allowedApplicationIdentifierEntitlement, 0);
}

@end