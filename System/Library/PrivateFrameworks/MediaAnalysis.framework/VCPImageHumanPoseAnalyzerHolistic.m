@interface VCPImageHumanPoseAnalyzerHolistic
- (VCPImageHumanPoseAnalyzerHolistic)initWithMaxNumRegionsPersons:(int)a3 forceCPU:(BOOL)a4 sharedModel:(BOOL)a5 inputConfig:(id)a6;
- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6;
- (int)convertSingleResultToDict:(CGPoint)a3[21] keypointConfidence:(float *)a4 box:(id)a5 leftHandsResults:(id)a6 RightHandsResults:(id)a7;
- (int)preferredInputFormat:(int *)a3 height:(int *)a4 format:(unsigned int *)a5;
- (int)updateInputWidth:(int)a3 Height:(int)a4;
- (int)updateMaxNumPersons:(id)a3;
@end

@implementation VCPImageHumanPoseAnalyzerHolistic

- (VCPImageHumanPoseAnalyzerHolistic)initWithMaxNumRegionsPersons:(int)a3 forceCPU:(BOOL)a4 sharedModel:(BOOL)a5 inputConfig:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)VCPImageHumanPoseAnalyzerHolistic;
  v9 = [(VCPImageHumanPoseAnalyzerHolistic *)&v26 init];
  v10 = v9;
  if (v9)
  {
    double v11 = fmax((double)a3, 1.0);
    v9->_maxNumRegionsPerson = (int)v11;
    v9->_maxNumRegionsHands = 2 * (int)v11;
    v12 = [VCPANSTHandsBodyDetector alloc];
    LODWORD(v13) = 1068149419;
    LODWORD(v14) = 0.25;
    uint64_t v15 = [(VCPANSTHandsBodyDetector *)v12 initWithHandExtendRatio:v10->_maxNumRegionsPerson inputRatio:v14 maxNumPersonRegions:v13];
    ANSTPersonDetector = v10->_ANSTPersonDetector;
    v10->_ANSTPersonDetector = (VCPANSTHandsBodyDetector *)v15;

    v17 = [[VCPCNNPersonKeypointsDetector alloc] initWithForceCPU:v7 sharedModel:v6];
    personKeypointsDetector = v10->_personKeypointsDetector;
    v10->_personKeypointsDetector = v17;

    uint64_t v19 = +[VCPCNNHandKeypointsDetector detector:v7 sharedModel:v6 modelName:@"hand_keypoint_detector_lite.espresso.net" enableHandObject:1 options:0];
    handsKeypointsDetector = v10->_handsKeypointsDetector;
    v10->_handsKeypointsDetector = (VCPCNNHandKeypointsDetector *)v19;

    uint64_t v21 = [MEMORY[0x1E4F1CA48] array];
    results = v10->_results;
    v10->_results = (NSMutableArray *)v21;

    v10->_inputWidth = 640;
    v10->_inputHeight = 640;
    v23 = v10->_ANSTPersonDetector;
    if (v23)
    {
      v23 = v10->_personKeypointsDetector;
      if (v23)
      {
        if (v10->_handsKeypointsDetector) {
          v23 = v10;
        }
        else {
          v23 = 0;
        }
      }
    }
    v24 = v23;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (int)updateInputWidth:(int)a3 Height:(int)a4
{
  self->_inputWidth = a3;
  self->_inputHeight = a4;
  return 0;
}

- (int)convertSingleResultToDict:(CGPoint)a3[21] keypointConfidence:(float *)a4 box:(id)a5 leftHandsResults:(id)a6 RightHandsResults:(id)a7
{
  v76[6] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v69 = a6;
  id v68 = a7;
  v73 = [MEMORY[0x1E4F1CA48] array];
  v70 = [MEMORY[0x1E4F1CA48] array];
  v71 = [MEMORY[0x1E4F1CA60] dictionary];
  double v11 = NSNumber;
  [v10 minX];
  v12 = objc_msgSend(v11, "numberWithFloat:");
  v76[0] = v12;
  double v13 = NSNumber;
  [v10 minY];
  double v14 = objc_msgSend(v13, "numberWithFloat:");
  v76[1] = v14;
  uint64_t v15 = NSNumber;
  [v10 maxX];
  v16 = objc_msgSend(v15, "numberWithFloat:");
  v76[2] = v16;
  v17 = NSNumber;
  [v10 maxY];
  v18 = objc_msgSend(v17, "numberWithFloat:");
  v76[3] = v18;
  uint64_t v19 = NSNumber;
  [v10 confidence];
  v20 = objc_msgSend(v19, "numberWithFloat:");
  v76[4] = v20;
  uint64_t v21 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "classIndex"));
  v76[5] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:6];
  [v70 addObject:v22];

  [v10 minX];
  float v24 = v23;
  [v10 minY];
  float v26 = v25;
  [v10 maxX];
  float v28 = v27;
  [v10 minX];
  float v30 = v29;
  [v10 maxY];
  float v32 = v31;
  [v10 minY];
  uint64_t v33 = 0;
  double v66 = (float)(v28 - v30);
  double v67 = v24;
  double v64 = v26;
  double v65 = (float)(v32 - v34);
  p_y = &a3->y;
  do
  {
    objc_msgSend(v10, "maxX", *(void *)&v64, *(void *)&v65, *(void *)&v66, *(void *)&v67);
    float v37 = v36;
    [v10 minX];
    float v39 = v38;
    [v10 maxY];
    float v41 = v40;
    [v10 minY];
    float v43 = v42;
    if (*(p_y - 1) == 0.0 && (double v44 = *p_y, *p_y == 0.0))
    {
      v74[0] = &unk_1F15EAC88;
      v74[1] = &unk_1F15EAC88;
      *(float *)&double v44 = a4[v33];
      v52 = [NSNumber numberWithFloat:v44];
      v74[2] = v52;
      v54 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "classIndex"));
      v74[3] = v54;
      v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:4];
      [v73 addObject:v56];
    }
    else
    {
      [v10 minX];
      float v46 = v45;
      double v47 = *(p_y - 1);
      [v10 minY];
      float v49 = v48;
      double v50 = v46 + v47 / 192.0 * (float)(v37 - v39);
      *(float *)&double v50 = v50;
      double v51 = *p_y;
      v52 = [NSNumber numberWithFloat:v50];
      double v53 = v49 + v51 / 192.0 * (float)(v41 - v43);
      *(float *)&double v53 = v53;
      *(float *)&double v53 = 1.0 - *(float *)&v53;
      v75[0] = v52;
      v54 = [NSNumber numberWithFloat:v53];
      v75[1] = v54;
      *(float *)&double v55 = a4[v33];
      v56 = [NSNumber numberWithFloat:v55];
      v75[2] = v56;
      v57 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "classIndex"));
      v75[3] = v57;
      v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:4];
      [v73 addObject:v58];
    }
    ++v33;
    p_y += 2;
  }
  while (v33 != 21);
  [v71 setObject:v73 forKeyedSubscript:@"handsKeypoints"];
  v59 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "trackID"));
  [v71 setObject:v59 forKeyedSubscript:@"handsTrackingID"];

  v60 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "groupID"));
  [v71 setObject:v60 forKeyedSubscript:@"handsGroupID"];

  v77.size.height = v65;
  v77.origin.y = 1.0 - v64 - v65;
  v77.size.width = v66;
  v77.origin.x = v67;
  v61 = NSStringFromRect(v77);
  [v71 setObject:v61 forKeyedSubscript:@"handsBounds"];

  if ([v10 classIndex] == -1)
  {
    v62 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "groupID"));
    [v69 setObject:v71 forKeyedSubscript:v62];
    goto LABEL_12;
  }
  if ([v10 classIndex] == 1)
  {
    v62 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "groupID"));
    [v68 setObject:v71 forKeyedSubscript:v62];
LABEL_12:
  }
  return 0;
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6
{
  uint64_t v158 = *MEMORY[0x1E4F143B8];
  id v101 = a6;
  v103 = [MEMORY[0x1E4F1CA48] array];
  v102 = [MEMORY[0x1E4F1CA48] array];
  v104 = [MEMORY[0x1E4F1CA80] set];
  int v157 = 0;
  memset(v156, 0, sizeof(v156));
  uint64_t v134 = 0;
  int Width = CVPixelBufferGetWidth(a3);
  v109 = a3;
  int Height = CVPixelBufferGetHeight(a3);
  v116 = [MEMORY[0x1E4F1CA60] dictionary];
  v114 = [MEMORY[0x1E4F1CA60] dictionary];
  v113 = [MEMORY[0x1E4F1CA60] dictionary];
  v100 = a5;
  [(NSMutableArray *)self->_results removeAllObjects];
  int v10 = [(VCPANSTHandsBodyDetector *)self->_ANSTPersonDetector anstDetection:v109 rotationInDegrees:0 detectingFullbody:1 detectingHands:1 handsRegions:v102 personRegions:v103 cancel:v101];
  if (!v10)
  {
    long long v132 = 0u;
    long long v133 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    id v11 = v103;
    uint64_t v96 = [v11 countByEnumeratingWithState:&v130 objects:v155 count:16];
    if (v96)
    {
      float v97 = (float)((float)Height * 0.75) / (float)Width;
      uint64_t v99 = *(void *)v131;
      v98 = v11;
      while (2)
      {
        for (id i = 0; i != (id)v96; id i = (char *)i + 1)
        {
          if (*(void *)v131 != v99) {
            objc_enumerationMutation(v11);
          }
          v12 = *(void **)(*((void *)&v130 + 1) + 8 * i);
          double v13 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v12, "groupID"));
          [v104 addObject:v13];

          v108 = [MEMORY[0x1E4F1CA48] array];
          int v10 = -[VCPCNNPersonKeypointsDetector analyzeFrame:withBox:keypoints:padX:padY:](self->_personKeypointsDetector, "analyzeFrame:withBox:keypoints:padX:padY:", v109, v12);
          if (v10) {
            goto LABEL_51;
          }
          obuint64_t j = [MEMORY[0x1E4F1CA48] array];
          v107 = [MEMORY[0x1E4F1CA60] dictionary];
          [v12 minX];
          float v95 = v14;
          [v12 minY];
          float v94 = v15;
          [v12 maxX];
          float v93 = v16;
          [v12 minX];
          float v92 = v17;
          [v12 maxY];
          float v91 = v18;
          [v12 minY];
          float v90 = v19;
          [v12 maxX];
          float v21 = v20;
          [v12 minX];
          float v23 = v22;
          [v12 maxY];
          float v25 = v24;
          [v12 minY];
          float v27 = v26;
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            float v28 = VCPLogInstance();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 67109376;
              int v149 = HIDWORD(v134);
              __int16 v150 = 1024;
              int v151 = v134;
              _os_log_impl(&dword_1BBEDA000, v28, OS_LOG_TYPE_DEBUG, "VCPImageHumanPoseAnalyzerTopDown - received padX = %d, padY = %d", buf, 0xEu);
            }
          }
          float v29 = v21 - v23;
          float v30 = v25 - v27;
          if ((float)((float)(v21 - v23) / (float)(v25 - v27)) >= v97) {
            float v30 = v29 / v97;
          }
          else {
            float v29 = v97 * v30;
          }
          if ([v108 count] != 17)
          {
LABEL_50:

            int v10 = -18;
LABEL_51:

            goto LABEL_53;
          }
          long long v128 = 0u;
          long long v129 = 0u;
          long long v126 = 0u;
          long long v127 = 0u;
          id v31 = v108;
          uint64_t v32 = [v31 countByEnumeratingWithState:&v126 objects:v154 count:16];
          if (v32)
          {
            uint64_t v33 = *(void *)v127;
            float v34 = 0.0;
            while (2)
            {
              for (uint64_t j = 0; j != v32; ++j)
              {
                if (*(void *)v127 != v33) {
                  objc_enumerationMutation(v31);
                }
                float v36 = *(void **)(*((void *)&v126 + 1) + 8 * j);
                if ([v36 count] != 3)
                {

                  goto LABEL_50;
                }
                float v37 = [v36 objectAtIndexedSubscript:0];
                [v37 floatValue];
                float v39 = v38;

                float v40 = [v36 objectAtIndexedSubscript:1];
                [v40 floatValue];
                float v42 = v41;

                float v43 = [v36 objectAtIndexedSubscript:2];
                [v43 floatValue];
                float v45 = v44;

                [v12 minX];
                float v47 = v46;
                LODWORD(v43) = HIDWORD(v134);
                [v12 minY];
                float v49 = v48;
                *(float *)&double v50 = v47 + (float)((float)((float)(v39 - (float)(int)v43) / 192.0) * v29);
                LODWORD(v43) = v134;
                double v51 = [NSNumber numberWithFloat:v50];
                *(float *)&double v52 = 1.0 - (float)(v49 + (float)((float)((float)(v42 - (float)(int)v43) * 0.0039062) * v30));
                v153[0] = v51;
                double v53 = [NSNumber numberWithFloat:v52];
                v153[1] = v53;
                *(float *)&double v54 = v45;
                double v55 = [NSNumber numberWithFloat:v54];
                v153[2] = v55;
                v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v153 count:3];
                [obj addObject:v56];

                float v34 = v34 + v45;
              }
              uint64_t v32 = [v31 countByEnumeratingWithState:&v126 objects:v154 count:16];
              if (v32) {
                continue;
              }
              break;
            }
          }
          else
          {
            float v34 = 0.0;
          }

          [v107 setObject:obj forKeyedSubscript:@"humanKeypoints"];
          v159.origin.x = v95;
          v159.origin.y = v94;
          v159.size.width = (float)(v93 - v92);
          v159.size.height = (float)(v91 - v90);
          v57 = NSStringFromRect(v159);
          [v107 setObject:v57 forKeyedSubscript:@"humanBounds"];

          *(float *)&double v58 = v34 / 17.0;
          v59 = [NSNumber numberWithFloat:v58];
          [v107 setObject:v59 forKeyedSubscript:@"humanConfidence"];

          v60 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v12, "groupID"));
          [v116 setObject:v107 forKeyedSubscript:v60];

          id v11 = v98;
        }
        uint64_t v96 = [v98 countByEnumeratingWithState:&v130 objects:v155 count:16];
        if (v96) {
          continue;
        }
        break;
      }
    }

    long long v124 = 0u;
    long long v125 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    id obja = v102;
    uint64_t v61 = [obja countByEnumeratingWithState:&v122 objects:v152 count:16];
    if (v61)
    {
      uint64_t v62 = *(void *)v123;
      while (2)
      {
        for (uint64_t k = 0; k != v61; ++k)
        {
          if (*(void *)v123 != v62) {
            objc_enumerationMutation(obja);
          }
          double v64 = *(void **)(*((void *)&v122 + 1) + 8 * k);
          double v65 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v64, "groupID"));
          [v104 addObject:v65];

          int v121 = 0;
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            double v66 = VCPLogInstance();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
            {
              [v64 minX];
              float v68 = v67;
              [v64 minY];
              float v70 = v69;
              [v64 maxX];
              float v72 = v71;
              [v64 maxY];
              *(_DWORD *)v140 = 134218752;
              double v141 = v68;
              __int16 v142 = 2048;
              double v143 = v70;
              __int16 v144 = 2048;
              double v145 = v72;
              __int16 v146 = 2048;
              double v147 = v73;
              _os_log_impl(&dword_1BBEDA000, v66, OS_LOG_TYPE_DEBUG, "hand box minX = %f, minY = %f, maxX = %f, maxY = %f", v140, 0x2Au);
            }
          }
          int v10 = [(VCPCNNHandKeypointsDetector *)self->_handsKeypointsDetector handKeypointsDetection:v109 box:v64 keypoints:buf keypointConfidence:v156 handHoldsObjectConfidence:&v121];
          if (v10)
          {

            goto LABEL_53;
          }
          [(VCPImageHumanPoseAnalyzerHolistic *)self convertSingleResultToDict:buf keypointConfidence:v156 box:v64 leftHandsResults:v114 RightHandsResults:v113];
        }
        uint64_t v61 = [obja countByEnumeratingWithState:&v122 objects:v152 count:16];
        if (v61) {
          continue;
        }
        break;
      }
    }

    long long v119 = 0u;
    long long v120 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    id v106 = v104;
    uint64_t v74 = [v106 countByEnumeratingWithState:&v117 objects:v139 count:16];
    if (v74)
    {
      id objb = *(id *)v118;
      do
      {
        for (uint64_t m = 0; m != v74; ++m)
        {
          if (*(id *)v118 != objb) {
            objc_enumerationMutation(v106);
          }
          uint64_t v76 = *(void *)(*((void *)&v117 + 1) + 8 * m);
          NSRect v77 = [MEMORY[0x1E4F1CA60] dictionary];
          v78 = [v116 objectForKeyedSubscript:v76];
          v79 = [v78 objectForKeyedSubscript:@"humanKeypoints"];
          [v77 setObject:v79 forKeyedSubscript:@"humanKeypoints"];

          v80 = [v116 objectForKeyedSubscript:v76];
          v81 = [v80 objectForKeyedSubscript:@"humanBounds"];
          [v77 setObject:v81 forKeyedSubscript:@"humanBounds"];

          v82 = [v116 objectForKeyedSubscript:v76];
          v83 = [v82 objectForKeyedSubscript:@"humanConfidence"];
          [v77 setObject:v83 forKeyedSubscript:@"humanConfidence"];

          v84 = [v114 objectForKeyedSubscript:v76];
          [v77 setObject:v84 forKeyedSubscript:@"handsLeft"];

          v85 = [v113 objectForKeyedSubscript:v76];
          [v77 setObject:v85 forKeyedSubscript:@"handsRight"];

          [v77 setObject:v76 forKeyedSubscript:@"humanID"];
          results = self->_results;
          v137 = @"attributes";
          v138 = v77;
          v87 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v138 forKeys:&v137 count:1];
          [(NSMutableArray *)results addObject:v87];
        }
        uint64_t v74 = [v106 countByEnumeratingWithState:&v117 objects:v139 count:16];
      }
      while (v74);
    }

    v88 = self->_results;
    if (v88)
    {
      v135 = @"HumanPoseResults";
      v136 = v88;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v136 forKeys:&v135 count:1];
      int v10 = 0;
      id *v100 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v10 = 0;
    }
  }
LABEL_53:

  return v10;
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
      _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_DEBUG, "ImageHumanPoseAnalyzerHolistic: maxNumPersons from options = %@", (uint8_t *)&v7, 0xCu);
    }
  }
  if (v4)
  {
    self->_maxNumRegionsPerson = (int)fmax((double)(int)[v4 intValue], 1.0);
    -[VCPANSTHandsBodyDetector updateMaxNumPersonRegions:](self->_ANSTPersonDetector, "updateMaxNumPersonRegions:");
  }

  return 0;
}

- (int)preferredInputFormat:(int *)a3 height:(int *)a4 format:(unsigned int *)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int result = -50;
  if (a3 && a4 && a5)
  {
    *a3 = self->_inputWidth;
    *a4 = self->_inputHeight;
    *a5 = 1111970369;
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      int v7 = VCPLogInstance();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        inputint Width = self->_inputWidth;
        inputint Height = self->_inputHeight;
        v10[0] = 67109376;
        v10[1] = inputWidth;
        __int16 v11 = 1024;
        int v12 = inputHeight;
        _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_DEBUG, "preferredInputFormat:  width = %d,  height = %d", (uint8_t *)v10, 0xEu);
      }
    }
    return 0;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_handsKeypointsDetector, 0);
  objc_storeStrong((id *)&self->_personKeypointsDetector, 0);
  objc_storeStrong((id *)&self->_ANSTPersonDetector, 0);
}

@end