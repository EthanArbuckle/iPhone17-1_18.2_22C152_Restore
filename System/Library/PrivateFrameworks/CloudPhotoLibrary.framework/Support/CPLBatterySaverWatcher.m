@interface CPLBatterySaverWatcher
- (BOOL)_updateBatterySaverMode;
- (BOOL)inBatterySaverMode;
- (CPLBatterySaverWatcher)initWithDispatchQueue:(id)a3 delegate:(id)a4;
- (CPLBatterySaverWatcherDelegate)delegate;
- (void)_batterySaverModeTriggered;
- (void)_registerForBatterySaverMode;
- (void)_unregisterForBatterySaverMode;
- (void)startWatching;
- (void)stopWatching;
@end

@implementation CPLBatterySaverWatcher

- (CPLBatterySaverWatcher)initWithDispatchQueue:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CPLBatterySaverWatcher;
  v9 = [(CPLBatterySaverWatcher *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->_batterySaverMode = 0;
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (BOOL)inBatterySaverMode
{
  return self->_batterySaverMode;
}

- (void)startWatching
{
  self->_watching = 1;
  [(CPLBatterySaverWatcher *)self _registerForBatterySaverMode];
  [(CPLBatterySaverWatcher *)self _updateBatterySaverMode];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026AC0;
  block[3] = &unk_100275EA0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)stopWatching
{
  self->_watching = 0;
  [(CPLBatterySaverWatcher *)self _unregisterForBatterySaverMode];
  [(CPLBatterySaverWatcher *)self _updateBatterySaverMode];
}

- (BOOL)_updateBatterySaverMode
{
  v3 = +[NSProcessInfo processInfo];
  unsigned int v4 = [v3 isLowPowerModeEnabled];

  int batterySaverMode = self->_batterySaverMode;
  if (batterySaverMode != v4) {
    self->_int batterySaverMode = v4;
  }
  return batterySaverMode != v4;
}

- (void)_batterySaverModeTriggered
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026C24;
  block[3] = &unk_100275EA0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)_unregisterForBatterySaverMode
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:NSProcessInfoPowerStateDidChangeNotification object:0];
}

- (void)_registerForBatterySaverMode
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_batterySaverModeTriggered" name:NSProcessInfoPowerStateDidChangeNotification object:0];
}

- (CPLBatterySaverWatcherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CPLBatterySaverWatcherDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end