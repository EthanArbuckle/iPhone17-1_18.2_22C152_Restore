@interface MADPhotosFaceFastPassProcessingTask
+ (id)taskWithCancelBlock:(id)a3 progressHandler:(id)a4 andCompletionHandler:(id)a5;
- (BOOL)run:(id *)a3;
- (MADPhotosFaceFastPassProcessingTask)initWithCancelBlock:(id)a3 progressHandler:(id)a4 andCompletionHandler:(id)a5;
- (int)_requestAssetResource:(id)a3;
@end

@implementation MADPhotosFaceFastPassProcessingTask

- (MADPhotosFaceFastPassProcessingTask)initWithCancelBlock:(id)a3 progressHandler:(id)a4 andCompletionHandler:(id)a5
{
  id v8 = a3;
  v9 = (Block_layout *)a4;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000DDE00;
  v19[3] = &unk_10021AD08;
  id v10 = a5;
  id v20 = v10;
  v18.receiver = self;
  v18.super_class = (Class)MADPhotosFaceFastPassProcessingTask;
  v11 = [(MADPhotosFaceFastPassProcessingTask *)&v18 initWithCompletionHandler:v19];
  if (v11)
  {
    if (v9) {
      v12 = v9;
    }
    else {
      v12 = &stru_10021DA28;
    }
    v13 = objc_retainBlock(v12);
    id progressHandler = v11->_progressHandler;
    v11->_id progressHandler = v13;

    dispatch_group_t v15 = dispatch_group_create();
    downloadGroup = v11->_downloadGroup;
    v11->_downloadGroup = (OS_dispatch_group *)v15;

    [(MADPhotosFaceFastPassProcessingTask *)v11 setCancelBlock:v8];
  }

  return v11;
}

+ (id)taskWithCancelBlock:(id)a3 progressHandler:(id)a4 andCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [objc_alloc((Class)a1) initWithCancelBlock:v8 progressHandler:v9 andCompletionHandler:v10];

  return v11;
}

- (int)_requestAssetResource:(id)a3
{
  id v4 = a3;
  v5 = [v4 assetLocalIdentifier];
  v6 = +[NSString stringWithFormat:@"[Face-FP][Download][%@]", v5];

  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v7, v8))
    {
      *(_DWORD *)buf = 138412546;
      id v28 = v6;
      __int16 v29 = 2112;
      id v30 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "%@ Attempt to download resource: %@", buf, 0x16u);
    }
  }
  id v9 = objc_alloc_init((Class)PHAssetResourceRequestOptions);
  [v9 setNetworkAccessAllowed:1];
  [v9 setDownloadPriority:0];
  [v9 setDownloadIntent:2];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000DE2D0;
  v25[3] = &unk_10021BEF0;
  id v10 = v6;
  id v26 = v10;
  [v9 setProgressHandler:v25];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000DE3B0;
  v23[3] = &unk_10021DA50;
  id v11 = v10;
  id v24 = v11;
  v12 = objc_retainBlock(v23);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000DE47C;
  v20[3] = &unk_10021DA78;
  id v13 = v11;
  id v21 = v13;
  v22 = self;
  v14 = objc_retainBlock(v20);
  dispatch_group_t v15 = +[PHAssetResourceManager defaultManager];
  int v16 = [v15 requestFileURLForAssetResource:v4 options:v9 urlReceivedHandler:v12 completionHandler:v14];

  if (!v16 && (int)MediaAnalysisLogLevel() >= 3)
  {
    v17 = VCPLogInstance();
    os_log_type_t v18 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v17, v18))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v13;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "%@ Failed to issue download request", buf, 0xCu);
    }
  }
  return v16;
}

- (BOOL)run:(id *)a3
{
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    id v4 = VCPLogInstance();
    os_log_type_t v5 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v4, v5))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = @"[Face-FP]";
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "%@ Running MADPhotosFaceFastPassTask ... ", buf, 0xCu);
    }
  }
  v6 = VCPSignPostLog();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  os_log_type_t v8 = VCPSignPostLog();
  id v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "MADPhotosFaceFastPassProcessingTask", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  id v10 = +[VCPPhotoLibraryManager sharedManager];
  id v11 = +[PHPhotoLibrary systemPhotoLibraryURL];
  v12 = [v10 photoLibraryWithURL:v11];

  if (!v12)
  {
    NSErrorUserInfoKey v154 = NSLocalizedDescriptionKey;
    v48 = [0 photoLibraryURL];
    v49 = [v48 path];
    v50 = +[NSString stringWithFormat:@"%@ Failed to open Photo Library (%@)", @"[Face-FP]", v49];
    v155 = v50;
    v51 = +[NSDictionary dictionaryWithObjects:&v155 forKeys:&v154 count:1];
    id v15 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v51];

    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v52 = VCPLogInstance();
      os_log_type_t v53 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v52, v53))
      {
        v54 = [v15 description];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v54;
        _os_log_impl((void *)&_mh_execute_header, v52, v53, "%@", buf, 0xCu);
      }
    }
    if (!a3) {
      goto LABEL_43;
    }
LABEL_37:
    id v15 = v15;
    BOOL v47 = 0;
    os_log_type_t v18 = *a3;
    *a3 = v15;
LABEL_129:

    goto LABEL_130;
  }
  if ([v12 isReadyForAnalysisCPLInitialDownloadCompleted])
  {
    if ([v12 isCloudPhotoLibraryEnabled])
    {
      id v13 = +[VCPInternetReachability sharedInstance];
      [v13 hasWifiOrEthernetConnection];
    }
    v14 = +[VCPWatchdog sharedWatchdog];
    [v14 pet];

    id v15 = [v12 librarySpecificFetchOptions];
    int v16 = +[NSPredicate predicateWithFormat:@"(verifiedType = %ld) OR (verifiedType = %ld)", 1, 2];
    [v15 setPredicate:v16];

    [v15 setMinimumVerifiedFaceCount:1];
    [v15 setIncludedDetectionTypes:&off_100230500];
    v17 = +[MADStateHandler sharedStateHandler];
    [v17 addBreadcrumb:@"%@ Fetching verified persons with fetchOptions: %@", @"[Face-FP]", v15];

    os_log_type_t v18 = +[PHPerson fetchPersonsWithOptions:v15];
    v19 = +[MADStateHandler sharedStateHandler];
    [v19 addBreadcrumb:@"%@ Fetched %lu verified persons", @"[Face-FP]", objc_msgSend(v18, "count")];

    if (![v18 count])
    {
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        v62 = VCPLogInstance();
        os_log_type_t v63 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v62, v63))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = @"[Face-FP]";
          _os_log_impl((void *)&_mh_execute_header, v62, v63, "%@ No verified person (with visible face); exit",
            buf,
            0xCu);
        }
      }
      v64 = [(MADPhotosFaceFastPassProcessingTask *)self completionHandler];
      v64[2](v64, 0, 0);

      BOOL v47 = 1;
      goto LABEL_129;
    }
    uint64_t v144 = 0;
    v145 = &v144;
    uint64_t v146 = 0x2050000000;
    id v20 = (void *)qword_100252700;
    uint64_t v147 = qword_100252700;
    if (!qword_100252700)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_1000E0648;
      uint64_t v149 = (uint64_t)&unk_100219E10;
      v150[0] = &v144;
      sub_1000E0648((uint64_t)buf);
      id v20 = (void *)v145[3];
    }
    id v21 = v20;
    _Block_object_dispose(&v144, 8);
    id v22 = [v21 alloc];
    uint64_t v144 = 0;
    v145 = &v144;
    uint64_t v146 = 0x2050000000;
    v23 = (void *)qword_100252710;
    uint64_t v147 = qword_100252710;
    if (!qword_100252710)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_1000E0810;
      uint64_t v149 = (uint64_t)&unk_100219E10;
      v150[0] = &v144;
      sub_1000E0810((uint64_t)buf);
      v23 = (void *)v145[3];
    }
    id v24 = v23;
    _Block_object_dispose(&v144, 8);
    v25 = [v24 photos];
    id v26 = objc_msgSend(v12, "vcp_visionCacheStorageDirectoryURL");
    id v143 = 0;
    id v128 = [v22 initWithClient:v25 version:1 url:v26 error:&v143];
    id v126 = v143;

    if (!v128)
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        BOOL v47 = 0;
LABEL_128:

        goto LABEL_129;
      }
      v65 = VCPLogInstance();
      os_log_type_t v66 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v65, v66))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = @"[Face-FP]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v126;
        _os_log_impl((void *)&_mh_execute_header, v65, v66, "%@ Failed to load Gallery - %@", buf, 0x16u);
      }
      BOOL v47 = 0;
LABEL_127:

      goto LABEL_128;
    }
    v27 = VCPSignPostLog();
    os_signpost_id_t v28 = os_signpost_id_generate(v27);

    __int16 v29 = VCPSignPostLog();
    id v30 = v29;
    if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v30, OS_SIGNPOST_INTERVAL_BEGIN, v28, "MADPhotosFaceFastPassProcessingTask_FaceCrop", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    v31 = [v128 gallery];
    v122 = +[MADPhotosFaceCropProcessingTask taskWithPhotoLibrary:v12 andGallery:v31];

    v142[0] = _NSConcreteStackBlock;
    v142[1] = 3221225472;
    v142[2] = sub_1000E0234;
    v142[3] = &unk_100219D98;
    v142[4] = self;
    [v122 setCancelBlock:v142];
    [v122 process];
    (*((void (**)(double))self->_progressHandler + 2))(25.0);
    v32 = VCPSignPostLog();
    v33 = v32;
    if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_END, v28, "MADPhotosFaceFastPassProcessingTask_FaceCrop", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    v34 = VCPSignPostLog();
    os_signpost_id_t v35 = os_signpost_id_generate(v34);

    v36 = VCPSignPostLog();
    v37 = v36;
    if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v37, OS_SIGNPOST_INTERVAL_BEGIN, v35, "MADPhotosFaceFastPassProcessingTask_KeyFace", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    v125 = objc_msgSend(v12, "mad_allFacesFetchOptions");
    v38 = +[MADStateHandler sharedStateHandler];
    [v38 addBreadcrumb:@"%@ Fetching verified person faces with fetchOptions: %@", @"[Face-FP]", v125];

    v124 = +[PHFace fetchKeyFaceByPersonLocalIdentifierForPersons:v18 options:v125];
    v39 = +[MADStateHandler sharedStateHandler];
    [v39 addBreadcrumb:@"%@ Fetched %lu verified person faces", @"[Face-FP]", objc_msgSend(v124, "count")];

    v40 = +[MADStateHandler sharedStateHandler];
    [v40 addBreadcrumb:@"%@ Fetching assets by verified faces", @"[Face-FP]"];

    v41 = [v124 allValues];
    v123 = +[PHAsset fetchAssetsGroupedByFaceUUIDForFaces:v41];

    v42 = +[MADStateHandler sharedStateHandler];
    [v42 addBreadcrumb:@"%@ Fetched %lu assets by verified faces", @"[Face-FP]", objc_msgSend(v123, "count")];

    +[NSMutableArray array];
    v140[0] = _NSConcreteStackBlock;
    v140[1] = 3221225472;
    v140[2] = sub_1000E023C;
    v140[3] = &unk_10021DAA0;
    id v121 = (id)objc_claimAutoreleasedReturnValue();
    id v141 = v121;
    [v123 enumerateKeysAndObjectsUsingBlock:v140];
    v43 = [VCPMADQuickFaceIDAssetProcessingTask alloc];
    v44 = [v12 photoLibraryURL];
    v139[0] = _NSConcreteStackBlock;
    v139[1] = 3221225472;
    v139[2] = sub_1000E02A8;
    v139[3] = &unk_100219D98;
    v139[4] = self;
    v120 = [(VCPMADQuickFaceIDAssetProcessingTask *)v43 initWithLocalIdentifiers:v121 fromPhotoLibraryWithURL:v44 cancelBlock:v139 progressHandler:0 completionHandler:&stru_10021DAC0];

    if ([(VCPMADQuickFaceIDAssetProcessingTask *)v120 run])
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        BOOL v47 = 0;
LABEL_126:

        v65 = v122;
        goto LABEL_127;
      }
      v45 = VCPLogInstance();
      os_log_type_t v46 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v45, v46))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = @"[Face-FP]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v126;
        _os_log_impl((void *)&_mh_execute_header, v45, v46, "%@ Failed to analyze key faces from assets  - %@", buf, 0x16u);
      }
      BOOL v47 = 0;
LABEL_125:

      goto LABEL_126;
    }
    v67 = VCPSignPostLog();
    v68 = v67;
    if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v67))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v68, OS_SIGNPOST_INTERVAL_END, v35, "MADPhotosFaceFastPassProcessingTask_KeyFace", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    (*((void (**)(double))self->_progressHandler + 2))(50.0);
    v69 = VCPSignPostLog();
    os_signpost_id_t spid = os_signpost_id_generate(v69);

    v70 = VCPSignPostLog();
    v71 = v70;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v70))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v71, OS_SIGNPOST_INTERVAL_BEGIN, spid, "MADPhotosFaceFastPassProcessingTask_UVCluster", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    v119 = objc_msgSend(v12, "mad_unclusteredFacesFetchOptions");
    v151[0] = PHFacePropertySetIdentifier;
    v151[1] = PHFacePropertySetCore;
    v151[2] = PHFacePropertySetClustering;
    v151[3] = PHFacePropertySetPersonBuilder;
    v72 = +[NSArray arrayWithObjects:v151 count:4];
    [v119 setFetchPropertySets:v72];

    v73 = +[MADStateHandler sharedStateHandler];
    [v73 addBreadcrumb:@"%@ Fetching unclustered face assets with fetchOptions: %@", @"[Face-FP]", v119];

    v118 = +[PHFace fetchFacesWithOptions:v119];
    v74 = +[MADStateHandler sharedStateHandler];
    [v74 addBreadcrumb:@"%@ Fetched %d unclustered face assets", @"[Face-FP]", objc_msgSend(v118, "count")];

    if ([v118 count])
    {
      v138[0] = _NSConcreteStackBlock;
      v138[1] = 3221225472;
      v138[2] = sub_1000E02B4;
      v138[3] = &unk_100219D98;
      v138[4] = self;
      p_isa = objc_retainBlock(v138);
      v76 = +[MADGDUtilities sharedInstance];
      v77 = [v128 gallery];
      id v137 = v126;
      unsigned __int8 v78 = [v76 prepareClusteringWithFaces:v118 gallery:v77 cancelOrExtendTimeoutBlock:p_isa error:&v137];
      id v117 = v137;

      if ((v78 & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v106 = VCPLogInstance();
          os_log_type_t v107 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v106, v107))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = @"[Face-FP]";
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v117;
            _os_log_impl((void *)&_mh_execute_header, v106, v107, "%@ Failed to add faces to Gallery - %@", buf, 0x16u);
          }
        }
        BOOL v47 = 0;
        goto LABEL_124;
      }
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v79 = VCPLogInstance();
        os_log_type_t v80 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v79, v80))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = @"[Face-FP]";
          _os_log_impl((void *)&_mh_execute_header, v79, v80, "%@ Faces added to Gallery!", buf, 0xCu);
        }
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v81 = VCPLogInstance();
        os_log_type_t v82 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v81, v82))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = @"[Face-FP]";
          _os_log_impl((void *)&_mh_execute_header, v81, v82, "%@ No face to add to Gallery; continuing to VU update ...",
            buf,
            0xCu);
        }
      }
      id v117 = v126;
    }
    v135[0] = _NSConcreteStackBlock;
    v135[1] = 3221225472;
    v135[2] = sub_1000E0310;
    v135[3] = &unk_10021DAE8;
    v135[4] = self;
    CFStringRef v136 = @"[Face-FP]";
    v127 = objc_retainBlock(v135);
    v83 = [v128 gallery];
    id v134 = v117;
    unsigned __int8 v84 = [v83 updateAndReturnError:&v134 progressHandler:v127];
    id v85 = v134;

    id v117 = v85;
    if ((v84 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        uint64_t v104 = VCPLogInstance();
        os_log_type_t v105 = VCPLogToOSLogType[3];
        if (os_log_type_enabled((os_log_t)v104, v105))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = @"[Face-FP]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v85;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v104, v105, "%@ Failed to update Gallery - %@", buf, 0x16u);
        }
        BOOL v47 = 0;
        goto LABEL_121;
      }
      goto LABEL_122;
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v86 = VCPLogInstance();
      os_log_type_t v87 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v86, v87))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = @"[Face-FP]";
        _os_log_impl((void *)&_mh_execute_header, v86, v87, "%@ Gallery updated!", buf, 0xCu);
      }
    }
    v88 = VCPSignPostLog();
    v89 = v88;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v88))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v89, OS_SIGNPOST_INTERVAL_END, spid, "MADPhotosFaceFastPassProcessingTask_UVCluster", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    (*((void (**)(double))self->_progressHandler + 2))(75.0);
    if (!DeviceWithGreymatterSupport()) {
      goto LABEL_117;
    }
    v90 = VCPSignPostLog();
    os_signpost_id_t v113 = os_signpost_id_generate(v90);

    v91 = VCPSignPostLog();
    v92 = v91;
    if (v113 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v91))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v92, OS_SIGNPOST_INTERVAL_BEGIN, v113, "MADPhotosFaceFastPassProcessingTask_UVPersonalization", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    v132[0] = _NSConcreteStackBlock;
    v132[1] = 3221225472;
    v132[2] = sub_1000E0498;
    v132[3] = &unk_10021CD40;
    v132[4] = self;
    v133 = @"[Face-FP]";
    spida = objc_retainBlock(v132);
    +[MADVUWGalleryManager sharedGalleryForPhotoLibrary:v12];
    v93 = id v131 = 0;
    unsigned __int8 v114 = [v93 updatePlugin:1 progressHandler:spida error:&v131];
    id v94 = v131;
    if ((v114 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_116;
      }
      v102 = VCPLogInstance();
      os_log_type_t v108 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v102, v108))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = @"[Face-FP]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v94;
        _os_log_impl((void *)&_mh_execute_header, v102, v108, "%@ Failed to update VUWGallery for Personalization plugin - %@", buf, 0x16u);
      }
      goto LABEL_114;
    }
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v95 = VCPLogInstance();
      os_log_type_t v96 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v95, v96))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = @"[Face-FP]";
        _os_log_impl((void *)&_mh_execute_header, v95, v96, "%@ VUWGallery Personalization plugin updated!", buf, 0xCu);
      }
    }
    v97 = VCPSignPostLog();
    v98 = v97;
    if (v113 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v97))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v98, OS_SIGNPOST_INTERVAL_END, v113, "MADPhotosFaceFastPassProcessingTask_UVPersonalization", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    id v130 = v94;
    unsigned __int8 v99 = +[BGSystemTaskCheckpoints reportFeatureCheckpoint:30 forFeature:802 error:&v130];
    id v100 = v130;

    if (v99)
    {
      id v101 = v100;
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        v102 = VCPLogInstance();
        os_log_type_t v103 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v102, v103))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = @"[Face-FP]";
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = 30;
          *(_WORD *)&buf[22] = 2048;
          uint64_t v149 = 802;
          _os_log_impl((void *)&_mh_execute_header, v102, v103, "%@ Reported checkpoint %lu for %lu", buf, 0x20u);
        }
        id v94 = v100;
LABEL_114:

        goto LABEL_116;
      }
    }
    else
    {
      id v101 = v100;
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v102 = VCPLogInstance();
        os_log_type_t v109 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v102, v109))
        {
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = @"[Face-FP]";
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = 30;
          *(_WORD *)&buf[22] = 2048;
          uint64_t v149 = 802;
          LOWORD(v150[0]) = 2112;
          *(void *)((char *)v150 + 2) = v101;
          _os_log_impl((void *)&_mh_execute_header, v102, v109, "%@ Failed to report checkpoint %lu for %lu - %@", buf, 0x2Au);
        }
        id v94 = v101;
        goto LABEL_114;
      }
    }
    id v94 = v101;
LABEL_116:

    if (v114)
    {
LABEL_117:
      (*((void (**)(double))self->_progressHandler + 2))(100.0);
      v110 = VCPSignPostLog();
      v111 = v110;
      if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v110))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v111, OS_SIGNPOST_INTERVAL_END, v7, "MADPhotosFaceFastPassProcessingTask", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      uint64_t v104 = [(MADPhotosFaceFastPassProcessingTask *)self completionHandler];
      (*(void (**)(uint64_t, void, void))(v104 + 16))(v104, 0, 0);
      BOOL v47 = 1;
LABEL_121:

LABEL_123:
      p_isa = &v136->isa;
LABEL_124:

      id v126 = v117;
      v45 = v119;
      goto LABEL_125;
    }
LABEL_122:
    BOOL v47 = 0;
    goto LABEL_123;
  }
  NSErrorUserInfoKey v152 = NSLocalizedDescriptionKey;
  v55 = [v12 photoLibraryURL];
  v56 = [v55 path];
  v57 = +[NSString stringWithFormat:@"%@ Photo Library not ready for analysis (%@)", @"[Face-FP]", v56];
  v153 = v57;
  v58 = +[NSDictionary dictionaryWithObjects:&v153 forKeys:&v152 count:1];
  id v15 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v58];

  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v59 = VCPLogInstance();
    os_log_type_t v60 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v59, v60))
    {
      v61 = [v15 description];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v61;
      _os_log_impl((void *)&_mh_execute_header, v59, v60, "%@", buf, 0xCu);
    }
  }
  if (a3) {
    goto LABEL_37;
  }
LABEL_43:
  BOOL v47 = 0;
LABEL_130:

  return v47;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadGroup, 0);
  objc_storeStrong(&self->_progressHandler, 0);
}

@end