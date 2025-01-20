@interface HFLightbulbControlItem
+ (id)optionsForPrimaryStateControlItem:(id)a3 incrementalCharacteristicType:(id)a4;
+ (id)readOnlyCharacteristicTypes;
- (BOOL)supportsRGBColor;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)_tintColorForNaturalLightFromResults:(id)a3;
- (id)_tintColorFromResults:(id)a3;
- (id)readValueAndPopulateStandardResults;
- (id)writeValue:(id)a3;
@end

@implementation HFLightbulbControlItem

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v10.receiver = self;
  v10.super_class = (Class)HFLightbulbControlItem;
  v5 = [(HFControlItem *)&v10 _subclass_updateWithOptions:v4];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__HFLightbulbControlItem__subclass_updateWithOptions___block_invoke;
  v8[3] = &unk_26408FB70;
  objc_copyWeak(&v9, &location);
  v6 = [v5 flatMap:v8];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
  return v6;
}

- (id)readValueAndPopulateStandardResults
{
  v7.receiver = self;
  v7.super_class = (Class)HFLightbulbControlItem;
  v3 = [(HFControlItem *)&v7 readValueAndPopulateStandardResults];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__HFLightbulbControlItem_readValueAndPopulateStandardResults__block_invoke;
  v6[3] = &unk_26408E098;
  v6[4] = self;
  id v4 = [v3 flatMap:v6];

  return v4;
}

+ (id)optionsForPrimaryStateControlItem:(id)a3 incrementalCharacteristicType:(id)a4
{
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___HFLightbulbControlItem;
  v5 = objc_msgSendSuper2(&v9, sel_optionsForPrimaryStateControlItem_incrementalCharacteristicType_, a3, a4);
  v6 = [a1 readOnlyCharacteristicTypes];
  objc_super v7 = [v5 optionsByAddingCharacteristicTypes:v6 forUsage:2];

  return v7;
}

+ (id)readOnlyCharacteristicTypes
{
  if (qword_26AB2E770 != -1) {
    dispatch_once(&qword_26AB2E770, &__block_literal_global_149);
  }
  v2 = (void *)qword_26AB2E778;
  return v2;
}

id __61__HFLightbulbControlItem_readValueAndPopulateStandardResults__block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a2;
  v5 = [v3 dictionaryWithDictionary:v4];
  v6 = [*(id *)(a1 + 32) _tintColorFromResults:v4];
  objc_msgSend(v5, "na_safeSetObject:forKey:", v6, @"tintColor");
  objc_super v7 = [*(id *)(a1 + 32) _tintColorForNaturalLightFromResults:v4];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__HFLightbulbControlItem_readValueAndPopulateStandardResults__block_invoke_2;
  v11[3] = &unk_26408FBC0;
  id v12 = v5;
  id v8 = v5;
  objc_super v9 = [v7 flatMap:v11];

  return v9;
}

- (id)_tintColorForNaturalLightFromResults:(id)a3
{
  id v4 = a3;
  v5 = [(HFControlItem *)self valueSource];
  if ([v5 conformsToProtocol:&unk_26C0FF9C0]) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  id v8 = [v4 objectForKey:@"characteristicValuesByType"];

  objc_super v9 = [v8 objectForKey:*MEMORY[0x263F0BF68]];
  id v10 = [MEMORY[0x263F58190] futureWithNoResult];
  v11 = [(HFControlItem *)self valueSource];
  id v12 = [v11 primaryServiceDescriptor];
  v13 = [v12 serviceType];
  if ([v13 isEqualToString:*MEMORY[0x263F0D780]])
  {
    int v14 = [v7 isNaturalLightingEnabled];

    if (v14)
    {
      id v15 = objc_alloc_init(MEMORY[0x263F58190]);

      uint64_t v16 = [v9 integerValue];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __63__HFLightbulbControlItem__tintColorForNaturalLightFromResults___block_invoke;
      v18[3] = &unk_26408FB98;
      id v10 = v15;
      id v19 = v10;
      [v7 fetchNaturalLightColorTemperatureForBrightness:v16 completion:v18];
    }
  }
  else
  {
  }
  return v10;
}

- (id)_tintColorFromResults:(id)a3
{
  id v4 = [a3 objectForKey:@"characteristicValuesByType"];
  v5 = [v4 objectForKey:*MEMORY[0x263F0C398]];
  v6 = [v4 objectForKey:*MEMORY[0x263F0BFF8]];
  id v7 = [v4 objectForKey:*MEMORY[0x263F0C1C0]];
  id v8 = [(HFControlItem *)self valueSource];
  objc_super v9 = [v8 primaryServiceDescriptor];
  id v10 = [v9 serviceType];
  int v11 = [v10 isEqualToString:*MEMORY[0x263F0D780]];

  if (v11)
  {
    if (v7) {
      BOOL v12 = v5 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (!v12)
    {
      [v7 floatValue];
      double v15 = (float)(v14 / 360.0);
      [v5 floatValue];
      double v17 = (float)(v16 / 100.0);
      v18 = (void *)MEMORY[0x263F1C550];
      double v19 = 1.0;
      double v20 = 1.0;
      double v21 = v15;
LABEL_10:
      v22 = [v18 colorWithHue:v21 saturation:v17 brightness:v19 alpha:v20];
      goto LABEL_16;
    }
    if (v7)
    {
      [v7 floatValue];
      double v21 = (float)(v13 / 360.0);
      v18 = (void *)MEMORY[0x263F1C550];
      double v17 = 1.0;
LABEL_9:
      double v19 = 1.0;
      double v20 = 1.0;
      goto LABEL_10;
    }
    if (v6)
    {
      v23 = [HFTemperatureColor alloc];
      [v6 floatValue];
      v24 = -[HFTemperatureColor initWithTemperatureInMired:](v23, "initWithTemperatureInMired:");
      v25 = [(HFTemperatureColor *)v24 hf_RGBColorRepresentation];
      v22 = [v25 UIColor];

      goto LABEL_16;
    }
    if (v5)
    {
      [v5 floatValue];
      double v17 = (float)(v26 / 100.0);
      v18 = (void *)MEMORY[0x263F1C550];
      double v21 = 1.0;
      goto LABEL_9;
    }
  }
  v22 = 0;
LABEL_16:

  return v22;
}

id __61__HFLightbulbControlItem_readValueAndPopulateStandardResults__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(*(id *)(a1 + 32), "na_safeSetObject:forKey:", v3, @"tintColor");
  }
  id v4 = [MEMORY[0x263F58190] futureWithResult:*(void *)(a1 + 32)];

  return v4;
}

id __54__HFLightbulbControlItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)[v3 mutableCopy];

  v6 = [v5 objectForKeyedSubscript:@"dependentHomeKitObjects"];
  id v7 = (void *)[v6 mutableCopy];
  id v8 = [WeakRetained valueSource];
  if ([v8 conformsToProtocol:&unk_26C0FF9C0]) {
    objc_super v9 = v8;
  }
  else {
    objc_super v9 = 0;
  }
  id v10 = v9;

  int v11 = [v10 lightProfiles];

  [v7 unionSet:v11];
  [v5 setObject:v7 forKeyedSubscript:@"dependentHomeKitObjects"];
  BOOL v12 = [MEMORY[0x263F58190] futureWithResult:v5];

  return v12;
}

uint64_t __53__HFLightbulbControlItem_readOnlyCharacteristicTypes__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0C398], *MEMORY[0x263F0BFF8], *MEMORY[0x263F0C1C0], 0);
  uint64_t v1 = qword_26AB2E778;
  qword_26AB2E778 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (BOOL)supportsRGBColor
{
  if (qword_26AB2E780 != -1) {
    dispatch_once(&qword_26AB2E780, &__block_literal_global_153);
  }
  id v3 = (id)qword_26AB2E788;
  id v4 = [(HFControlItem *)self characteristicOptions];
  v5 = [v4 characteristicTypesForUsage:2];
  char v6 = [v3 isSubsetOfSet:v5];

  return v6;
}

uint64_t __42__HFLightbulbControlItem_supportsRGBColor__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0C1C0], *MEMORY[0x263F0C398], 0);
  uint64_t v1 = qword_26AB2E788;
  qword_26AB2E788 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __63__HFLightbulbControlItem__tintColorForNaturalLightFromResults___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 finishWithResult:a2];
  }
  else {
    return [v2 finishWithNoResult];
  }
}

- (id)writeValue:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (+[HFUtilities isInternalInstall])
  {
    objc_opt_class();
    v5 = [(HFControlItem *)self valueSource];
    if (objc_opt_isKindOfClass()) {
      char v6 = v5;
    }
    else {
      char v6 = 0;
    }
    id v7 = v6;

    objc_opt_class();
    id v8 = [v7 valueSource];

    if (objc_opt_isKindOfClass()) {
      objc_super v9 = v8;
    }
    else {
      objc_super v9 = 0;
    }
    id v10 = v9;

    int v11 = [v10 originalValueSource];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v12 = +[HFFormatterManager sharedInstance];
      float v13 = [v12 percentFormatter];

      if (v4)
      {
        float v14 = [v13 stringForNormalizedObjectValue:v4];
      }
      else
      {
        float v14 = @"<no value>";
      }
      double v15 = [(HFControlItem *)self valueSource];
      float v16 = [v15 allServices];
      double v17 = [v16 anyObject];
      v18 = [v17 name];

      double v19 = HFLogForCategory(0x45uLL);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v24 = v18;
        __int16 v25 = 2112;
        float v26 = v14;
        __int16 v27 = 2112;
        uint64_t v28 = objc_opt_class();
        _os_log_impl(&dword_20B986000, v19, OS_LOG_TYPE_DEFAULT, "User changed brightness for light \"%@\". Value: \"%@\". Value Source: %@", buf, 0x20u);
      }
    }
  }
  v22.receiver = self;
  v22.super_class = (Class)HFLightbulbControlItem;
  double v20 = [(HFIncrementalStateControlItem *)&v22 writeValue:v4];

  return v20;
}

@end