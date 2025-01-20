@interface SRCompactAutoDismissController
- (BOOL)_deviceSupportsFaceID;
- (BOOL)_ignoreUnintentionalTouches;
- (SRCompactAutoDismissController)initWithDelegate:(id)a3;
- (SRCompactAutoDismissController)initWithDelegate:(id)a3 andLockState:(unint64_t)a4;
- (SRUserAttentionController)userAttentionController;
- (SUICAutoDismissalStrategy)_autoDismissalStrategy;
- (double)minimumIdleTimeInterval;
- (int64_t)autoDismissalReason;
- (void)_cancelDelayedUserAttentionControllerStop;
- (void)_cancelScheduledAutoDismissalForLongIdlingIfNeeded;
- (void)_cancelUserTouchInteractionTimeout;
- (void)_dismissForLongIdling;
- (void)_dismissForTouchOutsideOfSiri;
- (void)_handleUserTouchInteractionTimeout;
- (void)_handleVideoPlaybackDidFinishNotification;
- (void)_handleVideoPlaybackDidStartNotification;
- (void)_scheduleUserTouchInteractionTimeout;
- (void)_setAutoDismissalStrategy:(id)a3;
- (void)_startUserAttentionControllerIfNeeded;
- (void)_startUserAttentionControllerIfNeededForTypes:(unint64_t)a3;
- (void)_stopUserAttentionControllerIfNeeded;
- (void)_stopUserAttentionControllerIfNeededAfterDelay:(double)a3;
- (void)autoDismissalStrategyDidChangeAutoDismissalDecision:(id)a3 dismissalReason:(int64_t)a4 permanent:(BOOL)a5;
- (void)cancelAutoDismissalForTouchOutsideOfSiri;
- (void)invalidate;
- (void)scheduleAutoDismissalForLongIdling:(double)a3;
- (void)scheduleAutoDismissalForTouchOutsideOfSiri:(double)a3;
- (void)setAutoDismissalReason:(int64_t)a3;
- (void)setMinimumIdleTimeInterval:(double)a3;
- (void)setUseExtendedTimeout:(BOOL)a3;
- (void)setUserAttentionController:(id)a3;
- (void)siriResponseModeDidChange:(unint64_t)a3 isWiredMicOrBTHeadsetOrWx:(BOOL)a4;
- (void)updateMinimumIdleTimeInterval:(double)a3;
- (void)userAttentionController:(id)a3 didGainAttentionWithEvent:(int64_t)a4;
- (void)userAttentionController:(id)a3 didLoseAttentionWithEvent:(int64_t)a4;
@end

@implementation SRCompactAutoDismissController

- (SRCompactAutoDismissController)initWithDelegate:(id)a3 andLockState:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SRCompactAutoDismissController;
  v7 = [(SRCompactAutoDismissController *)&v12 init];
  if (v7)
  {
    v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[SRCompactAutoDismissController initWithDelegate:andLockState:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Initializing auto-dismiss controller", buf, 0xCu);
    }
    v7->_autoDismissalReason = 0;
    objc_storeWeak((id *)&v7->_delegate, v6);
    qword_100172C70 = 3;
    v7->_passcodeLocked = (v4 & 2) != 0;
    v7->_timerScheduledForTouchOutsideOfSiri = 0;
    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v7 selector:"_handleVideoPlaybackDidStartNotification" name:SiriUIVideoPlaybackDidStartNotification object:0];

    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v7 selector:"_handleVideoPlaybackDidFinishNotification" name:SiriUIVideoPlaybackDidFinishNotification object:0];

    [(SRCompactAutoDismissController *)v7 scheduleAutoDismissalForLongIdling:900.0];
  }

  return v7;
}

- (SRCompactAutoDismissController)initWithDelegate:(id)a3
{
  return [(SRCompactAutoDismissController *)self initWithDelegate:a3 andLockState:0];
}

- (void)siriResponseModeDidChange:(unint64_t)a3 isWiredMicOrBTHeadsetOrWx:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = MDModeGetName();
    v10 = +[NSNumber numberWithBool:v4];
    v11 = +[NSNumber numberWithBool:self->_passcodeLocked];
    *(_DWORD *)buf = 136315906;
    v21 = "-[SRCompactAutoDismissController siriResponseModeDidChange:isWiredMicOrBTHeadsetOrWx:]";
    __int16 v22 = 2112;
    v23 = v9;
    __int16 v24 = 2112;
    v25 = v10;
    __int16 v26 = 2112;
    v27 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Updating auto dismissal strategy with mode=%@, isWiredMicOrBTHeadsetOrWx=%@, passcodeLocked=%@", buf, 0x2Au);
  }
  objc_initWeak((id *)buf, self);
  id v12 = &_dispatch_main_q;
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_100016768;
  v16 = &unk_100143338;
  v18[1] = (id)a3;
  v17 = self;
  BOOL v19 = v4;
  objc_copyWeak(v18, (id *)buf);
  sub_100015EDC(&_dispatch_main_q, &v13);

  -[SRCompactAutoDismissController _startUserAttentionControllerIfNeededForTypes:](self, "_startUserAttentionControllerIfNeededForTypes:", 2, v13, v14, v15, v16, v17);
  [(SRCompactAutoDismissController *)self scheduleAutoDismissalForLongIdling:900.0];
  objc_destroyWeak(v18);
  objc_destroyWeak((id *)buf);
}

- (void)updateMinimumIdleTimeInterval:(double)a3
{
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    v8 = "-[SRCompactAutoDismissController updateMinimumIdleTimeInterval:]";
    __int16 v9 = 2048;
    double v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Updating minimum idle interval to %.0f s", (uint8_t *)&v7, 0x16u);
  }
  [(SRCompactAutoDismissController *)self setMinimumIdleTimeInterval:a3];
  id v6 = [(SRCompactAutoDismissController *)self _autoDismissalStrategy];
  [v6 setMinimumIdleTimeInterval:a3];
}

- (void)setUseExtendedTimeout:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    v8 = "-[SRCompactAutoDismissController setUseExtendedTimeout:]";
    __int16 v9 = 1024;
    BOOL v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Setting useExtendedTimeout=%d", (uint8_t *)&v7, 0x12u);
  }
  self->_useExtendedTimeout = v3;
  autoDismissalStrategy = self->_autoDismissalStrategy;
  if (v3)
  {
    [(SUICAutoDismissalStrategy *)autoDismissalStrategy setViewRequiringExtendedTimeoutVisible:1];
    [(SRCompactAutoDismissController *)self _stopUserAttentionControllerIfNeeded];
    [(SRCompactAutoDismissController *)self _startUserAttentionControllerIfNeeded];
  }
  else
  {
    [(SUICAutoDismissalStrategy *)autoDismissalStrategy setViewRequiringExtendedTimeoutVisible:0];
    [(SRCompactAutoDismissController *)self _stopUserAttentionControllerIfNeeded];
  }
}

- (void)invalidate
{
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[SRCompactAutoDismissController invalidate]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Invalidating auto dismiss controller", (uint8_t *)&v4, 0xCu);
  }
  [(SRCompactAutoDismissController *)self _stopUserAttentionControllerIfNeeded];
  [(SRCompactAutoDismissController *)self _cancelScheduledAutoDismissalForLongIdlingIfNeeded];
  [(SRCompactAutoDismissController *)self cancelAutoDismissalForTouchOutsideOfSiri];
}

- (void)scheduleAutoDismissalForLongIdling:(double)a3
{
  [(SRCompactAutoDismissController *)self _cancelScheduledAutoDismissalForLongIdlingIfNeeded];
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    int v7 = "-[SRCompactAutoDismissController scheduleAutoDismissalForLongIdling:]";
    __int16 v8 = 2048;
    double v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Scheduling auto dismissal after a max idle time of %.0f s", (uint8_t *)&v6, 0x16u);
  }
  [(SRCompactAutoDismissController *)self performSelector:"_dismissForLongIdling" withObject:0 afterDelay:a3];
}

- (void)_cancelScheduledAutoDismissalForLongIdlingIfNeeded
{
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[SRCompactAutoDismissController _cancelScheduledAutoDismissalForLongIdlingIfNeeded]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Canceling previously scheduled auto dismissal for long idling if needed", (uint8_t *)&v4, 0xCu);
  }
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:"_dismissForLongIdling" object:0];
}

- (void)_dismissForLongIdling
{
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int v6 = "-[SRCompactAutoDismissController _dismissForLongIdling]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Siri has been long idling. Auto dismissing now...", (uint8_t *)&v5, 0xCu);
  }
  self->_autoDismissalReason = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained autoDismissControllerRequestsDismissal:self];
}

- (void)scheduleAutoDismissalForTouchOutsideOfSiri:(double)a3
{
  if (+[AFSystemAssistantExperienceStatusManager isSAEEnabled])
  {
    if (self->_timerScheduledForTouchOutsideOfSiri)
    {
      int v5 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG)) {
        sub_1000B71C8(v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
    else
    {
      [(SRCompactAutoDismissController *)self performSelector:"_dismissForTouchOutsideOfSiri" withObject:0 afterDelay:a3];
      v21 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 136315394;
        v23 = "-[SRCompactAutoDismissController scheduleAutoDismissalForTouchOutsideOfSiri:]";
        __int16 v24 = 2048;
        double v25 = a3;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Scheduled auto-dismissal for touch outside of Siri in %.1f seconds", (uint8_t *)&v22, 0x16u);
      }
      self->_timerScheduledForTouchOutsideOfSiri = 1;
    }
  }
  else
  {
    v13 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG)) {
      sub_1000B7240(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
}

- (void)cancelAutoDismissalForTouchOutsideOfSiri
{
  if (+[AFSystemAssistantExperienceStatusManager isSAEEnabled])
  {
    BOOL v3 = AFSiriLogContextConnection;
    if (self->_timerScheduledForTouchOutsideOfSiri)
    {
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 136315138;
        uint64_t v20 = "-[SRCompactAutoDismissController cancelAutoDismissalForTouchOutsideOfSiri]";
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Cancelling auto-dismissal for touch outside of Siri", (uint8_t *)&v19, 0xCu);
      }
      [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:"_dismissForTouchOutsideOfSiri" object:0];
      self->_timerScheduledForTouchOutsideOfSiri = 0;
    }
    else if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      sub_1000B72B8(v3, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  else
  {
    int v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG)) {
      sub_1000B7330(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
}

- (void)_dismissForTouchOutsideOfSiri
{
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[SRCompactAutoDismissController _dismissForTouchOutsideOfSiri]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Auto-dismissing now due to touch outside of Siri", (uint8_t *)&v5, 0xCu);
  }
  self->_autoDismissalReason = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained autoDismissControllerRequestsDismissal:self];
}

- (void)_startUserAttentionControllerIfNeeded
{
}

- (void)_startUserAttentionControllerIfNeededForTypes:(unint64_t)a3
{
  autoDismissalStrategy = self->_autoDismissalStrategy;
  if (autoDismissalStrategy
    && [(SUICAutoDismissalStrategy *)autoDismissalStrategy isVideoPlaying])
  {
    uint64_t v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v11 = "-[SRCompactAutoDismissController _startUserAttentionControllerIfNeededForTypes:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s #autodismiss User attention controller will not start because video is playing", buf, 0xCu);
    }
  }
  else
  {
    objc_initWeak((id *)buf, self);
    id v7 = &_dispatch_main_q;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10001723C;
    v8[3] = &unk_100143388;
    objc_copyWeak(v9, (id *)buf);
    v9[1] = (id)a3;
    sub_100015EDC(&_dispatch_main_q, v8);

    objc_destroyWeak(v9);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_stopUserAttentionControllerIfNeeded
{
  [(SRCompactAutoDismissController *)self _cancelDelayedUserAttentionControllerStop];
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v13 = "-[SRCompactAutoDismissController _stopUserAttentionControllerIfNeeded]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Stopping user attention controller if needed...", buf, 0xCu);
  }
  userAttentionController = self->_userAttentionController;
  p_userAttentionController = (uint64_t *)&self->_userAttentionController;
  int v4 = userAttentionController;
  if (userAttentionController)
  {
    id v11 = 0;
    unsigned __int8 v7 = [(SRUserAttentionController *)v4 stopIfNeeded:&v11];
    id v8 = v11;
    if ((v7 & 1) == 0)
    {
      uint64_t v9 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
        sub_1000B7484(p_userAttentionController, (uint64_t)v8, v9);
      }
    }
  }
  else
  {
    id v8 = 0;
  }
  [(id)*p_userAttentionController setDelegate:0];
  uint64_t v10 = (void *)*p_userAttentionController;
  uint64_t *p_userAttentionController = 0;
}

- (void)_stopUserAttentionControllerIfNeededAfterDelay:(double)a3
{
  [(SRCompactAutoDismissController *)self _cancelDelayedUserAttentionControllerStop];

  [(SRCompactAutoDismissController *)self performSelector:"_stopUserAttentionControllerIfNeeded" withObject:0 afterDelay:a3];
}

- (void)_cancelDelayedUserAttentionControllerStop
{
  BOOL v3 = objc_opt_class();

  [v3 cancelPreviousPerformRequestsWithTarget:self selector:"_stopUserAttentionControllerIfNeeded" object:0];
}

- (BOOL)_deviceSupportsFaceID
{
  if (qword_100171DF8 != -1) {
    dispatch_once(&qword_100171DF8, &stru_1001433A8);
  }
  return byte_100171DF0;
}

- (BOOL)_ignoreUnintentionalTouches
{
  BOOL v3 = [(SRCompactAutoDismissController *)self _deviceSupportsFaceID];
  BOOL v4 = v3;
  BOOL v5 = !self->_isWiredMicOrBTHeadsetOrWx || !v3;
  BOOL v6 = !v5 && !self->_faceDetected && !self->_useExtendedTimeout && self->_passcodeLocked;
  unsigned __int8 v7 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = v7;
    uint64_t v10 = +[NSNumber numberWithBool:v6];
    id v11 = +[NSNumber numberWithBool:self->_isWiredMicOrBTHeadsetOrWx];
    uint64_t v12 = +[NSNumber numberWithBool:v4];
    uint64_t v13 = +[NSNumber numberWithBool:self->_faceDetected];
    uint64_t v14 = +[NSNumber numberWithBool:self->_useExtendedTimeout];
    uint64_t v15 = +[NSNumber numberWithBool:self->_passcodeLocked];
    int v16 = 136316674;
    uint64_t v17 = "-[SRCompactAutoDismissController _ignoreUnintentionalTouches]";
    __int16 v18 = 2112;
    int v19 = v10;
    __int16 v20 = 2112;
    v21 = v11;
    __int16 v22 = 2112;
    v23 = v12;
    __int16 v24 = 2112;
    double v25 = v13;
    __int16 v26 = 2112;
    v27 = v14;
    __int16 v28 = 2112;
    v29 = v15;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s #autodismiss ignoreTouches: %@, isWiredMicOrBTHeadsetOrWx: %@, deviceSupportsFaceID: %@, faceDetected: %@, useExtendedTimeout: %@, passcodeLocked: %@", (uint8_t *)&v16, 0x48u);
  }
  return v6;
}

- (void)userAttentionController:(id)a3 didLoseAttentionWithEvent:(int64_t)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    uint64_t v9 = SRUIFStringForUserAttentionLossEvent();
    autoDismissalStrategy = self->_autoDismissalStrategy;
    int v11 = 136315650;
    uint64_t v12 = "-[SRCompactAutoDismissController userAttentionController:didLoseAttentionWithEvent:]";
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    int v16 = autoDismissalStrategy;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Attention was lost with event=%@, _autoDismissalStrategy=%@", (uint8_t *)&v11, 0x20u);
  }
  if (a4 == 2)
  {
    [(SUICAutoDismissalStrategy *)self->_autoDismissalStrategy setLatestDeviceMotionEvent:2];
  }
  else if (a4 == 1)
  {
    self->_faceDetected = 0;
    [(SUICAutoDismissalStrategy *)self->_autoDismissalStrategy setLatestFaceAwarenessEvent:2];
  }
}

- (void)userAttentionController:(id)a3 didGainAttentionWithEvent:(int64_t)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    uint64_t v9 = SRUIFStringForUserAttentionGainEvent();
    autoDismissalStrategy = self->_autoDismissalStrategy;
    int v12 = 136315650;
    __int16 v13 = "-[SRCompactAutoDismissController userAttentionController:didGainAttentionWithEvent:]";
    __int16 v14 = 2112;
    __int16 v15 = v9;
    __int16 v16 = 2112;
    uint64_t v17 = autoDismissalStrategy;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Attention was gained with event=%@, _autoDismissalStrategy=%@", (uint8_t *)&v12, 0x20u);
  }
  switch(a4)
  {
    case 1:
      self->_faceDetected = 1;
      [(SUICAutoDismissalStrategy *)self->_autoDismissalStrategy setLatestFaceAwarenessEvent:1];
      break;
    case 2:
      [(SUICAutoDismissalStrategy *)self->_autoDismissalStrategy setLatestDeviceMotionEvent:1];
      break;
    case 3:
      if ([(SRCompactAutoDismissController *)self _ignoreUnintentionalTouches])
      {
        int v11 = AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 136315138;
          __int16 v13 = "-[SRCompactAutoDismissController userAttentionController:didGainAttentionWithEvent:]";
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Ignoring touch interaction, reason: possibly an accidental touch during hearst request", (uint8_t *)&v12, 0xCu);
        }
      }
      else
      {
        [(SUICAutoDismissalStrategy *)self->_autoDismissalStrategy setUserInteractedWithTouchScreen:1];
        [(SRCompactAutoDismissController *)self _scheduleUserTouchInteractionTimeout];
      }
      break;
    case 4:
      [(SUICAutoDismissalStrategy *)self->_autoDismissalStrategy setUserInteractedWithTouchIDSensor:1];
      break;
    default:
      break;
  }
}

- (void)_scheduleUserTouchInteractionTimeout
{
  [(SRCompactAutoDismissController *)self _cancelUserTouchInteractionTimeout];

  [(SRCompactAutoDismissController *)self performSelector:"_handleUserTouchInteractionTimeout" withObject:0 afterDelay:15.0];
}

- (void)_cancelUserTouchInteractionTimeout
{
  BOOL v3 = objc_opt_class();

  [v3 cancelPreviousPerformRequestsWithTarget:self selector:"_handleUserTouchInteractionTimeout" object:0];
}

- (void)_handleUserTouchInteractionTimeout
{
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
    sub_1000B7520(v3);
  }
  [(SUICAutoDismissalStrategy *)self->_autoDismissalStrategy setUserInteractedWithTouchScreen:0];
}

- (void)autoDismissalStrategyDidChangeAutoDismissalDecision:(id)a3 dismissalReason:(int64_t)a4 permanent:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if ([v8 shouldDismiss])
  {
    uint64_t v9 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = v9;
      int v11 = SUICStringForAutoDismissalReason();
      int v14 = 136315650;
      __int16 v15 = "-[SRCompactAutoDismissController autoDismissalStrategyDidChangeAutoDismissalDecision:dismissalReason:permanent:]";
      __int16 v16 = 2112;
      id v17 = v8;
      __int16 v18 = 2112;
      int v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Auto dismissal strategy (%@) specified that Siri should dismiss, reason: %@", (uint8_t *)&v14, 0x20u);
    }
    [(SRCompactAutoDismissController *)self _stopUserAttentionControllerIfNeeded];
    self->_autoDismissalReason = a4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained autoDismissControllerRequestsDismissal:self];
  }
  else if (v5)
  {
    __int16 v13 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315394;
      __int16 v15 = "-[SRCompactAutoDismissController autoDismissalStrategyDidChangeAutoDismissalDecision:dismissalReason:permanent:]";
      __int16 v16 = 2112;
      id v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Auto dismissal strategy (%@) specified that Siri permanently stop auto dismissal", (uint8_t *)&v14, 0x16u);
    }
    [(SRCompactAutoDismissController *)self _stopUserAttentionControllerIfNeeded];
  }
}

- (void)_handleVideoPlaybackDidStartNotification
{
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    BOOL v5 = "-[SRCompactAutoDismissController _handleVideoPlaybackDidStartNotification]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Stopping user attention controller if needed because video playback started", (uint8_t *)&v4, 0xCu);
  }
  [(SUICAutoDismissalStrategy *)self->_autoDismissalStrategy setVideoPlaying:1];
  [(SRCompactAutoDismissController *)self _stopUserAttentionControllerIfNeeded];
}

- (void)_handleVideoPlaybackDidFinishNotification
{
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    BOOL v5 = "-[SRCompactAutoDismissController _handleVideoPlaybackDidFinishNotification]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Starting user attention controller if needed because video playback ended", (uint8_t *)&v4, 0xCu);
  }
  [(SUICAutoDismissalStrategy *)self->_autoDismissalStrategy setVideoPlaying:0];
  [(SRCompactAutoDismissController *)self _startUserAttentionControllerIfNeeded];
}

- (int64_t)autoDismissalReason
{
  return self->_autoDismissalReason;
}

- (void)setAutoDismissalReason:(int64_t)a3
{
  self->_autoDismissalReason = a3;
}

- (double)minimumIdleTimeInterval
{
  return self->_minimumIdleTimeInterval;
}

- (void)setMinimumIdleTimeInterval:(double)a3
{
  self->_minimumIdleTimeInterval = a3;
}

- (SRUserAttentionController)userAttentionController
{
  return (SRUserAttentionController *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUserAttentionController:(id)a3
{
}

- (SUICAutoDismissalStrategy)_autoDismissalStrategy
{
  return self->_autoDismissalStrategy;
}

- (void)_setAutoDismissalStrategy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoDismissalStrategy, 0);
  objc_storeStrong((id *)&self->_userAttentionController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end