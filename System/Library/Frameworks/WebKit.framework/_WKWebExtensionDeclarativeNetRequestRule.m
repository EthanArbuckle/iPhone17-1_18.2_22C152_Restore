@interface _WKWebExtensionDeclarativeNetRequestRule
- (NSArray)ruleInWebKitFormat;
- (NSDictionary)action;
- (NSDictionary)condition;
- (_WKWebExtensionDeclarativeNetRequestRule)initWithDictionary:(id)a3 errorString:(id *)a4;
- (id)_allChromeResourceTypes;
- (id)_chromeDomainTypeToWebKitDomainType;
- (id)_chromeResourceTypeToWebKitLoadContext;
- (id)_chromeResourceTypeToWebKitResourceType;
- (id)_convertedResourceTypesForChromeResourceTypes:(id)a3;
- (id)_convertedRulesForWebKitActionType:(id)a3 chromeActionType:(id)a4;
- (id)_regexURLFilterForChromeURLFilter:(id)a3;
- (id)_resourcesToTargetWhenNoneAreSpecifiedInRule;
- (id)_validateHeaderInfoDictionary:(id)a3;
- (id)_webKitRuleWithWebKitActionType:(id)a3 chromeActionType:(id)a4 chromeResourceTypes:(id)a5;
- (id)description;
- (int64_t)compare:(id)a3;
- (int64_t)priority;
- (int64_t)ruleID;
- (void)removeInvalidResourceTypesForKey:(id)a3;
@end

@implementation _WKWebExtensionDeclarativeNetRequestRule

- (_WKWebExtensionDeclarativeNetRequestRule)initWithDictionary:(id)a3 errorString:(id *)a4
{
  v178[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v149.receiver = self;
  v149.super_class = (Class)_WKWebExtensionDeclarativeNetRequestRule;
  v7 = [(_WKWebExtensionDeclarativeNetRequestRule *)&v149 init];

  if (!v7) {
    goto LABEL_15;
  }
  if ((_MergedGlobals_37 & 1) == 0)
  {
    v178[0] = @"id";
    v178[1] = @"action";
    v178[2] = @"condition";
    qword_1EB3589C8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v178 count:3];
    _MergedGlobals_37 = 1;
  }
  if ((byte_1EB3589B9 & 1) == 0)
  {
    v176[0] = @"id";
    v177[0] = objc_opt_class();
    v176[1] = @"priority";
    v177[1] = objc_opt_class();
    v176[2] = @"action";
    v177[2] = objc_opt_class();
    v176[3] = @"condition";
    v177[3] = objc_opt_class();
    qword_1EB3589D0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v177 forKeys:v176 count:4];
    byte_1EB3589B9 = 1;
  }
  v8 = WebKit::objectForKey<NSNumber>(v6, @"id");
  v7->_uint64_t ruleID = [v8 integerValue];

  if (v7->_ruleID)
  {
    id v148 = 0;
    BOOL v9 = WebKit::validateDictionary(v6, 0, (void *)qword_1EB3589C8, qword_1EB3589D0, &v148);
    id v10 = v148;
    if (!v9)
    {
      if (a4)
      {
        [NSString stringWithFormat:@"Rule with id %ld is invalid. %@", v7->_ruleID, v10];
        v16 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }
      goto LABEL_100;
    }
    v11 = WebKit::objectForKey<NSNumber>(v6, @"priority");
    v12 = v11;
    if (v11)
    {
      uint64_t v13 = [v11 integerValue];
      v7->_priority = v13;
      uint64_t ruleID = v7->_ruleID;
      if (ruleID >= 1)
      {
        if (v13 <= 0)
        {
          if (a4)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"Rule with id %ld is invalid. Rule priority must be non-negative.", v7->_ruleID);
            id v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:
            v16 = 0;
            *a4 = v15;
LABEL_99:

LABEL_100:
            goto LABEL_101;
          }
          goto LABEL_36;
        }
LABEL_20:
        uint64_t v17 = WebKit::objectForKey<NSDictionary>(v6, @"action", 1, 0);
        action = v7->_action;
        v7->_action = (NSDictionary *)v17;

        v175 = @"type";
        v124 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v175 count:1];
        v173[0] = @"type";
        v174[0] = objc_opt_class();
        v173[1] = @"redirect";
        v174[1] = objc_opt_class();
        v173[2] = @"requestHeaders";
        uint64_t v172 = objc_opt_class();
        uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v172 count:1];
        v174[2] = v19;
        v173[3] = @"responseHeaders";
        uint64_t v171 = objc_opt_class();
        v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v171 count:1];
        v174[3] = v20;
        v123 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v174 forKeys:v173 count:4];

        v21 = v7->_action;
        id v147 = v10;
        LOBYTE(v19) = WebKit::validateDictionary(v21, 0, v124, v123, &v147);
        id v22 = v147;

        id v10 = v22;
        if (v19)
        {
          if ((byte_1EB3589BA & 1) == 0)
          {
            v121 = (void *)MEMORY[0x1E4F1CAD0];
            v170[0] = @"allow";
            v170[1] = @"allowAllRequests";
            v170[2] = @"block";
            v170[3] = @"redirect";
            v170[4] = @"modifyHeaders";
            v170[5] = @"upgradeScheme";
            v100 = [MEMORY[0x1E4F1C978] arrayWithObjects:v170 count:6];
            qword_1EB3589D8 = [v121 setWithArray:v100];

            byte_1EB3589BA = 1;
          }
          uint64_t v23 = qword_1EB3589D8;
          v24 = [(NSDictionary *)v7->_action objectForKeyedSubscript:@"type"];
          LOBYTE(v23) = [(id)v23 containsObject:v24];

          if (v23)
          {
            uint64_t v25 = WebKit::objectForKey<NSDictionary>(v6, @"condition", 1, 0);
            condition = v7->_condition;
            v7->_condition = (NSDictionary *)v25;

            if ((byte_1EB3589BB & 1) == 0)
            {
              v168[0] = @"domainType";
              v169[0] = objc_opt_class();
              v168[1] = @"domains";
              uint64_t v167 = objc_opt_class();
              v122 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v167 count:1];
              v169[1] = v122;
              v168[2] = @"requestDomains";
              uint64_t v166 = objc_opt_class();
              id objc = [MEMORY[0x1E4F1C978] arrayWithObjects:&v166 count:1];
              v169[2] = objc;
              v168[3] = @"excludedDomains";
              uint64_t v165 = objc_opt_class();
              v115 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v165 count:1];
              v169[3] = v115;
              v168[4] = @"excludedRequestDomains";
              uint64_t v164 = objc_opt_class();
              v113 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v164 count:1];
              v169[4] = v113;
              v168[5] = @"isUrlFilterCaseSensitive";
              v169[5] = objc_opt_class();
              v168[6] = @"regexFilter";
              v169[6] = objc_opt_class();
              v168[7] = @"resourceTypes";
              uint64_t v163 = objc_opt_class();
              v101 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v163 count:1];
              v169[7] = v101;
              v168[8] = @"urlFilter";
              v169[8] = objc_opt_class();
              qword_1EB3589E0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v169 forKeys:v168 count:9];

              byte_1EB3589BB = 1;
            }
            v27 = v7->_condition;
            id v146 = v10;
            BOOL v28 = WebKit::validateDictionary(v27, 0, MEMORY[0x1E4F1CBF0], (void *)qword_1EB3589E0, &v146);
            id v120 = v146;

            if (!v28)
            {
              if (a4)
              {
                id v32 = [NSString stringWithFormat:@"Rule with id %ld is invalid. %@", v7->_ruleID, v120];
                goto LABEL_42;
              }
LABEL_96:
              v16 = 0;
              goto LABEL_97;
            }
            v29 = [(NSDictionary *)v7->_condition objectForKeyedSubscript:@"regexFilter"];
            if (v29)
            {
              v30 = [(NSDictionary *)v7->_condition objectForKeyedSubscript:@"urlFilter"];
              BOOL v31 = v30 == 0;

              if (!v31)
              {
                if (a4)
                {
                  id v32 = (id)objc_claimAutoreleasedReturnValue();
LABEL_42:
                  v16 = 0;
                  *a4 = v32;
LABEL_97:
                  id v10 = v120;
                  goto LABEL_98;
                }
                goto LABEL_96;
              }
            }
            v36 = [(NSDictionary *)v7->_condition objectForKeyedSubscript:@"regexFilter"];
            v37 = v36;
            if (!v36)
            {
LABEL_46:

              v38 = [(NSDictionary *)v7->_condition objectForKeyedSubscript:@"urlFilter"];
              v39 = v38;
              if (v38 && ([v38 canBeConvertedToEncoding:1] & 1) == 0)
              {
                if (a4)
                {
                  *a4 = (id)objc_claimAutoreleasedReturnValue();
                }

                goto LABEL_96;
              }

              v40 = [(NSDictionary *)v7->_condition objectForKeyedSubscript:@"resourceTypes"];
              if (v40)
              {
                v41 = [(NSDictionary *)v7->_condition objectForKeyedSubscript:@"excludedResourceTypes"];
                BOOL v42 = v41 == 0;

                if (!v42)
                {
                  if (a4)
                  {
                    id v32 = (id)objc_claimAutoreleasedReturnValue();
                    goto LABEL_42;
                  }
                  goto LABEL_96;
                }
              }
              v44 = [(NSDictionary *)v7->_condition objectForKeyedSubscript:@"resourceTypes"];
              v45 = v44;
              v114 = v44;
              if (v44)
              {
                if (![v44 count])
                {
                  if (a4)
                  {
                    id v66 = (id)objc_claimAutoreleasedReturnValue();
LABEL_106:
                    v16 = 0;
                    *a4 = v66;
LABEL_175:
                    v45 = v114;
                    goto LABEL_176;
                  }
LABEL_107:
                  v16 = 0;
LABEL_176:

                  goto LABEL_97;
                }
                [(_WKWebExtensionDeclarativeNetRequestRule *)v7 removeInvalidResourceTypesForKey:@"resourceTypes"];
              }
              v46 = [(NSDictionary *)v7->_condition objectForKeyedSubscript:@"excludedResourceTypes"];
              if (v46) {
                [(_WKWebExtensionDeclarativeNetRequestRule *)v7 removeInvalidResourceTypesForKey:@"resourceTypes"];
              }

              v47 = [(NSDictionary *)v7->_action objectForKeyedSubscript:@"type"];
              int v48 = [v47 isEqualToString:@"allowAllRequests"];

              if (!v48) {
                goto LABEL_71;
              }
              v45 = v114;
              if (v114)
              {
                long long v144 = 0u;
                long long v145 = 0u;
                long long v142 = 0u;
                long long v143 = 0u;
                obuint64_t j = v114;
                uint64_t v49 = [obj countByEnumeratingWithState:&v142 objects:v162 count:16];
                if (v49)
                {
                  uint64_t v50 = *(void *)v143;
                  while (2)
                  {
                    for (uint64_t i = 0; i != v49; ++i)
                    {
                      if (*(void *)v143 != v50) {
                        objc_enumerationMutation(obj);
                      }
                      v52 = *(void **)(*((void *)&v142 + 1) + 8 * i);
                      if (([v52 isEqualToString:@"main_frame"] & 1) == 0
                        && ([v52 isEqualToString:@"sub_frame"] & 1) == 0)
                      {
                        if (a4)
                        {
                          *a4 = (id)objc_claimAutoreleasedReturnValue();
                        }

                        goto LABEL_174;
                      }
                    }
                    uint64_t v49 = [obj countByEnumeratingWithState:&v142 objects:v162 count:16];
                    if (v49) {
                      continue;
                    }
                    break;
                  }
                }

LABEL_71:
                v53 = [(NSDictionary *)v7->_condition objectForKeyedSubscript:@"domainType"];
                if (v53)
                {
                  v54 = [(_WKWebExtensionDeclarativeNetRequestRule *)v7 _chromeDomainTypeToWebKitDomainType];
                  v55 = [v54 objectForKey:v53];
                  BOOL v56 = v55 == 0;

                  if (v56)
                  {
                    if (a4)
                    {
                      *a4 = (id)objc_claimAutoreleasedReturnValue();
                    }

                    goto LABEL_174;
                  }
                }

                v57 = [(NSDictionary *)v7->_condition objectForKeyedSubscript:@"domains"];
                v58 = v57;
                if (v57 && (isArrayOfDomainsValid(v57) & 1) == 0)
                {
                  if (a4)
                  {
                    *a4 = (id)objc_claimAutoreleasedReturnValue();
                  }
                }
                else
                {

                  v59 = [(NSDictionary *)v7->_condition objectForKeyedSubscript:@"requestDomains"];
                  v58 = v59;
                  if (v59 && (isArrayOfDomainsValid(v59) & 1) == 0)
                  {
                    if (a4)
                    {
                      *a4 = (id)objc_claimAutoreleasedReturnValue();
                    }
                  }
                  else
                  {

                    v60 = [(NSDictionary *)v7->_condition objectForKeyedSubscript:@"excludedDomains"];
                    v58 = v60;
                    if (v60 && (isArrayOfExcludedDomainsValid(v60) & 1) == 0)
                    {
                      if (a4)
                      {
                        *a4 = (id)objc_claimAutoreleasedReturnValue();
                      }
                    }
                    else
                    {

                      v61 = [(NSDictionary *)v7->_condition objectForKeyedSubscript:@"excludedRequestDomains"];
                      v58 = v61;
                      if (!v61 || (isArrayOfExcludedDomainsValid(v61) & 1) != 0)
                      {

                        v62 = [(NSDictionary *)v7->_action objectForKeyedSubscript:@"type"];
                        int v63 = [v62 isEqualToString:@"redirect"];

                        if (!v63) {
                          goto LABEL_141;
                        }
                        v108 = [(NSDictionary *)v7->_action objectForKeyedSubscript:@"redirect"];
                        WebKit::objectForKey<NSString>(v108, @"url", 1);
                        id obja = (id)objc_claimAutoreleasedReturnValue();
                        v110 = WebKit::objectForKey<NSString>(v108, @"extensionPath", 1);
                        v109 = WebKit::objectForKey<NSString>(v108, @"regexSubstitution", 1);
                        v111 = WebKit::objectForKey<NSDictionary>(v108, @"transform", 0, 0);
                        if (!obja && !v110 && !v111 && !v109)
                        {
                          if (!a4)
                          {
LABEL_139:
                            int v72 = 1;
                            goto LABEL_140;
                          }
                          id v64 = (id)objc_claimAutoreleasedReturnValue();
LABEL_88:
                          *a4 = v64;
                          goto LABEL_139;
                        }
                        if (obja)
                        {
                          v67 = [MEMORY[0x1E4F1CB10] URLWithString:obja];
                          if (!v67)
                          {
                            if (a4)
                            {
LABEL_137:
                              objc_msgSend(NSString, "stringWithFormat:", v71, v7->_ruleID);
                              *a4 = (id)objc_claimAutoreleasedReturnValue();
                            }
LABEL_138:

                            goto LABEL_139;
                          }
                          MEMORY[0x19972E8A0](&v140, v67);
                          char v69 = v141;
                          v70 = v140;
                          v140 = 0;
                          if (v70)
                          {
                            if (*(_DWORD *)v70 == 2) {
                              WTF::StringImpl::destroy(v70, v68);
                            }
                            else {
                              *(_DWORD *)v70 -= 2;
                            }
                          }
                          if ((v69 & 2) == 0)
                          {
                            if (a4)
                            {
                              goto LABEL_137;
                            }
                            goto LABEL_138;
                          }
                        }
                        if (v109)
                        {
                          v88 = [(NSDictionary *)v7->_condition objectForKeyedSubscript:@"regexFilter"];
                          BOOL v89 = v88 == 0;

                          if (v89)
                          {
                            if (!a4) {
                              goto LABEL_139;
                            }
                            id v64 = (id)objc_claimAutoreleasedReturnValue();
                            goto LABEL_88;
                          }
                        }
                        if (v110 && ([v110 hasPrefix:@"/"] & 1) == 0)
                        {
                          if (!a4) {
                            goto LABEL_139;
                          }
                          id v64 = (id)objc_claimAutoreleasedReturnValue();
                          goto LABEL_88;
                        }
                        if (v111 && ![v111 count])
                        {
                          if (!a4) {
                            goto LABEL_139;
                          }
                          id v64 = (id)objc_claimAutoreleasedReturnValue();
                          goto LABEL_88;
                        }
                        if ((byte_1EB3589BC & 1) == 0)
                        {
                          v160[0] = @"fragment";
                          v161[0] = objc_opt_class();
                          v160[1] = @"host";
                          v161[1] = objc_opt_class();
                          v160[2] = @"password";
                          v161[2] = objc_opt_class();
                          v160[3] = @"path";
                          v161[3] = objc_opt_class();
                          v160[4] = @"port";
                          v161[4] = objc_opt_class();
                          v160[5] = @"query";
                          v161[5] = objc_opt_class();
                          v160[6] = @"queryTransform";
                          v161[6] = objc_opt_class();
                          v160[7] = @"scheme";
                          v161[7] = objc_opt_class();
                          v160[8] = @"username";
                          v161[8] = objc_opt_class();
                          qword_1EB3589E8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v161 forKeys:v160 count:9];
                          byte_1EB3589BC = 1;
                        }
                        if (v111)
                        {
                          id v139 = v120;
                          BOOL v90 = WebKit::validateDictionary(v111, 0, MEMORY[0x1E4F1CBF0], (void *)qword_1EB3589E8, &v139);
                          id v91 = v139;

                          if (!v90)
                          {
                            if (a4)
                            {
                              *a4 = (id)objc_claimAutoreleasedReturnValue();
                            }
                            int v72 = 1;
                            id v120 = v91;
LABEL_140:

                            if (!v72)
                            {
LABEL_141:
                              v73 = [(NSDictionary *)v7->_action objectForKeyedSubscript:@"type"];
                              int v74 = [v73 isEqual:@"modifyHeaders"];

                              if (!v74)
                              {
LABEL_164:
                                v16 = v7;
                                goto LABEL_175;
                              }
                              uint64_t objb = [(NSDictionary *)v7->_action objectForKeyedSubscript:@"requestHeaders"];
                              uint64_t v112 = [(NSDictionary *)v7->_action objectForKeyedSubscript:@"responseHeaders"];
                              if (objb | v112)
                              {
                                if ((!objb || [(id)objb count])
                                  && (!v112 || [(id)v112 count]))
                                {
                                  long long v131 = 0u;
                                  long long v132 = 0u;
                                  long long v129 = 0u;
                                  long long v130 = 0u;
                                  id v75 = (id)objb;
                                  uint64_t v76 = [v75 countByEnumeratingWithState:&v129 objects:v151 count:16];
                                  if (v76)
                                  {
                                    uint64_t v77 = *(void *)v130;
                                    while (2)
                                    {
                                      for (uint64_t j = 0; j != v76; ++j)
                                      {
                                        if (*(void *)v130 != v77) {
                                          objc_enumerationMutation(v75);
                                        }
                                        v79 = [(_WKWebExtensionDeclarativeNetRequestRule *)v7 _validateHeaderInfoDictionary:*(void *)(*((void *)&v129 + 1) + 8 * j)];
                                        v80 = v79;
                                        if (v79)
                                        {
                                          if (a4) {
                                            *a4 = v79;
                                          }

                                          goto LABEL_173;
                                        }
                                      }
                                      uint64_t v76 = [v75 countByEnumeratingWithState:&v129 objects:v151 count:16];
                                      if (v76) {
                                        continue;
                                      }
                                      break;
                                    }
                                  }

                                  long long v127 = 0u;
                                  long long v128 = 0u;
                                  long long v125 = 0u;
                                  long long v126 = 0u;
                                  id v81 = (id)v112;
                                  uint64_t v82 = [v81 countByEnumeratingWithState:&v125 objects:v150 count:16];
                                  if (v82)
                                  {
                                    uint64_t v83 = *(void *)v126;
                                    while (2)
                                    {
                                      for (uint64_t k = 0; k != v82; ++k)
                                      {
                                        if (*(void *)v126 != v83) {
                                          objc_enumerationMutation(v81);
                                        }
                                        v85 = [(_WKWebExtensionDeclarativeNetRequestRule *)v7 _validateHeaderInfoDictionary:*(void *)(*((void *)&v125 + 1) + 8 * k)];
                                        v86 = v85;
                                        if (v85)
                                        {
                                          if (a4) {
                                            *a4 = v85;
                                          }

                                          goto LABEL_174;
                                        }
                                      }
                                      uint64_t v82 = [v81 countByEnumeratingWithState:&v125 objects:v150 count:16];
                                      if (v82) {
                                        continue;
                                      }
                                      break;
                                    }
                                  }

                                  goto LABEL_164;
                                }
                                if (!a4) {
                                  goto LABEL_173;
                                }
                                id v87 = (id)objc_claimAutoreleasedReturnValue();
                              }
                              else
                              {
                                if (!a4)
                                {
LABEL_173:

                                  goto LABEL_174;
                                }
                                id v87 = (id)objc_claimAutoreleasedReturnValue();
                              }
                              *a4 = v87;
                              goto LABEL_173;
                            }
LABEL_174:
                            v16 = 0;
                            goto LABEL_175;
                          }
                          id v120 = v91;
                        }
                        v107 = WebKit::objectForKey<NSDictionary>(v111, @"queryTransform", 0, 0);
                        if (v107 && ![v107 count])
                        {
                          if (a4)
                          {
                            *a4 = (id)objc_claimAutoreleasedReturnValue();
                          }
                          int v72 = 1;
                        }
                        else
                        {
                          if ((byte_1EB3589BD & 1) == 0)
                          {
                            v158[0] = @"addOrReplaceParams";
                            uint64_t v157 = objc_opt_class();
                            v102 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v157 count:1];
                            v159[0] = v102;
                            v158[1] = @"removeParams";
                            uint64_t v156 = objc_opt_class();
                            v103 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v156 count:1];
                            v159[1] = v103;
                            qword_1EB3589F0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v159 forKeys:v158 count:2];

                            byte_1EB3589BD = 1;
                          }
                          if (!v107) {
                            goto LABEL_196;
                          }
                          id v138 = v120;
                          BOOL v92 = WebKit::validateDictionary(v107, 0, MEMORY[0x1E4F1CBF0], (void *)qword_1EB3589F0, &v138);
                          id v93 = v138;

                          if (v92)
                          {
                            id v120 = v93;
LABEL_196:
                            v105 = [v107 objectForKeyedSubscript:@"removeParams"];
                            if (v105 && ![v105 count])
                            {
                              if (a4)
                              {
                                *a4 = (id)objc_claimAutoreleasedReturnValue();
                              }
                              int v72 = 1;
                            }
                            else
                            {
                              if ((byte_1EB3589BE & 1) == 0)
                              {
                                v155[0] = @"key";
                                v155[1] = @"value";
                                qword_1EB3589F8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v155 count:2];
                                byte_1EB3589BE = 1;
                              }
                              if ((byte_1EB3589BF & 1) == 0)
                              {
                                v153[0] = @"key";
                                v154[0] = objc_opt_class();
                                v153[1] = @"value";
                                v154[1] = objc_opt_class();
                                v153[2] = @"replaceOnly";
                                v154[2] = objc_opt_class();
                                qword_1EB358A00 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v154 forKeys:v153 count:3];
                                byte_1EB3589BF = 1;
                              }
                              v104 = [v107 objectForKeyedSubscript:@"addOrReplaceParams"];
                              if (v104 && ![v104 count])
                              {
                                if (a4)
                                {
                                  *a4 = (id)objc_claimAutoreleasedReturnValue();
                                }
                                int v72 = 1;
                              }
                              else
                              {
                                long long v136 = 0u;
                                long long v137 = 0u;
                                long long v134 = 0u;
                                long long v135 = 0u;
                                id v106 = v104;
                                uint64_t v94 = [v106 countByEnumeratingWithState:&v134 objects:v152 count:16];
                                if (v94)
                                {
                                  uint64_t v95 = *(void *)v135;
                                  while (2)
                                  {
                                    uint64_t v96 = 0;
                                    v97 = v120;
                                    do
                                    {
                                      if (*(void *)v135 != v95) {
                                        objc_enumerationMutation(v106);
                                      }
                                      v98 = *(void **)(*((void *)&v134 + 1) + 8 * v96);
                                      id v133 = v97;
                                      BOOL v99 = WebKit::validateDictionary(v98, 0, (void *)qword_1EB3589F8, qword_1EB358A00, &v133);
                                      id v120 = v133;

                                      if (!v99)
                                      {
                                        if (a4)
                                        {
                                          *a4 = (id)objc_claimAutoreleasedReturnValue();
                                        }
                                        int v72 = 1;
                                        goto LABEL_234;
                                      }
                                      ++v96;
                                      v97 = v120;
                                    }
                                    while (v94 != v96);
                                    uint64_t v94 = [v106 countByEnumeratingWithState:&v134 objects:v152 count:16];
                                    if (v94) {
                                      continue;
                                    }
                                    break;
                                  }
                                }
                                int v72 = 0;
LABEL_234:
                              }
                            }

                            goto LABEL_243;
                          }
                          if (a4)
                          {
                            *a4 = (id)objc_claimAutoreleasedReturnValue();
                          }
                          int v72 = 1;
                          id v120 = v93;
                        }
LABEL_243:

                        goto LABEL_140;
                      }
                      if (a4)
                      {
                        *a4 = (id)objc_claimAutoreleasedReturnValue();
                      }
                    }
                  }
                }

                goto LABEL_174;
              }
              if (a4)
              {
                id v66 = (id)objc_claimAutoreleasedReturnValue();
                goto LABEL_106;
              }
              goto LABEL_107;
            }
            if ([v36 canBeConvertedToEncoding:1])
            {
              if (+[WKContentRuleList _supportsRegularExpression:v37])
              {
                goto LABEL_46;
              }
              if (a4)
              {
                goto LABEL_94;
              }
            }
            else if (a4)
            {
LABEL_94:
              objc_msgSend(NSString, "stringWithFormat:", v43, v7->_ruleID);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }

            goto LABEL_96;
          }
          if (a4)
          {
            v33 = NSString;
            int64_t v34 = v7->_ruleID;
            v35 = [(NSDictionary *)v7->_action objectForKeyedSubscript:@"type"];
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
        else if (a4)
        {
          [NSString stringWithFormat:@"Rule with id %ld is invalid. %@", v7->_ruleID, v22];
          v16 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_98:

          goto LABEL_99;
        }
        v16 = 0;
        goto LABEL_98;
      }
    }
    else
    {
      v7->_priority = 1;
      uint64_t ruleID = v7->_ruleID;
      if (ruleID > 0) {
        goto LABEL_20;
      }
    }
    if (a4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Rule with id %ld is invalid. Rule id must be non-negative.", ruleID);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    }
LABEL_36:
    v16 = 0;
    goto LABEL_99;
  }
  if (a4)
  {
    v16 = 0;
    *a4 = @"Missing rule id.";
  }
  else
  {
LABEL_15:
    v16 = 0;
  }
LABEL_101:

  return v16;
}

- (id)_validateHeaderInfoDictionary:(id)a3
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((byte_1EB3589C0 & 1) == 0)
  {
    v24[0] = @"header";
    v24[1] = @"operation";
    qword_1EB358A08 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
    byte_1EB3589C0 = 1;
  }
  if (byte_1EB3589C1 == 1)
  {
    v5 = (void *)qword_1EB358A10;
  }
  else
  {
    v22[0] = @"header";
    v23[0] = objc_opt_class();
    v22[1] = @"operation";
    v23[1] = objc_opt_class();
    v22[2] = @"value";
    v23[2] = objc_opt_class();
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];
    qword_1EB358A10 = (uint64_t)v5;
    byte_1EB3589C1 = 1;
  }
  id v21 = 0;
  BOOL v6 = WebKit::validateDictionary(v4, 0, (void *)qword_1EB358A08, v5, &v21);
  id v7 = v21;
  if (!v6)
  {
    uint64_t v19 = [NSString stringWithFormat:@"Rule with id %ld is invalid. One of the headers dictionaries is not formatted correctly. %@", self->_ruleID, v7];
    goto LABEL_26;
  }
  v8 = [v4 objectForKeyedSubscript:@"operation"];
  int v9 = [v8 isEqual:@"set"];
  int v10 = [v8 isEqual:@"append"];
  int v11 = [v8 isEqual:@"remove"];
  if ((v9 | v10 | v11))
  {
    v12 = [v4 objectForKeyedSubscript:@"header"];
    uint64_t v13 = [v12 lowercaseString];
    char v14 = [&unk_1EEA53080 containsObject:v13];

    if ((v14 & 1) == 0) {
      uint64_t v19 = {;
    }
LABEL_24:

      goto LABEL_25;
    }
    uint64_t v15 = [v4 objectForKeyedSubscript:@"value"];
    v16 = (void *)v15;
    if (v15) {
      char v17 = v11;
    }
    else {
      char v17 = 0;
    }
    if (v17)
    {
      v18 = @"Rule with id %ld is invalid. Do not provide a value when removing a header.";
    }
    else
    {
      if (v9)
      {
        if (v15)
        {
          uint64_t v19 = 0;
LABEL_23:

          goto LABEL_24;
        }
      }
      else
      {
        uint64_t v19 = 0;
        if (!v10 || v15) {
          goto LABEL_23;
        }
      }
      v18 = @"Rule with id %ld is invalid. You must provide a value when modifying a header.";
    }
    uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", v18, self->_ruleID);
    goto LABEL_23;
  uint64_t v19 = };
LABEL_25:

LABEL_26:

  return v19;
}

- (void)removeInvalidResourceTypesForKey:(id)a3
{
  id v4 = a3;
  v5 = [(NSDictionary *)self->_condition objectForKeyedSubscript:v4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77___WKWebExtensionDeclarativeNetRequestRule_removeInvalidResourceTypesForKey___block_invoke;
  v10[3] = &unk_1E5810F48;
  v10[4] = self;
  BOOL v6 = WebKit::mapObjects<NSArray>(v5, v10);
  uint64_t v7 = [v6 count];
  if (v7 != [v5 count])
  {
    v8 = (NSDictionary *)[(NSDictionary *)self->_condition mutableCopy];
    [(NSDictionary *)v8 setObject:v6 forKeyedSubscript:v4];
    condition = self->_condition;
    self->_condition = v8;
  }
}

- (NSArray)ruleInWebKitFormat
{
  v13[6] = *MEMORY[0x1E4F143B8];
  if ((byte_1EB3589C2 & 1) == 0)
  {
    v12[0] = @"allow";
    v12[1] = @"allowAllRequests";
    v13[0] = @"ignore-previous-rules";
    v13[1] = @"ignore-previous-rules";
    v12[2] = @"block";
    v12[3] = @"modifyHeaders";
    v13[2] = @"block";
    v13[3] = @"modify-headers";
    v12[4] = @"redirect";
    v12[5] = @"upgradeScheme";
    v13[4] = @"redirect";
    v13[5] = @"make-https";
    qword_1EB358A18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:6];
    byte_1EB3589C2 = 1;
  }
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = (void *)qword_1EB358A18;
  v5 = [(NSDictionary *)self->_action objectForKeyedSubscript:@"type"];
  BOOL v6 = [v4 objectForKeyedSubscript:v5];

  uint64_t v7 = [(NSDictionary *)self->_action objectForKeyedSubscript:@"type"];
  if ([v6 isEqualToString:@"make-https"])
  {
    v8 = [(_WKWebExtensionDeclarativeNetRequestRule *)self _convertedRulesForWebKitActionType:@"ignore-previous-rules" chromeActionType:v7];
    [v3 addObjectsFromArray:v8];
  }
  int v9 = [(_WKWebExtensionDeclarativeNetRequestRule *)self _convertedRulesForWebKitActionType:v6 chromeActionType:v7];
  [v3 addObjectsFromArray:v9];

  int v10 = (void *)[v3 copy];

  return (NSArray *)v10;
}

- (id)_convertedRulesForWebKitActionType:(id)a3 chromeActionType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1CA48] array];
  int v9 = [(_WKWebExtensionDeclarativeNetRequestRule *)self _allChromeResourceTypes];
  int v10 = (void *)[v9 mutableCopy];

  int v11 = [v10 containsObject:@"main_frame"];
  int v12 = [v10 containsObject:@"sub_frame"];
  if ((v11 | v12))
  {
    uint64_t v13 = &unk_1EEA53020;
    if ((v11 & v12) != 0) {
      uint64_t v13 = &unk_1EEA53008;
    }
    if (v11) {
      char v14 = v13;
    }
    else {
      char v14 = &unk_1EEA53038;
    }
    uint64_t v15 = [(_WKWebExtensionDeclarativeNetRequestRule *)self _webKitRuleWithWebKitActionType:v6 chromeActionType:v7 chromeResourceTypes:v14];
    [v8 addObject:v15];
  }
  [v10 removeObjectsInArray:&unk_1EEA53050];
  if ([v10 count])
  {
    v16 = [(_WKWebExtensionDeclarativeNetRequestRule *)self _webKitRuleWithWebKitActionType:v6 chromeActionType:v7 chromeResourceTypes:v10];
    [v8 addObject:v16];
  }
  char v17 = (void *)[v8 copy];

  return v17;
}

- (id)_webKitRuleWithWebKitActionType:(id)a3 chromeActionType:(id)a4 chromeResourceTypes:(id)a5
{
  v74[1] = *MEMORY[0x1E4F143B8];
  id v62 = a3;
  id v8 = a4;
  id v63 = a5;
  id v66 = v8;
  int v9 = [v8 isEqualToString:@"allowAllRequests"];
  if (v9)
  {
    v65 = 0;
    int v10 = @".*";
  }
  else
  {
    int v11 = [(NSDictionary *)self->_condition objectForKeyedSubscript:@"urlFilter"];
    int v12 = [(_WKWebExtensionDeclarativeNetRequestRule *)self _regexURLFilterForChromeURLFilter:v11];
    uint64_t v13 = v12;
    if (v12)
    {
      int v10 = v12;
    }
    else
    {
      uint64_t v14 = [(NSDictionary *)self->_condition objectForKeyedSubscript:@"regexFilter"];
      uint64_t v15 = (void *)v14;
      if (v14) {
        v16 = (__CFString *)v14;
      }
      else {
        v16 = @".*";
      }
      int v10 = v16;
    }
    v65 = [(_WKWebExtensionDeclarativeNetRequestRule *)self _convertedResourceTypesForChromeResourceTypes:v63];
  }
  v73 = @"type";
  v74[0] = v62;
  char v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:&v73 count:1];
  int v59 = v9;
  v61 = v10;
  v18 = (void *)[v17 mutableCopy];

  uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v20 = [(NSDictionary *)self->_condition objectForKeyedSubscript:@"isUrlFilterCaseSensitive"];
  id v21 = (void *)v20;
  id v22 = (void *)MEMORY[0x1E4F1CC28];
  if (v20) {
    id v22 = (void *)v20;
  }
  id v64 = v22;

  [v19 setObject:v10 forKeyedSubscript:@"url-filter"];
  if ([v64 BOOLValue]) {
    [v19 setObject:v64 forKeyedSubscript:@"url-filter-is-case-sensitive"];
  }
  v71[0] = @"action";
  v71[1] = @"trigger";
  v72[0] = v18;
  v72[1] = v19;
  v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:v71 count:2];
  if ([v66 isEqualToString:@"modifyHeaders"])
  {
    uint64_t v23 = [(NSDictionary *)self->_action objectForKeyedSubscript:@"requestHeaders"];
    id v21 = [(NSDictionary *)self->_action objectForKeyedSubscript:@"responseHeaders"];
    [v18 setObject:v23 forKeyedSubscript:@"request-headers"];
    [v18 setObject:v21 forKeyedSubscript:@"response-headers"];
    v24 = [NSNumber numberWithInteger:self->_priority];
    [v18 setObject:v24 forKeyedSubscript:@"priority"];
  }
  if ([v66 isEqualToString:@"redirect"])
  {
    uint64_t v25 = [(NSDictionary *)self->_action objectForKeyedSubscript:@"redirect"];
    v26 = [MEMORY[0x1E4F1CA60] dictionary];
    v27 = [v25 objectForKeyedSubscript:@"url"];
    [v26 setObject:v27 forKeyedSubscript:@"url"];

    BOOL v28 = [v25 objectForKeyedSubscript:@"regexSubstitution"];
    [v26 setObject:v28 forKeyedSubscript:@"regex-substitution"];

    v29 = [v25 objectForKeyedSubscript:@"extensionPath"];
    [v26 setObject:v29 forKeyedSubscript:@"extension-path"];

    v30 = [v25 objectForKeyedSubscript:@"transform"];
    BOOL v31 = (void *)[v30 mutableCopy];

    id v32 = [v31 objectForKeyedSubscript:@"queryTransform"];
    v33 = (void *)[v32 mutableCopy];

    int64_t v34 = [v33 objectForKeyedSubscript:@"addOrReplaceParams"];
    v35 = [v33 objectForKeyedSubscript:@"removeParams"];
    [v31 setObject:v33 forKeyedSubscript:@"query-transform"];
    [v31 setObject:0 forKeyedSubscript:@"queryTransform"];
    v36 = WebKit::mapObjects<NSArray>(v34, &__block_literal_global);

    [v33 setObject:v36 forKeyedSubscript:@"add-or-replace-parameters"];
    [v33 setObject:0 forKeyedSubscript:@"addOrReplaceParams"];
    [v33 setObject:v35 forKeyedSubscript:@"remove-parameters"];
    [v33 setObject:0 forKeyedSubscript:@"removeParams"];
    [v26 setObject:v31 forKeyedSubscript:@"transform"];
    id v21 = v36;
    [v18 setObject:v26 forKeyedSubscript:@"redirect"];
  }
  if (v65)
  {
    v37 = [(_WKWebExtensionDeclarativeNetRequestRule *)self _chromeResourceTypeToWebKitLoadContext];
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __113___WKWebExtensionDeclarativeNetRequestRule__webKitRuleWithWebKitActionType_chromeActionType_chromeResourceTypes___block_invoke_2;
    v67[3] = &unk_1E5810F90;
    id v38 = v37;
    id v68 = v38;
    id v21 = WebKit::mapObjects<NSArray>(v63, v67);
    uint64_t v39 = [v21 count];
    v40 = v65;
    if (v39)
    {
      [v19 setObject:v21 forKeyedSubscript:@"load-context"];
      v40 = &unk_1EEA53068;
    }
    [v19 setObject:v40 forKeyedSubscript:@"resource-type"];
  }
  v41 = [(NSDictionary *)self->_condition objectForKeyedSubscript:@"domainType"];
  if (v41)
  {
    BOOL v42 = [(_WKWebExtensionDeclarativeNetRequestRule *)self _chromeDomainTypeToWebKitDomainType];
    id v21 = [v42 objectForKeyedSubscript:v41];
    v70 = v21;
    v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
    [v19 setObject:v43 forKeyedSubscript:@"load-type"];
  }
  v44 = [(NSDictionary *)self->_condition objectForKeyedSubscript:@"domains"];
  v45 = v44;
  if (v44)
  {
    v46 = WebKit::mapObjects<NSArray>(v44, &__block_literal_global_337);
    [v19 setObject:v46 forKeyedSubscript:@"if-domain"];
  }
  else
  {
    v47 = [(NSDictionary *)self->_condition objectForKeyedSubscript:@"requestDomains"];
    v46 = v47;
    if (v47)
    {
      int v48 = WebKit::mapObjects<NSArray>(v47, &__block_literal_global_337);
      [v19 setObject:v48 forKeyedSubscript:@"if-domain"];
    }
    else
    {
      uint64_t v49 = [(NSDictionary *)self->_condition objectForKeyedSubscript:@"excludedDomains"];
      int v48 = v49;
      if (v49)
      {
        id v21 = WebKit::mapObjects<NSArray>(v49, &__block_literal_global_337);
        [v19 setObject:v21 forKeyedSubscript:@"unless-domain"];
      }
      else
      {
        uint64_t v50 = [(NSDictionary *)self->_condition objectForKeyedSubscript:@"excludedRequestDomains"];
        id v21 = v50;
        if (v50)
        {
          v51 = WebKit::mapObjects<NSArray>(v50, &__block_literal_global_337);
          [v19 setObject:v51 forKeyedSubscript:@"unless-domain"];
        }
      }
    }
  }

  if (v59)
  {
    v52 = [(NSDictionary *)self->_condition objectForKeyedSubscript:@"urlFilter"];
    v53 = [(_WKWebExtensionDeclarativeNetRequestRule *)self _regexURLFilterForChromeURLFilter:v52];
    v54 = v53;
    if (!v53)
    {
      uint64_t v55 = [(NSDictionary *)self->_condition objectForKeyedSubscript:@"regexFilter"];
      id v21 = (void *)v55;
      v54 = &stru_1EEA10550;
      if (v55) {
        v54 = (__CFString *)v55;
      }
    }
    char v69 = v54;
    BOOL v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1];
    [v19 setObject:v56 forKeyedSubscript:@"if-top-url"];

    if (!v53) {
  }
    }
  v57 = (void *)[v60 copy];

  return v57;
}

- (id)_chromeResourceTypeToWebKitLoadContext
{
  return &unk_1EEA53110;
}

- (id)_chromeDomainTypeToWebKitDomainType
{
  return &unk_1EEA53138;
}

- (id)_chromeResourceTypeToWebKitResourceType
{
  return &unk_1EEA53160;
}

- (id)_resourcesToTargetWhenNoneAreSpecifiedInRule
{
  v3 = (void *)-[_WKWebExtensionDeclarativeNetRequestRule _resourcesToTargetWhenNoneAreSpecifiedInRule]::resourceTypesExceptMainFrame;
  if (!-[_WKWebExtensionDeclarativeNetRequestRule _resourcesToTargetWhenNoneAreSpecifiedInRule]::resourceTypesExceptMainFrame)
  {
    id v4 = [(_WKWebExtensionDeclarativeNetRequestRule *)self _chromeResourceTypeToWebKitResourceType];
    v5 = (void *)[v4 mutableCopy];

    [v5 removeObjectForKey:@"main_frame"];
    uint64_t v6 = [v5 allKeys];
    id v7 = (void *)-[_WKWebExtensionDeclarativeNetRequestRule _resourcesToTargetWhenNoneAreSpecifiedInRule]::resourceTypesExceptMainFrame;
    -[_WKWebExtensionDeclarativeNetRequestRule _resourcesToTargetWhenNoneAreSpecifiedInRule]::resourceTypesExceptMainFrame = v6;

    v3 = (void *)-[_WKWebExtensionDeclarativeNetRequestRule _resourcesToTargetWhenNoneAreSpecifiedInRule]::resourceTypesExceptMainFrame;
  }

  return v3;
}

- (id)_allChromeResourceTypes
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  p_condition = &self->_condition;
  uint64_t v4 = [(NSDictionary *)self->_condition objectForKeyedSubscript:@"resourceTypes"];
  uint64_t v5 = [(NSDictionary *)*p_condition objectForKeyedSubscript:@"excludedResourceTypes"];
  if (v4 | v5)
  {
    if (!v4)
    {
      uint64_t v6 = [(_WKWebExtensionDeclarativeNetRequestRule *)self _chromeResourceTypeToWebKitResourceType];
      id v7 = (void *)[v6 mutableCopy];

      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v8 = (id)v5;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v8);
            }
            [v7 removeObjectForKey:*(void *)(*((void *)&v14 + 1) + 8 * i)];
          }
          uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v9);
      }

      uint64_t v12 = [v7 allKeys];

      uint64_t v4 = v12;
    }
  }
  else
  {
    uint64_t v4 = [(_WKWebExtensionDeclarativeNetRequestRule *)self _resourcesToTargetWhenNoneAreSpecifiedInRule];
  }

  return (id)v4;
}

- (id)_convertedResourceTypesForChromeResourceTypes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_WKWebExtensionDeclarativeNetRequestRule *)self _chromeResourceTypeToWebKitResourceType];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __90___WKWebExtensionDeclarativeNetRequestRule__convertedResourceTypesForChromeResourceTypes___block_invoke;
  v9[3] = &unk_1E5810F90;
  id v10 = v5;
  id v6 = v5;
  id v7 = WebKit::mapObjects<NSArray>(v4, v9);

  return v7;
}

- (id)_regexURLFilterForChromeURLFilter:(id)a3
{
  id v3 = a3;
  if (![v3 length])
  {
    id v6 = 0;
    goto LABEL_18;
  }
  int v4 = [v3 hasPrefix:@"||"];
  if (v4)
  {
    uint64_t v5 = [v3 substringFromIndex:2];
LABEL_7:
    id v7 = (void *)v5;
    int v8 = v4 ^ 1;

    id v3 = v7;
    goto LABEL_9;
  }
  if ([v3 hasPrefix:@"|"])
  {
    uint64_t v5 = [v3 substringFromIndex:1];
    goto LABEL_7;
  }
  int v8 = 0;
LABEL_9:
  int v10 = [v3 hasSuffix:@"|"];
  if (v10)
  {
    uint64_t v11 = objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "length") - 1);

    id v3 = (id)v11;
  }
  uint64_t v12 = WebKit::escapeCharactersInString((WebKit *)v3, &stru_1EEA11610.isa, v9);
  uint64_t v13 = [v12 stringByReplacingOccurrencesOfString:@"*" withString:@".*"];

  long long v14 = [v13 stringByReplacingOccurrencesOfString:@"^" withString:@"[^a-zA-Z0-9_.%-]"];

  if (v4)
  {
    uint64_t v15 = [@"^[^:]+://+([^:/]+\\.)?" stringByAppendingString:v14];

    id v6 = (void *)v15;
    if (!v8) {
      goto LABEL_13;
    }
LABEL_16:
    uint64_t v16 = [@"^" stringByAppendingString:v6];

    id v6 = (void *)v16;
    if (!v10) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  id v6 = v14;
  if (v8) {
    goto LABEL_16;
  }
LABEL_13:
  if (v10)
  {
LABEL_17:
    uint64_t v17 = [v6 stringByAppendingString:@"$"];

    id v6 = (void *)v17;
  }
LABEL_18:

  return v6;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  int64_t priority = self->_priority;
  if (priority >= [v4 priority])
  {
    int64_t v7 = self->_priority;
    if (v7 > [v4 priority])
    {
      int64_t v6 = 1;
      goto LABEL_7;
    }
    int v8 = [(NSDictionary *)self->_action objectForKeyedSubscript:@"type"];
    uint64_t v9 = priorityForRuleType(v8);
    int v10 = [v4 action];
    uint64_t v11 = [v10 objectForKeyedSubscript:@"type"];
    uint64_t v12 = priorityForRuleType(v11);

    if (v9 >= v12)
    {
      uint64_t v13 = [(NSDictionary *)self->_action objectForKeyedSubscript:@"type"];
      uint64_t v14 = priorityForRuleType(v13);
      uint64_t v15 = [v4 action];
      uint64_t v16 = [v15 objectForKeyedSubscript:@"type"];
      int64_t v6 = v14 > priorityForRuleType(v16);

      goto LABEL_7;
    }
  }
  int64_t v6 = -1;
LABEL_7:

  return v6;
}

- (id)description
{
  v13[4] = *MEMORY[0x1E4F143B8];
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v12[0] = @"id";
  uint64_t v5 = [NSNumber numberWithInteger:self->_ruleID];
  v13[0] = v5;
  v12[1] = @"priority";
  int64_t v6 = [NSNumber numberWithInteger:self->_priority];
  action = self->_action;
  condition = self->_condition;
  v13[1] = v6;
  v13[2] = action;
  v12[2] = @"action";
  v12[3] = @"condition";
  v13[3] = condition;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];
  int v10 = [v3 stringWithFormat:@"<%@:%p %@>", v4, self, v9];

  return v10;
}

- (int64_t)ruleID
{
  return self->_ruleID;
}

- (int64_t)priority
{
  return self->_priority;
}

- (NSDictionary)action
{
  return self->_action;
}

- (NSDictionary)condition
{
  return self->_condition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_condition, 0);

  objc_storeStrong((id *)&self->_action, 0);
}

@end