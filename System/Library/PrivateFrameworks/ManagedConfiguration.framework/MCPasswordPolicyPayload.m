@interface MCPasswordPolicyPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (MCPasswordPolicyPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSNumber)isAlphanumericPasscodeRequired;
- (NSNumber)isManualFetchingWhenRoaming;
- (NSNumber)isPasscodeRequired;
- (NSNumber)isSimplePasscodeAllowed;
- (NSNumber)maxFailedAttempts;
- (NSNumber)maxGracePeriodMinutes;
- (NSNumber)maxInactivityMinutes;
- (NSNumber)maxPasscodeAgeDays;
- (NSNumber)minComplexCharacters;
- (NSNumber)minLength;
- (NSNumber)passcodeHistoryCount;
- (id)filterForUserEnrollmentOutError:(id *)a3;
- (id)payloadDescriptionKeyValueSections;
- (id)restrictions;
- (id)stubDictionary;
- (id)subtitle1Description;
- (id)title;
- (id)verboseDescription;
@end

@implementation MCPasswordPolicyPayload

+ (id)typeStrings
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithObject:@"com.apple.mobiledevice.passwordpolicy"];
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"PASSWORD_POLICY_DESCRIPTION_SINGULAR_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"PASSWORD_POLICY_DESCRIPTION_PLURAL_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCPasswordPolicyPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v57.receiver = self;
  v57.super_class = (Class)MCPasswordPolicyPayload;
  uint64_t v9 = [(MCPayload *)&v57 initWithDictionary:v8 profile:a4 outError:a5];
  if (v9)
  {
    id v56 = 0;
    uint64_t v10 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"allowSimple" isRequired:0 outError:&v56];
    id v11 = v56;
    isSimplePasscodeAllowed = v9->_isSimplePasscodeAllowed;
    v9->_isSimplePasscodeAllowed = (NSNumber *)v10;

    if (v11) {
      goto LABEL_16;
    }
    id v55 = 0;
    uint64_t v13 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"forcePIN" isRequired:0 outError:&v55];
    id v11 = v55;
    isPasscodeRequired = v9->_isPasscodeRequired;
    v9->_isPasscodeRequired = (NSNumber *)v13;

    if (v11) {
      goto LABEL_16;
    }
    id v54 = 0;
    uint64_t v15 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"requireAlphanumeric" isRequired:0 outError:&v54];
    id v11 = v54;
    isAlphanumericPasscodeRequired = v9->_isAlphanumericPasscodeRequired;
    v9->_isAlphanumericPasscodeRequired = (NSNumber *)v15;

    if (v11) {
      goto LABEL_16;
    }
    id v53 = 0;
    uint64_t v17 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"manualFetchingWhenRoaming" isRequired:0 outError:&v53];
    id v11 = v53;
    isManualFetchingWhenRoaming = v9->_isManualFetchingWhenRoaming;
    v9->_isManualFetchingWhenRoaming = (NSNumber *)v17;

    if (v11) {
      goto LABEL_16;
    }
    id v52 = 0;
    uint64_t v19 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"minLength" isRequired:0 outError:&v52];
    id v11 = v52;
    minLength = v9->_minLength;
    v9->_minLength = (NSNumber *)v19;

    if (v11) {
      goto LABEL_16;
    }
    id v51 = 0;
    uint64_t v21 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"maxFailedAttempts" isRequired:0 outError:&v51];
    id v11 = v51;
    maxFailedAttempts = v9->_maxFailedAttempts;
    v9->_maxFailedAttempts = (NSNumber *)v21;

    if (v11) {
      goto LABEL_16;
    }
    v23 = v9->_maxFailedAttempts;
    if (v23 && [(NSNumber *)v23 intValue] <= 1)
    {
      v24 = v9->_maxFailedAttempts;
      v9->_maxFailedAttempts = (NSNumber *)&unk_1EF4D0808;
    }
    id v50 = 0;
    uint64_t v25 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"maxGracePeriod" isRequired:0 outError:&v50];
    id v11 = v50;
    maxGracePeriodMinutes = v9->_maxGracePeriodMinutes;
    v9->_maxGracePeriodMinutes = (NSNumber *)v25;

    if (v11) {
      goto LABEL_16;
    }
    id v49 = 0;
    uint64_t v27 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"maxInactivity" isRequired:0 outError:&v49];
    id v11 = v49;
    maxInactivityMinutes = v9->_maxInactivityMinutes;
    v9->_maxInactivityMinutes = (NSNumber *)v27;

    if (v11) {
      goto LABEL_16;
    }
    id v48 = 0;
    uint64_t v29 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"maxPINAgeInDays" isRequired:0 outError:&v48];
    id v11 = v48;
    maxPasscodeAgeDays = v9->_maxPasscodeAgeDays;
    v9->_maxPasscodeAgeDays = (NSNumber *)v29;

    if (v11) {
      goto LABEL_16;
    }
    id v47 = 0;
    uint64_t v31 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"pinHistory" isRequired:0 outError:&v47];
    id v11 = v47;
    passcodeHistoryCount = v9->_passcodeHistoryCount;
    v9->_passcodeHistoryCount = (NSNumber *)v31;

    if (v11
      || (id v46 = 0,
          [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"minComplexChars" isRequired:0 outError:&v46], v33 = objc_claimAutoreleasedReturnValue(), id v11 = v46, minComplexCharacters = v9->_minComplexCharacters, v9->_minComplexCharacters = (NSNumber *)v33, minComplexCharacters, v11))
    {
LABEL_16:
      v35 = [(MCPayload *)v9 malformedPayloadErrorWithError:v11];
      v36 = v35;
      if (a5) {
        *a5 = v35;
      }
      v37 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v38 = v37;
        v39 = objc_opt_class();
        id v40 = v39;
        v41 = [v36 MCVerboseDescription];
        *(_DWORD *)buf = 138543618;
        v59 = v39;
        __int16 v60 = 2114;
        id v61 = v41;
        _os_log_impl(&dword_1A13F0000, v38, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
      }
      uint64_t v9 = 0;
    }
    else if ([v8 count])
    {
      v43 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        v44 = v43;
        v45 = [(MCPayload *)v9 friendlyName];
        *(_DWORD *)buf = 138543618;
        v59 = v45;
        __int16 v60 = 2114;
        id v61 = v8;
        _os_log_impl(&dword_1A13F0000, v44, OS_LOG_TYPE_INFO, "Payload “%{public}@” has fields that we are ignoring. They are: %{public}@", buf, 0x16u);
      }
    }
  }

  return v9;
}

- (id)stubDictionary
{
  v5.receiver = self;
  v5.super_class = (Class)MCPasswordPolicyPayload;
  uint64_t v3 = [(MCPayload *)&v5 stubDictionary];
  [v3 MCSetObjectIfNotNil:self->_isSimplePasscodeAllowed forKey:@"allowSimple"];
  [v3 MCSetObjectIfNotNil:self->_isPasscodeRequired forKey:@"forcePIN"];
  [v3 MCSetObjectIfNotNil:self->_isAlphanumericPasscodeRequired forKey:@"requireAlphanumeric"];
  [v3 MCSetObjectIfNotNil:self->_isManualFetchingWhenRoaming forKey:@"manualFetchingWhenRoaming"];
  [v3 MCSetObjectIfNotNil:self->_minLength forKey:@"minLength"];
  [v3 MCSetObjectIfNotNil:self->_maxFailedAttempts forKey:@"maxFailedAttempts"];
  [v3 MCSetObjectIfNotNil:self->_maxGracePeriodMinutes forKey:@"maxGracePeriod"];
  [v3 MCSetObjectIfNotNil:self->_maxInactivityMinutes forKey:@"maxInactivity"];
  [v3 MCSetObjectIfNotNil:self->_maxPasscodeAgeDays forKey:@"maxPINAgeInDays"];
  [v3 MCSetObjectIfNotNil:self->_passcodeHistoryCount forKey:@"pinHistory"];
  [v3 MCSetObjectIfNotNil:self->_minComplexCharacters forKey:@"minComplexChars"];
  return v3;
}

- (id)verboseDescription
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  v14.receiver = self;
  v14.super_class = (Class)MCPasswordPolicyPayload;
  uint64_t v4 = [(MCPayload *)&v14 verboseDescription];
  objc_super v5 = [v3 stringWithString:v4];

  if ([(NSNumber *)self->_isPasscodeRequired BOOLValue]) {
    [v5 appendFormat:@"- Passcode required\n"];
  }
  if ([(NSNumber *)self->_isSimplePasscodeAllowed BOOLValue]) {
    [v5 appendFormat:@"- Simple passcodes allowed\n"];
  }
  if ([(NSNumber *)self->_isAlphanumericPasscodeRequired BOOLValue]) {
    [v5 appendFormat:@"- Alphanumeric required\n"];
  }
  if ([(NSNumber *)self->_isManualFetchingWhenRoaming BOOLValue]) {
    [v5 appendFormat:@"- Manual fetching when roaming\n"];
  }
  minLength = self->_minLength;
  if (minLength) {
    objc_msgSend(v5, "appendFormat:", @"- Minimum length: %d\n", -[NSNumber intValue](minLength, "intValue"));
  }
  minComplexCharacters = self->_minComplexCharacters;
  if (minComplexCharacters) {
    objc_msgSend(v5, "appendFormat:", @"- Minimum complex chars: %d\n", -[NSNumber intValue](minComplexCharacters, "intValue"));
  }
  maxFailedAttempts = self->_maxFailedAttempts;
  if (maxFailedAttempts) {
    objc_msgSend(v5, "appendFormat:", @"- Max failed attempts: %d\n", -[NSNumber intValue](maxFailedAttempts, "intValue"));
  }
  maxGracePeriodMinutes = self->_maxGracePeriodMinutes;
  if (maxGracePeriodMinutes) {
    objc_msgSend(v5, "appendFormat:", @"- Max grace period: %d minutes\n", -[NSNumber intValue](maxGracePeriodMinutes, "intValue"));
  }
  maxInactivityMinutes = self->_maxInactivityMinutes;
  if (maxInactivityMinutes) {
    objc_msgSend(v5, "appendFormat:", @"- Max inactivity: %d minutes\n", -[NSNumber intValue](maxInactivityMinutes, "intValue"));
  }
  maxPasscodeAgeDays = self->_maxPasscodeAgeDays;
  if (maxPasscodeAgeDays) {
    objc_msgSend(v5, "appendFormat:", @"- Max passcode age: %d days\n", -[NSNumber intValue](maxPasscodeAgeDays, "intValue"));
  }
  passcodeHistoryCount = self->_passcodeHistoryCount;
  if (passcodeHistoryCount) {
    objc_msgSend(v5, "appendFormat:", @"- Passcode history: %d\n", -[NSNumber intValue](passcodeHistoryCount, "intValue"));
  }
  return v5;
}

- (id)title
{
  return MCLocalizedString(@"PASSCODE_TITLE");
}

- (id)subtitle1Description
{
  uint64_t v2 = [(MCPasswordPolicyPayload *)self restrictions];
  uint64_t v3 = +[MCPasscodeManager localizedDescriptionOfPasscodePolicyFromRestrictions:v2];

  return v3;
}

- (id)payloadDescriptionKeyValueSections
{
  v80[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MCPasswordPolicyPayload *)self restrictions];
  uint64_t v4 = +[MCRestrictionManager sharedManager];
  objc_super v5 = [v4 defaultRestrictions];
  uint64_t v6 = +[MCRestrictionManager filterRestrictionDictionary:v3 toIncludeOnlyRestrictionsThatDifferFromRestrictions:v5];

  uint64_t v7 = objc_opt_new();
  if (+[MCRestrictionManager restrictedBoolForFeature:@"forcePIN" withRestrictionsDictionary:v6] == 1)
  {
    id v8 = [MCKeyValue alloc];
    uint64_t v9 = MCLocalizedStringForBool(1);
    uint64_t v10 = MCLocalizedString(@"PASSCODE_REQUIRED");
    id v11 = [(MCKeyValue *)v8 initWithLocalizedString:v9 localizedKey:v10];

    [v7 addObject:v11];
  }
  BOOL v12 = +[MCRestrictionManager restrictedBoolForFeature:@"allowSimple" withRestrictionsDictionary:v6] != 2;
  uint64_t v13 = [MCKeyValue alloc];
  objc_super v14 = MCLocalizedStringForBool(v12);
  uint64_t v15 = MCLocalizedString(@"SIMPLE_PASSCODES_ALLOWED");
  uint64_t v16 = [(MCKeyValue *)v13 initWithLocalizedString:v14 localizedKey:v15];

  v79 = (void *)v16;
  [v7 addObject:v16];
  if (+[MCRestrictionManager restrictedBoolForFeature:@"requireAlphanumeric" withRestrictionsDictionary:v6] == 1)
  {
    uint64_t v17 = [MCKeyValue alloc];
    v18 = MCLocalizedStringForBool(1);
    uint64_t v19 = MCLocalizedString(@"ALPHANUMERIC_PASSCODE_REQUIRED");
    v20 = [(MCKeyValue *)v17 initWithLocalizedString:v18 localizedKey:v19];

    [v7 addObject:v20];
  }
  uint64_t v21 = [(MCPasswordPolicyPayload *)self isManualFetchingWhenRoaming];

  if (v21)
  {
    v22 = [MCKeyValue alloc];
    v23 = [(MCPasswordPolicyPayload *)self isManualFetchingWhenRoaming];
    v24 = MCLocalizedStringForBool([v23 BOOLValue]);
    uint64_t v25 = MCLocalizedString(@"MANUAL_FETCHING_WHEN_ROAMING");
    v26 = [(MCKeyValue *)v22 initWithLocalizedString:v24 localizedKey:v25];

    [v7 addObject:v26];
  }
  uint64_t v27 = +[MCRestrictionManager valueForFeature:@"minLength" withRestrictionsDictionary:v6];
  v28 = v27;
  if (v27 && (int)[v27 intValue] >= 1)
  {
    uint64_t v29 = [MCKeyValue alloc];
    v30 = MCFormattedStringForNumber(v28);
    uint64_t v31 = MCLocalizedString(@"MINIMUM_PASSCODE_LENGTH_REQUIRED");
    v32 = [(MCKeyValue *)v29 initWithLocalizedString:v30 localizedKey:v31];

    [v7 addObject:v32];
  }
  v78 = v28;
  uint64_t v33 = +[MCRestrictionManager valueForFeature:@"minComplexChars" withRestrictionsDictionary:v6];
  v34 = v33;
  if (v33 && (int)[v33 intValue] >= 1)
  {
    v35 = [MCKeyValue alloc];
    v36 = MCFormattedStringForNumber(v34);
    v37 = MCLocalizedString(@"MINIMUM_PASSCODE_COMPLEX_CHARACTERS");
    v38 = [(MCKeyValue *)v35 initWithLocalizedString:v36 localizedKey:v37];

    [v7 addObject:v38];
  }
  v77 = v34;
  v39 = +[MCRestrictionManager valueForFeature:@"maxFailedAttempts" withRestrictionsDictionary:v6];
  id v40 = v39;
  if (v39 && (int)[v39 intValue] >= 1)
  {
    v41 = [MCKeyValue alloc];
    v42 = MCFormattedStringForNumber(v40);
    v43 = MCLocalizedString(@"MAXIMUM_PASSCODE_FAILED_ATTEMPTS");
    v44 = [(MCKeyValue *)v41 initWithLocalizedString:v42 localizedKey:v43];

    [v7 addObject:v44];
  }
  v45 = +[MCRestrictionManager valueForFeature:@"maxGracePeriod", v6, v40 withRestrictionsDictionary];
  if (v45)
  {
    id v46 = +[MCHacks sharedHacks];
    id v47 = [v46 quantizedGracePeriodInSeconds:v45];

    unint64_t v48 = [v47 unsignedIntegerValue];
    if (v48) {
      MCFormattedStringForTimeInterval((double)v48);
    }
    else {
    id v49 = MCLocalizedString(@"IMMEDIATELY");
    }
    id v50 = [MCKeyValue alloc];
    id v51 = MCLocalizedString(@"MAXIMUM_PASSCODE_GRACE_PERIOD");
    id v52 = [(MCKeyValue *)v50 initWithLocalizedString:v49 localizedKey:v51];

    [v7 addObject:v52];
  }
  else
  {
    id v49 = 0;
  }
  id v53 = +[MCRestrictionManager valueForFeature:@"maxInactivity" withRestrictionsDictionary:v6];
  if (v53)
  {
    id v54 = +[MCHacks sharedHacks];
    id v55 = [v54 quantizedAutoLockInSeconds:v53];

    double v56 = (double)(unint64_t)[v55 unsignedIntegerValue];
    if (v56 < 60.0) {
      double v56 = 60.0;
    }
    uint64_t v57 = MCFormattedStringForTimeInterval(v56);

    v58 = [MCKeyValue alloc];
    v59 = MCLocalizedString(@"MAXIMUM_PASSCODE_INACTIVITY");
    __int16 v60 = [(MCKeyValue *)v58 initWithLocalizedString:v57 localizedKey:v59];

    [v7 addObject:v60];
    id v49 = (void *)v57;
  }
  id v61 = +[MCRestrictionManager valueForFeature:@"maxPINAgeInDays" withRestrictionsDictionary:v6];
  uint64_t v62 = v61;
  if (v61 && (int)[v61 intValue] >= 1)
  {
    uint64_t v63 = MCFormattedStringForTimeInterval((double)(unint64_t)(86400 * [v62 unsignedIntegerValue]));

    v64 = [MCKeyValue alloc];
    v65 = MCLocalizedString(@"MAXIMUM_PASSCODE_AGE");
    v66 = [(MCKeyValue *)v64 initWithLocalizedString:v63 localizedKey:v65];

    [v7 addObject:v66];
    id v49 = (void *)v63;
  }
  v67 = +[MCRestrictionManager valueForFeature:@"pinHistory" withRestrictionsDictionary:v6];
  v68 = v67;
  if (v67 && ([v67 intValue] & 0x80000000) == 0)
  {
    uint64_t v69 = MCFormattedStringForNumber(v68);

    v70 = [MCKeyValue alloc];
    v71 = MCLocalizedString(@"PASSCODE_HISTORY");
    v72 = [(MCKeyValue *)v70 initWithLocalizedString:v69 localizedKey:v71];

    [v7 addObject:v72];
    id v49 = (void *)v69;
  }
  v73 = +[MCKeyValueSection sectionWithKeyValues:v7];
  v80[0] = v73;
  v74 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:1];

  return v74;
}

- (id)restrictions
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = [(MCPasswordPolicyPayload *)self isSimplePasscodeAllowed];

  if (v4)
  {
    objc_super v5 = [(MCPasswordPolicyPayload *)self isSimplePasscodeAllowed];
    objc_msgSend(v3, "MCSetBoolRestriction:value:", @"allowSimple", objc_msgSend(v5, "BOOLValue"));
  }
  uint64_t v6 = [(MCPasswordPolicyPayload *)self isPasscodeRequired];

  if (v6)
  {
    uint64_t v7 = [(MCPasswordPolicyPayload *)self isPasscodeRequired];
    objc_msgSend(v3, "MCSetBoolRestriction:value:", @"forcePIN", objc_msgSend(v7, "BOOLValue"));
  }
  id v8 = [(MCPasswordPolicyPayload *)self isAlphanumericPasscodeRequired];

  if (v8)
  {
    uint64_t v9 = [(MCPasswordPolicyPayload *)self isAlphanumericPasscodeRequired];
    objc_msgSend(v3, "MCSetBoolRestriction:value:", @"requireAlphanumeric", objc_msgSend(v9, "BOOLValue"));
  }
  uint64_t v10 = [(MCPasswordPolicyPayload *)self minLength];
  [v3 MCSetValueRestriction:@"minLength" value:v10];

  id v11 = [(MCPasswordPolicyPayload *)self maxFailedAttempts];
  [v3 MCSetValueRestriction:@"maxFailedAttempts" value:v11];

  BOOL v12 = [(MCPasswordPolicyPayload *)self maxGracePeriodMinutes];

  if (v12)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F28ED0];
    objc_super v14 = [(MCPasswordPolicyPayload *)self maxGracePeriodMinutes];
    uint64_t v15 = objc_msgSend(v13, "numberWithInt:", 60 * objc_msgSend(v14, "intValue"));
    [v3 MCSetValueRestriction:@"maxGracePeriod" value:v15];
  }
  uint64_t v16 = [(MCPasswordPolicyPayload *)self maxInactivityMinutes];

  if (v16)
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F28ED0];
    v18 = [(MCPasswordPolicyPayload *)self maxInactivityMinutes];
    uint64_t v19 = objc_msgSend(v17, "numberWithInt:", 60 * objc_msgSend(v18, "intValue"));
    [v3 MCSetValueRestriction:@"maxInactivity" value:v19];
  }
  v20 = [(MCPasswordPolicyPayload *)self maxPasscodeAgeDays];
  [v3 MCSetValueRestriction:@"maxPINAgeInDays" value:v20];

  uint64_t v21 = [(MCPasswordPolicyPayload *)self passcodeHistoryCount];
  [v3 MCSetValueRestriction:@"pinHistory" value:v21];

  v22 = [(MCPasswordPolicyPayload *)self minComplexCharacters];
  [v3 MCSetValueRestriction:@"minComplexChars" value:v22];

  v23 = (void *)[v3 copy];
  return v23;
}

- (id)filterForUserEnrollmentOutError:(id *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MCPasswordPolicyPayload *)self stubDictionary];
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  objc_super v5 = [v3 allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if (([v10 hasPrefix:@"Payload"] & 1) == 0
          && ([v10 isEqualToString:@"PersistentResourceID"] & 1) == 0
          && ([v10 isEqualToString:@"maxInactivity"] & 1) == 0)
        {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v7);
  }

  [v3 removeObjectsForKeys:v4];
  id v11 = [MEMORY[0x1E4F28ED0] numberWithBool:0];
  [v3 setObject:v11 forKeyedSubscript:@"allowSimple"];

  [v3 setObject:&unk_1EF4D0820 forKeyedSubscript:@"minLength"];
  BOOL v12 = [v3 objectForKeyedSubscript:@"maxInactivity"];

  if (v12) {
    [v3 setObject:&unk_1EF4D0838 forKeyedSubscript:@"maxInactivity"];
  }
  uint64_t v13 = [MCPasswordPolicyPayload alloc];
  objc_super v14 = [(MCPayload *)self profile];
  id v24 = 0;
  uint64_t v15 = [(MCPasswordPolicyPayload *)v13 initWithDictionary:v3 profile:v14 outError:&v24];
  id v16 = v24;

  if (v16)
  {
    uint64_t v17 = 0;
    if (a3) {
      *a3 = v16;
    }
  }
  else
  {
    if ([v4 count])
    {
      [v4 sortUsingComparator:&__block_literal_global_13];
      v18 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = v18;
        v20 = [(MCPayload *)self friendlyName];
        *(_DWORD *)buf = 138543618;
        v30 = v20;
        __int16 v31 = 2114;
        v32 = v4;
        _os_log_impl(&dword_1A13F0000, v19, OS_LOG_TYPE_INFO, "Payload “%{public}@” has keys that we are ignoring. They are: %{public}@", buf, 0x16u);
      }
    }
    uint64_t v17 = v15;
  }

  return v17;
}

uint64_t __59__MCPasswordPolicyPayload_filterForUserEnrollmentOutError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 compare:a3 options:1];
}

- (NSNumber)isSimplePasscodeAllowed
{
  return self->_isSimplePasscodeAllowed;
}

- (NSNumber)isPasscodeRequired
{
  return self->_isPasscodeRequired;
}

- (NSNumber)isAlphanumericPasscodeRequired
{
  return self->_isAlphanumericPasscodeRequired;
}

- (NSNumber)isManualFetchingWhenRoaming
{
  return self->_isManualFetchingWhenRoaming;
}

- (NSNumber)minLength
{
  return self->_minLength;
}

- (NSNumber)maxFailedAttempts
{
  return self->_maxFailedAttempts;
}

- (NSNumber)maxGracePeriodMinutes
{
  return self->_maxGracePeriodMinutes;
}

- (NSNumber)maxInactivityMinutes
{
  return self->_maxInactivityMinutes;
}

- (NSNumber)passcodeHistoryCount
{
  return self->_passcodeHistoryCount;
}

- (NSNumber)maxPasscodeAgeDays
{
  return self->_maxPasscodeAgeDays;
}

- (NSNumber)minComplexCharacters
{
  return self->_minComplexCharacters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minComplexCharacters, 0);
  objc_storeStrong((id *)&self->_passcodeHistoryCount, 0);
  objc_storeStrong((id *)&self->_maxPasscodeAgeDays, 0);
  objc_storeStrong((id *)&self->_maxInactivityMinutes, 0);
  objc_storeStrong((id *)&self->_maxGracePeriodMinutes, 0);
  objc_storeStrong((id *)&self->_maxFailedAttempts, 0);
  objc_storeStrong((id *)&self->_minLength, 0);
  objc_storeStrong((id *)&self->_isManualFetchingWhenRoaming, 0);
  objc_storeStrong((id *)&self->_isAlphanumericPasscodeRequired, 0);
  objc_storeStrong((id *)&self->_isPasscodeRequired, 0);
  objc_storeStrong((id *)&self->_isSimplePasscodeAllowed, 0);
}

@end