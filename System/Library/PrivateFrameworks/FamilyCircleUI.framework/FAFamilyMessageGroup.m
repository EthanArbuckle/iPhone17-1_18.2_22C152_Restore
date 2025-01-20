@interface FAFamilyMessageGroup
- (BOOL)shouldPerformModalMessagePresentation;
- (id)contextPropertyWithName:(id)a3;
- (id)groupIdentifier;
- (void)performModalMessagePresentation:(id)a3 fromViewController:(id)a4;
@end

@implementation FAFamilyMessageGroup

- (id)groupIdentifier
{
  return @"com.apple.iCloud.Family";
}

- (BOOL)shouldPerformModalMessagePresentation
{
  return 1;
}

- (id)contextPropertyWithName:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 isEqualToString:@"familyClientBundleID"])
  {
    v4 = [MEMORY[0x263F086E0] mainBundle];
    v5 = [v4 bundleIdentifier];
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x263F3BF00]);
    v7 = [MEMORY[0x263F086E0] mainBundle];
    v8 = [v7 bundleIdentifier];
    v9 = (void *)[v6 initWithPropertyName:v3 bundleID:v8];

    id v16 = 0;
    uint64_t v10 = [v9 fetchEligibilityWithError:&v16];
    id v11 = v16;
    v12 = _FALogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v3;
      __int16 v19 = 2048;
      uint64_t v20 = v10;
      _os_log_impl(&dword_2189F0000, v12, OS_LOG_TYPE_DEFAULT, "FAFamilyMessageGroup contextPropertyWithName: %@, response: %lu", buf, 0x16u);
    }

    if (v11)
    {
      v13 = _FALogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        [(FAFamilyMessageGroup *)(uint64_t)v3 contextPropertyWithName:v13];
      }
    }
    v14 = (void *)MEMORY[0x263EFFA80];
    if (v10 != 1) {
      v14 = 0;
    }
    if (v10 == 2) {
      v5 = (void *)MEMORY[0x263EFFA88];
    }
    else {
      v5 = v14;
    }
  }
  return v5;
}

- (void)performModalMessagePresentation:(id)a3 fromViewController:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = _FALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v6;
    _os_log_impl(&dword_2189F0000, v8, OS_LOG_TYPE_DEFAULT, "FAFamilyMessageGroup will present message: %@", buf, 0xCu);
  }

  v9 = [[FACircleContext alloc] initWithEventType:@"FACircleEventTypeMercuryJourney"];
  [(FACircleContext *)v9 setActivityIndicatorStyle:0];
  uint64_t v10 = [v6 contentPages];
  id v11 = [v10 firstObject];
  v12 = [v11 contentParameters];

  v13 = [v12 objectForKeyedSubscript:@"type"];
  id v14 = objc_alloc_init(MEMORY[0x263F3BF48]);
  [v14 setCachePolicy:0];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __75__FAFamilyMessageGroup_performModalMessagePresentation_fromViewController___block_invoke;
  v20[3] = &unk_26434A4A8;
  id v21 = v13;
  id v22 = v12;
  v23 = v9;
  id v24 = v7;
  v25 = self;
  id v26 = v6;
  id v15 = v6;
  id v16 = v7;
  v17 = v9;
  id v18 = v12;
  id v19 = v13;
  [v14 startRequestWithCompletionHandler:v20];
}

void __75__FAFamilyMessageGroup_performModalMessagePresentation_fromViewController___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 eligibilityRequirements];
  v8 = [v7 requirementsForPropertyName:*(void *)(a1 + 32)];

  v9 = [v8 serverPayload];
  uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
  [v10 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"mercury-journey"];
  [v10 setObject:v9 forKeyedSubscript:@"serverPayload"];
  id v11 = (void *)[v10 copy];
  [*(id *)(a1 + 48) setAdditionalParameters:v11];

  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__9;
  v35 = __Block_byref_object_dispose__9;
  v36 = objc_alloc_init(FACircleStateController);
  [(id)v32[5] setPresenter:*(void *)(a1 + 56)];
  v12 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v13 = [v12 userInterfaceIdiom];

  if (v13 == 1) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = -2;
  }
  [(id)v32[5] setModalPresentationStyle:v14];
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  char v30 = 0;
  objc_initWeak(&location, *(id *)(a1 + 64));
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __75__FAFamilyMessageGroup_performModalMessagePresentation_fromViewController___block_invoke_37;
  v24[3] = &unk_26434A458;
  id v26 = v29;
  objc_copyWeak(&v27, &location);
  id v25 = *(id *)(a1 + 72);
  [(id)v32[5] setPresentationHandler:v24];
  id v15 = (void *)v32[5];
  uint64_t v16 = *(void *)(a1 + 48);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __75__FAFamilyMessageGroup_performModalMessagePresentation_fromViewController___block_invoke_39;
  v19[3] = &unk_26434A480;
  id v22 = v29;
  id v17 = *(id *)(a1 + 72);
  uint64_t v18 = *(void *)(a1 + 64);
  id v20 = v17;
  uint64_t v21 = v18;
  v23 = &v31;
  [v15 performOperationWithContext:v16 completion:v19];

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
  _Block_object_dispose(v29, 8);
  _Block_object_dispose(&v31, 8);
}

void __75__FAFamilyMessageGroup_performModalMessagePresentation_fromViewController___block_invoke_37(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl(&dword_2189F0000, v3, OS_LOG_TYPE_DEFAULT, "FAFamilyMessageGroup did present message: %@", (uint8_t *)&v6, 0xCu);
  }

  id v5 = [*(id *)(a1 + 32) identifier];
  [WeakRetained reportModalMessageWasPresentedWithIdentifier:v5];
}

void __75__FAFamilyMessageGroup_performModalMessagePresentation_fromViewController___block_invoke_39(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  int v6 = _FALogSystem();
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v14 = 138412290;
      uint64_t v15 = v8;
      _os_log_impl(&dword_2189F0000, v7, OS_LOG_TYPE_DEFAULT, "FAFamilyMessageGroup did dismiss message: %@", (uint8_t *)&v14, 0xCu);
    }

    v9 = *(void **)(a1 + 40);
    uint64_t v10 = [*(id *)(a1 + 32) identifier];
    [v9 reportModalMessageWasDismissedWithIdentifier:v10];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __75__FAFamilyMessageGroup_performModalMessagePresentation_fromViewController___block_invoke_39_cold_1(a1, (uint64_t)v4, v7);
    }

    id v11 = *(void **)(a1 + 40);
    uint64_t v10 = [*(id *)(a1 + 32) identifier];
    [v11 reportModalMessagePresentationFailedWithIdentifier:v10];
  }

  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = 0;
}

- (void)contextPropertyWithName:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_1(&dword_2189F0000, a2, a3, "failed to fetch recommendation for property: %@, error: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

void __75__FAFamilyMessageGroup_performModalMessagePresentation_fromViewController___block_invoke_39_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_1(&dword_2189F0000, a2, a3, "FAFamilyMessageGroup circleController complete without UI for message: %@, error: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

@end