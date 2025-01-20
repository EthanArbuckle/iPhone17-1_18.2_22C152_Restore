@interface HMPersonManager
@end

@implementation HMPersonManager

void __56__HMPersonManager_HFAdditions__hf_personWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", *(void *)(a1 + 40));
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__HMPersonManager_HFAdditions__hf_personWithIdentifier___block_invoke_2;
  v9[3] = &unk_264096F20;
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v7;
  id v8 = v3;
  [v4 fetchPersonsWithUUIDs:v5 completion:v9];
}

void __56__HMPersonManager_HFAdditions__hf_personWithIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    v7 = *(void **)(a1 + 32);
    id v8 = [v5 anyObject];
    [v7 finishWithResult:v8];
  }
  else
  {
    if (v6)
    {
      id v9 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 30);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v8 = v9;
    id v10 = HFLogForCategory(0x13uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 48);
      int v13 = 138412802;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      uint64_t v16 = v12;
      __int16 v17 = 2112;
      v18 = v8;
      _os_log_error_impl(&dword_20B986000, v10, OS_LOG_TYPE_ERROR, "%@: Unable to fetch person with identifier:%@ (error: %@)", (uint8_t *)&v13, 0x20u);
    }

    [*(id *)(a1 + 32) finishWithError:v8];
  }
}

void __68__HMPersonManager_HFAdditions__hf_faceCropsForPersonWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263EFFA08];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  objc_msgSend(v2, "na_setWithSafeObject:", v4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v3 fetchFaceCropsForPersonsWithUUIDs:v6 completion:v5];
}

id __68__HMPersonManager_HFAdditions__hf_faceCropsForPersonWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (![v3 count])
  {
    uint64_t v4 = HFLogForCategory(0x13uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      int v12 = 138412546;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "%@: No face crops for person with identifier:%@", (uint8_t *)&v12, 0x16u);
    }
  }
  id v5 = [v3 allObjects];
  id v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_131];

  if (v6) {
    v7 = v6;
  }
  else {
    v7 = (void *)MEMORY[0x263EFFA68];
  }
  id v8 = [MEMORY[0x263F58190] futureWithResult:v7];

  return v8;
}

uint64_t __68__HMPersonManager_HFAdditions__hf_faceCropsForPersonWithIdentifier___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = v4;
  if (!v7) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v7;
  if (!v8)
  {
    uint64_t v10 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v11 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v10 handleFailureInFunction:v11, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v6, objc_opt_class() file lineNumber description];

LABEL_7:
    id v9 = 0;
  }

  uint64_t v12 = objc_opt_class();
  id v13 = v5;
  if (!v13)
  {
LABEL_14:
    uint64_t v15 = 0;
    goto LABEL_15;
  }
  if (objc_opt_isKindOfClass()) {
    __int16 v14 = v13;
  }
  else {
    __int16 v14 = 0;
  }
  uint64_t v15 = v13;
  if (!v14)
  {
    uint64_t v16 = [MEMORY[0x263F08690] currentHandler];
    __int16 v17 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v16 handleFailureInFunction:v17, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v12, objc_opt_class() file lineNumber description];

    goto LABEL_14;
  }
LABEL_15:

  v18 = [v9 dateCreated];
  uint64_t v19 = [v15 dateCreated];
  uint64_t v20 = [v18 compare:v19];

  return v20;
}

id __70__HMPersonManager_HFAdditions__hf_keyFaceCropForPersonWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 count];
  id v4 = (void *)MEMORY[0x263F58190];
  if (v3)
  {
    id v5 = [v2 lastObject];
    [v4 futureWithResult:v5];
  }
  else
  {
    id v5 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 30);
    [v4 futureWithError:v5];
  uint64_t v6 = };

  return v6;
}

void __51__HMPersonManager_HFAdditions__hf_namePerson_name___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = (void *)[*(id *)(a1 + 32) mutableCopy];
  if (!v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F0E5C0]);
    id v7 = [MEMORY[0x263F08C38] UUID];
    id v5 = (void *)[v6 initWithUUID:v7];
  }
  [v5 setName:*(void *)(a1 + 40)];
  id v8 = [v5 personLinks];
  if ([v8 count])
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __51__HMPersonManager_HFAdditions__hf_namePerson_name___block_invoke_2;
    v21[3] = &unk_264096F48;
    v21[4] = WeakRetained;
    id v9 = objc_msgSend(v8, "na_filter:", v21);
    uint64_t v10 = [v5 personLinks];
    uint64_t v11 = objc_msgSend(v10, "na_setByRemovingObjectsFromSet:", v9);

    [v5 setPersonLinks:v11];
    uint64_t v12 = HFLogForCategory(0x13uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v23 = v9;
      __int16 v24 = 2112;
      v25 = v11;
      _os_log_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEFAULT, "Removing links %@, setting person links to %@", buf, 0x16u);
    }
  }
  id v13 = [MEMORY[0x263EFFA08] setWithObject:v5];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __51__HMPersonManager_HFAdditions__hf_namePerson_name___block_invoke_15;
  v16[3] = &unk_264096F98;
  objc_copyWeak(&v20, (id *)(a1 + 48));
  id v14 = v5;
  id v17 = v14;
  id v15 = v3;
  id v18 = v15;
  id v19 = *(id *)(a1 + 32);
  [WeakRetained addOrUpdatePersons:v13 completion:v16];

  objc_destroyWeak(&v20);
}

BOOL __51__HMPersonManager_HFAdditions__hf_namePerson_name___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 personManagerUUID];
  id v4 = [*(id *)(a1 + 32) UUID];
  BOOL v5 = v3 != v4;

  return v5;
}

void __51__HMPersonManager_HFAdditions__hf_namePerson_name___block_invoke_15(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  BOOL v5 = HFLogForCategory(0x13uLL);
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      id v18 = WeakRetained;
      __int16 v19 = 2112;
      uint64_t v20 = v10;
      __int16 v21 = 2112;
      id v22 = v3;
      _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "%@: Unable to update person:%@ (error:%@)", buf, 0x20u);
    }

    [*(id *)(a1 + 40) finishWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 48);
      id v8 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      id v18 = WeakRetained;
      __int16 v19 = 2112;
      uint64_t v20 = v7;
      __int16 v21 = 2112;
      id v22 = v8;
      _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "%@: Renamed and updated person %@ to %@", buf, 0x20u);
    }

    id v9 = +[HFHomeKitDispatcher sharedDispatcher];
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    id v13 = __51__HMPersonManager_HFAdditions__hf_namePerson_name___block_invoke_17;
    id v14 = &unk_264096F70;
    id v15 = WeakRetained;
    id v16 = *(id *)(a1 + 32);
    [v9 dispatchHomePersonManagerObserverMessage:&v11 sender:0];

    objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", *(void *)(a1 + 32), v11, v12, v13, v14, v15);
  }
}

void __51__HMPersonManager_HFAdditions__hf_namePerson_name___block_invoke_17(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [MEMORY[0x263EFFA08] setWithObject:*(void *)(a1 + 40)];
    [v5 personManager:v3 didUpdatePersons:v4];
  }
}

void __56__HMPersonManager_HFAdditions__hf_removePersonWithUUID___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend(a1[4], "hf_faceCropsForPersonWithIdentifier:", a1[5]);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__HMPersonManager_HFAdditions__hf_removePersonWithUUID___block_invoke_2;
  v7[3] = &unk_264096FE8;
  objc_copyWeak(&v10, a1 + 6);
  id v8 = a1[5];
  id v5 = v3;
  id v9 = v5;
  id v6 = (id)[v4 addCompletionBlock:v7];

  objc_destroyWeak(&v10);
}

void __56__HMPersonManager_HFAdditions__hf_removePersonWithUUID___block_invoke_2(id *a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v8 = HFLogForCategory(0x13uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = a1[4];
    *(_DWORD *)buf = 138412546;
    id v20 = WeakRetained;
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "%@: Removing person with identifier:%@", buf, 0x16u);
  }

  id v10 = [MEMORY[0x263EFFA08] setWithObject:a1[4]];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __56__HMPersonManager_HFAdditions__hf_removePersonWithUUID___block_invoke_20;
  v13[3] = &unk_264096FC0;
  objc_copyWeak(&v18, a1 + 6);
  id v14 = a1[4];
  id v15 = a1[5];
  id v11 = v6;
  id v16 = v11;
  id v12 = v5;
  id v17 = v12;
  [WeakRetained removePersonsWithUUIDs:v10 completion:v13];

  objc_destroyWeak(&v18);
}

void __56__HMPersonManager_HFAdditions__hf_removePersonWithUUID___block_invoke_20(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (v3)
  {
    id v5 = HFLogForCategory(0x13uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v11 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      id v18 = WeakRetained;
      __int16 v19 = 2112;
      id v20 = v11;
      __int16 v21 = 2112;
      id v22 = v3;
      _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "%@: Unable to remove person with identifier:%@ (error: %@)", buf, 0x20u);
    }

    [*(id *)(a1 + 40) finishWithError:*(void *)(a1 + 48)];
  }
  else
  {
    if (*(void *)(a1 + 56)) {
      id v6 = *(void **)(a1 + 56);
    }
    else {
      id v6 = (void *)MEMORY[0x263EFFA68];
    }
    uint64_t v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_24_6);
    id v8 = HFLogForCategory(0x13uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = WeakRetained;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "%@: Removing face crops with identifiers:%@", buf, 0x16u);
    }

    id v9 = [MEMORY[0x263EFFA08] setWithArray:v7];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __56__HMPersonManager_HFAdditions__hf_removePersonWithUUID___block_invoke_25;
    v12[3] = &unk_264096F98;
    objc_copyWeak(&v16, (id *)(a1 + 64));
    id v13 = *(id *)(a1 + 32);
    id v10 = v7;
    id v14 = v10;
    id v15 = *(id *)(a1 + 40);
    [WeakRetained removeFaceCropsWithUUIDs:v9 completion:v12];

    objc_destroyWeak(&v16);
  }
}

uint64_t __56__HMPersonManager_HFAdditions__hf_removePersonWithUUID___block_invoke_21(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

void __56__HMPersonManager_HFAdditions__hf_removePersonWithUUID___block_invoke_25(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = +[HFHomeKitDispatcher sharedDispatcher];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __56__HMPersonManager_HFAdditions__hf_removePersonWithUUID___block_invoke_2_26;
  id v11 = &unk_264096F70;
  id v12 = WeakRetained;
  id v13 = *(id *)(a1 + 32);
  [v5 dispatchHomePersonManagerObserverMessage:&v8 sender:0];

  if (v3)
  {
    id v6 = HFLogForCategory(0x13uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      id v15 = WeakRetained;
      __int16 v16 = 2112;
      uint64_t v17 = v7;
      __int16 v18 = 2112;
      id v19 = v3;
      _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "%@: Unable to remove face crops with identifiers:%@ (error: %@)", buf, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v3, v8, v9, v10, v11, v12);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "finishWithNoResult", v8, v9, v10, v11, v12);
  }
}

void __56__HMPersonManager_HFAdditions__hf_removePersonWithUUID___block_invoke_2_26(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [MEMORY[0x263EFFA08] setWithObject:*(void *)(a1 + 40)];
    [v5 personManager:v3 didRemovePersonsWithUUIDs:v4];
  }
}

void __60__HMPersonManager_HFAdditions__hf_removeFaceCropsWithUUIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x13uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    uint64_t v15 = v5;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "%@: Removing face crops with identifiers:%@", buf, 0x16u);
  }

  if ([*(id *)(a1 + 40) count])
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v7 = (id *)(a1 + 40);
    uint64_t v9 = *(v7 - 1);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __60__HMPersonManager_HFAdditions__hf_removeFaceCropsWithUUIDs___block_invoke_30;
    v10[3] = &unk_264097038;
    objc_copyWeak(&v13, v7 + 1);
    id v11 = *v7;
    id v12 = v3;
    [v9 removeFaceCropsWithUUIDs:v8 completion:v10];

    objc_destroyWeak(&v13);
  }
  else
  {
    [v3 finishWithNoResult];
  }
}

void __60__HMPersonManager_HFAdditions__hf_removeFaceCropsWithUUIDs___block_invoke_30(id *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (v3)
  {
    uint64_t v5 = HFLogForCategory(0x13uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v7 = a1[4];
      *(_DWORD *)buf = 138412802;
      id v15 = WeakRetained;
      __int16 v16 = 2112;
      id v17 = v7;
      __int16 v18 = 2112;
      id v19 = v3;
      _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "%@: Unable to remove face crop with identifier:%@ (error: %@)", buf, 0x20u);
    }

    [a1[5] finishWithError:v3];
  }
  else
  {
    uint64_t v6 = +[HFHomeKitDispatcher sharedDispatcher];
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    id v10 = __60__HMPersonManager_HFAdditions__hf_removeFaceCropsWithUUIDs___block_invoke_31;
    id v11 = &unk_264096F70;
    id v12 = WeakRetained;
    id v13 = a1[4];
    [v6 dispatchHomePersonManagerObserverMessage:&v8 sender:0];

    objc_msgSend(a1[5], "finishWithNoResult", v8, v9, v10, v11, v12);
  }
}

void __60__HMPersonManager_HFAdditions__hf_removeFaceCropsWithUUIDs___block_invoke_31(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 personManager:*(void *)(a1 + 32) didRemoveFaceCropsWithUUIDs:*(void *)(a1 + 40)];
  }
}

void __80__HMPersonManager_HFAdditions__hf_associateFaceCropsWithUUIDs_toPersonWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __80__HMPersonManager_HFAdditions__hf_associateFaceCropsWithUUIDs_toPersonWithUUID___block_invoke_2;
  v8[3] = &unk_2640922B0;
  v8[4] = WeakRetained;
  id v9 = v5;
  id v10 = v3;
  id v11 = *(id *)(a1 + 32);
  id v7 = v3;
  [WeakRetained associateFaceCropsWithUUIDs:v6 toPersonWithUUID:v9 completion:v8];
}

void __80__HMPersonManager_HFAdditions__hf_associateFaceCropsWithUUIDs_toPersonWithUUID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x13uLL);
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      int v11 = 138412802;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "%@: Unable to associate face crops to person with identifier:%@ (error: %@)", (uint8_t *)&v11, 0x20u);
    }

    [*(id *)(a1 + 48) finishWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 56);
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void **)(a1 + 40);
      int v11 = 138412802;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v6;
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "%@: Associated face crops:%@ to person with identifier:%@", (uint8_t *)&v11, 0x20u);
    }

    [*(id *)(a1 + 48) finishWithNoResult];
  }
}

void __104__HMPersonManager_HFAdditions__hf_reassociateFaceCropsFromPersonWithUUID_toPersonWithUUID_removePerson___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "hf_faceCropsForPersonWithIdentifier:", *(void *)(a1 + 40));
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __104__HMPersonManager_HFAdditions__hf_reassociateFaceCropsFromPersonWithUUID_toPersonWithUUID_removePerson___block_invoke_2;
  v9[3] = &unk_2640970B0;
  uint64_t v5 = *(void **)(a1 + 40);
  void v9[4] = *(void *)(a1 + 32);
  id v10 = v5;
  id v6 = *(id *)(a1 + 48);
  char v13 = *(unsigned char *)(a1 + 56);
  id v11 = v6;
  id v12 = v3;
  id v7 = v3;
  id v8 = (id)[v4 addSuccessBlock:v9];
}

void __104__HMPersonManager_HFAdditions__hf_reassociateFaceCropsFromPersonWithUUID_toPersonWithUUID_removePerson___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_35_1);
  uint64_t v5 = HFLogForCategory(0x13uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138413058;
    uint64_t v22 = v6;
    __int16 v23 = 2112;
    id v24 = v3;
    __int16 v25 = 2112;
    uint64_t v26 = v7;
    __int16 v27 = 2112;
    uint64_t v28 = v8;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "%@: Reassociating face crops:%@ from person with identifier:%@ to person with identifier:%@", buf, 0x2Au);
  }

  uint64_t v9 = *(void **)(a1 + 32);
  id v10 = [MEMORY[0x263EFFA08] setWithArray:v4];
  id v11 = objc_msgSend(v9, "hf_associateFaceCropsWithUUIDs:toPersonWithUUID:", v10, *(void *)(a1 + 48));
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __104__HMPersonManager_HFAdditions__hf_reassociateFaceCropsFromPersonWithUUID_toPersonWithUUID_removePerson___block_invoke_36;
  v17[3] = &unk_264097088;
  char v20 = *(unsigned char *)(a1 + 64);
  id v12 = *(void **)(a1 + 40);
  v17[4] = *(void *)(a1 + 32);
  id v18 = v12;
  id v19 = *(id *)(a1 + 56);
  char v13 = [v11 addSuccessBlock:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __104__HMPersonManager_HFAdditions__hf_reassociateFaceCropsFromPersonWithUUID_toPersonWithUUID_removePerson___block_invoke_4;
  v15[3] = &unk_26408CDF0;
  id v16 = *(id *)(a1 + 56);
  id v14 = (id)[v13 addFailureBlock:v15];
}

uint64_t __104__HMPersonManager_HFAdditions__hf_reassociateFaceCropsFromPersonWithUUID_toPersonWithUUID_removePerson___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

void __104__HMPersonManager_HFAdditions__hf_reassociateFaceCropsFromPersonWithUUID_toPersonWithUUID_removePerson___block_invoke_36(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    id v2 = objc_msgSend(*(id *)(a1 + 32), "hf_removePersonWithUUID:", *(void *)(a1 + 40));
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __104__HMPersonManager_HFAdditions__hf_reassociateFaceCropsFromPersonWithUUID_toPersonWithUUID_removePerson___block_invoke_2_37;
    v8[3] = &unk_264097060;
    id v9 = *(id *)(a1 + 48);
    id v3 = [v2 addSuccessBlock:v8];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __104__HMPersonManager_HFAdditions__hf_reassociateFaceCropsFromPersonWithUUID_toPersonWithUUID_removePerson___block_invoke_3_39;
    v6[3] = &unk_26408CDF0;
    id v7 = *(id *)(a1 + 48);
    id v4 = (id)[v3 addFailureBlock:v6];
  }
  else
  {
    uint64_t v5 = *(void **)(a1 + 48);
    [v5 finishWithNoResult];
  }
}

uint64_t __104__HMPersonManager_HFAdditions__hf_reassociateFaceCropsFromPersonWithUUID_toPersonWithUUID_removePerson___block_invoke_2_37(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithNoResult];
}

uint64_t __104__HMPersonManager_HFAdditions__hf_reassociateFaceCropsFromPersonWithUUID_toPersonWithUUID_removePerson___block_invoke_3_39(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

uint64_t __104__HMPersonManager_HFAdditions__hf_reassociateFaceCropsFromPersonWithUUID_toPersonWithUUID_removePerson___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

void __79__HMPersonManager_HFAdditions__hf_linkFromPerson_toPerson_toPersonManagerUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [MEMORY[0x263EFFA08] setWithObject:*(void *)(a1 + 40)];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __79__HMPersonManager_HFAdditions__hf_linkFromPerson_toPerson_toPersonManagerUUID___block_invoke_2;
  v7[3] = &unk_264091150;
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  id v10 = v3;
  id v6 = v3;
  [v4 addOrUpdatePersons:v5 completion:v7];
}

void __79__HMPersonManager_HFAdditions__hf_linkFromPerson_toPerson_toPersonManagerUUID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x13uLL);
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 138412546;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "Unable to create link between person %@ and %@", (uint8_t *)&v10, 0x16u);
    }

    [*(id *)(a1 + 48) finishWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      int v10 = 138412546;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Created link between person %@ and %@", (uint8_t *)&v10, 0x16u);
    }

    [*(id *)(a1 + 48) finishWithNoResult];
  }
}

@end