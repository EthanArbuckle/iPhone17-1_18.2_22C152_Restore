@interface MADPreheatBackgroundSystemTask
+ (BOOL)buddyCheckRequired;
+ (BOOL)enabled;
+ (id)identifier;
+ (id)sharedTask;
+ (int)clearPixelBuffer:(__CVBuffer *)a3;
+ (unint64_t)taskID;
- (BOOL)oneShot;
- (void)dealloc;
- (void)executeWith:(id)a3 completionHandler:(id)a4;
@end

@implementation MADPreheatBackgroundSystemTask

+ (int)clearPixelBuffer:(__CVBuffer *)a3
{
  CVPixelBufferRef pixelBuffer = a3;
  CVPixelBufferLockFlags unlockFlags = 0;
  if (a3)
  {
    CVReturn v4 = CVPixelBufferLockBaseAddress(a3, 0);
    LODWORD(v18) = v4;
    if (v4)
    {
      int v5 = v4;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10005072C();
      }
    }
    else
    {
      BaseAddress = CVPixelBufferGetBaseAddress(a3);
      size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
      size_t Height = CVPixelBufferGetHeight(a3);
      memset(BaseAddress, 255, Height * BytesPerRow);
      int v5 = sub_10002ABAC(&v18);
      if (pixelBuffer
        && !v18
        && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_1000506B0();
      }
    }
  }
  else
  {
    BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v6) {
      sub_10003036C(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    return -50;
  }
  return v5;
}

+ (id)sharedTask
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004F8B4;
  block[3] = &unk_100219838;
  block[4] = a1;
  if (qword_1002524F0 != -1) {
    dispatch_once(&qword_1002524F0, block);
  }
  v2 = (void *)qword_1002524E8;
  return v2;
}

+ (id)identifier
{
  return @"com.apple.mediaanalysisd.preheat";
}

+ (unint64_t)taskID
{
  return 0;
}

+ (BOOL)buddyCheckRequired
{
  return 0;
}

- (BOOL)oneShot
{
  return 1;
}

+ (BOOL)enabled
{
  return 1;
}

- (void)executeWith:(id)a3 completionHandler:(id)a4
{
  id v66 = a3;
  BOOL v6 = (void (**)(id, uint64_t))a4;
  BYTE1(self->_preheat_completion_semaphore) = 0;
  if (DeviceHasANE())
  {
    if ([(id)objc_opt_class() enabled])
    {
      v64 = +[NSUserDefaults standardUserDefaults];
      v59 = [v64 persistentDomainForName:@"com.apple.mediaanalysisd"];
      v62 = [v59 objectForKey:@"PreheatLastRun"];
      if (v62)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v63 = v62;
          goto LABEL_20;
        }
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          uint64_t v10 = VCPLogInstance();
          os_log_type_t v11 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v10, v11))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v10, v11, "[Preheat] Last run date malformed; dropping", buf, 2u);
          }
        }
      }
      id v63 = 0;
LABEL_20:
      uint64_t v12 = +[NSProcessInfo processInfo];
      [v12 systemUptime];
      double v14 = v13;

      if (v63)
      {
        [v63 timeIntervalSinceNow];
        if (v14 > -v15)
        {
          v16 = [v59 objectForKey:@"PreheatAttempts"];
          v17 = v16;
          if (v16)
          {
            unsigned int v18 = [v16 unsignedIntValue];

            uint64_t v19 = v18 + 1;
            if (v18 >= 2)
            {
              if ((int)MediaAnalysisLogLevel() >= 4)
              {
                v20 = VCPLogInstance();
                os_log_type_t v21 = VCPLogToOSLogType[4];
                if (os_log_type_enabled(v20, v21))
                {
                  *(_DWORD *)buf = 134217984;
                  *(void *)v77 = v19;
                  _os_log_impl((void *)&_mh_execute_header, v20, v21, "Preheat attempted for %lu times, not allowed to retry", buf, 0xCu);
                }
              }
              v6[2](v6, 4294967278);
LABEL_67:

              goto LABEL_68;
            }
          }
          else
          {
            uint64_t v19 = 1;
          }
LABEL_34:
          v24 = +[NSDate now];
          [v64 setObject:v24 forKey:@"PreheatLastRun"];

          v25 = +[NSNumber numberWithUnsignedInteger:v19];
          [v64 setObject:v25 forKey:@"PreheatAttempts"];

          if ((int)MediaAnalysisLogLevel() >= 5)
          {
            v26 = VCPLogInstance();
            os_log_type_t v27 = VCPLogToOSLogType[5];
            if (os_log_type_enabled(v26, v27))
            {
              *(_DWORD *)buf = 67109632;
              *(_DWORD *)v77 = (int)v14;
              *(_WORD *)&v77[4] = 2048;
              *(void *)&v77[6] = v19;
              __int16 v78 = 2048;
              uint64_t v79 = 3;
              _os_log_impl((void *)&_mh_execute_header, v26, v27, "Preheating critical models (%d sec since boot, %lu previous attempts this boot, max allowed: %lu)", buf, 0x1Cu);
            }
          }
          v65 = +[NSMutableArray array];
          id v28 = objc_alloc_init((Class)MADRemoveBackgroundMaskRequest);
          [v65 addObject:v28];

          id v29 = objc_alloc_init((Class)MADVIVisualSearchGatingRequest);
          [v65 addObject:v29];

          if (+[VCPVideoCaptionAnalyzer mode] == (id)1)
          {
            id v30 = [objc_alloc((Class)MADImageCaptionRequest) initWithModelType:3 safetyType:0];
            [v65 addObject:v30];
          }
          if (VCPPhotosMRCCachingSupported())
          {
            id v31 = objc_alloc_init((Class)MADVIMachineReadableCodeDetectionRequest);
            [v65 addObject:v31];
          }
          CVPixelBufferRef pixelBufferOut = 0;
          CFStringRef v74 = kCVPixelBufferIOSurfacePropertiesKey;
          v75 = &__NSDictionary0__struct;
          CFDictionaryRef pixelBufferAttributes = +[NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
          CVPixelBufferCreate(0, 0x140uLL, 0x140uLL, 0x42475241u, pixelBufferAttributes, &pixelBufferOut);
          [(id)objc_opt_class() clearPixelBuffer:pixelBufferOut];
          v32 = objc_alloc_init(VCPClientHandler);
          v33 = *(void **)(&self->_preheat_timed_out + 1);
          *(void *)(&self->_preheat_timed_out + 1) = v32;

          v34 = +[VCPClientManager sharedManager];
          [v34 addClientHandler:*(void *)(&self->_preheat_timed_out + 1)];

          v58 = +[VCPMADServiceImageAsset assetWithPixelBuffer:pixelBufferOut orientation:1 identifier:0 clientBundleID:0 clientTeamID:0];
          v35 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
          dispatch_queue_t v36 = dispatch_queue_create("com.apple.mediaanalysisd.preheat", v35);
          v37 = *(void **)(&self->super._cancelledByDAS + 1);
          *(void *)(&self->super._cancelledByDAS + 1) = v36;

          v38 = (OS_dispatch_queue *)dispatch_semaphore_create(0);
          v39 = *(OS_dispatch_queue **)((char *)&self->_preheat_queue + 1);
          *(OS_dispatch_queue **)((char *)&self->_preheat_queue + 1) = v38;

          v40 = objc_alloc_init(MADScopedWatchdog);
          v70[0] = _NSConcreteStackBlock;
          v70[1] = 3221225472;
          v70[2] = sub_100050504;
          v70[3] = &unk_10021B330;
          id v72 = v66;
          v56 = v40;
          v71 = v56;
          v41 = objc_retainBlock(v70);
          int v60 = ((uint64_t (*)(void))v41[2])();
          if (v60)
          {
            v6[2](v6, 0);
          }
          else
          {
            v69[0] = _NSConcreteStackBlock;
            v69[1] = 3221225472;
            v69[2] = sub_100050550;
            v69[3] = &unk_10021B358;
            v69[4] = self;
            v42 = +[VCPMADServiceImageProcessingTask taskWithRequests:v65 forAsset:v58 cancelBlock:v41 andCompletionHandler:v69];
            v43 = *(NSObject **)(&self->super._cancelledByDAS + 1);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100050564;
            block[3] = &unk_100219FC8;
            id v55 = v42;
            id v68 = v55;
            dispatch_async(v43, block);
            os_log_type_t v44 = VCPLogToOSLogType[5];
            uint64_t v45 = 5;
            while (1)
            {
              v46 = *(NSObject **)((char *)&self->_preheat_queue + 1);
              dispatch_time_t v47 = dispatch_time(0, 5000000000);
              BYTE1(self->_preheat_completion_semaphore) = dispatch_semaphore_wait(v46, v47) != 0;
              int v48 = ((uint64_t (*)(void *))v41[2])(v41);
              int v49 = (unint64_t)(v45 - 5) > 0x37E ? 1 : v48;
              if (v49 == 1) {
                break;
              }
              HIDWORD(v50) = -286331153 * (unsigned __int16)v45;
              LODWORD(v50) = HIDWORD(v50);
              if ((v50 >> 2) <= 0x4444444 && (int)MediaAnalysisLogLevel() >= 5)
              {
                v51 = VCPLogInstance();
                if (os_log_type_enabled(v51, v44))
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)v77 = v45;
                  *(_WORD *)&v77[4] = 1024;
                  *(_DWORD *)&v77[6] = 900;
                  _os_log_impl((void *)&_mh_execute_header, v51, v44, "Preheating for %d/%d seconds", buf, 0xEu);
                }
              }
              v45 += 5;
              if (!BYTE1(self->_preheat_completion_semaphore)) {
                goto LABEL_61;
              }
            }
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              v52 = VCPLogInstance();
              os_log_type_t v53 = VCPLogToOSLogType[3];
              if (os_log_type_enabled(v52, v53))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v77 = v45;
                *(_WORD *)&v77[4] = 1024;
                *(_DWORD *)&v77[6] = 900;
                _os_log_impl((void *)&_mh_execute_header, v52, v53, "Preheating canceled or timed out after %d/%d seconds", buf, 0xEu);
              }
            }
            [v55 cancel];
LABEL_61:
          }
          if ((v60 & 1) == 0)
          {
            if (!BYTE1(self->_preheat_completion_semaphore))
            {
              v54 = +[VCPClientManager sharedManager];
              [v54 removeClientHandler:*(void *)(&self->_preheat_timed_out + 1)];
            }
            v6[2](v6, 0);
          }

          sub_100004484((const void **)&pixelBufferOut);
          goto LABEL_67;
        }
      }
      else if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v22 = VCPLogInstance();
        os_log_type_t v23 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v22, v23))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, v23, "No last preheat run time recorded, clearing attempts to 0", buf, 2u);
        }
      }
      uint64_t v19 = 0;
      goto LABEL_34;
    }
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      uint64_t v7 = VCPLogInstance();
      os_log_type_t v8 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v7, v8))
      {
        *(_WORD *)buf = 0;
        uint64_t v9 = "[Preheat] BackgroundSystemTask disabled; skipping";
        goto LABEL_12;
      }
      goto LABEL_13;
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 5)
  {
    uint64_t v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v7, v8))
    {
      *(_WORD *)buf = 0;
      uint64_t v9 = "Device does not require model pre-warming; skipping";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v7, v8, v9, buf, 2u);
    }
LABEL_13:
  }
  v6[2](v6, 4294967278);
LABEL_68:
}

- (void)dealloc
{
  if (BYTE1(self->_preheat_completion_semaphore))
  {
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)((char *)&self->_preheat_queue + 1), 0xFFFFFFFFFFFFFFFFLL);
    v3 = +[VCPClientManager sharedManager];
    [v3 removeClientHandler:*(void *)(&self->_preheat_timed_out + 1)];
  }
  v4.receiver = self;
  v4.super_class = (Class)MADPreheatBackgroundSystemTask;
  [(MADPreheatBackgroundSystemTask *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)(&self->_preheat_timed_out + 1), 0);
  objc_storeStrong((id *)((char *)&self->_preheat_queue + 1), 0);
  objc_storeStrong((id *)(&self->super._cancelledByDAS + 1), 0);
}

@end