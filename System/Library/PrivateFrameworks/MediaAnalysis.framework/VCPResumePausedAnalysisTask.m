@interface VCPResumePausedAnalysisTask
+ (id)taskWithPhotoLibrary:(id)a3;
- (int)mainInternal;
@end

@implementation VCPResumePausedAnalysisTask

+ (id)taskWithPhotoLibrary:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithPhotoLibrary:v3];

  return v4;
}

- (int)mainInternal
{
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v3, v4))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Checking for paused analysis...", (uint8_t *)&buf, 2u);
    }
  }
  v5 = [(VCPTask *)self photoLibrary];
  v6 = +[VCPPausedAnalysis persistedPausedAnalysisFromPhotoLibrary:v5];

  if (v6)
  {
    v7 = [v6 asset];
    v8 = [v7 localIdentifier];
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v9 = VCPLogInstance();
      os_log_type_t v10 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v9, v10))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "  [%@] Resuming Movie Analysis", (uint8_t *)&buf, 0xCu);
      }
    }
    v11 = [(VCPTask *)self photoLibrary];
    v12 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v11];

    unsigned int v13 = [v12 addAssetToBlacklist:v8];
    int v14 = v13;
    if (v13 == -108 || v13 == -36 || v13 == -23) {
      goto LABEL_31;
    }
    unsigned int v15 = [v12 commit];
    if (v15 == -108 || v15 == -36)
    {
      int v16 = v15;
    }
    else
    {
      int v16 = v15;
      if (v15 != -23) {
        int v16 = v14;
      }
    }
    if (v15 == -108 || v15 == -36 || v15 == -23)
    {
      int v14 = v16;
LABEL_31:

      goto LABEL_32;
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v59 = 0x3032000000;
    v60 = sub_10015B8C8;
    v61 = sub_10015B8D8;
    id v62 = [v6 analysis];
    memset(&v56, 0, sizeof(v56));
    v17 = *(void **)(*((void *)&buf + 1) + 40);
    if (!v17 || (objc_msgSend(v17, "vcp_syncPoint"), (v56.flags & 1) == 0))
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v18 = VCPLogInstance();
        os_log_type_t v19 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v18, v19))
        {
          LODWORD(v63.value) = 138412290;
          *(CMTimeValue *)((char *)&v63.value + 4) = (CMTimeValue)v8;
          _os_log_impl((void *)&_mh_execute_header, v18, v19, "  [%@] Failed to resume paused analysis (non-fatal)", (uint8_t *)&v63, 0xCu);
        }
      }
      goto LABEL_29;
    }
    if ((objc_msgSend(v7, "vcp_isAnalysisValid:", *(void *)(*((void *)&buf + 1) + 40)) & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v27 = VCPLogInstance();
        os_log_type_t v28 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v27, v28))
        {
          LODWORD(v63.value) = 138412290;
          *(CMTimeValue *)((char *)&v63.value + 4) = (CMTimeValue)v8;
          _os_log_impl((void *)&_mh_execute_header, v27, v28, "  [%@] Asset modified since analysis paused; discarding paused analysis",
            (uint8_t *)&v63,
            0xCu);
        }
      }
      unsigned int v29 = [v12 decrementBlacklistCountForLocalIdentifier:v8];
      if (v29 == -108 || v29 == -36)
      {
        unsigned int v30 = v29;
      }
      else
      {
        unsigned int v30 = v29;
        if (v29 != -23) {
          unsigned int v30 = v16;
        }
      }
      if (v29 == -108 || v29 == -36 || v29 == -23)
      {
        int v14 = v30;
        goto LABEL_30;
      }
      unsigned int v31 = [v12 commit];
      if (v31 == -108 || v31 == -36)
      {
        int v14 = v31;
      }
      else
      {
        int v14 = v31;
        if (v31 != -23) {
          int v14 = v30;
        }
      }
      if (v31 == -108 || v31 == -36 || v31 == -23) {
        goto LABEL_30;
      }
LABEL_29:
      int v14 = 0;
LABEL_30:
      _Block_object_dispose(&buf, 8);

      goto LABEL_31;
    }
    id v21 = objc_alloc((Class)VCPMovieAnalyzer);
    id v22 = [v21 initWithPHAsset:v7 withPausedAnalysis:*(void *)(*((void *)&buf + 1) + 40) forAnalysisTypes:VCPMAFullAnalysisTypesMovie];
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_10015B8E0;
    v52[3] = &unk_10021C020;
    p_long long buf = &buf;
    id v23 = v22;
    id v53 = v23;
    v54 = self;
    v50 = objc_retainBlock(v52);
    v24 = +[VCPMADQoSManager sharedManager];
    [v24 runBlock:v50 withTaskID:1];

    id v25 = [v23 status];
    if (v25 != (id)4)
    {
      if (v25 == (id)3)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v36 = VCPLogInstance();
          os_log_type_t v37 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v36, v37))
          {
            LODWORD(v63.value) = 138412290;
            *(CMTimeValue *)((char *)&v63.value + 4) = (CMTimeValue)v8;
            _os_log_impl((void *)&_mh_execute_header, v36, v37, "  [%@] Analysis failed", (uint8_t *)&v63, 0xCu);
          }
        }
      }
      else if (v25 == (id)2)
      {
        unsigned int v26 = [v12 storeAnalysisForAsset:v7 analysis:*(void *)(*((void *)&buf + 1) + 40)];
        if (v26 == -108 || v26 == -36)
        {
          int v14 = v26;
        }
        else
        {
          int v14 = v26;
          if (v26 != -23) {
            int v14 = v16;
          }
        }
        if (v26 == -108 || v26 == -36 || v26 == -23) {
          goto LABEL_103;
        }
        unsigned int v38 = [v12 removeLocalIdentifierFromBlacklist:v8];
        if (v38 == -108 || v38 == -36)
        {
          int v39 = v38;
        }
        else
        {
          int v39 = v38;
          if (v38 != -23) {
            int v39 = v14;
          }
        }
        if (v38 == -108 || v38 == -36 || v38 == -23)
        {
          int v14 = v39;
          goto LABEL_103;
        }
        unsigned int v45 = [v12 commit];
        if (v45 == -108 || v45 == -36)
        {
          int v14 = v45;
        }
        else
        {
          int v14 = v45;
          if (v45 != -23) {
            int v14 = v39;
          }
        }
        if (v45 == -108 || v45 == -36 || v45 == -23) {
          goto LABEL_103;
        }
        if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled])
        {
          v46 = [v7 localIdentifier];
          v47 = +[VSKAsset mad_assetsWithLocalIdentifier:v46 mediaAnalysisResults:*(void *)(*((void *)&buf + 1) + 40)];

          if ([v47 count])
          {
            v48 = [(VCPTask *)self photoLibrary];
            v51[0] = _NSConcreteStackBlock;
            v51[1] = 3221225472;
            v51[2] = sub_10015B9F8;
            v51[3] = &unk_100219D98;
            v51[4] = self;
            +[MADVectorDatabaseUtilities updateWithAssetsEmbeddings:v47 photoLibrary:v48 cancelBlock:v51 error:0];
          }
        }
      }
      int v14 = 0;
LABEL_103:

      goto LABEL_30;
    }
    v32 = *(void **)(*((void *)&buf + 1) + 40);
    if (!v32) {
      goto LABEL_102;
    }
    objc_msgSend(v32, "vcp_syncPoint");
    if (!((unsigned __int128)0 >> 96))
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v33 = VCPLogInstance();
        os_log_type_t v34 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v33, v34))
        {
          LODWORD(v63.value) = 138412290;
          *(CMTimeValue *)((char *)&v63.value + 4) = (CMTimeValue)v8;
          v35 = "  [%@] Failed to resume paused analysis (non-fatal)";
LABEL_100:
          _os_log_impl((void *)&_mh_execute_header, v33, v34, v35, (uint8_t *)&v63, 0xCu);
          goto LABEL_101;
        }
        goto LABEL_101;
      }
      goto LABEL_102;
    }
    CMTime v63 = v56;
    memset(&time2, 0, sizeof(time2));
    if (CMTimeCompare(&v63, &time2) < 0)
    {
      unsigned int v43 = [v12 decrementBlacklistCountForLocalIdentifier:v8];
      if (v43 == -108 || v43 == -36)
      {
        unsigned int v44 = v43;
      }
      else
      {
        unsigned int v44 = v43;
        if (v43 != -23) {
          unsigned int v44 = v16;
        }
      }
      if (v43 == -108 || v43 == -36 || v43 == -23)
      {
        int v14 = v44;
        goto LABEL_103;
      }
      unsigned int v49 = [v12 commit];
      if (v49 == -108 || v49 == -36)
      {
        int v14 = v49;
      }
      else
      {
        int v14 = v49;
        if (v49 != -23) {
          int v14 = v44;
        }
      }
      if (v49 == -108 || v49 == -36 || v49 == -23) {
        goto LABEL_103;
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        v40 = VCPLogInstance();
        os_log_type_t v41 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v40, v41))
        {
          LODWORD(v63.value) = 138412290;
          *(CMTimeValue *)((char *)&v63.value + 4) = (CMTimeValue)v8;
          _os_log_impl((void *)&_mh_execute_header, v40, v41, "  [%@] Pause/resume made no progress", (uint8_t *)&v63, 0xCu);
        }
      }
      if ((int)[v12 getBlacklistCountForLocalIdentifier:v8] >= 2)
      {
        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          v33 = VCPLogInstance();
          os_log_type_t v34 = VCPLogToOSLogType[4];
          if (os_log_type_enabled(v33, v34))
          {
            LODWORD(v63.value) = 138412290;
            *(CMTimeValue *)((char *)&v63.value + 4) = (CMTimeValue)v8;
            v35 = "  [%@] Asset blacklisted; discarding paused analysis";
            goto LABEL_100;
          }
LABEL_101:
        }
LABEL_102:
        int v14 = -128;
        goto LABEL_103;
      }
    }
    v42 = +[VCPPausedAnalysis pausedAnalysis:*(void *)(*((void *)&buf + 1) + 40) forAsset:v7];
    [v42 persist];

    goto LABEL_102;
  }
  int v14 = 0;
LABEL_32:

  return v14;
}

@end