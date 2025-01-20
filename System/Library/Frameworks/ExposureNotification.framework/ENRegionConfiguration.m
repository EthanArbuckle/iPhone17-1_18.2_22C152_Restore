@interface ENRegionConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)everStartedOnboarding;
- (BOOL)isEqual:(id)a3;
- (ENRegion)region;
- (ENRegionConfiguration)initWithCoder:(id)a3;
- (ENRegionConfiguration)initWithVersion:(unint64_t)a3 region:(id)a4;
- (ENRegionUserConsent)userConsent;
- (ENUserAuthorization)diagnosisKeysPreAuthorization;
- (double)consentTimestamp;
- (double)creationDateTimeInterval;
- (double)differentialPrivacyConsentTimestamp;
- (double)lastConfigurationUpdateTimeInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)updatedWithConfiguration:(id)a3;
- (int64_t)consent;
- (int64_t)differentialPrivacyConsent;
- (int64_t)travelerModeEnabled;
- (unint64_t)enRampMode;
- (unint64_t)enVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setCreationDateTimeInterval:(double)a3;
- (void)setDiagnosisKeysPreAuthorization:(id)a3;
- (void)setEnRampMode:(unint64_t)a3;
- (void)setEnVersion:(unint64_t)a3;
- (void)setEverStartedOnboarding:(BOOL)a3;
- (void)setLastConfigurationUpdateTimeInterval:(double)a3;
- (void)setRegion:(id)a3;
- (void)setTravelerModeEnabled:(int64_t)a3;
- (void)setUserConsent:(id)a3;
@end

@implementation ENRegionConfiguration

- (id)description
{
  v3 = NSString;
  v4 = [(ENRegionConfiguration *)self region];
  v5 = [v4 regionCode];
  unint64_t v6 = [(ENRegionConfiguration *)self enVersion];
  v7 = [(ENRegionConfiguration *)self userConsent];
  [(ENRegionConfiguration *)self creationDateTimeInterval];
  uint64_t v9 = v8;
  [(ENRegionConfiguration *)self lastConfigurationUpdateTimeInterval];
  uint64_t v11 = v10;
  BOOL v12 = [(ENRegionConfiguration *)self everStartedOnboarding];
  unint64_t v13 = [(ENRegionConfiguration *)self travelerModeEnabled];
  if (v13 > 2) {
    v14 = "?";
  }
  else {
    v14 = (&off_2642452C8)[v13];
  }
  if (v12) {
    v15 = "yes";
  }
  else {
    v15 = "no";
  }
  if (v7) {
    v16 = v7;
  }
  else {
    v16 = @"Unknown";
  }
  v17 = [v3 stringWithFormat:@"System - %@, version: %lu, %@, createdOn: %f, lastUpdated: %f, EverOnbrd: %s, Traveler %s, rampMode: %lu", v5, v6, v16, v9, v11, v15, v14, -[ENRegionConfiguration enRampMode](self, "enRampMode")];

  return v17;
}

- (ENRegionConfiguration)initWithVersion:(unint64_t)a3 region:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ENRegionConfiguration;
  uint64_t v8 = [(ENRegionConfiguration *)&v13 init];
  uint64_t v9 = v8;
  if (v8)
  {
    v8->_enVersion = a3;
    objc_storeStrong((id *)&v8->_region, a4);
    uint64_t v10 = [MEMORY[0x263EFF910] date];
    [v10 timeIntervalSince1970];
    v9->_creationDateTimeInterval = v11;
  }
  return v9;
}

- (ENRegionConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ENRegionConfiguration;
  v5 = [(ENRegionConfiguration *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeInt64ForKey:@"enVersion"];
    v5->_enVersion = v6;
    if (v6 == 2)
    {
      uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userConsent"];
      if (!v7)
      {
        if (gLogCategory_ENRegionConfiguration > 90
          || gLogCategory_ENRegionConfiguration == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_25;
        }
        goto LABEL_21;
      }
      userConsent = v5->_userConsent;
      v5->_userConsent = (ENRegionUserConsent *)v7;
    }
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"region"];
    if (v9)
    {
      uint64_t v10 = v9;
      objc_storeStrong((id *)&v5->_region, v9);
      uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"diagnosisKeysPreAuthorization"];
      diagnosisKeysPreAuthorization = v5->_diagnosisKeysPreAuthorization;
      v5->_diagnosisKeysPreAuthorization = (ENUserAuthorization *)v11;

      v5->_everStartedOnboarding = [v4 decodeBoolForKey:@"everStartedOnboarding"];
      objc_super v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"travelerStatusModeEnabled"];
      v14 = v13;
      if (v13) {
        objc_super v13 = (void *)[v13 integerValue];
      }
      v5->_travelerModeEnabled = (int64_t)v13;
      if ([v4 containsValueForKey:@"creationTimeInterval"]) {
        v15 = @"creationTimeInterval";
      }
      else {
        v15 = @"lastConfigurationUpdateTimeInterval";
      }
      [v4 decodeDoubleForKey:v15];
      v5->_creationDateTimeInterval = v16;
      [v4 decodeDoubleForKey:@"lastConfigurationUpdateTimeInterval"];
      v5->_lastConfigurationUpdateTimeInterval = v17;
      v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"enRampMode"];
      v19 = v18;
      if (v18) {
        v18 = (void *)[v18 unsignedIntegerValue];
      }
      v5->_enRampMode = (unint64_t)v18;

      goto LABEL_14;
    }
    if (gLogCategory_ENRegionConfiguration > 90
      || gLogCategory_ENRegionConfiguration == -1 && !_LogCategory_Initialize())
    {
LABEL_25:
      v20 = 0;
      goto LABEL_15;
    }
LABEL_21:
    LogPrintF_safe();
    goto LABEL_25;
  }
LABEL_14:
  v20 = v5;
LABEL_15:

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  id v4 = [(ENRegionConfiguration *)self diagnosisKeysPreAuthorization];
  [v10 encodeObject:v4 forKey:@"diagnosisKeysPreAuthorization"];

  objc_msgSend(v10, "encodeInt64:forKey:", -[ENRegionConfiguration enVersion](self, "enVersion"), @"enVersion");
  objc_msgSend(v10, "encodeBool:forKey:", -[ENRegionConfiguration everStartedOnboarding](self, "everStartedOnboarding"), @"everStartedOnboarding");
  v5 = [(ENRegionConfiguration *)self region];
  [v10 encodeObject:v5 forKey:@"region"];

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[ENRegionConfiguration travelerModeEnabled](self, "travelerModeEnabled"));
  [v10 encodeObject:v6 forKey:@"travelerStatusModeEnabled"];

  [(ENRegionConfiguration *)self creationDateTimeInterval];
  objc_msgSend(v10, "encodeDouble:forKey:", @"creationTimeInterval");
  [(ENRegionConfiguration *)self lastConfigurationUpdateTimeInterval];
  objc_msgSend(v10, "encodeDouble:forKey:", @"lastConfigurationUpdateTimeInterval");
  if ([(ENRegionConfiguration *)self enRampMode])
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ENRegionConfiguration enRampMode](self, "enRampMode"));
    [v10 encodeObject:v7 forKey:@"enRampMode"];
  }
  if ([(ENRegionConfiguration *)self enVersion] == 2)
  {
    uint64_t v8 = [(ENRegionConfiguration *)self userConsent];

    if (v8)
    {
      uint64_t v9 = [(ENRegionConfiguration *)self userConsent];
      [v10 encodeObject:v9 forKey:@"userConsent"];
    }
    else
    {
      uint64_t v9 = ENErrorF(10);
      [v10 failWithError:v9];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[ENRegionConfiguration allocWithZone:a3];
  unint64_t v5 = [(ENRegionConfiguration *)self enVersion];
  uint64_t v6 = [(ENRegionConfiguration *)self region];
  uint64_t v7 = [(ENRegionConfiguration *)v4 initWithVersion:v5 region:v6];

  uint64_t v8 = [(ENRegionConfiguration *)self diagnosisKeysPreAuthorization];
  [(ENRegionConfiguration *)v7 setDiagnosisKeysPreAuthorization:v8];

  [(ENRegionConfiguration *)v7 setEverStartedOnboarding:[(ENRegionConfiguration *)self everStartedOnboarding]];
  [(ENRegionConfiguration *)v7 setTravelerModeEnabled:[(ENRegionConfiguration *)self travelerModeEnabled]];
  uint64_t v9 = [(ENRegionConfiguration *)self userConsent];
  [(ENRegionConfiguration *)v7 setUserConsent:v9];

  [(ENRegionConfiguration *)self creationDateTimeInterval];
  -[ENRegionConfiguration setCreationDateTimeInterval:](v7, "setCreationDateTimeInterval:");
  [(ENRegionConfiguration *)self lastConfigurationUpdateTimeInterval];
  -[ENRegionConfiguration setLastConfigurationUpdateTimeInterval:](v7, "setLastConfigurationUpdateTimeInterval:");
  [(ENRegionConfiguration *)v7 setEnRampMode:[(ENRegionConfiguration *)self enRampMode]];
  return v7;
}

- (id)updatedWithConfiguration:(id)a3
{
  id v4 = (ENRegionConfiguration *)a3;
  unint64_t v5 = [(ENRegionConfiguration *)self region];
  uint64_t v6 = [(ENRegionConfiguration *)v4 region];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    uint64_t v8 = (void *)[(ENRegionConfiguration *)self copy];
    if (![(ENRegionConfiguration *)v4 enVersion]
      || (uint64_t v9 = [(ENRegionConfiguration *)v4 enVersion],
          unint64_t v10 = [(ENRegionConfiguration *)self enVersion],
          uint64_t v11 = v4,
          v9 == v10))
    {
      uint64_t v11 = self;
    }
    objc_msgSend(v8, "setEnVersion:", -[ENRegionConfiguration enVersion](v11, "enVersion"));
    if (![(ENRegionConfiguration *)v4 travelerModeEnabled]
      || (uint64_t v12 = [(ENRegionConfiguration *)v4 travelerModeEnabled],
          int64_t v13 = [(ENRegionConfiguration *)self travelerModeEnabled],
          v14 = v4,
          v12 == v13))
    {
      v14 = self;
    }
    objc_msgSend(v8, "setTravelerModeEnabled:", -[ENRegionConfiguration travelerModeEnabled](v14, "travelerModeEnabled"));
    v15 = [MEMORY[0x263EFF910] date];
    [v15 timeIntervalSince1970];
    objc_msgSend(v8, "setLastConfigurationUpdateTimeInterval:");

    if (![(ENRegionConfiguration *)self everStartedOnboarding]) {
      objc_msgSend(v8, "setEverStartedOnboarding:", -[ENRegionConfiguration everStartedOnboarding](v4, "everStartedOnboarding"));
    }
    double v16 = [(ENRegionConfiguration *)v4 userConsent];
    if (v16)
    {
      double v17 = [(ENRegionConfiguration *)self userConsent];
      if (v17)
      {
        v18 = [(ENRegionConfiguration *)self userConsent];
        v19 = [v18 updatedConsent:v16];
        [v8 setUserConsent:v19];
      }
      else
      {
        [v8 setUserConsent:v16];
      }
    }
    v20 = [(ENRegionConfiguration *)v4 diagnosisKeysPreAuthorization];
    if (v20) {
      [v8 setDiagnosisKeysPreAuthorization:v20];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v6 = [(ENRegionConfiguration *)self enVersion];
    if (v6 == [v5 enVersion])
    {
      int v7 = [(ENRegionConfiguration *)self everStartedOnboarding];
      if (v7 == [v5 everStartedOnboarding])
      {
        unint64_t v10 = [(ENRegionConfiguration *)self userConsent];
        uint64_t v11 = [v5 userConsent];
        id v12 = v10;
        id v13 = v11;
        v14 = v13;
        if (v12 == v13)
        {
        }
        else
        {
          if ((v12 == 0) == (v13 != 0))
          {
            BOOL v8 = 0;
            v24 = v13;
            v25 = v12;
LABEL_34:

            goto LABEL_35;
          }
          int v15 = [v12 isEqual:v13];

          if (!v15)
          {
            BOOL v8 = 0;
LABEL_35:

            goto LABEL_5;
          }
        }
        unint64_t v16 = [(ENRegionConfiguration *)self enVersion];
        if (v16 == 1)
        {
          v35 = [(ENRegionConfiguration *)self region];
          v34 = [v35 countryCode];
          double v17 = [v34 lowercaseString];
          v18 = [v5 region];
          v33 = [v18 countryCode];
          v19 = [v33 lowercaseString];
          id v20 = v17;
          id v21 = v19;
          v36 = v18;
          if (v20 == v21)
          {
            int v23 = 0;
            v32 = v20;
            v3 = v20;
            goto LABEL_25;
          }
          v3 = v21;
          if ((v20 == 0) != (v21 != 0))
          {
            uint64_t v22 = [v20 isEqual:v21];

            if (v22)
            {
              int v23 = 0;
              v32 = v20;
              goto LABEL_26;
            }
          }
          else
          {
          }
          v32 = v20;
        }
        v26 = [(ENRegionConfiguration *)self region];
        v27 = [v5 region];
        id v20 = v26;
        id v28 = v27;
        if (v20 != v28)
        {
          uint64_t v22 = (uint64_t)v28;
          if ((v20 == 0) == (v28 != 0))
          {

            BOOL v8 = 0;
            goto LABEL_29;
          }
          char v29 = [v20 isEqual:v28];

          if ((v29 & 1) == 0)
          {
            BOOL v8 = 0;
            goto LABEL_32;
          }
          int v23 = 1;
LABEL_26:
          int64_t v30 = [(ENRegionConfiguration *)self travelerModeEnabled];
          BOOL v8 = v30 == [v5 travelerModeEnabled];
          if (v23)
          {
LABEL_32:
            v31 = v36;

            if (v16 != 1) {
              goto LABEL_35;
            }
            goto LABEL_33;
          }
LABEL_29:
          v31 = v36;
          if (v16 != 1) {
            goto LABEL_35;
          }
LABEL_33:

          v24 = v34;
          v25 = v35;
          goto LABEL_34;
        }
        int v23 = 1;
LABEL_25:

        uint64_t v22 = (uint64_t)v20;
        goto LABEL_26;
      }
    }
  }
  BOOL v8 = 0;
LABEL_5:

  return v8;
}

- (unint64_t)enVersion
{
  return self->_enVersion;
}

- (void)setEnVersion:(unint64_t)a3
{
  self->_enVersion = a3;
}

- (ENRegion)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
}

- (ENRegionUserConsent)userConsent
{
  return self->_userConsent;
}

- (void)setUserConsent:(id)a3
{
}

- (BOOL)everStartedOnboarding
{
  return self->_everStartedOnboarding;
}

- (void)setEverStartedOnboarding:(BOOL)a3
{
  self->_everStartedOnboarding = a3;
}

- (ENUserAuthorization)diagnosisKeysPreAuthorization
{
  return self->_diagnosisKeysPreAuthorization;
}

- (void)setDiagnosisKeysPreAuthorization:(id)a3
{
}

- (int64_t)travelerModeEnabled
{
  return self->_travelerModeEnabled;
}

- (void)setTravelerModeEnabled:(int64_t)a3
{
  self->_travelerModeEnabled = a3;
}

- (double)creationDateTimeInterval
{
  return self->_creationDateTimeInterval;
}

- (void)setCreationDateTimeInterval:(double)a3
{
  self->_creationDateTimeInterval = a3;
}

- (double)lastConfigurationUpdateTimeInterval
{
  return self->_lastConfigurationUpdateTimeInterval;
}

- (void)setLastConfigurationUpdateTimeInterval:(double)a3
{
  self->_lastConfigurationUpdateTimeInterval = a3;
}

- (unint64_t)enRampMode
{
  return self->_enRampMode;
}

- (void)setEnRampMode:(unint64_t)a3
{
  self->_enRampMode = a3;
}

- (int64_t)differentialPrivacyConsent
{
  return self->_differentialPrivacyConsent;
}

- (double)differentialPrivacyConsentTimestamp
{
  return self->_differentialPrivacyConsentTimestamp;
}

- (int64_t)consent
{
  return self->_consent;
}

- (double)consentTimestamp
{
  return self->_consentTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosisKeysPreAuthorization, 0);
  objc_storeStrong((id *)&self->_userConsent, 0);

  objc_storeStrong((id *)&self->_region, 0);
}

@end