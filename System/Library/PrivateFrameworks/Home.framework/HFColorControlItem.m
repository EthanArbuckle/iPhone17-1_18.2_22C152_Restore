@interface HFColorControlItem
+ (Class)valueClass;
+ (id)colorCharacteristicTypes;
+ (id)na_identity;
- (BOOL)canCopyWithCharacteristicOptions:(id)a3;
- (BOOL)naturalLightingEnabled;
- (BOOL)supportsItemRepresentingServices:(id)a3;
- (BOOL)supportsNaturalLighting;
- (BOOL)supportsRGBColor;
- (HFColorControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5;
- (HFColorControlItem)initWithValueSource:(id)a3 displayResults:(id)a4;
- (HFColorProfile)colorProfile;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)characteristicValuesForValue:(id)a3;
- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4;
- (id)normalizedValueForValue:(id)a3;
- (id)valueForCharacteristicType:(id)a3 inBatchReadResponse:(id)a4;
- (id)valueForCharacteristicValues:(id)a3;
- (id)writeValue:(id)a3;
- (void)_logForNaturalLightUserStudy:(id)a3;
- (void)setNaturalLightingEnabled:(BOOL)a3;
@end

@implementation HFColorControlItem

uint64_t __33__HFColorControlItem_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 supportsNaturalLighting];
  return [v2 numberWithBool:v3];
}

- (BOOL)supportsNaturalLighting
{
  v2 = [(HFControlItem *)self valueSource];
  if ([v2 conformsToProtocol:&unk_26C0FF9C0]) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  char v5 = [v4 isNaturalLightingSupported];
  return v5;
}

- (id)valueForCharacteristicType:(id)a3 inBatchReadResponse:(id)a4
{
  id v4 = [a4 responseForCharacteristicType:a3 aggregationPolicy:1];
  char v5 = [v4 value];

  return v5;
}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v10.receiver = self;
  v10.super_class = (Class)HFColorControlItem;
  char v5 = [(HFControlItem *)&v10 _subclass_updateWithOptions:v4];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__HFColorControlItem__subclass_updateWithOptions___block_invoke;
  v8[3] = &unk_26408FB70;
  objc_copyWeak(&v9, &location);
  v6 = [v5 flatMap:v8];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
  return v6;
}

id __33__HFColorControlItem_na_identity__block_invoke_3(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F58198];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS___HFColorControlItem;
  v2 = objc_msgSendSuper2(&v7, sel_na_identity);
  uint64_t v3 = [v1 builderWithIdentity:v2];

  id v4 = (id)[v3 appendCharacteristic:&__block_literal_global_125_1];
  char v5 = [v3 build];

  return v5;
}

+ (id)na_identity
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __33__HFColorControlItem_na_identity__block_invoke;
  v4[3] = &__block_descriptor_40_e5__8__0l;
  v4[4] = a1;
  v2 = __33__HFColorControlItem_na_identity__block_invoke((uint64_t)v4);
  return v2;
}

id __33__HFColorControlItem_na_identity__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__HFColorControlItem_na_identity__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  if (qword_26AB2FD78 != -1) {
    dispatch_once(&qword_26AB2FD78, block);
  }
  v1 = (void *)qword_26AB2FD80;
  return v1;
}

BOOL __57__HFColorControlItem_initWithValueSource_displayResults___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) allCharacteristicsForCharacteristicType:a2];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

id __50__HFColorControlItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  char v5 = (void *)[v3 mutableCopy];

  v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(WeakRetained, "naturalLightingEnabled"));
  [v5 setObject:v6 forKeyedSubscript:@"naturalLightEnabled"];

  objc_super v7 = [v5 objectForKeyedSubscript:@"dependentHomeKitObjects"];
  v8 = (void *)[v7 mutableCopy];
  id v9 = [WeakRetained valueSource];
  if ([v9 conformsToProtocol:&unk_26C0FF9C0]) {
    objc_super v10 = v9;
  }
  else {
    objc_super v10 = 0;
  }
  id v11 = v10;

  v12 = [v11 lightProfiles];

  [v8 unionSet:v12];
  [v5 setObject:v8 forKeyedSubscript:@"dependentHomeKitObjects"];
  v13 = [MEMORY[0x263F58190] futureWithResult:v5];

  return v13;
}

- (BOOL)naturalLightingEnabled
{
  v2 = [(HFControlItem *)self valueSource];
  if ([v2 conformsToProtocol:&unk_26C0FF9C0]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  char v5 = [v4 isNaturalLightingEnabled];
  return v5;
}

- (HFColorControlItem)initWithValueSource:(id)a3 displayResults:(id)a4
{
  v20[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(id)objc_opt_class() colorCharacteristicTypes];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __57__HFColorControlItem_initWithValueSource_displayResults___block_invoke;
  v17[3] = &unk_26408D210;
  id v18 = v6;
  id v9 = v6;
  objc_super v10 = objc_msgSend(v8, "na_filter:", v17);

  id v11 = [HFControlItemCharacteristicOptions alloc];
  v19 = &unk_26C0F7A70;
  v20[0] = v10;
  v12 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
  v13 = [(HFControlItemCharacteristicOptions *)v11 initWithCharacteristicTypesByUsage:v12];

  v16.receiver = self;
  v16.super_class = (Class)HFColorControlItem;
  v14 = [(HFControlItem *)&v16 initWithValueSource:v9 characteristicOptions:v13 displayResults:v7];

  return v14;
}

+ (id)colorCharacteristicTypes
{
  if (_MergedGlobals_316 != -1) {
    dispatch_once(&_MergedGlobals_316, &__block_literal_global_4_16);
  }
  v2 = (void *)qword_26AB2FD60;
  return v2;
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  id v6 = a4;
  if ([(HFColorControlItem *)self canCopyWithCharacteristicOptions:a3])
  {
    id v7 = objc_alloc((Class)objc_opt_class());
    v8 = [(HFControlItem *)self displayResults];
    id v9 = (void *)[v7 initWithValueSource:v6 displayResults:v8];

    [v9 copyLatestResultsFromItem:self];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (BOOL)canCopyWithCharacteristicOptions:(id)a3
{
  id v4 = a3;
  char v5 = [(HFControlItem *)self characteristicOptions];
  char v6 = [v4 isEqual:v5];

  return v6;
}

- (BOOL)supportsItemRepresentingServices:(id)a3
{
  return objc_msgSend(a3, "na_any:", &__block_literal_global_22_11);
}

uint64_t __55__HFColorControlItem_supportsItemRepresentingServices___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(v2, "hf_characteristicOfType:", *MEMORY[0x263F0C1C0]);
  if (v3)
  {
    id v4 = objc_msgSend(v2, "hf_characteristicOfType:", *MEMORY[0x263F0C398]);
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  char v6 = objc_msgSend(v2, "hf_characteristicOfType:", *MEMORY[0x263F0BFF8]);

  if (v6) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = v5;
  }

  return v7;
}

- (id)valueForCharacteristicValues:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__HFColorControlItem_valueForCharacteristicValues___block_invoke;
  aBlock[3] = &unk_26409B178;
  id v5 = v4;
  id v38 = v5;
  v39 = self;
  char v6 = (void (**)(void *, void, float))_Block_copy(aBlock);
  uint64_t v7 = v6[2](v6, *MEMORY[0x263F0C1C0], 360.0);
  v8 = v6[2](v6, *MEMORY[0x263F0C398], 100.0);
  uint64_t v9 = *MEMORY[0x263F0BFF8];
  objc_super v10 = [v5 objectForKeyedSubscript:*MEMORY[0x263F0BFF8]];
  id v11 = [(HFControlItem *)self normalizedValueForCharacteristicValue:v10 ofType:v9];

  v12 = [MEMORY[0x263EFF9C0] set];
  if (v7) {
    BOOL v13 = v8 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    v21 = 0;
    if (!v11) {
      goto LABEL_14;
    }
  }
  else
  {
    v14 = [HFRGBColor alloc];
    [v7 floatValue];
    int v16 = v15;
    [v8 floatValue];
    LODWORD(v18) = v17;
    LODWORD(v19) = 1.0;
    LODWORD(v20) = v16;
    v21 = [(HFRGBColor *)v14 initWithHue:v20 saturation:v18 brightness:v19];
    [v12 addObject:v21];
    if (!v11) {
      goto LABEL_14;
    }
  }
  v36 = v7;
  v22 = [(HFColorControlItem *)self colorProfile];
  v23 = [HFTemperatureColor alloc];
  [v11 floatValue];
  v24 = -[HFTemperatureColor initWithTemperatureInMired:](v23, "initWithTemperatureInMired:");
  if (!v21) {
    goto LABEL_12;
  }
  [v11 floatValue];
  float v26 = v25;
  [v22 minimumTemperature];
  if (v26 != v27) {
    goto LABEL_12;
  }
  [(HFTemperatureColor *)v24 hf_RGBColorRepresentation];
  id v35 = v5;
  v29 = v28 = v8;
  BOOL v30 = [(HFRGBColor *)v21 isEqual:v29];

  v8 = v28;
  id v5 = v35;
  if (v30) {
LABEL_12:
  }
    [v12 addObject:v24];

  uint64_t v7 = v36;
LABEL_14:
  if ([v12 count])
  {
    v31 = [[HFColorCollection alloc] initWithPrimitiveColors:v12];
  }
  else
  {
    v32 = HFLogForCategory(0x39uLL);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v33 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      uint64_t v41 = v33;
      __int16 v42 = 2112;
      id v43 = v5;
      _os_log_impl(&dword_20B986000, v32, OS_LOG_TYPE_DEFAULT, "%@ couldn't find any color primitives in the characteristics: %@", buf, 0x16u);
    }

    v31 = 0;
  }

  return v31;
}

id __51__HFColorControlItem_valueForCharacteristicValues___block_invoke(uint64_t a1, void *a2, float a3)
{
  id v5 = a2;
  char v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 40) normalizedValueForCharacteristicValue:v6 ofType:v5];
    v8 = NSNumber;
    [v7 floatValue];
    *(float *)&double v10 = v9 / a3;
    id v11 = [v8 numberWithFloat:v10];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

void __33__HFColorControlItem_na_identity__block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __33__HFColorControlItem_na_identity__block_invoke_3;
  v3[3] = &__block_descriptor_40_e17___NAIdentity_8__0l;
  v3[4] = *(void *)(a1 + 32);
  uint64_t v1 = __33__HFColorControlItem_na_identity__block_invoke_3((uint64_t)v3);
  id v2 = (void *)qword_26AB2FD80;
  qword_26AB2FD80 = v1;
}

void __46__HFColorControlItem_colorCharacteristicTypes__block_invoke_2()
{
  v5[3] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0C398];
  v5[0] = *MEMORY[0x263F0C1C0];
  v5[1] = v1;
  v5[2] = *MEMORY[0x263F0BFF8];
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:3];
  uint64_t v3 = [v0 setWithArray:v2];
  id v4 = (void *)qword_26AB2FD60;
  qword_26AB2FD60 = v3;
}

- (HFColorControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5
{
  uint64_t v7 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4, a5);
  v8 = NSStringFromSelector(sel_initWithValueSource_displayResults_);
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFColorControlItem.m", 64, @"%s is unavailable; use %@ instead",
    "-[HFColorControlItem initWithValueSource:characteristicOptions:displayResults:]",
    v8);

  return 0;
}

- (BOOL)supportsRGBColor
{
  if (qword_26AB2FD68 != -1) {
    dispatch_once(&qword_26AB2FD68, &__block_literal_global_26_4);
  }
  id v3 = (id)qword_26AB2FD70;
  id v4 = [(HFControlItem *)self characteristicOptions];
  id v5 = [v4 characteristicTypesForUsage:0];
  char v6 = [v3 isSubsetOfSet:v5];

  return v6;
}

uint64_t __38__HFColorControlItem_supportsRGBColor__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0C1C0], 0);
  uint64_t v1 = qword_26AB2FD70;
  qword_26AB2FD70 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (HFColorProfile)colorProfile
{
  id v2 = [(HFControlItem *)self metadataForCharacteristicType:*MEMORY[0x263F0BFF8]];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 minimumValue];
    id v5 = v4;
    if (!v4) {
      id v4 = &unk_26C0F7A88;
    }
    [v4 floatValue];
    int v7 = v6;

    v8 = [v3 maximumValue];
    float v9 = v8;
    if (!v8) {
      v8 = &unk_26C0F7AA0;
    }
    [v8 floatValue];
    int v11 = v10;

    v12 = [HFTemperatureColorProfile alloc];
    LODWORD(v13) = v7;
    LODWORD(v14) = v11;
    int v15 = [(HFTemperatureColorProfile *)v12 initWithMinimumTemperature:v13 maximumTemperature:v14];
  }
  else
  {
    int v15 = 0;
  }

  return (HFColorProfile *)v15;
}

- (void)_logForNaturalLightUserStudy:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (+[HFUtilities isInternalInstall])
  {
    objc_opt_class();
    id v5 = [(HFControlItem *)self valueSource];
    if (objc_opt_isKindOfClass()) {
      int v6 = v5;
    }
    else {
      int v6 = 0;
    }
    id v7 = v6;

    objc_opt_class();
    v8 = [v7 valueSource];

    if (objc_opt_isKindOfClass()) {
      float v9 = v8;
    }
    else {
      float v9 = 0;
    }
    id v10 = v9;

    int v11 = [v10 originalValueSource];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v12 = [(HFControlItem *)self valueSource];
      double v13 = [v12 allServices];
      double v14 = [v13 anyObject];
      int v15 = [v14 name];

      int v16 = HFLogForCategory(0x45uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412802;
        double v18 = v15;
        __int16 v19 = 2112;
        id v20 = v4;
        __int16 v21 = 2112;
        uint64_t v22 = objc_opt_class();
        _os_log_impl(&dword_20B986000, v16, OS_LOG_TYPE_DEFAULT, "User changed color for light \"%@\". Value: \"%@\". Value Source: %@", (uint8_t *)&v17, 0x20u);
      }
    }
  }
}

- (id)writeValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    int v6 = v5;
  }
  else {
    int v6 = 0;
  }
  id v7 = v6;

  v8 = [v7 temperatureColor];
  float v9 = [v7 RGBColor];
  id v10 = v9;
  if (v8) {
    [v8 valueDescriptionInKelvin];
  }
  else {
  int v11 = [v9 valueDescription];
  }
  [(HFColorControlItem *)self _logForNaturalLightUserStudy:v11];

  if (v7)
  {
    [(HFColorControlItem *)self setNaturalLightingEnabled:0];
    v14.receiver = self;
    v14.super_class = (Class)HFColorControlItem;
    v12 = [(HFControlItem *)&v14 writeValue:v5];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      NSLog(&cfstr_AttemptingToWr.isa);
    }
    else {
      NSLog(&cfstr_UnknownColorVa.isa, v5);
    }
    v12 = 0;
  }

  return v12;
}

- (id)normalizedValueForValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    NSLog(&cfstr_AttemptingToNo.isa);
    id v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)HFColorControlItem;
    id v5 = [(HFControlItem *)&v8 normalizedValueForValue:v4];
  }
  int v6 = v5;

  return v6;
}

- (id)characteristicValuesForValue:(id)a3
{
  v36[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    int v6 = v5;
  }
  else {
    int v6 = 0;
  }
  id v7 = v6;

  objc_super v8 = [(HFControlItem *)self characteristicOptions];
  float v9 = [v8 characteristicTypesForUsage:0];
  uint64_t v10 = *MEMORY[0x263F0BFF8];
  int v11 = [v9 containsObject:*MEMORY[0x263F0BFF8]];

  BOOL v12 = [(HFColorControlItem *)self supportsRGBColor];
  double v13 = [v7 preferredColorPrimitive];
  objc_opt_class();
  int v14 = objc_opt_isKindOfClass() & v11;

  if ((v14 & 1) != 0 || v12)
  {
    if (v14) {
      goto LABEL_7;
    }
LABEL_9:
    if (v12
      && ([v7 RGBColor], __int16 v21 = objc_claimAutoreleasedReturnValue(), v21, v21))
    {
      uint64_t v32 = 0;
      uint64_t v22 = [v7 RGBColor];
      [v22 getHue:(char *)&v32 + 4 saturation:&v32 brightness:0];

      *(float *)&double v23 = *((float *)&v32 + 1) * 360.0;
      v24 = [NSNumber numberWithFloat:v23];
      uint64_t v25 = *MEMORY[0x263F0C1C0];
      float v26 = [(HFControlItem *)self normalizedValueForCharacteristicValue:v24 ofType:*MEMORY[0x263F0C1C0]];

      *(float *)&double v27 = *(float *)&v32 * 100.0;
      v28 = [NSNumber numberWithFloat:v27];
      uint64_t v29 = *MEMORY[0x263F0C398];
      BOOL v30 = [(HFControlItem *)self normalizedValueForCharacteristicValue:v28 ofType:*MEMORY[0x263F0C398]];

      v33[0] = v25;
      v33[1] = v29;
      v34[0] = v26;
      v34[1] = v30;
      id v20 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        NSLog(&cfstr_AttemptingToGe.isa);
      }
      else {
        NSLog(&cfstr_AttemptingToUs_1.isa, v5, self);
      }
      id v20 = (void *)MEMORY[0x263EFFA78];
    }
    goto LABEL_16;
  }
  int v15 = [v7 temperatureColor];

  if (!v15) {
    goto LABEL_9;
  }
LABEL_7:
  uint64_t v35 = v10;
  int v16 = NSNumber;
  int v17 = [v7 temperatureColor];
  [v17 temperatureInMired];
  double v18 = objc_msgSend(v16, "numberWithFloat:");
  v36[0] = v18;
  __int16 v19 = [NSDictionary dictionaryWithObjects:v36 forKeys:&v35 count:1];
  id v20 = [(HFControlItem *)self normalizedCharacteristicValuesForValues:v19];

LABEL_16:
  return v20;
}

- (void)setNaturalLightingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HFColorControlItem *)self supportsNaturalLighting])
  {
    if (v3) {
      [(HFColorControlItem *)self _logForNaturalLightUserStudy:@"Natural Light"];
    }
    id v5 = [(HFControlItem *)self valueSource];
    if ([v5 conformsToProtocol:&unk_26C0FF9C0]) {
      int v6 = v5;
    }
    else {
      int v6 = 0;
    }
    id v8 = v6;

    id v7 = (id)[v8 writeNaturalLightEnabledState:v3];
  }
}

@end