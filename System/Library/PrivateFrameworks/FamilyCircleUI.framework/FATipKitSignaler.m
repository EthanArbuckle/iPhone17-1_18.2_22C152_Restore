@interface FATipKitSignaler
+ (void)_sendSignalForEventIdentifier:(id)a3 context:(id)a4;
+ (void)sendSignalForFamilyChecklistTapped;
@end

@implementation FATipKitSignaler

+ (void)sendSignalForFamilyChecklistTapped
{
}

+ (void)_sendSignalForEventIdentifier:(id)a3 context:(id)a4
{
  v5 = (objc_class *)MEMORY[0x263F2A780];
  id v6 = a4;
  id v7 = a3;
  id v10 = (id)[[v5 alloc] initWithIdentifier:v7 bundleID:@"com.apple.Preferences" context:v6 userInfo:0];

  v8 = [MEMORY[0x263F2A9B8] discoverabilitySignal];
  v9 = [v8 source];
  [v9 sendEvent:v10];
}

@end