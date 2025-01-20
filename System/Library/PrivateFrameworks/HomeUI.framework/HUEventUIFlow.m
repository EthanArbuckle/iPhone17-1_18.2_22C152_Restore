@interface HUEventUIFlow
- (BOOL)characteristicEditorAllowChangingCharacteristic:(id)a3;
- (BOOL)isFlowCompleteAfterStep:(id)a3;
- (BOOL)isPresentedModally;
- (BOOL)shouldSaveEventBuildersToTriggerBuilderForStep:(id)a3;
- (BOOL)shouldShowDoneButtonForStep:(id)a3;
- (BOOL)shouldShowNextButtonForStep:(id)a3;
- (Class)_viewControllerClassForStep:(id)a3;
- (HFEventBuilderItem)eventBuilderItem;
- (HFEventBuilderItem)originalEventBuilderItem;
- (HFEventTriggerBuilder)triggerBuilder;
- (HUEventUIFlow)initWithTriggerBuilder:(id)a3 eventBuilderItem:(id)a4;
- (HUEventUIFlowDelegate)delegate;
- (HUEventUIFlowPresentationController)presentationController;
- (id)_characteristicSelectionStepForEventType:(unint64_t)a3;
- (id)_createViewControllerWithClass:(Class)a3 step:(id)a4;
- (id)_emptyConfigurationInitialStep;
- (id)_initialEventBuilderItemForType:(unint64_t)a3;
- (id)_initialStepForEventType:(unint64_t)a3;
- (id)_stepFolowingStep:(id)a3;
- (id)_summaryStepForEventType:(unint64_t)a3;
- (id)_viewControllerForStep:(id)a3;
- (id)buildInitialViewController;
- (unint64_t)eventType;
- (unint64_t)viewController:(id)a3 servicePickerSourceForStep:(id)a4;
- (void)_presentViewControllerForStep:(id)a3;
- (void)_updateEventTypeFromBuilder;
- (void)characteristicEditorDidSelectToChangeCharacteristic:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEventBuilderItem:(id)a3;
- (void)setEventType:(unint64_t)a3;
- (void)setIsPresentedModally:(BOOL)a3;
- (void)setPresentationController:(id)a3;
- (void)setTriggerBuilder:(id)a3;
- (void)viewController:(id)a3 didCancelStepWithIdentifier:(id)a4;
- (void)viewController:(id)a3 didFinishStepWithIdentifier:(id)a4;
- (void)viewController:(id)a3 didSelectEventType:(unint64_t)a4;
@end

@implementation HUEventUIFlow

- (HUEventUIFlow)initWithTriggerBuilder:(id)a3 eventBuilderItem:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUEventUIFlow;
  v9 = [(HUEventUIFlow *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_triggerBuilder, a3);
    objc_storeStrong((id *)&v10->_originalEventBuilderItem, a4);
    objc_storeStrong((id *)&v10->_eventBuilderItem, a4);
    v10->_eventType = 0;
    v10->_isPresentedModally = 0;
    [(HUEventUIFlow *)v10 _updateEventTypeFromBuilder];
  }

  return v10;
}

- (void)viewController:(id)a3 didCancelStepWithIdentifier:(id)a4
{
  id v5 = [(HUEventUIFlow *)self delegate];
  [v5 eventFlowDidCancel:self];
}

- (void)viewController:(id)a3 didFinishStepWithIdentifier:(id)a4
{
  uint64_t v5 = [(HUEventUIFlow *)self _stepFolowingStep:a4];
  id v9 = (id)v5;
  if (v5)
  {
    [(HUEventUIFlow *)self _presentViewControllerForStep:v5];
  }
  else
  {
    v6 = [(HUEventUIFlow *)self eventBuilderItem];

    if (!v6) {
      NSLog(&cfstr_EventBuilderSh.isa);
    }
    id v7 = [(HUEventUIFlow *)self delegate];
    id v8 = [(HUEventUIFlow *)self eventBuilderItem];
    [v7 eventFlow:self didFinishWithEventBuilderItem:v8];
  }
}

- (BOOL)shouldShowDoneButtonForStep:(id)a3
{
  BOOL v4 = [(HUEventUIFlow *)self isFlowCompleteAfterStep:a3];
  if (v4)
  {
    LOBYTE(v4) = [(HUEventUIFlow *)self isPresentedModally];
  }
  return v4;
}

- (BOOL)isFlowCompleteAfterStep:(id)a3
{
  v3 = [(HUEventUIFlow *)self _stepFolowingStep:a3];
  BOOL v4 = v3 == 0;

  return v4;
}

- (BOOL)shouldShowNextButtonForStep:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HUEventUIFlow *)self isFlowCompleteAfterStep:v4])
  {
    BOOL v5 = 0;
  }
  else
  {
    v9[0] = @"alarmPicker";
    v9[1] = @"accessoryPicker";
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    if ([v6 containsObject:v4])
    {
      id v7 = [(HUEventUIFlow *)self originalEventBuilderItem];
      BOOL v5 = v7 == 0;
    }
    else
    {
      BOOL v5 = 1;
    }
  }
  return v5;
}

- (BOOL)shouldSaveEventBuildersToTriggerBuilderForStep:(id)a3
{
  v3 = [(HUEventUIFlow *)self originalEventBuilderItem];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)buildInitialViewController
{
  [(HUEventUIFlow *)self _updateEventTypeFromBuilder];
  v3 = [(HUEventUIFlow *)self eventBuilderItem];

  unint64_t v4 = [(HUEventUIFlow *)self eventType];
  if (v3)
  {
    uint64_t v5 = [(HUEventUIFlow *)self _summaryStepForEventType:v4];
  }
  else
  {
    if (v4) {
      [(HUEventUIFlow *)self _initialStepForEventType:[(HUEventUIFlow *)self eventType]];
    }
    else {
    uint64_t v5 = [(HUEventUIFlow *)self _emptyConfigurationInitialStep];
    }
  }
  v6 = (void *)v5;
  id v7 = [(HUEventUIFlow *)self _viewControllerForStep:v5];

  return v7;
}

- (void)viewController:(id)a3 didSelectEventType:(unint64_t)a4
{
  [(HUEventUIFlow *)self setEventType:a4];
  id v11 = [(HUEventUIFlow *)self _initialEventBuilderItemForType:a4];
  uint64_t v6 = [(HUEventUIFlow *)self eventBuilderItem];
  if (!v6
    || (id v7 = (void *)v6,
        uint64_t v8 = objc_opt_class(),
        [(HUEventUIFlow *)self eventBuilderItem],
        id v9 = objc_claimAutoreleasedReturnValue(),
        LOBYTE(v8) = [(id)v8 isEqual:objc_opt_class()],
        v9,
        v7,
        (v8 & 1) == 0))
  {
    [(HUEventUIFlow *)self setEventBuilderItem:v11];
  }
  v10 = [(HUEventUIFlow *)self _initialStepForEventType:a4];
  [(HUEventUIFlow *)self _presentViewControllerForStep:v10];
}

- (unint64_t)viewController:(id)a3 servicePickerSourceForStep:(id)a4
{
  return [a4 isEqualToString:@"alarmPicker"] ^ 1;
}

- (BOOL)characteristicEditorAllowChangingCharacteristic:(id)a3
{
  v3 = [(HUEventUIFlow *)self originalEventBuilderItem];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)characteristicEditorDidSelectToChangeCharacteristic:(id)a3
{
  [(HUEventUIFlow *)self _updateEventTypeFromBuilder];
  id v6 = [(HUEventUIFlow *)self _characteristicSelectionStepForEventType:[(HUEventUIFlow *)self eventType]];
  BOOL v4 = [(HUEventUIFlow *)self _viewControllerForStep:v6];
  uint64_t v5 = [(HUEventUIFlow *)self presentationController];
  [v5 transitionToViewController:v4];
}

- (id)_initialEventBuilderItemForType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      BOOL v4 = (objc_class *)MEMORY[0x1E4F69120];
      goto LABEL_6;
    case 1uLL:
    case 2uLL:
      BOOL v4 = (objc_class *)MEMORY[0x1E4F69248];
      goto LABEL_6;
    case 3uLL:
      BOOL v4 = (objc_class *)MEMORY[0x1E4F69690];
      goto LABEL_6;
    case 4uLL:
    case 5uLL:
      BOOL v4 = (objc_class *)MEMORY[0x1E4F69020];
LABEL_6:
      id v5 = [v4 alloc];
      id v6 = [MEMORY[0x1E4F1CAD0] set];
      v3 = (void *)[v5 initWithEventBuilders:v6];

      break;
    default:
      break;
  }

  return v3;
}

- (void)_updateEventTypeFromBuilder
{
  v3 = [(HUEventUIFlow *)self eventBuilderItem];

  if (v3)
  {
    BOOL v4 = [(HUEventUIFlow *)self eventBuilderItem];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v6 = [(HUEventUIFlow *)self eventBuilderItem];
    id v7 = v6;
    if (isKindOfClass)
    {
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F2E770], "hf_sensingCharacteristicTypes");
      id v9 = [v7 characteristics];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __44__HUEventUIFlow__updateEventTypeFromBuilder__block_invoke;
      v28[3] = &unk_1E6387020;
      id v29 = v8;
      id v10 = v8;
      int v11 = objc_msgSend(v9, "na_any:", v28);

      if (v11) {
        uint64_t v12 = 5;
      }
      else {
        uint64_t v12 = 4;
      }
      [(HUEventUIFlow *)self setEventType:v12];

LABEL_14:
      return;
    }
    v13 = [v6 eventBuilders];
    v14 = [v13 anyObject];
    int v15 = [v14 conformsToProtocol:&unk_1F1AD9390];

    if (v15)
    {
      v16 = self;
      uint64_t v17 = 3;
    }
    else
    {
      v18 = [(HUEventUIFlow *)self eventBuilderItem];
      v19 = [v18 eventBuilders];
      v20 = [v19 anyObject];
      int v21 = [v20 conformsToProtocol:&unk_1F1AD9210];

      if (v21)
      {
        v22 = [(HUEventUIFlow *)self eventBuilderItem];
        v23 = [v22 eventBuilders];
        v24 = [v23 anyObject];

        uint64_t v27 = MEMORY[0x1E4F143A8];
        id v7 = v24;
        uint64_t v25 = objc_msgSend(v7, "locationEventType", v27, 3221225472, __44__HUEventUIFlow__updateEventTypeFromBuilder__block_invoke_2, &unk_1E638C008);
        if (v25 == 1) {
          uint64_t v26 = 1;
        }
        else {
          uint64_t v26 = 2 * (v25 == 2);
        }
        [(HUEventUIFlow *)self setEventType:v26];

        goto LABEL_14;
      }
      v16 = self;
      uint64_t v17 = 0;
    }
    [(HUEventUIFlow *)v16 setEventType:v17];
  }
}

uint64_t __44__HUEventUIFlow__updateEventTypeFromBuilder__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 characteristicType];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

uint64_t __44__HUEventUIFlow__updateEventTypeFromBuilder__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) locationEventType];
  if (v1 == 1) {
    return 1;
  }
  else {
    return 2 * (v1 == 2);
  }
}

- (id)_emptyConfigurationInitialStep
{
  return @"typePicker";
}

- (id)_summaryStepForEventType:(unint64_t)a3
{
  if (a3 > 3) {
    return @"characteristicEventEditor";
  }
  else {
    return off_1E638C028[a3];
  }
}

- (id)_initialStepForEventType:(unint64_t)a3
{
  if (a3 == 4)
  {
    id v5 = @"accessoryPicker";
  }
  else if (a3 == 5)
  {
    id v5 = @"alarmPicker";
  }
  else
  {
    id v5 = [(HUEventUIFlow *)self _summaryStepForEventType:v3];
  }
  return v5;
}

- (id)_characteristicSelectionStepForEventType:(unint64_t)a3
{
  uint64_t v3 = @"alarmPicker";
  if (a3 != 5) {
    uint64_t v3 = 0;
  }
  if (a3 == 4) {
    return @"accessoryPicker";
  }
  else {
    return v3;
  }
}

- (id)_stepFolowingStep:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqualToString:@"typePicker"])
  {
    uint64_t v5 = [(HUEventUIFlow *)self _initialStepForEventType:[(HUEventUIFlow *)self eventType]];
LABEL_5:
    uint64_t v8 = (void *)v5;
    goto LABEL_7;
  }
  v10[0] = @"accessoryPicker";
  v10[1] = @"alarmPicker";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  int v7 = [v6 containsObject:v4];

  if (v7)
  {
    uint64_t v5 = [(HUEventUIFlow *)self _summaryStepForEventType:4];
    goto LABEL_5;
  }
  uint64_t v8 = 0;
LABEL_7:

  return v8;
}

- (void)_presentViewControllerForStep:(id)a3
{
  id v7 = a3;
  id v4 = -[HUEventUIFlow _viewControllerForStep:](self, "_viewControllerForStep:");
  if (v4)
  {
    uint64_t v5 = [(HUEventUIFlow *)self presentationController];
    [v5 transitionToViewController:v4];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F69110] sharedHandler];
    id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:descriptionFormat:", 36, @"View controller not yet implemented for step with identifier: %@", v7);
    [v5 handleError:v6];
  }
}

- (id)_viewControllerForStep:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HUEventUIFlow *)self _createViewControllerWithClass:[(HUEventUIFlow *)self _viewControllerClassForStep:v4] step:v4];

  return v5;
}

- (Class)_viewControllerClassForStep:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (([v3 isEqualToString:@"typePicker"] & 1) != 0
    || ([v3 isEqualToString:@"locationEventEditor"] & 1) != 0
    || (v8[0] = @"alarmPicker",
        v8[1] = @"accessoryPicker",
        [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2],
        id v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 containsObject:v3],
        v4,
        (v5 & 1) != 0)
    || ([v3 isEqualToString:@"characteristicEventEditor"] & 1) != 0
    || [v3 isEqualToString:@"timeEventEditor"])
  {
    id v6 = objc_opt_class();
  }
  else
  {
    id v6 = 0;
  }

  return (Class)v6;
}

- (id)_createViewControllerWithClass:(Class)a3 step:(id)a4
{
  id v6 = a4;
  id v7 = (void *)[[a3 alloc] initWithFlow:self stepIdentifier:v6];

  return v7;
}

- (HFEventBuilderItem)eventBuilderItem
{
  return self->_eventBuilderItem;
}

- (void)setEventBuilderItem:(id)a3
{
}

- (HFEventTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (void)setTriggerBuilder:(id)a3
{
}

- (HFEventBuilderItem)originalEventBuilderItem
{
  return self->_originalEventBuilderItem;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(unint64_t)a3
{
  self->_eventType = a3;
}

- (HUEventUIFlowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUEventUIFlowDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HUEventUIFlowPresentationController)presentationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationController);

  return (HUEventUIFlowPresentationController *)WeakRetained;
}

- (void)setPresentationController:(id)a3
{
}

- (BOOL)isPresentedModally
{
  return self->_isPresentedModally;
}

- (void)setIsPresentedModally:(BOOL)a3
{
  self->_isPresentedModally = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentationController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_originalEventBuilderItem, 0);
  objc_storeStrong((id *)&self->_triggerBuilder, 0);

  objc_storeStrong((id *)&self->_eventBuilderItem, 0);
}

@end