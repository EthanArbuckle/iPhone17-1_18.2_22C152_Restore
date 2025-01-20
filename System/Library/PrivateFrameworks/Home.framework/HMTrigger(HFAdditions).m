@interface HMTrigger(HFAdditions)
+ (__CFString)hf_localizedStringForSignficantEvent:()HFAdditions offset:;
+ (id)hf_sanitizeTriggerName:()HFAdditions home:;
- (id)hf_anonymousActions;
- (id)hf_forceDisableReasons;
- (id)hf_naturalLanguageNameWithHome:()HFAdditions type:;
- (uint64_t)hf_affectsCharacteristics:()HFAdditions;
- (uint64_t)hf_affectsHomeKitObject:()HFAdditions;
- (uint64_t)hf_affectsProfiles:()HFAdditions;
- (uint64_t)hf_isBuilder;
- (uint64_t)hf_isShortcutOwned;
- (uint64_t)hf_requiresConfirmationToRun;
- (uint64_t)hf_shouldDisplayTrigger;
- (uint64_t)hf_triggerType;
@end

@implementation HMTrigger(HFAdditions)

- (id)hf_naturalLanguageNameWithHome:()HFAdditions type:
{
  id v6 = a3;
  v7 = [[HFTriggerNaturalLanguageOptions alloc] initWithHome:v6 nameType:a4];

  v8 = objc_msgSend(a1, "hf_naturalLanguageNameWithOptions:", v7);

  return v8;
}

- (uint64_t)hf_triggerType
{
  return 0;
}

- (uint64_t)hf_requiresConfirmationToRun
{
  return 0;
}

- (uint64_t)hf_isShortcutOwned
{
  v1 = [a1 actionSets];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_141);

  return v2;
}

- (uint64_t)hf_isBuilder
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)hf_anonymousActions
{
  uint64_t v2 = [a1 actionSets];
  uint64_t v3 = [v2 count];

  if (!v3)
  {
    if (_MergedGlobals_276 != -1) {
      dispatch_once(&_MergedGlobals_276, &__block_literal_global_8_6);
    }
  }
  v4 = (void *)MEMORY[0x263EFFA08];
  v5 = [a1 actionSets];
  id v6 = [v4 setWithArray:v5];
  v7 = objc_msgSend(v6, "na_flatMap:", &__block_literal_global_12_5);

  return v7;
}

- (uint64_t)hf_shouldDisplayTrigger
{
  objc_opt_class();
  id v2 = a1;
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  if (v4)
  {
    v5 = [v4 creator];
    if (v5)
    {

LABEL_10:
      v9 = [v4 events];
      uint64_t v6 = objc_msgSend(v9, "na_any:", &__block_literal_global_19_6);

      goto LABEL_11;
    }
    v7 = [v4 events];
    char v8 = objc_msgSend(v7, "na_all:", &__block_literal_global_16_6);

    if ((v8 & 1) == 0) {
      goto LABEL_10;
    }
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = 1;
  }
LABEL_11:

  return v6;
}

- (id)hf_forceDisableReasons
{
  if (!objc_msgSend(a1, "hf_requiresConfirmationToRun")
    || +[HFUtilities isAMac]
    || +[HFUtilities isAVisionPro])
  {
    v1 = [MEMORY[0x263F58190] futureWithResult:&unk_26C0F6E28];
  }
  else
  {
    uint64_t v3 = +[HFUserNotificationCenter sharedInstance];
    id v4 = [v3 notificationSettings];
    v1 = [v4 flatMap:&__block_literal_global_25_10];
  }
  return v1;
}

+ (__CFString)hf_localizedStringForSignficantEvent:()HFAdditions offset:
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x263F08780]);
    v10 = [MEMORY[0x263F086E0] mainBundle];
    v11 = [v10 preferredLocalizations];
    v12 = [v11 firstObject];
    if ([v12 isEqualToString:@"en"]) {
      uint64_t v13 = 3;
    }
    else {
      uint64_t v13 = 2;
    }
    [v9 setUnitsStyle:v13];

    [v9 setAllowedUnits:96];
    v14 = objc_msgSend(v8, "hf_absoluteValue");
    v15 = [v9 stringFromDateComponents:v14];

    v16 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:0.0];
    v17 = [MEMORY[0x263EFF8F0] currentCalendar];
    v18 = [v17 dateByAddingComponents:v8 toDate:v16 options:0];

    int v19 = [v16 isEqual:v18];
    v20 = [v16 earlierDate:v18];

    if ([v7 isEqualToString:*MEMORY[0x263F0D8F8]])
    {
      if (!v19)
      {
        if (v20 == v16) {
          HFLocalizedStringWithFormat(@"HFTimerTriggerTimeStringSunriseWithPositiveOffset", @"%@", v21, v22, v23, v24, v25, v26, (uint64_t)v15);
        }
        else {
          HFLocalizedStringWithFormat(@"HFTimerTriggerTimeStringSunriseWithNegativeOffset", @"%@", v21, v22, v23, v24, v25, v26, (uint64_t)v15);
        }
        uint64_t v34 = LABEL_22:;
        goto LABEL_23;
      }
      goto LABEL_11;
    }
    if ([v7 isEqualToString:*MEMORY[0x263F0D908]])
    {
      if (!v19)
      {
        if (v20 == v16) {
          HFLocalizedStringWithFormat(@"HFTimerTriggerTimeStringSunseteWithPositiveOffset", @"%@", v28, v29, v30, v31, v32, v33, (uint64_t)v15);
        }
        else {
          HFLocalizedStringWithFormat(@"HFTimerTriggerTimeStringSunsetWithNegativeOffset", @"%@", v28, v29, v30, v31, v32, v33, (uint64_t)v15);
        }
        goto LABEL_22;
      }
      goto LABEL_17;
    }
    goto LABEL_19;
  }
  if (([v7 isEqualToString:*MEMORY[0x263F0D8F8]] & 1) == 0)
  {
    v15 = 0;
    if ([v7 isEqualToString:*MEMORY[0x263F0D908]])
    {
LABEL_17:
      v27 = @"HFTimerTriggerTimeStringSunset";
      goto LABEL_18;
    }
LABEL_19:
    v35 = [MEMORY[0x263F08690] currentHandler];
    [v35 handleFailureInMethod:a2, a1, @"HMTrigger+HFAdditions.m", 170, @"Unsupport significant event type: %@", v7 object file lineNumber description];

    v36 = &stru_26C081158;
    goto LABEL_24;
  }
  v15 = 0;
LABEL_11:
  v27 = @"HFTimerTriggerTimeStringSunrise";
LABEL_18:
  uint64_t v34 = _HFLocalizedStringWithDefaultValue(v27, v27, 1);
LABEL_23:
  v36 = (__CFString *)v34;
LABEL_24:

  return v36;
}

+ (id)hf_sanitizeTriggerName:()HFAdditions home:
{
  v5 = (void *)MEMORY[0x263EFFA08];
  id v6 = a3;
  id v7 = [a4 triggers];
  id v8 = [v5 setWithArray:v7];
  id v9 = objc_msgSend(v8, "na_map:", &__block_literal_global_70_5);

  v10 = +[HFUtilities sanitizeAutoGeneratedHomeKitName:v6];

  v11 = +[HFUtilities uniqueHomeKitNameForName:v10 allNames:v9];

  return v11;
}

- (uint64_t)hf_affectsHomeKitObject:()HFAdditions
{
  id v4 = a3;
  v5 = objc_opt_new();
  id v6 = objc_opt_new();
  objc_opt_class();
  id v7 = v4;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    v10 = [v9 characteristics];
    [v5 addObjectsFromArray:v10];
  }
  objc_opt_class();
  id v11 = v7;
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    v14 = [v13 services];
    v15 = objc_msgSend(v14, "na_flatMap:", &__block_literal_global_76_1);
    [v5 addObjectsFromArray:v15];

    v16 = [v13 profiles];
    [v6 addObjectsFromArray:v16];
  }
  objc_opt_class();
  id v17 = v11;
  if (objc_opt_isKindOfClass()) {
    v18 = v17;
  }
  else {
    v18 = 0;
  }
  id v19 = v18;

  if (v19)
  {
    v20 = [v19 services];
    uint64_t v21 = objc_msgSend(v20, "na_flatMap:", &__block_literal_global_79);
    [v5 addObjectsFromArray:v21];
  }
  objc_opt_class();
  id v22 = v17;
  if (objc_opt_isKindOfClass()) {
    uint64_t v23 = v22;
  }
  else {
    uint64_t v23 = 0;
  }
  id v24 = v23;

  if (v24) {
    [v6 addObject:v24];
  }
  id v25 = v22;
  if ([v25 conformsToProtocol:&unk_26C155B48]) {
    uint64_t v26 = v25;
  }
  else {
    uint64_t v26 = 0;
  }
  id v27 = v26;

  if (v27)
  {
    uint64_t v28 = [v27 mediaProfiles];
    [v6 unionSet:v28];
  }
  if (objc_msgSend(a1, "hf_affectsCharacteristics:", v5)) {
    uint64_t v29 = 1;
  }
  else {
    uint64_t v29 = objc_msgSend(a1, "hf_affectsProfiles:", v6);
  }

  return v29;
}

- (uint64_t)hf_affectsCharacteristics:()HFAdditions
{
  id v4 = a3;
  v5 = [a1 actionSets];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__HMTrigger_HFAdditions__hf_affectsCharacteristics___block_invoke;
  v9[3] = &unk_26408E348;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

- (uint64_t)hf_affectsProfiles:()HFAdditions
{
  id v4 = a3;
  v5 = [a1 actionSets];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45__HMTrigger_HFAdditions__hf_affectsProfiles___block_invoke;
  v9[3] = &unk_26408E348;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

@end