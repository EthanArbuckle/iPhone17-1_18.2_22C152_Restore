@interface VCPVideoFullFaceDetector
- (BOOL)compareFace:(id)a3 withFace:(id)a4;
- (BOOL)locationChange:(CGRect)a3 relativeTo:(CGRect)a4 landscape:(BOOL)a5;
- (VCPVideoFullFaceDetector)initWithTransform:(CGAffineTransform *)a3;
- (VCPVideoFullFaceDetector)initWithTransform:(CGAffineTransform *)a3 withExistingFaceprints:(id)a4;
- (float)minProcessTimeIntervalInSecs;
- (id)faceRanges;
- (id)frameFaceResults;
- (int)analyzeFrame:(__CVBuffer *)a3 timestamp:(id *)a4 duration:(id *)a5 frameStats:(id)a6 flags:(unint64_t *)a7;
- (int)clusterFaces;
- (int)detectFaces:(__CVBuffer *)a3 faces:(id)a4 torsos:(id)a5 frameStats:(id)a6;
- (int)detectTrackFacesInFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 faces:(id)a5 torsos:(id)a6 frameStats:(id)a7;
- (int)finishAnalysisPass:(id *)a3;
- (int)updateWithExistingFaces;
- (void)removeSmallestKeyFace;
@end

@implementation VCPVideoFullFaceDetector

- (id)faceRanges
{
  return self->_faceRanges;
}

- (VCPVideoFullFaceDetector)initWithTransform:(CGAffineTransform *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)VCPVideoFullFaceDetector;
  v4 = [(VCPVideoFullFaceDetector *)&v11 init];
  long long v5 = *(_OWORD *)&a3->c;
  v10[0] = *(_OWORD *)&a3->a;
  v10[1] = v5;
  v10[2] = *(_OWORD *)&a3->tx;
  v6 = [(VCPVideoFullFaceDetector *)v4 initWithTransform:v10 withExistingFaceprints:0];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    frameFaceResults = v6->_frameFaceResults;
    v6->_frameFaceResults = (NSMutableArray *)v7;
  }
  return v6;
}

- (VCPVideoFullFaceDetector)initWithTransform:(CGAffineTransform *)a3 withExistingFaceprints:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v53.receiver = self;
  v53.super_class = (Class)VCPVideoFullFaceDetector;
  v8 = [(VCPVideoFullFaceDetector *)&v53 init];
  if (v8)
  {
    long long v9 = *(_OWORD *)&a3->c;
    v52[0] = *(_OWORD *)&a3->a;
    v52[1] = v9;
    v52[2] = *(_OWORD *)&a3->tx;
    *((_DWORD *)v8 + 2) = angleForTransform(v52);
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    objc_super v11 = (void *)*((void *)v8 + 5);
    *((void *)v8 + 5) = v10;

    uint64_t v12 = MEMORY[0x1E4F1FA08];
    uint64_t v13 = *(void *)(MEMORY[0x1E4F1FA08] + 16);
    *(_OWORD *)(v8 + 12) = *MEMORY[0x1E4F1FA08];
    *(void *)(v8 + 28) = v13;
    uint64_t v14 = *(void *)(v12 + 16);
    *(_OWORD *)(v8 + 92) = *(_OWORD *)v12;
    *(void *)(v8 + 108) = v14;
    v15 = (void *)*((void *)v8 + 6);
    *((void *)v8 + 6) = 0;

    *((_DWORD *)v8 + 14) = 31;
    uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
    v17 = (void *)*((void *)v8 + 15);
    *((void *)v8 + 15) = v16;

    uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
    v19 = (void *)*((void *)v8 + 16);
    *((void *)v8 + 16) = v18;

    uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
    v21 = (void *)*((void *)v8 + 18);
    *((void *)v8 + 18) = v20;

    uint64_t v22 = [MEMORY[0x1E4F1CA60] dictionary];
    v23 = (void *)*((void *)v8 + 19);
    *((void *)v8 + 19) = v22;

    uint64_t v24 = [MEMORY[0x1E4F1CA60] dictionary];
    v25 = (void *)*((void *)v8 + 20);
    *((void *)v8 + 20) = v24;

    uint64_t v26 = [MEMORY[0x1E4F1CA48] array];
    v27 = (void *)*((void *)v8 + 21);
    *((void *)v8 + 21) = v26;

    uint64_t v28 = [MEMORY[0x1E4F1CA48] array];
    v29 = (void *)*((void *)v8 + 17);
    *((void *)v8 + 17) = v28;

    objc_storeStrong((id *)v8 + 10, a4);
    uint64_t v30 = [MEMORY[0x1E4F1CA60] dictionary];
    v31 = (void *)*((void *)v8 + 22);
    *((void *)v8 + 22) = v30;

    *((_DWORD *)v8 + 22) = 0;
    v32 = (void *)*((void *)v8 + 23);
    *((void *)v8 + 23) = 0;

    uint64_t v54 = 0;
    v55 = &v54;
    uint64_t v56 = 0x2050000000;
    v33 = (void *)getGDVUStreamingGalleryClass(void)::softClass;
    uint64_t v57 = getGDVUStreamingGalleryClass(void)::softClass;
    if (!getGDVUStreamingGalleryClass(void)::softClass)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v59 = ___ZL28getGDVUStreamingGalleryClassv_block_invoke;
      v60 = &unk_1E62970F8;
      v61 = &v54;
      ___ZL28getGDVUStreamingGalleryClassv_block_invoke((uint64_t)&buf);
      v33 = (void *)v55[3];
    }
    v34 = v33;
    _Block_object_dispose(&v54, 8);
    id v35 = [v34 alloc];
    uint64_t v54 = 0;
    v55 = &v54;
    uint64_t v56 = 0x2050000000;
    v36 = (void *)getGDVUEntityRecognitionClientClass(void)::softClass;
    uint64_t v57 = getGDVUEntityRecognitionClientClass(void)::softClass;
    if (!getGDVUEntityRecognitionClientClass(void)::softClass)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v59 = ___ZL35getGDVUEntityRecognitionClientClassv_block_invoke;
      v60 = &unk_1E62970F8;
      v61 = &v54;
      ___ZL35getGDVUEntityRecognitionClientClassv_block_invoke((uint64_t)&buf);
      v36 = (void *)v55[3];
    }
    id v37 = v36;
    _Block_object_dispose(&v54, 8);
    v38 = [v37 photos];
    id v51 = 0;
    uint64_t v39 = [v35 initWithClient:v38 error:&v51];
    id v40 = v51;
    v41 = (void *)*((void *)v8 + 24);
    *((void *)v8 + 24) = v39;

    if (*((void *)v8 + 24))
    {
      uint64_t v42 = +[VCPCNNSmileDetector detector];
      v43 = (void *)*((void *)v8 + 8);
      *((void *)v8 + 8) = v42;

      v44 = (void *)*((void *)v8 + 8);
      if (v44)
      {
        uint64_t v45 = +[VCPCNNPoseEstimator estimator];
        v46 = (void *)*((void *)v8 + 9);
        *((void *)v8 + 9) = v45;

        if (*((void *)v8 + 9)) {
          v44 = v8;
        }
        else {
          v44 = 0;
        }
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v48 = VCPLogInstance();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          v49 = [v40 description];
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v49;
          _os_log_impl(&dword_1BBEDA000, v48, OS_LOG_TYPE_ERROR, "Failed to init GDVUStreamingGallery %@", (uint8_t *)&buf, 0xCu);
        }
      }
      v44 = 0;
    }
    v47 = v44;
  }
  else
  {
    v47 = 0;
  }

  return v47;
}

- (int)detectFaces:(__CVBuffer *)a3 faces:(id)a4 torsos:(id)a5 frameStats:(id)a6
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  id v105 = a4;
  id v111 = a5;
  id v108 = a6;
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  context = (void *)MEMORY[0x1C186D320]();
  v104 = [MEMORY[0x1E4F1CA48] array];
  id v10 = objc_alloc(MEMORY[0x1E4F45890]);
  v107 = (void *)[v10 initWithCVPixelBuffer:a3 options:MEMORY[0x1E4F1CC08]];
  v109 = [MEMORY[0x1E4F1CA48] array];
  objc_super v11 = VCPSignPostLog();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  uint64_t v13 = VCPSignPostLog();
  uint64_t v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "VCPVideoFullFaceDetectorFaceHumanDetection", "", buf, 2u);
  }

  id v131 = 0;
  uint64_t v15 = objc_opt_class();
  if (_os_feature_enabled_impl()) {
    uint64_t v16 = 15;
  }
  else {
    uint64_t v16 = 11;
  }
  int v17 = +[VCPFaceUtils configureVNRequest:&v131 withClass:v15 andProcessingVersion:v16];
  id v18 = v131;
  int v110 = v17;
  v106 = v18;
  if (v17)
  {
    id v19 = 0;
    LODWORD(v20) = 4;
    goto LABEL_97;
  }
  if (v18) {
    [v109 addObject:v18];
  }
  if (!_os_feature_enabled_impl())
  {
    id v25 = 0;
LABEL_18:
    v99 = v25;
    id v129 = 0;
    char v26 = [v107 performRequests:v109 error:&v129];
    id v19 = v129;
    if ((v26 & 1) == 0)
    {
      int v110 = -18;
      goto LABEL_31;
    }
    v27 = VCPSignPostLog();
    uint64_t v28 = v27;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v28, OS_SIGNPOST_INTERVAL_END, v12, "VCPVideoFullFaceDetectorFaceHumanDetection", "", buf, 2u);
    }

    [v109 removeAllObjects];
    v29 = VCPSignPostLog();
    os_signpost_id_t v30 = os_signpost_id_generate(v29);

    v31 = VCPSignPostLog();
    v32 = v31;
    if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v30, "VCPVideoFullFaceDetectorFaceTorsoprint", "", buf, 2u);
    }

    id v128 = 0;
    uint64_t v33 = objc_opt_class();
    if (_os_feature_enabled_impl()) {
      uint64_t v34 = 15;
    }
    else {
      uint64_t v34 = 11;
    }
    int v35 = +[VCPFaceUtils configureVNRequest:&v128 withClass:v33 andProcessingVersion:v34];
    id v98 = v128;
    int v110 = v35;
    if (v35)
    {
      LODWORD(v20) = 4;
LABEL_95:

      goto LABEL_96;
    }
    v36 = [v106 results];
    [v98 setInputFaceObservations:v36];

    if (v98) {
      [v109 addObject:v98];
    }
    if (!_os_feature_enabled_impl()) {
      goto LABEL_44;
    }
    id v127 = 0;
    uint64_t v37 = objc_opt_class();
    if (_os_feature_enabled_impl()) {
      uint64_t v38 = 15;
    }
    else {
      uint64_t v38 = 11;
    }
    int v39 = +[VCPFaceUtils configureVNRequest:&v127 withClass:v37 andProcessingVersion:v38];
    id v97 = v127;
    int v110 = v39;
    if (v39)
    {
      LODWORD(v20) = 4;
LABEL_94:

      goto LABEL_95;
    }
    id v40 = [v99 results];
    [v97 setInputDetectedObjectObservations:v40];

    if (v97) {
      objc_msgSend(v109, "addObject:");
    }
    else {
LABEL_44:
    }
      id v97 = 0;
    id v126 = v19;
    int v41 = [v107 performRequests:v109 error:&v126];
    id v95 = v126;

    if (v41)
    {
      uint64_t v42 = VCPSignPostLog();
      v43 = v42;
      if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v43, OS_SIGNPOST_INTERVAL_END, v30, "VCPVideoFullFaceDetectorFaceTorsoprint", "", buf, 2u);
      }

      v44 = [v98 results];
      BOOL v45 = v44 == 0;

      if (!v45)
      {
        v46 = [v98 results];
        [v104 addObjectsFromArray:v46];
      }
      v47 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v124 = 0u;
      long long v125 = 0u;
      long long v122 = 0u;
      long long v123 = 0u;
      v48 = [v97 results];
      uint64_t v49 = [v48 countByEnumeratingWithState:&v122 objects:v136 count:16];
      if (v49)
      {
        uint64_t v50 = *(void *)v123;
        do
        {
          for (uint64_t i = 0; i != v49; ++i)
          {
            if (*(void *)v123 != v50) {
              objc_enumerationMutation(v48);
            }
            v52 = *(void **)(*((void *)&v122 + 1) + 8 * i);
            objc_super v53 = (void *)MEMORY[0x1C186D320]();
            uint64_t v54 = [v52 groupId];
            BOOL v55 = v54 == 0;

            if (!v55)
            {
              uint64_t v56 = [v52 groupId];
              [v47 setObject:v52 forKeyedSubscript:v56];
            }
          }
          uint64_t v49 = [v48 countByEnumeratingWithState:&v122 objects:v136 count:16];
        }
        while (v49);
      }

      memset(buf, 0, 16);
      long long v118 = 0u;
      long long v119 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      id v57 = v104;
      uint64_t v58 = [v57 countByEnumeratingWithState:&v118 objects:v134 count:16];
      if (v58)
      {
        int v110 = 0;
        double v60 = (double)Width;
        double v61 = (double)-Height;
        double v62 = (double)Height;
        uint64_t v101 = *(void *)v119;
        *(void *)&long long v59 = 138412290;
        long long v94 = v59;
LABEL_62:
        uint64_t v63 = 0;
        while (1)
        {
          if (*(void *)v119 != v101) {
            objc_enumerationMutation(v57);
          }
          v64 = *(void **)(*((void *)&v118 + 1) + 8 * v63);
          v65 = (void *)MEMORY[0x1C186D320]();
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v66 = VCPLogInstance();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v133 = v94;
              *(void *)&v133[4] = v64;
              _os_log_impl(&dword_1BBEDA000, v66, OS_LOG_TYPE_DEBUG, "[VCPVideoFullFaceDetector] Detected face %@", v133, 0xCu);
            }
          }
          objc_msgSend(v64, "boundingBox", v94);
          *(_OWORD *)&v117.b = *(_OWORD *)buf;
          v117.a = v60;
          v117.d = v61;
          v117.tdouble x = 0.0;
          v117.tdouble y = v62;
          CGRect v139 = CGRectApplyAffineTransform(v138, &v117);
          double x = v139.origin.x;
          double y = v139.origin.y;
          double v69 = v139.size.width;
          double v70 = v139.size.height;
          unsigned __int8 v116 = 0;
          int v71 = -[VCPCNNSmileDetector detectSmileForFace:inBuffer:smile:](self->_smileDetector, "detectSmileForFace:inBuffer:smile:", a3, &v116);
          if (v71)
          {
            LODWORD(v20) = 4;
            int v110 = v71;
          }
          else
          {
            *(void *)v133 = 0;
            int v72 = -[VCPCNNPoseEstimator detectPoseForFace:inBuffer:yaw:](self->_poseEstimator, "detectPoseForFace:inBuffer:yaw:", a3, v133, x, y, v69, v70);
            int v73 = v110;
            if (v72) {
              int v73 = v72;
            }
            int v110 = v73;
            if (v72)
            {
              LODWORD(v20) = 4;
            }
            else
            {
              v96 = objc_alloc_init(VCPFace);
              [(VCPFace *)v96 setSmile:v116];
              [(VCPFace *)v96 setYaw:*(void *)v133];
              -[VCPFace setBounds:](v96, "setBounds:", x, y, v69, v70);
              LODWORD(v74) = 1.0;
              [(VCPFace *)v96 setConfidence:v74];
              [(VCPFace *)v96 setObservation:v64];
              [v105 addObject:v96];
              v75 = [v64 groupId];
              if (v75)
              {
                v76 = [v64 groupId];
                v77 = [v47 objectForKeyedSubscript:v76];
                BOOL v78 = v77 == 0;

                if (!v78)
                {
                  v79 = [v64 groupId];
                  v80 = [v47 objectForKeyedSubscript:v79];
                  v81 = [v80 torsoprint];
                  [v64 setTorsoprint:v81];

                  v82 = [v64 groupId];
                  v83 = [v47 objectForKeyedSubscript:v82];
                  [v83 boundingBox];
                  -[VCPFace setTorsoBounds:](v96, "setTorsoBounds:");

                  v84 = [v64 groupId];
                  [v47 removeObjectForKey:v84];
                }
              }

              LODWORD(v20) = 0;
            }
          }
          if (v20) {
            break;
          }
          if (v58 == ++v63)
          {
            uint64_t v58 = [v57 countByEnumeratingWithState:&v118 objects:v134 count:16];
            if (v58) {
              goto LABEL_62;
            }
            goto LABEL_85;
          }
        }
      }
      else
      {
        int v110 = 0;
LABEL_85:

        long long v114 = 0u;
        long long v115 = 0u;
        long long v112 = 0u;
        long long v113 = 0u;
        id v57 = v47;
        uint64_t v20 = [v57 countByEnumeratingWithState:&v112 objects:v132 count:16];
        if (v20)
        {
          uint64_t v85 = *(void *)v113;
          do
          {
            for (uint64_t j = 0; j != v20; ++j)
            {
              if (*(void *)v113 != v85) {
                objc_enumerationMutation(v57);
              }
              uint64_t v87 = *(void *)(*((void *)&v112 + 1) + 8 * j);
              v88 = (void *)MEMORY[0x1C186D320]();
              v89 = [v57 objectForKeyedSubscript:v87];
              v90 = objc_alloc_init(VCPHuman);
              v91 = [v89 torsoprint];
              [(VCPHuman *)v90 setTorsoprint:v91];

              [v89 boundingBox];
              -[VCPHuman setBounds:](v90, "setBounds:");
              [v111 addObject:v90];
            }
            uint64_t v20 = [v57 countByEnumeratingWithState:&v112 objects:v132 count:16];
          }
          while (v20);
        }
      }
    }
    else
    {
      int v110 = -18;
      LODWORD(v20) = 4;
    }
    id v19 = v95;
    goto LABEL_94;
  }
  id v130 = 0;
  uint64_t v21 = objc_opt_class();
  if (_os_feature_enabled_impl()) {
    uint64_t v22 = 15;
  }
  else {
    uint64_t v22 = 11;
  }
  int v23 = +[VCPFaceUtils configureVNRequest:&v130 withClass:v21 andProcessingVersion:v22];
  id v24 = v130;
  id v25 = v24;
  int v110 = v23;
  if (!v23)
  {
    if (v24) {
      [v109 addObject:v24];
    }
    goto LABEL_18;
  }
  v99 = v24;
  id v19 = 0;
LABEL_31:
  LODWORD(v20) = 4;
LABEL_96:

LABEL_97:
  if (v20 != 4) {
    [v108 setFrameProcessedByFaceDetector:1];
  }
  if (v110 && (int)MediaAnalysisLogLevel() >= 3)
  {
    v92 = VCPLogInstance();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&buf[4] = v19;
      _os_log_impl(&dword_1BBEDA000, v92, OS_LOG_TYPE_ERROR, "[VCPVideoFullFaceDetector] Failed to detect faces - %@", buf, 0xCu);
    }
  }
  return v110;
}

- (float)minProcessTimeIntervalInSecs
{
  return 1.0;
}

- (void)removeSmallestKeyFace
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__1;
  objc_super v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  int v6 = 2139095039;
  keyFaces = self->_keyFaces;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__VCPVideoFullFaceDetector_removeSmallestKeyFace__block_invoke;
  v4[3] = &unk_1E6297260;
  v4[4] = v5;
  v4[5] = &v7;
  [(NSMutableDictionary *)keyFaces enumerateKeysAndObjectsUsingBlock:v4];
  if (v8[5]) {
    -[NSMutableDictionary removeObjectForKey:](self->_keyFaces, "removeObjectForKey:");
  }
  _Block_object_dispose(v5, 8);
  _Block_object_dispose(&v7, 8);
}

void __49__VCPVideoFullFaceDetector_removeSmallestKeyFace__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v6 = a3;
  [v6 bounds];
  double v8 = v7;
  [v6 bounds];
  float v10 = v8 * v9;
  if (*(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) > v10)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v10;
  }
}

- (BOOL)compareFace:(id)a3 withFace:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = v6;
  BOOL v8 = 0;
  if (v5 && v6)
  {
    uint64_t v9 = [v5 yaw];
    if (v9 == [v7 yaw])
    {
      [v5 bounds];
      double v11 = v10;
      [v5 bounds];
      double v13 = v12;
      [v7 bounds];
      double v15 = v14;
      [v7 bounds];
      BOOL v8 = v11 * v13 < v15 * v16;
    }
    else
    {
      BOOL v8 = fabs((double)([v5 yaw] - 2)) > fabs((double)(objc_msgSend(v7, "yaw") - 2));
    }
  }

  return v8;
}

- (BOOL)locationChange:(CGRect)a3 relativeTo:(CGRect)a4 landscape:(BOOL)a5
{
  return a5 && vabdd_f64(a3.origin.x + a3.size.width * 0.5, a4.origin.x + a4.size.width * 0.5) > 0.25;
}

- (int)detectTrackFacesInFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 faces:(id)a5 torsos:(id)a6 frameStats:(id)a7
{
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  id v90 = a5;
  id v10 = a6;
  id v97 = a7;
  v86 = v10;
  v88 = [MEMORY[0x1E4F1CA48] array];
  double v11 = [MEMORY[0x1E4F1CA48] array];
  faceTrackers = self->_faceTrackers;
  v116[0] = MEMORY[0x1E4F143A8];
  v116[1] = 3221225472;
  v116[2] = __90__VCPVideoFullFaceDetector_detectTrackFacesInFrame_withTimestamp_faces_torsos_frameStats___block_invoke;
  v116[3] = &unk_1E6297288;
  long long v120 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  long long v119 = a3;
  int64_t v121 = var3;
  id v14 = v11;
  id v117 = v14;
  id v92 = v88;
  id v118 = v92;
  uint64_t v87 = v14;
  [(NSMutableDictionary *)faceTrackers enumerateKeysAndObjectsUsingBlock:v116];
  [(NSMutableDictionary *)self->_faceTrackers removeObjectsForKeys:v14];
  int64_t v15 = a4->var3;
  *(_OWORD *)(&self->_latestFrameArea + 1) = *(_OWORD *)&a4->var0;
  *(void *)&self->_timeLastTracking.flags = v15;
  CMTime lhs = *(CMTime *)a4;
  *(_OWORD *)&rhs.value = *(_OWORD *)(&self->super._angle + 1);
  rhs.epoch = *(void *)&self->super._timeLastDetection.flags;
  CMTimeSubtract(&time, &lhs, &rhs);
  double Seconds = CMTimeGetSeconds(&time);
  [(VCPVideoFullFaceDetector *)self minProcessTimeIntervalInSecs];
  if (Seconds < v17)
  {
    [v90 addObjectsFromArray:v92];
    int v18 = 0;
    goto LABEL_45;
  }
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
  int v18 = [(VCPVideoFullFaceDetector *)self detectFaces:a3 faces:v90 torsos:v10 frameStats:v97];
  if (v18) {
    goto LABEL_45;
  }
  uint64_t v85 = &self->super._angle + 1;
  v89 = a3;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  obuint64_t j = v90;
  uint64_t v21 = [obj countByEnumeratingWithState:&v111 objects:v126 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v112;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v112 != v22) {
          objc_enumerationMutation(obj);
        }
        id v24 = *(void **)(*((void *)&v111 + 1) + 8 * i);
        id v25 = (void *)MEMORY[0x1C186D320]();
        char v26 = objc_alloc_init(VCPFace);
        v108[1] = 0;
        v108[2] = 0;
        long long v109 = xmmword_1BC280F00;
        v108[0] = 0x3FF0000000000000;
        uint64_t v110 = 0x3FF0000000000000;
        [v24 faceBoundsWithTransform:WidthOfPlane height:HeightOfPlane transform:v108];
        -[VCPFace setBounds:](v26, "setBounds:");
        v27 = [v97 detectedFaces];
        [v27 addObject:v26];
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v111 objects:v126 count:16];
    }
    while (v21);
  }

  uint64_t v28 = [MEMORY[0x1E4F1CA48] arrayWithArray:self->_reservedIDs];
  [(NSMutableArray *)self->_reservedIDs removeAllObjects];
  [obj sortUsingComparator:&__block_literal_global_5];
  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  v29 = [obj reverseObjectEnumerator];
  v96 = v29;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v104 objects:v125 count:16];
  if (v30)
  {
    id obja = *(id *)v105;
LABEL_13:
    uint64_t v31 = 0;
    while (1)
    {
      if (*(id *)v105 != obja) {
        objc_enumerationMutation(v29);
      }
      v32 = *(void **)(*((void *)&v104 + 1) + 8 * v31);
      long long v100 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      id v33 = v92;
      uint64_t v34 = [v33 countByEnumeratingWithState:&v100 objects:v124 count:16];
      if (!v34) {
        break;
      }
      int v35 = 0;
      uint64_t v36 = *(void *)v101;
      float v37 = 0.0;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v101 != v36) {
            objc_enumerationMutation(v33);
          }
          int v39 = *(void **)(*((void *)&v100 + 1) + 8 * j);
          objc_msgSend(v32, "bounds", v85);
          CGFloat v41 = v40;
          CGFloat v43 = v42;
          CGFloat v45 = v44;
          CGFloat v47 = v46;
          [v39 bounds];
          v132.origin.double x = v48;
          v132.origin.double y = v49;
          v132.size.double width = v50;
          v132.size.double height = v51;
          v128.origin.double x = v41;
          v128.origin.double y = v43;
          v128.size.double width = v45;
          v128.size.double height = v47;
          CGRect v129 = CGRectIntersection(v128, v132);
          double width = v129.size.width;
          double height = v129.size.height;
          objc_msgSend(v32, "bounds", v129.origin.x, v129.origin.y);
          CGFloat v55 = v54;
          CGFloat v57 = v56;
          CGFloat v59 = v58;
          CGFloat v61 = v60;
          [v39 bounds];
          v133.origin.double x = v62;
          v133.origin.double y = v63;
          v133.size.double width = v64;
          v133.size.double height = v65;
          v130.origin.double x = v55;
          v130.origin.double y = v57;
          v130.size.double width = v59;
          v130.size.double height = v61;
          CGRect v131 = CGRectUnion(v130, v133);
          float v66 = width * height / (v131.size.width * v131.size.height);
          if (v37 < v66)
          {
            id v67 = v39;

            float v37 = v66;
            int v35 = v67;
          }
        }
        uint64_t v34 = [v33 countByEnumeratingWithState:&v100 objects:v124 count:16];
      }
      while (v34);

      if (!v35 || v37 <= 0.05) {
        goto LABEL_32;
      }
      objc_msgSend(v32, "setTrackID:", objc_msgSend(v35, "trackID"));
      v68 = self->_faceTrackers;
      double v69 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v32, "trackID"));
      [(NSMutableDictionary *)v68 removeObjectForKey:v69];

      [v33 removeObject:v35];
      keyFaces = self->_keyFaces;
      int v71 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v32, "trackID"));
      int v72 = [(NSMutableDictionary *)keyFaces objectForKeyedSubscript:v71];

      if (v72 && [(VCPVideoFullFaceDetector *)self compareFace:v72 withFace:v32])
      {
        int v73 = self->_keyFaces;
        double v74 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v32, "trackID"));
        [(NSMutableDictionary *)v73 setObject:v32 forKey:v74];
      }
LABEL_36:
      if ((unint64_t)[(NSMutableDictionary *)self->_faceTrackers count] > 4)
      {
        reservedIDs = self->_reservedIDs;
        objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v32, "trackID"));
        v79 = (VCPVideoObjectTracker *)objc_claimAutoreleasedReturnValue();
        [(NSMutableArray *)reservedIDs addObject:v79];
      }
      else
      {
        BOOL v78 = [VCPVideoObjectTracker alloc];
        [v32 bounds];
        long long v98 = *(_OWORD *)&a4->var0;
        int64_t v99 = a4->var3;
        v79 = -[VCPVideoObjectTracker initWithObjectBounds:inFrame:timestamp:](v78, "initWithObjectBounds:inFrame:timestamp:", v89, &v98);
        if (!v79)
        {

          int v18 = -108;
          goto LABEL_44;
        }
        v80 = self->_faceTrackers;
        v81 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v32, "trackID"));
        [(NSMutableDictionary *)v80 setObject:v79 forKey:v81];
      }
      ++v31;
      v29 = v96;
      if (v31 == v30)
      {
        uint64_t v30 = [v96 countByEnumeratingWithState:&v104 objects:v125 count:16];
        if (v30) {
          goto LABEL_13;
        }
        goto LABEL_42;
      }
    }

    int v35 = 0;
LABEL_32:
    if (objc_msgSend(v28, "count", v85))
    {
      v75 = [v28 objectAtIndexedSubscript:0];
      objc_msgSend(v32, "setTrackID:", objc_msgSend(v75, "intValue"));

      [v28 removeObjectAtIndex:0];
    }
    else
    {
      ++self->_latestTrackID;
      objc_msgSend(v32, "setTrackID:");
      v76 = self->_keyFaces;
      v77 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v32, "trackID"));
      [(NSMutableDictionary *)v76 setObject:v32 forKey:v77];

      if ((unint64_t)[(NSMutableDictionary *)self->_keyFaces count] >= 0x1F) {
        [(VCPVideoFullFaceDetector *)self removeSmallestKeyFace];
      }
    }
    goto LABEL_36;
  }
LABEL_42:

  int v18 = 0;
  long long v83 = *(_OWORD *)&a4->var0;
  *((void *)v85 + 2) = a4->var3;
  *(_OWORD *)uint64_t v85 = v83;
LABEL_44:

LABEL_45:
  return v18;
}

void __90__VCPVideoFullFaceDetector_detectTrackFacesInFrame_withTimestamp_faces_torsos_frameStats___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [v6 trackObjectInFrame:*(void *)(a1 + 48)];
  [v6 objectBounds];
  if (CGRectIsEmpty(v12)) {
    goto LABEL_6;
  }
  if (v6) {
    [v6 start];
  }
  else {
    memset(&v8, 0, sizeof(v8));
  }
  CMTime lhs = *(CMTime *)(a1 + 56);
  CMTime rhs = v8;
  CMTimeSubtract(&time, &lhs, &rhs);
  if (CMTimeGetSeconds(&time) > 5.0)
  {
LABEL_6:
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5, *(_OWORD *)&v8.value, v8.epoch);
  }
  else
  {
    double v7 = objc_alloc_init(VCPFace);
    [v6 objectBounds];
    -[VCPFace setBounds:](v7, "setBounds:");
    -[VCPFace setTrackID:](v7, "setTrackID:", [v5 intValue]);
    [*(id *)(a1 + 40) addObject:v7];
  }
}

uint64_t __90__VCPVideoFullFaceDetector_detectTrackFacesInFrame_withTimestamp_faces_torsos_frameStats___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 bounds];
  double v7 = v6;
  [v4 bounds];
  double v9 = v8;
  [v5 bounds];
  double v11 = v10;
  [v5 bounds];
  float v12 = v7 * v9;
  float v14 = v11 * v13;
  if (v12 < v14) {
    uint64_t v15 = -1;
  }
  else {
    uint64_t v15 = v12 > v14;
  }

  return v15;
}

- (int)analyzeFrame:(__CVBuffer *)a3 timestamp:(id *)a4 duration:(id *)a5 frameStats:(id)a6 flags:(unint64_t *)a7
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v69 = a6;
  if (!self->super._results)
  {
    BOOL v78 = (CMTime *)a4;
    double v70 = (CMTime *)a5;
    int v72 = a7;
    if (CVPixelBufferGetPixelFormatType(a3) != 875704438 && CVPixelBufferGetPixelFormatType(a3) != 875704422)
    {
      int v12 = -50;
      goto LABEL_3;
    }
    double v13 = [v69 detectedFaces];
    [v13 removeAllObjects];

    [v69 setFrameProcessedByFaceDetector:0];
    lhs.origin = *(CGPoint *)&a4->var0;
    *(void *)&lhs.size.double width = a4->var3;
    CMTime rhs = *(CMTime *)(&self->_latestFrameArea + 1);
    CMTimeSubtract(&time, (CMTime *)&lhs, &rhs);
    if (CMTimeGetSeconds(&time) < 0.0599999987)
    {
      lhs.origin = *(CGPoint *)&a4->var0;
      *(void *)&lhs.size.double width = a4->var3;
      CMTime rhs = *(CMTime *)(&self->super._angle + 1);
      CMTimeSubtract(&v107, (CMTime *)&lhs, &rhs);
      double Seconds = CMTimeGetSeconds(&v107);
      [(VCPVideoFullFaceDetector *)self minProcessTimeIntervalInSecs];
      double v16 = v15;
      if (Seconds < v16)
      {
        *(float *)&double v16 = self->_latestFrameArea;
        [v69 setFaceArea:v16];
        int v68 = 0;
        goto LABEL_66;
      }
    }
    frameFaceResults = self->_frameFaceResults;
    if (frameFaceResults) {
      frameFaceResults = (NSMutableArray *)[(NSMutableArray *)frameFaceResults removeAllObjects];
    }
    context = (void *)MEMORY[0x1C186D320](frameFaceResults);
    id v67 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
    long long v105 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    float v66 = (void *)v18;
    int v68 = -[VCPVideoFullFaceDetector detectTrackFacesInFrame:withTimestamp:faces:torsos:frameStats:](self, "detectTrackFacesInFrame:withTimestamp:faces:torsos:frameStats:", a3, &v105, v67);
    if (!v68)
    {
      long long v103 = 0u;
      long long v104 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      id v19 = v66;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v101 objects:v116 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v102;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v102 != v21) {
              objc_enumerationMutation(v19);
            }
            int v23 = *(void **)(*((void *)&v101 + 1) + 8 * i);
            CMTime start = *v78;
            [(VCPVideoFullFaceDetector *)self minProcessTimeIntervalInSecs];
            CMTimeMake(&duration, (uint64_t)(float)(v24 * 1000.0), 1000);
            CMTimeRangeMake(&v100, &start, &duration);
            CMTimeRange v97 = v100;
            [v23 setTimerange:&v97];
            [(NSMutableArray *)self->_allTorsos addObject:v23];
          }
          uint64_t v20 = [v19 countByEnumeratingWithState:&v101 objects:v116 count:16];
        }
        while (v20);
      }

      float v26 = 0.0;
      if (v67 && [v67 count])
      {
        size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
        size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
        int angle = self->super._angle;
        if (angle) {
          BOOL v30 = angle == 180;
        }
        else {
          BOOL v30 = 1;
        }
        int v31 = v30;
        unsigned int v76 = v31;
        *v72 |= 0x20uLL;
        long long v93 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        obuint64_t j = v67;
        uint64_t v32 = [obj countByEnumeratingWithState:&v93 objects:v115 count:16];
        if (v32)
        {
          size_t v73 = HeightOfPlane;
          size_t v74 = WidthOfPlane;
          uint64_t v75 = *(void *)v94;
          do
          {
            uint64_t v77 = v32;
            for (uint64_t j = 0; j != v77; ++j)
            {
              if (*(void *)v94 != v75) {
                objc_enumerationMutation(obj);
              }
              uint64_t v34 = *(void **)(*((void *)&v93 + 1) + 8 * j);
              uint64_t v35 = [v34 flagsForOrientation:v76 width:v74 height:v73];
              v89[1] = 0;
              v89[2] = 0;
              memset(&lhs, 0, sizeof(lhs));
              v89[0] = 0x3FF0000000000000;
              long long v90 = xmmword_1BC280F00;
              uint64_t v91 = 0x3FF0000000000000;
              [v34 faceBoundsWithTransform:v74 height:v73 transform:v89];
              lhs.origin.CGFloat x = v36;
              lhs.origin.double y = v37;
              lhs.size.double width = v38;
              lhs.size.double height = v39;
              uint64_t v40 = MediaAnalysisFacePosition(&lhs);
              double width = lhs.size.width;
              double height = lhs.size.height;
              activeFaces = self->super._activeFaces;
              double v44 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v34, "trackID"));
              CGFloat v45 = [(NSMutableDictionary *)activeFaces objectForKey:v44];

              [v34 confidence];
              if (v46 <= 0.4)
              {
                faceTrackers = self->_faceTrackers;
                CGFloat v48 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v34, "trackID"));
                CGFloat v49 = [(NSMutableDictionary *)faceTrackers objectForKeyedSubscript:v48];

                if (!v49) {
                  goto LABEL_60;
                }
                [v49 start];
                CMTime rhs = *v78;
                CMTime v109 = v87;
                CMTimeSubtract(&v88, &rhs, &v109);
                if (CMTimeGetSeconds(&v88) >= 1.0) {
                  goto LABEL_60;
                }
              }
              if (v45
                && ([v45 last],
                    [v45 start],
                    CMTime rhs = v87,
                    CMTime v109 = v85,
                    CMTimeSubtract(&v86, &rhs, &v109),
                    CMTimeGetSeconds(&v86) <= 1.0))
              {
                long long v79 = *(_OWORD *)&v78->value;
                CMTimeEpoch epoch = v78->epoch;
                [v45 setLast:&v79];
                objc_msgSend(v45, "setFlags:", objc_msgSend(v45, "flags") | v35);
                objc_msgSend(v45, "setPosition:", objc_msgSend(v45, "position") | v40);
              }
              else
              {
                CGFloat v50 = objc_alloc_init(VCPFaceDetectionRange);
                long long v83 = *(_OWORD *)&v78->value;
                CMTimeEpoch v84 = v78->epoch;
                [(VCPFaceDetectionRange *)v50 setStart:&v83];
                CMTime rhs = *v78;
                CMTime v109 = *v70;
                CMTimeAdd(&v82, &rhs, &v109);
                CMTime v81 = v82;
                [(VCPFaceDetectionRange *)v50 setLast:&v81];
                [(VCPFaceDetectionRange *)v50 setFlags:v35];
                -[VCPFaceDetectionRange setBounds:](v50, "setBounds:", lhs.origin.x, lhs.origin.y, lhs.size.width, lhs.size.height);
                [v34 torsoBounds];
                -[VCPFaceDetectionRange setTorsoBounds:](v50, "setTorsoBounds:");
                [(VCPFaceDetectionRange *)v50 setPosition:v40];
                -[VCPFaceDetectionRange setFaceID:](v50, "setFaceID:", (int)[v34 trackID]);
                CGFloat v51 = self->super._activeFaces;
                v52 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v34, "trackID"));
                [(NSMutableDictionary *)v51 setObject:v50 forKey:v52];

                [(NSMutableArray *)self->_allFaces addObject:v50];
              }
              *v72 |= v35;
              if (self->_frameFaceResults)
              {
                v113[0] = @"facePosition";
                uint64_t v53 = [NSNumber numberWithInteger:v40];
                double v54 = (void *)v53;
                if (lhs.origin.x < 1.0) {
                  CGFloat x = lhs.origin.x;
                }
                else {
                  CGFloat x = 1.0;
                }
                if (lhs.origin.x <= 0.0) {
                  CGFloat x = 0.0;
                }
                if (lhs.origin.y < 1.0) {
                  double y = lhs.origin.y;
                }
                else {
                  double y = 1.0;
                }
                if (lhs.origin.y <= 0.0) {
                  double y = 0.0;
                }
                double v57 = 1.0 - lhs.origin.x;
                if (lhs.size.width < 1.0 - lhs.origin.x) {
                  double v57 = lhs.size.width;
                }
                v114[0] = v53;
                v113[1] = @"faceBounds";
                if (lhs.size.width <= 0.0) {
                  double v57 = 0.0;
                }
                double v58 = 1.0 - lhs.origin.y;
                if (lhs.size.height < 1.0 - lhs.origin.y) {
                  double v58 = lhs.size.height;
                }
                if (lhs.size.height <= 0.0) {
                  double v58 = 0.0;
                }
                CGFloat v59 = NSStringFromRect(*(NSRect *)&x);
                v114[1] = v59;
                v113[2] = @"facePoseYaw";
                double v60 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v34, "yaw"));
                v114[2] = v60;
                CGFloat v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v114 forKeys:v113 count:3];

                CGFloat v61 = self->_frameFaceResults;
                v111[0] = @"flags";
                CGFloat v62 = [NSNumber numberWithUnsignedLongLong:v35];
                v111[1] = @"attributes";
                v112[0] = v62;
                v112[1] = v49;
                CGFloat v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v112 forKeys:v111 count:2];
                [(NSMutableArray *)v61 addObject:v63];

LABEL_60:
              }

              float v26 = v26 + width * height;
            }
            uint64_t v32 = [obj countByEnumeratingWithState:&v93 objects:v115 count:16];
          }
          while (v32);
        }
      }
      *(float *)&double v25 = v26;
      [v69 setFaceArea:v25];
      self->_latestFrameArea = v26;
    }

    goto LABEL_66;
  }
  int v12 = -18;
LABEL_3:
  int v68 = v12;
LABEL_66:

  return v68;
}

- (id)frameFaceResults
{
  v6[1] = *MEMORY[0x1E4F143B8];
  frameFaceResults = self->_frameFaceResults;
  id v5 = @"FaceResults";
  v6[0] = frameFaceResults;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (int)clusterFaces
{
  uint64_t v235 = *MEMORY[0x1E4F143B8];
  uint64_t v212 = 0;
  v213 = &v212;
  uint64_t v214 = 0x2020000000;
  uint64_t v215 = 0;
  uint64_t v206 = 0;
  v207 = &v206;
  uint64_t v208 = 0x3032000000;
  v209 = __Block_byref_object_copy__1;
  v210 = __Block_byref_object_dispose__1;
  id v211 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v202 = 0;
  v203 = &v202;
  uint64_t v204 = 0x2020000000;
  keyFaces = self->_keyFaces;
  int v205 = 0;
  v201[0] = MEMORY[0x1E4F143A8];
  v201[1] = 3221225472;
  v201[2] = __40__VCPVideoFullFaceDetector_clusterFaces__block_invoke;
  v201[3] = &unk_1E62972D0;
  v201[4] = &v202;
  v201[5] = &v206;
  v201[6] = &v212;
  [(NSMutableDictionary *)keyFaces enumerateKeysAndObjectsUsingBlock:v201];
  long long v199 = 0u;
  long long v200 = 0u;
  long long v197 = 0u;
  long long v198 = 0u;
  id v4 = self->_existingFaceprints;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v197 objects:v230 count:16];
  v152 = self;
  int v6 = 0;
  if (v5)
  {
    uint64_t v7 = *(void *)v198;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v198 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = [*(id *)(*((void *)&v197 + 1) + 8 * i) objectForKeyedSubscript:@"attributes"];
        double v10 = [v9 objectForKeyedSubscript:@"faceId"];

        int v11 = [v10 intValue];
        if (v11 > v6) {
          int v6 = v11;
        }
      }
      uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v197 objects:v230 count:16];
    }
    while (v5);
  }

  LODWORD(v12) = v6 + 1;
  if ((unint64_t)[(NSMutableDictionary *)self->_keyFaces count] < 2)
  {
    if ([(NSMutableDictionary *)self->_keyFaces count] == 1)
    {
      long long v155 = 0u;
      long long v156 = 0u;
      long long v153 = 0u;
      long long v154 = 0u;
      uint64_t v35 = self->_allFaces;
      uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v153 objects:v220 count:16];
      if (v36)
      {
        uint64_t v37 = *(void *)v154;
        do
        {
          for (uint64_t j = 0; j != v36; ++j)
          {
            if (*(void *)v154 != v37) {
              objc_enumerationMutation(v35);
            }
            [*(id *)(*((void *)&v153 + 1) + 8 * j) setFaceID:(int)v12];
          }
          uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v153 objects:v220 count:16];
        }
        while (v36);
      }

      CGFloat v39 = [(id)v207[5] objectAtIndexedSubscript:0];
      uint64_t v40 = v39;
      if (v39)
      {
        CGFloat v41 = [v39 faceprint];
        BOOL v42 = v41 == 0;

        if (!v42)
        {
          facePrints = self->_facePrints;
          double v44 = [NSNumber numberWithInt:(v6 + 1)];
          [(NSMutableDictionary *)facePrints setObject:v40 forKey:v44];
        }
      }
    }
    goto LABEL_166;
  }
  context = (void *)MEMORY[0x1C186D320]();
  if (_os_feature_enabled_impl())
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      double v13 = VCPLogInstance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_INFO, "VideoFullFaceDetector - use VU for in-asset face clustering", (uint8_t *)&buf, 2u);
      }
    }
    int v14 = *((_DWORD *)v203 + 6);
    long long v193 = 0u;
    long long v194 = 0u;
    long long v195 = 0u;
    long long v196 = 0u;
    float v15 = self->_allTorsos;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v193 objects:v229 count:16];
    if (v16)
    {
      int v17 = v14 + 1;
      uint64_t v18 = *(void *)v194;
      do
      {
        for (uint64_t k = 0; k != v16; ++k)
        {
          if (*(void *)v194 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void **)(*((void *)&v193 + 1) + 8 * k);
          uint64_t v21 = [v20 torsoprint];
          BOOL v22 = v21 == 0;

          if (!v22)
          {
            id v23 = objc_alloc_init(MEMORY[0x1E4F457F8]);
            float v24 = [v20 torsoprint];
            [v23 setTorsoprint:v24];

            [v23 setFaceId:v17];
            objc_msgSend(v20, "setHumanID:", objc_msgSend(v23, "faceId"));
            [(id)v207[5] addObject:v23];

            ++v17;
          }
        }
        uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v193 objects:v229 count:16];
      }
      while (v16);
    }

    uint64_t v216 = 0;
    v217 = &v216;
    uint64_t v218 = 0x2050000000;
    double v25 = (void *)getGDVUContextClass(void)::softClass;
    uint64_t v219 = getGDVUContextClass(void)::softClass;
    if (!getGDVUContextClass(void)::softClass)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v232 = ___ZL19getGDVUContextClassv_block_invoke;
      v233 = &unk_1E62970F8;
      v234 = &v216;
      ___ZL19getGDVUContextClassv_block_invoke((uint64_t)&buf);
      double v25 = (void *)v217[3];
    }
    float v26 = v25;
    _Block_object_dispose(&v216, 8);
    id v136 = objc_alloc_init(v26);
    id v27 = objc_alloc_init(MEMORY[0x1E4F29128]);
    [v136 setMoment:v27];

    gallerdouble y = v152->_gallery;
    uint64_t v29 = v207[5];
    id v192 = 0;
    BOOL v30 = [(GDVUStreamingGallery *)gallery addWithObservations:v29 observationIdentifiers:0 trackIdentifiers:0 context:v136 error:&v192];
    id v133 = v192;
    id v148 = v30;
    uint64_t v31 = [v30 count];
    if (v31 != [(id)v207[5] count])
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v77 = 1;
        goto LABEL_163;
      }
      log = VCPLogInstance();
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        id v75 = [v133 description];
        uint64_t v76 = [v75 UTF8String];
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = v76;
        _os_log_impl(&dword_1BBEDA000, log, OS_LOG_TYPE_ERROR, "Gallery failed to add observation %s", (uint8_t *)&buf, 0xCu);
      }
      int v77 = 1;
LABEL_162:

LABEL_163:
      int v73 = -18;
      if (v77) {
        goto LABEL_164;
      }
      goto LABEL_157;
    }
    log = [MEMORY[0x1E4F1CA60] dictionary];
    for (uint64_t m = 0; m < (int)[(id)v207[5] count]; ++m)
    {
      id v33 = [(id)v207[5] objectAtIndexedSubscript:m];
      uint64_t v34 = [v148 objectAtIndexedSubscript:m];
      [log setObject:v33 forKeyedSubscript:v34];
    }
    BOOL v78 = v152->_gallery;
    id v191 = 0;
    CGRect v132 = [(GDVUStreamingGallery *)v78 updateWithMaxKeyFacesPerCluster:1 sortBy:&unk_1F15EDED8 error:&v191];
    id v133 = v191;
    uint64_t v79 = [v132 count];
    BOOL v80 = v79 == [(id)v207[5] count] && v133 == 0;
    if (!v80)
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v77 = 1;
      }
      else
      {
        CMTime v81 = VCPLogInstance();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
        {
          id v82 = [v133 description];
          uint64_t v83 = [v82 UTF8String];
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = v83;
          _os_log_impl(&dword_1BBEDA000, v81, OS_LOG_TYPE_ERROR, "Gallery failed to cluster %s", (uint8_t *)&buf, 0xCu);
        }
        int v77 = 1;
LABEL_160:
      }
      goto LABEL_162;
    }
    CMTime v86 = [MEMORY[0x1E4F1CA80] set];
    long long v189 = 0u;
    long long v190 = 0u;
    long long v187 = 0u;
    long long v188 = 0u;
    id v87 = v132;
    uint64_t v88 = [v87 countByEnumeratingWithState:&v187 objects:v228 count:16];
    id v139 = v87;
    if (v88)
    {
      uint64_t v89 = *(void *)v188;
      do
      {
        for (uint64_t n = 0; n != v88; ++n)
        {
          if (*(void *)v188 != v89) {
            objc_enumerationMutation(v87);
          }
          uint64_t v91 = [*(id *)(*((void *)&v187 + 1) + 8 * n) entityIdentifier];
          id v92 = [v91 stringValue];
          [v86 addObject:v92];
        }
        uint64_t v88 = [v87 countByEnumeratingWithState:&v187 objects:v228 count:16];
      }
      while (v88);
    }

    long long v185 = 0u;
    long long v186 = 0u;
    long long v183 = 0u;
    long long v184 = 0u;
    CGRect v130 = v86;
    uint64_t v93 = [v130 countByEnumeratingWithState:&v183 objects:v227 count:16];
    if (!v93)
    {
      int v77 = 0;
      goto LABEL_159;
    }
    uint64_t v94 = *(void *)v184;
    uint64_t v123 = *(void *)v184;
LABEL_101:
    uint64_t v95 = 0;
    uint64_t v12 = (int)v12;
    uint64_t v125 = v93;
    while (1)
    {
      if (*(void *)v184 != v94) {
        objc_enumerationMutation(v130);
      }
      v147 = *(void **)(*((void *)&v183 + 1) + 8 * v95);
      long long v179 = 0u;
      long long v180 = 0u;
      long long v181 = 0u;
      long long v182 = 0u;
      id v143 = v87;
      uint64_t v96 = [v143 countByEnumeratingWithState:&v179 objects:v226 count:16];
      uint64_t v127 = v95;
      if (v96) {
        break;
      }
LABEL_140:

      ++v12;
      uint64_t v95 = v127 + 1;
      uint64_t v94 = v123;
      if (v127 + 1 == v125)
      {
        uint64_t v93 = [v130 countByEnumeratingWithState:&v183 objects:v227 count:16];
        int v77 = 0;
        if (!v93)
        {
LABEL_159:

          CMTime v81 = v130;
          goto LABEL_160;
        }
        goto LABEL_101;
      }
    }
    uint64_t v146 = *(void *)v180;
LABEL_106:
    uint64_t v97 = 0;
    id v141 = (id)v96;
    while (1)
    {
      if (*(void *)v180 != v146) {
        objc_enumerationMutation(v143);
      }
      long long v98 = *(void **)(*((void *)&v179 + 1) + 8 * v97);
      int64_t v99 = objc_msgSend(v98, "entityIdentifier", v123);
      CMTimeRange v100 = [v99 stringValue];
      char v101 = [v147 isEqualToString:v100];

      if ((v101 & 1) == 0) {
        goto LABEL_134;
      }
      long long v102 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v98, "observationIdentifier"));
      long long v103 = [log objectForKeyedSubscript:v102];

      if (!v103)
      {

        int v77 = 1;
        goto LABEL_159;
      }
      if ([v98 isKeyFace])
      {
        long long v104 = [v103 faceprint];
        BOOL v105 = v104 == 0;

        if (v105)
        {
          if ((int)MediaAnalysisLogLevel() < 4) {
            goto LABEL_115;
          }
          CMTime v107 = VCPLogInstance();
          if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_1BBEDA000, v107, OS_LOG_TYPE_DEFAULT, "FullFaceDetector : cluster keyface does not contain faceprint", (uint8_t *)&buf, 2u);
          }
        }
        else
        {
          long long v106 = v152->_facePrints;
          CMTime v107 = [NSNumber numberWithInt:v12];
          [(NSMutableDictionary *)v106 setObject:v103 forKey:v107];
        }
      }
LABEL_115:
      long long v177 = 0u;
      long long v178 = 0u;
      long long v175 = 0u;
      long long v176 = 0u;
      id v108 = v152->_allFaces;
      uint64_t v109 = [(NSMutableArray *)v108 countByEnumeratingWithState:&v175 objects:v225 count:16];
      if (v109)
      {
        uint64_t v110 = *(void *)v176;
        do
        {
          for (iuint64_t i = 0; ii != v109; ++ii)
          {
            if (*(void *)v176 != v110) {
              objc_enumerationMutation(v108);
            }
            long long v112 = *(void **)(*((void *)&v175 + 1) + 8 * ii);
            uint64_t v113 = [v112 faceID];
            if (v113 == [v103 faceId]) {
              [v112 setFaceID:v12];
            }
          }
          uint64_t v109 = [(NSMutableArray *)v108 countByEnumeratingWithState:&v175 objects:v225 count:16];
        }
        while (v109);
      }

      long long v173 = 0u;
      long long v174 = 0u;
      long long v171 = 0u;
      long long v172 = 0u;
      long long v114 = v152->_allTorsos;
      uint64_t v115 = [(NSMutableArray *)v114 countByEnumeratingWithState:&v171 objects:v224 count:16];
      if (v115)
      {
        uint64_t v116 = *(void *)v172;
        do
        {
          for (juint64_t j = 0; jj != v115; ++jj)
          {
            if (*(void *)v172 != v116) {
              objc_enumerationMutation(v114);
            }
            id v118 = *(void **)(*((void *)&v171 + 1) + 8 * jj);
            int v119 = [v118 humanID];
            if ([v103 faceId] == v119) {
              [v118 setHumanID:v12];
            }
          }
          uint64_t v115 = [(NSMutableArray *)v114 countByEnumeratingWithState:&v171 objects:v224 count:16];
        }
        while (v115);
      }

      id v87 = v139;
      uint64_t v96 = (uint64_t)v141;

LABEL_134:
      if (++v97 == v96)
      {
        uint64_t v120 = [v143 countByEnumeratingWithState:&v179 objects:v226 count:16];
        uint64_t v96 = v120;
        if (!v120) {
          goto LABEL_140;
        }
        goto LABEL_106;
      }
    }
  }
  if (v213[3])
  {
    id v45 = objc_alloc(MEMORY[0x1E4F45710]);
    LODWORD(v46) = 1049750405;
    uint64_t v47 = [v45 initWithType:*MEMORY[0x1E4F45BA8] cachePath:@"/tmp/" state:0 threshold:v213[3] requestRevision:v46];
    id v170 = 0;
    uint64_t v137 = (void *)v47;
    CGFloat v48 = [MEMORY[0x1E4F45708] clustererBuilderWithOptions:v47 error:&v170];
    id v49 = v170;
    CGFloat v50 = v49;
    CGRect v138 = v48;
    if (v48)
    {
      uint64_t v51 = v207[5];
      id v169 = v49;
      v134 = objc_msgSend(v48, "vcp_updateModelByAddingFaces:error:", v51, &v169);
      id v129 = v169;

      if (v134)
      {
        long long v167 = 0u;
        long long v168 = 0u;
        long long v165 = 0u;
        long long v166 = 0u;
        obuint64_t j = v134;
        uint64_t v126 = [obj countByEnumeratingWithState:&v165 objects:v223 count:16];
        if (v126)
        {
          uint64_t v52 = *(void *)v166;
          uint64_t v124 = *(void *)v166;
          do
          {
            uint64_t v131 = 0;
            os_log_t loga = (os_log_t)(int)v12;
            do
            {
              BOOL v80 = *(void *)v166 == v52;
              uint64_t v53 = v152;
              if (!v80) {
                objc_enumerationMutation(obj);
              }
              double v54 = *(void **)(*((void *)&v165 + 1) + 8 * v131);
              long long v161 = 0u;
              long long v162 = 0u;
              long long v163 = 0u;
              long long v164 = 0u;
              id v140 = [v54 objects];
              uint64_t v144 = [v140 countByEnumeratingWithState:&v161 objects:v222 count:16];
              if (v144)
              {
                id v142 = *(id *)v162;
                do
                {
                  for (kuint64_t k = 0; kk != v144; ++kk)
                  {
                    if (*(id *)v162 != v142) {
                      objc_enumerationMutation(v140);
                    }
                    CGFloat v55 = *(void **)(*((void *)&v161 + 1) + 8 * kk);
                    long long v157 = 0u;
                    long long v158 = 0u;
                    long long v159 = 0u;
                    long long v160 = 0u;
                    v149 = v53->_allFaces;
                    double v56 = 0;
                    uint64_t v57 = [(NSMutableArray *)v149 countByEnumeratingWithState:&v157 objects:v221 count:16];
                    if (v57)
                    {
                      uint64_t v58 = *(void *)v158;
                      do
                      {
                        for (muint64_t m = 0; mm != v57; ++mm)
                        {
                          if (*(void *)v158 != v58) {
                            objc_enumerationMutation(v149);
                          }
                          double v60 = *(void **)(*((void *)&v157 + 1) + 8 * mm);
                          uint64_t v61 = [v60 faceID];
                          if (v61 == (int)[v55 intValue])
                          {
                            CGFloat v62 = v152->_keyFaces;
                            CGFloat v63 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v60, "faceID"));
                            CGFloat v64 = [(NSMutableDictionary *)v62 objectForKeyedSubscript:v63];

                            if (!v56
                              || [(VCPVideoFullFaceDetector *)v152 compareFace:v56 withFace:v64])
                            {
                              CGFloat v65 = [v64 observation];
                              float v66 = [v65 faceprint];
                              BOOL v67 = v66 == 0;

                              if (!v67)
                              {
                                int v68 = v152->_facePrints;
                                id v69 = [v64 observation];
                                double v70 = [NSNumber numberWithInt:loga];
                                [(NSMutableDictionary *)v68 setObject:v69 forKey:v70];

                                id v71 = v64;
                                double v56 = v71;
                              }
                            }
                            [v60 setFaceID:loga];
                          }
                        }
                        uint64_t v57 = [(NSMutableArray *)v149 countByEnumeratingWithState:&v157 objects:v221 count:16];
                      }
                      while (v57);
                    }

                    uint64_t v53 = v152;
                  }
                  uint64_t v144 = [v140 countByEnumeratingWithState:&v161 objects:v222 count:16];
                }
                while (v144);
              }

              os_log_t loga = (os_log_t)((char *)loga + 1);
              uint64_t v52 = v124;
              ++v131;
            }
            while (v131 != v126);
            LODWORD(v12) = loga;
            uint64_t v126 = [obj countByEnumeratingWithState:&v165 objects:v223 count:16];
          }
          while (v126);
        }

        int v72 = 0;
        int v73 = -18;
        size_t v74 = obj;
        CGFloat v50 = v129;
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          int64_t v121 = VCPLogInstance();
          if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v129;
            _os_log_impl(&dword_1BBEDA000, v121, OS_LOG_TYPE_ERROR, "Failed to cluster faces - %@", (uint8_t *)&buf, 0xCu);
          }
        }
        int v73 = -18;
        int v72 = 1;
        CGFloat v50 = v129;
        size_t v74 = 0;
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v73 = -108;
        int v72 = 1;
LABEL_156:

        if (v72)
        {
LABEL_164:
          char v85 = 0;
          goto LABEL_165;
        }
LABEL_157:
        char v85 = 1;
        goto LABEL_165;
      }
      size_t v74 = VCPLogInstance();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v50;
        _os_log_impl(&dword_1BBEDA000, v74, OS_LOG_TYPE_ERROR, "Failed to create Vision clusterer - %@", (uint8_t *)&buf, 0xCu);
      }
      int v73 = -108;
      int v72 = 1;
    }

    goto LABEL_156;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    CMTimeEpoch v84 = VCPLogInstance();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1BBEDA000, v84, OS_LOG_TYPE_ERROR, "Failed to retrieve faceprint revision from key faces", (uint8_t *)&buf, 2u);
    }
  }
  char v85 = 0;
  int v73 = -18;
LABEL_165:
  if (v85) {
LABEL_166:
  }
    int v73 = 0;
  _Block_object_dispose(&v202, 8);
  _Block_object_dispose(&v206, 8);

  _Block_object_dispose(&v212, 8);
  return v73;
}

void __40__VCPVideoFullFaceDetector_clusterFaces__block_invoke(void *a1, void *a2, void *a3)
{
  id v18 = a2;
  id v5 = a3;
  int v6 = [v5 observation];

  if (v6)
  {
    int v7 = [v18 intValue];
    double v8 = [v5 observation];
    [v8 setFaceId:v7];

    uint64_t v9 = *(void *)(a1[4] + 8);
    int v10 = [v18 intValue];
    int v11 = *(_DWORD *)(v9 + 24);
    if (v11 <= v10) {
      int v11 = v10;
    }
    *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = v11;
    uint64_t v12 = *(void **)(*(void *)(a1[5] + 8) + 40);
    double v13 = [v5 observation];
    [v12 addObject:v13];

    int v14 = [v5 observation];
    float v15 = [v14 faceprint];

    if (v15)
    {
      uint64_t v16 = [v5 observation];
      int v17 = [v16 faceprint];
      *(void *)(*(void *)(a1[6] + 8) + 24) = [v17 requestRevision];
    }
  }
}

- (int)updateWithExistingFaces
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionary];
  int v17 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = self->_existingFaceprints;
  uint64_t v2 = [(NSArray *)obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v31 != v3) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        int v6 = objc_msgSend(v5, "objectForKeyedSubscript:", @"attributes", v17);
        int v7 = [v6 objectForKeyedSubscript:@"faceId"];

        double v8 = [v5 objectForKeyedSubscript:@"attributes"];
        uint64_t v9 = [v8 objectForKeyedSubscript:@"facePrint"];

        if (v7) {
          BOOL v10 = v9 == 0;
        }
        else {
          BOOL v10 = 1;
        }
        if (v10) {
          goto LABEL_17;
        }
        int v11 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v9 error:0];
        uint64_t v12 = [v11 decodeObjectOfClass:objc_opt_class() forKey:@"facePrint"];
        if (!v12)
        {

LABEL_17:
          int v15 = -18;
          goto LABEL_18;
        }
        [v20 setObject:v12 forKeyedSubscript:v7];
      }
      uint64_t v2 = [(NSArray *)obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }

  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  int v29 = 0;
  facePrints = self->_facePrints;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __51__VCPVideoFullFaceDetector_updateWithExistingFaces__block_invoke;
  v22[3] = &unk_1E6297320;
  id v23 = v20;
  double v25 = &v26;
  id v14 = v17;
  id v24 = v14;
  [(NSMutableDictionary *)facePrints enumerateKeysAndObjectsUsingBlock:v22];
  int v15 = *((_DWORD *)v27 + 6);
  if (!v15)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __51__VCPVideoFullFaceDetector_updateWithExistingFaces__block_invoke_3;
    v21[3] = &unk_1E6297348;
    v21[4] = self;
    [v14 enumerateKeysAndObjectsUsingBlock:v21];
  }

  _Block_object_dispose(&v26, 8);
LABEL_18:

  return v15;
}

void __51__VCPVideoFullFaceDetector_updateWithExistingFaces__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v24 = 0;
  double v25 = (float *)&v24;
  uint64_t v26 = 0x2020000000;
  int v27 = 1065353216;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  int v7 = [v6 faceprint];

  if (v7)
  {
    double v8 = *(void **)(a1 + 32);
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __51__VCPVideoFullFaceDetector_updateWithExistingFaces__block_invoke_2;
    int v15 = &unk_1E62972F8;
    id v9 = v6;
    uint64_t v10 = *(void *)(a1 + 48);
    id v16 = v9;
    uint64_t v17 = v10;
    id v18 = &v24;
    id v19 = &v20;
    [v8 enumerateKeysAndObjectsUsingBlock:&v12];
    if (v21[3] >= 1 && v25[6] < 0.285)
    {
      int v11 = objc_msgSend(NSNumber, "numberWithInteger:", v12, v13, v14, v15);
      [*(id *)(a1 + 40) setObject:v11 forKeyedSubscript:v5];
    }
  }
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
}

void __51__VCPVideoFullFaceDetector_updateWithExistingFaces__block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v12 = a2;
  id v7 = a3;
  double v8 = [*(id *)(a1 + 32) faceprint];
  id v9 = [v8 computeDistance:v7 withDistanceFunction:0 error:0];

  if (v9)
  {
    [v9 floatValue];
    if (v10 < *(float *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      [v9 floatValue];
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v11;
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v12 integerValue];
    }
  }
  else
  {
    *a4 = 1;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -18;
  }
}

void __51__VCPVideoFullFaceDetector_updateWithExistingFaces__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(*(void *)(a1 + 32) + 152) removeObjectForKey:v5];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = *(id *)(*(void *)(a1 + 32) + 168);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        int v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "faceID", (void)v13);
        if (v12 == (int)[v5 intValue]) {
          objc_msgSend(v11, "setFaceID:", (int)objc_msgSend(v6, "intValue"));
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (int)finishAnalysisPass:(id *)a3
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  if (self->super._results) {
    return -18;
  }
  int v3 = [(VCPVideoFullFaceDetector *)self clusterFaces];
  if (!v3
    && (![(NSArray *)self->_existingFaceprints count]
     || ![(NSMutableDictionary *)self->_facePrints count]
     || (int v3 = [(VCPVideoFullFaceDetector *)self updateWithExistingFaces]) == 0))
  {
    id v82 = self;
    CMTime v81 = [MEMORY[0x1E4F1CA48] array];
    long long v99 = 0u;
    long long v100 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    obuint64_t j = self->_allFaces;
    uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v97 objects:v109 count:16];
    if (v5)
    {
      uint64_t v78 = *(void *)v98;
      do
      {
        uint64_t v6 = v5;
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v98 != v78) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void **)(*((void *)&v97 + 1) + 8 * i);
          memset(&v96, 0, sizeof(v96));
          if (v8)
          {
            [v8 start];
            long long v94 = 0uLL;
            CMTimeEpoch v95 = 0;
            [v8 last];
          }
          else
          {
            long long v94 = 0uLL;
            CMTimeEpoch v95 = 0;
          }
          uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
          float v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "position"));
          [v9 setObject:v10 forKey:@"facePosition"];

          [v8 bounds];
          if (v11 < 1.0) {
            double v15 = v11;
          }
          else {
            double v15 = 1.0;
          }
          if (v11 <= 0.0) {
            double v15 = 0.0;
          }
          if (v12 < 1.0) {
            double v16 = v12;
          }
          else {
            double v16 = 1.0;
          }
          if (v12 <= 0.0) {
            double v16 = 0.0;
          }
          double v17 = 1.0 - v11;
          if (v13 < v17) {
            double v17 = v13;
          }
          if (v13 <= 0.0) {
            double v18 = 0.0;
          }
          else {
            double v18 = v17;
          }
          double v19 = 1.0 - v12;
          if (v14 < 1.0 - v12) {
            double v19 = v14;
          }
          if (v14 <= 0.0) {
            double v20 = 0.0;
          }
          else {
            double v20 = v19;
          }
          double v21 = v15;
          double v22 = v16;
          uint64_t v23 = NSStringFromRect(*(NSRect *)(&v18 - 2));
          [v9 setObject:v23 forKey:@"faceBounds"];

          uint64_t v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "faceID"));
          [v9 setObject:v24 forKey:@"faceId"];

          [v8 torsoBounds];
          if (!CGRectIsEmpty(v111))
          {
            [v8 torsoBounds];
            if (v25 < 1.0) {
              double v29 = v25;
            }
            else {
              double v29 = 1.0;
            }
            if (v25 <= 0.0) {
              double v29 = 0.0;
            }
            if (v26 < 1.0) {
              double v30 = v26;
            }
            else {
              double v30 = 1.0;
            }
            if (v26 <= 0.0) {
              double v30 = 0.0;
            }
            double v31 = 1.0 - v25;
            if (v27 < v31) {
              double v31 = v27;
            }
            if (v27 <= 0.0) {
              double v32 = 0.0;
            }
            else {
              double v32 = v31;
            }
            double v33 = 1.0 - v26;
            if (v28 < 1.0 - v26) {
              double v33 = v28;
            }
            if (v28 <= 0.0) {
              double v34 = 0.0;
            }
            else {
              double v34 = v33;
            }
            double v35 = v29;
            double v36 = v30;
            uint64_t v37 = NSStringFromRect(*(NSRect *)(&v32 - 2));
            [v9 setObject:v37 forKey:@"humanBounds"];
          }
          v107[0] = @"start";
          time.CMTime start = v96;
          CFDictionaryRef v38 = CMTimeCopyAsDictionary(&time.start, 0);
          v108[0] = v38;
          v107[1] = @"duration";
          *(_OWORD *)&time.start.value = v94;
          time.start.CMTimeEpoch epoch = v95;
          CMTime rhs = v96;
          CMTimeSubtract(&v93, &time.start, &rhs);
          time.CMTime start = v93;
          CFDictionaryRef v39 = CMTimeCopyAsDictionary(&time.start, 0);
          v108[1] = v39;
          v107[2] = @"flags";
          uint64_t v40 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "flags"));
          v107[3] = @"attributes";
          v108[2] = v40;
          void v108[3] = v9;
          CGFloat v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v108 forKeys:v107 count:4];
          [v81 addObject:v41];

          faceRanges = v82->_faceRanges;
          CGFloat v43 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "faceID"));
          double v44 = [(NSMutableDictionary *)faceRanges objectForKeyedSubscript:v43];

          if (!v44)
          {
            double v44 = [MEMORY[0x1E4F1CA48] array];
          }
          [v44 addObject:v8];
          id v45 = v82->_faceRanges;
          double v46 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "faceID"));
          [(NSMutableDictionary *)v45 setObject:v44 forKey:v46];
        }
        uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v97 objects:v109 count:16];
      }
      while (v5);
    }

    uint64_t v79 = [MEMORY[0x1E4F1CA48] array];
    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    uint64_t v76 = v82->_allTorsos;
    uint64_t v47 = [(NSMutableArray *)v76 countByEnumeratingWithState:&v89 objects:v106 count:16];
    if (v47)
    {
      uint64_t v77 = *(void *)v90;
      do
      {
        for (uint64_t j = 0; j != v47; ++j)
        {
          if (*(void *)v90 != v77) {
            objc_enumerationMutation(v76);
          }
          id v49 = *(void **)(*((void *)&v89 + 1) + 8 * j);
          memset(&time, 0, sizeof(time));
          if (v49) {
            [v49 timerange];
          }
          else {
            memset(&range, 0, sizeof(range));
          }
          long long v50 = *(_OWORD *)&a3->var0.var3;
          *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a3->var0.var0;
          *(_OWORD *)&otherRange.start.CMTimeEpoch epoch = v50;
          *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
          CMTimeRangeGetIntersection(&time, &range, &otherRange);
          uint64_t v51 = [MEMORY[0x1E4F1CA60] dictionary];
          [v49 bounds];
          if (v52 < 1.0) {
            double v56 = v52;
          }
          else {
            double v56 = 1.0;
          }
          if (v52 <= 0.0) {
            double v56 = 0.0;
          }
          if (v53 < 1.0) {
            double v57 = v53;
          }
          else {
            double v57 = 1.0;
          }
          if (v53 <= 0.0) {
            double v57 = 0.0;
          }
          double v58 = 1.0 - v52;
          if (v54 < v58) {
            double v58 = v54;
          }
          if (v54 <= 0.0) {
            double v59 = 0.0;
          }
          else {
            double v59 = v58;
          }
          double v60 = 1.0 - v53;
          if (v55 < 1.0 - v53) {
            double v60 = v55;
          }
          if (v55 <= 0.0) {
            double v61 = 0.0;
          }
          else {
            double v61 = v60;
          }
          double v62 = v56;
          double v63 = v57;
          CGFloat v64 = NSStringFromRect(*(NSRect *)(&v59 - 2));
          [v51 setObject:v64 forKeyedSubscript:@"humanBounds"];

          CGFloat v65 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v49, "humanID"));
          [v51 setObject:v65 forKeyedSubscript:@"faceId"];

          v104[0] = @"start";
          CMTime rhs = time.start;
          CFDictionaryRef v66 = CMTimeCopyAsDictionary(&rhs, 0);
          v105[0] = v66;
          v104[1] = @"duration";
          CMTime rhs = time.duration;
          CFDictionaryRef v67 = CMTimeCopyAsDictionary(&rhs, 0);
          v104[2] = @"attributes";
          v105[1] = v67;
          v105[2] = v51;
          int v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v105 forKeys:v104 count:3];
          [v79 addObject:v68];
        }
        uint64_t v47 = [(NSMutableArray *)v76 countByEnumeratingWithState:&v89 objects:v106 count:16];
      }
      while (v47);
    }

    time.start.value = 0;
    *(void *)&time.start.timescale = &time;
    time.start.CMTimeEpoch epoch = 0x2020000000;
    LODWORD(time.duration.value) = 0;
    id v69 = [MEMORY[0x1E4F1CA48] array];
    facePrints = v82->_facePrints;
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __47__VCPVideoFullFaceDetector_finishAnalysisPass___block_invoke;
    v83[3] = &unk_1E6297370;
    p_CMTimeRange time = &time;
    id v71 = v69;
    id v84 = v71;
    [(NSMutableDictionary *)facePrints enumerateKeysAndObjectsUsingBlock:v83];
    int v3 = *(_DWORD *)(*(void *)&time.start.timescale + 24);
    if (!v3)
    {
      v102[0] = @"FaceResults";
      v102[1] = @"FacePrintResults";
      v103[0] = v81;
      v103[1] = v71;
      v102[2] = @"TorsoResults";
      v103[2] = v79;
      uint64_t v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v103 forKeys:v102 count:3];
      results = v82->super._results;
      v82->super._results = (NSDictionary *)v72;

      int v3 = *(_DWORD *)(*(void *)&time.start.timescale + 24);
    }

    _Block_object_dispose(&time, 8);
  }
  return v3;
}

void __47__VCPVideoFullFaceDetector_finishAnalysisPass___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = [v8 faceprint];

  if (v9)
  {
    float v10 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
    double v11 = [v8 faceprint];
    [v10 encodeObject:v11 forKey:@"facePrint"];

    double v12 = [v10 encodedData];

    if (v12)
    {
      double v13 = [MEMORY[0x1E4F1CA60] dictionary];
      [v13 setObject:v7 forKeyedSubscript:@"faceId"];
      double v14 = [v10 encodedData];
      [v13 setObject:v14 forKeyedSubscript:@"facePrint"];

      double v15 = [v8 torsoprint];

      if (v15)
      {
        double v16 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
        double v17 = [v8 torsoprint];
        [v16 encodeObject:v17 forKey:@"torsoPrint"];

        double v18 = [v16 encodedData];

        if (v18)
        {
          double v19 = [v16 encodedData];
          [v13 setObject:v19 forKeyedSubscript:@"torsoPrint"];
        }
        else
        {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -18;
          *a4 = 1;
        }
      }
      double v20 = *(void **)(a1 + 32);
      double v22 = @"attributes";
      v23[0] = v13;
      double v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      [v20 addObject:v21];
    }
    else
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -18;
      *a4 = 1;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gallery, 0);
  objc_storeStrong((id *)&self->_frameFaceResults, 0);
  objc_storeStrong((id *)&self->_faceRanges, 0);
  objc_storeStrong((id *)&self->_allFaces, 0);
  objc_storeStrong((id *)&self->_torsoPrints, 0);
  objc_storeStrong((id *)&self->_facePrints, 0);
  objc_storeStrong((id *)&self->_reservedIDs, 0);
  objc_storeStrong((id *)&self->_allTorsos, 0);
  objc_storeStrong((id *)&self->_keyFaces, 0);
  objc_storeStrong((id *)&self->_faceTrackers, 0);
  objc_storeStrong((id *)&self->_existingFaceprints, 0);
  objc_storeStrong((id *)&self->_poseEstimator, 0);
  objc_storeStrong((id *)&self->_smileDetector, 0);
}

@end