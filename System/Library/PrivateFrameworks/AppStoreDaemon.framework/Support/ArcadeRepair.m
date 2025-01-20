@interface ArcadeRepair
+ (BOOL)shouldAttemptToRepairApplication:(id)a3 options:(id)a4 logKey:(id)a5;
- (ApplicationRepairDelegate)delegate;
- (BOOL)repairApplication:(id)a3 error:(id *)a4;
- (NSArray)repairedBundleIDs;
- (NSString)repairType;
- (_TtC9appstored6LogKey)logKey;
- (int)fairPlayStatus;
- (void)setDelegate:(id)a3;
- (void)setLogKey:(id)a3;
@end

@implementation ArcadeRepair

- (ApplicationRepairDelegate)delegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);
  return (ApplicationRepairDelegate *)WeakRetained;
}

- (int)fairPlayStatus
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LODWORD(v2) = v2->_discoveredFairPlayStatus;
  os_unfair_lock_unlock(p_lock);
  return (int)v2;
}

- (_TtC9appstored6LogKey)logKey
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->lock_logKey;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setLogKey:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  v6 = [v5 prependingCategory:@"Arcade"];

  lock_logKey = self->lock_logKey;
  self->lock_logKey = v6;

  os_unfair_lock_unlock(p_lock);
}

- (NSArray)repairedBundleIDs
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSArray *)self->_repairedBundleIDs copy];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSString)repairType
{
  return (NSString *)@"Arcade";
}

+ (BOOL)shouldAttemptToRepairApplication:(id)a3 options:(id)a4 logKey:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[ACAccountStore ams_sharedAccountStore];
  v11 = objc_msgSend(v10, "ams_activeiTunesAccount");
  if (v11)
  {
  }
  else
  {
    unsigned int v12 = [v7 isArcade];

    if (v12)
    {
      v13 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138412290;
        id v21 = v9;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[Arcade/%@] Will start arcade recovery to sign in", (uint8_t *)&v20, 0xCu);
      }

      BOOL v14 = 1;
      goto LABEL_20;
    }
  }
  if (![v7 isArcade])
  {
LABEL_19:
    BOOL v14 = 0;
    goto LABEL_20;
  }
  unsigned int v15 = sub_10023F96C((uint64_t)ArcadeRepair, v7, v8);
  unsigned int v16 = v15;
  if (v15 + 42587 <= 3 && v15 != -42586 || v15 == -42110 || v15 == -42112)
  {
    v17 = ASDLogHandleForCategory();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    int v20 = 138412546;
    id v21 = v9;
    __int16 v22 = 1024;
    unsigned int v23 = v16;
    v18 = "[Arcade/%@] Will start arcade fairplay recovery with fairplayStatus: %d";
    goto LABEL_14;
  }
  v17 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412546;
    id v21 = v9;
    __int16 v22 = 1024;
    unsigned int v23 = v16;
    v18 = "[Arcade/%@] Will not attempt arcade recovery with fairplayStatus: %d";
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v20, 0x12u);
  }
LABEL_15:

  BOOL v14 = 1;
  if ((v16 + 42587 > 3 || v16 == -42586) && v16 != -42112 && v16 != -42110) {
    goto LABEL_19;
  }
LABEL_20:

  return v14;
}

- (BOOL)repairApplication:(id)a3 error:(id *)a4
{
  if (([(ASDRepairOptions *)self->_options isBackground] & 1) != 0
    || (+[LSApplicationWorkspace defaultWorkspace],
        v6 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v7 = [v6 applicationIsInstalled:@"com.apple.AppStore"],
        v6,
        (v7 & 1) != 0))
  {
    id v8 = +[NSDate date];
    [v8 timeIntervalSinceReferenceDate];
    self->_double startTime = v9;

    v10 = sub_10030B11C();
    v11 = sub_10030C238(v10, @"arcade-launch-timeout-interval-seconds");
    id v60 = 0;
    unsigned int v12 = [v11 valueWithError:&v60];
    id v13 = v60;

    if (v13)
    {
      BOOL v14 = +[NSDate date];
      [v14 timeIntervalSinceReferenceDate];
      double v16 = v15 - self->_startTime;

      int IsEqual = ASDErrorIsEqual();
      v18 = ASDLogHandleForCategory();
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      if (IsEqual)
      {
        if (v19)
        {
          int v20 = [(ArcadeRepair *)self logKey];
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v20;
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = v16;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[%@] Timeout during looking up timeout value with elapsedTime: %f", buf, 0x16u);
        }
        if ([(ASDRepairOptions *)self->_options isBackground])
        {
          id v21 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v22 = [(ArcadeRepair *)self logKey];
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v22;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[%@] Not showing timeout dialog for background repair", buf, 0xCu);
          }
        }
        else
        {
          sub_100240254(self, 12.0);
        }
        LOBYTE(v35) = 0;
LABEL_37:

        return (char)v35;
      }
      if (v19)
      {
        v45 = [(ArcadeRepair *)self logKey];
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = v45;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v13;
        *(_WORD *)&buf[22] = 2048;
        *(double *)&buf[24] = v16;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[%@] Non fatal error loading timeout value for error: %{public}@ elapsedTime: %f", buf, 0x20u);
      }
      double v24 = 3.0;
    }
    else
    {
      [v12 floatValue];
      double v24 = v23;
    }
    if (os_variant_has_internal_content())
    {
      v46 = sub_1003F2E04();

      if (v46)
      {
        v47 = sub_1003F2E04();
        [v47 floatValue];
        double v24 = v48;

        v49 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          v50 = [(ArcadeRepair *)self logKey];
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v50;
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = v24;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "[%@] Using override timeout: %f", buf, 0x16u);
        }
      }
    }
    v35 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v51 = [(ArcadeRepair *)self logKey];
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v51;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v24;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "[%@] Started arcade fairplay recovery with timeout: %f", buf, 0x16u);
    }
    LODWORD(v35) = sub_10024057C((uint64_t)self, v24, v24 + v24);
    if (a4 && v13) {
      *a4 = v13;
    }
    v52 = +[NSDate date];
    [v52 timeIntervalSinceReferenceDate];
    double v54 = v53;
    double startTime = self->_startTime;

    v56 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      v57 = [(ArcadeRepair *)self logKey];
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v57;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v35;
      *(_WORD *)&buf[18] = 2048;
      *(double *)&buf[20] = v54 - startTime;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "[%@] Arcade fairplay recovery complete with result: %d elapsedTime: %f", buf, 0x1Cu);
    }
    goto LABEL_37;
  }
  id v25 = [(ArcadeRepair *)self logKey];
  v26 = ASDLocalizedString();
  v27 = +[NSString localizedStringWithFormat:v26];
  v28 = ASDLocalizedString();
  v29 = +[AMSDialogRequest requestWithTitle:v27 message:v28];

  v30 = ASDLocalizedString();
  v31 = +[NSString localizedStringWithFormat:v30];
  v32 = +[AMSDialogAction actionWithTitle:v31 style:0];

  v33 = ASDLocalizedString();
  v34 = +[NSString localizedStringWithFormat:v33];
  v35 = +[AMSDialogAction actionWithTitle:v34 style:2];

  v64[0] = v32;
  v64[1] = v35;
  v36 = +[NSArray arrayWithObjects:v64 count:2];
  [v29 setButtonActions:v36];

  [v29 setDefaultAction:v32];
  v37 = sub_10033CBA4((uint64_t)InteractiveRequestPresenter, v29, 0);
  v38 = [v37 selectedActionIdentifier];
  v39 = [v35 identifier];
  unsigned int v40 = [v38 isEqualToString:v39];

  v41 = ASDLogHandleForCategory();
  BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
  if (v40)
  {
    if (v42)
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v25;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "[%@] User selected to install distributor", buf, 0xCu);
    }

    v41 = [objc_alloc((Class)ASDSystemAppMetadata) initWithBundleID:@"com.apple.AppStore"];
    [v41 setUserInitiated:1];
    v43 = sub_10022889C();
    v63 = v41;
    v44 = +[NSArray arrayWithObjects:&v63 count:1];
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_10024258C;
    *(void *)&buf[24] = &unk_1005233E8;
    id v62 = v25;
    [v43 installSystemApps:v44 onPairedDevice:0 withReplyHandler:buf];
  }
  else if (v42)
  {
    v58 = [(ArcadeRepair *)self logKey];
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v58;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "[%@] User selected cancel distributor install", buf, 0xCu);
  }
  LOBYTE(v35) = 0;
  return (char)v35;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repairedBundleIDs, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->lock_logKey, 0);
  objc_storeStrong((id *)&self->_application, 0);
}

@end