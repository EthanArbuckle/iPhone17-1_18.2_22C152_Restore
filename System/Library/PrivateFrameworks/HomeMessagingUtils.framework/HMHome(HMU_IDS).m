@interface HMHome(HMU_IDS)
- (id)hmu_accessoryWithDestination:()HMU_IDS service:;
- (id)hmu_accessoryWithFromID:()HMU_IDS service:;
- (id)hmu_userWithDestination:()HMU_IDS;
- (id)hmu_userWithFromID:()HMU_IDS;
@end

@implementation HMHome(HMU_IDS)

- (id)hmu_accessoryWithFromID:()HMU_IDS service:
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 accessories];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __51__HMHome_HMU_IDS__hmu_accessoryWithFromID_service___block_invoke;
  v13[3] = &unk_264545420;
  id v14 = v7;
  id v15 = v6;
  id v9 = v6;
  id v10 = v7;
  v11 = objc_msgSend(v8, "na_firstObjectPassingTest:", v13);

  return v11;
}

- (id)hmu_userWithFromID:()HMU_IDS
{
  v2 = (void *)IDSCopyAddressDestinationForDestination();
  v3 = objc_msgSend(a1, "hmu_allUsersIncludingCurrentUser");
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__HMHome_HMU_IDS__hmu_userWithFromID___block_invoke;
  v7[3] = &unk_264545340;
  id v8 = v2;
  id v4 = v2;
  v5 = objc_msgSend(v3, "na_firstObjectPassingTest:", v7);

  return v5;
}

- (id)hmu_userWithDestination:()HMU_IDS
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "hmu_allUsersIncludingCurrentUser");
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __43__HMHome_HMU_IDS__hmu_userWithDestination___block_invoke;
  v9[3] = &unk_264545340;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

- (id)hmu_accessoryWithDestination:()HMU_IDS service:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 accessories];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __56__HMHome_HMU_IDS__hmu_accessoryWithDestination_service___block_invoke;
  v13[3] = &unk_264545420;
  id v14 = v7;
  id v15 = v6;
  id v9 = v6;
  id v10 = v7;
  v11 = objc_msgSend(v8, "na_firstObjectPassingTest:", v13);

  return v11;
}

@end