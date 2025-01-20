uint64_t RPLogSetLogLevel(uint64_t result)
{
  if (result <= 3) {
    __RPLogLevel = result;
  }
  return result;
}

uint64_t sub_100004F9C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(v3 + 16))(v3, 0, a2);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

void sub_100005470(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) status];
  if (v2 == (id)5)
  {
    if (__RPLogLevel > 1 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    *(_DWORD *)v6 = 136446466;
    *(void *)&v6[4] = "+[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:]_block_invoke";
    *(_WORD *)&v6[12] = 1024;
    *(_DWORD *)&v6[14] = 72;
    uint64_t v3 = " [INFO] %{public}s:%d AVAssetExportSessionStatusCancelled";
    goto LABEL_9;
  }
  if (v2 == (id)4)
  {
    if (__RPLogLevel > 1 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    *(_DWORD *)v6 = 136446466;
    *(void *)&v6[4] = "+[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:]_block_invoke";
    *(_WORD *)&v6[12] = 1024;
    *(_DWORD *)&v6[14] = 67;
    uint64_t v3 = " [INFO] %{public}s:%d AVAssetExportSessionFailed";
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v3, v6, 0x12u);
LABEL_10:
    uint64_t v4 = *(void *)(a1 + 40);
    v5 = +[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5818, 0, *(_OWORD *)v6, *(void *)&v6[16]);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

    return;
  }
  if (__RPLogLevel <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v6 = 136446466;
    *(void *)&v6[4] = "+[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:]_block_invoke";
    *(_WORD *)&v6[12] = 1024;
    *(_DWORD *)&v6[14] = 77;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d AVAssetExportSession returned with no errors", v6, 0x12u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100005C3C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_100005CB4(id a1)
{
  byte_10001F138 = MGGetSInt32Answer() != 2;
}

void sub_100006E1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
}

void sub_100006E48(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned __int8 v3 = [WeakRetained isScrubbing];

  if ((v3 & 1) == 0)
  {
    id v4 = objc_loadWeakRetained(v1);
    v5 = [v4 avPlayer];
    v6 = [v5 currentItem];
    v7 = v6;
    if (v6) {
      [v6 currentTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    double Seconds = CMTimeGetSeconds(&time);
    id v9 = objc_loadWeakRetained(v1);
    v10 = [v9 avTrimmer];
    [v10 setValue:Seconds];
  }
}

void sub_1000081B8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) topToolBar];
  [v2 setAlpha:1.0];

  unsigned __int8 v3 = [*(id *)(a1 + 32) bottomToolBar];
  [v3 setAlpha:1.0];

  id v4 = [*(id *)(a1 + 32) scrubberContainterView];
  [v4 setAlpha:1.0];
}

void sub_1000082D4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) topToolBar];
  [v2 setAlpha:0.0];

  unsigned __int8 v3 = [*(id *)(a1 + 32) bottomToolBar];
  [v3 setAlpha:0.0];

  id v4 = [*(id *)(a1 + 32) scrubberContainterView];
  [v4 setAlpha:0.0];
}

id sub_100008810(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) topToolBar];
  [v2 setItems:0];

  unsigned __int8 v3 = [*(id *)(a1 + 32) bottomToolBar];
  [v3 setItems:0];

  [*(id *)(a1 + 32) refreshAVRotation];
  unsigned int v4 = [*(id *)(a1 + 32) shouldApplyPadUILayout];
  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    return [v5 applyPadUILayout];
  }
  else
  {
    return [v5 applyPhoneUILayout];
  }
}

void sub_100009084(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000090C0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained pauseAction];
}

void sub_100009650(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000F37C();
    }
  }
  else
  {
    v7 = +[NSFileManager defaultManager];
    v8 = [*(id *)(a1 + 32) videoURL];
    [v7 _srRemoveFile:v8 completion:&stru_100018648];

    [*(id *)(a1 + 32) setVideoURL:v5];
  }
  id v9 = +[PHPhotoLibrary sharedPhotoLibrary];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000097D8;
  v11[3] = &unk_100018578;
  uint64_t v12 = *(void *)(a1 + 32);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000983C;
  v10[3] = &unk_100018698;
  v10[4] = v12;
  [v9 performChanges:v11 completionHandler:v10];
}

void sub_1000097D8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) videoURL];
  id v1 = +[PHAssetChangeRequest creationRequestForAssetFromVideoAtFileURL:v2];
}

void sub_10000983C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000098D8;
  v7[3] = &unk_100018670;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v4;
  uint64_t v9 = v5;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
}

id sub_1000098D8(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  if (*(void *)(a1 + 32)) {
    BOOL v3 = __RPLogLevel > 2;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000F40C(v2);
  }
  return [*(id *)(a1 + 40) doneAction];
}

void sub_1000099B4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  BOOL v3 = [v2 videoURL];
  [v2 displayShareSheetWithVideoURL:v3];

  if ([*(id *)(a1 + 32) isPadMode])
  {
    v20 = [*(id *)(a1 + 32) doneButton];
    id v4 = [*(id *)(a1 + 32) flexSpace];
    uint64_t v5 = [*(id *)(a1 + 32) titleButton];
    id v6 = [*(id *)(a1 + 32) flexSpace];
    v7 = [*(id *)(a1 + 32) playButton];
    id v8 = [*(id *)(a1 + 32) fixSpace];
    uint64_t v9 = [*(id *)(a1 + 32) shareButton];
    v10 = [*(id *)(a1 + 32) fixSpace];
    v11 = [*(id *)(a1 + 32) saveButton];
    uint64_t v12 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v20, v4, v5, v6, v7, v8, v9, v10, v11, 0);
    id v21 = [v12 mutableCopy];

    if ([*(id *)(a1 + 32) isIntroMode])
    {
      v13 = [*(id *)(a1 + 32) playButton];
      [v21 removeObject:v13];
    }
    v14 = [*(id *)(a1 + 32) topToolBar];
    [v14 setItems:v21];
  }
  else
  {
    id v21 = [*(id *)(a1 + 32) topToolBar];
    v14 = [*(id *)(a1 + 32) doneButton];
    v15 = [*(id *)(a1 + 32) flexSpace];
    v16 = [*(id *)(a1 + 32) titleButton];
    v17 = [*(id *)(a1 + 32) flexSpace];
    v18 = [*(id *)(a1 + 32) saveButton];
    v19 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v14, v15, v16, v17, v18, 0);
    [v21 setItems:v19];
  }
}

void sub_100009FBC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) exportSession];
  id v3 = [v2 status];

  if (v3 == (id)5)
  {
    if (__RPLogLevel <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v9 = "-[RPVideoEditorViewController trimVideo]_block_invoke";
      __int16 v10 = 1024;
      int v11 = 789;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Export Trim Video Cancelled", buf, 0x12u);
    }
    goto LABEL_9;
  }
  if (v3 == (id)4)
  {
    if (__RPLogLevel <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [*(id *)(a1 + 32) exportSession];
      uint64_t v5 = [v4 error];
      *(_DWORD *)buf = 136446722;
      uint64_t v9 = "-[RPVideoEditorViewController trimVideo]_block_invoke";
      __int16 v10 = 1024;
      int v11 = 784;
      __int16 v12 = 1024;
      unsigned int v13 = [v5 code];
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Export Trim Video Failed, due to error: %i", buf, 0x18u);
    }
LABEL_9:
    id v6 = [*(id *)(*(void *)(a1 + 32) + 304) delegate];
    [v6 movieScrubberDidCancelEditing:*(void *)(*(void *)(a1 + 32) + 304)];

    return;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A1F4;
  block[3] = &unk_100018578;
  block[4] = *(void *)(a1 + 32);
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10000A1F4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 0;
  id v2 = +[NSFileManager defaultManager];
  [v2 _srRemoveFile:*(void *)(*(void *)(a1 + 32) + 280) completion:&stru_1000186E0];

  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 296) outputURL];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 280);
  *(void *)(v4 + 280) = v3;

  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:*(void *)(a1 + 32)];

  v7 = *(id **)(a1 + 32);
  id v8 = [v7[37] outputURL];
  [v7 reloadAVLayerWithURL:v8];

  id v9 = +[NSNotificationCenter defaultCenter];
  [v9 addObserver:*(void *)(a1 + 32) selector:"itemDidFinishPlaying:" name:AVPlayerItemDidPlayToEndTimeNotification object:*(void *)(*(void *)(a1 + 32) + 72)];
}

void sub_10000A328(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2 && __RPLogLevel <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000F4AC(v2);
  }
}

void sub_10000A734(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_10000A758(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned __int8 v3 = [WeakRetained isScrubbing];

  if ((v3 & 1) == 0)
  {
    id v4 = objc_loadWeakRetained(v1);
    uint64_t v5 = [v4 avPlayer];
    id v6 = [v5 currentItem];
    v7 = v6;
    if (v6) {
      [v6 currentTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    double Seconds = CMTimeGetSeconds(&time);
    id v9 = objc_loadWeakRetained(v1);
    __int16 v10 = [v9 avTrimmer];
    [v10 setValue:Seconds];
  }
}

void sub_10000A9A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(RPUIActivityItem);
  uint64_t v5 = *(void **)(a1 + 32);
  if (v5[5])
  {
    id v6 = [v5 overrideShareMessage];
    [(RPUIActivityItem *)v4 setOverrideShareMessage:v6];
  }
  else
  {
    id v6 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"SHARE_TEXT_FORMAT"];
    v7 = [v3 author];
    if ([v7 length])
    {
      id v8 = [v3 appName];
      id v9 = [v3 author];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v8, v9);
      __int16 v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v8 = [v3 appName];
      if (v8)
      {
        __int16 v10 = [v3 appName];
      }
      else
      {
        __int16 v10 = &stru_1000189F8;
      }
    }

    int v11 = [v3 appName];
    [(RPUIActivityItem *)v4 setAppName:v11];

    [(RPUIActivityItem *)v4 setShareText:v10];
    __int16 v12 = [v3 itemURL];
    [(RPUIActivityItem *)v4 setItemURL:v12];

    id v13 = objc_alloc((Class)NSData);
    v14 = [v3 appArtworkURL];
    id v15 = [v13 initWithContentsOfURL:v14];

    v16 = +[UIImage imageWithData:v15];
    [(RPUIActivityItem *)v4 setAppIcon:v16];
  }
  [(RPUIActivityItem *)v4 setVideoURL:*(void *)(a1 + 40)];
  id v17 = objc_alloc((Class)UIActivityViewController);
  v30 = v4;
  v18 = +[NSArray arrayWithObjects:&v30 count:1];
  id v19 = [v17 initWithActivityItems:v18 applicationActivities:0];

  UIActivityType v29 = UIActivityTypeCopyToPasteboard;
  v20 = +[NSArray arrayWithObjects:&v29 count:1];
  [v19 setExcludedActivityTypes:v20];

  v28[0] = UIActivityTypeMail;
  v28[1] = UIActivityTypeMessage;
  v28[2] = UIActivityTypeCopyToPasteboard;
  v28[3] = UIActivityTypePostToFacebook;
  id v21 = +[NSArray arrayWithObjects:v28 count:4];
  id v22 = [v21 mutableCopy];

  [v19 setActivityTypeOrder:v22];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10000ADC4;
  v27[3] = &unk_100018708;
  v27[4] = *(void *)(a1 + 32);
  [v19 setCompletionWithItemsHandler:v27];
  if ([*(id *)(a1 + 32) isPadMode])
  {
    [v19 setModalPresentationStyle:7];
    v23 = [v19 popoverPresentationController];
    v24 = [*(id *)(a1 + 32) shareButton];
    [v23 setBarButtonItem:v24];
  }
  v25 = *(void **)(a1 + 32);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10000AED4;
  v26[3] = &unk_100018578;
  v26[4] = v25;
  [v25 presentViewController:v19 animated:1 completion:v26];
}

void sub_10000ADC4(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    id v9 = sub_10000AE80;
    __int16 v10 = &unk_100018670;
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v7);
  }
  objc_msgSend(*(id *)(a1 + 32), "setShareSheetUp:", 0, v7, v8, v9, v10, v11);
}

void sub_10000AE80(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) activityTypes];
  [v2 addObject:*(void *)(a1 + 40)];
}

id sub_10000AED4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShareSheetUp:1];
}

void sub_10000B64C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) avPlayer];
  Float64 v3 = *(double *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) avPlayer];
  id v5 = v4;
  if (v4)
  {
    [v4 currentTime];
    LODWORD(v4) = v6;
  }
  CMTimeMakeWithSeconds(&v7, v3, (int32_t)v4);
  [v2 seekToTime:&v7];
}

void sub_10000B79C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) avPlayer];
  Float64 v3 = *(double *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) avPlayer];
  id v5 = v4;
  if (v4)
  {
    [v4 currentTime];
    LODWORD(v4) = v6;
  }
  CMTimeMakeWithSeconds(&v7, v3, (int32_t)v4);
  [v2 seekToTime:&v7];
}

id *sub_10000BD8C(id *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!a6)
  {
    uint64_t v8 = result;
    id v9 = [result[4] cachedTimeStamps];
    [v9 setObject:a3 forKey:v8[5]];

    id v10 = v8[4];
    id v11 = v8[5];
    return (id *)[v10 setThumbnailFromCacheWithTimeStamp:v11];
  }
  return result;
}

void sub_10000BE8C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cachedTimeStamps];
  id v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  id v4 = [*(id *)(a1 + 32) avTrimmer];
  [v4 setThumbnailImage:v3 forTimestamp:*(void *)(a1 + 40)];
}

uint64_t sub_10000D4D0(uint64_t a1)
{
  qword_10001F508 = (uint64_t)[*(id *)(a1 + 32) _createOverlayImageWithBackgroundWhite:0.959999979 backgroundAlpha:0.959999979 glyphAlpha:0.300000012];

  return _objc_release_x1();
}

uint64_t sub_10000D5B0(uint64_t a1)
{
  qword_10001F518 = (uint64_t)[*(id *)(a1 + 32) _createOverlayImageWithBackgroundWhite:0.959999979 backgroundAlpha:0.959999979 glyphAlpha:0.5];

  return _objc_release_x1();
}

void sub_10000D9F4(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13 = *(void **)(a1 + 32);
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = a2;
  [v13 setBundleIdentifier:v19];
  [*(id *)(a1 + 32) setAppName:v18];

  [*(id *)(a1 + 32) setMovieURL:v17];
  [*(id *)(a1 + 32) setFileAttachmentURL:v16];

  [*(id *)(a1 + 32) setOverrideShareMessage:v15];
  [*(id *)(a1 + 32) setOverrideTintColor:v14];

  id v20 = [v19 isEqualToString:@"com.apple.replayKit.ReplayKitTestRunneriOS"];
  [*(id *)(a1 + 32) setIsInternalTestMode:v20];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v21 = [*(id *)(a1 + 32) isInternalTestMode];
    *(_DWORD *)buf = 136315394;
    v24 = "-[RPVideoEditorExtensionViewController setupChildViewControllers]_block_invoke";
    __int16 v25 = 1024;
    unsigned int v26 = v21;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s isInternalTestMode: %d", buf, 0x12u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DBF4;
  block[3] = &unk_100018578;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_10000DBF4(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "loaded input items", v3, 2u);
  }
  return [*(id *)(a1 + 32) setupVideoEditorController];
}

void sub_10000E1F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose((const void *)(v45 - 224), 8);
  _Block_object_dispose((const void *)(v45 - 176), 8);
  _Block_object_dispose((const void *)(v45 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000E244(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000E254(uint64_t a1)
{
}

void sub_10000E25C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 attachments];
  id v5 = [v4 objectAtIndexedSubscript:0];

  if ([v5 hasItemConformingToTypeIdentifier:*(void *)(a1 + 32)])
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    uint64_t v6 = *(void *)(a1 + 32);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000E378;
    v9[3] = &unk_1000187D0;
    id v10 = v3;
    long long v12 = *(_OWORD *)(a1 + 56);
    long long v13 = *(_OWORD *)(a1 + 72);
    uint64_t v14 = *(void *)(a1 + 88);
    long long v8 = *(_OWORD *)(a1 + 40);
    id v7 = (id)v8;
    long long v11 = v8;
    [v5 loadItemForTypeIdentifier:v6 options:0 completionHandler:v9];
  }
}

void sub_10000E378(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (!v7)
  {
    long long v8 = [*(id *)(a1 + 32) attributedTitle];
    id v9 = [v8 string];
    unsigned int v10 = [v9 isEqualToString:@"RPVideoEditorExtensionAppNameKey"];

    if (v10)
    {
      uint64_t v11 = *(void *)(a1 + 48);
LABEL_6:
      objc_storeStrong((id *)(*(void *)(v11 + 8) + 40), a2);
      goto LABEL_10;
    }
    long long v12 = [*(id *)(a1 + 32) attributedTitle];
    long long v13 = [v12 string];
    unsigned int v14 = [v13 isEqualToString:@"RPVideoEditorExtensionMovieURLKey"];

    if (v14)
    {
      id v15 = v6;
      uint64_t v16 = +[NSURL fileURLWithPath:v15];
      uint64_t v17 = *(void *)(a1 + 56);
    }
    else
    {
      id v20 = [*(id *)(a1 + 32) attributedTitle];
      unsigned int v21 = [v20 string];
      unsigned int v22 = [v21 isEqualToString:@"RPVideoEditorExtensionBundleIdentifierKey"];

      if (v22)
      {
        uint64_t v11 = *(void *)(a1 + 64);
        goto LABEL_6;
      }
      v23 = [*(id *)(a1 + 32) attributedTitle];
      v24 = [v23 string];
      unsigned int v25 = [v24 isEqualToString:@"RPVideoEditorExtensionFileAttachmentKey"];

      if (!v25)
      {
        unsigned int v26 = [*(id *)(a1 + 32) attributedTitle];
        v27 = [v26 string];
        unsigned int v28 = [v27 isEqualToString:@"RPVideoEditorExtensionOverrideShareMessageKey"];

        if (v28)
        {
          uint64_t v11 = *(void *)(a1 + 80);
        }
        else
        {
          UIActivityType v29 = [*(id *)(a1 + 32) attributedTitle];
          v30 = [v29 string];
          unsigned int v31 = [v30 isEqualToString:@"RPVideoEditorExtensionOverrideTintColorKey"];

          if (!v31) {
            goto LABEL_10;
          }
          uint64_t v11 = *(void *)(a1 + 88);
        }
        goto LABEL_6;
      }
      id v15 = v6;
      uint64_t v16 = +[NSURL fileURLWithPath:v15];
      uint64_t v17 = *(void *)(a1 + 72);
    }
    uint64_t v18 = *(void *)(v17 + 8);
    id v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v16;

    goto LABEL_10;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000F548();
  }
LABEL_10:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t sub_10000E5F0(void *a1)
{
  uint64_t result = a1[4];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void, void, void, void))(result + 16))(result, *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40), *(void *)(*(void *)(a1[7] + 8) + 40), *(void *)(*(void *)(a1[8] + 8) + 40), *(void *)(*(void *)(a1[9] + 8) + 40), *(void *)(*(void *)(a1[10] + 8) + 40));
  }
  return result;
}

void sub_10000EAEC(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000F590(a2);
  }
}

void sub_10000ECF4(id a1)
{
  qword_10001F530 = objc_alloc_init(RPStoreManager);

  _objc_release_x1();
}

uint64_t sub_10000F168(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_10000F17C()
{
  sub_100005C28();
  sub_100005C3C((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d video URL is nil", v1, v2, v3, v4, v5);
}

void sub_10000F1FC()
{
  sub_100005C28();
  sub_100005C3C((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Asset Video Track constains more than one formatDescscriptions", v1, v2, v3, v4, v5);
}

void sub_10000F27C()
{
  sub_100005C28();
  sub_100005C3C((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Asset should only contain 1 video track", v1, v2, v3, v4, v5);
}

void sub_10000F2FC()
{
  sub_100005C28();
  sub_100005C3C((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Failed to get videoCodecType for asset", v1, v2, v3, v4, v5);
}

void sub_10000F37C()
{
  v0[0] = 136446466;
  sub_10000CC58();
  *(_DWORD *)((char *)&v0[3] + 2) = 709;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d Error Mixing video Audio tracks", (uint8_t *)v0, 0x12u);
}

void sub_10000F40C(id *a1)
{
  [*a1 code];
  *(_DWORD *)uint64_t v3 = 136446722;
  sub_10000CC58();
  *(_DWORD *)&v3[7] = 726;
  v3[9] = v1;
  int v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d Error writing video to camera roll: %d", (uint8_t *)v3, 0x18u);
}

void sub_10000F4AC(void *a1)
{
  [a1 code];
  *(_DWORD *)uint64_t v3 = 136446722;
  sub_10000CC58();
  *(_DWORD *)&v3[7] = 801;
  v3[9] = v1;
  int v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d Failed to remove file, due to error: %i", (uint8_t *)v3, 0x18u);
}

void sub_10000F548()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error loading input item for type", v0, 2u);
}

void sub_10000F590(void *a1)
{
  v1[0] = 67109120;
  v1[1] = [a1 code];
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "error calling extension - %i", (uint8_t *)v1, 8u);
}

void sub_10000F614()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "RPStoreManager::AMSLookupItemArtwork::URLWithHeight could not find artwork with specified parameters", v0, 2u);
}

void sub_10000F65C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  int v2 = 138412290;
  uint64_t v3 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "RPStoreManager::performLookupWithBundleIdentifiers could not complete lookup with error:%@", (uint8_t *)&v2, 0xCu);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextSetGrayFillColor(CGContextRef c, CGFloat gray, CGFloat alpha)
{
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return _CMFormatDescriptionGetMediaSubType(desc);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  return _CMTimeGetSeconds(time);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return _CMTimeMakeWithSeconds(retstr, seconds, preferredTimescale);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return _CMTimeRangeMake(retstr, start, duration);
}

uint64_t MGGetSInt32Answer()
{
  return _MGGetSInt32Answer();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

uint64_t RPStringUtility_FourccToCStr()
{
  return _RPStringUtility_FourccToCStr();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
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

id objc_retainAutoreleaseReturnValue(id a1)
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

id objc_msgSend__auxiliaryConnection(void *a1, const char *a2, ...)
{
  return [a1 _auxiliaryConnection];
}

id objc_msgSend__graphicsQuality(void *a1, const char *a2, ...)
{
  return [a1 _graphicsQuality];
}

id objc_msgSend__highlightedButtonImage(void *a1, const char *a2, ...)
{
  return [a1 _highlightedButtonImage];
}

id objc_msgSend__normalButtonImage(void *a1, const char *a2, ...)
{
  return [a1 _normalButtonImage];
}

id objc_msgSend__srDeleteAllTempFiles(void *a1, const char *a2, ...)
{
  return [a1 _srDeleteAllTempFiles];
}

id objc_msgSend__srTempPath(void *a1, const char *a2, ...)
{
  return [a1 _srTempPath];
}

id objc_msgSend_activityTypes(void *a1, const char *a2, ...)
{
  return [a1 activityTypes];
}

id objc_msgSend_allItems(void *a1, const char *a2, ...)
{
  return [a1 allItems];
}

id objc_msgSend_appArtworkURL(void *a1, const char *a2, ...)
{
  return [a1 appArtworkURL];
}

id objc_msgSend_appName(void *a1, const char *a2, ...)
{
  return [a1 appName];
}

id objc_msgSend_applicationName(void *a1, const char *a2, ...)
{
  return [a1 applicationName];
}

id objc_msgSend_applyPadConstraints(void *a1, const char *a2, ...)
{
  return [a1 applyPadConstraints];
}

id objc_msgSend_applyPadUILayout(void *a1, const char *a2, ...)
{
  return [a1 applyPadUILayout];
}

id objc_msgSend_applyPhoneConstraints(void *a1, const char *a2, ...)
{
  return [a1 applyPhoneConstraints];
}

id objc_msgSend_applyPhoneUILayout(void *a1, const char *a2, ...)
{
  return [a1 applyPhoneUILayout];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_artistName(void *a1, const char *a2, ...)
{
  return [a1 artistName];
}

id objc_msgSend_artwork(void *a1, const char *a2, ...)
{
  return [a1 artwork];
}

id objc_msgSend_asset(void *a1, const char *a2, ...)
{
  return [a1 asset];
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return [a1 attachments];
}

id objc_msgSend_attributedTitle(void *a1, const char *a2, ...)
{
  return [a1 attributedTitle];
}

id objc_msgSend_audioMix(void *a1, const char *a2, ...)
{
  return [a1 audioMix];
}

id objc_msgSend_audioMixInputParameters(void *a1, const char *a2, ...)
{
  return [a1 audioMixInputParameters];
}

id objc_msgSend_author(void *a1, const char *a2, ...)
{
  return [a1 author];
}

id objc_msgSend_avAsset(void *a1, const char *a2, ...)
{
  return [a1 avAsset];
}

id objc_msgSend_avPlayer(void *a1, const char *a2, ...)
{
  return [a1 avPlayer];
}

id objc_msgSend_avPlayerItem(void *a1, const char *a2, ...)
{
  return [a1 avPlayerItem];
}

id objc_msgSend_avPlayerLayer(void *a1, const char *a2, ...)
{
  return [a1 avPlayerLayer];
}

id objc_msgSend_avTrimmer(void *a1, const char *a2, ...)
{
  return [a1 avTrimmer];
}

id objc_msgSend_bagKeySet(void *a1, const char *a2, ...)
{
  return [a1 bagKeySet];
}

id objc_msgSend_bagSubProfile(void *a1, const char *a2, ...)
{
  return [a1 bagSubProfile];
}

id objc_msgSend_bagSubProfileVersion(void *a1, const char *a2, ...)
{
  return [a1 bagSubProfileVersion];
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 becomeFirstResponder];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_bottomToolBar(void *a1, const char *a2, ...)
{
  return [a1 bottomToolBar];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_cachedTimeStamps(void *a1, const char *a2, ...)
{
  return [a1 cachedTimeStamps];
}

id objc_msgSend_cancelButton(void *a1, const char *a2, ...)
{
  return [a1 cancelButton];
}

id objc_msgSend_cancelTrimButton(void *a1, const char *a2, ...)
{
  return [a1 cancelTrimButton];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentItem(void *a1, const char *a2, ...)
{
  return [a1 currentItem];
}

id objc_msgSend_currentItemLoaded(void *a1, const char *a2, ...)
{
  return [a1 currentItemLoaded];
}

id objc_msgSend_currentOrientation(void *a1, const char *a2, ...)
{
  return [a1 currentOrientation];
}

id objc_msgSend_currentTime(void *a1, const char *a2, ...)
{
  return [a1 currentTime];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
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

id objc_msgSend_deviceHasHomeButton(void *a1, const char *a2, ...)
{
  return [a1 deviceHasHomeButton];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_doneAction(void *a1, const char *a2, ...)
{
  return [a1 doneAction];
}

id objc_msgSend_doneButton(void *a1, const char *a2, ...)
{
  return [a1 doneButton];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_editEndTime(void *a1, const char *a2, ...)
{
  return [a1 editEndTime];
}

id objc_msgSend_editMode(void *a1, const char *a2, ...)
{
  return [a1 editMode];
}

id objc_msgSend_editStartTime(void *a1, const char *a2, ...)
{
  return [a1 editStartTime];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_exportSession(void *a1, const char *a2, ...)
{
  return [a1 exportSession];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return [a1 extensionContext];
}

id objc_msgSend_extensionObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 extensionObjectProxy];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_fixSpace(void *a1, const char *a2, ...)
{
  return [a1 fixSpace];
}

id objc_msgSend_flexSpace(void *a1, const char *a2, ...)
{
  return [a1 flexSpace];
}

id objc_msgSend_formatDescriptions(void *a1, const char *a2, ...)
{
  return [a1 formatDescriptions];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_getPlayerDuration(void *a1, const char *a2, ...)
{
  return [a1 getPlayerDuration];
}

id objc_msgSend_getThumbnailSize(void *a1, const char *a2, ...)
{
  return [a1 getThumbnailSize];
}

id objc_msgSend_getVideoSize(void *a1, const char *a2, ...)
{
  return [a1 getVideoSize];
}

id objc_msgSend_hasEdit(void *a1, const char *a2, ...)
{
  return [a1 hasEdit];
}

id objc_msgSend_hasHomeButton(void *a1, const char *a2, ...)
{
  return [a1 hasHomeButton];
}

id objc_msgSend_hideUI(void *a1, const char *a2, ...)
{
  return [a1 hideUI];
}

id objc_msgSend_inputItems(void *a1, const char *a2, ...)
{
  return [a1 inputItems];
}

id objc_msgSend_isExporting(void *a1, const char *a2, ...)
{
  return [a1 isExporting];
}

id objc_msgSend_isInternalTestMode(void *a1, const char *a2, ...)
{
  return [a1 isInternalTestMode];
}

id objc_msgSend_isIntroMode(void *a1, const char *a2, ...)
{
  return [a1 isIntroMode];
}

id objc_msgSend_isPadMode(void *a1, const char *a2, ...)
{
  return [a1 isPadMode];
}

id objc_msgSend_isScrubbing(void *a1, const char *a2, ...)
{
  return [a1 isScrubbing];
}

id objc_msgSend_isShareSheetUp(void *a1, const char *a2, ...)
{
  return [a1 isShareSheetUp];
}

id objc_msgSend_isTrimming(void *a1, const char *a2, ...)
{
  return [a1 isTrimming];
}

id objc_msgSend_isUIHidden(void *a1, const char *a2, ...)
{
  return [a1 isUIHidden];
}

id objc_msgSend_itemURL(void *a1, const char *a2, ...)
{
  return [a1 itemURL];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_naturalSize(void *a1, const char *a2, ...)
{
  return [a1 naturalSize];
}

id objc_msgSend_outputURL(void *a1, const char *a2, ...)
{
  return [a1 outputURL];
}

id objc_msgSend_overrideShareMessage(void *a1, const char *a2, ...)
{
  return [a1 overrideShareMessage];
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return [a1 pause];
}

id objc_msgSend_pauseAction(void *a1, const char *a2, ...)
{
  return [a1 pauseAction];
}

id objc_msgSend_pauseButton(void *a1, const char *a2, ...)
{
  return [a1 pauseButton];
}

id objc_msgSend_play(void *a1, const char *a2, ...)
{
  return [a1 play];
}

id objc_msgSend_playButton(void *a1, const char *a2, ...)
{
  return [a1 playButton];
}

id objc_msgSend_popoverPresentationController(void *a1, const char *a2, ...)
{
  return [a1 popoverPresentationController];
}

id objc_msgSend_preferredTransform(void *a1, const char *a2, ...)
{
  return [a1 preferredTransform];
}

id objc_msgSend_previewMode(void *a1, const char *a2, ...)
{
  return [a1 previewMode];
}

id objc_msgSend_productPageURL(void *a1, const char *a2, ...)
{
  return [a1 productPageURL];
}

id objc_msgSend_refreshAVRotation(void *a1, const char *a2, ...)
{
  return [a1 refreshAVRotation];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return [a1 removeFromParentViewController];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_replyQueue(void *a1, const char *a2, ...)
{
  return [a1 replyQueue];
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 resignFirstResponder];
}

id objc_msgSend_saveButton(void *a1, const char *a2, ...)
{
  return [a1 saveButton];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_scrubberContainterView(void *a1, const char *a2, ...)
{
  return [a1 scrubberContainterView];
}

id objc_msgSend_setupChildViewControllers(void *a1, const char *a2, ...)
{
  return [a1 setupChildViewControllers];
}

id objc_msgSend_setupVideoEditorController(void *a1, const char *a2, ...)
{
  return [a1 setupVideoEditorController];
}

id objc_msgSend_shareButton(void *a1, const char *a2, ...)
{
  return [a1 shareButton];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedPhotoLibrary(void *a1, const char *a2, ...)
{
  return [a1 sharedPhotoLibrary];
}

id objc_msgSend_shouldApplyPadUILayout(void *a1, const char *a2, ...)
{
  return [a1 shouldApplyPadUILayout];
}

id objc_msgSend_showUI(void *a1, const char *a2, ...)
{
  return [a1 showUI];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_subtype(void *a1, const char *a2, ...)
{
  return [a1 subtype];
}

id objc_msgSend_tearDownChildViewControllers(void *a1, const char *a2, ...)
{
  return [a1 tearDownChildViewControllers];
}

id objc_msgSend_tempFileURL(void *a1, const char *a2, ...)
{
  return [a1 tempFileURL];
}

id objc_msgSend_thumbnailGenerator(void *a1, const char *a2, ...)
{
  return [a1 thumbnailGenerator];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_titleButton(void *a1, const char *a2, ...)
{
  return [a1 titleButton];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_topToolBar(void *a1, const char *a2, ...)
{
  return [a1 topToolBar];
}

id objc_msgSend_trackID(void *a1, const char *a2, ...)
{
  return [a1 trackID];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_trimButton(void *a1, const char *a2, ...)
{
  return [a1 trimButton];
}

id objc_msgSend_trimFileURL(void *a1, const char *a2, ...)
{
  return [a1 trimFileURL];
}

id objc_msgSend_trimVideo(void *a1, const char *a2, ...)
{
  return [a1 trimVideo];
}

id objc_msgSend_undoAction(void *a1, const char *a2, ...)
{
  return [a1 undoAction];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceStyle];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_videoEditorExtensionViewController(void *a1, const char *a2, ...)
{
  return [a1 videoEditorExtensionViewController];
}

id objc_msgSend_videoOverlay(void *a1, const char *a2, ...)
{
  return [a1 videoOverlay];
}

id objc_msgSend_videoOverlayPlayButton(void *a1, const char *a2, ...)
{
  return [a1 videoOverlayPlayButton];
}

id objc_msgSend_videoURL(void *a1, const char *a2, ...)
{
  return [a1 videoURL];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willMoveToParentViewController:");
}