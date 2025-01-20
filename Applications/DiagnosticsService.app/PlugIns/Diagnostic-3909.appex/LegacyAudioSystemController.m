@interface LegacyAudioSystemController
+ (BOOL)setCode:(int64_t)a3 forError:(id *)a4;
- (AudioSystemInputs)inputs;
- (BOOL)balanceChanged;
- (BOOL)confirmDeviceDocked;
- (BOOL)isBalanceChangeRequired;
- (BOOL)isDockRequired;
- (BOOL)isMonoChangeRequired;
- (BOOL)isOriginallyMono;
- (BOOL)monoChanged;
- (DAAccessoryDisconnectDetector)accessoryDisconnectDetector;
- (DAAudioDevice)audioDevice;
- (DAAudioSessionInterruptDetector)audioSessionInterruptDetector;
- (DAHeadphonesDetector)headphoneDetector;
- (DAMotionDetector)motionDetector;
- (DAOrientationDetector)orientationDetector;
- (DKResponder)diagnosticResponder;
- (NSMutableArray)playResults;
- (NSMutableDictionary)fileNameToURL;
- (NSNumber)originalBalance;
- (float)previousDeviceVolumeAudioVideo;
- (float)previousDeviceVolumePlayAndRecord;
- (void)cancel;
- (void)cleanUpPlayResults;
- (void)failedToExecuteWithError:(id)a3;
- (void)receivedNotification:(id)a3;
- (void)restoreAccesibilityStateIfRequired;
- (void)restoreOriginalVolumes;
- (void)saveOriginalVolumes;
- (void)setAccessibilityStateIfRequired;
- (void)setAccessoryDisconnectDetector:(id)a3;
- (void)setAudioDevice:(id)a3;
- (void)setAudioSessionInterruptDetector:(id)a3;
- (void)setBalanceChanged:(BOOL)a3;
- (void)setDiagnosticResponder:(id)a3;
- (void)setFileNameToURL:(id)a3;
- (void)setHeadphoneDetector:(id)a3;
- (void)setInputs:(id)a3;
- (void)setIsOriginallyMono:(BOOL)a3;
- (void)setMonoChanged:(BOOL)a3;
- (void)setMotionDetector:(id)a3;
- (void)setOrientationDetector:(id)a3;
- (void)setOriginalBalance:(id)a3;
- (void)setPlayResults:(id)a3;
- (void)setPreviousDeviceVolumeAudioVideo:(float)a3;
- (void)setPreviousDeviceVolumePlayAndRecord:(float)a3;
- (void)setUpEventNotifications;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
- (void)teardown;
@end

@implementation LegacyAudioSystemController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v32 = v6;
  [(LegacyAudioSystemController *)self setInputs:v6];
  v36 = v7;
  [(LegacyAudioSystemController *)self setDiagnosticResponder:v7];
  if ([(LegacyAudioSystemController *)self isDockRequired]
    && ![(LegacyAudioSystemController *)self confirmDeviceDocked])
  {
    id v53 = 0;
    +[LegacyAudioSystemController setCode:-52 forError:&v53];
    id v14 = v53;
    [(LegacyAudioSystemController *)self failedToExecuteWithError:v14];
  }
  else
  {
    [(LegacyAudioSystemController *)self setAccessibilityStateIfRequired];
    [v7 enableVolumeHUD:0];
    dispatch_semaphore_t v34 = dispatch_semaphore_create(0);
    v8 = +[NSMutableDictionary dictionary];
    [(LegacyAudioSystemController *)self setFileNameToURL:v8];

    v9 = NSTemporaryDirectory();
    v35 = +[NSURL fileURLWithPath:v9 isDirectory:1];

    long long v51 = 0u;
    long long v52 = 0u;
    long long v50 = 0u;
    long long v49 = 0u;
    v10 = [(LegacyAudioSystemController *)self inputs];
    id obj = [v10 requiredFiles];

    id v11 = [obj countByEnumeratingWithState:&v49 objects:v58 count:16];
    if (v11)
    {
      v13 = 0;
      id v14 = 0;
      uint64_t v15 = *(void *)v50;
      *(void *)&long long v12 = 138412546;
      long long v31 = v12;
      while (2)
      {
        v16 = 0;
        v17 = v13;
        do
        {
          if (*(void *)v50 != v15) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v49 + 1) + 8 * (void)v16);
          if ([(LegacyAudioSystemController *)self isCancelled])
          {
            v13 = v17;
            goto LABEL_27;
          }
          v19 = +[NSUUID UUID];
          v20 = [v19 UUIDString];
          v13 = [v35 URLByAppendingPathComponent:v20];

          uint64_t v43 = 0;
          v44 = &v43;
          uint64_t v45 = 0x3032000000;
          v46 = sub_100004D3C;
          v47 = sub_100004D4C;
          id v48 = 0;
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472;
          v40[2] = sub_100004D54;
          v40[3] = &unk_100010428;
          v42 = &v43;
          v21 = v34;
          v41 = v21;
          [v36 getAsset:v18 completion:v40];
          dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
          if (v44[5])
          {
            v22 = DiagnosticLogHandleForCategory();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v55 = v13;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Saving asset data to [%@]", buf, 0xCu);
            }

            v23 = (void *)v44[5];
            id v39 = v14;
            unsigned int v24 = [v23 writeToURL:v13 options:268435457 error:&v39];
            id v25 = v39;

            if (v24)
            {
              v26 = [(LegacyAudioSystemController *)self fileNameToURL];
              [v26 setObject:v13 forKeyedSubscript:v18];

              int v27 = 1;
              id v14 = v25;
            }
            else
            {
              v30 = DiagnosticLogHandleForCategory();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v31;
                v55 = v13;
                __int16 v56 = 2112;
                id v57 = v25;
                _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Failed to save asset [%@]: %@", buf, 0x16u);
              }

              id v38 = v25;
              +[LegacyAudioSystemController setCode:-59 forError:&v38];
              id v14 = v38;

              [(LegacyAudioSystemController *)self failedToExecuteWithError:v14];
              int v27 = 0;
            }
          }
          else
          {
            v28 = DiagnosticLogHandleForCategory();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v55 = v18;
              _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to download asset: %@", buf, 0xCu);
            }

            id v37 = v14;
            +[LegacyAudioSystemController setCode:-1 forError:&v37];
            id v29 = v37;

            [(LegacyAudioSystemController *)self failedToExecuteWithError:v29];
            int v27 = 0;
            id v14 = v29;
          }

          _Block_object_dispose(&v43, 8);
          if (!v27) {
            goto LABEL_27;
          }
          v16 = (char *)v16 + 1;
          v17 = v13;
        }
        while (v11 != v16);
        id v11 = [obj countByEnumeratingWithState:&v49 objects:v58 count:16];
        if (v11) {
          continue;
        }
        break;
      }
LABEL_27:
    }
    else
    {
      id v14 = 0;
    }
  }
}

- (void)start
{
  [(LegacyAudioSystemController *)self setUpEventNotifications];
  [(LegacyAudioSystemController *)self saveOriginalVolumes];
  v3 = dispatch_queue_create("com.apple.DiagnosticsService.Diagnostic-3909.audioQueue", 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004E50;
  block[3] = &unk_100010450;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)failedToExecuteWithError:(id)a3
{
  id v4 = a3;
  v5 = [(LegacyAudioSystemController *)self result];
  [v5 setData:&__NSDictionary0__struct];

  id v6 = [v4 code];
  id v7 = +[NSNumber numberWithInteger:v6];
  v8 = [(LegacyAudioSystemController *)self result];
  [v8 setStatusCode:v7];

  [(LegacyAudioSystemController *)self cancel];

  [(LegacyAudioSystemController *)self setFinished:1];
}

- (void)cleanUpPlayResults
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [(LegacyAudioSystemController *)self playResults];
  id v2 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v22;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v22 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v7 = v6;
        id v8 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v18;
          do
          {
            for (j = 0; j != v9; j = (char *)j + 1)
            {
              if (*(void *)v18 != v10) {
                objc_enumerationMutation(v7);
              }
              long long v12 = *(void **)(*((void *)&v17 + 1) + 8 * (void)j);
              if ([v12 count])
              {
                unint64_t v13 = 0;
                do
                {
                  id v14 = [v12 objectAtIndexedSubscript:v13];
                  uint64_t v15 = v14;
                  if (!v13) {
                    [v14 freeSourceData];
                  }
                  [v15 freeReceivedData];

                  ++v13;
                }
                while ((unint64_t)[v12 count] > v13);
              }
            }
            id v9 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v9);
        }
      }
      id v3 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v3);
  }
}

- (void)setUpEventNotifications
{
  id v3 = [[DAMotionDetector alloc] initWithThreshold:&off_1000108D0];
  [(LegacyAudioSystemController *)self setMotionDetector:v3];

  uint64_t v4 = objc_alloc_init(DAAudioSessionInterruptDetector);
  [(LegacyAudioSystemController *)self setAudioSessionInterruptDetector:v4];

  v5 = [DAAccessoryDisconnectDetector alloc];
  id v6 = [(LegacyAudioSystemController *)self inputs];
  id v7 = [v6 accessoryModelNumbers];
  id v8 = [(DAAccessoryDisconnectDetector *)v5 initWithModelNumbers:v7];
  [(LegacyAudioSystemController *)self setAccessoryDisconnectDetector:v8];

  id v9 = objc_alloc_init(DAHeadphonesDetector);
  [(LegacyAudioSystemController *)self setHeadphoneDetector:v9];

  uint64_t v10 = [(LegacyAudioSystemController *)self inputs];
  id v11 = [v10 xComponentAccelThreshold];

  if (v11)
  {
    long long v12 = [DAOrientationDetector alloc];
    unint64_t v13 = [(LegacyAudioSystemController *)self inputs];
    id v14 = [v13 xComponentAccelThreshold];
    uint64_t v15 = [(DAOrientationDetector *)v12 initWithxThreshold:v14 zThreshold:&off_100010870];
    [(LegacyAudioSystemController *)self setOrientationDetector:v15];
  }
  v16 = +[NSNotificationCenter defaultCenter];
  v33[0] = @"MotionDetectedNotification";
  v33[1] = @"HeadphonesConnectedNotification";
  v33[2] = @"AccessoryDisconnectedNotification";
  v33[3] = @"AudioSessionInterruptNotification";
  v33[4] = @"IncorrectOrientationNotification";
  +[NSArray arrayWithObjects:v33 count:5];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  id v18 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v29;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v17);
        }
        [v16 addObserver:self selector:@selector(receivedNotification:) name:*((void *)((void *)&v28 + 1) + 8 * i) object:v28];
      }
      id v19 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v19);
  }

  long long v22 = [(LegacyAudioSystemController *)self motionDetector];
  [v22 start];

  long long v23 = [(LegacyAudioSystemController *)self audioSessionInterruptDetector];
  [v23 start];

  long long v24 = [(LegacyAudioSystemController *)self accessoryDisconnectDetector];
  [v24 start];

  id v25 = [(LegacyAudioSystemController *)self headphoneDetector];
  [v25 start];

  v26 = [(LegacyAudioSystemController *)self orientationDetector];

  if (v26)
  {
    int v27 = [(LegacyAudioSystemController *)self orientationDetector];
    [v27 start];
  }
}

- (void)receivedNotification:(id)a3
{
  id v4 = a3;
  v5 = [v4 name];
  unsigned int v6 = [v5 isEqualToString:@"HeadphonesConnectedNotification"];

  if (v6)
  {
    v33 = 0;
    +[LegacyAudioSystemController setCode:-54 forError:&v33];
    id v7 = v33;
    goto LABEL_21;
  }
  id v8 = [v4 name];
  unsigned int v9 = [v8 isEqualToString:@"MotionDetectedNotification"];

  if (v9)
  {
    v32 = 0;
    +[LegacyAudioSystemController setCode:-53 forError:&v32];
    id v7 = v32;
    goto LABEL_21;
  }
  uint64_t v10 = [v4 name];
  if (![v10 isEqualToString:@"AccessoryDisconnectedNotification"])
  {

LABEL_17:
    uint64_t v20 = [v4 name];
    unsigned int v21 = [v20 isEqualToString:@"AudioSessionInterruptNotification"];

    if (v21)
    {
      v26 = 0;
      +[LegacyAudioSystemController setCode:-56 forError:&v26];
      id v7 = v26;
    }
    else
    {
      long long v22 = [v4 name];
      unsigned int v23 = [v22 isEqualToString:@"IncorrectOrientationNotification"];

      if (!v23)
      {
        id v13 = 0;
        goto LABEL_22;
      }
      id v25 = 0;
      +[LegacyAudioSystemController setCode:-61 forError:&v25];
      id v7 = v25;
    }
LABEL_21:
    id v13 = v7;
LABEL_22:
    [(LegacyAudioSystemController *)self failedToExecuteWithError:v13];
    goto LABEL_23;
  }
  unsigned int v11 = [(LegacyAudioSystemController *)self isDockRequired];

  if (!v11) {
    goto LABEL_17;
  }
  long long v12 = [v4 userInfo];
  id v13 = [v12 objectForKeyedSubscript:@"accessoryModelNumber"];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v14 = [(LegacyAudioSystemController *)self inputs];
  uint64_t v15 = [v14 accessoryModelNumbers];

  id v16 = [v15 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v29;
    while (2)
    {
      id v19 = 0;
      do
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(v15);
        }
        if ([*(id *)(*((void *)&v28 + 1) + 8 * (void)v19) isEqualToString:v13])
        {
          id v27 = 0;
          +[LegacyAudioSystemController setCode:-52 forError:&v27];
          id v24 = v27;

          id v13 = v24;
          goto LABEL_22;
        }
        id v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v28 objects:v34 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }

LABEL_23:
}

- (BOOL)confirmDeviceDocked
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = +[EAAccessoryManager sharedAccessoryManager];
  id v4 = [v3 connectedAccessories];

  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        unsigned int v11 = [(LegacyAudioSystemController *)self inputs];
        long long v12 = [v11 accessoryModelNumbers];
        id v13 = [v10 modelNumber];
        unsigned __int8 v14 = [v12 containsObject:v13];

        v7 |= v14;
      }
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  else
  {
    char v7 = 0;
  }

  return v7 & 1;
}

- (BOOL)isDockRequired
{
  id v2 = [(LegacyAudioSystemController *)self inputs];
  id v3 = [v2 accessoryModelNumbers];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

+ (BOOL)setCode:(int64_t)a3 forError:(id *)a4
{
  if (a4)
  {
    *a4 = +[NSError errorWithDomain:@"DAAudioQualityErrorDomain" code:a3 userInfo:0];
  }
  return a4 != 0;
}

- (void)cancel
{
  id v2 = [(LegacyAudioSystemController *)self audioDevice];
  [v2 cancel];
}

- (void)teardown
{
  [(LegacyAudioSystemController *)self restoreAccesibilityStateIfRequired];
  [(LegacyAudioSystemController *)self restoreOriginalVolumes];
  id v3 = [(LegacyAudioSystemController *)self motionDetector];

  if (v3)
  {
    BOOL v4 = [(LegacyAudioSystemController *)self motionDetector];
    [v4 stop];

    [(LegacyAudioSystemController *)self setMotionDetector:0];
  }
  id v5 = [(LegacyAudioSystemController *)self audioSessionInterruptDetector];

  if (v5)
  {
    id v6 = [(LegacyAudioSystemController *)self audioSessionInterruptDetector];
    [v6 stop];

    [(LegacyAudioSystemController *)self setAudioSessionInterruptDetector:0];
  }
  char v7 = [(LegacyAudioSystemController *)self orientationDetector];

  if (v7)
  {
    uint64_t v8 = [(LegacyAudioSystemController *)self orientationDetector];
    [v8 stop];

    [(LegacyAudioSystemController *)self setOrientationDetector:0];
  }
  unsigned int v9 = [(LegacyAudioSystemController *)self accessoryDisconnectDetector];

  if (v9)
  {
    uint64_t v10 = [(LegacyAudioSystemController *)self accessoryDisconnectDetector];
    [v10 stop];

    [(LegacyAudioSystemController *)self setAccessoryDisconnectDetector:0];
  }
  unsigned int v11 = [(LegacyAudioSystemController *)self headphoneDetector];

  if (v11)
  {
    long long v12 = [(LegacyAudioSystemController *)self headphoneDetector];
    [v12 stop];

    [(LegacyAudioSystemController *)self setHeadphoneDetector:0];
  }
  id v13 = +[NSNotificationCenter defaultCenter];
  [v13 removeObserver:self];

  [(LegacyAudioSystemController *)self cleanUpPlayResults];
  id v14 = [(LegacyAudioSystemController *)self diagnosticResponder];
  [v14 enableVolumeHUD:1];
}

- (void)restoreAccesibilityStateIfRequired
{
  if ([(LegacyAudioSystemController *)self monoChanged])
  {
    [(LegacyAudioSystemController *)self isOriginallyMono];
    _AXSMonoAudioSetEnabled();
  }
  if ([(LegacyAudioSystemController *)self balanceChanged])
  {
    id v3 = [(LegacyAudioSystemController *)self originalBalance];
    [v3 floatValue];
    _AXSSetLeftRightAudioBalance();
  }
}

- (BOOL)isMonoChangeRequired
{
  return _AXSMonoAudioEnabled() != 0;
}

- (BOOL)isBalanceChangeRequired
{
  _AXSLeftRightAudioBalance();
  return v2 != 0.0;
}

- (void)setAccessibilityStateIfRequired
{
  [(LegacyAudioSystemController *)self setMonoChanged:0];
  [(LegacyAudioSystemController *)self setBalanceChanged:0];
  if ([(LegacyAudioSystemController *)self isMonoChangeRequired])
  {
    [(LegacyAudioSystemController *)self setIsOriginallyMono:1];
    _AXSMonoAudioSetEnabled();
    [(LegacyAudioSystemController *)self setMonoChanged:1];
  }
  if ([(LegacyAudioSystemController *)self isBalanceChangeRequired])
  {
    id v3 = objc_alloc((Class)NSNumber);
    _AXSLeftRightAudioBalance();
    id v4 = [v3 initWithFloat:];
    [(LegacyAudioSystemController *)self setOriginalBalance:v4];

    _AXSSetLeftRightAudioBalance();
    [(LegacyAudioSystemController *)self setBalanceChanged:1];
  }
}

- (void)saveOriginalVolumes
{
  uint64_t v11 = 0;
  id v3 = +[AVSystemController sharedAVSystemController];
  [v3 getVolume:(char *)&v11 + 4 forCategory:@"PlayAndRecord"];

  id v4 = +[AVSystemController sharedAVSystemController];
  [v4 getVolume:&v11 forCategory:@"Audio/Video"];

  LODWORD(v5) = HIDWORD(v11);
  [(LegacyAudioSystemController *)self setPreviousDeviceVolumePlayAndRecord:v5];
  LODWORD(v6) = v11;
  [(LegacyAudioSystemController *)self setPreviousDeviceVolumeAudioVideo:v6];
  char v7 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    [(LegacyAudioSystemController *)self previousDeviceVolumePlayAndRecord];
    double v9 = v8;
    [(LegacyAudioSystemController *)self previousDeviceVolumeAudioVideo];
    *(_DWORD *)buf = 134218240;
    double v13 = v9;
    __int16 v14 = 2048;
    double v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Save original volumes previousDeviceVolumePlayAndRecord:%f, previousDeviceVolumeAudioVideo:%f", buf, 0x16u);
  }
}

- (void)restoreOriginalVolumes
{
  id v3 = +[AVSystemController sharedAVSystemController];
  [(LegacyAudioSystemController *)self previousDeviceVolumePlayAndRecord];
  [v3 setVolumeTo:@"PlayAndRecord"];

  id v4 = +[AVSystemController sharedAVSystemController];
  [(LegacyAudioSystemController *)self previousDeviceVolumeAudioVideo];
  [v4 setVolumeTo:@"Audio/Video" forCategory:];

  double v5 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    [(LegacyAudioSystemController *)self previousDeviceVolumePlayAndRecord];
    double v7 = v6;
    [(LegacyAudioSystemController *)self previousDeviceVolumeAudioVideo];
    int v9 = 134218240;
    double v10 = v7;
    __int16 v11 = 2048;
    double v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Restore original volumes to previousDeviceVolumePlayAndRecord:%f, previousDeviceVolumeAudioVideo:%f", (uint8_t *)&v9, 0x16u);
  }
}

- (DAAudioDevice)audioDevice
{
  return self->_audioDevice;
}

- (void)setAudioDevice:(id)a3
{
}

- (DAMotionDetector)motionDetector
{
  return self->_motionDetector;
}

- (void)setMotionDetector:(id)a3
{
}

- (DAAccessoryDisconnectDetector)accessoryDisconnectDetector
{
  return self->_accessoryDisconnectDetector;
}

- (void)setAccessoryDisconnectDetector:(id)a3
{
}

- (DAHeadphonesDetector)headphoneDetector
{
  return self->_headphoneDetector;
}

- (void)setHeadphoneDetector:(id)a3
{
}

- (DAOrientationDetector)orientationDetector
{
  return self->_orientationDetector;
}

- (void)setOrientationDetector:(id)a3
{
}

- (DAAudioSessionInterruptDetector)audioSessionInterruptDetector
{
  return self->_audioSessionInterruptDetector;
}

- (void)setAudioSessionInterruptDetector:(id)a3
{
}

- (NSMutableDictionary)fileNameToURL
{
  return self->_fileNameToURL;
}

- (void)setFileNameToURL:(id)a3
{
}

- (NSMutableArray)playResults
{
  return self->_playResults;
}

- (void)setPlayResults:(id)a3
{
}

- (DKResponder)diagnosticResponder
{
  return self->_diagnosticResponder;
}

- (void)setDiagnosticResponder:(id)a3
{
}

- (BOOL)isOriginallyMono
{
  return self->_isOriginallyMono;
}

- (void)setIsOriginallyMono:(BOOL)a3
{
  self->_isOriginallyMono = a3;
}

- (NSNumber)originalBalance
{
  return self->_originalBalance;
}

- (void)setOriginalBalance:(id)a3
{
}

- (BOOL)monoChanged
{
  return self->_monoChanged;
}

- (void)setMonoChanged:(BOOL)a3
{
  self->_monoChanged = a3;
}

- (BOOL)balanceChanged
{
  return self->_balanceChanged;
}

- (void)setBalanceChanged:(BOOL)a3
{
  self->_balanceChanged = a3;
}

- (float)previousDeviceVolumePlayAndRecord
{
  return self->_previousDeviceVolumePlayAndRecord;
}

- (void)setPreviousDeviceVolumePlayAndRecord:(float)a3
{
  self->_previousDeviceVolumePlayAndRecord = a3;
}

- (float)previousDeviceVolumeAudioVideo
{
  return self->_previousDeviceVolumeAudioVideo;
}

- (void)setPreviousDeviceVolumeAudioVideo:(float)a3
{
  self->_previousDeviceVolumeAudioVideo = a3;
}

- (AudioSystemInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_originalBalance, 0);
  objc_storeStrong((id *)&self->_diagnosticResponder, 0);
  objc_storeStrong((id *)&self->_playResults, 0);
  objc_storeStrong((id *)&self->_fileNameToURL, 0);
  objc_storeStrong((id *)&self->_audioSessionInterruptDetector, 0);
  objc_storeStrong((id *)&self->_orientationDetector, 0);
  objc_storeStrong((id *)&self->_headphoneDetector, 0);
  objc_storeStrong((id *)&self->_accessoryDisconnectDetector, 0);
  objc_storeStrong((id *)&self->_motionDetector, 0);

  objc_storeStrong((id *)&self->_audioDevice, 0);
}

@end