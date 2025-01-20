@interface MKFApplicationData
@end

@implementation MKFApplicationData

void __68___MKFApplicationData_HMDBackingStoreModelObject__hmd_parentModelID__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "hmd_lastKnownValueForKey:", a2);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a4 = 1;
  }
}

void __50___MKFApplicationData_hmd_parentAttributeKeyPaths__block_invoke()
{
  v2[6] = *MEMORY[0x263EF8340];
  v2[0] = @"accessory";
  v2[1] = @"actionSet";
  v2[2] = @"home";
  v2[3] = @"room";
  v2[4] = @"service";
  v2[5] = @"serviceGroup";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:6];
  v1 = (void *)hmd_parentAttributeKeyPaths__hmf_once_v4;
  hmd_parentAttributeKeyPaths__hmf_once_v4 = v0;
}

void __54___MKFApplicationData_castIfApplicationDataContainer___block_invoke()
{
  uint64_t v0 = [[HMCConformanceCache alloc] initWithProtocol:&unk_26E480FE8];
  v1 = (void *)castIfApplicationDataContainer___hmf_once_v1;
  castIfApplicationDataContainer___hmf_once_v1 = (uint64_t)v0;
}

@end