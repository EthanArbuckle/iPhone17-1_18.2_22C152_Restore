@interface VCPHandPoseImageRequest
- (BOOL)cleanupWithOptions:(id)a3 error:(id *)a4;
- (BOOL)updateWithOptions:(id)a3 error:(id *)a4;
- (CGSize)preferredInputSizeWithOptions:(id)a3 error:(id *)a4;
- (VCPHandPoseImageRequest)init;
- (VCPHandPoseImageRequest)initWithOptions:(id)a3;
- (id)processImage:(__CVBuffer *)a3 withOptions:(id)a4 error:(id *)a5;
- (int)parseResults:(id)a3 observations:(id)a4;
- (unsigned)preferredPixelFormat;
@end

@implementation VCPHandPoseImageRequest

- (VCPHandPoseImageRequest)init
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

- (VCPHandPoseImageRequest)initWithOptions:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  v4 = VCPSignPostLog();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  v6 = VCPSignPostLog();
  v7 = v6;
  unint64_t v8 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "VCPHandPoseImageRequest_initWithOptions", "", buf, 2u);
  }

  v37.receiver = self;
  v37.super_class = (Class)VCPHandPoseImageRequest;
  v9 = [(VCPRequest *)&v37 initWithOptions:v36];
  v11 = v9;
  v12 = &OBJC_IVAR___MADServiceTextProcessingTask__requests;
  if (v9)
  {
    int width = v9->super._width;
    if (width < 1 || (int height = v9->super._height, height < 1))
    {
      v35 = 0;
    }
    else
    {
      *(float *)&double v10 = (float)width / (float)height;
      v35 = [NSNumber numberWithFloat:v10];
    }
    int maxNumHands = v11->super._maxNumHands;
    if (maxNumHands <= 0) {
      int maxNumHands = 6;
    }
    v11->super._int maxNumHands = maxNumHands;
    if (v11->super._enableHandPoseLite) {
      v16 = @"hand_keypoint_detector_lite.espresso.net";
    }
    else {
      v16 = @"hand_keypoint_detector_acc.espresso.net";
    }
    v17 = v16;
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      os_signpost_id_t v18 = v5;
      v19 = VCPLogInstance();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        unsigned int revision = v11->super._revision;
        BOOL enableHandDetection = v11->super._enableHandDetection;
        *(_DWORD *)buf = 67109634;
        unsigned int v39 = revision;
        __int16 v40 = 1024;
        BOOL v41 = enableHandDetection;
        __int16 v42 = 2112;
        v43 = v17;
        _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_DEBUG, "VCPHandPoseImageRequest options: _unsigned int revision = %d, enable detection = %d, model name = %@", buf, 0x18u);
      }

      v12 = &OBJC_IVAR___MADServiceTextProcessingTask__requests;
      os_signpost_id_t v5 = v18;
    }
    v22 = [VCPImageHandsAnalyzer alloc];
    LODWORD(v34) = v11->super._revision;
    HIDWORD(v32) = v11->super._width;
    LODWORD(v33) = v11->super._height;
    LOBYTE(v32) = v11->super._enableHandPoseLite;
    uint64_t v23 = -[VCPImageHandsAnalyzer initWithKeypointsOption:forceCPU:sharedModel:enableHandDetection:enableANSTHandDetection:enableRejectHandsNearBoundaries:enableHandObject:sourceWidth:sourceHeight:modelName:revision:options:](v22, "initWithKeypointsOption:forceCPU:sharedModel:enableHandDetection:enableANSTHandDetection:enableRejectHandsNearBoundaries:enableHandObject:sourceWidth:sourceHeight:modelName:revision:options:", v11->super._maxNumHands, v11->super._useCPUOnly, 0, v11->super._enableHandDetection, v11->super._enableANSTHandDetection, v11->super._enableRejectHandsNearBoundaries, v32, v33, v17, v34, v36);
    uint64_t v24 = v12[904];
    v25 = *(Class *)((char *)&v11->super.super.isa + v24);
    *(Class *)((char *)&v11->super.super.isa + v24) = (Class)v23;

    v26 = *(Class *)((char *)&v11->super.super.isa + v24);
    if (v26)
    {
      [v26 setOptimizeForDistance:v11->super._optimizeForDistance];
      [*(id *)((char *)&v11->super.super.isa + v24) preferredInputFormat:&v11->_preferredWidth height:&v11->_preferredHeight format:&v11->_preferredFormat];
    }
  }
  v27 = VCPSignPostLog();
  v28 = v27;
  if (v8 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v28, OS_SIGNPOST_INTERVAL_END, v5, "VCPHandPoseImageRequest_initWithOptions", "", buf, 2u);
  }

  if (*(Class *)((char *)&v11->super.super.isa + v12[904])) {
    v29 = v11;
  }
  else {
    v29 = 0;
  }
  v30 = v29;

  return v30;
}

- (int)parseResults:(id)a3 observations:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v38 = v6;
  id v39 = a4;
  if (v39)
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    obuint64_t j = v6;
    uint64_t v33 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v33)
    {
      uint64_t v34 = *(void *)v47;
      while (2)
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v47 != v34) {
            objc_enumerationMutation(obj);
          }
          objc_super v37 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          v7 = [v37 objectForKeyedSubscript:@"attributes"];
          __int16 v40 = [v7 objectForKeyedSubscript:@"handsKeypoints"];

          if ([v40 count] != 21)
          {
LABEL_29:

            int v31 = -18;
            goto LABEL_31;
          }
          unint64_t v8 = objc_alloc_init(VCPHandObservation);
          v9 = [MEMORY[0x1E4F1CA48] array];
          long long v44 = 0u;
          long long v45 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          id v41 = v40;
          uint64_t v10 = [v41 countByEnumeratingWithState:&v42 objects:v50 count:16];
          if (v10)
          {
            uint64_t v11 = *(void *)v43;
            while (2)
            {
              for (uint64_t j = 0; j != v10; ++j)
              {
                if (*(void *)v43 != v11) {
                  objc_enumerationMutation(v41);
                }
                v13 = *(void **)(*((void *)&v42 + 1) + 8 * j);
                if ([v13 count] != 4)
                {

                  goto LABEL_29;
                }
                v14 = objc_alloc_init(VCPKeypoint);
                v15 = [v13 objectAtIndexedSubscript:0];
                [v15 floatValue];
                float v17 = v16;
                os_signpost_id_t v18 = [v13 objectAtIndexedSubscript:1];
                [v18 floatValue];
                -[VCPKeypoint setLocation:](v14, "setLocation:", v17, v19);

                v20 = [v13 objectAtIndexedSubscript:2];
                [v20 floatValue];
                -[VCPKeypoint setConfidence:](v14, "setConfidence:");

                [v9 addObject:v14];
                if (self->super._revision == 2 && ![(VCPHandObservation *)v8 chirality])
                {
                  v21 = [v13 objectAtIndexedSubscript:3];
                  -[VCPHandObservation setChirality:](v8, "setChirality:", [v21 intValue]);
                }
                else if ([(VCPHandObservation *)v8 chirality])
                {
                  [(VCPHandObservation *)v8 setChirality:0];
                }
              }
              uint64_t v10 = [v41 countByEnumeratingWithState:&v42 objects:v50 count:16];
              if (v10) {
                continue;
              }
              break;
            }
          }

          [(VCPHandObservation *)v8 setKeypoints:v9];
          v22 = [v37 objectForKeyedSubscript:@"attributes"];
          uint64_t v23 = [v22 objectForKeyedSubscript:@"handsGroupID"];
          -[VCPHandObservation setGroupID:](v8, "setGroupID:", [v23 intValue]);

          uint64_t v24 = [v37 objectForKeyedSubscript:@"attributes"];
          v25 = [v24 objectForKeyedSubscript:@"handsTrackingID"];
          -[VCPHandObservation setHandID:](v8, "setHandID:", [v25 intValue]);

          v26 = [v37 objectForKeyedSubscript:@"attributes"];
          v27 = [v26 objectForKeyedSubscript:@"handsHoldObject"];
          [v27 floatValue];
          -[VCPHandObservation setHoldObject:](v8, "setHoldObject:");

          if (self->super._revision == 1) {
            uint64_t v28 = 1;
          }
          else {
            uint64_t v28 = 2;
          }
          [(VCPHandObservation *)v8 setRevision:v28];
          v29 = [v37 objectForKeyedSubscript:@"attributes"];
          v30 = [v29 objectForKeyedSubscript:@"handsBounds"];
          NSRect v53 = NSRectFromString(v30);
          -[VCPHandObservation setBounds:](v8, "setBounds:", v53.origin.x, v53.origin.y, v53.size.width, v53.size.height);

          [v39 addObject:v8];
        }
        int v31 = 0;
        uint64_t v33 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
        if (v33) {
          continue;
        }
        break;
      }
    }
    else
    {
      int v31 = 0;
    }
LABEL_31:
  }
  else
  {
    int v31 = -50;
  }

  return v31;
}

- (id)processImage:(__CVBuffer *)a3 withOptions:(id)a4 error:(id *)a5
{
  v7 = (NSDictionary *)a4;
  unint64_t v8 = VCPSignPostLog();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  uint64_t v10 = VCPSignPostLog();
  uint64_t v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "VCPHandPoseImageRequest_processImage", "", buf, 2u);
  }

  v12 = [(NSDictionary *)v7 objectForKeyedSubscript:@"handObjects"];

  if (v12)
  {
    v13 = [(NSDictionary *)v7 objectForKeyedSubscript:@"handObjects"];
  }
  else
  {
    v13 = 0;
  }
  v14 = [(NSDictionary *)v7 objectForKeyedSubscript:@"rotationInDegrees"];

  if (v14)
  {
    v14 = [NSNumber numberWithInt:getRotationInDegrees(v7)];
  }
  v15 = [MEMORY[0x1E4F1CA48] array];
  *(void *)buf = 0;
  analyzer = self->_analyzer;
  if (!analyzer)
  {
    v20 = 0;
    int v18 = -18;
LABEL_18:
    if (a5)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v18 userInfo:0];
      id v25 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v25 = 0;
    }
    goto LABEL_21;
  }
  [(VCPImageHandsAnalyzer *)analyzer setHandObjects:v13];
  float v17 = self->_analyzer;
  id v29 = 0;
  int v18 = [(VCPImageHandsAnalyzer *)v17 analyzePixelBuffer:a3 rotationInDegrees:v14 flags:buf results:&v29 cancel:&__block_literal_global_79];
  id v19 = v29;
  v20 = v19;
  if (v18) {
    goto LABEL_18;
  }
  v21 = [v19 objectForKeyedSubscript:@"HandsResults"];

  if (v21)
  {
    v22 = [v20 objectForKeyedSubscript:@"HandsResults"];
    int v18 = [(VCPHandPoseImageRequest *)self parseResults:v22 observations:v15];

    if (v18) {
      goto LABEL_18;
    }
  }
  uint64_t v23 = VCPSignPostLog();
  uint64_t v24 = v23;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)uint64_t v28 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v24, OS_SIGNPOST_INTERVAL_END, v9, "VCPHandPoseImageRequest_processImage", "", v28, 2u);
  }

  id v25 = v15;
LABEL_21:

  return v25;
}

uint64_t __58__VCPHandPoseImageRequest_processImage_withOptions_error___block_invoke()
{
  return 0;
}

- (BOOL)updateWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int width = self->super._width;
  int height = self->super._height;
  v17.receiver = self;
  v17.super_class = (Class)VCPHandPoseImageRequest;
  [(VCPRequest *)&v17 updateWithOptions:v6 error:a4];
  int v9 = self->super._width;
  if (width == v9)
  {
    int v10 = self->super._height;
    if (width < 1 || height == v10) {
      goto LABEL_13;
    }
  }
  else
  {
    if (v9 < 1)
    {
LABEL_13:
      analyzer = self->_analyzer;
      v14 = [v6 objectForKeyedSubscript:@"maxNumberHands"];
      [(VCPImageHandsAnalyzer *)analyzer updateMaxNumHands:v14];

      int v12 = 0;
      goto LABEL_14;
    }
    int v10 = self->super._height;
  }
  if (v10 < 1) {
    goto LABEL_13;
  }
  int v12 = -[VCPImageHandsAnalyzer updateModelForSourceWidth:sourceHeight:](self->_analyzer, "updateModelForSourceWidth:sourceHeight:");
  if (!v12)
  {
    [(VCPImageHandsAnalyzer *)self->_analyzer preferredInputFormat:&self->_preferredWidth height:&self->_preferredHeight format:&self->_preferredFormat];
    goto LABEL_13;
  }
LABEL_14:
  BOOL v15 = v12 == 0;

  return v15;
}

- (CGSize)preferredInputSizeWithOptions:(id)a3 error:(id *)a4
{
  double preferredWidth = (double)self->_preferredWidth;
  double preferredHeight = (double)self->_preferredHeight;
  result.int height = preferredHeight;
  result.int width = preferredWidth;
  return result;
}

- (unsigned)preferredPixelFormat
{
  return self->_preferredFormat;
}

- (BOOL)cleanupWithOptions:(id)a3 error:(id *)a4
{
  analyzer = self->_analyzer;
  self->_analyzer = 0;

  return 1;
}

- (void).cxx_destruct
{
}

@end