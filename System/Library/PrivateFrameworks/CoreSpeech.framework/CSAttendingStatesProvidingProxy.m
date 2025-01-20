@interface CSAttendingStatesProvidingProxy
- (CSAttSiriTTSPromptProtocol)ttsPromptUpdateReceivers;
- (CSAttSiriUIDismissProtocol)dismissUpdateReceivers;
- (CSAttendingHintProviding)hintProvider;
- (CSAttendingStatesProvidingProxy)init;
- (CSCarKitUtils)carKitUtils;
- (LBAttendingStatesServiceDelegate)remoteObjectProxy;
- (OS_dispatch_queue)queue;
- (void)addDismissUpdateReceiver:(id)a3;
- (void)addSiriPromptUpdateReceiver:(id)a3;
- (void)attendingStatesXPCDisconnected;
- (void)directActionJarvisAnnounceMessageTriggerWithDeviceId:(id)a3;
- (void)dismissAttending;
- (void)localAttendingStartedWithRootRequestId:(id)a3;
- (void)localAttendingStopped;
- (void)localAttendingStoppedUnexpectedlyWithError:(id)a3;
- (void)localAttendingWillStartWithRootRequestId:(id)a3;
- (void)registerAttendingHintProvider:(id)a3;
- (void)removeDismissUpdateReceiver:(id)a3;
- (void)removeSiriPromptUpdateReceiver:(id)a3;
- (void)requestDismissed;
- (void)setCarKitUtils:(id)a3;
- (void)setDismissUpdateReceivers:(id)a3;
- (void)setHintProvider:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemoteObjectProxy:(id)a3;
- (void)setTtsPromptUpdateReceivers:(id)a3;
- (void)siriDidPrompt;
- (void)siriDidPromptWithRootRequestId:(id)a3;
- (void)siriPromptWillStart;
- (void)siriPromptWillStartWithRootRequestId:(id)a3;
- (void)speechRecognizerReadyForNewTurnWithSpeechStartDetectedAtHostTime:(unint64_t)a3 audioRecordType:(int64_t)a4 audioRecordDeviceId:(id)a5;
- (void)speechStartDetectedWithHostTime:(unint64_t)a3 audioRecordType:(int64_t)a4 audioRecordDeviceId:(id)a5;
- (void)speechStartDetectedWithShouldDuckTTS:(BOOL)a3;
- (void)startUpdateStates;
@end

@implementation CSAttendingStatesProvidingProxy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carKitUtils, 0);
  objc_storeStrong((id *)&self->_ttsPromptUpdateReceivers, 0);
  objc_storeStrong((id *)&self->_dismissUpdateReceivers, 0);
  objc_destroyWeak((id *)&self->_hintProvider);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_remoteObjectProxy, 0);
}

- (void)setCarKitUtils:(id)a3
{
}

- (CSCarKitUtils)carKitUtils
{
  return self->_carKitUtils;
}

- (void)setTtsPromptUpdateReceivers:(id)a3
{
}

- (CSAttSiriTTSPromptProtocol)ttsPromptUpdateReceivers
{
  return self->_ttsPromptUpdateReceivers;
}

- (void)setDismissUpdateReceivers:(id)a3
{
}

- (CSAttSiriUIDismissProtocol)dismissUpdateReceivers
{
  return self->_dismissUpdateReceivers;
}

- (void)setHintProvider:(id)a3
{
}

- (CSAttendingHintProviding)hintProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hintProvider);
  return (CSAttendingHintProviding *)WeakRetained;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (LBAttendingStatesServiceDelegate)remoteObjectProxy
{
  return self->_remoteObjectProxy;
}

- (void)speechRecognizerReadyForNewTurnWithSpeechStartDetectedAtHostTime:(unint64_t)a3 audioRecordType:(int64_t)a4 audioRecordDeviceId:(id)a5
{
  id v8 = a5;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000778B4;
  v11[3] = &unk_100250C70;
  unint64_t v13 = a3;
  int64_t v14 = a4;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(queue, v11);
}

- (void)speechStartDetectedWithShouldDuckTTS:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100077940;
  v4[3] = &unk_100253AB8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)speechStartDetectedWithHostTime:(unint64_t)a3 audioRecordType:(int64_t)a4 audioRecordDeviceId:(id)a5
{
  id v8 = a5;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100077A00;
  v11[3] = &unk_100250C70;
  unint64_t v13 = a3;
  int64_t v14 = a4;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(queue, v11);
}

- (void)localAttendingStopped
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100077A88;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)localAttendingStoppedUnexpectedlyWithError:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100077B2C;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)localAttendingStartedWithRootRequestId:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100077BD0;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)localAttendingWillStartWithRootRequestId:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100077C74;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)requestDismissed
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100077CF4;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)dismissAttending
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100077E7C;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)directActionJarvisAnnounceMessageTriggerWithDeviceId:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSAttendingStatesProvidingProxy *)self carKitUtils];
  unsigned int v6 = [v5 isBargeInDisabledForConnectedVehicle];

  v7 = CSLogContextFacilityCoreSpeech;
  BOOL v8 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 136315138;
      int64_t v14 = "-[CSAttendingStatesProvidingProxy directActionJarvisAnnounceMessageTriggerWithDeviceId:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s not triggering because barge-in is disabled for this vehicle", buf, 0xCu);
    }
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 136315394;
      int64_t v14 = "-[CSAttendingStatesProvidingProxy directActionJarvisAnnounceMessageTriggerWithDeviceId:]";
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s deviceId=%@", buf, 0x16u);
    }
    queue = self->_queue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100078180;
    v10[3] = &unk_100253B08;
    id v11 = v4;
    id v12 = self;
    dispatch_async(queue, v10);
  }
}

- (void)siriDidPromptWithRootRequestId:(id)a3
{
  id v4 = a3;
  BOOL v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[CSAttendingStatesProvidingProxy siriDidPromptWithRootRequestId:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100078328;
  v8[3] = &unk_100253B08;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)siriPromptWillStartWithRootRequestId:(id)a3
{
  id v4 = a3;
  BOOL v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v9 = "-[CSAttendingStatesProvidingProxy siriPromptWillStartWithRootRequestId:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100078600;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)siriDidPrompt
{
}

- (void)siriPromptWillStart
{
}

- (void)startUpdateStates
{
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    id v4 = "-[CSAttendingStatesProvidingProxy startUpdateStates]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v3, 0xCu);
  }
}

- (void)attendingStatesXPCDisconnected
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007889C;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)registerAttendingHintProvider:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100078A90;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)removeSiriPromptUpdateReceiver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100078B34;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)addSiriPromptUpdateReceiver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100078BD8;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)removeDismissUpdateReceiver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100078C7C;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)addDismissUpdateReceiver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100078D20;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)setRemoteObjectProxy:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100078DC4;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (CSAttendingStatesProvidingProxy)init
{
  v12.receiver = self;
  v12.super_class = (Class)CSAttendingStatesProvidingProxy;
  v2 = [(CSAttendingStatesProvidingProxy *)&v12 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSIntuitiveConvRequestHandler queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = +[NSHashTable weakObjectsHashTable];
    dismissUpdateReceivers = v2->_dismissUpdateReceivers;
    v2->_dismissUpdateReceivers = (CSAttSiriUIDismissProtocol *)v5;

    uint64_t v7 = +[NSHashTable weakObjectsHashTable];
    ttsPromptUpdateReceivers = v2->_ttsPromptUpdateReceivers;
    v2->_ttsPromptUpdateReceivers = (CSAttSiriTTSPromptProtocol *)v7;

    uint64_t v9 = +[CSCarKitUtils sharedInstance];
    carKitUtils = v2->_carKitUtils;
    v2->_carKitUtils = (CSCarKitUtils *)v9;
  }
  return v2;
}

@end