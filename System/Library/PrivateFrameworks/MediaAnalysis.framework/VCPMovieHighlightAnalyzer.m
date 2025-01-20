@interface VCPMovieHighlightAnalyzer
+ (BOOL)isHeuristicStickerScoreEnabled;
+ (float)getMinimumHighlightInSec;
- ($D854FC4CDD8DDEA9B2859E823A7C8A75)computeActionFaceTrimFor:(SEL)a3;
- ($D854FC4CDD8DDEA9B2859E823A7C8A75)computeQualityTrimFor:(SEL)a3 withKeyFrame:(id *)a4;
- ($D854FC4CDD8DDEA9B2859E823A7C8A75)computeSteadyTranslationTrimFor:(SEL)a3;
- ($D854FC4CDD8DDEA9B2859E823A7C8A75)computeTrimWithHighlightScoreFor:(SEL)a3;
- ($D854FC4CDD8DDEA9B2859E823A7C8A75)findBestTrim:(SEL)a3;
- (BOOL)addSegment:(id)a3;
- (BOOL)checkCameraZoom:(id *)a3;
- (BOOL)isGoodQuality:(id *)a3;
- (BOOL)updateCropHeatMap:(float *)a3 withResults:(id)a4 timeRange:(id *)a5 resultsKey:(id)a6;
- (CGRect)computeBestPlaybackCrop:(id *)a3;
- (VCPMovieHighlightAnalyzer)initWithAnalysisType:(unint64_t)a3 isLivePhoto:(BOOL)a4 photoOffset:(float)a5 hadFlash:(BOOL)a6 hadZoom:(BOOL)a7 settlingHadZoom:(BOOL)a8 isTimelapse:(BOOL)a9 preferredTimeRange:(id *)a10 asset:(id)a11;
- (VCPMovieHighlightAnalyzer)initWithPostProcessOptions:(id)a3 asset:(id)a4;
- (float)actionScoreForTimerange:(id *)a3;
- (float)analyzeOverallQuality:(id *)a3 isSettlingEffect:(BOOL)a4 isAnimatedSticker:(BOOL)a5;
- (float)cameraMotionScoreForTimerange:(id *)a3;
- (float)computeActionScoreInTimerange:(id *)a3;
- (float)computeExpressionScoreInTimerange:(id *)a3;
- (float)computeHighlightScoreOfRange:(id *)a3;
- (float)computeHumanActionScoreInTimerange:(id *)a3;
- (float)computeHumanPoseScoreInTimerange:(id *)a3;
- (float)computeMLHighlightScoreForTimerange:(id *)a3;
- (float)computeMLQualityScoreForTimerange:(id *)a3;
- (float)computeSubtleMotionScoreInTimerange:(id *)a3;
- (float)computeVoiceScoreInTimeRange:(id *)a3;
- (float)expressionScoreForTimerange:(id *)a3;
- (float)highlightScoreForTimeRange:(id *)a3 average:(BOOL)a4;
- (float)junkScoreForTimerange:(id *)a3 lengthScale:(BOOL)a4;
- (float)qualityScoreForTimerange:(id *)a3;
- (float)rankingLevel;
- (float)settlingExposureChangeScore:(id *)a3;
- (float)settlingMotionScore:(id *)a3;
- (float)settlingSharpnessScore:(id *)a3;
- (float)settlingSubjectScore:(id *)a3;
- (float)stickerScaledScore:(float)a3 highPrecisionThreshold:(float)a4 highRecallThreshold:(float)a5;
- (float)subtleMotionScoreForTimerange:(id *)a3;
- (float)visualPleasingScoreForTimerange:(id *)a3;
- (float)voiceScoreForTimerange:(id *)a3;
- (id)adjustHighlightWithContext:(id)a3;
- (id)animatedStickerGating;
- (id)audioQualityScore:(id *)a3;
- (id)findBestHighlightSegment:(id *)a3 targetTrim:(BOOL)a4;
- (id)getHighlightAttributes:(id)a3 withHighlightResults:(id)a4;
- (id)highlightScoreResults;
- (id)maxTrimMovieHighlight:(id)a3;
- (id)movieSummary;
- (id)pickKeyFramesInRange:(id *)a3;
- (id)postProcessMovieHighlight:(id)a3 frameSize:(CGSize)a4;
- (id)results;
- (id)settlingEffects;
- (id)targetExtendRange:(id *)a3 maxRange:(id *)a4;
- (id)targetMovieHighlight:(id)a3 mergedRange:(id *)a4 maxRange:(id *)a5;
- (id)targetProcessRange:(id *)a3 maxRange:(id *)a4;
- (id)targetTrimRange:(id *)a3 searchRange:(id *)a4;
- (int)analyzeMotionStability:()array<float motionParamDiff:(6UL> *)a3;
- (int)analyzeRankingScores:(float)a3 subtleMotion:(float)a4 humanAction:(float)a5;
- (int)combineMLHighlightScore;
- (int)computeColorNormalization;
- (int)computeHighlightScoreResults;
- (int)evaluateSegment:(id)a3;
- (int)generateHighlights;
- (int)pickHighlightsFrom:(id)a3;
- (int)postProcessMLHighlightScore;
- (int)prepareRequiredQualityResult:(id)a3 junkDetectionResult:(id)a4 descriptorResult:(id)a5 faceResult:(id)a6 petsResult:(id)a7 saliencyResult:(id)a8 actionResult:(id)a9 subtleMotionResult:(id)a10 voiceResult:(id)a11 keyFrameResult:(id)a12 sceneResults:(id)a13 humanActionResults:(id)a14 humanPoseResults:(id)a15 cameraMotionResults:(id)a16 orientationResults:(id)a17 mlHighlightScoreResults:(id)a18 mlQualityResults:(id)a19 frameSize:(CGSize)a20;
- (int)selectHighlights;
- (int)selectHighlightsForTimelapse;
- (void)SetKeyFramesForSegments:(id)a3;
- (void)adjustHighlightScoreWithContext;
- (void)computeHighlightScoreOfSegment:(id)a3;
- (void)generateExpressionSegments:(id *)a3;
- (void)loadHighlightScoreResults:(id)a3;
- (void)searchFeatureVectorOfSegment:(id)a3;
- (void)setMaxHighlightDuration:(float)a3;
@end

@implementation VCPMovieHighlightAnalyzer

+ (float)getMinimumHighlightInSec
{
  return 2.5;
}

+ (BOOL)isHeuristicStickerScoreEnabled
{
  return 0;
}

- (VCPMovieHighlightAnalyzer)initWithAnalysisType:(unint64_t)a3 isLivePhoto:(BOOL)a4 photoOffset:(float)a5 hadFlash:(BOOL)a6 hadZoom:(BOOL)a7 settlingHadZoom:(BOOL)a8 isTimelapse:(BOOL)a9 preferredTimeRange:(id *)a10 asset:(id)a11
{
  __int16 v17 = a3;
  id v19 = a11;
  v67.receiver = self;
  v67.super_class = (Class)VCPMovieHighlightAnalyzer;
  v20 = [(VCPMovieHighlightAnalyzer *)&v67 init];
  v21 = v20;
  if (!v20)
  {
LABEL_13:
    v60 = 0;
    goto LABEL_16;
  }
  v20->_maxDurationInSeconds = 10.0;
  +[VCPMovieHighlightAnalyzer getMinimumHighlightInSec];
  v21->_minDurationInSeconds = v22;
  if ((~v17 & 0x890) != 0 || (v17 & 0xC) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v59 = VCPLogInstance();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v59, OS_LOG_TYPE_DEFAULT, "Not all needed analysis are available for video highlights.", buf, 2u);
      }
    }
    goto LABEL_13;
  }
  junkResults = v21->_junkResults;
  v21->_junkResults = 0;

  qualityResults = v21->_qualityResults;
  v21->_qualityResults = 0;

  faceResults = v21->_faceResults;
  v21->_faceResults = 0;

  petsResults = v21->_petsResults;
  v21->_petsResults = 0;

  saliencyResults = v21->_saliencyResults;
  v21->_saliencyResults = 0;

  actionResults = v21->_actionResults;
  v21->_actionResults = 0;

  subtleMotionResults = v21->_subtleMotionResults;
  v21->_subtleMotionResults = 0;

  voiceResults = v21->_voiceResults;
  v21->_voiceResults = 0;

  featureResults = v21->_featureResults;
  v21->_featureResults = 0;

  keyFrameResults = v21->_keyFrameResults;
  v21->_keyFrameResults = 0;

  sceneResults = v21->_sceneResults;
  v21->_sceneResults = 0;

  humanActionResults = v21->_humanActionResults;
  v21->_humanActionResults = 0;

  humanPoseResults = v21->_humanPoseResults;
  v21->_humanPoseResults = 0;

  cameraMotionResults = v21->_cameraMotionResults;
  v21->_cameraMotionResults = 0;

  orientationResults = v21->_orientationResults;
  v21->_orientationResults = 0;

  mlHighlightScoreResults = v21->_mlHighlightScoreResults;
  v21->_mlHighlightScoreResults = 0;

  mlQualityResults = v21->_mlQualityResults;
  v21->_mlQualityResults = 0;

  audioQualityResults = v21->_audioQualityResults;
  v21->_audioQualityResults = 0;

  v21->_frameSize.width = 0.0;
  v21->_frameSize.height = 0.0;
  v21->_contextResults = (NSArray *)0x3F80000000000000;
  v41 = *(void **)&v21->_numberOfFrames;
  *(void *)&v21->_numberOfFrames = 0;

  v21->_animatedStickerGating = 0;
  *(void *)v21->_sumScores = 0;
  uint64_t v42 = [MEMORY[0x1E4F1CA48] array];
  expressionSegments = v21->_expressionSegments;
  v21->_expressionSegments = (NSMutableArray *)v42;

  uint64_t v44 = [MEMORY[0x1E4F1CA48] array];
  internalResults = v21->_internalResults;
  v21->_internalResults = (NSMutableArray *)v44;

  uint64_t v46 = [MEMORY[0x1E4F1CA48] array];
  highlightResults = v21->_highlightResults;
  v21->_highlightResults = (NSMutableArray *)v46;

  uint64_t v48 = [MEMORY[0x1E4F1CA48] array];
  internalConstraintResults = v21->_internalConstraintResults;
  v21->_internalConstraintResults = (NSMutableArray *)v48;

  v50 = v21->_expressionSegments;
  if (v50)
  {
    v50 = v21->_internalResults;
    if (v50)
    {
      v50 = v21->_internalConstraintResults;
      if (v50)
      {
        LOBYTE(v21->_maxHighlightScore) = a4;
        v21->_minHighlightScore = a5;
        v21->_isLivePhoto = 0;
        *(&v21->_isLivePhoto + 1) = a6;
        *(&v21->_isLivePhoto + 2) = a7;
        *(&v21->_isLivePhoto + 3) = a8;
        LOBYTE(v21->_photoOffset) = a9;
        long long v51 = *(_OWORD *)&a10->var0.var0;
        long long v52 = *(_OWORD *)&a10->var1.var1;
        *(_OWORD *)&v21->_preferredTimeRange.start.timescale = *(_OWORD *)&a10->var0.var3;
        *(_OWORD *)&v21->_preferredTimeRange.duration.value = v52;
        *(_OWORD *)&v21->_verbose = v51;
        v53 = objc_alloc_init(VCPColorNormalizationAnalyzer);
        v54 = *(void **)&v21->_diffFlipCount.__elems_[4];
        *(void *)&v21->_diffFlipCount.__elems_[4] = v53;

        uint64_t v55 = [MEMORY[0x1E4F16368] assetImageGeneratorWithAsset:v19];
        epoch = (void *)v21->_preferredTimeRange.duration.epoch;
        v21->_preferredTimeRange.duration.epoch = v55;

        v57 = (void *)v21->_preferredTimeRange.duration.epoch;
        if (v57)
        {
          [v57 setAppliesPreferredTrackTransform:1];
          objc_msgSend((id)v21->_preferredTimeRange.duration.epoch, "setMaximumSize:", (double)0x12BuLL, (double)0x12BuLL);
          v58 = (long long *)MEMORY[0x1E4F1FA48];
          long long v64 = *MEMORY[0x1E4F1FA48];
          uint64_t v65 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
          [(id)v21->_preferredTimeRange.duration.epoch setRequestedTimeToleranceAfter:&v64];
          long long v62 = *v58;
          uint64_t v63 = *((void *)v58 + 2);
          [(id)v21->_preferredTimeRange.duration.epoch setRequestedTimeToleranceBefore:&v62];
          LODWORD(v21->_imageGenerator) = 0;
          *(void *)&v21->_diffFlipCount.__elems_[2] = 0;
          *(_OWORD *)&v21->_sumScores[2] = 0u;
          *(_OWORD *)&v21->_prevMotionParamDiff.__elems_[2] = 0u;
          *(_OWORD *)v21->_sumMotionParam.__elems_ = 0u;
          *(_OWORD *)&v21->_sumMotionParam.__elems_[4] = 0u;
          v50 = v21;
        }
        else
        {
          v50 = 0;
        }
      }
    }
  }
  v60 = v50;
LABEL_16:

  return v60;
}

- (VCPMovieHighlightAnalyzer)initWithPostProcessOptions:(id)a3 asset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v52.receiver = self;
  v52.super_class = (Class)VCPMovieHighlightAnalyzer;
  v8 = [(VCPMovieHighlightAnalyzer *)&v52 init];
  if (v8)
  {
    v9 = [v6 objectForKeyedSubscript:@"HighlightFullResult"];
    if (v9)
    {
      v10 = [v6 objectForKeyedSubscript:@"HighlightFullResult"];
      v8[270] = [v10 BOOLValue];
    }
    else
    {
      v8[270] = 1;
    }

    uint64_t v12 = [v6 objectForKeyedSubscript:@"HighlightContexts"];
    v13 = (void *)*((void *)v8 + 34);
    *((void *)v8 + 34) = v12;

    uint64_t v14 = [*((id *)v8 + 34) count];
    if (v7 && v14)
    {
      v15 = +[VCPPhotosAsset assetWithPHAsset:v7];
      v8[300] = [v15 isTimelapse];
      char v16 = [v15 isLivePhoto];
      v8[288] = v16;
      if ((v16 & 1) == 0)
      {
        __int16 v17 = objc_alloc_init(VCPColorNormalizationAnalyzer);
        v18 = (void *)*((void *)v8 + 58);
        *((void *)v8 + 58) = v17;

        id v19 = (void *)MEMORY[0x1E4F16368];
        v20 = [v15 movie];
        uint64_t v21 = [v19 assetImageGeneratorWithAsset:v20];
        float v22 = (void *)*((void *)v8 + 44);
        *((void *)v8 + 44) = v21;

        v23 = (void *)*((void *)v8 + 44);
        if (!v23)
        {

          v45 = 0;
LABEL_27:
          v11 = v45;
          goto LABEL_28;
        }
        [v23 setAppliesPreferredTrackTransform:1];
        objc_msgSend(*((id *)v8 + 44), "setMaximumSize:", (double)0x12BuLL, (double)0x12BuLL);
        v24 = (long long *)MEMORY[0x1E4F1FA48];
        long long v50 = *MEMORY[0x1E4F1FA48];
        uint64_t v51 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
        [*((id *)v8 + 44) setRequestedTimeToleranceAfter:&v50];
        long long v48 = *v24;
        uint64_t v49 = *((void *)v24 + 2);
        [*((id *)v8 + 44) setRequestedTimeToleranceBefore:&v48];
      }
    }
    v25 = [v6 objectForKeyedSubscript:@"HighlightMaxDuration"];

    if (v25)
    {
      v8[268] = 1;
      v26 = [v6 objectForKeyedSubscript:@"HighlightMaxDuration"];
      [v26 floatValue];
      *((_DWORD *)v8 + 50) = v27;

      v28 = [v6 objectForKeyedSubscript:@"HighlightBestTrim"];
      if (v28)
      {
        v29 = [v6 objectForKeyedSubscript:@"HighlightBestTrim"];
        v8[269] = [v29 BOOLValue];
      }
      else
      {
        v8[269] = 0;
      }

      v35 = [v6 objectForKeyedSubscript:@"HighlightIndex"];
      if (!v35)
      {
        *((_DWORD *)v8 + 54) = -1;
        goto LABEL_23;
      }
      v36 = [v6 objectForKeyedSubscript:@"HighlightIndex"];
      *((_DWORD *)v8 + 54) = [v36 intValue];
    }
    else
    {
      v8[268] = 0;
      v30 = [v6 objectForKeyedSubscript:@"HighlightTargetDuration"];
      [v30 floatValue];
      *((_DWORD *)v8 + 52) = v31;

      v32 = [v6 objectForKeyedSubscript:@"HighlightTolerance"];
      [v32 floatValue];
      *((_DWORD *)v8 + 53) = v33;

      v34 = [v6 objectForKeyedSubscript:@"HighlightIndex"];
      *((_DWORD *)v8 + 54) = [v34 intValue];

      v35 = [v6 objectForKeyedSubscript:@"HighlightStartRange"];
      if (!v35)
      {
        long long v38 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
        *(_OWORD *)&v47.start.value = *MEMORY[0x1E4F1FA20];
        *(_OWORD *)&v47.start.epoch = v38;
        *(_OWORD *)&v47.duration.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
        long long v39 = *(_OWORD *)&v47.duration.timescale;
        *(_OWORD *)(v8 + 220) = *(_OWORD *)&v47.start.value;
        *(_OWORD *)(v8 + 236) = v38;
        *(_OWORD *)(v8 + 252) = v39;
        goto LABEL_23;
      }
      v36 = [v6 objectForKeyedSubscript:@"HighlightStartRange"];
      CMTimeRangeMakeFromDictionary(&v47, (CFDictionaryRef)v36);
      long long v37 = *(_OWORD *)&v47.start.epoch;
      *(_OWORD *)(v8 + 220) = *(_OWORD *)&v47.start.value;
      *(_OWORD *)(v8 + 236) = v37;
      *(_OWORD *)(v8 + 252) = *(_OWORD *)&v47.duration.timescale;
    }

LABEL_23:
    uint64_t v40 = [MEMORY[0x1E4F1CA48] array];
    v41 = (void *)*((void *)v8 + 20);
    *((void *)v8 + 20) = v40;

    uint64_t v42 = [MEMORY[0x1E4F1CA48] array];
    v43 = (void *)*((void *)v8 + 22);
    *((void *)v8 + 22) = v42;

    +[VCPMovieHighlightAnalyzer getMinimumHighlightInSec];
    *((_DWORD *)v8 + 51) = v44;
    v45 = (void *)*((void *)v8 + 20);
    if (v45)
    {
      v45 = (void *)*((void *)v8 + 22);
      if (v45)
      {
        v8[296] = 0;
        v45 = v8;
      }
    }
    goto LABEL_27;
  }
  v11 = 0;
LABEL_28:

  return v11;
}

- (void)setMaxHighlightDuration:(float)a3
{
  self->_maxDurationInSeconds = a3;
}

- (int)prepareRequiredQualityResult:(id)a3 junkDetectionResult:(id)a4 descriptorResult:(id)a5 faceResult:(id)a6 petsResult:(id)a7 saliencyResult:(id)a8 actionResult:(id)a9 subtleMotionResult:(id)a10 voiceResult:(id)a11 keyFrameResult:(id)a12 sceneResults:(id)a13 humanActionResults:(id)a14 humanPoseResults:(id)a15 cameraMotionResults:(id)a16 orientationResults:(id)a17 mlHighlightScoreResults:(id)a18 mlQualityResults:(id)a19 frameSize:(CGSize)a20
{
  CGFloat height = a20.height;
  CGFloat width = a20.width;
  v28 = (NSArray *)a3;
  v29 = (NSArray *)a4;
  v30 = (NSArray *)a5;
  int v31 = (NSArray *)a6;
  v32 = (NSArray *)a7;
  int v33 = (NSArray *)a8;
  v68 = (NSArray *)a9;
  uint64_t v63 = (NSArray *)a10;
  long long v62 = (NSArray *)a11;
  uint64_t v65 = (NSArray *)a12;
  v66 = (NSArray *)a13;
  objc_super v67 = (NSArray *)a14;
  v34 = (NSArray *)a15;
  v35 = (NSArray *)a16;
  v71 = (NSArray *)a17;
  v72 = (NSArray *)a18;
  v73 = (NSArray *)a19;
  qualityResults = self->_qualityResults;
  self->_qualityResults = v28;
  v78 = v28;

  junkResults = self->_junkResults;
  self->_junkResults = v29;
  v77 = v29;

  featureResults = self->_featureResults;
  self->_featureResults = v30;
  v76 = v30;

  faceResults = self->_faceResults;
  self->_faceResults = v31;
  v75 = v31;

  petsResults = self->_petsResults;
  self->_petsResults = v32;
  v74 = v32;

  saliencyResults = self->_saliencyResults;
  self->_saliencyResults = v33;
  v70 = v33;

  actionResults = self->_actionResults;
  self->_actionResults = v68;
  v69 = v68;

  subtleMotionResults = self->_subtleMotionResults;
  self->_subtleMotionResults = v63;
  long long v64 = v63;

  voiceResults = self->_voiceResults;
  self->_voiceResults = v62;
  v45 = v62;

  keyFrameResults = self->_keyFrameResults;
  self->_keyFrameResults = v65;
  CMTimeRange v47 = v65;

  sceneResults = self->_sceneResults;
  self->_sceneResults = v66;
  uint64_t v49 = v66;

  humanActionResults = self->_humanActionResults;
  self->_humanActionResults = v67;
  uint64_t v51 = v67;

  humanPoseResults = self->_humanPoseResults;
  self->_humanPoseResults = v34;
  v53 = v34;

  cameraMotionResults = self->_cameraMotionResults;
  self->_cameraMotionResults = v35;
  uint64_t v55 = v35;

  orientationResults = self->_orientationResults;
  self->_orientationResults = v71;
  v57 = v71;

  mlHighlightScoreResults = self->_mlHighlightScoreResults;
  self->_mlHighlightScoreResults = v72;
  v59 = v72;

  mlQualityResults = self->_mlQualityResults;
  self->_mlQualityResults = v73;

  self->_frameSize.CGFloat width = width;
  self->_frameSize.CGFloat height = height;
  return 0;
}

- (int)generateHighlights
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v3 = [(VCPMovieHighlightAnalyzer *)self computeHighlightScoreResults];
  if (!v3)
  {
    int v3 = [(VCPMovieHighlightAnalyzer *)self postProcessMLHighlightScore];
    if (!v3)
    {
      int v3 = [(VCPMovieHighlightAnalyzer *)self combineMLHighlightScore];
      if (!v3)
      {
        self->_contextResults = (NSArray *)0x3E19999A3E4CCCCDLL;
        unsigned int v4 = LOBYTE(self->_photoOffset)
           ? [(VCPMovieHighlightAnalyzer *)self selectHighlightsForTimelapse]
           : [(VCPMovieHighlightAnalyzer *)self selectHighlights];
        int v3 = v4;
        if (!v4)
        {
          float v5 = *(float *)&self->_contextResults * 0.5;
          if (v5 >= *((float *)&self->_contextResults + 1)) {
            float v5 = *((float *)&self->_contextResults + 1);
          }
          *((float *)&self->_contextResults + 1) = fmaxf(v5, 0.15);
          long long v14 = 0u;
          long long v15 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          id v6 = self->_highlightResults;
          uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
          uint64_t v8 = v7;
          if (v7)
          {
            uint64_t v9 = *(void *)v15;
            while (2)
            {
              uint64_t v10 = 0;
              do
              {
                if (*(void *)v15 != v9) {
                  objc_enumerationMutation(v6);
                }
                uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
                uint64_t v12 = (void *)MEMORY[0x1C186D320](v7);
                int v3 = -[VCPMovieHighlightAnalyzer evaluateSegment:](self, "evaluateSegment:", v11, (void)v14);
                if (v3)
                {

                  return v3;
                }
                ++v10;
              }
              while (v8 != v10);
              uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
              uint64_t v8 = v7;
              if (v7) {
                continue;
              }
              break;
            }
          }

          if (LOBYTE(self->_maxHighlightScore)) {
            return 0;
          }
          int v3 = [(VCPMovieHighlightAnalyzer *)self computeColorNormalization];
          if (!v3) {
            return 0;
          }
        }
      }
    }
  }
  return v3;
}

- (BOOL)isGoodQuality:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  time1.start = (CMTime)a3->var1;
  float v5 = (CMTime *)MEMORY[0x1E4F1FA48];
  CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  if (!CMTimeCompare(&time1.start, &time2)) {
    return 1;
  }
  memset(&v26, 0, sizeof(v26));
  long long v6 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v6;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v26, &range);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = self->_internalResults;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        [v11 score];
        if (v12 < 0.0)
        {
          if (v11) {
            [v11 timerange];
          }
          else {
            memset(&time1, 0, sizeof(time1));
          }
          CMTime time2 = time1.start;
          CMTime v27 = v26;
          if (CMTimeCompare(&time2, &v27) > 0) {
            goto LABEL_24;
          }
          memset(&time1, 0, sizeof(time1));
          if (v11) {
            [v11 timerange];
          }
          else {
            memset(&v19, 0, sizeof(v19));
          }
          long long v13 = *(_OWORD *)&a3->var0.var3;
          *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a3->var0.var0;
          *(_OWORD *)&otherRange.start.epoch = v13;
          *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
          CMTimeRangeGetIntersection(&time1, &v19, &otherRange);
          if ((time1.start.flags & 1) == 0
            || (time1.duration.flags & 1) == 0
            || time1.duration.epoch
            || time1.duration.value < 0
            || (duration = time1.duration, CMTime v16 = *v5, CMTimeCompare(&duration, &v16)))
          {
            BOOL v14 = 0;
            goto LABEL_26;
          }
        }
      }
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
      BOOL v14 = 1;
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
LABEL_24:
    BOOL v14 = 1;
  }
LABEL_26:

  return v14;
}

- (id)postProcessMovieHighlight:(id)a3 frameSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  uint64_t v175 = *MEMORY[0x1E4F143B8];
  id v110 = a3;
  v109 = objc_msgSend(v110, "objectForKeyedSubscript:");
  uint64_t v7 = objc_msgSend(v110, "objectForKeyedSubscript:");
  [(VCPMovieHighlightAnalyzer *)self loadHighlightScoreResults:v7];

  v112 = self;
  if ([*(id *)&self->_isMaxTrim count])
  {
    uint64_t v8 = [v110 objectForKeyedSubscript:@"SceneResults"];
    sceneResults = self->_sceneResults;
    self->_sceneResults = v8;

    uint64_t v10 = [v110 objectForKeyedSubscript:@"QualityResults"];
    qualityResults = self->_qualityResults;
    self->_qualityResults = v10;

    id v115 = [MEMORY[0x1E4F1CA48] array];
    long long v162 = 0u;
    long long v161 = 0u;
    long long v160 = 0u;
    long long v159 = 0u;
    obuint64_t j = [v110 objectForKeyedSubscript:@"KeyFrameResults"];
    uint64_t v12 = [obj countByEnumeratingWithState:&v159 objects:v174 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v160;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v160 != v13) {
            objc_enumerationMutation(obj);
          }
          long long v15 = *(void **)(*((void *)&v159 + 1) + 8 * i);
          CMTime v16 = objc_alloc_init(VCPVideoKeyFrame);
          long long v17 = [v15 objectForKeyedSubscript:@"attributes"];
          v18 = [v17 objectForKeyedSubscript:@"timestamp"];

          if (v18)
          {
            memset(&v164, 0, 24);
            [v18 floatValue];
            CMTimeMakeWithSeconds(&v164.start, v19, 600);
            long long v157 = *(_OWORD *)&v164.start.value;
            CMTimeEpoch epoch = v164.start.epoch;
            [(VCPVideoKeyFrame *)v16 loadKeyFrameResult:v15 timestamp:&v157];
            [(VCPVideoKeyFrame *)v16 computeCurationScore];
            [v115 addObject:v16];
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v159 objects:v174 count:16];
      }
      while (v12);
    }

    objc_storeStrong((id *)&v112->_keyFrameResults, v115);
    uint64_t v20 = [v110 objectForKeyedSubscript:@"OrientationResults"];
    orientationResults = v112->_orientationResults;
    v112->_orientationResults = (NSArray *)v20;

    uint64_t v22 = [v110 objectForKeyedSubscript:@"FeatureVectorResults"];
    featureResults = v112->_featureResults;
    v112->_featureResults = (NSArray *)v22;

    uint64_t v24 = [v110 objectForKeyedSubscript:@"FaceResults"];
    faceResults = v112->_faceResults;
    v112->_faceResults = (NSArray *)v24;

    uint64_t v26 = [v110 objectForKeyedSubscript:@"PetsResults"];
    petsResults = v112->_petsResults;
    v112->_petsResults = (NSArray *)v26;

    uint64_t v28 = [v110 objectForKeyedSubscript:@"SaliencyResults"];
    saliencyResults = v112->_saliencyResults;
    v112->_saliencyResults = (NSArray *)v28;

    uint64_t v30 = [v110 objectForKeyedSubscript:@"HumanPoseResults"];
    humanPoseResults = v112->_humanPoseResults;
    v112->_humanPoseResults = (NSArray *)v30;

    uint64_t v32 = [v110 objectForKeyedSubscript:@"AudioQualityResults"];
    audioQualityResults = v112->_audioQualityResults;
    v112->_audioQualityResults = (NSArray *)v32;

    uint64_t v34 = [MEMORY[0x1E4F1CA48] array];
    highlightResults = v112->_highlightResults;
    v112->_highlightResults = (NSMutableArray *)v34;

    v112->_frameSize.CGFloat width = width;
    v112->_frameSize.CGFloat height = height;
    [(VCPMovieHighlightAnalyzer *)v112 adjustHighlightScoreWithContext];
    uint64_t v36 = [(VCPMovieHighlightAnalyzer *)v112 adjustHighlightWithContext:v109];

    v109 = (void *)v36;
    self = v112;
    if (!v36)
    {
      v109 = 0;
      goto LABEL_20;
    }
  }
  [(NSMutableArray *)self->_internalConstraintResults removeAllObjects];
  if (![(NSMutableArray *)self->_internalResults count])
  {
LABEL_20:
    uint64_t v40 = 0;
    goto LABEL_83;
  }
  if (BYTE4(self->_startRange.duration.epoch))
  {
    unint64_t targetHighlightIndex = self->_targetHighlightIndex;
    if ((targetHighlightIndex & 0x80000000) != 0)
    {
      long long v156 = 0u;
      long long v155 = 0u;
      long long v154 = 0u;
      long long v153 = 0u;
      id v47 = v109;
      uint64_t v48 = [v47 countByEnumeratingWithState:&v153 objects:v173 count:16];
      if (v48)
      {
        uint64_t v49 = 0;
        uint64_t v50 = *(void *)v154;
        float v51 = -1.0;
        do
        {
          for (uint64_t j = 0; j != v48; ++j)
          {
            if (*(void *)v154 != v50) {
              objc_enumerationMutation(v47);
            }
            v53 = *(void **)(*((void *)&v153 + 1) + 8 * j);
            v54 = (void *)MEMORY[0x1C186D320]();
            uint64_t v55 = [(VCPMovieHighlightAnalyzer *)v112 maxTrimMovieHighlight:v53];
            if (v55)
            {
              if (BYTE6(v112->_startRange.duration.epoch))
              {
                [(NSMutableArray *)v112->_internalConstraintResults addObject:v55];
              }
              else
              {
                v56 = [v53 objectForKeyedSubscript:@"quality"];
                [v56 floatValue];
                float v58 = v57;

                if (v51 < v58)
                {
                  id v59 = v55;

                  float v51 = v58;
                  uint64_t v49 = v59;
                }
              }
            }
          }
          uint64_t v48 = [v47 countByEnumeratingWithState:&v153 objects:v173 count:16];
        }
        while (v48);

        if (v49) {
          [(NSMutableArray *)v112->_internalConstraintResults addObject:v49];
        }
      }
      else
      {

        uint64_t v49 = 0;
      }
    }
    else
    {
      if ([v109 count] <= targetHighlightIndex) {
        goto LABEL_62;
      }
      long long v38 = [v109 objectAtIndexedSubscript:self->_targetHighlightIndex];
      long long v39 = [(VCPMovieHighlightAnalyzer *)self maxTrimMovieHighlight:v38];

      if (v39) {
        [(NSMutableArray *)v112->_internalConstraintResults addObject:v39];
      }
    }
  }
  else if ((self->_startRange.start.timescale & 1) == 0 {
         || (self->_startRange.duration.timescale & 1) == 0
  }
         || *(void *)&self->_startRange.duration.flags
         || *(int64_t *)((unsigned char *)&self->_startRange.start.epoch + 4) < 0)
  {
    unint64_t v41 = self->_targetHighlightIndex;
    if ((v41 & 0x80000000) != 0)
    {
      long long v60 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
      *(_OWORD *)&v152.start.value = *MEMORY[0x1E4F1FA20];
      *(_OWORD *)&v152.start.CMTimeEpoch epoch = v60;
      *(_OWORD *)&v152.duration.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
      long long v61 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
      *(_OWORD *)&v143[0].start.value = *MEMORY[0x1E4F1FA30];
      *(_OWORD *)&v143[0].start.CMTimeEpoch epoch = v61;
      *(_OWORD *)&v143[0].duration.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 32);
      CFDictionaryRef v62 = [v109 objectAtIndexedSubscript:0];
      CMTimeRangeMakeFromDictionary(&v164, v62);
      CMTime v142 = v164.start;

      memset(&v141, 0, sizeof(v141));
      CFDictionaryRef v63 = [v109 lastObject];
      CMTimeRangeMakeFromDictionary(&range, v63);
      CMTimeRangeGetEnd(&v141, &range);

      memset(&v139, 0, sizeof(v139));
      CMTime start = v142;
      CMTime end = v141;
      CMTimeRangeFromTimeToTime(&v139, &start, &end);
      long long v64 = v112;
      long long v135 = 0u;
      long long v136 = 0u;
      long long v133 = 0u;
      long long v134 = 0u;
      id v65 = v109;
      uint64_t v66 = [v65 countByEnumeratingWithState:&v133 objects:v172 count:16];
      if (v66)
      {
        uint64_t v67 = *(void *)v134;
        float v68 = 0.0;
        do
        {
          for (uint64_t k = 0; k != v66; ++k)
          {
            if (*(void *)v134 != v67) {
              objc_enumerationMutation(v65);
            }
            CFDictionaryRef v70 = *(const __CFDictionary **)(*((void *)&v133 + 1) + 8 * k);
            memset(&v164, 0, sizeof(v164));
            CMTimeRangeMakeFromDictionary(&v164, v70);
            CMTimeRange v130 = v143[0];
            CMTimeRangeGetEnd(&v131, &v130);
            *(_OWORD *)&lhs.start.value = *(_OWORD *)&v164.start.value;
            lhs.start.CMTimeEpoch epoch = v164.start.epoch;
            CMTime rhs = v131;
            CMTimeSubtract(&time, &lhs.start, &rhs);
            if (CMTimeGetSeconds(&time) < 0.200000003
              && (CMTimeRange v127 = v143[0],
                  CMTimeRangeGetEnd(&v128, &v127),
                  CMTime v126 = v164.start,
                  CMTimeRangeFromTimeToTime(&v129, &v128, &v126),
                  [(VCPMovieHighlightAnalyzer *)v64 isGoodQuality:&v129]))
            {
              CMTimeRange v124 = v143[0];
              CMTimeRange otherRange = v164;
              CMTimeRangeGetUnion(&lhs, &v124, &otherRange);
              *(_OWORD *)&v143[0].start.value = *(_OWORD *)&lhs.start.value;
              *(_OWORD *)&v143[0].start.CMTimeEpoch epoch = *(_OWORD *)&lhs.start.epoch;
              long long v71 = *(_OWORD *)&lhs.duration.timescale;
            }
            else
            {
              *(_OWORD *)&v143[0].start.value = *(_OWORD *)&v164.start.value;
              *(_OWORD *)&v143[0].start.CMTimeEpoch epoch = *(_OWORD *)&v164.start.epoch;
              long long v71 = *(_OWORD *)&v164.duration.timescale;
            }
            *(_OWORD *)&v143[0].duration.timescale = v71;
            v122[0] = *(_OWORD *)&v143[0].start.value;
            v122[1] = *(_OWORD *)&v143[0].start.epoch;
            v122[2] = v71;
            CMTimeRange v121 = v139;
            v72 = [(VCPMovieHighlightAnalyzer *)v64 targetMovieHighlight:v70 mergedRange:v122 maxRange:&v121];
            v73 = v72;
            if (v72)
            {
              [v72 score];
              if (v74 > v68)
              {
                [v73 timerange];
                CMTimeRange v152 = lhs;
                [v73 score];
                float v68 = v75;
              }
            }

            long long v64 = v112;
          }
          uint64_t v66 = [v65 countByEnumeratingWithState:&v133 objects:v172 count:16];
        }
        while (v66);
      }

      internalConstraintResults = v112->_internalConstraintResults;
      CMTimeRange v164 = v152;
      CFDictionaryRef v77 = CMTimeRangeCopyAsDictionary(&v164, 0);
      [(NSMutableArray *)internalConstraintResults addObject:v77];
    }
    else
    {
      if ([v109 count] <= v41) {
        goto LABEL_62;
      }
      uint64_t v42 = [v109 objectAtIndexedSubscript:self->_targetHighlightIndex];
      long long v43 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
      v145[0] = *MEMORY[0x1E4F1FA30];
      v145[1] = v43;
      v145[2] = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 32);
      long long v44 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
      v144[0] = *MEMORY[0x1E4F1FA20];
      v144[1] = v44;
      v144[2] = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
      v45 = [(VCPMovieHighlightAnalyzer *)self targetMovieHighlight:v42 mergedRange:v145 maxRange:v144];

      uint64_t v46 = v112->_internalConstraintResults;
      if (v45) {
        [v45 timerange];
      }
      else {
        memset(&v143[1], 0, sizeof(CMTimeRange));
      }
      CMTimeRange v164 = v143[1];
      CFDictionaryRef v78 = CMTimeRangeCopyAsDictionary(&v164, 0);
      [(NSMutableArray *)v46 addObject:v78];
    }
  }
  else
  {
    unint64_t v99 = self->_targetHighlightIndex;
    if ((v99 & 0x80000000) != 0 || [v109 count] <= v99)
    {
      v101 = [(NSMutableArray *)self->_internalResults objectAtIndexedSubscript:0];
      v102 = v101;
      if (v101) {
        [v101 timerange];
      }
      else {
        memset(&v152, 0, sizeof(v152));
      }
      *(_OWORD *)&v143[0].start.value = *(_OWORD *)&v152.start.value;
      v143[0].start.CMTimeEpoch epoch = v152.start.epoch;
      v103 = [(NSMutableArray *)self->_internalResults lastObject];

      memset(&v139, 0, 24);
      if (v103) {
        [v103 timerange];
      }
      else {
        memset(&v151, 0, sizeof(v151));
      }
      CMTimeRangeGetEnd(&v139.start, &v151);
      CMTime v150 = v143[0].start;
      CMTime v149 = v139.start;
      CMTimeRangeFromTimeToTime(&v152, &v150, &v149);
      CMTimeRange v164 = v152;
    }
    else
    {
      CFDictionaryRef v100 = [v109 objectAtIndexedSubscript:self->_targetHighlightIndex];
      CMTimeRangeMakeFromDictionary(&v152, v100);
      CMTimeRange v164 = v152;
    }
    long long v104 = *(_OWORD *)&v112->_startRange.start.flags;
    v148[0] = *(_OWORD *)(&v112->_targetHighlightIndex + 1);
    v148[1] = v104;
    v148[2] = *(_OWORD *)((char *)&v112->_startRange.duration.value + 4);
    CMTimeRange v147 = v164;
    v105 = [(VCPMovieHighlightAnalyzer *)v112 targetProcessRange:v148 maxRange:&v147];
    v106 = v105;
    v107 = v112->_internalConstraintResults;
    if (v105) {
      [v105 timerange];
    }
    else {
      memset(&v146, 0, sizeof(v146));
    }
    v108 = CMTimeRangeToNSDictionary(&v146);
    [(NSMutableArray *)v107 addObject:v108];
  }
  self = v112;
LABEL_62:
  if (BYTE6(self->_startRange.duration.epoch))
  {
    id obja = [MEMORY[0x1E4F1CA48] array];
    long long v119 = 0u;
    long long v120 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    v111 = self->_internalResults;
    uint64_t v79 = [(NSMutableArray *)v111 countByEnumeratingWithState:&v117 objects:v169 count:16];
    if (v79)
    {
      uint64_t v80 = *(void *)v118;
      do
      {
        for (uint64_t m = 0; m != v79; ++m)
        {
          if (*(void *)v118 != v80) {
            objc_enumerationMutation(v111);
          }
          v82 = *(void **)(*((void *)&v117 + 1) + 8 * m);
          v167[0] = @"start";
          if (v82) {
            [v82 timerange];
          }
          else {
            memset(&v164, 0, sizeof(v164));
          }
          *(_OWORD *)&v152.start.value = *(_OWORD *)&v164.start.value;
          v152.start.CMTimeEpoch epoch = v164.start.epoch;
          CFDictionaryRef v83 = CMTimeCopyAsDictionary(&v152.start, 0);
          v168[0] = v83;
          v167[1] = @"duration";
          if (v82) {
            [v82 timerange];
          }
          else {
            memset(&v152, 0, sizeof(v152));
          }
          v143[0].CMTime start = v152.duration;
          CFDictionaryRef v84 = CMTimeCopyAsDictionary(&v143[0].start, 0);
          v168[1] = v84;
          v167[2] = @"quality";
          v85 = NSNumber;
          [v82 score];
          v86 = objc_msgSend(v85, "numberWithFloat:");
          v168[2] = v86;
          v87 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v168 forKeys:v167 count:3];
          [obja addObject:v87];
        }
        uint64_t v79 = [(NSMutableArray *)v111 countByEnumeratingWithState:&v117 objects:v169 count:16];
      }
      while (v79);
    }

    unint64_t v88 = 0;
    v89 = v112;
    while (v88 < [(NSMutableArray *)v89->_internalConstraintResults count])
    {
      v90 = (void *)MEMORY[0x1C186D320]();
      v91 = [(NSMutableArray *)v112->_internalConstraintResults objectAtIndexedSubscript:v88];
      v92 = [v91 objectForKeyedSubscript:@"quality"];
      BOOL v93 = v92 == 0;

      if (v93)
      {
        v94 = (void *)[v91 mutableCopy];
        v95 = NSNumber;
        CMTimeRangeMakeFromDictionary(&v116, (CFDictionaryRef)v91);
        [(VCPMovieHighlightAnalyzer *)v112 highlightScoreForTimeRange:&v116 average:0];
        v96 = objc_msgSend(v95, "numberWithFloat:");
        [v94 setObject:v96 forKeyedSubscript:@"quality"];

        [(NSMutableArray *)v112->_internalConstraintResults replaceObjectAtIndex:v88 withObject:v94];
      }

      v89 = v112;
      ++v88;
    }
    v97 = v89->_internalConstraintResults;
    v165[0] = @"MovieHighlightResults";
    v165[1] = @"MovieHighlightScoreResults";
    v166[0] = v97;
    v166[1] = obja;
    uint64_t v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v166 forKeys:v165 count:2];
  }
  else
  {
    v170 = @"MovieHighlightResults";
    v171 = self->_internalConstraintResults;
    uint64_t v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v171 forKeys:&v170 count:1];
  }
LABEL_83:

  return v40;
}

- (id)targetMovieHighlight:(id)a3 mergedRange:(id *)a4 maxRange:(id *)a5
{
  CFDictionaryRef v8 = (const __CFDictionary *)a3;
  memset(&v32, 0, sizeof(v32));
  CMTimeRangeMakeFromDictionary(&v32, v8);
  CMTime time = v32.duration;
  float Seconds = CMTimeGetSeconds(&time);
  targetDurationInfloat Seconds = self->_targetDurationInSeconds;
  if ((float)(targetDurationInSeconds - self->_toleranceInSeconds) > Seconds)
  {
    if ((a4->var0.var2 & 1) == 0
      || (a4->var1.var2 & 1) == 0
      || a4->var1.var3
      || a4->var1.var0 < 0
      || (CMTime var1 = (CMTime)a4->var1,
          CMTimeGetSeconds(&var1) < (float)(self->_targetDurationInSeconds - self->_toleranceInSeconds)))
    {
      if ((a5->var0.var2 & 1) == 0 || (a5->var1.var2 & 1) == 0 || a5->var1.var3 || a5->var1.var0 < 0)
      {
        uint64_t v11 = 0;
        goto LABEL_14;
      }
      CMTime time1 = v32.duration;
      CMTime time2 = (CMTime)a4->var1;
      int32_t v18 = CMTimeCompare(&time1, &time2);
      p_var0 = &v32;
      if (v18 <= 0) {
        p_var0 = &a4->var0.var0;
      }
      long long v20 = p_var0[1];
      v26[0] = *p_var0;
      v26[1] = v20;
      v26[2] = p_var0[2];
      long long v21 = *(_OWORD *)&a5->var0.var3;
      v25[0] = *(_OWORD *)&a5->var0.var0;
      v25[1] = v21;
      v25[2] = *(_OWORD *)&a5->var1.var1;
      uint64_t v14 = [(VCPMovieHighlightAnalyzer *)self targetExtendRange:v26 maxRange:v25];
      goto LABEL_12;
    }
    long long v17 = *(_OWORD *)&a4->var0.var3;
    v28[0] = *(_OWORD *)&a4->var0.var0;
    v28[1] = v17;
    long long v29 = *(_OWORD *)&a4->var1.var1;
    v27[0] = v28[0];
    v27[1] = v17;
    v27[2] = v29;
    uint64_t v12 = (CMTimeRange *)v27;
    uint64_t v13 = (CMTimeRange *)v28;
LABEL_11:
    uint64_t v14 = -[VCPMovieHighlightAnalyzer targetTrimRange:searchRange:](self, "targetTrimRange:searchRange:", v13, v12, *(_OWORD *)&v22.start.value, *(_OWORD *)&v22.start.epoch, *(_OWORD *)&v22.duration.timescale, *(_OWORD *)&v23.start.value, *(_OWORD *)&v23.start.epoch, *(_OWORD *)&v23.duration.timescale);
LABEL_12:
    uint64_t v11 = (VCPMovieHighlight *)v14;
    goto LABEL_14;
  }
  if (targetDurationInSeconds < Seconds)
  {
    CMTimeRange v23 = v32;
    CMTimeRange v22 = v32;
    uint64_t v12 = &v22;
    uint64_t v13 = &v23;
    goto LABEL_11;
  }
  uint64_t v11 = objc_alloc_init(VCPMovieHighlight);
  CMTimeRange v24 = v32;
  [(VCPMovieHighlight *)v11 setTimerange:&v24];
  long long v15 = [(__CFDictionary *)v8 objectForKeyedSubscript:@"quality"];
  [v15 floatValue];
  -[VCPMovieHighlight setScore:](v11, "setScore:");

LABEL_14:
  return v11;
}

- (id)targetProcessRange:(id *)a3 maxRange:(id *)a4
{
  CMTime time = (CMTime)a3->var1;
  if (CMTimeGetSeconds(&time) > (float)(self->_targetDurationInSeconds + self->_toleranceInSeconds))
  {
    long long v7 = *(_OWORD *)&a3->var0.var3;
    v19[0] = *(_OWORD *)&a3->var0.var0;
    v19[1] = v7;
    long long v20 = *(_OWORD *)&a3->var1.var1;
    v18[0] = v19[0];
    v18[1] = v7;
    v18[2] = v20;
    uint64_t v8 = [(VCPMovieHighlightAnalyzer *)self targetTrimRange:v19 searchRange:v18];
LABEL_5:
    uint64_t v11 = (VCPMovieHighlight *)v8;
    goto LABEL_7;
  }
  CMTime var1 = (CMTime)a3->var1;
  if (CMTimeGetSeconds(&var1) < (float)(self->_targetDurationInSeconds - self->_toleranceInSeconds))
  {
    long long v9 = *(_OWORD *)&a3->var0.var3;
    v16[0] = *(_OWORD *)&a3->var0.var0;
    v16[1] = v9;
    v16[2] = *(_OWORD *)&a3->var1.var1;
    long long v10 = *(_OWORD *)&a4->var0.var3;
    v15[0] = *(_OWORD *)&a4->var0.var0;
    v15[1] = v10;
    v15[2] = *(_OWORD *)&a4->var1.var1;
    uint64_t v8 = [(VCPMovieHighlightAnalyzer *)self targetExtendRange:v16 maxRange:v15];
    goto LABEL_5;
  }
  uint64_t v11 = objc_alloc_init(VCPMovieHighlight);
  long long v12 = *(_OWORD *)&a3->var0.var3;
  v14[0] = *(_OWORD *)&a3->var0.var0;
  v14[1] = v12;
  v14[2] = *(_OWORD *)&a3->var1.var1;
  [(VCPMovieHighlight *)v11 setTimerange:v14];
LABEL_7:
  return v11;
}

- (id)targetExtendRange:(id *)a3 maxRange:(id *)a4
{
  memset(&v22, 0, sizeof(v22));
  CMTimeMake(&v23, (uint64_t)(float)((float)(self->_targetDurationInSeconds - self->_toleranceInSeconds) * 600.0), 600);
  lhs.CMTime start = v23;
  CMTime rhs = (CMTime)a3->var1;
  CMTimeSubtract(&v22, &lhs.start, &rhs);
  memset(&v21, 0, sizeof(v21));
  *(_OWORD *)&lhs.start.value = *(_OWORD *)&a3->var0.var0;
  lhs.start.CMTimeEpoch epoch = a3->var0.var3;
  CMTime rhs = v22;
  if (CMTimeCompare(&lhs.start, &rhs) < 1)
  {
    CMTime v21 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  }
  else
  {
    *(_OWORD *)&lhs.start.value = *(_OWORD *)&a3->var0.var0;
    lhs.start.CMTimeEpoch epoch = a3->var0.var3;
    CMTime rhs = v22;
    CMTimeSubtract(&v21, &lhs.start, &rhs);
  }
  memset(&lhs, 0, sizeof(lhs));
  CMTime start = v21;
  long long v7 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.CMTimeEpoch epoch = v7;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v17, &range);
  CMTime rhs = v17;
  CMTime v23 = v22;
  CMTimeAdd(&end, &rhs, &v23);
  CMTimeRangeFromTimeToTime(&lhs, &start, &end);
  long long v8 = *(_OWORD *)&a4->var0.var3;
  v14[0] = *(_OWORD *)&a4->var0.var0;
  v14[1] = v8;
  long long v15 = *(_OWORD *)&a4->var1.var1;
  CMTimeRange v12 = lhs;
  *(_OWORD *)&v11.start.CMTimeEpoch epoch = v8;
  *(_OWORD *)&v11.duration.timescale = v15;
  *(_OWORD *)&v11.start.value = v14[0];
  CMTimeRangeGetIntersection(&v13, &v12, &v11);
  long long v9 = [(VCPMovieHighlightAnalyzer *)self targetTrimRange:v14 searchRange:&v13];
  return v9;
}

- (id)targetTrimRange:(id *)a3 searchRange:(id *)a4
{
  long long v6 = *(_OWORD *)&a4->var0.var3;
  v55[0] = *(_OWORD *)&a4->var0.var0;
  v55[1] = v6;
  v55[2] = *(_OWORD *)&a4->var1.var1;
  long long v7 = [(VCPMovieHighlightAnalyzer *)self findBestHighlightSegment:v55 targetTrim:1];
  long long v8 = v7;
  if (v7)
  {
    [v7 timerange];
    CMTime v54 = v53.start;
    memset(&v52, 0, sizeof(v52));
    [v8 timerange];
  }
  else
  {
    memset(&v54, 0, sizeof(v54));
    memset(&v52, 0, sizeof(v52));
    memset(&range, 0, sizeof(range));
  }
  CMTimeRangeGetEnd(&v52, &range);
  unint64_t v9 = 0;
  long long v10 = 0;
  int v11 = -1;
  while (1)
  {
    if ([(NSMutableArray *)self->_internalResults count] <= v9)
    {
      long long v15 = 0;
      goto LABEL_26;
    }
    CMTimeRange v12 = [(NSMutableArray *)self->_internalResults objectAtIndexedSubscript:v9];
    CMTimeRange v13 = v12;
    if ((v11 & 0x80000000) == 0)
    {
      if (!v12) {
        goto LABEL_18;
      }
      goto LABEL_8;
    }
    if (v12)
    {
      [v12 timerange];
      if (v8) {
        goto LABEL_12;
      }
    }
    else
    {
      memset(&v50, 0, sizeof(v50));
      if (v8)
      {
LABEL_12:
        [v8 timerange];
        goto LABEL_15;
      }
    }
    memset(&v53, 0, sizeof(v53));
LABEL_15:
    CMTime time = v53.start;
    if (!CMTimeRangeContainsTime(&v50, &time)) {
      goto LABEL_21;
    }
    uint64_t v14 = [(NSMutableArray *)self->_internalResults objectAtIndexedSubscript:v9];

    if ((v9 & 0x80000000) == 0) {
      break;
    }
    int v11 = v9;
LABEL_22:

    ++v9;
    long long v10 = (void *)v14;
  }
  long long v10 = (void *)v14;
  int v11 = v9;
  if (!v13)
  {
LABEL_18:
    memset(&v48, 0, sizeof(v48));
    if (!v8) {
      goto LABEL_19;
    }
LABEL_9:
    [v8 timerange];
    goto LABEL_20;
  }
LABEL_8:
  [v13 timerange];
  if (v8) {
    goto LABEL_9;
  }
LABEL_19:
  memset(&v46, 0, sizeof(v46));
LABEL_20:
  CMTimeRangeGetEnd(&v47, &v46);
  if (!CMTimeRangeContainsTime(&v48, &v47))
  {
LABEL_21:
    uint64_t v14 = (uint64_t)v10;
    goto LABEL_22;
  }
  long long v15 = [(NSMutableArray *)self->_internalResults objectAtIndexedSubscript:v9];

LABEL_26:
  targetDurationInfloat Seconds = self->_targetDurationInSeconds;
  toleranceInfloat Seconds = self->_toleranceInSeconds;
  if (v8) {
    [v8 timerange];
  }
  else {
    memset(&v53, 0, sizeof(v53));
  }
  CMTime duration = v53.duration;
  float v18 = (float)(targetDurationInSeconds + toleranceInSeconds) - CMTimeGetSeconds(&duration);
  if (v10)
  {
    [v10 score];
    float v20 = v19;
    [v8 averageScore];
    if (v20 >= v21 && v18 > 0.0)
    {
      memset(&v53, 0, sizeof(v53));
      long long v22 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&v44.start.value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&v44.start.CMTimeEpoch epoch = v22;
      *(_OWORD *)&v44.duration.timescale = *(_OWORD *)&a3->var1.var1;
      [v10 timerange];
      CMTimeRangeGetIntersection(&v53, &v44, &otherRange);
      CMTime lhs = v54;
      CMTime rhs = v53.start;
      CMTimeSubtract(&v42, &lhs, &rhs);
      float Seconds = CMTimeGetSeconds(&v42);
      if (v18 >= Seconds) {
        float v24 = Seconds;
      }
      else {
        float v24 = v18;
      }
      CMTimeMake(&v40, (uint64_t)(float)(v24 * 600.0), 600);
      CMTime lhs = v54;
      CMTime rhs = v40;
      CMTimeSubtract(&v41, &lhs, &rhs);
      CMTime v54 = v41;
      float v18 = v18 - v24;
    }
  }
  if (v15)
  {
    [v15 score];
    float v26 = v25;
    [v8 averageScore];
    if (v26 >= v27 && v18 > 0.0)
    {
      memset(&v53, 0, sizeof(v53));
      long long v28 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&v39.start.value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&v39.start.CMTimeEpoch epoch = v28;
      *(_OWORD *)&v39.duration.timescale = *(_OWORD *)&a3->var1.var1;
      [v15 timerange];
      CMTimeRangeGetIntersection(&v53, &v39, &v38);
      CMTimeRange v36 = v53;
      CMTimeRangeGetEnd(&v41, &v36);
      CMTime lhs = v41;
      CMTime rhs = v52;
      CMTimeSubtract(&v37, &lhs, &rhs);
      float v29 = CMTimeGetSeconds(&v37);
      if (v18 < v29) {
        float v29 = v18;
      }
      CMTimeMake(&v40, (uint64_t)(float)(v29 * 600.0), 600);
      CMTime lhs = v52;
      CMTime rhs = v40;
      CMTimeAdd(&v41, &lhs, &rhs);
      CMTime v52 = v41;
    }
  }
  CMTime start = v54;
  CMTime end = v52;
  CMTimeRangeFromTimeToTime(&v35, &start, &end);
  CMTimeRange v32 = v35;
  [v8 setTimerange:&v32];
  id v30 = v8;

  return v30;
}

- (id)maxTrimMovieHighlight:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  float v5 = (void *)[v4 mutableCopy];
  memset(&v46, 0, sizeof(v46));
  CMTimeRangeMakeFromDictionary(&v46, (CFDictionaryRef)v4);
  CMTime time = v46.duration;
  if (CMTimeGetSeconds(&time) < self->_minDurationInSeconds)
  {
    id v6 = 0;
    goto LABEL_22;
  }
  CMTimeValue value = *MEMORY[0x1E4F1FA20];
  CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1FA20] + 8);
  if (BYTE5(self->_startRange.duration.epoch))
  {
    CMTimeRange v42 = v46;
    [(VCPMovieHighlightAnalyzer *)self findBestTrim:&v42];
    CMTimeValue value = v43.value;
    CMTimeFlags flags = v43.flags;
    CMTimeScale timescale = v43.timescale;
    CMTimeEpoch epoch = v43.epoch;
    CMTimeValue v9 = v44.value;
    CMTimeScale v10 = v44.timescale;
    CMTimeFlags v11 = v44.flags;
    CMTimeEpoch v12 = v44.epoch;
    if ((v43.flags & 1) == 0) {
      goto LABEL_11;
    }
  }
  else
  {
    CMTimeFlags flags = *(_DWORD *)(MEMORY[0x1E4F1FA20] + 12);
    CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA20] + 16);
    CMTimeValue v9 = *(void *)(MEMORY[0x1E4F1FA20] + 24);
    CMTimeScale v10 = *(_DWORD *)(MEMORY[0x1E4F1FA20] + 32);
    CMTimeFlags v11 = *(_DWORD *)(MEMORY[0x1E4F1FA20] + 36);
    CMTimeEpoch v12 = *(void *)(MEMORY[0x1E4F1FA20] + 40);
    if ((flags & 1) == 0) {
      goto LABEL_11;
    }
  }
  if ((v11 & 1) != 0 && !v12 && (v9 & 0x8000000000000000) == 0)
  {
    v41.CMTimeValue value = v9;
    v41.CMTimeScale timescale = v10;
    v41.CMTimeFlags flags = v11;
    v41.CMTimeEpoch epoch = 0;
    if (CMTimeGetSeconds(&v41) <= self->_maxDurationInSeconds)
    {
      v43.CMTimeValue value = value;
      v43.CMTimeScale timescale = timescale;
      v43.CMTimeFlags flags = flags;
      v43.CMTimeEpoch epoch = epoch;
      CFDictionaryRef v27 = CMTimeCopyAsDictionary(&v43, 0);
      [v5 setObject:v27 forKeyedSubscript:@"start"];

      v43.CMTimeValue value = v9;
      v43.CMTimeScale timescale = v10;
      v43.CMTimeFlags flags = v11;
      v43.CMTimeEpoch epoch = 0;
      CFDictionaryRef v28 = CMTimeCopyAsDictionary(&v43, 0);
      [v5 setObject:v28 forKeyedSubscript:@"duration"];

      float v29 = NSNumber;
      CMTimeValue v33 = value;
      CMTimeScale v34 = timescale;
      CMTimeFlags v35 = flags;
      CMTimeEpoch v36 = epoch;
      CMTimeValue v37 = v9;
      CMTimeScale v38 = v10;
      CMTimeFlags v39 = v11;
      uint64_t v40 = 0;
      [(VCPMovieHighlightAnalyzer *)self highlightScoreForTimeRange:&v33 average:0];
      uint64_t v14 = objc_msgSend(v29, "numberWithFloat:");
      [v5 setObject:v14 forKeyedSubscript:@"quality"];
      goto LABEL_17;
    }
  }
LABEL_11:
  CMTime duration = v46.duration;
  if (CMTimeGetSeconds(&duration) > self->_maxDurationInSeconds || BYTE5(self->_startRange.duration.epoch))
  {
    CMTimeRange v31 = v46;
    CMTimeRange v13 = [(VCPMovieHighlightAnalyzer *)self findBestHighlightSegment:&v31 targetTrim:0];
    uint64_t v14 = v13;
    if (v13)
    {
      [v13 timerange];
      CMTime v47 = v43;
      CFDictionaryRef v15 = CMTimeCopyAsDictionary(&v47, 0);
      [v5 setObject:v15 forKeyedSubscript:@"start"];

      [v14 timerange];
      CMTime v47 = v44;
      CFDictionaryRef v16 = CMTimeCopyAsDictionary(&v47, 0);
      [v5 setObject:v16 forKeyedSubscript:@"duration"];

      CMTime v17 = NSNumber;
      [v14 score];
      float v18 = objc_msgSend(v17, "numberWithFloat:");
      [v5 setObject:v18 forKeyedSubscript:@"quality"];
    }
    else
    {
      CMTimeMake(&v30, (uint64_t)(float)(self->_maxDurationInSeconds * 600.0), 600);
      CMTime v43 = v30;
      float v18 = CMTimeCopyAsDictionary(&v43, 0);
      [v5 setObject:v18 forKeyedSubscript:@"duration"];
    }

LABEL_17:
    if (BYTE5(self->_startRange.duration.epoch))
    {
      float v19 = [v4 objectForKeyedSubscript:@"start"];
      if (v19)
      {
        float v20 = [v4 objectForKeyedSubscript:@"duration"];
        BOOL v21 = v20 == 0;

        if (!v21)
        {
          long long v22 = [v4 objectForKeyedSubscript:@"attributes"];
          CMTime v23 = (void *)[v22 mutableCopy];

          float v24 = [v4 objectForKeyedSubscript:@"start"];
          [v23 setObject:v24 forKeyedSubscript:@"maxHighlightStart"];

          float v25 = [v4 objectForKeyedSubscript:@"duration"];
          [v23 setObject:v25 forKeyedSubscript:@"maxHighlightDuration"];

          [v5 setObject:v23 forKeyedSubscript:@"attributes"];
        }
      }
    }
  }
  id v6 = v5;
LABEL_22:

  return v6;
}

- (void)loadHighlightScoreResults:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSMutableArray *)self->_internalResults removeAllObjects];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        CFDictionaryRef v9 = *(const __CFDictionary **)(*((void *)&v14 + 1) + 8 * v8);
        CMTimeScale v10 = [VCPMovieHighlight alloc];
        CMTimeRangeMakeFromDictionary(&v13, v9);
        CMTimeFlags v11 = [(VCPMovieHighlight *)v10 initWithTimeRange:&v13];
        [(__CFDictionary *)v9 vcp_quality];
        *(float *)&double v12 = v12;
        [(VCPMovieHighlight *)v11 setScore:v12];
        [(NSMutableArray *)self->_internalResults addObject:v11];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

- (id)getHighlightAttributes:(id)a3 withHighlightResults:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v40 = a4;
  id v41 = [MEMORY[0x1E4F1CA60] dictionary];
  int maxHighlightScore_low = LOBYTE(self->_maxHighlightScore);
  [v6 bestPlaybackCrop];
  uint64_t v8 = NSStringFromRect(v57);
  [v41 setObject:v8 forKeyedSubscript:@"bestPlaybackCrop"];

  CFDictionaryRef v9 = [v6 keyFrame];

  if (v9)
  {
    memset(&v44, 0, 24);
    CMTimeScale v10 = [v6 keyFrame];
    CMTimeFlags v11 = v10;
    if (v10) {
      [v10 timestamp];
    }
    else {
      memset(&v44, 0, 24);
    }

    double v12 = [v6 keyFrame];
    [v12 score];
    int v14 = v13;

    *(_OWORD *)&time.start.CMTimeValue value = *(_OWORD *)&v44.start.value;
    time.start.CMTimeEpoch epoch = v44.start.epoch;
    CFDictionaryRef v15 = CMTimeCopyAsDictionary(&time.start, 0);
    [v41 setObject:v15 forKeyedSubscript:@"keyFrameTime"];

    LODWORD(v16) = v14;
    long long v17 = [NSNumber numberWithFloat:v16];
    [v41 setObject:v17 forKeyedSubscript:@"keyFrameScore"];
  }
  BOOL v18 = maxHighlightScore_low == 0;
  if (LOBYTE(self->_maxHighlightScore))
  {
    BOOL v19 = maxHighlightScore_low == 0;
    goto LABEL_16;
  }
  float v20 = [v6 colorNormalization];
  BOOL v21 = maxHighlightScore_low == 0;
  if (!v20)
  {
    [v41 setObject:0 forKeyedSubscript:@"colorNormalizationData"];
    BOOL v21 = 0;
    if (v6) {
      goto LABEL_10;
    }
LABEL_12:
    BOOL v19 = v21;
    memset(v51, 0, sizeof(v51));
    goto LABEL_13;
  }
  if (!v6) {
    goto LABEL_12;
  }
LABEL_10:
  BOOL v19 = v21;
  [v6 timerange];
LABEL_13:
  long long v22 = [(VCPMovieHighlightAnalyzer *)self audioQualityScore:v51];
  if (v22)
  {
    [v41 setObject:v22 forKeyedSubscript:@"audioQuality"];
    BOOL v18 = 0;
  }

LABEL_16:
  if (v18 || !v9 || v19)
  {
    long long v23 = *MEMORY[0x1E4F1FA48];
    duration.CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    *(_OWORD *)&duration.CMTimeValue value = v23;
    id v24 = v40;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (v25)
    {
      BOOL v39 = v19;
      CFDictionaryRef v26 = 0;
      uint64_t v27 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v47 != v27) {
            objc_enumerationMutation(v24);
          }
          CFDictionaryRef v29 = *(const __CFDictionary **)(*((void *)&v46 + 1) + 8 * i);
          memset(&time, 0, sizeof(time));
          CMTimeRangeMakeFromDictionary(&time, v29);
          memset(&v44, 0, sizeof(v44));
          if (v6) {
            [v6 timerange];
          }
          else {
            memset(&range, 0, sizeof(range));
          }
          CMTimeRange otherRange = time;
          CMTimeRangeGetIntersection(&v44, &range, &otherRange);
          CMTime time1 = v44.duration;
          CMTime time2 = duration;
          if (CMTimeCompare(&time1, &time2) >= 1)
          {
            CMTime duration = v44.duration;
            CFDictionaryRef v30 = v29;

            CFDictionaryRef v26 = v30;
          }
        }
        uint64_t v25 = [v24 countByEnumeratingWithState:&v46 objects:v54 count:16];
      }
      while (v25);

      if (!v26) {
        goto LABEL_40;
      }
      if (!v9)
      {
        CMTimeRange v31 = [(__CFDictionary *)v26 objectForKeyedSubscript:@"attributes"];
        CMTimeRange v32 = [v31 objectForKeyedSubscript:@"keyFrameTime"];
        [v41 setObject:v32 forKeyedSubscript:@"keyFrameTime"];

        CMTimeValue v33 = [(__CFDictionary *)v26 objectForKeyedSubscript:@"attributes"];
        CMTimeScale v34 = [v33 objectForKeyedSubscript:@"keyFrameScore"];
        [v41 setObject:v34 forKeyedSubscript:@"keyFrameScore"];
      }
      if (v39)
      {
        CMTimeFlags v35 = [(__CFDictionary *)v26 objectForKeyedSubscript:@"attributes"];
        CMTimeEpoch v36 = [v35 objectForKeyedSubscript:@"colorNormalizationData"];
        [v41 setObject:v36 forKeyedSubscript:@"colorNormalizationData"];
      }
      if (!v18) {
        goto LABEL_40;
      }
      id v24 = [(__CFDictionary *)v26 objectForKeyedSubscript:@"attributes"];
      CMTimeValue v37 = [v24 objectForKeyedSubscript:@"audioQuality"];
      [v41 setObject:v37 forKeyedSubscript:@"audioQuality"];
    }
    else
    {
      CFDictionaryRef v26 = 0;
    }

LABEL_40:
  }

  return v41;
}

- (id)audioQualityScore:(id *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = [(NSArray *)self->_audioQualityResults count];
  if (!v5) {
    goto LABEL_21;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = self->_audioQualityResults;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (!v7)
  {

LABEL_20:
    id v5 = 0;
    goto LABEL_21;
  }
  uint64_t v8 = *(void *)v29;
  float v9 = 0.0;
  CMTimeScale v10 = (CMTime *)MEMORY[0x1E4F1FA48];
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
      int v14 = [(__CFDictionary *)v13 objectForKeyedSubscript:@"quality"];
      [v14 floatValue];
      float v16 = v15;

      CMTimeRange range = v27;
      memset(&v26, 0, sizeof(v26));
      long long v17 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&otherRange.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&otherRange.start.CMTimeEpoch epoch = v17;
      *(_OWORD *)&otherRange.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
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
  id v5 = [NSNumber numberWithFloat:v19];
LABEL_21:
  return v5;
}

- (id)adjustHighlightWithContext:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  CMTimeScale v38 = [MEMORY[0x1E4F1CA48] array];
  self->_contextResults = (NSArray *)0x3E19999A3E4CCCCDLL;
  if ([(NSArray *)self->_sceneResults count] && [(NSArray *)self->_qualityResults count])
  {
    if (LOBYTE(self->_photoOffset)) {
      int v4 = [(VCPMovieHighlightAnalyzer *)self selectHighlightsForTimelapse];
    }
    else {
      int v4 = [(VCPMovieHighlightAnalyzer *)self selectHighlights];
    }
    if (v4) {
      goto LABEL_12;
    }
    float v8 = *(float *)&self->_contextResults * 0.5;
    if (v8 >= *((float *)&self->_contextResults + 1)) {
      float v8 = *((float *)&self->_contextResults + 1);
    }
    *((float *)&self->_contextResults + 1) = fmaxf(v8, 0.0);
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    obuint64_t j = self->_highlightResults;
    uint64_t v9 = [(NSMutableArray *)obj countByEnumeratingWithState:&v57 objects:v66 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v58;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v58 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v57 + 1) + 8 * i);
          CFDictionaryRef v13 = (void *)MEMORY[0x1C186D320]();
          LODWORD(v12) = [(VCPMovieHighlightAnalyzer *)self evaluateSegment:v12];
          if (v12)
          {
            uint64_t v7 = 0;
            goto LABEL_55;
          }
        }
        uint64_t v9 = [(NSMutableArray *)obj countByEnumeratingWithState:&v57 objects:v66 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    if (!LOBYTE(self->_maxHighlightScore)
      && *(void *)&self->_diffFlipCount.__elems_[4]
      && [(VCPMovieHighlightAnalyzer *)self computeColorNormalization])
    {
LABEL_12:
      uint64_t v7 = 0;
    }
    else
    {
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      obuint64_t j = self->_internalConstraintResults;
      uint64_t v14 = [(NSMutableArray *)obj countByEnumeratingWithState:&v53 objects:v65 count:16];
      if (v14)
      {
        uint64_t v39 = *(void *)v54;
        id v41 = self;
        do
        {
          uint64_t v15 = 0;
          uint64_t v40 = v14;
          do
          {
            if (*(void *)v54 != v39) {
              objc_enumerationMutation(obj);
            }
            uint64_t v42 = v15;
            float v16 = *(void **)(*((void *)&v53 + 1) + 8 * v15);
            int v17 = *(_DWORD *)(MEMORY[0x1E4F1FA30] + 12);
            CMTimeValue value = *(void *)(MEMORY[0x1E4F1FA30] + 24);
            CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1FA30] + 32);
            CMTimeFlags flags = *(_DWORD *)(MEMORY[0x1E4F1FA30] + 36);
            CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA30] + 40);
            long long v49 = 0u;
            long long v50 = 0u;
            long long v51 = 0u;
            long long v52 = 0u;
            id v22 = *(id *)&self->_isMaxTrim;
            uint64_t v23 = [v22 countByEnumeratingWithState:&v49 objects:v64 count:16];
            if (v23)
            {
              uint64_t v24 = *(void *)v50;
              while (2)
              {
                for (uint64_t j = 0; j != v23; ++j)
                {
                  if (*(void *)v50 != v24) {
                    objc_enumerationMutation(v22);
                  }
                  CFDictionaryRef v26 = *(const __CFDictionary **)(*((void *)&v49 + 1) + 8 * j);
                  memset(&buf, 0, sizeof(buf));
                  CMTimeRangeMakeFromDictionary(&buf, v26);
                  if (v16) {
                    [v16 timerange];
                  }
                  else {
                    memset(&range, 0, sizeof(range));
                  }
                  CMTimeRange otherRange = buf;
                  CMTimeRangeGetIntersection(&v47, &range, &otherRange);
                  LOBYTE(v17) = v47.start.flags;
                  CMTimeValue value = v47.duration.value;
                  CMTimeScale timescale = v47.duration.timescale;
                  CMTimeFlags flags = v47.duration.flags;
                  CMTimeEpoch epoch = v47.duration.epoch;
                  v47.CMTime start = v47.duration;
                  CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
                  if (CMTimeCompare(&v47.start, &time2) > 0)
                  {
                    self = v41;
                    goto LABEL_42;
                  }
                }
                uint64_t v23 = [v22 countByEnumeratingWithState:&v49 objects:v64 count:16];
                self = v41;
                if (v23) {
                  continue;
                }
                break;
              }
            }
LABEL_42:

            if ((v17 & 1) == 0
              || (flags & 1) == 0
              || epoch
              || value < 0
              || (time1.CMTimeValue value = value,
                  time1.CMTimeScale timescale = timescale,
                  time1.CMTimeFlags flags = flags,
                  time1.CMTimeEpoch epoch = 0,
                  CMTime v43 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48],
                  CMTimeCompare(&time1, &v43)))
            {
              if (v16)
              {
                [v16 timerange];
                *(_OWORD *)&v47.start.CMTimeValue value = *(_OWORD *)&buf.start.value;
                v47.start.CMTimeEpoch epoch = buf.start.epoch;
                [v16 timerange];
              }
              else
              {
                memset(&v47, 0, 24);
                memset(&buf, 0, sizeof(buf));
              }
              CMTime time2 = buf.duration;
              [v16 score];
              int v28 = v27;
              long long v29 = [(VCPMovieHighlightAnalyzer *)self getHighlightAttributes:v16 withHighlightResults:v37];
              v62[0] = @"start";
              *(_OWORD *)&buf.start.CMTimeValue value = *(_OWORD *)&v47.start.value;
              buf.start.CMTimeEpoch epoch = v47.start.epoch;
              CFDictionaryRef v30 = CMTimeCopyAsDictionary(&buf.start, 0);
              v63[0] = v30;
              v62[1] = @"duration";
              buf.CMTime start = time2;
              CFDictionaryRef v31 = CMTimeCopyAsDictionary(&buf.start, 0);
              v63[1] = v31;
              v62[2] = @"quality";
              LODWORD(v32) = v28;
              uint64_t v33 = [NSNumber numberWithFloat:v32];
              v62[3] = @"attributes";
              v63[2] = v33;
              v63[3] = v29;
              CMTimeScale v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:4];
              [v38 addObject:v34];
            }
            uint64_t v15 = v42 + 1;
          }
          while (v42 + 1 != v40);
          uint64_t v14 = [(NSMutableArray *)obj countByEnumeratingWithState:&v53 objects:v65 count:16];
        }
        while (v14);
      }
      uint64_t v7 = v38;
LABEL_55:
    }
    id v6 = v7;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v5 = VCPLogInstance();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.start.value) = 0;
        _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_ERROR, "No scene or quality results exist for highlight generation!", (uint8_t *)&buf, 2u);
      }
    }
    id v6 = 0;
  }

  return v6;
}

- (void)adjustHighlightScoreWithContext
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v3 = *(id *)&self->_isMaxTrim;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v42;
    float v6 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v42 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * i), "vcp_quality");
        float v9 = v8;
        if (v6 <= v9) {
          float v6 = v9;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v4);
  }
  else
  {
    float v6 = 0.0;
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v10 = *(id *)&self->_isMaxTrim;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v38;
    CFDictionaryRef v13 = (CMTime *)MEMORY[0x1E4F1FA48];
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(v10);
        }
        CFDictionaryRef v15 = *(const __CFDictionary **)(*((void *)&v37 + 1) + 8 * j);
        memset(&v36, 0, sizeof(v36));
        CMTimeRangeMakeFromDictionary(&v36, v15);
        [(__CFDictionary *)v15 vcp_quality];
        unint64_t v16 = 0;
        *(float *)&double v17 = v17;
        double v18 = (float)(*(float *)&v17 / v6);
        while (v16 < [(NSMutableArray *)self->_internalResults count])
        {
          double v19 = [(NSMutableArray *)self->_internalResults objectAtIndexedSubscript:v16];
          float v20 = v19;
          memset(&v35, 0, sizeof(v35));
          if (v19) {
            [v19 timerange];
          }
          CMTimeRange range = v36;
          CMTimeRangeGetEnd(&v34, &range);
          *(_OWORD *)&time1.start.CMTimeValue value = *(_OWORD *)&v35.start.value;
          time1.start.CMTimeEpoch epoch = v35.start.epoch;
          CMTime time2 = v34;
          if (CMTimeCompare(&time1.start, &time2) >= 1)
          {

            break;
          }
          [v20 score];
          if (v21 >= 0.0)
          {
            CMTimeRange v31 = v36;
            memset(&time1, 0, sizeof(time1));
            CMTimeRange otherRange = v35;
            CMTimeRangeGetIntersection(&time1, &v31, &otherRange);
            if ((time1.start.flags & 1) == 0
              || (time1.duration.flags & 1) == 0
              || time1.duration.epoch
              || time1.duration.value < 0
              || (v29 = time1.duration, CMTime v28 = *v13, CMTimeCompare(&v29, &v28)))
            {
              CMTime time = time1.duration;
              double Seconds = CMTimeGetSeconds(&time);
              CMTime duration = v35.duration;
              double v23 = CMTimeGetSeconds(&duration);
              [v20 score];
              double v25 = Seconds * v18 / v23 + v24;
              *(float *)&double v25 = v25;
              [v20 setScore:v25];
              [(NSMutableArray *)self->_internalResults replaceObjectAtIndex:v16 withObject:v20];
            }
          }

          ++v16;
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v11);
  }
}

- (int)selectHighlightsForTimelapse
{
  if ([(NSArray *)self->_sceneResults count])
  {
    CFDictionaryRef v3 = [(NSArray *)self->_sceneResults objectAtIndexedSubscript:0];
    CMTimeRangeMakeFromDictionary(&v21, v3);
    CMTime v22 = v21.start;

    memset(&v20, 0, sizeof(v20));
    CFDictionaryRef v4 = [(NSArray *)self->_sceneResults objectAtIndexedSubscript:[(NSArray *)self->_sceneResults count] - 1];
    CMTimeRangeMakeFromDictionary(&range, v4);
    CMTimeRangeGetEnd(&v20, &range);

    memset(&v21, 0, sizeof(v21));
    CMTime start = v22;
    CMTime end = v20;
    CMTimeRangeFromTimeToTime(&v18, &start, &end);
    [(VCPMovieHighlightAnalyzer *)self computeQualityTrimFor:&v18 withKeyFrame:0];
    CMTimeRange v14 = v21;
    [(VCPMovieHighlightAnalyzer *)self computeTrimWithHighlightScoreFor:&v14];
    CMTimeRange v21 = time1;
    time1.CMTime start = time1.duration;
    uint64_t v5 = (CMTime *)MEMORY[0x1E4F1FA48];
    CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    if (CMTimeCompare(&time1.start, &time2) >= 1)
    {
      CMTimeRange v13 = v21;
      float v6 = [(VCPMovieHighlightAnalyzer *)self findBestHighlightSegment:&v13 targetTrim:0];
      uint64_t v7 = v6;
      if (v6) {
        [v6 timerange];
      }
      else {
        memset(v12, 0, sizeof(v12));
      }
      double v8 = [(VCPMovieHighlightAnalyzer *)self pickKeyFramesInRange:v12];
      [v7 setKeyFrame:v8];

      [(VCPMovieHighlightAnalyzer *)self searchFeatureVectorOfSegment:v7];
      if (v7) {
        [v7 timerange];
      }
      else {
        memset(v11, 0, sizeof(v11));
      }
      [(VCPMovieHighlightAnalyzer *)self computeBestPlaybackCrop:v11];
      objc_msgSend(v7, "setBestPlaybackCrop:");
      [v7 score];
      if (*(float *)&self->_contextResults >= v9) {
        float v9 = *(float *)&self->_contextResults;
      }
      *(float *)&self->_contextResults = v9;
      if (v7)
      {
        [v7 timerange];
        CMTime time2 = time1.duration;
        CMTime v23 = *v5;
        if (CMTimeCompare(&time2, &v23) >= 1) {
          [(NSMutableArray *)self->_highlightResults addObject:v7];
        }
      }
    }
  }
  return 0;
}

- ($D854FC4CDD8DDEA9B2859E823A7C8A75)computeTrimWithHighlightScoreFor:(SEL)a3
{
  long long v7 = *(_OWORD *)&a4->var0.var3;
  *(_OWORD *)&v41.CMTimeValue value = *(_OWORD *)&a4->var0.var0;
  long long v8 = *(_OWORD *)&a4->var1.var1;
  *(_OWORD *)&range.start.CMTimeValue value = *(_OWORD *)&a4->var0.var0;
  *(_OWORD *)&range.start.CMTimeEpoch epoch = v7;
  v41.CMTimeEpoch epoch = a4->var0.var3;
  memset(&v40, 0, sizeof(v40));
  *(_OWORD *)&range.duration.CMTimeScale timescale = v8;
  CMTimeRangeGetEnd(&v40, &range);
  float v9 = (CMTime *)MEMORY[0x1E4F1FA48];
  CMTime v38 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  CMTime v37 = v38;
  if ([(NSMutableArray *)self->_internalResults count])
  {
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = [(NSMutableArray *)self->_internalResults objectAtIndexedSubscript:v10];
      uint64_t v12 = v11;
      memset(&v36, 0, sizeof(v36));
      if (v11) {
        [v11 timerange];
      }
      *(_OWORD *)&time1.start.CMTimeValue value = *(_OWORD *)&v36.start.value;
      time1.start.CMTimeEpoch epoch = v36.start.epoch;
      CMTime time2 = v40;
      if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0) {
        break;
      }
      CMTimeRange v34 = v36;
      memset(&time1, 0, sizeof(time1));
      long long v13 = *(_OWORD *)&a4->var0.var3;
      *(_OWORD *)&otherRange.start.CMTimeValue value = *(_OWORD *)&a4->var0.var0;
      *(_OWORD *)&otherRange.start.CMTimeEpoch epoch = v13;
      *(_OWORD *)&otherRange.duration.CMTimeScale timescale = *(_OWORD *)&a4->var1.var1;
      CMTimeRangeGetIntersection(&time1, &v34, &otherRange);
      if ((time1.start.flags & 1) == 0
        || (time1.duration.flags & 1) == 0
        || time1.duration.epoch
        || time1.duration.value < 0
        || (duration = time1.duration, CMTime v31 = *v9, CMTimeCompare(&duration, &v31)))
      {
        [v12 score];
        if (v14 >= 0.0)
        {
          CMTime v38 = time1.start;
          break;
        }
      }

      if (++v10 >= (unint64_t)[(NSMutableArray *)self->_internalResults count]) {
        goto LABEL_16;
      }
    }
  }
LABEL_16:
  uint64_t v15 = [(NSMutableArray *)self->_internalResults count];
  if (v15 - 1 >= 0)
  {
    uint64_t v16 = v15;
    while (1)
    {
      double v17 = [(NSMutableArray *)self->_internalResults objectAtIndexedSubscript:--v16];
      CMTimeRange v18 = v17;
      memset(&v36, 0, sizeof(v36));
      if (v17) {
        [v17 timerange];
      }
      CMTimeRange v29 = v36;
      CMTimeRangeGetEnd(&v30, &v29);
      time1.CMTime start = v30;
      CMTime time2 = v41;
      if (CMTimeCompare(&time1.start, &time2) < 0) {
        break;
      }
      memset(&time1, 0, sizeof(time1));
      CMTimeRange v28 = v36;
      long long v19 = *(_OWORD *)&a4->var0.var3;
      *(_OWORD *)&v27.start.CMTimeValue value = *(_OWORD *)&a4->var0.var0;
      *(_OWORD *)&v27.start.CMTimeEpoch epoch = v19;
      *(_OWORD *)&v27.duration.CMTimeScale timescale = *(_OWORD *)&a4->var1.var1;
      CMTimeRangeGetIntersection(&time1, &v28, &v27);
      if ((time1.start.flags & 1) == 0
        || (time1.duration.flags & 1) == 0
        || time1.duration.epoch
        || time1.duration.value < 0
        || (CMTime v26 = time1.duration, v25 = *v9, CMTimeCompare(&v26, &v25)))
      {
        [v18 score];
        if (v20 >= 0.0)
        {
          CMTimeRange v24 = time1;
          CMTimeRangeGetEnd(&time2, &v24);
          CMTime v37 = time2;
          break;
        }
      }

      if (v16 <= 0) {
        goto LABEL_31;
      }
    }
  }
LABEL_31:
  CMTime start = v38;
  CMTime v22 = v37;
  return ($D854FC4CDD8DDEA9B2859E823A7C8A75 *)CMTimeRangeFromTimeToTime((CMTimeRange *)retstr, &start, &v22);
}

- (int)selectHighlights
{
  unint64_t v3 = 0;
  CMTime v30 = 0;
  char v27 = 0;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  CMTimeValue value = *MEMORY[0x1E4F1FA30];
  CMTimeFlags flags = *(_DWORD *)(MEMORY[0x1E4F1FA30] + 12);
  CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1FA30] + 8);
  CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA30] + 16);
  CMTimeValue v6 = *(void *)(MEMORY[0x1E4F1FA30] + 24);
  CMTimeScale v7 = *(_DWORD *)(MEMORY[0x1E4F1FA30] + 32);
  CMTimeFlags v8 = *(_DWORD *)(MEMORY[0x1E4F1FA30] + 36);
  CMTimeEpoch v9 = *(void *)(MEMORY[0x1E4F1FA30] + 40);
  while ([(NSArray *)self->_sceneResults count] > v3)
  {
    CFDictionaryRef v10 = [(NSArray *)self->_sceneResults objectAtIndexedSubscript:v3];
    memset(&v50, 0, sizeof(v50));
    CMTimeRangeMakeFromDictionary(&v50, v10);
    memset(&v49[1], 0, sizeof(CMTimeRange));
    v49[0] = v50;
    [(VCPMovieHighlightAnalyzer *)self computeQualityTrimFor:v49 withKeyFrame:0];
    CMTimeRange v47 = v49[1];
    [(VCPMovieHighlightAnalyzer *)self computeTrimWithHighlightScoreFor:&v47];
    v49[1] = time1;
    time1.CMTime start = time1.duration;
    CMTime time2 = v50.duration;
    unint64_t v29 = v3;
    if (CMTimeCompare(&time1.start, &time2)) {
      goto LABEL_48;
    }
    CMTimeMake(&v51, 1200, 600);
    time1.CMTime start = v50.duration;
    CMTime time2 = v51;
    if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0
      || ([(__CFDictionary *)v10 objectForKeyedSubscript:@"quality"],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          [v11 floatValue],
          BOOL v13 = v12 < 0.5,
          v11,
          v13))
    {
LABEL_48:
      if ((v27 & 1) != 0
        && ([(__CFDictionary *)v10 objectForKeyedSubscript:@"quality"],
            float v14 = objc_claimAutoreleasedReturnValue(),
            [v14 floatValue],
            BOOL v16 = v15 < 0.5,
            v14,
            !v16))
      {
        range.start.CMTimeValue value = value;
        range.start.CMTimeScale timescale = timescale;
        range.start.CMTimeFlags flags = flags;
        range.start.CMTimeEpoch epoch = epoch;
        range.duration.CMTimeValue value = v6;
        range.duration.CMTimeScale timescale = v7;
        range.duration.CMTimeFlags flags = v8;
        range.duration.CMTimeEpoch epoch = v9;
        CMTimeRange otherRange = v49[1];
        CMTimeRangeGetUnion(&time1, &range, &otherRange);
        char v27 = 0;
        *(_OWORD *)&v50.start.CMTimeValue value = *(_OWORD *)&time1.start.value;
        *(_OWORD *)&v50.start.CMTimeEpoch epoch = *(_OWORD *)&time1.start.epoch;
        long long v17 = *(_OWORD *)&time1.duration.timescale;
      }
      else
      {
        char v27 = 0;
        *(_OWORD *)&v50.start.CMTimeValue value = *(_OWORD *)&v49[1].start.value;
        *(_OWORD *)&v50.start.CMTimeEpoch epoch = *(_OWORD *)&v49[1].start.epoch;
        long long v17 = *(_OWORD *)&v49[1].duration.timescale;
      }
      *(_OWORD *)&v50.duration.CMTimeScale timescale = v17;
    }
    else
    {
      if ((flags & 1) == 0
        || (v8 & 1) == 0
        || v9
        || v6 < 0
        || (v46.CMTimeValue value = v6,
            v46.CMTimeScale timescale = v7,
            v46.CMTimeFlags flags = v8,
            v46.CMTimeEpoch epoch = 0,
            CMTime v45 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48],
            CMTimeCompare(&v46, &v45)))
      {
        if (v29 == [(NSArray *)self->_sceneResults count] - 1) {
          goto LABEL_30;
        }
        float v20 = [(NSArray *)self->_sceneResults objectAtIndexedSubscript:v29 + 1];
        CMTimeRange v21 = [v20 objectForKeyedSubscript:@"quality"];
        [v21 floatValue];
        BOOL v28 = v22 > 0.3;

        if (!v28)
        {
LABEL_30:
          v44.start.CMTimeValue value = value;
          v44.start.CMTimeScale timescale = timescale;
          v44.start.CMTimeFlags flags = flags;
          v44.start.CMTimeEpoch epoch = epoch;
          v44.duration.CMTimeValue value = v6;
          v44.duration.CMTimeScale timescale = v7;
          v44.duration.CMTimeFlags flags = v8;
          v44.duration.CMTimeEpoch epoch = v9;
          CMTimeRange v43 = v49[1];
          CMTimeRangeGetUnion(&time1, &v44, &v43);
          CMTimeRange v50 = time1;
        }
      }
      char v27 = 1;
    }
    time1.CMTime start = v50.duration;
    CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    if (CMTimeCompare(&time1.start, &time2) < 1)
    {
      CMTimeRange v18 = v30;
      goto LABEL_44;
    }
    CMTimeRange v40 = v50;
    CMTimeRange v18 = [(VCPMovieHighlightAnalyzer *)self findBestHighlightSegment:&v40 targetTrim:0];
    if (!v30) {
      goto LABEL_19;
    }
    [v30 qualityScore];
    if (v19 < 0.5) {
      goto LABEL_19;
    }
    if (v18) {
      [v18 timerange];
    }
    else {
      memset(&time1, 0, sizeof(time1));
    }
    [v30 timerange];
    CMTimeRangeGetEnd(&v39, &v38);
    CMTime time2 = time1.start;
    CMTime v51 = v39;
    if (!CMTimeCompare(&time2, &v51))
    {
      memset(&time1, 0, sizeof(time1));
      [v30 timerange];
      CMTime start = time2;
      if (v18) {
        [v18 timerange];
      }
      else {
        memset(&v34, 0, sizeof(v34));
      }
      CMTimeRangeGetEnd(&end, &v34);
      CMTimeRangeFromTimeToTime(&time1, &start, &end);
      CMTimeRange v33 = time1;
      uint64_t v23 = [(VCPMovieHighlightAnalyzer *)self findBestHighlightSegment:&v33 targetTrim:0];

      [(NSMutableArray *)self->_highlightResults removeLastObject];
      CMTimeRange v18 = (void *)v23;
      if (!v23)
      {
LABEL_34:
        memset(v32, 0, sizeof(v32));
        goto LABEL_35;
      }
    }
    else
    {
LABEL_19:
      if (!v18) {
        goto LABEL_34;
      }
    }
    [v18 timerange];
LABEL_35:
    CMTimeRange v24 = [(VCPMovieHighlightAnalyzer *)self pickKeyFramesInRange:v32];
    [v18 setKeyFrame:v24];

    [(VCPMovieHighlightAnalyzer *)self searchFeatureVectorOfSegment:v18];
    if (v18) {
      [v18 timerange];
    }
    else {
      memset(v31, 0, sizeof(v31));
    }
    [(VCPMovieHighlightAnalyzer *)self computeBestPlaybackCrop:v31];
    objc_msgSend(v18, "setBestPlaybackCrop:");
    [v18 score];
    if (*(float *)&self->_contextResults >= v25) {
      float v25 = *(float *)&self->_contextResults;
    }
    *(float *)&self->_contextResults = v25;
    if (v18)
    {
      [v18 timerange];
      CMTime time2 = time1.duration;
      CMTime v51 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
      if (CMTimeCompare(&time2, &v51) >= 1) {
        [(NSMutableArray *)self->_highlightResults addObject:v18];
      }
    }

LABEL_44:
    CMTimeValue value = v49[1].start.value;
    CMTimeFlags flags = v49[1].start.flags;
    CMTimeScale timescale = v49[1].start.timescale;
    CMTimeValue v6 = v49[1].duration.value;
    CMTimeEpoch epoch = v49[1].start.epoch;
    CMTimeScale v7 = v49[1].duration.timescale;
    CMTimeFlags v8 = v49[1].duration.flags;
    CMTimeEpoch v9 = v49[1].duration.epoch;

    unint64_t v3 = v29 + 1;
    CMTime v30 = v18;
  }

  return 0;
}

- (int)computeColorNormalization
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = self->_internalConstraintResults;
  uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v30;
    float v19 = @"colorNormalizationData";
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v30 != v5) {
        objc_enumerationMutation(obj);
      }
      CMTimeScale v7 = *(void **)(*((void *)&v29 + 1) + 8 * v6);
      if (v7)
      {
        [*(id *)(*((void *)&v29 + 1) + 8 * v6) timerange];
      }
      else
      {
        long long v25 = 0u;
        long long v26 = 0u;
        long long v24 = 0u;
      }
      long long v27 = v24;
      uint64_t v28 = v25;
      CMTimeEpoch epoch = (void *)self->_preferredTimeRange.duration.epoch;
      long long v22 = v24;
      uint64_t v23 = v25;
      uint64_t v9 = objc_msgSend(epoch, "copyCGImageAtTime:actualTime:error:", &v22, 0, 0, v19);
      *(void *)&long long v24 = v9;
      if (v9)
      {
        CFDictionaryRef v10 = *(void **)&self->_diffFlipCount.__elems_[4];
        id v21 = 0;
        int v11 = [v10 analyzeCGImage:v9 results:&v21];
        id v12 = v21;
        BOOL v13 = v12;
        if (v11)
        {
          int v14 = 1;
          int v2 = v11;
        }
        else
        {
          float v15 = [v12 objectForKeyedSubscript:@"ColorNormalizationResults"];
          if ([v15 count])
          {
            BOOL v16 = [v15 objectAtIndexedSubscript:0];
            long long v17 = [v16 objectForKeyedSubscript:v19];

            if (v17)
            {
              [v7 setColorNormalization:v17];
              int v14 = 0;
            }
            else
            {
              int v2 = -18;
              int v14 = 1;
            }
          }
          else
          {
            int v2 = -18;
            int v14 = 1;
          }
        }
      }
      else
      {
        BOOL v13 = 0;
        int v2 = -18;
        int v14 = 1;
      }
      CF<opaqueCMSampleBuffer *>::~CF((const void **)&v24);

      if (v14) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_23;
      }
    }
  }
  else
  {
LABEL_23:
    int v2 = 0;
  }

  return v2;
}

- (float)highlightScoreForTimeRange:(id *)a3 average:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  {
    CMTimeMake((CMTime *)-[VCPMovieHighlightAnalyzer highlightScoreForTimeRange:average:]::kMeaningfulLength, 600, 600);
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  CMTimeScale v7 = self->_internalResults;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v33;
    float v10 = 0.0;
    int v11 = (CMTime *)MEMORY[0x1E4F1FA48];
    float v12 = 0.0;
    float v13 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v7);
        }
        float v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        memset(&v31, 0, sizeof(v31));
        if (v15) {
          [v15 timerange];
        }
        else {
          memset(&range, 0, sizeof(range));
        }
        long long v16 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&otherRange.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&otherRange.start.CMTimeEpoch epoch = v16;
        *(_OWORD *)&otherRange.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
        CMTimeRangeGetIntersection(&v31, &range, &otherRange);
        if ((v31.start.flags & 1) != 0
          && (v31.duration.flags & 1) != 0
          && !v31.duration.epoch
          && (v31.duration.value & 0x8000000000000000) == 0)
        {
          CMTime time1 = v31.duration;
          CMTime time2 = *v11;
          if (!CMTimeCompare(&time1, &time2)) {
            continue;
          }
        }
        [v15 score];
        float v18 = v17;
        CMTime time = v31.duration;
        double Seconds = CMTimeGetSeconds(&time);
        CMTime duration = v31.duration;
        double v20 = CMTimeGetSeconds(&duration);
        CMTime v37 = v31.duration;
        CMTime v36 = *(CMTime *)-[VCPMovieHighlightAnalyzer highlightScoreForTimeRange:average:]::kMeaningfulLength;
        float v10 = v10 + v18 * Seconds;
        float v13 = v20 + v13;
        if (CMTimeCompare(&v37, &v36) >= 1)
        {
          [v15 score];
          if (v12 < v21)
          {
            [v15 score];
            float v12 = v22;
          }
        }
      }
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v8);
  }
  else
  {
    float v10 = 0.0;
    float v12 = 0.0;
    float v13 = 0.0;
  }

  float result = v10 / v13;
  if (v13 <= 0.0) {
    float result = 0.0;
  }
  if (v12 > result && !v4) {
    return (float)(v12 + result) * 0.5;
  }
  return result;
}

- (id)findBestHighlightSegment:(id *)a3 targetTrim:(BOOL)a4
{
  BOOL v4 = a4;
  {
    CMTimeMake((CMTime *)-[VCPMovieHighlightAnalyzer findBestHighlightSegment:targetTrim:]::kHalfSecond, 300, 600);
  }
  if (v4) {
    minDurationIndouble Seconds = self->_targetDurationInSeconds - self->_toleranceInSeconds;
  }
  else {
    minDurationIndouble Seconds = self->_minDurationInSeconds;
  }
  memset(&v32, 0, sizeof(v32));
  CMTimeMake(&v32, (uint64_t)(float)(minDurationInSeconds * 600.0), 600);
  if (v4) {
    maxDurationIndouble Seconds = self->_targetDurationInSeconds - self->_toleranceInSeconds;
  }
  else {
    maxDurationIndouble Seconds = self->_maxDurationInSeconds;
  }
  memset(&v31, 0, sizeof(v31));
  CMTimeMake(&v31, (uint64_t)(float)(maxDurationInSeconds * 600.0), 600);
  CMTime var0 = (CMTime)a3->var0;
  memset(&v30, 0, sizeof(v30));
  *(_OWORD *)&lhs.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
  lhs.start.CMTimeEpoch epoch = a3->var0.var3;
  *(_OWORD *)&rhs.start.CMTimeValue value = *(_OWORD *)&a3->var1.var0;
  rhs.start.CMTimeEpoch epoch = a3->var1.var3;
  CMTimeAdd(&v30, &lhs.start, &rhs.start);
  uint64_t v9 = [VCPMovieHighlight alloc];
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
  v29[0] = *MEMORY[0x1E4F1FA30];
  v29[1] = v10;
  v29[2] = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 32);
  int v11 = [(VCPMovieHighlight *)v9 initWithTimeRange:v29];
  do
  {
    memset(&v27, 0, sizeof(v27));
    lhs.CMTime start = var0;
    rhs.CMTime start = v31;
    CMTimeAdd(&v34, &lhs.start, &rhs.start);
    lhs.CMTime start = v34;
    rhs.CMTime start = v30;
    if (CMTimeCompare(&lhs.start, &rhs.start) < 1)
    {
      CMTime v27 = v31;
    }
    else
    {
      lhs.CMTime start = v30;
      rhs.CMTime start = var0;
      CMTimeSubtract(&v27, &lhs.start, &rhs.start);
    }
    lhs.CMTime start = v27;
    rhs.CMTime start = v32;
    if (CMTimeCompare(&lhs.start, &rhs.start) < 0) {
      break;
    }
    memset(&lhs, 0, sizeof(lhs));
    CMTime start = var0;
    CMTime duration = v27;
    CMTimeRangeMake(&lhs, &start, &duration);
    if (BYTE5(self->_startRange.duration.epoch) && !v4)
    {
      CMTimeRange v22 = lhs;
      [(VCPMovieHighlightAnalyzer *)self findBestTrim:&v22];
      CMTimeRange lhs = rhs;
    }
    float v12 = [VCPMovieHighlight alloc];
    CMTimeRange v21 = lhs;
    float v13 = [(VCPMovieHighlight *)v12 initWithTimeRange:&v21];
    CMTimeRange v20 = lhs;
    [(VCPMovieHighlightAnalyzer *)self highlightScoreForTimeRange:&v20 average:0];
    -[VCPMovieHighlight setScore:](v13, "setScore:");
    if (v11)
    {
      [(VCPMovieHighlight *)v13 score];
      float v15 = v14;
      [(VCPMovieHighlight *)v11 score];
      if (v15 <= v16) {
        continue;
      }
    }
    float v17 = v13;

    int v11 = v17;
    CMTime v34 = var0;
    CMTime v33 = *(CMTime *)-[VCPMovieHighlightAnalyzer findBestHighlightSegment:targetTrim:]::kHalfSecond;
    CMTimeAdd(&rhs.start, &v34, &v33);
    CMTime var0 = rhs.start;

    lhs.CMTime start = v30;
    rhs.CMTime start = v31;
    CMTimeSubtract(&v34, &lhs.start, &rhs.start);
    lhs.CMTime start = var0;
    rhs.CMTime start = v34;
  }
  while (CMTimeCompare(&lhs.start, &rhs.start) < 0);
  if (v11) {
    [(VCPMovieHighlight *)v11 timerange];
  }
  else {
    memset(v19, 0, sizeof(v19));
  }
  [(VCPMovieHighlightAnalyzer *)self highlightScoreForTimeRange:v19 average:1];
  -[VCPMovieHighlight setAverageScore:](v11, "setAverageScore:");
  return v11;
}

- ($D854FC4CDD8DDEA9B2859E823A7C8A75)findBestTrim:(SEL)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  CMTime time = (CMTime)a4->var1;
  if (CMTimeGetSeconds(&time) <= self->_minDurationInSeconds)
  {
    long long v20 = *(_OWORD *)&a4->var0.var3;
    *(_OWORD *)&retstr->var0.CMTime var0 = *(_OWORD *)&a4->var0.var0;
    *(_OWORD *)&retstr->var0.var3 = v20;
    *(_OWORD *)&retstr->var1.CMTime var1 = *(_OWORD *)&a4->var1.var1;
    return result;
  }
  {
    CMTimeMake((CMTime *)-[VCPMovieHighlightAnalyzer findBestTrim:]::kMeaningfulLength, 600, 600);
  }
  long long v71 = 0u;
  long long v70 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  uint64_t v8 = self->_internalResults;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v68 objects:v75 count:16];
  CMTime v41 = (CMTimeRange *)retstr;
  long long v10 = (CMTime *)MEMORY[0x1E4F1FA48];
  if (v9)
  {
    uint64_t v11 = *(void *)v69;
    float v12 = 0.0;
    float v13 = 1.0;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v69 != v11) {
          objc_enumerationMutation(v8);
        }
        float v15 = *(void **)(*((void *)&v68 + 1) + 8 * i);
        memset(&v67, 0, sizeof(v67));
        if (v15) {
          [v15 timerange];
        }
        else {
          memset(&range, 0, sizeof(range));
        }
        long long v16 = *(_OWORD *)&a4->var0.var3;
        *(_OWORD *)&otherRange.start.CMTimeValue value = *(_OWORD *)&a4->var0.var0;
        *(_OWORD *)&otherRange.start.CMTimeEpoch epoch = v16;
        *(_OWORD *)&otherRange.duration.CMTimeScale timescale = *(_OWORD *)&a4->var1.var1;
        CMTimeRangeGetIntersection(&v67, &range, &otherRange);
        if ((v67.start.flags & 1) != 0
          && (v67.duration.flags & 1) != 0
          && !v67.duration.epoch
          && (v67.duration.value & 0x8000000000000000) == 0)
        {
          CMTime time1 = v67.duration;
          CMTime time2 = *v10;
          if (!CMTimeCompare(&time1, &time2)) {
            continue;
          }
        }
        CMTime rhs = v67.duration;
        CMTime v73 = *(CMTime *)-[VCPMovieHighlightAnalyzer findBestTrim:]::kMeaningfulLength;
        if (CMTimeCompare(&rhs, &v73) >= 1)
        {
          [v15 score];
          float v18 = v17;
          [v15 score];
          if (v12 < v18) {
            float v12 = v18;
          }
          if (v19 < v13) {
            float v13 = v19;
          }
        }
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v68 objects:v75 count:16];
    }
    while (v9);
  }
  else
  {
    float v12 = 0.0;
    float v13 = 1.0;
  }

  long long v21 = *(_OWORD *)&a4->var0.var3;
  CMTime var0 = (CMTime)a4->var0;
  memset(&v61, 0, sizeof(v61));
  long long v22 = *(_OWORD *)&a4->var1.var1;
  *(_OWORD *)&v60.start.CMTimeValue value = *(_OWORD *)&a4->var0.var0;
  *(_OWORD *)&v60.start.CMTimeEpoch epoch = v21;
  *(_OWORD *)&v60.duration.CMTimeScale timescale = v22;
  CMTimeRangeGetEnd(&v61, &v60);
  CMTime v59 = var0;
  CMTime v58 = v61;
  float v23 = fminf((float)(v13 + v12) * 0.5, 0.4);
  if ([(NSMutableArray *)self->_internalResults count])
  {
    uint64_t v24 = 0;
    while (1)
    {
      long long v25 = [(NSMutableArray *)self->_internalResults objectAtIndexedSubscript:v24];
      long long v26 = v25;
      if (v25) {
        [v25 timerange];
      }
      else {
        memset(&v67, 0, sizeof(v67));
      }
      CMTime rhs = v67.start;
      CMTime v73 = v61;
      if ((CMTimeCompare(&rhs, &v73) & 0x80000000) == 0)
      {
        uint64_t v24 = -1;
        goto LABEL_45;
      }
      memset(&v67, 0, sizeof(v67));
      if (v26) {
        [v26 timerange];
      }
      else {
        memset(&v57, 0, sizeof(v57));
      }
      long long v27 = *(_OWORD *)&a4->var0.var3;
      *(_OWORD *)&v56.start.CMTimeValue value = *(_OWORD *)&a4->var0.var0;
      *(_OWORD *)&v56.start.CMTimeEpoch epoch = v27;
      *(_OWORD *)&v56.duration.CMTimeScale timescale = *(_OWORD *)&a4->var1.var1;
      CMTimeRangeGetIntersection(&v67, &v57, &v56);
      if ((v67.start.flags & 1) == 0
        || (v67.duration.flags & 1) == 0
        || v67.duration.epoch
        || v67.duration.value < 0
        || (CMTime duration = v67.duration, v54 = *v10, CMTimeCompare(&duration, &v54)))
      {
        [v26 score];
        if (v28 >= v23) {
          break;
        }
      }

      if (++v24 >= (unint64_t)[(NSMutableArray *)self->_internalResults count]) {
        goto LABEL_42;
      }
    }
    CMTime v59 = v67.start;
LABEL_45:
  }
  else
  {
LABEL_42:
    uint64_t v24 = -1;
  }
  uint64_t v29 = [(NSMutableArray *)self->_internalResults count];
  if (v29 - 1 < 0)
  {
LABEL_61:
    uint64_t v29 = -1;
  }
  else
  {
    while (1)
    {
      CMTime v30 = [(NSMutableArray *)self->_internalResults objectAtIndexedSubscript:--v29];
      CMTime v31 = v30;
      if (v30) {
        [v30 timerange];
      }
      else {
        memset(&v53, 0, sizeof(v53));
      }
      CMTimeRangeGetEnd(&v73, &v53);
      v67.CMTime start = v73;
      CMTime rhs = var0;
      if (CMTimeCompare(&v67.start, &rhs) < 0)
      {
        uint64_t v29 = -1;
        goto LABEL_64;
      }
      memset(&v67, 0, sizeof(v67));
      if (v31) {
        [v31 timerange];
      }
      else {
        memset(&v52, 0, sizeof(v52));
      }
      long long v32 = *(_OWORD *)&a4->var0.var3;
      *(_OWORD *)&v51.start.CMTimeValue value = *(_OWORD *)&a4->var0.var0;
      *(_OWORD *)&v51.start.CMTimeEpoch epoch = v32;
      *(_OWORD *)&v51.duration.CMTimeScale timescale = *(_OWORD *)&a4->var1.var1;
      CMTimeRangeGetIntersection(&v67, &v52, &v51);
      if ((v67.start.flags & 1) == 0
        || (v67.duration.flags & 1) == 0
        || v67.duration.epoch
        || v67.duration.value < 0
        || (v50 = v67.duration, CMTime v49 = *v10, CMTimeCompare(&v50, &v49)))
      {
        [v31 score];
        if (v33 >= v23) {
          break;
        }
      }

      if (v29 <= 0) {
        goto LABEL_61;
      }
    }
    CMTimeRange v48 = v67;
    CMTimeRangeGetEnd(&rhs, &v48);
    CMTime v58 = rhs;
LABEL_64:
  }
  if (v24 < 0)
  {
    CMTime v34 = 0;
    if ((v29 & 0x8000000000000000) == 0) {
      goto LABEL_67;
    }
LABEL_69:
    long long v35 = 0;
    goto LABEL_70;
  }
  CMTime v34 = [(NSMutableArray *)self->_internalResults objectAtIndexedSubscript:v24];
  if (v29 < 0) {
    goto LABEL_69;
  }
LABEL_67:
  long long v35 = [(NSMutableArray *)self->_internalResults objectAtIndexedSubscript:v29];
LABEL_70:
  memset(&v73, 0, sizeof(v73));
  CMTimeMake(&v73, (uint64_t)(float)(self->_minDurationInSeconds * 600.0), 600);
  while (1)
  {
    v67.CMTime start = v58;
    CMTime rhs = v59;
    CMTimeSubtract(&v47, &v67.start, &rhs);
    v67.CMTime start = v47;
    CMTime rhs = v73;
    if ((CMTimeCompare(&v67.start, &rhs) & 0x80000000) == 0) {
      break;
    }
    if (v35)
    {
      if (v34)
      {
        [v35 score];
        float v37 = v36;
        [v34 score];
        if (v37 <= v38) {
          goto LABEL_85;
        }
      }
      memset(&v47, 0, sizeof(v47));
      [v35 timerange];
      CMTimeRangeGetEnd(&v47, &v46);
      v67.CMTime start = v47;
      CMTime rhs = v59;
      CMTimeSubtract(&v44, &v67.start, &rhs);
      v67.CMTime start = v44;
      CMTime rhs = v73;
      if (CMTimeCompare(&v67.start, &rhs) < 0)
      {
        CMTime v45 = v47;
      }
      else
      {
        v67.CMTime start = v59;
        CMTime rhs = v73;
        CMTimeAdd(&v45, &v67.start, &rhs);
      }
      CMTime v58 = v45;
      v67.CMTime start = v45;
      CMTime rhs = v61;
      if (CMTimeCompare(&v67.start, &rhs) < 0)
      {
        if (v29 + 1 >= (unint64_t)[(NSMutableArray *)self->_internalResults count])
        {
          uint64_t v39 = 0;
        }
        else
        {
          uint64_t v39 = [(NSMutableArray *)self->_internalResults objectAtIndexedSubscript:v29 + 1];
          ++v29;
        }
      }
      else
      {
        uint64_t v39 = 0;
        CMTime v58 = v61;
      }

      long long v35 = (void *)v39;
    }
    else
    {
      if (!v34)
      {
        long long v35 = 0;
        break;
      }
LABEL_85:
      memset(&v47, 0, sizeof(v47));
      [v34 timerange];
      CMTime v47 = v67.start;
      v67.CMTime start = v58;
      CMTime rhs = v47;
      CMTimeSubtract(&v44, &v67.start, &rhs);
      v67.CMTime start = v44;
      CMTime rhs = v73;
      if (CMTimeCompare(&v67.start, &rhs) < 0)
      {
        CMTime v45 = v47;
      }
      else
      {
        v67.CMTime start = v58;
        CMTime rhs = v73;
        CMTimeSubtract(&v45, &v67.start, &rhs);
      }
      CMTime v59 = v45;
      v67.CMTime start = v45;
      CMTime rhs = var0;
      if (CMTimeCompare(&v67.start, &rhs) <= 0)
      {
        uint64_t v40 = 0;
        CMTime v59 = var0;
      }
      else if (v24 < 1)
      {
        uint64_t v40 = 0;
      }
      else
      {
        uint64_t v40 = [(NSMutableArray *)self->_internalResults objectAtIndexedSubscript:v24 - 1];
        --v24;
      }

      CMTime v34 = (void *)v40;
    }
  }
  CMTime start = v59;
  CMTime end = v58;
  CMTimeRangeFromTimeToTime(v41, &start, &end);

  return result;
}

- (id)movieSummary
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  if (![(NSArray *)self->_qualityResults count])
  {
    long long v16 = 0;
    goto LABEL_47;
  }
  unint64_t v3 = [MEMORY[0x1E4F1C9C8] now];
  [v3 timeIntervalSince1970];
  double v5 = v4;

  uint64_t v6 = objc_alloc_init(VCPMovieHighlight);
  memset(&v99, 0, sizeof(v99));
  CMTimeRangeMakeFromDictionary(&v99, (CFDictionaryRef)[(NSArray *)self->_qualityResults firstObject]);
  memset(&v98, 0, sizeof(v98));
  CMTimeRangeMakeFromDictionary(&v98, (CFDictionaryRef)[(NSArray *)self->_qualityResults lastObject]);
  memset(&v97, 0, sizeof(v97));
  CMTime start = v99.start;
  CMTimeRange range = v98;
  CMTimeRangeGetEnd(&end, &range);
  CMTimeRangeFromTimeToTime(&v97, &start, &end);
  memset(&v93, 0, sizeof(v93));
  CMTimeRange v92 = v97;
  [(VCPMovieHighlightAnalyzer *)self computeQualityTrimFor:&v92 withKeyFrame:1];
  CMTimeRange v90 = v93;
  memset(&v91, 0, sizeof(v91));
  [(VCPMovieHighlightAnalyzer *)self computeActionFaceTrimFor:&v90];
  v89[0] = v93;
  memset(&v89[1], 0, sizeof(CMTimeRange));
  [(VCPMovieHighlightAnalyzer *)self computeSteadyTranslationTrimFor:v89];
  if ((v89[1].start.flags & 1) == 0
    || (v89[1].duration.flags & 1) == 0
    || v89[1].duration.epoch
    || v89[1].duration.value < 0
    || (CMTime time1 = v89[1].duration, time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48], CMTimeCompare(&time1, &time2)))
  {
    if ((v91.start.flags & 1) == 0
      || (v91.duration.flags & 1) == 0
      || v91.duration.epoch
      || v91.duration.value < 0
      || (CMTime duration = v91.duration, v85 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48], CMTimeCompare(&duration, &v85)))
    {
      CMTimeRange v83 = v91;
      CMTimeRange otherRange = v89[1];
      CMTimeRangeGetUnion(&v84, &v83, &otherRange);
      CMTimeRange v91 = v84;
    }
    else
    {
      CMTimeRange v91 = v89[1];
      CMTimeRange v93 = v89[1];
    }
  }
  CMTimeScale v7 = &v93;
  if (!LOBYTE(self->_maxHighlightScore)) {
    CMTimeScale v7 = &v91;
  }
  CMTimeValue value = v7->start.value;
  CMTimeFlags flags = v7->start.flags;
  CMTimeScale timescale = v7->start.timescale;
  CMTimeEpoch epoch = v7->start.epoch;
  CMTimeValue v10 = v7->duration.value;
  CMTimeScale v11 = v7->duration.timescale;
  CMTimeFlags v12 = v7->duration.flags;
  CMTimeEpoch v13 = v7->duration.epoch;
  if ((flags & 1) == 0
    || (v12 & 1) == 0
    || v13
    || v10 < 0
    || (v81.CMTimeValue value = v7->duration.value,
        v81.CMTimeScale timescale = v11,
        v81.CMTimeFlags flags = v12,
        v81.CMTimeEpoch epoch = 0,
        CMTime v80 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48],
        CMTimeCompare(&v81, &v80)))
  {
    int v25 = *((unsigned __int8 *)&self->_isLivePhoto + 2);
    CMTimeValue v72 = value;
    CMTimeScale v73 = timescale;
    CMTimeFlags v74 = flags;
    CMTimeEpoch v75 = epoch;
    CMTimeValue v76 = v10;
    CMTimeScale v77 = v11;
    CMTimeFlags v78 = v12;
    CMTimeEpoch v79 = v13;
    BOOL v14 = [(VCPMovieHighlightAnalyzer *)self checkCameraZoom:&v72];
    CMTimeRange v71 = v97;
    [(VCPMovieHighlightAnalyzer *)self generateExpressionSegments:&v71];
    time.CMTimeValue value = v10;
    time.CMTimeScale timescale = v11;
    time.CMTimeFlags flags = v12;
    time.CMTimeEpoch epoch = v13;
    double Seconds = CMTimeGetSeconds(&time);
    CMTime v69 = v97.duration;
    [(VCPMovieHighlight *)v6 setIsTrimmed:Seconds < CMTimeGetSeconds(&v69)];
    CMTimeValue v61 = value;
    CMTimeScale v62 = timescale;
    CMTimeFlags v63 = flags;
    CMTimeEpoch v64 = epoch;
    CMTimeValue v65 = v10;
    CMTimeScale v66 = v11;
    CMTimeFlags v67 = v12;
    CMTimeEpoch v68 = v13;
    [(VCPMovieHighlightAnalyzer *)self analyzeOverallQuality:&v61 isSettlingEffect:0 isAnimatedSticker:0];
    -[VCPMovieHighlight setScore:](v6, "setScore:");
    CMTimeValue v53 = value;
    CMTimeScale v54 = timescale;
    CMTimeFlags v55 = flags;
    CMTimeEpoch v56 = epoch;
    CMTimeValue v57 = v10;
    CMTimeScale v58 = v11;
    CMTimeFlags v59 = v12;
    CMTimeEpoch v60 = v13;
    [(VCPMovieHighlight *)v6 setTimerange:&v53];
    if (v6) {
      [(VCPMovieHighlight *)v6 timerange];
    }
    else {
      memset(v52, 0, sizeof(v52));
    }
    uint64_t v17 = [(VCPMovieHighlightAnalyzer *)self pickKeyFramesInRange:v52];
    [(VCPMovieHighlight *)v6 setKeyFrame:v17];

    float v18 = [(VCPMovieHighlight *)v6 keyFrame];
    LOBYTE(v17) = v18 == 0;

    if ((v17 & 1) == 0)
    {
      if (LOBYTE(self->_maxHighlightScore))
      {
        if (v6) {
          [(VCPMovieHighlight *)v6 timerange];
        }
        else {
          memset(&v84, 0, sizeof(v84));
        }
        CMTime v51 = v84.duration;
        BOOL v19 = CMTimeGetSeconds(&v51) > 2.0 && (*((unsigned __int8 *)&self->_isLivePhoto + 1) | v25 | v14) == 0;
        if (LOBYTE(self->_maxHighlightScore))
        {
          BOOL v20 = 0;
LABEL_40:
          [(VCPMovieHighlight *)v6 setIsAutoPlayable:v19 | v20];
          CMTimeValue v42 = value;
          CMTimeScale v43 = timescale;
          CMTimeFlags v44 = flags;
          CMTimeEpoch v45 = epoch;
          CMTimeValue v46 = v10;
          CMTimeScale v47 = v11;
          CMTimeFlags v48 = v12;
          CMTimeEpoch v49 = v13;
          [(VCPMovieHighlightAnalyzer *)self computeBestPlaybackCrop:&v42];
          -[VCPMovieHighlight setBestPlaybackCrop:](v6, "setBestPlaybackCrop:");
          if (LOBYTE(self->_maxHighlightScore))
          {
            long long v21 = objc_alloc_init(VCPMovieHighlight);
            long long v22 = *(void **)&self->_numberOfFrames;
            *(void *)&self->_numberOfFrames = v21;

            if (+[VCPMovieHighlightAnalyzer isHeuristicStickerScoreEnabled])
            {
              CMTimeValue v34 = value;
              CMTimeScale v35 = timescale;
              CMTimeFlags v36 = flags;
              CMTimeEpoch v37 = epoch;
              CMTimeValue v38 = v10;
              CMTimeScale v39 = v11;
              CMTimeFlags v40 = v12;
              CMTimeEpoch v41 = v13;
              [(VCPMovieHighlightAnalyzer *)self analyzeOverallQuality:&v34 isSettlingEffect:0 isAnimatedSticker:1];
            }
            else
            {
              [(VCPMovieHighlight *)v6 score];
            }
            objc_msgSend(*(id *)&self->_numberOfFrames, "setScore:");
            CMTimeValue v26 = value;
            float v23 = *(void **)&self->_numberOfFrames;
            CMTimeScale v27 = timescale;
            CMTimeFlags v28 = flags;
            CMTimeEpoch v29 = epoch;
            CMTimeValue v30 = v10;
            CMTimeScale v31 = v11;
            CMTimeFlags v32 = v12;
            CMTimeEpoch v33 = v13;
            [v23 setTimerange:&v26];
            MADPLLogAnimatedStickerScoring(v5);
          }
          long long v16 = v6;
          goto LABEL_46;
        }
      }
      else
      {
        BOOL v19 = 0;
      }
      if (v6) {
        [(VCPMovieHighlight *)v6 timerange];
      }
      else {
        memset(&v84, 0, sizeof(v84));
      }
      CMTime v50 = v84.duration;
      BOOL v20 = CMTimeGetSeconds(&v50) > 2.0;
      goto LABEL_40;
    }
  }
  long long v16 = 0;
LABEL_46:

LABEL_47:
  return v16;
}

- (id)animatedStickerGating
{
  return *(id *)&self->_numberOfFrames;
}

- (float)settlingMotionScore:(id *)a3
{
  uint64_t v4 = 0;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int imageGenerator = (int)self->_imageGenerator;
  if (imageGenerator <= 1) {
    int imageGenerator = 1;
  }
  float v6 = (float)imageGenerator;
  do
  {
    float v7 = *(float *)&-[VCPMovieHighlightAnalyzer settlingMotionScore:]::paramsWeights[v4]
       * (float)(self->_prevMotionParamDiff.__elems_[v4 + 4] / v6);
    if (v7 >= 20.0) {
      float v8 = 2.0;
    }
    else {
      float v8 = v7 * 0.1;
    }
    float v9 = expf(-(float)(v8 + (float)((float)((float)(self->_sumMotionParam.__elems_[v4 + 4] * 30.0) / v6) * 0.1)));
    *(float *)((char *)&v16 + v4 * 4) = (float)(v9 + v9) / (float)(v9 + 1.0);
    ++v4;
  }
  while (v4 != 6);
  float v10 = *(float *)&v16;
  long long v14 = v16;
  uint64_t v15 = v17;
  uint64_t v11 = 4;
  CMTimeFlags v12 = (float *)&v14;
  do
  {
    if (*(float *)((char *)&v14 + v11) < v10)
    {
      float v10 = *(float *)((char *)&v14 + v11);
      CMTimeFlags v12 = (float *)((char *)&v14 + v11);
    }
    v11 += 4;
  }
  while (v11 != 24);
  float result = 1.0;
  if (*v12 < 0.5) {
    return 0.0;
  }
  return result;
}

- (float)settlingSubjectScore:(id *)a3
{
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  memset(&v121, 0, sizeof(v121));
  CMTimeMake(&v121, 0, 600);
  long long v120 = 0u;
  long long v119 = 0u;
  long long v118 = 0u;
  long long v117 = 0u;
  obuint64_t j = self->_humanPoseResults;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v117 objects:v123 count:16];
  if (v4)
  {
    int v64 = 0;
    int v65 = 0;
    uint64_t v69 = *(void *)v118;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v118 != v69) {
          objc_enumerationMutation(obj);
        }
        float v6 = *(void **)(*((void *)&v117 + 1) + 8 * v5);
        float v7 = [v6 objectForKey:@"attributes"];
        float v8 = [v7 objectForKey:@"humanBounds"];
        CFDictionaryRef v9 = [v6 objectForKey:@"start"];
        CFDictionaryRef v10 = [v6 objectForKey:@"duration"];
        memset(&v116, 0, sizeof(v116));
        CMTimeMakeFromDictionary(&v116, v9);
        memset(&v115, 0, sizeof(v115));
        CMTimeMakeFromDictionary(&v115, v10);
        memset(&v114, 0, sizeof(v114));
        CMTime start = v116;
        CMTime duration = v115;
        CMTimeRangeMake(&v114, &start, &duration);
        NSRect v125 = NSRectFromString(v8);
        double width = v125.size.width;
        double height = v125.size.height;
        *(_OWORD *)&v125.origin.y = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&range.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&range.start.CMTimeEpoch epoch = *(_OWORD *)&v125.origin.y;
        *(_OWORD *)&range.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
        CMTime time = v116;
        if (!CMTimeRangeContainsTime(&range, &time))
        {

          goto LABEL_25;
        }
        long long v13 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&v108.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&v108.start.CMTimeEpoch epoch = v13;
        *(_OWORD *)&v108.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
        CMTimeRange otherRange = v114;
        CMTimeRangeGetIntersection(&v109, &v108, &otherRange);
        if ((v109.start.flags & 1) == 0) {
          goto LABEL_10;
        }
        long long v14 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&v105.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&v105.start.CMTimeEpoch epoch = v14;
        *(_OWORD *)&v105.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
        CMTimeRange v104 = v114;
        CMTimeRangeGetIntersection(&v106, &v105, &v104);
        if ((v106.duration.flags & 1) == 0) {
          goto LABEL_10;
        }
        long long v15 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&v102.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&v102.start.CMTimeEpoch epoch = v15;
        *(_OWORD *)&v102.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
        CMTimeRange v101 = v114;
        CMTimeRangeGetIntersection(&v103, &v102, &v101);
        if (v103.duration.epoch) {
          goto LABEL_10;
        }
        long long v17 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&v99.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&v99.start.CMTimeEpoch epoch = v17;
        *(_OWORD *)&v99.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
        CMTimeRange v98 = v114;
        CMTimeRangeGetIntersection(&v100, &v99, &v98);
        if (v100.duration.value < 0) {
          goto LABEL_10;
        }
        long long v18 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&v95.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&v95.start.CMTimeEpoch epoch = v18;
        *(_OWORD *)&v95.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
        CMTimeRange v94 = v114;
        CMTimeRangeGetIntersection(&v96, &v95, &v94);
        CMTime time1 = v96.duration;
        CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
        if (CMTimeCompare(&time1, &time2))
        {
LABEL_10:
          CMTime v121 = v116;
          v109.CMTime start = v116;
          v106.CMTime start = v116;
          if (CMTimeCompare(&v109.start, &v106.start) >= 1)
          {
            CMTime v121 = v116;
            int v16 = v64;
            if (v64 <= v65) {
              int v16 = v65;
            }
            int v64 = v16;
            int v65 = 0;
          }
          if (width * height > 0.0500000007) {
            ++v65;
          }
        }

        ++v5;
      }
      while (v4 != v5);
      uint64_t v19 = [(NSArray *)obj countByEnumeratingWithState:&v117 objects:v123 count:16];
      uint64_t v4 = v19;
    }
    while (v19);
  }
  else
  {
    int v64 = 0;
    int v65 = 0;
  }
LABEL_25:

  CMTimeMake(&v114.start, 0, 600);
  CMTime v121 = v114.start;
  memset(&v116, 0, sizeof(v116));
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  CMTimeScale v66 = self->_faceResults;
  uint64_t v20 = [(NSArray *)v66 countByEnumeratingWithState:&v89 objects:v122 count:16];
  if (v20)
  {
    uint64_t v70 = *(void *)v90;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v90 != v70) {
          objc_enumerationMutation(v66);
        }
        long long v22 = *(void **)(*((void *)&v89 + 1) + 8 * i);
        float v23 = [v22 objectForKey:@"attributes"];
        uint64_t v24 = [v23 objectForKey:@"faceBounds"];
        CFDictionaryRef v25 = [v22 objectForKey:@"start"];
        CFDictionaryRef v26 = [v22 objectForKey:@"duration"];
        memset(&v115, 0, sizeof(v115));
        CMTimeMakeFromDictionary(&v115, v25);
        memset(&v88, 0, sizeof(v88));
        CMTimeMakeFromDictionary(&v88, v26);
        memset(&v114, 0, sizeof(v114));
        CMTime v87 = v115;
        CMTime v86 = v88;
        CMTimeRangeMake(&v114, &v87, &v86);
        NSRect v126 = NSRectFromString(v24);
        double v27 = v126.size.width;
        double v28 = v126.size.height;
        *(_OWORD *)&v126.origin.y = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&v85.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&v85.start.CMTimeEpoch epoch = *(_OWORD *)&v126.origin.y;
        *(_OWORD *)&v85.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
        CMTimeRange v84 = v114;
        CMTimeRangeGetIntersection(&v109, &v85, &v84);
        if ((v109.start.flags & 1) == 0) {
          goto LABEL_35;
        }
        long long v29 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&v83.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&v83.start.CMTimeEpoch epoch = v29;
        *(_OWORD *)&v83.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
        CMTimeRange v82 = v114;
        CMTimeRangeGetIntersection(&v106, &v83, &v82);
        if ((v106.duration.flags & 1) == 0) {
          goto LABEL_35;
        }
        long long v30 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&v81.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&v81.start.CMTimeEpoch epoch = v30;
        *(_OWORD *)&v81.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
        CMTimeRange v80 = v114;
        CMTimeRangeGetIntersection(&v103, &v81, &v80);
        if (v103.duration.epoch) {
          goto LABEL_35;
        }
        long long v31 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&v79.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&v79.start.CMTimeEpoch epoch = v31;
        *(_OWORD *)&v79.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
        CMTimeRange v78 = v114;
        CMTimeRangeGetIntersection(&v100, &v79, &v78);
        if (v100.duration.value < 0) {
          goto LABEL_35;
        }
        long long v32 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&v76.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&v76.start.CMTimeEpoch epoch = v32;
        *(_OWORD *)&v76.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
        CMTimeRange v75 = v114;
        CMTimeRangeGetIntersection(&v96, &v76, &v75);
        CMTime v77 = v96.duration;
        CMTime v74 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
        if (CMTimeCompare(&v77, &v74))
        {
LABEL_35:
          if (v27 * v28 > 0.00749999983)
          {
            CMTime v73 = v115;
            double Seconds = CMTimeGetSeconds(&v73);
            CMTime v72 = v88;
            double v34 = CMTimeGetSeconds(&v72);
            CMTime v71 = v115;
            uint64_t v35 = (int)(Seconds + v34);
            uint64_t v36 = (int)CMTimeGetSeconds(&v71);
            uint64_t v37 = *(void *)&v116.timescale;
            if (*(void *)&v116.timescale >= v116.epoch)
            {
              CMTimeValue v39 = (*(void *)&v116.timescale - v116.value) >> 3;
              if ((unint64_t)(v39 + 1) >> 61) {
                std::vector<std::unique_ptr<VCPProtoKeypoint>>::__throw_length_error[abi:ne180100]();
              }
              unint64_t v40 = (v116.epoch - v116.value) >> 2;
              if (v40 <= v39 + 1) {
                unint64_t v40 = v39 + 1;
              }
              if (v116.epoch - v116.value >= 0x7FFFFFFFFFFFFFF8uLL) {
                unint64_t v41 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v41 = v40;
              }
              if (v41) {
                CMTimeValue v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<VCPProtoKeypoint>>>((uint64_t)&v116.epoch, v41);
              }
              else {
                CMTimeValue v42 = 0;
              }
              CMTimeScale v43 = &v42[8 * v39];
              *(void *)CMTimeScale v43 = v35 | (v36 << 32);
              CMTimeValue v38 = v43 + 8;
              CMTimeFlags v44 = *(char **)&v116.timescale;
              CMTimeValue value = v116.value;
              if (*(void *)&v116.timescale != v116.value)
              {
                do
                {
                  uint64_t v46 = *((void *)v44 - 1);
                  v44 -= 8;
                  *((void *)v43 - 1) = v46;
                  v43 -= 8;
                }
                while (v44 != (char *)value);
                CMTimeFlags v44 = (char *)v116.value;
              }
              v116.CMTimeValue value = (CMTimeValue)v43;
              *(void *)&v116.CMTimeScale timescale = v38;
              v116.CMTimeEpoch epoch = (CMTimeEpoch)&v42[8 * v41];
              if (v44) {
                operator delete(v44);
              }
            }
            else
            {
              **(void **)&v116.CMTimeScale timescale = v35 | (v36 << 32);
              CMTimeValue v38 = (void *)(v37 + 8);
            }
            *(void *)&v116.CMTimeScale timescale = v38;
          }
        }
      }
      uint64_t v20 = [(NSArray *)v66 countByEnumeratingWithState:&v89 objects:v122 count:16];
    }
    while (v20);
  }

  unint64_t v47 = 126 - 2 * __clz((*(void *)&v116.timescale - v116.value) >> 3);
  if (*(void *)&v116.timescale == v116.value) {
    uint64_t v48 = 0;
  }
  else {
    uint64_t v48 = v47;
  }
  std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::tuple<int,int> *,false>(v116.value, *(int **)&v116.timescale, (uint64_t)&v114, v48, 1);
  if (*(void *)&v116.timescale == v116.value)
  {
    int v50 = 0;
    if (v116.value)
    {
LABEL_74:
      *(void *)&v116.CMTimeScale timescale = v116.value;
      operator delete((void *)v116.value);
    }
  }
  else
  {
    uint64_t v49 = 0;
    int v50 = 0;
    unint64_t v51 = (*(void *)&v116.timescale - v116.value) >> 3;
    if (v51 <= 1) {
      CMTimeValue v52 = 1;
    }
    else {
      CMTimeValue v52 = (*(void *)&v116.timescale - v116.value) >> 3;
    }
    CMTimeValue v53 = v116.value + 12;
    uint64_t v54 = 1;
    do
    {
      uint64_t v55 = v49 + 1;
      if (v51 <= v49 + 1)
      {
        int v56 = 0;
      }
      else
      {
        int v56 = 0;
        int v57 = *(_DWORD *)(v116.value + 8 * v49);
        CMTimeValue v58 = (*(void *)&v116.timescale - v116.value) >> 3;
        CMTimeFlags v59 = (int *)v53;
        do
        {
          int v60 = *v59;
          v59 += 2;
          if (v60 < v57) {
            ++v56;
          }
          --v58;
        }
        while (v54 != v58);
      }
      if (v56 > v50) {
        int v50 = v56;
      }
      ++v54;
      v53 += 8;
      uint64_t v49 = v55;
    }
    while (v55 != v52);
    if (v116.value) {
      goto LABEL_74;
    }
  }
  int v61 = v64;
  if (v64 <= v65) {
    int v61 = v65;
  }
  BOOL v62 = v50 <= 2 && v61 <= 2;
  float result = 1.0;
  if (!v62) {
    return 0.0;
  }
  return result;
}

- (float)settlingExposureChangeScore:(id *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  memset(&v29, 0, sizeof(v29));
  long long v5 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.CMTimeEpoch epoch = v5;
  *(_OWORD *)&range.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v29, &range);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  float v6 = self->_cameraMotionResults;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v24 objects:v31 count:16];
  float v8 = 1.0;
  if (v7)
  {
    uint64_t v9 = *(void *)v25;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v25 != v9) {
        objc_enumerationMutation(v6);
      }
      CFDictionaryRef v11 = *(const __CFDictionary **)(*((void *)&v24 + 1) + 8 * v10);
      memset(&v23, 0, sizeof(v23));
      CMTimeRangeMakeFromDictionary(&v23, v11);
      *(_OWORD *)&time1.start.CMTimeValue value = *(_OWORD *)&v23.start.value;
      time1.start.CMTimeEpoch epoch = v23.start.epoch;
      CMTime time2 = v29;
      if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0) {
        break;
      }
      CMTimeRange v21 = v23;
      memset(&time1, 0, sizeof(time1));
      long long v12 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&otherRange.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&otherRange.start.CMTimeEpoch epoch = v12;
      *(_OWORD *)&otherRange.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetIntersection(&time1, &v21, &otherRange);
      if ((time1.start.flags & 1) == 0
        || (time1.duration.flags & 1) == 0
        || time1.duration.epoch
        || time1.duration.value < 0
        || (CMTime duration = time1.duration, v18 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48], CMTimeCompare(&duration, &v18)))
      {
        long long v13 = [(__CFDictionary *)v11 objectForKey:@"flags"];
        uint64_t v14 = [v13 integerValue];
        BOOL v15 = (v14 & 0x2FFC0) != 0 && (v14 & 0x1FFC0) == 98304;
        BOOL v16 = !v15;

        if (!v16)
        {
          float v8 = 0.0;
          break;
        }
      }
      if (v7 == ++v10)
      {
        uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v24 objects:v31 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v8;
}

- (float)settlingSharpnessScore:(id *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = self->_keyFrameResults;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v17;
    float v7 = 1.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v10 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&range.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&range.start.CMTimeEpoch epoch = v10;
        *(_OWORD *)&range.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
        if (v9) {
          [v9 timestamp];
        }
        else {
          memset(&time, 0, sizeof(time));
        }
        if (CMTimeRangeContainsTime(&range, &time))
        {
          [v9 sharpness];
          if (v11 < v7)
          {
            [v9 sharpness];
            float v7 = v12;
          }
        }
      }
      uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }
  else
  {
    float v7 = 1.0;
  }

  float result = 1.0;
  if (v7 < 0.2) {
    return 0.0;
  }
  return result;
}

- (int)analyzeRankingScores:(float)a3 subtleMotion:(float)a4 humanAction:(float)a5
{
  __asm { FMOV            V1.2S, #10.0 }
  float32x2_t v11 = vdiv_f32(*(float32x2_t *)&a3, _D1);
  __asm { FMOV            V3.2S, #1.0 }
  self->_animatedStickerGating = (VCPMovieHighlight *)vadd_f32((float32x2_t)vbic_s8(vbsl_s8((int8x8_t)vcge_f32(v11, _D3), (int8x8_t)_D3, (int8x8_t)v11), (int8x8_t)vclez_f32(v11)), (float32x2_t)self->_animatedStickerGating);
  int v13 = LODWORD(self->_sumScores[1]);
  if (v13 >= 7)
  {
    float v14 = 1.0;
    if (a5 < 1.0) {
      float v14 = a5;
    }
    if (a5 <= 0.0) {
      float v14 = 0.0;
    }
    self->_sumScores[0] = v14 + self->_sumScores[0];
  }
  LODWORD(self->_sumScores[1]) = v13 + 1;
  return 0;
}

- (int)analyzeMotionStability:()array<float motionParamDiff:(6UL> *)a3
{
  uint64_t v4 = 0;
  uint64_t v5 = &self->_sumMotionParam.__elems_[4];
  do
  {
    float v6 = a4->__elems_[v4];
    float v7 = &v5[v4];
    if ((float)(v6 * v5[v4 - 12]) < 0.0)
    {
      v5[v4] = v5[v4] + 1.0;
      float v6 = a4->__elems_[v4];
    }
    *(v7 - 12) = v6;
    *(v7 - 6) = *(v7 - 6) + fabsf(a3->__elems_[v4++]);
  }
  while (v4 != 6);
  ++LODWORD(self->_imageGenerator);
  return 0;
}

- (float)rankingLevel
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  float v2 = 0.0;
  if (SLODWORD(self->_sumScores[1]) >= 8)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v6 = 0;
    float v7 = NSNumber;
    do
    {
      *(float *)&double v5 = *(float *)((char *)&self->_animatedStickerGating + v6) / (float)SLODWORD(self->_sumScores[1]);
      float v8 = [v7 numberWithFloat:v5];
      [v4 addObject:v8];

      float v7 = NSNumber;
      v6 += 4;
    }
    while (v6 != 8);
    *(float *)&double v5 = self->_sumScores[0] / (float)(LODWORD(self->_sumScores[1]) - 7);
    uint64_t v9 = [NSNumber numberWithFloat:v5];
    [v4 addObject:v9];

    uint64_t v10 = 0;
    float v21 = 0.0;
    uint64_t v20 = 0;
    do
    {
      float32x2_t v11 = [v4 objectAtIndexedSubscript:v10];
      [v11 floatValue];
      float v13 = v12;

      float v14 = flt_1BC282EC0[v10];
      if (v13 < v14) {
        float v15 = 0.0;
      }
      else {
        float v15 = 1.0;
      }
      *((float *)&v20 + v10) = flt_1BC282ECC[v10] * (float)((float)(v13 - v14) * v15);
      ++v10;
    }
    while (v10 != 3);
    uint64_t v16 = 0;
    float v17 = *(float *)&v20;
    if (*(float *)&v20 < *((float *)&v20 + 1)) {
      float v17 = *((float *)&v20 + 1);
    }
    if (v17 < v21) {
      float v17 = v21;
    }
    float v2 = 0.0;
    do
    {
      if (v17 <= *(float *)&dword_1BC282ED8[v16]) {
        float v18 = 0.0;
      }
      else {
        float v18 = 1.0;
      }
      float v2 = v2 + (float)(v18 / 5.0);
      ++v16;
    }
    while (v16 != 5);
  }
  return v2;
}

- (id)settlingEffects
{
  if (LOBYTE(self->_maxHighlightScore) && [(NSArray *)self->_qualityResults count])
  {
    unint64_t v3 = objc_alloc_init(VCPMovieHighlight);
    memset(&v30, 0, sizeof(v30));
    CMTimeRangeMakeFromDictionary(&v30, (CFDictionaryRef)[(NSArray *)self->_qualityResults firstObject]);
    memset(&v29, 0, sizeof(v29));
    CMTimeMakeWithSeconds(&start, (float)(self->_minHighlightScore + -0.5), 600);
    CMTimeMakeWithSeconds(&end, self->_minHighlightScore, 600);
    CMTimeRangeFromTimeToTime(&v29, &start, &end);
    CMTime time = v29.duration;
    double Seconds = CMTimeGetSeconds(&time);
    CMTime duration = v29.duration;
    [(VCPMovieHighlight *)v3 setIsTrimmed:Seconds < CMTimeGetSeconds(&duration)];
    CMTimeRange v24 = v29;
    [(VCPMovieHighlightAnalyzer *)self analyzeOverallQuality:&v24 isSettlingEffect:1 isAnimatedSticker:0];
    -[VCPMovieHighlight setAutoplayScore:](v3, "setAutoplayScore:");
    CMTimeRange v23 = v29;
    [(VCPMovieHighlightAnalyzer *)self settlingMotionScore:&v23];
    -[VCPMovieHighlight setMotionScore:](v3, "setMotionScore:");
    CMTimeRange v22 = v29;
    [(VCPMovieHighlightAnalyzer *)self settlingSubjectScore:&v22];
    -[VCPMovieHighlight setSubjectScore:](v3, "setSubjectScore:");
    CMTimeRange v21 = v29;
    [(VCPMovieHighlightAnalyzer *)self settlingExposureChangeScore:&v21];
    -[VCPMovieHighlight setExposureChangeScore:](v3, "setExposureChangeScore:");
    CMTimeRange v20 = v29;
    [(VCPMovieHighlightAnalyzer *)self settlingSharpnessScore:&v20];
    -[VCPMovieHighlight setSharpnessScore:](v3, "setSharpnessScore:");
    if (*(&self->_isLivePhoto + 3)) {
      *(float *)&double v5 = 0.0;
    }
    else {
      *(float *)&double v5 = 1.0;
    }
    [(VCPMovieHighlight *)v3 setZoomChangeScore:v5];
    if (*(&self->_isLivePhoto + 1)) {
      *(float *)&double v6 = 0.0;
    }
    else {
      *(float *)&double v6 = 1.0;
    }
    [(VCPMovieHighlight *)v3 setFlashScore:v6];
    CMTimeRange v19 = v29;
    [(VCPMovieHighlight *)v3 setTimerange:&v19];
    [(VCPMovieHighlight *)v3 autoplayScore];
    float v8 = v7;
    [(VCPMovieHighlight *)v3 exposureChangeScore];
    float v10 = v9;
    [(VCPMovieHighlight *)v3 sharpnessScore];
    float v12 = v11;
    [(VCPMovieHighlight *)v3 zoomChangeScore];
    float v14 = v13;
    [(VCPMovieHighlight *)v3 flashScore];
    *(float *)&double v16 = (float)((float)((float)(v8 * v10) * v12) * v14) * v15;
    [(VCPMovieHighlight *)v3 setScore:v16];
    [(VCPMovieHighlight *)v3 score];
    [(VCPMovieHighlight *)v3 setIsSettlingOK:v17 > 0.8];
  }
  else
  {
    unint64_t v3 = 0;
  }
  return v3;
}

- (BOOL)updateCropHeatMap:(float *)a3 withResults:(id)a4 timeRange:(id *)a5 resultsKey:(id)a6
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  unint64_t v41 = (__CFString *)a6;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  obuint64_t j = v8;
  char v9 = 0;
  uint64_t v10 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v54;
    float v12 = 10.0;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v54 != v11) {
          objc_enumerationMutation(obj);
        }
        CFDictionaryRef v14 = *(const __CFDictionary **)(*((void *)&v53 + 1) + 8 * i);
        memset(&v52, 0, sizeof(v52));
        CMTimeRangeMakeFromDictionary(&v52, v14);
        CMTimeRange range = v52;
        memset(&v51, 0, sizeof(v51));
        long long v15 = *(_OWORD *)&a5->var0.var3;
        *(_OWORD *)&otherRange.start.CMTimeValue value = *(_OWORD *)&a5->var0.var0;
        *(_OWORD *)&otherRange.start.CMTimeEpoch epoch = v15;
        *(_OWORD *)&otherRange.duration.CMTimeScale timescale = *(_OWORD *)&a5->var1.var1;
        CMTimeRangeGetIntersection(&v51, &range, &otherRange);
        if ((v51.start.flags & 1) != 0
          && (v51.duration.flags & 1) != 0
          && !v51.duration.epoch
          && (v51.duration.value & 0x8000000000000000) == 0)
        {
          CMTime time1 = v51.duration;
          CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
          if (!CMTimeCompare(&time1, &time2)) {
            continue;
          }
        }
        CMTime time = v51.duration;
        if (CMTimeGetSeconds(&time) < 10.0)
        {
          double v16 = [(__CFDictionary *)v14 objectForKeyedSubscript:@"attributes"];
          float v17 = v16;
          if (@"FaceResults" == v41)
          {
            CMTimeRange v24 = [v16 objectForKeyedSubscript:@"faceBounds"];
            NSRect v60 = NSRectFromString(v24);
            r2.origin.x = v60.origin.x;
            CGFloat y = v60.origin.y;
            double width = v60.size.width;
            double height = v60.size.height;

            float v25 = 1.0;
            if (width * height > 0.0149999997) {
              float v25 = 4.0;
            }
            float v43 = v25;
          }
          else if (@"PetsResults" == v41)
          {
            long long v26 = [v16 objectForKeyedSubscript:@"petsBounds"];
            NSRect v61 = NSRectFromString(v26);
            r2.origin.x = v61.origin.x;
            CGFloat y = v61.origin.y;
            double width = v61.size.width;
            double height = v61.size.height;

            long long v27 = [v17 objectForKeyedSubscript:@"petsConfidence"];
            [v27 floatValue];
            float v43 = v28;
          }
          else
          {
            if (@"SaliencyResults" == v41)
            {
              CMTimeRange v29 = [v16 objectForKeyedSubscript:@"saliencyBounds"];
              NSRect v62 = NSRectFromString(v29);
              r2.origin.x = v62.origin.x;
              CGFloat y = v62.origin.y;
              double width = v62.size.width;
              double height = v62.size.height;

              [v17 objectForKeyedSubscript:@"saliencyConfidence"];
            }
            else
            {
              float v18 = [v16 objectForKeyedSubscript:@"humanBounds"];
              NSRect v59 = NSRectFromString(v18);
              r2.origin.x = v59.origin.x;
              CGFloat y = v59.origin.y;
              double width = v59.size.width;
              double height = v59.size.height;

              [v17 objectForKeyedSubscript:@"humanConfidence"];
            CMTimeRange v22 = };
            [v22 floatValue];
            float v43 = v23;
          }
          uint64_t v30 = 0;
          long long v31 = a3;
          do
          {
            uint64_t v32 = 0;
            double v33 = (float)((float)(int)v30 / v12);
            do
            {
              v63.origin.x = (float)((float)(int)v32 / v12);
              v63.origin.CGFloat y = v33;
              v63.size.double width = 0.1;
              v63.size.double height = 0.1;
              v65.origin.x = r2.origin.x;
              v65.origin.CGFloat y = y;
              v65.size.double width = width;
              v65.size.double height = height;
              CGRect v64 = CGRectIntersection(v63, v65);
              double v34 = v64.size.width;
              double v35 = v64.size.height;
              if (!CGRectIsNull(v64))
              {
                CMTime duration = v51.duration;
                double Seconds = CMTimeGetSeconds(&duration);
                *(_OWORD *)&r2.origin.CGFloat y = *(_OWORD *)&a5->var1.var0;
                *(void *)&r2.size.double height = a5->var1.var3;
                Float64 v37 = CMTimeGetSeconds((CMTime *)&r2.origin.y);
                float v38 = v34 * v35 * 10.0 * 10.0;
                *(float *)&Float64 v37 = Seconds / v37;
                v31[v32] = v31[v32] + (float)((float)(v38 * *(float *)&v37) * v43);
                float v12 = 10.0;
              }
              ++v32;
            }
            while (v32 != 10);
            ++v30;
            v31 += 10;
          }
          while (v30 != 10);

          char v9 = 1;
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
    }
    while (v10);
  }

  return v9 & 1;
}

- (CGRect)computeBestPlaybackCrop:(id *)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  BOOL v5 = self->_frameSize.width == *MEMORY[0x1E4F1DB30];
  memset(v67, 0, sizeof(v67));
  memset(v66, 0, sizeof(v66));
  memset(v65, 0, sizeof(v65));
  memset(v64, 0, sizeof(v64));
  if (v5 && self->_frameSize.height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    double v6 = 1.0;
    double v7 = 0.0;
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      id v8 = VCPLogInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_DEFAULT, "Invalid Frame Size for Playback crop", buf, 2u);
      }
    }
    double v9 = 0.0;
    double v10 = 1.0;
  }
  else
  {
    faceResults = self->_faceResults;
    long long v12 = *(_OWORD *)&a3->var0.var3;
    v62[0] = *(_OWORD *)&a3->var0.var0;
    v62[1] = v12;
    v62[2] = *(_OWORD *)&a3->var1.var1;
    unsigned int v13 = [(VCPMovieHighlightAnalyzer *)self updateCropHeatMap:v67 withResults:faceResults timeRange:v62 resultsKey:@"FaceResults"];
    petsResults = self->_petsResults;
    long long v15 = *(_OWORD *)&a3->var0.var3;
    v61[0] = *(_OWORD *)&a3->var0.var0;
    v61[1] = v15;
    v61[2] = *(_OWORD *)&a3->var1.var1;
    unsigned int v16 = [(VCPMovieHighlightAnalyzer *)self updateCropHeatMap:v66 withResults:petsResults timeRange:v61 resultsKey:@"PetsResults"];
    saliencyResults = self->_saliencyResults;
    long long v18 = *(_OWORD *)&a3->var0.var3;
    v60[0] = *(_OWORD *)&a3->var0.var0;
    v60[1] = v18;
    v60[2] = *(_OWORD *)&a3->var1.var1;
    unsigned int v19 = [(VCPMovieHighlightAnalyzer *)self updateCropHeatMap:v65 withResults:saliencyResults timeRange:v60 resultsKey:@"SaliencyResults"];
    humanPoseResults = self->_humanPoseResults;
    long long v21 = *(_OWORD *)&a3->var0.var3;
    v59[0] = *(_OWORD *)&a3->var0.var0;
    v59[1] = v21;
    v59[2] = *(_OWORD *)&a3->var1.var1;
    float v22 = (float)((float)((float)((float)v19 * 0.2) + (float)((float)v13 * 0.5))
                + (float)((float)[(VCPMovieHighlightAnalyzer *)self updateCropHeatMap:v64 withResults:humanPoseResults timeRange:v59 resultsKey:@"HumanPoseResults"]* 0.3))+ (float)((float)v16 * 0.25);
    float v23 = 5.5;
    if (v22 == 0.0)
    {
      float v35 = 5.5;
    }
    else
    {
      uint64_t v24 = 0;
      double v25 = 0.0;
      float v26 = 0.0;
      long long v27 = v64;
      float v28 = v65;
      CMTimeRange v29 = v66;
      uint64_t v30 = v67;
      double v31 = 0.0;
      do
      {
        for (uint64_t i = 0; i != 10; ++i)
        {
          float v33 = (float)((float)((float)((float)(*((float *)v29 + i) * 0.25) + (float)(*((float *)v30 + i) * 0.5))
                              + (float)(*((float *)v28 + i) * 0.2))
                      + (float)(*((float *)v27 + i) * 0.3))
              / v22;
          float v26 = v26 + v33;
          double v34 = v33;
          double v31 = v31 + v34 * ((double)(int)i + 0.5);
          double v25 = v25 + v34 * ((double)(int)v24 + 0.5);
        }
        ++v24;
        long long v27 = (_OWORD *)((char *)v27 + 40);
        float v28 = (_OWORD *)((char *)v28 + 40);
        CMTimeRange v29 = (_OWORD *)((char *)v29 + 40);
        uint64_t v30 = (_OWORD *)((char *)v30 + 40);
      }
      while (v24 != 10);
      float v35 = 5.5;
      if (v26 != 0.0)
      {
        float v23 = v31 / v26;
        float v35 = v25 / v26;
      }
    }
    double width = self->_frameSize.width;
    double height = self->_frameSize.height;
    float v38 = height / width;
    float v39 = v38 * 0.5;
    float v40 = 1.0 - (float)(v38 * 0.5);
    float v41 = v23 / 10.0;
    if (v41 < v40) {
      float v40 = v41;
    }
    if (v41 <= v39) {
      float v42 = v38 * 0.5;
    }
    else {
      float v42 = v40;
    }
    double v43 = (float)(v42 * 10.0) / 10.0 - v39;
    double v44 = v38;
    float v45 = width / height;
    float v46 = v45 * 0.5;
    float v47 = 1.0 - (float)(v45 * 0.5);
    float v48 = v35 / 10.0;
    if (v48 < v47) {
      float v47 = v48;
    }
    if (v48 <= v46) {
      float v49 = v45 * 0.5;
    }
    else {
      float v49 = v47;
    }
    double v50 = (float)(v49 * 10.0) / 10.0 - v46;
    double v51 = v45;
    BOOL v52 = width < height;
    if (width >= height) {
      double v50 = 0.0;
    }
    else {
      double v43 = 0.0;
    }
    if (width < height) {
      double v53 = 1.0;
    }
    else {
      double v53 = v44;
    }
    if (!v52) {
      double v51 = 1.0;
    }
    if (v43 < 1.0) {
      double v54 = v43;
    }
    else {
      double v54 = 1.0;
    }
    if (v43 <= 0.0) {
      double v7 = 0.0;
    }
    else {
      double v7 = v54;
    }
    if (v50 < 1.0) {
      double v9 = v50;
    }
    else {
      double v9 = 1.0;
    }
    if (v50 <= 0.0) {
      double v9 = 0.0;
    }
    double v55 = 1.0 - v7;
    if (v53 < 1.0 - v7) {
      double v55 = v53;
    }
    if (v53 <= 0.0) {
      double v6 = 0.0;
    }
    else {
      double v6 = v55;
    }
    double v56 = 1.0 - v9;
    if (v51 < 1.0 - v9) {
      double v56 = v51;
    }
    if (v51 <= 0.0) {
      double v10 = 0.0;
    }
    else {
      double v10 = v56;
    }
  }
  double v57 = v7;
  double v58 = v6;
  result.size.double height = v10;
  result.size.double width = v58;
  result.origin.CGFloat y = v9;
  result.origin.x = v57;
  return result;
}

- (id)results
{
  return self->_internalConstraintResults;
}

- (id)highlightScoreResults
{
  return self->_internalResults;
}

- (void)generateExpressionSegments:(id *)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [MEMORY[0x1E4F1CA48] array];
  double v6 = objc_alloc_init(VCPExpressionSegment);
  long long v7 = *(_OWORD *)&a3->var0.var3;
  v64[0] = *(_OWORD *)&a3->var0.var0;
  v64[1] = v7;
  v64[2] = *(_OWORD *)&a3->var1.var1;
  double v25 = v6;
  [(VCPExpressionSegment *)v6 setTimeRange:v64];
  [(VCPExpressionSegment *)v6 setScore:0.0];
  [(NSMutableArray *)self->_expressionSegments addObject:v6];
  long long v63 = 0u;
  long long v62 = 0u;
  long long v61 = 0u;
  long long v60 = 0u;
  obuint64_t j = self->_faceResults;
  uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v60 objects:v65 count:16];
  if (v8)
  {
    uint64_t v27 = *(void *)v61;
    double v9 = (CMTime *)MEMORY[0x1E4F1FA48];
    do
    {
      uint64_t v28 = v8;
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v61 != v27) {
          objc_enumerationMutation(obj);
        }
        CFDictionaryRef v11 = *(const __CFDictionary **)(*((void *)&v60 + 1) + 8 * i);
        memset(&v59, 0, sizeof(v59));
        CMTimeRangeMakeFromDictionary(&v59, v11);
        CMTimeRange v29 = [(__CFDictionary *)v11 objectForKey:@"attributes"];
        aString = [v29 objectForKey:@"faceBounds"];
        uint64_t v30 = [(__CFDictionary *)v11 objectForKey:@"flags"];
        LOBYTE(v11) = [v30 intValue];
        NSRect v67 = NSRectFromString(aString);
        *(float *)&v67.origin.x = v67.size.width * v67.size.height + -0.170000002;
        float v12 = expf((float)-(float)(*(float *)&v67.origin.x * *(float *)&v67.origin.x)/ -[VCPMovieHighlightAnalyzer computeExpressionScoreInTimerange:]::kAreaSigma[*(float *)&v67.origin.x > 0.0]);
        unint64_t v13 = 0;
        if ((v11 & 2) != 0) {
          float v14 = 0.3;
        }
        else {
          float v14 = 0.0;
        }
        float v15 = v14 + v12;
        if (v15 < 1.0) {
          float v16 = v15;
        }
        else {
          float v16 = 1.0;
        }
        if (v15 <= 0.0) {
          float v17 = 0.0;
        }
        else {
          float v17 = v16;
        }
        while (v13 < [(NSMutableArray *)self->_expressionSegments count])
        {
          long long v18 = [(NSMutableArray *)self->_expressionSegments objectAtIndexedSubscript:v13];
          unsigned int v19 = v18;
          memset(&v58, 0, sizeof(v58));
          CMTimeRange range = v59;
          if (v18) {
            [v18 timeRange];
          }
          else {
            memset(&otherRange, 0, sizeof(otherRange));
          }
          CMTimeRangeGetIntersection(&v58, &range, &otherRange);
          if ((v58.start.flags & 1) == 0
            || (v58.duration.flags & 1) == 0
            || v58.duration.epoch
            || v58.duration.value < 0
            || (CMTime time1 = v58.duration, time2 = *v9, CMTimeCompare(&time1, &time2)))
          {
            CMTimeRange v20 = objc_alloc_init(VCPExpressionSegment);
            if (v19)
            {
              [v19 timeRange];
            }
            else
            {
              long long v50 = 0u;
              long long v51 = 0u;
              long long v49 = 0u;
            }
            *(_OWORD *)&start.CMTimeValue value = v49;
            start.CMTimeEpoch epoch = v50;
            CMTime end = v58.start;
            CMTimeRangeFromTimeToTime(&v53, &start, &end);
            CMTimeRange v47 = v53;
            [(VCPExpressionSegment *)v20 setTimeRange:&v47];
            [v19 score];
            -[VCPExpressionSegment setScore:](v20, "setScore:");
            long long v21 = objc_alloc_init(VCPExpressionSegment);
            CMTimeRange v44 = v58;
            CMTimeRangeGetEnd(&v45, &v44);
            if (v19) {
              [v19 timeRange];
            }
            else {
              memset(&v42, 0, sizeof(v42));
            }
            CMTimeRangeGetEnd(&v43, &v42);
            CMTimeRangeFromTimeToTime(&v46, &v45, &v43);
            CMTimeRange v41 = v46;
            [(VCPExpressionSegment *)v21 setTimeRange:&v41];
            [v19 score];
            -[VCPExpressionSegment setScore:](v21, "setScore:");
            CMTimeRange v40 = v58;
            [v19 setTimeRange:&v40];
            [v19 score];
            if (v17 >= *(float *)&v22) {
              *(float *)&double v22 = v17;
            }
            [v19 setScore:v22];
            if (!v20
              || ([(VCPExpressionSegment *)v20 timeRange], (BYTE12(v49) & 1) == 0)
              || ([(VCPExpressionSegment *)v20 timeRange], (v39 & 1) == 0)
              || ([(VCPExpressionSegment *)v20 timeRange], v38)
              || ([(VCPExpressionSegment *)v20 timeRange], v37 < 0)
              || ([(VCPExpressionSegment *)v20 timeRange], v36 = v35, CMTime v34 = *v9, CMTimeCompare(&v36, &v34)))
            {
              [v5 addObject:v20];
            }
            [v5 addObject:v19];
            if (!v21
              || ([(VCPExpressionSegment *)v21 timeRange], (BYTE12(v49) & 1) == 0)
              || ([(VCPExpressionSegment *)v21 timeRange], (v39 & 1) == 0)
              || ([(VCPExpressionSegment *)v21 timeRange], v38)
              || ([(VCPExpressionSegment *)v21 timeRange], v37 < 0)
              || ([(VCPExpressionSegment *)v21 timeRange], CMTime v33 = v35, v32 = *v9, CMTimeCompare(&v33, &v32)))
            {
              [v5 addObject:v21];
            }
          }
          else
          {
            [v5 addObject:v19];
          }

          ++v13;
        }
        float v23 = (NSMutableArray *)[v5 mutableCopy];
        expressionSegments = self->_expressionSegments;
        self->_expressionSegments = v23;

        [v5 removeAllObjects];
      }
      uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v60 objects:v65 count:16];
    }
    while (v8);
  }
}

- ($D854FC4CDD8DDEA9B2859E823A7C8A75)computeQualityTrimFor:(SEL)a3 withKeyFrame:(id *)a4
{
  BOOL v45 = a5;
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  long long v8 = *(_OWORD *)&a4->var0.var3;
  long long v79 = *(_OWORD *)&a4->var0.var0;
  long long v9 = *(_OWORD *)&a4->var1.var1;
  *(_OWORD *)&range.start.CMTimeValue value = *(_OWORD *)&a4->var0.var0;
  *(_OWORD *)&range.start.CMTimeEpoch epoch = v8;
  CMTimeEpoch var3 = a4->var0.var3;
  memset(&v78, 0, sizeof(v78));
  *(_OWORD *)&range.duration.CMTimeScale timescale = v9;
  CMTimeRangeGetEnd(&v78, &range);
  double v10 = (CMTime *)MEMORY[0x1E4F1FA48];
  CMTime v76 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  CMTime v75 = v76;
  if ([(NSArray *)self->_qualityResults count])
  {
    uint64_t v11 = 0;
    while (1)
    {
      CFDictionaryRef v12 = [(NSArray *)self->_qualityResults objectAtIndexedSubscript:v11];
      memset(&v74, 0, sizeof(v74));
      CMTimeRangeMakeFromDictionary(&v74, v12);
      *(_OWORD *)&time1.start.CMTimeValue value = *(_OWORD *)&v74.start.value;
      time1.start.CMTimeEpoch epoch = v74.start.epoch;
      time2.CMTime start = v78;
      if ((CMTimeCompare(&time1.start, &time2.start) & 0x80000000) == 0) {
        break;
      }
      CMTimeRange v72 = v74;
      memset(&time1, 0, sizeof(time1));
      long long v13 = *(_OWORD *)&a4->var0.var3;
      *(_OWORD *)&otherRange.start.CMTimeValue value = *(_OWORD *)&a4->var0.var0;
      *(_OWORD *)&otherRange.start.CMTimeEpoch epoch = v13;
      *(_OWORD *)&otherRange.duration.CMTimeScale timescale = *(_OWORD *)&a4->var1.var1;
      CMTimeRangeGetIntersection(&time1, &v72, &otherRange);
      if ((time1.start.flags & 1) == 0
        || (time1.duration.flags & 1) == 0
        || time1.duration.epoch
        || time1.duration.value < 0
        || (CMTime duration = time1.duration, v69 = *v10, CMTimeCompare(&duration, &v69)))
      {
        float v14 = [(__CFDictionary *)v12 objectForKeyedSubscript:@"quality"];
        [v14 floatValue];
        BOOL v16 = v15 < 0.3;

        if (!v16)
        {
          CMTime v76 = time1.start;
          break;
        }
      }

      if (++v11 >= [(NSArray *)self->_qualityResults count]) {
        goto LABEL_14;
      }
    }
  }
LABEL_14:
  uint64_t v17 = [(NSArray *)self->_qualityResults count];
  if (v17 - 1 >= 0)
  {
    while (1)
    {
      CFDictionaryRef v18 = [(NSArray *)self->_qualityResults objectAtIndexedSubscript:--v17];
      memset(&v74, 0, sizeof(v74));
      CMTimeRangeMakeFromDictionary(&v74, v18);
      CMTimeRange v68 = v74;
      CMTimeRangeGetEnd(&v82, &v68);
      time1.CMTime start = v82;
      *(_OWORD *)&time2.start.CMTimeValue value = v79;
      time2.start.CMTimeEpoch epoch = var3;
      if (CMTimeCompare(&time1.start, &time2.start) < 0) {
        break;
      }
      memset(&time1, 0, sizeof(time1));
      CMTimeRange v67 = v74;
      long long v19 = *(_OWORD *)&a4->var0.var3;
      *(_OWORD *)&v66.start.CMTimeValue value = *(_OWORD *)&a4->var0.var0;
      *(_OWORD *)&v66.start.CMTimeEpoch epoch = v19;
      *(_OWORD *)&v66.duration.CMTimeScale timescale = *(_OWORD *)&a4->var1.var1;
      CMTimeRangeGetIntersection(&time1, &v67, &v66);
      if ((time1.start.flags & 1) == 0
        || (time1.duration.flags & 1) == 0
        || time1.duration.epoch
        || time1.duration.value < 0
        || (v65 = time1.duration, CMTime v64 = *v10, CMTimeCompare(&v65, &v64)))
      {
        CMTimeRange v20 = [(__CFDictionary *)v18 objectForKeyedSubscript:@"quality"];
        [v20 floatValue];
        BOOL v22 = v21 < 0.3;

        if (!v22)
        {
          CMTimeRange v63 = time1;
          CMTimeRangeGetEnd(&time2.start, &v63);
          CMTime v75 = time2.start;
          break;
        }
      }

      if (v17 <= 0) {
        goto LABEL_26;
      }
    }
  }
LABEL_26:
  *(_OWORD *)&retstr->var0.CMTimeEpoch var3 = 0u;
  *(_OWORD *)&retstr->var1.CMTime var1 = 0u;
  *(_OWORD *)&retstr->var0.CMTime var0 = 0u;
  CMTime start = v76;
  CMTime end = v75;
  CGRect result = ($D854FC4CDD8DDEA9B2859E823A7C8A75 *)CMTimeRangeFromTimeToTime((CMTimeRange *)retstr, &start, &end);
  if (v45)
  {
    if ([(NSArray *)self->_keyFrameResults count])
    {
      uint64_t v24 = 0;
      while (1)
      {
        double v25 = [(NSArray *)self->_keyFrameResults objectAtIndexedSubscript:v24];
        [v25 sharpness];
        if (v26 >= 0.2) {
          break;
        }

        if (++v24 >= [(NSArray *)self->_keyFrameResults count]) {
          goto LABEL_36;
        }
      }
      if (v25) {
        [v25 timestamp];
      }
      else {
        memset(&v74, 0, 24);
      }
      CMTime v76 = v74.start;
    }
LABEL_36:
    uint64_t v27 = [(NSArray *)self->_keyFrameResults count];
    if (v27 - 1 >= 0)
    {
      while (1)
      {
        uint64_t v28 = [(NSArray *)self->_keyFrameResults objectAtIndexedSubscript:--v27];
        [v28 sharpness];
        if (v29 >= 0.2) {
          break;
        }

        if (v27 <= 0) {
          goto LABEL_46;
        }
      }
      if (v27 < [(NSArray *)self->_keyFrameResults count] - 1)
      {
        if (v28) {
          [v28 timestamp];
        }
        else {
          memset(&v74, 0, 24);
        }
        CMTime v75 = v74.start;
      }
    }
LABEL_46:
    memset(&v74, 0, sizeof(v74));
    CMTime v60 = v76;
    CMTime v59 = v75;
    CMTimeRangeFromTimeToTime(&v74, &v60, &v59);
    long long v30 = *(_OWORD *)&retstr->var0.var3;
    *(_OWORD *)&v58.start.CMTimeValue value = *(_OWORD *)&retstr->var0.var0;
    *(_OWORD *)&v58.start.CMTimeEpoch epoch = v30;
    *(_OWORD *)&v58.duration.CMTimeScale timescale = *(_OWORD *)&retstr->var1.var1;
    CMTimeRange v57 = v74;
    CGRect result = ($D854FC4CDD8DDEA9B2859E823A7C8A75 *)CMTimeRangeGetIntersection(&time1, &v58, &v57);
    long long v31 = *(_OWORD *)&time1.start.epoch;
    *(_OWORD *)&retstr->var0.CMTime var0 = *(_OWORD *)&time1.start.value;
    *(_OWORD *)&retstr->var0.CMTimeEpoch var3 = v31;
    *(_OWORD *)&retstr->var1.CMTime var1 = *(_OWORD *)&time1.duration.timescale;
  }
  orientationResults = self->_orientationResults;
  if (orientationResults)
  {
    long long v33 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
    *(_OWORD *)&v74.start.CMTimeValue value = *MEMORY[0x1E4F1FA30];
    *(_OWORD *)&v74.start.CMTimeEpoch epoch = v33;
    *(_OWORD *)&v74.duration.CMTimeScale timescale = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 32);
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    CMTime v34 = orientationResults;
    uint64_t v35 = [(NSArray *)v34 countByEnumeratingWithState:&v53 objects:v83 count:16];
    if (v35)
    {
      uint64_t v36 = *(void *)v54;
      while (2)
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v54 != v36) {
            objc_enumerationMutation(v34);
          }
          CFDictionaryRef v38 = *(const __CFDictionary **)(*((void *)&v53 + 1) + 8 * i);
          memset(&time1, 0, sizeof(time1));
          CMTimeRangeMakeFromDictionary(&time1, v38);
          CMTimeRange v52 = time1;
          long long v39 = *(_OWORD *)&retstr->var0.var3;
          *(_OWORD *)&v51.start.CMTimeValue value = *(_OWORD *)&retstr->var0.var0;
          *(_OWORD *)&v51.start.CMTimeEpoch epoch = v39;
          *(_OWORD *)&v51.duration.CMTimeScale timescale = *(_OWORD *)&retstr->var1.var1;
          if (CMTimeRangeContainsTimeRange(&v52, &v51))
          {

            return result;
          }
          CMTimeRange v49 = time1;
          memset(&time2, 0, sizeof(time2));
          long long v40 = *(_OWORD *)&retstr->var0.var3;
          *(_OWORD *)&v48.start.CMTimeValue value = *(_OWORD *)&retstr->var0.var0;
          *(_OWORD *)&v48.start.CMTimeEpoch epoch = v40;
          *(_OWORD *)&v48.duration.CMTimeScale timescale = *(_OWORD *)&retstr->var1.var1;
          CMTimeRangeGetIntersection(&time2, &v49, &v48);
          if ((time2.start.flags & 1) != 0
            && (time2.duration.flags & 1) != 0
            && !time2.duration.epoch
            && (time2.duration.value & 0x8000000000000000) == 0)
          {
            CMTime v47 = time2.duration;
            CMTime v46 = *v10;
            if (!CMTimeCompare(&v47, &v46)) {
              continue;
            }
          }
          CMTime v82 = time2.duration;
          CMTime v81 = v74.duration;
          if (CMTimeCompare(&v82, &v81) <= 0) {
            p_CMTimeRange time2 = &v74;
          }
          else {
            p_CMTimeRange time2 = &time2;
          }
          long long v42 = *(_OWORD *)&p_time2->start.value;
          long long v43 = *(_OWORD *)&p_time2->start.epoch;
          *(_OWORD *)&v74.duration.CMTimeScale timescale = *(_OWORD *)&p_time2->duration.timescale;
          *(_OWORD *)&v74.start.CMTimeEpoch epoch = v43;
          *(_OWORD *)&v74.start.CMTimeValue value = v42;
        }
        uint64_t v35 = [(NSArray *)v34 countByEnumeratingWithState:&v53 objects:v83 count:16];
        if (v35) {
          continue;
        }
        break;
      }
    }

    long long v44 = *(_OWORD *)&v74.start.epoch;
    *(_OWORD *)&retstr->var0.CMTime var0 = *(_OWORD *)&v74.start.value;
    *(_OWORD *)&retstr->var0.CMTimeEpoch var3 = v44;
    *(_OWORD *)&retstr->var1.CMTime var1 = *(_OWORD *)&v74.duration.timescale;
  }
  return result;
}

- ($D854FC4CDD8DDEA9B2859E823A7C8A75)computeActionFaceTrimFor:(SEL)a3
{
  uint64_t v4 = (id *)MEMORY[0x1F4188790](retstr, self, a3, a4);
  CMTime v87 = v5;
  CMTime v78 = v6;
  uint64_t v194 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)&v185.CMTimeValue value = *MEMORY[0x1E4F1F9F8];
  CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  v185.CMTimeEpoch epoch = epoch;
  CMTimeValue value = *MEMORY[0x1E4F1F9F8];
  CMTimeFlags flags = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 12);
  CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
  long long v181 = 0u;
  long long v182 = 0u;
  long long v183 = 0u;
  long long v184 = 0u;
  CMTime v81 = v4;
  obuint64_t j = v4[3];
  uint64_t v7 = [obj countByEnumeratingWithState:&v181 objects:v191 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v182;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v182 != v8) {
          objc_enumerationMutation(obj);
        }
        CFDictionaryRef v10 = *(const __CFDictionary **)(*((void *)&v181 + 1) + 8 * i);
        memset(&v180, 0, sizeof(v180));
        CMTimeRangeMakeFromDictionary(&v180, v10);
        CMTimeRange range = v180;
        long long v11 = *(_OWORD *)&v87->epoch;
        *(_OWORD *)&otherRange.start.CMTimeValue value = *(_OWORD *)&v87->value;
        memset(&v179, 0, sizeof(v179));
        *(_OWORD *)&otherRange.start.CMTimeEpoch epoch = v11;
        *(_OWORD *)&otherRange.duration.CMTimeScale timescale = *(_OWORD *)&v87[1].timescale;
        CMTimeRangeGetIntersection(&v179, &range, &otherRange);
        if ((v179.start.flags & 1) != 0
          && (v179.duration.flags & 1) != 0
          && !v179.duration.epoch
          && (v179.duration.value & 0x8000000000000000) == 0)
        {
          CMTime time1 = v179.duration;
          CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
          if (!CMTimeCompare(&time1, &time2)) {
            continue;
          }
        }
        CFDictionaryRef v12 = [(__CFDictionary *)v10 objectForKey:@"attributes", v78];
        long long v13 = [v12 objectForKey:@"faceBounds"];
        NSRect v195 = NSRectFromString(v13);
        double width = v195.size.width;
        double height = v195.size.height;
        BOOL v16 = [(__CFDictionary *)v10 objectForKey:@"flags", v195.origin.x, v195.origin.y];
        if (([v16 intValue] & 2) != 0 || (float v17 = width * height, v17 >= 0.02) && v17 <= 0.6)
        {
          if ((v185.flags & 1) == 0
            || (CMTime time = v185, Seconds = CMTimeGetSeconds(&time), v173 = v179.start, Seconds > CMTimeGetSeconds(&v173)))
          {
            CMTime v185 = v179.start;
          }
          if ((flags & 1) == 0
            || (v172.CMTimeValue value = value,
                v172.CMTimeScale timescale = timescale,
                v172.CMTimeFlags flags = flags,
                v172.CMTimeEpoch epoch = epoch,
                double v19 = CMTimeGetSeconds(&v172),
                CMTimeRange v170 = v179,
                CMTimeRangeGetEnd(&v171, &v170),
                v19 < CMTimeGetSeconds(&v171)))
          {
            CMTimeRange v169 = v179;
            CMTimeRangeGetEnd(&v129.start, &v169);
            CMTimeValue value = v129.start.value;
            CMTimeFlags flags = v129.start.flags;
            CMTimeScale timescale = v129.start.timescale;
            CMTimeEpoch epoch = v129.start.epoch;
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v181 objects:v191 count:16];
    }
    while (v7);
  }

  long long v168 = 0u;
  long long v167 = 0u;
  long long v166 = 0u;
  long long v165 = 0u;
  id obja = v81[6];
  uint64_t v20 = [obja countByEnumeratingWithState:&v165 objects:v190 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v166;
LABEL_25:
    uint64_t v22 = 0;
    while (1)
    {
      if (*(void *)v166 != v21) {
        objc_enumerationMutation(obja);
      }
      CFDictionaryRef v23 = *(const __CFDictionary **)(*((void *)&v165 + 1) + 8 * v22);
      memset(&v180, 0, sizeof(v180));
      CMTimeRangeMakeFromDictionary(&v180, v23);
      long long v24 = *(_OWORD *)&v87->epoch;
      *(_OWORD *)&v164.start.CMTimeValue value = *(_OWORD *)&v87->value;
      *(_OWORD *)&v164.start.CMTimeEpoch epoch = v24;
      *(_OWORD *)&v164.duration.CMTimeScale timescale = *(_OWORD *)&v87[1].timescale;
      CMTimeRangeGetEnd(&v124.start, &v164);
      *(_OWORD *)&v179.start.CMTimeValue value = *(_OWORD *)&v180.start.value;
      v179.start.CMTimeEpoch epoch = v180.start.epoch;
      *(_OWORD *)&v129.start.CMTimeValue value = *(_OWORD *)&v124.start.value;
      v129.start.CMTimeEpoch epoch = v124.start.epoch;
      if ((CMTimeCompare(&v179.start, &v129.start) & 0x80000000) == 0) {
        break;
      }
      CMTimeRange v163 = v180;
      long long v25 = *(_OWORD *)&v87->epoch;
      *(_OWORD *)&v162.start.CMTimeValue value = *(_OWORD *)&v87->value;
      memset(&v179, 0, sizeof(v179));
      *(_OWORD *)&v162.start.CMTimeEpoch epoch = v25;
      *(_OWORD *)&v162.duration.CMTimeScale timescale = *(_OWORD *)&v87[1].timescale;
      CMTimeRangeGetIntersection(&v179, &v163, &v162);
      if ((v179.start.flags & 1) == 0
        || (v179.duration.flags & 1) == 0
        || v179.duration.epoch
        || v179.duration.value < 0
        || (CMTime duration = v179.duration, v160 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48], CMTimeCompare(&duration, &v160)))
      {
        float v26 = [(__CFDictionary *)v23 objectForKey:@"quality", v78];
        [v26 floatValue];
        float v28 = v27;

        if (v28 >= 0.3)
        {
          if ((v185.flags & 1) == 0
            || (CMTime v159 = v185, v29 = CMTimeGetSeconds(&v159), v158 = v179.start, v29 > CMTimeGetSeconds(&v158)))
          {
            CMTime v185 = v179.start;
          }
          if ((flags & 1) == 0
            || (v157.CMTimeValue value = value,
                v157.CMTimeScale timescale = timescale,
                v157.CMTimeFlags flags = flags,
                v157.CMTimeEpoch epoch = epoch,
                double v30 = CMTimeGetSeconds(&v157),
                CMTimeRange v155 = v179,
                CMTimeRangeGetEnd(&v156, &v155),
                v30 < CMTimeGetSeconds(&v156)))
          {
            CMTimeRange v154 = v179;
            CMTimeRangeGetEnd(&v129.start, &v154);
            CMTimeValue value = v129.start.value;
            CMTimeFlags flags = v129.start.flags;
            CMTimeScale timescale = v129.start.timescale;
            CMTimeEpoch epoch = v129.start.epoch;
          }
        }
      }
      if (v20 == ++v22)
      {
        uint64_t v20 = [obja countByEnumeratingWithState:&v165 objects:v190 count:16];
        if (v20) {
          goto LABEL_25;
        }
        break;
      }
    }
  }

  long long v153 = 0u;
  long long v152 = 0u;
  long long v151 = 0u;
  long long v150 = 0u;
  id objb = v81[10];
  uint64_t v31 = [objb countByEnumeratingWithState:&v150 objects:v189 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v151;
LABEL_45:
    uint64_t v33 = 0;
    while (1)
    {
      if (*(void *)v151 != v32) {
        objc_enumerationMutation(objb);
      }
      CFDictionaryRef v34 = *(const __CFDictionary **)(*((void *)&v150 + 1) + 8 * v33);
      memset(&v180, 0, sizeof(v180));
      CMTimeRangeMakeFromDictionary(&v180, v34);
      long long v35 = *(_OWORD *)&v87->epoch;
      *(_OWORD *)&v149.start.CMTimeValue value = *(_OWORD *)&v87->value;
      *(_OWORD *)&v149.start.CMTimeEpoch epoch = v35;
      *(_OWORD *)&v149.duration.CMTimeScale timescale = *(_OWORD *)&v87[1].timescale;
      CMTimeRangeGetEnd(&v124.start, &v149);
      *(_OWORD *)&v179.start.CMTimeValue value = *(_OWORD *)&v180.start.value;
      v179.start.CMTimeEpoch epoch = v180.start.epoch;
      *(_OWORD *)&v129.start.CMTimeValue value = *(_OWORD *)&v124.start.value;
      v129.start.CMTimeEpoch epoch = v124.start.epoch;
      if ((CMTimeCompare(&v179.start, &v129.start) & 0x80000000) == 0) {
        break;
      }
      CMTimeRange v148 = v180;
      long long v36 = *(_OWORD *)&v87->epoch;
      *(_OWORD *)&v147.start.CMTimeValue value = *(_OWORD *)&v87->value;
      memset(&v179, 0, sizeof(v179));
      *(_OWORD *)&v147.start.CMTimeEpoch epoch = v36;
      *(_OWORD *)&v147.duration.CMTimeScale timescale = *(_OWORD *)&v87[1].timescale;
      CMTimeRangeGetIntersection(&v179, &v148, &v147);
      if ((v179.start.flags & 1) == 0
        || (v179.duration.flags & 1) == 0
        || v179.duration.epoch
        || v179.duration.value < 0
        || (CMTime v146 = v179.duration, v145 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48], CMTimeCompare(&v146, &v145)))
      {
        uint64_t v37 = [(__CFDictionary *)v34 objectForKeyedSubscript:@"attributes", v78];
        CFDictionaryRef v38 = [v37 objectForKeyedSubscript:@"absoluteScore"];
        [v38 floatValue];
        float v40 = v39;

        if (v40 >= 0.2)
        {
          if ((v185.flags & 1) == 0
            || (v144 = v185, double v41 = CMTimeGetSeconds(&v144), v143 = v179.start, v41 > CMTimeGetSeconds(&v143)))
          {
            CMTime v185 = v179.start;
          }
          if ((flags & 1) == 0
            || (v142.CMTimeValue value = value,
                v142.CMTimeScale timescale = timescale,
                v142.CMTimeFlags flags = flags,
                v142.CMTimeEpoch epoch = epoch,
                double v42 = CMTimeGetSeconds(&v142),
                CMTimeRange v140 = v179,
                CMTimeRangeGetEnd(&v141, &v140),
                v42 < CMTimeGetSeconds(&v141)))
          {
            CMTimeRange v139 = v179;
            CMTimeRangeGetEnd(&v129.start, &v139);
            CMTimeValue value = v129.start.value;
            CMTimeFlags flags = v129.start.flags;
            CMTimeScale timescale = v129.start.timescale;
            CMTimeEpoch epoch = v129.start.epoch;
          }
        }
      }
      if (v31 == ++v33)
      {
        uint64_t v31 = [objb countByEnumeratingWithState:&v150 objects:v189 count:16];
        if (v31) {
          goto LABEL_45;
        }
        break;
      }
    }
  }

  long long v138 = 0u;
  long long v137 = 0u;
  long long v136 = 0u;
  long long v135 = 0u;
  id objc = v81[7];
  uint64_t v43 = [objc countByEnumeratingWithState:&v135 objects:v188 count:16];
  if (v43)
  {
    uint64_t v80 = *(void *)v136;
LABEL_65:
    uint64_t v79 = v43;
    uint64_t v44 = 0;
    while (1)
    {
      if (*(void *)v136 != v80) {
        objc_enumerationMutation(objc);
      }
      CFDictionaryRef v45 = *(const __CFDictionary **)(*((void *)&v135 + 1) + 8 * v44);
      memset(&v180, 0, sizeof(v180));
      CMTimeRangeMakeFromDictionary(&v180, v45);
      long long v46 = *(_OWORD *)&v87->epoch;
      *(_OWORD *)&v134.start.CMTimeValue value = *(_OWORD *)&v87->value;
      *(_OWORD *)&v134.start.CMTimeEpoch epoch = v46;
      *(_OWORD *)&v134.duration.CMTimeScale timescale = *(_OWORD *)&v87[1].timescale;
      CMTimeRangeGetEnd(&v124.start, &v134);
      *(_OWORD *)&v179.start.CMTimeValue value = *(_OWORD *)&v180.start.value;
      v179.start.CMTimeEpoch epoch = v180.start.epoch;
      *(_OWORD *)&v129.start.CMTimeValue value = *(_OWORD *)&v124.start.value;
      v129.start.CMTimeEpoch epoch = v124.start.epoch;
      if ((CMTimeCompare(&v179.start, &v129.start) & 0x80000000) == 0) {
        break;
      }
      CMTimeRange v133 = v180;
      long long v47 = *(_OWORD *)&v87->epoch;
      *(_OWORD *)&v132.start.CMTimeValue value = *(_OWORD *)&v87->value;
      memset(&v179, 0, sizeof(v179));
      *(_OWORD *)&v132.start.CMTimeEpoch epoch = v47;
      *(_OWORD *)&v132.duration.CMTimeScale timescale = *(_OWORD *)&v87[1].timescale;
      CMTimeRangeGetIntersection(&v179, &v133, &v132);
      if ((v179.start.flags & 1) == 0
        || (v179.duration.flags & 1) == 0
        || v179.duration.epoch
        || v179.duration.value < 0
        || (v131 = v179.duration, CMTime v130 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48], CMTimeCompare(&v131, &v130)))
      {
        CMTimeRange v48 = [(__CFDictionary *)v45 objectForKey:@"quality", v78];
        [v48 floatValue];
        float v50 = v49;

        if (v50 >= 0.3)
        {
          long long v51 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
          *(_OWORD *)&v129.start.CMTimeValue value = *MEMORY[0x1E4F1FA20];
          *(_OWORD *)&v129.start.CMTimeEpoch epoch = v51;
          *(_OWORD *)&v129.duration.CMTimeScale timescale = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
          long long v125 = 0u;
          long long v126 = 0u;
          long long v127 = 0u;
          long long v128 = 0u;
          id v52 = v81[2];
          uint64_t v53 = [v52 countByEnumeratingWithState:&v125 objects:v187 count:16];
          if (v53)
          {
            uint64_t v54 = *(void *)v126;
LABEL_77:
            uint64_t v55 = 0;
            while (1)
            {
              if (*(void *)v126 != v54) {
                objc_enumerationMutation(v52);
              }
              CFDictionaryRef v56 = *(const __CFDictionary **)(*((void *)&v125 + 1) + 8 * v55);
              memset(&v124, 0, sizeof(v124));
              CMTimeRangeMakeFromDictionary(&v124, v56);
              CMTimeRange v123 = v179;
              CMTimeRangeGetEnd(&v104.start, &v123);
              *(_OWORD *)&v122.start.CMTimeValue value = *(_OWORD *)&v124.start.value;
              v122.start.CMTimeEpoch epoch = v124.start.epoch;
              *(_OWORD *)&v117.start.CMTimeValue value = *(_OWORD *)&v104.start.value;
              v117.start.CMTimeEpoch epoch = v104.start.epoch;
              if ((CMTimeCompare(&v122.start, &v117.start) & 0x80000000) == 0) {
                break;
              }
              memset(&v122, 0, sizeof(v122));
              CMTimeRange v121 = v179;
              CMTimeRange v120 = v124;
              CMTimeRangeGetIntersection(&v122, &v121, &v120);
              CMTimeRange v57 = [(__CFDictionary *)v56 objectForKey:@"quality"];
              [v57 floatValue];
              float v59 = v58;

              if ((v122.start.flags & 1) == 0
                || (v122.duration.flags & 1) == 0
                || v122.duration.epoch
                || v122.duration.value < 0
                || (v119 = v122.duration, CMTime v118 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48], CMTimeCompare(&v119, &v118)))
              {
                if (v59 > 0.7)
                {
                  CMTimeRange v116 = v129;
                  CMTimeRange v115 = v122;
                  CMTimeRangeGetUnion(&v117, &v116, &v115);
                  CMTimeRange v129 = v117;
                }
              }
              if (v53 == ++v55)
              {
                uint64_t v53 = [v52 countByEnumeratingWithState:&v125 objects:v187 count:16];
                if (v53) {
                  goto LABEL_77;
                }
                break;
              }
            }
          }

          long long v60 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
          *(_OWORD *)&v124.start.CMTimeValue value = *MEMORY[0x1E4F1FA20];
          *(_OWORD *)&v124.start.CMTimeEpoch epoch = v60;
          *(_OWORD *)&v124.duration.CMTimeScale timescale = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
          long long v111 = 0u;
          long long v112 = 0u;
          long long v113 = 0u;
          long long v114 = 0u;
          id v61 = v81[12];
          uint64_t v62 = [v61 countByEnumeratingWithState:&v111 objects:v186 count:16];
          if (v62)
          {
            uint64_t v63 = *(void *)v112;
LABEL_92:
            uint64_t v64 = 0;
            while (1)
            {
              if (*(void *)v112 != v63) {
                objc_enumerationMutation(v61);
              }
              CFDictionaryRef v65 = *(const __CFDictionary **)(*((void *)&v111 + 1) + 8 * v64);
              memset(&v122, 0, sizeof(v122));
              CMTimeRangeMakeFromDictionary(&v122, v65);
              CMTimeRange v109 = v179;
              CMTimeRangeGetEnd(&v110, &v109);
              *(_OWORD *)&v117.start.CMTimeValue value = *(_OWORD *)&v122.start.value;
              v117.start.CMTimeEpoch epoch = v122.start.epoch;
              v104.CMTime start = v110;
              if ((CMTimeCompare(&v117.start, &v104.start) & 0x80000000) == 0) {
                break;
              }
              memset(&v117, 0, sizeof(v117));
              CMTimeRange v108 = v179;
              CMTimeRange v107 = v122;
              CMTimeRangeGetIntersection(&v117, &v108, &v107);
              if ((v117.start.flags & 1) == 0
                || (v117.duration.flags & 1) == 0
                || v117.duration.epoch
                || v117.duration.value < 0
                || (v106 = v117.duration, CMTime v105 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48], CMTimeCompare(&v106, &v105)))
              {
                CMTimeRange v66 = [(__CFDictionary *)v65 objectForKey:@"flags"];
                uint64_t v67 = [v66 integerValue];
                if ((v67 & 0x2FFC0) != 0 && (v67 & 0x40) == 0x40)
                {
                  CMTimeRange v103 = v124;
                  CMTimeRange v102 = v117;
                  CMTimeRangeGetUnion(&v104, &v103, &v102);
                  CMTimeRange v124 = v104;
                }
              }
              if (v62 == ++v64)
              {
                uint64_t v62 = [v61 countByEnumeratingWithState:&v111 objects:v186 count:16];
                if (v62) {
                  goto LABEL_92;
                }
                break;
              }
            }
          }

          CMTimeRange v101 = v124;
          CMTimeRange v100 = v129;
          CMTimeRangeGetIntersection(&v122, &v101, &v100);
          CMTimeRange v179 = v122;
          if ((v122.start.flags & 1) == 0
            || (v179.duration.flags & 1) == 0
            || v179.duration.epoch
            || v179.duration.value < 0
            || (CMTime v99 = v179.duration, v98 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48], CMTimeCompare(&v99, &v98)))
          {
            if ((v185.flags & 1) == 0
              || (v97 = v185, double v68 = CMTimeGetSeconds(&v97), v96 = v179.start, v68 > CMTimeGetSeconds(&v96)))
            {
              CMTime v185 = v179.start;
            }
            if ((flags & 1) == 0
              || (v95.CMTimeValue value = value,
                  v95.CMTimeScale timescale = timescale,
                  v95.CMTimeFlags flags = flags,
                  v95.CMTimeEpoch epoch = epoch,
                  double v69 = CMTimeGetSeconds(&v95),
                  CMTimeRange v93 = v179,
                  CMTimeRangeGetEnd(&v94, &v93),
                  v69 < CMTimeGetSeconds(&v94)))
            {
              CMTimeRange v92 = v179;
              CMTimeRangeGetEnd(&v122.start, &v92);
              CMTimeValue value = v122.start.value;
              CMTimeFlags flags = v122.start.flags;
              CMTimeScale timescale = v122.start.timescale;
              CMTimeEpoch epoch = v122.start.epoch;
            }
          }
        }
      }
      if (++v44 == v79)
      {
        uint64_t v43 = [objc countByEnumeratingWithState:&v135 objects:v188 count:16];
        if (v43) {
          goto LABEL_65;
        }
        break;
      }
    }
  }

  if ((v185.flags | flags))
  {
    CMTime v73 = &v185;
    if ((v185.flags & 1) == 0) {
      CMTime v73 = v87;
    }
    long long v74 = *(_OWORD *)&v73->value;
    v185.CMTimeEpoch epoch = v73->epoch;
    *(_OWORD *)&v185.CMTimeValue value = v74;
    if (flags)
    {
      CMTimeFlags v76 = flags;
      v180.start.CMTimeValue value = value;
      v180.start.CMTimeScale timescale = timescale;
      v180.start.CMTimeFlags flags = flags;
      CMTimeEpoch v77 = epoch;
    }
    else
    {
      long long v75 = *(_OWORD *)&v87->epoch;
      *(_OWORD *)&v91.start.CMTimeValue value = *(_OWORD *)&v87->value;
      *(_OWORD *)&v91.start.CMTimeEpoch epoch = v75;
      *(_OWORD *)&v91.duration.CMTimeScale timescale = *(_OWORD *)&v87[1].timescale;
      CMTimeRangeGetEnd(&v180.start, &v91);
      CMTimeFlags v76 = v180.start.flags;
      CMTimeEpoch v77 = v180.start.epoch;
    }
    CMTimeValue value = v180.start.value;
    CMTimeScale timescale = v180.start.timescale;
    CMTime start = v185;
    end.CMTimeValue value = v180.start.value;
    end.CMTimeScale timescale = v180.start.timescale;
    end.CMTimeFlags flags = v76;
    end.CMTimeEpoch epoch = v77;
    return ($D854FC4CDD8DDEA9B2859E823A7C8A75 *)CMTimeRangeFromTimeToTime(v78, &start, &end);
  }
  else
  {
    uint64_t v71 = MEMORY[0x1E4F1FA30];
    long long v72 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
    *(_OWORD *)&v78->start.CMTimeValue value = *MEMORY[0x1E4F1FA30];
    *(_OWORD *)&v78->start.CMTimeEpoch epoch = v72;
    *(_OWORD *)&v78->duration.CMTimeScale timescale = *(_OWORD *)(v71 + 32);
  }
  return result;
}

- ($D854FC4CDD8DDEA9B2859E823A7C8A75)computeSteadyTranslationTrimFor:(SEL)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  long long v5 = *MEMORY[0x1E4F1F9F8];
  CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  v69.CMTimeEpoch epoch = epoch;
  CMTimeValue value = *MEMORY[0x1E4F1F9F8];
  CMTimeFlags flags = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 12);
  CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  *(_OWORD *)&v69.CMTimeValue value = v5;
  obuint64_t j = self->_qualityResults;
  uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v65 objects:v72 count:16];
  long long v36 = a4;
  if (v7)
  {
    uint64_t v34 = v7;
    uint64_t v35 = *(void *)v66;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v66 != v35) {
        objc_enumerationMutation(obj);
      }
      CFDictionaryRef v9 = *(const __CFDictionary **)(*((void *)&v65 + 1) + 8 * v8);
      memset(&v64, 0, sizeof(v64));
      CMTimeRangeMakeFromDictionary(&v64, v9);
      memset(&v63, 0, sizeof(v63));
      CMTimeRange range = v64;
      CMTimeRangeGetEnd(&v63, &range);
      long long v10 = *(_OWORD *)&v36->var0.var3;
      *(_OWORD *)&v61.start.CMTimeValue value = *(_OWORD *)&v36->var0.var0;
      *(_OWORD *)&v61.start.CMTimeEpoch epoch = v10;
      *(_OWORD *)&v61.duration.CMTimeScale timescale = *(_OWORD *)&v36->var1.var1;
      CMTimeRangeGetEnd(&v70, &v61);
      *(_OWORD *)&time1.start.CMTimeValue value = *(_OWORD *)&v64.start.value;
      time1.start.CMTimeEpoch epoch = v64.start.epoch;
      time2.CMTime start = v70;
      if ((CMTimeCompare(&time1.start, &time2.start) & 0x80000000) == 0) {
        break;
      }
      long long v11 = [(__CFDictionary *)v9 objectForKeyedSubscript:@"quality"];
      [v11 floatValue];
      BOOL v13 = v12 < 0.7;

      if (!v13)
      {
        *(_OWORD *)&v59.start.CMTimeEpoch epoch = *(_OWORD *)&v64.start.epoch;
        *(_OWORD *)&v59.duration.CMTimeScale timescale = *(_OWORD *)&v64.duration.timescale;
        long long v14 = *(_OWORD *)&v36->var0.var3;
        *(_OWORD *)&otherRange.start.CMTimeValue value = *(_OWORD *)&v36->var0.var0;
        *(_OWORD *)&otherRange.start.CMTimeEpoch epoch = v14;
        *(_OWORD *)&otherRange.duration.CMTimeScale timescale = *(_OWORD *)&v36->var1.var1;
        *(_OWORD *)&v59.start.CMTimeValue value = *(_OWORD *)&v64.start.value;
        CMTimeRangeGetIntersection(&time1, &v59, &otherRange);
        CMTimeRange v64 = time1;
        if ((time1.start.flags & 1) == 0
          || (v64.duration.flags & 1) == 0
          || v64.duration.epoch
          || v64.duration.value < 0
          || (CMTime v57 = v64.duration, v56 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48], CMTimeCompare(&v57, &v56)))
        {
          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          float v15 = self->_cameraMotionResults;
          uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v52 objects:v71 count:16];
          if (v16)
          {
            uint64_t v17 = *(void *)v53;
LABEL_15:
            uint64_t v18 = 0;
            while (1)
            {
              if (*(void *)v53 != v17) {
                objc_enumerationMutation(v15);
              }
              CFDictionaryRef v19 = *(const __CFDictionary **)(*((void *)&v52 + 1) + 8 * v18);
              memset(&time1, 0, sizeof(time1));
              CMTimeRangeMakeFromDictionary(&time1, v19);
              *(_OWORD *)&time2.start.CMTimeValue value = *(_OWORD *)&time1.start.value;
              time2.start.CMTimeEpoch epoch = time1.start.epoch;
              CMTime v70 = v63;
              if ((CMTimeCompare(&time2.start, &v70) & 0x80000000) == 0) {
                break;
              }
              CMTimeRange v50 = time1;
              memset(&time2, 0, sizeof(time2));
              CMTimeRange v49 = v64;
              CMTimeRangeGetIntersection(&time2, &v50, &v49);
              if ((time2.start.flags & 1) == 0
                || (time2.duration.flags & 1) == 0
                || time2.duration.epoch
                || time2.duration.value < 0
                || (CMTime duration = time2.duration,
                    CMTime v47 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48],
                    CMTimeCompare(&duration, &v47)))
              {
                uint64_t v20 = [(__CFDictionary *)v19 objectForKey:@"flags"];
                uint64_t v21 = [v20 integerValue];
                if ((v21 & 0x2FFC0) != 0 && __clz(__rbit32(v21 & 0x2FFC0)) - 7 <= 1)
                {
                  if ((v69.flags & 1) == 0
                    || (CMTime time = v69,
                        double Seconds = CMTimeGetSeconds(&time),
                        CMTime v45 = time2.start,
                        Seconds > CMTimeGetSeconds(&v45)))
                  {
                    CMTime v69 = time2.start;
                  }
                  if ((flags & 1) == 0
                    || (v44.CMTimeValue value = value,
                        v44.CMTimeScale timescale = timescale,
                        v44.CMTimeFlags flags = flags,
                        v44.CMTimeEpoch epoch = epoch,
                        double v23 = CMTimeGetSeconds(&v44),
                        CMTimeRange v42 = time2,
                        CMTimeRangeGetEnd(&v43, &v42),
                        v23 < CMTimeGetSeconds(&v43)))
                  {
                    CMTimeRange v41 = time2;
                    CMTimeRangeGetEnd(&v70, &v41);
                    CMTimeValue value = v70.value;
                    CMTimeFlags flags = v70.flags;
                    CMTimeScale timescale = v70.timescale;
                    CMTimeEpoch epoch = v70.epoch;
                  }
                }
              }
              if (v16 == ++v18)
              {
                uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v52 objects:v71 count:16];
                if (v16) {
                  goto LABEL_15;
                }
                break;
              }
            }
          }
        }
      }
      if (++v8 == v34)
      {
        uint64_t v34 = [(NSArray *)obj countByEnumeratingWithState:&v65 objects:v72 count:16];
        if (v34) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if ((v69.flags | flags))
  {
    float v27 = &v69;
    if ((v69.flags & 1) == 0) {
      float v27 = (CMTime *)v36;
    }
    long long v28 = *(_OWORD *)&v27->value;
    v69.CMTimeEpoch epoch = v27->epoch;
    *(_OWORD *)&v69.CMTimeValue value = v28;
    if (flags)
    {
      v64.start.CMTimeValue value = value;
      v64.start.CMTimeScale timescale = timescale;
      v64.start.CMTimeFlags flags = flags;
      CMTimeEpoch v30 = epoch;
    }
    else
    {
      long long v29 = *(_OWORD *)&v36->var0.var3;
      *(_OWORD *)&v40.start.CMTimeValue value = *(_OWORD *)&v36->var0.var0;
      *(_OWORD *)&v40.start.CMTimeEpoch epoch = v29;
      *(_OWORD *)&v40.duration.CMTimeScale timescale = *(_OWORD *)&v36->var1.var1;
      CMTimeRangeGetEnd(&v64.start, &v40);
      CMTimeFlags flags = v64.start.flags;
      CMTimeEpoch v30 = v64.start.epoch;
    }
    CMTimeValue value = v64.start.value;
    CMTimeScale timescale = v64.start.timescale;
    CMTime start = v69;
    end.CMTimeValue value = v64.start.value;
    end.CMTimeScale timescale = v64.start.timescale;
    end.CMTimeFlags flags = flags;
    end.CMTimeEpoch epoch = v30;
    return ($D854FC4CDD8DDEA9B2859E823A7C8A75 *)CMTimeRangeFromTimeToTime((CMTimeRange *)retstr, &start, &end);
  }
  else
  {
    uint64_t v25 = MEMORY[0x1E4F1FA30];
    long long v26 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
    *(_OWORD *)&retstr->var0.CMTime var0 = *MEMORY[0x1E4F1FA30];
    *(_OWORD *)&retstr->var0.CMTimeEpoch var3 = v26;
    *(_OWORD *)&retstr->var1.CMTime var1 = *(_OWORD *)(v25 + 32);
  }
  return result;
}

- (BOOL)checkCameraZoom:(id *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  memset(&v30, 0, sizeof(v30));
  long long v5 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.CMTimeEpoch epoch = v5;
  *(_OWORD *)&range.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v30, &range);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  double v6 = self->_cameraMotionResults;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v26;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v26 != v8) {
        objc_enumerationMutation(v6);
      }
      CFDictionaryRef v10 = *(const __CFDictionary **)(*((void *)&v25 + 1) + 8 * v9);
      memset(&v24, 0, sizeof(v24));
      CMTimeRangeMakeFromDictionary(&v24, v10);
      *(_OWORD *)&time1.start.CMTimeValue value = *(_OWORD *)&v24.start.value;
      time1.start.CMTimeEpoch epoch = v24.start.epoch;
      CMTime time2 = v30;
      if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0) {
        break;
      }
      CMTimeRange v22 = v24;
      memset(&time1, 0, sizeof(time1));
      long long v11 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&otherRange.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&otherRange.start.CMTimeEpoch epoch = v11;
      *(_OWORD *)&otherRange.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetIntersection(&time1, &v22, &otherRange);
      if ((time1.start.flags & 1) == 0
        || (time1.duration.flags & 1) == 0
        || time1.duration.epoch
        || time1.duration.value < 0
        || (duration = time1.duration, CMTime v19 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48], CMTimeCompare(&duration, &v19)))
      {
        float v12 = [(__CFDictionary *)v10 objectForKey:@"flags"];
        uint64_t v13 = [v12 integerValue];
        BOOL v15 = !(v14 | ((v13 & 0x2FFC0) == 0)) && (v13 & 0x1FC0) == 4096;
        BOOL v16 = v15;

        if (v16)
        {
          BOOL v17 = 1;
          goto LABEL_24;
        }
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v25 objects:v32 count:16];
        BOOL v17 = 0;
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_24;
      }
    }
  }
  BOOL v17 = 0;
LABEL_24:

  return v17;
}

- (float)computeHighlightScoreOfRange:(id *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v5 = *(_OWORD *)&a3->var0.var3;
  v27[0] = *(_OWORD *)&a3->var0.var0;
  v27[1] = v5;
  v27[2] = *(_OWORD *)&a3->var1.var1;
  [(VCPMovieHighlightAnalyzer *)self computeExpressionScoreInTimerange:v27];
  float v7 = v6;
  long long v8 = *(_OWORD *)&a3->var0.var3;
  v26[0] = *(_OWORD *)&a3->var0.var0;
  v26[1] = v8;
  v26[2] = *(_OWORD *)&a3->var1.var1;
  [(VCPMovieHighlightAnalyzer *)self computeActionScoreInTimerange:v26];
  float v10 = v9;
  long long v11 = *(_OWORD *)&a3->var0.var3;
  v25[0] = *(_OWORD *)&a3->var0.var0;
  v25[1] = v11;
  v25[2] = *(_OWORD *)&a3->var1.var1;
  [(VCPMovieHighlightAnalyzer *)self computeVoiceScoreInTimeRange:v25];
  float v13 = v12;
  float v14 = (float)((float)((float)(v7 * 0.4) + 0.0) + (float)(v10 * 0.4)) + (float)(v12 * 0.2);
  float v15 = 1.0;
  if (v14 < 1.0) {
    float v15 = v14;
  }
  if (v14 <= 0.0) {
    float v16 = 0.0;
  }
  else {
    float v16 = v15;
  }
  if (self->_isLivePhoto && (int)MediaAnalysisLogLevel() >= 7)
  {
    BOOL v17 = VCPLogInstance();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      CMTime time = (CMTime)a3->var0;
      Float64 Seconds = CMTimeGetSeconds(&time);
      long long v19 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&v22.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&v22.start.CMTimeEpoch epoch = v19;
      *(_OWORD *)&v22.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetEnd(&v23, &v22);
      Float64 v20 = CMTimeGetSeconds(&v23);
      *(_DWORD *)CMTimeRange buf = 134219264;
      Float64 v29 = Seconds;
      __int16 v30 = 2048;
      Float64 v31 = v20;
      __int16 v32 = 2048;
      double v33 = v7;
      __int16 v34 = 2048;
      double v35 = v10;
      __int16 v36 = 2048;
      double v37 = v13;
      __int16 v38 = 2048;
      double v39 = v16;
      _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_DEBUG, "[%.2f - %.2f] expressionScore=%.2f, actionScore=%.2f, voiceScore=%.2f, Score=%.2f", buf, 0x3Eu);
    }
  }
  return v16;
}

- (void)SetKeyFramesForSegments:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__VCPMovieHighlightAnalyzer_SetKeyFramesForSegments___block_invoke;
  v3[3] = &unk_1E6298D40;
  v3[4] = self;
  [a3 enumerateObjectsUsingBlock:v3];
}

void __53__VCPMovieHighlightAnalyzer_SetKeyFramesForSegments___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  long long v5 = *(void **)(a1 + 32);
  if (v3) {
    [v3 timerange];
  }
  else {
    memset(v7, 0, sizeof(v7));
  }
  float v6 = [v5 pickKeyFramesInRange:v7];
  [v4 setKeyFrame:v6];
}

- (id)pickKeyFramesInRange:(id *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v4 = self->_keyFrameResults;
  long long v5 = 0;
  uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v19;
    float v8 = -1.0;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        float v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        long long v11 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&range.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&range.start.CMTimeEpoch epoch = v11;
        *(_OWORD *)&range.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
        if (v10) {
          [v10 timestamp];
        }
        else {
          memset(&time, 0, sizeof(time));
        }
        if (CMTimeRangeContainsTime(&range, &time))
        {
          [v10 score];
          if (v12 > v8)
          {
            [v10 score];
            float v8 = v13;
            id v14 = v10;

            long long v5 = v14;
          }
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  return v5;
}

- (int)computeHighlightScoreResults
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = self->_sceneResults;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v38;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v38 != v4) {
          objc_enumerationMutation(obj);
        }
        CFDictionaryRef v6 = *(const __CFDictionary **)(*((void *)&v37 + 1) + 8 * v5);
        memset(&v36, 0, sizeof(v36));
        CMTimeRangeMakeFromDictionary(&v36, v6);
        {
          CMTimeMake((CMTime *)-[VCPMovieHighlightAnalyzer computeHighlightScoreResults]::kHalfSecond, 300, 600);
        }
        memset(&v35, 0, sizeof(v35));
        CMTimeMake(&v35, 300, 600);
        CMTime v34 = v36.start;
        memset(&v33, 0, sizeof(v33));
        CMTimeRange range = v36;
        CMTimeRangeGetEnd(&v33, &range);
        uint64_t v7 = 0;
        CMTime v31 = v34;
        while (1)
        {
          time1.CMTime start = v31;
          CMTime time2 = v33;
          if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0) {
            break;
          }
          memset(&v30, 0, sizeof(v30));
          time1.CMTime start = v34;
          CMTime time2 = v35;
          CMTimeAdd(&rhs, &time1.start, &time2);
          time1.CMTime start = v31;
          CMTime time2 = rhs;
          if (CMTimeCompare(&time1.start, &time2) < 1)
          {
            CMTime v30 = v34;
          }
          else
          {
            time1.CMTime start = v31;
            CMTime time2 = v35;
            CMTimeSubtract(&v30, &time1.start, &time2);
          }
          memset(&v29, 0, sizeof(v29));
          time1.CMTime start = v31;
          CMTime time2 = v35;
          CMTimeAdd(&rhs, &time1.start, &time2);
          time1.CMTime start = rhs;
          CMTime time2 = v33;
          if (CMTimeCompare(&time1.start, &time2) < 1)
          {
            time1.CMTime start = v31;
            CMTime time2 = v35;
            CMTimeAdd(&v29, &time1.start, &time2);
          }
          else
          {
            CMTime v29 = v33;
          }
          memset(&time1, 0, sizeof(time1));
          CMTime start = v30;
          CMTime end = v29;
          CMTimeRangeFromTimeToTime(&time1, &start, &end);
          float v8 = [VCPMovieHighlight alloc];
          CMTimeRange v25 = time1;
          float v9 = [(VCPMovieHighlight *)v8 initWithTimeRange:&v25];
          [(VCPMovieHighlightAnalyzer *)self computeHighlightScoreOfSegment:v9];
          CMTime time2 = v31;
          CMTime rhs = *(CMTime *)-[VCPMovieHighlightAnalyzer computeHighlightScoreResults]::kHalfSecond;
          CMTimeAdd(&v24, &time2, &rhs);
          CMTime time2 = v24;
          CMTime rhs = v33;
          if (CMTimeCompare(&time2, &rhs) < 0)
          {
            CMTime v22 = v31;
            CMTime v21 = *(CMTime *)-[VCPMovieHighlightAnalyzer computeHighlightScoreResults]::kHalfSecond;
            CMTimeRangeMake(&v23, &v22, &v21);
            CMTimeRange v20 = v23;
            float v10 = &v20;
          }
          else
          {
            CMTime v18 = v31;
            CMTime time2 = v33;
            CMTime rhs = v31;
            CMTimeSubtract(&duration, &time2, &rhs);
            CMTimeRangeMake(&v19, &v18, &duration);
            CMTimeRange v16 = v19;
            float v10 = &v16;
          }
          [(VCPMovieHighlight *)v9 setTimerange:v10];
          [(NSMutableArray *)self->_internalResults addObject:v9];
          [(VCPMovieHighlight *)v9 score];
          if (*(float *)&self->_contextResults >= v11) {
            float v11 = *(float *)&self->_contextResults;
          }
          *(float *)&self->_contextResults = v11;
          [(VCPMovieHighlight *)v9 score];
          if (v12 >= *((float *)&self->_contextResults + 1)) {
            float v12 = *((float *)&self->_contextResults + 1);
          }
          *((float *)&self->_contextResults + 1) = v12;

          CMTime time2 = v31;
          CMTime rhs = *(CMTime *)-[VCPMovieHighlightAnalyzer computeHighlightScoreResults]::kHalfSecond;
          CMTimeAdd(&time1.start, &time2, &rhs);
          CMTime v31 = time1.start;
          uint64_t v7 = v9;
        }

        ++v5;
      }
      while (v5 != v3);
      uint64_t v13 = [(NSArray *)obj countByEnumeratingWithState:&v37 objects:v43 count:16];
      uint64_t v3 = v13;
    }
    while (v13);
  }

  return 0;
}

- (int)pickHighlightsFrom:(id)a3
{
  id v4 = a3;
  {
    CMTimeMake((CMTime *)-[VCPMovieHighlightAnalyzer pickHighlightsFrom:]::kHalfSecond, 300, 600);
  }
  memset(&v25, 0, sizeof(v25));
  CMTimeMake(&v25, (uint64_t)(float)(self->_maxDurationInSeconds * 600.0), 600);
  if (v4)
  {
    [v4 timerange];
    *(CMTime *)&time1[48] = *(CMTime *)time1;
    memset(&v23, 0, sizeof(v23));
    [v4 timerange];
    [v4 timerange];
  }
  else
  {
    memset(&v23, 0, sizeof(v23));
    memset(time1, 0, sizeof(time1));
    memset(time2, 0, sizeof(time2));
  }
  CMTime lhs = *(CMTime *)time1;
  CMTime rhs = time2[1];
  CMTimeAdd(&v23, &lhs, &rhs);
  uint64_t v5 = 0;
  for (CMTime rhs = *(CMTime *)&time1[48]; ; CMTime rhs = *(CMTime *)time1)
  {
    *(CMTime *)CMTimeRange time1 = v23;
    time2[0] = v25;
    CMTimeSubtract(&lhs, (CMTime *)time1, time2);
    *(CMTime *)CMTimeRange time1 = rhs;
    time2[0] = lhs;
    if ((CMTimeCompare((CMTime *)time1, time2) & 0x80000000) == 0) {
      break;
    }
    memset(&lhs, 0, sizeof(lhs));
    *(CMTime *)CMTimeRange time1 = rhs;
    time2[0] = v25;
    CMTimeAdd(&v21, (CMTime *)time1, time2);
    *(CMTime *)CMTimeRange time1 = v21;
    time2[0] = v23;
    if (CMTimeCompare((CMTime *)time1, time2) < 1)
    {
      CMTime lhs = v25;
    }
    else
    {
      *(CMTime *)CMTimeRange time1 = v23;
      time2[0] = rhs;
      CMTimeSubtract(&lhs, (CMTime *)time1, time2);
    }
    CMTime time = lhs;
    if (fabs(CMTimeGetSeconds(&time)) < self->_minDurationInSeconds) {
      break;
    }
    memset(time1, 0, 48);
    CMTime start = rhs;
    CMTime duration = lhs;
    CMTimeRangeMake((CMTimeRange *)time1, &start, &duration);
    CFDictionaryRef v6 = [VCPMovieHighlight alloc];
    CMTimeRange v17 = *(CMTimeRange *)time1;
    uint64_t v7 = [(VCPMovieHighlight *)v6 initWithTimeRange:&v17];
    [(VCPMovieHighlight *)v7 copyScoresFrom:v4];
    CMTimeRange v16 = *(CMTimeRange *)time1;
    float v8 = [(VCPMovieHighlightAnalyzer *)self pickKeyFramesInRange:&v16];
    [(VCPMovieHighlight *)v7 setKeyFrame:v8];

    [(VCPMovieHighlightAnalyzer *)self computeHighlightScoreOfSegment:v7];
    [(VCPMovieHighlight *)v7 score];
    float v10 = v9;
    [(VCPMovieHighlight *)v5 score];
    if (v10 > v11)
    {
      float v12 = v7;

      uint64_t v5 = v12;
    }

    time2[0] = rhs;
    CMTime lhs = *(CMTime *)-[VCPMovieHighlightAnalyzer pickHighlightsFrom:]::kHalfSecond;
    CMTimeAdd((CMTime *)time1, time2, &lhs);
  }
  [(VCPMovieHighlightAnalyzer *)self searchFeatureVectorOfSegment:v4];
  uint64_t v13 = [v4 descriptor];
  [(VCPMovieHighlight *)v5 setDescriptor:v13];

  [(VCPMovieHighlightAnalyzer *)self computeHighlightScoreOfSegment:v4];
  [v4 score];
  -[VCPMovieHighlight setScore:](v5, "setScore:");
  int v14 = [(VCPMovieHighlightAnalyzer *)self evaluateSegment:v5];

  return v14;
}

- (void)searchFeatureVectorOfSegment:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CMTimeRange v16 = v4;
  if (v4)
  {
    uint64_t v5 = v4;
    [v4 timerange];
    CMTime v27 = time1;
    memset(&v25, 0, sizeof(v25));
    [v5 timerange];
  }
  else
  {
    memset(&v27, 0, sizeof(v27));
    memset(&v25, 0, sizeof(v25));
    memset(&range, 0, sizeof(range));
  }
  CMTimeRangeGetEnd(&v25, &range);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  CFDictionaryRef v6 = self->_featureResults;
  obuint64_t j = v6;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v20 objects:v29 count:16];
  if (!v7)
  {
    float v9 = 0;
    goto LABEL_19;
  }
  CFDictionaryRef v6 = 0;
  uint64_t v18 = *(void *)v21;
  while (2)
  {
    uint64_t v8 = 0;
    float v9 = v6;
    do
    {
      if (*(void *)v21 != v18) {
        objc_enumerationMutation(obj);
      }
      float v10 = *(void **)(*((void *)&v20 + 1) + 8 * v8);
      float v11 = objc_msgSend(v10, "objectForKeyedSubscript:", @"attributes", v16);
      CFDictionaryRef v6 = [v11 objectForKeyedSubscript:@"featureVector"];

      memset(&v19, 0, sizeof(v19));
      CFDictionaryRef v12 = [v10 objectForKeyedSubscript:@"start"];
      CMTimeMakeFromDictionary(&v19, v12);

      CMTime time1 = v19;
      CMTime time2 = v27;
      if (CMTimeCompare(&time1, &time2) >= 1)
      {
        CMTime time1 = v19;
        CMTime time2 = v25;
        if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
        {
          int v14 = v9;

          CFDictionaryRef v6 = v14;
        }
        uint64_t v13 = obj;
        goto LABEL_16;
      }
      CFDictionaryRef v6 = v6;

      ++v8;
      float v9 = v6;
    }
    while (v7 != v8);
    uint64_t v13 = obj;
    uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v20 objects:v29 count:16];
    float v9 = v6;
    if (v7) {
      continue;
    }
    break;
  }
LABEL_16:

  if (v6)
  {
    float v15 = +[VCPImageDescriptor descriptorWithData:v6];
    [v16 setDescriptor:v15];

LABEL_19:
  }
}

- (int)evaluateSegment:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 score];
  if (v5 < *((float *)&self->_contextResults + 1)) {
    goto LABEL_8;
  }
  if (v4) {
    [v4 timerange];
  }
  else {
    memset(&v38, 0, sizeof(v38));
  }
  CMTime time = v38.duration;
  if (CMTimeGetSeconds(&time) < self->_minDurationInSeconds) {
    goto LABEL_8;
  }
  if (LOBYTE(self->_maxHighlightScore))
  {
    [(VCPMovieHighlightAnalyzer *)self addSegment:v4];
LABEL_8:
    int v6 = 0;
    goto LABEL_9;
  }
  uint64_t v8 = [v4 descriptor];
  BOOL v9 = v8 == 0;

  if (v9)
  {
    long long v21 = 0;
    int v6 = 0;
    goto LABEL_55;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = self->_internalConstraintResults;
  uint64_t v10 = [(NSMutableArray *)obj countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (!v10)
  {

    CMTime v27 = 0;
    goto LABEL_35;
  }
  CMTime v27 = 0;
  uint64_t v11 = *(void *)v35;
  float v12 = *(float *)"";
  while (2)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v35 != v11) {
        objc_enumerationMutation(obj);
      }
      int v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
      if (v4)
      {
        [v4 timerange];
        if (v14) {
          goto LABEL_18;
        }
      }
      else
      {
        memset(&range, 0, sizeof(range));
        if (v14)
        {
LABEL_18:
          [v14 timerange];
          goto LABEL_21;
        }
      }
      memset(&otherRange, 0, sizeof(otherRange));
LABEL_21:
      CMTimeRangeGetIntersection(&v38, &range, &otherRange);
      time1[0] = v38.duration;
      time2[0] = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
      if (CMTimeCompare(time1, time2) >= 1)
      {
        id v22 = v14;

        CMTime v27 = v22;
        goto LABEL_32;
      }
      float v15 = [v14 descriptor];
      BOOL v16 = v15 == 0;

      if (!v16)
      {
        LODWORD(v38.start.value) = 0;
        CMTimeRange v17 = [v14 descriptor];
        uint64_t v18 = [v4 descriptor];
        int v6 = [v17 computeDistance:&v38 toDescriptor:v18];

        if (v6)
        {

          goto LABEL_54;
        }
        float v19 = *(float *)&v38.start.value;
        if (*(float *)&v38.start.value < v12)
        {
          id v20 = v14;

          CMTime v27 = v20;
          float v12 = v19;
        }
      }
    }
    uint64_t v10 = [(NSMutableArray *)obj countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v10) {
      continue;
    }
    break;
  }

  if (v12 < 0.1)
  {
LABEL_32:
    if (v4) {
      [v4 timerange];
    }
    else {
      memset(&v31, 0, sizeof(v31));
    }
    if (v27) {
      [v27 timerange];
    }
    else {
      memset(&v30, 0, sizeof(v30));
    }
    CMTimeRangeGetIntersection(&v38, &v31, &v30);
    CMTime duration = v38.duration;
    CMTime v40 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    if (CMTimeCompare(&duration, &v40) < 1) {
      goto LABEL_50;
    }
    if (v4) {
      [v4 timerange];
    }
    else {
      memset(time1, 0, sizeof(time1));
    }
    if (v27) {
      [v27 timerange];
    }
    else {
      memset(time2, 0, sizeof(time2));
    }
    CMTime duration = time1[1];
    CMTime v40 = time2[1];
    if (CMTimeCompare(&duration, &v40) < 1)
    {
LABEL_50:
      [v27 score];
      float v24 = v23;
      [v4 score];
      if (v24 >= v25 || ![(VCPMovieHighlightAnalyzer *)self addSegment:v4]) {
        goto LABEL_53;
      }
    }
    else
    {
      [(NSMutableArray *)self->_internalConstraintResults addObject:v4];
    }
    [(NSMutableArray *)self->_internalConstraintResults removeObject:v27];
    goto LABEL_53;
  }
LABEL_35:
  [(VCPMovieHighlightAnalyzer *)self addSegment:v4];
LABEL_53:
  int v6 = 0;
LABEL_54:
  long long v21 = v27;
LABEL_55:

LABEL_9:
  return v6;
}

- (BOOL)addSegment:(id)a3
{
  id v4 = a3;
  float v5 = [(NSMutableArray *)self->_internalConstraintResults lastObject];
  [v5 score];
  float v7 = v6;
  [v4 score];
  float v9 = v8;
  if (!v4)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v20 = 0u;
    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    long long v17 = 0u;
    memset(v18, 0, 56);
    goto LABEL_6;
  }
  [v4 timerange];
  if (!v5) {
    goto LABEL_5;
  }
LABEL_3:
  [v5 timerange];
  [v5 timerange];
LABEL_6:
  CMTime lhs = *(CMTime *)&v18[32];
  CMTime rhs = *(CMTime *)&v18[8];
  CMTimeAdd(&v19, &lhs, &rhs);
  *(_OWORD *)&lhs.CMTimeValue value = v20;
  lhs.CMTimeEpoch epoch = v21;
  CMTime rhs = v19;
  CMTimeSubtract(&time, &lhs, &rhs);
  double Seconds = CMTimeGetSeconds(&time);
  if (vabds_f32(v7, v9) < 0.1)
  {
    float v11 = Seconds;
    if (v11 < 0.2)
    {
      [v4 score];
      float v13 = v12;
      [v5 score];
      if (v13 <= v14)
      {
        BOOL v15 = 0;
        goto LABEL_12;
      }
      [(NSMutableArray *)self->_internalConstraintResults removeLastObject];
    }
  }
  -[NSMutableArray addObject:](self->_internalConstraintResults, "addObject:", v4, v17, *(void *)v18);
  BOOL v15 = 1;
LABEL_12:

  return v15;
}

- (void)computeHighlightScoreOfSegment:(id)a3
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  float v5 = v4;
  if (v4) {
    [v4 timerange];
  }
  else {
    memset(v82, 0, sizeof(v82));
  }
  [(VCPMovieHighlightAnalyzer *)self qualityScoreForTimerange:v82];
  float v7 = v6;
  if (v5) {
    [v5 timerange];
  }
  else {
    memset(v81, 0, sizeof(v81));
  }
  [(VCPMovieHighlightAnalyzer *)self computeMLQualityScoreForTimerange:v81];
  float v9 = v8;
  if (v5) {
    [v5 timerange];
  }
  else {
    memset(v80, 0, sizeof(v80));
  }
  [(VCPMovieHighlightAnalyzer *)self junkScoreForTimerange:v80 lengthScale:0];
  float v11 = v10;
  if (v5) {
    [v5 timerange];
  }
  else {
    memset(v79, 0, sizeof(v79));
  }
  [(VCPMovieHighlightAnalyzer *)self computeSubtleMotionScoreInTimerange:v79];
  float v13 = v12;
  if (v5) {
    [v5 timerange];
  }
  else {
    memset(v78, 0, sizeof(v78));
  }
  [(VCPMovieHighlightAnalyzer *)self cameraMotionScoreForTimerange:v78];
  float v15 = v14;
  if (v5) {
    [v5 timerange];
  }
  else {
    memset(v77, 0, sizeof(v77));
  }
  [(VCPMovieHighlightAnalyzer *)self computeExpressionScoreInTimerange:v77];
  objc_msgSend(v5, "setExpressionScore:");
  if (v5) {
    [v5 timerange];
  }
  else {
    memset(v76, 0, sizeof(v76));
  }
  [(VCPMovieHighlightAnalyzer *)self computeActionScoreInTimerange:v76];
  objc_msgSend(v5, "setActionScore:");
  if (v5) {
    [v5 timerange];
  }
  else {
    memset(v75, 0, sizeof(v75));
  }
  [(VCPMovieHighlightAnalyzer *)self computeVoiceScoreInTimeRange:v75];
  objc_msgSend(v5, "setVoiceScore:");
  if (v5) {
    [v5 timerange];
  }
  else {
    memset(v74, 0, sizeof(v74));
  }
  [(VCPMovieHighlightAnalyzer *)self computeHumanActionScoreInTimerange:v74];
  objc_msgSend(v5, "setHumanActionScore:");
  if (v5) {
    [v5 timerange];
  }
  else {
    memset(v73, 0, sizeof(v73));
  }
  [(VCPMovieHighlightAnalyzer *)self computeHumanPoseScoreInTimerange:v73];
  objc_msgSend(v5, "setHumanPoseScore:");
  BOOL v16 = v7 >= 0.405 || v7 <= 0.3;
  BOOL v17 = v16 || v9 <= 0.7;
  float v63 = v9;
  if (v17) {
    float v18 = v7;
  }
  else {
    float v18 = v9;
  }
  [v5 expressionScore];
  float v20 = v19;
  [v5 humanPoseScore];
  float v22 = v21 * 0.5;
  if (v20 >= v22) {
    float v23 = v20;
  }
  else {
    float v23 = v22;
  }
  [v5 actionScore];
  float v25 = v24;
  [v5 humanActionScore];
  float v27 = v26;
  [v5 voiceScore];
  float v29 = (float)(v13 + v25) + (float)(v27 * 1.5);
  BOOL v30 = *(float *)&v28 > 0.8;
  BOOL v31 = v23 > 0.6;
  if (v30 && v31) {
    *(float *)&double v28 = *(float *)&v28 + *(float *)&v28;
  }
  float v32 = 0.1;
  if (v30 && v31) {
    float v32 = 0.5;
  }
  if (v29 >= 0.2 || v23 >= 0.2)
  {
    if (v23 >= v29) {
      float v33 = v23;
    }
    else {
      float v33 = (float)(v13 + v25) + (float)(v27 * 1.5);
    }
    float v34 = (float)(v29 * 0.25) + (float)(v23 * 0.25);
    if (*(float *)&v28 >= v33) {
      *(float *)&double v28 = (float)(v34 + (float)(v32 * *(float *)&v28)) / (float)(v32 + 0.5);
    }
    else {
      *(float *)&double v28 = v34 + v34;
    }
  }
  else
  {
    objc_msgSend(v5, "voiceScore", v28);
    *(float *)&double v28 = (float)(v15 * 0.4) + (float)(*(float *)&v28 * 0.07);
  }
  [v5 setScore:v28];
  [v5 score];
  float v36 = v35 / 1.5;
  float v37 = 1.0;
  if (v36 < 1.0) {
    float v37 = v36;
  }
  BOOL v16 = v36 > 0.0;
  double v38 = 0.0;
  if (v16) {
    *(float *)&double v38 = v37;
  }
  [v5 setScore:v38];
  if ((self->_preferredTimeRange.start.value & 0x100000000) != 0
    && (self->_preferredTimeRange.duration.value & 0x100000000) != 0
    && !*(void *)&self->_preferredTimeRange.duration.timescale
    && (self->_preferredTimeRange.start.epoch & 0x8000000000000000) == 0)
  {
    memset(v83, 0, 48);
    long long v40 = *(_OWORD *)&self->_preferredTimeRange.start.timescale;
    *(_OWORD *)&range.start.CMTimeValue value = *(_OWORD *)&self->_verbose;
    *(_OWORD *)&range.start.CMTimeEpoch epoch = v40;
    *(_OWORD *)&range.duration.CMTimeScale timescale = *(_OWORD *)&self->_preferredTimeRange.duration.value;
    if (v5) {
      [v5 timerange];
    }
    else {
      memset(&otherRange, 0, sizeof(otherRange));
    }
    CMTimeRangeGetIntersection((CMTimeRange *)v83, &range, &otherRange);
    CMTime time = *(CMTime *)&v83[24];
    double Seconds = CMTimeGetSeconds(&time);
    if (v5)
    {
      [v5 timerange];
    }
    else
    {
      memset(v68, 0, sizeof(v68));
      long long v67 = 0u;
    }
    CMTime v69 = *(CMTime *)((char *)v68 + 8);
    double v42 = CMTimeGetSeconds(&v69);
    [v5 score];
    double v44 = (Seconds * 0.300000012 / v42 + 1.0) * v43;
    *(float *)&double v44 = v44;
    [v5 setScore:v44];
  }
  float v45 = v18 * v11;
  if ((float)(v18 * v11) <= 0.405)
  {
    LODWORD(v39) = -1.0;
    [v5 setScore:v39];
  }
  if (self->_isLivePhoto && (int)MediaAnalysisLogLevel() >= 7)
  {
    long long v46 = VCPLogInstance();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    {
      if (v5)
      {
        [v5 timerange];
      }
      else
      {
        memset(v68, 0, sizeof(v68));
        long long v67 = 0u;
      }
      *(_OWORD *)&v66.CMTimeValue value = v67;
      v66.CMTimeEpoch epoch = *(void *)&v68[0];
      Float64 v47 = CMTimeGetSeconds(&v66);
      if (v5) {
        [v5 timerange];
      }
      else {
        memset(&v64, 0, sizeof(v64));
      }
      CMTimeRangeGetEnd(&v65, &v64);
      Float64 v62 = CMTimeGetSeconds(&v65);
      CMTimeRange v48 = [v5 keyFrame];
      [v48 score];
      float v50 = v49;
      [v5 expressionScore];
      float v52 = v51;
      [v5 actionScore];
      float v54 = v53;
      [v5 voiceScore];
      float v56 = v55;
      [v5 humanActionScore];
      float v58 = v57;
      [v5 humanPoseScore];
      float v60 = v59;
      [v5 score];
      *(_DWORD *)CMTimeRange v83 = 134220544;
      *(Float64 *)&v83[4] = v47;
      *(_WORD *)&v83[12] = 2048;
      *(Float64 *)&v83[14] = v62;
      *(_WORD *)&v83[22] = 2048;
      *(double *)&v83[24] = v50;
      *(_WORD *)&v83[32] = 2048;
      *(double *)&v83[34] = v52;
      *(_WORD *)&v83[42] = 2048;
      *(double *)&v83[44] = v54;
      __int16 v84 = 2048;
      double v85 = v56;
      __int16 v86 = 2048;
      double v87 = v58;
      __int16 v88 = 2048;
      double v89 = v60;
      __int16 v90 = 2048;
      double v91 = v45;
      __int16 v92 = 2048;
      double v93 = v63;
      __int16 v94 = 2048;
      double v95 = v61;
      _os_log_impl(&dword_1BBEDA000, v46, OS_LOG_TYPE_DEBUG, "[%.2f - %.2f] keyFrameScore=%.2f, expressionScore=%.2f, actionScore=%.2f, voiceScore=%.2f, humanActionScore=%.2f, humanPoseScore=%0.2f, qualityJunkScore = %.2f, mlQualityScore = %.2f, Score=%.2f", v83, 0x70u);
    }
  }
}

- (float)computeExpressionScoreInTimerange:(id *)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = self->_faceResults;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (!v4)
  {

    return 0.0;
  }
  uint64_t v5 = *(void *)v35;
  float v6 = 0.0;
  float v7 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v35 != v5) {
        objc_enumerationMutation(obj);
      }
      CFDictionaryRef v9 = *(const __CFDictionary **)(*((void *)&v34 + 1) + 8 * i);
      memset(&v33, 0, sizeof(v33));
      CMTimeRangeMakeFromDictionary(&v33, v9);
      CMTimeRange range = v33;
      memset(&v32, 0, sizeof(v32));
      long long v10 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&otherRange.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&otherRange.start.CMTimeEpoch epoch = v10;
      *(_OWORD *)&otherRange.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetIntersection(&v32, &range, &otherRange);
      if ((v32.start.flags & 1) != 0
        && (v32.duration.flags & 1) != 0
        && !v32.duration.epoch
        && (v32.duration.value & 0x8000000000000000) == 0)
      {
        CMTime time1 = v32.duration;
        CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
        if (!CMTimeCompare(&time1, &time2)) {
          continue;
        }
      }
      float v11 = [(__CFDictionary *)v9 objectForKey:@"attributes"];
      float v12 = [v11 objectForKey:@"faceBounds"];
      float v13 = [(__CFDictionary *)v9 objectForKey:@"flags"];
      char v14 = [v13 intValue];
      NSRect v40 = NSRectFromString(v12);
      float v15 = v40.size.width * v40.size.height + -0.170000002;
      float v16 = -[VCPMovieHighlightAnalyzer computeExpressionScoreInTimerange:]::kAreaSigma[v15 > 0.0];
      CMTime time = v32.duration;
      double Seconds = CMTimeGetSeconds(&time);
      float v18 = expf((float)-(float)(v15 * v15) / v16);
      if ((v14 & 2) != 0) {
        float v19 = 0.3;
      }
      else {
        float v19 = 0.0;
      }
      float v20 = v19 + v18;
      if (v20 < 1.0) {
        float v21 = v20;
      }
      else {
        float v21 = 1.0;
      }
      if (v20 <= 0.0) {
        float v22 = 0.0;
      }
      else {
        float v22 = v21;
      }

      float v23 = Seconds;
      float v7 = v7 + (float)(v22 * v23);
      float v6 = v6 + v23;
    }
    uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  }
  while (v4);

  if (v6 == 0.0) {
    return 0.0;
  }
  float v24 = 1.0;
  if ((float)(v7 / v6) < 1.0) {
    float v24 = v7 / v6;
  }
  float result = 0.0;
  if ((float)(v7 / v6) > 0.0) {
    return v24;
  }
  return result;
}

- (float)expressionScoreForTimerange:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v4 = self->_keyFrameResults;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v5)
  {

    return 0.0;
  }
  uint64_t v6 = *(void *)v22;
  float v7 = 0.0;
  float v8 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v22 != v6) {
        objc_enumerationMutation(v4);
      }
      long long v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
      long long v11 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&range.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&range.start.CMTimeEpoch epoch = v11;
      *(_OWORD *)&range.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
      if (v10) {
        [v10 timestamp];
      }
      else {
        memset(&time, 0, sizeof(time));
      }
      if (CMTimeRangeContainsTime(&range, &time))
      {
        [v10 expressionChangeScore];
        float v13 = v12;
        [v10 expressionChangeScore];
        float v15 = v14;
        [v10 expressionChangeScore];
        float v8 = v8 + (float)(v13 * v15);
        float v7 = v7 + v16;
      }
    }
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  }
  while (v5);

  if (v7 == 0.0) {
    return 0.0;
  }
  float v17 = 1.0;
  if ((float)(v8 / v7) < 1.0) {
    float v17 = v8 / v7;
  }
  float result = 0.0;
  if ((float)(v8 / v7) > 0.0) {
    return v17;
  }
  return result;
}

- (float)computeSubtleMotionScoreInTimerange:(id *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  memset(&v37, 0, sizeof(v37));
  long long v5 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.CMTimeEpoch epoch = v5;
  *(_OWORD *)&range.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v37, &range);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v6 = self->_subtleMotionResults;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v32 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v33;
    float v9 = 0.0;
    long long v10 = (CMTime *)MEMORY[0x1E4F1FA48];
    float v11 = 0.0;
    float v12 = 0.0;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v33 != v8) {
        objc_enumerationMutation(v6);
      }
      CFDictionaryRef v14 = *(const __CFDictionary **)(*((void *)&v32 + 1) + 8 * v13);
      memset(&v31, 0, sizeof(v31));
      CMTimeRangeMakeFromDictionary(&v31, v14);
      *(_OWORD *)&time1.start.CMTimeValue value = *(_OWORD *)&v31.start.value;
      time1.start.CMTimeEpoch epoch = v31.start.epoch;
      CMTime time2 = v37;
      if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0) {
        break;
      }
      CMTimeRange v29 = v31;
      memset(&time1, 0, sizeof(time1));
      long long v15 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&otherRange.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&otherRange.start.CMTimeEpoch epoch = v15;
      *(_OWORD *)&otherRange.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetIntersection(&time1, &v29, &otherRange);
      if ((time1.start.flags & 1) == 0
        || (time1.duration.flags & 1) == 0
        || time1.duration.epoch
        || time1.duration.value < 0
        || (CMTime duration = time1.duration, v26 = *v10, CMTimeCompare(&duration, &v26)))
      {
        float v16 = [(__CFDictionary *)v14 objectForKey:@"quality"];
        [v16 floatValue];
        float v18 = v17;

        CMTime time = time1.duration;
        float Seconds = CMTimeGetSeconds(&time);
        float v12 = v12 + (float)(v18 * Seconds);
        float v9 = v9 + Seconds;
        if (v11 <= v18) {
          float v11 = v18;
        }
      }
      if (v7 == ++v13)
      {
        uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v32 objects:v39 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }

    if (v9 != 0.0)
    {
      $3CC8671D27C23BF42ADDB32F2B5E48AE var1 = a3->var1;
      float v12 = v12 / CMTimeGetSeconds((CMTime *)&var1);
    }
  }
  else
  {

    float v11 = 0.0;
    float v12 = 0.0;
  }
  float v20 = (float)(erff((float)((float)((float)(v11 + v12) * 0.5) * 6.0) + -1.8) * 0.5) + 0.5;
  float v21 = 1.0;
  if (v20 < 1.0) {
    float v21 = v20;
  }
  BOOL v22 = v20 > 0.0;
  float result = 0.0;
  if (v22) {
    return v21;
  }
  return result;
}

- (float)computeActionScoreInTimerange:(id *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  memset(&v37, 0, sizeof(v37));
  long long v5 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.CMTimeEpoch epoch = v5;
  *(_OWORD *)&range.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v37, &range);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v6 = self->_actionResults;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v32 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v33;
    float v9 = 0.0;
    long long v10 = (CMTime *)MEMORY[0x1E4F1FA48];
    float v11 = 0.0;
    float v12 = 0.0;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v33 != v8) {
        objc_enumerationMutation(v6);
      }
      CFDictionaryRef v14 = *(const __CFDictionary **)(*((void *)&v32 + 1) + 8 * v13);
      memset(&v31, 0, sizeof(v31));
      CMTimeRangeMakeFromDictionary(&v31, v14);
      *(_OWORD *)&time1.start.CMTimeValue value = *(_OWORD *)&v31.start.value;
      time1.start.CMTimeEpoch epoch = v31.start.epoch;
      CMTime time2 = v37;
      if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0) {
        break;
      }
      CMTimeRange v29 = v31;
      memset(&time1, 0, sizeof(time1));
      long long v15 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&otherRange.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&otherRange.start.CMTimeEpoch epoch = v15;
      *(_OWORD *)&otherRange.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetIntersection(&time1, &v29, &otherRange);
      if ((time1.start.flags & 1) == 0
        || (time1.duration.flags & 1) == 0
        || time1.duration.epoch
        || time1.duration.value < 0
        || (CMTime duration = time1.duration, v26 = *v10, CMTimeCompare(&duration, &v26)))
      {
        float v16 = [(__CFDictionary *)v14 objectForKey:@"quality"];
        [v16 floatValue];
        float v18 = v17;

        CMTime time = time1.duration;
        float Seconds = CMTimeGetSeconds(&time);
        float v12 = v12 + (float)(v18 * Seconds);
        float v9 = v9 + Seconds;
        if (v11 <= v18) {
          float v11 = v18;
        }
      }
      if (v7 == ++v13)
      {
        uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v32 objects:v39 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }

    if (v9 != 0.0)
    {
      $3CC8671D27C23BF42ADDB32F2B5E48AE var1 = a3->var1;
      float v12 = v12 / CMTimeGetSeconds((CMTime *)&var1);
    }
  }
  else
  {

    float v11 = 0.0;
    float v12 = 0.0;
  }
  float v20 = (float)(erff((float)((float)((float)(v11 + v12) * 0.5) * 6.0) + -1.8) * 0.5) + 0.5;
  float v21 = 1.0;
  if (v20 < 1.0) {
    float v21 = v20;
  }
  BOOL v22 = v20 > 0.0;
  float result = 0.0;
  if (v22) {
    return v21;
  }
  return result;
}

- (float)computeHumanActionScoreInTimerange:(id *)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  memset(&v55, 0, sizeof(v55));
  long long v5 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.CMTimeEpoch epoch = v5;
  *(_OWORD *)&range.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v55, &range);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v6 = self->_cameraMotionResults;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v51;
    float v9 = 0.0;
    float v10 = 0.0;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v51 != v8) {
        objc_enumerationMutation(v6);
      }
      CFDictionaryRef v12 = *(const __CFDictionary **)(*((void *)&v50 + 1) + 8 * v11);
      memset(&v49, 0, sizeof(v49));
      CMTimeRangeMakeFromDictionary(&v49, v12);
      *(_OWORD *)&time1.start.CMTimeValue value = *(_OWORD *)&v49.start.value;
      time1.start.CMTimeEpoch epoch = v49.start.epoch;
      CMTime time2 = v55;
      if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0) {
        break;
      }
      CMTimeRange v47 = v49;
      memset(&time1, 0, sizeof(time1));
      long long v13 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&otherRange.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&otherRange.start.CMTimeEpoch epoch = v13;
      *(_OWORD *)&otherRange.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetIntersection(&time1, &v47, &otherRange);
      if ((time1.start.flags & 1) == 0
        || (time1.duration.flags & 1) == 0
        || time1.duration.epoch
        || time1.duration.value < 0
        || (v45 = time1.duration, CMTime v44 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48], CMTimeCompare(&v45, &v44)))
      {
        CFDictionaryRef v14 = [(__CFDictionary *)v12 objectForKeyedSubscript:@"flags"];
        char v15 = [v14 unsignedIntegerValue];

        if ((v15 & 0x40) != 0)
        {
          CMTime time = time1.duration;
          float v10 = CMTimeGetSeconds(&time) + v10;
        }
        CMTime duration = time1.duration;
        float v9 = CMTimeGetSeconds(&duration) + v9;
      }
      if (v7 == ++v11)
      {
        uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v50 objects:v58 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }

    if (v9 != 0.0)
    {
      BOOL v16 = (float)(v10 / v9) > 0.8;
      goto LABEL_21;
    }
  }
  else
  {
  }
  BOOL v16 = 0;
LABEL_21:
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  float v17 = self->_humanActionResults;
  uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v38 objects:v57 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v39;
    float v20 = 0.0;
    float v21 = 0.0;
    float v22 = 0.0;
LABEL_23:
    uint64_t v23 = 0;
    while (1)
    {
      if (*(void *)v39 != v19) {
        objc_enumerationMutation(v17);
      }
      CFDictionaryRef v24 = *(const __CFDictionary **)(*((void *)&v38 + 1) + 8 * v23);
      memset(&v49, 0, sizeof(v49));
      CMTimeRangeMakeFromDictionary(&v49, v24);
      *(_OWORD *)&time1.start.CMTimeValue value = *(_OWORD *)&v49.start.value;
      time1.start.CMTimeEpoch epoch = v49.start.epoch;
      CMTime time2 = v55;
      if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0) {
        break;
      }
      memset(&time1, 0, sizeof(time1));
      CMTimeRange v37 = v49;
      long long v25 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&v36.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&v36.start.CMTimeEpoch epoch = v25;
      *(_OWORD *)&v36.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetIntersection(&time1, &v37, &v36);
      if ((time1.start.flags & 1) == 0
        || (time1.duration.flags & 1) == 0
        || time1.duration.epoch
        || time1.duration.value < 0
        || (v35 = time1.duration, CMTime v34 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48], CMTimeCompare(&v35, &v34)))
      {
        CMTime v26 = [(__CFDictionary *)v24 objectForKeyedSubscript:@"attributes"];
        if (v16) {
          [v26 objectForKeyedSubscript:@"absoluteScore"];
        }
        else {
        float v27 = [v26 objectForKeyedSubscript:@"relativeScore"];
        }
        [v27 floatValue];
        float v29 = v28;

        CMTime v33 = time1.duration;
        float Seconds = CMTimeGetSeconds(&v33);
        float v22 = v22 + (float)(v29 * Seconds);
        float v21 = v21 + Seconds;
        if (v20 <= v29) {
          float v20 = v29;
        }
      }
      if (v18 == ++v23)
      {
        uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v38 objects:v57 count:16];
        if (v18) {
          goto LABEL_23;
        }
        break;
      }
    }

    if (v21 != 0.0)
    {
      CMTime var1 = (CMTime)a3->var1;
      float v22 = v22 / CMTimeGetSeconds(&var1);
    }
  }
  else
  {

    float v20 = 0.0;
    float v22 = 0.0;
  }
  return (float)(v20 + v22) * 0.5;
}

- (float)computeHumanPoseScoreInTimerange:(id *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  memset(&v37, 0, sizeof(v37));
  long long v5 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.CMTimeEpoch epoch = v5;
  *(_OWORD *)&range.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v37, &range);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v6 = self->_humanActionResults;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v32 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v33;
    float v9 = 0.0;
    float v10 = 0.0;
    float v11 = 0.0;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v33 != v8) {
        objc_enumerationMutation(v6);
      }
      CFDictionaryRef v13 = *(const __CFDictionary **)(*((void *)&v32 + 1) + 8 * v12);
      memset(&v31, 0, sizeof(v31));
      CMTimeRangeMakeFromDictionary(&v31, v13);
      *(_OWORD *)&time1.start.CMTimeValue value = *(_OWORD *)&v31.start.value;
      time1.start.CMTimeEpoch epoch = v31.start.epoch;
      CMTime time2 = v37;
      if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0) {
        break;
      }
      CMTimeRange v29 = v31;
      memset(&time1, 0, sizeof(time1));
      long long v14 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&otherRange.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&otherRange.start.CMTimeEpoch epoch = v14;
      *(_OWORD *)&otherRange.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetIntersection(&time1, &v29, &otherRange);
      if ((time1.start.flags & 1) == 0
        || (time1.duration.flags & 1) == 0
        || time1.duration.epoch
        || time1.duration.value < 0
        || (CMTime duration = time1.duration, v26 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48], CMTimeCompare(&duration, &v26)))
      {
        char v15 = [(__CFDictionary *)v13 objectForKeyedSubscript:@"attributes"];
        BOOL v16 = [v15 objectForKeyedSubscript:@"humanScore"];
        [v16 floatValue];
        float v18 = v17;

        CMTime time = time1.duration;
        float Seconds = CMTimeGetSeconds(&time);
        float v11 = v11 + (float)(v18 * Seconds);
        float v9 = v9 + Seconds;
        if (v10 <= v18) {
          float v10 = v18;
        }
      }
      if (v7 == ++v12)
      {
        uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v32 objects:v39 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }

    if (v9 != 0.0)
    {
      $3CC8671D27C23BF42ADDB32F2B5E48AE var1 = a3->var1;
      float v11 = v11 / CMTimeGetSeconds((CMTime *)&var1);
    }
  }
  else
  {

    float v10 = 0.0;
    float v11 = 0.0;
  }
  float v20 = (float)(v10 + v11) * 0.5;
  float v21 = 1.0;
  if (v20 < 1.0) {
    float v21 = (float)(v10 + v11) * 0.5;
  }
  BOOL v22 = v20 > 0.0;
  float result = 0.0;
  if (v22) {
    return v21;
  }
  return result;
}

- (float)computeVoiceScoreInTimeRange:(id *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  CMTime time = (CMTime)a3->var1;
  double Seconds = CMTimeGetSeconds(&time);
  memset(&v31, 0, sizeof(v31));
  long long v6 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.CMTimeEpoch epoch = v6;
  *(_OWORD *)&range.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v31, &range);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v7 = self->_voiceResults;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v27;
    float v10 = 0.0;
    float v11 = (CMTime *)MEMORY[0x1E4F1FA48];
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v27 != v9) {
        objc_enumerationMutation(v7);
      }
      CFDictionaryRef v13 = *(const __CFDictionary **)(*((void *)&v26 + 1) + 8 * v12);
      memset(&v25, 0, sizeof(v25));
      CMTimeRangeMakeFromDictionary(&v25, v13);
      *(_OWORD *)&time1.start.CMTimeValue value = *(_OWORD *)&v25.start.value;
      time1.start.CMTimeEpoch epoch = v25.start.epoch;
      CMTime time2 = v31;
      if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0) {
        break;
      }
      CMTimeRange v23 = v25;
      memset(&time1, 0, sizeof(time1));
      long long v14 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&otherRange.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&otherRange.start.CMTimeEpoch epoch = v14;
      *(_OWORD *)&otherRange.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetIntersection(&time1, &v23, &otherRange);
      if ((time1.start.flags & 1) == 0
        || (time1.duration.flags & 1) == 0
        || time1.duration.epoch
        || time1.duration.value < 0
        || (CMTime v21 = time1.duration, v20 = *v11, CMTimeCompare(&v21, &v20)))
      {
        CMTime duration = time1.duration;
        float v10 = CMTimeGetSeconds(&duration) + v10;
      }
      if (v8 == ++v12)
      {
        uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    float v10 = 0.0;
  }

  float v15 = Seconds;
  float v16 = v10 / v15;
  BOOL v17 = v15 == 0.0;
  float result = 0.0;
  if (!v17) {
    return v16;
  }
  return result;
}

- (int)postProcessMLHighlightScore
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v3 = self->_mlHighlightScoreResults;
  uint64_t v4 = (NSArray *)[(NSArray *)v3 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (!v4)
  {
LABEL_25:

    goto LABEL_26;
  }
  uint64_t v5 = *(void *)v35;
  float v6 = 0.0;
  float v7 = 1.0;
  do
  {
    for (uint64_t i = 0; i != v4; uint64_t i = (NSArray *)((char *)i + 1))
    {
      if (*(void *)v35 != v5) {
        objc_enumerationMutation(v3);
      }
      uint64_t v9 = *(void **)(*((void *)&v34 + 1) + 8 * i);
      float v10 = [v9 objectForKeyedSubscript:@"quality"];
      [v10 floatValue];
      if (v11 >= v6) {
        float v6 = v11;
      }

      uint64_t v12 = [v9 objectForKeyedSubscript:@"quality"];
      [v12 floatValue];
      if (v7 >= v13) {
        float v7 = v13;
      }
    }
    uint64_t v4 = (NSArray *)[(NSArray *)v3 countByEnumeratingWithState:&v34 objects:v39 count:16];
  }
  while (v4);

  if (v6 > 0.0 && v6 > v7)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    float v15 = *(float *)&self->_contextResults;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v3 = self->_mlHighlightScoreResults;
    uint64_t v16 = [(NSArray *)v3 countByEnumeratingWithState:&v30 objects:v38 count:16];
    uint64_t v17 = v16;
    if (v16)
    {
      uint64_t v18 = *(void *)v31;
      float v19 = v15 / v6;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v31 != v18) {
            objc_enumerationMutation(v3);
          }
          CMTime v21 = *(void **)(*((void *)&v30 + 1) + 8 * v20);
          BOOL v22 = objc_msgSend(v21, "mutableCopy", (void)v30);
          CMTimeRange v23 = [v21 objectForKeyedSubscript:@"quality"];
          [v23 floatValue];
          float v25 = v24;

          *(float *)&double v26 = v19 * v25;
          long long v27 = [NSNumber numberWithFloat:v26];
          [v22 setObject:v27 forKeyedSubscript:@"quality"];

          [(NSArray *)v4 addObject:v22];
          ++v20;
        }
        while (v17 != v20);
        uint64_t v17 = [(NSArray *)v3 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v17);
    }
    goto LABEL_25;
  }
  uint64_t v4 = 0;
LABEL_26:
  mlHighlightScoreResults = self->_mlHighlightScoreResults;
  self->_mlHighlightScoreResults = v4;

  return 0;
}

- (int)combineMLHighlightScore
{
  if (self->_mlHighlightScoreResults && [(NSMutableArray *)self->_internalResults count])
  {
    unint64_t v3 = 0;
    float v4 = 0.0;
    float v5 = 0.0;
    do
    {
      float v6 = -[NSMutableArray objectAtIndexedSubscript:](self->_internalResults, "objectAtIndexedSubscript:", v3, v21, v22, v23);
      float v7 = v6;
      if (v6)
      {
        [v6 timerange];
      }
      else
      {
        long long v22 = 0u;
        long long v23 = 0u;
        long long v21 = 0u;
      }
      [(VCPMovieHighlightAnalyzer *)self computeMLHighlightScoreForTimerange:&v21];
      float v9 = v8;
      [v7 score];
      if (v10 >= 0.0)
      {
        if (v9 < 0.0 || v9 < 0.3 && ([v7 score], v14 > 0.3))
        {
          if (v5 <= 0.0 || v4 <= 0.0 || (float)(vabds_f32(v4, v5) / (float)(v5 + v4)) >= 0.33)
          {
            objc_msgSend(v7, "score", v21, v22, v23);
            float v4 = v17;
          }
          else
          {
            [v7 score];
            float v12 = v4 * (float)(v11 / v5);
            if (v12 < 1.0) {
              float v13 = v12;
            }
            else {
              float v13 = 1.0;
            }
            if (v12 <= 0.0) {
              float v4 = 0.0;
            }
            else {
              float v4 = v13;
            }
          }
          objc_msgSend(v7, "score", v21, v22, v23);
          float v5 = v18;
          *(float *)&double v19 = v4;
          [v7 setScore:v19];
        }
        else
        {
          objc_msgSend(v7, "score", v21, v22, v23);
          float v5 = v15;
          *(float *)&double v16 = v9;
          [v7 setScore:v16];
          float v4 = v9;
        }
        [(NSMutableArray *)self->_internalResults replaceObjectAtIndex:v3 withObject:v7];
      }

      ++v3;
    }
    while (v3 < [(NSMutableArray *)self->_internalResults count]);
  }
  return 0;
}

- (float)computeMLHighlightScoreForTimerange:(id *)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  memset(&v39, 0, sizeof(v39));
  long long v5 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.CMTimeEpoch epoch = v5;
  *(_OWORD *)&range.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v39, &range);
  float v6 = (CMTime *)MEMORY[0x1E4F1FA48];
  long long v7 = *MEMORY[0x1E4F1FA48];
  v37.CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  *(_OWORD *)&v37.CMTimeValue value = v7;
  float v8 = self->_mlHighlightScoreResults;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v34;
    float v11 = 0.0;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v34 != v10) {
        objc_enumerationMutation(v8);
      }
      CFDictionaryRef v13 = *(const __CFDictionary **)(*((void *)&v33 + 1) + 8 * v12);
      memset(&v32, 0, sizeof(v32));
      CMTimeRangeMakeFromDictionary(&v32, v13);
      *(_OWORD *)&time1.start.CMTimeValue value = *(_OWORD *)&v32.start.value;
      time1.start.CMTimeEpoch epoch = v32.start.epoch;
      CMTime time2 = v39;
      if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0) {
        break;
      }
      CMTimeRange v30 = v32;
      memset(&time1, 0, sizeof(time1));
      long long v14 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&otherRange.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&otherRange.start.CMTimeEpoch epoch = v14;
      *(_OWORD *)&otherRange.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetIntersection(&time1, &v30, &otherRange);
      if ((time1.start.flags & 1) == 0
        || (time1.duration.flags & 1) == 0
        || time1.duration.epoch
        || time1.duration.value < 0
        || (duration = time1.duration, CMTime v27 = *v6, CMTimeCompare(&duration, &v27)))
      {
        float v15 = [(__CFDictionary *)v13 objectForKeyedSubscript:@"quality"];
        [v15 floatValue];
        float v17 = v16;

        CMTime time = time1.duration;
        double Seconds = CMTimeGetSeconds(&time);
        CMTime lhs = v37;
        CMTime rhs = time1.duration;
        CMTimeAdd(&time2, &lhs, &rhs);
        CMTime v37 = time2;
        float v19 = Seconds;
        float v11 = v11 + (float)(v17 * v19);
      }
      if (v9 == ++v12)
      {
        uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v33 objects:v43 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    float v11 = 0.0;
  }

  v32.CMTime start = v37;
  *(_OWORD *)&time1.start.CMTimeValue value = *(_OWORD *)&a3->var1.var0;
  time1.start.CMTimeEpoch epoch = a3->var1.var3;
  int32_t v20 = CMTimeCompare(&v32.start, &time1.start);
  float result = -1.0;
  if (!v20)
  {
    CMTime v25 = v37;
    float v22 = v11 / CMTimeGetSeconds(&v25);
    float v23 = 1.0;
    if (v22 < 1.0) {
      float v23 = v22;
    }
    BOOL v24 = v22 > 0.0;
    float result = 0.0;
    if (v24) {
      return v23;
    }
  }
  return result;
}

- (float)computeMLQualityScoreForTimerange:(id *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  memset(&v34, 0, sizeof(v34));
  long long v5 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.CMTimeEpoch epoch = v5;
  *(_OWORD *)&range.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v34, &range);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  float v6 = self->_mlQualityResults;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v29 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v30;
    float v9 = 0.0;
    uint64_t v10 = (CMTime *)MEMORY[0x1E4F1FA48];
    float v11 = 0.0;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v30 != v8) {
        objc_enumerationMutation(v6);
      }
      CFDictionaryRef v13 = *(const __CFDictionary **)(*((void *)&v29 + 1) + 8 * v12);
      memset(&v28, 0, sizeof(v28));
      CMTimeRangeMakeFromDictionary(&v28, v13);
      *(_OWORD *)&time1.start.CMTimeValue value = *(_OWORD *)&v28.start.value;
      time1.start.CMTimeEpoch epoch = v28.start.epoch;
      CMTime time2 = v34;
      if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0) {
        break;
      }
      CMTimeRange v26 = v28;
      memset(&time1, 0, sizeof(time1));
      long long v14 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&otherRange.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&otherRange.start.CMTimeEpoch epoch = v14;
      *(_OWORD *)&otherRange.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetIntersection(&time1, &v26, &otherRange);
      if ((time1.start.flags & 1) == 0
        || (time1.duration.flags & 1) == 0
        || time1.duration.epoch
        || time1.duration.value < 0
        || (v24 = time1.duration, CMTime v23 = *v10, CMTimeCompare(&v24, &v23)))
      {
        float v15 = [(__CFDictionary *)v13 objectForKeyedSubscript:@"quality"];
        [v15 floatValue];
        float v17 = v16;

        CMTime duration = time1.duration;
        float Seconds = CMTimeGetSeconds(&duration);
        float v11 = v11 + (float)(v17 * Seconds);
        float v9 = v9 + Seconds;
      }
      if (v7 == ++v12)
      {
        uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v29 objects:v36 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    float v9 = 0.0;
    float v11 = 0.0;
  }

  float result = 1.0;
  if (v9 <= 0.0) {
    float v20 = 1.0;
  }
  else {
    float v20 = v9;
  }
  float v21 = v11 / v20;
  if (v21 < 1.0) {
    float result = v21;
  }
  if (v21 <= 0.0) {
    return 0.0;
  }
  return result;
}

- (float)stickerScaledScore:(float)a3 highPrecisionThreshold:(float)a4 highRecallThreshold:(float)a5
{
  if (a3 > a4)
  {
    float v5 = (float)((float)(a3 - a4) * 0.1) / (float)(1.0 - a4);
    float v6 = 0.9;
    return v5 + v6;
  }
  float v7 = 0.0;
  if (a3 > a5)
  {
    float v5 = (float)((float)(a3 - a5) * 0.1) / (float)(1.0 - a5);
    float v6 = 0.2;
    return v5 + v6;
  }
  return v7;
}

- (float)analyzeOverallQuality:(id *)a3 isSettlingEffect:(BOOL)a4 isAnimatedSticker:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  long long v9 = *(_OWORD *)&a3->var0.var3;
  v84[0] = *(_OWORD *)&a3->var0.var0;
  v84[1] = v9;
  v84[2] = *(_OWORD *)&a3->var1.var1;
  [(VCPMovieHighlightAnalyzer *)self qualityScoreForTimerange:v84];
  float v11 = v10;
  long long v12 = *(_OWORD *)&a3->var0.var3;
  v83[0] = *(_OWORD *)&a3->var0.var0;
  v83[1] = v12;
  v83[2] = *(_OWORD *)&a3->var1.var1;
  [(VCPMovieHighlightAnalyzer *)self actionScoreForTimerange:v83];
  float v14 = v13;
  long long v15 = *(_OWORD *)&a3->var0.var3;
  v82[0] = *(_OWORD *)&a3->var0.var0;
  v82[1] = v15;
  v82[2] = *(_OWORD *)&a3->var1.var1;
  [(VCPMovieHighlightAnalyzer *)self subtleMotionScoreForTimerange:v82];
  float v17 = v16;
  long long v18 = *(_OWORD *)&a3->var0.var3;
  v81[0] = *(_OWORD *)&a3->var0.var0;
  v81[1] = v18;
  v81[2] = *(_OWORD *)&a3->var1.var1;
  [(VCPMovieHighlightAnalyzer *)self expressionScoreForTimerange:v81];
  float v20 = v19;
  float v21 = 0.5;
  if (!v6)
  {
    long long v22 = *(_OWORD *)&a3->var0.var3;
    v80[0] = *(_OWORD *)&a3->var0.var0;
    v80[1] = v22;
    v80[2] = *(_OWORD *)&a3->var1.var1;
    [(VCPMovieHighlightAnalyzer *)self voiceScoreForTimerange:v80];
    float v21 = v23;
  }
  long long v24 = *(_OWORD *)&a3->var0.var3;
  v79[0] = *(_OWORD *)&a3->var0.var0;
  v79[1] = v24;
  v79[2] = *(_OWORD *)&a3->var1.var1;
  [(VCPMovieHighlightAnalyzer *)self junkScoreForTimerange:v79 lengthScale:!v6];
  float v71 = v25;
  long long v26 = *(_OWORD *)&a3->var0.var3;
  v78[0] = *(_OWORD *)&a3->var0.var0;
  v78[1] = v26;
  v78[2] = *(_OWORD *)&a3->var1.var1;
  [(VCPMovieHighlightAnalyzer *)self cameraMotionScoreForTimerange:v78];
  float v28 = v27;
  long long v29 = *(_OWORD *)&a3->var0.var3;
  v77[0] = *(_OWORD *)&a3->var0.var0;
  v77[1] = v29;
  v77[2] = *(_OWORD *)&a3->var1.var1;
  [(VCPMovieHighlightAnalyzer *)self visualPleasingScoreForTimerange:v77];
  float v31 = v30;
  long long v32 = *(_OWORD *)&a3->var0.var3;
  v76[0] = *(_OWORD *)&a3->var0.var0;
  v76[1] = v32;
  v76[2] = *(_OWORD *)&a3->var1.var1;
  [(VCPMovieHighlightAnalyzer *)self computeHumanActionScoreInTimerange:v76];
  float v34 = v33;
  long long v35 = *(_OWORD *)&a3->var0.var3;
  v75[0] = *(_OWORD *)&a3->var0.var0;
  v75[1] = v35;
  v75[2] = *(_OWORD *)&a3->var1.var1;
  [(VCPMovieHighlightAnalyzer *)self computeHumanPoseScoreInTimerange:v75];
  if (v5)
  {
    LODWORD(v37) = 1062165545;
    *(float *)&double v36 = v14;
    LODWORD(v38) = 1045220557;
    [(VCPMovieHighlightAnalyzer *)self stickerScaledScore:v36 highPrecisionThreshold:v37 highRecallThreshold:v38];
    float v40 = v39 + 0.0;
    LODWORD(v41) = 1028443341;
    *(float *)&double v42 = v34;
    [(VCPMovieHighlightAnalyzer *)self stickerScaledScore:v42 highPrecisionThreshold:COERCE_DOUBLE(1041865114) highRecallThreshold:v41];
    float v44 = v40 + v43;
    LODWORD(v45) = 1.0;
    *(float *)&double v46 = v17;
    LODWORD(v47) = 1045220557;
    [(VCPMovieHighlightAnalyzer *)self stickerScaledScore:v46 highPrecisionThreshold:v45 highRecallThreshold:v47];
    return (float)(v44 + v48) / 3.0;
  }
  else
  {
    float v50 = v17 * 1.1;
    if (!v6) {
      float v50 = v17;
    }
    if (v14 >= v50) {
      float v50 = v14;
    }
    if (v50 < (float)(v34 * 1.5)) {
      float v50 = v34 * 1.5;
    }
    if (v50 < 0.2 && v21 < 0.2) {
      *(float *)&double v36 = *(float *)&v36 * 0.3;
    }
    float v51 = *(float *)&v36 * 0.5;
    if (v20 >= v51) {
      float v52 = v20;
    }
    else {
      float v52 = v51;
    }
    float v53 = flt_1BC282E78[v11 > 0.4];
    float v54 = v53 + 0.1;
    float v55 = 0.0;
    if (v50 >= 0.2 || v52 >= 0.2) {
      float v55 = v21 * 0.1;
    }
    float v56 = v55 + (float)(v53 * v11);
    if (v50 < 0.2 && v52 < 0.2)
    {
      if (v28 >= 0.2)
      {
        float v58 = v54 + 0.7;
        float v59 = (float)((float)((float)(v31 * 0.6) * 0.35) + (float)((float)(v28 * 0.35) * 0.6)) + v56;
      }
      else
      {
        float v57 = (float)(v52 * 0.35) + (float)(v50 * 0.25);
        float v58 = 0.7;
        float v59 = v57 + 0.0;
      }
    }
    else
    {
      float v60 = (float)((float)(v31 * 0.6) * 0.35) + (float)((float)(v28 * 0.35) * 0.6);
      float v61 = (float)((float)(v52 * 0.35) + (float)(v50 * 0.25)) + (float)(v31 * 0.35);
      float v62 = 0.7;
      if ((float)(v60 / 0.7) <= (float)(v61 / 0.95)) {
        float v62 = 0.95;
      }
      float v58 = v54 + v62;
      if ((float)(v60 / 0.7) > (float)(v61 / 0.95)) {
        float v61 = (float)((float)(v31 * 0.6) * 0.35) + (float)((float)(v28 * 0.35) * 0.6);
      }
      float v59 = v56 + v61;
    }
    float v63 = v59 / v58;
    if (v58 == 0.0) {
      float v64 = 0.0;
    }
    else {
      float v64 = v63;
    }
    float v65 = 1.0;
    if (!v6)
    {
      CMTime time = (CMTime)a3->var1;
      float v66 = (CMTimeGetSeconds(&time) + -3.0) / 424.26001;
      float v67 = erff(v66);
      CMTime var1 = (CMTime)a3->var1;
      if (CMTimeGetSeconds(&var1) <= 10.0)
      {
        float v65 = v67 + 1.0;
      }
      else
      {
        CMTime v72 = (CMTime)a3->var1;
        float v68 = (10.0 - CMTimeGetSeconds(&v72)) / 424.26001;
        float v65 = erff(v68) + 1.0;
      }
    }
    float v69 = powf((float)(v71 * v64) * v65, 0.8) * 1.25;
    if (v69 < 1.0) {
      float v70 = v69;
    }
    else {
      float v70 = 1.0;
    }
    if (v69 <= 0.0) {
      return 0.0;
    }
    else {
      return v70;
    }
  }
}

- (float)qualityScoreForTimerange:(id *)a3
{
  if (![(NSArray *)self->_qualityResults count]) {
    return 0.0;
  }
  unint64_t v5 = 0;
  BOOL v6 = (CMTime *)MEMORY[0x1E4F1FA48];
  float v7 = 0.0;
  float v8 = 0.0;
  float v9 = 1.0;
  float v10 = 0.0;
  float v11 = 0.0;
  float v29 = 1.0;
  do
  {
    CFDictionaryRef v12 = [(NSArray *)self->_qualityResults objectAtIndex:v5];
    memset(&v36, 0, sizeof(v36));
    CMTimeRangeMakeFromDictionary(&v36, v12);
    long long v13 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&range.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&range.start.CMTimeEpoch epoch = v13;
    *(_OWORD *)&range.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
    memset(&v35, 0, sizeof(v35));
    CMTimeRange otherRange = v36;
    CMTimeRangeGetIntersection(&v35, &range, &otherRange);
    CMTimeRange v36 = v35;
    if ((v35.start.flags & 1) == 0
      || (v36.duration.flags & 1) == 0
      || v36.duration.epoch
      || v36.duration.value < 0
      || (CMTime time1 = v36.duration, time2 = *v6, CMTimeCompare(&time1, &time2)))
    {
      CMTime time = v36.duration;
      double Seconds = CMTimeGetSeconds(&time);
      long long v15 = [(__CFDictionary *)v12 objectForKey:@"quality"];
      [v15 floatValue];
      float v17 = v16;

      BOOL v18 = v9 > 0.3;
      BOOL v19 = v9 <= 0.3;
      if (v17 <= 0.3) {
        float v20 = 0.0;
      }
      else {
        float v20 = 1.0;
      }
      if (v17 <= 0.3) {
        BOOL v19 = 0;
      }
      else {
        BOOL v18 = 0;
      }
      if (v18 || v19) {
        float v8 = v8 + 1.0;
      }
      NSUInteger v21 = [(NSArray *)self->_qualityResults count];
      float v22 = Seconds;
      float v11 = v11 + v22;
      float v7 = v7 + (float)(v17 * v22);
      float v10 = v10 + (float)(v20 * v22);
      if (v5 < v21 - 1)
      {
        float v23 = v29;
        if (v29 > v22) {
          float v23 = Seconds;
        }
        float v29 = v23;
      }
    }
    else
    {
      float v17 = v9;
    }

    ++v5;
    float v9 = v17;
  }
  while (v5 < [(NSArray *)self->_qualityResults count]);
  if (v11 == 0.0) {
    return 0.0;
  }
  float v24 = (float)((float)(v29 * (float)(v8 * -0.4)) / v11) + 1.0;
  float v25 = v24 * (float)((float)(v10 * (float)(v7 / v11)) / v11);
  if (v25 < 1.0) {
    float v26 = v24 * (float)((float)(v10 * (float)(v7 / v11)) / v11);
  }
  else {
    float v26 = 1.0;
  }
  BOOL v27 = v25 > 0.0;
  float result = 0.0;
  if (v27) {
    return v26;
  }
  return result;
}

- (float)actionScoreForTimerange:(id *)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  memset(&v63, 0, sizeof(v63));
  long long v3 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.CMTimeEpoch epoch = v3;
  *(_OWORD *)&range.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v63, &range);
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  obuint64_t j = self->_actionResults;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v58 objects:v66 count:16];
  if (v4)
  {
    uint64_t v36 = *(void *)v59;
    float v5 = 0.0;
    BOOL v6 = (CMTime *)MEMORY[0x1E4F1FA48];
    float v7 = 0.0;
LABEL_3:
    uint64_t v35 = v4;
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v59 != v36) {
        objc_enumerationMutation(obj);
      }
      CFDictionaryRef v9 = *(const __CFDictionary **)(*((void *)&v58 + 1) + 8 * v8);
      memset(&v57, 0, sizeof(v57));
      CMTimeRangeMakeFromDictionary(&v57, v9);
      *(_OWORD *)&time1.start.CMTimeValue value = *(_OWORD *)&v57.start.value;
      time1.start.CMTimeEpoch epoch = v57.start.epoch;
      time2.CMTime start = v63;
      if ((CMTimeCompare(&time1.start, &time2.start) & 0x80000000) == 0) {
        break;
      }
      CMTimeRange v55 = v57;
      memset(&time1, 0, sizeof(time1));
      long long v10 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&otherRange.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&otherRange.start.CMTimeEpoch epoch = v10;
      *(_OWORD *)&otherRange.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetIntersection(&time1, &v55, &otherRange);
      if ((time1.start.flags & 1) == 0
        || (time1.duration.flags & 1) == 0
        || time1.duration.epoch
        || time1.duration.value < 0
        || (v53 = time1.duration, CMTime v52 = *v6, CMTimeCompare(&v53, &v52)))
      {
        float v11 = [(__CFDictionary *)v9 objectForKey:@"quality"];
        float v37 = v7;
        [v11 floatValue];
        float v13 = v12;

        CMTime time = time1.duration;
        double Seconds = CMTimeGetSeconds(&time);
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v15 = self->_qualityResults;
        uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v47 objects:v65 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v48;
          float v18 = 0.0;
LABEL_14:
          uint64_t v19 = 0;
          while (1)
          {
            if (*(void *)v48 != v17) {
              objc_enumerationMutation(v15);
            }
            CFDictionaryRef v20 = *(const __CFDictionary **)(*((void *)&v47 + 1) + 8 * v19);
            memset(&time2, 0, sizeof(time2));
            CMTimeRangeMakeFromDictionary(&time2, v20);
            CMTimeRange v44 = time1;
            CMTimeRangeGetEnd(&v45, &v44);
            *(_OWORD *)&v43.start.CMTimeValue value = *(_OWORD *)&time2.start.value;
            v43.start.CMTimeEpoch epoch = time2.start.epoch;
            CMTime v64 = v45;
            if ((CMTimeCompare(&v43.start, &v64) & 0x80000000) == 0) {
              break;
            }
            CMTimeRange v42 = time1;
            memset(&v43, 0, sizeof(v43));
            CMTimeRange v41 = time2;
            CMTimeRangeGetIntersection(&v43, &v42, &v41);
            NSUInteger v21 = [(__CFDictionary *)v20 objectForKey:@"quality"];
            [v21 floatValue];
            float v23 = v22;

            if ((v43.start.flags & 1) == 0
              || (v43.duration.flags & 1) == 0
              || v43.duration.epoch
              || v43.duration.value < 0
              || (v40 = v43.duration, CMTime v39 = *v6, CMTimeCompare(&v40, &v39)))
            {
              CMTime duration = v43.duration;
              double v24 = CMTimeGetSeconds(&duration);
              if (v23 <= 0.3) {
                double v25 = 0.0;
              }
              else {
                double v25 = 1.0;
              }
              float v18 = v18 + v25 * v24;
            }
            if (v16 == ++v19)
            {
              uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v47 objects:v65 count:16];
              if (v16) {
                goto LABEL_14;
              }
              break;
            }
          }
        }
        else
        {
          float v18 = 0.0;
        }

        float v26 = Seconds;
        float v5 = v5 + (float)((float)(v13 * v26) * (float)(v18 / v26));
        float v7 = v37 + v26;
      }
      if (++v8 == v35)
      {
        uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v58 objects:v66 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    float v5 = 0.0;
    float v7 = 0.0;
  }

  float v27 = v7;
  if (v7 <= 0.0) {
    float v27 = 1.0;
  }
  float v28 = (float)(erff((float)((float)(v5 / v27) * 6.0) + -1.8) * 0.5) + 0.5;
  if (v28 < 1.0) {
    float v29 = v28;
  }
  else {
    float v29 = 1.0;
  }
  BOOL v30 = v28 > 0.0;
  float result = 0.0;
  if (v30) {
    return v29;
  }
  return result;
}

- (float)voiceScoreForTimerange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var3;
  v9[0] = *(_OWORD *)&a3->var0.var0;
  v9[1] = v3;
  v9[2] = *(_OWORD *)&a3->var1.var1;
  [(VCPMovieHighlightAnalyzer *)self computeVoiceScoreInTimeRange:v9];
  float v5 = expf((float)((float)(1.0 - v4) * (float)(1.0 - v4)) * -4.0);
  if (v5 < 1.0) {
    float v6 = v5;
  }
  else {
    float v6 = 1.0;
  }
  BOOL v7 = v5 > 0.0;
  float result = 0.0;
  if (v7) {
    return v6;
  }
  return result;
}

- (float)visualPleasingScoreForTimerange:(id *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  float v4 = self->_keyFrameResults;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    int v6 = 0;
    uint64_t v7 = *(void *)v17;
    float v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v11 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&range.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&range.start.CMTimeEpoch epoch = v11;
        *(_OWORD *)&range.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
        if (v10) {
          [v10 timestamp];
        }
        else {
          memset(&time, 0, sizeof(time));
        }
        if (CMTimeRangeContainsTime(&range, &time))
        {
          [v10 visualPleasingScore];
          float v8 = v8 + v12;
          ++v6;
        }
      }
      uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);

    if (v6) {
      return v8 / (float)v6;
    }
  }
  else
  {
  }
  return -1.0;
}

- (float)cameraMotionScoreForTimerange:(id *)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  obuint64_t j = self->_qualityResults;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v60 objects:v66 count:16];
  if (v3)
  {
    uint64_t v36 = v3;
    uint64_t v37 = *(void *)v61;
    p_CMTime duration = &v59.duration;
    float v4 = 0.0;
    float v5 = 0.0;
    float v6 = 0.0;
LABEL_3:
    uint64_t v39 = 0;
    while (1)
    {
      if (*(void *)v61 != v37) {
        objc_enumerationMutation(obj);
      }
      CFDictionaryRef v7 = *(const __CFDictionary **)(*((void *)&v60 + 1) + 8 * v39);
      memset(&v59, 0, sizeof(v59));
      CMTimeRangeMakeFromDictionary(&v59, v7);
      memset(&v58, 0, sizeof(v58));
      CMTimeRange range = v59;
      CMTimeRangeGetEnd(&v58, &range);
      long long v8 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&v56.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&v56.start.CMTimeEpoch epoch = v8;
      *(_OWORD *)&v56.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetEnd(&v64, &v56);
      *(_OWORD *)&time1.start.CMTimeValue value = *(_OWORD *)&v59.start.value;
      time1.start.CMTimeEpoch epoch = v59.start.epoch;
      time2.CMTime start = v64;
      if ((CMTimeCompare(&time1.start, &time2.start) & 0x80000000) == 0) {
        break;
      }
      CMTimeRange v54 = v59;
      long long v9 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&otherRange.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&otherRange.start.CMTimeEpoch epoch = v9;
      *(_OWORD *)&otherRange.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetIntersection(&time1, &v54, &otherRange);
      CMTimeRange v59 = time1;
      if ((time1.start.flags & 1) == 0
        || (v59.duration.flags & 1) == 0
        || v59.duration.epoch
        || v59.duration.value < 0
        || (v52 = *p_duration, CMTime v51 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48], CMTimeCompare(&v52, &v51)))
      {
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v10 = self->_cameraMotionResults;
        uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v47 objects:v65 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v48;
LABEL_14:
          uint64_t v13 = 0;
          while (1)
          {
            if (*(void *)v48 != v12) {
              objc_enumerationMutation(v10);
            }
            CFDictionaryRef v14 = *(const __CFDictionary **)(*((void *)&v47 + 1) + 8 * v13);
            memset(&time1, 0, sizeof(time1));
            CMTimeRangeMakeFromDictionary(&time1, v14);
            *(_OWORD *)&time2.start.CMTimeValue value = *(_OWORD *)&time1.start.value;
            time2.start.CMTimeEpoch epoch = time1.start.epoch;
            CMTime v64 = v58;
            if ((CMTimeCompare(&time2.start, &v64) & 0x80000000) == 0) {
              break;
            }
            CMTimeRange v45 = time1;
            memset(&time2, 0, sizeof(time2));
            CMTimeRange v44 = v59;
            CMTimeRangeGetIntersection(&time2, &v45, &v44);
            if ((time2.start.flags & 1) == 0
              || (time2.duration.flags & 1) == 0
              || time2.duration.epoch
              || time2.duration.value < 0
              || (CMTime duration = time2.duration,
                  CMTime v42 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48],
                  CMTimeCompare(&duration, &v42)))
            {
              long long v15 = [(__CFDictionary *)v14 objectForKey:@"flags", p_duration];
              uint64_t v16 = [v15 integerValue];
              int v17 = v16 & 0x3FFC0;
              unsigned int v18 = __clz(__rbit32(v16 & 0x2FFC0));
              if (v19 | ((v16 & 0x2FFC0) == 0)) {
                unsigned int v20 = 0;
              }
              else {
                unsigned int v20 = v18;
              }
              CMTime time = time2.duration;
              double Seconds = CMTimeGetSeconds(&time);
              float v22 = [(__CFDictionary *)v7 objectForKey:@"quality"];
              [v22 floatValue];
              float v24 = v23;

              if ((v17 & 0x10000) != 0 || v20 - 7 >= 4 && v20 != 12) {
                goto LABEL_37;
              }
              float v25 = Seconds;
              float v26 = 0.0;
              if (v24 > 0.3)
              {
                if ((float)(v24 + 0.2) < 1.0) {
                  float v27 = v24 + 0.2;
                }
                else {
                  float v27 = 1.0;
                }
                float v28 = 0.0;
                if ((float)(v24 + 0.2) > 0.0) {
                  float v28 = v27;
                }
                float v26 = v28 * v25;
              }
              float v6 = v6 + v26;
              float v5 = v5 + v25;
              if (v4 >= v25) {
LABEL_37:
              }
                float v25 = v4;

              float v4 = v25;
            }
            if (v11 == ++v13)
            {
              uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v47 objects:v65 count:16];
              if (v11) {
                goto LABEL_14;
              }
              break;
            }
          }
        }
      }
      if (++v39 == v36)
      {
        uint64_t v36 = [(NSArray *)obj countByEnumeratingWithState:&v60 objects:v66 count:16];
        if (v36) {
          goto LABEL_3;
        }
        break;
      }
    }

    float v29 = 0.0;
    if (v4 >= 0.5 && v5 != 0.0)
    {
      CMTime var1 = (CMTime)a3->var1;
      float v29 = v6 / CMTimeGetSeconds(&var1);
    }
  }
  else
  {

    float v29 = 0.0;
  }
  float v30 = 1.0;
  if (v29 < 1.0) {
    float v30 = v29;
  }
  BOOL v31 = v29 > 0.0;
  float result = 0.0;
  if (v31) {
    return v30;
  }
  return result;
}

- (float)subtleMotionScoreForTimerange:(id *)a3
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  memset(&v84, 0, sizeof(v84));
  long long v3 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.CMTimeEpoch epoch = v3;
  *(_OWORD *)&range.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v84, &range);
  long long v82 = 0u;
  long long v81 = 0u;
  long long v80 = 0u;
  long long v79 = 0u;
  obuint64_t j = self->_subtleMotionResults;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v79 objects:v88 count:16];
  if (v4)
  {
    uint64_t v46 = *(void *)v80;
    float v48 = 0.0;
    float v5 = 0.0;
LABEL_3:
    uint64_t v6 = 0;
    uint64_t v44 = v4;
    while (1)
    {
      if (*(void *)v80 != v46) {
        objc_enumerationMutation(obj);
      }
      CFDictionaryRef v7 = *(const __CFDictionary **)(*((void *)&v79 + 1) + 8 * v6);
      memset(&v78, 0, sizeof(v78));
      CMTimeRangeMakeFromDictionary(&v78, v7);
      *(_OWORD *)&time1.start.CMTimeValue value = *(_OWORD *)&v78.start.value;
      time1.start.CMTimeEpoch epoch = v78.start.epoch;
      time2.CMTime start = v84;
      if ((CMTimeCompare(&time1.start, &time2.start) & 0x80000000) == 0) {
        break;
      }
      memset(&time1, 0, sizeof(time1));
      CMTimeRange v76 = v78;
      long long v8 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&otherRange.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&otherRange.start.CMTimeEpoch epoch = v8;
      *(_OWORD *)&otherRange.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetIntersection(&time1, &v76, &otherRange);
      if ((time1.start.flags & 1) == 0
        || (time1.duration.flags & 1) == 0
        || time1.duration.epoch
        || time1.duration.value < 0
        || (CMTime v74 = time1.duration, v73 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48], CMTimeCompare(&v74, &v73)))
      {
        long long v9 = [(__CFDictionary *)v7 objectForKey:@"quality"];
        [v9 floatValue];
        float v11 = v10;

        CMTime time = time1.duration;
        double Seconds = CMTimeGetSeconds(&time);
        long long v70 = 0u;
        long long v71 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        uint64_t v13 = self->_qualityResults;
        uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v68 objects:v87 count:16];
        float v15 = Seconds;
        if (v14)
        {
          uint64_t v16 = *(void *)v69;
          float v17 = 0.0;
LABEL_14:
          uint64_t v18 = 0;
          while (1)
          {
            if (*(void *)v69 != v16) {
              objc_enumerationMutation(v13);
            }
            CFDictionaryRef v19 = *(const __CFDictionary **)(*((void *)&v68 + 1) + 8 * v18);
            memset(&time2, 0, sizeof(time2));
            CMTimeRangeMakeFromDictionary(&time2, v19);
            CMTimeRange v65 = time1;
            CMTimeRangeGetEnd(&v66, &v65);
            *(_OWORD *)&v64.start.CMTimeValue value = *(_OWORD *)&time2.start.value;
            v64.start.CMTimeEpoch epoch = time2.start.epoch;
            CMTime v85 = v66;
            if ((CMTimeCompare(&v64.start, &v85) & 0x80000000) == 0) {
              break;
            }
            CMTimeRange v63 = time1;
            memset(&v64, 0, sizeof(v64));
            CMTimeRange v62 = time2;
            CMTimeRangeGetIntersection(&v64, &v63, &v62);
            unsigned int v20 = [(__CFDictionary *)v19 objectForKey:@"quality"];
            [v20 floatValue];
            float v22 = v21;

            if ((v64.start.flags & 1) == 0
              || (v64.duration.flags & 1) == 0
              || v64.duration.epoch
              || v64.duration.value < 0
              || (v61 = v64.duration, CMTime v60 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48], CMTimeCompare(&v61, &v60)))
            {
              CMTime duration = v64.duration;
              double v23 = CMTimeGetSeconds(&duration);
              if (v22 <= 0.0) {
                double v24 = 0.0;
              }
              else {
                double v24 = 1.0;
              }
              float v17 = v17 + v24 * v23;
            }
            if (v14 == ++v18)
            {
              uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v68 objects:v87 count:16];
              if (v14) {
                goto LABEL_14;
              }
              break;
            }
          }

          if (v17 > 0.0)
          {
            long long v57 = 0u;
            long long v58 = 0u;
            long long v55 = 0u;
            long long v56 = 0u;
            float v25 = self->_cameraMotionResults;
            uint64_t v26 = [(NSArray *)v25 countByEnumeratingWithState:&v55 objects:v86 count:16];
            if (v26)
            {
              uint64_t v27 = *(void *)v56;
              float v28 = 0.0;
LABEL_32:
              uint64_t v29 = 0;
              while (1)
              {
                if (*(void *)v56 != v27) {
                  objc_enumerationMutation(v25);
                }
                CFDictionaryRef v30 = *(const __CFDictionary **)(*((void *)&v55 + 1) + 8 * v29);
                memset(&time2, 0, sizeof(time2));
                CMTimeRangeMakeFromDictionary(&time2, v30);
                CMTimeRange v54 = time1;
                CMTimeRangeGetEnd(&v66, &v54);
                *(_OWORD *)&v64.start.CMTimeValue value = *(_OWORD *)&time2.start.value;
                v64.start.CMTimeEpoch epoch = time2.start.epoch;
                CMTime v85 = v66;
                if ((CMTimeCompare(&v64.start, &v85) & 0x80000000) == 0) {
                  break;
                }
                memset(&v64, 0, sizeof(v64));
                CMTimeRange v53 = time1;
                CMTimeRange v52 = time2;
                CMTimeRangeGetIntersection(&v64, &v53, &v52);
                if ((v64.start.flags & 1) == 0
                  || (v64.duration.flags & 1) == 0
                  || v64.duration.epoch
                  || v64.duration.value < 0
                  || (CMTime v51 = v64.duration, v50 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48], CMTimeCompare(&v51, &v50)))
                {
                  BOOL v31 = [(__CFDictionary *)v30 objectForKey:@"flags"];
                  uint64_t v32 = [v31 integerValue];
                  CMTime v49 = v64.duration;
                  double v33 = CMTimeGetSeconds(&v49);
                  if (v34 | ((v32 & 0x2FFC0) == 0)) {
                    BOOL v35 = 0;
                  }
                  else {
                    BOOL v35 = (v32 & 0x40) == 64;
                  }
                  unsigned int v36 = v35;

                  float v28 = v28 + (double)v36 * v33;
                }
                if (v26 == ++v29)
                {
                  uint64_t v26 = [(NSArray *)v25 countByEnumeratingWithState:&v55 objects:v86 count:16];
                  if (v26) {
                    goto LABEL_32;
                  }
                  break;
                }
              }
            }
            else
            {
              float v28 = 0.0;
            }

            if (v28 < v17) {
              float v17 = v28;
            }
          }
          float v37 = v17 / v15;
        }
        else
        {

          float v37 = 0.0 / v15;
        }
        float v48 = v48 + (float)((float)(v11 * v15) * v37);
        float v5 = v5 + v15;
        uint64_t v4 = v44;
      }
      if (++v6 == v4)
      {
        uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v79 objects:v88 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    float v48 = 0.0;
    float v5 = 0.0;
  }

  if (v5 <= 0.0) {
    float v38 = 1.0;
  }
  else {
    float v38 = v5;
  }
  float v39 = (float)(erff((float)((float)(v48 / v38) * 6.0) + -1.8) * 0.5) + 0.5;
  if (v39 < 1.0) {
    float v40 = v39;
  }
  else {
    float v40 = 1.0;
  }
  BOOL v41 = v39 > 0.0;
  float result = 0.0;
  if (v41) {
    return v40;
  }
  return result;
}

- (float)junkScoreForTimerange:(id *)a3 lengthScale:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v6 = self->_junkResults;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (!v7)
  {

LABEL_14:
    float v20 = 1.0;
    goto LABEL_17;
  }
  uint64_t v8 = *(void *)v30;
  float v9 = 0.0;
  float v10 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v30 != v8) {
        objc_enumerationMutation(v6);
      }
      CFDictionaryRef v12 = *(const __CFDictionary **)(*((void *)&v29 + 1) + 8 * i);
      memset(&v28, 0, sizeof(v28));
      CMTimeRangeMakeFromDictionary(&v28, v12);
      CMTimeRange range = v28;
      memset(&v27, 0, sizeof(v27));
      long long v13 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&otherRange.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&otherRange.start.CMTimeEpoch epoch = v13;
      *(_OWORD *)&otherRange.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetIntersection(&v27, &range, &otherRange);
      CMTime duration = v27.duration;
      double Seconds = CMTimeGetSeconds(&duration);
      float v15 = [(__CFDictionary *)v12 objectForKey:@"quality"];
      [v15 floatValue];
      float v17 = v16;

      float v18 = Seconds;
      float v10 = v10 + (float)(v17 * v18);
      float v9 = v9 + v18;
    }
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
  }
  while (v7);

  if (v9 == 0.0) {
    goto LABEL_14;
  }
  float v19 = v10 / v9;
  if (v4)
  {
    float v20 = (float)(v19 * (float)(erff((float)(v9 * 3.0) + -2.0) + 1.0)) * 0.5;
    if (v20 >= *(float *)&-[VCPMovieHighlightAnalyzer junkScoreForTimerange:lengthScale:]::kThreshold[4 * (v9 > 2.0)]) {
      float v20 = 1.0;
    }
  }
  else
  {
    float v20 = 1.0;
    if (v19 < 0.5) {
      float v20 = v10 / v9;
    }
  }
LABEL_17:
  float v21 = 1.0;
  if (v20 < 1.0) {
    float v21 = v20;
  }
  BOOL v22 = v20 > 0.0;
  float result = 0.0;
  if (v22) {
    return v21;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diffFlipCount.__elems_[4], 0);
  objc_storeStrong((id *)&self->_numberOfFrames, 0);
  objc_storeStrong((id *)&self->_preferredTimeRange.duration.epoch, 0);
  objc_storeStrong((id *)&self->_isMaxTrim, 0);
  objc_storeStrong((id *)&self->_internalConstraintResults, 0);
  objc_storeStrong((id *)&self->_highlightResults, 0);
  objc_storeStrong((id *)&self->_internalResults, 0);
  objc_storeStrong((id *)&self->_expressionSegments, 0);
  objc_storeStrong((id *)&self->_audioQualityResults, 0);
  objc_storeStrong((id *)&self->_mlQualityResults, 0);
  objc_storeStrong((id *)&self->_mlHighlightScoreResults, 0);
  objc_storeStrong((id *)&self->_orientationResults, 0);
  objc_storeStrong((id *)&self->_sceneResults, 0);
  objc_storeStrong((id *)&self->_keyFrameResults, 0);
  objc_storeStrong((id *)&self->_cameraMotionResults, 0);
  objc_storeStrong((id *)&self->_humanPoseResults, 0);
  objc_storeStrong((id *)&self->_humanActionResults, 0);
  objc_storeStrong((id *)&self->_featureResults, 0);
  objc_storeStrong((id *)&self->_voiceResults, 0);
  objc_storeStrong((id *)&self->_subtleMotionResults, 0);
  objc_storeStrong((id *)&self->_actionResults, 0);
  objc_storeStrong((id *)&self->_saliencyResults, 0);
  objc_storeStrong((id *)&self->_petsResults, 0);
  objc_storeStrong((id *)&self->_faceResults, 0);
  objc_storeStrong((id *)&self->_qualityResults, 0);
  objc_storeStrong((id *)&self->_junkResults, 0);
}

@end