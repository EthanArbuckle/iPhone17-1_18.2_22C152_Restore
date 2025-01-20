@interface VCPHandPoseVideoRequest
- (BOOL)cleanupWithOptions:(id)a3 error:(id *)a4;
- (CGSize)preferredInputSizeWithOptions:(id)a3 error:(id *)a4;
- (VCPHandPoseVideoRequest)init;
- (VCPHandPoseVideoRequest)initWithOptions:(id)a3;
- (float)handDistance:(id)a3 withhandB:(id)a4;
- (id)processSampleBuffer:(opaqueCMSampleBuffer *)a3 withOptions:(id)a4 error:(id *)a5;
- (int)associateHands:(id)a3 withExisingHands:(id)a4;
- (unsigned)preferredPixelFormat;
@end

@implementation VCPHandPoseVideoRequest

- (VCPHandPoseVideoRequest)init
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

- (VCPHandPoseVideoRequest)initWithOptions:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VCPHandPoseVideoRequest;
  v5 = [(VCPRequest *)&v18 initWithOptions:v4];
  v6 = v5;
  if (v5)
  {
    int maxNumHands = v5->super._maxNumHands;
    if (maxNumHands <= 0) {
      int maxNumHands = 6;
    }
    v5->super._int maxNumHands = maxNumHands;
    v8 = [VCPImageHandsAnalyzer alloc];
    LODWORD(v17) = v6->super._revision;
    HIDWORD(v15) = v6->super._width;
    LODWORD(v16) = v6->super._height;
    LOBYTE(v15) = 1;
    uint64_t v9 = -[VCPImageHandsAnalyzer initWithKeypointsOption:forceCPU:sharedModel:enableHandDetection:enableANSTHandDetection:enableRejectHandsNearBoundaries:enableHandObject:sourceWidth:sourceHeight:modelName:revision:options:](v8, "initWithKeypointsOption:forceCPU:sharedModel:enableHandDetection:enableANSTHandDetection:enableRejectHandsNearBoundaries:enableHandObject:sourceWidth:sourceHeight:modelName:revision:options:", v6->super._maxNumHands, v6->super._useCPUOnly, 0, v6->super._enableHandDetection, v6->super._enableANSTHandDetection, v6->super._enableRejectHandsNearBoundaries, v15, v16, @"hand_keypoint_detector_lite.espresso.net", v17, v4);
    analyzer = v6->_analyzer;
    v6->_analyzer = (VCPImageHandsAnalyzer *)v9;

    v11 = v6->_analyzer;
    if (v11) {
      [(VCPImageHandsAnalyzer *)v11 preferredInputFormat:&v6->_handID height:&v6->_preferredWidth format:&v6->_preferredHeight];
    }
    *((_DWORD *)&v6->super._minHandSize + 1) = 0;
  }
  if (v6->_analyzer) {
    v12 = v6;
  }
  else {
    v12 = 0;
  }
  v13 = v12;

  return v13;
}

- (float)handDistance:(id)a3 withhandB:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (!v8)
  {

    float v11 = 0.0;
LABEL_14:
    float v27 = (float)(21.0 - v11) * 100.0;
    goto LABEL_15;
  }
  int v9 = 0;
  uint64_t v10 = *(void *)v30;
  float v11 = 0.0;
  float v12 = 0.0;
  do
  {
    uint64_t v13 = 0;
    uint64_t v14 = v9;
    do
    {
      if (*(void *)v30 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v15 = *(void **)(*((void *)&v29 + 1) + 8 * v13);
      uint64_t v16 = objc_msgSend(v6, "objectAtIndexedSubscript:", v14 + v13, (void)v29);
      [v15 confidence];
      if (v17 > 0.1)
      {
        [v16 confidence];
        if (v18 > 0.1)
        {
          [v15 location];
          double v20 = v19;
          [v16 location];
          double v22 = v21;
          [v15 location];
          double v24 = v23;
          [v16 location];
          float v26 = vabdd_f64(v20, v22) + vabdd_f64(v24, v25);
          float v12 = v12 + v26;
          float v11 = v11 + 1.0;
        }
      }

      ++v13;
    }
    while (v8 != v13);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
    int v9 = v14 + v13;
  }
  while (v8);

  if (v11 <= 10.0) {
    goto LABEL_14;
  }
  float v27 = v12 / v11;
LABEL_15:

  return v27;
}

- (id)processSampleBuffer:(opaqueCMSampleBuffer *)a3 withOptions:(id)a4 error:(id *)a5
{
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3, a4);
  uint64_t v21 = 0;
  if (!self->_analyzer) {
    goto LABEL_10;
  }
  if (!a3)
  {
    uint64_t v13 = 0;
    int v11 = -50;
    if (a5) {
      goto LABEL_12;
    }
    goto LABEL_14;
  }
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (ImageBuffer)
  {
    analyzer = self->_analyzer;
    id v20 = 0;
    int v11 = [(VCPImageHandsAnalyzer *)analyzer analyzePixelBuffer:ImageBuffer flags:&v21 results:&v20 cancel:&__block_literal_global_25];
    id v12 = v20;
    uint64_t v13 = v12;
    if (!v11)
    {
      uint64_t v14 = [v12 objectForKeyedSubscript:@"HandsResults"];

      if (!v14
        || ([v13 objectForKeyedSubscript:@"HandsResults"],
            uint64_t v15 = objc_claimAutoreleasedReturnValue(),
            int v11 = +[VCPHandPoseImageRequest parseResults:observations:](VCPHandPoseImageRequest, "parseResults:observations:", v15, v8), v15, !v11)&& (![v8 count]|| (int v11 = -[VCPHandPoseVideoRequest associateHands:withExisingHands:](self, "associateHands:withExisingHands:", v8, self->_existingHands)) == 0))
      {
        uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithArray:v8];
        existingHands = self->_existingHands;
        self->_existingHands = v16;

        id v18 = v8;
        goto LABEL_15;
      }
    }
  }
  else
  {
LABEL_10:
    uint64_t v13 = 0;
    int v11 = -18;
  }
  if (a5)
  {
LABEL_12:
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v11 userInfo:0];
    id v18 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
LABEL_14:
  id v18 = 0;
LABEL_15:

  return v18;
}

uint64_t __65__VCPHandPoseVideoRequest_processSampleBuffer_withOptions_error___block_invoke()
{
  return 0;
}

- (int)associateHands:(id)a3 withExisingHands:(id)a4
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v53 = a3;
  id v48 = a4;
  if ([v48 count])
  {
    unint64_t v6 = [v48 count];
    if (v6 >= [v53 count])
    {
      id v9 = [MEMORY[0x1E4F1CA48] arrayWithArray:v48];
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      id v7 = v53;
      uint64_t v41 = [v7 countByEnumeratingWithState:&v71 objects:v83 count:16];
      if (v41)
      {
        uint64_t v43 = *(void *)v72;
        do
        {
          for (uint64_t i = 0; i != v41; ++i)
          {
            if (*(void *)v72 != v43) {
              objc_enumerationMutation(v7);
            }
            float v27 = *(void **)(*((void *)&v71 + 1) + 8 * i);
            long long v67 = 0u;
            long long v68 = 0u;
            long long v69 = 0u;
            long long v70 = 0u;
            id obja = v9;
            uint64_t v28 = [obja countByEnumeratingWithState:&v67 objects:v82 count:16];
            if (v28)
            {
              v54 = 0;
              uint64_t v29 = 0;
              uint64_t v52 = *(void *)v68;
              float v30 = 3.4028e38;
              while (2)
              {
                uint64_t v50 = v28;
                for (uint64_t j = 0; j != v50; ++j)
                {
                  if (*(void *)v68 != v52) {
                    objc_enumerationMutation(obja);
                  }
                  long long v32 = *(void **)(*((void *)&v67 + 1) + 8 * j);
                  uint64_t v14 = [v27 keypoints];
                  if ([v14 count] != 21)
                  {
                    id v9 = obja;
                    goto LABEL_61;
                  }
                  v33 = [v32 keypoints];
                  BOOL v34 = [v33 count] == 21;

                  if (!v34)
                  {
                    id v9 = obja;
                    goto LABEL_63;
                  }
                  v35 = [v27 keypoints];
                  v36 = [v32 keypoints];
                  [(VCPHandPoseVideoRequest *)self handDistance:v35 withhandB:v36];
                  float v38 = v37;

                  if (v38 < v30)
                  {
                    uint64_t v29 = [v32 handID];
                    id v39 = v32;

                    v54 = v39;
                    float v30 = v38;
                  }
                }
                uint64_t v28 = [obja countByEnumeratingWithState:&v67 objects:v82 count:16];
                if (v28) {
                  continue;
                }
                break;
              }
            }
            else
            {
              v54 = 0;
              uint64_t v29 = 0;
            }

            [v27 setHandID:v29];
            [obja removeObject:v54];
          }
          uint64_t v41 = [v7 countByEnumeratingWithState:&v71 objects:v83 count:16];
        }
        while (v41);
        LODWORD(v22) = 0;
        id v9 = obja;
      }
      else
      {
        LODWORD(v22) = 0;
      }
    }
    else
    {
      v49 = [MEMORY[0x1E4F1CA48] arrayWithArray:v53];
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id v7 = v48;
      uint64_t v42 = [v7 countByEnumeratingWithState:&v63 objects:v81 count:16];
      if (v42)
      {
        uint64_t v44 = *(void *)v64;
LABEL_5:
        obuint64_t j = 0;
LABEL_6:
        if (*(void *)v64 != v44) {
          objc_enumerationMutation(v7);
        }
        uint64_t v8 = *(void **)(*((void *)&v63 + 1) + 8 * (void)obj);
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        id v9 = v49;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v59 objects:v80 count:16];
        if (v10)
        {
          v54 = 0;
          uint64_t v51 = *(void *)v60;
          float v11 = 3.4028e38;
LABEL_10:
          uint64_t v12 = 0;
          while (1)
          {
            if (*(void *)v60 != v51) {
              objc_enumerationMutation(v9);
            }
            uint64_t v13 = *(void **)(*((void *)&v59 + 1) + 8 * v12);
            uint64_t v14 = [v8 keypoints];
            if ([v14 count] != 21) {
              break;
            }
            uint64_t v15 = [v13 keypoints];
            BOOL v16 = [v15 count] == 21;

            if (!v16) {
              goto LABEL_63;
            }
            float v17 = [v8 keypoints];
            id v18 = [v13 keypoints];
            [(VCPHandPoseVideoRequest *)self handDistance:v17 withhandB:v18];
            float v20 = v19;

            if (v20 < v11)
            {
              id v21 = v13;

              float v11 = v20;
              v54 = v21;
            }
            if (v10 == ++v12)
            {
              uint64_t v10 = [v9 countByEnumeratingWithState:&v59 objects:v80 count:16];
              if (v10) {
                goto LABEL_10;
              }

              if (!v54) {
                goto LABEL_64;
              }
              objc_msgSend(v54, "setHandID:", objc_msgSend(v8, "handID"));
              [v9 removeObject:v54];

              obuint64_t j = (char *)obj + 1;
              if (obj != (id)v42) {
                goto LABEL_6;
              }
              uint64_t v42 = [v7 countByEnumeratingWithState:&v63 objects:v81 count:16];
              if (v42) {
                goto LABEL_5;
              }
              goto LABEL_22;
            }
          }
LABEL_61:
        }
        else
        {
          v54 = 0;
        }
LABEL_63:

LABEL_64:
        LODWORD(v22) = -18;
      }
      else
      {
LABEL_22:

        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        id v7 = v49;
        uint64_t v22 = [v7 countByEnumeratingWithState:&v55 objects:v79 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v56;
          do
          {
            for (uint64_t k = 0; k != v22; ++k)
            {
              if (*(void *)v56 != v23) {
                objc_enumerationMutation(v7);
              }
              [*(id *)(*((void *)&v55 + 1) + 8 * k) setHandID:(*((_DWORD *)&self->super._minHandSize + 1))++];
            }
            uint64_t v22 = [v7 countByEnumeratingWithState:&v55 objects:v79 count:16];
          }
          while (v22);
        }
        id v9 = v7;
      }
    }
  }
  else
  {
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v9 = v53;
    uint64_t v22 = [v9 countByEnumeratingWithState:&v75 objects:v84 count:16];
    if (v22)
    {
      uint64_t v25 = *(void *)v76;
      do
      {
        for (uint64_t m = 0; m != v22; ++m)
        {
          if (*(void *)v76 != v25) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v75 + 1) + 8 * m) setHandID:(*((_DWORD *)&self->super._minHandSize + 1))++];
        }
        uint64_t v22 = [v9 countByEnumeratingWithState:&v75 objects:v84 count:16];
      }
      while (v22);
    }
  }

  return v22;
}

- (CGSize)preferredInputSizeWithOptions:(id)a3 error:(id *)a4
{
  double handID = (double)self->_handID;
  double preferredWidth = (double)self->_preferredWidth;
  result.height = preferredWidth;
  result.width = handID;
  return result;
}

- (unsigned)preferredPixelFormat
{
  return self->_preferredHeight;
}

- (BOOL)cleanupWithOptions:(id)a3 error:(id *)a4
{
  analyzer = self->_analyzer;
  self->_analyzer = 0;

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingHands, 0);
  objc_storeStrong((id *)&self->_analyzer, 0);
}

@end