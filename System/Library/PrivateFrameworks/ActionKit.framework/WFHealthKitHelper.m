@interface WFHealthKitHelper
+ (BOOL)readableWorkoutActivityTypeIsValid:(id)a3;
+ (id)BOOLFromReadableMenstrualFlowIsStartOfCycle:(id)a3;
+ (id)BOOLFromReadableSexualActivity:(id)a3;
+ (id)characteristicTypeIdentifierFromReadableTypeIdentifier:(id)a3;
+ (id)extractHKDataFromContentQuery:(id)a3;
+ (id)localizedDisplayNameForUnit:(id)a3 quantityTypeIdentifier:(id)a4;
+ (id)localizedDisplayNameForUnit:(id)a3 value:(id)a4;
+ (id)localizedDisplayNameForUnit:(id)a3 value:(id)a4 quantityTypeIdentifier:(id)a5;
+ (id)readableAppetiteChangesValueFromEnum:(int64_t)a3;
+ (id)readableAppleStandingHourFromEnum:(int64_t)a3;
+ (id)readableAppleStandingHourValues;
+ (id)readableBiologicalSexFromEnum:(int64_t)a3;
+ (id)readableBloodGlucoseMealTimeFromEnum:(int64_t)a3;
+ (id)readableBloodGlucoseMealTimeValues;
+ (id)readableBloodTypeFromEnum:(int64_t)a3;
+ (id)readableCervicalMucusQualityFromEnum:(int64_t)a3;
+ (id)readableCervicalMucusQualityValues;
+ (id)readableInsulinDeliveryReasonFromEnum:(int64_t)a3;
+ (id)readableInsulinDeliveryReasonValues;
+ (id)readableMenstrualFlowFromEnum:(int64_t)a3;
+ (id)readableMenstrualFlowIsStartOfCycleFromBool:(BOOL)a3;
+ (id)readableMenstrualFlowIsStartOfCycleValues;
+ (id)readableMenstrualFlowValues;
+ (id)readableOvulationTestResultFromEnum:(int64_t)a3;
+ (id)readableOvulationTestResultValues;
+ (id)readablePresenceValueFromEnum:(int64_t)a3;
+ (id)readableSampleTypeIdentifierFromSampleTypeIdentifier:(id)a3;
+ (id)readableSeverityValueFromEnum:(int64_t)a3;
+ (id)readableSexualActivityFromBool:(BOOL)a3;
+ (id)readableSexualActivityValues;
+ (id)readableSleepAnalysisFromEnum:(int64_t)a3;
+ (id)readableSleepAnalysisValues;
+ (id)readableTypeIdentifierFromCharacteristicTypeIdentifier:(id)a3;
+ (id)readableVO2MaxTestTypeFromEnum:(int64_t)a3;
+ (id)readableVO2MaxTestTypeValues;
+ (id)readableWorkoutActivityTypeFromWorkoutActivityType:(unint64_t)a3;
+ (id)sampleTypeIdentifierFromReadableTypeIdentifier:(id)a3;
+ (int64_t)enumFromReadableAppleStandingHour:(id)a3;
+ (int64_t)enumFromReadableBloodGlucoseMealTime:(id)a3;
+ (int64_t)enumFromReadableCervicalMucusQuality:(id)a3;
+ (int64_t)enumFromReadableInsulinDeliveryReason:(id)a3;
+ (int64_t)enumFromReadableMenstrualFlow:(id)a3;
+ (int64_t)enumFromReadableOvulationTestResult:(id)a3;
+ (int64_t)enumFromReadableSleepAnalysis:(id)a3;
+ (int64_t)enumFromReadableVO2MaxTestType:(id)a3;
+ (unint64_t)workoutActivityTypeFromReadableWorkoutActivityType:(id)a3;
+ (void)sourcesForSampleType:(id)a3 completion:(id)a4;
+ (void)sourcesWithName:(id)a3 ofSampleType:(id)a4 completion:(id)a5;
+ (void)validUnitsForQuantityType:(id)a3 completion:(id)a4;
@end

@implementation WFHealthKitHelper

+ (int64_t)enumFromReadableVO2MaxTestType:(id)a3
{
  id v3 = a3;
  v4 = WFHealthKitReadableVO2MaxTestTypeToEnumDictionary();
  v5 = [v4 objectForKeyedSubscript:v3];

  int64_t v6 = [v5 integerValue];
  return v6;
}

+ (int64_t)enumFromReadableBloodGlucoseMealTime:(id)a3
{
  id v3 = a3;
  v4 = WFHealthKitReadableBloodGlucoseMealTimeToEnumDictionary();
  v5 = [v4 objectForKeyedSubscript:v3];

  int64_t v6 = [v5 integerValue];
  return v6;
}

+ (int64_t)enumFromReadableInsulinDeliveryReason:(id)a3
{
  id v3 = a3;
  v4 = WFHealthKitReadableInsulinDeliveryReasonToEnumDictionary();
  v5 = [v4 objectForKeyedSubscript:v3];

  int64_t v6 = [v5 integerValue];
  return v6;
}

+ (id)readableVO2MaxTestTypeFromEnum:(int64_t)a3
{
  v4 = WFHealthKitReadableVO2MaxTestTypeToEnumDictionary();
  v5 = [NSNumber numberWithInteger:a3];
  int64_t v6 = [v4 allKeysForObject:v5];

  v7 = [v6 firstObject];

  return v7;
}

+ (id)readableBloodGlucoseMealTimeFromEnum:(int64_t)a3
{
  v4 = WFHealthKitReadableBloodGlucoseMealTimeToEnumDictionary();
  v5 = [NSNumber numberWithInteger:a3];
  int64_t v6 = [v4 allKeysForObject:v5];

  v7 = [v6 firstObject];

  return v7;
}

+ (id)readableInsulinDeliveryReasonFromEnum:(int64_t)a3
{
  v4 = WFHealthKitReadableInsulinDeliveryReasonToEnumDictionary();
  v5 = [NSNumber numberWithInteger:a3];
  int64_t v6 = [v4 allKeysForObject:v5];

  v7 = [v6 firstObject];

  return v7;
}

+ (id)readableVO2MaxTestTypeValues
{
  v8[3] = *MEMORY[0x263EF8340];
  id v3 = [a1 readableVO2MaxTestTypeFromEnum:1];
  v4 = objc_msgSend(a1, "readableVO2MaxTestTypeFromEnum:", 2, v3);
  v8[1] = v4;
  v5 = [a1 readableVO2MaxTestTypeFromEnum:3];
  v8[2] = v5;
  int64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:3];

  return v6;
}

+ (id)readableBloodGlucoseMealTimeValues
{
  v8[3] = *MEMORY[0x263EF8340];
  id v3 = WFLocalizedParameterValueMarker(@"Unspecified");
  v4 = objc_msgSend(a1, "readableBloodGlucoseMealTimeFromEnum:", 1, v3);
  v8[1] = v4;
  v5 = [a1 readableBloodGlucoseMealTimeFromEnum:2];
  v8[2] = v5;
  int64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:3];

  return v6;
}

+ (id)readableInsulinDeliveryReasonValues
{
  v7[2] = *MEMORY[0x263EF8340];
  id v3 = [a1 readableInsulinDeliveryReasonFromEnum:1];
  v7[0] = v3;
  v4 = [a1 readableInsulinDeliveryReasonFromEnum:2];
  v7[1] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];

  return v5;
}

+ (id)BOOLFromReadableSexualActivity:(id)a3
{
  id v3 = a3;
  v4 = WFHealthKitReadableSexualActivityToBoolDictionary();
  v5 = [v4 objectForKeyedSubscript:v3];

  return v5;
}

+ (int64_t)enumFromReadableSleepAnalysis:(id)a3
{
  id v3 = a3;
  v4 = WFHealthKitReadableSleepAnalysisToEnumDictionary();
  v5 = [v4 objectForKeyedSubscript:v3];

  int64_t v6 = [v5 integerValue];
  return v6;
}

+ (int64_t)enumFromReadableOvulationTestResult:(id)a3
{
  id v3 = a3;
  v4 = WFHealthKitReadableOvulationTestResultToEnumDictionary();
  v5 = [v4 objectForKeyedSubscript:v3];

  int64_t v6 = [v5 integerValue];
  return v6;
}

+ (id)BOOLFromReadableMenstrualFlowIsStartOfCycle:(id)a3
{
  id v3 = a3;
  v4 = WFHealthKitReadableMenstrualFlowIsStartOfCycleToBoolDictionary();
  v5 = [v4 objectForKeyedSubscript:v3];

  return v5;
}

+ (int64_t)enumFromReadableMenstrualFlow:(id)a3
{
  id v3 = a3;
  v4 = WFHealthKitReadableMenstrualFlowToEnumDictionary();
  v5 = [v4 objectForKeyedSubscript:v3];

  int64_t v6 = [v5 integerValue];
  return v6;
}

+ (int64_t)enumFromReadableCervicalMucusQuality:(id)a3
{
  id v3 = a3;
  v4 = WFHealthKitReadableCervicalMucusQualityToEnumDictionary();
  v5 = [v4 objectForKeyedSubscript:v3];

  int64_t v6 = [v5 integerValue];
  return v6;
}

+ (int64_t)enumFromReadableAppleStandingHour:(id)a3
{
  id v3 = a3;
  v4 = WFHealthKitReadableAppleStandingHourToEnumDictionary();
  v5 = [v4 objectForKeyedSubscript:v3];

  int64_t v6 = [v5 integerValue];
  return v6;
}

+ (id)readableSeverityValueFromEnum:(int64_t)a3
{
  v4 = WFHealthKitReadableSeverityToEnumDictionary();
  v5 = [NSNumber numberWithInteger:a3];
  int64_t v6 = [v4 allKeysForObject:v5];

  v7 = [v6 firstObject];

  return v7;
}

+ (id)readablePresenceValueFromEnum:(int64_t)a3
{
  v4 = WFHealthKitReadablePresenceToEnumDictionary();
  v5 = [NSNumber numberWithInteger:a3];
  int64_t v6 = [v4 allKeysForObject:v5];

  v7 = [v6 firstObject];

  return v7;
}

+ (id)readableAppetiteChangesValueFromEnum:(int64_t)a3
{
  v4 = WFHealthKitReadableAppetiteChangesToEnumDictionary();
  v5 = [NSNumber numberWithInteger:a3];
  int64_t v6 = [v4 allKeysForObject:v5];

  v7 = [v6 firstObject];

  return v7;
}

+ (id)readableSexualActivityFromBool:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = WFHealthKitReadableSexualActivityToBoolDictionary();
  v5 = [NSNumber numberWithBool:v3];
  int64_t v6 = [v4 allKeysForObject:v5];

  v7 = [v6 firstObject];

  return v7;
}

+ (id)readableSleepAnalysisFromEnum:(int64_t)a3
{
  v4 = WFHealthKitReadableSleepAnalysisToEnumDictionary();
  v5 = [NSNumber numberWithInteger:a3];
  int64_t v6 = [v4 allKeysForObject:v5];

  v7 = [v6 firstObject];

  return v7;
}

+ (id)readableOvulationTestResultFromEnum:(int64_t)a3
{
  v4 = WFHealthKitReadableOvulationTestResultToEnumDictionary();
  v5 = [NSNumber numberWithInteger:a3];
  int64_t v6 = [v4 allKeysForObject:v5];

  v7 = [v6 firstObject];

  return v7;
}

+ (id)readableMenstrualFlowIsStartOfCycleFromBool:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = WFHealthKitReadableMenstrualFlowIsStartOfCycleToBoolDictionary();
  v5 = [NSNumber numberWithBool:v3];
  int64_t v6 = [v4 allKeysForObject:v5];

  v7 = [v6 firstObject];

  return v7;
}

+ (id)readableMenstrualFlowFromEnum:(int64_t)a3
{
  v4 = WFHealthKitReadableMenstrualFlowToEnumDictionary();
  v5 = [NSNumber numberWithInteger:a3];
  int64_t v6 = [v4 allKeysForObject:v5];

  v7 = [v6 firstObject];

  return v7;
}

+ (id)readableCervicalMucusQualityFromEnum:(int64_t)a3
{
  v4 = WFHealthKitReadableCervicalMucusQualityToEnumDictionary();
  v5 = [NSNumber numberWithInteger:a3];
  int64_t v6 = [v4 allKeysForObject:v5];

  v7 = [v6 firstObject];

  return v7;
}

+ (id)readableAppleStandingHourFromEnum:(int64_t)a3
{
  v4 = WFHealthKitReadableAppleStandingHourToEnumDictionary();
  v5 = [NSNumber numberWithInteger:a3];
  int64_t v6 = [v4 allKeysForObject:v5];

  v7 = [v6 firstObject];

  return v7;
}

+ (id)readableSexualActivityValues
{
  v7[2] = *MEMORY[0x263EF8340];
  BOOL v3 = [a1 readableSexualActivityFromBool:1];
  v7[0] = v3;
  v4 = [a1 readableSexualActivityFromBool:0];
  v7[1] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];

  return v5;
}

+ (id)readableSleepAnalysisValues
{
  v8[3] = *MEMORY[0x263EF8340];
  BOOL v3 = [a1 readableSleepAnalysisFromEnum:2];
  v4 = objc_msgSend(a1, "readableSleepAnalysisFromEnum:", 0, v3);
  v8[1] = v4;
  v5 = [a1 readableSleepAnalysisFromEnum:1];
  v8[2] = v5;
  int64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:3];

  return v6;
}

+ (id)readableOvulationTestResultValues
{
  v9[4] = *MEMORY[0x263EF8340];
  BOOL v3 = [a1 readableOvulationTestResultFromEnum:1];
  v9[0] = v3;
  v4 = [a1 readableOvulationTestResultFromEnum:2];
  v9[1] = v4;
  v5 = [a1 readableOvulationTestResultFromEnum:4];
  v9[2] = v5;
  int64_t v6 = [a1 readableOvulationTestResultFromEnum:3];
  v9[3] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:4];

  return v7;
}

+ (id)readableMenstrualFlowIsStartOfCycleValues
{
  v7[2] = *MEMORY[0x263EF8340];
  BOOL v3 = [a1 readableMenstrualFlowIsStartOfCycleFromBool:1];
  v7[0] = v3;
  v4 = [a1 readableMenstrualFlowIsStartOfCycleFromBool:0];
  v7[1] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];

  return v5;
}

+ (id)readableMenstrualFlowValues
{
  v9[4] = *MEMORY[0x263EF8340];
  BOOL v3 = [a1 readableMenstrualFlowFromEnum:2];
  v9[0] = v3;
  v4 = [a1 readableMenstrualFlowFromEnum:3];
  v9[1] = v4;
  v5 = [a1 readableMenstrualFlowFromEnum:4];
  v9[2] = v5;
  int64_t v6 = [a1 readableMenstrualFlowFromEnum:1];
  v9[3] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:4];

  return v7;
}

+ (id)readableCervicalMucusQualityValues
{
  v10[5] = *MEMORY[0x263EF8340];
  BOOL v3 = [a1 readableCervicalMucusQualityFromEnum:1];
  v4 = objc_msgSend(a1, "readableCervicalMucusQualityFromEnum:", 2, v3);
  v10[1] = v4;
  v5 = [a1 readableCervicalMucusQualityFromEnum:3];
  v10[2] = v5;
  int64_t v6 = [a1 readableCervicalMucusQualityFromEnum:4];
  v10[3] = v6;
  v7 = [a1 readableCervicalMucusQualityFromEnum:5];
  v10[4] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:5];

  return v8;
}

+ (id)readableAppleStandingHourValues
{
  v7[2] = *MEMORY[0x263EF8340];
  BOOL v3 = [a1 readableAppleStandingHourFromEnum:0];
  v7[0] = v3;
  v4 = [a1 readableAppleStandingHourFromEnum:1];
  v7[1] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];

  return v5;
}

+ (id)readableWorkoutActivityTypeFromWorkoutActivityType:(unint64_t)a3
{
  v4 = WFHealthKitReadableWorkoutActivityTypeToWorkoutActivityTypeDictionary();
  v5 = [NSNumber numberWithUnsignedInteger:a3];
  int64_t v6 = [v4 allKeysForObject:v5];

  v7 = [v6 firstObject];

  return v7;
}

+ (unint64_t)workoutActivityTypeFromReadableWorkoutActivityType:(id)a3
{
  id v3 = a3;
  v4 = WFHealthKitReadableWorkoutActivityTypeToWorkoutActivityTypeDictionary();
  v5 = [v4 objectForKeyedSubscript:v3];

  unint64_t v6 = [v5 unsignedIntegerValue];
  return v6;
}

+ (BOOL)readableWorkoutActivityTypeIsValid:(id)a3
{
  id v3 = a3;
  v4 = WFHealthKitReadableWorkoutActivityTypeToWorkoutActivityTypeDictionary();
  v5 = [v4 objectForKeyedSubscript:v3];

  return v5 != 0;
}

+ (id)readableTypeIdentifierFromCharacteristicTypeIdentifier:(id)a3
{
  id v3 = a3;
  v4 = WFHealthKitReadableCharacteristicTypeToCharacteristicTypeIdentifierDictionary();
  v5 = [v4 allKeysForObject:v3];

  unint64_t v6 = [v5 firstObject];

  return v6;
}

+ (id)characteristicTypeIdentifierFromReadableTypeIdentifier:(id)a3
{
  id v3 = a3;
  v4 = WFHealthKitReadableCharacteristicTypeToCharacteristicTypeIdentifierDictionary();
  v5 = [v4 objectForKeyedSubscript:v3];

  return v5;
}

+ (id)readableBloodTypeFromEnum:(int64_t)a3
{
  if ((unint64_t)a3 > 8)
  {
    v4 = 0;
  }
  else
  {
    v4 = WFLocalizedParameterValueMarker(off_264E5EB50[a3]);
  }
  return v4;
}

+ (id)readableBiologicalSexFromEnum:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
  {
    v4 = 0;
  }
  else
  {
    v4 = WFLocalizedParameterValueMarker(off_264E5EB30[a3]);
  }
  return v4;
}

+ (id)readableSampleTypeIdentifierFromSampleTypeIdentifier:(id)a3
{
  id v3 = a3;
  v4 = WFHealthKitReadableSampleTypeToSampleTypeIdentifierDictionary();
  v5 = [v4 allKeysForObject:v3];

  unint64_t v6 = [v5 firstObject];

  return v6;
}

+ (id)sampleTypeIdentifierFromReadableTypeIdentifier:(id)a3
{
  id v3 = a3;
  v4 = WFHealthKitReadableSampleTypeToSampleTypeIdentifierDictionary();
  v5 = [v4 objectForKeyedSubscript:v3];

  return v5;
}

+ (id)localizedDisplayNameForUnit:(id)a3 value:(id)a4 quantityTypeIdentifier:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [MEMORY[0x263F0A830] countUnit];
  int v11 = [v7 isEqual:v10];

  if (!v11)
  {
    v14 = [MEMORY[0x263F0A830] meterUnitWithMetricPrefix:4];
    int v15 = [v7 isEqual:v14];

    if (v15)
    {
      v16 = @"mm";
    }
    else
    {
      v17 = [MEMORY[0x263F0A830] jouleUnit];
      int v18 = [v7 isEqual:v17];

      if (v18)
      {
        v16 = @"J";
      }
      else
      {
        v19 = [MEMORY[0x263F0A830] ounceUnit];
        int v20 = [v7 isEqual:v19];

        if (v20)
        {
          v16 = @"oz";
        }
        else
        {
          v21 = [MEMORY[0x263F0A830] _countPerMinuteUnit];
          int v22 = [v7 isEqual:v21];

          if (!v22)
          {
            id v25 = objc_alloc_init(getHKUnitPreferenceControllerClass());
            v26 = [v25 localizedDisplayNameForUnit:v7 value:v8];
            if ([v26 length]) {
              [v25 localizedDisplayNameForUnit:v7 value:v8];
            }
            else {
            v23 = [v7 unitString];
            }

            goto LABEL_19;
          }
          v16 = @"count/min";
        }
      }
    }
    goto LABEL_17;
  }
  if (([v9 isEqualToString:*MEMORY[0x263F09F00]] & 1) == 0
    && ![v9 isEqualToString:*MEMORY[0x263F09EA0]])
  {
    if ([v9 isEqualToString:*MEMORY[0x263F09EF8]])
    {
      v12 = @"count of steps";
      goto LABEL_5;
    }
    v16 = @"count";
LABEL_17:
    uint64_t v13 = WFLocalizedString(v16);
    goto LABEL_18;
  }
  v12 = @"count of swimming strokes, wheelchair pushes";
LABEL_5:
  uint64_t v13 = WFLocalizedStringWithKey(v12, @"count");
LABEL_18:
  v23 = (void *)v13;
LABEL_19:

  return v23;
}

+ (id)localizedDisplayNameForUnit:(id)a3 quantityTypeIdentifier:(id)a4
{
  return (id)[a1 localizedDisplayNameForUnit:a3 value:0 quantityTypeIdentifier:a4];
}

+ (id)localizedDisplayNameForUnit:(id)a3 value:(id)a4
{
  return (id)[a1 localizedDisplayNameForUnit:a3 value:a4 quantityTypeIdentifier:0];
}

+ (void)validUnitsForQuantityType:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5)
  {
    id v8 = WFHealthKitAllAvailableUnits();
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __58__WFHealthKitHelper_validUnitsForQuantityType_completion___block_invoke;
    v18[3] = &unk_264E5EAE8;
    id v9 = v5;
    id v19 = v9;
    v10 = objc_msgSend(v8, "if_compactMap:", v18);

    int v11 = objc_msgSend(MEMORY[0x263F0A410], "wf_shortcutsAppHealthStore");
    v12 = [MEMORY[0x263EFFA08] setWithObject:v9];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __58__WFHealthKitHelper_validUnitsForQuantityType_completion___block_invoke_2;
    v14[3] = &unk_264E5EB10;
    id v15 = v9;
    id v16 = v10;
    id v17 = v7;
    id v13 = v10;
    [v11 preferredUnitsForQuantityTypes:v12 completion:v14];
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

id __58__WFHealthKitHelper_validUnitsForQuantityType_completion___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  if ([v2 isCompatibleWithUnit:v3]) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

void __58__WFHealthKitHelper_validUnitsForQuantityType_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  id v3 = (void *)[*(id *)(a1 + 40) mutableCopy];
  if (v7)
  {
    uint64_t v4 = [v3 indexOfObject:v7];
    if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
      [v3 insertObject:v7 atIndex:0];
    }
    else {
      [v3 exchangeObjectAtIndex:0 withObjectAtIndex:v4];
    }
  }
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = (void *)[v3 copy];
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
}

+ (id)extractHKDataFromContentQuery:(id)a3
{
  id v3 = a3;
  uint64_t v31 = 0;
  v32 = (id *)&v31;
  uint64_t v33 = 0x3042000000;
  v34 = __Block_byref_object_copy__55202;
  v35 = __Block_byref_object_dispose__55203;
  id v36 = 0;
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __51__WFHealthKitHelper_extractHKDataFromContentQuery___block_invoke;
  v30[3] = &unk_264E5EAC0;
  v30[4] = &v31;
  uint64_t v4 = (void (**)(void, void))[v30 copy];
  objc_storeWeak(v32 + 5, v4);
  uint64_t v5 = [v3 predicate];
  id v6 = ((void (**)(void, void *))v4)[2](v4, v5);

  id v7 = [MEMORY[0x263F08A98] predicateWithFormat:@"property.propertyClass = %@ AND value != nil", objc_opt_class()];
  id v8 = [v6 filteredArrayUsingPredicate:v7];

  id v9 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"property.name = 'Type' AND comparisonType = %i", 4);
  v29 = [v6 filteredArrayUsingPredicate:v9];

  v10 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"property.name = 'Source' AND comparisonType = %i", 4);
  v28 = [v6 filteredArrayUsingPredicate:v10];

  int v11 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"comparisonType = %i OR comparisonType = %i", 2, 3);
  v12 = [v8 filteredArrayUsingPredicate:v11];
  id v13 = [v12 valueForKeyPath:@"@max.value"];

  v14 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"comparisonType = %i OR comparisonType = %i", 0, 1);
  id v15 = [v8 filteredArrayUsingPredicate:v14];
  id v16 = [v15 valueForKeyPath:@"@min.value"];

  id v17 = [v29 firstObject];
  int v18 = [v17 value];
  v26 = v8;
  v27 = v3;

  id v19 = [v28 firstObject];
  int v20 = [v19 value];

  v21 = objc_alloc_init(WFHKContentQueryData);
  [(WFHKContentQueryData *)v21 setStartDate:v13];
  [(WFHKContentQueryData *)v21 setEndDate:v16];
  int v22 = +[WFHealthKitHelper sampleTypeIdentifierFromReadableTypeIdentifier:v18];
  if (v22)
  {
    v23 = [MEMORY[0x263F0A6E8] quantityTypeForIdentifier:v22];
  }
  else
  {
    v23 = 0;
  }
  [(WFHKContentQueryData *)v21 setQuantityType:v23];
  if (v22)
  {

    v24 = [MEMORY[0x263F0A6E8] categoryTypeForIdentifier:v22];
  }
  else
  {
    v24 = 0;
  }
  [(WFHKContentQueryData *)v21 setCategoryType:v24];
  if (v22) {

  }
  [(WFHKContentQueryData *)v21 setSourceName:v20];
  _Block_object_dispose(&v31, 8);
  objc_destroyWeak(&v36);

  return v21;
}

id __51__WFHealthKitHelper_extractHKDataFromContentQuery___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    uint64_t v5 = objc_opt_new();
    if ([v4 compoundPredicateType] == 1)
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v6 = objc_msgSend(v4, "subpredicates", 0);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v16 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
            WeakRetained = (void (**)(id, void))objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                        + 40));
            id v13 = WeakRetained[2](WeakRetained, v11);
            [v5 addObjectsFromArray:v13];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
        }
        while (v8);
      }
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v19 = v3;
      uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
    }
    else
    {
      uint64_t v5 = (void *)MEMORY[0x263EFFA68];
    }
  }

  return v5;
}

+ (void)sourcesWithName:(id)a3 ofSampleType:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__WFHealthKitHelper_sourcesWithName_ofSampleType_completion___block_invoke;
  v12[3] = &unk_264E5EA98;
  id v13 = v8;
  id v14 = v9;
  id v10 = v8;
  id v11 = v9;
  [a1 sourcesForSampleType:a4 completion:v12];
}

void __61__WFHealthKitHelper_sourcesWithName_ofSampleType_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v6);
    }
  }
  else
  {
    id v19 = v5;
    id v20 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = v5;
    uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v22 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v22) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v12 = [v11 name];
          id v13 = [v12 stringByReplacingOccurrencesOfString:@" " withString:@" "];
          uint64_t v14 = a1;
          long long v15 = [*(id *)(a1 + 32) stringByReplacingOccurrencesOfString:@" " withString:@" "];
          int v16 = [v13 isEqualToString:v15];

          if (v16) {
            [v20 addObject:v11];
          }
          a1 = v14;
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v9);
    }

    uint64_t v17 = *(void *)(a1 + 40);
    if (v17)
    {
      long long v18 = (void *)[v20 copy];
      (*(void (**)(uint64_t, void *, void))(v17 + 16))(v17, v18, 0);
    }
    id v6 = 0;
    id v5 = v19;
  }
}

+ (void)sourcesForSampleType:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x263F0A410];
  id v7 = a3;
  uint64_t v8 = objc_msgSend(v6, "wf_shortcutsAppHealthStore");
  id v9 = objc_alloc(MEMORY[0x263F0A7A8]);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __53__WFHealthKitHelper_sourcesForSampleType_completion___block_invoke;
  v12[3] = &unk_264E5EA70;
  id v13 = v5;
  id v10 = v5;
  id v11 = (void *)[v9 initWithSampleType:v7 samplePredicate:0 completionHandler:v12];

  [v8 executeQuery:v11];
}

uint64_t __53__WFHealthKitHelper_sourcesForSampleType_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a3, a4);
  }
  return result;
}

@end