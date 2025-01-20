@interface CCUIFlashlightModuleViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)shouldBeginTransitionToExpandedContentModule;
- (BOOL)shouldFinishTransitionToExpandedContentModule;
- (CCUIFlashlightModuleViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)createSliderView;
- (id)sliderView;
- (void)_sliderValueDidChange:(id)a3;
- (void)_updateControls;
- (void)_updateSliderValue;
- (void)buttonTapped:(id)a3 forEvent:(id)a4;
- (void)flashlightAvailabilityDidChange:(BOOL)a3;
- (void)flashlightLevelDidChange:(unint64_t)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation CCUIFlashlightModuleViewController

- (CCUIFlashlightModuleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CCUIFlashlightModuleViewController;
  v4 = [(CCUIButtonModuleViewController *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    if ([MEMORY[0x263F796B8] deviceSupportsFlashlight])
    {
      uint64_t v5 = [MEMORY[0x263F796B8] sharedInstance];
      flashlight = v4->_flashlight;
      v4->_flashlight = (SBUIFlashlightController *)v5;
    }
    [(SBUIFlashlightController *)v4->_flashlight addObserver:v4];
  }
  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIFlashlightModuleViewController;
  [(CCUIFlashlightModuleViewController *)&v4 viewWillAppear:a3];
  [(CCUIFlashlightModuleViewController *)self _updateControls];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIFlashlightModuleViewController;
  [(CCUIFlashlightModuleViewController *)&v4 viewDidDisappear:a3];
  if (![(SBUIFlashlightController *)self->_flashlight level]) {
    [(SBUIFlashlightController *)self->_flashlight coolDown];
  }
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIFlashlightModuleViewController;
  [(CCUISliderButtonModuleViewController *)&v4 viewDidLoad];
  v3 = [(CCUIFlashlightModuleViewController *)self sliderView];
  [v3 setNumberOfSteps:5];
  [v3 setFirstStepIsOff:1];
  [v3 addTarget:self action:sel__sliderValueDidChange_ forControlEvents:4096];
  [(CCUIFlashlightModuleViewController *)self _updateControls];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CCUIFlashlightModuleViewController;
  [(CCUISliderButtonModuleViewController *)&v3 viewWillLayoutSubviews];
  [(CCUIFlashlightModuleViewController *)self _updateSliderValue];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)sliderView
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIFlashlightModuleViewController;
  v2 = [(CCUISliderButtonModuleViewController *)&v4 sliderView];

  return v2;
}

- (id)createSliderView
{
  id v3 = objc_alloc(MEMORY[0x263F33CE0]);
  objc_super v4 = [(CCUIFlashlightModuleViewController *)self view];
  [v4 bounds];
  uint64_t v5 = objc_msgSend(v3, "initWithFrame:");

  return v5;
}

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
  [(CCUIButtonModuleViewController *)self setSelected:[(SBUIFlashlightController *)self->_flashlight isAvailable] & ~[(CCUIButtonModuleViewController *)self isSelected]];
  BOOL v5 = [(CCUIButtonModuleViewController *)self isSelected];
  flashlight = self->_flashlight;
  if (v5)
  {
    MEMORY[0x270F9A6D0](flashlight, sel_turnFlashlightOnForReason_);
  }
  else
  {
    MEMORY[0x270F9A6D0](flashlight, sel_turnFlashlightOffForReason_);
  }
}

- (BOOL)shouldBeginTransitionToExpandedContentModule
{
  int v3 = [(SBUIFlashlightController *)self->_flashlight isAvailable];
  if (v3) {
    LOBYTE(v3) = [(SBUIFlashlightController *)self->_flashlight deviceSupportsDynamicFlashlightInterface] ^ 1;
  }
  return v3;
}

- (BOOL)shouldFinishTransitionToExpandedContentModule
{
  return [(SBUIFlashlightController *)self->_flashlight isAvailable];
}

- (void)flashlightLevelDidChange:(unint64_t)a3
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);

  [(CCUIFlashlightModuleViewController *)self _updateControls];
}

- (void)flashlightAvailabilityDidChange:(BOOL)a3
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  [(CCUIFlashlightModuleViewController *)self _updateControls];
  if (([(SBUIFlashlightController *)self->_flashlight isAvailable] & 1) == 0)
  {
    objc_super v4 = [(CCUIButtonModuleViewController *)self buttonView];
    [v4 cancelTouchTracking];

    if ([(CCUIButtonModuleViewController *)self isExpanded])
    {
      MEMORY[0x270F9A6D0](self, sel_dismissViewControllerAnimated_completion_);
    }
  }
}

- (void)_sliderValueDidChange:(id)a3
{
  flashlight = self->_flashlight;
  [a3 step];

  MEMORY[0x270F9A6D0](flashlight, sel_setLevel_);
}

- (void)_updateSliderValue
{
  if ([(CCUIButtonModuleViewController *)self isExpanded])
  {
    id v5 = [(CCUIFlashlightModuleViewController *)self sliderView];
    if ([(CCUIButtonModuleViewController *)self isSelected]
      && [(SBUIFlashlightController *)self->_flashlight isAvailable])
    {
      uint64_t v3 = [(SBUIFlashlightController *)self->_flashlight level];
      if ((unint64_t)(v3 - 1) < 4) {
        uint64_t v4 = v3 + 1;
      }
      else {
        uint64_t v4 = 1;
      }
    }
    else
    {
      uint64_t v4 = 1;
    }
    [v5 setStep:v4];
  }
}

- (void)_updateControls
{
  uint64_t v3 = [(SBUIFlashlightController *)self->_flashlight isAvailable];
  if ([(SBUIFlashlightController *)self->_flashlight level]) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = [(CCUIButtonModuleViewController *)self buttonView];
  [v5 setEnabled:v3];

  v6 = [(CCUIFlashlightModuleViewController *)self sliderView];
  [v6 setEnabled:v3];

  [(CCUIButtonModuleViewController *)self setSelected:v4];

  [(CCUIFlashlightModuleViewController *)self _updateSliderValue];
}

- (void).cxx_destruct
{
}

@end