@interface WFGetDeviceDetailsAction
- (BOOL)setParameterState:(id)a3 forKey:(id)a4;
- (id)iconSymbolName;
- (id)localizedDefaultOutputNameWithContext:(id)a3;
- (id)outputContentClasses;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFGetDeviceDetailsAction

- (id)outputContentClasses
{
  v15[1] = *MEMORY[0x263EF8340];
  v3 = [(WFGetDeviceDetailsAction *)self parameterStateForKey:@"WFDeviceDetail"];
  v4 = [v3 value];
  v5 = v4;
  if (v4)
  {
    if (([v4 isEqualToString:@"Device Model"] & 1) != 0
      || ([v5 isEqualToString:@"Device Name"] & 1) != 0
      || [v5 isEqualToString:@"System Version"])
    {
      v15[0] = objc_opt_class();
      v6 = (void *)MEMORY[0x263EFF8C0];
      v7 = v15;
    }
    else if ([v5 isEqualToString:@"Device Is Watch"])
    {
      uint64_t v14 = objc_opt_class();
      v6 = (void *)MEMORY[0x263EFF8C0];
      v7 = &v14;
    }
    else if ([v5 isEqualToString:@"Current Appearance"])
    {
      uint64_t v13 = objc_opt_class();
      v6 = (void *)MEMORY[0x263EFF8C0];
      v7 = &v13;
    }
    else
    {
      uint64_t v12 = objc_opt_class();
      v6 = (void *)MEMORY[0x263EFF8C0];
      v7 = &v12;
    }
    uint64_t v8 = [v6 arrayWithObjects:v7 count:1];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)WFGetDeviceDetailsAction;
    uint64_t v8 = [(WFGetDeviceDetailsAction *)&v11 outputContentClasses];
  }
  v9 = (void *)v8;

  return v9;
}

- (id)localizedDefaultOutputNameWithContext:(id)a3
{
  id v4 = a3;
  v5 = [(WFGetDeviceDetailsAction *)self parameterStateForKey:@"WFDeviceDetail"];
  v6 = [(WFGetDeviceDetailsAction *)self parameterForKey:@"WFDeviceDetail"];
  v7 = [v6 localizedLabelForPossibleState:v5];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)WFGetDeviceDetailsAction;
    id v9 = [(WFGetDeviceDetailsAction *)&v12 localizedDefaultOutputNameWithContext:v4];
  }
  v10 = v9;

  return v10;
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)WFGetDeviceDetailsAction;
  BOOL v7 = [(WFGetDeviceDetailsAction *)&v9 setParameterState:a3 forKey:v6];
  if (v7 && [v6 isEqualToString:@"WFDeviceDetail"])
  {
    [(WFGetDeviceDetailsAction *)self nameUpdated];
    [(WFGetDeviceDetailsAction *)self outputDetailsUpdated];
  }

  return v7;
}

- (id)iconSymbolName
{
  v2 = [MEMORY[0x263F85258] currentDevice];
  v3 = [v2 symbolName];

  return v3;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = [(WFGetDeviceDetailsAction *)self parameterValueForKey:@"WFDeviceDetail" ofClass:objc_opt_class()];
  if ([v4 isEqualToString:@"Device Model"])
  {
    v5 = [MEMORY[0x263F85258] currentDevice];
    uint64_t v6 = [v5 localizedModel];
LABEL_12:
    objc_super v11 = (void *)v6;

    if (v11)
    {
      objc_super v12 = [(WFGetDeviceDetailsAction *)self output];
      uint64_t v13 = (void *)MEMORY[0x263F337C8];
      uint64_t v14 = (void *)MEMORY[0x263F337A0];
      v15 = [(WFGetDeviceDetailsAction *)self appDescriptor];
      v16 = [v14 attributionSetWithAppDescriptor:v15 disclosureLevel:1];
      v17 = [v13 itemWithObject:v11 attributionSet:v16];
      [v12 addItem:v17];
    }
    id v18 = 0;
    goto LABEL_15;
  }
  if ([v4 isEqualToString:@"Device Name"])
  {
    v5 = [MEMORY[0x263F85258] currentDevice];
    uint64_t v6 = [v5 name];
    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"Device Hostname"])
  {
    v5 = [MEMORY[0x263F85258] currentDevice];
    uint64_t v6 = [v5 hostname];
    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"Screen Width"])
  {
    BOOL v7 = NSNumber;
    v5 = [MEMORY[0x263F85258] currentDevice];
    [v5 screenBounds];
    double v9 = v8;
LABEL_11:
    uint64_t v6 = [v7 numberWithDouble:v9];
    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"Screen Height"])
  {
    BOOL v7 = NSNumber;
    v5 = [MEMORY[0x263F85258] currentDevice];
    [v5 screenBounds];
    double v9 = v10;
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"Device Is Watch"])
  {
    v19 = NSNumber;
    v5 = [MEMORY[0x263F85258] currentDevice];
    uint64_t v6 = objc_msgSend(v19, "numberWithBool:", objc_msgSend(v5, "idiom") == 3);
    goto LABEL_12;
  }
  if (![v4 isEqualToString:@"Current Volume"])
  {
    if ([v4 isEqualToString:@"Current Appearance"])
    {
      v24 = [MEMORY[0x263F85258] currentDevice];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __55__WFGetDeviceDetailsAction_runAsynchronouslyWithInput___block_invoke;
      v26[3] = &unk_264E5B780;
      v26[4] = self;
      [v24 getAppearanceWithCompletion:v26];
    }
    else
    {
      if (![v4 isEqualToString:@"Current Brightness"])
      {
        if ([v4 isEqualToString:@"System Version"])
        {
          v5 = [MEMORY[0x263F85258] currentDevice];
          uint64_t v6 = [v5 systemVersion];
        }
        else
        {
          if (![v4 isEqualToString:@"System Build Number"])
          {
            [(WFGetDeviceDetailsAction *)self finishRunningWithError:0];
            goto LABEL_17;
          }
          v5 = [MEMORY[0x263F85258] currentDevice];
          uint64_t v6 = [v5 systemBuildNumber];
        }
        goto LABEL_12;
      }
      v24 = [MEMORY[0x263F85258] currentDevice];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __55__WFGetDeviceDetailsAction_runAsynchronouslyWithInput___block_invoke_2;
      v25[3] = &unk_264E5B7A8;
      v25[4] = self;
      [v24 getBrightnessWithCompletion:v25];
    }

    goto LABEL_17;
  }
  v20 = [MEMORY[0x263F85258] currentDevice];
  id v27 = 0;
  v21 = [v20 volumeWithError:&v27];
  id v18 = v27;

  if (!v21)
  {
    [(WFGetDeviceDetailsAction *)self finishRunningWithError:v18];
    goto LABEL_16;
  }
  v22 = [(WFGetDeviceDetailsAction *)self output];
  v23 = [MEMORY[0x263F33900] itemWithNumber:v21 maximumFractionDigitsForDisplay:&unk_26F076458];
  [v22 addItem:v23];

  [(WFGetDeviceDetailsAction *)self finishRunningWithError:0];
  objc_super v11 = 0;
LABEL_15:
  [(WFGetDeviceDetailsAction *)self finishRunningWithError:v18];

LABEL_16:
LABEL_17:
}

void __55__WFGetDeviceDetailsAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  id v14 = v5;
  if (v5)
  {
    BOOL v7 = [v6 output];
    double v8 = (void *)MEMORY[0x263F337C8];
    double v9 = (void *)MEMORY[0x263F33708];
    double v10 = [*(id *)(a1 + 32) appDescriptor];
    objc_super v11 = [v9 locationWithAppDescriptor:v10];
    objc_super v12 = [v8 itemWithObject:v14 origin:v11 disclosureLevel:0];
    [v7 addItem:v12];

    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = a3;
  }
  [v6 finishRunningWithError:v13];
}

void __55__WFGetDeviceDetailsAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v8 = [MEMORY[0x263F33900] itemWithNumber:a2 maximumFractionDigitsForDisplay:&unk_26F076470];
    v3 = (void *)MEMORY[0x263F337A0];
    id v4 = [*(id *)(a1 + 32) appDescriptor];
    id v5 = [v3 attributionSetWithAppDescriptor:v4 disclosureLevel:1];
    [v8 setAttributionSet:v5];

    uint64_t v6 = [*(id *)(a1 + 32) output];
    [v6 addItem:v8];

    [*(id *)(a1 + 32) finishRunningWithError:0];
  }
  else
  {
    BOOL v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "finishRunningWithError:");
  }
}

@end