@interface UpdatePluginsController
- (NSString)pdiDigest;
- (NSURL)pdiURL;
- (UpdatePluginsInputs)inputs;
- (id)diskPluginsMap;
- (int64_t)_downloadDiskImageWithError:(id *)a3;
- (int64_t)_performPluginsUpdateWithError:(id *)a3;
- (int64_t)_requestUpdateURLAndDigestFromAST2WithError:(id *)a3;
- (void)setInputs:(id)a3;
- (void)setPdiDigest:(id)a3;
- (void)setPdiURL:(id)a3;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
@end

@implementation UpdatePluginsController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v6 = a3;
  v7 = (DKResponder *)a4;
  v8 = handleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315650;
    v13 = "-[UpdatePluginsController setupWithInputs:responder:]";
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: %@, %@", (uint8_t *)&v12, 0x20u);
  }

  [(UpdatePluginsController *)self setInputs:v6];
  diagsReponder = self->diagsReponder;
  self->diagsReponder = v7;

  v10 = [(UpdatePluginsController *)self inputs];

  if (!v10)
  {
    v11 = [(UpdatePluginsController *)self result];
    [v11 setStatusCode:&off_1000089A8];

    [(UpdatePluginsController *)self setFinished:1];
  }
}

- (void)start
{
  v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v62 = "-[UpdatePluginsController start]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v4 = (CRPluginsController *)objc_opt_new();
  pluginsHandle = self->pluginsHandle;
  self->pluginsHandle = v4;

  id v6 = [(UpdatePluginsController *)self inputs];
  unsigned int v7 = [v6 needRequestURL];

  if (v7)
  {
    id v58 = 0;
    int64_t v8 = [(UpdatePluginsController *)self _requestUpdateURLAndDigestFromAST2WithError:&v58];
    id v9 = v58;
    if (v8)
    {
      v34 = handleForCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        sub_1000059FC((uint64_t)v9, v34, v48, v49, v50, v51, v52, v53);
      }
      goto LABEL_39;
    }
    uint64_t v10 = [(UpdatePluginsController *)self pdiURL];
    if (!v10
      || (v11 = (void *)v10,
          [(UpdatePluginsController *)self pdiDigest],
          int v12 = objc_claimAutoreleasedReturnValue(),
          v12,
          v11,
          !v12))
    {
      uint64_t v13 = 0;
      int64_t v8 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    __int16 v14 = [(UpdatePluginsController *)self inputs];
    id v15 = [v14 PDIURL];
    [(UpdatePluginsController *)self setPdiURL:v15];

    __int16 v16 = [(UpdatePluginsController *)self inputs];
    v17 = [v16 PDIDigest];
    [(UpdatePluginsController *)self setPdiDigest:v17];

    id v9 = 0;
  }
  v18 = v9;
  id v57 = v9;
  int64_t v8 = [(UpdatePluginsController *)self _downloadDiskImageWithError:&v57];
  id v9 = v57;

  if (v8)
  {
    v34 = handleForCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_100005990((uint64_t)v9, v34, v35, v36, v37, v38, v39, v40);
    }
LABEL_39:

    uint64_t v13 = 0;
    goto LABEL_15;
  }
  id v56 = v9;
  int64_t v8 = [(UpdatePluginsController *)self _performPluginsUpdateWithError:&v56];
  id v19 = v56;

  if (v8)
  {
    v41 = handleForCategory();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      sub_100005924((uint64_t)v19, v41, v42, v43, v44, v45, v46, v47);
    }

    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = [(UpdatePluginsController *)self diskPluginsMap];
    v20 = handleForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Reloading the Diagnostics Plugins", buf, 2u);
    }

    [(DKResponder *)self->diagsReponder requestPluginReloadOnFinishWithCompletion:&stru_100008288];
    int64_t v8 = 0;
  }
  id v9 = v19;
LABEL_15:
  v21 = +[CRUtils getInnermostNSError:v9];

  v22 = +[NSNumber numberWithInteger:v8];
  v23 = [(UpdatePluginsController *)self result];
  [v23 setStatusCode:v22];

  v59[0] = @"MountPath";
  pdiMountPath = self->pdiMountPath;
  uint64_t v25 = (uint64_t)pdiMountPath;
  if (!pdiMountPath)
  {
    uint64_t v25 = +[NSNull null];
  }
  v54 = (void *)v25;
  v60[0] = v25;
  v60[1] = @"1.0";
  v59[1] = @"pluginVersion";
  v59[2] = @"error";
  v26 = [v21 description];
  v27 = v26;
  if (!v26)
  {
    v27 = +[NSNull null];
  }
  v60[2] = v27;
  v59[3] = @"errorCode";
  v55 = v21;
  v28 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v21 code]);
  v29 = v28;
  if (!v28)
  {
    v29 = +[NSNull null];
  }
  v60[3] = v29;
  v59[4] = @"newPluginVersions";
  v30 = (void *)v13;
  v31 = (void *)v13;
  if (!v13)
  {
    v30 = +[NSNull null];
  }
  v60[4] = v30;
  v32 = +[NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:5];
  v33 = [(UpdatePluginsController *)self result];
  [v33 setData:v32];

  if (v31)
  {
    if (v28) {
      goto LABEL_25;
    }
  }
  else
  {

    if (v28) {
      goto LABEL_25;
    }
  }

LABEL_25:
  if (!v26) {

  }
  if (!pdiMountPath) {
  [(UpdatePluginsController *)self setFinished:1];
  }
}

- (int64_t)_requestUpdateURLAndDigestFromAST2WithError:(id *)a3
{
  v5 = handleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[UpdatePluginsController _requestUpdateURLAndDigestFromAST2WithError:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v56 = 0x3032000000;
  id v57 = sub_100003EF4;
  id v58 = sub_100003F04;
  id v59 = 0;
  uint64_t v45 = 0;
  uint64_t v46 = &v45;
  uint64_t v47 = 0x3032000000;
  uint64_t v48 = sub_100003EF4;
  uint64_t v49 = sub_100003F04;
  id v50 = 0;
  id v6 = (void *)MGCopyAnswer();
  if (!v6)
  {
    uint64_t v21 = createCRError((void *)0xFFFFFFFFFFFFFFD6, @"Failed to get OS version from MG", 0);
    id v9 = 0;
    uint64_t v13 = 0;
    __int16 v14 = 0;
    v18 = 0;
    goto LABEL_9;
  }
  unsigned int v7 = handleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v51 = 138412290;
    uint64_t v52 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Request repair update pdiURL & pdiDigest with OS version: %@", v51, 0xCu);
  }

  int64_t v8 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
  id v9 = +[NSURLSession sessionWithConfiguration:v8 delegate:self delegateQueue:0];

  uint64_t v10 = [(UpdatePluginsController *)self inputs];
  v11 = [v10 ast2RequestURL];
  int v12 = +[NSURL URLWithString:v11];
  uint64_t v13 = +[NSMutableURLRequest requestWithURL:v12];

  [v13 setHTTPMethod:@"POST"];
  [v13 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  __int16 v14 = +[NSMutableDictionary dictionary];
  [v14 setObject:v6 forKey:@"osVersion"];
  id v15 = +[NSJSONSerialization dataWithJSONObject:v14 options:0 error:0];
  [v13 setHTTPBody:v15];

  dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100003F0C;
  v41[3] = &unk_1000082B0;
  uint64_t v43 = &v45;
  p_long long buf = &buf;
  v18 = v16;
  uint64_t v42 = v18;
  id v19 = [v9 dataTaskWithRequest:v13 completionHandler:v41];
  [v19 resume];

  dispatch_time_t v20 = dispatch_time(0, 15000000000);
  if (dispatch_semaphore_wait(v18, v20))
  {
    uint64_t v21 = createCRError((void *)0xFFFFFFFFFFFFFFF3, @"Waiting for pdiURL & pdiDigest from AST2 timeout", 0);
LABEL_9:
    v22 = 0;
    v23 = 0;
LABEL_10:
    v24 = v46[5];
    v46[5] = v21;
    int64_t v25 = 1;
    goto LABEL_11;
  }
  if (v46[5])
  {
    v22 = 0;
    v23 = 0;
    int64_t v25 = 1;
    if (!a3) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  v27 = [*(id *)(*((void *)&buf + 1) + 40) objectForKeyedSubscript:@"plugin"];
  v23 = [v27 objectForKeyedSubscript:@"dmgURL"];

  v28 = [*(id *)(*((void *)&buf + 1) + 40) objectForKeyedSubscript:@"plugin"];
  v22 = [v28 objectForKeyedSubscript:@"dmgDigest"];

  if (v23 && v22)
  {
    v29 = +[NSURL URLWithString:v23];
    [(UpdatePluginsController *)self setPdiURL:v29];

    [(UpdatePluginsController *)self setPdiDigest:v22];
    v30 = [(UpdatePluginsController *)self pdiURL];
    if (v30)
    {
      uint64_t v40 = [(UpdatePluginsController *)self pdiURL];
      uint64_t v39 = [v40 host];
      if (v39)
      {
        uint64_t v38 = [(UpdatePluginsController *)self pdiURL];
        uint64_t v37 = [v38 scheme];
        if ([v37 caseInsensitiveCompare:@"http"])
        {

          goto LABEL_28;
        }
        uint64_t v36 = [(UpdatePluginsController *)self pdiURL];
        v34 = [v36 scheme];
        BOOL v35 = [v34 caseInsensitiveCompare:@"https"] == 0;

        if (!v35)
        {
LABEL_28:
          v24 = handleForCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t v51 = 138412546;
            uint64_t v52 = v23;
            __int16 v53 = 2112;
            v54 = v22;
            v31 = "Request repair udpate pdiURL: %@, pdiDigest: %@";
            v32 = v24;
            uint32_t v33 = 22;
            goto LABEL_30;
          }
          goto LABEL_31;
        }
      }
      else
      {
      }
    }
    uint64_t v21 = createCRError((void *)0xFFFFFFFFFFFFFFE8, @"Invaild PDI URL from AST2", 0);
    goto LABEL_10;
  }
  v24 = handleForCategory();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v51 = 0;
    v31 = "No need to update repair software";
    v32 = v24;
    uint32_t v33 = 2;
LABEL_30:
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, v31, v51, v33);
  }
LABEL_31:
  int64_t v25 = 0;
LABEL_11:

  if (a3) {
LABEL_12:
  }
    *a3 = (id) v46[5];
LABEL_13:

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&buf, 8);

  return v25;
}

- (int64_t)_downloadDiskImageWithError:(id *)a3
{
  v4 = handleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[UpdatePluginsController _downloadDiskImageWithError:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  v41 = +[NSURL fileURLWithPath:@"/private/var/mobile/RepairDiskImage/FactoryDiskImagePersonalized.dmg"];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v64 = 0x3032000000;
  v65 = sub_100003EF4;
  v66 = sub_100003F04;
  id v67 = 0;
  uint64_t v55 = 0;
  uint64_t v56 = &v55;
  uint64_t v57 = 0x3032000000;
  id v58 = sub_100003EF4;
  id v59 = sub_100003F04;
  dispatch_semaphore_t v60 = dispatch_semaphore_create(0);
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x3032000000;
  v53[3] = sub_100003EF4;
  v53[4] = sub_100003F04;
  id v54 = 0;
  uint64_t v49 = 0;
  id v50 = &v49;
  uint64_t v51 = 0x2020000000;
  char v52 = 0;
  uint64_t v43 = 0;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x3032000000;
  uint64_t v46 = sub_100003EF4;
  uint64_t v47 = sub_100003F04;
  id v48 = 0;
  mkdir("/private/var/mobile/RepairDiskImage/", 0x1C0u);
  unsigned int v5 = 0;
  id v6 = 0;
  unsigned int v7 = 0;
  int64_t v40 = -23;
  do
  {
    id v9 = (void *)v44[5];
    v44[5] = 0;

    uint64_t v10 = +[NSFileManager defaultManager];
    unsigned int v11 = [v10 fileExistsAtPath:@"/private/var/mobile/RepairDiskImage/FactoryDiskImagePersonalized.dmg"];

    if (v11)
    {
      int v12 = +[NSFileManager defaultManager];
      [v12 removeItemAtPath:@"/private/var/mobile/RepairDiskImage/FactoryDiskImagePersonalized.dmg" error:0];
    }
    sleep(v5);
    uint64_t v13 = handleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v61 = 67109120;
      unsigned int v62 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Downloading the Disk Image:counter:%d", v61, 8u);
    }

    __int16 v14 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
    id v15 = objc_opt_new();
    dispatch_semaphore_t v16 = +[NSURLSession sessionWithConfiguration:v14 delegate:v15 delegateQueue:0];
    v17 = [(UpdatePluginsController *)self pdiURL];
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_1000047C8;
    v42[3] = &unk_1000082D8;
    v42[4] = &buf;
    v42[5] = &v49;
    v42[6] = v53;
    v42[7] = &v43;
    v42[8] = &v55;
    v18 = [v16 downloadTaskWithURL:v17 completionHandler:v42];
    [v18 resume];

    id v19 = v56[5];
    dispatch_time_t v20 = [(UpdatePluginsController *)self inputs];
    uint64_t v21 = [v20 timeoutPeriod];
    dispatch_time_t v22 = dispatch_time(0, 1000000000 * (int)[v21 intValue]);
    intptr_t v23 = dispatch_semaphore_wait(v19, v22);

    if (v23 || !*(void *)(*((void *)&buf + 1) + 40) || v44[5] || !*((unsigned char *)v50 + 24))
    {
      v24 = [(UpdatePluginsController *)self pdiDigest];
      int64_t v25 = +[NSString stringWithFormat:@"Failed to download Disk Image::location:%@:error:%@", v24, v6];

      uint64_t v26 = createCRError((void *)0xFFFFFFFFFFFFFFE9, v25, 0);
      v27 = (void *)v44[5];
      v44[5] = v26;

      int v28 = 0;
    }
    else
    {
      v31 = handleForCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v61 = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Asset download success", v61, 2u);
      }

      uint64_t v32 = [v41 SHA256DigestString];

      uint32_t v33 = [(UpdatePluginsController *)self pdiDigest];
      BOOL v34 = [v33 caseInsensitiveCompare:v32] == 0;

      if (v34)
      {
        int64_t v25 = handleForCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v61 = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Asset digest match success", v61, 2u);
        }
        int64_t v40 = 0;
        int v28 = 1;
      }
      else
      {
        BOOL v35 = [(UpdatePluginsController *)self pdiDigest];
        int64_t v25 = +[NSString stringWithFormat:@"Digest Mismatched, Download Failure:%@:%@", v35, v32];

        uint64_t v36 = createCRError((void *)0xFFFFFFFFFFFFFFE9, v25, 0);
        uint64_t v37 = (void *)v44[5];
        v44[5] = v36;

        int v28 = 0;
      }
      id v6 = (void *)v32;
    }

    if (v7++ > 1) {
      int v30 = 1;
    }
    else {
      int v30 = v28;
    }
    v5 += 3;
  }
  while (v30 != 1);
  if (a3) {
    *a3 = (id) v44[5];
  }

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(v53, 8);

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&buf, 8);

  return v40;
}

- (int64_t)_performPluginsUpdateWithError:(id *)a3
{
  unsigned int v5 = handleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    v41 = "-[UpdatePluginsController _performPluginsUpdateWithError:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  uint64_t v36 = 0;
  uint64_t v37 = 0;
  int v6 = MGGetBoolAnswer();
  unsigned int v7 = handleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v41) = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, " inDiagnosticsmode:%d", buf, 8u);
  }

  id v8 = +[CRPersonalizationManager getDefaultAMAuthInstallRef];
  id v9 = [(UpdatePluginsController *)self inputs];
  if ([v9 useAppleConnect])
  {
  }
  else
  {
    unsigned __int8 v10 = +[CRPersonalizationManager shouldPersonalizeWithSSOByDefault];

    if ((v10 & 1) == 0) {
      goto LABEL_9;
    }
  }
  if (+[CRPersonalizationManager enableSSO:v8])
  {
    uint32_t v33 = @"Failed to enable single sign on";
LABEL_45:
    int v28 = createCRError((void *)0xFFFFFFFFFFFFFFF1, v33, 0);
    uint64_t v21 = 0;
    goto LABEL_47;
  }
LABEL_9:
  unsigned int v11 = [(UpdatePluginsController *)self inputs];
  int v12 = [v11 tatsuURL];

  if (v12)
  {
    uint64_t v13 = handleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Setting Custom signing URL", buf, 2u);
    }

    __int16 v14 = [(UpdatePluginsController *)self inputs];
    id v15 = [v14 tatsuURL];
    int v16 = AMAuthInstallSetSigningServerURL();

    if (v16)
    {
      uint32_t v33 = @"Failed to set tatsu URL";
      goto LABEL_45;
    }
  }
  v17 = +[CRPersonalizationManager initWithAuthInstallObj:v8];
  id v35 = 0;
  unsigned int v18 = [v17 getPDIAPTicketUsingCache:0 apTicketData:&v37 error:&v35];
  id v19 = v35;

  dispatch_time_t v20 = handleForCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    v41 = v37;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Ticket:%@", buf, 0xCu);
  }

  if (!v18 || !v37 || v19)
  {
    if (+[CRPersonalizationManager IsTatsuErrorNetworkingRelated:](CRPersonalizationManager, "IsTatsuErrorNetworkingRelated:", [v19 code]))int64_t v29 = -13; {
    else
    }
      int64_t v29 = -15;
    int v30 = +[NSString stringWithFormat:@"Asset Personalization failed:%d:%@", v18, v19];
    int v28 = createCRError((void *)v29, v30, 0);

    uint64_t v21 = 0;
    if (!v8) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  v38[0] = kMobileStorageDeviceTypeKey;
  v38[1] = kMSMDiskImageTypeKey;
  v39[0] = kMobileStorageDeviceTypeDiskImage;
  v39[1] = kMSMDiskImageTypePersonalized;
  v38[2] = kMSMSignatureKey;
  v39[2] = v37;
  uint64_t v21 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:3];
  dispatch_time_t v22 = (NSString *)MobileStorageMountWithError();
  pdiMountPath = self->pdiMountPath;
  self->pdiMountPath = v22;

  if (self->pdiMountPath)
  {
    v24 = handleForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v25 = self->pdiMountPath;
      *(_DWORD *)long long buf = 138412290;
      v41 = (const char *)v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Successfully mounted the disk image at: %@", buf, 0xCu);
    }

    if ([(CRPluginsController *)self->pluginsHandle isApplicationInstalledWithMaxRetries:5 bundleName:@"com.apple.corerepair.PluginsUpdaterApp"])
    {
      uint64_t v26 = handleForCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Application found", buf, 2u);
      }

      if ((v6 & 1) == 0)
      {
LABEL_29:
        int v28 = 0;
        int64_t v29 = 0;
        if (!v8) {
          goto LABEL_39;
        }
LABEL_38:
        CFRelease(v8);
        goto LABEL_39;
      }
      if ([(CRPluginsController *)self->pluginsHandle rebuildApplicationDataBase])
      {
        v27 = handleForCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "re building DB successsful", buf, 2u);
        }

        goto LABEL_29;
      }
      v31 = @"Failed to rebuild DB";
    }
    else
    {
      v31 = @"Unable to find Application after 5 retries";
    }
    int64_t v29 = -20;
    int v28 = createCRError((void *)0xFFFFFFFFFFFFFFECLL, v31, 0);
    if (!v8) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  BOOL v34 = v36;
  int v28 = createCRError((void *)0xFFFFFFFFFFFFFFF1, @"Failed to mount disk image", v36);

LABEL_47:
  int64_t v29 = -20;
  if (v8) {
    goto LABEL_38;
  }
LABEL_39:
  if (a3) {
    *a3 = v28;
  }

  return v29;
}

- (id)diskPluginsMap
{
  v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v39 = "-[UpdatePluginsController diskPluginsMap]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v4 = objc_opt_new();
  unsigned int v5 = objc_opt_new();
  [v4 appendString:self->pdiMountPath];
  [v4 appendString:@"/Applications/PluginsUpdaterApp.app/PlugIns/"];
  int v6 = handleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v39 = (const char *)v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "plugins Path is:%@", buf, 0xCu);
  }

  id v7 = objc_alloc_init((Class)NSFileManager);
  id v8 = [v7 enumeratorAtPath:v4];

  uint64_t v9 = [v8 nextObject];
  if (v9)
  {
    unsigned __int8 v10 = (char *)v9;
    unsigned int v11 = 0;
    id v35 = v8;
    uint64_t v36 = v4;
    BOOL v34 = v5;
    while (1)
    {
      int v12 = handleForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v39 = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "fileName:%@", buf, 0xCu);
      }

      if ([v10 hasSuffix:@"Info.plist"]) {
        break;
      }
      id v17 = v11;
LABEL_26:
      uint64_t v31 = [v8 nextObject];

      unsigned __int8 v10 = (char *)v31;
      if (!v31) {
        goto LABEL_30;
      }
    }
    uint64_t v13 = objc_opt_new();
    [v13 appendString:v4];
    [v13 appendString:v10];
    __int16 v14 = handleForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v39 = (const char *)v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "FullPath:%@", buf, 0xCu);
    }

    id v15 = +[NSURL fileURLWithPath:v13];
    id v37 = v11;
    int v16 = +[NSDictionary dictionaryWithContentsOfURL:v15 error:&v37];
    id v17 = v37;

    if (!v17 && v16 && [v16 count])
    {
      unsigned int v18 = handleForCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v39 = v16;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Plist:%@", buf, 0xCu);
      }

      uint64_t v19 = [v16 objectForKeyedSubscript:@"NSExtension"];
      if (!v19) {
        goto LABEL_25;
      }
      dispatch_time_t v20 = v19;
      uint64_t v21 = [v16 objectForKeyedSubscript:@"NSExtension"];
      uint64_t v22 = [v21 objectForKeyedSubscript:@"NSExtensionAttributes"];
      if (v22)
      {
        intptr_t v23 = (void *)v22;
        v24 = [v16 objectForKeyedSubscript:@"NSExtension"];
        int64_t v25 = [v24 objectForKeyedSubscript:@"NSExtensionAttributes"];
        uint64_t v26 = [v25 objectForKeyedSubscript:@"DKDiagnosticIdentifier"];

        unsigned int v5 = v34;
        if (!v26)
        {
LABEL_25:

          unsigned int v11 = v17;
          id v8 = v35;
          v4 = v36;
          goto LABEL_26;
        }
        v27 = [v16 objectForKeyedSubscript:@"NSExtension"];
        int v28 = [v27 objectForKeyedSubscript:@"NSExtensionAttributes"];
        dispatch_time_t v20 = [v28 objectForKeyedSubscript:@"DKDiagnosticIdentifier"];

        int64_t v29 = [v16 objectForKeyedSubscript:@"CFBundleShortVersionString"];
        int v30 = [v20 stringValue];
        [v34 setObject:v29 forKeyedSubscript:v30];
      }
      else
      {
      }
    }
    else
    {
      dispatch_time_t v20 = handleForCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v39 = (const char *)v17;
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to read:%@", buf, 0xCu);
      }
    }

    goto LABEL_25;
  }
  id v17 = 0;
LABEL_30:
  uint64_t v32 = handleForCategory();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v39 = (const char *)v5;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Map is:%@", buf, 0xCu);
  }

  return v5;
}

- (UpdatePluginsInputs)inputs
{
  return self->inputs;
}

- (void)setInputs:(id)a3
{
}

- (NSURL)pdiURL
{
  return self->_pdiURL;
}

- (void)setPdiURL:(id)a3
{
}

- (NSString)pdiDigest
{
  return self->_pdiDigest;
}

- (void)setPdiDigest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pdiDigest, 0);
  objc_storeStrong((id *)&self->_pdiURL, 0);
  objc_storeStrong((id *)&self->inputs, 0);
  objc_storeStrong((id *)&self->diagsReponder, 0);
  objc_storeStrong((id *)&self->pluginsHandle, 0);

  objc_storeStrong((id *)&self->pdiMountPath, 0);
}

@end