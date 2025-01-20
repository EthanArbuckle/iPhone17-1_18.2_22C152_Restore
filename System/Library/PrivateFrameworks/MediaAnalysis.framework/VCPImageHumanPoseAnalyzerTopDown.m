@interface VCPImageHumanPoseAnalyzerTopDown
- (VCPImageHumanPoseAnalyzerTopDown)initWithMaxNumRegions:(int)a3 forceCPU:(BOOL)a4 sharedModel:(BOOL)a5 inputConfig:(id)a6;
- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6;
- (int)preferredInputFormat:(int *)a3 height:(int *)a4 format:(unsigned int *)a5;
- (int)updateInputWidth:(int)a3 Height:(int)a4;
- (int)updateMaxNumPersons:(id)a3;
@end

@implementation VCPImageHumanPoseAnalyzerTopDown

- (VCPImageHumanPoseAnalyzerTopDown)initWithMaxNumRegions:(int)a3 forceCPU:(BOOL)a4 sharedModel:(BOOL)a5 inputConfig:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)VCPImageHumanPoseAnalyzerTopDown;
  v9 = [(VCPImageHumanPoseAnalyzerTopDown *)&v22 init];
  v10 = v9;
  if (v9)
  {
    v9->_maxNumRegions = (int)fmax((double)a3, 1.0);
    v11 = [VCPANSTHandsBodyDetector alloc];
    LODWORD(v12) = 1068149419;
    uint64_t v13 = [(VCPANSTHandsBodyDetector *)v11 initWithHandExtendRatio:v10->_maxNumRegions inputRatio:0.0 maxNumPersonRegions:v12];
    ANSTPersonDetector = v10->_ANSTPersonDetector;
    v10->_ANSTPersonDetector = (VCPANSTHandsBodyDetector *)v13;

    v15 = [[VCPCNNPersonKeypointsDetector alloc] initWithForceCPU:v7 sharedModel:v6];
    personKeypointsDetector = v10->_personKeypointsDetector;
    v10->_personKeypointsDetector = v15;

    uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
    results = v10->_results;
    v10->_results = (NSMutableArray *)v17;

    v10->_inputWidth = 640;
    v10->_inputHeight = 640;
    v19 = v10->_ANSTPersonDetector;
    if (v19)
    {
      if (v10->_personKeypointsDetector) {
        v19 = v10;
      }
      else {
        v19 = 0;
      }
    }
    v20 = v19;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (int)updateInputWidth:(int)a3 Height:(int)a4
{
  self->_inputWidth = a3;
  self->_inputHeight = a4;
  return 0;
}

- (int)updateMaxNumPersons:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_DEBUG, "ImageHumanPoseAnalyzerTopDown: maxNumPersons from options = %@", (uint8_t *)&v7, 0xCu);
    }
  }
  if (v4)
  {
    self->_maxNumRegions = (int)fmax((double)(int)[v4 intValue], 1.0);
    -[VCPANSTHandsBodyDetector updateMaxNumPersonRegions:](self->_ANSTPersonDetector, "updateMaxNumPersonRegions:");
  }

  return 0;
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v78 = a6;
  v79 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v89 = 0;
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  [(NSMutableArray *)self->_results removeAllObjects];
  int v10 = [(VCPANSTHandsBodyDetector *)self->_ANSTPersonDetector anstDetection:a3 rotationInDegrees:0 detectingFullbody:1 detectingHands:0 handsRegions:0 personRegions:v79 cancel:v78];
  if (!v10)
  {
    v71 = a3;
    v74 = self;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    obuint64_t j = v79;
    uint64_t v68 = [obj countByEnumeratingWithState:&v85 objects:v100 count:16];
    if (v68)
    {
      float v69 = (float)((float)Height * 0.75) / (float)Width;
      uint64_t v70 = *(void *)v86;
      while (2)
      {
        for (uint64_t i = 0; i != v68; ++i)
        {
          if (*(void *)v86 != v70) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v85 + 1) + 8 * i);
          v77 = [MEMORY[0x1E4F1CA48] array];
          int v10 = -[VCPCNNPersonKeypointsDetector analyzeFrame:withBox:keypoints:padX:padY:](v74->_personKeypointsDetector, "analyzeFrame:withBox:keypoints:padX:padY:", v71, v11);
          if (v10) {
            goto LABEL_32;
          }
          v80 = [MEMORY[0x1E4F1CA48] array];
          v76 = [MEMORY[0x1E4F1CA60] dictionary];
          [v11 minX];
          float v67 = v12;
          [v11 minY];
          float v66 = v13;
          [v11 maxX];
          float v65 = v14;
          [v11 minX];
          float v64 = v15;
          [v11 maxY];
          float v63 = v16;
          [v11 minY];
          float v62 = v17;
          [v11 maxX];
          float v19 = v18;
          [v11 minX];
          float v21 = v20;
          [v11 maxY];
          float v23 = v22;
          [v11 minY];
          float v25 = v24;
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v26 = VCPLogInstance();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 67109376;
              int v97 = HIDWORD(v89);
              __int16 v98 = 1024;
              int v99 = v89;
              _os_log_impl(&dword_1BBEDA000, v26, OS_LOG_TYPE_DEBUG, "VCPImageHumanPoseAnalyzerTopDown - received padX = %d, padY = %d", buf, 0xEu);
            }
          }
          float v27 = v19 - v21;
          float v28 = v23 - v25;
          if ((float)((float)(v19 - v21) / (float)(v23 - v25)) >= v69) {
            float v28 = v27 / v69;
          }
          else {
            float v27 = v69 * v28;
          }
          if ([v77 count] != 17)
          {
LABEL_31:

            int v10 = -18;
LABEL_32:

            goto LABEL_33;
          }
          long long v83 = 0u;
          long long v84 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          id v29 = v77;
          uint64_t v30 = [v29 countByEnumeratingWithState:&v81 objects:v95 count:16];
          if (v30)
          {
            uint64_t v31 = *(void *)v82;
            float v32 = 0.0;
            while (2)
            {
              for (uint64_t j = 0; j != v30; ++j)
              {
                if (*(void *)v82 != v31) {
                  objc_enumerationMutation(v29);
                }
                v34 = *(void **)(*((void *)&v81 + 1) + 8 * j);
                if ([v34 count] != 3)
                {

                  goto LABEL_31;
                }
                v35 = [v34 objectAtIndexedSubscript:0];
                [v35 floatValue];
                float v37 = v36;

                v38 = [v34 objectAtIndexedSubscript:1];
                [v38 floatValue];
                float v40 = v39;

                v41 = [v34 objectAtIndexedSubscript:2];
                [v41 floatValue];
                float v43 = v42;

                [v11 minX];
                float v45 = v44;
                LODWORD(v41) = HIDWORD(v89);
                [v11 minY];
                float v47 = v46;
                *(float *)&double v48 = v45 + (float)((float)((float)(v37 - (float)(int)v41) / 192.0) * v27);
                LODWORD(v38) = v89;
                v49 = [NSNumber numberWithFloat:v48];
                *(float *)&double v50 = 1.0 - (float)(v47 + (float)((float)((float)(v40 - (float)(int)v38) * 0.0039062) * v28));
                v94[0] = v49;
                v51 = [NSNumber numberWithFloat:v50];
                v94[1] = v51;
                *(float *)&double v52 = v43;
                v53 = [NSNumber numberWithFloat:v52];
                v94[2] = v53;
                v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:3];
                [v80 addObject:v54];

                float v32 = v32 + v43;
              }
              uint64_t v30 = [v29 countByEnumeratingWithState:&v81 objects:v95 count:16];
              if (v30) {
                continue;
              }
              break;
            }
          }
          else
          {
            float v32 = 0.0;
          }

          [v76 setObject:v80 forKeyedSubscript:@"humanKeypoints"];
          v102.origin.x = v67;
          v102.origin.y = v66;
          v102.size.width = (float)(v65 - v64);
          v102.size.height = (float)(v63 - v62);
          v55 = NSStringFromRect(v102);
          [v76 setObject:v55 forKeyedSubscript:@"humanBounds"];

          *(float *)&double v56 = v32 / 17.0;
          v57 = [NSNumber numberWithFloat:v56];
          [v76 setObject:v57 forKeyedSubscript:@"humanConfidence"];

          results = v74->_results;
          v92 = @"attributes";
          v93 = v76;
          v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v93 forKeys:&v92 count:1];
          [(NSMutableArray *)results addObject:v59];
        }
        uint64_t v68 = [obj countByEnumeratingWithState:&v85 objects:v100 count:16];
        if (v68) {
          continue;
        }
        break;
      }
    }

    v60 = v74->_results;
    if (v60)
    {
      v90 = @"HumanPoseResults";
      v91 = v60;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v91 forKeys:&v90 count:1];
      int v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v10 = 0;
    }
  }
LABEL_33:

  return v10;
}

- (int)preferredInputFormat:(int *)a3 height:(int *)a4 format:(unsigned int *)a5
{
  int result = -50;
  if (a3 && a4)
  {
    if (a5)
    {
      int result = 0;
      *a3 = self->_inputWidth;
      *a4 = self->_inputHeight;
      *a5 = 1111970369;
    }
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_personKeypointsDetector, 0);
  objc_storeStrong((id *)&self->_ANSTPersonDetector, 0);
}

@end