@interface CSTeachableMomentsContainerViewController
+ (id)_animationKeyForKeyPath:(id)a3 iteration:(unint64_t)a4 reset:(BOOL)a5;
+ (void)_addRepeatedAnimationWithProvider:(id)a3 toLayer:(id)a4;
- (BOOL)_animatesTextPositionWhenResetting;
- (BOOL)_shouldTeachAboutControlCenter;
- (BOOL)_suppressingHomeAffordanceAnimation;
- (BOOL)authenticated;
- (BOOL)controlCenterCoachingIsHidden;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)handleEvent:(id)a3;
- (BOOL)isScreenOn;
- (BOOL)updateTextLabelOnNextAnimation;
- (CSCoverSheetContextProviding)coverSheetContext;
- (CSHomeAffordanceViewController)homeAffordanceViewController;
- (CSTeachableMomentsContainerViewController)initWithCoverSheetContext:(id)a3;
- (NSCountedSet)homeAffordanceAnimationSuppressionReasons;
- (NSMutableDictionary)cachedLegibilityLabels;
- (NSTimer)fireOffAnimationTimer;
- (SBDashBoardHomeAffordanceAnimationViewProviding)viewProvider;
- (SBUIBiometricResource)biometricResource;
- (UITapGestureRecognizer)homeAffordanceClickGestureRecognizer;
- (id)_controlCenterGlyphAlphaAnimationWithDuration:(double)a3 beginTime:(double)a4;
- (id)_controlCenterGrabberAlphaAnimationWithDuration:(double)a3 beginTime:(double)a4;
- (id)_controlCenterGrabberPositionAnimationWithDuration:(double)a3 beginTime:(double)a4;
- (id)_homeAffordancePositionAnimationWithDuration:(double)a3 beginTime:(double)a4;
- (id)_textAlphaAnimationWithDuration:(double)a3 beginTime:(double)a4;
- (id)_textPositionAnimationWithDuration:(double)a3 beginTime:(double)a4;
- (unint64_t)animationState;
- (unint64_t)currentState;
- (unint64_t)effectiveAnimationState;
- (void)_addControlCenterGlyphAnimation;
- (void)_addControlCenterGlyphResetAnimation;
- (void)_addControlCenterGrabberAnimation;
- (void)_addControlCenterGrabberResetAnimation;
- (void)_addHomeAffordanceAnimation;
- (void)_addHomeAffordanceResetAnimation;
- (void)_addResetAnimationForKeyPath:(id)a3 onLayer:(id)a4;
- (void)_addTextAnimation;
- (void)_addTextResetAnimation;
- (void)_beginSuppressingHomeAffordanceAnimationForHomeAffordanceDoubleTap;
- (void)_beginSuppressingHomeAffordanceAnimationForScreenOff;
- (void)_cancelTimerAndResetAnimation;
- (void)_contentSizeCategoryChanged;
- (void)_endSuppressingHomeAffordanceAnimationForHomeAffordanceDoubleTap;
- (void)_endSuppressingHomeAffordanceAnimationForScreenOff;
- (void)_homeAffordanceClickRecognized:(id)a3;
- (void)_moveUpTimerForFiringAfterDelay:(double)a3;
- (void)_pauseNormalAnimationsForKeyPath:(id)a3 onLayer:(id)a4;
- (void)_removeNormalAnimationsForKeyPath:(id)a3 onLayer:(id)a4;
- (void)_removeResetAnimationForKeyPath:(id)a3 onLayer:(id)a4;
- (void)_setControlCenterTutorsHidden:(BOOL)a3;
- (void)_setupTimer;
- (void)_setupTimerWithDelay:(double)a3;
- (void)_updateEffectiveAnimationState;
- (void)_updateLegibilitySettings;
- (void)_updateText:(id)a3;
- (void)_updateTextLabel;
- (void)_updateTextLabelIfNeeded;
- (void)aggregateAppearance:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)dealloc;
- (void)loadView;
- (void)setAnimationState:(unint64_t)a3;
- (void)setAuthenticated:(BOOL)a3;
- (void)setBiometricResource:(id)a3;
- (void)setCachedLegibilityLabels:(id)a3;
- (void)setControlCenterCoachingIsHidden:(BOOL)a3;
- (void)setEffectiveAnimationState:(unint64_t)a3;
- (void)setFireOffAnimationTimer:(id)a3;
- (void)setHomeAffordanceAnimationSuppressionReasons:(id)a3;
- (void)setHomeAffordanceClickGestureRecognizer:(id)a3;
- (void)setScreenOn:(BOOL)a3;
- (void)setUpdateTextLabelOnNextAnimation:(BOOL)a3;
- (void)setViewProvider:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CSTeachableMomentsContainerViewController

- (void)setFireOffAnimationTimer:(id)a3
{
  p_fireOffAnimationTimer = &self->_fireOffAnimationTimer;
  if (self->_fireOffAnimationTimer != a3)
  {
    [(NSTimer *)*p_fireOffAnimationTimer invalidate];
    objc_storeStrong((id *)p_fireOffAnimationTimer, a3);
  }

  MEMORY[0x1F41817F8]();
}

uint64_t __66__CSTeachableMomentsContainerViewController__setupTimerWithDelay___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateTextLabelIfNeeded];
  [*(id *)(a1 + 32) _addHomeAffordanceAnimation];
  [*(id *)(a1 + 32) _addTextAnimation];
  if ([*(id *)(a1 + 32) _shouldTeachAboutControlCenter])
  {
    v2 = [*(id *)(a1 + 32) teachableMomentsContainerView];
    v3 = [v2 controlCenterGrabberContainerView];

    if (v3)
    {
      [*(id *)(a1 + 32) _addControlCenterGrabberAnimation];
      [*(id *)(a1 + 32) _addControlCenterGlyphAnimation];
    }
  }
  v4 = *(void **)(a1 + 32);

  return [v4 setFireOffAnimationTimer:0];
}

- (void)_updateTextLabelIfNeeded
{
  if ([(CSTeachableMomentsContainerViewController *)self updateTextLabelOnNextAnimation])
  {
    [(CSTeachableMomentsContainerViewController *)self setUpdateTextLabelOnNextAnimation:0];
    [(CSTeachableMomentsContainerViewController *)self _updateTextLabel];
  }
}

- (BOOL)updateTextLabelOnNextAnimation
{
  return self->_updateTextLabelOnNextAnimation;
}

- (BOOL)_shouldTeachAboutControlCenter
{
  v2 = [MEMORY[0x1E4F5AD10] sharedInstance];
  BOOL v3 = (unint64_t)[v2 userInvocationCount] < 2;

  return v3;
}

- (void)_addControlCenterGlyphAnimation
{
  BOOL v3 = [(CSTeachableMomentsContainerViewController *)self teachableMomentsContainerView];
  v4 = [v3 controlCenterGlyphContainerView];
  v5 = [v4 layer];

  [(CSTeachableMomentsContainerViewController *)self _removeResetAnimationForKeyPath:@"opacity" onLayer:v5];
  [(CSTeachableMomentsContainerViewController *)self _removeNormalAnimationsForKeyPath:@"opacity" onLayer:v5];
  v6 = objc_opt_class();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__CSTeachableMomentsContainerViewController__addControlCenterGlyphAnimation__block_invoke;
  v7[3] = &unk_1E6AD9B80;
  v7[4] = self;
  [v6 _addRepeatedAnimationWithProvider:v7 toLayer:v5];
}

- (void)_addControlCenterGrabberAnimation
{
  BOOL v3 = [(CSTeachableMomentsContainerViewController *)self teachableMomentsContainerView];
  v4 = [v3 controlCenterGrabberContainerView];
  v5 = [v4 layer];

  [(CSTeachableMomentsContainerViewController *)self _removeResetAnimationForKeyPath:@"position.y" onLayer:v5];
  [(CSTeachableMomentsContainerViewController *)self _removeResetAnimationForKeyPath:@"opacity" onLayer:v5];
  [(CSTeachableMomentsContainerViewController *)self _removeNormalAnimationsForKeyPath:@"position.y" onLayer:v5];
  [(CSTeachableMomentsContainerViewController *)self _removeNormalAnimationsForKeyPath:@"opacity" onLayer:v5];
  v6 = objc_opt_class();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__CSTeachableMomentsContainerViewController__addControlCenterGrabberAnimation__block_invoke;
  v7[3] = &unk_1E6AD9B80;
  v7[4] = self;
  [v6 _addRepeatedAnimationWithProvider:v7 toLayer:v5];
}

- (void)_addTextAnimation
{
  BOOL v3 = [(CSTeachableMomentsContainerViewController *)self teachableMomentsContainerView];
  v4 = [v3 callToActionLabelContainerView];
  v5 = [v4 layer];

  [(CSTeachableMomentsContainerViewController *)self _removeResetAnimationForKeyPath:@"position.y" onLayer:v5];
  [(CSTeachableMomentsContainerViewController *)self _removeResetAnimationForKeyPath:@"opacity" onLayer:v5];
  [(CSTeachableMomentsContainerViewController *)self _removeNormalAnimationsForKeyPath:@"position.y" onLayer:v5];
  [(CSTeachableMomentsContainerViewController *)self _removeNormalAnimationsForKeyPath:@"opacity" onLayer:v5];
  v6 = objc_opt_class();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__CSTeachableMomentsContainerViewController__addTextAnimation__block_invoke;
  v7[3] = &unk_1E6AD9B80;
  v7[4] = self;
  [v6 _addRepeatedAnimationWithProvider:v7 toLayer:v5];
}

- (void)_removeResetAnimationForKeyPath:(id)a3 onLayer:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() _animationKeyForKeyPath:v6 iteration:0 reset:1];

  [v5 removeAnimationForKey:v7];
}

- (void)_removeNormalAnimationsForKeyPath:(id)a3 onLayer:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  for (uint64_t i = 0; i != 3; ++i)
  {
    id v7 = [(id)objc_opt_class() _animationKeyForKeyPath:v8 iteration:i reset:0];
    [v5 removeAnimationForKey:v7];
  }
}

+ (void)_addRepeatedAnimationWithProvider:(id)a3 toLayer:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(double, double))a3;
  id v7 = a4;
  double v8 = CACurrentMediaTime();
  uint64_t v9 = 0;
  v18 = (char *)(v6 + 2);
  v19 = v6;
  do
  {
    v10 = v19[2](4.0, v8);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v20 + 1) + 8 * v14);
          if (v9 == 2) {
            [*(id *)(*((void *)&v20 + 1) + 8 * v14) setValue:MEMORY[0x1E4F1CC38] forKey:@"kCSTeachableMomentIsLastAnimationKey"];
          }
          v16 = objc_msgSend(v15, "keyPath", v18);
          v17 = [a1 _animationKeyForKeyPath:v16 iteration:v9 reset:0];

          [v7 addAnimation:v15 forKey:v17];
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }
    double v8 = v8 + 4.0;

    ++v9;
  }
  while (v9 != 3);
}

+ (id)_animationKeyForKeyPath:(id)a3 iteration:(unint64_t)a4 reset:(BOOL)a5
{
  if (a5) {
    id v5 = @"kCSHomeAffordanceResetAnimation";
  }
  else {
    id v5 = @"kCSHomeAffordanceNormalAnimation";
  }
  return (id)[(__CFString *)v5 stringByAppendingFormat:@"-%@-%lu", a3, a4];
}

id __78__CSTeachableMomentsContainerViewController__addControlCenterGrabberAnimation__block_invoke(uint64_t a1, double a2, double a3)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v6 = objc_msgSend(*(id *)(a1 + 32), "_controlCenterGrabberPositionAnimationWithDuration:beginTime:");
  id v7 = [*(id *)(a1 + 32) _controlCenterGrabberAlphaAnimationWithDuration:a2 beginTime:a3];
  v10[0] = v6;
  v10[1] = v7;
  double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];

  return v8;
}

id __76__CSTeachableMomentsContainerViewController__addControlCenterGlyphAnimation__block_invoke(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v1 = objc_msgSend(*(id *)(a1 + 32), "_controlCenterGlyphAlphaAnimationWithDuration:beginTime:");
  v4[0] = v1;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

id __72__CSTeachableMomentsContainerViewController__addHomeAffordanceAnimation__block_invoke(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v1 = objc_msgSend(*(id *)(a1 + 32), "_homeAffordancePositionAnimationWithDuration:beginTime:");
  v4[0] = v1;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

id __62__CSTeachableMomentsContainerViewController__addTextAnimation__block_invoke(uint64_t a1, double a2, double a3)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v6 = objc_msgSend(*(id *)(a1 + 32), "_textPositionAnimationWithDuration:beginTime:");
  id v7 = [*(id *)(a1 + 32) _textAlphaAnimationWithDuration:a2 beginTime:a3];
  v10[0] = v6;
  v10[1] = v7;
  double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];

  return v8;
}

- (id)_textPositionAnimationWithDuration:(double)a3 beginTime:(double)a4
{
  v14[5] = *MEMORY[0x1E4F143B8];
  id v6 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"position.y"];
  [v6 setKeyTimes:&unk_1F306B968];
  id v7 = [NSNumber numberWithDouble:0.0];
  double v8 = objc_msgSend(NSNumber, "numberWithDouble:", -16.0, v7);
  v14[1] = v8;
  uint64_t v9 = [NSNumber numberWithDouble:-30.0];
  v14[2] = v9;
  v10 = [NSNumber numberWithDouble:-33.0];
  v14[3] = v10;
  uint64_t v11 = [NSNumber numberWithDouble:-33.0];
  v14[4] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:5];
  [v6 setValues:v12];

  [v6 setCalculationMode:@"cubic"];
  [v6 setDuration:a3];
  [v6 setBeginTime:a4];
  [v6 setAdditive:1];

  return v6;
}

- (id)_textAlphaAnimationWithDuration:(double)a3 beginTime:(double)a4
{
  id v7 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
  [v7 setKeyTimes:&unk_1F306B980];
  [v7 setValues:&unk_1F306B998];
  [v7 setCalculationMode:@"cubic"];
  [v7 setDuration:a3];
  [v7 setBeginTime:a4];
  [v7 setAdditive:1];
  [v7 setDelegate:self];

  return v7;
}

- (id)_homeAffordancePositionAnimationWithDuration:(double)a3 beginTime:(double)a4
{
  v14[5] = *MEMORY[0x1E4F143B8];
  id v6 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"position.y"];
  [v6 setKeyTimes:&unk_1F306B950];
  id v7 = [NSNumber numberWithDouble:0.0];
  double v8 = objc_msgSend(NSNumber, "numberWithDouble:", -5.0, v7);
  v14[1] = v8;
  uint64_t v9 = [NSNumber numberWithDouble:-15.0];
  v14[2] = v9;
  v10 = [NSNumber numberWithDouble:-2.0];
  v14[3] = v10;
  uint64_t v11 = [NSNumber numberWithDouble:0.0];
  v14[4] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:5];
  [v6 setValues:v12];

  [v6 setCalculationMode:@"cubic"];
  [v6 setDuration:a3];
  [v6 setBeginTime:a4];
  [v6 setAdditive:1];

  return v6;
}

- (id)_controlCenterGrabberPositionAnimationWithDuration:(double)a3 beginTime:(double)a4
{
  v166[5] = *MEMORY[0x1E4F143B8];
  int v8 = __sb__runningInSpringBoard();
  if (v8)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v9 = 0;
      int v10 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    v134 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v134 userInterfaceIdiom] != 1)
    {
      int v9 = 0;
      int v10 = 1;
      goto LABEL_10;
    }
  }
  int v10 = v8 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v11 = __sb__runningInSpringBoard();
    if (v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v135 = [MEMORY[0x1E4F42D90] mainScreen];
      [v135 _referenceBounds];
    }
    int v9 = v11 ^ 1;
    BSSizeRoundForScale();
    if (v32 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v31 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
    {
      int v164 = v11 ^ 1;
      int v165 = v10;
      long long v150 = 0uLL;
      int v151 = 0;
      int v149 = 0;
      uint64_t v148 = 0;
      int v152 = 0;
      uint64_t v153 = 0;
      uint64_t v147 = 0;
      uint64_t v146 = 0;
      int v154 = 0;
      uint64_t v144 = 0;
      uint64_t v155 = 0;
      uint64_t v145 = 0;
      int v156 = 0;
      uint64_t v143 = 0;
      uint64_t v141 = 0;
      uint64_t v139 = 0;
      int v157 = 0;
      int v158 = 0;
      uint64_t v142 = 0;
      int v159 = 0;
      uint64_t v140 = 0;
      int v160 = 0;
      uint64_t v138 = 0;
      int v161 = 0;
      uint64_t v137 = 0;
      int v162 = 0;
      int v136 = 0;
      int v22 = 0;
      int v23 = 0;
      int v163 = 0;
      int v24 = 0;
      int v25 = 0;
      int v26 = 0;
      double v27 = 30.8;
      double v28 = 36.0;
      goto LABEL_67;
    }
  }
  else
  {
    int v9 = 0;
  }
LABEL_10:
  int v12 = __sb__runningInSpringBoard();
  int v164 = v9;
  int v165 = v10;
  if (v12)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v13 = 0;
      int v14 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    v133 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v133 userInterfaceIdiom] != 1)
    {
      int v13 = 0;
      int v14 = 1;
      goto LABEL_19;
    }
  }
  int v14 = v12 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v11 = __sb__runningInSpringBoard();
    if (v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v125 = [MEMORY[0x1E4F42D90] mainScreen];
      [v125 _referenceBounds];
    }
    int v13 = v11 ^ 1;
    BSSizeRoundForScale();
    if (v34 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
    {
      int v162 = v11 ^ 1;
      int v163 = v14;
      long long v150 = 0uLL;
      int v151 = 0;
      int v149 = 0;
      uint64_t v148 = 0;
      int v152 = 0;
      uint64_t v153 = 0;
      uint64_t v147 = 0;
      uint64_t v146 = 0;
      int v154 = 0;
      uint64_t v144 = 0;
      uint64_t v155 = 0;
      uint64_t v145 = 0;
      int v156 = 0;
      uint64_t v143 = 0;
      uint64_t v141 = 0;
      uint64_t v139 = 0;
      int v157 = 0;
      int v158 = 0;
      uint64_t v142 = 0;
      int v159 = 0;
      uint64_t v140 = 0;
      int v160 = 0;
      uint64_t v138 = 0;
      int v161 = 0;
      uint64_t v137 = 0;
      int v136 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      int v25 = 0;
      int v26 = 0;
      double v27 = 30.8;
      double v28 = 36.0;
      goto LABEL_67;
    }
  }
  else
  {
    int v13 = 0;
  }
LABEL_19:
  int v15 = __sb__runningInSpringBoard();
  int v162 = v13;
  int v163 = v14;
  if (v15)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v16 = 0;
      int v17 = 0;
      goto LABEL_28;
    }
  }
  else
  {
    v132 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v132 userInterfaceIdiom] != 1)
    {
      int v16 = 0;
      int v17 = 1;
      goto LABEL_28;
    }
  }
  int v17 = v15 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v11 = __sb__runningInSpringBoard();
    if (v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v124 = [MEMORY[0x1E4F42D90] mainScreen];
      [v124 _referenceBounds];
    }
    int v16 = v11 ^ 1;
    BSSizeRoundForScale();
    if (v35 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
    {
      int v160 = v11 ^ 1;
      int v161 = v17;
      long long v150 = 0uLL;
      int v151 = 0;
      int v149 = 0;
      uint64_t v148 = 0;
      int v152 = 0;
      uint64_t v153 = 0;
      uint64_t v147 = 0;
      uint64_t v146 = 0;
      int v154 = 0;
      uint64_t v144 = 0;
      uint64_t v155 = 0;
      uint64_t v145 = 0;
      int v156 = 0;
      uint64_t v143 = 0;
      uint64_t v141 = 0;
      uint64_t v139 = 0;
      int v157 = 0;
      int v158 = 0;
      uint64_t v142 = 0;
      int v159 = 0;
      uint64_t v140 = 0;
      uint64_t v138 = 0;
      uint64_t v137 = 0;
      int v136 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      int v25 = 0;
      int v26 = 0;
      double v27 = 30.8;
      double v28 = 36.0;
      goto LABEL_67;
    }
  }
  else
  {
    int v16 = 0;
  }
LABEL_28:
  int v18 = __sb__runningInSpringBoard();
  int v160 = v16;
  int v161 = v17;
  if (v18)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      uint64_t v4 = 0;
      int v19 = 0;
      goto LABEL_37;
    }
  }
  else
  {
    v131 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v131 userInterfaceIdiom] != 1)
    {
      uint64_t v4 = 0;
      int v19 = 1;
      goto LABEL_37;
    }
  }
  int v19 = v18 ^ 1;
  uint64_t v11 = __sb__runningInSpringBoard();
  if (v11)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v128 = [MEMORY[0x1E4F42D90] mainScreen];
    [v128 _referenceBounds];
  }
  uint64_t v4 = v11 ^ 1;
  BSSizeRoundForScale();
  if (v20 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
  {
    int v158 = v11 ^ 1;
    int v159 = v19;
    long long v150 = 0uLL;
    int v151 = 0;
    int v149 = 0;
    uint64_t v148 = 0;
    int v152 = 0;
    uint64_t v153 = 0;
    uint64_t v147 = 0;
    uint64_t v146 = 0;
    int v154 = 0;
    uint64_t v144 = 0;
    uint64_t v155 = 0;
    uint64_t v145 = 0;
    int v156 = 0;
    uint64_t v143 = 0;
    uint64_t v141 = 0;
    uint64_t v139 = 0;
    int v157 = 0;
    uint64_t v142 = 0;
    uint64_t v140 = 0;
    uint64_t v137 = 0;
    uint64_t v138 = 0;
    int v136 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    double v27 = 30.8;
    double v28 = 36.0;
    goto LABEL_67;
  }
LABEL_37:
  int v21 = __sb__runningInSpringBoard();
  int v158 = v4;
  int v159 = v19;
  if (v21)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v156 = 0;
      uint64_t v5 = 0;
      goto LABEL_47;
    }
  }
  else
  {
    v130 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v130 userInterfaceIdiom] != 1)
    {
      int v156 = 0;
      uint64_t v5 = 1;
      goto LABEL_47;
    }
  }
  uint64_t v5 = v21 ^ 1u;
  uint64_t v11 = __sb__runningInSpringBoard();
  if (v11)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v126 = [MEMORY[0x1E4F42D90] mainScreen];
    [v126 _referenceBounds];
  }
  int v156 = v11 ^ 1;
  BSSizeRoundForScale();
  if (v29 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
  {
    int v157 = v5;
    long long v150 = 0uLL;
    int v151 = 0;
    int v149 = 0;
    uint64_t v148 = 0;
    int v152 = 0;
    uint64_t v153 = 0;
    uint64_t v147 = 0;
    uint64_t v146 = 0;
    int v154 = 0;
    uint64_t v144 = 0;
    uint64_t v155 = 0;
    uint64_t v145 = 0;
    uint64_t v143 = 0;
    uint64_t v141 = 0;
    uint64_t v139 = 0;
    uint64_t v140 = 0;
    uint64_t v142 = 0;
    uint64_t v137 = 0;
    uint64_t v138 = 0;
    int v136 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    double v27 = 30.8;
    double v28 = 36.0;
    goto LABEL_67;
  }
LABEL_47:
  int v30 = __sb__runningInSpringBoard();
  int v157 = v5;
  if (v30)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      uint64_t v155 = 0;
      goto LABEL_176;
    }
  }
  else
  {
    v129 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v129 userInterfaceIdiom] != 1)
    {
      uint64_t v155 = 0x100000000;
      goto LABEL_176;
    }
  }
  HIDWORD(v155) = v30 ^ 1;
  uint64_t v11 = __sb__runningInSpringBoard();
  if (v11)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v123 = [MEMORY[0x1E4F42D90] mainScreen];
    [v123 _referenceBounds];
  }
  LODWORD(v155) = v11 ^ 1;
  BSSizeRoundForScale();
  if (v45 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
  {
    long long v150 = 0uLL;
    int v151 = 0;
    int v149 = 0;
    uint64_t v148 = 0;
    int v152 = 0;
    uint64_t v153 = 0;
    uint64_t v147 = 0;
    uint64_t v146 = 0;
    int v154 = 0;
    uint64_t v143 = 0;
    uint64_t v144 = 0;
    uint64_t v141 = 0;
    uint64_t v142 = 0;
    uint64_t v145 = 0;
    uint64_t v139 = 0;
    uint64_t v140 = 0;
    uint64_t v137 = 0;
    uint64_t v138 = 0;
    int v136 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    double v27 = 0.0;
    double v28 = 0.0;
    goto LABEL_67;
  }
LABEL_176:
  uint64_t v11 = __sb__runningInSpringBoard();
  if (v11)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_178;
    }
LABEL_184:
    long long v150 = 0uLL;
    int v151 = 0;
    int v149 = 0;
    uint64_t v148 = 0;
    int v152 = 0;
    uint64_t v153 = 0;
    uint64_t v147 = 0;
    uint64_t v146 = 0;
    uint64_t v144 = 0;
    uint64_t v145 = 0;
    uint64_t v141 = 0;
    uint64_t v142 = 0;
    uint64_t v143 = 0;
    uint64_t v139 = 0;
    uint64_t v140 = 0;
    uint64_t v137 = 0;
    uint64_t v138 = 0;
    int v136 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    double v28 = 36.0;
    double v27 = 30.8;
    int v154 = v11 ^ 1;
    goto LABEL_67;
  }
  v127 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v127 userInterfaceIdiom] == 1) {
    goto LABEL_184;
  }
LABEL_178:
  int v154 = v11 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_182:
    uint64_t v153 = 0;
    goto LABEL_192;
  }
  int v46 = __sb__runningInSpringBoard();
  if (v46)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_182;
    }
  }
  else
  {
    v121 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v121 userInterfaceIdiom])
    {
      uint64_t v153 = 0x100000000;
      goto LABEL_192;
    }
  }
  HIDWORD(v153) = v46 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v47 = __sb__runningInSpringBoard();
    if (v47)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v114 = [MEMORY[0x1E4F42D90] mainScreen];
      [v114 _referenceBounds];
    }
    uint64_t v11 = v47 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v153) = v11;
    if (v52 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
    {
      long long v150 = 0uLL;
      int v151 = 0;
      int v149 = 0;
      uint64_t v148 = 0;
      int v152 = 0;
      uint64_t v146 = 0;
      uint64_t v147 = 0;
      uint64_t v144 = 0;
      uint64_t v145 = 0;
      uint64_t v141 = 0;
      uint64_t v142 = 0;
      uint64_t v143 = 0;
      uint64_t v139 = 0;
      uint64_t v140 = 0;
      uint64_t v137 = 0;
      uint64_t v138 = 0;
      int v136 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      int v25 = 0;
      int v26 = 0;
      double v27 = 24.8;
      double v28 = 28.0;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v153) = 0;
  }
LABEL_192:
  int v48 = __sb__runningInSpringBoard();
  if (v48)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v11 = 0;
      int v152 = 0;
      goto LABEL_202;
    }
  }
  else
  {
    v122 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v122 userInterfaceIdiom])
    {
      uint64_t v11 = 0;
      int v152 = 1;
      goto LABEL_202;
    }
  }
  int v152 = v48 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v49 = __sb__runningInSpringBoard();
    if (v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v117 = [MEMORY[0x1E4F42D90] mainScreen];
      [v117 _referenceBounds];
    }
    uint64_t v11 = v49 ^ 1u;
    BSSizeRoundForScale();
    if (v50 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
      goto LABEL_206;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
LABEL_202:
  if (_SBF_Private_IsD94Like())
  {
    int v151 = v11;
    long long v150 = 0uLL;
    int v149 = 0;
    uint64_t v147 = 0;
    uint64_t v148 = 0;
    uint64_t v145 = 0;
    uint64_t v146 = 0;
    uint64_t v143 = 0;
    uint64_t v144 = 0;
    uint64_t v141 = 0;
    uint64_t v142 = 0;
    uint64_t v139 = 0;
    uint64_t v140 = 0;
    uint64_t v137 = 0;
    uint64_t v138 = 0;
    int v136 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    double v27 = 24.8;
    double v28 = 28.0;
    goto LABEL_67;
  }
LABEL_206:
  int v151 = v11;
  if (!_SBF_Private_IsD64Like())
  {
LABEL_210:
    LODWORD(v150) = 0;
    HIDWORD(v150) = 0;
    goto LABEL_220;
  }
  int v51 = __sb__runningInSpringBoard();
  if (v51)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_210;
    }
  }
  else
  {
    v118 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v118 userInterfaceIdiom])
    {
      LODWORD(v150) = 0;
      HIDWORD(v150) = 1;
      goto LABEL_220;
    }
  }
  HIDWORD(v150) = v51 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v53 = __sb__runningInSpringBoard();
    if (v53)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v109 = [MEMORY[0x1E4F42D90] mainScreen];
      [v109 _referenceBounds];
    }
    uint64_t v11 = v53 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v150) = v11;
    if (v60 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      *(void *)((char *)&v150 + 4) = 0;
      int v149 = 0;
      uint64_t v147 = 0;
      uint64_t v148 = 0;
      uint64_t v145 = 0;
      uint64_t v146 = 0;
      uint64_t v143 = 0;
      uint64_t v144 = 0;
      uint64_t v141 = 0;
      uint64_t v142 = 0;
      uint64_t v139 = 0;
      uint64_t v140 = 0;
      uint64_t v137 = 0;
      uint64_t v138 = 0;
      int v136 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      int v25 = 0;
      int v26 = 0;
      double v27 = 24.8;
      double v28 = 28.0;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v150) = 0;
  }
LABEL_220:
  uint64_t v11 = __sb__runningInSpringBoard();
  if (v11)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(void *)((char *)&v150 + 4) = 0;
      goto LABEL_230;
    }
  }
  else
  {
    v120 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v120 userInterfaceIdiom])
    {
      *(void *)((char *)&v150 + 4) = 0x100000000;
      goto LABEL_230;
    }
  }
  DWORD2(v150) = v11 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v11 = __sb__runningInSpringBoard();
    if (v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v113 = [MEMORY[0x1E4F42D90] mainScreen];
      [v113 _referenceBounds];
    }
    DWORD1(v150) = v11 ^ 1;
    BSSizeRoundForScale();
    if (v54 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_234;
    }
  }
  else
  {
    DWORD1(v150) = 0;
  }
LABEL_230:
  if (_SBF_Private_IsD64Like())
  {
    int v149 = 0;
    uint64_t v147 = 0;
    uint64_t v148 = 0;
    uint64_t v145 = 0;
    uint64_t v146 = 0;
    uint64_t v143 = 0;
    uint64_t v144 = 0;
    uint64_t v141 = 0;
    uint64_t v142 = 0;
    uint64_t v139 = 0;
    uint64_t v140 = 0;
    uint64_t v137 = 0;
    uint64_t v138 = 0;
    int v136 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    double v27 = 24.8;
    double v28 = 28.0;
    goto LABEL_67;
  }
LABEL_234:
  int v55 = __sb__runningInSpringBoard();
  if (v55)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v149 = 0;
      LODWORD(v148) = 0;
      goto LABEL_244;
    }
  }
  else
  {
    v119 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v119 userInterfaceIdiom])
    {
      LODWORD(v148) = 0;
      int v149 = 1;
      goto LABEL_244;
    }
  }
  int v149 = v55 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v56 = __sb__runningInSpringBoard();
    if (v56)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v110 = [MEMORY[0x1E4F42D90] mainScreen];
      [v110 _referenceBounds];
    }
    uint64_t v11 = v56 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v148) = v11;
    if (v59 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      HIDWORD(v148) = 0;
      uint64_t v146 = 0;
      uint64_t v147 = 0;
      uint64_t v144 = 0;
      uint64_t v145 = 0;
      uint64_t v141 = 0;
      uint64_t v142 = 0;
      uint64_t v143 = 0;
      uint64_t v139 = 0;
      uint64_t v140 = 0;
      uint64_t v137 = 0;
      uint64_t v138 = 0;
      int v136 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      int v25 = 0;
      int v26 = 0;
      double v28 = 28.0;
      double v27 = 24.8;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v148) = 0;
  }
LABEL_244:
  int v57 = __sb__runningInSpringBoard();
  if (v57)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v148) = 0;
      uint64_t v11 = 0;
      goto LABEL_254;
    }
  }
  else
  {
    v116 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v116 userInterfaceIdiom])
    {
      uint64_t v11 = 0;
      HIDWORD(v148) = 1;
      goto LABEL_254;
    }
  }
  HIDWORD(v148) = v57 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v58 = __sb__runningInSpringBoard();
    if (v58)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v108 = [MEMORY[0x1E4F42D90] mainScreen];
      [v108 _referenceBounds];
    }
    uint64_t v11 = v58 ^ 1u;
    BSSizeRoundForScale();
    if (v61 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_264;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
LABEL_254:
  if (_SBF_Private_IsD54())
  {
    HIDWORD(v147) = v11;
    LODWORD(v147) = 0;
    uint64_t v145 = 0;
    uint64_t v146 = 0;
    uint64_t v143 = 0;
    uint64_t v144 = 0;
    uint64_t v141 = 0;
    uint64_t v142 = 0;
    uint64_t v139 = 0;
    uint64_t v140 = 0;
    uint64_t v137 = 0;
    uint64_t v138 = 0;
    int v136 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    double v28 = 28.0;
    double v27 = 24.8;
    goto LABEL_67;
  }
LABEL_264:
  HIDWORD(v147) = v11;
  int v62 = __sb__runningInSpringBoard();
  if (v62)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v147) = 0;
      HIDWORD(v146) = 0;
      goto LABEL_274;
    }
  }
  else
  {
    v115 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v115 userInterfaceIdiom])
    {
      HIDWORD(v146) = 0;
      LODWORD(v147) = 1;
      goto LABEL_274;
    }
  }
  LODWORD(v147) = v62 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v63 = __sb__runningInSpringBoard();
    if (v63)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v105 = [MEMORY[0x1E4F42D90] mainScreen];
      [v105 _referenceBounds];
    }
    uint64_t v11 = v63 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v146) = v11;
    if (v64 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      LODWORD(v146) = 0;
      uint64_t v144 = 0;
      uint64_t v145 = 0;
      uint64_t v141 = 0;
      uint64_t v142 = 0;
      uint64_t v143 = 0;
      uint64_t v139 = 0;
      uint64_t v140 = 0;
      uint64_t v137 = 0;
      uint64_t v138 = 0;
      int v136 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      int v25 = 0;
      int v26 = 0;
      double v28 = 29.0;
      double v27 = 24.8;
      goto LABEL_67;
    }
  }
  else
  {
    HIDWORD(v146) = 0;
  }
LABEL_274:
  uint64_t v11 = __sb__runningInSpringBoard();
  if (v11)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v146) = 0;
      HIDWORD(v145) = 0;
      goto LABEL_284;
    }
  }
  else
  {
    v112 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v112 userInterfaceIdiom])
    {
      HIDWORD(v145) = 0;
      LODWORD(v146) = 1;
      goto LABEL_284;
    }
  }
  LODWORD(v146) = v11 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v11 = __sb__runningInSpringBoard();
    if (v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v104 = [MEMORY[0x1E4F42D90] mainScreen];
      [v104 _referenceBounds];
    }
    HIDWORD(v145) = v11 ^ 1;
    BSSizeRoundForScale();
    if (v65 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_293;
    }
  }
  else
  {
    HIDWORD(v145) = 0;
  }
LABEL_284:
  if _SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice())
  {
    uint64_t v143 = 0;
    uint64_t v144 = 0;
    uint64_t v141 = 0;
    uint64_t v142 = 0;
    LODWORD(v145) = 0;
    uint64_t v139 = 0;
    uint64_t v140 = 0;
    uint64_t v137 = 0;
    uint64_t v138 = 0;
    int v136 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    double v27 = 0.0;
    double v28 = 0.0;
    goto LABEL_67;
  }
LABEL_293:
  uint64_t v5 = (uint64_t)&qword_1D8505000;
  uint64_t v4 = (uint64_t)&qword_1D8505000;
  if (!_SBF_Private_IsD93Like())
  {
LABEL_297:
    LODWORD(v144) = 0;
    HIDWORD(v141) = 0;
    goto LABEL_304;
  }
  int v66 = __sb__runningInSpringBoard();
  if (v66)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_297;
    }
  }
  else
  {
    v107 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v107 userInterfaceIdiom])
    {
      HIDWORD(v141) = 0;
      LODWORD(v144) = 1;
      goto LABEL_304;
    }
  }
  LODWORD(v144) = v66 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v11 = __sb__runningInSpringBoard();
    if (v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v98 = [MEMORY[0x1E4F42D90] mainScreen];
      [v98 _referenceBounds];
    }
    HIDWORD(v141) = v11 ^ 1;
    BSSizeRoundForScale();
    if (v69 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
    {
      LODWORD(v145) = 0;
      uint64_t v142 = 0;
      uint64_t v143 = 0;
      HIDWORD(v144) = 0;
      LODWORD(v141) = 0;
      uint64_t v139 = 0;
      uint64_t v140 = 0;
      uint64_t v137 = 0;
      uint64_t v138 = 0;
      int v136 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      int v25 = 0;
      int v26 = 0;
      double v28 = 26.6666667;
      double v27 = 23.6666667;
      goto LABEL_67;
    }
  }
  else
  {
    HIDWORD(v141) = 0;
  }
LABEL_304:
  uint64_t v11 = __sb__runningInSpringBoard();
  if (v11)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v145) = 0;
      HIDWORD(v143) = 0;
      goto LABEL_314;
    }
  }
  else
  {
    v111 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v111 userInterfaceIdiom])
    {
      HIDWORD(v143) = 0;
      LODWORD(v145) = 1;
      goto LABEL_314;
    }
  }
  LODWORD(v145) = v11 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v11 = __sb__runningInSpringBoard();
    if (v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v101 = [MEMORY[0x1E4F42D90] mainScreen];
      [v101 _referenceBounds];
    }
    HIDWORD(v143) = v11 ^ 1;
    BSSizeRoundForScale();
    if (v67 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
      goto LABEL_318;
    }
  }
  else
  {
    HIDWORD(v143) = 0;
  }
LABEL_314:
  if (_SBF_Private_IsD93Like())
  {
    HIDWORD(v144) = 0;
    LODWORD(v143) = 0;
    LODWORD(v141) = 0;
    uint64_t v139 = 0;
    uint64_t v140 = 0;
    uint64_t v142 = 0;
    uint64_t v137 = 0;
    uint64_t v138 = 0;
    int v136 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    double v28 = 26.6666667;
    double v27 = 23.6666667;
    goto LABEL_67;
  }
LABEL_318:
  if (!_SBF_Private_IsD63Like())
  {
LABEL_322:
    HIDWORD(v144) = 0;
    LODWORD(v143) = 0;
    goto LABEL_332;
  }
  int v68 = __sb__runningInSpringBoard();
  if (v68)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_322;
    }
  }
  else
  {
    v102 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v102 userInterfaceIdiom])
    {
      LODWORD(v143) = 0;
      HIDWORD(v144) = 1;
      goto LABEL_332;
    }
  }
  HIDWORD(v144) = v68 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v11 = __sb__runningInSpringBoard();
    if (v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v94 = [MEMORY[0x1E4F42D90] mainScreen];
      [v94 _referenceBounds];
    }
    LODWORD(v143) = v11 ^ 1;
    BSSizeRoundForScale();
    if (v73 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      LODWORD(v141) = 0;
      uint64_t v139 = 0;
      uint64_t v140 = 0;
      uint64_t v142 = 0;
      uint64_t v137 = 0;
      uint64_t v138 = 0;
      int v136 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      int v25 = 0;
      int v26 = 0;
      double v28 = 26.6666667;
      double v27 = 23.6666667;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v143) = 0;
  }
LABEL_332:
  uint64_t v11 = __sb__runningInSpringBoard();
  if (v11)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v141) = 0;
      LODWORD(v139) = 0;
      goto LABEL_342;
    }
  }
  else
  {
    v106 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v106 userInterfaceIdiom])
    {
      LODWORD(v139) = 0;
      LODWORD(v141) = 1;
      goto LABEL_342;
    }
  }
  LODWORD(v141) = v11 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v11 = __sb__runningInSpringBoard();
    if (v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v97 = [MEMORY[0x1E4F42D90] mainScreen];
      [v97 _referenceBounds];
    }
    LODWORD(v139) = v11 ^ 1;
    BSSizeRoundForScale();
    if (v70 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_346;
    }
  }
  else
  {
    LODWORD(v139) = 0;
  }
LABEL_342:
  if (_SBF_Private_IsD63Like())
  {
    uint64_t v142 = 0;
    uint64_t v140 = 0;
    uint64_t v137 = 0;
    uint64_t v138 = 0;
    HIDWORD(v139) = 0;
    int v136 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    double v28 = 26.6666667;
    double v27 = 23.6666667;
    goto LABEL_67;
  }
LABEL_346:
  int v71 = __sb__runningInSpringBoard();
  if (v71)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v142 = 0;
      goto LABEL_356;
    }
  }
  else
  {
    v103 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v103 userInterfaceIdiom])
    {
      uint64_t v142 = 0x100000000;
      goto LABEL_356;
    }
  }
  HIDWORD(v142) = v71 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v11 = __sb__runningInSpringBoard();
    if (v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v95 = [MEMORY[0x1E4F42D90] mainScreen];
      [v95 _referenceBounds];
    }
    LODWORD(v142) = v11 ^ 1;
    BSSizeRoundForScale();
    if (v72 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
    {
      uint64_t v140 = 0;
      uint64_t v137 = 0;
      uint64_t v138 = 0;
      HIDWORD(v139) = 0;
      int v136 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      int v25 = 0;
      int v26 = 0;
      double v28 = 29.0;
      double v27 = 24.8;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v142) = 0;
  }
LABEL_356:
  uint64_t v11 = __sb__runningInSpringBoard();
  if (v11)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v140) = 0;
      HIDWORD(v138) = 0;
      goto LABEL_366;
    }
  }
  else
  {
    v100 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v100 userInterfaceIdiom])
    {
      HIDWORD(v138) = 0;
      HIDWORD(v140) = 1;
      goto LABEL_366;
    }
  }
  HIDWORD(v140) = v11 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v11 = __sb__runningInSpringBoard();
    if (v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v93 = [MEMORY[0x1E4F42D90] mainScreen];
      [v93 _referenceBounds];
    }
    HIDWORD(v138) = v11 ^ 1;
    BSSizeRoundForScale();
    if (v74 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_376;
    }
  }
  else
  {
    HIDWORD(v138) = 0;
  }
LABEL_366:
  if (_SBF_Private_IsD33OrSimilarDevice())
  {
    LODWORD(v140) = 0;
    HIDWORD(v139) = 0;
    LODWORD(v138) = 0;
    uint64_t v137 = 0;
    int v136 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    double v27 = 0.0;
    double v28 = 0.0;
    goto LABEL_67;
  }
LABEL_376:
  int v75 = __sb__runningInSpringBoard();
  if (v75)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v140) = 0;
      HIDWORD(v139) = 0;
      goto LABEL_386;
    }
  }
  else
  {
    v99 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v99 userInterfaceIdiom])
    {
      HIDWORD(v139) = 0;
      LODWORD(v140) = 1;
      goto LABEL_386;
    }
  }
  LODWORD(v140) = v75 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v76 = __sb__runningInSpringBoard();
    if (v76)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v92 = [MEMORY[0x1E4F42D90] mainScreen];
      [v92 _referenceBounds];
    }
    uint64_t v11 = v76 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v139) = v11;
    if (v79 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      LODWORD(v138) = 0;
      uint64_t v137 = 0;
      int v136 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      int v25 = 0;
      int v26 = 0;
      double v28 = 26.6666667;
      double v27 = 23.6666667;
      goto LABEL_67;
    }
  }
  else
  {
    HIDWORD(v139) = 0;
  }
LABEL_386:
  int v77 = __sb__runningInSpringBoard();
  if (v77)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v138) = 0;
      uint64_t v11 = 0;
      goto LABEL_396;
    }
  }
  else
  {
    v96 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v96 userInterfaceIdiom])
    {
      uint64_t v11 = 0;
      LODWORD(v138) = 1;
      goto LABEL_396;
    }
  }
  LODWORD(v138) = v77 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v78 = __sb__runningInSpringBoard();
    if (v78)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v91 = [MEMORY[0x1E4F42D90] mainScreen];
      [v91 _referenceBounds];
    }
    uint64_t v11 = v78 ^ 1u;
    BSSizeRoundForScale();
    if (v80 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_403;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
LABEL_396:
  if (_SBF_Private_IsD53())
  {
    HIDWORD(v137) = v11;
LABEL_407:
    LODWORD(v137) = 0;
    int v136 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    double v28 = 26.6666667;
    double v27 = 23.6666667;
    goto LABEL_67;
  }
LABEL_403:
  HIDWORD(v137) = v11;
  if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0
    || _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
  {
    goto LABEL_407;
  }
  double v28 = 26.6666667;
  double v27 = 23.6666667;
  if (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0 || (_SBF_Private_IsD52ZoomedOrSimilarDevice())
  {
    LODWORD(v137) = 0;
    int v136 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    goto LABEL_67;
  }
  uint64_t v11 = __sb__runningInSpringBoard();
  if (v11)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v137) = 0;
      int v136 = 0;
      goto LABEL_421;
    }
  }
  else
  {
    v90 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v90 userInterfaceIdiom])
    {
      int v136 = 0;
      LODWORD(v137) = 1;
      goto LABEL_421;
    }
  }
  LODWORD(v137) = v11 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v4 = __sb__runningInSpringBoard();
    if (v4)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v88 = [MEMORY[0x1E4F42D90] mainScreen];
      [v88 _referenceBounds];
    }
    int v136 = v4 ^ 1;
    BSSizeRoundForScale();
    if (v84 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
    {
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      int v25 = 0;
      int v26 = 0;
      double v28 = 27.6666667;
      goto LABEL_67;
    }
  }
  else
  {
    int v136 = 0;
  }
LABEL_421:
  int v81 = __sb__runningInSpringBoard();
  if (v81)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v22 = 0;
      int v23 = 0;
      goto LABEL_431;
    }
  }
  else
  {
    v89 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v89 userInterfaceIdiom])
    {
      int v23 = 0;
      int v22 = 1;
      goto LABEL_431;
    }
  }
  int v22 = v81 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v4 = __sb__runningInSpringBoard();
    if (v4)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v87 = [MEMORY[0x1E4F42D90] mainScreen];
      [v87 _referenceBounds];
    }
    int v23 = v4 ^ 1;
    BSSizeRoundForScale();
    if (v85 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
    {
      int v24 = 0;
      int v25 = 0;
      int v26 = 0;
      double v27 = 0.0;
      double v28 = 0.0;
      goto LABEL_67;
    }
  }
  else
  {
    int v23 = 0;
  }
LABEL_431:
  uint64_t v4 = __sb__runningInSpringBoard();
  if (!v4)
  {
    uint64_t v11 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v11 userInterfaceIdiom])
    {
      int v25 = 0;
      int v24 = 1;
      goto LABEL_441;
    }
LABEL_437:
    int v24 = v4 ^ 1;
    uint64_t v4 = __sb__runningInSpringBoard();
    if (v4)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v5 = [MEMORY[0x1E4F42D90] mainScreen];
      [(id)v5 _referenceBounds];
    }
    int v25 = v4 ^ 1;
    BSSizeRoundForScale();
    if (v82 >= *(double *)(MEMORY[0x1E4FA6E50] + 56)) {
      goto LABEL_444;
    }
    goto LABEL_441;
  }
  if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1) {
    goto LABEL_437;
  }
  int v24 = 0;
  int v25 = 0;
LABEL_441:
  uint64_t v83 = __sb__runningInSpringBoard();
  if (v83)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
LABEL_444:
      int v26 = 0;
      double v27 = 0.0;
      double v28 = 0.0;
      goto LABEL_67;
    }
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v4 userInterfaceIdiom])
    {
      int v26 = 1;
      double v27 = 0.0;
      double v28 = 0.0;
      goto LABEL_67;
    }
  }
  int v26 = v83 ^ 1;
  int v86 = __sb__runningInSpringBoard();
  if (v86)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v83 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v83 _referenceBounds];
  }
  BSSizeRoundForScale();
  double v27 = 0.0;
  double v28 = 0.0;
  if (v86 != 1) {

  }
LABEL_67:
  if (v26) {

  }
  if (v25) {
  if (v24)
  }

  if (v23) {
  if (v22)
  }

  if (v136) {
  if (v137)
  }

  if (HIDWORD(v137)) {
  if (v138)
  }

  if (HIDWORD(v139)) {
  if (v140)
  }

  if (HIDWORD(v138)) {
  if (HIDWORD(v140))
  }

  if (v142) {
  if (HIDWORD(v142))
  }

  if (v139) {
  if (v141)
  }

  if (v143) {
  if (HIDWORD(v144))
  }

  if (HIDWORD(v143)) {
  if (v145)
  }

  if (HIDWORD(v141)) {
  if (v144)
  }

  if (HIDWORD(v145)) {
  if (v146)
  }

  if (HIDWORD(v146)) {
  if (v147)
  }

  if (HIDWORD(v147)) {
  if (HIDWORD(v148))
  }

  if (v148) {
  if (v149)
  }

  if (DWORD1(v150)) {
  if (DWORD2(v150))
  }

  if (v150) {
  if (HIDWORD(v150))
  }

  if (v151) {
  if (v152)
  }

  if (v153) {
  if (HIDWORD(v153))
  }

  if (v154) {
  if (v155)
  }

  if (HIDWORD(v155)) {
  if (v156)
  }

  if (v157) {
  if (v158)
  }
  {

    if (!v159) {
      goto LABEL_157;
    }
  }
  else if (!v159)
  {
LABEL_157:
    if (v160) {
      goto LABEL_158;
    }
    goto LABEL_166;
  }

  if (v160)
  {
LABEL_158:

    if (!v161) {
      goto LABEL_159;
    }
    goto LABEL_167;
  }
LABEL_166:
  if (!v161)
  {
LABEL_159:
    if (v162) {
      goto LABEL_160;
    }
    goto LABEL_168;
  }
LABEL_167:

  if (v162)
  {
LABEL_160:

    if (!v163) {
      goto LABEL_161;
    }
    goto LABEL_169;
  }
LABEL_168:
  if (!v163)
  {
LABEL_161:
    if (v164) {
      goto LABEL_162;
    }
    goto LABEL_170;
  }
LABEL_169:

  if (v164)
  {
LABEL_162:

    if (!v165) {
      goto LABEL_172;
    }
    goto LABEL_171;
  }
LABEL_170:
  if (v165) {
LABEL_171:
  }

LABEL_172:
  v36 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"position.y"];
  [v36 setKeyTimes:&unk_1F306B9B0];
  v37 = [NSNumber numberWithDouble:0.0];
  v166[0] = v37;
  v38 = [NSNumber numberWithDouble:v27];
  v166[1] = v38;
  v39 = [NSNumber numberWithDouble:v28];
  v166[2] = v39;
  v40 = [NSNumber numberWithDouble:v27];
  v166[3] = v40;
  v41 = [NSNumber numberWithDouble:0.0];
  v166[4] = v41;
  v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v166 count:5];
  [v36 setValues:v42];

  [v36 setCalculationMode:@"cubic"];
  [v36 setDuration:a3];
  [v36 setBeginTime:a4];
  [v36 setAdditive:1];
  id v43 = v36;

  return v43;
}

- (id)_controlCenterGrabberAlphaAnimationWithDuration:(double)a3 beginTime:(double)a4
{
  id v6 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
  [v6 setKeyTimes:&unk_1F306B9C8];
  [v6 setValues:&unk_1F306B9E0];
  [v6 setCalculationMode:@"cubic"];
  [v6 setDuration:a3];
  [v6 setBeginTime:a4];

  return v6;
}

- (id)_controlCenterGlyphAlphaAnimationWithDuration:(double)a3 beginTime:(double)a4
{
  id v6 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
  [v6 setKeyTimes:&unk_1F306B9F8];
  [v6 setValues:&unk_1F306BA10];
  [v6 setCalculationMode:@"cubic"];
  [v6 setDuration:a3];
  [v6 setBeginTime:a4];
  [v6 setAdditive:1];

  return v6;
}

- (void)_addHomeAffordanceAnimation
{
  BOOL v3 = [(CSHomeAffordanceViewController *)self->_homeAffordanceViewController view];
  uint64_t v4 = [v3 layer];

  [(CSTeachableMomentsContainerViewController *)self _removeResetAnimationForKeyPath:@"position.y" onLayer:v4];
  [(CSTeachableMomentsContainerViewController *)self _removeNormalAnimationsForKeyPath:@"position.y" onLayer:v4];
  uint64_t v5 = objc_opt_class();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__CSTeachableMomentsContainerViewController__addHomeAffordanceAnimation__block_invoke;
  v6[3] = &unk_1E6AD9B80;
  v6[4] = self;
  [v5 _addRepeatedAnimationWithProvider:v6 toLayer:v4];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  if (a4)
  {
    uint64_t v5 = [a3 valueForKey:@"kCSTeachableMomentIsLastAnimationKey"];
    int v6 = [v5 BOOLValue];

    if (v6)
    {
      id v7 = SBLogDashBoard();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[CSTeachableMomentsContainerViewController animationDidStop:finished:]();
      }

      [(CSTeachableMomentsContainerViewController *)self _setupTimer];
    }
    [(CSTeachableMomentsContainerViewController *)self _updateTextLabelIfNeeded];
  }
}

- (void)_setupTimer
{
}

- (void)_setupTimerWithDelay:(double)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__CSTeachableMomentsContainerViewController__setupTimerWithDelay___block_invoke;
  v5[3] = &unk_1E6AD9B58;
  v5[4] = self;
  uint64_t v4 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:v5 block:a3];
  [(CSTeachableMomentsContainerViewController *)self setFireOffAnimationTimer:v4];
}

- (CSTeachableMomentsContainerViewController)initWithCoverSheetContext:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CSTeachableMomentsContainerViewController;
  int v6 = [(CSCoverSheetViewControllerBase *)&v14 initWithNibName:0 bundle:0];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_coverSheetContext, a3);
    int v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cachedLegibilityLabels = v7->_cachedLegibilityLabels;
    v7->_cachedLegibilityLabels = v8;

    int v10 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    homeAffordanceAnimationSuppressionReasons = v7->_homeAffordanceAnimationSuppressionReasons;
    v7->_homeAffordanceAnimationSuppressionReasons = v10;

    int v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v7 selector:sel__contentSizeCategoryChanged name:*MEMORY[0x1E4F43788] object:0];
  }
  return v7;
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CSTeachableMomentsContainerViewController;
  [(CSCoverSheetViewControllerBase *)&v4 dealloc];
}

- (void)loadView
{
  BOOL v3 = objc_alloc_init(CSTeachableMomentsContainerView);
  objc_super v4 = [(CSTeachableMomentsContainerView *)v3 controlCenterGlyphContainerView];
  [v4 setAlpha:0.0];

  id v5 = [(id)*MEMORY[0x1E4F43630] statusBar];
  [(CSTeachableMomentsContainerView *)v3 setStatusBarToFollow:v5];

  [(CSTeachableMomentsContainerViewController *)self setView:v3];
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v6 = [[CSHomeAffordanceViewController alloc] initWithCoverSheetContext:self->_coverSheetContext];
    homeAffordanceViewController = self->_homeAffordanceViewController;
    self->_homeAffordanceViewController = v6;

    [(CSHomeAffordanceViewController *)self->_homeAffordanceViewController setDelegate:self];
    int v8 = self->_homeAffordanceViewController;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    int v15 = __53__CSTeachableMomentsContainerViewController_loadView__block_invoke;
    int v16 = &unk_1E6AD8AF8;
    int v17 = v3;
    int v18 = self;
    [(CSTeachableMomentsContainerViewController *)self bs_addChildViewController:v8 animated:0 transitionBlock:&v13];
    id v9 = objc_alloc(MEMORY[0x1E4F42EC8]);
    int v10 = (UITapGestureRecognizer *)objc_msgSend(v9, "initWithTarget:action:", self, sel__homeAffordanceClickRecognized_, v13, v14, v15, v16);
    homeAffordanceClickGestureRecognizer = self->_homeAffordanceClickGestureRecognizer;
    self->_homeAffordanceClickGestureRecognizer = v10;

    [(UITapGestureRecognizer *)self->_homeAffordanceClickGestureRecognizer setDelegate:self];
    [(UITapGestureRecognizer *)self->_homeAffordanceClickGestureRecognizer setName:@"homeAffordanceClickGestureRecognizer"];
    [(UITapGestureRecognizer *)self->_homeAffordanceClickGestureRecognizer setAllowedTouchTypes:&unk_1F306B938];
    int v12 = [(CSHomeAffordanceViewController *)self->_homeAffordanceViewController homeAffordanceView];
    [v12 addGestureRecognizer:self->_homeAffordanceClickGestureRecognizer];
  }
  [(CSTeachableMomentsContainerViewController *)self _updateLegibilitySettings];
}

void __53__CSTeachableMomentsContainerViewController_loadView__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  objc_super v4 = *(void **)(*(void *)(a1 + 40) + 1064);
  int v8 = a2;
  id v5 = [v4 view];
  [v3 setHomeAffordanceContainerView:v5];

  int v6 = *(void **)(a1 + 32);
  id v7 = [*(id *)(*(void *)(a1 + 40) + 1064) homeAffordanceView];
  [v6 setHomeAffordanceView:v7];

  v8[2]();
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CSTeachableMomentsContainerViewController;
  [(CSCoverSheetViewControllerBase *)&v6 viewWillAppear:a3];
  [(CSTeachableMomentsContainerViewController *)self _updateTextLabel];
  [(CSTeachableMomentsContainerViewController *)self setAnimationState:1];
  objc_super v4 = [(CSTeachableMomentsContainerViewController *)self teachableMomentsContainerView];
  int v5 = [v4 usesStatusBarRelativeLayoutForControlCenterTutors];

  if (v5)
  {
    [(CSTeachableMomentsContainerViewController *)self _setControlCenterTutorsHidden:1];
    [(CSTeachableMomentsContainerViewController *)self _setControlCenterTutorsHidden:0];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSTeachableMomentsContainerViewController;
  [(CSCoverSheetViewControllerBase *)&v4 viewWillDisappear:a3];
  [(CSTeachableMomentsContainerViewController *)self setAnimationState:0];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)CSTeachableMomentsContainerViewController;
  id v7 = a4;
  -[CSCoverSheetViewControllerBase viewWillTransitionToSize:withTransitionCoordinator:](&v12, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  int v8 = [(CSTeachableMomentsContainerViewController *)self teachableMomentsContainerView];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __96__CSTeachableMomentsContainerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  void v10[3] = &unk_1E6AD97F8;
  id v11 = v8;
  id v9 = v8;
  [v7 animateAlongsideTransition:v10 completion:0];
}

uint64_t __96__CSTeachableMomentsContainerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsLayout];
  v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CSTeachableMomentsContainerViewController;
  if (![(CSCoverSheetViewControllerBase *)&v14 handleEvent:v4]
    || ([v4 isConsumable] & 1) == 0)
  {
    uint64_t v6 = [v4 type];
    char v5 = 0;
    if (v6 <= 14)
    {
      if (v6 == 1)
      {
        [(CSTeachableMomentsContainerViewController *)self _updateLegibilitySettings];
      }
      else
      {
        if (v6 != 13) {
          goto LABEL_19;
        }
        id v9 = [v4 value];
        uint64_t v10 = [v9 BOOLValue];

        [(CSTeachableMomentsContainerViewController *)self setAuthenticated:v10];
      }
    }
    else if (v6 == 15)
    {
      id v11 = [v4 value];
      uint64_t v12 = [v11 unsignedIntegerValue];

      if (v12 == 28 && ![(CSTeachableMomentsContainerViewController *)self currentState]) {
        [(CSTeachableMomentsContainerViewController *)self _moveUpTimerForFiringAfterDelay:0.0];
      }
    }
    else
    {
      if (v6 == 24)
      {
        id v7 = self;
        uint64_t v8 = 1;
      }
      else
      {
        if (v6 != 25) {
          goto LABEL_19;
        }
        id v7 = self;
        uint64_t v8 = 0;
      }
      [(CSTeachableMomentsContainerViewController *)v7 setScreenOn:v8];
    }
    char v5 = 0;
    goto LABEL_19;
  }
  char v5 = [v4 isConsumable];
LABEL_19:

  return v5;
}

- (void)setAuthenticated:(BOOL)a3
{
  p_authenticated = (unsigned __int8 *)&self->_authenticated;
  if (self->_authenticated != a3)
  {
    BOOL v4 = a3;
    unsigned __int8 *p_authenticated = a3;
    uint64_t v6 = SBLogDashBoard();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[CSTeachableMomentsContainerViewController setAuthenticated:](p_authenticated, v6);
    }

    if (v4) {
      [(CSTeachableMomentsContainerViewController *)self setUpdateTextLabelOnNextAnimation:1];
    }
    else {
      [(CSTeachableMomentsContainerViewController *)self _updateTextLabel];
    }
  }
}

- (void)_updateLegibilitySettings
{
  BOOL v3 = [(CSCoverSheetViewControllerBase *)self activeAppearance];
  id v5 = [v3 legibilitySettings];

  BOOL v4 = [(CSTeachableMomentsContainerViewController *)self teachableMomentsContainerView];
  [v4 setLegibilitySettings:v5];

  [(CSHomeAffordanceViewController *)self->_homeAffordanceViewController setLegibilitySettings:v5];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  if (self->_homeAffordanceClickGestureRecognizer == a3) {
    return [a4 _isPointerTouch];
  }
  else {
    return 0;
  }
}

- (void)_homeAffordanceClickRecognized:(id)a3
{
  id v4 = +[CSAction actionWithType:11];
  [(CSCoverSheetViewControllerBase *)self sendAction:v4];
}

- (void)_setControlCenterTutorsHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CSTeachableMomentsContainerViewController *)self teachableMomentsContainerView];
  uint64_t v6 = v5;
  if (v3 || ([v5 isStatusBarLayoutReady] & 1) != 0)
  {
    [v6 setNeedsLayout];
    id v7 = [v6 controlCenterTutorsContainerView];
    [v7 setHidden:v3];
  }
  else
  {
    dispatch_time_t v8 = dispatch_time(0, 100000000);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __75__CSTeachableMomentsContainerViewController__setControlCenterTutorsHidden___block_invoke;
    v9[3] = &unk_1E6AD8CD0;
    v9[4] = self;
    BOOL v10 = v3;
    dispatch_after(v8, MEMORY[0x1E4F14428], v9);
  }
}

uint64_t __75__CSTeachableMomentsContainerViewController__setControlCenterTutorsHidden___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setControlCenterTutorsHidden:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setAnimationState:(unint64_t)a3
{
  if (self->_animationState != a3)
  {
    self->_animationState = a3;
    [(CSTeachableMomentsContainerViewController *)self _updateEffectiveAnimationState];
  }
}

- (void)setScreenOn:(BOOL)a3
{
  if (self->_screenOn != a3)
  {
    self->_screenOn = a3;
    if (a3) {
      [(CSTeachableMomentsContainerViewController *)self _endSuppressingHomeAffordanceAnimationForScreenOff];
    }
    else {
      [(CSTeachableMomentsContainerViewController *)self _beginSuppressingHomeAffordanceAnimationForScreenOff];
    }
  }
}

- (void)_updateEffectiveAnimationState
{
  unint64_t v3 = [(CSTeachableMomentsContainerViewController *)self animationState];
  if ([(CSTeachableMomentsContainerViewController *)self _suppressingHomeAffordanceAnimation])
  {
    unint64_t v4 = 0;
  }
  else
  {
    unint64_t v4 = v3;
  }

  [(CSTeachableMomentsContainerViewController *)self setEffectiveAnimationState:v4];
}

- (void)setEffectiveAnimationState:(unint64_t)a3
{
  if (self->_effectiveAnimationState != a3)
  {
    self->_effectiveAnimationState = a3;
    if (a3)
    {
      if (a3 == 1)
      {
        unint64_t v4 = SBLogDashBoard();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
          -[CSTeachableMomentsContainerViewController setEffectiveAnimationState:]();
        }

        [(CSTeachableMomentsContainerViewController *)self _setupTimer];
        if ([(SBUIBiometricResource *)self->_biometricResource hasBiometricAuthenticationCapabilityEnabled])
        {
          if ([(SBUIBiometricResource *)self->_biometricResource biometricLockoutState]) {
            [(CSTeachableMomentsContainerViewController *)self _moveUpTimerForFiringAfterDelay:0.0];
          }
        }
      }
    }
    else
    {
      [(CSTeachableMomentsContainerViewController *)self _cancelTimerAndResetAnimation];
    }
  }
}

- (void)_cancelTimerAndResetAnimation
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1(&dword_1D839D000, v0, v1, "starting reset animations because timer has already fired.", v2, v3, v4, v5, v6);
}

- (void)_moveUpTimerForFiringAfterDelay:(double)a3
{
  id v8 = [(CSTeachableMomentsContainerViewController *)self fireOffAnimationTimer];
  uint64_t v5 = [v8 fireDate];
  [v5 timeIntervalSinceNow];
  double v7 = v6;

  if (v7 > a3)
  {
    [(CSTeachableMomentsContainerViewController *)self setFireOffAnimationTimer:0];
    [(CSTeachableMomentsContainerViewController *)self _setupTimerWithDelay:a3];
  }
}

- (BOOL)_animatesTextPositionWhenResetting
{
  uint64_t v3 = [(CSCoverSheetContextProviding *)self->_coverSheetContext assistantController];
  int v4 = [v3 isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled];

  if (!v4) {
    return 1;
  }
  uint64_t v5 = [(CSTeachableMomentsContainerViewController *)self homeAffordanceAnimationSuppressionReasons];
  BOOL v6 = [v5 countForObject:@"HomeAffordanceDoubleTap"] == 0;

  return v6;
}

- (void)_addResetAnimationForKeyPath:(id)a3 onLayer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 presentationLayer];
  id v9 = [v8 valueForKeyPath:v7];
  [v9 doubleValue];
  double v11 = v10;

  uint64_t v12 = [v6 valueForKeyPath:v7];
  [v12 doubleValue];
  double v14 = v13;

  [(CSTeachableMomentsContainerViewController *)self _removeNormalAnimationsForKeyPath:v7 onLayer:v6];
  id v19 = [MEMORY[0x1E4F39B48] animationWithKeyPath:v7];
  [v19 setDuration:0.2];
  int v15 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v19 setTimingFunction:v15];

  int v16 = [NSNumber numberWithDouble:v11];
  [v19 setFromValue:v16];

  int v17 = [NSNumber numberWithDouble:v14];
  [v19 setToValue:v17];

  int v18 = [(id)objc_opt_class() _animationKeyForKeyPath:v7 iteration:0 reset:1];

  [v6 addAnimation:v19 forKey:v18];
}

- (void)_pauseNormalAnimationsForKeyPath:(id)a3 onLayer:(id)a4
{
  id v12 = a3;
  id v5 = a4;
  double v6 = CACurrentMediaTime();
  for (uint64_t i = 0; i != 3; ++i)
  {
    id v8 = [(id)objc_opt_class() _animationKeyForKeyPath:v12 iteration:i reset:0];
    id v9 = [v5 animationForKey:v8];
    double v10 = (void *)[v9 copy];
    [v10 setSpeed:0.0];
    [v9 beginTime];
    [v10 setTimeOffset:v6 - v11];
    [v5 removeAnimationForKey:v8];
    [v5 addAnimation:v10 forKey:v8];
  }
}

- (void)_addHomeAffordanceResetAnimation
{
  uint64_t v3 = [(CSHomeAffordanceViewController *)self->_homeAffordanceViewController view];
  id v4 = [v3 layer];

  [(CSTeachableMomentsContainerViewController *)self _addResetAnimationForKeyPath:@"position.y" onLayer:v4];
}

- (void)_addTextResetAnimation
{
  uint64_t v3 = [(CSTeachableMomentsContainerViewController *)self teachableMomentsContainerView];
  id v4 = [v3 callToActionLabelContainerView];
  id v5 = [v4 layer];

  if ([(CSTeachableMomentsContainerViewController *)self _animatesTextPositionWhenResetting])
  {
    [(CSTeachableMomentsContainerViewController *)self _addResetAnimationForKeyPath:@"position.y" onLayer:v5];
  }
  else
  {
    [(CSTeachableMomentsContainerViewController *)self _pauseNormalAnimationsForKeyPath:@"position.y" onLayer:v5];
  }
  [(CSTeachableMomentsContainerViewController *)self _addResetAnimationForKeyPath:@"opacity" onLayer:v5];
}

- (void)_addControlCenterGrabberResetAnimation
{
  uint64_t v3 = [(CSTeachableMomentsContainerViewController *)self teachableMomentsContainerView];
  id v4 = [v3 controlCenterGrabberContainerView];
  id v5 = [v4 layer];

  [(CSTeachableMomentsContainerViewController *)self _addResetAnimationForKeyPath:@"position.y" onLayer:v5];
  [(CSTeachableMomentsContainerViewController *)self _addResetAnimationForKeyPath:@"opacity" onLayer:v5];
}

- (void)_addControlCenterGlyphResetAnimation
{
  uint64_t v3 = [(CSTeachableMomentsContainerViewController *)self teachableMomentsContainerView];
  id v4 = [v3 controlCenterGlyphContainerView];
  id v5 = [v4 layer];

  [(CSTeachableMomentsContainerViewController *)self _addResetAnimationForKeyPath:@"opacity" onLayer:v5];
}

- (unint64_t)currentState
{
  return [(CSTeachableMomentsContainerViewController *)self authenticated];
}

- (void)_updateTextLabel
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D839D000, a2, OS_LOG_TYPE_DEBUG, "Updating Call to action Label: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_updateText:(id)a3
{
  id v43 = a3;
  double v6 = [(CSTeachableMomentsContainerViewController *)self cachedLegibilityLabels];
  id v7 = [v6 valueForKey:v43];
  if (v7) {
    goto LABEL_77;
  }
  id v8 = [(CSTeachableMomentsContainerViewController *)self teachableMomentsContainerView];
  id v7 = [v8 createCallToActionLabel];

  [v7 setString:v43];
  [v6 setObject:v7 forKey:v43];
  int v9 = __sb__runningInSpringBoard();
  char v10 = v9;
  if (v9)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      if (_SBF_Private_IsD53()) {
        goto LABEL_34;
      }
      goto LABEL_9;
    }
LABEL_21:
    if (SBFEffectiveHomeButtonType() != 2)
    {
      char IsD53 = _SBF_Private_IsD53();
      goto LABEL_31;
    }
    int v16 = __sb__runningInSpringBoard();
    char v17 = v16;
    if (v16)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v4 = [MEMORY[0x1E4F42D90] mainScreen];
      [v4 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (v19 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      char IsD53 = 0;
      if (v17) {
        goto LABEL_31;
      }
    }
    else
    {
      char IsD53 = _SBF_Private_IsD53();
      if (v17)
      {
LABEL_31:
        if ((v10 & 1) == 0) {

        }
        if (IsD53) {
          goto LABEL_34;
        }
        goto LABEL_9;
      }
    }

    goto LABEL_31;
  }
  uint64_t v3 = [MEMORY[0x1E4F42948] currentDevice];
  if (![v3 userInterfaceIdiom]) {
    goto LABEL_21;
  }
  char v11 = _SBF_Private_IsD53();

  if (v11)
  {
LABEL_34:
    double v20 = 0.820512821;
LABEL_75:
    uint64_t v15 = [v7 font];
    v33 = [(id)v15 _fontScaledByScaleFactor:v20];
    [v7 setFont:v33];

    goto LABEL_76;
  }
LABEL_9:
  int v12 = __sb__runningInSpringBoard();
  char v13 = v12;
  if (v12)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      if (_SBF_Private_IsD54()) {
        goto LABEL_56;
      }
      goto LABEL_16;
    }
LABEL_43:
    if (SBFEffectiveHomeButtonType() != 2)
    {
      char IsD54 = _SBF_Private_IsD54();
      goto LABEL_53;
    }
    int v23 = __sb__runningInSpringBoard();
    char v24 = v23;
    if (v23)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v4 = [MEMORY[0x1E4F42D90] mainScreen];
      [v4 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (v26 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      char IsD54 = 0;
      if (v24) {
        goto LABEL_53;
      }
    }
    else
    {
      char IsD54 = _SBF_Private_IsD54();
      if (v24)
      {
LABEL_53:
        if ((v13 & 1) == 0) {

        }
        if (IsD54) {
          goto LABEL_56;
        }
        goto LABEL_16;
      }
    }

    goto LABEL_53;
  }
  uint64_t v3 = [MEMORY[0x1E4F42948] currentDevice];
  if (![v3 userInterfaceIdiom]) {
    goto LABEL_43;
  }
  char v14 = _SBF_Private_IsD54();

  if (v14)
  {
LABEL_56:
    double v20 = 0.876168224;
    goto LABEL_75;
  }
LABEL_16:
  uint64_t v15 = __sb__runningInSpringBoard();
  if (v15)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      if (_SBF_Private_IsD33OrSimilarDevice()) {
        goto LABEL_74;
      }
      goto LABEL_37;
    }
LABEL_61:
    if (SBFEffectiveHomeButtonType() != 2)
    {
      char IsD33OrSimilarDevice = _SBF_Private_IsD33OrSimilarDevice();
      goto LABEL_71;
    }
    int v29 = __sb__runningInSpringBoard();
    char v30 = v29;
    if (v29)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v4 = [MEMORY[0x1E4F42D90] mainScreen];
      [v4 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (v32 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
    {
      char IsD33OrSimilarDevice = 0;
      if (v30) {
        goto LABEL_71;
      }
    }
    else
    {
      char IsD33OrSimilarDevice = _SBF_Private_IsD33OrSimilarDevice();
      if (v30)
      {
LABEL_71:
        if ((v15 & 1) == 0) {

        }
        if (IsD33OrSimilarDevice) {
          goto LABEL_74;
        }
        goto LABEL_37;
      }
    }

    goto LABEL_71;
  }
  uint64_t v3 = [MEMORY[0x1E4F42948] currentDevice];
  if (![v3 userInterfaceIdiom]) {
    goto LABEL_61;
  }
  uint64_t v15 = _SBF_Private_IsD33OrSimilarDevice();

  if (v15)
  {
LABEL_74:
    double v20 = 0.905797101;
    goto LABEL_75;
  }
LABEL_37:
  int v21 = __sb__runningInSpringBoard();
  char v22 = v21;
  if (!v21)
  {
    uint64_t v15 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v15 userInterfaceIdiom] || SBFEffectiveHomeButtonType() != 2) {
      goto LABEL_76;
    }
    goto LABEL_59;
  }
  if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
    goto LABEL_77;
  }
  if (SBFEffectiveHomeButtonType() == 2)
  {
LABEL_59:
    int v27 = __sb__runningInSpringBoard();
    char v28 = v27;
    if (v27)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v4 = [MEMORY[0x1E4F42D90] mainScreen];
      [v4 _referenceBounds];
    }
    BSSizeRoundForScale();
    BOOL v42 = v41 >= *(double *)(MEMORY[0x1E4FA6E50] + 72);
    if (v28)
    {
      if (v22) {
        goto LABEL_87;
      }
    }
    else
    {

      if (v22)
      {
LABEL_87:
        if (!v42) {
          goto LABEL_77;
        }
        goto LABEL_91;
      }
    }

    if (!v42) {
      goto LABEL_77;
    }
LABEL_91:
    double v20 = 0.853333333;
    goto LABEL_75;
  }
  if ((v22 & 1) == 0) {
LABEL_76:
  }

LABEL_77:
  double v34 = [(CSTeachableMomentsContainerViewController *)self teachableMomentsContainerView];
  double v35 = [v34 callToActionLabel];

  if (v7 != v35)
  {
    v36 = [(CSCoverSheetViewControllerBase *)self activeAppearance];
    v37 = [v36 componentForType:9 property:1];
    int v38 = [v37 isHidden];

    double v39 = 1.0;
    if (v38) {
      double v39 = 0.0;
    }
    [v7 setAlpha:v39];
  }
  v40 = [(CSTeachableMomentsContainerViewController *)self teachableMomentsContainerView];
  [v40 setCallToActionLabel:v7];
}

- (void)_beginSuppressingHomeAffordanceAnimationForScreenOff
{
  uint64_t v3 = [(CSTeachableMomentsContainerViewController *)self homeAffordanceAnimationSuppressionReasons];
  char v4 = [v3 containsObject:@"ScreenOff"];

  if ((v4 & 1) == 0)
  {
    id v5 = [(CSTeachableMomentsContainerViewController *)self homeAffordanceAnimationSuppressionReasons];
    [v5 addObject:@"ScreenOff"];
  }

  [(CSTeachableMomentsContainerViewController *)self _updateEffectiveAnimationState];
}

- (void)_endSuppressingHomeAffordanceAnimationForScreenOff
{
  uint64_t v3 = [(CSTeachableMomentsContainerViewController *)self homeAffordanceAnimationSuppressionReasons];
  int v4 = [v3 containsObject:@"ScreenOff"];

  if (v4)
  {
    id v5 = [(CSTeachableMomentsContainerViewController *)self homeAffordanceAnimationSuppressionReasons];
    [v5 removeObject:@"ScreenOff"];
  }

  [(CSTeachableMomentsContainerViewController *)self _updateEffectiveAnimationState];
}

- (void)_beginSuppressingHomeAffordanceAnimationForHomeAffordanceDoubleTap
{
  uint64_t v3 = [(CSTeachableMomentsContainerViewController *)self homeAffordanceAnimationSuppressionReasons];
  [v3 addObject:@"HomeAffordanceDoubleTap"];

  [(CSTeachableMomentsContainerViewController *)self _updateEffectiveAnimationState];
}

- (void)_endSuppressingHomeAffordanceAnimationForHomeAffordanceDoubleTap
{
  uint64_t v3 = [(CSTeachableMomentsContainerViewController *)self homeAffordanceAnimationSuppressionReasons];
  [v3 removeObject:@"HomeAffordanceDoubleTap"];

  [(CSTeachableMomentsContainerViewController *)self _updateEffectiveAnimationState];
}

- (BOOL)_suppressingHomeAffordanceAnimation
{
  int v2 = [(CSTeachableMomentsContainerViewController *)self homeAffordanceAnimationSuppressionReasons];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)_contentSizeCategoryChanged
{
}

- (void)aggregateAppearance:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CSTeachableMomentsContainerViewController;
  id v4 = a3;
  [(CSCoverSheetViewControllerBase *)&v5 aggregateAppearance:v4];
  objc_msgSend(v4, "unionAppearance:", self->_homeAffordanceViewController, v5.receiver, v5.super_class);
}

- (CSCoverSheetContextProviding)coverSheetContext
{
  return self->_coverSheetContext;
}

- (CSHomeAffordanceViewController)homeAffordanceViewController
{
  return self->_homeAffordanceViewController;
}

- (unint64_t)animationState
{
  return self->_animationState;
}

- (SBDashBoardHomeAffordanceAnimationViewProviding)viewProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewProvider);

  return (SBDashBoardHomeAffordanceAnimationViewProviding *)WeakRetained;
}

- (void)setViewProvider:(id)a3
{
}

- (SBUIBiometricResource)biometricResource
{
  return self->_biometricResource;
}

- (void)setBiometricResource:(id)a3
{
}

- (NSTimer)fireOffAnimationTimer
{
  return self->_fireOffAnimationTimer;
}

- (BOOL)authenticated
{
  return self->_authenticated;
}

- (void)setUpdateTextLabelOnNextAnimation:(BOOL)a3
{
  self->_updateTextLabelOnNextAnimation = a3;
}

- (NSMutableDictionary)cachedLegibilityLabels
{
  return self->_cachedLegibilityLabels;
}

- (void)setCachedLegibilityLabels:(id)a3
{
}

- (BOOL)controlCenterCoachingIsHidden
{
  return self->_controlCenterCoachingIsHidden;
}

- (void)setControlCenterCoachingIsHidden:(BOOL)a3
{
  self->_controlCenterCoachingIsHidden = a3;
}

- (UITapGestureRecognizer)homeAffordanceClickGestureRecognizer
{
  return self->_homeAffordanceClickGestureRecognizer;
}

- (void)setHomeAffordanceClickGestureRecognizer:(id)a3
{
}

- (BOOL)isScreenOn
{
  return self->_screenOn;
}

- (NSCountedSet)homeAffordanceAnimationSuppressionReasons
{
  return self->_homeAffordanceAnimationSuppressionReasons;
}

- (void)setHomeAffordanceAnimationSuppressionReasons:(id)a3
{
}

- (unint64_t)effectiveAnimationState
{
  return self->_effectiveAnimationState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeAffordanceAnimationSuppressionReasons, 0);
  objc_storeStrong((id *)&self->_homeAffordanceClickGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_cachedLegibilityLabels, 0);
  objc_storeStrong((id *)&self->_fireOffAnimationTimer, 0);
  objc_storeStrong((id *)&self->_biometricResource, 0);
  objc_destroyWeak((id *)&self->_viewProvider);
  objc_storeStrong((id *)&self->_homeAffordanceViewController, 0);

  objc_storeStrong((id *)&self->_coverSheetContext, 0);
}

- (void)setAuthenticated:(unsigned __int8 *)a1 .cold.1(unsigned __int8 *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_1D839D000, a2, OS_LOG_TYPE_DEBUG, "SBDashBoardTeachableMomentsContainerViewController setAuthenticated: %{BOOL}d", (uint8_t *)v3, 8u);
}

- (void)setEffectiveAnimationState:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1(&dword_1D839D000, v0, v1, "Setting up timer as a result of setting animation state bounce", v2, v3, v4, v5, v6);
}

- (void)animationDidStop:finished:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1(&dword_1D839D000, v0, v1, "Setting up timer as a result of cycle finishing", v2, v3, v4, v5, v6);
}

@end