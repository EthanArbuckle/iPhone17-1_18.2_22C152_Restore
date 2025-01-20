@interface ENRegionServerAgencyLocalizedConfiguration
+ (BOOL)getLocalizedAgencyConfiguration:(id *)a3 region:(id)a4 fromDictionary:(id)a5 locale:(id)a6;
+ (BOOL)supportsSecureCoding;
- (ENRegion)region;
- (ENRegionServerAgencyLocalizedConfiguration)initWithCoder:(id)a3;
- (ENRegionServerAgencyLocalizedConfiguration)initWithRegion:(id)a3;
- (NSArray)notificationConfigurations;
- (NSLocale)locale;
- (NSString)agencyMessage;
- (NSString)agencyTurndownMessage;
- (NSString)displayName;
- (NSString)legalConsentText;
- (NSString)onboardingNotificationBody;
- (NSString)phaTelemetryOptInMessage;
- (NSString)regionName;
- (NSString)revokedNotificationBody;
- (NSString)revokedNotificationSubject;
- (NSString)selfReportIntroMessage;
- (NSString)selfReportNotificationBody;
- (NSString)symptomsOnsetDescription;
- (NSString)testVerificationIntroMessage;
- (NSString)testVerificationNotificationBody;
- (NSString)traveledQuestionText;
- (NSString)vaccinationQuestionText;
- (NSString)vaccinationQuestionTextAlt;
- (id)description;
- (id)notificationConfigurationForName:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAgencyMessage:(id)a3;
- (void)setAgencyTurndownMessage:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setLegalConsentText:(id)a3;
- (void)setLocale:(id)a3;
- (void)setNotificationConfigurations:(id)a3;
- (void)setOnboardingNotificationBody:(id)a3;
- (void)setPhaTelemetryOptInMessage:(id)a3;
- (void)setRegionName:(id)a3;
- (void)setRevokedNotificationBody:(id)a3;
- (void)setRevokedNotificationSubject:(id)a3;
- (void)setSelfReportIntroMessage:(id)a3;
- (void)setSelfReportNotificationBody:(id)a3;
- (void)setSymptomsOnsetDescription:(id)a3;
- (void)setTestVerificationIntroMessage:(id)a3;
- (void)setTestVerificationNotificationBody:(id)a3;
- (void)setTraveledQuestionText:(id)a3;
- (void)setVaccinationQuestionText:(id)a3;
- (void)setVaccinationQuestionTextAlt:(id)a3;
@end

@implementation ENRegionServerAgencyLocalizedConfiguration

- (ENRegionServerAgencyLocalizedConfiguration)initWithRegion:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ENRegionServerAgencyLocalizedConfiguration;
  v6 = [(ENRegionServerAgencyLocalizedConfiguration *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_region, a3);
    uint64_t v8 = [MEMORY[0x263EFF960] currentLocale];
    locale = v7->_locale;
    v7->_locale = (NSLocale *)v8;

    agencyMessage = v7->_agencyMessage;
    v7->_agencyMessage = (NSString *)&stru_26C604128;

    displayName = v7->_displayName;
    v7->_displayName = (NSString *)&stru_26C604128;

    regionName = v7->_regionName;
    v7->_regionName = (NSString *)&stru_26C604128;

    v13 = v7;
  }

  return v7;
}

- (id)notificationConfigurationForName:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(ENRegionServerAgencyLocalizedConfiguration *)self notificationConfigurations];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 classificationName];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (BOOL)getLocalizedAgencyConfiguration:(id *)a3 region:(id)a4 fromDictionary:(id)a5 locale:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v12 = NSDictionaryGetNSNumber();
    long long v13 = (void *)v12;
    BOOL v14 = 0;
    if (v11 && v12)
    {
      id obj = a6;
      long long v15 = [v11 localeIdentifier];
      long long v16 = [v15 uppercaseString];

      v60[0] = MEMORY[0x263EF8330];
      v60[1] = 3221225472;
      v60[2] = __107__ENRegionServerAgencyLocalizedConfiguration_getLocalizedAgencyConfiguration_region_fromDictionary_locale___block_invoke;
      v60[3] = &unk_264244A58;
      id v17 = v16;
      id v61 = v17;
      id v18 = v10;
      id v62 = v18;
      id v63 = v13;
      v19 = (void (**)(void, void))MEMORY[0x2166BC8A0](v60);
      v58 = ((void (**)(void, __CFString *))v19)[2](v19, @"testVerificationIntroMessage");
      ((void (**)(void, __CFString *))v19)[2](v19, @"testVerificationNotificationBody");
      id v57 = (id)objc_claimAutoreleasedReturnValue();
      ((void (**)(void, __CFString *))v19)[2](v19, @"selfReportIntroMessage");
      id v56 = (id)objc_claimAutoreleasedReturnValue();
      ((void (**)(void, __CFString *))v19)[2](v19, @"selfReportNotificationBody");
      id v55 = (id)objc_claimAutoreleasedReturnValue();
      ((void (**)(void, __CFString *))v19)[2](v19, @"symptomsOnsetDescription");
      id v54 = (id)objc_claimAutoreleasedReturnValue();
      ((void (**)(void, __CFString *))v19)[2](v19, @"agencyMessage");
      id v53 = (id)objc_claimAutoreleasedReturnValue();
      if (v53)
      {
        ((void (**)(void, __CFString *))v19)[2](v19, @"agencyTurndownMessage");
        id v52 = (id)objc_claimAutoreleasedReturnValue();
        ((void (**)(void, __CFString *))v19)[2](v19, @"traveledQuestionText");
        id v51 = (id)objc_claimAutoreleasedReturnValue();
        ((void (**)(void, __CFString *))v19)[2](v19, @"vaccinationQuestionText");
        id v50 = (id)objc_claimAutoreleasedReturnValue();
        ((void (**)(void, __CFString *))v19)[2](v19, @"vaccinationQuestionTextAlt");
        id v49 = (id)objc_claimAutoreleasedReturnValue();
        ((void (**)(void, __CFString *))v19)[2](v19, @"agencyDisplayName");
        id v48 = (id)objc_claimAutoreleasedReturnValue();
        if (v48)
        {
          id v47 = v9;
          v20 = ((void (**)(void, __CFString *))v19)[2](v19, @"legalConsentText");
          v21 = ((void (**)(void, __CFString *))v19)[2](v19, @"agencyRegionName");
          if (v21)
          {
            v42 = a3;
            id v43 = v17;
            v44 = v13;
            id v45 = v10;
            ((void (**)(void, __CFString *))v19)[2](v19, @"revokedNotificationBody");
            v39 = (NSString *)objc_claimAutoreleasedReturnValue();
            ((void (**)(void, __CFString *))v19)[2](v19, @"revokedNotificationSubject");
            v40 = (NSString *)objc_claimAutoreleasedReturnValue();
            ((void (**)(void, __CFString *))v19)[2](v19, @"telemetryOptInMessage");
            v41 = (NSString *)objc_claimAutoreleasedReturnValue();
            id v22 = objc_alloc_init(MEMORY[0x263EFF980]);
            unsigned __int8 v23 = 1;
            do
            {
              v24 = (void *)MEMORY[0x2166BC6F0]();
              id v59 = 0;
              unsigned int v25 = v23;
              +[ENRegionServerAgencyExposureNotificationConfiguration getNotificationConfiguration:&v59 fromDictionary:v18 locale:v11 index:v23];
              id v26 = v59;
              if (v26) {
                [v22 addObject:v26];
              }

              ++v23;
            }
            while (v25 < 4);
            v27 = [[ENRegionServerAgencyLocalizedConfiguration alloc] initWithRegion:v47];
            objc_storeStrong((id *)&v27->_locale, obj);
            objc_storeStrong((id *)&v27->_testVerificationIntroMessage, v58);
            objc_storeStrong((id *)&v27->_testVerificationNotificationBody, v57);
            objc_storeStrong((id *)&v27->_selfReportIntroMessage, v56);
            objc_storeStrong((id *)&v27->_selfReportNotificationBody, v55);
            objc_storeStrong((id *)&v27->_symptomsOnsetDescription, v54);
            objc_storeStrong((id *)&v27->_agencyMessage, v53);
            objc_storeStrong((id *)&v27->_agencyTurndownMessage, v52);
            objc_storeStrong((id *)&v27->_traveledQuestionText, v51);
            objc_storeStrong((id *)&v27->_vaccinationQuestionText, v50);
            objc_storeStrong((id *)&v27->_vaccinationQuestionTextAlt, v49);
            objc_storeStrong((id *)&v27->_displayName, v48);
            objc_storeStrong((id *)&v27->_legalConsentText, v20);
            onboardingNotificationBody = v27->_onboardingNotificationBody;
            v27->_onboardingNotificationBody = (NSString *)&stru_26C604128;

            objc_storeStrong((id *)&v27->_regionName, v21);
            revokedNotificationBody = v27->_revokedNotificationBody;
            v27->_revokedNotificationBody = v39;
            v30 = v39;

            revokedNotificationSubject = v27->_revokedNotificationSubject;
            v27->_revokedNotificationSubject = v40;
            v32 = v40;

            phaTelemetryOptInMessage = v27->_phaTelemetryOptInMessage;
            v27->_phaTelemetryOptInMessage = v41;
            v34 = v41;

            uint64_t v35 = [v22 copy];
            notificationConfigurations = v27->_notificationConfigurations;
            v27->_notificationConfigurations = (NSArray *)v35;

            v37 = v27;
            id *v42 = v37;

            long long v13 = v44;
            id v10 = v45;
            id v17 = v43;
          }

          BOOL v14 = v21 != 0;
          id v9 = v47;
        }
        else
        {
          BOOL v14 = 0;
        }
      }
      else
      {
        BOOL v14 = 0;
      }
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

id __107__ENRegionServerAgencyLocalizedConfiguration_getLocalizedAgencyConfiguration_region_fromDictionary_locale___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)NSString;
  id v4 = a2;
  id v5 = (void *)[[v3 alloc] initWithFormat:@"%@_%@", v4, *(void *)(a1 + 32)];

  CFStringGetTypeID();
  id v6 = CFDictionaryGetTypedValue();
  id v7 = v6;

  return v7;
}

- (id)description
{
  long long v15 = NSString;
  id v17 = [(ENRegionServerAgencyLocalizedConfiguration *)self locale];
  v19 = [v17 localeIdentifier];
  BOOL v14 = [(ENRegionServerAgencyLocalizedConfiguration *)self agencyMessage];
  id v18 = [(ENRegionServerAgencyLocalizedConfiguration *)self agencyTurndownMessage];
  v3 = [(ENRegionServerAgencyLocalizedConfiguration *)self legalConsentText];
  id v4 = [(ENRegionServerAgencyLocalizedConfiguration *)self revokedNotificationSubject];
  id v5 = [(ENRegionServerAgencyLocalizedConfiguration *)self revokedNotificationBody];
  id v6 = [(ENRegionServerAgencyLocalizedConfiguration *)self testVerificationIntroMessage];
  long long v13 = [(ENRegionServerAgencyLocalizedConfiguration *)self testVerificationNotificationBody];
  id v7 = [(ENRegionServerAgencyLocalizedConfiguration *)self selfReportIntroMessage];
  uint64_t v8 = [(ENRegionServerAgencyLocalizedConfiguration *)self selfReportNotificationBody];
  id v9 = [(ENRegionServerAgencyLocalizedConfiguration *)self traveledQuestionText];
  id v10 = [(ENRegionServerAgencyLocalizedConfiguration *)self vaccinationQuestionText];
  id v11 = [(ENRegionServerAgencyLocalizedConfiguration *)self phaTelemetryOptInMessage];
  long long v16 = [v15 stringWithFormat:@"[Locale]: %@, [Message]: %@, [Turndown]: %@, [Legal Consent Text]: %@, [Revoked Notification Title]: %@, [Revoked Notification Body]: %@, [TestVerificationIntroMessage]: %@, [TestVerificationNotificationBody]: %@, [SelfReportIntroMessage]: %@, [SelfReportNotificationBody]: %@, [TraveledQuestionText]: %@, [VaccinationQuestionText]: %@, [PHATelemetryOptInMessage]: %@", v19, v14, v18, v3, v4, v5, v6, v13, v7, v8, v9, v10, v11];

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  locale = self->_locale;
  id v5 = a3;
  [v5 encodeObject:locale forKey:@"locale"];
  [v5 encodeObject:self->_agencyMessage forKey:@"agencyMessage"];
  [v5 encodeObject:self->_agencyTurndownMessage forKey:@"agencyTurndownMessage"];
  [v5 encodeObject:self->_displayName forKey:@"agencyDisplayName"];
  [v5 encodeObject:self->_legalConsentText forKey:@"legalConsentText"];
  [v5 encodeObject:self->_onboardingNotificationBody forKey:@"agencyOnboardingNotificationBody"];
  [v5 encodeObject:self->_phaTelemetryOptInMessage forKey:@"telemetryOptInMessage"];
  [v5 encodeObject:self->_region forKey:@"region"];
  [v5 encodeObject:self->_regionName forKey:@"agencyRegionName"];
  [v5 encodeObject:self->_revokedNotificationBody forKey:@"revokedNotificationBody"];
  [v5 encodeObject:self->_revokedNotificationSubject forKey:@"revokedNotificationSubject"];
  [v5 encodeObject:self->_symptomsOnsetDescription forKey:@"symptomsOnsetDescription"];
  [v5 encodeObject:self->_testVerificationIntroMessage forKey:@"testVerificationIntroMessage"];
  [v5 encodeObject:self->_testVerificationNotificationBody forKey:@"testVerificationNotificationBody"];
  [v5 encodeObject:self->_selfReportIntroMessage forKey:@"selfReportIntroMessage"];
  [v5 encodeObject:self->_selfReportNotificationBody forKey:@"selfReportNotificationBody"];
  [v5 encodeObject:self->_traveledQuestionText forKey:@"traveledQuestionText"];
  [v5 encodeObject:self->_vaccinationQuestionText forKey:@"vaccinationQuestionText"];
  [v5 encodeObject:self->_vaccinationQuestionTextAlt forKey:@"vaccinationQuestionTextAlt"];
  [v5 encodeObject:self->_notificationConfigurations forKey:@"notifications"];
}

- (ENRegionServerAgencyLocalizedConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  id obj = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locale"];
  if (obj)
  {
    id v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"region"];
    if (v27)
    {
      id v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"agencyMessage"];
      if (v26)
      {
        id v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"agencyTurndownMessage"];
        id v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"agencyDisplayName"];
        if (v24)
        {
          id v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"legalConsentText"];
          id v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"agencyOnboardingNotificationBody"];
          id v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"telemetryOptInMessage"];
          id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"agencyRegionName"];
          if (v5)
          {
            id v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"revokedNotificationBody"];
            id v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"revokedNotificationSubject"];
            id v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"symptomsOnsetDescription"];
            id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"testVerificationIntroMessage"];
            id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"testVerificationNotificationBody"];
            uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selfReportIntroMessage"];
            id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selfReportNotificationBody"];
            id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"traveledQuestionText"];
            id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vaccinationQuestionText"];
            uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vaccinationQuestionTextAlt"];
            id v30 = 0;
            objc_opt_class();
            NSDecodeNSArrayOfClassIfPresent();
            v29.receiver = self;
            v29.super_class = (Class)ENRegionServerAgencyLocalizedConfiguration;
            long long v13 = [(ENRegionServerAgencyLocalizedConfiguration *)&v29 init];
            p_isa = (id *)&v13->super.isa;
            if (v13)
            {
              objc_storeStrong((id *)&v13->_locale, obj);
              objc_storeStrong(p_isa + 2, v27);
              objc_storeStrong(p_isa + 13, v6);
              objc_storeStrong(p_isa + 14, v7);
              objc_storeStrong(p_isa + 19, v8);
              objc_storeStrong(p_isa + 18, v9);
              objc_storeStrong(p_isa + 12, v18);
              objc_storeStrong(p_isa + 3, v26);
              objc_storeStrong(p_isa + 4, v25);
              objc_storeStrong(p_isa + 15, v10);
              objc_storeStrong(p_isa + 16, v11);
              objc_storeStrong(p_isa + 17, v12);
              objc_storeStrong(p_isa + 5, v24);
              objc_storeStrong(p_isa + 6, v23);
              objc_storeStrong(p_isa + 7, v22);
              objc_storeStrong(p_isa + 8, v21);
              objc_storeStrong(p_isa + 9, v5);
              objc_storeStrong(p_isa + 10, v20);
              objc_storeStrong(p_isa + 11, v19);
              if (v30) {
                id v15 = v30;
              }
              else {
                id v15 = (id)MEMORY[0x263EFFA68];
              }
              objc_storeStrong(p_isa + 20, v15);
            }
            self = p_isa;

            long long v16 = self;
          }
          else
          {
            long long v16 = 0;
          }
        }
        else
        {
          long long v16 = 0;
        }
      }
      else
      {
        long long v16 = 0;
      }
    }
    else
    {
      long long v16 = 0;
    }
  }
  else
  {
    long long v16 = 0;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (ENRegion)region
{
  return self->_region;
}

- (NSString)agencyMessage
{
  return self->_agencyMessage;
}

- (void)setAgencyMessage:(id)a3
{
}

- (NSString)agencyTurndownMessage
{
  return self->_agencyTurndownMessage;
}

- (void)setAgencyTurndownMessage:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)legalConsentText
{
  return self->_legalConsentText;
}

- (void)setLegalConsentText:(id)a3
{
}

- (NSString)onboardingNotificationBody
{
  return self->_onboardingNotificationBody;
}

- (void)setOnboardingNotificationBody:(id)a3
{
}

- (NSString)phaTelemetryOptInMessage
{
  return self->_phaTelemetryOptInMessage;
}

- (void)setPhaTelemetryOptInMessage:(id)a3
{
}

- (NSString)regionName
{
  return self->_regionName;
}

- (void)setRegionName:(id)a3
{
}

- (NSString)revokedNotificationBody
{
  return self->_revokedNotificationBody;
}

- (void)setRevokedNotificationBody:(id)a3
{
}

- (NSString)revokedNotificationSubject
{
  return self->_revokedNotificationSubject;
}

- (void)setRevokedNotificationSubject:(id)a3
{
}

- (NSString)symptomsOnsetDescription
{
  return self->_symptomsOnsetDescription;
}

- (void)setSymptomsOnsetDescription:(id)a3
{
}

- (NSString)testVerificationIntroMessage
{
  return self->_testVerificationIntroMessage;
}

- (void)setTestVerificationIntroMessage:(id)a3
{
}

- (NSString)testVerificationNotificationBody
{
  return self->_testVerificationNotificationBody;
}

- (void)setTestVerificationNotificationBody:(id)a3
{
}

- (NSString)traveledQuestionText
{
  return self->_traveledQuestionText;
}

- (void)setTraveledQuestionText:(id)a3
{
}

- (NSString)vaccinationQuestionText
{
  return self->_vaccinationQuestionText;
}

- (void)setVaccinationQuestionText:(id)a3
{
}

- (NSString)vaccinationQuestionTextAlt
{
  return self->_vaccinationQuestionTextAlt;
}

- (void)setVaccinationQuestionTextAlt:(id)a3
{
}

- (NSString)selfReportNotificationBody
{
  return self->_selfReportNotificationBody;
}

- (void)setSelfReportNotificationBody:(id)a3
{
}

- (NSString)selfReportIntroMessage
{
  return self->_selfReportIntroMessage;
}

- (void)setSelfReportIntroMessage:(id)a3
{
}

- (NSArray)notificationConfigurations
{
  return self->_notificationConfigurations;
}

- (void)setNotificationConfigurations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationConfigurations, 0);
  objc_storeStrong((id *)&self->_selfReportIntroMessage, 0);
  objc_storeStrong((id *)&self->_selfReportNotificationBody, 0);
  objc_storeStrong((id *)&self->_vaccinationQuestionTextAlt, 0);
  objc_storeStrong((id *)&self->_vaccinationQuestionText, 0);
  objc_storeStrong((id *)&self->_traveledQuestionText, 0);
  objc_storeStrong((id *)&self->_testVerificationNotificationBody, 0);
  objc_storeStrong((id *)&self->_testVerificationIntroMessage, 0);
  objc_storeStrong((id *)&self->_symptomsOnsetDescription, 0);
  objc_storeStrong((id *)&self->_revokedNotificationSubject, 0);
  objc_storeStrong((id *)&self->_revokedNotificationBody, 0);
  objc_storeStrong((id *)&self->_regionName, 0);
  objc_storeStrong((id *)&self->_phaTelemetryOptInMessage, 0);
  objc_storeStrong((id *)&self->_onboardingNotificationBody, 0);
  objc_storeStrong((id *)&self->_legalConsentText, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_agencyTurndownMessage, 0);
  objc_storeStrong((id *)&self->_agencyMessage, 0);
  objc_storeStrong((id *)&self->_region, 0);

  objc_storeStrong((id *)&self->_locale, 0);
}

@end