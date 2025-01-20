@interface GKAppleIDAuthenticationDelegate
- (NSString)delegateServiceIdentifier;
- (void)didReceiveAuthenticationResponseParameters:(id)a3 accountStore:(id)a4 account:(id)a5 completion:(id)a6;
@end

@implementation GKAppleIDAuthenticationDelegate

- (NSString)delegateServiceIdentifier
{
  return (NSString *)GKGameCenterIdentifier;
}

- (void)didReceiveAuthenticationResponseParameters:(id)a3 accountStore:(id)a4 account:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void (**)(void))a6;
  if (!v12)
  {
    v13 = +[NSString stringWithFormat:@"Assertion failed"];
    v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GameCenterAppleIDAuthenticationDelegate/GKAppleIDAuthenticationDelegate.m"];
    id v15 = [v14 lastPathComponent];
    v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (completion != ((void *)0))\n[%s (%s:%d)]", v13, "-[GKAppleIDAuthenticationDelegate didReceiveAuthenticationResponseParameters:accountStore:account:completion:]", [v15 UTF8String], 75);

    v12 = 0;
    +[NSException raise:@"GameKit Exception", @"%@", v16 format];
  }
  id v17 = objc_alloc((Class)NSUserDefaults);
  id v207 = [v17 initWithSuiteName:GKDaemonIdentifier];
  v18 = [v207 objectForKey:GKOptedOutOfGameCenter];
  unsigned int v19 = [v18 BOOLValue];

  if (v19)
  {
    v20 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v21 = (id)GKOSLoggers();
      v20 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "GKAppleIDAuthenticationDelegate ignoring authentication response since user has opted out of game center.", buf, 2u);
    }
LABEL_17:
    v12[2](v12);
LABEL_18:
    v36 = v207;
    goto LABEL_19;
  }
  v22 = [v9 objectForKeyedSubscript:@"com.apple.gamecenter"];

  if (v22)
  {
    uint64_t v23 = [v9 objectForKeyedSubscript:@"com.apple.gamecenter"];

    id v9 = (id)v23;
  }
  block = v12;
  v24 = +[GKPreferences shared];
  if ([v24 isAccountModificationRestricted])
  {

LABEL_13:
    if (!os_log_GKGeneral) {
      id v27 = (id)GKOSLoggers();
    }
    v28 = os_log_GKAccount;
    v12 = block;
    if (os_log_type_enabled(os_log_GKAccount, OS_LOG_TYPE_DEBUG)) {
      sub_64E8(v28, v29, v30, v31, v32, v33, v34, v35);
    }
    goto LABEL_17;
  }
  v25 = +[GKPreferences shared];
  unsigned int v26 = [v25 isGameCenterRestricted];

  if (v26) {
    goto LABEL_13;
  }
  v37 = [v9 objectForKeyedSubscript:@"status"];
  unsigned int v38 = [v37 intValue];

  if (v38)
  {
    v39 = [v9 objectForKeyedSubscript:@"status-message"];
    if (!os_log_GKGeneral) {
      id v40 = (id)GKOSLoggers();
    }
    v41 = os_log_GKAccount;
    v12 = block;
    if (os_log_type_enabled(os_log_GKAccount, OS_LOG_TYPE_ERROR)) {
      sub_6590((uint64_t)v39, v41);
    }
    block[2](block);

    goto LABEL_18;
  }
  v42 = [v11 accountType];
  v43 = [v42 identifier];
  uint64_t v191 = ACAccountTypeIdentifierAppleAccount;
  unsigned __int8 v44 = objc_msgSend(v43, "isEqualToString:");

  v45 = (void *)os_log_GKGeneral;
  if ((v44 & 1) == 0)
  {
    if (!os_log_GKGeneral) {
      id v70 = (id)GKOSLoggers();
    }
    v71 = os_log_GKAccount;
    v12 = block;
    if (os_log_type_enabled(os_log_GKAccount, OS_LOG_TYPE_DEBUG)) {
      sub_6558(v71, v72, v73, v74, v75, v76, v77, v78);
    }
    goto LABEL_17;
  }
  if (!os_log_GKGeneral)
  {
    id v46 = (id)GKOSLoggers();
    v45 = (void *)os_log_GKGeneral;
  }
  v47 = v45;
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v231 = (uint64_t)v11;
    _os_log_impl(&dword_0, v47, OS_LOG_TYPE_INFO, "GKAppleIDAuthenticationDelegate inAccount:%@", buf, 0xCu);
  }

  v48 = (void *)os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v49 = (id)GKOSLoggers();
    v48 = (void *)os_log_GKGeneral;
  }
  v50 = v48;
  v12 = block;
  if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v231 = (uint64_t)v9;
    _os_log_impl(&dword_0, v50, OS_LOG_TYPE_INFO, "GKAppleIDAuthenticationDelegate parameters:%@", buf, 0xCu);
  }

  v194 = [v9 objectForKeyedSubscript:@"alias"];
  v193 = [v9 objectForKeyedSubscript:@"firstName"];
  v192 = [v9 objectForKeyedSubscript:@"lastName"];
  uint64_t v51 = [v9 objectForKeyedSubscript:GKAppleIDKey];
  uint64_t v198 = [v9 objectForKeyedSubscript:@"dsid"];
  uint64_t v52 = [v9 objectForKeyedSubscript:@"altDSID"];
  v195 = [v9 objectForKeyedSubscript:GKPlayerIDKey];
  v196 = [v9 objectForKeyedSubscript:@"auth-token"];
  uint64_t v53 = v52;
  v54 = [v9 objectForKeyedSubscript:GKEnvironmentKey];
  v204 = (char *)+[GKPreferences environmentForString:v54];

  if (!v53)
  {
    uint64_t v53 = [v9 objectForKeyedSubscript:@"alternate-dsid"];
  }
  v55 = (void *)v51;
  v197 = (void *)v53;
  if (v51 && v198 | v53 && v196 && v195)
  {
    v56 = (void *)os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v57 = (id)GKOSLoggers();
      v56 = (void *)os_log_GKGeneral;
    }
    v58 = v56;
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v231 = v51;
      _os_log_impl(&dword_0, v58, OS_LOG_TYPE_INFO, "GKAppleIDAuthenticationDelegate: Looking for GC account with username: %@", buf, 0xCu);
    }
    v200 = (void *)v51;

    uint64_t v187 = ACAccountTypeIdentifierGameCenter;
    objc_msgSend(v10, "accountsWithAccountTypeIdentifier:");
    long long v223 = 0u;
    long long v224 = 0u;
    long long v225 = 0u;
    long long v226 = 0u;
    id v59 = (id)objc_claimAutoreleasedReturnValue();
    id v60 = [v59 countByEnumeratingWithState:&v223 objects:v229 count:16];
    id v189 = v9;
    v190 = v10;
    v188 = v11;
    if (v60)
    {
      id v61 = v60;
      uint64_t v62 = *(void *)v224;
      while (2)
      {
        for (i = 0; i != v61; i = (char *)i + 1)
        {
          if (*(void *)v224 != v62) {
            objc_enumerationMutation(v59);
          }
          v199 = *(void **)(*((void *)&v223 + 1) + 8 * i);
          v64 = [v199 username];
          unsigned int v65 = [v64 isEqualToString:v51];

          if (v65)
          {
            id v81 = v199;
            v82 = (void *)os_log_GKGeneral;
            if (!os_log_GKGeneral)
            {
              id v83 = (id)GKOSLoggers();
              v82 = (void *)os_log_GKGeneral;
            }
            v84 = v82;
            if (!os_log_type_enabled(v84, OS_LOG_TYPE_INFO)) {
              goto LABEL_82;
            }
            v85 = [v81 username];
            *(_DWORD *)buf = 138412290;
            uint64_t v231 = (uint64_t)v85;
            v86 = "GKAppleIDAuthenticationDelegate: will populate existing account '%@' with production token";
            v87 = v84;
            uint32_t v88 = 12;
LABEL_81:
            _os_log_impl(&dword_0, v87, OS_LOG_TYPE_INFO, v86, buf, v88);

            goto LABEL_82;
          }
          if (v197)
          {
            v66 = [v199 accountPropertyForKey:@"altDSID"];
            unsigned int v67 = [v66 isEqualToString:v197];

            if (v67)
            {
              id v89 = v199;
              v90 = (void *)os_log_GKGeneral;
              if (!os_log_GKGeneral)
              {
                id v91 = (id)GKOSLoggers();
                v90 = (void *)os_log_GKGeneral;
              }
              v84 = v90;
              if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
              {
                v85 = [v89 username];
                *(_DWORD *)buf = 138412546;
                uint64_t v231 = (uint64_t)v85;
                __int16 v232 = 2112;
                uint64_t v233 = v51;
                v86 = "GKAppleIDAuthenticationDelegate: found a gamecenter ACAccount (%@) with same altDSID than incoming account:%@";
                goto LABEL_80;
              }
LABEL_82:

              char v202 = 0;
              goto LABEL_83;
            }
          }
          if (v198)
          {
            v68 = [v199 accountPropertyForKey:@"dsid"];
            unsigned int v69 = [v68 isEqualToString:v198];

            if (v69)
            {
              id v92 = v199;
              v93 = (void *)os_log_GKGeneral;
              if (!os_log_GKGeneral)
              {
                id v94 = (id)GKOSLoggers();
                v93 = (void *)os_log_GKGeneral;
              }
              v84 = v93;
              if (!os_log_type_enabled(v84, OS_LOG_TYPE_INFO)) {
                goto LABEL_82;
              }
              v85 = [v92 username];
              *(_DWORD *)buf = 138412546;
              uint64_t v231 = (uint64_t)v85;
              __int16 v232 = 2112;
              uint64_t v233 = v51;
              v86 = "GKAppleIDAuthenticationDelegate: found a gamecenter ACAccount (%@) with same dsid than incoming account:%@";
LABEL_80:
              v87 = v84;
              uint32_t v88 = 22;
              goto LABEL_81;
            }
          }
        }
        id v61 = [v59 countByEnumeratingWithState:&v223 objects:v229 count:16];
        v199 = 0;
        char v202 = 1;
        if (v61) {
          continue;
        }
        break;
      }
    }
    else
    {
      v199 = 0;
      char v202 = 1;
    }
LABEL_83:

    long long v221 = 0u;
    long long v222 = 0u;
    long long v219 = 0u;
    long long v220 = 0u;
    id obj = v59;
    id v95 = [obj countByEnumeratingWithState:&v219 objects:v228 count:16];
    v96 = (void **)&GKOSLoggers_ptr;
    if (v95)
    {
      id v97 = v95;
      char v201 = 0;
      uint64_t v98 = *(void *)v220;
      CFStringRef v99 = @"<gone>";
      do
      {
        v100 = 0;
        id v205 = v97;
        do
        {
          if (*(void *)v220 != v98) {
            objc_enumerationMutation(obj);
          }
          v101 = *(void **)(*((void *)&v219 + 1) + 8 * (void)v100);
          v102 = [v101 credential];
          v103 = [v102 token];

          if (v103)
          {
            if (([v103 isEqualToString:v99] & 1) == 0)
            {
              [v96[56] numberWithInteger:v204];
              uint64_t v104 = v98;
              CFStringRef v105 = v99;
              v107 = v106 = v96;
              v108 = +[NSString stringWithFormat:@"GKCredentialScope-%@", v107];
              v109 = [v101 accountPropertyForKey:v108];
              unsigned __int8 v110 = [v109 unsignedIntegerValue];

              v96 = v106;
              CFStringRef v99 = v105;
              uint64_t v98 = v104;
              id v97 = v205;
              if ((v110 & 4) != 0)
              {
                v111 = (void *)os_log_GKGeneral;
                if (!os_log_GKGeneral)
                {
                  id v112 = (id)GKOSLoggers();
                  v111 = (void *)os_log_GKGeneral;
                }
                v113 = v111;
                if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
                {
                  v114 = [v101 username];
                  *(_DWORD *)buf = 138412290;
                  uint64_t v231 = (uint64_t)v114;
                  _os_log_impl(&dword_0, v113, OS_LOG_TYPE_INFO, "GKAppleIDAuthenticationDelegate: Existing primary production account '%@'", buf, 0xCu);
                }
                char v201 = 1;
                char v202 = 0;
              }
            }
          }

          v100 = (char *)v100 + 1;
        }
        while (v97 != v100);
        id v97 = [obj countByEnumeratingWithState:&v219 objects:v228 count:16];
      }
      while (v97);
    }
    else
    {
      char v201 = 0;
    }

    v115 = (void *)os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v116 = (id)GKOSLoggers();
      v115 = (void *)os_log_GKGeneral;
    }
    v117 = v115;
    id v10 = v190;
    id v11 = v188;
    v12 = block;
    if (os_log_type_enabled(v117, OS_LOG_TYPE_INFO))
    {
      CFStringRef v118 = @"NO";
      if (v202) {
        CFStringRef v119 = @"YES";
      }
      else {
        CFStringRef v119 = @"NO";
      }
      if (v201) {
        CFStringRef v118 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v231 = (uint64_t)v119;
      __int16 v232 = 2112;
      uint64_t v233 = (uint64_t)v118;
      _os_log_impl(&dword_0, v117, OS_LOG_TYPE_INFO, "GKAppleIDAuthenticationDelegate: looked at the existing account. We want to create a new GC account (%@), and existingPrimaryAccount is %@", buf, 0x16u);
    }

    id v9 = v189;
    if ((v202 & 1) != 0
      && ([v188 accountType],
          v120 = objc_claimAutoreleasedReturnValue(),
          [v120 identifier],
          v121 = objc_claimAutoreleasedReturnValue(),
          unsigned int v122 = [v121 isEqualToString:v191],
          v121,
          v120,
          v122))
    {
      v123 = (void *)os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        id v124 = (id)GKOSLoggers();
        v123 = (void *)os_log_GKGeneral;
      }
      v125 = v123;
      v55 = v200;
      if (os_log_type_enabled(v125, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v125, OS_LOG_TYPE_INFO, "GKAppleIDAuthenticationDelegate: No existing primary GC account found.", buf, 2u);
      }

      v126 = [v190 accountTypeWithIdentifier:v187];
      id v127 = [objc_alloc((Class)ACAccount) initWithAccountType:v126];

      [v127 setUsername:v200];
      v199 = v127;
    }
    else
    {
      v55 = v200;
    }
    v128 = (void *)os_log_GKGeneral;
    if (v199)
    {
      if (!os_log_GKGeneral)
      {
        id v129 = (id)GKOSLoggers();
        v128 = (void *)os_log_GKGeneral;
      }
      v130 = v128;
      if (os_log_type_enabled(v130, OS_LOG_TYPE_INFO))
      {
        v131 = [v199 shortDebugName];
        *(_DWORD *)buf = 138412290;
        uint64_t v231 = (uint64_t)v131;
        _os_log_impl(&dword_0, v130, OS_LOG_TYPE_INFO, "GKAppleIDAuthenticationDelegate: Updating token for account %@", buf, 0xCu);
      }
      v132 = [v199 credential];

      if (!v132)
      {
        id v133 = objc_alloc_init((Class)ACAccountCredential);
        [v199 setCredential:v133];
      }
      [v199 setAuthenticated:1];
      if (v204 == (unsigned char *)&dword_4 + 1)
      {
        v134 = [v199 credential];
        [v134 setToken:v196];
      }
      else
      {
        v144 = (void *)os_log_GKGeneral;
        if (!os_log_GKGeneral)
        {
          id v145 = (id)GKOSLoggers();
          v144 = (void *)os_log_GKGeneral;
        }
        v146 = v144;
        if (os_log_type_enabled(v146, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v146, OS_LOG_TYPE_INFO, "GKAppleIDAuthenticationDelegate: non production environment, set account property", buf, 2u);
        }

        v134 = [v96[56] numberWithInteger:v204];
        v147 = +[NSString stringWithFormat:@"GKEnvToken-%@", v134];
        [v199 setAccountProperty:v196 forKey:v147];
      }
      v148 = [v96[56] numberWithInteger:v204];
      v149 = +[NSString stringWithFormat:@"GKCredentialScope-%@", v148];
      if (v201)
      {
        v150 = [v199 accountPropertyForKey:v149];
        v151 = v96;
        unsigned __int8 v152 = [v150 unsignedIntegerValue];

        v148 = [v151[56] numberWithInteger:v204];
        v149 = +[NSString stringWithFormat:@"GKCredentialScope-%@", v148];
        if ((v152 & 4) != 0) {
          v153 = &off_8560;
        }
        else {
          v153 = &off_8578;
        }
        [v199 setAccountProperty:v153 forKey:v149];
        v96 = v151;
      }
      else
      {
        [v199 setAccountProperty:&off_8560 forKey:v149];
      }

      v154 = +[NSDate date];
      v155 = [v96[56] numberWithInteger:v204];
      v156 = +[NSString stringWithFormat:@"GKCredentialScope-%@-mod-date", v155];
      [v199 setAccountProperty:v154 forKey:v156];

      v157 = [v96[56] numberWithInteger:v204];
      v158 = +[NSString stringWithFormat:@"altDSID-%@", v157];
      [v199 setAccountProperty:v197 forKey:v158];

      [v199 setAccountProperty:v197 forKey:@"altDSID"];
      v159 = +[NSDate date];
      v160 = v96;
      v161 = [v96[56] numberWithInteger:v204];
      v162 = +[NSString stringWithFormat:@"altDSID-%@-mod-date", v161];
      [v199 setAccountProperty:v159 forKey:v162];

      [v199 setAccountProperty:v198 forKey:@"dsid"];
      [v199 setAccountProperty:v195 forKey:@"playerID"];
      v163 = (void *)os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        id v164 = (id)GKOSLoggers();
        v163 = (void *)os_log_GKGeneral;
      }
      v165 = v163;
      if (os_log_type_enabled(v165, OS_LOG_TYPE_INFO))
      {
        id v166 = [v199 accountProperties];
        *(_DWORD *)buf = 138412290;
        uint64_t v231 = (uint64_t)v166;
        _os_log_impl(&dword_0, v165, OS_LOG_TYPE_INFO, "GKAppleIDAuthenticationDelegate: all account properties: %@", buf, 0xCu);
      }
      [v199 setUsername:v200];
      [v199 setAccountDescription:v200];
      v167 = [v199 _gkPlayerInternal];
      +[GKContactsIntegrationUserSettings applySettingsToObject:v167 fromResults:v189];
      [v167 setAlias:v194];
      [v167 setFirstName:v193];
      [v167 setLastName:v192];
      v168 = +[GKPlayerInternal compositeNameForFirstName:v193 lastName:v192];
      [v167 setCompositeName:v168];

      [v167 setAccountName:v200];
      [v199 _gkSetPlayerInternal:v167];
      id v169 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
      if (v197)
      {
        if (!os_log_GKGeneral) {
          id v170 = (id)GKOSLoggers();
        }
        v171 = os_log_GKDaemon;
        if (os_log_type_enabled(v171, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v231 = (uint64_t)v197;
          _os_log_impl(&dword_0, v171, OS_LOG_TYPE_INFO, "GKAuth:telling authkit account is in use using altDSID:%@", buf, 0xCu);
        }

        [v169 setAppleIDWithAltDSID:v197 inUse:1 forService:6];
      }
      else if (v198)
      {
        v172 = objc_msgSend(v160[56], "numberWithLongLong:", objc_msgSend((id)v198, "longLongValue"));
        if (!os_log_GKGeneral) {
          id v173 = (id)GKOSLoggers();
        }
        v174 = os_log_GKDaemon;
        if (os_log_type_enabled(v174, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v231 = (uint64_t)v172;
          _os_log_impl(&dword_0, v174, OS_LOG_TYPE_INFO, "GKAuth:telling authkit account is in use using DSID:%@", buf, 0xCu);
        }

        [v169 setAppleIDWithDSID:v172 inUse:1 forService:6];
      }
      v206 = v169;
      v175 = dispatch_group_create();
      dispatch_group_enter(v175);
      v216[0] = _NSConcreteStackBlock;
      v216[1] = 3221225472;
      v216[2] = sub_6268;
      v216[3] = &unk_8208;
      id v176 = v199;
      id v217 = v176;
      v177 = v175;
      v218 = v177;
      [v190 saveAccount:v176 verify:0 dataclassActions:0 completion:v216];
      long long v214 = 0u;
      long long v215 = 0u;
      long long v212 = 0u;
      long long v213 = 0u;
      id v178 = obj;
      id v179 = [v178 countByEnumeratingWithState:&v212 objects:v227 count:16];
      if (v179)
      {
        id v180 = v179;
        uint64_t v181 = *(void *)v213;
        while (2)
        {
          for (j = 0; j != v180; j = (char *)j + 1)
          {
            if (*(void *)v213 != v181) {
              objc_enumerationMutation(v178);
            }
            v183 = *(void **)(*((void *)&v212 + 1) + 8 * (void)j);
            v184 = [v183 username];
            unsigned __int8 v185 = [v184 isEqualToString:v200];

            if ((v185 & 1) == 0)
            {
              [v183 setAccountProperty:&stru_8508 forKey:@"GKPlayerSelectedEnvironment"];
              dispatch_group_enter(v177);
              v209[0] = _NSConcreteStackBlock;
              v209[1] = 3221225472;
              v209[2] = sub_63BC;
              v209[3] = &unk_8208;
              id v210 = v176;
              v211 = v177;
              [v190 saveAccount:v183 verify:0 dataclassActions:0 completion:v209];

              goto LABEL_168;
            }
          }
          id v180 = [v178 countByEnumeratingWithState:&v212 objects:v227 count:16];
          if (v180) {
            continue;
          }
          break;
        }
      }
LABEL_168:

      v186 = dispatch_get_global_queue(0, 0);
      v12 = block;
      dispatch_group_notify(v177, v186, block);

      id v9 = v189;
      id v10 = v190;
      id v11 = v188;
      v55 = v200;
    }
    else
    {
      if (!os_log_GKGeneral) {
        id v135 = (id)GKOSLoggers();
      }
      v136 = os_log_GKAccount;
      if (os_log_type_enabled(os_log_GKAccount, OS_LOG_TYPE_DEBUG)) {
        sub_6520(v136, v137, v138, v139, v140, v141, v142, v143);
      }
      block[2](block);
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v79 = (id)GKOSLoggers();
    }
    v80 = os_log_GKAccount;
    if (os_log_type_enabled(os_log_GKAccount, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      uint64_t v231 = v51;
      __int16 v232 = 2112;
      uint64_t v233 = v198;
      __int16 v234 = 2112;
      v235 = v195;
      __int16 v236 = 2112;
      v237 = v196;
      _os_log_error_impl(&dword_0, v80, OS_LOG_TYPE_ERROR, "GKAppleIDAuthenticationDelegate did not receive the required parameters. Apple ID: %@ DSID: %@ playerID: %@ token: %@", buf, 0x2Au);
    }
    block[2](block);
  }
  v36 = v207;

LABEL_19:
}

@end