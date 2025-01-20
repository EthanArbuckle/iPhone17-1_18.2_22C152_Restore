@interface NTKSnowglobeSceneController
- (BOOL)isFrozen;
- (NTKSnowglobeColorPalette)colorPalette;
- (NTKSnowglobeCrownHandler)crownInputHandler;
- (NTKSnowglobeSceneController)initWithSceneSize:(CGSize)a3 renderQueue:(id)a4;
- (NTKSnowglobeState)appliedSnowglobeState;
- (NTKSnowglobeState)snowglobeState;
- (SCNRenderer)renderer;
- (SCNScene)scene;
- (double)_restingOriginForDigit:(uint64_t)a3 node:(unint64_t)a4;
- (double)_tritiumOriginAdjustmentForDigit:(uint64_t)a3;
- (double)_tritiumRotationForDigit:(uint64_t)a3;
- (double)backgroundObjectOpacity;
- (id)_charactersFromFormatter:(id)a3;
- (id)_queue_backgroundObjectColorsFromColors:(id)a3;
- (id)_queue_backgroundObjectPositions;
- (void)_queue_animatedReplaceDigit:(unint64_t)a3 withCharacter:(unint64_t)a4;
- (void)_queue_animatedReplaceDigit:(unint64_t)a3 withCharacter:(unint64_t)a4 force:(BOOL)a5;
- (void)_queue_applyBackgroundContents;
- (void)_queue_applyBackgroundObjectColors:(id)a3;
- (void)_queue_applyColorPalette;
- (void)_queue_applyState;
- (void)_queue_configureController:(id)a3 digit:(unint64_t)a4;
- (void)_queue_configureLightingWithTritiumFraction:(double)a3;
- (void)_queue_enumerateDigitsWithBlock:(id)a3;
- (void)_queue_loadBackgroundObjects;
- (void)_queue_replaceDigit:(unint64_t)a3 withCharacter:(unint64_t)a4;
- (void)_queue_replaceRandomObjectWithDainty;
- (void)_queue_resetToIdealizedState;
- (void)_queue_setupBackgroundObject:(id)a3;
- (void)_queue_setupBorderWalls;
- (void)_queue_setupCamera;
- (void)_queue_setupPlane;
- (void)_queue_setupScene;
- (void)_queue_tapAtPoint:(CGPoint)a3;
- (void)_queue_updateBackgroundContainerOpacity;
- (void)_queue_updateCameraAngles;
- (void)_queue_updateCameraParallax;
- (void)_setupTimeFormatter;
- (void)flush;
- (void)flushWithCompletion:(id)a3;
- (void)physicsWorld:(id)a3 didBeginContact:(id)a4;
- (void)renderer:(id)a3 updateAtTime:(double)a4;
- (void)setAppliedSnowglobeState:(id)a3;
- (void)setBackgroundObjectOpacity:(double)a3;
- (void)setColorPalette:(id)a3;
- (void)setCrownInputHandler:(id)a3;
- (void)setFrozen:(BOOL)a3;
- (void)setIdealizedState:(BOOL)a3 editing:(BOOL)a4;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setRenderer:(id)a3;
- (void)setSnowglobeState:(id)a3;
- (void)setTimeOffset:(double)a3;
- (void)setTritiumState:(unint64_t)a3 fraction:(double)a4;
- (void)tapAtPoint:(CGPoint)a3;
- (void)timeFormatterTextDidChange:(id)a3;
@end

@implementation NTKSnowglobeSceneController

- (NTKSnowglobeSceneController)initWithSceneSize:(CGSize)a3 renderQueue:(id)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v8 = a4;
  v39.receiver = self;
  v39.super_class = (Class)NTKSnowglobeSceneController;
  v9 = [(NTKSnowglobeSceneController *)&v39 init];
  if (v9)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
    v9->_screenSize.CGFloat width = width;
    v9->_screenSize.CGFloat height = height;
    v10 = +[NTKSnowglobeAssetLibrary sharedInstance];
    uint64_t v11 = [v10 sharedDevice];
    device = v9->_device;
    v9->_device = (MTLDevice *)v11;

    v13 = v9->_device;
    if (qword_1EA8FCF20 != -1) {
      dispatch_once(&qword_1EA8FCF20, &unk_1F3527FB8);
    }
    id v14 = (id)qword_1EA8FCF18;
    uint64_t v15 = [(MTLDevice *)v13 newDefaultLibraryWithBundle:v14 error:0];
    library = v9->_library;
    v9->_library = (MTLLibrary *)v15;

    uint64_t v17 = objc_opt_new();
    backgroundControllers = v9->_backgroundControllers;
    v9->_backgroundControllers = (NSMutableArray *)v17;

    uint64_t v19 = objc_opt_new();
    exitingDigitControllers = v9->_exitingDigitControllers;
    v9->_exitingDigitControllers = (NSMutableArray *)v19;

    uint64_t v21 = objc_opt_new();
    digitControllers = v9->_digitControllers;
    v9->_digitControllers = (NSMutableDictionary *)v21;

    uint64_t v23 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    digitControllerLookup = v9->_digitControllerLookup;
    v9->_digitControllerLookup = (NSMapTable *)v23;

    dispatch_group_t v25 = dispatch_group_create();
    group = v9->_group;
    v9->_group = (OS_dispatch_group *)v25;

    v9->_showingOverrideTime = 1;
    objc_storeStrong((id *)&v9->_renderQueue, a4);
    v9->_stateLock._os_unfair_lock_opaque = 0;
    dispatch_semaphore_t v27 = dispatch_semaphore_create(1);
    asyncApplyStateSemaphore = v9->_asyncApplyStateSemaphore;
    v9->_asyncApplyStateSemaphore = (OS_dispatch_semaphore *)v27;

    v29 = objc_alloc_init(NTKSnowglobeState);
    appliedSnowglobeState = v9->_appliedSnowglobeState;
    v9->_appliedSnowglobeState = v29;

    v31 = objc_alloc_init(NTKSnowglobeState);
    snowglobeState = v9->_snowglobeState;
    v9->_snowglobeState = v31;

    v9->_snowglobeStateInitialized = 0;
    [(NTKSnowglobeSceneController *)v9 _setupTimeFormatter];
    [MEMORY[0x1E4F3B280] begin];
    [MEMORY[0x1E4F3B280] setAnimationDuration:0.0];
    v33 = +[NTKSnowglobeAssetLibrary sharedInstance];
    uint64_t v34 = [v33 createScene];
    scene = v9->_scene;
    v9->_scene = (SCNScene *)v34;

    [MEMORY[0x1E4F3B280] commit];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1DAFE8944;
    block[3] = &unk_1E6BE4FF0;
    v38 = v9;
    dispatch_async(v8, block);
  }
  return v9;
}

- (void)flush
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1DAFE8ADC;
  v10[3] = &unk_1E6BE4FF0;
  v4 = v3;
  uint64_t v11 = v4;
  [(NTKSnowglobeSceneController *)self flushWithCompletion:v10];
  dispatch_time_t v5 = dispatch_time(0, 5000000000);
  intptr_t v6 = dispatch_group_wait(v4, v5);
  v7 = _NTKLoggingObjectForDomain();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_1DAFEF448(v6, v8);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1DAFDF000, v8, OS_LOG_TYPE_DEFAULT, "Snowglobe flushed synchronously", v9, 2u);
  }
}

- (void)flushWithCompletion:(id)a3
{
  id v4 = a3;
  renderQueue = self->_renderQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DAFE8B7C;
  v7[3] = &unk_1E6BE4D48;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(renderQueue, v7);
}

- (void)setSnowglobeState:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  os_unfair_lock_lock(&self->_stateLock);
  objc_storeStrong((id *)&self->_snowglobeState, a3);
  os_unfair_lock_unlock(&self->_stateLock);
  renderQueue = self->_renderQueue;
  asyncApplyStateSemaphore = self->_asyncApplyStateSemaphore;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1DAFE8DD0;
  v11[3] = &unk_1E6BE4FF0;
  v11[4] = self;
  id v8 = renderQueue;
  v9 = asyncApplyStateSemaphore;
  v10 = v11;
  if (!dispatch_semaphore_wait(v9, 0))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1DAFEE4E4;
    block[3] = &unk_1E6BE4D48;
    v13 = v9;
    id v14 = v10;
    dispatch_async(v8, block);
  }
}

- (NTKSnowglobeState)snowglobeState
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  id v4 = self->_snowglobeState;
  os_unfair_lock_unlock(p_stateLock);

  return v4;
}

- (void)setIdealizedState:(BOOL)a3 editing:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v8 = [(NTKSnowglobeSceneController *)self snowglobeState];
  v7 = [v8 withIdealizedState:v5 editing:v4];
  [(NTKSnowglobeSceneController *)self setSnowglobeState:v7];
}

- (void)setTritiumState:(unint64_t)a3 fraction:(double)a4
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v8 = [(NTKSnowglobeSceneController *)self snowglobeState];
  v7 = [v8 withTritiumState:a3 fraction:a4];
  [(NTKSnowglobeSceneController *)self setSnowglobeState:v7];
}

- (double)backgroundObjectOpacity
{
  v2 = [(NTKSnowglobeSceneController *)self snowglobeState];
  [v2 backgroundObjectOpacity];
  double v4 = v3;

  return v4;
}

- (void)setBackgroundObjectOpacity:(double)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v6 = [(NTKSnowglobeSceneController *)self snowglobeState];
  BOOL v5 = [v6 withBackgroundObjectOpacity:a3];
  [(NTKSnowglobeSceneController *)self setSnowglobeState:v5];
}

- (void)setColorPalette:(id)a3
{
  id v8 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  objc_storeStrong((id *)&self->_colorPalette, a3);
  if (v8)
  {
    BOOL v5 = [(NTKSnowglobeSceneController *)self snowglobeState];
    id v6 = [[NTKSnowglobeColors alloc] initWithPalette:v8];
    v7 = [v5 withPalette:v6];
    [(NTKSnowglobeSceneController *)self setSnowglobeState:v7];
  }
}

- (void)_queue_applyState
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_renderQueue);
  double v3 = [(NTKSnowglobeSceneController *)self snowglobeState];
  double v4 = [(NTKSnowglobeSceneController *)self appliedSnowglobeState];
  if (self->_leftBacklightNode)
  {
    BOOL v5 = [v3 palette];

    if (v5)
    {
      BOOL snowglobeStateInitialized = self->_snowglobeStateInitialized;
      self->_BOOL snowglobeStateInitialized = 1;
      objc_storeStrong((id *)&self->_appliedSnowglobeState, v3);
      if (snowglobeStateInitialized)
      {
        int v7 = [v4 shouldBeInIdealizedState];
        int v8 = v7 ^ [v3 shouldBeInIdealizedState];
        int v9 = [v4 scenePaused];
        if (v9 != [v3 scenePaused]) {
          v8 |= 2u;
        }
        v10 = [v4 palette];
        uint64_t v11 = [v3 palette];
        BOOL v12 = v10 != v11;

        if (v12) {
          int v13 = v8 | 4;
        }
        else {
          int v13 = v8;
        }
        [v4 tritiumFraction];
        double v15 = v14;
        [v3 tritiumFraction];
        if (v15 == v16) {
          int v17 = v13;
        }
        else {
          int v17 = v13 | 8;
        }
        uint64_t v18 = [v4 tritiumState];
        if (v18 == [v3 tritiumState]) {
          int v19 = v17;
        }
        else {
          int v19 = v17 | 0x10;
        }
        [v4 backgroundObjectOpacity];
        double v21 = v20;
        [v3 backgroundObjectOpacity];
        if (v21 == v22) {
          goto LABEL_22;
        }
      }
      else
      {
        int v19 = 31;
      }
      v19 |= 0x20u;
LABEL_22:
      v24 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109888;
        int v37 = v19;
        __int16 v38 = 1024;
        int v39 = [v3 idealizedState];
        __int16 v40 = 1024;
        int v41 = [v3 editing];
        __int16 v42 = 2048;
        uint64_t v43 = [v3 tritiumState];
        _os_log_impl(&dword_1DAFDF000, v24, OS_LOG_TYPE_DEFAULT, "Apply state (changes=%X, idealized=%i, editing=%i, tritium=%lu)", buf, 0x1Eu);
      }

      if ((v19 & 1) != 0 && [v3 shouldBeInIdealizedState]) {
        [(NTKSnowglobeSceneController *)self _queue_resetToIdealizedState];
      }
      if ((v19 & 2) != 0)
      {
        uint64_t v25 = [v3 scenePaused];
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        v26 = [(NSMutableDictionary *)self->_digitControllers allValues];
        uint64_t v27 = [v26 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v32;
          do
          {
            for (uint64_t i = 0; i != v28; ++i)
            {
              if (*(void *)v32 != v29) {
                objc_enumerationMutation(v26);
              }
              [*(id *)(*((void *)&v31 + 1) + 8 * i) setPausePhysics:v25];
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v31 objects:v35 count:16];
          }
          while (v28);
        }

        if (v25 != [(SCNScene *)self->_scene isPaused]) {
          [(SCNScene *)self->_scene setPaused:v25];
        }
      }
      if ((v19 & 4) != 0)
      {
        [(NTKSnowglobeSceneController *)self _queue_applyColorPalette];
      }
      else if ((v19 & 8) != 0)
      {
        [(NTKSnowglobeSceneController *)self _queue_applyBackgroundContents];
      }
      if ((v19 & 0x38) != 0) {
        [(NTKSnowglobeSceneController *)self _queue_updateBackgroundContainerOpacity];
      }
      if ((v19 & 8) != 0)
      {
        [v3 tritiumFraction];
        -[NTKSnowglobeSceneController _queue_configureLightingWithTritiumFraction:](self, "_queue_configureLightingWithTritiumFraction:");
      }
      goto LABEL_45;
    }
  }
  uint64_t v23 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DAFDF000, v23, OS_LOG_TYPE_DEFAULT, "Skipped initial state change because face not fully initialized yet", buf, 2u);
  }

LABEL_45:
}

- (void)_queue_applyBackgroundContents
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_renderQueue);
  id v8 = [(NTKSnowglobeSceneController *)self appliedSnowglobeState];
  double v3 = [v8 palette];
  double v4 = [v3 backgroundColor];
  BOOL v5 = [MEMORY[0x1E4F428B8] blackColor];
  [v8 tritiumFraction];
  id v6 = MEMORY[0x1E0186B00](v4, v5);
  int v7 = [(SCNScene *)self->_scene background];
  [v7 setContents:v6];
}

- (void)_queue_updateBackgroundContainerOpacity
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_renderQueue);
  id v9 = [(NTKSnowglobeSceneController *)self appliedSnowglobeState];
  uint64_t v3 = [v9 tritiumState];
  [v9 tritiumFraction];
  double v5 = v4;
  [v9 backgroundObjectOpacity];
  double v7 = v6;
  if (v3)
  {
    if ([v9 tritiumState] == 3)
    {
      double v8 = v5 * -2.0 + 1.0;
      if (v8 < 0.0) {
        double v8 = 0.0;
      }
      double v6 = v7 * v8;
    }
    else
    {
      double v6 = (1.0 - v5) * v7;
    }
  }
  [(SCNNode *)self->_backgroundContainer setOpacity:v6];
  [(SCNNode *)self->_backgroundContainer setHidden:v7 == 0.0];
}

- (void)_queue_resetToIdealizedState
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_renderQueue);
  *(_OWORD *)self->_backgroundParallax = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v3 = [(NSMutableDictionary *)self->_digitControllers allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * v7++) resetToOrigin];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v5);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v8 = self->_exitingDigitControllers;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "destroy", (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v10);
  }

  [(NSMutableArray *)self->_exitingDigitControllers removeAllObjects];
}

- (void)_queue_applyColorPalette
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_renderQueue);
  uint64_t v3 = [(NTKSnowglobeSceneController *)self appliedSnowglobeState];
  id v10 = [v3 palette];

  uint64_t v4 = v10;
  if (self->_leftBacklightNode && self->_rightBacklightNode && v10)
  {
    uint64_t v5 = [v10 backgroundColorsForRandoms:self->_backgroundObjectRandoms];
    [(NTKSnowglobeSceneController *)self _queue_applyBackgroundObjectColors:v5];
    [(NTKSnowglobeSceneController *)self _queue_applyBackgroundContents];
    uint64_t v6 = [v10 backlightColor];
    uint64_t v7 = [(SCNNode *)self->_rightBacklightNode light];
    [v7 setColor:v6];

    double v8 = [v10 backlightColor];
    uint64_t v9 = [(SCNNode *)self->_leftBacklightNode light];
    [v9 setColor:v8];

    uint64_t v4 = v10;
  }
}

- (void)_queue_applyBackgroundObjectColors:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_renderQueue);
  backgroundObjects = self->_backgroundObjects;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DAFE9990;
  v7[3] = &unk_1E6BE5040;
  id v8 = v4;
  id v6 = v4;
  [(NSArray *)backgroundObjects enumerateObjectsUsingBlock:v7];
}

- (id)_queue_backgroundObjectColorsFromColors:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_renderQueue);
  uint64_t v5 = objc_opt_new();
  if ([(NSArray *)self->_backgroundObjects count])
  {
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = [(NSArray *)self->_backgroundObjectRandoms objectAtIndexedSubscript:v6];
      unint64_t v8 = [v7 unsignedIntegerValue];
      unint64_t v9 = v8 % [v4 count];

      id v10 = [v4 objectAtIndexedSubscript:v9];
      [v5 addObject:v10];

      ++v6;
    }
    while (v6 < [(NSArray *)self->_backgroundObjects count]);
  }

  return v5;
}

- (void)_queue_updateCameraAngles
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_renderQueue);
  uint64_t v3 = [(NTKSnowglobeSceneController *)self appliedSnowglobeState];
  [v3 parallaxMultiplier];
  double v7 = v4;

  *(float32x2_t *)&double v5 = vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(vneg_f32(*(float32x2_t *)self->_backgroundParallax)), v7));
  cameraFocalNode = self->_cameraFocalNode;

  -[SCNNode setEulerAngles:](cameraFocalNode, "setEulerAngles:", v5, COERCE_DOUBLE(__PAIR64__(HIDWORD(v7), HIDWORD(v5))), 0.0);
}

- (void)_queue_updateCameraParallax
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_renderQueue);
  uint64_t v3 = +[NTKSnowglobeMotionManager sharedInstance];
  [v3 rotationRate];
  double v5 = v4;
  double v7 = v6;

  double v8 = NTKSnowglobeTunableFloat(@"cameraParallaxSensitivity", 0.2);
  double v9 = NTKSnowglobeTunableFloat(@"cameraParallaxMaxAngle", 1.0);
  float v10 = v8;
  *(float *)&unsigned int v11 = v5;
  *(float *)&unsigned int v12 = v7;
  float32x4_t v13 = vmulq_n_f32((float32x4_t)__PAIR64__(v12, v11), v10);
  __asm { FMOV            V3.4S, #30.0 }
  float32x4_t v19 = vaddq_f32(vmulq_f32(*(float32x4_t *)self->_backgroundParallax, (float32x4_t)vdupq_n_s32(0x3F7AE148u)), vdivq_f32(v13, _Q3));
  float32x4_t v20 = vmulq_f32(v19, v19);
  double v21 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v20, 2), vaddq_f32(v20, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v20.f32, 1))).f32[0];
  if (v9 * v9 < v21)
  {
    float v22 = v9 / sqrt(v21);
    float32x4_t v19 = vmulq_n_f32(v19, v22);
  }
  *(float32x4_t *)self->_backgroundParallax = v19;

  MEMORY[0x1F4181798](self, sel__queue_updateCameraAngles);
}

- (void)_queue_setupScene
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_renderQueue);
  uint64_t v3 = [(SCNScene *)self->_scene physicsWorld];
  [v3 setSpeed:1.0];

  double v4 = [(SCNScene *)self->_scene physicsWorld];
  objc_msgSend(v4, "setGravity:", 0.0, 0.0, 0.0);

  double v5 = [(SCNScene *)self->_scene physicsWorld];
  [v5 setContactDelegate:self];

  [(SCNScene *)self->_scene setPaused:1];
  [(NTKSnowglobeSceneController *)self _queue_setupCamera];
  [(NTKSnowglobeSceneController *)self _queue_setupBorderWalls];
  double v6 = [MEMORY[0x1E4F3B228] node];
  double v7 = [MEMORY[0x1E4F3B210] light];
  [(SCNNode *)v6 setLight:v7];

  uint64_t v8 = *MEMORY[0x1E4F3B308];
  double v9 = [(SCNNode *)v6 light];
  [v9 setType:v8];

  float v10 = [(SCNNode *)v6 light];
  [v10 setIntensity:1800.0];

  unsigned int v11 = [(SCNNode *)v6 light];
  [v11 setCategoryBitMask:2];

  unsigned int v12 = [MEMORY[0x1E4F3B228] node];
  float32x4_t v13 = [MEMORY[0x1E4F3B210] light];
  [(SCNNode *)v12 setLight:v13];

  long long v14 = [(SCNNode *)v12 light];
  [v14 setType:v8];

  long long v15 = [(SCNNode *)v12 light];
  [v15 setIntensity:1800.0];

  long long v16 = [(SCNNode *)v12 light];
  [v16 setCategoryBitMask:2];

  long long v17 = [MEMORY[0x1E4F3B228] node];
  long long v18 = [MEMORY[0x1E4F3B210] light];
  [(SCNNode *)v17 setLight:v18];

  float32x4_t v19 = [(SCNNode *)v17 light];
  [v19 setType:v8];

  float32x4_t v20 = [MEMORY[0x1E4F428B8] colorWithHue:0.566666667 saturation:0.39 brightness:1.0 alpha:1.0];
  double v21 = [(SCNNode *)v17 light];
  [v21 setColor:v20];

  float v22 = [(SCNNode *)v17 light];
  [v22 setIntensity:0.0];

  uint64_t v23 = [(SCNNode *)v17 light];
  [v23 setCategoryBitMask:2];

  v24 = [MEMORY[0x1E4F3B228] node];
  uint64_t v25 = [MEMORY[0x1E4F3B210] light];
  [(SCNNode *)v24 setLight:v25];

  uint64_t v26 = *MEMORY[0x1E4F3B300];
  uint64_t v27 = [(SCNNode *)v24 light];
  [v27 setType:v26];

  uint64_t v28 = [MEMORY[0x1E4F428B8] whiteColor];
  uint64_t v29 = [(SCNNode *)v24 light];
  [v29 setColor:v28];

  v30 = [(SCNNode *)v24 light];
  [v30 setIntensity:0.0];

  long long v31 = [(SCNNode *)v24 light];
  [v31 setCategoryBitMask:2];

  LODWORD(v32) = 1081824209;
  LODWORD(v33) = 1.0;
  -[SCNNode setRotation:](v6, "setRotation:", 0.0, v33, 0.0, v32);
  LODWORD(v34) = 1075235812;
  LODWORD(v35) = 1.0;
  -[SCNNode setRotation:](v12, "setRotation:", 0.0, v35, 0.0, v34);
  LODWORD(v36) = -1085730853;
  LODWORD(v37) = -1077342245;
  -[SCNNode setEulerAngles:](v17, "setEulerAngles:", v36, v37, 0.0);
  leftBacklightNode = self->_leftBacklightNode;
  self->_leftBacklightNode = v6;
  int v39 = v6;

  rightBacklightNode = self->_rightBacklightNode;
  self->_rightBacklightNode = v12;
  int v41 = v12;

  nightLightNode = self->_nightLightNode;
  self->_nightLightNode = v17;
  uint64_t v43 = v17;

  nightAmbientLightNode = self->_nightAmbientLightNode;
  self->_nightAmbientLightNode = v24;
  v45 = v24;

  v46 = [(SCNNode *)v39 light];
  leftBacklight = self->_leftBacklight;
  self->_leftBacklight = v46;

  v48 = [(SCNNode *)v41 light];
  rightBacklight = self->_rightBacklight;
  self->_rightBacklight = v48;

  v50 = [(SCNNode *)v43 light];
  nightLight = self->_nightLight;
  self->_nightLight = v50;

  v52 = [(SCNNode *)v45 light];
  nightAmbientLight = self->_nightAmbientLight;
  self->_nightAmbientLight = v52;

  v54 = [(SCNScene *)self->_scene rootNode];
  [v54 addChildNode:v39];

  v55 = [(SCNScene *)self->_scene rootNode];
  [v55 addChildNode:v41];

  v56 = [(SCNScene *)self->_scene rootNode];
  [v56 addChildNode:v43];

  v57 = [(SCNScene *)self->_scene rootNode];

  [v57 addChildNode:v45];
  [(NTKSnowglobeSceneController *)self _queue_loadBackgroundObjects];
  [(NTKSnowglobeSceneController *)self _queue_setupPlane];

  [(NTKSnowglobeSceneController *)self _queue_applyColorPalette];
}

- (void)_queue_setupCamera
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_renderQueue);
  uint64_t v3 = [MEMORY[0x1E4F3B228] node];
  double v4 = [MEMORY[0x1E4F3B1F0] camera];
  [(SCNNode *)v3 setCamera:v4];

  double v5 = [(SCNNode *)v3 camera];
  [v5 setZFar:110.0];

  double v6 = [(SCNNode *)v3 camera];
  [v6 setZNear:1.0];

  uint64_t CameraMode = NTKSnowglobeDebugGetCameraMode();
  double v8 = NTKSnowglobeTunableFloat(@"cameraPivotDepth", -2.5);
  if (CameraMode == 1)
  {
    double v16 = NTKSnowglobeTunableFloat(@"cameraFOV", 40.0);
    *(double *)&long long v17 = NTKSnowglobeTunableFloat3(@"cameraPosition", (__n128)0);
    *(_OWORD *)uint64_t v25 = v17;
    long long v18 = [(SCNNode *)v3 camera];
    [v18 setFieldOfView:v16];

    double v14 = *(double *)v25;
    LODWORD(v13) = v25[1];
    LODWORD(v15) = HIDWORD(v25[0]);
  }
  else
  {
    if (CameraMode) {
      goto LABEL_6;
    }
    double v9 = NTKSnowglobeTunableFloat(@"cameraFOV", 40.0);
    long double v10 = 4.0 / tan(v9 / 180.0 * 3.14159265 * 0.5);
    unsigned int v11 = [(SCNNode *)v3 camera];
    [v11 setFieldOfView:v9];

    unsigned int v12 = [(SCNNode *)v3 camera];
    [v12 setProjectionDirection:1];

    *(float *)&double v13 = v10 - v8;
    double v14 = 0.0;
    double v15 = 0.0;
  }
  -[SCNNode setPosition:](v3, "setPosition:", v14, v15, v13);
LABEL_6:
  [(SCNNode *)v3 setName:@"NTKPointOfView"];
  float32x4_t v19 = [MEMORY[0x1E4F3B228] node];
  *(float *)&double v20 = v8;
  -[SCNNode setPosition:](v19, "setPosition:", 0.0, 0.0, v20);
  cameraNode = self->_cameraNode;
  self->_cameraNode = v3;
  float v22 = v3;

  cameraFocalNode = self->_cameraFocalNode;
  self->_cameraFocalNode = v19;
  v24 = v19;

  [(SCNNode *)v24 addChildNode:v22];
  uint64_t v26 = [(SCNScene *)self->_scene rootNode];

  [v26 addChildNode:v24];
}

- (void)_queue_setupPlane
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_renderQueue);
  uint64_t v3 = (void *)MEMORY[0x1E4F3B228];
  double v4 = [MEMORY[0x1E4F3B250] planeWithWidth:10.0 height:10.0];
  double v5 = [v3 nodeWithGeometry:v4];
  glassNode = self->_glassNode;
  self->_glassNode = v5;

  LODWORD(v7) = 1078530011;
  -[SCNNode setEulerAngles:](self->_glassNode, "setEulerAngles:", 0.0, v7, 0.0);
  LODWORD(v8) = 2.0;
  -[SCNNode setPosition:](self->_glassNode, "setPosition:", 0.0, 0.0, v8);
  double v9 = [MEMORY[0x1E4F3B230] staticBody];
  [(SCNNode *)self->_glassNode setPhysicsBody:v9];

  long double v10 = (void *)MEMORY[0x1E4F3B248];
  unsigned int v11 = [(SCNNode *)self->_glassNode geometry];
  unsigned int v12 = [v10 shapeWithGeometry:v11 options:0];
  double v13 = [(SCNNode *)self->_glassNode physicsBody];
  [v13 setPhysicsShape:v12];

  double v14 = [(SCNNode *)self->_glassNode physicsBody];
  [v14 setRestitution:0.2];

  id v15 = [(SCNScene *)self->_scene rootNode];
  [v15 addChildNode:self->_glassNode];
}

- (void)_queue_setupBorderWalls
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_renderQueue);
  double width = self->_screenSize.width;
  double height = self->_screenSize.height;
  double v5 = [(SCNNode *)self->_cameraNode camera];
  [v5 fieldOfView];
  double v7 = v6 * 0.0174532925 * 0.5;

  id v43 = [MEMORY[0x1E4F3B250] planeWithWidth:100.0 height:100.0];
  double v8 = [MEMORY[0x1E4F3B228] nodeWithGeometry:v43];
  __double2 v9 = __sincos_stret(v7);
  *(float *)&unsigned int v10 = v9.__sinval;
  float cosval = v9.__cosval;
  float v39 = *(float *)&v10;
  *(float *)&unsigned int v40 = -cosval;
  v12.i64[0] = v10;
  v12.i64[1] = v40;
  float32x4_t v42 = (float32x4_t)vdupq_n_s32(0x42C80000u);
  v13.i64[0] = 0x3F0000003F000000;
  v13.i64[1] = 0x3F0000003F000000;
  objc_msgSend(v8, "setSimdPosition:", *(double *)vmulq_f32(vmulq_f32(v12, v42), v13).i64);
  [v8 setSimdRotation:0.0078125];
  double v14 = [MEMORY[0x1E4F3B230] staticBody];
  [v8 setPhysicsBody:v14];

  id v15 = [MEMORY[0x1E4F3B248] shapeWithGeometry:v43 options:0];
  double v16 = [v8 physicsBody];
  [v16 setPhysicsShape:v15];

  long long v17 = [MEMORY[0x1E4F3B228] nodeWithGeometry:v43];
  v18.i32[1] = 0;
  v18.f32[0] = -v39;
  v18.i64[1] = v40;
  float32x4_t v19 = vmulq_f32(v18, v42);
  v18.i64[0] = 0x3F0000003F000000;
  v18.i64[1] = 0x3F0000003F000000;
  objc_msgSend(v17, "setSimdPosition:", *(double *)vmulq_f32(v19, v18).i64);
  [v17 setSimdRotation:0.0078125];
  double v20 = [MEMORY[0x1E4F3B230] staticBody];
  [v17 setPhysicsBody:v20];

  double v21 = [MEMORY[0x1E4F3B248] shapeWithGeometry:v43 options:0];
  float v22 = [v17 physicsBody];
  [v22 setPhysicsShape:v21];

  uint64_t v23 = [MEMORY[0x1E4F3B228] nodeWithGeometry:v43];
  __double2 v24 = __sincos_stret(height * v7 / width);
  float32_t sinval = v24.__sinval;
  float v38 = sinval;
  float v26 = v24.__cosval;
  *(float *)&unsigned int v41 = -v26;
  v27.i32[0] = 0;
  v27.f32[1] = sinval;
  v27.i64[1] = v41;
  v28.i64[0] = 0x3F0000003F000000;
  v28.i64[1] = 0x3F0000003F000000;
  objc_msgSend(v23, "setSimdPosition:", *(double *)vmulq_f32(vmulq_f32(v27, v42), v28).i64);
  [v23 setSimdRotation:COERCE_DOUBLE(1065353216)];
  uint64_t v29 = [MEMORY[0x1E4F3B230] staticBody];
  [v23 setPhysicsBody:v29];

  v30 = [MEMORY[0x1E4F3B248] shapeWithGeometry:v43 options:0];
  long long v31 = [v23 physicsBody];
  [v31 setPhysicsShape:v30];

  double v32 = [MEMORY[0x1E4F3B228] nodeWithGeometry:v43];
  v33.i32[0] = 0;
  v33.f32[1] = -v38;
  v33.i64[1] = v41;
  float32x4_t v34 = vmulq_f32(v33, v42);
  v33.i64[0] = 0x3F0000003F000000;
  v33.i64[1] = 0x3F0000003F000000;
  objc_msgSend(v32, "setSimdPosition:", *(double *)vmulq_f32(v34, v33).i64);
  [v32 setSimdRotation:COERCE_DOUBLE(1065353216)];
  double v35 = [MEMORY[0x1E4F3B230] staticBody];
  [v32 setPhysicsBody:v35];

  double v36 = [MEMORY[0x1E4F3B248] shapeWithGeometry:v43 options:0];
  double v37 = [v32 physicsBody];
  [v37 setPhysicsShape:v36];

  [(SCNNode *)self->_cameraNode addChildNode:v8];
  [(SCNNode *)self->_cameraNode addChildNode:v17];
  [(SCNNode *)self->_cameraNode addChildNode:v23];
  [(SCNNode *)self->_cameraNode addChildNode:v32];
}

- (void)_queue_enumerateDigitsWithBlock:(id)a3
{
  renderQueue = self->_renderQueue;
  double v4 = (void (**)(id, void))a3;
  dispatch_assert_queue_V2(renderQueue);
  v4[2](v4, 0);
  v4[2](v4, 1);
  v4[2](v4, 2);
  v4[2](v4, 3);
}

- (void)_queue_replaceDigit:(unint64_t)a3 withCharacter:(unint64_t)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_renderQueue);
  digitControllers = self->_digitControllers;
  double v8 = [NSNumber numberWithUnsignedInteger:a3];
  __double2 v9 = [(NSMutableDictionary *)digitControllers objectForKeyedSubscript:v8];
  if (v9)
  {
    unsigned int v10 = self->_digitControllers;
    unsigned int v11 = [NSNumber numberWithUnsignedInteger:a3];
    float32x4_t v12 = [(NSMutableDictionary *)v10 objectForKeyedSubscript:v11];
    uint64_t v13 = [v12 digit];

    if (v13 == a4) {
      return;
    }
  }
  else
  {
  }
  double v14 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v31 = a3;
    __int16 v32 = 2048;
    unint64_t v33 = a4;
    _os_log_impl(&dword_1DAFDF000, v14, OS_LOG_TYPE_DEFAULT, "Replacing digit at %lu with %lu", buf, 0x16u);
  }

  id v15 = self->_digitControllers;
  double v16 = [NSNumber numberWithUnsignedInteger:a3];
  long long v17 = [(NSMutableDictionary *)v15 objectForKeyedSubscript:v16];

  objc_initWeak((id *)buf, self);
  float32x4_t v18 = [NTKSnowglobeDigitController alloc];
  scene = self->_scene;
  group = self->_group;
  renderQueue = self->_renderQueue;
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  float32x4_t v27 = sub_1DAFEAE04;
  float32x4_t v28 = &unk_1E6BE5068;
  objc_copyWeak(v29, (id *)buf);
  v29[1] = (id)a3;
  float v22 = [(NTKSnowglobeDigitController *)v18 initWithDigit:a4 scene:scene queue:renderQueue group:group configureNode:&v25];
  uint64_t v23 = self->_digitControllers;
  __double2 v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a3, v25, v26, v27, v28);
  [(NSMutableDictionary *)v23 setObject:v22 forKeyedSubscript:v24];

  [v17 destroy];
  objc_destroyWeak(v29);
  objc_destroyWeak((id *)buf);
}

- (double)_tritiumRotationForDigit:(uint64_t)a3
{
  float32x4_t v3 = (float32x4_t)xmmword_1DAFF0AB0;
  switch(a3)
  {
    case 0:
      goto LABEL_6;
    case 1:
      float32x4_t v3 = (float32x4_t)xmmword_1DAFF0AD0;
      goto LABEL_6;
    case 2:
      float32x4_t v3 = (float32x4_t)vdupq_n_s32(0x3E715BEFu);
      goto LABEL_6;
    case 3:
      float32x4_t v3 = (float32x4_t)xmmword_1DAFF0AC0;
LABEL_6:
      double result = sub_1DAFEAF10((float32x4_t)xmmword_1DAFF0AE0, v3);
      break;
    default:
      double result = 0.0;
      break;
  }
  return result;
}

- (double)_restingOriginForDigit:(uint64_t)a3 node:(unint64_t)a4
{
  BOOL v6 = a4 < 2;
  a1.n128_u32[0] = -1.5;
  int v17 = 0;
  uint64_t v16 = 0;
  if (a4 < 2) {
    a1.n128_f32[0] = 2.5;
  }
  int v15 = 0;
  uint64_t v14 = 0;
  objc_msgSend(a5, "getBoundingBoxMin:max:", &v16, &v14, *(_OWORD *)&a1);
  double v7 = dbl_1DAFF0B20[v6];
  double v8 = (float)(*(float *)&v14 - *(float *)&v16);
  switch(a4)
  {
    case 0uLL:
    case 2uLL:
      double v9 = v7 + v8 * -0.5;
      double v10 = -0.1;
      goto LABEL_6;
    case 1uLL:
    case 3uLL:
      double v9 = v7 + v8 * 0.5;
      double v10 = 0.1;
LABEL_6:
      *(float *)&unsigned int v11 = v9 + v10 + (float)((float)(*(float *)&v14 + *(float *)&v16) * -0.5);
      double result = COERCE_DOUBLE(__PAIR64__(v13, v11));
      break;
    default:
      double result = 0.0;
      break;
  }
  return result;
}

- (double)_tritiumOriginAdjustmentForDigit:(uint64_t)a3
{
  switch(a3)
  {
    case 0:
    case 2:
      *(void *)&double result = 3192704205;
      break;
    case 1:
    case 3:
      *(void *)&double result = 1045220557;
      break;
    default:
      double result = 0.0;
      break;
  }
  return result;
}

- (void)_queue_configureController:(id)a3 digit:(unint64_t)a4
{
  id v13 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_renderQueue);
  BOOL v6 = [v13 node];
  double v7 = self;
  objc_sync_enter(v7);
  [(NSMapTable *)v7->_digitControllerLookup setObject:v13 forKey:v6];
  objc_sync_exit(v7);

  [(NTKSnowglobeSceneController *)v7 _restingOriginForDigit:a4 node:v6];
  LODWORD(v9) = HIDWORD(v8);
  LODWORD(v11) = v10;
  objc_msgSend(v13, "setOrigin:", v8, v9, v11);
  [(NTKSnowglobeSceneController *)v7 _restingOriginForDigit:a4 node:v6];
  objc_msgSend(v13, "setTritiumOrigin:");
  [v13 setTritiumRotation:0.0];
  float32x4_t v12 = [(NTKSnowglobeSceneController *)v7 appliedSnowglobeState];
  objc_msgSend(v13, "setPausePhysics:", objc_msgSend(v12, "scenePaused"));
}

- (void)_queue_animatedReplaceDigit:(unint64_t)a3 withCharacter:(unint64_t)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_renderQueue);

  MEMORY[0x1F4181798](self, sel__queue_animatedReplaceDigit_withCharacter_force_);
}

- (void)_queue_animatedReplaceDigit:(unint64_t)a3 withCharacter:(unint64_t)a4 force:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_renderQueue);
  digitControllers = self->_digitControllers;
  int v10 = [NSNumber numberWithUnsignedInteger:a3];
  double v11 = [(NSMutableDictionary *)digitControllers objectForKeyedSubscript:v10];
  if (v11)
  {
    float32x4_t v12 = self->_digitControllers;
    id v13 = [NSNumber numberWithUnsignedInteger:a3];
    uint64_t v14 = [(NSMutableDictionary *)v12 objectForKeyedSubscript:v13];
    uint64_t v15 = [v14 digit];

    if (v15 == a4 && !v5) {
      return;
    }
  }
  else
  {
  }
  uint64_t v16 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v53 = a3;
    __int16 v54 = 2048;
    unint64_t v55 = a4;
    _os_log_impl(&dword_1DAFDF000, v16, OS_LOG_TYPE_DEFAULT, "Replacing digit with animation at %lu with %lu", buf, 0x16u);
  }

  float v17 = 2.5;
  float v18 = -5.5;
  float v19 = 10.0;
  float v20 = -2.0;
  switch(a3)
  {
    case 0uLL:
      goto LABEL_12;
    case 1uLL:
      float v18 = 5.5;
      float v20 = 0.5;
      goto LABEL_12;
    case 2uLL:
      float v17 = -1.5;
      float v19 = -10.0;
      float v20 = -0.5;
      goto LABEL_12;
    case 3uLL:
      float v17 = -1.5;
      float v18 = 5.5;
      float v19 = -10.0;
      float v20 = 2.0;
LABEL_12:
      double v21 = self->_digitControllers;
      float v22 = [NSNumber numberWithUnsignedInteger:a3];
      uint64_t v23 = [(NSMutableDictionary *)v21 objectForKeyedSubscript:v22];

      if (v23)
      {
        [(NSMutableArray *)self->_exitingDigitControllers addObject:v23];
        __double2 v24 = [v23 node];
        uint64_t v25 = [v24 physicsBody];
        [v25 setCollisionBitMask:1];

        uint64_t v26 = [v23 node];
        float32x4_t v27 = [v26 physicsBody];
        [v27 setContactTestBitMask:1];

        *(float *)&double v28 = v20;
        *(float *)&double v29 = v19;
        LODWORD(v30) = 0;
        objc_msgSend(v23, "setExitOrigin:", v28, v29, v30);
        [v23 setExiting:1];
      }
      objc_initWeak((id *)buf, self);
      dispatch_time_t v31 = dispatch_time(0, 5000000000);
      renderQueue = self->_renderQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1DAFEB9C0;
      block[3] = &unk_1E6BE5090;
      id v33 = v23;
      id v50 = v33;
      objc_copyWeak(&v51, (id *)buf);
      dispatch_after(v31, renderQueue, block);
      uint64_t v34 = [NTKSnowglobeDigitController alloc];
      scene = self->_scene;
      group = self->_group;
      double v36 = self->_renderQueue;
      uint64_t v41 = MEMORY[0x1E4F143A8];
      uint64_t v42 = 3221225472;
      id v43 = sub_1DAFEBA40;
      uint64_t v44 = &unk_1E6BE50B8;
      objc_copyWeak(v45, (id *)buf);
      float v46 = v18;
      float v47 = v17;
      int v48 = 0;
      v45[1] = (id)a3;
      float v38 = [(NTKSnowglobeDigitController *)v34 initWithDigit:a4 scene:scene queue:v36 group:group configureNode:&v41];
      float v39 = self->_digitControllers;
      unsigned int v40 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a3, v41, v42, v43, v44);
      [(NSMutableDictionary *)v39 setObject:v38 forKeyedSubscript:v40];

      objc_destroyWeak(v45);
      objc_destroyWeak(&v51);

      objc_destroyWeak((id *)buf);
      break;
    default:
      return;
  }
}

- (id)_queue_backgroundObjectPositions
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_renderQueue);
  double v3 = self->_screenSize.height / self->_screenSize.width;
  double v4 = objc_opt_new();
  unint64_t v5 = vcvtpd_u64_f64(v3 / 0.113137085);
  if (v5)
  {
    if (9 * v5 <= 1) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 9 * v5;
    }
    do
    {
      [v4 addObject:&unk_1F352BF48];
      --v6;
    }
    while (v6);
  }
  double v7 = objc_opt_new();
  double v8 = objc_opt_new();
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = sub_1DAFEC0A8;
  v60[3] = &unk_1E6BE50E0;
  id v9 = v4;
  id v61 = v9;
  uint64_t v62 = 9;
  int v10 = (void *)MEMORY[0x1E0186F00](v60);
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = sub_1DAFEC0EC;
  v54[3] = &unk_1E6BE5108;
  uint64_t v57 = 0x3FBCF68D4FFF04DCLL;
  long long v58 = xmmword_1DAFF0B50;
  unint64_t v59 = v5;
  id v42 = v10;
  id v56 = v42;
  id v11 = v8;
  id v55 = v11;
  float32x4_t v12 = (void (**)(void, __n128, __n128))MEMORY[0x1E0186F00](v54);
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = sub_1DAFEC228;
  v50[3] = &unk_1E6BE5130;
  uint64_t v52 = 0x3FBCF68D4FFF04DCLL;
  id v41 = v9;
  id v51 = v41;
  uint64_t v53 = 9;
  uint64_t v13 = MEMORY[0x1E0186F00](v50);
  double v14 = (float)((float)arc4random() * 2.3283e-10);
  double v15 = (float)((float)arc4random() * 2.3283e-10);
  *(double *)v49 = v14;
  *(double *)&v49[1] = v15;
  uint64_t v16 = [MEMORY[0x1E4F29238] valueWithBytes:v49 objCType:"{CGPoint=dd}"];
  [v11 addObject:v16];

  [v7 addObject:&unk_1F352BF60];
  id v43 = (void (**)(void, void, double, double))v13;
  (*(void (**)(uint64_t, void, double, double))(v13 + 16))(v13, 0, v14, v15);
  while ([v7 count])
  {
    if ((unint64_t)[v11 count] > 0x31) {
      break;
    }
    uint64_t v17 = arc4random_uniform([v7 count]);
    float v18 = [v7 objectAtIndexedSubscript:v17];
    uint64_t v19 = [v18 unsignedIntegerValue];

    float v20 = [v11 objectAtIndexedSubscript:v19];
    [v20 CGPointValue];
    double v22 = v21;

    uint64_t v23 = 0;
    while (1)
    {
      v24.n128_f64[0] = sub_1DAFEC2AC(v22);
      if (v24.n128_f64[0] <= 1.0)
      {
        double v26 = v24.n128_f64[0];
        if (v24.n128_f64[0] >= 0.0)
        {
          double v27 = v25.n128_f64[0];
          if (v25.n128_f64[0] >= 0.0 && v25.n128_f64[0] <= v3) {
            break;
          }
        }
      }
LABEL_26:
      if (++v23 == 30)
      {
        [v7 removeObjectAtIndex:v17];
        goto LABEL_29;
      }
    }
    double v29 = v12[2](v12, v24, v25);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v30 = v29;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v45 objects:v63 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v46;
      while (2)
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v46 != v33) {
            objc_enumerationMutation(v30);
          }
          [*(id *)(*((void *)&v45 + 1) + 8 * i) CGPointValue];
          if ((v36 - v27) * (v36 - v27) + (v35 - v26) * (v35 - v26) < 0.0256)
          {

            goto LABEL_26;
          }
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v45 objects:v63 count:16];
        if (v32) {
          continue;
        }
        break;
      }
    }

    v43[2](v43, [v11 count], v26, v27);
    double v37 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
    [v7 addObject:v37];

    *(double *)uint64_t v44 = v26;
    *(double *)&v44[1] = v27;
    float v38 = [MEMORY[0x1E4F29238] valueWithBytes:v44 objCType:"{CGPoint=dd}"];
    [v11 addObject:v38];

LABEL_29:
    ;
  }
  id v39 = v11;

  return v39;
}

- (void)_queue_loadBackgroundObjects
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_renderQueue);
  [(SCNNode *)self->_backgroundContainer removeFromParentNode];
  daintyIndex = self->_daintyIndex;
  self->_daintyIndex = 0;

  [(NSMutableArray *)self->_backgroundControllers removeAllObjects];
  double v4 = [MEMORY[0x1E4F3B228] node];
  backgroundContainer = self->_backgroundContainer;
  self->_backgroundContainer = v4;

  [(NTKSnowglobeSceneController *)self _queue_updateBackgroundContainerOpacity];
  uint64_t v6 = [(SCNNode *)self->_cameraNode camera];
  [v6 fieldOfView];
  double v8 = v7;

  [(SCNNode *)self->_cameraFocalNode simdPosition];
  float32x4_t v60 = v9;
  [(SCNNode *)self->_cameraNode simdPosition];
  float32x4_t v57 = v10;
  id v11 = objc_opt_new();
  double v12 = CACurrentMediaTime();
  uint64_t v13 = [(NTKSnowglobeSceneController *)self _queue_backgroundObjectPositions];
  double v14 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v72 = [v13 count];
    __int16 v73 = 2048;
    double v74 = (CACurrentMediaTime() - v12) * 1000.0;
    _os_log_impl(&dword_1DAFDF000, v14, OS_LOG_TYPE_DEFAULT, "fished %lu in %.2fms", buf, 0x16u);
  }

  uint64_t v53 = objc_opt_new();
  double v15 = objc_opt_new();
  if ([v13 count])
  {
    unint64_t v16 = 0;
    float v17 = v8 * 3.14159265 / 180.0;
    float v56 = v17;
    float v18 = COERCE_FLOAT(vaddq_f32(v60, v57).i32[2]);
    float32x2_t v55 = (float32x2_t)vdup_n_s32(0x3F8CCCCDu);
    do
    {
      uint64_t v19 = [NSNumber numberWithUnsignedInt:arc4random()];
      [v11 addObject:v19];

      float v20 = [v13 objectAtIndexedSubscript:v16];
      [v20 CGPointValue];
      float64_t v58 = v22;
      float64_t v61 = v21;

      v23.f64[0] = v61;
      v23.f64[1] = v58;
      float32x2_t v24 = vmul_f32(vadd_f32(vcvt_f32_f64(v23), (float32x2_t)0xBF000000BF000000), v55);
      double v25 = self->_screenSize.height / self->_screenSize.width;
      double v26 = fabsf(v24.f32[0]);
      int v27 = v26 >= 0.51 || v26 <= 0.48;
      double v28 = fabsf(v24.f32[1]);
      int v29 = v25 * 0.48 < v28;
      if (v25 * 0.51 <= v28) {
        int v29 = 0;
      }
      if (v29 == v27)
      {
        float32x2_t v62 = v24;
        id v30 = [NSNumber numberWithUnsignedInteger:v16];
        [v53 addObject:v30];

        float32x2_t v24 = v62;
      }
      float32x2_t v59 = vmul_n_f32(v24, v56);
      double v31 = -(double)(arc4random_uniform(0xFu) + 4) - v18;
      __float2 v32 = __sincosf_stret(v59.f32[0]);
      *(double *)&long long v33 = v31 * v32.__sinval;
      *(float *)&long long v33 = *(double *)&v33;
      long long v63 = v33;
      __float2 v34 = __sincosf_stret(v59.f32[1]);
      float v35 = v31 * v34.__sinval;
      float v36 = v31 * (float)(v32.__cosval * v34.__cosval);
      long long v37 = v63;
      *((float *)&v37 + 1) = v35;
      *((float *)&v37 + 2) = v18 + v36;
      long long v64 = v37;
      double v38 = v31 / (float)(v18 + 10.0) * (((double)arc4random() / 4294967300.0 * 0.5 + 1.0) * -0.7);
      id v39 = self->_renderQueue;
      v67[0] = MEMORY[0x1E4F143A8];
      v67[1] = 3221225472;
      v67[2] = sub_1DAFEC8E8;
      v67[3] = &unk_1E6BE5180;
      v69 = v39;
      double v70 = v38;
      long long v68 = v64;
      unsigned int v40 = v39;
      id v41 = +[NTKSnowglobePromise promiseWithBlock:v67];
      [v15 addObject:v41];
      [(NTKSnowglobeSceneController *)self _queue_setupBackgroundObject:v41];

      ++v16;
    }
    while (v16 < [v13 count]);
  }
  id v42 = (NSArray *)objc_msgSend(v11, "copy", v53);
  backgroundObjectRandoms = self->_backgroundObjectRandoms;
  self->_backgroundObjectRandoms = v42;

  uint64_t v44 = (NSArray *)[v15 copy];
  backgroundObjects = self->_backgroundObjects;
  self->_backgroundObjects = v44;

  long long v46 = (NSArray *)[v54 copy];
  offscreenBackgroundObjectIndices = self->_offscreenBackgroundObjectIndices;
  self->_offscreenBackgroundObjectIndices = v46;

  long long v48 = self->_renderQueue;
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = sub_1DAFECA4C;
  v65[3] = &unk_1E6BE51A8;
  v49 = v48;
  v66 = v49;
  id v50 = +[NTKSnowglobePromise promiseWithBlock:v65];
  daintyPromise = self->_daintyPromise;
  self->_daintyPromise = v50;

  if ([(NSArray *)self->_offscreenBackgroundObjectIndices count])
  {
    [(NTKSnowglobeSceneController *)self _queue_setupBackgroundObject:self->_daintyPromise];
    [(NTKSnowglobeSceneController *)self _queue_replaceRandomObjectWithDainty];
  }
  uint64_t v52 = [(SCNScene *)self->_scene rootNode];
  [v52 addChildNode:self->_backgroundContainer];
}

- (void)_queue_setupBackgroundObject:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_renderQueue);
  unint64_t v5 = self->_group;
  dispatch_group_enter((dispatch_group_t)v5);
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DAFECC84;
  v7[3] = &unk_1E6BE51D0;
  objc_copyWeak(&v9, &location);
  uint64_t v6 = v5;
  double v8 = v6;
  [v4 fetchWithCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_queue_replaceRandomObjectWithDainty
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_renderQueue);
  if ([(NSArray *)self->_offscreenBackgroundObjectIndices count])
  {
    daintyIndex = self->_daintyIndex;
    if (daintyIndex)
    {
      id v4 = [(NSArray *)self->_backgroundObjects objectAtIndexedSubscript:[(NSNumber *)daintyIndex intValue]];
      [v4 fetchWithCompletion:&unk_1F3527F98];
    }
    uint64_t v5 = arc4random_uniform([(NSArray *)self->_offscreenBackgroundObjectIndices count]);
    uint64_t v6 = [(NSArray *)self->_offscreenBackgroundObjectIndices objectAtIndexedSubscript:v5];
    uint64_t v7 = [v6 unsignedIntegerValue];

    if (v7 == [(NSNumber *)self->_daintyIndex unsignedIntegerValue])
    {
      double v8 = [(NSArray *)self->_offscreenBackgroundObjectIndices objectAtIndexedSubscript:(v5 + 1) % [(NSArray *)self->_offscreenBackgroundObjectIndices count]];
      uint64_t v7 = [v8 unsignedIntegerValue];
    }
    id v9 = [NSNumber numberWithUnsignedInteger:v7];
    float32x4_t v10 = self->_daintyIndex;
    self->_daintyIndex = v9;

    id v11 = self->_group;
    dispatch_group_enter((dispatch_group_t)v11);
    objc_initWeak(&location, self);
    double v12 = [(NSArray *)self->_backgroundObjects objectAtIndexedSubscript:v7];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1DAFECFE8;
    v14[3] = &unk_1E6BE51D0;
    objc_copyWeak(&v16, &location);
    uint64_t v13 = v11;
    double v15 = v13;
    [v12 fetchWithCompletion:v14];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

- (void)renderer:(id)a3 updateAtTime:(double)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_renderQueue);
  uint64_t v6 = [(NTKSnowglobeSceneController *)self appliedSnowglobeState];
  if (([v6 editing] & 1) == 0 && (objc_msgSend(v6, "idealizedState") & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_crownInputHandler);
    [WeakRetained step:0.0333333333];
  }
  backgroundControllers = self->_backgroundControllers;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1DAFED388;
  v12[3] = &unk_1E6BE5240;
  v12[4] = self;
  [(NSMutableArray *)backgroundControllers enumerateObjectsUsingBlock:v12];
  id v9 = objc_opt_new();
  float32x4_t v10 = [(NSMutableDictionary *)self->_digitControllers allValues];
  [v9 addObjectsFromArray:v10];

  [v9 addObjectsFromArray:self->_exitingDigitControllers];
  [v9 addObjectsFromArray:self->_backgroundControllers];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1DAFED3EC;
  v11[3] = &unk_1E6BE5260;
  *(double *)&v11[4] = a4;
  [v9 enumerateObjectsUsingBlock:v11];
  [(NTKSnowglobeSceneController *)self _queue_updateCameraParallax];
}

- (void)physicsWorld:(id)a3 didBeginContact:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_renderQueue);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = sub_1DAFED708;
  v30[3] = &unk_1E6BE5288;
  v30[4] = self;
  double v8 = (void (**)(void, void))MEMORY[0x1E0186F00](v30);
  id v9 = self;
  objc_sync_enter(v9);
  float32x4_t v10 = [v7 nodeA];
  id v11 = ((void (**)(void, void *))v8)[2](v8, v10);

  double v12 = [v7 nodeB];
  uint64_t v13 = ((void (**)(void, void *))v8)[2](v8, v12);

  objc_sync_exit(v9);
  if (!v11 || !v13 || ([v7 collisionImpulse], v14 >= 0.1))
  {
    double v15 = [v7 nodeA];
    id v16 = v15;
    if (v15 == v9->_glassNode)
    {
    }
    else
    {
      float v17 = [v7 nodeB];
      BOOL v18 = v17 == v9->_glassNode;

      if (!v18)
      {
LABEL_16:
        [v11 didCollide];
        [v13 didCollide];
        goto LABEL_17;
      }
    }
    if (v11) {
      uint64_t v19 = v11;
    }
    else {
      uint64_t v19 = v13;
    }
    float v20 = [v19 node];
    double v21 = [v20 physicsBody];
    [v21 velocity];
    float v23 = v22;

    [v7 collisionImpulse];
    uint64_t v25 = v24;
    double v26 = _NTKLoggingObjectForDomain();
    double v27 = v23;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      double v32 = v23;
      __int16 v33 = 2048;
      uint64_t v34 = v25;
      _os_log_impl(&dword_1DAFDF000, v26, OS_LOG_TYPE_INFO, "Play haptic %f %f", buf, 0x16u);
    }

    double v28 = NTKSnowglobeTunableFloat(@"hapticTimeout", 0.1);
    double v29 = NTKSnowglobeTunableFloat(@"hapticVelocityMin", 2.0);
    NTKSnowglobeTunableFloat(@"hapticVelocityMax", 8.0);
    if (CACurrentMediaTime() - v9->_lastHaptic > v28 && v29 < v27) {
      v9->_lastHaptic = CACurrentMediaTime();
    }
    goto LABEL_16;
  }
LABEL_17:
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [(CLKTimeFormatter *)self->_timeFormatter setOverrideDate:v5];
  id v6 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_1DAFDF000, v6, OS_LOG_TYPE_DEFAULT, "Snowglobe override date %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)setTimeOffset:(double)a3
{
}

- (void)_setupTimeFormatter
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  double v3 = (CLKTimeFormatter *)[objc_alloc(MEMORY[0x1E4F19AD0]) initWithForcesLatinNumbers:1];
  timeFormatter = self->_timeFormatter;
  self->_timeFormatter = v3;

  [(CLKTimeFormatter *)self->_timeFormatter setIncludeSeparatorInTimeSubstringFromSeparatorText:0];
  id v5 = self->_timeFormatter;

  MEMORY[0x1F4181798](v5, sel_addObserver_);
}

- (id)_charactersFromFormatter:(id)a3
{
  v20[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v4 = [v3 timeSubstringToSeparatorText];
  id v5 = [v3 timeSubstringFromSeparatorText];

  if ([v4 length] == 1)
  {
    int v6 = [v4 intValue];
    uint64_t v7 = 0;
  }
  else
  {
    id v8 = objc_msgSend(v4, "substringWithRange:", 0, 1);
    uint64_t v7 = (int)[v8 intValue];

    uint64_t v9 = objc_msgSend(v4, "substringWithRange:", 1, 1);
    int v6 = [v9 intValue];
  }
  float32x4_t v10 = objc_msgSend(v5, "substringWithRange:", 0, 1);
  uint64_t v11 = (int)[v10 intValue];

  double v12 = objc_msgSend(v5, "substringWithRange:", 1, 1);
  uint64_t v13 = (int)[v12 intValue];

  double v14 = [NSNumber numberWithUnsignedInteger:v7];
  v20[0] = v14;
  double v15 = [NSNumber numberWithUnsignedInteger:v6];
  v20[1] = v15;
  id v16 = [NSNumber numberWithUnsignedInteger:v11];
  v20[2] = v16;
  float v17 = [NSNumber numberWithUnsignedInteger:v13];
  v20[3] = v17;
  BOOL v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];

  return v18;
}

- (void)timeFormatterTextDidChange:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v5 = [(NTKSnowglobeSceneController *)self _charactersFromFormatter:v4];
  int v6 = [v4 overrideDate];

  renderQueue = self->_renderQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1DAFEDBD0;
  block[3] = &unk_1E6BE52D8;
  BOOL v11 = v6 != 0;
  void block[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(renderQueue, block);
}

- (void)tapAtPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_renderer);

  if (WeakRetained)
  {
    renderQueue = self->_renderQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1DAFEDE5C;
    block[3] = &unk_1E6BE5300;
    void block[4] = self;
    *(CGFloat *)&void block[5] = x;
    *(CGFloat *)&block[6] = y;
    dispatch_async(renderQueue, block);
  }
}

- (void)_queue_tapAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v32[2] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_renderQueue);
  double v6 = x + x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_renderer);
  [WeakRetained currentViewport];
  double v9 = v8 + y * -2.0;

  uint64_t v10 = 0;
  uint64_t v11 = *MEMORY[0x1E4F3B2D8];
  uint64_t v12 = *MEMORY[0x1E4F3B2F8];
  do
  {
    digitControllers = self->_digitControllers;
    double v14 = [NSNumber numberWithUnsignedInteger:v10];
    double v15 = [(NSMutableDictionary *)digitControllers objectForKeyedSubscript:v14];

    id v16 = [v15 node];

    if (v16)
    {
      id v17 = objc_loadWeakRetained((id *)&self->_renderer);
      v31[1] = v12;
      v32[0] = MEMORY[0x1E4F1CC38];
      v31[0] = v11;
      BOOL v18 = [v15 node];
      v32[1] = v18;
      uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
      float v20 = objc_msgSend(v17, "hitTest:options:", v19, v6, v9);

      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v21 = v20;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v27;
        do
        {
          uint64_t v25 = 0;
          do
          {
            if (*(void *)v27 != v24) {
              objc_enumerationMutation(v21);
            }
            [*(id *)(*((void *)&v26 + 1) + 8 * v25) localCoordinates];
            objc_msgSend(v15, "applyTapAtLocalPosition:");
            ++v25;
          }
          while (v23 != v25);
          uint64_t v23 = [v21 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v23);
      }
    }
    ++v10;
  }
  while (v10 != 4);
}

- (void)_queue_configureLightingWithTritiumFraction:(double)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_renderQueue);
  double v5 = 1.0 - a3;
  double v6 = [(SCNScene *)self->_scene lightingEnvironment];
  [v6 setIntensity:v5 + v5];

  nightLightNode = self->_nightLightNode;
  if (a3 <= 0.0)
  {
    [(SCNNode *)nightLightNode setHidden:1];
    [(SCNNode *)self->_nightAmbientLightNode setHidden:1];
  }
  else
  {
    [(SCNNode *)nightLightNode setHidden:0];
    [(SCNNode *)self->_nightAmbientLightNode setHidden:0];
    [(SCNLight *)self->_nightLight setIntensity:a3 * 1400.0];
    [(SCNLight *)self->_nightAmbientLight setIntensity:a3 * 150.0];
  }
  leftBacklightNode = self->_leftBacklightNode;
  if (a3 >= 1.0)
  {
    [(SCNNode *)leftBacklightNode setHidden:1];
    rightBacklightNode = self->_rightBacklightNode;
    [(SCNNode *)rightBacklightNode setHidden:1];
  }
  else
  {
    [(SCNNode *)leftBacklightNode setHidden:0];
    [(SCNNode *)self->_rightBacklightNode setHidden:0];
    [(SCNLight *)self->_leftBacklight setIntensity:v5 * 1800.0];
    rightBacklight = self->_rightBacklight;
    [(SCNLight *)rightBacklight setIntensity:v5 * 1800.0];
  }
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (void)setFrozen:(BOOL)a3
{
  self->_frozen = a3;
}

- (SCNScene)scene
{
  return self->_scene;
}

- (SCNRenderer)renderer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_renderer);

  return (SCNRenderer *)WeakRetained;
}

- (void)setRenderer:(id)a3
{
}

- (NTKSnowglobeCrownHandler)crownInputHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_crownInputHandler);

  return (NTKSnowglobeCrownHandler *)WeakRetained;
}

- (void)setCrownInputHandler:(id)a3
{
}

- (NTKSnowglobeColorPalette)colorPalette
{
  return self->_colorPalette;
}

- (NTKSnowglobeState)appliedSnowglobeState
{
  return self->_appliedSnowglobeState;
}

- (void)setAppliedSnowglobeState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appliedSnowglobeState, 0);
  objc_storeStrong((id *)&self->_colorPalette, 0);
  objc_destroyWeak((id *)&self->_crownInputHandler);
  objc_destroyWeak((id *)&self->_renderer);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_asyncApplyStateSemaphore, 0);
  objc_storeStrong((id *)&self->_renderQueue, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_snowglobeState, 0);
  objc_storeStrong((id *)&self->_glassNode, 0);
  objc_storeStrong((id *)&self->_nightAmbientLightNode, 0);
  objc_storeStrong((id *)&self->_nightLightNode, 0);
  objc_storeStrong((id *)&self->_rightBacklightNode, 0);
  objc_storeStrong((id *)&self->_leftBacklightNode, 0);
  objc_storeStrong((id *)&self->_nightAmbientLight, 0);
  objc_storeStrong((id *)&self->_nightLight, 0);
  objc_storeStrong((id *)&self->_rightBacklight, 0);
  objc_storeStrong((id *)&self->_leftBacklight, 0);
  objc_storeStrong((id *)&self->_daintyIndex, 0);
  objc_storeStrong((id *)&self->_offscreenBackgroundObjectIndices, 0);
  objc_storeStrong((id *)&self->_daintyPromise, 0);
  objc_storeStrong((id *)&self->_backgroundObjects, 0);
  objc_storeStrong((id *)&self->_backgroundObjectRandoms, 0);
  objc_storeStrong((id *)&self->_backgroundContainer, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_digitControllerLookup, 0);
  objc_storeStrong((id *)&self->_backgroundControllers, 0);
  objc_storeStrong((id *)&self->_exitingDigitControllers, 0);
  objc_storeStrong((id *)&self->_digitControllers, 0);
  objc_storeStrong((id *)&self->_cameraFocalNode, 0);
  objc_storeStrong((id *)&self->_cameraNode, 0);
  objc_storeStrong((id *)&self->_library, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end