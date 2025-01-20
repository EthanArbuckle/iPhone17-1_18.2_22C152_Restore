@interface ManagedApplicationTask
- (void)main;
@end

@implementation ManagedApplicationTask

- (void)main
{
  v3 = self;
  unint64_t v144 = 0;
  if (self) {
    self = (ManagedApplicationTask *)objc_getProperty(self, a2, 136, 1);
  }
  if ([(ManagedApplicationTask *)self requestType] != (id)3)
  {
    id v5 = v3 ? objc_getProperty(v3, v4, 136, 1) : 0;
    if ([v5 requestType] != (id)1)
    {
      itemIdentifier = v3->_itemIdentifier;
      if (itemIdentifier)
      {
        v9 = 0;
        id v10 = 0;
        uint64_t v11 = 0;
        int v12 = 1;
        goto LABEL_124;
      }
      bundleIdentifier = v3->_bundleIdentifier;
      if (!bundleIdentifier)
      {
        uint64_t v11 = 0;
        id v10 = 0;
        v9 = 0;
        int v12 = 1;
        goto LABEL_128;
      }
      goto LABEL_9;
    }
  }
  if (!v3)
  {
    v9 = 0;
    LODWORD(v18) = 0;
    LODWORD(v6) = 0;
    id v17 = 0;
    uint64_t v11 = 0;
    goto LABEL_100;
  }
  if (!v3->_itemIdentifier)
  {
LABEL_9:
    if (!v3->_bundleIdentifier)
    {
      ASDErrorWithTitleAndMessage();
      id v17 = objc_claimAutoreleasedReturnValue();
      v9 = 0;
      LODWORD(v18) = 0;
      LODWORD(v6) = 0;
      unsigned __int8 v154 = 0;
      goto LABEL_99;
    }
  }
  v140 = objc_opt_new();
  uint64_t v6 = [(ACAccount *)v3->_account ams_DSID];
  if (!v6) {
    goto LABEL_51;
  }
  id v7 = [(ASDManagedApplicationRequestOptions *)v3->_options requestType];

  if (v7 == (id)2)
  {
    uint64_t v6 = 0;
    goto LABEL_51;
  }
  v136 = sub_10001A264();
  v13 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    logKey = v3->_logKey;
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = logKey;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%@] Checking purchase history for items", buf, 0xCu);
  }

  id v138 = objc_alloc_init((Class)ASDPurchaseHistoryQuery);
  v15 = [(ACAccount *)v3->_account ams_DSID];
  objc_msgSend(v138, "setAccountID:", objc_msgSend(v15, "longLongValue"));

  if (v3->_itemIdentifier)
  {
    v174 = v3->_itemIdentifier;
    v16 = +[NSArray arrayWithObjects:&v174 count:1];
    [v138 setStoreIDs:v16];
LABEL_24:

    goto LABEL_25;
  }
  if ([(NSString *)v3->_bundleIdentifier length])
  {
    v173 = v3->_bundleIdentifier;
    v16 = +[NSArray arrayWithObjects:&v173 count:1];
    [v138 setBundleIDs:v16];
    goto LABEL_24;
  }
LABEL_25:
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v170 = sub_100018148;
  v171 = sub_100017C60;
  id v172 = 0;
  v151[0] = _NSConcreteStackBlock;
  v151[1] = 3221225472;
  v151[2] = sub_1002F84C0;
  v151[3] = &unk_1005272B0;
  v153 = buf;
  v20 = dispatch_semaphore_create(0);
  v152 = v20;
  sub_10024B474((uint64_t)v136, v138, v151);
  dispatch_time_t v21 = dispatch_time(0, 120000000000);
  v134 = v20;
  if (dispatch_semaphore_wait(v20, v21))
  {
    v22 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v131 = v3->_logKey;
      *(_DWORD *)v158 = 138412290;
      v159 = v131;
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "[%@] Timed out looking though purchase history", v158, 0xCu);
    }
    uint64_t v6 = 0;
    goto LABEL_50;
  }
  long long v149 = 0u;
  long long v150 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  v22 = *(id *)(*(void *)&buf[8] + 40);
  uint64_t v6 = (uint64_t)[v22 countByEnumeratingWithState:&v147 objects:v162 count:16];
  if (!v6) {
    goto LABEL_50;
  }
  uint64_t v23 = *(void *)v148;
  while (2)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v148 != v23) {
        objc_enumerationMutation(v22);
      }
      v25 = *(void **)(*((void *)&v147 + 1) + 8 * i);
      v26 = v3->_bundleIdentifier;
      if (v26)
      {
        v2 = [*(id *)(*((void *)&v147 + 1) + 8 * i) bundleID];
        if ([v2 isEqualToString:v3->_bundleIdentifier])
        {

LABEL_47:
          v29 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            v30 = v3->_logKey;
            v31 = [(ACAccount *)v3->_account ams_DSID];
            *(_DWORD *)v158 = 138412546;
            v159 = v30;
            __int16 v160 = 2114;
            v161 = v31;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[%@] App owned by accountID: %{public}@", v158, 0x16u);
          }
          uint64_t v6 = 1;
          goto LABEL_50;
        }
        if (!v3->_itemIdentifier)
        {

          continue;
        }
      }
      else if (!v3->_itemIdentifier)
      {
        continue;
      }
      v27 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v25 storeItemID]);
      unsigned int v28 = [v27 isEqualToNumber:v3->_itemIdentifier];

      if (v26)
      {

        if (v28) {
          goto LABEL_47;
        }
      }
      else if (v28)
      {
        goto LABEL_47;
      }
    }
    uint64_t v6 = (uint64_t)[v22 countByEnumeratingWithState:&v147 objects:v162 count:16];
    if (v6) {
      continue;
    }
    break;
  }
LABEL_50:

  _Block_object_dispose(buf, 8);
LABEL_51:
  v139 = v3->_bundleIdentifier;
  id v32 = objc_alloc((Class)AMSMediaTask);
  v33 = v3->_clientID;
  v34 = v33;
  if (!v33 || ![(__CFString *)v33 length])
  {

    v34 = @"appstore";
  }
  v35 = sub_10030B11C();
  id v36 = [v32 initWithType:0 clientIdentifier:v34 clientVersion:@"1" bag:v35];

  v37 = sub_1002F46C0((uint64_t)v3);
  [v36 setClientInfo:v37];

  v38 = [(LogKey *)v3->_logKey description];
  [v36 setLogKey:v38];

  v39 = v3->_itemIdentifier;
  if (v39)
  {
    v40 = [(NSNumber *)v39 stringValue];
    v157 = v40;
    v41 = +[NSArray arrayWithObjects:&v157 count:1];
    [v36 setItemIdentifiers:v41];

    goto LABEL_58;
  }
  if ([(NSString *)v3->_bundleIdentifier length])
  {
    v156 = v3->_bundleIdentifier;
    v40 = +[NSArray arrayWithObjects:&v156 count:1];
    [v36 setBundleIdentifiers:v40];
LABEL_58:
  }
  [v36 setAdditionalQueryParams:&off_10054E298];
  v137 = [v36 perform];
  id v146 = 0;
  v135 = [v137 resultWithError:&v146];
  id v42 = v146;
  if (v42)
  {
    v43 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      v128 = v3->_logKey;
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v128;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v42;
      _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "[%@] Lookup resulted in error: %{public}@", buf, 0x16u);
    }
    BOOL v18 = 0;
  }
  else
  {
    v44 = [MediaApp alloc];
    v45 = [v135 responseDataItems];
    v46 = [v45 firstObject];
    v43 = sub_1002F92DC(v44, v46);

    sub_1002F9408((id *)&v43->isa);
    v47 = (id *)objc_claimAutoreleasedReturnValue();
    uint64_t v48 = sub_10039F908(v47);

    if (v48)
    {
      v49 = +[NSNumber numberWithLongLong:*(void *)(v48 + 24)];
      [v140 setObject:v49 forKey:ASDManagedLookupExternalVersionID];

      v50 = +[NSNumber numberWithBool:sub_1002302CC(v48)];
      [v140 setObject:v50 forKey:ASDManagedLookupIs32BitOnly];

      id v51 = *(id *)(v48 + 32);
      [v140 setObject:v51 forKey:ASDManagedLookupBundleID];

      if (!v139) {
        v139 = (NSString *)*(id *)(v48 + 32);
      }
    }
    uint64_t v52 = sub_100230554((id *)v48);
    if (v52
      || (sub_100230454((id *)v48),
          v53 = objc_claimAutoreleasedReturnValue(),
          [v53 firstObject],
          uint64_t v52 = objc_claimAutoreleasedReturnValue(),
          v53,
          v52))
    {
      BOOL v18 = *(double *)(v52 + 16) == 0.0;
      v54 = +[NSNumber numberWithLongLong:*(void *)(v52 + 24)];
      [v140 setObject:v54 forKey:ASDManagedLookupUncompressedSize];

      id v55 = *(id *)(v52 + 8);
      [v140 setObject:v55 forKey:ASDManagedLookupFreeBuyParams];
    }
    else
    {
      BOOL v18 = 0;
    }
    if (v43) {
      Class isa = v43[3].isa;
    }
    else {
      Class isa = 0;
    }
    v57 = +[NSNumber numberWithLongLong:isa];
    [v140 setObject:v57 forKey:ASDManagedLookupItemID];

    uint64_t v58 = sub_1002F9408((id *)&v43->isa);
    v59 = (id *)v58;
    if (v58)
    {
      id v60 = *(id *)(v58 + 32);
      [v140 setObject:v60 forKey:ASDManagedLookupVendorName];

      id v61 = v59[3];
      [v140 setObject:v61 forKey:ASDManagedLookupBundleDisplayName];
    }
  }

  if (v139) {
    char v62 = v6;
  }
  else {
    char v62 = 1;
  }
  if ((v62 & 1) == 0)
  {
    if (v3->_account)
    {
      v155 = v139;
      v63 = +[NSArray arrayWithObjects:&v155 count:1];
      account = v3->_account;
      id v145 = 0;
      v65 = account;
      id v66 = v63;
      v67 = objc_alloc_init(OwnsCheckTask);
      v69 = v67;
      if (v67)
      {
        objc_setProperty_nonatomic_copy(v67, v68, v65, 40);

        objc_setProperty_nonatomic_copy(v69, v70, v66, 48);
        [(Task *)v3 runSubTask:v69 returningError:&v145];
        id v73 = objc_getProperty(v69, v71, 56, 1);
        if (v73)
        {
          id Property = objc_getProperty(v69, v72, 56, 1);
          v75 = Property;
          goto LABEL_82;
        }
        v75 = &__NSDictionary0__struct;
      }
      else
      {

        [(Task *)v3 runSubTask:0 returningError:&v145];
        id Property = 0;
        id v73 = 0;
        v75 = &__NSDictionary0__struct;
LABEL_82:
        id v76 = Property;
      }

      id v77 = v145;
      if (v77)
      {
        v78 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
        {
          v132 = v3->_logKey;
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v132;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v77;
          _os_log_error_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_ERROR, "[%@] Owns check resulted in error: %{public}@", buf, 0x16u);
        }
        uint64_t v6 = 0;
      }
      else
      {
        v78 = [v75 valueForKey:v139];
        if (objc_opt_respondsToSelector()) {
          uint64_t v6 = (uint64_t)[v78 BOOLValue];
        }
        else {
          uint64_t v6 = 0;
        }
        v79 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
        {
          v80 = v3->_logKey;
          unsigned int v81 = [v78 BOOLValue];
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v80;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v81;
          _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "[%@] Performed owns check with owns: %{BOOL}d", buf, 0x12u);
        }
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  v82 = +[NSNumber numberWithBool:v6];
  [v140 setObject:v82 forKey:ASDManagedLookupIsActiveAccountAppOwner];

  v83 = +[NSNumber numberWithBool:v18];
  [v140 setObject:v83 forKey:ASDManagedLookupIsAppFree];

  if (!(v6 | objc_msgSend(objc_getProperty(v3, v84, 136, 1), "skipDownloads") | v18))
  {
    uint64_t v85 = ASDErrorWithTitleAndMessage();

    id v42 = (id)v85;
  }
  id v17 = v42;
  v9 = [v140 copy];
  unsigned __int8 v154 = v6 | v18;

LABEL_99:
  uint64_t v11 = v154;
LABEL_100:
  id v10 = v17;
  v86 = [v9 valueForKey:ASDManagedLookupItemID];
  if (!v3->_itemIdentifier && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v87 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v86 longLongValue]);
    v88 = v3->_itemIdentifier;
    v3->_itemIdentifier = (NSNumber *)v87;
  }
  v89 = [v9 valueForKey:ASDManagedLookupBundleID];

  if (!v3->_bundleIdentifier)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v90 = (NSString *)[v89 copy];
      v91 = v3->_bundleIdentifier;
      v3->_bundleIdentifier = v90;
    }
  }
  sub_1002F4380(v3);
  v92 = ASDLogHandleForCategory();
  v93 = v92;
  if (v10)
  {
    if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
    {
      v94 = v3->_logKey;
      *(_DWORD *)v162 = 138412546;
      *(void *)&v162[4] = v94;
      *(_WORD *)&v162[12] = 2114;
      *(void *)&v162[14] = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_ERROR, "[%@] Preflight error: %{public}@", v162, 0x16u);
    }
  }
  else if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
  {
    v95 = v3->_logKey;
    *(_DWORD *)v162 = 138412802;
    *(void *)&v162[4] = v95;
    *(_WORD *)&v162[12] = 1024;
    *(_DWORD *)&v162[14] = v18;
    *(_WORD *)&v162[18] = 1024;
    *(_DWORD *)&v162[20] = v6;
    _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "[%@] Preflight complete free: %{BOOL}d owned: %{BOOL}d", v162, 0x18u);
  }

  if (!v11)
  {
    v100 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
    {
      v129 = v3->_logKey;
      *(_DWORD *)v162 = 138412290;
      *(void *)&v162[4] = v129;
      _os_log_error_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_ERROR, "[%@] App is not eligible for free VPP", v162, 0xCu);
    }
    int v12 = 0;
    goto LABEL_122;
  }
  unsigned int v98 = objc_msgSend(objc_getProperty(v3, v96, 136, 1), "skipDownloads") ^ 1;
  if (!v6) {
    LOBYTE(v98) = 0;
  }
  if ((v98 & 1) != 0 || objc_msgSend(objc_getProperty(v3, v97, 136, 1), "requestType") == (id)1)
  {
    v100 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
    {
      v101 = v3->_logKey;
      *(_DWORD *)v162 = 138412290;
      *(void *)&v162[4] = v101;
      _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_DEFAULT, "[%@] Using VPP endpoint for request", v162, 0xCu);
    }
    int v12 = 1;
    goto LABEL_122;
  }
  unsigned __int8 v114 = objc_msgSend(objc_getProperty(v3, v99, 136, 1), "skipDownloads");
  if (v18) {
    char v115 = v114;
  }
  else {
    char v115 = 1;
  }
  if ((v115 & 1) == 0)
  {
    v116 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
    {
      v117 = v3->_logKey;
      *(_DWORD *)v162 = 138412290;
      *(void *)&v162[4] = v117;
      _os_log_impl((void *)&_mh_execute_header, v116, OS_LOG_TYPE_DEFAULT, "[%@] Purchasing free app", v162, 0xCu);
    }

    v118 = sub_1002F4424((uint64_t)v3, v9);
    [v118 setUseLocalAuthAndSystemDialogs:1];
    id v119 = v118;
    *(void *)&long long v147 = 0;
    *((void *)&v147 + 1) = &v147;
    *(void *)&long long v148 = 0x3032000000;
    *((void *)&v148 + 1) = sub_100018148;
    *(void *)&long long v149 = sub_100017C60;
    *((void *)&v149 + 1) = 0;
    dispatch_semaphore_t v120 = dispatch_semaphore_create(0);
    v121 = sub_100213454();
    *(void *)v162 = _NSConcreteStackBlock;
    *(void *)&v162[8] = 3221225472;
    *(void *)&v162[16] = sub_1002F8520;
    v163 = &unk_1005272D8;
    v100 = v119;
    v164 = v100;
    id v165 = 0;
    v166 = v3;
    v168 = &v147;
    v122 = v120;
    v167 = v122;
    sub_100213A9C((uint64_t)v121, v100, v162);

    dispatch_semaphore_wait(v122, 0xFFFFFFFFFFFFFFFFLL);
    id v123 = *(id *)(*((void *)&v147 + 1) + 40);
    id v124 = [0 copy];

    _Block_object_dispose(&v147, 8);
    id v125 = v123;

    v126 = ASDLogHandleForCategory();
    v127 = v126;
    if (v125)
    {
      if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
      {
        v133 = v3->_logKey;
        *(_DWORD *)v162 = 138412546;
        *(void *)&v162[4] = v133;
        *(_WORD *)&v162[12] = 2114;
        *(void *)&v162[14] = v125;
        _os_log_error_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_ERROR, "[%@] Free purchase failed with error: %{public}@", v162, 0x16u);
      }
    }
    else
    {
      if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
      {
        v141 = v3->_logKey;
        v130 = [v124 componentsJoinedByString:@", "];
        *(_DWORD *)v162 = 138412546;
        *(void *)&v162[4] = v141;
        *(_WORD *)&v162[12] = 2114;
        *(void *)&v162[14] = v130;
        _os_log_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_DEFAULT, "[%@] Free purchase succeeded with jobResults %{public}@", v162, 0x16u);
      }
      unint64_t v144 = 5;
    }

    int v12 = 0;
    id v10 = v125;
LABEL_122:

    goto LABEL_123;
  }
  int v12 = 0;
LABEL_123:

  itemIdentifier = v3->_itemIdentifier;
LABEL_124:
  LOBYTE(bundleIdentifier) = itemIdentifier != 0;
  if (v12 && itemIdentifier)
  {
    id v142 = v10;
    id v143 = 0;
    uint64_t v11 = sub_1002F5E28((uint64_t)v3, &v143, v9, (uint64_t *)&v144, &v142);
    id v102 = v143;
    id v103 = v142;

    if (v102)
    {
      v104 = v102;

      v9 = v104;
    }
    else
    {
      v104 = 0;
    }
    goto LABEL_134;
  }
LABEL_128:
  if ((bundleIdentifier & 1) != 0 || !v12)
  {
    id v103 = v10;
  }
  else
  {
    ASDErrorWithTitleAndMessage();
    id v103 = (id)objc_claimAutoreleasedReturnValue();

    v104 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
    {
      v105 = v3->_logKey;
      *(_DWORD *)v162 = 138412290;
      *(void *)&v162[4] = v105;
      _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "[%@] An itemID is needed for per device calls could not be discovered", v162, 0xCu);
    }
LABEL_134:
  }
  v106 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
  {
    v107 = v3->_logKey;
    externalVersionIdentifier = v3->_externalVersionIdentifier;
    v109 = sub_1002F36DC(v144);
    *(_DWORD *)v162 = 138413058;
    *(void *)&v162[4] = v107;
    *(_WORD *)&v162[12] = 2114;
    *(void *)&v162[14] = externalVersionIdentifier;
    *(_WORD *)&v162[22] = 2114;
    v163 = v109;
    LOWORD(v164) = 1024;
    *(_DWORD *)((char *)&v164 + 2) = v11;
    _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEFAULT, "[%@] Complete for evid: %{public}@ changeType: %{public}@ success: %{BOOL}d", v162, 0x26u);
  }
  v111 = (void (**)(id, void, id, unint64_t, id))objc_getProperty(v3, v110, 152, 1);
  if (v111) {
    v111[2](v111, v11, v9, v144, v103);
  }
  v3->_resultChangeType = v144;
  objc_setProperty_atomic_copy(v3, v112, v103, 32);
  v3->super._success = v11;
  keepAlive = v3->_keepAlive;
  v3->_keepAlive = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultBlock, 0);
  objc_storeStrong(&self->_detailedResultBlock, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_logKeyExternalID, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_keepAlive, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_externalVersionIdentifier, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_appProxy, 0);
  objc_storeStrong((id *)&self->_applicationVariant, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end