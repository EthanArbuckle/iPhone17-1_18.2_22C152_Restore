@interface CoreRCDisplayPowerNotification
- (BOOL)registerPowerNotifications:(id)a3 sleepCallback:(id)a4 wakeCallback:(id)a5;
- (void)dealloc;
- (void)deboucePowerNotification;
- (void)handlePowerNotificationWithService:(unsigned int)a3 messageType:(unsigned int)a4 messageArgument:(void *)a5;
@end

@implementation CoreRCDisplayPowerNotification

- (BOOL)registerPowerNotifications:(id)a3 sleepCallback:(id)a4 wakeCallback:(id)a5
{
  v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = CoreRCPluginLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "CoreRCDisplayPowerNotification registering notification", buf, 2u);
  }

  id v12 = objc_retainBlock(v9);
  id sleepCallback = self->_sleepCallback;
  self->_id sleepCallback = v12;

  id v14 = objc_retainBlock(v10);
  id wakeCallback = self->_wakeCallback;
  self->_id wakeCallback = v14;

  v16 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v8);
  debounceTimer = self->_debounceTimer;
  self->_debounceTimer = v16;

  v18 = self->_debounceTimer;
  if (v18)
  {
    dispatch_set_context(v18, self);
    v19 = self->_debounceTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_7DC4;
    handler[3] = &unk_C398;
    handler[4] = self;
    dispatch_source_set_event_handler(v19, handler);
    dispatch_resume((dispatch_object_t)self->_debounceTimer);
    v20 = +[NSUserDefaults cecUserDefaults];
    self->_powerNotificationDebounceTime = (unint64_t)[v20 powerNotificationDebounceTime];

    id v21 = +[CADisplay displays];
    v22 = +[CAWindowServer serverIfRunning];
    v23 = [v22 displays];

    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v24 = v23;
    id v25 = [v24 countByEnumeratingWithState:&v64 objects:v72 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v65;
LABEL_6:
      uint64_t v28 = 0;
      while (1)
      {
        if (*(void *)v65 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = *(void **)(*((void *)&v64 + 1) + 8 * v28);
        if ([v29 displayType] == (char *)&dword_0 + 1) {
          break;
        }
        if (v26 == (id)++v28)
        {
          id v26 = [v24 countByEnumeratingWithState:&v64 objects:v72 count:16];
          if (v26) {
            goto LABEL_6;
          }
          goto LABEL_17;
        }
      }
      id v30 = v29;
      v31 = CoreRCPluginLog();
      v32 = v31;
      if (v30)
      {
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v71 = v30;
          _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEFAULT, "Found external display with brightnessControl %@", buf, 0xCu);
        }

        v69[0] = kCABrightnessSyncNotificationWillChangePowerState;
        v69[1] = kCABrightnessSyncNotificationDidChangePowerState;
        v33 = +[NSArray arrayWithObjects:v69 count:2];
        v61[0] = _NSConcreteStackBlock;
        v61[1] = 3221225472;
        v61[2] = sub_7DCC;
        v61[3] = &unk_C3F0;
        v61[4] = v30;
        v62 = v8;
        v63 = self;
        [v30 registerForSyncNotifications:v33 withBlock:v61];

        goto LABEL_17;
      }
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        sub_8DC8(v32, v53, v54, v55, v56, v57, v58, v59);
      }
    }
    else
    {
LABEL_17:

      p_pmPortRef = &self->_pmPortRef;
      io_connect_t v35 = IORegisterForSystemPower(self, &self->_pmPortRef, (IOServiceInterestCallback)_powerNotificationCallback, &self->_pmNotifier);
      self->_pmConnect = v35;
      if (v35 && self->_pmNotifier && *p_pmPortRef)
      {
        IONotificationPortSetDispatchQueue(*p_pmPortRef, v8);
        BOOL v36 = 1;
LABEL_31:

        goto LABEL_32;
      }
      v45 = CoreRCPluginLog();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        sub_8D90(v45, v46, v47, v48, v49, v50, v51, v52);
      }
    }
    BOOL v36 = 0;
    goto LABEL_31;
  }
  v37 = CoreRCPluginLog();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
    sub_8D58(v37, v38, v39, v40, v41, v42, v43, v44);
  }

  BOOL v36 = 0;
LABEL_32:

  return v36;
}

- (void)dealloc
{
  debounceTimer = self->_debounceTimer;
  if (debounceTimer)
  {
    dispatch_source_cancel(debounceTimer);
    v4 = self->_debounceTimer;
    self->_debounceTimer = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)CoreRCDisplayPowerNotification;
  [(CoreRCDisplayPowerNotification *)&v5 dealloc];
}

- (void)deboucePowerNotification
{
  self->_waitingForDebounce = 0;
  BOOL lastNotificationWasWake = self->_lastNotificationWasWake;
  v4 = CoreRCPluginLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (lastNotificationWasWake)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Sending debounced wake", buf, 2u);
    }
    v6 = &OBJC_IVAR___CoreRCDisplayPowerNotification__wakeCallback;
  }
  else
  {
    if (v5)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Sending debounced sleep", v7, 2u);
    }
    v6 = &OBJC_IVAR___CoreRCDisplayPowerNotification__sleepCallback;
  }

  (*(void (***)(void))((char *)&self->super.super.isa + *v6))[2]();
}

- (void)handlePowerNotificationWithService:(unsigned int)a3 messageType:(unsigned int)a4 messageArgument:(void *)a5
{
  v8 = CoreRCPluginLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "CoreRCDisplayPowerNotification in IOPM callback", buf, 2u);
  }

  if (a4 == -536870288)
  {
LABEL_10:
    IOAllowPowerChange(self->_pmConnect, (intptr_t)a5);
    return;
  }
  if (a4 != -536870112)
  {
    if (a4 != -536870272) {
      return;
    }
    self->_isPMSleep = 1;
    if (self->_waitingForDebounce)
    {
      id v9 = CoreRCPluginLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Cancelling debounce, sleeping now becuase of IOPM sleep", v10, 2u);
      }

      dispatch_source_set_timer((dispatch_source_t)self->_debounceTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
      self->_waitingForDebounce = 0;
      (*((void (**)(void))self->_sleepCallback + 2))();
    }
    goto LABEL_10;
  }
  self->_isPMSleep = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debounceTimer, 0);
  objc_storeStrong(&self->_wakeCallback, 0);

  objc_storeStrong(&self->_sleepCallback, 0);
}

@end