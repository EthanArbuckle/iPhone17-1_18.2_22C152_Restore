@interface ARUIRingGroup
+ (double)preferredActivityRingInterspacingForDiameter:(double)a3;
+ (double)preferredActivityRingThicknessForDiameter:(double)a3;
+ (double)preferredActivityRingThicknessForDiameter:(double)a3 isStandaloneRing:(BOOL)a4;
+ (id)_timingFunctionForCurve:(unint64_t)a3;
+ (id)activityRingGroup;
+ (id)activityRingGroupForRingType:(int64_t)a3;
+ (id)countdownRingGroup;
+ (id)countdownRingGroupOnCompanion;
+ (unint64_t)_numberOfRingsForRingType:(int64_t)a3;
+ (void)animateUsingSpringWithTension:(double)a3 friction:(double)a4 animations:(id)a5;
+ (void)animateUsingSpringWithTension:(double)a3 friction:(double)a4 animations:(id)a5 completion:(id)a6;
+ (void)animateWithDuration:(double)a3 animations:(id)a4;
+ (void)animateWithDuration:(double)a3 animations:(id)a4 completion:(id)a5;
+ (void)animateWithDuration:(double)a3 animations:(id)a4 curve:(unint64_t)a5 completion:(id)a6;
- (ARUIRingGroup)forCompanion;
- (ARUIRingGroup)forWatch;
- (ARUIRingGroup)initWithNumberOfRings:(int64_t)a3;
- (ARUIRingGroup)initWithNumberOfRings:(int64_t)a3 animationSequencer:(id)a4;
- (ARUIRingGroup)initWithRings:(id)a3 animationSequencer:(id)a4;
- (ARUIRingGroup)withSpriteSheet;
- (ARUIRingGroup)withWheelchairSpriteSheet;
- (ARUIRingGroupDelegate)delegate;
- (ARUISpriteSheet)spriteSheet;
- (BOOL)_shouldObserveSequencer;
- (BOOL)animating;
- (BOOL)paused;
- (NSArray)rings;
- (NSString)description;
- (double)_adjustedDurationForRingWithIndex:(int64_t)a3 startPercentage:(float)a4 targetPercentage:(float)a5 defaultDuration:(double)a6;
- (double)translation;
- (float)_ringPercentageAdjustedForProximityToFull:(float)result withRingDiameter:(float)a4 thickness:(float)a5;
- (float)emptyOpacity;
- (float)groupDiameter;
- (float)interspacing;
- (float)opacity;
- (float)scale;
- (float)thickness;
- (float)trackOpacity;
- (float)zRotation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)playingSpriteAnimation;
- (int64_t)ringType;
- (void)_positionSprites;
- (void)_removeAnimationForKey:(id)a3;
- (void)_setDefaultGroupValues:(id)a3;
- (void)_setStandardColorsWithAnimated:(BOOL)a3;
- (void)_setupColorAnimationForState:(id)a3 startTopColor:(id)a4 endTopColor:(id)a5 startBottomColor:(id)a6 endBottomColor:(id)a7 key:(id)a8 applier:(id)a9;
- (void)_setupFloat2AnimationForState:(ARUIRingGroup *)self startValue:(SEL)a2 endValue:(id)a3 key:(id)a4 applier:(id)a5;
- (void)_setupFloatAnimationForState:(id)a3 startValue:(float)a4 endValue:(float)a5 key:(id)a6 applier:(id)a7;
- (void)_setupUIntAnimationForState:(id)a3 startValue:(unint64_t)a4 endValue:(unint64_t)a5 key:(id)a6 applier:(id)a7;
- (void)_updateAnimationObserving;
- (void)_updateRingGroupLayout;
- (void)animationSequencer:(id)a3 updatedWithTime:(double)a4;
- (void)dealloc;
- (void)playCelebration:(id)a3 onRingAtIndex:(unint64_t)a4;
- (void)playCelebration:(id)a3 onRingAtIndex:(unint64_t)a4 completion:(id)a5;
- (void)playSpriteAnimation;
- (void)playSpriteAnimationWithCompletion:(id)a3;
- (void)removeAllAnimations;
- (void)setActiveEnergyPercentage:(float)a3 animated:(BOOL)a4;
- (void)setActiveEnergyPercentage:(float)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setActiveEnergyPercentage:(float)a3 exerciseMinutesPercentage:(float)a4 standHoursPercentage:(float)a5 animated:(BOOL)a6;
- (void)setActiveEnergyPercentage:(float)a3 exerciseMinutesPercentage:(float)a4 standHoursPercentage:(float)a5 animated:(BOOL)a6 completion:(id)a7;
- (void)setDelegate:(id)a3;
- (void)setEmptyOpacity:(float)a3;
- (void)setEmptyOpacity:(float)a3 ofRingAtIndex:(unint64_t)a4;
- (void)setExerciseMinutesPercentage:(float)a3 animated:(BOOL)a4;
- (void)setExerciseMinutesPercentage:(float)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setFrame:(unint64_t)a3 ofSpriteAtIndex:(unint64_t)a4;
- (void)setGroupDiameter:(float)a3;
- (void)setInterspacing:(float)a3;
- (void)setIsPaused:(BOOL)a3;
- (void)setIsPaused:(BOOL)a3 animated:(BOOL)a4;
- (void)setIsPaused:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setIsPaused:(BOOL)a3 completion:(id)a4;
- (void)setIsStandalonePhoneFitnessMode:(BOOL)a3;
- (void)setIsStandalonePhoneFitnessMode:(BOOL)a3 animated:(BOOL)a4;
- (void)setIsStandalonePhoneFitnessMode:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setIsStandalonePhoneFitnessMode:(BOOL)a3 completion:(id)a4;
- (void)setOpacity:(float)a3;
- (void)setOpacity:(float)a3 ofRingAtIndex:(unint64_t)a4;
- (void)setPaused:(BOOL)a3;
- (void)setPercentage:(float)a3 ofRingAtIndex:(int64_t)a4 animated:(BOOL)a5;
- (void)setPercentage:(float)a3 ofRingAtIndex:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)setPercentage:(float)a3 ofRingAtIndex:(unint64_t)a4;
- (void)setPercentage:(float)a3 ofRingAtIndex:(unint64_t)a4 fromAnimation:(BOOL)a5;
- (void)setRingType:(int64_t)a3;
- (void)setScale:(float)a3;
- (void)setSpriteSheet:(id)a3;
- (void)setStandHoursPercentage:(float)a3 animated:(BOOL)a4;
- (void)setStandHoursPercentage:(float)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setThickness:(float)a3;
- (void)setThickness:(float)a3 ofRingAtIndex:(unint64_t)a4;
- (void)setTopColor:(id)a3 bottomColor:(id)a4 ofRingAtIndex:(int64_t)a5;
- (void)setTopColor:(id)a3 bottomColor:(id)a4 ofRingAtIndex:(int64_t)a5 animated:(BOOL)a6;
- (void)setTrackOpacity:(float)a3;
- (void)setTrackOpacity:(float)a3 ofRingAtIndex:(unint64_t)a4;
- (void)setTranslation:(ARUIRingGroup *)self;
- (void)setZRotation:(float)a3;
@end

@implementation ARUIRingGroup

BOOL __79__ARUIRingGroup_Activity__setIsStandalonePhoneFitnessMode_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v2 + 24))
  {
    [a2 percentage];
    BOOL result = ARUIFloatLess(v4, 0.0);
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  else
  {
    BOOL result = 0;
  }
  *(unsigned char *)(v2 + 24) = result;
  return result;
}

void __52__ARUIRingGroup_animationSequencer_updatedWithTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  [v5 update:*(double *)(a1 + 40)];
  if (([v5 isAnimating] & 1) == 0) {
    [*(id *)(a1 + 32) setObject:v5 forKey:v6];
  }
}

void __42__ARUIRingGroup_setFrame_ofSpriteAtIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setFrame:a2 ofSpriteAtIndex:*(void *)(a1 + 40)];
}

- (void)setFrame:(unint64_t)a3 ofSpriteAtIndex:(unint64_t)a4
{
  v7 = [(ARUISpriteSheet *)self->_spriteSheet sprites];
  v8 = [v7 objectAtIndex:a4];

  if ([v8 currentFrameIndex] != a3)
  {
    v9 = +[ARUIRingGroupAnimationState currentAnimationState];
    if (v9)
    {
      objc_initWeak(&location, self);
      uint64_t v10 = [v8 currentFrameIndex];
      v11 = objc_msgSend(NSString, "stringWithFormat:", @"spriteFrame-%lu", a4);
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __42__ARUIRingGroup_setFrame_ofSpriteAtIndex___block_invoke;
      v13[3] = &unk_264498CA0;
      objc_copyWeak(v14, &location);
      v14[1] = (id)a4;
      [(ARUIRingGroup *)self _setupUIntAnimationForState:v9 startValue:v10 endValue:a3 key:v11 applier:v13];

      objc_destroyWeak(v14);
      objc_destroyWeak(&location);
    }
    else
    {
      [v8 setCurrentFrameIndex:a3];
      v12 = [(ARUIRingGroup *)self delegate];
      [v12 ringGroupHasUpdated:self];
    }
  }
}

- (ARUIRingGroupDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ARUIRingGroupDelegate *)WeakRetained;
}

- (void)animationSequencer:(id)a3 updatedWithTime:(double)a4
{
  id v6 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_animations, "count", a3));
  animations = self->_animations;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __52__ARUIRingGroup_animationSequencer_updatedWithTime___block_invoke;
  v15 = &unk_264498CE8;
  double v17 = a4;
  id v16 = v6;
  id v8 = v6;
  [(NSMutableDictionary *)animations enumerateKeysAndObjectsUsingBlock:&v12];
  v9 = self->_animations;
  uint64_t v10 = objc_msgSend(v8, "allKeys", v12, v13, v14, v15);
  [(NSMutableDictionary *)v9 removeObjectsForKeys:v10];

  v11 = [v8 allValues];
  [v11 enumerateObjectsUsingBlock:&__block_literal_global_56];

  [(ARUIRingGroup *)self _updateAnimationObserving];
}

- (void)_updateAnimationObserving
{
  if ([(ARUIRingGroup *)self _shouldObserveSequencer])
  {
    if (self->_observingSequencing) {
      return;
    }
    [(ARUIAnimationSequencing *)self->_animationSequencer addObserver:self];
    BOOL v3 = 1;
  }
  else
  {
    if (!self->_observingSequencing) {
      return;
    }
    [(ARUIAnimationSequencing *)self->_animationSequencer removeObserver:self];
    BOOL v3 = 0;
  }
  self->_observingSequencing = v3;
}

- (BOOL)_shouldObserveSequencer
{
  uint64_t v3 = [(NSMutableDictionary *)self->_animations count];
  if (v3) {
    LOBYTE(v3) = !self->_paused;
  }
  return v3;
}

- (void)_updateRingGroupLayout
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  float groupDiameter = self->_groupDiameter;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  float v4 = [(NSArray *)self->_rings reverseObjectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        *(float *)&double v6 = groupDiameter;
        [v10 setDiameter:v6];
        [v10 thickness];
        double v6 = groupDiameter + v11 * -2.0 + self->_interspacing * -2.0;
        float groupDiameter = v6;
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [(ARUIRingGroup *)self _positionSprites];
}

- (void)_positionSprites
{
  uint64_t v3 = [(ARUISpriteSheet *)self->_spriteSheet sprites];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __33__ARUIRingGroup__positionSprites__block_invoke;
  v4[3] = &unk_264498C78;
  v4[4] = self;
  [v3 enumerateObjectsUsingBlock:v4];
}

- (void)setThickness:(float)a3 ofRingAtIndex:(unint64_t)a4
{
  uint64_t v7 = +[ARUIRingGroupAnimationState currentAnimationState];
  uint64_t v8 = [(NSArray *)self->_rings objectAtIndex:a4];
  uint64_t v10 = v8;
  if (v7)
  {
    float v11 = +[ARUIAnimationKeyCoordinator animationKeyForType:1 ringIndex:a4];
    objc_initWeak(&location, self);
    [v10 thickness];
    int v13 = v12;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __44__ARUIRingGroup_setThickness_ofRingAtIndex___block_invoke;
    v17[3] = &unk_264498BB0;
    objc_copyWeak(v18, &location);
    v18[1] = (id)a4;
    LODWORD(v14) = v13;
    *(float *)&double v15 = a3;
    [(ARUIRingGroup *)self _setupFloatAnimationForState:v7 startValue:v11 endValue:v17 key:v14 applier:v15];
    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }
  else
  {
    *(float *)&double v9 = a3;
    [v8 setThickness:v9];
    [(ARUIRingGroup *)self _updateRingGroupLayout];
    id v16 = [(ARUIRingGroup *)self delegate];
    [v16 ringGroupHasUpdated:self];
  }
}

void __30__ARUIRingGroup_copyWithZone___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  float v4 = *(void **)(a1 + 32);
  id v5 = a2;
  double v6 = [v4 rings];
  id v7 = [v6 objectAtIndexedSubscript:a3];

  [v7 thickness];
  objc_msgSend(v5, "setThickness:");
  [v7 opacity];
  objc_msgSend(v5, "setOpacity:");
  [v7 emptyOpacity];
  objc_msgSend(v5, "setEmptyOpacity:");
  [v7 trackOpacity];
  objc_msgSend(v5, "setTrackOpacity:");
}

void __79__ARUIRingGroup_Activity__setIsStandalonePhoneFitnessMode_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = +[ARUIMetricColors energyColors];
  id v58 = v2;
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v3 = [v2 nonGradientTextColor];
    float v4 = [v58 nonGradientTextColor];
    [*(id *)(a1 + 32) groupDiameter];
    +[ARUIRingGroup preferredActivityRingThicknessForDiameter:1 isStandaloneRing:v5];
    float v7 = v6;
    int v8 = 0;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
  }
  else
  {
    uint64_t v3 = [v2 gradientDarkColor];
    float v4 = [v58 gradientLightColor];
    [*(id *)(a1 + 32) thickness];
    float v7 = v14;
    double v15 = [*(id *)(a1 + 32) rings];
    id v16 = [v15 objectAtIndexedSubscript:1];
    [v16 opacity];
    if (v17 == 0.0)
    {
      int v8 = ARUIRingOpacityValueDefault;
    }
    else
    {
      v18 = [*(id *)(a1 + 32) rings];
      v19 = [v18 objectAtIndexedSubscript:1];
      [v19 opacity];
      int v8 = v20;
    }
    v21 = [*(id *)(a1 + 32) rings];
    v22 = [v21 objectAtIndexedSubscript:1];
    [v22 emptyOpacity];
    if (v23 == 0.0)
    {
      int v9 = ARUIRingEmptyOpacityValueDefault;
    }
    else
    {
      v24 = [*(id *)(a1 + 32) rings];
      v25 = [v24 objectAtIndexedSubscript:1];
      [v25 emptyOpacity];
      int v9 = v26;
    }
    v27 = [*(id *)(a1 + 32) rings];
    v28 = [v27 objectAtIndexedSubscript:1];
    [v28 trackOpacity];
    if (v29 == 0.0)
    {
      int v10 = ARUIRingTrackOpacityValueDefault;
    }
    else
    {
      v30 = [*(id *)(a1 + 32) rings];
      v31 = [v30 objectAtIndexedSubscript:1];
      [v31 trackOpacity];
      int v10 = v32;
    }
    v33 = [*(id *)(a1 + 32) rings];
    v34 = [v33 objectAtIndexedSubscript:0];
    [v34 opacity];
    if (v35 == 0.0)
    {
      int v11 = ARUIRingOpacityValueDefault;
    }
    else
    {
      v36 = [*(id *)(a1 + 32) rings];
      v37 = [v36 objectAtIndexedSubscript:0];
      [v37 opacity];
      int v11 = v38;
    }
    v39 = [*(id *)(a1 + 32) rings];
    v40 = [v39 objectAtIndexedSubscript:0];
    [v40 emptyOpacity];
    if (v41 == 0.0)
    {
      int v12 = ARUIRingEmptyOpacityValueDefault;
    }
    else
    {
      v42 = [*(id *)(a1 + 32) rings];
      v43 = [v42 objectAtIndexedSubscript:0];
      [v43 emptyOpacity];
      int v12 = v44;
    }
    v45 = [*(id *)(a1 + 32) rings];
    v46 = [v45 objectAtIndexedSubscript:0];
    [v46 trackOpacity];
    if (v47 == 0.0)
    {
      int v13 = ARUIRingTrackOpacityValueDefault;
    }
    else
    {
      v48 = [*(id *)(a1 + 32) rings];
      v49 = [v48 objectAtIndexedSubscript:0];
      [v49 trackOpacity];
      int v13 = v50;
    }
  }
  [*(id *)(a1 + 32) setTopColor:v3 bottomColor:v4 ofRingAtIndex:2];
  *(float *)&double v51 = v7;
  [*(id *)(a1 + 32) setThickness:2 ofRingAtIndex:v51];
  LODWORD(v52) = v8;
  [*(id *)(a1 + 32) setOpacity:1 ofRingAtIndex:v52];
  LODWORD(v53) = v9;
  [*(id *)(a1 + 32) setEmptyOpacity:1 ofRingAtIndex:v53];
  LODWORD(v54) = v10;
  [*(id *)(a1 + 32) setTrackOpacity:1 ofRingAtIndex:v54];
  LODWORD(v55) = v11;
  [*(id *)(a1 + 32) setOpacity:0 ofRingAtIndex:v55];
  LODWORD(v56) = v12;
  [*(id *)(a1 + 32) setEmptyOpacity:0 ofRingAtIndex:v56];
  LODWORD(v57) = v13;
  [*(id *)(a1 + 32) setTrackOpacity:0 ofRingAtIndex:v57];
}

- (void)setOpacity:(float)a3 ofRingAtIndex:(unint64_t)a4
{
  float v7 = +[ARUIRingGroupAnimationState currentAnimationState];
  int v8 = [(NSArray *)self->_rings objectAtIndex:a4];
  int v10 = v8;
  if (v7)
  {
    int v11 = +[ARUIAnimationKeyCoordinator animationKeyForType:2 ringIndex:a4];
    objc_initWeak(&location, self);
    [v10 opacity];
    int v13 = v12;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __42__ARUIRingGroup_setOpacity_ofRingAtIndex___block_invoke;
    v17[3] = &unk_264498BB0;
    objc_copyWeak(v18, &location);
    v18[1] = (id)a4;
    LODWORD(v14) = v13;
    *(float *)&double v15 = a3;
    [(ARUIRingGroup *)self _setupFloatAnimationForState:v7 startValue:v11 endValue:v17 key:v14 applier:v15];
    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }
  else
  {
    *(float *)&double v9 = a3;
    [v8 setOpacity:v9];
    [(ARUIRingGroup *)self _updateRingGroupLayout];
    id v16 = [(ARUIRingGroup *)self delegate];
    [v16 ringGroupHasUpdated:self];
  }
}

- (float)groupDiameter
{
  return self->_groupDiameter;
}

+ (double)preferredActivityRingThicknessForDiameter:(double)a3 isStandaloneRing:(BOOL)a4
{
  double v4 = 0.105769231;
  if (a4) {
    double v4 = 0.2;
  }
  return v4 * a3;
}

void __59__ARUIRingGroup_Activity__setIsPaused_animated_completion___block_invoke(uint64_t a1, double a2)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id v45 = +[ARUIMetricColors pausedRingsColors];
    uint64_t v3 = [*(id *)(a1 + 32) rings];
    double v4 = [v3 objectAtIndexedSubscript:1];
    [v4 emptyOpacity];
    int v5 = 0;
    if (v6 <= 0.0) {
      float v7 = 0.0;
    }
    else {
      float v7 = *(float *)&ARUIRingPauseRingsOpacityValue;
    }

    int v8 = [*(id *)(a1 + 32) rings];
    double v9 = [v8 objectAtIndexedSubscript:0];
    [v9 emptyOpacity];
    if (v10 > 0.0) {
      int v5 = ARUIRingPauseRingsOpacityValue;
    }

    int v11 = *(void **)(a1 + 32);
    int v12 = [v45 gradientLightColor];
    int v13 = [v45 gradientDarkColor];
    [v11 setTopColor:v12 bottomColor:v13 ofRingAtIndex:2 animated:*(unsigned __int8 *)(a1 + 41)];

    double v14 = *(void **)(a1 + 32);
    double v15 = [v45 gradientLightColor];
    id v16 = [v45 gradientDarkColor];
    [v14 setTopColor:v15 bottomColor:v16 ofRingAtIndex:1 animated:*(unsigned __int8 *)(a1 + 41)];

    float v17 = *(void **)(a1 + 32);
    v18 = [v45 gradientLightColor];
    v19 = [v45 gradientDarkColor];
    [v17 setTopColor:v18 bottomColor:v19 ofRingAtIndex:0 animated:*(unsigned __int8 *)(a1 + 41)];

    LODWORD(v20) = ARUIRingPauseRingsOpacityValue;
    [*(id *)(a1 + 32) setTrackOpacity:2 ofRingAtIndex:v20];
    *(float *)&double v21 = v7;
    [*(id *)(a1 + 32) setTrackOpacity:1 ofRingAtIndex:v21];
    LODWORD(v22) = v5;
    [*(id *)(a1 + 32) setTrackOpacity:0 ofRingAtIndex:v22];
    LODWORD(v23) = ARUIRingPauseRingsOpacityValue;
    [*(id *)(a1 + 32) setEmptyOpacity:2 ofRingAtIndex:v23];
    *(float *)&double v24 = v7;
    [*(id *)(a1 + 32) setEmptyOpacity:1 ofRingAtIndex:v24];
    LODWORD(v25) = v5;
    [*(id *)(a1 + 32) setEmptyOpacity:0 ofRingAtIndex:v25];
    [*(id *)(a1 + 32) setPercentage:2 ofRingAtIndex:*(unsigned __int8 *)(a1 + 41) animated:0.0];
    [*(id *)(a1 + 32) setPercentage:1 ofRingAtIndex:*(unsigned __int8 *)(a1 + 41) animated:0.0];
    [*(id *)(a1 + 32) setPercentage:0 ofRingAtIndex:*(unsigned __int8 *)(a1 + 41) animated:0.0];
  }
  else
  {
    LODWORD(a2) = ARUIRingOpacityValueDefault;
    [*(id *)(a1 + 32) setTrackOpacity:2 ofRingAtIndex:a2];
    int v26 = *(void **)(a1 + 32);
    v27 = [v26 rings];
    v28 = [v27 objectAtIndexedSubscript:1];
    [v28 emptyOpacity];
    if (*(float *)&v29 <= 0.0) {
      *(float *)&double v29 = 0.0;
    }
    else {
      LODWORD(v29) = ARUIRingOpacityValueDefault;
    }
    [v26 setTrackOpacity:1 ofRingAtIndex:v29];

    v30 = *(void **)(a1 + 32);
    v31 = [v30 rings];
    int v32 = [v31 objectAtIndexedSubscript:0];
    [v32 emptyOpacity];
    if (*(float *)&v33 <= 0.0) {
      *(float *)&double v33 = 0.0;
    }
    else {
      LODWORD(v33) = ARUIRingOpacityValueDefault;
    }
    [v30 setTrackOpacity:0 ofRingAtIndex:v33];

    LODWORD(v34) = ARUIRingEmptyOpacityValueDefault;
    [*(id *)(a1 + 32) setEmptyOpacity:2 ofRingAtIndex:v34];
    float v35 = *(void **)(a1 + 32);
    v36 = [v35 rings];
    v37 = [v36 objectAtIndexedSubscript:1];
    [v37 emptyOpacity];
    if (*(float *)&v38 <= 0.0) {
      *(float *)&double v38 = 0.0;
    }
    else {
      LODWORD(v38) = ARUIRingEmptyOpacityValueDefault;
    }
    [v35 setEmptyOpacity:1 ofRingAtIndex:v38];

    v39 = *(void **)(a1 + 32);
    v40 = [v39 rings];
    float v41 = [v40 objectAtIndexedSubscript:0];
    [v41 emptyOpacity];
    if (*(float *)&v42 <= 0.0) {
      *(float *)&double v42 = 0.0;
    }
    else {
      LODWORD(v42) = ARUIRingEmptyOpacityValueDefault;
    }
    [v39 setEmptyOpacity:0 ofRingAtIndex:v42];

    v43 = *(void **)(a1 + 32);
    uint64_t v44 = *(unsigned __int8 *)(a1 + 41);
    [v43 _setStandardColorsWithAnimated:v44];
  }
}

- (void)setEmptyOpacity:(float)a3 ofRingAtIndex:(unint64_t)a4
{
  float v7 = +[ARUIRingGroupAnimationState currentAnimationState];
  int v8 = [(NSArray *)self->_rings objectAtIndex:a4];
  float v10 = v8;
  if (v7)
  {
    int v11 = +[ARUIAnimationKeyCoordinator animationKeyForType:3 ringIndex:a4];
    objc_initWeak(&location, self);
    [v10 emptyOpacity];
    int v13 = v12;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __47__ARUIRingGroup_setEmptyOpacity_ofRingAtIndex___block_invoke;
    v17[3] = &unk_264498BB0;
    objc_copyWeak(v18, &location);
    v18[1] = (id)a4;
    LODWORD(v14) = v13;
    *(float *)&double v15 = a3;
    [(ARUIRingGroup *)self _setupFloatAnimationForState:v7 startValue:v11 endValue:v17 key:v14 applier:v15];
    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }
  else
  {
    *(float *)&double v9 = a3;
    [v8 setEmptyOpacity:v9];
    [(ARUIRingGroup *)self _updateRingGroupLayout];
    id v16 = [(ARUIRingGroup *)self delegate];
    [v16 ringGroupHasUpdated:self];
  }
}

- (void)setTrackOpacity:(float)a3 ofRingAtIndex:(unint64_t)a4
{
  float v7 = +[ARUIRingGroupAnimationState currentAnimationState];
  int v8 = [(NSArray *)self->_rings objectAtIndex:a4];
  float v10 = v8;
  if (v7)
  {
    int v11 = +[ARUIAnimationKeyCoordinator animationKeyForType:4 ringIndex:a4];
    objc_initWeak(&location, self);
    [v10 trackOpacity];
    int v13 = v12;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __47__ARUIRingGroup_setTrackOpacity_ofRingAtIndex___block_invoke;
    v17[3] = &unk_264498BB0;
    objc_copyWeak(v18, &location);
    v18[1] = (id)a4;
    LODWORD(v14) = v13;
    *(float *)&double v15 = a3;
    [(ARUIRingGroup *)self _setupFloatAnimationForState:v7 startValue:v11 endValue:v17 key:v14 applier:v15];
    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }
  else
  {
    *(float *)&double v9 = a3;
    [v8 setTrackOpacity:v9];
    [(ARUIRingGroup *)self _updateRingGroupLayout];
    id v16 = [(ARUIRingGroup *)self delegate];
    [v16 ringGroupHasUpdated:self];
  }
}

- (void)setTopColor:(id)a3 bottomColor:(id)a4 ofRingAtIndex:(int64_t)a5
{
}

uint64_t __30__ARUIRingGroup_setThickness___block_invoke_2(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 32);
  return [a2 setThickness:a3];
}

- (void)setIsStandalonePhoneFitnessMode:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  int v8 = (void (**)(void))a5;
  double v9 = [(ARUIRingGroup *)self rings];
  uint64_t v10 = [v9 count];

  if (v10 == 3)
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 1;
    int v11 = [(ARUIRingGroup *)self rings];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __79__ARUIRingGroup_Activity__setIsStandalonePhoneFitnessMode_animated_completion___block_invoke;
    v17[3] = &unk_264499008;
    void v17[4] = &v18;
    [v11 enumerateObjectsUsingBlock:v17];

    if (v5) {
      BOOL v5 = *((unsigned char *)v19 + 24) == 0;
    }
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __79__ARUIRingGroup_Activity__setIsStandalonePhoneFitnessMode_animated_completion___block_invoke_2;
    v15[3] = &unk_264499030;
    BOOL v16 = a3;
    v15[4] = self;
    uint64_t v12 = MEMORY[0x223C21650](v15);
    int v13 = (void *)v12;
    if (v5)
    {
      +[ARUIRingGroup animateWithDuration:v12 animations:v8 completion:3.0];
    }
    else
    {
      (*(void (**)(uint64_t))(v12 + 16))(v12);
      if (v8) {
        v8[2](v8);
      }
    }

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    double v14 = arui_rings_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[ARUIRingGroup(Activity) setIsStandalonePhoneFitnessMode:animated:completion:](self, v14);
    }
  }
}

- (void)setActiveEnergyPercentage:(float)a3 exerciseMinutesPercentage:(float)a4 standHoursPercentage:(float)a5 animated:(BOOL)a6 completion:(id)a7
{
  BOOL v9 = a6;
  double v14 = (void (**)(void))a7;
  dispatch_group_t v15 = dispatch_group_create();
  BOOL v16 = v15;
  if (v9)
  {
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __120__ARUIRingGroup_Activity__setActiveEnergyPercentage_exerciseMinutesPercentage_standHoursPercentage_animated_completion___block_invoke;
    v28[3] = &unk_264498A30;
    float v7 = &v29;
    float v17 = v15;
    double v29 = v17;
    uint64_t v18 = MEMORY[0x223C21650](v28);
    v19 = v26;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __120__ARUIRingGroup_Activity__setActiveEnergyPercentage_exerciseMinutesPercentage_standHoursPercentage_animated_completion___block_invoke_3;
    v26[3] = &unk_264498A30;
    int v8 = (id *)&v27;
    v27 = v17;
  }
  else
  {
    v19 = 0;
    uint64_t v18 = &__block_literal_global_10;
  }
  uint64_t v20 = (void *)MEMORY[0x223C21650](v19);
  ((void (*))v18[2].isa)(v18);
  *(float *)&double v21 = a3;
  [(ARUIRingGroup *)self setPercentage:2 ofRingAtIndex:v9 animated:v20 completion:v21];
  ((void (*))v18[2].isa)(v18);
  *(float *)&double v22 = a4;
  [(ARUIRingGroup *)self setPercentage:1 ofRingAtIndex:v9 animated:v20 completion:v22];
  ((void (*))v18[2].isa)(v18);
  *(float *)&double v23 = a5;
  [(ARUIRingGroup *)self setPercentage:0 ofRingAtIndex:v9 animated:v20 completion:v23];
  if (v9)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __120__ARUIRingGroup_Activity__setActiveEnergyPercentage_exerciseMinutesPercentage_standHoursPercentage_animated_completion___block_invoke_4;
    block[3] = &unk_264498A58;
    double v25 = v14;
    dispatch_group_notify(v16, MEMORY[0x263EF83A0], block);

    uint64_t v18 = *v7;
  }
  else
  {
    if (v14) {
      v14[2](v14);
    }
  }
}

- (void)setPercentage:(float)a3 ofRingAtIndex:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  uint64_t v10 = (void (**)(void))a6;
  int v11 = [(ARUIRingGroup *)self rings];
  uint64_t v12 = [v11 objectAtIndex:a4];

  LODWORD(v13) = ARUIRingPercentageValueNoRing;
  if (*(float *)&ARUIRingPercentageValueNoRing != a3)
  {
    objc_msgSend(v12, "diameter", v13);
    int v15 = v14;
    [v12 thickness];
    LODWORD(v17) = v16;
    *(float *)&double v18 = a3;
    LODWORD(v19) = v15;
    [(ARUIRingGroup *)self _ringPercentageAdjustedForProximityToFull:v18 withRingDiameter:v19 thickness:v17];
    a3 = *(float *)&v13;
  }
  if (a5)
  {
    [v12 percentage];
    -[ARUIRingGroup _adjustedDurationForRingWithIndex:startPercentage:targetPercentage:defaultDuration:](self, "_adjustedDurationForRingWithIndex:startPercentage:targetPercentage:defaultDuration:", a4);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __75__ARUIRingGroup_Activity__setPercentage_ofRingAtIndex_animated_completion___block_invoke;
    v20[3] = &unk_264498FE0;
    float v21 = a3;
    v20[4] = self;
    v20[5] = a4;
    +[ARUIRingGroup animateWithDuration:animations:completion:](ARUIRingGroup, "animateWithDuration:animations:completion:", v20, v10);
  }
  else
  {
    *(float *)&double v13 = a3;
    [(ARUIRingGroup *)self setPercentage:a4 ofRingAtIndex:v13];
    if (v10) {
      v10[2](v10);
    }
  }
}

+ (void)animateWithDuration:(double)a3 animations:(id)a4 curve:(unint64_t)a5 completion:(id)a6
{
  id v9 = a6;
  uint64_t v10 = (void (**)(void))a4;
  int v11 = objc_alloc_init(ARUIRingGroupAnimationState);
  [(ARUIRingGroupAnimationState *)v11 setDuration:a3];
  uint64_t v12 = +[ARUIRingGroup _timingFunctionForCurve:a5];
  [(ARUIRingGroupAnimationState *)v11 setTimingFunction:v12];

  [(ARUIRingGroupAnimationState *)v11 setCompletion:v9];
  double v13 = arui_rings_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    +[ARUIRingGroup animateWithDuration:animations:curve:completion:]((uint64_t)v11, v13);
  }

  +[ARUIRingGroupAnimationState pushAnimationState:v11];
  int v14 = arui_rings_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    +[ARUIRingGroup animateWithDuration:animations:curve:completion:](v14);
  }

  v10[2](v10);
  int v15 = arui_rings_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    +[ARUIRingGroup animateWithDuration:animations:curve:completion:]((uint64_t)v11, v15);
  }

  +[ARUIRingGroupAnimationState popAnimationState];
}

+ (id)_timingFunctionForCurve:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      id v9 = (void *)MEMORY[0x263F15808];
      LODWORD(v5) = 1051361018;
      double v6 = 0.0;
      double v7 = 0.0;
      goto LABEL_9;
    case 1uLL:
      int v11 = (void *)MEMORY[0x263F15808];
      uint64_t v12 = (void *)MEMORY[0x263F15EB8];
      goto LABEL_11;
    case 2uLL:
      int v11 = (void *)MEMORY[0x263F15808];
      uint64_t v12 = (void *)MEMORY[0x263F15EB0];
      goto LABEL_11;
    case 3uLL:
      id v9 = (void *)MEMORY[0x263F15808];
      LODWORD(v6) = 1056293519;
      LODWORD(v7) = 1057300152;
      double v5 = 0.0;
LABEL_9:
      LODWORD(v8) = 1.0;
      objc_msgSend(v9, "functionWithControlPoints::::", v5, v6, v7, v8, v3);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 4uLL:
      int v11 = (void *)MEMORY[0x263F15808];
      uint64_t v12 = (void *)MEMORY[0x263F15EC8];
LABEL_11:
      objc_msgSend(v11, "functionWithName:", *v12, v3);
      a1 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
      break;
    default:
      break;
  }
  return a1;
}

void __59__ARUIRingGroup_setPercentage_ofRingAtIndex_fromAnimation___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained setPercentage:*(void *)(a1 + 40) ofRingAtIndex:1 fromAnimation:v4];
}

- (void)setPercentage:(float)a3 ofRingAtIndex:(unint64_t)a4 fromAnimation:(BOOL)a5
{
  id v9 = -[NSArray objectAtIndex:](self->_rings, "objectAtIndex:");
  [v9 percentage];
  if (!ARUIFloatEqual(v10, a3))
  {
    int v11 = +[ARUIRingGroupAnimationState currentAnimationState];
    uint64_t v12 = +[ARUIAnimationKeyCoordinator animationKeyForType:0 ringIndex:a4];
    if (v11 && !ARUIFloatEqual(a3, *(float *)&ARUIRingPercentageValueNoRing))
    {
      [v9 percentage];
      if (v15 < 0.0)
      {
        [v9 setPercentage:0.0];
        int v16 = [(ARUIRingGroup *)self delegate];
        [v16 ringGroupHasUpdated:self];
      }
      objc_initWeak(&location, self);
      [v9 percentage];
      int v18 = v17;
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __59__ARUIRingGroup_setPercentage_ofRingAtIndex_fromAnimation___block_invoke;
      v21[3] = &unk_264498BB0;
      objc_copyWeak(v22, &location);
      v22[1] = (id)a4;
      LODWORD(v19) = v18;
      *(float *)&double v20 = a3;
      [(ARUIRingGroup *)self _setupFloatAnimationForState:v11 startValue:v12 endValue:v21 key:v19 applier:v20];
      objc_destroyWeak(v22);
      objc_destroyWeak(&location);
    }
    else
    {
      if (!a5) {
        [(ARUIRingGroup *)self _removeAnimationForKey:v12];
      }
      *(float *)&double v13 = a3;
      [v9 setPercentage:v13];
      int v14 = [(ARUIRingGroup *)self delegate];
      [v14 ringGroupHasUpdated:self];
    }
  }
}

- (void)setPercentage:(float)a3 ofRingAtIndex:(unint64_t)a4
{
}

uint64_t __75__ARUIRingGroup_Activity__setPercentage_ofRingAtIndex_animated_completion___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  return [*(id *)(a1 + 32) setPercentage:*(void *)(a1 + 40) ofRingAtIndex:a2];
}

void __120__ARUIRingGroup_Activity__setActiveEnergyPercentage_exerciseMinutesPercentage_standHoursPercentage_animated_completion___block_invoke(uint64_t a1)
{
}

- (float)_ringPercentageAdjustedForProximityToFull:(float)result withRingDiameter:(float)a4 thickness:(float)a5
{
  if (result > 0.00000011921 && result < 1.0 && a4 > 0.00000011921)
  {
    float v6 = (result * 6.28318531 * (a4 * 0.5) - a5 * 0.5) / (a4 * 0.5) * 0.5 / 3.14159265;
    return fmaxf(v6, 0.0);
  }
  return result;
}

- (double)_adjustedDurationForRingWithIndex:(int64_t)a3 startPercentage:(float)a4 targetPercentage:(float)a5 defaultDuration:(double)a6
{
  float v10 = [(ARUIRingGroup *)self rings];
  double v11 = a6 + (double)(unint64_t)([v10 count] + ~a3) * 0.0833333333;

  BOOL v12 = a5 <= a4 || a5 <= 1.0;
  double result = ((a5 + -1.0) * 0.600000024 + 1.0) * a6;
  if (v12) {
    return v11;
  }
  return result;
}

- (void)_setupFloatAnimationForState:(id)a3 startValue:(float)a4 endValue:(float)a5 key:(id)a6 applier:(id)a7
{
  id v26 = a3;
  id v12 = a7;
  id v13 = a6;
  [(ARUIRingGroup *)self _removeAnimationForKey:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v26;
    [v14 tension];
    double v16 = v15;
    [v14 friction];
    *(float *)&double v17 = a4;
    *(float *)&double v18 = a5;
    double v20 = +[ARUIFloatSpringAnimation animationWithTension:v12 friction:v16 startValue:v19 endValue:v17 applier:v18];

    [v14 addAnimation:v20];
  }
  else
  {
    [v26 duration];
    double v22 = v21;
    double v23 = [v26 timingFunction];
    *(float *)&double v24 = a4;
    *(float *)&double v25 = a5;
    double v20 = +[ARUIFloatAnimation animationWithDuration:v23 startValue:v12 endValue:v22 timingFunction:v24 applier:v25];

    [v26 addAnimation:v20];
  }
  [(NSMutableDictionary *)self->_animations setObject:v20 forKey:v13];

  [(ARUIRingGroup *)self _updateAnimationObserving];
}

- (void)_setupUIntAnimationForState:(id)a3 startValue:(unint64_t)a4 endValue:(unint64_t)a5 key:(id)a6 applier:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a3;
  [(ARUIRingGroup *)self _removeAnimationForKey:v13];
  [v14 duration];
  double v16 = v15;
  double v17 = [v14 timingFunction];
  id v18 = +[ARUIUIntAnimation animationWithDuration:a4 startValue:a5 endValue:v17 timingFunction:v12 applier:v16];

  [v14 addAnimation:v18];
  [(NSMutableDictionary *)self->_animations setObject:v18 forKey:v13];

  [(ARUIRingGroup *)self _updateAnimationObserving];
}

- (void)_removeAnimationForKey:(id)a3
{
  id v5 = a3;
  double v4 = -[NSMutableDictionary objectForKey:](self->_animations, "objectForKey:");
  if (v4)
  {
    [(NSMutableDictionary *)self->_animations removeObjectForKey:v5];
    [v4 completeAnimation];
  }
}

+ (void)animateWithDuration:(double)a3 animations:(id)a4 completion:(id)a5
{
}

- (void)_setStandardColorsWithAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v30[3] = *MEMORY[0x263EF8340];
  id v5 = +[ARUIMetricColors energyColors];
  v28 = +[ARUIMetricColors briskColors];
  float v6 = +[ARUIMetricColors sedentaryColors];
  double v7 = [(ARUIRingGroup *)self rings];
  double v8 = [v7 objectAtIndexedSubscript:0];
  [v8 emptyOpacity];
  if (v9 == 0.0)
  {
    float v10 = [(ARUIRingGroup *)self rings];
    double v11 = [v10 objectAtIndexedSubscript:1];
    [v11 emptyOpacity];
    BOOL v13 = v12 == 0.0;
  }
  else
  {
    BOOL v13 = 0;
  }

  id v14 = [v6 gradientDarkColor];
  v30[0] = v14;
  double v15 = [v28 gradientDarkColor];
  v30[1] = v15;
  if (v13) {
    [v5 nonGradientTextColor];
  }
  else {
  double v16 = [v5 gradientDarkColor];
  }
  v30[2] = v16;
  double v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:3];

  id v18 = [v6 gradientLightColor];
  v29[0] = v18;
  double v19 = [v28 gradientLightColor];
  v29[1] = v19;
  v27 = v5;
  if (v13) {
    [v5 nonGradientTextColor];
  }
  else {
  double v20 = [v5 gradientLightColor];
  }
  v29[2] = v20;
  double v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:3];

  double v22 = [(ARUIRingGroup *)self rings];
  if ([v22 count])
  {
    unint64_t v23 = 0;
    do
    {
      int64_t v24 = v23;
      if ([v22 count] == 1) {
        int64_t v24 = [(ARUIRingGroup *)self ringType];
      }
      double v25 = [v17 objectAtIndex:v24];
      id v26 = [v21 objectAtIndex:v24];
      [(ARUIRingGroup *)self setTopColor:v25 bottomColor:v26 ofRingAtIndex:v23 animated:v3];

      ++v23;
    }
    while (v23 < [v22 count]);
  }
}

- (ARUISpriteSheet)spriteSheet
{
  return self->_spriteSheet;
}

- (void)setTopColor:(id)a3 bottomColor:(id)a4 ofRingAtIndex:(int64_t)a5 animated:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  if (a6)
  {
    float v12 = +[ARUIRingGroupAnimationState currentAnimationState];
    BOOL v13 = [(NSArray *)self->_rings objectAtIndex:a5];
    id v14 = v13;
    if (v12)
    {
      double v22 = +[ARUIAnimationKeyCoordinator animationKeyForType:6 ringIndex:a5];
      objc_initWeak(&location, self);
      double v15 = [v14 topColor];
      double v16 = [v14 bottomColor];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __64__ARUIRingGroup_setTopColor_bottomColor_ofRingAtIndex_animated___block_invoke;
      v23[3] = &unk_264498BD8;
      objc_copyWeak(v24, &location);
      v24[1] = (id)a5;
      [(ARUIRingGroup *)self _setupColorAnimationForState:v12 startTopColor:v15 endTopColor:v10 startBottomColor:v16 endBottomColor:v11 key:v22 applier:v23];

      objc_destroyWeak(v24);
      objc_destroyWeak(&location);
    }
    else
    {
      [v13 setTopColor:v10];
      [v14 setBottomColor:v11];
      [(ARUIRingGroup *)self _updateRingGroupLayout];
      double v21 = [(ARUIRingGroup *)self delegate];
      [v21 ringGroupHasUpdated:self];
    }
  }
  else
  {
    double v17 = [(ARUIRingGroup *)self rings];
    id v18 = [v17 objectAtIndex:a5];
    [v18 setTopColor:v10];

    double v19 = [(ARUIRingGroup *)self rings];
    double v20 = [v19 objectAtIndex:a5];
    [v20 setBottomColor:v11];
  }
}

- (NSArray)rings
{
  return self->_rings;
}

void __33__ARUIRingGroup__positionSprites__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v4 = *(void **)(*(void *)(a1 + 32) + 72);
  id v5 = a2;
  id v22 = [v4 objectAtIndex:a3];
  [v22 scale];
  float v7 = v6;
  [v22 thickness];
  double v9 = (float)(v7 * v8) * 0.85;
  *(float *)&double v9 = v9;
  [v5 setSize:v9];
  [v22 translation];
  *(float *)&unsigned int v21 = v10 + v10;
  [v22 scale];
  float v12 = v11;
  [v22 diameter];
  float v14 = v13;
  [v22 scale];
  float v16 = v15;
  [v22 thickness];
  double v18 = (float)((float)(v12 * v14) - (float)(v16 * v17));
  [v22 translation];
  *(float *)&unsigned int v20 = v18 + v19 * -2.0;
  objc_msgSend(v5, "setTranslation:", COERCE_DOUBLE(__PAIR64__(v20, v21)));
  [v22 opacity];
  objc_msgSend(v5, "setOpacity:");
}

- (void)playSpriteAnimationWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_spriteSheet)
  {
    float v16 = v4;
    dispatch_group_t v6 = dispatch_group_create();
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __51__ARUIRingGroup_playSpriteAnimationWithCompletion___block_invoke;
    v23[3] = &unk_264498A30;
    float v7 = v6;
    int64_t v24 = v7;
    float v8 = (void *)MEMORY[0x223C21650](v23);
    objc_initWeak(&location, self);
    for (uint64_t i = 0; ; ++i)
    {
      float v10 = [(ARUISpriteSheet *)self->_spriteSheet sprites];
      unint64_t v11 = [v10 count];

      if ((unint64_t)i >= v11) {
        break;
      }
      float v12 = [(ARUISpriteSheet *)self->_spriteSheet sprites];
      float v13 = [v12 objectAtIndex:i];

      [v13 setCurrentFrameIndex:0];
      double v14 = (float)(unint64_t)[v13 frameCount] / 60.0;
      dispatch_group_enter(v7);
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __51__ARUIRingGroup_playSpriteAnimationWithCompletion___block_invoke_2;
      v19[3] = &unk_264498C00;
      objc_copyWeak(v21, &location);
      id v15 = v13;
      id v20 = v15;
      v21[1] = i;
      +[ARUIRingGroup animateWithDuration:v19 animations:4 curve:v8 completion:v14];

      objc_destroyWeak(v21);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__ARUIRingGroup_playSpriteAnimationWithCompletion___block_invoke_3;
    block[3] = &unk_264498A58;
    id v5 = v16;
    id v18 = v16;
    dispatch_group_notify(v7, MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&location);
  }
  else if (v4)
  {
    (*((void (**)(id))v4 + 2))(v4);
  }
}

void __51__ARUIRingGroup_playSpriteAnimationWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setFrame:ofSpriteAtIndex:", objc_msgSend(*(id *)(a1 + 32), "frameCount") - 1, *(void *)(a1 + 48));
}

uint64_t __52__ARUIRingGroup_animationSequencer_updatedWithTime___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 completeAnimation];
}

uint64_t __39__ARUIRingGroup_Activity__forCompanion__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPercentage:0.0];
}

- (void)setIsStandalonePhoneFitnessMode:(BOOL)a3 animated:(BOOL)a4
{
}

void __120__ARUIRingGroup_Activity__setActiveEnergyPercentage_exerciseMinutesPercentage_standHoursPercentage_animated_completion___block_invoke_3(uint64_t a1)
{
}

- (ARUIRingGroup)initWithRings:(id)a3 animationSequencer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ARUIRingGroup;
  double v9 = [(ARUIRingGroup *)&v14 init];
  if (v9)
  {
    float v10 = [v7 firstObject];
    [(ARUIRingGroup *)v9 _setDefaultGroupValues:v10];

    objc_storeStrong((id *)&v9->_rings, a3);
    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    animations = v9->_animations;
    v9->_animations = (NSMutableDictionary *)v11;

    objc_storeStrong((id *)&v9->_animationSequencer, a4);
    v9->_observingSequencing = 0;
    v9->_paused = 0;
  }

  return v9;
}

- (BOOL)animating
{
  return [(NSMutableDictionary *)self->_animations count] != 0;
}

- (void)_setDefaultGroupValues:(id)a3
{
  id v4 = a3;
  [v4 opacity];
  self->_opacity = v5;
  [v4 emptyOpacity];
  self->_emptyOpacity = v6;
  [v4 trackOpacity];
  self->_trackOpacity = v7;
  [v4 scale];
  self->_scale = v8;
  [v4 zRotation];
  self->_zRotation = v9;
  [v4 translation];
  uint64_t v11 = v10;

  *(void *)self->_translation = v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc(MEMORY[0x263EFF8C0]);
  float v6 = [(ARUIRingGroup *)self rings];
  float v7 = (void *)[v5 initWithArray:v6 copyItems:1];

  float v8 = [[ARUIRingGroup alloc] initWithRings:v7 animationSequencer:self->_animationSequencer];
  float v9 = [(ARUIRingGroup *)self spriteSheet];
  uint64_t v10 = (void *)[v9 copyWithZone:a3];
  [(ARUIRingGroup *)v8 setSpriteSheet:v10];

  [(ARUIRingGroup *)self groupDiameter];
  -[ARUIRingGroup setGroupDiameter:](v8, "setGroupDiameter:");
  [(ARUIRingGroup *)self interspacing];
  -[ARUIRingGroup setInterspacing:](v8, "setInterspacing:");
  [(ARUIRingGroup *)v8 setPaused:[(ARUIRingGroup *)self paused]];
  [(ARUIRingGroup *)self thickness];
  -[ARUIRingGroup setThickness:](v8, "setThickness:");
  [(ARUIRingGroup *)self opacity];
  -[ARUIRingGroup setOpacity:](v8, "setOpacity:");
  [(ARUIRingGroup *)self emptyOpacity];
  -[ARUIRingGroup setEmptyOpacity:](v8, "setEmptyOpacity:");
  [(ARUIRingGroup *)self trackOpacity];
  -[ARUIRingGroup setTrackOpacity:](v8, "setTrackOpacity:");
  [(ARUIRingGroup *)self scale];
  -[ARUIRingGroup setScale:](v8, "setScale:");
  [(ARUIRingGroup *)self zRotation];
  -[ARUIRingGroup setZRotation:](v8, "setZRotation:");
  [(ARUIRingGroup *)self translation];
  -[ARUIRingGroup setTranslation:](v8, "setTranslation:");
  [(ARUIRingGroup *)v8 setRingType:[(ARUIRingGroup *)self ringType]];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __30__ARUIRingGroup_copyWithZone___block_invoke;
  v12[3] = &unk_264498AF8;
  v12[4] = self;
  [v7 enumerateObjectsUsingBlock:v12];

  return v8;
}

- (void)setSpriteSheet:(id)a3
{
  id v5 = (ARUISpriteSheet *)a3;
  p_spriteSheet = &self->_spriteSheet;
  if (self->_spriteSheet != v5)
  {
    float v8 = v5;
    objc_storeStrong((id *)p_spriteSheet, a3);
    [(ARUIRingGroup *)self _positionSprites];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained ringGroupHasUpdated:self];

    id v5 = v8;
  }

  MEMORY[0x270F9A758](p_spriteSheet, v5);
}

- (BOOL)paused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
  [(ARUIRingGroup *)self _updateAnimationObserving];
}

- (ARUIRingGroup)forCompanion
{
  uint64_t v2 = (void *)[(ARUIRingGroup *)self copy];
  LODWORD(v3) = 1132134400;
  [v2 setGroupDiameter:v3];
  LODWORD(v4) = 2.0;
  [v2 setInterspacing:v4];
  LODWORD(v5) = 27.0;
  [v2 setThickness:v5];
  float v6 = [v2 rings];
  [v6 enumerateObjectsUsingBlock:&__block_literal_global_4];

  return (ARUIRingGroup *)v2;
}

- (void)setThickness:(float)a3
{
  if (!ARUIFloatEqual(a3, self->_thickness))
  {
    double v5 = +[ARUIRingGroupAnimationState currentAnimationState];
    if (v5)
    {
      objc_initWeak(&location, self);
      float thickness = self->_thickness;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __30__ARUIRingGroup_setThickness___block_invoke;
      v13[3] = &unk_264498B20;
      objc_copyWeak(&v14, &location);
      *(float *)&double v7 = thickness;
      *(float *)&double v8 = a3;
      [(ARUIRingGroup *)self _setupFloatAnimationForState:v5 startValue:@"thickness" endValue:v13 key:v7 applier:v8];
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    else
    {
      self->_float thickness = a3;
      rings = self->_rings;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __30__ARUIRingGroup_setThickness___block_invoke_2;
      v11[3] = &__block_descriptor_36_e25_v32__0__ARUIRing_8Q16_B24l;
      float v12 = a3;
      [(NSArray *)rings enumerateObjectsUsingBlock:v11];
      [(ARUIRingGroup *)self _updateRingGroupLayout];
      uint64_t v10 = [(ARUIRingGroup *)self delegate];
      [v10 ringGroupHasUpdated:self];
    }
  }
}

- (void)setInterspacing:(float)a3
{
  if (!ARUIFloatEqual(a3, self->_interspacing))
  {
    double v5 = +[ARUIRingGroupAnimationState currentAnimationState];
    if (v5)
    {
      objc_initWeak(&location, self);
      float interspacing = self->_interspacing;
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __33__ARUIRingGroup_setInterspacing___block_invoke;
      v10[3] = &unk_264498B20;
      objc_copyWeak(&v11, &location);
      *(float *)&double v7 = interspacing;
      *(float *)&double v8 = a3;
      [(ARUIRingGroup *)self _setupFloatAnimationForState:v5 startValue:@"interspacing" endValue:v10 key:v7 applier:v8];
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
    else
    {
      self->_float interspacing = a3;
      [(ARUIRingGroup *)self _updateRingGroupLayout];
      float v9 = [(ARUIRingGroup *)self delegate];
      [v9 ringGroupHasUpdated:self];
    }
  }
}

- (void)setGroupDiameter:(float)a3
{
  if (!ARUIFloatEqual(a3, self->_groupDiameter))
  {
    double v5 = +[ARUIRingGroupAnimationState currentAnimationState];
    if (v5)
    {
      objc_initWeak(&location, self);
      float groupDiameter = self->_groupDiameter;
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __34__ARUIRingGroup_setGroupDiameter___block_invoke;
      v10[3] = &unk_264498B20;
      objc_copyWeak(&v11, &location);
      *(float *)&double v7 = groupDiameter;
      *(float *)&double v8 = a3;
      [(ARUIRingGroup *)self _setupFloatAnimationForState:v5 startValue:@"groupDiameter" endValue:v10 key:v7 applier:v8];
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
    else
    {
      self->_float groupDiameter = a3;
      [(ARUIRingGroup *)self _updateRingGroupLayout];
      float v9 = [(ARUIRingGroup *)self delegate];
      [v9 ringGroupHasUpdated:self];
    }
  }
}

- (float)zRotation
{
  return self->_zRotation;
}

- (double)translation
{
  return *(double *)(a1 + 96);
}

- (float)trackOpacity
{
  return self->_trackOpacity;
}

- (float)thickness
{
  return self->_thickness;
}

- (void)setZRotation:(float)a3
{
  if (!ARUIFloatEqual(a3, self->_zRotation))
  {
    double v5 = +[ARUIRingGroupAnimationState currentAnimationState];
    if (v5)
    {
      objc_initWeak(&location, self);
      float zRotation = self->_zRotation;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __30__ARUIRingGroup_setZRotation___block_invoke;
      v13[3] = &unk_264498B20;
      objc_copyWeak(&v14, &location);
      *(float *)&double v7 = zRotation;
      *(float *)&double v8 = a3;
      [(ARUIRingGroup *)self _setupFloatAnimationForState:v5 startValue:@"zRotation" endValue:v13 key:v7 applier:v8];
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    else
    {
      self->_float zRotation = a3;
      rings = self->_rings;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __30__ARUIRingGroup_setZRotation___block_invoke_2;
      v11[3] = &__block_descriptor_36_e25_v32__0__ARUIRing_8Q16_B24l;
      float v12 = a3;
      [(NSArray *)rings enumerateObjectsUsingBlock:v11];
      uint64_t v10 = [(ARUIRingGroup *)self delegate];
      [v10 ringGroupHasUpdated:self];
    }
  }
}

- (void)setTranslation:(ARUIRingGroup *)self
{
  double v3 = *(double *)&v2;
  if (!ARUIFloat2Equal(v2, *(float32x2_t *)self->_translation))
  {
    double v5 = +[ARUIRingGroupAnimationState currentAnimationState];
    if (v5)
    {
      objc_initWeak(&location, self);
      double v6 = *(double *)self->_translation;
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __32__ARUIRingGroup_setTranslation___block_invoke;
      v10[3] = &unk_264498B68;
      objc_copyWeak(&v11, &location);
      [(ARUIRingGroup *)self _setupFloat2AnimationForState:v5 startValue:@"translation" endValue:v10 key:v6 applier:v3];
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
    else
    {
      *(double *)self->_translation = v3;
      rings = self->_rings;
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __32__ARUIRingGroup_setTranslation___block_invoke_2;
      v9[3] = &__block_descriptor_40_e25_v32__0__ARUIRing_8Q16_B24l;
      *(double *)&v9[4] = v3;
      [(NSArray *)rings enumerateObjectsUsingBlock:v9];
      [(ARUIRingGroup *)self _positionSprites];
      double v8 = [(ARUIRingGroup *)self delegate];
      [v8 ringGroupHasUpdated:self];
    }
  }
}

- (void)setTrackOpacity:(float)a3
{
  if (!ARUIFloatEqual(a3, self->_trackOpacity))
  {
    double v5 = +[ARUIRingGroupAnimationState currentAnimationState];
    if (v5)
    {
      objc_initWeak(&location, self);
      float trackOpacity = self->_trackOpacity;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __33__ARUIRingGroup_setTrackOpacity___block_invoke;
      v13[3] = &unk_264498B20;
      objc_copyWeak(&v14, &location);
      *(float *)&double v7 = trackOpacity;
      *(float *)&double v8 = a3;
      [(ARUIRingGroup *)self _setupFloatAnimationForState:v5 startValue:@"trackOpacity" endValue:v13 key:v7 applier:v8];
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    else
    {
      self->_float trackOpacity = a3;
      rings = self->_rings;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __33__ARUIRingGroup_setTrackOpacity___block_invoke_2;
      v11[3] = &__block_descriptor_36_e25_v32__0__ARUIRing_8Q16_B24l;
      float v12 = a3;
      [(NSArray *)rings enumerateObjectsUsingBlock:v11];
      uint64_t v10 = [(ARUIRingGroup *)self delegate];
      [v10 ringGroupHasUpdated:self];
    }
  }
}

- (void)setScale:(float)a3
{
  if (!ARUIFloatEqual(a3, self->_scale))
  {
    double v5 = +[ARUIRingGroupAnimationState currentAnimationState];
    if (v5)
    {
      objc_initWeak(&location, self);
      float scale = self->_scale;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __26__ARUIRingGroup_setScale___block_invoke;
      v13[3] = &unk_264498B20;
      objc_copyWeak(&v14, &location);
      *(float *)&double v7 = scale;
      *(float *)&double v8 = a3;
      [(ARUIRingGroup *)self _setupFloatAnimationForState:v5 startValue:@"scale" endValue:v13 key:v7 applier:v8];
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    else
    {
      self->_float scale = a3;
      rings = self->_rings;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __26__ARUIRingGroup_setScale___block_invoke_2;
      v11[3] = &__block_descriptor_36_e25_v32__0__ARUIRing_8Q16_B24l;
      float v12 = a3;
      [(NSArray *)rings enumerateObjectsUsingBlock:v11];
      [(ARUIRingGroup *)self _positionSprites];
      uint64_t v10 = [(ARUIRingGroup *)self delegate];
      [v10 ringGroupHasUpdated:self];
    }
  }
}

- (void)setOpacity:(float)a3
{
  if (!ARUIFloatEqual(a3, self->_opacity))
  {
    double v5 = +[ARUIRingGroupAnimationState currentAnimationState];
    if (v5)
    {
      objc_initWeak(&location, self);
      float opacity = self->_opacity;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __28__ARUIRingGroup_setOpacity___block_invoke;
      v13[3] = &unk_264498B20;
      objc_copyWeak(&v14, &location);
      *(float *)&double v7 = opacity;
      *(float *)&double v8 = a3;
      [(ARUIRingGroup *)self _setupFloatAnimationForState:v5 startValue:@"opacity" endValue:v13 key:v7 applier:v8];
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    else
    {
      self->_float opacity = a3;
      rings = self->_rings;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __28__ARUIRingGroup_setOpacity___block_invoke_2;
      v11[3] = &__block_descriptor_36_e25_v32__0__ARUIRing_8Q16_B24l;
      float v12 = a3;
      [(NSArray *)rings enumerateObjectsUsingBlock:v11];
      uint64_t v10 = [(ARUIRingGroup *)self delegate];
      [v10 ringGroupHasUpdated:self];
    }
  }
}

- (void)setEmptyOpacity:(float)a3
{
  if (!ARUIFloatEqual(a3, self->_emptyOpacity))
  {
    double v5 = +[ARUIRingGroupAnimationState currentAnimationState];
    if (v5)
    {
      objc_initWeak(&location, self);
      float emptyOpacity = self->_emptyOpacity;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __33__ARUIRingGroup_setEmptyOpacity___block_invoke;
      v13[3] = &unk_264498B20;
      objc_copyWeak(&v14, &location);
      *(float *)&double v7 = emptyOpacity;
      *(float *)&double v8 = a3;
      [(ARUIRingGroup *)self _setupFloatAnimationForState:v5 startValue:@"emptyOpacity" endValue:v13 key:v7 applier:v8];
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    else
    {
      self->_float emptyOpacity = a3;
      rings = self->_rings;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __33__ARUIRingGroup_setEmptyOpacity___block_invoke_2;
      v11[3] = &__block_descriptor_36_e25_v32__0__ARUIRing_8Q16_B24l;
      float v12 = a3;
      [(NSArray *)rings enumerateObjectsUsingBlock:v11];
      uint64_t v10 = [(ARUIRingGroup *)self delegate];
      [v10 ringGroupHasUpdated:self];
    }
  }
}

- (void)setDelegate:(id)a3
{
}

- (float)scale
{
  return self->_scale;
}

- (int64_t)ringType
{
  return self->_ringType;
}

- (float)opacity
{
  return self->_opacity;
}

- (float)interspacing
{
  return self->_interspacing;
}

- (float)emptyOpacity
{
  return self->_emptyOpacity;
}

+ (id)activityRingGroupForRingType:(int64_t)a3
{
  double v4 = objc_msgSend(objc_alloc((Class)a1), "initWithNumberOfRings:", +[ARUIRingGroup _numberOfRingsForRingType:](ARUIRingGroup, "_numberOfRingsForRingType:"));
  [v4 setRingType:a3];
  [v4 _setStandardColorsWithAnimated:0];

  return v4;
}

- (void)setIsPaused:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  double v8 = (void (**)(void))a5;
  if (_os_feature_enabled_impl())
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __59__ARUIRingGroup_Activity__setIsPaused_animated_completion___block_invoke;
    v11[3] = &unk_264499058;
    BOOL v12 = a3;
    void v11[4] = self;
    BOOL v13 = v5;
    uint64_t v9 = MEMORY[0x223C21650](v11);
    uint64_t v10 = (void *)v9;
    if (v5)
    {
      +[ARUIRingGroup animateWithDuration:v9 animations:v8 completion:1.0];
    }
    else
    {
      (*(void (**)(uint64_t))(v9 + 16))(v9);
      if (v8) {
        v8[2](v8);
      }
    }
  }
  else if (v8)
  {
    v8[2](v8);
  }
}

- (void)setRingType:(int64_t)a3
{
  self->_ringType = a3;
}

- (ARUIRingGroup)initWithNumberOfRings:(int64_t)a3
{
  BOOL v5 = +[ARUIRingGroupGlobalAnimationSequencer sharedInstance];
  double v6 = [(ARUIRingGroup *)self initWithNumberOfRings:a3 animationSequencer:v5];

  return v6;
}

- (ARUIRingGroup)initWithNumberOfRings:(int64_t)a3 animationSequencer:(id)a4
{
  id v6 = a4;
  for (uint64_t i = [MEMORY[0x263EFF980] arrayWithCapacity:a3];
  {
    double v8 = objc_alloc_init(ARUIRing);
    [i addObject:v8];
  }
  uint64_t v9 = [(ARUIRingGroup *)self initWithRings:i animationSequencer:v6];

  return v9;
}

+ (unint64_t)_numberOfRingsForRingType:(int64_t)a3
{
  if (a3 == 3) {
    return 3;
  }
  else {
    return 1;
  }
}

- (void)setIsPaused:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)setIsPaused:(BOOL)a3
{
}

- (void)playSpriteAnimation
{
}

- (void)setIsPaused:(BOOL)a3 completion:(id)a4
{
}

+ (double)preferredActivityRingThicknessForDiameter:(double)a3
{
  +[ARUIRingGroup preferredActivityRingThicknessForDiameter:0 isStandaloneRing:a3];
  return result;
}

uint64_t __120__ARUIRingGroup_Activity__setActiveEnergyPercentage_exerciseMinutesPercentage_standHoursPercentage_animated_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)dealloc
{
  [(ARUIRingGroup *)self removeAllAnimations];
  v3.receiver = self;
  v3.super_class = (Class)ARUIRingGroup;
  [(ARUIRingGroup *)&v3 dealloc];
}

- (void)removeAllAnimations
{
  [(NSMutableDictionary *)self->_animations enumerateKeysAndObjectsUsingBlock:&__block_literal_global_0];
  animations = self->_animations;

  [(NSMutableDictionary *)animations removeAllObjects];
}

+ (double)preferredActivityRingInterspacingForDiameter:(double)a3
{
  double v3 = (a3 + -29.0) / 114.0;
  if (v3 < 0.0) {
    double v3 = 0.0;
  }
  if (v3 > 1.0) {
    double v3 = 1.0;
  }
  return (v3 * -0.0288461538 + 0.0432692308) * a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spriteSheet, 0);
  objc_storeStrong((id *)&self->_rings, 0);
  objc_storeStrong((id *)&self->_animationSequencer, 0);

  objc_storeStrong((id *)&self->_animations, 0);
}

void __34__ARUIRingGroup_setGroupDiameter___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v3 = a2;
  [WeakRetained setGroupDiameter:v3];
}

void __33__ARUIRingGroup_setInterspacing___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v3 = a2;
  [WeakRetained setInterspacing:v3];
}

void __30__ARUIRingGroup_setThickness___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v3 = a2;
  [WeakRetained setThickness:v3];
}

void __28__ARUIRingGroup_setOpacity___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v3 = a2;
  [WeakRetained setOpacity:v3];
}

uint64_t __28__ARUIRingGroup_setOpacity___block_invoke_2(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 32);
  return [a2 setOpacity:a3];
}

void __33__ARUIRingGroup_setEmptyOpacity___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v3 = a2;
  [WeakRetained setEmptyOpacity:v3];
}

uint64_t __33__ARUIRingGroup_setEmptyOpacity___block_invoke_2(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 32);
  return [a2 setEmptyOpacity:a3];
}

void __33__ARUIRingGroup_setTrackOpacity___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v3 = a2;
  [WeakRetained setTrackOpacity:v3];
}

uint64_t __33__ARUIRingGroup_setTrackOpacity___block_invoke_2(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 32);
  return [a2 setTrackOpacity:a3];
}

void __26__ARUIRingGroup_setScale___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v3 = a2;
  [WeakRetained setScale:v3];
}

uint64_t __26__ARUIRingGroup_setScale___block_invoke_2(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 32);
  return [a2 setScale:a3];
}

void __30__ARUIRingGroup_setZRotation___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v3 = a2;
  [WeakRetained setZRotation:v3];
}

uint64_t __30__ARUIRingGroup_setZRotation___block_invoke_2(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 32);
  return [a2 setZRotation:a3];
}

void __32__ARUIRingGroup_setTranslation___block_invoke(uint64_t a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setTranslation:a2];
}

uint64_t __32__ARUIRingGroup_setTranslation___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setTranslation:*(double *)(a1 + 32)];
}

void __64__ARUIRingGroup_setTopColor_bottomColor_ofRingAtIndex_animated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  BOOL v5 = (id *)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained setTopColor:v7 bottomColor:v6 ofRingAtIndex:*(void *)(a1 + 40)];
}

void __44__ARUIRingGroup_setThickness_ofRingAtIndex___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained setThickness:*(void *)(a1 + 40) ofRingAtIndex:v4];
}

void __42__ARUIRingGroup_setOpacity_ofRingAtIndex___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained setOpacity:*(void *)(a1 + 40) ofRingAtIndex:v4];
}

void __47__ARUIRingGroup_setEmptyOpacity_ofRingAtIndex___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained setEmptyOpacity:*(void *)(a1 + 40) ofRingAtIndex:v4];
}

void __47__ARUIRingGroup_setTrackOpacity_ofRingAtIndex___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained setTrackOpacity:*(void *)(a1 + 40) ofRingAtIndex:v4];
}

void __51__ARUIRingGroup_playSpriteAnimationWithCompletion___block_invoke(uint64_t a1)
{
}

uint64_t __51__ARUIRingGroup_playSpriteAnimationWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)playCelebration:(id)a3 onRingAtIndex:(unint64_t)a4
{
}

- (void)playCelebration:(id)a3 onRingAtIndex:(unint64_t)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = arui_rings_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a4;
    _os_log_impl(&dword_21E162000, v10, OS_LOG_TYPE_DEFAULT, "Playing celebration %@ on ring at index %lu", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  float v19 = __Block_byref_object_copy_;
  id v20 = __Block_byref_object_dispose_;
  id v21 = [(NSArray *)self->_rings objectAtIndex:a4];
  [*(id *)(*(void *)&buf[8] + 40) setCelebration:v8];
  [v8 duration];
  double v12 = v11;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  id v14[2] = __58__ARUIRingGroup_playCelebration_onRingAtIndex_completion___block_invoke;
  v14[3] = &unk_264498C50;
  v14[4] = self;
  unint64_t v17 = a4;
  id v13 = v8;
  id v15 = v13;
  float v16 = buf;
  +[ARUIRingGroup animateWithDuration:v14 animations:v9 completion:v12];

  _Block_object_dispose(buf, 8);
}

void __58__ARUIRingGroup_playCelebration_onRingAtIndex_completion___block_invoke(uint64_t a1)
{
  float32x2_t v2 = +[ARUIRingGroupAnimationState currentAnimationState];
  objc_initWeak(&location, *(id *)(a1 + 32));
  double v3 = +[ARUIAnimationKeyCoordinator animationKeyForType:5 ringIndex:*(void *)(a1 + 56)];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__ARUIRingGroup_playCelebration_onRingAtIndex_completion___block_invoke_2;
  v6[3] = &unk_264498C28;
  double v4 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  objc_copyWeak(&v9, &location);
  uint64_t v8 = *(void *)(a1 + 48);
  LODWORD(v5) = 1.0;
  [v4 _setupFloatAnimationForState:v2 startValue:v3 endValue:v6 key:0.0 applier:v5];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

uint64_t __58__ARUIRingGroup_playCelebration_onRingAtIndex_completion___block_invoke_2(uint64_t a1, float a2, double a3)
{
  [*(id *)(a1 + 32) updateDeltaTime:a3];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = [WeakRetained delegate];
  id v7 = objc_loadWeakRetained((id *)(a1 + 48));
  [v6 ringGroupHasUpdated:v7];

  uint64_t result = ARUIFloatEqual(a2, 1.0);
  if (result)
  {
    id v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    return [v9 setCelebration:0];
  }
  return result;
}

+ (void)animateWithDuration:(double)a3 animations:(id)a4
{
}

+ (void)animateUsingSpringWithTension:(double)a3 friction:(double)a4 animations:(id)a5
{
}

+ (void)animateUsingSpringWithTension:(double)a3 friction:(double)a4 animations:(id)a5 completion:(id)a6
{
  id v9 = a6;
  uint64_t v10 = (void (**)(void))a5;
  double v11 = objc_alloc_init(ARUIRingGroupSpringAnimationState);
  [(ARUIRingGroupSpringAnimationState *)v11 setTension:a3];
  [(ARUIRingGroupSpringAnimationState *)v11 setFriction:a4];
  [(ARUIRingGroupAnimationState *)v11 setCompletion:v9];

  +[ARUIRingGroupAnimationState pushAnimationState:v11];
  v10[2](v10);

  +[ARUIRingGroupAnimationState popAnimationState];
}

- (void)_setupColorAnimationForState:(id)a3 startTopColor:(id)a4 endTopColor:(id)a5 startBottomColor:(id)a6 endBottomColor:(id)a7 key:(id)a8 applier:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  [(ARUIRingGroup *)self _removeAnimationForKey:v17];
  [v22 duration];
  double v24 = v23;
  double v25 = [v22 timingFunction];
  id v26 = +[ARUIColorAnimation animationWithDuration:v21 startTopColor:v20 endTopColor:v19 startBottomColor:v18 endBottomColor:v25 timingFunction:v16 applier:v24];

  [v22 addAnimation:v26];
  [(NSMutableDictionary *)self->_animations setObject:v26 forKey:v17];

  [(ARUIRingGroup *)self _updateAnimationObserving];
}

- (void)_setupFloat2AnimationForState:(ARUIRingGroup *)self startValue:(SEL)a2 endValue:(id)a3 key:(id)a4 applier:(id)a5
{
  double v8 = v6;
  double v9 = v5;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  [(ARUIRingGroup *)self _removeAnimationForKey:v13];
  [v14 duration];
  double v16 = v15;
  id v17 = [v14 timingFunction];
  id v18 = +[ARUIFloat2Animation animationWithDuration:v17 startValue:v12 endValue:v16 timingFunction:v9 applier:v8];

  [v14 addAnimation:v18];
  [(NSMutableDictionary *)self->_animations setObject:v18 forKey:v13];

  [(ARUIRingGroup *)self _updateAnimationObserving];
}

uint64_t __36__ARUIRingGroup_removeAllAnimations__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 completeAnimation];
}

- (NSString)description
{
  double v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  [v3 appendArraySection:self->_rings withName:@"rings" skipIfEmpty:1];
  double v4 = [v3 build];

  return (NSString *)v4;
}

+ (id)countdownRingGroup
{
  return +[ARUIRingGroup countdownRingGroupOnCompanion];
}

+ (id)countdownRingGroupOnCompanion
{
  float32x2_t v2 = +[ARUIMetricColors keyColors];
  double v3 = [[ARUIRingGroup alloc] initWithNumberOfRings:1];
  LODWORD(v4) = 1132396544;
  [(ARUIRingGroup *)v3 setGroupDiameter:v4];
  LODWORD(v5) = 1099694080;
  [(ARUIRingGroup *)v3 setThickness:v5];
  [(ARUIRingGroup *)v3 setPercentage:0 ofRingAtIndex:0.0];
  double v6 = [v2 gradientLightColor];
  id v7 = [v2 gradientDarkColor];
  [(ARUIRingGroup *)v3 setTopColor:v6 bottomColor:v7 ofRingAtIndex:0];

  return v3;
}

+ (id)activityRingGroup
{
  return (id)[a1 activityRingGroupForRingType:3];
}

- (ARUIRingGroup)forWatch
{
  float32x2_t v2 = (void *)[(ARUIRingGroup *)self copy];
  [v2 setTranslation:-131072.0];
  LODWORD(v3) = 1124466688;
  [v2 setGroupDiameter:v3];
  LODWORD(v4) = 1.0;
  [v2 setInterspacing:v4];
  LODWORD(v5) = 15.0;
  [v2 setThickness:v5];

  return (ARUIRingGroup *)v2;
}

- (ARUIRingGroup)withSpriteSheet
{
  float32x2_t v2 = (void *)[(ARUIRingGroup *)self copy];
  double v3 = +[ARUISpriteSheetFactory spriteSheetForRingType:](ARUISpriteSheetFactory, "spriteSheetForRingType:", [v2 ringType]);
  [v2 setSpriteSheet:v3];

  return (ARUIRingGroup *)v2;
}

- (ARUIRingGroup)withWheelchairSpriteSheet
{
  float32x2_t v2 = (void *)[(ARUIRingGroup *)self copy];
  double v3 = +[ARUISpriteSheetFactory wheelchairSpriteSheetForRingType:](ARUISpriteSheetFactory, "wheelchairSpriteSheetForRingType:", [v2 ringType]);
  [v2 setSpriteSheet:v3];

  return (ARUIRingGroup *)v2;
}

- (id)playingSpriteAnimation
{
  return self;
}

- (void)setPercentage:(float)a3 ofRingAtIndex:(int64_t)a4 animated:(BOOL)a5
{
}

- (void)setActiveEnergyPercentage:(float)a3 animated:(BOOL)a4
{
}

- (void)setActiveEnergyPercentage:(float)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v11 = [(ARUIRingGroup *)self rings];
  unint64_t v9 = [v11 count];
  *(float *)&double v10 = a3;
  [(ARUIRingGroup *)self setPercentage:2 * (v9 > 1) ofRingAtIndex:v5 animated:v8 completion:v10];
}

- (void)setExerciseMinutesPercentage:(float)a3 animated:(BOOL)a4
{
}

- (void)setExerciseMinutesPercentage:(float)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v11 = [(ARUIRingGroup *)self rings];
  BOOL v9 = (unint64_t)[v11 count] > 1;
  *(float *)&double v10 = a3;
  [(ARUIRingGroup *)self setPercentage:v9 ofRingAtIndex:v5 animated:v8 completion:v10];
}

- (void)setStandHoursPercentage:(float)a3 animated:(BOOL)a4
{
}

- (void)setStandHoursPercentage:(float)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v10 = [(ARUIRingGroup *)self rings];
  [v10 count];
  *(float *)&double v9 = a3;
  [(ARUIRingGroup *)self setPercentage:0 ofRingAtIndex:v5 animated:v8 completion:v9];
}

- (void)setActiveEnergyPercentage:(float)a3 exerciseMinutesPercentage:(float)a4 standHoursPercentage:(float)a5 animated:(BOOL)a6
{
}

- (void)setIsStandalonePhoneFitnessMode:(BOOL)a3
{
}

- (void)setIsStandalonePhoneFitnessMode:(BOOL)a3 completion:(id)a4
{
}

+ (void)animateWithDuration:(uint64_t)a1 animations:(NSObject *)a2 curve:completion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21E162000, a2, OS_LOG_TYPE_DEBUG, "ARUIRingGroup animationWithDuration popping animation state: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)animateWithDuration:(os_log_t)log animations:curve:completion:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21E162000, log, OS_LOG_TYPE_DEBUG, "ARUIRingGroup calling animations() block", v1, 2u);
}

+ (void)animateWithDuration:(uint64_t)a1 animations:(NSObject *)a2 curve:completion:.cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21E162000, a2, OS_LOG_TYPE_DEBUG, "ARUIRingGroup animationWithDuration pushing animation state: %@", (uint8_t *)&v2, 0xCu);
}

@end