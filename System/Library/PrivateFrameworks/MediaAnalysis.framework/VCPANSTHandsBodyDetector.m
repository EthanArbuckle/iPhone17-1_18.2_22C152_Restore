@interface VCPANSTHandsBodyDetector
- (VCPANSTHandsBodyDetector)initWithHandExtendRatio:(float)a3 inputRatio:(float)a4 maxNumPersonRegions:(int)a5;
- (int)anstDetection:(__CVBuffer *)a3 rotationInDegrees:(id)a4 detectingFullbody:(BOOL)a5 detectingHands:(BOOL)a6 handsRegions:(id)a7 personRegions:(id)a8 cancel:(id)a9;
- (int)getTopKLargestPersonBoxes:(int)a3 personRegions:(id)a4;
- (int)updateHandBoxes:(id)a3 withPersonRegions:(id)a4;
- (int)updateMaxNumPersonRegions:(int)a3;
- (void)dealloc;
@end

@implementation VCPANSTHandsBodyDetector

- (VCPANSTHandsBodyDetector)initWithHandExtendRatio:(float)a3 inputRatio:(float)a4 maxNumPersonRegions:(int)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)VCPANSTHandsBodyDetector;
  v8 = [(VCPANSTHandsBodyDetector *)&v26 init];
  if (!v8)
  {
    v13 = 0;
    goto LABEL_21;
  }
  int v9 = _os_feature_enabled_impl();
  v8->_useVisionCore = v9;
  if (v9)
  {
    v10 = [[VCPCNNVisionCoreDetector alloc] initWithOptions:0];
    visionCoreDetector = v8->_visionCoreDetector;
    v8->_visionCoreDetector = v10;

    if ((int)MediaAnalysisLogLevel() < 7) {
      goto LABEL_12;
    }
    v12 = VCPLogInstance();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_DEBUG, "VCPANSTHandsBodyDetector - using VisionCore as detector", buf, 2u);
    }
  }
  else
  {
    v12 = [objc_alloc(MEMORY[0x1E4F47310]) initWithVersion:0x10000];
    [v12 setQualityOfService:33];
    [v12 setEnableSegmentation:0];
    [v12 setRunningFrameRate:1];
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F47308]) initWithConfiguration:v12];
    anstAlgorithm = v8->_anstAlgorithm;
    v8->_anstAlgorithm = (ANSTISPAlgorithm *)v14;

    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v16 = VCPLogInstance();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_DEBUG, "VCPANSTHandsBodyDetector - using ANSTKit as detector", buf, 2u);
      }
    }
  }

LABEL_12:
  v17 = (Rotator *)operator new(0x20uLL, MEMORY[0x1E4FBA2D0]);
  if (v17)
  {
    v18 = v17;
    ma::Rotator::Rotator((uint64_t)v17, 90);
    v8->_rotator = v18;
    v8->_extendRatio = a3;
    v8->_inputRatio = a4;
    v8->_maxNumPersonRegions = a5;
    v13 = v8;
    v19 = v8->_anstAlgorithm;
    if (v19)
    {
      id v25 = 0;
      char v20 = [(ANSTISPAlgorithm *)v19 prepareWithError:&v25];
      id v21 = v25;
      if ((v20 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
      {
        v22 = VCPLogInstance();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v28 = v21;
          _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_ERROR, "VCPANSTHandsBodyDetector - prepareError = %@", buf, 0xCu);
        }
      }
      v13 = v8;
    }
  }
  else
  {
    v13 = 0;
    v8->_rotator = 0;
    v8->_extendRatio = a3;
    v8->_inputRatio = a4;
    v8->_maxNumPersonRegions = a5;
  }
LABEL_21:
  v23 = v13;

  return v23;
}

- (void)dealloc
{
  rotator = self->_rotator;
  if (rotator)
  {
    ma::Rotator::~Rotator((ma::Rotator *)rotator);
    MEMORY[0x1C186C7D0]();
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPANSTHandsBodyDetector;
  [(VCPANSTHandsBodyDetector *)&v4 dealloc];
}

- (int)updateMaxNumPersonRegions:(int)a3
{
  self->_maxNumPersonRegions = a3;
  return 0;
}

- (int)getTopKLargestPersonBoxes:(int)a3 personRegions:(id)a4
{
  id v5 = a4;
  [v5 sortUsingComparator:&__block_literal_global_29];
  while ([v5 count] > (unint64_t)a3)
    [v5 removeLastObject];

  return 0;
}

uint64_t __68__VCPANSTHandsBodyDetector_getTopKLargestPersonBoxes_personRegions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  id v7 = v5;
  [v6 maxX];
  float v32 = v8;
  [v6 minX];
  float v10 = v9;
  [v6 maxY];
  float v12 = v11;
  [v6 minY];
  float v14 = v13;
  [v7 maxX];
  float v16 = v15;
  [v7 minX];
  float v18 = v17;
  [v7 maxY];
  float v20 = v19;
  [v7 minY];
  float v22 = v21;
  [v6 flag];
  float v24 = v23;
  [v7 flag];
  if (v24 <= v25)
  {
    [v6 flag];
    float v28 = v27;
    [v7 flag];
    uint64_t v30 = -1;
    if ((float)((float)(v32 - v10) * (float)(v12 - v14)) <= (float)((float)(v16 - v18) * (float)(v20 - v22))) {
      uint64_t v30 = 1;
    }
    if (v28 >= v29) {
      uint64_t v26 = v30;
    }
    else {
      uint64_t v26 = 1;
    }
  }
  else
  {
    uint64_t v26 = -1;
  }

  return v26;
}

- (int)updateHandBoxes:(id)a3 withPersonRegions:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v16 = a4;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = v16;
  uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(obj);
        }
        int v9 = [*(id *)(*((void *)&v23 + 1) + 8 * i) groupID];
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v10 = v18;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v20;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v20 != v12) {
                objc_enumerationMutation(v10);
              }
              float v14 = *(void **)(*((void *)&v19 + 1) + 8 * j);
              if ([v14 groupID] == v9) {
                [v5 addObject:v14];
              }
            }
            uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v11);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v6);
  }

  return 0;
}

- (int)anstDetection:(__CVBuffer *)a3 rotationInDegrees:(id)a4 detectingFullbody:(BOOL)a5 detectingHands:(BOOL)a6 handsRegions:(id)a7 personRegions:(id)a8 cancel:(id)a9
{
  BOOL v131 = a6;
  BOOL v11 = a5;
  uint64_t v166 = *MEMORY[0x1E4F143B8];
  id v133 = a4;
  id v137 = a7;
  id v138 = a8;
  v134 = (uint64_t (**)(void))a9;
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  CFTypeRef cf = 0;
  if (!v134 || (v134[2]() & 1) == 0)
  {
    if (Height < Width)
    {
      if (self->_useVisionCore)
      {
        visionCoreDetector = self->_visionCoreDetector;
        uint64_t v150 = 0;
        long long v20 = (id *)&v150;
        uint64_t v21 = [(VCPCNNVisionCoreDetector *)visionCoreDetector resultForPixelBuffer:a3 orientation:1 Error:&v150];
LABEL_21:
        id v16 = (void *)v21;
        id v26 = *v20;
        if (v26)
        {
          double v15 = *(double *)&v26;
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            float v28 = VCPLogInstance();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              double v155 = v15;
              _os_log_impl(&dword_1BBEDA000, v28, OS_LOG_TYPE_ERROR, "Failed to obtain result: %@", buf, 0xCu);
            }
            double v14 = 0.0;
            v132 = 0;
LABEL_47:
            int v17 = -18;
LABEL_48:

            goto LABEL_138;
          }
          double v14 = 0.0;
          v132 = 0;
          goto LABEL_127;
        }
        if (v16)
        {
          if (v11)
          {
            LODWORD(v27) = 1036831949;
            int v17 = -[VCPCNNVisionCoreDetector getBodyRegions:fromVisionCorePostProcessingOutput:imageWidth:imageHeight:extendRatio:portrait_mode:](self->_visionCoreDetector, "getBodyRegions:fromVisionCorePostProcessingOutput:imageWidth:imageHeight:extendRatio:portrait_mode:", v138, v16, v27);
            if (v17)
            {
LABEL_39:
              double v14 = 0.0;
              v132 = 0;
              double v15 = 0.0;
              goto LABEL_138;
            }
          }
          if (v138) {
            [(VCPANSTHandsBodyDetector *)self getTopKLargestPersonBoxes:self->_maxNumPersonRegions personRegions:v138];
          }
          if (v131)
          {
            if (Height >= Width) {
              uint64_t v29 = Width;
            }
            else {
              uint64_t v29 = Height;
            }
            if (Height <= Width) {
              uint64_t v30 = Width;
            }
            else {
              uint64_t v30 = Height;
            }
            *(float *)&double v27 = self->_extendRatio;
            int v17 = [(VCPCNNVisionCoreDetector *)self->_visionCoreDetector getHandsRegions:v137 fromVisionCorePostProcessingOutput:v16 imageWidth:v30 imageHeight:v29 extendRatio:Height >= Width portrait_mode:v27];
            if (v17) {
              goto LABEL_39;
            }
            double v14 = 0.0;
            if (!v137 || !v138)
            {
              v132 = 0;
              double v15 = 0.0;
              goto LABEL_138;
            }
            -[VCPANSTHandsBodyDetector updateHandBoxes:withPersonRegions:](self, "updateHandBoxes:withPersonRegions:", v137);
          }
        }
        double v14 = 0.0;
        v132 = 0;
        double v15 = 0.0;
LABEL_137:
        int v17 = 0;
        goto LABEL_138;
      }
      if (v133
        && [v133 intValue] != 90
        && [v133 intValue] != 270
        && [v133 intValue] != 180)
      {
        [v133 intValue];
      }
      anstAlgorithm = self->_anstAlgorithm;
      uint64_t v149 = 0;
      long long v23 = (id *)&v149;
      uint64_t v24 = [(ANSTISPAlgorithm *)anstAlgorithm resultForPixelBuffer:a3 orientation:0 error:&v149];
    }
    else
    {
      rotator = self->_rotator;
      if (!rotator) {
        goto LABEL_8;
      }
      if (rotator->var3 != 90)
      {
        ma::Rotator::~Rotator((ma::Rotator *)self->_rotator);
        MEMORY[0x1C186C7D0]();
LABEL_8:
        operator new();
      }
      int v17 = ma::Rotator::Rotate((ma::Rotator *)rotator, a3, &cf);
      if (v17)
      {
        double v14 = 0.0;
        v132 = 0;
        double v15 = 0.0;
        id v16 = 0;
        goto LABEL_138;
      }
      if (self->_useVisionCore)
      {
        long long v25 = self->_visionCoreDetector;
        uint64_t v152 = 0;
        long long v20 = (id *)&v152;
        uint64_t v21 = [(VCPCNNVisionCoreDetector *)v25 resultForPixelBuffer:cf orientation:6 Error:&v152];
        goto LABEL_21;
      }
      v31 = self->_anstAlgorithm;
      uint64_t v151 = 0;
      long long v23 = (id *)&v151;
      uint64_t v24 = [(ANSTISPAlgorithm *)v31 resultForPixelBuffer:cf orientation:4 error:&v151];
    }
    float v32 = (void *)v24;
    id v33 = *v23;
    if (v33)
    {
      double v14 = *(double *)&v33;
      v132 = v32;
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        float v28 = VCPLogInstance();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          double v155 = v14;
          _os_log_impl(&dword_1BBEDA000, v28, OS_LOG_TYPE_ERROR, "Failed to obtain result: %@", buf, 0xCu);
        }
        double v15 = 0.0;
        id v16 = 0;
        goto LABEL_47;
      }
      double v15 = 0.0;
      id v16 = 0;
LABEL_127:
      int v17 = -18;
      goto LABEL_138;
    }
    if (v32)
    {
      v132 = v32;
      if (v11)
      {
        [v32 detectedObjectsForCategory:*MEMORY[0x1E4F472F8]];
        long long v147 = 0u;
        long long v148 = 0u;
        long long v145 = 0u;
        long long v146 = 0u;
        obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v34 = [obj countByEnumeratingWithState:&v145 objects:v165 count:16];
        if (v34)
        {
          float v35 = (float)Height;
          uint64_t v36 = *(void *)v146;
          float v37 = (float)Width;
          do
          {
            for (uint64_t i = 0; i != v34; ++i)
            {
              if (*(void *)v146 != v36) {
                objc_enumerationMutation(obj);
              }
              v39 = *(void **)(*((void *)&v145 + 1) + 8 * i);
              uint64_t v40 = [v39 objectID];
              uint64_t v41 = [v39 groupID];
              [v39 boundingBox];
              double v43 = v42;
              double v45 = v44;
              double v47 = v46;
              double v49 = v48;
              float v50 = (float)(unint64_t)[v39 confidence];
              float v51 = v47;
              float v52 = v43;
              float v53 = v45;
              if (Height >= Width) {
                float v54 = v49;
              }
              else {
                float v54 = v47;
              }
              if (Height >= Width) {
                float v55 = v47;
              }
              else {
                float v55 = v49;
              }
              if (Height >= Width) {
                float v56 = v45;
              }
              else {
                float v56 = v52;
              }
              if (Height >= Width) {
                float v57 = (float)(v35 - v52) - v51;
              }
              else {
                float v57 = v53;
              }
              v58 = [VCPBoundingBox alloc];
              *(float *)&double v61 = (float)(v55 * 0.5) + v57;
              *(float *)&double v62 = (float)(v55 * 0.5) * 1.1;
              *(float *)&double v63 = *(float *)&v62 + *(float *)&v61;
              if ((float)(*(float *)&v62 + *(float *)&v61) > v35) {
                *(float *)&double v63 = (float)Height;
              }
              float v64 = *(float *)&v61 - *(float *)&v62;
              float v65 = 0.0;
              if (v64 >= 0.0) {
                *(float *)&double v59 = v64;
              }
              else {
                *(float *)&double v59 = 0.0;
              }
              float v66 = (float)(v54 * 0.5) + v56;
              float v67 = (float)(v54 * 0.5) * 1.1;
              *(float *)&double v60 = v67 + v66;
              if ((float)(v67 + v66) > v37) {
                *(float *)&double v60 = (float)Width;
              }
              float v68 = v66 - v67;
              if (v68 >= 0.0) {
                float v65 = v68;
              }
              *(float *)&double v61 = *(float *)&v59 / v35;
              *(float *)&double v62 = v65 / v37;
              *(float *)&double v59 = (float)(*(float *)&v63 - *(float *)&v59) / v35;
              *(float *)&double v63 = (float)(*(float *)&v60 - v65) / v37;
              *(float *)&double v60 = v50;
              v69 = [(VCPBoundingBox *)v58 initWithXYAndSize:v62 y:v61 width:v63 height:v59 confidence:v60];
              [(VCPBoundingBox *)v69 setTrackID:v40];
              [(VCPBoundingBox *)v69 setGroupID:v41];
              if ((int)MediaAnalysisLogLevel() >= 7)
              {
                v70 = VCPLogInstance();
                if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
                {
                  [(VCPBoundingBox *)v69 minX];
                  float v72 = v71;
                  [(VCPBoundingBox *)v69 minY];
                  float v74 = v73;
                  [(VCPBoundingBox *)v69 maxX];
                  float v76 = v75;
                  [(VCPBoundingBox *)v69 maxY];
                  *(_DWORD *)buf = 134219264;
                  double v155 = v72;
                  __int16 v156 = 2048;
                  double v157 = v74;
                  __int16 v158 = 2048;
                  double v159 = v76;
                  __int16 v160 = 2048;
                  double v161 = v77;
                  __int16 v162 = 2048;
                  *(void *)v163 = v40;
                  *(_WORD *)&v163[8] = 2048;
                  *(void *)&v163[10] = v41;
                  _os_log_impl(&dword_1BBEDA000, v70, OS_LOG_TYPE_DEBUG, "VCPANSTHandsBodyDetector: person fullbody box (xyxy) = [%f, %f, %f, %f], trackingID = %lu, groupID = %lu", buf, 0x3Eu);
                }
              }
              [v138 addObject:v69];
            }
            uint64_t v34 = [obj countByEnumeratingWithState:&v145 objects:v165 count:16];
          }
          while (v34);
        }

        if (v138) {
          -[VCPANSTHandsBodyDetector getTopKLargestPersonBoxes:personRegions:](self, "getTopKLargestPersonBoxes:personRegions:", self->_maxNumPersonRegions);
        }

        float v32 = v132;
      }
      if (v131)
      {
        v78 = [v32 detectedObjectsForCategory:*MEMORY[0x1E4F47300]];
        if (Height >= Width) {
          int v79 = Width;
        }
        else {
          int v79 = Height;
        }
        long long v143 = 0u;
        long long v144 = 0u;
        if (Height <= Width) {
          int v80 = Width;
        }
        else {
          int v80 = Height;
        }
        long long v141 = 0uLL;
        long long v142 = 0uLL;
        obja = v78;
        uint64_t v81 = [obja countByEnumeratingWithState:&v141 objects:v164 count:16];
        if (v81)
        {
          float v82 = (float)v80;
          uint64_t v83 = *(void *)v142;
          float v84 = (float)v79;
          do
          {
            for (uint64_t j = 0; j != v81; ++j)
            {
              if (*(void *)v142 != v83) {
                objc_enumerationMutation(obja);
              }
              v86 = *(void **)(*((void *)&v141 + 1) + 8 * j);
              uint64_t v87 = [v86 objectID];
              uint64_t v88 = [v86 groupID];
              [v86 boundingBox];
              double v90 = v89;
              double v92 = v91;
              double v94 = v93;
              double v96 = v95;
              uint64_t v97 = [v86 chirality];
              if (v97 == 1) {
                uint64_t v98 = 0xFFFFFFFFLL;
              }
              else {
                uint64_t v98 = v97 == 2;
              }
              unint64_t v99 = [v86 confidence];
              float v100 = v94 * 0.5;
              float v101 = v96 * 0.5;
              float v102 = v90 + v100;
              float v103 = v92 + v101;
              if (v100 < v101) {
                float v100 = v96 * 0.5;
              }
              float v104 = v100 * (float)(self->_extendRatio + 1.0);
              float v105 = v102 - v104;
              if ((float)(v102 - v104) < 0.0) {
                float v105 = 0.0;
              }
              float v106 = v103 - v104;
              if ((float)(v103 - v104) < 0.0) {
                float v106 = 0.0;
              }
              float v107 = v104 + v102;
              if (v107 > v82) {
                float v107 = v82;
              }
              float v108 = v104 + v103;
              float v109 = v105 / v82;
              if (v108 > v84) {
                float v108 = (float)v79;
              }
              float v110 = v106 / v84;
              float v111 = (float)(v107 - v105) / v82;
              float v112 = (float)(v108 - v106) / v84;
              if (Height < Width)
              {
                float v114 = (float)(v107 - v105) / v82;
                float v111 = v112;
              }
              else
              {
                float v113 = (float)(1.0 - v109) - v111;
                float v109 = v106 / v84;
                if (v113 >= 0.0) {
                  float v110 = v113;
                }
                else {
                  float v110 = 0.0;
                }
                float v114 = v112;
              }
              v115 = [VCPBoundingBox alloc];
              *(float *)&double v116 = (float)v99;
              *(float *)&double v117 = v109;
              *(float *)&double v118 = v110;
              *(float *)&double v119 = v114;
              *(float *)&double v120 = v111;
              v121 = [(VCPBoundingBox *)v115 initWithXYAndSize:v117 y:v118 width:v119 height:v120 confidence:v116];
              [(VCPBoundingBox *)v121 setClassIndex:v98];
              if ((int)MediaAnalysisLogLevel() >= 7)
              {
                v122 = VCPLogInstance();
                if (os_log_type_enabled(v122, OS_LOG_TYPE_DEBUG))
                {
                  [(VCPBoundingBox *)v121 minX];
                  float v124 = v123;
                  [(VCPBoundingBox *)v121 minY];
                  float v126 = v125;
                  [(VCPBoundingBox *)v121 maxX];
                  float v128 = v127;
                  [(VCPBoundingBox *)v121 maxY];
                  *(_DWORD *)buf = 134219520;
                  double v155 = v124;
                  __int16 v156 = 2048;
                  double v157 = v126;
                  __int16 v158 = 2048;
                  double v159 = v128;
                  __int16 v160 = 2048;
                  double v161 = v129;
                  __int16 v162 = 1024;
                  *(_DWORD *)v163 = v98;
                  *(_WORD *)&v163[4] = 2048;
                  *(void *)&v163[6] = v87;
                  *(_WORD *)&v163[14] = 2048;
                  *(void *)&v163[16] = v88;
                  _os_log_impl(&dword_1BBEDA000, v122, OS_LOG_TYPE_DEBUG, "VCPANSTHandsBodyDetector: hands box (xyxy, chirality) = [%f, %f, %f, %f, %d] trackingID = %lu, groupID = %lu", buf, 0x44u);
                }
              }
              [(VCPBoundingBox *)v121 setTrackID:v87];
              [(VCPBoundingBox *)v121 setGroupID:v88];
              [v137 addObject:v121];
            }
            uint64_t v81 = [obja countByEnumeratingWithState:&v141 objects:v164 count:16];
          }
          while (v81);
        }

        int v17 = 0;
        double v14 = 0.0;
        if (v137 && v138)
        {
          -[VCPANSTHandsBodyDetector updateHandBoxes:withPersonRegions:](self, "updateHandBoxes:withPersonRegions:", v137);
          double v14 = 0.0;
          double v15 = 0.0;
          id v16 = 0;
          int v17 = 0;
        }
        else
        {
          double v15 = 0.0;
          id v16 = 0;
        }
        float v28 = obja;
        goto LABEL_48;
      }
      double v14 = 0.0;
    }
    else
    {
      double v14 = 0.0;
      v132 = 0;
    }
    double v15 = 0.0;
    id v16 = 0;
    goto LABEL_137;
  }
  double v14 = 0.0;
  v132 = 0;
  double v15 = 0.0;
  id v16 = 0;
  int v17 = -128;
LABEL_138:

  CF<opaqueCMSampleBuffer *>::~CF(&cf);
  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visionCoreDetector, 0);
  objc_storeStrong((id *)&self->_anstAlgorithm, 0);
}

@end