@interface PerformUpdatesTask
- (NSArray)jobResults;
- (NSArray)orderedBundleIDs;
- (PerformUpdatesTask)initWithContext:(id)a3;
- (_TtC9appstored14UpdatesContext)context;
- (void)completeWithError:(id)a3;
- (void)completeWithSuccess;
- (void)main;
- (void)setContext:(id)a3;
- (void)setOrderedBundleIDs:(id)a3;
@end

@implementation PerformUpdatesTask

- (PerformUpdatesTask)initWithContext:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PerformUpdatesTask;
  v6 = [(Task *)&v12 init];
  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    updatesPurchases = v6->_updatesPurchases;
    v6->_updatesPurchases = (NSMutableArray *)v7;

    uint64_t v9 = objc_opt_new();
    jobResultItems = v6->_jobResultItems;
    v6->_jobResultItems = (NSMutableArray *)v9;

    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v6;
}

- (NSArray)jobResults
{
  [(Task *)self lock];
  id v3 = [(NSMutableArray *)self->_jobResultItems copy];
  [(Task *)self unlock];
  return (NSArray *)v3;
}

- (void)completeWithSuccess
{
  sub_100255884((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)PerformUpdatesTask;
  [(Task *)&v3 completeWithSuccess];
}

- (void)completeWithError:(id)a3
{
  id v4 = a3;
  sub_100255884((uint64_t)self);
  v5.receiver = self;
  v5.super_class = (Class)PerformUpdatesTask;
  [(Task *)&v5 completeWithError:v4];
}

- (void)main
{
  v2 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v3 = [(PerformUpdatesTask *)self context];
    id v4 = [v3 logKey];
    objc_super v5 = [(PerformUpdatesTask *)self context];
    v6 = [v5 humanReadableReason];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v6;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[%@] Perform updates start with reason: %{public}@", buf, 0x16u);
  }
  if (self)
  {
    if (self->_powerAssertionID) {
      sub_100255884((uint64_t)self);
    }
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(Mutable, @"AssertType", @"PreventUserIdleSystemSleep");
    if ([(UpdatesContext *)self->_context isBackgroundRequest]) {
      CFStringRef v8 = @"Background";
    }
    else {
      CFStringRef v8 = @"User";
    }
    uint64_t v9 = [(UpdatesContext *)self->_context logKey];
    v10 = +[NSString stringWithFormat:@"Update All (%@) - %@", v8, v9];

    CFDictionarySetValue(Mutable, @"AssertName", v10);
    if (![(UpdatesContext *)self->_context isBackgroundRequest])
    {
      CFDictionarySetValue(Mutable, @"TimeoutSeconds", &off_10054BCE8);
      CFDictionarySetValue(Mutable, @"TimeoutAction", @"TimeoutActionTurnOff");
    }
    IOReturn v11 = IOPMAssertionCreateWithProperties(Mutable, &self->_powerAssertionID);
    objc_super v12 = ASDLogHandleForCategory();
    v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v14 = [(UpdatesContext *)self->_context logKey];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v14;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v11;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "[%@] Failed to obtain a power assertion: %d", buf, 0x12u);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [(UpdatesContext *)self->_context logKey];
      unsigned int powerAssertionID = self->_powerAssertionID;
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = powerAssertionID;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%@] Obtained power assertion: %d", buf, 0x12u);
    }
    CFRelease(Mutable);
  }
  v17 = objc_opt_new();
  v86 = objc_opt_new();
  v18 = objc_opt_new();
  v19 = sub_10001A308();
  v115[0] = _NSConcreteStackBlock;
  v115[1] = 3221225472;
  v115[2] = sub_100256A90;
  v115[3] = &unk_100523CA8;
  id v94 = v17;
  id v116 = v94;
  v84 = v18;
  v117 = v84;
  [v19 readUsingSession:v115];

  NSUInteger v20 = [(NSArray *)self->_orderedBundleIDs count];
  orderedBundleIDs = v84;
  if (v20) {
    orderedBundleIDs = self->_orderedBundleIDs;
  }
  v22 = orderedBundleIDs;
  v83 = sub_100336460((uint64_t)Restrictions, 0);
  id v92 = [v83 integerValue];
  if (+[ASDUpdatesService isAutomaticUpdateAuthorizationEnabled])
  {
    v23 = [(PerformUpdatesTask *)self context];
    unsigned int v24 = [v23 userInitiated];

    int v90 = v24 ^ 1;
  }
  else
  {
    int v90 = 0;
  }
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  obj = v22;
  id v95 = [(NSArray *)obj countByEnumeratingWithState:&v111 objects:v123 count:16];
  if (!v95)
  {

    goto LABEL_74;
  }
  uint64_t v89 = 0;
  uint64_t v93 = *(void *)v112;
  uint64_t v85 = ASDErrorDomain;
  do
  {
    v25 = 0;
    do
    {
      if (*(void *)v112 != v93) {
        objc_enumerationMutation(obj);
      }
      uint64_t v26 = *(void *)(*((void *)&v111 + 1) + 8 * (void)v25);
      v27 = [v94 objectForKeyedSubscript:v26];
      v28 = v27;
      if (v27)
      {
        if ((uint64_t)[v27 parentalControlsRank] > (uint64_t)v92)
        {
          v29 = +[ASDJobResult resultWithRestrictedActivity:bundleID:](ASDJobResult, "resultWithRestrictedActivity:bundleID:", [v28 databaseID], v26);
          [(NSMutableArray *)self->_jobResultItems addObject:v29];
          v30 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            v31 = [(PerformUpdatesTask *)self context];
            v32 = [v31 logKey];
            id v33 = [v28 parentalControlsRank];
            *(_DWORD *)buf = 138413058;
            *(void *)&buf[4] = v32;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v26;
            *(_WORD *)&buf[22] = 2048;
            v119 = v33;
            *(_WORD *)v120 = 2048;
            *(void *)&v120[2] = v92;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "[%@] Skipping %{public}@ due to restrictions, parentalControlsRank: %ld restrictionsRank: %ld", buf, 0x2Au);
          }
          goto LABEL_66;
        }
        if (!v90) {
          goto LABEL_47;
        }
        id v35 = v28;
        v36 = v35;
        if (self)
        {
          id v37 = objc_alloc((Class)LSApplicationRecord);
          v38 = [v36 bundleID];
          id v100 = 0;
          id v39 = [v37 initWithBundleIdentifier:v38 allowPlaceholder:0 error:&v100];
          id v40 = v100;

          if (v40)
          {
            v41 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              v74 = [(PerformUpdatesTask *)self context];
              v75 = [v74 logKey];
              v76 = [v36 bundleID];
              *(_DWORD *)buf = 138412802;
              *(void *)&buf[4] = v75;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v76;
              *(_WORD *)&buf[22] = 2114;
              v119 = v40;
              _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "[%@] Error looking up record for: %{public}@ error: %{public}@", buf, 0x20u);
            }
LABEL_47:
            uint64_t v107 = 0;
            v108 = &v107;
            uint64_t v109 = 0x2020000000;
            char v110 = 0;
            v106[0] = 0;
            v106[1] = v106;
            v106[2] = 0x2020000000;
            v106[3] = 0;
            id v100 = 0;
            v101 = &v100;
            uint64_t v102 = 0x3032000000;
            v103 = sub_100017F58;
            v104 = sub_100017B68;
            id v105 = 0;
            v51 = sub_1003E0BA4();
            v99[0] = _NSConcreteStackBlock;
            v99[1] = 3221225472;
            v99[2] = sub_100256BAC;
            v99[3] = &unk_100523CD0;
            v99[4] = v26;
            v99[5] = &v100;
            v99[6] = &v107;
            v99[7] = v106;
            [v51 readUsingSession:v99];

            if (*((unsigned char *)v108 + 24))
            {
              v52 = ASDLogHandleForCategory();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
              {
                v53 = [(PerformUpdatesTask *)self context];
                v54 = [v53 logKey];
                *(_DWORD *)buf = 138412546;
                *(void *)&buf[4] = v54;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v26;
                _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "[%@] Skipping %{public}@ due to the existence of an in-progress installation for the same bundle ID", buf, 0x16u);
              }
              v55 = [(PerformUpdatesTask *)self context];
              unsigned int v56 = [v55 userInitiated];

              if (!v56) {
                goto LABEL_65;
              }
              v57 = ASDLogHandleForCategory();
              if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
              {
                v58 = [(PerformUpdatesTask *)self context];
                v59 = [v58 logKey];
                id v60 = v101[5];
                *(_DWORD *)buf = 138412546;
                *(void *)&buf[4] = v59;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v60;
                _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "[%@] [%@] Converting to a user-initiated installation…", buf, 0x16u);
              }
              v61 = sub_1003E0BA4();
              v98[0] = _NSConcreteStackBlock;
              v98[1] = 3221225472;
              v98[2] = sub_100256C44;
              v98[3] = &unk_100523CF8;
              v98[4] = v106;
              [v61 modifyUsingTransaction:v98];
            }
            else
            {
              v61 = objc_msgSend(v28, "purchaseInfoForUpdateUserInitiated:", -[UpdatesContext isBackgroundRequest](self->_context, "isBackgroundRequest") ^ 1);
              v62 = [v61 account];
              objc_msgSend(v62, "ams_DSID");
              v63 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();

              if (!v63) {
                v63 = &off_10054BCD0;
              }
              if ([v61 isMachineBased])
              {

                v63 = &off_10054BCD0;
              }
              v64 = [(UpdatesContext *)self->_context requestToken];
              [v61 setRequestToken:v64];

              v65 = [v86 objectForKeyedSubscript:v63];
              id v66 = v65;
              if (v65)
              {
                [v65 addObject:v61];
              }
              else
              {
                id v66 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v61, 0);
                [v86 setObject:v66 forKeyedSubscript:v63];
              }
              v67 = ASDLogHandleForCategory();
              if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
              {
                v88 = [(PerformUpdatesTask *)self context];
                v87 = [v88 logKey];
                v68 = [v28 bundleID];
                v69 = [v28 itemIdentifier];
                id v70 = [v69 longLongValue];
                v71 = [v61 externalID];
                *(_DWORD *)buf = 138413314;
                *(void *)&buf[4] = v87;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v68;
                *(_WORD *)&buf[22] = 2048;
                v119 = v70;
                *(_WORD *)v120 = 2114;
                *(void *)&v120[2] = v71;
                __int16 v121 = 2114;
                v122 = v63;
                _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "[%@] [%{public}@:%lld][%{public}@] Added purchase for account: %{public}@", buf, 0x34u);
              }
              ++v89;
            }

LABEL_65:
            _Block_object_dispose(&v100, 8);

            _Block_object_dispose(v106, 8);
            _Block_object_dispose(&v107, 8);
            goto LABEL_66;
          }
          if ((sub_10042802C(v39) & 1) == 0)
          {

            goto LABEL_47;
          }
          v42 = sub_1003F1F68((uint64_t)AppDefaultsManager, @"AutomaticUpdateAuthorizations");
          uint64_t v43 = [v36 bundleID];
          v44 = [v42 objectForKeyedSubscript:v43];

          LOBYTE(v43) = [v44 BOOLValue];
          if (v43) {
            goto LABEL_47;
          }
        }
        else
        {
        }
        id v45 = [objc_alloc((Class)NSError) initWithDomain:v85 code:1301 userInfo:0];
        v46 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v36 databaseID]);
        v47 = +[ASDJobResult resultWithPersistentID:v46 bundleID:v26 status:1 error:v45];

        [(NSMutableArray *)self->_jobResultItems addObject:v47];
        v48 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          v49 = [(PerformUpdatesTask *)self context];
          v50 = [v49 logKey];
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v50;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v26;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "[%@] Skipping %{public}@ due to automatic update authorization needed", buf, 0x16u);
        }
      }
      else
      {
        v34 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          v72 = [(PerformUpdatesTask *)self context];
          v73 = [v72 logKey];
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v73;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v26;
          _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "[%@] Could not find update for bundleID: %{public}@", buf, 0x16u);
        }
      }
LABEL_66:

      v25 = (char *)v25 + 1;
    }
    while (v95 != v25);
    id v77 = [(NSArray *)obj countByEnumeratingWithState:&v111 objects:v123 count:16];
    id v95 = v77;
  }
  while (v77);

  if (v89 >= 1 && self)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_100256C74;
    v119 = &unk_100523D48;
    *(void *)v120 = self;
    [v86 enumerateKeysAndObjectsUsingBlock:buf];
  }
LABEL_74:
  [(PerformUpdatesTask *)self completeWithSuccess];
  v78 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
  {
    v79 = [(PerformUpdatesTask *)self context];
    v80 = [v79 logKey];
    v81 = [(PerformUpdatesTask *)self context];
    v82 = [v81 humanReadableReason];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v80;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v82;
    _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "[%@] Perform updates complete with reason: %{public}@", buf, 0x16u);
  }
}

- (_TtC9appstored14UpdatesContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSArray)orderedBundleIDs
{
  return self->_orderedBundleIDs;
}

- (void)setOrderedBundleIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedBundleIDs, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_jobResultItems, 0);
  objc_storeStrong((id *)&self->_updatesPurchases, 0);
}

@end