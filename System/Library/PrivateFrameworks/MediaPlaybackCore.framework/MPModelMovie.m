@interface MPModelMovie
@end

@implementation MPModelMovie

void __122__MPModelMovie_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) identifiers];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __122__MPModelMovie_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_2;
  v11[3] = &unk_2643C4988;
  id v5 = v4;
  id v12 = v5;
  [v3 setUniversalStoreIdentifiersWithBlock:v11];
  v6 = [v5 personalizedStore];
  v7 = v6;
  if (v6)
  {
    v8 = [v6 personID];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __122__MPModelMovie_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_3;
    v9[3] = &unk_2643C4960;
    id v10 = v5;
    [v3 setPersonalStoreIdentifiersWithPersonID:v8 block:v9];
  }
}

void __122__MPModelMovie_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_4(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 hasLoadedValueForKey:*MEMORY[0x263F115E0]]) {
    objc_msgSend(v4, "setLibraryAddEligible:", objc_msgSend(*(id *)(a1 + 32), "isLibraryAddEligible"));
  }
  if ([v4 hasLoadedValueForKey:*MEMORY[0x263F11A50]])
  {
    id v3 = [*(id *)(a1 + 32) storeAsset];
    [v4 setStoreAsset:v3];
  }
}

void __122__MPModelMovie_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 universalStore];
  objc_msgSend(v4, "setAdamID:", objc_msgSend(v5, "adamID"));

  v6 = [*(id *)(a1 + 32) universalStore];
  objc_msgSend(v4, "setSubscriptionAdamID:", objc_msgSend(v6, "subscriptionAdamID"));

  id v7 = [*(id *)(a1 + 32) universalStore];
  objc_msgSend(v4, "setPurchasedAdamID:", objc_msgSend(v7, "purchasedAdamID"));
}

void __122__MPModelMovie_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 personalizedStore];
  id v4 = [v5 cloudAlbumID];
  [v3 setCloudAlbumID:v4];
}

@end