@interface SGWalletOrderSuggestionHelpers
- (SGWalletOrderSuggestionHelpers)initWithOrderData:(id)a3;
- (id)attributedSubtitle;
- (id)merchantName;
- (id)orderDeepLink;
- (id)orderPreviewControllerForURL:(id)a3 completion:(id)a4;
- (id)walletLogo;
- (void)saveOrderForURL:(id)a3 completion:(id)a4;
@end

@implementation SGWalletOrderSuggestionHelpers

- (void).cxx_destruct
{
}

- (void)saveOrderForURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2050000000;
  v8 = (void *)getFKSaveOrderClass_softClass;
  uint64_t v17 = getFKSaveOrderClass_softClass;
  if (!getFKSaveOrderClass_softClass)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __getFKSaveOrderClass_block_invoke;
    v13[3] = &unk_1E612E840;
    v13[4] = &v14;
    __getFKSaveOrderClass_block_invoke((uint64_t)v13);
    v8 = (void *)v15[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v14, 8);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__SGWalletOrderSuggestionHelpers_saveOrderForURL_completion___block_invoke;
  v11[3] = &unk_1E612E4A0;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [v9 saveOrderAtURL:v6 completion:v11];
}

void __61__SGWalletOrderSuggestionHelpers_saveOrderForURL_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = sgLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      v8 = [v4 description];
      int v9 = 138412546;
      id v10 = v7;
      __int16 v11 = 2114;
      id v12 = v8;
      _os_log_error_impl(&dword_1B5B6C000, v5, OS_LOG_TYPE_ERROR, "%@: Failed to initialize Wallet preview controller. Error: %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)orderPreviewControllerForURL:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2050000000;
  v8 = (void *)getFKOrderImportPreviewControllerProviderClass_softClass;
  uint64_t v25 = getFKOrderImportPreviewControllerProviderClass_softClass;
  if (!getFKOrderImportPreviewControllerProviderClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getFKOrderImportPreviewControllerProviderClass_block_invoke;
    v27 = &unk_1E612E840;
    v28 = &v22;
    __getFKOrderImportPreviewControllerProviderClass_block_invoke((uint64_t)buf);
    v8 = (void *)v23[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v22, 8);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __74__SGWalletOrderSuggestionHelpers_orderPreviewControllerForURL_completion___block_invoke;
  v20[3] = &unk_1E612E4A0;
  v20[4] = self;
  id v10 = v7;
  id v21 = v10;
  id v19 = 0;
  __int16 v11 = [v9 makeViewControllerWithOrderURL:v6 completion:v20 error:&v19];
  id v12 = v19;
  if (v12)
  {
    uint64_t v13 = sgLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = (objc_class *)objc_opt_class();
      uint64_t v17 = NSStringFromClass(v16);
      v18 = [v12 description];
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v18;
      _os_log_error_impl(&dword_1B5B6C000, v13, OS_LOG_TYPE_ERROR, "%@: Failed to initialize Wallet preview controller. Error: %{public}@", buf, 0x16u);
    }
    id v14 = 0;
  }
  else
  {
    id v14 = v11;
  }

  return v14;
}

void __74__SGWalletOrderSuggestionHelpers_orderPreviewControllerForURL_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2 == 1)
  {
    id v6 = sgLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      id v9 = [v5 description];
      int v10 = 138412546;
      __int16 v11 = v8;
      __int16 v12 = 2114;
      uint64_t v13 = v9;
      _os_log_error_impl(&dword_1B5B6C000, v6, OS_LOG_TYPE_ERROR, "%@: Failed to initialize Wallet preview controller. Error: %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)walletLogo
{
  if (objc_opt_respondsToSelector())
  {
    v3 = [(FKSuggestionsOrderBanner *)self->_banner walletLogo];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)attributedSubtitle
{
  if (objc_opt_respondsToSelector())
  {
    v3 = [(FKSuggestionsOrderBanner *)self->_banner bannerAttributedSubtitle];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)orderDeepLink
{
  if (objc_opt_respondsToSelector())
  {
    v3 = [(FKSuggestionsOrderBanner *)self->_banner orderDeepLink];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)merchantName
{
  return (id)[(FKSuggestionsOrderBanner *)self->_banner merchantName];
}

- (SGWalletOrderSuggestionHelpers)initWithOrderData:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SGWalletOrderSuggestionHelpers;
  id v5 = [(SGWalletOrderSuggestionHelpers *)&v18 init];
  if (!v5) {
    goto LABEL_8;
  }
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2050000000;
  id v6 = (void *)getFKSuggestionsOrderBannerClass_softClass;
  uint64_t v22 = getFKSuggestionsOrderBannerClass_softClass;
  if (!getFKSuggestionsOrderBannerClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getFKSuggestionsOrderBannerClass_block_invoke;
    uint64_t v24 = &unk_1E612E840;
    uint64_t v25 = &v19;
    __getFKSuggestionsOrderBannerClass_block_invoke((uint64_t)buf);
    id v6 = (void *)v20[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v19, 8);
  id v17 = 0;
  uint64_t v8 = [[v7 alloc] initWithData:v4 error:&v17];
  id v9 = v17;
  banner = v5->_banner;
  v5->_banner = (FKSuggestionsOrderBanner *)v8;

  if (v9)
  {
    __int16 v11 = sgLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v14);
      uint64_t v16 = [v9 description];
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v16;
      _os_log_error_impl(&dword_1B5B6C000, v11, OS_LOG_TYPE_ERROR, "%@: Encountered Error during initialization. Error: %@", buf, 0x16u);
    }
    __int16 v12 = 0;
  }
  else
  {
LABEL_8:
    __int16 v12 = v5;
  }

  return v12;
}

@end