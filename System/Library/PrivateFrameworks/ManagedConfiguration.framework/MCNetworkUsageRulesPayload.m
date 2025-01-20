@interface MCNetworkUsageRulesPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (MCNetworkUsageRulesPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSArray)SIMRules;
- (NSArray)applicationRules;
- (id)installationWarnings;
- (id)payloadDescriptionKeyValueSections;
- (id)stubDictionary;
- (id)verboseDescription;
- (void)setApplicationRules:(id)a3;
- (void)setSIMRules:(id)a3;
@end

@implementation MCNetworkUsageRulesPayload

+ (id)typeStrings
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.networkusagerules";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"NETWORK_USAGE_SINGULAR", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"NETWORK_USAGE_PLURAL", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCNetworkUsageRulesPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v67.receiver = self;
  v67.super_class = (Class)MCNetworkUsageRulesPayload;
  uint64_t v9 = [(MCPayload *)&v67 initWithDictionary:v8 profile:a4 outError:a5];
  if (!v9) {
    goto LABEL_48;
  }
  id v66 = 0;
  uint64_t v10 = [v8 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"SIMRules" isRequired:0 outError:&v66];
  id v11 = v66;
  SIMRules = v9->_SIMRules;
  v9->_SIMRules = (NSArray *)v10;

  if (v11) {
    goto LABEL_39;
  }
  v13 = v9->_SIMRules;
  if (!v13) {
    goto LABEL_30;
  }
  if ([(NSArray *)v13 count])
  {
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    v21 = v9->_SIMRules;
    uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v62 objects:v73 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v63;
      v56 = v21;
      uint64_t v53 = *(void *)v63;
      while (2)
      {
        uint64_t v24 = 0;
        uint64_t v54 = v22;
        do
        {
          if (*(void *)v63 != v23)
          {
            uint64_t v25 = v24;
            objc_enumerationMutation(v21);
            uint64_t v24 = v25;
          }
          uint64_t v55 = v24;
          v26 = *(void **)(*((void *)&v62 + 1) + 8 * v24);
          id v27 = [v26 objectForKeyedSubscript:@"ICCIDs"];
          if (!v27) {
            goto LABEL_35;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || ![v27 count]) {
            goto LABEL_35;
          }
          v28 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v27, "count"));
          long long v58 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          id v27 = v27;
          uint64_t v29 = [v27 countByEnumeratingWithState:&v58 objects:v72 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            uint64_t v31 = *(void *)v59;
            v52 = v26;
            while (2)
            {
              for (uint64_t i = 0; i != v30; ++i)
              {
                if (*(void *)v59 != v31) {
                  objc_enumerationMutation(v27);
                }
                v33 = *(void **)(*((void *)&v58 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0 || ![v33 length]) {
                  goto LABEL_32;
                }
                v34 = [v33 uppercaseString];
                if ([v28 containsObject:v34])
                {

LABEL_32:
                  v35 = v27;
                  goto LABEL_33;
                }
                [v28 addObject:v34];
              }
              uint64_t v30 = [v27 countByEnumeratingWithState:&v58 objects:v72 count:16];
              v26 = v52;
              if (v30) {
                continue;
              }
              break;
            }
          }

          v35 = [v26 objectForKeyedSubscript:@"WiFiAssistPolicy"];
          if (!v35)
          {
LABEL_33:
            v21 = v56;
LABEL_34:

LABEL_35:
LABEL_36:

            goto LABEL_37;
          }
          objc_opt_class();
          v21 = v56;
          if ((objc_opt_isKindOfClass() & 1) == 0 || (int)[v35 intValue] < 2) {
            goto LABEL_34;
          }
          int v36 = [v35 intValue];

          if (v36 > 3) {
            goto LABEL_36;
          }
          uint64_t v24 = v55 + 1;
          uint64_t v23 = v53;
        }
        while (v55 + 1 != v54);
        uint64_t v22 = [(NSArray *)v56 countByEnumeratingWithState:&v62 objects:v73 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }

LABEL_30:
    BOOL v37 = v9->_SIMRules == 0;
    id v57 = 0;
    uint64_t v38 = [v8 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"ApplicationRules" isRequired:v37 outError:&v57];
    id v11 = v57;
    applicationRules = v9->_applicationRules;
    v9->_applicationRules = (NSArray *)v38;
    goto LABEL_38;
  }
LABEL_37:
  v40 = (void *)MEMORY[0x1E4F28C58];
  applicationRules = MCErrorArray(@"ERROR_PAYLOAD_FIELD_BAD_VALUE_P_FIELD", v14, v15, v16, v17, v18, v19, v20, @"SIMRules");
  id v11 = [v40 MCErrorWithDomain:@"MCPayloadErrorDomain" code:2004 descriptionArray:applicationRules underlyingError:0 errorType:@"MCFatalError"];
LABEL_38:

  if (v11)
  {
LABEL_39:
    v41 = [(MCPayload *)v9 malformedPayloadErrorWithError:v11];
    v42 = v41;
    if (a5) {
      *a5 = v41;
    }
    v43 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v44 = v43;
      v45 = objc_opt_class();
      id v46 = v45;
      v47 = [v42 MCVerboseDescription];
      *(_DWORD *)buf = 138543618;
      v69 = v45;
      __int16 v70 = 2114;
      id v71 = v47;
      _os_log_impl(&dword_1A13F0000, v44, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
    }
    uint64_t v9 = 0;
  }
  if ([v8 count])
  {
    v48 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v49 = v48;
      v50 = [(MCPayload *)v9 friendlyName];
      *(_DWORD *)buf = 138543618;
      v69 = v50;
      __int16 v70 = 2114;
      id v71 = v8;
      _os_log_impl(&dword_1A13F0000, v49, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);
    }
  }

LABEL_48:
  return v9;
}

- (id)stubDictionary
{
  v9.receiver = self;
  v9.super_class = (Class)MCNetworkUsageRulesPayload;
  uint64_t v3 = [(MCPayload *)&v9 stubDictionary];
  uint64_t v4 = [(MCNetworkUsageRulesPayload *)self applicationRules];

  if (v4)
  {
    uint64_t v5 = [(MCNetworkUsageRulesPayload *)self applicationRules];
    [v3 setObject:v5 forKeyedSubscript:@"ApplicationRules"];
  }
  uint64_t v6 = [(MCNetworkUsageRulesPayload *)self SIMRules];

  if (v6)
  {
    uint64_t v7 = [(MCNetworkUsageRulesPayload *)self SIMRules];
    [v3 setObject:v7 forKeyedSubscript:@"SIMRules"];
  }
  return v3;
}

- (id)verboseDescription
{
  v10.receiver = self;
  v10.super_class = (Class)MCNetworkUsageRulesPayload;
  uint64_t v3 = [(MCPayload *)&v10 verboseDescription];
  uint64_t v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [(MCNetworkUsageRulesPayload *)self applicationRules];

  if (v5)
  {
    uint64_t v6 = [(MCNetworkUsageRulesPayload *)self applicationRules];
    [v4 appendFormat:@"Application Rules : %@\n", v6];
  }
  uint64_t v7 = [(MCNetworkUsageRulesPayload *)self SIMRules];

  if (v7)
  {
    id v8 = [(MCNetworkUsageRulesPayload *)self SIMRules];
    [v4 appendFormat:@"SIM Rules         : %@\n", v8];
  }
  return v4;
}

- (id)payloadDescriptionKeyValueSections
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = [(MCNetworkUsageRulesPayload *)self applicationRules];
  uint64_t v6 = [v5 count];

  v69 = v3;
  if (v6)
  {
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v63 = self;
    obuint64_t j = [(MCNetworkUsageRulesPayload *)self applicationRules];
    uint64_t v67 = [obj countByEnumeratingWithState:&v88 objects:v95 count:16];
    if (v67)
    {
      id v65 = *(id *)v89;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(id *)v89 != v65) {
            objc_enumerationMutation(obj);
          }
          uint64_t v70 = v7;
          id v8 = *(void **)(*((void *)&v88 + 1) + 8 * v7);
          v72 = [v8 objectForKeyedSubscript:@"AppIdentifierMatches"];
          uint64_t v74 = v8;
          if ([v72 count])
          {
            long long v86 = 0u;
            long long v87 = 0u;
            long long v84 = 0u;
            long long v85 = 0u;
            id v9 = v72;
            uint64_t v10 = [v9 countByEnumeratingWithState:&v84 objects:v94 count:16];
            if (v10)
            {
              uint64_t v11 = v10;
              uint64_t v12 = *(void *)v85;
              do
              {
                for (uint64_t i = 0; i != v11; ++i)
                {
                  if (*(void *)v85 != v12) {
                    objc_enumerationMutation(v9);
                  }
                  uint64_t v14 = *(void **)(*((void *)&v84 + 1) + 8 * i);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0 && [v14 length])
                  {
                    uint64_t v15 = [MCKeyValue alloc];
                    uint64_t v16 = MCLocalizedString(@"NETWORK_USAGE_APP_RULE");
                    uint64_t v17 = [(MCKeyValue *)v15 initWithLocalizedString:v14 localizedKey:v16];

                    [v4 addObject:v17];
                  }
                }
                uint64_t v11 = [v9 countByEnumeratingWithState:&v84 objects:v94 count:16];
              }
              while (v11);
            }

            uint64_t v3 = v69;
            id v8 = v74;
          }
          uint64_t v18 = [v8 objectForKeyedSubscript:@"AllowCellularData"];
          if (v18)
          {
            uint64_t v19 = (void *)v18;
            uint64_t v20 = [v8 objectForKeyedSubscript:@"AllowCellularData"];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            id v8 = v74;
            if (isKindOfClass)
            {
              uint64_t v22 = [MCKeyValue alloc];
              uint64_t v23 = [v74 objectForKeyedSubscript:@"AllowCellularData"];
              uint64_t v24 = MCLocalizedStringForBool([v23 BOOLValue]);
              uint64_t v25 = MCLocalizedString(@"NETWORK_USAGE_ALLOW_CELLULAR");
              v26 = [(MCKeyValue *)v22 initWithLocalizedString:v24 localizedKey:v25];

              id v8 = v74;
              [v4 addObject:v26];
            }
          }
          uint64_t v27 = [v8 objectForKeyedSubscript:@"AllowRoamingCellularData"];
          if (v27)
          {
            v28 = (void *)v27;
            uint64_t v29 = [v8 objectForKeyedSubscript:@"AllowRoamingCellularData"];
            objc_opt_class();
            char v30 = objc_opt_isKindOfClass();

            if (v30)
            {
              uint64_t v31 = [MCKeyValue alloc];
              v32 = [v74 objectForKeyedSubscript:@"AllowRoamingCellularData"];
              v33 = MCLocalizedStringForBool([v32 BOOLValue]);
              v34 = MCLocalizedString(@"NETWORK_USAGE_ALLOW_ROAMING");
              v35 = [(MCKeyValue *)v31 initWithLocalizedString:v33 localizedKey:v34];

              [v4 addObject:v35];
            }
          }
          if ([v4 count])
          {
            int v36 = +[MCKeyValueSection sectionWithKeyValues:v4];
            [v3 addObject:v36];

            uint64_t v37 = objc_opt_new();
            uint64_t v4 = (void *)v37;
          }

          uint64_t v7 = v70 + 1;
        }
        while (v70 + 1 != v67);
        uint64_t v67 = [obj countByEnumeratingWithState:&v88 objects:v95 count:16];
      }
      while (v67);
    }

    self = v63;
  }
  uint64_t v38 = [(MCNetworkUsageRulesPayload *)self SIMRules];
  uint64_t v39 = [v38 count];

  if (v39)
  {
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id v66 = [(MCNetworkUsageRulesPayload *)self SIMRules];
    uint64_t v71 = [v66 countByEnumeratingWithState:&v80 objects:v93 count:16];
    if (!v71) {
      goto LABEL_55;
    }
    uint64_t v68 = *(void *)v81;
    while (1)
    {
      uint64_t v40 = 0;
      do
      {
        if (*(void *)v81 != v68) {
          objc_enumerationMutation(v66);
        }
        v73 = *(void **)(*((void *)&v80 + 1) + 8 * v40);
        uint64_t v75 = v40;
        v41 = [v73 objectForKeyedSubscript:@"ICCIDs"];
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        uint64_t v42 = [v41 countByEnumeratingWithState:&v76 objects:v92 count:16];
        if (v42)
        {
          uint64_t v43 = v42;
          uint64_t v44 = *(void *)v77;
          do
          {
            for (uint64_t j = 0; j != v43; ++j)
            {
              if (*(void *)v77 != v44) {
                objc_enumerationMutation(v41);
              }
              uint64_t v46 = *(void *)(*((void *)&v76 + 1) + 8 * j);
              v47 = [MCKeyValue alloc];
              v48 = MCLocalizedString(@"NETWORK_USAGE_ICCID");
              v49 = [(MCKeyValue *)v47 initWithLocalizedString:v46 localizedKey:v48];

              [v4 addObject:v49];
            }
            uint64_t v43 = [v41 countByEnumeratingWithState:&v76 objects:v92 count:16];
          }
          while (v43);
        }
        v50 = [v73 objectForKeyedSubscript:@"WiFiAssistPolicy"];
        v51 = v50;
        if (v50)
        {
          int v52 = [v50 intValue];
          if (v52 == 3)
          {
            uint64_t v53 = @"NETWORK_USAGE_UNLIMITED_CELLULAR_DATA";
LABEL_48:
            uint64_t v54 = MCLocalizedString(v53);
          }
          else
          {
            if (v52 == 2)
            {
              uint64_t v53 = @"NETWORK_USAGE_DEFAULT_CELLULAR_DATA";
              goto LABEL_48;
            }
            uint64_t v54 = MCFormattedStringForNumber(v51);
          }
          uint64_t v55 = (void *)v54;
          v56 = [MCKeyValue alloc];
          id v57 = [@"NETWORK_USAGE_WIFI_ASSIST_POLICY" MCAppendGreenteaSuffix];
          long long v58 = MCLocalizedString(v57);
          long long v59 = [(MCKeyValue *)v56 initWithLocalizedString:v55 localizedKey:v58];

          [v4 addObject:v59];
        }
        if ([v4 count])
        {
          long long v60 = +[MCKeyValueSection sectionWithKeyValues:v4];
          [v69 addObject:v60];

          uint64_t v61 = objc_opt_new();
          uint64_t v4 = (void *)v61;
        }

        uint64_t v40 = v75 + 1;
      }
      while (v75 + 1 != v71);
      uint64_t v71 = [v66 countByEnumeratingWithState:&v80 objects:v93 count:16];
      if (!v71)
      {
LABEL_55:

        uint64_t v3 = v69;
        break;
      }
    }
  }
  if (![v3 count])
  {

    uint64_t v3 = 0;
  }

  return v3;
}

- (id)installationWarnings
{
  uint64_t v2 = MCLocalizedString(@"INSTALL_WARNING_NETWORK_USAGE_TITLE");
  uint64_t v3 = MCLocalizedStringByDevice(@"INSTALL_WARNING_NETWORK_USAGE");
  uint64_t v4 = +[MCProfileWarning warningWithLocalizedTitle:v2 localizedBody:v3 isLongForm:1];

  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObject:v4];

  return v5;
}

- (NSArray)applicationRules
{
  return self->_applicationRules;
}

- (void)setApplicationRules:(id)a3
{
}

- (NSArray)SIMRules
{
  return self->_SIMRules;
}

- (void)setSIMRules:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_SIMRules, 0);
  objc_storeStrong((id *)&self->_applicationRules, 0);
}

@end