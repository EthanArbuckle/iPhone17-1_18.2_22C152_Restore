@interface VCPVideoKeyFrameAnalyzer
+ (BOOL)isLivePhotoKeyFrameEnabled;
- (VCPVideoKeyFrameAnalyzer)initWithTransform:(CGAffineTransform *)a3 timeRange:(id *)a4 isLivePhoto:(BOOL)a5 keyFrameResults:(id)a6;
- (float)computeMinDistanceBetween:(id)a3 withSet:(id)a4;
- (id)keyFrameScores;
- (id)keyFrames;
- (int)analyzeFrame:(__CVBuffer *)a3 frameStats:(id)a4 timestamp:(id *)a5;
- (int)computeFaceQualityOfFrame:(__CVBuffer *)a3;
- (int)computeSharpnessOfFrame:(__CVBuffer *)a3;
- (int)finalizeKeyFrame;
- (int)loadKeyFrameResults:(id *)a3;
- (int)postProcess;
- (void)adjustScoreByFace;
- (void)modulateByExposure;
- (void)modulateByJunk;
- (void)modulateByTimeRange;
- (void)prepareFrameStats:(id)a3 timeStamp:(id *)a4;
- (void)preparePostProcessingStatsFromFaceRange:(id)a3 junkResults:(id)a4;
- (void)setBlurAnalyzerFaceResults:(id)a3;
- (void)setKeyFrameTime:(id *)a3 isHeadingFrame:(BOOL)a4;
@end

@implementation VCPVideoKeyFrameAnalyzer

+ (BOOL)isLivePhotoKeyFrameEnabled
{
  return 0;
}

- (VCPVideoKeyFrameAnalyzer)initWithTransform:(CGAffineTransform *)a3 timeRange:(id *)a4 isLivePhoto:(BOOL)a5 keyFrameResults:(id)a6
{
  BOOL v7 = a5;
  id v10 = a6;
  v28.receiver = self;
  v28.super_class = (Class)VCPVideoKeyFrameAnalyzer;
  v11 = [(VCPVideoKeyFrameAnalyzer *)&v28 init];
  if (v11)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    keyFrames = v11->_keyFrames;
    v11->_keyFrames = (NSMutableArray *)v12;

    v14 = [[VCPImageBlurAnalyzer alloc] initWithFaceResults:0 sdof:0];
    blurAnalyzer = v11->_blurAnalyzer;
    v11->_blurAnalyzer = v14;

    v16 = objc_alloc_init(VCPImageFaceQualityAnalyzer);
    faceQualityAnalyzer = v11->_faceQualityAnalyzer;
    v11->_faceQualityAnalyzer = v16;

    long long v18 = *(_OWORD *)&a4->var0.var0;
    long long v19 = *(_OWORD *)&a4->var1.var1;
    *(_OWORD *)&v11->_timeRange.start.epoch = *(_OWORD *)&a4->var0.var3;
    *(_OWORD *)&v11->_timeRange.duration.timescale = v19;
    *(_OWORD *)&v11->_timeRange.start.value = v18;
    v20 = [[VCPVideoKeyFrame alloc] initWithLivePhoto:v7];
    activeKeyFrame = v11->_activeKeyFrame;
    v11->_activeKeyFrame = v20;

    faceRanges = v11->_faceRanges;
    v11->_faceRanges = 0;

    v11->_isLivePhoto = v7;
    uint64_t v23 = [MEMORY[0x1E4F1CA48] array];
    keyFrameScores = v11->_keyFrameScores;
    v11->_keyFrameScores = (NSMutableArray *)v23;

    objc_storeStrong((id *)&v11->_inputKeyFrameResults, a6);
    if (!v11->_blurAnalyzer || !v11->_faceQualityAnalyzer || (v25 = v11, !v11->_activeKeyFrame)) {
      v25 = 0;
    }
    v26 = v25;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)keyFrameScores
{
  return self->_keyFrameScores;
}

- (int)analyzeFrame:(__CVBuffer *)a3 frameStats:(id)a4 timestamp:(id *)a5
{
  id v8 = a4;
  {
    CMTimeMake((CMTime *)-[VCPVideoKeyFrameAnalyzer analyzeFrame:frameStats:timestamp:]::kHeadingTime, 1, 1);
  }
  long long v26 = *(_OWORD *)&a5->var0;
  int64_t var3 = a5->var3;
  CMTime lhs = (CMTime)*a5;
  CMTime rhs = (CMTime)self->_timeRange.start;
  CMTimeSubtract(&v25, &lhs, &rhs);
  CMTime lhs = v25;
  CMTime rhs = *(CMTime *)-[VCPVideoKeyFrameAnalyzer analyzeFrame:frameStats:timestamp:]::kHeadingTime;
  [(VCPVideoKeyFrameAnalyzer *)self setKeyFrameTime:&v26 isHeadingFrame:CMTimeCompare(&lhs, &rhs) >> 31];
  long long v23 = *(_OWORD *)&a5->var0;
  int64_t v24 = a5->var3;
  [(VCPVideoKeyFrameAnalyzer *)self prepareFrameStats:v8 timeStamp:&v23];
  if (([(VCPVideoKeyFrame *)self->_activeKeyFrame statsFlags] & 1) == 0
    && ([(VCPVideoKeyFrame *)self->_activeKeyFrame statsFlags] & 0x10) == 0)
  {
    int v9 = 0;
    goto LABEL_27;
  }
  if (([(VCPVideoKeyFrame *)self->_activeKeyFrame statsFlags] & 0x10) == 0
    || ([(VCPVideoKeyFrame *)self->_activeKeyFrame statsFlags] & 1) != 0)
  {
    id v10 = VCPSignPostLog();
    os_signpost_id_t v11 = os_signpost_id_generate(v10);

    uint64_t v12 = VCPSignPostLog();
    v13 = v12;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      LOWORD(lhs.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "VCPVideoKeyFrameBlurAnalyzer", "", (uint8_t *)&lhs, 2u);
    }

    int v9 = [(VCPVideoKeyFrameAnalyzer *)self computeSharpnessOfFrame:a3];
    if (v9) {
      goto LABEL_27;
    }
    v14 = VCPSignPostLog();
    v15 = v14;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      LOWORD(lhs.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v15, OS_SIGNPOST_INTERVAL_END, v11, "VCPVideoKeyFrameBlurAnalyzer", "", (uint8_t *)&lhs, 2u);
    }
  }
  if (!+[VCPVideoKeyFrameAnalyzer isLivePhotoKeyFrameEnabled]|| ([(VCPVideoKeyFrame *)self->_activeKeyFrame statsFlags] & 1) == 0|| !self->_isLivePhoto)
  {
LABEL_26:
    int v9 = [(VCPVideoKeyFrameAnalyzer *)self finalizeKeyFrame];
    goto LABEL_27;
  }
  v16 = VCPSignPostLog();
  os_signpost_id_t v17 = os_signpost_id_generate(v16);

  long long v18 = VCPSignPostLog();
  long long v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    LOWORD(lhs.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "VCPVideoKeyFrameFaceQualityAnalyzer", "", (uint8_t *)&lhs, 2u);
  }

  int v9 = [(VCPVideoKeyFrameAnalyzer *)self computeFaceQualityOfFrame:a3];
  if (!v9)
  {
    v20 = VCPSignPostLog();
    v21 = v20;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      LOWORD(lhs.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v21, OS_SIGNPOST_INTERVAL_END, v17, "VCPVideoKeyFrameFaceQualityAnalyzer", "", (uint8_t *)&lhs, 2u);
    }

    goto LABEL_26;
  }
LABEL_27:

  return v9;
}

- (int)loadKeyFrameResults:(id *)a3
{
  if (self->_inputKeyFrameResults)
  {
    unint64_t v5 = [(NSMutableArray *)self->_keyFrames count];
    if (v5 < [(NSArray *)self->_inputKeyFrameResults count])
    {
      v6 = [(NSArray *)self->_inputKeyFrameResults objectAtIndexedSubscript:[(NSMutableArray *)self->_keyFrames count]];
      activeKeyFrame = self->_activeKeyFrame;
      long long v9 = *(_OWORD *)&a3->var0;
      int64_t var3 = a3->var3;
      [(VCPVideoKeyFrame *)activeKeyFrame loadKeyFrameResult:v6 timestamp:&v9];
    }
  }
  return 0;
}

- (void)preparePostProcessingStatsFromFaceRange:(id)a3 junkResults:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v11];
  faceRanges = self->_faceRanges;
  self->_faceRanges = v7;

  long long v9 = [MEMORY[0x1E4F1C978] arrayWithArray:v6];
  junkResults = self->_junkResults;
  self->_junkResults = v9;
}

- (int)postProcess
{
  return 0;
}

- (id)keyFrames
{
  return self->_keyFrames;
}

- (void)setBlurAnalyzerFaceResults:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id obj = v10;
  uint64_t v4 = [obj countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(obj);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v6) bounds];
        long long v19 = @"attributes";
        os_signpost_id_t v17 = @"faceBounds";
        BOOL v7 = NSStringFromRect(v23);
        long long v18 = v7;
        id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
        v20 = v8;
        long long v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
        [v3 addObject:v9];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v4);
  }

  [(VCPImageBlurAnalyzer *)self->_blurAnalyzer setFaceResults:v3];
}

- (int)computeFaceQualityOfFrame:(__CVBuffer *)a3
{
  uint64_t v5 = [(VCPVideoKeyFrame *)self->_activeKeyFrame detectedFaces];
  if (![v5 count]) {
    goto LABEL_5;
  }
  uint64_t v6 = [(VCPVideoKeyFrame *)self->_activeKeyFrame detectedFaces];
  BOOL v7 = [v6 objectAtIndexedSubscript:0];
  id v8 = [v7 observation];

  if (!v8) {
    return 0;
  }
  faceQualityAnalyzer = self->_faceQualityAnalyzer;
  id v10 = [(VCPVideoKeyFrame *)self->_activeKeyFrame detectedFaces];
  int v11 = [(VCPImageFaceQualityAnalyzer *)faceQualityAnalyzer analyzeDetectedFaces:a3 faceResults:v10 cancel:&__block_literal_global_21];

  if (!v11)
  {
    uint64_t v5 = [(VCPImageFaceQualityAnalyzer *)self->_faceQualityAnalyzer faceQualityScores];
    uint64_t v12 = (void *)[v5 mutableCopy];
    [(VCPVideoKeyFrame *)self->_activeKeyFrame setFaceQualityScores:v12];

LABEL_5:
    return 0;
  }
  return v11;
}

uint64_t __54__VCPVideoKeyFrameAnalyzer_computeFaceQualityOfFrame___block_invoke()
{
  return 0;
}

- (int)computeSharpnessOfFrame:(__CVBuffer *)a3
{
  uint64_t v24 = 0;
  uint64_t v5 = [(VCPVideoKeyFrame *)self->_activeKeyFrame detectedFaces];
  [(VCPVideoKeyFrameAnalyzer *)self setBlurAnalyzerFaceResults:v5];

  blurAnalyzer = self->_blurAnalyzer;
  id v23 = 0;
  int v7 = [(VCPImageBlurAnalyzer *)blurAnalyzer analyzePixelBuffer:a3 flags:&v24 results:&v23 cancel:&__block_literal_global_236];
  id v8 = v23;
  long long v9 = v8;
  if (!v7)
  {
    id v10 = [v8 objectForKeyedSubscript:@"BlurResults"];
    int v11 = [v10 objectAtIndexedSubscript:0];
    uint64_t v12 = [v11 objectForKeyedSubscript:@"attributes"];

    long long v13 = [v12 objectForKeyedSubscript:@"sharpness"];
    [v13 floatValue];
    int v15 = v14;

    long long v16 = [v12 objectForKeyedSubscript:@"sharpnessFaces"];

    if (v16)
    {
      long long v18 = [v12 objectForKeyedSubscript:@"sharpnessFaces"];
      [v18 floatValue];
      int v20 = v19;
    }
    else
    {
      int v20 = 0;
    }
    LODWORD(v17) = v15;
    [(VCPVideoKeyFrame *)self->_activeKeyFrame setSharpness:v17];
    [(VCPImageBlurAnalyzer *)self->_blurAnalyzer textureScore];
    -[VCPVideoKeyFrame setTextureScore:](self->_activeKeyFrame, "setTextureScore:");
    LODWORD(v21) = v20;
    [(VCPVideoKeyFrame *)self->_activeKeyFrame setFaceSharpness:v21];
    [(VCPVideoKeyFrame *)self->_activeKeyFrame setStatsFlags:[(VCPVideoKeyFrame *)self->_activeKeyFrame statsFlags] | 1];
  }
  return v7;
}

uint64_t __52__VCPVideoKeyFrameAnalyzer_computeSharpnessOfFrame___block_invoke()
{
  return 0;
}

- (int)finalizeKeyFrame
{
  [(VCPVideoKeyFrame *)self->_activeKeyFrame computeCurationScore];
  [(NSMutableArray *)self->_keyFrames addObject:self->_activeKeyFrame];
  if (self->_isLivePhoto)
  {
    keyFrameScores = self->_keyFrameScores;
    uint64_t v4 = [(VCPVideoKeyFrame *)self->_activeKeyFrame frameResults];
    [(NSMutableArray *)keyFrameScores addObject:v4];
  }
  uint64_t v5 = [[VCPVideoKeyFrame alloc] initWithLivePhoto:self->_isLivePhoto];
  activeKeyFrame = self->_activeKeyFrame;
  self->_activeKeyFrame = v5;

  if (self->_activeKeyFrame) {
    return 0;
  }
  else {
    return -108;
  }
}

- (void)adjustScoreByFace
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__13;
  v38 = __Block_byref_object_dispose__13;
  id v39 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  int v33 = 0;
  faceRanges = self->_faceRanges;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __45__VCPVideoKeyFrameAnalyzer_adjustScoreByFace__block_invoke;
  v31[3] = &unk_1E62985D8;
  v31[4] = v32;
  v31[5] = &v34;
  [(NSDictionary *)faceRanges enumerateKeysAndObjectsUsingBlock:v31];
  double v17 = [(NSDictionary *)self->_faceRanges objectForKeyedSubscript:v35[5]];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = self->_keyFrames;
  uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v27 objects:v43 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v28 != v5) {
          objc_enumerationMutation(obj);
        }
        int v7 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v8 = v17;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v42 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v24;
          while (2)
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v24 != v10) {
                objc_enumerationMutation(v8);
              }
              uint64_t v12 = *(void **)(*((void *)&v23 + 1) + 8 * j);
              if (v12)
              {
                [*(id *)(*((void *)&v23 + 1) + 8 * j) start];
                [v12 last];
                [v12 start];
              }
              else
              {
                memset(&start, 0, sizeof(start));
                memset(v19, 0, sizeof(v19));
              }
              CMTime lhs = v19[1];
              CMTime rhs = v19[0];
              CMTimeSubtract(&duration, &lhs, &rhs);
              CMTimeRangeMake(&range, &start, &duration);
              if (v7) {
                [v7 timestamp];
              }
              else {
                memset(&time, 0, sizeof(time));
              }
              if (CMTimeRangeContainsTime(&range, &time))
              {

                goto LABEL_25;
              }
            }
            uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v42 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }

        int v13 = [v7 hasGoodSubjectAction];
        [v7 score];
        if (v13) {
          float v15 = 1.0;
        }
        else {
          float v15 = 0.7;
        }
        *(float *)&double v14 = v15 * *(float *)&v14;
        [v7 setScore:v14];
LABEL_25:
        ;
      }
      uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v27 objects:v43 count:16];
    }
    while (v4);
  }

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(&v34, 8);
}

void __45__VCPVideoKeyFrameAnalyzer_adjustScoreByFace__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = a3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
    float v10 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (v12)
        {
          [*(id *)(*((void *)&v16 + 1) + 8 * i) last];
          [v12 start];
        }
        else
        {
          memset(v14, 0, sizeof(v14));
        }
        CMTime lhs = v14[1];
        CMTime rhs = v14[0];
        CMTimeSubtract(&time, &lhs, &rhs);
        float v10 = CMTimeGetSeconds(&time) + v10;
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v8);
  }
  else
  {
    float v10 = 0.0;
  }

  uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v10 > *(float *)(v13 + 24))
  {
    *(float *)(v13 + 24) = v10;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (void)modulateByTimeRange
{
  $95D729B680665BEAEFA1D6FCA8238556 duration = self->_timeRange.duration;
  float Seconds = CMTimeGetSeconds((CMTime *)&duration);
  if (Seconds >= 3.0)
  {
    uint64_t v4 = [(NSMutableArray *)self->_keyFrames firstObject];
    uint64_t v5 = [(NSMutableArray *)self->_keyFrames lastObject];
    [v4 score];
    *(float *)&double v7 = v6 * 0.8;
    [v4 setScore:v7];
    [v5 score];
    *(float *)&double v9 = v8 * 0.8;
    [v5 setScore:v9];
  }
}

- (void)modulateByExposure
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v3 = self->_keyFrames;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v29;
    float v6 = INFINITY;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v29 != v5) {
          objc_enumerationMutation(v3);
        }
        float v8 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        [v8 exposureScore];
        if (v9 < v6)
        {
          [v8 exposureScore];
          float v6 = v10;
        }
      }
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v4);
  }
  else
  {
    float v6 = INFINITY;
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  int v11 = self->_keyFrames;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v12)
  {
    double v13 = fmaxf(v6 * 1.5, 15.0);
    float v14 = v13 * 6.28318531 * v13;
    uint64_t v15 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v11);
        }
        long long v17 = *(void **)(*((void *)&v24 + 1) + 8 * j);
        objc_msgSend(v17, "exposureScore", (void)v24);
        *(float *)&double v19 = expf((float)-(float)((float)(v18 - v6) * (float)(v18 - v6)) / v14);
        [v17 setExposureScore:v19];
        [v17 exposureScore];
        float v21 = v20;
        [v17 score];
        *(float *)&double v23 = v21 * v22;
        [v17 setScore:v23];
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v12);
  }
}

- (void)modulateByJunk
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = self->_keyFrames;
  uint64_t v19 = [(NSMutableArray *)obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v19)
  {
    uint64_t v17 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v32 != v17) {
          objc_enumerationMutation(obj);
        }
        v2 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        v3 = self->_junkResults;
        uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v27 objects:v35 count:16];
        float v5 = 1.0;
        if (v4)
        {
          uint64_t v6 = *(void *)v28;
          while (2)
          {
            for (uint64_t j = 0; j != v4; ++j)
            {
              if (*(void *)v28 != v6) {
                objc_enumerationMutation(v3);
              }
              float v8 = *(void **)(*((void *)&v27 + 1) + 8 * j);
              float v9 = [v8 objectForKeyedSubscript:@"quality"];
              [v9 floatValue];
              BOOL v11 = v10 < 0.35;

              if (v11)
              {
                memset(&v26, 0, sizeof(v26));
                CFDictionaryRef v12 = [v8 objectForKeyedSubscript:@"start"];
                CMTimeMakeFromDictionary(&v26, v12);

                memset(&v25, 0, sizeof(v25));
                CFDictionaryRef v13 = [v8 objectForKeyedSubscript:@"duration"];
                CMTimeMakeFromDictionary(&v25, v13);

                CMTime start = v26;
                CMTime duration = v25;
                CMTimeRangeMake(&range, &start, &duration);
                if (v2) {
                  [v2 timestamp];
                }
                else {
                  memset(&time, 0, sizeof(time));
                }
                if (CMTimeRangeContainsTime(&range, &time))
                {
                  float v5 = 0.0;
                  goto LABEL_20;
                }
              }
            }
            uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v27 objects:v35 count:16];
            if (v4) {
              continue;
            }
            break;
          }
        }
LABEL_20:

        [v2 score];
        *(float *)&double v15 = v5 * v14;
        [v2 setScore:v15];
      }
      uint64_t v19 = [(NSMutableArray *)obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v19);
  }
}

- (void)setKeyFrameTime:(id *)a3 isHeadingFrame:(BOOL)a4
{
  BOOL v4 = a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
  [(VCPVideoKeyFrame *)self->_activeKeyFrame setTimestamp:&v6];
  [(VCPVideoKeyFrame *)self->_activeKeyFrame setIsHeadingFrame:v4];
}

- (void)prepareFrameStats:(id)a3 timeStamp:(id *)a4
{
  id v6 = a3;
  [(VCPVideoKeyFrame *)self->_activeKeyFrame resetStatsFlag];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v39 = *a4;
  [(VCPVideoKeyFrameAnalyzer *)self loadKeyFrameResults:&v39];
  activeKeyFrame = self->_activeKeyFrame;
  uint64_t v8 = [v6 frameProcessedByFaceDetector];
  float v9 = [v6 detectedFaces];
  [(VCPVideoKeyFrame *)activeKeyFrame setFaceStatsFlag:v8 detectedFaces:v9];

  float v10 = self->_activeKeyFrame;
  [v6 frameExpressionScore];
  -[VCPVideoKeyFrame setExpressionChangeScore:](v10, "setExpressionChangeScore:");
  BOOL v11 = self->_activeKeyFrame;
  uint64_t v12 = [v6 frameProcessedByVideoAnalyzer];
  [v6 cameraMotionScore];
  int v14 = v13;
  [v6 subjectActionScore];
  int v16 = v15;
  [v6 interestingnessScore];
  int v18 = v17;
  [v6 obstructionScore];
  int v20 = v19;
  [v6 colorfulnessScore];
  int v22 = v21;
  [v6 exposureScore];
  int v24 = v23;
  uint64_t v25 = [v6 frameProcessedByHumanAnalyzer];
  [v6 humanPoseScore];
  int v27 = v26;
  [v6 humanActionScore];
  int v29 = v28;
  uint64_t v30 = [v6 subMbMotionAvailable];
  LODWORD(v31) = v14;
  LODWORD(v32) = v16;
  LODWORD(v33) = v18;
  LODWORD(v34) = v20;
  LODWORD(v35) = v22;
  LODWORD(v36) = v24;
  LODWORD(v37) = v27;
  LODWORD(v38) = v29;
  [(VCPVideoKeyFrame *)v11 setMotionStatsFlag:v12 cameraMotion:v25 subjectAction:v30 interestingness:v31 obstruction:v32 colorfulness:v33 exposureScore:v34 humanActionStatsFlag:v35 humanPoseScore:v36 humanActionScore:v37 subMb:v38];
}

- (float)computeMinDistanceBetween:(id)a3 withSet:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    float v9 = INFINITY;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        float v14 = 0.0;
        int v12 = [v5 computeDistance:&v14 toDescriptor:v11];
        if (v12)
        {
          float v9 = (float)v12;
          goto LABEL_14;
        }
        if (v14 < v9) {
          float v9 = v14;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    float v9 = INFINITY;
  }
LABEL_14:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputKeyFrameResults, 0);
  objc_storeStrong((id *)&self->_keyFrameScores, 0);
  objc_storeStrong((id *)&self->_activeKeyFrame, 0);
  objc_storeStrong((id *)&self->_keyFrames, 0);
  objc_storeStrong((id *)&self->_junkResults, 0);
  objc_storeStrong((id *)&self->_faceRanges, 0);
  objc_storeStrong((id *)&self->_faceQualityAnalyzer, 0);
  objc_storeStrong((id *)&self->_blurAnalyzer, 0);
}

@end