@interface AFDiagnostics
+ (id)sharedDiagnostics;
- (AFDiagnostics)init;
- (AWDServerConnection)_serverConnection;
- (NSNumber)_connectionStartTime;
- (NSNumber)_voiceRecordingEndTime;
- (NSNumber)_voiceRecordingStartTime;
- (NSNumber)_voiceSendEndTime;
- (NSNumber)_voiceSendStartTime;
- (OS_dispatch_queue)_queue;
- (double)_currentTime;
- (unint64_t)_AWDTimestampTruncatedToHourPrecision;
- (unint64_t)_durationInMillisecondsFromTime:(double)a3 toTime:(double)a4;
- (void)_setConnectionStartTime:(id)a3;
- (void)_setVoiceRecordingEndTime:(id)a3;
- (void)_setVoiceRecordingStartTime:(id)a3;
- (void)_setVoiceSendEndTime:(id)a3;
- (void)_setVoiceSendStartTime:(id)a3;
- (void)_submitMetricWithIdentifier:(unsigned int)a3 generation:(id)a4;
- (void)_submitMetricWithIdentifier:(unsigned int)a3 hotShipIdentifier:(unsigned int)a4 hotShipTimestamp:(unint64_t)a5 generation:(id)a6;
- (void)flush;
- (void)logConnectionFailedWithError:(id)a3 connectionType:(int64_t)a4;
- (void)logConnectionOpenWithConnectionType:(int64_t)a3;
- (void)logConnectionStart;
- (void)logNetworkAnalyzeRunWithResults:(id)a3;
- (void)logSpeechRecognized;
- (void)logVoiceRecordingEnd;
- (void)logVoiceRecordingStart;
- (void)logVoiceSendEnd;
- (void)logVoiceSendStart;
@end

@implementation AFDiagnostics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceSendEndTime, 0);
  objc_storeStrong((id *)&self->_voiceSendStartTime, 0);
  objc_storeStrong((id *)&self->_voiceRecordingEndTime, 0);
  objc_storeStrong((id *)&self->_voiceRecordingStartTime, 0);
  objc_storeStrong((id *)&self->_connectionStartTime, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
}

- (void)_setVoiceSendEndTime:(id)a3
{
}

- (NSNumber)_voiceSendEndTime
{
  return self->_voiceSendEndTime;
}

- (void)_setVoiceSendStartTime:(id)a3
{
}

- (NSNumber)_voiceSendStartTime
{
  return self->_voiceSendStartTime;
}

- (void)_setVoiceRecordingEndTime:(id)a3
{
}

- (NSNumber)_voiceRecordingEndTime
{
  return self->_voiceRecordingEndTime;
}

- (void)_setVoiceRecordingStartTime:(id)a3
{
}

- (NSNumber)_voiceRecordingStartTime
{
  return self->_voiceRecordingStartTime;
}

- (void)_setConnectionStartTime:(id)a3
{
}

- (NSNumber)_connectionStartTime
{
  return self->_connectionStartTime;
}

- (OS_dispatch_queue)_queue
{
  return self->_queue;
}

- (unint64_t)_AWDTimestampTruncatedToHourPrecision
{
  v2 = [(AFDiagnostics *)self _serverConnection];
  unint64_t v3 = (unint64_t)[v2 getAWDTimestamp];

  return 3600000 * (v3 / 0x36EE80);
}

- (double)_currentTime
{
  v2 = +[NSProcessInfo processInfo];
  [v2 systemUptime];
  double v4 = v3;

  return v4;
}

- (void)_submitMetricWithIdentifier:(unsigned int)a3 hotShipIdentifier:(unsigned int)a4 hotShipTimestamp:(unint64_t)a5 generation:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  id v10 = a6;
  [(AFDiagnostics *)self _submitMetricWithIdentifier:v8 generation:v10];
  if (v7)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100219024;
    v11[3] = &unk_100507250;
    int v14 = v7;
    id v12 = v10;
    unint64_t v13 = a5;
    [(AFDiagnostics *)self _submitMetricWithIdentifier:v7 generation:v11];
  }
}

- (void)_submitMetricWithIdentifier:(unsigned int)a3 generation:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v6 = (void (**)(void))a4;
  if (v6)
  {
    uint64_t v7 = [(AFDiagnostics *)self _serverConnection];
    id v8 = [v7 newMetricContainerWithIdentifier:v4];
    if (v8)
    {
      v9 = v6[2](v6);
      [v8 setMetric:v9];
      if (([v7 submitMetric:v8] & 1) == 0)
      {
        id v10 = AFSiriLogContextAnalysis;
        if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_ERROR))
        {
          int v11 = 136315394;
          id v12 = "-[AFDiagnostics _submitMetricWithIdentifier:generation:]";
          __int16 v13 = 2048;
          uint64_t v14 = v4;
          _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Unable to submit AWD metric 0x%lx", (uint8_t *)&v11, 0x16u);
        }
      }
    }
  }
}

- (AWDServerConnection)_serverConnection
{
  return self->_serverConnection;
}

- (unint64_t)_durationInMillisecondsFromTime:(double)a3 toTime:(double)a4
{
  if (a4 <= a3) {
    return 0;
  }
  else {
    return (unint64_t)((a4 - a3) * 1000.0);
  }
}

- (void)logSpeechRecognized
{
  double v3 = AFSiriLogContextAnalysis;
  if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v10 = "-[AFDiagnostics logSpeechRecognized]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  unint64_t v4 = [(AFDiagnostics *)self _AWDTimestampTruncatedToHourPrecision];
  [(AFDiagnostics *)self _currentTime];
  uint64_t v6 = v5;
  uint64_t v7 = [(AFDiagnostics *)self _queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002193F0;
  block[3] = &unk_10050C7F0;
  block[4] = self;
  block[5] = v4;
  block[6] = v6;
  dispatch_async(v7, block);
}

- (void)logNetworkAnalyzeRunWithResults:(id)a3
{
  id v4 = a3;
  uint64_t v5 = AFSiriLogContextAnalysis;
  if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v13 = "-[AFDiagnostics logNetworkAnalyzeRunWithResults:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  unint64_t v6 = [(AFDiagnostics *)self _AWDTimestampTruncatedToHourPrecision];
  uint64_t v7 = [(AFDiagnostics *)self _queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100219778;
  block[3] = &unk_10050E278;
  id v10 = v4;
  unint64_t v11 = v6;
  block[4] = self;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)logVoiceSendEnd
{
  double v3 = AFSiriLogContextAnalysis;
  if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v10 = "-[AFDiagnostics logVoiceSendEnd]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  unint64_t v4 = [(AFDiagnostics *)self _AWDTimestampTruncatedToHourPrecision];
  [(AFDiagnostics *)self _currentTime];
  uint64_t v6 = v5;
  uint64_t v7 = [(AFDiagnostics *)self _queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100219964;
  block[3] = &unk_10050C7F0;
  block[4] = self;
  void block[5] = v6;
  block[6] = v4;
  dispatch_async(v7, block);
}

- (void)logVoiceSendStart
{
  double v3 = AFSiriLogContextAnalysis;
  if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v10 = "-[AFDiagnostics logVoiceSendStart]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  unint64_t v4 = [(AFDiagnostics *)self _AWDTimestampTruncatedToHourPrecision];
  [(AFDiagnostics *)self _currentTime];
  uint64_t v6 = v5;
  uint64_t v7 = [(AFDiagnostics *)self _queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100219C8C;
  block[3] = &unk_10050C7F0;
  block[4] = self;
  void block[5] = v6;
  block[6] = v4;
  dispatch_async(v7, block);
}

- (void)logVoiceRecordingEnd
{
  double v3 = AFSiriLogContextAnalysis;
  if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v10 = "-[AFDiagnostics logVoiceRecordingEnd]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  unint64_t v4 = [(AFDiagnostics *)self _AWDTimestampTruncatedToHourPrecision];
  [(AFDiagnostics *)self _currentTime];
  uint64_t v6 = v5;
  uint64_t v7 = [(AFDiagnostics *)self _queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100219E88;
  block[3] = &unk_10050C7F0;
  block[4] = self;
  void block[5] = v6;
  block[6] = v4;
  dispatch_async(v7, block);
}

- (void)logVoiceRecordingStart
{
  double v3 = AFSiriLogContextAnalysis;
  if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v10 = "-[AFDiagnostics logVoiceRecordingStart]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  unint64_t v4 = [(AFDiagnostics *)self _AWDTimestampTruncatedToHourPrecision];
  [(AFDiagnostics *)self _currentTime];
  uint64_t v6 = v5;
  uint64_t v7 = [(AFDiagnostics *)self _queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10021A1B0;
  block[3] = &unk_10050C7F0;
  block[4] = self;
  void block[5] = v6;
  block[6] = v4;
  dispatch_async(v7, block);
}

- (void)logConnectionFailedWithError:(id)a3 connectionType:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = AFSiriLogContextAnalysis;
  if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[AFDiagnostics logConnectionFailedWithError:connectionType:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  unint64_t v8 = [(AFDiagnostics *)self _AWDTimestampTruncatedToHourPrecision];
  v9 = [(AFDiagnostics *)self _queue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10021A3C0;
  v11[3] = &unk_10050D3C8;
  void v11[4] = self;
  id v12 = v6;
  unint64_t v13 = v8;
  int64_t v14 = a4;
  id v10 = v6;
  dispatch_async(v9, v11);
}

- (void)logConnectionOpenWithConnectionType:(int64_t)a3
{
  uint64_t v5 = AFSiriLogContextAnalysis;
  if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "-[AFDiagnostics logConnectionOpenWithConnectionType:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  unint64_t v6 = [(AFDiagnostics *)self _AWDTimestampTruncatedToHourPrecision];
  [(AFDiagnostics *)self _currentTime];
  uint64_t v8 = v7;
  v9 = [(AFDiagnostics *)self _queue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10021A644;
  v10[3] = &unk_1005070E0;
  v10[4] = self;
  v10[5] = v6;
  v10[6] = a3;
  v10[7] = v8;
  dispatch_async(v9, v10);
}

- (void)logConnectionStart
{
  double v3 = AFSiriLogContextAnalysis;
  if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v10 = "-[AFDiagnostics logConnectionStart]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  unint64_t v4 = [(AFDiagnostics *)self _AWDTimestampTruncatedToHourPrecision];
  [(AFDiagnostics *)self _currentTime];
  uint64_t v6 = v5;
  uint64_t v7 = [(AFDiagnostics *)self _queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10021A93C;
  block[3] = &unk_10050C7F0;
  block[4] = self;
  void block[5] = v6;
  block[6] = v4;
  dispatch_async(v7, block);
}

- (void)flush
{
  v2 = [(AFDiagnostics *)self _queue];
  dispatch_sync(v2, &stru_100507050);
}

- (AFDiagnostics)init
{
  v11.receiver = self;
  v11.super_class = (Class)AFDiagnostics;
  v2 = [(AFDiagnostics *)&v11 init];
  if (v2)
  {
    double v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    unint64_t v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v5 = dispatch_queue_create("Siri diagnostics queue", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10021AB48;
    block[3] = &unk_10050E138;
    id v10 = v2;
    dispatch_async(v7, block);
  }
  return v2;
}

+ (id)sharedDiagnostics
{
  if (qword_100585F00 != -1) {
    dispatch_once(&qword_100585F00, &stru_100507030);
  }
  v2 = (void *)qword_100585EF8;
  return v2;
}

@end