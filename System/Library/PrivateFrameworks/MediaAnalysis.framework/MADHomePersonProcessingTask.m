@interface MADHomePersonProcessingTask
- (MADHomePersonProcessingTask)init;
- (int)_analyzeFaceCropWithPersonUUID:(id)a3 faceCropUUID:(id)a4 confirmed:(BOOL)a5 andCVPixelBuffer:(__CVBuffer *)a6;
- (int)_processFaceCrop:(id)a3;
- (void)_processFacesForHome:(id)a3;
- (void)process;
@end

@implementation MADHomePersonProcessingTask

- (MADHomePersonProcessingTask)init
{
  v29.receiver = self;
  v29.super_class = (Class)MADHomePersonProcessingTask;
  v2 = [(MADProcessingTask *)&v29 init];
  if (v2)
  {
    uint64_t v3 = +[PHPhotoLibrary vcp_defaultPhotoLibrary];
    photoLibrary = v2->_photoLibrary;
    v2->_photoLibrary = (PHPhotoLibrary *)v3;

    uint64_t v5 = +[VCPPhotosFaceProcessingContext contextWithPhotoLibrary:v2->_photoLibrary];
    context = v2->_context;
    v2->_context = (VCPPhotosFaceProcessingContext *)v5;

    v7 = [(PHPhotoLibrary *)v2->_photoLibrary vcp_visionCacheStorageDirectoryURL];
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2050000000;
    v8 = (void *)qword_1002527F8;
    uint64_t v33 = qword_1002527F8;
    if (!qword_1002527F8)
    {
      *(void *)&long long buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472;
      v35 = sub_100146024;
      v36 = &unk_100219E10;
      v37 = &v30;
      sub_100146024((uint64_t)&buf);
      v8 = (void *)v31[3];
    }
    v9 = v8;
    _Block_object_dispose(&v30, 8);
    id v10 = [v9 alloc];
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2050000000;
    v11 = (void *)qword_100252808;
    uint64_t v33 = qword_100252808;
    if (!qword_100252808)
    {
      *(void *)&long long buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472;
      v35 = sub_1001461EC;
      v36 = &unk_100219E10;
      v37 = &v30;
      sub_1001461EC((uint64_t)&buf);
      v11 = (void *)v31[3];
    }
    id v12 = v11;
    _Block_object_dispose(&v30, 8);
    v13 = [v12 homekit];
    id v28 = 0;
    v14 = (GDVUVisualUnderstandingService *)[v10 initWithClient:v13 version:1 url:v7 error:&v28];
    id v15 = v28;
    vuService = v2->_vuService;
    v2->_vuService = v14;

    v17 = v2->_vuService;
    if (v17)
    {
      v18 = [(GDVUVisualUnderstandingService *)v17 gallery];
      v19 = [v18 assets];
      uint64_t v20 = +[NSSet setWithArray:v19];
      vuKnownAssets = v2->_vuKnownAssets;
      v2->_vuKnownAssets = (NSSet *)v20;

      uint64_t v22 = +[NSMutableSet set];
      p_super = &v2->_clientAssets->super.super;
      v2->_clientAssets = (NSMutableSet *)v22;
      v24 = v2;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        v24 = 0;
        goto LABEL_14;
      }
      p_super = VCPLogInstance();
      os_log_type_t v25 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(p_super, v25))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v15;
        _os_log_impl((void *)&_mh_execute_header, p_super, v25, "Failed to create GDVUVisualUnderstandingService instance - %@", (uint8_t *)&buf, 0xCu);
      }
      v24 = 0;
    }

LABEL_14:
    goto LABEL_15;
  }
  v24 = 0;
LABEL_15:
  v26 = v24;

  return v26;
}

- (int)_analyzeFaceCropWithPersonUUID:(id)a3 faceCropUUID:(id)a4 confirmed:(BOOL)a5 andCVPixelBuffer:(__CVBuffer *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = +[PHPhotoLibrary vcp_defaultPhotoLibrary];
  v13 = +[VCPPhotosFaceProcessingContext contextWithPhotoLibrary:v12];
  id v14 = [objc_alloc((Class)VCPFaceAnalyzer) initWithContext:v13];
  id v38 = 0;
  int v15 = [v14 quickAnalyzeCVPixelBuffer:a6 results:&v38];
  id v16 = v38;
  v17 = v16;
  if (!v15)
  {
    v18 = [v16 objectForKeyedSubscript:@"FaceResults"];
    objc_super v29 = v18;
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v19 = VCPLogInstance();
      os_log_type_t v20 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v19, v20))
      {
        id v21 = [v29 count];
        *(_DWORD *)long long buf = 138412546;
        CFStringRef v40 = @"[HomeIngestion][FaceProcessing]";
        __int16 v41 = 2048;
        id v42 = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "%@ Detected %lu faces from pixel buffer", buf, 0x16u);
      }

      v18 = v29;
    }
    if (objc_msgSend(v18, "count", v29) == (id)1)
    {
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_100143C1C;
      v32[3] = &unk_10021E9F0;
      id v33 = v18;
      v34 = @"[HomeIngestion][FaceProcessing]";
      id v35 = v11;
      id v36 = v10;
      BOOL v37 = a5;
      uint64_t v22 = objc_retainBlock(v32);
      v23 = [(GDVUVisualUnderstandingService *)self->_vuService gallery];
      id v31 = 0;
      unsigned __int8 v24 = [v23 mutateAndReturnError:&v31 handler:v22];
      id v25 = v31;

      if (v24)
      {
        int v15 = 0;
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v26 = VCPLogInstance();
          os_log_type_t v27 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v26, v27))
          {
            *(_DWORD *)long long buf = 138412546;
            CFStringRef v40 = @"[HomeIngestion][FaceProcessing]";
            __int16 v41 = 2112;
            id v42 = v25;
            _os_log_impl((void *)&_mh_execute_header, v26, v27, "%@ Failed to tag observations from Gallery - %@", buf, 0x16u);
          }
        }
        int v15 = [v25 code];
      }

      v18 = v30;
    }
    else
    {
      int v15 = 0;
    }
  }
  return v15;
}

- (int)_processFaceCrop:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 personUUID];
  if (v5)
  {
    v6 = [v4 UUID];
    if (v6)
    {
      [(NSMutableSet *)self->_clientAssets addObject:v6];
      if ([(NSSet *)self->_vuKnownAssets containsObject:v6])
      {
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          v7 = VCPLogInstance();
          os_log_type_t v8 = VCPLogToOSLogType[7];
          if (os_log_type_enabled(v7, v8))
          {
            int v23 = 138412546;
            CFStringRef v24 = @"[HomeIngestion][ProcessFaceCrop]";
            __int16 v25 = 2112;
            v26 = v6;
            v9 = "%@ Gallery already indexes FaceCrop (asset) %@; ignoring";
            id v10 = v7;
            os_log_type_t v11 = v8;
            uint32_t v12 = 22;
LABEL_23:
            _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, (uint8_t *)&v23, v12);
            goto LABEL_24;
          }
          goto LABEL_24;
        }
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          id v16 = VCPLogInstance();
          os_log_type_t v17 = VCPLogToOSLogType[7];
          if (os_log_type_enabled(v16, v17))
          {
            int v23 = 138412802;
            CFStringRef v24 = @"[HomeIngestion][ProcessFaceCrop]";
            __int16 v25 = 2112;
            v26 = v6;
            __int16 v27 = 2112;
            id v28 = v5;
            _os_log_impl((void *)&_mh_execute_header, v16, v17, "%@ Processing FaceCrop %@ for person %@ ...", (uint8_t *)&v23, 0x20u);
          }
        }
        v18 = +[VCPImageManager sharedImageManager];
        v19 = [v4 dataRepresentation];
        id v20 = [v18 pixelBufferWithFormat:875704422 andMaxDimension:0 fromData:v19 withUniformTypeIdentifier:UTTypeJPEG flushCache:1 orientation:0];

        int v15 = -[MADHomePersonProcessingTask _analyzeFaceCropWithPersonUUID:faceCropUUID:confirmed:andCVPixelBuffer:](self, "_analyzeFaceCropWithPersonUUID:faceCropUUID:confirmed:andCVPixelBuffer:", v5, v6, [v4 source] == (id)2, v20);
        if (v15) {
          goto LABEL_28;
        }
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          v7 = VCPLogInstance();
          os_log_type_t v21 = VCPLogToOSLogType[7];
          if (os_log_type_enabled(v7, v21))
          {
            int v23 = 138412802;
            CFStringRef v24 = @"[HomeIngestion][ProcessFaceCrop]";
            __int16 v25 = 2112;
            v26 = v6;
            __int16 v27 = 2112;
            id v28 = v5;
            v9 = "%@ Finished processing FaceCrop %@ for person %@";
            id v10 = v7;
            os_log_type_t v11 = v21;
            uint32_t v12 = 32;
            goto LABEL_23;
          }
LABEL_24:
          int v15 = 0;
LABEL_25:

          goto LABEL_28;
        }
      }
      int v15 = 0;
      goto LABEL_28;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v7 = VCPLogInstance();
      os_log_type_t v14 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v7, v14))
      {
        int v23 = 138412546;
        CFStringRef v24 = @"[HomeIngestion][ProcessFaceCrop]";
        __int16 v25 = 2112;
        v26 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, v14, "%@ Invalid asset identifier %@", (uint8_t *)&v23, 0x16u);
      }
      int v15 = -18;
      goto LABEL_25;
    }
LABEL_14:
    int v15 = -18;
LABEL_28:

    goto LABEL_29;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v6 = VCPLogInstance();
    os_log_type_t v13 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v6, v13))
    {
      int v23 = 138412546;
      CFStringRef v24 = @"[HomeIngestion][ProcessFaceCrop]";
      __int16 v25 = 2112;
      v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v13, "%@ Invalid person identifier %@", (uint8_t *)&v23, 0x16u);
    }
    goto LABEL_14;
  }
  int v15 = -18;
LABEL_29:

  return v15;
}

- (void)_processFacesForHome:(id)a3
{
  id v4 = a3;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    uint64_t v5 = VCPLogInstance();
    os_log_type_t v6 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v5, v6))
    {
      if ([v4 isPrimary]) {
        CFStringRef v7 = &stru_10021F768;
      }
      else {
        CFStringRef v7 = @"non-";
      }
      os_log_type_t v8 = [v4 name];
      v9 = [v4 uniqueIdentifier];
      id v10 = [v4 personManagerSettings];
      unsigned int v11 = [v10 isFaceClassificationEnabled];
      CFStringRef v12 = @"OFF";
      *(_DWORD *)long long buf = 138413314;
      CFStringRef v25 = @"[HomeIngestion][ProcessHome]";
      __int16 v26 = 2112;
      CFStringRef v27 = v7;
      if (v11) {
        CFStringRef v12 = @"ON";
      }
      __int16 v28 = 2112;
      objc_super v29 = v8;
      __int16 v30 = 2112;
      id v31 = v9;
      __int16 v32 = 2112;
      CFStringRef v33 = v12;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "%@ Processing %@primary home %@ (%@) (faceClassification: %@) ...", buf, 0x34u);
    }
  }
  os_log_type_t v13 = [v4 personManager];
  if (v13)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100144AFC;
    v21[3] = &unk_10021EA40;
    v21[4] = self;
    uint64_t v22 = @"[HomeIngestion][ProcessHome]";
    os_log_type_t v14 = dispatch_semaphore_create(0);
    int v23 = v14;
    [v13 fetchAllPersonFaceCropsWithCompletion:v21];
    dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      int v15 = VCPLogInstance();
      os_log_type_t v16 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v15, v16))
      {
        if ([v4 isPrimary]) {
          CFStringRef v17 = &stru_10021F768;
        }
        else {
          CFStringRef v17 = @"non-";
        }
        v18 = [v4 name];
        v19 = [v4 uniqueIdentifier];
        *(_DWORD *)long long buf = 138413058;
        CFStringRef v25 = @"[HomeIngestion][ProcessHome]";
        __int16 v26 = 2112;
        CFStringRef v27 = v17;
        __int16 v28 = 2112;
        objc_super v29 = v18;
        __int16 v30 = 2112;
        id v31 = v19;
        _os_log_impl((void *)&_mh_execute_header, v15, v16, "%@ Processed %@primary home %@ (%@)", buf, 0x2Au);
      }
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() < 3) {
      goto LABEL_20;
    }
    os_log_type_t v14 = VCPLogInstance();
    os_log_type_t v20 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v14, v20))
    {
      *(_DWORD *)long long buf = 138412290;
      CFStringRef v25 = @"[HomeIngestion][ProcessHome]";
      _os_log_impl((void *)&_mh_execute_header, v14, v20, "%@ No home person manager", buf, 0xCu);
    }
  }

LABEL_20:
}

- (void)process
{
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    uint64_t v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v3, v4))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = @"[HomeIngestion]";
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "%@ Start processing ...", buf, 0xCu);
    }
  }
  uint64_t v81 = 0;
  v82 = &v81;
  uint64_t v83 = 0x2050000000;
  uint64_t v5 = (void *)qword_100252818;
  uint64_t v84 = qword_100252818;
  if (!qword_100252818)
  {
    *(void *)long long buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_10014629C;
    v87 = &unk_100219E10;
    v88 = &v81;
    sub_10014629C((uint64_t)buf);
    uint64_t v5 = (void *)v82[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v81, 8);
  v63 = [v6 defaultPrivateConfiguration];
  [v63 setOptions:1];
  [v63 setCachePolicy:0];
  [v63 setDiscretionary:1];
  id v59 = objc_alloc_init((Class)NSOperationQueue);
  [v59 setName:@"MADHomeIngestion"];
  [v59 setMaxConcurrentOperationCount:1];
  [v63 setDelegateQueue:v59];
  CFStringRef v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  os_log_type_t v8 = objc_alloc_init(MADHomeManagerDelegateAdapter);
  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472;
  v79[2] = sub_100145950;
  v79[3] = &unk_10021EA68;
  v9 = v7;
  v80 = v9;
  v61 = v8;
  [(MADHomeManagerDelegateAdapter *)v8 setDidUpdateHomes:v79];
  uint64_t v81 = 0;
  v82 = &v81;
  uint64_t v83 = 0x2050000000;
  id v10 = (void *)qword_100252820;
  uint64_t v84 = qword_100252820;
  if (!qword_100252820)
  {
    *(void *)long long buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_1001462F4;
    v87 = &unk_100219E10;
    v88 = &v81;
    sub_1001462F4((uint64_t)buf);
    id v10 = (void *)v82[3];
  }
  unsigned int v11 = v10;
  _Block_object_dispose(&v81, 8);
  id v62 = [[v11 alloc] initWithHomeMangerConfiguration:v63];
  [v62 setDelegate:v8];
  dispatch_group_enter(v9);
  uint64_t v12 = +[NSDate dateWithTimeIntervalSinceNow:1.0e10];
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = sub_100145958;
  v76[3] = &unk_10021DA78;
  v77 = @"[HomeIngestion]";
  os_log_type_t v13 = v9;
  v78 = v13;
  v60 = (void *)v12;
  id v14 = [v62 _refreshBeforeDate:v12 completionHandler:v76];
  dispatch_time_t v15 = dispatch_time(0, 10000000000);
  v58 = v13;
  dispatch_group_wait(v13, v15);
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    os_log_type_t v16 = VCPLogInstance();
    os_log_type_t v17 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v16, v17))
    {
      v18 = [v62 homes];
      id v19 = [v18 count];
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = @"[HomeIngestion]";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v19;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "%@ Found %lu homes", buf, 0x16u);
    }
  }
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  os_log_type_t v20 = [v62 homes];
  id v21 = [v20 countByEnumeratingWithState:&v72 objects:v85 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v73;
LABEL_15:
    uint64_t v23 = 0;
    while (1)
    {
      if (*(void *)v73 != v22) {
        objc_enumerationMutation(v20);
      }
      uint64_t v24 = *(void *)(*((void *)&v72 + 1) + 8 * v23);
      __int16 v26 = [(MADProcessingTask *)self cancelBlock];
      if (!v26) {
        goto LABEL_21;
      }
      CFStringRef v27 = [(MADProcessingTask *)self cancelBlock];
      char v28 = v27[2]();

      if (v28)
      {
        char v29 = 1;
      }
      else
      {
LABEL_21:
        __int16 v30 = +[VCPWatchdog sharedWatchdog];
        [v30 pet];

        [(MADHomePersonProcessingTask *)self _processFacesForHome:v24];
        char v29 = 0;
      }
      if (v29) {
        break;
      }
      if (v21 == (id)++v23)
      {
        id v21 = [v20 countByEnumeratingWithState:&v72 objects:v85 count:16];
        if (v21) {
          goto LABEL_15;
        }
        break;
      }
    }
  }

  id v31 = [(MADProcessingTask *)self cancelBlock];
  if (v31)
  {
    __int16 v32 = [(MADProcessingTask *)self cancelBlock];
    char v33 = v32[2]();

    if (v33) {
      goto LABEL_55;
    }
  }
  v34 = +[VCPWatchdog sharedWatchdog];
  [v34 pet];

  if ([(NSSet *)self->_vuKnownAssets count])
  {
    id v35 = [(NSSet *)self->_vuKnownAssets mutableCopy];
    [v35 minusSet:self->_clientAssets];
    if ([v35 count])
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        id v36 = VCPLogInstance();
        os_log_type_t v37 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v36, v37))
        {
          id v38 = [v35 count];
          *(_DWORD *)long long buf = 138412546;
          *(void *)&uint8_t buf[4] = @"[HomeIngestion]";
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v38;
          _os_log_impl((void *)&_mh_execute_header, v36, v37, "%@ %lu deleted FaceCrop(s); removing from Gallery ...",
            buf,
            0x16u);
        }
      }
      v69[0] = _NSConcreteStackBlock;
      v69[1] = 3221225472;
      v69[2] = sub_100145A60;
      v69[3] = &unk_10021EA90;
      id v70 = v35;
      v71 = @"[HomeIngestion]";
      v39 = objc_retainBlock(v69);
      CFStringRef v40 = [(GDVUVisualUnderstandingService *)self->_vuService gallery];
      id v68 = 0;
      unsigned __int8 v41 = [v40 mutateAndReturnError:&v68 handler:v39];
      id v42 = v68;

      if ((v41 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
      {
        v43 = VCPLogInstance();
        os_log_type_t v44 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v43, v44))
        {
          *(_DWORD *)long long buf = 138412546;
          *(void *)&uint8_t buf[4] = @"[HomeIngestion]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v42;
          _os_log_impl((void *)&_mh_execute_header, v43, v44, "%@ Failed to remove FaceCrop(s) from Gallery %@", buf, 0x16u);
        }
      }
    }
  }
  v45 = [(GDVUVisualUnderstandingService *)self->_vuService gallery];
  unsigned __int8 v46 = [v45 ready];

  if ((v46 & 1) == 0)
  {
    v49 = [(GDVUVisualUnderstandingService *)self->_vuService gallery];
    v66 = self;
    id v67 = 0;
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_100145DDC;
    v64[3] = &unk_10021DAE8;
    v65 = @"[HomeIngestion]";
    unsigned int v50 = [v49 updateAndReturnError:&v67 progressHandler:v64];
    v47 = v67;

    if (v50)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v51 = VCPLogInstance();
        os_log_type_t v52 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v51, v52))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)&uint8_t buf[4] = @"[HomeIngestion]";
          v53 = "%@ Gallery updated!";
          v54 = v51;
          os_log_type_t v55 = v52;
          uint32_t v56 = 12;
LABEL_51:
          _os_log_impl((void *)&_mh_execute_header, v54, v55, v53, buf, v56);
          goto LABEL_52;
        }
        goto LABEL_52;
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v51 = VCPLogInstance();
      os_log_type_t v57 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v51, v57))
      {
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = @"[HomeIngestion]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v47;
        v53 = "%@ Failed to update gallery - %@";
        v54 = v51;
        os_log_type_t v55 = v57;
        uint32_t v56 = 22;
        goto LABEL_51;
      }
LABEL_52:
    }
LABEL_54:

    goto LABEL_55;
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v47 = VCPLogInstance();
    os_log_type_t v48 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v47, v48))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = @"[HomeIngestion]";
      _os_log_impl((void *)&_mh_execute_header, v47, v48, "%@ Gallery is ready; skip updating", buf, 0xCu);
    }
    goto LABEL_54;
  }
LABEL_55:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientAssets, 0);
  objc_storeStrong((id *)&self->_vuKnownAssets, 0);
  objc_storeStrong((id *)&self->_vuService, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end