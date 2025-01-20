@interface SceneFramingEngine
- ($680651117FADF5CC13A199869A236271)determineSceneSummaryForTracks:(SEL)a3 currentViewport:(id)a4 atTime:(CGRect)a5;
- (BOOL)isCurrentFramingIdeal:(CGRect)a3 withTolerance:(float)a4;
- (BOOL)isSubjectRectStationary:(CGRect)a3;
- (CGRect)applyNewsroomViewportAdjustments:(CGRect)a3;
- (CGRect)calculateBaselineViewportForTracks:(id)a3 atTime:(id *)a4;
- (CGRect)calculateSubjectEnclosingRectangleForTracks:(id)a3 withBaselineWidth:(float)a4 currentViewport:(CGRect)a5 atTime:(id *)a6;
- (CGRect)calculateViewportCenteredAround:(CGRect)a3 withWidth:(float)a4;
- (CGRect)computeCroppedSubjectEnclosingRectForViewportWidth:(float)a3 subjectEnclosingRect:(CGRect)a4;
- (CGRect)computeDeadbandFromViewport:(CGRect)a3;
- (CGRect)computeViewportFromDeadband:(CGRect)a3;
- (CGRect)deadband;
- (CGRect)defaultViewport;
- (CGRect)determineDeadbandForSubjectEnclosingRect:(CGRect)a3 oldDeadband:(CGRect)a4 newDeadbandWidth:(float)a5;
- (CGRect)idealViewport;
- (CGRect)slackViewport;
- (CGRect)targetViewport;
- (CGRect)undoNewsroomViewportAdjustments:(CGRect)a3;
- (CinematicFramingSessionFramingParameters)activeFramingParameters;
- (CinematicFramingSessionOptions)options;
- (SceneFramingEngine)initWithFramingSpaceManager:(id)a3;
- (float)calculateViewportWidthToFitSubjectsInDeadband:(CGRect)a3;
- (float)computeDeadbandHeightForWidth:(float)a3;
- (float)computeDeadbandHeightFromViewportHeight:(float)a3;
- (float)computeDeadbandWidthForHeight:(float)a3;
- (float)computeDeadbandWidthFromViewportWidth:(float)a3;
- (float)computeViewportWidthFromDeadbandWidth:(float)a3;
- (float)defaultScreenWidth;
- (float)minAllowedDeadbandWidth;
- (float)minAllowedScreenWidth;
- (int)framingStyle;
- (void)clearSubjectHistory;
- (void)determineTemporallyStableTargetViewportForTracks:(id)a3 currentViewport:(CGRect)a4 atTime:(id *)a5;
- (void)reset;
- (void)restoreDefaultViewportFromCurrentViewport:(CGRect)a3 atTime:(id *)a4;
- (void)setActiveFramingParameters:(id)a3;
- (void)setFramingStyle:(int)a3;
- (void)setOptions:(id)a3;
- (void)transitionToFramingState:(unsigned __int16)a3 atTime:(id *)a4;
- (void)updateDeadbandToFitScene:(id *)a3 tracks:(id)a4 currentViewport:(CGRect)a5 atTime:(id *)a6;
- (void)updateDeadbandWithSubjectRect:(CGRect)a3 atTime:(id *)a4;
- (void)updateSubjectMovement:(CGRect)a3 atTime:(id *)a4;
- (void)updateTargetViewportForFloatingWithTracks:(id)a3 atTime:(id *)a4;
- (void)updateTargetViewportWithTracks:(id)a3 currentViewport:(CGRect)a4 atTime:(id *)a5;
@end

@implementation SceneFramingEngine

- (CinematicFramingSessionFramingParameters)activeFramingParameters
{
  return self->_activeFramingParameters;
}

- (void)setActiveFramingParameters:(id)a3
{
  objc_storeStrong((id *)&self->_activeFramingParameters, a3);
  [(SceneFramingEngine *)self targetViewport];
  double x = v12.origin.x;
  double y = v12.origin.y;
  double width = v12.size.width;
  double height = v12.size.height;
  if (!CGRectIsNull(v12))
  {
    -[SceneFramingEngine computeDeadbandFromViewport:](self, "computeDeadbandFromViewport:", x, y, width, height);
    self->_deadband.origin.double x = v8;
    self->_deadband.origin.double y = v9;
    self->_deadband.size.double width = v10;
    self->_deadband.size.double height = v11;
  }
}

- (SceneFramingEngine)initWithFramingSpaceManager:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SceneFramingEngine;
  v6 = [(SceneFramingEngine *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_framingSpaceManager, a3);
    LODWORD(v7->_targetViewportForFloating.size.height) = 0;
    [(SceneFramingEngine *)v7 reset];
    CGFloat v8 = v7;
  }

  return v7;
}

- (void)updateTargetViewportWithTracks:(id)a3 currentViewport:(CGRect)a4 atTime:(id *)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  if ([v11 count])
  {
    long long v15 = *(_OWORD *)&a5->var0;
    int64_t var3 = a5->var3;
    -[SceneFramingEngine determineTemporallyStableTargetViewportForTracks:currentViewport:atTime:](self, "determineTemporallyStableTargetViewportForTracks:currentViewport:atTime:", v11, &v15, x, y, width, height);
    uint64_t v12 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&self->_recenterEndTime.epoch = *MEMORY[0x1E4F1F9F8];
    *(void *)&self->_returningHomeStartTime.timescale = *(void *)(v12 + 16);
    int64_t v13 = a5->var3;
    *(_OWORD *)&self->_lastFrameWithDetectionsTimestamp.value = *(_OWORD *)&a5->var0;
    self->_lastFrameWithDetectionsTimestamp.epoch = v13;
    BOOL v14 = 1;
  }
  else
  {
    long long v15 = *(_OWORD *)&a5->var0;
    int64_t var3 = a5->var3;
    -[SceneFramingEngine restoreDefaultViewportFromCurrentViewport:atTime:](self, "restoreDefaultViewportFromCurrentViewport:atTime:", &v15, x, y, width, height);
    BOOL v14 = 0;
  }
  self->_lastFrameHadSubjects = v14;
}

- (void)reset
{
  CGSize v8 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  CGPoint v9 = (CGPoint)*MEMORY[0x1E4F1DB20];
  self->_deadband.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  self->_deadband.size = v8;
  self->_idealDeadband.origin = v9;
  self->_idealDeadband.size = v8;
  self->_slackDeadband.origin = v9;
  self->_slackDeadband.size = v8;
  uint64_t v3 = MEMORY[0x1E4F1F9F8];
  long long v7 = *MEMORY[0x1E4F1F9F8];
  *(_OWORD *)&self->_lastFrameWithDetectionsTimestamp.value = *MEMORY[0x1E4F1F9F8];
  int64_t v4 = *(void *)(v3 + 16);
  self->_lastFrameWithDetectionsTimestamp.epoch = v4;
  activeFramingParameters = self->_activeFramingParameters;
  self->_activeFramingParameters = 0;

  self->_framingState = 0;
  [(SceneFramingEngine *)self clearSubjectHistory];
  *(_OWORD *)&self->_driftStartDeadband.size.double height = v7;
  *(void *)&self->_driftStartTime.timescale = v4;
  *(_OWORD *)&self->_driftStartTime.epoch = v7;
  *(void *)&self->_driftEndTime.timescale = v4;
  *(_OWORD *)&self->_recenterStartDeadband.size.double height = v7;
  *(void *)&self->_recenterStartTime.timescale = v4;
  *(_OWORD *)&self->_recenterStartTime.epoch = v7;
  *(void *)&self->_recenterEndTime.timescale = v4;
  *(_OWORD *)&self->_recenterEndTime.epoch = v7;
  *(void *)&self->_returningHomeStartTime.timescale = v4;
  self->_lastFrameHadSubjects = 0;
  v6 = *(void **)&self->_floatingFramingParameters.circleSize;
  *(void *)&self->_floatingFramingParameters.circleSize = 0;

  *(CGPoint *)&self->_trackForFloating = v9;
  *(CGSize *)&self->_targetViewportForFloating.origin.double y = v8;
}

- (void)setFramingStyle:(int)a3
{
  if (a3 == 1)
  {
    *(_OWORD *)&self->_newsroomFramingParameters.viewportOffsetY = xmmword_1DD5AD3C0;
  }
  else if ((a3 & 0xFFFFFFFE) == 2)
  {
    *(void *)&self->_returningHomeTargetRect[12] = 0x3F800000BE4CCCCDLL;
    if (a3 == 2) {
      int v3 = -1;
    }
    else {
      int v3 = 1;
    }
    *(float *)&self->_returningHomeTargetRect[8] = (float)v3 * 0.2;
  }
  if (LODWORD(self->_targetViewportForFloating.size.height) != a3) {
    LOBYTE(self->_driftEndTime.epoch) = 1;
  }
  LODWORD(self->_targetViewportForFloating.size.height) = a3;
}

- (CGRect)defaultViewport
{
  [(FramingSpaceManager *)self->_framingSpaceManager framingSpaceBounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(CinematicFramingSessionOptions *)self->_options viewportDefaultFOV];
  double v12 = v11;
  v25.origin.double x = v4;
  v25.origin.double y = v6;
  v25.size.double width = v8;
  v25.size.double height = v10;
  CGFloat v13 = CGRectGetWidth(v25) * v12;
  *(float *)&double v12 = v13;
  LODWORD(v13) = LODWORD(v12);
  [(FramingSpaceManager *)self->_framingSpaceManager getHeightForWidth:v13];
  float v15 = v14;
  v26.origin.double x = v4;
  v26.origin.double y = v6;
  v26.size.double width = v8;
  v26.size.double height = v10;
  CGFloat v16 = CGRectGetMidX(v26) - (float)(*(float *)&v12 * 0.5);
  [(CinematicFramingSessionOptions *)self->_options defaultViewportRotation];
  double v18 = v16 - v17;
  v27.origin.double x = v4;
  v27.origin.double y = v6;
  v27.size.double width = v8;
  v27.size.double height = v10;
  CGFloat v19 = CGRectGetMidY(v27) - (float)(v15 * 0.5);
  [(CinematicFramingSessionOptions *)self->_options defaultViewportRotation];
  double v21 = v19 - v20;
  double v22 = *(float *)&v12;
  double v23 = v15;
  double v24 = v18;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v24;
  return result;
}

- (CGRect)targetViewport
{
  if (LODWORD(self->_targetViewportForFloating.size.height) == 1)
  {
    trackForFloating = self->_trackForFloating;
    double x = self->_targetViewportForFloating.origin.x;
    double y = self->_targetViewportForFloating.origin.y;
    double width = self->_targetViewportForFloating.size.width;
LABEL_6:
    -[FramingSpaceManager adjustDisplayRectToFitInFramingSpace:](self->_framingSpaceManager, "adjustDisplayRectToFitInFramingSpace:", *(double *)&trackForFloating, x, y, width);
    goto LABEL_7;
  }
  if (!CGRectIsNull(self->_deadband))
  {
    -[SceneFramingEngine computeViewportFromDeadband:](self, "computeViewportFromDeadband:", self->_deadband.origin.x, self->_deadband.origin.y, self->_deadband.size.width, self->_deadband.size.height);
    goto LABEL_6;
  }
  double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  double v9 = *MEMORY[0x1E4F1DB20];
  double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
LABEL_7:
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v10;
  result.origin.double x = v9;
  return result;
}

- (CGRect)idealViewport
{
  if (LODWORD(self->_targetViewportForFloating.size.height) == 1)
  {
    [(SceneFramingEngine *)self targetViewport];
  }
  else if (CGRectIsNull(self->_idealDeadband))
  {
    double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    double v3 = *MEMORY[0x1E4F1DB20];
    double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  }
  else
  {
    -[SceneFramingEngine computeViewportFromDeadband:](self, "computeViewportFromDeadband:", self->_idealDeadband.origin.x, self->_idealDeadband.origin.y, self->_idealDeadband.size.width, self->_idealDeadband.size.height);
    -[FramingSpaceManager adjustDisplayRectToFitInFramingSpace:](self->_framingSpaceManager, "adjustDisplayRectToFitInFramingSpace:");
  }
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)slackViewport
{
  double v2 = *MEMORY[0x1E4F1DB20];
  double v3 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  if (LODWORD(self->_targetViewportForFloating.size.height) != 1 && !CGRectIsNull(self->_slackDeadband))
  {
    -[SceneFramingEngine computeViewportFromDeadband:](self, "computeViewportFromDeadband:", self->_slackDeadband.origin.x, self->_slackDeadband.origin.y, self->_slackDeadband.size.width, self->_slackDeadband.size.height);
    -[FramingSpaceManager adjustDisplayRectToFitInFramingSpace:](self->_framingSpaceManager, "adjustDisplayRectToFitInFramingSpace:");
    double v2 = v7;
    double v3 = v8;
    double v4 = v9;
    double v5 = v10;
  }
  double v11 = v2;
  double v12 = v3;
  double v13 = v4;
  double v14 = v5;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (void)restoreDefaultViewportFromCurrentViewport:(CGRect)a3 atTime:(id *)a4
{
  CGFloat height = a3.size.height;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGFloat width = a3.size.width;
  double v6 = (CMTime *)MEMORY[0x1E4F1F9F8];
  if (LODWORD(self->_targetViewportForFloating.size.height) == 1)
  {
    CGFloat v7 = *(double *)&self->_trackForFloating;
    CGFloat v8 = self->_targetViewportForFloating.origin.x;
    CGFloat v9 = self->_targetViewportForFloating.origin.y;
    CGFloat v10 = self->_targetViewportForFloating.size.width;
  }
  else
  {
    CGFloat v7 = self->_deadband.origin.x;
    CGFloat v8 = self->_deadband.origin.y;
    CGFloat v9 = self->_deadband.size.width;
    CGFloat v10 = self->_deadband.size.height;
  }
  if (CGRectIsNull(*(CGRect *)&v7)
    || ((time1 = (CMTime)self->_lastFrameWithDetectionsTimestamp, CMTime time2 = *v6, !CMTimeCompare(&time1, &time2))
      ? (float v11 = 0.0)
      : (CMTime time1 = (CMTime)*a4,
         CMTime time2 = (CMTime)self->_lastFrameWithDetectionsTimestamp,
         CMTimeSubtract(&time, &time1, &time2),
         float v11 = CMTimeGetSeconds(&time)),
        [(CinematicFramingSessionOptions *)self->_options noPeopleDelayBeforeReturningHomeSec], v11 > v12))
  {
    [(SceneFramingEngine *)self defaultViewport];
    float64_t v43 = v14;
    float64_t v44 = v13;
    float64_t v45 = v15;
    long long v42 = v16;
    p_epoch = &self->_recenterEndTime.epoch;
    CMTime time1 = *(CMTime *)&self->_recenterEndTime.epoch;
    CMTime time2 = *v6;
    if (!CMTimeCompare(&time1, &time2))
    {
      float64x2_t v18 = *(float64x2_t *)&a4->var0;
      *(void *)&self->_returningHomeStartTime.timescale = a4->var3;
      *(float64x2_t *)p_epoch = v18;
      v19.f64[0] = width;
      v19.f64[1] = height;
      v18.f64[0] = x;
      v18.f64[1] = y;
      float32x4_t v20 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v18), v19);
      v21.f64[0] = v45;
      *(void *)&v21.f64[1] = v42;
      v19.f64[0] = v44;
      v19.f64[1] = v43;
      *(float32x4_t *)&self->_returningHomeStartTime.epoch = v20;
      *(float32x4_t *)&self->_returningHomeStartRect[8] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v19), v21);
    }
    CMTime time1 = (CMTime)*a4;
    *(_OWORD *)&time2.value = *(_OWORD *)p_epoch;
    time2.epoch = *(void *)&self->_returningHomeStartTime.timescale;
    CMTimeSubtract(&v54, &time1, &time2);
    double Seconds = CMTimeGetSeconds(&v54);
    [(CinematicFramingSessionOptions *)self->_options noPeopleReturningHomeDurationSec];
    if (Seconds / v23 > 1.0) {
      goto LABEL_13;
    }
    CMTime time1 = (CMTime)*a4;
    *(_OWORD *)&time2.value = *(_OWORD *)p_epoch;
    time2.epoch = *(void *)&self->_returningHomeStartTime.timescale;
    CMTimeSubtract(&v53, &time1, &time2);
    double v24 = CMTimeGetSeconds(&v53);
    [(CinematicFramingSessionOptions *)self->_options noPeopleReturningHomeDurationSec];
    double v26 = v24 / v25;
    float v27 = 0.0;
    if (v26 >= 0.0)
    {
LABEL_13:
      CMTime time1 = (CMTime)*a4;
      *(_OWORD *)&time2.value = *(_OWORD *)p_epoch;
      time2.epoch = *(void *)&self->_returningHomeStartTime.timescale;
      CMTimeSubtract(&v52, &time1, &time2);
      double v28 = CMTimeGetSeconds(&v52);
      [(CinematicFramingSessionOptions *)self->_options noPeopleReturningHomeDurationSec];
      double v30 = v28 / v29;
      float v27 = 1.0;
      if (v30 <= 1.0)
      {
        CMTime time1 = (CMTime)*a4;
        *(_OWORD *)&time2.value = *(_OWORD *)p_epoch;
        time2.epoch = *(void *)&self->_returningHomeStartTime.timescale;
        CMTimeSubtract(&v51, &time1, &time2);
        double v31 = CMTimeGetSeconds(&v51);
        [(CinematicFramingSessionOptions *)self->_options noPeopleReturningHomeDurationSec];
        float v27 = v31 / v32;
      }
    }
    int8x16_t v33 = (int8x16_t)vmlaq_n_f32(*(float32x4_t *)&self->_returningHomeStartTime.epoch, vsubq_f32(*(float32x4_t *)&self->_returningHomeStartRect[8], *(float32x4_t *)&self->_returningHomeStartTime.epoch), v27);
    double v34 = *(float *)v33.i32;
    double v35 = *(float *)&v33.i32[3];
    CGPoint v50 = (CGPoint)vcvtq_f64_f32((float32x2_t)*(_OWORD *)&vextq_s8(v33, v33, 4uLL));
    -[SceneFramingEngine computeDeadbandFromViewport:](self, "computeDeadbandFromViewport:", *(float *)v33.i32, v42);
    self->_deadband.origin.CGFloat x = v36;
    self->_deadband.origin.CGFloat y = v37;
    self->_deadband.size.CGFloat width = v38;
    self->_deadband.size.CGFloat height = v39;
    CGPoint origin = self->_deadband.origin;
    CGSize size = self->_deadband.size;
    self->_idealDeadband.CGPoint origin = origin;
    self->_idealDeadband.CGSize size = size;
    self->_slackDeadband.CGPoint origin = origin;
    self->_slackDeadband.CGSize size = size;
    if (LODWORD(self->_targetViewportForFloating.size.height) == 1)
    {
      *(double *)&self->_trackForFloating = v34;
      self->_targetViewportForFloating.CGPoint origin = v50;
      self->_targetViewportForFloating.size.CGFloat width = v35;
    }
  }
}

- (void)determineTemporallyStableTargetViewportForTracks:(id)a3 currentViewport:(CGRect)a4 atTime:(id *)a5
{
  if (LODWORD(self->_targetViewportForFloating.size.height) == 1)
  {
    long long v20 = *(_OWORD *)&a5->var0;
    *(void *)&long long v21 = a5->var3;
    id v7 = a3;
    [(SceneFramingEngine *)self updateTargetViewportForFloatingWithTracks:v7 atTime:&v20];
  }
  else
  {
    double height = a4.size.height;
    double width = a4.size.width;
    double y = a4.origin.y;
    double x = a4.origin.x;
    uint64_t v24 = 0;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v15 = *(_OWORD *)&a5->var0;
    *(void *)&long long v16 = a5->var3;
    id v12 = a3;
    -[SceneFramingEngine determineSceneSummaryForTracks:currentViewport:atTime:](self, "determineSceneSummaryForTracks:currentViewport:atTime:", v12, &v15, x, y, width, height);
    long long v17 = v22;
    long long v18 = v23;
    uint64_t v19 = v24;
    long long v15 = v20;
    long long v16 = v21;
    long long v13 = *(_OWORD *)&a5->var0;
    int64_t var3 = a5->var3;
    -[SceneFramingEngine updateDeadbandToFitScene:tracks:currentViewport:atTime:](self, "updateDeadbandToFitScene:tracks:currentViewport:atTime:", &v15, v12, &v13, x, y, width, height);
  }
}

- (void)updateTargetViewportForFloatingWithTracks:(id)a3 atTime:(id *)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (!*(void *)&self->_floatingFramingParameters.circleSize || (objc_msgSend(v6, "containsObject:") & 1) == 0)
  {
    [v7 count];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v53;
      double v12 = 0.0;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v53 != v11) {
            objc_enumerationMutation(v8);
          }
          double v14 = *(void **)(*((void *)&v52 + 1) + 8 * v13);
          long long v50 = *(_OWORD *)&a4->var0;
          int64_t var3 = a4->var3;
          [v14 faceBoundingBoxForFramingAtTime:&v50];
          if (v15 <= v16) {
            double v17 = v16;
          }
          else {
            double v17 = v15;
          }
          if (v17 > v12)
          {
            objc_storeStrong((id *)&self->_floatingFramingParameters.circleSize, v14);
            double v12 = v17;
          }
          ++v13;
        }
        while (v10 != v13);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v52 objects:v56 count:16];
      }
      while (v10);
    }
  }
  long long v18 = *(void **)&self->_floatingFramingParameters.circleSize;
  long long v50 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  [v18 faceBoundingBoxForFramingAtTime:&v50];
  CGFloat x = v58.origin.x;
  CGFloat y = v58.origin.y;
  double width = v58.size.width;
  double height = v58.size.height;
  double viewportOffsetY = self->_newsroomFramingParameters.viewportOffsetY;
  double viewportScale = self->_newsroomFramingParameters.viewportScale;
  double MinY = CGRectGetMinY(v58);
  v59.origin.CGFloat x = x;
  v59.origin.CGFloat y = y;
  v59.size.double width = width;
  v59.size.double height = height;
  CGFloat v25 = CGRectGetMaxY(v59) - viewportOffsetY * height;
  v60.origin.CGFloat x = x;
  v60.origin.CGFloat y = y;
  v60.size.double width = width;
  v60.size.double height = height;
  double v26 = CGRectGetMinX(v60) - viewportScale * width;
  v61.origin.CGFloat x = x;
  v61.origin.CGFloat y = y;
  v61.size.double width = width;
  v61.size.double height = height;
  double v47 = v25 - MinY;
  double v48 = CGRectGetMaxX(v61) + viewportScale * width - v26;
  double eyeBoxBottomInset = self->_floatingFramingParameters.eyeBoxBottomInset;
  v62.origin.CGFloat x = x;
  v62.origin.CGFloat y = y;
  v62.size.double width = width;
  v62.size.double height = height;
  double MidX = CGRectGetMidX(v62);
  v63.origin.CGFloat x = x;
  v63.origin.CGFloat y = y;
  v63.size.double width = width;
  v63.size.double height = height;
  double MidY = CGRectGetMidY(v63);
  if (width <= height) {
    double v30 = height;
  }
  else {
    double v30 = width;
  }
  double v31 = v30 * 0.5 * (eyeBoxBottomInset + 1.0);
  CGFloat v32 = MidX - v31;
  CGFloat v33 = MidY - v31;
  CGFloat v34 = v31 + v31;
  v64.origin.CGFloat x = x;
  v64.origin.CGFloat y = y;
  v64.size.double width = width;
  v64.size.double height = height;
  double v49 = CGRectGetMidX(v64);
  v65.origin.CGFloat x = v26;
  v65.origin.CGFloat y = MinY;
  v65.size.double width = v48;
  v65.size.double height = v47;
  float v35 = CGRectGetMinX(v65) - v49;
  float v45 = v35;
  v66.origin.CGFloat x = v32;
  v66.origin.CGFloat y = v33;
  v66.size.double width = v34;
  v66.size.double height = v34;
  float v36 = CGRectGetMinX(v66) - v49;
  v67.origin.CGFloat x = v32;
  v67.origin.CGFloat y = v33;
  v67.size.double width = v34;
  v67.size.double height = v34;
  CGFloat MaxY = CGRectGetMaxY(v67);
  v68.origin.CGFloat x = v26;
  v68.origin.CGFloat y = MinY;
  v68.size.double width = v48;
  v68.size.double height = v47;
  float v38 = MaxY - CGRectGetMinY(v68);
  *(float *)&CGFloat v32 = v45;
  *(float *)&CGFloat MaxY = (float)((float)((float)(v36 * v36) - (float)(*(float *)&v32 * *(float *)&v32)) + (float)(v38 * v38))
                  / (float)(v38 + v38);
  v69.origin.CGFloat x = v26;
  v69.origin.CGFloat y = MinY;
  v69.size.double width = v48;
  v69.size.double height = v47;
  CGFloat v39 = CGRectGetMinY(v69) + *(float *)&MaxY;
  float v40 = sqrtf((float)(*(float *)&MaxY * *(float *)&MaxY) + (float)(*(float *)&v32 * *(float *)&v32));
  double v41 = v40 + v40;
  CGFloat v42 = v41 / self->_floatingFramingParameters.eyeBoxHorizontalPadding;
  *(float *)&double v41 = v42;
  [(FramingSpaceManager *)self->_framingSpaceManager getWidthForHeight:v41];
  CGFloat v44 = v43;
  *(double *)&self->_trackForFloating = v49 + v44 * -0.5;
  self->_targetViewportForFloating.origin.CGFloat x = v39 + v42 * -0.5;
  self->_targetViewportForFloating.origin.CGFloat y = v44;
  self->_targetViewportForFloating.size.double width = v42;
}

- ($680651117FADF5CC13A199869A236271)determineSceneSummaryForTracks:(SEL)a3 currentViewport:(id)a4 atTime:(CGRect)a5
{
  CGFloat height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v60 = *a6;
  id v13 = a4;
  [(SceneFramingEngine *)self calculateBaselineViewportForTracks:v13 atTime:&v60];
  CGFloat v51 = v61.size.height;
  CGFloat v14 = v61.origin.x;
  CGFloat v54 = v61.origin.y;
  CGFloat v55 = v61.origin.x;
  CGFloat v15 = v61.origin.y;
  CGFloat v16 = v61.size.width;
  CGFloat v53 = v61.size.width;
  CGFloat v17 = CGRectGetWidth(v61);
  *(float *)&CGFloat v17 = v17;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v60 = *a6;
  -[SceneFramingEngine calculateSubjectEnclosingRectangleForTracks:withBaselineWidth:currentViewport:atTime:](self, "calculateSubjectEnclosingRectangleForTracks:withBaselineWidth:currentViewport:atTime:", v13, &v60, v17, x, y, width, height);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  -[SceneFramingEngine calculateViewportWidthToFitSubjectsInDeadband:](self, "calculateViewportWidthToFitSubjectsInDeadband:", v19, v21, v23, v25);
  LODWORD(height) = v26;
  v62.origin.double x = v14;
  v62.origin.double y = v15;
  v62.size.double width = v16;
  v62.size.CGFloat height = v51;
  double v27 = fmax(CGRectGetWidth(v62), *(float *)&height);
  *(float *)&CGFloat height = v27;
  LODWORD(v27) = LODWORD(height);
  [(FramingSpaceManager *)self->_framingSpaceManager getHeightForWidth:v27];
  float v52 = v28;
  LODWORD(v29) = LODWORD(height);
  CGFloat v56 = v19;
  CGFloat v57 = v21;
  CGFloat v58 = v23;
  CGFloat v59 = v25;
  -[SceneFramingEngine computeCroppedSubjectEnclosingRectForViewportWidth:subjectEnclosingRect:](self, "computeCroppedSubjectEnclosingRectForViewportWidth:subjectEnclosingRect:", v29, v19, v21, v23, v25);
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  CGFloat v35 = v34;
  CGFloat v37 = v36;
  LODWORD(v30) = LODWORD(height);
  [(SceneFramingEngine *)self computeDeadbandWidthFromViewportWidth:v30];
  -[SceneFramingEngine computeDeadbandHeightForWidth:](self, "computeDeadbandHeightForWidth:");
  double v39 = v38;
  double v40 = v38 * 0.125;
  v63.origin.double x = v31;
  v63.origin.double y = v33;
  v63.size.double width = v35;
  v63.size.CGFloat height = v37;
  *(float *)&double v39 = fmax(fmin(v40, (v39 - CGRectGetHeight(v63)) * 0.5), 0.0);
  v64.origin.double x = v31;
  v64.origin.double y = v33;
  v64.size.double width = v35;
  v64.size.CGFloat height = v37;
  *(float *)&CGFloat v35 = CGRectGetMinY(v64) - *(float *)&v39;
  [(CinematicFramingSessionFramingParameters *)self->_activeFramingParameters deadbandTopOffsetFractionOfScreenHeight];
  *(float *)&CGFloat v31 = *(float *)&v35 - (float)(v52 * v41);
  v65.origin.double x = v55;
  v65.origin.double y = v54;
  v65.size.double width = v53;
  v65.size.CGFloat height = v51;
  double MinX = CGRectGetMinX(v65);
  v66.origin.double x = v55;
  v66.origin.double y = v54;
  v66.size.double width = v53;
  v66.size.CGFloat height = v51;
  double v43 = CGRectGetWidth(v66);
  v67.origin.double x = v55;
  v67.origin.double y = v54;
  v67.size.double width = v53;
  v67.size.CGFloat height = v51;
  CGFloat v44 = CGRectGetHeight(v67);
  LODWORD(v45) = LODWORD(height);
  -[SceneFramingEngine calculateViewportCenteredAround:withWidth:](self, "calculateViewportCenteredAround:withWidth:", MinX, *(float *)&v31, v43, v44, v45);
  if ((LODWORD(self->_targetViewportForFloating.size.height) & 0xFFFFFFFE) == 2) {
    -[SceneFramingEngine applyNewsroomViewportAdjustments:](self, "applyNewsroomViewportAdjustments:");
  }
  CGRect result = ($680651117FADF5CC13A199869A236271 *)-[SceneFramingEngine computeDeadbandFromViewport:](self, "computeDeadbandFromViewport:");
  retstr->var0.origin.double x = v47;
  retstr->var0.origin.double y = v48;
  retstr->var0.size.double width = v49;
  retstr->var0.size.CGFloat height = v50;
  retstr->var1.origin.double x = v56;
  retstr->var1.origin.double y = v57;
  retstr->var1.size.double width = v58;
  retstr->var1.size.CGFloat height = v59;
  retstr->var2 = 0;
  return result;
}

- (void)updateDeadbandToFitScene:(id *)a3 tracks:(id)a4 currentViewport:(CGRect)a5 atTime:(id *)a6
{
  id v9 = a4;
  if (CGRectEqualToRect(self->_deadband, *MEMORY[0x1E4F1DB20]) || !self->_lastFrameHadSubjects)
  {
    CGPoint origin = a3->var0.origin;
    CGSize size = a3->var0.size;
    goto LABEL_6;
  }
  [(FramingSpaceManager *)self->_framingSpaceManager maxAllowedViewportWidth];
  float v11 = v10;
  -[SceneFramingEngine calculateViewportWidthToFitSubjectsInDeadband:](self, "calculateViewportWidthToFitSubjectsInDeadband:", a3->var1.origin.x, a3->var1.origin.y, a3->var1.size.width, a3->var1.size.height);
  float v13 = v12;
  [(SceneFramingEngine *)self minAllowedDeadbandWidth];
  *(float *)&double v15 = fminf(fmaxf(v14, v13), v11);
  [(SceneFramingEngine *)self computeDeadbandWidthFromViewportWidth:v15];
  float v17 = v16;
  *(float *)&double v18 = v11;
  [(SceneFramingEngine *)self computeDeadbandWidthFromViewportWidth:v18];
  float v20 = v19;
  [(CinematicFramingSessionFramingParameters *)self->_activeFramingParameters deadbandWidthMinFraction];
  float v22 = fmin(fmax(CGRectGetWidth(self->_deadband) * v21, v17), v20);
  [(CinematicFramingSessionFramingParameters *)self->_activeFramingParameters deadbandWidthMaxFraction];
  float v24 = v23;
  double Width = CGRectGetWidth(self->_deadband);
  float v26 = CGRectGetWidth(a3->var0);
  double v27 = CGRectGetWidth(self->_deadband);
  if (v22 + -0.001 <= v26)
  {
    float v31 = fmin(fmax(Width * v24, v17), v20);
    if (v26 + -0.001 <= v31)
    {
      float v32 = v27;
      goto LABEL_12;
    }
    [(CinematicFramingSessionFramingParameters *)self->_activeFramingParameters deadbandWidthMaxFraction];
  }
  else
  {
    [(CinematicFramingSessionFramingParameters *)self->_activeFramingParameters deadbandWidthMinFraction];
  }
  float v32 = v26 / v28;
LABEL_12:
  if ((unint64_t)[v9 count] >= 2) {
    float v33 = v32;
  }
  else {
    float v33 = v26;
  }
  float v34 = fminf(fmaxf(v33, v17), v20);
  double v35 = vabdd_f64(v34, CGRectGetWidth(self->_deadband));
  double v36 = v35 / CGRectGetWidth(self->_deadband);
  if (v36 > 0.100000001) {
    float v34 = v26;
  }
  -[SceneFramingEngine computeViewportFromDeadband:](self, "computeViewportFromDeadband:", a3->var0.origin.x, a3->var0.origin.y, a3->var0.size.width, a3->var0.size.height);
  double v38 = v37;
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;
  *(float *)&double v37 = v34;
  [(SceneFramingEngine *)self computeViewportWidthFromDeadbandWidth:v37];
  LODWORD(v46) = v45;
  -[SceneFramingEngine calculateViewportCenteredAround:withWidth:](self, "calculateViewportCenteredAround:withWidth:", v38, v40, v42, v44, v46);
  -[SceneFramingEngine computeDeadbandFromViewport:](self, "computeDeadbandFromViewport:");
  self->_idealDeadband.origin.double x = v47;
  self->_idealDeadband.origin.double y = v48;
  self->_idealDeadband.size.double width = v49;
  self->_idealDeadband.size.double height = v50;
  *(float *)&uint64_t v59 = v34;
  -[SceneFramingEngine determineDeadbandForSubjectEnclosingRect:oldDeadband:newDeadbandWidth:](self, "determineDeadbandForSubjectEnclosingRect:oldDeadband:newDeadbandWidth:", a3->var1.origin.x, a3->var1.origin.y, a3->var1.size.width, a3->var1.size.height, self->_deadband.origin.x, self->_deadband.origin.y, self->_deadband.size.width, self->_deadband.size.height, v59);
  self->_slackDeadband.origin.double x = v51;
  self->_slackDeadband.origin.double y = v52;
  self->_slackDeadband.size.double width = v53;
  self->_slackDeadband.size.double height = v54;
  if (v36 <= 0.100000001)
  {
    double x = a3->var1.origin.x;
    double y = a3->var1.origin.y;
    double v57 = a3->var1.size.width;
    double height = a3->var1.size.height;
    long long v60 = *(_OWORD *)&a6->var0;
    int64_t var3 = a6->var3;
    -[SceneFramingEngine updateDeadbandWithSubjectRect:atTime:](self, "updateDeadbandWithSubjectRect:atTime:", &v60, x, y, v57, height);
    goto LABEL_7;
  }
  CGPoint origin = self->_idealDeadband.origin;
  CGSize size = self->_idealDeadband.size;
LABEL_6:
  self->_deadband.CGPoint origin = origin;
  self->_deadband.CGSize size = size;
LABEL_7:
}

- (void)updateDeadbandWithSubjectRect:(CGRect)a3 atTime:(id *)a4
{
  if (LOBYTE(self->_driftEndTime.epoch))
  {
    LOBYTE(self->_driftEndTime.epoch) = 0;
    int v6 = 2;
    goto LABEL_56;
  }
  int framingState = self->_framingState;
  p_deadband = &self->_deadband;
  CGFloat x = self->_deadband.origin.x;
  p_slackDeadband = &self->_slackDeadband;
  CGFloat v11 = self->_slackDeadband.origin.x;
  CGFloat y = self->_deadband.origin.y;
  CGFloat width = self->_deadband.size.width;
  CGFloat height = self->_deadband.size.height;
  CGFloat v15 = self->_slackDeadband.origin.y;
  CGFloat v16 = self->_slackDeadband.size.width;
  CGFloat v17 = self->_slackDeadband.size.height;
  v103.origin.CGFloat x = x;
  v103.origin.CGFloat y = y;
  v103.size.CGFloat width = width;
  v103.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v103);
  v104.origin.CGFloat x = x;
  v104.origin.CGFloat y = y;
  v104.size.CGFloat width = width;
  v104.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v104);
  v105.origin.CGFloat x = x;
  v105.origin.CGFloat y = y;
  v105.size.CGFloat width = width;
  v105.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v105);
  v106.origin.CGFloat x = x;
  v106.origin.CGFloat y = y;
  v106.size.CGFloat width = width;
  v106.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v106);
  v107.origin.CGFloat x = v11;
  v107.origin.CGFloat y = v15;
  v107.size.CGFloat width = v16;
  v107.size.CGFloat height = v17;
  double v19 = CGRectGetMinX(v107);
  v108.origin.CGFloat x = v11;
  v108.origin.CGFloat y = v15;
  v108.size.CGFloat width = v16;
  v108.size.CGFloat height = v17;
  double v20 = CGRectGetMaxX(v108);
  v109.origin.CGFloat x = v11;
  v109.origin.CGFloat y = v15;
  v109.size.CGFloat width = v16;
  v109.size.CGFloat height = v17;
  double v21 = CGRectGetMinY(v109);
  v110.origin.CGFloat x = v11;
  v110.origin.CGFloat y = v15;
  v110.size.CGFloat width = v16;
  v110.size.CGFloat height = v17;
  double v22 = CGRectGetMaxY(v110);
  double v23 = MaxX;
  if (MaxX >= v20) {
    double v24 = v20;
  }
  else {
    double v24 = MaxX;
  }
  if (MaxX <= v20) {
    double v23 = v20;
  }
  if (MinX <= v19) {
    double v25 = v19;
  }
  else {
    double v25 = MinX;
  }
  double v26 = v24 - v25;
  if (MinX >= v19) {
    double v27 = v19;
  }
  else {
    double v27 = MinX;
  }
  if (MaxY >= v22) {
    double v28 = v22;
  }
  else {
    double v28 = MaxY;
  }
  if (MaxY > v22) {
    double v22 = MaxY;
  }
  if (MinY <= v21) {
    double v29 = v21;
  }
  else {
    double v29 = MinY;
  }
  double v30 = v28 - v29;
  double v31 = v23 - v27;
  if (MinY >= v21) {
    double v32 = v21;
  }
  else {
    double v32 = MinY;
  }
  int v33 = self->_framingState;
  if (v26 * v30 / (v31 * (v22 - v32)) <= 0.899999976)
  {
    if (v33 == 1)
    {
      CGSize size = self->_slackDeadband.size;
      p_deadband->CGPoint origin = p_slackDeadband->origin;
      self->_deadband.CGSize size = size;
      CMTimeMakeWithSeconds(&rhs, 0.100000001, a4->var1);
      CMTime lhs = (CMTime)*a4;
      CMTimeAdd(&time1, &lhs, &rhs);
      *(CMTime *)&self->_driftStartTime.int64_t epoch = time1;
    }
    int v6 = 1;
  }
  else
  {
    if (v33 == 2)
    {
      if (-[SceneFramingEngine isSubjectRectStationary:](self, "isSubjectRectStationary:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height))
      {
        *(float *)&double v38 = 0.01;
      }
      else
      {
        *(float *)&double v38 = 0.1;
      }
      BOOL v39 = -[SceneFramingEngine isCurrentFramingIdeal:withTolerance:](self, "isCurrentFramingIdeal:withTolerance:", self->_idealDeadband.origin.x, self->_idealDeadband.origin.y, self->_idealDeadband.size.width, self->_idealDeadband.size.height, v38);
      CMTime time1 = (CMTime)*a4;
      CMTime lhs = *(CMTime *)&self->_recenterStartTime.epoch;
      int32_t v40 = CMTimeCompare(&time1, &lhs);
      int v6 = 0;
      if (v39 || (v40 & 0x80000000) == 0) {
        goto LABEL_56;
      }
      CMTime time1 = *(CMTime *)&self->_recenterStartDeadband.size.height;
      double Seconds = CMTimeGetSeconds(&time1);
      CMTime time1 = *(CMTime *)&self->_recenterStartTime.epoch;
      double v42 = CMTimeGetSeconds(&time1);
      CMTime time1 = (CMTime)*a4;
      double v43 = fmin(fmax((CMTimeGetSeconds(&time1) - Seconds) / (v42 - Seconds), 0.0), 1.0);
      *(float *)&double v43 = v43 * v43 * (v43 * -2.0 + 3.0);
      float v94 = *(float *)&v43;
      CGFloat v44 = *(double *)&self->_recenterOnNextFrame;
      CGFloat v45 = self->_recenterStartDeadband.origin.x;
      CGFloat v46 = self->_recenterStartDeadband.origin.y;
      CGFloat v47 = self->_recenterStartDeadband.size.width;
      v111.origin.CGFloat x = v44;
      v111.origin.CGFloat y = v45;
      v111.size.CGFloat width = v46;
      v111.size.CGFloat height = v47;
      CGFloat MidX = CGRectGetMidX(v111);
      v112.origin.CGFloat x = v44;
      v112.origin.CGFloat y = v45;
      v112.size.CGFloat width = v46;
      v112.size.CGFloat height = v47;
      CGFloat MidY = CGRectGetMidY(v112);
      v49.f64[0] = MidX;
      v49.f64[1] = MidY;
      float32x2_t v50 = vcvt_f32_f64(v49);
      CGFloat v51 = self->_idealDeadband.origin.x;
      float64_t v52 = self->_idealDeadband.origin.y;
      CGFloat v53 = self->_idealDeadband.size.width;
      CGFloat v54 = self->_idealDeadband.size.height;
      CGFloat v55 = v51;
      v49.f64[0] = v52;
      CGFloat v56 = v53;
      CGFloat v57 = v54;
      CGFloat v92 = CGRectGetMidX(*(CGRect *)((char *)&v49 - 8));
      v113.origin.CGFloat x = v51;
      v113.origin.CGFloat y = v52;
      v113.size.CGFloat width = v53;
      v113.size.CGFloat height = v54;
      CGFloat v58 = CGRectGetMidY(v113);
      v59.f64[0] = v92;
      v59.f64[1] = v58;
      float32x2_t v60 = vcvt_f32_f64(*(float64x2_t *)&self->_recenterStartDeadband.origin.y);
      float32x2_t v61 = vmla_n_f32(v60, vsub_f32(vcvt_f32_f64((float64x2_t)self->_idealDeadband.size), v60), v94);
      self->_deadband.CGPoint origin = (CGPoint)vcvtq_f64_f32(vmla_f32(vmla_n_f32(v50, vsub_f32(vcvt_f32_f64(v59), v50), v94), (float32x2_t)0xBF000000BF000000, v61));
      self->_deadband.CGSize size = (CGSize)vcvtq_f64_f32(v61);
      goto LABEL_42;
    }
    if (v33 != 1)
    {
      if (!self->_framingState)
      {
        CMTime time1 = (CMTime)*a4;
        -[SceneFramingEngine updateSubjectMovement:atTime:](self, "updateSubjectMovement:atTime:", &time1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
        LODWORD(v34) = 1045220557;
        BOOL v35 = -[SceneFramingEngine isCurrentFramingIdeal:withTolerance:](self, "isCurrentFramingIdeal:withTolerance:", self->_idealDeadband.origin.x, self->_idealDeadband.origin.y, self->_idealDeadband.size.width, self->_idealDeadband.size.height, v34);
        if (BYTE4(self->_subjectRectHistoryUpdateTime.epoch))
        {
          int v6 = framingState;
          if (!v35)
          {
            if ((self->_subjectRectStationaryTime.value & 0x100000000) != 0)
            {
              CMTime time1 = (CMTime)*a4;
              CMTime lhs = *(CMTime *)&self->_subjectRectStationary;
              CMTimeSubtract(&v99, &time1, &lhs);
              float v84 = CMTimeGetSeconds(&v99);
              [(CinematicFramingSessionOptions *)self->_options deadbandRecenteringInitialDelaySec];
              BOOL v36 = v85 < v84;
            }
            else
            {
              BOOL v36 = 1;
            }
            if ((self->_recenterEndTime.value & 0x100000000) != 0)
            {
              CMTime time1 = (CMTime)*a4;
              CMTime lhs = *(CMTime *)&self->_recenterStartTime.epoch;
              CMTimeSubtract(&v98, &time1, &lhs);
              float v86 = CMTimeGetSeconds(&v98);
              [(CinematicFramingSessionOptions *)self->_options deadbandRecenteringIdleDurationSec];
              if (v87 >= v86) {
                BOOL v36 = 0;
              }
            }
            if (v36) {
              int v6 = 2;
            }
            else {
              int v6 = framingState;
            }
          }
          goto LABEL_56;
        }
      }
LABEL_42:
      int v6 = framingState;
      goto LABEL_56;
    }
    CMTime time1 = (CMTime)*a4;
    CMTime lhs = *(CMTime *)&self->_driftStartTime.epoch;
    int32_t v62 = CMTimeCompare(&time1, &lhs);
    int v6 = framingState;
    if (v62 >= 1)
    {
      CMTime time1 = (CMTime)*a4;
      CMTime lhs = *(CMTime *)&self->_driftStartDeadband.size.height;
      CMTimeSubtract(&time, &time1, &lhs);
      float v63 = CMTimeGetSeconds(&time);
      [(CinematicFramingSessionOptions *)self->_options recenterAfterDriftDurationThreshold];
      BOOL v65 = v64 < v63;
      CGFloat v66 = self->_deadband.origin.x;
      CGFloat v67 = self->_deadband.origin.y;
      CGFloat v68 = self->_deadband.size.width;
      CGFloat v69 = self->_deadband.size.height;
      v114.origin.CGFloat x = v66;
      v114.origin.CGFloat y = v67;
      v114.size.CGFloat width = v68;
      v114.size.CGFloat height = v69;
      CGFloat v95 = CGRectGetMidX(v114);
      v115.origin.CGFloat x = v66;
      v115.origin.CGFloat y = v67;
      v115.size.CGFloat width = v68;
      v115.size.CGFloat height = v69;
      CGFloat v70 = CGRectGetMidY(v115);
      v71.f64[0] = v95;
      v71.f64[1] = v70;
      float32x2_t v72 = vcvt_f32_f64(v71);
      int64_t epoch = self->_subjectRectStationaryTime.epoch;
      float64_t v74 = self->_driftStartDeadband.origin.x;
      CGFloat v75 = self->_driftStartDeadband.origin.y;
      CGFloat v76 = self->_driftStartDeadband.size.width;
      int64_t v77 = epoch;
      v71.f64[0] = v74;
      CGFloat v78 = v75;
      CGFloat v79 = v76;
      CGFloat v96 = CGRectGetMidX(*(CGRect *)((char *)&v71 - 8));
      *(void *)&v116.origin.CGFloat x = epoch;
      v116.origin.CGFloat y = v74;
      v116.size.CGFloat width = v75;
      v116.size.CGFloat height = v76;
      CGFloat v80 = CGRectGetMidY(v116);
      v81.f64[0] = v96;
      v81.f64[1] = v80;
      float32x2_t v82 = vsub_f32(v72, vcvt_f32_f64(v81));
      *(float *)&int64_t epoch = sqrtf(vaddv_f32(vmul_f32(v82, v82)));
      [(CinematicFramingSessionOptions *)self->_options recenterAfterDriftOffsetThreshold];
      if (*(float *)&epoch > v83) {
        BOOL v65 = 1;
      }
      if ([(CinematicFramingSessionOptions *)self->_options recenterAfterDriftEnabled]
        && v65)
      {
        int v6 = 2;
      }
      else
      {
        int v6 = 0;
      }
    }
  }
LABEL_56:
  if (self->_framingState != v6)
  {
    CMTime time1 = (CMTime)*a4;
    -[SceneFramingEngine transitionToFramingState:atTime:](self, "transitionToFramingState:atTime:");
  }
}

- (void)transitionToFramingState:(unsigned __int16)a3 atTime:(id *)a4
{
  if (self->_framingState != a3)
  {
    switch(a3)
    {
      case 2u:
        CGSize size = self->_deadband.size;
        *(CGPoint *)&self->_recenterOnNextFrame = self->_deadband.origin;
        *(CGSize *)&self->_recenterStartDeadband.origin.CGFloat y = size;
        int64_t var3 = a4->var3;
        *(_OWORD *)&self->_recenterStartDeadband.size.CGFloat height = *(_OWORD *)&a4->var0;
        *(void *)&self->_recenterStartTime.timescale = var3;
        [(CinematicFramingSessionOptions *)self->_options deadbandRecenteringDurationSec];
        CMTimeMakeWithSeconds(&rhs, v9, a4->var1);
        CMTime lhs = (CMTime)*a4;
        CMTimeAdd(&v15, &lhs, &rhs);
        *(CMTime *)&self->_recenterStartTime.int64_t epoch = v15;
        break;
      case 1u:
        CGSize v10 = self->_deadband.size;
        *(CGPoint *)&self->_subjectRectStationaryTime.int64_t epoch = self->_deadband.origin;
        *(CGSize *)&self->_driftStartDeadband.origin.CGFloat y = v10;
        int64_t v11 = a4->var3;
        *(_OWORD *)&self->_driftStartDeadband.size.CGFloat height = *(_OWORD *)&a4->var0;
        *(void *)&self->_driftStartTime.timescale = v11;
        CMTimeMakeWithSeconds(&v14, 0.100000001, a4->var1);
        CMTime lhs = (CMTime)*a4;
        CMTimeAdd(&v15, &lhs, &v14);
        *(CMTime *)&self->_driftStartTime.int64_t epoch = v15;
        break;
      case 0u:
        [(SceneFramingEngine *)self clearSubjectHistory];
        break;
    }
    self->_int framingState = a3;
  }
}

- (void)clearSubjectHistory
{
  self->_subjectRectHistoryBuffer[0].CGPoint origin = 0u;
  subjectRectHistoryBuffer = self->_subjectRectHistoryBuffer;
  subjectRectHistoryBuffer[9].CGPoint origin = 0u;
  subjectRectHistoryBuffer[9].CGSize size = 0u;
  subjectRectHistoryBuffer[8].CGPoint origin = 0u;
  subjectRectHistoryBuffer[8].CGSize size = 0u;
  subjectRectHistoryBuffer[7].CGPoint origin = 0u;
  subjectRectHistoryBuffer[7].CGSize size = 0u;
  subjectRectHistoryBuffer[6].CGPoint origin = 0u;
  subjectRectHistoryBuffer[6].CGSize size = 0u;
  subjectRectHistoryBuffer[5].CGPoint origin = 0u;
  subjectRectHistoryBuffer[5].CGSize size = 0u;
  subjectRectHistoryBuffer[4].CGPoint origin = 0u;
  subjectRectHistoryBuffer[4].CGSize size = 0u;
  subjectRectHistoryBuffer[3].CGPoint origin = 0u;
  subjectRectHistoryBuffer[3].CGSize size = 0u;
  subjectRectHistoryBuffer[2].CGPoint origin = 0u;
  subjectRectHistoryBuffer[2].CGSize size = 0u;
  subjectRectHistoryBuffer[1].CGPoint origin = 0u;
  subjectRectHistoryBuffer[1].CGSize size = 0u;
  subjectRectHistoryBuffer->CGSize size = 0u;
  LODWORD(subjectRectHistoryBuffer[10].origin.x) = 0;
  uint64_t v3 = MEMORY[0x1E4F1F9F8];
  CGPoint v4 = (CGPoint)*MEMORY[0x1E4F1F9F8];
  *(CGPoint *)((char *)&subjectRectHistoryBuffer[10].origin + 4) = (CGPoint)*MEMORY[0x1E4F1F9F8];
  CGFloat v5 = *(double *)(v3 + 16);
  *(CGFloat *)((char *)&subjectRectHistoryBuffer[10].size.width + 4) = v5;
  BYTE4(subjectRectHistoryBuffer[10].size.height) = 0;
  subjectRectHistoryBuffer[11].CGPoint origin = v4;
  subjectRectHistoryBuffer[11].size.CGFloat width = v5;
}

- (void)updateSubjectMovement:(CGRect)a3 atTime:(id *)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (!self->_subjectRectHistoryCount)
  {
    self->_subjectRectHistoryBuffer[0] = a3;
    *(_DWORD *)&self->_unsigned int subjectRectHistoryCount = 65537;
    p_subjectRectStationardouble y = (BOOL *)(&self->_subjectRectHistoryHeadIdx + 1);
LABEL_10:
    long long v18 = *(_OWORD *)&a4->var0;
    *((void *)p_subjectRectStationary + 2) = a4->var3;
    *(_OWORD *)p_subjectRectStationardouble y = v18;
    return;
  }
  CMTime lhs = *(CMTime *)a4;
  *(_OWORD *)&v20.value = *(_OWORD *)(&self->_subjectRectHistoryHeadIdx + 1);
  v20.int64_t epoch = *(void *)&self->_subjectRectHistoryUpdateTime.flags;
  CMTimeSubtract(&time, &lhs, &v20);
  float Seconds = CMTimeGetSeconds(&time);
  if (Seconds >= 0.1)
  {
    subjectRectHistoryHeadIddouble x = self->_subjectRectHistoryHeadIdx;
    float v12 = (double *)((char *)self + 32 * subjectRectHistoryHeadIdx);
    v12[21] = x;
    v12[22] = y;
    v12[23] = width;
    v12[24] = height;
    unsigned int subjectRectHistoryCount = self->_subjectRectHistoryCount;
    unsigned __int16 v14 = subjectRectHistoryCount < 9 ? subjectRectHistoryCount + 1 : 10;
    self->_unsigned int subjectRectHistoryCount = v14;
    self->_subjectRectHistoryHeadIddouble x = subjectRectHistoryHeadIdx
                                     + 1
                                     - 10
                                     * ((429496730 * (unint64_t)(subjectRectHistoryHeadIdx + 1)) >> 32);
    long long v15 = *(_OWORD *)&a4->var0;
    *(void *)&self->_subjectRectHistoryUpdateTime.flags = a4->var3;
    *(_OWORD *)(&self->_subjectRectHistoryHeadIdx + 1) = v15;
    int v16 = -[SceneFramingEngine isSubjectRectStationary:](self, "isSubjectRectStationary:", x, y, width, height);
    if (BYTE4(self->_subjectRectHistoryUpdateTime.epoch) != v16)
    {
      p_subjectRectStationardouble y = &self->_subjectRectStationary;
      if (!v16)
      {
        BYTE4(self->_subjectRectHistoryUpdateTime.epoch) = 0;
        uint64_t v19 = MEMORY[0x1E4F1F9F8];
        *(_OWORD *)p_subjectRectStationardouble y = *MEMORY[0x1E4F1F9F8];
        *(void *)&self->_subjectRectStationaryTime.timescale = *(void *)(v19 + 16);
        return;
      }
      BYTE4(self->_subjectRectHistoryUpdateTime.epoch) = 1;
      goto LABEL_10;
    }
  }
}

- (BOOL)isSubjectRectStationary:(CGRect)a3
{
  if (self->_subjectRectHistoryCount != 10) {
    return 0;
  }
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGFloat width = a3.size.width;
  CGFloat height = a3.size.height;
  uint64_t v6 = 0;
  float32x2_t v7 = 0;
  float32x2_t v8 = 0;
  do
  {
    CGFloat v9 = self->_subjectRectHistoryBuffer[v6].origin.x;
    CGFloat v10 = self->_subjectRectHistoryBuffer[v6].origin.y;
    double v11 = self->_subjectRectHistoryBuffer[v6].size.width;
    double v12 = self->_subjectRectHistoryBuffer[v6].size.height;
    v38.origin.CGFloat x = v9;
    v38.origin.CGFloat y = v10;
    v38.size.CGFloat width = v11;
    v38.size.CGFloat height = v12;
    CGFloat MidX = CGRectGetMidX(v38);
    v39.origin.CGFloat x = v9;
    v39.origin.CGFloat y = v10;
    v39.size.CGFloat width = v11;
    v39.size.CGFloat height = v12;
    CGFloat MidY = CGRectGetMidY(v39);
    v14.f64[0] = MidX;
    v14.f64[1] = MidY;
    float32x2_t v7 = vadd_f32(v7, vcvt_f32_f64(v14));
    *(float *)&CGFloat MidY = v11;
    *(float *)v14.f64 = v12;
    HIDWORD(MidY) = LODWORD(v14.f64[0]);
    float32x2_t v8 = vadd_f32(v8, *(float32x2_t *)&MidY);
    ++v6;
  }
  while (v6 != 10);
  __asm { FMOV            V0.2S, #10.0 }
  float32x2_t v36 = vdiv_f32(v7, _D0);
  float32x2_t v20 = vdiv_f32(v8, _D0);
  [(CinematicFramingSessionOptions *)self->_options subjectMovementTolerance];
  float32x2_t v22 = vmul_n_f32(v20, v21 + 1.0);
  float32x2_t v23 = vmla_f32(v36, (float32x2_t)0xBF000000BF000000, v22);
  double v24 = v23.f32[0];
  double v25 = v23.f32[1];
  double v26 = v22.f32[0];
  double v27 = v22.f32[1];
  CGFloat v28 = x;
  CGFloat v29 = y;
  CGFloat v30 = width;
  CGFloat v31 = height;

  return CGRectContainsRect(*(CGRect *)&v24, *(CGRect *)&v28);
}

- (BOOL)isCurrentFramingIdeal:(CGRect)a3 withTolerance:(float)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double MidX = CGRectGetMidX(self->_deadband);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  double v11 = MidX - CGRectGetMidX(v19);
  if (v11 < 0.0) {
    double v11 = -v11;
  }
  float v12 = v11;
  double MidY = CGRectGetMidY(self->_deadband);
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  double v14 = CGRectGetMidY(v20);
  if (v12 / self->_deadband.size.width >= a4) {
    return 0;
  }
  float v15 = MidY - v14;
  BOOL v16 = v15 <= 0.0;
  if (v15 < 0.0) {
    float v15 = -v15;
  }
  float v17 = 0.3;
  if (v16) {
    float v17 = 1.0;
  }
  return v15 / (self->_deadband.size.height * v17) < a4;
}

- (CGRect)calculateBaselineViewportForTracks:(id)a3 atTime:(id *)a4
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  CGFloat v8 = *MEMORY[0x1E4F1DB20];
  CGFloat v7 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat v10 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat v9 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  [(FramingSpaceManager *)self->_framingSpaceManager framingSpaceBounds];
  CGFloat v67 = v12;
  CGFloat v68 = v11;
  CGFloat v65 = v14;
  CGFloat v66 = v13;
  [(SceneFramingEngine *)self defaultScreenWidth];
  float v16 = v15;
  -[FramingSpaceManager getHeightForWidth:](self->_framingSpaceManager, "getHeightForWidth:");
  float v18 = v17;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v19 = v6;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v86 objects:v90 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v87;
    double v64 = v16;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        CGFloat v75 = v8;
        CGFloat v77 = v7;
        CGFloat v79 = v10;
        if (*(void *)v87 != v22) {
          objc_enumerationMutation(v19);
        }
        double v24 = *(void **)(*((void *)&v86 + 1) + 8 * i);
        [v24 boundingBoxForFraming];
        double v29 = CGRectSafeIntersection(v25, v26, v27, v28, v68, v67, v66, v65);
        CGFloat r2_16 = v31;
        CGFloat r2_24 = v30;
        CGFloat rect = v32;
        long long v84 = *(_OWORD *)&a4->var0;
        int64_t var3 = a4->var3;
        [v24 faceBoundingBoxForFramingAtTime:&v84];
        v92.origin.CGFloat x = CGRectSafeIntersection(v33, v34, v35, v36, v68, v67, v66, v65);
        CGFloat x = v92.origin.x;
        CGFloat y = v92.origin.y;
        CGFloat width = v92.size.width;
        CGFloat height = v92.size.height;
        float v41 = fmin(CGRectGetWidth(v92), v64);
        v93.origin.CGFloat x = v29;
        v93.origin.CGFloat y = r2_24;
        v93.size.CGFloat width = r2_16;
        v93.size.CGFloat height = rect;
        float v42 = fmin(CGRectGetHeight(v93), v18);
        float r2_12 = v42;
        v94.origin.CGFloat x = x;
        v94.origin.CGFloat y = y;
        v94.size.CGFloat width = width;
        v94.size.CGFloat height = height;
        CGFloat v43 = v41;
        CGFloat r2 = CGRectGetMidX(v94) + v43 * -0.5;
        v95.origin.CGFloat x = x;
        v95.origin.CGFloat y = y;
        v95.size.CGFloat width = width;
        v95.size.CGFloat height = height;
        double MinY = CGRectGetMinY(v95);
        v96.origin.CGFloat x = v29;
        v96.origin.CGFloat y = r2_24;
        v96.size.CGFloat width = r2_16;
        v96.size.CGFloat height = rect;
        v107.origin.CGFloat y = fmin(MinY, CGRectGetMinY(v96));
        v107.size.CGFloat height = r2_12;
        v97.origin.CGFloat x = v75;
        v97.origin.CGFloat y = v77;
        v97.size.CGFloat width = v79;
        v97.size.CGFloat height = v9;
        v107.origin.CGFloat x = r2;
        v107.size.CGFloat width = v43;
        CGRect v98 = CGRectUnion(v97, v107);
        CGFloat v8 = v98.origin.x;
        CGFloat v7 = v98.origin.y;
        CGFloat v10 = v98.size.width;
        CGFloat v9 = v98.size.height;
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v86 objects:v90 count:16];
    }
    while (v21);
  }

  v99.origin.CGFloat x = CGRectSafeIntersection(v8, v7, v10, v9, v68, v67, v66, v65);
  CGFloat v45 = v99.origin.x;
  CGFloat v81 = v99.origin.y;
  CGFloat recta = v99.origin.x;
  CGFloat v46 = v99.origin.y;
  CGFloat v47 = v99.size.width;
  CGFloat v48 = v99.size.height;
  CGFloat v80 = CGRectGetWidth(v99);
  framingSpaceManager = self->_framingSpaceManager;
  v100.origin.CGFloat x = v45;
  v100.origin.CGFloat y = v46;
  CGFloat v50 = v47;
  v100.size.CGFloat width = v47;
  v100.size.CGFloat height = v48;
  CGFloat v51 = CGRectGetHeight(v100);
  *(float *)&CGFloat v51 = v51;
  [(FramingSpaceManager *)framingSpaceManager getWidthForHeight:v51];
  *(float *)&CGFloat v45 = fmax(v80, v52);
  [(FramingSpaceManager *)self->_framingSpaceManager maxAllowedViewportWidth];
  LODWORD(v47) = v53;
  [(SceneFramingEngine *)self minAllowedScreenWidth];
  float v78 = fminf(*(float *)&v47, fmaxf(v54, *(float *)&v45));
  -[FramingSpaceManager getHeightForWidth:](self->_framingSpaceManager, "getHeightForWidth:");
  LODWORD(v80) = v55;
  v101.origin.CGFloat x = v68;
  v101.origin.CGFloat y = v67;
  v101.size.CGFloat width = v66;
  v101.size.CGFloat height = v65;
  double MaxX = CGRectGetMaxX(v101);
  v102.origin.CGFloat x = v68;
  v102.origin.CGFloat y = v67;
  v102.size.CGFloat width = v66;
  v102.size.CGFloat height = v65;
  double r2_24a = CGRectGetMinX(v102);
  v103.origin.CGFloat x = recta;
  v103.origin.CGFloat y = v81;
  v103.size.CGFloat width = v50;
  v103.size.CGFloat height = v48;
  double r2_16a = CGRectGetMidX(v103);
  v104.origin.CGFloat x = v68;
  v104.origin.CGFloat y = v67;
  v104.size.CGFloat width = v66;
  v104.size.CGFloat height = v65;
  double MaxY = CGRectGetMaxY(v104);
  v105.origin.CGFloat x = recta;
  v105.origin.CGFloat y = v81;
  v105.size.CGFloat width = v50;
  v105.size.CGFloat height = v48;
  double v57 = CGRectGetMinY(v105);

  double v58 = v78;
  float v59 = fmin(MaxX - v78, fmax(r2_24a, r2_16a + v78 * -0.5));
  double v60 = *(float *)&v80;
  float v61 = fmin(MaxY - *(float *)&v80, v57);
  double v62 = v59;
  double v63 = v61;
  result.size.CGFloat height = v60;
  result.size.CGFloat width = v58;
  result.origin.CGFloat y = v63;
  result.origin.CGFloat x = v62;
  return result;
}

- (CGRect)calculateSubjectEnclosingRectangleForTracks:(id)a3 withBaselineWidth:(float)a4 currentViewport:(CGRect)a5 atTime:(id *)a6
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  CGFloat v11 = *MEMORY[0x1E4F1DB20];
  CGFloat v10 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat v13 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat v12 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  *(float *)&double v14 = a4;
  [(FramingSpaceManager *)self->_framingSpaceManager getHeightForWidth:v14];
  float v16 = v15;
  -[SceneFramingEngine computeDeadbandHeightFromViewportHeight:](self, "computeDeadbandHeightFromViewportHeight:");
  float v18 = v17;
  [(SceneFramingEngine *)self minAllowedDeadbandWidth];
  float v20 = v19;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id v21 = v9;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v85 objects:v89 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v86;
    double v76 = v16;
    double v77 = v18;
    double v74 = (float)(v20 * 0.5);
    double v75 = (float)(v18 * 0.5);
    __asm { FMOV            V0.2D, #1.0 }
    float64x2_t v73 = _Q0;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        v80.origin.CGFloat x = v11;
        v80.origin.CGFloat y = v10;
        v80.size.CGFloat width = v13;
        v80.size.CGFloat height = v12;
        if (*(void *)v86 != v24) {
          objc_enumerationMutation(v21);
        }
        double v31 = *(void **)(*((void *)&v85 + 1) + 8 * i);
        long long v83 = *(_OWORD *)&a6->var0;
        int64_t var3 = a6->var3;
        objc_msgSend(v31, "faceBoundingBoxForFramingAtTime:", &v83, *(_OWORD *)&v73);
        CGFloat x = v91.origin.x;
        CGFloat y = v91.origin.y;
        CGFloat width = v91.size.width;
        CGFloat height = v91.size.height;
        double v36 = CGRectGetHeight(v91) * 0.5;
        v92.origin.CGFloat x = x;
        v92.origin.CGFloat y = y;
        v92.size.CGFloat width = width;
        v92.size.CGFloat height = height;
        float v37 = fmax(fmin(v36, v77 + CGRectGetHeight(v92) * -0.6), 0.0);
        v93.origin.CGFloat x = x;
        v93.origin.CGFloat y = y;
        v93.size.CGFloat width = width;
        v93.size.CGFloat height = height;
        CGFloat MinX = CGRectGetMinX(v93);
        v94.origin.CGFloat x = x;
        v94.origin.CGFloat y = y;
        v94.size.CGFloat width = width;
        v94.size.CGFloat height = height;
        double v39 = v37;
        CGFloat v40 = CGRectGetMinY(v94) - v37;
        v95.origin.CGFloat x = x;
        v95.origin.CGFloat y = y;
        v95.size.CGFloat width = width;
        v95.size.CGFloat height = height;
        CGFloat v41 = CGRectGetWidth(v95);
        v96.origin.CGFloat x = x;
        v96.origin.CGFloat y = y;
        v96.size.CGFloat width = width;
        v96.size.CGFloat height = height;
        CGFloat v42 = CGRectGetHeight(v96) + v39;
        [(CinematicFramingSessionFramingParameters *)self->_activeFramingParameters deadbandTopOffsetFractionOfScreenHeight];
        double v44 = 1.0 - v43;
        [(CinematicFramingSessionFramingParameters *)self->_activeFramingParameters deadbandHeightFractionOfScreenHeight];
        *(float *)&double v44 = fmax((v44 - v45 + -0.100000001) * v76, 0.0);
        v97.origin.CGFloat x = MinX;
        v97.origin.CGFloat y = v40;
        v97.size.CGFloat width = v41;
        v97.size.CGFloat height = v42;
        *(float *)&double v44 = CGRectGetHeight(v97) - *(float *)&v44;
        [(CinematicFramingSessionFramingParameters *)self->_activeFramingParameters subjectHeightPaddingMultiplier];
        double v47 = v46;
        v98.origin.CGFloat x = MinX;
        v98.origin.CGFloat y = v40;
        v98.size.CGFloat width = v41;
        v98.size.CGFloat height = v42;
        *(float *)&double v39 = fmax(*(float *)&v44, fmin(v75, CGRectGetHeight(v98))) * v47;
        v99.origin.CGFloat x = MinX;
        v99.origin.CGFloat y = v40;
        v99.size.CGFloat width = v41;
        v99.size.CGFloat height = v42;
        CGFloat v48 = CGRectGetWidth(v99);
        [(CinematicFramingSessionFramingParameters *)self->_activeFramingParameters subjectWidthPaddingMultiplier];
        *(float *)&CGFloat v48 = fmax(v74, v48 * v49);
        v100.origin.CGFloat x = MinX;
        v100.origin.CGFloat y = v40;
        v100.size.CGFloat width = v41;
        v100.size.CGFloat height = v42;
        CGFloat v50 = *(float *)&v48;
        CGFloat v51 = CGRectGetMidX(v100) - v50 * 0.5;
        v101.origin.CGFloat x = MinX;
        v101.origin.CGFloat y = v40;
        v101.size.CGFloat width = v41;
        v101.size.CGFloat height = v42;
        CGFloat MinY = CGRectGetMinY(v101);
        v102.origin.CGFloat x = v51;
        v102.origin.CGFloat y = MinY;
        v102.size.CGFloat width = v50;
        v102.size.CGFloat height = *(float *)&v39;
        CGFloat MidX = CGRectGetMidX(v102);
        v103.origin.CGFloat x = v51;
        v103.origin.CGFloat y = MinY;
        v103.size.CGFloat width = v50;
        v103.size.CGFloat height = *(float *)&v39;
        CGFloat v79 = CGRectGetMinY(v103);
        v104.origin.CGFloat x = v51;
        v104.origin.CGFloat y = MinY;
        v104.size.CGFloat width = v50;
        v104.size.CGFloat height = *(float *)&v39;
        CGFloat v78 = CGRectGetMidX(v104);
        v105.origin.CGFloat x = v51;
        v105.origin.CGFloat y = MinY;
        v105.size.CGFloat width = v50;
        v105.size.CGFloat height = *(float *)&v39;
        v53.f64[0] = CGRectGetMaxY(v105);
        v54.f64[0] = v78;
        v54.f64[1] = MidX;
        v53.f64[1] = v79;
        float64x2_t v55 = vcvtq_f64_f32(vabs_f32(vcvt_f32_f64(v54)));
        float32x2_t v82 = vdiv_f32(vcvt_f32_f64(v53), vcvt_f32_f64(vaddq_f64(vmulq_f64(v55, v55), v73)));
        v53.f64[0] = v51;
        v55.f64[0] = MinY;
        v54.f64[0] = v50;
        double v56 = *(float *)&v39;
        CGFloat v57 = CGRectGetMinX(*(CGRect *)v53.f64);
        v106.origin.CGFloat x = v51;
        v106.origin.CGFloat y = MinY;
        v106.size.CGFloat width = v50;
        v106.size.CGFloat height = *(float *)&v39;
        v109.size.CGFloat width = CGRectGetWidth(v106);
        v109.size.CGFloat height = (float)(v82.f32[0] - v82.f32[1]);
        v109.origin.CGFloat x = v57;
        v109.origin.CGFloat y = v82.f32[1];
        CGRect v107 = CGRectUnion(v80, v109);
        CGFloat v11 = v107.origin.x;
        CGFloat v10 = v107.origin.y;
        CGFloat v13 = v107.size.width;
        CGFloat v12 = v107.size.height;
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v85 objects:v89 count:16];
    }
    while (v23);
  }

  [(FramingSpaceManager *)self->_framingSpaceManager framingSpaceBounds];
  double v62 = CGRectSafeIntersection(v11, v10, v13, v12, v58, v59, v60, v61);
  double v64 = v63;
  double v66 = v65;
  double v68 = v67;

  double v69 = v62;
  double v70 = v64;
  double v71 = v66;
  double v72 = v68;
  result.size.CGFloat height = v72;
  result.size.CGFloat width = v71;
  result.origin.CGFloat y = v70;
  result.origin.CGFloat x = v69;
  return result;
}

- (float)calculateViewportWidthToFitSubjectsInDeadband:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(FramingSpaceManager *)self->_framingSpaceManager framingSpaceBounds];
  CGFloat v9 = v8;
  CGFloat v55 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v52 = v14;
  [(SceneFramingEngine *)self minAllowedScreenWidth];
  float v58 = v15;
  [(CinematicFramingSessionFramingParameters *)self->_activeFramingParameters deadbandWidthFractionOfScreenWidth];
  *(double *)&int32x2_t v17 = (1.0 - v16) * 0.5;
  *(float *)v17.i32 = *(double *)v17.i32;
  int32x2_t v56 = v17;
  v60.origin.CGFloat x = x;
  v60.origin.CGFloat y = y;
  CGFloat v53 = width;
  v60.size.CGFloat width = width;
  v60.size.CGFloat height = height;
  CGFloat MinX = CGRectGetMinX(v60);
  v61.origin.CGFloat x = x;
  v61.origin.CGFloat y = y;
  v61.size.CGFloat width = width;
  v61.size.CGFloat height = height;
  CGFloat MaxX = CGRectGetMaxX(v61);
  v19.f64[0] = MinX;
  v19.f64[1] = MaxX;
  double v20 = COERCE_DOUBLE(vcvt_f32_f64(v19));
  double v21 = COERCE_DOUBLE(vdup_lane_s32(v56, 0));
  CGFloat v22 = v9;
  v19.f64[0] = v11;
  CGFloat v23 = v13;
  CGFloat v24 = v52;
  CGFloat v57 = CGRectGetMinX(*(CGRect *)((char *)&v19 - 8));
  v62.origin.CGFloat x = v9;
  v62.origin.CGFloat y = v11;
  v62.size.CGFloat width = v13;
  v62.size.CGFloat height = v52;
  CGFloat v25 = CGRectGetMaxX(v62);
  v26.f64[0] = v57;
  v26.f64[1] = v25;
  LODWORD(v57) = ComputeSizeToFitSubjectsInDeadband(v58, v20, v21, COERCE_DOUBLE(vcvt_f32_f64(v26)), v27, v28, v29);
  *(float *)&double v30 = v58;
  [(FramingSpaceManager *)self->_framingSpaceManager getHeightForWidth:v30];
  LODWORD(v21) = v31;
  [(CinematicFramingSessionFramingParameters *)self->_activeFramingParameters deadbandTopOffsetFractionOfScreenHeight];
  float v59 = v32;
  [(CinematicFramingSessionFramingParameters *)self->_activeFramingParameters deadbandHeightFractionOfScreenHeight];
  float v34 = 1.0 - v33 - v59;
  *(float *)&CGFloat MinX = v34;
  v63.origin.CGFloat x = x;
  v63.origin.CGFloat y = y;
  v63.size.CGFloat width = v53;
  v63.size.CGFloat height = height;
  CGFloat MinY = CGRectGetMinY(v63);
  v64.origin.CGFloat x = x;
  v64.origin.CGFloat y = y;
  v64.size.CGFloat width = v53;
  v64.size.CGFloat height = height;
  CGFloat MaxY = CGRectGetMaxY(v64);
  v36.f64[0] = MinY;
  v36.f64[1] = MaxY;
  double v37 = COERCE_DOUBLE(vcvt_f32_f64(v36));
  CGFloat v38 = v55;
  v36.f64[0] = v11;
  CGFloat v39 = v13;
  CGFloat v40 = v52;
  CGFloat v54 = CGRectGetMinY(*(CGRect *)((char *)&v36 - 8));
  v65.origin.CGFloat x = v55;
  v65.origin.CGFloat y = v11;
  v65.size.CGFloat width = v13;
  v65.size.CGFloat height = v52;
  CGFloat v41 = CGRectGetMaxY(v65);
  v42.f64[0] = v54;
  v42.f64[1] = v41;
  LODWORD(height) = ComputeSizeToFitSubjectsInDeadband(*(float *)&v21, v37, COERCE_DOUBLE(__PAIR64__(LODWORD(MinX), LODWORD(v59))), COERCE_DOUBLE(vcvt_f32_f64(v42)), v43, v44, v45);
  [(FramingSpaceManager *)self->_framingSpaceManager maxAllowedViewportWidth];
  LODWORD(v37) = v46;
  LODWORD(v47) = LODWORD(height);
  [(FramingSpaceManager *)self->_framingSpaceManager getWidthForHeight:v47];
  return fminf(*(float *)&v37, fmaxf(*(float *)&v57, v48));
}

- (CGRect)calculateViewportCenteredAround:(CGRect)a3 withWidth:(float)a4
{
  CGFloat rect = a3.size.height;
  CGFloat y = a3.origin.y;
  CGFloat width = a3.size.width;
  CGFloat v5 = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGFloat v24 = a3.origin.x;
  *(float *)&a3.origin.CGFloat x = a4;
  [(FramingSpaceManager *)self->_framingSpaceManager getHeightForWidth:a3.origin.x];
  float v27 = v8;
  [(FramingSpaceManager *)self->_framingSpaceManager framingSpaceBounds];
  CGFloat v9 = v29.origin.x;
  CGFloat v10 = v29.origin.y;
  CGFloat v11 = v29.size.width;
  CGFloat height = v29.size.height;
  double v13 = a4;
  double v23 = CGRectGetMaxX(v29) - v13;
  v30.origin.CGFloat x = v9;
  v30.origin.CGFloat y = v10;
  v30.size.CGFloat width = v11;
  v30.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v30);
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = v5;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = rect;
  float v15 = fmin(v23, fmax(MinX, CGRectGetMidX(v31) + v13 * -0.5));
  *(float *)&double v23 = v15;
  v32.origin.CGFloat x = v9;
  v32.origin.CGFloat y = v10;
  v32.size.CGFloat width = v11;
  v32.size.CGFloat height = height;
  double v16 = CGRectGetMaxY(v32) - v27;
  v33.origin.CGFloat x = v9;
  v33.origin.CGFloat y = v10;
  v33.size.CGFloat width = v11;
  v33.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v33);
  v34.origin.CGFloat x = v24;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = rect;
  float v18 = fmin(v16, fmax(MinY, CGRectGetMinY(v34)));
  double v19 = *(float *)&v23;
  double v20 = v18;
  double v21 = v13;
  double v22 = v27;
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (CGRect)computeCroppedSubjectEnclosingRectForViewportWidth:(float)a3 subjectEnclosingRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat v51 = a4.size.height;
  CGFloat v5 = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  [(FramingSpaceManager *)self->_framingSpaceManager framingSpaceBounds];
  CGFloat v54 = v9;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [(CinematicFramingSessionFramingParameters *)self->_activeFramingParameters deadbandWidthFractionOfScreenWidth];
  float v17 = (1.0 - v16) * 0.5;
  float v52 = v17;
  v55.origin.CGFloat x = x;
  CGFloat v49 = x;
  v55.origin.CGFloat y = y;
  v55.size.CGFloat width = v5;
  v55.size.CGFloat height = height;
  float MinX = CGRectGetMinX(v55);
  v56.origin.CGFloat x = x;
  v56.origin.CGFloat y = y;
  v56.size.CGFloat width = v5;
  v56.size.CGFloat height = height;
  float MaxX = CGRectGetMaxX(v56);
  v57.origin.CGFloat x = v54;
  CGFloat v47 = v11;
  v57.origin.CGFloat y = v11;
  v57.size.CGFloat width = v13;
  v57.size.CGFloat height = v15;
  *(float *)&CGFloat v5 = CGRectGetMinX(v57);
  v58.origin.CGFloat x = v54;
  v58.origin.CGFloat y = v11;
  v58.size.CGFloat width = v13;
  v58.size.CGFloat height = v15;
  CGFloat v20 = CGRectGetMaxX(v58);
  *(float *)v21.i32 = *(float *)&v5 + (float)(a3 * v52);
  *(float *)&CGFloat v20 = v20;
  *(float *)&CGFloat v20 = *(float *)&v20 - (float)(a3 * v52);
  BOOL v22 = *(float *)&v20 < MinX;
  *(float *)&double v23 = fmaxf(MinX, *(float *)v21.i32);
  HIDWORD(v23) = fminf(MaxX, *(float *)&v20);
  double v24 = COERCE_DOUBLE(vdup_lane_s32(*(int32x2_t *)&v20, 0));
  if (!v22) {
    double v24 = v23;
  }
  double v25 = COERCE_DOUBLE(vdup_lane_s32(v21, 0));
  if (*(float *)v21.i32 > MaxX) {
    double v24 = v25;
  }
  float32x2_t v53 = *(float32x2_t *)&v24;
  [(CinematicFramingSessionFramingParameters *)self->_activeFramingParameters deadbandTopOffsetFractionOfScreenHeight];
  float v46 = v26;
  [(CinematicFramingSessionFramingParameters *)self->_activeFramingParameters deadbandHeightFractionOfScreenHeight];
  float v45 = v27;
  *(float *)&double v28 = a3;
  [(FramingSpaceManager *)self->_framingSpaceManager getHeightForWidth:v28];
  float v30 = v29;
  v59.origin.CGFloat x = v49;
  v59.origin.CGFloat y = y;
  v59.size.CGFloat width = width;
  v59.size.CGFloat height = v51;
  float MinY = CGRectGetMinY(v59);
  v60.origin.CGFloat x = v49;
  v60.origin.CGFloat y = y;
  v60.size.CGFloat width = width;
  v60.size.CGFloat height = v51;
  float MaxY = CGRectGetMaxY(v60);
  v61.origin.CGFloat x = v54;
  v61.origin.CGFloat y = v11;
  v61.size.CGFloat width = v13;
  v61.size.CGFloat height = v15;
  float v33 = CGRectGetMinY(v61);
  v62.origin.CGFloat x = v54;
  v62.origin.CGFloat y = v47;
  v62.size.CGFloat width = v13;
  v62.size.CGFloat height = v15;
  CGFloat v34 = CGRectGetMaxY(v62);
  *(float *)v35.i32 = v33 + (float)(v30 * v46);
  *(float *)&CGFloat v34 = v34;
  float v36 = 1.0 - v45 - v46;
  *(float *)&CGFloat v34 = *(float *)&v34 - (float)(v30 * v36);
  BOOL v22 = *(float *)&v34 < MinY;
  *(float *)&double v37 = fmaxf(MinY, *(float *)v35.i32);
  HIDWORD(v37) = fminf(MaxY, *(float *)&v34);
  double v38 = COERCE_DOUBLE(vdup_lane_s32(*(int32x2_t *)&v34, 0));
  if (!v22) {
    double v38 = v37;
  }
  double v39 = COERCE_DOUBLE(vdup_lane_s32(v35, 0));
  if (*(float *)v35.i32 > MaxY) {
    *(double *)&float32x2_t v40 = v39;
  }
  else {
    *(double *)&float32x2_t v40 = v38;
  }
  double v41 = v53.f32[0];
  double v42 = v40.f32[0];
  double v43 = vsub_f32((float32x2_t)vdup_lane_s32((int32x2_t)v53, 1), v53).f32[0];
  double v44 = vsub_f32((float32x2_t)vdup_lane_s32((int32x2_t)v40, 1), v40).f32[0];
  result.size.CGFloat height = v44;
  result.size.CGFloat width = v43;
  result.origin.CGFloat y = v42;
  result.origin.CGFloat x = v41;
  return result;
}

- (CGRect)determineDeadbandForSubjectEnclosingRect:(CGRect)a3 oldDeadband:(CGRect)a4 newDeadbandWidth:(float)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  float64_t y = a4.origin.y;
  CGFloat x = a4.origin.x;
  -[SceneFramingEngine computeViewportWidthFromDeadbandWidth:](self, "computeViewportWidthFromDeadbandWidth:");
  -[SceneFramingEngine computeCroppedSubjectEnclosingRectForViewportWidth:subjectEnclosingRect:](self, "computeCroppedSubjectEnclosingRectForViewportWidth:subjectEnclosingRect:");
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  [(FramingSpaceManager *)self->_framingSpaceManager framingSpaceBounds];
  CGFloat v76 = v18;
  CGFloat v77 = v17;
  CGFloat v67 = v19;
  CGFloat v75 = v20;
  [(CinematicFramingSessionFramingParameters *)self->_activeFramingParameters deadbandWidthFractionOfScreenWidth];
  double v22 = (1.0 - v21) * 0.5;
  [(CinematicFramingSessionFramingParameters *)self->_activeFramingParameters deadbandWidthFractionOfScreenWidth];
  *(double *)&int32x2_t v24 = v22 / v23;
  *(float *)v24.i32 = *(double *)v24.i32;
  int32x2_t v78 = v24;
  v80.origin.CGFloat x = v10;
  v80.origin.float64_t y = v12;
  v80.size.CGFloat width = v14;
  v80.size.CGFloat height = v16;
  CGFloat MinX = CGRectGetMinX(v80);
  v81.origin.CGFloat x = v10;
  v81.origin.float64_t y = v12;
  v81.size.CGFloat width = v14;
  v81.size.CGFloat height = v16;
  CGFloat MaxX = CGRectGetMaxX(v81);
  v26.f64[0] = MinX;
  v26.f64[1] = MaxX;
  double v27 = COERCE_DOUBLE(vcvt_f32_f64(v26));
  CGFloat v69 = y;
  CGFloat v28 = x;
  v26.f64[0] = y;
  CGFloat v70 = width;
  CGFloat v29 = width;
  CGFloat v30 = height;
  CGFloat v72 = CGRectGetMinX(*(CGRect *)((char *)&v26 - 8));
  v82.origin.CGFloat x = x;
  v82.origin.float64_t y = y;
  v82.size.CGFloat width = width;
  v82.size.CGFloat height = height;
  CGFloat v31 = CGRectGetMaxX(v82);
  v32.f64[0] = v72;
  v32.f64[1] = v31;
  double v33 = COERCE_DOUBLE(vcvt_f32_f64(v32));
  double v34 = COERCE_DOUBLE(vdup_lane_s32(v78, 0));
  CGFloat v35 = v77;
  v32.f64[0] = v76;
  CGFloat v36 = v67;
  CGFloat v37 = v75;
  CGFloat v79 = CGRectGetMinX(*(CGRect *)((char *)&v32 - 8));
  v83.origin.CGFloat x = v77;
  v83.origin.float64_t y = v76;
  v83.size.CGFloat width = v67;
  v83.size.CGFloat height = v75;
  CGFloat v38 = CGRectGetMaxX(v83);
  v39.f64[0] = v79;
  v39.f64[1] = v38;
  LODWORD(v72) = DetermineNewDeadbandMinComponent(v27, v33, v34, vcvt_f32_f64(v39).f32[0], a5);
  [(CinematicFramingSessionFramingParameters *)self->_activeFramingParameters deadbandTopOffsetFractionOfScreenHeight];
  LODWORD(v27) = v40;
  [(CinematicFramingSessionFramingParameters *)self->_activeFramingParameters deadbandHeightFractionOfScreenHeight];
  *(float *)&CGFloat v79 = *(float *)&v27 / v41;
  [(CinematicFramingSessionFramingParameters *)self->_activeFramingParameters deadbandHeightFractionOfScreenHeight];
  double v43 = 1.0 - v42;
  [(CinematicFramingSessionFramingParameters *)self->_activeFramingParameters deadbandHeightFractionOfScreenHeight];
  double v45 = v43 / v44 - *(float *)&v79;
  *(float *)&double v45 = v45;
  unsigned int v66 = LODWORD(v45);
  *(float *)&double v45 = a5;
  [(SceneFramingEngine *)self computeDeadbandHeightForWidth:v45];
  LODWORD(v43) = v46;
  v84.origin.CGFloat x = v10;
  v84.origin.float64_t y = v12;
  v84.size.CGFloat width = v14;
  v84.size.CGFloat height = v16;
  CGFloat MinY = CGRectGetMinY(v84);
  v85.origin.CGFloat x = v10;
  v85.origin.float64_t y = v12;
  v85.size.CGFloat width = v14;
  v85.size.CGFloat height = v16;
  CGFloat MaxY = CGRectGetMaxY(v85);
  v48.f64[0] = MinY;
  v48.f64[1] = MaxY;
  double v49 = COERCE_DOUBLE(vcvt_f32_f64(v48));
  CGFloat v50 = x;
  v48.f64[0] = v69;
  CGFloat v51 = v70;
  CGFloat v52 = height;
  CGFloat v68 = CGRectGetMinY(*(CGRect *)((char *)&v48 - 8));
  v86.origin.CGFloat x = x;
  v86.origin.float64_t y = v69;
  v86.size.CGFloat width = v70;
  v86.size.CGFloat height = height;
  CGFloat v53 = CGRectGetMaxY(v86);
  v54.f64[0] = v68;
  v54.f64[1] = v53;
  double v55 = COERCE_DOUBLE(vcvt_f32_f64(v54));
  CGFloat v56 = v77;
  v54.f64[0] = v76;
  CGFloat v57 = v67;
  CGFloat v58 = v75;
  CGFloat v74 = CGRectGetMinY(*(CGRect *)((char *)&v54 - 8));
  v87.origin.CGFloat x = v77;
  v87.origin.float64_t y = v76;
  v87.size.CGFloat width = v67;
  v87.size.CGFloat height = v75;
  CGFloat v59 = CGRectGetMaxY(v87);
  v60.f64[0] = v74;
  v60.f64[1] = v59;
  double v61 = DetermineNewDeadbandMinComponent(v49, v55, COERCE_DOUBLE(__PAIR64__(v66, LODWORD(v79))), vcvt_f32_f64(v60).f32[0], *(float *)&v43);
  double v62 = a5;
  double v63 = *(float *)&v43;
  double v64 = *(float *)&v72;
  result.size.CGFloat height = v63;
  result.size.CGFloat width = v62;
  result.origin.float64_t y = v61;
  result.origin.CGFloat x = v64;
  return result;
}

- (float)defaultScreenWidth
{
  [(CinematicFramingSessionOptions *)self->_options viewportDefaultFOV];
  float v4 = v3;
  framingSpaceManager = self->_framingSpaceManager;
  [(CinematicFramingSessionOptions *)self->_options viewportDefaultFOV];
  -[FramingSpaceManager getWidthForHeight:](framingSpaceManager, "getWidthForHeight:");
  if (v4 <= v6)
  {
    double v9 = self->_framingSpaceManager;
    [(CinematicFramingSessionOptions *)self->_options viewportDefaultFOV];
    -[FramingSpaceManager getWidthForHeight:](v9, "getWidthForHeight:");
  }
  else
  {
    options = self->_options;
    [(CinematicFramingSessionOptions *)options viewportDefaultFOV];
  }
  return result;
}

- (float)minAllowedScreenWidth
{
  [(CinematicFramingSessionOptions *)self->_options viewportMinimumFOV];
  float v4 = v3;
  framingSpaceManager = self->_framingSpaceManager;
  [(CinematicFramingSessionOptions *)self->_options viewportMinimumFOV];
  -[FramingSpaceManager getWidthForHeight:](framingSpaceManager, "getWidthForHeight:");
  if (v4 <= v6)
  {
    double v9 = self->_framingSpaceManager;
    [(CinematicFramingSessionOptions *)self->_options viewportMinimumFOV];
    -[FramingSpaceManager getWidthForHeight:](v9, "getWidthForHeight:");
  }
  else
  {
    options = self->_options;
    [(CinematicFramingSessionOptions *)options viewportMinimumFOV];
  }
  return result;
}

- (float)minAllowedDeadbandWidth
{
  [(SceneFramingEngine *)self minAllowedScreenWidth];
  float v4 = v3;
  [(CinematicFramingSessionFramingParameters *)self->_activeFramingParameters deadbandWidthFractionOfScreenWidth];
  return v4 * v5;
}

- (float)computeViewportWidthFromDeadbandWidth:(float)a3
{
  [(CinematicFramingSessionFramingParameters *)self->_activeFramingParameters deadbandWidthFractionOfScreenWidth];
  return a3 / v4;
}

- (CGRect)computeViewportFromDeadband:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (CGRectIsNull(a3))
  {
    double v8 = *MEMORY[0x1E4F1DB20];
    double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  else
  {
    v36.origin.CGFloat x = x;
    v36.origin.CGFloat y = y;
    v36.size.CGFloat width = width;
    v36.size.CGFloat height = height;
    CGFloat v12 = CGRectGetWidth(v36);
    *(float *)&CGFloat v12 = v12;
    [(SceneFramingEngine *)self computeViewportWidthFromDeadbandWidth:v12];
    float v14 = v13;
    -[FramingSpaceManager getHeightForWidth:](self->_framingSpaceManager, "getHeightForWidth:");
    float v16 = v15;
    v37.origin.CGFloat x = x;
    v37.origin.CGFloat y = y;
    v37.size.CGFloat width = width;
    v37.size.CGFloat height = height;
    double v10 = v14;
    float v17 = CGRectGetMidX(v37) + v14 * -0.5;
    v38.origin.CGFloat x = x;
    v38.origin.CGFloat y = y;
    v38.size.CGFloat width = width;
    v38.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v38);
    [(CinematicFramingSessionFramingParameters *)self->_activeFramingParameters deadbandTopOffsetFractionOfScreenHeight];
    float v20 = MinY - (float)(v16 * v19);
    double v8 = v17;
    double v9 = v20;
    double v11 = v16;
    if ((LODWORD(self->_targetViewportForFloating.size.height) & 0xFFFFFFFE) == 2)
    {
      -[SceneFramingEngine applyNewsroomViewportAdjustments:](self, "applyNewsroomViewportAdjustments:", v17, v9, v14, v16);
      double v8 = v21;
      double v9 = v22;
      double v10 = v23;
      double v11 = v24;
    }
    [(FramingSpaceManager *)self->_framingSpaceManager maxAllowedViewportWidth];
    float v26 = v25;
    [(FramingSpaceManager *)self->_framingSpaceManager maxAllowedViewportWidth];
    if (v14 > (float)(*(float *)&v27 * 0.95))
    {
      framingSpaceManager = self->_framingSpaceManager;
      *(float *)&double v27 = v26;
      if (v14 <= v16)
      {
        [(FramingSpaceManager *)framingSpaceManager getWidthForHeight:v27];
        float v31 = v30;
        float v29 = v26;
        float v26 = v31;
      }
      else
      {
        [(FramingSpaceManager *)framingSpaceManager getHeightForWidth:v27];
      }
      double v8 = (float)(v26 * -0.5);
      double v9 = (float)(v29 * -0.5);
      double v10 = v26;
      double v11 = v29;
    }
  }
  double v32 = v8;
  double v33 = v9;
  double v34 = v10;
  double v35 = v11;
  result.size.CGFloat height = v35;
  result.size.CGFloat width = v34;
  result.origin.CGFloat y = v33;
  result.origin.CGFloat x = v32;
  return result;
}

- (float)computeDeadbandWidthFromViewportWidth:(float)a3
{
  [(CinematicFramingSessionFramingParameters *)self->_activeFramingParameters deadbandWidthFractionOfScreenWidth];
  return v4 * a3;
}

- (float)computeDeadbandHeightFromViewportHeight:(float)a3
{
  [(CinematicFramingSessionFramingParameters *)self->_activeFramingParameters deadbandHeightFractionOfScreenHeight];
  return v4 * a3;
}

- (CGRect)computeDeadbandFromViewport:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (CGRectIsNull(a3))
  {
    double v8 = *MEMORY[0x1E4F1DB20];
    double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  else
  {
    if ((LODWORD(self->_targetViewportForFloating.size.height) & 0xFFFFFFFE) == 2)
    {
      -[SceneFramingEngine undoNewsroomViewportAdjustments:](self, "undoNewsroomViewportAdjustments:", x, y, width, height);
      double x = v12;
      double y = v13;
      double width = v14;
      double height = v15;
    }
    v26.origin.double x = x;
    v26.origin.double y = y;
    v26.size.double width = width;
    v26.size.double height = height;
    CGFloat v16 = CGRectGetWidth(v26);
    *(float *)&CGFloat v16 = v16;
    [(SceneFramingEngine *)self computeDeadbandWidthFromViewportWidth:v16];
    float v18 = v17;
    v27.origin.double x = x;
    v27.origin.double y = y;
    v27.size.double width = width;
    v27.size.double height = height;
    CGFloat v19 = CGRectGetHeight(v27);
    *(float *)&CGFloat v19 = v19;
    [(SceneFramingEngine *)self computeDeadbandHeightFromViewportHeight:v19];
    float v21 = v20;
    v28.origin.double x = x;
    v28.origin.double y = y;
    v28.size.double width = width;
    v28.size.double height = height;
    CGFloat MinY = CGRectGetMinY(v28);
    v29.origin.double x = x;
    v29.origin.double y = y;
    v29.size.double width = width;
    v29.size.double height = height;
    double v23 = CGRectGetHeight(v29);
    [(CinematicFramingSessionFramingParameters *)self->_activeFramingParameters deadbandTopOffsetFractionOfScreenHeight];
    *(float *)&CGFloat MinY = MinY + v23 * v24;
    v30.origin.double x = x;
    v30.origin.double y = y;
    v30.size.double width = width;
    v30.size.double height = height;
    CGFloat MidX = CGRectGetMidX(v30);
    double v10 = v18;
    double v8 = MidX + v18 * -0.5;
    double v9 = *(float *)&MinY;
    double v11 = v21;
  }
  result.size.double height = v11;
  result.size.double width = v10;
  result.origin.double y = v9;
  result.origin.double x = v8;
  return result;
}

- (float)computeDeadbandHeightForWidth:(float)a3
{
  [(CinematicFramingSessionFramingParameters *)self->_activeFramingParameters deadbandWidthFractionOfScreenWidth];
  *(float *)&double v6 = a3 / v5;
  [(FramingSpaceManager *)self->_framingSpaceManager getHeightForWidth:v6];
  float v8 = v7;
  [(CinematicFramingSessionFramingParameters *)self->_activeFramingParameters deadbandHeightFractionOfScreenHeight];
  return v8 * v9;
}

- (float)computeDeadbandWidthForHeight:(float)a3
{
  [(CinematicFramingSessionFramingParameters *)self->_activeFramingParameters deadbandHeightFractionOfScreenHeight];
  *(float *)&double v6 = a3 / v5;
  [(FramingSpaceManager *)self->_framingSpaceManager getWidthForHeight:v6];
  float v8 = v7;
  [(CinematicFramingSessionFramingParameters *)self->_activeFramingParameters deadbandWidthFractionOfScreenWidth];
  return v8 * v9;
}

- (CGRect)applyNewsroomViewportAdjustments:(CGRect)a3
{
  double y = a3.origin.y;
  double x = a3.origin.x;
  double viewportOffsetX = self->_newsroomFramingParameters.viewportOffsetX;
  framingSpaceManager = self->_framingSpaceManager;
  if (a3.size.width >= a3.size.height)
  {
    double v10 = a3.size.height * viewportOffsetX;
    *(float *)&double viewportOffsetX = a3.size.height * viewportOffsetX;
    [(FramingSpaceManager *)framingSpaceManager getWidthForHeight:viewportOffsetX];
    double v8 = v11;
  }
  else
  {
    double v8 = a3.size.width * viewportOffsetX;
    *(float *)&double viewportOffsetX = a3.size.width * viewportOffsetX;
    [(FramingSpaceManager *)framingSpaceManager getHeightForWidth:viewportOffsetX];
    double v10 = v9;
  }
  double v12 = x + v8 * *(float *)&self->_returningHomeTargetRect[8];
  double v13 = y + v10 * *(float *)&self->_returningHomeTargetRect[12];
  double v14 = v8;
  double v15 = v10;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (CGRect)undoNewsroomViewportAdjustments:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  float v7 = *(float *)&self->_returningHomeTargetRect[8];
  float v8 = *(float *)&self->_returningHomeTargetRect[12];
  double viewportOffsetX = self->_newsroomFramingParameters.viewportOffsetX;
  framingSpaceManager = self->_framingSpaceManager;
  if (a3.size.width >= a3.size.height)
  {
    double v13 = a3.size.height / viewportOffsetX;
    *(float *)&double viewportOffsetX = a3.size.height / viewportOffsetX;
    [(FramingSpaceManager *)framingSpaceManager getWidthForHeight:viewportOffsetX];
    double v11 = v14;
  }
  else
  {
    double v11 = a3.size.width / viewportOffsetX;
    *(float *)&double viewportOffsetX = a3.size.width / viewportOffsetX;
    [(FramingSpaceManager *)framingSpaceManager getHeightForWidth:viewportOffsetX];
    double v13 = v12;
  }
  double v15 = y - height * v8;
  double v16 = x - width * v7;
  double v17 = v11;
  double v18 = v13;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v15;
  result.origin.double x = v16;
  return result;
}

- (CinematicFramingSessionOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (int)framingStyle
{
  return LODWORD(self->_targetViewportForFloating.size.height);
}

- (CGRect)deadband
{
  double x = self->_deadband.origin.x;
  double y = self->_deadband.origin.y;
  double width = self->_deadband.size.width;
  double height = self->_deadband.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingFramingParameters.circleSize, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_activeFramingParameters, 0);

  objc_storeStrong((id *)&self->_framingSpaceManager, 0);
}

@end