@interface VCPVideoKeyFrame
+ (BOOL)isLivePhotoKeyFrameEnabled;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timestamp;
- (BOOL)hasGoodSubjectAction;
- (BOOL)isHeadingFrame;
- (NSMutableArray)detectedFaces;
- (NSMutableArray)faceQualityScores;
- (NSMutableDictionary)frameResults;
- (VCPVideoKeyFrame)initWithLivePhoto:(BOOL)a3;
- (float)computeContentScore;
- (float)computeExpressionScore;
- (float)computeGlobalQuality;
- (float)computePenaltyScore;
- (float)computeScoreFromAction;
- (float)computeScoreFromColorfulness;
- (float)computeScoreFromExposure;
- (float)computeVisualPleasingScore;
- (float)contentScore;
- (float)exposureScore;
- (float)expressionChangeScore;
- (float)faceSharpness;
- (float)globalQualityScore;
- (float)humanActionScore;
- (float)humanPoseScore;
- (float)overallFaceQualityScore;
- (float)penaltyScore;
- (float)qualityScoreForLivePhoto;
- (float)score;
- (float)semanticScore;
- (float)sharpness;
- (float)textureScore;
- (float)visualPleasingScore;
- (int)loadKeyFrameResult:(id)a3 timestamp:(id *)a4;
- (unint64_t)statsFlags;
- (void)computeCurationScore;
- (void)computeCurationScoreComponents;
- (void)computeGlobalQualityForLivePhoto;
- (void)copyFrom:(id)a3;
- (void)printStats;
- (void)resetStatsFlag;
- (void)setContentScore:(float)a3;
- (void)setDetectedFaces:(id)a3;
- (void)setExposureScore:(float)a3;
- (void)setExpressionChangeScore:(float)a3;
- (void)setFaceQualityScores:(id)a3;
- (void)setFaceSharpness:(float)a3;
- (void)setFaceStatsFlag:(BOOL)a3 detectedFaces:(id)a4;
- (void)setFrameResults:(id)a3;
- (void)setGlobalQualityScore:(float)a3;
- (void)setHumanActionScore:(float)a3;
- (void)setHumanPoseScore:(float)a3;
- (void)setIsHeadingFrame:(BOOL)a3;
- (void)setMotionStatsFlag:(BOOL)a3 cameraMotion:(float)a4 subjectAction:(float)a5 interestingness:(float)a6 obstruction:(float)a7 colorfulness:(float)a8 exposureScore:(float)a9 humanActionStatsFlag:(BOOL)a10 humanPoseScore:(float)a11 humanActionScore:(float)a12 subMb:(BOOL)a13;
- (void)setOverallFaceQualityScore:(float)a3;
- (void)setPenaltyScore:(float)a3;
- (void)setQualityScoreForLivePhoto:(float)a3;
- (void)setScore:(float)a3;
- (void)setSemanticScore:(float)a3;
- (void)setSharpness:(float)a3;
- (void)setStatsFlags:(unint64_t)a3;
- (void)setTextureScore:(float)a3;
- (void)setTimestamp:(id *)a3;
- (void)setVisualPleasingScore:(float)a3;
- (void)storeFrameResults;
@end

@implementation VCPVideoKeyFrame

- (VCPVideoKeyFrame)initWithLivePhoto:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)VCPVideoKeyFrame;
  v4 = [(VCPVideoKeyFrame *)&v15 init];
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = MEMORY[0x1E4F1F9F0];
    *((_OWORD *)v4 + 8) = *MEMORY[0x1E4F1F9F0];
    *((void *)v4 + 18) = *(void *)(v6 + 16);
    *((void *)v4 + 4) = 0;
    *((void *)v4 + 5) = 0;
    *((void *)v4 + 6) = 0x3F80000000000000;
    *((void *)v4 + 1) = 0;
    *((void *)v4 + 2) = 0;
    *(_WORD *)(v4 + 29) = 1;
    *((_DWORD *)v4 + 21) = 0;
    *((_DWORD *)v4 + 22) = 0;
    *((void *)v4 + 12) = 0;
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    v8 = (void *)*((void *)v5 + 13);
    *((void *)v5 + 13) = v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    v10 = (void *)*((void *)v5 + 14);
    *((void *)v5 + 14) = v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    v12 = (void *)*((void *)v5 + 15);
    *((void *)v5 + 15) = v11;

    *((void *)v5 + 7) = 0;
    *((void *)v5 + 8) = 0;
    *((_DWORD *)v5 + 18) = 0;
    *(void *)(v5 + 76) = 1065353216;
    v5[28] = a3;
    v13 = v5;
  }

  return (VCPVideoKeyFrame *)v5;
}

+ (BOOL)isLivePhotoKeyFrameEnabled
{
  return 0;
}

- (void)copyFrom:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    [v4 timestamp];
  }
  else
  {
    long long v21 = 0uLL;
    int64_t v22 = 0;
  }
  *(_OWORD *)&self->_timestamp.value = v21;
  self->_timestamp.epoch = v22;
  [v5 score];
  self->_score = v6;
  [v5 semanticScore];
  self->_semanticScore = v7;
  [v5 sharpness];
  self->_sharpness = v8;
  [v5 faceSharpness];
  self->_faceSharpness = v9;
  [v5 textureScore];
  self->_textureScore = v10;
  [v5 exposureScore];
  self->_exposureScore = v11;
  [v5 humanPoseScore];
  self->_humanPoseScore = v12;
  [v5 humanActionScore];
  self->_humanActionScore = v13;
  self->_isHeadingFrame = [v5 isHeadingFrame];
  self->_statsFlags = [v5 statsFlags];
  [v5 expressionChangeScore];
  self->_expressionChangeScore = v14;
  [v5 overallFaceQualityScore];
  self->_overallFaceQualityScore = v15;
  [v5 qualityScoreForLivePhoto];
  self->_qualityScoreForLivePhoto = v16;
  [v5 globalQualityScore];
  self->_globalQualityScore = v17;
  [v5 visualPleasingScore];
  self->_visualPleasingScore = v18;
  [v5 penaltyScore];
  self->_penaltyScore = v19;
  [v5 contentScore];
  self->_contentScore = v20;
}

- (int)loadKeyFrameResult:(id)a3 timestamp:(id *)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  float v6 = [v41 objectForKeyedSubscript:@"attributes"];
  v42 = v6;
  if (v6)
  {
    float v7 = [v6 objectForKeyedSubscript:@"timestamp"];
    if (v7)
    {
      v39 = v7;
      [v7 floatValue];
      CMTimeMakeWithSeconds(&v49, v8, 600);
      self->_timestamp = ($95D729B680665BEAEFA1D6FCA8238556)v49;
      CMTime time = (CMTime)*a4;
      double Seconds = CMTimeGetSeconds(&time);
      [v39 floatValue];
      if (vabdd_f64(Seconds, v10) > 0.00499999989)
      {
        int v11 = 0;
        float v12 = v39;
LABEL_26:

        goto LABEL_27;
      }
      float v13 = [v42 objectForKeyedSubscript:@"frameQualityScore"];

      if (v13)
      {
        [v13 floatValue];
        self->_qualityScoreForLivePhoto = v14;
        float v15 = [v42 objectForKeyedSubscript:@"faceQualityScore"];

        if (v15)
        {
          [v15 floatValue];
          self->_float overallFaceQualityScore = v16;
          float v17 = [v42 objectForKeyedSubscript:@"visualPleasingScore"];

          if (v17)
          {
            [v17 floatValue];
            self->_visualPleasingScore = v18;
            float v19 = [v42 objectForKeyedSubscript:@"penaltyScore"];

            if (v19)
            {
              [v19 floatValue];
              self->_penaltyScore = v20;
              long long v21 = [v42 objectForKeyedSubscript:@"sharpnessScore"];

              if (v21)
              {
                v40 = v21;
                [v21 floatValue];
                self->_sharpness = v22;
                long long v44 = 0u;
                long long v45 = 0u;
                long long v46 = 0u;
                long long v47 = 0u;
                v23 = [v42 objectForKeyedSubscript:@"FaceResults"];
                id obj = v23;
                uint64_t v24 = [v23 countByEnumeratingWithState:&v44 objects:v50 count:16];
                if (v24)
                {
                  uint64_t v25 = *(void *)v45;
                  do
                  {
                    for (uint64_t i = 0; i != v24; ++i)
                    {
                      if (*(void *)v45 != v25) {
                        objc_enumerationMutation(obj);
                      }
                      v27 = *(void **)(*((void *)&v44 + 1) + 8 * i);
                      v28 = objc_alloc_init(VCPFace);
                      v29 = [v27 objectForKeyedSubscript:@"attributes"];
                      v30 = [v29 objectForKeyedSubscript:@"faceBounds"];
                      NSRect v52 = NSRectFromString(v30);
                      -[VCPFace setBounds:](v28, "setBounds:", v52.origin.x, v52.origin.y, v52.size.width, v52.size.height);

                      [(NSMutableArray *)self->_detectedFaces addObject:v28];
                      if (+[VCPVideoKeyFrame isLivePhotoKeyFrameEnabled])
                      {
                        faceQualityScores = self->_faceQualityScores;
                        v32 = [v27 objectForKeyedSubscript:@"attributes"];
                        v33 = [v32 objectForKeyedSubscript:@"faceQuality"];
                        [(NSMutableArray *)faceQualityScores addObject:v33];
                      }
                    }
                    v23 = obj;
                    uint64_t v24 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
                  }
                  while (v24);
                }

                self->_statsFlags |= 0x10uLL;
                float v34 = 0.0;
                if (self->_sharpness > 0.0)
                {
                  float v34 = 0.0;
                  if (self->_qualityScoreForLivePhoto == 0.0) {
                    float v34 = 1.0;
                  }
                }
                self->_obstruction = v34;
                v35 = [v42 objectForKeyedSubscript:@"globalQualityScore"];

                if (v35) {
                  [v35 floatValue];
                }
                else {
                  [(VCPVideoKeyFrame *)self computeGlobalQuality];
                }
                self->_globalQualityScore = v36;
                float v12 = [v42 objectForKeyedSubscript:@"contentScore"];

                if (v12) {
                  [v12 floatValue];
                }
                else {
                  float overallFaceQualityScore = self->_overallFaceQualityScore;
                }
                int v11 = 0;
                self->_contentScore = overallFaceQualityScore;
                goto LABEL_26;
              }
            }
          }
        }
      }
    }
    float v12 = 0;
    int v11 = -50;
    goto LABEL_26;
  }
  int v11 = -50;
LABEL_27:

  return v11;
}

- (void)resetStatsFlag
{
  self->_statsFlags = 0;
}

- (void)setFaceStatsFlag:(BOOL)a3 detectedFaces:(id)a4
{
  BOOL v4 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v4)
  {
    [(NSMutableArray *)self->_detectedFaces removeAllObjects];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v7);
          }
          -[NSMutableArray addObject:](self->_detectedFaces, "addObject:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }

    self->_statsFlags |= 1uLL;
  }
}

- (void)setMotionStatsFlag:(BOOL)a3 cameraMotion:(float)a4 subjectAction:(float)a5 interestingness:(float)a6 obstruction:(float)a7 colorfulness:(float)a8 exposureScore:(float)a9 humanActionStatsFlag:(BOOL)a10 humanPoseScore:(float)a11 humanActionScore:(float)a12 subMb:(BOOL)a13
{
  *(void *)&self->_subjectAction = 0;
  self->_obstruction = 0.0;
  self->_subMb = 0;
  if (a3)
  {
    self->_subjectAction = a5;
    self->_cameraMotion = a4;
    self->_obstruction = 1.0 - a7;
    self->_subMb = a13;
    self->_statsFlags |= 2uLL;
  }
  if (a10)
  {
    self->_humanPoseScore = a11;
    self->_humanActionScore = a12;
    self->_statsFlags |= 8uLL;
  }
  self->_exposureScore = a9;
  self->_interestingness = a6;
  self->_colorfulness = a8;
}

- (void)computeGlobalQualityForLivePhoto
{
  float sharpness = self->_sharpness;
  float v3 = 1.0;
  float v4 = 1.0;
  if (sharpness < 1.0)
  {
    float v4 = 0.0;
    if (sharpness >= 0.0) {
      float v4 = self->_sharpness;
    }
  }
  if (!self->_isHeadingFrame)
  {
    float v3 = 0.0;
    if (self->_obstruction >= 0.96) {
      float v3 = 1.0;
    }
  }
  self->_qualityScoreForLivePhoto = v4 * v3;
}

- (float)computeGlobalQuality
{
  float sharpness = self->_sharpness;
  float v3 = 1.0;
  float v4 = 1.0;
  if (sharpness < 0.6)
  {
    float v4 = 0.0;
    if (sharpness >= 0.3) {
      float v4 = self->_sharpness;
    }
  }
  if (!self->_isHeadingFrame)
  {
    float v3 = 0.0;
    if (self->_obstruction >= 0.96) {
      float v3 = 1.0;
    }
  }
  if (self->_interestingness <= 0.0) {
    float v5 = 0.0;
  }
  else {
    float v5 = 1.0;
  }
  float v6 = (float)(v4 * v5) * v3;
  if (v6 < 1.0) {
    float v7 = v6;
  }
  else {
    float v7 = 1.0;
  }
  if (v6 <= 0.0) {
    return 0.0;
  }
  else {
    return v7;
  }
}

- (float)computeVisualPleasingScore
{
  [(VCPVideoKeyFrame *)self computeScoreFromColorfulness];
  float v4 = v3;
  [(VCPVideoKeyFrame *)self computeScoreFromExposure];
  float v6 = (float)(v5 * 0.4) + (float)(v4 * 0.6);
  float v7 = 1.0;
  if (v6 < 1.0) {
    float v7 = v6;
  }
  BOOL v8 = v6 > 0.0;
  float result = 0.0;
  if (v8) {
    return v7;
  }
  return result;
}

- (float)computeContentScore
{
  [(VCPVideoKeyFrame *)self computeExpressionScore];
  if (result < (float)(self->_humanPoseScore * 0.5)) {
    float result = self->_humanPoseScore * 0.5;
  }
  if (!self->_isHeadingFrame)
  {
    float v4 = result * 0.6;
    [(VCPVideoKeyFrame *)self computeScoreFromAction];
    return v4 + (float)((float)(v5 + self->_humanActionScore) * 0.4);
  }
  return result;
}

- (float)computePenaltyScore
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (![(NSMutableArray *)self->_detectedFaces count]) {
    return 1.0;
  }
  float v3 = [(NSMutableArray *)self->_detectedFaces firstObject];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  float v8 = v7 * v5;
  if (v8 <= 0.2 || (float result = 0.0, self->_faceSharpness >= 0.3))
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v10 = self->_detectedFaces;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v33;
      double v13 = (float)(v8 * 0.9);
LABEL_6:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v10);
        }
        float v15 = *(void **)(*((void *)&v32 + 1) + 8 * v14);
        objc_msgSend(v15, "bounds", (void)v32);
        double v18 = v17;
        double v20 = v19;
        double v22 = v21;
        double v23 = v21 * v19;
        if (v21 * v19 >= v13)
        {
          double v24 = v16;
          if (objc_msgSend(v15, "leftEyeClosed", v23)) {
            int v25 = 1;
          }
          else {
            int v25 = [v15 rightEyeClosed];
          }
          float v26 = v18;
          float v27 = v24;
          float v29 = v24 + v22;
          BOOL v30 = v26 < 0.05;
          if (v27 < 0.05) {
            BOOL v30 = 1;
          }
          float v28 = v18 + v20;
          if (v28 > 0.949999999) {
            BOOL v30 = 1;
          }
          double v23 = v29;
          int v31 = v29 > 0.949999999 || v30;
          if (v25 & 1) != 0 || (v31) {
            break;
          }
        }
        if (v11 == ++v14)
        {
          uint64_t v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16, v23);
          if (v11) {
            goto LABEL_6;
          }
          goto LABEL_24;
        }
      }
    }
    else
    {
LABEL_24:
      int v25 = 0;
      int v31 = 0;
    }

    float result = 0.4;
    if (!(v25 | v31)) {
      return 1.0;
    }
  }
  return result;
}

- (void)storeFrameResults
{
  *(_DWORD *)buf = 134218240;
  *(void *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 2048;
  *(double *)(buf + 14) = a4;
  _os_log_fault_impl(&dword_1BBEDA000, log, OS_LOG_TYPE_FAULT, "Error: FaceQualityScore should not contain results! (size = %lu, timestamp=%.2f)", buf, 0x16u);
}

- (void)computeCurationScoreComponents
{
  unint64_t statsFlags = self->_statsFlags;
  if ((statsFlags & 0x12) == 0x10)
  {
    if ((statsFlags & 1) == 0) {
      goto LABEL_3;
    }
  }
  else
  {
    [(VCPVideoKeyFrame *)self computeGlobalQuality];
    self->_globalQualityScore = v4;
    [(VCPVideoKeyFrame *)self computeVisualPleasingScore];
    self->_visualPleasingScore = v5;
    unint64_t statsFlags = self->_statsFlags;
    if ((statsFlags & 1) == 0)
    {
LABEL_3:
      if ((statsFlags & 0x10) == 0) {
        goto LABEL_8;
      }
LABEL_7:
      if ((statsFlags & 3) != 3) {
        return;
      }
      goto LABEL_8;
    }
  }
  [(VCPVideoKeyFrame *)self computePenaltyScore];
  self->_penaltyScore = v6;
  unint64_t statsFlags = self->_statsFlags;
  if ((statsFlags & 0x10) != 0) {
    goto LABEL_7;
  }
LABEL_8:
  [(VCPVideoKeyFrame *)self computeContentScore];
  self->_contentScore = v7;
}

- (void)computeCurationScore
{
  [(VCPVideoKeyFrame *)self computeCurationScoreComponents];
  float v3 = 0.0;
  float v4 = 0.0;
  if (self->_globalQualityScore >= 0.5) {
    float v4 = (float)((float)((float)(self->_visualPleasingScore * 0.25) + 0.1) + (float)(self->_contentScore * 0.65))
  }
       * self->_penaltyScore;
  float v5 = 1.0;
  if (v4 < 1.0) {
    float v5 = v4;
  }
  if (v4 > 0.0) {
    float v3 = v5;
  }
  self->_score = v3;
  if (self->_isLivePhoto)
  {
    [(VCPVideoKeyFrame *)self storeFrameResults];
  }
}

- (float)computeScoreFromAction
{
  float v2 = (float)(erff((float)(self->_subjectAction * 0.5) + -1.5) * 0.5) + 0.5;
  float v3 = 1.0;
  if (v2 < 1.0) {
    float v3 = v2;
  }
  BOOL v4 = v2 > 0.0;
  float result = 0.0;
  if (v4) {
    return v3;
  }
  return result;
}

- (float)computeExpressionScore
{
  int v3 = [(NSMutableArray *)self->_detectedFaces count];
  if (!v3) {
    return 0.0;
  }
  if ([(NSMutableArray *)self->_detectedFaces count])
  {
    unint64_t v4 = 0;
    char v5 = 0;
    char v6 = 0;
    float v7 = 0.0;
    float v8 = 0.0;
    do
    {
      uint64_t v9 = -[NSMutableArray objectAtIndexedSubscript:](self->_detectedFaces, "objectAtIndexedSubscript:", v4, *(_OWORD *)&v27.origin, *(_OWORD *)&v27.size);
      objc_msgSend(v9, "bounds", 0, 0, 0, 0);
      v27.origin.x = v12;
      v27.origin.y = v13;
      v27.size.width = v10;
      v27.size.height = v11;
      if (v11 >= v10) {
        double v14 = v11;
      }
      else {
        double v14 = v10;
      }
      float v15 = v14;
      if (MediaAnalysisFacePosition(&v27) == 16) {
        float v16 = 1.0;
      }
      else {
        float v16 = 0.5;
      }
      float v17 = v16 * v15;
      if ((float)(v16 * v15) > v8)
      {
        char v6 = objc_msgSend(v9, "smile", *(_OWORD *)&v27.origin, *(_OWORD *)&v27.size);
        if ([v9 leftEyeClosed]) {
          char v5 = 1;
        }
        else {
          char v5 = [v9 rightEyeClosed];
        }
        if ([(NSMutableArray *)self->_faceQualityScores count] > v4)
        {
          double v18 = [(NSMutableArray *)self->_faceQualityScores objectAtIndexedSubscript:v4];
          [v18 floatValue];
          self->_float overallFaceQualityScore = v19;
        }
        float v8 = v17;
        float v7 = v15;
      }

      ++v4;
    }
    while (v4 < [(NSMutableArray *)self->_detectedFaces count]);
  }
  else
  {
    char v6 = 0;
    char v5 = 0;
    float v7 = 0.0;
  }
  if ((float)(v7 + -0.368) >= 0.0) {
    float v21 = expf((float)-(float)((float)(v7 + -0.368) * (float)(v7 + -0.368)) / sqrtf((float)v3));
  }
  else {
    float v21 = v7 / 0.368;
  }
  if (v6) {
    float v22 = 0.3;
  }
  else {
    float v22 = 0.0;
  }
  if (v5) {
    float v22 = -0.9;
  }
  float v23 = v22 + v21;
  if (self->_faceSharpness >= 0.3) {
    float faceSharpness = self->_faceSharpness;
  }
  else {
    float faceSharpness = 0.0;
  }
  float v25 = v23 * faceSharpness;
  float v26 = 1.0;
  if (v25 < 1.0) {
    float v26 = v25;
  }
  if (v25 <= 0.0) {
    return 0.0;
  }
  else {
    return v26;
  }
}

- (float)computeScoreFromColorfulness
{
  float v2 = self->_colorfulness * 0.012195;
  float v3 = 1.0;
  if (v2 < 1.0) {
    float v3 = self->_colorfulness * 0.012195;
  }
  BOOL v4 = v2 > 0.0;
  float result = 0.0;
  if (v4) {
    return v3;
  }
  return result;
}

- (float)computeScoreFromExposure
{
  float v2 = expf((float)(self->_exposureScore * self->_exposureScore) / -12723.0);
  float v3 = 1.0;
  if (v2 < 1.0) {
    float v3 = v2;
  }
  BOOL v5 = v2 == 0.0;
  BOOL v4 = v2 >= 0.0;
  float result = 0.0;
  if (!v5 && v4) {
    return v3;
  }
  return result;
}

- (BOOL)hasGoodSubjectAction
{
  float subjectAction = self->_subjectAction;
  return subjectAction < 8.0 && subjectAction > 3.0;
}

- (void)printStats
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    float v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      $95D729B680665BEAEFA1D6FCA8238556 timestamp = self->_timestamp;
      Float64 Seconds = CMTimeGetSeconds((CMTime *)&timestamp);
      double sharpness = self->_sharpness;
      double faceSharpness = self->_faceSharpness;
      double cameraMotion = self->_cameraMotion;
      double subjectAction = self->_subjectAction;
      double interestingness = self->_interestingness;
      double obstruction = self->_obstruction;
      double exposureScore = self->_exposureScore;
      double score = self->_score;
      *(_DWORD *)buf = 134220032;
      Float64 v15 = Seconds;
      __int16 v16 = 2048;
      double v17 = sharpness;
      __int16 v18 = 2048;
      double v19 = faceSharpness;
      __int16 v20 = 2048;
      double v21 = cameraMotion;
      __int16 v22 = 2048;
      double v23 = subjectAction;
      __int16 v24 = 2048;
      double v25 = interestingness;
      __int16 v26 = 2048;
      double v27 = obstruction;
      __int16 v28 = 2048;
      double v29 = exposureScore;
      __int16 v30 = 2048;
      double v31 = score;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_DEBUG, "time=%.2f sharpness=%.2f, faceSharpness=%.2f, cameraM=%.2f, subjectM=%.2f, junk=%.2f, obstr=%.2f, exposure=%.2f, score=%.2f", buf, 0x5Cu);
    }
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timestamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 128);
  return self;
}

- (void)setTimestamp:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_timestamp.epoch = a3->var3;
  *(_OWORD *)&self->_timestamp.value = v3;
}

- (float)score
{
  return self->_score;
}

- (void)setScore:(float)a3
{
  self->_double score = a3;
}

- (float)semanticScore
{
  return self->_semanticScore;
}

- (void)setSemanticScore:(float)a3
{
  self->_semanticScore = a3;
}

- (float)sharpness
{
  return self->_sharpness;
}

- (void)setSharpness:(float)a3
{
  self->_double sharpness = a3;
}

- (float)faceSharpness
{
  return self->_faceSharpness;
}

- (void)setFaceSharpness:(float)a3
{
  self->_double faceSharpness = a3;
}

- (float)exposureScore
{
  return self->_exposureScore;
}

- (void)setExposureScore:(float)a3
{
  self->_double exposureScore = a3;
}

- (BOOL)isHeadingFrame
{
  return self->_isHeadingFrame;
}

- (void)setIsHeadingFrame:(BOOL)a3
{
  self->_isHeadingFrame = a3;
}

- (float)textureScore
{
  return self->_textureScore;
}

- (void)setTextureScore:(float)a3
{
  self->_textureScore = a3;
}

- (float)expressionChangeScore
{
  return self->_expressionChangeScore;
}

- (void)setExpressionChangeScore:(float)a3
{
  self->_expressionChangeScore = a3;
}

- (unint64_t)statsFlags
{
  return self->_statsFlags;
}

- (void)setStatsFlags:(unint64_t)a3
{
  self->_unint64_t statsFlags = a3;
}

- (NSMutableArray)detectedFaces
{
  return self->_detectedFaces;
}

- (void)setDetectedFaces:(id)a3
{
}

- (NSMutableArray)faceQualityScores
{
  return self->_faceQualityScores;
}

- (void)setFaceQualityScores:(id)a3
{
}

- (NSMutableDictionary)frameResults
{
  return self->_frameResults;
}

- (void)setFrameResults:(id)a3
{
}

- (float)overallFaceQualityScore
{
  return self->_overallFaceQualityScore;
}

- (void)setOverallFaceQualityScore:(float)a3
{
  self->_float overallFaceQualityScore = a3;
}

- (float)qualityScoreForLivePhoto
{
  return self->_qualityScoreForLivePhoto;
}

- (void)setQualityScoreForLivePhoto:(float)a3
{
  self->_qualityScoreForLivePhoto = a3;
}

- (float)globalQualityScore
{
  return self->_globalQualityScore;
}

- (void)setGlobalQualityScore:(float)a3
{
  self->_globalQualityScore = a3;
}

- (float)visualPleasingScore
{
  return self->_visualPleasingScore;
}

- (void)setVisualPleasingScore:(float)a3
{
  self->_visualPleasingScore = a3;
}

- (float)penaltyScore
{
  return self->_penaltyScore;
}

- (void)setPenaltyScore:(float)a3
{
  self->_penaltyScore = a3;
}

- (float)contentScore
{
  return self->_contentScore;
}

- (void)setContentScore:(float)a3
{
  self->_contentScore = a3;
}

- (float)humanPoseScore
{
  return self->_humanPoseScore;
}

- (void)setHumanPoseScore:(float)a3
{
  self->_humanPoseScore = a3;
}

- (float)humanActionScore
{
  return self->_humanActionScore;
}

- (void)setHumanActionScore:(float)a3
{
  self->_humanActionScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameResults, 0);
  objc_storeStrong((id *)&self->_faceQualityScores, 0);
  objc_storeStrong((id *)&self->_detectedFaces, 0);
}

@end