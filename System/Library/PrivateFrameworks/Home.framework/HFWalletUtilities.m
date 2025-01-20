@interface HFWalletUtilities
+ (BOOL)isWalletKeyDeviceStateCompatible:(id)a3;
+ (id)handleAddOrShowHomeKeyButtonTapForHome:(id)a3;
+ (id)packageIconIdentifierForHome:(id)a3 shouldUseKeyholeAsset:(BOOL)a4;
+ (id)walletAppFromAppStoreURL;
+ (id)walletAppURL;
+ (id)walletKeyColorOfDeviceState:(id)a3;
+ (id)walletKeyIconDescriptorForHome:(id)a3 shouldUseKeyholeAsset:(BOOL)a4 foriPhoneDevice:(BOOL)a5;
+ (unint64_t)pkPassHomeKeyLiveRenderTypeForHMHomeWalletKeyColor:(int64_t)a3;
@end

@implementation HFWalletUtilities

+ (id)handleAddOrShowHomeKeyButtonTapForHome:(id)a3
{
  id v4 = a3;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  char v31 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  char v29 = 0;
  v5 = objc_msgSend(v4, "hf_hasWalletKey");
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __60__HFWalletUtilities_handleAddOrShowHomeKeyButtonTapForHome___block_invoke;
  v24[3] = &unk_264098798;
  v26 = v28;
  id v6 = v4;
  id v25 = v6;
  v27 = v30;
  v7 = [v5 flatMap:v24];

  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  char v23 = 0;
  v8 = objc_msgSend(v6, "hf_walletKeyDeviceStatesOfCompatiblePairedWatches");
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __60__HFWalletUtilities_handleAddOrShowHomeKeyButtonTapForHome___block_invoke_3;
  v21[3] = &unk_2640987E0;
  v21[4] = v22;
  v9 = [v8 flatMap:v21];

  objc_initWeak(&location, a1);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __60__HFWalletUtilities_handleAddOrShowHomeKeyButtonTapForHome___block_invoke_5;
  v14[3] = &unk_264098850;
  objc_copyWeak(&v19, &location);
  v17 = v28;
  id v10 = v6;
  id v15 = v10;
  id v11 = v9;
  id v16 = v11;
  v18 = v22;
  id v12 = (id)[v7 addSuccessBlock:v14];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v30, 8);

  return v7;
}

id __60__HFWalletUtilities_handleAddOrShowHomeKeyButtonTapForHome___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 BOOLValue];
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    v5 = [MEMORY[0x263F58190] futureWithResult:MEMORY[0x263EFFA80]];
  }
  else
  {
    id v6 = objc_msgSend(*(id *)(a1 + 32), "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");
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __60__HFWalletUtilities_handleAddOrShowHomeKeyButtonTapForHome___block_invoke_2;
    v8[3] = &unk_264091D28;
    v8[4] = *(void *)(a1 + 48);
    v5 = [v6 addSuccessBlock:v8];
  }
  return v5;
}

uint64_t __60__HFWalletUtilities_handleAddOrShowHomeKeyButtonTapForHome___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 BOOLValue];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

id __60__HFWalletUtilities_handleAddOrShowHomeKeyButtonTapForHome___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 count] != 0;
  int v4 = objc_msgSend(v3, "na_filter:", &__block_literal_global_168);

  v5 = (void *)MEMORY[0x263F58190];
  id v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "count") != 0);
  v7 = [v5 futureWithResult:v6];

  return v7;
}

BOOL __60__HFWalletUtilities_handleAddOrShowHomeKeyButtonTapForHome___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 walletKey];
  BOOL v3 = v2 == 0;

  return v3;
}

void __60__HFWalletUtilities_handleAddOrShowHomeKeyButtonTapForHome___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "hf_walletKeyInWalletAppURL");
    id v6 = (id)[v5 flatMap:&__block_literal_global_26_1];
  }
  else
  {
    v7 = *(void **)(a1 + 40);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __60__HFWalletUtilities_handleAddOrShowHomeKeyButtonTapForHome___block_invoke_7;
    v9[3] = &unk_264098828;
    id v10 = v3;
    id v11 = *(id *)(a1 + 32);
    id v12 = WeakRetained;
    uint64_t v13 = *(void *)(a1 + 56);
    id v8 = (id)[v7 addSuccessBlock:v9];
  }
}

id __60__HFWalletUtilities_handleAddOrShowHomeKeyButtonTapForHome___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[HFOpenURLRouter sharedInstance];
  int v4 = [v3 openURL:v2];

  return v4;
}

void __60__HFWalletUtilities_handleAddOrShowHomeKeyButtonTapForHome___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  LODWORD(v3) = [v3 BOOLValue];
  int v5 = [v4 BOOLValue];

  if (!v3)
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
      char v9 = v5;
    }
    else {
      char v9 = 1;
    }
    if (v9)
    {
      id v8 = [MEMORY[0x263F58190] futureWithNoResult];
      if (!v5) {
        goto LABEL_9;
      }
    }
    else
    {
      id v11 = +[HFOpenURLRouter sharedInstance];
      id v12 = [NSURL URLWithString:@"bridge:root=com.apple.NanoPassbookBridgeSettings%230"];
      id v8 = [v11 openURL:v12];

      if (!v5) {
        goto LABEL_9;
      }
    }
LABEL_11:
    uint64_t v13 = objc_msgSend(*(id *)(a1 + 40), "hf_addWalletKeyToPairedWatchesWithOptions:", 0, *(_OWORD *)&v17);
    id v10 = [v13 recover:&__block_literal_global_32_1];

    goto LABEL_12;
  }
  id v6 = objc_msgSend(*(id *)(a1 + 40), "hf_addWalletKeyWithOptions:", 0);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __60__HFWalletUtilities_handleAddOrShowHomeKeyButtonTapForHome___block_invoke_8;
  v20[3] = &unk_26408CE18;
  int8x16_t v17 = *(int8x16_t *)(a1 + 40);
  id v7 = (id)v17.i64[0];
  int8x16_t v21 = vextq_s8(v17, v17, 8uLL);
  id v8 = [v6 recover:v20];

  if (v5) {
    goto LABEL_11;
  }
LABEL_9:
  id v10 = objc_msgSend(MEMORY[0x263F58190], "futureWithNoResult", *(_OWORD *)&v17);
LABEL_12:
  v14 = objc_opt_new();
  objc_msgSend(v14, "na_safeAddObject:", v8);
  objc_msgSend(v14, "na_safeAddObject:", v10);
  id v15 = [MEMORY[0x263F58190] combineAllFutures:v14];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __60__HFWalletUtilities_handleAddOrShowHomeKeyButtonTapForHome___block_invoke_2_36;
  v18[3] = &unk_26408FAA0;
  id v19 = *(id *)(a1 + 40);
  id v16 = (id)[v15 flatMap:v18];
}

id __60__HFWalletUtilities_handleAddOrShowHomeKeyButtonTapForHome___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x43uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 138413058;
    uint64_t v10 = v7;
    __int16 v11 = 2080;
    id v12 = "+[HFWalletUtilities handleAddOrShowHomeKeyButtonTapForHome:]_block_invoke_8";
    __int16 v13 = 2112;
    id v14 = v3;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "(%@:%s) hf_addWalletKeyWithOptions: with notification but without enabling Express Mode returned error %@ for home %@", (uint8_t *)&v9, 0x2Au);
  }

  int v5 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v5;
}

id __60__HFWalletUtilities_handleAddOrShowHomeKeyButtonTapForHome___block_invoke_30(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = [MEMORY[0x263F0E390] errorByDeviceWithOverallError:v2];
  id v4 = objc_opt_new();
  int v5 = [v3 objectEnumerator];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "na_safeAddObject:", *(void *)(*((void *)&v15 + 1) + 8 * i));
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v7);
  }
  uint64_t v10 = [v4 count];
  __int16 v11 = (void *)MEMORY[0x263F58190];
  if (v10)
  {
    id v12 = [MEMORY[0x263F58190] futureWithResult:v4];
  }
  else
  {
    id v19 = v2;
    __int16 v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
    id v12 = [v11 futureWithResult:v13];
  }
  return v12;
}

id __60__HFWalletUtilities_handleAddOrShowHomeKeyButtonTapForHome___block_invoke_2_36(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x43uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v12 = 136315650;
    __int16 v13 = "+[HFWalletUtilities handleAddOrShowHomeKeyButtonTapForHome:]_block_invoke_2";
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "(HFWalletUtilities : %s) Completed adding Wallet Key without enabling Express Mode for iPhone and paired Apple Watches for home %@ with results %@", (uint8_t *)&v12, 0x20u);
  }

  uint64_t v6 = objc_msgSend(v3, "na_arrayByFlattening");
  uint64_t v7 = objc_msgSend(v6, "na_filter:", &__block_literal_global_40_5);

  if ([v7 count] == 1 || (unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    uint64_t v8 = +[HFErrorHandler sharedHandler];
    int v9 = [v7 firstObject];
    [v8 handleError:v9];
  }
  uint64_t v10 = [MEMORY[0x263F58190] futureWithResult:v7];

  return v10;
}

uint64_t __60__HFWalletUtilities_handleAddOrShowHomeKeyButtonTapForHome___block_invoke_37(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (BOOL)isWalletKeyDeviceStateCompatible:(id)a3
{
  id v3 = a3;
  BOOL v4 = ([v3 canAddWalletKey] & 1) != 0
    || [v3 canAddWalletKeyErrorCode] != 4 && objc_msgSend(v3, "canAddWalletKeyErrorCode") != 3;

  return v4;
}

+ (id)walletAppURL
{
  return (id)[NSURL URLWithString:@"shoebox://"];
}

+ (id)walletAppFromAppStoreURL
{
  return (id)[NSURL URLWithString:@"itms-apps://apple.com/app/id1160481993"];
}

+ (id)walletKeyColorOfDeviceState:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 walletKey];

  if (v4)
  {
    uint64_t v5 = NSNumber;
    uint64_t v6 = [v3 walletKey];
    BOOL v4 = objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "color"));
  }
  return v4;
}

+ (unint64_t)pkPassHomeKeyLiveRenderTypeForHMHomeWalletKeyColor:(int64_t)a3
{
  if (a3 <= 14935010)
  {
    if (a3 == 14341582) {
      return 2;
    }
    return 3;
  }
  if (a3 != 14935011)
  {
    if (a3 == 15521450) {
      return 4;
    }
    return 3;
  }
  return 1;
}

+ (id)packageIconIdentifierForHome:(id)a3 shouldUseKeyholeAsset:(BOOL)a4
{
  uint64_t v5 = objc_msgSend(a3, "hf_walletKeyColorToDisplay");
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __72__HFWalletUtilities_packageIconIdentifierForHome_shouldUseKeyholeAsset___block_invoke;
  v8[3] = &__block_descriptor_33_e28___NAFuture_16__0__NSNumber_8l;
  BOOL v9 = a4;
  uint64_t v6 = [v5 flatMap:v8];

  return v6;
}

id __72__HFWalletUtilities_packageIconIdentifierForHome_shouldUseKeyholeAsset___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 32)) {
    v1 = @"HFCAPackageIconIdentifierLockKeyhole";
  }
  else {
    v1 = @"HFCAPackageIconIdentifierLockKeypad";
  }
  id v2 = (void *)MEMORY[0x263F1CB00];
  id v3 = v1;
  BOOL v4 = [v2 currentTraitCollection];
  uint64_t v5 = [v4 userInterfaceStyle];

  if (v5 == 2) {
    uint64_t v6 = @"%@DarkModeMatteBlack";
  }
  else {
    uint64_t v6 = @"%@LightModeMatteBlack";
  }
  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", v6, v3);

  uint64_t v8 = [MEMORY[0x263F58190] futureWithResult:v7];

  return v8;
}

+ (id)walletKeyIconDescriptorForHome:(id)a3 shouldUseKeyholeAsset:(BOOL)a4 foriPhoneDevice:(BOOL)a5
{
  uint64_t v7 = objc_msgSend(a1, "packageIconIdentifierForHome:shouldUseKeyholeAsset:", a3);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __90__HFWalletUtilities_walletKeyIconDescriptorForHome_shouldUseKeyholeAsset_foriPhoneDevice___block_invoke;
  v10[3] = &__block_descriptor_34_e28___NAFuture_16__0__NSString_8l;
  BOOL v11 = a4;
  BOOL v12 = a5;
  uint64_t v8 = [v7 flatMap:v10];

  return v8;
}

id __90__HFWalletUtilities_walletKeyIconDescriptorForHome_shouldUseKeyholeAsset_foriPhoneDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 32)) {
    id v3 = @"Lock";
  }
  else {
    id v3 = @"Keypad";
  }
  BOOL v4 = NSString;
  if (*(unsigned char *)(a1 + 33)) {
    uint64_t v5 = @"iPhone";
  }
  else {
    uint64_t v5 = @"Watch";
  }
  id v6 = a2;
  uint64_t v7 = [v4 stringWithFormat:@"%@ %@", v3, v5];
  if (*(unsigned char *)(a1 + 33))
  {
    id v8 = objc_alloc_init(MEMORY[0x263F10468]);
    id v17 = 0;
    int v9 = [v8 canEvaluatePolicy:2 error:&v17];
    id v10 = v17;
    if (v9)
    {
      if ([v8 biometryType] == 1)
      {
        uint64_t v11 = [NSString stringWithFormat:@"%@ Home Button", v7];

        uint64_t v12 = 1;
        uint64_t v7 = (void *)v11;
      }
      else
      {
        uint64_t v12 = 2;
      }
      __int16 v13 = HFLogForCategory(0x43uLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        id v19 = "+[HFWalletUtilities walletKeyIconDescriptorForHome:shouldUseKeyholeAsset:foriPhoneDevice:]_block_invoke";
        __int16 v20 = 2048;
        uint64_t v21 = v12;
        __int16 v22 = 2112;
        id v23 = v10;
        _os_log_impl(&dword_20B986000, v13, OS_LOG_TYPE_DEFAULT, "(%s) biometryType is %ld. localAuthenticationError: %@", buf, 0x20u);
      }
    }
  }
  __int16 v14 = [[HFCAPackageIconDescriptor alloc] initWithPackageIdentifier:v6 state:v7];

  uint64_t v15 = [MEMORY[0x263F58190] futureWithResult:v14];

  return v15;
}

@end