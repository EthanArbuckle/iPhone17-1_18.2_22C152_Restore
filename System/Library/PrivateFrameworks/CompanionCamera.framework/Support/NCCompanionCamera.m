@interface NCCompanionCamera
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NCCompanionCamera)init;
- (id)_fetchCurrentCameraStateIncludingSupportedCaptureModes:(BOOL)a3;
- (id)makeRequest:(unsigned __int16)a3;
- (void)_sendCameraStateChangedRequest:(id)a3;
- (void)_sendCurrentCameraState;
- (void)_sendOpenStateChange:(int)a3 withInternalState:(id)a4;
- (void)beginBurstCapture:(id)a3;
- (void)cancelCountdown:(id)a3;
- (void)checkin;
- (void)closeCamera:(id)a3;
- (void)connectionDidTearDown:(id)a3;
- (void)dealloc;
- (void)endBurstCapture:(id)a3;
- (void)messageCenter:(id)a3 didChangeConnectedState:(BOOL)a4;
- (void)openCamera:(id)a3;
- (void)pauseCapture:(id)a3;
- (void)pressShutter:(id)a3;
- (void)resumeCapture:(id)a3;
- (void)setCaptureDevice:(id)a3;
- (void)setCaptureMode:(id)a3;
- (void)setFlashMode:(id)a3;
- (void)setFocusPoint:(id)a3;
- (void)setHDRMode:(id)a3;
- (void)setIrisMode:(id)a3;
- (void)setSharedLibraryMode:(id)a3;
- (void)setZoomMagnification:(id)a3;
- (void)startCapture:(id)a3;
- (void)stopCapture:(id)a3;
- (void)toggleCameraDevice:(id)a3;
- (void)userDidTakeScreenshot:(id)a3;
- (void)xpc_burstCaptureDidStop;
- (void)xpc_burstCaptureNumberOfPhotosDidChange:(unint64_t)a3;
- (void)xpc_burstCaptureWillStart;
- (void)xpc_captureDeviceDidChange;
- (void)xpc_captureDeviceDidChange:(int64_t)a3;
- (void)xpc_captureModeSelected:(int64_t)a3;
- (void)xpc_countdownCanceled;
- (void)xpc_didPauseCaptureTimerWithDate:(id)a3;
- (void)xpc_didResumeCaptureTimerWithDate:(id)a3;
- (void)xpc_didStartCaptureTimerWithDate:(id)a3;
- (void)xpc_didStopCapture;
- (void)xpc_didUpdateShallowDepthOfFieldStatus:(int64_t)a3;
- (void)xpc_didUpdateThumbnailWithData:(id)a3 isVideo:(BOOL)a4;
- (void)xpc_flashModeDidChange:(int64_t)a3;
- (void)xpc_hdrModeDidChange:(int64_t)a3;
- (void)xpc_irisModeDidChange:(int64_t)a3;
- (void)xpc_orientationChanged:(int64_t)a3;
- (void)xpc_sharedLibraryModeDidChange:(int64_t)a3;
- (void)xpc_sharedLibrarySupportDidChange:(int64_t)a3;
- (void)xpc_showingLivePreviewDidChange:(BOOL)a3;
- (void)xpc_spatialCaptureDidChange:(BOOL)a3;
- (void)xpc_willStartCapturing;
- (void)xpc_zoomChanged:(float)a3;
- (void)zoom:(id)a3;
@end

@implementation NCCompanionCamera

- (NCCompanionCamera)init
{
  v3 = sub_10001C470();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v46 = "-[NCCompanionCamera init]";
    __int16 v47 = 2080;
    v48 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/companioncamerad/NCCompanionCamera.m";
    __int16 v49 = 1024;
    int v50 = 67;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  v44.receiver = self;
  v44.super_class = (Class)NCCompanionCamera;
  v4 = [(NCCompanionCamera *)&v44 init];
  if (v4)
  {
    v5 = [[NMSMessageCenter alloc] initWithIDSServiceIdentifier:@"com.apple.private.alloy.camera.proxy"];
    messageCenter = v4->_messageCenter;
    v4->_messageCenter = v5;

    [(NMSMessageCenter *)v4->_messageCenter setDelegate:v4];
    v7 = v4->_messageCenter;
    uint64_t v8 = objc_opt_class();
    [(NMSMessageCenter *)v7 mapPBRequest:v8 toResponse:objc_opt_class() messageID:1];
    v9 = v4->_messageCenter;
    uint64_t v10 = objc_opt_class();
    [(NMSMessageCenter *)v9 mapPBRequest:v10 toResponse:objc_opt_class() messageID:2];
    v11 = v4->_messageCenter;
    uint64_t v12 = objc_opt_class();
    [(NMSMessageCenter *)v11 mapPBRequest:v12 toResponse:objc_opt_class() messageID:18];
    v13 = v4->_messageCenter;
    uint64_t v14 = objc_opt_class();
    [(NMSMessageCenter *)v13 mapPBRequest:v14 toResponse:objc_opt_class() messageID:19];
    v15 = v4->_messageCenter;
    uint64_t v16 = objc_opt_class();
    [(NMSMessageCenter *)v15 mapPBRequest:v16 toResponse:objc_opt_class() messageID:20];
    v17 = v4->_messageCenter;
    uint64_t v18 = objc_opt_class();
    [(NMSMessageCenter *)v17 mapPBRequest:v18 toResponse:objc_opt_class() messageID:4];
    v19 = v4->_messageCenter;
    uint64_t v20 = objc_opt_class();
    [(NMSMessageCenter *)v19 mapPBRequest:v20 toResponse:objc_opt_class() messageID:5];
    v21 = v4->_messageCenter;
    uint64_t v22 = objc_opt_class();
    [(NMSMessageCenter *)v21 mapPBRequest:v22 toResponse:objc_opt_class() messageID:24];
    v23 = v4->_messageCenter;
    uint64_t v24 = objc_opt_class();
    [(NMSMessageCenter *)v23 mapPBRequest:v24 toResponse:objc_opt_class() messageID:25];
    v25 = v4->_messageCenter;
    uint64_t v26 = objc_opt_class();
    [(NMSMessageCenter *)v25 mapPBRequest:v26 toResponse:objc_opt_class() messageID:6];
    [(NMSMessageCenter *)v4->_messageCenter mapPBRequest:objc_opt_class() toResponse:0 messageID:7];
    v27 = v4->_messageCenter;
    uint64_t v28 = objc_opt_class();
    [(NMSMessageCenter *)v27 mapPBRequest:v28 toResponse:objc_opt_class() messageID:8];
    [(NMSMessageCenter *)v4->_messageCenter mapPBRequest:objc_opt_class() toResponse:0 messageID:9];
    [(NMSMessageCenter *)v4->_messageCenter mapPBRequest:objc_opt_class() toResponse:0 messageID:10];
    v29 = v4->_messageCenter;
    uint64_t v30 = objc_opt_class();
    [(NMSMessageCenter *)v29 mapPBRequest:v30 toResponse:objc_opt_class() messageID:13];
    v31 = v4->_messageCenter;
    uint64_t v32 = objc_opt_class();
    [(NMSMessageCenter *)v31 mapPBRequest:v32 toResponse:objc_opt_class() messageID:14];
    v33 = v4->_messageCenter;
    uint64_t v34 = objc_opt_class();
    [(NMSMessageCenter *)v33 mapPBRequest:v34 toResponse:objc_opt_class() messageID:16];
    v35 = v4->_messageCenter;
    uint64_t v36 = objc_opt_class();
    [(NMSMessageCenter *)v35 mapPBRequest:v36 toResponse:objc_opt_class() messageID:17];
    v37 = v4->_messageCenter;
    uint64_t v38 = objc_opt_class();
    [(NMSMessageCenter *)v37 mapPBRequest:v38 toResponse:objc_opt_class() messageID:22];
    v39 = v4->_messageCenter;
    uint64_t v40 = objc_opt_class();
    [(NMSMessageCenter *)v39 mapPBRequest:v40 toResponse:objc_opt_class() messageID:23];
    [(NMSMessageCenter *)v4->_messageCenter addTarget:v4 action:"openCamera:" forMessageID:1];
    [(NMSMessageCenter *)v4->_messageCenter addTarget:v4 action:"pressShutter:" forMessageID:2];
    [(NMSMessageCenter *)v4->_messageCenter addTarget:v4 action:"beginBurstCapture:" forMessageID:18];
    [(NMSMessageCenter *)v4->_messageCenter addTarget:v4 action:"endBurstCapture:" forMessageID:19];
    [(NMSMessageCenter *)v4->_messageCenter addTarget:v4 action:"closeCamera:" forMessageID:11];
    [(NMSMessageCenter *)v4->_messageCenter addTarget:v4 action:"setCaptureDevice:" forMessageID:20];
    [(NMSMessageCenter *)v4->_messageCenter addTarget:v4 action:"setCaptureMode:" forMessageID:4];
    [(NMSMessageCenter *)v4->_messageCenter addTarget:v4 action:"startCapture:" forMessageID:5];
    [(NMSMessageCenter *)v4->_messageCenter addTarget:v4 action:"pauseCapture:" forMessageID:24];
    [(NMSMessageCenter *)v4->_messageCenter addTarget:v4 action:"resumeCapture:" forMessageID:25];
    [(NMSMessageCenter *)v4->_messageCenter addTarget:v4 action:"stopCapture:" forMessageID:6];
    [(NMSMessageCenter *)v4->_messageCenter addTarget:v4 action:"setFocusPoint:" forMessageID:7];
    [(NMSMessageCenter *)v4->_messageCenter addTarget:v4 action:"cancelCountdown:" forMessageID:12];
    [(NMSMessageCenter *)v4->_messageCenter addTarget:v4 action:"zoom:" forMessageID:13];
    [(NMSMessageCenter *)v4->_messageCenter addTarget:v4 action:"setFlashMode:" forMessageID:14];
    [(NMSMessageCenter *)v4->_messageCenter addTarget:v4 action:"setHDRMode:" forMessageID:16];
    [(NMSMessageCenter *)v4->_messageCenter addTarget:v4 action:"setIrisMode:" forMessageID:17];
    [(NMSMessageCenter *)v4->_messageCenter addTarget:v4 action:"setSharedLibraryMode:" forMessageID:22];
    [(NMSMessageCenter *)v4->_messageCenter addTarget:v4 action:"setZoomMagnification:" forMessageID:23];
    [(NMSMessageCenter *)v4->_messageCenter addTarget:v4 action:"toggleCameraDevice:" forMessageID:15];
    [(NMSMessageCenter *)v4->_messageCenter addTarget:v4 action:"userDidTakeScreenshot:" forMessageID:21];
    [(NMSMessageCenter *)v4->_messageCenter resume];
    v41 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.companion.camera"];
    cameraListener = v4->_cameraListener;
    v4->_cameraListener = v41;

    [(NSXPCListener *)v4->_cameraListener setDelegate:v4];
    [(NSXPCListener *)v4->_cameraListener resume];
  }
  return v4;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_cameraListener suspend];
  [(NSXPCListener *)self->_cameraListener invalidate];
  [(NSXPCListener *)self->_cameraListener setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)NCCompanionCamera;
  [(NCCompanionCamera *)&v3 dealloc];
}

- (void)openCamera:(id)a3
{
  id v4 = a3;
  v5 = sub_10001C470();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 idsIdentifier];
    *(_DWORD *)buf = 138412290;
    v39 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "openCamera. IDS ID %@", buf, 0xCu);
  }
  self->_remoteCameraState = 1;
  self->_pendingSwitchToSupportedMode = 0;
  v7 = [v4 pbRequest];
  uint64_t v8 = +[NSMutableOrderedSet orderedSetWithCapacity:](NSMutableOrderedSet, "orderedSetWithCapacity:", [v7 supportedCaptureModesCount]);
  if ([v7 supportedCaptureModesCount])
  {
    unint64_t v9 = 0;
    do
    {
      uint64_t v10 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", sub_1000065C0((int)[v7 supportedCaptureModeAtIndex:v9]));
      [v8 addObject:v10];

      ++v9;
    }
    while (v9 < (unint64_t)[v7 supportedCaptureModesCount]);
  }
  if (![v7 supportedCaptureModesCount]) {
    [v8 addObject:&off_100031EB8];
  }
  v11 = (NSOrderedSet *)[v8 copy];
  clientSupportedCaptureModes = self->_clientSupportedCaptureModes;
  self->_clientSupportedCaptureModes = v11;

  if (!self->_activeCamera)
  {
    uint64_t v18 = objc_alloc_init(NCOpenCameraResponse);
    [(NCOpenCameraResponse *)v18 setOpenState:1];
    v19 = [v4 response];
    [v19 setPbResponse:v18];

    uint64_t v20 = [v4 response];
    [v20 setFireAndForget:1];

    v21 = [v4 response];
    [v21 send];

    self->_pendingSwitchToSupportedMode = 1;
    char v31 = 0;
    int v22 = SBSGetScreenLockStatus();
    v23 = sub_10001C470();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    if (v22)
    {
      if (v24)
      {
        *(_WORD *)buf = 0;
        v25 = "Attempting to open lock screen camera";
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v25, buf, 2u);
      }
    }
    else if (v24)
    {
      *(_WORD *)buf = 0;
      v25 = "Device unlocked. Attempting to launch Camera.app";
      goto LABEL_17;
    }

    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    v27 = SBSCreateOpenApplicationService();
    uint64_t v36 = FBSOpenApplicationOptionKeyUnlockDevice;
    v37 = &__kCFBooleanTrue;
    uint64_t v28 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    v29 = +[FBSOpenApplicationOptions optionsWithDictionary:v28];

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10000D3C8;
    v30[3] = &unk_100030610;
    v30[4] = self;
    *(CFAbsoluteTime *)&v30[5] = Current;
    [v27 openApplication:@"com.apple.camera" withOptions:v29 completion:v30];

    goto LABEL_19;
  }
  v13 = sub_10001C470();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Opening connection to already running Camera instance.", buf, 2u);
  }

  activeCamera = self->_activeCamera;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10000D104;
  v34[3] = &unk_100030598;
  v15 = (NCOpenCameraResponse *)v4;
  v35 = v15;
  uint64_t v16 = [(NSXPCConnection *)activeCamera remoteObjectProxyWithErrorHandler:v34];
  objc_msgSend(v16, "xpc_setPreviewEndpoint:", @"proxy");
  v17 = self->_clientSupportedCaptureModes;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10000D1D0;
  v32[3] = &unk_1000305C0;
  v32[4] = self;
  v33 = v15;
  objc_msgSend(v16, "xpc_ensureSwitchedToOneOfSupportedCaptureModes:reply:", v17, v32);

  uint64_t v18 = v35;
LABEL_19:
}

- (void)closeCamera:(id)a3
{
  id v4 = a3;
  v5 = sub_10001C470();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 idsIdentifier];
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "closeCamera. IDS ID %@", buf, 0xCu);
  }
  self->_remoteCameraState = 2;
  activeCamera = self->_activeCamera;
  if (activeCamera)
  {
    uint64_t v8 = [(NSXPCConnection *)activeCamera remoteObjectProxyWithErrorHandler:&stru_100030650];
    objc_msgSend(v8, "xpc_setPreviewEndpoint:", 0);

    if (!self->_capturing)
    {
      int v9 = SBSGetScreenLockStatus();
      uint64_t v10 = sub_10001C470();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v11)
        {
          *(_WORD *)buf = 0;
          uint64_t v12 = "Device locked";
LABEL_10:
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
        }
      }
      else if (v11)
      {
        *(_WORD *)buf = 0;
        uint64_t v12 = "Device unlocked";
        goto LABEL_10;
      }

      v13 = [(NSXPCConnection *)self->_activeCamera remoteObjectProxyWithErrorHandler:&stru_100030670];
      objc_msgSend(v13, "xpc_suspend");
    }
  }
}

- (void)pressShutter:(id)a3
{
  id v4 = a3;
  v5 = sub_10001C470();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v14 = "-[NCCompanionCamera pressShutter:]";
    __int16 v15 = 2080;
    uint64_t v16 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/companioncamerad/NCCompanionCamera.m";
    __int16 v17 = 1024;
    int v18 = 268;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  self->_shutterLastPressed = CFAbsoluteTimeGetCurrent();
  v6 = [v4 pbRequest];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000D998;
  v11[3] = &unk_100030698;
  id v7 = v4;
  id v12 = v7;
  uint64_t v8 = objc_retainBlock(v11);
  activeCamera = self->_activeCamera;
  if (activeCamera)
  {
    uint64_t v10 = [(NSXPCConnection *)activeCamera remoteObjectProxyWithErrorHandler:&stru_1000306B8];
    objc_msgSend(v10, "takePhotoWithCountdown:", (int)objc_msgSend(v6, "countdown"));
  }
  ((void (*)(void *, BOOL))v8[2])(v8, activeCamera != 0);
}

- (void)beginBurstCapture:(id)a3
{
  id v4 = a3;
  v5 = sub_10001C470();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "-[NCCompanionCamera beginBurstCapture:]";
    __int16 v20 = 2080;
    v21 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/companioncamerad/NCCompanionCamera.m";
    __int16 v22 = 1024;
    int v23 = 295;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000DCC8;
  v16[3] = &unk_100030698;
  id v6 = v4;
  id v17 = v6;
  id v7 = objc_retainBlock(v16);
  uint64_t v8 = v7;
  activeCamera = self->_activeCamera;
  if (activeCamera)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000DD70;
    v14[3] = &unk_1000306E0;
    uint64_t v10 = v7;
    id v15 = v10;
    BOOL v11 = [(NSXPCConnection *)activeCamera remoteObjectProxyWithErrorHandler:v14];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000DDE4;
    v12[3] = &unk_100030708;
    v13 = v10;
    objc_msgSend(v11, "xpc_beginBurstCaptureWithReply:", v12);
  }
  else
  {
    ((void (*)(void *, void))v7[2])(v7, 0);
  }
}

- (void)endBurstCapture:(id)a3
{
  id v4 = a3;
  v5 = sub_10001C470();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v21 = "-[NCCompanionCamera endBurstCapture:]";
    __int16 v22 = 2080;
    int v23 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/companioncamerad/NCCompanionCamera.m";
    __int16 v24 = 1024;
    int v25 = 319;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  unint64_t lastBurstCaptureNumberOfPhotos = self->_lastBurstCaptureNumberOfPhotos;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000E034;
  v17[3] = &unk_100030730;
  int v19 = lastBurstCaptureNumberOfPhotos;
  id v7 = v4;
  id v18 = v7;
  uint64_t v8 = objc_retainBlock(v17);
  int v9 = v8;
  activeCamera = self->_activeCamera;
  if (activeCamera)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000E0E8;
    v15[3] = &unk_1000306E0;
    BOOL v11 = v8;
    id v16 = v11;
    id v12 = [(NSXPCConnection *)activeCamera remoteObjectProxyWithErrorHandler:v15];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000E15C;
    v13[3] = &unk_100030708;
    uint64_t v14 = v11;
    objc_msgSend(v12, "xpc_endBurstCaptureWithReply:", v13);
  }
  else
  {
    ((void (*)(void *, void))v8[2])(v8, 0);
  }
}

- (void)cancelCountdown:(id)a3
{
  id v4 = sub_10001C470();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315650;
    id v7 = "-[NCCompanionCamera cancelCountdown:]";
    __int16 v8 = 2080;
    int v9 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/companioncamerad/NCCompanionCamera.m";
    __int16 v10 = 1024;
    int v11 = 346;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v6, 0x1Cu);
  }

  v5 = [(NSXPCConnection *)self->_activeCamera remoteObjectProxyWithErrorHandler:&stru_100030750];
  objc_msgSend(v5, "xpc_cancelCountdown");
}

- (void)setCaptureDevice:(id)a3
{
  id v4 = a3;
  v5 = sub_10001C470();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v22 = "-[NCCompanionCamera setCaptureDevice:]";
    __int16 v23 = 2080;
    __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/companioncamerad/NCCompanionCamera.m";
    __int16 v25 = 1024;
    int v26 = 355;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  int v6 = [v4 pbRequest];
  int v7 = [v6 captureDevice];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000E528;
  v19[3] = &unk_100030778;
  v19[4] = self;
  id v8 = v4;
  id v20 = v8;
  int v9 = objc_retainBlock(v19);
  __int16 v10 = v9;
  activeCamera = self->_activeCamera;
  if (activeCamera)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000E634;
    v17[3] = &unk_1000306E0;
    id v12 = v9;
    id v18 = v12;
    v13 = [(NSXPCConnection *)activeCamera remoteObjectProxyWithErrorHandler:v17];
    BOOL v14 = sub_100006590(v7);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000E6A8;
    v15[3] = &unk_100030708;
    id v16 = v12;
    objc_msgSend(v13, "xpc_setCaptureDevice:reply:", v14, v15);
  }
  else
  {
    ((void (*)(void *, void))v9[2])(v9, 0);
  }
}

- (void)setCaptureMode:(id)a3
{
  id v4 = a3;
  v5 = sub_10001C470();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v22 = "-[NCCompanionCamera setCaptureMode:]";
    __int16 v23 = 2080;
    __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/companioncamerad/NCCompanionCamera.m";
    __int16 v25 = 1024;
    int v26 = 392;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  int v6 = [v4 pbRequest];
  int v7 = [v6 captureMode];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000E930;
  v19[3] = &unk_100030778;
  v19[4] = self;
  id v8 = v4;
  id v20 = v8;
  int v9 = objc_retainBlock(v19);
  __int16 v10 = v9;
  activeCamera = self->_activeCamera;
  if (activeCamera)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000EAB8;
    v17[3] = &unk_1000306E0;
    id v12 = v9;
    id v18 = v12;
    v13 = [(NSXPCConnection *)activeCamera remoteObjectProxyWithErrorHandler:v17];
    uint64_t v14 = sub_1000065C0(v7);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000EB2C;
    v15[3] = &unk_100030708;
    id v16 = v12;
    objc_msgSend(v13, "xpc_setCaptureMode:reply:", v14, v15);
  }
  else
  {
    ((void (*)(void *, void))v9[2])(v9, 0);
  }
}

- (void)startCapture:(id)a3
{
  id v4 = a3;
  v5 = sub_10001C470();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v21 = "-[NCCompanionCamera startCapture:]";
    __int16 v22 = 2080;
    __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/companioncamerad/NCCompanionCamera.m";
    __int16 v24 = 1024;
    int v25 = 438;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  int v6 = [v4 pbRequest];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000EDA8;
  v18[3] = &unk_100030698;
  id v7 = v4;
  id v19 = v7;
  id v8 = objc_retainBlock(v18);
  int v9 = v8;
  activeCamera = self->_activeCamera;
  if (activeCamera)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000EE50;
    v16[3] = &unk_1000306E0;
    int v11 = v8;
    id v17 = v11;
    id v12 = [(NSXPCConnection *)activeCamera remoteObjectProxyWithErrorHandler:v16];
    uint64_t v13 = sub_1000065C0((int)[v6 captureMode]);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000EEC4;
    v14[3] = &unk_100030708;
    id v15 = v11;
    objc_msgSend(v12, "xpc_startCaptureWithMode:reply:", v13, v14);
  }
  else
  {
    ((void (*)(void *, void))v8[2])(v8, 0);
  }
}

- (void)pauseCapture:(id)a3
{
  id v4 = a3;
  v5 = sub_10001C470();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v19 = "-[NCCompanionCamera pauseCapture:]";
    __int16 v20 = 2080;
    v21 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/companioncamerad/NCCompanionCamera.m";
    __int16 v22 = 1024;
    int v23 = 464;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000F108;
  v16[3] = &unk_100030698;
  id v6 = v4;
  id v17 = v6;
  id v7 = objc_retainBlock(v16);
  id v8 = v7;
  activeCamera = self->_activeCamera;
  if (activeCamera)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000F1B0;
    v14[3] = &unk_1000306E0;
    __int16 v10 = v7;
    id v15 = v10;
    int v11 = [(NSXPCConnection *)activeCamera remoteObjectProxyWithErrorHandler:v14];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000F224;
    v12[3] = &unk_100030708;
    uint64_t v13 = v10;
    objc_msgSend(v11, "xpc_pauseCaptureWithReply:", v12);
  }
  else
  {
    ((void (*)(void *, void))v7[2])(v7, 0);
  }
}

- (void)resumeCapture:(id)a3
{
  id v4 = a3;
  v5 = sub_10001C470();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v19 = "-[NCCompanionCamera resumeCapture:]";
    __int16 v20 = 2080;
    v21 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/companioncamerad/NCCompanionCamera.m";
    __int16 v22 = 1024;
    int v23 = 488;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000F468;
  v16[3] = &unk_100030698;
  id v6 = v4;
  id v17 = v6;
  id v7 = objc_retainBlock(v16);
  id v8 = v7;
  activeCamera = self->_activeCamera;
  if (activeCamera)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000F510;
    v14[3] = &unk_1000306E0;
    __int16 v10 = v7;
    id v15 = v10;
    int v11 = [(NSXPCConnection *)activeCamera remoteObjectProxyWithErrorHandler:v14];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000F584;
    v12[3] = &unk_100030708;
    uint64_t v13 = v10;
    objc_msgSend(v11, "xpc_resumeCaptureWithReply:", v12);
  }
  else
  {
    ((void (*)(void *, void))v7[2])(v7, 0);
  }
}

- (void)stopCapture:(id)a3
{
  id v4 = a3;
  v5 = sub_10001C470();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v19 = "-[NCCompanionCamera stopCapture:]";
    __int16 v20 = 2080;
    v21 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/companioncamerad/NCCompanionCamera.m";
    __int16 v22 = 1024;
    int v23 = 512;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000F7C8;
  v16[3] = &unk_100030698;
  id v6 = v4;
  id v17 = v6;
  id v7 = objc_retainBlock(v16);
  id v8 = v7;
  activeCamera = self->_activeCamera;
  if (activeCamera)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000F870;
    v14[3] = &unk_1000306E0;
    __int16 v10 = v7;
    id v15 = v10;
    int v11 = [(NSXPCConnection *)activeCamera remoteObjectProxyWithErrorHandler:v14];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000F8E4;
    v12[3] = &unk_100030708;
    uint64_t v13 = v10;
    objc_msgSend(v11, "xpc_stopCaptureWithReply:", v12);
  }
  else
  {
    ((void (*)(void *, void))v7[2])(v7, 0);
  }
}

- (void)setFocusPoint:(id)a3
{
  id v4 = a3;
  v5 = sub_10001C470();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int v11 = 136315650;
    *(void *)&void v11[4] = "-[NCCompanionCamera setFocusPoint:]";
    *(_WORD *)&v11[12] = 2080;
    *(void *)&v11[14] = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/companioncamerad/NCCompanionCamera.m";
    __int16 v12 = 1024;
    int v13 = 536;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", v11, 0x1Cu);
  }

  id v6 = [v4 pbRequest];

  if ([v6 pointsCount] == (id)2)
  {
    double v7 = *(float *)[v6 points];
    double v8 = *((float *)[v6 points] + 1);
    *(double *)int v11 = v7;
    *(double *)&v11[8] = v8;
    int v9 = +[NSValue valueWithBytes:v11 objCType:"{CGPoint=dd}"];
    __int16 v10 = [(NSXPCConnection *)self->_activeCamera remoteObjectProxyWithErrorHandler:&stru_100030798];
    objc_msgSend(v10, "xpc_setFocusPoint:", v9);
  }
}

- (void)zoom:(id)a3
{
  id v4 = a3;
  v5 = sub_10001C470();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    int v23 = "-[NCCompanionCamera zoom:]";
    __int16 v24 = 2080;
    int v25 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/companioncamerad/NCCompanionCamera.m";
    __int16 v26 = 1024;
    int v27 = 554;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  id v6 = [v4 pbRequest];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000FD2C;
  v20[3] = &unk_1000307C0;
  id v7 = v4;
  id v21 = v7;
  double v8 = objc_retainBlock(v20);
  int v9 = v8;
  activeCamera = self->_activeCamera;
  if (activeCamera)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000FDE8;
    v18[3] = &unk_1000306E0;
    int v11 = v8;
    id v19 = v11;
    __int16 v12 = [(NSXPCConnection *)activeCamera remoteObjectProxyWithErrorHandler:v18];
    [v6 zoomAmount];
    int v14 = v13;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000FE60;
    v16[3] = &unk_1000307E8;
    id v17 = v11;
    LODWORD(v15) = v14;
    objc_msgSend(v12, "xpc_setZoom:reply:", v16, v15);
  }
  else
  {
    ((void (*)(void *, void, double))v8[2])(v8, 0, 0.0);
  }
}

- (void)setZoomMagnification:(id)a3
{
  id v4 = a3;
  v5 = sub_10001C470();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    int v23 = "-[NCCompanionCamera setZoomMagnification:]";
    __int16 v24 = 2080;
    int v25 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/companioncamerad/NCCompanionCamera.m";
    __int16 v26 = 1024;
    int v27 = 582;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  id v6 = [v4 pbRequest];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000100D8;
  v20[3] = &unk_1000307C0;
  id v7 = v4;
  id v21 = v7;
  double v8 = objc_retainBlock(v20);
  int v9 = v8;
  activeCamera = self->_activeCamera;
  if (activeCamera)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100010194;
    v18[3] = &unk_1000306E0;
    int v11 = v8;
    id v19 = v11;
    __int16 v12 = [(NSXPCConnection *)activeCamera remoteObjectProxyWithErrorHandler:v18];
    [v6 zoomMagnificationAmount];
    int v14 = v13;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10001020C;
    v16[3] = &unk_1000307E8;
    id v17 = v11;
    LODWORD(v15) = v14;
    objc_msgSend(v12, "xpc_setZoomMagnification:reply:", v16, v15);
  }
  else
  {
    ((void (*)(void *, void, double))v8[2])(v8, 0, 0.0);
  }
}

- (void)setFlashMode:(id)a3
{
  id v4 = a3;
  v5 = sub_10001C470();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    int v14 = "-[NCCompanionCamera setFlashMode:]";
    __int16 v15 = 2080;
    id v16 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/companioncamerad/NCCompanionCamera.m";
    __int16 v17 = 1024;
    int v18 = 610;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  id v6 = [v4 pbRequest];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000103EC;
  v11[3] = &unk_100030810;
  id v7 = v4;
  id v12 = v7;
  double v8 = objc_retainBlock(v11);
  activeCamera = self->_activeCamera;
  if (activeCamera)
  {
    __int16 v10 = [(NSXPCConnection *)activeCamera remoteObjectProxyWithErrorHandler:&stru_100030830];
    objc_msgSend(v10, "xpc_setFlashMode:", sub_1000065FC((int)objc_msgSend(v6, "flashMode")));
  }
  ((void (*)(void *, BOOL, id))v8[2])(v8, activeCamera != 0, [v6 flashMode]);
}

- (void)setHDRMode:(id)a3
{
  id v4 = a3;
  v5 = sub_10001C470();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    int v14 = "-[NCCompanionCamera setHDRMode:]";
    __int16 v15 = 2080;
    id v16 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/companioncamerad/NCCompanionCamera.m";
    __int16 v17 = 1024;
    int v18 = 637;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  id v6 = [v4 pbRequest];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000106C0;
  v11[3] = &unk_100030810;
  id v7 = v4;
  id v12 = v7;
  double v8 = objc_retainBlock(v11);
  activeCamera = self->_activeCamera;
  if (activeCamera)
  {
    __int16 v10 = [(NSXPCConnection *)activeCamera remoteObjectProxyWithErrorHandler:&stru_100030850];
    objc_msgSend(v10, "xpc_setHDRMode:", sub_1000065FC((int)objc_msgSend(v6, "hdrMode")));
  }
  ((void (*)(void *, BOOL, id))v8[2])(v8, activeCamera != 0, [v6 hdrMode]);
}

- (void)setIrisMode:(id)a3
{
  id v4 = a3;
  v5 = sub_10001C470();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    int v14 = "-[NCCompanionCamera setIrisMode:]";
    __int16 v15 = 2080;
    id v16 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/companioncamerad/NCCompanionCamera.m";
    __int16 v17 = 1024;
    int v18 = 664;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  id v6 = [v4 pbRequest];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100010994;
  v11[3] = &unk_100030810;
  id v7 = v4;
  id v12 = v7;
  double v8 = objc_retainBlock(v11);
  activeCamera = self->_activeCamera;
  if (activeCamera)
  {
    __int16 v10 = [(NSXPCConnection *)activeCamera remoteObjectProxyWithErrorHandler:&stru_100030870];
    objc_msgSend(v10, "xpc_setIrisMode:", sub_1000065FC((int)objc_msgSend(v6, "irisMode")));
  }
  ((void (*)(void *, BOOL, id))v8[2])(v8, activeCamera != 0, [v6 irisMode]);
}

- (void)setSharedLibraryMode:(id)a3
{
  id v4 = a3;
  v5 = sub_10001C470();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    int v14 = "-[NCCompanionCamera setSharedLibraryMode:]";
    __int16 v15 = 2080;
    id v16 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/companioncamerad/NCCompanionCamera.m";
    __int16 v17 = 1024;
    int v18 = 692;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  id v6 = [v4 pbRequest];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100010C68;
  v11[3] = &unk_100030810;
  id v7 = v4;
  id v12 = v7;
  double v8 = objc_retainBlock(v11);
  activeCamera = self->_activeCamera;
  if (activeCamera)
  {
    __int16 v10 = [(NSXPCConnection *)activeCamera remoteObjectProxyWithErrorHandler:&stru_100030890];
    objc_msgSend(v10, "xpc_setSharedLibraryMode:", sub_100006590((int)objc_msgSend(v6, "sharedLibraryMode")));
  }
  ((void (*)(void *, BOOL, id))v8[2])(v8, activeCamera != 0, [v6 sharedLibraryMode]);
}

- (void)toggleCameraDevice:(id)a3
{
  id v4 = sub_10001C470();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v10 = "-[NCCompanionCamera toggleCameraDevice:]";
    __int16 v11 = 2080;
    id v12 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/companioncamerad/NCCompanionCamera.m";
    __int16 v13 = 1024;
    int v14 = 720;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  v5 = [(NSXPCConnection *)self->_activeCamera remoteObjectProxyWithErrorHandler:&stru_1000308B0];
  objc_msgSend(v5, "xpc_toggleCameraDevice");

  dispatch_time_t v6 = dispatch_time(0, 100000000);
  id v7 = [(NMSMessageCenter *)self->_messageCenter actionQ];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010F3C;
  block[3] = &unk_1000308D8;
  block[4] = self;
  dispatch_after(v6, v7, block);
}

- (void)userDidTakeScreenshot:(id)a3
{
  id v3 = a3;
  id v4 = sub_10001C470();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[NCCompanionCamera userDidTakeScreenshot:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/companioncamerad/NCCompanionCamera.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v11) = 734;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  v5 = (void (*)(uint64_t))off_10003B728;
  int v9 = off_10003B728;
  if (!off_10003B728)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_10001475C;
    __int16 v11 = &unk_100030A00;
    id v12 = &v6;
    sub_10001475C((uint64_t)buf);
    v5 = (void (*)(uint64_t))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v5)
  {
    sub_100024288();
    __break(1u);
  }
  v5(1108);
}

- (id)makeRequest:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v4 = +[NMSOutgoingRequest request];
  [v4 setMessageID:v3];
  [v4 setPriority:0];
  [v4 setReplyTimeout:10.0];
  [v4 setSendTimeout:10.0];
  [v4 setFireAndForget:1];
  return v4;
}

- (void)xpc_didUpdateThumbnailWithData:(id)a3 isVideo:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(NMSMessageCenter *)self->_messageCenter timeSinceLastDataReceived];
  if (v7 > 240.0)
  {
    uint64_t v8 = sub_10001C470();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Too long since last message received, not sending photo", (uint8_t *)&v15, 2u);
    }
LABEL_14:

    goto LABEL_15;
  }
  if (self->_remoteCameraState != 1)
  {
    uint64_t v8 = sub_10001C470();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_1000242AC();
    }
    goto LABEL_14;
  }
  double v9 = CFAbsoluteTimeGetCurrent() - self->_shutterLastPressed;
  __int16 v10 = sub_10001C470();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134218240;
    id v16 = [v6 length];
    __int16 v17 = 2048;
    double v18 = v9 * 1000.0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "photoData length: %ld. Capture duration: %.0lfms", (uint8_t *)&v15, 0x16u);
  }

  if ([v6 length])
  {
    uint64_t v8 = v6;
    if ([v8 length])
    {
      __int16 v11 = sub_10001C470();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [v8 length];
        int v15 = 134217984;
        id v16 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Sending resized photo of size: %ld", (uint8_t *)&v15, 0xCu);
      }

      __int16 v13 = objc_alloc_init(NCUpdateThumbnailRequest);
      [(NCUpdateThumbnailRequest *)v13 setJpegData:v8];
      [(NCUpdateThumbnailRequest *)v13 setCaptureDuration:v9];
      [(NCUpdateThumbnailRequest *)v13 setIsVideo:v4];
      int v14 = [(NCCompanionCamera *)self makeRequest:9];
      [v14 setPriority:1];
      [v14 setPbRequest:v13];
      [v14 setDoNotCompress:1];
      [v14 setSendTimeout:30.0];
      [(NMSMessageCenter *)self->_messageCenter sendRequest:v14];
    }
    goto LABEL_14;
  }
LABEL_15:
}

- (void)checkin
{
  v2 = sub_10001C470();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315650;
    BOOL v4 = "-[NCCompanionCamera checkin]";
    __int16 v5 = 2080;
    id v6 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/companioncamerad/NCCompanionCamera.m";
    __int16 v7 = 1024;
    int v8 = 827;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v3, 0x1Cu);
  }
}

- (void)xpc_willStartCapturing
{
  int v3 = sub_10001C470();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315650;
    id v6 = "-[NCCompanionCamera xpc_willStartCapturing]";
    __int16 v7 = 2080;
    int v8 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/companioncamerad/NCCompanionCamera.m";
    __int16 v9 = 1024;
    int v10 = 832;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v5, 0x1Cu);
  }

  self->_capturing = 1;
  BOOL v4 = objc_alloc_init(NCCameraStateChangedRequest);
  [(NCCameraStateChangedRequest *)v4 setCapturing:1];
  [(NCCameraStateChangedRequest *)v4 setCapturingPaused:0];
  [(NCCompanionCamera *)self _sendCameraStateChangedRequest:v4];
}

- (void)xpc_didStartCaptureTimerWithDate:(id)a3
{
  id v4 = a3;
  int v5 = sub_10001C470();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    int v10 = "-[NCCompanionCamera xpc_didStartCaptureTimerWithDate:]";
    __int16 v11 = 2080;
    id v12 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/companioncamerad/NCCompanionCamera.m";
    __int16 v13 = 1024;
    int v14 = 844;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v9, 0x1Cu);
  }

  id v6 = objc_alloc_init(NCCameraStateChangedRequest);
  [v4 timeIntervalSinceReferenceDate];
  double v8 = v7;

  [(NCCameraStateChangedRequest *)v6 setCaptureStartDate:v8];
  [(NCCameraStateChangedRequest *)v6 setCapturingPaused:0];
  [(NCCompanionCamera *)self _sendCameraStateChangedRequest:v6];
}

- (void)xpc_didPauseCaptureTimerWithDate:(id)a3
{
  id v4 = a3;
  int v5 = sub_10001C470();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    int v10 = "-[NCCompanionCamera xpc_didPauseCaptureTimerWithDate:]";
    __int16 v11 = 2080;
    id v12 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/companioncamerad/NCCompanionCamera.m";
    __int16 v13 = 1024;
    int v14 = 854;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v9, 0x1Cu);
  }

  id v6 = objc_alloc_init(NCCameraStateChangedRequest);
  [v4 timeIntervalSinceReferenceDate];
  double v8 = v7;

  [(NCCameraStateChangedRequest *)v6 setCapturePauseDate:v8];
  [(NCCameraStateChangedRequest *)v6 setCapturingPaused:1];
  [(NCCompanionCamera *)self _sendCameraStateChangedRequest:v6];
}

- (void)xpc_didResumeCaptureTimerWithDate:(id)a3
{
  id v4 = a3;
  int v5 = sub_10001C470();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    int v10 = "-[NCCompanionCamera xpc_didResumeCaptureTimerWithDate:]";
    __int16 v11 = 2080;
    id v12 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/companioncamerad/NCCompanionCamera.m";
    __int16 v13 = 1024;
    int v14 = 864;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v9, 0x1Cu);
  }

  id v6 = objc_alloc_init(NCCameraStateChangedRequest);
  [v4 timeIntervalSinceReferenceDate];
  double v8 = v7;

  [(NCCameraStateChangedRequest *)v6 setCaptureStartDate:v8];
  [(NCCameraStateChangedRequest *)v6 setCapturingPaused:0];
  [(NCCompanionCamera *)self _sendCameraStateChangedRequest:v6];
}

- (void)xpc_didStopCapture
{
  int v3 = sub_10001C470();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315650;
    id v6 = "-[NCCompanionCamera xpc_didStopCapture]";
    __int16 v7 = 2080;
    double v8 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/companioncamerad/NCCompanionCamera.m";
    __int16 v9 = 1024;
    int v10 = 874;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v5, 0x1Cu);
  }

  self->_capturing = 0;
  id v4 = objc_alloc_init(NCCameraStateChangedRequest);
  [(NCCameraStateChangedRequest *)v4 setCapturing:0];
  [(NCCameraStateChangedRequest *)v4 setCapturingPaused:0];
  [(NCCompanionCamera *)self _sendCameraStateChangedRequest:v4];
}

- (void)xpc_burstCaptureWillStart
{
  int v3 = sub_10001C470();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315650;
    int v5 = "-[NCCompanionCamera xpc_burstCaptureWillStart]";
    __int16 v6 = 2080;
    __int16 v7 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/companioncamerad/NCCompanionCamera.m";
    __int16 v8 = 1024;
    int v9 = 886;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v4, 0x1Cu);
  }

  self->_unint64_t lastBurstCaptureNumberOfPhotos = 0;
}

- (void)xpc_burstCaptureNumberOfPhotosDidChange:(unint64_t)a3
{
  self->_unint64_t lastBurstCaptureNumberOfPhotos = a3;
}

- (void)xpc_burstCaptureDidStop
{
  int v3 = sub_10001C470();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315650;
    int v5 = "-[NCCompanionCamera xpc_burstCaptureDidStop]";
    __int16 v6 = 2080;
    __int16 v7 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/companioncamerad/NCCompanionCamera.m";
    __int16 v8 = 1024;
    int v9 = 900;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v4, 0x1Cu);
  }

  self->_unint64_t lastBurstCaptureNumberOfPhotos = 0;
}

- (void)xpc_captureDeviceDidChange:(int64_t)a3
{
  int v4 = sub_10001C470();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315650;
    __int16 v6 = "-[NCCompanionCamera xpc_captureDeviceDidChange:]";
    __int16 v7 = 2080;
    __int16 v8 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/companioncamerad/NCCompanionCamera.m";
    __int16 v9 = 1024;
    int v10 = 907;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v5, 0x1Cu);
  }

  [(NCCompanionCamera *)self _sendCurrentCameraState];
}

- (void)xpc_captureModeSelected:(int64_t)a3
{
  int v4 = sub_10001C470();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315650;
    __int16 v6 = "-[NCCompanionCamera xpc_captureModeSelected:]";
    __int16 v7 = 2080;
    __int16 v8 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/companioncamerad/NCCompanionCamera.m";
    __int16 v9 = 1024;
    int v10 = 914;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v5, 0x1Cu);
  }

  [(NCCompanionCamera *)self _sendCurrentCameraState];
}

- (void)xpc_orientationChanged:(int64_t)a3
{
  int v5 = sub_10001C470();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = sub_100006634(a3);
    if (v6 >= 5)
    {
      __int16 v7 = +[NSString stringWithFormat:@"(unknown: %i)", v6];
    }
    else
    {
      __int16 v7 = *(&off_100030AB0 + (int)v6);
    }
    *(_DWORD *)buf = 138412290;
    int v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "orientation: %@", buf, 0xCu);
  }
  __int16 v8 = objc_alloc_init(NCCameraStateChangedRequest);
  [(NCCameraStateChangedRequest *)v8 setOrientation:sub_100006634(a3)];
  [(NCCompanionCamera *)self _sendCameraStateChangedRequest:v8];
}

- (void)xpc_countdownCanceled
{
  [(NMSMessageCenter *)self->_messageCenter timeSinceLastDataReceived];
  double v4 = v3;
  int v5 = sub_10001C470();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4 <= 240.0)
  {
    if (v6)
    {
      int v7 = 136315650;
      __int16 v8 = "-[NCCompanionCamera xpc_countdownCanceled]";
      __int16 v9 = 2080;
      int v10 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/companioncamerad/NCCompanionCamera.m";
      __int16 v11 = 1024;
      int v12 = 935;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v7, 0x1Cu);
    }

    if (self->_remoteCameraState == 1)
    {
      int v5 = [(NCCompanionCamera *)self makeRequest:12];
      [(NMSMessageCenter *)self->_messageCenter sendRequest:v5];
    }
    else
    {
      int v5 = sub_10001C470();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        sub_1000242AC();
      }
    }
  }
  else if (v6)
  {
    LOWORD(v7) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Too long since last message received, not sending cancel", (uint8_t *)&v7, 2u);
  }
}

- (void)xpc_zoomChanged:(float)a3
{
  int v5 = sub_10001C470();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    double v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%f", (uint8_t *)&v8, 0xCu);
  }

  BOOL v6 = objc_alloc_init(NCCameraStateChangedRequest);
  *(float *)&double v7 = a3;
  [(NCCameraStateChangedRequest *)v6 setZoomAmount:v7];
  [(NCCompanionCamera *)self _sendCameraStateChangedRequest:v6];
}

- (void)xpc_didUpdateShallowDepthOfFieldStatus:(int64_t)a3
{
  int v5 = sub_10001C470();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = sub_100006624(a3);
    if (v6 >= 9)
    {
      double v7 = +[NSString stringWithFormat:@"(unknown: %i)", v6];
    }
    else
    {
      double v7 = *(&off_100030B28 + (int)v6);
    }
    *(_DWORD *)buf = 138412290;
    int v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  int v8 = objc_alloc_init(NCCameraStateChangedRequest);
  [(NCCameraStateChangedRequest *)v8 setShallowDepthOfFieldStatus:sub_100006624(a3)];
  [(NCCompanionCamera *)self _sendCameraStateChangedRequest:v8];
}

- (void)xpc_captureDeviceDidChange
{
  double v3 = [(NMSMessageCenter *)self->_messageCenter actionQ];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000122EC;
  block[3] = &unk_1000308D8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)xpc_flashModeDidChange:(int64_t)a3
{
  int v5 = objc_alloc_init(NCCameraStateChangedRequest);
  [(NCCameraStateChangedRequest *)v5 setFlashMode:sub_1000065E4(a3)];
  [(NCCompanionCamera *)self _sendCameraStateChangedRequest:v5];
}

- (void)xpc_spatialCaptureDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = objc_alloc_init(NCCameraStateChangedRequest);
  [(NCCameraStateChangedRequest *)v5 setIsSpatialCapture:v3];
  [(NCCompanionCamera *)self _sendCameraStateChangedRequest:v5];
}

- (void)xpc_hdrModeDidChange:(int64_t)a3
{
  int v5 = objc_alloc_init(NCCameraStateChangedRequest);
  [(NCCameraStateChangedRequest *)v5 setHdrMode:sub_1000065E4(a3)];
  [(NCCompanionCamera *)self _sendCameraStateChangedRequest:v5];
}

- (void)xpc_irisModeDidChange:(int64_t)a3
{
  int v5 = objc_alloc_init(NCCameraStateChangedRequest);
  [(NCCameraStateChangedRequest *)v5 setIrisMode:sub_1000065E4(a3)];
  uint64_t v6 = [(NMSMessageCenter *)self->_messageCenter connectedDevice];
  if (!v6 || (double v7 = v6, [v6 operatingSystemVersion], v7, v8 <= 4))
  {
    if ([(NCCameraStateChangedRequest *)v5 irisMode] == 2) {
      [(NCCameraStateChangedRequest *)v5 setIrisMode:1];
    }
  }
  [(NCCompanionCamera *)self _sendCameraStateChangedRequest:v5];
}

- (void)xpc_sharedLibrarySupportDidChange:(int64_t)a3
{
  int v5 = objc_alloc_init(NCCameraStateChangedRequest);
  [(NCCameraStateChangedRequest *)v5 setSharedLibrarySupport:sub_100006584(a3)];
  [(NCCompanionCamera *)self _sendCameraStateChangedRequest:v5];
}

- (void)xpc_sharedLibraryModeDidChange:(int64_t)a3
{
  int v5 = objc_alloc_init(NCCameraStateChangedRequest);
  [(NCCameraStateChangedRequest *)v5 setSharedLibraryMode:sub_100006584(a3)];
  [(NCCompanionCamera *)self _sendCameraStateChangedRequest:v5];
}

- (void)xpc_showingLivePreviewDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = objc_alloc_init(NCCameraStateChangedRequest);
  [(NCCameraStateChangedRequest *)v5 setShowingLivePreview:v3];
  [(NCCompanionCamera *)self _sendCameraStateChangedRequest:v5];
}

- (void)_sendCameraStateChangedRequest:(id)a3
{
  id v4 = a3;
  int v5 = [(NMSMessageCenter *)self->_messageCenter actionQ];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000127BC;
  v7[3] = &unk_1000305C0;
  id v8 = v4;
  double v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_sendOpenStateChange:(int)a3 withInternalState:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  double v7 = sub_10001C470();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "newOpenState: %d", buf, 8u);
  }

  if (self->_remoteCameraState <= 1)
  {
    id v8 = objc_alloc_init(NCCameraOpenStateChangeRequest);
    [(NCCameraOpenStateChangeRequest *)v8 setOpenState:v4];
    [(NCCameraOpenStateChangeRequest *)v8 setInternalState:v6];
    double v9 = [(NCCompanionCamera *)self makeRequest:8];
    [v9 setPbRequest:v8];
    if (!v4)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100012AA8;
      v15[3] = &unk_100030920;
      void v15[4] = self;
      [v9 setPbResponseHandler:v15];
    }
    [(NMSMessageCenter *)self->_messageCenter sendRequest:v9];
    int v10 = [(NMSMessageCenter *)self->_messageCenter connectedDevice];
    if (v10)
    {
      __int16 v11 = v10;
      [v10 operatingSystemVersion];

      if (v12 > 2) {
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      uint64_t v14 = 0;
    }
    [(NCCompanionCamera *)self _sendCurrentCameraState];
LABEL_13:

    goto LABEL_14;
  }
  sub_10001C470();
  id v8 = (NCCameraOpenStateChangeRequest *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEBUG)) {
    sub_1000242AC();
  }
LABEL_14:
}

- (id)_fetchCurrentCameraStateIncludingSupportedCaptureModes:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = 0;
  __int16 v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = sub_100012CE8;
  uint64_t v14 = sub_100012CF8;
  id v15 = 0;
  int v5 = [(NSXPCConnection *)self->_activeCamera synchronousRemoteObjectProxyWithErrorHandler:&stru_100030940];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100012D54;
  v8[3] = &unk_100030968;
  BOOL v9 = v3;
  v8[4] = self;
  v8[5] = &v10;
  objc_msgSend(v5, "xpc_fetchCurrentStateIncludingSupportedCaptureModes:reply:", v3, v8);
  id v6 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v6;
}

- (void)_sendCurrentCameraState
{
  if (self->_remoteCameraState == 1)
  {
    id v5 = [(NCCompanionCamera *)self _fetchCurrentCameraStateIncludingSupportedCaptureModes:0];
    BOOL v3 = [(NCCompanionCamera *)self makeRequest:10];
    [v3 setPbRequest:v5];
    [(NMSMessageCenter *)self->_messageCenter sendRequest:v3];
  }
  else
  {
    uint64_t v4 = sub_10001C470();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_1000242AC();
    }
  }
}

- (void)messageCenter:(id)a3 didChangeConnectedState:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = sub_10001C470();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "isConnected: %d", (uint8_t *)v7, 8u);
  }

  if (v4) {
    id v6 = "com.apple.companion.camera.device-connected";
  }
  else {
    id v6 = "com.apple.companion.camera.device-disconnected";
  }
  notify_post(v6);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = sub_10001C470();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v15 = "-[NCCompanionCamera listener:shouldAcceptNewConnection:]";
    __int16 v16 = 2080;
    int v17 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/companioncamerad/NCCompanionCamera.m";
    __int16 v18 = 1024;
    int v19 = 1208;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  NSLog(@"Creating connection transation");
  double v7 = (OS_os_transaction *)os_transaction_create();
  connectionTransaction = self->_connectionTransaction;
  self->_connectionTransaction = v7;

  BOOL v9 = [(NMSMessageCenter *)self->_messageCenter actionQ];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100013E4C;
  v12[3] = &unk_1000305C0;
  void v12[4] = self;
  id v13 = v5;
  id v10 = v5;
  dispatch_async(v9, v12);

  return 1;
}

- (void)connectionDidTearDown:(id)a3
{
  id v4 = a3;
  id v5 = sub_10001C470();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v12 = "-[NCCompanionCamera connectionDidTearDown:]";
    __int16 v13 = 2080;
    uint64_t v14 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/companioncamerad/NCCompanionCamera.m";
    __int16 v15 = 1024;
    int v16 = 1270;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  id v6 = [(NMSMessageCenter *)self->_messageCenter actionQ];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001463C;
  v8[3] = &unk_1000305C0;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionTransaction, 0);
  objc_storeStrong((id *)&self->_activeCamera, 0);
  objc_storeStrong((id *)&self->_cameraListener, 0);
  objc_storeStrong((id *)&self->_clientSupportedCaptureModes, 0);
  objc_storeStrong((id *)&self->_messageCenter, 0);
}

@end