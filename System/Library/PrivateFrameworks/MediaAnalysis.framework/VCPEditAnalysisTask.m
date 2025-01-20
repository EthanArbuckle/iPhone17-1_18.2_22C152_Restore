@interface VCPEditAnalysisTask
+ (id)taskWithPhotoLibrary:(id)a3;
- (BOOL)isAutoplayable:(id)a3;
- (VCPEditAnalysisTask)initWithPhotoLibrary:(id)a3;
- (int)duplicateAsset:(id)a3;
- (int)mainInternal;
- (int)processAsset:(id)a3 withTypes:(unint64_t)a4;
- (int)processPendingBatch;
- (void)resetPendingBatch;
@end

@implementation VCPEditAnalysisTask

- (VCPEditAnalysisTask)initWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VCPEditAnalysisTask;
  v5 = [(VCPTask *)&v9 initWithPhotoLibrary:v4];
  if (v5)
  {
    uint64_t v6 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v4];
    database = v5->_database;
    v5->_database = (VCPDatabaseWriter *)v6;
  }
  return v5;
}

+ (id)taskWithPhotoLibrary:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithPhotoLibrary:v3];

  return v4;
}

- (void)resetPendingBatch
{
  id v5 = [(VCPTask *)self photoLibrary];
  +[VCPBatchAnalysisTask taskWithPhotoLibrary:](VCPBatchAnalysisTask, "taskWithPhotoLibrary:");
  id v3 = (VCPBatchAnalysisTask *)objc_claimAutoreleasedReturnValue();
  pendingBatch = self->_pendingBatch;
  self->_pendingBatch = v3;

  id v6 = [(VCPTask *)self cancel];
  -[VCPTask setCancel:](self->_pendingBatch, "setCancel:");
}

- (int)processPendingBatch
{
  [(VCPBatchAnalysisTask *)self->_pendingBatch start];
  int v3 = [(VCPTask *)self->_pendingBatch error];
  if (!v3) {
    [(VCPEditAnalysisTask *)self resetPendingBatch];
  }
  return v3;
}

- (int)processAsset:(id)a3 withTypes:(unint64_t)a4
{
  id v6 = a3;
  [(VCPBatchAnalysisTask *)self->_pendingBatch addAnalysis:a4 withExistingAnalysis:0 forAsset:v6];
  [(VCPBatchAnalysisTask *)self->_pendingBatch cost];
  if (v7 < 100.0 || (int v8 = [(VCPEditAnalysisTask *)self processPendingBatch]) == 0) {
    int v8 = 0;
  }

  return v8;
}

- (BOOL)isAutoplayable:(id)a3
{
  id v4 = a3;
  database = self->_database;
  id v6 = [v4 localIdentifier];
  id v14 = 0;
  [(VCPDatabaseWriter *)database analysisForAsset:v6 analysis:&v14];
  id v7 = v14;

  int v8 = MediaAnalysisStripOutdatedAnalysis(v4, v7);

  objc_super v9 = objc_msgSend(v8, "vcp_results");
  v10 = [v9 objectForKeyedSubscript:@"MovieSummaryResults"];

  if ([v10 count])
  {
    v11 = [v10 objectAtIndexedSubscript:0];
    unint64_t v12 = ((unint64_t)objc_msgSend(v11, "vcp_flags") >> 19) & 1;
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (int)duplicateAsset:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)PHAssetCreationOptions);
  [v5 setCopyAsAlternateAsset:1];
  id v6 = NSTemporaryDirectory();
  id v7 = [v4 localIdentifier];
  int v8 = [v7 componentsSeparatedByString:@"/"];
  objc_super v9 = [v8 objectAtIndexedSubscript:0];
  v10 = +[NSString stringWithFormat:@"%@frc-tmp-%@.MOV", v6, v9];

  v11 = +[NSURL fileURLWithPath:v10];
  unint64_t v12 = +[NSFileManager defaultManager];
  if ([v12 fileExistsAtPath:v10])
  {
    v13 = [(VCPTask *)self photoLibrary];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000871EC;
    v22[3] = &unk_10021BF68;
    id v23 = v4;
    id v24 = v5;
    id v25 = v11;
    id v21 = 0;
    unsigned int v14 = [v13 performChangesAndWait:v22 error:&v21];
    id v15 = v21;

    if (v14)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v16 = VCPLogInstance();
        os_log_type_t v17 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v16, v17))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, v17, "Duplicate Video Interpolation asset succeeded", buf, 2u);
        }
LABEL_10:
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v16 = VCPLogInstance();
      os_log_type_t v18 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v16, v18))
      {
        v19 = [v15 description];
        *(_DWORD *)buf = 138412290;
        v27 = v19;
        _os_log_impl((void *)&_mh_execute_header, v16, v18, "Error duplicating Video Interpolation asset: %@", buf, 0xCu);
      }
      goto LABEL_10;
    }

    goto LABEL_12;
  }
  id v15 = 0;
LABEL_12:

  return 0;
}

- (int)mainInternal
{
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v2 = VCPLogInstance();
    os_log_type_t v3 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v2, v3))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Processing Video Interpolation...", buf, 2u);
    }
  }
  [(VCPEditAnalysisTask *)self resetPendingBatch];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v4 = VCPLogInstance();
    os_log_type_t v5 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v4, v5))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Update analysis types for non-autoplayable assets", buf, 2u);
    }
  }
  id v6 = [(VCPTask *)self photoLibrary];
  v59 = +[PHAsset vcp_fetchOptionsForLibrary:v6 forTaskID:1];

  id v7 = +[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:0];
  v65 = v7;
  int v8 = +[NSArray arrayWithObjects:&v65 count:1];
  [v59 setSortDescriptors:v8];

  objc_super v9 = +[PHAsset fetchAssetsWithMediaType:1 options:v59];
  unint64_t v10 = 0;
  int v60 = 0;
  CFStringRef v58 = @"MovieSummaryResults";
  while (v10 < (unint64_t)objc_msgSend(v9, "count", v58))
  {
    unint64_t v12 = [v9 objectAtIndexedSubscript:v10];
    if ([(VCPTask *)self isCancelled])
    {
      int v60 = -128;
      int v13 = 11;
    }
    else
    {
      unsigned int v14 = +[VCPWatchdog sharedWatchdog];
      [v14 pet];

      if (objc_msgSend(v12, "vcp_isLivePhoto"))
      {
        id v15 = +[PHAssetResource vcp_allAcceptableResourcesForAsset:v12];
        unsigned int v16 = objc_msgSend(v12, "vcp_fullAnalysisTypesForResources:", v15);
        if ((v16 & 0x20000000) != 0)
        {
          database = self->_database;
          os_log_type_t v18 = [v12 localIdentifier];
          id v63 = 0;
          [(VCPDatabaseWriter *)database analysisForAsset:v18 analysis:&v63];
          id v19 = v63;

          v20 = MediaAnalysisStripOutdatedAnalysis(v12, v19);

          uint64_t v21 = v16 & 0x20000000;
          if (((unint64_t)objc_msgSend(v20, "vcp_types") & v21) != 0)
          {
            int v13 = 8;
          }
          else
          {
            v22 = objc_msgSend(v20, "vcp_results");
            id v23 = [v22 objectForKeyedSubscript:v58];

            if ([v23 count]
              && ([v23 objectAtIndexedSubscript:0],
                  id v24 = objc_claimAutoreleasedReturnValue(),
                  BOOL v25 = ((unint64_t)objc_msgSend(v24, "vcp_flags") & 0x80000) == 0,
                  v24,
                  !v25))
            {
              int v13 = 8;
            }
            else
            {
              unsigned int v26 = [(VCPEditAnalysisTask *)self processAsset:v12 withTypes:v21];
              if (v26) {
                int v13 = 11;
              }
              else {
                int v13 = 0;
              }
              int v27 = v60;
              if (v26) {
                int v27 = v26;
              }
              int v60 = v27;
            }
          }
        }
        else
        {
          int v13 = 8;
        }
      }
      else
      {
        int v13 = 8;
      }
    }

    if (v13 > 8) {
      goto LABEL_67;
    }
    ++v10;
  }
  [(VCPBatchAnalysisTask *)self->_pendingBatch cost];
  if (v28 != 0.0)
  {
    int v29 = [(VCPEditAnalysisTask *)self processPendingBatch];
    if (v29) {
      goto LABEL_83;
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v30 = VCPLogInstance();
    os_log_type_t v31 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v30, v31))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "Perform Video Interpolation for autoplayable assets", buf, 2u);
    }
  }
  for (unint64_t i = 0; i < (unint64_t)[v9 count]; ++i)
  {
    v34 = [v9 objectAtIndexedSubscript:i];
    if ([(VCPTask *)self isCancelled])
    {
      int v60 = -128;
      int v35 = 11;
    }
    else
    {
      v36 = +[VCPWatchdog sharedWatchdog];
      [v36 pet];

      if (objc_msgSend(v34, "vcp_isLivePhoto"))
      {
        v37 = +[PHAssetResource vcp_allAcceptableResourcesForAsset:v34];
        unsigned int v38 = objc_msgSend(v34, "vcp_fullAnalysisTypesForResources:", v37);
        if ((v38 & 0x20000000) != 0)
        {
          v39 = self->_database;
          v40 = [v34 localIdentifier];
          id v62 = 0;
          [(VCPDatabaseWriter *)v39 analysisForAsset:v40 analysis:&v62];
          id v41 = v62;

          v42 = MediaAnalysisStripOutdatedAnalysis(v34, v41);

          uint64_t v43 = v38 & 0x20000000;
          if (((unint64_t)objc_msgSend(v42, "vcp_types") & v43) != 0)
          {
            int v35 = 20;
          }
          else
          {
            v44 = objc_msgSend(v42, "vcp_results");
            v45 = [v44 objectForKeyedSubscript:v58];

            if (![v45 count]) {
              goto LABEL_51;
            }
            v46 = [v45 objectAtIndexedSubscript:0];
            BOOL v47 = ((unint64_t)objc_msgSend(v46, "vcp_flags") & 0x80000) == 0;

            if (!v47)
            {
              v48 = +[VCPAssetAnalysisTask taskWithAnalysisTypes:v43 forAsset:v34 withExistingAnalysis:v42];
              v49 = [(VCPTask *)self cancel];
              [v48 setCancel:v49];

              [v48 start];
              unsigned int v50 = [v48 error];
              if (v50)
              {
                int v35 = 11;
              }
              else
              {
                unsigned int v51 = [(VCPEditAnalysisTask *)self duplicateAsset:v34];
                int v35 = v51 ? 11 : 0;
                unsigned int v50 = v51 ? v51 : v60;
              }

              int v60 = v50;
            }
            else
            {
LABEL_51:
              int v35 = 20;
            }
          }
        }
        else
        {
          int v35 = 20;
        }
      }
      else
      {
        int v35 = 20;
      }
    }

    if (v35 <= 17)
    {
      if (v35) {
        break;
      }
    }
  }
LABEL_67:
  unsigned int v52 = [(VCPDatabaseWriter *)self->_database commit];
  if (v52 == -36 || v52 == -23) {
    int v54 = v52;
  }
  else {
    int v54 = 0;
  }
  if (v52 == -108) {
    int v54 = -108;
  }
  BOOL v55 = v52 == -36 || v52 == -23;
  int v56 = v60;
  if (v55) {
    int v56 = v54;
  }
  if (v52 == -108) {
    int v29 = v54;
  }
  else {
    int v29 = v56;
  }
LABEL_83:

  return v29;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingBatch, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end