@interface ASCLockupProductDetails
+ (id)URLForLockupID:(id)a3 ofKind:(id)a4 offerFlags:(int64_t)a5 queryParameters:(id)a6;
+ (id)URLForLockupID:(id)a3 ofKind:(id)a4 withOfferFlags:(int64_t)a5;
+ (id)queryParametersForLockup:(id)a3;
- (ASCLockup)lockup;
- (ASCLockupProductDetails)initWithLockup:(id)a3;
- (ASCLockupProductDetails)initWithLockup:(id)a3 storeSheetHostBundleID:(id)a4 storeSheetUsageContext:(id)a5;
- (ASCLockupProductDetails)initWithLockup:(id)a3 storeSheetHostBundleID:(id)a4 storeSheetUsageContext:(id)a5 parameters:(id)a6;
- (ASCLockupProductDetailsObserver)observer;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOpenAppCallbackEnabled;
- (BOOL)isWebBrowser;
- (NSDictionary)parameters;
- (NSString)description;
- (NSString)storeSheetHostBundleID;
- (NSString)storeSheetUsageContext;
- (unint64_t)hash;
- (void)present:(id)a3;
- (void)presentFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)productViewController:(id)a3 didFinishWithResult:(int64_t)a4;
- (void)productViewController:(id)a3 userDidInteractWithProduct:(unint64_t)a4;
- (void)setObserver:(id)a3;
- (void)setOpenAppCallbackEnabled:(BOOL)a3;
- (void)setWebBrowser:(BOOL)a3;
@end

@implementation ASCLockupProductDetails

+ (id)URLForLockupID:(id)a3 ofKind:(id)a4 withOfferFlags:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  +[ASCEligibility assertCurrentProcessEligibility]();
  v10 = [a1 URLForLockupID:v9 ofKind:v8 offerFlags:a5 queryParameters:0];

  return v10;
}

+ (id)URLForLockupID:(id)a3 ofKind:(id)a4 offerFlags:(int64_t)a5 queryParameters:(id)a6
{
  v28[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a6;
  +[ASCEligibility assertCurrentProcessEligibility]();
  v11 = [v8 stringValue];
  v12 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
  v13 = [v11 stringByAddingPercentEncodingWithAllowedCharacters:v12];
  id v14 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v14 setScheme:@"itms-apps"];
  if (![v9 isEqualToString:@"app"]) {
    ASCUnknownEnumCase(@"ASCLockupKind", v9);
  }
  [v14 setPercentEncodedHost:@"apps.apple.com"];
  v15 = NSString;
  v28[0] = @"/";
  v28[1] = @"app";
  v16 = [@"id" stringByAppendingString:v13];
  v28[2] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
  v18 = [v15 pathWithComponents:v17];
  [v14 setPercentEncodedPath:v18];

  if (v10)
  {
    v19 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __76__ASCLockupProductDetails_URLForLockupID_ofKind_offerFlags_queryParameters___block_invoke;
    v26[3] = &unk_1E645D9E0;
    id v27 = v19;
    id v20 = v19;
    [v10 enumerateKeysAndObjectsUsingBlock:v26];
    [v14 setQueryItems:v20];
  }
  uint64_t v21 = [v14 URL];
  if (!v21)
  {
    uint64_t v24 = [[NSString alloc] initWithFormat:@"Lockup id %@ of kind %@ is invalid", v8, v9];
    id v25 = objc_alloc(MEMORY[0x1E4F1CA00]);
    objc_exception_throw((id)[v25 initWithName:*MEMORY[0x1E4F1C3C8] reason:v24 userInfo:0]);
  }
  v22 = (void *)v21;

  return v22;
}

void __76__ASCLockupProductDetails_URLForLockupID_ofKind_offerFlags_queryParameters___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  id v4 = [MEMORY[0x1E4F290C8] queryItemWithName:a2 value:a3];
  [v3 addObject:v4];
}

+ (id)queryParametersForLockup:(id)a3
{
  id v3 = a3;
  +[ASCEligibility assertCurrentProcessEligibility]();
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v5 = [v3 productVariantID];

  if (v5)
  {
    v6 = [v3 productVariantID];
    [v4 setObject:v6 forKeyedSubscript:@"ppid"];
  }
  v7 = [v3 offer];
  __int16 v8 = [v7 flags];

  if ((v8 & 0x200) != 0) {
    [v4 setObject:@"1" forKeyedSubscript:@"isViewOnly"];
  }
  if ([v4 count]) {
    id v9 = (void *)[v4 copy];
  }
  else {
    id v9 = 0;
  }

  return v9;
}

- (ASCLockupProductDetails)initWithLockup:(id)a3
{
  return [(ASCLockupProductDetails *)self initWithLockup:a3 storeSheetHostBundleID:0 storeSheetUsageContext:0 parameters:0];
}

- (ASCLockupProductDetails)initWithLockup:(id)a3 storeSheetHostBundleID:(id)a4 storeSheetUsageContext:(id)a5
{
  return [(ASCLockupProductDetails *)self initWithLockup:a3 storeSheetHostBundleID:a4 storeSheetUsageContext:a5 parameters:0];
}

- (ASCLockupProductDetails)initWithLockup:(id)a3 storeSheetHostBundleID:(id)a4 storeSheetUsageContext:(id)a5 parameters:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  +[ASCEligibility assertCurrentProcessEligibility]();
  v24.receiver = self;
  v24.super_class = (Class)ASCLockupProductDetails;
  id v14 = [(ASCLockupProductDetails *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    lockup = v14->_lockup;
    v14->_lockup = (ASCLockup *)v15;

    uint64_t v17 = [v11 copy];
    storeSheetHostBundleID = v14->_storeSheetHostBundleID;
    v14->_storeSheetHostBundleID = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    storeSheetUsageContext = v14->_storeSheetUsageContext;
    v14->_storeSheetUsageContext = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    parameters = v14->_parameters;
    v14->_parameters = (NSDictionary *)v21;
  }
  return v14;
}

- (void)presentFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = +[ASCWorkspace sharedWorkspace];
  int v11 = [v10 isExtension];

  if (v11)
  {
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __73__ASCLockupProductDetails_presentFromViewController_animated_completion___block_invoke;
    v66[3] = &unk_1E645E140;
    id v67 = v9;
    [(ASCLockupProductDetails *)self present:v66];

    goto LABEL_46;
  }
  id v12 = [(ASCLockupProductDetails *)self lockup];
  id v13 = [v12 id];
  id v14 = +[ASCAdamID invalidAdamID];
  int v15 = [v13 isEqual:v14];

  BOOL v16 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO);
  if (!v15)
  {
    if (v16)
    {
      uint64_t v19 = [(ASCLockupProductDetails *)self lockup];
      id v20 = [v19 id];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v20;
      _os_log_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Presenting product details for lockup %{public}@", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v68 = 0;
    v69 = &v68;
    uint64_t v70 = 0x2050000000;
    uint64_t v21 = (void *)getSKStoreProductViewControllerClass_softClass;
    uint64_t v71 = getSKStoreProductViewControllerClass_softClass;
    if (!getSKStoreProductViewControllerClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v73 = __getSKStoreProductViewControllerClass_block_invoke;
      v74 = &unk_1E645D5A8;
      v75 = &v68;
      __getSKStoreProductViewControllerClass_block_invoke((uint64_t)&buf);
      uint64_t v21 = (void *)v69[3];
    }
    v22 = v21;
    _Block_object_dispose(&v68, 8);
    id v60 = objc_alloc_init(v22);
    v23 = [(ASCLockupProductDetails *)self parameters];
    if (v23)
    {
      objc_super v24 = [(ASCLockupProductDetails *)self parameters];
      id v25 = (void *)[v24 mutableCopy];
    }
    else
    {
      id v25 = [MEMORY[0x1E4F1CA60] dictionary];
    }

    v26 = [(ASCLockupProductDetails *)self lockup];
    id v27 = [v26 id];
    v28 = [v27 numberValue];
    uint64_t v68 = 0;
    v69 = &v68;
    uint64_t v70 = 0x2020000000;
    v29 = (void *)getSKStoreProductParameterITunesItemIdentifierSymbolLoc_ptr;
    uint64_t v71 = getSKStoreProductParameterITunesItemIdentifierSymbolLoc_ptr;
    if (!getSKStoreProductParameterITunesItemIdentifierSymbolLoc_ptr)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v73 = __getSKStoreProductParameterITunesItemIdentifierSymbolLoc_block_invoke;
      v74 = &unk_1E645D5A8;
      v75 = &v68;
      v30 = (void *)StoreKitLibrary();
      v31 = dlsym(v30, "SKStoreProductParameterITunesItemIdentifier");
      *(void *)(v75[1] + 24) = v31;
      getSKStoreProductParameterITunesItemIdentifierSymbolLoc_ptr = *(void *)(v75[1] + 24);
      v29 = (void *)v69[3];
    }
    _Block_object_dispose(&v68, 8);
    if (v29)
    {
      [v25 setObject:v28 forKeyedSubscript:*v29];

      [v60 setDelegate:self];
      if (StoreKitLibraryCore())
      {
        if (getSKStoreProductParameterCustomProductPageIdentifierSymbolLoc())
        {
          v32 = [(ASCLockupProductDetails *)self lockup];
          v33 = [v32 productVariantID];
          BOOL v34 = v33 == 0;

          if (!v34)
          {
            v35 = [(ASCLockupProductDetails *)self lockup];
            v36 = [v35 productVariantID];
            SKStoreProductParameterCustomProductPageIdentifierSymbolLoc = (void *)getSKStoreProductParameterCustomProductPageIdentifierSymbolLoc();
            if (!SKStoreProductParameterCustomProductPageIdentifierSymbolLoc) {
              goto LABEL_47;
            }
            [v25 setObject:v36 forKeyedSubscript:*SKStoreProductParameterCustomProductPageIdentifierSymbolLoc];
          }
        }
      }
      v38 = [(ASCLockupProductDetails *)self storeSheetHostBundleID];
      BOOL v39 = v38 == 0;

      if (!v39)
      {
        v40 = [(ASCLockupProductDetails *)self storeSheetHostBundleID];
        [v60 setHostBundleIdentifier:v40];
      }
      v41 = [(ASCLockupProductDetails *)self storeSheetUsageContext];
      BOOL v42 = v41 == 0;

      if (!v42)
      {
        v43 = [(ASCLockupProductDetails *)self storeSheetUsageContext];
        [v60 setUsageContext:v43];
      }
      v44 = [(ASCLockupProductDetails *)self lockup];
      v45 = [v44 featureWithClass:objc_opt_class()];
      BOOL v46 = v45 == 0;

      if (!v46)
      {
        uint64_t v68 = 0;
        v69 = &v68;
        uint64_t v70 = 0x2020000000;
        v47 = (void *)getSKStoreProductParameterIsViewOnlySymbolLoc_ptr;
        uint64_t v71 = getSKStoreProductParameterIsViewOnlySymbolLoc_ptr;
        if (!getSKStoreProductParameterIsViewOnlySymbolLoc_ptr)
        {
          *(void *)&long long buf = MEMORY[0x1E4F143A8];
          *((void *)&buf + 1) = 3221225472;
          v73 = __getSKStoreProductParameterIsViewOnlySymbolLoc_block_invoke;
          v74 = &unk_1E645D5A8;
          v75 = &v68;
          v48 = (void *)StoreKitLibrary();
          v49 = dlsym(v48, "SKStoreProductParameterIsViewOnly");
          *(void *)(v75[1] + 24) = v49;
          getSKStoreProductParameterIsViewOnlySymbolLoc_ptr = *(void *)(v75[1] + 24);
          v47 = (void *)v69[3];
        }
        _Block_object_dispose(&v68, 8);
        if (!v47) {
          goto LABEL_47;
        }
        [v25 setValue:MEMORY[0x1E4F1CC38] forKey:*v47];
      }
      if ([(ASCLockupProductDetails *)self isOpenAppCallbackEnabled])
      {
        uint64_t v68 = 0;
        v69 = &v68;
        uint64_t v70 = 0x2020000000;
        v50 = (void *)getSKStoreProductParameterEnableOpenAppCallbackSymbolLoc_ptr;
        uint64_t v71 = getSKStoreProductParameterEnableOpenAppCallbackSymbolLoc_ptr;
        if (!getSKStoreProductParameterEnableOpenAppCallbackSymbolLoc_ptr)
        {
          *(void *)&long long buf = MEMORY[0x1E4F143A8];
          *((void *)&buf + 1) = 3221225472;
          v73 = __getSKStoreProductParameterEnableOpenAppCallbackSymbolLoc_block_invoke;
          v74 = &unk_1E645D5A8;
          v75 = &v68;
          v51 = (void *)StoreKitLibrary();
          v52 = dlsym(v51, "SKStoreProductParameterEnableOpenAppCallback");
          *(void *)(v75[1] + 24) = v52;
          getSKStoreProductParameterEnableOpenAppCallbackSymbolLoc_ptr = *(void *)(v75[1] + 24);
          v50 = (void *)v69[3];
        }
        _Block_object_dispose(&v68, 8);
        if (!v50) {
          goto LABEL_47;
        }
        [v25 setValue:MEMORY[0x1E4F1CC38] forKey:*v50];
      }
      if (![(ASCLockupProductDetails *)self isWebBrowser])
      {
LABEL_42:
        [v60 loadProductWithParameters:v25 completionBlock:0];
        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = __73__ASCLockupProductDetails_presentFromViewController_animated_completion___block_invoke_44;
        v61[3] = &unk_1E645E168;
        id v62 = v8;
        id v58 = v60;
        id v63 = v58;
        BOOL v65 = a4;
        id v64 = v9;
        v59 = (void (**)(void))MEMORY[0x1C8768F90](v61);
        if ([MEMORY[0x1E4F29060] isMainThread]) {
          v59[2](v59);
        }
        else {
          dispatch_async(MEMORY[0x1E4F14428], v59);
        }

        goto LABEL_46;
      }
      uint64_t v68 = 0;
      v69 = &v68;
      uint64_t v70 = 0x2020000000;
      v53 = (void *)getSKStoreProductParameterWebBrowserSymbolLoc_ptr;
      uint64_t v71 = getSKStoreProductParameterWebBrowserSymbolLoc_ptr;
      if (!getSKStoreProductParameterWebBrowserSymbolLoc_ptr)
      {
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        v73 = __getSKStoreProductParameterWebBrowserSymbolLoc_block_invoke;
        v74 = &unk_1E645D5A8;
        v75 = &v68;
        v54 = (void *)StoreKitLibrary();
        v55 = dlsym(v54, "SKStoreProductParameterWebBrowser");
        *(void *)(v75[1] + 24) = v55;
        getSKStoreProductParameterWebBrowserSymbolLoc_ptr = *(void *)(v75[1] + 24);
        v53 = (void *)v69[3];
      }
      _Block_object_dispose(&v68, 8);
      if (v53)
      {
        [v25 setValue:MEMORY[0x1E4F1CC38] forKey:*v53];
        v57 = ASCLocalizedString(@"WEB_BROWSER_PRODUCT_DETAILS_CANCEL_BUTTON_TITLE", v56);
        [v60 setCancelButtonTitle:v57];

        [v60 setShowsStoreButton:0];
        goto LABEL_42;
      }
    }
LABEL_47:
    ASCAXLabelForElements_cold_1();
    __break(1u);
  }
  if (v16)
  {
    uint64_t v17 = [(ASCLockupProductDetails *)self lockup];
    v18 = [v17 id];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v18;
    _os_log_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Not presenting product details for lockup %{public}@ because its ID is invalid.", (uint8_t *)&buf, 0xCu);
  }
  if (v9) {
    (*((void (**)(id, uint64_t, void))v9 + 2))(v9, 1, 0);
  }
LABEL_46:
}

uint64_t __73__ASCLockupProductDetails_presentFromViewController_animated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __73__ASCLockupProductDetails_presentFromViewController_animated_completion___block_invoke_44(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__ASCLockupProductDetails_presentFromViewController_animated_completion___block_invoke_2;
  v4[3] = &unk_1E645D6C8;
  id v5 = *(id *)(a1 + 48);
  [v1 presentViewController:v2 animated:v3 completion:v4];
}

uint64_t __73__ASCLockupProductDetails_presentFromViewController_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, 1, 1);
  }
  return result;
}

- (void)present:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  id v5 = [(ASCLockupProductDetails *)self lockup];
  v6 = [v5 id];
  v7 = +[ASCAdamID invalidAdamID];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      id v9 = [(ASCLockupProductDetails *)self lockup];
      id v10 = [v9 id];
      *(_DWORD *)long long buf = 138543362;
      v32 = v10;
      _os_log_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Not presenting product details for lockup %{public}@ because ID is invalid.", buf, 0xCu);
    }
    if (v4) {
      v4[2](v4, 0);
    }
  }
  else
  {
    int v11 = [(ASCLockupProductDetails *)self lockup];
    id v12 = +[ASCLockupProductDetails queryParametersForLockup:v11];

    id v13 = [(ASCLockupProductDetails *)self parameters];

    if (v13)
    {
      id v14 = [(ASCLockupProductDetails *)self parameters];
      int v15 = (void *)[v14 mutableCopy];

      if (v12) {
        [v15 addEntriesFromDictionary:v12];
      }
    }
    else
    {
      int v15 = (void *)[v12 mutableCopy];
    }
    id v27 = v12;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      BOOL v16 = [(ASCLockupProductDetails *)self lockup];
      uint64_t v17 = [v16 id];
      *(_DWORD *)long long buf = 138543362;
      v32 = v17;
      _os_log_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Presenting product details for lockup %{public}@", buf, 0xCu);
    }
    v18 = [(ASCLockupProductDetails *)self lockup];
    uint64_t v19 = [v18 id];
    id v20 = [(ASCLockupProductDetails *)self lockup];
    uint64_t v21 = [v20 kind];
    v22 = [(ASCLockupProductDetails *)self lockup];
    v23 = [v22 offer];
    objc_super v24 = +[ASCLockupProductDetails URLForLockupID:ofKind:offerFlags:queryParameters:](ASCLockupProductDetails, "URLForLockupID:ofKind:offerFlags:queryParameters:", v19, v21, [v23 flags], v15);

    id v25 = +[ASCUtilities shared];
    v26 = [v25 openURL:v24];

    if (v4)
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __35__ASCLockupProductDetails_present___block_invoke;
      v29[3] = &unk_1E645E190;
      v30 = v4;
      [v26 addFinishBlock:v29];
    }
  }
}

uint64_t __35__ASCLockupProductDetails_present___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)productViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    v6 = [NSNumber numberWithInteger:a4];
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "productViewController didFinishWithResult: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  v7 = [(ASCLockupProductDetails *)self observer];
  [v7 productDetailsUserDidInteractWithApp:self interactionType:@"dismissed"];
}

- (void)productViewController:(id)a3 userDidInteractWithProduct:(unint64_t)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    v7 = [NSNumber numberWithUnsignedInteger:a4];
    int v10 = 138543362;
    int v11 = v7;
    _os_log_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "productViewController userDidInteractWithProduct: %{public}@", (uint8_t *)&v10, 0xCu);
  }
  if (a4 <= 2)
  {
    int v8 = off_1E645E1C8[a4];
    id v9 = [(ASCLockupProductDetails *)self observer];
    [v9 productDetailsUserDidInteractWithApp:self interactionType:*v8];
  }
}

- (unint64_t)hash
{
  uint64_t v2 = [(ASCLockupProductDetails *)self lockup];
  unint64_t v3 = [v2 hash] + 2;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  id v4 = self;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    v7 = [(ASCLockupProductDetails *)v4 lockup];
    uint64_t v8 = [(ASCLockupProductDetails *)v6 lockup];
    id v9 = (void *)v8;
    if (v7 && v8) {
      char v10 = [v7 isEqual:v8];
    }
    else {
      char v10 = v7 == (void *)v8;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (NSString)description
{
  unint64_t v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCLockupProductDetails *)self lockup];
  [(ASCDescriber *)v3 addObject:v4 withName:@"lockup"];

  id v5 = [(ASCDescriber *)v3 finalizeDescription];

  return (NSString *)v5;
}

- (ASCLockup)lockup
{
  return self->_lockup;
}

- (NSString)storeSheetHostBundleID
{
  return self->_storeSheetHostBundleID;
}

- (NSString)storeSheetUsageContext
{
  return self->_storeSheetUsageContext;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (ASCLockupProductDetailsObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (ASCLockupProductDetailsObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (BOOL)isOpenAppCallbackEnabled
{
  return self->_openAppCallbackEnabled;
}

- (void)setOpenAppCallbackEnabled:(BOOL)a3
{
  self->_openAppCallbackEnabled = a3;
}

- (BOOL)isWebBrowser
{
  return self->_webBrowser;
}

- (void)setWebBrowser:(BOOL)a3
{
  self->_webBrowser = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_storeSheetUsageContext, 0);
  objc_storeStrong((id *)&self->_storeSheetHostBundleID, 0);

  objc_storeStrong((id *)&self->_lockup, 0);
}

@end