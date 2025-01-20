@interface MCDomainsPayload
+ (BOOL)isPatternValid:(id)a3 forField:(id)a4 outError:(id *)a5;
+ (id)invalidDomainPatternErrorWithPattern:(id)a3 field:(id)a4;
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)tooManyAppsErrorWithMaxCount:(id)a3 field:(id)a4;
+ (id)tooManyDomainsErrorWithMaxCount:(id)a3 field:(id)a4;
+ (id)typeStrings;
- (MCDomainsPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSDictionary)restrictions;
- (id)payloadDescriptionKeyValueSections;
- (id)stubDictionary;
- (void)setRestrictions:(id)a3;
@end

@implementation MCDomainsPayload

+ (id)typeStrings
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.domains";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"DOMAINS_SINGULAR", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"DOMAINS_PLURAL", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)invalidDomainPatternErrorWithPattern:(id)a3 field:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
  id v6 = a4;
  v14 = MCErrorArray(@"DOMAINS_INVALID_PATTERN_P_PATTERN", v7, v8, v9, v10, v11, v12, v13, a3);
  v15 = [v5 MCErrorWithDomain:@"MCDomainsErrorDomain" code:38000 descriptionArray:v14 errorType:@"MCFatalError"];
  v16 = +[MCPayload badFieldValueErrorWithField:v6 underlyingError:v15];

  return v16;
}

+ (id)tooManyDomainsErrorWithMaxCount:(id)a3 field:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
  id v6 = a4;
  v14 = MCErrorArray(@"DOMAINS_TOO_MANY_DOMAIN_ENTRIES_P_MAX", v7, v8, v9, v10, v11, v12, v13, a3);
  v15 = [v5 MCErrorWithDomain:@"MCDomainsErrorDomain" code:38001 descriptionArray:v14 errorType:@"MCFatalError"];
  v16 = +[MCPayload badFieldValueErrorWithField:v6 underlyingError:v15];

  return v16;
}

+ (id)tooManyAppsErrorWithMaxCount:(id)a3 field:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
  id v6 = a4;
  v14 = MCErrorArray(@"DOMAINS_TOO_MANY_APP_ENTRIES_P_MAX", v7, v8, v9, v10, v11, v12, v13, a3);
  v15 = [v5 MCErrorWithDomain:@"MCDomainsErrorDomain" code:38001 descriptionArray:v14 errorType:@"MCFatalError"];
  v16 = +[MCPayload badFieldValueErrorWithField:v6 underlyingError:v15];

  return v16;
}

+ (BOOL)isPatternValid:(id)a3 forField:(id)a4 outError:(id *)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v7 length])
  {
    uint64_t v9 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    uint64_t v10 = [v7 stringByTrimmingCharactersInSet:v9];
    char v11 = [v7 isEqualToString:v10];

    if (v11)
    {
      if (isPatternValid_forField_outError__onceToken != -1) {
        dispatch_once(&isPatternValid_forField_outError__onceToken, &__block_literal_global_10);
      }
      if ([v7 rangeOfCharacterFromSet:isPatternValid_forField_outError__punctuation] == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v12 = [v7 pathComponents];
        if (![v12 count]
          || ([v12 objectAtIndexedSubscript:0],
              uint64_t v13 = objc_claimAutoreleasedReturnValue(),
              int v14 = [v13 isEqualToString:@"/"],
              v13,
              v14))
        {
          id v15 = +[MCDomainsPayload invalidDomainPatternErrorWithPattern:v7 field:v8];
          goto LABEL_29;
        }
        v17 = [v12 lastObject];
        int v18 = [v17 isEqualToString:@"/"];

        if (v18)
        {
          uint64_t v19 = objc_msgSend(v12, "subarrayWithRange:", 0, objc_msgSend(v12, "count") - 1);

          id v12 = (id)v19;
        }
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v12 = v12;
        uint64_t v20 = [v12 countByEnumeratingWithState:&v37 objects:v41 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v38;
          while (2)
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v38 != v22) {
                objc_enumerationMutation(v12);
              }
              if (!objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * i), "length", (void)v37))
              {
                id v15 = +[MCDomainsPayload invalidDomainPatternErrorWithPattern:v7 field:v8];

                goto LABEL_29;
              }
            }
            uint64_t v21 = [v12 countByEnumeratingWithState:&v37 objects:v41 count:16];
            if (v21) {
              continue;
            }
            break;
          }
        }

        v24 = [v12 objectAtIndexedSubscript:0];
        if (([v24 isEqualToString:@"*"] & 1) != 0
          || ([v24 isEqualToString:@"*."] & 1) != 0
          || [v24 isEqualToString:@"."])
        {
          goto LABEL_26;
        }
        if ((unint64_t)[v24 length] >= 2)
        {
          v26 = objc_msgSend(v24, "substringWithRange:", 0, 1);
          if ([v26 isEqualToString:@"*"])
          {
            v27 = objc_msgSend(v24, "substringWithRange:", 1, 1);
            char v28 = [v27 isEqualToString:@"."];

            if ((v28 & 1) == 0) {
              goto LABEL_26;
            }
          }
          else
          {
          }
          if (objc_msgSend(v24, "rangeOfString:options:", @":", 12, (void)v37) != 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_26;
          }
        }
        uint64_t v29 = objc_msgSend(v24, "rangeOfString:options:", @":", 4, (void)v37);
        if (v29)
        {
          uint64_t v30 = v29;
          if (v29 == 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_40;
          }
          if (v29 != [v24 length] - 1
            && objc_msgSend(v24, "rangeOfString:options:range:", @":", 0, 0, v30) == 0x7FFFFFFFFFFFFFFFLL)
          {
            v31 = [v24 substringFromIndex:v30 + 1];
            v32 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
            v33 = [v32 invertedSet];
            uint64_t v34 = [v31 rangeOfCharacterFromSet:v33];

            if (v34 != 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v35 = +[MCDomainsPayload invalidDomainPatternErrorWithPattern:v7 field:v8];
              v36 = v31;
              id v15 = (id)v35;

              goto LABEL_27;
            }

LABEL_40:
            id v15 = 0;
            goto LABEL_30;
          }
        }
LABEL_26:
        +[MCDomainsPayload invalidDomainPatternErrorWithPattern:field:](MCDomainsPayload, "invalidDomainPatternErrorWithPattern:field:", v7, v8, (void)v37);
        id v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:

LABEL_29:
        if (!v15) {
          goto LABEL_30;
        }
        goto LABEL_10;
      }
    }
  }
  id v15 = +[MCDomainsPayload invalidDomainPatternErrorWithPattern:v7 field:v8];
  if (!v15)
  {
LABEL_30:
    BOOL v16 = 1;
    goto LABEL_31;
  }
LABEL_10:
  if (a5)
  {
    id v15 = v15;
    BOOL v16 = 0;
    *a5 = v15;
  }
  else
  {
    BOOL v16 = 0;
  }
LABEL_31:

  return v16;
}

uint64_t __53__MCDomainsPayload_isPatternValid_forField_outError___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28E58]);
  v1 = (void *)isPatternValid_forField_outError__punctuation;
  isPatternValid_forField_outError__punctuation = (uint64_t)v0;

  uint64_t v2 = (void *)isPatternValid_forField_outError__punctuation;
  return [v2 addCharactersInString:@"@#?!&"];
}

- (MCDomainsPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v92.receiver = self;
  v92.super_class = (Class)MCDomainsPayload;
  uint64_t v9 = [(MCPayload *)&v92 initWithDictionary:v8 profile:a4 outError:a5];
  uint64_t v10 = v9;
  if (!v9) {
    goto LABEL_25;
  }
  v66 = v9;
  v67 = a5;
  v65 = [MEMORY[0x1E4F1CA60] dictionary];
  v64 = [MEMORY[0x1E4F1CA60] dictionary];
  id v91 = 0;
  v63 = v8;
  char v11 = [v8 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"WebDomains" isRequired:0 outError:&v91];
  id v12 = v91;
  v71 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v11, "count"));
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v87 objects:v105 count:16];
  id obj = v13;
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v88;
    while (2)
    {
      uint64_t v17 = 0;
      int v18 = v12;
      do
      {
        if (*(void *)v88 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = +[MCDomainsCacheEntry normalizedPatternString:*(void *)(*((void *)&v87 + 1) + 8 * v17)];
        id v86 = v18;
        BOOL v20 = +[MCDomainsPayload isPatternValid:v19 forField:@"WebDomains" outError:&v86];
        id v12 = v86;

        if (!v20)
        {
          uint64_t v21 = 0;
          id v22 = 0;
          v62 = 0;
          v68 = obj;
          id v69 = 0;
          id v8 = v63;
          v24 = v64;
          v25 = v65;
          uint64_t v10 = v66;
          goto LABEL_14;
        }
        [v71 addObject:v19];

        ++v17;
        int v18 = v12;
      }
      while (v15 != v17);
      id v13 = obj;
      uint64_t v15 = [obj countByEnumeratingWithState:&v87 objects:v105 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  if (v12)
  {
    uint64_t v21 = 0;
    id v22 = 0;
    id v69 = 0;
    v23 = 0;
    id v8 = v63;
    v24 = v64;
    v25 = v65;
    uint64_t v10 = v66;
    unint64_t v26 = 0x1E4F1C000;
    v27 = v67;
    if (!v67) {
      goto LABEL_19;
    }
LABEL_17:
    if (v12)
    {
      id v12 = v12;
      id *v27 = v12;
    }
    goto LABEL_19;
  }
  id v8 = v63;
  v24 = v64;
  v25 = v65;
  uint64_t v10 = v66;
  v27 = a5;
  if (v13)
  {
    v103 = @"values";
    v32 = [v71 allObjects];
    v104 = v32;
    v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v104 forKeys:&v103 count:1];
    [v65 setObject:v33 forKeyedSubscript:@"managedWebDomains"];
  }
  id v85 = 0;
  v23 = [v63 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"EmailDomains" isRequired:0 outError:&v85];
  id v34 = v85;
  if (v34)
  {
    id v12 = v34;
    uint64_t v21 = 0;
    id v22 = 0;
    id v69 = 0;
    unint64_t v26 = 0x1E4F1C000;
    if (!v67) {
      goto LABEL_19;
    }
    goto LABEL_17;
  }
  if (v23)
  {
    v101 = @"values";
    v102 = v23;
    uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v102 forKeys:&v101 count:1];
    [v64 setObject:v35 forKeyedSubscript:@"managedEmailDomains"];
  }
  v36 = [(MCPayload *)v66 profile];
  if ([v36 isStub])
  {
  }
  else
  {
    long long v37 = [MEMORY[0x1E4F73168] sharedConfiguration];
    int v38 = [v37 isSupervised];

    if (!v38)
    {
      id v12 = 0;
      char v28 = 0;
      id v22 = 0;
      uint64_t v21 = 0;
      unint64_t v26 = 0x1E4F1C000;
      goto LABEL_20;
    }
  }
  v62 = v23;
  id v84 = 0;
  long long v39 = [v63 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"SafariPasswordAutoFillDomains" isRequired:0 outError:&v84];
  id v12 = v84;
  v68 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v39, "count"));
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v40 = v39;
  uint64_t v41 = [v40 countByEnumeratingWithState:&v80 objects:v100 count:16];
  id v69 = v40;
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v81;
    while (2)
    {
      uint64_t v44 = 0;
      v45 = v12;
      do
      {
        if (*(void *)v81 != v43) {
          objc_enumerationMutation(v69);
        }
        v46 = +[MCDomainsCacheEntry normalizedPatternString:*(void *)(*((void *)&v80 + 1) + 8 * v44)];
        id v79 = v45;
        BOOL v47 = +[MCDomainsPayload isPatternValid:v46 forField:@"SafariPasswordAutoFillDomains" outError:&v79];
        id v12 = v79;

        if (!v47)
        {
          uint64_t v21 = 0;
          id v22 = 0;
          uint64_t v19 = v69;
          id v8 = v63;
          v24 = v64;
          v25 = v65;
          uint64_t v10 = v66;
          goto LABEL_47;
        }
        [v68 addObject:v46];

        ++v44;
        v45 = v12;
      }
      while (v42 != v44);
      id v40 = v69;
      uint64_t v42 = [v69 countByEnumeratingWithState:&v80 objects:v100 count:16];
      if (v42) {
        continue;
      }
      break;
    }
  }

  if (v12)
  {
    uint64_t v21 = 0;
    id v22 = 0;
    id v8 = v63;
    v24 = v64;
    v25 = v65;
    uint64_t v10 = v66;
    goto LABEL_15;
  }
  id v8 = v63;
  v24 = v64;
  v25 = v65;
  v27 = v67;
  v23 = v62;
  if (v40)
  {
    v98 = @"values";
    v48 = [v68 allObjects];
    v99 = v48;
    v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v99 forKeys:&v98 count:1];
    [v65 setObject:v49 forKeyedSubscript:@"allowedSafariPasswordAutoFillDomains"];
  }
  id v78 = 0;
  id v22 = [v63 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"CrossSiteTrackingPreventionRelaxedDomains" isRequired:0 outError:&v78];
  id v50 = v78;
  uint64_t v10 = v66;
  if (!v50)
  {
    if ((unint64_t)[v22 count] >= 0xB)
    {
      v51 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:10];
      id v12 = +[MCDomainsPayload tooManyDomainsErrorWithMaxCount:v51 field:@"CrossSiteTrackingPreventionRelaxedDomains"];

      if (v12) {
        goto LABEL_53;
      }
    }
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v22, "count"));
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v22 = v22;
    uint64_t v61 = [v22 countByEnumeratingWithState:&v74 objects:v97 count:16];
    if (v61)
    {
      id v12 = 0;
      uint64_t v60 = *(void *)v75;
      while (2)
      {
        uint64_t v52 = 0;
        v53 = v12;
        do
        {
          if (*(void *)v75 != v60) {
            objc_enumerationMutation(v22);
          }
          v54 = +[MCDomainsCacheEntry normalizedPatternString:](MCDomainsCacheEntry, "normalizedPatternString:", *(void *)(*((void *)&v74 + 1) + 8 * v52), v60);
          id v73 = v53;
          BOOL v55 = +[MCDomainsPayload isPatternValid:v54 forField:@"CrossSiteTrackingPreventionRelaxedDomains" outError:&v73];
          id v12 = v73;

          if (!v55)
          {

            goto LABEL_66;
          }
          [v19 addObject:v54];

          ++v52;
          v53 = v12;
        }
        while (v61 != v52);
        uint64_t v61 = [v22 countByEnumeratingWithState:&v74 objects:v97 count:16];
        if (v61) {
          continue;
        }
        break;
      }
LABEL_66:

      v25 = v65;
      uint64_t v10 = v66;
      v24 = v64;
      if (v12)
      {
        uint64_t v21 = 0;
LABEL_14:

LABEL_15:
        unint64_t v26 = 0x1E4F1C000uLL;
        v27 = v67;
        v23 = v62;
        goto LABEL_16;
      }
    }
    else
    {
    }
    if (v22)
    {
      v95 = @"values";
      v56 = [v19 allObjects];
      v96 = v56;
      v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v96 forKeys:&v95 count:1];
      [v24 setObject:v57 forKeyedSubscript:@"crossSiteTrackingPreventionRelaxedDomains"];
    }
    id v72 = 0;
    uint64_t v21 = [v63 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"CrossSiteTrackingPreventionRelaxedApps" isRequired:0 outError:&v72];
    id v58 = v72;
    if (v58)
    {
      id v12 = v58;
    }
    else if ((unint64_t)[v21 count] < 0xB {
           || ([MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:10],
    }
               v59 = objc_claimAutoreleasedReturnValue(),
               id v8 = v63,
               +[MCDomainsPayload tooManyAppsErrorWithMaxCount:v59 field:@"CrossSiteTrackingPreventionRelaxedApps"], id v12 = (id)objc_claimAutoreleasedReturnValue(), v59, !v12))
    {
      if (v21)
      {
        v93 = @"values";
        v94 = v21;
        v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v94 forKeys:&v93 count:1];
        [v24 setObject:v46 forKeyedSubscript:@"crossSiteTrackingPreventionRelaxedApps"];
        id v12 = 0;
LABEL_47:
      }
      else
      {
        id v12 = 0;
      }
    }
    goto LABEL_14;
  }
  id v12 = v50;
LABEL_53:
  uint64_t v21 = 0;
  unint64_t v26 = 0x1E4F1C000;
LABEL_16:

  if (v27) {
    goto LABEL_17;
  }
LABEL_19:
  char v28 = v69;
LABEL_20:
  uint64_t v29 = [*(id *)(v26 + 2656) dictionary];
  if ([v24 count]) {
    [(NSDictionary *)v29 setObject:v24 forKeyedSubscript:@"intersection"];
  }
  if ([v25 count]) {
    [(NSDictionary *)v29 setObject:v25 forKeyedSubscript:@"union"];
  }
  restrictions = v10->_restrictions;
  v10->_restrictions = v29;

LABEL_25:
  return v10;
}

- (NSDictionary)restrictions
{
  return self->_restrictions;
}

- (id)stubDictionary
{
  v15.receiver = self;
  v15.super_class = (Class)MCDomainsPayload;
  uint64_t v3 = [(MCPayload *)&v15 stubDictionary];
  uint64_t v4 = [(MCDomainsPayload *)self restrictions];
  uint64_t v5 = +[MCRestrictionManager unionValuesForFeature:@"managedWebDomains" withRestrictionsDictionary:v4];

  if (v5) {
    [v3 setObject:v5 forKeyedSubscript:@"WebDomains"];
  }
  id v6 = [(MCDomainsPayload *)self restrictions];
  id v7 = +[MCRestrictionManager intersectedValuesForFeature:@"managedEmailDomains" withRestrictionsDictionary:v6];

  if (v7) {
    [v3 setObject:v7 forKeyedSubscript:@"EmailDomains"];
  }
  id v8 = [(MCDomainsPayload *)self restrictions];
  uint64_t v9 = +[MCRestrictionManager unionValuesForFeature:@"allowedSafariPasswordAutoFillDomains" withRestrictionsDictionary:v8];

  if (v9) {
    [v3 setObject:v9 forKeyedSubscript:@"SafariPasswordAutoFillDomains"];
  }
  uint64_t v10 = [(MCDomainsPayload *)self restrictions];
  char v11 = +[MCRestrictionManager intersectedValuesForFeature:@"crossSiteTrackingPreventionRelaxedDomains" withRestrictionsDictionary:v10];

  if (v11) {
    [v3 setObject:v11 forKeyedSubscript:@"CrossSiteTrackingPreventionRelaxedDomains"];
  }
  id v12 = [(MCDomainsPayload *)self restrictions];
  id v13 = +[MCRestrictionManager intersectedValuesForFeature:@"crossSiteTrackingPreventionRelaxedApps" withRestrictionsDictionary:v12];

  if (v13) {
    [v3 setObject:v13 forKeyedSubscript:@"CrossSiteTrackingPreventionRelaxedApps"];
  }

  return v3;
}

- (id)payloadDescriptionKeyValueSections
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [(MCDomainsPayload *)self restrictions];
  uint64_t v5 = +[MCRestrictionManager unionValuesForFeature:@"managedWebDomains" withRestrictionsDictionary:v4];

  if ([v5 count])
  {
    id v6 = MCLocalizedString(@"MANAGED_SAFARI_WEB_DOMAINS");
    id v7 = +[MCKeyValueSection sectionWithLocalizedArray:v5 title:v6 footer:0];

    [v3 addObject:v7];
  }
  id v8 = [(MCDomainsPayload *)self restrictions];
  uint64_t v9 = +[MCRestrictionManager intersectedValuesForFeature:@"managedEmailDomains" withRestrictionsDictionary:v8];

  if ([v9 count])
  {
    uint64_t v10 = MCLocalizedString(@"UNMARKED_EMAIL_DOMAINS");
    char v11 = +[MCKeyValueSection sectionWithLocalizedArray:v9 title:v10 footer:0];

    [v3 addObject:v11];
  }
  id v12 = [(MCDomainsPayload *)self restrictions];
  id v13 = +[MCRestrictionManager unionValuesForFeature:@"allowedSafariPasswordAutoFillDomains" withRestrictionsDictionary:v12];

  if ([v13 count])
  {
    uint64_t v14 = MCLocalizedString(@"SAFARI_PASSWORD_AUTOFILL_DOMAINS");
    objc_super v15 = +[MCKeyValueSection sectionWithLocalizedArray:v13 title:v14 footer:0];

    [v3 addObject:v15];
  }
  uint64_t v16 = [(MCDomainsPayload *)self restrictions];
  uint64_t v17 = +[MCRestrictionManager intersectedValuesForFeature:@"crossSiteTrackingPreventionRelaxedDomains" withRestrictionsDictionary:v16];

  if ([v17 count])
  {
    int v18 = MCLocalizedString(@"CROSS_SITE_TRACKING_PREVENTION_RELAXED_DOMAINS");
    uint64_t v19 = +[MCKeyValueSection sectionWithLocalizedArray:v17 title:v18 footer:0];

    [v3 addObject:v19];
  }
  BOOL v20 = [(MCDomainsPayload *)self restrictions];
  uint64_t v21 = +[MCRestrictionManager intersectedValuesForFeature:@"crossSiteTrackingPreventionRelaxedApps" withRestrictionsDictionary:v20];

  if ([v21 count])
  {
    id v22 = MCLocalizedString(@"CROSS_SITE_TRACKING_PREVENTION_RELAXED_APPS");
    v23 = +[MCKeyValueSection sectionWithLocalizedArray:v21 title:v22 footer:0];

    [v3 addObject:v23];
  }
  if (![v3 count])
  {

    uint64_t v3 = 0;
  }

  return v3;
}

- (void)setRestrictions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end