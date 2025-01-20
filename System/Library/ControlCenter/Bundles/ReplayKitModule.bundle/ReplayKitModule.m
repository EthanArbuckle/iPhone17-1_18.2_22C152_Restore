void sub_3C00(id a1)
{
  uint64_t vars8;

  qword_23F10 = objc_alloc_init(RPControlCenterClient);

  _objc_release_x1();
}

uint64_t sub_4368(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_4464(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 displayBacklightLevel])
  {
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136446978;
      v9 = "-[RPControlCenterClient setUpFrontBoardServices]_block_invoke_2";
      __int16 v10 = 1024;
      int v11 = 150;
      __int16 v12 = 2048;
      uint64_t v13 = v5;
      __int16 v14 = 1024;
      unsigned int v15 = [v4 displayBacklightLevel];
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p Display layout updated displayBacklightLevel=%d", buf, 0x22u);
    }
  }
  else
  {
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136446722;
      v9 = "-[RPControlCenterClient setUpFrontBoardServices]_block_invoke";
      __int16 v10 = 1024;
      int v11 = 141;
      __int16 v12 = 2048;
      uint64_t v13 = v6;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p Display layout updated to minimum backlight", buf, 0x1Cu);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_463C;
    block[3] = &unk_1C498;
    block[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

id sub_463C(uint64_t a1)
{
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[94])
  {
    [v2 cancelRecordingCountdown];
    [*(id *)(a1 + 32) notifyClientDelegatesStart:0];
    v2 = *(unsigned char **)(a1 + 32);
  }

  return [v2 terminateAngelRecordingSession];
}

void sub_47D8(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) timeIntervalSinceNow];
  double v3 = v2;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v14 = "-[RPControlCenterClient loadAvailableExtensionsWithHandler:]_block_invoke";
    __int16 v15 = 1024;
    int v16 = 163;
    __int16 v17 = 2048;
    double v18 = v3;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d time since cache = %f", buf, 0x1Cu);
  }
  if (v3 >= -0.5)
  {
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      double v10 = *(double *)(a1 + 32);
      *(_DWORD *)buf = 136446722;
      __int16 v14 = "-[RPControlCenterClient loadAvailableExtensionsWithHandler:]_block_invoke";
      __int16 v15 = 1024;
      int v16 = 173;
      __int16 v17 = 2048;
      double v18 = v10;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p get cached availableExtensions", buf, 0x1Cu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      double v4 = *(double *)(a1 + 32);
      *(_DWORD *)buf = 136446722;
      __int16 v14 = "-[RPControlCenterClient loadAvailableExtensionsWithHandler:]_block_invoke";
      __int16 v15 = 1024;
      int v16 = 165;
      __int16 v17 = 2048;
      double v18 = v4;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p fetching new copy of broadcast extensions.", buf, 0x1Cu);
    }
    uint64_t v5 = +[NSDate now];
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 48);
    *(void *)(v6 + 48) = v5;

    v8 = +[RPDaemonProxy daemonProxy];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_4A88;
    v11[3] = &unk_1C4E8;
    v9 = *(void **)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    id v12 = v9;
    [v8 getSystemBroadcastExtensionInfo:v11];
  }
}

void sub_4A88(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v11 = 136446722;
    id v12 = "-[RPControlCenterClient loadAvailableExtensionsWithHandler:]_block_invoke";
    __int16 v13 = 1024;
    int v14 = 168;
    __int16 v15 = 2048;
    uint64_t v16 = v7;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p fetched new copy of broadcast extensions", (uint8_t *)&v11, 0x1Cu);
  }
  id v8 = [v5 copy];
  uint64_t v9 = *(void *)(a1 + 32);
  double v10 = *(void **)(v9 + 32);
  *(void *)(v9 + 32) = v8;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_4E28(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v10 = 136447234;
    int v11 = "-[RPControlCenterClient getSystemBroadcastPickerInfo]_block_invoke";
    __int16 v12 = 1024;
    int v13 = 187;
    __int16 v14 = 2048;
    uint64_t v15 = v6;
    __int16 v16 = 2112;
    id v17 = v5;
    __int16 v18 = 1024;
    int v19 = a3;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p preferredExtension=%@ showsMicButton=%d", (uint8_t *)&v10, 0x2Cu);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 104);
  *(void *)(v7 + 104) = v5;
  id v9 = v5;

  *(unsigned char *)(*(void *)(a1 + 32) + 92) = a3;
}

uint64_t sub_4FFC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_52B4(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, 1, a2);
  }
  return result;
}

void sub_549C(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    id v4 = [objc_alloc((Class)RPBroadcastController) initWithExtensionBundleID:*(void *)(a1 + 32) broadcastURL:0];
    [*(id *)(a1 + 40) startBroadcastWithBroadcastController:v4 handler:*(void *)(a1 + 48)];
  }
}

void sub_5684(uint64_t a1, void *a2)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a2;
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v7), "objectForKey:", @"extBundleID", (void)v9);
        if ([v8 isEqualToString:*(void *)(a1 + 32)])
        {
          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

          goto LABEL_11;
        }

        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_11:
}

void sub_5AE0(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) updateStatusIsCountingDown:1 IsRecording:0];
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = *(unsigned __int8 **)(a1 + 32);
    int v5 = v4[94];
    int v6 = v4[93];
    int v7 = v4[95];
    int v8 = 136447746;
    long long v9 = "-[RPControlCenterClient notifyClientDelegatesStart:]_block_invoke";
    __int16 v10 = 1024;
    int v11 = 276;
    __int16 v12 = 2048;
    int v13 = v4;
    __int16 v14 = 2048;
    id v15 = v3;
    __int16 v16 = 1024;
    int v17 = v5;
    __int16 v18 = 1024;
    int v19 = v6;
    __int16 v20 = 1024;
    int v21 = v7;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p delegate=%p updated status to isCountingDown:%i lockUIControls:%i, recordingOn:%i", (uint8_t *)&v8, 0x38u);
  }
  [v3 sessionIsStarting];
}

void sub_5C0C(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) updateStatusIsCountingDown:0 IsRecording:0];
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = *(unsigned __int8 **)(a1 + 32);
    int v5 = v4[94];
    int v6 = v4[93];
    int v7 = v4[95];
    int v8 = 136447746;
    long long v9 = "-[RPControlCenterClient notifyClientDelegatesStart:]_block_invoke";
    __int16 v10 = 1024;
    int v11 = 283;
    __int16 v12 = 2048;
    int v13 = v4;
    __int16 v14 = 2048;
    id v15 = v3;
    __int16 v16 = 1024;
    int v17 = v5;
    __int16 v18 = 1024;
    int v19 = v6;
    __int16 v20 = 1024;
    int v21 = v7;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p delegate=%p updated status to isCountingDown:%i lockUIControls:%i, recordingOn:%i", (uint8_t *)&v8, 0x38u);
  }
  [v3 sessionDidFailToStart];
}

void sub_5EA8(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5F58;
  block[3] = &unk_1C600;
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_5F58(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v2 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136446722;
      id v8 = "-[RPControlCenterClient startRecordingWithHandler:]_block_invoke";
      __int16 v9 = 1024;
      int v10 = 309;
      __int16 v11 = 2048;
      uint64_t v12 = v2;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p failed to start system recording", buf, 0x1Cu);
    }
    [*(id *)(a1 + 40) notifyClientDelegatesStart:0];
    [*(id *)(a1 + 40) terminateAngelRecordingSession];
  }
  else
  {
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136446722;
      id v8 = "-[RPControlCenterClient startRecordingWithHandler:]_block_invoke_2";
      __int16 v9 = 1024;
      int v10 = 301;
      __int16 v11 = 2048;
      uint64_t v12 = v3;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p started system recording with no errors", buf, 0x1Cu);
    }
    uint64_t v4 = *(void **)(a1 + 40);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_6134;
    v6[3] = &unk_1C5D8;
    v6[4] = v4;
    [v4 callDelegate:v6];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_6134(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) updateStatusIsCountingDown:0 IsRecording:1];
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(unsigned __int8 **)(a1 + 32);
    int v5 = v4[94];
    int v6 = v4[93];
    int v7 = v4[95];
    int v8 = 136447746;
    __int16 v9 = "-[RPControlCenterClient startRecordingWithHandler:]_block_invoke";
    __int16 v10 = 1024;
    int v11 = 305;
    __int16 v12 = 2048;
    int v13 = v4;
    __int16 v14 = 2048;
    id v15 = v3;
    __int16 v16 = 1024;
    int v17 = v5;
    __int16 v18 = 1024;
    int v19 = v6;
    __int16 v20 = 1024;
    int v21 = v7;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p delegate=%p updated status to isCountingDown:%i lockUIControls:%i, recordingOn:%i", (uint8_t *)&v8, 0x38u);
  }
  [v3 didStartRecordingOrBroadcast];
}

void sub_6424(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 96);
  if (a2)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 88) = [v4 isEqualToString:@"com.apple.replaykit.recordToCameraRoll"] ^ 1;
  }
  else
  {
    *(void *)(v3 + 96) = @"com.apple.replaykit.recordToCameraRoll";

    *(unsigned char *)(*(void *)(a1 + 32) + 88) = 0;
  }
}

void sub_6484(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6534;
  block[3] = &unk_1C600;
  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = *(void **)(a1 + 40);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = v6;
  id v7 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_6534(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v2 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136446722;
      int v8 = "-[RPControlCenterClient startBroadcastWithHandler:]_block_invoke";
      __int16 v9 = 1024;
      int v10 = 353;
      __int16 v11 = 2048;
      uint64_t v12 = v2;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p failed to start system broadcast", buf, 0x1Cu);
    }
    [*(id *)(a1 + 40) notifyClientDelegatesStart:0];
  }
  else
  {
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136446722;
      int v8 = "-[RPControlCenterClient startBroadcastWithHandler:]_block_invoke_3";
      __int16 v9 = 1024;
      int v10 = 344;
      __int16 v11 = 2048;
      uint64_t v12 = v3;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p started system broadcast with no errors", buf, 0x1Cu);
    }
    id v4 = *(void **)(a1 + 40);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_6708;
    v6[3] = &unk_1C5D8;
    v6[4] = v4;
    [v4 callDelegate:v6];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_6708(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) updateStatusIsCountingDown:0 IsRecording:1];
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = *(unsigned __int8 **)(a1 + 32);
    int v5 = v4[94];
    int v6 = v4[93];
    int v7 = v4[95];
    int v8 = 136447746;
    __int16 v9 = "-[RPControlCenterClient startBroadcastWithHandler:]_block_invoke";
    __int16 v10 = 1024;
    int v11 = 349;
    __int16 v12 = 2048;
    int v13 = v4;
    __int16 v14 = 2048;
    id v15 = v3;
    __int16 v16 = 1024;
    int v17 = v5;
    __int16 v18 = 1024;
    int v19 = v6;
    __int16 v20 = 1024;
    int v21 = v7;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p delegate=%p updated status to isCountingDown:%i lockUIControls:%i, recordingOn:%i", (uint8_t *)&v8, 0x38u);
  }
  [v3 didStartRecordingOrBroadcast];
}

uint64_t sub_6B14(uint64_t a1)
{
  [*(id *)(a1 + 32) updateStatusIsCountingDown:0 IsRecording:0];
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(unsigned __int8 **)(a1 + 32);
    int v3 = v2[94];
    int v4 = v2[93];
    int v5 = v2[95];
    int v7 = 136447490;
    int v8 = "-[RPControlCenterClient stopCurrentSession:]_block_invoke";
    __int16 v9 = 1024;
    int v10 = 377;
    __int16 v11 = 2048;
    __int16 v12 = v2;
    __int16 v13 = 1024;
    int v14 = v3;
    __int16 v15 = 1024;
    int v16 = v4;
    __int16 v17 = 1024;
    int v18 = v5;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p updated status to isCountingDown:%i lockUIControls:%i, recordingOn:%i", (uint8_t *)&v7, 0x2Eu);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_6C38(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_6CC0;
  v2[3] = &unk_1C510;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

uint64_t sub_6CC0(uint64_t a1)
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(unsigned __int8 **)(a1 + 32);
    int v8 = 136446722;
    __int16 v9 = "-[RPControlCenterClient stopCurrentSession:]_block_invoke_2";
    __int16 v10 = 1024;
    int v11 = 389;
    __int16 v12 = 2048;
    __int16 v13 = v2;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p Stopped system broadcast", (uint8_t *)&v8, 0x1Cu);
  }
  [*(id *)(a1 + 32) updateStatusIsCountingDown:0 IsRecording:0];
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(unsigned __int8 **)(a1 + 32);
    int v4 = v3[94];
    int v5 = v3[93];
    int v6 = v3[95];
    int v8 = 136447490;
    __int16 v9 = "-[RPControlCenterClient stopCurrentSession:]_block_invoke";
    __int16 v10 = 1024;
    int v11 = 391;
    __int16 v12 = 2048;
    __int16 v13 = v3;
    __int16 v14 = 1024;
    int v15 = v4;
    __int16 v16 = 1024;
    int v17 = v5;
    __int16 v18 = 1024;
    int v19 = v6;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p updated status to isCountingDown:%i lockUIControls:%i, recordingOn:%i", (uint8_t *)&v8, 0x2Eu);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_6FB8(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_7068;
  block[3] = &unk_1C600;
  int v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_7068(uint64_t a1)
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(unsigned __int8 **)(a1 + 32);
    int v8 = 136446722;
    __int16 v9 = "-[RPControlCenterClient stopSystemRecordingWithHandler:]_block_invoke_2";
    __int16 v10 = 1024;
    int v11 = 406;
    __int16 v12 = 2048;
    __int16 v13 = v2;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p Stopped system recording", (uint8_t *)&v8, 0x1Cu);
  }
  [*(id *)(a1 + 32) updateStatusIsCountingDown:0 IsRecording:0];
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(unsigned __int8 **)(a1 + 32);
    int v4 = v3[94];
    int v5 = v3[93];
    int v6 = v3[95];
    int v8 = 136447490;
    __int16 v9 = "-[RPControlCenterClient stopSystemRecordingWithHandler:]_block_invoke";
    __int16 v10 = 1024;
    int v11 = 408;
    __int16 v12 = 2048;
    __int16 v13 = v3;
    __int16 v14 = 1024;
    int v15 = v4;
    __int16 v16 = 1024;
    int v17 = v5;
    __int16 v18 = 1024;
    int v19 = v6;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p updated status to isCountingDown:%i lockUIControls:%i, recordingOn:%i", (uint8_t *)&v8, 0x2Eu);
  }
  if (*(void *)(a1 + 40)) {
    [*(id *)(a1 + 32) terminateAngelRecordingSession];
  }
  [*(id *)(a1 + 32) callDelegate:&stru_1C6B8];
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_722C(id a1, id a2)
{
}

void sub_7558(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v10 = "-[RPControlCenterClient updateClientState]_block_invoke";
    __int16 v11 = 1024;
    int v12 = 443;
    __int16 v13 = 2048;
    id v14 = [v3 count];
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Available Extensions: %lu", buf, 0x1Cu);
  }
  int v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_76AC;
  v6[3] = &unk_1C6E0;
  id v7 = v3;
  int v8 = v4;
  id v5 = v3;
  [v4 callDelegate:v6];
}

id sub_76AC(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_7720;
  v4[3] = &unk_1C498;
  uint64_t v2 = *(void *)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  return [a2 didUpdateClientStateWithAvailableExtensions:v2 completionHandler:v4];
}

uint64_t sub_7720(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 91) = 1;
  return result;
}

id sub_796C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 72);
  *(void *)(v2 + 72) = @"Countdown3";

  int v4 = +[RPControlCenterAngelProxy sharedInstance];
  [v4 setCountdownState:@"Countdown3"];

  id v5 = *(void **)(a1 + 32);

  return [v5 setCountdown:@"Countdown2"];
}

void sub_79E8(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[64] || ![v2 isCountingDown]) {
    return;
  }
  if ([*(id *)(a1 + 40) isEqualToString:@"Countdown2"])
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(void **)(v3 + 72);
    *(void *)(v3 + 72) = @"Countdown2";

    id v5 = +[RPControlCenterAngelProxy sharedInstance];
    [v5 setCountdownState:@"Countdown2"];

    int v6 = *(void **)(a1 + 32);
    CFStringRef v7 = @"Countdown1";
LABEL_7:
    [v6 setCountdown:v7];
    return;
  }
  if ([*(id *)(a1 + 40) isEqualToString:@"Countdown1"])
  {
    uint64_t v8 = *(void *)(a1 + 32);
    __int16 v9 = *(void **)(v8 + 72);
    *(void *)(v8 + 72) = @"Countdown1";

    __int16 v10 = +[RPControlCenterAngelProxy sharedInstance];
    [v10 setCountdownState:@"Countdown1"];

    int v6 = *(void **)(a1 + 32);
    CFStringRef v7 = @"CountdownComplete";
    goto LABEL_7;
  }
  if ([*(id *)(a1 + 40) isEqualToString:@"CountdownComplete"])
  {
    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = *(void **)(v11 + 72);
    *(void *)(v11 + 72) = @"CountdownComplete";

    __int16 v13 = +[RPControlCenterAngelProxy sharedInstance];
    [v13 setCountdownState:@"CountdownComplete"];

    dispatch_time_t v14 = dispatch_time(0, 350000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_7BB0;
    block[3] = &unk_1C498;
    void block[4] = *(void *)(a1 + 32);
    dispatch_after(v14, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

id sub_7BB0(uint64_t a1)
{
  return [*(id *)(a1 + 32) startRecordingWithHandler:&stru_1C728];
}

void sub_7BC0(id a1)
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    uint64_t v2 = "-[RPControlCenterClient setCountdown:]_block_invoke_4";
    __int16 v3 = 1024;
    int v4 = 484;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d completed", (uint8_t *)&v1, 0x12u);
  }
}

void sub_8270(id a1, id a2)
{
}

void sub_83C0(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "didChangeAvailability:", objc_msgSend(v2, "isAvailable"));
}

void sub_871C(id a1, id a2)
{
}

void sub_8970(id a1, id a2)
{
}

id sub_8AEC(uint64_t a1)
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v3 = *(unsigned __int8 *)(v2 + 94);
    int v4 = *(unsigned __int8 *)(v2 + 95);
    int v6 = 136447234;
    CFStringRef v7 = "-[RPControlCenterClient replayKitAngelDisconnected]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 620;
    __int16 v10 = 2048;
    uint64_t v11 = v2;
    __int16 v12 = 1024;
    int v13 = v3;
    __int16 v14 = 1024;
    int v15 = v4;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p isCountingDown:%i, recordingOn:%i", (uint8_t *)&v6, 0x28u);
  }
  [*(id *)(a1 + 32) notifyClientDelegatesStart:0];
  return [*(id *)(a1 + 32) stopSystemRecordingWithHandler:0];
}

id sub_8D38(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isEqualToString:@"countdownStatusPause"];
  if (result)
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 64) = 1;
  }
  else
  {
    id result = [*(id *)(a1 + 32) isEqualToString:@"countdownStatusResume"];
    if (result)
    {
      *(unsigned char *)(*(void *)(a1 + 40) + 64) = 0;
      int v3 = *(void **)(a1 + 40);
      uint64_t v4 = v3[9];
      return [v3 setCountdown:v4];
    }
  }
  return result;
}

int64_t sub_9EE0(id a1, id a2, id a3)
{
  id v4 = a3;
  id v5 = [a2 objectForKey:@"displayName"];
  int v6 = [v4 objectForKey:@"displayName"];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

id sub_A520(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsDeviceLocked:0];
}

void sub_A638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_A654(uint64_t a1)
{
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  SBSGetScreenLockStatus();
  [WeakRetained setIsDeviceLocked:0];
  if (!__RPLogLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = WeakRetained[89];
    *(_DWORD *)buf = 136446722;
    id v4 = "-[RPControlCenterMenuModuleViewController setupLockScreenNotifications]_block_invoke";
    __int16 v5 = 1024;
    int v6 = 301;
    __int16 v7 = 1024;
    int v8 = v2;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d _isDeviceLocked=%d", buf, 0x18u);
  }
}

void sub_ABD0(uint64_t a1, char a2)
{
  if (a2)
  {
    if (__RPLogLevel || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136446466;
    __int16 v7 = "-[RPControlCenterMenuModuleViewController acquireProcessAssertionWithHandler:]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 336;
    int v3 = " [DEBUG] %{public}s:%d  assertion acquired";
  }
  else
  {
    if (__RPLogLevel || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136446466;
    __int16 v7 = "-[RPControlCenterMenuModuleViewController acquireProcessAssertionWithHandler:]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 334;
    int v3 = " [DEBUG] %{public}s:%d  assertion failed";
  }
  _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v3, buf, 0x12u);
LABEL_9:
  if (*(void *)(a1 + 32))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_AD68;
    block[3] = &unk_1C840;
    id v5 = *(id *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

uint64_t sub_AD68(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_AF3C(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  SBSRequestPasscodeUnlockAlertUI();
}

uint64_t sub_AFB8(uint64_t a1, unsigned int a2)
{
  NSLog(@"%s completed authentication unlocked %i", "-[RPControlCenterMenuModuleViewController authenticateWithCompletionHandler:]_block_invoke_2", a2);
  int v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

void sub_B170(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 24);
  id WeakRetained = objc_loadWeakRetained((id *)(v2 + 48));
  [WeakRetained setExtensionBundleID:v3];

  id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  [v5 notifyClientDelegatesStart:1];

  if ([*(id *)(a1 + 32) currentSelectedExtensionIsSystemRecording])
  {
    int v6 = +[RPFeatureFlagUtility sharedInstance];
    unsigned int v7 = [v6 systemBannerEnabled];

    __int16 v8 = *(void **)(a1 + 32);
    if (v7)
    {
      [*(id *)(a1 + 32) updateStateAndUI];
      int v9 = *(void **)(a1 + 32);
      [v9 startRecordingCountdown];
      return;
    }
    uint64_t v11 = +[NSArray arrayWithObject:NSRunLoopCommonModes];
    id v16 = (id)v11;
    double v12 = 3.0;
    int v13 = v8;
    __int16 v14 = "startRecord";
    int v15 = v8;
  }
  else
  {
    __int16 v10 = *(void **)(a1 + 32);
    uint64_t v11 = +[NSArray arrayWithObject:NSRunLoopCommonModes];
    id v16 = (id)v11;
    double v12 = 3.0;
    int v13 = v10;
    __int16 v14 = "startBroadcast";
    int v15 = v10;
  }
  [v13 performSelector:v14 withObject:v15 afterDelay:v11 inModes:v12];
}

void sub_B468(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) isExpanded];
  uint64_t v3 = *(id **)(a1 + 32);
  if (v2)
  {
    [v3 updateStateAndUI];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained(v3 + 6);
    objc_msgSend(*(id *)(a1 + 32), "setSelected:", objc_msgSend(WeakRetained, "recordingOn"));
  }
}

id sub_B664(uint64_t a1)
{
  [*(id *)(a1 + 32) updateStateAndUI];
  unsigned int v2 = *(void **)(a1 + 32);

  return [v2 invalidateProcessAssertion];
}

id sub_B804(uint64_t a1)
{
  [*(id *)(a1 + 32) updateStateAndUI];
  unsigned int v2 = *(void **)(a1 + 32);

  return [v2 invalidateProcessAssertion];
}

void sub_BE54(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  unsigned int v2 = *(void **)(a1 + 32);
  uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:*(void *)(a1 + 40) value:&stru_1CE58 table:0];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_BF74;
  v5[3] = &unk_1C920;
  objc_copyWeak(&v6, &location);
  [v2 setFooterButtonTitle:v4 handler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void sub_BF50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_BF74(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained recordButtonTapped];

  return 0;
}

void sub_C434(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 160));
  _Unwind_Resume(a1);
}

uint64_t sub_C488(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained + 6;
  id v4 = objc_loadWeakRetained(WeakRetained + 6);
  if ([v4 recordingOn]) {
    goto LABEL_4;
  }
  id v5 = objc_loadWeakRetained(v3);
  if ([v5 isCountingDown])
  {

LABEL_4:
    goto LABEL_5;
  }
  id v7 = objc_loadWeakRetained(v3);
  unsigned __int8 v8 = [v7 lockUIControls];

  if ((v8 & 1) == 0)
  {
    objc_storeStrong(WeakRetained + 3, *(id *)(a1 + 32));
    [WeakRetained updateRecordButtonLabel];
    [WeakRetained updateRPCCModuleMenuItems];
  }
LABEL_5:

  return 0;
}

id sub_C554(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMenuItems:*(void *)(a1 + 40)];
}

void sub_C8F0(uint64_t a1, int a2)
{
  if (a2)
  {
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      id v5 = "-[RPControlCenterMenuModuleViewController recordButtonTapped]_block_invoke";
      __int16 v6 = 1024;
      int v7 = 577;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d succesfully authenticated", buf, 0x12u);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_CA1C;
    block[3] = &unk_1C498;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_CA1C(uint64_t a1)
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
    unsigned int v3 = [WeakRetained isCountingDown];
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
    unsigned int v5 = [v4 lockUIControls];
    id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
    *(_DWORD *)buf = 136447234;
    int v21 = "-[RPControlCenterMenuModuleViewController recordButtonTapped]_block_invoke";
    __int16 v22 = 1024;
    int v23 = 581;
    __int16 v24 = 1024;
    unsigned int v25 = v3;
    __int16 v26 = 1024;
    unsigned int v27 = v5;
    __int16 v28 = 1024;
    unsigned int v29 = [v6 recordingOn];
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d isCountingDown:%i lockUIControls:%i, recordingOn:%i", buf, 0x24u);
  }
  id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  unsigned __int8 v8 = [v7 isCountingDown];

  int v9 = *(id **)(a1 + 32);
  if (v8)
  {
    [v9 cancelPreviousCountdownRequest];
  }
  else
  {
    id v10 = objc_loadWeakRetained(v9 + 6);
    unsigned int v11 = [v10 recordingOn];

    uint64_t v12 = *(void *)(a1 + 32);
    if (v11)
    {
      if (*(unsigned char *)(v12 + 88))
      {
        id v13 = objc_loadWeakRetained((id *)(v12 + 48));
        __int16 v14 = [v13 extensionBundleID];
        id v15 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
        id v16 = [v15 preferredExtension];
        unsigned __int8 v17 = [v14 isEqualToString:v16];

        uint64_t v12 = *(void *)(a1 + 32);
        if ((v17 & 1) == 0)
        {
          *(unsigned char *)(v12 + 32) = 1;
          uint64_t v12 = *(void *)(a1 + 32);
        }
      }
      id v18 = objc_loadWeakRetained((id *)(v12 + 48));
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_CCAC;
      v19[3] = &unk_1C498;
      v19[4] = *(void *)(a1 + 32);
      [v18 stopCurrentSession:v19];
    }
    else
    {
      [(id)v12 transitionToCountdownState];
    }
  }
}

void sub_CCAC(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_CD24;
  block[3] = &unk_1C498;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_CD24(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateStateAndUI];
}

void sub_CD2C(id a1)
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    unsigned int v2 = "-[RPControlCenterMenuModuleViewController recordButtonTapped]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 607;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Recording not available alert presented", (uint8_t *)&v1, 0x12u);
  }
}

void sub_D1D0(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    __int16 v3 = *(NSObject **)(v2 + 80);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_D254;
    block[3] = &unk_1C498;
    void block[4] = v2;
    dispatch_async(v3, block);
  }
}

id sub_D254(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsDeviceLocked:0];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 64);

  return [v2 requestExpandModule];
}

void sub_DBCC(id a1)
{
  qword_23F20 = objc_alloc_init(RPFeatureFlagUtility);

  _objc_release_x1();
}

void sub_108F8(id a1)
{
  qword_23F30 = objc_alloc_init(RPControlCenterAngelProxy);

  _objc_release_x1();
}

void sub_10988(id a1)
{
  qword_23F40 = (uint64_t)dispatch_queue_create("com.replaykitangel.angelProxyConnectionQueue", 0);

  _objc_release_x1();
}

void sub_10A1C(id a1)
{
  id v5 = +[BSMutableServiceInterface interfaceWithIdentifier:@"com.apple.ReplayKitAngel.session"];
  int v1 = +[BSObjCProtocol protocolForProtocol:&OBJC_PROTOCOL___RPAngelServerProtocol];
  [v5 setServer:v1];

  uint64_t v2 = +[BSObjCProtocol protocolForProtocol:&OBJC_PROTOCOL___RPAngelClientProtocol];
  [v5 setClient:v2];

  [v5 setClientMessagingExpectation:0];
  id v3 = [v5 copy];
  int v4 = (void *)qword_23F50;
  qword_23F50 = (uint64_t)v3;
}

void sub_10CB8(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 connectionManagerQueue];
  [v4 setTargetQueue:v5];

  id v6 = +[BSServiceQuality userInitiated];
  [v4 setServiceQuality:v6];

  id v7 = [*(id *)(a1 + 32) getBSServiceInterface];
  [v4 setInterface:v7];

  [v4 setInterfaceTarget:*(void *)(a1 + 32)];
  [v4 setActivationHandler:&stru_1CA28];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10EF4;
  v9[3] = &unk_1CA50;
  v9[4] = *(void *)(a1 + 32);
  [v4 setInterruptionHandler:v9];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_110B4;
  v8[3] = &unk_1CA50;
  v8[4] = *(void *)(a1 + 32);
  [v4 setInvalidationHandler:v8];
}

void sub_10E20(id a1, BSServiceConnectionContext *a2)
{
  uint64_t v2 = a2;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    id v4 = "-[RPControlCenterAngelProxy setupConnection]_block_invoke_2";
    __int16 v5 = 1024;
    int v6 = 79;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Activation handler", (uint8_t *)&v3, 0x12u);
  }
}

void sub_10EF4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446466;
    int v9 = "-[RPControlCenterAngelProxy setupConnection]_block_invoke";
    __int16 v10 = 1024;
    int v11 = 82;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Interruption handler", (uint8_t *)&v8, 0x12u);
  }
  [@"com.apple.replayd" UTF8String];
  if (os_variant_allows_internal_security_policies())
  {
    CFPropertyListRef v4 = CFPreferencesCopyAppValue(@"RPHideStatusBar", @"com.apple.replayd");
    BOOL v5 = v4 != 0;
    if (__RPLogLevel <= 1u)
    {
      CFPropertyListRef v6 = v4;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136446722;
        int v9 = "-[RPControlCenterAngelProxy setupConnection]_block_invoke";
        __int16 v10 = 1024;
        int v11 = 90;
        __int16 v12 = 1024;
        BOOL v13 = v6 != 0;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d hideStatusBar=%d", (uint8_t *)&v8, 0x18u);
      }
    }
  }
  else
  {
    BOOL v5 = 0;
  }
  id v7 = *(void **)(*(void *)(a1 + 32) + 16);
  if (v7 && !v5) {
    [v7 replayKitAngelDisconnected];
  }
  [v3 activate];
}

void sub_110B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    id v7 = "-[RPControlCenterAngelProxy setupConnection]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 99;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Invalidation handler", (uint8_t *)&v6, 0x12u);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = 0;

  [*(id *)(a1 + 32) stopCurrentSession];
}

uint64_t BSDispatchQueueCreateSerialWithQoS()
{
  return _BSDispatchQueueCreateSerialWithQoS();
}

uint64_t CCUIIsPortrait()
{
  return _CCUIIsPortrait();
}

uint64_t CCUIReferenceScreenBounds()
{
  return _CCUIReferenceScreenBounds();
}

uint64_t CCUIScreenBounds()
{
  return _CCUIScreenBounds();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

uint64_t CGFloatIsValid()
{
  return _CGFloatIsValid();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

void NSLog(NSString *format, ...)
{
}

uint64_t SBSGetScreenLockStatus()
{
  return _SBSGetScreenLockStatus();
}

uint64_t SBSIsSystemApertureAvailable()
{
  return _SBSIsSystemApertureAvailable();
}

uint64_t SBSRequestPasscodeUnlockAlertUI()
{
  return _SBSRequestPasscodeUnlockAlertUI();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return _UIContentSizeCategoryCompareToCategory(lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return _UIContentSizeCategoryIsAccessibilityCategory(category);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

uint64_t UIPointRoundToViewScale()
{
  return _UIPointRoundToViewScale();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

pid_t getpid(void)
{
  return _getpid();
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return _os_variant_allows_internal_security_policies();
}

id objc_msgSend_CCUIMenuModuleViewHeight(void *a1, const char *a2, ...)
{
  return [a1 CCUIMenuModuleViewHeight];
}

id objc_msgSend_CCUIMenuModuleViewWidth(void *a1, const char *a2, ...)
{
  return [a1 CCUIMenuModuleViewWidth];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__determineButtonCategorySizeThreshold(void *a1, const char *a2, ...)
{
  return [a1 _determineButtonCategorySizeThreshold];
}

id objc_msgSend__determineButtonWidth(void *a1, const char *a2, ...)
{
  return [a1 _determineButtonWidth];
}

id objc_msgSend__isIPhoneLandscape(void *a1, const char *a2, ...)
{
  return [a1 _isIPhoneLandscape];
}

id objc_msgSend__maxVisibleMenuItems(void *a1, const char *a2, ...)
{
  return [a1 _maxVisibleMenuItems];
}

id objc_msgSend_accessibilityContrast(void *a1, const char *a2, ...)
{
  return [a1 accessibilityContrast];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_activeInterfaceOrientation(void *a1, const char *a2, ...)
{
  return [a1 activeInterfaceOrientation];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_alwaysOnDisplayEnabled(void *a1, const char *a2, ...)
{
  return [a1 alwaysOnDisplayEnabled];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_button(void *a1, const char *a2, ...)
{
  return [a1 button];
}

id objc_msgSend_cameraOn(void *a1, const char *a2, ...)
{
  return [a1 cameraOn];
}

id objc_msgSend_cancelPreviousCountdownRequest(void *a1, const char *a2, ...)
{
  return [a1 cancelPreviousCountdownRequest];
}

id objc_msgSend_cancelRecordingCountdown(void *a1, const char *a2, ...)
{
  return [a1 cancelRecordingCountdown];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_configurationForDefaultMainDisplayMonitor(void *a1, const char *a2, ...)
{
  return [a1 configurationForDefaultMainDisplayMonitor];
}

id objc_msgSend_connectionManagerQueue(void *a1, const char *a2, ...)
{
  return [a1 connectionManagerQueue];
}

id objc_msgSend_contentRenderingMode(void *a1, const char *a2, ...)
{
  return [a1 contentRenderingMode];
}

id objc_msgSend_contentViewController(void *a1, const char *a2, ...)
{
  return [a1 contentViewController];
}

id objc_msgSend_controlCenterApplyPrimaryContentShadow(void *a1, const char *a2, ...)
{
  return [a1 controlCenterApplyPrimaryContentShadow];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentSelectedExtensionIsSystemRecording(void *a1, const char *a2, ...)
{
  return [a1 currentSelectedExtensionIsSystemRecording];
}

id objc_msgSend_currentTimerString(void *a1, const char *a2, ...)
{
  return [a1 currentTimerString];
}

id objc_msgSend_daemonProxy(void *a1, const char *a2, ...)
{
  return [a1 daemonProxy];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_didStartRecordingOrBroadcast(void *a1, const char *a2, ...)
{
  return [a1 didStartRecordingOrBroadcast];
}

id objc_msgSend_displayBacklightLevel(void *a1, const char *a2, ...)
{
  return [a1 displayBacklightLevel];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return [a1 environment];
}

id objc_msgSend_extensionBundleID(void *a1, const char *a2, ...)
{
  return [a1 extensionBundleID];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_getBSServiceInterface(void *a1, const char *a2, ...)
{
  return [a1 getBSServiceInterface];
}

id objc_msgSend_getSystemBroadcastPickerInfo(void *a1, const char *a2, ...)
{
  return [a1 getSystemBroadcastPickerInfo];
}

id objc_msgSend_glyphState(void *a1, const char *a2, ...)
{
  return [a1 glyphState];
}

id objc_msgSend_hideAndStopRecordingBanner(void *a1, const char *a2, ...)
{
  return [a1 hideAndStopRecordingBanner];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_initWithCurrentSession(void *a1, const char *a2, ...)
{
  return [a1 initWithCurrentSession];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidateProcessAssertion(void *a1, const char *a2, ...)
{
  return [a1 invalidateProcessAssertion];
}

id objc_msgSend_isAvailable(void *a1, const char *a2, ...)
{
  return [a1 isAvailable];
}

id objc_msgSend_isAvailableAndInitialized(void *a1, const char *a2, ...)
{
  return [a1 isAvailableAndInitialized];
}

id objc_msgSend_isBroadcastPicker(void *a1, const char *a2, ...)
{
  return [a1 isBroadcastPicker];
}

id objc_msgSend_isCountingDown(void *a1, const char *a2, ...)
{
  return [a1 isCountingDown];
}

id objc_msgSend_isDeviceLocked(void *a1, const char *a2, ...)
{
  return [a1 isDeviceLocked];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isExpanded(void *a1, const char *a2, ...)
{
  return [a1 isExpanded];
}

id objc_msgSend_isMicrophoneEnabled(void *a1, const char *a2, ...)
{
  return [a1 isMicrophoneEnabled];
}

id objc_msgSend_isRecording(void *a1, const char *a2, ...)
{
  return [a1 isRecording];
}

id objc_msgSend_lockUIControls(void *a1, const char *a2, ...)
{
  return [a1 lockUIControls];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_microphoneOn(void *a1, const char *a2, ...)
{
  return [a1 microphoneOn];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return [a1 pointSize];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_preferredExpandedContentHeight(void *a1, const char *a2, ...)
{
  return [a1 preferredExpandedContentHeight];
}

id objc_msgSend_preferredExpandedContentWidth(void *a1, const char *a2, ...)
{
  return [a1 preferredExpandedContentWidth];
}

id objc_msgSend_preferredExtension(void *a1, const char *a2, ...)
{
  return [a1 preferredExtension];
}

id objc_msgSend_recordButtonTapped(void *a1, const char *a2, ...)
{
  return [a1 recordButtonTapped];
}

id objc_msgSend_recordingOn(void *a1, const char *a2, ...)
{
  return [a1 recordingOn];
}

id objc_msgSend_replayKitAngelDisconnected(void *a1, const char *a2, ...)
{
  return [a1 replayKitAngelDisconnected];
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return [a1 safeAreaInsets];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_screenRecordingCameraPip(void *a1, const char *a2, ...)
{
  return [a1 screenRecordingCameraPip];
}

id objc_msgSend_sessionDidFailToStart(void *a1, const char *a2, ...)
{
  return [a1 sessionDidFailToStart];
}

id objc_msgSend_sessionIsStarting(void *a1, const char *a2, ...)
{
  return [a1 sessionIsStarting];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return [a1 setNeedsUpdateConstraints];
}

id objc_msgSend_setUpFrontBoardServices(void *a1, const char *a2, ...)
{
  return [a1 setUpFrontBoardServices];
}

id objc_msgSend_setupCameraButton(void *a1, const char *a2, ...)
{
  return [a1 setupCameraButton];
}

id objc_msgSend_setupConnection(void *a1, const char *a2, ...)
{
  return [a1 setupConnection];
}

id objc_msgSend_setupDisclaimerLabel(void *a1, const char *a2, ...)
{
  return [a1 setupDisclaimerLabel];
}

id objc_msgSend_setupLockScreenNotifications(void *a1, const char *a2, ...)
{
  return [a1 setupLockScreenNotifications];
}

id objc_msgSend_setupMicrophoneButton(void *a1, const char *a2, ...)
{
  return [a1 setupMicrophoneButton];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedRecorder(void *a1, const char *a2, ...)
{
  return [a1 sharedRecorder];
}

id objc_msgSend_shouldShowMicButton(void *a1, const char *a2, ...)
{
  return [a1 shouldShowMicButton];
}

id objc_msgSend_showRecordingBanner(void *a1, const char *a2, ...)
{
  return [a1 showRecordingBanner];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_startRecordingCountdown(void *a1, const char *a2, ...)
{
  return [a1 startRecordingCountdown];
}

id objc_msgSend_stopCurrentSession(void *a1, const char *a2, ...)
{
  return [a1 stopCurrentSession];
}

id objc_msgSend_stopLockScreenNotifications(void *a1, const char *a2, ...)
{
  return [a1 stopLockScreenNotifications];
}

id objc_msgSend_stopRecordingCalled(void *a1, const char *a2, ...)
{
  return [a1 stopRecordingCalled];
}

id objc_msgSend_systemBannerEnabled(void *a1, const char *a2, ...)
{
  return [a1 systemBannerEnabled];
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return [a1 systemRedColor];
}

id objc_msgSend_terminateAngelRecordingSession(void *a1, const char *a2, ...)
{
  return [a1 terminateAngelRecordingSession];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_transitionToCountdownState(void *a1, const char *a2, ...)
{
  return [a1 transitionToCountdownState];
}

id objc_msgSend_updateCameraButtonConstraints(void *a1, const char *a2, ...)
{
  return [a1 updateCameraButtonConstraints];
}

id objc_msgSend_updateCameraState(void *a1, const char *a2, ...)
{
  return [a1 updateCameraState];
}

id objc_msgSend_updateClientState(void *a1, const char *a2, ...)
{
  return [a1 updateClientState];
}

id objc_msgSend_updateDisclaimerLabelConstraints(void *a1, const char *a2, ...)
{
  return [a1 updateDisclaimerLabelConstraints];
}

id objc_msgSend_updateDisclaimerLabelFont(void *a1, const char *a2, ...)
{
  return [a1 updateDisclaimerLabelFont];
}

id objc_msgSend_updateGlyphPackageDescription(void *a1, const char *a2, ...)
{
  return [a1 updateGlyphPackageDescription];
}

id objc_msgSend_updateGlyphState(void *a1, const char *a2, ...)
{
  return [a1 updateGlyphState];
}

id objc_msgSend_updateMicrophoneButtonConstraints(void *a1, const char *a2, ...)
{
  return [a1 updateMicrophoneButtonConstraints];
}

id objc_msgSend_updateMicrophoneState(void *a1, const char *a2, ...)
{
  return [a1 updateMicrophoneState];
}

id objc_msgSend_updateRPCCModuleMenuItems(void *a1, const char *a2, ...)
{
  return [a1 updateRPCCModuleMenuItems];
}

id objc_msgSend_updateRecordButtonLabel(void *a1, const char *a2, ...)
{
  return [a1 updateRecordButtonLabel];
}

id objc_msgSend_updateStateAndUI(void *a1, const char *a2, ...)
{
  return [a1 updateStateAndUI];
}

id objc_msgSend_userInitiated(void *a1, const char *a2, ...)
{
  return [a1 userInitiated];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_weakObjectsPointerArray(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsPointerArray];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}