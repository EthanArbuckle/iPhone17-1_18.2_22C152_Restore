@interface HUQuickControlRangeViewController
+ (Class)controlItemClass;
- (id)controlToViewValueTransformer;
- (id)createInteractionCoordinator;
- (id)createViewProfile;
@end

@implementation HUQuickControlRangeViewController

+ (Class)controlItemClass
{
  return (Class)objc_opt_class();
}

- (id)createInteractionCoordinator
{
  v3 = [HUQuickControlSliderView alloc];
  v4 = [(HUQuickControlSingleControlViewController *)self viewProfile];
  v5 = [(HUQuickControlSliderView *)v3 initWithProfile:v4];

  v6 = [[HUQuickControlElasticSliderInteractionCoordinator alloc] initWithControlView:v5 delegate:self];

  return v6;
}

- (id)createViewProfile
{
  v3 = objc_alloc_init(HUQuickControlSliderViewProfile);
  [(HUQuickControlSliderViewProfile *)v3 setHasOffState:0];
  v4 = [(HUQuickControlSingleControlViewController *)self controlItem];
  v5 = [v4 latestResults];
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F686A0]];
  v7 = v6;
  if (!v6) {
    v6 = &unk_1F19B4928;
  }
  -[HUQuickControlSliderViewProfile setInteractionFidelity:](v3, "setInteractionFidelity:", [v6 unsignedIntegerValue]);

  v8 = [(HUQuickControlSingleControlViewController *)self controlItem];
  v9 = [v8 latestResults];
  v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F683E0]];

  uint64_t v11 = [v10 mode];
  if (v11 == 2)
  {
    v16 = [(HUQuickControlSingleControlViewController *)self controlItem];
    v13 = [v16 minimumValueConstraints];

    v17 = [(HUQuickControlSingleControlViewController *)self controlItem];
    v14 = [v17 maximumValueConstraints];

    v18 = [v13 validRange];
    v19 = [v14 validRange];
    v15 = [v18 unionRange:v19];

    v20 = [v14 percentageConstraintsWithinRange:v15];
    [(HUQuickControlSliderViewProfile *)v3 setPrimaryValueConstraints:v20];

    v21 = [v13 percentageConstraintsWithinRange:v15];
    [(HUQuickControlSliderViewProfile *)v3 setSecondaryValueConstraints:v21];

    [(HUQuickControlSliderViewProfile *)v3 setHasSecondaryValue:1];
  }
  else
  {
    if (v11 != 1) {
      goto LABEL_8;
    }
    v12 = [(HUQuickControlSingleControlViewController *)self controlItem];
    v13 = [v12 targetValueConstraints];

    v14 = [v13 validRange];
    v15 = [v13 percentageConstraintsWithinRange:v14];
    [(HUQuickControlSliderViewProfile *)v3 setPrimaryValueConstraints:v15];
  }

LABEL_8:

  return v3;
}

- (id)controlToViewValueTransformer
{
  v3 = [(HUQuickControlSingleControlViewController *)self viewProfile];
  v4 = [(HUQuickControlSingleControlViewController *)self controlItem];
  v5 = [v4 latestResults];
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F683E0]];

  uint64_t v7 = [v6 mode];
  v8 = (void *)MEMORY[0x1E4F69760];
  uint64_t v9 = objc_opt_class();
  if (v7 == 2)
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __66__HUQuickControlRangeViewController_controlToViewValueTransformer__block_invoke;
    v29[3] = &unk_1E638DBA8;
    v10 = &v30;
    id v11 = v3;
    id v30 = v11;
    v12 = &v31;
    id v31 = v4;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __66__HUQuickControlRangeViewController_controlToViewValueTransformer__block_invoke_2;
    v26[3] = &unk_1E638DBD0;
    v13 = &v27;
    id v27 = v31;
    v14 = &v28;
    id v28 = v11;
    v15 = v29;
    v16 = v26;
  }
  else
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __66__HUQuickControlRangeViewController_controlToViewValueTransformer__block_invoke_3;
    v23[3] = &unk_1E638C050;
    v10 = &v24;
    id v17 = v3;
    id v24 = v17;
    v12 = &v25;
    id v25 = v4;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __66__HUQuickControlRangeViewController_controlToViewValueTransformer__block_invoke_4;
    v20[3] = &unk_1E638C078;
    v13 = &v21;
    id v21 = v25;
    v14 = &v22;
    id v22 = v17;
    v15 = v23;
    v16 = v20;
  }
  v18 = [v8 transformerForValueClass:v9 transformBlock:v15 reverseTransformBlock:v16];

  return v18;
}

id __66__HUQuickControlRangeViewController_controlToViewValueTransformer__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 primaryValueConstraints];
  v6 = [v5 validRange];
  uint64_t v7 = [v4 maximumValue];
  v8 = [*(id *)(a1 + 40) maximumValueConstraints];
  uint64_t v9 = [v8 validRange];
  v10 = [v6 mapValue:v7 fromRange:v9];

  id v11 = [*(id *)(a1 + 32) secondaryValueConstraints];
  v12 = [v11 validRange];
  v13 = [v4 minimumValue];

  v14 = [*(id *)(a1 + 40) minimumValueConstraints];
  v15 = [v14 validRange];
  v16 = [v12 mapValue:v13 fromRange:v15];

  id v17 = [MEMORY[0x1E4F69368] rangeWithMaxValue:v10 minValue:v16];

  return v17;
}

id __66__HUQuickControlRangeViewController_controlToViewValueTransformer__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 minimumValueConstraints];
  v6 = [v5 validRange];
  uint64_t v7 = [v4 minValue];
  v8 = [*(id *)(a1 + 40) secondaryValueConstraints];
  uint64_t v9 = [v8 validRange];
  v10 = [v6 mapValue:v7 fromRange:v9];

  id v11 = [*(id *)(a1 + 32) maximumValueConstraints];
  v12 = [v11 validRange];
  v13 = [v4 maxValue];

  v14 = [*(id *)(a1 + 40) primaryValueConstraints];
  v15 = [v14 validRange];
  v16 = [v12 mapValue:v13 fromRange:v15];

  id v17 = [MEMORY[0x1E4F69448] thresholdValueWithMinimumValue:v10 maximumValue:v16];

  return v17;
}

id __66__HUQuickControlRangeViewController_controlToViewValueTransformer__block_invoke_3(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 primaryValueConstraints];
  v6 = [v5 validRange];
  uint64_t v7 = [v4 targetValue];

  v8 = [*(id *)(a1 + 40) targetValueConstraints];
  uint64_t v9 = [v8 validRange];
  v10 = [v6 mapValue:v7 fromRange:v9];

  return v10;
}

id __66__HUQuickControlRangeViewController_controlToViewValueTransformer__block_invoke_4(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 targetValueConstraints];
  v6 = [v5 validRange];
  uint64_t v7 = [*(id *)(a1 + 40) primaryValueConstraints];
  v8 = [v7 validRange];
  uint64_t v9 = [v6 mapValue:v4 fromRange:v8];

  v10 = [MEMORY[0x1E4F69448] targetValueWithValue:v9];

  return v10;
}

@end