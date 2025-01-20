@interface SSRemoteAlertMonitor
- (FBSDisplayLayoutMonitor)monitor;
- (NSNumber)isUIApplication;
- (NSString)bundleID;
- (SSRemoteAlertMonitor)initWithBundleID:(id)a3 dismissHandler:(id)a4;
- (id)dismissHandler;
- (unint64_t)displayState;
- (void)_handleLayoutUpdate:(id)a3;
- (void)_startObserving;
- (void)_stopObserving;
- (void)dealloc;
- (void)setBundleID:(id)a3;
- (void)setDismissHandler:(id)a3;
- (void)setDisplayState:(unint64_t)a3;
- (void)setIsUIApplication:(id)a3;
- (void)setMonitor:(id)a3;
@end

@implementation SSRemoteAlertMonitor

- (SSRemoteAlertMonitor)initWithBundleID:(id)a3 dismissHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if ([v6 length])
    {
      v8 = v6;
    }
    else
    {
      v11 = +[NSBundle mainBundle];
      v8 = [v11 bundleIdentifier];

      v12 = sub_100010734();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100013A74((uint64_t)v8, v12);
      }
    }
    v17.receiver = self;
    v17.super_class = (Class)SSRemoteAlertMonitor;
    v13 = [(SSRemoteAlertMonitor *)&v17 init];
    if (v13)
    {
      id v14 = objc_retainBlock(v7);
      id dismissHandler = v13->_dismissHandler;
      v13->_id dismissHandler = v14;

      v13->_displayState = 0;
      objc_storeStrong((id *)&v13->_bundleID, v8);
      [(SSRemoteAlertMonitor *)v13 _startObserving];
    }
    self = v13;
    id v6 = v8;
    v10 = self;
  }
  else
  {
    v9 = sub_100010734();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000139F0(v9);
    }

    v10 = 0;
  }

  return v10;
}

- (void)dealloc
{
  [(SSRemoteAlertMonitor *)self _stopObserving];
  v3.receiver = self;
  v3.super_class = (Class)SSRemoteAlertMonitor;
  [(SSRemoteAlertMonitor *)&v3 dealloc];
}

- (void)_startObserving
{
  if (!self->_monitor)
  {
    objc_super v3 = sub_100010734();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      bundleID = self->_bundleID;
      *(_DWORD *)buf = 138412546;
      v11 = bundleID;
      __int16 v12 = 2080;
      v13 = "-[SSRemoteAlertMonitor _startObserving]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "start fbs monitor for %@ @%s", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    v5 = +[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100010188;
    v8[3] = &unk_100020938;
    objc_copyWeak(&v9, (id *)buf);
    [v5 setTransitionHandler:v8];
    id v6 = +[FBSDisplayLayoutMonitor monitorWithConfiguration:v5];
    monitor = self->_monitor;
    self->_monitor = v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_stopObserving
{
  objc_super v3 = sub_100010734();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[SSRemoteAlertMonitor _stopObserving]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "stop fbs monitor @%s", (uint8_t *)&v5, 0xCu);
  }

  [(FBSDisplayLayoutMonitor *)self->_monitor invalidate];
  monitor = self->_monitor;
  self->_monitor = 0;
}

- (void)_handleLayoutUpdate:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    id v6 = [v4 elements];
    id v7 = [v6 count];

    if (v7)
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      v8 = [v5 elements];
      id v9 = [v8 countByEnumeratingWithState:&v32 objects:v42 count:16];
      if (v9)
      {
        id v11 = v9;
        uint64_t v12 = *(void *)v33;
        *(void *)&long long v10 = 138412802;
        long long v31 = v10;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v33 != v12) {
              objc_enumerationMutation(v8);
            }
            id v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            unsigned int v15 = [v14 isUIApplicationElement:v31];
            v16 = sub_100010734();
            BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
            if (v15)
            {
              if (v17)
              {
                v18 = [v14 bundleIdentifier];
                v19 = (const char *)[v14 level];
                *(_DWORD *)buf = v31;
                v37 = v18;
                __int16 v38 = 2048;
                v39 = v19;
                __int16 v40 = 2080;
                v41 = "-[SSRemoteAlertMonitor _handleLayoutUpdate:]";
                _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@ lvl:%ld @%s", buf, 0x20u);
              }
              bundleID = self->_bundleID;
              v21 = [v14 bundleIdentifier];
              LODWORD(bundleID) = [(NSString *)bundleID isEqualToString:v21];

              if (bundleID)
              {
                isUIApplication = self->_isUIApplication;
                v30 = (NSNumber *)&__kCFBooleanTrue;
LABEL_27:
                self->_isUIApplication = v30;

                self->_displayState = 1;
                goto LABEL_28;
              }
            }
            else
            {
              if (v17)
              {
                v22 = [v14 identifier];
                v23 = (const char *)[v14 level];
                *(_DWORD *)buf = v31;
                v37 = v22;
                __int16 v38 = 2048;
                v39 = v23;
                __int16 v40 = 2080;
                v41 = "-[SSRemoteAlertMonitor _handleLayoutUpdate:]";
                _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@ lvl:%ld @%s", buf, 0x20u);
              }
              v24 = self->_bundleID;
              v25 = [v14 identifier];
              LODWORD(v24) = [(NSString *)v24 isEqualToString:v25];

              if (v24)
              {
                isUIApplication = self->_isUIApplication;
                v30 = (NSNumber *)&__kCFBooleanFalse;
                goto LABEL_27;
              }
            }
          }
          id v11 = [v8 countByEnumeratingWithState:&v32 objects:v42 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      if (self->_displayState == 1)
      {
        v26 = sub_100010734();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = self->_bundleID;
          *(_DWORD *)buf = 138412546;
          v37 = (const char *)v27;
          __int16 v38 = 2080;
          v39 = "-[SSRemoteAlertMonitor _handleLayoutUpdate:]";
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%@ is dismissed @%s", buf, 0x16u);
        }

        (*((void (**)(void))self->_dismissHandler + 2))();
        if (![(NSNumber *)self->_isUIApplication BOOLValue]) {
          [(SSRemoteAlertMonitor *)self _stopObserving];
        }
      }
    }
    else
    {
      v28 = sub_100010734();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v37 = "-[SSRemoteAlertMonitor _handleLayoutUpdate:]";
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "no elements @%s", buf, 0xCu);
      }
    }
  }
LABEL_28:
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBundleID:(id)a3
{
}

- (FBSDisplayLayoutMonitor)monitor
{
  return (FBSDisplayLayoutMonitor *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMonitor:(id)a3
{
}

- (id)dismissHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setDismissHandler:(id)a3
{
}

- (unint64_t)displayState
{
  return self->_displayState;
}

- (void)setDisplayState:(unint64_t)a3
{
  self->_displayState = a3;
}

- (NSNumber)isUIApplication
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIsUIApplication:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isUIApplication, 0);
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong((id *)&self->_monitor, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end