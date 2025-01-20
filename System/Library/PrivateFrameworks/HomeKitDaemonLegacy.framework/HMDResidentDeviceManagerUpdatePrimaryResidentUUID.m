@interface HMDResidentDeviceManagerUpdatePrimaryResidentUUID
@end

@implementation HMDResidentDeviceManagerUpdatePrimaryResidentUUID

uint64_t ____HMDResidentDeviceManagerUpdatePrimaryResidentUUID_block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  uint64_t v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  return v4;
}

uint64_t ____HMDResidentDeviceManagerUpdatePrimaryResidentUUID_block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  uint64_t v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  return v4;
}

uint64_t ____HMDResidentDeviceManagerUpdatePrimaryResidentUUID_block_invoke_486(uint64_t a1)
{
  return [*(id *)(a1 + 32) run];
}

@end