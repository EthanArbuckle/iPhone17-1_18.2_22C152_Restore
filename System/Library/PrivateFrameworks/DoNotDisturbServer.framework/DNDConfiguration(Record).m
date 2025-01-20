@interface DNDConfiguration(Record)
+ (id)configurationForRecord:()Record secureRecord:;
- (DNDSMutableConfigurationRecord)makeRecord;
- (DNDSMutableConfigurationSecureRecord)makeSecureRecord;
@end

@implementation DNDConfiguration(Record)

+ (id)configurationForRecord:()Record secureRecord:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F5F6E8] defaultConfiguration];
  v8 = [v5 applicationConfigurationType];
  objc_msgSend(v7, "setApplicationConfigurationType:", objc_msgSend(v8, "integerValue"));

  v9 = [v5 senderConfigurationType];
  objc_msgSend(v7, "setSenderConfigurationType:", objc_msgSend(v9, "integerValue"));

  v10 = [v5 suppressionType];
  objc_msgSend(v7, "setSuppressionType:", objc_msgSend(v10, "unsignedIntegerValue"));

  v11 = [v5 suppressionMode];
  v33 = v7;
  objc_msgSend(v7, "setSuppressionMode:", objc_msgSend(v11, "unsignedIntegerValue"));

  v12 = objc_opt_new();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v13 = [v6 allowedApplications];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        v19 = [v6 allowedApplications];
        v20 = [v19 objectForKey:v18];

        v21 = [MEMORY[0x1E4F5F590] configurationForRecord:v20];
        [v12 setObject:v21 forKey:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v15);
  }

  [v33 setAllowedApplicationIdentifiers:v12];
  v22 = [v6 deniedApplications];
  [v33 setDeniedApplicationIdentifiers:v22];

  v23 = [v6 allowedWebApplications];
  [v33 setAllowedWebApplicationIdentifiers:v23];

  v24 = [v6 deniedWebApplications];
  [v33 setDeniedWebApplicationIdentifiers:v24];

  v25 = (void *)MEMORY[0x1E4F5F748];
  v26 = [v6 senderConfiguration];
  v27 = [v25 configurationForRecord:v26];
  [v33 setSenderConfiguration:v27];

  v28 = [v5 minimumBreakthroughUrgency];
  objc_msgSend(v33, "setMinimumBreakthroughUrgency:", objc_msgSend(v28, "integerValue"));

  v29 = [v5 hideApplicationBadges];
  objc_msgSend(v33, "setHideApplicationBadges:", objc_msgSend(v29, "integerValue"));

  v30 = [v5 allowIntelligentManagement];
  objc_msgSend(v33, "setAllowIntelligentManagement:", objc_msgSend(v30, "integerValue"));

  v31 = [v5 compatibilityVersion];
  objc_msgSend(v33, "setCompatibilityVersion:", objc_msgSend(v31, "integerValue"));

  return v33;
}

- (DNDSMutableConfigurationRecord)makeRecord
{
  v2 = objc_alloc_init(DNDSMutableConfigurationRecord);
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "applicationConfigurationType"));
  [(DNDSMutableConfigurationRecord *)v2 setApplicationConfigurationType:v3];

  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "senderConfigurationType"));
  [(DNDSMutableConfigurationRecord *)v2 setSenderConfigurationType:v4];

  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "suppressionType"));
  [(DNDSMutableConfigurationRecord *)v2 setSuppressionType:v5];

  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "suppressionMode"));
  [(DNDSMutableConfigurationRecord *)v2 setSuppressionMode:v6];

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "minimumBreakthroughUrgency"));
  [(DNDSMutableConfigurationRecord *)v2 setMinimumBreakthroughUrgency:v7];

  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "hideApplicationBadges"));
  [(DNDSMutableConfigurationRecord *)v2 setHideApplicationBadges:v8];

  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "allowIntelligentManagement"));
  [(DNDSMutableConfigurationRecord *)v2 setAllowIntelligentManagement:v9];

  v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "compatibilityVersion"));
  [(DNDSMutableConfigurationRecord *)v2 setCompatibilityVersion:v10];

  return v2;
}

- (DNDSMutableConfigurationSecureRecord)makeSecureRecord
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(DNDSMutableConfigurationSecureRecord);
  v3 = [a1 senderConfiguration];
  v4 = [v3 makeRecord];
  [(DNDSMutableConfigurationSecureRecord *)v2 setSenderConfiguration:v4];

  id v5 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = objc_msgSend(a1, "allowedApplicationIdentifiers", 0);
  v7 = [v6 allKeys];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v13 = [a1 allowedApplicationIdentifiers];
        uint64_t v14 = [v13 objectForKey:v12];

        uint64_t v15 = [v14 makeRecord];
        [v5 setObject:v15 forKey:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  [(DNDSMutableConfigurationSecureRecord *)v2 setAllowedApplications:v5];
  uint64_t v16 = [a1 deniedApplicationIdentifiers];
  [(DNDSMutableConfigurationSecureRecord *)v2 setDeniedApplications:v16];

  v17 = [a1 allowedWebApplicationIdentifiers];
  [(DNDSMutableConfigurationSecureRecord *)v2 setAllowedWebApplications:v17];

  uint64_t v18 = [a1 deniedWebApplicationIdentifiers];
  [(DNDSMutableConfigurationSecureRecord *)v2 setDeniedWebApplications:v18];

  return v2;
}

@end