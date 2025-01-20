@interface VCPANSTHandsDetector
+ (id)anstHandsDetectorWithExtendRatio:(float)a3 options:(id)a4;
- (VCPANSTHandsDetector)initWithExtendRatio:(float)a3 options:(id)a4;
- (int)handsDetection:(__CVBuffer *)a3 rotationInDegrees:(id)a4 handsRegions:(id)a5 cancel:(id)a6;
- (void)dealloc;
@end

@implementation VCPANSTHandsDetector

- (VCPANSTHandsDetector)initWithExtendRatio:(float)a3 options:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v25.receiver = self;
  v25.super_class = (Class)VCPANSTHandsDetector;
  v7 = [(VCPANSTHandsDetector *)&v25 init];
  if (!v7)
  {
    v12 = 0;
    goto LABEL_21;
  }
  int v8 = _os_feature_enabled_impl();
  v7->_useVisionCore = v8;
  if (v8)
  {
    v9 = [[VCPCNNVisionCoreDetector alloc] initWithOptions:v6];
    visionCoreDetector = v7->_visionCoreDetector;
    v7->_visionCoreDetector = v9;

    if ((int)MediaAnalysisLogLevel() < 7) {
      goto LABEL_12;
    }
    v11 = VCPLogInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_DEBUG, "VCPANSTHandsDetector - using VisionCore as detector", buf, 2u);
    }
  }
  else
  {
    v11 = [objc_alloc(MEMORY[0x1E4F47310]) initWithVersion:0x10000];
    [v11 setQualityOfService:33];
    [v11 setEnableSegmentation:0];
    [v11 setRunningFrameRate:1];
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F47308]) initWithConfiguration:v11];
    anstAlgorithm = v7->_anstAlgorithm;
    v7->_anstAlgorithm = (ANSTISPAlgorithm *)v13;

    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v15 = VCPLogInstance();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_DEBUG, "VCPANSTHandsDetector - using ANSTKit as detector", buf, 2u);
      }
    }
  }

LABEL_12:
  v16 = (Rotator *)operator new(0x20uLL, MEMORY[0x1E4FBA2D0]);
  if (v16)
  {
    v17 = v16;
    ma::Rotator::Rotator((uint64_t)v16, 90);
    v7->_rotator = v17;
    v7->_extendRatio = a3;
    v12 = v7;
    v18 = v7->_anstAlgorithm;
    if (v18)
    {
      id v24 = 0;
      char v19 = [(ANSTISPAlgorithm *)v18 prepareWithError:&v24];
      id v20 = v24;
      if ((v19 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
      {
        v21 = VCPLogInstance();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v27 = v20;
          _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_ERROR, "VCPANSTHandsDetector - prepareError = %@", buf, 0xCu);
        }
      }
      v12 = v7;
    }
  }
  else
  {
    v12 = 0;
    v7->_rotator = 0;
    v7->_extendRatio = a3;
  }
LABEL_21:
  v22 = v12;

  return v22;
}

+ (id)anstHandsDetectorWithExtendRatio:(float)a3 options:(id)a4
{
  id v5 = a4;
  id v6 = [VCPANSTHandsDetector alloc];
  *(float *)&double v7 = a3;
  int v8 = [(VCPANSTHandsDetector *)v6 initWithExtendRatio:v5 options:v7];

  return v8;
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
  v4.super_class = (Class)VCPANSTHandsDetector;
  [(VCPANSTHandsDetector *)&v4 dealloc];
}

- (int)handsDetection:(__CVBuffer *)a3 rotationInDegrees:(id)a4 handsRegions:(id)a5 cancel:(id)a6
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v80 = a4;
  id v83 = a5;
  v81 = (uint64_t (**)(void))a6;
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v9 = VCPLogInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      double extendRatio = self->_extendRatio;
      *(_DWORD *)buf = 134217984;
      double v97 = extendRatio;
      _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_DEBUG, "VCPANSTHandsDetector: extend ratio for ANST hand detection = %f", buf, 0xCu);
    }
  }
  CFTypeRef cf = 0;
  if (v81 && (v81[2]() & 1) != 0)
  {
    double v11 = 0.0;
    v79 = 0;
    v12 = 0;
    int v13 = -128;
LABEL_83:

    uint64_t v28 = v79;
    goto LABEL_84;
  }
  if ((int)Height < (int)Width)
  {
    if (!self->_useVisionCore)
    {
      if (v80)
      {
        if ([v80 intValue] == 90)
        {
          uint64_t v16 = 3;
        }
        else if ([v80 intValue] == 270)
        {
          uint64_t v16 = 4;
        }
        else if ([v80 intValue] == 180)
        {
          uint64_t v16 = 2;
        }
        else
        {
          uint64_t v16 = [v80 intValue] == 0;
        }
      }
      else
      {
        uint64_t v16 = 1;
      }
      anstAlgorithm = self->_anstAlgorithm;
      uint64_t v91 = 0;
      v18 = (id *)&v91;
      v79 = [(ANSTISPAlgorithm *)anstAlgorithm resultForPixelBuffer:a3 orientation:v16 error:&v91];
      v12 = 0;
      goto LABEL_40;
    }
    if (v80)
    {
      if ([v80 intValue] == 90)
      {
        uint64_t v15 = 8;
LABEL_37:
        visionCoreDetector = self->_visionCoreDetector;
        uint64_t v92 = 0;
        v18 = (id *)&v92;
        v12 = [(VCPCNNVisionCoreDetector *)visionCoreDetector resultForPixelBuffer:a3 orientation:v15 Error:&v92];
        v79 = 0;
LABEL_40:
        size_t v20 = Height;
        size_t v21 = Width;
        goto LABEL_41;
      }
      if ([v80 intValue] == 270)
      {
        uint64_t v15 = 6;
        goto LABEL_37;
      }
      if ([v80 intValue] == 180)
      {
        uint64_t v15 = 3;
        goto LABEL_37;
      }
      [v80 intValue];
    }
    uint64_t v15 = 1;
    goto LABEL_37;
  }
  rotator = self->_rotator;
  if (!rotator) {
    goto LABEL_12;
  }
  if (rotator->var3 != 90)
  {
    ma::Rotator::~Rotator((ma::Rotator *)self->_rotator);
    MEMORY[0x1C186C7D0]();
LABEL_12:
    operator new();
  }
  int v13 = ma::Rotator::Rotate((ma::Rotator *)rotator, a3, &cf);
  if (v13)
  {
    double v11 = 0.0;
    v79 = 0;
    v12 = 0;
    goto LABEL_83;
  }
  if (self->_useVisionCore)
  {
    v17 = self->_visionCoreDetector;
    uint64_t v94 = 0;
    v18 = (id *)&v94;
    v12 = [(VCPCNNVisionCoreDetector *)v17 resultForPixelBuffer:cf orientation:6 Error:&v94];
    v79 = 0;
  }
  else
  {
    char v19 = self->_anstAlgorithm;
    uint64_t v93 = 0;
    v18 = (id *)&v93;
    v79 = [(ANSTISPAlgorithm *)v19 resultForPixelBuffer:cf orientation:4 error:&v93];
    v12 = 0;
  }
  size_t v20 = Width;
  size_t v21 = Height;
LABEL_41:
  size_t v24 = v21;
  id v25 = *v18;
  if (v25)
  {
    double v11 = *(double *)&v25;
    if ((int)MediaAnalysisLogLevel() < 3)
    {
      int v13 = -18;
      goto LABEL_83;
    }
    id v27 = VCPLogInstance();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      double v97 = v11;
      _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_ERROR, "Failed to obtain result: %@", buf, 0xCu);
    }
    int v13 = -18;
LABEL_82:

    goto LABEL_83;
  }
  if (!v12)
  {
    if (!v79)
    {
      double v11 = 0.0;
      v79 = 0;
      v12 = 0;
      int v13 = 0;
      goto LABEL_83;
    }
    [v79 detectedObjectsForCategory:*MEMORY[0x1E4F47300]];
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v29 = [obj countByEnumeratingWithState:&v87 objects:v110 count:16];
    if (v29)
    {
      float v30 = (float)(int)v24;
      uint64_t v31 = *(void *)v88;
      float v32 = (float)(int)v20;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v88 != v31) {
            objc_enumerationMutation(obj);
          }
          v34 = *(void **)(*((void *)&v87 + 1) + 8 * i);
          uint64_t v35 = [v34 objectID];
          uint64_t v36 = [v34 groupID];
          [v34 boundingBox];
          double v38 = v37;
          double v40 = v39;
          double v42 = v41;
          double v44 = v43;
          uint64_t v45 = [v34 chirality];
          if (v45 == 1) {
            uint64_t v46 = 0xFFFFFFFFLL;
          }
          else {
            uint64_t v46 = v45 == 2;
          }
          unint64_t v47 = [v34 confidence];
          float v48 = v42 * 0.5;
          float v49 = v44 * 0.5;
          float v50 = v38 + v48;
          float v51 = v40 + v49;
          if (v48 < v49) {
            float v48 = v44 * 0.5;
          }
          float v52 = v48 * (float)(self->_extendRatio + 1.0);
          float v53 = v50 - v52;
          if ((float)(v50 - v52) < 0.0) {
            float v53 = 0.0;
          }
          float v54 = v51 - v52;
          if ((float)(v51 - v52) < 0.0) {
            float v54 = 0.0;
          }
          float v55 = v52 + v50;
          if (v55 > v30) {
            float v55 = v30;
          }
          float v56 = v52 + v51;
          float v57 = v53 / v30;
          if (v56 > v32) {
            float v56 = v32;
          }
          float v58 = v54 / v32;
          float v59 = (float)(v55 - v53) / v30;
          float v60 = (float)(v56 - v54) / v32;
          if ((int)Height < (int)Width)
          {
            float v62 = (float)(v55 - v53) / v30;
            float v59 = v60;
          }
          else
          {
            float v61 = (float)(1.0 - v57) - v59;
            float v57 = v54 / v32;
            if (v61 >= 0.0) {
              float v58 = v61;
            }
            else {
              float v58 = 0.0;
            }
            float v62 = v60;
          }
          v63 = [VCPBoundingBox alloc];
          *(float *)&double v64 = (float)v47;
          *(float *)&double v65 = v57;
          *(float *)&double v66 = v58;
          *(float *)&double v67 = v62;
          *(float *)&double v68 = v59;
          v69 = [(VCPBoundingBox *)v63 initWithXYAndSize:v65 y:v66 width:v67 height:v68 confidence:v64];
          [(VCPBoundingBox *)v69 setClassIndex:v46];
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            v70 = VCPLogInstance();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
            {
              [(VCPBoundingBox *)v69 minX];
              float v72 = v71;
              [(VCPBoundingBox *)v69 minY];
              float v74 = v73;
              [(VCPBoundingBox *)v69 maxX];
              float v76 = v75;
              [(VCPBoundingBox *)v69 maxY];
              *(_DWORD *)buf = 134219520;
              double v97 = v72;
              __int16 v98 = 2048;
              double v99 = v74;
              __int16 v100 = 2048;
              double v101 = v76;
              __int16 v102 = 2048;
              double v103 = v77;
              __int16 v104 = 1024;
              int v105 = v46;
              __int16 v106 = 2048;
              uint64_t v107 = v35;
              __int16 v108 = 2048;
              uint64_t v109 = v36;
              _os_log_impl(&dword_1BBEDA000, v70, OS_LOG_TYPE_INFO, "VCPANSTHandsDetector: box (xyxy, chirality) = [%f, %f, %f, %f, %d] trackingID = %lu, groupID = %lu", buf, 0x44u);
            }
          }
          [(VCPBoundingBox *)v69 setTrackID:v35];
          [(VCPBoundingBox *)v69 setGroupID:v36];
          [v83 addObject:v69];
        }
        uint64_t v29 = [obj countByEnumeratingWithState:&v87 objects:v110 count:16];
      }
      while (v29);
    }

    double v11 = 0.0;
    v12 = 0;
    int v13 = 0;
    id v27 = obj;
    goto LABEL_82;
  }
  *(float *)&double v26 = self->_extendRatio;
  int v13 = [(VCPCNNVisionCoreDetector *)self->_visionCoreDetector getHandsRegions:v83 fromVisionCorePostProcessingOutput:v12 imageWidth:v24 imageHeight:v20 extendRatio:(int)Height >= (int)Width portrait_mode:v26];
  uint64_t v28 = v79;
  if (!v13)
  {
    double v11 = 0.0;
    goto LABEL_83;
  }
LABEL_84:

  CF<opaqueCMSampleBuffer *>::~CF(&cf);
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visionCoreDetector, 0);
  objc_storeStrong((id *)&self->_anstAlgorithm, 0);
}

@end