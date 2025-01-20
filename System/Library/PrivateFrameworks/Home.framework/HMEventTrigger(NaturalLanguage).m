@interface HMEventTrigger(NaturalLanguage)
+ (__CFString)_hf_triggerRangeKeyComponentForRangeType:()NaturalLanguage;
+ (id)_hf_alarmNaturalLanguageNameWithNameStringKey:()NaturalLanguage nameType:thresholdKey:thresholdValueDescription:roomName:actionsDescription:;
+ (id)_hf_localizedStringOrNilIfNotFoundForKey:()NaturalLanguage;
+ (id)_hf_naturalLanguageDetailsSentenceElementsWithRecurrences:()NaturalLanguage conditions:endEvents:withOptions:;
+ (id)_hf_naturalLanguageNameWithOptions:()NaturalLanguage nonSensorCharacteristics:triggerValue:;
+ (id)_hf_naturalLanguageNameWithOptions:()NaturalLanguage sensorCharacteristics:triggerValue:;
+ (id)hf_localizationKeyForProgrammableSwitchCharacteristic:()NaturalLanguage value:;
+ (id)hf_localizedStringForProgrammableSwitchCharacteristic:()NaturalLanguage value:;
+ (id)hf_naturalLanguageDescriptionForCharacteristic:()NaturalLanguage;
+ (id)hf_naturalLanguageDetailsWithRecurrences:()NaturalLanguage conditions:endEvents:withOptions:;
+ (id)hf_naturalLanguageNameWithOptions:()NaturalLanguage characteristics:triggerValue:;
+ (id)hf_naturalLanguageNameWithOptions:()NaturalLanguage events:recurrences:forUser:;
+ (id)hf_naturalLanguageNameWithOptions:()NaturalLanguage presenceEvent:;
+ (id)hf_naturalLanguageNameWithOptions:()NaturalLanguage region:forUser:;
+ (id)hf_naturalLanguageTurnOffAfterDuration:()NaturalLanguage style:;
+ (id)hf_triggerRangeValueNaturalLanguageDescriptionWithCharacteristics:()NaturalLanguage triggerValueRange:thresholdValue:;
+ (id)hf_triggerValueNaturalLanguageDescriptionFormatterWithCharacteristics:()NaturalLanguage;
+ (id)hf_triggerValueNaturalLanguageDescriptionWithCharacteristics:()NaturalLanguage triggerValue:;
+ (id)hf_triggerValueNaturalLanguageDescriptionWithCharacteristics:()NaturalLanguage triggerValue:visibleTriggerValues:;
+ (id)hf_triggerValueNaturalLanguageDescriptionWithCharacteristics:()NaturalLanguage triggerValueRange:thresholdValue:;
+ (uint64_t)hf_naturalLanguageNameWithOptions:()NaturalLanguage events:;
+ (uint64_t)hf_naturalLanguageNameWithOptions:()NaturalLanguage events:forUser:;
+ (uint64_t)hf_naturalLanguageNameWithOptions:()NaturalLanguage events:recurrences:;
+ (unint64_t)hf_triggerRangeTypeWithCharacteristics:()NaturalLanguage triggerValueRange:thresholdValue:;
- (id)_hf_naturalLanguageDetailsSentenceElementsWithOptions:()NaturalLanguage;
- (id)hf_naturalLanguageNameWithHome:()NaturalLanguage type:;
- (id)hf_naturalLanguageNameWithOptions:()NaturalLanguage;
@end

@implementation HMEventTrigger(NaturalLanguage)

- (id)hf_naturalLanguageNameWithHome:()NaturalLanguage type:
{
  id v6 = a3;
  v7 = [[HFTriggerNaturalLanguageOptions alloc] initWithHome:v6 nameType:a4];

  v8 = objc_msgSend(a1, "hf_naturalLanguageNameWithOptions:", v7);

  return v8;
}

- (id)hf_naturalLanguageNameWithOptions:()NaturalLanguage
{
  id v4 = a3;
  v5 = objc_opt_class();
  id v6 = [a1 events];
  v7 = objc_msgSend(a1, "hf_effectiveRecurrences");
  v8 = [a1 creator];
  v9 = objc_msgSend(v5, "hf_naturalLanguageNameWithOptions:events:recurrences:forUser:", v4, v6, v7, v8);

  if (v9)
  {
    id v10 = v9;
  }
  else
  {
    id v10 = [a1 name];
  }
  v11 = v10;

  return v11;
}

+ (uint64_t)hf_naturalLanguageNameWithOptions:()NaturalLanguage events:
{
  return objc_msgSend(a1, "hf_naturalLanguageNameWithOptions:events:recurrences:forUser:", a3, a4, MEMORY[0x263EFFA68], 0);
}

+ (uint64_t)hf_naturalLanguageNameWithOptions:()NaturalLanguage events:forUser:
{
  return objc_msgSend(a1, "hf_naturalLanguageNameWithOptions:events:recurrences:forUser:", a3, a4, MEMORY[0x263EFFA68], a5);
}

+ (uint64_t)hf_naturalLanguageNameWithOptions:()NaturalLanguage events:recurrences:
{
  return objc_msgSend(a1, "hf_naturalLanguageNameWithOptions:events:recurrences:forUser:", a3, a4, a5, 0);
}

+ (id)hf_naturalLanguageNameWithOptions:()NaturalLanguage events:recurrences:forUser:
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = objc_msgSend(v10, "na_firstObjectPassingTest:", &__block_literal_global_167);
  v14 = objc_msgSend(v10, "na_firstObjectPassingTest:", &__block_literal_global_170_0);
  v15 = (void *)MEMORY[0x263EFFA08];
  v16 = objc_msgSend(v10, "na_filter:", &__block_literal_global_173);
  v17 = [v15 setWithArray:v16];

  v18 = objc_msgSend(v10, "na_map:", &__block_literal_global_226);
  v19 = objc_msgSend(v18, "na_firstObjectPassingTest:", &__block_literal_global_230);
  v20 = v19;
  if (v14)
  {
    uint64_t v21 = objc_msgSend((id)objc_opt_class(), "hf_naturalLanguageNameWithOptions:presenceEvent:", v9, v14);
  }
  else
  {
    if (v13)
    {
      [v13 region];
      v38 = v13;
      v23 = v17;
      v25 = id v24 = v11;
      v22 = objc_msgSend((id)objc_opt_class(), "hf_naturalLanguageNameWithOptions:region:forUser:", v9, v25, v12);

      id v11 = v24;
      v17 = v23;
      v13 = v38;
      if (v22) {
        goto LABEL_10;
      }
      goto LABEL_7;
    }
    if (!v19)
    {
      if ([v17 count])
      {
        v39 = (void *)MEMORY[0x263F08760];
        v35 = objc_msgSend(v17, "na_map:", &__block_literal_global_242);
        [v39 setWithSet:v35];
        v28 = id v34 = v11;
        v40 = objc_msgSend(v28, "na_mostCommonObject");

        v42[0] = MEMORY[0x263EF8330];
        v42[1] = 3221225472;
        v42[2] = __96__HMEventTrigger_NaturalLanguage__hf_naturalLanguageNameWithOptions_events_recurrences_forUser___block_invoke_7;
        v42[3] = &unk_264091780;
        id v43 = v40;
        id v33 = v40;
        v32 = objc_msgSend(v17, "na_filter:", v42);
        uint64_t v29 = objc_msgSend(v32, "na_map:", &__block_literal_global_245);
        v36 = (void *)MEMORY[0x263F08760];
        v41 = (void *)v29;
        v31 = objc_msgSend(v32, "na_map:", &__block_literal_global_247);
        v30 = [v36 setWithSet:v31];
        v37 = objc_msgSend(v30, "na_mostCommonObject");

        id v11 = v34;
        v22 = objc_msgSend((id)objc_opt_class(), "hf_naturalLanguageNameWithOptions:characteristics:triggerValue:", v9, v41, v37);

        if (v22) {
          goto LABEL_10;
        }
      }
      goto LABEL_7;
    }
    uint64_t v21 = [v19 naturalLanguageNameWithOptions:v9 recurrences:v11];
  }
  v22 = (void *)v21;
  if (v21) {
    goto LABEL_10;
  }
LABEL_7:
  v26 = HFLogForCategory(0x44uLL);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v45 = v10;
    _os_log_fault_impl(&dword_20B986000, v26, OS_LOG_TYPE_FAULT, "Could not generate name for events: %@", buf, 0xCu);
  }

  v22 = _HFLocalizedStringWithDefaultValue(@"HFTriggerDescriptionUnknownName", @"HFTriggerDescriptionUnknownName", 1);
LABEL_10:

  return v22;
}

+ (id)hf_naturalLanguageNameWithOptions:()NaturalLanguage region:forUser:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    id v11 = [v9 identifier];
    if ([v11 length])
    {
      id v12 = [v9 identifier];
    }
    else
    {
      id v12 = 0;
    }

    v15 = [v8 home];
    id v16 = [v15 currentUser];

    v17 = @"HFOtherUser_";
    if (v16 == v10) {
      v17 = @"HFCurrentUser_";
    }
    v18 = v17;
    if [v9 notifyOnEntry] && (objc_msgSend(v9, "notifyOnExit"))
    {
      v19 = @"ArriveOrLeaveLocationTriggerName";
    }
    else if ([v9 notifyOnEntry])
    {
      v19 = @"ArriveLocationTriggerName";
    }
    else
    {
      if (![v9 notifyOnExit])
      {
LABEL_18:
        if (v12)
        {
          if ([v12 isEqualToString:@"Home"])
          {
            uint64_t v21 = @"_Home";
          }
          else if ([v12 isEqualToString:@"Work"])
          {
            uint64_t v21 = @"_Work";
          }
          else
          {
            uint64_t v21 = @"_placeName";
          }
          uint64_t v22 = [(__CFString *)v18 stringByAppendingString:v21];

          v18 = (__CFString *)v22;
        }
        v49 = v12;
        if ([v8 nameType] == 2)
        {
          v23 = [(__CFString *)v18 stringByAppendingString:@"_fullSentence"];

          id v24 = [v8 actions];
          uint64_t v25 = [v24 count];

          if (v25)
          {
            v26 = [v8 actionNaturalLanguageOptions];
            [v26 setFormattingContext:5];

            v27 = [v8 actions];
            v28 = [v8 actionNaturalLanguageOptions];
            uint64_t v29 = +[HFActionNaturalLanguageUtilities hf_naturalLanguageDescriptionForActions:v27 withOptions:v28];

            if ([(__CFString *)v29 length])
            {
              uint64_t v30 = [(__CFString *)v23 stringByAppendingString:@"_WithAction"];
              v31 = v23;
              v23 = (__CFString *)v30;
            }
            else
            {
              v31 = v29;
              uint64_t v29 = 0;
            }
          }
          else
          {
            uint64_t v29 = 0;
          }
          v18 = v23;
        }
        else
        {
          uint64_t v29 = 0;
        }
        v32 = [MEMORY[0x263EFF980] array];
        if (v16 != v10)
        {
          v48 = a1;
          id v33 = [HFUserNameFormatter alloc];
          id v34 = [v8 home];
          v35 = [(HFUserNameFormatter *)v33 initWithHome:v34];

          [(HFUserNameFormatter *)v35 setStyle:1];
          v36 = [v8 home];
          v37 = objc_msgSend(v36, "hf_handleForUser:", v10);

          v38 = [(HFUserNameFormatter *)v35 stringForObjectValue:v37];
          if (v38)
          {
            objc_msgSend(v32, "na_safeAddObject:", v38);
          }
          else
          {
            v39 = [v10 name];
            if (v39)
            {
              objc_msgSend(v32, "na_safeAddObject:", v39);
            }
            else
            {
              uint64_t v40 = [v10 userID];
              v47 = (void *)v40;
              if (v40)
              {
                objc_msgSend(v32, "na_safeAddObject:", v40);
              }
              else
              {
                uint64_t v46 = _HFLocalizedStringWithDefaultValue(@"HFOtherUserDefaultName", @"HFOtherUserDefaultName", 1);
                objc_msgSend(v32, "na_safeAddObject:", v46);
              }
            }
          }
          a1 = v48;
        }
        objc_msgSend(v32, "na_safeAddObject:", v49);
        objc_msgSend(v32, "na_safeAddObject:", v29);
        v41 = NSString;
        v42 = _HFLocalizedStringWithDefaultValue(v18, v18, 1);
        v14 = objc_msgSend(v41, "hf_stringWithFormat:arguments:", v42, v32);

        if (![v8 nameType])
        {
          id v43 = [v8 home];
          uint64_t v44 = objc_msgSend(a1, "hf_sanitizeTriggerName:home:", v14, v43);

          v14 = (void *)v44;
        }

        goto LABEL_48;
      }
      v19 = @"LeaveLocationTriggerName";
    }
    uint64_t v20 = [(__CFString *)v18 stringByAppendingString:v19];

    v18 = (__CFString *)v20;
    goto LABEL_18;
  }
  v13 = HFLogForCategory(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_20B986000, v13, OS_LOG_TYPE_ERROR, "region is nil!", buf, 2u);
  }

  v14 = _HFLocalizedStringWithDefaultValue(@"HFUnknownLocationTriggerName", @"HFUnknownLocationTriggerName", 1);
LABEL_48:

  return v14;
}

+ (id)hf_naturalLanguageNameWithOptions:()NaturalLanguage presenceEvent:
{
  id v5 = a3;
  id v6 = a4;
  v7 = [[HFPresenceEventFormatter alloc] initWithOptions:v5];
  [(HFPresenceEventFormatter *)v7 setStyle:0];
  id v8 = [v5 actions];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    id v10 = [v5 actionNaturalLanguageOptions];
    [v10 setFormattingContext:5];

    id v11 = [v5 actions];
    id v12 = [v5 actionNaturalLanguageOptions];
    v13 = +[HFActionNaturalLanguageUtilities hf_naturalLanguageDescriptionForActions:v11 withOptions:v12];

    if ([v13 length])
    {
      v14 = [[HFPresenceEventBuilder alloc] initWithEvent:v6];
      v15 = [(HFPresenceEventFormatter *)v7 stringForPresenceEventBuilder:v14 actionsDescription:v13];

      goto LABEL_6;
    }
  }
  v15 = [(HFPresenceEventFormatter *)v7 stringForPresenceEvent:v6];
LABEL_6:

  return v15;
}

+ (id)hf_naturalLanguageDescriptionForCharacteristic:()NaturalLanguage
{
  v3 = [a3 characteristicType];
  if ([v3 isEqualToString:*MEMORY[0x263F0BF40]])
  {
    id v4 = @"HFCharacteristicTriggerDescriptionTypeAirQuality";
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F0C0E0]])
  {
    id v4 = @"HFCharacteristicTriggerDescriptionTypeHumidity";
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F0C110]])
  {
    id v4 = @"HFCharacteristicTriggerDescriptionTypeTemperature";
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F0C0A0]])
  {
    id v4 = @"HFCharacteristicTriggerDescriptionTypeLightLevel";
  }
  else
  {
    id v4 = 0;
  }
  id v5 = _HFLocalizedStringWithDefaultValue(v4, v4, 1);
  if (!v5) {
    NSLog(&cfstr_NoLocalizedStr_0.isa, v4);
  }

  return v5;
}

+ (id)hf_naturalLanguageNameWithOptions:()NaturalLanguage characteristics:triggerValue:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v9 count]) {
    NSLog(&cfstr_Characteristic_9.isa);
  }
  if ([v9 count])
  {
    id v11 = objc_msgSend(MEMORY[0x263F0E248], "hf_sensingCharacteristicTypes");
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __98__HMEventTrigger_NaturalLanguage__hf_naturalLanguageNameWithOptions_characteristics_triggerValue___block_invoke;
    v15[3] = &unk_2640903A0;
    id v16 = v11;
    id v12 = v11;
    if (objc_msgSend(v9, "na_any:", v15)) {
      objc_msgSend(a1, "_hf_naturalLanguageNameWithOptions:sensorCharacteristics:triggerValue:", v8, v9, v10);
    }
    else {
    v13 = objc_msgSend(a1, "_hf_naturalLanguageNameWithOptions:nonSensorCharacteristics:triggerValue:", v8, v9, v10);
    }
  }
  else
  {
    v13 = _HFLocalizedStringWithDefaultValue(@"HFCharacteristicTriggerDescriptionUnknownName", @"HFCharacteristicTriggerDescriptionUnknownName", 1);
  }

  return v13;
}

+ (id)_hf_naturalLanguageNameWithOptions:()NaturalLanguage sensorCharacteristics:triggerValue:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_msgSend(MEMORY[0x263F0E248], "hf_sensingCharacteristicTypes");
  v56[0] = MEMORY[0x263EF8330];
  v56[1] = 3221225472;
  v56[2] = __105__HMEventTrigger_NaturalLanguage___hf_naturalLanguageNameWithOptions_sensorCharacteristics_triggerValue___block_invoke;
  v56[3] = &unk_2640917A8;
  id v11 = v9;
  id v57 = v11;
  id v12 = v10;
  id v58 = v12;
  v13 = objc_msgSend(v8, "na_firstObjectPassingTest:", v56);
  v14 = [v13 characteristicType];
  v15 = v14;
  if (!v14)
  {
    uint64_t v22 = 0;
    goto LABEL_52;
  }
  id v53 = v12;
  if (![v14 isEqualToString:*MEMORY[0x263F0C288]])
  {
    if ([v15 isEqualToString:*MEMORY[0x263F0BF80]])
    {
      v23 = @"HFCharacteristicTriggerDescriptionSensorCO2Detected";
    }
    else if ([v15 isEqualToString:*MEMORY[0x263F0BFB0]])
    {
      v23 = @"HFCharacteristicTriggerDescriptionSensorCODetected";
    }
    else if ([v15 isEqualToString:*MEMORY[0x263F0C238]])
    {
      v23 = @"HFCharacteristicTriggerDescriptionSensorLeakDetected";
    }
    else
    {
      if ([v15 isEqualToString:*MEMORY[0x263F0C2C0]])
      {
        objc_opt_class();
        id v24 = v11;
        if (objc_opt_isKindOfClass()) {
          uint64_t v25 = v24;
        }
        else {
          uint64_t v25 = 0;
        }
        id v18 = v25;

        int v19 = [v18 BOOLValue];
        uint64_t v20 = @"HFCharacteristicTriggerDescriptionSensorOccupancyNotDetected";
        uint64_t v21 = @"HFCharacteristicTriggerDescriptionSensorOccupancyDetected";
        goto LABEL_7;
      }
      if ([v15 isEqualToString:*MEMORY[0x263F0C3F0]])
      {
        v23 = @"HFCharacteristicTriggerDescriptionSensorSmokeDetected";
      }
      else if ([v15 isEqualToString:*MEMORY[0x263F0BF40]])
      {
        v23 = @"HFCharacteristicTriggerDescriptionSensorAirQuality";
      }
      else if ([v15 isEqualToString:*MEMORY[0x263F0C110]])
      {
        v23 = @"HFCharacteristicTriggerDescriptionSensorTemperature";
      }
      else if ([v15 isEqualToString:*MEMORY[0x263F0C0E0]])
      {
        v23 = @"HFCharacteristicTriggerDescriptionSensorHumidity";
      }
      else
      {
        int v26 = [v15 isEqualToString:*MEMORY[0x263F0C0A0]];
        v23 = @"HFCharacteristicTriggerDescriptionSensorLightLevel";
        if (!v26) {
          v23 = 0;
        }
      }
    }
    v52 = v23;
    goto LABEL_33;
  }
  objc_opt_class();
  id v16 = v11;
  if (objc_opt_isKindOfClass()) {
    v17 = v16;
  }
  else {
    v17 = 0;
  }
  id v18 = v17;

  int v19 = [v18 BOOLValue];
  uint64_t v20 = @"HFCharacteristicTriggerDescriptionSensorMotionNotDetected";
  uint64_t v21 = @"HFCharacteristicTriggerDescriptionSensorMotionDetected";
LABEL_7:
  if (v19) {
    uint64_t v20 = v21;
  }
  v52 = v20;

LABEL_33:
  v27 = objc_msgSend(MEMORY[0x263F0E248], "hf_valueRangeCharacteristicTypes");
  int v28 = [v27 containsObject:v15];

  if (v28)
  {
    objc_opt_class();
    id v29 = v11;
    if (objc_opt_isKindOfClass()) {
      uint64_t v30 = v29;
    }
    else {
      uint64_t v30 = 0;
    }
    id v31 = v30;

    if (v31)
    {
      v32 = objc_msgSend(v13, "hf_thresholdValueForRange:", v31);
      v51 = objc_msgSend(a1, "_hf_triggerRangeKeyComponentForRangeType:", objc_msgSend(a1, "hf_triggerRangeTypeWithCharacteristics:triggerValueRange:thresholdValue:", v8, v31, v32));
      v50 = objc_msgSend(a1, "hf_triggerValueNaturalLanguageDescriptionWithCharacteristics:triggerValue:", v8, v32);
    }
    else
    {
      v50 = 0;
      v51 = 0;
    }
  }
  else
  {
    v50 = 0;
    v51 = 0;
  }
  id v33 = [v7 actions];
  id v54 = v11;
  v48 = v13;
  if ([v33 count])
  {
    id v34 = [v7 actionNaturalLanguageOptions];

    if (!v34)
    {
      v36 = 0;
      goto LABEL_48;
    }
    id v33 = [v7 actions];
    v35 = [v7 actionNaturalLanguageOptions];
    v36 = +[HFActionNaturalLanguageUtilities hf_naturalLanguageDescriptionForActions:v33 withOptions:v35];
  }
  else
  {
    v36 = 0;
  }

LABEL_48:
  id v37 = v8;
  v38 = objc_msgSend(v8, "anyObject", v48);
  v39 = [v38 service];

  uint64_t v40 = objc_msgSend(v39, "hf_parentRoom");
  v41 = [v7 home];
  v42 = [v41 roomForEntireHome];
  char v43 = [v40 isEqual:v42];

  if (v43)
  {
    uint64_t v44 = 0;
  }
  else
  {
    uint64_t v44 = [v40 name];
  }
  uint64_t v22 = objc_msgSend(a1, "_hf_alarmNaturalLanguageNameWithNameStringKey:nameType:thresholdKey:thresholdValueDescription:roomName:actionsDescription:", v52, objc_msgSend(v7, "nameType"), v51, v50, v44, v36);

  id v8 = v37;
  id v12 = v53;
  id v11 = v54;
  v13 = v49;
LABEL_52:
  if (![v7 nameType])
  {
    id v45 = [v7 home];
    uint64_t v46 = objc_msgSend(a1, "hf_sanitizeTriggerName:home:", v22, v45);

    uint64_t v22 = (void *)v46;
  }

  return v22;
}

+ (id)_hf_alarmNaturalLanguageNameWithNameStringKey:()NaturalLanguage nameType:thresholdKey:thresholdValueDescription:roomName:actionsDescription:
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  if (v13)
  {
    id v18 = [MEMORY[0x263EFF980] array];
    if (v14)
    {
      uint64_t v19 = [v13 stringByAppendingFormat:@"_%@", v14];

      objc_msgSend(v18, "na_safeAddObject:", v15);
      id v13 = (id)v19;
    }
    if (a4 == 1) {
      uint64_t v20 = @"_Fragment";
    }
    else {
      uint64_t v20 = @"_Sentence";
    }
    uint64_t v21 = [v13 stringByAppendingString:v20];

    if (v16)
    {
      uint64_t v22 = [v21 stringByAppendingString:@"_withRoom"];

      [v18 addObject:v16];
      uint64_t v21 = (void *)v22;
    }
    if (v17)
    {
      uint64_t v23 = [v21 stringByAppendingString:@"_WithAction"];

      [v18 addObject:v17];
      uint64_t v21 = (void *)v23;
    }
    id v24 = _HFLocalizedStringWithDefaultValue(v21, v21, 1);
    uint64_t v25 = objc_msgSend(NSString, "hf_stringWithFormat:arguments:", v24, v18);
    int v26 = v25;
    if (v25)
    {
      id v27 = v25;
    }
    else
    {
      _HFLocalizedStringWithDefaultValue(@"HFCharacteristicTriggerDescriptionUnknownName", @"HFCharacteristicTriggerDescriptionUnknownName", 1);
      id v27 = (id)objc_claimAutoreleasedReturnValue();
    }
    int v28 = v27;
  }
  else
  {
    int v28 = _HFLocalizedStringWithDefaultValue(@"HFCharacteristicTriggerDescriptionUnknownName", @"HFCharacteristicTriggerDescriptionUnknownName", 1);
  }

  return v28;
}

+ (id)_hf_naturalLanguageNameWithOptions:()NaturalLanguage nonSensorCharacteristics:triggerValue:
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = _HFLocalizedStringWithDefaultValue(@"HFCharacteristicTriggerDescriptionUnknownName", @"HFCharacteristicTriggerDescriptionUnknownName", 1);
  objc_opt_class();
  v50 = v9;
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v12 = v9;
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }
    id v14 = v13;

    id v15 = objc_msgSend(a1, "hf_triggerValueNaturalLanguageDescriptionWithCharacteristics:triggerValueRange:thresholdValue:", v10, v14, 0);
  }
  else
  {
    id v15 = objc_msgSend(a1, "hf_triggerValueNaturalLanguageDescriptionWithCharacteristics:triggerValue:", v10, v9);
  }
  id v16 = [v10 anyObject];

  id v17 = [v16 service];

  id v18 = [v8 home];
  uint64_t v19 = objc_msgSend(v18, "hf_serviceGroupsForService:", v17);
  uint64_t v20 = [v19 firstObject];

  if (v20) {
    uint64_t v21 = v20;
  }
  else {
    uint64_t v21 = v17;
  }
  uint64_t v22 = objc_msgSend(v21, "hf_displayName");
  uint64_t v23 = [v8 objectsInContext];
  uint64_t v24 = [v23 count];

  if (v24)
  {
    uint64_t v25 = [v8 objectsInContext];
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __108__HMEventTrigger_NaturalLanguage___hf_naturalLanguageNameWithOptions_nonSensorCharacteristics_triggerValue___block_invoke;
    v51[3] = &unk_26408FD78;
    id v26 = v17;
    id v52 = v26;
    id v27 = objc_msgSend(v25, "na_firstObjectPassingTest:", v51);

    if (v27)
    {
      if (v20) {
        int v28 = v20;
      }
      else {
        int v28 = v26;
      }
      id v29 = objc_msgSend(v28, "hf_serviceNameComponents");
      uint64_t v30 = [v29 rawServiceName];

      uint64_t v22 = (void *)v30;
    }
  }
  if (v22 && v15)
  {
    if ([v8 nameType] == 2)
    {
      id v31 = [v8 actions];
      v32 = (void *)[v31 count];

      id v33 = @"HFCharacteristicTriggerDescriptionFormatString_fullSentence";
      if (v32)
      {
        id v34 = [v8 actionNaturalLanguageOptions];
        [v34 setFormattingContext:5];

        [v8 actions];
        v35 = v49 = a1;
        [v8 actionNaturalLanguageOptions];
        v36 = v48 = v15;
        v32 = +[HFActionNaturalLanguageUtilities hf_naturalLanguageDescriptionForActions:v35 withOptions:v36];

        id v15 = v48;
        a1 = v49;
        if ([v32 length]) {
          id v33 = @"HFCharacteristicTriggerDescriptionFormatString_fullSentence_WithAction";
        }
      }
    }
    else
    {
      v32 = 0;
      id v33 = @"HFCharacteristicTriggerDescriptionFormatString";
    }
    if ([v32 length]) {
      HFLocalizedStringWithFormat(v33, @"%@%@%@", v37, v38, v39, v40, v41, v42, (uint64_t)v22);
    }
    else {
    uint64_t v43 = HFLocalizedStringWithFormat(v33, @"%@%@", v37, v38, v39, v40, v41, v42, (uint64_t)v22);
    }

    id v11 = (void *)v43;
  }
  if (![v8 nameType])
  {
    [v8 home];
    id v45 = v44 = v15;
    uint64_t v46 = objc_msgSend(a1, "hf_sanitizeTriggerName:home:", v11, v45);

    id v15 = v44;
    id v11 = (void *)v46;
  }

  return v11;
}

+ (id)hf_triggerValueNaturalLanguageDescriptionFormatterWithCharacteristics:()NaturalLanguage
{
  id v3 = a3;
  id v4 = [v3 anyObject];
  id v5 = [v4 characteristicType];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __105__HMEventTrigger_NaturalLanguage__hf_triggerValueNaturalLanguageDescriptionFormatterWithCharacteristics___block_invoke;
  v12[3] = &unk_2640903A0;
  id v6 = v5;
  id v13 = v6;
  char v7 = objc_msgSend(v3, "na_any:", v12);

  if (v7) {
    goto LABEL_2;
  }
  if ([v6 isEqualToString:*MEMORY[0x263F0BF40]])
  {
    id v8 = objc_msgSend(MEMORY[0x263F08878], "hf_valueFormatterForCharacteristic:options:", v4, 0);
  }
  else
  {
    if ([v6 isEqualToString:*MEMORY[0x263F0C110]])
    {
      id v9 = +[HFFormatterManager sharedInstance];
      uint64_t v10 = [v9 temperatureFormatter];
    }
    else if ([v6 isEqualToString:*MEMORY[0x263F0C0E0]])
    {
      id v9 = +[HFFormatterManager sharedInstance];
      uint64_t v10 = [v9 percentFormatter];
    }
    else
    {
      if (![v6 isEqualToString:*MEMORY[0x263F0C0A0]])
      {
LABEL_2:
        id v8 = 0;
        goto LABEL_12;
      }
      id v9 = +[HFFormatterManager sharedInstance];
      uint64_t v10 = [v9 luxFormatter];
    }
    id v8 = (void *)v10;
  }
LABEL_12:

  return v8;
}

+ (id)hf_triggerValueNaturalLanguageDescriptionWithCharacteristics:()NaturalLanguage triggerValue:
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 anyObject];
  id v9 = objc_msgSend(v8, "hf_visibleTriggerValues");
  uint64_t v10 = objc_msgSend(a1, "hf_triggerValueNaturalLanguageDescriptionWithCharacteristics:triggerValue:visibleTriggerValues:", v7, v6, v9);

  return v10;
}

+ (id)hf_triggerValueNaturalLanguageDescriptionWithCharacteristics:()NaturalLanguage triggerValue:visibleTriggerValues:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 anyObject];
  id v12 = [v11 characteristicType];
  uint64_t v36 = MEMORY[0x263EF8330];
  uint64_t v37 = 3221225472;
  uint64_t v38 = __130__HMEventTrigger_NaturalLanguage__hf_triggerValueNaturalLanguageDescriptionWithCharacteristics_triggerValue_visibleTriggerValues___block_invoke;
  uint64_t v39 = &unk_2640903A0;
  id v13 = v12;
  id v40 = v13;
  char v14 = objc_msgSend(v8, "na_any:", &v36);
  id v15 = objc_msgSend(a1, "hf_triggerValueNaturalLanguageDescriptionFormatterWithCharacteristics:", v8);
  if (v15)
  {
    objc_msgSend(MEMORY[0x263F0E248], "hf_valueRangeCharacteristicTypes");
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if ([v16 containsObject:v13])
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
LABEL_20:
        int v28 = [v15 stringForObjectValue:v9];
        goto LABEL_34;
      }
      id v16 = v9;
      uint64_t v18 = objc_msgSend(MEMORY[0x263F0E248], "hf_indexOfSortedValues:closestToValue:", v10, v16);
      if (v18 == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v9 = v16;
      }
      else
      {
        id v9 = [v10 objectAtIndexedSubscript:v18];
      }
    }

    goto LABEL_20;
  }
  if (v9) {
    char v19 = v14;
  }
  else {
    char v19 = 1;
  }
  if ((v19 & 1) == 0)
  {
    uint64_t v21 = objc_msgSend(MEMORY[0x263F0E248], "hf_powerStateCharacteristicTypes");
    int v22 = [v21 containsObject:v13];

    if (v22)
    {
      int v23 = [v9 BOOLValue];
      uint64_t v24 = @"HFCharacteristicTriggerDescriptionValueOff";
      uint64_t v25 = @"HFCharacteristicTriggerDescriptionValueOn";
LABEL_13:
      if (v23) {
        uint64_t v24 = v25;
      }
LABEL_26:
      uint64_t v20 = v24;
      goto LABEL_27;
    }
    if ([v13 isEqualToString:*MEMORY[0x263F0C0B0]])
    {
      uint64_t v26 = [v9 integerValue];
      uint64_t v24 = @"HFCharacteristicTriggerDescriptionValueUnlocked";
      id v27 = @"HFCharacteristicTriggerDescriptionValueLocked";
    }
    else
    {
      if (![v13 isEqualToString:*MEMORY[0x263F0C040]])
      {
        if (![v13 isEqualToString:*MEMORY[0x263F0C008]])
        {
          if ([v13 isEqualToString:*MEMORY[0x263F0C0E8]])
          {
            unint64_t v35 = [v9 integerValue];
            if (v35 < 5)
            {
              uint64_t v20 = off_264091838[v35];
              goto LABEL_27;
            }
            goto LABEL_10;
          }
          if (![v13 isEqualToString:*MEMORY[0x263F0C0D0]])
          {
            if ([v13 isEqualToString:*MEMORY[0x263F0C208]])
            {
              objc_msgSend(a1, "hf_localizationKeyForProgrammableSwitchCharacteristic:value:", v11, v9);
              uint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
              if (v20) {
                goto LABEL_27;
              }
              goto LABEL_10;
            }
            if ([v13 isEqualToString:*MEMORY[0x263F0C288]])
            {
              int v23 = [v9 BOOLValue];
              uint64_t v24 = @"HFCharacteristicTriggerDescriptionValueDetectsNoMotion";
              uint64_t v25 = @"HFCharacteristicTriggerDescriptionValueDetectsMotion";
            }
            else
            {
              if ([v13 isEqualToString:*MEMORY[0x263F0BF80]])
              {
                uint64_t v20 = @"HFCharacteristicTriggerDescriptionValueDetectsCO2";
                goto LABEL_27;
              }
              if ([v13 isEqualToString:*MEMORY[0x263F0BFB0]])
              {
                uint64_t v20 = @"HFCharacteristicTriggerDescriptionValueDetectsCO";
                goto LABEL_27;
              }
              if ([v13 isEqualToString:*MEMORY[0x263F0C238]])
              {
                uint64_t v20 = @"HFCharacteristicTriggerDescriptionValueDetectsLeak";
                goto LABEL_27;
              }
              if (![v13 isEqualToString:*MEMORY[0x263F0C2C0]])
              {
                if ([v13 isEqualToString:*MEMORY[0x263F0C3F0]])
                {
                  uint64_t v20 = @"HFCharacteristicTriggerDescriptionValueDetectsSmoke";
                  goto LABEL_27;
                }
                goto LABEL_10;
              }
              int v23 = [v9 BOOLValue];
              uint64_t v24 = @"HFCharacteristicTriggerDescriptionValueDetectsNoOccupancy";
              uint64_t v25 = @"HFCharacteristicTriggerDescriptionValueDetectsOccupancy";
            }
            goto LABEL_13;
          }
        }
        uint64_t v34 = [v9 integerValue];
        uint64_t v24 = @"HFCharacteristicTriggerDescriptionValueOpen";
        id v27 = @"HFCharacteristicTriggerDescriptionValueClosed";
        BOOL v29 = v34 == 0;
LABEL_24:
        if (v29) {
          uint64_t v24 = v27;
        }
        goto LABEL_26;
      }
      uint64_t v26 = [v9 integerValue];
      uint64_t v24 = @"HFCharacteristicTriggerDescriptionValueOpen";
      id v27 = @"HFCharacteristicTriggerDescriptionValueClosed";
    }
    BOOL v29 = v26 == 1;
    goto LABEL_24;
  }
LABEL_10:
  uint64_t v20 = @"HFCharacteristicTriggerDescriptionValueOther";
LABEL_27:
  if ((unint64_t)[v8 count] >= 2)
  {
    uint64_t v30 = [NSString stringWithFormat:@"%@_Plural", v20, v36, v37, v38, v39];
    id v31 = objc_msgSend(a1, "_hf_localizedStringOrNilIfNotFoundForKey:", v30);

    if (v31)
    {
      v32 = v30;

      uint64_t v20 = v32;
    }
  }
  int v28 = _HFLocalizedStringWithDefaultValue(v20, v20, 1);
  if (!v20) {
    NSLog(&cfstr_NoLocalizedStr_1.isa, 0);
  }

LABEL_34:
  return v28;
}

+ (id)hf_triggerRangeValueNaturalLanguageDescriptionWithCharacteristics:()NaturalLanguage triggerValueRange:thresholdValue:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = objc_msgSend(v8, "na_any:", &__block_literal_global_445);
  id v12 = 0;
  id v13 = 0;
  char v14 = 0;
  if (v9 && v11)
  {
    uint64_t v15 = objc_msgSend(a1, "_hf_triggerRangeKeyComponentForRangeType:", objc_msgSend(a1, "hf_triggerRangeTypeWithCharacteristics:triggerValueRange:thresholdValue:", v8, v9, v10));
    id v12 = (void *)v15;
    if (v10)
    {
      id v13 = objc_msgSend(a1, "hf_triggerValueNaturalLanguageDescriptionWithCharacteristics:triggerValue:", v8, v10);
      if (v12)
      {
LABEL_5:
        id v16 = [NSString stringWithFormat:@"HFCharacteristicTriggerRangeValueNaturalLanguageDescription_%@", v12];
        int v23 = v16;
        if (v13)
        {
          char v14 = HFLocalizedStringWithFormat(v16, @"%@", v17, v18, v19, v20, v21, v22, (uint64_t)v13);
        }
        else
        {
          uint64_t v24 = [v16 stringByAppendingString:@"_WithoutValue"];
          char v14 = _HFLocalizedStringWithDefaultValue(v24, v24, 1);
        }
        goto LABEL_11;
      }
    }
    else
    {
      id v13 = 0;
      if (v15) {
        goto LABEL_5;
      }
    }
    char v14 = 0;
  }
LABEL_11:

  return v14;
}

+ (id)hf_triggerValueNaturalLanguageDescriptionWithCharacteristics:()NaturalLanguage triggerValueRange:thresholdValue:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [v8 anyObject];
  id v12 = [v11 characteristicType];
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __129__HMEventTrigger_NaturalLanguage__hf_triggerValueNaturalLanguageDescriptionWithCharacteristics_triggerValueRange_thresholdValue___block_invoke;
  uint64_t v22 = &unk_2640903A0;
  id v13 = v12;
  id v23 = v13;
  if (objc_msgSend(v8, "na_any:", &v19)) {
    goto LABEL_6;
  }
  char v14 = objc_msgSend(MEMORY[0x263F0E248], "hf_valueRangeCharacteristicTypes");
  int v15 = [v14 containsObject:v13];

  if (v15)
  {
    id v16 = objc_msgSend(a1, "hf_triggerRangeValueNaturalLanguageDescriptionWithCharacteristics:triggerValueRange:thresholdValue:", v8, v9, v10);
    goto LABEL_8;
  }
  if (![v13 isEqualToString:*MEMORY[0x263F0C0D0]])
  {
LABEL_6:
    id v16 = _HFLocalizedStringWithDefaultValue(@"HFCharacteristicTriggerDescriptionValueOther", @"HFCharacteristicTriggerDescriptionValueOther", 1);
    if (!v16) {
      NSLog(&cfstr_NoLocalizedStr_2.isa, @"HFCharacteristicTriggerDescriptionValueOther", v19, v20, v21, v22);
    }
  }
  else
  {
    uint64_t v17 = objc_msgSend(v9, "hf_representativeValue");
    id v16 = objc_msgSend(a1, "hf_triggerValueNaturalLanguageDescriptionWithCharacteristics:triggerValue:", v8, v17);
  }
LABEL_8:

  return v16;
}

+ (id)hf_localizationKeyForProgrammableSwitchCharacteristic:()NaturalLanguage value:
{
  id v5 = a4;
  id v6 = v5;
  id v7 = 0;
  if (a3 && v5)
  {
    id v8 = [a3 metadata];
    int v9 = objc_msgSend(v8, "hf_isValidValue:", v6);

    if (v9)
    {
      id v7 = HFProgrammableSwitchLocalizedStringKeyForValue(v6);
    }
    else
    {
      id v7 = 0;
    }
  }

  return v7;
}

+ (id)hf_localizedStringForProgrammableSwitchCharacteristic:()NaturalLanguage value:
{
  v1 = objc_msgSend(a1, "hf_localizationKeyForProgrammableSwitchCharacteristic:value:");
  v2 = v1;
  if (v1)
  {
    id v3 = _HFLocalizedStringWithDefaultValue(v1, v1, 1);
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

+ (id)hf_naturalLanguageTurnOffAfterDuration:()NaturalLanguage style:
{
  if (!a3)
  {
    uint64_t v21 = _HFLocalizedStringWithDefaultValue(@"HFTriggerDurationValueNoDuration", @"HFTriggerDurationValueNoDuration", 1);
    goto LABEL_13;
  }
  [a3 doubleValue];
  double v6 = v5;
  id v7 = objc_opt_new();
  id v8 = [MEMORY[0x263F086E0] mainBundle];
  int v9 = [v8 preferredLocalizations];
  id v10 = [v9 firstObject];
  int v11 = [v10 isEqualToString:@"en"];

  if (v11) {
    uint64_t v12 = 3;
  }
  else {
    uint64_t v12 = 2;
  }
  [v7 setUnitsStyle:v12];
  id v13 = [v7 stringFromTimeInterval:v6];
  uint64_t v20 = v13;
  if (a4 == 1)
  {
    HFLocalizedStringWithFormat(@"HFTriggerDurationValueDurationFormatSentence", @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v13);
  }
  else
  {
    if (a4)
    {
      id v22 = v13;
      goto LABEL_12;
    }
    HFLocalizedStringWithFormat(@"HFTriggerDurationValueDurationFormat", @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v13);
  }
  id v22 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
  uint64_t v21 = v22;

LABEL_13:
  return v21;
}

+ (__CFString)_hf_triggerRangeKeyComponentForRangeType:()NaturalLanguage
{
  if ((unint64_t)(a3 - 1) > 2) {
    return @"DropsBelow";
  }
  else {
    return off_264091860[a3 - 1];
  }
}

+ (unint64_t)hf_triggerRangeTypeWithCharacteristics:()NaturalLanguage triggerValueRange:thresholdValue:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 anyObject];
  int v11 = [v10 characteristicType];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __107__HMEventTrigger_NaturalLanguage__hf_triggerRangeTypeWithCharacteristics_triggerValueRange_thresholdValue___block_invoke;
  v26[3] = &unk_2640903A0;
  id v12 = v11;
  id v27 = v12;
  if (objc_msgSend(v7, "na_any:", v26))
  {
    unint64_t v13 = 3;
  }
  else
  {
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    uint64_t v21 = __107__HMEventTrigger_NaturalLanguage__hf_triggerRangeTypeWithCharacteristics_triggerValueRange_thresholdValue___block_invoke_2;
    id v22 = &unk_2640917D0;
    id v23 = v10;
    id v24 = v8;
    id v25 = v9;
    unint64_t v13 = __107__HMEventTrigger_NaturalLanguage__hf_triggerRangeTypeWithCharacteristics_triggerValueRange_thresholdValue___block_invoke_2((uint64_t)&v19);
  }
  uint64_t v14 = objc_msgSend(v7, "anyObject", v19, v20, v21, v22);
  uint64_t v15 = [v14 characteristicType];
  int v16 = [v15 isEqualToString:*MEMORY[0x263F0BF40]];

  if (v13 <= 1) {
    uint64_t v17 = 1;
  }
  else {
    uint64_t v17 = v13;
  }
  if (v13 == 1) {
    uint64_t v17 = 0;
  }
  if (v16) {
    unint64_t v13 = v17;
  }

  return v13;
}

+ (id)_hf_localizedStringOrNilIfNotFoundForKey:()NaturalLanguage
{
  id v3 = a3;
  id v4 = _HFLocalizedStringWithDefaultValue(v3, v3, 1);
  double v5 = v4;
  if (!v4
    || ([v4 isEqualToString:&stru_26C081158] & 1) != 0
    || [v5 isEqualToString:v3])
  {

    double v5 = 0;
  }

  return v5;
}

- (id)_hf_naturalLanguageDetailsSentenceElementsWithOptions:()NaturalLanguage
{
  id v4 = a3;
  double v5 = [a1 predicate];
  double v6 = +[HFConditionCollection conditionCollectionForPredicate:v5];

  id v7 = [v6 conditions];
  id v8 = objc_msgSend(v7, "na_firstObjectPassingTest:", &__block_literal_global_479);

  if (v8)
  {
    id v9 = [v8 predicate];

    if (!v9) {
      [v6 removeCondition:v8];
    }
  }
  id v10 = objc_opt_class();
  int v11 = objc_msgSend(a1, "hf_effectiveRecurrences");
  id v12 = [a1 endEvents];
  unint64_t v13 = objc_msgSend(v10, "_hf_naturalLanguageDetailsSentenceElementsWithRecurrences:conditions:endEvents:withOptions:", v11, v6, v12, v4);

  return v13;
}

+ (id)hf_naturalLanguageDetailsWithRecurrences:()NaturalLanguage conditions:endEvents:withOptions:
{
  v1 = objc_msgSend(a1, "_hf_naturalLanguageDetailsSentenceElementsWithRecurrences:conditions:endEvents:withOptions:");
  v2 = (void *)[v1 mutableCopy];

  if ([v2 count])
  {
    if (qword_26AB2EF90 != -1) {
      dispatch_once(&qword_26AB2EF90, &__block_literal_global_484);
    }
    id v3 = (id)qword_26AB2EF98;
    [v3 setListStyle:2];
    id v4 = [v2 array];
    double v5 = [v3 stringForObjectValue:v4];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

+ (id)_hf_naturalLanguageDetailsSentenceElementsWithRecurrences:()NaturalLanguage conditions:endEvents:withOptions:
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  unint64_t v13 = [MEMORY[0x263EFF9B0] orderedSet];
  if ([v9 count])
  {
    uint64_t v14 = objc_msgSend(MEMORY[0x263F0E860], "hf_recurrenceNaturalLanguageStringKeyWithOptions:recurrences:", v12, v9);
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v15 = [v14 localizedStringWithArgumentBlock:0];
        [v13 addObject:v15];
      }
    }
  }
  if (v10)
  {
    int v16 = [v10 conditions];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __126__HMEventTrigger_NaturalLanguage___hf_naturalLanguageDetailsSentenceElementsWithRecurrences_conditions_endEvents_withOptions___block_invoke;
    v30[3] = &unk_264091818;
    id v31 = v12;
    long long v32 = xmmword_20BD136F0;
    uint64_t v17 = objc_msgSend(v16, "na_map:", v30);

    if ([v17 count])
    {
      if (qword_26AB2EFA0 != -1) {
        dispatch_once(&qword_26AB2EFA0, &__block_literal_global_491);
      }
      id v18 = (id)qword_26AB2EFA8;
      uint64_t v19 = [v18 stringForObjectValue:v17];
      uint64_t v20 = objc_msgSend(v19, "hf_stringByCapitalizingFirstWord");
      [v13 addObject:v20];
    }
  }
  uint64_t v21 = objc_msgSend(v11, "na_firstObjectPassingTest:", &__block_literal_global_493);
  id v22 = v21;
  if (v21)
  {
    [v21 duration];
    double v24 = v23;
    id v25 = objc_opt_class();
    uint64_t v26 = [NSNumber numberWithDouble:v24];
    id v27 = objc_msgSend(v25, "hf_naturalLanguageTurnOffAfterDuration:style:", v26, 1);

    [v13 addObject:v27];
  }
  int v28 = (void *)[v13 copy];

  return v28;
}

@end