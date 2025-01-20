void sub_1000050B4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1000050D0(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005184;
  block[3] = &unk_10001C558;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  uint64_t v6 = v3;
  long long v8 = *(_OWORD *)(a1 + 56);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v7);
}

void sub_100005184(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = *(void **)(a1 + 32);
  id v38 = 0;
  id v4 = [v3 statusOfValueForKey:@"duration" error:&v38];
  id v5 = v38;
  uint64_t v6 = *(void **)(a1 + 32);
  id v37 = 0;
  id v7 = [v6 statusOfValueForKey:@"playable" error:&v37];
  id v8 = v37;
  if (v4 == (id)2 && v7 == (id)2)
  {
    v15 = *(void **)(a1 + 32);
    if (v15) {
      [v15 duration];
    }
    else {
      memset(&time1, 0, sizeof(time1));
    }
    CMTimeMake(&time2, 1, 100);
    if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0 && [*(id *)(a1 + 32) isPlayable])
    {
      memset(&block[5], 0, 24);
      v16 = *(void **)(a1 + 32);
      if (v16) {
        [v16 duration];
      }
      CMTime buf = *(CMTime *)&block[5];
      double Seconds = CMTimeGetSeconds(&buf);
      unint64_t v18 = llround(1.0 / Seconds) + 2;
      double v19 = *(double *)(a1 + 56);
      if (v19 > 0.00000011920929)
      {
        v18 += llround(ceil(v19 / Seconds));
        v20 = sub_10000CD44();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          uint64_t v22 = *(void *)(a1 + 32);
          CMTimeValue v21 = *(void *)(a1 + 40);
          uint64_t v23 = *(void *)(a1 + 56);
          LODWORD(buf.value) = 138544130;
          *(CMTimeValue *)((char *)&buf.value + 4) = v21;
          LOWORD(buf.flags) = 2114;
          *(void *)((char *)&buf.flags + 2) = v22;
          HIWORD(buf.epoch) = 2050;
          uint64_t v40 = v23;
          __int16 v41 = 2050;
          unint64_t v42 = v18;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%{public}@: -playbackInLoopWithURL:(%{public}@). audioVolumeRampingDuration = %{public}f, numberOfAdditionalPlayerItemsForAudioVolumeRamping = %{public}lu.", (uint8_t *)&buf, 0x2Au);
        }
      }
      if (v18)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          v25 = +[AVPlayerItem playerItemWithAsset:*(void *)(a1 + 32)];
          if (v25)
          {
            v26 = [*(id *)(a1 + 40) _audioMixForVolumeRampingWithDuration:*(void *)(a1 + 32) toneAsset:i toneAssetDuration:*(double *)(a1 + 56) itemIndex:Seconds];
            if (v26) {
              [v25 setAudioMix:v26];
            }
            v27 = [WeakRetained player];
            [v27 insertItem:v25 afterItem:0];
          }
        }
      }
      dispatch_time_t v28 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 64) * 1000000000.0));
      v12 = dispatch_get_global_queue(25, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100005614;
      block[3] = &unk_10001C530;
      void block[4] = WeakRetained;
      dispatch_after(v28, v12, block);
      goto LABEL_39;
    }
    v12 = sub_10000CD44();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v29 = *(void **)(a1 + 32);
      if (v29) {
        [v29 duration];
      }
      else {
        memset(&time, 0, sizeof(time));
      }
      Float64 v30 = CMTimeGetSeconds(&time);
      unsigned int v31 = [*(id *)(a1 + 32) isPlayable];
      v32 = "NO";
      if (v31) {
        v32 = "YES";
      }
      LODWORD(buf.value) = 134218242;
      *(Float64 *)((char *)&buf.value + 4) = v30;
      LOWORD(buf.flags) = 2080;
      *(void *)((char *)&buf.flags + 2) = v32;
      v14 = "FMDLoopPlayer: Can't loop. Asset duration too short(%1.3f sec) or not playable(isPlayable: %s)";
      goto LABEL_38;
    }
LABEL_39:

    goto LABEL_40;
  }
  if (v4 == (id)3)
  {
    v10 = sub_10000CD44();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      CMTimeValue v11 = *(void *)(a1 + 32);
      LODWORD(buf.value) = 138412546;
      *(CMTimeValue *)((char *)&buf.value + 4) = v11;
      LOWORD(buf.flags) = 2112;
      *(void *)((char *)&buf.flags + 2) = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "FMDLoopPlayer: Failed to load duration property for asset: %@ with error: %@", (uint8_t *)&buf, 0x16u);
    }
  }
  if (v7 == (id)3)
  {
    v12 = sub_10000CD44();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      CMTimeValue v13 = *(void *)(a1 + 32);
      LODWORD(buf.value) = 138412546;
      *(CMTimeValue *)((char *)&buf.value + 4) = v13;
      LOWORD(buf.flags) = 2112;
      *(void *)((char *)&buf.flags + 2) = v8;
      v14 = "FMDLoopPlayer: Failed to load playable property for asset: %@ with error: %@";
LABEL_38:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&buf, 0x16u);
      goto LABEL_39;
    }
    goto LABEL_39;
  }
LABEL_40:
}

void sub_100005614(uint64_t a1)
{
  [*(id *)(a1 + 32) startObservingPlayerAndItem];
  id v2 = [*(id *)(a1 + 32) player];
  [v2 play];
}

uint64_t start()
{
  v0 = sub_10000CD44();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CMTime buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "FindMyDeviceHelperXPCService started", buf, 2u);
  }

  v1 = objc_alloc_init(FindMyDeviceHelperXPCServer);
  id v3 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.icloud.FindMyDevice.FindMyDeviceHelperXPCService"];
  [v3 setDelegate:v1];
  id v4 = sub_10000CD44();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Resuming NSXPCListener", v9, 2u);
  }

  [v3 resume];
  id v5 = sub_10000CD44();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting runloop running", v8, 2u);
  }

  uint64_t v6 = +[NSRunLoop mainRunLoop];
  [v6 run];

  return 0;
}

id sub_100005FF0(uint64_t a1, void *a2)
{
  id v3 = sub_10000CD44();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Received stopLostModeAlarm distributed notification. Stopping the alarm...", v5, 2u);
  }

  return [a2 stopSoundWithCompletion:&stru_10001CFA0];
}

void sub_1000065B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000065F8(uint64_t a1)
{
  id v2 = sub_10000CD44();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Will stop the sound because timer fired", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _stopSound];
}

void sub_10000694C(id a1, NSError *a2)
{
  id v2 = a2;
  id v3 = sub_10000CD44();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stop sound with error: %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100006ACC(id a1)
{
  id v1 = objc_alloc((Class)FMSharedFileContainer);
  id v2 = [v1 initWithIdentifier:off_1000273D8];
  id v3 = [v2 url];
  objc_msgSend(v3, "fm_preferencesPathURLForDomain:", @"FMDAutomationAVRouteController");
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = [objc_alloc((Class)FMDataArchiver) initWithFileURL:v8];
  id v5 = +[NSSet setWithObject:objc_opt_class()];
  uint64_t v6 = [v4 readDictionaryAndClasses:v5 error:0];

  id v7 = [v6 objectForKeyedSubscript:@"FMDAutomationAVRouteControllerAutomationActiveKey"];
  byte_100027688 = [v7 BOOLValue];
}

uint64_t sub_100006D28(uint64_t a1)
{
  qword_100027698 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_100007840(id a1)
{
  id v1 = sub_10000D03C();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Session started by client. [warmup complete]", v2, 2u);
  }
}

void sub_100007B44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100007B90(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100007BA0(uint64_t a1)
{
}

void sub_100007BA8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = [*(id *)(a1 + 32) audioRoutingIdentifier];
  id v4 = [WeakRetained deviceWithAddress:v3];

  if (v4)
  {
    [WeakRetained accessoryManager];
    int ControlCommand = BTAccessoryManagerGetControlCommand();
    uint64_t v6 = sub_10000D03C();
    id v7 = v6;
    if (ControlCommand)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1000107C0(a1 + 32);
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 32) audioRoutingIdentifier];
      int v9 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      int v11 = 138412546;
      v12 = v8;
      __int16 v13 = 1024;
      int v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Got listening mode for accessory address: %@ | mode: %u", (uint8_t *)&v11, 0x12u);
    }
  }
  else
  {
    id v7 = sub_10000D03C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100010734(a1 + 32, v7);
    }
  }

  v10 = *(NSObject **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v10) {
    dispatch_semaphore_signal(v10);
  }
}

void sub_100007EB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100007EDC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [*(id *)(a1 + 32) audioRoutingIdentifier];
  id v4 = [WeakRetained deviceWithAddress:v3];

  if (v4)
  {
    [WeakRetained accessoryManager];
    int v5 = BTAccessoryManagerSendControlCommand();
    uint64_t v6 = sub_10000D03C();
    id v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1000108DC(a1 + 32);
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 32) audioRoutingIdentifier];
      int v9 = *(_DWORD *)(a1 + 48);
      int v10 = 138412546;
      int v11 = v8;
      __int16 v12 = 1024;
      int v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Set listening mode for accessory address: %@ | mode: %u", (uint8_t *)&v10, 0x12u);
    }
  }
  else
  {
    id v7 = sub_10000D03C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100010850(a1 + 32, v7);
    }
  }
}

void sub_100008144(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_100008158(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  [WeakRetained attachToSession];
  id v3 = [WeakRetained futureSession];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100008300;
  v11[3] = &unk_10001D0B0;
  id v12 = a1[4];
  id v13 = a1[5];
  id v4 = [v3 addSuccessBlock:v11];

  objc_initWeak(&location, WeakRetained);
  int v5 = [WeakRetained futureSession];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008384;
  v7[3] = &unk_10001D0D8;
  id v8 = a1[4];
  objc_copyWeak(&v9, &location);
  id v6 = [v5 addFailureBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void sub_1000082DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_100008300(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  id v2 = sub_10000D03C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Session is active. Executing client request block.", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100008384(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v5 = sub_10000D03C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10001096C();
  }

  [WeakRetained detachFromSession];
}

void sub_100008834(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v5 = sub_10000D03C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Callback for BTServiceEvent %u", (uint8_t *)v6, 8u);
  }
}

void sub_100009510(uint64_t a1, int a2, int a3, void *a4)
{
  id v7 = a4;
  id v8 = [v7 bluetoothSessionQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = sub_10000D03C();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CMTime buf = 67109120;
    int v18 = a2;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Callback for BTSessionEvent %u", buf, 8u);
  }

  int v10 = [v7 serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009668;
  block[3] = &unk_10001D168;
  id v13 = v7;
  uint64_t v14 = a1;
  int v15 = a2;
  int v16 = a3;
  id v11 = v7;
  dispatch_sync(v10, block);
}

id *sub_100009668(id *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int v4 = *((_DWORD *)result + 12);
  if (v4 - 2 < 2) {
    return (id *)objc_msgSend(result[4], "sessionTerminated:", result[5], a4);
  }
  if (v4 == 1) {
    return (id *)objc_msgSend(result[4], "sessionDetached:", result[5], a4);
  }
  if (!v4) {
    return (id *)[result[4] sessionAttached:result[5] result:*((unsigned int *)result + 13)];
  }
  return result;
}

void sub_1000096B0(uint64_t a1, int a2)
{
  id v3 = sub_10000D03C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Callback for BTAccessoryEvent %u", (uint8_t *)v4, 8u);
  }
}

void sub_100009754(uint64_t a1, int a2)
{
  id v3 = sub_10000D03C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Callback for BTLocalDeviceStatusEvent %u", (uint8_t *)v4, 8u);
  }
}

void sub_100009810(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void sub_100009830(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000984C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_100009888(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t sub_1000098B4(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t sub_10000A040(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsSoundPlaying:0];
  [*(id *)(a1 + 32) setVolumeTargetValue:0.0];
  [*(id *)(a1 + 32) rampDownDuration];
  objc_msgSend(*(id *)(a1 + 32), "setFadeDuration:");
  [*(id *)(a1 + 32) rampDownDuration];
  id v2 = *(void **)(a1 + 32);
  if (v3 <= 0.0) {
    [v2 stopSound];
  }
  else {
    [v2 fade];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void sub_10000B82C(uint64_t a1)
{
  id v2 = sub_10000CD44();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1000112DC(v2);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained fade];
}

uint64_t sub_10000BFAC(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    id v2 = sub_10000CD44();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = objc_retainBlock(*(id *)(v1 + 32));
      int v4 = 138412290;
      id v5 = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController Calling initial completion block %@", (uint8_t *)&v4, 0xCu);
    }
    return (*(uint64_t (**)(void))(*(void *)(v1 + 32) + 16))();
  }
  return result;
}

uint64_t sub_10000C3D0(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    id v2 = sub_10000CD44();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = objc_retainBlock(*(id *)(v1 + 32));
      int v4 = 138412290;
      id v5 = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController Calling initial completion block %@", (uint8_t *)&v4, 0xCu);
    }
    return (*(uint64_t (**)(void))(*(void *)(v1 + 32) + 16))();
  }
  return result;
}

double sub_10000CA74(float a1)
{
  return a1;
}

void sub_10000CA90(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_10000CB04(id a1)
{
  qword_1000276B0 = objc_alloc_init(FMDAutomationHelperFactory);

  _objc_release_x1();
}

id sub_10000CD44()
{
  if (qword_1000276C0 != -1) {
    dispatch_once(&qword_1000276C0, &stru_10001D228);
  }
  v0 = (void *)qword_1000276C8;

  return v0;
}

void sub_10000CD98(id a1)
{
  qword_1000276C8 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "_");

  _objc_release_x1();
}

id sub_10000CDDC()
{
  if (qword_1000276D0 != -1) {
    dispatch_once(&qword_1000276D0, &stru_10001D248);
  }
  v0 = (void *)qword_1000276D8;

  return v0;
}

void sub_10000CE30(id a1)
{
  qword_1000276D8 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "locations");

  _objc_release_x1();
}

id sub_10000CE74()
{
  if (qword_1000276E0 != -1) {
    dispatch_once(&qword_1000276E0, &stru_10001D268);
  }
  v0 = (void *)qword_1000276E8;

  return v0;
}

void sub_10000CEC8(id a1)
{
  qword_1000276E8 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "accessory");

  _objc_release_x1();
}

id sub_10000CF0C()
{
  if (qword_1000276F0 != -1) {
    dispatch_once(&qword_1000276F0, &stru_10001D288);
  }
  v0 = (void *)qword_1000276F8;

  return v0;
}

void sub_10000CF60(id a1)
{
  qword_1000276F8 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "traffic");

  _objc_release_x1();
}

id sub_10000CFA4()
{
  if (qword_100027700 != -1) {
    dispatch_once(&qword_100027700, &stru_10001D2A8);
  }
  v0 = (void *)qword_100027708;

  return v0;
}

void sub_10000CFF8(id a1)
{
  qword_100027708 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "encoder");

  _objc_release_x1();
}

id sub_10000D03C()
{
  if (qword_100027710 != -1) {
    dispatch_once(&qword_100027710, &stru_10001D2C8);
  }
  v0 = (void *)qword_100027718;

  return v0;
}

void sub_10000D090(id a1)
{
  qword_100027718 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "bluetoothsession");

  _objc_release_x1();
}

id sub_10000D0D4()
{
  if (qword_100027720 != -1) {
    dispatch_once(&qword_100027720, &stru_10001D2E8);
  }
  v0 = (void *)qword_100027728;

  return v0;
}

void sub_10000D128(id a1)
{
  qword_100027728 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "extensions");

  _objc_release_x1();
}

id sub_10000D16C()
{
  if (qword_100027730 != -1) {
    dispatch_once(&qword_100027730, &stru_10001D308);
  }
  v0 = (void *)qword_100027738;

  return v0;
}

void sub_10000D1C0(id a1)
{
  qword_100027738 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "extensions_playSound");

  _objc_release_x1();
}

id sub_10000D204()
{
  if (qword_100027740 != -1) {
    dispatch_once(&qword_100027740, &stru_10001D328);
  }
  v0 = (void *)qword_100027748;

  return v0;
}

void sub_10000D258(id a1)
{
  qword_100027748 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "secureLocations");

  _objc_release_x1();
}

id sub_10000D29C()
{
  if (qword_100027750 != -1) {
    dispatch_once(&qword_100027750, &stru_10001D348);
  }
  v0 = (void *)qword_100027758;

  return v0;
}

void sub_10000D2F0(id a1)
{
  qword_100027758 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "healUCRT");

  _objc_release_x1();
}

id sub_10000D334()
{
  if (qword_100027760 != -1) {
    dispatch_once(&qword_100027760, &stru_10001D368);
  }
  v0 = (void *)qword_100027768;

  return v0;
}

void sub_10000D388(id a1)
{
  qword_100027768 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "repairDevice");

  _objc_release_x1();
}

id sub_10000D3CC()
{
  if (qword_100027770 != -1) {
    dispatch_once(&qword_100027770, &stru_10001D388);
  }
  v0 = (void *)qword_100027778;

  return v0;
}

void sub_10000D420(id a1)
{
  qword_100027778 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "ALFailureAnalytics");

  _objc_release_x1();
}

id sub_10000D464()
{
  if (qword_100027780 != -1) {
    dispatch_once(&qword_100027780, &stru_10001D3A8);
  }
  v0 = (void *)qword_100027788;

  return v0;
}

void sub_10000D4B8(id a1)
{
  qword_100027788 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "disableLocationDisplay");

  _objc_release_x1();
}

id sub_10000D4FC()
{
  if (qword_100027790 != -1) {
    dispatch_once(&qword_100027790, &stru_10001D3C8);
  }
  v0 = (void *)qword_100027798;

  return v0;
}

void sub_10000D550(id a1)
{
  qword_100027798 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "accountRatchet");

  _objc_release_x1();
}

id sub_10000D594()
{
  if (qword_1000277A0 != -1) {
    dispatch_once(&qword_1000277A0, &stru_10001D3E8);
  }
  v0 = (void *)qword_1000277A8;

  return v0;
}

void sub_10000D5E8(id a1)
{
  qword_1000277A8 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "ownerAuthentication");

  _objc_release_x1();
}

id sub_10000D62C()
{
  if (qword_1000277B0 != -1) {
    dispatch_once(&qword_1000277B0, &stru_10001D408);
  }
  v0 = (void *)qword_1000277B8;

  return v0;
}

void sub_10000D680(id a1)
{
  if (+[FMPreferencesUtil BOOLForKey:@"ShowAutomationLogs" inDomain:@"com.apple.icloud.findmydeviced.notbackedup"])
  {
    qword_1000277B8 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "automation");
    _objc_release_x1();
  }
}

void sub_10000DCA0(uint64_t a1)
{
  double v2 = *(double *)(a1 + 64);
  double v3 = 5.0;
  if (v2 >= 5.0) {
    double v3 = *(double *)(a1 + 64);
  }
  if (v2 >= 0.0) {
    double v4 = v3;
  }
  else {
    double v4 = 0.0;
  }
  id v5 = [*(id *)(a1 + 32) accessoryAudioController];
  [v5 setRampUpDuration:v4];

  id v6 = [*(id *)(a1 + 32) accessoryAudioController];
  id v7 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000DDB8;
  v9[3] = &unk_10001D468;
  v9[4] = *(void *)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 72);
  id v10 = v7;
  id v11 = *(id *)(a1 + 56);
  [v6 startPlayingSoundForAccessory:v10 channels:v8 completion:v9];
}

void sub_10000DDB8(void *a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000DE7C;
    block[3] = &unk_10001D440;
    double v4 = (void *)a1[5];
    void block[4] = a1[4];
    uint64_t v8 = a1[7];
    id v7 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  uint64_t v5 = a1[6];
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

id sub_10000DE7C(uint64_t a1)
{
  [*(id *)(a1 + 32) setTimeoutForDuration:*(double *)(a1 + 48)];
  double v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setCurrentAccessory:v3];
}

void sub_10000E28C(uint64_t a1)
{
  if (*(double *)(a1 + 56) >= 0.0) {
    double v2 = *(double *)(a1 + 56);
  }
  else {
    double v2 = 0.0;
  }
  uint64_t v3 = [*(id *)(a1 + 32) accessoryAudioController];
  [v3 setRampDownDuration:v2];

  double v4 = [*(id *)(a1 + 32) accessoryAudioController];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_10000E374;
  v6[3] = &unk_10001D4B8;
  uint64_t v5 = *(void *)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 48);
  [v4 stopPlayingForAccessory:v5 completion:v6];
}

void sub_10000E374(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(a1 + 32) invalidateStopSoundTimer];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

void sub_10000E694(uint64_t a1)
{
  double v2 = *(double *)(a1 + 56);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000E81C;
  v14[3] = &unk_10001D530;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(a1 + 48);
  id v15 = v3;
  uint64_t v16 = v4;
  id v17 = v5;
  id v6 = +[NSTimer timerWithTimeInterval:0 repeats:v14 block:v2];
  id v7 = +[NSRunLoop currentRunLoop];
  [v7 addTimer:v6 forMode:NSRunLoopCommonModes];

  uint64_t v8 = [*(id *)(a1 + 40) accessoryAudioController];
  uint64_t v9 = *(void *)(a1 + 32);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000EA30;
  v11[3] = &unk_10001D4B8;
  id v12 = v6;
  id v13 = *(id *)(a1 + 48);
  id v10 = v6;
  [v8 startMonitoringRoutableAccessory:v9 completion:v11];
}

void sub_10000E81C(uint64_t a1)
{
  id v2 = objc_alloc((Class)NSError);
  NSErrorUserInfoKey v20 = NSLocalizedFailureReasonErrorKey;
  id v3 = +[NSString stringWithFormat:@"waitForRoutableAccessory timeout exausted for accessory %@", *(void *)(a1 + 32)];
  CMTimeValue v21 = v3;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  id v5 = [v2 initWithDomain:@"com.apple.icloud.FindMyDevice" code:4 userInfo:v4];

  id v6 = sub_10000CD44();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = [*(id *)(a1 + 40) accessoryAudioController];
    *(_DWORD *)CMTime buf = 138412546;
    uint64_t v17 = v7;
    __int16 v18 = 2112;
    double v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Wait timer fired for accessory: %@ %@", buf, 0x16u);
  }
  uint64_t v9 = [*(id *)(a1 + 40) accessoryAudioController];
  uint64_t v10 = *(void *)(a1 + 32);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000EA10;
  v13[3] = &unk_10001D508;
  id v11 = *(id *)(a1 + 48);
  id v14 = v5;
  id v15 = v11;
  id v12 = v5;
  [v9 stopMonitoringRoutableAccessory:v10 completion:v13];
}

uint64_t sub_10000EA10(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void sub_10000EA30(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(a1 + 32) invalidate];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

id sub_10000FA20(uint64_t a1)
{
  id v2 = sub_10000CD44();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "XPC invalidation handler called", v4, 2u);
  }

  return [*(id *)(a1 + 32) stopSoundWithCompletion:&stru_10001D550];
}

void sub_10000FA9C(id a1, NSError *a2)
{
  id v2 = a2;
  uint64_t v3 = sub_10000CD44();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100011484();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Sound stopped due to XPC invalidation", v5, 2u);
  }
}

void sub_10001062C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10001065C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error getting sound URL", v1, 2u);
}

void sub_1000106A0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Cannot disable biometry - (Missing Framework)", v1, 2u);
}

void sub_1000106E4(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_10000984C((void *)&_mh_execute_header, a3, (uint64_t)a3, "Timeout getting listening mode for accessory address: %@", (uint8_t *)a2);
}

void sub_100010734(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = [(id)sub_1000098B4(a1) audioRoutingIdentifier];
  sub_1000098A8();
  sub_10000984C((void *)&_mh_execute_header, a2, v4, "Failed to get btdevice for listening mode using accessory address: %@", v5);
}

void sub_1000107C0(uint64_t a1)
{
  uint64_t v1 = [(id)sub_1000098B4(a1) audioRoutingIdentifier];
  sub_100009864();
  sub_100009888((void *)&_mh_execute_header, v2, v3, "Failed to get listening mode for accessory address: %@ | result: %d", v4, v5, v6, v7, v8);
}

void sub_100010850(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = [(id)sub_1000098B4(a1) audioRoutingIdentifier];
  sub_1000098A8();
  sub_10000984C((void *)&_mh_execute_header, a2, v4, "Failed to update btdevice listening mode on accessory address: %@", v5);
}

void sub_1000108DC(uint64_t a1)
{
  uint64_t v1 = [(id)sub_1000098B4(a1) audioRoutingIdentifier];
  sub_100009864();
  sub_100009888((void *)&_mh_execute_header, v2, v3, "Failed to set listening mode for accessory address: %@ | result: %d", v4, v5, v6, v7, v8);
}

void sub_10001096C()
{
  sub_1000098A8();
  sub_10000984C((void *)&_mh_execute_header, v0, v1, "Error in bluetooth session interface, detaching. Pending actions have been discarded. %@", v2);
}

void sub_1000109D8()
{
  sub_10000987C();
  sub_100009830((void *)&_mh_execute_header, v0, v1, "Failed getting BTDevice address from nil / empty address string.", v2, v3, v4, v5, v6);
}

void sub_100010A0C()
{
  sub_1000098A8();
  sub_10000984C((void *)&_mh_execute_header, v0, v1, "Cannot get BTDevice: No session. Address: %@", v2);
}

void sub_100010A78()
{
  sub_1000097F8();
  sub_100009810((void *)&_mh_execute_header, v0, v1, "Failed getting BTDevice from BTDeviceAddress %@ %d");
}

void sub_100010AE0()
{
  sub_1000097F8();
  sub_100009810((void *)&_mh_execute_header, v0, v1, "Failed getting BTDevice address from address string %@ %d");
}

void sub_100010B48(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Session failed to attach: %u", (uint8_t *)v2, 8u);
}

void sub_100010BC0()
{
  sub_10000987C();
  sub_100009830((void *)&_mh_execute_header, v0, v1, "Detached session is not the active session. Ignoring.", v2, v3, v4, v5, v6);
}

void sub_100010BF4()
{
  sub_10000987C();
  sub_100009830((void *)&_mh_execute_header, v0, v1, "Terminated session is not the active session. Ignoring.", v2, v3, v4, v5, v6);
}

void sub_100010C28(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed attaching to session %d", (uint8_t *)v2, 8u);
}

void sub_100010CA0()
{
  sub_10000987C();
  sub_100009830((void *)&_mh_execute_header, v0, v1, "Failed to set up accessory manager. Missing session.", v2, v3, v4, v5, v6);
}

void sub_100010CD4()
{
  sub_1000097F8();
  sub_100009810((void *)&_mh_execute_header, v0, v1, "Failed getting default accessory manager from session: %p, result: %d", v2, v3);
}

void sub_100010D3C()
{
  sub_10000987C();
  sub_100009830((void *)&_mh_execute_header, v0, v1, "Failed to set up local device. Missing session.", v2, v3, v4, v5, v6);
}

void sub_100010D70()
{
  sub_1000097F8();
  sub_100009810((void *)&_mh_execute_header, v0, v1, "Failed getting default local device from session %p. Result: %d.", v2, v3);
}

void sub_100010DD8()
{
  sub_1000098A8();
  sub_10000984C((void *)&_mh_execute_header, v0, v1, "FMDAccessoryAudioController cannot pick route to accessory. Aborting, %@", v2);
}

void sub_100010E44()
{
  sub_1000098A8();
  sub_10000984C((void *)&_mh_execute_header, v0, v1, "FMDAccessoryAudioController cannot route audio to accessory %@", v2);
}

void sub_100010EB0(void *a1, NSObject *a2)
{
  int v3 = [a1 routeID];
  sub_1000098A8();
  sub_10000984C((void *)&_mh_execute_header, a2, v4, "AccessoryAudioController unable to set maximum volume, please file a bug to Core Audio %@", v5);
}

void sub_100010F3C(void *a1, NSObject *a2)
{
  int v3 = [a1 routeID];
  sub_1000098A8();
  sub_10000984C((void *)&_mh_execute_header, a2, v4, "AccessoryAudioController unable to get original volume %@", v5);
}

void sub_100010FC8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Creating fade timer", v1, 2u);
}

void sub_10001100C(void *a1)
{
  uint64_t v2 = [a1 audioPlayer];
  [v2 pan];
  [a1 panTargetValue];
  sub_10000CA74(v3);
  sub_10000CA90((void *)&_mh_execute_header, v4, v5, "Panning to %f targetValue: %f", v6, v7, v8, v9, v10);
}

void sub_1000110B4(void *a1)
{
  uint64_t v2 = [a1 audioPlayer];
  [v2 pan];
  [a1 panTargetValue];
  sub_10000CA74(v3);
  sub_10000CA90((void *)&_mh_execute_header, v4, v5, "Stopping pan at %f target: %f", v6, v7, v8, v9, v10);
}

void sub_10001115C(void *a1, NSObject *a2, double a3)
{
  uint64_t v6 = [a1 audioPlayer];
  [v6 volume];
  double v8 = v7;
  [a1 volumeTargetValue];
  int v10 = 134218496;
  double v11 = v8;
  __int16 v12 = 2048;
  double v13 = v9;
  __int16 v14 = 2048;
  double v15 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Fading to %f targetValue: %f interval: %f", (uint8_t *)&v10, 0x20u);
}

void sub_100011234(void *a1)
{
  uint64_t v2 = [a1 audioPlayer];
  [v2 volume];
  [a1 volumeTargetValue];
  sub_10000CA74(v3);
  sub_10000CA90((void *)&_mh_execute_header, v4, v5, "Stopping fade at %f target: %f", v6, v7, v8, v9, v10);
}

void sub_1000112DC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Fade timer fired", v1, 2u);
}

void sub_100011320(uint64_t a1, NSObject *a2)
{
  v2[0] = 67109378;
  v2[1] = 0;
  __int16 v3 = 2112;
  uint64_t v4 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "FMDAccessoryAudioController unable to restore unknown listening mode %u for accessory %@", (uint8_t *)v2, 0x12u);
}

void sub_1000113A4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not find class %@ in the automation bundle", (uint8_t *)&v2, 0xCu);
}

void sub_10001141C()
{
  sub_1000098A8();
  sub_10001062C((void *)&_mh_execute_header, v0, v1, "%@", v2, v3, v4, v5, v6);
}

void sub_100011484()
{
  sub_1000098A8();
  sub_10001062C((void *)&_mh_execute_header, v0, v1, "Error stopping the sound: %@", v2, v3, v4, v5, v6);
}

void sub_1000114EC(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 lastPathComponent];
  sub_100010648();
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Error excluding %@ from backup %@", v6, 0x16u);
}

void sub_100011590()
{
  sub_100010648();
  uint64_t v3 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Error creating the directory %@: %@", v2, 0x16u);
}

void sub_10001160C()
{
  sub_1000098A8();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Need to update Lost Mode in file %@", v1, 0xCu);
}

void sub_100011680(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Removing Managed Lost Mode file", v1, 2u);
}

void sub_1000116C4()
{
  sub_1000098A8();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Need to disable Lost Mode in file %@", v1, 0xCu);
}

void sub_100011738()
{
  sub_1000098A8();
  sub_10001062C((void *)&_mh_execute_header, v0, v1, "Error disabling Biometry ID : %@", v2, v3, v4, v5, v6);
}

uint64_t BTAccessoryManagerAddCallbacks()
{
  return _BTAccessoryManagerAddCallbacks();
}

uint64_t BTAccessoryManagerGetControlCommand()
{
  return _BTAccessoryManagerGetControlCommand();
}

uint64_t BTAccessoryManagerGetDefault()
{
  return _BTAccessoryManagerGetDefault();
}

uint64_t BTAccessoryManagerRemoveCallbacks()
{
  return _BTAccessoryManagerRemoveCallbacks();
}

uint64_t BTAccessoryManagerSendControlCommand()
{
  return _BTAccessoryManagerSendControlCommand();
}

uint64_t BTDeviceAddressFromString()
{
  return _BTDeviceAddressFromString();
}

uint64_t BTDeviceFromAddress()
{
  return _BTDeviceFromAddress();
}

uint64_t BTLocalDeviceAddCallbacks()
{
  return _BTLocalDeviceAddCallbacks();
}

uint64_t BTLocalDeviceGetDefault()
{
  return _BTLocalDeviceGetDefault();
}

uint64_t BTLocalDeviceRemoveCallbacks()
{
  return _BTLocalDeviceRemoveCallbacks();
}

uint64_t BTServiceAddCallbacks()
{
  return _BTServiceAddCallbacks();
}

uint64_t BTServiceRemoveCallbacks()
{
  return _BTServiceRemoveCallbacks();
}

uint64_t BTSessionAttachWithQueue()
{
  return _BTSessionAttachWithQueue();
}

uint64_t BTSessionDetachWithQueue()
{
  return _BTSessionDetachWithQueue();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return _CMTimeCompare(time1, time2);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  return _CMTimeGetSeconds(time);
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return _CMTimeMake(retstr, value, timescale);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return _CMTimeMakeWithSeconds(retstr, seconds, preferredTimescale);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return _CMTimeRangeMake(retstr, start, duration);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

float exp2f(float a1)
{
  return _exp2f(a1);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
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

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__audioCategory(void *a1, const char *a2, ...)
{
  return [a1 _audioCategory];
}

id objc_msgSend__disableBiometricID(void *a1, const char *a2, ...)
{
  return [a1 _disableBiometricID];
}

id objc_msgSend__stopSound(void *a1, const char *a2, ...)
{
  return [a1 _stopSound];
}

id objc_msgSend__vibrationPattern(void *a1, const char *a2, ...)
{
  return [a1 _vibrationPattern];
}

id objc_msgSend_accessoryAudioController(void *a1, const char *a2, ...)
{
  return [a1 accessoryAudioController];
}

id objc_msgSend_accessoryIdentifier(void *a1, const char *a2, ...)
{
  return [a1 accessoryIdentifier];
}

id objc_msgSend_accessoryManager(void *a1, const char *a2, ...)
{
  return [a1 accessoryManager];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attachToSession(void *a1, const char *a2, ...)
{
  return [a1 attachToSession];
}

id objc_msgSend_audioMix(void *a1, const char *a2, ...)
{
  return [a1 audioMix];
}

id objc_msgSend_audioPlayer(void *a1, const char *a2, ...)
{
  return [a1 audioPlayer];
}

id objc_msgSend_audioRoutingIdentifier(void *a1, const char *a2, ...)
{
  return [a1 audioRoutingIdentifier];
}

id objc_msgSend_audioURL(void *a1, const char *a2, ...)
{
  return [a1 audioURL];
}

id objc_msgSend_automationHelperBundle(void *a1, const char *a2, ...)
{
  return [a1 automationHelperBundle];
}

id objc_msgSend_auxiliarySession(void *a1, const char *a2, ...)
{
  return [a1 auxiliarySession];
}

id objc_msgSend_availableDevices(void *a1, const char *a2, ...)
{
  return [a1 availableDevices];
}

id objc_msgSend_bluetoothSessionInterface(void *a1, const char *a2, ...)
{
  return [a1 bluetoothSessionInterface];
}

id objc_msgSend_bluetoothSessionQueue(void *a1, const char *a2, ...)
{
  return [a1 bluetoothSessionQueue];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentAccessory(void *a1, const char *a2, ...)
{
  return [a1 currentAccessory];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_currentItem(void *a1, const char *a2, ...)
{
  return [a1 currentItem];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_currentThread(void *a1, const char *a2, ...)
{
  return [a1 currentThread];
}

id objc_msgSend_currentlyPicked(void *a1, const char *a2, ...)
{
  return [a1 currentlyPicked];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_detachFromSession(void *a1, const char *a2, ...)
{
  return [a1 detachFromSession];
}

id objc_msgSend_disableBiometricID(void *a1, const char *a2, ...)
{
  return [a1 disableBiometricID];
}

id objc_msgSend_disableSlideToUnlock(void *a1, const char *a2, ...)
{
  return [a1 disableSlideToUnlock];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_facetimeCapable(void *a1, const char *a2, ...)
{
  return [a1 facetimeCapable];
}

id objc_msgSend_fade(void *a1, const char *a2, ...)
{
  return [a1 fade];
}

id objc_msgSend_fadeDuration(void *a1, const char *a2, ...)
{
  return [a1 fadeDuration];
}

id objc_msgSend_finishWithNoResult(void *a1, const char *a2, ...)
{
  return [a1 finishWithNoResult];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_footnoteText(void *a1, const char *a2, ...)
{
  return [a1 footnoteText];
}

id objc_msgSend_futureSession(void *a1, const char *a2, ...)
{
  return [a1 futureSession];
}

id objc_msgSend_getManagedLostModeFileURL(void *a1, const char *a2, ...)
{
  return [a1 getManagedLostModeFileURL];
}

id objc_msgSend_getNeedsLocateAckLostModeFileURL(void *a1, const char *a2, ...)
{
  return [a1 getNeedsLocateAckLostModeFileURL];
}

id objc_msgSend_hasAttemptedLoad(void *a1, const char *a2, ...)
{
  return [a1 hasAttemptedLoad];
}

id objc_msgSend_initializeNotifications(void *a1, const char *a2, ...)
{
  return [a1 initializeNotifications];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidateStopSoundTimer(void *a1, const char *a2, ...)
{
  return [a1 invalidateStopSoundTimer];
}

id objc_msgSend_isAutomationActive(void *a1, const char *a2, ...)
{
  return [a1 isAutomationActive];
}

id objc_msgSend_isEntitled(void *a1, const char *a2, ...)
{
  return [a1 isEntitled];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return [a1 isMainThread];
}

id objc_msgSend_isPlayable(void *a1, const char *a2, ...)
{
  return [a1 isPlayable];
}

id objc_msgSend_isSoundPlaying(void *a1, const char *a2, ...)
{
  return [a1 isSoundPlaying];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return [a1 items];
}

id objc_msgSend_lastAccessory(void *a1, const char *a2, ...)
{
  return [a1 lastAccessory];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_listeningMode(void *a1, const char *a2, ...)
{
  return [a1 listeningMode];
}

id objc_msgSend_localDevice(void *a1, const char *a2, ...)
{
  return [a1 localDevice];
}

id objc_msgSend_loopPlayer(void *a1, const char *a2, ...)
{
  return [a1 loopPlayer];
}

id objc_msgSend_lostModeEnabled(void *a1, const char *a2, ...)
{
  return [a1 lostModeEnabled];
}

id objc_msgSend_lostModeType(void *a1, const char *a2, ...)
{
  return [a1 lostModeType];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return [a1 manager];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_messageAudioController(void *a1, const char *a2, ...)
{
  return [a1 messageAudioController];
}

id objc_msgSend_monitoredAccessories(void *a1, const char *a2, ...)
{
  return [a1 monitoredAccessories];
}

id objc_msgSend_monitoredAccessoriesCompletionBlocks(void *a1, const char *a2, ...)
{
  return [a1 monitoredAccessoriesCompletionBlocks];
}

id objc_msgSend_originalRoute(void *a1, const char *a2, ...)
{
  return [a1 originalRoute];
}

id objc_msgSend_originalState(void *a1, const char *a2, ...)
{
  return [a1 originalState];
}

id objc_msgSend_pan(void *a1, const char *a2, ...)
{
  return [a1 pan];
}

id objc_msgSend_panTargetValue(void *a1, const char *a2, ...)
{
  return [a1 panTargetValue];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return [a1 pause];
}

id objc_msgSend_phoneNumber(void *a1, const char *a2, ...)
{
  return [a1 phoneNumber];
}

id objc_msgSend_pickedRoute(void *a1, const char *a2, ...)
{
  return [a1 pickedRoute];
}

id objc_msgSend_play(void *a1, const char *a2, ...)
{
  return [a1 play];
}

id objc_msgSend_player(void *a1, const char *a2, ...)
{
  return [a1 player];
}

id objc_msgSend_prepareToPlay(void *a1, const char *a2, ...)
{
  return [a1 prepareToPlay];
}

id objc_msgSend_rampDownDuration(void *a1, const char *a2, ...)
{
  return [a1 rampDownDuration];
}

id objc_msgSend_rampUpDuration(void *a1, const char *a2, ...)
{
  return [a1 rampUpDuration];
}

id objc_msgSend_rawRouteInfo(void *a1, const char *a2, ...)
{
  return [a1 rawRouteInfo];
}

id objc_msgSend_recalculateLostMode(void *a1, const char *a2, ...)
{
  return [a1 recalculateLostMode];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_routeController(void *a1, const char *a2, ...)
{
  return [a1 routeController];
}

id objc_msgSend_routeID(void *a1, const char *a2, ...)
{
  return [a1 routeID];
}

id objc_msgSend_routeSubType(void *a1, const char *a2, ...)
{
  return [a1 routeSubType];
}

id objc_msgSend_routeType(void *a1, const char *a2, ...)
{
  return [a1 routeType];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_serialQueue(void *a1, const char *a2, ...)
{
  return [a1 serialQueue];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return [a1 session];
}

id objc_msgSend_setUpAccessoryManager(void *a1, const char *a2, ...)
{
  return [a1 setUpAccessoryManager];
}

id objc_msgSend_setUpLocalDevice(void *a1, const char *a2, ...)
{
  return [a1 setUpLocalDevice];
}

id objc_msgSend_setupAudioSession(void *a1, const char *a2, ...)
{
  return [a1 setupAudioSession];
}

id objc_msgSend_sharedAVSystemController(void *a1, const char *a2, ...)
{
  return [a1 sharedAVSystemController];
}

id objc_msgSend_sharedFactory(void *a1, const char *a2, ...)
{
  return [a1 sharedFactory];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_soundDidStop(void *a1, const char *a2, ...)
{
  return [a1 soundDidStop];
}

id objc_msgSend_soundDuration(void *a1, const char *a2, ...)
{
  return [a1 soundDuration];
}

id objc_msgSend_soundName(void *a1, const char *a2, ...)
{
  return [a1 soundName];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startObserving(void *a1, const char *a2, ...)
{
  return [a1 startObserving];
}

id objc_msgSend_startObservingPlayerAndItem(void *a1, const char *a2, ...)
{
  return [a1 startObservingPlayerAndItem];
}

id objc_msgSend_startSession(void *a1, const char *a2, ...)
{
  return [a1 startSession];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_stopObserving(void *a1, const char *a2, ...)
{
  return [a1 stopObserving];
}

id objc_msgSend_stopObservingPlayerAndItem(void *a1, const char *a2, ...)
{
  return [a1 stopObservingPlayerAndItem];
}

id objc_msgSend_stopSound(void *a1, const char *a2, ...)
{
  return [a1 stopSound];
}

id objc_msgSend_stopSoundTimer(void *a1, const char *a2, ...)
{
  return [a1 stopSoundTimer];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_supportsChangingListeningMode(void *a1, const char *a2, ...)
{
  return [a1 supportsChangingListeningMode];
}

id objc_msgSend_tearDownAccessoryManager(void *a1, const char *a2, ...)
{
  return [a1 tearDownAccessoryManager];
}

id objc_msgSend_tearDownLocalDevice(void *a1, const char *a2, ...)
{
  return [a1 tearDownLocalDevice];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_userID(void *a1, const char *a2, ...)
{
  return [a1 userID];
}

id objc_msgSend_vibrate(void *a1, const char *a2, ...)
{
  return [a1 vibrate];
}

id objc_msgSend_volume(void *a1, const char *a2, ...)
{
  return [a1 volume];
}

id objc_msgSend_volumeTargetValue(void *a1, const char *a2, ...)
{
  return [a1 volumeTargetValue];
}

id objc_msgSend_wasSoundPlayed(void *a1, const char *a2, ...)
{
  return [a1 wasSoundPlayed];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}