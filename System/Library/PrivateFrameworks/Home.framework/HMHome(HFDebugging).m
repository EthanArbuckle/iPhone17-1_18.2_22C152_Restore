@interface HMHome(HFDebugging)
+ (uint64_t)hf_prefersAutoSynthesizedDescription;
- (id)hf_stateDumpBuilderWithContext:()HFDebugging;
@end

@implementation HMHome(HFDebugging)

+ (uint64_t)hf_prefersAutoSynthesizedDescription
{
  return 1;
}

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  id v4 = a3;
  v5 = +[HFStateDumpBuilder builderWithObject:a1 context:v4];
  v6 = [a1 uniqueIdentifier];
  [v5 appendObject:v6 withName:@"UUID" options:2];

  v7 = [a1 name];
  [v5 setObject:v7 forKeyedSubscript:@"name"];

  v8 = +[HFHomeKitDispatcher sharedDispatcher];
  v9 = [v8 home];
  [v5 appendBool:v9 == a1 withName:@"selected" ifEqualTo:1];

  if ([v4 detailLevel] == 2)
  {
    objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "isPrimary"), @"primary", 1);
    objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "hf_isCurrentLocationHome"), @"currentLocation", 1);
    objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "hf_shouldBlockCurrentUserFromHome"), @"userBlockedFromHome", 1);
    v10 = [a1 accessories];
    [v5 setObject:v10 forKeyedSubscript:@"accessories"];

    v11 = (void *)[v4 copy];
    v12 = [MEMORY[0x263EFF9A0] dictionaryWithObject:a1 forKey:@"HOME"];
    [v11 setUserInfo:v12];
    v13 = self;
    v14 = objc_msgSend(v13, "hf_allUsersIncludingCurrentUser");
    [v5 appendObject:v14 withName:@"users" context:v11];

    v15 = [a1 residentDevices];
    [v5 setObject:v15 forKeyedSubscript:@"residentDevices"];

    v16 = [a1 outgoingInvitations];
    [v5 setObject:v16 forKeyedSubscript:@"outgoingInvitations"];

    v17 = [a1 serviceGroups];
    [v5 setObject:v17 forKeyedSubscript:@"serviceGroups"];

    v18 = [a1 actionSets];
    [v5 setObject:v18 forKeyedSubscript:@"actionSets"];

    v19 = [a1 triggers];
    [v5 setObject:v19 forKeyedSubscript:@"triggers"];

    v20 = [a1 mediaSystems];
    [v5 setObject:v20 forKeyedSubscript:@"mediaSystems"];

    v21 = objc_msgSend(a1, "hf_allRooms");
    v22 = (void *)[v4 copyWithDetailLevel:0];
    [v5 appendObject:v21 withName:@"rooms" context:v22];

    v23 = objc_msgSend(a1, "hf_personalRequestAccessories");
    v24 = objc_msgSend(v23, "na_map:", &__block_literal_global_150_0);

    v25 = (void *)[v4 copyWithDetailLevel:0];
    [v5 appendObject:v24 withName:@"personalRequestsAccessories" context:v25];

    v26 = objc_msgSend(a1, "hf_tvViewingProfilesAccessories");
    v27 = objc_msgSend(v26, "na_map:", &__block_literal_global_158_0);

    v28 = (void *)[v4 copyWithDetailLevel:0];
    [v5 appendObject:v27 withName:@"tvViewingProfilesAccessories" context:v28];

    objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "isMultiUserEnabled"), @"isMultiUserEnabled", 0);
    objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "hf_homeHasMigratedIntoHomeApp"), @"hasMigratedIntoHomeApp", 0);
    objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "hf_homeHasMigratedServicesToAccessories"), @"hasMigratedServiceNames", 0);
    objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "areBulletinNotificationsSupported"), @"bulletinNotificationSupport", 0);
    objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "isEventLogEnabled"), @"eventLogEnabled", 1);
  }
  return v5;
}

@end