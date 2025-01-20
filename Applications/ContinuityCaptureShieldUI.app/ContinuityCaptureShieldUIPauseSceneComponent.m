@interface ContinuityCaptureShieldUIPauseSceneComponent
- (BOOL)_shouldPauseForDeactivationReasonMask:(unint64_t)a3;
- (ContinuityCaptureShieldUIPauseSceneComponent)initWithScene:(id)a3;
- (UIScene)_scene;
- (void)_cancelCurrentDebounceTimer;
- (void)_recalculateState;
- (void)_scene:(id)a3 willTransitionToActivationState:(int64_t)a4 withReasonsMask:(unint64_t)a5;
- (void)_sceneWillInvalidate:(id)a3;
- (void)_setScene:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)sceneDidEnterBackground:(id)a3;
@end

@implementation ContinuityCaptureShieldUIPauseSceneComponent

- (ContinuityCaptureShieldUIPauseSceneComponent)initWithScene:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ContinuityCaptureShieldUIPauseSceneComponent;
  v5 = [(ContinuityCaptureShieldUIPauseSceneComponent *)&v20 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scene, v4);
    v6->_previousState = (int64_t)[v4 activationState];
    v7 = +[ContinuityCaptureRemoteUIPowerButtonStatus sharedInstance];
    [v7 addObserver:v6 forKeyPath:CMContinuityCaptureSystemStatusPowerButtonPressedKVOKey options:3 context:0];

    dispatch_source_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
    debounceSource = v6->_debounceSource;
    v6->_debounceSource = (OS_dispatch_source *)v8;

    objc_initWeak(&location, v6);
    v10 = v6->_debounceSource;
    v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    v16 = sub_10000A3FC;
    v17 = &unk_10001C678;
    objc_copyWeak(&v18, &location);
    dispatch_source_set_event_handler(v10, &v14);
    dispatch_activate((dispatch_object_t)v6->_debounceSource);
    v11 = +[NSNotificationCenter defaultCenter];
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_scene);
    [v11 addObserver:v6 selector:"sceneDidEnterBackground:" name:UISceneDidEnterBackgroundNotification object:WeakRetained];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = CMContinuityCaptureSystemStatusPowerButtonPressedKVOKey;
  id v13 = a5;
  if ([v10 isEqualToString:v12])
  {
    v14 = [v13 objectForKeyedSubscript:NSKeyValueChangeNewKey];

    if ([v14 BOOLValue])
    {
      uint64_t v15 = sub_10000AB00();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        id v18 = "-[ContinuityCaptureShieldUIPauseSceneComponent observeValueForKeyPath:ofObject:change:context:]";
        __int16 v19 = 2048;
        objc_super v20 = self;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s: <%p> power button pressed, cancelling background timer", buf, 0x16u);
      }

      [(ContinuityCaptureShieldUIPauseSceneComponent *)self _cancelCurrentDebounceTimer];
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)ContinuityCaptureShieldUIPauseSceneComponent;
    [(ContinuityCaptureShieldUIPauseSceneComponent *)&v16 observeValueForKeyPath:v10 ofObject:v11 change:v13 context:a6];
    v14 = v13;
  }
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4 = sub_10000AB00();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    v6 = "-[ContinuityCaptureShieldUIPauseSceneComponent sceneDidEnterBackground:]";
    __int16 v7 = 2048;
    dispatch_source_t v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s: <%p> scene entered background, recalculate pause state", (uint8_t *)&v5, 0x16u);
  }

  [(ContinuityCaptureShieldUIPauseSceneComponent *)self _recalculateState];
  [(ContinuityCaptureShieldUIPauseSceneComponent *)self _cancelCurrentDebounceTimer];
}

- (void)_sceneWillInvalidate:(id)a3
{
  id v4 = +[ContinuityCaptureRemoteUIPowerButtonStatus sharedInstance];
  [v4 removeObserver:self forKeyPath:CMContinuityCaptureSystemStatusPowerButtonPressedKVOKey context:0];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self];
}

- (void)_scene:(id)a3 willTransitionToActivationState:(int64_t)a4 withReasonsMask:(unint64_t)a5
{
  dispatch_source_t v8 = sub_10000AB00();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10000FDCC((uint64_t)self, a4, v8);
  }

  self->_reasonsMask = a5;
  if (a4) {
    int64_t v9 = 500000000;
  }
  else {
    int64_t v9 = 100000000;
  }
  dispatch_time_t v10 = dispatch_time(0, v9);
  dispatch_source_set_timer((dispatch_source_t)self->_debounceSource, v10, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (void)_cancelCurrentDebounceTimer
{
}

- (void)_recalculateState
{
  int64_t previousState = self->_previousState;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  id v5 = [WeakRetained activationState];

  self->_int64_t previousState = (int64_t)v5;
  v6 = sub_10000AB00();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v7 = UIApplicationSceneDeactivationReasonMaskDescriptionComponents();
    int v12 = 136316162;
    id v13 = "-[ContinuityCaptureShieldUIPauseSceneComponent _recalculateState]";
    __int16 v14 = 2048;
    uint64_t v15 = self;
    __int16 v16 = 2048;
    int64_t v17 = previousState;
    __int16 v18 = 2048;
    id v19 = v5;
    __int16 v20 = 2112;
    v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: <%p> previousState:%zu currentState:%zu deactivationReasons:%@", (uint8_t *)&v12, 0x34u);
  }
  if (v5 != (id)previousState)
  {
    switch((unint64_t)v5)
    {
      case 0xFFFFFFFFFFFFFFFFLL:
      case 2uLL:
        dispatch_source_t v8 = sub_10000AB00();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_8;
        }
        int v12 = 136315394;
        id v13 = "-[ContinuityCaptureShieldUIPauseSceneComponent _recalculateState]";
        __int16 v14 = 2048;
        uint64_t v15 = self;
        int64_t v9 = "%s: <%p> send pause event - backgrounded";
        goto LABEL_7;
      case 0uLL:
        id v11 = sub_10000AB00();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 136315394;
          id v13 = "-[ContinuityCaptureShieldUIPauseSceneComponent _recalculateState]";
          __int16 v14 = 2048;
          uint64_t v15 = self;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: <%p> send resume event", (uint8_t *)&v12, 0x16u);
        }

        dispatch_time_t v10 = +[ContinuityCaptureShieldUIBackgroundPauseManager sharedInstance];
        [v10 requestDefaultScreenResumeEvent:1];
        goto LABEL_12;
      case 1uLL:
        if (![(ContinuityCaptureShieldUIPauseSceneComponent *)self _shouldPauseForDeactivationReasonMask:self->_reasonsMask])return; {
        dispatch_source_t v8 = sub_10000AB00();
        }
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 136315394;
          id v13 = "-[ContinuityCaptureShieldUIPauseSceneComponent _recalculateState]";
          __int16 v14 = 2048;
          uint64_t v15 = self;
          int64_t v9 = "%s: <%p> send pause event - foregroundInactive";
LABEL_7:
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, 0x16u);
        }
LABEL_8:

        dispatch_time_t v10 = +[ContinuityCaptureShieldUIBackgroundPauseManager sharedInstance];
        [v10 requestDefaultScreenPauseEvent:1];
LABEL_12:

        break;
      default:
        return;
    }
  }
}

- (BOOL)_shouldPauseForDeactivationReasonMask:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFCFCFLL) != 0;
}

- (UIScene)_scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  return (UIScene *)WeakRetained;
}

- (void)_setScene:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);

  objc_storeStrong((id *)&self->_debounceSource, 0);
}

@end