@interface RestoreManager
- (RestoreManager)init;
- (void)_bootstrapWhenReadyWithInfo:(id)a3;
- (void)_handleMonitorStateDidChangeNotification:(id)a3;
- (void)_restoreCellularAccessChangedNotification:(id)a3;
- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
@end

@implementation RestoreManager

- (RestoreManager)init
{
  v22.receiver = self;
  v22.super_class = (Class)RestoreManager;
  v2 = [(RestoreManager *)&v22 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.RestoreManager.dispatch", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc_init(TaskQueue);
    restoreQueue = v2->_restoreQueue;
    v2->_restoreQueue = v6;

    v8 = v2->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002B36D8;
    block[3] = &unk_100521388;
    v9 = v2;
    v21 = v9;
    dispatch_async(v8, block);
    v10 = (const char *)[kMBManagerRestoreStateChangedNotification UTF8String];
    p_restoreStateToken = &v9->_restoreStateToken;
    v12 = v2->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1002B3DC4;
    handler[3] = &unk_1005259F8;
    v13 = v9;
    v19 = v13;
    notify_register_dispatch(v10, p_restoreStateToken, v12, handler);
    v14 = v2->_dispatchQueue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1002B3FA0;
    v16[3] = &unk_100521388;
    v17 = v13;
    dispatch_async(v14, v16);
  }
  return v2;
}

- (void)_bootstrapWhenReadyWithInfo:(id)a3
{
  selfa = a3;
  dispatch_queue_t v4 = sub_10026CA24();
  unsigned int v5 = sub_1002BAD08((uint64_t)self);
  if (sub_10026D598((uint64_t)v4) && sub_10026D0B8((uint64_t)v4))
  {
    v6 = sub_100259614();
    unsigned int v7 = [v6 isConnected] & v5;

    if (v7 == 1)
    {
      if (selfa && (selfa[8] & 1) != 0)
      {
        v50 = sub_10030B11C();
        v51 = v50;
        if (v50
          && (unsigned int v52 = sub_10030CE24(v50, @"preflightAccountsOnStartup", (void *)1, 1),
              v51,
              v52))
        {
          uint64_t v53 = sub_1002B3CE4((uint64_t)self);
          if ((selfa[9] & 1) == 0)
          {
            uint64_t v54 = v53;
            if (v53 >= 1)
            {
              v55 = ASDLogHandleForCategory();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134217984;
                uint64_t v64 = v54;
                _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Account preflight retry for %ld hard failure(s)", buf, 0xCu);
              }

              sub_1002B9804(self, 0);
            }
          }
        }
        else
        {
          v59 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "Skipping account preflight retry due to bag override", buf, 2u);
          }
        }
      }
      else
      {
        v8 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          if (selfa) {
            id Property = objc_getProperty(selfa, v9, 24, 1);
          }
          else {
            id Property = 0;
          }
          *(_DWORD *)buf = 138543362;
          uint64_t v64 = (uint64_t)Property;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Initializing now that there is network, setup complete, and data migration complete, bag loaded for accountID: %{public}@", buf, 0xCu);
        }

        if (selfa)
        {
          id v12 = objc_getProperty(selfa, v11, 16, 1);
          id v14 = objc_getProperty(selfa, v13, 24, 1);
          int v15 = selfa[9] & 1;
        }
        else
        {
          id v14 = 0;
          id v12 = 0;
          int v15 = 0;
        }
        sub_1002B4AAC(self, v12, v14, v15);

        if (sub_1002B6864())
        {
          if (sub_1002B7FD8((uint64_t)self) < 1 || sub_1003F431C())
          {
            v16 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v17 = sub_1002B7FD8((uint64_t)self);
              BOOL v18 = sub_1003F431C();
              *(_DWORD *)buf = 134218240;
              uint64_t v64 = v17;
              __int16 v65 = 1024;
              *(_DWORD *)v66 = v18;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "App distributor is missing. %ld app(s) waiting hasPresentedDistributorRestoreDialog: %{BOOL}d", buf, 0x12u);
            }
          }
          else
          {
            sub_1003F44FC((uint64_t)AppDefaultsManager, 1);
            v56 = objc_alloc_init(_TtC9appstored6LogKey);
            v57 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v58 = sub_1002B3C04((uint64_t)self);
              *(_DWORD *)buf = 138412546;
              uint64_t v64 = (uint64_t)v56;
              __int16 v65 = 2048;
              *(void *)v66 = v58;
              _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "[%@] Will present dialog to get app distributor with %ld app(s) waiting", buf, 0x16u);
            }

            sub_1002B5298((uint64_t)self, v56, 0);
          }
        }
      }
      goto LABEL_54;
    }
  }
  sub_100263C08((uint64_t)self, selfa);
  v19 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    if (selfa) {
      id v21 = objc_getProperty(selfa, v20, 16, 1);
    }
    else {
      id v21 = 0;
    }
    id v22 = v21;
    BOOL v23 = sub_10026D598((uint64_t)v4);
    BOOL v24 = sub_10026D0B8((uint64_t)v4);
    v25 = sub_100259614();

    *(_DWORD *)buf = 138544386;
    uint64_t v64 = (uint64_t)v21;
    __int16 v65 = 1024;
    *(_DWORD *)v66 = v23;
    *(_WORD *)&v66[4] = 1024;
    *(_DWORD *)&v66[6] = v24;
    __int16 v67 = 1024;
    unsigned int v68 = [v25 isConnected];
    __int16 v69 = 1024;
    unsigned int v70 = v5;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Not ready to bootstrap restore for reason: %{public}@. Setup complete: %d migrator complete: %d network available: %d bag loaded: %d", buf, 0x24u);
  }
  v26 = sub_100259614();
  if ([v26 isConnected])
  {

    goto LABEL_32;
  }
  if (self)
  {
    BOOL v27 = !self->_bootstrapNetworkMonitorAdded;

    if (!v27) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  v28 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    if (selfa) {
      id v30 = objc_getProperty(selfa, v29, 16, 1);
    }
    else {
      id v30 = 0;
    }
    BOOL v31 = sub_10026D598((uint64_t)v4);
    BOOL v32 = sub_10026D0B8((uint64_t)v4);
    *(_DWORD *)buf = 138544130;
    uint64_t v64 = (uint64_t)v30;
    __int16 v65 = 1024;
    *(_DWORD *)v66 = v31;
    *(_WORD *)&v66[4] = 1024;
    *(_DWORD *)&v66[6] = v32;
    __int16 v67 = 1024;
    unsigned int v68 = v5;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Creating network monitor to bootstrap restore for reason: %{public}@. Setup complete: %d migrator complete: %d bag loaded: %d", buf, 0x1Eu);
  }

  v33 = +[NSNotificationCenter defaultCenter];
  v34 = sub_100259614();
  [v33 addObserver:self selector:"_handleMonitorStateDidChangeNotification:" name:@"NetworkStateDidChangeNotification" object:v34];

  if (self) {
    self->_bootstrapNetworkMonitorAdded = 1;
  }
LABEL_32:
  if (sub_10026D598((uint64_t)v4) && sub_10026D0B8((uint64_t)v4) || self && self->_bootstrapDeviceMonitorAdded)
  {
    if (v5) {
      goto LABEL_54;
    }
  }
  else
  {
    v35 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      if (selfa) {
        id v37 = objc_getProperty(selfa, v36, 16, 1);
      }
      else {
        id v37 = 0;
      }
      BOOL v38 = sub_10026D598((uint64_t)v4);
      BOOL v39 = sub_10026D0B8((uint64_t)v4);
      *(_DWORD *)buf = 138544130;
      uint64_t v64 = (uint64_t)v37;
      __int16 v65 = 1024;
      *(_DWORD *)v66 = v38;
      *(_WORD *)&v66[4] = 1024;
      *(_DWORD *)&v66[6] = v39;
      __int16 v67 = 1024;
      unsigned int v68 = v5;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Creating device monitor to bootstrap restore for reason: %{public}@. Setup complete: %d migrator complete: %d bag loaded: %d", buf, 0x1Eu);
    }

    v40 = +[NSNotificationCenter defaultCenter];
    v41 = sub_10026CA24();
    [v40 addObserver:self selector:"_handleMonitorStateDidChangeNotification:" name:@"DeviceStateDidChangeNotification" object:v41];

    if (!self)
    {
      if (v5) {
        goto LABEL_54;
      }
      goto LABEL_68;
    }
    self->_bootstrapDeviceMonitorAdded = 1;
    if (v5) {
      goto LABEL_54;
    }
  }
  if (self)
  {
    if (self->_bootstrapBagMonitorAdded) {
      goto LABEL_54;
    }
    char v42 = 0;
    goto LABEL_47;
  }
LABEL_68:
  char v42 = 1;
LABEL_47:
  v43 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    if (selfa) {
      id v45 = objc_getProperty(selfa, v44, 16, 1);
    }
    else {
      id v45 = 0;
    }
    BOOL v46 = sub_10026D598((uint64_t)v4);
    BOOL v47 = sub_10026D0B8((uint64_t)v4);
    *(_DWORD *)buf = 138544130;
    uint64_t v64 = (uint64_t)v45;
    __int16 v65 = 1024;
    *(_DWORD *)v66 = v46;
    *(_WORD *)&v66[4] = 1024;
    *(_DWORD *)&v66[6] = v47;
    __int16 v67 = 1024;
    unsigned int v68 = 0;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Creating bag monitor to bootstrap restore for reason: %{public}@. Setup complete: %d migrator complete: %d bag loaded: %d", buf, 0x1Eu);
  }

  objc_initWeak((id *)buf, self);
  v48 = +[NSNotificationCenter defaultCenter];
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_1002BB7A0;
  v61[3] = &unk_100522A18;
  objc_copyWeak(&v62, (id *)buf);
  id v49 = [v48 addObserverForName:AMSBagChangedNotification object:0 queue:0 usingBlock:v61];

  if ((v42 & 1) == 0) {
    self->_bootstrapBagMonitorAdded = 1;
  }
  objc_destroyWeak(&v62);
  objc_destroyWeak((id *)buf);
LABEL_54:
}

- (void)_handleMonitorStateDidChangeNotification:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002BE308;
  block[3] = &unk_100521388;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_restoreCellularAccessChangedNotification:(id)a3
{
  dispatch_queue_t v4 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "(RestoreManager) Received notification of restore cellular access change", buf, 2u);
  }

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002C0414;
  block[3] = &unk_100521388;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting dialog task", buf, 0xCu);
  }

  id v10 = [objc_alloc((Class)AMSSystemAlertDialogTask) initWithRequest:v8];
  v11 = [v10 present];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1002C07C4;
  v13[3] = &unk_100524170;
  v13[4] = self;
  id v14 = v7;
  id v12 = v7;
  [v11 addFinishBlock:v13];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followUpController, 0);
  objc_storeStrong((id *)&self->_bootstrapInfo, 0);
  objc_storeStrong((id *)&self->_restoreManager, 0);
  objc_storeStrong((id *)&self->_cellularAccess, 0);
  objc_storeStrong((id *)&self->_restoreQueue, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end