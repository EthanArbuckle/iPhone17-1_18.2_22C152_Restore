@interface MCRestrictionsPayload
+ (id)_platformSpecificKeyFilter;
+ (id)_supervisedAllowedKeys;
+ (id)_unsupervisedAllowedKeys;
+ (id)allAllowedPlatformKeys;
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
+ (id)userEnrollmentAllowedKeysFilter;
- (MCRestrictionsPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (id)_defaultValueRestrictions;
- (id)_enforcedFeatureStrings;
- (id)_intersectionStrings;
- (id)_invalidFieldErrorWithFieldName:(id)a3;
- (id)_restrictedFeatureStrings;
- (id)_unionStrings;
- (id)filterForUserEnrollmentOutError:(id *)a3;
- (id)installationWarnings;
- (id)localizedRestrictionStrings;
- (id)restrictions;
- (id)stubDictionary;
- (void)_insertRestrictedBoolForKey:(id)a3 value:(id)a4 preferenc:(BOOL)a5;
@end

@implementation MCRestrictionsPayload

+ (id)typeStrings
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithObject:@"com.apple.applicationaccess"];
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"APPLICATION_ACCESS_DESCRIPTION_SINGULAR_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"APPLICATION_ACCESS_DESCRIPTION_PLURAL_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (id)restrictions
{
  return self->_restrictions;
}

+ (id)_unsupervisedAllowedKeys
{
  if (_unsupervisedAllowedKeys_onceToken != -1) {
    dispatch_once(&_unsupervisedAllowedKeys_onceToken, &__block_literal_global_26);
  }
  uint64_t v2 = (void *)_unsupervisedAllowedKeys_dict;
  return v2;
}

void __49__MCRestrictionsPayload__unsupervisedAllowedKeys__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1C9E8];
  v1 = MCGetBaseResourcePath();
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"unsupervisedRestrictionPayloadKeys.plist"];
  uint64_t v3 = [v0 dictionaryWithContentsOfFile:v2];
  uint64_t v4 = (void *)_unsupervisedAllowedKeys_dict;
  _unsupervisedAllowedKeys_dict = v3;

  uint64_t v5 = +[MCRestrictionManager allowedGrandfatheredRestrictionPayloadKeysDictionary];
  if ([v5 count])
  {
    uint64_t v6 = [MEMORY[0x1E4F73168] sharedConfiguration];
    char v7 = [v6 isSupervised];

    if ((v7 & 1) == 0)
    {
      v8 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1A13F0000, v8, OS_LOG_TYPE_DEFAULT, "Applying deprecated restriction keys to allowed unsupervised keys...", v11, 2u);
      }
      uint64_t v9 = +[MCRestrictionManager addRestrictionPayloadKeysDictionary:v5 toRestrictionPayloadKeysDictionary:_unsupervisedAllowedKeys_dict];
      v10 = (void *)_unsupervisedAllowedKeys_dict;
      _unsupervisedAllowedKeys_dict = v9;
    }
  }
}

+ (id)_supervisedAllowedKeys
{
  if (_supervisedAllowedKeys_onceToken != -1) {
    dispatch_once(&_supervisedAllowedKeys_onceToken, &__block_literal_global_42);
  }
  uint64_t v2 = (void *)_supervisedAllowedKeys_dict;
  return v2;
}

void __47__MCRestrictionsPayload__supervisedAllowedKeys__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1C9E8];
  MCGetBaseResourcePath();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v1 = [v4 stringByAppendingPathComponent:@"supervisedRestrictionPayloadKeys.plist"];
  uint64_t v2 = [v0 dictionaryWithContentsOfFile:v1];
  uint64_t v3 = (void *)_supervisedAllowedKeys_dict;
  _supervisedAllowedKeys_dict = v2;
}

+ (id)allAllowedPlatformKeys
{
  if (allAllowedPlatformKeys_onceToken != -1) {
    dispatch_once(&allAllowedPlatformKeys_onceToken, &__block_literal_global_47_0);
  }
  uint64_t v2 = (void *)allAllowedPlatformKeys_dict;
  return v2;
}

void __47__MCRestrictionsPayload_allAllowedPlatformKeys__block_invoke()
{
  v0 = +[MCRestrictionsPayload _supervisedAllowedKeys];
  v1 = (void *)[v0 mutableCopy];

  id v3 = +[MCRestrictionsPayload _platformSpecificKeyFilter];
  [v1 MCFilterRestrictionPayloadKeys:v3];
  uint64_t v2 = (void *)allAllowedPlatformKeys_dict;
  allAllowedPlatformKeys_dict = (uint64_t)v1;
}

+ (id)userEnrollmentAllowedKeysFilter
{
  if (userEnrollmentAllowedKeysFilter_onceToken != -1) {
    dispatch_once(&userEnrollmentAllowedKeysFilter_onceToken, &__block_literal_global_50);
  }
  uint64_t v2 = (void *)userEnrollmentAllowedKeysFilter_dict;
  return v2;
}

void __56__MCRestrictionsPayload_userEnrollmentAllowedKeysFilter__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1C9E8];
  MCGetBaseResourcePath();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v1 = [v4 stringByAppendingPathComponent:@"UserEnrollmentRestrictionPayloadKeysFilter.plist"];
  uint64_t v2 = [v0 dictionaryWithContentsOfFile:v1];
  id v3 = (void *)userEnrollmentAllowedKeysFilter_dict;
  userEnrollmentAllowedKeysFilter_dict = v2;
}

+ (id)_platformSpecificKeyFilter
{
  if (MCGestaltIsAppleTV())
  {
    if (_AppleTVAllowedKeysFilter_onceToken != -1) {
      dispatch_once(&_AppleTVAllowedKeysFilter_onceToken, &__block_literal_global_746);
    }
    uint64_t v2 = &_AppleTVAllowedKeysFilter_dict;
  }
  else if (MCGestaltIsWatch())
  {
    if (_WatchAllowedKeysFilter_onceToken != -1) {
      dispatch_once(&_WatchAllowedKeysFilter_onceToken, &__block_literal_global_751);
    }
    uint64_t v2 = &_WatchAllowedKeysFilter_dict;
  }
  else if (MCGestaltIsVisionDevice())
  {
    if (_VisionProAllowedKeysFilter_onceToken != -1) {
      dispatch_once(&_VisionProAllowedKeysFilter_onceToken, &__block_literal_global_756);
    }
    uint64_t v2 = &_VisionProAllowedKeysFilter_dict;
  }
  else if ([MEMORY[0x1E4F5E7A8] isSharediPad])
  {
    if (_ephemeralMultiUserAllowedKeysFilter_onceToken != -1) {
      dispatch_once(&_ephemeralMultiUserAllowedKeysFilter_onceToken, &__block_literal_global_761);
    }
    uint64_t v2 = &_ephemeralMultiUserAllowedKeysFilter_dict;
  }
  else
  {
    if (_singleUserAllowedKeysFilter_onceToken != -1) {
      dispatch_once(&_singleUserAllowedKeysFilter_onceToken, &__block_literal_global_766);
    }
    uint64_t v2 = &_singleUserAllowedKeysFilter_dict;
  }
  id v3 = (void *)*v2;
  return v3;
}

- (id)_invalidFieldErrorWithFieldName:(id)a3
{
  v8 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = MCErrorArray(@"ERROR_PROFILE_FIELD_INVALID_P_FIELD", (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, a3);
  v10 = [v8 MCErrorWithDomain:@"MCProfileErrorDomain" code:1003 descriptionArray:v9 errorType:@"MCFatalError"];

  return v10;
}

- (MCRestrictionsPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v242 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v223.receiver = self;
  v223.super_class = (Class)MCRestrictionsPayload;
  v190 = [(MCPayload *)&v223 initWithDictionary:v8 profile:v9 outError:a5];
  if (!v190)
  {
    v190 = 0;
    goto LABEL_134;
  }
  v162 = a5;
  v169 = v9;
  v10 = +[MCRestrictionManager sharedManager];
  v11 = [v10 defaultRestrictions];

  v186 = [v11 objectForKeyedSubscript:@"restrictedBool"];
  v166 = v11;
  v184 = [v11 objectForKeyedSubscript:@"restrictedValue"];
  v12 = [MEMORY[0x1E4F73168] sharedConfiguration];
  if ([v12 isSupervised])
  {
  }
  else
  {
    v13 = [(MCPayload *)v190 profile];
    int v14 = [v13 isStub];

    if (!v14)
    {
      buf[0] = 0;
      v68 = objc_opt_class();
      v69 = [v169 signerCertificates];
      [v68 evaluateTrustOfCertificateChain:v69 signatureVersion:0 outIsAllowedToInstallUnsupportedPayloads:0 outIsAllowedToWriteDefaults:0 outIsAllowedToInstallSupervisedRestrictionsOnUnsupervisedDevices:buf];

      if (!buf[0])
      {
        v15 = +[MCRestrictionsPayload _unsupervisedAllowedKeys];
        goto LABEL_7;
      }
    }
  }
  v15 = +[MCRestrictionsPayload _supervisedAllowedKeys];
LABEL_7:
  v16 = v15;
  v17 = (void *)[v15 mutableCopy];

  v164 = +[MCRestrictionsPayload _platformSpecificKeyFilter];
  objc_msgSend(v17, "MCFilterRestrictionPayloadKeys:");
  v165 = v17;
  v18 = (void *)[v17 copy];
  v188 = [v18 objectForKeyedSubscript:@"restrictedBool"];
  v170 = [v18 objectForKeyedSubscript:@"restrictedValue"];
  v168 = [v18 objectForKeyedSubscript:@"intersection"];
  v163 = v18;
  v167 = [v18 objectForKeyedSubscript:@"union"];
  v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  restrictions = v190->_restrictions;
  v190->_restrictions = v19;

  uint64_t v21 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v22 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v23 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v24 = [MEMORY[0x1E4F1CA60] dictionary];
  v185 = (void *)v21;
  [(NSMutableDictionary *)v190->_restrictions setObject:v21 forKeyedSubscript:@"restrictedBool"];
  v183 = (void *)v22;
  [(NSMutableDictionary *)v190->_restrictions setObject:v22 forKeyedSubscript:@"restrictedValue"];
  v178 = (void *)v23;
  [(NSMutableDictionary *)v190->_restrictions setObject:v23 forKeyedSubscript:@"intersection"];
  v171 = (void *)v24;
  [(NSMutableDictionary *)v190->_restrictions setObject:v24 forKeyedSubscript:@"union"];
  long long v221 = 0u;
  long long v222 = 0u;
  long long v219 = 0u;
  long long v220 = 0u;
  obuint64_t j = v188;
  uint64_t v25 = [obj countByEnumeratingWithState:&v219 objects:v241 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v220;
    while (2)
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v220 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = *(void *)(*((void *)&v219 + 1) + 8 * i);
        v30 = [v8 objectForKey:v29];
        if (v30)
        {
          if (objc_opt_respondsToSelector())
          {
            v31 = [v186 objectForKey:v29];
            id v32 = (id)[v31 MCMutableDeepCopy];

            if (!v32) {
              id v32 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            }
            [v32 setObject:v30 forKey:@"value"];
            [v185 setObject:v32 forKey:v29];
          }
          else
          {
            v33 = [(MCPayload *)v190 profile];
            int v34 = [v33 isStub];

            if (!v34)
            {
              v35 = [(MCRestrictionsPayload *)v190 _invalidFieldErrorWithFieldName:v29];

              if (v35) {
                goto LABEL_128;
              }
              goto LABEL_22;
            }
          }
        }
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v219 objects:v241 count:16];
      if (v26) {
        continue;
      }
      break;
    }
  }

LABEL_22:
  v189 = v8;
  long long v217 = 0u;
  long long v218 = 0u;
  long long v215 = 0u;
  long long v216 = 0u;
  id v36 = v170;
  uint64_t v37 = [v36 countByEnumeratingWithState:&v215 objects:v240 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v216;
    while (2)
    {
      for (uint64_t j = 0; j != v38; ++j)
      {
        if (*(void *)v216 != v39) {
          objc_enumerationMutation(v36);
        }
        uint64_t v41 = *(void *)(*((void *)&v215 + 1) + 8 * j);
        v42 = [v8 objectForKey:v41];
        if (v42)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v43 = [v184 objectForKey:v41];
            id v44 = (id)[v43 MCMutableDeepCopy];

            if (!v44) {
              id v44 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            }
            [v44 setObject:v42 forKey:@"value"];
            [v183 setObject:v44 forKey:v41];
          }
          else
          {
            v45 = [(MCPayload *)v190 profile];
            int v46 = [v45 isStub];

            if (!v46)
            {
              v35 = [(MCRestrictionsPayload *)v190 _invalidFieldErrorWithFieldName:v41];

              if (v35) {
                goto LABEL_128;
              }
              goto LABEL_37;
            }
          }
        }
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v215 objects:v240 count:16];
      if (v38) {
        continue;
      }
      break;
    }
  }

LABEL_37:
  long long v213 = 0u;
  long long v214 = 0u;
  long long v211 = 0u;
  long long v212 = 0u;
  id v179 = v168;
  uint64_t v47 = [v179 countByEnumeratingWithState:&v211 objects:v239 count:16];
  if (!v47)
  {
LABEL_62:

    goto LABEL_66;
  }
  uint64_t v48 = v47;
  id v49 = *(id *)v212;
  id v172 = *(id *)v212;
LABEL_39:
  uint64_t v50 = 0;
  id v174 = (id)v48;
  while (1)
  {
    if (*(id *)v212 != v49) {
      objc_enumerationMutation(v179);
    }
    uint64_t v51 = *(void *)(*((void *)&v211 + 1) + 8 * v50);
    v52 = [v8 objectForKeyedSubscript:v51];
    if (v52)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v209 = 0u;
        long long v210 = 0u;
        long long v207 = 0u;
        long long v208 = 0u;
        id v53 = v52;
        uint64_t v54 = [v53 countByEnumeratingWithState:&v207 objects:v238 count:16];
        if (v54)
        {
          uint64_t v55 = v54;
          uint64_t v56 = *(void *)v208;
LABEL_46:
          uint64_t v57 = 0;
          while (1)
          {
            if (*(void *)v208 != v56) {
              objc_enumerationMutation(v53);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              break;
            }
            if (v55 == ++v57)
            {
              uint64_t v55 = [v53 countByEnumeratingWithState:&v207 objects:v238 count:16];
              if (v55) {
                goto LABEL_46;
              }
              goto LABEL_52;
            }
          }
          v35 = [(MCRestrictionsPayload *)v190 _invalidFieldErrorWithFieldName:v51];

          if (!v35) {
            goto LABEL_56;
          }

          goto LABEL_128;
        }
LABEL_52:

LABEL_56:
        v60 = +[MCRestrictionUtilities intersectionFeatureForPayloadRestrictionKey:v51];
        v61 = [v178 objectForKeyedSubscript:v60];
        if (v61)
        {
          id v62 = objc_alloc(MEMORY[0x1E4F1CA80]);
          v63 = [v61 objectForKeyedSubscript:@"values"];
          v64 = (void *)[v62 initWithArray:v63];

          v65 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v53];
          [v64 intersectSet:v65];
          v236 = @"values";
          v66 = [v64 allObjects];
          v237 = v66;
          v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v237 forKeys:&v236 count:1];
          [v178 setObject:v67 forKeyedSubscript:v60];

          id v8 = v189;
        }
        else
        {
          v234 = @"values";
          id v235 = v53;
          v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v235 forKeys:&v234 count:1];
          [v178 setObject:v64 forKeyedSubscript:v60];
        }
        uint64_t v48 = (uint64_t)v174;

        id v49 = v172;
        goto LABEL_60;
      }
      v58 = [(MCPayload *)v190 profile];
      int v59 = [v58 isStub];

      if (!v59) {
        break;
      }
    }
LABEL_60:

    if (++v50 == v48)
    {
      uint64_t v48 = [v179 countByEnumeratingWithState:&v211 objects:v239 count:16];
      if (v48) {
        goto LABEL_39;
      }
      goto LABEL_62;
    }
  }
  v35 = [(MCRestrictionsPayload *)v190 _invalidFieldErrorWithFieldName:v51];

  if (v35) {
    goto LABEL_128;
  }
LABEL_66:
  long long v205 = 0u;
  long long v206 = 0u;
  long long v203 = 0u;
  long long v204 = 0u;
  id v180 = v167;
  uint64_t v70 = [v180 countByEnumeratingWithState:&v203 objects:v233 count:16];
  if (v70)
  {
    uint64_t v71 = v70;
    id v72 = *(id *)v204;
    id v175 = *(id *)v204;
    while (2)
    {
      for (uint64_t k = 0; k != v71; ++k)
      {
        if (*(id *)v204 != v72) {
          objc_enumerationMutation(v180);
        }
        uint64_t v74 = *(void *)(*((void *)&v203 + 1) + 8 * k);
        v75 = [v189 objectForKeyedSubscript:v74];
        if (v75)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v201 = 0u;
            long long v202 = 0u;
            long long v199 = 0u;
            long long v200 = 0u;
            id v76 = v75;
            uint64_t v77 = [v76 countByEnumeratingWithState:&v199 objects:v232 count:16];
            if (v77)
            {
              uint64_t v78 = v77;
              uint64_t v79 = *(void *)v200;
LABEL_75:
              uint64_t v80 = 0;
              while (1)
              {
                if (*(void *)v200 != v79) {
                  objc_enumerationMutation(v76);
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  break;
                }
                if (v78 == ++v80)
                {
                  uint64_t v78 = [v76 countByEnumeratingWithState:&v199 objects:v232 count:16];
                  if (v78) {
                    goto LABEL_75;
                  }
                  goto LABEL_81;
                }
              }
              v35 = [(MCRestrictionsPayload *)v190 _invalidFieldErrorWithFieldName:v74];

              if (v35) {
                goto LABEL_91;
              }
            }
            else
            {
LABEL_81:
            }
            v230 = @"values";
            id v231 = v76;
            v83 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v231 forKeys:&v230 count:1];
            [v171 setObject:v83 forKeyedSubscript:v74];

            id v72 = v175;
          }
          else
          {
            v81 = [(MCPayload *)v190 profile];
            char v82 = [v81 isStub];

            if ((v82 & 1) == 0)
            {
              v35 = [(MCRestrictionsPayload *)v190 _invalidFieldErrorWithFieldName:v74];
LABEL_91:

              goto LABEL_92;
            }
          }
        }
      }
      uint64_t v71 = [v180 countByEnumeratingWithState:&v203 objects:v233 count:16];
      if (v71) {
        continue;
      }
      break;
    }
    v35 = 0;
LABEL_92:
    id v8 = v189;
  }
  else
  {
    v35 = 0;
  }

  if (([v169 isStub] & 1) == 0)
  {
    +[MCRestrictionManager unionValuesForFeature:withRestrictionsDictionary:](MCRestrictionManager, "unionValuesForFeature:withRestrictionsDictionary:");
    long long v195 = 0u;
    long long v196 = 0u;
    long long v197 = 0u;
    long long v198 = 0u;
    id v84 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v85 = [v84 countByEnumeratingWithState:&v195 objects:v229 count:16];
    if (v85)
    {
      uint64_t v86 = v85;
      uint64_t v87 = *(void *)v196;
      id v181 = (id)*MEMORY[0x1E4F22348];
      id v176 = v84;
      while (2)
      {
        for (uint64_t m = 0; m != v86; ++m)
        {
          if (*(void *)v196 != v87) {
            objc_enumerationMutation(v176);
          }
          v89 = *(void **)(*((void *)&v195 + 1) + 8 * m);
          v90 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v89];
          v91 = [v90 appTags];
          char v92 = [v91 containsObject:@"hidden"];

          v93 = [v90 bundleType];
          int v94 = [v93 isEqualToString:v181];

          v95 = [v90 appState];
          int v96 = [v95 isAlwaysAvailable];

          if (v96 && (v92 & 1) == 0 && !v94
            || (MCUnrestrictableApps(),
                v97 = objc_claimAutoreleasedReturnValue(),
                int v98 = [v97 containsObject:v89],
                v97,
                v98))
          {
            id v134 = v89;

            id v84 = v176;
            v135 = (void *)MEMORY[0x1E4F28C58];
            v113 = MCErrorArray(@"ERROR_PROFILE_FIELD_INVALID_VALUE_P_FIELD_P_VALUE", v136, v137, v138, v139, v140, v141, v142, @"blacklistedAppBundleIDs");
            uint64_t v143 = [v135 MCErrorWithDomain:@"MCPayloadErrorDomain" code:2004 descriptionArray:v113 errorType:@"MCFatalError"];
            id v8 = v189;
            goto LABEL_126;
          }
        }
        id v84 = v176;
        uint64_t v86 = [v176 countByEnumeratingWithState:&v195 objects:v229 count:16];
        id v8 = v189;
        if (v86) {
          continue;
        }
        break;
      }
    }

    +[MCRestrictionManager unionValuesForFeature:withRestrictionsDictionary:](MCRestrictionManager, "unionValuesForFeature:withRestrictionsDictionary:");
    long long v191 = 0u;
    long long v192 = 0u;
    long long v193 = 0u;
    long long v194 = 0u;
    id v173 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v99 = [v173 countByEnumeratingWithState:&v191 objects:v228 count:16];
    if (v99)
    {
      uint64_t v100 = v99;
      uint64_t v101 = *(void *)v192;
      id v182 = (id)*MEMORY[0x1E4F22348];
      id v177 = v84;
      while (2)
      {
        for (uint64_t n = 0; n != v100; ++n)
        {
          if (*(void *)v192 != v101) {
            objc_enumerationMutation(v173);
          }
          v103 = *(void **)(*((void *)&v191 + 1) + 8 * n);
          v104 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v103];
          v105 = [v104 appTags];
          char v106 = [v105 containsObject:@"hidden"];

          v107 = [v104 bundleType];
          int v108 = [v107 isEqualToString:v182];

          v109 = [v104 appState];
          int v110 = [v109 isAlwaysAvailable];

          if (v110 && (v106 & 1) == 0 && !v108
            || (MCUnrestrictableApps(),
                v111 = objc_claimAutoreleasedReturnValue(),
                int v112 = [v111 containsObject:v103],
                v111,
                v112))
          {
            id v134 = v103;

            v113 = v173;
            v144 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v115 = MCErrorArray(@"ERROR_PROFILE_FIELD_INVALID_VALUE_P_FIELD_P_VALUE", v145, v146, v147, v148, v149, v150, v151, @"blockedAppBundleIDs");
            [v144 MCErrorWithDomain:@"MCPayloadErrorDomain" code:2004 descriptionArray:v115 errorType:@"MCFatalError"];
            v35 = v123 = v35;
            id v8 = v189;
            id v84 = v177;
            goto LABEL_125;
          }
        }
        uint64_t v100 = [v173 countByEnumeratingWithState:&v191 objects:v228 count:16];
        id v8 = v189;
        id v84 = v177;
        if (v100) {
          continue;
        }
        break;
      }
    }
    v113 = v173;

    v114 = +[MCRestrictionManager intersectedValuesForFeature:@"appLockBundleIDs" withRestrictionsDictionary:v190->_restrictions];
    uint64_t v115 = (uint64_t)v114;
    if (v114 && ![v114 count])
    {
      v152 = (void *)MEMORY[0x1E4F28C58];
      v123 = MCErrorArray(@"ERROR_PROFILE_FIELD_INVALID_VALUE_P_FIELD", v116, v117, v118, v119, v120, v121, v122, @"allowListedAppBundleIDs");
      uint64_t v133 = [v152 MCErrorWithDomain:@"MCPayloadErrorDomain" code:2004 descriptionArray:v123 errorType:@"MCFatalError"];
LABEL_124:

      id v134 = 0;
      v35 = (void *)v133;
    }
    else
    {
      v123 = +[MCRestrictionManager intersectedValuesForFeature:@"allowedExternalIntelligenceWorkspaceIDs" withRestrictionsDictionary:v190->_restrictions];
      if ((unint64_t)[v123 count] >= 2)
      {
        v131 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v132 = MCErrorArray(@"ERROR_PROFILE_FIELD_TOO_MANY_VALUES_P_FIELD", v124, v125, v126, v127, v128, v129, v130, @"allowedExternalIntelligenceWorkspaceIDs");
        uint64_t v133 = [v131 MCErrorWithDomain:@"MCRestrictionsErrorDomain" code:3005 descriptionArray:v132 errorType:@"MCFatalError"];

        v35 = (void *)v132;
        goto LABEL_124;
      }
      id v134 = 0;
    }
LABEL_125:
    uint64_t v143 = (uint64_t)v35;

    v35 = (void *)v115;
LABEL_126:

    v35 = (void *)v143;
  }
  if (v35)
  {
LABEL_128:
    v153 = [(MCPayload *)v190 malformedPayloadErrorWithError:v35];
    v154 = v153;
    if (v162) {
      id *v162 = v153;
    }
    v155 = (void *)_MCLogObjects;
    v156 = v166;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v157 = v155;
      v158 = objc_opt_class();
      id v159 = v158;
      v160 = [v154 MCVerboseDescription];
      *(_DWORD *)buf = 138543618;
      v225 = v158;
      __int16 v226 = 2114;
      v227 = v160;
      _os_log_impl(&dword_1A13F0000, v157, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
    }
    v190 = 0;
  }
  else
  {
    v156 = v166;
  }

  id v9 = v169;
LABEL_134:

  return v190;
}

- (id)stubDictionary
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  v57.receiver = self;
  v57.super_class = (Class)MCRestrictionsPayload;
  uint64_t v3 = [(MCPayload *)&v57 stubDictionary];
  uint64_t v39 = self;
  [(NSMutableDictionary *)self->_restrictions objectForKey:@"restrictedBool"];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v53 objects:v61 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v54 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v53 + 1) + 8 * i);
        id v9 = [obj objectForKey:v8];
        v10 = [v9 objectForKey:@"value"];
        uint64_t v11 = [v10 BOOLValue];

        v12 = [MEMORY[0x1E4F28ED0] numberWithBool:v11];
        [v3 setObject:v12 forKey:v8];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v53 objects:v61 count:16];
    }
    while (v5);
  }
  v13 = [(NSMutableDictionary *)v39->_restrictions objectForKey:@"restrictedValue"];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v49 objects:v60 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v50;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v50 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v49 + 1) + 8 * j);
        v19 = [v13 objectForKey:v18];
        v20 = [v19 objectForKey:@"value"];

        [v3 setObject:v20 forKey:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v49 objects:v60 count:16];
    }
    while (v15);
  }
  uint64_t v21 = [(NSMutableDictionary *)v39->_restrictions objectForKeyedSubscript:@"intersection", v13];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v45 objects:v59 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v46;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v46 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v45 + 1) + 8 * k);
        uint64_t v27 = [v21 objectForKeyedSubscript:v26];
        v28 = [v27 objectForKeyedSubscript:@"values"];

        [v3 setObject:v28 forKeyedSubscript:v26];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v45 objects:v59 count:16];
    }
    while (v23);
  }
  uint64_t v29 = [(NSMutableDictionary *)v39->_restrictions objectForKeyedSubscript:@"union"];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v41 objects:v58 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v42;
    do
    {
      for (uint64_t m = 0; m != v31; ++m)
      {
        if (*(void *)v42 != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v34 = *(void *)(*((void *)&v41 + 1) + 8 * m);
        v35 = [v29 objectForKeyedSubscript:v34];
        id v36 = [v35 objectForKeyedSubscript:@"values"];

        [v3 setObject:v36 forKeyedSubscript:v34];
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v41 objects:v58 count:16];
    }
    while (v31);
  }

  return v3;
}

- (id)_restrictedFeatureStrings
{
  if (_restrictedFeatureStrings_once != -1) {
    dispatch_once(&_restrictedFeatureStrings_once, &__block_literal_global_83);
  }
  uint64_t v2 = (void *)_restrictedFeatureStrings_sStrings;
  return v2;
}

void __50__MCRestrictionsPayload__restrictedFeatureStrings__block_invoke()
{
  v159[147] = *MEMORY[0x1E4F143B8];
  v158[0] = @"allowExplicitContent";
  v157 = MCLocalizedString(@"EXPLICIT_CONTENT");
  v159[0] = v157;
  v158[1] = @"allowSafari";
  v156 = MCLocalizedString(@"SAFARI");
  v159[1] = v156;
  v158[2] = @"allowiTunes";
  v155 = MCLocalizedString(@"ITUNES");
  v159[2] = v155;
  v158[3] = @"allowAppInstallation";
  v154 = MCLocalizedString(@"APP_INSTALL");
  v159[3] = v154;
  v158[4] = @"allowUIAppInstallation";
  v153 = MCLocalizedString(@"UI_APP_INSTALL");
  v159[4] = v153;
  v158[5] = @"allowAppClips";
  v152 = MCLocalizedString(@"FEATURE_APP_CLIP");
  v159[5] = v152;
  v158[6] = @"allowAppRemoval";
  uint64_t v151 = MCLocalizedString(@"APP_REMOVAL");
  v159[6] = v151;
  v158[7] = @"allowSystemAppRemoval";
  uint64_t v150 = MCLocalizedString(@"SYSTEM_APP_REMOVAL");
  v159[7] = v150;
  v158[8] = @"allowCamera";
  uint64_t v149 = MCLocalizedString(@"CAMERA");
  v159[8] = v149;
  v158[9] = @"allowVideoConferencing";
  uint64_t v148 = MCLocalizedString(@"FACETIME");
  v159[9] = v148;
  v158[10] = @"allowScreenShot";
  uint64_t v147 = MCLocalizedString(@"SCREEN_SHOT");
  v159[10] = v147;
  v158[11] = @"allowRemoteScreenObservation";
  uint64_t v146 = MCLocalizedString(@"REMOTE_SCREEN_OBSERVATION");
  v159[11] = v146;
  v158[12] = @"allowVoiceDialing";
  uint64_t v145 = MCLocalizedString(@"VOICE_DIALING");
  v159[12] = v145;
  v158[13] = @"allowGlobalBackgroundFetchWhenRoaming";
  v144 = MCLocalizedString(@"ROAMING_FETCH");
  v159[13] = v144;
  v158[14] = @"allowMultiplayerGaming";
  uint64_t v143 = MCLocalizedString(@"MULTIPLAYER");
  v159[14] = v143;
  v158[15] = @"allowAddingGameCenterFriends";
  uint64_t v142 = MCLocalizedString(@"FEATURE_ADD_GC_FRIENDS");
  v159[15] = v142;
  v158[16] = @"allowCellularHDUploads";
  uint64_t v141 = MCLocalizedString(@"FEATURE_HD_VIDEO_OVER_3G");
  v159[16] = v141;
  v158[17] = @"allowAccountModification";
  uint64_t v140 = MCLocalizedString(@"FEATURE_ACCOUNT_MODIFICATION");
  v159[17] = v140;
  v158[18] = @"allowFindMyFriendsModification";
  uint64_t v139 = MCLocalizedString(@"FEATURE_FMF_MODIFICATION");
  v159[18] = v139;
  v158[19] = @"allowAssistant";
  uint64_t v138 = MCLocalizedString(@"FEATURE_ASSISTANT");
  v159[19] = v138;
  v158[20] = @"allowGameCenter";
  uint64_t v137 = MCLocalizedString(@"FEATURE_GAME_CENTER");
  v159[20] = v137;
  v158[21] = @"allowChat";
  uint64_t v136 = MCLocalizedString(@"FEATURE_CHAT");
  v159[21] = v136;
  v158[22] = @"allowRCSMessaging";
  v135 = MCLocalizedString(@"FEATURE_RCS_MESSAGING");
  v159[22] = v135;
  v158[23] = @"allowCloudBackup";
  id v134 = MCLocalizedString(@"FEATURE_CLOUD_BACKUP");
  v159[23] = v134;
  v158[24] = @"allowPhotoStream";
  uint64_t v133 = MCLocalizedString(@"FEATURE_PHOTO_STREAM");
  v159[24] = v133;
  v158[25] = @"allowCloudPhotoLibrary";
  uint64_t v132 = MCLocalizedString(@"FEATURE_CLOUD_PHOTO_LIBRARY");
  v159[25] = v132;
  v158[26] = @"allowDiagnosticSubmission";
  v131 = MCLocalizedString(@"FEATURE_DIAGNOSTIC_SUB");
  v159[26] = v131;
  v158[27] = @"allowDiagnosticSubmissionModification";
  uint64_t v130 = MCLocalizedString(@"FEATURE_DIAGNOSTIC_SUB_MODIFICATION");
  v159[27] = v130;
  v158[28] = @"allowSiriServerLogging";
  uint64_t v129 = MCLocalizedString(@"FEATURE_SIRI_SERVER_LOGGING");
  v159[28] = v129;
  v158[29] = @"allowUntrustedTLSPrompt";
  uint64_t v128 = MCLocalizedString(@"FEATURE_UNTRUSTED_TLS");
  v159[29] = v128;
  v158[30] = @"allowInAppPurchases";
  uint64_t v127 = MCLocalizedString(@"FEATURE_IN_APP_PURCHASE");
  v159[30] = v127;
  v158[31] = @"allowCloudDocumentSync";
  uint64_t v126 = MCLocalizedString(@"FEATURE_DOCUMENT_SYNC");
  v159[31] = v126;
  v158[32] = @"allowAssistantWhileLocked";
  uint64_t v125 = MCLocalizedString(@"FEATURE_ASSISTANT_WHILE_LOCKED");
  v159[32] = v125;
  v158[33] = @"safariAllowAutoFill";
  uint64_t v124 = MCLocalizedString(@"FEATURE_SAFARI_AUTO_FILL");
  v159[33] = v124;
  v158[34] = @"allowPasswordAutoFill";
  v123 = MCLocalizedString(@"FEATURE_PASSWORD_AUTO_FILL");
  v159[34] = v123;
  v158[35] = @"allowPasswordSharing";
  uint64_t v122 = MCLocalizedString(@"FEATURE_PASSWORD_SHARING");
  v159[35] = v122;
  v158[36] = @"allowPasswordProximityRequests";
  uint64_t v121 = MCLocalizedString(@"FEATURE_PASSWORD_PROXIMITY_REQUESTS");
  v159[36] = v121;
  v158[37] = @"allowDefaultBrowserModification";
  uint64_t v120 = MCLocalizedString(@"FEATURE_DEFAULT_BROWSER_MODIFICATION");
  v159[37] = v120;
  v158[38] = @"safariAllowJavaScript";
  uint64_t v119 = MCLocalizedString(@"FEATURE_SAFARI_JAVASCRIPT");
  v159[38] = v119;
  v158[39] = @"safariAllowPopups";
  uint64_t v118 = MCLocalizedString(@"FEATURE_SAFARI_POPUPS");
  v159[39] = v118;
  v158[40] = @"allowBookstore";
  uint64_t v117 = MCLocalizedString(@"FEATURE_BOOKSTORE");
  v159[40] = v117;
  v158[41] = @"allowBookstoreErotica";
  uint64_t v116 = MCLocalizedString(@"FEATURE_BOOKSTORE_EROTICA");
  v159[41] = v116;
  v158[42] = @"allowPassbookWhileLocked";
  uint64_t v115 = MCLocalizedString(@"FEATURE_PASSBOOK");
  v159[42] = v115;
  v158[43] = @"allowSharedStream";
  v114 = MCLocalizedString(@"FEATURE_SHARED_STREAM");
  v159[43] = v114;
  v158[44] = @"allowUIConfigurationProfileInstallation";
  v113 = MCLocalizedString(@"FEATURE_UI_INSTALLATION");
  v159[44] = v113;
  v158[45] = @"allowHostPairing";
  int v112 = MCLocalizedString(@"FEATURE_HOST_PAIRING");
  v159[45] = v112;
  v158[46] = @"allowEraseContentAndSettings";
  v111 = MCLocalizedString(@"FEATURE_ERASE_CONTENT_AND_SETTINGS");
  v159[46] = v111;
  v158[47] = @"allowHealth";
  int v110 = MCLocalizedString(@"FEATURE_HEALTH");
  v159[47] = v110;
  v158[48] = @"allowInstalledAppNearMeSuggestions";
  v109 = MCLocalizedString(@"FEATURE_INSTALLED_APP_NEAR_ME_SUGGESTIONS");
  v159[48] = v109;
  v158[49] = @"allowUninstalledAppNearMeSuggestions";
  int v108 = MCLocalizedString(@"FEATURE_UNINSTALLED_APP_NEAR_ME_SUGGESTIONS");
  v159[49] = v108;
  v158[50] = @"allowPodcasts";
  v107 = MCLocalizedString(@"FEATURE_PODCASTS");
  v159[50] = v107;
  v158[51] = @"allowFindMyDevice";
  char v106 = MCLocalizedString(@"FEATURE_FIND_MY_DEVICE");
  v159[51] = v106;
  v158[52] = @"allowFindMyFriends";
  v105 = MCLocalizedString(@"FEATURE_FIND_MY_FRIENDS");
  v159[52] = v105;
  v158[53] = @"allowHome";
  v104 = MCLocalizedString(@"FEATURE_HOME");
  v159[53] = v104;
  v158[54] = @"allowEnablingRestrictions";
  v103 = MCLocalizedString(@"FEATURE_ENABLING_RESTRICTIONS");
  v159[54] = v103;
  v158[55] = @"allowAppCellularDataModification";
  v102 = MCLocalizedString(@"FEATURE_APP_CELLULAR_MODIFY");
  v159[55] = v102;
  v158[56] = @"allowCellularPlanModification";
  uint64_t v101 = MCLocalizedString(@"FEATURE_CELLULAR_PLAN_MODIFY");
  v159[56] = v101;
  v158[57] = @"allowVoiceConferencing";
  uint64_t v100 = MCLocalizedString(@"FEATURE_AUDIO_CONFERENCE");
  v159[57] = v100;
  v158[58] = @"allowOpenFromManagedToUnmanaged";
  uint64_t v99 = MCLocalizedString(@"FEATURE_OPEN_IN_MANAGED_TO_UNMANAGED");
  v159[58] = v99;
  v158[59] = @"allowOpenFromUnmanagedToManaged";
  int v98 = MCLocalizedString(@"FEATURE_OPEN_IN_UNMANAGED_TO_MANAGED");
  v159[59] = v98;
  v158[60] = @"allowCloudKeychainSync";
  v97 = MCLocalizedString(@"FEATURE_KEYCHAIN_SYNC");
  v159[60] = v97;
  v158[61] = @"allowCloudPrivateRelay";
  int v96 = MCLocalizedString(@"FEATURE_CLOUD_PRIVATE_RELAY");
  v159[61] = v96;
  v158[62] = @"allowOTAPKIUpdates";
  v95 = MCLocalizedString(@"FEATURE_OTA_PKI_UPDATES");
  v159[62] = v95;
  v158[63] = @"allowAutomaticAppDownloads";
  int v94 = MCLocalizedString(@"FEATURE_AUTOMATIC_APP_DOWNLOADS");
  v159[63] = v94;
  v158[64] = @"allowLockScreenTodayView";
  v93 = MCLocalizedString(@"FEATURE_LOCKSCREEN_TODAY_VIEW");
  v159[64] = v93;
  v158[65] = @"allowLockScreenNotificationsView";
  char v92 = MCLocalizedString(@"FEATURE_LOCKSCREEN_NOTIFICATIONS");
  v159[65] = v92;
  v158[66] = @"allowLockScreenControlCenter";
  v91 = MCLocalizedString(@"FEATURE_LOCKSCREEN_CONTROL_CENTER");
  v159[66] = v91;
  v158[67] = @"allowAirDrop";
  v90 = MCLocalizedString(@"FEATURE_AIRDROP");
  v159[67] = v90;
  v158[68] = @"allowAirPrint";
  v89 = MCLocalizedString(@"FEATURE_AIRPRINT");
  v159[68] = v89;
  v158[69] = @"allowAirPrintiBeaconDiscovery";
  v88 = MCLocalizedString(@"FEATURE_AIRPRINT_IBEACON_DISCOVERY");
  v159[69] = v88;
  v158[70] = @"allowAirPrintCredentialsStorage";
  uint64_t v87 = MCLocalizedString(@"FEATURE_AIRPRINT_CREDENTIALS_STORAGE");
  v159[70] = v87;
  v158[71] = @"allowAssistantUserGeneratedContent";
  uint64_t v86 = MCLocalizedString(@"FEATURE_ASSISTANT_UNCURATED");
  v159[71] = v86;
  v158[72] = @"allowFingerprintModification";
  int HasOysterCapability = MCGestaltHasOysterCapability();
  if (HasOysterCapability)
  {
    uint64_t v0 = MCLocalizedString(@"FEATURE_OPTICDATA_MODIFICATION");
    uint64_t v83 = 0;
  }
  else if (MCGestaltHasPearlIDCapability())
  {
    uint64_t v0 = MCLocalizedString(@"FEATURE_FACEDATA_MODIFICATION");
    uint64_t v83 = 0x100000000;
  }
  else
  {
    uint64_t v0 = MCLocalizedString(@"FEATURE_FINGERPRINT_MODIFICATION");
    uint64_t v83 = 1;
  }
  v159[72] = v0;
  v158[73] = @"allowFingerprintForUnlock";
  int v82 = MCGestaltHasOysterCapability();
  if (v82)
  {
    uint64_t v1 = MCLocalizedString(@"FEATURE_OPTICDATA_UNLOCK");
    uint64_t v80 = 0;
  }
  else if (MCGestaltHasPearlIDCapability())
  {
    uint64_t v1 = MCLocalizedString(@"FEATURE_FACEDATA_UNLOCK");
    uint64_t v80 = 0x100000000;
  }
  else
  {
    uint64_t v1 = MCLocalizedString(@"FEATURE_FINGERPRINT_UNLOCK");
    uint64_t v80 = 1;
  }
  v159[73] = v1;
  v158[74] = @"allowFingerprintForContactlessPayment";
  int v79 = MCGestaltHasOysterCapability();
  id v84 = (void *)v0;
  v81 = (void *)v1;
  if (v79)
  {
    uint64_t v2 = MCLocalizedString(@"FEATURE_OPTICDATA_INAPP_PAYMENT");
    uint64_t v77 = 0;
  }
  else if (MCGestaltHasPearlIDCapability())
  {
    uint64_t v2 = MCLocalizedString(@"FEATURE_FACEDATA_INAPP_PAYMENT");
    uint64_t v77 = 0x100000000;
  }
  else
  {
    uint64_t v2 = MCLocalizedString(@"FEATURE_FINGERPRINT_INAPP_PAYMENT");
    uint64_t v77 = 1;
  }
  uint64_t v78 = (void *)v2;
  v159[74] = v2;
  v158[75] = @"allowAutoUnlock";
  id v76 = MCLocalizedString(@"FEATURE_AUTO_UNLOCK");
  v159[75] = v76;
  v158[76] = @"allowManagedAppsCloudSync";
  v75 = MCLocalizedString(@"FEATURE_MANAGED_APPS_CLOUD_SYNC");
  v159[76] = v75;
  v158[77] = @"allowGeotagSharing";
  uint64_t v74 = MCLocalizedString(@"FEATURE_GEOTAG_SHARING");
  v159[77] = v74;
  v158[78] = @"allowSpotlightInternetResults";
  v73 = MCLocalizedString(@"FEATURE_SPOTLIGHT_INTERNET_RESULTS");
  v159[78] = v73;
  v158[79] = @"allowActivityContinuation";
  id v72 = MCLocalizedString(@"FEATURE_ACTIVITY_CONTINUATION");
  v159[79] = v72;
  v158[80] = @"allowEnterpriseBookBackup";
  uint64_t v71 = MCLocalizedString(@"FEATURE_ENTERPRISE_BOOK_BACKUP");
  v159[80] = v71;
  v158[81] = @"allowEnterpriseBookMetadataSync";
  uint64_t v70 = MCLocalizedString(@"FEATURE_ENTERPRISE_BOOK_METADATA_SYNC");
  v159[81] = v70;
  v158[82] = @"allowPredictiveKeyboard";
  v69 = MCLocalizedString(@"FEATURE_PREDICTIVE_KEYBOARD");
  v159[82] = v69;
  v158[83] = @"allowContinuousPathKeyboard";
  v68 = MCLocalizedString(@"FEATURE_CONTINUOUS_PATH_KEYBOARD");
  v159[83] = v68;
  v158[84] = @"allowKeyboardShortcuts";
  v67 = MCLocalizedString(@"FEATURE_KEYBOARD_SHORTCUTS");
  v159[84] = v67;
  v158[85] = @"allowSpellCheck";
  v66 = MCLocalizedString(@"FEATURE_SPELL_CHECK");
  v159[85] = v66;
  v158[86] = @"allowAutoCorrection";
  v65 = MCLocalizedString(@"FEATURE_AUTOCORRECTION");
  v159[86] = v65;
  v158[87] = @"allowDefinitionLookup";
  v64 = MCLocalizedString(@"FEATURE_DEFINITION_LOOKUP");
  v159[87] = v64;
  v158[88] = @"allowSelectedTextSharing";
  v63 = MCLocalizedString(@"FEATURE_SELECTED_TEXT_SHARING");
  v159[88] = v63;
  v158[89] = @"allowPairedWatch";
  uint64_t v62 = MCLocalizedString(@"FEATURE_PAIRED_WATCH");
  v159[89] = v62;
  v158[90] = @"allowPasscodeModification";
  v61 = MCLocalizedString(@"FEATURE_PASSCODE_MODIFICATION");
  v159[90] = v61;
  v158[91] = @"allowDeviceNameModification";
  v60 = MCLocalizedString(@"FEATURE_DEVICE_NAME_MODIFICATION");
  v159[91] = v60;
  v158[92] = @"allowWallpaperModification";
  int v59 = MCLocalizedString(@"FEATURE_WALLPAPER_MODIFICATION");
  v159[92] = v59;
  v158[93] = @"allowEnterpriseAppTrust";
  v58 = MCLocalizedString(@"FEATURE_ENTERPRISE_APP_TRUST");
  v159[93] = v58;
  v158[94] = @"allowNews";
  objc_super v57 = MCLocalizedString(@"FEATURE_NEWS_APP");
  v159[94] = v57;
  v158[95] = @"allowMusicService";
  long long v56 = MCLocalizedString(@"FEATURE_MUSIC_SERVICE");
  v159[95] = v56;
  v158[96] = @"allowRadioService";
  long long v55 = MCLocalizedString(@"FEATURE_RADIO_SERVICE");
  v159[96] = v55;
  v158[97] = @"allowBluetoothModification";
  long long v54 = MCLocalizedString(@"FEATURE_BLUETOOTH_MODIFICATION");
  v159[97] = v54;
  v158[98] = @"allowPersonalHotspotModification";
  long long v53 = MCLocalizedString(@"FEATURE_PERSONALHOTSPOT_MODIFICATION");
  v159[98] = v53;
  v158[99] = @"allowNFC";
  long long v52 = MCLocalizedString(@"FEATURE_NFC_ALLOWED");
  v159[99] = v52;
  v158[100] = @"allowNotificationsModification";
  long long v51 = MCLocalizedString(@"FEATURE_NOTIFICATIONS_MODIFICATION");
  v159[100] = v51;
  v158[101] = @"allowTodayView";
  long long v50 = MCLocalizedString(@"FEATURE_TODAY_VIEW");
  v159[101] = v50;
  v158[102] = @"allowTodayViewModification";
  long long v49 = MCLocalizedString(@"FEATURE_TODAY_VIEW_MODIFICATION");
  v159[102] = v49;
  v158[103] = @"allowDictation";
  long long v48 = MCLocalizedString(@"FEATURE_DICTATION");
  v159[103] = v48;
  v158[104] = @"allowRemoteAppPairing";
  long long v47 = MCLocalizedString(@"FEATURE_REMOTE_APP_PAIRING");
  v159[104] = v47;
  v158[105] = @"allowAirPlayIncomingRequests";
  long long v46 = MCLocalizedString(@"FEATURE_AIRPLAY_INCOMING_REQUESTS_ALLOWED");
  v159[105] = v46;
  v158[106] = @"allowVPNCreation";
  long long v45 = MCLocalizedString(@"FEATURE_VPN_CREATION");
  v159[106] = v45;
  v158[107] = @"allowDriverDoNotDisturbModifications";
  long long v44 = MCLocalizedString(@"FEATURE_DRIVER_DO_NOT_DISTURB_MODIFICATIONS");
  v159[107] = v44;
  v158[108] = @"allowProximitySetupToNewDevice";
  long long v43 = MCLocalizedString(@"FEATURE_PROXIMITY_SET_UP");
  v159[108] = v43;
  v158[109] = @"allowUSBRestrictedMode";
  long long v42 = MCLocalizedString(@"FEATURE_USB_RESTRICTED_MODE");
  v159[109] = v42;
  v158[110] = @"allowESIMModification";
  long long v41 = MCLocalizedString(@"FEATURE_ESIM_MODIFICATION");
  v159[110] = v41;
  v158[111] = @"allowFilesUSBDriveAccess";
  v40 = MCLocalizedString(@"FEATURE_USB_DRIVE_ACCESS_IN_FILES");
  v159[111] = v40;
  v158[112] = @"allowUSBDriveAccess";
  uint64_t v39 = MCLocalizedString(@"FEATURE_USB_DRIVE_ACCESS");
  v159[112] = v39;
  v158[113] = @"allowFilesNetworkDriveAccess";
  uint64_t v38 = MCLocalizedString(@"FEATURE_NETWORK_DRIVE_ACCESS_IN_FILES");
  v159[113] = v38;
  v158[114] = @"allowDeviceSleep";
  uint64_t v37 = MCLocalizedString(@"FEATURE_DEVICE_SLEEP");
  v159[114] = v37;
  v158[115] = @"allowAutomaticScreenSaver";
  id v36 = MCLocalizedString(@"FEATURE_AUTOMATIC_SCREEN_SAVER");
  v159[115] = v36;
  v158[116] = @"allowSharedDeviceTemporarySession";
  v35 = MCLocalizedString(@"FEATURE_SHARED_DEVICE_TEMPORARY_SESSION");
  v159[116] = v35;
  v158[117] = @"allowApplePersonalizedAdvertising";
  uint64_t v34 = MCLocalizedString(@"FEATURE_APPLE_PERSONALIZED_ADVERTISING");
  v159[117] = v34;
  v158[118] = @"allowMailPrivacyProtection";
  v33 = MCLocalizedString(@"FEATURE_MAIL_PRIVACY_PROTECTION");
  v159[118] = v33;
  v158[119] = @"allowRapidSecurityResponseInstallation";
  uint64_t v32 = MCLocalizedString(@"FEATURE_RAPID_SECURITY_RESPONSE_INSTALLATION");
  v159[119] = v32;
  v158[120] = @"allowRapidSecurityResponseRemoval";
  uint64_t v31 = MCLocalizedString(@"FEATURE_RAPID_SECURITY_RESPONSE_REMOVAL");
  v159[120] = v31;
  v158[121] = @"allowiPhoneWidgetsOnMac";
  uint64_t v30 = MCLocalizedString(@"FEATURE_IPHONE_WIDGETS_ON_MAC");
  v159[121] = v30;
  v158[122] = @"allowAppsToBeHidden";
  uint64_t v29 = MCLocalizedString(@"FEATURE_HIDDEN_APPS");
  v159[122] = v29;
  v158[123] = @"allowAppsToBeLocked";
  v28 = MCLocalizedString(@"FEATURE_LOCKED_APPS");
  v159[123] = v28;
  v158[124] = @"allowLiveVoicemail";
  uint64_t v27 = MCLocalizedString(@"FEATURE_LIVE_VOICEMAIL");
  v159[124] = v27;
  v158[125] = @"allowCallRecording";
  uint64_t v26 = MCLocalizedString(@"FEATURE_CALL_RECORDING");
  v159[125] = v26;
  v158[126] = @"allowMarketplaceAppInstallation";
  uint64_t v25 = MCLocalizedString(@"FEATURE_MARKETPLACE_APP_INSTALLATION");
  v159[126] = v25;
  v158[127] = @"allowWebDistributionAppInstallation";
  uint64_t v24 = MCLocalizedString(@"FEATURE_WEB_APP_INSTALLATION");
  v159[127] = v24;
  v158[128] = @"allowAutoDim";
  uint64_t v23 = MCLocalizedString(@"FEATURE_AUTO_DIM");
  v159[128] = v23;
  v158[129] = @"allowESIMOutgoingTransfers";
  uint64_t v22 = MCLocalizedString(@"FEATURE_ESIM_OUTGOING_TRANSFER");
  v159[129] = v22;
  v158[130] = @"allowExternalIntelligenceIntegrations";
  uint64_t v21 = MCLocalizedString(@"FEATURE_EXTERNAL_INTELLIGENCE");
  v159[130] = v21;
  v158[131] = @"allowExternalIntelligenceIntegrationsSignIn";
  v20 = MCLocalizedString(@"FEATURE_EXTERNAL_INTELLIGENCE_SIGN_IN");
  v159[131] = v20;
  v158[132] = @"allowiPhoneMirroring";
  v19 = MCLocalizedString(@"FEATURE_IPHONE_MIRRORING");
  v159[132] = v19;
  v158[133] = @"allowPersonalizedHandwritingResults";
  uint64_t v18 = MCLocalizedString(@"FEATURE_PERSONALIZED_HANDWRITING");
  v159[133] = v18;
  v158[134] = @"allowGenmoji";
  v17 = MCLocalizedString(@"FEATURE_GENMOJI");
  v159[134] = v17;
  v158[135] = @"allowImagePlayground";
  uint64_t v16 = MCLocalizedString(@"FEATURE_IMAGE_PLAYGROUND");
  v159[135] = v16;
  v158[136] = @"allowImageWand";
  uint64_t v15 = MCLocalizedString(@"FEATURE_IMAGE_WAND");
  v159[136] = v15;
  v158[137] = @"allowiPhoneMirroring";
  uint64_t v3 = MCLocalizedString(@"FEATURE_FEATURE3");
  v159[137] = v3;
  v158[138] = @"allowVideoConferencingRemoteControl";
  uint64_t v4 = MCLocalizedString(@"FEATURE_VIDEO_CONFERENCING_REMOTE_CONTROL");
  v159[138] = v4;
  v158[139] = @"allowWritingTools";
  uint64_t v5 = MCLocalizedString(@"FEATURE_WRITING_TOOLS");
  v159[139] = v5;
  v158[140] = @"allowMailSummary";
  uint64_t v6 = MCLocalizedString(@"FEATURE_MAIL_SUMMARY");
  v159[140] = v6;
  v158[141] = @"allowMailSmartReplies";
  uint64_t v7 = MCLocalizedString(@"FEATURE_MAIL_SMART_REPLIES");
  v159[141] = v7;
  v158[142] = @"allowSafariSummary";
  uint64_t v8 = MCLocalizedString(@"FEATURE_SAFARI_SUMMARY");
  v159[142] = v8;
  v158[143] = @"allowNotesTranscription";
  id v9 = MCLocalizedString(@"FEATURE_NOTES_TRANSCRIPTION");
  v159[143] = v9;
  v158[144] = @"allowNotesTranscriptionSummary";
  v10 = MCLocalizedString(@"FEATURE_NOTES_TRANSCRIPTION_SUMMARY");
  v159[144] = v10;
  v158[145] = @"allowVisualIntelligenceSummary";
  uint64_t v11 = MCLocalizedString(@"FEATURE_VISUAL_INTELLIGENCE_SUMMARY");
  v159[145] = v11;
  v158[146] = @"allowSatelliteConnection";
  v12 = MCLocalizedString(@"FEATURE_SATELLITE_CONNECTION");
  v159[146] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v159 forKeys:v158 count:147];
  uint64_t v14 = (void *)_restrictedFeatureStrings_sStrings;
  _restrictedFeatureStrings_sStrings = v13;

  if (v77) {
  if (HIDWORD(v77))
  }

  if (v79) {
  if (v80)
  }

  if (HIDWORD(v80)) {
  if (v82)
  }

  if (v83) {
  if (HIDWORD(v83))
  }

  if (HasOysterCapability) {
}
  }

- (id)_enforcedFeatureStrings
{
  if (_enforcedFeatureStrings_onceToken != -1) {
    dispatch_once(&_enforcedFeatureStrings_onceToken, &__block_literal_global_544);
  }
  uint64_t v2 = (void *)_enforcedFeatureStrings_sStrings;
  return v2;
}

void __48__MCRestrictionsPayload__enforcedFeatureStrings__block_invoke()
{
  v38[32] = *MEMORY[0x1E4F143B8];
  v37[0] = @"forceITunesStorePasswordEntry";
  id v36 = MCLocalizedString(@"FEATURE_ENTER_ITUNES_PASSWORD");
  v38[0] = v36;
  v37[1] = @"forceFIPSVerification";
  v35 = MCLocalizedString(@"FEATURE_FIPS");
  v38[1] = v35;
  v37[2] = @"forceAssistantProfanityFilter";
  uint64_t v34 = MCLocalizedString(@"FEATURE_ASSISTANT_PROF_FILTER");
  v38[2] = v34;
  v37[3] = @"forceAuthenticationBeforeAutoFill";
  v33 = MCLocalizedString(@"FEATURE_AUTHENTICATE_BEFORE_AUTO_FILL");
  v38[3] = v33;
  v37[4] = @"forceEncryptedBackup";
  uint64_t v32 = MCLocalizedString(@"FEATURE_ENCRYPTED_BACKUPS");
  v38[4] = v32;
  v37[5] = @"safariForceFraudWarning";
  uint64_t v31 = MCLocalizedString(@"FEATURE_SAFARI_FRAUD_WARNING");
  v38[5] = v31;
  v37[6] = @"forceLimitAdTracking";
  uint64_t v30 = MCLocalizedString(@"FEATURE_FORCE_LIMIT_AD_TRACKING");
  v38[6] = v30;
  v37[7] = @"forceAirPlayOutgoingRequestsPairingPassword";
  uint64_t v29 = MCLocalizedString(@"FEATURE_AIRPLAY_OUTGOING_REQUESTS_PAIRING_PASSWORD");
  v38[7] = v29;
  v37[8] = @"forceAirPlayIncomingRequestsPairingPassword";
  v28 = MCLocalizedString(@"FEATURE_AIRPLAY_INCOMING_REQUESTS_PAIRING_PASSWORD");
  v38[8] = v28;
  v37[9] = @"forceWatchWristDetection";
  uint64_t v27 = MCLocalizedString(@"FEATURE_WATCH_WRIST_DETECT");
  v38[9] = v27;
  v37[10] = @"forceConferenceRoomDisplay";
  uint64_t v26 = MCLocalizedString(@"FEATURE_CONFERENCE_ROOM_MODE");
  v38[10] = v26;
  v37[11] = @"forceAirDropUnmanaged";
  uint64_t v25 = MCLocalizedString(@"FEATURE_AIRDROP_UNMANAGED");
  v38[11] = v25;
  v37[12] = @"forceDelayedSoftwareUpdates";
  uint64_t v24 = MCLocalizedString(@"FEATURE_DELAYED_SOFTWARE_UPDATES");
  v38[12] = v24;
  v37[13] = @"forceWiFiWhitelisting";
  uint64_t v23 = [@"FEATURE_WIFI_ALLOW_LIST" MCAppendGreenteaSuffix];
  uint64_t v22 = MCLocalizedString(v23);
  v38[13] = v22;
  v37[14] = @"forceWiFiToAllowedNetworksOnly";
  uint64_t v21 = [@"FEATURE_WIFI_ALLOWED_NETWORKS_ONLY" MCAppendGreenteaSuffix];
  v20 = MCLocalizedString(v21);
  v38[14] = v20;
  v37[15] = @"forceWiFiPowerOn";
  v19 = [@"FEATURE_WIFI_POWER_MODIFICATION" MCAppendGreenteaSuffix];
  uint64_t v18 = MCLocalizedString(v19);
  v38[15] = v18;
  v37[16] = @"forceAutomaticDateAndTime";
  v17 = MCLocalizedString(@"FEATURE_AUTOMATIC_DATE_TIME");
  v38[16] = v17;
  v37[17] = @"forceAirPrintTrustedTLSRequirement";
  uint64_t v16 = MCLocalizedString(@"FEATURE_AIRPRINT_TRUSTED_TLS_REQUIREMENT");
  v38[17] = v16;
  v37[18] = @"forceClassroomUnpromptedScreenObservation";
  uint64_t v15 = MCLocalizedString(@"FEATURE_CLASSROOM_UNPROMPTED_SCREEN_OBSERVATION");
  v38[18] = v15;
  v37[19] = @"forceUnpromptedManagedClassroomScreenObservation";
  uint64_t v14 = MCLocalizedString(@"FEATURE_CLASSROOM_UNPROMPTED_SCREEN_OBSERVATION");
  v38[19] = v14;
  v37[20] = @"forceClassroomAutomaticallyJoinClasses";
  uint64_t v13 = MCLocalizedString(@"FEATURE_CLASSROOM_AUTOMATICALLY_JOIN_CLASSES");
  v38[20] = v13;
  v37[21] = @"forceClassroomUnpromptedAppAndDeviceLock";
  v12 = MCLocalizedString(@"FEATURE_CLASSROOM_UNPROMPTED_APP_AND_DEVICE_LOCK");
  v38[21] = v12;
  v37[22] = @"forceClassroomRequestPermissionToLeaveClasses";
  uint64_t v0 = MCLocalizedString(@"FEATURE_CLASSROOM_REQUEST_PERMISSION_TO_LEAVE_CLASSES");
  v38[22] = v0;
  v37[23] = @"allowManagedToWriteUnmanagedContacts";
  uint64_t v1 = MCLocalizedString(@"FEATURE_MANAGED_WRITE_UNMANAGED_CONTACTS");
  v38[23] = v1;
  v37[24] = @"allowUnmanagedToReadManagedContacts";
  uint64_t v2 = MCLocalizedString(@"FEATURE_UNMANAGED_READ_MANAGED_CONTACTS");
  v38[24] = v2;
  v37[25] = @"requireManagedPasteboard";
  uint64_t v3 = MCLocalizedString(@"FEATURE_MANAGED_PASTEBOARD_REQUIRED");
  v38[25] = v3;
  v37[26] = @"allowDeprecatedWebKitTLS";
  uint64_t v4 = MCLocalizedString(@"FEATURE_WEBKIT_DEPRECATED_TLS");
  v38[26] = v4;
  v37[27] = @"allowDeprecatedWebKitSynchronousXHRLoads";
  uint64_t v5 = MCLocalizedString(@"FEATURE_WEBKIT_DEPRECATED_SYNCHRONOUSXHRLOADS");
  v38[27] = v5;
  v37[28] = @"allowUnpairedExternalBootToRecovery";
  uint64_t v6 = MCLocalizedString(@"FEATURE_UNPAIRED_EXTERNAL_BOOT_TO_RECOVERY");
  v38[28] = v6;
  v37[29] = @"forceOnDeviceOnlyDictation";
  uint64_t v7 = MCLocalizedStringByDevice(@"FEATURE_ON_DEVICE_ONLY_DICTATION");
  v38[29] = v7;
  v37[30] = @"forceOnDeviceOnlyTranslation";
  uint64_t v8 = MCLocalizedStringByDevice(@"FEATURE_ON_DEVICE_ONLY_TRANSLATION");
  v38[30] = v8;
  v37[31] = @"forcePreserveESIMOnErase";
  id v9 = MCLocalizedString(@"FEATURE_PRESERVE_ESIM_ON_ERASE");
  v38[31] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:32];
  uint64_t v11 = (void *)_enforcedFeatureStrings_sStrings;
  _enforcedFeatureStrings_sStrings = v10;
}

- (id)_intersectionStrings
{
  if (_intersectionStrings_onceToken != -1) {
    dispatch_once(&_intersectionStrings_onceToken, &__block_literal_global_639);
  }
  uint64_t v2 = (void *)_intersectionStrings_sStrings;
  return v2;
}

void __45__MCRestrictionsPayload__intersectionStrings__block_invoke()
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"autonomousSingleAppModePermittedAppIDs";
  uint64_t v0 = MCLocalizedString(@"FEATURE_AUTONOMOUS_SAM_ALLOW_LIST");
  v7[0] = v0;
  v6[1] = @"appLockBundleIDs";
  uint64_t v1 = MCLocalizedString(@"FEATURE_APP_ALLOW_LIST");
  v7[1] = v1;
  v6[2] = @"allowedExternalIntelligenceAccountDomains";
  uint64_t v2 = MCLocalizedString(@"FEATURE_EXTERNAL_INTELLIGENCE_DOMAIN_LIST");
  v7[2] = v2;
  v6[3] = @"allowedExternalIntelligenceWorkspaceIDs";
  uint64_t v3 = MCLocalizedString(@"FEATURE_EXTERNAL_INTELLIGENCE_WORKSPACE_IDS");
  v7[3] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
  uint64_t v5 = (void *)_intersectionStrings_sStrings;
  _intersectionStrings_sStrings = v4;
}

- (id)_unionStrings
{
  if (_unionStrings_onceToken != -1) {
    dispatch_once(&_unionStrings_onceToken, &__block_literal_global_653);
  }
  uint64_t v2 = (void *)_unionStrings_sStrings;
  return v2;
}

void __38__MCRestrictionsPayload__unionStrings__block_invoke()
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"blacklistedAppBundleIDs";
  uint64_t v0 = MCLocalizedString(@"FEATURE_PROHIBITED_APPS");
  v5[0] = v0;
  v4[1] = @"blockedAppBundleIDs";
  uint64_t v1 = MCLocalizedString(@"FEATURE_PROHIBITED_APPS");
  v5[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  uint64_t v3 = (void *)_unionStrings_sStrings;
  _unionStrings_sStrings = v2;
}

- (id)_defaultValueRestrictions
{
  v19[3] = *MEMORY[0x1E4F143B8];
  if (_defaultValueRestrictions_once != -1) {
    dispatch_once(&_defaultValueRestrictions_once, &__block_literal_global_667);
  }
  v18[0] = @"normalMax";
  uint64_t v2 = +[MCRestrictionManager maximumValueForSetting:@"enforcedSoftwareUpdateDelay"];
  v19[0] = v2;
  v18[1] = @"normalMin";
  uint64_t v3 = +[MCRestrictionManager minimumValueForSetting:@"enforcedSoftwareUpdateDelay"];
  v19[1] = v3;
  v18[2] = @"localizedString";
  uint64_t v4 = +[MCRestrictionManager sharedManager];
  uint64_t v5 = [v4 effectiveValueForSetting:@"enforcedSoftwareUpdateDelay"];
  uint64_t v6 = [v5 unsignedIntValue];
  uint64_t v14 = MCLocalizedFormat(@"FEATURE_SOFTWARE_UPDATE_DELAY", v7, v8, v9, v10, v11, v12, v13, v6);
  v19[2] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
  [(id)_defaultValueRestrictions_dict setObject:v15 forKeyedSubscript:@"enforcedSoftwareUpdateDelay"];

  uint64_t v16 = (void *)_defaultValueRestrictions_dict;
  return v16;
}

void __50__MCRestrictionsPayload__defaultValueRestrictions__block_invoke()
{
  v28[4] = *MEMORY[0x1E4F143B8];
  v27[0] = @"ratingMovies";
  v25[0] = @"normalMax";
  uint64_t v18 = +[MCRestrictionManager maximumValueForSetting:@"ratingMovies"];
  v26[0] = v18;
  v25[1] = @"normalMin";
  v17 = +[MCRestrictionManager minimumValueForSetting:@"ratingMovies"];
  v26[1] = v17;
  v25[2] = @"localizedString";
  uint64_t v16 = MCLocalizedString(@"MOVIE_RATING");
  v26[2] = v16;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];
  v28[0] = v15;
  v27[1] = @"ratingTVShows";
  v23[0] = @"normalMax";
  uint64_t v14 = +[MCRestrictionManager maximumValueForSetting:@"ratingTVShows"];
  v24[0] = v14;
  v23[1] = @"normalMin";
  uint64_t v13 = +[MCRestrictionManager minimumValueForSetting:@"ratingTVShows"];
  v24[1] = v13;
  v23[2] = @"localizedString";
  uint64_t v12 = MCLocalizedString(@"TV_SHOW_RATING");
  v24[2] = v12;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
  v28[1] = v0;
  v27[2] = @"ratingApps";
  v21[0] = @"normalMax";
  uint64_t v1 = +[MCRestrictionManager maximumValueForSetting:@"ratingApps"];
  v22[0] = v1;
  v21[1] = @"normalMin";
  uint64_t v2 = +[MCRestrictionManager minimumValueForSetting:@"ratingApps"];
  v22[1] = v2;
  v21[2] = @"localizedString";
  uint64_t v3 = MCLocalizedString(@"APP_RATING");
  v22[2] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
  v28[2] = v4;
  v27[3] = @"safariAcceptCookies";
  v19[0] = @"normalMax";
  uint64_t v5 = +[MCRestrictionManager maximumValueForSetting:@"safariAcceptCookies"];
  v20[0] = v5;
  v19[1] = @"normalMin";
  uint64_t v6 = +[MCRestrictionManager minimumValueForSetting:@"safariAcceptCookies"];
  v20[1] = v6;
  v19[2] = @"localizedString";
  uint64_t v7 = MCLocalizedString(@"FEATURE_SAFARI_ACCEPT_COOKIES");
  v20[2] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
  v28[3] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:4];
  uint64_t v10 = [v9 mutableCopy];
  uint64_t v11 = (void *)_defaultValueRestrictions_dict;
  _defaultValueRestrictions_dict = v10;
}

- (id)localizedRestrictionStrings
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  v75 = objc_opt_new();
  uint64_t v3 = self->_restrictions;
  uint64_t v4 = [MEMORY[0x1E4F73168] sharedConfiguration];
  char v5 = [v4 isSupervised];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v97 = "-[MCRestrictionsPayload localizedRestrictionStrings]";
      _os_log_impl(&dword_1A13F0000, v6, OS_LOG_TYPE_DEFAULT, "%s, Filter grandfathered restrictions", buf, 0xCu);
    }
    uint64_t v7 = +[MCRestrictionManager filterGrandfatheredRestrictionsIfNeededFromRestrictions:self->_restrictions];

    uint64_t v3 = (NSMutableDictionary *)v7;
  }
  uint64_t v8 = [(NSMutableDictionary *)v3 objectForKeyedSubscript:@"restrictedBool"];
  uint64_t v9 = (void *)[v8 mutableCopy];

  uint64_t v10 = [(NSMutableDictionary *)v3 objectForKeyedSubscript:@"restrictedValue"];
  uint64_t v11 = [(NSMutableDictionary *)v3 objectForKeyedSubscript:@"intersection"];
  v68 = v3;
  v73 = [(NSMutableDictionary *)v3 objectForKeyedSubscript:@"union"];
  uint64_t v12 = [v9 objectForKey:@"allowCamera"];
  uint64_t v13 = [v12 objectForKey:@"value"];

  if (v13 && ([v13 BOOLValue] & 1) == 0) {
    [v9 removeObjectForKey:@"allowVideoConferencing"];
  }
  uint64_t v14 = [v9 objectForKey:@"allowAppRemoval"];
  uint64_t v15 = [v14 objectForKey:@"value"];

  if (v15 && ([v15 BOOLValue] & 1) == 0) {
    [v9 removeObjectForKey:@"allowSystemAppRemoval"];
  }
  uint64_t v16 = [v9 objectForKey:@"allowAirPrint"];
  v17 = [v16 objectForKey:@"value"];

  id v72 = v17;
  if (v17 && ([v17 BOOLValue] & 1) == 0)
  {
    [v9 removeObjectForKey:@"forceAirPrintTrustedTLSRequirement"];
    [v9 removeObjectForKey:@"allowAirPrintiBeaconDiscovery"];
    [v9 removeObjectForKey:@"allowAirPrintCredentialsStorage"];
  }
  v67 = v13;
  if ((objc_msgSend(MEMORY[0x1E4F5E7A8], "isSharediPad", v15) & 1) == 0) {
    [v9 removeObjectForKey:@"allowSharedDeviceTemporarySession"];
  }
  uint64_t v70 = v10;
  uint64_t v71 = v9;
  v69 = v11;
  if ([v9 count])
  {
    uint64_t v18 = self;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    id v19 = v9;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v88 objects:v95 count:16];
    if (!v20) {
      goto LABEL_32;
    }
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v89;
    while (1)
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v89 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v88 + 1) + 8 * i);
        uint64_t v25 = [v19 objectForKey:v24];
        uint64_t v26 = [v25 objectForKey:@"value"];

        if (v26)
        {
          if ([v26 BOOLValue])
          {
            if (![v26 BOOLValue]) {
              goto LABEL_30;
            }
            uint64_t v27 = [(MCRestrictionsPayload *)v18 _enforcedFeatureStrings];
          }
          else
          {
            uint64_t v27 = [(MCRestrictionsPayload *)v18 _restrictedFeatureStrings];
          }
          v28 = v27;
          uint64_t v29 = [v27 objectForKey:v24];

          if (v29) {
            [v75 addObject:v29];
          }
        }
LABEL_30:
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v88 objects:v95 count:16];
      if (!v21)
      {
LABEL_32:

        self = v18;
        uint64_t v10 = v70;
        uint64_t v9 = v71;
        uint64_t v11 = v69;
        break;
      }
    }
  }
  if ([v10 count])
  {
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id v30 = v10;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v84 objects:v94 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v74 = *(void *)v85;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v85 != v74) {
            objc_enumerationMutation(v30);
          }
          uint64_t v34 = *(void *)(*((void *)&v84 + 1) + 8 * j);
          v35 = [(MCRestrictionsPayload *)self _defaultValueRestrictions];
          id v36 = [v35 objectForKey:v34];

          if (v36)
          {
            uint64_t v37 = self;
            uint64_t v38 = [v30 objectForKeyedSubscript:v34];
            uint64_t v39 = [v38 objectForKeyedSubscript:@"value"];
            v40 = [v38 objectForKeyedSubscript:@"preferSmallerValues"];
            if ([v40 BOOLValue]) {
              long long v41 = @"normalMax";
            }
            else {
              long long v41 = @"normalMin";
            }
            long long v42 = [v36 objectForKeyedSubscript:v41];
            if (v39)
            {
              uint64_t v43 = [v39 compare:v42];
              int v44 = [v40 BOOLValue];
              uint64_t v45 = -1;
              if (!v44) {
                uint64_t v45 = 1;
              }
              if (v43 == v45)
              {
                long long v46 = [v36 objectForKey:@"localizedString"];
                [v75 addObject:v46];
              }
            }

            self = v37;
          }
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v84 objects:v94 count:16];
      }
      while (v32);
    }

    uint64_t v10 = v70;
    uint64_t v9 = v71;
    uint64_t v11 = v69;
  }
  if ([v11 count])
  {
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id v47 = v11;
    uint64_t v48 = [v47 countByEnumeratingWithState:&v80 objects:v93 count:16];
    if (v48)
    {
      uint64_t v49 = v48;
      uint64_t v50 = *(void *)v81;
      do
      {
        for (uint64_t k = 0; k != v49; ++k)
        {
          if (*(void *)v81 != v50) {
            objc_enumerationMutation(v47);
          }
          uint64_t v52 = *(void *)(*((void *)&v80 + 1) + 8 * k);
          long long v53 = [(MCRestrictionsPayload *)self _intersectionStrings];
          long long v54 = [v53 objectForKeyedSubscript:v52];

          if (v54) {
            [v75 addObject:v54];
          }
        }
        uint64_t v49 = [v47 countByEnumeratingWithState:&v80 objects:v93 count:16];
      }
      while (v49);
    }
  }
  long long v55 = v73;
  if ([v73 count])
  {
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v56 = v73;
    uint64_t v57 = [v56 countByEnumeratingWithState:&v76 objects:v92 count:16];
    if (v57)
    {
      uint64_t v58 = v57;
      uint64_t v59 = *(void *)v77;
      do
      {
        for (uint64_t m = 0; m != v58; ++m)
        {
          if (*(void *)v77 != v59) {
            objc_enumerationMutation(v56);
          }
          uint64_t v61 = *(void *)(*((void *)&v76 + 1) + 8 * m);
          uint64_t v62 = [(MCRestrictionsPayload *)self _unionStrings];
          v63 = [v62 objectForKeyedSubscript:v61];

          if (v63) {
            [v75 addObject:v63];
          }
        }
        uint64_t v58 = [v56 countByEnumeratingWithState:&v76 objects:v92 count:16];
      }
      while (v58);
    }

    long long v55 = v73;
  }
  v64 = (void *)[v75 copy];

  return v64;
}

- (void)_insertRestrictedBoolForKey:(id)a3 value:(id)a4 preferenc:(BOOL)a5
{
  BOOL v5 = a5;
  v14[2] = *MEMORY[0x1E4F143B8];
  restrictions = self->_restrictions;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(NSMutableDictionary *)restrictions objectForKey:@"restrictedBool"];
  v13[0] = @"value";
  v13[1] = @"preference";
  v14[0] = v8;
  uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithBool:v5];
  v14[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  [v10 setObject:v12 forKeyedSubscript:v9];
}

- (id)installationWarnings
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = +[MCRestrictionManager sharedManager];
  int v5 = [v4 restrictedBoolForFeature:@"allowPhotoStream"];

  uint64_t v6 = [(MCRestrictionsPayload *)self restrictions];
  int v7 = +[MCRestrictionManager restrictedBoolForFeature:@"allowPhotoStream" withRestrictionsDictionary:v6];

  if (v5 != 2 && v7 == 2)
  {
    id v9 = MCPLPhotoLibraryClass();
    if (v9)
    {
      uint64_t v10 = [v9 sharedPhotoLibrary];
      [v10 photoStreamAlbums];
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = [v11 countByEnumeratingWithState:&v53 objects:v63 count:16];
      uint64_t v13 = v11;
      if (v12)
      {
        uint64_t v14 = v12;
        uint64_t v15 = *(void *)v54;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v54 != v15) {
              objc_enumerationMutation(v11);
            }
            if (![*(id *)(*((void *)&v53 + 1) + 8 * i) isEmpty])
            {

              uint64_t v13 = MCLocalizedString(@"INSTALL_WARNING_PHOTO_STREAM_RESTRICTION");
              v17 = MCLocalizedStringByDevice(@"INSTALL_WARNING_PHOTO_STREAM");
              uint64_t v18 = +[MCProfileWarning warningWithLocalizedTitle:v13 localizedBody:v17 isLongForm:0];
              [v3 addObject:v18];

              goto LABEL_17;
            }
          }
          uint64_t v14 = [v11 countByEnumeratingWithState:&v53 objects:v63 count:16];
          if (v14) {
            continue;
          }
          break;
        }
        uint64_t v13 = v11;
      }
LABEL_17:
    }
    else
    {
      id v19 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A13F0000, v19, OS_LOG_TYPE_DEBUG, "Cannot load PLPhotoLibrary class. Not creating Photo Stream warning.", buf, 2u);
      }
    }
  }
  uint64_t v20 = +[MCRestrictionManager sharedManager];
  int v21 = [v20 restrictedBoolForFeature:@"allowCloudPhotoLibrary"];

  uint64_t v22 = [(MCRestrictionsPayload *)self restrictions];
  int v23 = +[MCRestrictionManager restrictedBoolForFeature:@"allowCloudPhotoLibrary" withRestrictionsDictionary:v22];

  if (v21 != 2 && v23 == 2)
  {
    uint64_t v51 = 0;
    unint64_t v52 = 0;
    uint64_t v50 = 0;
    id v25 = MCPLManagedAssetClass();
    id v26 = MCPLPhotoLibraryClass();
    if (v25 && v26)
    {
      uint64_t v27 = [v26 sharedPhotoLibrary];
      [v25 countOfAssetsWithRequiredResourcesNotLocallyAvailableInLibrary:v27 outCount:&v52 photoCount:&v51 videoCount:&v50];

      v28 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218496;
        unint64_t v58 = v52;
        __int16 v59 = 2048;
        uint64_t v60 = v51;
        __int16 v61 = 2048;
        uint64_t v62 = v50;
        _os_log_impl(&dword_1A13F0000, v28, OS_LOG_TYPE_DEBUG, "Photo library non-local assets: count:%lu photo:%lu video:%lu]", buf, 0x20u);
      }
      if (v52 < 2)
      {
        if (v51 == 1)
        {
          uint64_t v38 = @"INSTALL_WARNING_CLOUD_PHOTO_LIBRARY_PHOTO_SINGULAR_DESTRUCTIVE";
        }
        else if (v50 == 1)
        {
          uint64_t v38 = @"INSTALL_WARNING_CLOUD_PHOTO_LIBRARY_VIDEO_SINGULAR_DESTRUCTIVE";
        }
        else
        {
          uint64_t v38 = @"INSTALL_WARNING_CLOUD_PHOTO_LIBRARY";
        }
        uint64_t v36 = MCLocalizedStringByDevice(v38);
      }
      else
      {
        uint64_t v36 = MCLocalizedFormatByDevice(@"INSTALL_WARNING_CLOUD_PHOTO_LIBRARY_PHOTOS_VIDEOS_DESTRUCTIVE", v29, v30, v31, v32, v33, v34, v35, v52);
      }
      uint64_t v39 = (void *)v36;
      v40 = MCLocalizedString(@"INSTALL_WARNING_CLOUD_PHOTO_LIBRARY_RESTRICTION");
      long long v41 = +[MCProfileWarning warningWithLocalizedTitle:v40 localizedBody:v39 isLongForm:0];
      [v3 addObject:v41];
    }
    else
    {
      uint64_t v37 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A13F0000, v37, OS_LOG_TYPE_DEBUG, "Cannot load PLManagedAssetClass or PLPhotoLibraryClass. Not creating Cloud Photo Library warning.", buf, 2u);
      }
    }
  }
  long long v42 = +[MCRestrictionManager sharedManager];
  int v43 = [v42 restrictedBoolForFeature:@"allowPairedWatch"];

  int v44 = [(MCRestrictionsPayload *)self restrictions];
  int v45 = +[MCRestrictionManager restrictedBoolForFeature:@"allowPairedWatch" withRestrictionsDictionary:v44];

  if (v43 != 2 && v45 == 2)
  {
    long long v46 = MCLocalizedString(@"INSTALL_WARNING_PAIRED_WATCH_RESTRICTION");
    id v47 = MCLocalizedStringByDevice(@"INSTALL_WARNING_PAIRED_WATCH");
    uint64_t v48 = +[MCProfileWarning warningWithLocalizedTitle:v46 localizedBody:v47 isLongForm:0];
    [v3 addObject:v48];
  }
  return v3;
}

- (id)filterForUserEnrollmentOutError:(id *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[MCRestrictionsPayload userEnrollmentAllowedKeysFilter];
  int v5 = [MEMORY[0x1E4F1CA48] array];
  restrictions = self->_restrictions;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __57__MCRestrictionsPayload_filterForUserEnrollmentOutError___block_invoke;
  uint64_t v16 = &unk_1E5A68028;
  id v7 = v4;
  id v17 = v7;
  id v8 = v5;
  id v18 = v8;
  [(NSMutableDictionary *)restrictions enumerateKeysAndObjectsUsingBlock:&v13];
  if (objc_msgSend(v8, "count", v13, v14, v15, v16))
  {
    [v8 sortUsingComparator:&__block_literal_global_716];
    id v9 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = v9;
      id v11 = [(MCPayload *)self friendlyName];
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v11;
      __int16 v21 = 2114;
      id v22 = v8;
      _os_log_impl(&dword_1A13F0000, v10, OS_LOG_TYPE_INFO, "Payload “%{public}@” has restrictions that we are ignoring. They are: %{public}@", buf, 0x16u);
    }
  }

  return 0;
}

void __57__MCRestrictionsPayload_filterForUserEnrollmentOutError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 count])
  {
    id v7 = (void *)MEMORY[0x1E4F1CAD0];
    id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
    id v9 = [v7 setWithArray:v8];

    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __57__MCRestrictionsPayload_filterForUserEnrollmentOutError___block_invoke_2;
    uint64_t v16 = &unk_1E5A68000;
    id v17 = v9;
    id v18 = v10;
    id v11 = v10;
    id v12 = v9;
    [v6 enumerateKeysAndObjectsUsingBlock:&v13];
    objc_msgSend(v6, "removeObjectsForKeys:", v11, v13, v14, v15, v16);
    [*(id *)(a1 + 40) addObjectsFromArray:v11];
  }
}

void __57__MCRestrictionsPayload_filterForUserEnrollmentOutError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

uint64_t __57__MCRestrictionsPayload_filterForUserEnrollmentOutError___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 compare:a3 options:1];
}

- (void).cxx_destruct
{
}

@end