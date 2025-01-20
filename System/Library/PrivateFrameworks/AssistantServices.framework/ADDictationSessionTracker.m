@interface ADDictationSessionTracker
- (ADDictationSessionTracker)init;
- (id)_sessionWithUUID:(id)a3;
- (id)_startedOrStartingSession;
- (id)startSessionForReason:(id)a3 languageCode:(id)a4 options:(id)a5 speechRequestOptions:(id)a6;
- (void)_addSession:(id)a3;
- (void)_beginAudioFileIOTransactionForReason:(id)a3 session:(id)a4;
- (void)_beginSpeechRecognitionTransactionForReason:(id)a3 session:(id)a4;
- (void)_endAudioFileIOTransactionForReason:(id)a3 session:(id)a4;
- (void)_endSessionTransactionForReason:(id)a3 session:(id)a4 isSpeechTransaction:(BOOL)a5;
- (void)_endSpeechRecognitionTransactionForReason:(id)a3 session:(id)a4;
- (void)_removeSession:(id)a3;
- (void)notifyAudioFileIOTransactionStoppedForReason:(id)a3 sessionUUID:(id)a4;
- (void)notifySpeechRecognitionTransactionStoppedForReason:(id)a3 sessionUUID:(id)a4;
- (void)stopSessionForReason:(id)a3;
@end

@implementation ADDictationSessionTracker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_activeSessionsByUUID, 0);
  objc_storeStrong((id *)&self->_activeSessions, 0);
}

- (void)_endAudioFileIOTransactionForReason:(id)a3 session:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    v10 = [v7 uuid];
    *(_DWORD *)buf = 136315394;
    v14 = "-[ADDictationSessionTracker _endAudioFileIOTransactionForReason:session:]";
    __int16 v15 = 2112;
    v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s sessionUUID = %@", buf, 0x16u);
  }
  v11 = [v7 speechRequestOptions];
  id v12 = [v11 audioFileType];

  if (v12)
  {
    if (![v7 audioFileIOTransactionState]) {
      +[NSException raise:NSInternalInconsistencyException, @"Trying to end a dictation audio file transaction (reason: %@), but the transaction state is stopped", v6 format];
    }
    [(ADDictationSessionTracker *)self _endSessionTransactionForReason:v6 session:v7 isSpeechTransaction:0];
  }
}

- (void)_endSpeechRecognitionTransactionForReason:(id)a3 session:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    v10 = [v7 uuid];
    *(_DWORD *)buf = 136315394;
    id v12 = "-[ADDictationSessionTracker _endSpeechRecognitionTransactionForReason:session:]";
    __int16 v13 = 2112;
    v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s sessionUUID = %@", buf, 0x16u);
  }
  if (![v7 speechRecognitionTransactionState]) {
    +[NSException raise:NSInternalInconsistencyException, @"Trying to end a dictation transcription transaction (reason: %@), but the transaction state is stopped", v6 format];
  }
  [(ADDictationSessionTracker *)self _endSessionTransactionForReason:v6 session:v7 isSpeechTransaction:1];
}

- (void)_endSessionTransactionForReason:(id)a3 session:(id)a4 isSpeechTransaction:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    id v12 = "-[ADDictationSessionTracker _endSessionTransactionForReason:session:isSpeechTransaction:]";
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Ending dictation transcription XPC transaction because %@", (uint8_t *)&v11, 0x16u);
  }
  if (v5) {
    [v9 _setSpeechRecognitionTransactionState:0];
  }
  else {
    [v9 _setAudioFileIOTransactionState:0];
  }
  if (![v9 speechRecognitionTransactionState] && !objc_msgSend(v9, "audioFileIOTransactionState")) {
    [(ADDictationSessionTracker *)self _removeSession:v9];
  }
}

- (void)_beginAudioFileIOTransactionForReason:(id)a3 session:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v9 = v8;
    v10 = [v7 uuid];
    *(_DWORD *)buf = 136315394;
    v18 = "-[ADDictationSessionTracker _beginAudioFileIOTransactionForReason:session:]";
    __int16 v19 = 2112;
    id v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s sessionUUID = %@", buf, 0x16u);
  }
  int v11 = [v7 speechRequestOptions];
  id v12 = [v11 audioFileType];

  if (v12)
  {
    __int16 v13 = sub_1002E8948(self->_activeSessions, &stru_10050B290);
    id v14 = [v13 count];
    if ((unint64_t)v14 >= 2) {
      +[NSException raise:NSInternalInconsistencyException, @"Trying to begin a dictation audio file transaction (reason: %@), but found %tu active session(s).", v6, v14 format];
    }
    id v15 = [v7 audioFileIOTransactionState];
    if (v15) {
      +[NSException raise:NSInternalInconsistencyException, @"Trying to begin a dictation audio file transaction (reason: %@), but the transaction state is %ld.", v6, v15 format];
    }
    v16 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[ADDictationSessionTracker _beginAudioFileIOTransactionForReason:session:]";
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Beginning dictation audio file XPC transaction because %@", buf, 0x16u);
    }
    [v7 _setAudioFileIOTransactionState:1];
  }
}

- (void)_beginSpeechRecognitionTransactionForReason:(id)a3 session:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v9 = v8;
    v10 = [v7 uuid];
    *(_DWORD *)buf = 136315394;
    v16 = "-[ADDictationSessionTracker _beginSpeechRecognitionTransactionForReason:session:]";
    __int16 v17 = 2112;
    id v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s sessionUUID = %@", buf, 0x16u);
  }
  int v11 = sub_1002E8948(self->_activeSessions, &stru_10050B290);
  id v12 = [v11 count];
  if ((unint64_t)v12 >= 2) {
    +[NSException raise:NSInternalInconsistencyException, @"Trying to begin a dictation transcription transaction (reason: %@), but found %tu active session(s).", v6, v12 format];
  }
  id v13 = [v7 speechRecognitionTransactionState];
  if (v13) {
    +[NSException raise:NSInternalInconsistencyException, @"Trying to begin a dictation transcription transaction (reason: %@), but the transaction state is %zd.", v6, v13 format];
  }
  id v14 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[ADDictationSessionTracker _beginSpeechRecognitionTransactionForReason:session:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Beginning dictation transcription XPC transaction because %@", buf, 0x16u);
  }
  [v7 _setSpeechRecognitionTransactionState:1];
}

- (id)_sessionWithUUID:(id)a3
{
  return [(NSMutableDictionary *)self->_activeSessionsByUUID objectForKey:a3];
}

- (id)_startedOrStartingSession
{
  v2 = sub_1002E8948(self->_activeSessions, &stru_10050B290);
  id v3 = [v2 count];
  if ((unint64_t)v3 >= 2) {
    +[NSException raise:NSInternalInconsistencyException, @"Trying to retrieve the active session, but found %tu active sessions.", v3 format];
  }
  v4 = [v2 firstObject];

  return v4;
}

- (void)_removeSession:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    id v7 = [v4 uuid];
    int v10 = 136315394;
    int v11 = "-[ADDictationSessionTracker _removeSession:]";
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Deactivating dictation session with sessionUUID = %@", (uint8_t *)&v10, 0x16u);
  }
  [(NSMutableArray *)self->_activeSessions removeObject:v4];
  activeSessionsByUUID = self->_activeSessionsByUUID;
  id v9 = [v4 uuid];
  [(NSMutableDictionary *)activeSessionsByUUID removeObjectForKey:v9];
}

- (void)_addSession:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    id v7 = [v4 uuid];
    int v10 = 136315394;
    int v11 = "-[ADDictationSessionTracker _addSession:]";
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Activating dictation session with sessionUUID = %@", (uint8_t *)&v10, 0x16u);
  }
  [(NSMutableArray *)self->_activeSessions addObject:v4];
  activeSessionsByUUID = self->_activeSessionsByUUID;
  id v9 = [v4 uuid];
  [(NSMutableDictionary *)activeSessionsByUUID setObject:v4 forKey:v9];
}

- (void)notifyAudioFileIOTransactionStoppedForReason:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = sub_10019E130;
  v16[4] = sub_10019E140;
  id v17 = (id)os_transaction_create();
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10019E148;
  v11[3] = &unk_1005072F0;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v15 = v16;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, v11);

  _Block_object_dispose(v16, 8);
}

- (void)notifySpeechRecognitionTransactionStoppedForReason:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = sub_10019E130;
  v16[4] = sub_10019E140;
  id v17 = (id)os_transaction_create();
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10019E44C;
  v11[3] = &unk_1005072F0;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v15 = v16;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, v11);

  _Block_object_dispose(v16, 8);
}

- (void)stopSessionForReason:(id)a3
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = sub_10019E130;
  v6[4] = sub_10019E140;
  id v7 = (id)os_transaction_create();
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10019E6FC;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = v6;
  dispatch_async(queue, v5);
  _Block_object_dispose(v6, 8);
}

- (id)startSessionForReason:(id)a3 languageCode:(id)a4 options:(id)a5 speechRequestOptions:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = mach_absolute_time();
  id v15 = +[NSUUID UUID];
  v16 = [v15 UUIDString];

  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = sub_10019E130;
  v35[4] = sub_10019E140;
  id v36 = (id)os_transaction_create();
  queue = self->_queue;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10019EA78;
  v26[3] = &unk_100504E10;
  id v18 = v16;
  id v27 = v18;
  id v28 = v11;
  id v29 = v12;
  id v30 = v13;
  v31 = self;
  id v32 = v10;
  v33 = v35;
  uint64_t v34 = v14;
  id v19 = v10;
  id v20 = v13;
  id v21 = v12;
  id v22 = v11;
  dispatch_async(queue, v26);
  v23 = v32;
  id v24 = v18;

  _Block_object_dispose(v35, 8);
  return v24;
}

- (ADDictationSessionTracker)init
{
  v12.receiver = self;
  v12.super_class = (Class)ADDictationSessionTracker;
  v2 = [(ADDictationSessionTracker *)&v12 init];
  if (v2)
  {
    id v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    activeSessions = v2->_activeSessions;
    v2->_activeSessions = v3;

    BOOL v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    activeSessionsByUUID = v2->_activeSessionsByUUID;
    v2->_activeSessionsByUUID = v5;

    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.assistantd.dictation.session-controller", v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;
  }
  return v2;
}

@end