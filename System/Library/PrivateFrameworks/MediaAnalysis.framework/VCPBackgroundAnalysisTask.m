@interface VCPBackgroundAnalysisTask
- (VCPBackgroundAnalysisTask)init;
- (unint64_t)missingAnalysisForAsset:(id)a3 existingAnalysis:(id *)a4 resources:(id)a5 forLocalResourcesOnly:(BOOL)a6;
- (unint64_t)missingAnalysisForAsset:(id)a3 withExistingComputeSyncAnalysis:(id *)a4 resources:(id)a5 forLocalResourcesOnly:(BOOL)a6;
- (unint64_t)possibleAnalysisForAsset:(id)a3 withResources:(id)a4 forLocalResourcesOnly:(BOOL)a5;
@end

@implementation VCPBackgroundAnalysisTask

- (VCPBackgroundAnalysisTask)init
{
  return 0;
}

- (unint64_t)possibleAnalysisForAsset:(id)a3 withResources:(id)a4 forLocalResourcesOnly:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = (unint64_t)objc_msgSend(v7, "vcp_fullAnalysisTypesForResources:", v8);
  if (!a5
    && (![v7 isPhoto]
     || objc_msgSend(v8, "vcp_hasLocalPhoto:", objc_msgSend(v7, "hasAdjustments"))))
  {
    v9 |= (unint64_t)objc_msgSend(v7, "vcp_fullAnalysisTypes") & 0xFFFFFFFFFFEFFFFFLL;
  }

  return v9;
}

- (unint64_t)missingAnalysisForAsset:(id)a3 withExistingComputeSyncAnalysis:(id *)a4 resources:(id)a5 forLocalResourcesOnly:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a5;
  v12 = [v10 localIdentifier];
  v13 = +[NSString stringWithFormat:@"  [%@][ComputeSync]", v12];
  v14 = objc_msgSend(v10, "vcp_modificationDate");

  if (!v14)
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v35 = VCPLogInstance();
      os_log_type_t v36 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v35, v36))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v13;
        _os_log_impl((void *)&_mh_execute_header, v35, v36, "%@ Asset missing modification date; skipping analysis with Compute Sync results",
          buf,
          0xCu);
      }
    }
    goto LABEL_33;
  }
  unint64_t v15 = [(VCPBackgroundAnalysisTask *)self possibleAnalysisForAsset:v10 withResources:v11 forLocalResourcesOnly:v6];
  if ((v15 & 0x40000) != 0)
  {
    v16 = StripMovieCurationResultsForEligibleAsset(v10, *a4, v13);
    id v17 = *a4;
    *a4 = v16;
  }
  unint64_t v18 = v15 & 0xFFFFFFFFDFFFFFFFLL;
  if (*a4)
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v19 = VCPLogInstance();
      os_log_type_t v20 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v19, v20))
      {
        v21 = MediaAnalysisTypeShortDescription((uint64_t)objc_msgSend(*a4, "vcp_types"));
        *(_DWORD *)buf = 138412546;
        v45 = v13;
        __int16 v46 = 2112;
        v47 = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "%@ Existing analysis: %@", buf, 0x16u);
      }
    }
    unsigned int v22 = objc_msgSend(*a4, "vcp_degraded");
    id v23 = [v10 mediaType];
    v24 = (id *)VCPPhotoAnalyzer_ptr;
    if (v23 != (id)1) {
      v24 = (id *)VCPMovieAnalyzer_ptr;
    }
    unsigned int v25 = [*v24 canAnalyzeUndegraded:v10 withResources:v11];
    if (objc_msgSend(v10, "vcp_isAnalysisValid:", *a4))
    {
      if (v22 & v25) != 1 || (objc_msgSend(v10, "vcp_isPano"))
      {
        unint64_t v26 = (unint64_t)objc_msgSend(*a4, "vcp_types");
        if ([v10 isVideo] & (v26 >> 45)) {
          v26 |= 0x2000000000000uLL;
        }
        uint64_t v27 = v18 & MediaAnalysisTypesUpdatedSince(objc_msgSend(*a4, "vcp_version"), v10) & v26;
        uint64_t v28 = (v26 ^ v15) & v18;
        if (v27 | v28)
        {
          if ((v22 | v25) == 1)
          {
            if (v27 && (int)MediaAnalysisLogLevel() >= 6)
            {
              v29 = VCPLogInstance();
              os_log_type_t v30 = VCPLogToOSLogType[6];
              if (os_log_type_enabled(v29, v30))
              {
                v31 = MediaAnalysisTypeShortDescription(v27);
                *(_DWORD *)buf = 138412546;
                v45 = v13;
                __int16 v46 = 2112;
                v47 = v31;
                _os_log_impl((void *)&_mh_execute_header, v29, v30, "%@ Analysis version outdated; re-doing updated analyses (%@) with Compute Sync results",
                  buf,
                  0x16u);
              }
            }
            if (v28 && (int)MediaAnalysisLogLevel() >= 6)
            {
              v32 = VCPLogInstance();
              os_log_type_t v33 = VCPLogToOSLogType[6];
              if (os_log_type_enabled(v32, v33))
              {
                v34 = MediaAnalysisTypeShortDescription(v28);
                *(_DWORD *)buf = 138412546;
                v45 = v13;
                __int16 v46 = 2112;
                v47 = v34;
                _os_log_impl((void *)&_mh_execute_header, v32, v33, "%@ Analysis incomplete; performing missing analysis (%@) with Compute Sync results",
                  buf,
                  0x16u);
              }
            }
            unint64_t v18 = v27 | v28;
          }
          goto LABEL_39;
        }
LABEL_33:
        unint64_t v18 = 0;
        goto LABEL_39;
      }
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v41 = VCPLogInstance();
        os_log_type_t v42 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v41, v42))
        {
          *(_DWORD *)buf = 138412290;
          v45 = v13;
          _os_log_impl((void *)&_mh_execute_header, v41, v42, "%@ Undegraded asset available; re-analyzing with Compute Sync results",
            buf,
            0xCu);
        }
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        v37 = VCPLogInstance();
        os_log_type_t v38 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v37, v38))
        {
          *(_DWORD *)buf = 138412290;
          v45 = v13;
          _os_log_impl((void *)&_mh_execute_header, v37, v38, "%@ Asset has been modified; discarding Compute Sync results",
            buf,
            0xCu);
        }
      }
      id v39 = *a4;
      *a4 = 0;
    }
  }
LABEL_39:

  return v18;
}

- (unint64_t)missingAnalysisForAsset:(id)a3 existingAnalysis:(id *)a4 resources:(id)a5 forLocalResourcesOnly:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v55 = a5;
  id v11 = [v10 localIdentifier];
  v12 = +[NSString stringWithFormat:@"  [%@]", v11];
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v13 = VCPLogInstance();
    os_log_type_t v14 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v13, v14))
    {
      *(_DWORD *)buf = 138412290;
      v58 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%@ Processing", buf, 0xCu);
    }
  }
  unint64_t v15 = objc_msgSend(v10, "vcp_modificationDate");
  BOOL v16 = v15 == 0;

  if (!v16)
  {
    id v17 = [(VCPTask *)self photoLibrary];
    unint64_t v18 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v17];

    if ((int)[v18 getBlacklistCountForLocalIdentifier:v11] < 2)
    {
      unint64_t v19 = [(VCPBackgroundAnalysisTask *)self possibleAnalysisForAsset:v10 withResources:v55 forLocalResourcesOnly:v6];
      id v56 = 0;
      [v18 analysisForAsset:v11 analysis:&v56];
      id v20 = v56;
      v53 = v56;
      objc_storeStrong(a4, v20);
      if ((v19 & 0x40000) != 0)
      {
        v21 = StripMovieCurationResultsForEligibleAsset(v10, *a4, v12);
        id v22 = *a4;
        *a4 = v21;
      }
      unint64_t v23 = v19 & 0xFFFFFFFFDFFFFFFFLL;
      if (!*a4) {
        goto LABEL_53;
      }
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v24 = VCPLogInstance();
        os_log_type_t v25 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v24, v25))
        {
          unint64_t v26 = MediaAnalysisTypeShortDescription((uint64_t)objc_msgSend(*a4, "vcp_types"));
          *(_DWORD *)buf = 138412546;
          v58 = v12;
          __int16 v59 = 2112;
          v60 = v26;
          _os_log_impl((void *)&_mh_execute_header, v24, v25, "%@ Existing analysis: %@", buf, 0x16u);
        }
      }
      unsigned int v27 = objc_msgSend(*a4, "vcp_degraded");
      id v28 = [v10 mediaType];
      v29 = (id *)VCPPhotoAnalyzer_ptr;
      if (v28 != (id)1) {
        v29 = (id *)VCPMovieAnalyzer_ptr;
      }
      unsigned int v30 = [*v29 canAnalyzeUndegraded:v10 withResources:v55];
      if ((objc_msgSend(v10, "vcp_isAnalysisValid:", *a4) & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          v45 = VCPLogInstance();
          os_log_type_t v46 = VCPLogToOSLogType[5];
          if (os_log_type_enabled(v45, v46))
          {
            *(_DWORD *)buf = 138412290;
            v58 = v12;
            _os_log_impl((void *)&_mh_execute_header, v45, v46, "%@ Asset has been modified; discarding MA DB results",
              buf,
              0xCu);
          }
        }
        [v18 deleteAnalysisForAsset:v11];
        id v47 = *a4;
        *a4 = 0;

        goto LABEL_53;
      }
      if ((v27 & v30) == 1 && (objc_msgSend(v10, "vcp_isPano") & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          v51 = VCPLogInstance();
          os_log_type_t v52 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v51, v52))
          {
            *(_DWORD *)buf = 138412290;
            v58 = v12;
            _os_log_impl((void *)&_mh_execute_header, v51, v52, "%@ Undegraded asset available; re-analyzing with MA DB results",
              buf,
              0xCu);
          }
        }
        goto LABEL_53;
      }
      unint64_t v31 = (unint64_t)objc_msgSend(*a4, "vcp_types");
      if ([v10 isVideo] & (v31 >> 45)) {
        v31 |= 0x2000000000000uLL;
      }
      uint64_t v32 = v23 & MediaAnalysisTypesUpdatedSince(objc_msgSend(*a4, "vcp_version"), v10) & v31;
      uint64_t v33 = (v31 ^ v19) & v23;
      uint64_t v34 = v32;
      if (v32 | v33)
      {
        if ((v27 | v30) != 1)
        {
LABEL_53:

          goto LABEL_54;
        }
        uint64_t v35 = v32;
        if (v32 && (int)MediaAnalysisLogLevel() >= 6)
        {
          os_log_type_t v36 = VCPLogInstance();
          os_log_type_t v37 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v36, v37))
          {
            os_log_type_t v38 = MediaAnalysisTypeShortDescription(v34);
            *(_DWORD *)buf = 138412546;
            v58 = v12;
            __int16 v59 = 2112;
            v60 = v38;
            _os_log_impl((void *)&_mh_execute_header, v36, v37, "%@ Analysis version outdated; re-doing updated analyses (%@) with MA DB results",
              buf,
              0x16u);
          }
        }
        if (!v33 || (int)MediaAnalysisLogLevel() < 6)
        {
LABEL_52:
          unint64_t v23 = v35 | v33;
          goto LABEL_53;
        }
        id v39 = VCPLogInstance();
        os_log_type_t v40 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v39, v40))
        {
          v41 = MediaAnalysisTypeShortDescription(v33);
          *(_DWORD *)buf = 138412546;
          v58 = v12;
          __int16 v59 = 2112;
          v60 = v41;
          _os_log_impl((void *)&_mh_execute_header, v39, v40, "%@ Analysis incomplete; performing missing analysis (%@) with MA DB results",
            buf,
            0x16u);
        }
      }
      else
      {
        int v48 = objc_msgSend(*a4, "vcp_version");
        uint64_t v35 = v34;
        if (v48 < 70) {
          [v18 bumpAnalysisVersionForAsset:v11];
        }
        if ((int)MediaAnalysisLogLevel() < 7) {
          goto LABEL_52;
        }
        id v39 = VCPLogInstance();
        os_log_type_t v49 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v39, v49))
        {
          *(_DWORD *)buf = 138412290;
          v58 = v12;
          _os_log_impl((void *)&_mh_execute_header, v39, v49, "%@ Analysis complete and up-to-date with MA DB results", buf, 0xCu);
        }
      }

      goto LABEL_52;
    }
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v43 = VCPLogInstance();
      os_log_type_t v44 = VCPLogToOSLogType[5];
      v53 = v43;
      if (os_log_type_enabled(v43, v44))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v12;
        _os_log_impl((void *)&_mh_execute_header, v43, v44, "%@ Asset blacklisted - skipping analysis with MA DB results", buf, 0xCu);
      }
      unint64_t v23 = 0;
      goto LABEL_53;
    }
LABEL_39:
    unint64_t v23 = 0;
LABEL_54:

    goto LABEL_55;
  }
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    unint64_t v18 = VCPLogInstance();
    os_log_type_t v42 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v18, v42))
    {
      *(_DWORD *)buf = 138412290;
      v58 = v12;
      _os_log_impl((void *)&_mh_execute_header, v18, v42, "%@ Asset missing modification date; skipping analysis with MA DB results",
        buf,
        0xCu);
    }
    goto LABEL_39;
  }
  unint64_t v23 = 0;
LABEL_55:

  return v23;
}

@end