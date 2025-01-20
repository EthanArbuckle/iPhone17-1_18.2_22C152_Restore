@interface HUDurationWheelControlPanelConfiguration
+ (id)_valuesBetweenMinValue:(id)a3 maxValue:(id)a4 stepValue:(id)a5;
- (BOOL)shouldShowSectionFooterForItem:(id)a3;
- (BOOL)shouldShowSectionTitleForItem:(id)a3;
- (Class)cellClass;
- (HUControlPanelRule)rule;
- (id)_characteristicTypesFromControlPanelItem:(id)a3;
- (id)sectionFooterForItem:(id)a3 forSourceItem:(id)a4;
- (id)sectionTitleForItem:(id)a3 forSourceItem:(id)a4;
- (void)setupControlsForCell:(id)a3 item:(id)a4;
@end

@implementation HUDurationWheelControlPanelConfiguration

- (HUControlPanelRule)rule
{
  v2 = +[HUControlPanelFilterRule ruleWithFilter:&__block_literal_global_187];
  [v2 setPriority:100.0];

  return (HUControlPanelRule *)v2;
}

uint64_t __48__HUDurationWheelControlPanelConfiguration_rule__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 controlItems];
  v3 = [v2 anyObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 incrementalCharacteristicType];
    uint64_t v5 = [v4 isEqualToString:*MEMORY[0x1E4F2CFA8]];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
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
  id v38 = v8;
  if (!v8) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    v9 = v38;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;
  id v8 = v38;
  v11 = v38;
  if (!v10)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v12 handleFailureInFunction:v13, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v7, objc_opt_class() file lineNumber description];

    id v8 = v38;
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

  v21 = (void *)MEMORY[0x1E4F28CF8];
  v22 = [v18 incrementalCharacteristicType];
  v23 = [v18 valueSource];
  v24 = [v18 incrementalCharacteristicType];
  v25 = [v23 metadataForCharacteristicType:v24];
  v26 = objc_msgSend(v21, "hf_valueFormatterForCharacteristicType:withMetadata:options:", v22, v25, 0);

  v27 = objc_alloc_init(HUWheelControlView);
  v28 = [v6 identifierForControlItem:v18];
  [(HUWheelControlView *)v27 setIdentifier:v28];

  v29 = objc_opt_class();
  v30 = [v18 minValue];
  v31 = [v18 maxValue];
  v32 = [v18 stepValue];
  v33 = [v29 _valuesBetweenMinValue:v30 maxValue:v31 stepValue:v32];
  [(HUWheelControlView *)v27 setValues:v33];

  [(HUWheelControlView *)v27 setValueFormatter:v26];
  [(HUWheelControlView *)v27 setCanBeHighlighted:1];
  v34 = (void *)MEMORY[0x1E4F1CAD0];
  v35 = [v18 latestResults];
  v36 = [v35 objectForKeyedSubscript:*MEMORY[0x1E4F683E0]];
  v37 = objc_msgSend(v34, "na_setWithSafeObject:", v36);
  [(HUWheelControlView *)v27 setCustomValues:v37];

  [v11 setControlView:v27];
}

- (BOOL)shouldShowSectionTitleForItem:(id)a3
{
  return 1;
}

- (BOOL)shouldShowSectionFooterForItem:(id)a3
{
  return 1;
}

- (id)sectionTitleForItem:(id)a3 forSourceItem:(id)a4
{
  return _HULocalizedStringWithDefaultValue(@"HUControlPanelSectionTitleSetDuration", @"HUControlPanelSectionTitleSetDuration", 1);
}

- (id)sectionFooterForItem:(id)a3 forSourceItem:(id)a4
{
  v4 = objc_msgSend(a4, "service", a3);
  id v5 = [v4 serviceSubtype];

  if ([v5 isEqualToString:*MEMORY[0x1E4F2DD90]])
  {
    id v6 = @"HUControlPanelSectionFooterSetDurationIrrigation";
LABEL_9:
    uint64_t v7 = _HULocalizedStringWithDefaultValue(v6, v6, 1);
    goto LABEL_10;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F2DD98]])
  {
    id v6 = @"HUControlPanelSectionFooterSetDurationShower";
    goto LABEL_9;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F2DDA8]])
  {
    id v6 = @"HUControlPanelSectionFooterSetDurationFaucet";
    goto LABEL_9;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F2DD88]])
  {
    id v6 = @"HUControlPanelSectionFooterSetDurationGeneric";
    goto LABEL_9;
  }
  uint64_t v7 = 0;
LABEL_10:

  return v7;
}

- (id)_characteristicTypesFromControlPanelItem:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA80];
  id v4 = a3;
  id v5 = [v3 set];
  id v6 = [v4 controlItems];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__HUDurationWheelControlPanelConfiguration__characteristicTypesFromControlPanelItem___block_invoke;
  v9[3] = &unk_1E638D080;
  id v7 = v5;
  id v10 = v7;
  objc_msgSend(v6, "na_each:", v9);

  return v7;
}

void __85__HUDurationWheelControlPanelConfiguration__characteristicTypesFromControlPanelItem___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [a2 characteristicOptions];
  v3 = [v4 allCharacteristicTypes];
  [v2 unionSet:v3];
}

+ (id)_valuesBetweenMinValue:(id)a3 maxValue:(id)a4 stepValue:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  unint64_t v10 = [v9 unsignedIntegerValue];
  uint64_t v11 = [v8 unsignedIntegerValue];
  unint64_t v12 = v11 - [v7 unsignedIntegerValue];
  if (v12 <= 0x12B) {
    unint64_t v13 = (unsigned __int16)v12 / 5u / v10 * v10;
  }
  else {
    unint64_t v13 = 300;
  }
  uint64_t v14 = [NSNumber numberWithUnsignedInteger:v13];
  v15 = objc_msgSend(v14, "na_largerNumber:", v9);
  uint64_t v16 = [v15 unsignedIntegerValue];

  v17 = [NSNumber numberWithUnsignedInteger:v16];
  v18 = objc_msgSend(v7, "na_largerNumber:", v17);
  unint64_t v19 = [v18 unsignedIntegerValue];

  unint64_t v20 = [v8 unsignedIntegerValue];
  v21 = [MEMORY[0x1E4F1CA48] array];
  while (v19 <= v20)
  {
    v22 = [NSNumber numberWithUnsignedInteger:v19];
    [v21 addObject:v22];

    v19 += v16;
  }

  return v21;
}

@end