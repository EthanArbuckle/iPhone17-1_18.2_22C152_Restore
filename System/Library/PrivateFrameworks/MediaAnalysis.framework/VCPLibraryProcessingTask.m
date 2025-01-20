@interface VCPLibraryProcessingTask
+ (id)taskWithPhotoLibraries:(id)a3 andOptions:(id)a4 andProgressHandler:(id)a5 andCompletionHandler:(id)a6 andCancelBlock:(id)a7;
- (BOOL)autoCancellable;
- (BOOL)isCancelled;
- (VCPLibraryProcessingTask)init;
- (VCPLibraryProcessingTask)initWithPhotoLibraries:(id)a3 andOptions:(id)a4 andProgressHandler:(id)a5 andCompletionHandler:(id)a6 andCancelBlock:(id)a7;
- (float)resourceRequirement;
- (id)createTaskBacklogForPhotoLibrary:(id)a3 withDatabase:(id)a4;
- (int)run;
- (void)cancel;
- (void)dealloc;
@end

@implementation VCPLibraryProcessingTask

- (VCPLibraryProcessingTask)init
{
  return 0;
}

- (VCPLibraryProcessingTask)initWithPhotoLibraries:(id)a3 andOptions:(id)a4 andProgressHandler:(id)a5 andCompletionHandler:(id)a6 andCancelBlock:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v16 = (Block_layout *)a6;
  v17 = (Block_layout *)a7;
  v29.receiver = self;
  v29.super_class = (Class)VCPLibraryProcessingTask;
  v18 = [(VCPLibraryProcessingTask *)&v29 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_photoLibraries, a3);
    id v20 = objc_retainBlock(v15);
    id progressHandler = v19->_progressHandler;
    v19->_id progressHandler = v20;

    if (v16) {
      v22 = v16;
    }
    else {
      v22 = &stru_10021DC10;
    }
    v23 = objc_retainBlock(v22);
    id completionHandler = v19->_completionHandler;
    v19->_id completionHandler = v23;

    if (v17) {
      v25 = v17;
    }
    else {
      v25 = &stru_10021DC30;
    }
    v26 = objc_retainBlock(v25);
    id cancelBlock = v19->_cancelBlock;
    v19->_id cancelBlock = v26;

    objc_storeStrong((id *)&v19->_options, a4);
  }

  return v19;
}

+ (id)taskWithPhotoLibraries:(id)a3 andOptions:(id)a4 andProgressHandler:(id)a5 andCompletionHandler:(id)a6 andCancelBlock:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [objc_alloc((Class)objc_opt_class()) initWithPhotoLibraries:v11 andOptions:v12 andProgressHandler:v13 andCompletionHandler:v14 andCancelBlock:v15];

  return v16;
}

- (void)dealloc
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_started);
  if ((v3 & 1) == 0) {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPLibraryProcessingTask;
  [(VCPLibraryProcessingTask *)&v4 dealloc];
}

- (float)resourceRequirement
{
  return 1.0;
}

- (void)cancel
{
}

- (BOOL)isCancelled
{
  if ((*((uint64_t (**)(void))self->_cancelBlock + 2))()) {
    return 1;
  }
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_cancel);
  return v4 & 1;
}

- (id)createTaskBacklogForPhotoLibrary:(id)a3 withDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NSMutableArray array];
  if ([v7 exists])
  {
    v9 = +[VCPBackgroundProcessingMetrics sharedMetricsWithPhotoLibrary:v6];
    [v9 loadMetrics];

    v10 = +[VCPAssetMaintenanceTask taskWithPhotoLibrary:v6];
    [v8 addObject:v10];
  }
  if (objc_msgSend(v6, "vcp_anyAssetsForTaskID:", 1))
  {
    if (_os_feature_enabled_impl())
    {
      id v11 = +[MADFullAnalysisResultsSynchronizationTask taskWithPhotoLibrary:v6];
      [v8 addObject:v11];

      id v12 = +[VCPUnifiedFullAnalysisTask taskWithPhotoLibrary:v6 options:self->_options];
      [v8 addObject:v12];

      id v13 = [(NSDictionary *)self->_options objectForKeyedSubscript:VCPTurboProcessing_ImageOnlyKey];
      unsigned __int8 v14 = [v13 BOOLValue];

      if (v14) {
        goto LABEL_13;
      }
      id v15 = +[VCPResumePausedAnalysisTask taskWithPhotoLibrary:v6];
      [v8 addObject:v15];

      id v16 = +[VCPFailedAssetAnalysisTask taskWithPhotoLibrary:v6 options:self->_options];
      [v8 addObject:v16];

      v17 = +[VCPMediaTypeAnalysisTask taskWithPhotoLibrary:v6 mediaType:2];
      [v8 addObject:v17];
    }
    else
    {
      id v20 = +[VCPSubsampledAnalysisTask taskWithPhotoLibrary:v6 options:self->_options];
      [v8 addObject:v20];

      v21 = +[VCPResumePausedAnalysisTask taskWithPhotoLibrary:v6];
      [v8 addObject:v21];

      v22 = +[VCPFailedAssetAnalysisTask taskWithPhotoLibrary:v6 options:self->_options];
      [v8 addObject:v22];

      v23 = +[VCPMediaTypeAnalysisTask taskWithPhotoLibrary:v6 mediaType:1];
      [v8 addObject:v23];

      v17 = +[VCPMediaTypeAnalysisTask taskWithPhotoLibrary:v6 mediaType:2];
      [v8 addObject:v17];
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 5)
  {
    v18 = VCPLogInstance();
    os_log_type_t v19 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v18, v19))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Photo library is empty", v25, 2u);
    }
  }
LABEL_13:

  return v8;
}

- (int)run
{
  atomic_store(1u, (unsigned __int8 *)&self->_started);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000E9580;
  v29[3] = &unk_10021BEF0;
  v29[4] = self;
  unsigned __int8 v3 = objc_retainBlock(v29);
  photoLibraries = self->_photoLibraries;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000E9670;
  v28[3] = &unk_100219D98;
  v28[4] = self;
  v21 = v3;
  v5 = +[VCPMADSceneLibraryProcessingTask taskWithPhotoLibraries:photoLibraries cancelBlock:v28 progressHandler:v3 andCompletionHandler:&stru_10021DC50];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  unsigned int v27 = 0;
  unsigned int v27 = [v5 run];
  id v6 = VCPSignPostLog();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  v8 = VCPSignPostLog();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "VCPLibraryProcessingTask", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  id v10 = objc_alloc_init((Class)VCPTimeMeasurement);
  [v10 start];
  if ([(NSArray *)self->_photoLibraries count] && !*((_DWORD *)v25 + 6))
  {
    double v11 = 90.0 / (double)[(NSArray *)self->_photoLibraries count];
    id v12 = self->_photoLibraries;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000E9678;
    v22[3] = &unk_10021DCA0;
    *(double *)&v22[6] = v11;
    v22[4] = self;
    v22[5] = &v24;
    [(NSArray *)v12 enumerateObjectsUsingBlock:v22];
  }
  [v10 stop];
  id v13 = +[VCPMADCoreAnalyticsManager sharedManager];
  [v10 elapsedTimeSeconds];
  unsigned __int8 v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v13 setValue:v14 forField:@"TimeAnalyzingInSeconds" andEvent:@"com.apple.mediaanalysisd.FullAnalysisRunSession"];

  id v15 = +[VCPMADCoreAnalyticsManager sharedManager];
  [v10 elapsedTimeSeconds];
  id v16 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v15 setValue:v16 forField:@"TotalAnalyzingTimeInSeconds" andEvent:@"com.apple.mediaanalysisd.FullAnalysisRunSession"];

  v17 = VCPSignPostLog();
  v18 = v17;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, v7, "VCPLibraryProcessingTask", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  VCPPerformance_ReportSummary();
  (*((void (**)(void))self->_completionHandler + 2))();
  int v19 = *((_DWORD *)v25 + 6);

  _Block_object_dispose(&v24, 8);
  return v19;
}

- (BOOL)autoCancellable
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelBlock, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_photoLibraries, 0);
}

@end