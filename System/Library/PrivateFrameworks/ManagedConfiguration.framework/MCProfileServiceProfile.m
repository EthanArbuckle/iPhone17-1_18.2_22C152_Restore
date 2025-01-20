@interface MCProfileServiceProfile
- (BOOL)confirmInstallation;
- (BOOL)supportedServerVersion;
- (MCProfileServiceProfile)initWithDictionary:(id)a3 signerCerts:(id)a4 allowEmptyPayload:(BOOL)a5 outError:(id *)a6;
- (NSArray)deviceAttributes;
- (NSData)enrollmentIdentityPersistentID;
- (NSString)URLString;
- (id)_badDataTypeErrorWithFieldName:(id)a3;
- (id)_unsupportedValueErrorWithFieldName:(id)a3 value:(id)a4;
- (id)challenge;
- (id)description;
- (id)localizedPayloadSummaryByType;
- (id)payloads;
- (id)serializedDictionary;
- (id)stubDictionary;
- (void)setEnrollmentIdentityPersistentID:(id)a3;
- (void)setURLString:(id)a3;
@end

@implementation MCProfileServiceProfile

- (id)_badDataTypeErrorWithFieldName:(id)a3
{
  v8 = (void *)MEMORY[0x1E4F28C58];
  v9 = MCErrorArray(@"ERROR_PROFILE_FIELD_INVALID_P_FIELD", (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, a3);
  v10 = [v8 MCErrorWithDomain:@"MCProfileErrorDomain" code:1003 descriptionArray:v9 errorType:@"MCFatalError"];

  return v10;
}

- (id)_unsupportedValueErrorWithFieldName:(id)a3 value:(id)a4
{
  v8 = (void *)MEMORY[0x1E4F28C58];
  v9 = MCErrorArray(@"ERROR_PROFILE_FIELD_INVALID_VALUE_P_FIELD_P_VALUE", (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7, a3);
  v10 = [v8 MCErrorWithDomain:@"MCProfileErrorDomain" code:1010 descriptionArray:v9 errorType:@"MCFatalError"];

  return v10;
}

- (MCProfileServiceProfile)initWithDictionary:(id)a3 signerCerts:(id)a4 allowEmptyPayload:(BOOL)a5 outError:(id *)a6
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v54.receiver = self;
  v54.super_class = (Class)MCProfileServiceProfile;
  v10 = [(MCProfile *)&v54 initWithDictionary:v9 signerCerts:a4 allowEmptyPayload:1 outError:a6];
  if (!v10) {
    goto LABEL_24;
  }
  id v53 = 0;
  v11 = +[MCProfile removeRequiredObjectInDictionary:v9 key:@"PayloadContent" type:objc_opt_class() errorDomain:@"MCProfileErrorDomain" missingDataCode:1002 missingDataErrorString:@"ERROR_PROFILE_REQUIRED_FIELD_MISSING_P_FIELD" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v53];
  v12 = (char *)v53;
  if ([(MCProfile *)v10 isStub])
  {
    if (v12) {
      goto LABEL_12;
    }
    id v52 = 0;
    uint64_t v13 = +[MCProfile removeOptionalObjectInDictionary:v11 key:@"EnrollmentIdentityPersistentID" type:objc_opt_class() errorDomain:@"MCProfileErrorDomain" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v52];
    v12 = (char *)v52;
    enrollmentIdentityPersistentID = v10->_enrollmentIdentityPersistentID;
    v10->_enrollmentIdentityPersistentID = (NSData *)v13;

    if (v12) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v15 = [v11 objectForKey:@"Challenge"];
    id challenge = v10->_challenge;
    v10->_id challenge = (id)v15;

    [v11 removeObjectForKey:@"Challenge"];
    if (v10->_challenge)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v22 = [(MCProfileServiceProfile *)v10 _badDataTypeErrorWithFieldName:@"Challenge"];
          goto LABEL_18;
        }
      }
    }
    if (v12) {
      goto LABEL_12;
    }
  }
  id v51 = 0;
  uint64_t v17 = +[MCProfile removeRequiredNonZeroLengthStringInDictionary:v11 key:@"URL" errorDomain:@"MCProfileErrorDomain" missingDataCode:1002 missingDataErrorString:@"ERROR_PROFILE_REQUIRED_FIELD_MISSING_P_FIELD" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v51];
  v12 = (char *)v51;
  URLString = v10->_URLString;
  v10->_URLString = (NSString *)v17;

  if (!v12)
  {
    id v50 = 0;
    uint64_t v19 = +[MCProfile removeOptionalObjectInDictionary:v11 key:@"DeviceAttributes" type:objc_opt_class() errorDomain:@"MCProfileErrorDomain" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v50];
    v12 = (char *)v50;
    deviceAttributes = v10->_deviceAttributes;
    v10->_deviceAttributes = (NSArray *)v19;

    if (!v12)
    {
      id v49 = 0;
      v21 = +[MCProfile removeOptionalObjectInDictionary:v11 key:@"ConfirmInstallation" type:objc_opt_class() errorDomain:@"MCProfileErrorDomain" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v49];
      v12 = (char *)v49;
      goto LABEL_13;
    }
  }
LABEL_12:
  v21 = 0;
LABEL_13:
  v10->_confirmInstallation = [v21 BOOLValue];
  if (v12)
  {
    v22 = v12;
  }
  else
  {
    id v48 = 0;
    uint64_t v23 = +[MCProfile removeOptionalObjectInDictionary:v11 key:@"SupportedServerVersion" type:objc_opt_class() errorDomain:@"MCProfileErrorDomain" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v48];
    v22 = (char *)v48;

    v21 = (char *)v23;
  }
  v10->_supportedServerVersion = [v21 BOOLValue];
  if (!v22)
  {
    v33 = v10->_deviceAttributes;
    if (v33)
    {
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      v34 = v33;
      v22 = (char *)[(NSArray *)v34 countByEnumeratingWithState:&v44 objects:v59 count:16];
      if (v22)
      {
        v43 = a6;
        uint64_t v35 = *(void *)v45;
        while (2)
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(void *)v45 != v35) {
              objc_enumerationMutation(v34);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v22 = [(MCProfileServiceProfile *)v10 _badDataTypeErrorWithFieldName:@"DeviceAttributes"];
              goto LABEL_37;
            }
          }
          v22 = (char *)[(NSArray *)v34 countByEnumeratingWithState:&v44 objects:v59 count:16];
          if (v22) {
            continue;
          }
          break;
        }
LABEL_37:
        a6 = v43;
      }
    }
    else
    {
      v22 = 0;
    }
    if ([v11 count])
    {
      v37 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        v38 = v37;
        v39 = [(MCProfile *)v10 friendlyName];
        *(_DWORD *)buf = 138543618;
        v56 = v39;
        __int16 v57 = 2114;
        id v58 = v11;
        _os_log_impl(&dword_1A13F0000, v38, OS_LOG_TYPE_INFO, "PayloadContent for profile “%{public}@” has entries that are being ignored. They are:%{public}@", buf, 0x16u);
      }
    }
    if ([v9 count])
    {
      v40 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        v41 = v40;
        v42 = [(MCProfile *)v10 friendlyName];
        *(_DWORD *)buf = 138543618;
        v56 = v42;
        __int16 v57 = 2114;
        id v58 = v9;
        _os_log_impl(&dword_1A13F0000, v41, OS_LOG_TYPE_INFO, "Profile “%{public}@” has entries that are being ignored. They are:%{public}@", buf, 0x16u);
      }
    }
  }
  v12 = v21;
LABEL_18:

  if (!v22)
  {
LABEL_24:
    v31 = v10;
    goto LABEL_25;
  }
  v24 = [(MCProfile *)v10 malformedProfileErrorWithError:v22];
  v25 = v24;
  if (a6) {
    *a6 = v24;
  }
  v26 = (void *)_MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    v27 = v26;
    v28 = objc_opt_class();
    id v29 = v28;
    v30 = [v25 MCVerboseDescription];
    *(_DWORD *)buf = 138543618;
    v56 = v28;
    __int16 v57 = 2114;
    id v58 = v30;
    _os_log_impl(&dword_1A13F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse profile: %{public}@", buf, 0x16u);
  }
  v31 = 0;
LABEL_25:

  return v31;
}

- (id)localizedPayloadSummaryByType
{
  v2 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v3 = MCLocalizedString(@"DEVICE_ENROLLMENT_CHALLENGE");
  uint64_t v4 = [v2 arrayWithObject:v3];

  return v4;
}

- (id)payloads
{
  bogusPayloads = self->_bogusPayloads;
  if (!bogusPayloads)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v5 = [[MCEncryptedProfileServicePayload alloc] initWithURLString:self->_URLString profile:self];
    uint64_t v6 = [v4 arrayWithObject:v5];
    uint64_t v7 = self->_bogusPayloads;
    self->_bogusPayloads = v6;

    bogusPayloads = self->_bogusPayloads;
  }
  return bogusPayloads;
}

- (id)stubDictionary
{
  v7.receiver = self;
  v7.super_class = (Class)MCProfileServiceProfile;
  uint64_t v3 = [(MCProfile *)&v7 stubDictionary];
  [v3 setObject:@"Profile Service" forKey:@"PayloadType"];
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  [v4 MCSetObjectIfNotNil:self->_URLString forKey:@"URL"];
  [v4 MCSetObjectIfNotNil:self->_deviceAttributes forKey:@"DeviceAttributes"];
  [v4 MCSetObjectIfNotNil:self->_enrollmentIdentityPersistentID forKey:@"EnrollmentIdentityPersistentID"];
  uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_confirmInstallation];
  [v4 setObject:v5 forKey:@"ConfirmInstallation"];

  [v3 setObject:v4 forKey:@"PayloadContent"];
  return v3;
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)MCProfileServiceProfile;
  uint64_t v3 = [(MCProfile *)&v9 description];
  uint64_t v4 = (void *)[v3 mutableCopy];

  if (self->_URLString) {
    [v4 appendFormat:@"URL         : %@\n", self->_URLString];
  }
  deviceAttributes = self->_deviceAttributes;
  if (deviceAttributes)
  {
    uint64_t v6 = [(NSArray *)deviceAttributes componentsJoinedByString:@", "];
    [v4 appendFormat:@"Device Attr : %@\n", v6];
  }
  if (self->_challenge) {
    [v4 appendFormat:@"Challenge   : (present)\n"];
  }
  if (self->_enrollmentIdentityPersistentID) {
    [v4 appendFormat:@"Cert Persist: %@\n", self->_enrollmentIdentityPersistentID];
  }
  objc_super v7 = MCStringForBool(self->_confirmInstallation);
  [v4 appendFormat:@"Confirm     : %@", v7];

  return v4;
}

- (id)serializedDictionary
{
  v10.receiver = self;
  v10.super_class = (Class)MCProfileServiceProfile;
  uint64_t v3 = [(MCProfile *)&v10 serializedDictionary];
  uint64_t v4 = (void *)[v3 mutableCopy];

  URLString = self->_URLString;
  if (URLString) {
    [v4 setObject:URLString forKeyedSubscript:@"URL"];
  }
  deviceAttributes = self->_deviceAttributes;
  if (deviceAttributes) {
    [v4 setObject:deviceAttributes forKeyedSubscript:@"Device Attributes"];
  }
  if (self->_challenge) {
    [v4 setObject:@"(present)" forKeyedSubscript:@"Challenge"];
  }
  enrollmentIdentityPersistentID = self->_enrollmentIdentityPersistentID;
  if (enrollmentIdentityPersistentID) {
    [v4 setObject:enrollmentIdentityPersistentID forKeyedSubscript:@"Cert Persist"];
  }
  v8 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_confirmInstallation];
  [v4 setObject:v8 forKeyedSubscript:@"Confirm"];

  return v4;
}

- (NSString)URLString
{
  return self->_URLString;
}

- (void)setURLString:(id)a3
{
}

- (NSArray)deviceAttributes
{
  return self->_deviceAttributes;
}

- (id)challenge
{
  return self->_challenge;
}

- (NSData)enrollmentIdentityPersistentID
{
  return self->_enrollmentIdentityPersistentID;
}

- (void)setEnrollmentIdentityPersistentID:(id)a3
{
}

- (BOOL)confirmInstallation
{
  return self->_confirmInstallation;
}

- (BOOL)supportedServerVersion
{
  return self->_supportedServerVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bogusPayloads, 0);
  objc_storeStrong((id *)&self->_enrollmentIdentityPersistentID, 0);
  objc_storeStrong(&self->_challenge, 0);
  objc_storeStrong((id *)&self->_deviceAttributes, 0);
  objc_storeStrong((id *)&self->_URLString, 0);
}

@end