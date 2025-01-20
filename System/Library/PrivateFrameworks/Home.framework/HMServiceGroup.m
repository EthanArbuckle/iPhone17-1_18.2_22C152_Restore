@interface HMServiceGroup
@end

@implementation HMServiceGroup

uint64_t __60__HMServiceGroup_AbstractionAdditions__hf_containedProfiles__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_containedProfiles");
}

uint64_t __67__HMServiceGroup_AbstractionAdditions__hf_containedCharacteristics__block_invoke(uint64_t a1, void *a2)
{
  return [a2 characteristics];
}

uint64_t __64__HMServiceGroup_AbstractionAdditions__hf_associatedAccessories__block_invoke(uint64_t a1, void *a2)
{
  return [a2 accessory];
}

uint64_t __56__HMServiceGroup_AbstractionAdditions__hf_accessoryType__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_accessoryType");
}

uint64_t __56__HMServiceGroup_AbstractionAdditions__hf_accessoryType__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 name];
  v6 = [v4 name];

  uint64_t v7 = [v5 localizedStandardCompare:v6];
  return v7;
}

uint64_t __56__HMServiceGroup_AbstractionAdditions__hf_accessoryType__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_serviceDescriptor");
}

uint64_t __52__HMServiceGroup_AbstractionAdditions__hf_isInRoom___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 room];
  id v4 = [v3 uniqueIdentifier];
  v5 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v6 = objc_msgSend(v4, "hmf_isEqualToUUID:", v5);

  return v6;
}

uint64_t __65__HMServiceGroup_AbstractionAdditions__hf_canShowInControlCenter__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_showsAsServiceInControlCentre");
}

uint64_t __54__HMServiceGroup_AbstractionAdditions__hf_moveToRoom___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_moveToRoom:", *(void *)(a1 + 32));
}

uint64_t __70__HMServiceGroup_AbstractionAdditions__hf_isForcedVisibleInHomeStatus__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isForcedVisibleInHomeStatus");
}

uint64_t __45__HMServiceGroup_HFAdditions__hf_isSupported__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_supportsGroups");
}

uint64_t __58__HMServiceGroup_HFAdditions__hf_areAllServicesInSameRoom__block_invoke(uint64_t a1, void *a2)
{
  v3 = objc_msgSend(a2, "hf_parentRoom");
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __51__HMServiceGroup_HFAdditions__hf_serviceDescriptor__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_serviceDescriptor");
}

uint64_t __67__HMServiceGroup_HFIncludedContextProtocol__hf_isOnForContextType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isOnForContextType:", *(void *)(a1 + 32));
}

uint64_t __69__HMServiceGroup_HFIncludedContextProtocol__hf_hasSetForContextType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_hasSetForContextType:", *(void *)(a1 + 32));
}

uint64_t __73__HMServiceGroup_HFIncludedContextProtocol__hf_shouldHideForContextType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_shouldHideForContextType:", *(void *)(a1 + 32));
}

uint64_t __62__HMServiceGroup_HFHomeKitObjectConformance__hf_isValidObject__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __86__HMServiceGroup_HFUserNotificationServiceSettings___hf_allBulletinBoardNotifications__block_invoke(uint64_t a1, void *a2)
{
  return [a2 bulletinBoardNotification];
}

void __66__HMServiceGroup_HFApplicationData___hf_didUpdateApplicationData___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (objc_opt_respondsToSelector())
  {
    v3 = [*(id *)(a1 + 32) services];
    uint64_t v4 = [v3 firstObject];
    v5 = [v4 home];
    [v6 home:v5 didUpdateApplicationDataForServiceGroup:*(void *)(a1 + 32)];
  }
}

void __92__HMServiceGroup_HFApplicationData__hf_updateApplicationData_handleError_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v17 = a2;
  v3 = +[HFHomeKitDispatcher sharedDispatcher];
  uint64_t v4 = [v3 homeManager];
  if ([v4 hasOptedToHH2])
  {
    v5 = [*(id *)(a1 + 32) services];
    id v6 = [v5 firstObject];
    uint64_t v7 = [v6 home];
    v8 = [v7 residentDevices];
    uint64_t v9 = [v8 count];

    v10 = HFOperationUpdateApplicationDataResidentSync;
    if (!v9) {
      v10 = HFOperationUpdateApplicationDataCloudSync;
    }
  }
  else
  {

    v10 = HFOperationUpdateApplicationDataCloudSync;
  }
  int v11 = *(unsigned __int8 *)(a1 + 56);
  v12 = *v10;
  v13 = +[HFErrorHandler sharedHandler];
  v14 = v13;
  if (v11) {
    [v13 handleError:v17 operationType:v12 options:0 retryBlock:0 cancelBlock:0];
  }
  else {
    [v13 logError:v17 operationDescription:v12];
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v16 = [WeakRetained applicationData];
  objc_msgSend(WeakRetained, "_hf_didUpdateApplicationData:", v16);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end