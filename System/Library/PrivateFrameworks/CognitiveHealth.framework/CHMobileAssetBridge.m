@interface CHMobileAssetBridge
- (void)autoAssetAvailableForUseForAssetType:(id)a3 assetSpecifier:(id)a4 completion:(id)a5;
- (void)autoAssetEndAllLocksForAssetType:(id)a3 assetSpecifier:(id)a4 completion:(id)a5;
- (void)autoAssetEndLockContentForAssetType:(id)a3 assetSpecifier:(id)a4 endLockReason:(id)a5 completion:(id)a6;
- (void)autoAssetInterestInContentForAssetType:(id)a3 assetSpecifier:(id)a4 completion:(id)a5;
- (void)autoAssetLockContentForAssetType:(id)a3 assetSpecifier:(id)a4 lockReason:(id)a5 completion:(id)a6;
@end

@implementation CHMobileAssetBridge

- (void)autoAssetEndAllLocksForAssetType:(id)a3 assetSpecifier:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  NSLog(&cfstr_AttemptingEndi_0.isa, v9, v8);
  v10 = (void *)[objc_alloc(MEMORY[0x263F55978]) initForAssetType:v9 withAssetSpecifier:v8];

  v11 = (void *)MEMORY[0x263F55960];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __82__CHMobileAssetBridge_autoAssetEndAllLocksForAssetType_assetSpecifier_completion___block_invoke;
  v13[3] = &unk_265287C00;
  id v14 = v7;
  id v12 = v7;
  [v11 endAllPreviousLocksOfSelector:v10 forClientName:@"CognitiveHealth" completion:v13];
}

void __82__CHMobileAssetBridge_autoAssetEndAllLocksForAssetType_assetSpecifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  uint64_t v6 = [a2 summary];
  id v7 = (void *)v6;
  if (a3) {
    NSLog(&cfstr_ErrorEndingAll.isa, v6, v8);
  }
  else {
    NSLog(&cfstr_SuccessEndingA.isa, v6);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)autoAssetEndLockContentForAssetType:(id)a3 assetSpecifier:(id)a4 endLockReason:(id)a5 completion:(id)a6
{
  id v9 = a5;
  v10 = (void (**)(id, void *))a6;
  id v11 = a4;
  id v12 = a3;
  NSLog(&cfstr_AttemptingEndi.isa, v9, v12, v11);
  v13 = (void *)[objc_alloc(MEMORY[0x263F55978]) initForAssetType:v12 withAssetSpecifier:v11];

  id v19 = 0;
  id v14 = (void *)[objc_alloc(MEMORY[0x263F55960]) initForClientName:@"CognitiveHealth" selectingAsset:v13 error:&v19];
  id v15 = v19;
  v16 = v15;
  if (v15)
  {
    NSLog(&cfstr_ErrorCreatingA.isa, v15);
    v10[2](v10, v16);
  }
  else
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __99__CHMobileAssetBridge_autoAssetEndLockContentForAssetType_assetSpecifier_endLockReason_completion___block_invoke;
    v17[3] = &unk_265287C00;
    v18 = v10;
    [v14 endLockUsage:v9 completion:v17];
  }
}

void __99__CHMobileAssetBridge_autoAssetEndLockContentForAssetType_assetSpecifier_endLockReason_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  uint64_t v6 = [a2 summary];
  id v7 = (void *)v6;
  if (a3) {
    NSLog(&cfstr_ErrorUnlocking.isa, v6, v8);
  }
  else {
    NSLog(&cfstr_SuccessUnlocki.isa, v6);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)autoAssetLockContentForAssetType:(id)a3 assetSpecifier:(id)a4 lockReason:(id)a5 completion:(id)a6
{
  id v9 = a5;
  v10 = (void (**)(id, void, void *, void *))a6;
  id v11 = a4;
  id v12 = a3;
  NSLog(&cfstr_AttemptingLock.isa, v9, v12, v11);
  v13 = (void *)[objc_alloc(MEMORY[0x263F55978]) initForAssetType:v12 withAssetSpecifier:v11];

  id v20 = 0;
  id v14 = (void *)[objc_alloc(MEMORY[0x263F55960]) initForClientName:@"CognitiveHealth" selectingAsset:v13 error:&v20];
  id v15 = v20;
  if (v15)
  {
    v16 = v15;
    NSLog(&cfstr_ErrorCreatingA.isa, v15);
    v17 = [MEMORY[0x263EFF8C0] array];
    v10[2](v10, 0, v17, v16);
  }
  else
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __93__CHMobileAssetBridge_autoAssetLockContentForAssetType_assetSpecifier_lockReason_completion___block_invoke;
    v18[3] = &unk_265287C28;
    id v19 = v10;
    [v14 lockContent:v9 withTimeout:-2 completion:v18];
    v17 = 0;
    v16 = v19;
  }
}

void __93__CHMobileAssetBridge_autoAssetLockContentForAssetType_assetSpecifier_lockReason_completion___block_invoke(uint64_t a1, void *a2, int a3, void *a4, void *a5, void *a6)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v13;
  if (a3)
  {
    id v15 = [a2 summary];
    NSLog(&cfstr_AutoAssetConte.isa, v15, v11);

    if (v12)
    {
      v16 = [v12 summary];
      NSLog(&cfstr_ContentLockedB.isa, v16);
    }
    else
    {
      NSLog(&cfstr_ContentLockedN.isa);
    }
    id v19 = [MEMORY[0x263F08850] defaultManager];
    id v20 = [v11 path];
    id v46 = 0;
    v21 = [v19 contentsOfDirectoryAtPath:v20 error:&v46];
    id v22 = v46;

    if (v22)
    {
      NSLog(&cfstr_ErrorGettingCo.isa, v22);
      uint64_t v23 = *(void *)(a1 + 32);
      v24 = [v11 path];
      v25 = [MEMORY[0x263EFF8C0] array];
      (*(void (**)(uint64_t, void *, void *, id))(v23 + 16))(v23, v24, v25, v22);
    }
    else
    {
      uint64_t v39 = a1;
      v40 = v14;
      id v41 = v12;
      v24 = [MEMORY[0x263EFF980] array];
      v25 = [MEMORY[0x263EFF980] array];
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      v38 = v21;
      id v26 = v21;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v42 objects:v47 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v43 != v29) {
              objc_enumerationMutation(v26);
            }
            uint64_t v31 = *(void *)(*((void *)&v42 + 1) + 8 * i);
            v32 = [v11 path];
            v33 = [v32 stringByAppendingPathComponent:v31];
            [v24 addObject:v33];

            [v25 addObject:v31];
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v42 objects:v47 count:16];
        }
        while (v28);
      }

      v34 = [v25 componentsJoinedByString:@", "];
      v35 = [v11 path];
      NSLog(&cfstr_LockedAndFound.isa, v34, v35);

      uint64_t v36 = *(void *)(v39 + 32);
      v37 = [v11 path];
      (*(void (**)(uint64_t, void *, void *, void))(v36 + 16))(v36, v37, v24, 0);

      id v14 = v40;
      id v12 = v41;
      id v22 = 0;
      v21 = v38;
    }
  }
  else
  {
    NSLog(&cfstr_AutoAssetConte_0.isa, v13);
    uint64_t v17 = *(void *)(a1 + 32);
    v18 = [MEMORY[0x263EFF8C0] array];
    (*(void (**)(uint64_t, void, void *, void *))(v17 + 16))(v17, 0, v18, v14);
  }
}

- (void)autoAssetInterestInContentForAssetType:(id)a3 assetSpecifier:(id)a4 completion:(id)a5
{
  id v7 = (void (**)(id, void *))a5;
  id v8 = a4;
  id v9 = a3;
  NSLog(&cfstr_InterestInCont.isa, v9, v8);
  v10 = (void *)[objc_alloc(MEMORY[0x263F55978]) initForAssetType:v9 withAssetSpecifier:v8];

  id v16 = 0;
  id v11 = (void *)[objc_alloc(MEMORY[0x263F55960]) initForClientName:@"CognitiveHealth" selectingAsset:v10 error:&v16];
  id v12 = v16;
  id v13 = v12;
  if (v12)
  {
    NSLog(&cfstr_ErrorCreatingA.isa, v12);
    v7[2](v7, v13);
  }
  else
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __88__CHMobileAssetBridge_autoAssetInterestInContentForAssetType_assetSpecifier_completion___block_invoke;
    v14[3] = &unk_265287C00;
    id v15 = v7;
    [v11 interestInContent:@"Download Custom Categories file" completion:v14];
  }
}

void __88__CHMobileAssetBridge_autoAssetInterestInContentForAssetType_assetSpecifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  uint64_t v6 = [a2 summary];
  id v7 = (void *)v6;
  if (a3) {
    NSLog(&cfstr_ErrorIndicatin.isa, v6, v8);
  }
  else {
    NSLog(&cfstr_SuccessLocking.isa, v6);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)autoAssetAvailableForUseForAssetType:(id)a3 assetSpecifier:(id)a4 completion:(id)a5
{
  id v7 = (void (**)(id, void, void *))a5;
  id v8 = a4;
  id v9 = a3;
  NSLog(&cfstr_AttemptingToGe.isa, v9, v8);
  v10 = (void *)[objc_alloc(MEMORY[0x263F55978]) initForAssetType:v9 withAssetSpecifier:v8];

  id v17 = 0;
  id v11 = (void *)[objc_alloc(MEMORY[0x263F55960]) initForClientName:@"CognitiveHealth" selectingAsset:v10 error:&v17];
  id v12 = v17;
  id v13 = v12;
  if (v12)
  {
    NSLog(&cfstr_ErrrorCreating.isa, v12);
    v7[2](v7, 0, v13);
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __86__CHMobileAssetBridge_autoAssetAvailableForUseForAssetType_assetSpecifier_completion___block_invoke;
  v15[3] = &unk_265287BD8;
  id v16 = v7;
  id v14 = v7;
  [v11 currentStatus:v15];
}

void __86__CHMobileAssetBridge_autoAssetAvailableForUseForAssetType_assetSpecifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  NSLog(&cfstr_SuccessfullyRe.isa, v5);
  uint64_t v6 = [v8 newerVersionError];

  if (v6)
  {
    NSLog(&cfstr_ErrorRetrievin.isa, v5);
    id v7 = [v8 newerVersionError];
    [v7 code];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end