@interface VCPMovieCurationAnalyzer
+ (BOOL)isSettlingEffectPregatingEnabled;
- (VCPMovieCurationAnalyzer)initWithAnalysisTypes:(unint64_t)a3 transform:(CGAffineTransform *)a4 timeRange:(id *)a5 isLivePhoto:(BOOL)a6 photoOffset:(float)a7 hadFlash:(BOOL)a8 hadZoom:(BOOL)a9 settlingHadZoom:(BOOL)a10 keyFrameResults:(id)a11 isTimelapse:(BOOL)a12 preferredTimeRange:(id *)a13 asset:(id)a14;
- (id)audioQualityScore:(id *)a3;
- (id)results;
- (int)analyzeKeyFrame:(__CVBuffer *)a3 timestamp:(id *)a4 duration:(id *)a5 frameStats:(id)a6 flags:(unint64_t *)a7 photoOffset:(float)a8;
- (int)generateMovieCurations;
- (int)postProcessKeyFrames;
- (void)addHighlight:(id)a3 to:(id)a4;
- (void)addSettling:(id)a3 to:(id)a4;
- (void)addSticker:(id)a3 to:(id)a4;
- (void)addSummary:(id)a3 to:(id)a4;
- (void)loadVideoAnalysisResults:(id)a3 audioAnalysisResults:(id)a4 videoCNNResults:(id)a5 andFaceRanges:(id)a6 frameSize:(CGSize)a7;
- (void)reportMovieCurationAnalysisResults:(id)a3 withSummaryAnalytics:(id)a4;
- (void)setMaxHighlightDuration:(float)a3;
@end

@implementation VCPMovieCurationAnalyzer

+ (BOOL)isSettlingEffectPregatingEnabled
{
  return 1;
}

- (VCPMovieCurationAnalyzer)initWithAnalysisTypes:(unint64_t)a3 transform:(CGAffineTransform *)a4 timeRange:(id *)a5 isLivePhoto:(BOOL)a6 photoOffset:(float)a7 hadFlash:(BOOL)a8 hadZoom:(BOOL)a9 settlingHadZoom:(BOOL)a10 keyFrameResults:(id)a11 isTimelapse:(BOOL)a12 preferredTimeRange:(id *)a13 asset:(id)a14
{
  BOOL v14 = a9;
  BOOL v15 = a8;
  BOOL v17 = a6;
  id v22 = a11;
  id v23 = a14;
  v44.receiver = self;
  v44.super_class = (Class)VCPMovieCurationAnalyzer;
  v24 = [(VCPMovieCurationAnalyzer *)&v44 init];
  v25 = v24;
  if (v24)
  {
    v24->_isLivePhoto = v17;
    v24->_hadFlash = v15;
    v24->_hadZoom = v14;
    v26 = [VCPVideoKeyFrameAnalyzer alloc];
    long long v27 = *(_OWORD *)&a4->c;
    v43[0] = *(_OWORD *)&a4->a;
    v43[1] = v27;
    v43[2] = *(_OWORD *)&a4->tx;
    long long v28 = *(_OWORD *)&a5->var0.var3;
    v42[0] = *(_OWORD *)&a5->var0.var0;
    v42[1] = v28;
    v42[2] = *(_OWORD *)&a5->var1.var1;
    uint64_t v29 = [(VCPVideoKeyFrameAnalyzer *)v26 initWithTransform:v43 timeRange:v42 isLivePhoto:v17 keyFrameResults:v22];
    keyFrameAnalyzer = v25->_keyFrameAnalyzer;
    v25->_keyFrameAnalyzer = (VCPVideoKeyFrameAnalyzer *)v29;

    v31 = [VCPMovieHighlightAnalyzer alloc];
    long long v32 = *(_OWORD *)&a13->var0.var3;
    v40[0] = *(_OWORD *)&a13->var0.var0;
    v40[1] = v32;
    long long v41 = *(_OWORD *)&a13->var1.var1;
    uint64_t v33 = [(VCPMovieHighlightAnalyzer *)v31 initWithAnalysisType:a3 isLivePhoto:v17 photoOffset:v15 hadFlash:v14 hadZoom:a10 settlingHadZoom:a12 isTimelapse:COERCE_DOUBLE(__PAIR64__(DWORD1(v41), LODWORD(a7))) preferredTimeRange:v40 asset:v23];
    highlightAnalyzer = v25->_highlightAnalyzer;
    v25->_highlightAnalyzer = (VCPMovieHighlightAnalyzer *)v33;

    v35 = v25->_keyFrameAnalyzer;
    if (v35)
    {
      v35 = v25->_highlightAnalyzer;
      if (v35)
      {
        long long v36 = *(_OWORD *)&a5->var0.var0;
        long long v37 = *(_OWORD *)&a5->var0.var3;
        *(_OWORD *)&v25->_timeRange.duration.timescale = *(_OWORD *)&a5->var1.var1;
        *(_OWORD *)&v25->_timeRange.start.epoch = v37;
        *(_OWORD *)&v25->_timeRange.start.value = v36;
        v35 = v25;
      }
    }
    v38 = v35;
  }
  else
  {
    v38 = 0;
  }

  return v38;
}

- (void)setMaxHighlightDuration:(float)a3
{
}

- (int)analyzeKeyFrame:(__CVBuffer *)a3 timestamp:(id *)a4 duration:(id *)a5 frameStats:(id)a6 flags:(unint64_t *)a7 photoOffset:(float)a8
{
  id v12 = a6;
  if (!self->_isLivePhoto) {
    goto LABEL_9;
  }
  CMTime time = (CMTime)*a4;
  if (CMTimeGetSeconds(&time) >= a8) {
    goto LABEL_9;
  }
  CMTime v30 = (CMTime)*a4;
  if (CMTimeGetSeconds(&v30) <= (float)(a8 + -0.5)) {
    goto LABEL_9;
  }
  highlightAnalyzer = self->_highlightAnalyzer;
  if (v12)
  {
    [v12 motionParam];
    [v12 motionParamDiff];
  }
  else
  {
    memset(v29, 0, sizeof(v29));
    memset(v28, 0, sizeof(v28));
  }
  int v14 = [(VCPMovieHighlightAnalyzer *)highlightAnalyzer analyzeMotionStability:v29 motionParamDiff:v28];
  if (!v14)
  {
    BOOL v15 = self->_highlightAnalyzer;
    [v12 subjectActionScore];
    int v17 = v16;
    [v12 subtleMotionScore];
    int v19 = v18;
    [v12 humanActionScore];
    LODWORD(v21) = v20;
    LODWORD(v22) = v17;
    LODWORD(v23) = v19;
    int v14 = [(VCPMovieHighlightAnalyzer *)v15 analyzeRankingScores:v22 subtleMotion:v23 humanAction:v21];
    if (!v14)
    {
LABEL_9:
      keyFrameAnalyzer = self->_keyFrameAnalyzer;
      long long v26 = *(_OWORD *)&a4->var0;
      int64_t var3 = a4->var3;
      int v14 = [(VCPVideoKeyFrameAnalyzer *)keyFrameAnalyzer analyzeFrame:a3 frameStats:v12 timestamp:&v26];
    }
  }

  return v14;
}

- (void)loadVideoAnalysisResults:(id)a3 audioAnalysisResults:(id)a4 videoCNNResults:(id)a5 andFaceRanges:(id)a6 frameSize:(CGSize)a7
{
  CGFloat height = a7.height;
  CGFloat width = a7.width;
  id v51 = a3;
  id v13 = a4;
  id v14 = a5;
  BOOL v15 = (NSDictionary *)a6;
  int v16 = [v51 objectForKeyedSubscript:@"FeatureVectorResults"];
  descriptorResults = self->_descriptorResults;
  self->_descriptorResults = v16;

  int v18 = [v51 objectForKeyedSubscript:@"QualityResults"];
  qualityResuls = self->_qualityResuls;
  self->_qualityResuls = v18;

  int v20 = [v51 objectForKeyedSubscript:@"InterestingnessResults"];
  junkResults = self->_junkResults;
  self->_junkResults = v20;

  double v22 = [v51 objectForKeyedSubscript:@"FaceResults"];
  faceResults = self->_faceResults;
  self->_faceResults = v22;

  v24 = [v51 objectForKeyedSubscript:@"PetsResults"];
  petsResults = self->_petsResults;
  self->_petsResults = v24;

  long long v26 = [v51 objectForKeyedSubscript:@"FineSubjectMotionResults"];
  actionResults = self->_actionResults;
  self->_actionResults = v26;

  long long v28 = [v51 objectForKeyedSubscript:@"SubtleMotionResults"];
  subtleMotionResults = self->_subtleMotionResults;
  self->_subtleMotionResults = v28;

  CMTime v30 = [v51 objectForKeyedSubscript:@"HumanActionResults"];
  humanActionResults = self->_humanActionResults;
  self->_humanActionResults = v30;

  long long v32 = [v51 objectForKeyedSubscript:@"HumanPoseResults"];
  humanPoseResults = self->_humanPoseResults;
  self->_humanPoseResults = v32;

  v34 = [v51 objectForKeyedSubscript:@"CameraMotionResults"];
  cameraMotionResults = self->_cameraMotionResults;
  self->_cameraMotionResults = v34;

  long long v36 = [v51 objectForKeyedSubscript:@"SaliencyResults"];
  saliencyResults = self->_saliencyResults;
  self->_saliencyResults = v36;

  v38 = [v51 objectForKeyedSubscript:@"SceneResults"];
  sceneResults = self->_sceneResults;
  self->_sceneResults = v38;

  v40 = [v51 objectForKeyedSubscript:@"OrientationResults"];
  orientationResults = self->_orientationResults;
  self->_orientationResults = v40;

  v42 = [v13 objectForKeyedSubscript:@"VoiceResults"];
  voiceResults = self->_voiceResults;
  self->_voiceResults = v42;

  objc_super v44 = [v13 objectForKeyedSubscript:@"AudioQualityResults"];
  audioQualityResults = self->_audioQualityResults;
  self->_audioQualityResults = v44;

  v46 = [v14 objectForKeyedSubscript:@"MLHighlightScoreResults"];
  mlHighlightScoreResults = self->_mlHighlightScoreResults;
  self->_mlHighlightScoreResults = v46;

  v48 = [v14 objectForKeyedSubscript:@"MLQualityResults"];
  mlQualityResults = self->_mlQualityResults;
  self->_mlQualityResults = v48;

  faceRanges = self->_faceRanges;
  self->_faceRanges = v15;

  self->_frameSize.CGFloat width = width;
  self->_frameSize.CGFloat height = height;
}

- (int)postProcessKeyFrames
{
  [(VCPVideoKeyFrameAnalyzer *)self->_keyFrameAnalyzer preparePostProcessingStatsFromFaceRange:self->_faceRanges junkResults:self->_junkResults];
  keyFrameAnalyzer = self->_keyFrameAnalyzer;
  return [(VCPVideoKeyFrameAnalyzer *)keyFrameAnalyzer postProcess];
}

- (int)generateMovieCurations
{
  int v3 = [(VCPMovieCurationAnalyzer *)self postProcessKeyFrames];
  if (v3) {
    return v3;
  }
  descriptorResults = self->_descriptorResults;
  qualityResuls = self->_qualityResuls;
  junkResults = self->_junkResults;
  faceResults = self->_faceResults;
  petsResults = self->_petsResults;
  saliencyResults = self->_saliencyResults;
  long long v15 = *(_OWORD *)&self->_actionResults;
  voiceResults = self->_voiceResults;
  highlightAnalyzer = self->_highlightAnalyzer;
  id v12 = [(VCPVideoKeyFrameAnalyzer *)self->_keyFrameAnalyzer keyFrames];
  int v3 = -[VCPMovieHighlightAnalyzer prepareRequiredQualityResult:junkDetectionResult:descriptorResult:faceResult:petsResult:saliencyResult:actionResult:subtleMotionResult:voiceResult:keyFrameResult:sceneResults:humanActionResults:humanPoseResults:cameraMotionResults:orientationResults:mlHighlightScoreResults:mlQualityResults:frameSize:](highlightAnalyzer, "prepareRequiredQualityResult:junkDetectionResult:descriptorResult:faceResult:petsResult:saliencyResult:actionResult:subtleMotionResult:voiceResult:keyFrameResult:sceneResults:humanActionResults:humanPoseResults:cameraMotionResults:orientationResults:mlHighlightScoreResults:mlQualityResults:frameSize:", qualityResuls, junkResults, descriptorResults, faceResults, petsResults, saliencyResults, self->_frameSize.width, self->_frameSize.height, v15, voiceResults, v12, self->_sceneResults, self->_humanActionResults, self->_humanPoseResults, self->_cameraMotionResults,
         self->_orientationResults,
         self->_mlHighlightScoreResults,
         self->_mlQualityResults);

  if (v3) {
    return v3;
  }
  id v14 = self->_highlightAnalyzer;
  return [(VCPMovieHighlightAnalyzer *)v14 generateHighlights];
}

- (id)audioQualityScore:(id *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v5 = [(NSArray *)self->_audioQualityResults count];
  if (!v5) {
    goto LABEL_21;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v6 = self->_audioQualityResults;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (!v7)
  {

LABEL_20:
    v5 = 0;
    goto LABEL_21;
  }
  uint64_t v8 = *(void *)v29;
  float v9 = 0.0;
  v10 = (CMTime *)MEMORY[0x1E4F1FA48];
  float v11 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v29 != v8) {
        objc_enumerationMutation(v6);
      }
      CFDictionaryRef v13 = *(const __CFDictionary **)(*((void *)&v28 + 1) + 8 * i);
      memset(&v27, 0, sizeof(v27));
      CMTimeRangeMakeFromDictionary(&v27, v13);
      id v14 = [(__CFDictionary *)v13 objectForKeyedSubscript:@"quality"];
      [v14 floatValue];
      float v16 = v15;

      CMTimeRange range = v27;
      memset(&v26, 0, sizeof(v26));
      long long v17 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&otherRange.start.epoch = v17;
      *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetIntersection(&v26, &range, &otherRange);
      if ((v26.start.flags & 1) != 0
        && (v26.duration.flags & 1) != 0
        && !v26.duration.epoch
        && (v26.duration.value & 0x8000000000000000) == 0)
      {
        CMTime time1 = v26.duration;
        CMTime time2 = *v10;
        if (!CMTimeCompare(&time1, &time2)) {
          continue;
        }
      }
      CMTime duration = v26.duration;
      float Seconds = CMTimeGetSeconds(&duration);
      float v9 = v9 + (float)(v16 * Seconds);
      float v11 = v11 + Seconds;
    }
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
  }
  while (v7);

  LODWORD(v19) = 1.0;
  if (v11 < 1.0) {
    goto LABEL_20;
  }
  if ((float)(v9 / v11) < 0.8) {
    *(float *)&double v19 = 0.0;
  }
  v5 = [NSNumber numberWithFloat:v19];
LABEL_21:
  return v5;
}

- (void)addHighlight:(id)a3 to:(id)a4
{
  v42[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    [v6 timerange];
    CMTime v40 = time;
    [v6 timerange];
    CMTime v37 = v39;
    [v6 score];
    int v9 = v8;
    [v6 bestPlaybackCrop];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    memset(&v36, 0, sizeof(v36));
    int v18 = [v6 keyFrame];
    double v19 = v18;
    if (v18) {
      [v18 timestamp];
    }
    else {
      memset(&v36, 0, sizeof(v36));
    }

    int v20 = [v6 keyFrame];
    [v20 score];
    int v22 = v21;

    double v23 = [v6 colorNormalization];
    v24 = [MEMORY[0x1E4F1CA60] dictionary];
    CMTime time = v36;
    CFDictionaryRef v25 = CMTimeCopyAsDictionary(&time, 0);
    [v24 setObject:v25 forKeyedSubscript:@"keyFrameTime"];

    LODWORD(v26) = v22;
    CMTimeRange v27 = [NSNumber numberWithFloat:v26];
    [v24 setObject:v27 forKeyedSubscript:@"keyFrameScore"];

    v43.origin.x = v11;
    v43.origin.y = v13;
    v43.size.CGFloat width = v15;
    v43.size.CGFloat height = v17;
    long long v28 = NSStringFromRect(v43);
    [v24 setObject:v28 forKeyedSubscript:@"bestPlaybackCrop"];

    if (!self->_isLivePhoto)
    {
      [v24 setObject:v23 forKeyedSubscript:@"colorNormalizationData"];
      [v6 timerange];
      long long v29 = [(VCPMovieCurationAnalyzer *)self audioQualityScore:v35];
      if (v29) {
        [v24 setObject:v29 forKeyedSubscript:@"audioQuality"];
      }
    }
    v41[0] = @"start";
    CMTime time = v40;
    CFDictionaryRef v30 = CMTimeCopyAsDictionary(&time, 0);
    v42[0] = v30;
    v41[1] = @"duration";
    CMTime time = v37;
    CFDictionaryRef v31 = CMTimeCopyAsDictionary(&time, 0);
    v42[1] = v31;
    v41[2] = @"quality";
    LODWORD(v32) = v9;
    uint64_t v33 = [NSNumber numberWithFloat:v32];
    v41[3] = @"attributes";
    v42[2] = v33;
    _OWORD v42[3] = v24;
    v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:4];
    [v7 addObject:v34];
  }
}

- (void)addSummary:(id)a3 to:(id)a4
{
  v50[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v38 = a4;
  if (v6)
  {
    [v6 timerange];
    CMTime v44 = time;
    [v6 timerange];
    *(_OWORD *)&v40.value = v42;
    v40.epoch = v43;
    [v6 score];
    int v8 = v7;
    long long v39 = 0uLL;
    int v9 = [v6 keyFrame];
    double v10 = v9;
    if (v9) {
      [v9 timestamp];
    }
    else {
      long long v39 = 0uLL;
    }

    CGFloat v11 = [v6 keyFrame];
    [v11 score];
    int v13 = v12;

    [v6 bestPlaybackCrop];
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    uint64_t v22 = [v6 isTrimmed];
    if ([v6 isAutoPlayable]) {
      uint64_t v23 = 0x80000;
    }
    else {
      uint64_t v23 = 0;
    }
    v49[0] = @"keyFrameTime";
    *(_OWORD *)&time.value = v39;
    time.epoch = 0;
    CFDictionaryRef v24 = CMTimeCopyAsDictionary(&time, 0);
    v50[0] = v24;
    v49[1] = @"keyFrameScore";
    LODWORD(v25) = v13;
    double v26 = [NSNumber numberWithFloat:v25];
    v50[1] = v26;
    v49[2] = @"bestPlaybackCrop";
    v51.origin.x = v15;
    v51.origin.y = v17;
    v51.size.CGFloat width = v19;
    v51.size.CGFloat height = v21;
    CMTimeRange v27 = NSStringFromRect(v51);
    v50[2] = v27;
    long long v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:3];

    v47 = @"summaryIsTrimmed";
    long long v29 = [NSNumber numberWithBool:v22];
    v48 = v29;
    CFDictionaryRef v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];

    v45[0] = @"start";
    CMTime time = v44;
    CFDictionaryRef v31 = CMTimeCopyAsDictionary(&time, 0);
    v46[0] = v31;
    v45[1] = @"duration";
    CMTime time = v40;
    CFDictionaryRef v32 = CMTimeCopyAsDictionary(&time, 0);
    v46[1] = v32;
    v45[2] = @"quality";
    LODWORD(v33) = v8;
    v34 = [NSNumber numberWithFloat:v33];
    v46[2] = v34;
    v45[3] = @"flags";
    v35 = [NSNumber numberWithUnsignedLongLong:v23];
    v45[4] = @"attributes";
    v46[3] = v35;
    v46[4] = v28;
    CMTime v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:5];
    [v38 addObject:v36];

    CMTime v37 = [v38 objectAtIndexedSubscript:0];
    [(VCPMovieCurationAnalyzer *)self reportMovieCurationAnalysisResults:v37 withSummaryAnalytics:v30];
  }
  else
  {
    [(VCPMovieCurationAnalyzer *)self reportMovieCurationAnalysisResults:0 withSummaryAnalytics:0];
  }
}

- (void)addSticker:(id)a3 to:(id)a4
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    v14[0] = @"start";
    [v5 timerange];
    v12[0] = v12[2];
    CFDictionaryRef v7 = CMTimeCopyAsDictionary(v12, 0);
    v15[0] = v7;
    v14[1] = @"duration";
    [v5 timerange];
    CMTime time = v12[1];
    CFDictionaryRef v8 = CMTimeCopyAsDictionary(&time, 0);
    v15[1] = v8;
    v14[2] = @"quality";
    int v9 = NSNumber;
    [v5 score];
    double v10 = objc_msgSend(v9, "numberWithFloat:");
    v15[2] = v10;
    CGFloat v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
    [v6 addObject:v11];
  }
}

- (void)addSettling:(id)a3 to:(id)a4
{
  v38[6] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v29 = a4;
  if (v6)
  {
    [v6 timerange];
    CMTime v34 = time;
    [v6 timerange];
    *(_OWORD *)&v30.value = v32;
    v30.epoch = v33;
    [v6 score];
    int v8 = v7;
    if ([v6 isSettlingOK]) {
      uint64_t v9 = 0x10000000;
    }
    else {
      uint64_t v9 = 0;
    }
    v37[0] = @"AutoplayScore";
    double v10 = NSNumber;
    [v6 autoplayScore];
    CGFloat v11 = objc_msgSend(v10, "numberWithFloat:");
    v38[0] = v11;
    v37[1] = @"ExposureChangeScore";
    int v12 = NSNumber;
    [v6 exposureChangeScore];
    int v13 = objc_msgSend(v12, "numberWithFloat:");
    v38[1] = v13;
    v37[2] = @"SharpnessScore";
    double v14 = NSNumber;
    [v6 sharpnessScore];
    CGFloat v15 = objc_msgSend(v14, "numberWithFloat:");
    v38[2] = v15;
    v37[3] = @"ZoomChangeScore";
    double v16 = NSNumber;
    [v6 zoomChangeScore];
    CGFloat v17 = objc_msgSend(v16, "numberWithFloat:");
    v38[3] = v17;
    v37[4] = @"FlashScore";
    double v18 = NSNumber;
    [v6 flashScore];
    CGFloat v19 = objc_msgSend(v18, "numberWithFloat:");
    v38[4] = v19;
    v37[5] = @"RankingLevel";
    double v20 = NSNumber;
    [(VCPMovieHighlightAnalyzer *)self->_highlightAnalyzer rankingLevel];
    CGFloat v21 = objc_msgSend(v20, "numberWithFloat:");
    v38[5] = v21;
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:6];

    v35[0] = @"start";
    CMTime time = v34;
    CFDictionaryRef v23 = CMTimeCopyAsDictionary(&time, 0);
    v36[0] = v23;
    v35[1] = @"duration";
    CMTime time = v30;
    CFDictionaryRef v24 = CMTimeCopyAsDictionary(&time, 0);
    v36[1] = v24;
    v35[2] = @"quality";
    LODWORD(v25) = v8;
    double v26 = [NSNumber numberWithFloat:v25];
    v36[2] = v26;
    v35[3] = @"flags";
    CMTimeRange v27 = [NSNumber numberWithUnsignedLongLong:v9];
    v35[4] = @"attributes";
    v36[3] = v27;
    v36[4] = v22;
    long long v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:5];
    [v29 addObject:v28];
  }
}

- (id)results
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v24 = [MEMORY[0x1E4F1CA48] array];
  CMTime v30 = [MEMORY[0x1E4F1CA48] array];
  id v29 = [MEMORY[0x1E4F1CA48] array];
  CFDictionaryRef v23 = [MEMORY[0x1E4F1CA48] array];
  double v25 = [MEMORY[0x1E4F1CA48] array];
  double v26 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v2 = [(VCPMovieHighlightAnalyzer *)self->_highlightAnalyzer results];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v41 != v4) {
          objc_enumerationMutation(v2);
        }
        [(VCPMovieCurationAnalyzer *)self addHighlight:*(void *)(*((void *)&v40 + 1) + 8 * i) to:v30];
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v3);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = [(VCPMovieHighlightAnalyzer *)self->_highlightAnalyzer highlightScoreResults];
  uint64_t v6 = [obj countByEnumeratingWithState:&v36 objects:v47 count:16];
  if (v6)
  {
    uint64_t v28 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v6; ++j)
      {
        if (*(void *)v37 != v28) {
          objc_enumerationMutation(obj);
        }
        int v8 = *(void **)(*((void *)&v36 + 1) + 8 * j);
        v45[0] = @"start";
        if (v8)
        {
          [v8 timerange];
        }
        else
        {
          long long v34 = 0u;
          long long v35 = 0u;
          long long v33 = 0u;
        }
        *(_OWORD *)&time[0].value = v33;
        time[0].epoch = v34;
        CFDictionaryRef v9 = CMTimeCopyAsDictionary(time, 0);
        v46[0] = v9;
        v45[1] = @"duration";
        if (v8) {
          [v8 timerange];
        }
        else {
          memset(time, 0, sizeof(time));
        }
        CMTime v44 = time[1];
        CFDictionaryRef v10 = CMTimeCopyAsDictionary(&v44, 0);
        v46[1] = v10;
        v45[2] = @"quality";
        CGFloat v11 = NSNumber;
        [v8 score];
        int v12 = objc_msgSend(v11, "numberWithFloat:");
        v46[2] = v12;
        int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:3];
        [v29 addObject:v13];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v36 objects:v47 count:16];
    }
    while (v6);
  }

  double v14 = [(VCPMovieHighlightAnalyzer *)self->_highlightAnalyzer movieSummary];
  [(VCPMovieCurationAnalyzer *)self addSummary:v14 to:v24];

  CGFloat v15 = [(VCPMovieHighlightAnalyzer *)self->_highlightAnalyzer animatedStickerGating];
  [(VCPMovieCurationAnalyzer *)self addSticker:v15 to:v25];

  if (+[VCPMovieCurationAnalyzer isSettlingEffectPregatingEnabled])
  {
    double v16 = [(VCPMovieHighlightAnalyzer *)self->_highlightAnalyzer settlingEffects];
    [(VCPMovieCurationAnalyzer *)self addSettling:v16 to:v23];
  }
  if ([v24 count]) {
    [v26 setObject:v24 forKey:@"MovieSummaryResults"];
  }
  if ([v30 count]) {
    [v26 setObject:v30 forKey:@"MovieHighlightResults"];
  }
  CGFloat v17 = [(VCPVideoKeyFrameAnalyzer *)self->_keyFrameAnalyzer keyFrameScores];
  BOOL v18 = [v17 count] == 0;

  if (!v18)
  {
    CGFloat v19 = [(VCPVideoKeyFrameAnalyzer *)self->_keyFrameAnalyzer keyFrameScores];
    [v26 setObject:v19 forKey:@"KeyFrameResults"];
  }
  if ([v29 count]) {
    [v26 setObject:v29 forKey:@"MovieHighlightScoreResults"];
  }
  if ([v23 count]) {
    [v26 setObject:v23 forKey:@"SettlingEffectsGatingResults"];
  }
  if ([v25 count]) {
    [v26 setObject:v25 forKey:@"AnimatedStickerResults"];
  }
  if ([v26 count]) {
    double v20 = v26;
  }
  else {
    double v20 = 0;
  }
  id v21 = v20;

  return v21;
}

- (void)reportMovieCurationAnalysisResults:(id)a3 withSummaryAnalytics:(id)a4
{
  v32[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v6)
  {
    if (!v7) {
      goto LABEL_8;
    }
    CFDictionaryRef v9 = [v6 objectForKeyedSubscript:@"quality"];
    [v9 floatValue];
    float v11 = v10;
    int v12 = [v6 objectForKeyedSubscript:@"flags"];
    unsigned int v13 = [v12 unsignedIntegerValue];

    CFDictionaryRef v14 = [v6 objectForKeyedSubscript:@"duration"];
    CMTimeMakeFromDictionary(&v26, v14);
    double Seconds = CMTimeGetSeconds(&v26);

    double v16 = [v7 objectForKeyedSubscript:@"summaryIsTrimmed"];
    uint64_t v17 = [v16 BOOLValue];

    *(float *)&double v18 = v11 * (float)((v13 >> 19) & 1);
    v31[0] = @"AutoPlayableScore";
    CGFloat v19 = [NSNumber numberWithFloat:v18];
    *(float *)&double v20 = Seconds;
    v32[0] = v19;
    v31[1] = @"SummaryDuration";
    id v21 = [NSNumber numberWithFloat:v20];
    v32[1] = v21;
    v31[2] = @"IsTrimmed";
    uint64_t v22 = [NSNumber numberWithInt:v17];
    v32[2] = v22;
    CFDictionaryRef v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];
    [v8 addEntriesFromDictionary:v23];
  }
  if (self->_isLivePhoto)
  {
    id v29 = @"MediaType";
    CMTime v30 = @"livePhoto";
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  }
  else
  {
    CMTimeRange v27 = @"MediaType";
    uint64_t v28 = @"movie";
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  CFDictionaryRef v24 = };
  [v8 addEntriesFromDictionary:v24];

  double v25 = +[VCPMADCoreAnalyticsManager sharedManager];
  [v25 sendEvent:@"com.apple.mediaanalysisd.moviecurationresults" withAnalytics:v8];

LABEL_8:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceRanges, 0);
  objc_storeStrong((id *)&self->_mlQualityResults, 0);
  objc_storeStrong((id *)&self->_mlHighlightScoreResults, 0);
  objc_storeStrong((id *)&self->_orientationResults, 0);
  objc_storeStrong((id *)&self->_saliencyResults, 0);
  objc_storeStrong((id *)&self->_cameraMotionResults, 0);
  objc_storeStrong((id *)&self->_humanPoseResults, 0);
  objc_storeStrong((id *)&self->_humanActionResults, 0);
  objc_storeStrong((id *)&self->_sceneResults, 0);
  objc_storeStrong((id *)&self->_audioQualityResults, 0);
  objc_storeStrong((id *)&self->_voiceResults, 0);
  objc_storeStrong((id *)&self->_subtleMotionResults, 0);
  objc_storeStrong((id *)&self->_actionResults, 0);
  objc_storeStrong((id *)&self->_petsResults, 0);
  objc_storeStrong((id *)&self->_faceResults, 0);
  objc_storeStrong((id *)&self->_junkResults, 0);
  objc_storeStrong((id *)&self->_qualityResuls, 0);
  objc_storeStrong((id *)&self->_descriptorResults, 0);
  objc_storeStrong((id *)&self->_highlightAnalyzer, 0);
  objc_storeStrong((id *)&self->_keyFrameAnalyzer, 0);
}

@end