@interface NSArray(HMDPrimaryElectionCoordinationAddOn)
- (id)hmd_residentDeviceForMeshNode:()HMDPrimaryElectionCoordinationAddOn;
@end

@implementation NSArray(HMDPrimaryElectionCoordinationAddOn)

- (id)hmd_residentDeviceForMeshNode:()HMDPrimaryElectionCoordinationAddOn
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __78__NSArray_HMDPrimaryElectionCoordinationAddOn__hmd_residentDeviceForMeshNode___block_invoke;
  v8[3] = &unk_264A2A830;
  id v9 = v4;
  id v5 = v4;
  v6 = objc_msgSend(a1, "na_firstObjectPassingTest:", v8);

  return v6;
}

@end