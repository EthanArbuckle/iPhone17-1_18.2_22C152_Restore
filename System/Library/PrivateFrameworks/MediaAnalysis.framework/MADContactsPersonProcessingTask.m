@interface MADContactsPersonProcessingTask
- (MADContactsPersonProcessingTask)init;
- (int)_analyzeContactWithContactUUID:(id)a3 assetUUID:(id)a4 confirmed:(BOOL)a5 andCVPixelBuffer:(__CVBuffer *)a6;
- (int)_processContactWithIdentifier:(id)a3 andImageData:(id)a4;
- (int)_processContactWithIdentifier:(id)a3 andPosterArchiveData:(id)a4;
- (void)process;
@end

@implementation MADContactsPersonProcessingTask

- (MADContactsPersonProcessingTask)init
{
  v29.receiver = self;
  v29.super_class = (Class)MADContactsPersonProcessingTask;
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
    v8 = (void *)qword_100252828;
    uint64_t v33 = qword_100252828;
    if (!qword_100252828)
    {
      *(void *)&long long buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472;
      v35 = sub_10014A8E8;
      v36 = &unk_100219E10;
      v37 = &v30;
      sub_10014A8E8((uint64_t)&buf);
      v8 = (void *)v31[3];
    }
    v9 = v8;
    _Block_object_dispose(&v30, 8);
    id v10 = [v9 alloc];
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2050000000;
    v11 = (void *)qword_100252838;
    uint64_t v33 = qword_100252838;
    if (!qword_100252838)
    {
      *(void *)&long long buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472;
      v35 = sub_10014AAB0;
      v36 = &unk_100219E10;
      v37 = &v30;
      sub_10014AAB0((uint64_t)&buf);
      v11 = (void *)v31[3];
    }
    id v12 = v11;
    _Block_object_dispose(&v30, 8);
    v13 = [v12 contacts];
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
        _os_log_impl((void *)&_mh_execute_header, p_super, v25, "Failed to create MADGDVisualUnderstandingService instance - %@", (uint8_t *)&buf, 0xCu);
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

- (int)_analyzeContactWithContactUUID:(id)a3 assetUUID:(id)a4 confirmed:(BOOL)a5 andCVPixelBuffer:(__CVBuffer *)a6
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
        CFStringRef v40 = @"[ContactIngestion][FaceProcessing]";
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
      v32[2] = sub_100147B90;
      v32[3] = &unk_10021E9F0;
      id v33 = v18;
      v34 = @"[ContactIngestion][FaceProcessing]";
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
            CFStringRef v40 = @"[ContactIngestion][FaceProcessing]";
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

- (int)_processContactWithIdentifier:(id)a3 andImageData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:v6];
  if (v8)
  {
    v31[1] = 0;
    int8x16_t v9 = (int8x16_t)vdupq_n_s64((unint64_t)[v6 hash]);
    v31[0] = vmovn_s16(vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8(v9, (int8x16_t)xmmword_1001F22F0), (uint64x2_t)xmmword_1001F2320), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8(v9, (int8x16_t)xmmword_1001F2300), (uint64x2_t)xmmword_1001F2310)), (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8(v9, (int8x16_t)xmmword_1001F22D0), (uint64x2_t)xmmword_1001F2340), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8(v9, (int8x16_t)xmmword_1001F22E0), (uint64x2_t)xmmword_1001F2330))));
    id v10 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v31];
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      id v11 = VCPLogInstance();
      os_log_type_t v12 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v11, v12))
      {
        int v25 = 138412546;
        CFStringRef v26 = @"[ContactIngestion][Avatar]";
        __int16 v27 = 2112;
        id v28 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "%@ Receiving asset %@", (uint8_t *)&v25, 0x16u);
      }
    }
    if (!v10)
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v18 = -18;
        goto LABEL_33;
      }
      v13 = VCPLogInstance();
      os_log_type_t v19 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v13, v19))
      {
        int v25 = 138412546;
        CFStringRef v26 = @"[ContactIngestion][Avatar]";
        __int16 v27 = 2112;
        id v28 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, v19, "%@ Invalid asset identifier %@", (uint8_t *)&v25, 0x16u);
      }
      int v18 = -18;
      goto LABEL_30;
    }
    [(NSMutableSet *)self->_clientAssets addObject:v10];
    if ([(NSSet *)self->_vuKnownAssets containsObject:v10])
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v13 = VCPLogInstance();
        os_log_type_t v14 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v13, v14))
        {
          int v25 = 138412546;
          CFStringRef v26 = @"[ContactIngestion][Avatar]";
          __int16 v27 = 2112;
          id v28 = v10;
          int v15 = "%@ Gallery already indexes contact data (asset) %@; ignoring";
LABEL_28:
          _os_log_impl((void *)&_mh_execute_header, v13, v14, v15, (uint8_t *)&v25, 0x16u);
          goto LABEL_29;
        }
        goto LABEL_29;
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        os_log_type_t v20 = VCPLogInstance();
        os_log_type_t v21 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v20, v21))
        {
          int v25 = 138412802;
          CFStringRef v26 = @"[ContactIngestion][Avatar]";
          __int16 v27 = 2112;
          id v28 = v6;
          __int16 v29 = 2112;
          id v30 = v10;
          _os_log_impl((void *)&_mh_execute_header, v20, v21, "%@ Processing contact %@ with avatar data %@ ... ", (uint8_t *)&v25, 0x20u);
        }
      }
      uint64_t v22 = +[VCPImageManager sharedImageManager];
      id v23 = [v22 pixelBufferWithFormat:875704422 andMaxDimension:0 fromData:v7 withUniformTypeIdentifier:UTTypeJPEG flushCache:1 orientation:0];

      int v18 = [(MADContactsPersonProcessingTask *)self _analyzeContactWithContactUUID:v8 assetUUID:v10 confirmed:0 andCVPixelBuffer:v23];
      if (v18) {
        goto LABEL_33;
      }
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v13 = VCPLogInstance();
        os_log_type_t v14 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v13, v14))
        {
          int v25 = 138412546;
          CFStringRef v26 = @"[ContactIngestion][Avatar]";
          __int16 v27 = 2112;
          id v28 = v6;
          int v15 = "%@ Finished processing contact %@ with avatar data";
          goto LABEL_28;
        }
LABEL_29:
        int v18 = 0;
LABEL_30:

LABEL_33:
        goto LABEL_34;
      }
    }
    int v18 = 0;
    goto LABEL_33;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v16 = VCPLogInstance();
    os_log_type_t v17 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v16, v17))
    {
      int v25 = 138412546;
      CFStringRef v26 = @"[ContactIngestion][Avatar]";
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "%@ Invalid contact identifier %@", (uint8_t *)&v25, 0x16u);
    }
  }
  int v18 = -18;
LABEL_34:

  return v18;
}

- (int)_processContactWithIdentifier:(id)a3 andPosterArchiveData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:v6];
  if (v8)
  {
    if (v7)
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        int8x16_t v9 = VCPLogInstance();
        os_log_type_t v10 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v9, v10))
        {
          *(_DWORD *)long long buf = 138412546;
          *(void *)&uint8_t buf[4] = @"[ContactIngestion][Poster]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v6;
          _os_log_impl((void *)&_mh_execute_header, v9, v10, "%@ Processing contact %@ with poster archive data ... ", buf, 0x16u);
        }
      }
      int8x8_t v84 = 0;
      v85 = &v84;
      uint64_t v86 = 0x2050000000;
      id v11 = (void *)qword_100252848;
      uint64_t v87 = qword_100252848;
      if (!qword_100252848)
      {
        *(void *)long long buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = sub_10014AB60;
        CFStringRef v82 = (const __CFString *)&unk_100219E10;
        v83 = &v84;
        sub_10014AB60((uint64_t)buf);
        id v11 = (void *)v85[3];
      }
      id v12 = v11;
      _Block_object_dispose(&v84, 8);
      id v80 = 0;
      v13 = [v12 unarchiveConfigurationFromData:v7 error:&v80];
      os_log_type_t v14 = v80;
      if (v13)
      {
        int v15 = [v13 providerBundleIdentifier];
        unsigned __int8 v16 = [v15 isEqualToString:@"com.apple.PhotosUIPrivate.PhotosPosterProvider"];

        if (v16)
        {
          os_log_type_t v17 = [v13 assetDirectory];
          if (v17)
          {
            v79 = v14;
            v77 = +[PFPosterConfiguration loadFromURL:v17 error:&v79];
            v75 = v79;

            if (v77)
            {
              int v18 = [v77 userInfo];
              v74 = v18;
              if (v18)
              {
                os_log_type_t v19 = [v18 objectForKeyedSubscript:@"representsDeviceOwner"];
                unsigned int v73 = [v19 BOOLValue];

                if ((int)MediaAnalysisLogLevel() >= 7)
                {
                  os_log_type_t v20 = VCPLogInstance();
                  os_log_type_t v21 = VCPLogToOSLogType[7];
                  if (os_log_type_enabled(v20, v21))
                  {
                    CFStringRef v22 = @"NO";
                    if (v73) {
                      CFStringRef v22 = @"YES";
                    }
                    *(_DWORD *)long long buf = 138412546;
                    *(void *)&uint8_t buf[4] = @"[ContactIngestion][Poster]";
                    *(_WORD *)&buf[12] = 2112;
                    *(void *)&buf[14] = v22;
                    _os_log_impl((void *)&_mh_execute_header, v20, v21, "%@ representsDeviceOwner: %@", buf, 0x16u);
                  }
                }
                id v23 = [v74 objectForKeyedSubscript:@"hashedAssetIdentifier"];
                id v24 = [v23 unsignedIntegerValue];

                v85 = 0;
                int8x16_t v25 = (int8x16_t)vdupq_n_s64((unint64_t)v24);
                int8x8_t v84 = vmovn_s16(vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8(v25, (int8x16_t)xmmword_1001F22F0), (uint64x2_t)xmmword_1001F2320), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8(v25, (int8x16_t)xmmword_1001F2300), (uint64x2_t)xmmword_1001F2310)), (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8(v25, (int8x16_t)xmmword_1001F22D0), (uint64x2_t)xmmword_1001F2340), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8(v25, (int8x16_t)xmmword_1001F22E0), (uint64x2_t)xmmword_1001F2330))));
                id v26 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:&v84];
                if ((int)MediaAnalysisLogLevel() >= 7)
                {
                  __int16 v27 = VCPLogInstance();
                  os_log_type_t v28 = VCPLogToOSLogType[7];
                  if (os_log_type_enabled(v27, v28))
                  {
                    *(_DWORD *)long long buf = 138412546;
                    *(void *)&uint8_t buf[4] = @"[ContactIngestion][Poster]";
                    *(_WORD *)&buf[12] = 2112;
                    *(void *)&buf[14] = v26;
                    _os_log_impl((void *)&_mh_execute_header, v27, v28, "%@ Receiving asset %@", buf, 0x16u);
                  }
                }
                if (v26)
                {
                  [(NSMutableSet *)self->_clientAssets addObject:v26];
                  if ([(NSSet *)self->_vuKnownAssets containsObject:v26])
                  {
                    if ((int)MediaAnalysisLogLevel() >= 7)
                    {
                      __int16 v29 = VCPLogInstance();
                      os_log_type_t v30 = VCPLogToOSLogType[7];
                      if (os_log_type_enabled(v29, v30))
                      {
                        *(_DWORD *)long long buf = 138412546;
                        *(void *)&uint8_t buf[4] = @"[ContactIngestion][Poster]";
                        *(_WORD *)&buf[12] = 2112;
                        *(void *)&buf[14] = v26;
                        _os_log_impl((void *)&_mh_execute_header, v29, v30, "%@ Gallery already indexes contact data (asset) %@; ignoring",
                          buf,
                          0x16u);
                      }
                    }
                    int v31 = 0;
                    goto LABEL_99;
                  }
                  v48 = [v77 media];
                  if ([v48 count])
                  {
                    v49 = [v77 media];
                    BOOL v50 = (unint64_t)[v49 count] > 1;

                    if (!v50) {
                      goto LABEL_75;
                    }
                  }
                  else
                  {
                  }
                  if ((int)MediaAnalysisLogLevel() >= 4)
                  {
                    v51 = VCPLogInstance();
                    os_log_type_t v52 = VCPLogToOSLogType[4];
                    if (os_log_type_enabled(v51, v52))
                    {
                      v53 = [v77 media];
                      id v54 = [v53 count];
                      *(_DWORD *)long long buf = 138412546;
                      *(void *)&uint8_t buf[4] = @"[ContactIngestion][Poster]";
                      *(_WORD *)&buf[12] = 2048;
                      *(void *)&buf[14] = v54;
                      _os_log_impl((void *)&_mh_execute_header, v51, v52, "%@ Photos poster configuration has %lu media (expected 1)", buf, 0x16u);
                    }
                  }
LABEL_75:
                  v55 = [v77 media];
                  v71 = [v55 firstObject];

                  v56 = [v71 subpath];
                  v72 = [v17 URLByAppendingPathComponent:v56];

                  v78 = v75;
                  v57 = [sub_1001496E4() loadCompoundLayerStackFromWallpaperURL:v72 options:1 error:&v78];
                  CFStringRef v70 = v78;

                  v58 = v57;
                  if (v57)
                  {
                    v59 = [v57 portraitLayerStack];
                    v60 = v59;
                    if (v59)
                    {
                      v61 = [v59 backgroundLayer];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        int v31 = [(MADContactsPersonProcessingTask *)self _analyzeContactWithContactUUID:v8 assetUUID:v26 confirmed:v73 andCVPixelBuffer:[v61 image]];
                        if (v31)
                        {
LABEL_96:

                          goto LABEL_97;
                        }
                        if ((int)MediaAnalysisLogLevel() < 7)
                        {
                          int v31 = 0;
                          goto LABEL_96;
                        }
                        v76 = v61;
                        v62 = VCPLogInstance();
                        os_log_type_t v63 = VCPLogToOSLogType[7];
                        if (os_log_type_enabled(v62, v63))
                        {
                          *(_DWORD *)long long buf = 138412546;
                          *(void *)&uint8_t buf[4] = @"[ContactIngestion][Poster]";
                          *(_WORD *)&buf[12] = 2112;
                          *(void *)&buf[14] = v6;
                          _os_log_impl((void *)&_mh_execute_header, v62, v63, "%@ Finished processing contact %@ with poster archive data", buf, 0x16u);
                        }
                        v64 = v62;
                        int v31 = 0;
LABEL_94:

                        v61 = v76;
                        goto LABEL_96;
                      }
                      if ((int)MediaAnalysisLogLevel() >= 3)
                      {
                        v76 = v61;
                        v67 = VCPLogInstance();
                        os_log_type_t v68 = VCPLogToOSLogType[3];
                        if (os_log_type_enabled(v67, v68))
                        {
                          *(_DWORD *)long long buf = 138412290;
                          *(void *)&uint8_t buf[4] = @"[ContactIngestion][Poster]";
                          _os_log_impl((void *)&_mh_execute_header, v67, v68, "%@ Expected an image layer from portraitLayerStack", buf, 0xCu);
                        }
                        v64 = v67;
                        int v31 = -18;
                        goto LABEL_94;
                      }
LABEL_95:
                      int v31 = -18;
                      goto LABEL_96;
                    }
                    if ((int)MediaAnalysisLogLevel() >= 3)
                    {
                      v61 = VCPLogInstance();
                      os_log_type_t v66 = VCPLogToOSLogType[3];
                      if (os_log_type_enabled(v61, v66))
                      {
                        *(_DWORD *)long long buf = 138412290;
                        *(void *)&uint8_t buf[4] = @"[ContactIngestion][Poster]";
                        _os_log_impl((void *)&_mh_execute_header, v61, v66, "%@ Failed to load portraitLayerStack", buf, 0xCu);
                      }
                      goto LABEL_95;
                    }
                  }
                  else
                  {
                    if ((int)MediaAnalysisLogLevel() < 3)
                    {
                      int v31 = -18;
                      goto LABEL_98;
                    }
                    v60 = VCPLogInstance();
                    os_log_type_t v65 = VCPLogToOSLogType[3];
                    if (os_log_type_enabled(v60, v65))
                    {
                      *(_DWORD *)long long buf = 138412802;
                      *(void *)&uint8_t buf[4] = @"[ContactIngestion][Poster]";
                      *(_WORD *)&buf[12] = 2112;
                      *(void *)&buf[14] = v72;
                      *(_WORD *)&buf[22] = 2112;
                      CFStringRef v82 = v70;
                      _os_log_impl((void *)&_mh_execute_header, v60, v65, "%@ Failed to load layer stack at %@ - %@", buf, 0x20u);
                    }
                  }
                  int v31 = -18;
LABEL_97:

                  v58 = v57;
LABEL_98:

                  v75 = v70;
                  goto LABEL_99;
                }
                if ((int)MediaAnalysisLogLevel() >= 3)
                {
                  v45 = VCPLogInstance();
                  os_log_type_t v47 = VCPLogToOSLogType[3];
                  if (os_log_type_enabled(v45, v47))
                  {
                    *(_DWORD *)long long buf = 138412546;
                    *(void *)&uint8_t buf[4] = @"[ContactIngestion][Poster]";
                    *(_WORD *)&buf[12] = 2112;
                    *(void *)&buf[14] = 0;
                    _os_log_impl((void *)&_mh_execute_header, v45, v47, "%@ Invalid asset identifier %@", buf, 0x16u);
                  }
LABEL_65:
                }
              }
              else if ((int)MediaAnalysisLogLevel() >= 4)
              {
                v45 = VCPLogInstance();
                os_log_type_t v46 = VCPLogToOSLogType[4];
                if (os_log_type_enabled(v45, v46))
                {
                  *(_DWORD *)long long buf = 138412290;
                  *(void *)&uint8_t buf[4] = @"[ContactIngestion][Poster]";
                  _os_log_impl((void *)&_mh_execute_header, v45, v46, "%@ Photos poster configuration does not have userInfo", buf, 0xCu);
                }
                goto LABEL_65;
              }
              id v26 = 0;
              int v31 = -18;
LABEL_99:

              v43 = v74;
LABEL_100:

              os_log_type_t v14 = v75;
              goto LABEL_101;
            }
            os_log_type_t v14 = v75;
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              v43 = VCPLogInstance();
              os_log_type_t v44 = VCPLogToOSLogType[3];
              if (os_log_type_enabled(v43, v44))
              {
                *(_DWORD *)long long buf = 138412802;
                *(void *)&uint8_t buf[4] = @"[ContactIngestion][Poster]";
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v17;
                *(_WORD *)&buf[22] = 2112;
                CFStringRef v82 = (const __CFString *)v75;
                _os_log_impl((void *)&_mh_execute_header, v43, v44, "%@ Failed to load photos poster configuration at %@ - %@", buf, 0x20u);
              }
              int v31 = -18;
              goto LABEL_100;
            }
LABEL_57:
            int v31 = -18;
LABEL_101:

            goto LABEL_102;
          }
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            __int16 v41 = VCPLogInstance();
            os_log_type_t v42 = VCPLogToOSLogType[3];
            v77 = v41;
            if (os_log_type_enabled(v41, v42))
            {
              *(_DWORD *)long long buf = 138412290;
              *(void *)&uint8_t buf[4] = @"[ContactIngestion][Poster]";
              _os_log_impl((void *)&_mh_execute_header, v41, v42, "%@ Nil posterAssetURL", buf, 0xCu);
            }
            goto LABEL_57;
          }
LABEL_52:
          int v31 = -18;
LABEL_102:

          goto LABEL_103;
        }
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          os_log_type_t v17 = VCPLogInstance();
          os_log_type_t v39 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v17, v39))
          {
            CFStringRef v40 = [v13 providerBundleIdentifier];
            *(_DWORD *)long long buf = 138412802;
            *(void *)&uint8_t buf[4] = @"[ContactIngestion][Poster]";
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v40;
            *(_WORD *)&buf[22] = 2112;
            CFStringRef v82 = @"com.apple.PhotosUIPrivate.PhotosPosterProvider";
            _os_log_impl((void *)&_mh_execute_header, v17, v39, "%@ Unsupported poster bundle identifier %@ (expect %@); skipping",
              buf,
              0x20u);
          }
          int v31 = 0;
          goto LABEL_102;
        }
        int v31 = 0;
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          os_log_type_t v17 = VCPLogInstance();
          os_log_type_t v38 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v17, v38))
          {
            *(_DWORD *)long long buf = 138412546;
            *(void *)&uint8_t buf[4] = @"[ContactIngestion][Poster]";
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v14;
            _os_log_impl((void *)&_mh_execute_header, v17, v38, "%@ Failed to load poster configuration - %@", buf, 0x16u);
          }
          goto LABEL_52;
        }
        int v31 = -18;
      }
LABEL_103:

      goto LABEL_104;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      os_log_type_t v14 = VCPLogInstance();
      os_log_type_t v37 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v14, v37))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = @"[ContactIngestion][Poster]";
        id v33 = "%@ Nil archived poster data";
        v34 = v14;
        os_log_type_t v35 = v37;
        uint32_t v36 = 12;
        goto LABEL_37;
      }
      goto LABEL_38;
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 3)
  {
    os_log_type_t v14 = VCPLogInstance();
    os_log_type_t v32 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v14, v32))
    {
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = @"[ContactIngestion][Poster]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      id v33 = "%@ Invalid contact identifier %@";
      v34 = v14;
      os_log_type_t v35 = v32;
      uint32_t v36 = 22;
LABEL_37:
      _os_log_impl((void *)&_mh_execute_header, v34, v35, v33, buf, v36);
    }
LABEL_38:
    int v31 = -18;
LABEL_104:

    goto LABEL_105;
  }
  int v31 = -18;
LABEL_105:

  return v31;
}

- (void)process
{
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v2 = VCPLogInstance();
    os_log_type_t v3 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v2, v3))
    {
      *(_DWORD *)long long buf = 138412290;
      CFStringRef v78 = @"[ContactIngestion]";
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "%@ Start processing ...", buf, 0xCu);
    }
  }
  id v58 = objc_alloc_init((Class)CNContactStoreConfiguration);
  [v58 setIncludeSharedPhotoContacts:0];
  id v57 = [objc_alloc((Class)CNContactStore) initWithConfiguration:v58];
  id v4 = objc_alloc((Class)CNContactFetchRequest);
  v90[0] = CNContactIdentifierKey;
  v90[1] = CNContactGivenNameKey;
  v90[2] = CNContactFamilyNameKey;
  v90[3] = CNContactEmailAddressesKey;
  v90[4] = CNContactPhoneNumbersKey;
  v90[5] = CNContactWallpaperKey;
  v90[6] = CNContactSharedPhotoDisplayPreferenceKey;
  v90[7] = CNContactThumbnailImageDataKey;
  uint64_t v5 = +[NSArray arrayWithObjects:v90 count:8];
  id v56 = [v4 initWithKeysToFetch:v5];

  +[NSMutableArray array];
  id v76 = 0;
  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472;
  v74[2] = sub_10014A318;
  v74[3] = &unk_10021EAD0;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v75 = v6;
  objc_msgSend(v57, "enumerateContactsWithFetchRequest:error:usingBlock:", v56, &v76, v74, v6);
  id v55 = v76;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v70 objects:v89 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v71;
    os_log_type_t type = VCPLogToOSLogType[7];
LABEL_7:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v71 != v8) {
        objc_enumerationMutation(obj);
      }
      os_log_type_t v10 = *(void **)(*((void *)&v70 + 1) + 8 * v9);
      id v12 = [(MADProcessingTask *)self cancelBlock];
      if (!v12) {
        goto LABEL_13;
      }
      v13 = [(MADProcessingTask *)self cancelBlock];
      char v14 = v13[2]();

      if (v14)
      {
        char v15 = 1;
      }
      else
      {
LABEL_13:
        unsigned __int8 v16 = +[VCPWatchdog sharedWatchdog];
        [v16 pet];

        os_log_type_t v17 = [v10 identifier];
        int v18 = [v17 substringToIndex:36];

        os_log_type_t v19 = [v10 givenName];
        os_log_type_t v20 = [v10 familyName];
        os_log_type_t v21 = [v10 wallpaper];
        CFStringRef v22 = [v21 posterArchiveData];

        id v23 = [v10 thumbnailImageData];
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          id v24 = VCPLogInstance();
          if (os_log_type_enabled(v24, type))
          {
            *(_DWORD *)long long buf = 138413570;
            CFStringRef v25 = @"YES";
            if (v22) {
              CFStringRef v26 = @"YES";
            }
            else {
              CFStringRef v26 = @"NO";
            }
            CFStringRef v78 = @"[ContactIngestion]";
            if (!v23) {
              CFStringRef v25 = @"NO";
            }
            __int16 v79 = 2112;
            id v80 = v18;
            __int16 v81 = 2112;
            CFStringRef v82 = v19;
            __int16 v83 = 2112;
            int8x8_t v84 = v20;
            __int16 v85 = 2112;
            CFStringRef v86 = v26;
            __int16 v87 = 2112;
            CFStringRef v88 = v25;
            _os_log_impl((void *)&_mh_execute_header, v24, type, "%@ Contact: %@ (%@ %@), wallpaper.posterArchiveData: %@, thumbnailImageData: %@", buf, 0x3Eu);
          }
        }
        if (v22)
        {
          [(MADContactsPersonProcessingTask *)self _processContactWithIdentifier:v18 andPosterArchiveData:v22];
        }
        else if (v23)
        {
          [(MADContactsPersonProcessingTask *)self _processContactWithIdentifier:v18 andImageData:v23];
        }

        char v15 = 0;
      }
      if (v15) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [obj countByEnumeratingWithState:&v70 objects:v89 count:16];
        if (v7) {
          goto LABEL_7;
        }
        break;
      }
    }
  }

  __int16 v27 = [(MADProcessingTask *)self cancelBlock];
  if (v27)
  {
    os_log_type_t v28 = [(MADProcessingTask *)self cancelBlock];
    char v29 = v28[2]();

    if (v29) {
      goto LABEL_60;
    }
  }
  os_log_type_t v30 = +[VCPWatchdog sharedWatchdog];
  [v30 pet];

  int v31 = self;
  if ([(NSSet *)self->_vuKnownAssets count])
  {
    id v32 = [(NSSet *)self->_vuKnownAssets mutableCopy];
    [v32 minusSet:self->_clientAssets];
    if ([v32 count])
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        id v33 = VCPLogInstance();
        os_log_type_t v34 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v33, v34))
        {
          os_log_type_t v35 = [v32 count];
          *(_DWORD *)long long buf = 138412546;
          CFStringRef v78 = @"[ContactIngestion]";
          __int16 v79 = 2048;
          id v80 = v35;
          _os_log_impl((void *)&_mh_execute_header, v33, v34, "%@ %lu deleted asset(s); removing from Gallery ...",
            buf,
            0x16u);
        }
      }
      v67[0] = _NSConcreteStackBlock;
      v67[1] = 3221225472;
      v67[2] = sub_10014A324;
      v67[3] = &unk_10021EA90;
      id v68 = v32;
      v69 = @"[ContactIngestion]";
      uint32_t v36 = objc_retainBlock(v67);
      os_log_type_t v37 = [(GDVUVisualUnderstandingService *)self->_vuService gallery];
      id v66 = 0;
      unsigned __int8 v38 = [v37 mutateAndReturnError:&v66 handler:v36];
      os_log_type_t v39 = v66;

      if ((v38 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
      {
        CFStringRef v40 = VCPLogInstance();
        os_log_type_t v41 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v40, v41))
        {
          *(_DWORD *)long long buf = 138412546;
          CFStringRef v78 = @"[ContactIngestion]";
          __int16 v79 = 2112;
          id v80 = v39;
          _os_log_impl((void *)&_mh_execute_header, v40, v41, "%@ Failed to remove asset(s) from Gallery %@", buf, 0x16u);
        }
      }
    }

    int v31 = self;
  }
  os_log_type_t v42 = [(GDVUVisualUnderstandingService *)v31->_vuService gallery];
  unsigned __int8 v43 = [v42 ready];

  if ((v43 & 1) == 0)
  {
    os_log_type_t v46 = [(GDVUVisualUnderstandingService *)self->_vuService gallery];
    v64 = self;
    id v65 = 0;
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_10014A6A0;
    v62[3] = &unk_10021DAE8;
    os_log_type_t v63 = @"[ContactIngestion]";
    unsigned int v47 = [v46 updateAndReturnError:&v65 progressHandler:v62];
    os_log_type_t v44 = v65;

    if (v47)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v48 = VCPLogInstance();
        os_log_type_t v49 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v48, v49))
        {
          *(_DWORD *)long long buf = 138412290;
          CFStringRef v78 = @"[ContactIngestion]";
          BOOL v50 = "%@ Gallery updated!";
          v51 = v48;
          os_log_type_t v52 = v49;
          uint32_t v53 = 12;
LABEL_56:
          _os_log_impl((void *)&_mh_execute_header, v51, v52, v50, buf, v53);
          goto LABEL_57;
        }
        goto LABEL_57;
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v48 = VCPLogInstance();
      os_log_type_t v54 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v48, v54))
      {
        *(_DWORD *)long long buf = 138412546;
        CFStringRef v78 = @"[ContactIngestion]";
        __int16 v79 = 2112;
        id v80 = v44;
        BOOL v50 = "%@ Failed to update gallery - %@";
        v51 = v48;
        os_log_type_t v52 = v54;
        uint32_t v53 = 22;
        goto LABEL_56;
      }
LABEL_57:
    }
LABEL_59:

    goto LABEL_60;
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    os_log_type_t v44 = VCPLogInstance();
    os_log_type_t v45 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v44, v45))
    {
      *(_DWORD *)long long buf = 138412290;
      CFStringRef v78 = @"[ContactIngestion]";
      _os_log_impl((void *)&_mh_execute_header, v44, v45, "%@ Gallery is ready; skip updating", buf, 0xCu);
    }
    goto LABEL_59;
  }
LABEL_60:
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