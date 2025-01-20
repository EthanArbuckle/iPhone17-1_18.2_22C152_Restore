@interface ELSWhitelistEntry
- (BOOL)requiresFollowup;
- (BOOL)retry;
- (ELSWhitelistEntry)initWithBundleIdentifier:(id)a3 parameterName:(id)a4 baseLocalizationKey:(id)a5 needsWAPIKeys:(BOOL)a6 requiresFollowup:(BOOL)a7 retry:(BOOL)a8 platforms:(id)a9;
- (ELSWhitelistEntry)initWithBundleIdentifier:(id)a3 parameterName:(id)a4 displayNameLocalizationKey:(id)a5 descriptionLocalizationKey:(id)a6 sensitiveInformationLocalizationKey:(id)a7 needsWAPIKeys:(BOOL)a8 requiresFollowup:(BOOL)a9 retry:(BOOL)a10 platforms:(id)a11;
- (NSArray)platformAvailability;
- (NSString)bundleIdentifier;
- (NSString)descriptionLocalizationKey;
- (NSString)displayNameLocalizationKey;
- (NSString)parameterName;
- (NSString)sensitiveInformationLocalizationKey;
- (void)setBundleIdentifier:(id)a3;
- (void)setDescriptionLocalizationKey:(id)a3;
- (void)setDisplayNameLocalizationKey:(id)a3;
- (void)setParameterName:(id)a3;
@end

@implementation ELSWhitelistEntry

- (ELSWhitelistEntry)initWithBundleIdentifier:(id)a3 parameterName:(id)a4 baseLocalizationKey:(id)a5 needsWAPIKeys:(BOOL)a6 requiresFollowup:(BOOL)a7 retry:(BOOL)a8 platforms:(id)a9
{
  BOOL v11 = a6;
  v16 = NSString;
  id v17 = a9;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  v21 = [v16 stringWithFormat:@"%@_DESCRIPTION", v18];
  v22 = [NSString stringWithFormat:@"%@_SENSITIVE_INFORMATION", v18];
  BYTE1(v25) = a8;
  LOBYTE(v25) = a7;
  v23 = -[ELSWhitelistEntry initWithBundleIdentifier:parameterName:displayNameLocalizationKey:descriptionLocalizationKey:sensitiveInformationLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:](self, "initWithBundleIdentifier:parameterName:displayNameLocalizationKey:descriptionLocalizationKey:sensitiveInformationLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:", v20, v19, v18, v21, v22, v11, v25, v17);

  return v23;
}

- (ELSWhitelistEntry)initWithBundleIdentifier:(id)a3 parameterName:(id)a4 displayNameLocalizationKey:(id)a5 descriptionLocalizationKey:(id)a6 sensitiveInformationLocalizationKey:(id)a7 needsWAPIKeys:(BOOL)a8 requiresFollowup:(BOOL)a9 retry:(BOOL)a10 platforms:(id)a11
{
  BOOL v11 = a8;
  id v31 = a3;
  id v30 = a4;
  id v32 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a11;
  v33.receiver = self;
  v33.super_class = (Class)ELSWhitelistEntry;
  v21 = [(ELSWhitelistEntry *)&v33 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_bundleIdentifier, a3);
    objc_storeStrong((id *)&v22->_parameterName, a4);
    objc_storeStrong((id *)&v22->_platformAvailability, a11);
    if (v11 && MGGetBoolAnswer())
    {
      uint64_t v23 = [v32 stringByAppendingString:@"_WAPI"];
      displayNameLocalizationKey = v22->_displayNameLocalizationKey;
      v22->_displayNameLocalizationKey = (NSString *)v23;

      uint64_t v25 = [v18 stringByAppendingString:@"_WAPI"];
      descriptionLocalizationKey = v22->_descriptionLocalizationKey;
      v22->_descriptionLocalizationKey = (NSString *)v25;

      v27 = [v19 stringByAppendingString:@"_WAPI"];
    }
    else
    {
      objc_storeStrong((id *)&v22->_displayNameLocalizationKey, a5);
      objc_storeStrong((id *)&v22->_descriptionLocalizationKey, a6);
      v27 = (NSString *)v19;
    }
    sensitiveInformationLocalizationKey = v22->_sensitiveInformationLocalizationKey;
    v22->_sensitiveInformationLocalizationKey = v27;

    v22->_requiresFollowup = a9;
    v22->_retry = a10;
  }

  return v22;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)parameterName
{
  return self->_parameterName;
}

- (void)setParameterName:(id)a3
{
}

- (NSString)displayNameLocalizationKey
{
  return self->_displayNameLocalizationKey;
}

- (void)setDisplayNameLocalizationKey:(id)a3
{
}

- (NSString)descriptionLocalizationKey
{
  return self->_descriptionLocalizationKey;
}

- (void)setDescriptionLocalizationKey:(id)a3
{
}

- (NSString)sensitiveInformationLocalizationKey
{
  return self->_sensitiveInformationLocalizationKey;
}

- (NSArray)platformAvailability
{
  return self->_platformAvailability;
}

- (BOOL)requiresFollowup
{
  return self->_requiresFollowup;
}

- (BOOL)retry
{
  return self->_retry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platformAvailability, 0);
  objc_storeStrong((id *)&self->_sensitiveInformationLocalizationKey, 0);
  objc_storeStrong((id *)&self->_descriptionLocalizationKey, 0);
  objc_storeStrong((id *)&self->_displayNameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_parameterName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end