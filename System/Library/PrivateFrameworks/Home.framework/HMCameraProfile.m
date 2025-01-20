@interface HMCameraProfile
@end

@implementation HMCameraProfile

BOOL __54__HMCameraProfile_HFAdditions__hf_thermalShutdownMode__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 hasOperatingState]) {
    BOOL v3 = [v2 lastKnownOperatingState] == 2;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

void __66__HMCameraProfile_HFAdditions__hf_doorbellChimeMuteCharacteristic__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  v7 = [v6 serviceType];
  int v8 = [v7 isEqualToString:*MEMORY[0x263F0D6C0]];

  if (v8)
  {
    v9 = [v6 characteristics];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __66__HMCameraProfile_HFAdditions__hf_doorbellChimeMuteCharacteristic__block_invoke_2;
    v10[3] = &unk_26408EE80;
    v10[4] = *(void *)(a1 + 32);
    [v9 enumerateObjectsUsingBlock:v10];
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    *a4 = 1;
  }
}

void __66__HMCameraProfile_HFAdditions__hf_doorbellChimeMuteCharacteristic__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  v7 = [v9 characteristicType];
  int v8 = [v7 isEqualToString:*MEMORY[0x263F0C290]];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

uint64_t __96__HMCameraProfile_HFAdditions__hf_cameraAccessModeSelectedOptionForCameraProfiles_presenceType___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 > 3) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = off_264093EB8[v2];
  }
  return [a2 isEqualToString:v3];
}

void __66__HMCameraProfile_HFAdditions__hf_significantEventWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = [WeakRetained clipManager];
  id v6 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", *(void *)(a1 + 32));
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__HMCameraProfile_HFAdditions__hf_significantEventWithIdentifier___block_invoke_2;
  v8[3] = &unk_264093E58;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  id v9 = *(id *)(a1 + 32);
  id v7 = v3;
  id v10 = v7;
  [v5 fetchSignificantEventsWithUUIDs:v6 completion:v8];

  objc_destroyWeak(&v11);
}

void __66__HMCameraProfile_HFAdditions__hf_significantEventWithIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    if ([v5 count])
    {
      id v11 = *(void **)(a1 + 40);
      id v9 = [v5 anyObject];
      [v11 finishWithResult:v9];
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 30);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v9 = v8;
  id v10 = HFLogForCategory(0xEuLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v13 = *(void *)(a1 + 32);
    int v14 = 138412802;
    id v15 = WeakRetained;
    __int16 v16 = 2112;
    uint64_t v17 = v13;
    __int16 v18 = 2112;
    v19 = v9;
    _os_log_error_impl(&dword_20B986000, v10, OS_LOG_TYPE_ERROR, "%@: Unable to fetch significant event with identifier:%@ (error:%@)", (uint8_t *)&v14, 0x20u);
  }
  [*(id *)(a1 + 40) finishWithError:v9];
LABEL_8:
}

void __68__HMCameraProfile_HFAdditions__hf_faceCropImageForSignificantEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 clipManager];
  id v5 = [*(id *)(a1 + 40) uniqueIdentifier];
  [v6 fetchFaceCropDataRepresentationForSignificantEventWithUUID:v5 completion:v4];
}

id __68__HMCameraProfile_HFAdditions__hf_faceCropImageForSignificantEvent___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v2 = (objc_class *)MEMORY[0x263F1C6B0];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithData:v3];

  id v5 = [MEMORY[0x263F58190] futureWithResult:v4];

  return v5;
}

void __68__HMCameraProfile_HFAdditions__hf_faceCropImageForSignificantEvent___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x13uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    id v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "Error %@ fetching face crop for significant event %@", (uint8_t *)&v6, 0x16u);
  }
}

@end