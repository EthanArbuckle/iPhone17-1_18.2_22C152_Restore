@interface HMSetupAccessoryDescription(HFAdditions)
- (BOOL)hf_isLaunchedByHomeApp;
- (__CFString)hf_marketingName;
- (id)hf_home;
- (id)hf_installationGuideURL;
- (id)hf_localizedLaunchingAppName;
- (uint64_t)hf_isKeyedToASpecificAccessory;
- (uint64_t)hf_isLaunchedByHomeDaemon;
- (uint64_t)hf_isLogitechCircleViewDoorbell;
- (void)hf_updateWithDiscoveredAccessory:()HFAdditions;
@end

@implementation HMSetupAccessoryDescription(HFAdditions)

- (id)hf_home
{
  v2 = +[HFHomeKitDispatcher sharedDispatcher];
  v3 = [v2 homeManager];
  v4 = [v3 homes];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__HMSetupAccessoryDescription_HFAdditions__hf_home__block_invoke;
  v7[3] = &unk_26408FFE0;
  v7[4] = a1;
  v5 = objc_msgSend(v4, "na_firstObjectPassingTest:", v7);

  return v5;
}

- (uint64_t)hf_isLogitechCircleViewDoorbell
{
  v2 = [a1 category];
  v3 = [v2 categoryType];
  if ([v3 isEqualToString:*MEMORY[0x263F0B1B8]])
  {
    v4 = [a1 setupAccessoryPayload];
    v5 = [v4 productNumber];
    v6 = [v5 uppercaseString];
    uint64_t v7 = [v6 isEqualToString:@"9BFF8F87"];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (__CFString)hf_marketingName
{
  v2 = [a1 marketingName];
  if (objc_msgSend(a1, "hf_isLogitechCircleViewDoorbell"))
  {

    v2 = @"Logitech Circle View Doorbell";
  }
  return v2;
}

- (id)hf_installationGuideURL
{
  v2 = [a1 installationGuideURL];
  if (objc_msgSend(a1, "hf_isLogitechCircleViewDoorbell"))
  {
    BOOL v3 = HFForceInstallationGuideUseStagingURL();
    v4 = NSURL;
    if (v3)
    {
      uint64_t v5 = HFStoreInstallationGuideStagingURLString();
      uint64_t v6 = [v4 URLWithString:v5];

      v2 = (void *)v5;
    }
    else
    {
      uint64_t v6 = [NSURL URLWithString:@"http://logi.com/circleviewdoorbell/setup"];
    }

    v2 = (void *)v6;
  }
  return v2;
}

- (uint64_t)hf_isKeyedToASpecificAccessory
{
  return [a1 addAndSetupAccessories] ^ 1;
}

- (BOOL)hf_isLaunchedByHomeApp
{
  v1 = [a1 appIdentifier];
  v2 = __HFHomeApplicationBundleIdentifiers_block_invoke();
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__HMSetupAccessoryDescription_HFAdditions__hf_isLaunchedByHomeApp__block_invoke;
  v7[3] = &unk_26408D210;
  id v8 = v1;
  id v3 = v1;
  v4 = objc_msgSend(v2, "na_firstObjectPassingTest:", v7);
  BOOL v5 = v4 != 0;

  return v5;
}

- (uint64_t)hf_isLaunchedByHomeDaemon
{
  v1 = [a1 appIdentifier];
  uint64_t v2 = [v1 isEqualToString:@"com.apple.homed"];

  return v2;
}

- (id)hf_localizedLaunchingAppName
{
  v1 = (void *)MEMORY[0x263F01890];
  uint64_t v2 = [a1 appIdentifier];
  id v3 = [v1 bundleRecordWithApplicationIdentifier:v2 error:0];

  v4 = [v3 localizedShortName];
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v3 localizedName];
  }
  uint64_t v7 = v6;

  return v7;
}

- (void)hf_updateWithDiscoveredAccessory:()HFAdditions
{
  id v8 = a3;
  v4 = [v8 accessory];

  if (v4)
  {
    BOOL v5 = [v8 accessory];
    [a1 updateWithAccessory:v5];
  }
  id v6 = [v8 category];

  if (v6)
  {
    uint64_t v7 = [v8 category];
    [a1 updateAccessoryCategory:v7];
  }
}

@end