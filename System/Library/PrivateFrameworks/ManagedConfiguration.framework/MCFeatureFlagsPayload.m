@interface MCFeatureFlagsPayload
+ (BOOL)isConfigurationValid:(id)a3 error:(id *)a4;
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (BOOL)isAllowedToWriteFeatureFlags;
- (MCFeatureFlagsPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSDictionary)featureFlagsConfiguration;
- (id)invalidConfigurationErrorWithUnderlyingError:(id)a3;
- (id)payloadDescriptionKeyValueSections;
- (id)stubDictionary;
- (id)title;
- (id)verboseDescription;
- (unint64_t)disclosureCount;
- (unint64_t)featureFlagCount;
- (unint64_t)subscriptionCount;
@end

@implementation MCFeatureFlagsPayload

+ (id)typeStrings
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.system.featureflags";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"FEATURE_FLAGS_DESCRIPTION_SINGULAR_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"FEATURE_FLAGS_DESCRIPTION_PLURAL_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (BOOL)isConfigurationValid:(id)a3 error:(id *)a4
{
  return MEMORY[0x1F4119168](a3, a4);
}

- (BOOL)isAllowedToWriteFeatureFlags
{
  char v8 = 0;
  uint64_t v3 = [(MCPayload *)self profile];
  uint64_t v4 = [v3 signatureVersion];

  uint64_t v5 = [(MCPayload *)self profile];
  uint64_t v6 = [v5 signerCertificates];
  +[MCProfile evaluateTrustOfCertificateChain:v6 signatureVersion:v4 outIsAllowedToWriteDefaults:&v8];

  LOBYTE(v5) = v8;
  return (char)v5;
}

- (id)invalidConfigurationErrorWithUnderlyingError:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F28C58];
  id v5 = a3;
  uint64_t v6 = [(MCPayload *)self identifier];
  v14 = MCErrorArray(@"ERROR_FEATURE_FLAGS_INVALID_CONFIGURATION_P_ID", v7, v8, v9, v10, v11, v12, v13, v6);
  v15 = [v4 MCErrorWithDomain:@"MCFeatureFlagsErrorDomain" code:58001 descriptionArray:v14 underlyingError:v5 errorType:@"MCFatalError"];

  return v15;
}

- (MCFeatureFlagsPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v177 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v158.receiver = self;
  v158.super_class = (Class)MCFeatureFlagsPayload;
  uint64_t v10 = [(MCPayload *)&v158 initWithDictionary:v8 profile:v9 outError:a5];
  if (!v10) {
    goto LABEL_73;
  }
  v113 = a5;
  uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
  id v157 = 0;
  uint64_t v12 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"Features" isRequired:0 outError:&v157];
  id v13 = v157;
  if (v13)
  {
    id v14 = v13;

    goto LABEL_64;
  }
  v112 = v11;
  v15 = [MEMORY[0x1E4F1CA48] array];
  long long v153 = 0u;
  long long v154 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  id v16 = v12;
  id obj = v16;
  uint64_t v117 = [v16 countByEnumeratingWithState:&v153 objects:v176 count:16];
  if (!v117)
  {

    goto LABEL_32;
  }
  id v110 = v9;
  id v14 = 0;
  uint64_t v119 = *(void *)v154;
  v114 = v15;
LABEL_6:
  uint64_t v17 = 0;
LABEL_7:
  if (*(void *)v154 != v119) {
    objc_enumerationMutation(obj);
  }
  v18 = *(void **)(*((void *)&v153 + 1) + 8 * v17);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v124 = v17;
    uint64_t v19 = objc_opt_class();
    id v152 = v14;
    v20 = [v18 MCValidateAndRemoveObjectOfClass:v19 withKey:@"Domain" isRequired:1 outError:&v152];
    id v21 = v152;

    if (v21)
    {
      v122 = v20;
      v39 = obj;
      id v14 = v21;
      id v9 = v110;

      goto LABEL_62;
    }
    uint64_t v22 = objc_opt_class();
    id v151 = 0;
    id v23 = [v18 MCValidateAndRemoveObjectOfClass:v22 withKey:@"Features" isRequired:1 outError:&v151];
    id v24 = v151;
    if (v24)
    {
      id v14 = v24;
      v123 = v20;
      v39 = obj;
      id v9 = v110;
      goto LABEL_61;
    }
    v25 = [MEMORY[0x1E4F1CA48] array];
    long long v147 = 0u;
    long long v148 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    id v126 = v23;
    uint64_t v26 = [v126 countByEnumeratingWithState:&v147 objects:v175 count:16];
    if (!v26)
    {
      id v14 = 0;
      goto LABEL_28;
    }
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v148;
    v121 = v20;
LABEL_14:
    uint64_t v29 = 0;
    while (1)
    {
      if (*(void *)v148 != v28) {
        objc_enumerationMutation(v126);
      }
      v30 = *(void **)(*((void *)&v147 + 1) + 8 * v29);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      uint64_t v31 = objc_opt_class();
      id v146 = 0;
      v32 = [v30 MCValidateAndRemoveObjectOfClass:v31 withKey:@"FeatureName" isRequired:1 outError:&v146];
      id v33 = v146;
      if (v33)
      {
        id v14 = v33;

        goto LABEL_26;
      }
      uint64_t v34 = objc_opt_class();
      id v145 = 0;
      v35 = [v30 MCValidateAndRemoveObjectOfClass:v34 withKey:@"Enabled" isRequired:1 outError:&v145];
      id v36 = v145;
      if (v36)
      {
        id v14 = v36;

        v15 = v114;
        v20 = v121;
        goto LABEL_28;
      }
      v173[0] = @"FeatureName";
      v173[1] = @"Enabled";
      v174[0] = v32;
      v174[1] = v35;
      v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v174 forKeys:v173 count:2];
      [v25 addObject:v37];

      ++v10->_featureFlagCount;
      if (v27 == ++v29)
      {
        uint64_t v27 = [v126 countByEnumeratingWithState:&v147 objects:v175 count:16];
        id v14 = 0;
        v15 = v114;
        v20 = v121;
        if (v27) {
          goto LABEL_14;
        }
LABEL_28:

        v171[0] = @"Domain";
        v171[1] = @"Features";
        v172[0] = v20;
        v172[1] = v25;
        v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v172 forKeys:v171 count:2];
        [v15 addObject:v38];

        uint64_t v17 = v124 + 1;
        if (v124 + 1 == v117)
        {
          uint64_t v117 = [obj countByEnumeratingWithState:&v153 objects:v176 count:16];
          if (!v117) {
            goto LABEL_37;
          }
          goto LABEL_6;
        }
        goto LABEL_7;
      }
    }
    id v14 = [(MCFeatureFlagsPayload *)v10 invalidConfigurationErrorWithUnderlyingError:0];
LABEL_26:
    v15 = v114;
    v20 = v121;
    goto LABEL_28;
  }
  uint64_t v41 = [(MCFeatureFlagsPayload *)v10 invalidConfigurationErrorWithUnderlyingError:0];

  id v14 = (id)v41;
LABEL_37:

  id v9 = v110;
  if (v14) {
    goto LABEL_63;
  }
LABEL_32:
  if ([v15 count]) {
    [v112 setObject:v15 forKey:@"Features"];
  }
  id v144 = 0;
  v39 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"Disclosures" isRequired:0 outError:&v144];
  id v40 = v144;
  if (v40)
  {
    id v14 = v40;
    goto LABEL_62;
  }
  v115 = v15;
  v109 = v8;
  v111 = v9;
  v42 = [MEMORY[0x1E4F1CA48] array];
  long long v140 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  id v127 = v39;
  uint64_t v43 = [v127 countByEnumeratingWithState:&v140 objects:v170 count:16];
  v123 = v42;
  if (!v43)
  {
    v55 = 0;
    goto LABEL_58;
  }
  uint64_t v44 = v43;
  uint64_t v45 = *(void *)v141;
  while (2)
  {
    for (uint64_t i = 0; i != v44; ++i)
    {
      if (*(void *)v141 != v45) {
        objc_enumerationMutation(v127);
      }
      v47 = *(void **)(*((void *)&v140 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v55 = [(MCFeatureFlagsPayload *)v10 invalidConfigurationErrorWithUnderlyingError:0];
LABEL_57:
        v42 = v123;
        goto LABEL_58;
      }
      uint64_t v48 = objc_opt_class();
      id v139 = 0;
      v49 = [v47 MCValidateAndRemoveObjectOfClass:v48 withKey:@"DisclosureName" isRequired:1 outError:&v139];
      id v50 = v139;
      if (v50)
      {
        v55 = v50;
LABEL_56:

        goto LABEL_57;
      }
      uint64_t v51 = objc_opt_class();
      id v138 = 0;
      v52 = [v47 MCValidateAndRemoveObjectOfClass:v51 withKey:@"Disclosed" isRequired:1 outError:&v138];
      id v53 = v138;
      if (v53)
      {
        v55 = v53;

        goto LABEL_56;
      }
      v168[0] = @"DisclosureName";
      v168[1] = @"Disclosed";
      v169[0] = v49;
      v169[1] = v52;
      v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v169 forKeys:v168 count:2];
      [v123 addObject:v54];

      ++v10->_disclosureCount;
    }
    uint64_t v44 = [v127 countByEnumeratingWithState:&v140 objects:v170 count:16];
    v55 = 0;
    v42 = v123;
    if (v44) {
      continue;
    }
    break;
  }
LABEL_58:
  v39 = v127;

  if ([v42 count]) {
    [v112 setObject:v42 forKey:@"Disclosures"];
  }
  id v137 = v55;
  id v8 = v109;
  id v23 = [v109 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"Subscriptions" isRequired:0 outError:&v137];
  id v14 = v137;

  id v9 = v111;
  v15 = v115;
  if (v14) {
    goto LABEL_61;
  }
  v118 = [MEMORY[0x1E4F1CA48] array];
  long long v133 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  id v23 = v23;
  uint64_t v120 = [v23 countByEnumeratingWithState:&v133 objects:v167 count:16];
  id v14 = 0;
  if (!v120) {
    goto LABEL_97;
  }
  unint64_t v67 = 0x1E4F1C000uLL;
  uint64_t v125 = *(void *)v134;
  while (2)
  {
    uint64_t v68 = 0;
    while (2)
    {
      if (*(void *)v134 != v125) {
        objc_enumerationMutation(v23);
      }
      v69 = *(void **)(*((void *)&v133 + 1) + 8 * v68);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v72 = [(MCFeatureFlagsPayload *)v10 invalidConfigurationErrorWithUnderlyingError:0];
LABEL_95:

        id v14 = v72;
LABEL_96:
        id v8 = v109;
        goto LABEL_97;
      }
      uint64_t v70 = objc_opt_class();
      id v132 = v14;
      v71 = [v69 MCValidateAndRemoveObjectOfClass:v70 withKey:@"SubscriptionClass" isRequired:1 outError:&v132];
      id v72 = v132;

      if (v72) {
        goto LABEL_94;
      }
      uint64_t v73 = objc_opt_class();
      id v131 = 0;
      v74 = [v69 MCValidateAndRemoveObjectOfClass:v73 withKey:@"SubscriptionContents" isRequired:1 outError:&v131];
      id v75 = v131;
      if (v75)
      {
        id v72 = v75;

LABEL_94:
        id v14 = v71;
        goto LABEL_95;
      }
      uint64_t v76 = objc_opt_class();
      id v130 = 0;
      v77 = [v74 MCValidateAndRemoveObjectOfClass:v76 withKey:@"TargetRelease" isRequired:1 outError:&v130];
      id v78 = v130;
      if (v78)
      {
        id v14 = v78;
        int v79 = 10;
      }
      else
      {
        uint64_t v80 = objc_opt_class();
        id v129 = 0;
        v81 = [v74 MCValidateAndRemoveObjectOfClass:v80 withKey:@"MinimumPhase" isRequired:1 outError:&v129];
        id v14 = v129;
        if (v14)
        {
          int v79 = 10;
        }
        else
        {
          v166[0] = v71;
          v165[0] = @"SubscriptionClass";
          v165[1] = @"SubscriptionContents";
          v163[0] = @"TargetRelease";
          v163[1] = @"MinimumPhase";
          v164[0] = v77;
          v164[1] = v81;
          v82 = [*(id *)(v67 + 2536) dictionaryWithObjects:v164 forKeys:v163 count:2];
          v166[1] = v82;
          v83 = [*(id *)(v67 + 2536) dictionaryWithObjects:v166 forKeys:v165 count:2];
          [v118 addObject:v83];

          v39 = v127;
          int v79 = 0;
          ++v10->_subscriptionCount;
        }
      }
      if (v79) {
        goto LABEL_96;
      }
      ++v68;
      unint64_t v67 = 0x1E4F1C000;
      if (v120 != v68) {
        continue;
      }
      break;
    }
    id v8 = v109;
    uint64_t v120 = [v23 countByEnumeratingWithState:&v133 objects:v167 count:16];
    if (v120) {
      continue;
    }
    break;
  }
LABEL_97:

  if ([v118 count]) {
    [v112 setObject:v118 forKey:@"Subscriptions"];
  }
  v84 = [(MCPayload *)v10 profile];
  char v85 = [v84 isStub];

  id v9 = v111;
  if (v85)
  {
LABEL_100:
    v15 = v115;
    if (!v14)
    {
      uint64_t v86 = [v112 copy];
      uint64_t v87 = 0;
      featureFlagsConfiguration = v10->_featureFlagsConfiguration;
      v10->_featureFlagsConfiguration = (NSDictionary *)v86;
      goto LABEL_108;
    }
  }
  else
  {
    id v128 = 0;
    char v89 = [(id)objc_opt_class() isConfigurationValid:v112 error:&v128];
    featureFlagsConfiguration = (NSDictionary *)v128;
    if (v89)
    {
      if ([(MCFeatureFlagsPayload *)v10 isAllowedToWriteFeatureFlags])
      {

        goto LABEL_100;
      }
      v100 = (void *)MEMORY[0x1E4F28C58];
      v91 = [v111 friendlyName];
      v99 = MCErrorArray(@"ERROR_PROFILE_DEFAULTS_BAD_SIGNATURE_P_ID", v101, v102, v103, v104, v105, v106, v107, v91);
      v108 = [v100 MCErrorWithDomain:@"MCFeatureFlagsErrorDomain" code:58000 descriptionArray:v99 errorType:@"MCFatalError"];
      uint64_t v87 = [v108 MCCopyAsPrimaryError];

      id v14 = v108;
    }
    else
    {
      v90 = (void *)MEMORY[0x1E4F28C58];
      v91 = [(MCPayload *)v10 identifier];
      v99 = MCErrorArray(@"ERROR_FEATURE_FLAGS_INVALID_CONFIGURATION_P_ID", v92, v93, v94, v95, v96, v97, v98, v91);
      uint64_t v87 = [v90 MCErrorWithDomain:@"MCFeatureFlagsErrorDomain" code:58001 descriptionArray:v99 underlyingError:featureFlagsConfiguration errorType:@"MCFatalError"];
    }

    v15 = v115;
    v39 = v127;
LABEL_108:

    id v14 = (id)v87;
  }

LABEL_61:
LABEL_62:

LABEL_63:
  if (v14)
  {
LABEL_64:
    v56 = [(MCPayload *)v10 malformedPayloadErrorWithError:v14];
    v57 = v56;
    if (v113) {
      id *v113 = v56;
    }
    v58 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v59 = v58;
      v60 = objc_opt_class();
      id v61 = v60;
      v62 = [v57 MCVerboseDescription];
      *(_DWORD *)buf = 138543618;
      v160 = v60;
      __int16 v161 = 2114;
      id v162 = v62;
      _os_log_impl(&dword_1A13F0000, v59, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
    }
    uint64_t v10 = 0;
  }
  if ([v8 count])
  {
    v63 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v64 = v63;
      v65 = [(MCPayload *)v10 friendlyName];
      *(_DWORD *)buf = 138543618;
      v160 = v65;
      __int16 v161 = 2114;
      id v162 = v8;
      _os_log_impl(&dword_1A13F0000, v64, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);
    }
  }

LABEL_73:
  return v10;
}

- (id)stubDictionary
{
  v6.receiver = self;
  v6.super_class = (Class)MCFeatureFlagsPayload;
  uint64_t v3 = [(MCPayload *)&v6 stubDictionary];
  uint64_t v4 = [(MCFeatureFlagsPayload *)self featureFlagsConfiguration];
  [v3 addEntriesFromDictionary:v4];

  return v3;
}

- (id)verboseDescription
{
  v8.receiver = self;
  v8.super_class = (Class)MCFeatureFlagsPayload;
  uint64_t v3 = [(MCPayload *)&v8 verboseDescription];
  uint64_t v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [(MCFeatureFlagsPayload *)self featureFlagsConfiguration];
  objc_super v6 = (void *)v5;
  if (v5) {
    [v4 appendFormat:@"\nconfiguration: %@", v5];
  }

  return v4;
}

- (id)title
{
  uint64_t v2 = NSString;
  uint64_t v3 = MCLocalizedString(@"FEATURE_FLAGS_DESCRIPTION_PLURAL_FORMAT");
  uint64_t v4 = objc_msgSend(v2, "stringWithFormat:", v3, 0);

  return v4;
}

- (id)payloadDescriptionKeyValueSections
{
  v26[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(MCFeatureFlagsPayload *)self featureFlagsConfiguration];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"Disclosures"];
  uint64_t v4 = [v2 objectForKeyedSubscript:@"Features"];
  uint64_t v5 = [v2 objectForKeyedSubscript:@"Subscriptions"];
  objc_super v6 = objc_opt_new();
  v25 = v3;
  if (v4)
  {
    uint64_t v7 = [MCKeyValue alloc];
    objc_super v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
    id v9 = MCFormattedStringForNumber(v8);
    uint64_t v10 = MCLocalizedString(@"FEATURE_FLAG_DOMAINS");
    uint64_t v11 = [(MCKeyValue *)v7 initWithLocalizedString:v9 localizedKey:v10];

    uint64_t v3 = v25;
    [v6 addObject:v11];
  }
  if (v3)
  {
    uint64_t v12 = [MCKeyValue alloc];
    id v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
    id v14 = MCFormattedStringForNumber(v13);
    v15 = MCLocalizedString(@"FEATURE_FLAG_DISCLOSURES");
    id v16 = [(MCKeyValue *)v12 initWithLocalizedString:v14 localizedKey:v15];

    uint64_t v3 = v25;
    [v6 addObject:v16];
  }
  if (v5)
  {
    uint64_t v17 = [MCKeyValue alloc];
    v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    uint64_t v19 = MCFormattedStringForNumber(v18);
    v20 = MCLocalizedString(@"FEATURE_FLAG_SUBSCRIPTIONS");
    id v21 = [(MCKeyValue *)v17 initWithLocalizedString:v19 localizedKey:v20];

    uint64_t v3 = v25;
    [v6 addObject:v21];
  }
  if ([v6 count])
  {
    uint64_t v22 = +[MCKeyValueSection sectionWithKeyValues:v6];
    v26[0] = v22;
    id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

- (NSDictionary)featureFlagsConfiguration
{
  return self->_featureFlagsConfiguration;
}

- (unint64_t)featureFlagCount
{
  return self->_featureFlagCount;
}

- (unint64_t)disclosureCount
{
  return self->_disclosureCount;
}

- (unint64_t)subscriptionCount
{
  return self->_subscriptionCount;
}

- (void).cxx_destruct
{
}

@end