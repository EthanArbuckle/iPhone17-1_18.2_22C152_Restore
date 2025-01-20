@interface VCPFaceAnalyzer
+ (BOOL)_downsampleBeforeFaceProcessing;
+ (BOOL)_faceprintFastMode;
+ (double)_forwardCompatibleFaceSigmaThreshold;
+ (double)_forwardCompatibleTorsoSigmaThreshold;
+ (int)_smallFaceWarningThreshold;
- (VCPFaceAnalyzer)initWithContext:(id)a3;
- (id)_existingFacesFromAsset:(id)a3;
- (id)_processForwardCompatibleFaces:(id)a3 withExistingFaces:(id)a4 orientedWidth:(unint64_t)a5 orientedHeight:(unint64_t)a6 session:(id)a7;
- (int)_createBlurRequests:(id *)a3 andExposureRequests:(id *)a4 forFaceObservations:(id)a5;
- (int)_loadImageRequestHandler:(id *)a3 orientation:(unsigned int *)a4 bufferWidth:(int *)a5 bufferHeight:(int *)a6 withResource:(id)a7 resourceURL:(id)a8 andAsset:(id)a9;
- (int)_performAnalysis:(id *)a3 withRequestHandler:(id)a4 quickMode:(BOOL)a5 sourceWidth:(unint64_t)a6 sourceHeight:(unint64_t)a7;
- (int)_refineAnalysis:(id *)a3 requestHandler:(id)a4 forAsset:(id)a5 resource:(id)a6 isBestResource:(BOOL)a7 orientedWidth:(unint64_t)a8 orientedHeight:(unint64_t)a9;
- (int)analyzeAsset:(id)a3 withResource:(id)a4 resourceURL:(id)a5 isBestResource:(BOOL)a6 quickMode:(BOOL)a7 results:(id *)a8;
- (int)analyzeFaceQuality:(id *)a3 withAsset:(id)a4 andCancelBlock:(id)a5;
- (int)quickAnalyzeAsset:(id)a3 results:(id *)a4;
- (int)quickAnalyzeCVPixelBuffer:(__CVBuffer *)a3 results:(id *)a4;
- (int)updateMissingFaceprintForFaces:(id)a3 withAsset:(id)a4;
- (void)_checkAnalysisRequests:(id)a3 forTooSmallFaceObservations:(id)a4 withAnalysisResults:(id)a5;
@end

@implementation VCPFaceAnalyzer

- (VCPFaceAnalyzer)initWithContext:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VCPFaceAnalyzer;
  v5 = [(VCPFaceAnalyzer *)&v13 init];
  if (v5)
  {
    v5->_processingVersion = [v4 processingVersion];
    v6 = [VCPFaceMerger alloc];
    [v4 faceMergeFaceprintDistanceThreshold];
    uint64_t v8 = [(VCPFaceMerger *)v6 initWithThreshold:v7];
    faceMerger = v5->_faceMerger;
    v5->_faceMerger = (VCPFaceMerger *)v8;

    uint64_t v10 = +[VCPObjectPool objectPoolWithAllocator:&__block_literal_global_48];
    sessionPool = v5->_sessionPool;
    v5->_sessionPool = (VCPObjectPool *)v10;
  }
  return v5;
}

id __35__VCPFaceAnalyzer_initWithContext___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F45968]);
  return v0;
}

+ (int)_smallFaceWarningThreshold
{
  return 128;
}

+ (double)_forwardCompatibleFaceSigmaThreshold
{
  return -5.0;
}

+ (double)_forwardCompatibleTorsoSigmaThreshold
{
  return -5.0;
}

+ (BOOL)_faceprintFastMode
{
  return 1;
}

- (int)_createBlurRequests:(id *)a3 andExposureRequests:(id *)a4 forFaceObservations:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  float v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v6);
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(obj);
        }
        [*(id *)(*((void *)&v27 + 1) + 8 * i) boundingBox];
        v35.origin.double x = 0.0;
        v35.origin.double y = 0.0;
        v35.size.double width = 1.0;
        v35.size.double height = 1.0;
        CGRect v34 = CGRectIntersection(v33, v35);
        double x = v34.origin.x;
        double y = v34.origin.y;
        double width = v34.size.width;
        double height = v34.size.height;
        id v26 = 0;
        int v16 = +[VCPFaceUtils configureVNRequest:&v26 withClass:objc_opt_class() andProcessingVersion:self->_processingVersion];
        id v17 = v26;
        v18 = v17;
        if (v16) {
          goto LABEL_12;
        }
        [v17 setBlurDeterminationMethod:1];
        [v18 setMaximumIntermediateSideLength:128];
        objc_msgSend(v18, "setRegionOfInterest:", x, y, width, height);
        [v7 addObject:v18];
        id v25 = 0;
        int v16 = +[VCPFaceUtils configureVNRequest:&v25 withClass:objc_opt_class() andProcessingVersion:self->_processingVersion];
        id v19 = v25;
        v20 = v19;
        if (v16)
        {

LABEL_12:
          goto LABEL_13;
        }
        objc_msgSend(v19, "setRegionOfInterest:", x, y, width, height);
        [v8 addObject:v20];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  *a3 = v7;
  int v16 = 0;
  *a4 = v8;
LABEL_13:

  return v16;
}

- (void)_checkAnalysisRequests:(id)a3 forTooSmallFaceObservations:(id)a4 withAnalysisResults:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v17 = a5;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v20;
    uint64_t v11 = *MEMORY[0x1E4F45CF8];
    uint64_t v12 = *MEMORY[0x1E4F45D00];
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(obj);
        }
        v14 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v13), "warnings", v17);
        v15 = [v14 objectForKeyedSubscript:v11];
        if ([v15 BOOLValue]) {
          [v17 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ImageTooSmall"];
        }
        int v16 = [v14 objectForKeyedSubscript:v12];
        if (v16) {
          [v8 addObjectsFromArray:v16];
        }

        ++v13;
      }
      while (v9 != v13);
      uint64_t v9 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }
}

- (int)_performAnalysis:(id *)a3 withRequestHandler:(id)a4 quickMode:(BOOL)a5 sourceWidth:(unint64_t)a6 sourceHeight:(unint64_t)a7
{
  uint64_t v190 = *MEMORY[0x1E4F143B8];
  id v153 = a4;
  id v8 = [MEMORY[0x1E4F1CA48] array];
  id v181 = 0;
  int v9 = +[VCPFaceUtils configureVNRequest:&v181 withClass:objc_opt_class() andProcessingVersion:self->_processingVersion];
  id v155 = v181;
  if (!v9)
  {
    if (self->_processingVersion == 11)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        uint64_t v11 = VCPLogInstance();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_DEBUG, "[FaceAnalyzer] Set precicion recall threshold to 0.96", buf, 2u);
        }
      }
      LODWORD(v10) = 1064682127;
      [v155 setPrecisionRecallThreshold:v10];
    }
    [v8 addObject:v155];
    if (a5)
    {
      uint64_t v12 = 0;
      id v13 = 0;
      id v14 = 0;
    }
    else
    {
      id v180 = 0;
      int v9 = +[VCPFaceUtils configureVNRequest:&v180 withClass:objc_opt_class() andProcessingVersion:self->_processingVersion];
      id v152 = v180;
      if (v9)
      {
        v150 = 0;
        id v151 = 0;
        goto LABEL_172;
      }
      objc_msgSend(v8, "addObject:");
      id v179 = 0;
      int v9 = +[VCPFaceUtils configureVNRequest:&v179 withClass:objc_opt_class() andProcessingVersion:self->_processingVersion];
      id v151 = v179;
      if (v9)
      {
        v150 = 0;
        goto LABEL_172;
      }
      objc_msgSend(v8, "addObject:");
      id v178 = 0;
      int v9 = +[VCPFaceUtils configureVNRequest:&v178 withClass:objc_opt_class() andProcessingVersion:self->_processingVersion];
      id v30 = v178;
      if (v9)
      {
        v150 = v30;
        goto LABEL_172;
      }
      id v13 = v151;
      id v14 = v152;
      uint64_t v12 = v30;
      objc_msgSend(v8, "addObject:");
    }
    v150 = v12;
    id v151 = v13;
    id v152 = v14;
    v146 = v8;
    v15 = VCPSignPostLog();
    os_signpost_id_t v16 = os_signpost_id_generate(v15);

    id v17 = VCPSignPostLog();
    v18 = v17;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "VCPFaceAnalyzerImageRequestHandlerPerformDetectionRequests", "", buf, 2u);
    }

    id v177 = 0;
    char v19 = [v153 performRequests:v146 error:&v177];
    double v20 = COERCE_DOUBLE(v177);
    long long v21 = VCPSignPostLog();
    long long v22 = v21;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v22, OS_SIGNPOST_INTERVAL_END, v16, "VCPFaceAnalyzerImageRequestHandlerPerformDetectionRequests", "", buf, 2u);
    }

    if (v19)
    {
      v143 = [MEMORY[0x1E4F1CA60] dictionary];
      v23 = [v155 results];
      if ([v23 count])
      {
LABEL_23:

        goto LABEL_24;
      }
      uint64_t v24 = [v152 results];
      if ([v24 count])
      {
LABEL_22:

        goto LABEL_23;
      }
      id v25 = [v151 results];
      if ([v25 count])
      {

        goto LABEL_22;
      }
      v56 = [v12 results];
      BOOL v57 = [v56 count] == 0;

      if (!v57)
      {
LABEL_24:
        v144 = [MEMORY[0x1E4F1CA48] array];
        id v26 = [v155 results];
        BOOL v27 = [v26 count] == 0;

        if (v27)
        {
          id v145 = 0;
        }
        else
        {
          id v176 = 0;
          int v9 = +[VCPFaceUtils configureVNRequest:&v176 withClass:objc_opt_class() andProcessingVersion:self->_processingVersion];
          id v145 = v176;
          if (v9)
          {
            id v140 = 0;
            id v141 = 0;
            v137 = 0;
            id v138 = 0;
            id v139 = 0;
            id v142 = 0;
LABEL_169:

            long long v28 = v143;
            goto LABEL_170;
          }
          if ([(id)objc_opt_class() _faceprintFastMode]) {
            [v145 setDetectionLevel:2];
          }
          v31 = [v155 results];
          [v145 setInputFaceObservations:v31];

          [v144 addObject:v145];
        }
        if (a5)
        {
          id v140 = 0;
          id v141 = 0;
          v137 = 0;
          id v138 = 0;
          id v139 = 0;
          id v142 = 0;
          goto LABEL_45;
        }
        v40 = [v155 results];
        BOOL v41 = [v40 count] == 0;

        if (v41)
        {
          id v44 = 0;
          id v45 = 0;
          id v46 = 0;
          id v47 = 0;
        }
        else
        {
          id v175 = 0;
          int v9 = +[VCPFaceUtils configureVNRequest:&v175 withClass:objc_opt_class() andProcessingVersion:self->_processingVersion];
          id v142 = v175;
          if (v9)
          {
            id v141 = 0;
LABEL_75:
            id v140 = 0;
LABEL_76:
            id v138 = 0;
LABEL_77:
            v137 = 0;
            id v139 = 0;
            goto LABEL_169;
          }
          v55 = [v155 results];
          [v142 setInputFaceObservations:v55];

          [v144 addObject:v142];
          id v174 = 0;
          int v9 = +[VCPFaceUtils configureVNRequest:&v174 withClass:objc_opt_class() andProcessingVersion:self->_processingVersion];
          id v141 = v174;
          if (v9) {
            goto LABEL_75;
          }
          v90 = [v155 results];
          [v141 setInputFaceObservations:v90];

          [v144 addObject:v141];
          id v173 = 0;
          int v9 = +[VCPFaceUtils configureVNRequest:&v173 withClass:objc_opt_class() andProcessingVersion:self->_processingVersion];
          id v140 = v173;
          if (v9) {
            goto LABEL_76;
          }
          v91 = [v155 results];
          [v140 setInputFaceObservations:v91];

          [v144 addObject:v140];
          id v172 = 0;
          int v9 = +[VCPFaceUtils configureVNRequest:&v172 withClass:objc_opt_class() andProcessingVersion:self->_processingVersion];
          id v138 = v172;
          if (v9) {
            goto LABEL_77;
          }
          v92 = [v155 results];
          [v138 setInputFaceObservations:v92];

          id v46 = v138;
          id v45 = v140;
          id v44 = v141;
          id v47 = v142;
          [v144 addObject:v138];
        }
        v48 = [v152 results];
        id v141 = v44;
        id v142 = v47;
        id v138 = v46;
        id v140 = v45;
        BOOL v49 = [v48 count] == 0;

        if (v49)
        {
          id v58 = 0;
        }
        else
        {
          id v171 = 0;
          int v9 = +[VCPFaceUtils configureVNRequest:&v171 withClass:objc_opt_class() andProcessingVersion:self->_processingVersion];
          id v139 = v171;
          if (v9)
          {
            v137 = 0;
            goto LABEL_169;
          }
          v80 = [v152 results];
          [v139 setInputDetectedObjectObservations:v80];

          id v58 = v139;
          [v144 addObject:v139];
        }
        id v139 = v58;
        v81 = [MEMORY[0x1E4F1CA48] array];
        v82 = [v150 results];
        BOOL v83 = [v82 count] == 0;

        if (!v83)
        {
          v84 = [v150 results];
          [v81 addObjectsFromArray:v84];
        }
        v85 = [v151 results];
        BOOL v86 = [v85 count] == 0;

        if (!v86)
        {
          v87 = [v151 results];
          [v81 addObjectsFromArray:v87];
        }
        v42 = v81;
        if ([v81 count])
        {
          id v170 = 0;
          int v9 = +[VCPFaceUtils configureVNRequest:&v170 withClass:objc_opt_class() andProcessingVersion:self->_processingVersion];
          id v88 = v170;
          if (v9)
          {
            v137 = v88;
            double v136 = v20;
            goto LABEL_167;
          }
          id v89 = v88;
          [v88 setInputDetectedObjectObservations:v81];
          [v144 addObject:v89];
        }
        else
        {
          id v89 = 0;
        }
        v137 = v89;

LABEL_45:
        uint64_t v32 = VCPSignPostLog();
        os_signpost_id_t v33 = os_signpost_id_generate(v32);

        CGRect v34 = VCPSignPostLog();
        CGRect v35 = v34;
        if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v35, OS_SIGNPOST_INTERVAL_BEGIN, v33, "VCPFaceAnalyzerImageRequestHandlerPerformAdditionalRequests", "", buf, 2u);
        }

        double v169 = v20;
        char v36 = [v153 performRequests:v144 error:&v169];
        double v136 = COERCE_DOUBLE(*(id *)&v169);

        v37 = VCPSignPostLog();
        v38 = v37;
        if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v38, OS_SIGNPOST_INTERVAL_END, v33, "VCPFaceAnalyzerImageRequestHandlerPerformAdditionalRequests", "", buf, 2u);
        }

        if (v36)
        {
          v131 = [MEMORY[0x1E4F1CA48] array];
          [v131 addObjectsFromArray:v146];
          [v131 addObjectsFromArray:v144];
          v132 = [MEMORY[0x1E4F1CA80] set];
          -[VCPFaceAnalyzer _checkAnalysisRequests:forTooSmallFaceObservations:withAnalysisResults:](self, "_checkAnalysisRequests:forTooSmallFaceObservations:withAnalysisResults:", v131);
          if (a5)
          {
            v135 = 0;
            v39 = 0;
LABEL_158:
            v115 = VCPSignPostLog();
            os_signpost_id_t v116 = os_signpost_id_generate(v115);

            v117 = VCPSignPostLog();
            v118 = v117;
            if (v116 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v117))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v118, OS_SIGNPOST_INTERVAL_BEGIN, v116, "VCPFaceAnalyzerVCPFaceCreation", "", buf, 2u);
            }

            v119 = [v155 results];
            v120 = [v152 results];
            v121 = [v151 results];
            v122 = [v150 results];
            int processingVersion = self->_processingVersion;
            id v156 = 0;
            LODWORD(v128) = processingVersion;
            v124 = +[VCPPhotosFace facesFromFaceObservations:v119 humanObservations:v120 animalHeadObservations:v121 animalBodyObservations:v122 sourceWidth:a6 sourceHeight:a7 visionRequests:v131 blurScorePerFace:v135 exposureScorePerFace:v39 tooSmallFaceObservations:v132 processingVersion:v128 animalResults:&v156];
            v54 = v156;
            [v143 setObject:v124 forKeyedSubscript:@"FaceResults"];

            [v143 setObject:v54 forKeyedSubscript:@"VNAnimalObservationResults"];
            v125 = VCPSignPostLog();
            v126 = v125;
            if (v116 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v125))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v126, OS_SIGNPOST_INTERVAL_END, v116, "VCPFaceAnalyzerVCPFaceCreation", "", buf, 2u);
            }

            int v9 = 0;
            *a3 = v143;
            id v133 = v39;
            id v134 = v135;
            goto LABEL_165;
          }
          v50 = VCPSignPostLog();
          os_signpost_id_t spid = os_signpost_id_generate(v50);

          v51 = VCPSignPostLog();
          v52 = v51;
          if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v52, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPFaceAnalyzerBlurExposureAnalysis", "", buf, 2u);
          }

          id v167 = 0;
          id v168 = 0;
          v53 = [v155 results];
          int v9 = [(VCPFaceAnalyzer *)self _createBlurRequests:&v168 andExposureRequests:&v167 forFaceObservations:v53];
          id v134 = v168;
          id v133 = v167;

          if (v9)
          {
            if ((int)MediaAnalysisLogLevel() < 3)
            {
LABEL_166:

              v42 = v131;
              goto LABEL_167;
            }
            v54 = VCPLogInstance();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BBEDA000, v54, OS_LOG_TYPE_ERROR, "[FaceAnalyzer] Failed to create blur/exposure request", buf, 2u);
            }
LABEL_165:

            goto LABEL_166;
          }
          double v166 = v136;
          int v59 = [v153 performRequests:v134 error:&v166];
          double v60 = COERCE_DOUBLE(*(id *)&v166);

          if (v59)
          {
            [(VCPFaceAnalyzer *)self _checkAnalysisRequests:v134 forTooSmallFaceObservations:v132 withAnalysisResults:v143];
            v61 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v134, "count"));
            long long v164 = 0u;
            long long v165 = 0u;
            long long v162 = 0u;
            long long v163 = 0u;
            v62 = v134;
            uint64_t v63 = [v62 countByEnumeratingWithState:&v162 objects:v189 count:16];
            if (v63)
            {
              uint64_t v64 = *(void *)v163;
              do
              {
                for (uint64_t i = 0; i != v63; ++i)
                {
                  if (*(void *)v163 != v64) {
                    objc_enumerationMutation(v62);
                  }
                  v66 = [*(id *)(*((void *)&v162 + 1) + 8 * i) results];
                  v67 = [v66 firstObject];

                  if (v67)
                  {
                    v68 = [v67 blurScore];
                    [v68 floatValue];
                    if (v69 < 1.0) {
                      float v70 = v69;
                    }
                    else {
                      float v70 = 1.0;
                    }
                    if (v69 <= 0.0) {
                      float v71 = 0.0;
                    }
                    else {
                      float v71 = v70;
                    }

                    v72 = [v67 blurScore];
                    [v72 floatValue];
                    BOOL v74 = v71 != v73;

                    if (v74 && (int)MediaAnalysisLogLevel() >= 4)
                    {
                      v76 = VCPLogInstance();
                      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
                      {
                        v77 = [v67 blurScore];
                        [v77 floatValue];
                        *(_DWORD *)buf = 134218496;
                        double v184 = v78;
                        __int16 v185 = 2048;
                        uint64_t v186 = 0;
                        __int16 v187 = 2048;
                        uint64_t v188 = 0x3FF0000000000000;
                        _os_log_impl(&dword_1BBEDA000, v76, OS_LOG_TYPE_DEFAULT, "[FaceAnalyzer] Blur score %f out of bound [%f, %f]", buf, 0x20u);
                      }
                    }
                    *(float *)&double v75 = v71;
                    v79 = [NSNumber numberWithFloat:v75];
                    [v61 addObject:v79];
                  }
                  else
                  {
                    [v61 addObject:&unk_1F15EAC98];
                  }
                }
                uint64_t v63 = [v62 countByEnumeratingWithState:&v162 objects:v189 count:16];
              }
              while (v63);
            }
            v135 = v61;
          }
          else
          {
            if ((int)MediaAnalysisLogLevel() < 3)
            {
              v135 = 0;
LABEL_125:
              double v161 = v60;
              int v93 = [v153 performRequests:v133 error:&v161];
              double v129 = COERCE_DOUBLE(*(id *)&v161);

              if (v93)
              {
                [(VCPFaceAnalyzer *)self _checkAnalysisRequests:v133 forTooSmallFaceObservations:v132 withAnalysisResults:v143];
                uint64_t v94 = [v133 count];
                v39 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v94];
                long long v159 = 0u;
                long long v160 = 0u;
                long long v157 = 0u;
                long long v158 = 0u;
                v95 = v133;
                uint64_t v96 = [v95 countByEnumeratingWithState:&v157 objects:v182 count:16];
                if (v96)
                {
                  uint64_t v97 = *(void *)v158;
                  do
                  {
                    for (uint64_t j = 0; j != v96; ++j)
                    {
                      if (*(void *)v158 != v97) {
                        objc_enumerationMutation(v95);
                      }
                      v99 = [*(id *)(*((void *)&v157 + 1) + 8 * j) results];
                      v100 = [v99 firstObject];

                      if (v100)
                      {
                        v101 = [v100 exposureScore];
                        [v101 floatValue];
                        if (v102 < 1.0) {
                          float v103 = v102;
                        }
                        else {
                          float v103 = 1.0;
                        }
                        if (v102 <= 0.0) {
                          float v104 = 0.0;
                        }
                        else {
                          float v104 = v103;
                        }

                        v105 = [v100 exposureScore];
                        [v105 floatValue];
                        BOOL v107 = v104 != v106;

                        if (v107 && (int)MediaAnalysisLogLevel() >= 4)
                        {
                          v109 = VCPLogInstance();
                          if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
                          {
                            v110 = [v100 exposureScore];
                            [v110 floatValue];
                            *(_DWORD *)buf = 134218496;
                            double v184 = v111;
                            __int16 v185 = 2048;
                            uint64_t v186 = 0;
                            __int16 v187 = 2048;
                            uint64_t v188 = 0x3FF0000000000000;
                            _os_log_impl(&dword_1BBEDA000, v109, OS_LOG_TYPE_DEFAULT, "[FaceAnalyzer] Exposure score %f out of bound [%f, %f]", buf, 0x20u);
                          }
                        }
                        *(float *)&double v108 = v104;
                        v112 = [NSNumber numberWithFloat:v108];
                        [v39 addObject:v112];
                      }
                      else
                      {
                        [v39 addObject:&unk_1F15EACA8];
                      }
                    }
                    uint64_t v96 = [v95 countByEnumeratingWithState:&v157 objects:v182 count:16];
                  }
                  while (v96);
                }
              }
              else
              {
                if ((int)MediaAnalysisLogLevel() < 3)
                {
                  v39 = 0;
LABEL_154:
                  v113 = VCPSignPostLog();
                  v114 = v113;
                  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v113))
                  {
                    *(_WORD *)buf = 0;
                    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v114, OS_SIGNPOST_INTERVAL_END, spid, "VCPFaceAnalyzerBlurExposureAnalysis", "", buf, 2u);
                  }

                  double v136 = v129;
                  goto LABEL_158;
                }
                v95 = VCPLogInstance();
                if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  double v184 = v129;
                  _os_log_impl(&dword_1BBEDA000, v95, OS_LOG_TYPE_ERROR, "[FaceAnalyzer] Failed to perform exposure requests - %@", buf, 0xCu);
                }
                v39 = 0;
              }

              goto LABEL_154;
            }
            v62 = VCPLogInstance();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              double v184 = v60;
              _os_log_impl(&dword_1BBEDA000, v62, OS_LOG_TYPE_ERROR, "[FaceAnalyzer] Failed to perform blur requests - %@", buf, 0xCu);
            }
            v135 = 0;
          }

          goto LABEL_125;
        }
        if ((int)MediaAnalysisLogLevel() < 3)
        {
          int v9 = -18;
LABEL_168:
          double v20 = v136;
          goto LABEL_169;
        }
        v42 = VCPLogInstance();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          double v43 = [*(id *)&v136 description];
          *(_DWORD *)buf = 138412290;
          double v184 = v43;
          _os_log_impl(&dword_1BBEDA000, v42, OS_LOG_TYPE_ERROR, "[FaceAnalyzer] Failed to perform additional requests - %@", buf, 0xCu);
        }
        int v9 = -18;
LABEL_167:

        goto LABEL_168;
      }
      int v9 = 0;
      long long v28 = v143;
      *a3 = v28;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v9 = -18;
LABEL_171:

        id v8 = v146;
        goto LABEL_172;
      }
      long long v28 = VCPLogInstance();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        double v29 = [*(id *)&v20 description];
        *(_DWORD *)buf = 138412290;
        double v184 = v29;
        _os_log_impl(&dword_1BBEDA000, v28, OS_LOG_TYPE_ERROR, "[FaceAnalyzer] Failed to perform detector requests - %@", buf, 0xCu);
      }
      int v9 = -18;
    }
LABEL_170:

    goto LABEL_171;
  }
  v150 = 0;
  id v151 = 0;
  id v152 = 0;
LABEL_172:

  return v9;
}

- (id)_existingFacesFromAsset:(id)a3
{
  v62[3] = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  v3 = [v41 photoLibrary];
  id v4 = [v3 librarySpecificFetchOptions];

  v39 = v4;
  [v4 setIncludeNonvisibleFaces:1];
  [v4 setIncludeTorsoOnlyDetectionData:1];
  [v4 setIncludedDetectionTypes:&unk_1F15EE3D0];
  uint64_t v5 = *MEMORY[0x1E4F39620];
  v62[0] = *MEMORY[0x1E4F39630];
  v62[1] = v5;
  v62[2] = *MEMORY[0x1E4F39610];
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:3];
  [v4 setFetchPropertySets:v6];

  v38 = [MEMORY[0x1E4F39048] fetchFacesInAsset:v41 options:v4];
  id v7 = [MEMORY[0x1E4F1CA48] array];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v38;
  uint64_t v8 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v52 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        uint64_t v12 = +[VCPPhotosFace faceFromPHFace:v11 copyOption:2];
        if (v7)
        {
          [v7 addObject:v12];
        }
        else if ((int)MediaAnalysisLogLevel() >= 4)
        {
          id v13 = VCPLogInstance();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            id v14 = [v41 localIdentifier];
            v15 = [v11 localIdentifier];
            *(_DWORD *)buf = 138412546;
            id v58 = v14;
            __int16 v59 = 2112;
            double v60 = v15;
            _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_DEFAULT, "[VCPFaceAnalyzer][%@] Failed to create VCPPhotosFace from PHFace %@", buf, 0x16u);
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
    }
    while (v8);
  }

  os_signpost_id_t v16 = [v7 valueForKey:@"personLocalIdentifier"];
  v37 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_306_0];
  v40 = objc_msgSend(v16, "filteredArrayUsingPredicate:");

  id v17 = [MEMORY[0x1E4F1CA48] array];
  if ([v40 count])
  {
    v18 = [v41 photoLibrary];
    char v19 = [v18 librarySpecificFetchOptions];

    double v20 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(verifiedType = %d) OR (verifiedType = %d)", 1, 2);
    [v19 setPredicate:v20];

    [v19 setMinimumVerifiedFaceCount:1];
    [v39 setIncludedDetectionTypes:&unk_1F15EE3E8];
    [MEMORY[0x1E4F391F8] fetchPersonsWithLocalIdentifiers:v40 options:v19];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = [v21 countByEnumeratingWithState:&v47 objects:v56 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v48;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v48 != v23) {
            objc_enumerationMutation(v21);
          }
          id v25 = [*(id *)(*((void *)&v47 + 1) + 8 * j) localIdentifier];
          [v17 addObject:v25];
        }
        uint64_t v22 = [v21 countByEnumeratingWithState:&v47 objects:v56 count:16];
      }
      while (v22);
    }
  }
  id v26 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v27 = v7;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v43 objects:v55 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v44;
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v44 != v29) {
          objc_enumerationMutation(v27);
        }
        v31 = *(void **)(*((void *)&v43 + 1) + 8 * k);
        uint64_t v32 = [v31 personLocalIdentifier];
        if (v32 && (![v17 containsObject:v32] || objc_msgSend(v31, "nameSource") == 6)) {
          [v31 setPersonLocalIdentifier:0];
        }
        os_signpost_id_t v33 = [v31 localIdentifier];
        BOOL v34 = v33 == 0;

        if (!v34)
        {
          CGRect v35 = [v31 localIdentifier];
          [v26 setObject:v31 forKeyedSubscript:v35];
        }
      }
      uint64_t v28 = [v27 countByEnumeratingWithState:&v43 objects:v55 count:16];
    }
    while (v28);
  }

  return v26;
}

uint64_t __43__VCPFaceAnalyzer__existingFacesFromAsset___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [MEMORY[0x1E4F1CA98] null];
  uint64_t v4 = [v2 isEqual:v3] ^ 1;

  return v4;
}

- (id)_processForwardCompatibleFaces:(id)a3 withExistingFaces:(id)a4 orientedWidth:(unint64_t)a5 orientedHeight:(unint64_t)a6 session:(id)a7
{
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  id v87 = a3;
  id v96 = a4;
  id v89 = a7;
  if (_os_feature_enabled_impl())
  {
    [v87 objectForKeyedSubscript:@"FacesToPersist"];
    long long v111 = 0u;
    long long v112 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [obj countByEnumeratingWithState:&v109 objects:v123 count:16];
    if (!v9) {
      goto LABEL_93;
    }
    uint64_t v98 = *(void *)v110;
    while (1)
    {
      uint64_t v10 = 0;
      uint64_t v99 = v9;
      do
      {
        if (*(void *)v110 != v98) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v109 + 1) + 8 * v10);
        uint64_t v12 = (void *)MEMORY[0x1C186D320]();
        id v13 = NSString;
        id v14 = [v11 localIdentifier];
        v15 = [v13 stringWithFormat:@"[FaceAnalyzer][FC][%@]", v14];

        os_signpost_id_t v16 = [v11 localIdentifier];
        LODWORD(v14) = v16 == 0;

        if (v14)
        {
          if ((int)MediaAnalysisLogLevel() < 7) {
            goto LABEL_82;
          }
          log = VCPLogInstance();
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
          {
            double v47 = [v11 gist];
            *(_DWORD *)buf = 138412546;
            v114 = v15;
            __int16 v115 = 2112;
            double v116 = v47;
            _os_log_impl(&dword_1BBEDA000, log, OS_LOG_TYPE_DEBUG, "%@ Skipping new face %@", buf, 0x16u);
          }
          goto LABEL_81;
        }
        if ([v11 detectionType] != 1)
        {
          if ((int)MediaAnalysisLogLevel() < 7) {
            goto LABEL_82;
          }
          log = VCPLogInstance();
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
          {
            double v48 = [v11 gist];
            *(_DWORD *)buf = 138412546;
            v114 = v15;
            __int16 v115 = 2112;
            double v116 = v48;
            _os_log_impl(&dword_1BBEDA000, log, OS_LOG_TYPE_DEBUG, "%@ Skipping non-human face %@", buf, 0x16u);
          }
          goto LABEL_81;
        }
        id v17 = [v11 localIdentifier];
        log = [v96 objectForKeyedSubscript:v17];

        v18 = [log imageprintWrapper];
        if (![v18 type])
        {
          char v19 = [log imageprintWrapper];
          if ([v19 version] == 11)
          {
            double v20 = [log imageprintWrapper];
            id v21 = [v20 data];
            BOOL v22 = v21 == 0;

            if (!v22)
            {
              if ((int)MediaAnalysisLogLevel() >= 7)
              {
                uint64_t v23 = VCPLogInstance();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
                {
                  double v24 = [v11 gist];
                  *(_DWORD *)buf = 138412546;
                  v114 = v15;
                  __int16 v115 = 2112;
                  double v116 = v24;
                  _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_DEBUG, "%@ Processing forward-compabitle face %@", buf, 0x16u);
                }
              }
              id v25 = [log imageprintWrapper];
              id v26 = [v25 data];
              id v108 = 0;
              int v93 = +[VCPVNImageprintWrapper generateVNImageprintWithType:0 archiveData:v26 andError:&v108];
              id v27 = v108;

              uint64_t v28 = [v11 imageprintWrapper];
              uint64_t v29 = [v28 data];
              id v107 = v27;
              os_log_t v94 = +[VCPVNImageprintWrapper generateVNImageprintWithType:0 archiveData:v29 andError:&v107];
              id v30 = v107;

              v31 = [v94 faceprint];
              uint64_t v32 = v30;
              os_signpost_id_t v33 = [v93 faceprint];
              if (v33)
              {
                BOOL v34 = [v94 faceprint];
                BOOL v35 = v34 == 0;

                if (!v35)
                {
                  char v36 = VCPSignPostLog();
                  os_signpost_id_t spid = os_signpost_id_generate(v36);

                  v37 = VCPSignPostLog();
                  v38 = v37;
                  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
                  {
                    *(_WORD *)buf = 0;
                    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v38, OS_SIGNPOST_INTERVAL_BEGIN, spid, "MADUpgradeFaceprint", "", buf, 2u);
                  }

                  float v106 = 0.0;
                  v39 = [v93 faceprint];
                  v40 = [v94 faceprint];
                  float v104 = v30;
                  id v105 = v31;
                  char v41 = VNUpgradeFaceprint();
                  id v92 = v105;

                  *(double *)&uint64_t v32 = COERCE_DOUBLE(v104);
                  if (v41)
                  {
                    if ((int)MediaAnalysisLogLevel() >= 7)
                    {
                      v42 = VCPLogInstance();
                      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
                      {
                        float v43 = v106;
                        [v92 confidence];
                        *(_DWORD *)buf = 138412802;
                        v114 = v15;
                        __int16 v115 = 2048;
                        double v116 = v43;
                        __int16 v117 = 2048;
                        double v118 = v44;
                        _os_log_impl(&dword_1BBEDA000, v42, OS_LOG_TYPE_DEBUG, "%@ FC faceprint sigma %.3f and confidence: %.3f", buf, 0x20u);
                      }
                    }
                    long long v45 = VCPSignPostLog();
                    long long v46 = v45;
                    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
                    {
                      *(_WORD *)buf = 0;
                      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v46, OS_SIGNPOST_INTERVAL_END, spid, "MADUpgradeFaceprint", "", buf, 2u);
                    }

LABEL_45:
                    BOOL v57 = [v94 torsoprint];
                    id v58 = [v93 torsoprint];
                    if (!v58
                      || ([v94 torsoprint],
                          __int16 v59 = objc_claimAutoreleasedReturnValue(),
                          BOOL v60 = v59 == 0,
                          v59,
                          v58,
                          v60))
                    {
                      v67 = v32;
                      goto LABEL_60;
                    }
                    v61 = VCPSignPostLog();
                    os_signpost_id_t v88 = os_signpost_id_generate(v61);

                    v62 = VCPSignPostLog();
                    uint64_t v63 = v62;
                    if (v88 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v62))
                    {
                      *(_WORD *)buf = 0;
                      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v63, OS_SIGNPOST_INTERVAL_BEGIN, v88, "MADUpgradeTorsoprint", "", buf, 2u);
                    }

                    float v106 = 0.0;
                    uint64_t v64 = [v93 torsoprint];
                    v65 = [v94 torsoprint];
                    float v102 = v32;
                    id v103 = v57;
                    char v66 = VNUpgradeTorsoprint();
                    id spida = v103;

                    *(double *)&v67 = COERCE_DOUBLE(v102);
                    if (v66)
                    {
                      if ((int)MediaAnalysisLogLevel() >= 7)
                      {
                        v68 = VCPLogInstance();
                        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
                        {
                          float v69 = v106;
                          [spida confidence];
                          *(_DWORD *)buf = 138412802;
                          v114 = v15;
                          __int16 v115 = 2048;
                          double v116 = v69;
                          __int16 v117 = 2048;
                          double v118 = v70;
                          _os_log_impl(&dword_1BBEDA000, v68, OS_LOG_TYPE_DEBUG, "%@ FC torsoprint sigma %.3f and confidence: %.3f", buf, 0x20u);
                        }
                      }
                      float v71 = VCPSignPostLog();
                      v72 = v71;
                      if (v88 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v71))
                      {
                        *(_WORD *)buf = 0;
                        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v72, OS_SIGNPOST_INTERVAL_END, v88, "MADUpgradeTorsoprint", "", buf, 2u);
                      }

                      BOOL v57 = spida;
LABEL_60:
                      id spida = v57;
                      float v73 = (void *)[objc_alloc(MEMORY[0x1E4F45800]) initWithFaceprint:v92 torsoprint:v57];
                      v101 = v67;
                      BOOL v74 = [v73 serializeStateAndReturnError:&v101];
                      double v75 = COERCE_DOUBLE(v101);

                      if (v74)
                      {
                        if ((int)MediaAnalysisLogLevel() >= 7)
                        {
                          v76 = VCPLogInstance();
                          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
                          {
                            double v77 = [v11 gist];
                            *(_DWORD *)buf = 138412546;
                            v114 = v15;
                            __int16 v115 = 2112;
                            double v116 = v77;
                            _os_log_impl(&dword_1BBEDA000, v76, OS_LOG_TYPE_DEBUG, "%@ Wrapping forward-compatible faceprint for face %@", buf, 0x16u);
                          }
                        }
                        if (_os_feature_enabled_impl()) {
                          uint64_t v78 = 14;
                        }
                        else {
                          uint64_t v78 = 11;
                        }
                        v79 = +[VCPVNImageprintWrapper wrapperWithImageprintType:0 version:v78 andData:v74];
                        [v11 setImageprintWrapper:v79];

                        [v11 setVuObservationID:0];
                        if (_os_feature_enabled_impl()) {
                          uint64_t v80 = 14;
                        }
                        else {
                          uint64_t v80 = 11;
                        }
                        [v11 setAlgorithmVersion:v80];
                      }
                      else if ((int)MediaAnalysisLogLevel() >= 3)
                      {
                        v81 = VCPLogInstance();
                        if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412546;
                          v114 = v15;
                          __int16 v115 = 2112;
                          double v116 = v75;
                          _os_log_impl(&dword_1BBEDA000, v81, OS_LOG_TYPE_ERROR, "%@ Unable to serialize forward-compatible faceTorsoprint - %@; ignore",
                            buf,
                            0x16u);
                        }
                      }
                      *(double *)&v67 = v75;
LABEL_77:
                      v82 = spida;
                    }
                    else
                    {
                      v82 = spida;
                      if ((int)MediaAnalysisLogLevel() >= 3)
                      {
                        v84 = VCPLogInstance();
                        if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412546;
                          v114 = v15;
                          __int16 v115 = 2112;
                          double v116 = *(double *)&v67;
                          _os_log_impl(&dword_1BBEDA000, v84, OS_LOG_TYPE_ERROR, "%@ Failed to upgrade torsoprint - %@; skipping",
                            buf,
                            0x16u);
                        }

                        goto LABEL_77;
                      }
                    }

                    uint64_t v32 = v67;
                  }
                  else if ((int)MediaAnalysisLogLevel() >= 3)
                  {
                    BOOL v83 = VCPLogInstance();
                    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412546;
                      v114 = v15;
                      __int16 v115 = 2112;
                      double v116 = *(double *)&v32;
                      _os_log_impl(&dword_1BBEDA000, v83, OS_LOG_TYPE_ERROR, "%@ Failed to upgrade faceprint - %@; skipping",
                        buf,
                        0x16u);
                    }
                  }
LABEL_80:

                  goto LABEL_81;
                }
                uint64_t v32 = v30;
              }
              id v92 = v31;
              goto LABEL_45;
            }
            goto LABEL_38;
          }
        }
LABEL_38:
        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          VCPLogInstance();
          *(double *)&uint64_t v32 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            v95 = v32;
            double v49 = [v11 gist];
            long long v50 = [log imageprintWrapper];
            *(double *)&uint64_t v51 = COERCE_DOUBLE([v50 type]);
            long long v52 = [log imageprintWrapper];
            int v53 = [v52 version];
            long long v54 = [log imageprintWrapper];
            v55 = [v54 data];
            *(_DWORD *)buf = 138413314;
            v56 = &stru_1F15A0D70;
            if (!v55) {
              v56 = @"missing faceprint";
            }
            v114 = v15;
            __int16 v115 = 2112;
            double v116 = v49;
            __int16 v117 = 2048;
            double v118 = *(double *)&v51;
            __int16 v119 = 1024;
            int v120 = v53;
            __int16 v121 = 2112;
            v122 = v56;
            _os_log_impl(&dword_1BBEDA000, v95, OS_LOG_TYPE_DEFAULT, "%@ Skipping data incomplete face %@ %lu %d %@", buf, 0x30u);

            uint64_t v32 = v95;
          }
          goto LABEL_80;
        }
LABEL_81:

LABEL_82:
        ++v10;
      }
      while (v99 != v10);
      uint64_t v9 = [obj countByEnumeratingWithState:&v109 objects:v123 count:16];
      if (!v9)
      {
LABEL_93:

        goto LABEL_97;
      }
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v85 = VCPLogInstance();
    id obj = v85;
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v85, OS_LOG_TYPE_DEBUG, "[FaceAnalyzer][FC] Feature is disabled; skip", buf, 2u);
    }
LABEL_97:
  }
  return v87;
}

- (int)_refineAnalysis:(id *)a3 requestHandler:(id)a4 forAsset:(id)a5 resource:(id)a6 isBestResource:(BOOL)a7 orientedWidth:(unint64_t)a8 orientedHeight:(unint64_t)a9
{
  BOOL v77 = a7;
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v80 = a4;
  id v83 = a5;
  id v78 = a6;
  uint64_t v12 = VCPSignPostLog();
  os_signpost_id_t v13 = os_signpost_id_generate(v12);

  id v14 = VCPSignPostLog();
  v15 = v14;
  os_signpost_id_t spid = v13;
  unint64_t v76 = v13 - 1;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "VCPFaceAnalyzerVerifyAndMergeFaces", "", buf, 2u);
  }

  id v85 = (id)[*a3 mutableCopy];
  [v85 removeObjectForKey:@"FaceResults"];
  v81 = [*a3 objectForKeyedSubscript:@"FaceResults"];
  v79 = [(VCPFaceAnalyzer *)self _existingFacesFromAsset:v83];
  if ([v79 count])
  {
    BOOL v74 = [(VCPFaceAnalyzer *)self _existingFacesFromAsset:v83];
    faceMerger = self->_faceMerger;
    id v17 = [v79 allValues];
    v18 = -[VCPFaceMerger mergeExistingFaces:andDetectedFaces:withRequestHandler:orientedWidth:orientedHeight:assetWidth:assetHeight:](faceMerger, "mergeExistingFaces:andDetectedFaces:withRequestHandler:orientedWidth:orientedHeight:assetWidth:assetHeight:", v17, v81, v80, a8, a9, [v83 pixelWidth], objc_msgSend(v83, "pixelHeight"));

    if ((_os_feature_enabled_impl() & 1) != 0 || [v78 type] != 102 || v77)
    {
LABEL_69:
      if (v18) {
        [v85 setObject:v18 forKeyedSubscript:@"FaceResults"];
      }

      goto LABEL_72;
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      char v19 = VCPLogInstance();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        unint64_t v94 = a8;
        __int16 v95 = 2048;
        unint64_t v96 = a9;
        _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_DEBUG, "[FaceAnalyzer][FC] Start processing resource %lu x %lu", buf, 0x16u);
      }
    }
    double v20 = [v80 session];
    v72 = [(VCPFaceAnalyzer *)self _processForwardCompatibleFaces:v18 withExistingFaces:v74 orientedWidth:a8 orientedHeight:a9 session:v20];

    id v21 = objc_msgSend(v85, "objectForKeyedSubscript:");
    int v71 = [v21 BOOLValue];

    [v85 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"ImageTooSmall"];
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      BOOL v22 = VCPLogInstance();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v23 = [v83 localIdentifier];
        double v24 = (void *)v23;
        id v25 = @"NO";
        if (v71) {
          id v25 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        unint64_t v94 = v23;
        __int16 v95 = 2112;
        unint64_t v96 = (unint64_t)v25;
        _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_DEBUG, "[FaceAnalyzer][FC][SmallFace][asset-%@] Vision image-too-small decision: %@", buf, 0x16u);
      }
    }
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id obj = [v72 objectForKeyedSubscript:@"FacesToPersist"];
    uint64_t v26 = [obj countByEnumeratingWithState:&v87 objects:v109 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v88;
      if (a8 >= a9) {
        unint64_t v28 = a9;
      }
      else {
        unint64_t v28 = a8;
      }
      double v29 = (double)v28;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v88 != v27) {
            objc_enumerationMutation(obj);
          }
          v31 = *(void **)(*((void *)&v87 + 1) + 8 * i);
          uint64_t v32 = NSString;
          os_signpost_id_t v33 = [v31 localIdentifier];
          int v34 = [v31 detectionType];
          BOOL v35 = @"Pet";
          if (v34 == 1) {
            BOOL v35 = @"Human";
          }
          char v36 = [v32 stringWithFormat:@"[FaceAnalyzer][FC][SmallFace][%@][%@]", v33, v35];

          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v37 = VCPLogInstance();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            {
              v38 = [v31 imageprintWrapper];
              int v39 = [v38 version];
              *(_DWORD *)buf = 138412546;
              unint64_t v94 = (unint64_t)v36;
              __int16 v95 = 1024;
              LODWORD(v96) = v39;
              _os_log_impl(&dword_1BBEDA000, v37, OS_LOG_TYPE_DEBUG, "%@ Face faceprint version %d", buf, 0x12u);
            }
          }
          [v31 size];
          double v41 = v40;
          [v31 bodyWidth];
          double v43 = v42;
          [v31 bodyHeight];
          if (v43 >= v44) {
            double v43 = v44;
          }
          int v45 = [(id)objc_opt_class() _smallFaceWarningThreshold];
          double v46 = v41 * v29;
          double v47 = v43 * v29;
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            double v48 = VCPLogInstance();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
            {
              [v31 size];
              unint64_t v50 = v49;
              [v31 bodyWidth];
              uint64_t v52 = v51;
              [v31 bodyHeight];
              *(_DWORD *)buf = 138414082;
              unint64_t v94 = (unint64_t)v36;
              __int16 v95 = 2048;
              unint64_t v96 = v50;
              __int16 v97 = 1024;
              int v98 = (int)v46;
              __int16 v99 = 1024;
              int v100 = v45;
              __int16 v101 = 2048;
              uint64_t v102 = v52;
              __int16 v103 = 2048;
              uint64_t v104 = v53;
              __int16 v105 = 1024;
              int v106 = (int)v47;
              __int16 v107 = 1024;
              int v108 = v45;
              _os_log_impl(&dword_1BBEDA000, v48, OS_LOG_TYPE_DEBUG, "%@ face-%.3f|%dpx(%dpx), torso-%.3fx%.3f|%dpx(%dpx)", buf, 0x42u);
            }
          }
          double v54 = (double)v45;
          BOOL v55 = v46 != 0.0 && v46 < v54;
          if (v55 || (v47 != 0.0 ? (BOOL v56 = v47 < v54) : (BOOL v56 = 0), v56))
          {
            [v85 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ImageTooSmall"];
            if (_os_feature_enabled_impl()) {
              uint64_t v57 = 14;
            }
            else {
              uint64_t v57 = 11;
            }
            [v31 setAlgorithmVersion:v57];
          }
        }
        uint64_t v26 = [obj countByEnumeratingWithState:&v87 objects:v109 count:16];
      }
      while (v26);
    }

    id v58 = [v85 objectForKeyedSubscript:@"ImageTooSmall"];
    int v59 = [v58 BOOLValue];

    if (v59)
    {
      if ((int)MediaAnalysisLogLevel() < 7) {
        goto LABEL_63;
      }
      BOOL v60 = VCPLogInstance();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
      {
        v61 = [v83 localIdentifier];
        *(_DWORD *)buf = 138412290;
        unint64_t v94 = (unint64_t)v61;
        _os_log_impl(&dword_1BBEDA000, v60, OS_LOG_TYPE_DEBUG, "[FaceAnalyzer][FC][SmallFace][asset-%@] Resource size is too small", buf, 0xCu);
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 7) {
        goto LABEL_63;
      }
      BOOL v60 = VCPLogInstance();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
      {
        v62 = [v83 localIdentifier];
        *(_DWORD *)buf = 138412290;
        unint64_t v94 = (unint64_t)v62;
        _os_log_impl(&dword_1BBEDA000, v60, OS_LOG_TYPE_DEBUG, "[FaceAnalyzer][FC][SmallFace][asset-%@] Resource size is good", buf, 0xCu);
      }
    }

LABEL_63:
    uint64_t v63 = [v85 objectForKeyedSubscript:@"ImageTooSmall"];
    int v64 = [v63 BOOLValue];

    if (v71 != v64 && (int)MediaAnalysisLogLevel() >= 7)
    {
      v65 = VCPLogInstance();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
      {
        char v66 = [v83 localIdentifier];
        *(_DWORD *)buf = 138412290;
        unint64_t v94 = (unint64_t)v66;
        _os_log_impl(&dword_1BBEDA000, v65, OS_LOG_TYPE_DEBUG, "[FaceAnalyzer][FC][SmallFace][asset-%@] Invert decision", buf, 0xCu);
      }
    }
    v18 = v72;
    goto LABEL_69;
  }
  if (v81)
  {
    v91 = @"FacesToPersist";
    id v92 = v81;
    double v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v92 forKeys:&v91 count:1];
    objc_msgSend(v85, "setObject:forKeyedSubscript:");
  }
LABEL_72:
  v67 = VCPSignPostLog();
  v68 = v67;
  if (v76 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v67))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v68, OS_SIGNPOST_INTERVAL_END, spid, "VCPFaceAnalyzerVerifyAndMergeFaces", "", buf, 2u);
  }

  if (v77) {
    [v85 removeObjectForKey:@"ImageTooSmall"];
  }
  id v69 = v85;
  *a3 = v69;

  return 0;
}

+ (BOOL)_downsampleBeforeFaceProcessing
{
  return 1;
}

- (int)_loadImageRequestHandler:(id *)a3 orientation:(unsigned int *)a4 bufferWidth:(int *)a5 bufferHeight:(int *)a6 withResource:(id)a7 resourceURL:(id)a8 andAsset:(id)a9
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v55 = a7;
  id v54 = a8;
  id v56 = a9;
  *a3 = 0;
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
  v15 = VCPSignPostLog();
  os_signpost_id_t v16 = os_signpost_id_generate(v15);

  id v17 = VCPSignPostLog();
  v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "VCPFaceProcessingFastPathDecodeAsset", "", buf, 2u);
  }

  if (![(id)objc_opt_class() _downsampleBeforeFaceProcessing]
    || (objc_msgSend(v56, "vcp_isPano") & 1) != 0)
  {
    uint64_t v19 = 0;
    goto LABEL_13;
  }
  signed int v41 = [v55 pixelWidth];
  signed int v42 = [v55 pixelHeight];
  signed int v43 = v42;
  if (v41 && v42) {
    goto LABEL_53;
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    double v44 = VCPLogInstance();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v52 = [v56 localIdentifier];
      unsigned int v45 = [v55 type];
      *(_DWORD *)buf = 138413058;
      BOOL v60 = v52;
      __int16 v61 = 1024;
      unsigned int v62 = v45;
      __int16 v63 = 1024;
      int v64 = v41;
      __int16 v65 = 1024;
      unsigned int v66 = v43;
      _os_log_impl(&dword_1BBEDA000, v44, OS_LOG_TYPE_DEFAULT, "[FaceAnalyzer][%@] Resource (%d) has invalid dimensions (%dx%d); falling back to asset",
        buf,
        0x1Eu);
    }
  }
  signed int v41 = [v56 pixelWidth];
  signed int v46 = [v56 pixelHeight];
  signed int v43 = v46;
  if (v41)
  {
    if (v46)
    {
LABEL_53:
      uint64_t v19 = objc_msgSend(v56, "vcp_targetMajorDimensionForImageWithWidth:height:andMinPreferredMinorDimension:", v41, v43, 1210);
LABEL_13:
      unsigned int v58 = 0;
      double v20 = +[VCPImageManager sharedImageManager];
      CVPixelBufferRef pixelBuffer = (CVPixelBufferRef)[v20 pixelBufferWithFormat:875704422 andMaxDimension:v19 fromImageURL:v54 flushCache:0 orientation:&v58];

      id v21 = VCPSignPostLog();
      BOOL v22 = v21;
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v22, OS_SIGNPOST_INTERVAL_END, v16, "VCPFaceProcessingFastPathDecodeAsset", "", buf, 2u);
      }

      if (pixelBuffer)
      {
        if (v58 - 9 > 0xFFFFFFF7)
        {
          unint64_t v28 = VCPSignPostLog();
          os_signpost_id_t spid = os_signpost_id_generate(v28);

          double v29 = VCPSignPostLog();
          id v30 = v29;
          if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v30, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPFaceAnalyzerLoadImageRequestHandler", "", buf, 2u);
          }

          id v31 = objc_alloc(MEMORY[0x1E4F45890]);
          uint64_t v32 = v58;
          os_signpost_id_t v33 = [(VCPObjectPool *)self->_sessionPool getObject];
          int v34 = [v33 object];
          *a3 = (id)[v31 initWithCVPixelBuffer:pixelBuffer orientation:v32 options:MEMORY[0x1E4F1CC08] session:v34];

          BOOL v35 = VCPSignPostLog();
          char v36 = v35;
          if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v36, OS_SIGNPOST_INTERVAL_END, spid, "VCPFaceAnalyzerLoadImageRequestHandler", "", buf, 2u);
          }

          if (*a3)
          {
            int Width = CVPixelBufferGetWidth(pixelBuffer);
            int Height = CVPixelBufferGetHeight(pixelBuffer);
            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              int v39 = VCPLogInstance();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
              {
                double v40 = [v56 localIdentifier];
                *(_DWORD *)buf = 138413058;
                BOOL v60 = v40;
                __int16 v61 = 1024;
                unsigned int v62 = Width;
                __int16 v63 = 1024;
                int v64 = Height;
                __int16 v65 = 1024;
                unsigned int v66 = v58;
                _os_log_impl(&dword_1BBEDA000, v39, OS_LOG_TYPE_DEBUG, "[FaceAnalyzer][%@] Loaded local resource (%dx%d orientation:%d)", buf, 0x1Eu);
              }
            }
            if (a4) {
              *a4 = v58;
            }
            if (a5) {
              *a5 = Width;
            }
            int v25 = 0;
            if (a6) {
              *a6 = Height;
            }
          }
          else
          {
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              double v47 = VCPLogInstance();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              {
                double v48 = [v56 localIdentifier];
                *(_DWORD *)buf = 138412290;
                BOOL v60 = v48;
                _os_log_impl(&dword_1BBEDA000, v47, OS_LOG_TYPE_ERROR, "[FaceAnalyzer][%@] Failed to create VNImageRequestHandler", buf, 0xCu);
              }
            }
            int v25 = -18;
          }
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            uint64_t v23 = VCPLogInstance();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              double v24 = [v56 localIdentifier];
              *(_DWORD *)buf = 138412546;
              BOOL v60 = v24;
              __int16 v61 = 1024;
              unsigned int v62 = v58;
              _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_ERROR, "[FaceAnalyzer][%@] Failed to decode orientation (%d)", buf, 0x12u);
            }
          }
          int v25 = -50;
        }
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          uint64_t v26 = VCPLogInstance();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            uint64_t v27 = [v56 localIdentifier];
            *(_DWORD *)buf = 138412290;
            BOOL v60 = v27;
            _os_log_impl(&dword_1BBEDA000, v26, OS_LOG_TYPE_ERROR, "[FaceAnalyzer][%@] Failed to decode image", buf, 0xCu);
          }
        }
        int v25 = -23802;
      }
      CF<opaqueCMSampleBuffer *>::~CF((const void **)&pixelBuffer);
      goto LABEL_60;
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    unint64_t v50 = VCPLogInstance();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      uint64_t v51 = [v56 localIdentifier];
      *(_DWORD *)buf = 138412802;
      BOOL v60 = v51;
      __int16 v61 = 1024;
      unsigned int v62 = v41;
      __int16 v63 = 1024;
      int v64 = v43;
      _os_log_impl(&dword_1BBEDA000, v50, OS_LOG_TYPE_ERROR, "[FaceAnalyzer][%@] Invalid dimensions (%dx%d)", buf, 0x18u);
    }
  }
  int v25 = -23802;
LABEL_60:

  return v25;
}

- (int)analyzeAsset:(id)a3 withResource:(id)a4 resourceURL:(id)a5 isBestResource:(BOOL)a6 quickMode:(BOOL)a7 results:(id *)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  *a8 = 0;
  uint64_t v47 = 0;
  int v46 = 0;
  id v45 = 0;
  int v16 = [(VCPFaceAnalyzer *)self _loadImageRequestHandler:&v45 orientation:(char *)&v47 + 4 bufferWidth:&v47 bufferHeight:&v46 withResource:v15 resourceURL:a5 andAsset:v14];
  id v17 = v45;
  if (!v16)
  {
    v18 = VCPSignPostLog();
    os_signpost_id_t v19 = os_signpost_id_generate(v18);

    double v20 = VCPSignPostLog();
    id v21 = v20;
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "VCPFaceAnalyzerPerformAnalysis", "", buf, 2u);
    }

    int v16 = -[VCPFaceAnalyzer _performAnalysis:withRequestHandler:quickMode:sourceWidth:sourceHeight:](self, "_performAnalysis:withRequestHandler:quickMode:sourceWidth:sourceHeight:", a8, v17, v9, [v14 pixelWidth], objc_msgSend(v14, "pixelHeight"));
    if (v16)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        BOOL v22 = VCPLogInstance();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          uint64_t v23 = [v14 localIdentifier];
          *(_DWORD *)buf = 138412290;
          unint64_t v49 = v23;
          _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_ERROR, "[FaceAnalyzer][%@] Failed to analyze resource", buf, 0xCu);
        }
LABEL_31:
      }
    }
    else
    {
      double v24 = VCPSignPostLog();
      int v25 = v24;
      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v25, OS_SIGNPOST_INTERVAL_END, v19, "VCPFaceAnalyzerPerformAnalysis", "", buf, 2u);
      }

      uint64_t v26 = VCPSignPostLog();
      os_signpost_id_t v27 = os_signpost_id_generate(v26);

      unint64_t v28 = VCPSignPostLog();
      double v29 = v28;
      if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v27, "VCPFaceAnalyzerRefineAnalysis", "", buf, 2u);
      }

      id v30 = [*a8 objectForKeyedSubscript:@"FaceResults"];
      uint64_t v44 = [v30 count];

      int v31 = v46;
      if (HIDWORD(v47) <= 4) {
        int v32 = v47;
      }
      else {
        int v32 = v46;
      }
      if (HIDWORD(v47) > 4) {
        int v31 = v47;
      }
      int v16 = [(VCPFaceAnalyzer *)self _refineAnalysis:a8 requestHandler:v17 forAsset:v14 resource:v15 isBestResource:v10 orientedWidth:v32 orientedHeight:v31];
      if (!v16)
      {
        int v34 = VCPSignPostLog();
        BOOL v35 = v34;
        if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v35, OS_SIGNPOST_INTERVAL_END, v27, "VCPFaceAnalyzerRefineAnalysis", "", buf, 2u);
        }

        if ((int)MediaAnalysisLogLevel() < 7)
        {
          int v16 = 0;
          goto LABEL_32;
        }
        BOOL v22 = VCPLogInstance();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          char v36 = [v14 localIdentifier];
          signed int v43 = [*a8 objectForKeyedSubscript:@"FaceResults"];
          v37 = [v43 objectForKeyedSubscript:@"FacesToPersist"];
          uint64_t v38 = [v37 count];
          int v39 = [*a8 objectForKeyedSubscript:@"FaceResults"];
          double v40 = [v39 objectForKeyedSubscript:@"FacesToDelete"];
          uint64_t v41 = [v40 count];
          *(_DWORD *)buf = 138413058;
          unint64_t v49 = v36;
          __int16 v50 = 2048;
          uint64_t v51 = v44;
          __int16 v52 = 2048;
          uint64_t v53 = v38;
          __int16 v54 = 2048;
          uint64_t v55 = v41;
          _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_DEBUG, "[FaceAnalyzer][%@] Face refine completed: detected %lu | persist: %lu | delete: %lu", buf, 0x2Au);
        }
        int v16 = 0;
        goto LABEL_31;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        BOOL v22 = VCPLogInstance();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          os_signpost_id_t v33 = [v14 localIdentifier];
          *(_DWORD *)buf = 138412290;
          unint64_t v49 = v33;
          _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_ERROR, "[FaceAnalyzer][%@] Failed to refine analysis", buf, 0xCu);
        }
        goto LABEL_31;
      }
    }
  }
LABEL_32:

  return v16;
}

- (int)quickAnalyzeAsset:(id)a3 results:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = +[VCPFaceUtils preferredResourcesForFaceProcessingWithAsset:v6];
  uint64_t v8 = +[VCPFaceUtils resourceForFaceProcessing:v7 allowStreaming:0];
  BOOL v9 = [v8 privateFileURL];
  if (v8
    && ([MEMORY[0x1E4F28CB8] defaultManager],
        BOOL v10 = objc_claimAutoreleasedReturnValue(),
        [v9 path],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v10 fileExistsAtPath:v11],
        v11,
        v10,
        (v12 & 1) != 0))
  {
    int v13 = [(VCPFaceAnalyzer *)self analyzeAsset:v6 withResource:v8 resourceURL:v9 isBestResource:+[VCPFaceUtils isBestResourceForFaceProcessing:v8 fromResources:v7] quickMode:1 results:a4];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v14 = VCPLogInstance();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = [v6 localIdentifier];
        int v17 = 138412546;
        v18 = v15;
        __int16 v19 = 2112;
        double v20 = v8;
        _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_ERROR, "[FaceAnalyzer][%@] Missing local resource %@", (uint8_t *)&v17, 0x16u);
      }
    }
    int v13 = -18;
  }

  return v13;
}

- (int)quickAnalyzeCVPixelBuffer:(__CVBuffer *)a3 results:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = VCPSignPostLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  BOOL v9 = VCPSignPostLog();
  BOOL v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v28[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "VCPFaceAnalyzerLoadImageRequestHandlerPixelBuffer", "", (uint8_t *)v28, 2u);
  }

  id v11 = objc_alloc(MEMORY[0x1E4F45890]);
  char v12 = [(VCPObjectPool *)self->_sessionPool getObject];
  int v13 = [v12 object];
  id v14 = (void *)[v11 initWithCVPixelBuffer:a3 options:MEMORY[0x1E4F1CC08] session:v13];

  id v15 = VCPSignPostLog();
  int v16 = v15;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(v28[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v16, OS_SIGNPOST_INTERVAL_END, v8, "VCPFaceAnalyzerLoadImageRequestHandlerPixelBuffer", "", (uint8_t *)v28, 2u);
  }

  if (!v14)
  {
    if ((int)MediaAnalysisLogLevel() < 3)
    {
      int v24 = -18;
      goto LABEL_29;
    }
    int v25 = VCPLogInstance();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v28[0]) = 0;
      _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_ERROR, "[FaceAnalyzer][PixelBuffer] Failed to create VNImageRequestHandler", (uint8_t *)v28, 2u);
    }
    int v24 = -18;
    goto LABEL_27;
  }
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    __int16 v19 = VCPLogInstance();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v28[0] = 67109376;
      v28[1] = Width;
      __int16 v29 = 1024;
      int v30 = Height;
      _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_DEBUG, "[FaceAnalyzer][PixelBuffer] Loaded pixelBuffer(%d x %d)", (uint8_t *)v28, 0xEu);
    }
  }
  double v20 = VCPSignPostLog();
  os_signpost_id_t v21 = os_signpost_id_generate(v20);

  BOOL v22 = VCPSignPostLog();
  uint64_t v23 = v22;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    LOWORD(v28[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "VCPFaceAnalyzerPerformAnalysisPixelBuffer", "", (uint8_t *)v28, 2u);
  }

  int v24 = [(VCPFaceAnalyzer *)self _performAnalysis:a4 withRequestHandler:v14 quickMode:1 sourceWidth:Width sourceHeight:Height];
  if (!v24)
  {
    uint64_t v26 = VCPSignPostLog();
    int v25 = v26;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      LOWORD(v28[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v25, OS_SIGNPOST_INTERVAL_END, v21, "VCPFaceAnalyzerPerformAnalysisPixelBuffer", "", (uint8_t *)v28, 2u);
    }
    int v24 = 0;
    goto LABEL_27;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    int v25 = VCPLogInstance();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v28[0]) = 0;
      _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_ERROR, "[FaceAnalyzer][PixelBuffer] Failed to analyze resource", (uint8_t *)v28, 2u);
    }
LABEL_27:
  }
LABEL_29:

  return v24;
}

- (int)updateMissingFaceprintForFaces:(id)a3 withAsset:(id)a4
{
  uint64_t v148 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v105 = a4;
  int v106 = v6;
  if (![v6 count])
  {
    int v44 = 0;
    goto LABEL_120;
  }
  id v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = VCPMAGetRevisionForVisionModel(v7, self->_processingVersion);
  uint64_t v102 = self;
  v113 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v126 objects:v147 count:16];
  if (!v10) {
    goto LABEL_22;
  }
  uint64_t v11 = *(void *)v127;
  do
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v127 != v11) {
        objc_enumerationMutation(v9);
      }
      int v13 = *(void **)(*((void *)&v126 + 1) + 8 * v12);
      id v14 = [v13 imageprintWrapper];
      BOOL v15 = v14 == 0;

      if (v15)
      {
        [v13 centerX];
        double v17 = v16;
        [v13 centerY];
        double v19 = v18;
        [v13 size];
        +[VCPFaceUtils faceRectFromNormalizedCenterX:normalizedCenterY:normalizedSize:sourceWidth:sourceHeight:](VCPFaceUtils, "faceRectFromNormalizedCenterX:normalizedCenterY:normalizedSize:sourceWidth:sourceHeight:", v17, v19, v20, (double)[v13 sourceWidth], (double)objc_msgSend(v13, "sourceHeight"));
        double v22 = v21;
        double v24 = v23;
        double v26 = v25;
        double v28 = v27;
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          __int16 v29 = VCPLogInstance();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            [v13 centerX];
            double v31 = v30;
            [v13 centerY];
            uint64_t v33 = v32;
            [v13 size];
            *(_DWORD *)buf = 134219520;
            double v134 = v31;
            __int16 v135 = 2048;
            uint64_t v136 = v33;
            __int16 v137 = 2048;
            double v138 = v34;
            __int16 v139 = 2048;
            double v140 = v22;
            __int16 v141 = 2048;
            double v142 = v24;
            __int16 v143 = 2048;
            double v144 = v26;
            __int16 v145 = 2048;
            double v146 = v28;
            _os_log_impl(&dword_1BBEDA000, v29, OS_LOG_TYPE_DEBUG, "[FaceAnalyzer] face (center-x:%.2f, center-y:%.2f, size:%.2f) -> boundingBox (x:%.2f, y:%.2f, width:%.2f, height:%.2f)", buf, 0x48u);
          }
        }
        BOOL v35 = objc_msgSend(MEMORY[0x1E4F457F8], "observationWithRequestRevision:boundingBox:", v8, v22, v24, v26, v28);
        if (v35)
        {
          char v36 = [v13 localIdentifier];
          [v113 setObject:v35 forKeyedSubscript:v36];
          goto LABEL_14;
        }
        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          char v36 = VCPLogInstance();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            double v37 = [v13 gist];
            *(_DWORD *)buf = 138412290;
            double v134 = v37;
            _os_log_impl(&dword_1BBEDA000, v36, OS_LOG_TYPE_DEFAULT, "[FaceAnalyzer] Failed to generate VNFaceObservation from face %@", buf, 0xCu);
          }
LABEL_14:
        }
      }
      ++v12;
    }
    while (v10 != v12);
    uint64_t v38 = [v9 countByEnumeratingWithState:&v126 objects:v147 count:16];
    uint64_t v10 = v38;
  }
  while (v38);
LABEL_22:

  if ([v113 count])
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      int v39 = VCPLogInstance();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        double v40 = COERCE_DOUBLE([v113 count]);
        *(_DWORD *)buf = 134217984;
        double v134 = v40;
        _os_log_impl(&dword_1BBEDA000, v39, OS_LOG_TYPE_INFO, "[FaceAnalyzer] Updating %lu faces with missing faceprint", buf, 0xCu);
      }
    }
    __int16 v103 = +[VCPFaceUtils resourceForFaceProcessingWithAsset:v105 allowStreaming:0];
    __int16 v101 = [v103 privateFileURL];
    if (v103)
    {
      uint64_t v41 = [MEMORY[0x1E4F28CB8] defaultManager];
      signed int v42 = [v101 path];
      char v43 = [v41 fileExistsAtPath:v42];

      if (v43)
      {
        id v125 = 0;
        int v44 = [(VCPFaceAnalyzer *)v102 _loadImageRequestHandler:&v125 orientation:0 bufferWidth:0 bufferHeight:0 withResource:v103 resourceURL:v101 andAsset:v105];
        os_log_t log = (os_log_t)v125;
        if (v44)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            id v45 = VCPLogInstance();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BBEDA000, v45, OS_LOG_TYPE_ERROR, "[FaceAnalyzer] Failed to create VNImageRequestHandler for face quality analysis", buf, 2u);
            }
LABEL_115:
          }
LABEL_116:

          goto LABEL_117;
        }
        uint64_t v97 = mach_absolute_time();
        double v48 = VCPSignPostLog();
        os_signpost_id_t spid = os_signpost_id_generate(v48);

        unint64_t v49 = VCPSignPostLog();
        __int16 v50 = v49;
        if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v50, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPFaceAnalyzerFillMissingFaceprint", "", buf, 2u);
        }

        id v51 = objc_alloc_init(MEMORY[0x1E4F45740]);
        id v124 = v51;
        int v44 = +[VCPFaceUtils configureVNRequest:&v124 withClass:objc_opt_class() andProcessingVersion:v102->_processingVersion];
        __int16 v99 = v124;

        if (!v44)
        {
          __int16 v52 = [v113 allValues];
          [v99 setInputFaceObservations:v52];

          v132 = v99;
          uint64_t v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v132 count:1];
          id v123 = 0;
          char v54 = [log performRequests:v53 error:&v123];
          id v96 = v123;

          if (v54)
          {
            uint64_t v55 = [v99 results];
            long long v121 = 0u;
            long long v122 = 0u;
            long long v119 = 0u;
            long long v120 = 0u;
            id obj = v9;
            int v108 = v55;
            uint64_t v56 = [obj countByEnumeratingWithState:&v119 objects:v131 count:16];
            if (v56)
            {
              uint64_t v109 = *(void *)v120;
              do
              {
                uint64_t v110 = v56;
                for (uint64_t i = 0; i != v110; ++i)
                {
                  if (*(void *)v120 != v109) {
                    objc_enumerationMutation(obj);
                  }
                  type = *(void **)(*((void *)&v119 + 1) + 8 * i);
                  context = (void *)MEMORY[0x1C186D320]();
                  unsigned int v58 = [type localIdentifier];
                  int v59 = [v113 objectForKeyedSubscript:v58];

                  if (v59)
                  {
                    long long v117 = 0u;
                    long long v118 = 0u;
                    long long v115 = 0u;
                    long long v116 = 0u;
                    BOOL v60 = v108;
                    uint64_t v61 = [v60 countByEnumeratingWithState:&v115 objects:v130 count:16];
                    if (v61)
                    {
                      uint64_t v62 = *(void *)v116;
LABEL_57:
                      uint64_t v63 = 0;
                      while (1)
                      {
                        if (*(void *)v116 != v62) {
                          objc_enumerationMutation(v60);
                        }
                        int v64 = *(void **)(*((void *)&v115 + 1) + 8 * v63);
                        __int16 v65 = [v59 uuid];
                        unsigned int v66 = [v64 uuid];
                        int v67 = [v65 isEqual:v66];

                        if (v67) {
                          break;
                        }
                        if (v61 == ++v63)
                        {
                          uint64_t v61 = [v60 countByEnumeratingWithState:&v115 objects:v130 count:16];
                          if (v61) {
                            goto LABEL_57;
                          }
                          goto LABEL_63;
                        }
                      }
                      id v69 = [v64 faceprint];
                      float v70 = v69;
                      if (v69)
                      {
                        [v69 confidence];
                        float v72 = v71;
                        if (_os_feature_enabled_impl()) {
                          float v73 = 0.2;
                        }
                        else {
                          float v73 = 0.9;
                        }
                        if (v72 < v73)
                        {
                          if ((int)MediaAnalysisLogLevel() >= 6)
                          {
                            BOOL v74 = VCPLogInstance();
                            if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
                            {
                              [v70 confidence];
                              float v76 = v75;
                              if (_os_feature_enabled_impl()) {
                                uint64_t v77 = 0x3FC99999A0000000;
                              }
                              else {
                                uint64_t v77 = 0x3FECCCCCC0000000;
                              }
                              double v78 = [v64 description];
                              [v64 faceJunkinessIndex];
                              *(_DWORD *)buf = 134218754;
                              double v134 = v76;
                              __int16 v135 = 2048;
                              uint64_t v136 = v77;
                              __int16 v137 = 2112;
                              double v138 = v78;
                              __int16 v139 = 2048;
                              double v140 = v79;
                              _os_log_impl(&dword_1BBEDA000, v74, OS_LOG_TYPE_INFO, "[FaceAnalyzer] faceprint.confidence is too low (%.3f < %.3f) %@ - junkinessIndex: %.3f", buf, 0x2Au);
                            }
                            goto LABEL_95;
                          }
LABEL_96:

                          goto LABEL_97;
                        }
                        if ((int)MediaAnalysisLogLevel() >= 7)
                        {
                          id v80 = VCPLogInstance();
                          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
                          {
                            [v70 confidence];
                            float v82 = v81;
                            id v83 = [v64 description];
                            [v64 faceJunkinessIndex];
                            *(_DWORD *)buf = 134218498;
                            double v134 = v82;
                            __int16 v135 = 2112;
                            uint64_t v136 = (uint64_t)v83;
                            __int16 v137 = 2048;
                            double v138 = v84;
                            _os_log_impl(&dword_1BBEDA000, v80, OS_LOG_TYPE_DEBUG, "[FaceAnalyzer] Accepting faceprint with confidence: %.3f %@ - junkinessIndex: %.3f", buf, 0x20u);
                          }
                        }
                        BOOL v74 = [objc_alloc(MEMORY[0x1E4F45800]) initWithFaceprint:v70 torsoprint:0];
                        id v114 = 0;
                        id v85 = [v74 serializeStateAndReturnError:&v114];
                        double v104 = COERCE_DOUBLE(v114);
                        if (v85)
                        {
                          if ((int)MediaAnalysisLogLevel() >= 6)
                          {
                            BOOL v86 = VCPLogInstance();
                            if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
                            {
                              double v87 = [type gist];
                              *(_DWORD *)buf = 138412290;
                              double v134 = v87;
                              _os_log_impl(&dword_1BBEDA000, v86, OS_LOG_TYPE_INFO, "[FaceAnalyzer] Update faceprint for face %@", buf, 0xCu);
                            }
                          }
                          long long v88 = +[VCPVNImageprintWrapper wrapperWithImageprintType:0 version:v102->_processingVersion andData:v85];
                          [type setImageprintWrapper:v88];

                          [type setVuObservationID:0];
                        }
                        else if ((int)MediaAnalysisLogLevel() >= 3)
                        {
                          long long v89 = VCPLogInstance();
                          if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)buf = 138412290;
                            double v134 = v104;
                            _os_log_impl(&dword_1BBEDA000, v89, OS_LOG_TYPE_ERROR, "[FaceAnalyzer] Unable to serialize faceTorsoprint - %@", buf, 0xCu);
                          }
                        }
                      }
                      else
                      {
                        if ((int)MediaAnalysisLogLevel() < 3) {
                          goto LABEL_96;
                        }
                        BOOL v74 = VCPLogInstance();
                        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412290;
                          double v134 = *(double *)&v64;
                          _os_log_impl(&dword_1BBEDA000, v74, OS_LOG_TYPE_ERROR, "[FaceAnalyzer] No valid faceprint from observation %@", buf, 0xCu);
                        }
                      }
LABEL_95:

                      goto LABEL_96;
                    }
LABEL_63:

                    if ((int)MediaAnalysisLogLevel() >= 4)
                    {
                      BOOL v60 = VCPLogInstance();
                      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
                      {
                        double v68 = [type gist];
                        *(_DWORD *)buf = 138412290;
                        double v134 = v68;
                        _os_log_impl(&dword_1BBEDA000, v60, OS_LOG_TYPE_DEFAULT, "[FaceAnalyzer] Failed to get faceprint for face %@", buf, 0xCu);
                      }
LABEL_97:
                    }
                  }
                }
                uint64_t v56 = [obj countByEnumeratingWithState:&v119 objects:v131 count:16];
              }
              while (v56);
            }

            long long v90 = VCPSignPostLog();
            v91 = v90;
            if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v90))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v91, OS_SIGNPOST_INTERVAL_END, spid, "VCPFaceAnalyzerFillMissingFaceprint", "", buf, 2u);
            }

            int v44 = v97;
            id v92 = v108;
            if (v97)
            {
              mach_absolute_time();
              VCPPerformance_LogMeasurement();
              int v44 = 0;
            }
LABEL_112:

            int v93 = v96;
          }
          else
          {
            int v93 = v96;
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              id v92 = VCPLogInstance();
              if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
              {
                double v94 = [v96 description];
                *(_DWORD *)buf = 138412290;
                double v134 = v94;
                _os_log_impl(&dword_1BBEDA000, v92, OS_LOG_TYPE_ERROR, "[FaceAnalyzer] Faceprint VNImageRequestHandler::performRequests: %@", buf, 0xCu);
              }
              int v44 = -18;
              goto LABEL_112;
            }
            int v44 = -18;
          }
        }
        id v45 = v99;
        goto LABEL_115;
      }
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      VCPLogInstance();
      os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        double v46 = [v105 localIdentifier];
        *(_DWORD *)buf = 138412546;
        double v134 = v46;
        __int16 v135 = 2112;
        uint64_t v136 = (uint64_t)v103;
        _os_log_impl(&dword_1BBEDA000, log, OS_LOG_TYPE_ERROR, "[FaceAnalyzer][%@] Missing local resource %@", buf, 0x16u);
      }
      int v44 = -18;
      goto LABEL_116;
    }
    int v44 = -18;
LABEL_117:

LABEL_118:
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      uint64_t v47 = VCPLogInstance();
      __int16 v103 = v47;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v47, OS_LOG_TYPE_DEBUG, "[FaceAnalyzer] All faces contain valid faceprint", buf, 2u);
      }
      int v44 = 0;
      goto LABEL_118;
    }
    int v44 = 0;
  }

LABEL_120:
  return v44;
}

- (int)analyzeFaceQuality:(id *)a3 withAsset:(id)a4 andCancelBlock:(id)a5
{
  v132[2] = *MEMORY[0x1E4F143B8];
  id v100 = a4;
  __int16 v99 = (uint64_t (**)(void))a5;
  uint64_t v8 = (objc_class *)objc_opt_class();
  id v9 = (void *)VCPMAGetRevisionForVisionModel(v8, self->_processingVersion);
  uint64_t v10 = objc_opt_class();
  if ((VCPMAVNRequestSupportRevision(v10, v9) & 1) != 0
    && (id v96 = VCPMAGetRevisionForMediaAnalysisType(0x1000000000),
        uint64_t v11 = objc_opt_class(),
        (VCPMAVNRequestSupportRevision(v11, v96) & 1) != 0))
  {
    if (objc_msgSend(v100, "vcp_quickFaceClassificationDone"))
    {
      uint64_t v12 = [v100 photoLibrary];
      double v94 = [v12 librarySpecificFetchOptions];

      uint64_t v13 = *MEMORY[0x1E4F39620];
      v132[0] = *MEMORY[0x1E4F39630];
      v132[1] = v13;
      id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v132 count:2];
      int v93 = a3;
      [v94 setFetchPropertySets:v14];

      __int16 v101 = [MEMORY[0x1E4F39048] fetchFacesInAsset:v100 options:v94];
      if (![v101 count])
      {
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          unint64_t v49 = VCPLogInstance();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
          {
            __int16 v50 = [v100 localIdentifier];
            *(_DWORD *)buf = 138412290;
            long long v117 = v50;
            _os_log_impl(&dword_1BBEDA000, v49, OS_LOG_TYPE_INFO, "[FaceAnalyzer][%@] No face detected; skip face quality analysis",
              buf,
              0xCu);
          }
        }
        v130 = @"FaceQualityResults";
        uint64_t v131 = MEMORY[0x1E4F1CBF0];
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v131 forKeys:&v130 count:1];
        int v38 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_100;
      }
      int v98 = [MEMORY[0x1E4F1CA60] dictionary];
      for (unint64_t i = 0; i < [v101 count]; ++i)
      {
        double v16 = [v101 objectAtIndexedSubscript:i];
        [v16 centerX];
        double v18 = v17;
        [v16 centerY];
        double v20 = v19;
        [v16 size];
        +[VCPFaceUtils faceRectFromNormalizedCenterX:normalizedCenterY:normalizedSize:sourceWidth:sourceHeight:](VCPFaceUtils, "faceRectFromNormalizedCenterX:normalizedCenterY:normalizedSize:sourceWidth:sourceHeight:", v18, v20, v21, (double)[v16 sourceWidth], (double)objc_msgSend(v16, "sourceHeight"));
        double v23 = v22;
        double v25 = v24;
        double v27 = v26;
        double v29 = v28;
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          double v30 = VCPLogInstance();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            [v16 centerX];
            uint64_t v32 = v31;
            [v16 centerY];
            uint64_t v34 = v33;
            [v16 size];
            *(_DWORD *)buf = 134219520;
            long long v117 = v32;
            __int16 v118 = 2048;
            uint64_t v119 = v34;
            __int16 v120 = 2048;
            uint64_t v121 = v35;
            __int16 v122 = 2048;
            double v123 = v23;
            __int16 v124 = 2048;
            double v125 = v25;
            __int16 v126 = 2048;
            double v127 = v27;
            __int16 v128 = 2048;
            double v129 = v29;
            _os_log_impl(&dword_1BBEDA000, v30, OS_LOG_TYPE_DEBUG, "[FaceAnalyzer] face (center-x:%.2f, center-y:%.2f, size:%.2f) -> boundingBox (x:%.2f, y:%.2f, width:%.2f, height:%.2f)", buf, 0x48u);
          }
        }
        char v36 = objc_msgSend(MEMORY[0x1E4F457F8], "observationWithRequestRevision:boundingBox:", v9, v23, v25, v27, v29);
        if (v36)
        {
          double v37 = [v16 localIdentifier];
          [v98 setObject:v36 forKeyedSubscript:v37];
        }
      }
      if (![v98 count])
      {
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          __int16 v52 = VCPLogInstance();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            uint64_t v53 = [v100 localIdentifier];
            uint64_t v54 = [v101 count];
            *(_DWORD *)buf = 138412546;
            long long v117 = v53;
            __int16 v118 = 2048;
            uint64_t v119 = v54;
            _os_log_impl(&dword_1BBEDA000, v52, OS_LOG_TYPE_INFO, "[FaceAnalyzer][%@] No valid face observations from %lu faces; skip face quality analysis",
              buf,
              0x16u);
          }
        }
        id v114 = @"FaceQualityResults";
        uint64_t v115 = MEMORY[0x1E4F1CBF0];
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v115 forKeys:&v114 count:1];
        int v38 = 0;
        *int v93 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_99;
      }
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        signed int v42 = VCPLogInstance();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          uint64_t v43 = [v98 count];
          *(_DWORD *)buf = 134217984;
          long long v117 = v43;
          _os_log_impl(&dword_1BBEDA000, v42, OS_LOG_TYPE_INFO, "[FaceAnalyzer] Analyzing %lu face observations for face quality", buf, 0xCu);
        }
      }
      id v92 = +[VCPFaceUtils resourceForFaceProcessingWithAsset:v100 allowStreaming:0];
      __int16 v95 = [v92 privateFileURL];
      if (!v92
        || ([MEMORY[0x1E4F28CB8] defaultManager],
            int v44 = objc_claimAutoreleasedReturnValue(),
            [v95 path],
            id v45 = objc_claimAutoreleasedReturnValue(),
            char v46 = [v44 fileExistsAtPath:v45],
            v45,
            v44,
            (v46 & 1) == 0))
      {
        if ((int)MediaAnalysisLogLevel() < 3)
        {
          int v38 = -18;
LABEL_98:

LABEL_99:
LABEL_100:

          double v40 = v94;
LABEL_101:

          goto LABEL_15;
        }
        uint64_t v47 = VCPLogInstance();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          id v51 = [v100 localIdentifier];
          *(_DWORD *)buf = 138412546;
          long long v117 = v51;
          __int16 v118 = 2112;
          uint64_t v119 = (uint64_t)v92;
          _os_log_impl(&dword_1BBEDA000, v47, OS_LOG_TYPE_ERROR, "[FaceAnalyzer][%@] Missing local resource %@", buf, 0x16u);
        }
        int v38 = -18;
        goto LABEL_97;
      }
      id v108 = 0;
      int v38 = [(VCPFaceAnalyzer *)self _loadImageRequestHandler:&v108 orientation:0 bufferWidth:0 bufferHeight:0 withResource:v92 resourceURL:v95 andAsset:v100];
      uint64_t v47 = v108;
      if (v38)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          long long v89 = v47;
          double v48 = VCPLogInstance();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BBEDA000, v48, OS_LOG_TYPE_ERROR, "[FaceAnalyzer] Failed to create VNImageRequestHandler for face quality analysis", buf, 2u);
          }
          goto LABEL_96;
        }
LABEL_97:

        goto LABEL_98;
      }
      if (v99 && (v99[2]() & 1) != 0)
      {
        int v38 = -128;
        goto LABEL_97;
      }
      long long v89 = v47;
      uint64_t v85 = mach_absolute_time();
      uint64_t v55 = VCPSignPostLog();
      os_signpost_id_t spid = os_signpost_id_generate(v55);

      uint64_t v56 = VCPSignPostLog();
      uint64_t v57 = v56;
      if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v56))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v57, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPFaceAnalyzerFaceQuality", "", buf, 2u);
      }

      id v107 = 0;
      id v88 = objc_alloc_init(MEMORY[0x1E4F45780]);
      char v58 = [v88 setRevision:v96 error:&v107];
      double v48 = v107;
      if (v58)
      {
        [v88 setMetalContextPriority:1];
        [v88 setPreferBackgroundProcessing:1];
        if (DeviceHasANE())
        {
          int v59 = [MEMORY[0x1E4F458E8] defaultANEDevice];
          [v88 setProcessingDevice:v59];
        }
        BOOL v60 = [v98 allValues];
        [v88 setInputFaceObservations:v60];

        id v113 = v88;
        uint64_t v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v113 count:1];
        int v106 = v48;
        char v62 = [v47 performRequests:v61 error:&v106];
        float v84 = v106;

        if (v62)
        {
          double v87 = [MEMORY[0x1E4F1CA60] dictionary];
          long long v90 = [v88 results];
          for (unint64_t j = 0; j < [v101 count]; ++j)
          {
            uint64_t v63 = (void *)MEMORY[0x1C186D320]();
            v91 = [v101 objectAtIndexedSubscript:j];
            int v64 = [v91 localIdentifier];
            __int16 v65 = [v98 objectForKeyedSubscript:v64];

            if (v65)
            {
              long long v104 = 0u;
              long long v105 = 0u;
              long long v102 = 0u;
              long long v103 = 0u;
              id v66 = v90;
              uint64_t v67 = [v66 countByEnumeratingWithState:&v102 objects:v112 count:16];
              if (!v67) {
                goto LABEL_74;
              }
              uint64_t v68 = *(void *)v103;
              while (2)
              {
                for (uint64_t k = 0; k != v67; ++k)
                {
                  if (*(void *)v103 != v68) {
                    objc_enumerationMutation(v66);
                  }
                  float v70 = *(void **)(*((void *)&v102 + 1) + 8 * k);
                  float v71 = [v65 uuid];
                  float v72 = [v70 uuid];
                  int v73 = [v71 isEqual:v72];

                  if (v73)
                  {
                    BOOL v74 = [v70 faceCaptureQuality];
                    BOOL v75 = v74 == 0;

                    if (v75)
                    {
                      if ((int)MediaAnalysisLogLevel() < 3) {
                        goto LABEL_74;
                      }
                      float v76 = VCPLogInstance();
                      if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
                      {
                        double v78 = [v100 localIdentifier];
                        float v79 = [v91 localIdentifier];
                        *(_DWORD *)buf = 138412546;
                        long long v117 = v78;
                        __int16 v118 = 2112;
                        uint64_t v119 = (uint64_t)v79;
                        _os_log_impl(&dword_1BBEDA000, v76, OS_LOG_TYPE_ERROR, "[FaceAnalyzer][%@][%@] No valid Face Quality score; skipping",
                          buf,
                          0x16u);
                      }
                    }
                    else
                    {
                      float v76 = [v70 faceCaptureQuality];
                      uint64_t v77 = [v91 localIdentifier];
                      [v87 setObject:v76 forKeyedSubscript:v77];
                    }
                    goto LABEL_74;
                  }
                }
                uint64_t v67 = [v66 countByEnumeratingWithState:&v102 objects:v112 count:16];
                if (v67) {
                  continue;
                }
                break;
              }
LABEL_74:
            }
          }
          float v81 = VCPSignPostLog();
          float v82 = v81;
          if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v81))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v82, OS_SIGNPOST_INTERVAL_END, spid, "VCPFaceAnalyzerFaceQuality", "", buf, 2u);
          }

          if (v85)
          {
            mach_absolute_time();
            VCPPerformance_LogMeasurement();
          }
          uint64_t v109 = v87;
          uint64_t v110 = @"FaceQualityResults";
          id v83 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v109 count:1];
          long long v111 = v83;
          *int v93 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v111 forKeys:&v110 count:1];

          int v38 = 0;
          double v48 = v84;
          id v80 = v87;
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() < 3)
          {
            int v38 = -18;
            double v48 = v84;
            goto LABEL_95;
          }
          id v80 = VCPLogInstance();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            long long v117 = v84;
            _os_log_impl(&dword_1BBEDA000, v80, OS_LOG_TYPE_ERROR, "[FaceAnalyzer] Failed to perform Face Quality request - %@", buf, 0xCu);
          }
          int v38 = -18;
          double v48 = v84;
        }
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() < 3)
        {
          int v38 = -18;
LABEL_95:

LABEL_96:
          uint64_t v47 = v89;
          goto LABEL_97;
        }
        id v80 = VCPLogInstance();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          long long v117 = v96;
          __int16 v118 = 2112;
          uint64_t v119 = (uint64_t)v48;
          _os_log_impl(&dword_1BBEDA000, v80, OS_LOG_TYPE_ERROR, "[FaceAnalyzer] Failed to set Face Quality revision (%lu) - %@", buf, 0x16u);
        }
        int v38 = -18;
      }

      goto LABEL_95;
    }
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      double v40 = VCPLogInstance();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        uint64_t v41 = [v100 localIdentifier];
        *(_DWORD *)buf = 138412290;
        long long v117 = v41;
        _os_log_impl(&dword_1BBEDA000, v40, OS_LOG_TYPE_INFO, "[FaceAnalyzer][%@] No face detected; skip face quality analysis",
          buf,
          0xCu);
      }
      int v38 = 0;
      goto LABEL_101;
    }
    int v38 = 0;
  }
  else
  {
    int v38 = -50;
  }
LABEL_15:

  return v38;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionPool, 0);
  objc_storeStrong((id *)&self->_faceMerger, 0);
}

@end