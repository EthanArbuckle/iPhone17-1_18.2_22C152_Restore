@interface MCExtensibleSingleSignOnPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (BOOL)_validateHost:(id)a3 outError:(id *)a4;
- (MCExtensibleSingleSignOnPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSArray)esso_URLs;
- (NSArray)esso_deniedBundleIdentifiers;
- (NSArray)esso_hosts;
- (NSDictionary)esso_extensionData;
- (NSString)esso_extensionIdentifier;
- (NSString)esso_realm;
- (NSString)esso_screenLockedBehavior;
- (NSString)esso_teamIdentifier;
- (NSString)esso_type;
- (id)_validateURLString:(id)a3 outError:(id *)a4;
- (id)payloadDescriptionKeyValueSections;
- (id)stubDictionary;
- (id)title;
- (id)verboseDescription;
- (void)setEsso_URLs:(id)a3;
- (void)setEsso_deniedBundleIdentifiers:(id)a3;
- (void)setEsso_extensionData:(id)a3;
- (void)setEsso_extensionIdentifier:(id)a3;
- (void)setEsso_hosts:(id)a3;
- (void)setEsso_realm:(id)a3;
- (void)setEsso_screenLockedBehavior:(id)a3;
- (void)setEsso_teamIdentifier:(id)a3;
- (void)setEsso_type:(id)a3;
@end

@implementation MCExtensibleSingleSignOnPayload

+ (id)typeStrings
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.extensiblesso";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"EXTENSIBLE_SSO_SINGULAR", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"EXTENSIBLE_SSO_PLURAL", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCExtensibleSingleSignOnPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  v135[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v127.receiver = self;
  v127.super_class = (Class)MCExtensibleSingleSignOnPayload;
  uint64_t v9 = [(MCPayload *)&v127 initWithDictionary:v8 profile:a4 outError:a5];
  if (!v9) {
    goto LABEL_19;
  }
  id v126 = 0;
  uint64_t v10 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"Type" isRequired:1 outError:&v126];
  id v11 = v126;
  esso_type = v9->_esso_type;
  v9->_esso_type = (NSString *)v10;

  if (v11) {
    goto LABEL_10;
  }
  v135[0] = @"Credential";
  v135[1] = @"Redirect";
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v135 count:2];
  v14 = v9->_esso_type;
  id v125 = 0;
  +[MCProfile checkString:isOneOfStrings:key:errorDomain:errorCode:errorString:outError:](MCProfile, "checkString:isOneOfStrings:key:errorDomain:errorCode:errorString:outError:", v14, v13, @"Type", &v125);
  id v11 = v125;

  if (v11) {
    goto LABEL_10;
  }
  if ([(NSString *)v9->_esso_type isEqualToString:@"Credential"])
  {
    id v124 = 0;
    uint64_t v15 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"Realm" isRequired:0 outError:&v124];
    id v11 = v124;
    esso_realm = v9->_esso_realm;
    v9->_esso_realm = (NSString *)v15;

    if (v11) {
      goto LABEL_10;
    }
  }
  id v123 = 0;
  uint64_t v17 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"ExtensionIdentifier" isRequired:1 outError:&v123];
  id v11 = v123;
  esso_extensionIdentifier = v9->_esso_extensionIdentifier;
  v9->_esso_extensionIdentifier = (NSString *)v17;

  if (v11) {
    goto LABEL_10;
  }
  id v122 = 0;
  uint64_t v19 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"TeamIdentifier" isRequired:0 outError:&v122];
  id v11 = v122;
  esso_teamIdentifier = v9->_esso_teamIdentifier;
  v9->_esso_teamIdentifier = (NSString *)v19;

  if (v11) {
    goto LABEL_10;
  }
  id v121 = 0;
  uint64_t v21 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"ExtensionData" isRequired:0 outError:&v121];
  id v11 = v121;
  esso_extensionData = v9->_esso_extensionData;
  v9->_esso_extensionData = (NSDictionary *)v21;

  if (v11) {
    goto LABEL_10;
  }
  id v120 = 0;
  uint64_t v101 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"ScreenLockedBehavior" isRequired:0 outError:&v120];
  id v11 = v120;
  esso_screenLockedBehavior = v9->_esso_screenLockedBehavior;
  v9->_esso_screenLockedBehavior = (NSString *)v101;

  if (v11) {
    goto LABEL_10;
  }
  if (v9->_esso_screenLockedBehavior)
  {
    v134[0] = @"Cancel";
    v134[1] = @"DoNotHandle";
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v134 count:2];
    v36 = v9->_esso_screenLockedBehavior;
    id v119 = 0;
    +[MCProfile checkString:v36 isOneOfStrings:v35 key:@"ScreenLockedBehavior" errorDomain:@"MCPayloadErrorDomain" errorCode:2004 errorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v119];
    id v11 = v119;

    if (v11) {
      goto LABEL_10;
    }
  }
  id v118 = 0;
  uint64_t v37 = [v8 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"DeniedBundleIdentifiers" isRequired:0 allowZeroLengthString:0 outError:&v118];
  id v11 = v118;
  esso_deniedBundleIdentifiers = v9->_esso_deniedBundleIdentifiers;
  v9->_esso_deniedBundleIdentifiers = (NSArray *)v37;

  if (v11) {
    goto LABEL_10;
  }
  if ([(NSString *)v9->_esso_type isEqualToString:@"Credential"])
  {
    id v117 = 0;
    v39 = [v8 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"Hosts" isRequired:1 allowZeroLengthString:0 outError:&v117];
    id v40 = v117;
    if (v40)
    {
LABEL_42:
      id v11 = v40;
LABEL_43:

      goto LABEL_10;
    }
    if (![v39 count])
    {
      v51 = (void *)MEMORY[0x1E4F28C58];
      v52 = MCErrorArray(@"ERROR_PAYLOAD_FIELD_BAD_VALUE_P_FIELD", v41, v42, v43, v44, v45, v46, v47, @"Hosts");
      id v11 = [v51 MCErrorWithDomain:@"MCPayloadErrorDomain" code:2004 descriptionArray:v52 underlyingError:0 errorType:@"MCFatalError"];

      if (v11) {
        goto LABEL_43;
      }
    }
    v99 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v39, "count"));
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v39, "count"));
    v97 = (NSArray *)objc_claimAutoreleasedReturnValue();
    long long v113 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    id obj = v39;
    uint64_t v96 = [obj countByEnumeratingWithState:&v113 objects:v133 count:16];
    id v11 = 0;
    if (v96)
    {
      uint64_t v95 = *(void *)v114;
LABEL_28:
      uint64_t v48 = 0;
      v49 = v11;
      while (1)
      {
        if (*(void *)v114 != v95) {
          objc_enumerationMutation(obj);
        }
        v50 = *(void **)(*((void *)&v113 + 1) + 8 * v48);
        id v112 = v49;
        BOOL v102 = [(MCExtensibleSingleSignOnPayload *)v9 _validateHost:v50 outError:&v112];
        id v11 = v112;

        if (!v102) {
          break;
        }
        v103 = [v50 lowercaseString];
        if (objc_msgSend(v99, "containsObject:"))
        {
          v53 = (void *)MEMORY[0x1E4F28C58];
          v54 = [(MCExtensibleSingleSignOnPayload *)v9 esso_extensionIdentifier];
          v62 = MCErrorArray(@"EXTENSIBLE_SSO_INTRA_HOST_CONFLICT_P_EXTENSION_ID_P_HOST", v55, v56, v57, v58, v59, v60, v61, v54);
          uint64_t v63 = [v53 MCErrorWithDomain:@"MCExtensibleSingleSignOnErrorDomain" code:54006 descriptionArray:v62 errorType:@"MCFatalError"];

          id v11 = (id)v63;
          break;
        }
        [v99 addObject:v103];
        [(NSArray *)v97 addObject:v50];

        ++v48;
        v49 = v11;
        if (v96 == v48)
        {
          uint64_t v96 = [obj countByEnumeratingWithState:&v113 objects:v133 count:16];
          if (v96) {
            goto LABEL_28;
          }
          break;
        }
      }
    }

    esso_hosts = v9->_esso_hosts;
    v9->_esso_hosts = v97;

    if (v11)
    {
LABEL_10:
      v24 = [(MCPayload *)v9 malformedPayloadErrorWithError:v11];
      v25 = v24;
      if (a5) {
        *a5 = v24;
      }
      v26 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v27 = v26;
        v28 = objc_opt_class();
        id v29 = v28;
        v30 = [v25 MCVerboseDescription];
        *(_DWORD *)buf = 138543618;
        v129 = v28;
        __int16 v130 = 2114;
        id v131 = v30;
        _os_log_impl(&dword_1A13F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
      }
      uint64_t v9 = 0;
      goto LABEL_15;
    }
  }
  if (![(NSString *)v9->_esso_type isEqualToString:@"Redirect"])
  {
    id v11 = 0;
    goto LABEL_15;
  }
  id v111 = 0;
  v39 = [v8 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"URLs" isRequired:1 allowZeroLengthString:0 outError:&v111];
  id v40 = v111;
  if (v40) {
    goto LABEL_42;
  }
  if (![v39 count])
  {
    v79 = (void *)MEMORY[0x1E4F28C58];
    v80 = MCErrorArray(@"ERROR_PAYLOAD_FIELD_BAD_VALUE_P_FIELD", v65, v66, v67, v68, v69, v70, v71, @"URLs");
    id v11 = [v79 MCErrorWithDomain:@"MCPayloadErrorDomain" code:2004 descriptionArray:v80 underlyingError:0 errorType:@"MCFatalError"];

    if (v11) {
      goto LABEL_43;
    }
  }
  v105 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v39, "count"));
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v39, "count"));
  v104 = (NSArray *)objc_claimAutoreleasedReturnValue();
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id v98 = v39;
  uint64_t v72 = [v98 countByEnumeratingWithState:&v107 objects:v132 count:16];
  if (!v72)
  {
    id v11 = 0;
    goto LABEL_62;
  }
  uint64_t v73 = v72;
  uint64_t v100 = *(void *)v108;
  while (2)
  {
    for (uint64_t i = 0; i != v73; ++i)
    {
      if (*(void *)v108 != v100) {
        objc_enumerationMutation(v98);
      }
      uint64_t v75 = *(void *)(*((void *)&v107 + 1) + 8 * i);
      id v106 = 0;
      v76 = [(MCExtensibleSingleSignOnPayload *)v9 _validateURLString:v75 outError:&v106];
      id v77 = v106;
      if (v77)
      {
        id v11 = v77;
LABEL_61:

        goto LABEL_62;
      }
      v78 = [v76 normalizedURL];
      if ([v105 containsObject:v78])
      {
        v81 = (void *)MEMORY[0x1E4F28C58];
        v82 = [(MCExtensibleSingleSignOnPayload *)v9 esso_extensionIdentifier];
        v93 = [v76 absoluteString];
        v90 = MCErrorArray(@"EXTENSIBLE_SSO_INTRA_URL_CONFLICT_P_EXTENSION_ID_P_URL", v83, v84, v85, v86, v87, v88, v89, v82);
        [v81 MCErrorWithDomain:@"MCExtensibleSingleSignOnErrorDomain" code:54004 descriptionArray:v90 errorType:@"MCFatalError"];
        v91 = v78;
        id v11 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_61;
      }
      [v105 addObject:v78];
      [(NSArray *)v104 addObject:v76];
    }
    uint64_t v73 = [v98 countByEnumeratingWithState:&v107 objects:v132 count:16];
    id v11 = 0;
    if (v73) {
      continue;
    }
    break;
  }
LABEL_62:

  esso_URLs = v9->_esso_URLs;
  v9->_esso_URLs = v104;

  if (v11) {
    goto LABEL_10;
  }
LABEL_15:
  if ([v8 count])
  {
    v31 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v32 = v31;
      v33 = [(MCPayload *)v9 friendlyName];
      *(_DWORD *)buf = 138543618;
      v129 = v33;
      __int16 v130 = 2114;
      id v131 = v8;
      _os_log_impl(&dword_1A13F0000, v32, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);
    }
  }

LABEL_19:
  return v9;
}

- (id)verboseDescription
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  v49.receiver = self;
  v49.super_class = (Class)MCExtensibleSingleSignOnPayload;
  uint64_t v3 = [(MCPayload *)&v49 verboseDescription];
  uint64_t v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [(MCExtensibleSingleSignOnPayload *)self esso_type];

  if (v5)
  {
    uint64_t v6 = [(MCExtensibleSingleSignOnPayload *)self esso_type];
    [v4 appendFormat:@"Type        : %@\n", v6];
  }
  uint64_t v7 = [(MCExtensibleSingleSignOnPayload *)self esso_realm];

  if (v7)
  {
    id v8 = [(MCExtensibleSingleSignOnPayload *)self esso_realm];
    [v4 appendFormat:@"Realm       : %@\n", v8];
  }
  uint64_t v9 = [(MCExtensibleSingleSignOnPayload *)self esso_extensionIdentifier];

  if (v9)
  {
    uint64_t v10 = [(MCExtensibleSingleSignOnPayload *)self esso_extensionIdentifier];
    [v4 appendFormat:@"Extension ID: %@\n", v10];
  }
  id v11 = [(MCExtensibleSingleSignOnPayload *)self esso_teamIdentifier];

  if (v11)
  {
    v12 = [(MCExtensibleSingleSignOnPayload *)self esso_teamIdentifier];
    [v4 appendFormat:@"Team ID     : %@\n", v12];
  }
  v13 = [(MCExtensibleSingleSignOnPayload *)self esso_extensionData];

  if (v13)
  {
    v14 = [(MCExtensibleSingleSignOnPayload *)self esso_extensionData];
    objc_msgSend(v4, "appendFormat:", @"Ext. Data   : [%ld entries]\n", objc_msgSend(v14, "count"));
  }
  uint64_t v15 = [(MCExtensibleSingleSignOnPayload *)self esso_URLs];

  if (v15)
  {
    [v4 appendString:@"URLs        :\n"];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v16 = [(MCExtensibleSingleSignOnPayload *)self esso_URLs];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v45 objects:v52 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v46 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = [*(id *)(*((void *)&v45 + 1) + 8 * i) absoluteString];
          [v4 appendFormat:@"    %@\n", v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v45 objects:v52 count:16];
      }
      while (v18);
    }
  }
  v22 = [(MCExtensibleSingleSignOnPayload *)self esso_hosts];

  if (v22)
  {
    [v4 appendString:@"Hosts       :\n"];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v23 = [(MCExtensibleSingleSignOnPayload *)self esso_hosts];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v41 objects:v51 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v42 != v26) {
            objc_enumerationMutation(v23);
          }
          [v4 appendFormat:@"    %@\n", *(void *)(*((void *)&v41 + 1) + 8 * j)];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v41 objects:v51 count:16];
      }
      while (v25);
    }
  }
  v28 = [(MCExtensibleSingleSignOnPayload *)self esso_screenLockedBehavior];

  if (v28)
  {
    id v29 = [(MCExtensibleSingleSignOnPayload *)self esso_screenLockedBehavior];
    [v4 appendFormat:@"ScreenLocked: %@\n", v29];
  }
  v30 = [(MCExtensibleSingleSignOnPayload *)self esso_deniedBundleIdentifiers];

  if (v30)
  {
    [v4 appendString:@"DenyBndlIds :\n"];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v31 = [(MCExtensibleSingleSignOnPayload *)self esso_deniedBundleIdentifiers];
    uint64_t v32 = [v31 countByEnumeratingWithState:&v37 objects:v50 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v38;
      do
      {
        for (uint64_t k = 0; k != v33; ++k)
        {
          if (*(void *)v38 != v34) {
            objc_enumerationMutation(v31);
          }
          [v4 appendFormat:@"    %@\n", *(void *)(*((void *)&v37 + 1) + 8 * k)];
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v37 objects:v50 count:16];
      }
      while (v33);
    }
  }
  return v4;
}

- (id)stubDictionary
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v33.receiver = self;
  v33.super_class = (Class)MCExtensibleSingleSignOnPayload;
  uint64_t v3 = [(MCPayload *)&v33 stubDictionary];
  uint64_t v4 = [(MCExtensibleSingleSignOnPayload *)self esso_type];

  if (v4)
  {
    uint64_t v5 = [(MCExtensibleSingleSignOnPayload *)self esso_type];
    [v3 setObject:v5 forKeyedSubscript:@"Type"];
  }
  uint64_t v6 = [(MCExtensibleSingleSignOnPayload *)self esso_realm];

  if (v6)
  {
    uint64_t v7 = [(MCExtensibleSingleSignOnPayload *)self esso_realm];
    [v3 setObject:v7 forKeyedSubscript:@"Realm"];
  }
  id v8 = [(MCExtensibleSingleSignOnPayload *)self esso_extensionIdentifier];

  if (v8)
  {
    uint64_t v9 = [(MCExtensibleSingleSignOnPayload *)self esso_extensionIdentifier];
    [v3 setObject:v9 forKeyedSubscript:@"ExtensionIdentifier"];
  }
  uint64_t v10 = [(MCExtensibleSingleSignOnPayload *)self esso_teamIdentifier];

  if (v10)
  {
    id v11 = [(MCExtensibleSingleSignOnPayload *)self esso_teamIdentifier];
    [v3 setObject:v11 forKeyedSubscript:@"TeamIdentifier"];
  }
  v12 = [(MCExtensibleSingleSignOnPayload *)self esso_extensionData];

  if (v12)
  {
    v13 = [(MCExtensibleSingleSignOnPayload *)self esso_extensionData];
    [v3 setObject:v13 forKeyedSubscript:@"ExtensionData"];
  }
  v14 = [(MCExtensibleSingleSignOnPayload *)self esso_URLs];

  if (v14)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v16 = [(MCExtensibleSingleSignOnPayload *)self esso_URLs];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v30 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = [*(id *)(*((void *)&v29 + 1) + 8 * i) absoluteString];
          [v15 addObject:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v18);
    }

    [v3 setObject:v15 forKeyedSubscript:@"URLs"];
  }
  v22 = [(MCExtensibleSingleSignOnPayload *)self esso_hosts];

  if (v22)
  {
    v23 = [(MCExtensibleSingleSignOnPayload *)self esso_hosts];
    [v3 setObject:v23 forKeyedSubscript:@"Hosts"];
  }
  uint64_t v24 = [(MCExtensibleSingleSignOnPayload *)self esso_screenLockedBehavior];

  if (v24)
  {
    uint64_t v25 = [(MCExtensibleSingleSignOnPayload *)self esso_screenLockedBehavior];
    [v3 setObject:v25 forKeyedSubscript:@"ScreenLockedBehavior"];
  }
  uint64_t v26 = [(MCExtensibleSingleSignOnPayload *)self esso_deniedBundleIdentifiers];

  if (v26)
  {
    v27 = [(MCExtensibleSingleSignOnPayload *)self esso_deniedBundleIdentifiers];
    [v3 setObject:v27 forKeyedSubscript:@"DeniedBundleIdentifiers"];
  }
  return v3;
}

- (id)title
{
  uint64_t v3 = [(MCExtensibleSingleSignOnPayload *)self esso_extensionIdentifier];
  uint64_t v4 = MCContainingBundleIDForBundleID(v3);

  uint64_t v5 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v4];
  uint64_t v6 = [v5 localizedName];
  uint64_t v7 = [v6 length];

  if (!v7 || ([v5 localizedName], (id v8 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v9 = [(MCExtensibleSingleSignOnPayload *)self esso_extensionIdentifier];
    char v10 = [v9 isEqualToString:@"com.apple.AppSSOKerberos.KerberosExtension"];

    if (v10)
    {
      id v8 = @"Kerberos";
    }
    else
    {
      id v8 = [(MCExtensibleSingleSignOnPayload *)self esso_extensionIdentifier];
    }
  }

  return v8;
}

- (id)payloadDescriptionKeyValueSections
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = [(MCExtensibleSingleSignOnPayload *)self esso_type];

  if (v5)
  {
    uint64_t v6 = [(MCExtensibleSingleSignOnPayload *)self esso_type];

    if (v6 == @"Redirect")
    {
      uint64_t v9 = @"ESSO_TYPE_REDIRECT";
    }
    else
    {
      uint64_t v7 = [(MCExtensibleSingleSignOnPayload *)self esso_type];

      if (v7 != @"Credential")
      {
        uint64_t v8 = [(MCExtensibleSingleSignOnPayload *)self esso_type];
LABEL_8:
        char v10 = (void *)v8;
        id v11 = [MCKeyValue alloc];
        v12 = MCLocalizedString(@"TYPE");
        v13 = [(MCKeyValue *)v11 initWithLocalizedString:v10 localizedKey:v12];

        [v4 addObject:v13];
        goto LABEL_9;
      }
      uint64_t v9 = @"ESSO_TYPE_CREDENTIAL";
    }
    uint64_t v8 = MCLocalizedString(v9);
    goto LABEL_8;
  }
LABEL_9:
  v14 = [(MCExtensibleSingleSignOnPayload *)self esso_realm];

  if (v14)
  {
    uint64_t v15 = [MCKeyValue alloc];
    v16 = [(MCExtensibleSingleSignOnPayload *)self esso_realm];
    uint64_t v17 = MCLocalizedString(@"REALM");
    uint64_t v18 = [(MCKeyValue *)v15 initWithLocalizedString:v16 localizedKey:v17];

    [v4 addObject:v18];
  }
  uint64_t v19 = [(MCExtensibleSingleSignOnPayload *)self esso_extensionIdentifier];

  if (v19)
  {
    v20 = [MCKeyValue alloc];
    uint64_t v21 = [(MCExtensibleSingleSignOnPayload *)self esso_extensionIdentifier];
    v22 = MCLocalizedString(@"EXTENSION_ID");
    v23 = [(MCKeyValue *)v20 initWithLocalizedString:v21 localizedKey:v22];

    [v4 addObject:v23];
  }
  uint64_t v24 = [(MCExtensibleSingleSignOnPayload *)self esso_teamIdentifier];

  if (v24)
  {
    uint64_t v25 = [MCKeyValue alloc];
    uint64_t v26 = [(MCExtensibleSingleSignOnPayload *)self esso_teamIdentifier];
    v27 = MCLocalizedString(@"TEAM_ID");
    v28 = [(MCKeyValue *)v25 initWithLocalizedString:v26 localizedKey:v27];

    [v4 addObject:v28];
  }
  long long v29 = [(MCExtensibleSingleSignOnPayload *)self esso_screenLockedBehavior];

  if (v29)
  {
    long long v30 = [MCKeyValue alloc];
    long long v31 = [(MCExtensibleSingleSignOnPayload *)self esso_screenLockedBehavior];
    long long v32 = MCLocalizedString(@"SCREEN_LOCKED_BEHAVIOR");
    objc_super v33 = [(MCKeyValue *)v30 initWithLocalizedString:v31 localizedKey:v32];

    [v4 addObject:v33];
  }
  if ([v4 count])
  {
    uint64_t v34 = +[MCKeyValueSection sectionWithKeyValues:v4];
    [v3 addObject:v34];
  }
  uint64_t v35 = [(MCExtensibleSingleSignOnPayload *)self esso_URLs];
  uint64_t v36 = [v35 count];

  if (v36)
  {
    long long v37 = [MEMORY[0x1E4F1CA48] array];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v38 = [(MCExtensibleSingleSignOnPayload *)self esso_URLs];
    uint64_t v39 = [v38 countByEnumeratingWithState:&v57 objects:v61 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v58 != v41) {
            objc_enumerationMutation(v38);
          }
          long long v43 = [*(id *)(*((void *)&v57 + 1) + 8 * i) absoluteString];
          [v37 addObject:v43];
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v57 objects:v61 count:16];
      }
      while (v40);
    }

    long long v44 = MCLocalizedString(@"URLS");
    long long v45 = +[MCKeyValueSection sectionWithLocalizedArray:v37 title:v44 footer:0];

    [v3 addObject:v45];
  }
  long long v46 = [(MCExtensibleSingleSignOnPayload *)self esso_hosts];
  uint64_t v47 = [v46 count];

  if (v47)
  {
    long long v48 = [(MCExtensibleSingleSignOnPayload *)self esso_hosts];
    objc_super v49 = MCLocalizedString(@"HOSTS");
    v50 = +[MCKeyValueSection sectionWithLocalizedArray:v48 title:v49 footer:0];

    [v3 addObject:v50];
  }
  v51 = [(MCExtensibleSingleSignOnPayload *)self esso_deniedBundleIdentifiers];
  uint64_t v52 = [v51 count];

  if (v52)
  {
    uint64_t v53 = [(MCExtensibleSingleSignOnPayload *)self esso_deniedBundleIdentifiers];
    v54 = MCLocalizedString(@"DENIED_BUNDLE_IDENTIFIERS");
    uint64_t v55 = +[MCKeyValueSection sectionWithLocalizedArray:v53 title:v54 footer:0];

    [v3 addObject:v55];
  }
  if (![v3 count])
  {

    uint64_t v3 = 0;
  }

  return v3;
}

- (BOOL)_validateHost:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  uint64_t v13 = [v5 length];
  if (!v13)
  {
    v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = MCErrorArray(@"EXTENSIBLE_SSO_INVALID_HOST_P_HOST", v6, v7, v8, v9, v10, v11, v12, v5);
    v16 = [v14 MCErrorWithDomain:@"MCExtensibleSingleSignOnErrorDomain" code:54001 descriptionArray:v15 errorType:@"MCFatalError"];

    if (a4) {
      *a4 = v16;
    }
  }
  return v13 != 0;
}

- (id)_validateURLString:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithString:v6];
  uint64_t v8 = [v7 scheme];
  uint64_t v9 = [v8 caseInsensitiveCompare:@"http"];
  if (v9)
  {
    uint64_t v4 = [v7 scheme];
    if ([v4 caseInsensitiveCompare:@"https"]) {
      goto LABEL_7;
    }
  }
  uint64_t v10 = [v7 host];
  if (![v10 length])
  {
LABEL_6:

    if (!v9)
    {
LABEL_8:

LABEL_9:
      uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
      v20 = MCErrorArray(@"EXTENSIBLE_SSO_INVALID_URL_P_URL", v12, v13, v14, v15, v16, v17, v18, v6);
      uint64_t v21 = [v19 MCErrorWithDomain:@"MCExtensibleSingleSignOnErrorDomain" code:54000 descriptionArray:v20 errorType:@"MCFatalError"];

      if (a4) {
        *a4 = v21;
      }

      v22 = 0;
      goto LABEL_12;
    }
LABEL_7:

    goto LABEL_8;
  }
  uint64_t v11 = [v7 query];
  if ([v11 length])
  {

    goto LABEL_6;
  }
  uint64_t v24 = [v7 fragment];
  uint64_t v25 = [v24 length];

  if (v9) {
  if (v25)
  }
    goto LABEL_9;
  v22 = [v7 URL];
  if (!v22) {
    goto LABEL_9;
  }
LABEL_12:

  return v22;
}

- (NSString)esso_type
{
  return self->_esso_type;
}

- (void)setEsso_type:(id)a3
{
}

- (NSString)esso_realm
{
  return self->_esso_realm;
}

- (void)setEsso_realm:(id)a3
{
}

- (NSString)esso_extensionIdentifier
{
  return self->_esso_extensionIdentifier;
}

- (void)setEsso_extensionIdentifier:(id)a3
{
}

- (NSString)esso_teamIdentifier
{
  return self->_esso_teamIdentifier;
}

- (void)setEsso_teamIdentifier:(id)a3
{
}

- (NSDictionary)esso_extensionData
{
  return self->_esso_extensionData;
}

- (void)setEsso_extensionData:(id)a3
{
}

- (NSArray)esso_URLs
{
  return self->_esso_URLs;
}

- (void)setEsso_URLs:(id)a3
{
}

- (NSArray)esso_hosts
{
  return self->_esso_hosts;
}

- (void)setEsso_hosts:(id)a3
{
}

- (NSString)esso_screenLockedBehavior
{
  return self->_esso_screenLockedBehavior;
}

- (void)setEsso_screenLockedBehavior:(id)a3
{
}

- (NSArray)esso_deniedBundleIdentifiers
{
  return self->_esso_deniedBundleIdentifiers;
}

- (void)setEsso_deniedBundleIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_esso_deniedBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_esso_screenLockedBehavior, 0);
  objc_storeStrong((id *)&self->_esso_hosts, 0);
  objc_storeStrong((id *)&self->_esso_URLs, 0);
  objc_storeStrong((id *)&self->_esso_extensionData, 0);
  objc_storeStrong((id *)&self->_esso_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_esso_extensionIdentifier, 0);
  objc_storeStrong((id *)&self->_esso_realm, 0);
  objc_storeStrong((id *)&self->_esso_type, 0);
}

@end