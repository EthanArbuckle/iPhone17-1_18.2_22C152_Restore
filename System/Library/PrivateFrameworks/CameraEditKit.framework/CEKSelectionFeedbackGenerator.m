@interface CEKSelectionFeedbackGenerator
- (CEKSelectionFeedbackGenerator)init;
- (UISelectionFeedbackGenerator)_feedbackGenerator;
- (int64_t)profile;
- (unsigned)_endStopSoundID;
- (unsigned)_majorTickSoundID;
- (unsigned)_minorTickSoundID;
- (unsigned)_overscrollTickSoundID;
- (void)_updateFeedbackGeneratorIfNeeded;
- (void)dealloc;
- (void)performFeedback;
- (void)playEndTickSound;
- (void)playMajorTickSound;
- (void)playMinorTickSound;
- (void)playOverscrollTickSound;
- (void)prepareFeedback;
- (void)setProfile:(int64_t)a3;
@end

@implementation CEKSelectionFeedbackGenerator

- (CEKSelectionFeedbackGenerator)init
{
  if (CEKHapticsAllowed_onceToken != -1) {
    dispatch_once(&CEKHapticsAllowed_onceToken, &__block_literal_global_0);
  }
  if (CEKHapticsAllowed_allowsHaptics)
  {
    v24.receiver = self;
    v24.super_class = (Class)CEKSelectionFeedbackGenerator;
    v3 = [(CEKSelectionFeedbackGenerator *)&v24 init];
    v4 = (SystemSoundID *)v3;
    if (v3)
    {
      v3->_profile = 0;
      v5 = CEKFrameworkBundle();
      CFURLRef v6 = [v5 URLForResource:@"CEKEndStopTick" withExtension:@"wav"];

      v7 = CEKFrameworkBundle();
      CFURLRef v8 = [v7 URLForResource:@"CEKFullStopTick" withExtension:@"wav"];

      v9 = CEKFrameworkBundle();
      CFURLRef v10 = [v9 URLForResource:@"CEKThirdStopTick" withExtension:@"wav"];

      v11 = CEKFrameworkBundle();
      CFURLRef v12 = [v11 URLForResource:@"CEKOverscrollStopTick" withExtension:@"wav"];

      v13 = v4 + 2;
      CFURLRef v23 = v6;
      LODWORD(v6) = AudioServicesCreateSystemSoundID(v6, v4 + 2);
      v14 = v4 + 3;
      CFURLRef v22 = v8;
      OSStatus SystemSoundID = AudioServicesCreateSystemSoundID(v8, v4 + 3);
      v16 = v4 + 4;
      OSStatus v17 = AudioServicesCreateSystemSoundID(v10, v4 + 4);
      v18 = v4 + 5;
      OSStatus v19 = AudioServicesCreateSystemSoundID(v12, v4 + 5);
      if (v6 || SystemSoundID || v17 || v19)
      {
        AudioServicesDisposeSystemSoundID(*v13);
        SystemSoundID *v13 = 0;
        AudioServicesDisposeSystemSoundID(*v14);
        SystemSoundID *v14 = 0;
        AudioServicesDisposeSystemSoundID(*v16);
        SystemSoundID *v16 = 0;
        AudioServicesDisposeSystemSoundID(*v18);
        SystemSoundID *v18 = 0;
      }
    }
    self = v4;
    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)dealloc
{
  AudioServicesDisposeSystemSoundID(self->__endStopSoundID);
  self->__endStopSoundID = 0;
  AudioServicesDisposeSystemSoundID(self->__majorTickSoundID);
  self->__majorTickSoundID = 0;
  AudioServicesDisposeSystemSoundID(self->__minorTickSoundID);
  self->__minorTickSoundID = 0;
  AudioServicesDisposeSystemSoundID(self->__overscrollTickSoundID);
  self->__overscrollTickSoundID = 0;
  v3.receiver = self;
  v3.super_class = (Class)CEKSelectionFeedbackGenerator;
  [(CEKSelectionFeedbackGenerator *)&v3 dealloc];
}

- (void)prepareFeedback
{
  [(CEKSelectionFeedbackGenerator *)self _updateFeedbackGeneratorIfNeeded];
  id v3 = [(CEKSelectionFeedbackGenerator *)self _feedbackGenerator];
  [v3 prepare];
}

- (void)performFeedback
{
  [(CEKSelectionFeedbackGenerator *)self _updateFeedbackGeneratorIfNeeded];
  id v3 = [(CEKSelectionFeedbackGenerator *)self _feedbackGenerator];
  [v3 selectionChanged];
}

- (void)setProfile:(int64_t)a3
{
  if (self->_profile != a3)
  {
    self->_profile = a3;
    self->__feedbackGenerator = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (void)playMinorTickSound
{
  SystemSoundID v2 = [(CEKSelectionFeedbackGenerator *)self _minorTickSoundID];
  AudioServicesPlaySystemSoundWithCompletion(v2, 0);
}

- (void)playMajorTickSound
{
  SystemSoundID v2 = [(CEKSelectionFeedbackGenerator *)self _majorTickSoundID];
  AudioServicesPlaySystemSoundWithCompletion(v2, 0);
}

- (void)playEndTickSound
{
  SystemSoundID v2 = [(CEKSelectionFeedbackGenerator *)self _endStopSoundID];
  AudioServicesPlaySystemSoundWithCompletion(v2, 0);
}

- (void)playOverscrollTickSound
{
  SystemSoundID v2 = [(CEKSelectionFeedbackGenerator *)self _overscrollTickSoundID];
  AudioServicesPlaySystemSoundWithCompletion(v2, 0);
}

- (void)_updateFeedbackGeneratorIfNeeded
{
  if (!self->__feedbackGenerator)
  {
    unint64_t v3 = [(CEKSelectionFeedbackGenerator *)self profile];
    if (v3 > 2) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = qword_1E63CD6A8[v3];
    }
    v5 = [MEMORY[0x1E4FB2290] defaultConfiguration];
    id v9 = [v5 tweakedConfigurationForCaller:self usage:@"cameraEffectSelection"];

    CFURLRef v6 = [MEMORY[0x1E4FB20B0] feedbackWithDictionaryRepresentation:v4];
    [v9 setFeedback:v6];

    v7 = (UISelectionFeedbackGenerator *)[objc_alloc(MEMORY[0x1E4FB1C18]) initWithConfiguration:v9];
    feedbackGenerator = self->__feedbackGenerator;
    self->__feedbackGenerator = v7;

    [(UISelectionFeedbackGenerator *)self->__feedbackGenerator _setOutputMode:5];
  }
}

- (int64_t)profile
{
  return self->_profile;
}

- (UISelectionFeedbackGenerator)_feedbackGenerator
{
  return self->__feedbackGenerator;
}

- (unsigned)_endStopSoundID
{
  return self->__endStopSoundID;
}

- (unsigned)_majorTickSoundID
{
  return self->__majorTickSoundID;
}

- (unsigned)_minorTickSoundID
{
  return self->__minorTickSoundID;
}

- (unsigned)_overscrollTickSoundID
{
  return self->__overscrollTickSoundID;
}

- (void).cxx_destruct
{
}

@end