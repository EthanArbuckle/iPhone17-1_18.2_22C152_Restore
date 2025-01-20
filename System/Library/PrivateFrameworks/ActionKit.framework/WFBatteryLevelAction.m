@interface WFBatteryLevelAction
- (id)outputContentClasses;
- (void)runWithInput:(id)a3 error:(id *)a4;
@end

@implementation WFBatteryLevelAction

- (id)outputContentClasses
{
  v12[1] = *MEMORY[0x263EF8340];
  v3 = [(WFBatteryLevelAction *)self parameterStateForKey:@"Subject"];
  v4 = [v3 value];
  if (([v4 isEqualToString:@"Is Charging"] & 1) != 0
    || [v4 isEqualToString:@"Is Connected to Charger"])
  {
    v12[0] = objc_opt_class();
    v5 = (void *)MEMORY[0x263EFF8C0];
    v6 = v12;
LABEL_4:
    uint64_t v7 = [v5 arrayWithObjects:v6 count:1];
    goto LABEL_5;
  }
  if ([v4 isEqualToString:@"Battery Level"])
  {
    uint64_t v11 = objc_opt_class();
    v5 = (void *)MEMORY[0x263EFF8C0];
    v6 = &v11;
    goto LABEL_4;
  }
  v10.receiver = self;
  v10.super_class = (Class)WFBatteryLevelAction;
  uint64_t v7 = [(WFBatteryLevelAction *)&v10 outputContentClasses];
LABEL_5:
  v8 = (void *)v7;

  return v8;
}

- (void)runWithInput:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v6 = [(WFBatteryLevelAction *)self parameterValueForKey:@"Subject" ofClass:objc_opt_class()];
  if (![(__CFString *)v6 length])
  {

    v6 = @"Battery Level";
  }
  uint64_t v7 = [(objc_class *)getUIDeviceClass() currentDevice];
  [v7 setBatteryMonitoringEnabled:1];
  if (![(__CFString *)v6 isEqualToString:@"Battery Level"])
  {
    if ([(__CFString *)v6 isEqualToString:@"Is Charging"])
    {
      v12 = [(WFBatteryLevelAction *)self output];
      v15 = NSNumber;
      BOOL v16 = [v7 batteryState] == 2;
    }
    else
    {
      if (![(__CFString *)v6 isEqualToString:@"Is Connected to Charger"])
      {
LABEL_20:
        [v7 setBatteryMonitoringEnabled:0];
        goto LABEL_21;
      }
      v12 = [(WFBatteryLevelAction *)self output];
      v15 = NSNumber;
      if ([v7 batteryState] == 2)
      {
        uint64_t v17 = 1;
LABEL_18:
        v13 = [v15 numberWithBool:v17];
        [v12 addObject:v13];
        goto LABEL_19;
      }
      BOOL v16 = [v7 batteryState] == 3;
    }
    uint64_t v17 = v16;
    goto LABEL_18;
  }
  v8 = NSNumber;
  [v7 batteryLevel];
  *(float *)&double v10 = v9 * 100.0;
  uint64_t v11 = [v8 numberWithFloat:v10];
  if (v11)
  {
    v12 = (void *)v11;
    v13 = [(WFBatteryLevelAction *)self output];
    v14 = [MEMORY[0x263F33900] itemWithNumber:v12 maximumFractionDigitsForDisplay:&unk_26F0764B8];
    [v13 addItem:v14];

LABEL_19:
    goto LABEL_20;
  }
  v18 = getWFActionsLogObject();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    int v19 = 136315138;
    v20 = "-[WFBatteryLevelAction runWithInput:error:]";
    _os_log_impl(&dword_23C364000, v18, OS_LOG_TYPE_ERROR, "%s Failed to get battery level.", (uint8_t *)&v19, 0xCu);
  }

  *a4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F870B8] code:16 userInfo:0];
LABEL_21:
}

@end