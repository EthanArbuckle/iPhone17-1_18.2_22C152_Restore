@interface HFTelevisionServiceItem
+ (id)supportedServiceTypes;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)createControlItemsWithOptions:(id)a3;
@end

@implementation HFTelevisionServiceItem

+ (id)supportedServiceTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D850]];
}

- (id)createControlItemsWithOptions:(id)a3
{
  v22[1] = *MEMORY[0x263EF8340];
  v4 = objc_msgSend(MEMORY[0x263EFF9C0], "set", a3);
  v5 = [(HFServiceItem *)self controlItemValueSourceForPrimaryService];
  v21 = @"controlItemPurpose";
  v22[0] = &unk_26C0F6678;
  v6 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
  v7 = [[HFPowerStateControlItem alloc] initWithValueSource:v5 displayResults:v6];
  [v4 addObject:v7];
  v8 = [(HFServiceItem *)self service];
  v9 = objc_msgSend(v8, "hf_childServices");
  v10 = objc_msgSend(v9, "na_filter:", &__block_literal_global_64);

  if ([v10 count])
  {
    v11 = [(HFServiceItem *)self service];
    uint64_t v12 = [v10 setByAddingObject:v11];

    v13 = [(HFServiceItem *)self controlItemValueSourceForServices:v12];
    v14 = [HFTVInputControlItem alloc];
    v19 = @"controlItemPurpose";
    v20 = &unk_26C0F6690;
    v15 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    v16 = [(HFTVInputControlItem *)v14 initWithValueSource:v13 displayResults:v15];

    [v4 addObject:v16];
    v10 = (void *)v12;
  }
  v17 = (void *)[v4 copy];

  return v17;
}

uint64_t __57__HFTelevisionServiceItem_createControlItemsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 serviceType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0D738]];

  return v3;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v15[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = *MEMORY[0x263F0BF08];
  v15[0] = *MEMORY[0x263F0BEF8];
  v15[1] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  v8 = [v5 setWithArray:v7];

  v9 = [(HFServiceItem *)self performStandardUpdateWithCharacteristicTypes:v8 options:v4];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __55__HFTelevisionServiceItem__subclass_updateWithOptions___block_invoke;
  v13[3] = &unk_26408F700;
  v13[4] = self;
  id v14 = v4;
  id v10 = v4;
  v11 = [v9 flatMap:v13];

  return v11;
}

id __55__HFTelevisionServiceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 readResponse];
  uint64_t v5 = *MEMORY[0x263F0BEF8];
  uint64_t v6 = [*(id *)(a1 + 32) service];
  v7 = [v4 responseForCharacteristicType:v5 inService:v6];

  v8 = [v7 valueWithExpectedClass:objc_opt_class()];
  v9 = [v3 standardResults];
  id v10 = [v9 objectForKeyedSubscript:@"suspendedState"];
  uint64_t v11 = [v10 unsignedIntegerValue];

  uint64_t v12 = [v3 standardResults];
  v13 = (void *)[v12 mutableCopy];

  id v14 = [v3 displayMetadata];
  v15 = [v14 error];

  if (!v15)
  {
    v16 = [v13 objectForKeyedSubscript:@"errorDescription"];

    if (!v16)
    {
      if (!v8) {
        goto LABEL_35;
      }
      v21 = [v3 readResponse];
      v22 = [v21 responseForCharacteristicType:*MEMORY[0x263F0BF08]];
      v23 = [v22 valueWithExpectedClass:objc_opt_class()];

      v24 = [*(id *)(a1 + 32) service];
      v25 = objc_msgSend(v24, "hf_childServices");
      v55[0] = MEMORY[0x263EF8330];
      v55[1] = 3221225472;
      v55[2] = __55__HFTelevisionServiceItem__subclass_updateWithOptions___block_invoke_2;
      v55[3] = &unk_26408E0E8;
      id v54 = v23;
      id v56 = v54;
      v26 = objc_msgSend(v25, "na_filter:", v55);

      v27 = [*(id *)(a1 + 40) objectForKeyedSubscript:HFItemUpdateOptionLogger];
      v51 = v27;
      if (objc_msgSend(MEMORY[0x263F0DF00], "hf_isSuspendedStateSuspended:", v11))
      {
        if (v27)
        {
          state.opaque[0] = 0;
          state.opaque[1] = 0;
          v28 = objc_msgSend(v27, "loggerActivity", v27);
          os_activity_scope_enter(v28, &state);

          v29 = HFLogForCategory(0x2AuLL);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v58 = v11;
            v30 = "HFTelevision is suspended with state %lu";
            v31 = v29;
            os_log_type_t v32 = OS_LOG_TYPE_DEFAULT;
            uint32_t v33 = 12;
LABEL_22:
            _os_log_impl(&dword_20B986000, v31, v32, v30, buf, v33);
          }
LABEL_23:

          os_activity_scope_leave(&state);
          goto LABEL_24;
        }
        v46 = HFLogForCategory(0x2AuLL);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(state.opaque[0]) = 134217984;
          *(uint64_t *)((char *)state.opaque + 4) = v11;
          v47 = "HFTelevision is suspended with state %lu";
          v48 = v46;
          os_log_type_t v49 = OS_LOG_TYPE_DEFAULT;
          uint32_t v50 = 12;
LABEL_45:
          _os_log_impl(&dword_20B986000, v48, v49, v47, (uint8_t *)&state, v50);
        }
LABEL_46:

LABEL_24:
        v36 = objc_msgSend(v26, "anyObject", v51);
        v53 = v26;
        if ([v8 BOOLValue] && v36)
        {
          uint64_t v37 = [v36 name];
        }
        else
        {
          if ([v8 BOOLValue]) {
            v38 = @"HFCharacteristicValuePowerStateOn";
          }
          else {
            v38 = @"HFCharacteristicValuePowerStateOff";
          }
          uint64_t v37 = _HFLocalizedStringWithDefaultValue(v38, v38, 1);
        }
        v39 = (void *)v37;
        [v13 setObject:v37 forKeyedSubscript:@"description"];

        if (([v8 BOOLValue] & 1) == 0
          && objc_msgSend(MEMORY[0x263F0DF00], "hf_isSuspendedStateSuspended:", v11))
        {
          v40 = _HFLocalizedStringWithDefaultValue(@"HFTelevisionServiceDetailedErrorDescriptionSuspended", @"HFTelevisionServiceDetailedErrorDescriptionSuspended", 1);
          [v13 setObject:v40 forKeyedSubscript:@"persistentWarningDescription"];
        }
        v41 = [v13 objectForKeyedSubscript:@"description"];
        [v13 setObject:v41 forKeyedSubscript:@"controlDescription"];

        [v13 setObject:&unk_26C0F66A8 forKeyedSubscript:@"controlSummaryStyle"];
        goto LABEL_35;
      }
      if (objc_msgSend(v26, "count", v27))
      {
        if ((unint64_t)[v26 count] < 2) {
          goto LABEL_24;
        }
        if (v27)
        {
          state.opaque[0] = 0;
          state.opaque[1] = 0;
          v34 = [v27 loggerActivity];
          os_activity_scope_enter(v34, &state);

          v29 = HFLogForCategory(0x2AuLL);
          if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            goto LABEL_23;
          }
          *(_WORD *)buf = 0;
          v30 = "HFTelevision should have only one input source but currently has more than one";
LABEL_21:
          v31 = v29;
          os_log_type_t v32 = OS_LOG_TYPE_ERROR;
          uint32_t v33 = 2;
          goto LABEL_22;
        }
        v46 = HFLogForCategory(0x2AuLL);
        if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
          goto LABEL_46;
        }
        LOWORD(state.opaque[0]) = 0;
        v47 = "HFTelevision should have only one input source but currently has more than one";
      }
      else
      {
        if (v27)
        {
          state.opaque[0] = 0;
          state.opaque[1] = 0;
          v35 = [v27 loggerActivity];
          os_activity_scope_enter(v35, &state);

          v29 = HFLogForCategory(0x2AuLL);
          if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            goto LABEL_23;
          }
          *(_WORD *)buf = 0;
          v30 = "HFTelevision should have an input source but currently has none";
          goto LABEL_21;
        }
        v46 = HFLogForCategory(0x2AuLL);
        if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
          goto LABEL_46;
        }
        LOWORD(state.opaque[0]) = 0;
        v47 = "HFTelevision should have an input source but currently has none";
      }
      v48 = v46;
      os_log_type_t v49 = OS_LOG_TYPE_ERROR;
      uint32_t v50 = 2;
      goto LABEL_45;
    }
  }
  if ([v15 category] != 1) {
    goto LABEL_35;
  }
  v17 = [*(id *)(a1 + 32) service];
  if ([v17 hasSleepDiscoveryMode])
  {
    v18 = [*(id *)(a1 + 32) service];
    uint64_t v19 = [v18 lastKnownSleepDiscoveryMode];

    if (v19) {
      goto LABEL_35;
    }
    v17 = _HFLocalizedStringWithDefaultValue(@"HFServiceDescriptionNoResponse", @"HFServiceDescriptionNoResponse", 1);
    v20 = _HFLocalizedStringWithDefaultValue(@"HFServiceLongFormErrorNotReachableEcoMode", @"HFServiceLongFormErrorNotReachableEcoMode", 1);
    [v13 setObject:v17 forKeyedSubscript:@"description"];
    [v13 setObject:v20 forKeyedSubscript:@"longErrorDescription"];
  }
LABEL_35:
  [*(id *)(a1 + 32) applyInflectionToDescriptions:v13];
  v42 = (void *)MEMORY[0x263F58190];
  v43 = +[HFItemUpdateOutcome outcomeWithResults:v13];
  v44 = [v42 futureWithResult:v43];

  return v44;
}

uint64_t __55__HFTelevisionServiceItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  if (!*(void *)(a1 + 32)) {
    return 0;
  }
  id v3 = [a2 mediaSourceIdentifier];
  uint64_t v4 = [v3 isEqualToNumber:*(void *)(a1 + 32)];

  return v4;
}

@end