@interface VCPAssetMaintenanceTask
+ (id)taskWithPhotoLibrary:(id)a3;
- (int)mainInternal;
- (void)updateStatsFlags:(unint64_t)a3 forPHAsset:(id)a4 withDatabase:(id)a5;
@end

@implementation VCPAssetMaintenanceTask

+ (id)taskWithPhotoLibrary:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithPhotoLibrary:v3];

  return v4;
}

- (void)updateStatsFlags:(unint64_t)a3 forPHAsset:(id)a4 withDatabase:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  if ([v10 isVideo])
  {
    unint64_t v8 = a3 | 4;
  }
  else if (objc_msgSend(v10, "vcp_isLivePhoto"))
  {
    unint64_t v8 = a3 | 2;
  }
  else
  {
    unint64_t v8 = [v10 isPhoto] | a3;
  }
  v9 = [v10 localIdentifier];
  [v7 storeStatsFlags:v8 forLocalIdentifier:v9];
}

- (int)mainInternal
{
  v2 = VCPSignPostLog();
  os_signpost_id_t spid = os_signpost_id_generate(v2);

  id v3 = VCPSignPostLog();
  id v4 = v3;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPAssetMaintenanceTask", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v5 = VCPLogInstance();
    os_log_type_t v6 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v5, v6))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Performing asset book-keeping...", buf, 2u);
    }
  }
  id v7 = VCPDatabaseManager;
  unint64_t v8 = [(VCPTask *)self photoLibrary];
  v93 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v8];

  v9 = +[NSDate date];
  v82 = [v9 dateByAddingTimeInterval:-604800.0];

  int v110 = 0;
  unsigned int v10 = [v93 ageOutBlacklistBefore:v82 count:&v110];
  int v11 = 0;
  int v94 = v10;
  if (v10 == -108 || v10 == -36)
  {
    v95 = 0;
    goto LABEL_146;
  }
  v95 = 0;
  if (v10 == -23) {
    goto LABEL_146;
  }
  v12 = +[VCPMADCoreAnalyticsManager sharedManager];
  [v12 accumulateInt64Value:v110 forField:@"NumberOfAssetsOutFromBlacklist" andEvent:@"com.apple.mediaanalysisd.FullAnalysisRunSession"];

  v13 = [(VCPTask *)self photoLibrary];
  v95 = +[VCPAnalyzedAssets assetsFromPhotoLibrary:v13];

  unint64_t v14 = 0;
  char v80 = 0;
  uint64_t v87 = 0;
  int v94 = 0;
  os_log_type_t type = VCPLogToOSLogType[4];
  os_log_type_t v90 = VCPLogToOSLogType[5];
  CFStringRef v77 = @"HasDeletedAssetsSinceLastBackup";
  os_log_type_t v78 = VCPLogToOSLogType[3];
  while (1)
  {
    if (v14 >= (unint64_t)objc_msgSend(v95, "count", v77)) {
      goto LABEL_152;
    }
    if ([(VCPTask *)self isCancelled])
    {
      int v94 = -128;
      goto LABEL_152;
    }
    v15 = +[VCPWatchdog sharedWatchdog];
    [v15 pet];

    v16 = +[NSMutableDictionary dictionary];
    v91 = +[NSMutableSet set];
    int v17 = 0;
    unint64_t v18 = v14 + 1000;
    while (1)
    {
      id v19 = [v95 count];
      if ((unint64_t)v19 >= v18) {
        unint64_t v20 = v18;
      }
      else {
        unint64_t v20 = (unint64_t)v19;
      }
      if (v14 >= v20)
      {
        v30 = [(VCPTask *)self photoLibrary];
        v23 = +[PHAsset vcp_fetchOptionsForLibrary:v30 forTaskID:1];

        v31 = [v16 allKeys];
        v84 = +[PHAsset fetchAssetsWithLocalIdentifiers:v31 options:v23];

        if ([v91 count])
        {
          v32 = [v91 allObjects];
          v33 = +[PHAsset fetchAssetsWithLocalIdentifiers:v32 options:v23];

          v105[0] = _NSConcreteStackBlock;
          v105[1] = 3221225472;
          v105[2] = sub_1000A4B30;
          v105[3] = &unk_10021C4A8;
          v105[4] = self;
          id v106 = v16;
          id v34 = v93;
          id v107 = v34;
          id v108 = v91;
          [v33 enumerateObjectsUsingBlock:v105];
          [v34 commit];
        }
        id v35 = [v16 count];
        if (!((v35 != [v84 count]) | v17 & 1))
        {
          int v44 = 9;
          v64 = v84;
          goto LABEL_140;
        }
        long long v103 = 0u;
        long long v104 = 0u;
        long long v101 = 0u;
        long long v102 = 0u;
        obj = v84;
        id v36 = [obj countByEnumeratingWithState:&v101 objects:v113 count:16];
        if (v36)
        {
          uint64_t v37 = *(void *)v102;
          do
          {
            v38 = 0;
            do
            {
              if (*(void *)v102 != v37) {
                objc_enumerationMutation(obj);
              }
              v39 = [*(id *)(*((void *)&v101 + 1) + 8 * (void)v38) localIdentifier];
              v40 = [v16 objectForKey:v39];
              v41 = v40;
              if (!v40) {
                goto LABEL_62;
              }
              if (![v40 isDeletePending]) {
                goto LABEL_61;
              }
              if ((int)MediaAnalysisLogLevel() >= 5)
              {
                v42 = VCPLogInstance();
                if (os_log_type_enabled(v42, v90))
                {
                  *(_DWORD *)buf = 138412290;
                  v115 = v39;
                  _os_log_impl((void *)&_mh_execute_header, v42, v90, "  [%@] Asset found; recovering analysis",
                    buf,
                    0xCu);
                }
              }
              unsigned int v43 = [v93 setDeletePendingFlag:0 localIdentifier:v39];
              int v44 = 6;
              if (v43 == -108 || v43 == -36)
              {
                int v45 = v43;
              }
              else
              {
                int v45 = v43;
                if (v43 != -23)
                {
                  int v44 = 0;
                  int v45 = v94;
                }
              }
              if (v43 == -108 || v43 == -36 || v43 == -23)
              {
                int v94 = v45;
              }
              else
              {
                if ((unint64_t)++v87 < 0x3E8)
                {
                  int v94 = v45;
LABEL_61:
                  [v16 removeObjectForKey:v39];
LABEL_62:

                  goto LABEL_63;
                }
                unsigned int v46 = [v93 commit];
                int v44 = 6;
                if (v46 == -108 || v46 == -36)
                {
                  int v94 = v46;
                }
                else
                {
                  int v94 = v46;
                  if (v46 != -23)
                  {
                    int v44 = 0;
                    int v94 = v45;
                  }
                }
                if (v46 != -108 && v46 != -36 && v46 != -23)
                {
                  uint64_t v87 = 0;
                  goto LABEL_61;
                }
              }

              if (v44)
              {
                v65 = obj;
                goto LABEL_139;
              }
LABEL_63:
              v38 = (char *)v38 + 1;
            }
            while (v36 != v38);
            id v47 = [obj countByEnumeratingWithState:&v101 objects:v113 count:16];
            id v36 = v47;
          }
          while (v47);
        }

        long long v99 = 0u;
        long long v100 = 0u;
        long long v97 = 0u;
        long long v98 = 0u;
        v65 = [v16 allValues];
        id v83 = v65;
        id v48 = [v65 countByEnumeratingWithState:&v97 objects:v112 count:16];
        if (!v48)
        {
          int v44 = 0;
          goto LABEL_139;
        }
        uint64_t v86 = *(void *)v98;
LABEL_73:
        uint64_t v49 = 0;
        while (1)
        {
          if (*(void *)v98 != v86) {
            objc_enumerationMutation(v83);
          }
          v50 = [*(id *)(*((void *)&v97 + 1) + 8 * v49) localIdentifier];
          v51 = [(VCPTask *)self photoLibrary];
          v52 = +[PHAsset vcp_fetchOptionsForLibrary:v51 forTaskID:1];

          [v52 setIncludeTrashedAssets:1];
          v111 = v50;
          v53 = +[NSArray arrayWithObjects:&v111 count:1];
          v54 = +[PHAsset fetchAssetsWithLocalIdentifiers:v53 options:v52];

          if ([v54 count])
          {
            if ((int)MediaAnalysisLogLevel() >= 5)
            {
              v55 = VCPLogInstance();
              if (os_log_type_enabled(v55, v90))
              {
                *(_DWORD *)buf = 138412290;
                v115 = (const char *)v50;
                _os_log_impl((void *)&_mh_execute_header, v55, v90, "  [%@] Asset in trash; marking analysis for deletion",
                  buf,
                  0xCu);
              }
            }
            unsigned int v56 = [v93 setDeletePendingFlag:1 localIdentifier:v50];
            int v44 = 6;
            if (v56 == -108 || v56 == -36)
            {
              int v57 = v56;
            }
            else
            {
              int v57 = v56;
              if (v56 != -23)
              {
                int v44 = 0;
                int v57 = v94;
              }
            }
            if (v56 == -108 || v56 == -36 || v56 == -23) {
              goto LABEL_102;
            }
          }
          else
          {
            if ((int)MediaAnalysisLogLevel() >= 5)
            {
              v58 = VCPLogInstance();
              if (os_log_type_enabled(v58, v90))
              {
                *(_DWORD *)buf = 138412290;
                v115 = (const char *)v50;
                _os_log_impl((void *)&_mh_execute_header, v58, v90, "  [%@] Asset purged; removing analysis", buf, 0xCu);
              }
            }
            unsigned int v59 = [v93 deleteAnalysisForAsset:v50];
            int v44 = 6;
            if (v59 == -108 || v59 == -36)
            {
              int v57 = v59;
            }
            else
            {
              int v57 = v59;
              if (v59 != -23)
              {
                int v44 = 0;
                int v57 = v94;
              }
            }
            if (v59 == -108 || v59 == -36 || v59 == -23) {
              goto LABEL_102;
            }
            char v80 = 1;
          }
          if ((unint64_t)++v87 < 0x3E8)
          {
            int v94 = v57;
LABEL_114:
            int v44 = 0;
            goto LABEL_103;
          }
          if ((v80 & 1) == 0) {
            goto LABEL_109;
          }
          unsigned int v61 = [v93 setValue:1 forKey:v77];
          if (v61 == -108 || v61 == -36)
          {
            unsigned int v62 = v61;
          }
          else
          {
            unsigned int v62 = v61;
            if (v61 != -23) {
              unsigned int v62 = v79;
            }
          }
          int v79 = v62;
          int v44 = 1;
          if (v61 != -108 && v61 != -36 && v61 != -23)
          {
LABEL_109:
            unsigned int v60 = [v93 commit];
            int v44 = 6;
            if (v60 == -108 || v60 == -36)
            {
              int v94 = v60;
            }
            else
            {
              int v94 = v60;
              if (v60 != -23)
              {
                int v44 = 0;
                int v94 = v57;
              }
            }
            if (v60 == -108 || v60 == -36 || v60 == -23) {
              goto LABEL_103;
            }
            uint64_t v87 = 0;
            goto LABEL_114;
          }
LABEL_102:
          int v94 = v57;
LABEL_103:

          if (v44) {
            goto LABEL_131;
          }
          if (v48 == (id)++v49)
          {
            id v63 = [v83 countByEnumeratingWithState:&v97 objects:v112 count:16];
            id v48 = v63;
            if (!v63)
            {
              int v44 = 0;
LABEL_131:
              v65 = v83;
LABEL_139:

              v64 = obj;
LABEL_140:

              goto LABEL_141;
            }
            goto LABEL_73;
          }
        }
      }
      id v109 = 0;
      unsigned int v21 = [v95 next:&v109];
      id v22 = v109;
      v23 = v22;
      if (v21) {
        break;
      }
      v24 = [v22 localIdentifier];
      BOOL v25 = v24 == 0;

      if (v25)
      {
        if ((int)MediaAnalysisLogLevel() < 4) {
          goto LABEL_29;
        }
        v27 = VCPLogInstance();
        if (os_log_type_enabled(v27, type))
        {
          id v28 = [v95 count];
          *(_DWORD *)buf = 136315650;
          v29 = "local identifier";
          if (!v23) {
            v29 = "asset";
          }
          v115 = v29;
          __int16 v116 = 2048;
          unint64_t v117 = v14;
          __int16 v118 = 2048;
          id v119 = v28;
          _os_log_impl((void *)&_mh_execute_header, v27, type, "Asset maintenance: nil %s at index %zu/%zu", buf, 0x20u);
        }
      }
      else
      {
        v26 = [v23 localIdentifier];
        [v16 setObject:v23 forKey:v26];

        v17 |= [v23 isDeletePending];
        if (((unint64_t)[v23 statsFlags] & 7) != 0) {
          goto LABEL_29;
        }
        v27 = [v23 localIdentifier];
        [v91 addObject:v27];
      }

LABEL_29:
      ++v14;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v64 = VCPLogInstance();
      if (os_log_type_enabled(v64, v78))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v64, v78, "Deleted asset detection/removal process failed", buf, 2u);
      }
      int v94 = 0;
      int v44 = 6;
      goto LABEL_140;
    }
    int v94 = 0;
    int v44 = 6;
LABEL_141:

    unint64_t v14 = v18;
    if (v44)
    {
      unint64_t v14 = v18;
      if (v44 != 9) {
        break;
      }
    }
  }
  if ((v44 & 0xE) != 6)
  {
    int v94 = v79;
    goto LABEL_178;
  }
LABEL_152:
  LODWORD(v7) = v79;
  int v11 = v80 & 1;
  if (v87)
  {
LABEL_153:
    if (v11)
    {
      unsigned int v70 = [v93 setValue:1 forKey:@"HasDeletedAssetsSinceLastBackup"];
      if (v70 == -108)
      {
        int v72 = -108;
      }
      else
      {
        BOOL v71 = v70 == -36 || v70 == -23;
        int v72 = v70;
        if (!v71) {
          int v72 = (int)v7;
        }
      }
      if (v70 == -108 || (v70 != -36 ? (BOOL v75 = v70 == -23) : (BOOL v75 = 1), v75))
      {
        int v94 = v72;
        goto LABEL_178;
      }
    }
    else
    {
      int v72 = (int)v7;
    }
    unsigned int v73 = [v93 commit];
    if (v73 == -108 || v73 == -36)
    {
      int v74 = v73;
    }
    else
    {
      int v74 = v73;
      if (v73 != -23) {
        int v74 = v72;
      }
    }
    if (v73 == -108 || v73 == -36 || v73 == -23)
    {
      int v94 = v74;
      goto LABEL_178;
    }
    goto LABEL_147;
  }
LABEL_146:
  if (v11) {
    goto LABEL_153;
  }
LABEL_147:
  v66 = [(VCPTask *)self photoLibrary];
  VCPCoreAnalyticsReportEventFullAnalysisOverallProgress(v66);

  v67 = [(VCPTask *)self photoLibrary];
  v96[0] = _NSConcreteStackBlock;
  v96[1] = 3221225472;
  v96[2] = sub_1000A4C14;
  v96[3] = &unk_100219D98;
  v96[4] = self;
  +[MADVectorDatabaseUtilities syncWithPhotoLibrary:v67 ignoreExpiration:1 threshold:v96 cancelBlock:0 error:0.2];

  v68 = VCPSignPostLog();
  v69 = v68;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v68))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v69, OS_SIGNPOST_INTERVAL_END, spid, "VCPAssetMaintenanceTask", (const char *)&unk_1001F3BD3, buf, 2u);
  }

LABEL_178:
  return v94;
}

@end