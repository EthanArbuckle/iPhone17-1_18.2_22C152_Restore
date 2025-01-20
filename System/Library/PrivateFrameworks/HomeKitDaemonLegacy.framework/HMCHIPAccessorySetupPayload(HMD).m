@interface HMCHIPAccessorySetupPayload(HMD)
- (id)chipSetupPayload;
- (uint64_t)initWithCHIPSetupPayload:()HMD;
@end

@implementation HMCHIPAccessorySetupPayload(HMD)

- (id)chipSetupPayload
{
  id v2 = objc_alloc(MEMORY[0x1E4F6A0E8]);
  v3 = [a1 setupCode];
  v4 = [a1 discriminator];
  v5 = (void *)[v2 initWithSetupCode:v3 discriminator:v4];

  objc_msgSend(v5, "setHasShortDiscriminator:", objc_msgSend(a1, "hasShortDiscriminator"));
  v6 = [a1 setupPayloadString];
  [v5 setSetupPayloadString:v6];

  v7 = [a1 vendorID];
  [v5 setVendorID:v7];

  v8 = [a1 productID];
  [v5 setProductID:v8];

  v9 = [a1 serialNumber];
  [v5 setSerialNumber:v9];

  objc_msgSend(v5, "setRequiresCustomFlow:", objc_msgSend(a1, "requiresCustomFlow"));
  v10 = (void *)[v5 copy];

  return v10;
}

- (uint64_t)initWithCHIPSetupPayload:()HMD
{
  id v4 = a3;
  v5 = [v4 setupCode];
  v6 = [v4 discriminator];
  v7 = (void *)[a1 initWithSetupCode:v5 discriminator:v6];
  v8 = (void *)[v7 mutableCopy];

  objc_msgSend(v8, "setHasShortDiscriminator:", objc_msgSend(v4, "hasShortDiscriminator"));
  v9 = [v4 setupPayloadString];
  [v8 setSetupPayloadString:v9];

  v10 = [v4 vendorID];
  [v8 setVendorID:v10];

  v11 = [v4 productID];
  [v8 setProductID:v11];

  v12 = [v4 serialNumber];
  [v8 setSerialNumber:v12];

  uint64_t v13 = [v4 requiresCustomFlow];
  [v8 setRequiresCustomFlow:v13];
  uint64_t v14 = [v8 copy];

  return v14;
}

@end