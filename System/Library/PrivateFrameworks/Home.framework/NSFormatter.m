@interface NSFormatter
@end

@implementation NSFormatter

id __126__NSFormatter_HFCharacteristicValueFormatting__hf_controlDescriptionFormatterForCharacteristicType_withMetadata_options_form___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = _HFLocalizedStringWithDefaultValue(@"HFCharacteristicValuePowerStateOn", @"HFCharacteristicValuePowerStateOn", 1);
  int v4 = [v2 isEqualToString:v3];

  if (v4) {
    v5 = @"HFCharacteristicTitlePowerStateOn";
  }
  else {
    v5 = @"HFCharacteristicTitlePowerStateOff";
  }
  v6 = _HFLocalizedStringWithDefaultValue(v5, v5, 1);
  return v6;
}

id __71__NSFormatter_HFCharacteristicValueFormatting___hf_powerStateFormatter__block_invoke()
{
  v3[2] = *MEMORY[0x263EF8340];
  v2[0] = MEMORY[0x263EFFA88];
  v2[1] = MEMORY[0x263EFFA80];
  v3[0] = @"HFCharacteristicValuePowerStateOn";
  v3[1] = @"HFCharacteristicValuePowerStateOff";
  v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:2];
  return v0;
}

void __111__NSFormatter_HFCharacteristicValueFormatting___hf_customValueFormatterForCharacteristicType_metadata_options___block_invoke_8()
{
  v5[2] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0C208];
  v5[0] = *MEMORY[0x263F0C2E8];
  v5[1] = v1;
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:2];
  uint64_t v3 = [v0 setWithArray:v2];
  int v4 = (void *)qword_26AB2FDF0;
  qword_26AB2FDF0 = v3;
}

void __111__NSFormatter_HFCharacteristicValueFormatting___hf_customValueFormatterForCharacteristicType_metadata_options___block_invoke_2()
{
  v5[2] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0C520];
  v5[0] = *MEMORY[0x263F0C0D0];
  v5[1] = v1;
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:2];
  uint64_t v3 = [v0 setWithArray:v2];
  int v4 = (void *)qword_26AB2FDC0;
  qword_26AB2FDC0 = v3;
}

id __79__NSFormatter_HFCharacteristicValueFormatting___hf_lockMechanismStateFormatter__block_invoke()
{
  v3[4] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26C0F7C08;
  v2[1] = &unk_26C0F7C20;
  v3[0] = @"HFCharacteristicValueLockMechanismStateUnsecured";
  v3[1] = @"HFCharacteristicValueLockMechanismStateSecured";
  void v2[2] = &unk_26C0F7C38;
  v2[3] = &unk_26C0F7C50;
  v3[2] = @"HFCharacteristicValueLockMechanismStateJammed";
  void v3[3] = @"HFCharacteristicValueLockMechanismStateUnknown";
  v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:4];
  return v0;
}

void __111__NSFormatter_HFCharacteristicValueFormatting___hf_customValueFormatterForCharacteristicType_metadata_options___block_invoke_6()
{
  v6[4] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0BFD0];
  v6[0] = *MEMORY[0x263F0BFC0];
  v6[1] = v1;
  uint64_t v2 = *MEMORY[0x263F0BFA0];
  v6[2] = *MEMORY[0x263F0BF90];
  v6[3] = v2;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  uint64_t v4 = [v0 setWithArray:v3];
  v5 = (void *)qword_26AB2FDE0;
  qword_26AB2FDE0 = v4;
}

id __70__NSFormatter_HFCharacteristicValueFormatting___hf_doorStateFormatter__block_invoke()
{
  void v3[5] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26C0F7C08;
  v2[1] = &unk_26C0F7C20;
  v3[0] = @"HFCharacteristicValueDoorStateOpen";
  v3[1] = @"HFCharacteristicValueDoorStateClosed";
  void v2[2] = &unk_26C0F7C38;
  v2[3] = &unk_26C0F7C50;
  v3[2] = @"HFCharacteristicValueDoorStateOpening";
  void v3[3] = @"HFCharacteristicValueDoorStateClosing";
  void v2[4] = &unk_26C0F7C68;
  v3[4] = @"HFCharacteristicValueDoorStateStopped";
  v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:5];
  return v0;
}

void __111__NSFormatter_HFCharacteristicValueFormatting___hf_customValueFormatterForCharacteristicType_metadata_options___block_invoke_10()
{
  v7[6] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0C2B0];
  v7[0] = *MEMORY[0x263F0C2F0];
  v7[1] = v1;
  uint64_t v2 = *MEMORY[0x263F0C318];
  v7[2] = *MEMORY[0x263F0C448];
  v7[3] = v2;
  uint64_t v3 = *MEMORY[0x263F0C598];
  v7[4] = *MEMORY[0x263F0C300];
  v7[5] = v3;
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:6];
  uint64_t v5 = [v0 setWithArray:v4];
  v6 = (void *)qword_26AB2FE00;
  qword_26AB2FE00 = v5;
}

void __126__NSFormatter_HFCharacteristicValueFormatting__hf_controlDescriptionFormatterForCharacteristicType_withMetadata_options_form___block_invoke_2()
{
  v8[8] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0C040];
  v8[0] = *MEMORY[0x263F0C4A8];
  v8[1] = v1;
  uint64_t v2 = *MEMORY[0x263F0C0B0];
  v8[2] = *MEMORY[0x263F0C510];
  v8[3] = v2;
  uint64_t v3 = *MEMORY[0x263F0C0E8];
  v8[4] = *MEMORY[0x263F0C548];
  v8[5] = v3;
  uint64_t v4 = *MEMORY[0x263F0C218];
  v8[6] = *MEMORY[0x263F0C030];
  v8[7] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:8];
  uint64_t v6 = [v0 setWithArray:v5];
  v7 = (void *)qword_26AB2FE10;
  qword_26AB2FE10 = v6;
}

void __111__NSFormatter_HFCharacteristicValueFormatting___hf_customValueFormatterForCharacteristicType_metadata_options___block_invoke_4()
{
  v9[11] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0BFB0];
  v9[0] = *MEMORY[0x263F0BF80];
  v9[1] = v1;
  uint64_t v2 = *MEMORY[0x263F0C238];
  v9[2] = *MEMORY[0x263F0BFE8];
  v9[3] = v2;
  uint64_t v3 = *MEMORY[0x263F0C3A0];
  v9[4] = *MEMORY[0x263F0C2C0];
  v9[5] = v3;
  uint64_t v4 = *MEMORY[0x263F0C418];
  v9[6] = *MEMORY[0x263F0C3F0];
  v9[7] = v4;
  uint64_t v5 = *MEMORY[0x263F0C430];
  v9[8] = *MEMORY[0x263F0C420];
  v9[9] = v5;
  v9[10] = *MEMORY[0x263F0C438];
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:11];
  uint64_t v7 = [v0 setWithArray:v6];
  v8 = (void *)qword_26AB2FDD0;
  qword_26AB2FDD0 = v7;
}

__CFString *__90__NSFormatter_HFCharacteristicValueFormatting___hf_positionFormatterWithMetadata_options___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (!*(void *)(a1 + 32))
  {
    uint64_t v6 = &stru_26C081158;
    goto LABEL_10;
  }
  uint64_t v5 = [v3 integerValue];
  if (v5)
  {
    if (v5 != 100)
    {
      uint64_t v7 = [NSString stringWithFormat:@"HFFormatterPositionIntermediate_%@", *(void *)(a1 + 32)];
      v8 = [*(id *)(a1 + 40) stringForObjectValue:v4];
      HFLocalizedStringWithFormat(v7, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v8);
      uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
    [NSString stringWithFormat:@"HFFormatterPositionOpen_%@", *(void *)(a1 + 32)];
  }
  else
  {
    [NSString stringWithFormat:@"HFFormatterPositionClosed_%@", *(void *)(a1 + 32)];
  uint64_t v7 = };
  _HFLocalizedStringWithDefaultValue(v7, v7, 1);
  uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_9:

LABEL_10:
  return v6;
}

id __83__NSFormatter_HFCharacteristicValueFormatting___hf_filterChangeIndicationFormatter__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = @"HFFormatterFilterChangeIndicationUnknown";
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v2 integerValue];
    uint64_t v5 = @"HFFormatterFilterChangeIndicationChangeSoon";
    if (v4 != 1) {
      uint64_t v5 = @"HFFormatterFilterChangeIndicationUnknown";
    }
    if (v4) {
      id v3 = v5;
    }
    else {
      id v3 = @"HFFormatterFilterChangeIndicationGood";
    }
  }
  uint64_t v6 = _HFLocalizedStringWithDefaultValue(v3, v3, 1);

  return v6;
}

id __76__NSFormatter_HFCharacteristicValueFormatting___hf_partsPerMillionFormatter__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v11 = _HFLocalizedStringWithDefaultValue(@"HFFormatterPartsPerMillionUnit", @"HFFormatterPartsPerMillionUnit", 1);
  uint64_t v9 = HFLocalizedStringWithFormat(@"HFFormatterPartsPerMillionFormatString", @"%@%@", v3, v4, v5, v6, v7, v8, (uint64_t)v2);

  return v9;
}

id __84__NSFormatter_HFCharacteristicValueFormatting___hf_microgramsPerMeterCubedFormatter__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v11 = _HFLocalizedStringWithDefaultValue(@"HFFormatterMicrogramsPerCubicMeterUnit", @"HFFormatterMicrogramsPerCubicMeterUnit", 1);
  uint64_t v9 = HFLocalizedStringWithFormat(@"HFFormatterMicrogramsPerCubicMeterFormatString", @"%@%@", v3, v4, v5, v6, v7, v8, (uint64_t)v2);

  return v9;
}

id __75__NSFormatter_HFCharacteristicValueFormatting___hf_heatingCoolingFormatter__block_invoke()
{
  v3[4] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26C0F7C08;
  v2[1] = &unk_26C0F7C20;
  v3[0] = @"HFCharacteristicValueHeatingCoolingOff";
  v3[1] = @"HFCharacteristicValueHeatingCoolingHeat";
  void v2[2] = &unk_26C0F7C38;
  v2[3] = &unk_26C0F7C50;
  v3[2] = @"HFCharacteristicValueHeatingCoolingCool";
  void v3[3] = @"HFCharacteristicValueHeatingCoolingAuto";
  v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:4];
  return v0;
}

id __78__NSFormatter_HFCharacteristicValueFormatting___hf_rotationDirectionFormatter__block_invoke()
{
  v3[2] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26C0F7C08;
  v2[1] = &unk_26C0F7C20;
  v3[0] = @"HFCharacteristicValueRotationDirectionClockwise";
  v3[1] = @"HFCharacteristicValueRotationDirectionCounterClockwise";
  v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:2];
  return v0;
}

id __76__NSFormatter_HFCharacteristicValueFormatting___hf_temperatureUnitFormatter__block_invoke()
{
  v3[2] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26C0F7C08;
  v2[1] = &unk_26C0F7C20;
  v3[0] = @"HFCharacteristicValueTemperatureUnitCelsius";
  v3[1] = @"HFCharacteristicValueTemperatureUnitFahrenheit";
  v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:2];
  return v0;
}

id __79__NSFormatter_HFCharacteristicValueFormatting___hf_airParticulateSizeFormatter__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v19[2] = *MEMORY[0x263EF8340];
  v18[0] = &unk_26C0F7C08;
  uint64_t v8 = HFLocalizedStringWithFormat(@"HFCharacteristicValueAirParticulateSize2_5", @"%.1f", a3, a4, a5, a6, a7, a8, 0x4004000000000000);
  v18[1] = &unk_26C0F7C20;
  v19[0] = v8;
  v15 = HFLocalizedStringWithFormat(@"HFCharacteristicValueAirParticulateSize10", @"%d", v9, v10, v11, v12, v13, v14, 10);
  v19[1] = v15;
  v16 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];

  return v16;
}

id __71__NSFormatter_HFCharacteristicValueFormatting___hf_airQualityFormatter__block_invoke()
{
  void v3[6] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26C0F7C08;
  v2[1] = &unk_26C0F7C20;
  v3[0] = @"HFCharacteristicValueAirQualityUnknown";
  v3[1] = @"HFCharacteristicValueAirQualityExcellent";
  void v2[2] = &unk_26C0F7C38;
  v2[3] = &unk_26C0F7C50;
  v3[2] = @"HFCharacteristicValueAirQualityGood";
  void v3[3] = @"HFCharacteristicValueAirQualityFair";
  void v2[4] = &unk_26C0F7C68;
  void v2[5] = &unk_26C0F7C80;
  v3[4] = @"HFCharacteristicValueAirQualityInferior";
  void v3[5] = @"HFCharacteristicValueAirQualityPoor";
  v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:6];
  return v0;
}

id __74__NSFormatter_HFCharacteristicValueFormatting___hf_positionStateFormatter__block_invoke()
{
  void v3[3] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26C0F7C08;
  v2[1] = &unk_26C0F7C20;
  v3[0] = @"HFCharacteristicValuePositionStateClosing";
  v3[1] = @"HFCharacteristicValuePositionStateOpening";
  void v2[2] = &unk_26C0F7C38;
  v3[2] = @"HFCharacteristicValuePositionStateStopped";
  v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:3];
  return v0;
}

id __87__NSFormatter_HFCharacteristicValueFormatting___hf_currentSecuritySystemStateFormatter__block_invoke()
{
  void v3[5] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26C0F7C08;
  v2[1] = &unk_26C0F7C20;
  v3[0] = @"HFCharacteristicValueCurrentSecuritySystemStateStayArm";
  v3[1] = @"HFCharacteristicValueCurrentSecuritySystemStateAwayArm";
  void v2[2] = &unk_26C0F7C38;
  void v2[3] = &unk_26C0F7C50;
  v3[2] = @"HFCharacteristicValueCurrentSecuritySystemStateNightArm";
  void v3[3] = @"HFCharacteristicValueCurrentSecuritySystemStateDisarmed";
  void v2[4] = &unk_26C0F7C68;
  void v3[4] = @"HFCharacteristicValueCurrentSecuritySystemStateTriggered";
  v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:5];
  return v0;
}

id __86__NSFormatter_HFCharacteristicValueFormatting___hf_targetSecuritySystemStateFormatter__block_invoke()
{
  void v3[4] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26C0F7C08;
  v2[1] = &unk_26C0F7C20;
  v3[0] = @"HFCharacteristicValueTargetSecuritySystemStateStayArm";
  v3[1] = @"HFCharacteristicValueTargetSecuritySystemStateAwayArm";
  void v2[2] = &unk_26C0F7C38;
  void v2[3] = &unk_26C0F7C50;
  v3[2] = @"HFCharacteristicValueTargetSecuritySystemStateNightArm";
  void v3[3] = @"HFCharacteristicValueTargetSecuritySystemStateDisarm";
  v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:4];
  return v0;
}

id __78__NSFormatter_HFCharacteristicValueFormatting___hf_contactStateStateFormatter__block_invoke()
{
  v3[2] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26C0F7C98;
  v2[1] = &unk_26C0F7CB0;
  v3[0] = @"HFCharacteristicValueContactStateContactDetected";
  v3[1] = @"HFCharacteristicValueContactStateContactNotDetected";
  v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:2];
  return v0;
}

id __84__NSFormatter_HFCharacteristicValueFormatting___hf_currentAirPurifierStateFormatter__block_invoke()
{
  void v3[3] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26C0F7C08;
  v2[1] = &unk_26C0F7C20;
  v3[0] = @"HFCharacteristicValueCurrentAirPurifierStateInactive";
  v3[1] = @"HFCharacteristicValueCurrentAirPurifierStateIdle";
  void v2[2] = &unk_26C0F7C38;
  v3[2] = @"HFCharacteristicValueCurrentAirPurifierStateActive";
  v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:3];
  return v0;
}

id __79__NSFormatter_HFCharacteristicValueFormatting___hf_configurationStateFormatter__block_invoke()
{
  v3[2] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26C0F7C08;
  v2[1] = &unk_26C0F7C20;
  v3[0] = @"HFCharacteristicValueConfigurationStateNotConfigured";
  v3[1] = @"HFCharacteristicValueConfigurationStateConfigured";
  v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:2];
  return v0;
}

uint64_t __126__NSFormatter_HFCharacteristicValueFormatting__hf_controlDescriptionFormatterForCharacteristicType_withMetadata_options_form___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 40), "_hf_controlDescriptionForDetectionCharacteristicOfType:withValue:valueDescription:form:", *(void *)(a1 + 32), a3, a2, *(void *)(a1 + 48));
}

id __126__NSFormatter_HFCharacteristicValueFormatting__hf_controlDescriptionFormatterForCharacteristicType_withMetadata_options_form___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v12 = [v2 objectForKey:@"roomName"];
  uint64_t v10 = HFLocalizedStringWithFormat(@"HFCharacteristicDescriptionFormatHumiditySensor", @"%@%@", v4, v5, v6, v7, v8, v9, (uint64_t)v3);

  return v10;
}

id __126__NSFormatter_HFCharacteristicValueFormatting__hf_controlDescriptionFormatterForCharacteristicType_withMetadata_options_form___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v12 = [v2 objectForKey:@"roomName"];
  uint64_t v10 = HFLocalizedStringWithFormat(@"HFCharacteristicDescriptionFormatTemperatureSensor", @"%@%@", v4, v5, v6, v7, v8, v9, (uint64_t)v3);

  return v10;
}

id __126__NSFormatter_HFCharacteristicValueFormatting__hf_controlDescriptionFormatterForCharacteristicType_withMetadata_options_form___block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v12 = [v2 objectForKey:@"roomName"];
  uint64_t v10 = HFLocalizedStringWithFormat(@"HFCharacteristicDescriptionFormatLightSensor", @"%@%@", v4, v5, v6, v7, v8, v9, (uint64_t)v3);

  return v10;
}

id __126__NSFormatter_HFCharacteristicValueFormatting__hf_controlDescriptionFormatterForCharacteristicType_withMetadata_options_form___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return HFLocalizedStringWithFormat(@"HFCharacteristicDescriptionFormatWaterLevel", @"%@", a3, a4, a5, a6, a7, a8, a2);
}

id __126__NSFormatter_HFCharacteristicValueFormatting__hf_controlDescriptionFormatterForCharacteristicType_withMetadata_options_form___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return HFLocalizedStringWithFormat(@"HFCharacteristicDescriptionFormatTitleValue", @"%@%@", a3, a4, a5, a6, a7, a8, a2);
}

void __86__NSFormatter_HFCharacteristicValueFormatting___hf_controlTitleForCharacteristicType___block_invoke_2()
{
  v6[7] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F0C328];
  v5[0] = *MEMORY[0x263F0BF68];
  v5[1] = v0;
  v6[0] = @"HFCharacteristicTitleBrightness";
  v6[1] = @"HFCharacteristicTitlePowerState";
  uint64_t v1 = *MEMORY[0x263F0C378];
  v5[2] = *MEMORY[0x263F0BEF8];
  void v5[3] = v1;
  v6[2] = @"HFCharacteristicTitleActive";
  v6[3] = @"HFCharacteristicTitleRotationSpeed";
  uint64_t v2 = *MEMORY[0x263F0C510];
  v5[4] = *MEMORY[0x263F0C4A8];
  v5[5] = v2;
  v6[4] = @"HFCharacteristicTitleDoorState";
  void v6[5] = @"HFCharacteristicTitleLockState";
  v5[6] = *MEMORY[0x263F0C548];
  v6[6] = @"HFCharacteristicTitleSecuritySystemState";
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:7];
  uint64_t v4 = (void *)qword_26AB2FE20;
  qword_26AB2FE20 = v3;
}

@end