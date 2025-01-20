@interface CAMFeedbackController
- (CAMFeedbackController)init;
- (NSMutableSet)_activePairedFeedbackGenerators;
- (UISelectionFeedbackGenerator)_burstCountFeedbackGenerator;
- (UISelectionFeedbackGenerator)_modeSelectionFeedbackGenerator;
- (_UIButtonFeedbackGenerator)_shutterButtonLatchingOffFeedbackGenerator;
- (_UIButtonFeedbackGenerator)_shutterButtonLatchingOnFeedbackGenerator;
- (_UIButtonFeedbackGenerator)_shutterButtonMomentaryFeedbackGenerator;
- (id)_debugStringForPairedFeedback:(unint64_t)a3;
- (id)_feedbackGeneratorForDiscreteFeedback:(unint64_t)a3;
- (id)_feedbackGeneratorForPairedFeedback:(unint64_t)a3;
- (void)performDiscreteFeedback:(unint64_t)a3;
- (void)performPressButtonFeedback:(unint64_t)a3;
- (void)performReleaseButtonFeedback:(unint64_t)a3;
- (void)prepareButtonFeedback:(unint64_t)a3;
- (void)prepareDiscreteFeedback:(unint64_t)a3;
@end

@implementation CAMFeedbackController

- (CAMFeedbackController)init
{
  v31.receiver = self;
  v31.super_class = (Class)CAMFeedbackController;
  v2 = [(CAMFeedbackController *)&v31 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F830C8] defaultConfiguration];
    v4 = [v3 tweakedConfigurationForCaller:v2 usage:@"modeSelection"];

    [v4 setMinimumInterval:0.01];
    v5 = [MEMORY[0x263F82F00] feedbackWithDictionaryRepresentation:&unk_26BDDF6F0];
    [v4 setFeedback:v5];

    uint64_t v6 = [objc_alloc(MEMORY[0x263F82BC0]) initWithConfiguration:v4];
    modeSelectionFeedbackGenerator = v2->__modeSelectionFeedbackGenerator;
    v2->__modeSelectionFeedbackGenerator = (UISelectionFeedbackGenerator *)v6;

    [(UISelectionFeedbackGenerator *)v2->__modeSelectionFeedbackGenerator _setOutputMode:5];
    v8 = [MEMORY[0x263F82F00] feedbackWithDictionaryRepresentation:&unk_26BDDF740];
    v9 = [MEMORY[0x263F82F00] feedbackWithDictionaryRepresentation:&unk_26BDDF790];
    v10 = [MEMORY[0x263F82EE0] defaultConfiguration];
    v11 = [v10 tweakedConfigurationForCaller:v2 usage:@"shutterButtonMomentary"];

    [v11 setInteractionStartedFeedback:v8];
    [v11 setInteractionEndedFeedback:v8];
    uint64_t v12 = [objc_alloc(MEMORY[0x263F82ED8]) initWithConfiguration:v11];
    shutterButtonMomentaryFeedbackGenerator = v2->__shutterButtonMomentaryFeedbackGenerator;
    v2->__shutterButtonMomentaryFeedbackGenerator = (_UIButtonFeedbackGenerator *)v12;

    [(_UIButtonFeedbackGenerator *)v2->__shutterButtonMomentaryFeedbackGenerator _setOutputMode:5];
    v14 = [MEMORY[0x263F82EE0] defaultConfiguration];
    v15 = [v14 tweakedConfigurationForCaller:v2 usage:@"shutterButtonLatchingOn"];

    [v15 setInteractionStartedFeedback:v8];
    [v15 setInteractionEndedFeedback:v9];
    uint64_t v16 = [objc_alloc(MEMORY[0x263F82ED8]) initWithConfiguration:v15];
    shutterButtonLatchingOnFeedbackGenerator = v2->__shutterButtonLatchingOnFeedbackGenerator;
    v2->__shutterButtonLatchingOnFeedbackGenerator = (_UIButtonFeedbackGenerator *)v16;

    [(_UIButtonFeedbackGenerator *)v2->__shutterButtonLatchingOnFeedbackGenerator _setOutputMode:5];
    v18 = [MEMORY[0x263F82EE0] defaultConfiguration];
    v19 = [v18 tweakedConfigurationForCaller:v2 usage:@"shutterButtonLatchingOff"];

    [v19 setInteractionStartedFeedback:v9];
    [v19 setInteractionEndedFeedback:v8];
    uint64_t v20 = [objc_alloc(MEMORY[0x263F82ED8]) initWithConfiguration:v19];
    shutterButtonLatchingOffFeedbackGenerator = v2->__shutterButtonLatchingOffFeedbackGenerator;
    v2->__shutterButtonLatchingOffFeedbackGenerator = (_UIButtonFeedbackGenerator *)v20;

    [(_UIButtonFeedbackGenerator *)v2->__shutterButtonLatchingOffFeedbackGenerator _setOutputMode:5];
    v22 = [MEMORY[0x263F830C8] defaultConfiguration];
    v23 = [v22 tweakedConfigurationForCaller:v2 usage:@"burstCount"];

    [v23 setMinimumInterval:0.005];
    v24 = [MEMORY[0x263F82F00] feedbackWithDictionaryRepresentation:&unk_26BDDF7E0];
    [v23 setFeedback:v24];

    uint64_t v25 = [objc_alloc(MEMORY[0x263F82BC0]) initWithConfiguration:v23];
    burstCountFeedbackGenerator = v2->__burstCountFeedbackGenerator;
    v2->__burstCountFeedbackGenerator = (UISelectionFeedbackGenerator *)v25;

    [(UISelectionFeedbackGenerator *)v2->__burstCountFeedbackGenerator _setOutputMode:5];
    v27 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    activePairedFeedbackGenerators = v2->__activePairedFeedbackGenerators;
    v2->__activePairedFeedbackGenerators = v27;

    v29 = v2;
  }

  return v2;
}

- (void)prepareDiscreteFeedback:(unint64_t)a3
{
  id v3 = [(CAMFeedbackController *)self _feedbackGeneratorForDiscreteFeedback:a3];
  [v3 prepare];
}

- (void)performDiscreteFeedback:(unint64_t)a3
{
  id v3 = [(CAMFeedbackController *)self _feedbackGeneratorForDiscreteFeedback:a3];
  [v3 selectionChanged];
}

- (void)prepareButtonFeedback:(unint64_t)a3
{
  id v3 = [(CAMFeedbackController *)self _feedbackGeneratorForPairedFeedback:a3];
  [v3 prepare];
}

- (void)performPressButtonFeedback:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v5 = -[CAMFeedbackController _feedbackGeneratorForPairedFeedback:](self, "_feedbackGeneratorForPairedFeedback:");
  uint64_t v6 = [(CAMFeedbackController *)self _activePairedFeedbackGenerators];
  if ([v6 containsObject:v5])
  {
    v7 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [(CAMFeedbackController *)self _debugStringForPairedFeedback:a3];
      int v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "Mismatched paired pressed feedback calls for %{public}@", (uint8_t *)&v9, 0xCu);
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
  uint64_t v11 = *MEMORY[0x263EF8340];
  v5 = -[CAMFeedbackController _feedbackGeneratorForPairedFeedback:](self, "_feedbackGeneratorForPairedFeedback:");
  uint64_t v6 = [(CAMFeedbackController *)self _activePairedFeedbackGenerators];
  if ([v6 containsObject:v5])
  {
    [v5 userInteractionEnded];
    [v6 removeObject:v5];
  }
  else
  {
    v7 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [(CAMFeedbackController *)self _debugStringForPairedFeedback:a3];
      int v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "Mismatched paired released feedback calls for %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (id)_feedbackGeneratorForDiscreteFeedback:(unint64_t)a3
{
  if (a3 == 1)
  {
    id v3 = [(CAMFeedbackController *)self _burstCountFeedbackGenerator];
  }
  else if (a3)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [(CAMFeedbackController *)self _modeSelectionFeedbackGenerator];
  }
  return v3;
}

- (id)_feedbackGeneratorForPairedFeedback:(unint64_t)a3
{
  if (a3 == 2)
  {
    id v3 = [(CAMFeedbackController *)self _shutterButtonLatchingOffFeedbackGenerator];
  }
  else if (a3 == 1)
  {
    id v3 = [(CAMFeedbackController *)self _shutterButtonLatchingOnFeedbackGenerator];
  }
  else if (a3)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [(CAMFeedbackController *)self _shutterButtonMomentaryFeedbackGenerator];
  }
  return v3;
}

- (id)_debugStringForPairedFeedback:(unint64_t)a3
{
  if (a3 > 2) {
    return &stru_26BD78BA0;
  }
  else {
    return off_263FA04C0[a3];
  }
}

- (UISelectionFeedbackGenerator)_modeSelectionFeedbackGenerator
{
  return self->__modeSelectionFeedbackGenerator;
}

- (UISelectionFeedbackGenerator)_burstCountFeedbackGenerator
{
  return self->__burstCountFeedbackGenerator;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__activePairedFeedbackGenerators, 0);
  objc_storeStrong((id *)&self->__shutterButtonMomentaryFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->__shutterButtonLatchingOffFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->__shutterButtonLatchingOnFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->__burstCountFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->__modeSelectionFeedbackGenerator, 0);
}

@end