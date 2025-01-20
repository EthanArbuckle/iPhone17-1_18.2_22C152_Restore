@interface HUEventCreationUIFlow
- (BOOL)characteristicServicePickerViewControllerAllowChangingCharacteristic:(id)a3;
- (BOOL)modalInPresentation;
- (HUEventCreationUIFlow)initWithTriggerBuilder:(id)a3 eventBuilderItem:(id)a4;
- (UINavigationController)navigationController;
- (id)_emptyConfigurationInitialStep;
- (id)_initialStepForEventType:(unint64_t)a3;
- (id)_summaryStepForEventType:(unint64_t)a3;
- (id)_viewControllerForStep:(id)a3;
- (void)setModalInPresentation:(BOOL)a3;
- (void)setNavigationController:(id)a3;
- (void)setupNavigationController;
- (void)transitionToViewController:(id)a3;
@end

@implementation HUEventCreationUIFlow

- (HUEventCreationUIFlow)initWithTriggerBuilder:(id)a3 eventBuilderItem:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)HUEventCreationUIFlow;
  result = [(HUEventUIFlow *)&v5 initWithTriggerBuilder:a3 eventBuilderItem:a4];
  if (result) {
    result->_modalInPresentation = 0;
  }
  return result;
}

- (void)setupNavigationController
{
  [(HUEventUIFlow *)self _updateEventTypeFromBuilder];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__HUEventCreationUIFlow_setupNavigationController__block_invoke;
  v7[3] = &unk_1E6387F48;
  v7[4] = self;
  v3 = __50__HUEventCreationUIFlow_setupNavigationController__block_invoke((uint64_t)v7);
  v4 = [(HUEventCreationUIFlow *)self _viewControllerForStep:v3];
  if (v4)
  {
    objc_super v5 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v4];
    [(HUEventCreationUIFlow *)self setNavigationController:v5];

    v6 = [(HUEventCreationUIFlow *)self navigationController];
    [v6 setModalPresentationStyle:2];
  }
  else
  {
    NSLog(&cfstr_TriedToSetupNa.isa, v3);
  }
}

id __50__HUEventCreationUIFlow_setupNavigationController__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) eventBuilderItem];

  v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 eventType];
  if (v2)
  {
    objc_super v5 = [v3 _summaryStepForEventType:v4];
  }
  else
  {
    v6 = *(void **)(a1 + 32);
    if (v4) {
      objc_msgSend(v6, "_initialStepForEventType:", objc_msgSend(v6, "eventType", v4));
    }
    else {
    objc_super v5 = [v6 _emptyConfigurationInitialStep];
    }
  }

  return v5;
}

- (BOOL)characteristicServicePickerViewControllerAllowChangingCharacteristic:(id)a3
{
  return 0;
}

- (void)transitionToViewController:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(HUEventCreationUIFlow *)self navigationController];
  id v5 = (id)objc_msgSend(v4, "hu_pushPreloadableViewController:animated:", v6, 1);
}

- (id)_viewControllerForStep:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HUEventCreationUIFlow;
  id v4 = a3;
  id v5 = [(HUEventUIFlow *)&v8 _viewControllerForStep:v4];
  char v6 = objc_msgSend(v4, "isEqualToString:", @"typePicker", v8.receiver, v8.super_class);

  if ((v6 & 1) == 0) {
    objc_msgSend(v5, "setModalInPresentation:", -[HUEventCreationUIFlow modalInPresentation](self, "modalInPresentation"));
  }

  return v5;
}

- (id)_emptyConfigurationInitialStep
{
  return @"typePicker";
}

- (id)_summaryStepForEventType:(unint64_t)a3
{
  if (a3 <= 5) {
    self = *off_1E638B958[a3];
  }
  return self;
}

- (id)_initialStepForEventType:(unint64_t)a3
{
  if (a3 == 5)
  {
    uint64_t v3 = HUEventUIFlowStepAlarmPicker;
    goto LABEL_5;
  }
  if (a3 == 4)
  {
    uint64_t v3 = HUEventUIFlowStepAccessoryPicker;
LABEL_5:
    id v4 = *v3;
    goto LABEL_7;
  }
  -[HUEventCreationUIFlow _summaryStepForEventType:](self, "_summaryStepForEventType:");
  id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v4;
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (BOOL)modalInPresentation
{
  return self->_modalInPresentation;
}

- (void)setModalInPresentation:(BOOL)a3
{
  self->_modalInPresentation = a3;
}

- (void).cxx_destruct
{
}

@end