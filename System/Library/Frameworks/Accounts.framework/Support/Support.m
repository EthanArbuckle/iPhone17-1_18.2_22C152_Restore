uint64_t start()
{
  NSObject *v0;
  BOOL v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  uint64_t v39;
  void *i;
  void *v41;
  void *v42;
  BOOL v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  CFStringRef v100;
  id v101;
  CFStringRef v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  id v158;
  id v159;
  uint64_t v160;
  void *k;
  void *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  void *v171;
  uint64_t v172;
  uint64_t v173[2];
  id v174;
  id v175;
  void *v176;
  id v177;
  void *v178;
  uint64_t v179;
  id v180;
  CFStringRef v181;
  CFStringRef v182;
  id v183;
  id v184;
  id v185;
  id v186;
  id v187;
  id v188;
  id v189;
  id v190;
  void *j;
  id v192;
  id v193;
  long long v194;
  long long v195;
  long long v196;
  long long v197;
  long long v198;
  long long v199;
  long long v200;
  long long v201;
  long long v202;
  long long v203;
  long long v204;
  long long v205;
  void v206[5];
  int v207;
  unsigned char v208[128];
  id v209;
  id v210;
  unsigned char v211[128];
  unsigned char v212[128];

  v0 = _ACLogSystem();
  v1 = os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG);

  if (v1)
  {
    v174 = objc_alloc_init((Class)ACAccountStore);
    v175 = [v174 accounts];
    if ([v175 count])
    {
      sub_100003190(@"=======================================", v9, v10, v11, v12, v13, v14, v15, v173[0]);
      sub_100003190(@"Accounts Summary:", v16, v17, v18, v19, v20, v21, v22, v173[0]);
      sub_100003190(@"=======================================", v23, v24, v25, v26, v27, v28, v29, v173[0]);
      sub_100003190(&stru_100004208, v30, v31, v32, v33, v34, v35, v36, v173[0]);
      v173[1] = (uint64_t)v173;
      __chkstk_darwin();
      v206[0] = _NSConcreteStackBlock;
      v206[1] = 3221225472;
      v206[2] = sub_10000321C;
      v206[3] = &unk_100004168;
      v206[4] = &v172;
      v207 = 10;
      v178 = objc_retainBlock(v206);
      v204 = 0u;
      v205 = 0u;
      v202 = 0u;
      v203 = 0u;
      v37 = v175;
      v38 = [v37 countByEnumeratingWithState:&v202 objects:v212 count:16];
      if (v38)
      {
        v39 = *(void *)v203;
        do
        {
          for (i = 0; i != v38; i = (char *)i + 1)
          {
            if (*(void *)v203 != v39) {
              objc_enumerationMutation(v37);
            }
            v41 = *(void **)(*((void *)&v202 + 1) + 8 * i);
            v42 = [v41 parentAccountIdentifier];
            v43 = v42 == 0;

            if (v43)
            {
              LOBYTE(v172) = 0;
              v44 = objc_retainBlock(v178);
              ((void (*)(void *, void *, void, id))v178[2])(v178, v41, 0, v44);
            }
          }
          v38 = [v37 countByEnumeratingWithState:&v202 objects:v212 count:16];
        }
        while (v38);
      }

      sub_100003190(&stru_100004208, v45, v46, v47, v48, v49, v50, v51, v172);
      sub_100003190(&stru_100004208, v52, v53, v54, v55, v56, v57, v58, v172);
      sub_100003190(@"=======================================", v59, v60, v61, v62, v63, v64, v65, v172);
      sub_100003190(@"Accounts Configuration:", v66, v67, v68, v69, v70, v71, v72, v172);
      sub_100003190(@"=======================================", v73, v74, v75, v76, v77, v78, v79, v172);
      sub_100003190(&stru_100004208, v80, v81, v82, v83, v84, v85, v86, v172);
      v200 = 0u;
      v201 = 0u;
      v198 = 0u;
      v199 = 0u;
      v177 = v37;
      v180 = [v177 countByEnumeratingWithState:&v198 objects:v211 count:16];
      if (v180)
      {
        v179 = *(void *)v199;
        do
        {
          for (j = 0; j != v180; j = (char *)j + 1)
          {
            if (*(void *)v199 != v179) {
              objc_enumerationMutation(v177);
            }
            v87 = *(void **)(*((void *)&v198 + 1) + 8 * (void)j);
            v88 = [v87 objectForKeyedSubscript:@"AccountDelegate"];
            v193 = [v88 mutableCopy];

            [v193 removeObjectForKey:@"tokens"];
            [v87 setObject:v193 forKeyedSubscript:@"AccountDelegate"];
            [v87 setObject:0 forKeyedSubscript:@"pushDeviceToken"];
            v190 = [v87 objectForKeyedSubscript:@"kCalDAVPrincipalsKey"];
            v183 = [v87 objectForKeyedSubscript:@"kCalDAVMainPrincipalUIDKey"];
            objc_msgSend(v190, "objectForKeyedSubscript:");
            v192 = (id)objc_claimAutoreleasedReturnValue();
            if (v192)
            {
              v209 = v183;
              v210 = v192;
              v89 = +[NSDictionary dictionaryWithObjects:&v210 forKeys:&v209 count:1];
              [v87 setObject:v89 forKeyedSubscript:@"kCalDAVPrincipalsKey"];
            }
            v90 = [v87 fullDescription];
            v91 = [v90 UTF8String];
            sub_100003190(@"%s", v92, v93, v94, v95, v96, v97, v98, (uint64_t)v91);

            v189 = [v87 credential];
            v188 = [v189 password];
            v99 = [v188 length];
            v100 = @"Yes";
            if (!v99) {
              v100 = @"No";
            }
            v182 = v100;
            v187 = [v87 credential];
            v186 = [v187 token];
            v101 = [v186 length];
            v102 = @"Yes";
            if (!v101) {
              v102 = @"No";
            }
            v181 = v102;
            v185 = [v87 credential];
            v184 = [v185 oauthToken];
            [v184 length];
            v103 = [v87 credential];
            v104 = [v103 oauthRefreshToken];
            [v104 length];
            v105 = [v87 credential];
            v106 = [v105 oauthTokenSecret];
            [v106 length];
            v107 = [v87 credential];
            v171 = [v107 expiryDate];
            sub_100003190(@"credential: Password:%@ Token:%@ OAuthToken:%@ RefreshToken:%@ TokenSecret:%@ ExpirationDate:%@\n\n", v108, v109, v110, v111, v112, v113, v114, (uint64_t)v182);
          }
          v180 = [v177 countByEnumeratingWithState:&v198 objects:v211 count:16];
        }
        while (v180);
      }
    }
    else
    {
      sub_100003190(@"No accounts.", v9, v10, v11, v12, v13, v14, v15, v173[0]);
    }
    sub_100003190(&stru_100004208, v115, v116, v117, v118, v119, v120, v121, v173[0]);
    sub_100003190(&stru_100004208, v122, v123, v124, v125, v126, v127, v128, v173[0]);
    sub_100003190(@"=======================================", v129, v130, v131, v132, v133, v134, v135, v173[0]);
    sub_100003190(@"Accounts Types:", v136, v137, v138, v139, v140, v141, v142, v173[0]);
    sub_100003190(@"=======================================", v143, v144, v145, v146, v147, v148, v149, v173[0]);
    sub_100003190(&stru_100004208, v150, v151, v152, v153, v154, v155, v156, v173[0]);
    v157 = [v174 allAccountTypes];
    v196 = 0u;
    v197 = 0u;
    v194 = 0u;
    v195 = 0u;
    v158 = v157;
    v159 = [v158 countByEnumeratingWithState:&v194 objects:v208 count:16];
    if (v159)
    {
      v160 = *(void *)v195;
      do
      {
        for (k = 0; k != v159; k = (char *)k + 1)
        {
          if (*(void *)v195 != v160) {
            objc_enumerationMutation(v158);
          }
          v162 = [*(id *)(*((void *)&v194 + 1) + 8 * (void)k) fullDescription];
          sub_100003190(@"%@\n\n", v163, v164, v165, v166, v167, v168, v169, (uint64_t)v162);
        }
        v159 = [v158 countByEnumeratingWithState:&v194 objects:v208 count:16];
      }
      while (v159);
    }
  }
  else
  {
    sub_100003190(@"Accounts summary disabled. It can be enabled by installing the Accounts profile from https://developer.apple.com/bug-reporting/profiles-and-logs/", v2, v3, v4, v5, v6, v7, v8, v173[0]);
  }
  return 0;
}

#error "100003150: call analysis failed (funcsize=29)"

void sub_100003190(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = a1;
  id v10 = [objc_alloc((Class)NSString) initWithFormat:v9 arguments:&a9];

  v11 = __stdoutp;
  id v12 = v10;
  fprintf(v11, "%s\n", (const char *)[v12 UTF8String]);
}

void sub_10000321C(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (a3 >= 1)
  {
    uint64_t v9 = 0;
    do
    {
      strcpy((char *)(*(void *)(a1 + 32) + v9), "    ");
      v9 += 4;
    }
    while (4 * a3 != v9);
  }
  int v35 = a3;
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = [v7 accountType];
  id v12 = [v11 identifier];
  v13 = [v7 accountType];
  v14 = [v13 objectID];
  v15 = [v7 username];
  v34 = [v7 identifier];
  sub_100003190(@"%s%@(%@) %@ %@", v16, v17, v18, v19, v20, v21, v22, v10);

  v23 = (void (**)(id, void, uint64_t, id))objc_retainBlock(v8);
  v24 = [v7 childAccounts];
  v25 = +[NSArray arrayWithArray:v24];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v26 = v25;
  id v27 = [v26 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v37;
    int v30 = v35 + 1;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v37 != v29) {
          objc_enumerationMutation(v26);
        }
        int v32 = *(_DWORD *)(a1 + 40);
        if (v30 >= v32) {
          uint64_t v33 = v32;
        }
        else {
          uint64_t v33 = v30;
        }
        v23[2](v23, *(void *)(*((void *)&v36 + 1) + 8 * i), v33, v8);
      }
      id v28 = [v26 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v28);
  }
}

uint64_t _ACLogSystem()
{
  return __ACLogSystem();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void exit(int a1)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_accountType(void *a1, const char *a2, ...)
{
  return [a1 accountType];
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return [a1 accounts];
}

id objc_msgSend_allAccountTypes(void *a1, const char *a2, ...)
{
  return [a1 allAccountTypes];
}

id objc_msgSend_childAccounts(void *a1, const char *a2, ...)
{
  return [a1 childAccounts];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_credential(void *a1, const char *a2, ...)
{
  return [a1 credential];
}

id objc_msgSend_expiryDate(void *a1, const char *a2, ...)
{
  return [a1 expiryDate];
}

id objc_msgSend_fullDescription(void *a1, const char *a2, ...)
{
  return [a1 fullDescription];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_oauthRefreshToken(void *a1, const char *a2, ...)
{
  return [a1 oauthRefreshToken];
}

id objc_msgSend_oauthToken(void *a1, const char *a2, ...)
{
  return [a1 oauthToken];
}

id objc_msgSend_oauthTokenSecret(void *a1, const char *a2, ...)
{
  return [a1 oauthTokenSecret];
}

id objc_msgSend_objectID(void *a1, const char *a2, ...)
{
  return [a1 objectID];
}

id objc_msgSend_parentAccountIdentifier(void *a1, const char *a2, ...)
{
  return [a1 parentAccountIdentifier];
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return [a1 password];
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return [a1 token];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}