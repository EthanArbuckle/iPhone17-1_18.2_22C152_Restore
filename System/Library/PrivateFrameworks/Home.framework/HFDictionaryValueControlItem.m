@interface HFDictionaryValueControlItem
+ (Class)valueClass;
+ (id)defaultMainTextColorForCharacteristicType:(id)a3;
- (BOOL)canCopyWithCharacteristicOptions:(id)a3;
- (HFDictionaryValueControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5;
- (HFDictionaryValueControlItem)initWithValueSource:(id)a3 characteristicType:(id)a4 displayResults:(id)a5;
- (NSString)characteristicType;
- (id)characteristicValuesForValue:(id)a3;
- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)resultsForBatchReadResponse:(id)a3;
- (id)valueForCharacteristicValues:(id)a3;
- (void)getStatus:(id *)a3 mainTextColor:(id *)a4 supplementaryDescription:(id *)a5 withBatchReadResponse:(id)a6;
@end

@implementation HFDictionaryValueControlItem

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (HFDictionaryValueControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5
{
  v7 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4, a5);
  v8 = NSStringFromSelector(sel_initWithValueSource_characteristicType_displayResults_);
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFDictionaryValueControlItem.m", 34, @"%s is unavailable; use %@ instead",
    "-[HFDictionaryValueControlItem initWithValueSource:characteristicOptions:displayResults:]",
    v8);

  return 0;
}

- (HFDictionaryValueControlItem)initWithValueSource:(id)a3 characteristicType:(id)a4 displayResults:(id)a5
{
  v29[3] = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = (NSString *)a4;
  v10 = (objc_class *)MEMORY[0x263EFF9C0];
  id v11 = a5;
  id v12 = objc_alloc_init(v10);
  [v12 addObject:v9];
  uint64_t v13 = *MEMORY[0x263F0C438];
  v29[0] = *MEMORY[0x263F0C430];
  v29[1] = v13;
  v29[2] = *MEMORY[0x263F0C418];
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:3];
  [v12 addObjectsFromArray:v14];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __86__HFDictionaryValueControlItem_initWithValueSource_characteristicType_displayResults___block_invoke;
  v25[3] = &unk_26408D210;
  id v26 = v8;
  id v15 = v8;
  v16 = objc_msgSend(v12, "na_filter:", v25);
  v17 = [HFControlItemCharacteristicOptions alloc];
  v27 = &unk_26C0F6B10;
  v28 = v16;
  v18 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  v19 = [(HFControlItemCharacteristicOptions *)v17 initWithCharacteristicTypesByUsage:v18];

  v24.receiver = self;
  v24.super_class = (Class)HFDictionaryValueControlItem;
  v20 = [(HFControlItem *)&v24 initWithValueSource:v15 characteristicOptions:v19 displayResults:v11];

  characteristicType = v20->_characteristicType;
  v20->_characteristicType = v9;
  v22 = v9;

  return v20;
}

BOOL __86__HFDictionaryValueControlItem_initWithValueSource_characteristicType_displayResults___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) allCharacteristicsForCharacteristicType:a2];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)canCopyWithCharacteristicOptions:(id)a3
{
  id v4 = a3;
  v5 = [(HFControlItem *)self characteristicOptions];
  char v6 = [v4 isEqual:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(HFControlItem *)self valueSource];
  char v6 = [(HFDictionaryValueControlItem *)self characteristicType];
  v7 = [(HFControlItem *)self displayResults];
  id v8 = (void *)[v4 initWithValueSource:v5 characteristicType:v6 displayResults:v7];

  return v8;
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  id v6 = a4;
  if ([(HFDictionaryValueControlItem *)self canCopyWithCharacteristicOptions:a3])
  {
    v7 = [HFDictionaryValueControlItem alloc];
    id v8 = [(HFDictionaryValueControlItem *)self characteristicType];
    v9 = [(HFControlItem *)self displayResults];
    v10 = [(HFDictionaryValueControlItem *)v7 initWithValueSource:v6 characteristicType:v8 displayResults:v9];

    [(HFItem *)v10 copyLatestResultsFromItem:self];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)valueForCharacteristicValues:(id)a3
{
  id v3 = a3;
  return v3;
}

- (id)characteristicValuesForValue:(id)a3
{
  id v3 = a3;
  return v3;
}

- (id)resultsForBatchReadResponse:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)HFDictionaryValueControlItem;
  v5 = [(HFControlItem *)&v41 resultsForBatchReadResponse:v4];
  id v6 = (void *)[v5 mutableCopy];

  id v39 = 0;
  id v40 = 0;
  id v38 = 0;
  [(HFDictionaryValueControlItem *)self getStatus:&v40 mainTextColor:&v39 supplementaryDescription:&v38 withBatchReadResponse:v4];
  id v7 = v40;
  id v8 = v39;
  id v9 = v38;
  if (v7) {
    [v6 setObject:v7 forKeyedSubscript:@"controlStatus"];
  }
  if (v8) {
    [v6 setObject:v8 forKeyedSubscript:@"controlDescriptionMainTextColor"];
  }
  v36 = v8;
  if (v9) {
    [v6 setObject:v9 forKeyedSubscript:@"supplementaryControlDescription"];
  }
  id v34 = v9;
  objc_opt_class();
  v10 = [(HFControlItem *)self valueSource];
  id v11 = [v10 allServices];
  id v12 = [v11 anyObject];
  if (objc_opt_isKindOfClass()) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  id v14 = v13;

  id v15 = objc_msgSend(v14, "hf_iconDescriptor");
  v16 = +[HFCharacteristicValueDisplayMetadata displayMetadataForService:v14 characteristicReadResponse:v4];
  objc_opt_class();
  v37 = v7;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v17 = objc_msgSend(v16, "primaryState", v9, v8, v7);
    v18 = &HFCAPackageStateOn;
    if (v17 != 2) {
      v18 = &HFCAPackageStateOff;
    }
    v19 = *v18;
    uint64_t v20 = +[HFServiceIconFactory iconModifiersForService:v14];
    v21 = [HFCAPackageIconDescriptor alloc];
    v22 = [v15 identifier];
    uint64_t v23 = [(HFCAPackageIconDescriptor *)v21 initWithPackageIdentifier:v22 state:v19 modifiers:v20];

    id v15 = (void *)v20;
    goto LABEL_20;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v24 = objc_msgSend(v15, "iconDescriptorForPrimaryState:", objc_msgSend(v16, "primaryState", v9, v8, v7));
    if (!v24)
    {
      v19 = 0;
      unint64_t v27 = 0x263F0E000;
      goto LABEL_21;
    }
    v25 = v24;
    v19 = (__CFString *)v25;
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v26 = [HFPrimaryStateIconDescriptor alloc];
    objc_msgSend(v15, "identifier", v9, v8, v37);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v25 = -[HFPrimaryStateIconDescriptor initWithIdentifier:primaryState:](v26, "initWithIdentifier:primaryState:", v19, [v16 primaryState]);
LABEL_19:
    uint64_t v23 = (uint64_t)v25;
LABEL_20:
    unint64_t v27 = 0x263F0E000uLL;

    id v15 = (void *)v23;
LABEL_21:

    goto LABEL_22;
  }
  unint64_t v27 = 0x263F0E000;
LABEL_22:
  objc_msgSend(v6, "na_safeSetObject:forKey:", v15, @"controlIcon", v34);
  v28 = objc_msgSend(*(id *)(v27 + 1800), "hf_sensorServiceTypes");
  v29 = [(HFControlItem *)self valueSource];
  v30 = [v29 primaryServiceDescriptor];
  v31 = [v30 serviceType];
  int v32 = [v28 containsObject:v31];

  if (v32) {
    objc_msgSend(v6, "na_safeSetObject:forKey:", MEMORY[0x263EFFA88], @"readValueOnly");
  }

  return v6;
}

- (void)getStatus:(id *)a3 mainTextColor:(id *)a4 supplementaryDescription:(id *)a5 withBatchReadResponse:(id)a6
{
  uint64_t v111 = *MEMORY[0x263EF8340];
  id v72 = a6;
  uint64_t v95 = 0;
  v96 = &v95;
  uint64_t v97 = 0x3032000000;
  v98 = __Block_byref_object_copy__13;
  v99 = __Block_byref_object_dispose__13;
  id v100 = 0;
  uint64_t v89 = 0;
  v90 = &v89;
  uint64_t v91 = 0x3032000000;
  v92 = __Block_byref_object_copy__13;
  v93 = __Block_byref_object_dispose__13;
  id v94 = 0;
  uint64_t v83 = 0;
  v84 = &v83;
  uint64_t v85 = 0x3032000000;
  v86 = __Block_byref_object_copy__13;
  v87 = __Block_byref_object_dispose__13;
  id v88 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__HFDictionaryValueControlItem_getStatus_mainTextColor_supplementaryDescription_withBatchReadResponse___block_invoke;
  aBlock[3] = &unk_264095E08;
  aBlock[4] = &v95;
  aBlock[5] = &v89;
  aBlock[8] = a4;
  aBlock[9] = a5;
  aBlock[6] = &v83;
  aBlock[7] = a3;
  v71 = (void (**)(void))_Block_copy(aBlock);
  v77 = [(HFControlItem *)self characteristicValuesByTypeForBatchReadResponse:v72];
  uint64_t v10 = *MEMORY[0x263F0C438];
  v109[0] = *MEMORY[0x263F0C430];
  uint64_t v9 = v109[0];
  v109[1] = v10;
  uint64_t v110 = *MEMORY[0x263F0C418];
  uint64_t v11 = v110;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v109 count:3];
  v107[0] = v9;
  v107[1] = v10;
  v108[0] = &unk_26C0F6B28;
  v108[1] = &unk_26C0F6B28;
  v107[2] = v11;
  v108[2] = &unk_26C0F6B28;
  v76 = [NSDictionary dictionaryWithObjects:v108 forKeys:v107 count:3];
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id obj = v12;
  uint64_t v13 = [obj countByEnumeratingWithState:&v78 objects:v106 count:16];
  uint64_t v69 = v10;
  uint64_t v70 = v9;
  uint64_t v68 = v11;
  if (v13)
  {
    v75 = 0;
    uint64_t v14 = *(void *)v79;
LABEL_3:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v79 != v14) {
        objc_enumerationMutation(obj);
      }
      v16 = *(void **)(*((void *)&v78 + 1) + 8 * v15);
      uint64_t v17 = [v76 objectForKey:v16];
      objc_opt_class();
      id v18 = v17;
      id v19 = (objc_opt_isKindOfClass() & 1) != 0 ? v18 : 0;
      id v20 = v19;

      v21 = [v77 objectForKey:v16];
      objc_opt_class();
      id v22 = v21;
      id v23 = (objc_opt_isKindOfClass() & 1) != 0 ? v22 : 0;
      id v24 = v23;

      BOOL v25 = !v20 || v24 == 0;
      if (v25 || ![v20 isEqualToNumber:v24])
      {
        int v27 = 1;
      }
      else
      {
        id v26 = v16;

        int v27 = 0;
        v75 = v26;
      }

      if (!v27) {
        break;
      }
      if (v13 == ++v15)
      {
        uint64_t v13 = [obj countByEnumeratingWithState:&v78 objects:v106 count:16];
        if (v13) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    v75 = 0;
  }

  v28 = [(HFControlItem *)self valueSource];
  v29 = [v28 primaryServiceDescriptor];
  v30 = [v29 serviceType];

  v31 = (uint64_t *)MEMORY[0x263F0C238];
  int v32 = (void *)MEMORY[0x263F0C288];
  v33 = (uint64_t *)MEMORY[0x263F0C2C0];
  if (v75)
  {
    v104[0] = v70;
    id v34 = _HFLocalizedStringWithDefaultValue(@"HFCharacteristicStateGroupedTitleStatusLowBattery", @"HFCharacteristicStateGroupedTitleStatusLowBattery", 1);
    v105[0] = v34;
    v104[1] = v69;
    v35 = _HFLocalizedStringWithDefaultValue(@"HFCharacteristicStateGroupedTitleStatusTampered", @"HFCharacteristicStateGroupedTitleStatusTampered", 1);
    v105[1] = v35;
    v104[2] = v68;
    v36 = _HFLocalizedStringWithDefaultValue(@"HFCharacteristicStateGroupedTitleStatusFault", @"HFCharacteristicStateGroupedTitleStatusFault", 1);
    v105[2] = v36;
    id v37 = [NSDictionary dictionaryWithObjects:v105 forKeys:v104 count:3];

    uint64_t v38 = [v37 objectForKey:v75];
    id v39 = (void *)v96[5];
    v96[5] = v38;

    uint64_t v40 = [MEMORY[0x263F1C550] systemRedColor];
    id v41 = (id)v90[5];
    v90[5] = v40;
  }
  else
  {
    v75 = objc_msgSend(MEMORY[0x263F0E708], "hf_sensorCharacteristicTypeForServiceType:", v30);
    v42 = [v77 objectForKey:v75];
    objc_opt_class();
    id v37 = v42;
    if (objc_opt_isKindOfClass()) {
      v43 = v37;
    }
    else {
      v43 = 0;
    }
    id v41 = v43;

    if (v41)
    {
      v44 = [(HFControlItem *)self valueSource];
      v45 = [v44 metadataForCharacteristicType:v75];

      uint64_t v46 = *MEMORY[0x263F0BF80];
      v103[0] = *MEMORY[0x263F0C3F0];
      v103[1] = v46;
      uint64_t v47 = *v31;
      v103[2] = *MEMORY[0x263F0BFB0];
      v103[3] = v47;
      uint64_t v48 = *v33;
      v103[4] = *v32;
      v103[5] = v48;
      v49 = [MEMORY[0x263EFF8C0] arrayWithObjects:v103 count:6];
      int v50 = [v49 containsObject:v75];

      if (v50) {
        objc_msgSend(MEMORY[0x263F08878], "hf_controlDescriptionFormatterForCharacteristicType:withMetadata:options:form:", v75, v45, 0, 1);
      }
      else {
      v51 = objc_msgSend(MEMORY[0x263F08878], "hf_valueFormatterForCharacteristicType:withMetadata:options:", v75, v45, 0);
      }
      uint64_t v52 = [v51 stringForObjectValue:v41];
      v53 = (void *)v96[5];
      v96[5] = v52;
    }
    uint64_t v54 = [(id)objc_opt_class() defaultMainTextColorForCharacteristicType:v75];
    v55 = (void *)v90[5];
    v90[5] = v54;
  }
  uint64_t v56 = *MEMORY[0x263F0C008];
  v101[0] = *MEMORY[0x263F0BF40];
  v101[1] = v56;
  v102[0] = @"AirQuality";
  v102[1] = @"ContactSensor";
  uint64_t v57 = *MEMORY[0x263F0C110];
  v101[2] = *MEMORY[0x263F0C0A0];
  v101[3] = v57;
  v102[2] = @"LightSensor";
  v102[3] = @"TemperatureSensor";
  uint64_t v58 = *MEMORY[0x263F0BF80];
  v101[4] = *MEMORY[0x263F0C3F0];
  v101[5] = v58;
  v102[4] = @"SmokeSensor";
  v102[5] = @"CarbonDioxideSensor";
  uint64_t v59 = *v31;
  v101[6] = *MEMORY[0x263F0BFB0];
  v101[7] = v59;
  v102[6] = @"CarbonMonoxideSensor";
  v102[7] = @"LeakSensor";
  uint64_t v60 = *v33;
  v101[8] = *v32;
  v101[9] = v60;
  v102[8] = @"MotionSensor";
  v102[9] = @"OccupancySensor";
  v101[10] = *MEMORY[0x263F0C0E0];
  v102[10] = @"HumiditySensor";
  v61 = [NSDictionary dictionaryWithObjects:v102 forKeys:v101 count:11];
  v62 = objc_msgSend(MEMORY[0x263F0E708], "hf_sensorCharacteristicTypeForServiceType:", v30);
  v63 = NSString;
  v64 = [v61 objectForKey:v62];
  v65 = [v63 stringWithFormat:@"HFServiceType%@", v64];

  uint64_t v66 = _HFLocalizedStringWithDefaultValue(v65, v65, 1);
  v67 = (void *)v84[5];
  v84[5] = v66;

  if (v71) {
    v71[2](v71);
  }

  _Block_object_dispose(&v83, 8);
  _Block_object_dispose(&v89, 8);

  _Block_object_dispose(&v95, 8);
}

void *__103__HFDictionaryValueControlItem_getStatus_mainTextColor_supplementaryDescription_withBatchReadResponse___block_invoke(void *result)
{
  v1 = result;
  if (result[7])
  {
    result = *(id *)(*(void *)(result[4] + 8) + 40);
    *(void *)v1[7] = result;
  }
  if (v1[8])
  {
    result = *(id *)(*(void *)(v1[5] + 8) + 40);
    *(void *)v1[8] = result;
  }
  if (v1[9])
  {
    result = *(id *)(*(void *)(v1[6] + 8) + 40);
    *(void *)v1[9] = result;
  }
  return result;
}

+ (id)defaultMainTextColorForCharacteristicType:(id)a3
{
  v11[2] = *MEMORY[0x263EF8340];
  v10[0] = *MEMORY[0x263F0BF40];
  id v3 = (void *)MEMORY[0x263F1C550];
  id v4 = a3;
  v5 = [v3 labelColor];
  v11[0] = v5;
  v10[1] = *MEMORY[0x263F0C0A0];
  id v6 = [MEMORY[0x263F1C550] systemYellowColor];
  v11[1] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  id v8 = [v7 objectForKey:v4];

  return v8;
}

- (NSString)characteristicType
{
  return self->_characteristicType;
}

- (void).cxx_destruct
{
}

@end