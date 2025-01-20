@interface VCPBatchAnalysisTask
+ (VCPBatchAnalysisTask)taskWithPhotoLibrary:(id)a3;
- (BOOL)allowStreaming;
- (BOOL)containsAsset:(id)a3;
- (VCPBatchAnalysisTask)initWithPhotoLibrary:(id)a3;
- (VCPPhotosAssetChangeManager)photosChangeManager;
- (VCPProgressReporter)progressReporter;
- (double)cost;
- (int)mainInternal;
- (void)addAnalysis:(unint64_t)a3 withExistingAnalysis:(id)a4 forAsset:(id)a5;
- (void)addAnalysis:(unint64_t)a3 withExistingAnalysis:(id)a4 forAsset:(id)a5 allowStreaming:(BOOL)a6;
- (void)setAllowStreaming:(BOOL)a3;
- (void)setPhotosChangeManager:(id)a3;
- (void)setProgressReporter:(id)a3;
@end

@implementation VCPBatchAnalysisTask

- (VCPBatchAnalysisTask)initWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VCPBatchAnalysisTask;
  v5 = [(VCPTask *)&v10 initWithPhotoLibrary:v4];
  v6 = v5;
  if (v5)
  {
    v5->_cost = 0.0;
    v5->_allowStreaming = 0;
    uint64_t v7 = +[NSMutableArray array];
    subtasks = v6->_subtasks;
    v6->_subtasks = (NSMutableArray *)v7;
  }
  return v6;
}

+ (VCPBatchAnalysisTask)taskWithPhotoLibrary:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithPhotoLibrary:v3];

  return (VCPBatchAnalysisTask *)v4;
}

- (void)addAnalysis:(unint64_t)a3 withExistingAnalysis:(id)a4 forAsset:(id)a5 allowStreaming:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = a5;
  if (([(VCPBatchAnalysisTask *)self isExecuting] & 1) == 0
    && ![(VCPBatchAnalysisTask *)self isFinished])
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v15 = VCPLogInstance();
      os_log_type_t v16 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v15, v16))
      {
        id v17 = [v11 localIdentifier];
        v18 = objc_msgSend(v11, "vcp_typeDescription");
        v19 = MediaAnalysisTypeShortDescription(a3);
        int v23 = 138412802;
        id v24 = v17;
        __int16 v25 = 2112;
        v26 = v18;
        __int16 v27 = 2112;
        v28 = v19;
        _os_log_impl((void *)&_mh_execute_header, v15, v16, "  [%@] Batching %@ for analysis (%@)", (uint8_t *)&v23, 0x20u);
      }
    }
    v12 = +[VCPAssetAnalysisTask taskWithAnalysisTypes:a3 forAsset:v11 withExistingAnalysis:v10];
    v20 = [(VCPTask *)self cancel];
    [v12 setCancel:v20];

    [v12 setAllowStreaming:v6];
    v21 = [(VCPBatchAnalysisTask *)self photosChangeManager];
    [v12 setPhotosChangeManager:v21];

    [v12 cost];
    self->_cost = v22 + self->_cost;
    [(NSMutableArray *)self->_subtasks addObject:v12];
    goto LABEL_11;
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v12 = VCPLogInstance();
    os_log_type_t v13 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v12, v13))
    {
      v14 = [v11 localIdentifier];
      int v23 = 138412290;
      id v24 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "  [%@] Batch analysis task cannot be modified; dropping",
        (uint8_t *)&v23,
        0xCu);
    }
LABEL_11:
  }
}

- (void)addAnalysis:(unint64_t)a3 withExistingAnalysis:(id)a4 forAsset:(id)a5
{
  id v9 = a4;
  id v8 = a5;
  [(VCPBatchAnalysisTask *)self addAnalysis:a3 withExistingAnalysis:v9 forAsset:v8 allowStreaming:[(VCPBatchAnalysisTask *)self allowStreaming]];
}

- (BOOL)containsAsset:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = self->_subtasks;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "asset", (void)v14);
        id v10 = [v9 localIdentifier];
        id v11 = [v4 localIdentifier];
        unsigned __int8 v12 = [v10 isEqualToString:v11];

        if (v12)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (int)mainInternal
{
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v4 = VCPLogInstance();
    os_log_type_t v5 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v4, v5))
    {
      unsigned int v6 = [(NSMutableArray *)self->_subtasks count];
      *(_DWORD *)buf = 67109120;
      unsigned int v56 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Batch analyzing %d assets", buf, 8u);
    }
  }
  uint64_t v7 = [(VCPTask *)self photoLibrary];
  v42 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v7];

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  obj = self->_subtasks;
  id v8 = [(NSMutableArray *)obj countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (!v8)
  {
LABEL_24:

    unsigned int v17 = [v42 commit];
    if (v17 == -108 || v17 == -36)
    {
      unsigned int v18 = v17;
    }
    else
    {
      unsigned int v18 = v17;
      if (v17 != -23) {
        unsigned int v18 = v2;
      }
    }
    if (v17 == -108 || v17 == -36 || v17 == -23)
    {
      LODWORD(v2) = v18;
      goto LABEL_61;
    }
    unsigned int v39 = v18;
    obj = +[NSMutableArray array];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v41 = self->_subtasks;
    LODWORD(v2) = 0;
    id v19 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (!v19) {
      goto LABEL_48;
    }
    uint64_t v20 = *(void *)v46;
LABEL_35:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v46 != v20) {
        objc_enumerationMutation(v41);
      }
      double v22 = *(void **)(*((void *)&v45 + 1) + 8 * v21);
      id v24 = +[VCPWatchdog sharedWatchdog];
      [v24 pet];

      if (!v2)
      {
        if (![(VCPTask *)self isCancelled])
        {
          __int16 v27 = +[VCPMADQoSManager sharedManager];
          v44[0] = _NSConcreteStackBlock;
          v44[1] = 3221225472;
          v44[2] = sub_1000AE858;
          v44[3] = &unk_100219FC8;
          v44[4] = v22;
          [v27 runBlock:v44 withTaskID:1];

          if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled])
          {
            v28 = [v22 asset];
            v29 = [v28 localIdentifier];
            v30 = [v22 analysisResults];
            v31 = +[VSKAsset mad_assetsWithLocalIdentifier:v29 mediaAnalysisResults:v30];

            [(NSMutableArray *)obj addObjectsFromArray:v31];
          }
          LODWORD(v2) = [v22 error];
          goto LABEL_42;
        }
        LODWORD(v2) = -128;
      }
      __int16 v25 = [v22 asset];
      v26 = [v25 localIdentifier];
      [v42 decrementBlacklistCountForLocalIdentifier:v26];

LABEL_42:
      [(VCPProgressReporter *)self->_progressReporter increaseProcessedJobCountByOne];
      if (v19 == (id)++v21)
      {
        id v32 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v45 objects:v53 count:16];
        id v19 = v32;
        if (!v32)
        {
LABEL_48:

          unsigned int v33 = [v42 commit];
          if (v33 == -108 || v33 == -36)
          {
            unsigned int v34 = v33;
          }
          else
          {
            unsigned int v34 = v33;
            if (v33 != -23) {
              unsigned int v34 = v39;
            }
          }
          if (v33 == -108 || v33 == -36 || v33 == -23)
          {
            LODWORD(v2) = v34;
          }
          else
          {
            if ([(NSMutableArray *)obj count])
            {
              v35 = [(VCPTask *)self photoLibrary];
              v43[0] = _NSConcreteStackBlock;
              v43[1] = 3221225472;
              v43[2] = sub_1000AE860;
              v43[3] = &unk_100219D98;
              v43[4] = self;
              +[MADVectorDatabaseUtilities updateWithAssetsEmbeddings:obj photoLibrary:v35 cancelBlock:v43 error:0];
            }
            v36 = [(VCPTask *)self photoLibrary];
            v37 = +[VCPBackgroundProcessingMetrics sharedMetricsWithPhotoLibrary:v36];
            [v37 persist];
          }
          goto LABEL_60;
        }
        goto LABEL_35;
      }
    }
  }
  uint64_t v9 = *(void *)v50;
LABEL_7:
  id v10 = 0;
  id v11 = v2;
  while (1)
  {
    if (*(void *)v50 != v9) {
      objc_enumerationMutation(obj);
    }
    unsigned __int8 v12 = [*(id *)(*((void *)&v49 + 1) + 8 * (void)v10) asset];
    os_log_type_t v13 = [v12 localIdentifier];
    id v14 = [v42 addAssetToBlacklist:v13];

    if (v14 == -108)
    {
      id v2 = v14;
    }
    else
    {
      BOOL v15 = v14 == -36 || v14 == -23;
      id v2 = v14;
      if (!v15) {
        id v2 = v11;
      }
    }
    if (v14 == -108) {
      break;
    }
    if (v14 == -36 || v14 == -23) {
      break;
    }
    id v10 = (char *)v10 + 1;
    id v11 = v2;
    if (v8 == v10)
    {
      id v8 = [(NSMutableArray *)obj countByEnumeratingWithState:&v49 objects:v54 count:16];
      if (!v8) {
        goto LABEL_24;
      }
      goto LABEL_7;
    }
  }
LABEL_60:

LABEL_61:
  return (int)v2;
}

- (double)cost
{
  return self->_cost;
}

- (BOOL)allowStreaming
{
  return self->_allowStreaming;
}

- (void)setAllowStreaming:(BOOL)a3
{
  self->_allowStreaming = a3;
}

- (VCPPhotosAssetChangeManager)photosChangeManager
{
  return self->_photosChangeManager;
}

- (void)setPhotosChangeManager:(id)a3
{
}

- (VCPProgressReporter)progressReporter
{
  return self->_progressReporter;
}

- (void)setProgressReporter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressReporter, 0);
  objc_storeStrong((id *)&self->_photosChangeManager, 0);
  objc_storeStrong((id *)&self->_subtasks, 0);
}

@end