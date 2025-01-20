@interface ENRegionServerConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)associatedDomainsEnabled;
- (BOOL)dynamicAlgorithmEnabled;
- (BOOL)enEnabled;
- (BOOL)enableV1;
- (BOOL)hasSubdivisions;
- (BOOL)isChaffingEnabled;
- (BOOL)preArmTestVerificationEnabled;
- (BOOL)resetAvailabilityAlertForDeclinedUsers;
- (BOOL)supportsFeatures:(unsigned int)a3;
- (BOOL)telemetryAuthorization;
- (BOOL)textMessageVerificationEnabled;
- (BOOL)variantOfConcernEnabled;
- (ENRegion)region;
- (ENRegionServerConfiguration)initWithCoder:(id)a3;
- (ENRegionServerConfiguration)initWithServerResponseDictionary:(id)a3;
- (NSArray)subdivisions;
- (NSString)appBundleID;
- (NSString)appleTelemetryEndpoint;
- (NSString)appleTelemetryEndpointCredentials;
- (NSString)legalConsentVersion;
- (NSString)partnerTelemetryAppleCertificateChain;
- (NSString)partnerTelemetryEndpoint;
- (NSString)partnerTelemetryPublicCertificateChain;
- (NSString)phaTelemetryAppleCertificateChain;
- (NSString)phaTelemetryEndpoint;
- (NSString)phaTelemetryOptInMessage;
- (NSString)phaTelemetryPublicCertificateChain;
- (NSString)publicKey;
- (NSString)publicKeyVersion;
- (NSString)textMessagePublicKey;
- (NSString)textMessagePublicKeyVersion;
- (char)dynamicThrottleDownRSSI;
- (double)applicationBackgroundRuntimeInterval;
- (double)callbackInterval;
- (double)chaffingSelectionPercentage;
- (double)chaffingSelectionPercentageAlternative;
- (double)dynamicThrottleDownDuration;
- (double)dynamicThrottleUpDuration;
- (double)forceAPWakeIntervalThreshold;
- (double)osTriggeredAppRunInterval;
- (double)regionDisabledTransitionGracePeriod;
- (double)regionTransitionGracePeriod;
- (double)rpiAdvertisementTolerance;
- (double)rpiDuplicateAdvertisementTolerance;
- (double)timeToResetAvailabilityAlert;
- (id)description;
- (id)preferredLocalizationsFromArray:(id)a3;
- (unint64_t)enVersion;
- (unsigned)dailyDetectExposureLimit;
- (unsigned)detectExposureNKDLimit;
- (unsigned)dynamicThrottleDownAdvDensity;
- (unsigned)dynamicThrottleUpAdvDensity;
- (unsigned)featureFlags;
- (unsigned)maximumChaffsAllowedPerDay;
- (unsigned)numberOfAdvSamplesForRPIThreshold;
- (unsigned)selfReportTimeoutDays;
- (void)encodeWithCoder:(id)a3;
- (void)setAppleTelemetryEndpoint:(id)a3;
- (void)setAppleTelemetryEndpointCredentials:(id)a3;
- (void)setLegalConsentVersion:(id)a3;
- (void)setPartnerTelemetryAppleCertificateChain:(id)a3;
- (void)setPartnerTelemetryEndpoint:(id)a3;
- (void)setPartnerTelemetryPublicCertificateChain:(id)a3;
- (void)setPhaTelemetryAppleCertificateChain:(id)a3;
- (void)setPhaTelemetryEndpoint:(id)a3;
- (void)setPhaTelemetryOptInMessage:(id)a3;
- (void)setPhaTelemetryPublicCertificateChain:(id)a3;
@end

@implementation ENRegionServerConfiguration

- (id)description
{
  v44 = NSString;
  v45 = [(ENRegionServerConfiguration *)self region];
  unint64_t v43 = [(ENRegionServerConfiguration *)self enVersion];
  BOOL v42 = [(ENRegionServerConfiguration *)self enEnabled];
  BOOL v3 = [(ENRegionServerConfiguration *)self associatedDomainsEnabled];
  BOOL v4 = [(ENRegionServerConfiguration *)self textMessageVerificationEnabled];
  BOOL v5 = [(ENRegionServerConfiguration *)self preArmTestVerificationEnabled];
  BOOL v6 = [(ENRegionServerConfiguration *)self variantOfConcernEnabled];
  unsigned int v7 = [(ENRegionServerConfiguration *)self featureFlags];
  if (!v7)
  {
    v41 = "[ None ]";
    goto LABEL_14;
  }
  char v8 = v7;
  v9 = objc_msgSend(MEMORY[0x263F089D8], "stringWithFormat:", @"(%lu) [", v7);
  v10 = v9;
  if (v8)
  {
    [v9 appendString:@" VaccinationStatusInTEK"];
    if ((v8 & 2) == 0)
    {
LABEL_4:
      if ((v8 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_37;
    }
  }
  else if ((v8 & 2) == 0)
  {
    goto LABEL_4;
  }
  [v10 appendString:@" Self-Report-Type"];
  if ((v8 & 4) == 0)
  {
LABEL_5:
    if ((v8 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_38;
  }
LABEL_37:
  [v10 appendString:@" Clinical-Report-Type"];
  if ((v8 & 8) == 0)
  {
LABEL_6:
    if ((v8 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_39;
  }
LABEL_38:
  [v10 appendString:@" Recursive-Report-Type"];
  if ((v8 & 0x10) == 0)
  {
LABEL_7:
    if ((v8 & 0x20) == 0) {
      goto LABEL_8;
    }
LABEL_40:
    [v10 appendString:@" Proxy-Disabled"];
    if ((v8 & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_39:
  [v10 appendString:@" Revoked-Report-Type"];
  if ((v8 & 0x20) != 0) {
    goto LABEL_40;
  }
LABEL_8:
  if ((v8 & 0x40) != 0) {
LABEL_9:
  }
    [v10 appendString:@" Manual-Code-Disabled"];
LABEL_10:
  [v10 appendString:@" ]"];
  id v11 = v10;
  uint64_t v12 = [v11 cStringUsingEncoding:4];
  v13 = "?";
  if (v12) {
    v13 = (const char *)v12;
  }
  v41 = v13;

LABEL_14:
  if (v6) {
    v14 = "yes";
  }
  else {
    v14 = "no";
  }
  if (v5) {
    v15 = "yes";
  }
  else {
    v15 = "no";
  }
  v39 = v15;
  v40 = v14;
  if (v4) {
    v16 = "yes";
  }
  else {
    v16 = "no";
  }
  if (v3) {
    v17 = "yes";
  }
  else {
    v17 = "no";
  }
  v37 = v16;
  v38 = v17;
  BOOL v36 = [(ENRegionServerConfiguration *)self hasSubdivisions];
  v18 = [(ENRegionServerConfiguration *)self subdivisions];
  [(ENRegionServerConfiguration *)self applicationBackgroundRuntimeInterval];
  uint64_t v20 = v19;
  [(ENRegionServerConfiguration *)self rpiAdvertisementTolerance];
  uint64_t v22 = v21;
  uint64_t v23 = [(ENRegionServerConfiguration *)self dailyDetectExposureLimit];
  v24 = [(ENRegionServerConfiguration *)self appBundleID];
  v25 = [(ENRegionServerConfiguration *)self publicKey];
  v26 = [(ENRegionServerConfiguration *)self publicKeyVersion];
  [(ENRegionServerConfiguration *)self callbackInterval];
  uint64_t v28 = v27;
  v29 = [(ENRegionServerConfiguration *)self legalConsentVersion];
  if ([(ENRegionServerConfiguration *)self telemetryAuthorization]) {
    v30 = "yes";
  }
  else {
    v30 = "no";
  }
  [(ENRegionServerConfiguration *)self timeToResetAvailabilityAlert];
  uint64_t v32 = v31;
  if ([(ENRegionServerConfiguration *)self resetAvailabilityAlertForDeclinedUsers])
  {
    v33 = "yes";
  }
  else
  {
    v33 = "no";
  }
  objc_msgSend(v44, "stringWithFormat:", @"Server - %@, version: %ld enEnabled: %d, domains: %s, textVerify: %s, textPreArm: %s, variantOfConcern: %s, supportedFeatures: %s, hasSubdivisions: %d, subdivisions: %@, runtime: %lf, RPI Adv: %lf, API Rate Limit: %ld, appID: %@, publicKey: %@, publicKeyVersion: %@, callbackInterval: %f, Legal Consent Version: %@, telemetryAuthorization: %s, timeToResetAvailabilityAlert: %f, resetAvailabilityAlertForDeclinedUsers: %s", v45, v43, v42, v38, v37, v39, v40, v41, v36, v18, v20, v22, v23, v24, v25, v26,
    v28,
    v29,
    v30,
    v32,
  v34 = v33);

  return v34;
}

- (BOOL)supportsFeatures:(unsigned int)a3
{
  return (a3 & ~[(ENRegionServerConfiguration *)self featureFlags]) == 0;
}

- (ENRegionServerConfiguration)initWithServerResponseDictionary:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_117;
  }
  v114.receiver = self;
  v114.super_class = (Class)ENRegionServerConfiguration;
  self = [(ENRegionServerConfiguration *)&v114 init];
  if (!self) {
    goto LABEL_117;
  }
  int v113 = 0;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  BOOL v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  appBundleID = self->_appBundleID;
  self->_appBundleID = v5;

  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  unsigned int v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  publicKey = self->_publicKey;
  self->_publicKey = v7;

  if (v113
    || (CFStringGetTypeID(),
        CFDictionaryGetTypedValue(),
        v9 = (NSString *)objc_claimAutoreleasedReturnValue(),
        publicKeyVersion = self->_publicKeyVersion,
        self->_publicKeyVersion = v9,
        publicKeyVersion,
        v113))
  {
LABEL_117:
    v108 = 0;
  }
  else
  {
    id v11 = +[ENRegion regionFromServerResponseDictionary:v4];
    uint64_t v12 = v11;
    if (v11)
    {
      v13 = (ENRegion *)[v11 copy];
      region = self->_region;
      self->_region = v13;

      CFDictionaryGetTypeID();
      v15 = CFDictionaryGetTypedValue();
      if (v113)
      {
        v108 = 0;
      }
      else
      {
        self->_enVersion = CFDictionaryGetInt64Ranged();
        uint64_t Int64 = CFDictionaryGetInt64();
        if (v113) {
          BOOL v17 = 0;
        }
        else {
          BOOL v17 = Int64 == 0;
        }
        BOOL v18 = !v17;
        self->_enEnabled = v18;
        unsigned int Int64Ranged = CFDictionaryGetInt64Ranged();
        if (v113) {
          unsigned int v20 = 0;
        }
        else {
          unsigned int v20 = Int64Ranged;
        }
        self->_featureFlags = v20;
        uint64_t v21 = CFDictionaryGetInt64();
        if (v113) {
          BOOL v22 = 0;
        }
        else {
          BOOL v22 = v21 == 0;
        }
        BOOL v23 = !v22;
        self->_associatedDomainsEnabled = v23;
        uint64_t v24 = CFDictionaryGetInt64();
        if (v113) {
          BOOL v25 = 1;
        }
        else {
          BOOL v25 = v24 == 0;
        }
        BOOL v26 = !v25;
        self->_textMessageVerificationEnabled = v26;
        uint64_t v27 = CFDictionaryGetInt64();
        if (v113) {
          BOOL v28 = 1;
        }
        else {
          BOOL v28 = v27 == 0;
        }
        BOOL v29 = !v28;
        self->_preArmTestVerificationEnabled = v29;
        uint64_t v30 = CFDictionaryGetInt64();
        if (v113) {
          BOOL v31 = 1;
        }
        else {
          BOOL v31 = v30 == 0;
        }
        BOOL v32 = !v31;
        self->_variantOfConcernEnabled = v32;
        uint64_t v33 = CFDictionaryGetInt64();
        self->_hasSubdivisions = v33 != 0;
        if (v33)
        {
          CFDictionaryGetTypeID();
          v34 = CFDictionaryGetTypedValue();
          if (v34)
          {
            v35 = [(ENRegion *)self->_region countryCode];
            objc_opt_class();
            NSDictionaryGetNSArrayOfClass();
            BOOL v36 = (NSArray *)objc_claimAutoreleasedReturnValue();
            subdivisions = self->_subdivisions;
            self->_subdivisions = v36;
          }
        }
        CFDictionaryGetDouble();
        if (v113) {
          double v38 = 0.0;
        }
        self->_timeToResetAvailabilityAlert = v38;
        uint64_t v39 = CFDictionaryGetInt64();
        if (v113) {
          BOOL v40 = 1;
        }
        else {
          BOOL v40 = v39 == 0;
        }
        BOOL v41 = !v40;
        self->_resetAvailabilityAlertForDeclinedUsers = v41;
        int v42 = 3600 * CFDictionaryGetInt64Ranged();
        if (v113) {
          int v43 = 14400;
        }
        else {
          int v43 = v42;
        }
        self->_applicationBackgroundRuntimeInterval = (double)v43;
        unsigned int v44 = 60 * CFDictionaryGetInt64Ranged();
        if (v113) {
          unsigned int v45 = 86400;
        }
        else {
          unsigned int v45 = v44;
        }
        self->_callbackInterval = (double)v45;
        unsigned int v46 = CFDictionaryGetInt64Ranged();
        if (v113) {
          unsigned int v47 = 15;
        }
        else {
          unsigned int v47 = v46;
        }
        self->_dailyDetectExposureLimit = v47;
        unsigned int v48 = CFDictionaryGetInt64Ranged();
        if (v113) {
          unsigned int v49 = 1;
        }
        else {
          unsigned int v49 = v48;
        }
        self->_numberOfAdvSamplesForRPIThreshold = v49;
        unsigned int v50 = 60 * CFDictionaryGetInt64Ranged();
        if (v113) {
          unsigned int v51 = 7200;
        }
        else {
          unsigned int v51 = v50;
        }
        self->_rpiAdvertisementTolerance = (double)v51;
        unsigned int v52 = 60 * CFDictionaryGetInt64Ranged();
        if (v113) {
          unsigned int v53 = 1200;
        }
        else {
          unsigned int v53 = v52;
        }
        self->_rpiDuplicateAdvertisementTolerance = (double)v53;
        unsigned __int8 v54 = CFDictionaryGetInt64Ranged();
        if (v113) {
          int v55 = 300;
        }
        else {
          int v55 = 60 * v54;
        }
        self->_forceAPWakeIntervalThreshold = (double)v55;
        uint64_t v56 = CFDictionaryGetInt64();
        if (v113) {
          BOOL v57 = 0;
        }
        else {
          BOOL v57 = v56 == 0;
        }
        BOOL v58 = !v57;
        self->_dynamicAlgorithmEnabled = v58;
        double v59 = (double)CFDictionaryGetInt64Ranged();
        if (v113) {
          double v59 = 216.0;
        }
        self->_dynamicThrottleDownDuration = v59;
        unsigned int v60 = CFDictionaryGetInt64Ranged();
        if (v113) {
          unsigned int v61 = 6;
        }
        else {
          unsigned int v61 = v60;
        }
        self->_dynamicThrottleDownAdvDensity = v61;
        char v62 = CFDictionaryGetInt64Ranged();
        if (v113) {
          char v63 = -55;
        }
        else {
          char v63 = v62;
        }
        self->_dynamicThrottleDownRSSI = v63;
        unsigned int v64 = 60 * CFDictionaryGetInt64Ranged();
        if (v113) {
          unsigned int v65 = 54000;
        }
        else {
          unsigned int v65 = v64;
        }
        self->_dynamicThrottleUpDuration = (double)v65;
        unsigned int v66 = CFDictionaryGetInt64Ranged();
        if (v113) {
          unsigned int v67 = 20;
        }
        else {
          unsigned int v67 = v66;
        }
        self->_dynamicThrottleUpAdvDensity = v67;
        double v68 = (double)CFDictionaryGetInt64Ranged();
        if (v113) {
          double v68 = 300.0;
        }
        self->_osTriggeredAppRunInterval = v68;
        double v69 = (double)(60 * CFDictionaryGetInt64Ranged());
        if (v113) {
          double v69 = 10800.0;
        }
        self->_regionTransitionGracePeriod = v69;
        double v70 = (double)(60 * CFDictionaryGetInt64Ranged());
        if (v113) {
          double v70 = 86400.0;
        }
        self->_regionDisabledTransitionGracePeriod = v70;
        uint64_t v71 = CFDictionaryGetInt64();
        if (v113) {
          BOOL v72 = 0;
        }
        else {
          BOOL v72 = v71 == 0;
        }
        BOOL v73 = !v72;
        self->_enableV1 = v73;
        unsigned int v74 = CFDictionaryGetInt64Ranged();
        if (v113) {
          unsigned int v75 = 6;
        }
        else {
          unsigned int v75 = v74;
        }
        self->_detectExposureNKDLimit = v75;
        CFStringGetTypeID();
        CFDictionaryGetTypedValue();
        v76 = (NSString *)objc_claimAutoreleasedReturnValue();
        legalConsentVersion = self->_legalConsentVersion;
        self->_legalConsentVersion = v76;

        CFStringGetTypeID();
        CFDictionaryGetTypedValue();
        v78 = (NSString *)objc_claimAutoreleasedReturnValue();
        textMessagePublicKey = self->_textMessagePublicKey;
        self->_textMessagePublicKey = v78;

        CFStringGetTypeID();
        CFDictionaryGetTypedValue();
        v80 = (NSString *)objc_claimAutoreleasedReturnValue();
        textMessagePublicKeyVersion = self->_textMessagePublicKeyVersion;
        self->_textMessagePublicKeyVersion = v80;

        self->_isChaffingEnabled = CFDictionaryGetInt64() != 0;
        CFDictionaryGetDouble();
        self->_chaffingSelectionPercentage = v82;
        CFDictionaryGetDouble();
        self->_chaffingSelectionPercentageAlternative = v83;
        unsigned int v84 = CFDictionaryGetInt64Ranged();
        if (v113) {
          unsigned int v85 = 3;
        }
        else {
          unsigned int v85 = v84;
        }
        self->_maximumChaffsAllowedPerDay = v85;
        unsigned __int8 v86 = CFDictionaryGetInt64Ranged();
        if (v113) {
          unsigned __int8 v87 = 90;
        }
        else {
          unsigned __int8 v87 = v86;
        }
        self->_selfReportTimeoutDays = v87;
        v110[0] = MEMORY[0x263EF8330];
        v110[1] = 3221225472;
        v110[2] = __64__ENRegionServerConfiguration_initWithServerResponseDictionary___block_invoke;
        v110[3] = &unk_264244A08;
        id v111 = v15;
        v88 = self;
        v112 = v88;
        v89 = (void (**)(void, void))MEMORY[0x2166BC8A0](v110);
        CFStringGetTypeID();
        uint64_t v90 = CFDictionaryGetTypedValue();
        phaTelemetryPublicCertificateChain = v88->_phaTelemetryPublicCertificateChain;
        v88->_phaTelemetryPublicCertificateChain = (NSString *)v90;

        CFStringGetTypeID();
        uint64_t v92 = CFDictionaryGetTypedValue();
        phaTelemetryAppleCertificateChain = v88->_phaTelemetryAppleCertificateChain;
        v88->_phaTelemetryAppleCertificateChain = (NSString *)v92;

        CFStringGetTypeID();
        uint64_t v94 = CFDictionaryGetTypedValue();
        phaTelemetryEndpoint = v88->_phaTelemetryEndpoint;
        v88->_phaTelemetryEndpoint = (NSString *)v94;

        CFStringGetTypeID();
        uint64_t v96 = CFDictionaryGetTypedValue();
        partnerTelemetryPublicCertificateChain = v88->_partnerTelemetryPublicCertificateChain;
        v88->_partnerTelemetryPublicCertificateChain = (NSString *)v96;

        CFStringGetTypeID();
        uint64_t v98 = CFDictionaryGetTypedValue();
        partnerTelemetryAppleCertificateChain = v88->_partnerTelemetryAppleCertificateChain;
        v88->_partnerTelemetryAppleCertificateChain = (NSString *)v98;

        CFStringGetTypeID();
        uint64_t v100 = CFDictionaryGetTypedValue();
        partnerTelemetryEndpoint = v88->_partnerTelemetryEndpoint;
        v88->_partnerTelemetryEndpoint = (NSString *)v100;

        CFStringGetTypeID();
        uint64_t v102 = CFDictionaryGetTypedValue();
        appleTelemetryEndpoint = v88->_appleTelemetryEndpoint;
        v88->_appleTelemetryEndpoint = (NSString *)v102;

        CFStringGetTypeID();
        uint64_t v104 = CFDictionaryGetTypedValue();
        appleTelemetryEndpointCredentials = v88->_appleTelemetryEndpointCredentials;
        v88->_appleTelemetryEndpointCredentials = (NSString *)v104;

        v88->_telemetryAuthorization = CFDictionaryGetInt64() != 0;
        uint64_t v106 = ((void (**)(void, __CFString *))v89)[2](v89, @"telemetryOptInMessage");
        phaTelemetryOptInMessage = v88->_phaTelemetryOptInMessage;
        v88->_phaTelemetryOptInMessage = (NSString *)v106;

        v108 = v88;
      }
    }
    else
    {
      v108 = 0;
    }
  }
  return v108;
}

id __64__ENRegionServerConfiguration_initWithServerResponseDictionary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v26 = a2;
  BOOL v28 = [MEMORY[0x263EFF980] array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v25 = a1;
  BOOL v3 = [*(id *)(a1 + 32) allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v31;
    unsigned int v7 = @"_";
    uint64_t v27 = v3;
    do
    {
      uint64_t v8 = 0;
      uint64_t v29 = v5;
      do
      {
        if (*(void *)v31 != v6) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v30 + 1) + 8 * v8);
        if ([v9 hasPrefix:@"agencyMessage"])
        {
          v10 = [v9 componentsSeparatedByString:v7];
          if ([v10 count] == 3)
          {
            id v11 = NSString;
            uint64_t v12 = [v10 objectAtIndexedSubscript:1];
            [v12 lowercaseString];
            v13 = v7;
            v15 = uint64_t v14 = v6;
            v16 = [v10 objectAtIndexedSubscript:2];
            BOOL v17 = [v16 uppercaseString];
            BOOL v18 = [v11 stringWithFormat:@"%@_%@", v15, v17];

            uint64_t v6 = v14;
            unsigned int v7 = v13;

            BOOL v3 = v27;
            uint64_t v5 = v29;
            [v28 addObject:v18];
          }
        }
        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v5);
  }

  uint64_t v19 = [*(id *)(v25 + 40) preferredLocalizationsFromArray:v28];
  unsigned int v20 = [v19 localeIdentifier];
  uint64_t v21 = [v20 uppercaseString];

  BOOL v22 = (void *)[[NSString alloc] initWithFormat:@"%@_%@", v26, v21];
  CFStringGetTypeID();
  BOOL v23 = CFDictionaryGetTypedValue();

  return v23;
}

- (id)preferredLocalizationsFromArray:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x263F086E0];
    uint64_t v5 = [MEMORY[0x263EFF960] preferredLanguages];
    uint64_t v6 = [v4 preferredLocalizationsFromArray:v3 forPreferences:v5];
    unsigned int v7 = [v6 firstObject];

    uint64_t v8 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v7];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263EFF960] currentLocale];
  }

  return v8;
}

- (ENRegionServerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)ENRegionServerConfiguration;
  uint64_t v5 = [(ENRegionServerConfiguration *)&v50 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"enVersion"];
    v5->_enVersion = [v6 unsignedIntegerValue];

    v5->_enEnabled = [v4 decodeBoolForKey:@"enEnabled"];
    uint64_t v51 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_featureFlags = v51;
    }
    v5->_associatedDomainsEnabled = [v4 decodeBoolForKey:@"enableAssociatedDomains"];
    v5->_textMessageVerificationEnabled = [v4 decodeBoolForKey:@"enableTextMessageVerification"];
    v5->_preArmTestVerificationEnabled = [v4 decodeBoolForKey:@"enablePreArmVerification"];
    v5->_variantOfConcernEnabled = [v4 decodeBoolForKey:@"variantOfConcernEnabled"];
    int v7 = [v4 decodeBoolForKey:@"hasStateRegions"];
    v5->_hasSubdivisions = v7;
    if (v7)
    {
      uint64_t v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"stateRegionConfigs"];
      subdivisions = v5->_subdivisions;
      v5->_subdivisions = (NSArray *)v8;
    }
    [v4 decodeDoubleForKey:@"timeToResetAvailabilityAlert"];
    v5->_timeToResetAvailabilityAlert = v10;
    v5->_resetAvailabilityAlertForDeclinedUsers = [v4 decodeBoolForKey:@"resetAvailabilityAlertForDeclinedUsers"];
    id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appBundleId"];
    objc_storeStrong((id *)&v5->_appBundleID, v11);
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"region"];
    objc_storeStrong((id *)&v5->_region, v12);
    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publicKey"];
    objc_storeStrong((id *)&v5->_publicKey, v13);
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publicKeyVersion"];
    objc_storeStrong((id *)&v5->_publicKeyVersion, v14);
    [v4 decodeDoubleForKey:@"callbackInterval"];
    v5->_callbackInterval = v15;
    [v4 decodeDoubleForKey:@"applicationBackgroundRuntimeIntervalInHours"];
    v5->_applicationBackgroundRuntimeInterval = v16;
    [v4 decodeDoubleForKey:@"rpiAdvertisementToleranceInMinutes"];
    v5->_rpiAdvertisementTolerance = v17;
    [v4 decodeDoubleForKey:@"rpiDuplicateAdvertisementToleranceInMinutes"];
    v5->_rpiDuplicateAdvertisementTolerance = v18;
    uint64_t v51 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_dailyDetectExposureLimit = v51;
    }
    uint64_t v51 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_detectExposureNKDLimit = v51;
    }
    uint64_t v51 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_numberOfAdvSamplesForRPIThreshold = v51;
    }
    [v4 decodeDoubleForKey:@"forceAPWakeIntervalInMinutesThreshold"];
    v5->_forceAPWakeIntervalThreshold = v19;
    v5->_dynamicAlgorithmEnabled = [v4 decodeBoolForKey:@"dynamicAlgorithmEnabled"];
    [v4 decodeDoubleForKey:@"dynamicThrottleDownDurationInSeconds"];
    v5->_dynamicThrottleDownDuration = v20;
    uint64_t v51 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_dynamicThrottleDownAdvDensity = v51;
    }
    uint64_t v51 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_dynamicThrottleDownRSSI = v51;
    }
    [v4 decodeDoubleForKey:@"dynamicThrottleUpDurationInMinutes"];
    v5->_dynamicThrottleUpDuration = v21;
    uint64_t v51 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_dynamicThrottleUpAdvDensity = v51;
    }
    [v4 decodeDoubleForKey:@"osTriggeredAppRunTimeInSeconds"];
    v5->_osTriggeredAppRunInterval = v22;
    [v4 decodeDoubleForKey:@"regionTransitionGracePeriodInMinutes"];
    v5->_regionTransitionGracePeriod = v23;
    [v4 decodeDoubleForKey:@"regionDisabledTransitionGracePeriodMinutes"];
    v5->_regionDisabledTransitionGracePeriod = v24;
    uint64_t v51 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_selfReportTimeoutDays = v51;
    }
    v5->_enableV1 = [v4 decodeBoolForKey:@"V1Enable"];
    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"legalConsentVersion"];
    legalConsentVersion = v5->_legalConsentVersion;
    v5->_legalConsentVersion = (NSString *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textMessageVerificationPublicKey"];
    textMessagePublicKey = v5->_textMessagePublicKey;
    v5->_textMessagePublicKey = (NSString *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textMessageVerificationPublicKeyVersion"];
    textMessagePublicKeyVersion = v5->_textMessagePublicKeyVersion;
    v5->_textMessagePublicKeyVersion = (NSString *)v29;

    if ([v4 containsValueForKey:@"publicHealthAuthorityTelemetryPublicCertificateChain"])
    {
      uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publicHealthAuthorityTelemetryPublicCertificateChain"];
      phaTelemetryPublicCertificateChain = v5->_phaTelemetryPublicCertificateChain;
      v5->_phaTelemetryPublicCertificateChain = (NSString *)v31;
    }
    if ([v4 containsValueForKey:@"publicHealthAuthorityTelemetryAppleCertificateChain"])
    {
      uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publicHealthAuthorityTelemetryAppleCertificateChain"];
      phaTelemetryAppleCertificateChain = v5->_phaTelemetryAppleCertificateChain;
      v5->_phaTelemetryAppleCertificateChain = (NSString *)v33;
    }
    if ([v4 containsValueForKey:@"publicHealthAuthorityTelemetryEndpoint"])
    {
      uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publicHealthAuthorityTelemetryEndpoint"];
      phaTelemetryEndpoint = v5->_phaTelemetryEndpoint;
      v5->_phaTelemetryEndpoint = (NSString *)v35;
    }
    if ([v4 containsValueForKey:@"telemetryOptInMessage"])
    {
      uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"telemetryOptInMessage"];
      phaTelemetryOptInMessage = v5->_phaTelemetryOptInMessage;
      v5->_phaTelemetryOptInMessage = (NSString *)v37;
    }
    if ([v4 containsValueForKey:@"partnerTelemetryPublicCertificateChain"])
    {
      uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"partnerTelemetryPublicCertificateChain"];
      partnerTelemetryPublicCertificateChain = v5->_partnerTelemetryPublicCertificateChain;
      v5->_partnerTelemetryPublicCertificateChain = (NSString *)v39;
    }
    if ([v4 containsValueForKey:@"partnerTelemetryAppleCertificateChain"])
    {
      uint64_t v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"partnerTelemetryAppleCertificateChain"];
      partnerTelemetryAppleCertificateChain = v5->_partnerTelemetryAppleCertificateChain;
      v5->_partnerTelemetryAppleCertificateChain = (NSString *)v41;
    }
    if ([v4 containsValueForKey:@"partnerTelemetryEndpoint"])
    {
      uint64_t v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"partnerTelemetryEndpoint"];
      partnerTelemetryEndpoint = v5->_partnerTelemetryEndpoint;
      v5->_partnerTelemetryEndpoint = (NSString *)v43;
    }
    if ([v4 containsValueForKey:@"appleTelemetryEndpoint"])
    {
      uint64_t v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appleTelemetryEndpoint"];
      appleTelemetryEndpoint = v5->_appleTelemetryEndpoint;
      v5->_appleTelemetryEndpoint = (NSString *)v45;
    }
    if ([v4 containsValueForKey:@"appleTelemetryEndpointCredentials"])
    {
      uint64_t v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appleTelemetryEndpointCredentials"];
      appleTelemetryEndpointCredentials = v5->_appleTelemetryEndpointCredentials;
      v5->_appleTelemetryEndpointCredentials = (NSString *)v47;
    }
    if ([v4 containsValueForKey:@"telemetryAuthorization"]) {
      v5->_telemetryAuthorization = [v4 decodeBoolForKey:@"telemetryAuthorization"];
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v30 = a3;
  id v4 = [NSNumber numberWithUnsignedInteger:self->_enVersion];
  [v30 encodeObject:v4 forKey:@"enVersion"];

  [v30 encodeBool:self->_enEnabled forKey:@"enEnabled"];
  uint64_t featureFlags = self->_featureFlags;
  if (featureFlags) {
    [v30 encodeInt64:featureFlags forKey:@"flags"];
  }
  [v30 encodeBool:self->_associatedDomainsEnabled forKey:@"enableAssociatedDomains"];
  [v30 encodeBool:self->_textMessageVerificationEnabled forKey:@"enableTextMessageVerification"];
  [v30 encodeBool:self->_preArmTestVerificationEnabled forKey:@"enablePreArmVerification"];
  [v30 encodeBool:self->_variantOfConcernEnabled forKey:@"variantOfConcernEnabled"];
  [v30 encodeBool:self->_hasSubdivisions forKey:@"hasStateRegions"];
  [v30 encodeObject:self->_subdivisions forKey:@"stateRegionConfigs"];
  [v30 encodeDouble:@"timeToResetAvailabilityAlert" forKey:self->_timeToResetAvailabilityAlert];
  [v30 encodeBool:self->_resetAvailabilityAlertForDeclinedUsers forKey:@"resetAvailabilityAlertForDeclinedUsers"];
  [v30 encodeObject:self->_region forKey:@"region"];
  [v30 encodeObject:self->_appBundleID forKey:@"appBundleId"];
  [v30 encodeObject:self->_publicKey forKey:@"publicKey"];
  [v30 encodeObject:self->_publicKeyVersion forKey:@"publicKeyVersion"];
  [v30 encodeObject:self->_textMessagePublicKey forKey:@"textMessageVerificationPublicKey"];
  [v30 encodeObject:self->_textMessagePublicKeyVersion forKey:@"textMessageVerificationPublicKeyVersion"];
  [v30 encodeDouble:@"callbackInterval" forKey:self->_callbackInterval];
  [v30 encodeDouble:@"applicationBackgroundRuntimeIntervalInHours" forKey:self->_applicationBackgroundRuntimeInterval];
  [v30 encodeDouble:@"rpiAdvertisementToleranceInMinutes" forKey:self->_rpiAdvertisementTolerance];
  [v30 encodeDouble:@"rpiDuplicateAdvertisementToleranceInMinutes" forKey:self->_rpiDuplicateAdvertisementTolerance];
  uint64_t dailyDetectExposureLimit = self->_dailyDetectExposureLimit;
  if (dailyDetectExposureLimit) {
    [v30 encodeInt64:dailyDetectExposureLimit forKey:@"detectExposureDailyLimit"];
  }
  uint64_t detectExposureNKDLimit = self->_detectExposureNKDLimit;
  if (detectExposureNKDLimit) {
    [v30 encodeInt64:detectExposureNKDLimit forKey:@"detectExposureNKDLimit"];
  }
  uint64_t numberOfAdvSamplesForRPIThreshold = self->_numberOfAdvSamplesForRPIThreshold;
  v9 = v30;
  if (numberOfAdvSamplesForRPIThreshold)
  {
    [v30 encodeInt64:numberOfAdvSamplesForRPIThreshold forKey:@"numberOfAdvSamplesForRPIThreshold"];
    v9 = v30;
  }
  [v9 encodeDouble:@"forceAPWakeIntervalInMinutesThreshold" forKey:self->_forceAPWakeIntervalThreshold];
  [v30 encodeBool:self->_dynamicAlgorithmEnabled forKey:@"dynamicAlgorithmEnabled"];
  [v30 encodeDouble:@"dynamicThrottleDownDurationInSeconds" forKey:self->_dynamicThrottleDownDuration];
  uint64_t dynamicThrottleDownAdvDensity = self->_dynamicThrottleDownAdvDensity;
  if (dynamicThrottleDownAdvDensity) {
    [v30 encodeInt64:dynamicThrottleDownAdvDensity forKey:@"dynamicThrottleDownAdvDensity"];
  }
  if (self->_dynamicThrottleDownRSSI) {
    objc_msgSend(v30, "encodeInteger:forKey:");
  }
  [v30 encodeDouble:@"dynamicThrottleUpDurationInMinutes" forKey:self->_dynamicThrottleUpDuration];
  uint64_t dynamicThrottleUpAdvDensity = self->_dynamicThrottleUpAdvDensity;
  if (dynamicThrottleUpAdvDensity) {
    [v30 encodeInt64:dynamicThrottleUpAdvDensity forKey:@"dynamicThrottleUpAdvDensity"];
  }
  [v30 encodeDouble:@"osTriggeredAppRunTimeInSeconds" forKey:self->_osTriggeredAppRunInterval];
  [v30 encodeDouble:@"regionTransitionGracePeriodInMinutes" forKey:self->_regionTransitionGracePeriod];
  [v30 encodeDouble:@"regionDisabledTransitionGracePeriodMinutes" forKey:self->_regionDisabledTransitionGracePeriod];
  if (self->_selfReportTimeoutDays) {
    objc_msgSend(v30, "encodeInteger:forKey:");
  }
  [v30 encodeBool:self->_enableV1 forKey:@"V1Enable"];
  [v30 encodeObject:self->_legalConsentVersion forKey:@"legalConsentVersion"];
  uint64_t v12 = [(ENRegionServerConfiguration *)self phaTelemetryPublicCertificateChain];

  if (v12)
  {
    v13 = [(ENRegionServerConfiguration *)self phaTelemetryPublicCertificateChain];
    [v30 encodeObject:v13 forKey:@"publicHealthAuthorityTelemetryPublicCertificateChain"];
  }
  uint64_t v14 = [(ENRegionServerConfiguration *)self phaTelemetryAppleCertificateChain];

  if (v14)
  {
    double v15 = [(ENRegionServerConfiguration *)self phaTelemetryAppleCertificateChain];
    [v30 encodeObject:v15 forKey:@"publicHealthAuthorityTelemetryAppleCertificateChain"];
  }
  double v16 = [(ENRegionServerConfiguration *)self phaTelemetryEndpoint];

  if (v16)
  {
    double v17 = [(ENRegionServerConfiguration *)self phaTelemetryEndpoint];
    [v30 encodeObject:v17 forKey:@"publicHealthAuthorityTelemetryEndpoint"];
  }
  double v18 = [(ENRegionServerConfiguration *)self phaTelemetryOptInMessage];

  if (v18)
  {
    double v19 = [(ENRegionServerConfiguration *)self phaTelemetryOptInMessage];
    [v30 encodeObject:v19 forKey:@"telemetryOptInMessage"];
  }
  double v20 = [(ENRegionServerConfiguration *)self partnerTelemetryPublicCertificateChain];

  if (v20)
  {
    double v21 = [(ENRegionServerConfiguration *)self partnerTelemetryPublicCertificateChain];
    [v30 encodeObject:v21 forKey:@"partnerTelemetryPublicCertificateChain"];
  }
  double v22 = [(ENRegionServerConfiguration *)self partnerTelemetryAppleCertificateChain];

  if (v22)
  {
    double v23 = [(ENRegionServerConfiguration *)self partnerTelemetryAppleCertificateChain];
    [v30 encodeObject:v23 forKey:@"partnerTelemetryAppleCertificateChain"];
  }
  double v24 = [(ENRegionServerConfiguration *)self partnerTelemetryEndpoint];

  if (v24)
  {
    uint64_t v25 = [(ENRegionServerConfiguration *)self partnerTelemetryEndpoint];
    [v30 encodeObject:v25 forKey:@"partnerTelemetryEndpoint"];
  }
  id v26 = [(ENRegionServerConfiguration *)self appleTelemetryEndpoint];

  if (v26)
  {
    uint64_t v27 = [(ENRegionServerConfiguration *)self appleTelemetryEndpoint];
    [v30 encodeObject:v27 forKey:@"appleTelemetryEndpoint"];
  }
  BOOL v28 = [(ENRegionServerConfiguration *)self appleTelemetryEndpointCredentials];

  if (v28)
  {
    uint64_t v29 = [(ENRegionServerConfiguration *)self appleTelemetryEndpointCredentials];
    [v30 encodeObject:v29 forKey:@"appleTelemetryEndpointCredentials"];
  }
  objc_msgSend(v30, "encodeBool:forKey:", -[ENRegionServerConfiguration telemetryAuthorization](self, "telemetryAuthorization"), @"telemetryAuthorization");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)enVersion
{
  return self->_enVersion;
}

- (BOOL)enEnabled
{
  return self->_enEnabled;
}

- (BOOL)associatedDomainsEnabled
{
  return self->_associatedDomainsEnabled;
}

- (BOOL)textMessageVerificationEnabled
{
  return self->_textMessageVerificationEnabled;
}

- (BOOL)preArmTestVerificationEnabled
{
  return self->_preArmTestVerificationEnabled;
}

- (BOOL)variantOfConcernEnabled
{
  return self->_variantOfConcernEnabled;
}

- (unsigned)featureFlags
{
  return self->_featureFlags;
}

- (ENRegion)region
{
  return self->_region;
}

- (BOOL)hasSubdivisions
{
  return self->_hasSubdivisions;
}

- (NSArray)subdivisions
{
  return self->_subdivisions;
}

- (double)timeToResetAvailabilityAlert
{
  return self->_timeToResetAvailabilityAlert;
}

- (BOOL)resetAvailabilityAlertForDeclinedUsers
{
  return self->_resetAvailabilityAlertForDeclinedUsers;
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (NSString)publicKey
{
  return self->_publicKey;
}

- (NSString)publicKeyVersion
{
  return self->_publicKeyVersion;
}

- (double)applicationBackgroundRuntimeInterval
{
  return self->_applicationBackgroundRuntimeInterval;
}

- (double)rpiAdvertisementTolerance
{
  return self->_rpiAdvertisementTolerance;
}

- (double)rpiDuplicateAdvertisementTolerance
{
  return self->_rpiDuplicateAdvertisementTolerance;
}

- (double)callbackInterval
{
  return self->_callbackInterval;
}

- (unsigned)dailyDetectExposureLimit
{
  return self->_dailyDetectExposureLimit;
}

- (unsigned)detectExposureNKDLimit
{
  return self->_detectExposureNKDLimit;
}

- (unsigned)numberOfAdvSamplesForRPIThreshold
{
  return self->_numberOfAdvSamplesForRPIThreshold;
}

- (double)forceAPWakeIntervalThreshold
{
  return self->_forceAPWakeIntervalThreshold;
}

- (BOOL)dynamicAlgorithmEnabled
{
  return self->_dynamicAlgorithmEnabled;
}

- (double)dynamicThrottleDownDuration
{
  return self->_dynamicThrottleDownDuration;
}

- (unsigned)dynamicThrottleDownAdvDensity
{
  return self->_dynamicThrottleDownAdvDensity;
}

- (char)dynamicThrottleDownRSSI
{
  return self->_dynamicThrottleDownRSSI;
}

- (double)dynamicThrottleUpDuration
{
  return self->_dynamicThrottleUpDuration;
}

- (unsigned)dynamicThrottleUpAdvDensity
{
  return self->_dynamicThrottleUpAdvDensity;
}

- (double)osTriggeredAppRunInterval
{
  return self->_osTriggeredAppRunInterval;
}

- (double)regionTransitionGracePeriod
{
  return self->_regionTransitionGracePeriod;
}

- (double)regionDisabledTransitionGracePeriod
{
  return self->_regionDisabledTransitionGracePeriod;
}

- (BOOL)enableV1
{
  return self->_enableV1;
}

- (NSString)legalConsentVersion
{
  return self->_legalConsentVersion;
}

- (void)setLegalConsentVersion:(id)a3
{
}

- (BOOL)isChaffingEnabled
{
  return self->_isChaffingEnabled;
}

- (double)chaffingSelectionPercentage
{
  return self->_chaffingSelectionPercentage;
}

- (double)chaffingSelectionPercentageAlternative
{
  return self->_chaffingSelectionPercentageAlternative;
}

- (unsigned)maximumChaffsAllowedPerDay
{
  return self->_maximumChaffsAllowedPerDay;
}

- (NSString)textMessagePublicKey
{
  return self->_textMessagePublicKey;
}

- (NSString)textMessagePublicKeyVersion
{
  return self->_textMessagePublicKeyVersion;
}

- (unsigned)selfReportTimeoutDays
{
  return self->_selfReportTimeoutDays;
}

- (NSString)phaTelemetryPublicCertificateChain
{
  return self->_phaTelemetryPublicCertificateChain;
}

- (void)setPhaTelemetryPublicCertificateChain:(id)a3
{
}

- (NSString)phaTelemetryAppleCertificateChain
{
  return self->_phaTelemetryAppleCertificateChain;
}

- (void)setPhaTelemetryAppleCertificateChain:(id)a3
{
}

- (NSString)phaTelemetryEndpoint
{
  return self->_phaTelemetryEndpoint;
}

- (void)setPhaTelemetryEndpoint:(id)a3
{
}

- (NSString)phaTelemetryOptInMessage
{
  return self->_phaTelemetryOptInMessage;
}

- (void)setPhaTelemetryOptInMessage:(id)a3
{
}

- (NSString)partnerTelemetryPublicCertificateChain
{
  return self->_partnerTelemetryPublicCertificateChain;
}

- (void)setPartnerTelemetryPublicCertificateChain:(id)a3
{
}

- (NSString)partnerTelemetryAppleCertificateChain
{
  return self->_partnerTelemetryAppleCertificateChain;
}

- (void)setPartnerTelemetryAppleCertificateChain:(id)a3
{
}

- (NSString)partnerTelemetryEndpoint
{
  return self->_partnerTelemetryEndpoint;
}

- (void)setPartnerTelemetryEndpoint:(id)a3
{
}

- (NSString)appleTelemetryEndpoint
{
  return self->_appleTelemetryEndpoint;
}

- (void)setAppleTelemetryEndpoint:(id)a3
{
}

- (NSString)appleTelemetryEndpointCredentials
{
  return self->_appleTelemetryEndpointCredentials;
}

- (void)setAppleTelemetryEndpointCredentials:(id)a3
{
}

- (BOOL)telemetryAuthorization
{
  return self->_telemetryAuthorization;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleTelemetryEndpointCredentials, 0);
  objc_storeStrong((id *)&self->_appleTelemetryEndpoint, 0);
  objc_storeStrong((id *)&self->_partnerTelemetryEndpoint, 0);
  objc_storeStrong((id *)&self->_partnerTelemetryAppleCertificateChain, 0);
  objc_storeStrong((id *)&self->_partnerTelemetryPublicCertificateChain, 0);
  objc_storeStrong((id *)&self->_phaTelemetryOptInMessage, 0);
  objc_storeStrong((id *)&self->_phaTelemetryEndpoint, 0);
  objc_storeStrong((id *)&self->_phaTelemetryAppleCertificateChain, 0);
  objc_storeStrong((id *)&self->_phaTelemetryPublicCertificateChain, 0);
  objc_storeStrong((id *)&self->_textMessagePublicKeyVersion, 0);
  objc_storeStrong((id *)&self->_textMessagePublicKey, 0);
  objc_storeStrong((id *)&self->_legalConsentVersion, 0);
  objc_storeStrong((id *)&self->_publicKeyVersion, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
  objc_storeStrong((id *)&self->_subdivisions, 0);

  objc_storeStrong((id *)&self->_region, 0);
}

@end