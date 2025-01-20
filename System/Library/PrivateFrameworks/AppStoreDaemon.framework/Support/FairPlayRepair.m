@interface FairPlayRepair
+ (BOOL)shouldAttemptToRepairApplication:(id)a3 options:(id)a4 logKey:(id)a5;
- (ApplicationRepairDelegate)delegate;
- (BOOL)repairApplication:(id)a3 error:(id *)a4;
- (FairPlayRepair)init;
- (NSArray)repairedBundleIDs;
- (NSString)repairType;
- (_TtC9appstored6LogKey)logKey;
- (int)fairPlayStatus;
- (void)setDelegate:(id)a3;
- (void)setLogKey:(id)a3;
@end

@implementation FairPlayRepair

- (FairPlayRepair)init
{
  v8.receiver = self;
  v8.super_class = (Class)FairPlayRepair;
  v2 = [(FairPlayRepair *)&v8 init];
  if (v2)
  {
    uint64_t v3 = sub_10030B11C();
    bag = v2->_bag;
    v2->_bag = (URLBag *)v3;

    v5 = objc_alloc_init(UnfairLock);
    lock = v2->_lock;
    v2->_lock = v5;
  }
  return v2;
}

- (ApplicationRepairDelegate)delegate
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_100017E68;
  v10 = sub_100017AF0;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10020A030;
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
  v7[2] = sub_10020A114;
  v7[3] = &unk_1005218C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  sub_100010468(lock, v7);
}

- (int)fairPlayStatus
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10020A1E4;
  v5[3] = &unk_100521988;
  v5[4] = self;
  v5[5] = &v6;
  sub_100010468(lock, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (_TtC9appstored6LogKey)logKey
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = sub_100017E68;
  v10 = sub_100017AF0;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10020A300;
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
  v7[2] = sub_10020A3E4;
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
  int v9 = sub_100017E68;
  v10 = sub_100017AF0;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10020A53C;
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
  return (NSString *)@"Keybag";
}

+ (BOOL)shouldAttemptToRepairApplication:(id)a3 options:(id)a4 logKey:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (([v7 isArcade] & 1) == 0
    && (([v7 isStoreOriginated] & 1) != 0 || objc_msgSend(v7, "isBeta")))
  {
    if (os_variant_has_internal_content() && [v8 fairplayStatus])
    {
      unsigned int v10 = [v8 fairplayStatus];
    }
    else
    {
      id v12 = [v7 canonicalExecutablePath];
      id v13 = [v12 fileSystemRepresentation];

      if (!v13) {
        goto LABEL_14;
      }
      unsigned int v10 = sub_10020A7C4((uint64_t)FairPlayRepair, v7, v8);
    }
    unsigned int v14 = v10;
    if (v10)
    {
      v15 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138543618;
        id v18 = v9;
        __int16 v19 = 1024;
        unsigned int v20 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[FP/%{public}@] Will start fairplay recovery with fairplayStatus: %d", (uint8_t *)&v17, 0x12u);
      }
      BOOL v11 = 1;
LABEL_17:

      goto LABEL_18;
    }
LABEL_14:
    v15 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543618;
      id v18 = v9;
      __int16 v19 = 1024;
      unsigned int v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[FP/%{public}@] Will not attempt fairplay recovery do to launchable fairplayStatus: %d", (uint8_t *)&v17, 0x12u);
    }
    BOOL v11 = 0;
    goto LABEL_17;
  }
  BOOL v11 = 0;
LABEL_18:

  return v11;
}

- (BOOL)repairApplication:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!self)
  {
    ASDErrorWithUserInfoAndFormat();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  id v7 = sub_100259614();
  unsigned int v8 = [v7 isConnected];

  if (v8)
  {
    id v9 = sub_10023A668((id *)[RefetchKeybag alloc], self->_application);
    unsigned __int8 v10 = [(ASDRepairOptions *)self->_options isBackground];
    if (v9) {
      *((unsigned char *)v9 + 24) = v10 ^ 1;
    }
    BOOL v11 = sub_10023A6C4(v9);
    id v54 = 0;
    unsigned int v12 = [v11 resultWithError:&v54];
    id v13 = v54;

    LODWORD(v11) = sub_10020A7C4((uint64_t)FairPlayRepair, self->_application, self->_options);
    lock = self->_lock;
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_10020B030;
    v52[3] = &unk_100521D78;
    v52[4] = self;
    int v53 = (int)v11;
    sub_100010468(lock, v52);
    if ((v11 + 42597) <= 1)
    {
      if ([(ASDRepairOptions *)self->_options isBackground])
      {
        v15 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          logKey = self->_logKey;
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = logKey;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[FP/%{public}@] Not showing family leave dialog for background repair", buf, 0xCu);
        }
      }
      else
      {
        unsigned int v51 = v12;
        id v49 = +[NSNumber numberWithLongLong:[(ApplicationProxy *)self->_application storeItemID]];
        uint64_t v26 = ASDErrorWithDescription();
        v27 = [(FairPlayRepair *)self delegate];
        v50 = (void *)v26;
        [v27 repair:self needsToReleaseBlockingCallerWithReason:v26];

        id v28 = objc_alloc((Class)AMSDialogRequest);
        v29 = ASDLocalizedString();
        v30 = ASDLocalizedString();
        id v31 = [v28 initWithTitle:v29 message:v30];

        v32 = ASDLocalizedString();
        v33 = +[AMSDialogAction actionWithTitle:v32 style:2];

        v60 = v33;
        v34 = +[NSArray arrayWithObjects:&v60 count:1];
        [v31 setButtonActions:v34];

        sub_100422394(v31, @"fairPlayRepairFamilyLeave");
        sub_10025F158(v33, @"cancel");
        if (sub_100009458())
        {
          v35 = ASDLocalizedString();
          v36 = +[AMSDialogAction actionWithTitle:v35];

          [v31 addButtonAction:v36];
        }
        else
        {
          v36 = 0;
        }
        v37 = objc_alloc_init(InteractiveRequestPresenter);
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = sub_10020B040;
        *(void *)&buf[24] = &unk_100521DA0;
        v57 = self;
        id v58 = v36;
        v15 = v49;
        v59 = v15;
        id v38 = v36;
        [(InteractiveRequestPresenter *)v37 presentDialogRequest:v31 resultHandler:buf];

        unsigned int v12 = v51;
      }
    }
    if (v12)
    {
      v39 = [(ApplicationProxy *)self->_application bundleID];

      if (v39)
      {
        v40 = [(ApplicationProxy *)self->_application bundleID];
        v55 = v40;
        BOOL v25 = 1;
        id v41 = +[NSArray arrayWithObjects:&v55 count:1];
        v42 = self->_lock;
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = sub_10020A588;
        *(void *)&buf[24] = &unk_1005218C0;
        v57 = self;
        id v43 = v41;
        id v58 = v43;
        sub_100010468(v42, buf);
      }
      else
      {
        BOOL v25 = 1;
      }
      goto LABEL_24;
    }
LABEL_23:
    BOOL v25 = 0;
    goto LABEL_24;
  }
  if ([(ASDRepairOptions *)self->_options isBackground])
  {
    int v17 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = self->_logKey;
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[FP/%{public}@] Not showing internet connection alert for background repair", buf, 0xCu);
    }
  }
  else
  {
    id v19 = objc_alloc((Class)AMSDialogRequest);
    unsigned int v20 = ASDLocalizedString();
    v21 = ASDLocalizedString();
    int v17 = [v19 initWithTitle:v20 message:v21];

    v22 = ASDLocalizedString();
    v23 = +[AMSDialogAction actionWithTitle:v22 style:0];

    *(void *)buf = v23;
    v24 = +[NSArray arrayWithObjects:buf count:1];
    [v17 setButtonActions:v24];

    sub_100422394(v17, @"fairPlayRepairNetworkRequired");
    sub_10025F158(v23, @"ok");
    sub_10033CE18((uint64_t)InteractiveRequestPresenter, v17, 0);
  }
  BOOL v25 = 0;
  id v13 = 0;
LABEL_24:
  v44 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    v45 = [(FairPlayRepair *)self logKey];
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v45;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v25;
    *(_WORD *)&buf[18] = 2114;
    *(void *)&buf[20] = v13;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "[FP/%{public}@] Repair complete with result: %d error: %{public}@", buf, 0x1Cu);
  }
  if (v25)
  {
    if ([(ASDRepairOptions *)self->_options isBackground])
    {
      v46 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        v47 = self->_logKey;
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v47;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "[FP/%{public}@] Not launching app following background repair", buf, 0xCu);
      }
    }
    else
    {
      v46 = [(FairPlayRepair *)self delegate];
      [v46 repair:self wantsToRelaunchApplication:self->_application];
    }
  }
  else if (a4)
  {
    *a4 = v13;
  }

  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifierHeader, 0);
  objc_storeStrong((id *)&self->_repairedBundleIDs, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_application, 0);
}

@end