@interface HUCameraUpgradeOfferBannerItem
- (BOOL)hasFetchedOfferResults;
- (BOOL)hasOpportunityBubble;
- (HFUserItem)userItem;
- (HUCameraUpgradeOfferBannerItem)initWithHome:(id)a3;
- (ICQOpportunitySheetDetailsSpecification)sheetDetails;
- (NSNumber)planLimit;
- (NSString)bannerActionText;
- (NSString)messageKey;
- (NSString)offerActionTitle;
- (NSString)offerMessage;
- (NSString)offerTitle;
- (NSString)sheetActionText;
- (NSString)sheetMessage;
- (NSString)sheetTitle;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)fetchPlanLimit;
- (id)fetchPremiumOffer;
- (id)hiddenOfferDisplayOutcome;
- (id)offerDisplayOutcome;
- (void)savePlanLimit:(id)a3 error:(id)a4;
- (void)savePremiumOffer:(id)a3 error:(id)a4;
- (void)setHasFetchedOfferResults:(BOOL)a3;
- (void)setHasOpportunityBubble:(BOOL)a3;
- (void)setMessageKey:(id)a3;
- (void)setOfferActionTitle:(id)a3;
- (void)setOfferMessage:(id)a3;
- (void)setOfferTitle:(id)a3;
- (void)setPlanLimit:(id)a3;
- (void)setSheetActionText:(id)a3;
- (void)setSheetDetails:(id)a3;
- (void)setSheetMessage:(id)a3;
- (void)setSheetTitle:(id)a3;
- (void)setUserItem:(id)a3;
@end

@implementation HUCameraUpgradeOfferBannerItem

- (id)_subclass_updateWithOptions:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F68720]];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    objc_initWeak(&location, self);
    v7 = (void *)MEMORY[0x1E4F7A0D8];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __62__HUCameraUpgradeOfferBannerItem__subclass_updateWithOptions___block_invoke;
    v30[3] = &unk_1E638A320;
    objc_copyWeak(&v31, &location);
    v8 = [v7 futureWithBlock:v30];
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
  else
  {
    v9 = [(HUBannerItem *)self home];
    v10 = [(HUBannerItem *)self home];
    v11 = [v10 currentUser];
    int v12 = objc_msgSend(v9, "hf_userIsOwner:", v11);

    v13 = [(HUCameraUpgradeOfferBannerItem *)self userItem];
    int v14 = [v13 hasDismissedCameraUpgradeBanner];

    v15 = [(HUBannerItem *)self home];
    v16 = objc_msgSend(v15, "hf_allCameraProfilesSupportingRecording");
    v17 = (void *)[v16 count];

    v18 = HFLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location) = 67109632;
      HIDWORD(location) = v12;
      __int16 v33 = 1024;
      int v34 = v14;
      __int16 v35 = 2048;
      v36 = v17;
      _os_log_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEFAULT, "Subclass update with options called for OfferBannerItem (isOwner %d, hasDismissedBanner %d, cameraCount %lu)", (uint8_t *)&location, 0x18u);
    }

    int v19 = [(HUBannerItem *)self forceShowBanner];
    if (v12 && (v14 & ~v19 & 1) == 0 && v17)
    {
      if ([(HUCameraUpgradeOfferBannerItem *)self hasFetchedOfferResults])
      {
        v20 = (void *)MEMORY[0x1E4F7A0D8];
        v21 = [(HUCameraUpgradeOfferBannerItem *)self offerDisplayOutcome];
        v8 = [v20 futureWithResult:v21];
      }
      else
      {
        objc_initWeak(&location, self);
        v23 = [(HUCameraUpgradeOfferBannerItem *)self fetchPremiumOffer];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __62__HUCameraUpgradeOfferBannerItem__subclass_updateWithOptions___block_invoke_2;
        v25[3] = &unk_1E638DD28;
        objc_copyWeak(v26, &location);
        char v27 = v12;
        char v28 = 0;
        v26[1] = v17;
        v8 = [v23 flatMap:v25];
        objc_destroyWeak(v26);

        objc_destroyWeak(&location);
      }
    }
    else
    {
      v22 = HFLogForCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location) = 0;
        _os_log_impl(&dword_1BE345000, v22, OS_LOG_TYPE_DEFAULT, "Not showing offer banner because user is not owner, or has no cameras supporting recording, or already upgraded.", (uint8_t *)&location, 2u);
      }

      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __62__HUCameraUpgradeOfferBannerItem__subclass_updateWithOptions___block_invoke_33;
      v29[3] = &unk_1E6385108;
      v29[4] = self;
      v8 = [MEMORY[0x1E4F7A0D8] futureWithBlock:v29];
    }
  }

  return v8;
}

- (HFUserItem)userItem
{
  return self->_userItem;
}

- (HUCameraUpgradeOfferBannerItem)initWithHome:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUCameraUpgradeOfferBannerItem;
  v5 = [(HUBannerItem *)&v11 initWithHome:v4];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F69710]);
    v7 = [v4 currentUser];
    uint64_t v8 = [v6 initWithHome:v4 user:v7 nameStyle:0];
    userItem = v5->_userItem;
    v5->_userItem = (HFUserItem *)v8;
  }
  return v5;
}

void __62__HUCameraUpgradeOfferBannerItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [WeakRetained hiddenOfferDisplayOutcome];
  [v3 finishWithResult:v4];
}

void __62__HUCameraUpgradeOfferBannerItem__subclass_updateWithOptions___block_invoke_33(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 hiddenOfferDisplayOutcome];
  [v3 finishWithResult:v4];
}

- (id)hiddenOfferDisplayOutcome
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F692F0]);
  [v2 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  return v2;
}

id __62__HUCameraUpgradeOfferBannerItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained hasOpportunityBubble])
  {
    id v3 = [WeakRetained fetchPlanLimit];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62__HUCameraUpgradeOfferBannerItem__subclass_updateWithOptions___block_invoke_3;
    v9[3] = &unk_1E638DD00;
    __int16 v10 = *(_WORD *)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 40);
    v9[4] = WeakRetained;
    v9[5] = v4;
    uint64_t v5 = [v3 flatMap:v9];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F7A0D8];
    id v3 = [WeakRetained hiddenOfferDisplayOutcome];
    uint64_t v5 = [v6 futureWithResult:v3];
  }
  v7 = (void *)v5;

  return v7;
}

id __62__HUCameraUpgradeOfferBannerItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = *(unsigned __int8 *)(a1 + 48);
    int v16 = *(unsigned __int8 *)(a1 + 49);
    uint64_t v17 = *(void *)(a1 + 40);
    id v3 = [*(id *)(a1 + 32) offerTitle];
    uint64_t v4 = [*(id *)(a1 + 32) offerMessage];
    uint64_t v5 = [*(id *)(a1 + 32) offerActionTitle];
    id v6 = [*(id *)(a1 + 32) sheetActionText];
    v7 = [*(id *)(a1 + 32) planLimit];
    uint64_t v8 = [*(id *)(a1 + 32) sheetTitle];
    v9 = [*(id *)(a1 + 32) sheetMessage];
    __int16 v10 = [*(id *)(a1 + 32) messageKey];
    *(_DWORD *)buf = 67111682;
    int v19 = v15;
    __int16 v20 = 1024;
    int v21 = v16;
    __int16 v22 = 2048;
    uint64_t v23 = v17;
    __int16 v24 = 2112;
    v25 = v3;
    __int16 v26 = 2112;
    char v27 = v4;
    __int16 v28 = 2112;
    v29 = v5;
    __int16 v30 = 2112;
    id v31 = v6;
    __int16 v32 = 2112;
    __int16 v33 = v7;
    __int16 v34 = 2112;
    __int16 v35 = v8;
    __int16 v36 = 2112;
    uint64_t v37 = v9;
    __int16 v38 = 2112;
    v39 = v10;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "(isOwner %d, hasDismissedBanner %d, cameraCount %lu) Offer title:%@ Message:%@ offerActionTitle:%@ sheetActionText:%@ planLimit:%@ sheetTitle: %@, sheetMessage:%@, messageKey:%@", buf, 0x68u);
  }
  objc_super v11 = (void *)MEMORY[0x1E4F7A0D8];
  int v12 = [*(id *)(a1 + 32) offerDisplayOutcome];
  v13 = [v11 futureWithResult:v12];

  return v13;
}

- (id)fetchPlanLimit
{
  objc_initWeak(&location, self);
  id v2 = (void *)MEMORY[0x1E4F7A0D8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__HUCameraUpgradeOfferBannerItem_fetchPlanLimit__block_invoke;
  v5[3] = &unk_1E638A320;
  objc_copyWeak(&v6, &location);
  id v3 = [v2 futureWithBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  return v3;
}

void __48__HUCameraUpgradeOfferBannerItem_fetchPlanLimit__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1E4F59BB8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__HUCameraUpgradeOfferBannerItem_fetchPlanLimit__block_invoke_2;
  v6[3] = &unk_1E638DD50;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  id v5 = v3;
  id v7 = v5;
  [v4 requestFeatureWithId:@"home.cameras" completion:v6];

  objc_destroyWeak(&v8);
}

void __48__HUCameraUpgradeOfferBannerItem_fetchPlanLimit__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__HUCameraUpgradeOfferBannerItem_fetchPlanLimit__block_invoke_3;
  v10[3] = &unk_1E638A138;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  id v8 = v5;
  id v11 = v8;
  id v9 = v6;
  id v12 = v9;
  id v13 = *(id *)(a1 + 32);
  [v7 performBlock:v10];

  objc_destroyWeak(&v14);
}

void __48__HUCameraUpgradeOfferBannerItem_fetchPlanLimit__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained savePlanLimit:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) finishWithNoResult];
}

- (id)fetchPremiumOffer
{
  objc_initWeak(&location, self);
  id v2 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  objc_copyWeak(&v7, &location);
  id v3 = objc_msgSend(MEMORY[0x1E4F7A0F0], "globalAsyncScheduler", v6, 3221225472, __51__HUCameraUpgradeOfferBannerItem_fetchPremiumOffer__block_invoke, &unk_1E638A320);
  uint64_t v4 = [v2 futureWithBlock:&v6 scheduler:v3];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v4;
}

void __51__HUCameraUpgradeOfferBannerItem_fetchPremiumOffer__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2050000000;
  uint64_t v4 = (void *)getICQOfferManagerClass_softClass;
  uint64_t v15 = getICQOfferManagerClass_softClass;
  if (!getICQOfferManagerClass_softClass)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __getICQOfferManagerClass_block_invoke_0;
    v11[3] = &unk_1E63852F0;
    v11[4] = &v12;
    __getICQOfferManagerClass_block_invoke_0((uint64_t)v11);
    uint64_t v4 = (void *)v13[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v12, 8);
  id v6 = objc_alloc_init(v5);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__HUCameraUpgradeOfferBannerItem_fetchPremiumOffer__block_invoke_2;
  v8[3] = &unk_1E638DD78;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  id v7 = v3;
  id v9 = v7;
  [v6 getPremiumOfferWithCompletion:v8];

  objc_destroyWeak(&v10);
}

void __51__HUCameraUpgradeOfferBannerItem_fetchPremiumOffer__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__HUCameraUpgradeOfferBannerItem_fetchPremiumOffer__block_invoke_3;
  v10[3] = &unk_1E638A138;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  id v8 = v5;
  id v11 = v8;
  id v9 = v6;
  id v12 = v9;
  id v13 = *(id *)(a1 + 32);
  [v7 performBlock:v10];

  objc_destroyWeak(&v14);
}

void __51__HUCameraUpgradeOfferBannerItem_fetchPremiumOffer__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained savePremiumOffer:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) finishWithNoResult];
}

- (void)savePlanLimit:(id)a3 error:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_error_impl(&dword_1BE345000, v8, OS_LOG_TYPE_ERROR, "Camera count request error:%@", (uint8_t *)&buf, 0xCu);
    }
  }
  [(HUCameraUpgradeOfferBannerItem *)self setMessageKey:0];
  if ([v6 status] == 1)
  {
    [(HUCameraUpgradeOfferBannerItem *)self setPlanLimit:&unk_1F19B4958];
    uint64_t v23 = 0;
    __int16 v24 = &v23;
    uint64_t v25 = 0x2020000000;
    id v9 = (void *)getkICQOpportunitySheetUnlimitedKeySymbolLoc_ptr;
    uint64_t v26 = getkICQOpportunitySheetUnlimitedKeySymbolLoc_ptr;
    if (!getkICQOpportunitySheetUnlimitedKeySymbolLoc_ptr)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      __int16 v28 = __getkICQOpportunitySheetUnlimitedKeySymbolLoc_block_invoke;
      v29 = &unk_1E63852F0;
      __int16 v30 = &v23;
      id v10 = iCloudQuotaLibrary();
      id v11 = dlsym(v10, "kICQOpportunitySheetUnlimitedKey");
      *(void *)(v30[1] + 24) = v11;
      getkICQOpportunitySheetUnlimitedKeySymbolLoc_ptr = *(void *)(v30[1] + 24);
      id v9 = (void *)v24[3];
    }
    _Block_object_dispose(&v23, 8);
    if (!v9)
    {
      int v21 = [MEMORY[0x1E4F28B00] currentHandler];
      __int16 v22 = [NSString stringWithUTF8String:"NSString *getkICQOpportunitySheetUnlimitedKey(void)"];
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, @"HUCameraUpgradeOfferBannerItem.m", 32, @"%s", dlerror());

      __break(1u);
    }
    [(HUCameraUpgradeOfferBannerItem *)self setMessageKey:*v9];
  }
  else
  {
    id v12 = [v6 value];
    BOOL v13 = v12 == 0;

    if (v13)
    {
      uint64_t v17 = HFLogForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v6;
        _os_log_error_impl(&dword_1BE345000, v17, OS_LOG_TYPE_ERROR, "Missing planLimit for feature = %@", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      id v14 = [v6 value];
      [(HUCameraUpgradeOfferBannerItem *)self setPlanLimit:v14];

      uint64_t v15 = [(HUCameraUpgradeOfferBannerItem *)self planLimit];
      int v16 = [v15 stringValue];
      [(HUCameraUpgradeOfferBannerItem *)self setMessageKey:v16];
    }
  }
  v18 = [(HUCameraUpgradeOfferBannerItem *)self sheetDetails];
  int v19 = [(HUCameraUpgradeOfferBannerItem *)self messageKey];
  __int16 v20 = [v18 messageForKey:v19];
  [(HUCameraUpgradeOfferBannerItem *)self setSheetMessage:v20];
}

- (void)savePremiumOffer:(id)a3 error:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_error_impl(&dword_1BE345000, v8, OS_LOG_TYPE_ERROR, "Premium offer error:%@", (uint8_t *)&buf, 0xCu);
    }
  }
  id v9 = [v6 opportunityBubble];
  BOOL v10 = v9 == 0;

  if (v10)
  {
    id v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_1BE345000, v11, OS_LOG_TYPE_ERROR, "Nil opportunity bubble, not showing banner", (uint8_t *)&buf, 2u);
    }
  }
  id v12 = [v6 opportunityBubble];
  [(HUCameraUpgradeOfferBannerItem *)self setHasOpportunityBubble:v12 != 0];

  [(HUCameraUpgradeOfferBannerItem *)self setHasFetchedOfferResults:1];
  BOOL v13 = [v6 opportunityBubble];
  id v14 = [v13 bubbleDetails];

  uint64_t v15 = [v6 opportunityBubble];
  int v16 = [v15 sheetDetails];

  [(HUCameraUpgradeOfferBannerItem *)self setSheetDetails:v16];
  uint64_t v17 = [v14 title];
  [(HUCameraUpgradeOfferBannerItem *)self setOfferTitle:v17];

  v18 = [v14 message];
  [(HUCameraUpgradeOfferBannerItem *)self setOfferMessage:v18];

  int v19 = [v14 actions];
  __int16 v20 = [v19 firstObject];
  int v21 = [v20 text];
  [(HUCameraUpgradeOfferBannerItem *)self setOfferActionTitle:v21];

  __int16 v22 = [v16 actions];
  uint64_t v23 = [v22 firstObject];
  __int16 v24 = [v23 text];
  [(HUCameraUpgradeOfferBannerItem *)self setSheetActionText:v24];

  uint64_t v25 = [v16 title];
  [(HUCameraUpgradeOfferBannerItem *)self setSheetTitle:v25];

  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v26 = (void *)getkICQOpportunitySheetDefaultKeySymbolLoc_ptr;
  uint64_t v41 = getkICQOpportunitySheetDefaultKeySymbolLoc_ptr;
  if (!getkICQOpportunitySheetDefaultKeySymbolLoc_ptr)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v43 = __getkICQOpportunitySheetDefaultKeySymbolLoc_block_invoke;
    v44 = &unk_1E63852F0;
    v45 = &v38;
    char v27 = iCloudQuotaLibrary();
    __int16 v28 = dlsym(v27, "kICQOpportunitySheetDefaultKey");
    *(void *)(v45[1] + 24) = v28;
    getkICQOpportunitySheetDefaultKeySymbolLoc_ptr = *(void *)(v45[1] + 24);
    uint64_t v26 = (void *)v39[3];
  }
  _Block_object_dispose(&v38, 8);
  if (!v26)
  {
    __int16 v36 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v37 = [NSString stringWithUTF8String:"NSString *getkICQOpportunitySheetDefaultKey(void)"];
    objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, @"HUCameraUpgradeOfferBannerItem.m", 33, @"%s", dlerror());

    __break(1u);
  }
  v29 = [v16 messageForKey:*v26];
  [(HUCameraUpgradeOfferBannerItem *)self setSheetMessage:v29];

  if ([MEMORY[0x1E4F68FF8] forceDisplaySingleCameraUpgradeBanner])
  {
    __int16 v30 = [(HUCameraUpgradeOfferBannerItem *)self offerTitle];
    BOOL v31 = v30 == 0;

    if (v31)
    {
      __int16 v32 = @"(DBG) Your iCloud subscription was upgraded to include secure video recording for one camera.";
      __int16 v33 = @"(DBG) Secure Video Available";
      __int16 v34 = &unk_1F19B4970;
      __int16 v35 = @"(DBG) Set Up Now";
      goto LABEL_17;
    }
  }
  if ([MEMORY[0x1E4F68FF8] forceDisplayMultiCameraUpgradeBanner])
  {
    __int16 v32 = @"(DBG) Your iCloud subscription was upgraded to support recording on more cameras.";
    __int16 v33 = @"(DBG) Recording Limits Increased";
    __int16 v34 = &unk_1F19B4988;
    __int16 v35 = @"(DBG) Recording Options";
LABEL_17:
    [(HUCameraUpgradeOfferBannerItem *)self setOfferTitle:@"(DBG) Secure Video Available"];
    [(HUCameraUpgradeOfferBannerItem *)self setOfferMessage:@"(DBG) Your iCloud subscription was upgraded to include secure video recording"];
    [(HUCameraUpgradeOfferBannerItem *)self setOfferActionTitle:v35];
    [(HUCameraUpgradeOfferBannerItem *)self setPlanLimit:v34];
    [(HUCameraUpgradeOfferBannerItem *)self setSheetTitle:v33];
    [(HUCameraUpgradeOfferBannerItem *)self setSheetMessage:v32];
    [(HUCameraUpgradeOfferBannerItem *)self setSheetActionText:@"(DBG) Continue"];
  }
}

- (id)offerDisplayOutcome
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F692F0]);
  id v5 = [(HUCameraUpgradeOfferBannerItem *)self offerTitle];
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  [v4 setObject:@"Home.Banners.CameraUpgradeOffer" forKeyedSubscript:*MEMORY[0x1E4F68928]];
  id v6 = NSNumber;
  id v7 = [(HUCameraUpgradeOfferBannerItem *)self offerTitle];
  if (v7)
  {
    id v2 = [(HUCameraUpgradeOfferBannerItem *)self offerMessage];
    BOOL v8 = v2 == 0;
  }
  else
  {
    BOOL v8 = 1;
  }
  id v9 = [v6 numberWithInt:v8];
  [v4 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  if (v7) {
  BOOL v10 = [(HUCameraUpgradeOfferBannerItem *)self offerMessage];
  }
  [v4 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F68980]];

  id v11 = objc_alloc(MEMORY[0x1E4F68F38]);
  id v12 = (void *)[v11 initWithPackageIdentifier:*MEMORY[0x1E4F68340] state:*MEMORY[0x1E4F68360]];
  [v4 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F689E8]];

  BOOL v13 = [(HUCameraUpgradeOfferBannerItem *)self offerActionTitle];
  [v4 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F68948]];

  [v4 setObject:&unk_1F19B49A0 forKeyedSubscript:@"bannerItemCategory"];

  return v4;
}

- (NSNumber)planLimit
{
  return self->_planLimit;
}

- (void)setPlanLimit:(id)a3
{
}

- (NSString)bannerActionText
{
  return self->_bannerActionText;
}

- (NSString)sheetTitle
{
  return self->_sheetTitle;
}

- (void)setSheetTitle:(id)a3
{
}

- (NSString)sheetMessage
{
  return self->_sheetMessage;
}

- (void)setSheetMessage:(id)a3
{
}

- (NSString)sheetActionText
{
  return self->_sheetActionText;
}

- (void)setSheetActionText:(id)a3
{
}

- (void)setUserItem:(id)a3
{
}

- (BOOL)hasFetchedOfferResults
{
  return self->_hasFetchedOfferResults;
}

- (void)setHasFetchedOfferResults:(BOOL)a3
{
  self->_hasFetchedOfferResults = a3;
}

- (BOOL)hasOpportunityBubble
{
  return self->_hasOpportunityBubble;
}

- (void)setHasOpportunityBubble:(BOOL)a3
{
  self->_hasOpportunityBubble = a3;
}

- (NSString)offerTitle
{
  return self->_offerTitle;
}

- (void)setOfferTitle:(id)a3
{
}

- (NSString)offerMessage
{
  return self->_offerMessage;
}

- (void)setOfferMessage:(id)a3
{
}

- (NSString)offerActionTitle
{
  return self->_offerActionTitle;
}

- (void)setOfferActionTitle:(id)a3
{
}

- (NSString)messageKey
{
  return self->_messageKey;
}

- (void)setMessageKey:(id)a3
{
}

- (ICQOpportunitySheetDetailsSpecification)sheetDetails
{
  return self->_sheetDetails;
}

- (void)setSheetDetails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sheetDetails, 0);
  objc_storeStrong((id *)&self->_messageKey, 0);
  objc_storeStrong((id *)&self->_offerActionTitle, 0);
  objc_storeStrong((id *)&self->_offerMessage, 0);
  objc_storeStrong((id *)&self->_offerTitle, 0);
  objc_storeStrong((id *)&self->_userItem, 0);
  objc_storeStrong((id *)&self->_sheetActionText, 0);
  objc_storeStrong((id *)&self->_sheetMessage, 0);
  objc_storeStrong((id *)&self->_sheetTitle, 0);
  objc_storeStrong((id *)&self->_bannerActionText, 0);

  objc_storeStrong((id *)&self->_planLimit, 0);
}

@end