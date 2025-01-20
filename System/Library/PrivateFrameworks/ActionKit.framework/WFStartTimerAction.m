@interface WFStartTimerAction
- (id)parameterOverrides;
- (id)serializedParametersForDonatedIntent:(id)a3 allowDroppingUnconfigurableValues:(BOOL)a4;
- (id)sessionKitSessionConfiguration;
- (id)sessionKitSessionInvocationType;
- (void)getValueForParameterData:(id)a3 ofProcessedParameters:(id)a4 completionHandler:(id)a5;
@end

@implementation WFStartTimerAction

- (id)sessionKitSessionInvocationType
{
  v2 = [MEMORY[0x263F85258] currentDevice];
  if ([v2 hasSystemAperture]) {
    id v3 = (id)*MEMORY[0x263F87150];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)sessionKitSessionConfiguration
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F85258] currentDevice];
  if ([v2 hasSystemAperture])
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x263F868A0]) initWithBundleIdentifier:@"com.apple.mobiletimerd" toastDurationPerRunSource:0];
  }
  else
  {
    v4 = getWFSessionKitLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      v7 = "-[WFStartTimerAction sessionKitSessionConfiguration]";
      _os_log_impl(&dword_23C364000, v4, OS_LOG_TYPE_DEFAULT, "%s Opting Start Timer out of session assertions because we're on a non-Dynamic Island device and they don't yet support banner presentations...", (uint8_t *)&v6, 0xCu);
    }

    id v3 = 0;
  }

  return v3;
}

- (void)getValueForParameterData:(id)a3 ofProcessedParameters:(id)a4 completionHandler:(id)a5
{
  v45[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  v9 = (void (**)(id, void, void *))a5;
  id v10 = a3;
  v11 = [v10 name];
  int v12 = [v11 isEqualToString:@"duration"];

  if (v12)
  {
    v13 = [v10 name];

    v14 = [v8 objectForKey:v13];

    if (v14)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v15 = v14;
      }
      else {
        v15 = 0;
      }
    }
    else
    {
      v15 = 0;
    }
    id v10 = v15;

    v16 = [v10 magnitude];
    [v16 doubleValue];
    double v18 = v17;

    if (v18 <= 0.0)
    {
      v34 = (void *)MEMORY[0x263F087E8];
      uint64_t v35 = *MEMORY[0x263F87540];
      uint64_t v44 = *MEMORY[0x263F08320];
      v22 = WFLocalizedString(@"Please provide a duration for the timer.");
      v45[0] = v22;
      v25 = [NSDictionary dictionaryWithObjects:v45 forKeys:&v44 count:1];
      v30 = [v34 errorWithDomain:v35 code:5 userInfo:v25];
      v9[2](v9, 0, v30);
    }
    else
    {
      v19 = (void *)MEMORY[0x263F86AD8];
      v20 = [v10 unitString];
      uint64_t v21 = [v19 calendarUnitFromUnitString:v20];

      v22 = [MEMORY[0x263EFF910] date];
      v23 = [MEMORY[0x263EFF8F0] currentCalendar];
      v24 = [v10 magnitude];
      v25 = objc_msgSend(v23, "dateByAddingUnit:value:toDate:options:", v21, objc_msgSend(v24, "integerValue"), v22, 0);

      [v25 timeIntervalSinceDate:v22];
      double v27 = v26;
      if (v26 >= 86400.0)
      {
        v36 = (void *)MEMORY[0x263F087E8];
        uint64_t v37 = *MEMORY[0x263F87540];
        uint64_t v42 = *MEMORY[0x263F08320];
        v38 = WFLocalizedString(@"The timer's duration must be less than 24 hours.");
        v43 = v38;
        v39 = [NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
        v40 = [v36 errorWithDomain:v37 code:5 userInfo:v39];
        v9[2](v9, 0, v40);

        goto LABEL_14;
      }
      id v28 = objc_alloc(MEMORY[0x263F08980]);
      v29 = [MEMORY[0x263F08C98] seconds];
      v30 = (void *)[v28 initWithDoubleValue:v29 unit:v27];

      id v31 = objc_alloc(MEMORY[0x263F521A8]);
      v32 = [MEMORY[0x263F520A0] durationValueType];
      v33 = (void *)[v31 initWithValue:v30 valueType:v32];
      ((void (**)(id, void *, void *))v9)[2](v9, v33, 0);
    }
LABEL_14:

    goto LABEL_15;
  }
  v41.receiver = self;
  v41.super_class = (Class)WFStartTimerAction;
  [(WFAppIntentExecutionAction *)&v41 getValueForParameterData:v10 ofProcessedParameters:v8 completionHandler:v9];
LABEL_15:
}

- (id)serializedParametersForDonatedIntent:(id)a3 allowDroppingUnconfigurableValues:(BOOL)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = 0;
    goto LABEL_8;
  }
  id v6 = v5;
  uint64_t v7 = [v6 type];
  id v8 = [v6 label];
  if (v8)
  {
  }
  else if ((v7 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    v11 = [(WFStartTimerAction *)self parameterForKey:@"duration"];
    [v6 duration];
    int v12 = objc_msgSend(v11, "stateForDuration:");
    v14 = @"WFDuration";
    v13 = [v12 serializedRepresentation];
    v15[0] = v13;
    v9 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];

    goto LABEL_7;
  }
  v9 = 0;
LABEL_7:

LABEL_8:
  return v9;
}

- (id)parameterOverrides
{
  v18[6] = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)WFStartTimerAction;
  v2 = [(WFOverridableLinkAction *)&v15 parameterOverrides];
  id v3 = (void *)[v2 mutableCopy];

  v17[0] = *MEMORY[0x263F872D8];
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = *MEMORY[0x263F85950];
  v18[0] = v5;
  v18[1] = v6;
  uint64_t v7 = *MEMORY[0x263F87388];
  v17[1] = *MEMORY[0x263F873D8];
  v17[2] = v7;
  uint64_t v8 = *MEMORY[0x263F871B8];
  v16[0] = *MEMORY[0x263F871C0];
  v16[1] = v8;
  v16[2] = *MEMORY[0x263F871B0];
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];
  uint64_t v10 = *MEMORY[0x263F87348];
  v18[2] = v9;
  v18[3] = @"WFDuration";
  uint64_t v11 = *MEMORY[0x263F87398];
  v17[3] = v10;
  v17[4] = v11;
  int v12 = WFLocalizedStringResourceWithKey(@"For how long?", @"For how long?");
  v17[5] = *MEMORY[0x263F87380];
  v18[4] = v12;
  v18[5] = &unk_26F074B50;
  v13 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:6];
  WFAddEntriesToDictionary();

  return v3;
}

@end