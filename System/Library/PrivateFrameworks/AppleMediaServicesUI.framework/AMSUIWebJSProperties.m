@interface AMSUIWebJSProperties
- (AMSUIWebClientContext)context;
- (AMSUIWebJSProperties)initWithContext:(id)a3 delegate:(id)a4;
- (AMSUIWebJSPropertiesDelegate)delegate;
- (NSDictionary)lastAccountsExport;
- (id)_accessibilityProperties;
- (id)_accountsProperties;
- (id)_appearanceProperties;
- (id)_appearancePropertiesDictionary;
- (id)_clientOptionsProperties;
- (id)_deviceProperties;
- (id)_hexStringFromColor:(id)a3;
- (id)_pluginProperties;
- (id)_processProperties;
- (id)_propertiesForClientInfo:(id)a3;
- (id)generateProperties;
- (void)_accessibilityPropertiesDidChange:(id)a3;
- (void)_accountStoreDidChange:(id)a3;
- (void)_lastConnectionReportDidChange:(id)a3;
- (void)dealloc;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLastAccountsExport:(id)a3;
@end

@implementation AMSUIWebJSProperties

- (AMSUIWebJSProperties)initWithContext:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)AMSUIWebJSProperties;
  v8 = [(AMSUIWebJSProperties *)&v21 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_context, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
    v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:v9 selector:sel__lastConnectionReportDidChange_ name:*MEMORY[0x263F27900] object:0];

    v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:v9 selector:sel__accountStoreDidChange_ name:*MEMORY[0x263EFAE28] object:0];

    v12 = [MEMORY[0x263F08A00] defaultCenter];
    [v12 addObserver:v9 selector:sel__accessibilityPropertiesDidChange_ name:*MEMORY[0x263F831B8] object:0];

    v13 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v14 = *MEMORY[0x263F83190];
    [v13 addObserver:v9 selector:sel__accessibilityPropertiesDidChange_ name:*MEMORY[0x263F83190] object:0];

    v15 = [MEMORY[0x263F08A00] defaultCenter];
    [v15 addObserver:v9 selector:sel__accessibilityPropertiesDidChange_ name:*MEMORY[0x263F831B0] object:0];

    v16 = [MEMORY[0x263F08A00] defaultCenter];
    [v16 addObserver:v9 selector:sel__accessibilityPropertiesDidChange_ name:v14 object:0];

    v17 = [MEMORY[0x263F08A00] defaultCenter];
    [v17 addObserver:v9 selector:sel__accessibilityPropertiesDidChange_ name:*MEMORY[0x263F831A0] object:0];

    v18 = [MEMORY[0x263F08A00] defaultCenter];
    [v18 addObserver:v9 selector:sel__accessibilityPropertiesDidChange_ name:*MEMORY[0x263F831D8] object:0];

    v19 = [MEMORY[0x263F08A00] defaultCenter];
    [v19 addObserver:v9 selector:sel__accessibilityPropertiesDidChange_ name:*MEMORY[0x263F832E8] object:0];
  }
  return v9;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AMSUIWebJSProperties;
  [(AMSUIWebJSProperties *)&v4 dealloc];
}

- (id)generateProperties
{
  v15[6] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F27E10];
  objc_super v4 = [(AMSUIWebJSProperties *)self _accountsProperties];
  v15[0] = v4;
  v5 = [(AMSUIWebJSProperties *)self _appearanceProperties];
  v15[1] = v5;
  id v6 = [(AMSUIWebJSProperties *)self _clientOptionsProperties];
  v15[2] = v6;
  id v7 = [(AMSUIWebJSProperties *)self _deviceProperties];
  v15[3] = v7;
  v8 = [(AMSUIWebJSProperties *)self _processProperties];
  v15[4] = v8;
  v9 = [(AMSUIWebJSProperties *)self _accessibilityProperties];
  v15[5] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:6];
  v11 = [v3 promiseWithAll:v10];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __42__AMSUIWebJSProperties_generateProperties__block_invoke;
  v14[3] = &unk_2643E4A58;
  v14[4] = self;
  v12 = [v11 thenWithBlock:v14];

  return v12;
}

id __42__AMSUIWebJSProperties_generateProperties__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v3 = (objc_class *)MEMORY[0x263EFF9A0];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  id v6 = [*(id *)(a1 + 32) _pluginProperties];
  [v5 addEntriesFromDictionary:v6];

  id v7 = [v4 objectAtIndexedSubscript:0];
  [v5 setObject:v7 forKeyedSubscript:@"accounts"];

  v8 = [v4 objectAtIndexedSubscript:1];
  [v5 setObject:v8 forKeyedSubscript:@"appearance"];

  v9 = [v4 objectAtIndexedSubscript:2];
  [v5 setObject:v9 forKeyedSubscript:@"clientData"];

  v10 = [v4 objectAtIndexedSubscript:3];
  [v5 setObject:v10 forKeyedSubscript:@"device"];

  v11 = [v4 objectAtIndexedSubscript:4];
  [v5 setObject:v11 forKeyedSubscript:@"process"];

  v12 = [v4 objectAtIndexedSubscript:5];

  [v5 setObject:v12 forKeyedSubscript:@"accessibility"];
  if ([MEMORY[0x263F08900] isValidJSONObject:v5])
  {
    id v26 = 0;
    v13 = [MEMORY[0x263F08900] dataWithJSONObject:v5 options:0 error:&v26];
    id v14 = v26;
    if ([v13 length])
    {
      v15 = (void *)MEMORY[0x263F27E10];
      v16 = [v13 base64EncodedStringWithOptions:0];
      v17 = [v15 promiseWithResult:v16];
    }
    else
    {
      v16 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
      if (!v16)
      {
        v16 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      objc_super v21 = [v16 OSLogObject];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = objc_opt_class();
        v23 = [*(id *)(a1 + 32) context];
        v24 = [v23 logKey];
        *(_DWORD *)buf = 138543618;
        uint64_t v28 = v22;
        __int16 v29 = 2114;
        v30 = v24;
        _os_log_impl(&dword_21C134000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode JS properties JSON data", buf, 0x16u);
      }
      v17 = 0;
    }
  }
  else
  {
    id v14 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v14)
    {
      id v14 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v13 = [v14 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = objc_opt_class();
      v19 = [*(id *)(a1 + 32) context];
      v20 = [v19 logKey];
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v18;
      __int16 v29 = 2114;
      v30 = v20;
      _os_log_impl(&dword_21C134000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode JS properties", buf, 0x16u);
    }
    v17 = 0;
  }

  return v17;
}

- (void)_accessibilityPropertiesDidChange:(id)a3
{
  id v4 = [(AMSUIWebJSProperties *)self delegate];
  [v4 propertiesDidChange:self];

  id v7 = [(AMSUIWebJSProperties *)self context];
  id v5 = [v7 dataProvider];
  id v6 = (id)[v5 postEvent:@"AccessibilityChange" options:0];
}

- (void)_accountStoreDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIWebJSProperties *)self context];
  id v6 = [v5 clientInfo];
  id v7 = [v6 accountMediaType];

  v8 = [v4 userInfo];
  v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263EFAF38]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  v11 = [v4 userInfo];
  v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263EFAD50]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  id v14 = objc_msgSend(MEMORY[0x263EFB210], "ams_accountTypeIdentifierForMediaType:", v7);
  if ([v10 isEqualToString:v14])
  {

LABEL_10:
    v16 = [(AMSUIWebJSProperties *)self context];
    v17 = [v16 account];
    [v17 reload];

    uint64_t v18 = [(AMSUIWebJSProperties *)self _accountsProperties];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __47__AMSUIWebJSProperties__accountStoreDidChange___block_invoke;
    v19[3] = &unk_2643E4880;
    v19[4] = self;
    [v18 resultWithCompletion:v19];

    goto LABEL_11;
  }
  char v15 = [v13 isEqualToString:*MEMORY[0x263F27908]];

  if (v15) {
    goto LABEL_10;
  }
LABEL_11:
}

void __47__AMSUIWebJSProperties__accountStoreDidChange___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (a3)
  {
    id v6 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v6)
    {
      id v6 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_opt_class();
      v9 = AMSLogKey();
      int v18 = 138543618;
      uint64_t v19 = v8;
      __int16 v20 = 2114;
      objc_super v21 = v9;
      _os_log_impl(&dword_21C134000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to determine accounts properties.", (uint8_t *)&v18, 0x16u);
    }
  }
  else
  {
    uint64_t v10 = [*(id *)(a1 + 32) lastAccountsExport];
    if (!v10
      || (v11 = (void *)v10,
          [*(id *)(a1 + 32) lastAccountsExport],
          v12 = objc_claimAutoreleasedReturnValue(),
          char v13 = [v12 isEqualToDictionary:v5],
          v12,
          v11,
          (v13 & 1) == 0))
    {
      id v14 = [*(id *)(a1 + 32) delegate];
      [v14 propertiesDidChange:*(void *)(a1 + 32)];

      char v15 = [*(id *)(a1 + 32) context];
      v16 = [v15 dataProvider];
      id v17 = (id)[v16 postEvent:@"AccountChange" options:0];
    }
  }
}

- (void)_lastConnectionReportDidChange:(id)a3
{
  id v4 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__AMSUIWebJSProperties__lastConnectionReportDidChange___block_invoke;
  block[3] = &unk_2643E3118;
  block[4] = self;
  dispatch_async(v4, block);
}

void __55__AMSUIWebJSProperties__lastConnectionReportDidChange___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 propertiesDidChange:*(void *)(a1 + 32)];
}

- (id)_accessibilityProperties
{
  v25[18] = *MEMORY[0x263EF8340];
  uint64_t v19 = (void *)MEMORY[0x263F27E10];
  v24[0] = @"buttonShapesEnabled";
  v23 = objc_msgSend(NSNumber, "numberWithBool:", +[AMSUIAccessibilityWrapper buttonShapesEnabled](AMSUIAccessibilityWrapper, "buttonShapesEnabled"));
  v25[0] = v23;
  v24[1] = @"isBoldTextEnabled";
  uint64_t v22 = objc_msgSend(NSNumber, "numberWithBool:", +[AMSUIAccessibilityWrapper isBoldTextEnabled](AMSUIAccessibilityWrapper, "isBoldTextEnabled"));
  v25[1] = v22;
  v24[2] = @"isClosedCaptioningEnabled";
  objc_super v21 = objc_msgSend(NSNumber, "numberWithBool:", +[AMSUIAccessibilityWrapper isClosedCaptioningEnabled](AMSUIAccessibilityWrapper, "isClosedCaptioningEnabled"));
  v25[2] = v21;
  v24[3] = @"isDarkerSystemColorsEnabled";
  __int16 v20 = objc_msgSend(NSNumber, "numberWithBool:", +[AMSUIAccessibilityWrapper isDarkerSystemColorsEnabled](AMSUIAccessibilityWrapper, "isDarkerSystemColorsEnabled"));
  v25[3] = v20;
  v24[4] = @"isGrayscaleEnabled";
  int v18 = objc_msgSend(NSNumber, "numberWithBool:", +[AMSUIAccessibilityWrapper isGrayscaleEnabled](AMSUIAccessibilityWrapper, "isGrayscaleEnabled"));
  v25[4] = v18;
  v24[5] = @"isInvertColorsEnabled";
  id v17 = objc_msgSend(NSNumber, "numberWithBool:", +[AMSUIAccessibilityWrapper isInvertColorsEnabled](AMSUIAccessibilityWrapper, "isInvertColorsEnabled"));
  v25[5] = v17;
  v24[6] = @"isMonoAudioEnabled";
  v16 = objc_msgSend(NSNumber, "numberWithBool:", +[AMSUIAccessibilityWrapper isMonoAudioEnabled](AMSUIAccessibilityWrapper, "isMonoAudioEnabled"));
  v25[6] = v16;
  v24[7] = @"isOnOffSwitchLabelsEnabled";
  char v15 = objc_msgSend(NSNumber, "numberWithBool:", +[AMSUIAccessibilityWrapper isOnOffSwitchLabelsEnabled](AMSUIAccessibilityWrapper, "isOnOffSwitchLabelsEnabled"));
  v25[7] = v15;
  v24[8] = @"isReduceMotionEnabled";
  id v14 = objc_msgSend(NSNumber, "numberWithBool:", +[AMSUIAccessibilityWrapper isReduceMotionEnabled](AMSUIAccessibilityWrapper, "isReduceMotionEnabled"));
  v25[8] = v14;
  v24[9] = @"isReduceTransparencyEnabled";
  char v13 = objc_msgSend(NSNumber, "numberWithBool:", +[AMSUIAccessibilityWrapper isReduceTransparencyEnabled](AMSUIAccessibilityWrapper, "isReduceTransparencyEnabled"));
  v25[9] = v13;
  v24[10] = @"isShakeToUndoEnabled";
  id v2 = objc_msgSend(NSNumber, "numberWithBool:", +[AMSUIAccessibilityWrapper isShakeToUndoEnabled](AMSUIAccessibilityWrapper, "isShakeToUndoEnabled"));
  v25[10] = v2;
  v24[11] = @"isSpeakScreenEnabled";
  v3 = objc_msgSend(NSNumber, "numberWithBool:", +[AMSUIAccessibilityWrapper isSpeakScreenEnabled](AMSUIAccessibilityWrapper, "isSpeakScreenEnabled"));
  v25[11] = v3;
  v24[12] = @"isSpeakSelectionEnabled";
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", +[AMSUIAccessibilityWrapper isSpeakSelectionEnabled](AMSUIAccessibilityWrapper, "isSpeakSelectionEnabled"));
  v25[12] = v4;
  v24[13] = @"isSwitchControlRunning";
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", +[AMSUIAccessibilityWrapper isSwitchControlRunning](AMSUIAccessibilityWrapper, "isSwitchControlRunning"));
  v25[13] = v5;
  v24[14] = @"isVideoAutoplayEnabled";
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", +[AMSUIAccessibilityWrapper isVideoAutoplayEnabled](AMSUIAccessibilityWrapper, "isVideoAutoplayEnabled"));
  v25[14] = v6;
  v24[15] = @"isVoiceOverRunning";
  id v7 = objc_msgSend(NSNumber, "numberWithBool:", +[AMSUIAccessibilityWrapper isVoiceOverRunning](AMSUIAccessibilityWrapper, "isVoiceOverRunning"));
  v25[15] = v7;
  v24[16] = @"prefersCrossFadeTransitions";
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", +[AMSUIAccessibilityWrapper prefersCrossFadeTransitions](AMSUIAccessibilityWrapper, "prefersCrossFadeTransitions"));
  v25[16] = v8;
  v24[17] = @"shouldDifferentiateWithoutColor";
  v9 = objc_msgSend(NSNumber, "numberWithBool:", +[AMSUIAccessibilityWrapper shouldDifferentiateWithoutColor](AMSUIAccessibilityWrapper, "shouldDifferentiateWithoutColor"));
  v25[17] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:18];
  v11 = [v19 promiseWithResult:v10];

  return v11;
}

- (id)_accountsProperties
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = (void *)MEMORY[0x263EFB210];
  id v5 = [(AMSUIWebJSProperties *)self context];
  id v6 = [v5 clientInfo];
  id v7 = [v6 accountMediaType];
  uint64_t v8 = objc_msgSend(v4, "ams_sharedAccountStoreForMediaType:", v7);

  v9 = objc_msgSend(v8, "ams_activeiCloudAccount");
  uint64_t v10 = objc_msgSend(v8, "ams_activeiTunesAccount");
  v11 = [(AMSUIWebJSProperties *)self context];
  v12 = [v11 account];
  char v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    objc_msgSend(v8, "ams_localiTunesAccount");
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  char v15 = v14;

  v16 = [(AMSUIWebJSProperties *)self context];
  id v17 = [v16 JSAccountFromAccount:v9 store:v8];
  [v3 setObject:v17 forKeyedSubscript:@"activeiCloud"];

  int v18 = [(AMSUIWebJSProperties *)self context];
  uint64_t v19 = [v18 JSAccountFromAccount:v10 store:v8];
  [v3 setObject:v19 forKeyedSubscript:@"activeiTunes"];

  __int16 v20 = [(AMSUIWebJSProperties *)self context];
  objc_super v21 = [v20 JSAccountFromAccount:v15 store:v8];
  [v3 setObject:v21 forKeyedSubscript:@"current"];

  uint64_t v22 = objc_msgSend(v9, "ams_DSID");
  if (v22)
  {
    v23 = objc_msgSend(v10, "ams_DSID");

    if (v23)
    {
      v24 = objc_msgSend(v9, "ams_DSID");
      v25 = objc_msgSend(v10, "ams_DSID");
      uint64_t v22 = (void *)[v24 isEqualToNumber:v25];
    }
    else
    {
      uint64_t v22 = 0;
    }
  }
  id v26 = [NSNumber numberWithBool:v22];
  [v3 setObject:v26 forKeyedSubscript:@"isCombinedAccount"];

  v27 = (void *)[v3 copy];
  [(AMSUIWebJSProperties *)self setLastAccountsExport:v27];

  uint64_t v28 = [MEMORY[0x263F27E10] promiseWithResult:v3];

  return v28;
}

- (id)_appearanceProperties
{
  id v3 = objc_alloc_init(MEMORY[0x263F27E10]);
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    id v4 = [(AMSUIWebJSProperties *)self _appearancePropertiesDictionary];
    [v3 finishWithResult:v4];
  }
  else
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __45__AMSUIWebJSProperties__appearanceProperties__block_invoke;
    v6[3] = &unk_2643E34D0;
    id v7 = v3;
    uint64_t v8 = self;
    dispatch_async(MEMORY[0x263EF83A0], v6);
  }
  return v3;
}

void __45__AMSUIWebJSProperties__appearanceProperties__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) _appearancePropertiesDictionary];
  [v1 finishWithResult:v2];
}

- (id)_appearancePropertiesDictionary
{
  v15[1] = *MEMORY[0x263EF8340];
  id v3 = [(AMSUIWebJSProperties *)self context];
  id v4 = [v3 flowController];
  id v5 = [v4 rootContainer];
  id v6 = [v5 view];
  id v7 = [v6 tintColor];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x263F825C8] systemBlueColor];
  }
  uint64_t v10 = v9;

  id v14 = @"tintColor";
  v11 = [(AMSUIWebJSProperties *)self _hexStringFromColor:v10];
  v15[0] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];

  return v12;
}

- (id)_clientOptionsProperties
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = [(AMSUIWebJSProperties *)self context];
  uint64_t v3 = [v2 clientOptions];
  id v4 = (void *)v3;
  id v5 = (void *)MEMORY[0x263EFFA78];
  if (v3) {
    id v5 = (void *)v3;
  }
  id v6 = v5;

  if ([MEMORY[0x263F08900] isValidJSONObject:v6])
  {
    id v7 = [MEMORY[0x263F27E10] promiseWithResult:v6];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v8)
    {
      uint64_t v8 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_opt_class();
      v11 = AMSLogKey();
      int v13 = 138543618;
      uint64_t v14 = v10;
      __int16 v15 = 2114;
      v16 = v11;
      _os_log_impl(&dword_21C134000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Cannot serialize client options", (uint8_t *)&v13, 0x16u);
    }
    id v7 = 0;
  }

  return v7;
}

- (id)_deviceProperties
{
  int has_internal_content = os_variant_has_internal_content();
  uint64_t v3 = @"customer";
  if (has_internal_content) {
    uint64_t v3 = @"internal";
  }
  id v4 = (void *)MEMORY[0x263F27E10];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__AMSUIWebJSProperties__deviceProperties__block_invoke;
  block[3] = &unk_2643E3118;
  uint64_t v10 = v3;
  if (_deviceProperties_ams_once_token___COUNTER__ != -1) {
    dispatch_once(&_deviceProperties_ams_once_token___COUNTER__, block);
  }
  id v5 = v10;
  id v6 = (id)_deviceProperties_ams_once_object___COUNTER__;

  id v7 = [v4 promiseWithResult:v6];

  return v7;
}

void __41__AMSUIWebJSProperties__deviceProperties__block_invoke(uint64_t a1)
{
  v54[20] = *MEMORY[0x263EF8340];
  v54[0] = *(void *)(a1 + 32);
  v53[0] = @"buildType";
  v53[1] = @"buildVersion";
  v43 = [MEMORY[0x263F27BF8] buildVersion];
  v1 = v43;
  if (!v43) {
    v1 = &stru_26CC491D8;
  }
  v54[1] = v1;
  v53[2] = @"isPassLibraryAvailable";
  id v2 = NSNumber;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2050000000;
  uint64_t v3 = (void *)getPKPassLibraryClass_softClass_0;
  uint64_t v52 = getPKPassLibraryClass_softClass_0;
  if (!getPKPassLibraryClass_softClass_0)
  {
    uint64_t v44 = MEMORY[0x263EF8330];
    uint64_t v45 = 3221225472;
    v46 = __getPKPassLibraryClass_block_invoke_0;
    v47 = &unk_2643E33D8;
    v48 = &v49;
    __getPKPassLibraryClass_block_invoke_0((uint64_t)&v44);
    uint64_t v3 = (void *)v50[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v49, 8);
  v42 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v4, "isPassLibraryAvailable"));
  v54[2] = v42;
  v53[3] = @"guid";
  v41 = [MEMORY[0x263F27BF8] deviceGUID];
  id v5 = v41;
  if (!v41) {
    id v5 = &stru_26CC491D8;
  }
  v54[3] = v5;
  v53[4] = @"isApplePayAvailable";
  v40 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(MEMORY[0x263F27BF8], "isSecureElementAvailable"));
  v54[4] = v40;
  v53[5] = @"isBundle";
  v39 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(MEMORY[0x263F27BF8], "deviceIsBundle"));
  v54[5] = v39;
  v53[6] = @"isCameraSupported";
  v38 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x263F37E00], "supportedCameraCount"));
  v54[6] = v38;
  v53[7] = @"videoAuthorizationStatus";
  v37 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(MEMORY[0x263EFA598], "authorizationStatusForMediaType:", *MEMORY[0x263EF9D48]));
  v54[7] = v37;
  v53[8] = @"isDiagnosticsSubmissionAllowed";
  v36 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(MEMORY[0x263F27D40], "diagnosticsSubmissionAllowed"));
  v54[8] = v36;
  v53[9] = @"canMakePayments";
  id v6 = NSNumber;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2050000000;
  id v7 = (void *)getPKPaymentAuthorizationControllerClass_softClass_0;
  uint64_t v52 = getPKPaymentAuthorizationControllerClass_softClass_0;
  if (!getPKPaymentAuthorizationControllerClass_softClass_0)
  {
    uint64_t v44 = MEMORY[0x263EF8330];
    uint64_t v45 = 3221225472;
    v46 = __getPKPaymentAuthorizationControllerClass_block_invoke_0;
    v47 = &unk_2643E33D8;
    v48 = &v49;
    __getPKPaymentAuthorizationControllerClass_block_invoke_0((uint64_t)&v44);
    id v7 = (void *)v50[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v49, 8);
  v35 = objc_msgSend(v6, "numberWithBool:", objc_msgSend(v8, "canMakePayments"));
  v54[9] = v35;
  v53[10] = @"isGreenTea";
  v34 = [NSNumber numberWithBool:MGGetBoolAnswer()];
  v54[10] = v34;
  v53[11] = @"isScreenReaderRunning";
  id v9 = objc_msgSend(NSNumber, "numberWithBool:", +[AMSUIAccessibilityWrapper isVoiceOverRunning](AMSUIAccessibilityWrapper, "isVoiceOverRunning"));
  v54[11] = v9;
  v53[12] = @"isWalletBiometricsEnabled";
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(MEMORY[0x263F27BF8], "isWalletBiometricsEnabled"));
  v54[12] = v10;
  v53[13] = @"language";
  uint64_t v11 = [MEMORY[0x263F27BF8] language];
  v12 = (void *)v11;
  int v13 = &stru_26CC491D8;
  if (v11) {
    int v13 = (__CFString *)v11;
  }
  v54[13] = v13;
  v53[14] = @"os";
  uint64_t v14 = [MEMORY[0x263F27BF8] operatingSystem];
  __int16 v15 = (void *)v14;
  v16 = &stru_26CC491D8;
  if (v14) {
    v16 = (__CFString *)v14;
  }
  v54[14] = v16;
  v53[15] = @"osVersion";
  uint64_t v17 = [MEMORY[0x263F27BF8] productVersion];
  int v18 = (void *)v17;
  uint64_t v19 = &stru_26CC491D8;
  if (v17) {
    uint64_t v19 = (__CFString *)v17;
  }
  v54[15] = v19;
  v53[16] = @"productType";
  uint64_t v20 = [MEMORY[0x263F27BF8] productType];
  objc_super v21 = (void *)v20;
  uint64_t v22 = &stru_26CC491D8;
  if (v20) {
    uint64_t v22 = (__CFString *)v20;
  }
  v54[16] = v22;
  v53[17] = @"regionCode";
  uint64_t v23 = [MEMORY[0x263F27BF8] regionCode];
  v24 = (void *)v23;
  v25 = &stru_26CC491D8;
  if (v23) {
    v25 = (__CFString *)v23;
  }
  v54[17] = v25;
  v53[18] = @"secureElementID";
  uint64_t v26 = [MEMORY[0x263F27BF8] secureElementID];
  v27 = (void *)v26;
  uint64_t v28 = &stru_26CC491D8;
  if (v26) {
    uint64_t v28 = (__CFString *)v26;
  }
  v54[18] = v28;
  v53[19] = @"serial";
  uint64_t v29 = [MEMORY[0x263F27BF8] serialNumber];
  v30 = (void *)v29;
  uint64_t v31 = &stru_26CC491D8;
  if (v29) {
    uint64_t v31 = (__CFString *)v29;
  }
  v54[19] = v31;
  uint64_t v32 = [NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:20];
  v33 = (void *)_deviceProperties_ams_once_object___COUNTER__;
  _deviceProperties_ams_once_object___COUNTER__ = v32;
}

- (id)_pluginProperties
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v29 = self;
  id v4 = [(AMSUIWebJSProperties *)self context];
  id v5 = [v4 pluginLoader];
  id v6 = [v5 loadedPlugins];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v33;
    unint64_t v11 = 0x263F27000uLL;
    *(void *)&long long v8 = 138543874;
    long long v28 = v8;
    do
    {
      uint64_t v12 = 0;
      uint64_t v30 = v9;
      do
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(obj);
        }
        int v13 = *(void **)(*((void *)&v32 + 1) + 8 * v12);
        uint64_t v14 = objc_msgSend(v13, "globalName", v28);
        __int16 v15 = [v14 lowercaseString];
        v16 = [v3 objectForKeyedSubscript:v15];

        if (v16)
        {
          uint64_t v17 = [*(id *)(v11 + 3256) sharedWebUIConfig];
          if (!v17)
          {
            uint64_t v17 = [*(id *)(v11 + 3256) sharedConfig];
          }
          int v18 = [v17 OSLogObject];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            id v19 = v3;
            uint64_t v20 = v10;
            unint64_t v21 = v11;
            uint64_t v22 = objc_opt_class();
            uint64_t v23 = [(AMSUIWebJSProperties *)v29 context];
            v24 = [v23 logKey];
            v25 = [v13 globalName];
            *(_DWORD *)buf = v28;
            uint64_t v37 = v22;
            __int16 v38 = 2114;
            v39 = v24;
            __int16 v40 = 2114;
            v41 = v25;
            _os_log_impl(&dword_21C134000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Skipping plugin with duplicate global name: %{public}@", buf, 0x20u);

            unint64_t v11 = v21;
            uint64_t v10 = v20;
            id v3 = v19;
            uint64_t v9 = v30;
          }
        }
        else
        {
          uint64_t v17 = [v13 generateGlobalProperties];
          int v18 = [v13 globalName];
          uint64_t v26 = [v18 lowercaseString];
          [v3 setObject:v17 forKeyedSubscript:v26];
        }
        ++v12;
      }
      while (v9 != v12);
      uint64_t v9 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
    }
    while (v9);
  }

  return v3;
}

- (id)_processProperties
{
  v13[2] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F27E10];
  v12[0] = @"client";
  id v4 = [(AMSUIWebJSProperties *)self context];
  id v5 = [v4 clientInfo];
  id v6 = [(AMSUIWebJSProperties *)self _propertiesForClientInfo:v5];
  v12[1] = @"current";
  v13[0] = v6;
  uint64_t v7 = [MEMORY[0x263F27E08] currentProcess];
  long long v8 = [(AMSUIWebJSProperties *)self _propertiesForClientInfo:v7];
  v13[1] = v8;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  uint64_t v10 = [v3 promiseWithResult:v9];

  return v10;
}

- (id)_propertiesForClientInfo:(id)a3
{
  v21[5] = *MEMORY[0x263EF8340];
  v20[0] = @"accountMediaType";
  id v3 = a3;
  uint64_t v4 = [v3 accountMediaType];
  id v5 = (void *)v4;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  else {
    id v6 = &stru_26CC491D8;
  }
  v21[0] = v6;
  v20[1] = @"bundleIdentifier";
  uint64_t v7 = [v3 bundleIdentifier];
  long long v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = (__CFString *)v7;
  }
  else {
    uint64_t v9 = &stru_26CC491D8;
  }
  v21[1] = v9;
  v20[2] = @"bundleVersion";
  uint64_t v10 = [v3 clientVersion];
  unint64_t v11 = (void *)v10;
  if (v10) {
    uint64_t v12 = (__CFString *)v10;
  }
  else {
    uint64_t v12 = &stru_26CC491D8;
  }
  v21[2] = v12;
  v20[3] = @"executableName";
  uint64_t v13 = [v3 executableName];
  uint64_t v14 = (void *)v13;
  if (v13) {
    __int16 v15 = (__CFString *)v13;
  }
  else {
    __int16 v15 = &stru_26CC491D8;
  }
  v21[3] = v15;
  v20[4] = @"proxyApp";
  v16 = [v3 proxyAppBundleID];

  if (v16) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = &stru_26CC491D8;
  }
  v21[4] = v17;
  int v18 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:5];

  return v18;
}

- (id)_hexStringFromColor:(id)a3
{
  if (a3)
  {
    double v13 = 0.0;
    double v14 = 0.0;
    double v12 = 0.0;
    uint64_t v11 = 0;
    [a3 getRed:&v14 green:&v13 blue:&v12 alpha:&v11];
    float v4 = v14 * 255.0;
    unint64_t v5 = llroundf(v4);
    float v6 = v13 * 255.0;
    unint64_t v7 = llroundf(v6);
    float v8 = v12 * 255.0;
    objc_msgSend(NSString, "stringWithFormat:", @"#%02lX%02lX%02lX", v5, v7, llroundf(v8));
    uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v9 = &stru_26CC491D8;
  }
  return v9;
}

- (AMSUIWebJSPropertiesDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AMSUIWebJSPropertiesDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AMSUIWebClientContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  return (AMSUIWebClientContext *)WeakRetained;
}

- (void)setContext:(id)a3
{
}

- (NSDictionary)lastAccountsExport
{
  return self->_lastAccountsExport;
}

- (void)setLastAccountsExport:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAccountsExport, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_destroyWeak((id *)&self->_delegate);
}

@end