@interface RPCompanionLinkClient(HMU_HomeKit)
- (id)hmu_devicesForUser:()HMU_HomeKit;
- (id)hmu_devicesInHome:()HMU_HomeKit;
@end

@implementation RPCompanionLinkClient(HMU_HomeKit)

- (id)hmu_devicesInHome:()HMU_HomeKit
{
  id v4 = a3;
  v5 = [a1 activeDevices];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__RPCompanionLinkClient_HMU_HomeKit__hmu_devicesInHome___block_invoke;
  v9[3] = &unk_2645453B0;
  id v10 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "na_filter:", v9);

  return v7;
}

- (id)hmu_devicesForUser:()HMU_HomeKit
{
  id v4 = a3;
  v5 = [a1 activeDevices];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__RPCompanionLinkClient_HMU_HomeKit__hmu_devicesForUser___block_invoke;
  v9[3] = &unk_2645453B0;
  id v10 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "na_filter:", v9);

  return v7;
}

@end