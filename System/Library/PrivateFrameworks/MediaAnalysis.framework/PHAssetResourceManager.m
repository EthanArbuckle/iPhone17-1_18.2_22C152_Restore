@interface PHAssetResourceManager
+ (id)vcp_fileCacheDirectoryPath;
+ (int)vcp_requestFileURLForAssetResource:(id)a3 taskID:(unint64_t)a4 completionHandler:(id)a5;
+ (int)vcp_requestInMemoryDownload:(id)a3 taskID:(unint64_t)a4 data:(id *)a5 cancel:(id)a6;
+ (void)vcp_createFileCacheDirectoryIfNeeded;
+ (void)vcp_flushFileCache;
+ (void)vcp_flushResourceURL:(id)a3;
+ (void)vcp_reportDownloadBytes:(unint64_t)a3 taskID:(unint64_t)a4;
@end

@implementation PHAssetResourceManager

+ (id)vcp_fileCacheDirectoryPath
{
  v2 = NSTemporaryDirectory();
  v3 = [v2 stringByAppendingPathComponent:@"com.apple.mediaanalysis"];

  return v3;
}

+ (void)vcp_createFileCacheDirectoryIfNeeded
{
  v2 = +[PHAssetResourceManager vcp_fileCacheDirectoryPath];
  char v24 = 0;
  v3 = +[NSFileManager defaultManager];
  unsigned int v4 = [v3 fileExistsAtPath:v2 isDirectory:&v24];

  if (v4) {
    BOOL v5 = v24 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (v4)
    {
      v6 = +[NSFileManager defaultManager];
      id v23 = 0;
      unsigned __int8 v7 = [v6 removeItemAtPath:v2 error:&v23];
      id v8 = v23;

      if ((v7 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
      {
        v9 = VCPLogInstance();
        os_log_type_t v10 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v9, v10))
        {
          v11 = [v8 description];
          *(_DWORD *)buf = 138412290;
          v26 = v11;
          _os_log_impl((void *)&_mh_execute_header, v9, v10, "[Resource] Failed to remove file obstructing resource file cache directory (%@)", buf, 0xCu);
        }
      }
    }
    else
    {
      id v8 = 0;
    }
    v15 = +[NSFileManager defaultManager];
    id v22 = v8;
    unsigned __int8 v16 = [v15 createDirectoryAtPath:v2 withIntermediateDirectories:1 attributes:0 error:&v22];
    v13 = v22;

    int v17 = MediaAnalysisLogLevel();
    if (v16)
    {
      if (v17 >= 6)
      {
        v18 = VCPLogInstance();
        os_log_type_t v19 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v18, v19))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, v19, "[Resource] Created resource file cache directory", buf, 2u);
        }
LABEL_23:
      }
    }
    else if (v17 >= 3)
    {
      v18 = VCPLogInstance();
      os_log_type_t v20 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v18, v20))
      {
        v21 = [v13 description];
        *(_DWORD *)buf = 138412290;
        v26 = v21;
        _os_log_impl((void *)&_mh_execute_header, v18, v20, "[Resource] Failed to create resource file cache directory (%@)", buf, 0xCu);
      }
      goto LABEL_23;
    }
LABEL_24:

    goto LABEL_25;
  }
  int v12 = MediaAnalysisLogLevel();
  if (v12 >= 7)
  {
    v13 = VCPLogInstance();
    os_log_type_t v14 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v13, v14))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "[Resource] Resource file cache directory exists", buf, 2u);
    }
    goto LABEL_24;
  }
LABEL_25:
}

+ (int)vcp_requestFileURLForAssetResource:(id)a3 taskID:(unint64_t)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_msgSend((id)objc_opt_class(), "vcp_createFileCacheDirectoryIfNeeded");
  v9 = objc_msgSend(v7, "vcp_uniformTypeIdentifier");
  v30 = [v9 preferredFilenameExtension];

  os_log_type_t v10 = [v7 assetLocalIdentifier];
  v11 = +[PHObject uuidFromLocalIdentifier:v10];
  int v12 = +[NSNumber numberWithUnsignedInteger:a4];
  v13 = [v12 stringValue];
  os_log_type_t v14 = [v11 stringByAppendingPathExtension:v13];
  v15 = [v14 stringByAppendingPathExtension:v30];

  unsigned __int8 v16 = objc_msgSend((id)objc_opt_class(), "vcp_fileCacheDirectoryPath");
  int v17 = [v16 stringByAppendingPathComponent:v15];

  v18 = +[NSURL fileURLWithPath:v17];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10001A6C4;
  v37[3] = &unk_10021A038;
  id v19 = v7;
  id v38 = v19;
  id v20 = v18;
  id v39 = v20;
  v21 = objc_retainBlock(v37);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10001A90C;
  v33[3] = &unk_10021A060;
  id v22 = v19;
  id v35 = v20;
  id v36 = v8;
  id v34 = v22;
  id v23 = v20;
  id v24 = v8;
  v25 = objc_retainBlock(v33);
  id v26 = objc_alloc_init((Class)PHAssetResourceRequestOptions);
  [v26 setNetworkAccessAllowed:1];
  [v26 setDownloadPriority:0];
  [v26 setDownloadIntent:6];
  [v26 setPruneAfterAvailableOnLowDisk:1];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10001AA28;
  v31[3] = &unk_1002196F0;
  id v32 = v22;
  id v27 = v22;
  [v26 setProgressHandler:v31];
  v28 = +[PHAssetResourceManager defaultManager];
  LODWORD(v22) = [v28 requestFileURLForAssetResource:v27 options:v26 urlReceivedHandler:v21 completionHandler:v25];

  return (int)v22;
}

+ (void)vcp_flushResourceURL:(id)a3
{
  id v3 = a3;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    unsigned int v4 = VCPLogInstance();
    os_log_type_t v5 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v4, v5))
    {
      v6 = [v3 path];
      *(_DWORD *)buf = 138412290;
      unsigned __int8 v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "[Resource] Flushing cached resource: %@", buf, 0xCu);
    }
  }
  id v7 = +[NSFileManager defaultManager];
  id v14 = 0;
  unsigned __int8 v8 = [v7 removeItemAtURL:v3 error:&v14];
  id v9 = v14;

  if ((v8 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
  {
    os_log_type_t v10 = VCPLogInstance();
    os_log_type_t v11 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v10, v11))
    {
      int v12 = [v3 path];
      v13 = [v9 description];
      *(_DWORD *)buf = 138412546;
      unsigned __int8 v16 = v12;
      __int16 v17 = 2112;
      v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "[Resource] Failed to delete %@ (%@)", buf, 0x16u);
    }
  }
}

+ (void)vcp_flushFileCache
{
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v3, v4))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "[Resource] Flushing file cache", buf, 2u);
    }
  }
  os_log_type_t v5 = +[NSFileManager defaultManager];
  v6 = objc_msgSend((id)objc_opt_class(), "vcp_fileCacheDirectoryPath");
  id v7 = [v5 enumeratorAtPath:v6];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v14 = objc_msgSend((id)objc_opt_class(), "vcp_fileCacheDirectoryPath", (void)v17);
        v15 = [v14 stringByAppendingPathComponent:v13];

        unsigned __int8 v16 = +[NSURL fileURLWithPath:v15];
        objc_msgSend(a1, "vcp_flushResourceURL:", v16);
      }
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v10);
  }
}

+ (void)vcp_reportDownloadBytes:(unint64_t)a3 taskID:(unint64_t)a4
{
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v6 = VCPLogInstance();
    os_log_type_t v7 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = VCPAnalyticsEventDasDutyCycleTaskKey;
      id v9 = VCPTaskIDDescription(a4);
      qos_class_t v10 = qos_class_self();
      uint64_t v11 = VCPMAQoSDescription(v10);
      *(_DWORD *)buf = 138413058;
      uint64_t v23 = v8;
      __int16 v24 = 2112;
      v25 = v9;
      __int16 v26 = 2112;
      id v27 = v11;
      __int16 v28 = 2048;
      unint64_t v29 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "[DAS QoS] %@: %@ (%@) download %lu bytes", buf, 0x2Au);
    }
  }
  int v12 = +[VCPMADCoreAnalyticsManager sharedManager];
  uint64_t v13 = VCPAnalyticsEventDasDutyCycleTaskKey;
  uint64_t v19 = VCPAnalyticsFieldKeyTaskName;
  id v14 = VCPTaskIDDescription(a4);
  uint64_t v20 = VCPAnalyticsFieldKeyQoS;
  qos_class_t v15 = qos_class_self();
  unsigned __int8 v16 = VCPMAQoSDescription(v15);
  long long v17 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3, v19, v20, VCPAnalyticsFieldKeyDownloadAssetCount, VCPAnalyticsFieldKeyDownloadBytes, v14, v16, &off_10022F3D0);
  v21[3] = v17;
  long long v18 = +[NSDictionary dictionaryWithObjects:v21 forKeys:&v19 count:4];
  [v12 sendEvent:v13 withAnalytics:v18];
}

+ (int)vcp_requestInMemoryDownload:(id)a3 taskID:(unint64_t)a4 data:(id *)a5 cancel:(id)a6
{
  id v10 = a3;
  uint64_t v11 = (unsigned int (**)(void))a6;
  id obj = a1;
  objc_sync_enter(obj);
  int v12 = [v10 assetLocalIdentifier];
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    uint64_t v13 = VCPLogInstance();
    os_log_type_t v14 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v13, v14))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "[%@] Attempt to download resource: %@", buf, 0x16u);
    }
  }
  id v15 = objc_alloc_init((Class)PHAssetResourceRequestOptions);
  [v15 setNetworkAccessAllowed:1];
  [v15 setDownloadIsTransient:1];
  v48 = v15;
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_100135E50;
  v58[3] = &unk_1002196F0;
  id v16 = v12;
  id v59 = v16;
  v46 = objc_retainBlock(v58);
  [v15 setProgressHandler:v46];
  id v17 = objc_alloc_init((Class)NSMutableData);
  dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  int v65 = 0;
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_100135F30;
  v51[3] = &unk_10021E588;
  id v44 = v16;
  id v52 = v44;
  v55 = buf;
  id v56 = obj;
  id v19 = v17;
  id v53 = v19;
  unint64_t v57 = a4;
  uint64_t v20 = v18;
  v54 = v20;
  v45 = objc_retainBlock(v51);
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_1001360E4;
  v49[3] = &unk_10021E5B0;
  id v21 = v19;
  id v50 = v21;
  id v22 = objc_retainBlock(v49);
  uint64_t v23 = +[PHAssetResourceManager defaultManager];
  unsigned int v24 = [v23 requestDataForAssetResource:v10 options:v48 dataReceivedHandler:v22 completionHandler:v45];

  if (!v24)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v33 = VCPLogInstance();
      os_log_type_t v34 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v33, v34))
      {
        *(_WORD *)v60 = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, v34, "Failed to issue resource request", v60, 2u);
      }
    }
LABEL_34:
    int v32 = -23802;
    goto LABEL_35;
  }
  unsigned int v43 = v24;
  v25 = a5;
  __int16 v26 = v21;
  if (v11)
  {
    unint64_t v27 = -100000000;
    while (1)
    {
      dispatch_time_t v28 = dispatch_time(0, 100000000);
      if (!dispatch_semaphore_wait(v20, v28)) {
        goto LABEL_26;
      }
      v27 += 100000000;
      if (v27 >= 0xDF2517701)
      {
        uint64_t v36 = v43;
        id v21 = v26;
        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          id v39 = VCPLogInstance();
          os_log_type_t v40 = VCPLogToOSLogType[4];
          if (os_log_type_enabled(v39, v40))
          {
            *(_DWORD *)v60 = 138412546;
            id v61 = v44;
            __int16 v62 = 1024;
            unsigned int v63 = v43;
            _os_log_impl((void *)&_mh_execute_header, v39, v40, "[%@] Download resource timed-out (ID:%d)", v60, 0x12u);
          }
        }
        goto LABEL_33;
      }
      if (v11[2](v11))
      {
        id v21 = v26;
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          unint64_t v29 = VCPLogInstance();
          os_log_type_t v30 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v29, v30))
          {
            *(_DWORD *)v60 = 138412546;
            id v61 = v44;
            __int16 v62 = 1024;
            unsigned int v63 = v43;
            _os_log_impl((void *)&_mh_execute_header, v29, v30, "[%@] Cancelling download (ID:%d)", v60, 0x12u);
          }
        }
        v31 = +[PHAssetResourceManager defaultManager];
        [v31 cancelDataRequest:v43];

        dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
        int v32 = -128;
        goto LABEL_35;
      }
    }
  }
  dispatch_time_t v35 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v20, v35))
  {
    uint64_t v36 = v43;
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v37 = VCPLogInstance();
      os_log_type_t v38 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v37, v38))
      {
        *(_DWORD *)v60 = 138412546;
        id v61 = v44;
        __int16 v62 = 1024;
        unsigned int v63 = v43;
        _os_log_impl((void *)&_mh_execute_header, v37, v38, "[%@] Download resource timed-out (ID:%d)", v60, 0x12u);
      }
    }
LABEL_33:
    v41 = +[PHAssetResourceManager defaultManager];
    [v41 cancelDataRequest:v36];

    dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
    goto LABEL_34;
  }
LABEL_26:
  id v21 = v26;
  if (v25) {
    id *v25 = v26;
  }
  int v32 = *(_DWORD *)(*(void *)&buf[8] + 24);
LABEL_35:

  _Block_object_dispose(buf, 8);
  objc_sync_exit(obj);

  return v32;
}

@end