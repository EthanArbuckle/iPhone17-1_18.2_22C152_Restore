@interface HMHomeManager(HMUAdditions)
- (id)hmu_homeWithName:()HMUAdditions;
- (id)hmu_homeWithUniqueIdentifier:()HMUAdditions;
- (id)hmu_homesContainingRoomsWithNames:()HMUAdditions;
- (id)hmu_homesContainingZonesWithNames:()HMUAdditions;
- (id)hmu_homesWithHomeLocationStatus:()HMUAdditions;
@end

@implementation HMHomeManager(HMUAdditions)

- (id)hmu_homeWithUniqueIdentifier:()HMUAdditions
{
  id v4 = a3;
  v5 = [a1 homes];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__HMHomeManager_HMUAdditions__hmu_homeWithUniqueIdentifier___block_invoke;
  v9[3] = &unk_2645452A8;
  id v10 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

- (id)hmu_homeWithName:()HMUAdditions
{
  id v4 = a3;
  v5 = [a1 homes];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__HMHomeManager_HMUAdditions__hmu_homeWithName___block_invoke;
  v9[3] = &unk_2645452A8;
  id v10 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

- (id)hmu_homesContainingRoomsWithNames:()HMUAdditions
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [a1 homes];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __65__HMHomeManager_HMUAdditions__hmu_homesContainingRoomsWithNames___block_invoke;
    v8[3] = &unk_2645452A8;
    id v9 = v4;
    id v6 = objc_msgSend(v5, "na_filter:", v8);
  }
  else
  {
    id v6 = (void *)MEMORY[0x263EFFA68];
  }

  return v6;
}

- (id)hmu_homesContainingZonesWithNames:()HMUAdditions
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [a1 homes];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __65__HMHomeManager_HMUAdditions__hmu_homesContainingZonesWithNames___block_invoke;
    v8[3] = &unk_2645452A8;
    id v9 = v4;
    id v6 = objc_msgSend(v5, "na_filter:", v8);
  }
  else
  {
    id v6 = (void *)MEMORY[0x263EFFA68];
  }

  return v6;
}

- (id)hmu_homesWithHomeLocationStatus:()HMUAdditions
{
  id v4 = [a1 homes];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__HMHomeManager_HMUAdditions__hmu_homesWithHomeLocationStatus___block_invoke;
  v7[3] = &__block_descriptor_40_e16_B16__0__HMHome_8l;
  v7[4] = a3;
  v5 = objc_msgSend(v4, "na_filter:", v7);

  return v5;
}

@end