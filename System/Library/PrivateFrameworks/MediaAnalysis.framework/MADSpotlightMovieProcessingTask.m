@interface MADSpotlightMovieProcessingTask
+ (id)taskWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
- (BOOL)run:(id *)a3;
- (MADSpotlightMovieProcessingTask)initWithCancelBlock:(id)a3 progressHandler:(id)a4 andCompletionHandler:(id)a5;
- (int)_processAssets;
- (int)_processAssetsInBatch:(id)a3;
@end

@implementation MADSpotlightMovieProcessingTask

- (MADSpotlightMovieProcessingTask)initWithCancelBlock:(id)a3 progressHandler:(id)a4 andCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1001465F0;
  v26[3] = &unk_10021AD08;
  id v10 = a5;
  id v27 = v10;
  v25.receiver = self;
  v25.super_class = (Class)MADSpotlightMovieProcessingTask;
  v11 = [(MADSpotlightMovieProcessingTask *)&v25 initWithCompletionHandler:v26];
  if (v11)
  {
    id v12 = objc_retainBlock(v9);
    id progressHandler = v11->_progressHandler;
    v11->_id progressHandler = v12;

    dispatch_group_t v14 = dispatch_group_create();
    publishGroup = v11->_publishGroup;
    v11->_publishGroup = (OS_dispatch_group *)v14;

    dispatch_queue_t v16 = dispatch_queue_create("MADSpotlightMovieProcessingTask.publish", 0);
    publishQueue = v11->_publishQueue;
    v11->_publishQueue = (OS_dispatch_queue *)v16;

    [(MADSpotlightMovieProcessingTask *)v11 setCancelBlock:v8];
    id v24 = 0;
    id v18 = +[MADManagedSpotlightEntry countForMediaType:2 error:&v24];
    id v19 = v24;
    v11->_totalCount = (unint64_t)v18;
    if (v19 && (int)MediaAnalysisLogLevel() >= 4)
    {
      v20 = VCPLogInstance();
      os_log_type_t v21 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v20, v21))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, v21, "[Spotlight|Image] Failed to query count; progress will not be accurate",
          v23,
          2u);
      }
    }
  }

  return v11;
}

+ (id)taskWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [objc_alloc((Class)a1) initWithCancelBlock:v8 progressHandler:v9 andCompletionHandler:v10];

  return v11;
}

- (int)_processAssetsInBatch:(id)a3
{
  id v4 = a3;
  int v5 = [v4 prepare];
  if (v5)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v6 = VCPLogInstance();
      os_log_type_t v7 = VCPLogToOSLogType[3];
      if (!os_log_type_enabled(v6, v7))
      {
LABEL_13:

        goto LABEL_14;
      }
      *(_DWORD *)buf = 138412290;
      id v17 = v4;
      id v8 = "Failed to prepare batch: %@";
LABEL_5:
      _os_log_impl((void *)&_mh_execute_header, v6, v7, v8, buf, 0xCu);
      goto LABEL_13;
    }
  }
  else
  {
    unsigned int v9 = [v4 process];
    int v5 = v9;
    if (v9 != -128 && v9)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v6 = VCPLogInstance();
        os_log_type_t v7 = VCPLogToOSLogType[3];
        if (!os_log_type_enabled(v6, v7)) {
          goto LABEL_13;
        }
        *(_DWORD *)buf = 138412290;
        id v17 = v4;
        id v8 = "Failed to process batch: %@";
        goto LABEL_5;
      }
    }
    else
    {
      dispatch_group_wait((dispatch_group_t)self->_publishGroup, 0xFFFFFFFFFFFFFFFFLL);
      if (!self->_publishError)
      {
        publishGroup = self->_publishGroup;
        publishQueue = self->_publishQueue;
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_100146918;
        v13[3] = &unk_100219D70;
        dispatch_group_t v14 = v4;
        v15 = self;
        dispatch_group_async(publishGroup, publishQueue, v13);
        v6 = v14;
        goto LABEL_13;
      }
    }
  }
LABEL_14:

  return v5;
}

- (int)_processAssets
{
  unsigned int v3 = [(MADSpotlightMovieProcessingTask *)self isCanceled];
  int v4 = MediaAnalysisLogLevel();
  if (v3)
  {
    if (v4 >= 3)
    {
      v6 = VCPLogInstance();
      os_log_type_t v7 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v6, v7))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, v7, "[Spotlight|Movie] Analysis canceled", buf, 2u);
      }
    }
    return -128;
  }
  else
  {
    if (v4 <= 4)
    {
      os_log_type_t v9 = VCPLogToOSLogType[5];
    }
    else
    {
      id v8 = VCPLogInstance();
      os_log_type_t v9 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v8, v9))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "[Spotlight|Movie] Analyze all movie assets", buf, 2u);
      }
    }
    v28 = v30;
    *(void *)&long long v5 = 67109120;
    long long v27 = v5;
    while (1)
    {
      id v11 = +[VCPWatchdog sharedWatchdog];
      [v11 pet];

      if ([(MADSpotlightMovieProcessingTask *)self isCanceled])
      {
        return -128;
      }
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        id v12 = VCPLogInstance();
        if (os_log_type_enabled(v12, v9))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, v9, "[Spotlight|Movie] Fetching asset", buf, 2u);
        }
      }
      id v37 = 0;
      v13 = +[MADManagedSpotlightEntry fetchEntriesWithMediaType:fetchLimit:error:](MADManagedSpotlightEntry, "fetchEntriesWithMediaType:fetchLimit:error:", 2, 5, &v37, v27, v28);
      id v14 = v37;
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        v15 = VCPLogInstance();
        if (os_log_type_enabled(v15, v9))
        {
          unsigned int v16 = [v13 count];
          *(_DWORD *)buf = v27;
          *(_DWORD *)&uint8_t buf[4] = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, v9, "[Spotlight|Movie] Fetched %d asset", buf, 8u);
        }
      }
      if (![v13 count]) {
        break;
      }
      id v17 = [(MADSpotlightMovieProcessingTask *)self cancelBlock];
      id v18 = +[MADSpotlightMovieAssetBatch batchWithCancelBlock:v17];

      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v19 = v13;
      id v20 = [v19 countByEnumeratingWithState:&v33 objects:v42 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v34;
        do
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v34 != v21) {
              objc_enumerationMutation(v19);
            }
            [v18 addAsset:*(void *)(*((void *)&v33 + 1) + 8 * i)];
          }
          id v20 = [v19 countByEnumeratingWithState:&v33 objects:v42 count:16];
        }
        while (v20);
      }

      *(void *)buf = 0;
      v39 = buf;
      uint64_t v40 = 0x2020000000;
      int v41 = 0;
      v23 = +[VCPMADQoSManager sharedManager];
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v30[0] = sub_100146F74;
      v30[1] = &unk_10021C020;
      v32 = buf;
      v30[2] = self;
      id v24 = v18;
      id v31 = v24;
      [v23 runBlock:v29 withTaskID:18];

      int v25 = *((_DWORD *)v39 + 6);
      _Block_object_dispose(buf, 8);

      if (v25) {
        return v25;
      }
    }

    return 0;
  }
}

- (BOOL)run:(id *)a3
{
  (*((void (**)(double))self->_progressHandler + 2))(0.0);
  long long v5 = VCPSignPostLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  os_log_type_t v7 = VCPSignPostLog();
  id v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "MADSpotlightMovieProcessingTask", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    os_log_type_t v9 = VCPLogInstance();
    os_log_type_t v10 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v9, v10))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "[Spotlight|Movie] Processing movie assets", buf, 2u);
    }
  }
  int publishError = [(MADSpotlightMovieProcessingTask *)self _processAssets];
  dispatch_group_wait((dispatch_group_t)self->_publishGroup, 0xFFFFFFFFFFFFFFFFLL);
  if (!publishError) {
    int publishError = self->_publishError;
  }
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    id v12 = VCPLogInstance();
    os_log_type_t v13 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v12, v13))
    {
      *(_DWORD *)buf = 67109120;
      int v25 = publishError;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "[Spotlight|Movie] Error: %d", buf, 8u);
    }
  }
  id v14 = VCPSignPostLog();
  v15 = v14;
  if (v6 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_END, v6, "MADSpotlightMovieProcessingTask", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  if (!publishError)
  {
    id v17 = [(MADSpotlightMovieProcessingTask *)self completionHandler];
    v17[2](v17, 0, 0);
LABEL_23:

    return publishError == 0;
  }
  if (a3)
  {
    NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
    unsigned int v16 = "failed";
    if (publishError == -128) {
      unsigned int v16 = "canceled";
    }
    id v17 = +[NSString stringWithFormat:@"[Spotlight|Movie] Processing %s", v16];
    v23 = v17;
    id v18 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    id v19 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:publishError userInfo:v18];
    id v20 = *a3;
    *a3 = v19;

    goto LABEL_23;
  }
  return publishError == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_publishQueue, 0);
  objc_storeStrong((id *)&self->_publishGroup, 0);
}

@end