@interface CameraSensorController
- (BOOL)attentionDetectionSetting;
- (BOOL)enableCameraMaxDataRate:(id)a3 error:(id *)a4;
- (BOOL)enableCameraTestPatternPN9:(id)a3 error:(id *)a4;
- (BOOL)setCameraMinimumFrameRate:(id)a3 frameRate:(id)a4 error:(id *)a5;
- (BOOL)setCameraProperties:(id)a3 error:(id *)a4;
- (BOOL)streamCamera:(id)a3 error:(id *)a4;
- (BOOL)syncAndStreamCameras:(id)a3 bravo:(id)a4 error:(id *)a5;
- (CameraSensorInputs)inputs;
- (OSDCamera)alphaCamera;
- (OSDCamera)bravoCamera;
- (double)streamTime;
- (int)alphaSyncFrameCount;
- (int)bravoSyncFrameCount;
- (int)soloFrameCount;
- (void)disableAttentionDetection;
- (void)restoreAttentionDetection;
- (void)runCameraTest;
- (void)setAlphaCamera:(id)a3;
- (void)setAlphaSyncFrameCount:(int)a3;
- (void)setAttentionDetectionSetting:(BOOL)a3;
- (void)setBravoCamera:(id)a3;
- (void)setBravoSyncFrameCount:(int)a3;
- (void)setInputs:(id)a3;
- (void)setSoloFrameCount:(int)a3;
- (void)setStreamTime:(double)a3;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
- (void)teardown;
@end

@implementation CameraSensorController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
}

- (void)start
{
  [(CameraSensorController *)self disableAttentionDetection];
  v3 = dispatch_queue_create("com.apple.DiagnosticsService.Diagnostic-4009.testQueue", 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005E30;
  block[3] = &unk_100010540;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)teardown
{
  v3 = [(CameraSensorController *)self alphaCamera];

  if (v3)
  {
    v4 = [(CameraSensorController *)self alphaCamera];
    [v4 deactivate];
  }
  v5 = [(CameraSensorController *)self bravoCamera];

  if (v5)
  {
    v6 = [(CameraSensorController *)self alphaCamera];
    [v6 deactivate];
  }

  [(CameraSensorController *)self restoreAttentionDetection];
}

- (void)runCameraTest
{
  char v3 = MGGetBoolAnswer();
  char v4 = MGGetBoolAnswer();
  [(CameraSensorController *)self setAlphaCamera:0];
  [(CameraSensorController *)self setBravoCamera:0];
  v5 = [(CameraSensorController *)self inputs];
  v6 = [v5 identifier];
  unsigned __int8 v7 = [v6 isEqualToString:@"Front"];

  if (v7)
  {
    int v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 2;
    goto LABEL_13;
  }
  v11 = [(CameraSensorController *)self inputs];
  v12 = [v11 identifier];
  unsigned __int8 v13 = [v12 isEqualToString:@"FrontSuperWide"];

  if (v13)
  {
    int v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 5;
    goto LABEL_13;
  }
  v14 = [(CameraSensorController *)self inputs];
  v15 = [v14 identifier];
  unsigned __int8 v16 = [v15 isEqualToString:@"Rear"];

  if (v16)
  {
    int v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 1;
    goto LABEL_13;
  }
  v17 = [(CameraSensorController *)self inputs];
  v18 = [v17 identifier];
  char v19 = [v18 isEqualToString:@"RearTelephoto"] & v3;

  if (v19)
  {
    int v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 3;
    goto LABEL_13;
  }
  v20 = [(CameraSensorController *)self inputs];
  v21 = [v20 identifier];
  char v22 = [v21 isEqualToString:@"RearSynced"] & v3;

  if (v22)
  {
    uint64_t v10 = 1;
    uint64_t v9 = 3;
    int v8 = 1;
    goto LABEL_13;
  }
  v23 = [(CameraSensorController *)self inputs];
  v24 = [v23 identifier];
  char v25 = [v24 isEqualToString:@"RearSuperWide"] & v4;

  if (v25)
  {
    int v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 4;
LABEL_13:
    v26 = +[OSDCameraCenter sharedCenter];
    id v82 = 0;
    v27 = [v26 cameraForSource:v10 error:&v82];
    id v28 = v82;
    [(CameraSensorController *)self setAlphaCamera:v27];

    v29 = [(CameraSensorController *)self alphaCamera];

    if (v29)
    {
      if (!v8) {
        goto LABEL_17;
      }
      v30 = +[OSDCameraCenter sharedCenter];
      id v81 = v28;
      v31 = [v30 cameraForSource:v9 error:&v81];
      id v32 = v81;

      [(CameraSensorController *)self setBravoCamera:v31];
      v33 = [(CameraSensorController *)self bravoCamera];

      if (v33)
      {
        id v28 = v32;
LABEL_17:
        [(CameraSensorController *)self setSoloFrameCount:0];
        [(CameraSensorController *)self setAlphaSyncFrameCount:0];
        [(CameraSensorController *)self setBravoSyncFrameCount:0];
        [(CameraSensorController *)self setStreamTime:0.0];
        v34 = [(CameraSensorController *)self alphaCamera];
        id v80 = v28;
        unsigned int v35 = [(CameraSensorController *)self setCameraProperties:v34 error:&v80];
        id v36 = v80;

        if (!v35) {
          goto LABEL_29;
        }
        v37 = [(CameraSensorController *)self inputs];
        v38 = [v37 identifier];
        unsigned int v39 = [v38 isEqualToString:@"RearSynced"];

        v40 = [(CameraSensorController *)self alphaCamera];
        if (v39)
        {
          v41 = [(CameraSensorController *)self bravoCamera];
          id v79 = v36;
          unsigned __int8 v42 = [(CameraSensorController *)self syncAndStreamCameras:v40 bravo:v41 error:&v79];
          id v43 = v79;

          id v36 = v43;
          if ((v42 & 1) == 0)
          {
LABEL_29:
            if (v36)
            {
              v62 = DiagnosticLogHandleForCategory();
              if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
                sub_10000A778((uint64_t)v36, v62, v63, v64, v65, v66, v67, v68);
              }
            }
            return;
          }
        }
        else
        {
          id v78 = v36;
          unsigned int v45 = [(CameraSensorController *)self streamCamera:v40 error:&v78];
          id v43 = v78;

          id v36 = v43;
          if (!v45) {
            goto LABEL_29;
          }
        }
        v46 = [(CameraSensorController *)self inputs];
        v47 = [v46 identifier];
        unsigned int v48 = [v47 isEqualToString:@"RearSynced"];

        if (v48)
        {
          signed int v49 = [(CameraSensorController *)self alphaSyncFrameCount];
          v50 = [(CameraSensorController *)self inputs];
          signed int v51 = [v50 framesToSample];

          signed int v76 = [(CameraSensorController *)self bravoSyncFrameCount];
          v52 = [(CameraSensorController *)self inputs];
          signed int v53 = [v52 framesToSample];

          v85[0] = @"alphaSyncFrameCount";
          v54 = +[NSNumber numberWithInt:[(CameraSensorController *)self alphaSyncFrameCount]];
          v86[0] = v54;
          v85[1] = @"bravoSyncFrameCount";
          v55 = +[NSNumber numberWithInt:[(CameraSensorController *)self bravoSyncFrameCount]];
          v86[1] = v55;
          v85[2] = @"streamTime";
          [(CameraSensorController *)self streamTime];
          v56 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v86[2] = v56;
          v57 = +[NSDictionary dictionaryWithObjects:v86 forKeys:v85 count:3];
          v58 = [(CameraSensorController *)self result];
          [v58 setData:v57];

          if (v49 >= v51 && v76 >= v53) {
            goto LABEL_26;
          }
        }
        else
        {
          signed int v69 = [(CameraSensorController *)self soloFrameCount];
          v70 = [(CameraSensorController *)self inputs];
          signed int v71 = [v70 framesToSample];

          v83[0] = @"soloFrameCount";
          v72 = +[NSNumber numberWithInt:[(CameraSensorController *)self soloFrameCount]];
          v83[1] = @"streamTime";
          v84[0] = v72;
          [(CameraSensorController *)self streamTime];
          v73 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v84[1] = v73;
          v74 = +[NSDictionary dictionaryWithObjects:v84 forKeys:v83 count:2];
          v75 = [(CameraSensorController *)self result];
          [v75 setData:v74];

          if (v69 >= v71)
          {
LABEL_26:
            v59 = [(CameraSensorController *)self result];
            v60 = v59;
            v61 = &off_100010E38;
LABEL_36:
            [v59 setStatusCode:v61];

            return;
          }
        }
        v59 = [(CameraSensorController *)self result];
        v60 = v59;
        v61 = &off_100010E50;
        goto LABEL_36;
      }
      v44 = [(CameraSensorController *)self result];
      [v44 setStatusCode:&off_100010E20];
      id v28 = v32;
    }
    else
    {
      v44 = [(CameraSensorController *)self result];
      [v44 setStatusCode:&off_100010E08];
    }

    id v36 = v28;
    goto LABEL_29;
  }
  id v77 = [(CameraSensorController *)self result];
  [v77 setStatusCode:&off_100010DF0];
}

- (BOOL)setCameraProperties:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = [(CameraSensorController *)self inputs];
  if ([v7 enableMaxDataRate])
  {
  }
  else
  {
    int v8 = [(CameraSensorController *)self inputs];
    unsigned int v9 = [v8 enableTestPatternPN9];

    if (!v9)
    {
      BOOL v14 = 1;
      goto LABEL_14;
    }
  }
  if ([v6 activate:a4])
  {
    uint64_t v10 = [(CameraSensorController *)self inputs];
    unsigned int v11 = [v10 enableMaxDataRate];

    if (v11
      && ![(CameraSensorController *)self enableCameraMaxDataRate:v6 error:a4])
    {
      BOOL v14 = 0;
    }
    else
    {
      v12 = [(CameraSensorController *)self inputs];
      unsigned int v13 = [v12 enableTestPatternPN9];

      if (v13) {
        BOOL v14 = [(CameraSensorController *)self enableCameraTestPatternPN9:v6 error:a4];
      }
      else {
        BOOL v14 = 1;
      }
    }
    [v6 deactivate];
  }
  else
  {
    v15 = [(CameraSensorController *)self result];
    [v15 setStatusCode:&off_100010E68];

    BOOL v14 = 0;
  }
LABEL_14:
  unsigned __int8 v16 = [(CameraSensorController *)self inputs];
  v17 = [v16 minimumFrameRate];

  if (v14 && v17)
  {
    if ([v6 activate:a4])
    {
      LOBYTE(v14) = [(CameraSensorController *)self setCameraMinimumFrameRate:v6 frameRate:v17 error:a4];
    }
    else
    {
      v18 = [(CameraSensorController *)self result];
      [v18 setStatusCode:&off_100010E68];

      LOBYTE(v14) = 0;
    }
  }

  return v14;
}

- (BOOL)enableCameraMaxDataRate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (([v6 enableAgileClocking:0 error:a4] & 1) == 0)
  {
    unsigned int v9 = [(CameraSensorController *)self result];
    uint64_t v10 = v9;
    unsigned int v11 = &off_100010E80;
    goto LABEL_7;
  }
  unsigned __int8 v7 = [v6 useMaxAvailableDataRate:a4];

  if (!v7)
  {
    unsigned int v9 = [(CameraSensorController *)self result];
    uint64_t v10 = v9;
    unsigned int v11 = &off_100010E98;
    goto LABEL_7;
  }
  BOOL v8 = 1;
  if (([v6 enableAgileClocking:1 error:a4] & 1) == 0)
  {
    unsigned int v9 = [(CameraSensorController *)self result];
    uint64_t v10 = v9;
    unsigned int v11 = &off_100010EB0;
LABEL_7:
    [v9 setStatusCode:v11];

    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)enableCameraTestPatternPN9:(id)a3 error:(id *)a4
{
  unsigned __int8 v5 = [a3 enableTestPatternPN9:1 error:a4];
  if ((v5 & 1) == 0)
  {
    id v6 = [(CameraSensorController *)self result];
    [v6 setStatusCode:&off_100010EC8];
  }
  return v5;
}

- (BOOL)setCameraMinimumFrameRate:(id)a3 frameRate:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 supportedFormats:a5];
  unsigned int v11 = v10;
  if (v10)
  {
    id v36 = self;
    v37 = a5;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v12 = v10;
    id v13 = [v12 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v39;
      uint64_t v16 = kFigSupportedFormat_VideoMinFrameRate;
LABEL_4:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v39 != v15) {
          objc_enumerationMutation(v12);
        }
        v18 = [*(id *)(*((void *)&v38 + 1) + 8 * v17) objectForKeyedSubscript:v16, v36];
        char v19 = v18;
        if (v18)
        {
          int v20 = [v18 intValue];
          if (v20 <= (int)[v9 intValue]) {
            break;
          }
        }

        if (v14 == (id)++v17)
        {
          id v14 = [v12 countByEnumeratingWithState:&v38 objects:v42 count:16];
          if (v14) {
            goto LABEL_4;
          }
          goto LABEL_11;
        }
      }

      if ([v8 setMinimumFrameRate:v9 error:v37])
      {
        BOOL v34 = 1;
        goto LABEL_19;
      }
      v21 = [(CameraSensorController *)v36 result];
      [v21 setStatusCode:&off_100010EE0];
    }
    else
    {
LABEL_11:

      v21 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_10000A854((uint64_t)v9, v21, v22, v23, v24, v25, v26, v27);
      }
    }
  }
  else
  {
    v21 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10000A7E4((uint64_t)a5, v21, v28, v29, v30, v31, v32, v33);
    }
  }

  BOOL v34 = 0;
LABEL_19:

  return v34;
}

- (BOOL)streamCamera:(id)a3 error:(id *)a4
{
  id v6 = a3;
  dispatch_group_t v7 = dispatch_group_create();
  if ([v6 activate:a4])
  {
    v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    int v20 = sub_100006DEC;
    v21 = &unk_100010568;
    uint64_t v22 = self;
    id v8 = v7;
    uint64_t v23 = v8;
    id v9 = objc_retainBlock(&v18);
    [v6 setFrameHandler:v9, v18, v19, v20, v21, v22];
    unsigned __int8 v10 = [v6 startStreamingWithOptions:0 error:a4];
    if (v10)
    {
      unsigned int v11 = +[NSDate date];
      dispatch_group_enter(v8);
      id v12 = [(CameraSensorController *)self inputs];
      [v12 frameSampleTimeout];
      dispatch_time_t v14 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
      dispatch_group_wait(v8, v14);

      [v6 stopStreaming:a4];
      uint64_t v15 = +[NSDate date];
      [v15 timeIntervalSinceDate:v11];
      -[CameraSensorController setStreamTime:](self, "setStreamTime:");
    }
    else
    {
      unsigned int v11 = [(CameraSensorController *)self result];
      [v11 setStatusCode:&off_100010EF8];
    }

    [v6 deactivate];
  }
  else
  {
    uint64_t v16 = [(CameraSensorController *)self result];
    [v16 setStatusCode:&off_100010E68];

    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (BOOL)syncAndStreamCameras:(id)a3 bravo:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  dispatch_group_t v10 = dispatch_group_create();
  if ([v9 activate:a5])
  {
    if (![v8 activate:a5])
    {
      uint64_t v15 = [(CameraSensorController *)self result];
      [v15 setStatusCode:&off_100010E68];

      BOOL v13 = 0;
LABEL_15:
      [v9 deactivate];
      goto LABEL_16;
    }
    if (!+[OSDCameraCenter syncCameras:v8 slave:v9 skipSlaveFrames:1 enableSlaveOutput:1 error:a5])
    {
      uint64_t v16 = [(CameraSensorController *)self result];
      [v16 setStatusCode:&off_100010F28];

      BOOL v13 = 0;
LABEL_14:
      [v8 deactivate];
      goto LABEL_15;
    }
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000071A4;
    v32[3] = &unk_100010568;
    v32[4] = self;
    unsigned int v11 = v10;
    uint64_t v33 = v11;
    [v8 setFrameHandler:v32];
    uint64_t v26 = _NSConcreteStackBlock;
    uint64_t v27 = 3221225472;
    uint64_t v28 = sub_100007238;
    uint64_t v29 = &unk_100010568;
    uint64_t v30 = self;
    id v12 = v11;
    uint64_t v31 = v12;
    [v9 setFrameHandler:&v26];
    if (objc_msgSend(v8, "startStreamingWithOptions:error:", 0, a5, v26, v27, v28, v29, v30))
    {
      if ([v9 startStreamingWithOptions:0 error:a5])
      {
        BOOL v13 = 1;
LABEL_13:
        int v20 = +[NSDate date];
        dispatch_group_enter(v12);
        dispatch_group_enter(v12);
        v21 = [(CameraSensorController *)self inputs];
        [v21 frameSampleTimeout];
        dispatch_time_t v23 = dispatch_time(0, (uint64_t)(v22 * 1000000000.0));
        dispatch_group_wait(v12, v23);

        [v9 stopStreaming:a5];
        [v8 stopStreaming:a5];
        uint64_t v24 = +[NSDate date];
        [v24 timeIntervalSinceDate:v20];
        -[CameraSensorController setStreamTime:](self, "setStreamTime:");

        goto LABEL_14;
      }
      uint64_t v17 = [(CameraSensorController *)self result];
      v18 = v17;
      uint64_t v19 = &off_100010F40;
    }
    else
    {
      uint64_t v17 = [(CameraSensorController *)self result];
      v18 = v17;
      uint64_t v19 = &off_100010EF8;
    }
    [v17 setStatusCode:v19];

    BOOL v13 = 0;
    goto LABEL_13;
  }
  dispatch_time_t v14 = [(CameraSensorController *)self result];
  [v14 setStatusCode:&off_100010F10];

  [v8 deactivate];
  BOOL v13 = 0;
LABEL_16:

  return v13;
}

- (void)disableAttentionDetection
{
  [(CameraSensorController *)self setAttentionDetectionSetting:_AXSAttentionAwarenessFeaturesEnabled() != 0];

  __AXSSetAttentionAwarenessFeaturesEnabled(0);
}

- (void)restoreAttentionDetection
{
  BOOL v2 = [(CameraSensorController *)self attentionDetectionSetting];

  __AXSSetAttentionAwarenessFeaturesEnabled(v2);
}

- (int)soloFrameCount
{
  return self->_soloFrameCount;
}

- (void)setSoloFrameCount:(int)a3
{
  self->_soloFrameCount = a3;
}

- (int)alphaSyncFrameCount
{
  return self->_alphaSyncFrameCount;
}

- (void)setAlphaSyncFrameCount:(int)a3
{
  self->_alphaSyncFrameCount = a3;
}

- (int)bravoSyncFrameCount
{
  return self->_bravoSyncFrameCount;
}

- (void)setBravoSyncFrameCount:(int)a3
{
  self->_bravoSyncFrameCount = a3;
}

- (double)streamTime
{
  return self->_streamTime;
}

- (void)setStreamTime:(double)a3
{
  self->_streamTime = a3;
}

- (OSDCamera)alphaCamera
{
  return self->_alphaCamera;
}

- (void)setAlphaCamera:(id)a3
{
}

- (OSDCamera)bravoCamera
{
  return self->_bravoCamera;
}

- (void)setBravoCamera:(id)a3
{
}

- (CameraSensorInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
}

- (BOOL)attentionDetectionSetting
{
  return self->_attentionDetectionSetting;
}

- (void)setAttentionDetectionSetting:(BOOL)a3
{
  self->_attentionDetectionSetting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_bravoCamera, 0);

  objc_storeStrong((id *)&self->_alphaCamera, 0);
}

@end