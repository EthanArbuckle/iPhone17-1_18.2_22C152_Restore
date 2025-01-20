@interface MADSpotlightImageAssetEntryBase
- (BOOL)isMovieAsset;
- (BOOL)needsEmbeddingProcessing;
- (BOOL)needsOCRProcessing;
- (BOOL)needsSceneProcessing;
- (NSArray)embeddings;
- (NSSet)nsfwClassifications;
- (NSSet)sceneClassifications;
- (NSString)filePath;
- (NSString)uniqueIdentifier;
- (VNDocumentObservation)ocrObservation;
- (__CVBuffer)decodeImageAtImageURL:(id)a3;
- (__CVBuffer)decodeImageAtVideoURL:(id)a3;
- (float)aestheticScore;
- (id)logPrefix;
- (int)ocrVersion;
- (int)sceneVersion;
- (int)status;
- (unint64_t)embeddingVersion;
- (unint64_t)targetMajorDimensionForImageWithWidth:(unint64_t)a3 height:(unint64_t)a4 andMinPreferredMinorDimension:(unint64_t)a5;
- (void)processWithImageBackboneAnalyzer:(id)a3 commSafetyHandler:(id)a4 requestQueue:(id)a5 cancelBlock:(id)a6;
- (void)setAestheticScore:(float)a3;
- (void)setEmbeddingVersion:(unint64_t)a3;
- (void)setEmbeddings:(id)a3;
- (void)setIsMovieAsset:(BOOL)a3;
- (void)setNsfwClassifications:(id)a3;
- (void)setOcrObservation:(id)a3;
- (void)setOcrVersion:(int)a3;
- (void)setSceneClassifications:(id)a3;
- (void)setSceneVersion:(int)a3;
- (void)setStatus:(int)a3;
@end

@implementation MADSpotlightImageAssetEntryBase

- (id)logPrefix
{
  return 0;
}

- (__CVBuffer)decodeImageAtImageURL:(id)a3
{
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v4 = VCPLogInstance();
    os_log_type_t v5 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v4, v5))
    {
      v6 = [(MADSpotlightImageAssetEntryBase *)self logPrefix];
      int v8 = 138412290;
      v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "[%@][Process] decodeImageAtImageURL should be implemented in sub-class", (uint8_t *)&v8, 0xCu);
    }
  }
  return 0;
}

- (__CVBuffer)decodeImageAtVideoURL:(id)a3
{
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v4 = VCPLogInstance();
    os_log_type_t v5 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v4, v5))
    {
      v6 = [(MADSpotlightImageAssetEntryBase *)self logPrefix];
      int v8 = 138412290;
      v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "[%@][Process] decodeImageAtImageURL should be implemented in sub-class", (uint8_t *)&v8, 0xCu);
    }
  }
  return 0;
}

- (unint64_t)targetMajorDimensionForImageWithWidth:(unint64_t)a3 height:(unint64_t)a4 andMinPreferredMinorDimension:(unint64_t)a5
{
  int v5 = a4;
  int v6 = a3;
  double v8 = (double)a5;
  if ((int)a3 >= (int)a4) {
    int v9 = a4;
  }
  else {
    int v9 = a3;
  }
  if ((double)v9 <= v8)
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v21 = VCPLogInstance();
      os_log_type_t v22 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v21, v22))
      {
        v23 = [(MADSpotlightImageAssetEntryBase *)self logPrefix];
        int v31 = 138412802;
        v32 = v23;
        __int16 v33 = 1024;
        int v34 = v6;
        __int16 v35 = 1024;
        int v36 = v5;
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "[%@][Process] Processing image at full resolution (%dx%d)", (uint8_t *)&v31, 0x18u);
      }
      goto LABEL_18;
    }
    return 0;
  }
  int v10 = vcvtmd_s64_f64(log2((double)v9 / v8));
  int v11 = 1 << (v10 - 1);
  if (!v10) {
    int v11 = 0;
  }
  signed int v12 = ((v11 + v6) >> v10) & 0xFFFFFFFE;
  signed int v13 = ((v11 + v5) >> v10) & 0xFFFFFFFE;
  if (v12 * v13 <= 3657830)
  {
    int v25 = MediaAnalysisLogLevel();
    if (v10 >= 1)
    {
      if (v25 >= 7)
      {
        v26 = VCPLogInstance();
        os_log_type_t v27 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v26, v27))
        {
          v28 = [(MADSpotlightImageAssetEntryBase *)self logPrefix];
          int v31 = 138412802;
          v32 = v28;
          __int16 v33 = 1024;
          int v34 = v12;
          __int16 v35 = 1024;
          int v36 = v13;
          _os_log_impl((void *)&_mh_execute_header, v26, v27, "[%@][Process] Processing image at subsampled resolution (%dx%d)", (uint8_t *)&v31, 0x18u);
        }
      }
      if (v12 <= v13) {
        return v13;
      }
      else {
        return v12;
      }
    }
    if (v25 >= 7)
    {
      v21 = VCPLogInstance();
      os_log_type_t v29 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v21, v29))
      {
        v30 = [(MADSpotlightImageAssetEntryBase *)self logPrefix];
        int v31 = 138412802;
        v32 = v30;
        __int16 v33 = 1024;
        int v34 = v6;
        __int16 v35 = 1024;
        int v36 = v5;
        _os_log_impl((void *)&_mh_execute_header, v21, v29, "[%@][Process] Processing image at full resolution (%dx%d)", (uint8_t *)&v31, 0x18u);
      }
LABEL_18:

      return 0;
    }
    return 0;
  }
  double v14 = (double)v6;
  signed int v15 = (int)(sqrt((double)v6 * 3048192.0 / (double)v5) + 0.5) & 0xFFFFFFFE;
  signed int v16 = (int)(sqrt((double)v5 * 3048192.0 / v14) + 0.5) & 0xFFFFFFFE;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v17 = VCPLogInstance();
    os_log_type_t v18 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v17, v18))
    {
      v19 = [(MADSpotlightImageAssetEntryBase *)self logPrefix];
      int v31 = 138412802;
      v32 = v19;
      __int16 v33 = 1024;
      int v34 = v15;
      __int16 v35 = 1024;
      int v36 = v16;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "[%@][Process] Processing image at scaled resolution (%dx%d)", (uint8_t *)&v31, 0x18u);
    }
  }
  if (v15 <= v16) {
    return v16;
  }
  else {
    return v15;
  }
}

- (void)processWithImageBackboneAnalyzer:(id)a3 commSafetyHandler:(id)a4 requestQueue:(id)a5 cancelBlock:(id)a6
{
  id v172 = a3;
  id v170 = a4;
  queue = a5;
  v178 = (unsigned int (**)(void))a6;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    int v9 = VCPLogInstance();
    os_log_type_t v10 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v9, v10))
    {
      int v11 = [(MADSpotlightImageAssetEntryBase *)self logPrefix];
      signed int v12 = [(MADSpotlightImageAssetEntryBase *)self uniqueIdentifier];
      signed int v13 = [(MADSpotlightImageAssetEntryBase *)self filePath];
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2112;
      v223 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "[%@][Process][%@] Processing asset: %@", buf, 0x20u);
    }
  }
  double v14 = +[VCPWatchdog sharedWatchdog];
  [v14 pet];

  signed int v15 = [(MADSpotlightImageAssetEntryBase *)self filePath];
  v175 = +[NSURL fileURLWithPath:v15 isDirectory:0];

  CFTypeRef cf = 0;
  if ([(MADSpotlightImageAssetEntryBase *)self isMovieAsset])
  {
    CFTypeRef cf = [(MADSpotlightImageAssetEntryBase *)self decodeImageAtVideoURL:v175];
    *(void *)buf = 0;
    sub_100004484((const void **)buf);
  }
  else
  {
    CFTypeRef cf = [(MADSpotlightImageAssetEntryBase *)self decodeImageAtImageURL:v175];
    *(void *)buf = 0;
    sub_100004484((const void **)buf);
  }
  if (!cf)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      int v36 = VCPLogInstance();
      os_log_type_t v37 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v36, v37))
      {
        v38 = [(MADSpotlightImageAssetEntryBase *)self logPrefix];
        v39 = [(MADSpotlightImageAssetEntryBase *)self uniqueIdentifier];
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = v38;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v39;
        *(_WORD *)&buf[22] = 2112;
        v223 = v175;
        _os_log_impl((void *)&_mh_execute_header, v36, v37, "[%@][Process][%@] Failed to decode image (%@)", buf, 0x20u);
      }
    }
    [(MADSpotlightImageAssetEntryBase *)self setStatus:4294967278];
    goto LABEL_171;
  }
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v17 = VCPLogInstance();
    os_log_type_t v18 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v17, v18))
    {
      v19 = [(MADSpotlightImageAssetEntryBase *)self logPrefix];
      v20 = [(MADSpotlightImageAssetEntryBase *)self uniqueIdentifier];
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v20;
      *(_WORD *)&buf[22] = 2112;
      v223 = v175;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "[%@][Process][%@] Successfully decode image (%@)", buf, 0x20u);
    }
  }
  if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled]&& DeviceHasANE()&& [(MADSpotlightImageAssetEntryBase *)self needsEmbeddingProcessing])
  {
    id v21 = v172;
    if (!v172)
    {
      id v21 = [objc_alloc((Class)VCPImageBackboneAnalyzer) initWithRequestedAnalyses:0x1000000000000 andRevision:0 useSharedModel:1];
      if (!v21)
      {
        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          v162 = VCPLogInstance();
          os_log_type_t v163 = VCPLogToOSLogType[4];
          if (os_log_type_enabled(v162, v163))
          {
            v164 = [(MADSpotlightImageAssetEntryBase *)self logPrefix];
            v165 = [(MADSpotlightImageAssetEntryBase *)self uniqueIdentifier];
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v164;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v165;
            _os_log_impl((void *)&_mh_execute_header, v162, v163, "[%@][Process][%@] Failed to init imageBackboneAnalyzer", buf, 0x16u);
          }
        }
        id v172 = 0;
        [(MADSpotlightImageAssetEntryBase *)self setStatus:4294967188];
        goto LABEL_171;
      }
    }
    id v209 = 0;
    id v172 = v21;
    [v21 analyzePixelBuffer:cf flags:0 results:&v209 cancel:v178];
    id v22 = v209;
    v23 = [v22 objectForKeyedSubscript:@"ImageEmbeddingResults"];
    if ([v23 count])
    {
      v24 = [v23 objectAtIndexedSubscript:0];
      int v25 = [v24 objectForKeyedSubscript:@"attributes"];
      v26 = [v25 objectForKeyedSubscript:@"embeddings"];

      v226 = v26;
      os_log_type_t v27 = +[NSArray arrayWithObjects:&v226 count:1];
      [(MADSpotlightImageAssetEntryBase *)self setEmbeddings:v27];

      [(MADSpotlightImageAssetEntryBase *)self setEmbeddingVersion:+[VCPMediaAnalyzer getUnifiedEmbeddingVersion]];
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v223 = sub_1000FB720;
  v224 = sub_1000FB730;
  id v225 = 0;
  v28 = VCPSignPostLog();
  os_signpost_id_t v29 = os_signpost_id_generate(v28);

  v30 = VCPSignPostLog();
  int v31 = v30;
  if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    *(_WORD *)v211 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v31, OS_SIGNPOST_INTERVAL_BEGIN, v29, "VNImageRequestHandler_init", (const char *)&unk_1001F3BD3, v211, 2u);
  }

  id v32 = objc_alloc((Class)VNImageRequestHandler);
  id v167 = [v32 initWithCVPixelBuffer:cf options:&__NSDictionary0__struct];
  __int16 v33 = VCPSignPostLog();
  int v34 = v33;
  if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
  {
    *(_WORD *)v211 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v34, OS_SIGNPOST_INTERVAL_END, v29, "VNImageRequestHandler_init", (const char *)&unk_1001F3BD3, v211, 2u);
  }

  v171 = +[NSMutableArray array];
  if ([(MADSpotlightImageAssetEntryBase *)self needsOCRProcessing])
  {
    uint64_t v35 = +[VNRecognizeDocumentsRequest mad_defaultRequest];
    [v171 addObject:v35];
  }
  else
  {
    uint64_t v35 = 0;
  }
  v166 = (void *)v35;
  id v174 = objc_alloc_init((Class)VNSceneClassificationRequest);
  id v169 = objc_alloc_init((Class)VNClassifyImageAestheticsRequest);
  id v168 = objc_alloc_init((Class)VNClassifyImageRequest);
  if (![(MADSpotlightImageAssetEntryBase *)self needsSceneProcessing]) {
    goto LABEL_48;
  }
  [v174 setMetalContextPriority:1];
  [v174 setPreferBackgroundProcessing:1];
  if (DeviceHasANE())
  {
    v40 = +[VNProcessingDevice defaultANEDevice];
    [v174 setProcessingDevice:v40];
  }
  objc_msgSend(v174, "setMaximumLeafObservations:", 15, v166, v167);
  [v174 setMaximumHierarchicalObservations:15];
  uint64_t v41 = *(void *)&buf[8];
  id obj = *(id *)(*(void *)&buf[8] + 40);
  unsigned __int8 v42 = [v174 setRevision:3737841665 error:&obj];
  objc_storeStrong((id *)(v41 + 40), obj);
  if ((v42 & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v62 = VCPLogInstance();
      os_log_type_t v63 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v62, v63))
      {
        v64 = [(MADSpotlightImageAssetEntryBase *)self logPrefix];
        v65 = [(MADSpotlightImageAssetEntryBase *)self uniqueIdentifier];
        v66 = *(void **)(*(void *)&buf[8] + 40);
        *(_DWORD *)v211 = 138412802;
        v212 = v64;
        __int16 v213 = 2112;
        v214 = v65;
        __int16 v215 = 2112;
        id v216 = v66;
        _os_log_impl((void *)&_mh_execute_header, v62, v63, "[%@][Process][%@] Failed to configure scene classification (%@)", v211, 0x20u);
      }
      goto LABEL_88;
    }
    goto LABEL_89;
  }
  [v171 addObject:v174];
  if (+[VNRequest mad_includeEntityNet])
  {
    [v168 setMetalContextPriority:1];
    [v168 setPreferBackgroundProcessing:1];
    if (DeviceHasANE())
    {
      v43 = +[VNProcessingDevice defaultANEDevice];
      [v168 setProcessingDevice:v43];
    }
    [v168 setMaximumLeafObservations:15];
    [v168 setMaximumHierarchicalObservations:15];
    uint64_t v44 = *(void *)&buf[8];
    id v207 = *(id *)(*(void *)&buf[8] + 40);
    unsigned __int8 v45 = [v168 setRevision:3737841667 error:&v207];
    objc_storeStrong((id *)(v44 + 40), v207);
    if ((v45 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v62 = VCPLogInstance();
        os_log_type_t v84 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v62, v84))
        {
          v85 = [(MADSpotlightImageAssetEntryBase *)self logPrefix];
          v86 = [(MADSpotlightImageAssetEntryBase *)self uniqueIdentifier];
          v87 = *(void **)(*(void *)&buf[8] + 40);
          *(_DWORD *)v211 = 138412802;
          v212 = v85;
          __int16 v213 = 2112;
          v214 = v86;
          __int16 v215 = 2112;
          id v216 = v87;
          _os_log_impl((void *)&_mh_execute_header, v62, v84, "[%@][Process][%@] Failed to configure EntityNet (%@)", v211, 0x20u);
        }
        goto LABEL_88;
      }
LABEL_89:
      [(MADSpotlightImageAssetEntryBase *)self setStatus:4294967278];
      goto LABEL_170;
    }
    [v171 addObject:v168];
  }
  [v169 setMetalContextPriority:1];
  [v169 setPreferBackgroundProcessing:1];
  if (DeviceHasANE())
  {
    v46 = +[VNProcessingDevice defaultANEDevice];
    [v169 setProcessingDevice:v46];
  }
  uint64_t v47 = *(void *)&buf[8];
  id v206 = *(id *)(*(void *)&buf[8] + 40);
  unsigned __int8 v48 = [v169 setRevision:3737841667 error:&v206];
  objc_storeStrong((id *)(v47 + 40), v206);
  if ((v48 & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v62 = VCPLogInstance();
      os_log_type_t v80 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v62, v80))
      {
        v81 = [(MADSpotlightImageAssetEntryBase *)self logPrefix];
        v82 = [(MADSpotlightImageAssetEntryBase *)self uniqueIdentifier];
        v83 = *(void **)(*(void *)&buf[8] + 40);
        *(_DWORD *)v211 = 138412802;
        v212 = v81;
        __int16 v213 = 2112;
        v214 = v82;
        __int16 v215 = 2112;
        id v216 = v83;
        _os_log_impl((void *)&_mh_execute_header, v62, v80, "[%@][Process][%@] Failed to configure scene classification (%@)", v211, 0x20u);
      }
LABEL_88:

      goto LABEL_89;
    }
    goto LABEL_89;
  }
  [v171 addObject:v169];
LABEL_48:
  v49 = VCPSignPostLog();
  os_signpost_id_t v50 = os_signpost_id_generate(v49);

  v51 = VCPSignPostLog();
  v52 = v51;
  if (v50 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
  {
    *(_WORD *)v211 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v52, OS_SIGNPOST_INTERVAL_BEGIN, v50, "VNImageRequestHandler_performRequests", (const char *)&unk_1001F3BD3, v211, 2u);
  }

  uint64_t v202 = 0;
  v203 = &v202;
  uint64_t v204 = 0x2020000000;
  char v205 = 0;
  dispatch_semaphore_t v53 = dispatch_semaphore_create(0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FB738;
  block[3] = &unk_10021E068;
  v200 = &v202;
  id v197 = v167;
  id v54 = v171;
  id v198 = v54;
  v201 = buf;
  v55 = v53;
  v199 = v55;
  dispatch_async(queue, block);
  dispatch_time_t v56 = dispatch_time(0, 100000000);
  dsema = v55;
  if (dispatch_semaphore_wait(v55, v56))
  {
    do
    {
      if (v178 && v178[2]())
      {
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          v72 = VCPLogInstance();
          os_log_type_t v73 = VCPLogToOSLogType[5];
          if (os_log_type_enabled(v72, v73))
          {
            v74 = [(MADSpotlightImageAssetEntryBase *)self logPrefix];
            v75 = [(MADSpotlightImageAssetEntryBase *)self uniqueIdentifier];
            *(_DWORD *)v211 = 138412546;
            v212 = v74;
            __int16 v213 = 2112;
            v214 = v75;
            _os_log_impl((void *)&_mh_execute_header, v72, v73, "[%@][Process][%@] Processing canceled; skipping asset",
              v211,
              0x16u);
          }
        }
        -[MADSpotlightImageAssetEntryBase setStatus:](self, "setStatus:", 4294967168, v166);
        long long v194 = 0u;
        long long v195 = 0u;
        long long v192 = 0u;
        long long v193 = 0u;
        id v76 = v54;
        id v77 = [v76 countByEnumeratingWithState:&v192 objects:v221 count:16];
        if (v77)
        {
          uint64_t v78 = *(void *)v193;
          do
          {
            for (i = 0; i != v77; i = (char *)i + 1)
            {
              if (*(void *)v193 != v78) {
                objc_enumerationMutation(v76);
              }
              [*(id *)(*((void *)&v192 + 1) + 8 * i) cancel];
            }
            id v77 = [v76 countByEnumeratingWithState:&v192 objects:v221 count:16];
          }
          while (v77);
        }

        dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
        goto LABEL_169;
      }
      dispatch_time_t v57 = dispatch_time(0, 100000000);
    }
    while (dispatch_semaphore_wait(v55, v57));
  }
  v58 = VCPSignPostLog();
  v59 = v58;
  if (v50 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v58))
  {
    *(_WORD *)v211 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v59, OS_SIGNPOST_INTERVAL_END, v50, "VNImageRequestHandler_performRequests", (const char *)&unk_1001F3BD3, v211, 2u);
  }

  if (!*((unsigned char *)v203 + 24))
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v67 = VCPLogInstance();
      os_log_type_t v68 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v67, v68))
      {
        v69 = [(MADSpotlightImageAssetEntryBase *)self logPrefix];
        v70 = [(MADSpotlightImageAssetEntryBase *)self uniqueIdentifier];
        v71 = *(void **)(*(void *)&buf[8] + 40);
        *(_DWORD *)v211 = 138412802;
        v212 = v69;
        __int16 v213 = 2112;
        v214 = v70;
        __int16 v215 = 2112;
        id v216 = v71;
        _os_log_impl((void *)&_mh_execute_header, v67, v68, "[%@][Process][%@] Processing failed (%@)", v211, 0x20u);
      }
    }
    -[MADSpotlightImageAssetEntryBase setStatus:](self, "setStatus:", 4294967278, v166);
    goto LABEL_169;
  }
  if ([(MADSpotlightImageAssetEntryBase *)self needsOCRProcessing])
  {
    v60 = [v166 results];
    v61 = [v60 firstObject];

    if (v61)
    {
      [(MADSpotlightImageAssetEntryBase *)self setOcrVersion:8];
      [(MADSpotlightImageAssetEntryBase *)self setOcrObservation:v61];
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v88 = VCPLogInstance();
        os_log_type_t v89 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v88, v89))
        {
          v90 = [(MADSpotlightImageAssetEntryBase *)self logPrefix];
          v91 = [(MADSpotlightImageAssetEntryBase *)self uniqueIdentifier];
          *(_DWORD *)v211 = 138412546;
          v212 = v90;
          __int16 v213 = 2112;
          v214 = v91;
          _os_log_impl((void *)&_mh_execute_header, v88, v89, "[%@][Process][OCR][%@] Processing produced no results", v211, 0x16u);
        }
      }
      -[MADSpotlightImageAssetEntryBase setStatus:](self, "setStatus:", 4294967278, v166);
    }
  }
  if (![(MADSpotlightImageAssetEntryBase *)self needsSceneProcessing]) {
    goto LABEL_169;
  }
  v92 = [v174 results];
  BOOL v93 = v92 == 0;

  if (v93)
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v142 = VCPLogInstance();
      os_log_type_t v143 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v142, v143))
      {
        v144 = [(MADSpotlightImageAssetEntryBase *)self logPrefix];
        v145 = [(MADSpotlightImageAssetEntryBase *)self uniqueIdentifier];
        *(_DWORD *)v211 = 138412546;
        v212 = v144;
        __int16 v213 = 2112;
        v214 = v145;
        _os_log_impl((void *)&_mh_execute_header, v142, v143, "[%@][Process][Scene][%@] Processing produced no results", v211, 0x16u);
      }
    }
    [(MADSpotlightImageAssetEntryBase *)self setStatus:4294967278];
    goto LABEL_154;
  }
  v176 = +[NSMutableSet set];
  long long v190 = 0u;
  long long v191 = 0u;
  long long v189 = 0u;
  long long v188 = 0u;
  v94 = [v174 results];
  id v95 = [v94 countByEnumeratingWithState:&v188 objects:v220 count:16];
  if (v95)
  {
    uint64_t v96 = *(void *)v189;
    os_log_type_t v97 = VCPLogToOSLogType[3];
    do
    {
      for (j = 0; j != v95; j = (char *)j + 1)
      {
        if (*(void *)v189 != v96) {
          objc_enumerationMutation(v94);
        }
        v99 = *(void **)(*((void *)&v188 + 1) + 8 * (void)j);
        [v99 confidence];
        if (v100 >= 0.01)
        {
          v101 = +[PFSceneTaxonomy vcp_sharedTaxonomy];
          v102 = [v99 identifier];
          v103 = [v101 nodeForName:v102];

          if (v103)
          {
            [v103 highPrecisionThreshold];
            double v105 = v104;
            [v103 highRecallThreshold];
            double v107 = v106;
            [v103 searchThreshold];
            double v109 = v108;
            [v99 confidence];
            if (v105 >= v107) {
              double v111 = v107;
            }
            else {
              double v111 = v105;
            }
            if (v111 >= v109) {
              double v111 = v109;
            }
            double v112 = v110;
            if (v111 < 0.00999999978) {
              double v111 = 0.00999999978;
            }
            if (v111 <= v112)
            {
              id v113 = [v103 extendedSceneClassId];
              [v99 confidence];
              v115 = +[PHSceneClassification vcp_instanceWithExtendedSceneIdentifier:v113 confidence:v114];
              if (v115) {
                [v176 addObject:v115];
              }
              goto LABEL_118;
            }
          }
          else if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v115 = VCPLogInstance();
            if (os_log_type_enabled(v115, v97))
            {
              v116 = [(MADSpotlightImageAssetEntryBase *)self logPrefix];
              v117 = [v99 identifier];
              *(_DWORD *)v211 = 138412546;
              v212 = v116;
              __int16 v213 = 2112;
              v214 = v117;
              _os_log_impl((void *)&_mh_execute_header, v115, v97, "[%@][Process][Scene] Unsupported SceneNet observation label in PFSceneTaxonomyNode: %@", v211, 0x16u);
            }
LABEL_118:
          }
          continue;
        }
      }
      id v95 = [v94 countByEnumeratingWithState:&v188 objects:v220 count:16];
    }
    while (v95);
  }

  if (!+[VNRequest mad_includeEntityNet]) {
    goto LABEL_148;
  }
  long long v186 = 0u;
  long long v187 = 0u;
  long long v184 = 0u;
  long long v185 = 0u;
  v118 = [v168 results];
  id v119 = [v118 countByEnumeratingWithState:&v184 objects:v219 count:16];
  if (!v119) {
    goto LABEL_147;
  }
  uint64_t v120 = *(void *)v185;
  os_log_type_t v121 = VCPLogToOSLogType[7];
  do
  {
    for (k = 0; k != v119; k = (char *)k + 1)
    {
      if (*(void *)v185 != v120) {
        objc_enumerationMutation(v118);
      }
      v123 = *(void **)(*((void *)&v184 + 1) + 8 * (void)k);
      [v123 confidence];
      if (v124 >= 0.01)
      {
        v125 = +[PFSceneTaxonomy vcp_sharedTaxonomy];
        v126 = [v123 identifier];
        v127 = [v125 nodeForName:v126];

        if (v127)
        {
          [v127 highPrecisionThreshold];
          double v129 = v128;
          [v127 highRecallThreshold];
          double v131 = v130;
          [v127 searchThreshold];
          double v133 = v132;
          [v123 confidence];
          if (v129 >= v131) {
            double v135 = v131;
          }
          else {
            double v135 = v129;
          }
          if (v135 >= v133) {
            double v135 = v133;
          }
          double v136 = v134;
          if (v135 < 0.00999999978) {
            double v135 = 0.00999999978;
          }
          if (v135 <= v136)
          {
            id v137 = [v127 extendedSceneClassId];
            [v123 confidence];
            v139 = +[PHSceneClassification vcp_instanceWithExtendedSceneIdentifier:v137 confidence:v138];
            if (v139) {
              [v176 addObject:v139];
            }
            goto LABEL_143;
          }
        }
        else if ((int)MediaAnalysisLogLevel() >= 7)
        {
          v139 = VCPLogInstance();
          if (os_log_type_enabled(v139, v121))
          {
            v140 = [(MADSpotlightImageAssetEntryBase *)self logPrefix];
            v141 = [v123 identifier];
            *(_DWORD *)v211 = 138412546;
            v212 = v140;
            __int16 v213 = 2112;
            v214 = v141;
            _os_log_impl((void *)&_mh_execute_header, v139, v121, "[%@][Process][Scene] Unsupported EntityNet observation label in PFSceneTaxonomyNode: %@", v211, 0x16u);
          }
LABEL_143:
        }
        continue;
      }
    }
    id v119 = [v118 countByEnumeratingWithState:&v184 objects:v219 count:16];
  }
  while (v119);
LABEL_147:

LABEL_148:
  [(MADSpotlightImageAssetEntryBase *)self setSceneClassifications:v176];

LABEL_154:
  v146 = [v169 results];
  v147 = [v146 firstObject];

  if (v147)
  {
    [v147 aestheticScore];
    -[MADSpotlightImageAssetEntryBase setAestheticScore:](self, "setAestheticScore:");
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v148 = VCPLogInstance();
      os_log_type_t v149 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v148, v149))
      {
        v150 = [(MADSpotlightImageAssetEntryBase *)self logPrefix];
        v151 = [(MADSpotlightImageAssetEntryBase *)self uniqueIdentifier];
        *(_DWORD *)v211 = 138412546;
        v212 = v150;
        __int16 v213 = 2112;
        v214 = v151;
        _os_log_impl((void *)&_mh_execute_header, v148, v149, "[%@][Process][Aesthetics][%@] Processing produced no results", v211, 0x16u);
      }
    }
    [(MADSpotlightImageAssetEntryBase *)self setStatus:4294967278];
  }
  uint64_t v152 = *(void *)&buf[8];
  id v183 = *(id *)(*(void *)&buf[8] + 40);
  v153 = [v170 analyzePixelBuffer:cf error:&v183];
  objc_storeStrong((id *)(v152 + 40), v183);
  if (*(void *)(*(void *)&buf[8] + 40))
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v154 = VCPLogInstance();
      os_log_type_t v155 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v154, v155))
      {
        v156 = [(MADSpotlightImageAssetEntryBase *)self logPrefix];
        v157 = [(MADSpotlightImageAssetEntryBase *)self uniqueIdentifier];
        id v158 = (id)objc_opt_class();
        uint64_t v159 = *(void *)(*(void *)&buf[8] + 40);
        *(_DWORD *)v211 = 138413058;
        v212 = v156;
        __int16 v213 = 2112;
        v214 = v157;
        __int16 v215 = 2112;
        id v216 = v158;
        __int16 v217 = 2112;
        uint64_t v218 = v159;
        _os_log_impl((void *)&_mh_execute_header, v154, v155, "[%@][Process][%@] Failed to run %@ (%@)", v211, 0x2Au);
      }
    }
    [(MADSpotlightImageAssetEntryBase *)self setStatus:4294967278];
  }
  else
  {
    v160 = [v153 scoresForLabels];
    +[NSMutableSet set];
    v180[0] = _NSConcreteStackBlock;
    v180[1] = 3221225472;
    v180[2] = sub_1000FB7AC;
    v180[3] = &unk_10021CA68;
    id v161 = (id)objc_claimAutoreleasedReturnValue();
    id v181 = v161;
    v182 = self;
    [v160 enumerateKeysAndObjectsUsingBlock:v180];
    [(MADSpotlightImageAssetEntryBase *)self setNsfwClassifications:v161];
    [(MADSpotlightImageAssetEntryBase *)self setSceneVersion:100];
  }
LABEL_169:

  _Block_object_dispose(&v202, 8);
LABEL_170:

  _Block_object_dispose(buf, 8);
LABEL_171:
  sub_100004484(&cf);
}

- (BOOL)needsSceneProcessing
{
  return 0;
}

- (BOOL)needsOCRProcessing
{
  return 0;
}

- (BOOL)needsEmbeddingProcessing
{
  return 0;
}

- (NSString)filePath
{
  return 0;
}

- (NSString)uniqueIdentifier
{
  return 0;
}

- (BOOL)isMovieAsset
{
  return 0;
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (void)setIsMovieAsset:(BOOL)a3
{
  self->_isMovieAsset = a3;
}

- (int)ocrVersion
{
  return self->_ocrVersion;
}

- (void)setOcrVersion:(int)a3
{
  self->_ocrVersion = a3;
}

- (VNDocumentObservation)ocrObservation
{
  return self->_ocrObservation;
}

- (void)setOcrObservation:(id)a3
{
}

- (int)sceneVersion
{
  return self->_sceneVersion;
}

- (void)setSceneVersion:(int)a3
{
  self->_sceneVersion = a3;
}

- (NSSet)sceneClassifications
{
  return self->_sceneClassifications;
}

- (void)setSceneClassifications:(id)a3
{
}

- (float)aestheticScore
{
  return self->_aestheticScore;
}

- (void)setAestheticScore:(float)a3
{
  self->_aestheticScore = a3;
}

- (NSSet)nsfwClassifications
{
  return self->_nsfwClassifications;
}

- (void)setNsfwClassifications:(id)a3
{
}

- (unint64_t)embeddingVersion
{
  return self->_embeddingVersion;
}

- (void)setEmbeddingVersion:(unint64_t)a3
{
  self->_embeddingVersion = a3;
}

- (NSArray)embeddings
{
  return self->_embeddings;
}

- (void)setEmbeddings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddings, 0);
  objc_storeStrong((id *)&self->_nsfwClassifications, 0);
  objc_storeStrong((id *)&self->_sceneClassifications, 0);
  objc_storeStrong((id *)&self->_ocrObservation, 0);
}

@end