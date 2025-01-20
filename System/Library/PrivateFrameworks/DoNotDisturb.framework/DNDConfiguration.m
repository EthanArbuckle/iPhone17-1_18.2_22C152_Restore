@interface DNDConfiguration
+ (BOOL)supportsSecureCoding;
+ (unint64_t)defaultConfigurationType;
+ (unint64_t)defaultMinimumBreakthroughUrgency;
+ (unint64_t)defaultSuppressionType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSupportedConfiguration;
- (DNDBypassSettings)phoneCallBypassSettings;
- (DNDConfiguration)initWithCoder:(id)a3;
- (DNDSenderConfiguration)senderConfiguration;
- (NSDictionary)allowedApplicationIdentifiers;
- (NSDictionary)threadsWithExceptions;
- (NSSet)allowedWebApplicationIdentifiers;
- (NSSet)applicationsWithExceptions;
- (NSSet)contactsWithExceptions;
- (NSSet)deniedApplicationIdentifiers;
- (NSSet)deniedWebApplicationIdentifiers;
- (NSSet)webApplicationsWithExceptions;
- (id)_descriptionForRedacted:(BOOL)a3;
- (id)_initWithConfigurationType:(unint64_t)a3;
- (id)_initWithSuppressionType:(unint64_t)a3 suppressionMode:(unint64_t)a4 allowedApplicationIdentifiers:(id)a5 deniedApplicationIdentifiers:(id)a6 allowedWebApplicationIdentifiers:(id)a7 deniedWebApplicationIdentifiers:(id)a8 senderConfiguration:(id)a9 minimumBreakthroughUrgency:(unint64_t)a10 hideApplicationBadges:(unint64_t)a11 allowIntelligentManagement:(unint64_t)a12 compatibilityVersion:(int64_t)a13 applicationConfigurationType:(unint64_t)a14 senderConfigurationType:(unint64_t)a15;
- (id)allowedApplications;
- (id)deniedApplications;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)redactedDescription;
- (int64_t)compatibilityVersion;
- (int64_t)rawCompatibilityVersion;
- (unint64_t)_exceptionForApplicationIdentifier:(id)a3 thread:(id)a4;
- (unint64_t)allowIntelligentManagement;
- (unint64_t)applicationConfigurationType;
- (unint64_t)exceptionForApplication:(id)a3;
- (unint64_t)exceptionForApplication:(id)a3 thread:(id)a4;
- (unint64_t)exceptionForApplicationIdentifier:(id)a3;
- (unint64_t)exceptionForContactHandle:(id)a3;
- (unint64_t)exceptionForWebApplicationIdentifier:(id)a3;
- (unint64_t)hash;
- (unint64_t)hideApplicationBadges;
- (unint64_t)minimumBreakthroughUrgency;
- (unint64_t)senderConfigurationType;
- (unint64_t)suppressionMode;
- (unint64_t)suppressionType;
- (unint64_t)type;
- (void)diffAgainstObject:(id)a3 usingDiffBuilder:(id)a4 withDescription:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)log:(id)a3 withPrefix:(id)a4;
- (void)setAllowedWebApplicationIdentifiers:(id)a3;
- (void)setDeniedWebApplicationIdentifiers:(id)a3;
@end

@implementation DNDConfiguration

+ (unint64_t)defaultConfigurationType
{
  return 0;
}

+ (unint64_t)defaultSuppressionType
{
  return 2;
}

+ (unint64_t)defaultMinimumBreakthroughUrgency
{
  return 0;
}

- (id)_initWithConfigurationType:(unint64_t)a3
{
  return [(DNDConfiguration *)self _initWithSuppressionType:+[DNDConfiguration defaultSuppressionType](DNDConfiguration, "defaultSuppressionType") suppressionMode:0 allowedApplicationIdentifiers:0 deniedApplicationIdentifiers:0 allowedWebApplicationIdentifiers:0 deniedWebApplicationIdentifiers:0 senderConfiguration:0 minimumBreakthroughUrgency:+[DNDConfiguration defaultMinimumBreakthroughUrgency] hideApplicationBadges:2 allowIntelligentManagement:1 compatibilityVersion:2 applicationConfigurationType:a3 senderConfigurationType:a3];
}

- (id)_initWithSuppressionType:(unint64_t)a3 suppressionMode:(unint64_t)a4 allowedApplicationIdentifiers:(id)a5 deniedApplicationIdentifiers:(id)a6 allowedWebApplicationIdentifiers:(id)a7 deniedWebApplicationIdentifiers:(id)a8 senderConfiguration:(id)a9 minimumBreakthroughUrgency:(unint64_t)a10 hideApplicationBadges:(unint64_t)a11 allowIntelligentManagement:(unint64_t)a12 compatibilityVersion:(int64_t)a13 applicationConfigurationType:(unint64_t)a14 senderConfigurationType:(unint64_t)a15
{
  id v21 = a5;
  id v22 = a6;
  id v23 = a7;
  id v24 = a8;
  id v25 = a9;
  v49.receiver = self;
  v49.super_class = (Class)DNDConfiguration;
  v26 = [(DNDConfiguration *)&v49 init];
  v27 = v26;
  if (v26)
  {
    v26->_suppressionType = a3;
    v26->_suppressionMode = a4;
    v28 = (void *)[v21 mutableCopy];
    v29 = v28;
    if (v28) {
      v30 = v28;
    }
    else {
      v30 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    allowedApplicationIdentifiers = v27->_allowedApplicationIdentifiers;
    v27->_allowedApplicationIdentifiers = v30;

    v32 = (void *)[v22 mutableCopy];
    v33 = v32;
    if (v32) {
      v34 = v32;
    }
    else {
      v34 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    }
    deniedApplicationIdentifiers = v27->_deniedApplicationIdentifiers;
    v27->_deniedApplicationIdentifiers = v34;

    v36 = (void *)[v23 mutableCopy];
    v37 = v36;
    if (v36) {
      v38 = v36;
    }
    else {
      v38 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    }
    allowedWebApplicationIdentifiers = v27->_allowedWebApplicationIdentifiers;
    v27->_allowedWebApplicationIdentifiers = v38;

    v40 = (void *)[v24 mutableCopy];
    v41 = v40;
    if (v40) {
      v42 = v40;
    }
    else {
      v42 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    }
    deniedWebApplicationIdentifiers = v27->_deniedWebApplicationIdentifiers;
    v27->_deniedWebApplicationIdentifiers = v42;

    v44 = (void *)[v25 mutableCopy];
    v45 = v44;
    if (v44) {
      v46 = v44;
    }
    else {
      v46 = objc_alloc_init(DNDMutableSenderConfiguration);
    }
    senderConfiguration = v27->_senderConfiguration;
    v27->_senderConfiguration = v46;

    v27->_minimumBreakthroughUrgency = a10;
    v27->_hideApplicationBadges = a11;
    v27->_allowIntelligentManagement = a12;
    v27->_compatibilityVersion = a13;
    v27->_applicationConfigurationType = a14;
    v27->_senderConfigurationType = a15;
  }

  return v27;
}

- (id)allowedApplications
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = self->_allowedApplicationIdentifiers;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = -[NSMutableDictionary objectForKeyedSubscript:](self->_allowedApplicationIdentifiers, "objectForKeyedSubscript:", v9, (void)v13);
        v11 = [v9 bundleID];
        [v3 setObject:v10 forKeyedSubscript:v11];
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)deniedApplications
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA80] set];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = self->_deniedApplicationIdentifiers;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "bundleID", (void)v11);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(DNDConfiguration *)self suppressionType];
  unint64_t v4 = [(DNDConfiguration *)self suppressionMode] ^ v3;
  uint64_t v5 = [(DNDConfiguration *)self allowedApplicationIdentifiers];
  uint64_t v6 = v4 ^ [v5 hash];
  uint64_t v7 = [(DNDConfiguration *)self deniedApplicationIdentifiers];
  uint64_t v8 = [v7 hash];
  v9 = [(DNDConfiguration *)self allowedWebApplicationIdentifiers];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  long long v11 = [(DNDConfiguration *)self deniedWebApplicationIdentifiers];
  uint64_t v12 = [v11 hash];
  long long v13 = [(DNDConfiguration *)self senderConfiguration];
  uint64_t v14 = v12 ^ [v13 hash];
  unint64_t v15 = v10 ^ v14 ^ [(DNDConfiguration *)self minimumBreakthroughUrgency];
  unint64_t v16 = [(DNDConfiguration *)self hideApplicationBadges];
  unint64_t v17 = v16 ^ [(DNDConfiguration *)self allowIntelligentManagement];
  int64_t v18 = v17 ^ [(DNDConfiguration *)self compatibilityVersion];
  unint64_t v19 = v18 ^ [(DNDConfiguration *)self applicationConfigurationType];
  unint64_t v20 = v15 ^ v19 ^ [(DNDConfiguration *)self senderConfigurationType];

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (DNDConfiguration *)a3;
  if (self == v6)
  {
    BOOL v16 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = v6;
      unint64_t v8 = [(DNDConfiguration *)self suppressionType];
      if (v8 != [(DNDConfiguration *)v7 suppressionType]
        || (unint64_t v9 = [(DNDConfiguration *)self suppressionMode],
            v9 != [(DNDConfiguration *)v7 suppressionMode]))
      {
        BOOL v16 = 0;
LABEL_79:

        goto LABEL_80;
      }
      uint64_t v10 = [(DNDConfiguration *)self allowedApplicationIdentifiers];
      long long v11 = [(DNDConfiguration *)v7 allowedApplicationIdentifiers];
      if (v10 != v11)
      {
        uint64_t v12 = [(DNDConfiguration *)self allowedApplicationIdentifiers];
        if (!v12)
        {
          BOOL v16 = 0;
          goto LABEL_78;
        }
        unint64_t v3 = (void *)v12;
        uint64_t v13 = [(DNDConfiguration *)v7 allowedApplicationIdentifiers];
        if (!v13)
        {
          BOOL v16 = 0;
LABEL_77:

          goto LABEL_78;
        }
        unint64_t v4 = (void *)v13;
        uint64_t v14 = [(DNDConfiguration *)self allowedApplicationIdentifiers];
        unint64_t v15 = [(DNDConfiguration *)v7 allowedApplicationIdentifiers];
        if (![v14 isEqual:v15])
        {
          BOOL v16 = 0;
LABEL_76:

          goto LABEL_77;
        }
        v73 = v15;
        v74 = v14;
      }
      unint64_t v17 = [(DNDConfiguration *)self deniedApplicationIdentifiers];
      uint64_t v18 = [(DNDConfiguration *)v7 deniedApplicationIdentifiers];
      unint64_t v19 = (void *)v18;
      if (v17 != (void *)v18)
      {
        uint64_t v20 = [(DNDConfiguration *)self deniedApplicationIdentifiers];
        if (v20)
        {
          id v21 = (void *)v20;
          uint64_t v22 = [(DNDConfiguration *)v7 deniedApplicationIdentifiers];
          if (v22)
          {
            v75 = v19;
            v70 = (void *)v22;
            v71 = v3;
            id v23 = v4;
            id v24 = [(DNDConfiguration *)self deniedApplicationIdentifiers];
            id v25 = [(DNDConfiguration *)v7 deniedApplicationIdentifiers];
            if (([v24 isEqual:v25] & 1) == 0)
            {

              BOOL v16 = 0;
              unint64_t v15 = v73;
              uint64_t v14 = v74;
              unint64_t v4 = v23;
              unint64_t v3 = v71;
              if (v10 == v11) {
                goto LABEL_78;
              }
              goto LABEL_76;
            }
            v64 = v25;
            v65 = v24;
            v63 = v21;
            unint64_t v4 = v23;
            unint64_t v3 = v71;
LABEL_20:
            uint64_t v26 = [(DNDConfiguration *)self allowedWebApplicationIdentifiers];
            uint64_t v27 = [(DNDConfiguration *)v7 allowedWebApplicationIdentifiers];
            v28 = (void *)v27;
            v72 = (void *)v26;
            if (v26 == v27)
            {
              v69 = (void *)v27;
              goto LABEL_28;
            }
            uint64_t v29 = [(DNDConfiguration *)self allowedWebApplicationIdentifiers];
            if (v29)
            {
              v66 = (void *)v29;
              uint64_t v30 = [(DNDConfiguration *)v7 allowedWebApplicationIdentifiers];
              if (v30)
              {
                v69 = v28;
                v62 = (void *)v30;
                v28 = [(DNDConfiguration *)self allowedWebApplicationIdentifiers];
                v31 = [(DNDConfiguration *)v7 allowedWebApplicationIdentifiers];
                if ([v28 isEqual:v31])
                {
                  v60 = v28;
                  v58 = v31;
LABEL_28:
                  uint64_t v32 = [(DNDConfiguration *)self deniedWebApplicationIdentifiers];
                  v67 = [(DNDConfiguration *)v7 deniedWebApplicationIdentifiers];
                  v68 = (void *)v32;
                  if ((void *)v32 == v67) {
                    goto LABEL_37;
                  }
                  uint64_t v33 = [(DNDConfiguration *)self deniedWebApplicationIdentifiers];
                  if (v33)
                  {
                    v59 = (void *)v33;
                    uint64_t v34 = [(DNDConfiguration *)v7 deniedWebApplicationIdentifiers];
                    if (v34)
                    {
                      v57 = (void *)v34;
                      v35 = [(DNDConfiguration *)self deniedWebApplicationIdentifiers];
                      v28 = [(DNDConfiguration *)v7 deniedWebApplicationIdentifiers];
                      if ([v35 isEqual:v28])
                      {
                        v54 = v35;
LABEL_37:
                        v36 = [(DNDConfiguration *)self senderConfiguration];
                        v61 = [(DNDConfiguration *)v7 senderConfiguration];
                        if (v36 == v61)
                        {
                          v56 = v4;
                        }
                        else
                        {
                          uint64_t v37 = [(DNDConfiguration *)self senderConfiguration];
                          if (!v37)
                          {

                            BOOL v16 = 0;
LABEL_89:
                            if (v68 != v67)
                            {
                            }
                            if (v72 != v69)
                            {
                            }
                            if (v17 != v75)
                            {
                            }
                            goto LABEL_95;
                          }
                          v55 = (void *)v37;
                          uint64_t v38 = [(DNDConfiguration *)v7 senderConfiguration];
                          if (!v38)
                          {
                            BOOL v16 = 0;
LABEL_88:

                            goto LABEL_89;
                          }
                          v50 = v28;
                          v39 = v36;
                          v53 = (void *)v38;
                          v40 = [(DNDConfiguration *)self senderConfiguration];
                          v51 = [(DNDConfiguration *)v7 senderConfiguration];
                          v52 = v40;
                          if (!objc_msgSend(v40, "isEqual:"))
                          {
                            BOOL v16 = 0;
                            v36 = v39;
                            v28 = v50;
LABEL_87:

                            goto LABEL_88;
                          }
                          v56 = v4;
                          v36 = v39;
                          v28 = v50;
                        }
                        unint64_t v42 = [(DNDConfiguration *)self minimumBreakthroughUrgency];
                        if (v42 != [(DNDConfiguration *)v7 minimumBreakthroughUrgency]
                          || (unint64_t v43 = [(DNDConfiguration *)self hideApplicationBadges],
                              v43 != [(DNDConfiguration *)v7 hideApplicationBadges])
                          || (unint64_t v44 = [(DNDConfiguration *)self allowIntelligentManagement],
                              v44 != [(DNDConfiguration *)v7 allowIntelligentManagement])
                          || (int64_t v45 = [(DNDConfiguration *)self compatibilityVersion],
                              v45 != [(DNDConfiguration *)v7 compatibilityVersion])
                          || (unint64_t v46 = [(DNDConfiguration *)self applicationConfigurationType], v46 != [(DNDConfiguration *)v7 applicationConfigurationType]))
                        {
                          if (v36 != v61)
                          {

                            BOOL v16 = 0;
                            v48 = v67;
                            unint64_t v4 = v56;
                            if (v68 == v67)
                            {
LABEL_60:

                              if (v72 != v69)
                              {
                              }
                              if (v17 != v75)
                              {
                              }
LABEL_95:

LABEL_75:
                              unint64_t v15 = v73;
                              uint64_t v14 = v74;
                              if (v10 != v11) {
                                goto LABEL_76;
                              }
LABEL_78:

                              goto LABEL_79;
                            }
LABEL_59:

                            v48 = v67;
                            goto LABEL_60;
                          }
                          BOOL v16 = 0;
                          unint64_t v4 = v56;
LABEL_83:

                          v48 = v67;
                          if (v68 == v67) {
                            goto LABEL_60;
                          }
                          goto LABEL_59;
                        }
                        unint64_t v47 = [(DNDConfiguration *)self senderConfigurationType];
                        BOOL v16 = v47 == [(DNDConfiguration *)v7 senderConfigurationType];
                        unint64_t v4 = v56;
                        if (v36 == v61) {
                          goto LABEL_83;
                        }
                        goto LABEL_87;
                      }
                      v41 = v60;
                    }
                    else
                    {
                      v41 = v60;
                    }
                  }
                  else
                  {
                    v41 = v60;
                  }

                  if (v72 == v69)
                  {
                  }
                  else
                  {
                  }
                  if (v17 != v75)
                  {
                  }
LABEL_74:

                  BOOL v16 = 0;
                  goto LABEL_75;
                }

LABEL_45:
                if (v17 == v75)
                {
                }
                else
                {
                }
                goto LABEL_74;
              }
            }
            goto LABEL_45;
          }
        }
        goto LABEL_74;
      }
      v75 = (void *)v18;
      goto LABEL_20;
    }
    BOOL v16 = 0;
  }
LABEL_80:

  return v16;
}

- (id)description
{
  return [(DNDConfiguration *)self _descriptionForRedacted:0];
}

- (id)redactedDescription
{
  return [(DNDConfiguration *)self _descriptionForRedacted:1];
}

- (id)_descriptionForRedacted:(BOOL)a3
{
  BOOL v3 = a3;
  id v25 = NSString;
  uint64_t v24 = objc_opt_class();
  uint64_t v26 = DNDStringFromInterruptionSuppression(self->_suppressionType);
  uint64_t v5 = DNDStringFromInterruptionSuppressionMode(self->_suppressionMode);
  allowedApplicationIdentifiers = self->_allowedApplicationIdentifiers;
  deniedWebApplicationIdentifiers = self->_deniedWebApplicationIdentifiers;
  allowedWebApplicationIdentifiers = self->_allowedWebApplicationIdentifiers;
  deniedApplicationIdentifiers = self->_deniedApplicationIdentifiers;
  senderConfiguration = self->_senderConfiguration;
  BOOL v27 = v3;
  if (v3)
  {
    senderConfiguration = [senderConfiguration redactedDescription];
  }
  unint64_t v8 = DNDStringFromBreakthroughUrgency(self->_minimumBreakthroughUrgency);
  unint64_t v9 = DNDEnabledSettingToString([(DNDConfiguration *)self hideApplicationBadges]);
  uint64_t v10 = DNDEnabledSettingToString([(DNDConfiguration *)self allowIntelligentManagement]);
  long long v11 = @"Inclusive";
  unint64_t applicationConfigurationType = self->_applicationConfigurationType;
  unint64_t senderConfigurationType = self->_senderConfigurationType;
  if (applicationConfigurationType) {
    uint64_t v14 = @"Inclusive";
  }
  else {
    uint64_t v14 = @"Exclusive";
  }
  if (applicationConfigurationType == 2) {
    unint64_t v15 = @"Unconfigured";
  }
  else {
    unint64_t v15 = v14;
  }
  if (!senderConfigurationType) {
    long long v11 = @"Exclusive";
  }
  if (senderConfigurationType == 2) {
    long long v11 = @"Unconfigured";
  }
  BOOL v16 = v11;
  unint64_t v17 = v15;
  uint64_t v18 = DNDCompatibilityVersionToString([(DNDConfiguration *)self compatibilityVersion]);
  objc_msgSend(v25, "stringWithFormat:", @"<%@: %p; suppressionType: %@; suppressionMode: %@ allowedApplicationIdentifiers: %@; deniedApplicationIdentifiers: %@; allowedWebApplicationIdentifiers: %@; deniedWebApplicationIdentifiers: %@; senderConfiguration: %@; minimumBreakthroughUrgency: %@; hideApplicationBadges: %@; allowIntelligentManagement: %@; applicationConfigurationType: %@; senderConfigurationType: %@; compatibilityVersion: %@; >",
    v24,
    self,
    v26,
    v5,
    allowedApplicationIdentifiers,
    deniedApplicationIdentifiers,
    allowedWebApplicationIdentifiers,
    deniedWebApplicationIdentifiers,
    senderConfiguration,
    v8,
    v9,
    v10,
    v17,
    v16,
  unint64_t v19 = v18);

  if (v27) {
  return v19;
  }
}

- (void)log:(id)a3 withPrefix:(id)a4
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a3;
  id v6 = a4;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v70 = v6;
    _os_log_impl(&dword_19CC2C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Begin configuration", buf, 0xCu);
  }
  uint64_t v7 = v5;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    DNDStringFromInterruptionSuppression(self->_suppressionType);
    unint64_t v47 = (DNDMutableSenderConfiguration *)objc_claimAutoreleasedReturnValue();
    unint64_t v8 = DNDStringFromInterruptionSuppressionMode(self->_suppressionMode);
    unint64_t v9 = DNDStringFromBreakthroughUrgency(self->_minimumBreakthroughUrgency);
    uint64_t v10 = DNDEnabledSettingToString([(DNDConfiguration *)self hideApplicationBadges]);
    long long v11 = DNDEnabledSettingToString([(DNDConfiguration *)self allowIntelligentManagement]);
    uint64_t v12 = @"Inclusive";
    unint64_t applicationConfigurationType = self->_applicationConfigurationType;
    unint64_t senderConfigurationType = self->_senderConfigurationType;
    if (applicationConfigurationType) {
      unint64_t v15 = @"Inclusive";
    }
    else {
      unint64_t v15 = @"Exclusive";
    }
    if (applicationConfigurationType == 2) {
      BOOL v16 = @"Unconfigured";
    }
    else {
      BOOL v16 = v15;
    }
    if (!senderConfigurationType) {
      uint64_t v12 = @"Exclusive";
    }
    if (senderConfigurationType == 2) {
      unint64_t v17 = @"Unconfigured";
    }
    else {
      unint64_t v17 = v12;
    }
    unint64_t v46 = v17;
    int64_t v45 = v16;
    uint64_t v18 = DNDCompatibilityVersionToString([(DNDConfiguration *)self compatibilityVersion]);
    *(_DWORD *)buf = 138545410;
    id v70 = v6;
    __int16 v71 = 2114;
    v72 = v47;
    __int16 v73 = 2114;
    v74 = v8;
    __int16 v75 = 2114;
    v76 = v9;
    __int16 v77 = 2114;
    v78 = v10;
    __int16 v79 = 2114;
    v80 = v11;
    __int16 v81 = 2114;
    v82 = v16;
    __int16 v83 = 2114;
    v84 = v17;
    __int16 v85 = 2114;
    v86 = v18;
    _os_log_impl(&dword_19CC2C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] suppressionType: %{public}@; suppressionMode: %{public}@; minimumBreakthroughUrgency: %{public}@; hid"
      "eApplicationBadges: %{public}@; allowIntelligentManagement: %{public}@; applicationConfigurationType: %{public}@; "
      "senderConfigurationType: %{public}@; compatibilityVersion: %{public}@",
      buf,
      0x5Cu);
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  unint64_t v19 = self->_allowedApplicationIdentifiers;
  uint64_t v20 = [(NSMutableDictionary *)v19 countByEnumeratingWithState:&v61 objects:v68 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v62 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(DNDMutableSenderConfiguration **)(*((void *)&v61 + 1) + 8 * i);
        id v25 = [(NSMutableDictionary *)self->_allowedApplicationIdentifiers objectForKeyedSubscript:v24];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543875;
          id v70 = v6;
          __int16 v71 = 2113;
          v72 = v24;
          __int16 v73 = 2113;
          v74 = v25;
          _os_log_impl(&dword_19CC2C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Allowed app: %{private}@; %{private}@",
            buf,
            0x20u);
        }
      }
      uint64_t v21 = [(NSMutableDictionary *)v19 countByEnumeratingWithState:&v61 objects:v68 count:16];
    }
    while (v21);
  }

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v26 = self->_deniedApplicationIdentifiers;
  uint64_t v27 = [(NSMutableSet *)v26 countByEnumeratingWithState:&v57 objects:v67 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v58;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v58 != v29) {
          objc_enumerationMutation(v26);
        }
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v31 = *(DNDMutableSenderConfiguration **)(*((void *)&v57 + 1) + 8 * j);
          *(_DWORD *)buf = 138543619;
          id v70 = v6;
          __int16 v71 = 2113;
          v72 = v31;
          _os_log_impl(&dword_19CC2C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Denied app: %{private}@", buf, 0x16u);
        }
      }
      uint64_t v28 = [(NSMutableSet *)v26 countByEnumeratingWithState:&v57 objects:v67 count:16];
    }
    while (v28);
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v32 = self->_allowedWebApplicationIdentifiers;
  uint64_t v33 = [(NSMutableSet *)v32 countByEnumeratingWithState:&v53 objects:v66 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v54;
    do
    {
      for (uint64_t k = 0; k != v34; ++k)
      {
        if (*(void *)v54 != v35) {
          objc_enumerationMutation(v32);
        }
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v37 = *(DNDMutableSenderConfiguration **)(*((void *)&v53 + 1) + 8 * k);
          *(_DWORD *)buf = 138543619;
          id v70 = v6;
          __int16 v71 = 2113;
          v72 = v37;
          _os_log_impl(&dword_19CC2C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Allowed Web app: %{private}@", buf, 0x16u);
        }
      }
      uint64_t v34 = [(NSMutableSet *)v32 countByEnumeratingWithState:&v53 objects:v66 count:16];
    }
    while (v34);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v38 = self->_deniedWebApplicationIdentifiers;
  uint64_t v39 = [(NSMutableSet *)v38 countByEnumeratingWithState:&v49 objects:v65 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v50;
    do
    {
      for (uint64_t m = 0; m != v40; ++m)
      {
        if (*(void *)v50 != v41) {
          objc_enumerationMutation(v38);
        }
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v43 = *(DNDMutableSenderConfiguration **)(*((void *)&v49 + 1) + 8 * m);
          *(_DWORD *)buf = 138543619;
          id v70 = v6;
          __int16 v71 = 2113;
          v72 = v43;
          _os_log_impl(&dword_19CC2C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Denied Web app: %{private}@", buf, 0x16u);
        }
      }
      uint64_t v40 = [(NSMutableSet *)v38 countByEnumeratingWithState:&v49 objects:v65 count:16];
    }
    while (v40);
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    senderConfiguration = self->_senderConfiguration;
    *(_DWORD *)buf = 138543619;
    id v70 = v6;
    __int16 v71 = 2113;
    v72 = senderConfiguration;
    _os_log_impl(&dword_19CC2C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] senderConfiguration: %{private}@", buf, 0x16u);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v70 = v6;
    _os_log_impl(&dword_19CC2C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] End configuration", buf, 0xCu);
  }
}

- (void)diffAgainstObject:(id)a3 usingDiffBuilder:(id)a4 withDescription:(id)a5
{
  id v38 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v8 = NSNumber;
    id v9 = v38;
    uint64_t v10 = objc_msgSend(v8, "numberWithUnsignedInteger:", -[DNDConfiguration suppressionType](self, "suppressionType"));
    long long v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "suppressionType"));
    [v7 diffObject:v10 againstObject:v11 withDescription:@"suppressionType"];

    uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DNDConfiguration suppressionMode](self, "suppressionMode"));
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "suppressionMode"));
    [v7 diffObject:v12 againstObject:v13 withDescription:@"suppressionMode"];

    uint64_t v14 = [(DNDConfiguration *)self allowedApplicationIdentifiers];
    unint64_t v15 = [v9 allowedApplicationIdentifiers];
    [v7 diffObject:v14 againstObject:v15 withDescription:@"allowedApplicationIdentifiers"];

    BOOL v16 = [(DNDConfiguration *)self deniedApplicationIdentifiers];
    unint64_t v17 = [v9 deniedApplicationIdentifiers];
    [v7 diffObject:v16 againstObject:v17 withDescription:@"deniedApplicationIdentifiers"];

    uint64_t v18 = [(DNDConfiguration *)self allowedWebApplicationIdentifiers];
    unint64_t v19 = [v9 allowedWebApplicationIdentifiers];
    [v7 diffObject:v18 againstObject:v19 withDescription:@"allowedWebApplicationIdentifiers"];

    uint64_t v20 = [(DNDConfiguration *)self deniedWebApplicationIdentifiers];
    uint64_t v21 = [v9 deniedWebApplicationIdentifiers];
    [v7 diffObject:v20 againstObject:v21 withDescription:@"deniedWebApplicationIdentifiers"];

    uint64_t v22 = [(DNDConfiguration *)self senderConfiguration];
    id v23 = [v9 senderConfiguration];
    [v7 diffObject:v22 againstObject:v23 withDescription:@"senderConfiguration"];

    uint64_t v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DNDConfiguration minimumBreakthroughUrgency](self, "minimumBreakthroughUrgency"));
    id v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "minimumBreakthroughUrgency"));
    [v7 diffObject:v24 againstObject:v25 withDescription:@"minimumBreakthroughUrgency"];

    uint64_t v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DNDConfiguration hideApplicationBadges](self, "hideApplicationBadges"));
    uint64_t v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "hideApplicationBadges"));
    [v7 diffObject:v26 againstObject:v27 withDescription:@"hideApplicationBadges"];

    uint64_t v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DNDConfiguration allowIntelligentManagement](self, "allowIntelligentManagement"));
    uint64_t v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "allowIntelligentManagement"));
    [v7 diffObject:v28 againstObject:v29 withDescription:@"allowIntelligentManagement]"];

    uint64_t v30 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DNDConfiguration applicationConfigurationType](self, "applicationConfigurationType"));
    v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "applicationConfigurationType"));
    [v7 diffObject:v30 againstObject:v31 withDescription:@"applicationConfigurationType"];

    uint64_t v32 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DNDConfiguration senderConfigurationType](self, "senderConfigurationType"));
    uint64_t v33 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "senderConfigurationType"));
    [v7 diffObject:v32 againstObject:v33 withDescription:@"senderConfigurationType"];

    uint64_t v34 = objc_msgSend(NSNumber, "numberWithInteger:", -[DNDConfiguration compatibilityVersion](self, "compatibilityVersion"));
    uint64_t v35 = NSNumber;
    uint64_t v36 = [v9 compatibilityVersion];

    uint64_t v37 = [v35 numberWithInteger:v36];
    [v7 diffObject:v34 againstObject:v37 withDescription:@"compatibilityVersion"];
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return [(DNDConfiguration *)[DNDMutableConfiguration alloc] _initWithSuppressionType:self->_suppressionType suppressionMode:self->_suppressionMode allowedApplicationIdentifiers:self->_allowedApplicationIdentifiers deniedApplicationIdentifiers:self->_deniedApplicationIdentifiers allowedWebApplicationIdentifiers:self->_allowedWebApplicationIdentifiers deniedWebApplicationIdentifiers:self->_deniedWebApplicationIdentifiers senderConfiguration:self->_senderConfiguration minimumBreakthroughUrgency:self->_minimumBreakthroughUrgency hideApplicationBadges:self->_hideApplicationBadges allowIntelligentManagement:self->_allowIntelligentManagement compatibilityVersion:[(DNDConfiguration *)self compatibilityVersion] applicationConfigurationType:self->_applicationConfigurationType senderConfigurationType:self->_senderConfigurationType];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDConfiguration)initWithCoder:(id)a3
{
  v33[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v28 = [v3 decodeIntegerForKey:@"suppressionType"];
  uint64_t v27 = [v3 decodeIntegerForKey:@"suppressionMode"];
  unint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  v33[0] = objc_opt_class();
  v33[1] = objc_opt_class();
  v33[2] = objc_opt_class();
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];
  id v6 = [v4 setWithArray:v5];
  uint64_t v26 = [v3 decodeObjectOfClasses:v6 forKey:@"allowedApplicationIdentifiers"];

  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  unint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  id v9 = [v7 setWithArray:v8];
  uint64_t v10 = [v3 decodeObjectOfClasses:v9 forKey:@"deniedApplicationIdentifiers"];

  long long v11 = (void *)MEMORY[0x1E4F1CAD0];
  v31[0] = objc_opt_class();
  v31[1] = objc_opt_class();
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  uint64_t v13 = [v11 setWithArray:v12];
  uint64_t v14 = [v3 decodeObjectOfClasses:v13 forKey:@"allowedWebApplicationIdentifiers"];

  unint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
  v30[0] = objc_opt_class();
  v30[1] = objc_opt_class();
  BOOL v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  unint64_t v17 = [v15 setWithArray:v16];
  uint64_t v18 = [v3 decodeObjectOfClasses:v17 forKey:@"deniedWebApplicationIdentifiers"];

  unint64_t v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"senderConfiguration"];
  uint64_t v20 = [v3 decodeIntegerForKey:@"minimumBreakthroughUrgency"];
  if ([v3 containsValueForKey:@"hideApplicationBadges"]) {
    uint64_t v21 = [v3 decodeIntegerForKey:@"hideApplicationBadges"];
  }
  else {
    uint64_t v21 = 0;
  }
  if ([v3 containsValueForKey:@"allowIntelligentManagement"]) {
    uint64_t v22 = [v3 decodeIntegerForKey:@"allowIntelligentManagement"];
  }
  else {
    uint64_t v22 = 0;
  }
  if ([v3 containsValueForKey:@"compatibility"]) {
    uint64_t v23 = [v3 decodeIntegerForKey:@"compatibility"];
  }
  else {
    uint64_t v23 = 2;
  }
  uint64_t v24 = -[DNDConfiguration _initWithSuppressionType:suppressionMode:allowedApplicationIdentifiers:deniedApplicationIdentifiers:allowedWebApplicationIdentifiers:deniedWebApplicationIdentifiers:senderConfiguration:minimumBreakthroughUrgency:hideApplicationBadges:allowIntelligentManagement:compatibilityVersion:applicationConfigurationType:senderConfigurationType:](self, "_initWithSuppressionType:suppressionMode:allowedApplicationIdentifiers:deniedApplicationIdentifiers:allowedWebApplicationIdentifiers:deniedWebApplicationIdentifiers:senderConfiguration:minimumBreakthroughUrgency:hideApplicationBadges:allowIntelligentManagement:compatibilityVersion:applicationConfigurationType:senderConfigurationType:", v28, v27, v26, v10, v14, v18, v19, v20, v21, v22, v23, [v3 decodeIntegerForKey:@"applicationConfigurationType"], objc_msgSend(v3, "decodeIntegerForKey:", @"senderConfigurationType"));

  return v24;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t suppressionType = self->_suppressionType;
  id v5 = a3;
  [v5 encodeInteger:suppressionType forKey:@"suppressionType"];
  [v5 encodeInteger:self->_suppressionMode forKey:@"suppressionMode"];
  [v5 encodeObject:self->_allowedApplicationIdentifiers forKey:@"allowedApplicationIdentifiers"];
  [v5 encodeObject:self->_deniedApplicationIdentifiers forKey:@"deniedApplicationIdentifiers"];
  [v5 encodeObject:self->_allowedWebApplicationIdentifiers forKey:@"allowedWebApplicationIdentifiers"];
  [v5 encodeObject:self->_deniedWebApplicationIdentifiers forKey:@"deniedWebApplicationIdentifiers"];
  [v5 encodeObject:self->_senderConfiguration forKey:@"senderConfiguration"];
  [v5 encodeInteger:self->_minimumBreakthroughUrgency forKey:@"minimumBreakthroughUrgency"];
  [v5 encodeInteger:self->_hideApplicationBadges forKey:@"hideApplicationBadges"];
  [v5 encodeInteger:self->_allowIntelligentManagement forKey:@"allowIntelligentManagement"];
  objc_msgSend(v5, "encodeInteger:forKey:", -[DNDConfiguration compatibilityVersion](self, "compatibilityVersion"), @"compatibility");
  [v5 encodeInteger:self->_applicationConfigurationType forKey:@"applicationConfigurationType"];
  [v5 encodeInteger:self->_senderConfigurationType forKey:@"senderConfigurationType"];
}

- (NSSet)applicationsWithExceptions
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v16 = (id)objc_opt_new();
  unint64_t v3 = [(DNDConfiguration *)self applicationConfigurationType];
  if (v3 == 1)
  {
    uint64_t v14 = [(NSMutableSet *)self->_deniedApplicationIdentifiers allObjects];
    [v16 addObjectsFromArray:v14];
  }
  else if (!v3)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    unint64_t v4 = self->_allowedApplicationIdentifiers;
    uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v10 = [(NSMutableDictionary *)self->_allowedApplicationIdentifiers objectForKey:v9];
          long long v11 = [v10 allowedThreads];
          if ([v11 count])
          {
          }
          else
          {
            uint64_t v12 = [v10 deniedThreads];
            uint64_t v13 = [v12 count];

            if (!v13) {
              [v16 addObject:v9];
            }
          }
        }
        uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v6);
    }
  }
  return (NSSet *)v16;
}

- (unint64_t)exceptionForApplication:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[DNDApplicationIdentifier alloc] initWithBundleID:v4];

  unint64_t v6 = [(DNDConfiguration *)self _exceptionForApplicationIdentifier:v5 thread:0];
  return v6;
}

- (unint64_t)exceptionForApplication:(id)a3 thread:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [[DNDApplicationIdentifier alloc] initWithBundleID:v7];

  unint64_t v9 = [(DNDConfiguration *)self _exceptionForApplicationIdentifier:v8 thread:v6];
  return v9;
}

- (unint64_t)exceptionForApplicationIdentifier:(id)a3
{
  return [(DNDConfiguration *)self _exceptionForApplicationIdentifier:a3 thread:0];
}

- (unint64_t)_exceptionForApplicationIdentifier:(id)a3 thread:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __62__DNDConfiguration__exceptionForApplicationIdentifier_thread___block_invoke;
  uint64_t v22 = &unk_1E5911230;
  uint64_t v23 = self;
  id v8 = v7;
  id v24 = v8;
  unint64_t v9 = (uint64_t (**)(void, void, void))MEMORY[0x19F3A0540](&v19);
  if (((uint64_t (**)(void, id, id))v9)[2](v9, v6, v8) == 2)
  {
    if (objc_msgSend(v6, "platform", v19, v20, v21, v22, v23) == 1)
    {
      uint64_t v10 = [DNDApplicationIdentifier alloc];
      long long v11 = [v6 bundleID];
      uint64_t v12 = v10;
      uint64_t v13 = v11;
      uint64_t v14 = 3;
LABEL_6:
      uint64_t v16 = [(DNDApplicationIdentifier *)v12 initWithBundleID:v13 platform:v14];

      id v6 = (id)v16;
      goto LABEL_7;
    }
    if ([v6 platform] == 3)
    {
      unint64_t v15 = [DNDApplicationIdentifier alloc];
      long long v11 = [v6 bundleID];
      uint64_t v12 = v15;
      uint64_t v13 = v11;
      uint64_t v14 = 1;
      goto LABEL_6;
    }
  }
LABEL_7:
  unint64_t v17 = ((uint64_t (**)(void, id, id))v9)[2](v9, v6, v8);

  return v17;
}

uint64_t __62__DNDConfiguration__exceptionForApplicationIdentifier_thread___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:v5];
  id v8 = v7;
  if (!*(void *)(a1 + 40))
  {
    if (v7)
    {
      unint64_t v15 = [v7 allowedThreads];
      if (![v15 count])
      {
        unint64_t v17 = [v8 deniedThreads];
        BOOL v18 = [v17 count] != 0;

        uint64_t v16 = 2 * v18;
LABEL_15:
        if ([*(id *)(*(void *)(a1 + 32) + 32) containsObject:v5]) {
          uint64_t v14 = 1;
        }
        else {
          uint64_t v14 = v16;
        }
        goto LABEL_18;
      }
    }
    uint64_t v16 = 2;
    goto LABEL_15;
  }
  if (v7)
  {
    unint64_t v9 = [v7 allowedThreads];
    int v10 = [v9 containsObject:v6];

    if (v10) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = 2;
    }
    uint64_t v12 = [v8 deniedThreads];
    int v13 = [v12 containsObject:v6];

    if (v13) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = v11;
    }
  }
  else
  {
    uint64_t v14 = 2;
  }
LABEL_18:

  return v14;
}

- (NSDictionary)threadsWithExceptions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = self->_allowedApplicationIdentifiers;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        int v10 = -[NSMutableDictionary objectForKey:](self->_allowedApplicationIdentifiers, "objectForKey:", v9, (void)v15);
        unint64_t v11 = [(DNDConfiguration *)self threadConfigurationType];
        if (v11 == 1)
        {
          uint64_t v12 = [v10 deniedThreads];
        }
        else
        {
          if (v11) {
            goto LABEL_11;
          }
          uint64_t v12 = [v10 allowedThreads];
        }
        int v13 = (void *)v12;
        [v3 setObject:v12 forKey:v9];

LABEL_11:
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return (NSDictionary *)v3;
}

- (NSSet)webApplicationsWithExceptions
{
  unint64_t v3 = objc_opt_new();
  unint64_t v4 = [(DNDConfiguration *)self applicationConfigurationType];
  if (v4)
  {
    if (v4 != 1) {
      goto LABEL_6;
    }
    uint64_t v5 = 48;
  }
  else
  {
    uint64_t v5 = 40;
  }
  uint64_t v6 = [*(id *)((char *)&self->super.isa + v5) allObjects];
  [v3 addObjectsFromArray:v6];

LABEL_6:
  return (NSSet *)v3;
}

- (unint64_t)exceptionForWebApplicationIdentifier:(id)a3
{
  allowedWebApplicationIdentifiers = self->_allowedWebApplicationIdentifiers;
  id v5 = a3;
  if ([(NSMutableSet *)allowedWebApplicationIdentifiers containsObject:v5]) {
    unint64_t v6 = 0;
  }
  else {
    unint64_t v6 = 2;
  }
  int v7 = [(NSMutableSet *)self->_deniedWebApplicationIdentifiers containsObject:v5];

  if (v7) {
    return 1;
  }
  else {
    return v6;
  }
}

- (NSSet)contactsWithExceptions
{
  unint64_t v3 = objc_opt_new();
  unint64_t v4 = [(DNDConfiguration *)self senderConfigurationType];
  if (v4 == 1)
  {
    id v5 = [(DNDSenderConfiguration *)self->_senderConfiguration deniedContacts];
  }
  else
  {
    if (v4) {
      goto LABEL_6;
    }
    id v5 = [(DNDSenderConfiguration *)self->_senderConfiguration allowedContacts];
  }
  unint64_t v6 = v5;
  int v7 = [v5 allObjects];
  [v3 addObjectsFromArray:v7];

LABEL_6:
  return (NSSet *)v3;
}

- (unint64_t)exceptionForContactHandle:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 2;
  id v5 = [(DNDSenderConfiguration *)self->_senderConfiguration allowedContacts];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __46__DNDConfiguration_exceptionForContactHandle___block_invoke;
  v14[3] = &unk_1E5911258;
  id v6 = v4;
  id v15 = v6;
  long long v16 = &v17;
  [v5 enumerateObjectsUsingBlock:v14];

  int v7 = [(DNDSenderConfiguration *)self->_senderConfiguration deniedContacts];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __46__DNDConfiguration_exceptionForContactHandle___block_invoke_2;
  v11[3] = &unk_1E5911258;
  id v8 = v6;
  id v12 = v8;
  int v13 = &v17;
  [v7 enumerateObjectsUsingBlock:v11];

  unint64_t v9 = v18[3];
  _Block_object_dispose(&v17, 8);

  return v9;
}

uint64_t __46__DNDConfiguration_exceptionForContactHandle___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 matchesContactHandle:*(void *)(a1 + 32)];
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

uint64_t __46__DNDConfiguration_exceptionForContactHandle___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 matchesContactHandle:*(void *)(a1 + 32)];
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (DNDBypassSettings)phoneCallBypassSettings
{
  return [(DNDSenderConfiguration *)self->_senderConfiguration phoneCallBypassSettings];
}

- (BOOL)isSupportedConfiguration
{
  uint64_t v2 = [(DNDConfiguration *)self compatibilityVersion];
  if (v2 < 21)
  {
    BOOL v5 = __OFSUB__(2, v2);
    BOOL v3 = v2 == 2;
    BOOL v4 = 2 - v2 < 0;
  }
  else
  {
    BOOL v5 = 0;
    BOOL v3 = 0;
    BOOL v4 = 0;
  }
  return (v4 ^ v5 | v3) != 0;
}

- (int64_t)compatibilityVersion
{
  int64_t result = self->_compatibilityVersion;
  if (result <= 20)
  {
    BOOL v4 = [(DNDConfiguration *)self allowedWebApplicationIdentifiers];
    if ([v4 count])
    {

      return 11;
    }
    BOOL v5 = [(DNDConfiguration *)self deniedWebApplicationIdentifiers];
    uint64_t v6 = [v5 count];

    if (v6) {
      return 11;
    }
    if ([(DNDConfiguration *)self applicationConfigurationType]
      || [(DNDConfiguration *)self senderConfigurationType]
      || [(DNDConfiguration *)self threadConfigurationType])
    {
      return 10;
    }
    else if ([(DNDConfiguration *)self allowIntelligentManagement] == 2)
    {
      return 20;
    }
    else
    {
      return 3;
    }
  }
  return result;
}

- (int64_t)rawCompatibilityVersion
{
  return self->_compatibilityVersion;
}

- (unint64_t)type
{
  return self->_applicationConfigurationType;
}

- (unint64_t)suppressionType
{
  return self->_suppressionType;
}

- (unint64_t)suppressionMode
{
  return self->_suppressionMode;
}

- (NSDictionary)allowedApplicationIdentifiers
{
  return &self->_allowedApplicationIdentifiers->super;
}

- (NSSet)deniedApplicationIdentifiers
{
  return &self->_deniedApplicationIdentifiers->super;
}

- (NSSet)allowedWebApplicationIdentifiers
{
  return &self->_allowedWebApplicationIdentifiers->super;
}

- (void)setAllowedWebApplicationIdentifiers:(id)a3
{
}

- (NSSet)deniedWebApplicationIdentifiers
{
  return &self->_deniedWebApplicationIdentifiers->super;
}

- (void)setDeniedWebApplicationIdentifiers:(id)a3
{
}

- (DNDSenderConfiguration)senderConfiguration
{
  return &self->_senderConfiguration->super;
}

- (unint64_t)minimumBreakthroughUrgency
{
  return self->_minimumBreakthroughUrgency;
}

- (unint64_t)hideApplicationBadges
{
  return self->_hideApplicationBadges;
}

- (unint64_t)allowIntelligentManagement
{
  return self->_allowIntelligentManagement;
}

- (unint64_t)applicationConfigurationType
{
  return self->_applicationConfigurationType;
}

- (unint64_t)senderConfigurationType
{
  return self->_senderConfigurationType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderConfiguration, 0);
  objc_storeStrong((id *)&self->_deniedWebApplicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_allowedWebApplicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_deniedApplicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_allowedApplicationIdentifiers, 0);
}

@end