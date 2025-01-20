@interface HUDoorbellChimeDevicesItemManager
- (id)_buildItemProvidersForHome:(id)a3;
- (id)enableDoorbellChime:(BOOL)a3 forItem:(id)a4;
- (void)mediaProfileContainer:(id)a3 didUpdateSettingKeypath:(id)a4 value:(id)a5;
@end

@implementation HUDoorbellChimeDevicesItemManager

- (id)_buildItemProvidersForHome:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3);
  id v5 = objc_alloc(MEMORY[0x1E4F69288]);
  v6 = [(HFItemManager *)self home];
  v7 = (void *)[v5 initWithHome:v6];

  [v7 setFilter:&__block_literal_global_193];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F696B0]) initWithSourceProvider:v7 transformationBlock:&__block_literal_global_253_0];
  id v9 = objc_alloc(MEMORY[0x1E4F68E20]);
  v10 = [(HFItemManager *)self home];
  v11 = (void *)[v9 initWithHome:v10];

  [v11 setFilter:&__block_literal_global_260];
  id v12 = objc_alloc(MEMORY[0x1E4F696B0]);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__HUDoorbellChimeDevicesItemManager__buildItemProvidersForHome___block_invoke_5;
  v15[3] = &unk_1E6387890;
  v15[4] = self;
  v13 = (void *)[v12 initWithSourceProvider:v11 transformationBlock:v15];
  [v4 addObject:v8];
  [v4 addObject:v13];

  return v4;
}

uint64_t __64__HUDoorbellChimeDevicesItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 conformsToProtocol:&unk_1F1AD86A8]) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;
  if (!v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v5 = 0;
      goto LABEL_13;
    }
    uint64_t v6 = objc_msgSend(v2, "hf_isHomePod");
LABEL_12:
    uint64_t v5 = v6;
    goto LABEL_13;
  }
  if (([MEMORY[0x1E4F692A8] isHomePodMediaSystem:v4] & 1) == 0
    && ([MEMORY[0x1E4F692A8] isHomePod:v4] & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F692A8] isSiriEndpoint:v4];
    goto LABEL_12;
  }
  uint64_t v5 = 1;
LABEL_13:

  return v5;
}

id __64__HUDoorbellChimeDevicesItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc(MEMORY[0x1E4F696A8]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__HUDoorbellChimeDevicesItemManager__buildItemProvidersForHome___block_invoke_3;
  v7[3] = &unk_1E638E0F0;
  id v8 = v2;
  id v4 = v2;
  uint64_t v5 = (void *)[v3 initWithSourceItem:v4 transformationBlock:v7];

  return v5;
}

id __64__HUDoorbellChimeDevicesItemManager__buildItemProvidersForHome___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 mutableCopy];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  uint64_t v6 = v5;

  v7 = (void *)MEMORY[0x1E4F692A8];
  id v8 = [*(id *)(a1 + 32) mediaProfileContainer];
  LODWORD(v7) = [v7 supportsDoorbellChime:v8];

  if (v7)
  {
    id v9 = NSNumber;
    [*(id *)(a1 + 32) isDoorbellChimeEnabled];
    v10 = [v9 numberWithInteger:HFPrimaryStateFromBOOL()];
    [v6 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];
  }
  else
  {
    [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  }

  return v6;
}

void *__64__HUDoorbellChimeDevicesItemManager__buildItemProvidersForHome___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (!v5) {
    goto LABEL_8;
  }
  uint64_t v6 = objc_msgSend(v5, "hf_siriEndpointProfile");
  if (v6)
  {
    v7 = objc_msgSend(v5, "hf_primaryService");

    if (v7)
    {
      uint64_t v6 = (void *)[v5 supportsDoorbellChime];
      goto LABEL_9;
    }
LABEL_8:
    uint64_t v6 = 0;
  }
LABEL_9:

  return v6;
}

id __64__HUDoorbellChimeDevicesItemManager__buildItemProvidersForHome___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F696A8]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__HUDoorbellChimeDevicesItemManager__buildItemProvidersForHome___block_invoke_6;
  v9[3] = &unk_1E638B630;
  uint64_t v5 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v5;
  id v6 = v3;
  v7 = (void *)[v4 initWithSourceItem:v6 transformationBlock:v9];

  return v7;
}

id __64__HUDoorbellChimeDevicesItemManager__buildItemProvidersForHome___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 mutableCopy];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v6 = v5;

  id v7 = *(id *)(a1 + 32);
  id v8 = &unk_1F1A3D2C0;
  if ([v7 conformsToProtocol:v8]) {
    id v9 = v7;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if ([v10 isSiriEndpointAccessory])
  {
    uint64_t v11 = [v10 commonSettingsManager];

    if (v11)
    {
      id v12 = [v10 commonSettingsManager];
      [v12 addObserver:*(void *)(a1 + 40)];
    }
  }
  v13 = NSNumber;
  [v10 isDoorbellChimeEnabled];
  v14 = [v13 numberWithInteger:HFPrimaryStateFromBOOL()];
  [v6 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  return v6;
}

- (id)enableDoorbellChime:(BOOL)a3 forItem:(id)a4
{
  id v5 = [a4 sourceItem];
  id v6 = &unk_1F1A3D2C0;
  if ([v5 conformsToProtocol:v6]) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    id v9 = (void *)MEMORY[0x1E4F7A0D8];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __65__HUDoorbellChimeDevicesItemManager_enableDoorbellChime_forItem___block_invoke;
    v12[3] = &unk_1E6388DB0;
    id v13 = v8;
    BOOL v14 = a3;
    id v10 = [v9 futureWithBlock:v12];
  }
  else
  {
    id v10 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v10;
}

void __65__HUDoorbellChimeDevicesItemManager_enableDoorbellChime_forItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) enableDoorbellChime:*(unsigned __int8 *)(a1 + 40)];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__HUDoorbellChimeDevicesItemManager_enableDoorbellChime_forItem___block_invoke_2;
  v7[3] = &unk_1E63850B8;
  id v8 = v3;
  id v5 = v3;
  id v6 = (id)[v4 addCompletionBlock:v7];
}

void __65__HUDoorbellChimeDevicesItemManager_enableDoorbellChime_forItem___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_error_impl(&dword_1BE345000, v5, OS_LOG_TYPE_ERROR, "Failed to enable/disable doorbell chime setting : %@", (uint8_t *)&v6, 0xCu);
    }

    [*(id *)(a1 + 32) finishWithError:v4];
  }
  [*(id *)(a1 + 32) finishWithNoResult];
}

- (void)mediaProfileContainer:(id)a3 didUpdateSettingKeypath:(id)a4 value:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "Received update for setting keypath %@ value = %@", (uint8_t *)&v12, 0x16u);
  }

  id v11 = [(HFItemManager *)self reloadAndUpdateAllItemsFromSenderSelector:a2];
}

@end