@interface FamilyManager
+ (FamilyManager)sharedInstance;
- (BOOL)_bootstrapFamilyIfNeededSuppressDialogs:(BOOL)a3 logKey:(id)a4 error:(id *)a5;
- (BOOL)askToBuyEnabledForActiveAccountWithLogKey:(id)a3 lookupFamilyInfoIfNeeded:(BOOL)a4 authIfNeeded:(BOOL)a5 hadFamilyInfo:(BOOL *)a6 error:(id *)a7;
- (FamilyManager)init;
- (id)_familyMembersSuppressDialogs:(BOOL)a3 logKey:(id)a4 error:(id *)a5;
- (id)familyAccountIDs;
- (id)familyMembers;
- (id)fetchFamilyAccountIDsSuppressDialogs:(BOOL)a3;
- (void)_beginObservingAccountChangeNotification;
- (void)_clearFamily;
- (void)_handleAccountChangedNotification;
- (void)_updateFamilyInfoFollowingAccountChangeIfNeeded:(id)a3;
- (void)performMigration;
@end

@implementation FamilyManager

- (FamilyManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)FamilyManager;
  v2 = [(FamilyManager *)&v10 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init((Class)NSLock);
    lock = v2->_lock;
    v2->_lock = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.storekit.FamilyManager.dispatch", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    dispatch = v2->_dispatch;
    v2->_dispatch = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.storekit.FamilyManager.notifications", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v7;

    [(FamilyManager *)v2 _beginObservingAccountChangeNotification];
  }
  return v2;
}

+ (FamilyManager)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100066EC0;
  block[3] = &unk_1003572F0;
  block[4] = a1;
  if (qword_10039FD48 != -1) {
    dispatch_once(&qword_10039FD48, block);
  }
  v2 = (void *)qword_10039FD40;

  return (FamilyManager *)v2;
}

- (BOOL)askToBuyEnabledForActiveAccountWithLogKey:(id)a3 lookupFamilyInfoIfNeeded:(BOOL)a4 authIfNeeded:(BOOL)a5 hadFamilyInfo:(BOOL *)a6 error:(id *)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v11 = a3;
  v12 = +[ACAccountStore ams_sharedAccountStore];
  v13 = objc_msgSend(v12, "ams_activeiTunesAccount");

  v14 = [v13 ams_DSID];
  v15 = +[FamilyInfoLookupTask cachedFamilyInfoWithLogKey:v11];
  unint64_t v16 = (unint64_t)v15;
  BOOL v17 = v15 != 0;
  if (!v15)
  {
    if (qword_10039FD98 != -1) {
      dispatch_once(&qword_10039FD98, &stru_100359510);
    }
    v21 = (void *)qword_10039FD50;
    if (os_log_type_enabled((os_log_t)qword_10039FD50, OS_LOG_TYPE_DEFAULT))
    {
      loga = v21;
      BOOL v22 = v17;
      id v23 = v11;
      v24 = objc_opt_class();
      v46 = a7;
      v48 = a6;
      id v25 = v24;
      [v13 ams_DSID];
      v27 = v26 = v13;
      *(_DWORD *)buf = 138543874;
      v59 = v24;
      id v11 = v23;
      BOOL v17 = v22;
      __int16 v60 = 2114;
      id v61 = v11;
      __int16 v62 = 2114;
      v63 = v27;
      _os_log_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@] Did not find cached FamilyInfo for account: %{public}@", buf, 0x20u);

      v13 = v26;
      a7 = v46;
      a6 = v48;
    }
    uint64_t v18 = 0;
    if (v10) {
      goto LABEL_3;
    }
LABEL_9:
    id v20 = 0;
    goto LABEL_10;
  }
  uint64_t v18 = [v15 familyMembers];
  if (!v10) {
    goto LABEL_9;
  }
LABEL_3:
  id v57 = 0;
  [(FamilyManager *)self _familyMembersSuppressDialogs:!v9 logKey:v11 error:&v57];
  uint64_t v18 = v19 = (void *)v18;
  id v20 = v57;

  BOOL v17 = (v16 | v18) != 0;
LABEL_10:
  LOBYTE(v28) = 0;
  if (v18 && !v20 && v14)
  {
    os_log_t log = v13;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v29 = [(id)v16 familyMembers];
    id v28 = [v29 countByEnumeratingWithState:&v53 objects:v66 count:16];
    if (v28)
    {
      v42 = 0;
      uint64_t v43 = v18;
      BOOL v44 = v17;
      v47 = a7;
      v49 = a6;
      id v45 = v11;
      uint64_t v30 = *(void *)v54;
      while (2)
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          if (*(void *)v54 != v30) {
            objc_enumerationMutation(v29);
          }
          v32 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          uint64_t v33 = objc_msgSend(v32, "iTunesDSID", v42);
          if (v33)
          {
            v34 = (void *)v33;
            v35 = [v32 iTunesDSID];
            unsigned int v36 = [v35 isEqualToNumber:v14];

            if (v36)
            {
              LODWORD(v28) = [v32 isAskToBuyEnabled];
              if (qword_10039FD98 != -1) {
                dispatch_once(&qword_10039FD98, &stru_100359510);
              }
              id v11 = v45;
              a7 = v47;
              a6 = v49;
              id v20 = v42;
              v37 = (void *)qword_10039FD50;
              if (os_log_type_enabled((os_log_t)qword_10039FD50, OS_LOG_TYPE_DEFAULT))
              {
                v38 = v37;
                v39 = objc_opt_class();
                *(_DWORD *)buf = 138544130;
                v59 = v39;
                __int16 v60 = 2114;
                id v61 = v45;
                __int16 v62 = 2114;
                v63 = v14;
                __int16 v64 = 1024;
                int v65 = (int)v28;
                id v40 = v39;
                _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@] Family member found for account: %{public}@ askToBuyEnabled: %d", buf, 0x26u);
              }
              BOOL v17 = v44;
              uint64_t v18 = v43;
              goto LABEL_28;
            }
          }
        }
        id v28 = [v29 countByEnumeratingWithState:&v53 objects:v66 count:16];
        if (v28) {
          continue;
        }
        break;
      }
      id v11 = v45;
      a7 = v47;
      a6 = v49;
      BOOL v17 = v44;
      id v20 = v42;
      uint64_t v18 = v43;
    }
LABEL_28:

    v13 = log;
  }
  if (a7) {
    *a7 = v20;
  }
  if (a6) {
    *a6 = v17;
  }

  return (char)v28;
}

- (id)familyAccountIDs
{
  return [(FamilyManager *)self fetchFamilyAccountIDsSuppressDialogs:0];
}

- (id)fetchFamilyAccountIDsSuppressDialogs:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_queue_t v5 = +[NSUUID lib_shortLogKey];
  [(FamilyManager *)self _bootstrapFamilyIfNeededSuppressDialogs:v3 logKey:v5 error:0];
  [(NSLock *)self->_lock lock];
  id v6 = [(NSArray *)self->_familyAccountIDs copy];
  [(NSLock *)self->_lock unlock];

  return v6;
}

- (id)familyMembers
{
  BOOL v3 = +[NSUUID lib_shortLogKey];
  v4 = [(FamilyManager *)self _familyMembersSuppressDialogs:0 logKey:v3 error:0];

  return v4;
}

- (void)performMigration
{
  dispatch = self->_dispatch;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006749C;
  block[3] = &unk_100358170;
  block[4] = self;
  dispatch_async(dispatch, block);
}

- (void)_beginObservingAccountChangeNotification
{
  id v7 = +[NSNotificationCenter defaultCenter];
  BOOL v3 = +[ActiveAccountObserver sharedInstance];
  [v7 addObserver:self selector:"_handleAccountChangedNotification" name:@"AccountStorePrimaryAccountDidChange" object:v3];

  v4 = +[ActiveAccountObserver activeAccount];
  objc_msgSend(v4, "ams_DSID");
  dispatch_queue_t v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  currentAccountDSID = self->_currentAccountDSID;
  self->_currentAccountDSID = v5;
}

- (BOOL)_bootstrapFamilyIfNeededSuppressDialogs:(BOOL)a3 logKey:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  if (self->_lastFamilyCheck > 0.0)
  {
    BOOL v9 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    [v9 timeIntervalSinceNow];
    double v11 = v10;

    if (v11 >= -10800.0)
    {
      id v20 = 0;
      goto LABEL_44;
    }
  }
  if (qword_10039FD98 != -1) {
    dispatch_once(&qword_10039FD98, &stru_100359510);
  }
  v12 = (void *)qword_10039FD50;
  if (os_log_type_enabled((os_log_t)qword_10039FD50, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    *(_DWORD *)buf = 138543874;
    id v67 = (id)objc_opt_class();
    __int16 v68 = 2114;
    id v69 = v8;
    __int16 v70 = 1024;
    LODWORD(v71) = 1;
    id v14 = v67;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@] Bootstrapping family : refresh from server: %d", buf, 0x1Cu);
  }
  v15 = [FamilyInfoLookupTask alloc];
  unint64_t v16 = +[Bag defaultBag];
  BOOL v17 = [(FamilyInfoLookupTask *)v15 initWithBag:v16];

  [(FamilyInfoLookupTask *)v17 setLogKey:v8];
  [(FamilyInfoLookupTask *)v17 setSuppressDialogs:v6];
  uint64_t v18 = [(FamilyInfoLookupTask *)v17 performFamilyInfoLookup];
  id v64 = 0;
  v19 = [v18 resultWithError:&v64];
  id v20 = v64;

  if (v20)
  {
    if (qword_10039FD98 != -1) {
      dispatch_once(&qword_10039FD98, &stru_100359510);
    }
    v21 = (void *)qword_10039FD50;
    if (os_log_type_enabled((os_log_t)qword_10039FD50, OS_LOG_TYPE_ERROR))
    {
      BOOL v22 = v21;
      id v23 = objc_opt_class();
      *(_DWORD *)buf = 138544130;
      id v67 = v23;
      __int16 v68 = 2114;
      id v69 = v8;
      __int16 v70 = 2114;
      id v71 = v20;
      __int16 v72 = 1024;
      BOOL v73 = v6;
      id v24 = v23;
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "[%{public}@] [%{public}@] Family circle request resulted in error: [%{public}@] isBackground: %d", buf, 0x26u);
    }
    goto LABEL_40;
  }
  +[NSDate timeIntervalSinceReferenceDate];
  self->_lastFamilyCheck = v25;
  v26 = [v19 familyMembers];

  if (!v26) {
    goto LABEL_40;
  }
  long long v55 = v17;
  id v57 = a5;
  id v58 = v8;
  [(NSLock *)self->_lock lock];
  long long v54 = v19;
  v27 = [v19 familyMembers];
  id v28 = (NSArray *)[v27 copy];
  familyMembers = self->_familyMembers;
  self->_familyMembers = v28;

  uint64_t v30 = +[ActiveAccountObserver activeAccount];
  v31 = objc_msgSend(v30, "ams_DSID");

  v59 = objc_opt_new();
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v56 = self;
  v32 = self->_familyMembers;
  id v33 = [(NSArray *)v32 countByEnumeratingWithState:&v60 objects:v65 count:16];
  if (!v33) {
    goto LABEL_34;
  }
  id v34 = v33;
  uint64_t v35 = *(void *)v61;
  do
  {
    for (i = 0; i != v34; i = (char *)i + 1)
    {
      if (*(void *)v61 != v35) {
        objc_enumerationMutation(v32);
      }
      v37 = *(void **)(*((void *)&v60 + 1) + 8 * i);
      if (!v31)
      {
        BOOL v44 = [*(id *)(*((void *)&v60 + 1) + 8 * i) iTunesDSID];
        unint64_t v16 = v44;
        if (v44)
        {

LABEL_30:
          v41 = v16;
          unint64_t v16 = [v37 iTunesDSID];
          [v59 addObject:v16];
LABEL_31:

          unint64_t v16 = v41;
          continue;
        }
      }
      v38 = [v37 iTunesDSID];
      v39 = v38;
      if (v38) {
        BOOL v40 = v31 == 0;
      }
      else {
        BOOL v40 = 1;
      }
      if (v40)
      {

        v41 = v16;
        if (v31) {
          continue;
        }
        goto LABEL_31;
      }
      v42 = [v37 iTunesDSID];
      unsigned __int8 v43 = [v42 isEqualToNumber:v31];

      if ((v43 & 1) == 0) {
        goto LABEL_30;
      }
    }
    id v34 = [(NSArray *)v32 countByEnumeratingWithState:&v60 objects:v65 count:16];
  }
  while (v34);
LABEL_34:

  id v45 = (NSArray *)[v59 copy];
  familyAccountIDs = v56->_familyAccountIDs;
  v56->_familyAccountIDs = v45;

  [(NSLock *)v56->_lock unlock];
  a5 = v57;
  id v8 = v58;
  v19 = v54;
  id v20 = 0;
  if ([(NSArray *)v56->_familyAccountIDs count])
  {
    if (qword_10039FD98 != -1) {
      dispatch_once(&qword_10039FD98, &stru_100359510);
    }
    v47 = (void *)qword_10039FD50;
    if (os_log_type_enabled((os_log_t)qword_10039FD50, OS_LOG_TYPE_DEFAULT))
    {
      v48 = v47;
      v49 = objc_opt_class();
      v50 = v56->_familyAccountIDs;
      id v51 = v49;
      v52 = [(NSArray *)v50 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138543874;
      id v67 = v49;
      __int16 v68 = 2114;
      id v69 = v58;
      __int16 v70 = 2114;
      id v71 = v52;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@] Set family accounts to: [%{public}@]", buf, 0x20u);
    }
  }

  BOOL v17 = v55;
LABEL_40:

  if (a5 && v20)
  {
    id v20 = v20;
    *a5 = v20;
  }
LABEL_44:

  return v20 == 0;
}

- (void)_clearFamily
{
  if (self->_familyMembers)
  {
    if (qword_10039FD98 != -1) {
      dispatch_once(&qword_10039FD98, &stru_100359510);
    }
    BOOL v3 = (void *)qword_10039FD50;
    if (os_log_type_enabled((os_log_t)qword_10039FD50, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      *(_DWORD *)id v8 = 138543362;
      *(void *)&v8[4] = objc_opt_class();
      id v5 = *(id *)&v8[4];
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cleared family", v8, 0xCu);
    }
  }
  [(NSLock *)self->_lock lock];
  familyMembers = self->_familyMembers;
  self->_familyMembers = 0;
  self->_lastFamilyCheck = 0.0;

  familyAccountIDs = self->_familyAccountIDs;
  self->_familyAccountIDs = 0;

  [(NSLock *)self->_lock unlock];
}

- (id)_familyMembersSuppressDialogs:(BOOL)a3 logKey:(id)a4 error:(id *)a5
{
  [(FamilyManager *)self _bootstrapFamilyIfNeededSuppressDialogs:a3 logKey:a4 error:a5];
  [(NSLock *)self->_lock lock];
  id v6 = [(NSArray *)self->_familyMembers copy];
  [(NSLock *)self->_lock unlock];

  return v6;
}

- (void)_handleAccountChangedNotification
{
  notificationQueue = self->_notificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100068170;
  block[3] = &unk_100358170;
  block[4] = self;
  dispatch_async(notificationQueue, block);
}

- (void)_updateFamilyInfoFollowingAccountChangeIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = +[NSUUID lib_shortLogKey];
  long long v54 = self;
  if (qword_10039FD98 != -1) {
    dispatch_once(&qword_10039FD98, &stru_100359510);
  }
  id v6 = (void *)qword_10039FD50;
  if (os_log_type_enabled((os_log_t)qword_10039FD50, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    id v8 = objc_opt_class();
    id v9 = v8;
    double v10 = objc_msgSend(v4, "ams_DSID");
    *(_DWORD *)buf = 138543874;
    long long v62 = v8;
    __int16 v63 = 2114;
    id v64 = v5;
    __int16 v65 = 2114;
    v66 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@] Checking if account: %{public}@ has FamilyInfo following account change", buf, 0x20u);
  }
  double v11 = +[FamilyInfoLookupTask cachedFamilyInfoWithLogKey:v5];
  v12 = v11;
  if (v11)
  {
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    v13 = [v11 familyMembers];
    id v14 = [v13 countByEnumeratingWithState:&v57 objects:v69 count:16];
    if (v14)
    {
      id v15 = v14;
      v52 = v12;
      long long v53 = v5;
      int v16 = 0;
      uint64_t v17 = *(void *)v58;
      uint64_t v55 = *(void *)v58;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v58 != v17) {
            objc_enumerationMutation(v13);
          }
          v19 = *(void **)(*((void *)&v57 + 1) + 8 * i);
          uint64_t v20 = [v19 iTunesDSID];
          if (v20)
          {
            v21 = (void *)v20;
            uint64_t v22 = objc_msgSend(v4, "ams_DSID");
            if (v22)
            {
              id v23 = (void *)v22;
              id v24 = [v19 iTunesDSID];
              objc_msgSend(v4, "ams_DSID");
              v26 = id v25 = v4;
              int v27 = v16;
              id v28 = v13;
              unsigned int v29 = [v24 isEqualToNumber:v26];

              id v4 = v25;
              BOOL v30 = v29 == 0;
              v13 = v28;
              int v16 = v27;
              uint64_t v17 = v55;
              if (!v30) {
                int v16 = 1;
              }
            }
            else
            {
            }
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v57 objects:v69 count:16];
      }
      while (v15);

      v12 = v52;
      id v5 = v53;
      if (v16)
      {
        if (qword_10039FD98 != -1) {
          dispatch_once(&qword_10039FD98, &stru_100359510);
        }
        v31 = (void *)qword_10039FD50;
        if (os_log_type_enabled((os_log_t)qword_10039FD50, OS_LOG_TYPE_DEFAULT))
        {
          v32 = v31;
          id v33 = objc_opt_class();
          id v34 = v33;
          uint64_t v35 = objc_msgSend(v4, "ams_DSID");
          *(_DWORD *)buf = 138543874;
          long long v62 = v33;
          __int16 v63 = 2114;
          id v64 = v53;
          __int16 v65 = 2114;
          v66 = v35;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@] FamilyInfo found for account: %{public}@", buf, 0x20u);
        }
        goto LABEL_38;
      }
    }
    else
    {
    }
  }
  if (qword_10039FD98 != -1) {
    dispatch_once(&qword_10039FD98, &stru_100359510);
  }
  unsigned int v36 = (void *)qword_10039FD50;
  if (os_log_type_enabled((os_log_t)qword_10039FD50, OS_LOG_TYPE_DEFAULT))
  {
    v37 = v36;
    v38 = objc_opt_class();
    id v39 = v38;
    BOOL v40 = objc_msgSend(v4, "ams_DSID");
    *(_DWORD *)buf = 138543874;
    long long v62 = v38;
    __int16 v63 = 2114;
    id v64 = v5;
    __int16 v65 = 2114;
    v66 = v40;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@] FamilyInfo not found account: %{public}@. Attempting to reload silently.", buf, 0x20u);
  }
  id v56 = 0;
  [(FamilyManager *)v54 _bootstrapFamilyIfNeededSuppressDialogs:1 logKey:v5 error:&v56];
  id v41 = v56;
  if (v41)
  {
    if (qword_10039FD98 != -1) {
      dispatch_once(&qword_10039FD98, &stru_100359510);
    }
    v42 = (void *)qword_10039FD50;
    if (os_log_type_enabled((os_log_t)qword_10039FD50, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v43 = v42;
      BOOL v44 = objc_opt_class();
      id v45 = v44;
      v46 = objc_msgSend(v4, "ams_DSID");
      *(_DWORD *)buf = 138544130;
      long long v62 = v44;
      __int16 v63 = 2114;
      id v64 = v5;
      __int16 v65 = 2114;
      v66 = v46;
      __int16 v67 = 2114;
      id v68 = v41;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@] Error looking up FamilyInfo for account: %{public}@ error: %{public}@", buf, 0x2Au);
    }
  }
  else
  {
    if (qword_10039FD98 != -1) {
      dispatch_once(&qword_10039FD98, &stru_100359510);
    }
    v47 = (void *)qword_10039FD50;
    if (os_log_type_enabled((os_log_t)qword_10039FD50, OS_LOG_TYPE_DEFAULT))
    {
      v48 = v47;
      v49 = objc_opt_class();
      id v50 = v49;
      id v51 = objc_msgSend(v4, "ams_DSID");
      *(_DWORD *)buf = 138543874;
      long long v62 = v49;
      __int16 v63 = 2114;
      id v64 = v5;
      __int16 v65 = 2114;
      v66 = v51;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@] FamilyInfo reloaded for account: %{public}@", buf, 0x20u);
    }
  }

LABEL_38:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_familyMembers, 0);
  objc_storeStrong((id *)&self->_familyAccountIDs, 0);
  objc_storeStrong((id *)&self->_dispatch, 0);

  objc_storeStrong((id *)&self->_currentAccountDSID, 0);
}

@end