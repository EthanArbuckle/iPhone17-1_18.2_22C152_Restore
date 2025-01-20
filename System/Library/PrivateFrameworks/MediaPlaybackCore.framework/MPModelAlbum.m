@interface MPModelAlbum
@end

@implementation MPModelAlbum

void __122__MPModelAlbum_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) identifiers];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __122__MPModelAlbum_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_2;
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
    v9[2] = __122__MPModelAlbum_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_3;
    v9[3] = &unk_2643C4960;
    id v10 = v5;
    [v3 setPersonalStoreIdentifiersWithPersonID:v8 block:v9];
  }
}

void __122__MPModelAlbum_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 hasLoadedValueForKey:*MEMORY[0x263F114B0]]) {
    objc_msgSend(v3, "setLibraryAddEligible:", objc_msgSend(*(id *)(a1 + 32), "isLibraryAddEligible"));
  }
}

void __122__MPModelAlbum_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_2(uint64_t a1, void *a2)
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

void __122__MPModelAlbum_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 personalizedStore];
  id v4 = [v5 cloudAlbumID];
  [v3 setCloudAlbumID:v4];
}

void __66__MPModelAlbum_ICRadioContentReference__mpc_radioContentReference__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) title];
  if ([v2 length])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    [*(id *)(a1 + 40) setAlbumName:v2];
  }
}

void __69__MPModelAlbum_BehaviorMusicSharePlayAdditions__msp_shortDescription__block_invoke(uint64_t a1)
{
  id v2 = NSString;
  id v3 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) title];
  id v4 = [v2 stringWithFormat:@" title='%@'", v5];
  objc_msgSend(v3, "insertString:atIndex:", v4, objc_msgSend(*(id *)(a1 + 32), "length") - 1);
}

@end