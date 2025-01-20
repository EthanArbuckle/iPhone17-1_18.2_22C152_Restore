@interface VeridianFWUpdateController
- (NSString)fwDigest;
- (NSURL)fwURL;
- (VeridianFWUpdaterInputs)inputs;
- (int64_t)_downloadVeridianFirmwareWithError:(id *)a3;
- (int64_t)_requestFWURLAndDigestFromAST2WithError:(id *)a3;
- (int64_t)_updateVeridianFirmwareWithError:(id *)a3;
- (int64_t)_validateDeviceWithError:(id *)a3;
- (void)setFwDigest:(id)a3;
- (void)setFwURL:(id)a3;
- (void)setInputs:(id)a3;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
@end

@implementation VeridianFWUpdateController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = handleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315650;
    v12 = "-[VeridianFWUpdateController setupWithInputs:responder:]";
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: %@, %@", (uint8_t *)&v11, 0x20u);
  }

  [(VeridianFWUpdateController *)self setInputs:v6];
  v9 = [(VeridianFWUpdateController *)self inputs];

  if (!v9)
  {
    v10 = [(VeridianFWUpdateController *)self result];
    [v10 setStatusCode:&off_1000088A8];

    [(VeridianFWUpdateController *)self setFinished:1];
  }
}

- (void)start
{
  v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v54 = "-[VeridianFWUpdateController start]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if ((+[CRRepairStatus isVeridianFWUpdateRequiredLite] & 1) == 0)
  {
    v9 = +[CRRepairStatus getVeridianFWVersionInfo];
    v8 = handleForCategory();
    v43 = v9;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No need to update Veridian FW", buf, 2u);
    }
    int64_t v6 = 0;
    id v7 = 0;
    v10 = v9;
    goto LABEL_22;
  }
  v4 = [(VeridianFWUpdateController *)self inputs];
  unsigned int v5 = [v4 needRequestURL];

  if (v5)
  {
    id v50 = 0;
    int64_t v6 = [(VeridianFWUpdateController *)self _requestFWURLAndDigestFromAST2WithError:&v50];
    id v7 = v50;
    if (v6)
    {
      v8 = handleForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        sub_100005900();
LABEL_44:
        v43 = 0;
        v10 = 0;
        goto LABEL_22;
      }
      goto LABEL_21;
    }
  }
  else
  {
    int v11 = [(VeridianFWUpdateController *)self inputs];
    v12 = [v11 FWURL];
    [(VeridianFWUpdateController *)self setFwURL:v12];

    __int16 v13 = [(VeridianFWUpdateController *)self inputs];
    id v14 = [v13 FWDigest];
    [(VeridianFWUpdateController *)self setFwDigest:v14];

    id v7 = 0;
    int64_t v6 = -24;
  }
  __int16 v15 = [(VeridianFWUpdateController *)self fwURL];
  id v16 = [v15 absoluteString];
  if ((unint64_t)[v16 length] >= 0x401)
  {

LABEL_20:
    v8 = handleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      sub_1000058CC();
      goto LABEL_44;
    }
LABEL_21:
    v10 = 0;
    v43 = 0;
    goto LABEL_22;
  }
  v17 = [(VeridianFWUpdateController *)self fwDigest];
  id v18 = [v17 length];

  if ((unint64_t)v18 >= 0x401) {
    goto LABEL_20;
  }
  v19 = +[CRRepairStatus getVeridianFWVersionInfo];
  id v49 = v7;
  int64_t v6 = [(VeridianFWUpdateController *)self _validateDeviceWithError:&v49];
  id v20 = v49;

  if (v6)
  {
    v8 = handleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100005898();
    }
    goto LABEL_52;
  }
  id v48 = v20;
  int64_t v6 = [(VeridianFWUpdateController *)self _downloadVeridianFirmwareWithError:&v48];
  id v7 = v48;

  if (!v6)
  {
    id v47 = v7;
    int64_t v6 = [(VeridianFWUpdateController *)self _updateVeridianFirmwareWithError:&v47];
    id v20 = v47;

    if (!v6)
    {
      v43 = +[CRRepairStatus getVeridianFWVersionInfo];
      v10 = v19;
      v8 = v19;
LABEL_18:
      id v7 = v20;
      goto LABEL_22;
    }
    v8 = handleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000057F8((uint64_t)v20, v8, v35, v36, v37, v38, v39, v40);
    }
LABEL_52:
    v10 = v19;
    v43 = v19;
    goto LABEL_18;
  }
  v8 = handleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_100005864();
  }
  v10 = v19;
  v43 = v19;
LABEL_22:

  v21 = +[CRUtils getInnermostNSError:v7];

  v22 = +[NSNumber numberWithInteger:v6];
  v46 = self;
  v23 = [(VeridianFWUpdateController *)self result];
  [v23 setStatusCode:v22];

  v51[0] = @"pluginVersion";
  v44 = +[NSBundle mainBundle];
  uint64_t v24 = [v44 objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
  v25 = (void *)v24;
  if (!v24)
  {
    uint64_t v24 = +[NSNull null];
  }
  v42 = (void *)v24;
  v52[0] = v24;
  v51[1] = @"error";
  uint64_t v26 = [v21 description];
  v27 = (void *)v26;
  if (!v26)
  {
    uint64_t v26 = +[NSNull null];
  }
  v52[1] = v26;
  v51[2] = @"errorCode";
  v28 = [NSNumber numberWithInteger:[v21 code:v26]];
  v29 = v28;
  if (!v28)
  {
    v29 = +[NSNull null];
  }
  v45 = v21;
  v52[2] = v29;
  v51[3] = @"oldVeridianFWVersion";
  v30 = v10;
  if (!v10)
  {
    v30 = +[NSNull null];
  }
  v31 = v10;
  v52[3] = v30;
  v51[4] = @"newVeridianFWVersion";
  v32 = v43;
  if (!v43)
  {
    v32 = +[NSNull null];
  }
  v52[4] = v32;
  v33 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:5];
  v34 = [(VeridianFWUpdateController *)v46 result];
  [v34 setData:v33];

  if (v43)
  {
    if (v31) {
      goto LABEL_34;
    }
LABEL_41:

    if (v28) {
      goto LABEL_35;
    }
    goto LABEL_42;
  }

  if (!v31) {
    goto LABEL_41;
  }
LABEL_34:
  if (v28) {
    goto LABEL_35;
  }
LABEL_42:

LABEL_35:
  if (!v27) {

  }
  if (!v25) {
  [(VeridianFWUpdateController *)v46 setFinished:1];
  }
}

- (int64_t)_requestFWURLAndDigestFromAST2WithError:(id *)a3
{
  unsigned int v5 = handleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[VeridianFWUpdateController _requestFWURLAndDigestFromAST2WithError:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v56 = 0x3032000000;
  v57 = sub_100003874;
  v58 = sub_100003884;
  id v59 = 0;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  id v48 = sub_100003874;
  id v49 = sub_100003884;
  id v50 = 0;
  int64_t v6 = (void *)MGCopyAnswer();
  if (!v6)
  {
    uint64_t v21 = createCRError((void *)0xFFFFFFFFFFFFFFD6, @"Failed to get device FGSN", 0);
    v22 = 0;
    v23 = 0;
    v9 = 0;
    __int16 v13 = 0;
    id v14 = 0;
    id v18 = 0;
    goto LABEL_11;
  }
  id v7 = handleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v51 = 138412290;
    v52 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Request Veridian fwURL & fwDigest with device serial number: %@", v51, 0xCu);
  }

  v8 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
  v9 = +[NSURLSession sessionWithConfiguration:v8 delegate:self delegateQueue:0];

  v10 = [(VeridianFWUpdateController *)self inputs];
  int v11 = [v10 ast2RequestURL];
  v12 = +[NSURL URLWithString:v11];
  __int16 v13 = +[NSMutableURLRequest requestWithURL:v12];

  [v13 setHTTPMethod:@"POST"];
  [v13 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  id v14 = +[NSMutableDictionary dictionary];
  [v14 setObject:v6 forKey:@"serialNumber"];
  __int16 v15 = +[NSJSONSerialization dataWithJSONObject:v14 options:0 error:0];
  [v13 setHTTPBody:v15];

  dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_10000388C;
  v41[3] = &unk_1000082D8;
  p_long long buf = &buf;
  v44 = &v45;
  id v18 = v16;
  v42 = v18;
  v19 = [v9 dataTaskWithRequest:v13 completionHandler:v41];
  [v19 resume];

  dispatch_time_t v20 = dispatch_time(0, 15000000000);
  if (dispatch_semaphore_wait(v18, v20))
  {
    uint64_t v21 = createCRError((void *)0xFFFFFFFFFFFFFFF3, @"Waiting for fwURL & fwDigest from AST2 timeout", 0);
LABEL_8:
    v22 = 0;
LABEL_9:
    v23 = 0;
LABEL_11:
    uint64_t v24 = *(NSObject **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v21;
    int64_t v25 = -24;
    goto LABEL_12;
  }
  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    v22 = 0;
    v23 = 0;
    int64_t v25 = -24;
    if (!a3) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  v27 = [(id)v46[5] objectForKeyedSubscript:@"batteryFW"];
  v22 = [v27 objectForKeyedSubscript:@"fwURL"];

  if (!v22)
  {
    uint64_t v21 = createCRError((void *)0xFFFFFFFFFFFFFFE8, @"fwURL is nil from AST2", 0);
    goto LABEL_8;
  }
  v28 = +[NSURL URLWithString:v22];
  [(VeridianFWUpdateController *)self setFwURL:v28];

  v29 = [(VeridianFWUpdateController *)self fwURL];
  if (!v29) {
    goto LABEL_25;
  }
  uint64_t v39 = [(VeridianFWUpdateController *)self fwURL];
  uint64_t v37 = [v39 host];
  if (!v37)
  {

    goto LABEL_25;
  }
  uint64_t v36 = [(VeridianFWUpdateController *)self fwURL];
  v30 = [v36 scheme];
  if ([v30 caseInsensitiveCompare:@"http"])
  {

    goto LABEL_27;
  }
  uint64_t v35 = [(VeridianFWUpdateController *)self fwURL];
  v34 = [v35 scheme];
  BOOL v33 = [v34 caseInsensitiveCompare:@"https"] == 0;

  if (v33)
  {
LABEL_25:
    uint64_t v21 = createCRError((void *)0xFFFFFFFFFFFFFFE8, @"Invaild fwURL from AST2", 0);
    goto LABEL_9;
  }
LABEL_27:
  v31 = [(id)v46[5] objectForKeyedSubscript:@"batteryFW"];
  v23 = [v31 objectForKeyedSubscript:@"fwDigest"];

  if (!v23)
  {
    uint64_t v21 = createCRError((void *)0xFFFFFFFFFFFFFFE8, @"fwDigest is nil from AST2", 0);
    goto LABEL_9;
  }
  [(VeridianFWUpdateController *)self setFwDigest:v23];
  uint64_t v24 = handleForCategory();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v40 = [(VeridianFWUpdateController *)self fwURL];
    uint64_t v32 = [(VeridianFWUpdateController *)self fwDigest];
    *(_DWORD *)v51 = 138412546;
    v52 = v40;
    __int16 v53 = 2112;
    uint64_t v54 = v32;
    uint64_t v38 = (void *)v32;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Request Veridian fwURL: %@ and fwDigest: %@ from AST2 successfully", v51, 0x16u);
  }
  int64_t v25 = 0;
LABEL_12:

  if (a3) {
LABEL_13:
  }
    *a3 = *(id *)(*((void *)&buf + 1) + 40);
LABEL_14:

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&buf, 8);

  return v25;
}

- (int64_t)_downloadVeridianFirmwareWithError:(id *)a3
{
  v4 = handleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[VeridianFWUpdateController _downloadVeridianFirmwareWithError:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v39 = +[NSURL fileURLWithPath:@"/private/var/tmp/VeridianFWImage/FirmwareMap.plist"];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v65 = 0x3032000000;
  v66 = sub_100003874;
  v67 = sub_100003884;
  id v68 = 0;
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x3032000000;
  v57 = sub_100003874;
  v58 = sub_100003884;
  dispatch_semaphore_t v59 = dispatch_semaphore_create(0);
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x3032000000;
  v52[3] = sub_100003874;
  v52[4] = sub_100003884;
  id v53 = 0;
  uint64_t v48 = 0;
  id v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v51 = 0;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  uint64_t v45 = sub_100003874;
  v46 = sub_100003884;
  id v47 = 0;
  mkdir("/private/var/tmp/VeridianFWImage/", 0x1C0u);
  unsigned int v5 = 0;
  uint64_t v40 = 0;
  unsigned int v6 = 0;
  int64_t v38 = -23;
  do
  {
    v8 = (void *)v43[5];
    v43[5] = 0;

    v9 = +[NSFileManager defaultManager];
    unsigned int v10 = [v9 fileExistsAtPath:@"/private/var/tmp/VeridianFWImage/FirmwareMap.plist"];

    if (v10)
    {
      int v11 = +[NSFileManager defaultManager];
      [v11 removeItemAtPath:@"/private/var/tmp/VeridianFWImage/FirmwareMap.plist" error:0];
    }
    sleep(v5);
    v12 = handleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v60 = 67109120;
      LODWORD(v61) = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Downloading the FirmwareMap:counter:%d", v60, 8u);
    }

    __int16 v13 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
    id v14 = objc_opt_new();
    __int16 v15 = +[NSURLSession sessionWithConfiguration:v13 delegate:v14 delegateQueue:0];
    dispatch_semaphore_t v16 = [(VeridianFWUpdateController *)self fwURL];
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10000416C;
    v41[3] = &unk_100008300;
    void v41[4] = &buf;
    v41[5] = &v48;
    v41[6] = v52;
    v41[7] = &v42;
    v41[8] = &v54;
    v17 = [v15 downloadTaskWithURL:v16 completionHandler:v41];
    [v17 resume];

    id v18 = v55[5];
    v19 = [(VeridianFWUpdateController *)self inputs];
    dispatch_time_t v20 = [v19 timeoutPeriod];
    dispatch_time_t v21 = dispatch_time(0, 1000000000 * (int)[v20 intValue]);
    intptr_t v22 = dispatch_semaphore_wait(v18, v21);

    if (v22 || !*(void *)(*((void *)&buf + 1) + 40) || v43[5] || !*((unsigned char *)v49 + 24))
    {
      v23 = handleForCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v34 = *(void *)(*((void *)&buf + 1) + 40);
        uint64_t v35 = v43[5];
        *(_DWORD *)v60 = 138412546;
        uint64_t v61 = v34;
        __int16 v62 = 2112;
        uint64_t v63 = v35;
        _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to download firmwareMap::location:%@:error:%@", v60, 0x16u);
      }
      int v24 = 0;
    }
    else
    {
      v27 = handleForCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v60 = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Asset download success", v60, 2u);
      }

      uint64_t v28 = [v39 SHA256DigestString];

      v29 = [(VeridianFWUpdateController *)self fwDigest];
      BOOL v30 = [v29 caseInsensitiveCompare:v28] == 0;

      if (v30)
      {
        v23 = handleForCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v60 = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Asset digest match success", v60, 2u);
        }
        int64_t v38 = 0;
        int v24 = 1;
      }
      else
      {
        v31 = [(VeridianFWUpdateController *)self fwDigest];
        v23 = +[NSString stringWithFormat:@"Digest Mismatched, Download Failure:%@:%@", v31, v28];

        uint64_t v32 = createCRError((void *)0xFFFFFFFFFFFFFFE9, v23, 0);
        BOOL v33 = (void *)v43[5];
        v43[5] = v32;

        int v24 = 0;
      }
      uint64_t v40 = (void *)v28;
    }

    if (v6++ > 1) {
      int v26 = 1;
    }
    else {
      int v26 = v24;
    }
    v5 += 3;
  }
  while (v26 != 1);
  if (a3) {
    *a3 = (id) v43[5];
  }

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(v52, 8);

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&buf, 8);

  return v38;
}

- (int64_t)_updateVeridianFirmwareWithError:(id *)a3
{
  unsigned int v5 = handleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    *(void *)dispatch_semaphore_t v59 = "-[VeridianFWUpdateController _updateVeridianFirmwareWithError:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  uint64_t v54 = 0;
  v55 = 0;
  value = +[NSNumber numberWithInt:3];
  uint64_t v52 = 0;
  id v53 = 0;
  CFURLRef v6 = CFURLCreateWithFileSystemPath(0, @"/private/var/tmp/VeridianFWImage/", kCFURLPOSIXPathStyle, 1u);
  CStringPtr = CFStringGetCStringPtr(@"T200", 0x8000100u);
  uint64_t v40 = a3;
  if (CStringPtr && v6)
  {
    v41 = self;
    id v7 = 0;
    unsigned int v8 = 0;
    key = (void *)kAMAuthInstallUpdaterDeviceInfo;
    int64_t v9 = -24;
    while (1)
    {
      uint64_t v52 = 0;
      id v53 = 0;

      Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      v12 = Mutable;
      if (!Mutable)
      {
        __int16 v15 = handleForCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_100005A40(&v50, v51);
        }
        id v7 = 0;
        char v16 = 0;
        goto LABEL_18;
      }
      CFDictionarySetValue(Mutable, kT200OptionUpdateType, value);
      CFDictionarySetValue(v12, @"BundlePath", v6);
      uint64_t v13 = T200UpdaterCreate();
      id v7 = v55;
      if (v13) {
        BOOL v14 = v55 == 0;
      }
      else {
        BOOL v14 = 0;
      }
      if (!v14)
      {
        v55 = 0;
        __int16 v15 = handleForCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 136315394;
          *(void *)dispatch_semaphore_t v59 = CStringPtr;
          *(_WORD *)&v59[8] = 2112;
          *(void *)&v59[10] = v7;
          _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to create %s obj::error:%@", buf, 0x16u);
        }
        char v16 = 0;
LABEL_14:
        int64_t v9 = -24;
        goto LABEL_18;
      }
      id v18 = handleForCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Created the Veridian Updater", buf, 2u);
      }

      if (T200UpdaterIsDone())
      {
        id v7 = 0;
        char v16 = 0;
        goto LABEL_19;
      }
      char v16 = 0;
      while (1)
      {
        id v7 = v55;
        if (v55)
        {
          v55 = 0;
          __int16 v15 = handleForCategory();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            goto LABEL_14;
          }
LABEL_52:
          *(_DWORD *)long long buf = 138412290;
          *(void *)dispatch_semaphore_t v59 = v7;
          uint64_t v32 = v15;
          BOOL v33 = "T200UpdaterExecCommand failed:%@";
          uint32_t v34 = 12;
LABEL_63:
          _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, v33, buf, v34);
          goto LABEL_14;
        }
        int v19 = T200UpdaterExecCommand();
        id v7 = v55;
        if (!v19 || v55)
        {
          v55 = 0;
          __int16 v15 = handleForCategory();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            goto LABEL_14;
          }
          goto LABEL_52;
        }
        dispatch_time_t v20 = handleForCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)dispatch_semaphore_t v59 = v53;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Device Info Dict is %@", buf, 0xCu);
        }

        CFDictionarySetValue(v12, key, v53);
        id v21 = +[CRPersonalizationManager getDefaultAMAuthInstallRef];
        if (!v21) {
          break;
        }
        id v22 = v21;
        CFURLRef v23 = v6;
        int v24 = [(VeridianFWUpdateController *)v41 inputs];
        if ([v24 useAppleConnect])
        {

          int64_t v25 = &AMSupportSafeRelease_ptr;
        }
        else
        {
          int64_t v25 = &AMSupportSafeRelease_ptr;
          unsigned __int8 v26 = +[CRPersonalizationManager shouldPersonalizeWithSSOByDefault];

          if ((v26 & 1) == 0) {
            goto LABEL_38;
          }
        }
        if ([v25[61] enableSSO:v22])
        {
          __int16 v15 = handleForCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            sub_100005A98(&v46, v47);
          }
          id v7 = 0;
          CFURLRef v6 = v23;
          goto LABEL_67;
        }
LABEL_38:
        v27 = [v25[61] initWithAuthInstallObj:v22];
        id v45 = 0;
        unsigned int v28 = [v27 getBMUTicketForVeridianFWUpdateWithOptions:v12 BMUTicket:&v54 error:&v45];
        id v7 = v45;

        v29 = handleForCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)dispatch_semaphore_t v59 = v54;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "BMU ticket:%@", buf, 0xCu);
        }

        if (!v28 || !v54 || v7)
        {
          unsigned int v35 = +[CRPersonalizationManager IsTatsuErrorNetworkingRelated:](CRPersonalizationManager, "IsTatsuErrorNetworkingRelated:", [v7 code]);
          uint64_t v36 = -15;
          if (v35) {
            uint64_t v36 = -13;
          }
          int64_t v39 = v36;
          __int16 v15 = handleForCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 67109378;
            *(_DWORD *)dispatch_semaphore_t v59 = v28;
            *(_WORD *)&v59[4] = 2112;
            *(void *)&v59[6] = v7;
            _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Veridan FW Personalization failed:%d:%@", buf, 0x12u);
          }
          CFURLRef v6 = v23;
          int64_t v9 = v39;
          goto LABEL_18;
        }
        CFDictionaryAddValue(v12, @"BMU,Ticket", v54);
        uint64_t v56 = kT200SkipFirmwareMapStore;
        v57 = &__kCFBooleanTrue;
        CFDictionaryAddValue(v12, @"Options", +[NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1]);
        int v30 = T200UpdaterExecCommand();
        id v7 = v55;
        if (!v30 || v55)
        {
          v55 = 0;
          __int16 v15 = handleForCategory();
          CFURLRef v6 = v23;
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            goto LABEL_14;
          }
          *(_DWORD *)long long buf = 138412546;
          *(void *)dispatch_semaphore_t v59 = v7;
          *(_WORD *)&v59[8] = 2112;
          *(void *)&v59[10] = v52;
          uint64_t v32 = v15;
          BOOL v33 = "T200UpdaterExecCommand failed: %@:%@";
          uint32_t v34 = 22;
          goto LABEL_63;
        }
        v31 = handleForCategory();
        CFURLRef v6 = v23;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Veridian Firmware Update Successful", buf, 2u);
        }

        char v16 = 1;
        if (T200UpdaterIsDone())
        {
          id v7 = 0;
          int64_t v9 = 0;
          goto LABEL_19;
        }
      }
      __int16 v15 = handleForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100005A6C(&v48, v49);
      }
      id v7 = 0;
LABEL_67:
      int64_t v9 = -15;
LABEL_18:

LABEL_19:
      AMSupportSafeRelease();
      AMSupportSafeRelease();
      AMSupportSafeRelease();
      AMSupportSafeRelease();
      AMSupportSafeRelease();
      if ((v16 & 1) == 0 && v8++ < 2) {
        continue;
      }
      goto LABEL_71;
    }
  }
  uint64_t v37 = handleForCategory();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
    sub_100005A0C();
  }

  id v7 = 0;
  int64_t v9 = -24;
LABEL_71:
  if (v40) {
    *uint64_t v40 = v7;
  }
  AMSupportSafeRelease();

  return v9;
}

- (int64_t)_validateDeviceWithError:(id *)a3
{
  v4 = handleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315138;
    v17 = "-[VeridianFWUpdateController _validateDeviceWithError:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v16, 0xCu);
  }

  if ((+[CRFDRBaseDeviceHandler isFDRDataClassSupported:@"vcrt"] & 1) == 0)
  {
    int64_t v9 = @"Veridian FW Update not supported";
    goto LABEL_20;
  }
  if (&kT200SkipFirmwareMapStore) {
    BOOL v5 = &_T200UpdaterExecCommand == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5 || &_T200UpdaterIsDone == 0 || &_T200UpdaterCreate == 0 || &kT200OptionUpdateType == 0)
  {
    int64_t v9 = @"Veridian symbols absent";
LABEL_20:
    int64_t v10 = -22;
    uint64_t v11 = -22;
    goto LABEL_21;
  }
  BOOL v14 = objc_opt_new();
  unsigned __int8 v15 = [v14 isFirstAuthComplete];

  if (v15)
  {
    int64_t v10 = 0;
    v12 = 0;
    if (!a3) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  int64_t v9 = @"Veridian First Auth Not Complete";
  int64_t v10 = -21;
  uint64_t v11 = -21;
LABEL_21:
  v12 = createCRError((void *)v11, v9, 0);
  if (a3) {
LABEL_22:
  }
    *a3 = v12;
LABEL_23:

  return v10;
}

- (VeridianFWUpdaterInputs)inputs
{
  return self->inputs;
}

- (void)setInputs:(id)a3
{
}

- (NSURL)fwURL
{
  return self->_fwURL;
}

- (void)setFwURL:(id)a3
{
}

- (NSString)fwDigest
{
  return self->_fwDigest;
}

- (void)setFwDigest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fwDigest, 0);
  objc_storeStrong((id *)&self->_fwURL, 0);

  objc_storeStrong((id *)&self->inputs, 0);
}

@end