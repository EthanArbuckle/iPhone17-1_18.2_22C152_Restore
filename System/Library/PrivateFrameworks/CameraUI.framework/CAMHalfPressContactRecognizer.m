@interface CAMHalfPressContactRecognizer
- (BOOL)_halfPressIncurredFullPress;
- (BOOL)_lastPressWasDoubleHalfPress;
- (BOOL)enabled;
- (CAMHalfPressContactRecognizer)init;
- (CAMHalfPressContactRecognizerDelegate)delegate;
- (NSMutableSet)_activePairedFeedbackGenerators;
- (_UIButtonFeedbackGenerator)_halfPressFeedbackGenerator;
- (double)_accumulatedDeltaSinceLastHalfPress;
- (double)_halfPressTimestamp;
- (void)_setAccumulatedDeltaSinceLastHalfPress:(double)a3;
- (void)_setHalfPressIncurredFullPress:(BOOL)a3;
- (void)_setHalfPressTimestamp:(double)a3;
- (void)_setLastPressWasDoubleHalfPress:(BOOL)a3;
- (void)contactBeganWithAction:(id)a3;
- (void)contactUpdatedWithAction:(id)a3;
- (void)reset;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation CAMHalfPressContactRecognizer

- (CAMHalfPressContactRecognizer)init
{
  v32[3] = *MEMORY[0x263EF8340];
  v24.receiver = self;
  v24.super_class = (Class)CAMHalfPressContactRecognizer;
  v2 = [(CAMHalfPressContactRecognizer *)&v24 init];
  if (v2)
  {
    v3 = (void *)CFPreferencesCopyAppValue(@"systemOverlay.halfPressHapticVolume", @"com.apple.camera");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v3 floatValue];
      double v4 = fmax(fmin(v5, 1.0), 0.0);
      float v6 = v4;
    }
    else
    {
      float v6 = 0.38;
    }
    v7 = (void *)MEMORY[0x263F82F00];
    v31[0] = @"type";
    v31[1] = @"eventType";
    v32[0] = @"custom";
    v32[1] = &unk_26BDDEEF8;
    v31[2] = @"hapticParameters";
    v29 = @"volume";
    *(float *)&double v4 = v6;
    v8 = [NSNumber numberWithFloat:v4];
    v30 = v8;
    v9 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    v32[2] = v9;
    v10 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3];
    v11 = [v7 feedbackWithDictionaryRepresentation:v10];

    v12 = (void *)MEMORY[0x263F82F00];
    v27[0] = @"type";
    v27[1] = @"eventType";
    v28[0] = @"custom";
    v28[1] = &unk_26BDDEEF8;
    v27[2] = @"hapticParameters";
    v25 = @"volume";
    v13 = [NSNumber numberWithDouble:v6 * 0.6];
    v26 = v13;
    v14 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    v28[2] = v14;
    v15 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:3];
    v16 = [v12 feedbackWithDictionaryRepresentation:v15];

    v17 = [MEMORY[0x263F82EE0] defaultConfiguration];
    v18 = [v17 tweakedConfigurationForCaller:v2 usage:@"cameraOverlayHalfPress"];

    [v18 setInteractionStartedFeedback:v11];
    [v18 setInteractionEndedFeedback:v16];
    uint64_t v19 = [objc_alloc(MEMORY[0x263F82ED8]) initWithConfiguration:v18];
    halfPressFeedbackGenerator = v2->__halfPressFeedbackGenerator;
    v2->__halfPressFeedbackGenerator = (_UIButtonFeedbackGenerator *)v19;

    [(_UIButtonFeedbackGenerator *)v2->__halfPressFeedbackGenerator _setOutputMode:5];
    v21 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    activePairedFeedbackGenerators = v2->__activePairedFeedbackGenerators;
    v2->__activePairedFeedbackGenerators = v21;

    v2->_enabled = 1;
  }
  return v2;
}

- (void)reset
{
  [(CAMHalfPressContactRecognizer *)self _setHalfPressTimestamp:0.0];
  [(CAMHalfPressContactRecognizer *)self _setAccumulatedDeltaSinceLastHalfPress:0.0];
  [(CAMHalfPressContactRecognizer *)self _setLastPressWasDoubleHalfPress:0];
  [(CAMHalfPressContactRecognizer *)self _setHalfPressIncurredFullPress:0];
}

- (void)contactBeganWithAction:(id)a3
{
  if ([(CAMHalfPressContactRecognizer *)self enabled])
  {
    id v4 = [(CAMHalfPressContactRecognizer *)self _halfPressFeedbackGenerator];
    [v4 prepare];
  }
}

- (void)contactUpdatedWithAction:(id)a3
{
  id v4 = a3;
  if ([(CAMHalfPressContactRecognizer *)self enabled])
  {
    float v5 = [v4 _contact];
    float v6 = [(CAMHalfPressContactRecognizer *)self _halfPressFeedbackGenerator];
    v7 = [(CAMHalfPressContactRecognizer *)self _activePairedFeedbackGenerators];
    v8 = +[CAMCaptureCapabilities capabilities];
    v51 = v6;
    if ([v8 allowHalfPressSimulation])
    {
      uint64_t v9 = [v4 _button];

      if (v9 == 2)
      {
        if ([v7 containsObject:v6])
        {
          v10 = os_log_create("com.apple.camera.overlay", "Angel");
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEFAULT, "CAMHalfPressContactRecognizer is trying start a haptic that was previously started", buf, 2u);
          }
        }
        else
        {
          [v6 userInteractionStarted];
          [v7 addObject:v6];
        }
        int v11 = 1;
LABEL_12:
        v12 = v7;
        [(CAMHalfPressContactRecognizer *)self _halfPressTimestamp];
        if (v13 != 0.0)
        {
          [v5 positionDelta];
          CEKExpandNormalizedContactPoint();
          double v15 = fabs(v14);
          [(CAMHalfPressContactRecognizer *)self _accumulatedDeltaSinceLastHalfPress];
          [(CAMHalfPressContactRecognizer *)self _setAccumulatedDeltaSinceLastHalfPress:v16 + v15];
        }
        unint64_t v17 = [v4 _stagePhase];
        BOOL v18 = (v17 & 7) == 0 && v17 < 3;
        BOOL v19 = (v17 & 7) == 2 && v17 < 3;
        unint64_t v20 = [v4 _stage];
        unint64_t v21 = [v4 _numberOfStages];
        unsigned int v22 = [v5 isTouching];
        if (v21 > 1)
        {
          if (v20 <= 3)
          {
            if (v20 == 3)
            {
              uint64_t v23 = 3;
            }
            else if (v20 <= 1)
            {
              if (v20 == 1) {
                uint64_t v23 = 1;
              }
              else {
                uint64_t v23 = v22;
              }
            }
            else
            {
              uint64_t v23 = 2;
            }
          }
          else
          {
            uint64_t v23 = 4;
          }
        }
        else
        {
          uint64_t v23 = 4 * (v20 != 0);
        }
        BOOL v24 = v23 == 2 && v18;
        if (v23 != 4) {
          BOOL v18 = 0;
        }
        [v4 _timestamp];
        double v26 = v25;
        if (v18)
        {
          [(CAMHalfPressContactRecognizer *)self _setHalfPressIncurredFullPress:1];
          [(CAMHalfPressContactRecognizer *)self _setHalfPressTimestamp:0.0];
          [(CAMHalfPressContactRecognizer *)self _setAccumulatedDeltaSinceLastHalfPress:0.0];
          v27 = [(CAMHalfPressContactRecognizer *)self delegate];
          [v27 halfPressContactRecognizerSingleHalfPressDidCancel:self timestamp:v26];

          v28 = v12;
          v29 = v51;
          goto LABEL_66;
        }
        BOOL v30 = v23 == 2 && v19;
        if ((v11 | v30) != 1)
        {
          if (v24)
          {
            v28 = v12;
            v31 = v12;
            v29 = v51;
            if ([v31 containsObject:v51])
            {
              v32 = os_log_create("com.apple.camera.overlay", "Angel");
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v53 = 0;
                _os_log_impl(&dword_2099F8000, v32, OS_LOG_TYPE_DEFAULT, "CAMHalfPressContactRecognizer is trying start a haptic that was previously started", v53, 2u);
              }
            }
            else
            {
              [v51 userInteractionStarted];
              [v28 addObject:v51];
            }
            v39 = [(CAMHalfPressContactRecognizer *)self delegate];
            [v39 halfPressContactRecognizerSingleHalfPressDidBegin:self timestamp:v26];

            goto LABEL_66;
          }
          v28 = v12;
          v29 = v51;
          if (v17 < 3)
          {
LABEL_66:

            goto LABEL_67;
          }
          v35 = [(CAMHalfPressContactRecognizer *)self delegate];
          [v35 halfPressContactRecognizerSingleHalfPressDidCancel:self timestamp:v26];

          if ([v28 containsObject:v51])
          {
            [v51 userInteractionCancelled];
            goto LABEL_55;
          }
          v36 = os_log_create("com.apple.camera.overlay", "Angel");
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v52 = 0;
            v37 = "CAMHalfPressContactRecognizer is trying cancel a haptic that wasn't started";
            v38 = (uint8_t *)&v52;
            goto LABEL_61;
          }
LABEL_62:

          goto LABEL_63;
        }
        if ([(CAMHalfPressContactRecognizer *)self _halfPressIncurredFullPress])
        {
          [(CAMHalfPressContactRecognizer *)self _setHalfPressIncurredFullPress:0];
        }
        else
        {
          [(CAMHalfPressContactRecognizer *)self _halfPressTimestamp];
          if (v33 != 0.0
            && ![(CAMHalfPressContactRecognizer *)self _lastPressWasDoubleHalfPress])
          {
            CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"systemOverlay.menuToggleMaxIntervalMilliseconds", @"com.apple.camera", 0);
            if (AppIntegerValue <= 0) {
              double v41 = 500.0;
            }
            else {
              double v41 = (double)AppIntegerValue;
            }
            [(CAMHalfPressContactRecognizer *)self _halfPressTimestamp];
            double v43 = v26 * 1000.0 - v42 * 1000.0;
            unsigned __int8 v55 = 0;
            +[CAMPreferencesUtilities doubleForKey:@"systemOverlay.maxAllowedDoubleHalfPressDelta" applicationID:@"com.apple.camera" keyIsValidAndExists:&v55];
            double v45 = v44;
            int v46 = v55;
            [(CAMHalfPressContactRecognizer *)self _accumulatedDeltaSinceLastHalfPress];
            if (v43 > v41) {
              goto LABEL_78;
            }
            float v48 = v45;
            double v49 = v48;
            if (!v46) {
              double v49 = 2.0;
            }
            if (v47 >= v49)
            {
LABEL_78:
              [(CAMHalfPressContactRecognizer *)self _setHalfPressTimestamp:v26];
              v50 = [(CAMHalfPressContactRecognizer *)self delegate];
              [v50 halfPressContactRecognizerSingleHalfPressDidEnd:self timestamp:v26];
            }
            else
            {
              [(CAMHalfPressContactRecognizer *)self _setHalfPressTimestamp:v26];
              [(CAMHalfPressContactRecognizer *)self _setLastPressWasDoubleHalfPress:1];
              v50 = [(CAMHalfPressContactRecognizer *)self delegate];
              [v50 halfPressContactRecognizerDoubleHalfPressDidEnd:self timestamp:v26];
            }
            v28 = v12;

LABEL_53:
            v29 = v51;
            if ([v28 containsObject:v51])
            {
              [v51 userInteractionEnded];
LABEL_55:
              [v28 removeObject:v29];
LABEL_63:
              [(CAMHalfPressContactRecognizer *)self _setAccumulatedDeltaSinceLastHalfPress:0.0];
              goto LABEL_66;
            }
            v36 = os_log_create("com.apple.camera.overlay", "Angel");
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v54 = 0;
              v37 = "CAMHalfPressContactRecognizer is trying end a haptic that wasn't started";
              v38 = v54;
LABEL_61:
              _os_log_impl(&dword_2099F8000, v36, OS_LOG_TYPE_DEFAULT, v37, v38, 2u);
              goto LABEL_62;
            }
            goto LABEL_62;
          }
          [(CAMHalfPressContactRecognizer *)self _setHalfPressTimestamp:v26];
          [(CAMHalfPressContactRecognizer *)self _setLastPressWasDoubleHalfPress:0];
          v34 = [(CAMHalfPressContactRecognizer *)self delegate];
          [v34 halfPressContactRecognizerSingleHalfPressDidEnd:self timestamp:v26];
        }
        v28 = v12;
        goto LABEL_53;
      }
    }
    else
    {
    }
    int v11 = 0;
    goto LABEL_12;
  }
LABEL_67:
}

- (CAMHalfPressContactRecognizerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMHalfPressContactRecognizerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (_UIButtonFeedbackGenerator)_halfPressFeedbackGenerator
{
  return self->__halfPressFeedbackGenerator;
}

- (double)_halfPressTimestamp
{
  return self->__halfPressTimestamp;
}

- (void)_setHalfPressTimestamp:(double)a3
{
  self->__halfPressTimestamp = a3;
}

- (double)_accumulatedDeltaSinceLastHalfPress
{
  return self->__accumulatedDeltaSinceLastHalfPress;
}

- (void)_setAccumulatedDeltaSinceLastHalfPress:(double)a3
{
  self->__accumulatedDeltaSinceLastHalfPress = a3;
}

- (BOOL)_lastPressWasDoubleHalfPress
{
  return self->__lastPressWasDoubleHalfPress;
}

- (void)_setLastPressWasDoubleHalfPress:(BOOL)a3
{
  self->__lastPressWasDoubleHalfPress = a3;
}

- (BOOL)_halfPressIncurredFullPress
{
  return self->__halfPressIncurredFullPress;
}

- (void)_setHalfPressIncurredFullPress:(BOOL)a3
{
  self->__halfPressIncurredFullPress = a3;
}

- (NSMutableSet)_activePairedFeedbackGenerators
{
  return self->__activePairedFeedbackGenerators;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__activePairedFeedbackGenerators, 0);
  objc_storeStrong((id *)&self->__halfPressFeedbackGenerator, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end