@interface MCAirPlaySecurityPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (MCAirPlaySecurityPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSString)accessType;
- (NSString)password;
- (NSString)securityType;
- (id)stubDictionary;
- (id)subtitle1Description;
- (id)subtitle1Label;
- (id)subtitle2Description;
- (id)subtitle2Label;
- (id)verboseDescription;
- (void)setAccessType:(id)a3;
- (void)setPassword:(id)a3;
- (void)setSecurityType:(id)a3;
@end

@implementation MCAirPlaySecurityPayload

+ (id)typeStrings
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.airplay.security";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"AIRPLAY_SECURITY_SINGULAR", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"AIRPLAY_SECURITY_", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCAirPlaySecurityPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  v43[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v36.receiver = self;
  v36.super_class = (Class)MCAirPlaySecurityPayload;
  uint64_t v9 = [(MCPayload *)&v36 initWithDictionary:v8 profile:a4 outError:a5];
  if (!v9) {
    goto LABEL_19;
  }
  id v35 = 0;
  v10 = +[MCProfile removeRequiredObjectInDictionary:v8 key:@"AccessType" type:objc_opt_class() errorDomain:@"MCPayloadErrorDomain" missingDataCode:2002 missingDataErrorString:@"ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v35];
  id v11 = v35;
  if (v11)
  {
    v12 = v11;
LABEL_8:

LABEL_9:
    v16 = [(MCPayload *)v9 malformedPayloadErrorWithError:v12];
    v10 = v16;
    if (a5) {
      *a5 = v16;
    }
    v17 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v18 = v17;
      v19 = objc_opt_class();
      id v20 = v19;
      v21 = [v10 MCVerboseDescription];
      *(_DWORD *)buf = 138543618;
      v38 = v19;
      __int16 v39 = 2114;
      id v40 = v21;
      _os_log_impl(&dword_1A13F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
    }
    uint64_t v9 = 0;
    goto LABEL_14;
  }
  v43[0] = @"ANY";
  v43[1] = @"WIFI_ONLY";
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
  id v34 = 0;
  +[MCProfile checkString:v10 isOneOfStrings:v13 key:@"AccessType" errorDomain:@"MCPayloadErrorDomain" errorCode:2004 errorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v34];
  id v14 = v34;
  if (v14)
  {
LABEL_5:
    v12 = v14;

    goto LABEL_8;
  }
  [(MCAirPlaySecurityPayload *)v9 setAccessType:v10];

  id v33 = 0;
  v10 = +[MCProfile removeRequiredObjectInDictionary:v8 key:@"SecurityType" type:objc_opt_class() errorDomain:@"MCPayloadErrorDomain" missingDataCode:2002 missingDataErrorString:@"ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v33];
  id v15 = v33;
  if (v15) {
    goto LABEL_7;
  }
  v26 = [(MCAirPlaySecurityPayload *)v9 accessType];
  int v27 = [v26 isEqualToString:@"ANY"];

  if (v27)
  {
    v42 = @"NONE";
    v28 = &v42;
  }
  else
  {
    v41 = @"NONE";
    v28 = &v41;
  }
  v28[1] = @"PASSCODE_ONCE";
  v28[2] = @"PASSCODE_ALWAYS";
  v28[3] = @"PASSWORD";
  v13 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:");
  id v32 = 0;
  +[MCProfile checkString:v10 isOneOfStrings:v13 key:@"SecurityType" errorDomain:@"MCPayloadErrorDomain" errorCode:2004 errorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v32];
  id v14 = v32;
  if (v14) {
    goto LABEL_5;
  }
  [(MCAirPlaySecurityPayload *)v9 setSecurityType:v10];

  id v31 = 0;
  v10 = +[MCProfile removeOptionalNonZeroLengthStringInDictionary:v8 key:@"Password" errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v31];
  id v15 = v31;
  if (v15)
  {
LABEL_7:
    v12 = v15;
    goto LABEL_8;
  }
  v29 = [(MCAirPlaySecurityPayload *)v9 securityType];
  if (![v29 isEqual:@"PASSWORD"])
  {

    goto LABEL_30;
  }
  uint64_t v30 = [v10 length];

  if (v30)
  {
LABEL_30:
    [(MCAirPlaySecurityPayload *)v9 setPassword:v10];
    v12 = 0;
LABEL_14:

    goto LABEL_15;
  }
  v12 = +[MCPayload badFieldValueErrorWithField:@"Password"];

  if (v12) {
    goto LABEL_9;
  }
LABEL_15:
  if ([v8 count])
  {
    v22 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v23 = v22;
      v24 = [(MCPayload *)v9 friendlyName];
      *(_DWORD *)buf = 138543618;
      v38 = v24;
      __int16 v39 = 2114;
      id v40 = v8;
      _os_log_impl(&dword_1A13F0000, v23, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);
    }
  }

LABEL_19:
  return v9;
}

- (id)stubDictionary
{
  v9.receiver = self;
  v9.super_class = (Class)MCAirPlaySecurityPayload;
  uint64_t v3 = [(MCPayload *)&v9 stubDictionary];
  uint64_t v4 = v3;
  accessType = self->_accessType;
  if (accessType) {
    [v3 setObject:accessType forKey:@"AccessType"];
  }
  securityType = self->_securityType;
  if (securityType) {
    [v4 setObject:securityType forKey:@"SecurityType"];
  }
  password = self->_password;
  if (password) {
    [v4 setObject:password forKey:@"Password"];
  }
  return v4;
}

- (id)subtitle1Label
{
  return MCLocalizedString(@"AIRPLAY_SECURITY_ACCESS_TITLE_COLON");
}

- (id)subtitle1Description
{
  if ([(NSString *)self->_accessType isEqualToString:@"ANY"])
  {
    uint64_t v3 = MCLocalizedString(@"AIRPLAY_SECURITY_ACCESS_ANY");
  }
  else if ([(NSString *)self->_accessType isEqualToString:@"WIFI_ONLY"])
  {
    uint64_t v4 = [@"AIRPLAY_SECURITY_ACCESS_WIFI" MCAppendGreenteaSuffix];
    uint64_t v3 = MCLocalizedString(v4);
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (id)subtitle2Label
{
  return MCLocalizedString(@"AIRPLAY_SECURITY_TITLE_COLON");
}

- (id)subtitle2Description
{
  if ([(NSString *)self->_securityType isEqualToString:@"NONE"])
  {
    uint64_t v3 = @"AIRPLAY_SECURITY_TYPE_NONE";
LABEL_9:
    uint64_t v4 = MCLocalizedString(v3);
    goto LABEL_10;
  }
  if ([(NSString *)self->_securityType isEqualToString:@"PASSCODE_ONCE"])
  {
    uint64_t v3 = @"AIRPLAY_SECURITY_TYPE_ONCE";
    goto LABEL_9;
  }
  if ([(NSString *)self->_securityType isEqualToString:@"PASSCODE_ALWAYS"])
  {
    uint64_t v3 = @"AIRPLAY_SECURITY_TYPE_ALWAYS";
    goto LABEL_9;
  }
  if ([(NSString *)self->_securityType isEqualToString:@"PASSWORD"])
  {
    uint64_t v3 = @"AIRPLAY_SECURITY_TYPE_PASSWORD";
    goto LABEL_9;
  }
  uint64_t v4 = 0;
LABEL_10:
  return v4;
}

- (id)verboseDescription
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  v7.receiver = self;
  v7.super_class = (Class)MCAirPlaySecurityPayload;
  uint64_t v4 = [(MCPayload *)&v7 verboseDescription];
  uint64_t v5 = [v3 stringWithString:v4];

  [v5 appendFormat:@"AirPlay Security: %@ (%@)\n", self->_securityType, self->_accessType];
  return v5;
}

- (NSString)accessType
{
  return self->_accessType;
}

- (void)setAccessType:(id)a3
{
}

- (NSString)securityType
{
  return self->_securityType;
}

- (void)setSecurityType:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_securityType, 0);
  objc_storeStrong((id *)&self->_accessType, 0);
}

@end