@interface VCPFailedAssetAnalysisTask
+ (id)taskWithPhotoLibrary:(id)a3 options:(id)a4;
- (int)mainInternal;
@end

@implementation VCPFailedAssetAnalysisTask

+ (id)taskWithPhotoLibrary:(id)a3 options:(id)a4
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)objc_opt_class()) initWithPhotoLibrary:v4];

  return v5;
}

- (int)mainInternal
{
  v3 = VCPSignPostLog();
  os_signpost_id_t spid = os_signpost_id_generate(v3);

  id v4 = VCPSignPostLog();
  id v5 = v4;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPFailedAssetAnalysisTask", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v6 = VCPLogInstance();
    os_log_type_t v7 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v6, v7))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Checking for failed assets...", buf, 2u);
    }
  }
  v8 = [(VCPTask *)self photoLibrary];
  unsigned int v9 = [v8 isCloudPhotoLibraryEnabled];

  if (!v9) {
    goto LABEL_15;
  }
  v10 = +[VCPInternetReachability sharedInstance];
  unsigned int v82 = [v10 hasWifiOrEthernetConnection];

  if (!v82)
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v11 = VCPLogInstance();
      os_log_type_t v13 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v11, v13))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, v13, "Wifi/Ethernet connection unavailable; disabling streaming analysis",
          buf,
          2u);
      }
      goto LABEL_14;
    }
LABEL_15:
    LOBYTE(v82) = 0;
    goto LABEL_16;
  }
  v11 = [(VCPTask *)self cancel];
  v12 = +[VCPDownloadManager sharedManager];
  [v12 setCancel:v11];

LABEL_14:
LABEL_16:
  v14 = [(VCPTask *)self photoLibrary];
  v87 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v14];

  id v92 = 0;
  int v15 = [v87 getBlacklistedAssetsWithCount:1 localIdentifiers:&v92];
  id v84 = v92;
  if (v15 != -108 && v15 != -36 && v15 != -23)
  {
    int v75 = v15;
    if ([v84 count])
    {
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        v16 = VCPLogInstance();
        os_log_type_t v17 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v16, v17))
        {
          unsigned int v18 = [v84 count];
          *(_DWORD *)buf = 67109120;
          LODWORD(v94) = v18;
          _os_log_impl((void *)&_mh_execute_header, v16, v17, "Revisiting %d failed assets", buf, 8u);
        }
      }
      id v19 = [v84 count];
      v20 = [(VCPTask *)self progressHandler];
      v79 = +[VCPProgressReporter reporterWithIntervalSeconds:10 andTotalJobCount:v19 andBlock:v20];

      v21 = [(VCPTask *)self photoLibrary];
      v78 = +[VCPPhotosAssetChangeManager managerForPhotoLibrary:v21];

      if (v78)
      {
        v22 = [(VCPTask *)self photoLibrary];
        v77 = +[PHAsset vcp_fetchOptionsForLibrary:v22 forTaskID:1];

        v23 = +[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:0];
        v99 = v23;
        v24 = +[NSArray arrayWithObjects:&v99 count:1];
        [v77 setSortDescriptors:v24];

        v86 = +[PHAsset fetchAssetsWithLocalIdentifiers:v84 options:v77];
        unint64_t v25 = 0;
        int v81 = 0;
        os_log_type_t v73 = VCPLogToOSLogType[7];
        v72 = v89;
        os_log_type_t type = VCPLogToOSLogType[5];
        *(void *)&long long v26 = 138412290;
        long long v71 = v26;
        while (1)
        {
          if (v25 >= (unint64_t)objc_msgSend(v86, "count", v71, v72))
          {
LABEL_99:
            unsigned int v64 = [v87 commit];
            if (v64 == -108 || v64 == -36)
            {
              int v15 = v64;
            }
            else
            {
              int v15 = v64;
              if (v64 != -23) {
                int v15 = v75;
              }
            }
            if (v64 != -108 && v64 != -36 && v64 != -23)
            {
              v65 = +[VCPDownloadManager sharedManager];
              [v65 flush];

              if ([v78 publishPendingChanges] && (int)MediaAnalysisLogLevel() >= 4)
              {
                v66 = VCPLogInstance();
                os_log_type_t v67 = VCPLogToOSLogType[4];
                if (os_log_type_enabled(v66, v67))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v66, v67, "Failed to publish PHAssetPropertySetMediaAnalysis changes", buf, 2u);
                }
              }
              v68 = VCPSignPostLog();
              v69 = v68;
              if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v68))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v69, OS_SIGNPOST_INTERVAL_END, spid, "VCPFailedAssetAnalysisTask", (const char *)&unk_1001F3BD3, buf, 2u);
              }

              int v15 = v81;
            }

            v62 = v77;
            goto LABEL_117;
          }
          v28 = [v86 objectAtIndexedSubscript:v25];
          if ([(VCPTask *)self isCancelled])
          {
            int v81 = -128;
            int v29 = 21;
            goto LABEL_66;
          }
          v30 = +[VCPWatchdog sharedWatchdog];
          [v30 pet];

          v85 = +[PHAssetResource vcp_allAcceptableResourcesForAsset:v28];
          v31 = [(VCPTask *)self photoLibrary];
          if (![v31 isCloudPhotoLibraryEnabled])
          {
LABEL_39:

LABEL_40:
            int v33 = 0;
LABEL_41:
            [v79 increaseProcessedJobCountByOne];
            id location = 0;
            uint64_t v34 = v33 ^ 1u;
            uint64_t v35 = [(VCPBackgroundAnalysisTask *)self missingAnalysisForAsset:v28 existingAnalysis:&location resources:v85 forLocalResourcesOnly:v34];
            if (v35)
            {
              unsigned int v76 = v33;
              v36 = VCPSignPostLog();
              os_signpost_id_t v37 = os_signpost_id_generate(v36);

              v38 = VCPSignPostLog();
              v39 = v38;
              if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v39, OS_SIGNPOST_INTERVAL_BEGIN, v37, "VCPFailedAssetAnalysisTask_UnpackComputeSync", (const char *)&unk_1001F3BD3, buf, 2u);
              }

              v80 = objc_msgSend(v85, "mad_computeSyncResource");
              v40 = [(VCPTask *)self cancel];
              v41 = objc_msgSend(v80, "mad_existingAnalysisFromComputeSyncForAsset:allowDownload:cancel:", v28, 0, v40);

              v42 = VCPSignPostLog();
              v43 = v42;
              if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_INTERVAL_END, v37, "VCPFailedAssetAnalysisTask_UnpackComputeSync", (const char *)&unk_1001F3BD3, buf, 2u);
              }

              if (v41)
              {
                objc_storeStrong(&location, v41);
                uint64_t v35 = [(VCPBackgroundAnalysisTask *)self missingAnalysisForAsset:v28 withExistingComputeSyncAnalysis:&location resources:v85 forLocalResourcesOnly:v34];
                if ((int)MediaAnalysisLogLevel() >= 5)
                {
                  v44 = VCPLogInstance();
                  if (os_log_type_enabled(v44, type))
                  {
                    v45 = [v28 localIdentifier];
                    MediaAnalysisTypeShortDescription((uint64_t)objc_msgSend(location, "vcp_types"));
                    id v46 = (id)objc_claimAutoreleasedReturnValue();
                    v47 = MediaAnalysisTypeShortDescription(v35);
                    *(_DWORD *)buf = 138412802;
                    v94 = v45;
                    __int16 v95 = 2112;
                    id v96 = v46;
                    __int16 v97 = 2112;
                    v98 = v47;
                    _os_log_impl((void *)&_mh_execute_header, v44, type, "[%@] Reusing analysis results from compute sync (existing: %@, missing: %@)", buf, 0x20u);
                  }
                }
              }
              v48 = [v28 localIdentifier];
              unsigned int v49 = [v87 addAssetToBlacklist:v48];

              int v29 = 21;
              if (v49 == -108 || v49 == -36)
              {
                int v50 = v49;
              }
              else
              {
                int v50 = v49;
                if (v49 != -23)
                {
                  int v29 = 0;
                  int v50 = v81;
                }
              }
              if (v49 == -108 || v49 == -36 || v49 == -23)
              {
                int v81 = v50;
              }
              else
              {
                unsigned int v51 = [v87 commit];
                int v29 = 21;
                if (v51 == -108 || v51 == -36)
                {
                  int v81 = v51;
                }
                else
                {
                  int v81 = v51;
                  if (v51 != -23)
                  {
                    int v29 = 0;
                    int v81 = v50;
                  }
                }
                if (v51 != -108 && v51 != -36 && v51 != -23)
                {
                  v52 = +[VCPAssetAnalysisTask taskWithAnalysisTypes:v35 forAsset:v28 withExistingAnalysis:location];
                  [v52 setPhotosChangeManager:v78];
                  [v52 setAllowStreaming:v76];
                  v53 = [(VCPTask *)self cancel];
                  [v52 setCancel:v53];

                  v54 = +[VCPMADQoSManager sharedManager];
                  v88[0] = _NSConcreteStackBlock;
                  v88[1] = 3221225472;
                  v89[0] = sub_1000E22AC;
                  v89[1] = &unk_100219FC8;
                  id v55 = v52;
                  id v90 = v55;
                  [v54 runBlock:v88 withTaskID:1];

                  unsigned int v56 = [v55 error];
                  if (v56) {
                    int v29 = 21;
                  }
                  else {
                    int v29 = 0;
                  }
                  int v57 = v81;
                  if (v56) {
                    int v57 = v56;
                  }
                  int v81 = v57;
                }
              }
            }
            else
            {
              int v29 = 18;
            }

            goto LABEL_65;
          }
          if (objc_msgSend(v28, "vcp_isLivePhoto"))
          {
          }
          else
          {
            if (![v28 isVideo]
              || (objc_msgSend(v28, "vcp_isVideoSlowmo") & 1) != 0)
            {
              goto LABEL_39;
            }
            unsigned __int8 v60 = objc_msgSend(v28, "vcp_isLongMovie");

            if (v60) {
              goto LABEL_40;
            }
          }
          id v32 = objc_msgSend(v28, "vcp_fullAnalysisTypes");
          if (objc_msgSend(v28, "vcp_fullAnalysisTypesForResources:", v85) == v32) {
            goto LABEL_40;
          }
          if (v82)
          {
            if (!objc_msgSend(v28, "vcp_isLivePhoto")
              || (objc_msgSend(v85, "vcp_hasLocalPhoto:", objc_msgSend(v28, "hasAdjustments")) & 1) != 0)
            {
              int v33 = 1;
              goto LABEL_41;
            }
            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              v58 = VCPLogInstance();
              if (os_log_type_enabled(v58, v73))
              {
                v61 = [v28 localIdentifier];
                *(_DWORD *)buf = v71;
                v94 = v61;
                _os_log_impl((void *)&_mh_execute_header, v58, v73, "[%@] Live Photo has no local image; skipping",
                  buf,
                  0xCu);
              }
LABEL_91:
            }
          }
          else if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v58 = VCPLogInstance();
            if (os_log_type_enabled(v58, v73))
            {
              v59 = [v28 localIdentifier];
              *(_DWORD *)buf = v71;
              v94 = v59;
              _os_log_impl((void *)&_mh_execute_header, v58, v73, "[%@] Network unavailable; skipping", buf, 0xCu);
            }
            goto LABEL_91;
          }
          int v29 = 18;
LABEL_65:

LABEL_66:
          if (v29 > 18) {
            goto LABEL_99;
          }
          ++v25;
        }
      }
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v15 = -18;
      }
      else
      {
        v62 = VCPLogInstance();
        os_log_type_t v63 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v62, v63))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v62, v63, "Failed to retrieve VCPPhotosAssetChangeManager", buf, 2u);
        }
        int v15 = -18;
LABEL_117:
      }
    }
    else
    {
      int v15 = 0;
    }
  }

  return v15;
}

@end