id sub_100003664(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t vars8;

  v2 = *(void *)(a1 + 32);
  if (v2)
  {
    v3 = (*(void (**)(void))(v2 + 16))();
  }
  else
  {
    v3 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    [v3 setTimestamp:*(void *)(a1 + 40)];
  }
  else
  {
    v4 = AFSiriLogContextAnalysis;
    if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_ERROR))
    {
      v6 = *(unsigned int *)(a1 + 48);
      v7 = 136315394;
      v8 = "-[AFDiagnostics _submitMetricWithIdentifier:hotShipIdentifier:hotShipTimestamp:generation:]_block_invoke";
      v9 = 2048;
      v10 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s Hot-ship metric 0x%lx does not respond to -setTimestamp:. Will not set timestamp.", (uint8_t *)&v7, 0x16u);
    }
  }
  return v3;
}

id sub_100003A30(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100003AC0;
  v4[3] = &unk_10000C698;
  v4[4] = v2;
  v4[5] = a1[6];
  return [v2 _submitMetricWithIdentifier:1769481 hotShipIdentifier:1769490 hotShipTimestamp:v1 generation:v4];
}

id sub_100003AC0(uint64_t a1)
{
  v2 = objc_opt_new();
  v3 = [*(id *)(a1 + 32) _voiceRecordingEndTime];
  v4 = v3;
  if (v3)
  {
    [v3 doubleValue];
    objc_msgSend(v2, "setDurationFromVoiceRecordingEnd:", objc_msgSend(*(id *)(a1 + 32), "_durationInMillisecondsFromTime:toTime:"));
  }
  else
  {
    v5 = AFSiriLogContextAnalysis;
    if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      v11 = "-[AFDiagnostics logSpeechRecognized]_block_invoke_2";
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s Received -logSpeechRecognized with no corresponding -logVoiceRecordingEnd. Unable to determine duration since voice recording completed.", (uint8_t *)&v10, 0xCu);
    }
  }
  v6 = [*(id *)(a1 + 32) _voiceSendEndTime];
  v7 = v6;
  if (v6)
  {
    [v6 doubleValue];
    objc_msgSend(v2, "setDurationFromVoiceSendEnd:", objc_msgSend(*(id *)(a1 + 32), "_durationInMillisecondsFromTime:toTime:"));
  }
  else
  {
    v8 = AFSiriLogContextAnalysis;
    if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      v11 = "-[AFDiagnostics logSpeechRecognized]_block_invoke";
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Received -logSpeechRecognized with no corresponding -logVoiceSendEnd. Unable to determine duration since voice send completed.", (uint8_t *)&v10, 0xCu);
    }
  }

  return v2;
}

void sub_100003DB8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100003E5C;
  v3[3] = &unk_10000C648;
  v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  [v2 _submitMetricWithIdentifier:1769480 hotShipIdentifier:1769489 hotShipTimestamp:v1 generation:v3];
}

id sub_100003E5C(uint64_t a1)
{
  return [*(id *)(a1 + 32) metricValue];
}

id sub_100003FA4(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = +[NSNumber numberWithDouble:*(double *)(a1 + 40)];
  [v2 _setVoiceSendEndTime:v3];

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004074;
  v7[3] = &unk_10000C620;
  v7[4] = v4;
  v7[5] = *(void *)(a1 + 40);
  return [v4 _submitMetricWithIdentifier:1769477 hotShipIdentifier:1769486 hotShipTimestamp:v5 generation:v7];
}

id sub_100004074(uint64_t a1)
{
  v2 = objc_opt_new();
  v3 = [*(id *)(a1 + 32) _voiceSendStartTime];
  id v4 = v3;
  if (v3)
  {
    [v3 doubleValue];
    objc_msgSend(v2, "setDuration:", objc_msgSend(*(id *)(a1 + 32), "_durationInMillisecondsFromTime:toTime:"));
  }
  else
  {
    uint64_t v5 = AFSiriLogContextAnalysis;
    if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      v8 = "-[AFDiagnostics logVoiceSendEnd]_block_invoke_2";
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s Received -logVoiceSendEnd with no corresponding -logVoiceSendStart. Unable to determine how long voice transfer lasted.", (uint8_t *)&v7, 0xCu);
    }
  }

  return v2;
}

id sub_1000042CC(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = +[NSNumber numberWithDouble:*(double *)(a1 + 40)];
  [v2 _setVoiceSendStartTime:v3];

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  return [v4 _submitMetricWithIdentifier:1769476 hotShipIdentifier:1769485 hotShipTimestamp:v5 generation:&stru_10000C5F8];
}

AWDSiriVoiceSendStart *__cdecl sub_100004358(id a1)
{
  uint64_t v1 = objc_opt_new();
  return (AWDSiriVoiceSendStart *)v1;
}

id sub_1000044C8(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = +[NSNumber numberWithDouble:*(double *)(a1 + 40)];
  [v2 _setVoiceRecordingEndTime:v3];

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004598;
  v7[3] = &unk_10000C5B8;
  v7[4] = v4;
  v7[5] = *(void *)(a1 + 40);
  return [v4 _submitMetricWithIdentifier:1769475 hotShipIdentifier:1769484 hotShipTimestamp:v5 generation:v7];
}

id sub_100004598(uint64_t a1)
{
  v2 = objc_opt_new();
  v3 = [*(id *)(a1 + 32) _voiceRecordingStartTime];
  id v4 = v3;
  if (v3)
  {
    [v3 doubleValue];
    objc_msgSend(v2, "setDuration:", objc_msgSend(*(id *)(a1 + 32), "_durationInMillisecondsFromTime:toTime:"));
  }
  else
  {
    uint64_t v5 = AFSiriLogContextAnalysis;
    if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      v8 = "-[AFDiagnostics logVoiceRecordingEnd]_block_invoke_2";
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s Received -logVoiceRecordingEnd with no corresponding -logVoiceRecordingStart. Unable to determine how long voice recording lasted.", (uint8_t *)&v7, 0xCu);
    }
  }

  return v2;
}

id sub_1000047F0(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = +[NSNumber numberWithDouble:*(double *)(a1 + 40)];
  [v2 _setVoiceRecordingStartTime:v3];

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  return [v4 _submitMetricWithIdentifier:1769474 hotShipIdentifier:1769483 hotShipTimestamp:v5 generation:&stru_10000C590];
}

AWDSiriVoiceRecordingStart *__cdecl sub_10000487C(id a1)
{
  uint64_t v1 = objc_opt_new();
  return (AWDSiriVoiceRecordingStart *)v1;
}

void sub_100004A00(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100004AB4;
  v6[3] = &unk_10000C528;
  v3 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 _submitMetricWithIdentifier:1769479 hotShipIdentifier:1769488 hotShipTimestamp:v2 generation:v6];
}

id sub_100004AB4(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  v3 = [*(id *)(a1 + 32) domain];
  [v2 setErrorDomain:v3];

  objc_msgSend(v2, "setErrorCode:", objc_msgSend(*(id *)(a1 + 32), "code"));
  [v2 setConnectionType:*(unsigned int *)(a1 + 40)];
  return v2;
}

id sub_100004C84(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100004D1C;
  v5[3] = &unk_10000C4D8;
  uint64_t v3 = a1[6];
  v5[4] = v2;
  v5[5] = v3;
  v5[6] = a1[7];
  return [v2 _submitMetricWithIdentifier:1769478 hotShipIdentifier:1769487 hotShipTimestamp:v1 generation:v5];
}

id sub_100004D1C(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  [v2 setConnectionType:*(unsigned int *)(a1 + 40)];
  uint64_t v3 = [*(id *)(a1 + 32) _connectionStartTime];
  id v4 = v3;
  if (v3)
  {
    [v3 doubleValue];
    objc_msgSend(v2, "setDuration:", objc_msgSend(*(id *)(a1 + 32), "_durationInMillisecondsFromTime:toTime:"));
  }
  else
  {
    uint64_t v5 = AFSiriLogContextAnalysis;
    if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      uint64_t v8 = "-[AFDiagnostics logConnectionOpenWithConnectionType:]_block_invoke_2";
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s Received -logConnectionOpenWithConnectionType: with no corresponding -logConnectionStart. Unable to determine how long it took to open the connection.", (uint8_t *)&v7, 0xCu);
    }
  }

  return v2;
}

id sub_100004F7C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = +[NSNumber numberWithDouble:*(double *)(a1 + 40)];
  [v2 _setConnectionStartTime:v3];

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  return [v4 _submitMetricWithIdentifier:1769473 hotShipIdentifier:1769482 hotShipTimestamp:v5 generation:&stru_10000C4B0];
}

AWDSiriServerConnectionStart *__cdecl sub_100005004(id a1)
{
  uint64_t v1 = objc_opt_new();
  return (AWDSiriServerConnectionStart *)v1;
}

uint64_t sub_100005188(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 8) = [objc_alloc((Class)AWDServerConnection) initWithComponentId:27 andBlockOnConfiguration:0];
  return _objc_release_x1();
}

void sub_100005230(id a1)
{
  qword_100010AD8 = objc_alloc_init(AFDiagnostics);
  _objc_release_x1();
}

void sub_100005830(void *a1)
{
  uint64_t v1 = a1;
  [@"com.apple.siri.analyzer" UTF8String];
  uint64_t v2 = (void *)xpc_connection_copy_entitlement_value();
  uint64_t v3 = v2;
  if (v2 && xpc_BOOL_get_value(v2))
  {
    id v4 = AFSiriLogContextAnalysis;
    if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      int v10 = "_XPCMainConnectionHandler";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s New analyzer peer", buf, 0xCu);
    }
    xpc_connection_set_target_queue(v1, (dispatch_queue_t)&_dispatch_main_q);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000059F8;
    handler[3] = &unk_10000C8B8;
    uint64_t v5 = v1;
    uint64_t v8 = v5;
    xpc_connection_set_event_handler(v5, handler);
    xpc_connection_resume(v5);
  }
  else
  {
    v6 = AFSiriLogContextAnalysis;
    if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      int v10 = "_XPCMainConnectionHandler";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Peer not entitled", buf, 0xCu);
    }
    xpc_connection_cancel(v1);
  }
}

void sub_1000059F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary) {
    [(id)qword_100010AE8 _handleMessage:v3];
  }
  else {
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
  }
}

void sub_100005DF8(id a1)
{
  uint64_t v1 = AFSiriLogContextAnalysis;
  if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
  {
    int v2 = 136315138;
    id v3 = "-[AFAnalyzer _startAnalysisWithMessage:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "%s Exiting", (uint8_t *)&v2, 0xCu);
  }
  exit(0);
}

void sub_10000682C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

id sub_100006880(signed int a1)
{
  if (a1 < 1)
  {
    uint64_t v1 = 0;
  }
  else
  {
    uint64_t v1 = if_indextoname(a1, v3);
    if (v1)
    {
      uint64_t v1 = +[NSString stringWithUTF8String:v3];
    }
  }
  return v1;
}

uint64_t sub_100006908(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100006918(uint64_t a1)
{
}

void sub_100006920(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  id v3 = +[NSURL URLWithString:@"http://apple.com"];
  [v2 _measureTimeToLoadURL:v3 withMethod:@"HEAD"];
  uint64_t v5 = v4;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006EFC;
  v7[3] = &unk_10000C788;
  v6 = *(NSObject **)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = v5;
  dispatch_sync(v6, v7);
}

void sub_1000069FC(uint64_t a1)
{
  uint64_t v15 = 0;
  unint64_t v16 = 0xBFF0000000000000;
  uint64_t v14 = 0;
  [*(id *)(a1 + 32) _pingHost:*(void *)(a1 + 40) time:&v16 sentPackets:&v15 droppedPackets:&v14];
  uint64_t v2 = +[NSNumber numberWithInteger:v15];
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = +[NSNumber numberWithInteger:v14];
  uint64_t v6 = *(void *)(*(void *)(a1 + 72) + 8);
  int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (v15) {
    double v8 = (double)v14 / (double)v15;
  }
  else {
    double v8 = -1.0;
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100006E58;
  v10[3] = &unk_10000C7D8;
  uint64_t v9 = *(NSObject **)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  unint64_t v12 = v16;
  double v13 = v8;
  dispatch_sync(v9, v10);
}

void sub_100006B28(uint64_t a1)
{
  [*(id *)(a1 + 32) _measureTimeToLoadURL:*(void *)(a1 + 40) withMethod:@"HEAD"];
  uint64_t v3 = v2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100006DEC;
  v5[3] = &unk_10000C788;
  uint64_t v4 = *(NSObject **)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  uint64_t v7 = v3;
  dispatch_sync(v4, v5);
}

void sub_100006BD8(uint64_t a1)
{
  [*(id *)(a1 + 32) _measureTimeToLoadURL:*(void *)(a1 + 40) withMethod:@"HEAD"];
  uint64_t v3 = v2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100006D80;
  v5[3] = &unk_10000C788;
  uint64_t v4 = *(NSObject **)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  uint64_t v7 = v3;
  dispatch_sync(v4, v5);
}

void sub_100006C88(uint64_t a1)
{
  id v5 = +[NSNumber numberWithDouble:-2.0];
  uint64_t v2 = [*(id *)(a1 + 32) objectForKey:@"Siri URL HEAD time"];

  if (!v2) {
    [*(id *)(a1 + 32) setObject:v5 forKey:@"Siri URL HEAD time"];
  }
  uint64_t v3 = [*(id *)(a1 + 32) objectForKey:@"Siri Salt URL HEAD time"];

  if (!v3) {
    [*(id *)(a1 + 32) setObject:v5 forKey:@"Siri Salt URL HEAD time"];
  }
  uint64_t v4 = [*(id *)(a1 + 32) objectForKey:@"Apple URL HEAD time"];

  if (!v4) {
    [*(id *)(a1 + 32) setObject:v5 forKey:@"Apple URL HEAD time"];
  }
  [*(id *)(a1 + 40) addEntriesFromDictionary:*(void *)(a1 + 32)];
}

void sub_100006D80(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = +[NSNumber numberWithDouble:*(double *)(a1 + 40)];
  [v1 setObject:v2 forKey:@"Siri Salt URL HEAD time"];
}

void sub_100006DEC(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = +[NSNumber numberWithDouble:*(double *)(a1 + 40)];
  [v1 setObject:v2 forKey:@"Siri URL HEAD time"];
}

void sub_100006E58(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = +[NSNumber numberWithDouble:*(double *)(a1 + 40)];
  [v2 setObject:v3 forKey:@"Gateway average ping"];

  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = +[NSNumber numberWithDouble:*(double *)(a1 + 48)];
  [v4 setObject:v5 forKey:@"Gateway dropped percentage"];
}

void sub_100006EFC(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = +[NSNumber numberWithDouble:*(double *)(a1 + 40)];
  [v1 setObject:v2 forKey:@"Apple URL HEAD time"];
}

void sub_100007224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_100007244(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = +[NSProcessInfo processInfo];
  [v5 systemUptime];
  double v7 = v6;

  if (a3) {
    double v8 = v7 - *(double *)(a1 + 48);
  }
  else {
    double v8 = -1.0;
  }
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8;
  uint64_t v9 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v9);
}

void sub_1000077CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose((const void *)(v17 - 176), 8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 240), 8);
  _Block_object_dispose((const void *)(v17 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_100007810(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 64);
  uint64_t v3 = (unsigned __int8 *)[*(id *)(a1 + 32) bytes];
  long long v54 = 0u;
  long long v53 = 0u;
  long long v52 = 0u;
  long long v51 = 0u;
  long long v50 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  memset(v24, 0, sizeof(v24));
  memset(v23, 0, sizeof(v23));
  v18[0] = v24;
  v18[1] = 512;
  v17.msg_iov = 0;
  *(void *)&v17.msg_iovlen = 0;
  v17.msg_name = v3;
  *(void *)&v17.msg_namelen = 0;
  v17.msg_namelen = *v3;
  v17.msg_iov = (iovec *)v18;
  v17.msg_iovlen = 1;
  v17.msg_control = v23;
  *(void *)&v17.msg_controllen = 512;
  if (recvmsg(v2, &v17, 0) == -1)
  {
    double v7 = (void *)AFSiriLogContextAnalysis;
    if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
    {
      double v8 = v7;
      uint64_t v9 = __error();
      int v10 = strerror(*v9);
      *(_DWORD *)buf = 136315394;
      v20 = "_AFAReadICMPSeqAndPayload";
      __int16 v21 = 2080;
      v22 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s recvmsg failed %s", buf, 0x16u);
    }
    goto LABEL_11;
  }
  if (BYTE1(v24[2]) != 1)
  {
    id v5 = AFSiriLogContextAnalysis;
    if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "_AFAReadICMPSeqAndPayload";
      double v6 = "%s got something other than icmp packet";
      goto LABEL_10;
    }
LABEL_11:
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
    return;
  }
  uint64_t v4 = (double *)&v24[v24[0] & 0xF];
  if (*(unsigned char *)v4)
  {
    id v5 = AFSiriLogContextAnalysis;
    if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "_AFAReadICMPSeqAndPayload";
      double v6 = "%s Unexpected icmp packet type";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v6, buf, 0xCu);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (*((unsigned __int16 *)v4 + 2) == *(unsigned __int16 *)(a1 + 72))
  {
    unsigned int v11 = *((unsigned __int16 *)v4 + 3);
    double v12 = v4[1];
    double v13 = +[NSProcessInfo processInfo];
    [v13 systemUptime];
    double v15 = v14 - v12;

    unint64_t v16 = AFSiriLogContextAnalysis;
    if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
    {
      v24[0] = 136315650;
      *(void *)&v24[1] = "-[AFAnalyzer _pingHost:time:sentPackets:droppedPackets:]_block_invoke";
      LOWORD(v24[3]) = 1024;
      *(_DWORD *)((char *)&v24[3] + 2) = bswap32(v11) >> 16;
      HIWORD(v24[4]) = 2048;
      *(double *)&v24[5] = v15 * 1000.0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s seq %d in %.3lf ms", (uint8_t *)v24, 0x1Cu);
    }
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v15
                                                                + *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                            + 24);
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= *(_DWORD *)(a1 + 68)) {
      goto LABEL_11;
    }
  }
}

uint64_t sub_100007BC0(uint64_t a1)
{
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  int v2 = *(_DWORD *)(a1 + 40);
  return close(v2);
}

id sub_100007BFC(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_100007C28(uint64_t a1)
{
}

void sub_100007C30(uint64_t a1)
{
  if (dispatch_source_testcancel(*(dispatch_source_t *)(a1 + 32))) {
    goto LABEL_11;
  }
  int v2 = (const sockaddr *)[*(id *)(a1 + 40) bytes];
  int v3 = *(_DWORD *)(a1 + 72);
  __int16 v4 = *(_WORD *)(a1 + 80);
  unsigned int v5 = *(unsigned __int16 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  double v6 = +[NSProcessInfo processInfo];
  [v6 systemUptime];
  uint64_t v32 = 0;
  uint64_t v31 = 0;
  int v33 = 0;
  __int16 v26 = 8;
  __int16 v28 = v4;
  __int16 v29 = bswap32(v5) >> 16;
  double v7 = +[NSProcessInfo processInfo];
  [v7 systemUptime];
  uint64_t v9 = v8;

  uint64_t v10 = 0;
  unsigned int v11 = 0;
  uint64_t v30 = v9;
  __int16 v27 = 0;
  do
  {
    v11 += *(unsigned __int16 *)((char *)&v26 + v10);
    v10 += 2;
  }
  while (v10 != 36);
  __int16 v27 = ~(HIWORD(v11) + v11 + ((HIWORD(v11) + (unsigned __int16)v11) >> 16));
  unint64_t v12 = sendto(v3, &v26, 0x24uLL, 0, v2, v2->sa_len);
  if ((v12 & 0x8000000000000000) != 0)
  {
    double v15 = (void *)AFSiriLogContextAnalysis;
    if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
    {
      unint64_t v16 = v15;
      msghdr v17 = __error();
      v18 = strerror(*v17);
      int v22 = 136315394;
      v23 = "_AFASendPing";
      __int16 v24 = 2080;
      long long v25 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Failed sending on socket %s", (uint8_t *)&v22, 0x16u);
    }
    goto LABEL_10;
  }
  unint64_t v13 = v12;
  if (v12 <= 0x23)
  {
    double v14 = AFSiriLogContextAnalysis;
    if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
    {
      int v22 = 136315394;
      v23 = "_AFASendPing";
      __int16 v24 = 2048;
      long long v25 = (char *)v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Only sent %ld bytes", (uint8_t *)&v22, 0x16u);
    }
LABEL_10:

    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
LABEL_11:
    uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8);
    v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = 0;

    return;
  }

  if (*(_DWORD *)(a1 + 76) <= (int)(unsigned __int16)++*(_WORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    goto LABEL_11;
  }
  dispatch_time_t v21 = dispatch_time(0, 1000000000);
  dispatch_after(v21, *(dispatch_queue_t *)(a1 + 48), *(dispatch_block_t *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
}

int main(int argc, const char **argv, const char **envp)
{
  if (AFIsInternalInstall())
  {
    setenv("CFNETWORK_DIAGNOSTICS", "3", 1);
    setenv("CFNETWORK_DIAGNOSTICS_NO_SYSLOG", "1", 1);
  }
  __int16 v4 = +[AFAnalyzer analyzer];
  [v4 runAnalyzerService];

  exit(1);
}

uint64_t AFIsInternalInstall()
{
  return _AFIsInternalInstall();
}

uint64_t AFLogInitIfNeeded()
{
  return _AFLogInitIfNeeded();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return _dispatch_source_testcancel(source);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

int feof(FILE *a1)
{
  return _feof(a1);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fread(__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

void freeaddrinfo(addrinfo *a1)
{
}

const char *__cdecl gai_strerror(int a1)
{
  return _gai_strerror(a1);
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return _getaddrinfo(a1, a2, a3, a4);
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return _if_indextoname(a1, a2);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return _inet_ntop(a1, a2, a3, a4);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int pclose(FILE *a1)
{
  return _pclose(a1);
}

FILE *__cdecl popen(const char *a1, const char *a2)
{
  return _popen(a1, a2);
}

ssize_t recvmsg(int a1, msghdr *a2, int a3)
{
  return _recvmsg(a1, a2, a3);
}

ssize_t sendto(int a1, const void *a2, size_t a3, int a4, const sockaddr *a5, socklen_t a6)
{
  return _sendto(a1, a2, a3, a4, a5, a6);
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return _setenv(__name, __value, __overwrite);
}

int socket(int a1, int a2, int a3)
{
  return _socket(a1, a2, a3);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return _xpc_connection_copy_entitlement_value();
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return _xpc_int64_get_value(xint);
}

void xpc_main(xpc_connection_handler_t handler)
{
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__AWDTimestampTruncatedToHourPrecision(void *a1, const char *a2, ...)
{
  return [a1 _AWDTimestampTruncatedToHourPrecision];
}

id objc_msgSend__connectionStartTime(void *a1, const char *a2, ...)
{
  return [a1 _connectionStartTime];
}

id objc_msgSend__currentTime(void *a1, const char *a2, ...)
{
  return [a1 _currentTime];
}

id objc_msgSend__queue(void *a1, const char *a2, ...)
{
  return [a1 _queue];
}

id objc_msgSend__serverConnection(void *a1, const char *a2, ...)
{
  return [a1 _serverConnection];
}

id objc_msgSend__voiceRecordingEndTime(void *a1, const char *a2, ...)
{
  return [a1 _voiceRecordingEndTime];
}

id objc_msgSend__voiceRecordingStartTime(void *a1, const char *a2, ...)
{
  return [a1 _voiceRecordingStartTime];
}

id objc_msgSend__voiceSendEndTime(void *a1, const char *a2, ...)
{
  return [a1 _voiceSendEndTime];
}

id objc_msgSend__voiceSendStartTime(void *a1, const char *a2, ...)
{
  return [a1 _voiceSendStartTime];
}

id objc_msgSend_analyzedSuccessfulRetry(void *a1, const char *a2, ...)
{
  return [a1 analyzedSuccessfulRetry];
}

id objc_msgSend_analyzer(void *a1, const char *a2, ...)
{
  return [a1 analyzer];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_connectionInterface(void *a1, const char *a2, ...)
{
  return [a1 connectionInterface];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_gatewayPingDuration(void *a1, const char *a2, ...)
{
  return [a1 gatewayPingDuration];
}

id objc_msgSend_gatewayPingsDropped(void *a1, const char *a2, ...)
{
  return [a1 gatewayPingsDropped];
}

id objc_msgSend_gatewayPingsSent(void *a1, const char *a2, ...)
{
  return [a1 gatewayPingsSent];
}

id objc_msgSend_gatewayStatus(void *a1, const char *a2, ...)
{
  return [a1 gatewayStatus];
}

id objc_msgSend_getAWDTimestamp(void *a1, const char *a2, ...)
{
  return [a1 getAWDTimestamp];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_isForUserRequest(void *a1, const char *a2, ...)
{
  return [a1 isForUserRequest];
}

id objc_msgSend_knownURLLoadDuration(void *a1, const char *a2, ...)
{
  return [a1 knownURLLoadDuration];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_logVoiceSendEnd(void *a1, const char *a2, ...)
{
  return [a1 logVoiceSendEnd];
}

id objc_msgSend_logVoiceSendStart(void *a1, const char *a2, ...)
{
  return [a1 logVoiceSendStart];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_runAnalyzerService(void *a1, const char *a2, ...)
{
  return [a1 runAnalyzerService];
}

id objc_msgSend_sendBufferBytesRemaining(void *a1, const char *a2, ...)
{
  return [a1 sendBufferBytesRemaining];
}

id objc_msgSend_sharedDiagnostics(void *a1, const char *a2, ...)
{
  return [a1 sharedDiagnostics];
}

id objc_msgSend_sharedSession(void *a1, const char *a2, ...)
{
  return [a1 sharedSession];
}

id objc_msgSend_siriSaltURLLoadDuration(void *a1, const char *a2, ...)
{
  return [a1 siriSaltURLLoadDuration];
}

id objc_msgSend_siriURLLoadDuration(void *a1, const char *a2, ...)
{
  return [a1 siriURLLoadDuration];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_systemUptime(void *a1, const char *a2, ...)
{
  return [a1 systemUptime];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_wwanPreferred(void *a1, const char *a2, ...)
{
  return [a1 wwanPreferred];
}