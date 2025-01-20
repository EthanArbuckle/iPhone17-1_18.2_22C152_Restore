@interface HUTemperatureControlPanelConfiguration
+ (id)_temperatureFormatter;
- (BOOL)shouldShowSectionTitleForItem:(id)a3;
- (Class)cellClass;
- (HUControlPanelRule)rule;
- (void)setupControlsForCell:(id)a3 item:(id)a4;
@end

@implementation HUTemperatureControlPanelConfiguration

+ (id)_temperatureFormatter
{
  v2 = [MEMORY[0x1E4F69160] sharedInstance];
  v3 = [v2 temperatureFormatter];

  return v3;
}

- (HUControlPanelRule)rule
{
  v2 = +[HUControlPanelFilterRule ruleWithFilter:&__block_literal_global_170];
  [v2 setPriority:100.0];

  return (HUControlPanelRule *)v2;
}

uint64_t __46__HUTemperatureControlPanelConfiguration_rule__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 controlItems];
  uint64_t v4 = [v3 count];

  if (v4 == 1)
  {
    v5 = [v2 controlItems];
    v6 = [v5 anyObject];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [v6 incrementalCharacteristicType];
      uint64_t v8 = [v7 isEqualToString:*MEMORY[0x1E4F2D030]];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)setupControlsForCell:(id)a3 item:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  id v8 = v5;
  id v29 = v8;
  if (!v8) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    v9 = v29;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;
  id v8 = v29;
  v11 = v29;
  if (!v10)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v12 handleFailureInFunction:v13, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v7, objc_opt_class() file lineNumber description];

    id v8 = v29;
LABEL_7:
    v11 = 0;
  }

  uint64_t v14 = objc_opt_class();
  v15 = [v6 controlItems];
  id v16 = [v15 anyObject];
  if (v16)
  {
    if (objc_opt_isKindOfClass()) {
      v17 = v16;
    }
    else {
      v17 = 0;
    }
    v18 = v16;
    if (v17) {
      goto LABEL_15;
    }
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    v20 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v19 handleFailureInFunction:v20, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v14, objc_opt_class() file lineNumber description];
  }
  v18 = 0;
LABEL_15:

  v21 = objc_alloc_init(HUStepperControlView);
  v22 = [v6 identifierForControlItem:v18];
  [(HUStepperControlView *)v21 setIdentifier:v22];

  v23 = [v18 minValue];
  [v23 doubleValue];
  -[HUStepperControlView setMinValue:](v21, "setMinValue:");

  v24 = [v18 maxValue];
  [v24 doubleValue];
  -[HUStepperControlView setMaxValue:](v21, "setMaxValue:");

  v25 = [v18 stepValue];
  [v25 doubleValue];
  -[HUStepperControlView setStepValue:](v21, "setStepValue:");

  v26 = [(id)objc_opt_class() _temperatureFormatter];
  [(HUStepperControlView *)v21 setValueFormatter:v26];

  [v11 setControlView:v21];
  v27 = [v6 latestResults];
  v28 = [v27 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  [v11 setControlTitle:v28];
}

- (BOOL)shouldShowSectionTitleForItem:(id)a3
{
  return 0;
}

@end