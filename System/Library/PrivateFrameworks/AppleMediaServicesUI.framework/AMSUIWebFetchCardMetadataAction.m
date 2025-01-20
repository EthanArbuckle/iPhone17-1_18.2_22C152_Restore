@interface AMSUIWebFetchCardMetadataAction
- (AMSUIWebFetchCardMetadataAction)initWithJSObject:(id)a3 context:(id)a4;
- (NSNumber)cardArtworkSize;
- (NSString)passTypeIdentifier;
- (NSString)serialNumber;
- (id)runAction;
- (void)setCardArtworkSize:(id)a3;
- (void)setPassTypeIdentifier:(id)a3;
- (void)setSerialNumber:(id)a3;
@end

@implementation AMSUIWebFetchCardMetadataAction

- (AMSUIWebFetchCardMetadataAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AMSUIWebFetchCardMetadataAction;
  v7 = [(AMSUIWebAction *)&v18 initWithJSObject:v6 context:a4];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"cardArtworkSize"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }

    cardArtworkSize = v7->_cardArtworkSize;
    v7->_cardArtworkSize = v9;

    v11 = [v6 objectForKeyedSubscript:@"passTypeIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }

    passTypeIdentifier = v7->_passTypeIdentifier;
    v7->_passTypeIdentifier = v12;

    v14 = [v6 objectForKeyedSubscript:@"serialNumber"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }

    serialNumber = v7->_serialNumber;
    v7->_serialNumber = v15;
  }
  return v7;
}

- (id)runAction
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v33.receiver = self;
  v33.super_class = (Class)AMSUIWebFetchCardMetadataAction;
  id v3 = [(AMSUIWebAction *)&v33 runAction];
  v4 = [(AMSUIWebAction *)self context];
  v5 = [v4 bag];

  if ([MEMORY[0x263F27B98] shouldUseExtendedEnrollmentWithBag:v5])
  {
    id v6 = [(AMSUIWebFetchCardMetadataAction *)self passTypeIdentifier];
    if ([v6 isEqualToString:@"com.apple.AppleMediaServices.PassTypeIdentifier.AppleCard"])
    {
      v7 = +[AMSUICardMetadata appleCardIconString];
      uint64_t v8 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
      v9 = (void *)v8;
      if (v7)
      {
        if (!v8)
        {
          v9 = [MEMORY[0x263F27CB8] sharedConfig];
        }
        v10 = [v9 OSLogObject];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = objc_opt_class();
          v12 = AMSLogKey();
          *(_DWORD *)buf = 138543618;
          uint64_t v36 = v11;
          __int16 v37 = 2114;
          v38 = v12;
          _os_log_impl(&dword_21C134000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully retrieved the apple card icon.", buf, 0x16u);
        }
        id v13 = objc_alloc_init(MEMORY[0x263F27BA8]);
        [v13 setCardArtwork:v7];
        v14 = (void *)MEMORY[0x263F27E10];
        v15 = [v13 dictionary];
        v34 = v15;
        v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
        id v17 = [v14 promiseWithResult:v16];
      }
      else
      {
        if (!v8)
        {
          v9 = [MEMORY[0x263F27CB8] sharedConfig];
        }
        v26 = [v9 OSLogObject];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          uint64_t v27 = objc_opt_class();
          v28 = AMSLogKey();
          *(_DWORD *)buf = 138543618;
          uint64_t v36 = v27;
          __int16 v37 = 2114;
          v38 = v28;
          _os_log_impl(&dword_21C134000, v26, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed for no apple card icon.", buf, 0x16u);
        }
        v29 = (void *)MEMORY[0x263F27E10];
        AMSError();
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        id v17 = [v29 promiseWithError:v13];
      }
    }
    else
    {
      id v23 = objc_alloc_init(MEMORY[0x263F27E10]);
      v24 = [(AMSUIWebFetchCardMetadataAction *)self serialNumber];
      v25 = [(AMSUIWebFetchCardMetadataAction *)self cardArtworkSize];
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __44__AMSUIWebFetchCardMetadataAction_runAction__block_invoke;
      v31[3] = &unk_2643E4E38;
      id v17 = v23;
      id v32 = v17;
      +[AMSUICardMetadata metadataForPassTypeIdentifier:v6 serialNumber:v24 cardArtworkSize:v25 completionHandler:v31];

      v7 = v32;
    }
  }
  else
  {
    objc_super v18 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v18)
    {
      objc_super v18 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v19 = [v18 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = objc_opt_class();
      v21 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v36 = v20;
      __int16 v37 = 2114;
      v38 = v21;
      _os_log_impl(&dword_21C134000, v19, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed for feature not enabled.", buf, 0x16u);
    }
    v22 = (void *)MEMORY[0x263F27E10];
    id v6 = AMSError();
    id v17 = [v22 promiseWithError:v6];
  }

  return v17;
}

void __44__AMSUIWebFetchCardMetadataAction_runAction__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "ams_mapWithTransform:", &__block_literal_global_24);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 finishWithResult:v3];
}

uint64_t __44__AMSUIWebFetchCardMetadataAction_runAction__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 dictionary];
}

- (NSNumber)cardArtworkSize
{
  return self->_cardArtworkSize;
}

- (void)setCardArtworkSize:(id)a3
{
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_cardArtworkSize, 0);
}

@end