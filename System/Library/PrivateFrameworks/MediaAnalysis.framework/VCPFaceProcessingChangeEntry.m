@interface VCPFaceProcessingChangeEntry
+ (id)entryWithAsset:(id)a3 andAnalysis:(id)a4;
- (VCPFaceProcessingChangeEntry)init;
- (VCPFaceProcessingChangeEntry)initWithAsset:(id)a3 andAnalysis:(id)a4;
- (void)_persist:(id *)a3 scheduleTorsoOnlyPHFace:(BOOL)a4;
- (void)publish:(id *)a3 scheduleTorsoOnlyPHFace:(BOOL)a4;
@end

@implementation VCPFaceProcessingChangeEntry

- (VCPFaceProcessingChangeEntry)init
{
  return 0;
}

- (VCPFaceProcessingChangeEntry)initWithAsset:(id)a3 andAnalysis:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VCPFaceProcessingChangeEntry;
  v9 = [(VCPFaceProcessingChangeEntry *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_asset, a3);
    objc_storeStrong((id *)&v10->_analysis, a4);
  }

  return v10;
}

+ (id)entryWithAsset:(id)a3 andAnalysis:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)objc_opt_class()) initWithAsset:v5 andAnalysis:v6];

  return v7;
}

- (void)_persist:(id *)a3 scheduleTorsoOnlyPHFace:(BOOL)a4
{
  BOOL v74 = a4;
  v4 = [(PHAsset *)self->_asset localIdentifier];
  v80 = +[NSString stringWithFormat:@"[FacePersist][%@]", v4];

  id v5 = [(PHAsset *)self->_asset photoLibrary];
  id v6 = [v5 librarySpecificFetchOptions];

  v85 = v6;
  [v6 setIncludeNonvisibleFaces:1];
  [v6 setIncludeTorsoOnlyDetectionData:1];
  [v6 setIncludedDetectionTypes:&off_100230470];
  uint64_t v103 = PHFacePropertySetIdentifier;
  id v7 = +[NSArray arrayWithObjects:&v103 count:1];
  [v6 setFetchPropertySets:v7];

  id v8 = [(NSDictionary *)self->_analysis objectForKeyedSubscript:@"FaceResults"];
  v70 = [v8 objectForKeyedSubscript:@"FacesToDelete"];

  v69 = +[VCPFaceUtils phFacesFromVCPPhotosFaces:v70 withFetchOptions:v6];
  if ([v69 count])
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v9 = VCPLogInstance();
      os_log_type_t v10 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v9, v10))
      {
        *(_DWORD *)buf = 138412546;
        v96 = v80;
        __int16 v97 = 2048;
        CFStringRef v98 = (const __CFString *)[v69 count];
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "%@ Faces To Delete - %lu", buf, 0x16u);
      }
    }
    v92[0] = _NSConcreteStackBlock;
    v92[1] = 3221225472;
    v92[2] = sub_1000BFC28;
    v92[3] = &unk_10021CB08;
    id v93 = v80;
    [v69 enumerateObjectsUsingBlock:v92];
    +[PHFaceChangeRequest deleteFaces:v69];
  }
  id v76 = +[NSMutableArray array];
  v82 = +[PHAssetChangeRequest changeRequestForAsset:self->_asset];
  v11 = [(NSDictionary *)self->_analysis objectForKeyedSubscript:@"FaceResults"];
  v67 = [v11 objectForKeyedSubscript:@"FacesToPersist"];

  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    objc_super v12 = VCPLogInstance();
    os_log_type_t v13 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v12, v13))
    {
      CFStringRef v14 = (const __CFString *)[v67 count];
      *(_DWORD *)buf = 138412546;
      v96 = v80;
      __int16 v97 = 2048;
      CFStringRef v98 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "%@ Faces To Insert/Update - %lu", buf, 0x16u);
    }
  }
  v71 = +[VCPMADCoreAnalyticsManager sharedManager];
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id obj = v67;
  id v15 = [obj countByEnumeratingWithState:&v88 objects:v102 count:16];
  if (!v15)
  {
    char v77 = 0;
    uint64_t v81 = 0;
    uint64_t v72 = 0;
    uint64_t v73 = 0;
    uint64_t v75 = 0;
    goto LABEL_89;
  }
  char v77 = 0;
  uint64_t v81 = 0;
  uint64_t v72 = 0;
  uint64_t v73 = 0;
  uint64_t v75 = 0;
  uint64_t v86 = *(void *)v89;
  os_log_type_t type = VCPLogToOSLogType[7];
  os_log_type_t v79 = VCPLogToOSLogType[3];
  do
  {
    id v87 = v15;
    for (i = 0; i != v87; i = (char *)i + 1)
    {
      if (*(void *)v89 != v86) {
        objc_enumerationMutation(obj);
      }
      v17 = *(void **)(*((void *)&v88 + 1) + 8 * i);
      if (_os_feature_enabled_impl())
      {
        id v18 = [v17 algorithmVersion];
        int v19 = _os_feature_enabled_impl();
        uint64_t v20 = 11;
        if (v19) {
          uint64_t v20 = 14;
        }
        if (v18 == (id)v20)
        {
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v21 = VCPLogInstance();
            if (os_log_type_enabled(v21, type))
            {
              v22 = [v17 localIdentifier];
              *(_DWORD *)buf = 138412546;
              v96 = v80;
              __int16 v97 = 2112;
              CFStringRef v98 = v22;
              _os_log_impl((void *)&_mh_execute_header, v21, type, "%@ Marking asset contains FC face %@", buf, 0x16u);
            }
          }
          char v77 = 1;
        }
      }
      v23 = [v17 localIdentifier];

      if (!v23)
      {
        v25 = +[PHFaceChangeRequest creationRequestForFace];
        v26 = 0;
        if (!v25) {
          goto LABEL_42;
        }
LABEL_30:
        +[VCPFaceUtils assignPropertiesOfVCPPhotosFace:v17 toPHFaceChangeRequest:v25];
        unsigned int v27 = [v17 detectionType];
        if (v27 != 1)
        {
          if (v23)
          {
            v35 = [(PHAsset *)self->_asset photoLibrary];
            unsigned __int8 v36 = objc_msgSend(v35, "mad_useVUGallery");

            BOOL v37 = 0;
            BOOL v34 = 0;
            CFStringRef v38 = @"Pet";
            if (v36) {
              goto LABEL_59;
            }
            goto LABEL_60;
          }
          BOOL v34 = 0;
          BOOL v37 = 0;
          CFStringRef v38 = @"Pet";
          goto LABEL_64;
        }
        [v17 centerX];
        if (v28 == 0.0 && ([v17 centerY], v29 == 0.0) && (objc_msgSend(v17, "size"), v30 == 0.0))
        {
          [v17 bodyCenterX];
          if (v31 == 0.0
            && ([v17 bodyCenterY], v32 == 0.0)
            && ([v17 bodyWidth], v33 == 0.0))
          {
            [v17 bodyHeight];
            BOOL v34 = v57 != 0.0;
          }
          else
          {
            BOOL v34 = 1;
          }
        }
        else
        {
          BOOL v34 = 0;
        }
        [v17 centerX];
        if (v39 == 0.0 && ([v17 centerY], v40 == 0.0) && (objc_msgSend(v17, "size"), v41 == 0.0)
          || ([v17 bodyCenterX], v42 != 0.0)
          || ([v17 bodyCenterY], v43 != 0.0)
          || ([v17 bodyWidth], v44 != 0.0))
        {
          BOOL v46 = 0;
          BOOL v37 = 0;
          CFStringRef v38 = @"Face";
          if (!v34) {
            goto LABEL_56;
          }
        }
        else
        {
          [v17 bodyHeight];
          BOOL v46 = v45 == 0.0;
          BOOL v37 = v46;
          CFStringRef v38 = @"Face";
          if (!v34)
          {
LABEL_56:
            if (v23)
            {
              if (!v34 || v74)
              {
LABEL_59:
                v47 = [v26 localIdentifier];
                [v76 addObject:v47];
              }
LABEL_60:
              v94 = v26;
              v48 = +[NSArray arrayWithObjects:&v94 count:1];
              [v82 addFaces:v48];

              [v25 setClusterSequenceNumber:0];
              [v25 setVuObservationID:0];
              if ((int)MediaAnalysisLogLevel() >= 7)
              {
                v49 = VCPLogInstance();
                if (os_log_type_enabled(v49, type))
                {
                  v50 = [v26 localIdentifier];
                  *(_DWORD *)buf = 138412802;
                  v96 = v80;
                  __int16 v97 = 2112;
                  CFStringRef v98 = v38;
                  __int16 v99 = 2112;
                  v100 = v50;
                  _os_log_impl((void *)&_mh_execute_header, v49, type, "%@ Updating %@ %@", buf, 0x20u);
                }
                goto LABEL_74;
              }
              goto LABEL_75;
            }
LABEL_64:
            v49 = [v25 placeholderForCreatedFace];
            if (v27 == 1)
            {
              if (!v34 || v74)
              {
LABEL_69:
                v53 = [v49 localIdentifier];
                [v76 addObject:v53];
              }
            }
            else
            {
              v51 = [(PHAsset *)self->_asset photoLibrary];
              unsigned __int8 v52 = objc_msgSend(v51, "mad_useVUGallery");

              if (v52) {
                goto LABEL_69;
              }
            }
            v101 = v49;
            v54 = +[NSArray arrayWithObjects:&v101 count:1];
            [v82 addFaces:v54];

            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              v55 = VCPLogInstance();
              if (os_log_type_enabled(v55, type))
              {
                v56 = [v49 localIdentifier];
                *(_DWORD *)buf = 138412802;
                v96 = v80;
                __int16 v97 = 2112;
                CFStringRef v98 = v38;
                __int16 v99 = 2112;
                v100 = v56;
                _os_log_impl((void *)&_mh_execute_header, v55, type, "%@ Adding %@ %@", buf, 0x20u);
              }
            }
LABEL_74:

LABEL_75:
            if (v27 == 1)
            {
              if (v37)
              {
                ++v75;
              }
              else if (v34)
              {
                ++v73;
              }
              else
              {
                ++v72;
              }
            }
            else
            {
              ++v81;
            }
            goto LABEL_79;
          }
        }
        BOOL v37 = v46;
        CFStringRef v38 = @"Torso";
        goto LABEL_56;
      }
      uint64_t v24 = +[VCPFaceUtils phFaceFromVCPPhotosFace:v17 withFetchOptions:v85];
      if (v24)
      {
        v25 = +[PHFaceChangeRequest changeRequestForFace:v24];
        v26 = (void *)v24;
        if (v25) {
          goto LABEL_30;
        }
      }
      else
      {
        v26 = 0;
      }
LABEL_42:
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_80;
      }
      v25 = VCPLogInstance();
      if (os_log_type_enabled(v25, v79))
      {
        *(_DWORD *)buf = 138412290;
        v96 = v80;
        _os_log_impl((void *)&_mh_execute_header, v25, v79, "%@ Failed to retrieve faceChangeRequest; skipping",
          buf,
          0xCu);
      }
LABEL_79:

LABEL_80:
    }
    id v15 = [obj countByEnumeratingWithState:&v88 objects:v102 count:16];
  }
  while (v15);
LABEL_89:

  v58 = [(PHAsset *)self->_asset adjustmentVersion];
  [v82 setFaceAdjustmentVersion:v58];

  v59 = [(NSDictionary *)self->_analysis objectForKeyedSubscript:@"ImageTooSmall"];
  uint64_t v60 = v59 == 0;

  if (v60)
  {
    unsigned __int8 v61 = 0;
  }
  else
  {
    uint64_t v60 = [(NSDictionary *)self->_analysis objectForKeyedSubscript:@"ImageTooSmall"];
    unsigned __int8 v61 = [(id)v60 BOOLValue];

    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      uint64_t v60 = VCPLogInstance();
      os_log_type_t v62 = VCPLogToOSLogType[7];
      if (os_log_type_enabled((os_log_t)v60, v62))
      {
        *(_DWORD *)buf = 138412290;
        v96 = v80;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v60, v62, "%@ Marking resource is too small", buf, 0xCu);
      }
    }
  }
  if ((v77 | v61))
  {
    if (_os_feature_enabled_impl()) {
      signed __int16 v63 = 14;
    }
    else {
      signed __int16 v63 = 11;
    }
  }
  else
  {
    uint64_t v60 = [(PHAsset *)self->_asset photoLibrary];
    signed __int16 v63 = (unsigned __int16)objc_msgSend((id)v60, "mad_faceProcessingInternalVersion");
  }
  [v82 setFaceAnalysisVersion:v63];
  if (((v77 | v61) & 1) == 0) {

  }
  if ([(PHAsset *)self->_asset mad_isEligibleForComputeSync])
  {
    unsigned int v64 = [v82 faceAnalysisVersion];
    v65 = [(PHAsset *)self->_asset photoLibrary];
    BOOL v66 = objc_msgSend(v65, "mad_faceProcessingInternalVersion") == v64;

    if (v66) {
      objc_msgSend(v82, "setLocalAnalysisStage:", -[PHAsset mad_analysisStageAfterCompletingAnalysis:](self->_asset, "mad_analysisStageAfterCompletingAnalysis:", 3));
    }
  }
  if (a3) {
    *a3 = v76;
  }
  [v71 accumulateInt64Value:v75 forField:@"NumberOfFacesPersisted" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];
  [v71 accumulateInt64Value:v73 forField:@"NumberOfTorsosPersisted" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];
  [v71 accumulateInt64Value:v72 forField:@"NumberOfFaceTorsosPersisted" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];
  [v71 accumulateInt64Value:v81 forField:@"NumberOfPetsPersisted" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];
}

- (void)publish:(id *)a3 scheduleTorsoOnlyPHFace:(BOOL)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysis, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end