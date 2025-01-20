@interface PHAssetResourceManager(MediaAnalysis)
+ (uint64_t)vcp_inMemoryDownload:()MediaAnalysis withTaskID:toData:cancel:;
+ (uint64_t)vcp_requestFileURLForAssetResource:()MediaAnalysis withTaskID:timeoutHandler:urlHandler:andCompletionHandler:;
+ (uint64_t)vcp_requestFileURLForAssetResource:()MediaAnalysis withTaskID:toResourceURL:cancel:;
+ (void)vcp_reportDownload:()MediaAnalysis withTaskID:;
@end

@implementation PHAssetResourceManager(MediaAnalysis)

+ (void)vcp_reportDownload:()MediaAnalysis withTaskID:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = VCPTaskIDDescription(a4);
      qos_class_t v8 = qos_class_self();
      v9 = VCPMAQoSDescription(v8);
      *(_DWORD *)buf = 138413058;
      v19 = @"com.apple.mediaanalysisd.das.dutycycle.task";
      __int16 v20 = 2112;
      v21 = v7;
      __int16 v22 = 2112;
      v23 = v9;
      __int16 v24 = 2048;
      uint64_t v25 = a3;
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_DEBUG, "[DAS QoS] %@: %@ (%@) download %lu bytes", buf, 0x2Au);
    }
  }
  v10 = +[VCPMADCoreAnalyticsManager sharedManager];
  v11 = VCPTaskIDDescription(a4);
  qos_class_t v12 = qos_class_self();
  v13 = VCPMAQoSDescription(v12);
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a3, @"taskName", @"QoS", @"DownloadAssetCount", @"DownloadBytes", v11, v13, &unk_1F15EDCF8);
  v17[3] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:4];
  [v10 sendEvent:@"com.apple.mediaanalysisd.das.dutycycle.task" withAnalytics:v15];
}

+ (uint64_t)vcp_inMemoryDownload:()MediaAnalysis withTaskID:toData:cancel:
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v10 = a6;
  id v11 = a1;
  objc_sync_enter(v11);
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    qos_class_t v12 = VCPLogInstance();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v47 = v9;
      _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_DEBUG, "Attempt to download resource: %@", buf, 0xCu);
    }
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F38F90]);
  [v13 setNetworkAccessAllowed:1];
  [v13 setDownloadIsTransient:1];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__PHAssetResourceManager_MediaAnalysis__vcp_inMemoryDownload_withTaskID_toData_cancel___block_invoke;
  aBlock[3] = &unk_1E629CD80;
  id v14 = v9;
  id v45 = v14;
  v36 = _Block_copy(aBlock);
  [v13 setProgressHandler:v36];
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __87__PHAssetResourceManager_MediaAnalysis__vcp_inMemoryDownload_withTaskID_toData_cancel___block_invoke_196;
  v39[3] = &unk_1E629CDA8;
  id v42 = v11;
  id v17 = v15;
  id v40 = v17;
  uint64_t v43 = a4;
  v18 = v16;
  v41 = v18;
  v34 = _Block_copy(v39);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __87__PHAssetResourceManager_MediaAnalysis__vcp_inMemoryDownload_withTaskID_toData_cancel___block_invoke_198;
  v37[3] = &unk_1E629CDD0;
  id v19 = v17;
  id v38 = v19;
  v35 = _Block_copy(v37);
  __int16 v20 = [MEMORY[0x1E4F38F80] defaultManager];
  uint64_t v21 = [v20 requestDataForAssetResource:v14 options:v13 dataReceivedHandler:v35 completionHandler:v34];

  if (v21)
  {
    if (v10)
    {
      unint64_t v22 = -100000000;
      while (1)
      {
        dispatch_time_t v23 = dispatch_time(0, 100000000);
        if (!dispatch_semaphore_wait(v18, v23)) {
          goto LABEL_27;
        }
        v22 += 100000000;
        if (v22 >= 0xDF2517701)
        {
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            v30 = VCPLogInstance();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(v47) = v21;
              _os_log_impl(&dword_1BBEDA000, v30, OS_LOG_TYPE_DEFAULT, "Download resource timed-out (ID:%d)", buf, 8u);
            }
          }
          goto LABEL_33;
        }
        if (v10[2](v10))
        {
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            __int16 v24 = VCPLogInstance();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(v47) = v21;
              _os_log_impl(&dword_1BBEDA000, v24, OS_LOG_TYPE_INFO, "Cancelling download (ID:%d)", buf, 8u);
            }
          }
          uint64_t v25 = [MEMORY[0x1E4F38F80] defaultManager];
          [v25 cancelDataRequest:v21];

          dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
          uint64_t v26 = 4294967168;
          goto LABEL_34;
        }
      }
    }
    dispatch_time_t v28 = dispatch_time(0, 60000000000);
    if (!dispatch_semaphore_wait(v18, v28))
    {
LABEL_27:
      uint64_t v26 = 0;
      if (a5) {
        *a5 = v19;
      }
      goto LABEL_34;
    }
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v29 = VCPLogInstance();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v47) = v21;
        _os_log_impl(&dword_1BBEDA000, v29, OS_LOG_TYPE_DEFAULT, "Download resource timed-out (ID:%d)", buf, 8u);
      }
    }
LABEL_33:
    v31 = [MEMORY[0x1E4F38F80] defaultManager];
    [v31 cancelDataRequest:v21];

    dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v26 = 4294966371;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v27 = VCPLogInstance();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_ERROR, "Failed to issue resource request", buf, 2u);
      }
    }
    uint64_t v26 = 4294967278;
  }
LABEL_34:

  objc_sync_exit(v11);
  return v26;
}

+ (uint64_t)vcp_requestFileURLForAssetResource:()MediaAnalysis withTaskID:toResourceURL:cancel:
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    qos_class_t v12 = VCPLogInstance();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v13 = [v10 assetLocalIdentifier];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v10;
      _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_DEBUG, "[FileBasedDownload][%@] Attempt to download resource: %@", buf, 0x16u);
    }
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F38F90]);
  [v14 setNetworkAccessAllowed:1];
  [v14 setDownloadPriority:0];
  [v14 setDownloadIntent:6];
  [v14 setPruneAfterAvailableOnLowDisk:1];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __108__PHAssetResourceManager_MediaAnalysis__vcp_requestFileURLForAssetResource_withTaskID_toResourceURL_cancel___block_invoke;
  aBlock[3] = &unk_1E629CD80;
  id v15 = v10;
  id v59 = v15;
  dispatch_semaphore_t v16 = _Block_copy(aBlock);
  [v14 setProgressHandler:v16];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v65 = __Block_byref_object_copy__60;
  v66 = __Block_byref_object_dispose__60;
  dispatch_semaphore_t v67 = dispatch_semaphore_create(0);
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __108__PHAssetResourceManager_MediaAnalysis__vcp_requestFileURLForAssetResource_withTaskID_toResourceURL_cancel___block_invoke_201;
  v55[3] = &unk_1E629CDF8;
  id v17 = v15;
  id v56 = v17;
  uint64_t v57 = a5;
  v18 = _Block_copy(v55);
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __108__PHAssetResourceManager_MediaAnalysis__vcp_requestFileURLForAssetResource_withTaskID_toResourceURL_cancel___block_invoke_203;
  v50[3] = &unk_1E629CE20;
  id v19 = v17;
  uint64_t v53 = a1;
  uint64_t v54 = a4;
  id v51 = v19;
  v52 = buf;
  __int16 v20 = _Block_copy(v50);
  uint64_t v21 = [MEMORY[0x1E4F38F80] defaultManager];
  uint64_t v22 = [v21 requestFileURLForAssetResource:v19 options:v14 urlReceivedHandler:v18 completionHandler:v20];

  if (v22)
  {
    if (v11)
    {
      v49 = v20;
      dispatch_time_t v23 = v16;
      unint64_t v24 = -100000000;
      while (1)
      {
        uint64_t v25 = *(NSObject **)(*(void *)&buf[8] + 40);
        dispatch_time_t v26 = dispatch_time(0, 100000000);
        if (!dispatch_semaphore_wait(v25, v26))
        {
          uint64_t v33 = 0;
          dispatch_semaphore_t v16 = v23;
          __int16 v20 = v49;
          goto LABEL_35;
        }
        v24 += 100000000;
        if (v24 >= 0xDF2517701) {
          break;
        }
        if (v11[2](v11))
        {
          int v27 = MediaAnalysisLogLevel();
          dispatch_semaphore_t v16 = v23;
          __int16 v20 = v49;
          unint64_t v28 = 0x1E4F38000;
          if (v27 >= 6)
          {
            v29 = VCPLogInstance();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              uint64_t v30 = [v19 assetLocalIdentifier];
              *(_DWORD *)v60 = 138412546;
              uint64_t v61 = v30;
              __int16 v62 = 1024;
              int v63 = v22;
              v31 = (void *)v30;
              _os_log_impl(&dword_1BBEDA000, v29, OS_LOG_TYPE_INFO, "[FileBasedDownload][%@] Cancelling download (ID:%d)", v60, 0x12u);
            }
            unint64_t v28 = 0x1E4F38000uLL;
          }
          v32 = [*(id *)(v28 + 3968) defaultManager];
          [v32 cancelDataRequest:v22];

          dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)&buf[8] + 40), 0xFFFFFFFFFFFFFFFFLL);
          uint64_t v33 = 4294967168;
          goto LABEL_35;
        }
      }
      int v42 = MediaAnalysisLogLevel();
      dispatch_semaphore_t v16 = v23;
      __int16 v20 = v49;
      unint64_t v43 = 0x1E4F38000;
      if (v42 >= 4)
      {
        v44 = VCPLogInstance();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v45 = [v19 assetLocalIdentifier];
          *(_DWORD *)v60 = 138412546;
          uint64_t v61 = v45;
          __int16 v62 = 1024;
          int v63 = v22;
          v46 = (void *)v45;
          _os_log_impl(&dword_1BBEDA000, v44, OS_LOG_TYPE_DEFAULT, "[FileBasedDownload][%@] Download resource timed-out (ID:%d)", v60, 0x12u);
        }
        unint64_t v43 = 0x1E4F38000uLL;
      }
      id v47 = [*(id *)(v43 + 3968) defaultManager];
      [v47 cancelDataRequest:v22];
    }
    else
    {
      v36 = *(NSObject **)(*(void *)&buf[8] + 40);
      dispatch_time_t v37 = dispatch_time(0, 60000000000);
      if (!dispatch_semaphore_wait(v36, v37))
      {
        uint64_t v33 = 0;
        goto LABEL_35;
      }
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        id v38 = VCPLogInstance();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v39 = [v19 assetLocalIdentifier];
          *(_DWORD *)v60 = 138412546;
          uint64_t v61 = v39;
          __int16 v62 = 1024;
          int v63 = v22;
          id v40 = (void *)v39;
          _os_log_impl(&dword_1BBEDA000, v38, OS_LOG_TYPE_DEFAULT, "[FileBasedDownload][%@] Download resource timed-out (ID:%d)", v60, 0x12u);
        }
      }
      v41 = [MEMORY[0x1E4F38F80] defaultManager];
      [v41 cancelDataRequest:v22];
    }
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)&buf[8] + 40), 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v33 = 4294966371;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v34 = VCPLogInstance();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = [v19 assetLocalIdentifier];
        *(_DWORD *)v60 = 138412290;
        uint64_t v61 = (uint64_t)v35;
        _os_log_impl(&dword_1BBEDA000, v34, OS_LOG_TYPE_ERROR, "[FileBasedDownload][%@] Failed to issue resource request", v60, 0xCu);
      }
    }
    uint64_t v33 = 4294967278;
  }
LABEL_35:

  _Block_object_dispose(buf, 8);
  return v33;
}

+ (uint64_t)vcp_requestFileURLForAssetResource:()MediaAnalysis withTaskID:timeoutHandler:urlHandler:andCompletionHandler:
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    dispatch_semaphore_t v16 = VCPLogInstance();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = [v12 assetLocalIdentifier];
      *(_DWORD *)buf = 138412546;
      id v51 = v17;
      __int16 v52 = 2112;
      id v53 = v12;
      _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_INFO, "[FileBasedDownload][%@] Downloading %@", buf, 0x16u);
    }
  }
  id v18 = objc_alloc_init(MEMORY[0x1E4F38F90]);
  [v18 setNetworkAccessAllowed:1];
  [v18 setDownloadPriority:0];
  [v18 setDownloadIntent:6];
  [v18 setPruneAfterAvailableOnLowDisk:1];
  id v19 = VCPSignPostLog();
  os_signpost_id_t v20 = os_signpost_id_generate(v19);

  uint64_t v21 = VCPSignPostLog();
  uint64_t v22 = v21;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "VCPDownloadResource", "", buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __134__PHAssetResourceManager_MediaAnalysis__vcp_requestFileURLForAssetResource_withTaskID_timeoutHandler_urlHandler_andCompletionHandler___block_invoke;
  aBlock[3] = &unk_1E629CE48;
  id v23 = v12;
  id v48 = v23;
  id v49 = v13;
  id v24 = v13;
  uint64_t v25 = _Block_copy(aBlock);
  [v18 setProgressHandler:v25];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __134__PHAssetResourceManager_MediaAnalysis__vcp_requestFileURLForAssetResource_withTaskID_timeoutHandler_urlHandler_andCompletionHandler___block_invoke_204;
  v42[3] = &unk_1E629CE70;
  id v26 = v23;
  os_signpost_id_t v45 = v20;
  uint64_t v46 = 0;
  id v43 = v26;
  id v44 = v14;
  id v27 = v14;
  unint64_t v28 = _Block_copy(v42);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __134__PHAssetResourceManager_MediaAnalysis__vcp_requestFileURLForAssetResource_withTaskID_timeoutHandler_urlHandler_andCompletionHandler___block_invoke_206;
  v37[3] = &unk_1E629CE98;
  id v29 = v26;
  id v40 = a1;
  uint64_t v41 = a4;
  id v38 = v29;
  id v39 = v15;
  id v30 = v15;
  v31 = _Block_copy(v37);
  v32 = [a1 defaultManager];
  uint64_t v33 = [v32 requestFileURLForAssetResource:v29 options:v18 urlReceivedHandler:v28 completionHandler:v31];

  if (!v33 && (int)MediaAnalysisLogLevel() >= 3)
  {
    v34 = VCPLogInstance();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v36 = [v29 assetLocalIdentifier];
      *(_DWORD *)buf = 138412290;
      id v51 = v36;
      _os_log_impl(&dword_1BBEDA000, v34, OS_LOG_TYPE_ERROR, "[FileBasedDownload][%@] Failed to issue resource request", buf, 0xCu);
    }
  }

  return v33;
}

@end