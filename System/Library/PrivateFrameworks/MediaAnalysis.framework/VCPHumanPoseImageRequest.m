@interface VCPHumanPoseImageRequest
+ (int)parseResults:(id)a3 observations:(id)a4 revision:(unsigned int)a5;
- (BOOL)cleanupWithOptions:(id)a3 error:(id *)a4;
- (BOOL)updateWithOptions:(id)a3 error:(id *)a4;
- (CGSize)preferredInputSizeWithOptions:(id)a3 error:(id *)a4;
- (VCPHumanPoseImageRequest)init;
- (VCPHumanPoseImageRequest)initWithOptions:(id)a3;
- (id)processImage:(__CVBuffer *)a3 withOptions:(id)a4 error:(id *)a5;
- (unsigned)preferredPixelFormat;
@end

@implementation VCPHumanPoseImageRequest

- (VCPHumanPoseImageRequest)init
{
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_ERROR, "Not implemented, please use initWithOptions", v5, 2u);
    }
  }
  return 0;
}

- (VCPHumanPoseImageRequest)initWithOptions:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)VCPHumanPoseImageRequest;
  v5 = [(VCPRequest *)&v25 initWithOptions:v4];
  v7 = v5;
  if (v5)
  {
    int width = v5->super._width;
    if (width < 1 || (int height = v5->super._height, height < 1))
    {
      v10 = 0;
    }
    else
    {
      *(float *)&double v6 = (float)width / (float)height;
      v10 = [NSNumber numberWithFloat:v6];
    }
    v7->super._int maxNumOfPersonsForPose = (int)fmax((double)v7->super._maxNumOfPersonsForPose, 1.0);
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v11 = VCPLogInstance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        int maxNumOfPersonsForPose = v7->super._maxNumOfPersonsForPose;
        unsigned int revision = v7->super._revision;
        *(_DWORD *)buf = 67109376;
        int v27 = maxNumOfPersonsForPose;
        __int16 v28 = 1024;
        unsigned int v29 = revision;
        _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_DEBUG, "VCPHumanPoseImageRequest - max num of persons for pose = %d, _unsigned int revision = %d", buf, 0xEu);
      }
    }
    unsigned int v14 = v7->super._revision;
    switch(v14)
    {
      case 3u:
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          v18 = VCPLogInstance();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_DEBUG, "VCPHumanPoseImageRequest - use holistic human pose detector", buf, 2u);
          }
        }
        v16 = [[VCPImageHumanPoseAnalyzerHolistic alloc] initWithMaxNumRegionsPersons:v7->super._maxNumOfPersonsForPose forceCPU:v7->super._useCPUOnly sharedModel:0 inputConfig:&stru_1F15A0D70];
        uint64_t v17 = 80;
        break;
      case 2u:
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          v19 = VCPLogInstance();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_DEBUG, "VCPHumanPoseImageRequest - use top-down human pose detector", buf, 2u);
          }
        }
        v16 = [[VCPImageHumanPoseAnalyzerTopDown alloc] initWithMaxNumRegions:v7->super._maxNumOfPersonsForPose forceCPU:v7->super._useCPUOnly sharedModel:0 inputConfig:&stru_1F15A0D70];
        uint64_t v17 = 72;
        break;
      case 1u:
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          v15 = VCPLogInstance();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_DEBUG, "VCPHumanPoseImageRequest - use bottom-up human pose detector", buf, 2u);
          }
        }
        v16 = [[VCPImageHumanPoseAnalyzer alloc] initWithKeypointsOption:1 aspectRatio:v10 lightweight:0 forceCPU:v7->super._useCPUOnly sharedModel:0 flushModel:0];
        uint64_t v17 = 64;
        break;
      default:
LABEL_29:

        goto LABEL_30;
    }
    v20 = (id *)((char *)&v7->super.super.isa + v17);
    v21 = *(Class *)((char *)&v7->super.super.isa + v17);
    id *v20 = v16;

    [*v20 preferredInputFormat:&v7->_preferredWidth height:&v7->_preferredHeight format:&v7->_preferredFormat];
    goto LABEL_29;
  }
LABEL_30:
  if (v7->_analyzerBottomUp || v7->_analyzerTopDown || (analyzerHolistic = v7->_analyzerHolistic) != 0) {
    analyzerHolistic = v7;
  }
  v23 = analyzerHolistic;

  return v23;
}

+ (int)parseResults:(id)a3 observations:(id)a4 revision:(unsigned int)a5
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v78 = a4;
  v75 = v7;
  if (v78)
  {
    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    obuint64_t j = v7;
    uint64_t v74 = [obj countByEnumeratingWithState:&v93 objects:v100 count:16];
    if (v74)
    {
      unsigned int v70 = a5;
      uint64_t v76 = *(void *)v94;
      while (2)
      {
        for (uint64_t i = 0; i != v74; ++i)
        {
          if (*(void *)v94 != v76) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v93 + 1) + 8 * i);
          v10 = [v9 objectForKeyedSubscript:@"attributes"];
          id v79 = [v10 objectForKeyedSubscript:@"humanConfidence"];

          v11 = v79;
          if (v79)
          {
            [v79 floatValue];
            v11 = v79;
            if (v12 >= 0.3)
            {
              v13 = [v9 objectForKeyedSubscript:@"attributes"];
              v73 = [v13 objectForKeyedSubscript:@"humanKeypoints"];

              if ([v73 count] != 17) {
                goto LABEL_49;
              }
              v72 = objc_alloc_init(VCPPersonObservation);
              unsigned int v14 = [MEMORY[0x1E4F1CA48] array];
              long long v91 = 0u;
              long long v92 = 0u;
              long long v89 = 0u;
              long long v90 = 0u;
              id v80 = v73;
              uint64_t v15 = [v80 countByEnumeratingWithState:&v89 objects:v99 count:16];
              if (v15)
              {
                uint64_t v16 = *(void *)v90;
                while (2)
                {
                  for (uint64_t j = 0; j != v15; ++j)
                  {
                    if (*(void *)v90 != v16) {
                      objc_enumerationMutation(v80);
                    }
                    v18 = *(void **)(*((void *)&v89 + 1) + 8 * j);
                    if ([v18 count] != 3)
                    {
                      v62 = v80;
                      goto LABEL_48;
                    }
                    v19 = objc_alloc_init(VCPKeypoint);
                    v20 = [v18 objectAtIndexedSubscript:0];
                    [v20 floatValue];
                    float v22 = v21;
                    v23 = [v18 objectAtIndexedSubscript:1];
                    [v23 floatValue];
                    -[VCPKeypoint setLocation:](v19, "setLocation:", v22, v24);

                    objc_super v25 = [v18 objectAtIndexedSubscript:2];
                    [v25 floatValue];
                    -[VCPKeypoint setConfidence:](v19, "setConfidence:");

                    [v14 addObject:v19];
                  }
                  uint64_t v15 = [v80 countByEnumeratingWithState:&v89 objects:v99 count:16];
                  if (v15) {
                    continue;
                  }
                  break;
                }
              }

              [(VCPPersonObservation *)v72 setKeypoints:v14];
              uint64_t v26 = v70;
              if (v70 == 3)
              {
                int v27 = [v9 objectForKeyedSubscript:@"attributes"];
                v67 = [v27 objectForKeyedSubscript:@"humanID"];

                __int16 v28 = [v9 objectForKeyedSubscript:@"attributes"];
                unsigned int v29 = [v28 objectForKeyedSubscript:@"handsLeft"];
                v69 = [v29 objectForKeyedSubscript:@"handsKeypoints"];

                uint64_t v30 = [v9 objectForKeyedSubscript:@"attributes"];
                v31 = [v30 objectForKeyedSubscript:@"handsLeft"];
                aString = [v31 objectForKeyedSubscript:@"handsBounds"];

                v32 = [v9 objectForKeyedSubscript:@"attributes"];
                v33 = [v32 objectForKeyedSubscript:@"handsRight"];
                v68 = [v33 objectForKeyedSubscript:@"handsKeypoints"];

                v34 = [v9 objectForKeyedSubscript:@"attributes"];
                v35 = [v34 objectForKeyedSubscript:@"handsRight"];
                v64 = [v35 objectForKeyedSubscript:@"handsBounds"];

                if (v69)
                {
                  if (objc_msgSend(v69, "count", v64) != 21) {
                    goto LABEL_54;
                  }
                  v36 = [MEMORY[0x1E4F1CA48] array];
                  long long v87 = 0u;
                  long long v88 = 0u;
                  long long v85 = 0u;
                  long long v86 = 0u;
                  id v71 = v69;
                  uint64_t v37 = [v71 countByEnumeratingWithState:&v85 objects:v98 count:16];
                  if (v37)
                  {
                    uint64_t v38 = *(void *)v86;
LABEL_23:
                    uint64_t v39 = 0;
                    while (1)
                    {
                      if (*(void *)v86 != v38) {
                        objc_enumerationMutation(v71);
                      }
                      v40 = *(void **)(*((void *)&v85 + 1) + 8 * v39);
                      if ([v40 count] != 4) {
                        goto LABEL_53;
                      }
                      v41 = objc_alloc_init(VCPKeypoint);
                      v42 = [v40 objectAtIndexedSubscript:0];
                      [v42 floatValue];
                      float v44 = v43;
                      v45 = [v40 objectAtIndexedSubscript:1];
                      [v45 floatValue];
                      -[VCPKeypoint setLocation:](v41, "setLocation:", v44, v46);

                      v47 = [v40 objectAtIndexedSubscript:2];
                      [v47 floatValue];
                      -[VCPKeypoint setConfidence:](v41, "setConfidence:");

                      [v36 addObject:v41];
                      if (v37 == ++v39)
                      {
                        uint64_t v37 = [v71 countByEnumeratingWithState:&v85 objects:v98 count:16];
                        if (v37) {
                          goto LABEL_23;
                        }
                        break;
                      }
                    }
                  }

                  v48 = objc_alloc_init(VCPHandObservation);
                  [(VCPHandObservation *)v48 setKeypoints:v36];
                  [(VCPHandObservation *)v48 setChirality:0xFFFFFFFFLL];
                  -[VCPHandObservation setGroupID:](v48, "setGroupID:", [v67 intValue]);
                  NSRect v102 = NSRectFromString(aString);
                  -[VCPHandObservation setBounds:](v48, "setBounds:", v102.origin.x, v102.origin.y, v102.size.width, v102.size.height);
                  [(VCPPersonObservation *)v72 setLeftHand:v48];
                }
                if (v68)
                {
                  if ([v68 count] != 21) {
                    goto LABEL_54;
                  }
                  v36 = [MEMORY[0x1E4F1CA48] array];
                  long long v83 = 0u;
                  long long v84 = 0u;
                  long long v81 = 0u;
                  long long v82 = 0u;
                  id v71 = v68;
                  uint64_t v49 = [v71 countByEnumeratingWithState:&v81 objects:v97 count:16];
                  if (v49)
                  {
                    uint64_t v50 = *(void *)v82;
LABEL_34:
                    uint64_t v51 = 0;
                    while (1)
                    {
                      if (*(void *)v82 != v50) {
                        objc_enumerationMutation(v71);
                      }
                      v52 = *(void **)(*((void *)&v81 + 1) + 8 * v51);
                      if (objc_msgSend(v52, "count", v64) != 4) {
                        break;
                      }
                      v53 = objc_alloc_init(VCPKeypoint);
                      v54 = [v52 objectAtIndexedSubscript:0];
                      [v54 floatValue];
                      float v56 = v55;
                      v57 = [v52 objectAtIndexedSubscript:1];
                      [v57 floatValue];
                      -[VCPKeypoint setLocation:](v53, "setLocation:", v56, v58);

                      v59 = [v52 objectAtIndexedSubscript:2];
                      [v59 floatValue];
                      -[VCPKeypoint setConfidence:](v53, "setConfidence:");

                      [v36 addObject:v53];
                      if (v49 == ++v51)
                      {
                        uint64_t v49 = [v71 countByEnumeratingWithState:&v81 objects:v97 count:16];
                        if (v49) {
                          goto LABEL_34;
                        }
                        goto LABEL_40;
                      }
                    }
LABEL_53:

LABEL_54:
                    v62 = v67;
LABEL_48:

LABEL_49:
                    int v61 = -18;
                    goto LABEL_51;
                  }
LABEL_40:

                  v60 = objc_alloc_init(VCPHandObservation);
                  [(VCPHandObservation *)v60 setKeypoints:v36];
                  [(VCPHandObservation *)v60 setChirality:1];
                  -[VCPHandObservation setGroupID:](v60, "setGroupID:", [v67 intValue]);
                  NSRect v103 = NSRectFromString(v64);
                  -[VCPHandObservation setBounds:](v60, "setBounds:", v103.origin.x, v103.origin.y, v103.size.width, v103.size.height);
                  [(VCPPersonObservation *)v72 setRightHand:v60];
                }
                -[VCPPersonObservation setPersonID:](v72, "setPersonID:", objc_msgSend(v67, "intValue", v64));

                uint64_t v26 = 3;
              }
              [(VCPPersonObservation *)v72 setRevision:v26];
              [v78 addObject:v72];

              v11 = v79;
            }
          }
        }
        int v61 = 0;
        uint64_t v74 = [obj countByEnumeratingWithState:&v93 objects:v100 count:16];
        if (v74) {
          continue;
        }
        break;
      }
    }
    else
    {
      int v61 = 0;
    }
LABEL_51:
  }
  else
  {
    int v61 = -50;
  }

  return v61;
}

- (id)processImage:(__CVBuffer *)a3 withOptions:(id)a4 error:(id *)a5
{
  v29[1] = *MEMORY[0x1E4F143B8];
  v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3, a4);
  uint64_t v27 = 0;
  analyzerBottomUp = self->_analyzerBottomUp;
  analyzerTopDown = self->_analyzerTopDown;
  if (analyzerBottomUp)
  {
    if (!analyzerTopDown)
    {
      objc_super v25 = 0;
      int v11 = [(VCPImageHumanPoseAnalyzer *)analyzerBottomUp analyzePixelBuffer:a3 flags:&v27 results:&v25 cancel:&__block_literal_global_202];
      float v12 = v25;
      goto LABEL_6;
    }
LABEL_5:
    uint64_t v26 = 0;
    int v11 = [(VCPImageHumanPoseAnalyzerTopDown *)analyzerTopDown analyzePixelBuffer:a3 flags:&v27 results:&v26 cancel:&__block_literal_global_8];
    float v12 = v26;
    goto LABEL_6;
  }
  if (analyzerTopDown) {
    goto LABEL_5;
  }
  analyzerHolistic = self->_analyzerHolistic;
  if (!analyzerHolistic)
  {
    unsigned int v14 = 0;
    int v11 = -18;
    goto LABEL_7;
  }
  float v24 = 0;
  int v11 = [(VCPImageHumanPoseAnalyzerHolistic *)analyzerHolistic analyzePixelBuffer:a3 flags:&v27 results:&v24 cancel:&__block_literal_global_204];
  float v12 = v24;
LABEL_6:
  id v13 = v12;
  unsigned int v14 = v13;
  if (!v11)
  {
    v18 = [v13 objectForKeyedSubscript:@"HumanPoseResults"];
    BOOL v19 = v18 == 0;

    if (v19
      || (v20 = objc_opt_class(),
          [v14 objectForKeyedSubscript:@"HumanPoseResults"],
          float v21 = objc_claimAutoreleasedReturnValue(),
          int v11 = [v20 parseResults:v21 observations:v8 revision:self->super._revision],
          v21,
          !v11))
    {
      a5 = v8;
      goto LABEL_12;
    }
  }
LABEL_7:
  if (a5)
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = *MEMORY[0x1E4F28568];
    uint64_t v16 = [NSString stringWithFormat:@"Error: failed to processImage"];
    v29[0] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    *a5 = [v15 errorWithDomain:*MEMORY[0x1E4F28760] code:v11 userInfo:v17];

    a5 = 0;
  }
LABEL_12:

  return a5;
}

uint64_t __59__VCPHumanPoseImageRequest_processImage_withOptions_error___block_invoke()
{
  return 0;
}

uint64_t __59__VCPHumanPoseImageRequest_processImage_withOptions_error___block_invoke_2()
{
  return 0;
}

uint64_t __59__VCPHumanPoseImageRequest_processImage_withOptions_error___block_invoke_3()
{
  return 0;
}

- (BOOL)updateWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int width = self->super._width;
  int height = self->super._height;
  v25.receiver = self;
  v25.super_class = (Class)VCPHumanPoseImageRequest;
  [(VCPRequest *)&v25 updateWithOptions:v6 error:a4];
  analyzerBottomUp = self->_analyzerBottomUp;
  if (!analyzerBottomUp) {
    goto LABEL_13;
  }
  int v11 = self->super._width;
  if (width == v11)
  {
    int v12 = self->super._height;
    if (width < 1 || height == v12) {
      goto LABEL_13;
    }
  }
  else
  {
    if (v11 < 1) {
      goto LABEL_13;
    }
    int v12 = self->super._height;
  }
  if (v12 >= 1)
  {
    *(float *)&double v9 = (float)v11 / (float)v12;
    unsigned int v14 = [NSNumber numberWithFloat:v9];
    LODWORD(analyzerBottomUp) = [analyzerBottomUp updateModelForAspectRatio:v14];

    if (analyzerBottomUp) {
      goto LABEL_41;
    }
  }
LABEL_13:
  analyzerTopDown = self->_analyzerTopDown;
  if (!analyzerTopDown) {
    goto LABEL_27;
  }
  int v16 = self->super._width;
  if (width == v16)
  {
    int v17 = self->super._height;
    if (width >= 1 && height != v17)
    {
LABEL_23:
      if (v17 >= 1)
      {
        LODWORD(analyzerBottomUp) = -[VCPImageHumanPoseAnalyzerTopDown updateInputWidth:Height:](self->_analyzerTopDown, "updateInputWidth:Height:");
        if (analyzerBottomUp) {
          goto LABEL_41;
        }
        analyzerTopDown = self->_analyzerTopDown;
      }
    }
  }
  else if (v16 >= 1)
  {
    int v17 = self->super._height;
    goto LABEL_23;
  }
  BOOL v19 = [v6 objectForKeyedSubscript:@"maxNumOfPersons"];
  [(VCPImageHumanPoseAnalyzerTopDown *)analyzerTopDown updateMaxNumPersons:v19];

LABEL_27:
  analyzerBottomUp = self->_analyzerHolistic;
  if (!analyzerBottomUp) {
    goto LABEL_41;
  }
  int v20 = self->super._width;
  if (width == v20)
  {
    int v21 = self->super._height;
    if (width < 1 || height == v21) {
      goto LABEL_40;
    }
  }
  else
  {
    if (v20 < 1)
    {
LABEL_40:
      v23 = [v6 objectForKeyedSubscript:@"maxNumOfPersons"];
      [analyzerBottomUp updateMaxNumPersons:v23];

      LODWORD(analyzerBottomUp) = 0;
      goto LABEL_41;
    }
    int v21 = self->super._height;
  }
  if (v21 < 1) {
    goto LABEL_40;
  }
  LODWORD(analyzerBottomUp) = -[VCPImageHumanPoseAnalyzerHolistic updateInputWidth:Height:](self->_analyzerHolistic, "updateInputWidth:Height:");
  if (!analyzerBottomUp)
  {
    analyzerBottomUp = self->_analyzerHolistic;
    goto LABEL_40;
  }
LABEL_41:

  return analyzerBottomUp == 0;
}

- (CGSize)preferredInputSizeWithOptions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  analyzerBottomUp = self->_analyzerBottomUp;
  if (analyzerBottomUp) {
    [(VCPImageHumanPoseAnalyzer *)analyzerBottomUp preferredInputFormat:&self->_preferredWidth height:&self->_preferredHeight format:&self->_preferredFormat];
  }
  analyzerTopDown = self->_analyzerTopDown;
  if (analyzerTopDown) {
    [(VCPImageHumanPoseAnalyzerTopDown *)analyzerTopDown preferredInputFormat:&self->_preferredWidth height:&self->_preferredHeight format:&self->_preferredFormat];
  }
  analyzerHolistic = self->_analyzerHolistic;
  if (analyzerHolistic) {
    [(VCPImageHumanPoseAnalyzerHolistic *)analyzerHolistic preferredInputFormat:&self->_preferredWidth height:&self->_preferredHeight format:&self->_preferredFormat];
  }
  double preferredWidth = (double)self->_preferredWidth;
  double preferredHeight = (double)self->_preferredHeight;

  double v11 = preferredWidth;
  double v12 = preferredHeight;
  result.int height = v12;
  result.int width = v11;
  return result;
}

- (unsigned)preferredPixelFormat
{
  return self->_preferredFormat;
}

- (BOOL)cleanupWithOptions:(id)a3 error:(id *)a4
{
  analyzerBottomUp = self->_analyzerBottomUp;
  self->_analyzerBottomUp = 0;

  analyzerTopDown = self->_analyzerTopDown;
  self->_analyzerTopDown = 0;

  analyzerHolistic = self->_analyzerHolistic;
  self->_analyzerHolistic = 0;

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyzerHolistic, 0);
  objc_storeStrong((id *)&self->_analyzerTopDown, 0);
  objc_storeStrong((id *)&self->_analyzerBottomUp, 0);
}

@end