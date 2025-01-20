@interface CNMCProfileConnection
- (BOOL)communicationServiceRulesExistForBundleID:(id)a3 forCommunicationServiceType:(id)a4;
- (id)defaultAppBundleIDForCommunicationServiceType:(id)a3 forAccountWithIdentifier:(id)a4;
- (id)observableForManagedConfigChanged;
@end

@implementation CNMCProfileConnection

- (id)defaultAppBundleIDForCommunicationServiceType:(id)a3 forAccountWithIdentifier:(id)a4
{
  v5 = (Class (__cdecl *)())getMCProfileConnectionClass;
  id v6 = a4;
  id v7 = a3;
  v8 = [(objc_class *)v5() sharedConnection];
  v9 = [v8 defaultAppBundleIDForCommunicationServiceType:v7 forAccountWithIdentifier:v6];

  return v9;
}

- (BOOL)communicationServiceRulesExistForBundleID:(id)a3 forCommunicationServiceType:(id)a4
{
  v5 = (Class (__cdecl *)())getMCProfileConnectionClass;
  id v6 = a4;
  id v7 = a3;
  v8 = [(objc_class *)v5() sharedConnection];
  char v9 = [v8 communicationServiceRulesExistForBundleID:v7 forCommunicationServiceType:v6];

  return v9;
}

- (id)observableForManagedConfigChanged
{
  v2 = (void *)MEMORY[0x263F33608];
  v3 = getMCProfileListChangedNotification();
  v4 = [v2 observableOnDarwinNotificationCenterWithName:v3];

  return v4;
}

@end