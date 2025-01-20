@interface AMSUICardMetadata
+ (id)_cardArtworkForPaymentPass:(id)a3 width:(double)a4;
+ (id)_passesForPassTypeIdentifier:(id)a3 serialNumber:(id)a4;
+ (id)appleCardIcon;
+ (id)appleCardIconString;
+ (id)metadataForPassTypeIdentifier:(id)a3 serialNumber:(id)a4 cardArtworkSize:(id)a5;
+ (void)metadataForPassTypeIdentifier:(id)a3 serialNumber:(id)a4 cardArtworkSize:(id)a5 completionHandler:(id)a6;
@end

@implementation AMSUICardMetadata

+ (id)appleCardIcon
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (appleCardIcon_onceToken != -1) {
    dispatch_once(&appleCardIcon_onceToken, &__block_literal_global_3);
  }
  v2 = AMSSetLogKeyIfNeeded();
  v3 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v3)
  {
    v3 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = objc_opt_class();
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v2;
    id v5 = *(id *)&buf[4];
    _os_log_impl(&dword_21C134000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Checking for card icon", buf, 0x16u);
  }
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2050000000;
  v6 = (void *)getPKVirtualCardClass_softClass;
  uint64_t v19 = getPKVirtualCardClass_softClass;
  if (!getPKVirtualCardClass_softClass)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getPKVirtualCardClass_block_invoke;
    v21 = &unk_2643E33D8;
    v22 = &v16;
    __getPKVirtualCardClass_block_invoke((uint64_t)buf);
    v6 = (void *)v17[3];
  }
  v7 = v6;
  _Block_object_dispose(&v16, 8);
  id v8 = objc_alloc_init(v7);
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "cardIcon", v16);
  }
  else
  {
    v11 = objc_msgSend(MEMORY[0x263F27CB8], "sharedConfig", v16);
    if (!v11)
    {
      v11 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v2;
      id v14 = v13;
      _os_log_impl(&dword_21C134000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch virtual card", buf, 0x16u);
    }
    v10 = 0;
  }

  return v10;
}

void __34__AMSUICardMetadata_appleCardIcon__block_invoke()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!PassKitUIFoundationLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __PassKitUIFoundationLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_2643E36A8;
    uint64_t v3 = 0;
    PassKitUIFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
    v0 = (void *)v1[0];
    if (PassKitUIFoundationLibraryCore_frameworkLibrary)
    {
      if (!v1[0]) {
        return;
      }
    }
    else
    {
      v0 = (void *)abort_report_np();
    }
    free(v0);
  }
}

+ (id)appleCardIconString
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v2 = [a1 appleCardIcon];
  uint64_t v3 = UIImagePNGRepresentation(v2);
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 base64EncodedStringWithOptions:1];
    v6 = [NSString stringWithFormat:@"data:image/png;base64,%@", v5];
  }
  else
  {
    v7 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v7)
    {
      v7 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_opt_class();
      id v10 = v9;
      v11 = AMSSetLogKeyIfNeeded();
      *(_DWORD *)buf = 138543618;
      id v14 = v9;
      __int16 v15 = 2114;
      uint64_t v16 = v11;
      _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch card icon", buf, 0x16u);
    }
    v6 = 0;
  }

  return v6;
}

+ (void)metadataForPassTypeIdentifier:(id)a3 serialNumber:(id)a4 cardArtworkSize:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __98__AMSUICardMetadata_metadataForPassTypeIdentifier_serialNumber_cardArtworkSize_completionHandler___block_invoke;
  block[3] = &unk_2643E3638;
  id v23 = v13;
  id v24 = a1;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

void __98__AMSUICardMetadata_metadataForPassTypeIdentifier_serialNumber_cardArtworkSize_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 64) metadataForPassTypeIdentifier:*(void *)(a1 + 32) serialNumber:*(void *)(a1 + 40) cardArtworkSize:*(void *)(a1 + 48)];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

+ (id)metadataForPassTypeIdentifier:(id)a3 serialNumber:(id)a4 cardArtworkSize:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v25 = a3;
  id v8 = a4;
  id v9 = a5;
  id v23 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v10 = AMSSetLogKeyIfNeeded();
  id v11 = [a1 _passesForPassTypeIdentifier:v25 serialNumber:v8];
  id v12 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v12)
  {
    id v12 = objc_msgSend(MEMORY[0x263F27CB8], "sharedConfig", v23);
  }
  id v13 = objc_msgSend(v12, "OSLogObject", v23);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = objc_opt_class();
    id v15 = NSNumber;
    id v16 = v14;
    id v17 = objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
    *(_DWORD *)buf = 138543874;
    v32 = v14;
    __int16 v33 = 2114;
    v34 = v10;
    __int16 v35 = 2114;
    v36 = v17;
    _os_log_impl(&dword_21C134000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found %{public}@ payment passes", buf, 0x20u);
  }
  objc_initWeak((id *)buf, a1);
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __80__AMSUICardMetadata_metadataForPassTypeIdentifier_serialNumber_cardArtworkSize___block_invoke;
  v26[3] = &unk_2643E3688;
  objc_copyWeak(&v30, (id *)buf);
  id v18 = v9;
  id v27 = v18;
  id v19 = v10;
  id v28 = v19;
  id v20 = v24;
  id v29 = v20;
  [v11 enumerateObjectsUsingBlock:v26];
  id v21 = (void *)[v20 copy];

  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)buf);

  return v21;
}

void __80__AMSUICardMetadata_metadataForPassTypeIdentifier_serialNumber_cardArtworkSize___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = objc_alloc_init(MEMORY[0x263F27BA8]);
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__0;
  v51 = __Block_byref_object_dispose__0;
  id v52 = 0;
  [*(id *)(a1 + 32) floatValue];
  if (v6 <= 0.0)
  {
    id v10 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v10)
    {
      id v10 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = objc_opt_class();
      uint64_t v13 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v13;
      id v14 = v12;
      _os_log_impl(&dword_21C134000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Caller did not specify a valid image size", buf, 0x16u);
    }
  }
  else
  {
    double v7 = v6;
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      uint64_t v8 = [WeakRetained _cardArtworkForPaymentPass:v3 width:v7];
      id v9 = (void *)v48[5];
      v48[5] = v8;
    }
    else
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __80__AMSUICardMetadata_metadataForPassTypeIdentifier_serialNumber_cardArtworkSize___block_invoke_19;
      block[3] = &unk_2643E3660;
      v45 = &v47;
      void block[4] = WeakRetained;
      id v44 = v3;
      double v46 = v7;
      dispatch_sync(MEMORY[0x263EF83A0], block);
    }
    id v15 = (void *)v48[5];
    if (v15)
    {
      id v10 = [v15 base64EncodedStringWithOptions:1];
      id v11 = [NSString stringWithFormat:@"data:image/png;base64,%@", v10];
      [v5 setCardArtwork:v11];
      [v5 setCardArtworkData:v48[5]];
    }
    else
    {
      id v10 = [MEMORY[0x263F27CB8] sharedConfig];
      if (!v10)
      {
        id v10 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      id v11 = [v10 OSLogObject];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v16 = objc_opt_class();
        uint64_t v17 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v16;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v17;
        id v18 = v16;
        _os_log_impl(&dword_21C134000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to find card artwork", buf, 0x16u);
      }
    }
  }

  id v19 = [v3 localizedDescription];
  [v5 setDescriptionShort:v19];

  id v20 = [v3 serialNumber];
  [v5 setSerialNumber:v20];

  id v21 = [v3 passTypeIdentifier];
  [v5 setPassTypeIdentifier:v21];

  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x2050000000;
  id v22 = (void *)getPKPaymentPassClass_softClass;
  uint64_t v56 = getPKPaymentPassClass_softClass;
  if (!getPKPaymentPassClass_softClass)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getPKPaymentPassClass_block_invoke;
    v58 = &unk_2643E33D8;
    v59 = &v53;
    __getPKPaymentPassClass_block_invoke((uint64_t)buf);
    id v22 = (void *)v54[3];
  }
  id v23 = v22;
  _Block_object_dispose(&v53, 8);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setSuffix:", objc_msgSend(v3, "performSelector:withObject:", sel_primaryAccountNumberSuffix, 0));
  }
  id v24 = [v3 paymentPass];
  id v25 = [v24 associatedAccountServiceAccountIdentifier];
  BOOL v26 = v25 == 0;

  if (v26)
  {
    __int16 v33 = [v3 paymentPass];
    int v34 = [v33 hasAssociatedPeerPaymentAccount];

    if (v34)
    {
      id v27 = [MEMORY[0x263F27CB8] sharedConfig];
      if (!v27)
      {
        id v27 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      id v28 = [v27 OSLogObject];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v35 = objc_opt_class();
        uint64_t v36 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v35;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v36;
        id v37 = v35;
        _os_log_impl(&dword_21C134000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found cash payment instrument", buf, 0x16u);
      }
      uint64_t v32 = 1;
    }
    else
    {
      id v27 = [MEMORY[0x263F27CB8] sharedConfig];
      if (!v27)
      {
        id v27 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      id v28 = [v27 OSLogObject];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v38 = objc_opt_class();
        uint64_t v39 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v38;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v39;
        id v40 = v38;
        _os_log_impl(&dword_21C134000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found credit payment instrument", buf, 0x16u);
      }
      uint64_t v32 = 0;
    }
  }
  else
  {
    id v27 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v27)
    {
      id v27 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v28 = [v27 OSLogObject];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = objc_opt_class();
      uint64_t v30 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v29;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v30;
      id v31 = v29;
      _os_log_impl(&dword_21C134000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found associated account", buf, 0x16u);
    }
    uint64_t v32 = 2;
  }

  [v5 setCardType:v32];
  v41 = [v3 paymentPass];
  v42 = [v41 devicePrimaryInAppPaymentApplication];
  objc_msgSend(v5, "setPaymentNetwork:", objc_msgSend(v42, "paymentNetworkIdentifier"));

  [*(id *)(a1 + 48) addObject:v5];
  _Block_object_dispose(&v47, 8);
}

uint64_t __80__AMSUICardMetadata_metadataForPassTypeIdentifier_serialNumber_cardArtworkSize___block_invoke_19(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _cardArtworkForPaymentPass:*(void *)(a1 + 40) width:*(double *)(a1 + 56)];
  return MEMORY[0x270F9A758]();
}

+ (id)_cardArtworkForPaymentPass:(id)a3 width:(double)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (_cardArtworkForPaymentPass_width__onceToken != -1) {
    dispatch_once(&_cardArtworkForPaymentPass_width__onceToken, &__block_literal_global_22);
  }
  objc_msgSend(v5, "cardImageWithDimensions:", a4, a4);
  float v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
  double v7 = v6;
  if (v6)
  {
    uint64_t v8 = UIImagePNGRepresentation(v6);
  }
  else
  {
    id v9 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v9)
    {
      id v9 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = objc_opt_class();
      id v12 = v11;
      uint64_t v13 = AMSSetLogKeyIfNeeded();
      int v15 = 138543618;
      id v16 = v11;
      __int16 v17 = 2114;
      id v18 = v13;
      _os_log_impl(&dword_21C134000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to obtain card artwork", (uint8_t *)&v15, 0x16u);
    }
    uint64_t v8 = 0;
  }

  return v8;
}

void __54__AMSUICardMetadata__cardArtworkForPaymentPass_width___block_invoke()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!PassKitUILibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __PassKitUILibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_2643E36D8;
    uint64_t v3 = 0;
    PassKitUILibraryCore_frameworkLibrary = _sl_dlopen();
    v0 = (void *)v1[0];
    if (PassKitUILibraryCore_frameworkLibrary)
    {
      if (!v1[0]) {
        return;
      }
    }
    else
    {
      v0 = (void *)abort_report_np();
    }
    free(v0);
  }
}

+ (id)_passesForPassTypeIdentifier:(id)a3 serialNumber:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  double v7 = AMSSetLogKeyIfNeeded();
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2050000000;
  uint64_t v8 = (void *)getPKPassLibraryClass_softClass;
  uint64_t v32 = getPKPassLibraryClass_softClass;
  if (!getPKPassLibraryClass_softClass)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getPKPassLibraryClass_block_invoke;
    __int16 v35 = &unk_2643E33D8;
    uint64_t v36 = &v29;
    __getPKPassLibraryClass_block_invoke((uint64_t)buf);
    uint64_t v8 = (void *)v30[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v29, 8);
  id v10 = objc_alloc_init(v9);
  if (v5) {
    BOOL v11 = v6 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  int v12 = !v11;
  uint64_t v13 = [MEMORY[0x263F27CB8] sharedConfig];
  id v14 = (void *)v13;
  if (v12)
  {
    if (!v13)
    {
      id v14 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    int v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v16;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v7;
      id v17 = v16;
      _os_log_impl(&dword_21C134000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting to search for specific card", buf, 0x16u);
    }
    uint64_t v18 = [v10 passWithPassTypeIdentifier:v5 serialNumber:v6];
    uint64_t v19 = (void *)v18;
    if (v18)
    {
      uint64_t v33 = v18;
      id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];
    }
    else
    {
      id v24 = [MEMORY[0x263F27CB8] sharedConfig];
      if (!v24)
      {
        id v24 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      id v25 = [v24 OSLogObject];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        BOOL v26 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v26;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v7;
        id v27 = v26;
        _os_log_impl(&dword_21C134000, v25, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Card metadata failed for no card", buf, 0x16u);
      }
      id v20 = 0;
    }
  }
  else
  {
    if (!v13)
    {
      id v14 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v21 = [v14 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v22;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v7;
      id v23 = v22;
      _os_log_impl(&dword_21C134000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting to search for all cards", buf, 0x16u);
    }
    id v20 = [v10 passesOfType:1];
  }

  return v20;
}

@end