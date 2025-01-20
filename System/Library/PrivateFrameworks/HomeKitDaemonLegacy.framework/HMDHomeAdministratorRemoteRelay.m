@interface HMDHomeAdministratorRemoteRelay
@end

@implementation HMDHomeAdministratorRemoteRelay

uint64_t __56____HMDHomeAdministratorRemoteRelay___handleXPCMessage___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2) {
    return [*(id *)(result + 32) dispatchMessage:*(void *)(result + 40)];
  }
  return result;
}

void __56____HMDHomeAdministratorRemoteRelay___handleXPCMessage___block_invoke_2(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  v2 = [WeakRetained error];
  if (v2)
  {
    v3 = [a1[4] handler];
    v4 = [v3 home];

    if ([v2 code] == 3200 && v4) {
      [v4 setHomeUpdatedToROARAndInformClients];
    }
    v5 = [a1[5] responseHandler];

    if (v5)
    {
      v6 = [a1[5] responseHandler];
      ((void (**)(void, void *, void))v6)[2](v6, v2, 0);
    }
  }
}

uint64_t __48____HMDHomeAdministratorRemoteRelay_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v17_167015;
  logCategory__hmf_once_v17_167015 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end