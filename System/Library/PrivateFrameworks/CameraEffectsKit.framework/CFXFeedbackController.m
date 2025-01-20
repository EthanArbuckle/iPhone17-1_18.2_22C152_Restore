@interface CFXFeedbackController
- (CFXFeedbackController)init;
- (CFXFeedbackController)initWithShutterButton:(id)a3;
- (CUShutterButton)shutterButton;
- (NSMutableSet)_activePairedFeedbackGenerators;
- (_UIButtonFeedbackGenerator)_shutterButtonLatchingOffFeedbackGenerator;
- (_UIButtonFeedbackGenerator)_shutterButtonLatchingOnFeedbackGenerator;
- (_UIButtonFeedbackGenerator)_shutterButtonMomentaryFeedbackGenerator;
- (id)_debugStringForPairedFeedback:(unint64_t)a3;
- (id)_feedbackGeneratorForPairedFeedback:(unint64_t)a3;
- (unint64_t)feedbackToPerform;
- (unint64_t)shutterButtonFeedbackForCurrentConfiguration;
- (void)performPressButtonFeedback:(unint64_t)a3;
- (void)performReleaseButtonFeedback:(unint64_t)a3;
- (void)prepareButtonFeedback:(unint64_t)a3;
- (void)setFeedbackToPerform:(unint64_t)a3;
- (void)shutterButtonDown:(id)a3;
- (void)shutterButtonUp:(id)a3;
@end

@implementation CFXFeedbackController

- (CFXFeedbackController)initWithShutterButton:(id)a3
{
  id v5 = a3;
  v6 = [(CFXFeedbackController *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_shutterButton, a3);
    [v5 addTarget:v7 action:sel_shutterButtonDown_ forControlEvents:1];
    [v5 addTarget:v7 action:sel_shutterButtonUp_ forControlEvents:64];
    [(CFXFeedbackController *)v7 setFeedbackToPerform:[(CFXFeedbackController *)v7 shutterButtonFeedbackForCurrentConfiguration]];
    [(CFXFeedbackController *)v7 prepareButtonFeedback:[(CFXFeedbackController *)v7 feedbackToPerform]];
  }

  return v7;
}

- (void)shutterButtonDown:(id)a3
{
  [(CFXFeedbackController *)self setFeedbackToPerform:[(CFXFeedbackController *)self shutterButtonFeedbackForCurrentConfiguration]];
  unint64_t v4 = [(CFXFeedbackController *)self feedbackToPerform];
  [(CFXFeedbackController *)self performPressButtonFeedback:v4];
}

- (void)shutterButtonUp:(id)a3
{
  [(CFXFeedbackController *)self performReleaseButtonFeedback:[(CFXFeedbackController *)self feedbackToPerform]];
  [(CFXFeedbackController *)self setFeedbackToPerform:[(CFXFeedbackController *)self shutterButtonFeedbackForCurrentConfiguration]];
  unint64_t v4 = [(CFXFeedbackController *)self feedbackToPerform];
  [(CFXFeedbackController *)self prepareButtonFeedback:v4];
}

- (unint64_t)shutterButtonFeedbackForCurrentConfiguration
{
  v2 = [(CFXFeedbackController *)self shutterButton];
  uint64_t v3 = [v2 mode];

  if (v3 == 6) {
    return 2;
  }
  else {
    return v3 == 1;
  }
}

- (CFXFeedbackController)init
{
  uint64_t v3 = [MEMORY[0x263F30780] capabilities];
  int v4 = [v3 allowHaptics];

  if (v4
    && (v23.receiver = self,
        v23.super_class = (Class)CFXFeedbackController,
        (self = [(CFXFeedbackController *)&v23 init]) != 0))
  {
    id v5 = [MEMORY[0x263F1CC68] feedbackWithDictionaryRepresentation:&unk_26E802108];
    v6 = [MEMORY[0x263F1CC68] feedbackWithDictionaryRepresentation:&unk_26E802158];
    v7 = [MEMORY[0x263F1CC18] defaultConfiguration];
    v8 = [v7 tweakedConfigurationForCaller:self usage:@"shutterButtonMomentary"];

    [v8 setInteractionStartedFeedback:v5];
    [v8 setInteractionEndedFeedback:v5];
    v9 = (_UIButtonFeedbackGenerator *)[objc_alloc(MEMORY[0x263F1CC10]) initWithConfiguration:v8];
    shutterButtonMomentaryFeedbackGenerator = self->__shutterButtonMomentaryFeedbackGenerator;
    self->__shutterButtonMomentaryFeedbackGenerator = v9;

    [(_UIButtonFeedbackGenerator *)self->__shutterButtonMomentaryFeedbackGenerator _setOutputMode:5];
    v11 = [MEMORY[0x263F1CC18] defaultConfiguration];
    v12 = [v11 tweakedConfigurationForCaller:self usage:@"shutterButtonLatchingOn"];

    [v12 setInteractionStartedFeedback:v5];
    [v12 setInteractionEndedFeedback:v6];
    v13 = (_UIButtonFeedbackGenerator *)[objc_alloc(MEMORY[0x263F1CC10]) initWithConfiguration:v12];
    shutterButtonLatchingOnFeedbackGenerator = self->__shutterButtonLatchingOnFeedbackGenerator;
    self->__shutterButtonLatchingOnFeedbackGenerator = v13;

    [(_UIButtonFeedbackGenerator *)self->__shutterButtonLatchingOnFeedbackGenerator _setOutputMode:5];
    v15 = [MEMORY[0x263F1CC18] defaultConfiguration];
    v16 = [v15 tweakedConfigurationForCaller:self usage:@"shutterButtonLatchingOff"];

    [v16 setInteractionStartedFeedback:v6];
    [v16 setInteractionEndedFeedback:v5];
    v17 = (_UIButtonFeedbackGenerator *)[objc_alloc(MEMORY[0x263F1CC10]) initWithConfiguration:v16];
    shutterButtonLatchingOffFeedbackGenerator = self->__shutterButtonLatchingOffFeedbackGenerator;
    self->__shutterButtonLatchingOffFeedbackGenerator = v17;

    [(_UIButtonFeedbackGenerator *)self->__shutterButtonLatchingOffFeedbackGenerator _setOutputMode:5];
    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    activePairedFeedbackGenerators = self->__activePairedFeedbackGenerators;
    self->__activePairedFeedbackGenerators = v19;

    self = self;
    v21 = self;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)prepareButtonFeedback:(unint64_t)a3
{
  id v3 = [(CFXFeedbackController *)self _feedbackGeneratorForPairedFeedback:a3];
  [v3 prepare];
}

- (void)performPressButtonFeedback:(unint64_t)a3
{
  id v5 = -[CFXFeedbackController _feedbackGeneratorForPairedFeedback:](self, "_feedbackGeneratorForPairedFeedback:");
  v6 = [(CFXFeedbackController *)self _activePairedFeedbackGenerators];
  if ([v6 containsObject:v5])
  {
    v7 = CFXLog_DebugFeedback();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[CFXFeedbackController performPressButtonFeedback:](self, a3);
    }
  }
  else
  {
    [v5 userInteractionStarted];
    [v6 addObject:v5];
  }
}

- (void)performReleaseButtonFeedback:(unint64_t)a3
{
  id v5 = -[CFXFeedbackController _feedbackGeneratorForPairedFeedback:](self, "_feedbackGeneratorForPairedFeedback:");
  v6 = [(CFXFeedbackController *)self _activePairedFeedbackGenerators];
  if ([v6 containsObject:v5])
  {
    [v5 userInteractionEnded];
    [v6 removeObject:v5];
  }
  else
  {
    v7 = CFXLog_DebugFeedback();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[CFXFeedbackController performReleaseButtonFeedback:](self, a3);
    }
  }
}

- (id)_feedbackGeneratorForPairedFeedback:(unint64_t)a3
{
  if (a3 == 2)
  {
    id v3 = [(CFXFeedbackController *)self _shutterButtonLatchingOffFeedbackGenerator];
  }
  else if (a3 == 1)
  {
    id v3 = [(CFXFeedbackController *)self _shutterButtonLatchingOnFeedbackGenerator];
  }
  else if (a3)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [(CFXFeedbackController *)self _shutterButtonMomentaryFeedbackGenerator];
  }
  return v3;
}

- (id)_debugStringForPairedFeedback:(unint64_t)a3
{
  if (a3 > 2) {
    return &stru_26E7CDB50;
  }
  else {
    return off_264C0C810[a3];
  }
}

- (_UIButtonFeedbackGenerator)_shutterButtonLatchingOnFeedbackGenerator
{
  return self->__shutterButtonLatchingOnFeedbackGenerator;
}

- (_UIButtonFeedbackGenerator)_shutterButtonLatchingOffFeedbackGenerator
{
  return self->__shutterButtonLatchingOffFeedbackGenerator;
}

- (_UIButtonFeedbackGenerator)_shutterButtonMomentaryFeedbackGenerator
{
  return self->__shutterButtonMomentaryFeedbackGenerator;
}

- (NSMutableSet)_activePairedFeedbackGenerators
{
  return self->__activePairedFeedbackGenerators;
}

- (CUShutterButton)shutterButton
{
  return self->_shutterButton;
}

- (unint64_t)feedbackToPerform
{
  return self->_feedbackToPerform;
}

- (void)setFeedbackToPerform:(unint64_t)a3
{
  self->_feedbackToPerform = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shutterButton, 0);
  objc_storeStrong((id *)&self->__activePairedFeedbackGenerators, 0);
  objc_storeStrong((id *)&self->__shutterButtonMomentaryFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->__shutterButtonLatchingOffFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->__shutterButtonLatchingOnFeedbackGenerator, 0);
}

- (void)performPressButtonFeedback:(void *)a1 .cold.1(void *a1, uint64_t a2)
{
  v2 = [a1 _debugStringForPairedFeedback:a2];
  OUTLINED_FUNCTION_0_0(&dword_234C41000, v3, v4, "Mismatched paired pressed feedback calls for %{public}@", v5, v6, v7, v8, 2u);
}

- (void)performReleaseButtonFeedback:(void *)a1 .cold.1(void *a1, uint64_t a2)
{
  v2 = [a1 _debugStringForPairedFeedback:a2];
  OUTLINED_FUNCTION_0_0(&dword_234C41000, v3, v4, "Mismatched paired released feedback calls for %{public}@", v5, v6, v7, v8, 2u);
}

@end