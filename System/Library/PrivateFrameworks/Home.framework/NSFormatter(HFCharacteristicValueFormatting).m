@interface NSFormatter(HFCharacteristicValueFormatting)
+ (HFFormatterTransformer)_hf_microgramsPerMeterCubedFormatter;
+ (HFFormatterTransformer)_hf_partsPerMillionFormatter;
+ (HFFormatterTransformer)hf_controlDescriptionFormatterForCharacteristicType:()HFCharacteristicValueFormatting withMetadata:options:form:;
+ (HFValueSetFormatter)_hf_filterChangeIndicationFormatter;
+ (id)_hf_airParticulateSizeFormatter;
+ (id)_hf_airQualityFormatter;
+ (id)_hf_configurationStateFormatter;
+ (id)_hf_contactStateStateFormatter;
+ (id)_hf_controlDescriptionForDetectionCharacteristicOfType:()HFCharacteristicValueFormatting withValue:valueDescription:form:;
+ (id)_hf_controlTitleForCharacteristicType:()HFCharacteristicValueFormatting;
+ (id)_hf_currentAirPurifierStateFormatter;
+ (id)_hf_currentSecuritySystemStateFormatter;
+ (id)_hf_customValueFormatterForCharacteristicType:()HFCharacteristicValueFormatting metadata:options:;
+ (id)_hf_doorStateFormatter;
+ (id)_hf_heatingCoolingFormatter;
+ (id)_hf_lockMechanismStateFormatter;
+ (id)_hf_percentFormatterForMetadata:()HFCharacteristicValueFormatting;
+ (id)_hf_positionFormatterWithMetadata:()HFCharacteristicValueFormatting options:;
+ (id)_hf_positionStateFormatter;
+ (id)_hf_powerStateFormatter;
+ (id)_hf_rotationDirectionFormatter;
+ (id)_hf_targetSecuritySystemStateFormatter;
+ (id)_hf_temperatureUnitFormatter;
+ (id)_hf_valueFormatterForCharacteristicMetadata:()HFCharacteristicValueFormatting options:;
+ (id)_hf_valueSetFormatterForCharacteristicType:()HFCharacteristicValueFormatting options:;
+ (id)hf_controlDescriptionFormatterForCharacteristic:()HFCharacteristicValueFormatting options:form:;
+ (id)hf_valueFormatterForCharacteristic:()HFCharacteristicValueFormatting options:;
+ (id)hf_valueFormatterForCharacteristicType:()HFCharacteristicValueFormatting withMetadata:options:;
+ (uint64_t)_hf_controlDescriptionForDetectionCharacteristicOfType:()HFCharacteristicValueFormatting withValue:valueDescription:;
+ (uint64_t)_hf_lockMechanismLastKnownActionFormatter;
+ (uint64_t)hf_controlDescriptionFormatterForCharacteristic:()HFCharacteristicValueFormatting options:;
+ (uint64_t)hf_controlDescriptionFormatterForCharacteristicType:()HFCharacteristicValueFormatting withMetadata:options:;
@end

@implementation NSFormatter(HFCharacteristicValueFormatting)

+ (id)_hf_doorStateFormatter
{
  v2 = HFValueSetStringProviderWithMap(a2, &__block_literal_global_106_0);
  v3 = +[HFValueSetFormatter formatterWithStringProvider:v2];

  return v3;
}

+ (id)_hf_lockMechanismStateFormatter
{
  v2 = HFValueSetStringProviderWithMap(a2, &__block_literal_global_162);
  v3 = +[HFValueSetFormatter formatterWithStringProvider:v2];

  return v3;
}

+ (id)hf_controlDescriptionFormatterForCharacteristic:()HFCharacteristicValueFormatting options:form:
{
  id v8 = a4;
  id v9 = a3;
  v10 = [v9 characteristicType];
  v11 = [v9 metadata];

  v12 = objc_msgSend(a1, "hf_controlDescriptionFormatterForCharacteristicType:withMetadata:options:form:", v10, v11, v8, a5);

  return v12;
}

+ (HFFormatterTransformer)hf_controlDescriptionFormatterForCharacteristicType:()HFCharacteristicValueFormatting withMetadata:options:form:
{
  v48[7] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  v12 = objc_msgSend(a1, "hf_valueFormatterForCharacteristicType:withMetadata:options:", v10, a4, v11);
  if (qword_26AB2FE08 != -1) {
    dispatch_once(&qword_26AB2FE08, &__block_literal_global_288_0);
  }
  id v13 = (id)qword_26AB2FE10;
  if ([v13 containsObject:v10])
  {
    v14 = v12;
LABEL_8:
    v19 = v14;
    goto LABEL_21;
  }
  v15 = objc_msgSend(MEMORY[0x263F0E248], "hf_powerStateCharacteristicTypes");
  int v16 = [v15 containsObject:v10];

  if (v16)
  {
    v17 = [HFFormatterTransformer alloc];
    v18 = &__block_literal_global_290_0;
LABEL_7:
    v14 = [(HFFormatterTransformer *)v17 initWithSourceFormatter:v12 transformBlock:v18];
    goto LABEL_8;
  }
  uint64_t v20 = *MEMORY[0x263F0BF80];
  v48[0] = *MEMORY[0x263F0BF40];
  v48[1] = v20;
  uint64_t v21 = *MEMORY[0x263F0C238];
  v48[2] = *MEMORY[0x263F0BFB0];
  v48[3] = v21;
  uint64_t v22 = *MEMORY[0x263F0C2C0];
  v48[4] = *MEMORY[0x263F0C288];
  v48[5] = v22;
  v48[6] = *MEMORY[0x263F0C3F0];
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:7];
  int v24 = [v23 containsObject:v10];

  if (v24)
  {
    v25 = [HFFormatterTransformer alloc];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __126__NSFormatter_HFCharacteristicValueFormatting__hf_controlDescriptionFormatterForCharacteristicType_withMetadata_options_form___block_invoke_4;
    v44[3] = &unk_26409B940;
    v46 = a1;
    id v45 = v10;
    uint64_t v47 = a6;
    v19 = [(HFFormatterTransformer *)v25 initWithSourceFormatter:v12 transformBlock:v44];
    v26 = v45;
  }
  else if ([v10 isEqualToString:*MEMORY[0x263F0C0E0]] {
         && ([v11 objectForKey:@"roomName"],
  }
             v27 = objc_claimAutoreleasedReturnValue(),
             v27,
             v27))
  {
    v28 = [HFFormatterTransformer alloc];
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __126__NSFormatter_HFCharacteristicValueFormatting__hf_controlDescriptionFormatterForCharacteristicType_withMetadata_options_form___block_invoke_5;
    v42[3] = &unk_26409B968;
    id v43 = v11;
    v19 = [(HFFormatterTransformer *)v28 initWithSourceFormatter:v12 transformBlock:v42];
    v26 = v43;
  }
  else if ([v10 isEqualToString:*MEMORY[0x263F0C110]] {
         && ([v11 objectForKey:@"roomName"],
  }
             v29 = objc_claimAutoreleasedReturnValue(),
             v29,
             v29))
  {
    v30 = [HFFormatterTransformer alloc];
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __126__NSFormatter_HFCharacteristicValueFormatting__hf_controlDescriptionFormatterForCharacteristicType_withMetadata_options_form___block_invoke_6;
    v40[3] = &unk_26409B968;
    id v41 = v11;
    v19 = [(HFFormatterTransformer *)v30 initWithSourceFormatter:v12 transformBlock:v40];
    v26 = v41;
  }
  else
  {
    if (![v10 isEqualToString:*MEMORY[0x263F0C0A0]]
      || ([v11 objectForKey:@"roomName"],
          v31 = objc_claimAutoreleasedReturnValue(),
          v31,
          !v31))
    {
      if (![v10 isEqualToString:*MEMORY[0x263F0C5B8]])
      {
        v34 = objc_msgSend(a1, "_hf_controlTitleForCharacteristicType:", v10);
        if (v34)
        {
          v35 = [HFFormatterTransformer alloc];
          v36[0] = MEMORY[0x263EF8330];
          v36[1] = 3221225472;
          v36[2] = __126__NSFormatter_HFCharacteristicValueFormatting__hf_controlDescriptionFormatterForCharacteristicType_withMetadata_options_form___block_invoke_9;
          v36[3] = &unk_26409B968;
          id v37 = v34;
          v19 = [(HFFormatterTransformer *)v35 initWithSourceFormatter:v12 transformBlock:v36];
        }
        else
        {
          v19 = v12;
        }

        goto LABEL_21;
      }
      v17 = [HFFormatterTransformer alloc];
      v18 = &__block_literal_global_307_0;
      goto LABEL_7;
    }
    v32 = [HFFormatterTransformer alloc];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __126__NSFormatter_HFCharacteristicValueFormatting__hf_controlDescriptionFormatterForCharacteristicType_withMetadata_options_form___block_invoke_7;
    v38[3] = &unk_26409B968;
    id v39 = v11;
    v19 = [(HFFormatterTransformer *)v32 initWithSourceFormatter:v12 transformBlock:v38];
    v26 = v39;
  }

LABEL_21:
  return v19;
}

+ (id)hf_valueFormatterForCharacteristic:()HFCharacteristicValueFormatting options:
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 characteristicType];
  id v9 = [v7 metadata];

  id v10 = objc_msgSend(a1, "hf_valueFormatterForCharacteristicType:withMetadata:options:", v8, v9, v6);

  return v10;
}

+ (id)hf_valueFormatterForCharacteristicType:()HFCharacteristicValueFormatting withMetadata:options:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8) {
    NSLog(&cfstr_NoCharacterist_1.isa);
  }
  id v11 = objc_msgSend(a1, "_hf_customValueFormatterForCharacteristicType:metadata:options:", v8, v9, v10);
  if (!v11)
  {
    id v11 = objc_msgSend(a1, "_hf_valueFormatterForCharacteristicMetadata:options:", v9, v10);
  }

  return v11;
}

+ (id)_hf_customValueFormatterForCharacteristicType:()HFCharacteristicValueFormatting metadata:options:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_msgSend(a1, "_hf_valueSetFormatterForCharacteristicType:options:", v8, v10);
  if (v11)
  {
    id v12 = v11;
    goto LABEL_23;
  }
  if (_MergedGlobals_320 != -1) {
    dispatch_once(&_MergedGlobals_320, &__block_literal_global_10_12);
  }
  id v13 = (id)qword_26AB2FDC0;
  if (qword_26AB2FDC8 != -1) {
    dispatch_once(&qword_26AB2FDC8, &__block_literal_global_15_12);
  }
  id v14 = (id)qword_26AB2FDD0;
  if (qword_26AB2FDD8 != -1) {
    dispatch_once(&qword_26AB2FDD8, &__block_literal_global_19_12);
  }
  id v15 = (id)qword_26AB2FDE0;
  if (qword_26AB2FDE8 != -1) {
    dispatch_once(&qword_26AB2FDE8, &__block_literal_global_23_6);
  }
  id v16 = (id)qword_26AB2FDF0;
  if (qword_26AB2FDF8 != -1) {
    dispatch_once(&qword_26AB2FDF8, &__block_literal_global_27_15);
  }
  id v17 = (id)qword_26AB2FE00;
  if ([v17 containsObject:v8])
  {
    uint64_t v18 = objc_msgSend(a1, "_hf_microgramsPerMeterCubedFormatter");
  }
  else if ([v8 isEqualToString:*MEMORY[0x263F0C168]])
  {
    uint64_t v18 = objc_msgSend(a1, "_hf_filterChangeIndicationFormatter");
  }
  else if ([v13 containsObject:v8])
  {
    uint64_t v18 = objc_msgSend(a1, "_hf_positionFormatterWithMetadata:options:", v9, v10);
  }
  else
  {
    if (![v15 containsObject:v8])
    {
      if ([v14 containsObject:v8]
        || [v16 containsObject:v8]
        && _HFCharacteristicMetadataTypeIsReallyBinary(v9))
      {
        uint64_t v21 = +[HFFormatterManager sharedInstance];
        v19 = [v21 BOOLeanFormatter];
      }
      else
      {
        v19 = 0;
      }
      goto LABEL_22;
    }
    uint64_t v18 = objc_msgSend(a1, "_hf_partsPerMillionFormatter");
  }
  v19 = (void *)v18;
LABEL_22:
  id v12 = v19;

LABEL_23:
  return v12;
}

+ (id)_hf_valueSetFormatterForCharacteristicType:()HFCharacteristicValueFormatting options:
{
  v21[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x263F0E248], "hf_powerStateCharacteristicTypes");
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    uint64_t v7 = objc_msgSend(a1, "_hf_powerStateFormatter");
LABEL_31:
    id v17 = (void *)v7;
    goto LABEL_32;
  }
  uint64_t v8 = *MEMORY[0x263F0C4A8];
  v21[0] = *MEMORY[0x263F0C040];
  v21[1] = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
  int v10 = [v9 containsObject:v4];

  if (v10)
  {
    uint64_t v7 = objc_msgSend(a1, "_hf_doorStateFormatter");
    goto LABEL_31;
  }
  uint64_t v11 = *MEMORY[0x263F0C4D8];
  v20[0] = *MEMORY[0x263F0C068];
  v20[1] = v11;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  int v13 = [v12 containsObject:v4];

  if (v13)
  {
    uint64_t v7 = objc_msgSend(a1, "_hf_heatingCoolingFormatter");
    goto LABEL_31;
  }
  uint64_t v14 = *MEMORY[0x263F0C510];
  v19[0] = *MEMORY[0x263F0C0B0];
  v19[1] = v14;
  id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  int v16 = [v15 containsObject:v4];

  if (v16)
  {
    uint64_t v7 = objc_msgSend(a1, "_hf_lockMechanismStateFormatter");
    goto LABEL_31;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F0C370]])
  {
    uint64_t v7 = objc_msgSend(a1, "_hf_rotationDirectionFormatter");
    goto LABEL_31;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F0C578]])
  {
    uint64_t v7 = objc_msgSend(a1, "_hf_temperatureUnitFormatter");
    goto LABEL_31;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F0C250]])
  {
    uint64_t v7 = objc_msgSend(a1, "_hf_lockMechanismLastKnownActionFormatter");
    goto LABEL_31;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F0BF30]])
  {
    uint64_t v7 = objc_msgSend(a1, "_hf_airParticulateSizeFormatter");
    goto LABEL_31;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F0BF40]])
  {
    uint64_t v7 = objc_msgSend(a1, "_hf_airQualityFormatter");
    goto LABEL_31;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F0C320]])
  {
    uint64_t v7 = objc_msgSend(a1, "_hf_positionStateFormatter");
    goto LABEL_31;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F0C0E8]])
  {
    uint64_t v7 = objc_msgSend(a1, "_hf_currentSecuritySystemStateFormatter");
    goto LABEL_31;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F0C548]])
  {
    uint64_t v7 = objc_msgSend(a1, "_hf_targetSecuritySystemStateFormatter");
    goto LABEL_31;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F0C008]])
  {
    uint64_t v7 = objc_msgSend(a1, "_hf_contactStateStateFormatter");
    goto LABEL_31;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F0C030]])
  {
    uint64_t v7 = objc_msgSend(a1, "_hf_currentAirPurifierStateFormatter");
    goto LABEL_31;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F0C218]])
  {
    uint64_t v7 = objc_msgSend(a1, "_hf_configurationStateFormatter");
    goto LABEL_31;
  }
  id v17 = 0;
LABEL_32:

  return v17;
}

+ (id)_hf_powerStateFormatter
{
  v2 = HFValueSetStringProviderWithMap(a2, &__block_literal_global_98_2);
  v3 = +[HFValueSetFormatter formatterWithStringProvider:v2];

  return v3;
}

+ (uint64_t)hf_controlDescriptionFormatterForCharacteristic:()HFCharacteristicValueFormatting options:
{
  return objc_msgSend(a1, "hf_controlDescriptionFormatterForCharacteristic:options:form:", a3, a4, 0);
}

+ (id)_hf_valueFormatterForCharacteristicMetadata:()HFCharacteristicValueFormatting options:
{
  void v20[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 units];
  uint64_t v6 = *MEMORY[0x263F0BE80];
  uint64_t v7 = *MEMORY[0x263F0BE98];
  v20[0] = *MEMORY[0x263F0BE80];
  v20[1] = v7;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  int v9 = [v8 containsObject:v5];

  if (v9)
  {
    int v10 = +[HFFormatterManager sharedInstance];
    uint64_t v11 = [v10 temperatureFormatter];

    objc_msgSend(v11, "setInputIsCelsius:", objc_msgSend(v5, "isEqualToString:", v6));
    if (!v11) {
      goto LABEL_15;
    }
LABEL_14:
    id v14 = v11;
    goto LABEL_24;
  }
  if ([v5 isEqualToString:*MEMORY[0x263F0BEB0]])
  {
    uint64_t v11 = objc_msgSend(a1, "_hf_percentFormatterForMetadata:", v4);
    if (v11) {
      goto LABEL_14;
    }
  }
  else
  {
    if ([v5 isEqualToString:*MEMORY[0x263F0BEC8]])
    {
      id v12 = +[HFFormatterManager sharedInstance];
      uint64_t v13 = [v12 timeIntervalFormatter];
    }
    else if ([v5 isEqualToString:*MEMORY[0x263F0BE78]])
    {
      id v12 = +[HFFormatterManager sharedInstance];
      uint64_t v13 = [v12 arcDegreeFormatter];
    }
    else
    {
      if (![v5 isEqualToString:*MEMORY[0x263F0BEA0]]) {
        goto LABEL_15;
      }
      id v12 = +[HFFormatterManager sharedInstance];
      uint64_t v13 = [v12 luxFormatter];
    }
    uint64_t v11 = (void *)v13;

    if (v11) {
      goto LABEL_14;
    }
  }
LABEL_15:
  id v15 = [v4 format];
  if ([v15 isEqualToString:*MEMORY[0x263F0BE38]])
  {
    int v16 = +[HFFormatterManager sharedInstance];
    uint64_t v17 = [v16 BOOLeanFormatter];
LABEL_22:
    id v18 = (id)v17;

    goto LABEL_23;
  }
  if ([v15 isEqualToString:*MEMORY[0x263F0BE50]])
  {
    int v16 = +[HFFormatterManager sharedInstance];
    uint64_t v17 = [v16 identityFormatter];
    goto LABEL_22;
  }
  if (!objc_msgSend(v4, "hf_isNumeric"))
  {
    int v16 = +[HFFormatterManager sharedInstance];
    uint64_t v17 = [v16 emptyStringFormatter];
    goto LABEL_22;
  }
  id v18 = objc_alloc_init(MEMORY[0x263F08A30]);
LABEL_23:
  id v14 = v18;

LABEL_24:
  return v14;
}

+ (id)_hf_percentFormatterForMetadata:()HFCharacteristicValueFormatting
{
  id v3 = a3;
  id v4 = +[HFFormatterManager sharedInstance];
  v5 = [v4 percentFormatter];

  uint64_t v6 = [v3 maximumValue];

  if (v6)
  {
    uint64_t v7 = [v3 maximumValue];
    [v5 setMaximumValue:v7];
  }
  return v5;
}

+ (id)_hf_positionFormatterWithMetadata:()HFCharacteristicValueFormatting options:
{
  void v21[3] = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = objc_msgSend(a1, "_hf_percentFormatterForMetadata:", a3);
  uint64_t v8 = *MEMORY[0x263F0D8A8];
  v20[0] = *MEMORY[0x263F0D6A8];
  v20[1] = v8;
  v21[0] = @"HMServiceTypeDoor";
  v21[1] = @"HMServiceTypeWindow";
  void v20[2] = *MEMORY[0x263F0D8B8];
  v21[2] = @"HMServiceTypeWindowCovering";
  int v9 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];
  int v10 = [v6 objectForKeyedSubscript:@"serviceType"];
  uint64_t v11 = [v9 objectForKey:v10];

  if (!v11)
  {
    id v12 = [v6 objectForKeyedSubscript:@"serviceType"];
    NSLog(&cfstr_NoFormatString.isa, v12);
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __90__NSFormatter_HFCharacteristicValueFormatting___hf_positionFormatterWithMetadata_options___block_invoke;
  v17[3] = &unk_26409B8D8;
  id v18 = v11;
  id v19 = v7;
  id v13 = v7;
  id v14 = v11;
  id v15 = +[HFValueSetFormatter formatterWithStringProvider:v17];

  return v15;
}

+ (HFValueSetFormatter)_hf_filterChangeIndicationFormatter
{
  return +[HFValueSetFormatter formatterWithStringProvider:&__block_literal_global_63_4];
}

+ (HFFormatterTransformer)_hf_partsPerMillionFormatter
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v0 setUsesGroupingSeparator:1];
  v1 = [[HFFormatterTransformer alloc] initWithSourceFormatter:v0 transformBlock:&__block_literal_global_77_2];

  return v1;
}

+ (HFFormatterTransformer)_hf_microgramsPerMeterCubedFormatter
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v0 setUsesGroupingSeparator:1];
  v1 = [[HFFormatterTransformer alloc] initWithSourceFormatter:v0 transformBlock:&__block_literal_global_88];

  return v1;
}

+ (id)_hf_heatingCoolingFormatter
{
  v2 = HFValueSetStringProviderWithMap(a2, &__block_literal_global_132_0);
  id v3 = +[HFValueSetFormatter formatterWithStringProvider:v2];

  return v3;
}

+ (id)_hf_rotationDirectionFormatter
{
  v2 = HFValueSetStringProviderWithMap(a2, &__block_literal_global_146_1);
  id v3 = +[HFValueSetFormatter formatterWithStringProvider:v2];

  return v3;
}

+ (id)_hf_temperatureUnitFormatter
{
  v2 = HFValueSetStringProviderWithMap(a2, &__block_literal_global_154_0);
  id v3 = +[HFValueSetFormatter formatterWithStringProvider:v2];

  return v3;
}

+ (id)_hf_airParticulateSizeFormatter
{
  v2 = HFValueSetStringProviderWithMap(a2, &__block_literal_global_176);
  id v3 = +[HFValueSetFormatter formatterWithStringProvider:v2];

  return v3;
}

+ (id)_hf_airQualityFormatter
{
  v2 = HFValueSetStringProviderWithMap(a2, &__block_literal_global_190_1);
  id v3 = +[HFValueSetFormatter formatterWithStringProvider:v2];

  return v3;
}

+ (id)_hf_positionStateFormatter
{
  v2 = HFValueSetStringProviderWithMap(a2, &__block_literal_global_212_0);
  id v3 = +[HFValueSetFormatter formatterWithStringProvider:v2];

  return v3;
}

+ (id)_hf_currentSecuritySystemStateFormatter
{
  v2 = HFValueSetStringProviderWithMap(a2, &__block_literal_global_223_0);
  id v3 = +[HFValueSetFormatter formatterWithStringProvider:v2];

  return v3;
}

+ (id)_hf_targetSecuritySystemStateFormatter
{
  v2 = HFValueSetStringProviderWithMap(a2, &__block_literal_global_240_0);
  id v3 = +[HFValueSetFormatter formatterWithStringProvider:v2];

  return v3;
}

+ (id)_hf_contactStateStateFormatter
{
  v2 = HFValueSetStringProviderWithMap(a2, &__block_literal_global_254_1);
  id v3 = +[HFValueSetFormatter formatterWithStringProvider:v2];

  return v3;
}

+ (id)_hf_currentAirPurifierStateFormatter
{
  v2 = HFValueSetStringProviderWithMap(a2, &__block_literal_global_267);
  id v3 = +[HFValueSetFormatter formatterWithStringProvider:v2];

  return v3;
}

+ (id)_hf_configurationStateFormatter
{
  v2 = HFValueSetStringProviderWithMap(a2, &__block_literal_global_278);
  id v3 = +[HFValueSetFormatter formatterWithStringProvider:v2];

  return v3;
}

+ (uint64_t)_hf_lockMechanismLastKnownActionFormatter
{
  return 0;
}

+ (uint64_t)hf_controlDescriptionFormatterForCharacteristicType:()HFCharacteristicValueFormatting withMetadata:options:
{
  return objc_msgSend(a1, "hf_controlDescriptionFormatterForCharacteristicType:withMetadata:options:form:", a3, a4, a5, 0);
}

+ (uint64_t)_hf_controlDescriptionForDetectionCharacteristicOfType:()HFCharacteristicValueFormatting withValue:valueDescription:
{
  return objc_msgSend(a1, "_hf_controlDescriptionForDetectionCharacteristicOfType:withValue:valueDescription:form:", a3, a4, a5, 0);
}

+ (id)_hf_controlDescriptionForDetectionCharacteristicOfType:()HFCharacteristicValueFormatting withValue:valueDescription:form:
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = @"Simple";
  if (a6 != 1) {
    id v12 = 0;
  }
  if (a6) {
    id v13 = v12;
  }
  else {
    id v13 = &stru_26C081158;
  }
  if ([v9 isEqualToString:*MEMORY[0x263F0BF40]])
  {
    uint64_t v20 = HFLocalizedStringWithFormat(@"HFCharacteristicDescriptionFormatAirQuality", @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    goto LABEL_24;
  }
  if ([v9 isEqualToString:*MEMORY[0x263F0BF80]])
  {
    uint64_t v21 = [NSString stringWithFormat:@"HFCharacteristicTitleCO2Detected%@", v13];
    [NSString stringWithFormat:@"HFCharacteristicTitleNoCO2Detected%@", v13];
    uint64_t v22 = LABEL_20:;
    if ([v10 BOOLValue]) {
      v23 = v21;
    }
    else {
      v23 = v22;
    }
    uint64_t v20 = _HFLocalizedStringWithDefaultValue(v23, v23, 1);

    goto LABEL_24;
  }
  if ([v9 isEqualToString:*MEMORY[0x263F0BFB0]])
  {
    uint64_t v21 = [NSString stringWithFormat:@"HFCharacteristicTitleCODetected%@", v13];
    [NSString stringWithFormat:@"HFCharacteristicTitleNoCODetected%@", v13];
    goto LABEL_20;
  }
  if ([v9 isEqualToString:*MEMORY[0x263F0C238]])
  {
    uint64_t v21 = [NSString stringWithFormat:@"HFCharacteristicTitleLeakDetected%@", v13];
    [NSString stringWithFormat:@"HFCharacteristicTitleNoLeakDetected%@", v13];
    goto LABEL_20;
  }
  if ([v9 isEqualToString:*MEMORY[0x263F0C288]])
  {
    uint64_t v21 = [NSString stringWithFormat:@"HFCharacteristicTitleMotionDetected%@", v13];
    [NSString stringWithFormat:@"HFCharacteristicTitleNoMotionDetected%@", v13];
    goto LABEL_20;
  }
  if ([v9 isEqualToString:*MEMORY[0x263F0C2C0]])
  {
    uint64_t v21 = [NSString stringWithFormat:@"HFCharacteristicTitleOccupancyDetected%@", v13];
    [NSString stringWithFormat:@"HFCharacteristicTitleNoOccupancyDetected%@", v13];
    goto LABEL_20;
  }
  if ([v9 isEqualToString:*MEMORY[0x263F0C3F0]])
  {
    uint64_t v21 = [NSString stringWithFormat:@"HFCharacteristicTitleSmokeDetected%@", v13];
    [NSString stringWithFormat:@"HFCharacteristicTitleNoSmokeDetected%@", v13];
    goto LABEL_20;
  }
  uint64_t v20 = 0;
LABEL_24:

  return v20;
}

+ (id)_hf_controlTitleForCharacteristicType:()HFCharacteristicValueFormatting
{
  id v3 = a3;
  if (qword_26AB2FE18 != -1) {
    dispatch_once(&qword_26AB2FE18, &__block_literal_global_359_1);
  }
  id v4 = (id)qword_26AB2FE20;
  v5 = [v4 objectForKeyedSubscript:v3];
  if (v5) {
    goto LABEL_4;
  }
  id v6 = objc_msgSend(MEMORY[0x263F0E248], "hf_associatedCharacteristicTypeForCharacteristicType:", v3);
  if (v6)
  {
    v5 = [v4 objectForKeyedSubscript:v6];

    if (v5)
    {
LABEL_4:
      id v6 = _HFLocalizedStringWithDefaultValue(v5, v5, 1);

      goto LABEL_5;
    }
    id v6 = 0;
  }
LABEL_5:

  return v6;
}

@end