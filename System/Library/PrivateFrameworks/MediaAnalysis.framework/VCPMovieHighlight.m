@interface VCPMovieHighlight
- ($D854FC4CDD8DDEA9B2859E823A7C8A75)timerange;
- (BOOL)isAutoPlayable;
- (BOOL)isSettlingOK;
- (BOOL)isShort;
- (BOOL)isTrimmed;
- (CGRect)bestPlaybackCrop;
- (NSData)colorNormalization;
- (VCPImageDescriptor)descriptor;
- (VCPMovieHighlight)initWithTimeRange:(id *)a3;
- (VCPVideoKeyFrame)keyFrame;
- (float)actionScore;
- (float)autoplayScore;
- (float)averageScore;
- (float)exposureChangeScore;
- (float)expressionScore;
- (float)flashScore;
- (float)humanActionScore;
- (float)humanPoseScore;
- (float)junkScore;
- (float)motionScore;
- (float)qualityScore;
- (float)score;
- (float)sharpnessScore;
- (float)subjectScore;
- (float)voiceScore;
- (float)zoomChangeScore;
- (void)checkAutoPlayable;
- (void)copyScoresFrom:(id)a3;
- (void)mergeSegment:(id)a3;
- (void)setActionScore:(float)a3;
- (void)setAutoplayScore:(float)a3;
- (void)setAverageScore:(float)a3;
- (void)setBestPlaybackCrop:(CGRect)a3;
- (void)setColorNormalization:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)setExposureChangeScore:(float)a3;
- (void)setExpressionScore:(float)a3;
- (void)setFlashScore:(float)a3;
- (void)setHumanActionScore:(float)a3;
- (void)setHumanPoseScore:(float)a3;
- (void)setIsAutoPlayable:(BOOL)a3;
- (void)setIsSettlingOK:(BOOL)a3;
- (void)setIsTrimmed:(BOOL)a3;
- (void)setJunkScore:(float)a3;
- (void)setKeyFrame:(id)a3;
- (void)setMotionScore:(float)a3;
- (void)setQualityScore:(float)a3;
- (void)setScore:(float)a3;
- (void)setSharpnessScore:(float)a3;
- (void)setSubjectScore:(float)a3;
- (void)setTimerange:(id *)a3;
- (void)setVoiceScore:(float)a3;
- (void)setZoomChangeScore:(float)a3;
@end

@implementation VCPMovieHighlight

- (VCPMovieHighlight)initWithTimeRange:(id *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)VCPMovieHighlight;
  v4 = [(VCPMovieHighlight *)&v11 init];
  v5 = (VCPMovieHighlight *)v4;
  if (v4)
  {
    long long v6 = *(_OWORD *)&a3->var0.var0;
    long long v7 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)(v4 + 168) = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)(v4 + 152) = v7;
    *(_OWORD *)(v4 + 136) = v6;
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *(_OWORD *)(v4 + 104) = *MEMORY[0x1E4F1DB20];
    *(_OWORD *)(v4 + 120) = v8;
    v9 = v4;
  }

  return v5;
}

- (void)mergeSegment:(id)a3
{
  id v4 = a3;
  float score = self->_score;
  CMTime time = (CMTime)self->_timerange.duration;
  double Seconds = CMTimeGetSeconds(&time);
  [v4 score];
  float v8 = v7;
  if (v4) {
    [v4 timerange];
  }
  else {
    memset(&v34, 0, sizeof(v34));
  }
  CMTime duration = v34.duration;
  double v9 = CMTimeGetSeconds(&duration);
  if (v4) {
    [v4 timerange];
  }
  else {
    memset(&v34, 0, sizeof(v34));
  }
  CMTime lhs = (CMTime)self->_timerange.duration;
  CMTime rhs = v34.duration;
  CMTimeAdd(&v33, &lhs, &rhs);
  double v10 = CMTimeGetSeconds(&v33);
  long long v11 = *(_OWORD *)&self->_timerange.start.epoch;
  *(_OWORD *)&range.start.value = *(_OWORD *)&self->_timerange.start.value;
  *(_OWORD *)&range.start.epoch = v11;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_timerange.duration.timescale;
  if (v4) {
    [v4 timerange];
  }
  else {
    memset(&otherRange, 0, sizeof(otherRange));
  }
  CMTimeRangeGetUnion(&v34, &range, &otherRange);
  float v12 = Seconds * score;
  float v13 = v9 * v8;
  float v14 = v10;
  long long v15 = *(_OWORD *)&v34.start.epoch;
  *(_OWORD *)&self->_timerange.start.value = *(_OWORD *)&v34.start.value;
  *(_OWORD *)&self->_timerange.start.epoch = v15;
  *(_OWORD *)&self->_timerange.duration.timescale = *(_OWORD *)&v34.duration.timescale;
  if (v14 <= 0.0)
  {
    self->_float score = 0.0;
    float v20 = 0.0;
  }
  else
  {
    self->_float score = (float)(v12 + v13) / v14;
    float averageScore = self->_averageScore;
    CMTime v30 = (CMTime)self->_timerange.duration;
    double v17 = CMTimeGetSeconds(&v30);
    [v4 averageScore];
    float v19 = v18;
    if (v4) {
      [v4 timerange];
    }
    else {
      memset(&v34, 0, sizeof(v34));
    }
    CMTime v29 = v34.duration;
    float v20 = (CMTimeGetSeconds(&v29) * v19 + averageScore * v17) / v14;
  }
  self->_float averageScore = v20;
  if (v12 >= v13)
  {
    v21 = self->_descriptor;
  }
  else
  {
    v21 = [v4 descriptor];
  }
  descriptor = self->_descriptor;
  self->_descriptor = v21;

  [(VCPVideoKeyFrame *)self->_keyFrame score];
  float v24 = v23;
  v25 = [v4 keyFrame];
  [v25 score];
  if (v24 >= v26)
  {
    v27 = self->_keyFrame;
  }
  else
  {
    v27 = [v4 keyFrame];
  }
  keyFrame = self->_keyFrame;
  self->_keyFrame = v27;

  self->_isAutoPlayable |= [v4 isAutoPlayable];
}

- (BOOL)isShort
{
  $95D729B680665BEAEFA1D6FCA8238556 duration = self->_timerange.duration;
  return CMTimeGetSeconds((CMTime *)&duration) <= 1.0;
}

- (void)copyScoresFrom:(id)a3
{
  id v16 = a3;
  [v16 score];
  self->_float score = v4;
  [v16 averageScore];
  self->_float averageScore = v5;
  [v16 junkScore];
  self->_junkScore = v6;
  [v16 qualityScore];
  self->_qualityScore = v7;
  [v16 expressionScore];
  self->_expressionScore = v8;
  [v16 actionScore];
  self->_actionScore = v9;
  [v16 voiceScore];
  self->_voiceScore = v10;
  [v16 humanActionScore];
  self->_humanActionScore = v11;
  [v16 humanPoseScore];
  self->_humanPoseScore = v12;
  self->_isAutoPlayable = [v16 isAutoPlayable];
  self->_isSettlingOK = [v16 isSettlingOK];
  [v16 autoplayScore];
  self->_autoplayScore = v13;
  [v16 motionScore];
  self->_motionScore = v14;
  [v16 exposureChangeScore];
  self->_exposureChangeScore = v15;
}

- (void)checkAutoPlayable
{
  if (self->_score >= 0.4 && (self->_actionScore >= 0.4 || self->_humanActionScore >= 0.3))
  {
    $95D729B680665BEAEFA1D6FCA8238556 duration = self->_timerange.duration;
    BOOL v3 = CMTimeGetSeconds((CMTime *)&duration) > 1.0;
  }
  else
  {
    BOOL v3 = 0;
  }
  self->_isAutoPlayable = v3;
}

- ($D854FC4CDD8DDEA9B2859E823A7C8A75)timerange
{
  long long v3 = *(_OWORD *)&self[3].var0.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var1.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[3].var1.var0;
  return self;
}

- (void)setTimerange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_timerange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_timerange.start.epoch = v4;
  *(_OWORD *)&self->_timerange.start.value = v3;
}

- (float)score
{
  return self->_score;
}

- (void)setScore:(float)a3
{
  self->_float score = a3;
}

- (float)averageScore
{
  return self->_averageScore;
}

- (void)setAverageScore:(float)a3
{
  self->_float averageScore = a3;
}

- (float)junkScore
{
  return self->_junkScore;
}

- (void)setJunkScore:(float)a3
{
  self->_junkScore = a3;
}

- (float)qualityScore
{
  return self->_qualityScore;
}

- (void)setQualityScore:(float)a3
{
  self->_qualityScore = a3;
}

- (float)expressionScore
{
  return self->_expressionScore;
}

- (void)setExpressionScore:(float)a3
{
  self->_expressionScore = a3;
}

- (float)actionScore
{
  return self->_actionScore;
}

- (void)setActionScore:(float)a3
{
  self->_actionScore = a3;
}

- (float)voiceScore
{
  return self->_voiceScore;
}

- (void)setVoiceScore:(float)a3
{
  self->_voiceScore = a3;
}

- (float)humanActionScore
{
  return self->_humanActionScore;
}

- (void)setHumanActionScore:(float)a3
{
  self->_humanActionScore = a3;
}

- (float)humanPoseScore
{
  return self->_humanPoseScore;
}

- (void)setHumanPoseScore:(float)a3
{
  self->_humanPoseScore = a3;
}

- (CGRect)bestPlaybackCrop
{
  double x = self->_bestPlaybackCrop.origin.x;
  double y = self->_bestPlaybackCrop.origin.y;
  double width = self->_bestPlaybackCrop.size.width;
  double height = self->_bestPlaybackCrop.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBestPlaybackCrop:(CGRect)a3
{
  self->_bestPlaybackCrop = a3;
}

- (BOOL)isAutoPlayable
{
  return self->_isAutoPlayable;
}

- (void)setIsAutoPlayable:(BOOL)a3
{
  self->_isAutoPlayable = a3;
}

- (BOOL)isTrimmed
{
  return self->_isTrimmed;
}

- (void)setIsTrimmed:(BOOL)a3
{
  self->_isTrimmed = a3;
}

- (VCPImageDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (VCPVideoKeyFrame)keyFrame
{
  return self->_keyFrame;
}

- (void)setKeyFrame:(id)a3
{
}

- (NSData)colorNormalization
{
  return self->_colorNormalization;
}

- (void)setColorNormalization:(id)a3
{
}

- (BOOL)isSettlingOK
{
  return self->_isSettlingOK;
}

- (void)setIsSettlingOK:(BOOL)a3
{
  self->_isSettlingOK = a3;
}

- (float)autoplayScore
{
  return self->_autoplayScore;
}

- (void)setAutoplayScore:(float)a3
{
  self->_autoplayScore = a3;
}

- (float)motionScore
{
  return self->_motionScore;
}

- (void)setMotionScore:(float)a3
{
  self->_motionScore = a3;
}

- (float)subjectScore
{
  return self->_subjectScore;
}

- (void)setSubjectScore:(float)a3
{
  self->_subjectScore = a3;
}

- (float)exposureChangeScore
{
  return self->_exposureChangeScore;
}

- (void)setExposureChangeScore:(float)a3
{
  self->_exposureChangeScore = a3;
}

- (float)zoomChangeScore
{
  return self->_zoomChangeScore;
}

- (void)setZoomChangeScore:(float)a3
{
  self->_zoomChangeScore = a3;
}

- (float)flashScore
{
  return self->_flashScore;
}

- (void)setFlashScore:(float)a3
{
  self->_flashScore = a3;
}

- (float)sharpnessScore
{
  return self->_sharpnessScore;
}

- (void)setSharpnessScore:(float)a3
{
  self->_sharpnessScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorNormalization, 0);
  objc_storeStrong((id *)&self->_keyFrame, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end