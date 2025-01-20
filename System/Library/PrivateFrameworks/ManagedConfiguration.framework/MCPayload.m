@interface MCPayload
+ (id)_allKnownPayloadClasses;
+ (id)_installablePhoneConfigurationPayloadClasses;
+ (id)_installableTVConfigurationPayloadClasses;
+ (id)_installableVisionConfigurationPayloadClasses;
+ (id)_minimumWatchVersionRequirementsForPayloads;
+ (id)_platformSpecificConfigurationPayloadClasses;
+ (id)_sharedHomePodPayloadClasses;
+ (id)_sharedWatchPayloadClasses;
+ (id)accountPayloads;
+ (id)availablePayloadsForUserEnrollment;
+ (id)badFieldTypeErrorWithField:(id)a3;
+ (id)badFieldValueErrorWithField:(id)a3;
+ (id)badFieldValueErrorWithField:(id)a3 underlyingError:(id)a4;
+ (id)cellularRequiredPayloads;
+ (id)conflictingFieldValueErrorWithUnderlyingError:(id)a3;
+ (id)hrnRequiredPayloads;
+ (id)installableHomePodConfigurationPayloadClasses;
+ (id)installableWatchConfigurationPayloadClasses;
+ (id)localizedDescriptionForPayloadCount:(unint64_t)a3;
+ (id)localizedParenthesizedFormDescriptionForPayloadCount:(unint64_t)a3;
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)mdmAdoptablePayloads;
+ (id)missingFieldErrorWithField:(id)a3 underlyingError:(id)a4;
+ (id)payloadFromDictionary:(id)a3 isStub:(BOOL)a4 profile:(id)a5 outError:(id *)a6;
+ (id)payloadsFromArray:(id)a3 isStub:(BOOL)a4 profile:(id)a5 outError:(id *)a6;
+ (id)payloadsRequiringRatchetWithStolenDeviceProtection;
+ (id)remoteQueueableHomePodPayloadClasses;
+ (id)remoteQueueableWatchPayloadClasses;
+ (id)supervisedRequiredPayloads;
+ (id)typeStrings;
+ (id)unavailablePayloadsInEphemeralMultiUser;
+ (id)unavailableSystemPayloadsInEphemeralMultiUser;
+ (id)unavailableUserPayloadsInEphemeralMultiUser;
+ (id)wrapperPayloadDictionary;
- (BOOL)containsSensitiveUserInformation;
- (BOOL)isSupportedByWatchVersions:(id)a3;
- (BOOL)mustInstallNonInteractively;
- (MCPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (MCProfile)profile;
- (NSArray)installationWarnings;
- (NSDictionary)restrictions;
- (NSString)UUID;
- (NSString)displayName;
- (NSString)friendlyName;
- (NSString)identifier;
- (NSString)organization;
- (NSString)payloadDescription;
- (NSString)persistentResourceID;
- (NSString)type;
- (id)description;
- (id)filterForUserEnrollmentOutError:(id *)a3;
- (id)malformedPayloadErrorWithError:(id)a3;
- (id)payloadDescriptionKeyValueSections;
- (id)serializedDictionary;
- (id)stubDictionary;
- (id)subtitle1Description;
- (id)subtitle1Label;
- (id)subtitle2Description;
- (id)subtitle2Label;
- (int64_t)version;
- (void)setDisplayName:(id)a3;
- (void)setMustInstallNonInteractively:(BOOL)a3;
- (void)setPersistentResourceID:(id)a3;
@end

@implementation MCPayload

+ (id)_sharedHomePodPayloadClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
}

+ (id)installableHomePodConfigurationPayloadClasses
{
  v2 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v3 = [a1 _sharedHomePodPayloadClasses];
  uint64_t v4 = [v2 setWithSet:v3];

  [v4 addObject:objc_opt_class()];
  [v4 addObject:objc_opt_class()];
  [v4 addObject:objc_opt_class()];
  return v4;
}

+ (id)remoteQueueableHomePodPayloadClasses
{
  v2 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v3 = [a1 _sharedHomePodPayloadClasses];
  uint64_t v4 = [v2 setWithSet:v3];

  [v4 addObject:objc_opt_class()];
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"AcceptProfileServicePayloadOnHomePod", (CFStringRef)*MEMORY[0x1E4F1D3B8], &keyExistsAndHasValidFormat);
  if ((MCGestaltIsInternalBuild() & 1) != 0
    || (AppBooleanValue ? (BOOL v6 = keyExistsAndHasValidFormat == 0) : (BOOL v6 = 1), !v6))
  {
    [v4 addObject:objc_opt_class()];
  }
  return v4;
}

+ (id)_sharedWatchPayloadClasses
{
  v21 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v20 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  return (id)objc_msgSend(v21, "setWithObjects:", v20, v19, v18, v17, v16, v15, v14, v13, v2, v3, v4, v5, v6, v7, v8, v9, v10,
               v11,
               objc_opt_class(),
               0);
}

+ (id)installableWatchConfigurationPayloadClasses
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v3 = [a1 _sharedWatchPayloadClasses];
  uint64_t v4 = [v2 setWithSet:v3];

  [v4 addObject:objc_opt_class()];
  [v4 addObject:objc_opt_class()];
  return v4;
}

+ (id)remoteQueueableWatchPayloadClasses
{
  uint64_t v2 = [a1 _sharedWatchPayloadClasses];
  if (MCGestaltIsInternalBuild())
  {
    id v3 = [MEMORY[0x1E4F1CA80] setWithSet:v2];
    [v3 addObject:objc_opt_class()];
  }
  else
  {
    id v3 = v2;
  }

  return v3;
}

- (BOOL)isSupportedByWatchVersions:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = +[MCPayload _minimumWatchVersionRequirementsForPayloads];
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  uint64_t v7 = [v4 objectForKeyedSubscript:v6];

  if (v7)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = v3;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v8);
          }
          unint64_t v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "unsignedIntegerValue", (void)v14);
          if (v12 >= [v7 unsignedIntegerValue])
          {
            LOBYTE(v9) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

+ (id)_minimumWatchVersionRequirementsForPayloads
{
  if (_minimumWatchVersionRequirementsForPayloads_onceToken != -1) {
    dispatch_once(&_minimumWatchVersionRequirementsForPayloads_onceToken, &__block_literal_global_20);
  }
  uint64_t v2 = (void *)_minimumWatchVersionRequirementsForPayloads_supportedWatchPayloads;
  return v2;
}

void __71__MCPayload_RemoteDevices___minimumWatchVersionRequirementsForPayloads__block_invoke()
{
  v49[23] = *MEMORY[0x1E4F143B8];
  v0 = (objc_class *)objc_opt_class();
  v47 = NSStringFromClass(v0);
  v48[0] = v47;
  v49[0] = &unk_1EF4D0910;
  v1 = (objc_class *)objc_opt_class();
  v46 = NSStringFromClass(v1);
  v48[1] = v46;
  v49[1] = &unk_1EF4D0928;
  uint64_t v2 = (objc_class *)objc_opt_class();
  v45 = NSStringFromClass(v2);
  v48[2] = v45;
  v49[2] = &unk_1EF4D0928;
  id v3 = (objc_class *)objc_opt_class();
  v44 = NSStringFromClass(v3);
  v48[3] = v44;
  v49[3] = &unk_1EF4D0928;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v43 = NSStringFromClass(v4);
  v48[4] = v43;
  v49[4] = &unk_1EF4D0928;
  uint64_t v5 = (objc_class *)objc_opt_class();
  v42 = NSStringFromClass(v5);
  v48[5] = v42;
  v49[5] = &unk_1EF4D0928;
  uint64_t v6 = (objc_class *)objc_opt_class();
  v41 = NSStringFromClass(v6);
  v48[6] = v41;
  v49[6] = &unk_1EF4D0928;
  uint64_t v7 = (objc_class *)objc_opt_class();
  v40 = NSStringFromClass(v7);
  v48[7] = v40;
  v49[7] = &unk_1EF4D0940;
  id v8 = (objc_class *)objc_opt_class();
  v39 = NSStringFromClass(v8);
  v48[8] = v39;
  v49[8] = &unk_1EF4D0940;
  uint64_t v9 = (objc_class *)objc_opt_class();
  v38 = NSStringFromClass(v9);
  v48[9] = v38;
  v49[9] = &unk_1EF4D0940;
  uint64_t v10 = (objc_class *)objc_opt_class();
  v37 = NSStringFromClass(v10);
  v48[10] = v37;
  v49[10] = &unk_1EF4D0958;
  uint64_t v11 = (objc_class *)objc_opt_class();
  v36 = NSStringFromClass(v11);
  v48[11] = v36;
  v49[11] = &unk_1EF4D0970;
  unint64_t v12 = (objc_class *)objc_opt_class();
  v35 = NSStringFromClass(v12);
  v48[12] = v35;
  v49[12] = &unk_1EF4D0988;
  uint64_t v13 = (objc_class *)objc_opt_class();
  v34 = NSStringFromClass(v13);
  v48[13] = v34;
  v49[13] = &unk_1EF4D09A0;
  long long v14 = (objc_class *)objc_opt_class();
  long long v15 = NSStringFromClass(v14);
  v48[14] = v15;
  v49[14] = &unk_1EF4D09A0;
  long long v16 = (objc_class *)objc_opt_class();
  long long v17 = NSStringFromClass(v16);
  v48[15] = v17;
  v49[15] = &unk_1EF4D09B8;
  uint64_t v18 = (objc_class *)objc_opt_class();
  uint64_t v19 = NSStringFromClass(v18);
  v48[16] = v19;
  v49[16] = &unk_1EF4D09B8;
  uint64_t v20 = (objc_class *)objc_opt_class();
  v21 = NSStringFromClass(v20);
  v48[17] = v21;
  v49[17] = &unk_1EF4D09B8;
  v22 = (objc_class *)objc_opt_class();
  v23 = NSStringFromClass(v22);
  v48[18] = v23;
  v49[18] = &unk_1EF4D09B8;
  v24 = (objc_class *)objc_opt_class();
  v25 = NSStringFromClass(v24);
  v48[19] = v25;
  v49[19] = &unk_1EF4D09B8;
  v26 = (objc_class *)objc_opt_class();
  v27 = NSStringFromClass(v26);
  v48[20] = v27;
  v49[20] = &unk_1EF4D09B8;
  v28 = (objc_class *)objc_opt_class();
  v29 = NSStringFromClass(v28);
  v48[21] = v29;
  v49[21] = &unk_1EF4D09B8;
  v30 = (objc_class *)objc_opt_class();
  v31 = NSStringFromClass(v30);
  v48[22] = v31;
  v49[22] = &unk_1EF4D09B8;
  uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:23];
  v33 = (void *)_minimumWatchVersionRequirementsForPayloads_supportedWatchPayloads;
  _minimumWatchVersionRequirementsForPayloads_supportedWatchPayloads = v32;
}

+ (id)typeStrings
{
  return 0;
}

+ (id)localizedDescriptionForPayloadCount:(unint64_t)a3
{
  if (a3 < 2)
  {
    unint64_t v12 = [a1 localizedSingularForm];
  }
  else
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:");
    long long v14 = [a1 localizedPluralForm];
    unint64_t v12 = MCLocalizedFormat(@"PAYLOAD_PLURAL_FORMAT", v5, v6, v7, v8, v9, v10, v11, (uint64_t)v4);
  }
  return v12;
}

+ (id)localizedParenthesizedFormDescriptionForPayloadCount:(unint64_t)a3
{
  if (a3 < 2)
  {
    unint64_t v12 = [a1 localizedSingularForm];
  }
  else
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:");
    long long v14 = [a1 localizedPluralForm];
    unint64_t v12 = MCLocalizedFormat(@"PAYLOAD_PAREN_PLURAL_FORMAT", v5, v6, v7, v8, v9, v10, v11, (uint64_t)v4);
  }
  return v12;
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"PAYLOAD_UNKNOWN_DESCRIPTION_SINGULAR_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"PAYLOAD_UNKNOWN_DESCRIPTION_PLURAL_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (NSDictionary)restrictions
{
  return 0;
}

- (void)setPersistentResourceID:(id)a3
{
  if (self->_persistentResourceID != a3)
  {
    self->_persistentResourceID = (NSString *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (NSString)friendlyName
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MCPayload *)self displayName];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    uint64_t v5 = [(MCPayload *)self displayName];
  }
  else
  {
    uint64_t v6 = [(MCPayload *)self identifier];
    uint64_t v7 = [v6 length];

    if (v7)
    {
      uint64_t v5 = [(MCPayload *)self identifier];
    }
    else
    {
      uint64_t v8 = [(MCPayload *)self UUID];
      uint64_t v9 = [v8 length];

      if (v9)
      {
        uint64_t v5 = [(MCPayload *)self UUID];
      }
      else
      {
        uint64_t v10 = (void *)_MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
        {
          uint64_t v11 = v10;
          int v14 = 138543618;
          id v15 = (id)objc_opt_class();
          __int16 v16 = 2048;
          long long v17 = self;
          id v12 = v15;
          _os_log_impl(&dword_1A13F0000, v11, OS_LOG_TYPE_ERROR, "Payload %{public}@ %p has no friendly name.", (uint8_t *)&v14, 0x16u);
        }
        uint64_t v5 = @"Payload";
      }
    }
  }
  return (NSString *)v5;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"Payload %@ %p, version %d\n", objc_opt_class(), self, self->_version];
  uint64_t v4 = v3;
  if (self->_payloadDescription) {
    [v3 appendFormat:@"Description : “%@”\n", self->_payloadDescription];
  }
  if (self->_identifier) {
    [v4 appendFormat:@"Identifier  : %@\n", self->_identifier];
  }
  if (self->_UUID) {
    [v4 appendFormat:@"UUID        : %@\n", self->_UUID];
  }
  if (self->_type) {
    [v4 appendFormat:@"Type        : %@\n", self->_type];
  }
  if (self->_displayName) {
    [v4 appendFormat:@"Display name: %@\n", self->_displayName];
  }
  if (self->_organization) {
    [v4 appendFormat:@"Organization: %@\n", self->_organization];
  }
  if (self->_persistentResourceID) {
    [v4 appendFormat:@"Persistent Resource ID: %@\n", self->_persistentResourceID];
  }
  uint64_t v5 = [(MCPayload *)self restrictions];
  uint64_t v6 = (void *)v5;
  if (v5) {
    [v4 appendFormat:@"Restrictions: %@\n", v5];
  }

  return v4;
}

- (id)serializedDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  [v3 setObject:v5 forKeyedSubscript:@"Class"];

  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_version];
  [v3 setObject:v6 forKeyedSubscript:@"Version"];

  payloadDescription = self->_payloadDescription;
  if (payloadDescription) {
    [v3 setObject:payloadDescription forKeyedSubscript:@"Description"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKeyedSubscript:@"Identifier"];
  }
  UUID = self->_UUID;
  if (UUID) {
    [v3 setObject:UUID forKeyedSubscript:@"UUID"];
  }
  type = self->_type;
  if (type) {
    [v3 setObject:type forKeyedSubscript:@"Type"];
  }
  displayName = self->_displayName;
  if (displayName) {
    [v3 setObject:displayName forKeyedSubscript:@"Display Name"];
  }
  organization = self->_organization;
  if (organization) {
    [v3 setObject:organization forKeyedSubscript:@"Organization"];
  }
  persistentResourceID = self->_persistentResourceID;
  if (persistentResourceID) {
    [v3 setObject:persistentResourceID forKeyedSubscript:@"Persistent Resource ID"];
  }
  int v14 = [(MCPayload *)self restrictions];
  if (v14) {
    [v3 setObject:v14 forKeyedSubscript:@"Restrictions"];
  }

  return v3;
}

- (NSArray)installationWarnings
{
  return 0;
}

- (id)subtitle1Label
{
  return 0;
}

- (id)subtitle1Description
{
  return 0;
}

- (id)subtitle2Label
{
  return 0;
}

- (id)subtitle2Description
{
  return 0;
}

- (id)payloadDescriptionKeyValueSections
{
  return 0;
}

- (BOOL)containsSensitiveUserInformation
{
  return 0;
}

- (MCProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  return (MCProfile *)WeakRetained;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)payloadDescription
{
  return self->_payloadDescription;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)organization
{
  return self->_organization;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (int64_t)version
{
  return self->_version;
}

- (NSString)persistentResourceID
{
  return self->_persistentResourceID;
}

- (BOOL)mustInstallNonInteractively
{
  return self->_mustInstallNonInteractively;
}

- (void)setMustInstallNonInteractively:(BOOL)a3
{
  self->_mustInstallNonInteractively = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentResourceID, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_organization, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_payloadDescription, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_destroyWeak((id *)&self->_profile);
}

+ (id)_platformSpecificConfigurationPayloadClasses
{
  if (_platformSpecificConfigurationPayloadClasses_onceToken != -1) {
    dispatch_once(&_platformSpecificConfigurationPayloadClasses_onceToken, &__block_literal_global_48);
  }
  uint64_t v2 = (void *)_platformSpecificConfigurationPayloadClasses_platformPayloads;
  return v2;
}

void __66__MCPayload_Private___platformSpecificConfigurationPayloadClasses__block_invoke()
{
  if (MCGestaltIsAppleTV())
  {
    v0 = +[MCPayload _installableTVConfigurationPayloadClasses];
  }
  else if (MCGestaltIsHomePod())
  {
    v0 = +[MCPayload installableHomePodConfigurationPayloadClasses];
  }
  else if (MCGestaltIsWatch())
  {
    v0 = +[MCPayload installableWatchConfigurationPayloadClasses];
  }
  else
  {
    if (MCGestaltIsVisionDevice()) {
      +[MCPayload _installableVisionConfigurationPayloadClasses];
    }
    else {
    v0 = +[MCPayload _installablePhoneConfigurationPayloadClasses];
    }
  }
  id v3 = v0;
  uint64_t v1 = [v0 allObjects];
  uint64_t v2 = (void *)_platformSpecificConfigurationPayloadClasses_platformPayloads;
  _platformSpecificConfigurationPayloadClasses_platformPayloads = v1;
}

+ (id)_allKnownPayloadClasses
{
  if (_allKnownPayloadClasses_onceToken != -1) {
    dispatch_once(&_allKnownPayloadClasses_onceToken, &__block_literal_global_180);
  }
  uint64_t v2 = (void *)_allKnownPayloadClasses_allPayloads;
  return v2;
}

void __45__MCPayload_Private___allKnownPayloadClasses__block_invoke()
{
  v0 = +[MCPayload _installableTVConfigurationPayloadClasses];
  id v7 = (id)[v0 mutableCopy];

  uint64_t v1 = +[MCPayload installableHomePodConfigurationPayloadClasses];
  [v7 unionSet:v1];

  uint64_t v2 = +[MCPayload installableWatchConfigurationPayloadClasses];
  [v7 unionSet:v2];

  id v3 = +[MCPayload _installableVisionConfigurationPayloadClasses];
  [v7 unionSet:v3];

  uint64_t v4 = +[MCPayload _installablePhoneConfigurationPayloadClasses];
  [v7 unionSet:v4];

  uint64_t v5 = [v7 allObjects];
  uint64_t v6 = (void *)_allKnownPayloadClasses_allPayloads;
  _allKnownPayloadClasses_allPayloads = v5;
}

+ (id)_installableTVConfigurationPayloadClasses
{
  v25 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v24 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  return (id)objc_msgSend(v25, "setWithObjects:", v24, v23, v22, v21, v20, v19, v18, v17, v16, v15, v14, v13, v2, v3, v4, v5, v6,
               v7,
               v8,
               v9,
               v10,
               v11,
               objc_opt_class(),
               0);
}

+ (id)_installablePhoneConfigurationPayloadClasses
{
  v54 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v53 = objc_opt_class();
  uint64_t v52 = objc_opt_class();
  uint64_t v51 = objc_opt_class();
  uint64_t v50 = objc_opt_class();
  uint64_t v49 = objc_opt_class();
  uint64_t v48 = objc_opt_class();
  uint64_t v47 = objc_opt_class();
  uint64_t v46 = objc_opt_class();
  uint64_t v45 = objc_opt_class();
  uint64_t v44 = objc_opt_class();
  uint64_t v43 = objc_opt_class();
  uint64_t v42 = objc_opt_class();
  uint64_t v41 = objc_opt_class();
  uint64_t v40 = objc_opt_class();
  uint64_t v39 = objc_opt_class();
  uint64_t v38 = objc_opt_class();
  uint64_t v37 = objc_opt_class();
  uint64_t v36 = objc_opt_class();
  uint64_t v35 = objc_opt_class();
  uint64_t v34 = objc_opt_class();
  uint64_t v33 = objc_opt_class();
  uint64_t v32 = objc_opt_class();
  uint64_t v31 = objc_opt_class();
  uint64_t v30 = objc_opt_class();
  uint64_t v29 = objc_opt_class();
  uint64_t v28 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  uint64_t v26 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  uint64_t v24 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  return (id)objc_msgSend(v54, "setWithObjects:", v53, v52, v51, v50, v49, v48, v47, v46, v45, v44, v43, v42, v41, v40, v39, v38, v37,
               v36,
               v35,
               v34,
               v33,
               v32,
               v31,
               v30,
               v29,
               v28,
               v27,
               v26,
               v25,
               v24,
               v23,
               v22,
               v21,
               v20,
               v19,
               v18,
               v17,
               v16,
               v15,
               v14,
               v13,
               v2,
               v3,
               v4,
               v5,
               v6,
               v7,
               v8,
               v9,
               v10,
               v11,
               objc_opt_class(),
               0);
}

+ (id)_installableVisionConfigurationPayloadClasses
{
  v7[32] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA80];
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v7[2] = objc_opt_class();
  v7[3] = objc_opt_class();
  v7[4] = objc_opt_class();
  v7[5] = objc_opt_class();
  v7[6] = objc_opt_class();
  v7[7] = objc_opt_class();
  v7[8] = objc_opt_class();
  v7[9] = objc_opt_class();
  v7[10] = objc_opt_class();
  v7[11] = objc_opt_class();
  v7[12] = objc_opt_class();
  v7[13] = objc_opt_class();
  v7[14] = objc_opt_class();
  v7[15] = objc_opt_class();
  v7[16] = objc_opt_class();
  v7[17] = objc_opt_class();
  v7[18] = objc_opt_class();
  v7[19] = objc_opt_class();
  v7[20] = objc_opt_class();
  v7[21] = objc_opt_class();
  v7[22] = objc_opt_class();
  v7[23] = objc_opt_class();
  v7[24] = objc_opt_class();
  v7[25] = objc_opt_class();
  v7[26] = objc_opt_class();
  v7[27] = objc_opt_class();
  v7[28] = objc_opt_class();
  v7[29] = objc_opt_class();
  v7[30] = objc_opt_class();
  v7[31] = objc_opt_class();
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:32];
  uint64_t v4 = [v2 setWithArray:v3];

  if ([MEMORY[0x1E4F5E780] isVisionMDMEnabled]) {
    [v4 addObject:objc_opt_class()];
  }
  uint64_t v5 = (void *)[v4 copy];

  return v5;
}

+ (id)accountPayloads
{
  if (accountPayloads_once != -1) {
    dispatch_once(&accountPayloads_once, &__block_literal_global_241_2);
  }
  uint64_t v2 = (void *)accountPayloads_set;
  return v2;
}

void __37__MCPayload_Private__accountPayloads__block_invoke()
{
  v3[8] = *MEMORY[0x1E4F143B8];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  v3[5] = objc_opt_class();
  v3[6] = objc_opt_class();
  v3[7] = objc_opt_class();
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:8];
  uint64_t v1 = [MEMORY[0x1E4F1CAD0] setWithArray:v0];
  uint64_t v2 = (void *)accountPayloads_set;
  accountPayloads_set = v1;
}

+ (id)payloadsRequiringRatchetWithStolenDeviceProtection
{
  if (payloadsRequiringRatchetWithStolenDeviceProtection_onceToken != -1) {
    dispatch_once(&payloadsRequiringRatchetWithStolenDeviceProtection_onceToken, &__block_literal_global_243_0);
  }
  uint64_t v2 = (void *)payloadsRequiringRatchetWithStolenDeviceProtection_payloads;
  return v2;
}

void __72__MCPayload_Private__payloadsRequiringRatchetWithStolenDeviceProtection__block_invoke()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:5];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7);
  uint64_t v3 = (void *)payloadsRequiringRatchetWithStolenDeviceProtection_payloads;
  payloadsRequiringRatchetWithStolenDeviceProtection_payloads = v2;
}

+ (id)unavailablePayloadsInEphemeralMultiUser
{
  if (unavailablePayloadsInEphemeralMultiUser_once != -1) {
    dispatch_once(&unavailablePayloadsInEphemeralMultiUser_once, &__block_literal_global_246_1);
  }
  uint64_t v2 = (void *)unavailablePayloadsInEphemeralMultiUser_set;
  return v2;
}

void __61__MCPayload_Private__unavailablePayloadsInEphemeralMultiUser__block_invoke()
{
  id v6 = +[MCPayload unavailableSystemPayloadsInEphemeralMultiUser];
  v0 = +[MCPayload unavailableUserPayloadsInEphemeralMultiUser];
  uint64_t v1 = [MEMORY[0x1E4F1CA80] set];
  if (v6) {
    BOOL v2 = v0 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CAD0] set];
  }
  else
  {
    uint64_t v3 = [v6 allObjects];
    [v1 addObjectsFromArray:v3];

    [v1 intersectSet:v0];
    uint64_t v4 = [v1 copy];
  }
  uint64_t v5 = (void *)unavailablePayloadsInEphemeralMultiUser_set;
  unavailablePayloadsInEphemeralMultiUser_set = v4;
}

+ (id)hrnRequiredPayloads
{
  if (hrnRequiredPayloads_onceToken != -1) {
    dispatch_once(&hrnRequiredPayloads_onceToken, &__block_literal_global_248_0);
  }
  BOOL v2 = (void *)hrnRequiredPayloads_payloads;
  return v2;
}

void __41__MCPayload_Private__hrnRequiredPayloads__block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)hrnRequiredPayloads_payloads;
  hrnRequiredPayloads_payloads = v2;
}

+ (id)mdmAdoptablePayloads
{
  if (mdmAdoptablePayloads_onceToken != -1) {
    dispatch_once(&mdmAdoptablePayloads_onceToken, &__block_literal_global_250);
  }
  uint64_t v2 = (void *)mdmAdoptablePayloads_payloads;
  return v2;
}

void __42__MCPayload_Private__mdmAdoptablePayloads__block_invoke()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:7];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  uint64_t v3 = (void *)mdmAdoptablePayloads_payloads;
  mdmAdoptablePayloads_payloads = v2;
}

+ (id)cellularRequiredPayloads
{
  if (cellularRequiredPayloads_onceToken != -1) {
    dispatch_once(&cellularRequiredPayloads_onceToken, &__block_literal_global_252);
  }
  uint64_t v2 = (void *)cellularRequiredPayloads_payloads;
  return v2;
}

void __46__MCPayload_Private__cellularRequiredPayloads__block_invoke()
{
  void v4[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)cellularRequiredPayloads_payloads;
  cellularRequiredPayloads_payloads = v2;
}

+ (id)supervisedRequiredPayloads
{
  if (supervisedRequiredPayloads_onceToken != -1) {
    dispatch_once(&supervisedRequiredPayloads_onceToken, &__block_literal_global_254);
  }
  uint64_t v2 = (void *)supervisedRequiredPayloads_supervisedOnlyPayloadClasses;
  return v2;
}

void __48__MCPayload_Private__supervisedRequiredPayloads__block_invoke()
{
  v4[10] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  void v4[2] = objc_opt_class();
  void v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  v4[8] = objc_opt_class();
  v4[9] = objc_opt_class();
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:10];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)supervisedRequiredPayloads_supervisedOnlyPayloadClasses;
  supervisedRequiredPayloads_supervisedOnlyPayloadClasses = v2;
}

+ (id)unavailableSystemPayloadsInEphemeralMultiUser
{
  if (unavailableSystemPayloadsInEphemeralMultiUser_once != -1) {
    dispatch_once(&unavailableSystemPayloadsInEphemeralMultiUser_once, &__block_literal_global_257_0);
  }
  uint64_t v2 = (void *)unavailableSystemPayloadsInEphemeralMultiUser_set;
  return v2;
}

void __67__MCPayload_Private__unavailableSystemPayloadsInEphemeralMultiUser__block_invoke()
{
  v4[14] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  void v4[2] = objc_opt_class();
  void v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  v4[8] = objc_opt_class();
  v4[9] = objc_opt_class();
  v4[10] = objc_opt_class();
  void v4[11] = objc_opt_class();
  v4[12] = objc_opt_class();
  v4[13] = objc_opt_class();
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:14];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)unavailableSystemPayloadsInEphemeralMultiUser_set;
  unavailableSystemPayloadsInEphemeralMultiUser_set = v2;
}

+ (id)unavailableUserPayloadsInEphemeralMultiUser
{
  if (unavailableUserPayloadsInEphemeralMultiUser_once != -1) {
    dispatch_once(&unavailableUserPayloadsInEphemeralMultiUser_once, &__block_literal_global_259);
  }
  uint64_t v2 = (void *)unavailableUserPayloadsInEphemeralMultiUser_set;
  return v2;
}

void __65__MCPayload_Private__unavailableUserPayloadsInEphemeralMultiUser__block_invoke()
{
  v4[34] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  void v4[2] = objc_opt_class();
  void v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  v4[8] = objc_opt_class();
  v4[9] = objc_opt_class();
  v4[10] = objc_opt_class();
  void v4[11] = objc_opt_class();
  v4[12] = objc_opt_class();
  v4[13] = objc_opt_class();
  v4[14] = objc_opt_class();
  void v4[15] = objc_opt_class();
  v4[16] = objc_opt_class();
  v4[17] = objc_opt_class();
  v4[18] = objc_opt_class();
  v4[19] = objc_opt_class();
  v4[20] = objc_opt_class();
  v4[21] = objc_opt_class();
  v4[22] = objc_opt_class();
  v4[23] = objc_opt_class();
  v4[24] = objc_opt_class();
  v4[25] = objc_opt_class();
  v4[26] = objc_opt_class();
  v4[27] = objc_opt_class();
  v4[28] = objc_opt_class();
  v4[29] = objc_opt_class();
  v4[30] = objc_opt_class();
  v4[31] = objc_opt_class();
  v4[32] = objc_opt_class();
  v4[33] = objc_opt_class();
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:34];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)unavailableUserPayloadsInEphemeralMultiUser_set;
  unavailableUserPayloadsInEphemeralMultiUser_set = v2;
}

+ (id)availablePayloadsForUserEnrollment
{
  if (availablePayloadsForUserEnrollment_once != -1) {
    dispatch_once(&availablePayloadsForUserEnrollment_once, &__block_literal_global_261);
  }
  uint64_t v2 = (void *)availablePayloadsForUserEnrollment_set;
  return v2;
}

void __56__MCPayload_Private__availablePayloadsForUserEnrollment__block_invoke()
{
  v5[30] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CA80];
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  v5[2] = objc_opt_class();
  v5[3] = objc_opt_class();
  v5[4] = objc_opt_class();
  v5[5] = objc_opt_class();
  v5[6] = objc_opt_class();
  v5[7] = objc_opt_class();
  v5[8] = objc_opt_class();
  v5[9] = objc_opt_class();
  v5[10] = objc_opt_class();
  v5[11] = objc_opt_class();
  v5[12] = objc_opt_class();
  v5[13] = objc_opt_class();
  v5[14] = objc_opt_class();
  v5[15] = objc_opt_class();
  v5[16] = objc_opt_class();
  v5[17] = objc_opt_class();
  v5[18] = objc_opt_class();
  v5[19] = objc_opt_class();
  v5[20] = objc_opt_class();
  v5[21] = objc_opt_class();
  v5[22] = objc_opt_class();
  v5[23] = objc_opt_class();
  v5[24] = objc_opt_class();
  v5[25] = objc_opt_class();
  v5[26] = objc_opt_class();
  v5[27] = objc_opt_class();
  v5[28] = objc_opt_class();
  v5[29] = objc_opt_class();
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:30];
  uint64_t v2 = [v0 setWithArray:v1];

  if (+[MCFeatureOverrides allowVPNInUserEnrollment]) {
    [v2 addObject:objc_opt_class()];
  }
  uint64_t v3 = [v2 copy];
  uint64_t v4 = (void *)availablePayloadsForUserEnrollment_set;
  availablePayloadsForUserEnrollment_set = v3;
}

+ (id)payloadsFromArray:(id)a3 isStub:(BOOL)a4 profile:(id)a5 outError:(id *)a6
{
  BOOL v7 = a4;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v30 = a5;
  uint64_t v29 = [MEMORY[0x1E4F1CA48] array];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v31 = 0;
          uint64_t v22 = +[MCPayload payloadFromDictionary:v14 isStub:v7 profile:v30 outError:&v31];
          id v23 = v31;
          if (v22) {
            [v29 addObject:v22];
          }
        }
        else
        {
          uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v22 = MCErrorArray(@"ERROR_PAYLOAD_MALFORMED", v15, v16, v17, v18, v19, v20, v21, 0);
          id v23 = [v24 MCErrorWithDomain:@"MCPayloadErrorDomain" code:2000 descriptionArray:v22 errorType:@"MCFatalError"];
        }

        if (v23)
        {

          if (a6)
          {
            id v23 = v23;
            id v26 = 0;
            *a6 = v23;
          }
          else
          {
            id v26 = 0;
          }
          uint64_t v25 = v29;
          goto LABEL_18;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  uint64_t v25 = v29;
  id v26 = v29;
  id v23 = 0;
LABEL_18:

  return v26;
}

+ (id)payloadFromDictionary:(id)a3 isStub:(BOOL)a4 profile:(id)a5 outError:(id *)a6
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = [v9 objectForKey:@"PayloadType"];
  id v54 = v10;
  if (a4)
  {
    unint64_t v12 = 0;
  }
  else
  {
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    if (_removedPayloadClasses_onceToken != -1) {
      dispatch_once(&_removedPayloadClasses_onceToken, &__block_literal_global_336);
    }
    id v13 = (id)_removedPayloadClasses_array;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v62 objects:v71 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v63;
LABEL_7:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v63 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = [*(id *)(*((void *)&v62 + 1) + 8 * v17) typeStrings];
        int v19 = [v18 containsObject:v11];

        if (v19) {
          break;
        }
        if (v15 == ++v17)
        {
          uint64_t v15 = [v13 countByEnumeratingWithState:&v62 objects:v71 count:16];
          if (v15) {
            goto LABEL_7;
          }
          goto LABEL_13;
        }
      }
      uint64_t v20 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v67 = v11;
        _os_log_impl(&dword_1A13F0000, v20, OS_LOG_TYPE_DEBUG, "Payload class for type “%{public}@” was deprecated on current platform. Converting to Unknown Payload.", buf, 0xCu);
      }
      uint64_t v21 = [MCUnknownPayload alloc];
      uint64_t v22 = (void *)[v9 mutableCopy];
      id v61 = 0;
      uint64_t v23 = [(MCUnknownPayload *)v21 initWithDictionary:v22 profile:v54 outError:&v61];
      unint64_t v12 = (unint64_t)v61;

      id v10 = v54;
      if (!v23) {
        goto LABEL_23;
      }
      if (!v12) {
        goto LABEL_48;
      }
      goto LABEL_18;
    }
LABEL_13:

    unint64_t v12 = 0;
    id v10 = v54;
  }
LABEL_23:
  BOOL v28 = +[MCFeatureOverrides shouldDisablePlatformPayloadFilter];
  uint64_t v29 = [a1 _platformSpecificConfigurationPayloadClasses];
  id v30 = v29;
  if (v28)
  {
    id v31 = [a1 _allKnownPayloadClasses];
  }
  else
  {
    id v31 = v29;
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v32 = v31;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v57 objects:v70 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v51 = v30;
    uint64_t v52 = v9;
    uint64_t v35 = *(void *)v58;
LABEL_28:
    uint64_t v36 = 0;
    while (1)
    {
      if (*(void *)v58 != v35) {
        objc_enumerationMutation(v32);
      }
      uint64_t v37 = *(void **)(*((void *)&v57 + 1) + 8 * v36);
      uint64_t v38 = objc_msgSend(v37, "typeStrings", v51);
      int v39 = [v38 containsObject:v11];

      if (v39) {
        break;
      }
      if (v34 == ++v36)
      {
        uint64_t v34 = [v32 countByEnumeratingWithState:&v57 objects:v70 count:16];
        if (v34) {
          goto LABEL_28;
        }
        uint64_t v23 = 0;
        id v9 = v52;
        id v10 = v54;
        goto LABEL_42;
      }
    }
    id v40 = objc_alloc((Class)v37);
    uint64_t v41 = (void *)[v52 mutableCopy];
    id v56 = (id)v12;
    id v10 = v54;
    uint64_t v23 = [v40 initWithDictionary:v41 profile:v54 outError:&v56];
    id v42 = v56;

    if (!v28)
    {
      unint64_t v12 = (unint64_t)v42;
      id v9 = v52;
LABEL_42:
      id v30 = v51;
      goto LABEL_43;
    }
    id v30 = v51;
    if (([v51 containsObject:v37] & 1) == 0)
    {
      uint64_t v43 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        uint64_t v44 = v43;
        uint64_t v45 = NSStringFromClass((Class)v37);
        *(_DWORD *)buf = 138543362;
        v67 = v45;
        _os_log_impl(&dword_1A13F0000, v44, OS_LOG_TYPE_ERROR, "Platform payload filter has been disabled. Allowing %{public}@ payload despite it being unsupported.", buf, 0xCu);

        id v30 = v51;
      }
    }
    unint64_t v12 = (unint64_t)v42;
    id v9 = v52;
  }
  else
  {
    uint64_t v23 = 0;
  }
LABEL_43:

  if (!(v12 | v23))
  {
    uint64_t v46 = v30;
    uint64_t v47 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v67 = v11;
      _os_log_impl(&dword_1A13F0000, v47, OS_LOG_TYPE_DEBUG, "No payload class for type “%{public}@” on current platform. Converting to Unknown Payload.", buf, 0xCu);
    }
    uint64_t v48 = [MCUnknownPayload alloc];
    uint64_t v49 = (void *)[v9 mutableCopy];
    id v55 = 0;
    uint64_t v23 = [(MCUnknownPayload *)v48 initWithDictionary:v49 profile:v10 outError:&v55];
    unint64_t v12 = (unint64_t)v55;

    id v30 = v46;
  }

  if (!v12)
  {
LABEL_48:
    id v27 = (id)v23;
    goto LABEL_49;
  }
LABEL_18:
  if (a6) {
    *a6 = (id) v12;
  }
  uint64_t v24 = (void *)_MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    uint64_t v25 = v24;
    id v26 = [(id)v12 MCVerboseDescription];
    *(_DWORD *)buf = 138543618;
    v67 = v11;
    __int16 v68 = 2114;
    v69 = v26;
    _os_log_impl(&dword_1A13F0000, v25, OS_LOG_TYPE_ERROR, "Cannot create profile of type “%{public}@”. Error: %{public}@", buf, 0x16u);
  }
  id v27 = 0;
LABEL_49:

  return v27;
}

+ (id)missingFieldErrorWithField:(id)a3 underlyingError:(id)a4
{
  id v8 = (void *)MEMORY[0x1E4F28C58];
  id v9 = MCErrorArray(@"ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD", (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7, a3);
  id v10 = [v8 MCErrorWithDomain:@"MCPayloadErrorDomain" code:2002 descriptionArray:v9 errorType:@"MCFatalError"];

  return v10;
}

+ (id)badFieldTypeErrorWithField:(id)a3
{
  id v8 = (void *)MEMORY[0x1E4F28C58];
  id v9 = MCErrorArray(@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD", (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, a3);
  id v10 = [v8 MCErrorWithDomain:@"MCPayloadErrorDomain" code:2003 descriptionArray:v9 errorType:@"MCFatalError"];

  return v10;
}

+ (id)badFieldValueErrorWithField:(id)a3
{
  return (id)[a1 badFieldValueErrorWithField:a3 underlyingError:0];
}

+ (id)badFieldValueErrorWithField:(id)a3 underlyingError:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
  id v6 = a4;
  uint64_t v14 = MCErrorArray(@"ERROR_PAYLOAD_FIELD_BAD_VALUE_P_FIELD", v7, v8, v9, v10, v11, v12, v13, a3);
  uint64_t v15 = [v5 MCErrorWithDomain:@"MCPayloadErrorDomain" code:2004 descriptionArray:v14 underlyingError:v6 errorType:@"MCFatalError"];

  return v15;
}

+ (id)conflictingFieldValueErrorWithUnderlyingError:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
  id v4 = a3;
  uint64_t v5 = MCErrorVaArray(@"ERROR_PAYLOAD_FIELD_CONFLICTING_P_FIELDS", &v9);
  id v6 = [v3 MCErrorWithDomain:@"MCPayloadErrorDomain" code:2004 descriptionArray:v5 underlyingError:v4 errorType:@"MCFatalError"];

  return v6;
}

- (MCPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v60.receiver = self;
  v60.super_class = (Class)MCPayload;
  uint64_t v10 = [(MCPayload *)&v60 init];
  if (!v10) {
    goto LABEL_34;
  }
  id v59 = 0;
  uint64_t v11 = +[MCProfile removeRequiredObjectInDictionary:v8 key:@"PayloadVersion" type:objc_opt_class() errorDomain:@"MCPayloadErrorDomain" missingDataCode:2002 missingDataErrorString:@"ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v59];
  uint64_t v12 = (NSString *)v59;
  if (!v12)
  {
    v10->_int64_t version = (int)[v11 intValue];
    int v14 = [v9 isStub];
    int64_t version = v10->_version;
    if (v14)
    {
      if (version != 1)
      {
        uint64_t v23 = _MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A13F0000, v23, OS_LOG_TYPE_ERROR, "WARNING: payload contains PayloadVersion other than “1”.", buf, 2u);
        }
      }
    }
    else if (version != 1)
    {
      id v32 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v33 = MCErrorArray(@"ERROR_PAYLOAD_UNSUPPORTED_VERSION", v15, v16, v17, v18, v19, v20, v21, 0);
      persistentResourceID = [v32 MCErrorWithDomain:@"MCPayloadErrorDomain" code:2001 descriptionArray:v33 errorType:@"MCFatalError"];
      uint64_t v13 = (NSString *)[persistentResourceID MCCopyAsPrimaryError];
      goto LABEL_27;
    }
    objc_storeWeak((id *)&v10->_profile, v9);
    id v58 = 0;
    uint64_t v24 = +[MCProfile removeRequiredNonZeroLengthStringInDictionary:v8 key:@"PayloadType" errorDomain:@"MCPayloadErrorDomain" missingDataCode:2002 missingDataErrorString:@"ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v58];
    uint64_t v13 = (NSString *)v58;
    type = v10->_type;
    v10->_type = (NSString *)v24;

    if (!v13)
    {
      id v57 = 0;
      uint64_t v26 = +[MCProfile removeRequiredNonZeroLengthStringInDictionary:v8 key:@"PayloadIdentifier" errorDomain:@"MCPayloadErrorDomain" missingDataCode:2002 missingDataErrorString:@"ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v57];
      uint64_t v13 = (NSString *)v57;
      identifier = v10->_identifier;
      v10->_identifier = (NSString *)v26;

      if (!v13)
      {
        id v56 = 0;
        uint64_t v28 = +[MCProfile removeRequiredNonZeroLengthStringInDictionary:v8 key:@"PayloadUUID" errorDomain:@"MCPayloadErrorDomain" missingDataCode:2002 missingDataErrorString:@"ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v56];
        uint64_t v13 = (NSString *)v56;
        UUID = v10->_UUID;
        v10->_UUID = (NSString *)v28;
      }
    }
    uint64_t v33 = [v8 objectForKey:@"PayloadDescription"];
    if (!v33)
    {
LABEL_21:
      [v8 removeObjectForKey:@"PayloadDescription"];
      if (v13) {
        goto LABEL_28;
      }
      id v55 = 0;
      uint64_t v38 = +[MCProfile removeOptionalNonZeroLengthStringInDictionary:v8 key:@"PayloadDisplayName" errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v55];
      uint64_t v13 = (NSString *)v55;
      displayName = v10->_displayName;
      v10->_displayName = (NSString *)v38;

      if (!v13)
      {
        id v54 = 0;
        uint64_t v40 = +[MCProfile removeOptionalNonZeroLengthStringInDictionary:v8 key:@"PayloadOrganization" errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v54];
        uint64_t v13 = (NSString *)v54;
        organization = v10->_organization;
        v10->_organization = (NSString *)v40;
      }
      id WeakRetained = objc_loadWeakRetained((id *)&v10->_profile);
      int v43 = [WeakRetained isStub];

      if (!v43 || v13)
      {
LABEL_28:

        if (!v13) {
          goto LABEL_34;
        }
        goto LABEL_29;
      }
      id v53 = 0;
      uint64_t v44 = +[MCProfile removeOptionalNonZeroLengthStringInDictionary:v8 key:@"PersistentResourceID" errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v53];
      uint64_t v13 = (NSString *)v53;
      persistentResourceID = v10->_persistentResourceID;
      v10->_persistentResourceID = (NSString *)v44;
LABEL_27:

      goto LABEL_28;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v30 = MCStringFromArrayOfStrings(v33);
      payloadDescription = v10->_payloadDescription;
      v10->_payloadDescription = (NSString *)v30;

      if (v10->_payloadDescription) {
        goto LABEL_21;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v35 = v33;
        uint64_t v36 = v10->_payloadDescription;
        v10->_payloadDescription = v35;
LABEL_20:

        goto LABEL_21;
      }
    }
    uint64_t v37 = +[MCPayload badFieldTypeErrorWithField:@"PayloadDescription"];
    uint64_t v36 = v13;
    uint64_t v13 = (NSString *)v37;
    goto LABEL_20;
  }
  uint64_t v13 = v12;

LABEL_29:
  uint64_t v45 = [(MCPayload *)v10 malformedPayloadErrorWithError:v13];
  uint64_t v46 = v45;
  if (a5) {
    *a5 = v45;
  }
  uint64_t v47 = (void *)_MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    uint64_t v48 = v47;
    uint64_t v49 = objc_opt_class();
    id v50 = v49;
    uint64_t v51 = [v46 MCVerboseDescription];
    *(_DWORD *)buf = 138543618;
    long long v62 = v49;
    __int16 v63 = 2114;
    long long v64 = v51;
    _os_log_impl(&dword_1A13F0000, v48, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
  }
  uint64_t v10 = 0;
LABEL_34:

  return v10;
}

- (id)malformedPayloadErrorWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MCPayload *)self profile];
  id v6 = [v5 friendlyName];

  int v14 = (void *)MEMORY[0x1E4F28C58];
  if (v6) {
    MCErrorArray(@"ERROR_PAYLOAD_MALFORMED_P_ID", v7, v8, v9, v10, v11, v12, v13, v6);
  }
  else {
  uint64_t v15 = MCErrorArray(@"ERROR_PAYLOAD_MALFORMED", v7, v8, v9, v10, v11, v12, v13, 0);
  }
  uint64_t v16 = [v14 MCErrorWithDomain:@"MCPayloadErrorDomain" code:2000 descriptionArray:v15 underlyingError:v4 errorType:@"MCFatalError"];

  return v16;
}

- (id)stubDictionary
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
  id v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_version];
  [v3 setObject:v4 forKey:@"PayloadVersion"];

  [v3 setObject:self->_type forKey:@"PayloadType"];
  [v3 setObject:self->_identifier forKey:@"PayloadIdentifier"];
  [v3 setObject:self->_UUID forKey:@"PayloadUUID"];
  [v3 MCSetObjectIfNotNil:self->_payloadDescription forKey:@"PayloadDescription"];
  [v3 MCSetObjectIfNotNil:self->_displayName forKey:@"PayloadDisplayName"];
  [v3 MCSetObjectIfNotNil:self->_organization forKey:@"PayloadOrganization"];
  [v3 MCSetObjectIfNotNil:self->_persistentResourceID forKey:@"PersistentResourceID"];
  return v3;
}

+ (id)wrapperPayloadDictionary
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = [MEMORY[0x1E4F28ED0] numberWithInt:1];
  [v2 setObject:v3 forKey:@"PayloadVersion"];

  return v2;
}

- (id)filterForUserEnrollmentOutError:(id *)a3
{
  uint64_t v5 = +[MCPayload availablePayloadsForUserEnrollment];
  char v6 = [v5 containsObject:objc_opt_class()];
  if (a3 && (v6 & 1) == 0)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = [(MCPayload *)self type];
    uint64_t v16 = MCErrorArray(@"ERROR_UNACCEPTABLE_PAYLOAD_IN_USER_ENROLLMENT_P_TYPE", v9, v10, v11, v12, v13, v14, v15, v8);
    *a3 = [v7 MCErrorWithDomain:@"MCInstallationErrorDomain" code:4029 descriptionArray:v16 errorType:@"MCFatalError"];
  }
  return 0;
}

@end