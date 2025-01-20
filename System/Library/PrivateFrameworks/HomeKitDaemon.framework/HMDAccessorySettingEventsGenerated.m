@interface HMDAccessorySettingEventsGenerated
+ (id)allKeyPaths;
+ (id)keyPathMap;
+ (id)topicsForAccessoryUUID:(id)a3 homeUUID:(id)a4;
@end

@implementation HMDAccessorySettingEventsGenerated

+ (id)topicsForAccessoryUUID:(id)a3 homeUUID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __70__HMDAccessorySettingEventsGenerated_topicsForAccessoryUUID_homeUUID___block_invoke;
  v11[3] = &unk_264A26598;
  id v12 = v6;
  id v13 = v5;
  id v7 = v5;
  id v8 = v6;
  v9 = objc_msgSend(&unk_26E473DC8, "na_map:", v11);

  return v9;
}

void __70__HMDAccessorySettingEventsGenerated_topicsForAccessoryUUID_homeUUID___block_invoke()
{
}

+ (id)allKeyPaths
{
  return &unk_26E473DB0;
}

+ (id)keyPathMap
{
  return &unk_26E474C38;
}

@end