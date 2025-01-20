@interface SOKerberosExtensionData
- (BOOL)allowAutomaticLogin;
- (BOOL)allowPasswordChange;
- (BOOL)allowPlatformSSOAuthFallback;
- (BOOL)delayUserSetup;
- (BOOL)includeKerberosAppsInBundleIdACL;
- (BOOL)includeManagedAppsInBundleIdACL;
- (BOOL)isDefaultRealm;
- (BOOL)monitorCredentialsCache;
- (BOOL)performKerberosOnly;
- (BOOL)pwReqComplexity;
- (BOOL)requireTLSForLDAP;
- (BOOL)requireUserPresence;
- (BOOL)syncLocalPassword;
- (BOOL)usePlatformSSOTGT;
- (BOOL)useSiteAutoDiscovery;
- (NSArray)credentialBundleIdACL;
- (NSArray)preferredKDCs;
- (NSData)pwReqRTFData;
- (NSDictionary)domainRealmMapping;
- (NSNumber)allowPassword;
- (NSNumber)allowSmartCard;
- (NSNumber)pwExpireOverride;
- (NSNumber)pwNotificationDays;
- (NSNumber)pwReqHistory;
- (NSNumber)pwReqLength;
- (NSNumber)pwReqMinAge;
- (NSNumber)replicationTime;
- (NSNumber)startInSmartCardMode;
- (NSString)cacheName;
- (NSString)certificateUUID;
- (NSString)customUsernameLabel;
- (NSString)helpText;
- (NSString)identityIssuerAutoSelectFilter;
- (NSString)password;
- (NSString)principalName;
- (NSString)pwChangeURL;
- (NSString)pwReqText;
- (NSString)siteCode;
- (SOKerberosExtensionData)initWithDictionary:(id)a3;
- (int64_t)credentialUseMode;
- (void)setAllowAutomaticLogin:(BOOL)a3;
- (void)setAllowPassword:(id)a3;
- (void)setAllowPasswordChange:(BOOL)a3;
- (void)setAllowPlatformSSOAuthFallback:(BOOL)a3;
- (void)setAllowSmartCard:(id)a3;
- (void)setCacheName:(id)a3;
- (void)setCertificateUUID:(id)a3;
- (void)setCredentialBundleIdACL:(id)a3;
- (void)setCredentialUseMode:(int64_t)a3;
- (void)setCustomUsernameLabel:(id)a3;
- (void)setDelayUserSetup:(BOOL)a3;
- (void)setDomainRealmMapping:(id)a3;
- (void)setHelpText:(id)a3;
- (void)setIdentityIssuerAutoSelectFilter:(id)a3;
- (void)setIncludeKerberosAppsInBundleIdACL:(BOOL)a3;
- (void)setIncludeManagedAppsInBundleIdACL:(BOOL)a3;
- (void)setIsDefaultRealm:(BOOL)a3;
- (void)setMonitorCredentialsCache:(BOOL)a3;
- (void)setPassword:(id)a3;
- (void)setPerformKerberosOnly:(BOOL)a3;
- (void)setPreferredKDCs:(id)a3;
- (void)setPrincipalName:(id)a3;
- (void)setPwChangeURL:(id)a3;
- (void)setPwExpireOverride:(id)a3;
- (void)setPwNotificationDays:(id)a3;
- (void)setPwReqComplexity:(BOOL)a3;
- (void)setPwReqHistory:(id)a3;
- (void)setPwReqLength:(id)a3;
- (void)setPwReqMinAge:(id)a3;
- (void)setPwReqRTFData:(id)a3;
- (void)setPwReqText:(id)a3;
- (void)setReplicationTime:(id)a3;
- (void)setRequireTLSForLDAP:(BOOL)a3;
- (void)setRequireUserPresence:(BOOL)a3;
- (void)setSiteCode:(id)a3;
- (void)setStartInSmartCardMode:(id)a3;
- (void)setSyncLocalPassword:(BOOL)a3;
- (void)setUsePlatformSSOTGT:(BOOL)a3;
- (void)setUseSiteAutoDiscovery:(BOOL)a3;
@end

@implementation SOKerberosExtensionData

- (SOKerberosExtensionData)initWithDictionary:(id)a3
{
  uint64_t v261 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v256.receiver = self;
  v256.super_class = (Class)SOKerberosExtensionData;
  v5 = [(SOKerberosExtensionData *)&v256 init];

  if (v5)
  {
    v6 = NSStringFromSelector(sel_pwReqComplexity);
    v7 = [v4 objectForKeyedSubscript:v6];

    if (v7)
    {
      v8 = NSStringFromSelector(sel_pwReqComplexity);
      v9 = [v4 objectForKeyedSubscript:v8];
      v5->_pwReqComplexity = [v9 BOOLValue];
    }
    else
    {
      v5->_pwReqComplexity = 0;
    }
    v10 = NSStringFromSelector(sel_syncLocalPassword);
    v11 = [v4 objectForKeyedSubscript:v10];

    if (v11)
    {
      v12 = NSStringFromSelector(sel_syncLocalPassword);
      v13 = [v4 objectForKeyedSubscript:v12];
      v5->_syncLocalPassword = [v13 BOOLValue];
    }
    else
    {
      v5->_syncLocalPassword = 0;
    }
    v14 = NSStringFromSelector(sel_pwNotificationDays);
    v15 = [v4 objectForKeyedSubscript:v14];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v17 = NSStringFromSelector(sel_pwNotificationDays);
      uint64_t v18 = [v4 objectForKeyedSubscript:v17];
      pwNotificationDays = v5->_pwNotificationDays;
      v5->_pwNotificationDays = (NSNumber *)v18;
    }
    else
    {
      uint64_t v20 = [NSNumber numberWithInteger:15];
      v17 = v5->_pwNotificationDays;
      v5->_pwNotificationDays = (NSNumber *)v20;
    }

    v21 = NSStringFromSelector(sel_pwExpireOverride);
    v22 = [v4 objectForKeyedSubscript:v21];
    objc_opt_class();
    char v23 = objc_opt_isKindOfClass();

    if (v23)
    {
      v24 = NSStringFromSelector(sel_pwExpireOverride);
      uint64_t v25 = [v4 objectForKeyedSubscript:v24];
      pwExpireOverride = v5->_pwExpireOverride;
      v5->_pwExpireOverride = (NSNumber *)v25;
    }
    v27 = NSStringFromSelector(sel_pwChangeURL);
    v28 = [v4 objectForKeyedSubscript:v27];
    objc_opt_class();
    char v29 = objc_opt_isKindOfClass();

    if (v29)
    {
      v30 = NSStringFromSelector(sel_pwChangeURL);
      uint64_t v31 = [v4 objectForKeyedSubscript:v30];
      pwChangeURL = v5->_pwChangeURL;
      v5->_pwChangeURL = (NSString *)v31;
    }
    v33 = NSStringFromSelector(sel_pwReqLength);
    v34 = [v4 objectForKeyedSubscript:v33];
    objc_opt_class();
    char v35 = objc_opt_isKindOfClass();

    if (v35)
    {
      v36 = NSStringFromSelector(sel_pwReqLength);
      uint64_t v37 = [v4 objectForKeyedSubscript:v36];
      pwReqLength = v5->_pwReqLength;
      v5->_pwReqLength = (NSNumber *)v37;
    }
    v39 = NSStringFromSelector(sel_pwReqMinAge);
    v40 = [v4 objectForKeyedSubscript:v39];
    objc_opt_class();
    char v41 = objc_opt_isKindOfClass();

    if (v41)
    {
      v42 = NSStringFromSelector(sel_pwReqMinAge);
      uint64_t v43 = [v4 objectForKeyedSubscript:v42];
      pwReqMinAge = v5->_pwReqMinAge;
      v5->_pwReqMinAge = (NSNumber *)v43;
    }
    v45 = NSStringFromSelector(sel_pwReqHistory);
    v46 = [v4 objectForKeyedSubscript:v45];
    objc_opt_class();
    char v47 = objc_opt_isKindOfClass();

    if (v47)
    {
      v48 = NSStringFromSelector(sel_pwReqHistory);
      uint64_t v49 = [v4 objectForKeyedSubscript:v48];
      pwReqHistory = v5->_pwReqHistory;
      v5->_pwReqHistory = (NSNumber *)v49;
    }
    v51 = NSStringFromSelector(sel_pwReqText);
    v52 = [v4 objectForKeyedSubscript:v51];
    objc_opt_class();
    char v53 = objc_opt_isKindOfClass();

    if (v53)
    {
      v54 = NSStringFromSelector(sel_pwReqText);
      uint64_t v55 = [v4 objectForKeyedSubscript:v54];
      pwReqText = v5->_pwReqText;
      v5->_pwReqText = (NSString *)v55;
    }
    v57 = NSStringFromSelector(sel_pwReqRTFData);
    v58 = [v4 objectForKeyedSubscript:v57];
    objc_opt_class();
    char v59 = objc_opt_isKindOfClass();

    if (v59)
    {
      v60 = NSStringFromSelector(sel_pwReqRTFData);
      uint64_t v61 = [v4 objectForKeyedSubscript:v60];
      pwReqRTFData = v5->_pwReqRTFData;
      v5->_pwReqRTFData = (NSData *)v61;
    }
    v63 = NSStringFromSelector(sel_helpText);
    v64 = [v4 objectForKeyedSubscript:v63];
    objc_opt_class();
    char v65 = objc_opt_isKindOfClass();

    if (v65)
    {
      v66 = NSStringFromSelector(sel_helpText);
      uint64_t v67 = [v4 objectForKeyedSubscript:v66];
      helpText = v5->_helpText;
      v5->_helpText = (NSString *)v67;
    }
    v69 = NSStringFromSelector(sel_customUsernameLabel);
    v70 = [v4 objectForKeyedSubscript:v69];
    objc_opt_class();
    char v71 = objc_opt_isKindOfClass();

    if (v71)
    {
      v72 = NSStringFromSelector(sel_customUsernameLabel);
      uint64_t v73 = [v4 objectForKeyedSubscript:v72];
      customUsernameLabel = v5->_customUsernameLabel;
      v5->_customUsernameLabel = (NSString *)v73;
    }
    v75 = NSStringFromSelector(sel_cacheName);
    v76 = [v4 objectForKeyedSubscript:v75];
    objc_opt_class();
    char v77 = objc_opt_isKindOfClass();

    if (v77)
    {
      v78 = NSStringFromSelector(sel_cacheName);
      uint64_t v79 = [v4 objectForKeyedSubscript:v78];
      cacheName = v5->_cacheName;
      v5->_cacheName = (NSString *)v79;
    }
    v81 = NSStringFromSelector(sel_principalName);
    v82 = [v4 objectForKeyedSubscript:v81];
    objc_opt_class();
    char v83 = objc_opt_isKindOfClass();

    if (v83)
    {
      v84 = NSStringFromSelector(sel_principalName);
      uint64_t v85 = [v4 objectForKeyedSubscript:v84];
      principalName = v5->_principalName;
      v5->_principalName = (NSString *)v85;
    }
    v87 = NSStringFromSelector(sel_siteCode);
    v88 = [v4 objectForKeyedSubscript:v87];
    objc_opt_class();
    char v89 = objc_opt_isKindOfClass();

    if (v89)
    {
      v90 = NSStringFromSelector(sel_siteCode);
      uint64_t v91 = [v4 objectForKeyedSubscript:v90];
      siteCode = v5->_siteCode;
      v5->_siteCode = (NSString *)v91;
    }
    v93 = NSStringFromSelector(sel_certificateUUID);
    v94 = [v4 objectForKeyedSubscript:v93];
    objc_opt_class();
    char v95 = objc_opt_isKindOfClass();

    if (v95)
    {
      v96 = NSStringFromSelector(sel_certificateUUID);
      uint64_t v97 = [v4 objectForKeyedSubscript:v96];
      certificateUUID = v5->_certificateUUID;
      v5->_certificateUUID = (NSString *)v97;
    }
    v99 = NSStringFromSelector(sel_useSiteAutoDiscovery);
    v100 = [v4 objectForKeyedSubscript:v99];

    if (v100)
    {
      v101 = NSStringFromSelector(sel_useSiteAutoDiscovery);
      v102 = [v4 objectForKeyedSubscript:v101];
      v5->_useSiteAutoDiscovery = [v102 BOOLValue];
    }
    else
    {
      v5->_useSiteAutoDiscovery = 1;
    }
    v103 = NSStringFromSelector(sel_allowAutomaticLogin);
    v104 = [v4 objectForKeyedSubscript:v103];

    if (v104)
    {
      v105 = NSStringFromSelector(sel_allowAutomaticLogin);
      v106 = [v4 objectForKeyedSubscript:v105];
      v5->_allowAutomaticLogin = [v106 BOOLValue];
    }
    else
    {
      v5->_allowAutomaticLogin = 1;
    }
    v107 = NSStringFromSelector(sel_requireUserPresence);
    v108 = [v4 objectForKeyedSubscript:v107];

    if (v108)
    {
      v109 = NSStringFromSelector(sel_requireUserPresence);
      v110 = [v4 objectForKeyedSubscript:v109];
      v5->_requireUserPresence = [v110 BOOLValue];
    }
    else
    {
      v5->_requireUserPresence = 0;
    }
    v111 = NSStringFromSelector(sel_monitorCredentialsCache);
    v112 = [v4 objectForKeyedSubscript:v111];

    if (v112)
    {
      v113 = NSStringFromSelector(sel_monitorCredentialsCache);
      v114 = [v4 objectForKeyedSubscript:v113];
      v5->_monitorCredentialsCache = [v114 BOOLValue];
    }
    else
    {
      v5->_monitorCredentialsCache = 1;
    }
    v115 = NSStringFromSelector(sel_replicationTime);
    v116 = [v4 objectForKeyedSubscript:v115];
    objc_opt_class();
    char v117 = objc_opt_isKindOfClass();

    if (v117)
    {
      v118 = NSStringFromSelector(sel_replicationTime);
      uint64_t v119 = [v4 objectForKeyedSubscript:v118];
      replicationTime = v5->_replicationTime;
      v5->_replicationTime = (NSNumber *)v119;
    }
    else
    {
      uint64_t v121 = [NSNumber numberWithDouble:1800.0];
      v118 = v5->_replicationTime;
      v5->_replicationTime = (NSNumber *)v121;
    }

    v122 = NSStringFromSelector(sel_credentialBundleIdACL);
    v123 = [v4 objectForKeyedSubscript:v122];

    if (v123)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v124 = [MEMORY[0x263EFF980] array];
        long long v252 = 0u;
        long long v253 = 0u;
        long long v254 = 0u;
        long long v255 = 0u;
        id v125 = v123;
        uint64_t v126 = [v125 countByEnumeratingWithState:&v252 objects:v260 count:16];
        if (v126)
        {
          uint64_t v127 = v126;
          uint64_t v128 = *(void *)v253;
          do
          {
            for (uint64_t i = 0; i != v127; ++i)
            {
              if (*(void *)v253 != v128) {
                objc_enumerationMutation(v125);
              }
              uint64_t v130 = *(void *)(*((void *)&v252 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                [v124 addObject:v130];
              }
            }
            uint64_t v127 = [v125 countByEnumeratingWithState:&v252 objects:v260 count:16];
          }
          while (v127);
        }

        uint64_t v131 = [v124 copy];
        credentialBundleIdACL = v5->_credentialBundleIdACL;
        v5->_credentialBundleIdACL = (NSArray *)v131;
      }
    }
    v133 = NSStringFromSelector(sel_domainRealmMapping);
    v134 = [v4 objectForKeyedSubscript:v133];

    v235 = v134;
    if (v134)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v230 = v123;
        v232 = v5;
        id v233 = v4;
        v237 = [MEMORY[0x263EFF9A0] dictionary];
        long long v248 = 0u;
        long long v249 = 0u;
        long long v250 = 0u;
        long long v251 = 0u;
        id v239 = v134;
        obuint64_t j = [v239 allKeys];
        uint64_t v135 = [obj countByEnumeratingWithState:&v248 objects:v259 count:16];
        if (v135)
        {
          uint64_t v136 = v135;
          uint64_t v238 = *(void *)v249;
          do
          {
            for (uint64_t j = 0; j != v136; ++j)
            {
              if (*(void *)v249 != v238) {
                objc_enumerationMutation(obj);
              }
              uint64_t v138 = *(void *)(*((void *)&v248 + 1) + 8 * j);
              v139 = [MEMORY[0x263EFF980] array];
              v140 = [v239 objectForKeyedSubscript:v138];
              long long v244 = 0u;
              long long v245 = 0u;
              long long v246 = 0u;
              long long v247 = 0u;
              id v141 = v140;
              uint64_t v142 = [v141 countByEnumeratingWithState:&v244 objects:v258 count:16];
              if (v142)
              {
                uint64_t v143 = v142;
                uint64_t v144 = *(void *)v245;
                do
                {
                  for (uint64_t k = 0; k != v143; ++k)
                  {
                    if (*(void *)v245 != v144) {
                      objc_enumerationMutation(v141);
                    }
                    uint64_t v146 = *(void *)(*((void *)&v244 + 1) + 8 * k);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass()) {
                      [v139 addObject:v146];
                    }
                  }
                  uint64_t v143 = [v141 countByEnumeratingWithState:&v244 objects:v258 count:16];
                }
                while (v143);
              }

              if ([v139 count]) {
                [v237 setObject:v139 forKeyedSubscript:v138];
              }
            }
            uint64_t v136 = [obj countByEnumeratingWithState:&v248 objects:v259 count:16];
          }
          while (v136);
        }

        uint64_t v147 = [v237 copy];
        v5 = v232;
        domainRealmMapping = v232->_domainRealmMapping;
        v232->_domainRealmMapping = (NSDictionary *)v147;

        id v4 = v233;
        v123 = v230;
      }
    }
    v149 = NSStringFromSelector(sel_isDefaultRealm);
    v150 = [v4 objectForKeyedSubscript:v149];

    if (v150)
    {
      v151 = NSStringFromSelector(sel_isDefaultRealm);
      v152 = [v4 objectForKeyedSubscript:v151];
      v5->_isDefaultRealuint64_t m = [v152 BOOLValue];
    }
    else
    {
      v5->_isDefaultRealuint64_t m = 0;
    }
    v153 = NSStringFromSelector(sel_allowPasswordChange);
    v154 = [v4 objectForKeyedSubscript:v153];

    if (v154)
    {
      v155 = NSStringFromSelector(sel_allowPasswordChange);
      v156 = [v4 objectForKeyedSubscript:v155];
      v5->_allowPasswordChange = [v156 BOOLValue];
    }
    else
    {
      v5->_allowPasswordChange = 1;
    }
    v157 = NSStringFromSelector(sel_delayUserSetup);
    v158 = [v4 objectForKeyedSubscript:v157];

    if (v158)
    {
      v159 = NSStringFromSelector(sel_delayUserSetup);
      v160 = [v4 objectForKeyedSubscript:v159];
      v5->_delayUserSetup = [v160 BOOLValue];
    }
    else
    {
      v5->_delayUserSetup = 0;
    }
    v161 = NSStringFromSelector(sel_requireTLSForLDAP);
    v162 = [v4 objectForKeyedSubscript:v161];

    if (v162)
    {
      v163 = NSStringFromSelector(sel_requireTLSForLDAP);
      v164 = [v4 objectForKeyedSubscript:v163];
      v5->_requireTLSForLDAP = [v164 BOOLValue];
    }
    else
    {
      v5->_requireTLSForLDAP = 0;
    }
    v165 = NSStringFromSelector(sel_includeManagedAppsInBundleIdACL);
    v166 = [v4 objectForKeyedSubscript:v165];

    if (v166)
    {
      v167 = NSStringFromSelector(sel_includeManagedAppsInBundleIdACL);
      v168 = [v4 objectForKeyedSubscript:v167];
      v5->_includeManagedAppsInBundleIdACL = [v168 BOOLValue];
    }
    else
    {
      v5->_includeManagedAppsInBundleIdACL = 0;
    }
    v169 = NSStringFromSelector(sel_includeKerberosAppsInBundleIdACL);
    v170 = [v4 objectForKeyedSubscript:v169];

    if (v170)
    {
      v171 = NSStringFromSelector(sel_includeKerberosAppsInBundleIdACL);
      v172 = [v4 objectForKeyedSubscript:v171];
      v5->_includeKerberosAppsInBundleIdACL = [v172 BOOLValue];
    }
    else
    {
      v5->_includeKerberosAppsInBundleIdACL = 0;
    }
    v173 = NSStringFromSelector(sel_credentialUseMode);
    v174 = [v4 objectForKeyedSubscript:v173];
    objc_opt_class();
    char v175 = objc_opt_isKindOfClass();

    if (v175)
    {
      v176 = NSStringFromSelector(sel_credentialUseMode);
      v177 = [v4 objectForKeyedSubscript:v176];

      if ([v177 isEqualToString:@"kerberosDefault"]) {
        v5->_credentialUseMode = 0;
      }
      if ([v177 isEqualToString:@"whenNotSpecified"]) {
        v5->_credentialUseMode = 1;
      }
      if ([v177 isEqualToString:@"always"]) {
        v5->_credentialUseMode = 2;
      }
    }
    else
    {
      v5->_credentialUseMode = 2;
    }
    if ([MEMORY[0x263F25290] isInternalBuild])
    {
      v178 = NSStringFromSelector(sel_password);
      v179 = [v4 objectForKeyedSubscript:v178];
      objc_opt_class();
      char v180 = objc_opt_isKindOfClass();

      if (v180)
      {
        v181 = NSStringFromSelector(sel_password);
        uint64_t v182 = [v4 objectForKeyedSubscript:v181];
        password = v5->_password;
        v5->_password = (NSString *)v182;
      }
    }
    v184 = NSStringFromSelector(sel_preferredKDCs);
    v185 = [v4 objectForKeyedSubscript:v184];

    if (v185)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v231 = v123;
        id v234 = v4;
        v186 = [MEMORY[0x263EFF980] array];
        long long v240 = 0u;
        long long v241 = 0u;
        long long v242 = 0u;
        long long v243 = 0u;
        id v187 = v185;
        uint64_t v188 = [v187 countByEnumeratingWithState:&v240 objects:v257 count:16];
        if (v188)
        {
          uint64_t v189 = v188;
          uint64_t v190 = *(void *)v241;
          do
          {
            for (uint64_t m = 0; m != v189; ++m)
            {
              if (*(void *)v241 != v190) {
                objc_enumerationMutation(v187);
              }
              uint64_t v192 = *(void *)(*((void *)&v240 + 1) + 8 * m);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v193 = +[SOKerberosServer serverWithString:v192];

                if (v193) {
                  [v186 addObject:v192];
                }
              }
            }
            uint64_t v189 = [v187 countByEnumeratingWithState:&v240 objects:v257 count:16];
          }
          while (v189);
        }

        uint64_t v194 = [v186 copy];
        preferredKDCs = v5->_preferredKDCs;
        v5->_preferredKDCs = (NSArray *)v194;

        id v4 = v234;
        v123 = v231;
      }
    }
    v196 = NSStringFromSelector(sel_usePlatformSSOTGT);
    v197 = [v4 objectForKeyedSubscript:v196];

    if (v197)
    {
      v198 = NSStringFromSelector(sel_usePlatformSSOTGT);
      v199 = [v4 objectForKeyedSubscript:v198];
      v5->_usePlatformSSOTGT = [v199 BOOLValue];
    }
    else
    {
      v5->_usePlatformSSOTGT = 0;
    }
    v200 = NSStringFromSelector(sel_allowPlatformSSOAuthFallback);
    v201 = [v4 objectForKeyedSubscript:v200];

    if (v201)
    {
      v202 = NSStringFromSelector(sel_allowPlatformSSOAuthFallback);
      v203 = [v4 objectForKeyedSubscript:v202];
      v5->_allowPlatformSSOAuthFallbacuint64_t k = [v203 BOOLValue];
    }
    else
    {
      v5->_allowPlatformSSOAuthFallbacuint64_t k = 1;
    }
    v204 = NSStringFromSelector(sel_performKerberosOnly);
    v205 = [v4 objectForKeyedSubscript:v204];

    if (v205)
    {
      v206 = NSStringFromSelector(sel_performKerberosOnly);
      v207 = [v4 objectForKeyedSubscript:v206];
      v5->_performKerberosOnly = [v207 BOOLValue];
    }
    else
    {
      v5->_performKerberosOnly = 0;
    }
    v208 = NSStringFromSelector(sel_identityIssuerAutoSelectFilter);
    v209 = [v4 objectForKeyedSubscript:v208];

    if (v209)
    {
      v210 = NSStringFromSelector(sel_identityIssuerAutoSelectFilter);
      uint64_t v211 = [v4 objectForKeyedSubscript:v210];
      identityIssuerAutoSelectFilter = v5->_identityIssuerAutoSelectFilter;
      v5->_identityIssuerAutoSelectFilter = (NSString *)v211;
    }
    else
    {
      v5->_performKerberosOnly = 0;
    }
    v213 = NSStringFromSelector(sel_allowSmartCard);
    v214 = [v4 objectForKeyedSubscript:v213];

    if (v214)
    {
      v215 = NSStringFromSelector(sel_allowSmartCard);
      uint64_t v216 = [v4 objectForKeyedSubscript:v215];
      allowSmartCard = v5->_allowSmartCard;
      v5->_allowSmartCard = (NSNumber *)v216;
    }
    else
    {
      v215 = v5->_allowSmartCard;
      v5->_allowSmartCard = (NSNumber *)MEMORY[0x263EFFA88];
    }

    v218 = NSStringFromSelector(sel_allowPassword);
    v219 = [v4 objectForKeyedSubscript:v218];

    if (v219)
    {
      v220 = NSStringFromSelector(sel_allowPassword);
      uint64_t v221 = [v4 objectForKeyedSubscript:v220];
      allowPassword = v5->_allowPassword;
      v5->_allowPassword = (NSNumber *)v221;
    }
    else
    {
      v220 = v5->_allowPassword;
      v5->_allowPassword = (NSNumber *)MEMORY[0x263EFFA88];
    }

    v223 = NSStringFromSelector(sel_startInSmartCardMode);
    v224 = [v4 objectForKeyedSubscript:v223];

    if (v224)
    {
      v225 = NSStringFromSelector(sel_startInSmartCardMode);
      uint64_t v226 = [v4 objectForKeyedSubscript:v225];
      startInSmartCardMode = v5->_startInSmartCardMode;
      v5->_startInSmartCardMode = (NSNumber *)v226;
    }
    else
    {
      v225 = v5->_startInSmartCardMode;
      v5->_startInSmartCardMode = (NSNumber *)MEMORY[0x263EFFA80];
    }
  }
  v228 = v5;

  return v228;
}

- (NSString)cacheName
{
  return self->_cacheName;
}

- (void)setCacheName:(id)a3
{
}

- (NSString)principalName
{
  return self->_principalName;
}

- (void)setPrincipalName:(id)a3
{
}

- (NSString)siteCode
{
  return self->_siteCode;
}

- (void)setSiteCode:(id)a3
{
}

- (NSString)certificateUUID
{
  return self->_certificateUUID;
}

- (void)setCertificateUUID:(id)a3
{
}

- (BOOL)useSiteAutoDiscovery
{
  return self->_useSiteAutoDiscovery;
}

- (void)setUseSiteAutoDiscovery:(BOOL)a3
{
  self->_useSiteAutoDiscovery = a3;
}

- (NSArray)credentialBundleIdACL
{
  return self->_credentialBundleIdACL;
}

- (void)setCredentialBundleIdACL:(id)a3
{
}

- (BOOL)includeManagedAppsInBundleIdACL
{
  return self->_includeManagedAppsInBundleIdACL;
}

- (void)setIncludeManagedAppsInBundleIdACL:(BOOL)a3
{
  self->_includeManagedAppsInBundleIdACL = a3;
}

- (BOOL)includeKerberosAppsInBundleIdACL
{
  return self->_includeKerberosAppsInBundleIdACL;
}

- (void)setIncludeKerberosAppsInBundleIdACL:(BOOL)a3
{
  self->_includeKerberosAppsInBundleIdACL = a3;
}

- (NSDictionary)domainRealmMapping
{
  return self->_domainRealmMapping;
}

- (void)setDomainRealmMapping:(id)a3
{
}

- (BOOL)isDefaultRealm
{
  return self->_isDefaultRealm;
}

- (void)setIsDefaultRealm:(BOOL)a3
{
  self->_isDefaultRealuint64_t m = a3;
}

- (BOOL)allowPasswordChange
{
  return self->_allowPasswordChange;
}

- (void)setAllowPasswordChange:(BOOL)a3
{
  self->_allowPasswordChange = a3;
}

- (BOOL)allowAutomaticLogin
{
  return self->_allowAutomaticLogin;
}

- (void)setAllowAutomaticLogin:(BOOL)a3
{
  self->_allowAutomaticLogin = a3;
}

- (BOOL)requireUserPresence
{
  return self->_requireUserPresence;
}

- (void)setRequireUserPresence:(BOOL)a3
{
  self->_requireUserPresence = a3;
}

- (NSString)pwChangeURL
{
  return self->_pwChangeURL;
}

- (void)setPwChangeURL:(id)a3
{
}

- (NSNumber)pwExpireOverride
{
  return self->_pwExpireOverride;
}

- (void)setPwExpireOverride:(id)a3
{
}

- (NSNumber)pwNotificationDays
{
  return self->_pwNotificationDays;
}

- (void)setPwNotificationDays:(id)a3
{
}

- (BOOL)pwReqComplexity
{
  return self->_pwReqComplexity;
}

- (void)setPwReqComplexity:(BOOL)a3
{
  self->_pwReqComplexity = a3;
}

- (NSNumber)pwReqLength
{
  return self->_pwReqLength;
}

- (void)setPwReqLength:(id)a3
{
}

- (NSNumber)pwReqMinAge
{
  return self->_pwReqMinAge;
}

- (void)setPwReqMinAge:(id)a3
{
}

- (NSNumber)pwReqHistory
{
  return self->_pwReqHistory;
}

- (void)setPwReqHistory:(id)a3
{
}

- (NSString)pwReqText
{
  return self->_pwReqText;
}

- (void)setPwReqText:(id)a3
{
}

- (NSData)pwReqRTFData
{
  return self->_pwReqRTFData;
}

- (void)setPwReqRTFData:(id)a3
{
}

- (NSString)helpText
{
  return self->_helpText;
}

- (void)setHelpText:(id)a3
{
}

- (NSString)customUsernameLabel
{
  return self->_customUsernameLabel;
}

- (void)setCustomUsernameLabel:(id)a3
{
}

- (NSNumber)replicationTime
{
  return self->_replicationTime;
}

- (void)setReplicationTime:(id)a3
{
}

- (BOOL)syncLocalPassword
{
  return self->_syncLocalPassword;
}

- (void)setSyncLocalPassword:(BOOL)a3
{
  self->_syncLocalPassword = a3;
}

- (BOOL)monitorCredentialsCache
{
  return self->_monitorCredentialsCache;
}

- (void)setMonitorCredentialsCache:(BOOL)a3
{
  self->_monitorCredentialsCache = a3;
}

- (BOOL)delayUserSetup
{
  return self->_delayUserSetup;
}

- (void)setDelayUserSetup:(BOOL)a3
{
  self->_delayUserSetup = a3;
}

- (int64_t)credentialUseMode
{
  return self->_credentialUseMode;
}

- (void)setCredentialUseMode:(int64_t)a3
{
  self->_credentialUseMode = a3;
}

- (BOOL)requireTLSForLDAP
{
  return self->_requireTLSForLDAP;
}

- (void)setRequireTLSForLDAP:(BOOL)a3
{
  self->_requireTLSForLDAP = a3;
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (NSArray)preferredKDCs
{
  return self->_preferredKDCs;
}

- (void)setPreferredKDCs:(id)a3
{
}

- (BOOL)usePlatformSSOTGT
{
  return self->_usePlatformSSOTGT;
}

- (void)setUsePlatformSSOTGT:(BOOL)a3
{
  self->_usePlatformSSOTGT = a3;
}

- (BOOL)allowPlatformSSOAuthFallback
{
  return self->_allowPlatformSSOAuthFallback;
}

- (void)setAllowPlatformSSOAuthFallback:(BOOL)a3
{
  self->_allowPlatformSSOAuthFallbacuint64_t k = a3;
}

- (BOOL)performKerberosOnly
{
  return self->_performKerberosOnly;
}

- (void)setPerformKerberosOnly:(BOOL)a3
{
  self->_performKerberosOnly = a3;
}

- (NSString)identityIssuerAutoSelectFilter
{
  return self->_identityIssuerAutoSelectFilter;
}

- (void)setIdentityIssuerAutoSelectFilter:(id)a3
{
}

- (NSNumber)allowSmartCard
{
  return self->_allowSmartCard;
}

- (void)setAllowSmartCard:(id)a3
{
}

- (NSNumber)allowPassword
{
  return self->_allowPassword;
}

- (void)setAllowPassword:(id)a3
{
}

- (NSNumber)startInSmartCardMode
{
  return self->_startInSmartCardMode;
}

- (void)setStartInSmartCardMode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startInSmartCardMode, 0);
  objc_storeStrong((id *)&self->_allowPassword, 0);
  objc_storeStrong((id *)&self->_allowSmartCard, 0);
  objc_storeStrong((id *)&self->_identityIssuerAutoSelectFilter, 0);
  objc_storeStrong((id *)&self->_preferredKDCs, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_replicationTime, 0);
  objc_storeStrong((id *)&self->_customUsernameLabel, 0);
  objc_storeStrong((id *)&self->_helpText, 0);
  objc_storeStrong((id *)&self->_pwReqRTFData, 0);
  objc_storeStrong((id *)&self->_pwReqText, 0);
  objc_storeStrong((id *)&self->_pwReqHistory, 0);
  objc_storeStrong((id *)&self->_pwReqMinAge, 0);
  objc_storeStrong((id *)&self->_pwReqLength, 0);
  objc_storeStrong((id *)&self->_pwNotificationDays, 0);
  objc_storeStrong((id *)&self->_pwExpireOverride, 0);
  objc_storeStrong((id *)&self->_pwChangeURL, 0);
  objc_storeStrong((id *)&self->_domainRealmMapping, 0);
  objc_storeStrong((id *)&self->_credentialBundleIdACL, 0);
  objc_storeStrong((id *)&self->_certificateUUID, 0);
  objc_storeStrong((id *)&self->_siteCode, 0);
  objc_storeStrong((id *)&self->_principalName, 0);
  objc_storeStrong((id *)&self->_cacheName, 0);
}

@end