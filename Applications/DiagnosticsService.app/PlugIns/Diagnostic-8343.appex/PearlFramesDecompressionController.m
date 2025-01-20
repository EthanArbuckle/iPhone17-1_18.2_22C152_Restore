@interface PearlFramesDecompressionController
- (BOOL)preCheck;
- (id)decompressPearlFrames;
- (id)updateBrunorDATFirmware;
- (id)updateSavageDATFirmware;
- (id)verifyPSD3;
- (void)cancel;
- (void)start;
- (void)teardown;
@end

@implementation PearlFramesDecompressionController

- (BOOL)preCheck
{
  v2 = handleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    v10 = "-[PearlFramesDecompressionController preCheck]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  v3 = +[NSFileManager defaultManager];
  unsigned __int8 v4 = [v3 fileExistsAtPath:@"/private/var/hardware/FactoryData"];

  if ((v4 & 1) == 0)
  {
    v7 = handleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100002A24(v7);
    }
    goto LABEL_9;
  }
  v5 = +[NSFileManager defaultManager];
  unsigned int v6 = [v5 fileExistsAtPath:@"/private/var/hardware/Pearl"];

  if (v6)
  {
    v7 = handleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      v10 = @"/private/var/hardware/Pearl";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ is existed before decompression", (uint8_t *)&v9, 0xCu);
    }
LABEL_9:
  }
  return v4;
}

- (id)decompressPearlFrames
{
  v2 = handleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[PearlFramesDecompressionController decompressPearlFrames]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v19 = 0x3032000000;
  v20 = sub_100001474;
  v21 = sub_100001484;
  id v22 = 0;
  id v3 = [objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.corerepair" options:0];
  unsigned __int8 v4 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CoreRepairHelperProtocol];
  [v3 setRemoteObjectInterface:v4];

  [v3 resume];
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  unsigned int v6 = [v3 remoteObjectProxy];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000148C;
  v14[3] = &unk_1000041B8;
  p_long long buf = &buf;
  id v7 = v3;
  id v15 = v7;
  v8 = v5;
  v16 = v8;
  [v6 decompressPearlFramesWithReply:v14];

  dispatch_time_t v9 = dispatch_time(0, 120000000000);
  if (dispatch_semaphore_wait(v8, v9))
  {
    uint64_t v10 = createCRError((void *)0xFFFFFFFFFFFFFFF6, @"Get response timeout from corerepaird for Pearl frames decompression", 0);
    v11 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v10;
  }
  id v12 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);

  return v12;
}

- (id)updateSavageDATFirmware
{
  v2 = handleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[PearlFramesDecompressionController updateSavageDATFirmware]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v19 = 0x3032000000;
  v20 = sub_100001474;
  v21 = sub_100001484;
  id v22 = 0;
  id v3 = [objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.corerepair" options:0];
  unsigned __int8 v4 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CoreRepairHelperProtocol];
  [v3 setRemoteObjectInterface:v4];

  [v3 resume];
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  unsigned int v6 = [v3 remoteObjectProxy];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100001810;
  v14[3] = &unk_1000041B8;
  p_long long buf = &buf;
  id v7 = v3;
  id v15 = v7;
  v8 = v5;
  v16 = v8;
  [v6 updateSavageDATFirmwareWithReply:v14];

  dispatch_time_t v9 = dispatch_time(0, 120000000000);
  if (dispatch_semaphore_wait(v8, v9))
  {
    uint64_t v10 = createCRError((void *)0xFFFFFFFFFFFFFFF6, @"Get response timeout from corerepaird for Savage update", 0);
    v11 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v10;
  }
  id v12 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);

  return v12;
}

- (id)updateBrunorDATFirmware
{
  v2 = handleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[PearlFramesDecompressionController updateBrunorDATFirmware]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v19 = 0x3032000000;
  v20 = sub_100001474;
  v21 = sub_100001484;
  id v22 = 0;
  id v3 = [objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.corerepair" options:0];
  unsigned __int8 v4 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CoreRepairHelperProtocol];
  [v3 setRemoteObjectInterface:v4];

  [v3 resume];
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  unsigned int v6 = [v3 remoteObjectProxy];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100001B94;
  v14[3] = &unk_1000041B8;
  p_long long buf = &buf;
  id v7 = v3;
  id v15 = v7;
  v8 = v5;
  v16 = v8;
  [v6 updateBrunorDATFirmwareWithReply:v14];

  dispatch_time_t v9 = dispatch_time(0, 120000000000);
  if (dispatch_semaphore_wait(v8, v9))
  {
    uint64_t v10 = createCRError((void *)0xFFFFFFFFFFFFFFF6, @"Get response timeout from corerepaird for Brunor update", 0);
    v11 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v10;
  }
  id v12 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);

  return v12;
}

- (id)verifyPSD3
{
  v2 = handleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[PearlFramesDecompressionController verifyPSD3]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v19 = 0x3032000000;
  v20 = sub_100001474;
  v21 = sub_100001484;
  id v22 = 0;
  id v3 = [objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.corerepair" options:0];
  unsigned __int8 v4 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CoreRepairHelperProtocol];
  [v3 setRemoteObjectInterface:v4];

  [v3 resume];
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  unsigned int v6 = [v3 remoteObjectProxy];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100001F18;
  v14[3] = &unk_1000041B8;
  p_long long buf = &buf;
  id v7 = v3;
  id v15 = v7;
  v8 = v5;
  v16 = v8;
  [v6 verifyPSD3WithReply:v14];

  dispatch_time_t v9 = dispatch_time(0, 120000000000);
  if (dispatch_semaphore_wait(v8, v9))
  {
    uint64_t v10 = createCRError((void *)0xFFFFFFFFFFFFFFF6, @"Get response timeout from corerepaird for verify PSD3", 0);
    v11 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v10;
  }
  id v12 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);

  return v12;
}

- (void)start
{
  id v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    v47 = "-[PearlFramesDecompressionController start]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v43 = 0;
  AMSupportLogSetHandler();
  unsigned __int8 v4 = (char *)AMFDRSealingMapCopyInstanceForClass();
  dispatch_semaphore_t v5 = handleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    v47 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Savage SN from sealing map: %@", buf, 0xCu);
  }

  uint64_t v6 = AMFDRSealingManifestCopyInstanceForClass();
  id v7 = handleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    v47 = (const char *)v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Savage SN from sealing manifest: %@", buf, 0xCu);
  }

  v40 = (void *)v6;
  v41 = self;
  if (v6)
  {
    if (v4 && ([v4 isEqualToString:v6] & 1) != 0)
    {
      if ([(PearlFramesDecompressionController *)self preCheck])
      {
        v8 = handleForCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Start to decompress Pearl frames ...", buf, 2u);
        }

        uint64_t v9 = [(PearlFramesDecompressionController *)self decompressPearlFrames];
        if (!v9)
        {
          if (+[CRFDRUtils isDataClassSupported:@"psd3"])
          {
            id v10 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.Diagnostic-8343"];
            unsigned __int8 v11 = [v10 BOOLForKey:@"finalPersonalizationDone"];
            id v12 = handleForCategory();
            BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
            if (v11)
            {
              if (v13)
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Firmware has already been updated once", buf, 2u);
              }
            }
            else
            {
              if (v13)
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Start to update Brunor/Yonkers firmware ...", buf, 2u);
              }

              uint64_t v16 = [(PearlFramesDecompressionController *)self updateBrunorDATFirmware];
              if (v16) {
                goto LABEL_63;
              }
              v17 = handleForCategory();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Update Brunor/Yonkers firmware successfully", buf, 2u);
              }

              if (v10) {
                [v10 setBool:1 forKey:@"finalPersonalizationDone"];
              }
            }
            uint64_t v16 = [(PearlFramesDecompressionController *)self verifyPSD3];
            if (!v16)
            {
              id v15 = handleForCategory();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Verify PSD3 successfully", buf, 2u);
              }
LABEL_35:

              char v42 = 0;
              v18 = +[NSFileManager defaultManager];
              unsigned int v19 = [v18 fileExistsAtPath:@"/private/var/hardware/Pearl" isDirectory:&v42];

              if (v19 && v42)
              {
                v39 = v10;
LABEL_38:
                v20 = [(PearlFramesDecompressionController *)self result];
                [v20 setStatusCode:&off_100004438];

                v21 = 0;
                id v22 = 0;
LABEL_39:
                v44[0] = @"PearlFramesDecompressionErrorCode";
LABEL_40:
                v23 = +[NSNull null];
                v24 = 0;
                int v25 = 1;
                goto LABEL_41;
              }
              v21 = createCRError((void *)0xFFFFFFFFFFFFFFFFLL, @"Pearl frames have been decompressed, but the folder is not found", 0);
              goto LABEL_58;
            }
LABEL_63:
            v21 = (void *)v16;
            v39 = v10;
            goto LABEL_59;
          }
          v14 = handleForCategory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Start to update Savage/Yonkers firmware ...", buf, 2u);
          }

          uint64_t v9 = [(PearlFramesDecompressionController *)self updateSavageDATFirmware];
          if (!v9)
          {
            id v15 = handleForCategory();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Update Savage/Yonkers firmware successfully", buf, 2u);
            }
            id v10 = 0;
            goto LABEL_35;
          }
        }
        v21 = (void *)v9;
        v39 = 0;
        goto LABEL_59;
      }
      v30 = @"Failed to mount hardware partition";
      uint64_t v31 = -2;
    }
    else
    {
      v30 = @"Sealing map and sealing manifest Savage SN mismatch";
      uint64_t v31 = -8;
    }
    v21 = createCRError((void *)v31, v30, 0);
  }
  else
  {
    v21 = createCRError((void *)0xFFFFFFFFFFFFFFD6, @"Failed to get Savage SN from sealing manifest", v43);
  }
  id v10 = 0;
LABEL_58:
  v39 = v10;
  if (!v21) {
    goto LABEL_38;
  }
LABEL_59:
  v32 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v21 code]);
  v33 = [(PearlFramesDecompressionController *)self result];
  [v33 setStatusCode:v32];

  v34 = [v21 userInfo];
  id v22 = [v34 description];

  v35 = [v21 userInfo];
  v36 = [v35 objectForKeyedSubscript:NSUnderlyingErrorKey];

  if (!v36) {
    goto LABEL_39;
  }
  v37 = [v21 userInfo];
  v38 = [v37 objectForKeyedSubscript:NSUnderlyingErrorKey];

  v24 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v38 code]);

  v44[0] = @"PearlFramesDecompressionErrorCode";
  if (!v24) {
    goto LABEL_40;
  }
  int v25 = 0;
  v23 = v24;
LABEL_41:
  v45[0] = v23;
  v44[1] = @"PearlFramesDecompressionErrorDescription";
  v26 = v22;
  if (!v22)
  {
    v26 = +[NSNull null];
  }
  v45[1] = v26;
  v44[2] = @"PearlFramesDecompressionSensorSerialNumber";
  v27 = v4;
  if (!v4)
  {
    v27 = +[NSNull null];
  }
  v45[2] = v27;
  v28 = +[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:3];
  v29 = [(PearlFramesDecompressionController *)v41 result];
  [v29 setData:v28];

  if (v4)
  {
    if (v22) {
      goto LABEL_47;
    }
  }
  else
  {

    if (v22) {
      goto LABEL_47;
    }
  }

LABEL_47:
  if (v25) {

  }
  [(PearlFramesDecompressionController *)v41 setFinished:1];
}

- (void)cancel
{
  v2 = handleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    unsigned __int8 v4 = "-[PearlFramesDecompressionController cancel]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v3, 0xCu);
  }
}

- (void)teardown
{
  v2 = handleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    unsigned __int8 v4 = "-[PearlFramesDecompressionController teardown]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v3, 0xCu);
  }
}

- (void).cxx_destruct
{
}

@end