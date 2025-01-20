@interface VCPUnifiedFullAnalysisTask
+ (id)taskWithPhotoLibrary:(id)a3 options:(id)a4;
- (VCPUnifiedFullAnalysisTask)initWithPhotoLibrary:(id)a3 options:(id)a4;
- (int)mainInternal;
- (int)performProcessingForProviderType:(int64_t)a3 progressReporter:(id)a4;
- (unint64_t)assetCountForMediaAnalysisTaskWithMediaType:(int64_t)a3 mediaSubtypes:(unint64_t)a4;
@end

@implementation VCPUnifiedFullAnalysisTask

- (VCPUnifiedFullAnalysisTask)initWithPhotoLibrary:(id)a3 options:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VCPUnifiedFullAnalysisTask;
  v8 = [(VCPTask *)&v11 initWithPhotoLibrary:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_options, a4);
  }

  return v9;
}

+ (id)taskWithPhotoLibrary:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)objc_opt_class()) initWithPhotoLibrary:v5 options:v6];

  return v7;
}

- (int)performProcessingForProviderType:(int64_t)a3 progressReporter:(id)a4
{
  id v6 = a4;
  v8 = [MADTaskCoordinator alloc];
  v9 = [(VCPTask *)self photoLibrary];
  v29 = v9;
  v10 = +[NSArray arrayWithObjects:&v29 count:1];
  objc_super v11 = +[NSNumber numberWithInteger:a3];
  v28 = v11;
  v12 = +[NSArray arrayWithObjects:&v28 count:1];
  options = self->_options;
  v14 = [(VCPTask *)self cancel];
  v15 = [(MADTaskCoordinator *)v8 initWithPhotoLibraries:v10 taskProviderTypes:v12 options:options cancelBlock:v14 progressReporter:v6];

  if (!v15)
  {
    if ((int)MediaAnalysisLogLevel() < 3)
    {
      int v17 = -18;
      goto LABEL_18;
    }
    v18 = VCPLogInstance();
    os_log_type_t v21 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v18, v21))
    {
      int v26 = 138412290;
      id v27 = (id)objc_opt_class();
      id v22 = v27;
      _os_log_impl((void *)&_mh_execute_header, v18, v21, "[%@] Failed to create task coordinator", (uint8_t *)&v26, 0xCu);
    }
    int v17 = -18;
    goto LABEL_15;
  }
  unsigned int v16 = [(MADTaskCoordinator *)v15 run];
  int v17 = v16;
  if (v16)
  {
    if (v16 == -128)
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v17 = -128;
        goto LABEL_18;
      }
      v18 = VCPLogInstance();
      os_log_type_t v19 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v18, v19))
      {
        int v26 = 138412290;
        id v27 = (id)objc_opt_class();
        id v20 = v27;
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "[%@] Processing canceled", (uint8_t *)&v26, 0xCu);
      }
      int v17 = -128;
      goto LABEL_15;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v18 = VCPLogInstance();
      os_log_type_t v23 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v18, v23))
      {
        int v26 = 138412290;
        id v27 = (id)objc_opt_class();
        id v24 = v27;
        _os_log_impl((void *)&_mh_execute_header, v18, v23, "[%@] Processing failed", (uint8_t *)&v26, 0xCu);
      }
LABEL_15:
    }
  }
LABEL_18:

  return v17;
}

- (unint64_t)assetCountForMediaAnalysisTaskWithMediaType:(int64_t)a3 mediaSubtypes:(unint64_t)a4
{
  if (a3 == 2)
  {
    uint64_t v8 = 1;
    CFStringRef v9 = @"kind == %d";
    goto LABEL_12;
  }
  if (a3 == 1)
  {
    if ((a4 & 8) == 0)
    {
      uint64_t v7 = +[NSPredicate predicateWithFormat:@"kind == %d && kindSubtype != %d", 0, 2];
LABEL_13:
      v13 = (void *)v7;
      v15 = [(VCPTask *)self photoLibrary];
      unint64_t v14 = (unint64_t)objc_msgSend(v15, "vcp_assetCountWithInternalPredicate:forTaskID:", v13, 1);

      options = self->_options;
      if (!options
        || (-[NSDictionary objectForKeyedSubscript:](options, "objectForKeyedSubscript:", VCPTurboProcessing_ImageOnlyKey), int v17 = objc_claimAutoreleasedReturnValue(), v18 = [v17 BOOLValue], v17, (v18 & 1) == 0))
      {
        unint64_t v19 = (a4 >> 3) & 1;
        if (a3 != 1) {
          LOBYTE(v19) = 1;
        }
        v14 <<= v19;
      }
      goto LABEL_18;
    }
    uint64_t v8 = 2;
    CFStringRef v9 = @"kindSubtype == %d";
LABEL_12:
    uint64_t v7 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v9, v8);
    goto LABEL_13;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v10 = VCPLogInstance();
    os_log_type_t v11 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v10, v11))
    {
      *(_DWORD *)buf = 138412546;
      id v22 = (id)objc_opt_class();
      __int16 v23 = 2048;
      int64_t v24 = a3;
      id v12 = v22;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "[%@] Unsupported mediaType %lu.", buf, 0x16u);
    }
  }
  v13 = 0;
  unint64_t v14 = 0;
LABEL_18:

  return v14;
}

- (int)mainInternal
{
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v3, v4))
    {
      *(_DWORD *)os_log_type_t v21 = 138412290;
      *(void *)&v21[4] = objc_opt_class();
      id v5 = *(id *)&v21[4];
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "[%@] Processing assets...", v21, 0xCu);
    }
  }
  id v6 = [(VCPTask *)self progressHandler];
  BOOL v7 = v6 == 0;

  if (v7)
  {
    id v12 = 0;
  }
  else
  {
    unint64_t v8 = [(VCPUnifiedFullAnalysisTask *)self assetCountForMediaAnalysisTaskWithMediaType:1 mediaSubtypes:0];
    unint64_t v9 = [(VCPUnifiedFullAnalysisTask *)self assetCountForMediaAnalysisTaskWithMediaType:1 mediaSubtypes:8];
    unint64_t v10 = [(VCPUnifiedFullAnalysisTask *)self assetCountForMediaAnalysisTaskWithMediaType:2 mediaSubtypes:0];
    os_log_type_t v11 = [(VCPTask *)self progressHandler];
    id v12 = +[VCPProgressReporter reporterWithIntervalSeconds:10 andTotalJobCount:v9 + v8 + v10 andBlock:v11];
  }
  int v13 = [(VCPUnifiedFullAnalysisTask *)self performProcessingForProviderType:4 progressReporter:v12];
  if (!v13)
  {
    unint64_t v14 = [(NSDictionary *)self->_options objectForKeyedSubscript:VCPTurboProcessing_ImageOnlyKey];
    unsigned __int8 v15 = [v14 BOOLValue];

    if ((v15 & 1) != 0
      || (int v13 = [(VCPUnifiedFullAnalysisTask *)self performProcessingForProviderType:5 progressReporter:v12]) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        unsigned int v16 = VCPLogInstance();
        os_log_type_t v17 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v16, v17))
        {
          unsigned __int8 v18 = objc_opt_class();
          *(_DWORD *)os_log_type_t v21 = 138412290;
          *(void *)&v21[4] = v18;
          id v19 = v18;
          _os_log_impl((void *)&_mh_execute_header, v16, v17, "[%@] Processing assets done.", v21, 0xCu);
        }
      }
      int v13 = 0;
    }
  }

  return v13;
}

- (void).cxx_destruct
{
}

@end