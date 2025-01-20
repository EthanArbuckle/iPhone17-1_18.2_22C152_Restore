@interface HMHomeManager(HFDebugging)
- (id)hf_stateDumpBuilderWithContext:()HFDebugging;
@end

@implementation HMHomeManager(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  id v4 = a3;
  v5 = +[HFStateDumpBuilder builderWithObject:a1 context:v4];
  v6 = NSStringFromHMHomeManagerDataSyncState([a1 dataSyncState]);
  [v5 setObject:v6 forKeyedSubscript:@"dataSyncState"];

  objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "isThisDeviceResidentCapable"), @"residentCapable", 1);
  objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "isResidentEnabledForThisDevice"), @"residentEnabled", 1);
  if ([a1 residentProvisioningStatus])
  {
    v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "residentProvisioningStatus"));
    [v5 setObject:v7 forKeyedSubscript:@"residentProvisioningStatus"];
  }
  if ([v4 detailLevel] == 2)
  {
    [a1 options];
    v8 = HMHomeManagerOptionsToString();
    [v5 setObject:v8 forKeyedSubscript:@"options"];

    v9 = [a1 homes];
    [v5 setObject:v9 forKeyedSubscript:@"homes"];

    v10 = [a1 incomingHomeInvitations];
    [v5 appendObject:v10 withName:@"incomingInvitations" options:1];

    v11 = [a1 currentAccessory];
    [v5 appendObject:v11 withName:@"currentAccessory" options:1];

    objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "hf_hasSeenOnboardingWelcomeView"), @"hasOnboarded", 0);
  }

  return v5;
}

@end