@interface WFBSSIDDisclosureWarning
- (id)localizedMessage;
@end

@implementation WFBSSIDDisclosureWarning

- (id)localizedMessage
{
  v2 = [MEMORY[0x263F85258] currentDevice];
  int v3 = [v2 hasCapability:*MEMORY[0x263F85698]];

  if (v3) {
    v4 = @"This shortcut is attempting to use your WLAN network address. This may be used to infer your device location.";
  }
  else {
    v4 = @"This shortcut is attempting to use your Wi-Fi network address. This may be used to infer your device location.";
  }
  v5 = WFLocalizedString(v4);
  return v5;
}

@end