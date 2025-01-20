@interface DMRebootTimer
+ (BOOL)_shouldRebootOnCurrentPlatform;
+ (id)createRebootTimerIfAppropriateWithTimeIntervalBeforeReboot:(double)a3 pluginName:(id)a4 environment:(id)a5;
+ (unint64_t)_maximumRebootCount;
+ (void)_setDidReboot:(BOOL)a3;
- (BOOL)canceled;
- (DMEnvironment)environment;
- (NSString)pluginName;
- (OS_dispatch_queue)serialQueue;
- (OS_dispatch_source)timer;
- (id)_createHelperConnection;
- (id)_initWithTimeIntervalBeforeReboot:(double)a3 pluginName:(id)a4 environment:(id)a5;
- (void)_timerFired;
- (void)cancel;
- (void)resume;
- (void)setCanceled:(BOOL)a3;
- (void)setEnvironment:(id)a3;
- (void)setPluginName:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation DMRebootTimer

+ (id)createRebootTimerIfAppropriateWithTimeIntervalBeforeReboot:(double)a3 pluginName:(id)a4 environment:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (a3 > 0.0
    && +[DMRebootTimer _shouldRebootOnCurrentPlatform]
    && [v9 shouldWatchdogPluginsAfterTimeout]
    && (id v10 = [v9 migrationRebootCount], v10 < objc_msgSend(a1, "_maximumRebootCount")))
  {
    id v11 = [[DMRebootTimer alloc] _initWithTimeIntervalBeforeReboot:v8 pluginName:v9 environment:a3];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (BOOL)_shouldRebootOnCurrentPlatform
{
  return 1;
}

+ (unint64_t)_maximumRebootCount
{
  return 3;
}

- (id)_initWithTimeIntervalBeforeReboot:(double)a3 pluginName:(id)a4 environment:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v27.receiver = self;
  v27.super_class = (Class)DMRebootTimer;
  id v10 = [(DMRebootTimer *)&v27 init];
  id v11 = v10;
  if (v10)
  {
    [(DMRebootTimer *)v10 setCanceled:0];
    [(DMRebootTimer *)v11 setPluginName:v8];
    [(DMRebootTimer *)v11 setEnvironment:v9];
    v12 = [(DMRebootTimer *)v11 pluginName];
    v13 = +[NSString stringWithFormat:@"com.apple.datamigrator.rebootTimer.%@", v12];

    id v14 = v13;
    v15 = (const char *)[v14 UTF8String];
    v16 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v17 = dispatch_queue_create(v15, v16);
    [(DMRebootTimer *)v11 setSerialQueue:v17];

    v18 = [(DMRebootTimer *)v11 serialQueue];
    dispatch_source_t v19 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v18);
    [(DMRebootTimer *)v11 setTimer:v19];

    v20 = [(DMRebootTimer *)v11 timer];
    dispatch_time_t v21 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v20, v21, 0xFFFFFFFFFFFFFFFFLL, 0);

    objc_initWeak(&location, v11);
    v22 = [(DMRebootTimer *)v11 timer];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000920C;
    handler[3] = &unk_1000247F0;
    objc_copyWeak(&v25, &location);
    dispatch_source_set_event_handler(v22, handler);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  return v11;
}

- (void)_timerFired
{
  objc_opt_class();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  if (byte_100030B98)
  {
    objc_sync_exit(obj);
  }
  else
  {
    byte_100030B98 = 1;
    objc_sync_exit(obj);

    v3 = [(DMRebootTimer *)self environment];
    v4 = (char *)[v3 migrationRebootCount];

    v5 = [(DMRebootTimer *)self environment];
    [v5 setMigrationRebootCount:v4 + 1];

    id obj = [(DMRebootTimer *)self _createHelperConnection];
    [obj resume];
    uint64_t v6 = [(DMRebootTimer *)self pluginName];
    v7 = (void *)v6;
    if (v4)
    {
      id v11 = +[NSNumber numberWithUnsignedInteger:v4];
      _DMLogFunc();

      objc_msgSend(obj, "reboot", v7, v11);
    }
    else
    {
      uint64_t v10 = v6;
      _DMLogFunc();

      id v8 = [(DMRebootTimer *)self pluginName];
      id v9 = +[NSString stringWithFormat:@"datamigrator plugin %@ hang", v8];

      [obj panicWithMessage:v9];
    }
    [obj invalidate];
  }
}

- (id)_createHelperConnection
{
  v2 = objc_alloc_init(DMHelperConnection);

  return v2;
}

+ (void)_setDidReboot:(BOOL)a3
{
  id obj = a1;
  objc_sync_enter(obj);
  byte_100030B98 = a3;
  objc_sync_exit(obj);
}

- (void)resume
{
  v2 = [(DMRebootTimer *)self timer];
  dispatch_resume(v2);
}

- (void)cancel
{
  v3 = [(DMRebootTimer *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009564;
  block[3] = &unk_100024768;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (NSString)pluginName
{
  return self->_pluginName;
}

- (void)setPluginName:(id)a3
{
}

- (DMEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_environment, 0);

  objc_storeStrong((id *)&self->_pluginName, 0);
}

@end