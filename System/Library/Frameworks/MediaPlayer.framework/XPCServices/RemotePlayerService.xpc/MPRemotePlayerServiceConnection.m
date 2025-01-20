@interface MPRemotePlayerServiceConnection
- (BKSApplicationStateMonitor)stateMonitor;
- (BKSProcessAssertion)processAssertion;
- (BOOL)_shouldPreventSuspensionForBackgroundPlayback;
- (BOOL)connectionInvalidated;
- (BOOL)supportsBackgroundAudio;
- (BOOL)wantsProcessAssertion;
- (MPCPlaybackEngine)playbackEngine;
- (MPRemotePlayerServiceConnection)initWithConnection:(id)a3 bundleID:(id)a4 pid:(int)a5 playbackEngine:(id)a6;
- (NSString)bundleID;
- (NSXPCConnection)connection;
- (OS_dispatch_source)assertionInvalidationTimer;
- (int)pid;
- (unint64_t)state;
- (void)_cancelAssertionInvalidationTimerWithReason:(id)a3;
- (void)_startAssertionInvalidationTimerWithEventHandler:(id)a3;
- (void)_updateProcessAssertion;
- (void)dealloc;
- (void)engine:(id)a3 didChangeToState:(unint64_t)a4;
- (void)getServerEndpointWithReply:(id)a3;
- (void)setAssertionInvalidationTimer:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setConnectionInvalidated:(BOOL)a3;
- (void)setPid:(int)a3;
- (void)setProcessAssertion:(id)a3;
- (void)setStateMonitor:(id)a3;
- (void)setSupportsBackgroundAudio:(BOOL)a3;
- (void)setWantsProcessAssertion:(BOOL)a3;
- (void)setWantsReverseProcessAssertion:(BOOL)a3;
@end

@implementation MPRemotePlayerServiceConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionInvalidationTimer, 0);
  objc_storeStrong((id *)&self->_processAssertion, 0);
  objc_storeStrong((id *)&self->_stateMonitor, 0);
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong((id *)&self->_playbackEngine, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (void)setAssertionInvalidationTimer:(id)a3
{
}

- (OS_dispatch_source)assertionInvalidationTimer
{
  return self->_assertionInvalidationTimer;
}

- (void)setWantsProcessAssertion:(BOOL)a3
{
  self->_wantsProcessAssertion = a3;
}

- (BOOL)wantsProcessAssertion
{
  return self->_wantsProcessAssertion;
}

- (void)setProcessAssertion:(id)a3
{
}

- (BKSProcessAssertion)processAssertion
{
  return self->_processAssertion;
}

- (void)setStateMonitor:(id)a3
{
}

- (BKSApplicationStateMonitor)stateMonitor
{
  return self->_stateMonitor;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setConnectionInvalidated:(BOOL)a3
{
  self->_connectionInvalidated = a3;
}

- (BOOL)connectionInvalidated
{
  return self->_connectionInvalidated;
}

- (NSXPCConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  return (NSXPCConnection *)WeakRetained;
}

- (MPCPlaybackEngine)playbackEngine
{
  return self->_playbackEngine;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (int)pid
{
  return self->_pid;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setSupportsBackgroundAudio:(BOOL)a3
{
  self->_supportsBackgroundAudio = a3;
}

- (BOOL)supportsBackgroundAudio
{
  return self->_supportsBackgroundAudio;
}

- (void)_cancelAssertionInvalidationTimerWithReason:(id)a3
{
  id v5 = a3;
  if (![v5 length])
  {
    v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"MPRemotePlayerService.m" lineNumber:253 description:@"Must provide a reason for logging."];
  }
  if (self->_assertionInvalidationTimer)
  {
    v6 = sub_100003CC4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      assertionInvalidationTimer = self->_assertionInvalidationTimer;
      int v10 = 134218498;
      v11 = self;
      __int16 v12 = 2048;
      v13 = assertionInvalidationTimer;
      __int16 v14 = 2114;
      id v15 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "MPRemotePlayerService: %p: canceled assertion invalidation timer %p [%{public}@]", (uint8_t *)&v10, 0x20u);
    }

    dispatch_source_cancel((dispatch_source_t)self->_assertionInvalidationTimer);
    v7 = self->_assertionInvalidationTimer;
    self->_assertionInvalidationTimer = 0;
  }
}

- (void)_startAssertionInvalidationTimerWithEventHandler:(id)a3
{
  id v5 = a3;
  if (self->_assertionInvalidationTimer)
  {
    __int16 v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"MPRemotePlayerService.m" lineNumber:243 description:@"Cancel existing timer before starting a new one."];
  }
  v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
  assertionInvalidationTimer = self->_assertionInvalidationTimer;
  self->_assertionInvalidationTimer = v6;

  v8 = self->_assertionInvalidationTimer;
  dispatch_time_t v9 = dispatch_time(0, 3000000000);
  dispatch_source_set_timer((dispatch_source_t)v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
  dispatch_source_set_event_handler((dispatch_source_t)self->_assertionInvalidationTimer, v5);
  dispatch_resume((dispatch_object_t)self->_assertionInvalidationTimer);
  int v10 = sub_100003CC4();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = self->_assertionInvalidationTimer;
    int v13 = 134218240;
    __int16 v14 = self;
    __int16 v15 = 2048;
    v16 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "MPRemotePlayerService: %p: started assertion invalidation timer %p", (uint8_t *)&v13, 0x16u);
  }
}

- (BOOL)_shouldPreventSuspensionForBackgroundPlayback
{
  if (!self->_wantsProcessAssertion) {
    return 0;
  }
  unint64_t state = self->_state;
  return (state == 1 || state == 1000) && self->_supportsBackgroundAudio;
}

- (void)_updateProcessAssertion
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (self->_processAssertion)
  {
    if (self->_connectionInvalidated)
    {
      [(MPRemotePlayerServiceConnection *)self _cancelAssertionInvalidationTimerWithReason:@"connection invalidated"];
      v3 = sub_100003CC4();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        processAssertion = self->_processAssertion;
        int pid = self->_pid;
        *(_DWORD *)buf = 134218496;
        int v13 = self;
        __int16 v14 = 2048;
        __int16 v15 = processAssertion;
        __int16 v16 = 1024;
        int v17 = pid;
        _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "MPRemotePlayerService: %p: invalidated process assertion %p for %d [connection invalidated]", buf, 0x1Cu);
      }

      [(BKSProcessAssertion *)self->_processAssertion invalidate];
      v4 = self->_processAssertion;
      self->_processAssertion = 0;
      goto LABEL_11;
    }
    if (![(MPRemotePlayerServiceConnection *)self _shouldPreventSuspensionForBackgroundPlayback])
    {
      [(MPRemotePlayerServiceConnection *)self _cancelAssertionInvalidationTimerWithReason:@"reset invalidation window"];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100004268;
      v10[3] = &unk_100008278;
      v10[4] = self;
      [(MPRemotePlayerServiceConnection *)self _startAssertionInvalidationTimerWithEventHandler:v10];
      return;
    }
  }
  else if (![(MPRemotePlayerServiceConnection *)self _shouldPreventSuspensionForBackgroundPlayback])
  {
    return;
  }
  if (self->_processAssertion) {
    return;
  }
  id v5 = objc_alloc((Class)BKSProcessAssertion);
  uint64_t v6 = self->_pid;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100004114;
  v11[3] = &unk_100008318;
  v11[4] = self;
  v7 = (BKSProcessAssertion *)[v5 initWithPID:v6 flags:1 reason:1 name:@"MPMusicPlayerController/applicationMusicPlayer/notifications" withHandler:v11];
  v4 = self->_processAssertion;
  self->_processAssertion = v7;
LABEL_11:
}

- (void)engine:(id)a3 didChangeToState:(unint64_t)a4
{
  self->_unint64_t state = a4;
  [(MPRemotePlayerServiceConnection *)self _updateProcessAssertion];
}

- (void)setWantsReverseProcessAssertion:(BOOL)a3
{
  id v5 = sub_100004424();
  id v6 = [v5 beginTaskWithName:@"setWantsReverseProcessAssertion" expirationHandler:0];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004590;
  block[3] = &unk_1000082F0;
  BOOL v8 = a3;
  block[4] = self;
  block[5] = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)getServerEndpointWithReply:(id)a3
{
  id v4 = a3;
  id v5 = sub_100004424();
  id v6 = [v5 beginTaskWithName:@"getServerEndpointWithReply" expirationHandler:0];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004958;
  block[3] = &unk_1000082C8;
  block[4] = self;
  id v9 = v4;
  id v10 = v6;
  id v7 = v4;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)dealloc
{
  [(BKSApplicationStateMonitor *)self->_stateMonitor invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MPRemotePlayerServiceConnection;
  [(MPRemotePlayerServiceConnection *)&v3 dealloc];
}

- (MPRemotePlayerServiceConnection)initWithConnection:(id)a3 bundleID:(id)a4 pid:(int)a5 playbackEngine:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v28.receiver = self;
  v28.super_class = (Class)MPRemotePlayerServiceConnection;
  int v13 = [(MPRemotePlayerServiceConnection *)&v28 init];
  __int16 v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_bundleID, a4);
    v14->_int pid = a5;
    objc_storeStrong((id *)&v14->_playbackEngine, a6);
    [(MPCPlaybackEngine *)v14->_playbackEngine addEngineObserver:v14];
    objc_storeWeak((id *)&v14->_connection, v10);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100004D60;
    v25[3] = &unk_100008250;
    __int16 v15 = v14;
    v26 = v15;
    id v16 = v12;
    id v27 = v16;
    [v10 setInvalidationHandler:v25];
    int v17 = +[NSNotificationCenter defaultCenter];
    [v17 addObserver:v15 selector:"_mediaServicesReset:" name:AVAudioSessionMediaServicesWereResetNotification object:0];

    [(MPRemotePlayerServiceConnection *)v15 _mediaServicesReset:0];
    id v18 = objc_alloc((Class)BKSApplicationStateMonitor);
    id v29 = v11;
    v19 = +[NSArray arrayWithObjects:&v29 count:1];
    id v20 = [v18 initWithBundleIDs:v19 states:BKSApplicationStateAll];

    v21 = [v20 bundleInfoValueForKey:@"UIBackgroundModes" PID:v14->_pid];
    v15->_supportsBackgroundAudio = [v21 containsObject:@"audio"];

    if (v15->_supportsBackgroundAudio)
    {
      [v20 invalidate];
    }
    else
    {
      objc_storeStrong((id *)&v15->_stateMonitor, v20);
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100004E04;
      v23[3] = &unk_1000082A0;
      id v24 = v16;
      [(BKSApplicationStateMonitor *)v15->_stateMonitor setHandler:v23];
    }
  }

  return v14;
}

@end