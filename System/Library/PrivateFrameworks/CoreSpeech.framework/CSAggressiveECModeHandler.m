@interface CSAggressiveECModeHandler
- (BOOL)aggressiveEchoCancellationApplied;
- (BOOL)inAttendingWindow;
- (BOOL)readThisOrVoiceOverSessionActive;
- (CSAggressiveECModeHandler)init;
- (CSAttSiriAudioSessionStateClient)siriStateClient;
- (OS_dispatch_queue)queue;
- (int64_t)echoCancellationReason;
- (void)_configureAggressiveEchoCancellationParams:(BOOL)a3;
- (void)notifySiriSessionStateTTSOngoing:(BOOL)a3;
- (void)setAggressiveEchoCancellationApplied:(BOOL)a3;
- (void)setAttendingState:(BOOL)a3;
- (void)setAudioSessionState:(id)a3;
- (void)setEchoCancellationReason:(int64_t)a3;
- (void)setInAttendingWindow:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setReadThisOrVoiceOverSessionActive:(BOOL)a3;
- (void)setSiriStateClient:(id)a3;
- (void)siriDismissed;
@end

@implementation CSAggressiveECModeHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriStateClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setEchoCancellationReason:(int64_t)a3
{
  self->_echoCancellationReason = a3;
}

- (int64_t)echoCancellationReason
{
  return self->_echoCancellationReason;
}

- (void)setAggressiveEchoCancellationApplied:(BOOL)a3
{
  self->_aggressiveEchoCancellationApplied = a3;
}

- (BOOL)aggressiveEchoCancellationApplied
{
  return self->_aggressiveEchoCancellationApplied;
}

- (void)setInAttendingWindow:(BOOL)a3
{
  self->_inAttendingWindow = a3;
}

- (BOOL)inAttendingWindow
{
  return self->_inAttendingWindow;
}

- (void)setReadThisOrVoiceOverSessionActive:(BOOL)a3
{
  self->_readThisOrVoiceOverSessionActive = a3;
}

- (BOOL)readThisOrVoiceOverSessionActive
{
  return self->_readThisOrVoiceOverSessionActive;
}

- (void)setSiriStateClient:(id)a3
{
}

- (CSAttSiriAudioSessionStateClient)siriStateClient
{
  return self->_siriStateClient;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)_configureAggressiveEchoCancellationParams:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"remove";
    if (v3) {
      CFStringRef v6 = @"apply";
    }
    *(_DWORD *)buf = 136315394;
    v11 = "-[CSAggressiveECModeHandler _configureAggressiveEchoCancellationParams:]";
    __int16 v12 = 2112;
    CFStringRef v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s  %@ Aggressive EC params", buf, 0x16u);
  }
  if (CSIsIOS())
  {
    if (+[CSUtils isContinuousConversationSupported])
    {
      v7 = +[CSAVVoiceTriggerClientManager sharedVoiceTriggerClient];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100121AB0;
      v8[3] = &unk_100251F38;
      BOOL v9 = v3;
      v8[4] = self;
      [v7 setAggressiveECMode:v3 completionBlock:v8];
    }
  }
}

- (void)notifySiriSessionStateTTSOngoing:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100121D28;
  v4[3] = &unk_100253AB8;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

- (void)siriDismissed
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100121E80;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)setAudioSessionState:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100121FD0;
  v7[3] = &unk_100253B08;
  id v8 = v4;
  BOOL v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)setAttendingState:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10012244C;
  v4[3] = &unk_100253AB8;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

- (CSAggressiveECModeHandler)init
{
  v8.receiver = self;
  v8.super_class = (Class)CSAggressiveECModeHandler;
  v2 = [(CSAggressiveECModeHandler *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("AggressiveECModeHandler queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    *(_WORD *)&v2->_readThisOrVoiceOverSessionActive = 0;
    v2->_aggressiveEchoCancellationApplied = 0;
    v2->_echoCancellationReason = 0;
    BOOL v5 = [[CSAttSiriAudioSessionStateClient alloc] initWithDelegate:v2];
    siriStateClient = v2->_siriStateClient;
    v2->_siriStateClient = v5;
  }
  return v2;
}

@end