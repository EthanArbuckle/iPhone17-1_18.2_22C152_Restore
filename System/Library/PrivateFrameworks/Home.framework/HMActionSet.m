@interface HMActionSet
@end

@implementation HMActionSet

void __70__HMActionSet_HFAdditions__hf_standardIconTintColorForIconIdentifier___block_invoke_2()
{
  v15[12] = *MEMORY[0x263EF8340];
  v14[0] = @"sun.max.fill";
  v13 = [MEMORY[0x263F1C550] systemYellowColor];
  v15[0] = v13;
  v14[1] = @"moon.stars.fill";
  v12 = [MEMORY[0x263F1C550] systemIndigoColor];
  v15[1] = v12;
  v14[2] = @"figure.walk.arrival";
  v0 = [MEMORY[0x263F1C550] systemOrangeColor];
  v15[2] = v0;
  v14[3] = @"figure.walk.departure";
  v1 = [MEMORY[0x263F1C550] systemOrangeColor];
  v15[3] = v1;
  v14[4] = @"house.fill";
  v2 = [MEMORY[0x263F1C550] systemOrangeColor];
  v15[4] = v2;
  v14[5] = @"chair.lounge.fill";
  v3 = [MEMORY[0x263F1C550] systemBrownColor];
  v15[5] = v3;
  v14[6] = @"popcorn.fill";
  v4 = [MEMORY[0x263F1C550] systemRedColor];
  v15[6] = v4;
  v14[7] = @"fork.knife";
  v5 = [MEMORY[0x263F1C550] systemGrayColor];
  v15[7] = v5;
  v14[8] = @"cup.and.saucer.fill";
  v6 = [MEMORY[0x263F1C550] systemMintColor];
  v15[8] = v6;
  v14[9] = @"frying.pan.fill";
  v7 = [MEMORY[0x263F1C550] systemGrayColor];
  v15[9] = v7;
  v14[10] = @"party.popper.fill";
  v8 = [MEMORY[0x263F1C550] systemYellowColor];
  v15[10] = v8;
  v14[11] = @"heart.fill";
  v9 = [MEMORY[0x263F1C550] systemPinkColor];
  v15[11] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:12];
  v11 = (void *)qword_26AB2F1F8;
  qword_26AB2F1F8 = v10;
}

void __76__HMActionSet_HFAdditions__hf_standardSystemIconIdentifierForActionSetType___block_invoke_2()
{
  v5[4] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F0B938];
  v4[0] = *MEMORY[0x263F0B960];
  v4[1] = v0;
  v5[0] = @"sun.max.fill";
  v5[1] = @"moon.stars.fill";
  uint64_t v1 = *MEMORY[0x263F0B918];
  v4[2] = *MEMORY[0x263F0B908];
  v4[3] = v1;
  v5[2] = @"figure.walk.arrival";
  v5[3] = @"figure.walk.departure";
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
  v3 = (void *)qword_26AB2F1D8;
  qword_26AB2F1D8 = v2;
}

id __57__HMActionSet_HFAdditions__hf_characteristicWriteActions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

uint64_t __52__HMActionSet_HFAdditions__hf_affectedMediaSessions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 mediaSession];
}

uint64_t __60__HMActionSet_HFAdditions__hf_affectsServiceWithIdentifier___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = [a2 uniqueIdentifier];
  uint64_t v6 = [v5 isEqual:*(void *)(a1 + 32)];

  if (v6) {
    *a3 = 1;
  }
  return v6;
}

uint64_t __51__HMActionSet_HFAdditions__hf_requiresDeviceUnlock__block_invoke(uint64_t a1, void *a2)
{
  return [a2 requiresDeviceUnlock];
}

void __89__HMActionSet_HFAdditions__hf_percentOfAccessoryRepresentableObjectsAssociatedWithGroup___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "hf_accessoryType");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "containsType:")) {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

void __62__HMActionSet_HFAdditions__hf_setIconIdentifier_andTintColor___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 applicationData];
  objc_msgSend(v2, "hf_updateApplicationData:handleError:completionHandler:", v4, 1, v3);
}

void __77__HMActionSet_HFAdditions__hf_mapOldIconIdentifierToNewSystemIconIdentifier___block_invoke_2()
{
  v3[12] = *MEMORY[0x263EF8340];
  v2[0] = @"HFImageIconIdentifierSceneWakeUp";
  v2[1] = @"HFImageIconIdentifierSceneSleep";
  v3[0] = @"sun.max.fill";
  v3[1] = @"moon.stars.fill";
  v2[2] = @"HFImageIconIdentifierSceneArrivingHome";
  v2[3] = @"HFImageIconIdentifierSceneLeavingHome";
  v3[2] = @"figure.walk.arrival";
  v3[3] = @"figure.walk.departure";
  v2[4] = @"HFImageIconIdentifierGeneric";
  v2[5] = @"HFImageIconIdentifierSceneChillOut";
  v3[4] = @"house.fill";
  v3[5] = @"chair.lounge.fill";
  v2[6] = @"HFImageIconIdentifierSceneMovie";
  v2[7] = @"HFImageIconIdentifierSceneDinner";
  v3[6] = @"popcorn.fill";
  v3[7] = @"fork.knife";
  v2[8] = @"HFImageIconIdentifierSceneCoffee";
  v2[9] = @"HFImageIconIdentifierSceneBreakfast";
  v3[8] = @"cup.and.saucer.fill";
  v3[9] = @"frying.pan.fill";
  v2[10] = @"HFImageIconIdentifierSceneParty";
  v2[11] = @"HFImageIconIdentifierSceneRomance";
  v3[10] = @"party.popper.fill";
  v3[11] = @"heart.fill";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:12];
  uint64_t v1 = (void *)qword_26AB2F1E8;
  qword_26AB2F1E8 = v0;
}

uint64_t __45__HMActionSet_HFAdditions__hf_shortcutAction__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __72__HMActionSet_HFIncludedContextProtocol__hf_updateValue_forContextType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 applicationData];
  objc_msgSend(v2, "hf_updateApplicationData:handleError:completionHandler:", v4, 1, v3);
}

uint64_t __59__HMActionSet_HFHomeKitObjectConformance__hf_isValidObject__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void __63__HMActionSet_HFApplicationData___hf_didUpdateApplicationData___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) home];
    [v4 home:v3 didUpdateApplicationDataForActionSet:*(void *)(a1 + 32)];
  }
}

void __89__HMActionSet_HFApplicationData__hf_updateApplicationData_handleError_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  id v3 = +[HFHomeKitDispatcher sharedDispatcher];
  id v4 = [v3 homeManager];
  if ([v4 hasOptedToHH2])
  {
    id v5 = [*(id *)(a1 + 32) home];
    uint64_t v6 = [v5 residentDevices];
    uint64_t v7 = [v6 count];

    v8 = HFOperationUpdateApplicationDataResidentSync;
    if (!v7) {
      v8 = HFOperationUpdateApplicationDataCloudSync;
    }
  }
  else
  {

    v8 = HFOperationUpdateApplicationDataCloudSync;
  }
  int v9 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v10 = *v8;
  v11 = +[HFErrorHandler sharedHandler];
  v12 = v11;
  if (v9) {
    [v11 handleError:v15 operationType:v10 options:0 retryBlock:0 cancelBlock:0];
  }
  else {
    [v11 logError:v15 operationDescription:v10];
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v14 = [WeakRetained applicationData];
  objc_msgSend(WeakRetained, "_hf_didUpdateApplicationData:", v14);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end