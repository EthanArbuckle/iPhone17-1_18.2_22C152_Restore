@interface MADVectorDatabaseUtilities
+ (int)_deepSyncWithPhotoLibrary:(id)a3 cancelBlock:(id)a4 error:(id *)a5;
+ (int)_updateWithLocalIdentifiers:(id)a3 photoLibrary:(id)a4 cancelBlock:(id)a5 error:(id *)a6;
+ (int)syncWithPhotoLibrary:(id)a3 ignoreExpiration:(BOOL)a4 threshold:(double)a5 cancelBlock:(id)a6 error:(id *)a7;
+ (int)updateWithAssetsEmbeddings:(id)a3 photoLibrary:(id)a4 cancelBlock:(id)a5 error:(id *)a6;
@end

@implementation MADVectorDatabaseUtilities

+ (int)updateWithAssetsEmbeddings:(id)a3 photoLibrary:(id)a4 cancelBlock:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  v11 = (unsigned int (**)(void))a5;
  v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lu assets", [v9 count]);
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    v12 = VCPLogInstance();
    os_log_type_t v13 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v12, v13))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v32;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "[VSKDBUtil] Updating with %@", buf, 0xCu);
    }
  }
  if (v11 && v11[2](v11))
  {
    if (!a6)
    {
      int v16 = -128;
      goto LABEL_31;
    }
    NSErrorUserInfoKey v38 = NSLocalizedDescriptionKey;
    v14 = +[NSString stringWithFormat:@"[VSKDBUtil] Cancelled during updateWithAssetsEmbeddings"];
    v39 = v14;
    id v15 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    *a6 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v15];
    int v16 = -128;
  }
  else
  {
    v17 = +[VCPWatchdog sharedWatchdog];
    [v17 pet];

    uint64_t v18 = mach_absolute_time();
    v19 = VCPSignPostLog();
    os_signpost_id_t v20 = os_signpost_id_generate(v19);

    v21 = VCPSignPostLog();
    v22 = v21;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v32;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "MADVectorDatabaseUtilities_updateWithAssetsEmbeddings", "%@", buf, 0xCu);
    }

    id v23 = v10;
    v14 = +[MADVectorDatabaseManager sharedDatabaseWithPhotoLibrary:v10];
    id v33 = 0;
    unsigned int v24 = [v14 insertOrReplaceAssetsEmbeddings:v9 error:&v33];
    id v15 = v33;
    if (v24)
    {
      id v10 = v23;
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v25 = VCPLogInstance();
        os_log_type_t v26 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v25, v26))
        {
          *(_DWORD *)buf = 138412546;
          v35 = v32;
          __int16 v36 = 2112;
          id v37 = v15;
          _os_log_impl((void *)&_mh_execute_header, v25, v26, "[VSKDBUtil] Failed to update embeddings for %@; skipping - %@",
            buf,
            0x16u);
        }
      }
      if (a6)
      {
        id v10 = v23;
        *a6 = [v15 copy];
      }
      int v16 = -18;
    }
    else
    {
      v27 = VCPSignPostLog();
      v28 = v27;
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v32;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_END, v20, "MADVectorDatabaseUtilities_updateWithAssetsEmbeddings", "%@", buf, 0xCu);
      }

      if (v18)
      {
        mach_absolute_time();
        VCPPerformance_LogMeasurement();
      }
      if ((int)MediaAnalysisLogLevel() < 6)
      {
        int v16 = 0;
        id v10 = v23;
      }
      else
      {
        id v10 = v23;
        v29 = VCPLogInstance();
        os_log_type_t v30 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v29, v30))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v32;
          _os_log_impl((void *)&_mh_execute_header, v29, v30, "[VSKDBUtil] Updated vectorDatabase with %@", buf, 0xCu);
        }

        int v16 = 0;
      }
    }
  }

LABEL_31:
  return v16;
}

+ (int)_updateWithLocalIdentifiers:(id)a3 photoLibrary:(id)a4 cancelBlock:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v86 = a4;
  id v9 = a5;
  v87 = v8;
  v85 = v9;
  v88 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lu localIdentifiers", [v8 count]);
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    id v10 = VCPLogInstance();
    os_log_type_t v11 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v10, v11))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v112 = (uint64_t)v88;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "[VSKDBUtil] Updating with %@", buf, 0xCu);
    }

    id v9 = v85;
  }
  if (!v9 || !(*((unsigned int (**)(id))v9 + 2))(v9))
  {
    os_log_type_t v13 = +[VCPWatchdog sharedWatchdog];
    [v13 pet];

    v14 = VCPSignPostLog();
    os_signpost_id_t v15 = os_signpost_id_generate(v14);

    int v16 = VCPSignPostLog();
    v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v112 = (uint64_t)v88;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "MADVectorDatabaseUtilities_Update_FetchProperties", "%@", buf, 0xCu);
    }

    v92 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v86];
    v97 = +[NSMutableDictionary dictionary];
    int v12 = objc_msgSend(v92, "queryHeadersForAssets:analyses:", v8);
    if (v12)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        uint64_t v18 = VCPLogInstance();
        os_log_type_t v19 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v18, v19))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v112 = (uint64_t)v88;
          _os_log_impl((void *)&_mh_execute_header, v18, v19, "[VSKDBUtil] Failed to fetch analysis properties for %@", buf, 0xCu);
        }
      }
      if (!a6) {
        goto LABEL_114;
      }
      NSErrorUserInfoKey v116 = NSLocalizedDescriptionKey;
      v96 = +[NSString stringWithFormat:@"[VSKDBUtil] Failed to fetch analysis properties for %@", v88];
      v117 = v96;
      v91 = +[NSDictionary dictionaryWithObjects:&v117 forKeys:&v116 count:1];
      +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v12);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_113;
    }
    os_signpost_id_t v20 = VCPSignPostLog();
    v21 = v20;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v112 = (uint64_t)v88;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_END, v15, "MADVectorDatabaseUtilities_Update_FetchProperties", "%@", buf, 0xCu);
    }

    v96 = +[NSMutableSet set];
    v91 = +[NSMutableSet set];
    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    id v22 = v8;
    id v23 = [v22 countByEnumeratingWithState:&v104 objects:v115 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v105;
      os_log_type_t type = VCPLogToOSLogType[5];
      os_log_type_t v89 = VCPLogToOSLogType[3];
      os_log_type_t v25 = VCPLogToOSLogType[4];
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v105 != v24) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v104 + 1) + 8 * i);
          v29 = [v97 objectForKeyedSubscript:v27];
          os_log_type_t v30 = v29;
          if (!v29)
          {
            if ((int)MediaAnalysisLogLevel() < 4) {
              goto LABEL_54;
            }
            v31 = VCPLogInstance();
            if (os_log_type_enabled(v31, v25))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v112 = (uint64_t)v27;
              id v33 = v31;
              os_log_type_t v34 = v25;
              v35 = "[VSKDBUtil][%@] No analysis record";
              goto LABEL_35;
            }
LABEL_37:

            goto LABEL_54;
          }
          if ((int)objc_msgSend(v29, "vcp_version") < 70)
          {
            if ((int)MediaAnalysisLogLevel() < 4) {
              goto LABEL_54;
            }
            v31 = VCPLogInstance();
            if (!os_log_type_enabled(v31, v25)) {
              goto LABEL_37;
            }
            unsigned int v32 = objc_msgSend(v30, "vcp_version");
            *(_DWORD *)buf = 138412802;
            uint64_t v112 = (uint64_t)v27;
            __int16 v113 = 1024;
            *(_DWORD *)v114 = v32;
            *(_WORD *)&v114[4] = 1024;
            *(_DWORD *)&v114[6] = 70;
            id v33 = v31;
            os_log_type_t v34 = v25;
            v35 = "[VSKDBUtil][%@] Analysis version %d < min version for forward compatible embedding (%d)";
            uint32_t v36 = 24;
LABEL_36:
            _os_log_impl((void *)&_mh_execute_header, v33, v34, v35, buf, v36);
            goto LABEL_37;
          }
          if (objc_msgSend(v30, "vcp_degraded") && (int)MediaAnalysisLogLevel() >= 5)
          {
            id v37 = VCPLogInstance();
            if (os_log_type_enabled(v37, type))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v112 = (uint64_t)v27;
              _os_log_impl((void *)&_mh_execute_header, v37, type, "[VSKDBUtil][%@] Using analysis results on degraded resource", buf, 0xCu);
            }
          }
          unsigned int v38 = +[VCPVideoCNNAnalyzer isMUBackboneEnabled];
          v39 = v96;
          if (!v38) {
            goto LABEL_53;
          }
          unint64_t v40 = (unint64_t)objc_msgSend(v30, "vcp_types");
          v39 = v96;
          if ((v40 & 0x1000000000000) != 0) {
            goto LABEL_53;
          }
          if (![v92 queryAttemptsForLocalIdentifier:v27 andTaskID:255])
          {
            int v41 = MediaAnalysisLogLevel();
            v39 = v91;
            if (v41 >= 3)
            {
              v42 = VCPLogInstance();
              if (os_log_type_enabled(v42, v89))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v112 = (uint64_t)v27;
                _os_log_impl((void *)&_mh_execute_header, v42, v89, "[VSKDBUtil][%@] Analysis missing Image Embedding", buf, 0xCu);
              }

              v39 = v91;
            }
LABEL_53:
            [v39 addObject:v27];
            goto LABEL_54;
          }
          if ((int)MediaAnalysisLogLevel() >= 5)
          {
            v31 = VCPLogInstance();
            if (!os_log_type_enabled(v31, type)) {
              goto LABEL_37;
            }
            *(_DWORD *)buf = 138412290;
            uint64_t v112 = (uint64_t)v27;
            id v33 = v31;
            os_log_type_t v34 = type;
            v35 = "[VSKDBUtil][%@] Failed analysis missing Image Embedding (tracked)";
LABEL_35:
            uint32_t v36 = 12;
            goto LABEL_36;
          }
LABEL_54:
        }
        id v23 = [v22 countByEnumeratingWithState:&v104 objects:v115 count:16];
      }
      while (v23);
    }

    id v43 = [v91 count];
    if (v43)
    {
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        v44 = VCPLogInstance();
        os_log_type_t v45 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v44, v45))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v112 = (uint64_t)v43;
          _os_log_impl((void *)&_mh_execute_header, v44, v45, "[VSKDBUtil] Resetting mediaAnalysisImageVersion and imageEmbeddingVersion (%lu assets)", buf, 0xCu);
        }
      }
      uint64_t v46 = mach_absolute_time();
      v47 = VCPSignPostLog();
      os_signpost_id_t v48 = os_signpost_id_generate(v47);

      v49 = VCPSignPostLog();
      v50 = v49;
      if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v50, OS_SIGNPOST_INTERVAL_BEGIN, v48, "VSKDBUtil_ResetAnalysisVersion", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      v51 = +[VCPWatchdog sharedWatchdog];
      [v51 pet];

      v52 = [v91 allObjects];
      id v103 = 0;
      unsigned __int8 v53 = [v86 resetStateForMediaProcessingTaskID:17 assetIdentifiers:v52 resetOptions:1025 error:&v103];
      id v54 = v103;

      if ((v53 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
      {
        v55 = VCPLogInstance();
        os_log_type_t v56 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v55, v56))
        {
          *(_DWORD *)buf = 134218242;
          uint64_t v112 = (uint64_t)v43;
          __int16 v113 = 2112;
          *(void *)v114 = v54;
          _os_log_impl((void *)&_mh_execute_header, v55, v56, "[VSKDBUtil] Failed to reset mediaAnalysisImageVersion and imageEmbeddingVersion (%lu assets) - %@", buf, 0x16u);
        }
      }
      v57 = VCPSignPostLog();
      v58 = v57;
      if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v58, OS_SIGNPOST_INTERVAL_END, v48, "VSKDBUtil_ResetAnalysisVersion", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      if (v46)
      {
        mach_absolute_time();
        VCPPerformance_LogMeasurement();
      }
    }
    uint64_t v90 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lu localIdentifiers", [v96 count]);

    v59 = VCPSignPostLog();
    os_signpost_id_t v60 = os_signpost_id_generate(v59);

    v61 = VCPSignPostLog();
    v62 = v61;
    if (v60 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v112 = v90;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v62, OS_SIGNPOST_INTERVAL_BEGIN, v60, "MADVectorDatabaseUtilities_Update_FetchEmbeddings", "%@", buf, 0xCu);
    }

    v63 = [v96 allObjects];
    id v102 = 0;
    int v12 = [v92 queryAnalysisResultsForAssets:v63 results:&v102];
    id v64 = v102;

    if (v12)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v65 = VCPLogInstance();
        os_log_type_t v66 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v65, v66))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v112 = v90;
          _os_log_impl((void *)&_mh_execute_header, v65, v66, "[VSKDBUtil] Failed to fetch analysis results for %@", buf, 0xCu);
        }
      }
      if (!a6) {
        goto LABEL_112;
      }
      NSErrorUserInfoKey v109 = NSLocalizedDescriptionKey;
      uint64_t v110 = +[NSString stringWithFormat:@"[VSKDBUtil] Failed to fetch analysis results for %@", v90];
      typea = (void *)v110;
      v67 = +[NSDictionary dictionaryWithObjects:&v110 forKeys:&v109 count:1];
      *a6 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v12 userInfo:v67];
      goto LABEL_85;
    }
    v69 = VCPSignPostLog();
    v70 = v69;
    if (v60 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v69))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v112 = v90;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v70, OS_SIGNPOST_INTERVAL_END, v60, "MADVectorDatabaseUtilities_Update_FetchEmbeddings", "%@", buf, 0xCu);
    }

    typea = +[NSMutableArray array];
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    id v71 = v96;
    id v72 = [v71 countByEnumeratingWithState:&v98 objects:v108 count:16];
    if (!v72)
    {
LABEL_104:

      v68 = typea;
      if ([typea count])
      {
        int v12 = [(id)objc_opt_class() updateWithAssetsEmbeddings:typea photoLibrary:v86 cancelBlock:v85 error:a6];
        goto LABEL_111;
      }
      if ((int)MediaAnalysisLogLevel() < 4)
      {
        int v12 = 0;
        goto LABEL_111;
      }
      v67 = VCPLogInstance();
      os_log_type_t v82 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v67, v82))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v67, v82, "[VSKDBUtil] No assets embeddings to be inserted/updated", buf, 2u);
      }
      int v12 = 0;
LABEL_85:

      v68 = typea;
LABEL_111:

LABEL_112:
      v88 = (void *)v90;
LABEL_113:

      goto LABEL_114;
    }
    uint64_t v73 = *(void *)v99;
    os_log_type_t v93 = VCPLogToOSLogType[4];
LABEL_92:
    uint64_t v74 = 0;
    while (1)
    {
      if (*(void *)v99 != v73) {
        objc_enumerationMutation(v71);
      }
      v75 = *(void **)(*((void *)&v98 + 1) + 8 * v74);
      v77 = [v64 objectForKeyedSubscript:v75];
      BOOL v78 = v77 == 0;

      if (v78)
      {
        if ((int)MediaAnalysisLogLevel() < 4) {
          goto LABEL_98;
        }
        v80 = VCPLogInstance();
        if (os_log_type_enabled(v80, v93))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v112 = (uint64_t)v75;
          _os_log_impl((void *)&_mh_execute_header, v80, v93, "[VSKDBUtil][%@] No full analysis results", buf, 0xCu);
        }
      }
      else
      {
        v79 = [v64 objectForKeyedSubscript:v75];
        v80 = +[VSKAsset mad_assetsWithLocalIdentifier:v75 mediaAnalysisResults:v79];

        [typea addObjectsFromArray:v80];
      }

LABEL_98:
      if (v72 == (id)++v74)
      {
        id v81 = [v71 countByEnumeratingWithState:&v98 objects:v108 count:16];
        id v72 = v81;
        if (!v81) {
          goto LABEL_104;
        }
        goto LABEL_92;
      }
    }
  }
  if (a6)
  {
    NSErrorUserInfoKey v118 = NSLocalizedDescriptionKey;
    v92 = +[NSString stringWithFormat:@"[VSKDBUtil] Cancelled during _updateWithLocalIdentifiers"];
    v119 = v92;
    v97 = +[NSDictionary dictionaryWithObjects:&v119 forKeys:&v118 count:1];
    +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -128);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    int v12 = -128;
LABEL_114:

    goto LABEL_115;
  }
  int v12 = -128;
LABEL_115:

  return v12;
}

+ (int)_deepSyncWithPhotoLibrary:(id)a3 cancelBlock:(id)a4 error:(id *)a5
{
  id v106 = a3;
  v117 = (unsigned int (**)(void))a4;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v6 = VCPLogInstance();
    os_log_type_t v7 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v6, v7))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v151 = @"[VSKDBUtil][DeepSync]";
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "%@ Starting ...", buf, 0xCu);
    }
  }
  v111 = +[MADVectorDatabaseManager sharedDatabaseWithPhotoLibrary:v106];
  long long v105 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v106];
  uint64_t v108 = mach_absolute_time();
  id v8 = VCPSignPostLog();
  os_signpost_id_t spid = os_signpost_id_generate(v8);

  id v9 = VCPSignPostLog();
  id v10 = v9;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, spid, "MADVectorDatabaseUtilities_DeepSync_VSKLoop", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  id v141 = 0;
  id v120 = [v111 assetCountWithError:&v141];
  id v115 = v141;
  uint64_t v110 = +[PHAsset vcp_fetchOptionsForLibrary:v106 forTaskID:1];
  if (v120)
  {
    unint64_t v11 = 0;
    os_log_type_t type = VCPLogToOSLogType[6];
    os_log_type_t v112 = VCPLogToOSLogType[3];
    do
    {
      if (v117 && v117[2]())
      {
        if (!a5)
        {
          int v124 = -128;
          int v15 = 1;
          goto LABEL_38;
        }
        NSErrorUserInfoKey v157 = NSLocalizedDescriptionKey;
        os_log_type_t v13 = +[NSString stringWithFormat:@"%@ Cancelled during looping VSKDB", @"[VSKDBUtil][DeepSync]"];
        v158 = v13;
        id v14 = +[NSDictionary dictionaryWithObjects:&v158 forKeys:&v157 count:1];
        *a5 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v14];
        int v124 = -128;
        int v15 = 1;
      }
      else
      {
        int v16 = +[VCPWatchdog sharedWatchdog];
        [v16 pet];

        os_log_type_t v13 = +[NSMutableSet set];
        id v140 = v115;
        v17 = [v111 fetchAllAssetsWithLimit:1000 offset:v11 error:&v140];
        id v122 = v140;

        long long v138 = 0u;
        long long v139 = 0u;
        long long v136 = 0u;
        long long v137 = 0u;
        id v14 = v17;
        id v18 = [v14 countByEnumeratingWithState:&v136 objects:v156 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v137;
          do
          {
            for (i = 0; i != v18; i = (char *)i + 1)
            {
              if (*(void *)v137 != v19) {
                objc_enumerationMutation(v14);
              }
              v21 = *(void **)(*((void *)&v136 + 1) + 8 * i);
              id v23 = objc_msgSend(v21, "mad_photosLocalIdentifier");
              [v13 addObject:v23];
            }
            id v18 = [v14 countByEnumeratingWithState:&v136 objects:v156 count:16];
          }
          while (v18);
        }

        uint64_t v24 = [v13 allObjects];
        os_log_type_t v25 = +[PHAsset fetchAssetsWithLocalIdentifiers:v24 options:v110];

        id v26 = [v25 count];
        if (v26 == [v13 count]) {
          goto LABEL_35;
        }
        for (unint64_t j = 0; j < (unint64_t)[v25 count]; ++j)
        {
          v29 = [v25 objectAtIndexedSubscript:j];
          os_log_type_t v30 = [v29 localIdentifier];
          [v13 removeObject:v30];
        }
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          v31 = VCPLogInstance();
          if (os_log_type_enabled(v31, type))
          {
            id v32 = [v13 count];
            *(_DWORD *)buf = 138412802;
            CFStringRef v151 = @"[VSKDBUtil][DeepSync]";
            __int16 v152 = 2048;
            id v153 = v32;
            __int16 v154 = 2112;
            v155 = v13;
            _os_log_impl((void *)&_mh_execute_header, v31, type, "%@ Deleting %lu assets from VSKDB ... %@", buf, 0x20u);
          }
        }
        id v33 = [v13 allObjects];
        unsigned int v34 = [v111 removeEmbeddingsWithLocalIdentifiers:v33 error:a5];

        if (!v34)
        {
LABEL_35:
          int v15 = 0;
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v35 = VCPLogInstance();
            if (os_log_type_enabled(v35, v112))
            {
              *(_DWORD *)buf = 138412290;
              CFStringRef v151 = @"[VSKDBUtil][DeepSync]";
              _os_log_impl((void *)&_mh_execute_header, v35, v112, "%@ Failed to remove embeddings from VSKDB", buf, 0xCu);
            }
          }
          int v15 = 1;
          int v124 = v34;
        }

        id v115 = v122;
      }

LABEL_38:
      if (v15) {
        goto LABEL_152;
      }
      v11 += 1000;
    }
    while (v11 < (unint64_t)v120);
  }
  uint32_t v36 = VCPSignPostLog();
  id v37 = v36;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v37, OS_SIGNPOST_INTERVAL_END, spid, "MADVectorDatabaseUtilities_DeepSync_VSKLoop", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  if (v108)
  {
    mach_absolute_time();
    VCPPerformance_LogMeasurement();
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    unsigned int v38 = VCPLogInstance();
    os_log_type_t v39 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v38, v39))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v151 = @"[VSKDBUtil][DeepSync]";
      _os_log_impl((void *)&_mh_execute_header, v38, v39, "%@ Stage 1 - VSKLoop finished", buf, 0xCu);
    }
  }
  uint64_t v102 = mach_absolute_time();
  unint64_t v40 = VCPSignPostLog();
  os_signpost_id_t v103 = os_signpost_id_generate(v40);

  int v41 = VCPSignPostLog();
  v42 = v41;
  if (v103 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v42, OS_SIGNPOST_INTERVAL_BEGIN, v103, "MADVectorDatabaseUtilities_DeepSync_MALoop", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  id v43 = +[VCPAnalyzedAssets assetsFromPhotoLibrary:v106];
  unint64_t v118 = 0;
  uint64_t v116 = -1;
  os_log_type_t v121 = VCPLogToOSLogType[3];
  os_log_type_t v104 = VCPLogToOSLogType[6];
  while (v118 < (unint64_t)[v43 count])
  {
    if (!v117 || !v117[2]())
    {
      uint64_t v46 = +[VCPWatchdog sharedWatchdog];
      [v46 pet];

      v123 = +[NSMutableArray array];
      uint64_t v47 = v116;
      while (1)
      {
        id v48 = [v43 count];
        if ((unint64_t)v48 >= v118 + 1000) {
          unint64_t v49 = v118 + 1000;
        }
        else {
          unint64_t v49 = (unint64_t)v48;
        }
        if (++v47 >= v49)
        {
          id v134 = v115;
          NSErrorUserInfoKey v109 = [v111 fetchAssetsWithLocalIdentifiers:v123 error:&v134];
          id v107 = v134;

          v57 = +[NSMutableSet set];
          long long v132 = 0u;
          long long v133 = 0u;
          long long v130 = 0u;
          long long v131 = 0u;
          id v44 = v109;
          id v58 = [v44 countByEnumeratingWithState:&v130 objects:v145 count:16];
          if (v58)
          {
            uint64_t v59 = *(void *)v131;
            do
            {
              for (k = 0; k != v58; k = (char *)k + 1)
              {
                if (*(void *)v131 != v59) {
                  objc_enumerationMutation(v44);
                }
                v61 = *(void **)(*((void *)&v130 + 1) + 8 * (void)k);
                v63 = objc_msgSend(v61, "mad_photosLocalIdentifier");
                [v57 addObject:v63];
              }
              id v58 = [v44 countByEnumeratingWithState:&v130 objects:v145 count:16];
            }
            while (v58);
          }

          id v64 = [v57 count];
          if (v64 == [v123 count])
          {
            int v45 = 0;
          }
          else
          {
            v65 = +[NSMutableSet setWithArray:v123];
            long long v128 = 0u;
            long long v129 = 0u;
            long long v126 = 0u;
            long long v127 = 0u;
            id v66 = v57;
            id v67 = [v66 countByEnumeratingWithState:&v126 objects:v144 count:16];
            if (v67)
            {
              uint64_t v68 = *(void *)v127;
              do
              {
                for (m = 0; m != v67; m = (char *)m + 1)
                {
                  if (*(void *)v127 != v68) {
                    objc_enumerationMutation(v66);
                  }
                  uint64_t v70 = *(void *)(*((void *)&v126 + 1) + 8 * (void)m);
                  [v65 removeObject:v70];
                }
                id v67 = [v66 countByEnumeratingWithState:&v126 objects:v144 count:16];
              }
              while (v67);
            }

            if ((int)MediaAnalysisLogLevel() >= 6)
            {
              id v72 = VCPLogInstance();
              if (os_log_type_enabled(v72, v104))
              {
                id v73 = [v65 count];
                *(_DWORD *)buf = 138412802;
                CFStringRef v151 = @"[VSKDBUtil][DeepSync]";
                __int16 v152 = 2048;
                id v153 = v73;
                __int16 v154 = 2112;
                v155 = v65;
                _os_log_impl((void *)&_mh_execute_header, v72, v104, "%@ Inserting %lu assets from MADB ... %@", buf, 0x20u);
              }
            }
            if ([v65 count]
              && (uint64_t v74 = objc_opt_class(),
                  [v65 allObjects],
                  v75 = objc_claimAutoreleasedReturnValue(),
                  unsigned int v76 = [v74 _updateWithLocalIdentifiers:v75 photoLibrary:v106 cancelBlock:v117 error:a5], v75, v76))
            {
              if ((int)MediaAnalysisLogLevel() >= 3)
              {
                v77 = VCPLogInstance();
                if (os_log_type_enabled(v77, v121))
                {
                  id v78 = [v65 count];
                  *(_DWORD *)buf = 138412546;
                  CFStringRef v151 = @"[VSKDBUtil][DeepSync]";
                  __int16 v152 = 2048;
                  id v153 = v78;
                  _os_log_impl((void *)&_mh_execute_header, v77, v121, "%@ Failed to update vector database with %lu localIdentifiers", buf, 0x16u);
                }
              }
              int v45 = 1;
              int v124 = v76;
            }
            else
            {
              int v45 = 0;
            }
          }
          id v115 = v107;
          goto LABEL_108;
        }
        id v135 = 0;
        unsigned int v51 = [v43 next:&v135];
        id v52 = v135;
        unsigned __int8 v53 = v52;
        if (v51)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            id v54 = VCPLogInstance();
            if (os_log_type_enabled(v54, v121))
            {
              *(_DWORD *)buf = 138412290;
              CFStringRef v151 = @"[VSKDBUtil][DeepSync]";
              _os_log_impl((void *)&_mh_execute_header, v54, v121, "%@ Failed to query next asset", buf, 0xCu);
            }
          }
          if (!a5)
          {
            int v124 = -18;
            goto LABEL_75;
          }
          NSErrorUserInfoKey v146 = NSLocalizedDescriptionKey;
          v55 = +[NSString stringWithFormat:@"%@ Failed to query next asset", @"[VSKDBUtil][DeepSync]"];
          v147 = v55;
          os_log_type_t v56 = +[NSDictionary dictionaryWithObjects:&v147 forKeys:&v146 count:1];
          *a5 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v56];

          int v124 = -18;
        }
        else
        {
          v55 = [v52 localIdentifier];
          [v123 addObject:v55];
        }

LABEL_75:
        if (v51)
        {
          int v45 = 1;
          goto LABEL_109;
        }
      }
    }
    if (a5)
    {
      NSErrorUserInfoKey v148 = NSLocalizedDescriptionKey;
      v123 = +[NSString stringWithFormat:@"%@ Cancelled during looping MADB", @"[VSKDBUtil][DeepSync]"];
      v149 = v123;
      id v44 = +[NSDictionary dictionaryWithObjects:&v149 forKeys:&v148 count:1];
      *a5 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v44];
      int v124 = -128;
      int v45 = 1;
LABEL_108:

LABEL_109:
    }
    else
    {
      int v124 = -128;
      int v45 = 1;
    }
    v118 += 1000;
    v116 += 1000;
    if (v45) {
      goto LABEL_151;
    }
  }
  v79 = VCPSignPostLog();
  v80 = v79;
  if (v103 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v79))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v80, OS_SIGNPOST_INTERVAL_END, v103, "MADVectorDatabaseUtilities_DeepSync_MALoop", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  if (v102)
  {
    mach_absolute_time();
    VCPPerformance_LogMeasurement();
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v81 = VCPLogInstance();
    os_log_type_t v82 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v81, v82))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v151 = @"[VSKDBUtil][DeepSync]";
      _os_log_impl((void *)&_mh_execute_header, v81, v82, "%@ Stage 2 - MALoop finished", buf, 0xCu);
    }
  }
  uint64_t v83 = mach_absolute_time();
  v84 = VCPSignPostLog();
  os_signpost_id_t v85 = os_signpost_id_generate(v84);

  id v86 = VCPSignPostLog();
  v87 = v86;
  if (v85 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v86))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v87, OS_SIGNPOST_INTERVAL_BEGIN, v85, "MADVectorDatabaseUtilities_DeepSync_BuildDB", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  int v124 = [v111 rebuildWithForce:1 cancelBlock:v117 extendTimeoutBlock:&stru_10021E1E8 error:a5];
  if (!v124)
  {
    uint64_t v90 = VCPSignPostLog();
    v91 = v90;
    if (v85 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v90))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v91, OS_SIGNPOST_INTERVAL_END, v85, "MADVectorDatabaseUtilities_DeepSync_BuildDB", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    os_log_type_t v92 = v104;
    if (v83)
    {
      mach_absolute_time();
      VCPPerformance_LogMeasurement();
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      os_log_type_t v93 = VCPLogInstance();
      os_log_type_t v94 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v93, v94))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v151 = @"[VSKDBUtil][DeepSync]";
        _os_log_impl((void *)&_mh_execute_header, v93, v94, "%@ Stage 3 - Rebuild finished", buf, 0xCu);
      }

      os_log_type_t v92 = v104;
    }
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v95 = VCPLogInstance();
      if (os_log_type_enabled(v95, v92))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v151 = @"[VSKDBUtil][DeepSync]";
        _os_log_impl((void *)&_mh_execute_header, v95, v92, "%@ Finished ...", buf, 0xCu);
      }
    }
    v96 = +[NSDate now];
    [v96 timeIntervalSinceReferenceDate];
    unsigned int v98 = [v105 setValue:(uint64_t)v97 forKey:@"VectorDatabaseDeepSyncTimestamp"];

    if (!(v98 | [v105 commit]))
    {
      int v124 = 0;
      goto LABEL_151;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      long long v99 = VCPLogInstance();
      if (os_log_type_enabled(v99, v121))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v151 = @"[VSKDBUtil][DeepSync]";
        _os_log_impl((void *)&_mh_execute_header, v99, v121, "%@ Failed to persist deep sync date", buf, 0xCu);
      }
    }
    if (!a5)
    {
      int v124 = -18;
      goto LABEL_151;
    }
    NSErrorUserInfoKey v142 = NSLocalizedDescriptionKey;
    v88 = +[NSString stringWithFormat:@"%@ Failed to persist deep sync date", @"[VSKDBUtil][DeepSync]"];
    v143 = v88;
    long long v100 = +[NSDictionary dictionaryWithObjects:&v143 forKeys:&v142 count:1];
    *a5 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v100];

    int v124 = -18;
    goto LABEL_148;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v88 = VCPLogInstance();
    if (os_log_type_enabled(v88, v121))
    {
      id v89 = *a5;
      *(_DWORD *)buf = 138412546;
      CFStringRef v151 = @"[VSKDBUtil][DeepSync]";
      __int16 v152 = 2112;
      id v153 = v89;
      _os_log_impl((void *)&_mh_execute_header, v88, v121, "%@ Failed to build VSKDB - %@", buf, 0x16u);
    }
LABEL_148:
  }
LABEL_151:

LABEL_152:
  return v124;
}

+ (int)syncWithPhotoLibrary:(id)a3 ignoreExpiration:(BOOL)a4 threshold:(double)a5 cancelBlock:(id)a6 error:(id *)a7
{
  BOOL v9 = a4;
  id v10 = a3;
  id v11 = a6;
  if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled])
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      int v12 = VCPLogInstance();
      os_log_type_t v13 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v12, v13))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v47 = @"[VSKDBUtil][Sync]";
        _os_log_impl((void *)&_mh_execute_header, v12, v13, "%@ Starting ...", buf, 0xCu);
      }
    }
    id v14 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v10];
    id v15 = [v14 valueForKey:@"VectorDatabaseDeepSyncTimestamp"];
    if (v15) {
      +[NSDate dateWithTimeIntervalSinceReferenceDate:(double)(uint64_t)v15];
    }
    else {
    id v43 = +[NSDate distantPast];
    }
    [v43 timeIntervalSinceNow];
    if (v18 >= -2592000.0 || v9)
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v21 = VCPLogInstance();
        os_log_type_t v22 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v21, v22))
        {
          CFStringRef v23 = @"NO";
          *(_DWORD *)buf = 138412802;
          CFStringRef v47 = @"[VSKDBUtil][Sync]";
          __int16 v48 = 2112;
          double v49 = *(double *)&v43;
          if (v9) {
            CFStringRef v23 = @"YES";
          }
          __int16 v50 = 2112;
          double v51 = *(double *)&v23;
          _os_log_impl((void *)&_mh_execute_header, v21, v22, "%@ Most recent deep-sync at %@ (ignore expiration: %@)", buf, 0x20u);
        }
      }
      +[MADVectorDatabaseManager sharedDatabaseWithPhotoLibrary:v10];
      unint64_t v40 = v45 = 0;
      id v24 = [v40 embeddingCountWithError:&v45];
      id v25 = v45;
      id v44 = v25;
      id v26 = (char *)[v40 assetCountWithError:&v44];
      id v41 = v44;

      v27 = (char *)[v14 countOfAssetsWithMediaAnalysisResultsType:73];
      id v28 = [v14 countOfAssetsWithMediaAnalysisResultsType:82];
      id v29 = v28;
      if ((uint64_t)v26 <= (uint64_t)&v27[(void)v28]) {
        uint64_t v30 = (uint64_t)&v27[(void)v28];
      }
      else {
        uint64_t v30 = (uint64_t)v26;
      }
      if (v26 - &v27[(void)v28] >= 0) {
        uint64_t v31 = v26 - &v27[(void)v28];
      }
      else {
        uint64_t v31 = &v27[(void)v28] - v26;
      }
      double v32 = (double)v31 / (double)v30;
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        id v33 = VCPLogInstance();
        os_log_type_t v34 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v33, v34))
        {
          *(_DWORD *)buf = 138413570;
          CFStringRef v47 = @"[VSKDBUtil][Sync]";
          __int16 v48 = 2048;
          double v49 = *(double *)&v24;
          __int16 v50 = 2048;
          double v51 = *(double *)&v26;
          __int16 v52 = 2048;
          unsigned __int8 v53 = v27;
          __int16 v54 = 2048;
          id v55 = v29;
          __int16 v56 = 2048;
          double v57 = v32 * 100.0;
          _os_log_impl((void *)&_mh_execute_header, v33, v34, "%@ vdb-embeddings: %ld, vdb-assets: %ld, madb-assetsWithImageEmbeddings: %ld, madb-assetsWithVideoEmbeddings: %ld -> (difference: %.2f%%)", buf, 0x3Eu);
        }
      }
      if (v32 <= a5)
      {
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          id v37 = VCPLogInstance();
          os_log_type_t v38 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v37, v38))
          {
            *(_DWORD *)buf = 138412290;
            CFStringRef v47 = @"[VSKDBUtil][Sync]";
            _os_log_impl((void *)&_mh_execute_header, v37, v38, "%@ Finished", buf, 0xCu);
          }
        }
        int v17 = 0;
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          v35 = VCPLogInstance();
          os_log_type_t v36 = VCPLogToOSLogType[5];
          if (os_log_type_enabled(v35, v36))
          {
            *(_DWORD *)buf = 138412802;
            CFStringRef v47 = @"[VSKDBUtil][Sync]";
            __int16 v48 = 2048;
            double v49 = v32 * 100.0;
            __int16 v50 = 2048;
            double v51 = a5 * 100.0;
            _os_log_impl((void *)&_mh_execute_header, v35, v36, "%@ Database content is different significantly %.2f%% (>%.2f%%)", buf, 0x20u);
          }
        }
        int v17 = [(id)objc_opt_class() _deepSyncWithPhotoLibrary:v10 cancelBlock:v11 error:a7];
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        uint64_t v19 = VCPLogInstance();
        os_log_type_t v20 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v19, v20))
        {
          *(_DWORD *)buf = 138412546;
          CFStringRef v47 = @"[VSKDBUtil][Sync]";
          __int16 v48 = 2112;
          double v49 = *(double *)&v43;
          _os_log_impl((void *)&_mh_execute_header, v19, v20, "%@ Best-By date expired (%@)", buf, 0x16u);
        }
      }
      int v17 = [(id)objc_opt_class() _deepSyncWithPhotoLibrary:v10 cancelBlock:v11 error:a7];
    }

LABEL_50:
    goto LABEL_51;
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v14 = VCPLogInstance();
    os_log_type_t v16 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v14, v16))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v47 = @"[VSKDBUtil][Sync]";
      _os_log_impl((void *)&_mh_execute_header, v14, v16, "%@ Embedding generation disabled, skip deep sync", buf, 0xCu);
    }
    int v17 = 0;
    goto LABEL_50;
  }
  int v17 = 0;
LABEL_51:

  return v17;
}

@end