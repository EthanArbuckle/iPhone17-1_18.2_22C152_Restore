@interface VCPMediaAnalysisServiceTask
+ (id)taskForPhotoLibrary:(id)a3 withAssetLocalIdentifiers:(id)a4 realTime:(BOOL)a5 progressHandler:(id)a6 completionHandler:(id)a7;
- (BOOL)autoCancellable;
- (BOOL)realTime;
- (VCPMediaAnalysisServiceTask)initWithPhotoLibrary:(id)a3 withAssetLocalIdentifiers:(id)a4 realTime:(BOOL)a5 progressHandler:(id)a6 completionHandler:(id)a7;
- (double)progressWeight:(id)a3;
- (double)totalProgressWeight:(id)a3;
- (float)resourceRequirement;
- (int)analyzeAsset:(id)a3 analyses:(id)a4 cancel:(id)a5;
- (int)run;
- (void)cancel;
@end

@implementation VCPMediaAnalysisServiceTask

- (VCPMediaAnalysisServiceTask)initWithPhotoLibrary:(id)a3 withAssetLocalIdentifiers:(id)a4 realTime:(BOOL)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  v16 = (Block_layout *)a7;
  v26.receiver = self;
  v26.super_class = (Class)VCPMediaAnalysisServiceTask;
  v17 = [(VCPMediaAnalysisServiceTask *)&v26 init];
  v18 = v17;
  if (v17)
  {
    v17->_realTime = a5;
    objc_storeStrong((id *)&v17->_photoLibrary, a3);
    objc_storeStrong((id *)&v18->_localIdentifiers, a4);
    v18->_cancel = 0;
    id v19 = objc_retainBlock(v15);
    id progressHandler = v18->_progressHandler;
    v18->_id progressHandler = v19;

    if (v16) {
      v21 = v16;
    }
    else {
      v21 = &stru_10021BFA8;
    }
    v22 = objc_retainBlock(v21);
    id completionHandler = v18->_completionHandler;
    v18->_id completionHandler = v22;

    v18->_noResultStrip = 0;
    v24 = v18;
  }

  return v18;
}

+ (id)taskForPhotoLibrary:(id)a3 withAssetLocalIdentifiers:(id)a4 realTime:(BOOL)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  BOOL v9 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  id v15 = [objc_alloc((Class)objc_opt_class()) initWithPhotoLibrary:v11 withAssetLocalIdentifiers:v12 realTime:v9 progressHandler:v13 completionHandler:v14];

  return v15;
}

- (float)resourceRequirement
{
  return 1.0;
}

- (void)cancel
{
  self->_cancel = 1;
}

- (double)progressWeight:(id)a3
{
  id v3 = a3;
  if ([v3 mediaType] == (id)2)
  {
    [v3 duration];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
    if ([v3 mediaType] == (id)1)
    {
      if (objc_msgSend(v3, "vcp_isLivePhoto")) {
        double v5 = 3.0;
      }
      else {
        double v5 = 1.0;
      }
    }
  }

  return v5;
}

- (double)totalProgressWeight:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    double v7 = 0.0;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        -[VCPMediaAnalysisServiceTask progressWeight:](self, "progressWeight:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
        double v7 = v7 + v9;
      }
      id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  if (v7 < 1.0) {
    double v7 = 1.0;
  }

  return v7;
}

- (int)analyzeAsset:(id)a3 analyses:(id)a4 cancel:(id)a5
{
  id v8 = a3;
  id v66 = a4;
  id v67 = a5;
  double v9 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:self->_photoLibrary];
  v10 = [v8 localIdentifier];
  long long v11 = +[PHAssetResource vcp_allAcceptableResourcesForAsset:v8];
  unint64_t v12 = (unint64_t)objc_msgSend(v8, "vcp_fullAnalysisTypesForResources:", v11) & 0xFFFFFFFFFFEFFFFFLL;
  if (!v12)
  {
    id v15 = 0;
    int v20 = 0;
    goto LABEL_47;
  }
  unsigned int v13 = [v8 isVideo];
  long long v14 = (id *)VCPMovieAnalyzer_ptr;
  if (!v13) {
    long long v14 = (id *)VCPPhotoAnalyzer_ptr;
  }
  unsigned int v62 = [*v14 canAnalyzeUndegraded:v8 withResources:v11];
  id v72 = 0;
  [v9 analysisForAsset:v10 analysis:&v72];
  id v15 = v72;
  if (!v15
    || !objc_msgSend(v8, "vcp_isAnalysisValid:", v15)
    || objc_msgSend(v15, "vcp_degraded") && v62 == objc_msgSend(v15, "vcp_degraded"))
  {

    id v15 = 0;
    goto LABEL_19;
  }
  if ((v12 & ~(unint64_t)objc_msgSend(v15, "vcp_types")) != 0
    || objc_msgSend(v15, "vcp_version") != 70)
  {
LABEL_19:
    v21 = VCPSignPostLog();
    os_signpost_id_t v22 = os_signpost_id_generate(v21);

    v23 = VCPSignPostLog();
    v24 = v23;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "VCPMediaAnalysisServiceTask_UnpackComputeSync", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    v63 = objc_msgSend(v11, "mad_computeSyncResource");
    v65 = objc_msgSend(v63, "mad_existingAnalysisFromComputeSyncForAsset:allowDownload:cancel:", v8, 0, v67);
    v25 = VCPSignPostLog();
    objc_super v26 = v25;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_END, v22, "VCPMediaAnalysisServiceTask_UnpackComputeSync", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    if (v65)
    {
      id v64 = v65;

      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        v27 = VCPLogInstance();
        os_log_type_t v28 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v27, v28))
        {
          v29 = [v8 localIdentifier];
          v30 = MediaAnalysisTypeShortDescription((uint64_t)objc_msgSend(v64, "vcp_types"));
          *(_DWORD *)buf = 138412546;
          v74 = v29;
          __int16 v75 = 2112;
          v76 = v30;
          _os_log_impl((void *)&_mh_execute_header, v27, v28, "  [%@] Reusing analysis results from compute sync (existing: %@)", buf, 0x16u);
        }
      }
    }
    else
    {
      id v64 = v15;
    }
    if ((int)[v9 getBlacklistCountForLocalIdentifier:v10] >= 2)
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v34 = VCPLogInstance();
        os_log_type_t v35 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v34, v35))
        {
          *(_DWORD *)buf = 138412290;
          v74 = v10;
          _os_log_impl((void *)&_mh_execute_header, v34, v35, "  [%@] Asset blacklisted; skipping", buf, 0xCu);
        }
      }
    }
    else
    {
      unsigned int v31 = [v9 addAssetToBlacklist:v10];
      int v20 = v31;
      if (v31 == -108 || v31 == -36 || v31 == -23) {
        goto LABEL_45;
      }
      unsigned int v32 = [v9 commit];
      if (v32 == -108 || v32 == -36)
      {
        int v33 = v32;
      }
      else
      {
        int v33 = v32;
        if (v32 != -23) {
          int v33 = v20;
        }
      }
      if (v32 == -108 || v32 == -36 || v32 == -23)
      {
        int v20 = v33;
        goto LABEL_45;
      }
      id v37 = [v8 mediaType];
      unsigned int v38 = v62;
      if (v37 != (id)2) {
        unsigned int v38 = 0;
      }
      if (v38 == 1)
      {
        id v39 = [objc_alloc((Class)VCPMovieAnalyzer) initWithPHAsset:v8 withExistingAnalysis:v64 forAnalysisTypes:v12];
        v40 = v71;
        v71[0] = _NSConcreteStackBlock;
        v71[1] = 3221225472;
        v71[2] = sub_10007DCF8;
        v71[3] = &unk_10021BF40;
        v71[4] = v67;
        v41 = [v39 analyzeAsset:v71 streamed:0];

        id v42 = [v39 status];
      }
      else
      {
        id v39 = [objc_alloc((Class)VCPPhotoAnalyzer) initWithPHAsset:v8 withExistingAnalysis:v64 forAnalysisTypes:v12];
        v40 = v70;
        v70[0] = _NSConcreteStackBlock;
        v70[1] = 3221225472;
        v70[2] = sub_10007DD60;
        v70[3] = &unk_10021BF40;
        v70[4] = v67;
        v41 = [v39 analyzeAsset:v70 withOptions:0];

        id v42 = [v39 status];
      }
      id v43 = v42;
      id v64 = v41;

      if (v43 == (id)4)
      {
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          v45 = VCPLogInstance();
          os_log_type_t v46 = VCPLogToOSLogType[5];
          if (os_log_type_enabled(v45, v46))
          {
            *(_DWORD *)buf = 138412290;
            v74 = v10;
            _os_log_impl((void *)&_mh_execute_header, v45, v46, "  [%@] Analysis cancelled", buf, 0xCu);
          }
        }
        unsigned int v47 = [v9 decrementBlacklistCountForLocalIdentifier:v10];
        if (v47 == -108 || v47 == -36)
        {
          int v20 = v47;
        }
        else
        {
          int v20 = v47;
          if (v47 != -23) {
            int v20 = v33;
          }
        }
        if (v47 == -108 || v47 == -36 || v47 == -23) {
          goto LABEL_45;
        }
        unsigned int v53 = [v9 commit];
        if (v53 == -108 || v53 == -36)
        {
          int v54 = v53;
        }
        else
        {
          int v54 = v53;
          if (v53 != -23) {
            int v54 = v20;
          }
        }
        if (v53 != -108 && v53 != -36 && v53 != -23)
        {
          int v20 = -128;
          goto LABEL_45;
        }
LABEL_117:
        int v20 = v54;
        goto LABEL_45;
      }
      if (v43 == (id)2)
      {
        unsigned int v44 = [v9 removeLocalIdentifierFromBlacklist:v10];
        if (v44 == -108 || v44 == -36)
        {
          int v20 = v44;
        }
        else
        {
          int v20 = v44;
          if (v44 != -23) {
            int v20 = v33;
          }
        }
        if (v44 == -108 || v44 == -36 || v44 == -23) {
          goto LABEL_45;
        }
        if (v41)
        {
          v50 = MediaAnalysisStripKeyframeResourceResultsFromAnalysis(v41);

          unsigned int v51 = [v9 storeAnalysisForAsset:v8 analysis:v50];
          if (v51 == -108 || v51 == -36)
          {
            int v52 = v51;
          }
          else
          {
            int v52 = v51;
            if (v51 != -23) {
              int v52 = v20;
            }
          }
          if (v51 == -108 || v51 == -36 || v51 == -23)
          {
            id v64 = v50;
            int v20 = v52;
            goto LABEL_45;
          }
          BOOL noResultStrip = self->_noResultStrip;
          v56 = v50;
          if (!self->_noResultStrip)
          {
            v56 = MediaAnalysisStripInternalResultsFromAnalysis(v50);
          }
          v57 = [v8 localIdentifier];
          [v66 setObject:v56 forKey:v57];

          if (!noResultStrip) {
          id v64 = v50;
          }
          int v20 = v52;
        }
        else
        {
          id v64 = 0;
        }
        unsigned int v58 = [v9 commit];
        if (v58 == -108 || v58 == -36)
        {
          int v54 = v58;
        }
        else
        {
          int v54 = v58;
          if (v58 != -23) {
            int v54 = v20;
          }
        }
        if (v58 == -108 || v58 == -36 || v58 == -23) {
          goto LABEL_117;
        }
        if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled])
        {
          v59 = [v8 localIdentifier];
          v60 = +[VSKAsset mad_assetsWithLocalIdentifier:v59 mediaAnalysisResults:v64];

          if ([v60 count])
          {
            photoLibrary = self->_photoLibrary;
            v68[0] = _NSConcreteStackBlock;
            v68[1] = 3221225472;
            v68[2] = sub_10007DDC8;
            v68[3] = &unk_10021BF40;
            id v69 = v67;
            +[MADVectorDatabaseUtilities updateWithAssetsEmbeddings:v60 photoLibrary:photoLibrary cancelBlock:v68 error:0];
          }
        }
      }
      else if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v48 = VCPLogInstance();
        os_log_type_t v49 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v48, v49))
        {
          *(_DWORD *)buf = 138412290;
          v74 = v10;
          _os_log_impl((void *)&_mh_execute_header, v48, v49, "  [%@] Analysis failed to complete", buf, 0xCu);
        }
      }
    }
    int v20 = 0;
LABEL_45:

    id v15 = v64;
LABEL_46:

    goto LABEL_47;
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v16 = VCPLogInstance();
    os_log_type_t v17 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v16, v17))
    {
      *(_DWORD *)buf = 138412290;
      v74 = v10;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "  [%@] Requested analysis exists within MA DB", buf, 0xCu);
    }
  }
  BOOL v18 = self->_noResultStrip;
  v63 = v15;
  if (!self->_noResultStrip)
  {
    v63 = MediaAnalysisStripInternalResultsFromAnalysis(v15);
  }
  id v19 = [v8 localIdentifier];
  [v66 setObject:v63 forKey:v19];

  int v20 = 0;
  if (!v18) {
    goto LABEL_46;
  }
LABEL_47:

  return v20;
}

- (int)run
{
  objc_super v26 = +[NSMutableDictionary dictionary];
  v23 = +[PHAsset vcp_fetchOptionsForLibrary:self->_photoLibrary forTaskID:1];
  v24 = +[PHAsset fetchAssetsWithLocalIdentifiers:options:](PHAsset, "fetchAssetsWithLocalIdentifiers:options:", self->_localIdentifiers);
  -[VCPMediaAnalysisServiceTask totalProgressWeight:](self, "totalProgressWeight:");
  double v4 = v3;
  id progressHandler = (void (**)(double))self->_progressHandler;
  if (progressHandler) {
    progressHandler[2](0.0);
  }
  uint64_t v6 = objc_alloc_init(VCPSystemMonitor);
  double v7 = v6;
  if (self->_realTime || (uint64_t v18 = [(VCPSystemMonitor *)v6 enable], !v18))
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = v24;
    id v8 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v30;
      os_log_type_t v10 = VCPLogToOSLogType[6];
      double v11 = 0.0;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v30 != v9) {
            objc_enumerationMutation(obj);
          }
          unsigned int v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if ((id)[(VCPSystemMonitor *)v7 recommendedState] != (id)2)
          {
            uint64_t v18 = 4294967168;
            goto LABEL_24;
          }
          long long v14 = +[VCPWatchdog sharedWatchdog];
          [v14 pet];

          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            id v15 = VCPLogInstance();
            if (os_log_type_enabled(v15, v10))
            {
              v16 = [v13 localIdentifier];
              *(_DWORD *)buf = 138412290;
              v34 = v16;
              _os_log_impl((void *)&_mh_execute_header, v15, v10, "  [%@] Processing", buf, 0xCu);
            }
          }
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_10007E1E8;
          v27[3] = &unk_10021BFD0;
          v27[4] = self;
          os_log_type_t v28 = v7;
          uint64_t v18 = [(VCPMediaAnalysisServiceTask *)self analyzeAsset:v13 analyses:v26 cancel:v27];

          if (v18) {
            goto LABEL_24;
          }
          [(VCPMediaAnalysisServiceTask *)self progressWeight:v13];
          double v11 = v11 + v19;
          int v20 = (void (**)(double))self->_progressHandler;
          if (v20) {
            v20[2](v11 * 100.0 / v4);
          }
        }
        id v8 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
        uint64_t v18 = 0;
        if (v8) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v18 = 0;
    }
LABEL_24:
  }
  [(VCPSystemMonitor *)v7 disable];
  if (v18) {
    v21 = 0;
  }
  else {
    v21 = v26;
  }
  (*((void (**)(id, void *, uint64_t))self->_completionHandler + 2))(self->_completionHandler, v21, v18);

  return v18;
}

- (BOOL)autoCancellable
{
  return 0;
}

- (BOOL)realTime
{
  return self->_realTime;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_localIdentifiers, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end