@interface CinematicFramingDirector
- (CGRect)currentViewport;
- (CGRect)deadband;
- (CGRect)idealViewport;
- (CGRect)slackViewport;
- (CGRect)targetViewport;
- (CinematicFramingDirector)initWithFramingSpaceManager:(id)a3;
- (CinematicFramingSessionOptions)options;
- (float)zoomLevel;
- (int)framingStyle;
- (void)computeSceneFramingForMetadata:(id)a3;
- (void)reset;
- (void)resetCameraViewport:(CGRect)a3;
- (void)setFramingStyle:(int)a3;
- (void)setOptions:(id)a3;
- (void)setZoomLevel:(float)a3;
- (void)updateWithMetadata:(id)a3;
@end

@implementation CinematicFramingDirector

- (CinematicFramingDirector)initWithFramingSpaceManager:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CinematicFramingDirector;
  v6 = [(CinematicFramingDirector *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_framingSpaceManager, a3);
    v8 = objc_alloc_init(CinematicTracker);
    tracker = v7->_tracker;
    v7->_tracker = v8;

    v10 = [[RectangleAnimator alloc] initWithFramingSpaceManager:v5];
    rectangleAnimator = v7->_rectangleAnimator;
    v7->_rectangleAnimator = v10;

    v12 = [[SceneFramingEngine alloc] initWithFramingSpaceManager:v5];
    sceneFramingEngine = v7->_sceneFramingEngine;
    v7->_sceneFramingEngine = v12;
  }
  return v7;
}

- (CinematicFramingSessionOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
  id v5 = a3;
  [(CinematicTracker *)self->_tracker setOptions:v5];
  [(RectangleAnimator *)self->_rectangleAnimator setOptions:v5];
  [(SceneFramingEngine *)self->_sceneFramingEngine setOptions:v5];
}

- (void)updateWithMetadata:(id)a3
{
  id v4 = a3;
  tracker = self->_tracker;
  v6 = [v4 faceDetections];
  v7 = [v4 bodyDetections];
  if (v4) {
    [v4 timestamp];
  }
  else {
    memset(v17, 0, sizeof(v17));
  }
  -[CinematicTracker processFaceDetections:bodyDetections:atTime:inView:](tracker, "processFaceDetections:bodyDetections:atTime:inView:", v6, v7, v17, self->_targetViewport.origin.x, self->_targetViewport.origin.y, self->_targetViewport.size.width, self->_targetViewport.size.height);

  [(CinematicFramingDirector *)self computeSceneFramingForMetadata:v4];
  v8 = [(CinematicFramingDirector *)self options];
  int v9 = [v8 shouldDisableTransitions];

  if (v9)
  {
    CGSize size = self->_targetViewport.size;
    self->_currentViewport.origin = self->_targetViewport.origin;
    self->_currentViewport.CGSize size = size;
  }
  else
  {
    [(RectangleAnimator *)self->_rectangleAnimator rectangle];
    CGRectIsNull(v18);
    rectangleAnimator = self->_rectangleAnimator;
    if (v4) {
      [v4 timestamp];
    }
    else {
      memset(v16, 0, sizeof(v16));
    }
    -[RectangleAnimator driveAnimationToTarget:atTime:](rectangleAnimator, "driveAnimationToTarget:atTime:", v16, self->_targetViewport.origin.x, self->_targetViewport.origin.y, self->_targetViewport.size.width, self->_targetViewport.size.height);
    self->_currentViewport.origin.x = v12;
    self->_currentViewport.origin.y = v13;
    self->_currentViewport.size.width = v14;
    self->_currentViewport.size.height = v15;
  }
}

- (void)resetCameraViewport:(CGRect)a3
{
  -[RectangleAnimator resetToRectangle:](self->_rectangleAnimator, "resetToRectangle:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  sceneFramingEngine = self->_sceneFramingEngine;

  [(SceneFramingEngine *)sceneFramingEngine reset];
}

- (void)reset
{
  [(SceneFramingEngine *)self->_sceneFramingEngine reset];
  rectangleAnimator = self->_rectangleAnimator;
  [(SceneFramingEngine *)self->_sceneFramingEngine defaultViewport];
  -[RectangleAnimator resetToRectangle:](rectangleAnimator, "resetToRectangle:");
  [(SceneFramingEngine *)self->_sceneFramingEngine defaultViewport];
  self->_currentViewport.origin.x = v4;
  self->_currentViewport.origin.y = v5;
  self->_currentViewport.size.width = v6;
  self->_currentViewport.size.height = v7;
  [(SceneFramingEngine *)self->_sceneFramingEngine defaultViewport];
  self->_targetViewport.origin.x = v8;
  self->_targetViewport.origin.y = v9;
  self->_targetViewport.size.width = v10;
  self->_targetViewport.size.height = v11;
}

- (int)framingStyle
{
  return [(SceneFramingEngine *)self->_sceneFramingEngine framingStyle];
}

- (void)setFramingStyle:(int)a3
{
}

- (CGRect)idealViewport
{
  [(SceneFramingEngine *)self->_sceneFramingEngine idealViewport];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)slackViewport
{
  [(SceneFramingEngine *)self->_sceneFramingEngine slackViewport];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)deadband
{
  [(SceneFramingEngine *)self->_sceneFramingEngine deadband];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (float)zoomLevel
{
  return self->_currentViewport.size.width;
}

- (void)setZoomLevel:(float)a3
{
  self->_currentViewport.size.width = a3;
  self->_currentViewport.size.height = a3;
  -[RectangleAnimator resetToRectangle:](self->_rectangleAnimator, "resetToRectangle:", self->_currentViewport.origin.x, self->_currentViewport.origin.y, a3, a3);
}

- (void)computeSceneFramingForMetadata:(id)a3
{
  id v4 = a3;
  double v5 = [(CinematicTracker *)self->_tracker tracks];
  framingSpaceManager = self->_framingSpaceManager;
  [(RectangleAnimator *)self->_rectangleAnimator rectangle];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  if (v4)
  {
    [v4 timestamp];
  }
  else
  {
    long long v84 = 0uLL;
    uint64_t v85 = 0;
  }
  options = self->_options;
  id v16 = v5;
  v17 = framingSpaceManager;
  v68 = options;
  if ([v16 count]
    && (v92.origin.x = v8, v92.origin.CGFloat y = v10, v92.size.width = v12, v92.size.height = v14, !CGRectIsNull(v92)))
  {
    v88[0] = MEMORY[0x1E4F143A8];
    v88[1] = 3221225472;
    v88[2] = __filterTracksThatCanFitInView_block_invoke;
    v88[3] = &__block_descriptor_88_e11_q24__0_8_16l;
    long long v89 = v84;
    uint64_t v90 = v85;
    *(CGFloat *)&v88[4] = v8;
    *(CGFloat *)&v88[5] = v10;
    *(CGFloat *)&v88[6] = v12;
    *(CGFloat *)&v88[7] = v14;
    v19 = [v16 sortedArrayUsingComparator:v88];
    id v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v19, "count"));
    if ([v19 count])
    {
      unint64_t v20 = 0;
      CGFloat v21 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      CGFloat rect_16 = *MEMORY[0x1E4F1DB20];
      CGFloat v22 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      CGFloat v23 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      float v24 = 0.9;
      float v25 = 0.75;
      do
      {
        double v79 = v21;
        double v80 = v23;
        v26 = [v19 objectAtIndexedSubscript:v20];
        long long v86 = v84;
        uint64_t v87 = v85;
        [v26 faceBoundingBoxForFramingAtTime:&v86];
        v107.origin.CGFloat x = v27;
        v107.origin.CGFloat y = v28;
        v107.size.CGFloat width = v29;
        v107.size.CGFloat height = v30;
        v93.origin.CGFloat x = rect_16;
        v93.origin.CGFloat y = v21;
        v93.size.CGFloat width = v22;
        v93.size.CGFloat height = v23;
        CGFloat rect_24 = v107.origin.y;
        CGFloat x = v107.origin.x;
        CGFloat height = v107.size.height;
        CGFloat width = v107.size.width;
        CGRect v94 = CGRectUnion(v93, v107);
        CGFloat v31 = v94.origin.x;
        CGFloat y = v94.origin.y;
        CGFloat v33 = v94.size.width;
        CGFloat v34 = v94.size.height;
        double v35 = v22;
        float v36 = v24;
        if (![v26 isTrackedByDirector]) {
          float v24 = v25;
        }
        v95.origin.CGFloat x = v31;
        v95.origin.CGFloat y = y;
        v95.size.CGFloat width = v33;
        v95.size.CGFloat height = v34;
        double v37 = CGRectGetWidth(v95);
        [(FramingSpaceManager *)v17 maxAllowedViewportWidth];
        if (v37 <= (float)(v24 * v38))
        {
          double v70 = v34;
          double v71 = v33;
          double v72 = y;
          double v69 = v31;
          int v39 = [v26 isTrackedByDirector];
          int v40 = [v26 isTrackedByDirector];
          [(FramingSpaceManager *)v17 framingSpaceBounds];
          CGFloat v41 = v96.origin.x;
          CGFloat v42 = v96.origin.y;
          CGFloat v43 = v96.size.width;
          CGFloat v44 = v96.size.height;
          double MinX = CGRectGetMinX(v96);
          v97.origin.CGFloat x = v41;
          v97.origin.CGFloat y = v42;
          v97.size.CGFloat width = v43;
          v97.size.CGFloat height = v44;
          double v46 = CGRectGetWidth(v97);
          double v47 = 0.100000001;
          if (v39) {
            double v47 = 0.0500000007;
          }
          double rect_8 = v47;
          float v48 = MinX + v46 * v47;
          float rect = v48;
          v98.origin.CGFloat x = v41;
          v98.origin.CGFloat y = v42;
          v98.size.CGFloat width = v43;
          v98.size.CGFloat height = v44;
          double MinY = CGRectGetMinY(v98);
          v99.origin.CGFloat x = x;
          v99.origin.CGFloat y = rect_24;
          v99.size.CGFloat height = height;
          v99.size.CGFloat width = width;
          float v50 = fmin(MinY, CGRectGetMinY(v99));
          float v73 = v50;
          v100.origin.CGFloat x = v41;
          v100.origin.CGFloat y = v42;
          v100.size.CGFloat width = v43;
          v100.size.CGFloat height = v44;
          double MaxY = CGRectGetMaxY(v100);
          v101.origin.CGFloat x = v41;
          v101.origin.CGFloat y = v42;
          v101.size.CGFloat width = v43;
          v101.size.CGFloat height = v44;
          double v52 = CGRectGetHeight(v101);
          double v53 = 0.0199999996;
          if (!v40) {
            double v53 = 0.0500000007;
          }
          float v54 = MaxY - v52 * v53 - v73;
          v102.origin.CGFloat x = v41;
          v102.origin.CGFloat y = v42;
          v102.size.CGFloat width = v43;
          v102.size.CGFloat height = v44;
          CGFloat v55 = (rect_8 * -2.0 + 1.0) * CGRectGetWidth(v102);
          v103.origin.CGFloat x = x;
          v103.origin.CGFloat y = rect_24;
          v103.size.CGFloat width = width;
          v103.size.CGFloat height = height;
          CGFloat MidX = CGRectGetMidX(v103);
          v104.origin.CGFloat x = x;
          v104.origin.CGFloat y = rect_24;
          v104.size.CGFloat width = width;
          v104.size.CGFloat height = height;
          v91.CGFloat y = CGRectGetMidY(v104);
          v105.origin.CGFloat x = rect;
          v105.origin.CGFloat y = v73;
          v105.size.CGFloat width = v55;
          v105.size.CGFloat height = v54;
          v91.CGFloat x = MidX;
          if (CGRectContainsPoint(v105, v91))
          {
            if ([v26 isTrackedByDirector]) {
              [(CinematicFramingSessionOptions *)v68 tinyHeadMinValue];
            }
            else {
              [(CinematicFramingSessionOptions *)v68 tinyHeadMaxValue];
            }
            float v58 = v57;
            CGFloat v23 = v80;
            CGFloat v21 = v72;
            CGFloat v22 = v35;
            long long v86 = v84;
            uint64_t v87 = v85;
            [v26 faceBoundingBoxForFramingAtTime:&v86];
            if (CGRectGetWidth(v106) >= v58)
            {
              [v26 setIsTrackedByDirector:1];
              [v18 addObject:v26];
              CGFloat v23 = v70;
              CGFloat v22 = v71;
              CGFloat rect_16 = v69;
              float v24 = 0.9;
              float v25 = 0.75;
            }
            else
            {
              [v26 setIsTrackedByDirector:0];
              float v24 = 0.9;
              float v25 = 0.75;
              CGFloat v21 = v79;
            }
          }
          else
          {
            [v26 setIsTrackedByDirector:0];
            float v24 = 0.9;
            float v25 = 0.75;
            CGFloat v21 = v79;
            CGFloat v23 = v80;
            CGFloat v22 = v35;
          }
        }
        else
        {
          [v26 setIsTrackedByDirector:0];
          float v24 = v36;
          float v25 = 0.75;
          CGFloat v22 = v35;
          CGFloat v21 = v79;
          CGFloat v23 = v80;
        }

        ++v20;
      }
      while (v20 < [v19 count]);
    }
  }
  else
  {
    id v18 = v16;
  }

  unint64_t v59 = [v18 count];
  v60 = [(CinematicFramingDirector *)self options];
  v61 = v60;
  if (v59 <= 1) {
    [v60 singlePersonFramingParameters];
  }
  else {
  v62 = [v60 multiPersonFramingParameters];
  }

  [(SceneFramingEngine *)self->_sceneFramingEngine setActiveFramingParameters:v62];
  sceneFramingEngine = self->_sceneFramingEngine;
  if (v4) {
    [v4 timestamp];
  }
  else {
    memset(v83, 0, sizeof(v83));
  }
  -[SceneFramingEngine updateTargetViewportWithTracks:currentViewport:atTime:](sceneFramingEngine, "updateTargetViewportWithTracks:currentViewport:atTime:", v18, v83, self->_currentViewport.origin.x, self->_currentViewport.origin.y, self->_currentViewport.size.width, self->_currentViewport.size.height);
  [(SceneFramingEngine *)self->_sceneFramingEngine targetViewport];
  self->_targetViewport.origin.CGFloat x = v64;
  self->_targetViewport.origin.CGFloat y = v65;
  self->_targetViewport.size.CGFloat width = v66;
  self->_targetViewport.size.CGFloat height = v67;
}

- (CGRect)currentViewport
{
  double x = self->_currentViewport.origin.x;
  double y = self->_currentViewport.origin.y;
  double width = self->_currentViewport.size.width;
  double height = self->_currentViewport.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)targetViewport
{
  double x = self->_targetViewport.origin.x;
  double y = self->_targetViewport.origin.y;
  double width = self->_targetViewport.size.width;
  double height = self->_targetViewport.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneFramingEngine, 0);
  objc_storeStrong((id *)&self->_rectangleAnimator, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_framingSpaceManager, 0);
}

@end