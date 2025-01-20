@interface FactoryApplicationRepair
+ (BOOL)shouldAttemptToRepairApplication:(id)a3 options:(id)a4 logKey:(id)a5;
- (ApplicationRepairDelegate)delegate;
- (BOOL)repairApplication:(id)a3 error:(id *)a4;
- (FactoryApplicationRepair)init;
- (NSArray)repairedBundleIDs;
- (NSString)repairType;
- (_TtC9appstored6LogKey)logKey;
- (int)fairPlayStatus;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6;
- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setLogKey:(id)a3;
@end

@implementation FactoryApplicationRepair

- (FactoryApplicationRepair)init
{
  v8.receiver = self;
  v8.super_class = (Class)FactoryApplicationRepair;
  v2 = [(FactoryApplicationRepair *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(UnfairLock);
    lock = v2->_lock;
    v2->_lock = v3;

    uint64_t v5 = sub_10030B11C();
    bag = v2->_bag;
    v2->_bag = (AMSBagProtocol *)v5;

    *(_WORD *)&v2->_establishesActiveAccount = 257;
  }
  return v2;
}

- (ApplicationRepairDelegate)delegate
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_100018068;
  v10 = sub_100017BF0;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100291E20;
  v5[3] = &unk_100521988;
  v5[4] = self;
  v5[5] = &v6;
  sub_100010468(lock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (ApplicationRepairDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100291F04;
  v7[3] = &unk_1005218C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  sub_100010468(lock, v7);
}

- (int)fairPlayStatus
{
  return 0;
}

- (_TtC9appstored6LogKey)logKey
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_100018068;
  v10 = sub_100017BF0;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100292020;
  v5[3] = &unk_100521988;
  v5[4] = self;
  v5[5] = &v6;
  sub_100010468(lock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (_TtC9appstored6LogKey *)v3;
}

- (void)setLogKey:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002920CC;
  v7[3] = &unk_1005218C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  sub_100010468(lock, v7);
}

- (NSArray)repairedBundleIDs
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_100018068;
  v10 = sub_100017BF0;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100292224;
  v5[3] = &unk_100521988;
  v5[4] = self;
  v5[5] = &v6;
  sub_100010468(lock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NSString)repairType
{
  return (NSString *)@"Factory";
}

+ (BOOL)shouldAttemptToRepairApplication:(id)a3 options:(id)a4 logKey:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = [v7 bundleID];

  if (v9)
  {
    v10 = [v7 record];
    id v11 = [v8 prependingCategory:@"Claim"];
    char v12 = sub_10029241C((uint64_t)a1, v10, v11);
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (BOOL)repairApplication:(id)a3 error:(id *)a4
{
  id v4 = +[ACAccountStore ams_sharedAccountStore];
  uint64_t v5 = objc_msgSend(v4, "ams_activeiTunesAccount");

  if (v5)
  {
    id v170 = 0;
    goto LABEL_3;
  }
  if (!self) {
    goto LABEL_20;
  }
  *(void *)&long long v182 = 0;
  *((void *)&v182 + 1) = &v182;
  *(void *)&long long v183 = 0x2020000000;
  BYTE8(v183) = 0;
  lock = self->_lock;
  *(void *)buf = _NSConcreteStackBlock;
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = sub_100291CF0;
  v195 = &unk_100521988;
  *(void *)&long long v196 = self;
  *((void *)&v196 + 1) = &v182;
  sub_100010468(lock, buf);
  int v10 = *(unsigned __int8 *)(*((void *)&v182 + 1) + 24);
  _Block_object_dispose(&v182, 8);
  if (!v10)
  {
LABEL_20:
    id v170 = 0;
    goto LABEL_21;
  }
  id v11 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    char v12 = [(FactoryApplicationRepair *)self logKey];
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%@] Prompting to request authentication to establish an active account", buf, 0xCu);
  }
  id v13 = objc_alloc_init((Class)AMSAuthenticateOptions);
  [v13 setAuthenticationType:2];
  [v13 setDebugReason:@"Claim"];
  v14 = ASDLocalizedString();
  [v13 setReason:v14];

  id v15 = [objc_alloc((Class)AMSAuthenticateRequest) initWithAccount:0 options:v13];
  id v178 = 0;
  v16 = sub_100294364(self, v15, &v178);
  id v170 = v178;
  if (v170)
  {
    v17 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = [(FactoryApplicationRepair *)self logKey];
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v170;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[%@] Attempt to establish primary account resulted in error: %{public}@", buf, 0x16u);
    }
    uint64_t v5 = 0;
LABEL_16:

    goto LABEL_17;
  }
  if (v16)
  {
    v153 = +[ACAccountStore ams_sharedAccountStore];
    uint64_t v5 = objc_msgSend(v153, "ams_activeiTunesAccount");

    v17 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v154 = [(FactoryApplicationRepair *)self logKey];
      v155 = [v16 account];
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v154;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v155;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[%@] Logged into account: %{public}@", buf, 0x16u);
    }
    goto LABEL_16;
  }
  uint64_t v5 = 0;
LABEL_17:

  if (v5)
  {
LABEL_3:
    v161 = +[AMSDevice buildVersion];
    id v166 = v5;
    self;
    uint64_t v6 = sub_1003F4714();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v166 identifier];
      if (v7)
      {
        id v8 = [v6 objectForKey:v7];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v164 = [v8 copy];
        }
        else {
          id v164 = 0;
        }
      }
      else
      {
        id v164 = 0;
      }
    }
    else
    {
      id v164 = 0;
    }

    if (v164)
    {
      if ([v161 isEqualToString:v164])
      {
        if (!self) {
          goto LABEL_158;
        }
        *(void *)&long long v182 = 0;
        *((void *)&v182 + 1) = &v182;
        *(void *)&long long v183 = 0x2020000000;
        BYTE8(v183) = 0;
        v23 = self->_lock;
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = sub_100291D04;
        v195 = &unk_100521988;
        *(void *)&long long v196 = self;
        *((void *)&v196 + 1) = &v182;
        sub_100010468(v23, buf);
        int v24 = *(unsigned __int8 *)(*((void *)&v182 + 1) + 24);
        _Block_object_dispose(&v182, 8);
        if (!v24)
        {
LABEL_158:
          log = ASDLogHandleForCategory();
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
          {
            v152 = [(FactoryApplicationRepair *)self logKey];
            *(_DWORD *)buf = 138412802;
            *(void *)&buf[4] = v152;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v161;
            *(_WORD *)&buf[22] = 2112;
            v195 = v166;
            _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "[%@] Skipping claim, already did claim for this build: %@ and user: %@", buf, 0x20u);
          }
          goto LABEL_148;
        }
      }
    }
    id v25 = [(FactoryApplicationRepair *)self logKey];
    context = self;
    log = objc_alloc_init((Class)NSMutableArray);
    long long v184 = 0u;
    long long v185 = 0u;
    long long v182 = 0u;
    long long v183 = 0u;
    sub_1004280A0((uint64_t)LSApplicationRecord, 0, 0);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v26 = [obj countByEnumeratingWithState:&v182 objects:buf count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v183;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v183 != v27) {
            objc_enumerationMutation(obj);
          }
          v29 = *(void **)(*((void *)&v182 + 1) + 8 * i);
          v31 = [v29 iTunesMetadata];
          id v32 = [v31 storeItemIdentifier];

          if ((!v32 || sub_10029241C((uint64_t)context, v29, v25))
            && ([v29 isProfileValidated] & 1) == 0)
          {
            id v33 = objc_alloc_init((Class)NSMutableDictionary);
            v34 = [v29 bundleIdentifier];
            [v33 setObject:v34 forKeyedSubscript:@"bid"];

            v35 = [v29 exactBundleVersion];
            [v33 setObject:v35 forKeyedSubscript:@"bvrs"];

            v36 = [v29 iTunesMetadata];
            id v37 = [v36 versionIdentifier];

            if (v37)
            {
              v38 = +[NSNumber numberWithUnsignedLongLong:v37];
              v39 = [v38 stringValue];
              [v33 setObject:v39 forKeyedSubscript:@"vid"];
            }
            if (v32)
            {
              v40 = +[NSNumber numberWithUnsignedLongLong:v32];
              v41 = [v40 stringValue];
              [v33 setObject:v41 forKeyedSubscript:@"id"];
            }
            v42 = [v29 iTunesMetadata];
            v43 = [v42 variantID];

            if (v43) {
              [v33 setObject:v43 forKeyedSubscript:@"variantId"];
            }
            v44 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v188 = 138412546;
              id v189 = v25;
              __int16 v190 = 2114;
              id v191 = v33;
              _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "[%@] Discovered claimable application: %{public}@", v188, 0x16u);
            }

            [log addObject:v33];
          }
        }
        id v26 = [obj countByEnumeratingWithState:&v182 objects:buf count:16];
      }
      while (v26);
    }

    BOOL v45 = [log count] == 0;
    oslog = ASDLogHandleForCategory();
    BOOL v46 = os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT);
    if (v45)
    {
      if (v46)
      {
        v62 = [(FactoryApplicationRepair *)self logKey];
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v62;
        _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "[%@] Skipping claim, wasn't able to discover any unclaimed apps", buf, 0xCu);
      }
      goto LABEL_143;
    }
    if (v46)
    {
      v47 = [(FactoryApplicationRepair *)self logKey];
      id v48 = [log count];
      v49 = objc_msgSend(v166, "ams_DSID");
      *(_DWORD *)buf = 138413058;
      *(void *)&buf[4] = v47;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v48;
      *(_WORD *)&buf[22] = 2114;
      v195 = v49;
      LOWORD(v196) = 2114;
      *(void *)((char *)&v196 + 2) = v164;
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "[%@] Running claim for %ld app(s) for accountID: %{public}@. Last claim was on build: %{public}@", buf, 0x2Au);
    }
    if (self)
    {
      v50 = log;
      id v51 = v166;
      id v52 = [objc_alloc((Class)AMSURLRequestEncoder) initWithBag:self->_bag];
      [v52 setAccount:v51];
      [v52 setRequestEncoding:3];
      v53 = [(FactoryApplicationRepair *)self logKey];
      id v54 = v51;
      id v55 = v53;
      v56 = v50;
      self;
      v57 = objc_opt_new();
      [v57 setObject:v56 forKeyedSubscript:@"apps"];

      v58 = +[AMSDevice deviceGUID];
      if (v58) {
        [v57 setObject:v58 forKeyedSubscript:@"guid"];
      }
      *(void *)&long long v182 = 0;
      v59 = sub_1002F2D98((uint64_t)AMSKeybag, v54, 1, &v182);
      id v60 = (id)v182;
      v61 = v60;
      if (!v59 || v60)
      {
        v63 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)&buf[4] = v55;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v54;
          *(_WORD *)&buf[22] = 2114;
          v195 = v61;
          _os_log_error_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "[%@] Failed to generate keybag for account: %{public}@ error: %{public}@", buf, 0x20u);
        }
      }
      else
      {
        [v57 setObject:v59 forKeyedSubscript:@"kbsync"];
      }

      v64 = [(AMSBagProtocol *)self->_bag URLForKey:@"factory-app-claim"];
      v65 = [v52 requestWithMethod:4 bagURL:v64 parameters:v57];
      *(void *)buf = 0;
      v66 = [v65 resultWithError:buf];
      id v67 = *(id *)buf;

      v68 = sub_10027AC84((uint64_t)AMSURLSession, self);
      v69 = [v68 dataTaskPromiseWithRequest:v66];
      *(void *)&long long v182 = v67;
      v70 = [v69 resultWithError:&v182];
      id v71 = (id)v182;

      if (v71)
      {
        id v72 = v71;
        v73 = 0;
      }
      else
      {
        v73 = [v70 object];
        id v72 = v170;
      }
    }
    else
    {
      v73 = 0;
      id v72 = v170;
    }
    id v163 = v72;

    if (!v73)
    {
      v91 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
      {
        v156 = [(FactoryApplicationRepair *)self logKey];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v156;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v163;
        _os_log_error_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_ERROR, "[%@] Claim failed with error: %{public}@", buf, 0x16u);
      }
      goto LABEL_150;
    }
    oslog = v73;
    id v167 = v166;
    if (!self)
    {
      v168 = 0;
LABEL_138:

      v137 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
      {
        v138 = [(FactoryApplicationRepair *)self logKey];
        v139 = [v168 componentsJoinedByString:@", "];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v138;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v139;
        _os_log_impl((void *)&_mh_execute_header, v137, OS_LOG_TYPE_DEFAULT, "[%@] Claim completed for: %{public}@", buf, 0x16u);
      }
      v140 = [(ApplicationProxy *)self->_application bundleID];
      BOOL v141 = v140 == 0;

      if (!v141)
      {
        v142 = [(ApplicationProxy *)self->_application bundleID];
        unsigned int v143 = [v168 containsObject:v142];

        if (v143)
        {
          v144 = [(FactoryApplicationRepair *)self delegate];
          [v144 repair:self wantsToRelaunchApplication:self->_application];

          sub_100292270((uint64_t)self, v168);
          id v170 = v163;
LABEL_143:

          id v145 = v161;
          id v146 = v166;
          self;
          v147 = [v146 identifier];

          if (v147)
          {
            id v148 = objc_alloc_init((Class)NSMutableDictionary);
            v149 = sub_1003F4714();
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v148 addEntriesFromDictionary:v149];
            }
            objc_msgSend(v148, "setObject:forKey:", v145, v147, v157);
            sub_1003F4958((uint64_t)AppDefaultsManager, v148);
          }
LABEL_148:
          BOOL v21 = 1;
          id v163 = v170;
LABEL_151:

          v22 = v161;
          goto LABEL_152;
        }
      }
      sub_100292270((uint64_t)self, v168);

LABEL_150:
      BOOL v21 = 0;
      goto LABEL_151;
    }
    v168 = objc_opt_new();
    v158 = objc_msgSend(v167, "ams_DSID");
    sub_1003DD184((uint64_t)StoreItemResponse, oslog, 1);
    selfa = (id)objc_claimAutoreleasedReturnValue();
    v74 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      v76 = [(FactoryApplicationRepair *)self logKey];
      id Property = selfa;
      if (selfa) {
        id Property = objc_getProperty(selfa, v75, 56, 1);
      }
      id v78 = Property;
      id v79 = [v78 count];
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v76;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v79;
      *(_WORD *)&buf[22] = 2114;
      v195 = v158;
      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "[%@] Attempting to process %ld item(s) for accountID: %{public}@", buf, 0x20u);
    }
    id v81 = selfa;
    if (selfa) {
      id v81 = objc_getProperty(selfa, v80, 64, 1);
    }
    id v159 = v81;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v83 = ASDLogHandleForCategory();
    BOOL v84 = os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT);
    if (isKindOfClass)
    {
      if (v84)
      {
        v85 = [(FactoryApplicationRepair *)self logKey];
        id v86 = [v159 length];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v85;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v86;
        _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "[%@] Importing keybag data (%{iec-bytes}lu) following claim(s)", buf, 0x16u);
      }
      v87 = +[AMSKeybag sharedInstance];
      id v186 = 0;
      unsigned __int8 v88 = [v87 importKeybagWithData:v159 error:&v186];
      id v157 = v186;

      if (v88) {
        goto LABEL_89;
      }
      v83 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
      {
        v90 = [(FactoryApplicationRepair *)self logKey];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v90;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v157;
        _os_log_error_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_ERROR, "[%@] Importing keybag data failed with error: %{public}@", buf, 0x16u);
      }
    }
    else
    {
      if (v84)
      {
        v92 = [(FactoryApplicationRepair *)self logKey];
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v92;
        _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "[%@] No keybag available to import - keybag sync may follow", buf, 0xCu);
      }
      id v157 = 0;
    }

LABEL_89:
    long long v184 = 0u;
    long long v185 = 0u;
    long long v182 = 0u;
    long long v183 = 0u;
    id v93 = selfa;
    if (selfa) {
      id v93 = objc_getProperty(selfa, v89, 56, 1);
    }
    id v171 = v93;
    id obja = [v171 countByEnumeratingWithState:&v182 objects:buf count:16];
    if (obja)
    {
      uint64_t v173 = *(void *)v183;
      do
      {
        v94 = 0;
        do
        {
          if (*(void *)v183 != v173) {
            objc_enumerationMutation(v171);
          }
          v95 = *(void **)(*((void *)&v182 + 1) + 8 * (void)v94);
          if (v95) {
            id v97 = objc_getProperty(v95, v96, 96, 1);
          }
          else {
            id v97 = 0;
          }
          id v98 = v97;
          v99 = [ApplicationProxy alloc];
          id v181 = 0;
          v100 = [(ApplicationProxy *)v99 initWithBundleID:v98 allowPlaceholder:0 error:&v181];
          id v102 = v181;
          if (v100)
          {
            if (v95)
            {
              id v103 = objc_getProperty(v95, v101, 72, 1);
              v105 = v103;
              if (v103) {
                id v103 = objc_getProperty(v103, v104, 144, 1);
              }
            }
            else
            {
              v105 = 0;
              id v103 = 0;
            }
            v106 = v103;

            if (v106 && [v106 length])
            {
              v107 = ASDLogHandleForCategory();
              if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
              {
                v108 = [(FactoryApplicationRepair *)self logKey];
                *(_DWORD *)v188 = 138412546;
                id v189 = v108;
                __int16 v190 = 2114;
                id v191 = v98;
                _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "[%@][%{public}@] Updating app metadata", v188, 0x16u);
              }
              v109 = [(ApplicationProxy *)v100 applicationIdentity];
              id v180 = v102;
              unsigned __int8 v110 = sub_100279608((uint64_t)IXAppInstallCoordinator, v109, 0, v106, (uint64_t)&v180);
              id v111 = v180;

              if (v110)
              {
                v112 = sub_100400EF8((uint64_t)MIStoreMetadata, v95);
                sub_100401854(v112, v167);
                if (v112) {
                  sub_1004019C4(v112, v106, 0);
                }
                v113 = [(ApplicationProxy *)v100 record];
                v114 = [v113 iTunesMetadata];
                v115 = [v114 variantID];

                if (v115)
                {
                  v116 = ASDLogHandleForCategory();
                  if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
                  {
                    v117 = [(FactoryApplicationRepair *)self logKey];
                    *(_DWORD *)v188 = 138412802;
                    id v189 = v117;
                    __int16 v190 = 2114;
                    id v191 = v98;
                    __int16 v192 = 2114;
                    id v193 = v115;
                    _os_log_impl((void *)&_mh_execute_header, v116, OS_LOG_TYPE_DEFAULT, "[%@][%{public}@] Updating app metadata with variantID: %{public}@", v188, 0x20u);
                  }
                  [v112 setVariantID:v115];
                }
                id v179 = v111;
                unsigned __int8 v118 = sub_100401B48(v112, v98, 0, &v179);
                id v102 = v179;

                if ((v118 & 1) == 0)
                {
                  v119 = ASDLogHandleForCategory();
                  if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                  {
                    v131 = [(FactoryApplicationRepair *)self logKey];
                    *(_DWORD *)v188 = 138412802;
                    id v189 = v131;
                    __int16 v190 = 2114;
                    id v191 = v98;
                    __int16 v192 = 2114;
                    id v193 = v102;
                    _os_log_error_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_ERROR, "[%@][%{public}@] Metadata could not be updated due to error: %{public}@", v188, 0x20u);
                  }
                }
                v120 = [AppLedgerEvent alloc];
                v121 = [(ApplicationProxy *)v100 record];
                v122 = [(FactoryApplicationRepair *)self logKey];
                v123 = sub_1003D9D90(v120, v121, v122);

                v124 = sub_1002D7CE8();
                v187 = v123;
                v125 = +[NSArray arrayWithObjects:&v187 count:1];
                sub_1002D84A8((uint64_t)v124, v125);

                v126 = ASDLogHandleForCategory();
                if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
                {
                  v127 = [(FactoryApplicationRepair *)self logKey];
                  *(_DWORD *)v188 = 138412546;
                  id v189 = v127;
                  __int16 v190 = 2114;
                  id v191 = v98;
                  _os_log_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_DEFAULT, "[%@][%{public}@] Claim complete", v188, 0x16u);
                }
                [v168 addObject:v98];
              }
              else
              {
                v112 = ASDLogHandleForCategory();
                if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
                {
                  v130 = [(FactoryApplicationRepair *)self logKey];
                  *(_DWORD *)v188 = 138412802;
                  id v189 = v130;
                  __int16 v190 = 2114;
                  id v191 = v98;
                  __int16 v192 = 2114;
                  id v193 = v111;
                  _os_log_error_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_ERROR, "[%@][%{public}@] Skipping update. Unable to update metadata SINF due to error: %{public}@", v188, 0x20u);
                }
                id v102 = v111;
              }
            }
            else
            {
              v112 = ASDLogHandleForCategory();
              if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
              {
                v128 = [(FactoryApplicationRepair *)self logKey];
                *(_DWORD *)v188 = 138412546;
                id v189 = v128;
                __int16 v190 = 2114;
                id v191 = v98;
                _os_log_error_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_ERROR, "[%@][%{public}@] Skipping update due to missing SINF data", v188, 0x16u);
              }
            }
          }
          else
          {
            v106 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
            {
              v129 = [(FactoryApplicationRepair *)self logKey];
              *(_DWORD *)v188 = 138412802;
              id v189 = v129;
              __int16 v190 = 2114;
              id v191 = v98;
              __int16 v192 = 2114;
              id v193 = v102;
              _os_log_error_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_ERROR, "[%@][%{public}@] Skipping update as it doesn't appear to be installed: %{public}@", v188, 0x20u);
            }
          }

          v94 = (char *)v94 + 1;
        }
        while (obja != v94);
        id v132 = [v171 countByEnumeratingWithState:&v182 objects:buf count:16];
        id obja = v132;
      }
      while (v132);
    }

    if ([v168 count])
    {
      v133 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
      {
        v134 = [(FactoryApplicationRepair *)self logKey];
        v135 = [v168 componentsJoinedByString:@", "];
        v136 = objc_msgSend(v167, "ams_DSID");
        *(_DWORD *)v188 = 138412802;
        id v189 = v134;
        __int16 v190 = 2114;
        id v191 = v135;
        __int16 v192 = 2112;
        id v193 = v136;
        _os_log_impl((void *)&_mh_execute_header, v133, OS_LOG_TYPE_DEFAULT, "[%@] Claim complete for bundleIDs: [%{public}@] for accountID: %@", v188, 0x20u);
      }
    }

    goto LABEL_138;
  }
LABEL_21:
  v19 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = [(FactoryApplicationRepair *)self logKey];
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[%@] Skipping claim, no active account", buf, 0xCu);
  }
  ASDErrorWithTitleAndMessage();
  id v163 = (id)objc_claimAutoreleasedReturnValue();
  id v166 = 0;
  BOOL v21 = 0;
  v22 = v170;
LABEL_152:

  if (a4) {
    char v150 = v21;
  }
  else {
    char v150 = 1;
  }
  if ((v150 & 1) == 0) {
    *a4 = v163;
  }

  return v21;
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  id v8 = a5;
  v9 = (void (**)(id, void *, id))a6;
  int v10 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(FactoryApplicationRepair *)self logKey];
    *(_DWORD *)buf = 138412546;
    v22 = v11;
    __int16 v23 = 2114;
    id v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%@] Presenting dialog request: %{public}@", buf, 0x16u);
  }
  char v12 = ASDErrorWithDescription();
  id v13 = [(FactoryApplicationRepair *)self delegate];
  [v13 repair:self needsToReleaseBlockingCallerWithReason:v12];

  id v14 = [objc_alloc((Class)AMSSystemAlertDialogTask) initWithRequest:v8];
  id v15 = [v14 present];
  id v20 = 0;
  v16 = [v15 resultWithError:&v20];
  id v17 = v20;

  if (!v16)
  {
    v18 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = [(FactoryApplicationRepair *)self logKey];
      *(_DWORD *)buf = 138412546;
      v22 = v19;
      __int16 v23 = 2114;
      id v24 = v17;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "[%@] Dialog request failed with error: %{public}@", buf, 0x16u);
    }
  }
  v9[2](v9, v16, v17);
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  id v8 = a5;
  v9 = (void (**)(id, void *, id))a6;
  int v10 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(FactoryApplicationRepair *)self logKey];
    *(_DWORD *)buf = 138412546;
    v18 = v11;
    __int16 v19 = 2114;
    id v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%@] Presenting authentication request: %{public}@", buf, 0x16u);
  }
  id v16 = 0;
  char v12 = sub_100294364(self, v8, &v16);
  id v13 = v16;
  if (!v12)
  {
    id v14 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = [(FactoryApplicationRepair *)self logKey];
      *(_DWORD *)buf = 138412546;
      v18 = v15;
      __int16 v19 = 2114;
      id v20 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "[%@] Authenticate request failed with error: %{public}@", buf, 0x16u);
    }
  }
  v9[2](v9, v12, v13);
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6
{
  id v8 = a5;
  v9 = (void (**)(id, void *, void))a6;
  id v17 = 0;
  int v10 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(FactoryApplicationRepair *)self logKey];
    *(_DWORD *)buf = 138412546;
    __int16 v19 = v11;
    __int16 v20 = 2114;
    id v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%@] Presenting engagement request: %{public}@", buf, 0x16u);
  }
  id v12 = [objc_alloc((Class)AMSSystemEngagementTask) initWithRequest:v8];
  [v12 setClientInfo:self->_clientInfo];
  id v13 = [v12 present];
  id v14 = [v13 resultWithError:&v17];

  if (!v14)
  {
    id v15 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = [(FactoryApplicationRepair *)self logKey];
      *(_DWORD *)buf = 138412546;
      __int16 v19 = v16;
      __int16 v20 = 2114;
      id v21 = v17;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "[%@] Engagement request failed with error: %{public}@", buf, 0x16u);
    }
  }
  ((void (**)(id, void *, void *))v9)[2](v9, v14, v17);
}

- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting dialog task", buf, 0xCu);
  }

  id v10 = [objc_alloc((Class)AMSSystemAlertDialogTask) initWithRequest:v8];
  id v11 = [v10 present];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100294DE8;
  v13[3] = &unk_100524170;
  v13[4] = self;
  id v14 = v7;
  id v12 = v7;
  [v11 addFinishBlock:v13];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repairedBundleIDs, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_application, 0);
}

@end