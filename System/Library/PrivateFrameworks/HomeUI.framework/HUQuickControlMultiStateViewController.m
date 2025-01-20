@interface HUQuickControlMultiStateViewController
+ (Class)controlItemClass;
- (BOOL)_isCharacteristicTypeRotationDirection;
- (BOOL)_shouldUseWheelPickerView;
- (BOOL)_useOverrideStatusText;
- (id)controlToViewValueTransformer;
- (id)createInteractionCoordinator;
- (id)createViewProfile;
- (id)overrideStatusText;
- (void)modelValueDidChange;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HUQuickControlMultiStateViewController

+ (Class)controlItemClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_useOverrideStatusText
{
  v2 = [(HUQuickControlSingleControlViewController *)self viewProfile];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)overrideStatusText
{
  if ([(HUQuickControlMultiStateViewController *)self _useOverrideStatusText])
  {
    v3 = [(HUQuickControlSingleControlViewController *)self controlItem];
    v4 = [v3 possibleValueSet];

    v5 = [(HUQuickControlSingleControlViewController *)self modelValue];

    if (v5)
    {
      v6 = [(HUQuickControlSingleControlViewController *)self modelValue];
      v7 = [v4 displayResultsForValue:v6];
      v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)modelValueDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlMultiStateViewController;
  [(HUQuickControlSingleControlViewController *)&v4 modelValueDidChange];
  if ([(HUQuickControlMultiStateViewController *)self _useOverrideStatusText])
  {
    v3 = [(HUQuickControlViewController *)self delegate];
    [v3 quickControlViewControllerDidUpdateStatusOverrides:self];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)HUQuickControlMultiStateViewController;
  [(HUQuickControlSingleControlViewController *)&v13 viewWillAppear:a3];
  if (![(HUQuickControlSingleControlViewController *)self hasSetControlSize])
  {
    objc_super v4 = [(HUQuickControlMultiStateViewController *)self view];
    [v4 frame];
    uint64_t v7 = HUViewSizeSubclassForViewSize(v5, v6);

    v8 = [(HUQuickControlSingleControlViewController *)self viewProfile];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      unint64_t v10 = +[HUQuickControlUtilities sliderQuickControlSizeForViewSizeSubclass:v7];
    }
    else
    {
      v11 = [(HUQuickControlSingleControlViewController *)self viewProfile];
      objc_opt_class();
      char v12 = objc_opt_isKindOfClass();

      if ((v12 & 1) == 0) {
        return;
      }
      unint64_t v10 = +[HUQuickControlUtilities quickControlStepperViewSizeForViewSizeSubclass:v7];
    }
    [(HUQuickControlSingleControlViewController *)self setControlSize:v10];
  }
}

- (id)createInteractionCoordinator
{
  objc_super v4 = [(HUQuickControlSingleControlViewController *)self viewProfile];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v6 = HUQuickControlStepperView;
LABEL_7:
    id v11 = [v6 alloc];
    char v12 = [(HUQuickControlSingleControlViewController *)self viewProfile];
    objc_super v13 = (HUQuickControlSwitchView *)[v11 initWithProfile:v12];

    v14 = HUQuickControlSimpleInteractionCoordinator;
LABEL_8:
    v15 = (void *)[[v14 alloc] initWithControlView:v13 delegate:self];
    goto LABEL_9;
  }
  uint64_t v7 = [(HUQuickControlSingleControlViewController *)self viewProfile];
  objc_opt_class();
  char v8 = objc_opt_isKindOfClass();

  if (v8)
  {
    double v6 = HUQuickControlWheelPickerView;
    goto LABEL_7;
  }
  v9 = [(HUQuickControlSingleControlViewController *)self viewProfile];
  objc_opt_class();
  char v10 = objc_opt_isKindOfClass();

  if (v10)
  {
    double v6 = HUQuickControlPushButtonView;
    goto LABEL_7;
  }
  v17 = [(HUQuickControlSingleControlViewController *)self viewProfile];
  objc_opt_class();
  char v18 = objc_opt_isKindOfClass();

  if (v18)
  {
    v19 = [HUQuickControlSwitchView alloc];
    v20 = [(HUQuickControlSingleControlViewController *)self viewProfile];
    objc_super v13 = [(HUQuickControlSwitchView *)v19 initWithProfile:v20];

    v14 = HUQuickControlElasticSliderInteractionCoordinator;
    goto LABEL_8;
  }
  objc_super v13 = [MEMORY[0x1E4F28B00] currentHandler];
  v21 = [(HUQuickControlSingleControlViewController *)self viewProfile];
  [(HUQuickControlSwitchView *)v13 handleFailureInMethod:a2, self, @"HUQuickControlMultiStateViewController.m", 91, @"Unknown view profile class %@", v21 object file lineNumber description];

  v15 = 0;
LABEL_9:

  return v15;
}

- (id)createViewProfile
{
  v3 = [(HUQuickControlSingleControlViewController *)self controlItem];
  objc_super v4 = [v3 possibleValueSet];

  double v5 = [v4 allValues];
  uint64_t v6 = [v5 count];

  if (v6 == 2)
  {
    uint64_t v7 = [(HUQuickControlSingleControlViewController *)self controlItem];
    BOOL v8 = +[HUQuickControlUtilities shouldDisplayQuickControlAsPushButton:v7 preferredControl:[(HUQuickControlViewController *)self preferredControl]];

    if (v8)
    {
      v9 = objc_alloc_init(HUQuickControlPushButtonViewProfile);
      [(HUQuickControlPushButtonViewProfile *)v9 setToggleColorScheme:[(HUQuickControlMultiStateViewController *)self _isCharacteristicTypeRotationDirection] ^ 1];
    }
    else
    {
      v9 = objc_alloc_init(HUQuickControlSwitchViewProfile);
    }
  }
  else if ([(HUQuickControlMultiStateViewController *)self _shouldUseWheelPickerView])
  {
    v9 = objc_alloc_init(HUQuickControlWheelPickerViewProfile);
    [(HUQuickControlPushButtonViewProfile *)v9 setStyle:1];
  }
  else
  {
    v9 = objc_alloc_init(HUQuickControlStepperViewProfile);
    [(HUQuickControlPushButtonViewProfile *)v9 setStepperBehavior:0];
    char v10 = [v4 allValues];
    -[HUQuickControlPushButtonViewProfile setNumberOfSegments:](v9, "setNumberOfSegments:", [v10 count]);

    [(HUQuickControlPushButtonViewProfile *)v9 setShowSegmentTitles:1];
    id v11 = [v4 sortedValues];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __59__HUQuickControlMultiStateViewController_createViewProfile__block_invoke;
    v14[3] = &unk_1E63927B8;
    id v15 = v4;
    char v12 = objc_msgSend(v11, "na_map:", v14);
    [(HUQuickControlPushButtonViewProfile *)v9 setSegmentTitles:v12];

    [(HUQuickControlPushButtonViewProfile *)v9 setStepperStyle:0];
    [(HUQuickControlViewProfile *)v9 setControlSize:[(HUQuickControlViewController *)self controlSize]];
  }

  return v9;
}

id __59__HUQuickControlMultiStateViewController_createViewProfile__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) displayResultsForValue:a2];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  return v3;
}

- (BOOL)_isCharacteristicTypeRotationDirection
{
  v2 = [(HUQuickControlSingleControlViewController *)self controlItem];
  v3 = [v2 characteristicOptions];
  objc_super v4 = [v3 characteristicTypesForUsage:0];
  double v5 = [v4 allObjects];
  uint64_t v6 = [v5 firstObject];

  LOBYTE(v2) = [v6 isEqualToString:*MEMORY[0x1E4F2CF80]];
  return (char)v2;
}

- (id)controlToViewValueTransformer
{
  v3 = [(HUQuickControlSingleControlViewController *)self controlItem];
  objc_super v4 = [v3 possibleValueSet];

  double v5 = (void *)MEMORY[0x1E4F69760];
  uint64_t v6 = objc_opt_class();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__HUQuickControlMultiStateViewController_controlToViewValueTransformer__block_invoke;
  v12[3] = &unk_1E63927E0;
  id v13 = v4;
  v14 = self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__HUQuickControlMultiStateViewController_controlToViewValueTransformer__block_invoke_2;
  v10[3] = &unk_1E63927E0;
  v10[4] = self;
  id v11 = v13;
  id v7 = v13;
  BOOL v8 = [v5 transformerForValueClass:v6 transformBlock:v12 reverseTransformBlock:v10];

  return v8;
}

id __71__HUQuickControlMultiStateViewController_controlToViewValueTransformer__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    objc_super v4 = [*(id *)(a1 + 32) sortedValues];
    uint64_t v5 = [v4 indexOfObject:v3];

    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      NSLog(&cfstr_NoValueFoundFo.isa, v3);
      uint64_t v6 = 0;
    }
    else
    {
      uint64_t v6 = [NSNumber numberWithUnsignedInteger:v5];
    }
    id v7 = [*(id *)(a1 + 40) viewProfile];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v25 = v6;
      id v23 = v3;
      id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id obj = [*(id *)(a1 + 32) sortedValues];
      uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v28;
        uint64_t v12 = *MEMORY[0x1E4F68AB8];
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v28 != v11) {
              objc_enumerationMutation(obj);
            }
            uint64_t v14 = *(void *)(*((void *)&v27 + 1) + 8 * i);
            id v15 = [*(id *)(a1 + 32) sortedValues];
            uint64_t v16 = [v15 indexOfObject:v14];

            v17 = [HUQuickControlWheelPickerViewItem alloc];
            char v18 = [*(id *)(a1 + 32) displayResultsForValue:v14];
            v19 = [v18 objectForKeyedSubscript:v12];
            v20 = [NSNumber numberWithUnsignedInteger:v16];
            v21 = -[HUQuickControlWheelPickerViewItem initWithHFMultiStateControlItemValue:text:isSelected:](v17, "initWithHFMultiStateControlItemValue:text:isSelected:", v14, v19, [v25 isEqualToNumber:v20]);

            [v26 addObject:v21];
          }
          uint64_t v10 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v10);
      }

      id v3 = v23;
      uint64_t v6 = v25;
    }
    else
    {
      id v26 = v6;
    }
  }
  else
  {
    id v26 = 0;
  }

  return v26;
}

id __71__HUQuickControlMultiStateViewController_controlToViewValueTransformer__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = [*(id *)(a1 + 32) viewProfile];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v6 = [*(id *)(a1 + 32) controlItem];
    id v7 = [v6 latestResults];
    BOOL v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F683E0]];
    char v9 = [v8 isEqual:v3];

    uint64_t v10 = v3;
    if (v9) {
      goto LABEL_8;
    }
    uint64_t v11 = [*(id *)(a1 + 32) controlItem];
    id v12 = (id)[v11 writeValue:v3];
    uint64_t v10 = v3;
    goto LABEL_6;
  }
  if (v3)
  {
    uint64_t v11 = [*(id *)(a1 + 40) sortedValues];
    uint64_t v10 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v3, "integerValue"));

LABEL_6:
    goto LABEL_8;
  }
  uint64_t v10 = 0;
LABEL_8:

  return v10;
}

- (BOOL)_shouldUseWheelPickerView
{
  v2 = [(HUQuickControlSingleControlViewController *)self controlItem];
  id v3 = [v2 multiStateCharacteristicType];

  if ([v3 isEqualToString:*MEMORY[0x1E4F2CFF0]]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:*MEMORY[0x1E4F2CFE8]];
  }

  return v4;
}

@end