@interface MADComputeServiceProcessingTask
+ (id)_taskWithPhotosAssets:(id)a3 photoLibraryURLPath:(id)a4 requestID:(id)a5 requests:(id)a6 resultDirectoryURL:(id)a7 cancelBlock:(id)a8 progressHandler:(id)a9 resultsHandler:(id)a10 completionHandler:(id)a11;
+ (id)_taskWithURLAssets:(id)a3 requestID:(id)a4 requests:(id)a5 resultDirectoryURL:(id)a6 cancelBlock:(id)a7 progressHandler:(id)a8 resultsHandler:(id)a9 completionHandler:(id)a10;
+ (id)taskWithManagedRequests:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 resultsHandler:(id)a6 completionHandler:(id)a7;
+ (id)taskWithRequestID:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 resultsHandler:(id)a6 completionHandler:(id)a7;
+ (id)taskWithRequests:(id)a3 requestID:(id)a4 assetURLs:(id)a5 resultDirectoryURL:(id)a6 cancelBlock:(id)a7 progressHandler:(id)a8 resultsHandler:(id)a9 completionHandler:(id)a10;
+ (id)taskWithRequests:(id)a3 requestID:(id)a4 localIdentifiers:(id)a5 photoLibraryURL:(id)a6 resultDirectoryURL:(id)a7 cancelBlock:(id)a8 progressHandler:(id)a9 resultsHandler:(id)a10 completionHandler:(id)a11;
+ (int)_saveResult:(id)a3 fileURL:(id)a4;
+ (int)_saveResultData:(id)a3 fileURL:(id)a4;
- (BOOL)autoCancellable;
- (BOOL)isCancelled;
- (MADComputeServiceProcessingTask)initWithRequests:(id)a3 requestID:(id)a4 assetURLs:(id)a5 resultDirectoryURL:(id)a6 cancelBlock:(id)a7 progressHandler:(id)a8 resultsHandler:(id)a9 completionHandler:(id)a10;
- (MADComputeServiceProcessingTask)initWithRequests:(id)a3 requestID:(id)a4 localIdentifiers:(id)a5 photoLibraryURL:(id)a6 resultDirectoryURL:(id)a7 cancelBlock:(id)a8 progressHandler:(id)a9 resultsHandler:(id)a10 completionHandler:(id)a11;
- (float)resourceRequirement;
- (id)_loadAssetsForTaskID:(unint64_t)a3;
- (id)_partialAnalysisURL;
- (id)_prepareFaceAssetProcessingTask;
- (id)_prepareFaceResultWithFaces:(id)a3;
- (id)_prepareSceneAssetProcessingTask;
- (id)_prepareSceneResultWithClassifications:(id)a3;
- (id)_prepareVideoAnalysisResults:(id)a3;
- (id)_processVideoAsset:(id)a3 partialAnalysis:(id)a4 analysisTypes:(unint64_t)a5 error:(id *)a6;
- (int)_processVideoAnalysis:(id)a3 analysisError:(id)a4 assetIdentifierType:(id)a5 assetIdentifier:(id)a6;
- (int)_resumePausedVideoAnalysis;
- (int)run;
- (unint64_t)_videoAnalysisTypes;
- (void)_processVideoAssetURLs;
- (void)_processVideoLocalIdentifiers;
- (void)_processVideoRequests;
- (void)_processVisionRequest:(id)a3;
- (void)_runVisionRequest:(id)a3 assetURL:(id)a4 localIdentifier:(id)a5;
- (void)_savePartialAnalysis:(id)a3 assetIdentifierType:(id)a4 assetIdentifier:(id)a5;
- (void)cancel;
- (void)dealloc;
@end

@implementation MADComputeServiceProcessingTask

- (MADComputeServiceProcessingTask)initWithRequests:(id)a3 requestID:(id)a4 localIdentifiers:(id)a5 photoLibraryURL:(id)a6 resultDirectoryURL:(id)a7 cancelBlock:(id)a8 progressHandler:(id)a9 resultsHandler:(id)a10 completionHandler:(id)a11
{
  id v41 = a3;
  id v38 = a4;
  id v40 = a5;
  id v37 = a6;
  id v36 = a7;
  v18 = (Block_layout *)a8;
  id v39 = a9;
  id v19 = a10;
  id v20 = a11;
  v42.receiver = self;
  v42.super_class = (Class)MADComputeServiceProcessingTask;
  v21 = [(MADComputeServiceProcessingTask *)&v42 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_requests, a3);
    objc_storeStrong((id *)&v22->_requestID, a4);
    objc_storeStrong((id *)&v22->_localIdentifiers, a5);
    objc_storeStrong((id *)&v22->_photoLibraryURL, a6);
    objc_storeStrong((id *)&v22->_resultDirectoryURL, a7);
    id v23 = objc_msgSend(v41, "count", v36, v37, v38);
    v22->_totalTaskCount = (double)(unint64_t)((void)[v40 count] * (void)v23);
    v22->_finishedTaskCount = 0.0;
    if (v18) {
      v24 = v18;
    }
    else {
      v24 = &stru_10021C210;
    }
    v25 = objc_retainBlock(v24);
    id cancelBlock = v22->_cancelBlock;
    v22->_id cancelBlock = v25;

    id v27 = objc_retainBlock(v39);
    id progressHandler = v22->_progressHandler;
    v22->_id progressHandler = v27;

    id v29 = objc_retainBlock(v19);
    id resultsHandler = v22->_resultsHandler;
    v22->_id resultsHandler = v29;

    id v31 = objc_retainBlock(v20);
    id completionHandler = v22->_completionHandler;
    v22->_id completionHandler = v31;

    uint64_t v33 = +[NSMutableArray array];
    videoProcessingRequests = v22->_videoProcessingRequests;
    v22->_videoProcessingRequests = (NSMutableArray *)v33;
  }
  return v22;
}

+ (id)taskWithRequests:(id)a3 requestID:(id)a4 localIdentifiers:(id)a5 photoLibraryURL:(id)a6 resultDirectoryURL:(id)a7 cancelBlock:(id)a8 progressHandler:(id)a9 resultsHandler:(id)a10 completionHandler:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = [objc_alloc((Class)objc_opt_class()) initWithRequests:v16 requestID:v17 localIdentifiers:v18 photoLibraryURL:v19 resultDirectoryURL:v20 cancelBlock:v21 progressHandler:v22 resultsHandler:v23 completionHandler:v24];

  return v25;
}

- (MADComputeServiceProcessingTask)initWithRequests:(id)a3 requestID:(id)a4 assetURLs:(id)a5 resultDirectoryURL:(id)a6 cancelBlock:(id)a7 progressHandler:(id)a8 resultsHandler:(id)a9 completionHandler:(id)a10
{
  id v39 = a3;
  id v38 = a4;
  id v37 = a5;
  id v36 = a6;
  id v17 = (Block_layout *)a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  v40.receiver = self;
  v40.super_class = (Class)MADComputeServiceProcessingTask;
  id v21 = [(MADComputeServiceProcessingTask *)&v40 init];
  id v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_requests, a3);
    objc_storeStrong((id *)&v22->_requestID, a4);
    objc_storeStrong((id *)&v22->_assetURLs, a5);
    objc_storeStrong((id *)&v22->_resultDirectoryURL, a6);
    id v23 = objc_msgSend(v39, "count", v36, v37, v38);
    v22->_totalTaskCount = (double)([(NSArray *)v22->_assetURLs count] * (unint64_t)v23);
    v22->_finishedTaskCount = 0.0;
    if (v17) {
      id v24 = v17;
    }
    else {
      id v24 = &stru_10021C230;
    }
    id v25 = objc_retainBlock(v24);
    id cancelBlock = v22->_cancelBlock;
    v22->_id cancelBlock = v25;

    id v27 = objc_retainBlock(v18);
    id progressHandler = v22->_progressHandler;
    v22->_id progressHandler = v27;

    id v29 = objc_retainBlock(v19);
    id resultsHandler = v22->_resultsHandler;
    v22->_id resultsHandler = v29;

    id v31 = objc_retainBlock(v20);
    id completionHandler = v22->_completionHandler;
    v22->_id completionHandler = v31;

    uint64_t v33 = +[NSMutableArray array];
    videoProcessingRequests = v22->_videoProcessingRequests;
    v22->_videoProcessingRequests = (NSMutableArray *)v33;
  }
  return v22;
}

+ (id)taskWithRequests:(id)a3 requestID:(id)a4 assetURLs:(id)a5 resultDirectoryURL:(id)a6 cancelBlock:(id)a7 progressHandler:(id)a8 resultsHandler:(id)a9 completionHandler:(id)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = [objc_alloc((Class)objc_opt_class()) initWithRequests:v15 requestID:v16 assetURLs:v17 resultDirectoryURL:v18 cancelBlock:v19 progressHandler:v20 resultsHandler:v21 completionHandler:v22];

  return v23;
}

+ (int)_saveResultData:(id)a3 fileURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[NSString stringWithFormat:@"[MACS][SaveResultData][%@]", v6];
  id v15 = 0;
  unsigned __int8 v8 = [v5 writeToURL:v6 options:1 error:&v15];
  id v9 = v15;
  if (v8)
  {
    if ((int)MediaAnalysisLogLevel() < 6)
    {
      int v12 = 0;
      goto LABEL_13;
    }
    v10 = VCPLogInstance();
    os_log_type_t v11 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v10, v11))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v7;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "%@ Saved result to %@", buf, 0x16u);
    }
    int v12 = 0;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() < 3)
    {
      int v12 = -20;
      goto LABEL_13;
    }
    v10 = VCPLogInstance();
    os_log_type_t v13 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v10, v13))
    {
      *(_DWORD *)buf = 138412802;
      id v17 = v7;
      __int16 v18 = 2112;
      id v19 = v5;
      __int16 v20 = 2112;
      id v21 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, v13, "%@ Failed to save result %@ - %@", buf, 0x20u);
    }
    int v12 = -20;
  }

LABEL_13:
  return v12;
}

+ (int)_saveResult:(id)a3 fileURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = +[NSString stringWithFormat:@"[MACS][SaveResult][%@]", v7];
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v9 = VCPLogInstance();
    os_log_type_t v10 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v9, v10))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = v8;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "%@ MACS result %@", buf, 0x16u);
    }
  }
  id v17 = 0;
  os_log_type_t v11 = +[NSKeyedArchiver archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v17];
  id v12 = v17;
  if (v11)
  {
    int v13 = [a1 _saveResultData:v11 fileURL:v7];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v14 = VCPLogInstance();
      os_log_type_t v15 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v14, v15))
      {
        *(_DWORD *)buf = 138412802;
        id v19 = v8;
        __int16 v20 = 2112;
        id v21 = v6;
        __int16 v22 = 2112;
        id v23 = v12;
        _os_log_impl((void *)&_mh_execute_header, v14, v15, "%@ Failed to archive result %@ - %@", buf, 0x20u);
      }
    }
    int v13 = -18;
  }

  return v13;
}

+ (id)_taskWithPhotosAssets:(id)a3 photoLibraryURLPath:(id)a4 requestID:(id)a5 requests:(id)a6 resultDirectoryURL:(id)a7 cancelBlock:(id)a8 progressHandler:(id)a9 resultsHandler:(id)a10 completionHandler:(id)a11
{
  id v31 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v32 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100090BFC;
  v33[3] = &unk_10021C258;
  id v24 = v22;
  id v36 = v24;
  id v25 = v18;
  id v34 = v25;
  id v26 = v20;
  id v35 = v26;
  id v37 = a1;
  id v27 = objc_retainBlock(v33);
  v28 = +[NSURL fileURLWithPath:v17];
  id v29 = +[MADComputeServiceProcessingTask taskWithRequests:v19 requestID:v25 localIdentifiers:v31 photoLibraryURL:v28 resultDirectoryURL:v26 cancelBlock:v32 progressHandler:v21 resultsHandler:v27 completionHandler:v23];

  return v29;
}

+ (id)_taskWithURLAssets:(id)a3 requestID:(id)a4 requests:(id)a5 resultDirectoryURL:(id)a6 cancelBlock:(id)a7 progressHandler:(id)a8 resultsHandler:(id)a9 completionHandler:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  v30 = _NSConcreteStackBlock;
  uint64_t v31 = 3221225472;
  id v32 = sub_100091114;
  uint64_t v33 = &unk_10021C280;
  id v24 = v22;
  id v36 = v24;
  id v25 = v17;
  id v34 = v25;
  id v26 = v19;
  id v35 = v26;
  id v37 = a1;
  id v27 = objc_retainBlock(&v30);
  v28 = +[MADComputeServiceProcessingTask taskWithRequests:requestID:assetURLs:resultDirectoryURL:cancelBlock:progressHandler:resultsHandler:completionHandler:](MADComputeServiceProcessingTask, "taskWithRequests:requestID:assetURLs:resultDirectoryURL:cancelBlock:progressHandler:resultsHandler:completionHandler:", v18, v25, v16, v26, v20, v21, v27, v23, v30, v31, v32, v33);

  return v28;
}

+ (id)taskWithManagedRequests:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 resultsHandler:(id)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v82 = a4;
  id v83 = a5;
  id v84 = a6;
  id v85 = a7;
  v86 = v11;
  if ([v11 count])
  {
    v90 = +[NSMutableArray array];
    v89 = +[NSMutableArray array];
    id v12 = [v11 firstObject];
    v94 = [v12 requestID];

    int v13 = [v11 firstObject];
    v14 = [v13 resultDirectoryURL];
    os_log_type_t v15 = [v11 firstObject];
    id v16 = [v15 resultDirectoryURLExtension];
    _CFURLAttachSecurityScopeToFileURL();

    id v17 = [v11 firstObject];
    id v18 = [v17 resultDirectoryURL];
    LODWORD(v16) = [v18 startAccessingSecurityScopedResource];

    if (v16)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        id v19 = VCPLogInstance();
        os_log_type_t v20 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v19, v20))
        {
          id v21 = [v11 firstObject];
          id v22 = [v21 resultDirectoryURL];
          *(_DWORD *)buf = 138412546;
          CFStringRef v111 = @"[MACS]";
          __int16 v112 = 2112;
          v113 = v22;
          _os_log_impl((void *)&_mh_execute_header, v19, v20, "%@ Consuming secure scoped result URL %@", buf, 0x16u);
        }
      }
      long long v107 = 0u;
      long long v108 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      id obj = v11;
      id v23 = [obj countByEnumeratingWithState:&v105 objects:v109 count:16];
      if (!v23)
      {
        char v87 = 1;
        goto LABEL_62;
      }
      uint64_t v93 = *(void *)v106;
      os_log_type_t v91 = VCPLogToOSLogType[4];
      os_log_type_t v24 = VCPLogToOSLogType[3];
      char v87 = 1;
      os_log_type_t type = VCPLogToOSLogType[7];
      while (1)
      {
        id v25 = 0;
        do
        {
          if (*(void *)v106 != v93) {
            objc_enumerationMutation(obj);
          }
          id v26 = *(NSObject **)(*((void *)&v105 + 1) + 8 * (void)v25);
          v28 = +[NSString stringWithFormat:@"[MACS][%@]", v94];
          id v29 = [v26 requestID];
          unsigned __int8 v30 = [v29 isEqualToString:v94];

          if (v30)
          {
            uint64_t v31 = objc_opt_class();
            id v32 = [v26 requestData];
            id v104 = 0;
            uint64_t v33 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v31 fromData:v32 error:&v104];
            id v34 = v104;

            if (v33)
            {
              if ((int)MediaAnalysisLogLevel() >= 3)
              {
                id v35 = VCPLogInstance();
                if (os_log_type_enabled(v35, v24))
                {
                  id v36 = objc_opt_class();
                  *(_DWORD *)buf = 138412546;
                  CFStringRef v111 = v28;
                  __int16 v112 = 2112;
                  v113 = v36;
                  id v37 = v36;
                  _os_log_impl((void *)&_mh_execute_header, v35, v24, "%@ Loaded request %@", buf, 0x16u);
                }
              }
              [v90 addObject:v33];
              id v38 = [v26 assetURL];
              BOOL v39 = v38 == 0;

              if (!v39)
              {
                objc_super v40 = [v26 assetURL];
                id v41 = [v26 assetURLExtension];
                _CFURLAttachSecurityScopeToFileURL();

                objc_super v42 = [v26 assetURL];
                LODWORD(v40) = [v42 startAccessingSecurityScopedResource];

                if (v40)
                {
                  if ((int)MediaAnalysisLogLevel() >= 7)
                  {
                    v43 = VCPLogInstance();
                    if (os_log_type_enabled(v43, type))
                    {
                      v44 = [v26 assetURL];
                      *(_DWORD *)buf = 138412546;
                      CFStringRef v111 = v28;
                      __int16 v112 = 2112;
                      v113 = v44;
                      _os_log_impl((void *)&_mh_execute_header, v43, type, "%@ Consuming secure scoped URL %@", buf, 0x16u);
                    }
                  }
                  v45 = [v26 assetURL];
                  [v89 addObject:v45];
                  goto LABEL_37;
                }
                if ((int)MediaAnalysisLogLevel() >= 3)
                {
                  v47 = VCPLogInstance();
                  if (os_log_type_enabled(v47, v24))
                  {
                    v53 = [v26 assetURL];
                    *(_DWORD *)buf = 138412546;
                    CFStringRef v111 = v28;
                    __int16 v112 = 2112;
                    v113 = v53;
                    _os_log_impl((void *)&_mh_execute_header, v47, v24, "%@ Failed to open secure scoped URL %@; skip",
                      buf,
                      0x16u);
                  }
                  goto LABEL_38;
                }
LABEL_39:

                goto LABEL_40;
              }
              v49 = [v26 assetIdentifier];
              BOOL v50 = v49 == 0;

              if (v50)
              {
                if ((int)MediaAnalysisLogLevel() < 3) {
                  goto LABEL_39;
                }
                v47 = VCPLogInstance();
                if (os_log_type_enabled(v47, v24))
                {
                  *(_DWORD *)buf = 138412546;
                  CFStringRef v111 = v28;
                  __int16 v112 = 2112;
                  v113 = v26;
                  _os_log_impl((void *)&_mh_execute_header, v47, v24, "%@ Failed to prepare asset for request %@; skip",
                    buf,
                    0x16u);
                }
              }
              else
              {
                if ((int)MediaAnalysisLogLevel() >= 7)
                {
                  v51 = VCPLogInstance();
                  if (os_log_type_enabled(v51, type))
                  {
                    v52 = [v26 assetIdentifier];
                    *(_DWORD *)buf = 138412546;
                    CFStringRef v111 = v28;
                    __int16 v112 = 2112;
                    v113 = v52;
                    _os_log_impl((void *)&_mh_execute_header, v51, type, "%@ Loading Photos asset %@", buf, 0x16u);
                  }
                }
                v45 = [v26 assetIdentifier];
                [v89 addObject:v45];
                char v87 = 0;
LABEL_37:

                [v26 setAttempts:(__int16)((unsigned __int16)[v26 attempts] + 1)];
                v47 = +[NSDate now];
                [v26 setPreviousAttemptDate:v47];
              }
            }
            else
            {
              if ((int)MediaAnalysisLogLevel() < 3) {
                goto LABEL_39;
              }
              v47 = VCPLogInstance();
              if (os_log_type_enabled(v47, v24))
              {
                v48 = [v26 requestData];
                *(_DWORD *)buf = 138412546;
                CFStringRef v111 = v28;
                __int16 v112 = 2112;
                v113 = v48;
                _os_log_impl((void *)&_mh_execute_header, v47, v24, "%@ Failed to unarchive request %@; skip",
                  buf,
                  0x16u);
              }
            }
LABEL_38:

            goto LABEL_39;
          }
          if ((int)MediaAnalysisLogLevel() < 4) {
            goto LABEL_41;
          }
          id v34 = VCPLogInstance();
          if (os_log_type_enabled(v34, v91))
          {
            v46 = [v26 requestID];
            *(_DWORD *)buf = 138412546;
            CFStringRef v111 = v28;
            __int16 v112 = 2112;
            v113 = v46;
            _os_log_impl((void *)&_mh_execute_header, v34, v91, "%@ Mismatched requestID %@; skip", buf, 0x16u);
          }
LABEL_40:

LABEL_41:
          id v25 = (char *)v25 + 1;
        }
        while (v23 != v25);
        id v54 = [obj countByEnumeratingWithState:&v105 objects:v109 count:16];
        id v23 = v54;
        if (!v54)
        {
LABEL_62:

          v62 = +[MADSystemDataStore systemDataStore];
          id v103 = 0;
          unsigned __int8 v63 = [v62 commitChangesOrRollback:&v103];
          v58 = v103;

          if ((v63 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
          {
            v64 = VCPLogInstance();
            os_log_type_t v65 = VCPLogToOSLogType[3];
            if (os_log_type_enabled(v64, v65))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v111 = @"[MACS]";
              __int16 v112 = 2112;
              v113 = v58;
              _os_log_impl((void *)&_mh_execute_header, v64, v65, "%@ Failed prepare analysis - %@", buf, 0x16u);
            }
          }
          v99[0] = _NSConcreteStackBlock;
          v99[1] = 3221225472;
          v99[2] = sub_1000923E4;
          v99[3] = &unk_10021C2A8;
          id v66 = obj;
          id v100 = v66;
          v101 = @"[MACS]";
          id v102 = v85;
          v67 = objc_retainBlock(v99);
          if (v87)
          {
            v95[0] = _NSConcreteStackBlock;
            v95[1] = 3221225472;
            v95[2] = sub_100092720;
            v95[3] = &unk_10021C2A8;
            id v68 = v66;
            id v96 = v68;
            v97 = @"[MACS]";
            v98 = v67;
            v69 = objc_retainBlock(v95);
            v70 = [v68 firstObject];
            v71 = [v70 requestID];
            v72 = [v68 firstObject];
            v73 = [v72 resultDirectoryURL];
            v57 = [a1 _taskWithURLAssets:v89 requestID:v71 requests:v90 resultDirectoryURL:v73 cancelBlock:v82 progressHandler:v83 resultsHandler:v84 completionHandler:v69];

            v74 = v96;
          }
          else
          {
            v74 = [v66 firstObject];
            v75 = [v74 sourceIdentifier];
            v76 = [v66 firstObject];
            v77 = [v76 requestID];
            v78 = [v66 firstObject];
            v79 = [v78 resultDirectoryURL];
            v57 = [a1 _taskWithPhotosAssets:v89 photoLibraryURLPath:v75 requestID:v77 requests:v90 resultDirectoryURL:v79 cancelBlock:v82 progressHandler:v83 resultsHandler:v84 completionHandler:v67];
          }
          goto LABEL_71;
        }
      }
    }
    if ((int)MediaAnalysisLogLevel() < 3)
    {
      v57 = 0;
    }
    else
    {
      v58 = VCPLogInstance();
      os_log_type_t v59 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v58, v59))
      {
        v60 = [v11 firstObject];
        v61 = [v60 resultDirectoryURL];
        *(_DWORD *)buf = 138412546;
        CFStringRef v111 = @"[MACS]";
        __int16 v112 = 2112;
        v113 = v61;
        _os_log_impl((void *)&_mh_execute_header, v58, v59, "%@ Failed to open secure scoped result URL %@; exit",
          buf,
          0x16u);
      }
      v57 = 0;
LABEL_71:
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() < 3)
    {
      v57 = 0;
      goto LABEL_74;
    }
    v55 = VCPLogInstance();
    os_log_type_t v56 = VCPLogToOSLogType[3];
    v90 = v55;
    if (os_log_type_enabled(v55, v56))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v111 = @"[MACS]";
      _os_log_impl((void *)&_mh_execute_header, v55, v56, "%@ ManagedRequests is empty", buf, 0xCu);
    }
    v57 = 0;
  }

LABEL_74:
  return v57;
}

+ (id)taskWithRequestID:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 resultsHandler:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v24 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = +[NSPredicate predicateWithFormat:@"requestID==%@ AND status==%lu", v12, 0];
  id v25 = 0;
  id v17 = +[MADManagedRequest fetchTaskScheduleWithPredicate:v16 error:&v25];
  id v18 = v25;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v19 = VCPLogInstance();
    os_log_type_t v20 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v19, v20))
    {
      id v21 = [v17 count];
      *(_DWORD *)buf = 138412546;
      id v27 = v12;
      __int16 v28 = 2048;
      id v29 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "[%@] Fetched %lu requests", buf, 0x16u);
    }
  }
  id v22 = [a1 taskWithManagedRequests:v17 cancelBlock:v24 progressHandler:v13 resultsHandler:v14 completionHandler:v15];

  return v22;
}

- (void)dealloc
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_started);
  if ((v3 & 1) == 0)
  {
    id completionHandler = (void (**)(id, void *))self->_completionHandler;
    NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
    id v5 = +[NSString stringWithFormat:@"[MADComputeServiceProcessingTask] Request is canceled before started"];
    os_log_type_t v10 = v5;
    id v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    id v7 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v6];
    completionHandler[2](completionHandler, v7);
  }
  v8.receiver = self;
  v8.super_class = (Class)MADComputeServiceProcessingTask;
  [(MADComputeServiceProcessingTask *)&v8 dealloc];
}

- (float)resourceRequirement
{
  return 1.0;
}

- (BOOL)autoCancellable
{
  return 0;
}

- (void)cancel
{
}

- (BOOL)isCancelled
{
  if ((*((uint64_t (**)(void))self->_cancelBlock + 2))()) {
    return 1;
  }
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_canceled);
  return v4 & 1;
}

- (id)_loadAssetsForTaskID:(unint64_t)a3
{
  id v5 = +[VCPPhotoLibraryManager sharedManager];
  id v6 = [v5 photoLibraryWithURL:self->_photoLibraryURL];

  id v7 = +[PHAsset vcp_fetchOptionsForLibrary:v6 forTaskID:a3];
  objc_super v8 = +[PHAsset fetchAssetsWithLocalIdentifiers:self->_localIdentifiers options:v7];

  return v8;
}

- (id)_prepareSceneResultWithClassifications:(id)a3
{
  id v24 = a3;
  id v26 = +[NSMutableSet set];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v3 = v24;
  id v4 = [v3 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v28;
    os_log_type_t type = VCPLogToOSLogType[7];
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v28 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        NSErrorUserInfoKey v9 = +[PFSceneTaxonomy vcp_sharedTaxonomy];
        os_log_type_t v10 = objc_msgSend(v9, "nodeForExtendedSceneClassId:", objc_msgSend(v7, "extendedSceneIdentifier"));

        if (v10 && [v10 networkId] == (id)1)
        {
          id v11 = [v10 name];
          [v7 confidence];
          double v13 = v12;
          [v7 boundingBox];
          id v18 = +[MADSceneClassification entryWithLabel:confidence:boundingBox:](MADSceneClassification, "entryWithLabel:confidence:boundingBox:", v11, v13, v14, v15, v16, v17);

          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            id v19 = VCPLogInstance();
            if (os_log_type_enabled(v19, type))
            {
              *(_DWORD *)buf = 138412290;
              id v32 = v18;
              _os_log_impl((void *)&_mh_execute_header, v19, type, "[MADComputeServiceProcessingTask] classification result %@", buf, 0xCu);
            }
          }
          [v26 addObject:v18];
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v4);
  }

  if (v26)
  {
    os_log_type_t v20 = +[MADSceneClassificationResult resultWithClassifications:](MADSceneClassificationResult, "resultWithClassifications:");
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v21 = VCPLogInstance();
      os_log_type_t v22 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v21, v22))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "[MADComputeServiceProcessingTask] Failed to load scene classification", buf, 2u);
      }
    }
    os_log_type_t v20 = 0;
  }

  return v20;
}

- (id)_prepareSceneAssetProcessingTask
{
  id v38 = +[NSString stringWithFormat:@"[MADComputeServiceProcessingTask][VCPMADSceneAssetProcessingTask]"];
  if ([(NSArray *)self->_assetURLs count])
  {
    id v32 = +[VNSceneClassificationRequest vcp_sceneRequest];
    unint64_t v37 = 0;
    os_log_type_t v30 = VCPLogToOSLogType[3];
    os_log_type_t type = VCPLogToOSLogType[6];
    os_log_type_t v39 = VCPLogToOSLogType[7];
    while (v37 < [(NSArray *)self->_assetURLs count])
    {
      self->_finishedTaskCount = self->_finishedTaskCount + 1.0;
      id v2 = objc_alloc((Class)VNImageRequestHandler);
      id v3 = [(NSArray *)self->_assetURLs objectAtIndexedSubscript:v37];
      id v34 = [v2 initWithURL:v3 orientation:1 options:&__NSDictionary0__struct];

      v55 = v32;
      id v4 = +[NSArray arrayWithObjects:&v55 count:1];
      id v47 = 0;
      LODWORD(v2) = [v34 performRequests:v4 error:&v47];
      id v35 = v47;

      if (v2)
      {
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          uint64_t v5 = VCPLogInstance();
          if (os_log_type_enabled(v5, type))
          {
            id v6 = [v32 results];
            *(_DWORD *)buf = 138412546;
            v52 = v38;
            __int16 v53 = 2112;
            id v54 = v6;
            _os_log_impl((void *)&_mh_execute_header, v5, type, "%@ Analysis finished - %@", buf, 0x16u);
          }
        }
        id v7 = +[NSMutableSet set];
        long long v46 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v43 = 0u;
        objc_super v8 = [v32 results];
        id v9 = [v8 countByEnumeratingWithState:&v43 objects:v50 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v44;
          do
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(void *)v44 != v10) {
                objc_enumerationMutation(v8);
              }
              double v12 = *(void **)(*((void *)&v43 + 1) + 8 * i);
              double v14 = [v12 identifier];
              [v12 confidence];
              double v16 = +[MADSceneClassification entryWithLabel:confidence:boundingBox:](MADSceneClassification, "entryWithLabel:confidence:boundingBox:", v14, v15, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);

              if ((int)MediaAnalysisLogLevel() >= 7)
              {
                double v17 = VCPLogInstance();
                if (os_log_type_enabled(v17, v39))
                {
                  *(_DWORD *)buf = 138412546;
                  v52 = v38;
                  __int16 v53 = 2112;
                  id v54 = v16;
                  _os_log_impl((void *)&_mh_execute_header, v17, v39, "%@ classification result %@", buf, 0x16u);
                }
              }
              [v7 addObject:v16];
            }
            id v9 = [v8 countByEnumeratingWithState:&v43 objects:v50 count:16];
          }
          while (v9);
        }

        id v18 = +[MADSceneClassificationResult resultWithClassifications:v7];
        (*((void (**)(double))self->_progressHandler + 2))(self->_finishedTaskCount / self->_totalTaskCount);
        id resultsHandler = (void (**)(id, void *, void *, void))self->_resultsHandler;
        os_log_type_t v20 = [(NSArray *)self->_assetURLs objectAtIndexedSubscript:v37];
        resultsHandler[2](resultsHandler, v20, v18, 0);
      }
      else
      {
        NSErrorUserInfoKey v48 = NSLocalizedDescriptionKey;
        id v21 = [(NSArray *)self->_assetURLs objectAtIndexedSubscript:v37];
        os_log_type_t v22 = +[NSString stringWithFormat:@"%@ Analysis failed with asset %@ - %@", v38, v21, v35];
        v49 = v22;
        id v23 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
        id v7 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v23];

        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          id v24 = VCPLogInstance();
          if (os_log_type_enabled(v24, v30))
          {
            *(_DWORD *)buf = 138412290;
            v52 = v7;
            _os_log_impl((void *)&_mh_execute_header, v24, v30, "%@", buf, 0xCu);
          }
        }
        (*((void (**)(double))self->_progressHandler + 2))(self->_finishedTaskCount / self->_totalTaskCount);
        (*((void (**)(void))self->_resultsHandler + 2))();
      }

      ++v37;
    }

    id v25 = 0;
  }
  else
  {
    id v26 = [VCPMADSceneAssetProcessingTask alloc];
    localIdentifiers = self->_localIdentifiers;
    photoLibraryURL = self->_photoLibraryURL;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_100093978;
    v42[3] = &unk_100219D98;
    v42[4] = self;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100093980;
    v40[3] = &unk_10021C2D0;
    v40[4] = self;
    id v41 = v38;
    id v25 = [(VCPMADSceneAssetProcessingTask *)v26 initWithLocalIdentifiers:localIdentifiers fromPhotoLibraryWithURL:photoLibraryURL cancelBlock:v42 progressHandler:0 completionHandler:v40];
  }
  return v25;
}

- (id)_prepareFaceResultWithFaces:(id)a3
{
  id v22 = a3;
  id v3 = +[NSMutableSet set];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v22;
  id v4 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v25;
    os_log_type_t v6 = VCPLogToOSLogType[7];
    uint64_t v7 = 1;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v25 != v5) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        [v9 centerX];
        double v12 = v11;
        [v9 centerY];
        double v14 = v13;
        [v9 size];
        +[VCPFaceUtils faceRectFromNormalizedCenterX:normalizedCenterY:normalizedSize:sourceWidth:sourceHeight:](VCPFaceUtils, "faceRectFromNormalizedCenterX:normalizedCenterY:normalizedSize:sourceWidth:sourceHeight:", v12, v14, v15, (double)(uint64_t)[v9 sourceWidth], (double)(uint64_t)objc_msgSend(v9, "sourceHeight"));
        [v9 quality];
        double v16 = +[MADDetectedFace entryWithFaceID:confidence:boundingBox:](MADDetectedFace, "entryWithFaceID:confidence:boundingBox:", (char *)i + v7);
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          double v17 = VCPLogInstance();
          if (os_log_type_enabled(v17, v6))
          {
            *(_DWORD *)buf = 138412290;
            long long v29 = v16;
            _os_log_impl((void *)&_mh_execute_header, v17, v6, "[MADComputeServiceProcessingTask] face result %@", buf, 0xCu);
          }
        }
        [v3 addObject:v16];
      }
      id v4 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
      uint64_t v7 = (v7 + i);
    }
    while (v4);
  }

  if (v3)
  {
    id v18 = +[MADFaceDetectionResult resultWithDetectedFaces:v3];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v19 = VCPLogInstance();
      os_log_type_t v20 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v19, v20))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "[MADComputeServiceProcessingTask] Failed to load face result", buf, 2u);
      }
    }
    id v18 = 0;
  }

  return v18;
}

- (id)_prepareFaceAssetProcessingTask
{
  id v41 = +[NSString stringWithFormat:@"[MADComputeServiceProcessingTask][VCPMADQuickFaceIDAssetProcessingTask]"];
  if ([(NSArray *)self->_assetURLs count])
  {
    id v2 = +[PHPhotoLibrary vcp_defaultPhotoLibrary];
    id v34 = +[VCPPhotosFaceProcessingContext contextWithPhotoLibrary:v2];

    id v36 = [objc_alloc((Class)VCPFaceAnalyzer) initWithContext:v34];
    unint64_t v40 = 0;
    os_log_type_t type = VCPLogToOSLogType[3];
    os_log_type_t v42 = VCPLogToOSLogType[7];
    while (v40 < [(NSArray *)self->_assetURLs count])
    {
      self->_finishedTaskCount = self->_finishedTaskCount + 1.0;
      id v3 = +[VCPImageManager sharedImageManager];
      id v4 = [(NSArray *)self->_assetURLs objectAtIndexedSubscript:v40];
      id v51 = [v3 pixelBufferWithFormat:875704438 fromImageURL:v4 flushCache:0];

      id v50 = 0;
      id v5 = [v36 quickAnalyzeCVPixelBuffer:v51 results:&v50];
      id v38 = v50;
      if (v5)
      {
        NSErrorUserInfoKey v52 = NSLocalizedDescriptionKey;
        os_log_type_t v6 = [(NSArray *)self->_assetURLs objectAtIndexedSubscript:v40];
        uint64_t v7 = +[NSString stringWithFormat:@"%@ Analysis failed (%d) asset at %@", v41, v5, v6];
        __int16 v53 = v7;
        objc_super v8 = +[NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
        id v9 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v8];

        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          uint64_t v10 = VCPLogInstance();
          if (os_log_type_enabled(v10, type))
          {
            *(_DWORD *)buf = 138412290;
            v55 = v9;
            _os_log_impl((void *)&_mh_execute_header, v10, type, "%@", buf, 0xCu);
          }
        }
        (*((void (**)(double))self->_progressHandler + 2))(self->_finishedTaskCount / self->_totalTaskCount);
        (*((void (**)(void))self->_resultsHandler + 2))();
      }
      else
      {
        id v9 = +[NSMutableSet set];
        double v11 = [v38 objectForKeyedSubscript:@"FaceResults"];
        long long v49 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v46 = 0u;
        id v12 = v11;
        id v13 = [v12 countByEnumeratingWithState:&v46 objects:v58 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v47;
          uint64_t v15 = 1;
          do
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v47 != v14) {
                objc_enumerationMutation(v12);
              }
              double v17 = *(void **)(*((void *)&v46 + 1) + 8 * i);
              [v17 centerX];
              double v20 = v19;
              [v17 centerY];
              double v22 = v21;
              [v17 size];
              +[VCPFaceUtils faceRectFromNormalizedCenterX:normalizedCenterY:normalizedSize:sourceWidth:sourceHeight:](VCPFaceUtils, "faceRectFromNormalizedCenterX:normalizedCenterY:normalizedSize:sourceWidth:sourceHeight:", v20, v22, v23, (double)(uint64_t)[v17 sourceWidth], (double)(uint64_t)objc_msgSend(v17, "sourceHeight"));
              [v17 quality];
              long long v24 = +[MADDetectedFace entryWithFaceID:confidence:boundingBox:](MADDetectedFace, "entryWithFaceID:confidence:boundingBox:", (char *)i + v15);
              if ((int)MediaAnalysisLogLevel() >= 7)
              {
                long long v25 = VCPLogInstance();
                if (os_log_type_enabled(v25, v42))
                {
                  *(_DWORD *)buf = 138412546;
                  v55 = v41;
                  __int16 v56 = 2112;
                  v57 = v24;
                  _os_log_impl((void *)&_mh_execute_header, v25, v42, "%@ face result %@", buf, 0x16u);
                }
              }
              [v9 addObject:v24];
            }
            id v13 = [v12 countByEnumeratingWithState:&v46 objects:v58 count:16];
            uint64_t v15 = (v15 + i);
          }
          while (v13);
        }

        long long v26 = +[MADFaceDetectionResult resultWithDetectedFaces:v9];
        (*((void (**)(double))self->_progressHandler + 2))(self->_finishedTaskCount / self->_totalTaskCount);
        id resultsHandler = (void (**)(id, void *, void *, void))self->_resultsHandler;
        long long v28 = [(NSArray *)self->_assetURLs objectAtIndexedSubscript:v40];
        resultsHandler[2](resultsHandler, v28, v26, 0);
      }
      sub_100004484((const void **)&v51);
      ++v40;
    }

    long long v29 = 0;
  }
  else
  {
    os_log_type_t v30 = [VCPMADQuickFaceIDAssetProcessingTask alloc];
    localIdentifiers = self->_localIdentifiers;
    photoLibraryURL = self->_photoLibraryURL;
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_1000948A8;
    v45[3] = &unk_100219D98;
    v45[4] = self;
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1000948B0;
    v43[3] = &unk_10021C2D0;
    v43[4] = self;
    id v44 = v41;
    long long v29 = [(VCPMADQuickFaceIDAssetProcessingTask *)v30 initWithLocalIdentifiers:localIdentifiers fromPhotoLibraryWithURL:photoLibraryURL cancelBlock:v45 progressHandler:0 completionHandler:v43];
  }
  return v29;
}

- (void)_runVisionRequest:(id)a3 assetURL:(id)a4 localIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = +[NSString stringWithFormat:@"[MADComputeServiceProcessingTask][%@]", objc_opt_class()];
  id v12 = [objc_alloc((Class)VNImageRequestHandler) initWithURL:v9 orientation:1 options:&__NSDictionary0__struct];
  id v32 = v8;
  id v13 = +[NSArray arrayWithObjects:&v32 count:1];
  id v25 = 0;
  unsigned int v14 = [v12 performRequests:v13 error:&v25];
  id v15 = v25;

  if (v14)
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      double v16 = VCPLogInstance();
      os_log_type_t v17 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v16, v17))
      {
        id v18 = [v8 results];
        *(_DWORD *)buf = 138412546;
        long long v29 = v11;
        __int16 v30 = 2112;
        uint64_t v31 = v18;
        _os_log_impl((void *)&_mh_execute_header, v16, v17, "%@ Analysis finished - %@", buf, 0x16u);
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v19 = [v8 results];
      +[MADCoreMLResult resultWithVisionResults:v19];
    }
    else
    {
      double v19 = [v8 results];
      +[MADVisionResult resultWithVisionResults:v19];
    double v22 = };

    (*((void (**)(double))self->_progressHandler + 2))(self->_finishedTaskCount / self->_totalTaskCount);
    (*((void (**)(void))self->_resultsHandler + 2))();
  }
  else
  {
    NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
    double v20 = +[NSString stringWithFormat:@"%@ Analysis failed - %@", v11, v15];
    long long v27 = v20;
    double v21 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    double v22 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v21];

    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      double v23 = VCPLogInstance();
      os_log_type_t v24 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v23, v24))
      {
        *(_DWORD *)buf = 138412290;
        long long v29 = v22;
        _os_log_impl((void *)&_mh_execute_header, v23, v24, "%@", buf, 0xCu);
      }
    }
    (*((void (**)(double))self->_progressHandler + 2))(self->_finishedTaskCount / self->_totalTaskCount);
    (*((void (**)(void))self->_resultsHandler + 2))();
  }
}

- (void)_processVisionRequest:(id)a3
{
  id v26 = a3;
  id v25 = +[NSString stringWithFormat:@"[MADComputeServiceProcessingTask][%@]", objc_opt_class()];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v4 = VCPLogInstance();
    os_log_type_t v5 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v4, v5))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v30 = v25;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "%@ Processing Vision request ...", buf, 0xCu);
    }
  }
  if (self->_localIdentifiers)
  {
    os_log_type_t v6 = +[VCPPhotoLibraryManager sharedManager];
    double v23 = [v6 photoLibraryWithURL:self->_photoLibraryURL];

    double v22 = [v23 librarySpecificFetchOptions];
    uint64_t v7 = +[PHAsset fetchAssetsWithLocalIdentifiers:options:](PHAsset, "fetchAssetsWithLocalIdentifiers:options:", self->_localIdentifiers);
    unint64_t v8 = 0;
    os_log_type_t type = VCPLogToOSLogType[3];
    while (v8 < (unint64_t)[v7 count])
    {
      id v10 = [v7 objectAtIndexedSubscript:v8];
      double v11 = +[PHAssetResource vcp_allAcceptableResourcesForAsset:v10];
      id v12 = objc_msgSend(v11, "vcp_thumbnailResource");
      id v13 = v12;
      self->_finishedTaskCount = self->_finishedTaskCount + 1.0;
      if (v12)
      {
        unsigned int v14 = [v12 privateFileURL];
        id v15 = [v10 localIdentifier];
        [(MADComputeServiceProcessingTask *)self _runVisionRequest:v26 assetURL:v14 localIdentifier:v15];
      }
      else
      {
        NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
        double v16 = +[NSString stringWithFormat:@"%@ Missing analysis media", v25];
        long long v28 = v16;
        os_log_type_t v17 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        unsigned int v14 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v17];

        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          id v18 = VCPLogInstance();
          if (os_log_type_enabled(v18, type))
          {
            *(_DWORD *)buf = 138412290;
            __int16 v30 = v14;
            _os_log_impl((void *)&_mh_execute_header, v18, type, "%@", buf, 0xCu);
          }
        }
        (*((void (**)(double))self->_progressHandler + 2))(self->_finishedTaskCount / self->_totalTaskCount);
        (*((void (**)(void))self->_resultsHandler + 2))();
      }

      ++v8;
    }
  }
  if ([(NSArray *)self->_assetURLs count])
  {
    for (unint64_t i = 0; i < [(NSArray *)self->_assetURLs count]; ++i)
    {
      self->_finishedTaskCount = self->_finishedTaskCount + 1.0;
      double v21 = [(NSArray *)self->_assetURLs objectAtIndexedSubscript:i];
      [(MADComputeServiceProcessingTask *)self _runVisionRequest:v26 assetURL:v21 localIdentifier:0];
    }
  }
}

- (id)_prepareVideoAnalysisResults:(id)a3
{
  id v131 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v4 = VCPLogInstance();
    os_log_type_t v5 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v4, v5))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = @"[PrepareVideoAnalysisResults]";
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "%@ Start parsing video analysis results", buf, 0xCu);
    }
  }
  v164[0] = _NSConcreteStackBlock;
  v164[1] = 3221225472;
  v164[2] = sub_100097058;
  v164[3] = &unk_10021C2F8;
  v164[4] = self;
  v132 = objc_retainBlock(v164);
  id v130 = +[NSMutableArray array];
  uint64_t v6 = objc_opt_class();
  v127 = ((void (*)(void *, uint64_t))v132[2])(v132, v6);
  if (v127)
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      uint64_t v7 = VCPLogInstance();
      os_log_type_t v8 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v7, v8))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = @"[PrepareVideoAnalysisResults]";
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "%@ Parsing image exposureRequest results", buf, 0xCu);
      }
    }
    id v9 = [v131 objectForKeyedSubscript:@"ExposureResults"];
    id v10 = [v9 firstObject];

    if (v10)
    {
      double v11 = [v10 objectForKeyedSubscript:@"quality"];
      [v11 doubleValue];
      double v13 = v12;
    }
    else
    {
      double v13 = 0.0;
    }
    unsigned int v14 = +[MADExposureResult resultWithExposureScore:v13];
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      id v15 = VCPLogInstance();
      os_log_type_t v16 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v15, v16))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = @"[PrepareVideoAnalysisResults]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v131;
        *(_WORD *)&buf[22] = 2112;
        *(void *)&buf[24] = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, v16, "%@ MADExposureResult %@ - %@", buf, 0x20u);
      }
    }
    [v130 addObject:v14];
  }
  uint64_t v17 = objc_opt_class();
  v128 = ((void (*)(void *, uint64_t))v132[2])(v132, v17);
  if (v128)
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      id v18 = VCPLogInstance();
      os_log_type_t v19 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v18, v19))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = @"[PrepareVideoAnalysisResults]";
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "%@ Parsing image sharpness results", buf, 0xCu);
      }
    }
    double v20 = [v131 objectForKeyedSubscript:@"BlurResults"];
    double v21 = [v20 firstObject];

    if (v21)
    {
      double v22 = [v21 objectForKeyedSubscript:@"attributes"];
      double v23 = [v22 objectForKeyedSubscript:@"sharpness"];
      [v23 doubleValue];
      double v25 = v24;
    }
    else
    {
      double v25 = 0.0;
    }
    id v26 = +[MADSharpnessResult resultWithSharpnessScore:v25];
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      NSErrorUserInfoKey v27 = VCPLogInstance();
      os_log_type_t v28 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v27, v28))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = @"[PrepareVideoAnalysisResults]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v131;
        *(_WORD *)&buf[22] = 2112;
        *(void *)&buf[24] = v26;
        _os_log_impl((void *)&_mh_execute_header, v27, v28, "%@ MADSharpnessResult %@ - %@", buf, 0x20u);
      }
    }
    [v130 addObject:v26];
  }
  uint64_t v29 = objc_opt_class();
  v129 = ((void (*)(void *, uint64_t))v132[2])(v132, v29);
  if (v129)
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      __int16 v30 = VCPLogInstance();
      os_log_type_t v31 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v30, v31))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = @"[PrepareVideoAnalysisResults]";
        _os_log_impl((void *)&_mh_execute_header, v30, v31, "%@ Parsing video scene results", buf, 0xCu);
      }
    }
    v137 = [v131 objectForKeyedSubscript:@"ClassificationResults"];
    id v32 = +[PFSceneTaxonomy vcp_sharedTaxonomy];
    v147 = +[NSMutableDictionary dictionary];
    unint64_t v140 = 0;
    os_log_type_t type = VCPLogToOSLogType[7];
    os_log_type_t v143 = VCPLogToOSLogType[3];
    while (v140 < (unint64_t)[v137 count])
    {
      uint64_t v33 = [v137 objectAtIndexedSubscript:v140];
      id v34 = v33;
      long long v171 = 0u;
      memset(buf, 0, sizeof(buf));
      v136 = v33;
      if (v33) {
        objc_msgSend(v33, "vcp_timerange");
      }
      id v35 = [v34 objectForKeyedSubscript:@"attributes"];
      long long v162 = 0u;
      long long v163 = 0u;
      long long v160 = 0u;
      long long v161 = 0u;
      id v36 = v35;
      id v37 = [v36 countByEnumeratingWithState:&v160 objects:v169 count:16];
      if (v37)
      {
        uint64_t v38 = *(void *)v161;
        do
        {
          os_log_type_t v39 = 0;
          do
          {
            if (*(void *)v161 != v38) {
              objc_enumerationMutation(v36);
            }
            unint64_t v40 = *(void **)(*((void *)&v160 + 1) + 8 * (void)v39);
            id v41 = [v36 objectForKeyedSubscript:v40];
            [v41 floatValue];
            float v43 = v42;

            id v44 = objc_msgSend(v32, "nodeForSceneClassId:", objc_msgSend(v40, "intValue"));
            long long v45 = v44;
            if (v44 && [v44 networkId] == (id)1)
            {
              long long v46 = [v45 name];
              long long v47 = [v147 objectForKeyedSubscript:v46];
              BOOL v48 = v47 == 0;

              if (v48)
              {
                long long v49 = +[NSMutableArray array];
                id v50 = [v45 name];
                [v147 setObject:v49 forKeyedSubscript:v50];
              }
              v159[0] = *(_OWORD *)buf;
              v159[1] = *(_OWORD *)&buf[16];
              v159[2] = v171;
              id v51 = +[MADSceneClassificationVideoEntry entryWithTimeRange:confidence:boundingBox:](MADSceneClassificationVideoEntry, "entryWithTimeRange:confidence:boundingBox:", v159, v43, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
              if (v51)
              {
                if ((int)MediaAnalysisLogLevel() >= 7)
                {
                  NSErrorUserInfoKey v52 = VCPLogInstance();
                  if (os_log_type_enabled(v52, type))
                  {
                    *(_DWORD *)v165 = 138412546;
                    CFStringRef v166 = @"[PrepareVideoAnalysisResults]";
                    __int16 v167 = 2112;
                    v168 = v51;
                    _os_log_impl((void *)&_mh_execute_header, v52, type, "%@ Adding entry %@", v165, 0x16u);
                  }
                }
                __int16 v53 = [v45 name];
                id v54 = [v147 objectForKeyedSubscript:v53];
                [v54 addObject:v51];

                goto LABEL_55;
              }
              if ((int)MediaAnalysisLogLevel() >= 3)
              {
                __int16 v53 = VCPLogInstance();
                if (os_log_type_enabled(v53, v143))
                {
                  v55 = [v45 name];
                  *(_DWORD *)v165 = 138412546;
                  CFStringRef v166 = @"[PrepareVideoAnalysisResults]";
                  __int16 v167 = 2112;
                  v168 = v55;
                  _os_log_impl((void *)&_mh_execute_header, v53, v143, "%@ Failed to create entry for label %@; skip",
                    v165,
                    0x16u);
                }
LABEL_55:
              }
            }

            os_log_type_t v39 = (char *)v39 + 1;
          }
          while (v37 != v39);
          id v56 = [v36 countByEnumeratingWithState:&v160 objects:v169 count:16];
          id v37 = v56;
        }
        while (v56);
      }

      ++v140;
    }
    +[NSMutableSet set];
    v156[0] = _NSConcreteStackBlock;
    v156[1] = 3221225472;
    v156[2] = sub_1000971A4;
    v156[3] = &unk_10021A4F8;
    id v57 = (id)objc_claimAutoreleasedReturnValue();
    id v157 = v57;
    v158 = @"[PrepareVideoAnalysisResults]";
    [v147 enumerateKeysAndObjectsUsingBlock:v156];
    v58 = +[MADSceneClassificationResult resultWithClassifications:v57];
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      os_log_type_t v59 = VCPLogInstance();
      if (os_log_type_enabled(v59, type))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = @"[PrepareVideoAnalysisResults]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v58;
        _os_log_impl((void *)&_mh_execute_header, v59, type, "%@ MADSceneClassificationResult %@", buf, 0x16u);
      }
    }
    [v130 addObject:v58];
  }
  uint64_t v60 = objc_opt_class();
  v126 = ((void (*)(void *, uint64_t))v132[2])(v132, v60);
  if (!v126) {
    goto LABEL_97;
  }
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v61 = VCPLogInstance();
    os_log_type_t v62 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v61, v62))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = @"[PrepareVideoAnalysisResults]";
      _os_log_impl((void *)&_mh_execute_header, v61, v62, "%@ Parsing video face results", buf, 0xCu);
    }
  }
  v148 = objc_msgSend(v131, "objectForKeyedSubscript:", @"FaceResults", v126, v127, v128, v129);
  unsigned __int8 v63 = +[NSMutableDictionary dictionary];
  unint64_t v64 = 0;
  os_log_type_t v138 = VCPLogToOSLogType[7];
  os_log_type_t v133 = VCPLogToOSLogType[3];
  contexta = v63;
  while (v64 < (unint64_t)[v148 count])
  {
    id v66 = [v148 objectAtIndexedSubscript:v64];
    v67 = v66;
    long long v171 = 0u;
    memset(buf, 0, sizeof(buf));
    if (v66) {
      objc_msgSend(v66, "vcp_timerange");
    }
    id v68 = [v67 objectForKeyedSubscript:@"attributes"];
    v69 = [v68 objectForKeyedSubscript:@"faceBounds"];
    v70 = [v68 objectForKeyedSubscript:@"faceId"];
    v71 = [v68 objectForKeyedSubscript:@"faceQuality"];
    v72 = [v63 objectForKeyedSubscript:v70];
    BOOL v73 = v72 == 0;

    if (v73)
    {
      v74 = +[NSMutableArray array];
      [v63 setObject:v74 forKeyedSubscript:v70];
    }
    v155[0] = *(_OWORD *)buf;
    v155[1] = *(_OWORD *)&buf[16];
    v155[2] = v171;
    [v71 doubleValue];
    double v76 = v75;
    NSRect v173 = NSRectFromString(v69);
    v77 = +[MADDetectedFaceVideoEntry entryWithTimeRange:confidence:boundingBox:](MADDetectedFaceVideoEntry, "entryWithTimeRange:confidence:boundingBox:", v155, v76, v173.origin.x, v173.origin.y, v173.size.width, v173.size.height);
    if (v77)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v78 = VCPLogInstance();
        if (os_log_type_enabled(v78, v138))
        {
          *(_DWORD *)v165 = 138412546;
          CFStringRef v166 = @"[PrepareVideoAnalysisResults]";
          __int16 v167 = 2112;
          v168 = v77;
          _os_log_impl((void *)&_mh_execute_header, v78, v138, "%@ Adding video entry %@", v165, 0x16u);
        }
      }
      v79 = [v63 objectForKeyedSubscript:v70];
      [v79 addObject:v77];
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_91;
      }
      v79 = VCPLogInstance();
      if (os_log_type_enabled(v79, v133))
      {
        *(_DWORD *)v165 = 138412546;
        CFStringRef v166 = @"[PrepareVideoAnalysisResults]";
        __int16 v167 = 2112;
        v168 = v68;
        _os_log_impl((void *)&_mh_execute_header, v79, v133, "%@ Failed to create video entry for %@", v165, 0x16u);
      }
      unsigned __int8 v63 = contexta;
    }

LABEL_91:
    ++v64;
  }
  +[NSMutableSet set];
  v153[0] = _NSConcreteStackBlock;
  v153[1] = 3221225472;
  v153[2] = sub_100097318;
  v153[3] = &unk_10021C320;
  id v80 = (id)objc_claimAutoreleasedReturnValue();
  id v154 = v80;
  [v63 enumerateKeysAndObjectsUsingBlock:v153];
  v81 = +[MADFaceDetectionResult resultWithDetectedFaces:v80];
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v82 = VCPLogInstance();
    if (os_log_type_enabled(v82, v138))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v81;
      _os_log_impl((void *)&_mh_execute_header, v82, v138, "[MADComputeServiceProcessingTask] MADFaceDetectionResult %@", buf, 0xCu);
    }
  }
  [v130 addObject:v81];

LABEL_97:
  uint64_t v83 = objc_opt_class();
  v141 = ((void (*)(void *, uint64_t))v132[2])(v132, v83);
  if (v141)
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      id v84 = VCPLogInstance();
      os_log_type_t v85 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v84, v85))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = @"[PrepareVideoAnalysisResults]";
        _os_log_impl((void *)&_mh_execute_header, v84, v85, "%@ Parsing movie summary results", buf, 0xCu);
      }
    }
    v149 = objc_msgSend(v131, "objectForKeyedSubscript:", @"MovieSummaryResults", v126);
    v144 = +[NSMutableArray array];
    for (unint64_t i = 0; i < (unint64_t)[v149 count]; ++i)
    {
      v88 = [v149 objectAtIndexedSubscript:i];
      v89 = v88;
      long long v171 = 0u;
      memset(buf, 0, sizeof(buf));
      if (v88) {
        objc_msgSend(v88, "vcp_timerange");
      }
      v90 = [v89 objectForKeyedSubscript:@"quality"];
      [v90 doubleValue];
      double v92 = v91;

      uint64_t v93 = [v89 objectForKeyedSubscript:@"attributes"];
      v152[0] = *(_OWORD *)buf;
      v152[1] = *(_OWORD *)&buf[16];
      v152[2] = v171;
      v94 = +[MADMovieHighlightEntry entryWithTimeRange:v152 score:v93 attributes:v92];
      [v144 addObject:v94];
    }
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v95 = VCPLogInstance();
      os_log_type_t v96 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v95, v96))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = @"[PrepareVideoAnalysisResults]";
        _os_log_impl((void *)&_mh_execute_header, v95, v96, "%@ Parsing movie highlight results", buf, 0xCu);
      }
    }
    typea = [v131 objectForKeyedSubscript:@"MovieHighlightResults"];
    v142 = +[NSMutableArray array];
    for (unint64_t j = 0; j < (unint64_t)[typea count]; ++j)
    {
      v99 = [typea objectAtIndexedSubscript:j];
      id v100 = v99;
      long long v171 = 0u;
      memset(buf, 0, sizeof(buf));
      if (v99) {
        objc_msgSend(v99, "vcp_timerange");
      }
      v101 = [v100 objectForKeyedSubscript:@"quality"];
      [v101 doubleValue];
      double v103 = v102;

      id v104 = [v100 objectForKeyedSubscript:@"attributes"];
      v151[0] = *(_OWORD *)buf;
      v151[1] = *(_OWORD *)&buf[16];
      v151[2] = v171;
      long long v105 = +[MADMovieHighlightEntry entryWithTimeRange:v151 score:v104 attributes:v103];
      [v142 addObject:v105];
    }
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      long long v106 = VCPLogInstance();
      os_log_type_t v107 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v106, v107))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = @"[PrepareVideoAnalysisResults]";
        _os_log_impl((void *)&_mh_execute_header, v106, v107, "%@ Parsing movie curation score results", buf, 0xCu);
      }
    }
    long long v108 = [v131 objectForKeyedSubscript:@"MovieHighlightScoreResults"];
    v109 = +[NSMutableArray array];
    for (unint64_t k = 0; k < (unint64_t)[v108 count]; ++k)
    {
      __int16 v112 = [v108 objectAtIndexedSubscript:k];
      v113 = v112;
      long long v171 = 0u;
      memset(buf, 0, sizeof(buf));
      if (v112) {
        objc_msgSend(v112, "vcp_timerange");
      }
      v114 = [v113 objectForKeyedSubscript:@"quality"];
      [v114 doubleValue];
      double v116 = v115;

      v117 = [v113 objectForKeyedSubscript:@"attributes"];
      v150[0] = *(_OWORD *)buf;
      v150[1] = *(_OWORD *)&buf[16];
      v150[2] = v171;
      v118 = +[MADMovieCurationScoreEntry entryWithTimeRange:v150 score:v116];
      [v109 addObject:v118];
    }
    v119 = +[MADMovieCurationResult resultWithSummaryEntries:v144 highlightEntries:v142 curationScoreEntries:v109];
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v120 = VCPLogInstance();
      os_log_type_t v121 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v120, v121))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = @"[PrepareVideoAnalysisResults]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v119;
        _os_log_impl((void *)&_mh_execute_header, v120, v121, "%@ MADMovieCurationResult %@", buf, 0x16u);
      }
    }
    [v130 addObject:v119];
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v122 = VCPLogInstance();
    os_log_type_t v123 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v122, v123))
    {
      id v124 = [v130 count];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = @"[PrepareVideoAnalysisResults]";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v124;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v130;
      _os_log_impl((void *)&_mh_execute_header, v122, v123, "%@ Prepared %lu requiredAnalysis %@", buf, 0x20u);
    }
  }
  return v130;
}

- (unint64_t)_videoAnalysisTypes
{
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100097664;
  v16[3] = &unk_10021C2F8;
  v16[4] = self;
  id v2 = objc_retainBlock(v16);
  uint64_t v3 = objc_opt_class();
  id v4 = ((void (*)(void *, uint64_t))v2[2])(v2, v3);
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = ((void (*)(void *, uint64_t))v2[2])(v2, v5);
  uint64_t v7 = objc_opt_class();
  os_log_type_t v8 = ((void (*)(void *, uint64_t))v2[2])(v2, v7);
  uint64_t v9 = objc_opt_class();
  id v10 = ((void (*)(void *, uint64_t))v2[2])(v2, v9);
  uint64_t v11 = objc_opt_class();
  double v12 = ((void (*)(void *, uint64_t))v2[2])(v2, v11);
  if (v6) {
    unint64_t v13 = ((unint64_t)(v4 != 0) << 19) | 0x200;
  }
  else {
    unint64_t v13 = (unint64_t)(v4 != 0) << 19;
  }
  if (v8) {
    v13 |= 0xC0uLL;
  }
  if (v10) {
    v13 |= 0xCuLL;
  }
  if (v12) {
    unint64_t v14 = v13 | 0x40000;
  }
  else {
    unint64_t v14 = v13;
  }

  return v14;
}

- (id)_partialAnalysisURL
{
  uint64_t v3 = +[NSString stringWithFormat:@"partialResult-%@.data", self->_requestID];
  id v4 = [(NSURL *)self->_resultDirectoryURL URLByAppendingPathComponent:v3];

  return v4;
}

- (void)_savePartialAnalysis:(id)a3 assetIdentifierType:(id)a4 assetIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = +[NSString stringWithFormat:@"[SavePartialAnalysis][%@]", v10];
  if (!v8)
  {
    if ((int)MediaAnalysisLogLevel() < 6) {
      goto LABEL_41;
    }
    unint64_t v14 = VCPLogInstance();
    os_log_type_t v15 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v14, v15))
    {
      *(_DWORD *)buf = 138412290;
      float v42 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "%@ No partial analysis to store", buf, 0xCu);
    }
LABEL_10:

    goto LABEL_41;
  }
  if (!self->_resultDirectoryURL)
  {
    if ((int)MediaAnalysisLogLevel() < 3) {
      goto LABEL_41;
    }
    unint64_t v14 = VCPLogInstance();
    os_log_type_t v16 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v14, v16))
    {
      *(_DWORD *)buf = 138412290;
      float v42 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, v16, "%@ No result directory URL; skip saving partial analysis",
        buf,
        0xCu);
    }
    goto LABEL_10;
  }
  memset(&v36, 0, sizeof(v36));
  objc_msgSend(v8, "vcp_syncPoint");
  if ((unsigned __int128)0 >> 96)
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      uint64_t v17 = VCPLogInstance();
      os_log_type_t v18 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v17, v18))
      {
        CMTime time = v36;
        Float64 Seconds = CMTimeGetSeconds(&time);
        *(_DWORD *)buf = 138413058;
        float v42 = v11;
        __int16 v43 = 2048;
        Float64 v44 = Seconds;
        __int16 v45 = 2048;
        CMTimeValue value = v36.value;
        __int16 v47 = 1024;
        CMTimeScale timescale = v36.timescale;
        _os_log_impl((void *)&_mh_execute_header, v17, v18, "%@ Saving partial analysis at sync point: %0.3fs (value: %lld, timescale: %d)", buf, 0x26u);
      }
    }
    NSFileAttributeKey v39 = NSFileProtectionKey;
    NSFileProtectionType v40 = NSFileProtectionCompleteUntilFirstUserAuthentication;
    double v12 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    v37[0] = @"assetIdentifier";
    v37[1] = @"identifierType";
    v38[0] = v10;
    v38[1] = v9;
    v37[2] = @"analysis";
    v38[2] = v8;
    id v32 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:3];
    double v20 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:");
    id v34 = 0;
    if (!v20)
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
LABEL_39:

LABEL_40:
        goto LABEL_41;
      }
      NSErrorUserInfoKey v27 = VCPLogInstance();
      os_log_type_t v28 = VCPLogToOSLogType[3];
      uint64_t v33 = v27;
      if (os_log_type_enabled(v27, v28))
      {
        *(_DWORD *)buf = 138412546;
        float v42 = v11;
        __int16 v43 = 2112;
        Float64 v44 = *(double *)&v34;
        _os_log_impl((void *)&_mh_execute_header, v27, v28, "%@ Failed to serialize partial analysis - %@", buf, 0x16u);
      }
LABEL_38:

      goto LABEL_39;
    }
    uint64_t v33 = [(MADComputeServiceProcessingTask *)self _partialAnalysisURL];
    if (![(NSURL *)self->_resultDirectoryURL startAccessingSecurityScopedResource])
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        uint64_t v29 = VCPLogInstance();
        os_log_type_t v30 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v29, v30))
        {
          resultDirectoryURL = self->_resultDirectoryURL;
          *(_DWORD *)buf = 138412546;
          float v42 = v11;
          __int16 v43 = 2112;
          Float64 v44 = *(double *)&resultDirectoryURL;
          _os_log_impl((void *)&_mh_execute_header, v29, v30, "%@ Failed to start security scoped resource %@", buf, 0x16u);
        }
      }
      goto LABEL_38;
    }
    double v21 = +[NSFileManager defaultManager];
    double v22 = [v33 path];
    unsigned int v23 = [v21 createFileAtPath:v22 contents:v20 attributes:v12];

    if (v23)
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        double v24 = VCPLogInstance();
        os_log_type_t v25 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v24, v25))
        {
          *(_DWORD *)buf = 138412546;
          float v42 = v11;
          __int16 v43 = 2112;
          Float64 v44 = *(double *)&v33;
          id v26 = "%@ Save partial analysis to %@";
LABEL_35:
          _os_log_impl((void *)&_mh_execute_header, v24, v25, v26, buf, 0x16u);
          goto LABEL_36;
        }
        goto LABEL_36;
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 3)
    {
      double v24 = VCPLogInstance();
      os_log_type_t v25 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v24, v25))
      {
        *(_DWORD *)buf = 138412546;
        float v42 = v11;
        __int16 v43 = 2112;
        Float64 v44 = *(double *)&v33;
        id v26 = "%@ Failed to save partial analysis to %@";
        goto LABEL_35;
      }
LABEL_36:
    }
    [(NSURL *)self->_resultDirectoryURL stopAccessingSecurityScopedResource];
    goto LABEL_38;
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    double v12 = VCPLogInstance();
    os_log_type_t v13 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v12, v13))
    {
      *(_DWORD *)buf = 138412290;
      float v42 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "%@ Invalid sync point in paused analysis", buf, 0xCu);
    }
    goto LABEL_40;
  }
LABEL_41:
}

- (int)_processVideoAnalysis:(id)a3 analysisError:(id)a4 assetIdentifierType:(id)a5 assetIdentifier:(id)a6
{
  id v36 = a3;
  id v10 = a4;
  id v39 = a5;
  id v37 = v10;
  id v38 = a6;
  id v35 = +[NSString stringWithFormat:@"[ProcessVideoAnalysis][%@]", v38];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    uint64_t v11 = VCPLogInstance();
    os_log_type_t v12 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v11, v12))
    {
      *(_DWORD *)buf = 138412290;
      long long v46 = v35;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "%@ Process video analysis results", buf, 0xCu);
    }
  }
  if (v10)
  {
    if ([v10 code] == (id)-128) {
      [(MADComputeServiceProcessingTask *)self _savePartialAnalysis:v36 assetIdentifierType:v39 assetIdentifier:v38];
    }
    double totalTaskCount = self->_totalTaskCount;
    double finishedTaskCount = self->_finishedTaskCount;
    self->_double finishedTaskCount = finishedTaskCount + 1.0;
    (*((void (**)(double))self->_progressHandler + 2))((finishedTaskCount + 1.0) / totalTaskCount);
    unsigned int v15 = [v39 isEqualToString:@"filePath"];
    id resultsHandler = (void (**)(id, void *, void, id))self->_resultsHandler;
    if (v15)
    {
      uint64_t v17 = +[NSURL fileURLWithPath:v38];
      resultsHandler[2](resultsHandler, v17, 0, v10);
    }
    else
    {
      resultsHandler[2](self->_resultsHandler, v38, 0, v10);
    }
    int v32 = [v10 code];
  }
  else
  {
    os_log_type_t v18 = objc_msgSend(v36, "vcp_results");
    id v34 = [(MADComputeServiceProcessingTask *)self _prepareVideoAnalysisResults:v18];

    double v20 = self->_totalTaskCount;
    double v19 = self->_finishedTaskCount;
    self->_double finishedTaskCount = v19 + 1.0;
    (*((void (**)(double))self->_progressHandler + 2))((v19 + 1.0) / v20);
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      double v21 = VCPLogInstance();
      os_log_type_t v22 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v21, v22))
      {
        id v23 = [v34 count];
        *(_DWORD *)buf = 138412546;
        long long v46 = v35;
        __int16 v47 = 2048;
        id v48 = v23;
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "%@ Calling result handler with %lu results", buf, 0x16u);
      }
    }
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v24 = v34;
    id v25 = [v24 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v41;
      do
      {
        for (unint64_t i = 0; i != v25; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v41 != v26) {
            objc_enumerationMutation(v24);
          }
          uint64_t v28 = *(void *)(*((void *)&v40 + 1) + 8 * i);
          unsigned int v29 = [v39 isEqualToString:@"filePath"];
          os_log_type_t v30 = (void (**)(id, void *, uint64_t, void))self->_resultsHandler;
          if (v29)
          {
            os_log_type_t v31 = +[NSURL fileURLWithPath:v38];
            v30[2](v30, v31, v28, 0);
          }
          else
          {
            v30[2](self->_resultsHandler, v38, v28, 0);
          }
        }
        id v25 = [v24 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v25);
    }

    objc_storeStrong((id *)&self->_resumedAssetIdentifier, a6);
    int v32 = 0;
  }

  return v32;
}

- (id)_processVideoAsset:(id)a3 partialAnalysis:(id)a4 analysisTypes:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v58 = a4;
  uint64_t v11 = [v10 localIdentifier];
  os_log_type_t v59 = +[NSString stringWithFormat:@"[ProcessVideoAsset][%@]", v11];

  os_log_type_t v12 = [v10 photoLibrary];
  os_log_type_t v13 = +[VCPDatabaseReader databaseForPhotoLibrary:v12];

  unint64_t v14 = MediaAnalysisResultsTypesForAnalysisTypes();
  unsigned int v15 = [v10 localIdentifier];
  os_log_type_t v16 = [v13 queryAnalysisForAsset:v15 withTypes:v14];

  if (!v16) {
    goto LABEL_17;
  }
  if ((int)objc_msgSend(v16, "vcp_version") < 7)
  {

LABEL_17:
    id v24 = 0;
    goto LABEL_18;
  }
  uint64_t v17 = objc_msgSend(v16, "vcp_dateModified");
  os_log_type_t v18 = objc_msgSend(v10, "vcp_modificationDate");
  unsigned __int8 v19 = [v17 isEqualToDate:v18];

  if ((v19 & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      NSErrorUserInfoKey v27 = VCPLogInstance();
      os_log_type_t v28 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v27, v28))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v59;
        _os_log_impl((void *)&_mh_execute_header, v27, v28, "%@ Existing analysis based on old modification", buf, 0xCu);
      }
    }
    goto LABEL_17;
  }
  objc_msgSend(v16, "vcp_degraded");
  double v20 = +[PHAssetResource vcp_allAcceptableResourcesForAsset:v10];
  id v21 = [v10 mediaType];
  os_log_type_t v22 = (id *)VCPPhotoAnalyzer_ptr;
  if (v21 != (id)1) {
    os_log_type_t v22 = (id *)VCPMovieAnalyzer_ptr;
  }
  unsigned int v23 = [*v22 canAnalyzeUndegraded:v10 withResources:v20];
  id v24 = MediaAnalysisStripOutdatedAnalysis(v10, v16);

  if (([v24 vcp_degraded] & v23) == 1)
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      id v25 = VCPLogInstance();
      os_log_type_t v26 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v25, v26))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v59;
        _os_log_impl((void *)&_mh_execute_header, v25, v26, "%@ Existing analysis based on degraded asset", buf, 0xCu);
      }
LABEL_56:

      goto LABEL_57;
    }
    goto LABEL_57;
  }
  if ((a5 & ~(unint64_t)[v24 vcp_types]) != 0)
  {
    if (([v24 vcp_degraded] | v23))
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        id v50 = VCPLogInstance();
        os_log_type_t v51 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v50, v51))
        {
          MediaAnalysisTypeDescription((uint64_t)[v24 vcp_types]);
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v59;
          *(void *)&buf[14] = *(_WORD *)&buf[12] = 2112;
          id v56 = *(void **)&buf[14];
          _os_log_impl((void *)&_mh_execute_header, v50, v51, "%@ Existing analysis doesn't satisfy request (%@)", buf, 0x16u);
        }
      }
      a5 &= ~(unint64_t)[v24 vcp_types];
      if ((int)MediaAnalysisLogLevel() < 7) {
        goto LABEL_59;
      }
      NSErrorUserInfoKey v52 = VCPLogInstance();
      os_log_type_t v53 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v52, v53))
      {
        uint64_t v54 = MediaAnalysisTypeDescription(a5);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v59;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v54;
        id v57 = (void *)v54;
        _os_log_impl((void *)&_mh_execute_header, v52, v53, "%@ Request on-demand analysis types %@", buf, 0x16u);
      }
LABEL_58:

LABEL_59:
LABEL_18:
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v69 = sub_100098ED4;
      v70 = sub_100098EE4;
      id v71 = 0;
      if ([v10 isVideo])
      {
        unsigned int v29 = v61;
        v61[0] = _NSConcreteStackBlock;
        v61[1] = 3221225472;
        v61[2] = sub_100098EEC;
        v61[3] = &unk_10021C020;
        v61[6] = buf;
        id v30 = [objc_alloc((Class)VCPMovieAnalyzer) initWithPHAsset:v10 withPausedAnalysis:v58 forAnalysisTypes:a5];
        v61[4] = v30;
        v61[5] = self;
        os_log_type_t v31 = objc_retainBlock(v61);
        int v32 = +[VCPMADQoSManager sharedManager];
        [v32 runBlock:v31 withTaskID:1];

        id v33 = [v30 status];
      }
      else
      {
        id v34 = [objc_alloc((Class)VCPPhotoAnalyzer) initWithPHAsset:v10 withExistingAnalysis:v24 forAnalysisTypes:a5];
        [v34 setAllowStreaming:1];
        [v34 setOnDemand:1];
        unsigned int v29 = v60;
        v60[0] = _NSConcreteStackBlock;
        v60[1] = 3221225472;
        v60[2] = sub_100098FEC;
        v60[3] = &unk_10021C020;
        v60[6] = buf;
        id v30 = v34;
        v60[4] = v30;
        v60[5] = self;
        os_log_type_t v31 = objc_retainBlock(v60);
        id v35 = +[VCPMADQoSManager sharedManager];
        [v35 runBlock:v31 withTaskID:1];

        id v33 = [v30 status];
      }
      id v36 = v33;

      if (*(void *)(*(void *)&buf[8] + 40))
      {
        uint64_t v37 = MediaAnalysisMergeAnalysis();
        id v38 = *(void **)(*(void *)&buf[8] + 40);
        *(void *)(*(void *)&buf[8] + 40) = v37;
      }
      if (v36 == (id)4)
      {
        if (a6)
        {
          NSErrorUserInfoKey v64 = NSLocalizedDescriptionKey;
          long long v41 = +[NSString stringWithFormat:@"%@ Analysis canceled", v59];
          os_log_type_t v65 = v41;
          long long v42 = +[NSDictionary dictionaryWithObjects:&v65 forKeys:&v64 count:1];
          *a6 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v42];
        }
      }
      else
      {
        if (v36 != (id)2)
        {
          if (a6)
          {
            NSErrorUserInfoKey v62 = NSLocalizedDescriptionKey;
            Float64 v44 = +[NSString stringWithFormat:@"%@ Failed to analyze (status:%ld)", v59, v36];
            unsigned __int8 v63 = v44;
            __int16 v45 = +[NSDictionary dictionaryWithObjects:&v63 forKeys:&v62 count:1];
            *a6 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v45];
          }
          long long v43 = 0;
          goto LABEL_35;
        }
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          id v39 = VCPLogInstance();
          os_log_type_t v40 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v39, v40))
          {
            *(_DWORD *)id v66 = 138412290;
            v67 = v59;
            _os_log_impl((void *)&_mh_execute_header, v39, v40, "%@ Analysis finished", v66, 0xCu);
          }
        }
      }
      long long v43 = *(id *)(*(void *)&buf[8] + 40);
LABEL_35:
      _Block_object_dispose(buf, 8);

      goto LABEL_36;
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      id v25 = VCPLogInstance();
      os_log_type_t v55 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v25, v55))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v59;
        _os_log_impl((void *)&_mh_execute_header, v25, v55, "%@ Existing analysis doesn't match asset state", buf, 0xCu);
      }
      goto LABEL_56;
    }
LABEL_57:
    NSErrorUserInfoKey v52 = v24;
    id v24 = 0;
    goto LABEL_58;
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    __int16 v47 = VCPLogInstance();
    os_log_type_t v48 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v47, v48))
    {
      long long v49 = MediaAnalysisTypeDescription((uint64_t)[v24 vcp_types]);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v59;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v49;
      _os_log_impl((void *)&_mh_execute_header, v47, v48, "%@ Existing analysis satisfies request (%@)", buf, 0x16u);
    }
  }
  id v24 = v24;

  long long v43 = v24;
LABEL_36:

  return v43;
}

- (int)_resumePausedVideoAnalysis
{
  uint64_t v3 = [(MADComputeServiceProcessingTask *)self _partialAnalysisURL];
  if ([(NSURL *)self->_resultDirectoryURL startAccessingSecurityScopedResource])
  {
    id v4 = +[NSDictionary dictionaryWithContentsOfURL:v3];
    uint64_t v5 = +[NSFileManager defaultManager];
    [v5 removeItemAtURL:v3 error:0];

    [(NSURL *)self->_resultDirectoryURL stopAccessingSecurityScopedResource];
    if (v4)
    {
      uint64_t v6 = [v4 objectForKeyedSubscript:@"analysis"];
      if (v6)
      {
        uint64_t v7 = [v4 objectForKeyedSubscript:@"identifierType"];
        NSErrorUserInfoKey v62 = [v4 objectForKeyedSubscript:@"assetIdentifier"];
        if (([v7 isEqualToString:@"filePath"] & 1) == 0
          && ([v7 isEqualToString:@"localIdentifier"] & 1) == 0)
        {
          id v8 = @"[ResumePausedVideoAnalysis]";
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            id v39 = VCPLogInstance();
            os_log_type_t v40 = VCPLogToOSLogType[3];
            if (os_log_type_enabled(v39, v40))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = @"[ResumePausedVideoAnalysis]";
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v7;
              _os_log_impl((void *)&_mh_execute_header, v39, v40, "%@ Unsupported asset identifier type %@", buf, 0x16u);
            }
          }
          goto LABEL_67;
        }
        id v8 = +[NSString stringWithFormat:@"[ResumePausedVideoAnalysis][%@]", v62];
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          id v9 = VCPLogInstance();
          os_log_type_t v10 = VCPLogToOSLogType[5];
          if (os_log_type_enabled(v9, v10))
          {
            requestID = self->_requestID;
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v8;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = requestID;
            _os_log_impl((void *)&_mh_execute_header, v9, v10, "%@ Loaded partial analysis for request %@ ", buf, 0x16u);
          }
        }
        memset(&v77, 0, sizeof(v77));
        [v6 vcp_syncPoint];
        if (!((unsigned __int128)0 >> 96))
        {
          if ((int)MediaAnalysisLogLevel() < 4)
          {
LABEL_67:
            int v20 = -50;
LABEL_78:

LABEL_79:
            goto LABEL_80;
          }
          os_log_type_t v12 = VCPLogInstance();
          os_log_type_t v13 = VCPLogToOSLogType[4];
          if (!os_log_type_enabled(v12, v13))
          {
LABEL_15:

            goto LABEL_67;
          }
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v8;
          unint64_t v14 = "%@ Invalid sync point in paused analysis";
          unsigned int v15 = v12;
          os_log_type_t v16 = v13;
          uint32_t v17 = 12;
LABEL_14:
          _os_log_impl((void *)&_mh_execute_header, v15, v16, v14, buf, v17);
          goto LABEL_15;
        }
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          unsigned int v23 = VCPLogInstance();
          os_log_type_t v24 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v23, v24))
          {
            CMTime time = v77;
            Float64 Seconds = CMTimeGetSeconds(&time);
            *(_DWORD *)buf = 138413058;
            *(void *)&uint8_t buf[4] = v8;
            *(_WORD *)&buf[12] = 2048;
            *(Float64 *)&buf[14] = Seconds;
            *(_WORD *)&buf[22] = 2048;
            CMTimeValue value = v77.value;
            LOWORD(v84) = 1024;
            *(_DWORD *)((char *)&v84 + 2) = v77.timescale;
            _os_log_impl((void *)&_mh_execute_header, v23, v24, "%@ Resume from sync point: %0.3fs (value: %lld, timescale: %d)", buf, 0x26u);
          }
        }
        unint64_t v26 = [(MADComputeServiceProcessingTask *)self _videoAnalysisTypes];
        if ([v7 isEqualToString:@"filePath"])
        {
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            NSErrorUserInfoKey v27 = VCPLogInstance();
            os_log_type_t v28 = VCPLogToOSLogType[6];
            if (os_log_type_enabled(v27, v28))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v8;
              _os_log_impl((void *)&_mh_execute_header, v27, v28, "%@ Resume processing with URL ...", buf, 0xCu);
            }
          }
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          CMTimeValue value = (CMTimeValue)sub_100098ED4;
          id v84 = sub_100098EE4;
          id v85 = 0;
          uint64_t v70 = 0;
          id v71 = &v70;
          uint64_t v72 = 0x3032000000;
          BOOL v73 = sub_100098ED4;
          v74 = sub_100098EE4;
          id v75 = 0;
          dispatch_semaphore_t v29 = dispatch_semaphore_create(0);
          v65[0] = _NSConcreteStackBlock;
          v65[1] = 3221225472;
          v65[2] = sub_100099EFC;
          v65[3] = &unk_10021C348;
          uint64_t v54 = v8;
          id v66 = v54;
          id v68 = &v70;
          v69 = buf;
          dispatch_semaphore_t dsema = v29;
          dispatch_semaphore_t v67 = dsema;
          uint64_t v60 = objc_retainBlock(v65);
          id v58 = +[NSURL fileURLWithPath:v62];
          v81 = v58;
          id v30 = +[NSArray arrayWithObjects:&v81 count:1];
          os_log_type_t v31 = +[VCPFullAnalysisURLProcessingTask taskForURLAsset:v30 withOptions:0 analysisTypes:v26 progressHandler:0 completionHandler:v60];

          [v31 setPartialAnalysis:v6];
          v64[0] = _NSConcreteStackBlock;
          v64[1] = 3221225472;
          v64[2] = sub_10009A0D0;
          v64[3] = &unk_100219D98;
          v64[4] = self;
          [v31 runWithCancelBlock:v64];
          dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
          if ([(id)v71[5] code] == (id)-128)
          {
            uint64_t v32 = [v31 partialAnalysis];
            id v33 = *(void **)(*(void *)&buf[8] + 40);
            *(void *)(*(void *)&buf[8] + 40) = v32;
          }
          uint64_t v34 = *(void *)(*(void *)&buf[8] + 40);
          uint64_t v35 = v71[5];
          id v36 = [v58 path];
          LOBYTE(v34) = [(MADComputeServiceProcessingTask *)self _processVideoAnalysis:v34 analysisError:v35 assetIdentifierType:@"filePath" assetIdentifier:v36] == 0;

          if (v34)
          {
            int v20 = 0;
          }
          else
          {
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              uint64_t v37 = VCPLogInstance();
              os_log_type_t v38 = VCPLogToOSLogType[3];
              if (os_log_type_enabled(v37, v38))
              {
                *(_DWORD *)v79 = 138412290;
                id v80 = v54;
                _os_log_impl((void *)&_mh_execute_header, v37, v38, "%@ Failed to analyze with partial analysis", v79, 0xCu);
              }
            }
            int v20 = -18;
          }

          _Block_object_dispose(&v70, 8);
          _Block_object_dispose(buf, 8);

          goto LABEL_78;
        }
        if (![v7 isEqualToString:@"localIdentifier"])
        {
          if ((int)MediaAnalysisLogLevel() < 3) {
            goto LABEL_67;
          }
          os_log_type_t v12 = VCPLogInstance();
          os_log_type_t v51 = VCPLogToOSLogType[3];
          if (!os_log_type_enabled(v12, v51)) {
            goto LABEL_15;
          }
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v8;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v7;
          unint64_t v14 = "%@ Unsupported asset identifier type %@; skip resuming";
          unsigned int v15 = v12;
          os_log_type_t v16 = v51;
          uint32_t v17 = 22;
          goto LABEL_14;
        }
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          long long v41 = VCPLogInstance();
          os_log_type_t v42 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v41, v42))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v8;
            _os_log_impl((void *)&_mh_execute_header, v41, v42, "%@ Resume processing with localIdentifier ...", buf, 0xCu);
          }
        }
        long long v43 = +[VCPPhotoLibraryManager sharedManager];
        v61 = [v43 photoLibraryWithURL:self->_photoLibraryURL];

        os_log_type_t v59 = +[PHAsset vcp_fetchOptionsForLibrary:v61 forTaskID:1];
        v78 = v62;
        Float64 v44 = +[NSArray arrayWithObjects:&v78 count:1];
        __int16 v45 = +[PHAsset fetchAssetsWithLocalIdentifiers:v44 options:v59];
        long long v46 = [v45 firstObject];

        if (v46)
        {
          id v63 = 0;
          __int16 v47 = [(MADComputeServiceProcessingTask *)self _processVideoAsset:v46 partialAnalysis:v6 analysisTypes:v26 error:&v63];
          os_log_type_t v48 = v63;
          if ([(MADComputeServiceProcessingTask *)self _processVideoAnalysis:v47 analysisError:v48 assetIdentifierType:@"localIdentifier" assetIdentifier:v62])
          {
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              long long v49 = VCPLogInstance();
              os_log_type_t v50 = VCPLogToOSLogType[3];
              if (os_log_type_enabled(v49, v50))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v8;
                _os_log_impl((void *)&_mh_execute_header, v49, v50, "%@ Failed to analyze with partial analysis", buf, 0xCu);
              }
            }
            int v20 = -18;
          }
          else
          {
            int v20 = 0;
          }
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() < 3)
          {
            int v20 = -18;
            goto LABEL_77;
          }
          os_log_type_t v48 = VCPLogInstance();
          os_log_type_t v52 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v48, v52))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v8;
            _os_log_impl((void *)&_mh_execute_header, v48, v52, "%@ Failed to fetch asset", buf, 0xCu);
          }
          int v20 = -18;
        }

LABEL_77:
        goto LABEL_78;
      }
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        uint64_t v7 = VCPLogInstance();
        os_log_type_t v22 = VCPLogToOSLogType[7];
        id v8 = @"[ResumePausedVideoAnalysis]";
        if (os_log_type_enabled(v7, v22))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = @"[ResumePausedVideoAnalysis]";
          _os_log_impl((void *)&_mh_execute_header, v7, v22, "%@ Invalid partial analysis", buf, 0xCu);
        }
        int v20 = -19;
        goto LABEL_79;
      }
      int v20 = -19;
      id v8 = @"[ResumePausedVideoAnalysis]";
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 6)
      {
        int v20 = 0;
        id v8 = @"[ResumePausedVideoAnalysis]";
LABEL_81:

        goto LABEL_82;
      }
      uint64_t v6 = VCPLogInstance();
      os_log_type_t v21 = VCPLogToOSLogType[6];
      id v8 = @"[ResumePausedVideoAnalysis]";
      if (os_log_type_enabled(v6, v21))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = @"[ResumePausedVideoAnalysis]";
        _os_log_impl((void *)&_mh_execute_header, v6, v21, "%@ No partial analysis to resume", buf, 0xCu);
      }
      int v20 = 0;
    }
LABEL_80:

    goto LABEL_81;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v4 = VCPLogInstance();
    os_log_type_t v18 = VCPLogToOSLogType[3];
    id v8 = @"[ResumePausedVideoAnalysis]";
    if (os_log_type_enabled(v4, v18))
    {
      resultDirectoryURL = self->_resultDirectoryURL;
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = @"[ResumePausedVideoAnalysis]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = resultDirectoryURL;
      _os_log_impl((void *)&_mh_execute_header, v4, v18, "%@ Failed to start security scoped resource %@", buf, 0x16u);
    }
    int v20 = 0;
    goto LABEL_81;
  }
  int v20 = 0;
  id v8 = @"[ResumePausedVideoAnalysis]";
LABEL_82:

  return v20;
}

- (void)_processVideoAssetURLs
{
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v2 = VCPLogInstance();
    os_log_type_t v3 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v2, v3))
    {
      NSUInteger v4 = [(NSArray *)self->_assetURLs count];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = @"[ProcessVideoAssetURL]";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v4;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "%@ Processing %lu assetURLs ... ", buf, 0x16u);
    }
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = self->_assetURLs;
  id v33 = [(NSArray *)obj countByEnumeratingWithState:&v47 objects:v60 count:16];
  if (v33)
  {
    uint64_t v32 = *(void *)v48;
    os_log_type_t type = VCPLogToOSLogType[6];
    os_log_type_t v29 = VCPLogToOSLogType[3];
    *(void *)&long long v5 = 138412290;
    long long v28 = v5;
    do
    {
      for (unint64_t i = 0; i != v33; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v48 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        id v9 = [v7 path];
        unsigned int v10 = [v9 isEqualToString:self->_resumedAssetIdentifier];

        if (!v10)
        {
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          id v57 = sub_100098ED4;
          id v58 = sub_100098EE4;
          id v59 = 0;
          uint64_t v41 = 0;
          os_log_type_t v42 = &v41;
          uint64_t v43 = 0x3032000000;
          Float64 v44 = sub_100098ED4;
          __int16 v45 = sub_100098EE4;
          id v46 = 0;
          dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
          v36[0] = _NSConcreteStackBlock;
          v36[1] = 3221225472;
          v36[2] = sub_10009A7F4;
          v36[3] = &unk_10021C348;
          uint64_t v37 = @"[ProcessVideoAssetURL]";
          id v39 = &v41;
          os_log_type_t v40 = buf;
          os_log_type_t v13 = v12;
          os_log_type_t v38 = v13;
          unint64_t v14 = objc_retainBlock(v36);
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            unsigned int v15 = VCPLogInstance();
            if (os_log_type_enabled(v15, type))
            {
              *(_DWORD *)os_log_type_t v52 = 138412546;
              CFStringRef v53 = @"[ProcessVideoAssetURL]";
              __int16 v54 = 2112;
              os_log_type_t v55 = v7;
              _os_log_impl((void *)&_mh_execute_header, v15, type, "%@[%@] Start processing ...", v52, 0x16u);
            }
          }
          os_log_type_t v51 = v7;
          os_log_type_t v16 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v51, 1, v28);
          uint32_t v17 = +[VCPFullAnalysisURLProcessingTask taskForURLAsset:v16 withOptions:0 analysisTypes:[(MADComputeServiceProcessingTask *)self _videoAnalysisTypes] progressHandler:0 completionHandler:v14];

          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472;
          v35[2] = sub_10009A9C8;
          v35[3] = &unk_100219D98;
          v35[4] = self;
          os_log_type_t v18 = objc_retainBlock(v35);
          [v17 runWithCancelBlock:v18];
          dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
          if ([(id)v42[5] code] == (id)-128)
          {
            uint64_t v19 = [v17 partialAnalysis];
            int v20 = *(void **)(*(void *)&buf[8] + 40);
            *(void *)(*(void *)&buf[8] + 40) = v19;
          }
          uint64_t v21 = *(void *)(*(void *)&buf[8] + 40);
          uint64_t v22 = v42[5];
          unsigned int v23 = [v7 path];
          LODWORD(v22) = [(MADComputeServiceProcessingTask *)self _processVideoAnalysis:v21 analysisError:v22 assetIdentifierType:@"filePath" assetIdentifier:v23] == 0;

          if (v22)
          {
            if ((int)MediaAnalysisLogLevel() >= 6)
            {
              os_log_type_t v24 = VCPLogInstance();
              if (os_log_type_enabled(v24, type))
              {
                *(_DWORD *)os_log_type_t v52 = 138412546;
                CFStringRef v53 = @"[ProcessVideoAssetURL]";
                __int16 v54 = 2112;
                os_log_type_t v55 = v7;
                id v25 = v24;
                os_log_type_t v26 = type;
                NSErrorUserInfoKey v27 = "%@[%@] Processed analysis";
LABEL_28:
                _os_log_impl((void *)&_mh_execute_header, v25, v26, v27, v52, 0x16u);
              }
LABEL_29:
            }
          }
          else if ((int)MediaAnalysisLogLevel() >= 3)
          {
            os_log_type_t v24 = VCPLogInstance();
            if (os_log_type_enabled(v24, v29))
            {
              *(_DWORD *)os_log_type_t v52 = 138412546;
              CFStringRef v53 = @"[ProcessVideoAssetURL]";
              __int16 v54 = 2112;
              os_log_type_t v55 = v7;
              id v25 = v24;
              os_log_type_t v26 = v29;
              NSErrorUserInfoKey v27 = "%@[%@] Failed to process analysis";
              goto LABEL_28;
            }
            goto LABEL_29;
          }

          _Block_object_dispose(&v41, 8);
          _Block_object_dispose(buf, 8);

          goto LABEL_31;
        }
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          uint64_t v11 = VCPLogInstance();
          if (os_log_type_enabled(v11, type))
          {
            *(_DWORD *)buf = v28;
            *(void *)&uint8_t buf[4] = @"[ProcessVideoAssetURL]";
            _os_log_impl((void *)&_mh_execute_header, v11, type, "%@ Resume processed; skip re-process", buf, 0xCu);
          }
        }
LABEL_31:
      }
      id v33 = [(NSArray *)obj countByEnumeratingWithState:&v47 objects:v60 count:16];
    }
    while (v33);
  }
}

- (void)_processVideoLocalIdentifiers
{
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    os_log_type_t v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v3, v4))
    {
      NSUInteger v5 = [(NSArray *)self->_localIdentifiers count];
      *(_DWORD *)buf = 138412546;
      CFStringRef v30 = @"[ProcessVideoAsset]";
      __int16 v31 = 2048;
      NSUInteger v32 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "%@ Processing %lu localIdentifiers ... ", buf, 0x16u);
    }
  }
  os_log_type_t v26 = +[NSMutableArray arrayWithArray:self->_localIdentifiers];
  if ([v26 containsObject:self->_resumedAssetIdentifier])
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      uint64_t v6 = VCPLogInstance();
      os_log_type_t v7 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v6, v7))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v30 = @"[ProcessVideoAsset]";
        _os_log_impl((void *)&_mh_execute_header, v6, v7, "%@ Resume processed; skip re-process", buf, 0xCu);
      }
    }
    [v26 removeObject:self->_resumedAssetIdentifier];
  }
  id v8 = +[VCPPhotoLibraryManager sharedManager];
  id v25 = [v8 photoLibraryWithURL:self->_photoLibraryURL];

  os_log_type_t v24 = +[PHAsset vcp_fetchOptionsForLibrary:v25 forTaskID:1];
  id v9 = +[PHAsset fetchAssetsWithLocalIdentifiers:options:](PHAsset, "fetchAssetsWithLocalIdentifiers:options:", v26);
  unint64_t v10 = 0;
  os_log_type_t v11 = VCPLogToOSLogType[6];
  os_log_type_t type = VCPLogToOSLogType[3];
  while (v10 < (unint64_t)[v9 count])
  {
    os_log_type_t v13 = [v9 objectAtIndexedSubscript:v10];
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      unint64_t v14 = VCPLogInstance();
      if (os_log_type_enabled(v14, v11))
      {
        unsigned int v15 = [v13 localIdentifier];
        *(_DWORD *)buf = 138412546;
        CFStringRef v30 = @"[ProcessVideoAsset]";
        __int16 v31 = 2112;
        NSUInteger v32 = (NSUInteger)v15;
        _os_log_impl((void *)&_mh_execute_header, v14, v11, "%@[%@] Start processing ...", buf, 0x16u);
      }
    }
    unint64_t v16 = [(MADComputeServiceProcessingTask *)self _videoAnalysisTypes];
    id v28 = 0;
    uint32_t v17 = [(MADComputeServiceProcessingTask *)self _processVideoAsset:v13 partialAnalysis:0 analysisTypes:v16 error:&v28];
    id v18 = v28;
    uint64_t v19 = [v13 localIdentifier];
    BOOL v20 = [(MADComputeServiceProcessingTask *)self _processVideoAnalysis:v17 analysisError:v18 assetIdentifierType:@"localIdentifier" assetIdentifier:v19] == 0;

    if (v20)
    {
      if ((int)MediaAnalysisLogLevel() < 6) {
        goto LABEL_25;
      }
      uint64_t v21 = VCPLogInstance();
      if (os_log_type_enabled(v21, v11))
      {
        unsigned int v23 = [v13 localIdentifier];
        *(_DWORD *)buf = 138412546;
        CFStringRef v30 = @"[ProcessVideoAsset]";
        __int16 v31 = 2112;
        NSUInteger v32 = (NSUInteger)v23;
        _os_log_impl((void *)&_mh_execute_header, v21, v11, "%@[%@] Processed analysis", buf, 0x16u);
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_25;
      }
      uint64_t v21 = VCPLogInstance();
      if (os_log_type_enabled(v21, type))
      {
        uint64_t v22 = [v13 localIdentifier];
        *(_DWORD *)buf = 138412546;
        CFStringRef v30 = @"[ProcessVideoAsset]";
        __int16 v31 = 2112;
        NSUInteger v32 = (NSUInteger)v22;
        _os_log_impl((void *)&_mh_execute_header, v21, type, "%@[%@] Failed to process analysis", buf, 0x16u);
      }
    }

LABEL_25:
    ++v10;
  }
}

- (void)_processVideoRequests
{
  [(MADComputeServiceProcessingTask *)self _resumePausedVideoAnalysis];
  NSUInteger v4 = [(NSArray *)self->_localIdentifiers count];
  if (v4) {
    [(MADComputeServiceProcessingTask *)self _processVideoLocalIdentifiers];
  }
  else {
    [(MADComputeServiceProcessingTask *)self _processVideoAssetURLs];
  }
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    uint64_t v6 = VCPLogInstance();
    os_log_type_t v7 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v6, v7))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Finished processing video requests", v8, 2u);
    }
  }
}

- (int)run
{
  atomic_store(1u, (unsigned __int8 *)&self->_started);
  double v102 = +[NSString stringWithFormat:@"[MADComputeServiceProcessingTask]"];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    os_log_type_t v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v3, v4))
    {
      *(_DWORD *)buf = 138412290;
      v119 = v102;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "%@ Consuming secure scoped resource ... ", buf, 0xCu);
    }
  }
  unint64_t v5 = 0;
  os_log_type_t v6 = VCPLogToOSLogType[7];
  while (v5 < [(NSArray *)self->_assetURLs count])
  {
    os_log_type_t v7 = [(NSArray *)self->_assetURLs objectAtIndexedSubscript:v5];
    unsigned int v8 = [v7 startAccessingSecurityScopedResource];

    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      id v9 = VCPLogInstance();
      if (os_log_type_enabled(v9, v6))
      {
        uint64_t v10 = [(NSArray *)self->_assetURLs objectAtIndexedSubscript:v5];
        os_log_type_t v11 = (void *)v10;
        *(_DWORD *)buf = 138412802;
        CFStringRef v12 = @"failed";
        if (v8) {
          CFStringRef v12 = @"success";
        }
        v119 = v102;
        __int16 v120 = 2112;
        uint64_t v121 = v10;
        __int16 v122 = 2112;
        CFStringRef v123 = v12;
        _os_log_impl((void *)&_mh_execute_header, v9, v6, "%@ Consuming secure scoped URL %@ : %@", buf, 0x20u);
      }
    }
    ++v5;
  }
  double v103 = +[NSMutableArray array];
  unint64_t v13 = 0;
  os_log_type_t v100 = VCPLogToOSLogType[6];
  os_log_type_t v99 = VCPLogToOSLogType[3];
  os_log_type_t type = VCPLogToOSLogType[5];
  while (v13 < [(NSArray *)self->_requests count])
  {
    unsigned int v15 = [(MADComputeServiceProcessingTask *)self isCancelled];
    char v16 = v15;
    if (!v15)
    {
      uint32_t v17 = [(NSArray *)self->_requests objectAtIndexedSubscript:v13];
      id v18 = +[NSString stringWithFormat:@"[MADComputeServiceProcessingTask][%@]", objc_opt_class()];
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        uint64_t v19 = VCPLogInstance();
        if (os_log_type_enabled(v19, v100))
        {
          *(_DWORD *)buf = 138412546;
          v119 = v18;
          __int16 v120 = 2112;
          uint64_t v121 = (uint64_t)v17;
          _os_log_impl((void *)&_mh_execute_header, v19, v100, "%@ Adding request ... %@ ", buf, 0x16u);
        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        [(NSMutableArray *)self->_videoProcessingRequests addObject:v17];
LABEL_32:

LABEL_33:
        goto LABEL_34;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v20 = [(MADComputeServiceProcessingTask *)self _prepareSceneAssetProcessingTask];
        v98 = v20;
        if (v20) {
          goto LABEL_38;
        }
        if ([(NSArray *)self->_localIdentifiers count])
        {
          NSErrorUserInfoKey v116 = NSLocalizedDescriptionKey;
          double v91 = +[NSString stringWithFormat:@"%@ Failed to issue request", v18];
          v117 = v91;
          uint64_t v21 = +[NSDictionary dictionaryWithObjects:&v117 forKeys:&v116 count:1];
          v95 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v21];

          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            uint64_t v22 = VCPLogInstance();
            if (os_log_type_enabled(v22, v99))
            {
              *(_DWORD *)buf = 138412290;
              v119 = v95;
              _os_log_impl((void *)&_mh_execute_header, v22, v99, "%@", buf, 0xCu);
            }
          }
          goto LABEL_49;
        }
LABEL_99:

        goto LABEL_32;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v20 = [(MADComputeServiceProcessingTask *)self _prepareFaceAssetProcessingTask];
        v98 = v20;
        if (v20)
        {
LABEL_38:
          [v103 addObject:v20];
          goto LABEL_99;
        }
        if (![(NSArray *)self->_localIdentifiers count]) {
          goto LABEL_99;
        }
        NSErrorUserInfoKey v114 = NSLocalizedDescriptionKey;
        uint64_t v93 = +[NSString stringWithFormat:@"%@ Failed to issue request", v18];
        double v115 = v93;
        os_log_type_t v40 = +[NSDictionary dictionaryWithObjects:&v115 forKeys:&v114 count:1];
        v95 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v40];

        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          uint64_t v41 = VCPLogInstance();
          if (os_log_type_enabled(v41, v99))
          {
            *(_DWORD *)buf = 138412290;
            v119 = v95;
            _os_log_impl((void *)&_mh_execute_header, v41, v99, "%@", buf, 0xCu);
          }
        }
LABEL_49:
        unint64_t v23 = [(NSArray *)self->_localIdentifiers count];
        double totalTaskCount = self->_totalTaskCount;
        double v25 = self->_finishedTaskCount + (double)v23;
        self->_double finishedTaskCount = v25;
        (*((void (**)(double))self->_progressHandler + 2))(v25 / totalTaskCount);
        (*((void (**)(void))self->_resultsHandler + 2))();
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v98 = [v17 visionRequest];
          -[MADComputeServiceProcessingTask _processVisionRequest:](self, "_processVisionRequest:");
          goto LABEL_99;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          NSErrorUserInfoKey v110 = NSLocalizedDescriptionKey;
          v97 = +[NSString stringWithFormat:@"%@ Unsupported request %@", v18, v17];
          CFStringRef v111 = v97;
          os_log_type_t v42 = +[NSDictionary dictionaryWithObjects:&v111 forKeys:&v110 count:1];
          v98 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-4 userInfo:v42];

          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            uint64_t v43 = VCPLogInstance();
            if (os_log_type_enabled(v43, v99))
            {
              *(_DWORD *)buf = 138412290;
              v119 = v98;
              _os_log_impl((void *)&_mh_execute_header, v43, v99, "%@", buf, 0xCu);
            }
          }
          unint64_t v44 = [(NSArray *)self->_localIdentifiers count];
          double v45 = self->_totalTaskCount;
          double v46 = self->_finishedTaskCount + (double)v44;
          self->_double finishedTaskCount = v46;
          (*((void (**)(double))self->_progressHandler + 2))(v46 / v45);
          (*((void (**)(void))self->_resultsHandler + 2))();
          goto LABEL_99;
        }
        v98 = v17;
        [v98 consumeSandboxExtension];
        os_log_type_t v26 = [v98 modelURL];
        unsigned int v27 = [v26 startAccessingSecurityScopedResource];

        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          id v28 = VCPLogInstance();
          if (os_log_type_enabled(v28, v6))
          {
            uint64_t v29 = [v98 modelURL];
            *(_DWORD *)buf = 138412802;
            CFStringRef v30 = @"failed";
            if (v27) {
              CFStringRef v30 = @"success";
            }
            v119 = v18;
            __int16 v120 = 2112;
            uint64_t v121 = v29;
            __int16 v122 = 2112;
            CFStringRef v123 = v30;
            __int16 v31 = (void *)v29;
            _os_log_impl((void *)&_mh_execute_header, v28, v6, "%@ Consuming secure scoped model URL %@ : %@", buf, 0x20u);
          }
        }
        os_log_type_t v96 = [v98 modelURL];
        NSUInteger v32 = [v96 lastPathComponent];
        unsigned int v33 = [v32 isEqualToString:@".mlmodel"];

        if (v33)
        {
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            uint64_t v34 = VCPLogInstance();
            if (os_log_type_enabled(v34, v6))
            {
              uint64_t v35 = [v98 modelURL];
              *(_DWORD *)buf = 138412546;
              v119 = v18;
              __int16 v120 = 2112;
              uint64_t v121 = (uint64_t)v35;
              _os_log_impl((void *)&_mh_execute_header, v34, v6, "%@ Compiling compiledModelURL at %@", buf, 0x16u);
            }
          }
          id v36 = [v98 modelURL];
          id v107 = 0;
          double v92 = +[MLModel compileModelAtURL:v36 error:&v107];
          id v37 = v107;

          os_log_type_t v38 = v37;
          id v106 = v37;
          v95 = +[MLModel modelWithContentsOfURL:v92 error:&v106];
          id v39 = (__CFString *)v106;
        }
        else
        {
          uint64_t v47 = [v98 modelURL];
          id v105 = 0;
          double v92 = (void *)v47;
          v95 = +[MLModel modelWithContentsOfURL:v47 error:&v105];
          id v39 = (__CFString *)v105;
        }

        if (v39)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            long long v48 = VCPLogInstance();
            if (os_log_type_enabled(v48, v99))
            {
              *(_DWORD *)buf = 138412802;
              v119 = v18;
              __int16 v120 = 2112;
              uint64_t v121 = (uint64_t)v95;
              __int16 v122 = 2112;
              CFStringRef v123 = v39;
              _os_log_impl((void *)&_mh_execute_header, v48, v99, "%@ Failed to read CoreML model file: %@ - %@", buf, 0x20u);
            }
          }
          unint64_t v49 = [(NSArray *)self->_localIdentifiers count];
          double v50 = self->_totalTaskCount;
          double v51 = self->_finishedTaskCount + (double)v49;
          self->_double finishedTaskCount = v51;
          (*((void (**)(double))self->_progressHandler + 2))(v51 / v50);
          (*((void (**)(void))self->_resultsHandler + 2))();
        }
        id v104 = v39;
        v90 = +[VNCoreMLModel modelForMLModel:v95 error:&v104];
        v94 = v104;

        if (v94)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            os_log_type_t v52 = VCPLogInstance();
            if (os_log_type_enabled(v52, v99))
            {
              *(_DWORD *)buf = 138412802;
              v119 = v18;
              __int16 v120 = 2112;
              uint64_t v121 = (uint64_t)v95;
              __int16 v122 = 2112;
              CFStringRef v123 = v94;
              _os_log_impl((void *)&_mh_execute_header, v52, v99, "%@ Failed to load CoreML model: %@ - %@", buf, 0x20u);
            }
          }
          unint64_t v53 = [(NSArray *)self->_localIdentifiers count];
          double v54 = self->_totalTaskCount;
          double v55 = self->_finishedTaskCount + (double)v53;
          self->_double finishedTaskCount = v55;
          (*((void (**)(double))self->_progressHandler + 2))(v55 / v54);
          (*((void (**)(void))self->_resultsHandler + 2))();
        }
        id v56 = [objc_alloc((Class)VNCoreMLRequest) initWithModel:v90];
        v89 = v56;
        if (!v56)
        {
          NSErrorUserInfoKey v112 = NSLocalizedDescriptionKey;
          char v87 = [v98 modelURL];
          id v57 = +[NSString stringWithFormat:@"%@ Failed to create VNRequest with CoreML model %@ - %@", v18, v90, v87];
          v113 = v57;
          id v58 = +[NSDictionary dictionaryWithObjects:&v113 forKeys:&v112 count:1];
          uint64_t v88 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v58];

          id v59 = (void *)v88;
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            uint64_t v60 = VCPLogInstance();
            if (os_log_type_enabled(v60, v99))
            {
              *(_DWORD *)buf = 138412290;
              v119 = v88;
              _os_log_impl((void *)&_mh_execute_header, v60, v99, "%@", buf, 0xCu);
            }

            id v59 = (void *)v88;
          }
          unint64_t v61 = [(NSArray *)self->_localIdentifiers count];
          double v62 = self->_totalTaskCount;
          double v63 = self->_finishedTaskCount + (double)v61;
          self->_double finishedTaskCount = v63;
          (*((void (**)(double))self->_progressHandler + 2))(v63 / v62);
          (*((void (**)(void))self->_resultsHandler + 2))();

          id v56 = 0;
        }
        [(MADComputeServiceProcessingTask *)self _processVisionRequest:v56];
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          NSErrorUserInfoKey v64 = VCPLogInstance();
          if (os_log_type_enabled(v64, v6))
          {
            os_log_type_t v65 = [v98 modelURL];
            *(_DWORD *)buf = 138412546;
            v119 = v18;
            __int16 v120 = 2112;
            uint64_t v121 = (uint64_t)v65;
            _os_log_impl((void *)&_mh_execute_header, v64, v6, "%@ Releasing secure scoped model URL %@", buf, 0x16u);
          }
        }
        id v66 = [v98 modelURL];
        [v66 stopAccessingSecurityScopedResource];
      }
      goto LABEL_99;
    }
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      uint32_t v17 = VCPLogInstance();
      if (os_log_type_enabled(v17, type))
      {
        *(_DWORD *)buf = 138412290;
        v119 = v102;
        _os_log_impl((void *)&_mh_execute_header, v17, type, "%@ Request is canceled during preparing; quitting ...",
          buf,
          0xCu);
      }
      goto LABEL_33;
    }
LABEL_34:
    ++v13;
    if (v16) {
      break;
    }
  }
  unint64_t v67 = 0;
  while (v67 < (unint64_t)[v103 count])
  {
    unsigned int v69 = [(MADComputeServiceProcessingTask *)self isCancelled];
    char v70 = v69;
    if (!v69)
    {
      id v71 = [v103 objectAtIndexedSubscript:v67];
      uint64_t v72 = +[NSString stringWithFormat:@"[MADComputeServiceProcessingTask][%@][Run]", objc_opt_class()];
      unsigned int v73 = [v71 run];
      if (v73 && (int)MediaAnalysisLogLevel() >= 3)
      {
        v74 = VCPLogInstance();
        if (os_log_type_enabled(v74, v99))
        {
          *(_DWORD *)buf = 138412546;
          v119 = v72;
          __int16 v120 = 1024;
          LODWORD(v121) = v73;
          _os_log_impl((void *)&_mh_execute_header, v74, v99, "%@ Failed to process assets (%d)", buf, 0x12u);
        }
      }
      goto LABEL_112;
    }
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      id v71 = VCPLogInstance();
      if (os_log_type_enabled(v71, type))
      {
        *(_DWORD *)buf = 138412290;
        v119 = v102;
        _os_log_impl((void *)&_mh_execute_header, v71, type, "%@ Request is canceled during executing; quitting ...",
          buf,
          0xCu);
      }
LABEL_112:
    }
    ++v67;
    if (v70) {
      break;
    }
  }
  if ([(NSMutableArray *)self->_videoProcessingRequests count])
  {
    if ([(MADComputeServiceProcessingTask *)self isCancelled])
    {
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        id v75 = VCPLogInstance();
        if (os_log_type_enabled(v75, type))
        {
          *(_DWORD *)buf = 138412290;
          v119 = v102;
          _os_log_impl((void *)&_mh_execute_header, v75, type, "%@ Request is canceled before video processing; quitting ...",
            buf,
            0xCu);
        }
      }
    }
    else
    {
      [(MADComputeServiceProcessingTask *)self _processVideoRequests];
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    double v76 = VCPLogInstance();
    if (os_log_type_enabled(v76, v100))
    {
      *(_DWORD *)buf = 138412290;
      v119 = v102;
      _os_log_impl((void *)&_mh_execute_header, v76, v100, "%@ Closing secure scoped resource ... ", buf, 0xCu);
    }
  }
  for (unint64_t i = 0; i < [(NSArray *)self->_assetURLs count]; ++i)
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v78 = VCPLogInstance();
      if (os_log_type_enabled(v78, v6))
      {
        v79 = [(NSArray *)self->_assetURLs objectAtIndexedSubscript:i];
        *(_DWORD *)buf = 138412546;
        v119 = v102;
        __int16 v120 = 2112;
        uint64_t v121 = (uint64_t)v79;
        _os_log_impl((void *)&_mh_execute_header, v78, v6, "%@ Closing secure scoped URL %@", buf, 0x16u);
      }
    }
    id v80 = [(NSArray *)self->_assetURLs objectAtIndexedSubscript:i];
    [v80 stopAccessingSecurityScopedResource];
  }
  unsigned int v81 = [(MADComputeServiceProcessingTask *)self isCancelled];
  id completionHandler = (void (**)(id, void *))self->_completionHandler;
  if (v81)
  {
    NSErrorUserInfoKey v108 = NSLocalizedDescriptionKey;
    uint64_t v83 = +[NSString stringWithFormat:@"%@ Request is canceled", v102];
    v109 = v83;
    id v84 = +[NSDictionary dictionaryWithObjects:&v109 forKeys:&v108 count:1];
    id v85 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v84];
    completionHandler[2](completionHandler, v85);
  }
  else
  {
    completionHandler[2](completionHandler, 0);
  }

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelBlock, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_resultsHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_resumedAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_videoProcessingRequests, 0);
  objc_storeStrong((id *)&self->_resultDirectoryURL, 0);
  objc_storeStrong((id *)&self->_assetURLs, 0);
  objc_storeStrong((id *)&self->_photoLibraryURL, 0);
  objc_storeStrong((id *)&self->_localIdentifiers, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_requests, 0);
}

@end