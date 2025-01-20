@interface HMCHIPAccessoryPairing(HMD)
- (id)chipPluginPairing;
- (uint64_t)initWithHMMTRPairing:()HMD;
- (uint64_t)initWithHMMTRPairing:()HMD ownedEcosystem:;
@end

@implementation HMCHIPAccessoryPairing(HMD)

- (id)chipPluginPairing
{
  id v14 = objc_alloc(MEMORY[0x263F49818]);
  v20 = [a1 identifier];
  v19 = [a1 home];
  v2 = [v19 identifier];
  v18 = [a1 home];
  v3 = [v18 name];
  v17 = [a1 home];
  v16 = [v17 ecosystem];
  v4 = [v16 rootPublicKey];
  v13 = [a1 home];
  v5 = [v13 ecosystem];
  v6 = [v5 vendor];
  v7 = [v6 identifier];
  v8 = [a1 home];
  v9 = [v8 ecosystem];
  v10 = [v9 vendor];
  v11 = [v10 name];
  id v15 = (id)[v14 initWithNodeID:v20 fabricID:v2 fabricLabel:v3 rootPublicKey:v4 vendorID:v7 vendorName:v11];

  return v15;
}

- (uint64_t)initWithHMMTRPairing:()HMD ownedEcosystem:
{
  id v6 = a3;
  if (v6)
  {
    v7 = v6;
    id v8 = objc_alloc(MEMORY[0x263F0E588]);
    v9 = [v7 vendorID];
    v10 = [v7 vendorName];
    v11 = (void *)[v8 initWithIdentifier:v9 name:v10];

    v12 = [v11 identifier];
    objc_msgSend(v11, "setAppleVendor:", objc_msgSend(v12, "integerValue") == 4937);

    v13 = [v11 identifier];
    objc_msgSend(v11, "setSystemCommissionerVendor:", objc_msgSend(v13, "integerValue") == 4996);

    id v14 = objc_alloc(MEMORY[0x263F0E158]);
    id v15 = [v7 rootPublicKey];
    v16 = (void *)[v14 initWithRootPublicKey:v15 vendor:v11 owned:a4];

    id v17 = objc_alloc(MEMORY[0x263F0E160]);
    v18 = [v7 fabricID];
    v19 = [v7 fabricID];
    v20 = [v7 fabricLabel];
    v21 = (void *)[v17 initWithIdentifier:v18 index:v19 name:v20 ecosystem:v16];

    v22 = [v7 nodeID];
    uint64_t v23 = [a1 initWithIdentifier:v22 home:v21];

    return v23;
  }
  else
  {
    uint64_t v25 = _HMFPreconditionFailure();
    return -[HMCHIPAccessoryPairing(HMD) initWithHMMTRPairing:](v25);
  }
}

- (uint64_t)initWithHMMTRPairing:()HMD
{
  return [a1 initWithHMMTRPairing:a3 ownedEcosystem:0];
}

@end