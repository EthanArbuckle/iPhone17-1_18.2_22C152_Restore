@interface SHAudioManager
+ (id)sharedInstance;
- (BOOL)recorder:(id)a3 shouldProcessAudioBuffer:(id)a4 atTime:(id)a5;
- (NSLock)recordingLogsLock;
- (NSMutableDictionary)recordingLogs;
- (SHAudioManager)initWithAudioSessionManager:(id)a3 audioRecordingManager:(id)a4;
- (SHAudioRecordingManager)audioRecordingManager;
- (SHAudioSessionManager)audioSessionManager;
- (int64_t)activeAssistantServiceTaps;
- (void)audioRecordingManager:(id)a3 didDetachTap:(id)a4;
- (void)audioRecordingManager:(id)a3 failedToStartRecorders:(id)a4;
- (void)audioRecordingManager:(id)a3 willAttachTap:(id)a4;
- (void)audioRecordingManagerDidStopRecording:(id)a3;
- (void)audioRecordingManagerWillStartRecording:(id)a3;
- (void)audioSessionManager:(id)a3 interruptionBeganWithOptions:(unint64_t)a4;
- (void)audioSessionManager:(id)a3 interruptionEndedWithOptions:(unint64_t)a4;
- (void)mediaServicesWereReset;
- (void)recorder:(id)a3 failedToStartWithError:(id)a4;
- (void)resetRecordingLog;
@end

@implementation SHAudioManager

- (SHAudioManager)initWithAudioSessionManager:(id)a3 audioRecordingManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SHAudioManager;
  v9 = [(SHAudioManager *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_audioSessionManager, a3);
    [(SHAudioSessionManager *)v10->_audioSessionManager setDelegate:v10];
    objc_storeStrong((id *)&v10->_audioRecordingManager, a4);
    [(SHAudioRecordingManager *)v10->_audioRecordingManager setDelegate:v10];
    uint64_t v11 = +[NSMutableDictionary dictionary];
    recordingLogs = v10->_recordingLogs;
    v10->_recordingLogs = (NSMutableDictionary *)v11;

    v13 = (NSLock *)objc_alloc_init((Class)NSLock);
    recordingLogsLock = v10->_recordingLogsLock;
    v10->_recordingLogsLock = v13;
  }
  return v10;
}

+ (id)sharedInstance
{
  if (qword_100090A48 != -1) {
    dispatch_once(&qword_100090A48, &stru_1000750C8);
  }
  v2 = (void *)qword_100090A40;

  return v2;
}

- (void)mediaServicesWereReset
{
  v3 = [(SHAudioManager *)self audioRecordingManager];
  [v3 stopRecordingForReason:6];

  v4 = [(SHAudioManager *)self audioRecordingManager];
  unsigned int v5 = [v4 hasActiveTaps];

  if (v5)
  {
    id v6 = [(SHAudioManager *)self audioRecordingManager];
    [v6 startRecording];
  }
}

- (void)audioSessionManager:(id)a3 interruptionBeganWithOptions:(unint64_t)a4
{
  id v4 = [(SHAudioManager *)self audioRecordingManager];
  [v4 stopRecordingForReason:4];
}

- (void)audioSessionManager:(id)a3 interruptionEndedWithOptions:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  if ((v4 & 1) != 0
    && ([(SHAudioManager *)self audioRecordingManager],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v8 = [v7 hasActiveTaps],
        v7,
        (v8 & 1) != 0))
  {
    v9 = sh_log_object();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Resuming recording after interruption", v12, 2u);
    }

    v10 = [(SHAudioManager *)self audioRecordingManager];
    [v10 startRecording];
  }
  else
  {
    uint64_t v11 = sh_log_object();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Audio interruption ended but recording should not restart", buf, 2u);
    }

    v10 = [(SHAudioManager *)self audioRecordingManager];
    [v10 stopRecordingForReason:5];
  }
}

- (BOOL)recorder:(id)a3 shouldProcessAudioBuffer:(id)a4 atTime:(id)a5
{
  unsigned int v5 = [(SHAudioManager *)self audioSessionManager];
  unsigned __int8 v6 = [v5 isAudioSessionInterrupted];

  return v6 ^ 1;
}

- (void)recorder:(id)a3 failedToStartWithError:(id)a4
{
  unsigned int v5 = [(SHAudioManager *)self audioSessionManager];
  [v5 deactivateAudioSession];

  id v6 = [(SHAudioManager *)self audioSessionManager];
  [v6 activateAudioSessionForClient:2];
}

- (void)audioRecordingManager:(id)a3 failedToStartRecorders:(id)a4
{
  id v4 = [(SHAudioManager *)self audioRecordingManager];
  [v4 stopRecordingForReason:3];
}

- (void)audioRecordingManager:(id)a3 willAttachTap:(id)a4
{
  id v5 = a4;
  id v6 = [(SHAudioManager *)self recordingLogsLock];
  [v6 lock];

  id v7 = [(SHAudioManager *)self recordingLogs];
  unsigned __int8 v8 = [v5 bundleIdentifier];
  v9 = [v7 objectForKey:v8];

  if (!v9)
  {
    v10 = [SHRecordingLog alloc];
    uint64_t v11 = [v5 bundleIdentifier];
    v9 = [(SHRecordingLog *)v10 initWithBundleID:v11];

    v12 = [(SHAudioManager *)self recordingLogs];
    v13 = [v5 bundleIdentifier];
    [v12 setObject:v9 forKey:v13];
  }
  -[SHRecordingLog attachedTapForClient:](v9, "attachedTapForClient:", [v5 client]);
  v14 = [(SHAudioManager *)self recordingLogsLock];
  [v14 unlock];

  v15 = sh_log_object();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 134217984;
    int64_t v17 = [(SHAudioManager *)self activeAssistantServiceTaps];
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "willAttachTap: number of assistant taps %li", (uint8_t *)&v16, 0xCu);
  }
}

- (void)audioRecordingManager:(id)a3 didDetachTap:(id)a4
{
  id v5 = a4;
  id v6 = [(SHAudioManager *)self recordingLogsLock];
  [v6 lock];

  id v7 = [(SHAudioManager *)self recordingLogs];
  unsigned __int8 v8 = [v5 bundleIdentifier];
  v9 = [v7 objectForKey:v8];

  id v10 = [v5 client];
  [v9 detachedTapForClient:v10];
  uint64_t v11 = [(SHAudioManager *)self recordingLogsLock];
  [v11 unlock];

  v12 = sh_log_object();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134217984;
    int64_t v14 = [(SHAudioManager *)self activeAssistantServiceTaps];
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "didDetachTap: number of assistant taps %li", (uint8_t *)&v13, 0xCu);
  }
}

- (void)audioRecordingManagerWillStartRecording:(id)a3
{
  id v4 = sh_log_object();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    int64_t v8 = [(SHAudioManager *)self activeAssistantServiceTaps];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "audioRecordingManagerWillStartRecording - number of assistant taps %li", (uint8_t *)&v7, 0xCu);
  }

  id v5 = [(SHAudioManager *)self audioSessionManager];
  if ([(SHAudioManager *)self activeAssistantServiceTaps] < 1) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  [v5 activateAudioSessionForClient:v6];
}

- (void)audioRecordingManagerDidStopRecording:(id)a3
{
  id v4 = sh_log_object();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "audioRecordingManagerDidStopRecording", v8, 2u);
  }

  id v5 = [(SHAudioManager *)self audioSessionManager];
  unsigned __int8 v6 = [v5 isAudioSessionInterrupted];

  if ((v6 & 1) == 0)
  {
    int v7 = [(SHAudioManager *)self audioSessionManager];
    [v7 deactivateAudioSession];
  }
}

- (void)resetRecordingLog
{
  v3 = [(SHAudioManager *)self recordingLogsLock];
  [v3 lock];

  id v4 = +[NSMutableDictionary dictionary];
  recordingLogs = self->_recordingLogs;
  self->_recordingLogs = v4;

  id v6 = [(SHAudioManager *)self recordingLogsLock];
  [v6 unlock];
}

- (int64_t)activeAssistantServiceTaps
{
  v3 = [(SHAudioManager *)self recordingLogsLock];
  [v3 lock];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(SHAudioManager *)self recordingLogs];
  id v5 = [v4 allValues];

  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    int64_t v8 = 0;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        v8 += (int64_t)[*(id *)(*((void *)&v13 + 1) + 8 * i) assistantTapCount];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  else
  {
    int64_t v8 = 0;
  }

  uint64_t v11 = [(SHAudioManager *)self recordingLogsLock];
  [v11 unlock];

  return v8;
}

- (SHAudioRecordingManager)audioRecordingManager
{
  return self->_audioRecordingManager;
}

- (SHAudioSessionManager)audioSessionManager
{
  return self->_audioSessionManager;
}

- (NSMutableDictionary)recordingLogs
{
  return self->_recordingLogs;
}

- (NSLock)recordingLogsLock
{
  return self->_recordingLogsLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordingLogsLock, 0);
  objc_storeStrong((id *)&self->_recordingLogs, 0);
  objc_storeStrong((id *)&self->_audioSessionManager, 0);

  objc_storeStrong((id *)&self->_audioRecordingManager, 0);
}

@end