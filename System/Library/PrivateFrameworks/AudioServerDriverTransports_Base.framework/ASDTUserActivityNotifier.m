@interface ASDTUserActivityNotifier
+ (id)notifierForDelegate:(id)a3 withName:(id)a4;
+ (id)notifierForDelegate:(id)a3 withQueue:(id)a4;
+ (void)logUserActiveBits:(unint64_t)a3 withPrefix:(id)a4;
- (ASDTUserActivityNotifierDelegate)delegate;
- (BOOL)registerUserActivityLevelNotification;
- (BOOL)userIsActive;
- (OS_dispatch_queue)queue;
- (id)initForDelegate:(id)a3 withName:(id)a4;
- (id)initForDelegate:(id)a3 withQueue:(id)a4;
- (void)dealloc;
- (void)deregisterUserActivityLevelNotification;
- (void)registerUserActivityLevelNotification;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation ASDTUserActivityNotifier

+ (id)notifierForDelegate:(id)a3 withName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [[ASDTUserActivityNotifier alloc] initForDelegate:v5 withName:v6];

  return v7;
}

+ (id)notifierForDelegate:(id)a3 withQueue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [[ASDTUserActivityNotifier alloc] initForDelegate:v5 withQueue:v6];

  return v7;
}

- (id)initForDelegate:(id)a3 withName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_USER_INTERACTIVE, 0);

  id v10 = [NSString stringWithFormat:@"%@.PowerNotification", v7];
  dispatch_queue_t v11 = dispatch_queue_create((const char *)[v10 UTF8String], v9);
  id v12 = [(ASDTUserActivityNotifier *)self initForDelegate:v6 withQueue:v11];

  return v12;
}

- (id)initForDelegate:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ASDTUserActivityNotifier;
  v8 = [(ASDTUserActivityNotifier *)&v13 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_5;
  }
  [(ASDTUserActivityNotifier *)v8 setDelegate:v6];
  [(ASDTUserActivityNotifier *)v9 setQueue:v7];
  if (!v6 || !v7)
  {
    dispatch_queue_t v11 = ASDTBaseLogType();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ASDTSystemPowerNotifier initForBundleName:delegate:earlyWake:](v11);
    }

    goto LABEL_9;
  }
  if (![(ASDTUserActivityNotifier *)v9 registerUserActivityLevelNotification])
  {
LABEL_9:
    id v10 = 0;
    goto LABEL_10;
  }
LABEL_5:
  id v10 = v9;
LABEL_10:

  return v10;
}

- (void)dealloc
{
  [(ASDTUserActivityNotifier *)self deregisterUserActivityLevelNotification];
  v3.receiver = self;
  v3.super_class = (Class)ASDTUserActivityNotifier;
  [(ASDTUserActivityNotifier *)&v3 dealloc];
}

- (BOOL)userIsActive
{
  v2 = [(ASDTUserActivityNotifier *)self delegate];
  [v2 userIsActiveBits];

  IOPMGetUserActivityLevel();
  return 0;
}

+ (void)logUserActiveBits:(unint64_t)a3 withPrefix:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = ASDTBaseLogType();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = " presentActive";
    if ((a3 & 1) == 0) {
      id v7 = "";
    }
    int v14 = 138414338;
    id v15 = v5;
    v8 = " presentPassive";
    if ((a3 & 2) == 0) {
      v8 = "";
    }
    __int16 v16 = 2048;
    unint64_t v17 = a3;
    v9 = " presentPassiveWithDisplay";
    if ((a3 & 4) == 0) {
      v9 = "";
    }
    __int16 v18 = 2080;
    v19 = v7;
    id v10 = " presentPassiveWithoutDisplay";
    if ((a3 & 8) == 0) {
      id v10 = "";
    }
    __int16 v20 = 2080;
    v21 = v8;
    dispatch_queue_t v11 = " remoteClientActive";
    if ((a3 & 0x10) == 0) {
      dispatch_queue_t v11 = "";
    }
    __int16 v22 = 2080;
    v23 = v9;
    id v12 = " notificationActive";
    if ((a3 & 0x20) == 0) {
      id v12 = "";
    }
    __int16 v24 = 2080;
    v25 = v10;
    objc_super v13 = " absentWithDisplay";
    __int16 v26 = 2080;
    v27 = v11;
    __int16 v28 = 2080;
    if ((a3 & 0x40) == 0) {
      objc_super v13 = "";
    }
    v29 = v12;
    __int16 v30 = 2080;
    v31 = v13;
    _os_log_impl(&dword_2489BC000, v6, OS_LOG_TYPE_DEFAULT, "%@:%llx%s%s%s%s%s%s%s", (uint8_t *)&v14, 0x5Cu);
  }
}

- (BOOL)registerUserActivityLevelNotification
{
  objc_initWeak(&location, self);
  objc_super v3 = [(ASDTUserActivityNotifier *)self queue];
  objc_copyWeak(&v7, &location);
  self->_unint64_t userActivityLevelChangeNotification = IOPMScheduleUserActivityLevelNotification();

  unint64_t userActivityLevelChangeNotification = self->_userActivityLevelChangeNotification;
  if (!userActivityLevelChangeNotification)
  {
    id v5 = ASDTBaseLogType();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ASDTUserActivityNotifier registerUserActivityLevelNotification](v5);
    }
  }
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return userActivityLevelChangeNotification != 0;
}

void __65__ASDTUserActivityNotifier_registerUserActivityLevelNotification__block_invoke(id *a1, uint64_t a2)
{
  +[ASDTUserActivityNotifier logUserActiveBits:a2 withPrefix:@"User activity changed"];
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  v4 = [WeakRetained delegate];
  uint64_t v5 = [v4 userIsActiveBits];

  id v8 = objc_loadWeakRetained(a1);
  id v6 = [v8 delegate];
  [v6 userActiveChanged:(v5 & a2) != 0];
}

- (void)deregisterUserActivityLevelNotification
{
  if (self->_userActivityLevelChangeNotification)
  {
    IOPMUnregisterNotification();
    self->_unint64_t userActivityLevelChangeNotification = 0;
  }
}

- (ASDTUserActivityNotifierDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ASDTUserActivityNotifierDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)registerUserActivityLevelNotification
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2489BC000, log, OS_LOG_TYPE_ERROR, "Failed to allocate userActiveChangeNotification.", v1, 2u);
}

@end