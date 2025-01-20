@interface MPCSPIRDecodeGenericObject
@end

@implementation MPCSPIRDecodeGenericObject

void ___MPCSPIRDecodeGenericObject_block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F08C38];
  id v3 = a2;
  id v5 = [v2 UUID];
  v4 = [v5 UUIDString];
  [v3 setOpaqueID:v4];
}

@end