@interface HMEventTrigger(HFEventTriggerAdditions)
+ (id)hf_allTriggerValuesForCharacteristic:()HFEventTriggerAdditions similarToValue:;
+ (id)hf_representativeTriggerValueForCharacteristic:()HFEventTriggerAdditions similarToValue:;
+ (uint64_t)_hf_valueIsValidForCharacteristic:()HFEventTriggerAdditions value:;
- (id)hf_characteristicsInEvents;
- (id)hf_designateTrigger:()HFEventTriggerAdditions;
- (id)hf_durationEndEvent;
- (id)hf_effectiveRecurrences;
- (uint64_t)hf_isHomeAppCreatedTrigger;
- (uint64_t)hf_markTriggerAsHomeAppCreated;
- (uint64_t)hf_triggerType;
- (uint64_t)hf_unmarkTriggerAsHomeAppCreated;
@end

@implementation HMEventTrigger(HFEventTriggerAdditions)

- (id)hf_durationEndEvent
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = [a1 endEvents];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v4 = objc_msgSend(a1, "endEvents", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      v7 = 0;
      uint64_t v8 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v4);
          }
          v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          objc_opt_class();
          id v11 = v10;
          if (objc_opt_isKindOfClass()) {
            v12 = v11;
          }
          else {
            v12 = 0;
          }
          id v13 = v12;

          [v13 duration];
          if (v14 > 1.0)
          {
            if (!v7 || ([v7 duration], double v16 = v15, objc_msgSend(v13, "duration"), v16 > v17))
            {
              id v18 = v13;

              v7 = v18;
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)hf_effectiveRecurrences
{
  v2 = [a1 recurrences];
  if (![v2 count])
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x263EFF918], "hf_dailyWeekdayIntervalComponents");

    v2 = (void *)v3;
  }
  if ([a1 executeOnce])
  {

    v2 = (void *)MEMORY[0x263EFFA68];
  }
  return v2;
}

- (uint64_t)hf_triggerType
{
  v2 = [a1 events];
  int v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_359_0);

  v4 = [a1 events];
  char v5 = objc_msgSend(v4, "na_any:", &__block_literal_global_361);

  uint64_t v6 = [a1 events];
  v7 = objc_msgSend(v6, "na_firstObjectPassingTest:", &__block_literal_global_365);

  uint64_t v8 = [a1 events];
  v9 = objc_msgSend(v8, "na_filter:", &__block_literal_global_368);

  if (v7)
  {
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "presenceEventType"));
    int v11 = [&unk_26C0F8218 containsObject:v10];

    if (v11) {
      uint64_t v12 = 4;
    }
    else {
      uint64_t v12 = 3;
    }
  }
  else
  {
    char v13 = v3 | v5;
    if (v3) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 1;
    }
    if ((v13 & 1) == 0)
    {
      if ([v9 count])
      {
        double v14 = objc_msgSend(MEMORY[0x263F0E248], "hf_sensingCharacteristicTypes");
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __57__HMEventTrigger_HFEventTriggerAdditions__hf_triggerType__block_invoke_383;
        v17[3] = &unk_264091780;
        id v18 = v14;
        id v15 = v14;
        if (objc_msgSend(v9, "na_any:", v17)) {
          uint64_t v12 = 6;
        }
        else {
          uint64_t v12 = 5;
        }
      }
      else
      {
        uint64_t v12 = 0;
      }
    }
  }

  return v12;
}

- (uint64_t)hf_isHomeAppCreatedTrigger
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = [a1 uniqueIdentifier];
  int v3 = [v2 UUIDString];

  if (v3)
  {
    v4 = objc_opt_new();
    char v5 = [a1 events];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __69__HMEventTrigger_HFEventTriggerAdditions__hf_isHomeAppCreatedTrigger__block_invoke;
    v22[3] = &unk_26408F138;
    id v6 = v4;
    id v23 = v6;
    objc_msgSend(v5, "na_each:", v22);

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      while (2)
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v11), "applicationData", (void)v18);
          char v13 = [v12 objectForKey:@"HFDesignatedTriggerAppDataKey"];

          double v14 = [MEMORY[0x263EFFA08] setWithArray:v13];
          char v15 = [v14 containsObject:v3];

          if (v15)
          {
            uint64_t v16 = 1;
            goto LABEL_12;
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v24 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    uint64_t v16 = 0;
LABEL_12:
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

- (uint64_t)hf_markTriggerAsHomeAppCreated
{
  return objc_msgSend(a1, "hf_designateTrigger:", 1);
}

- (uint64_t)hf_unmarkTriggerAsHomeAppCreated
{
  return objc_msgSend(a1, "hf_designateTrigger:", 0);
}

- (id)hf_designateTrigger:()HFEventTriggerAdditions
{
  char v5 = [a1 uniqueIdentifier];
  id v6 = [v5 UUIDString];

  if ([v6 length])
  {
    if (objc_msgSend(a1, "hf_isHomeAppCreatedTrigger") == a3)
    {
      char v13 = [MEMORY[0x263F58190] futureWithNoResult];
    }
    else
    {
      id v7 = objc_opt_new();
      uint64_t v8 = [a1 events];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __63__HMEventTrigger_HFEventTriggerAdditions__hf_designateTrigger___block_invoke;
      v23[3] = &unk_26408F138;
      id v9 = v7;
      id v24 = v9;
      objc_msgSend(v8, "na_each:", v23);

      if ([v9 count])
      {
        uint64_t v10 = [v9 firstObject];
        uint64_t v11 = (void *)MEMORY[0x263F58190];
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __63__HMEventTrigger_HFEventTriggerAdditions__hf_designateTrigger___block_invoke_2;
        v18[3] = &unk_264097910;
        char v22 = a3;
        id v19 = v10;
        long long v20 = a1;
        id v21 = v6;
        id v12 = v10;
        char v13 = [v11 futureWithErrorOnlyHandlerAdapterBlock:v18];
      }
      else
      {
        uint64_t v16 = (void *)MEMORY[0x263F58190];
        objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 30);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        char v13 = [v16 futureWithError:v12];
      }
    }
  }
  else
  {
    double v14 = (void *)MEMORY[0x263F58190];
    char v15 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 30);
    char v13 = [v14 futureWithError:v15];
  }
  return v13;
}

- (id)hf_characteristicsInEvents
{
  v1 = [a1 events];
  v2 = objc_msgSend(v1, "na_map:", &__block_literal_global_394);

  int v3 = [MEMORY[0x263EFFA08] setWithArray:v2];

  return v3;
}

+ (id)hf_allTriggerValuesForCharacteristic:()HFEventTriggerAdditions similarToValue:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263EFFA08] setWithObject:v7];
  id v9 = [v6 characteristicType];
  int v10 = [v9 isEqualToString:*MEMORY[0x263F0C0E8]];

  if (v10)
  {
    if (qword_26AB2F460 != -1) {
      dispatch_once(&qword_26AB2F460, &__block_literal_global_399);
    }
    uint64_t v11 = (void *)qword_26AB2F468;
    goto LABEL_9;
  }
  id v12 = [v6 characteristicType];
  int v13 = [v12 isEqualToString:*MEMORY[0x263F0C040]];

  if (v13)
  {
    if (qword_26AB2F470 != -1) {
      dispatch_once(&qword_26AB2F470, &__block_literal_global_412_0);
    }
    uint64_t v11 = (void *)qword_26AB2F478;
LABEL_9:
    id v14 = v11;
    if (([v14 containsObject:v7] & 1) == 0)
    {
LABEL_11:

      goto LABEL_12;
    }
LABEL_10:
    id v14 = v14;

    uint64_t v8 = v14;
    goto LABEL_11;
  }
  long long v18 = [v6 characteristicType];
  int v19 = [v18 isEqualToString:*MEMORY[0x263F0C0B0]];

  if (v19)
  {
    if (qword_26AB2F480 != -1) {
      dispatch_once(&qword_26AB2F480, &__block_literal_global_416);
    }
    id v14 = (id)qword_26AB2F488;
    if (![v14 containsObject:v7]) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_12:
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __95__HMEventTrigger_HFEventTriggerAdditions__hf_allTriggerValuesForCharacteristic_similarToValue___block_invoke_419;
  v20[3] = &unk_264097958;
  id v21 = v6;
  uint64_t v22 = a1;
  id v15 = v6;
  uint64_t v16 = objc_msgSend(v8, "na_filter:", v20);

  return v16;
}

+ (uint64_t)_hf_valueIsValidForCharacteristic:()HFEventTriggerAdditions value:
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v5 metadata];
    uint64_t v8 = [v7 maximumValue];
    uint64_t v9 = [v8 compare:v6];

    int v10 = [v5 metadata];
    uint64_t v11 = [v10 minimumValue];
    uint64_t v12 = [v11 compare:v6];

    int v13 = [v5 metadata];
    id v14 = [v13 validValues];

    BOOL v15 = v9 == -1 || v12 == 1;
    int v16 = !v15;
    uint64_t v17 = !v15 && v14 == 0;
    if (v14 && v16) {
      uint64_t v17 = [v14 containsObject:v6];
    }
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

+ (id)hf_representativeTriggerValueForCharacteristic:()HFEventTriggerAdditions similarToValue:
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = objc_msgSend(a1, "hf_allTriggerValuesForCharacteristic:similarToValue:", v6, v7);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (!v9) {
      goto LABEL_17;
    }
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_opt_class();
        id v15 = v14;
        if (objc_opt_isKindOfClass()) {
          int v16 = v15;
        }
        else {
          int v16 = 0;
        }
        id v17 = v16;

        if (v17 && (!v11 || [v17 compare:v11] == -1))
        {
          id v18 = v15;

          uint64_t v11 = v18;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
    if (!v11)
    {
LABEL_17:
      uint64_t v11 = [v8 anyObject];
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

@end