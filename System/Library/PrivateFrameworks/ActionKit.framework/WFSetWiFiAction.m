@interface WFSetWiFiAction
- (id)appResource;
- (id)localizedAttributionWithContext:(id)a3;
- (id)localizedDescriptionSummaryWithContext:(id)a3;
- (id)localizedNameWithContext:(id)a3;
- (id)parameterSummary;
@end

@implementation WFSetWiFiAction

- (id)parameterSummary
{
  v17[2] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F85258] currentDevice];
  int v3 = [v2 hasCapability:*MEMORY[0x263F85698]];

  id v4 = objc_alloc(MEMORY[0x263F86888]);
  id v5 = objc_alloc(MEMORY[0x263F86890]);
  if (v3)
  {
    v6 = WFLocalizedStringResourceWithKey(@"${operation} WLAN ${OnValue}", @"${operation} WLAN ${OnValue}");
    v7 = (void *)[v5 initWithKey:@"OnValue,operation" summaryString:v6];
    v17[0] = v7;
    id v8 = objc_alloc(MEMORY[0x263F86890]);
    v9 = WFLocalizedStringResourceWithKey(@"${operation} WLAN", @"${operation} WLAN");
    v10 = (void *)[v8 initWithKey:@"operation" summaryString:v9];
    v17[1] = v10;
    v11 = v17;
  }
  else
  {
    v6 = WFLocalizedStringResourceWithKey(@"${operation} Wi-Fi ${OnValue}", @"${operation} Wi-Fi ${OnValue}");
    v7 = (void *)[v5 initWithKey:@"OnValue,operation" summaryString:v6];
    v16[0] = v7;
    id v12 = objc_alloc(MEMORY[0x263F86890]);
    v9 = WFLocalizedStringResourceWithKey(@"${operation} Wi-Fi", @"${operation} Wi-Fi");
    v10 = (void *)[v12 initWithKey:@"operation" summaryString:v9];
    v16[1] = v10;
    v11 = v16;
  }
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
  v14 = (void *)[v4 initWithValues:v13];

  return v14;
}

- (id)localizedAttributionWithContext:(id)a3
{
  int v3 = (void *)MEMORY[0x263F85258];
  id v4 = a3;
  id v5 = [v3 currentDevice];
  int v6 = [v5 hasCapability:*MEMORY[0x263F85698]];

  if (v6)
  {
    v7 = @"WLAN";
    id v8 = @"WLAN";
  }
  else
  {
    v7 = @"Wi-Fi (Action)";
    id v8 = @"Wi-Fi";
  }
  v9 = WFLocalizedStringResourceWithKey(v7, v8);
  v10 = [v4 localize:v9];

  return v10;
}

- (id)localizedDescriptionSummaryWithContext:(id)a3
{
  int v3 = (void *)MEMORY[0x263F85258];
  id v4 = a3;
  id v5 = [v3 currentDevice];
  int v6 = [v5 hasCapability:*MEMORY[0x263F85698]];

  if (v6) {
    v7 = @"Sets the device’s WLAN to on or off.";
  }
  else {
    v7 = @"Sets the device’s Wi-Fi to on or off.";
  }
  id v8 = WFLocalizedStringResourceWithKey(v7, v7);
  v9 = [v4 localize:v8];

  return v9;
}

- (id)localizedNameWithContext:(id)a3
{
  int v3 = (void *)MEMORY[0x263F85258];
  id v4 = a3;
  id v5 = [v3 currentDevice];
  int v6 = [v5 hasCapability:*MEMORY[0x263F85698]];

  if (v6) {
    v7 = @"Set WLAN";
  }
  else {
    v7 = @"Set Wi-Fi";
  }
  id v8 = WFLocalizedStringResourceWithKey(v7, v7);
  v9 = [v4 localize:v8];

  return v9;
}

- (id)appResource
{
  return 0;
}

@end