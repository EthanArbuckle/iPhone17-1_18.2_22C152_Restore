@interface VCPAutoBugCapture
+ (BOOL)captureCrashWithKnownTimeoutRisk:(unint64_t)a3;
+ (BOOL)captureTimeoutCrashWithSubType:(id)a3;
+ (id)timeoutSubTypeForKnownTimeoutRisk:(unint64_t)a3;
@end

@implementation VCPAutoBugCapture

+ (id)timeoutSubTypeForKnownTimeoutRisk:(unint64_t)a3
{
  CFStringRef v3 = @"CoreML";
  if (a3 != 3) {
    CFStringRef v3 = 0;
  }
  if (a3 == 1) {
    return @"Photos";
  }
  else {
    return (id)v3;
  }
}

+ (BOOL)captureCrashWithKnownTimeoutRisk:(unint64_t)a3
{
  int v3 = a3;
  v5 = objc_msgSend(a1, "timeoutSubTypeForKnownTimeoutRisk:");
  if (v5)
  {
    unsigned __int8 v6 = [a1 captureTimeoutCrashWithSubType:v5];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v7 = VCPLogInstance();
      os_log_type_t v8 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v7, v8))
      {
        v10[0] = 67109120;
        v10[1] = v3;
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "[VCPAutoBugCapture] unknown bug type: %d", (uint8_t *)v10, 8u);
      }
    }
    unsigned __int8 v6 = 0;
  }

  return v6;
}

+ (BOOL)captureTimeoutCrashWithSubType:(id)a3
{
  id v3 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2050000000;
  v4 = (void *)qword_100252868;
  uint64_t v28 = qword_100252868;
  if (!qword_100252868)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_10014B88C;
    v30 = &unk_10021EB68;
    v31 = &v25;
    sub_10014B88C((uint64_t)buf);
    v4 = (void *)v26[3];
  }
  v5 = v4;
  _Block_object_dispose(&v25, 8);
  id v6 = objc_alloc_init(v5);
  v7 = [v6 signatureWithDomain:@"MediaAnalysis" type:@"Timeout" subType:v3 subtypeContext:0 detectedProcess:@"com.apple.mediaanalysisd" triggerThresholdValues:0];
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10014B338;
  v16[3] = &unk_10021EB40;
  id v9 = v3;
  id v17 = v9;
  v20 = &v21;
  id v10 = v7;
  id v18 = v10;
  v11 = v8;
  v19 = v11;
  if (([v6 snapshotWithSignature:v10 delay:0 events:0 payload:0 actions:v16 reply:0.0] & 1) == 0&& (int)MediaAnalysisLogLevel() >= 3)
  {
    v12 = VCPLogInstance();
    os_log_type_t v13 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v12, v13))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "[VCPAutoBugCapture] Failed to report crash %@ to reporter %@", buf, 0x16u);
    }
  }
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  BOOL v14 = *((unsigned char *)v22 + 24) != 0;

  _Block_object_dispose(&v21, 8);
  return v14;
}

@end